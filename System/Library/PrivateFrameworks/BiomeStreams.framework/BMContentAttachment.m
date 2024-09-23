@implementation BMContentAttachment

- (BMContentAttachment)initWithType:(id)a3 filename:(id)a4 path:(id)a5
{
  id v10;
  id v11;
  id v12;
  BMContentAttachment *v13;
  BMContentAttachment *v14;
  void *v16;
  void *v17;
  objc_super v18;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  if (v10)
  {
    if (v11)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("BMContentAttachment.m"), 29, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("type"));

    if (v11)
      goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("BMContentAttachment.m"), 30, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("filename"));

LABEL_3:
  v18.receiver = self;
  v18.super_class = (Class)BMContentAttachment;
  v13 = -[BMContentAttachment init](&v18, sel_init);
  v14 = v13;
  if (v13)
  {
    objc_storeStrong((id *)&v13->_type, a3);
    objc_storeStrong((id *)&v14->_filename, a4);
    objc_storeStrong((id *)&v14->_path, a5);
  }

  return v14;
}

- (unsigned)dataVersion
{
  return 1;
}

+ (id)eventWithData:(id)a3 dataVersion:(unsigned int)a4
{
  id v6;
  void *v7;
  NSObject *v8;

  v6 = a3;
  if (a4 == 1)
  {
    v7 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithProtoData:", v6);
  }
  else
  {
    __biome_log_for_category();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      +[BMContentAttachment eventWithData:dataVersion:].cold.1(a4, v8);

    v7 = 0;
  }

  return v7;
}

- (id)jsonDict
{
  NSString *filename;
  NSString *path;
  void *v4;
  void *v5;
  _QWORD v7[3];
  _QWORD v8[4];

  v8[3] = *MEMORY[0x1E0C80C00];
  v7[0] = CFSTR("type");
  v7[1] = CFSTR("filename");
  filename = self->_filename;
  v8[0] = self->_type;
  v8[1] = filename;
  v7[2] = CFSTR("path");
  path = self->_path;
  v4 = path;
  if (!path)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v8[2] = v4;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v8, v7, 3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!path)

  return v5;
}

- (id)json
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  NSObject *v6;
  id v8;

  v2 = (void *)MEMORY[0x1E0CB36D8];
  -[BMContentAttachment jsonDict](self, "jsonDict");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = 0;
  objc_msgSend(v2, "dataWithJSONObject:options:error:", v3, 1, &v8);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v8;

  if (!v4)
  {
    __biome_log_for_category();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      -[BMContentAttachment json].cold.1((uint64_t)v5, v6);

  }
  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[BMContentAttachment encodeAsProto](self, "encodeAsProto");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("dat"));

}

- (BMContentAttachment)initWithCoder:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  BMContentAttachment *v7;

  v4 = (void *)MEMORY[0x1E0D81610];
  v5 = a3;
  objc_msgSend(v4, "robustDecodeObjectOfClass:forKey:withCoder:expectNonNull:errorDomain:errorCode:logHandle:", objc_opt_class(), CFSTR("dat"), v5, 1, CFSTR("BMStreamErrorDomain"), 2, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    self = -[BMContentAttachment initWithProtoData:](self, "initWithProtoData:", v6);
    v7 = self;
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (id)encodeAsProto
{
  void *v2;
  void *v3;

  -[BMContentAttachment proto](self, "proto");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "data");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (BMContentAttachment)initWithProto:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  BMContentAttachment *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  NSObject *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;

  v4 = a3;
  if (v4)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      if (-[NSObject hasType](v5, "hasType") && (-[NSObject hasFilename](v5, "hasFilename") & 1) != 0)
      {
        -[NSObject type](v5, "type");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSObject filename](v5, "filename");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSObject path](v5, "path");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        self = -[BMContentAttachment initWithType:filename:path:](self, "initWithType:filename:path:", v6, v7, v8);

        v9 = self;
