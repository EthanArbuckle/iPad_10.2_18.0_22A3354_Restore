@implementation CMContinuityCaptureControl

- (CMContinuityCaptureControl)initWithName:(id)a3 attributes:(id)a4 entity:(int64_t)a5 minimumSupportedVersion:(id *)a6 value:(id)a7
{
  id v13;
  id v14;
  id v15;
  CMContinuityCaptureControl *v16;
  CMContinuityCaptureControl *v17;
  __int128 v18;
  CMContinuityCaptureControl *v19;
  objc_super v21;

  v13 = a3;
  v14 = a4;
  v15 = a7;
  v21.receiver = self;
  v21.super_class = (Class)CMContinuityCaptureControl;
  v16 = -[CMContinuityCaptureControl init](&v21, sel_init);
  v17 = v16;
  if (v16)
  {
    objc_storeStrong((id *)&v16->_name, a3);
    objc_storeStrong((id *)&v17->_attributes, a4);
    v17->_entity = a5;
    v18 = *(_OWORD *)&a6->var0;
    v17->_minimumSupportedVersion.patch = a6->var2;
    *(_OWORD *)&v17->_minimumSupportedVersion.major = v18;
    -[CMContinuityCaptureControl setValue:](v17, "setValue:", v15);
    v19 = v17;
  }

  return v17;
}

- (CMContinuityCaptureControl)initWithCoder:(id)a3
{
  id v4;
  CMContinuityCaptureControl *v5;
  uint64_t v6;
  NSString *name;
  uint64_t v8;
  NSString *v9;
  CMContinuityCaptureControl *v10;
  uint64_t v11;
  id value;
  CMContinuityCaptureControl *v13;
  objc_super v15;

  v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)CMContinuityCaptureControl;
  v5 = -[CMContinuityCaptureControl init](&v15, sel_init);
  if (!v5)
    goto LABEL_8;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("name"));
  v6 = objc_claimAutoreleasedReturnValue();
  name = v5->_name;
  v5->_name = (NSString *)v6;

  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("class"));
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = v5->_class;
  v5->_class = (NSString *)v8;

  v5->_entity = objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("entity"));
  v5->_minimumSupportedVersion.major = objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("minimumSupportedVersionMajor"));
  v5->_minimumSupportedVersion.minor = objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("minimumSupportedVersionMinor"));
  v5->_minimumSupportedVersion.patch = objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("minimumSupportedVersionPatch"));
  if (v5->_class)
  {
    v10 = v5;
    objc_sync_enter(v10);
    if (-[NSString isEqualToString:](v5->_class, "isEqualToString:", CFSTR("CVPixelBufferRef")))
      objc_msgSend(v4, "decodeCVPixelBufferForKey:expectSourceMedia:", CFSTR("value"), 1);
    else
      objc_msgSend(v4, "decodePropertyListForKey:", CFSTR("value"));
    v11 = objc_claimAutoreleasedReturnValue();
    value = v10->_value;
    v10->_value = (id)v11;

    objc_sync_exit(v10);
    v13 = v10;
  }
  else
  {
LABEL_8:
    v13 = 0;
  }

  return v13;
}

