@implementation CMContinuityCaptureStreamFormat

- (CMContinuityCaptureStreamFormat)initWithName:(id)a3 width:(unint64_t)a4 height:(unint64_t)a5 pixelFormat:(unsigned int)a6 minFrameRate:(unsigned int)a7 maxFrameRate:(unsigned int)a8 entity:(int64_t)a9 minimumSupportedVersion:(id *)a10
{
  id v17;
  CMContinuityCaptureStreamFormat *v18;
  uint64_t v19;
  __int128 v20;
  uint64_t v21;
  const __CFDictionary *v22;
  OSStatus v23;
  void *v24;
  CMContinuityCaptureStreamFormat *v25;
  NSObject *v27;
  CMVideoFormatDescriptionRef v28;
  objc_super v29;
  uint64_t v30;
  _QWORD v31[2];

  v31[1] = *MEMORY[0x24BDAC8D0];
  v17 = a3;
  v29.receiver = self;
  v29.super_class = (Class)CMContinuityCaptureStreamFormat;
  v18 = -[CMContinuityCaptureStreamFormat init](&v29, sel_init);
  v19 = (uint64_t)v18;
  v28 = 0;
  if (v18)
  {
    v18->_entity = a9;
    objc_storeStrong((id *)&v18->_name, a3);
    *(_QWORD *)(v19 + 40) = a4;
    *(_QWORD *)(v19 + 48) = a5;
    *(_DWORD *)(v19 + 16) = a6;
    *(_DWORD *)(v19 + 20) = a7;
    *(_DWORD *)(v19 + 24) = a8;
    v20 = *(_OWORD *)&a10->var0;
    *(_QWORD *)(v19 + 80) = a10->var2;
    *(_OWORD *)(v19 + 64) = v20;
    v21 = *(_QWORD *)(v19 + 32);
    v30 = *MEMORY[0x24BDC0B58];
    v31[0] = v21;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v31, &v30, 1);
    v22 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();
    v23 = CMVideoFormatDescriptionCreate(0, *(_DWORD *)(v19 + 16), *(_DWORD *)(v19 + 40), *(_DWORD *)(v19 + 48), v22, &v28);
    if (v23 || !v28)
    {
      CMContinuityCaptureLog(2);
      v27 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
        -[CMContinuityCaptureStreamFormat initWithName:width:height:pixelFormat:minFrameRate:maxFrameRate:entity:minimumSupportedVersion:].cold.1(v19, v23, v27);

      v25 = 0;
    }
    else
    {
      v24 = *(void **)(v19 + 8);
      *(_QWORD *)(v19 + 8) = v28;

      v25 = (CMContinuityCaptureStreamFormat *)(id)v19;
    }

  }
  else
  {
    v25 = 0;
  }

  return v25;
}

- (CMContinuityCaptureStreamFormat)initWithCoder:(id)a3
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  CMContinuityCaptureStreamFormat *v13;
  uint64_t v15;
  _QWORD v17[3];

  v3 = a3;
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("name"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v3, "decodeInt64ForKey:", CFSTR("entity"));
  v5 = objc_msgSend(v3, "decodeInt64ForKey:", CFSTR("width"));
  v6 = objc_msgSend(v3, "decodeInt64ForKey:", CFSTR("height"));
  v7 = objc_msgSend(v3, "decodeInt32ForKey:", CFSTR("pixelFormat"));
  v8 = objc_msgSend(v3, "decodeInt32ForKey:", CFSTR("minFrameRate"));
  v9 = objc_msgSend(v3, "decodeInt32ForKey:", CFSTR("maxFrameRate"));
  v10 = objc_msgSend(v3, "decodeInt64ForKey:", CFSTR("minimumSupportedVersionMajor"));
  v11 = objc_msgSend(v3, "decodeInt64ForKey:", CFSTR("minimumSupportedVersionMinor"));
  v12 = objc_msgSend(v3, "decodeInt64ForKey:", CFSTR("minimumSupportedVersionPatch"));

  v17[0] = v10;
  v17[1] = v11;
  v17[2] = v12;
  v13 = -[CMContinuityCaptureStreamFormat initWithName:width:height:pixelFormat:minFrameRate:maxFrameRate:entity:minimumSupportedVersion:](self, "initWithName:width:height:pixelFormat:minFrameRate:maxFrameRate:entity:minimumSupportedVersion:", v4, v5, v6, v7, v8, v9, v15, v17);

  return v13;
}

