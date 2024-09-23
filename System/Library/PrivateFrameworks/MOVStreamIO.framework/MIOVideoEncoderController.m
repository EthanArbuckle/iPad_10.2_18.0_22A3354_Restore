@implementation MIOVideoEncoderController

- (MIOVideoEncoderController)initWithEncoderConfig:(id)a3 formtDescription:(opaqueCMFormatDescription *)a4 inProcessEncoding:(BOOL)a5 frameRate:(double)a6 aveHighPerfMode:(BOOL)a7 outputCallback:(void *)a8 delegate:(id)a9
{
  id v17;
  id v18;
  MIOVideoEncoderController *v19;
  MIOVideoEncoderController *v20;
  objc_super v22;

  v17 = a3;
  v18 = a9;
  v22.receiver = self;
  v22.super_class = (Class)MIOVideoEncoderController;
  v19 = -[MIOVideoEncoderController init](&v22, sel_init);
  v20 = v19;
  if (v19)
  {
    objc_storeWeak((id *)&v19->_delegate, v18);
    v20->_enableInProcessEncoding = a5;
    v20->_frameRate = a6;
    v20->_aveHighPerfMode = a7;
    objc_storeStrong((id *)&v20->_config, a3);
    v20->_formatDesc = a4;
    CFRetain(a4);
    v20->_callbackFunc = a8;
  }

  return v20;
}

- (void)dealloc
{
  opaqueCMFormatDescription *formatDesc;
  objc_super v4;

  formatDesc = self->_formatDesc;
  if (formatDesc)
    CFRelease(formatDesc);
  v4.receiver = self;
  v4.super_class = (Class)MIOVideoEncoderController;
  -[MIOVideoEncoderController dealloc](&v4, sel_dealloc);
}

- (unsigned)codecType
{
  MOVStreamEncoderConfig *config;
  id WeakRetained;
  unsigned int v6;

  config = self->_config;
  if (config)
    return -[MOVStreamEncoderConfig codecType](config, "codecType");
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v6 = objc_msgSend(WeakRetained, "codecTypeOverride");

  if (v6)
    return v6;
  else
    return 1752589105;
}

- (id)encoderSpecification
{
  void *v2;
  id WeakRetained;
  void *v5;
  uint64_t v6;
  _QWORD v7[2];
  _QWORD v8[3];

  v8[2] = *MEMORY[0x24BDAC8D0];
  if (self->_config)
  {
    -[MOVStreamEncoderConfig encoderSpecification](self->_config, "encoderSpecification");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    return v2;
  }
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "overrideVideoEncoderSpecification");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
  {
    v6 = *MEMORY[0x24BDF99C0];
    v7[0] = *MEMORY[0x24BDF99B8];
    v7[1] = v6;
    v8[0] = MEMORY[0x24BDBD1C8];
    v8[1] = MEMORY[0x24BDBD1C8];
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v8, v7, 2);
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    return v2;
  }
  return v5;
}

