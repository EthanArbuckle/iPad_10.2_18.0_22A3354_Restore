@implementation BMPhotosPhotoViewEvent

- (BMPhotosPhotoViewEvent)initWithUniqueId:(id)a3 personaId:(id)a4 locations:(id)a5 absoluteTimestamp:(double)a6 contentProtection:(id)a7
{
  id v14;
  id v15;
  id v16;
  id v17;
  BMPhotosPhotoViewEvent *v18;
  BMPhotosPhotoViewEvent *v19;
  void *v21;
  void *v22;
  objc_super v23;

  v14 = a3;
  v15 = a4;
  v16 = a5;
  v17 = a7;
  if (v14)
  {
    if (v16)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("BMPhotosPhotoViewEvent.m"), 31, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("uniqueId"));

    if (v16)
      goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("BMPhotosPhotoViewEvent.m"), 32, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("locations"));

LABEL_3:
  v23.receiver = self;
  v23.super_class = (Class)BMPhotosPhotoViewEvent;
  v18 = -[BMPhotosPhotoViewEvent init](&v23, sel_init);
  v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_locations, a5);
    v19->_absoluteTimestamp = a6;
    objc_storeStrong((id *)&v19->_uniqueId, a3);
    objc_storeStrong((id *)&v19->_personaId, a4);
    objc_storeStrong((id *)&v19->_contentProtection, a7);
  }

  return v19;
}

- (BMPhotosPhotoViewEvent)initWithUniqueId:(id)a3 locations:(id)a4 absoluteTimestamp:(double)a5 contentProtection:(id)a6
{
  return -[BMPhotosPhotoViewEvent initWithUniqueId:personaId:locations:absoluteTimestamp:contentProtection:](self, "initWithUniqueId:personaId:locations:absoluteTimestamp:contentProtection:", a3, 0, a4, a6, a5);
}

- (BMPhotosPhotoViewEvent)initWithUniqueId:(id)a3 locations:(id)a4 absoluteTimestamp:(double)a5
{
  return -[BMPhotosPhotoViewEvent initWithUniqueId:locations:absoluteTimestamp:contentProtection:](self, "initWithUniqueId:locations:absoluteTimestamp:contentProtection:", a3, a4, 0, a5);
}

- (unsigned)dataVersion
{
  return 2;
}

+ (id)eventWithData:(id)a3 dataVersion:(unsigned int)a4
{
  id v6;
  void *v7;
  NSObject *v8;

  v6 = a3;
  if (a4 == 2)
  {
    v7 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithProtoData:", v6);
  }
  else
  {
    __biome_log_for_category();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      +[BMPhotosPhotoViewEvent eventWithData:dataVersion:].cold.1(a4, v8);

    v7 = 0;
  }

  return v7;
}

- (id)jsonDict
{
  void *v2;
  void *v3;

  -[BMPhotosPhotoViewEvent proto](self, "proto");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "dictionaryRepresentation");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
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
  -[BMPhotosPhotoViewEvent jsonDict](self, "jsonDict");
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
      -[BMPhotosPhotoViewEvent json].cold.1((uint64_t)v5, v6);

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
  -[BMPhotosPhotoViewEvent encodeAsProto](self, "encodeAsProto");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("dat"));

}

- (BMPhotosPhotoViewEvent)initWithCoder:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  BMPhotosPhotoViewEvent *v7;

  v4 = (void *)MEMORY[0x1E0D81610];
  v5 = a3;
  objc_msgSend(v4, "robustDecodeObjectOfClass:forKey:withCoder:expectNonNull:errorDomain:errorCode:logHandle:", objc_opt_class(), CFSTR("dat"), v5, 1, CFSTR("BMStreamErrorDomain"), 2, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    self = -[BMPhotosPhotoViewEvent initWithProtoData:](self, "initWithProtoData:", v6);
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

  -[BMPhotosPhotoViewEvent proto](self, "proto");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "data");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (BMPhotosPhotoViewEvent)initWithProto:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  double v9;
  double v10;
  void *v11;
  BMPhotosPhotoViewEvent *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  NSObject *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;

  v4 = a3;
  if (v4)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      if (-[NSObject hasAbsoluteTimestamp](v5, "hasAbsoluteTimestamp")
        && (-[NSObject hasUniqueId](v5, "hasUniqueId") & 1) != 0)
      {
        -[NSObject uniqueId](v5, "uniqueId");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSObject personaId](v5, "personaId");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSObject locations](v5, "locations");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSObject absoluteTimestamp](v5, "absoluteTimestamp");
        v10 = v9;
        -[NSObject contentProtection](v5, "contentProtection");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        self = -[BMPhotosPhotoViewEvent initWithUniqueId:personaId:locations:absoluteTimestamp:contentProtection:](self, "initWithUniqueId:personaId:locations:absoluteTimestamp:contentProtection:", v6, v7, v8, v11, v10);

        v12 = self;