- (CMContinuityCaptureStreamFormat)initWithDictionaryRepresentation:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  NSObject *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  int v24;
  void *v25;
  CMContinuityCaptureStreamFormat *v26;
  int v27;
  void *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  CMContinuityCaptureStreamFormat *v32;
  CMContinuityCaptureStreamFormat *v33;
  NSObject *v35;
  NSObject *v36;
  NSObject *v37;
  NSObject *v38;
  NSObject *v39;
  NSObject *v40;
  NSObject *v41;
  void *v42;
  unsigned int v43;
  uint64_t v44;
  void *v45;
  void *v46;
  void *v47;
  NSObject *v48;
  unsigned int v49;
  uint64_t v50;
  _QWORD v51[3];

  v4 = a3;
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("name"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
    CMContinuityCaptureLog(2);
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      -[CMContinuityCaptureStreamFormat initWithDictionaryRepresentation:].cold.1();
    goto LABEL_38;
  }
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("entity"));
  v6 = objc_claimAutoreleasedReturnValue();
  if (!v6)
  {
    CMContinuityCaptureLog(2);
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      -[CMContinuityCaptureStreamFormat initWithDictionaryRepresentation:].cold.2();
    goto LABEL_38;
  }
  v7 = v6;
  v8 = -[NSObject integerValue](v6, "integerValue");
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("width"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v9)
  {
    CMContinuityCaptureLog(2);
    v35 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
      -[CMContinuityCaptureStreamFormat initWithDictionaryRepresentation:].cold.3();

    goto LABEL_38;
  }
  v10 = v9;
  v11 = objc_msgSend(v9, "integerValue");
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("height"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v12)
  {
    CMContinuityCaptureLog(2);
    v36 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
      -[CMContinuityCaptureStreamFormat initWithDictionaryRepresentation:].cold.4();

    goto LABEL_37;
  }
  v13 = v12;
  v14 = objc_msgSend(v12, "integerValue");
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("pixelFormat"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v15)
  {
    CMContinuityCaptureLog(2);
    v37 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
      -[CMContinuityCaptureStreamFormat initWithDictionaryRepresentation:].cold.5();

    goto LABEL_36;
  }
  v16 = v15;
  v50 = v14;
  v49 = objc_msgSend(v15, "intValue");
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("minFrameRate"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v17)
  {
    CMContinuityCaptureLog(2);
    v38 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
      -[CMContinuityCaptureStreamFormat initWithDictionaryRepresentation:].cold.6();

    goto LABEL_35;
  }
  v18 = v17;
  v44 = v11;
  v43 = objc_msgSend(v17, "intValue");
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("maxFrameRate"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v19)
  {
    CMContinuityCaptureLog(2);
    v39 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
      -[CMContinuityCaptureStreamFormat initWithDictionaryRepresentation:].cold.7();

LABEL_35:
LABEL_36:

LABEL_37:
LABEL_38:
    v33 = 0;
    goto LABEL_15;
  }
  v20 = v19;
  v45 = v16;
  v46 = v13;
  v47 = v10;
  v48 = v7;
  v21 = objc_msgSend(v19, "intValue");
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("minimumSupportedVersionMajor"));
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  v42 = v5;
  if (!v22)
  {
    v26 = self;
    v30 = 0;
    v31 = 0;
    v29 = 1;
    goto LABEL_13;
  }
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("minimumSupportedVersionMajor"));
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = objc_msgSend(v23, "intValue");
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("minimumSupportedVersionMinor"));
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v25)
  {
    CMContinuityCaptureLog(2);
    v40 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR))
      -[CMContinuityCaptureStreamFormat initWithDictionaryRepresentation:].cold.8();

    v33 = 0;
    goto LABEL_14;
  }
  v26 = self;
  v27 = objc_msgSend(v25, "intValue");
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("minimumSupportedVersionPatch"));
  v28 = (void *)objc_claimAutoreleasedReturnValue();

  if (v28)
  {
    v29 = v24;
    v30 = v27;
    v31 = (int)objc_msgSend(v28, "intValue");

LABEL_13:
    v51[0] = v29;
    v51[1] = v30;
    v51[2] = v31;
    v32 = v26;
    v5 = v42;
    self = -[CMContinuityCaptureStreamFormat initWithName:width:height:pixelFormat:minFrameRate:maxFrameRate:entity:minimumSupportedVersion:](v32, "initWithName:width:height:pixelFormat:minFrameRate:maxFrameRate:entity:minimumSupportedVersion:", v42, v44, v50, v49, v43, v21, v8, v51);

    v33 = self;
LABEL_14:
    v7 = v48;
    goto LABEL_15;
  }
  CMContinuityCaptureLog(2);
  v41 = objc_claimAutoreleasedReturnValue();
  v7 = v48;
  if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR))
    -[CMContinuityCaptureStreamFormat initWithDictionaryRepresentation:].cold.9();

  v33 = 0;
  self = v26;
  v5 = v42;