- (int)applyDefaultSessionProperties
{
  int result;
  FourCharCode MediaSubType;
  const __CFString *v5;

  result = VTSessionSetProperty(self->_compressionSession, (CFStringRef)*MEMORY[0x24BDF9338], &unk_24CA5BDB8);
  if (!result)
  {
    result = VTSessionSetProperty(self->_compressionSession, (CFStringRef)*MEMORY[0x24BDF91F8], (CFTypeRef)*MEMORY[0x24BDBD268]);
    if (!result)
    {
      result = VTSessionSetProperty(self->_compressionSession, (CFStringRef)*MEMORY[0x24BDF9260], (CFTypeRef)objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", self->_frameRate));
      if (!result)
      {
        result = VTSessionSetProperty(self->_compressionSession, (CFStringRef)*MEMORY[0x24BDF9348], (CFTypeRef)*MEMORY[0x24BDBD270]);
        if (!result)
        {
          MediaSubType = CMFormatDescriptionGetMediaSubType(self->_formatDesc);
          v5 = CFSTR("HEVC_Monochrome10_AutoLevel");
          if (MediaSubType != 1278226742 && MediaSubType != 1278226736)
          {
            if (MediaSubType == 1278226488)
              v5 = CFSTR("HEVC_Monochrome_AutoLevel");
            else
              v5 = CFSTR("HEVC_Main_AutoLevel");
          }
          return VTSessionSetProperty(self->_compressionSession, (CFStringRef)*MEMORY[0x24BDF9330], v5);
        }
      }
    }
  }
  return result;
}

- (BOOL)openEncoderWithContext:(id)a3 error:(id *)a4
{
  id v6;
  unint64_t Dimensions;
  int32_t v8;
  unint64_t v9;
  const __CFDictionary *v10;
  CMVideoCodecType v11;
  NSObject *v12;
  uint64_t v13;
  void *v14;
  MOVStreamEncoderConfig *config;
  NSObject *v16;
  BOOL v17;
  id WeakRetained;
  char v20;
  uint64_t v21;
  id v22;
  NSObject *v23;
  _BOOL4 frameReorderingEnabled;
  uint64_t v25;
  uint64_t v26;
  void *outputCallbackRefCon;
  void *v28;
  OpaqueVTCompressionSession **p_compressionSession;
  CFTypeRef propertyValueOut;
  uint8_t buf[4];
  void *v32;
  uint64_t v33;
  _QWORD v34[2];

  v34[1] = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  Dimensions = (unint64_t)CMVideoFormatDescriptionGetDimensions(self->_formatDesc);
  v8 = Dimensions;
  v9 = HIDWORD(Dimensions);
  v10 = -[MIOVideoEncoderController encoderSpecification](self, "encoderSpecification");
  v11 = -[MIOVideoEncoderController codecType](self, "codecType");
  if (self->_enableInProcessEncoding)
  {
    +[MIOLog defaultLog](MIOLog, "defaultLog");
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_210675000, v12, OS_LOG_TYPE_INFO, "VTCompressionSession: Enabling kVTCompressionSessionOption_AllowClientProcessEncode", buf, 2u);
    }

    v33 = *MEMORY[0x24BDF93B8];
    v34[0] = MEMORY[0x24BDBD1C8];
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v34, &v33, 1);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    p_compressionSession = &self->_compressionSession;
    outputCallbackRefCon = v6;
    v13 = VTCompressionSessionCreateWithOptions();

    if (self->_enableInProcessEncoding)
    {
      if ((_DWORD)v13)
        goto LABEL_6;
LABEL_9:
      config = self->_config;
      if (config)
      {
        if (!-[MOVStreamEncoderConfig applySessionProperties:](config, "applySessionProperties:", self->_compressionSession))
        {
          objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Error VTCompressionSession set properties failed."));
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          if (a4)
            goto LABEL_7;
          +[MIOLog defaultLog](MIOLog, "defaultLog");
          v16 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412290;
            v32 = v14;
LABEL_16:
            _os_log_impl(&dword_210675000, v16, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);
          }
LABEL_17:

          goto LABEL_18;
        }
      }
      else
      {
        WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
        v20 = objc_msgSend(WeakRetained, "configureSessionOverride:", self->_compressionSession);

        if ((v20 & 1) == 0)
        {
          v21 = -[MIOVideoEncoderController applyDefaultSessionProperties](self, "applyDefaultSessionProperties");
          if ((_DWORD)v21)
          {
            objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Error applying default settings errNo: %d"), v21);
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            if (a4)
              goto LABEL_7;
            +[MIOLog defaultLog](MIOLog, "defaultLog");
            v16 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138412290;
              v32 = v14;
              goto LABEL_16;
            }
            goto LABEL_17;
          }
        }
      }
      propertyValueOut = (CFTypeRef)*MEMORY[0x24BDBD268];
      if (VTSessionCopyProperty(self->_compressionSession, (CFStringRef)*MEMORY[0x24BDF91F8], (CFAllocatorRef)*MEMORY[0x24BDBD240], &propertyValueOut))
      {
        v22 = (id)objc_msgSend(MEMORY[0x24BDD1540], "writerWarningWithMessage:code:", CFSTR("Cannot check AllowFrameReordering status of encoding session. Assuming disabled."), 0);
      }
      else
      {
        self->_frameReorderingEnabled = propertyValueOut == (CFTypeRef)*MEMORY[0x24BDBD270];
        if (+[MIOLog debugEnabled](MIOLog, "debugEnabled", outputCallbackRefCon, v28, p_compressionSession))
        {
          +[MIOLog defaultLog](MIOLog, "defaultLog");
          v23 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
          {
            frameReorderingEnabled = self->_frameReorderingEnabled;
            *(_DWORD *)buf = 67109120;
            LODWORD(v32) = frameReorderingEnabled;
            _os_log_impl(&dword_210675000, v23, OS_LOG_TYPE_DEBUG, "AllowFrameReordering: %d", buf, 8u);
          }

        }
        CFRelease(propertyValueOut);
      }
      v25 = -[MIOVideoEncoderController propagateColorAttachments](self, "propagateColorAttachments", outputCallbackRefCon);
      if ((_DWORD)v25)
      {
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Error VTCompressionSessionCreate errNo: %d"), v25);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        if (a4)
          goto LABEL_7;
        +[MIOLog defaultLog](MIOLog, "defaultLog");
        v16 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          v32 = v14;
          goto LABEL_16;
        }
      }
      else
      {
        if (!self->_aveHighPerfMode)
        {
          v17 = 1;
          goto LABEL_19;
        }
        v26 = -[MIOVideoEncoderController enableAVEHighPerformanceProfile](self, "enableAVEHighPerformanceProfile");
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Error enabling AVE High Performance Mode errNo: %d"), v26);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        if (a4)
          goto LABEL_7;
        +[MIOLog defaultLog](MIOLog, "defaultLog");
        v16 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          v32 = v14;
          goto LABEL_16;
        }
      }
      goto LABEL_17;
    }
  }
  v13 = VTCompressionSessionCreate((CFAllocatorRef)*MEMORY[0x24BDBD240], v8, v9, v11, v10, 0, 0, (VTCompressionOutputCallback)self->_callbackFunc, v6, &self->_compressionSession);
  if (!(_DWORD)v13)
    goto LABEL_9;