- (CMContinuityCaptureControl)initWithDictionaryRepresentation:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  NSObject *v7;
  NSObject *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  NSString *v16;
  NSString *v17;
  void *v18;
  CMContinuityCaptureControl *v19;
  uint64_t v20;
  id value;
  CMContinuityCaptureControl *v22;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  NSObject *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  _QWORD v46[3];

  v4 = a3;
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("name"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
    CMContinuityCaptureLog(2);
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      -[CMContinuityCaptureControl initWithDictionaryRepresentation:].cold.1(v6, v24, v25, v26, v27, v28, v29, v30);
    goto LABEL_20;
  }
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("attributes"));
  v6 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("entity"));
  v7 = objc_claimAutoreleasedReturnValue();
  if (!v7)
  {
    CMContinuityCaptureLog(2);
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      -[CMContinuityCaptureControl initWithDictionaryRepresentation:].cold.2(v8, v31, v32, v33, v34, v35, v36, v37);
    goto LABEL_19;
  }
  v8 = v7;
  v9 = -[NSObject integerValue](v7, "integerValue");
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("minimumSupportedVersionMajor"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("minimumSupportedVersionMajor"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = (int)objc_msgSend(v11, "intValue");
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("minimumSupportedVersionMinor"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    v14 = (int)objc_msgSend(v13, "intValue");
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("minimumSupportedVersionPatch"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    v15 = (int)objc_msgSend(v10, "intValue");
  }
  else
  {
    v14 = 0;
    v15 = 0;
    v12 = 1;
  }
  v46[0] = v12;
  v46[1] = v14;
  v46[2] = v15;
  self = -[CMContinuityCaptureControl initWithName:attributes:entity:minimumSupportedVersion:value:](self, "initWithName:attributes:entity:minimumSupportedVersion:value:", v5, v6, v9, v46, 0);
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("class"));
  v16 = (NSString *)objc_claimAutoreleasedReturnValue();
  v17 = self->_class;
  self->_class = v16;

  if (!self->_class)
    goto LABEL_10;
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("value"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v18)
  {
    CMContinuityCaptureLog(2);
    v38 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
      -[CMContinuityCaptureControl initWithDictionaryRepresentation:].cold.3(v38, v39, v40, v41, v42, v43, v44, v45);

LABEL_19:
LABEL_20:
    v22 = 0;
    goto LABEL_11;
  }
  if (!-[NSString isEqualToString:](self->_class, "isEqualToString:", CFSTR("CVPixelBufferRef")))
  {
    v19 = self;
    objc_sync_enter(v19);
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("value"));
    v20 = objc_claimAutoreleasedReturnValue();
    value = v19->_value;
    v19->_value = (id)v20;

    objc_sync_exit(v19);
  }
LABEL_10:
  self = self;

  v22 = self;
LABEL_11:

  return v22;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  NSDictionary *attributes;
  NSString *v6;
  CMContinuityCaptureControl *v7;
  void *v8;
  void *v9;
  void *v10;

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", self->_name, CFSTR("name"));
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", self->_entity);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v4, CFSTR("entity"));

  attributes = self->_attributes;
  if (attributes)
    objc_msgSend(v3, "setObject:forKeyedSubscript:", attributes, CFSTR("attributes"));
  v6 = self->_class;
  if (v6)
  {
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("class"));
    if (!-[NSString isEqualToString:](self->_class, "isEqualToString:", CFSTR("CVPixelBufferRef")))
    {
      v7 = self;
      objc_sync_enter(v7);
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v7->_value, CFSTR("value"));
      objc_sync_exit(v7);

    }
  }
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", self->_minimumSupportedVersion.major);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v8, CFSTR("minimumSupportedVersionMajor"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", self->_minimumSupportedVersion.minor);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, CFSTR("minimumSupportedVersionMinor"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", self->_minimumSupportedVersion.patch);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v10, CFSTR("minimumSupportedVersionPatch"));

  return v3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  _BOOL4 v5;
  void *v6;
  id v7;

  v7 = a3;
  -[CMContinuityCaptureControl name](self, "name");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "encodeObject:forKey:", v4, CFSTR("name"));

  objc_msgSend(v7, "encodeInt64:forKey:", -[CMContinuityCaptureControl entity](self, "entity"), CFSTR("entity"));
  objc_msgSend(v7, "encodeObject:forKey:", self->_class, CFSTR("class"));
  v5 = -[NSString isEqualToString:](self->_class, "isEqualToString:", CFSTR("CVPixelBufferRef"));
  -[CMContinuityCaptureControl value](self, "value");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
    objc_msgSend(v7, "encodeCVPixelBuffer:forKey:", v6, CFSTR("value"));
  else
    objc_msgSend(v7, "encodeObject:forKey:", v6, CFSTR("value"));

  objc_msgSend(v7, "encodeInt64:forKey:", self->_minimumSupportedVersion.major, CFSTR("minimumSupportedVersionMajor"));
  objc_msgSend(v7, "encodeInt64:forKey:", self->_minimumSupportedVersion.minor, CFSTR("minimumSupportedVersionMinor"));
  objc_msgSend(v7, "encodeInt64:forKey:", self->_minimumSupportedVersion.patch, CFSTR("minimumSupportedVersionPatch"));

}

- (id)copyWithZone:(_NSZone *)a3
{
  CMContinuityCaptureControl *v3;
  id v4;
  CMContinuityCaptureControl *v5;
  NSDictionary *attributes;
  int64_t entity;
  NSString *name;
  CMContinuityCaptureControl *v9;
  __int128 v11;
  int64_t patch;

  v3 = self;
  objc_sync_enter(v3);
  v4 = v3->_value;
  objc_sync_exit(v3);

  v5 = [CMContinuityCaptureControl alloc];
  entity = v3->_entity;
  attributes = v3->_attributes;
  name = v3->_name;
  v11 = *(_OWORD *)&v3->_minimumSupportedVersion.major;
  patch = v3->_minimumSupportedVersion.patch;
  v9 = -[CMContinuityCaptureControl initWithName:attributes:entity:minimumSupportedVersion:value:](v5, "initWithName:attributes:entity:minimumSupportedVersion:value:", name, attributes, entity, &v11, v4);

  return v9;
}

