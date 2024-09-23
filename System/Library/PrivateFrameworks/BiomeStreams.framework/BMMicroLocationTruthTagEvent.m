@implementation BMMicroLocationTruthTagEvent

- (BMMicroLocationTruthTagEvent)initWithAbsoluteTimestamp:(double)a3 clientBundleIdentifier:(id)a4 truthTagIdentifier:(id)a5 recordingRequestIdentifier:(id)a6
{
  id v10;
  id v11;
  id v12;
  BMMicroLocationTruthTagEvent *v13;
  BMMicroLocationTruthTagEvent *v14;
  uint64_t v15;
  NSString *clientBundleIdentifier;
  uint64_t v17;
  NSUUID *truthTagIdentifier;
  uint64_t v19;
  NSUUID *recordingRequestIdentifier;
  objc_super v22;

  v10 = a4;
  v11 = a5;
  v12 = a6;
  v22.receiver = self;
  v22.super_class = (Class)BMMicroLocationTruthTagEvent;
  v13 = -[BMMicroLocationTruthTagEvent init](&v22, sel_init);
  v14 = v13;
  if (v13)
  {
    v13->_absoluteTimestamp = a3;
    v15 = objc_msgSend(v10, "copy");
    clientBundleIdentifier = v14->_clientBundleIdentifier;
    v14->_clientBundleIdentifier = (NSString *)v15;

    v17 = objc_msgSend(v11, "copy");
    truthTagIdentifier = v14->_truthTagIdentifier;
    v14->_truthTagIdentifier = (NSUUID *)v17;

    v19 = objc_msgSend(v12, "copy");
    recordingRequestIdentifier = v14->_recordingRequestIdentifier;
    v14->_recordingRequestIdentifier = (NSUUID *)v19;

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
      +[BMMicroLocationTruthTagEvent eventWithData:dataVersion:].cold.1(a4, v8);

    v7 = 0;
  }

  return v7;
}

- (id)encodeAsProto
{
  void *v2;
  void *v3;

  -[BMMicroLocationTruthTagEvent proto](self, "proto");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "data");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (BMMicroLocationTruthTagEvent)initWithProto:(id)a3
{
  id v4;
  id v5;
  double v6;
  double v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  BMMicroLocationTruthTagEvent *v15;
  NSObject *v16;

  v4 = a3;
  if (!v4)
  {
LABEL_7:
    v15 = 0;
    goto LABEL_8;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    __biome_log_for_category();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_FAULT))
      -[BMMicroLocationTruthTagEvent initWithProto:].cold.1((uint64_t)self, v16);

    goto LABEL_7;
  }
  v5 = v4;
  objc_msgSend(v5, "absoluteTimestamp");
  v7 = v6;
  objc_msgSend(v5, "clientBundleId");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_alloc(MEMORY[0x1E0CB3A28]);
  objc_msgSend(v5, "truthTagIdentifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend(v9, "initWithUUIDString:", v10);
  v12 = objc_alloc(MEMORY[0x1E0CB3A28]);
  objc_msgSend(v5, "recordingRequestIdentifier");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = (void *)objc_msgSend(v12, "initWithUUIDString:", v13);
  self = -[BMMicroLocationTruthTagEvent initWithAbsoluteTimestamp:clientBundleIdentifier:truthTagIdentifier:recordingRequestIdentifier:](self, "initWithAbsoluteTimestamp:clientBundleIdentifier:truthTagIdentifier:recordingRequestIdentifier:", v8, v11, v14, v7);

  v15 = self;
LABEL_8:

  return v15;
}

- (BMMicroLocationTruthTagEvent)initWithProtoData:(id)a3
{
  id v4;
  BMPBMicroLocationTruthTagEvent *v5;
  BMMicroLocationTruthTagEvent *v6;

  if (a3)
  {
    v4 = a3;
    v5 = -[BMPBMicroLocationTruthTagEvent initWithData:]([BMPBMicroLocationTruthTagEvent alloc], "initWithData:", v4);

    self = -[BMMicroLocationTruthTagEvent initWithProto:](self, "initWithProto:", v5);
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
  objc_msgSend(v3, "setAbsoluteTimestamp:", self->_absoluteTimestamp);
  objc_msgSend(v3, "setClientBundleId:", self->_clientBundleIdentifier);
  -[NSUUID UUIDString](self->_truthTagIdentifier, "UUIDString");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setTruthTagIdentifier:", v4);

  -[NSUUID UUIDString](self->_recordingRequestIdentifier, "UUIDString");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setRecordingRequestIdentifier:", v5);

  return v3;
}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  NSUInteger v5;
  uint64_t v6;
  unint64_t v7;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_absoluteTimestamp);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");
  v5 = -[NSString hash](self->_clientBundleIdentifier, "hash");
  v6 = v5 ^ -[NSUUID hash](self->_truthTagIdentifier, "hash");
  v7 = v6 ^ -[NSUUID hash](self->_recordingRequestIdentifier, "hash") ^ v4;

  return v7;
}

