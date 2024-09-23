@implementation BMAppLaunchEvent

- (id)encodeAsProto
{
  void *v2;
  void *v3;

  -[BMAppLaunchEvent proto](self, "proto");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "data");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)proto
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  unint64_t v10;
  id v11;
  NSObject *v12;

  v3 = (void *)objc_opt_new();
  objc_msgSend(v3, "setStarting:", -[BMAppLaunchEvent isStarting](self, "isStarting"));
  -[BMAppLaunchEvent bundleID](self, "bundleID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setBundleID:", v4);

  -[BMAppLaunchEvent absoluteTimestamp](self, "absoluteTimestamp");
  objc_msgSend(v3, "setAbsoluteTimestamp:");
  -[BMAppLaunchEvent duration](self, "duration");
  objc_msgSend(v3, "setDuration:");
  -[BMAppLaunchEvent launchReason](self, "launchReason");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setLaunchReason:", v5);

  -[BMAppLaunchEvent parentBundleID](self, "parentBundleID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setParentBundleID:", v6);

  -[BMAppLaunchEvent extensionHostID](self, "extensionHostID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setExtensionHostID:", v7);

  -[BMAppLaunchEvent shortVersionString](self, "shortVersionString");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setShortVersionString:", v8);

  -[BMAppLaunchEvent exactVersionString](self, "exactVersionString");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setExactVersionString:", v9);

  v10 = -[BMAppLaunchEvent launchType](self, "launchType");
  if (v10 >= 4)
  {
    __biome_log_for_category();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      -[BMAppLaunchEvent proto].cold.1(v10);

    v11 = 0;
  }
  else
  {
    objc_msgSend(v3, "setLaunchType:", v10);
    v11 = v3;
  }

  return v11;
}

+ (id)eventWithData:(id)a3 dataVersion:(unsigned int)a4
{
  id v6;
  objc_class *v7;
  void *v8;
  NSObject *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;

  v6 = a3;
  if (a4 == 9)
  {
LABEL_10:
    v8 = 0;
    goto LABEL_11;
  }
  if (a4 == 10)
  {
    v7 = (objc_class *)a1;
    goto LABEL_6;
  }
  if (a4 != 11)
  {
    __biome_log_for_category();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      +[BMAppLaunchEvent eventWithData:dataVersion:].cold.1(v9, v10, v11, v12, v13, v14, v15, v16);

    goto LABEL_10;
  }
  v7 = (objc_class *)BMAppLaunchEvent_v11;
LABEL_6:
  v8 = (void *)objc_msgSend([v7 alloc], "initWithProtoData:", v6);
LABEL_11:

  return v8;
}

