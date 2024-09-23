@implementation BMDSLTumblingWindowAssigner

- (BMDSLTumblingWindowAssigner)initWithInterval:(double)a3 timestampKeyPaths:(id)a4 aggregator:(id)a5 name:(id)a6 version:(unsigned int)a7
{
  uint64_t v7;
  id v11;
  id v12;
  BMDSLTumblingWindowAssigner *v13;
  BMDSLTumblingWindowAssigner *v14;
  uint64_t v15;
  NSArray *timestampKeyPaths;
  BMDSLTumblingWindowAssigner *v17;
  NSObject *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  objc_super v26;

  v7 = *(_QWORD *)&a7;
  v11 = a4;
  v12 = a5;
  if ((_DWORD)v7 == 1)
  {
    v26.receiver = self;
    v26.super_class = (Class)BMDSLTumblingWindowAssigner;
    v13 = -[BMDSLBaseCodable initWithName:version:](&v26, sel_initWithName_version_, CFSTR("tumblingAssigner"), 1);
    v14 = v13;
    if (v13)
    {
      v13->_interval = a3;
      objc_storeStrong((id *)&v13->_aggregator, a5);
      v15 = objc_msgSend(v11, "copy");
      timestampKeyPaths = v14->_timestampKeyPaths;
      v14->_timestampKeyPaths = (NSArray *)v15;

    }
    self = v14;
    v17 = self;
  }
  else
  {
    __biome_log_for_category();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      -[BMDSLTumblingWindowAssigner initWithInterval:timestampKeyPaths:aggregator:name:version:].cold.1(v7, v18, v19, v20, v21, v22, v23, v24);

    v17 = 0;
  }

  return v17;
}

- (BMDSLTumblingWindowAssigner)initWithInterval:(double)a3 timestampKeyPaths:(id)a4 aggregator:(id)a5
{
  return -[BMDSLTumblingWindowAssigner initWithInterval:timestampKeyPaths:aggregator:name:version:](self, "initWithInterval:timestampKeyPaths:aggregator:name:version:", a4, a5, CFSTR("tumblingAssigner"), 1, a3);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)BMDSLTumblingWindowAssigner;
  -[BMDSLBaseCodable encodeWithCoder:](&v10, sel_encodeWithCoder_, v4);
  v5 = (void *)MEMORY[0x1E0CB37E8];
  -[BMDSLTumblingWindowAssigner interval](self, "interval");
  objc_msgSend(v5, "numberWithDouble:");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("interval"));

  -[BMDSLTumblingWindowAssigner timestampKeyPaths](self, "timestampKeyPaths");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("timestampKeyPaths"));

  -[BMDSLTumblingWindowAssigner aggregator](self, "aggregator");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    -[BMDSLTumblingWindowAssigner aggregator](self, "aggregator");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "encodeObject:forKey:", v9, CFSTR("aggregator"));

  }
}

- (BMDSLTumblingWindowAssigner)initWithCoder:(id)a3
{
  id v4;
  BMDSLTumblingWindowAssigner *v5;
  void *v6;
  double v7;
  double v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  objc_super v14;

  v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)BMDSLTumblingWindowAssigner;
  v5 = -[BMDSLBaseCodable initWithCoder:](&v14, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("interval"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "doubleValue");
    v8 = v7;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("aggregator"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    +[BMDSLClasses allowed](BMDSLClasses, "allowed");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v10, CFSTR("timestampKeyPaths"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    -[BMDSLBaseCodable name](v5, "name");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = -[BMDSLTumblingWindowAssigner initWithInterval:timestampKeyPaths:aggregator:name:version:](v5, "initWithInterval:timestampKeyPaths:aggregator:name:version:", v11, v9, v12, -[BMDSLBaseCodable version](v5, "version"), v8);

  }
  return v5;
}

- (double)interval
{
  return self->_interval;
}

- (void)setInterval:(double)a3
{
  self->_interval = a3;
}

- (BMDSLAggregator)aggregator
{
  return self->_aggregator;
}

- (void)setAggregator:(id)a3
{
  objc_storeStrong((id *)&self->_aggregator, a3);
}

- (NSArray)timestampKeyPaths
{
  return self->_timestampKeyPaths;
}

- (void)setTimestampKeyPaths:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timestampKeyPaths, 0);
  objc_storeStrong((id *)&self->_aggregator, 0);
}

- (id)bpsWindowAssigner
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  _QWORD v8[5];

  -[BMDSLTumblingWindowAssigner aggregator](self, "aggregator");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bpsAggregator");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4)
    v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02438]), "initWithAccumulator:closure:", 0, &__block_literal_global);
  v5 = objc_alloc(MEMORY[0x1E0D02488]);
  -[BMDSLTumblingWindowAssigner interval](self, "interval");
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __59__BMDSLTumblingWindowAssigner_BPSPubSub__bpsWindowAssigner__block_invoke_2;
  v8[3] = &unk_1E5E36498;
  v8[4] = self;
  v6 = (void *)objc_msgSend(v5, "initWithInterval:timestamp:aggregator:", v8, v4);

  return v6;
}

id __59__BMDSLTumblingWindowAssigner_BPSPubSub__bpsWindowAssigner__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;

  v4 = a2;
  v5 = a3;
  if (!v4)
    v4 = (id)objc_msgSend(MEMORY[0x1E0C9AA60], "mutableCopy");
  objc_msgSend(v4, "addObject:", v5);

  return v4;
}

id __59__BMDSLTumblingWindowAssigner_BPSPubSub__bpsWindowAssigner__block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  NSString *v9;
  void *v10;
  void *v11;
  double v12;
  double v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  objc_msgSend(*(id *)(a1 + 32), "timestampKeyPaths", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v16;
    while (2)
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v16 != v7)
          objc_enumerationMutation(v4);
        v9 = *(NSString **)(*((_QWORD *)&v15 + 1) + 8 * i);
        NSSelectorFromString(v9);
        if ((objc_opt_respondsToSelector() & 1) != 0)
        {
          objc_msgSend(v3, "valueForKey:", v9);
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "doubleValue");
          v13 = v12;

          objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceReferenceDate:", v13);
          v10 = (void *)objc_claimAutoreleasedReturnValue();

          goto LABEL_11;
        }
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      if (v6)
        continue;
      break;
    }
  }

  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_11:

  return v10;
}

- (void)initWithInterval:(uint64_t)a3 timestampKeyPaths:(uint64_t)a4 aggregator:(uint64_t)a5 name:(uint64_t)a6 version:(uint64_t)a7 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_1AEB18000, a2, a3, "Unexpected version %u. Failed to initialize BMDSLTumblingWindowAssigner", a5, a6, a7, a8, 0);
}

@end
