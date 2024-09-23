@implementation BMMicroLocationRestrictedLocalizationEvent

- (BMMicroLocationRestrictedLocalizationEvent)initWithAbsoluteTimeStamp:(double)a3 clientBundleIdentifier:(id)a4 maxProbabilityLabelIdentifier:(id)a5 maxProbability:(double)a6 probabilityVector:(id)a7 numDevicesVector:(id)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  BMMicroLocationRestrictedLocalizationEvent *v18;
  BMMicroLocationRestrictedLocalizationEvent *v19;
  uint64_t v20;
  NSString *clientBundleIdentifier;
  uint64_t v22;
  NSUUID *maxProbabilityLabelIdentifier;
  objc_super v25;

  v14 = a4;
  v15 = a5;
  v16 = a7;
  v17 = a8;
  v25.receiver = self;
  v25.super_class = (Class)BMMicroLocationRestrictedLocalizationEvent;
  v18 = -[BMMicroLocationRestrictedLocalizationEvent init](&v25, sel_init);
  v19 = v18;
  if (v18)
  {
    v18->_absoluteTimestamp = a3;
    v20 = objc_msgSend(v14, "copy");
    clientBundleIdentifier = v19->_clientBundleIdentifier;
    v19->_clientBundleIdentifier = (NSString *)v20;

    v22 = objc_msgSend(v15, "copy");
    maxProbabilityLabelIdentifier = v19->_maxProbabilityLabelIdentifier;
    v19->_maxProbabilityLabelIdentifier = (NSUUID *)v22;

    v19->_maxProbability = a6;
    objc_storeStrong((id *)&v19->_probabilityVector, a7);
    objc_storeStrong((id *)&v19->_numDevicesVector, a8);
  }

  return v19;
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
      +[BMMicroLocationRestrictedLocalizationEvent eventWithData:dataVersion:].cold.1();

    v7 = 0;
  }

  return v7;
}

- (id)encodeAsProto
{
  void *v2;
  void *v3;

  -[BMMicroLocationRestrictedLocalizationEvent proto](self, "proto");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "data");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (BMMicroLocationRestrictedLocalizationEvent)initWithProto:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  BMMicroLocationProbabilityPerLabel *v13;
  id v14;
  void *v15;
  void *v16;
  BMMicroLocationProbabilityPerLabel *v17;
  NSObject *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t j;
  void *v24;
  BMMicroLocationNumDevicesPerTechnology *v25;
  void *v26;
  BMMicroLocationNumDevicesPerTechnology *v27;
  double v28;
  double v29;
  void *v30;
  id v31;
  void *v32;
  void *v33;
  double v34;
  BMMicroLocationRestrictedLocalizationEvent *v35;
  NSObject *v37;
  id v38;
  id v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  _BYTE v48[128];
  _BYTE v49[128];
  uint64_t v50;

  v50 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (v4)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v38 = v4;
      v5 = v4;
      v39 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v6 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v44 = 0u;
      v45 = 0u;
      v46 = 0u;
      v47 = 0u;
      v37 = v5;
      -[NSObject probabilityVectors](v5, "probabilityVectors");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v44, v49, 16);
      if (v8)
      {
        v9 = v8;
        v10 = *(_QWORD *)v45;
        do
        {
          for (i = 0; i != v9; ++i)
          {
            if (*(_QWORD *)v45 != v10)
              objc_enumerationMutation(v7);
            v12 = *(void **)(*((_QWORD *)&v44 + 1) + 8 * i);
            v13 = [BMMicroLocationProbabilityPerLabel alloc];
            v14 = objc_alloc(MEMORY[0x1E0CB3A28]);
            objc_msgSend(v12, "label");
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            v16 = (void *)objc_msgSend(v14, "initWithUUIDString:", v15);
            objc_msgSend(v12, "probability");
            v17 = -[BMMicroLocationProbabilityPerLabel initWithLabelIdentifier:probability:](v13, "initWithLabelIdentifier:probability:", v16);
            objc_msgSend(v39, "addObject:", v17);

          }
          v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v44, v49, 16);
        }
        while (v9);
      }

      v42 = 0u;
      v43 = 0u;
      v40 = 0u;
      v41 = 0u;
      v18 = v37;
      -[NSObject numDevicesVectors](v37, "numDevicesVectors");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v40, v48, 16);
      if (v20)
      {
        v21 = v20;
        v22 = *(_QWORD *)v41;
        do
        {
          for (j = 0; j != v21; ++j)
          {
            if (*(_QWORD *)v41 != v22)
              objc_enumerationMutation(v19);
            v24 = *(void **)(*((_QWORD *)&v40 + 1) + 8 * j);
            v25 = [BMMicroLocationNumDevicesPerTechnology alloc];
            objc_msgSend(v24, "technologyString");
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            v27 = -[BMMicroLocationNumDevicesPerTechnology initWithTechnology:numDevices:](v25, "initWithTechnology:numDevices:", v26, objc_msgSend(v24, "number"));
            objc_msgSend(v6, "addObject:", v27);

          }
          v21 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v40, v48, 16);
        }
        while (v21);
      }

      -[NSObject absoluteTimeStamp](v37, "absoluteTimeStamp");
      v29 = v28;
      -[NSObject clientBundleId](v37, "clientBundleId");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      v31 = objc_alloc(MEMORY[0x1E0CB3A28]);
      -[NSObject maxProbabilityLabel](v37, "maxProbabilityLabel");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      v33 = (void *)objc_msgSend(v31, "initWithUUIDString:", v32);
      -[NSObject maxProbability](v37, "maxProbability");
      self = -[BMMicroLocationRestrictedLocalizationEvent initWithAbsoluteTimeStamp:clientBundleIdentifier:maxProbabilityLabelIdentifier:maxProbability:probabilityVector:numDevicesVector:](self, "initWithAbsoluteTimeStamp:clientBundleIdentifier:maxProbabilityLabelIdentifier:maxProbability:probabilityVector:numDevicesVector:", v30, v33, v39, v6, v29, v34);

      v35 = self;
      v4 = v38;
    }
    else
    {
      __biome_log_for_category();
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_FAULT))
        -[BMMicroLocationRestrictedLocalizationEvent initWithProto:].cold.1((uint64_t)self, v18);
      v35 = 0;
    }

  }
  else
  {
    v35 = 0;
  }

  return v35;
}