- (BMAppLaunchEvent)initWithProtoData:(id)a3
{
  id v4;
  BMPBAppLaunchEvent *v5;
  BMAppLaunchEvent *v6;

  if (a3)
  {
    v4 = a3;
    v5 = -[BMPBAppLaunchEvent initWithData:]([BMPBAppLaunchEvent alloc], "initWithData:", v4);

    self = -[BMAppLaunchEvent initWithProto:](self, "initWithProto:", v5);
    v6 = self;
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (BMAppLaunchEvent)initWithProto:(id)a3
{
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  BMAppLaunchEvent *v8;
  NSObject *v9;
  NSObject *v10;
  uint64_t v11;
  double v12;
  double v13;
  double v14;
  double v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v22;

  v4 = a3;
  if (v4)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      v6 = objc_msgSend(v5, "launchType");
      v7 = v6;
      if (v6 >= 4)
      {
        __biome_log_for_category();
        v10 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
          -[BMAppLaunchEvent initWithProto:].cold.1(v7);

        v22 = 0;
      }
      else
      {
        v22 = v6;
      }
      v11 = objc_msgSend(v5, "starting");
      objc_msgSend(v5, "bundleID");
      v9 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "absoluteTimestamp");
      v13 = v12;
      objc_msgSend(v5, "duration");
      v15 = v14;
      objc_msgSend(v5, "launchReason");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "parentBundleID");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "extensionHostID");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "shortVersionString");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "exactVersionString");
      v20 = (void *)objc_claimAutoreleasedReturnValue();

      self = -[BMAppLaunchEvent initWithStarting:bundleID:absoluteTimeStamp:duration:launchReason:launchType:parentBundleID:extensionHostID:shortVersionString:exactBundleVersion:](self, "initWithStarting:bundleID:absoluteTimeStamp:duration:launchReason:launchType:parentBundleID:extensionHostID:shortVersionString:exactBundleVersion:", v11, v9, v16, v22, v17, v18, v13, v15, v19, v20);
      v8 = self;
    }
    else
    {
      __biome_log_for_category();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT))
        -[BMAppLaunchEvent initWithProto:].cold.2();
      v8 = 0;
    }

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (BMAppLaunchEvent)initWithStarting:(BOOL)a3 bundleID:(id)a4 absoluteTimeStamp:(double)a5 duration:(double)a6 launchReason:(id)a7 launchType:(unint64_t)a8 parentBundleID:(id)a9 extensionHostID:(id)a10 shortVersionString:(id)a11 exactBundleVersion:(id)a12
{
  _BOOL4 v18;
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  id v25;
  BMAppLaunchEvent *v26;
  BMEventTimeElapsingImplementor *v27;
  BMEventBinarySteppingImplementor *v28;
  id v29;
  id v30;
  id v31;
  id v32;
  BMEventAppAssociatingImplementor *v33;
  id v34;
  void *v35;
  _BOOL4 v37;
  unint64_t v38;
  id v39;
  objc_super v40;
  _QWORD v41[4];

  v18 = a3;
  v41[3] = *MEMORY[0x1E0C80C00];
  v20 = a4;
  v21 = a7;
  v22 = a9;
  v23 = a10;
  v24 = a11;
  v25 = a12;
  v40.receiver = self;
  v40.super_class = (Class)BMAppLaunchEvent;
  v26 = -[BMEventBase init](&v40, sel_init);
  if (v26)
  {
    v27 = objc_alloc_init(BMEventTimeElapsingImplementor);
    v41[0] = v27;
    v39 = v24;
    v28 = objc_alloc_init(BMEventBinarySteppingImplementor);
    v41[1] = v28;
    v38 = a8;
    v29 = v23;
    v30 = v22;
    v31 = v21;
    v32 = v20;
    v33 = objc_alloc_init(BMEventAppAssociatingImplementor);
    v41[2] = v33;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v41, 3);
    v37 = v18;
    v34 = v25;
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    -[BMEventBase set_validators:](v26, "set_validators:", v35);

    v25 = v34;
    v20 = v32;
    v21 = v31;
    v22 = v30;
    v23 = v29;

    v24 = v39;
    -[BMAppLaunchEvent setAbsoluteTimestamp:](v26, "setAbsoluteTimestamp:", a5);
    -[BMAppLaunchEvent setStarting:](v26, "setStarting:", v37);
    -[BMAppLaunchEvent setBundleID:](v26, "setBundleID:", v20);
    -[BMAppLaunchEvent setDuration:](v26, "setDuration:", a6);
    -[BMAppLaunchEvent setLaunchReason:](v26, "setLaunchReason:", v21);
    -[BMAppLaunchEvent setLaunchType:](v26, "setLaunchType:", v38);
    -[BMAppLaunchEvent setParentBundleID:](v26, "setParentBundleID:", v22);
    -[BMAppLaunchEvent setExtensionHostID:](v26, "setExtensionHostID:", v29);
    -[BMAppLaunchEvent setShortVersionString:](v26, "setShortVersionString:", v39);
    -[BMAppLaunchEvent setExactVersionString:](v26, "setExactVersionString:", v34);
  }

  return v26;
}

- (void)setShortVersionString:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (void)setParentBundleID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (void)setLaunchType:(unint64_t)a3
{
  self->_launchType = a3;
}

- (void)setLaunchReason:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (void)setExtensionHostID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (void)setExactVersionString:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (NSString)shortVersionString
{
  return self->_shortVersionString;
}

- (NSString)parentBundleID
{
  return self->_parentBundleID;
}

- (unint64_t)launchType
{
  return self->_launchType;
}

- (NSString)launchReason
{
  return self->_launchReason;
}

- (NSString)extensionHostID
{
  return self->_extensionHostID;
}

- (NSString)exactVersionString
{
  return self->_exactVersionString;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_exactVersionString, 0);
  objc_storeStrong((id *)&self->_shortVersionString, 0);
  objc_storeStrong((id *)&self->_extensionHostID, 0);
  objc_storeStrong((id *)&self->_parentBundleID, 0);
  objc_storeStrong((id *)&self->_launchReason, 0);
}

- (BMAppLaunchEvent)initWithStarting:(BOOL)a3 bundleId:(id)a4 absoluteTimeStamp:(double)a5 launchReason:(id)a6 launchType:(unint64_t)a7
{
  return -[BMAppLaunchEvent initWithStarting:bundleID:absoluteTimeStamp:launchReason:launchType:parentBundleID:extensionHostID:](self, "initWithStarting:bundleID:absoluteTimeStamp:launchReason:launchType:parentBundleID:extensionHostID:", a3, a4, a6, a7, 0, 0, a5);
}