LABEL_6:
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Error VTCompressionSessionCreate errNo: %d"), v13, v28, p_compressionSession);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (!a4)
  {
    +[MIOLog defaultLog](MIOLog, "defaultLog");
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v32 = v14;
      goto LABEL_16;
    }
    goto LABEL_17;
  }
LABEL_7:
  objc_msgSend(MEMORY[0x24BDD1540], "internalErrorWithMessage:code:", v14, 14, outputCallbackRefCon);
  *a4 = (id)objc_claimAutoreleasedReturnValue();
LABEL_18:

  v17 = 0;
LABEL_19:

  return v17;
}

- (int)enableAVEHighPerformanceProfile
{
  const void *v3;
  OSStatus v4;
  OSStatus v5;
  NSObject *v6;
  const char *v7;
  uint8_t *v8;
  OSStatus v9;
  __int16 v11;
  __int16 v12;
  __int16 v13;

  v3 = (const void *)*MEMORY[0x24BDBD268];
  v4 = VTSessionSetProperty(self->_compressionSession, (CFStringRef)*MEMORY[0x24BDF9348], (CFTypeRef)*MEMORY[0x24BDBD268]);
  if (v4)
  {
    v5 = v4;
    +[MIOLog defaultLog](MIOLog, "defaultLog");
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      v13 = 0;
      v7 = "Setting kVTCompressionPropertyKey_RealTime failed.";
      v8 = (uint8_t *)&v13;
LABEL_10:
      _os_log_impl(&dword_210675000, v6, OS_LOG_TYPE_ERROR, v7, v8, 2u);
      goto LABEL_11;
    }
    goto LABEL_11;
  }
  v9 = VTSessionSetProperty(self->_compressionSession, (CFStringRef)*MEMORY[0x24BDF92D8], v3);
  if (v9)
  {
    v5 = v9;
    +[MIOLog defaultLog](MIOLog, "defaultLog");
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      v12 = 0;
      v7 = "Setting kVTCompressionPropertyKey_MaximizePowerEfficiency failed.";
      v8 = (uint8_t *)&v12;
      goto LABEL_10;
    }
LABEL_11:

    return v5;
  }
  v5 = VTSessionSetProperty(self->_compressionSession, (CFStringRef)*MEMORY[0x24BDF91F8], v3);
  if (v5)
  {
    +[MIOLog defaultLog](MIOLog, "defaultLog");
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      v11 = 0;
      v7 = "Setting kVTCompressionPropertyKey_AllowFrameReordering failed.";
      v8 = (uint8_t *)&v11;
      goto LABEL_10;
    }
    goto LABEL_11;
  }
  return v5;
}

- (int)propagateColorAttachments
{
  const __CFDictionary *Extensions;
  const __CFDictionary *v4;
  const void *Value;
  const void *v6;
  const void *v7;
  const void *v8;
  const void *v9;
  const void *v10;

  Extensions = CMFormatDescriptionGetExtensions(self->_formatDesc);
  if (Extensions)
  {
    v4 = Extensions;
    Value = CFDictionaryGetValue(Extensions, (const void *)*MEMORY[0x24BDC5570]);
    if (Value)
      VTSessionSetProperty(self->_compressionSession, (CFStringRef)*MEMORY[0x24BDF93A0], Value);
    v6 = CFDictionaryGetValue(v4, (const void *)*MEMORY[0x24BDC5490]);
    if (v6)
      VTSessionSetProperty(self->_compressionSession, (CFStringRef)*MEMORY[0x24BDF9228], v6);
    v7 = CFDictionaryGetValue(v4, (const void *)*MEMORY[0x24BDC5510]);
    if (v7)
    {
      v8 = v7;
      VTSessionSetProperty(self->_compressionSession, (CFStringRef)*MEMORY[0x24BDF9368], v7);
      if (CFEqual(v8, (CFTypeRef)*MEMORY[0x24BDC5560]))
      {
        v9 = CFDictionaryGetValue(v4, (const void *)*MEMORY[0x24BDC54F0]);
        if (v9)
          VTSessionSetProperty(self->_compressionSession, (CFStringRef)*MEMORY[0x24BDF9270], v9);
      }
    }
    v10 = CFDictionaryGetValue(v4, (const void *)*MEMORY[0x24BDC0B70]);
    if (v10)
      VTSessionSetProperty(self->_compressionSession, (CFStringRef)*MEMORY[0x24BDF9288], v10);
  }
  return 0;
}