LABEL_13:

        goto LABEL_14;
      }
      __biome_log_for_category();
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_FAULT))
        -[BMContentAttachment initWithProto:].cold.1(v17, v18, v19, v20, v21, v22, v23, v24);

    }
    else
    {
      __biome_log_for_category();
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT))
        -[BMContentAttachment initWithProto:].cold.2(v5, v10, v11, v12, v13, v14, v15, v16);
    }
    v9 = 0;
    goto LABEL_13;
  }
  v9 = 0;
LABEL_14:

  return v9;
}

- (BMContentAttachment)initWithProtoData:(id)a3
{
  id v4;
  BMPBContentAttachment *v5;
  BMContentAttachment *v6;

  if (a3)
  {
    v4 = a3;
    v5 = -[BMPBContentAttachment initWithData:]([BMPBContentAttachment alloc], "initWithData:", v4);

    self = -[BMContentAttachment initWithProto:](self, "initWithProto:", v5);
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

  v3 = (void *)objc_opt_new();
  -[BMContentAttachment type](self, "type");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setType:", v4);

  -[BMContentAttachment filename](self, "filename");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setFilename:", v5);

  -[BMContentAttachment path](self, "path");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setPath:", v6);

  return v3;
}

- (unint64_t)hash
{
  return -[NSString hash](self->_filename, "hash");
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  id v5;
  NSString *type;
  void *v7;
  void *filename;
  void *v9;
  NSString *path;
  NSString *v11;
  void *v12;
  char v13;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    type = self->_type;
    objc_msgSend(v5, "type");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (!-[NSString isEqualToString:](type, "isEqualToString:", v7))
    {
      v13 = 0;
LABEL_15:

      goto LABEL_16;
    }
    filename = self->_filename;
    objc_msgSend(v5, "filename");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(filename, "isEqualToString:", v9))
    {
      path = self->_path;
      v11 = path;
      if (!path)
      {
        objc_msgSend(v5, "path");
        filename = (void *)objc_claimAutoreleasedReturnValue();
        if (!filename)
        {
          v13 = 1;
LABEL_13:

          goto LABEL_14;
        }
        v11 = self->_path;
      }
      objc_msgSend(v5, "path");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = -[NSString isEqualToString:](v11, "isEqualToString:", v12);

      if (!path)
        goto LABEL_13;
    }
    else
    {
      v13 = 0;
    }
LABEL_14:

    goto LABEL_15;
  }
  v13 = 0;
LABEL_16:

  return v13;
}

- (BOOL)isCompleteWithContext:(id)a3 error:(id *)a4
{
  id v6;
  BOOL v7;

  v6 = a3;
  if (self->_type && self->_filename)
  {
    v7 = 1;
  }
  else if (a4)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("BMStreamErrorDomain"), 3, 0);
    v7 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (NSString)type
{
  return self->_type;
}

- (NSString)filename
{
  return self->_filename;
}

- (NSString)path
{
  return self->_path;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_path, 0);
  objc_storeStrong((id *)&self->_filename, 0);
  objc_storeStrong((id *)&self->_type, 0);
}

+ (void)eventWithData:(int)a1 dataVersion:(NSObject *)a2 .cold.1(int a1, NSObject *a2)
{
  _DWORD v2[2];
  __int16 v3;
  int v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v2[0] = 67109376;
  v2[1] = a1;
  v3 = 1024;
  v4 = 1;
  _os_log_error_impl(&dword_18D810000, a2, OS_LOG_TYPE_ERROR, "BMContentAttachment: Mismatched data versions (%u != %u) cannot deserialize", (uint8_t *)v2, 0xEu);
}

- (void)json
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138412290;
  v3 = a1;
  _os_log_error_impl(&dword_18D810000, a2, OS_LOG_TYPE_ERROR, "BMContentAttachment: Unable to create json from object: %@", (uint8_t *)&v2, 0xCu);
}

- (void)initWithProto:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_18D810000, a1, a3, "BMContentAttachment: tried to initialize with a proto missing required data.", a5, a6, a7, a8, 0);
}

- (void)initWithProto:(uint64_t)a3 .cold.2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_18D810000, a1, a3, "BMContentAttachment: tried to initialize with a non-BMContentAttachment proto", a5, a6, a7, a8, 0);
}

@end