- (BMAppLaunchEvent)initWithStarting:(BOOL)a3 bundleID:(id)a4 absoluteTimeStamp:(double)a5 launchReason:(id)a6 launchType:(unint64_t)a7 parentBundleID:(id)a8 extensionHostID:(id)a9
{
  return -[BMAppLaunchEvent initWithStarting:bundleID:absoluteTimeStamp:duration:launchReason:launchType:parentBundleID:extensionHostID:](self, "initWithStarting:bundleID:absoluteTimeStamp:duration:launchReason:launchType:parentBundleID:extensionHostID:", a3, a4, a6, a7, a8, a9, a5, 0.0);
}

- (BMAppLaunchEvent)initWithStarting:(BOOL)a3 bundleID:(id)a4 absoluteTimeStamp:(double)a5 duration:(double)a6 launchReason:(id)a7 launchType:(unint64_t)a8 parentBundleID:(id)a9 extensionHostID:(id)a10
{
  return -[BMAppLaunchEvent initWithStarting:bundleID:absoluteTimeStamp:duration:launchReason:launchType:parentBundleID:extensionHostID:shortVersionString:exactBundleVersion:](self, "initWithStarting:bundleID:absoluteTimeStamp:duration:launchReason:launchType:parentBundleID:extensionHostID:shortVersionString:exactBundleVersion:", a3, a4, a7, a8, a9, a10, a5, 0.0, 0, 0);
}

- (BMAppLaunchEvent)initWithStarting:(BOOL)a3 bundleID:(id)a4 absoluteTimeStamp:(double)a5 launchReason:(id)a6 launchType:(unint64_t)a7 parentBundleID:(id)a8 extensionHostID:(id)a9 shortVersionString:(id)a10 exactBundleVersion:(id)a11
{
  return -[BMAppLaunchEvent initWithStarting:bundleID:absoluteTimeStamp:duration:launchReason:launchType:parentBundleID:extensionHostID:shortVersionString:exactBundleVersion:](self, "initWithStarting:bundleID:absoluteTimeStamp:duration:launchReason:launchType:parentBundleID:extensionHostID:shortVersionString:exactBundleVersion:", a3, a4, a6, a7, a8, a9, a5, 0.0);
}

- (unsigned)dataVersion
{
  return 10;
}

- (id)jsonDict
{
  uint64_t v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  _QWORD v23[9];
  _QWORD v24[11];

  v24[9] = *MEMORY[0x1E0C80C00];
  v23[0] = CFSTR("bundleId");
  -[BMAppLaunchEvent bundleID](self, "bundleID");
  v3 = objc_claimAutoreleasedReturnValue();
  v22 = (void *)v3;
  if (!v3)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v3 = objc_claimAutoreleasedReturnValue();
  }
  v18 = (void *)v3;
  v24[0] = v3;
  v23[1] = CFSTR("isStart");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[BMAppLaunchEvent isStarting](self, "isStarting"));
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v24[1] = v21;
  v23[2] = CFSTR("time");
  v4 = (void *)MEMORY[0x1E0CB37E8];
  -[BMAppLaunchEvent absoluteTimestamp](self, "absoluteTimestamp");
  objc_msgSend(v4, "numberWithDouble:");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v24[2] = v20;
  v23[3] = CFSTR("launchReason");
  -[BMAppLaunchEvent launchReason](self, "launchReason");
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = (void *)v5;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v5 = objc_claimAutoreleasedReturnValue();
  }
  v24[3] = v5;
  v23[4] = CFSTR("launchType");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[BMAppLaunchEvent launchType](self, "launchType", v5));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v24[4] = v19;
  v23[5] = CFSTR("parentBundleID");
  -[BMAppLaunchEvent parentBundleID](self, "parentBundleID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v24[5] = v8;
  v23[6] = CFSTR("extensionHostID");
  -[BMAppLaunchEvent extensionHostID](self, "extensionHostID");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (!v9)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v24[6] = v10;
  v23[7] = CFSTR("shortVersionString");
  -[BMAppLaunchEvent shortVersionString](self, "shortVersionString");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v11;
  if (!v11)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v24[7] = v12;
  v23[8] = CFSTR("exactVersionString");
  -[BMAppLaunchEvent exactVersionString](self, "exactVersionString");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v13;
  if (!v13)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v24[8] = v14;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v24, v23, 9);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v13)

  if (!v11)
  if (!v9)

  if (!v7)
  if (!v6)

  if (!v22)
  return v15;
}

