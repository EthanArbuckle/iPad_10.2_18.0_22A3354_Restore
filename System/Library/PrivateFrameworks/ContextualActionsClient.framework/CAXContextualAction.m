@implementation CAXContextualAction

- (CAXContextualAction)initWithActionIdentifier:(id)a3 parameters:(id)a4
{
  id v7;
  id v8;
  CAXContextualAction *v9;
  CAXContextualAction *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)CAXContextualAction;
  v9 = -[CAXContextualAction init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_actionIdentifier, a3);
    objc_storeStrong((id *)&v10->_parameters, a4);
    v10->_confidence = 0;
  }

  return v10;
}

- (CAXContextualAction)initWithActionIdentifier:(id)a3 confidence:(int64_t)a4 parameters:(id)a5
{
  id v9;
  id v10;
  CAXContextualAction *v11;
  CAXContextualAction *v12;
  objc_super v14;

  v9 = a3;
  v10 = a5;
  v14.receiver = self;
  v14.super_class = (Class)CAXContextualAction;
  v11 = -[CAXContextualAction init](&v14, sel_init);
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_actionIdentifier, a3);
    objc_storeStrong((id *)&v12->_parameters, a5);
    v12->_confidence = a4;
  }

  return v12;
}

- (NSString)description
{
  void *v2;
  void *v3;

  -[CAXContextualAction jsonRawData](self, "jsonRawData");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "description");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
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
  -[CAXContextualAction encodeAsProto](self, "encodeAsProto");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("CAXProtobufData"));

}

- (CAXContextualAction)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  CAXContextualAction *v6;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("CAXProtobufData"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = -[CAXContextualAction initWithProtoData:](self, "initWithProtoData:", v5);
  return v6;
}

- (id)encodeAsProto
{
  void *v2;
  void *v3;

  -[CAXContextualAction proto](self, "proto");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "data");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (CAXContextualAction)initWithProtoData:(id)a3
{
  id v4;
  CAXPBContextualAction *v5;
  CAXContextualAction *v6;

  if (a3)
  {
    v4 = a3;
    v5 = -[CAXPBContextualAction initWithData:]([CAXPBContextualAction alloc], "initWithData:", v4);

    self = -[CAXContextualAction initWithProto:](self, "initWithProto:", v5);
    v6 = self;
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (CAXContextualAction)initWithProto:(id)a3
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
  CAXContextualActionParameter *v14;
  void *v15;
  CAXContextualAction *v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (v4)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      v6 = objc_alloc(MEMORY[0x24BDBCEB8]);
      -[NSObject parameters](v5, "parameters");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = (void *)objc_msgSend(v6, "initWithCapacity:", objc_msgSend(v7, "count"));

      v20 = 0u;
      v21 = 0u;
      v18 = 0u;
      v19 = 0u;
      -[NSObject parameters](v5, "parameters", 0);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
      if (v10)
      {
        v11 = v10;
        v12 = *(_QWORD *)v19;
        do
        {
          for (i = 0; i != v11; ++i)
          {
            if (*(_QWORD *)v19 != v12)
              objc_enumerationMutation(v9);
            v14 = -[CAXContextualActionParameter initWithProto:]([CAXContextualActionParameter alloc], "initWithProto:", *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * i));
            objc_msgSend(v8, "addObject:", v14);

          }
          v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
        }
        while (v11);
      }

      -[NSObject actionIdentifier](v5, "actionIdentifier");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      self = -[CAXContextualAction initWithActionIdentifier:parameters:](self, "initWithActionIdentifier:parameters:", v15, v8);

      v16 = self;
    }
    else
    {
      __atxlog_handle_contextual_actions();
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT))
        -[CAXContextualActionContent initWithProto:].cold.1();
      v16 = 0;
    }

  }
  else
  {
    v16 = 0;
  }

  return v16;
}

