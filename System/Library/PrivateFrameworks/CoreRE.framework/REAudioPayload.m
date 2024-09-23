@implementation REAudioPayload

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)dealloc
{
  mach_port_name_t taskToken;
  re *v4;
  mach_error_t v5;
  NSObject *v6;
  objc_super v7;
  uint8_t buf[4];
  char *v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  taskToken = self->_taskToken;
  if (taskToken + 1 >= 2)
  {
    v4 = (re *)mach_port_deallocate(*MEMORY[0x24BDAEC58], taskToken);
    v5 = (int)v4;
    if ((_DWORD)v4)
    {
      v6 = (id)*re::audioLogObjects(v4);
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315138;
        v9 = mach_error_string(v5);
        _os_log_error_impl(&dword_224FE9000, v6, OS_LOG_TYPE_ERROR, "[CoreRE] [AudioFileAsset] Failed to deallocate mach port, with KERN error code: %s", buf, 0xCu);
      }

    }
  }
  v7.receiver = self;
  v7.super_class = (Class)REAudioPayload;
  -[REAudioPayload dealloc](&v7, sel_dealloc);
}

- (REAudioPayload)initWithBuffer:(id)a3 format:(id)a4 length:(unsigned int)a5 inputMode:(unsigned __int8)a6 referenceLevel:(float)a7 loopCount:(int)a8 mixGroupName:(id)a9 streaming:(BOOL)a10 normalizationMode:(int)a11 calibrationMode:(int)a12 calibrationLevel:(double)a13 layoutTag:(unsigned int)a14 taskToken:(unsigned int)a15 audioAssetID:(unint64_t)a16
{
  id v24;
  id v25;
  id v26;
  REAudioPayload *v27;
  REAudioPayload *v28;
  uint64_t v29;
  NSNumber *length;
  objc_super v33;

  v24 = a3;
  v25 = a4;
  v26 = a9;
  v33.receiver = self;
  v33.super_class = (Class)REAudioPayload;
  v27 = -[RESharedResourcePayload init](&v33, sel_init);
  v28 = v27;
  if (v27)
  {
    objc_storeStrong((id *)&v27->_pcmBuffer, a3);
    objc_storeStrong((id *)&v28->_format, a4);
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", a5);
    v29 = objc_claimAutoreleasedReturnValue();
    length = v28->_length;
    v28->_length = (NSNumber *)v29;

    v28->_inputMode = a6;
    v28->_referenceLevel = a7;
    v28->_loopCount = a8;
    objc_storeStrong((id *)&v28->_mixGroupName, a9);
    v28->_streaming = a10;
    v28->_normalizationMode = a11;
    v28->_calibrationMode = a12;
    v28->_calibrationLevel = a13;
    v28->_layoutTag = a14;
    v28->_taskToken = a15;
    v28->_targetLUFS = -12.0;
    if (a15 + 1 >= 2)
      mach_port_mod_refs(*MEMORY[0x24BDAEC58], a15, 0, 1);
    v28->_audioAssetID = a16;
  }

  return v28;
}

- (REAudioPayload)initWithFileBuffer:(id)a3 format:(id)a4 length:(unsigned int)a5 bufferSize:(unint64_t)a6 inputMode:(unsigned __int8)a7 referenceLevel:(float)a8 loopCount:(int)a9 mixGroupName:(id)a10 streaming:(BOOL)a11 normalizationMode:(int)a12 calibrationMode:(int)a13 calibrationLevel:(double)a14 layoutTag:(unsigned int)a15 taskToken:(unsigned int)a16 audioAssetID:(unint64_t)a17
{
  id v25;
  id v26;
  id v27;
  REAudioPayload *v28;
  REAudioPayload *v29;
  uint64_t v30;
  NSNumber *length;
  uint64_t v32;
  NSNumber *bufferSize;
  objc_super v36;

  v25 = a3;
  v26 = a4;
  v27 = a10;
  v36.receiver = self;
  v36.super_class = (Class)REAudioPayload;
  v28 = -[RESharedResourcePayload init](&v36, sel_init);
  v29 = v28;
  if (v28)
  {
    objc_storeStrong((id *)&v28->_fileBuffer, a3);
    objc_storeStrong((id *)&v29->_format, a4);
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", a5);
    v30 = objc_claimAutoreleasedReturnValue();
    length = v29->_length;
    v29->_length = (NSNumber *)v30;

    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", a6);
    v32 = objc_claimAutoreleasedReturnValue();
    bufferSize = v29->_bufferSize;
    v29->_bufferSize = (NSNumber *)v32;

    v29->_inputMode = a7;
    v29->_referenceLevel = a8;
    v29->_loopCount = a9;
    objc_storeStrong((id *)&v29->_mixGroupName, a10);
    v29->_streaming = a11;
    v29->_normalizationMode = a12;
    v29->_calibrationMode = a13;
    v29->_calibrationLevel = a14;
    v29->_layoutTag = a15;
    v29->_taskToken = a16;
    v29->_targetLUFS = -12.0;
    if (a16 + 1 >= 2)
      mach_port_mod_refs(*MEMORY[0x24BDAEC58], a16, 0, 1);
    v29->_audioAssetID = a17;
  }

  return v29;
}