- (id)json
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v15;

  v2 = (void *)MEMORY[0x1E0CB36D8];
  -[BMAppLaunchEvent jsonDict](self, "jsonDict");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = 0;
  objc_msgSend(v2, "dataWithJSONObject:options:error:", v3, 1, &v15);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v15;

  if (v5)
  {
    __biome_log_for_category();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      -[BMAppLaunchEvent json].cold.1(v6, v7, v8, v9, v10, v11, v12, v13);

  }
  return v4;
}

- (NSString)description
{
  void *v2;
  void *v3;

  -[BMAppLaunchEvent jsonDict](self, "jsonDict");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "description");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (BMAppLaunchEvent)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  BMAppLaunchEvent *v6;
  unint64_t v7;
  unint64_t v8;
  uint64_t v9;
  void *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  unint64_t v21;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("protoData"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v6 = -[BMAppLaunchEvent initWithProtoData:](self, "initWithProtoData:", v5);
  }
  else
  {
    v7 = objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("launchType"));
    if (v7 >= 4)
      v8 = 0;
    else
      v8 = v7;
    v21 = v8;
    v9 = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("starting"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("bundleID"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("absoluteTimestamp"));
    v12 = v11;
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("duration"));
    v14 = v13;
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("launchReason"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("parentBundleID"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("extensionHostID"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("shortVersionString"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("exactVersionString"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = -[BMAppLaunchEvent initWithStarting:bundleID:absoluteTimeStamp:duration:launchReason:launchType:parentBundleID:extensionHostID:shortVersionString:exactBundleVersion:](self, "initWithStarting:bundleID:absoluteTimeStamp:duration:launchReason:launchType:parentBundleID:extensionHostID:shortVersionString:exactBundleVersion:", v9, v10, v15, v21, v16, v17, v12, v14, v18, v19);

  }
  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[BMAppLaunchEvent encodeAsProto](self, "encodeAsProto");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("protoData"));

}

- (unint64_t)hash
{
  uint64_t v3;
  uint64_t v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  void *v21;
  unint64_t v22;
  void *v24;
  void *v25;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[BMAppLaunchEvent isStarting](self, "isStarting"));
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v25, "hash");
  -[BMAppLaunchEvent bundleID](self, "bundleID");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v24, "hash") ^ v3;
  v5 = (void *)MEMORY[0x1E0CB37E8];
  -[BMAppLaunchEvent absoluteTimestamp](self, "absoluteTimestamp");
  objc_msgSend(v5, "numberWithDouble:");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "hash");
  v8 = (void *)MEMORY[0x1E0CB37E8];
  -[BMAppLaunchEvent duration](self, "duration");
  objc_msgSend(v8, "numberWithDouble:");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v4 ^ v7 ^ objc_msgSend(v9, "hash");
  -[BMAppLaunchEvent launchReason](self, "launchReason");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "hash");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[BMAppLaunchEvent launchType](self, "launchType"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v12 ^ objc_msgSend(v13, "hash");
  -[BMAppLaunchEvent parentBundleID](self, "parentBundleID");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = v10 ^ v14 ^ objc_msgSend(v15, "hash");
  -[BMAppLaunchEvent extensionHostID](self, "extensionHostID");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v17, "hash");
  -[BMAppLaunchEvent shortVersionString](self, "shortVersionString");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = v18 ^ objc_msgSend(v19, "hash");
  -[BMAppLaunchEvent exactVersionString](self, "exactVersionString");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = v16 ^ v20 ^ objc_msgSend(v21, "hash");

  return v22;
}

- (BOOL)isEqual:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  id v7;
  id v8;
  char v9;
  char v10;
  void *v11;
  void *v12;
  char v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  char v27;
  char v28;
  void *v29;
  void *v30;
  void *v31;
  char v32;
  char v33;
  void *v34;
  void *v35;
  void *v36;
  char v37;
  char v38;
  char v39;
  char v41;
  uint64_t v42;
  unint64_t v43;
  char v44;
  char v45;

  v7 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v13 = 0;
    goto LABEL_46;
  }
  v8 = v7;
  v9 = -[BMAppLaunchEvent isStarting](self, "isStarting");
  v10 = objc_msgSend(v8, "isStarting");
  -[BMAppLaunchEvent bundleID](self, "bundleID");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v11)
  {
    objc_msgSend(v8, "bundleID");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v3)
    {
      v45 = 1;
LABEL_8:

      goto LABEL_9;
    }
  }
  -[BMAppLaunchEvent bundleID](self, "bundleID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "bundleID");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v45 = objc_msgSend(v4, "isEqual:", v12);

  if (!v11)
    goto LABEL_8;
LABEL_9:

  -[BMAppLaunchEvent absoluteTimestamp](self, "absoluteTimestamp");
  v15 = v14;
  objc_msgSend(v8, "absoluteTimestamp");
  v17 = v16;
  -[BMAppLaunchEvent duration](self, "duration");
  v19 = v18;
  objc_msgSend(v8, "duration");
  v21 = v20;
  -[BMAppLaunchEvent launchReason](self, "launchReason");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v22)
  {
    objc_msgSend(v8, "launchReason");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v3)
    {
      v44 = 1;
LABEL_14:

      goto LABEL_15;
    }
  }
  -[BMAppLaunchEvent launchReason](self, "launchReason");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "launchReason");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v44 = objc_msgSend(v4, "isEqual:", v23);

  if (!v22)
    goto LABEL_14;