- (BOOL)isEqual:(id)a3
{
  void *v3;
  void *v4;
  id v6;
  id v7;
  double absoluteTimestamp;
  double v9;
  double v10;
  NSString *clientBundleIdentifier;
  NSString *v12;
  char v13;
  char v14;
  NSUUID *truthTagIdentifier;
  NSUUID *v16;
  void *v17;
  char v18;
  double v19;
  NSUUID *recordingRequestIdentifier;
  NSUUID *v21;
  void *v22;
  char v23;
  char v24;

  v6 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v14 = 0;
    goto LABEL_28;
  }
  v7 = v6;
  absoluteTimestamp = self->_absoluteTimestamp;
  objc_msgSend(v7, "absoluteTimestamp");
  v10 = v9;
  clientBundleIdentifier = self->_clientBundleIdentifier;
  v12 = clientBundleIdentifier;
  if (clientBundleIdentifier)
  {
LABEL_5:
    objc_msgSend(v7, "clientBundleIdentifier");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = -[NSString isEqualToString:](v12, "isEqualToString:", v4);

    if (clientBundleIdentifier)
      goto LABEL_10;
    goto LABEL_9;
  }
  objc_msgSend(v7, "clientBundleIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v12 = self->_clientBundleIdentifier;
    goto LABEL_5;
  }
  v13 = 1;
LABEL_9:

LABEL_10:
  truthTagIdentifier = self->_truthTagIdentifier;
  v16 = truthTagIdentifier;
  if (truthTagIdentifier)
    goto LABEL_13;
  objc_msgSend(v7, "truthTagIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v16 = self->_truthTagIdentifier;
LABEL_13:
    objc_msgSend(v7, "truthTagIdentifier");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = -[NSUUID isEqual:](v16, "isEqual:", v17);

    if (truthTagIdentifier)
      goto LABEL_17;
    goto LABEL_16;
  }
  v18 = 1;
LABEL_16:

LABEL_17:
  v19 = vabdd_f64(absoluteTimestamp, v10);
  recordingRequestIdentifier = self->_recordingRequestIdentifier;
  v21 = recordingRequestIdentifier;
  if (!recordingRequestIdentifier)
  {
    objc_msgSend(v7, "recordingRequestIdentifier");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v4)
    {
      v23 = 1;
LABEL_23:

      goto LABEL_24;
    }
    v21 = self->_recordingRequestIdentifier;
  }
  objc_msgSend(v7, "recordingRequestIdentifier");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = -[NSUUID isEqual:](v21, "isEqual:", v22);

  if (!recordingRequestIdentifier)
    goto LABEL_23;
LABEL_24:
  if (v19 < 2.22044605e-16)
    v24 = v13;
  else
    v24 = 0;
  v14 = v24 & v18 & v23;

LABEL_28:
  return v14;
}

- (double)absoluteTimestamp
{
  return self->_absoluteTimestamp;
}

- (NSString)clientBundleIdentifier
{
  return self->_clientBundleIdentifier;
}

- (NSUUID)truthTagIdentifier
{
  return self->_truthTagIdentifier;
}

- (NSUUID)recordingRequestIdentifier
{
  return self->_recordingRequestIdentifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_recordingRequestIdentifier, 0);
  objc_storeStrong((id *)&self->_truthTagIdentifier, 0);
  objc_storeStrong((id *)&self->_clientBundleIdentifier, 0);
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
  _os_log_error_impl(&dword_18D810000, a2, OS_LOG_TYPE_ERROR, "BMMicroLocationTruthTagEvent: Mismatched data version (%u != %u) cannot deserialize", (uint8_t *)v2, 0xEu);
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
  _os_log_fault_impl(&dword_18D810000, a2, OS_LOG_TYPE_FAULT, "%@: tried to initialize with a non-BMPBMicroLocationTruthTagEvent proto", (uint8_t *)&v5, 0xCu);

}

@end
