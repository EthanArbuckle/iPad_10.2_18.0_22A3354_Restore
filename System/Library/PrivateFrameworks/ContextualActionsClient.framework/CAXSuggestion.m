@implementation CAXSuggestion

- (CAXSuggestion)initWithSuggestedActions:(id)a3 modelVersion:(id)a4
{
  id v7;
  id v8;
  CAXSuggestion *v9;
  CAXSuggestion *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)CAXSuggestion;
  v9 = -[CAXSuggestion init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_suggestedActions, a3);
    objc_storeStrong((id *)&v10->_modelVersion, a4);
  }

  return v10;
}

- (id)description
{
  void *v2;
  void *v3;

  -[CAXSuggestion jsonRawData](self, "jsonRawData");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "description");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)jsonRawData
{
  uint64_t v3;
  void *v4;
  const __CFString *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  const __CFString *v9;
  void *v10;
  void *v11;
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
  _BYTE v24[128];
  _QWORD v25[3];
  _QWORD v26[4];

  v26[3] = *MEMORY[0x24BDAC8D0];
  v25[0] = CFSTR("uuid");
  -[CAXSuggestion blendingCacheUpdateUUID](self, "blendingCacheUpdateUUID");
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = (void *)v3;
  v5 = &stru_24DB31608;
  if (v3)
    v5 = (const __CFString *)v3;
  v26[0] = v5;
  v25[1] = CFSTR("suggestedActions");
  v6 = (void *)objc_opt_new();
  v26[1] = v6;
  v25[2] = CFSTR("modelVersion");
  -[CAXSuggestion modelVersion](self, "modelVersion");
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = (void *)v7;
  v9 = CFSTR("nil");
  if (v7)
    v9 = (const __CFString *)v7;
  v26[2] = v9;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v26, v25, 3);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v22 = 0u;
  v23 = 0u;
  v20 = 0u;
  v21 = 0u;
  -[CAXSuggestion suggestedActions](self, "suggestedActions", 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
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
        v16 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * v15);
        objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("suggestedActions"));
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "jsonRawData");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "addObject:", v18);

        ++v15;
      }
      while (v13 != v15);
      v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    }
    while (v13);
  }

  return v10;
}

- (id)json
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x24BDD1608];
  -[CAXSuggestion jsonRawData](self, "jsonRawData");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "dataWithJSONObject:options:error:", v3, 1, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (BOOL)checkAndReportDecodingFailureIfNeededForid:(id)a3 key:(id)a4 coder:(id)a5 errorDomain:(id)a6 errorCode:(int64_t)a7
{
  id v11;
  id v12;
  id v13;
  BOOL v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v21;
  _QWORD v22[2];

  v22[1] = *MEMORY[0x24BDAC8D0];
  v11 = a4;
  v12 = a5;
  v13 = a6;
  if (!a3)
  {
    objc_msgSend(v12, "error");
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    if (v15)
    {
      v14 = 1;
      goto LABEL_7;
    }
    if ((objc_msgSend(v12, "containsValueForKey:", v11) & 1) == 0)
    {
      v16 = objc_alloc(MEMORY[0x24BDD1540]);
      v21 = *MEMORY[0x24BDD0FC8];
      v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithFormat:", CFSTR("Failed to decode key %@"), v11, v21);
      v22[0] = v17;
      v14 = 1;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v22, &v21, 1);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = (void *)objc_msgSend(v16, "initWithDomain:code:userInfo:", v13, a7, v18);

      objc_msgSend(v12, "failWithError:", v19);
      goto LABEL_7;
    }
  }
  v14 = 0;
LABEL_7:

  return v14;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[CAXSuggestion encodeAsProto](self, "encodeAsProto");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("CAXProtobufData"));

}

- (CAXSuggestion)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  CAXSuggestion *v6;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("CAXProtobufData"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = -[CAXSuggestion initWithProtoData:](self, "initWithProtoData:", v5);
  return v6;
}

