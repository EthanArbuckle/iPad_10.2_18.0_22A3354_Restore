@implementation BMDeviceMetadataEvent

- (BMDeviceMetadataEvent)initWithName:(id)a3 build:(id)a4 platform:(int64_t)a5
{
  return -[BMDeviceMetadataEvent initWithName:build:supplementalBuild:platform:](self, "initWithName:build:supplementalBuild:platform:", a3, a4, CFSTR("?"), a5);
}

- (BMDeviceMetadataEvent)initWithName:(id)a3 build:(id)a4 supplementalBuild:(id)a5 platform:(int64_t)a6
{
  return -[BMDeviceMetadataEvent initWithName:build:supplementalBuild:platform:rapidSecurityResponsePreReboot:](self, "initWithName:build:supplementalBuild:platform:rapidSecurityResponsePreReboot:", a3, a4, a5, a6, 0);
}

- (BMDeviceMetadataEvent)initWithName:(id)a3 build:(id)a4 supplementalBuild:(id)a5 platform:(int64_t)a6 rapidSecurityResponsePreReboot:(BOOL)a7
{
  id v12;
  id v13;
  id v14;
  BMDeviceMetadataEvent *v15;
  uint64_t v16;
  NSString *name;
  uint64_t v18;
  NSString *build;
  uint64_t v20;
  NSString *supplementalBuild;
  objc_super v23;

  v12 = a3;
  v13 = a4;
  v14 = a5;
  v23.receiver = self;
  v23.super_class = (Class)BMDeviceMetadataEvent;
  v15 = -[BMEventBase init](&v23, sel_init);
  if (v15)
  {
    v16 = objc_msgSend(v12, "copy");
    name = v15->_name;
    v15->_name = (NSString *)v16;

    v18 = objc_msgSend(v13, "copy");
    build = v15->_build;
    v15->_build = (NSString *)v18;

    v20 = objc_msgSend(v14, "copy");
    supplementalBuild = v15->_supplementalBuild;
    v15->_supplementalBuild = (NSString *)v20;

    v15->_platform = a6;
    v15->_rapidSecurityResponsePreReboot = a7;
  }

  return v15;
}

- (unsigned)dataVersion
{
  return 0;
}

+ (id)eventWithData:(id)a3 dataVersion:(unsigned int)a4
{
  id v6;
  void *v7;

  v6 = a3;
  if (a4)
  {
    if (a4 != 1)
    {
      v7 = 0;
      goto LABEL_6;
    }
    a1 = BMDeviceMetadataEvent_v1;
  }
  v7 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithProtoData:", v6);
LABEL_6:

  return v7;
}

- (id)jsonDict
{
  const __CFString *name;
  NSString *build;
  const __CFString *supplementalBuild;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v10[5];
  _QWORD v11[6];

  v11[5] = *MEMORY[0x1E0C80C00];
  name = (const __CFString *)self->_name;
  if (!name)
    name = &stru_1E2672FA8;
  v10[0] = CFSTR("name");
  v10[1] = CFSTR("build");
  build = self->_build;
  v11[0] = name;
  v11[1] = build;
  supplementalBuild = (const __CFString *)self->_supplementalBuild;
  if (!supplementalBuild)
    supplementalBuild = &stru_1E2672FA8;
  v11[2] = supplementalBuild;
  v10[2] = CFSTR("supplementalBuild");
  v10[3] = CFSTR("platform");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", self->_platform);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v11[3] = v6;
  v10[4] = CFSTR("rapidSecurityResponsePreReboot");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_rapidSecurityResponsePreReboot);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v11[4] = v7;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v11, v10, 5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)json
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  NSObject *v6;
  uint64_t v8;

  v2 = (void *)MEMORY[0x1E0CB36D8];
  -[BMDeviceMetadataEvent jsonDict](self, "jsonDict");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = 0;
  objc_msgSend(v2, "dataWithJSONObject:options:error:", v3, 1, &v8);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v8;

  if (v5)
  {
    __biome_log_for_category();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      -[BMDeviceMetadataEvent json].cold.1(v6);

  }
  return v4;
}

