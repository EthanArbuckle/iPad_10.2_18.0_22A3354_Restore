@implementation BMUserFocusActivityEvent

- (BMUserFocusActivityEvent)initWithMode:(id)a3 clientID:(id)a4 isStart:(BOOL)a5
{
  id v9;
  id v10;
  BMUserFocusActivityEvent *v11;
  BMUserFocusActivityEvent *v12;
  objc_super v14;

  v9 = a3;
  v10 = a4;
  v14.receiver = self;
  v14.super_class = (Class)BMUserFocusActivityEvent;
  v11 = -[BMEventBase init](&v14, sel_init);
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_clientID, a4);
    objc_storeStrong((id *)&v12->_mode, a3);
    v12->_isStart = a5;
  }

  return v12;
}

- (NSString)description
{
  id v3;
  NSString *clientID;
  NSString *mode;
  void *v6;
  void *v7;

  v3 = objc_alloc(MEMORY[0x1E0CB3940]);
  clientID = self->_clientID;
  mode = self->_mode;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_isStart);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("User activity event, clientId: %@, currentMode: %@, isStart: %@"), clientID, mode, v6);

  return (NSString *)v7;
}

- (id)jsonDict
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v10[3];
  _QWORD v11[4];

  v11[3] = *MEMORY[0x1E0C80C00];
  v10[0] = CFSTR("clientID");
  -[BMUserFocusActivityEvent clientID](self, "clientID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (!v3)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v11[0] = v4;
  v10[1] = CFSTR("mode");
  -[BMUserFocusActivityEvent mode](self, "mode");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v11[1] = v6;
  v10[2] = CFSTR("isStart");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[BMUserFocusActivityEvent isStart](self, "isStart"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v11[2] = v7;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v11, v10, 3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
  if (!v3)

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
  -[BMUserFocusActivityEvent jsonDict](self, "jsonDict");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = 0;
  objc_msgSend(v2, "dataWithJSONObject:options:error:", v3, 3, &v8);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v8;

  if (v5)
  {
    __biome_log_for_category();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      -[BMPOICategoryEvent json].cold.1(v6);

  }
  return v4;
}

- (unsigned)dataVersion
{
  return 1;
}

+ (id)eventWithData:(id)a3 dataVersion:(unsigned int)a4
{
  id v5;
  void *v6;

  v5 = a3;
  v6 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithProtoData:", v5);

  return v6;
}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  unint64_t v8;

  -[BMUserFocusActivityEvent mode](self, "mode");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");
  -[BMUserFocusActivityEvent clientID](self, "clientID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hash") ^ v4;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[BMUserFocusActivityEvent isStart](self, "isStart"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v6 ^ objc_msgSend(v7, "hash");

  return v8;
}

- (BOOL)isEqual:(id)a3
{
  void *v3;
  id v5;
  id v6;
  _BOOL4 v7;
  int v8;
  void *v9;
  void *v10;
  void *v11;
  char v12;
  char v13;
  char v14;
  void *v15;
  void *v16;
  void *v17;
  char v18;

  v5 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v6 = v5;
    v7 = -[BMUserFocusActivityEvent isStart](self, "isStart");
    v8 = v7 ^ objc_msgSend(v6, "isStart");
    -[BMUserFocusActivityEvent clientID](self, "clientID");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9 || (objc_msgSend(v6, "clientID"), (v3 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
    {
      -[BMUserFocusActivityEvent clientID](self, "clientID");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "clientID");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v10, "isEqual:", v11);

      if (v9)
      {
LABEL_9:
        v14 = v8 ^ 1;

        -[BMUserFocusActivityEvent mode](self, "mode");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        if (v15 || (objc_msgSend(v6, "mode"), (v3 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
        {
          -[BMUserFocusActivityEvent mode](self, "mode");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v6, "mode");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          v18 = objc_msgSend(v16, "isEqual:", v17);

          if (v15)
          {
LABEL_15:

            v13 = v14 & v12 & v18;
            goto LABEL_16;
          }
        }
        else
        {
          v18 = 1;
        }

        goto LABEL_15;
      }
    }
    else
    {
      v12 = 1;
    }

    goto LABEL_9;
  }
  v13 = 0;
LABEL_16:

  return v13;
}

- (id)encodeAsProto
{
  void *v2;
  void *v3;

  -[BMUserFocusActivityEvent proto](self, "proto");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "data");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (BMUserFocusActivityEvent)initWithProto:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  BMUserFocusActivityEvent *v9;
  NSObject *v10;

  v4 = a3;
  if (!v4)
  {
LABEL_7:
    v9 = 0;
    goto LABEL_8;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    __biome_log_for_category();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT))
      -[BMUserFocusActivityEvent initWithProto:].cold.1((uint64_t)self, v10);

    goto LABEL_7;
  }
  v5 = v4;
  objc_msgSend(v5, "mode");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "clientID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v5, "isStart");

  self = -[BMUserFocusActivityEvent initWithMode:clientID:isStart:](self, "initWithMode:clientID:isStart:", v6, v7, v8);
  v9 = self;
LABEL_8:

  return v9;
}

- (BMUserFocusActivityEvent)initWithProtoData:(id)a3
{
  id v4;
  BMPBUserFocusActivityEvent *v5;
  BMUserFocusActivityEvent *v6;

  if (a3)
  {
    v4 = a3;
    v5 = -[BMPBUserFocusActivityEvent initWithData:]([BMPBUserFocusActivityEvent alloc], "initWithData:", v4);

    self = -[BMUserFocusActivityEvent initWithProto:](self, "initWithProto:", v5);
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
  -[BMUserFocusActivityEvent mode](self, "mode");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setMode:", v4);

  -[BMUserFocusActivityEvent clientID](self, "clientID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setClientID:", v5);

  objc_msgSend(v3, "setIsStart:", -[BMUserFocusActivityEvent isStart](self, "isStart"));
  return v3;
}

- (NSString)clientID
{
  return self->_clientID;
}

- (void)setClientID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSString)mode
{
  return self->_mode;
}

- (void)setMode:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (BOOL)isStart
{
  return self->_isStart;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mode, 0);
  objc_storeStrong((id *)&self->_clientID, 0);
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
  _os_log_fault_impl(&dword_18D810000, a2, OS_LOG_TYPE_FAULT, "%@: tried to initialize with a non-BMPBUserFocusActivityEvent proto", (uint8_t *)&v5, 0xCu);

}

@end
