@implementation BMSiriUIEvent

- (BMSiriUIEvent)initWithSessionID:(id)a3 UUID:(id)a4 viewMode:(id)a5 dismissalReason:(id)a6 starting:(BOOL)a7 absoluteTimeStamp:(double)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  BMSiriUIEvent *v18;
  uint64_t v19;
  NSString *sessionID;
  uint64_t v21;
  NSString *UUID;
  uint64_t v23;
  NSString *viewMode;
  uint64_t v25;
  NSString *dismissalReason;
  objc_super v28;

  v14 = a3;
  v15 = a4;
  v16 = a5;
  v17 = a6;
  v28.receiver = self;
  v28.super_class = (Class)BMSiriUIEvent;
  v18 = -[BMEventBase init](&v28, sel_init);
  if (v18)
  {
    v19 = objc_msgSend(v14, "copy");
    sessionID = v18->_sessionID;
    v18->_sessionID = (NSString *)v19;

    v21 = objc_msgSend(v15, "copy");
    UUID = v18->_UUID;
    v18->_UUID = (NSString *)v21;

    v23 = objc_msgSend(v16, "copy");
    viewMode = v18->_viewMode;
    v18->_viewMode = (NSString *)v23;

    v25 = objc_msgSend(v17, "copy");
    dismissalReason = v18->_dismissalReason;
    v18->_dismissalReason = (NSString *)v25;

    v18->_starting = a7;
    v18->_absoluteTimestamp = a8;
  }

  return v18;
}

- (NSString)description
{
  id v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  v3 = objc_alloc(MEMORY[0x1E0CB3940]);
  v4 = objc_opt_class();
  -[BMSiriUIEvent sessionID](self, "sessionID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMSiriUIEvent UUID](self, "UUID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMSiriUIEvent viewMode](self, "viewMode");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMSiriUIEvent dismissalReason](self, "dismissalReason");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[BMSiriUIEvent isStarting](self, "isStarting"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)MEMORY[0x1E0CB37E8];
  -[BMSiriUIEvent absoluteTimestamp](self, "absoluteTimestamp");
  objc_msgSend(v10, "numberWithDouble:");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("<%@ %p> sessionID: %@, UUID: %@, viewMode: %@, dismissalReason: %@, starting: %@, absoluteTimestamp: %@"), v4, self, v5, v6, v7, v8, v9, v11);

  return (NSString *)v12;
}

- (unsigned)dataVersion
{
  return 0;
}

+ (id)eventWithData:(id)a3 dataVersion:(unsigned int)a4
{
  id v5;
  void *v6;

  v5 = a3;
  v6 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithProtoData:", v5);

  return v6;
}

- (id)encodeAsProto
{
  void *v2;
  void *v3;

  -[BMSiriUIEvent proto](self, "proto");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "data");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (BMSiriUIEvent)initWithProto:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  double v11;
  double v12;
  BMSiriUIEvent *v13;
  NSObject *v14;

  v4 = a3;
  if (!v4)
  {
LABEL_7:
    v13 = 0;
    goto LABEL_8;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    __biome_log_for_category();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_FAULT))
      -[BMSiriUIEvent initWithProto:].cold.1((uint64_t)self, v14);

    goto LABEL_7;
  }
  v5 = v4;
  objc_msgSend(v5, "sessionID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "uuid");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "viewMode");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "dismissalReason");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v5, "starting");
  objc_msgSend(v5, "absoluteTimestamp");
  v12 = v11;

  self = -[BMSiriUIEvent initWithSessionID:UUID:viewMode:dismissalReason:starting:absoluteTimeStamp:](self, "initWithSessionID:UUID:viewMode:dismissalReason:starting:absoluteTimeStamp:", v6, v7, v8, v9, v10, v12);
  v13 = self;
LABEL_8:

  return v13;
}

- (BMSiriUIEvent)initWithProtoData:(id)a3
{
  id v4;
  BMPBSiriUIEvent *v5;
  BMSiriUIEvent *v6;

  if (a3)
  {
    v4 = a3;
    v5 = -[BMPBSiriUIEvent initWithData:]([BMPBSiriUIEvent alloc], "initWithData:", v4);

    self = -[BMSiriUIEvent initWithProto:](self, "initWithProto:", v5);
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

  v3 = (void *)objc_opt_new();
  -[BMSiriUIEvent sessionID](self, "sessionID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setSessionID:", v4);

  -[BMSiriUIEvent UUID](self, "UUID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setUuid:", v5);

  -[BMSiriUIEvent viewMode](self, "viewMode");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setViewMode:", v6);

  -[BMSiriUIEvent dismissalReason](self, "dismissalReason");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setDismissalReason:", v7);

  objc_msgSend(v3, "setStarting:", -[BMSiriUIEvent isStarting](self, "isStarting"));
  -[BMSiriUIEvent absoluteTimestamp](self, "absoluteTimestamp");
  objc_msgSend(v3, "setAbsoluteTimestamp:");
  return v3;
}

- (unint64_t)hash
{
  NSUInteger v3;
  NSUInteger v4;
  NSUInteger v5;
  NSUInteger v6;
  void *v7;
  uint64_t v8;
  void *v9;
  unint64_t v10;

  v3 = -[NSString hash](self->_sessionID, "hash");
  v4 = -[NSString hash](self->_UUID, "hash") ^ v3;
  v5 = -[NSString hash](self->_viewMode, "hash");
  v6 = v4 ^ v5 ^ -[NSString hash](self->_dismissalReason, "hash");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_starting);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "hash");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_absoluteTimestamp);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v6 ^ v8 ^ objc_msgSend(v9, "hash");

  return v10;
}