- (BMMicroLocationRestrictedLocalizationEvent)initWithProtoData:(id)a3
{
  id v4;
  BMPBMicroLocationRestrictedLocalizationEvent *v5;
  BMMicroLocationRestrictedLocalizationEvent *v6;

  if (a3)
  {
    v4 = a3;
    v5 = -[BMPBMicroLocationRestrictedLocalizationEvent initWithData:]([BMPBMicroLocationRestrictedLocalizationEvent alloc], "initWithData:", v4);

    self = -[BMMicroLocationRestrictedLocalizationEvent initWithProto:](self, "initWithProto:", v5);
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
  NSArray *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  NSArray *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", -[NSArray count](self->_probabilityVector, "count"));
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", -[NSArray count](self->_numDevicesVector, "count"));
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v5 = self->_probabilityVector;
  v6 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v24, v29, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v25;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v25 != v8)
          objc_enumerationMutation(v5);
        objc_msgSend(*(id *)(*((_QWORD *)&v24 + 1) + 8 * v9), "proto");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "addObject:", v10);

        ++v9;
      }
      while (v7 != v9);
      v7 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v24, v29, 16);
    }
    while (v7);
  }

  v22 = 0u;
  v23 = 0u;
  v20 = 0u;
  v21 = 0u;
  v11 = self->_numDevicesVector;
  v12 = -[NSArray countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v20, v28, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v21;
    do
    {
      v15 = 0;
      do
      {
        if (*(_QWORD *)v21 != v14)
          objc_enumerationMutation(v11);
        objc_msgSend(*(id *)(*((_QWORD *)&v20 + 1) + 8 * v15), "proto", (_QWORD)v20);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "addObject:", v16);

        ++v15;
      }
      while (v13 != v15);
      v13 = -[NSArray countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v20, v28, 16);
    }
    while (v13);
  }

  v17 = (void *)objc_opt_new();
  objc_msgSend(v17, "setAbsoluteTimeStamp:", self->_absoluteTimestamp);
  objc_msgSend(v17, "setClientBundleId:", self->_clientBundleIdentifier);
  -[NSUUID UUIDString](self->_maxProbabilityLabelIdentifier, "UUIDString");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setMaxProbabilityLabel:", v18);

  objc_msgSend(v17, "setMaxProbability:", self->_maxProbability);
  objc_msgSend(v17, "setProbabilityVectors:", v3);
  objc_msgSend(v17, "setNumDevicesVectors:", v4);

  return v17;
}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  NSUInteger v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_absoluteTimestamp);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");
  v5 = -[NSString hash](self->_clientBundleIdentifier, "hash");
  v6 = v5 ^ -[NSUUID hash](self->_maxProbabilityLabelIdentifier, "hash") ^ v4;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_maxProbability);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "hash");
  v9 = v6 ^ v8 ^ -[NSArray hash](self->_probabilityVector, "hash");
  v10 = v9 ^ -[NSArray hash](self->_numDevicesVector, "hash");

  return v10;
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
  NSUUID *maxProbabilityLabelIdentifier;
  NSUUID *v16;
  char v17;
  double maxProbability;
  double v19;
  double v20;
  NSArray *probabilityVector;
  NSArray *v22;
  void *v23;
  char v24;
  double v25;
  double v26;
  NSArray *numDevicesVector;
  NSArray *v28;
  void *v29;
  char v30;
  char v31;
  char v32;

  v6 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v14 = 0;
    goto LABEL_37;
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
    v13 = -[NSString isEqual:](v12, "isEqual:", v4);

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
  maxProbabilityLabelIdentifier = self->_maxProbabilityLabelIdentifier;
  v16 = maxProbabilityLabelIdentifier;
  if (maxProbabilityLabelIdentifier)
    goto LABEL_13;
  objc_msgSend(v7, "maxProbabilityLabelIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v16 = self->_maxProbabilityLabelIdentifier;
LABEL_13:
    objc_msgSend(v7, "maxProbabilityLabelIdentifier");
    clientBundleIdentifier = (NSString *)objc_claimAutoreleasedReturnValue();
    v17 = -[NSUUID isEqual:](v16, "isEqual:", clientBundleIdentifier);

    if (maxProbabilityLabelIdentifier)
      goto LABEL_17;
    goto LABEL_16;
  }
  v17 = 1;