- (id)encodeAsProto
{
  void *v2;
  void *v3;

  -[BMDeviceMetadataEvent proto](self, "proto");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "data");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (BMDeviceMetadataEvent)initWithProto:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  unsigned int v9;
  uint64_t v10;
  NSObject *v11;
  BMDeviceMetadataEvent *v12;
  uint64_t v13;

  v4 = a3;
  if (!v4)
  {
LABEL_8:
    v12 = 0;
    goto LABEL_11;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    __biome_log_for_category();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_FAULT))
      -[BMDeviceMetadataEvent initWithProto:].cold.1();

    goto LABEL_8;
  }
  v5 = v4;
  objc_msgSend(v5, "name");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "build");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "supplementalBuild");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v5, "platform");
  if (v9 > 8)
    v10 = 0;
  else
    v10 = qword_18DC0B0E8[v9];
  v13 = objc_msgSend(v5, "rapidSecurityResponsePreReboot");

  self = -[BMDeviceMetadataEvent initWithName:build:supplementalBuild:platform:rapidSecurityResponsePreReboot:](self, "initWithName:build:supplementalBuild:platform:rapidSecurityResponsePreReboot:", v6, v7, v8, v10, v13);
  v12 = self;
LABEL_11:

  return v12;
}

- (BMDeviceMetadataEvent)initWithProtoData:(id)a3
{
  id v4;
  BMPBDeviceMetadataEvent *v5;
  BMDeviceMetadataEvent *v6;

  if (a3)
  {
    v4 = a3;
    v5 = -[BMPBDeviceMetadataEvent initWithData:]([BMPBDeviceMetadataEvent alloc], "initWithData:", v4);

    self = -[BMDeviceMetadataEvent initWithProto:](self, "initWithProto:", v5);
    v6 = self;
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (id)proto
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  unint64_t v7;
  uint64_t v8;

  v3 = (void *)objc_opt_new();
  -[BMDeviceMetadataEvent name](self, "name");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setName:", v4);

  -[BMDeviceMetadataEvent build](self, "build");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setBuild:", v5);

  -[BMDeviceMetadataEvent supplementalBuild](self, "supplementalBuild");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setSupplementalBuild:", v6);

  v7 = -[BMDeviceMetadataEvent platform](self, "platform");
  if (v7 > 8)
    v8 = 7;
  else
    v8 = dword_18DC0B130[v7];
  objc_msgSend(v3, "setPlatform:", v8);
  objc_msgSend(v3, "setRapidSecurityResponsePreReboot:", -[BMDeviceMetadataEvent rapidSecurityResponsePreReboot](self, "rapidSecurityResponsePreReboot"));
  return v3;
}

- (unint64_t)hash
{
  NSUInteger v3;
  NSUInteger v4;
  void *v5;
  uint64_t v6;
  void *v7;
  unint64_t v8;

  v3 = -[NSString hash](self->_build, "hash");
  v4 = -[NSString hash](self->_supplementalBuild, "hash") ^ v3;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", self->_platform);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v4 ^ objc_msgSend(v5, "hash");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_rapidSecurityResponsePreReboot);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v6 ^ objc_msgSend(v7, "hash");

  return v8;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  id v5;
  NSString *build;
  void *v7;
  NSString *supplementalBuild;
  void *v9;
  int64_t platform;
  _BOOL4 v11;
  int v12;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    build = self->_build;
    objc_msgSend(v5, "build");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (-[NSString isEqualToString:](build, "isEqualToString:", v7))
    {
      supplementalBuild = self->_supplementalBuild;
      objc_msgSend(v5, "supplementalBuild");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      if (-[NSString isEqualToString:](supplementalBuild, "isEqualToString:", v9)
        && (platform = self->_platform, platform == objc_msgSend(v5, "platform")))
      {
        v11 = -[BMDeviceMetadataEvent rapidSecurityResponsePreReboot](self, "rapidSecurityResponsePreReboot");
        v12 = v11 ^ objc_msgSend(v5, "rapidSecurityResponsePreReboot") ^ 1;
      }
      else
      {
        LOBYTE(v12) = 0;
      }

    }
    else
    {
      LOBYTE(v12) = 0;
    }

  }
  else
  {
    LOBYTE(v12) = 0;
  }

  return v12;
}

- (NSString)name
{
  return self->_name;
}

- (NSString)build
{
  return self->_build;
}

- (NSString)supplementalBuild
{
  return self->_supplementalBuild;
}

- (int64_t)platform
{
  return self->_platform;
}

- (BOOL)rapidSecurityResponsePreReboot
{
  return self->_rapidSecurityResponsePreReboot;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_supplementalBuild, 0);
  objc_storeStrong((id *)&self->_build, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

- (void)json
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_18D810000, log, OS_LOG_TYPE_ERROR, "Unable to create JSON from object", v1, 2u);
}

- (void)initWithProto:.cold.1()
{
  objc_class *v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v0 = (objc_class *)objc_opt_class();
  NSStringFromClass(v0);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_1_2(&dword_18D810000, v2, v3, "%@: tried to initialize with a non-BMPBDeviceMetadataEvent proto", v4, v5, v6, v7, 2u);

  OUTLINED_FUNCTION_0_0();
}

@end
