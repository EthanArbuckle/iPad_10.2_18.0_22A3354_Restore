@implementation BMReadMessageEvent

- (BMReadMessageEvent)initWithIDSHandle:(id)a3
{
  id v5;
  BMReadMessageEvent *v6;
  BMReadMessageEvent *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)BMReadMessageEvent;
  v6 = -[BMEventBase init](&v9, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_idsHandle, a3);
    v7->_markedUnread = 0;
  }

  return v7;
}

- (id)initMarkUnreadWithIDSHandle:(id)a3
{
  id v5;
  BMReadMessageEvent *v6;
  BMReadMessageEvent *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)BMReadMessageEvent;
  v6 = -[BMEventBase init](&v9, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_idsHandle, a3);
    v7->_markedUnread = 1;
  }

  return v7;
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
      +[BMReadMessageEvent eventWithData:dataVersion:].cold.1(a4, v7);

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

  -[BMReadMessageEvent proto](self, "proto");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "data");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (BMReadMessageEvent)initWithProto:(id)a3
{
  id v4;
  id v5;
  int v6;
  void *v7;
  BMReadMessageEvent *v8;
  NSObject *v9;
  BMReadMessageEvent *v10;

  v4 = a3;
  if (!v4)
  {
LABEL_8:
    v10 = 0;
    goto LABEL_11;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    __biome_log_for_category();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT))
      -[BMReadMessageEvent initWithProto:].cold.1((uint64_t)self, v9);

    goto LABEL_8;
  }
  v5 = v4;
  v6 = objc_msgSend(v5, "markedUnread");
  objc_msgSend(v5, "idsHandle");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
    v8 = -[BMReadMessageEvent initMarkUnreadWithIDSHandle:](self, "initMarkUnreadWithIDSHandle:", v7);
  else
    v8 = -[BMReadMessageEvent initWithIDSHandle:](self, "initWithIDSHandle:", v7);
  self = v8;

  v10 = self;
LABEL_11:

  return v10;
}

- (BMReadMessageEvent)initWithProtoData:(id)a3
{
  id v4;
  BMPBReadMessageEvent *v5;
  BMReadMessageEvent *v6;

  if (a3)
  {
    v4 = a3;
    v5 = -[BMPBReadMessageEvent initWithData:]([BMPBReadMessageEvent alloc], "initWithData:", v4);

    self = -[BMReadMessageEvent initWithProto:](self, "initWithProto:", v5);
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

  v3 = (void *)objc_opt_new();
  -[BMReadMessageEvent idsHandle](self, "idsHandle");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v4, "mutableCopy");
  objc_msgSend(v3, "setIdsHandle:", v5);

  objc_msgSend(v3, "setMarkedUnread:", -[BMReadMessageEvent markedUnread](self, "markedUnread"));
  return v3;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  id v5;
  NSString *idsHandle;
  void *v7;
  int markedUnread;
  BOOL v9;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    idsHandle = self->_idsHandle;
    objc_msgSend(v5, "idsHandle");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (-[NSString isEqual:](idsHandle, "isEqual:", v7))
    {
      markedUnread = self->_markedUnread;
      v9 = markedUnread == objc_msgSend(v5, "markedUnread");
    }
    else
    {
      v9 = 0;
    }

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (NSString)idsHandle
{
  return self->_idsHandle;
}

- (void)setIdsHandle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (BOOL)markedUnread
{
  return self->_markedUnread;
}

- (void).cxx_destruct
{
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
  _os_log_error_impl(&dword_18D810000, a2, OS_LOG_TYPE_ERROR, "BMReadMessageEvent: Mismatched data versions (%u != %u) cannot deserialize", (uint8_t *)v2, 0xEu);
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
  _os_log_fault_impl(&dword_18D810000, a2, OS_LOG_TYPE_FAULT, "%@: tried to initialize with a non-BMPBReadMessageEvent proto", (uint8_t *)&v5, 0xCu);

}

@end