- (NSString)debugDescription
{
  void *v3;
  int v4;
  void *v5;
  void *v6;
  int64_t v7;
  NSString *v8;
  void *v9;
  void *v10;
  NSString *v11;
  void *v12;

  -[CMContinuityCaptureControl name](self, "name");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToString:", CFSTR("kCMContinuityCaptureControlDebugInfo"));

  v5 = (void *)MEMORY[0x24BDD17C8];
  -[CMContinuityCaptureControl name](self, "name");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[CMContinuityCaptureControl entity](self, "entity");
  if (v4)
  {
    v8 = self->_class;
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("[%ld.%ld.%ld]"), self->_minimumSupportedVersion.major, self->_minimumSupportedVersion.minor, self->_minimumSupportedVersion.patch);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "stringWithFormat:", CFSTR("%@ entity:%u %@ minimumSupportedVersion: %@"), v6, v7, v8, v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[CMContinuityCaptureControl value](self, "value");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = self->_class;
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("[%ld.%ld.%ld]"), self->_minimumSupportedVersion.major, self->_minimumSupportedVersion.minor, self->_minimumSupportedVersion.patch);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "stringWithFormat:", CFSTR("%@ entity:%u value:%@ %@ minimumSupportedVersion: %@"), v6, v7, v9, v11, v12);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return (NSString *)v10;
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
  -[CMContinuityCaptureControl debugDescription](self, "debugDescription");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p %@>"), v5, self, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v7;
}

- (id)value
{
  CMContinuityCaptureControl *v2;
  id v3;

  v2 = self;
  objc_sync_enter(v2);
  v3 = v2->_value;
  objc_sync_exit(v2);

  return v3;
}

- (void)setValue:(id)a3
{
  id v5;
  objc_class *v6;
  NSString *v7;
  NSString *v8;
  CMContinuityCaptureControl *v9;
  CFTypeID v10;
  char isKindOfClass;
  NSObject *v12;
  _BOOL4 v13;
  const char *v14;
  NSObject *v15;
  uint32_t v16;
  int v17;
  CMContinuityCaptureControl *v18;
  __int16 v19;
  uint64_t v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  if (v5)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0
      || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      v6 = (objc_class *)objc_opt_class();
      NSStringFromClass(v6);
      v7 = (NSString *)objc_claimAutoreleasedReturnValue();
      v8 = self->_class;
      self->_class = v7;
LABEL_8:

LABEL_9:
      v9 = self;
      objc_sync_enter(v9);
      objc_storeStrong(&v9->_value, a3);
      objc_sync_exit(v9);

      goto LABEL_10;
    }
    v10 = CFGetTypeID(v5);
    if (v10 == CVPixelBufferGetTypeID())
    {
      v8 = self->_class;
      self->_class = (NSString *)CFSTR("CVPixelBufferRef");
      goto LABEL_8;
    }
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();
    CMContinuityCaptureLog(0);
    v12 = objc_claimAutoreleasedReturnValue();
    v13 = os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT);
    if ((isKindOfClass & 1) != 0)
    {
      if (v13)
      {
        v17 = 138412546;
        v18 = self;
        v19 = 2112;
        v20 = objc_opt_class();
        v14 = "%@ Unhandled value object type %@";
        v15 = v12;
        v16 = 22;
LABEL_18:
        _os_log_impl(&dword_227C5D000, v15, OS_LOG_TYPE_DEFAULT, v14, (uint8_t *)&v17, v16);
      }
    }
    else if (v13)
    {
      v17 = 138412290;
      v18 = self;
      v14 = "%@ Unhandled value unknown type";
      v15 = v12;
      v16 = 12;
      goto LABEL_18;
    }

    goto LABEL_9;
  }
LABEL_10:

}

- (NSString)name
{
  return self->_name;
}

- (int64_t)entity
{
  return self->_entity;
}

- (NSDictionary)attributes
{
  return self->_attributes;
}

- ($9FE6E10C8CE45DBC9A88DFDEA39A390D)minimumSupportedVersion
{
  *($93270A8783F91AF9136665ABBDC0A449 *)retstr = ($93270A8783F91AF9136665ABBDC0A449)self[2];
  return self;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_attributes, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_class, 0);
  objc_storeStrong(&self->_value, 0);
}

- (void)initWithDictionaryRepresentation:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_9_0(&dword_227C5D000, a1, a3, "Missing CMContinuityCaptureControlKey_Name", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_14();
}

- (void)initWithDictionaryRepresentation:(uint64_t)a3 .cold.2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_9_0(&dword_227C5D000, a1, a3, "Missing CMContinuityCaptureControlKey_Entity", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_14();
}

- (void)initWithDictionaryRepresentation:(uint64_t)a3 .cold.3(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_9_0(&dword_227C5D000, a1, a3, "Missing CMContinuityCaptureControlKey_Value", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_14();
}

@end
