@implementation BMUserStatusChangeEvent

- (BMUserStatusChangeEvent)initWithIDSHandle:(id)a3 statusChangeType:(id)a4
{
  id v7;
  id v8;
  void *v9;
  BMUserStatusChangeEvent *v10;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x1E0C80C00];
  objc_storeStrong((id *)&self->_idsHandle, a3);
  v7 = a3;
  v8 = a4;
  v12[0] = v7;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v12, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = -[BMUserStatusChangeEvent initWithIDSHandles:statusChangeType:](self, "initWithIDSHandles:statusChangeType:", v9, v8);
  return v10;
}

- (BMUserStatusChangeEvent)initWithIDSHandles:(id)a3 statusChangeType:(id)a4
{
  id v6;
  id v7;
  BMUserStatusChangeEvent *v8;
  uint64_t v9;
  NSArray *idsHandles;
  objc_super v12;

  v6 = a3;
  v7 = a4;
  v12.receiver = self;
  v12.super_class = (Class)BMUserStatusChangeEvent;
  v8 = -[BMEventBase init](&v12, sel_init);
  if (v8)
  {
    v9 = objc_msgSend(v6, "copy");
    idsHandles = v8->_idsHandles;
    v8->_idsHandles = (NSArray *)v9;

    objc_storeStrong((id *)&v8->_statusChangeType, a4);
  }

  return v8;
}

- (NSString)description
{
  return (NSString *)(id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("UserStatusChangeEvent event with idsHandles: %@, statusChangeType: %@"), self->_idsHandles, self->_statusChangeType);
}

- (unsigned)dataVersion
{
  return 0;
}

+ (id)eventWithData:(id)a3 dataVersion:(unsigned int)a4
{
  id v6;
  NSObject *v7;
  void *v8;

  v6 = a3;
  if (a4)
  {
    __biome_log_for_category();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      +[BMUserStatusChangeEvent eventWithData:dataVersion:].cold.1(a4, v7);

    v8 = 0;
  }
  else
  {
    v8 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithProtoData:", v6);
  }

  return v8;
}

- (id)encodeAsProto
{
  void *v2;
  void *v3;

  -[BMUserStatusChangeEvent proto](self, "proto");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "data");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (BMUserStatusChangeEvent)initWithProto:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  BMUserStatusChangeEvent *v8;
  NSObject *v9;

  v4 = a3;
  if (!v4)
  {
LABEL_7:
    v8 = 0;
    goto LABEL_8;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    __biome_log_for_category();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT))
      -[BMUserStatusChangeEvent initWithProto:].cold.1((uint64_t)self, v9);

    goto LABEL_7;
  }
  v5 = v4;
  objc_msgSend(v5, "idsHandles");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "statusChangeType");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  self = -[BMUserStatusChangeEvent initWithIDSHandles:statusChangeType:](self, "initWithIDSHandles:statusChangeType:", v6, v7);
  v8 = self;
LABEL_8:

  return v8;
}

- (BMUserStatusChangeEvent)initWithProtoData:(id)a3
{
  id v4;
  BMPBUserStatusChangeEvent *v5;
  BMUserStatusChangeEvent *v6;

  if (a3)
  {
    v4 = a3;
    v5 = -[BMPBUserStatusChangeEvent initWithData:]([BMPBUserStatusChangeEvent alloc], "initWithData:", v4);

    self = -[BMUserStatusChangeEvent initWithProto:](self, "initWithProto:", v5);
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
  -[BMUserStatusChangeEvent idsHandles](self, "idsHandles");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v4, "mutableCopy");
  objc_msgSend(v3, "setIdsHandles:", v5);

  -[BMUserStatusChangeEvent statusChangeType](self, "statusChangeType");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setStatusChangeType:", v6);

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  id v5;
  NSArray *idsHandles;
  void *v7;
  NSString *statusChangeType;
  void *v9;
  BOOL v10;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    idsHandles = self->_idsHandles;
    objc_msgSend(v5, "idsHandles");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (-[NSArray isEqual:](idsHandles, "isEqual:", v7))
    {
      statusChangeType = self->_statusChangeType;
      objc_msgSend(v5, "statusChangeType");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = -[NSString isEqualToString:](statusChangeType, "isEqualToString:", v9);

    }
    else
    {
      v10 = 0;
    }

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (NSString)idsHandle
{
  return self->_idsHandle;
}

- (void)setIdsHandle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSString)statusChangeType
{
  return self->_statusChangeType;
}

- (void)setStatusChangeType:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSArray)idsHandles
{
  return self->_idsHandles;
}

- (void)setIdsHandles:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_idsHandles, 0);
  objc_storeStrong((id *)&self->_statusChangeType, 0);
  objc_storeStrong((id *)&self->_idsHandle, 0);
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
  v4 = 0;
  _os_log_error_impl(&dword_18D810000, a2, OS_LOG_TYPE_ERROR, "BMUserStatusChangeEvent: Mismatched data versions (%u != %u) cannot deserialize", (uint8_t *)v2, 0xEu);
}

- (void)initWithProto:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  objc_class *v3;
  void *v4;
  int v5;
  void *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v3 = (objc_class *)objc_opt_class();
  NSStringFromClass(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = 138412290;
  v6 = v4;
  _os_log_fault_impl(&dword_18D810000, a2, OS_LOG_TYPE_FAULT, "%@: tried to initialize with a non-BMPBUserStatusChangeEvent proto", (uint8_t *)&v5, 0xCu);

}

@end