- (REAudioPayload)initWithFilePath:(id)a3 inputMode:(unsigned __int8)a4 referenceLevel:(float)a5 loopCount:(int)a6 mixGroupName:(id)a7 streaming:(BOOL)a8 normalizationMode:(int)a9 calibrationMode:(int)a10 calibrationLevel:(double)a11 layoutTag:(unsigned int)a12 taskToken:(unsigned int)a13 targetLUFS:(double)a14 audioAssetID:(unint64_t)a15
{
  id v25;
  id v26;
  REAudioPayload *v27;
  REAudioPayload *v28;
  objc_super v30;

  v25 = a3;
  v26 = a7;
  v30.receiver = self;
  v30.super_class = (Class)REAudioPayload;
  v27 = -[RESharedResourcePayload init](&v30, sel_init);
  v28 = v27;
  if (v27)
  {
    objc_storeStrong((id *)&v27->_filePath, a3);
    v28->_inputMode = a4;
    v28->_referenceLevel = a5;
    v28->_loopCount = a6;
    objc_storeStrong((id *)&v28->_mixGroupName, a7);
    v28->_streaming = a8;
    v28->_normalizationMode = a9;
    v28->_calibrationMode = a10;
    v28->_calibrationLevel = a11;
    v28->_layoutTag = a12;
    v28->_taskToken = a13;
    v28->_targetLUFS = a14;
    if (a13 + 1 >= 2)
      mach_port_mod_refs(*MEMORY[0x24BDAEC58], a13, 0, 1);
    v28->_audioAssetID = a15;
  }

  return v28;
}