- (BOOL)isEqual:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  id v7;
  id v8;
  void *v9;
  int v10;
  BOOL v11;
  void *v12;
  void *v13;
  int v14;
  void *v15;
  void *v16;
  void *v17;
  int v18;
  void *v19;
  void *v20;
  int v21;
  int v22;
  int v23;
  void *v24;
  int v25;
  BOOL v26;
  char v27;
  double v28;
  double v29;
  double v30;
  void *v32;

  v7 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v11 = 0;
    goto LABEL_31;
  }
  v8 = v7;
  -[BMSiriUIEvent sessionID](self, "sessionID");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v9)
  {
    objc_msgSend(v8, "sessionID");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v3)
    {
      v10 = 1;
LABEL_8:

      goto LABEL_9;
    }
  }
  -[BMSiriUIEvent sessionID](self, "sessionID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "sessionID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v4, "isEqual:", v5);

  if (!v9)
    goto LABEL_8;
LABEL_9:

  -[BMSiriUIEvent UUID](self, "UUID");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v12)
  {
    objc_msgSend(v8, "UUID");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v4)
    {
      v14 = 1;
LABEL_14:

      goto LABEL_15;
    }
  }
  -[BMSiriUIEvent UUID](self, "UUID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "UUID");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v5, "isEqual:", v13);

  if (!v12)
    goto LABEL_14;
LABEL_15:

  -[BMSiriUIEvent viewMode](self, "viewMode");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v15)
  {
    objc_msgSend(v8, "viewMode");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v5)
    {
      v18 = 1;
LABEL_20:

      goto LABEL_21;
    }
  }
  -[BMSiriUIEvent viewMode](self, "viewMode");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "viewMode");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v16, "isEqual:", v17);

  if (!v15)
    goto LABEL_20;
LABEL_21:

  -[BMSiriUIEvent dismissalReason](self, "dismissalReason");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  if (v19 || (objc_msgSend(v8, "dismissalReason"), (v32 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
  {
    -[BMSiriUIEvent dismissalReason](self, "dismissalReason");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "dismissalReason");
    v21 = v18;
    v22 = v14;
    v23 = v10;
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = objc_msgSend(v20, "isEqual:", v24);

    v10 = v23;
    v14 = v22;
    v18 = v21;

    if (v19)
      goto LABEL_27;
  }
  else
  {
    v32 = 0;
    v25 = 1;
  }

LABEL_27:
  v26 = -[BMSiriUIEvent isStarting](self, "isStarting");
  v27 = objc_msgSend(v8, "isStarting");
  -[BMSiriUIEvent absoluteTimestamp](self, "absoluteTimestamp");
  v29 = v28;
  objc_msgSend(v8, "absoluteTimestamp");
  v11 = 0;
  if ((v10 & v14 & v18) == 1 && v25)
    v11 = (v29 == v30) & ~(v26 ^ v27);

LABEL_31:
  return v11;
}

- (NSString)sessionID
{
  return self->_sessionID;
}

- (NSString)UUID
{
  return self->_UUID;
}

- (NSString)viewMode
{
  return self->_viewMode;
}

- (NSString)dismissalReason
{
  return self->_dismissalReason;
}

- (BOOL)isStarting
{
  return self->_starting;
}

- (void)setStarting:(BOOL)a3
{
  self->_starting = a3;
}

- (double)absoluteTimestamp
{
  return self->_absoluteTimestamp;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dismissalReason, 0);
  objc_storeStrong((id *)&self->_viewMode, 0);
  objc_storeStrong((id *)&self->_UUID, 0);
  objc_storeStrong((id *)&self->_sessionID, 0);
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
  _os_log_fault_impl(&dword_18D810000, a2, OS_LOG_TYPE_FAULT, "%@: tried to initialize with a non-BMPBSiriUIEvent proto", (uint8_t *)&v5, 0xCu);

}

@end