LABEL_15:

  v43 = -[BMAppLaunchEvent launchType](self, "launchType");
  v42 = objc_msgSend(v8, "launchType");
  -[BMAppLaunchEvent parentBundleID](self, "parentBundleID");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v24)
  {
    objc_msgSend(v8, "parentBundleID");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v3)
    {
      v41 = 1;
LABEL_20:

      goto LABEL_21;
    }
  }
  -[BMAppLaunchEvent parentBundleID](self, "parentBundleID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "parentBundleID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v41 = objc_msgSend(v4, "isEqual:", v5);

  if (!v24)
    goto LABEL_20;
LABEL_21:

  -[BMAppLaunchEvent extensionHostID](self, "extensionHostID");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v25)
  {
    objc_msgSend(v8, "extensionHostID");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v4)
    {
      v27 = 1;
LABEL_26:

      goto LABEL_27;
    }
  }
  -[BMAppLaunchEvent extensionHostID](self, "extensionHostID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "extensionHostID");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = objc_msgSend(v5, "isEqual:", v26);

  if (!v25)
    goto LABEL_26;
LABEL_27:
  v28 = v9 ^ v10;

  -[BMAppLaunchEvent shortVersionString](self, "shortVersionString");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v29)
  {
    objc_msgSend(v8, "shortVersionString");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v5)
    {
      v32 = 1;
LABEL_32:

      goto LABEL_33;
    }
  }
  -[BMAppLaunchEvent shortVersionString](self, "shortVersionString");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "shortVersionString");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = objc_msgSend(v30, "isEqual:", v31);

  if (!v29)
    goto LABEL_32;
LABEL_33:
  v33 = v28 ^ 1;

  -[BMAppLaunchEvent exactVersionString](self, "exactVersionString");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v34)
  {
    objc_msgSend(v8, "exactVersionString");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v5)
    {
      v37 = 1;
LABEL_38:

      goto LABEL_39;
    }
  }
  -[BMAppLaunchEvent exactVersionString](self, "exactVersionString");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "exactVersionString");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  v37 = objc_msgSend(v35, "isEqual:", v36);

  if (!v34)
    goto LABEL_38;
LABEL_39:

  v38 = v33 & v45;
  if (v15 != v17)
    v38 = 0;
  if (v19 != v21)
    v38 = 0;
  v39 = v38 & v44;
  if (v43 != v42)
    v39 = 0;
  v13 = v39 & v41 & v27 & v32 & v37;

LABEL_46:
  return v13;
}

+ (void)eventWithData:(uint64_t)a3 dataVersion:(uint64_t)a4 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_6_0(&dword_18D810000, a1, a3, "Mismatched BMAppLaunchEvent data versions, cannot deserialize", a5, a6, a7, a8, 0);
}

- (void)json
{
  OUTLINED_FUNCTION_6_0(&dword_18D810000, a1, a3, "Unable to create json from object", a5, a6, a7, a8, 0);
}

- (void)initWithProto:(uint64_t)a1 .cold.1(uint64_t a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", a1);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_1_5(&dword_18D810000, v2, v3, "BMAppLaunchEvent: unable to convert BMPBAppLaunchType enum value: %@", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_0_0();
}

- (void)initWithProto:.cold.2()
{
  objc_class *v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  v0 = (objc_class *)objc_opt_class();
  NSStringFromClass(v0);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_1_2(&dword_18D810000, v2, v3, "%@: tried to initialize with a non-BMPBAppLaunchEvent proto", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_0_0();
}

- (void)proto
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a1);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_1_5(&dword_18D810000, v2, v3, "BMAppLaunchEvent: unable to convert BMAppLaunchType enum value: %@", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_0_0();
}

@end