- (REAudioPayload)initWithCoder:(id)a3
{
  id v4;
  REAudioPayload *v5;
  uint64_t v6;
  OS_xpc_object *pcmBuffer;
  uint64_t v8;
  AVAudioFormat *format;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  REAudioPayload *v15;
  uint64_t v16;
  OS_xpc_object *fileBuffer;
  uint64_t v18;
  AVAudioFormat *v19;
  uint64_t v20;
  NSNumber *length;
  void *v22;
  float v23;
  uint64_t v24;
  NSString *mixGroupName;
  double v26;
  double v27;
  void *v28;
  unsigned int v29;
  NSObject *v30;
  void *v32;
  void *v33;
  void *v34;
  __int16 v35;
  objc_super v36;
  uint64_t v37;
  const __CFString *v38;
  uint64_t v39;
  _QWORD v40[2];

  v40[1] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v36.receiver = self;
    v36.super_class = (Class)REAudioPayload;
    v5 = -[RESharedResourcePayload initWithCoder:](&v36, sel_initWithCoder_, v4);
    if (v5)
    {
      if (objc_msgSend(v4, "containsValueForKey:", CFSTR("pcmBuffer")))
      {
        objc_msgSend(v4, "decodeXPCObjectForKey:", CFSTR("pcmBuffer"));
        v6 = objc_claimAutoreleasedReturnValue();
        pcmBuffer = v5->_pcmBuffer;
        v5->_pcmBuffer = (OS_xpc_object *)v6;

        objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("format"));
        v8 = objc_claimAutoreleasedReturnValue();
        format = v5->_format;
        v5->_format = (AVAudioFormat *)v8;

        objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("length"));
        v10 = objc_claimAutoreleasedReturnValue();
        v11 = 72;
      }
      else if (objc_msgSend(v4, "containsValueForKey:", CFSTR("fileBuffer")))
      {
        objc_msgSend(v4, "decodeXPCObjectForKey:", CFSTR("fileBuffer"));
        v16 = objc_claimAutoreleasedReturnValue();
        fileBuffer = v5->_fileBuffer;
        v5->_fileBuffer = (OS_xpc_object *)v16;

        objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("format"));
        v18 = objc_claimAutoreleasedReturnValue();
        v19 = v5->_format;
        v5->_format = (AVAudioFormat *)v18;

        objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("length"));
        v20 = objc_claimAutoreleasedReturnValue();
        length = v5->_length;
        v5->_length = (NSNumber *)v20;

        objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("bufferSize"));
        v10 = objc_claimAutoreleasedReturnValue();
        v11 = 80;
      }
      else
      {
        if (!objc_msgSend(v4, "containsValueForKey:", CFSTR("filePath")))
        {
          v32 = (void *)MEMORY[0x24BDD1540];
          v37 = *MEMORY[0x24BDD0BA0];
          v38 = CFSTR("REAudioPayload requires either buffer or filePath");
          objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v38, &v37, 1);
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v32, "errorWithDomain:code:userInfo:", *MEMORY[0x24BDD0B88], 4864, v33);
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "failWithError:", v34);

          v15 = 0;
          self = v5;
          goto LABEL_16;
        }
        objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("filePath"));
        v10 = objc_claimAutoreleasedReturnValue();
        v11 = 88;
      }
      v22 = *(Class *)((char *)&v5->super.super.isa + v11);
      *(Class *)((char *)&v5->super.super.isa + v11) = (Class)v10;

      v5->_inputMode = objc_msgSend(v4, "decodeIntForKey:", CFSTR("inputMode"));
      objc_msgSend(v4, "decodeFloatForKey:", CFSTR("referenceLevel"));
      v5->_referenceLevel = v23;
      v5->_loopCount = objc_msgSend(v4, "decodeIntForKey:", CFSTR("loopCount"));
      objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("mixGroupName"));
      v24 = objc_claimAutoreleasedReturnValue();
      mixGroupName = v5->_mixGroupName;
      v5->_mixGroupName = (NSString *)v24;

      v5->_streaming = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("streaming"));
      v5->_normalizationMode = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("normalizationMode"));
      v5->_calibrationMode = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("calibrationMode"));
      objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("calibrationLevel"));
      v5->_calibrationLevel = v26;
      v5->_layoutTag = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("layoutTag"));
      objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("targetLUFS"));
      v5->_targetLUFS = v27;
      v5->_audioAssetID = objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("audioAssetID"));
      objc_msgSend(v4, "decodeXPCObjectOfType:forKey:", MEMORY[0x24BDACFD8], CFSTR("taskToken"));
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      if (v28)
      {
        v29 = xpc_mach_send_copy_right();
      }
      else
      {
        v30 = *re::audioLogObjects(0);
        v29 = os_log_type_enabled(v30, OS_LOG_TYPE_ERROR);
        if (v29)
        {
          v35 = 0;
          _os_log_error_impl(&dword_224FE9000, v30, OS_LOG_TYPE_ERROR, "[CoreRE] [REAudioPayload] Failed to decode xpc_object for taskToken. Setting to MACH_PORT_NULL", (uint8_t *)&v35, 2u);
          v29 = 0;
        }
      }
      v5->_taskToken = v29;

    }
    self = v5;
    v15 = self;
  }
  else
  {
    v12 = (void *)MEMORY[0x24BDD1540];
    v39 = *MEMORY[0x24BDD0BA0];
    v40[0] = CFSTR("REAudioPayload requires an NSXPCCoder");
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v40, &v39, 1);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "errorWithDomain:code:userInfo:", *MEMORY[0x24BDD0B88], 4864, v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "failWithError:", v14);

    v15 = 0;
  }
LABEL_16:

  return v15;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  OS_xpc_object *pcmBuffer;
  int *v6;
  const __CFString *v7;
  void *v8;
  void *v9;
  void *v10;
  OS_xpc_object *fileBuffer;
  double v12;
  NSString *filePath;
  NSObject *v14;
  void *v15;
  void *v16;
  uint8_t v17[8];
  uint64_t v18;
  const __CFString *v19;
  uint64_t v20;
  _QWORD v21[2];

  v21[1] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v8 = (void *)MEMORY[0x24BDD1540];
    v20 = *MEMORY[0x24BDD0BA0];
    v21[0] = CFSTR("REAudioPayload requires an NSXPCCoder");
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v21, &v20, 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "errorWithDomain:code:userInfo:", *MEMORY[0x24BDD0B88], 4864, v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "failWithError:", v10);

    goto LABEL_5;
  }
  pcmBuffer = self->_pcmBuffer;
  if (pcmBuffer)
  {
    objc_msgSend(v4, "encodeXPCObject:forKey:", pcmBuffer, CFSTR("pcmBuffer"));
    v6 = &OBJC_IVAR___REAudioPayload__length;
    objc_msgSend(v4, "encodeObject:forKey:", self->_format, CFSTR("format"));
    v7 = CFSTR("length");
  }
  else
  {
    fileBuffer = self->_fileBuffer;
    if (!fileBuffer)
    {
      filePath = self->_filePath;
      if (!filePath)
      {
        v15 = (void *)MEMORY[0x24BDD1540];
        v18 = *MEMORY[0x24BDD0BA0];
        v19 = CFSTR("REAudioPayload requires either non-nil buffer of filePath");
        objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v19, &v18, 1);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "errorWithDomain:code:userInfo:", *MEMORY[0x24BDD0B88], 4864, v9);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "failWithError:", v16);

        goto LABEL_5;
      }
      objc_msgSend(v4, "encodeObject:forKey:", filePath, CFSTR("filePath"));
      goto LABEL_9;
    }
    objc_msgSend(v4, "encodeXPCObject:forKey:", fileBuffer, CFSTR("fileBuffer"));
    objc_msgSend(v4, "encodeObject:forKey:", self->_format, CFSTR("format"));
    v6 = &OBJC_IVAR___REAudioPayload__bufferSize;
    objc_msgSend(v4, "encodeObject:forKey:", self->_length, CFSTR("length"));
    v7 = CFSTR("bufferSize");
  }
  objc_msgSend(v4, "encodeObject:forKey:", *(Class *)((char *)&self->super.super.isa + *v6), v7);