- (id)encodeAsProto
{
  void *v2;
  void *v3;

  -[CAXSuggestion proto](self, "proto");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "data");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (CAXSuggestion)initWithProto:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  CAXContextualAction *v14;
  CAXContextualAction *v15;
  CAXSuggestion *v16;
  NSObject *v17;
  uint64_t v18;
  uint64_t v19;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (v4)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      v6 = objc_alloc(MEMORY[0x24BDBCEB8]);
      -[NSObject suggestedActions](v5, "suggestedActions");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = (void *)objc_msgSend(v6, "initWithCapacity:", objc_msgSend(v7, "count"));

      v23 = 0u;
      v24 = 0u;
      v21 = 0u;
      v22 = 0u;
      -[NSObject suggestedActions](v5, "suggestedActions", 0);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
      if (v10)
      {
        v11 = v10;
        v12 = *(_QWORD *)v22;
        while (2)
        {
          for (i = 0; i != v11; ++i)
          {
            if (*(_QWORD *)v22 != v12)
              objc_enumerationMutation(v9);
            v14 = -[CAXContextualAction initWithProto:]([CAXContextualAction alloc], "initWithProto:", *(_QWORD *)(*((_QWORD *)&v21 + 1) + 8 * i));
            if (!v14)
            {
              __atxlog_handle_contextual_actions();
              v17 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v17, OS_LOG_TYPE_FAULT))
                -[CAXSuggestion initWithProto:].cold.1(v17, v18, v19);

              v16 = 0;
              goto LABEL_19;
            }
            v15 = v14;
            objc_msgSend(v8, "addObject:", v14);

          }
          v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
          if (v11)
            continue;
          break;
        }
      }

      -[NSObject modelVersion](v5, "modelVersion");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      self = -[CAXSuggestion initWithSuggestedActions:modelVersion:](self, "initWithSuggestedActions:modelVersion:", v8, v9);
      v16 = self;
LABEL_19:

    }
    else
    {
      __atxlog_handle_contextual_actions();
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT))
        -[CAXContextualActionsFeedbackEvent initWithProto:].cold.1((uint64_t)self, v5);
      v16 = 0;
    }

  }
  else
  {
    v16 = 0;
  }

  return v16;
}

- (CAXSuggestion)initWithProtoData:(id)a3
{
  id v4;
  CAXPBSuggestion *v5;
  CAXSuggestion *v6;

  if (a3)
  {
    v4 = a3;
    v5 = -[CAXPBSuggestion initWithData:]([CAXPBSuggestion alloc], "initWithData:", v4);

    self = -[CAXSuggestion initWithProto:](self, "initWithProto:", v5);
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
  NSObject *v11;
  uint8_t v13;
  _BYTE v14[15];
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v3 = (void *)objc_opt_new();
  objc_msgSend(v3, "setModelVersion:", self->_modelVersion);
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", -[NSArray count](self->_suggestedActions, "count"));
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v5 = self->_suggestedActions;
  v6 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v16;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v16 != v8)
          objc_enumerationMutation(v5);
        objc_msgSend(*(id *)(*((_QWORD *)&v15 + 1) + 8 * v9), "proto");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        if (v10)
        {
          objc_msgSend(v4, "addObject:", v10);
        }
        else
        {
          __atxlog_handle_contextual_actions();
          v11 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v11, OS_LOG_TYPE_FAULT))
            -[CAXSuggestion proto].cold.1(&v13, v14, v11);

        }
        ++v9;
      }
      while (v7 != v9);
      v7 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v7);
  }

  objc_msgSend(v3, "setSuggestedActions:", v4);
  return v3;
}

- (NSArray)suggestedActions
{
  return self->_suggestedActions;
}

- (NSString)modelVersion
{
  return self->_modelVersion;
}

- (void)setModelVersion:(id)a3
{
  objc_storeStrong((id *)&self->_modelVersion, a3);
}

- (NSUUID)blendingCacheUpdateUUID
{
  return self->_blendingCacheUpdateUUID;
}

- (void)setBlendingCacheUpdateUUID:(id)a3
{
  objc_storeStrong((id *)&self->_blendingCacheUpdateUUID, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_blendingCacheUpdateUUID, 0);
  objc_storeStrong((id *)&self->_modelVersion, 0);
  objc_storeStrong((id *)&self->_suggestedActions, 0);
}

- (void)initWithProto:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3)
{
  uint8_t v3[16];

  *(_WORD *)v3 = 0;
  OUTLINED_FUNCTION_0_1(&dword_2196B3000, a1, a3, "Attempting to decode CAXPBSuggestion from proto failed because the recovered PBCodable had an unrecoverable CAXContextualAction.", v3);
}

- (void)proto
{
  *a1 = 0;
  *a2 = 0;
  OUTLINED_FUNCTION_0_1(&dword_2196B3000, a3, (uint64_t)a3, "Unable to generate inner ProtoBuf class for CAXContextualAction", a1);
}

@end