- (id)proto
{
  void *v3;
  void *v4;
  NSArray *parameters;
  NSArray *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  NSObject *v12;
  uint8_t v14;
  _BYTE v15[15];
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v3 = (void *)objc_opt_new();
  objc_msgSend(v3, "setActionIdentifier:", self->_actionIdentifier);
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  parameters = self->_parameters;
  if (parameters && -[NSArray count](parameters, "count"))
  {
    v18 = 0u;
    v19 = 0u;
    v16 = 0u;
    v17 = 0u;
    v6 = self->_parameters;
    v7 = -[NSArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v17;
      do
      {
        v10 = 0;
        do
        {
          if (*(_QWORD *)v17 != v9)
            objc_enumerationMutation(v6);
          objc_msgSend(*(id *)(*((_QWORD *)&v16 + 1) + 8 * v10), "proto");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          if (v11)
          {
            objc_msgSend(v4, "addObject:", v3);
          }
          else
          {
            __atxlog_handle_contextual_actions();
            v12 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT))
              -[CAXContextualAction proto].cold.1(&v14, v15, v12);

          }
          ++v10;
        }
        while (v8 != v10);
        v8 = -[NSArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
      }
      while (v8);
    }

  }
  objc_msgSend(v3, "setParameters:", v4);

  return v3;
}

- (id)jsonRawData
{
  void *v3;
  uint64_t v4;
  void *v5;
  const __CFString *v6;
  uint64_t v7;
  void *v8;
  const __CFString *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  void *v18;
  void *v19;
  void *v20;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  v3 = (void *)objc_opt_new();
  -[CAXContextualAction suggestionUUID](self, "suggestionUUID");
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = (void *)v4;
  if (v4)
    v6 = (const __CFString *)v4;
  else
    v6 = &stru_24DB31608;
  objc_msgSend(v3, "setObject:forKey:", v6, CFSTR("uuid"));

  -[CAXContextualAction actionIdentifier](self, "actionIdentifier");
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = (void *)v7;
  if (v7)
    v9 = (const __CFString *)v7;
  else
    v9 = CFSTR("nil");
  objc_msgSend(v3, "setObject:forKey:", v9, CFSTR("actionIdentifier"));

  -[CAXContextualAction parameters](self, "parameters");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v11, CFSTR("parameters"));

  }
  else
  {
    objc_msgSend(v3, "setObject:forKey:", CFSTR("nil"), CFSTR("parameters"));
  }

  -[CAXContextualAction parameters](self, "parameters");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    v24 = 0u;
    v25 = 0u;
    v22 = 0u;
    v23 = 0u;
    -[CAXContextualAction parameters](self, "parameters", 0);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
    if (v14)
    {
      v15 = v14;
      v16 = *(_QWORD *)v23;
      do
      {
        for (i = 0; i != v15; ++i)
        {
          if (*(_QWORD *)v23 != v16)
            objc_enumerationMutation(v13);
          v18 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * i);
          objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("parameters"));
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "jsonRawData");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v19, "addObject:", v20);

        }
        v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
      }
      while (v15);
    }

  }
  return v3;
}

- (id)json
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x24BDD1608];
  -[CAXContextualAction jsonRawData](self, "jsonRawData");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "dataWithJSONObject:options:error:", v3, 1, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (NSUUID)suggestionUUID
{
  return self->_suggestionUUID;
}

- (void)setSuggestionUUID:(id)a3
{
  objc_storeStrong((id *)&self->_suggestionUUID, a3);
}

- (NSString)actionIdentifier
{
  return self->_actionIdentifier;
}

- (int64_t)confidence
{
  return self->_confidence;
}

- (void)setConfidence:(int64_t)a3
{
  self->_confidence = a3;
}

- (NSArray)parameters
{
  return self->_parameters;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_parameters, 0);
  objc_storeStrong((id *)&self->_actionIdentifier, 0);
  objc_storeStrong((id *)&self->_suggestionUUID, 0);
}

- (void)proto
{
  *buf = 0;
  *a2 = 0;
  _os_log_fault_impl(&dword_2196B3000, log, OS_LOG_TYPE_FAULT, "Unable to generate inner ProtoBuf class for CAXContextualActionParameter", buf, 2u);
}

@end