LABEL_13:

        goto LABEL_14;
      }
      __biome_log_for_category();
      v20 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_FAULT))
        -[BMPhotosPhotoViewEvent initWithProto:].cold.1(v20, v21, v22, v23, v24, v25, v26, v27);

    }
    else
    {
      __biome_log_for_category();
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT))
        -[BMPhotosPhotoViewEvent initWithProto:].cold.2(v5, v13, v14, v15, v16, v17, v18, v19);
    }
    v12 = 0;
    goto LABEL_13;
  }
  v12 = 0;
LABEL_14:

  return v12;
}

- (BMPhotosPhotoViewEvent)initWithProtoData:(id)a3
{
  id v4;
  BMPBPhotosPhotoViewEvent *v5;
  BMPhotosPhotoViewEvent *v6;

  if (a3)
  {
    v4 = a3;
    v5 = -[BMPBPhotosPhotoViewEvent initWithData:]([BMPBPhotosPhotoViewEvent alloc], "initWithData:", v4);

    self = -[BMPhotosPhotoViewEvent initWithProto:](self, "initWithProto:", v5);
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
  void *v7;
  void *v8;

  v3 = (void *)objc_opt_new();
  -[BMPhotosPhotoViewEvent locations](self, "locations");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v4, "mutableCopy");
  objc_msgSend(v3, "setLocations:", v5);

  -[BMPhotosPhotoViewEvent absoluteTimestamp](self, "absoluteTimestamp");
  objc_msgSend(v3, "setAbsoluteTimestamp:");
  -[BMPhotosPhotoViewEvent uniqueId](self, "uniqueId");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setUniqueId:", v6);

  -[BMPhotosPhotoViewEvent personaId](self, "personaId");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setPersonaId:", v7);

  -[BMPhotosPhotoViewEvent contentProtection](self, "contentProtection");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setContentProtection:", v8);

  return v3;
}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  NSUInteger v5;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_absoluteTimestamp);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");
  v5 = -[NSString hash](self->_uniqueId, "hash") ^ v4;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  char v8;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    -[BMPhotosPhotoViewEvent proto](self, "proto");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "proto");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    v8 = objc_msgSend(v6, "isEqual:", v7);
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (BOOL)isCompleteWithContext:(id)a3 error:(id *)a4
{
  BOOL result;
  id v7;

  if (-[NSArray count](self->_locations, "count", a3) && self->_uniqueId)
    return 1;
  if (!a4)
    return 0;
  objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("BMStreamErrorDomain"), 3, 0);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  result = 0;
  *a4 = v7;
  return result;
}

- (NSString)uniqueId
{
  return self->_uniqueId;
}

- (NSString)personaId
{
  return self->_personaId;
}

- (NSArray)locations
{
  return self->_locations;
}

- (double)absoluteTimestamp
{
  return self->_absoluteTimestamp;
}

- (NSString)contentProtection
{
  return self->_contentProtection;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contentProtection, 0);
  objc_storeStrong((id *)&self->_locations, 0);
  objc_storeStrong((id *)&self->_personaId, 0);
  objc_storeStrong((id *)&self->_uniqueId, 0);
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
  v4 = 2;
  _os_log_error_impl(&dword_18D810000, a2, OS_LOG_TYPE_ERROR, "BMPhotosPhotoViewEvent: Mismatched data versions (%u != %u) cannot deserialize", (uint8_t *)v2, 0xEu);
}

- (void)json
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138412290;
  v3 = a1;
  _os_log_error_impl(&dword_18D810000, a2, OS_LOG_TYPE_ERROR, "BMPhotosPhotoViewEvent: Unable to create json from object: %@", (uint8_t *)&v2, 0xCu);
}

- (void)initWithProto:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_18D810000, a1, a3, "BMPhotosPhotoViewEvent: tried to initialize with a proto missing required data.", a5, a6, a7, a8, 0);
}

- (void)initWithProto:(uint64_t)a3 .cold.2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_18D810000, a1, a3, "BMPhotosPhotoViewEvent: tried to initialize with a non-BMPhotosPhotoViewEvent proto", a5, a6, a7, a8, 0);
}

@end