LABEL_16:

LABEL_17:
  maxProbability = self->_maxProbability;
  objc_msgSend(v7, "maxProbability");
  v20 = v19;
  probabilityVector = self->_probabilityVector;
  v22 = probabilityVector;
  if (probabilityVector)
    goto LABEL_20;
  objc_msgSend(v7, "probabilityVector");
  clientBundleIdentifier = (NSString *)objc_claimAutoreleasedReturnValue();
  if (clientBundleIdentifier)
  {
    v22 = self->_probabilityVector;
LABEL_20:
    objc_msgSend(v7, "probabilityVector");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = -[NSArray isEqual:](v22, "isEqual:", v23);

    if (probabilityVector)
      goto LABEL_24;
    goto LABEL_23;
  }
  v24 = 1;
LABEL_23:

LABEL_24:
  v25 = vabdd_f64(absoluteTimestamp, v10);
  v26 = vabdd_f64(maxProbability, v20);
  numDevicesVector = self->_numDevicesVector;
  v28 = numDevicesVector;
  if (!numDevicesVector)
  {
    objc_msgSend(v7, "numDevicesVector");
    clientBundleIdentifier = (NSString *)objc_claimAutoreleasedReturnValue();
    if (!clientBundleIdentifier)
    {
      v30 = 1;
LABEL_30:

      goto LABEL_31;
    }
    v28 = self->_numDevicesVector;
  }
  objc_msgSend(v7, "numDevicesVector");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = -[NSArray isEqual:](v28, "isEqual:", v29);

  if (!numDevicesVector)
    goto LABEL_30;
LABEL_31:
  if (v25 < 2.22044605e-16)
    v31 = v13;
  else
    v31 = 0;
  v32 = v31 & v17;
  if (v26 >= 2.22044605e-16)
    v32 = 0;
  v14 = v32 & v24 & v30;

LABEL_37:
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

- (NSUUID)maxProbabilityLabelIdentifier
{
  return self->_maxProbabilityLabelIdentifier;
}

- (double)maxProbability
{
  return self->_maxProbability;
}

- (NSArray)probabilityVector
{
  return self->_probabilityVector;
}

- (NSArray)numDevicesVector
{
  return self->_numDevicesVector;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_numDevicesVector, 0);
  objc_storeStrong((id *)&self->_probabilityVector, 0);
  objc_storeStrong((id *)&self->_maxProbabilityLabelIdentifier, 0);
  objc_storeStrong((id *)&self->_clientBundleIdentifier, 0);
}

+ (void)eventWithData:dataVersion:.cold.1()
{
  os_log_t v0;
  uint8_t v1[16];

  OUTLINED_FUNCTION_6();
  _os_log_error_impl(&dword_18D810000, v0, OS_LOG_TYPE_ERROR, "Mismatched BMMicroLocationRestrictedLocalizationEvent data versions, cannot deserialize", v1, 2u);
  OUTLINED_FUNCTION_2();
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
  _os_log_fault_impl(&dword_18D810000, a2, OS_LOG_TYPE_FAULT, "%@: tried to initialize with a non-MMicroLocationRestrictedLocalizationEvent proto", (uint8_t *)&v5, 0xCu);

}

@end