LABEL_15:

  return v33;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  _QWORD v14[10];
  _QWORD v15[12];

  v15[10] = *MEMORY[0x24BDAC8D0];
  v15[0] = self->_name;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", self->_entity, CFSTR("name"), CFSTR("entity"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v15[1] = v3;
  v14[2] = CFSTR("width");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", self->_width);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v15[2] = v4;
  v14[3] = CFSTR("height");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", self->_height);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v15[3] = v5;
  v14[4] = CFSTR("pixelFormat");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_pixelFormat);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v15[4] = v6;
  v14[5] = CFSTR("minFrameRate");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_minFrameRate);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v15[5] = v7;
  v14[6] = CFSTR("maxFrameRate");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_maxFrameRate);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v15[6] = v8;
  v14[7] = CFSTR("minimumSupportedVersionMajor");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", self->_minimumSupportedVersion.major);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v15[7] = v9;
  v14[8] = CFSTR("minimumSupportedVersionMinor");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", self->_minimumSupportedVersion.minor);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v15[8] = v10;
  v14[9] = CFSTR("minimumSupportedVersionPatch");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", self->_minimumSupportedVersion.patch);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v15[9] = v11;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v15, v14, 10);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (NSString)debugDescription
{
  void *v3;
  void *v4;
  unint64_t width;
  unint64_t height;
  int64_t entity;
  uint64_t minFrameRate;
  uint64_t maxFrameRate;
  void *v10;
  void *v11;

  v3 = (void *)MEMORY[0x24BDD17C8];
  CMContinuityCaptureStringFromOSType(self->_pixelFormat);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  width = self->_width;
  height = self->_height;
  entity = self->_entity;
  minFrameRate = self->_minFrameRate;
  maxFrameRate = self->_maxFrameRate;
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("[%ld.%ld.%ld]"), self->_minimumSupportedVersion.major, self->_minimumSupportedVersion.minor, self->_minimumSupportedVersion.patch);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %lu * %lu [%d-%d] entity:%u minimumSupportedVersion:%@"), v4, width, height, minFrameRate, maxFrameRate, entity, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v11;
}

- (NSString)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[CMContinuityCaptureStreamFormat debugDescription](self, "debugDescription");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p %@>"), v5, self, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v7;
}

- (opaqueCMFormatDescription)formatDescription
{
  return (opaqueCMFormatDescription *)self->_formatDescription;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  -[CMContinuityCaptureStreamFormat name](self, "name");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", v4, CFSTR("name"));

  objc_msgSend(v5, "encodeInt64:forKey:", -[CMContinuityCaptureStreamFormat entity](self, "entity"), CFSTR("entity"));
  objc_msgSend(v5, "encodeInt64:forKey:", -[CMContinuityCaptureStreamFormat width](self, "width"), CFSTR("width"));
  objc_msgSend(v5, "encodeInt64:forKey:", -[CMContinuityCaptureStreamFormat height](self, "height"), CFSTR("height"));
  objc_msgSend(v5, "encodeInt32:forKey:", -[CMContinuityCaptureStreamFormat pixelFormat](self, "pixelFormat"), CFSTR("pixelFormat"));
  objc_msgSend(v5, "encodeInt32:forKey:", -[CMContinuityCaptureStreamFormat minFrameRate](self, "minFrameRate"), CFSTR("minFrameRate"));
  objc_msgSend(v5, "encodeInt32:forKey:", -[CMContinuityCaptureStreamFormat maxFrameRate](self, "maxFrameRate"), CFSTR("maxFrameRate"));
  objc_msgSend(v5, "encodeInt64:forKey:", self->_minimumSupportedVersion.major, CFSTR("minimumSupportedVersionMajor"));
  objc_msgSend(v5, "encodeInt64:forKey:", self->_minimumSupportedVersion.minor, CFSTR("minimumSupportedVersionMinor"));
  objc_msgSend(v5, "encodeInt64:forKey:", self->_minimumSupportedVersion.patch, CFSTR("minimumSupportedVersionPatch"));

}