LABEL_9:
  objc_msgSend(v4, "encodeInt:forKey:", self->_inputMode, CFSTR("inputMode"));
  *(float *)&v12 = self->_referenceLevel;
  objc_msgSend(v4, "encodeFloat:forKey:", CFSTR("referenceLevel"), v12);
  objc_msgSend(v4, "encodeInt:forKey:", self->_loopCount, CFSTR("loopCount"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_mixGroupName, CFSTR("mixGroupName"));
  objc_msgSend(v4, "encodeBool:forKey:", self->_streaming, CFSTR("streaming"));
  objc_msgSend(v4, "encodeInteger:forKey:", self->_normalizationMode, CFSTR("normalizationMode"));
  objc_msgSend(v4, "encodeInteger:forKey:", self->_calibrationMode, CFSTR("calibrationMode"));
  objc_msgSend(v4, "encodeDouble:forKey:", CFSTR("calibrationLevel"), self->_calibrationLevel);
  objc_msgSend(v4, "encodeInteger:forKey:", self->_layoutTag, CFSTR("layoutTag"));
  objc_msgSend(v4, "encodeDouble:forKey:", CFSTR("targetLUFS"), self->_targetLUFS);
  objc_msgSend(v4, "encodeInteger:forKey:", self->_audioAssetID, CFSTR("audioAssetID"));
  if (self->_taskToken + 1 < 2)
    goto LABEL_10;
  v9 = (void *)xpc_mach_send_create();
  if (v9)
  {
    objc_msgSend(v4, "encodeXPCObject:forKey:", v9, CFSTR("taskToken"));
  }
  else
  {
    v14 = *re::audioLogObjects(0);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v17 = 0;
      _os_log_error_impl(&dword_224FE9000, v14, OS_LOG_TYPE_ERROR, "[CoreRE] [REAudioPayload] Failed to encode xpc_object for taskToken.", v17, 2u);
    }
    v9 = 0;
  }
LABEL_5:

LABEL_10:
}

- (OS_xpc_object)pcmBuffer
{
  return self->_pcmBuffer;
}

- (OS_xpc_object)fileBuffer
{
  return self->_fileBuffer;
}

- (AVAudioFormat)format
{
  return self->_format;
}

- (NSNumber)length
{
  return self->_length;
}

- (NSNumber)bufferSize
{
  return self->_bufferSize;
}

- (NSString)filePath
{
  return self->_filePath;
}

- (unsigned)inputMode
{
  return self->_inputMode;
}

- (float)referenceLevel
{
  return self->_referenceLevel;
}

- (int)loopCount
{
  return self->_loopCount;
}

- (NSString)mixGroupName
{
  return self->_mixGroupName;
}

- (BOOL)streaming
{
  return self->_streaming;
}

- (int)normalizationMode
{
  return self->_normalizationMode;
}

- (int)calibrationMode
{
  return self->_calibrationMode;
}

- (double)calibrationLevel
{
  return self->_calibrationLevel;
}

- (unsigned)layoutTag
{
  return self->_layoutTag;
}

- (unsigned)taskToken
{
  return self->_taskToken;
}

- (double)targetLUFS
{
  return self->_targetLUFS;
}

- (unint64_t)audioAssetID
{
  return self->_audioAssetID;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mixGroupName, 0);
  objc_storeStrong((id *)&self->_filePath, 0);
  objc_storeStrong((id *)&self->_bufferSize, 0);
  objc_storeStrong((id *)&self->_length, 0);
  objc_storeStrong((id *)&self->_format, 0);
  objc_storeStrong((id *)&self->_fileBuffer, 0);
  objc_storeStrong((id *)&self->_pcmBuffer, 0);
}

@end