- (BOOL)encodeFrame:(__CVBuffer *)a3 pts:(id *)a4 properties:(__CFDictionary *)a5 context:(void *)a6 error:(id *)a7
{
  OpaqueVTCompressionSession *compressionSession;
  uint64_t v9;
  void *v10;
  NSObject *v11;
  CMTime duration;
  VTEncodeInfoFlags infoFlagsOut;
  CMTime presentationTimeStamp;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  infoFlagsOut = 0;
  compressionSession = self->_compressionSession;
  presentationTimeStamp = *(CMTime *)a4;
  duration = *(CMTime *)*(_QWORD *)&MEMORY[0x24BDC0D38];
  v9 = VTCompressionSessionEncodeFrame(compressionSession, a3, &presentationTimeStamp, &duration, a5, a6, &infoFlagsOut);
  if ((_DWORD)v9)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Error VTCompressionSessionEncodeFrame errNo: %d infoFlags: %d"), v9, infoFlagsOut);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (a7)
    {
      objc_msgSend(MEMORY[0x24BDD1540], "internalErrorWithMessage:code:", v10, 14);
      *a7 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      +[MIOLog defaultLog](MIOLog, "defaultLog");
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        LODWORD(presentationTimeStamp.value) = 138412290;
        *(CMTimeValue *)((char *)&presentationTimeStamp.value + 4) = (CMTimeValue)v10;
        _os_log_impl(&dword_210675000, v11, OS_LOG_TYPE_ERROR, "%@", (uint8_t *)&presentationTimeStamp, 0xCu);
      }

    }
  }
  return (_DWORD)v9 == 0;
}

- (BOOL)closeEncoderError:(id *)a3
{
  OpaqueVTCompressionSession *compressionSession;
  uint64_t v6;
  void *v7;
  id v8;
  BOOL result;
  NSObject *v10;
  NSObject *v11;
  CMTime completeUntilPresentationTimeStamp;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  compressionSession = self->_compressionSession;
  if (compressionSession)
  {
    completeUntilPresentationTimeStamp = *(CMTime *)*(_QWORD *)&MEMORY[0x24BDC0D38];
    v6 = VTCompressionSessionCompleteFrames(compressionSession, &completeUntilPresentationTimeStamp);
    if (!(_DWORD)v6)
    {
      CFRelease(self->_compressionSession);
      self->_compressionSession = 0;
      result = 1;
      self->_closed = 1;
      return result;
    }
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Error VTCompressionSessionCompleteFrames errNo: %d"), v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (a3)
    {
      objc_msgSend(MEMORY[0x24BDD1540], "internalErrorWithMessage:code:", v7, 14);
      *a3 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      +[MIOLog defaultLog](MIOLog, "defaultLog");
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        LODWORD(completeUntilPresentationTimeStamp.value) = 138412290;
        *(CMTimeValue *)((char *)&completeUntilPresentationTimeStamp.value + 4) = (CMTimeValue)v7;
        _os_log_impl(&dword_210675000, v10, OS_LOG_TYPE_ERROR, "%@", (uint8_t *)&completeUntilPresentationTimeStamp, 0xCu);
      }

    }
  }
  else
  {
    if (a3)
    {
      objc_msgSend(MEMORY[0x24BDD1540], "internalErrorWithMessage:code:", CFSTR("Error closeEncoder: no VTCompressionSession"), 14);
      v8 = (id)objc_claimAutoreleasedReturnValue();
      result = 0;
      *a3 = v8;
      return result;
    }
    +[MIOLog defaultLog](MIOLog, "defaultLog");
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      LODWORD(completeUntilPresentationTimeStamp.value) = 138412290;
      *(CMTimeValue *)((char *)&completeUntilPresentationTimeStamp.value + 4) = (CMTimeValue)CFSTR("Error closeEncoder: no VTCompressionSession");
      _os_log_impl(&dword_210675000, v11, OS_LOG_TYPE_ERROR, "%@", (uint8_t *)&completeUntilPresentationTimeStamp, 0xCu);
    }

  }
  return 0;
}

- (BOOL)frameReorderingEnabled
{
  return self->_frameReorderingEnabled;
}

- (BOOL)closed
{
  return self->_closed;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_config, 0);
}

@end