- (NSString)name
{
  return self->_name;
}

- (unint64_t)width
{
  return self->_width;
}

- (unint64_t)height
{
  return self->_height;
}

- (unsigned)pixelFormat
{
  return self->_pixelFormat;
}

- (unsigned)minFrameRate
{
  return self->_minFrameRate;
}

- (unsigned)maxFrameRate
{
  return self->_maxFrameRate;
}

- (int64_t)entity
{
  return self->_entity;
}

- ($9FE6E10C8CE45DBC9A88DFDEA39A390D)minimumSupportedVersion
{
  $9FE6E10C8CE45DBC9A88DFDEA39A390D *result;

  objc_copyStruct(retstr, &self->_minimumSupportedVersion, 24, 1, 0);
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong(&self->_formatDescription, 0);
}

- (void)initWithName:(os_log_t)log width:height:pixelFormat:minFrameRate:maxFrameRate:entity:minimumSupportedVersion:.cold.1(uint64_t a1, int a2, os_log_t log)
{
  int v3;
  uint64_t v4;
  __int16 v5;
  int v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  v3 = 138412546;
  v4 = a1;
  v5 = 1024;
  v6 = a2;
  _os_log_error_impl(&dword_227C5D000, log, OS_LOG_TYPE_ERROR, "%@ CMVideoFormatDescriptionCreate error %x", (uint8_t *)&v3, 0x12u);
}

- (void)initWithDictionaryRepresentation:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_17();
  OUTLINED_FUNCTION_9_0(&dword_227C5D000, v0, v1, "missing CMContinuityCaptureStreamFormatKey_Name", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_14();
}

- (void)initWithDictionaryRepresentation:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_17();
  OUTLINED_FUNCTION_9_0(&dword_227C5D000, v0, v1, "missing CMContinuityCaptureStreamFormatKey_Entity", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_14();
}

- (void)initWithDictionaryRepresentation:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_17();
  OUTLINED_FUNCTION_9_0(&dword_227C5D000, v0, v1, "missing CMContinuityCaptureStreamFormatKey_Width", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_14();
}

- (void)initWithDictionaryRepresentation:.cold.4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_17();
  OUTLINED_FUNCTION_9_0(&dword_227C5D000, v0, v1, "missing CMContinuityCaptureStreamFormatKey_Height", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_14();
}

- (void)initWithDictionaryRepresentation:.cold.5()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_17();
  OUTLINED_FUNCTION_9_0(&dword_227C5D000, v0, v1, "missing CMContinuityCaptureStreamFormatKey_PixelFormat", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_14();
}

- (void)initWithDictionaryRepresentation:.cold.6()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_17();
  OUTLINED_FUNCTION_9_0(&dword_227C5D000, v0, v1, "missing CMContinuityCaptureStreamFormatKey_MinFrameRate", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_14();
}

- (void)initWithDictionaryRepresentation:.cold.7()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_17();
  OUTLINED_FUNCTION_9_0(&dword_227C5D000, v0, v1, "missing CMContinuityCaptureStreamFormatKey_MaxFrameRate", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_14();
}

- (void)initWithDictionaryRepresentation:.cold.8()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_17();
  OUTLINED_FUNCTION_9_0(&dword_227C5D000, v0, v1, "missing CMContinuityCaptureStreamFormatKey_MinimumSupportedVersionMinor", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_14();
}

- (void)initWithDictionaryRepresentation:.cold.9()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_17();
  OUTLINED_FUNCTION_9_0(&dword_227C5D000, v0, v1, "missing CMContinuityCaptureStreamFormatKey_MinimumSupportedVersionPatch", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_14();
}

@end
