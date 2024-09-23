@implementation BMMicroLocationProbabilityPerLabel

- (BMMicroLocationProbabilityPerLabel)initWithLabelIdentifier:(id)a3 probability:(double)a4
{
  id v6;
  BMMicroLocationProbabilityPerLabel *v7;
  uint64_t v8;
  NSUUID *labelIdentifier;
  objc_super v11;

  v6 = a3;
  v11.receiver = self;
  v11.super_class = (Class)BMMicroLocationProbabilityPerLabel;
  v7 = -[BMMicroLocationProbabilityPerLabel init](&v11, sel_init);
  if (v7)
  {
    v8 = objc_msgSend(v6, "copy");
    labelIdentifier = v7->_labelIdentifier;
    v7->_labelIdentifier = (NSUUID *)v8;

    v7->_probability = a4;
  }

  return v7;
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
      +[BMMicroLocationProbabilityPerLabel eventWithData:dataVersion:].cold.1();

    v7 = 0;
  }

  return v7;
}

- (id)encodeAsProto
{
  void *v2;
  void *v3;

  -[BMMicroLocationProbabilityPerLabel proto](self, "proto");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "data");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (BMMicroLocationProbabilityPerLabel)initWithProto:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  void *v7;
  void *v8;
  BMMicroLocationProbabilityPerLabel *v9;
  NSObject *v10;

  v4 = a3;
  if (v4)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      if (-[NSObject hasLabel](v5, "hasLabel")
        && (-[NSObject hasProbability](v5, "hasProbability") & 1) != 0)
      {
        v6 = objc_alloc(MEMORY[0x1E0CB3A28]);
        -[NSObject label](v5, "label");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        v8 = (void *)objc_msgSend(v6, "initWithUUIDString:", v7);
        -[NSObject probability](v5, "probability");
        self = -[BMMicroLocationProbabilityPerLabel initWithLabelIdentifier:probability:](self, "initWithLabelIdentifier:probability:", v8);

        v9 = self;
LABEL_13:

        goto LABEL_14;
      }
      __biome_log_for_category();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT))
        -[BMMicroLocationProbabilityPerLabel initWithProto:].cold.1();

    }
    else
    {
      __biome_log_for_category();
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT))
        -[BMMicroLocationProbabilityPerLabel initWithProto:].cold.2();
    }
    v9 = 0;
    goto LABEL_13;
  }
  v9 = 0;
LABEL_14:

  return v9;
}

- (BMMicroLocationProbabilityPerLabel)initWithProtoData:(id)a3
{
  id v4;
  BMPBProbabilityPerLabel *v5;
  BMMicroLocationProbabilityPerLabel *v6;

  if (a3)
  {
    v4 = a3;
    v5 = -[BMPBProbabilityPerLabel initWithData:]([BMPBProbabilityPerLabel alloc], "initWithData:", v4);

    self = -[BMMicroLocationProbabilityPerLabel initWithProto:](self, "initWithProto:", v5);
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

  v3 = (void *)objc_opt_new();
  -[NSUUID UUIDString](self->_labelIdentifier, "UUIDString");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setLabel:", v4);

  objc_msgSend(v3, "setProbability:", self->_probability);
  return v3;
}

- (unint64_t)hash
{
  uint64_t v3;
  void *v4;
  unint64_t v5;

  v3 = -[NSUUID hash](self->_labelIdentifier, "hash");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_probability);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "hash") ^ v3;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  void *v3;
  void *v4;
  id v6;
  id v7;
  void *v8;
  NSUUID *labelIdentifier;
  NSUUID *v10;
  int v11;
  BOOL v12;
  double probability;
  double v14;

  v6 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v12 = 0;
    goto LABEL_15;
  }
  v7 = v6;
  v8 = v7;
  labelIdentifier = self->_labelIdentifier;
  v10 = labelIdentifier;
  if (!labelIdentifier)
  {
    objc_msgSend(v7, "labelIdentifier");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v3)
    {
      v11 = 0;
      goto LABEL_10;
    }
    v10 = self->_labelIdentifier;
  }
  objc_msgSend(v8, "labelIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!-[NSUUID isEqual:](v10, "isEqual:", v4))
  {
    v12 = 0;
LABEL_11:

    goto LABEL_12;
  }
  v11 = 1;
LABEL_10:
  probability = self->_probability;
  objc_msgSend(v8, "probability");
  v12 = vabdd_f64(probability, v14) < 2.22044605e-16;
  if (v11)
    goto LABEL_11;
LABEL_12:
  if (!labelIdentifier)

LABEL_15:
  return v12;
}

- (NSUUID)labelIdentifier
{
  return self->_labelIdentifier;
}

- (double)probability
{
  return self->_probability;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_labelIdentifier, 0);
}

+ (void)eventWithData:dataVersion:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_1_3();
  OUTLINED_FUNCTION_4(&dword_18D810000, v0, v1, "BMMicroLocationProbabilityPerLabel: Mismatched data versions (%u != %u) cannot deserialize", v2, v3, v4, v5, v6);
}

- (void)initWithProto:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_0_2(&dword_18D810000, v0, v1, "BMMicroLocationProbabilityPerLabel: tried to initialize with a proto missing required data.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)initWithProto:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_0_2(&dword_18D810000, v0, v1, "BMMicroLocationProbabilityPerLabel: tried to initialize with a non-BMMicroLocationProbabilityPerLabel proto", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

@end
