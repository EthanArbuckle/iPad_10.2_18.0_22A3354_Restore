@implementation CAXPredictionContext

- (CAXPredictionContext)initWithSuggestionDate:(id)a3 sourceAppName:(id)a4 contents:(id)a5 previousActions:(id)a6 searchTerm:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  CAXPredictionContext *v16;

  v12 = a7;
  v13 = a6;
  v14 = a5;
  v15 = a4;
  objc_msgSend(a3, "timeIntervalSince1970");
  v16 = -[CAXPredictionContext initWithAbsoluteDate:sourceAppName:contents:previousActions:searchTerm:](self, "initWithAbsoluteDate:sourceAppName:contents:previousActions:searchTerm:", v15, v14, v13, v12);

  return v16;
}

- (CAXPredictionContext)initWithAbsoluteDate:(double)a3 sourceAppName:(id)a4 contents:(id)a5 previousActions:(id)a6 searchTerm:(id)a7
{
  id v13;
  id v14;
  id v15;
  id v16;
  CAXPredictionContext *v17;
  CAXPredictionContext *v18;
  uint64_t v19;
  NSDate *suggestionDate;
  objc_super v22;

  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  v22.receiver = self;
  v22.super_class = (Class)CAXPredictionContext;
  v17 = -[CAXPredictionContext init](&v22, sel_init);
  v18 = v17;
  if (v17)
  {
    v17->_absoluteDate = a3;
    -[CAXPredictionContext date](v17, "date");
    v19 = objc_claimAutoreleasedReturnValue();
    suggestionDate = v18->_suggestionDate;
    v18->_suggestionDate = (NSDate *)v19;

    objc_storeStrong((id *)&v18->_sourceAppName, a4);
    objc_storeStrong((id *)&v18->_contents, a5);
    objc_storeStrong((id *)&v18->_previousActions, a6);
    objc_storeStrong((id *)&v18->_searchTerm, a7);
  }

  return v18;
}

- (BOOL)isEqual:(id)a3
{
  CAXPredictionContext *v4;
  CAXPredictionContext *v5;
  BOOL v6;

  v4 = (CAXPredictionContext *)a3;
  v5 = v4;
  if (v4 == self)
    v6 = 1;
  else
    v6 = v4
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && -[CAXPredictionContext isEqualToCAXPredictionContext:](self, "isEqualToCAXPredictionContext:", v5);

  return v6;
}

- (BOOL)isEqualToCAXPredictionContext:(id)a3
{
  id *v4;
  id *v5;
  double v6;
  NSString *sourceAppName;
  NSString *v8;
  NSString *v9;
  NSString *v10;
  char v11;
  NSArray *contents;
  NSArray *v13;
  NSArray *v14;
  NSArray *v15;
  char v16;
  NSArray *previousActions;
  NSArray *v18;
  NSArray *v19;
  NSArray *v20;
  char v21;
  char v22;
  NSString *v24;
  NSString *v25;

  v4 = (id *)a3;
  v5 = v4;
  v6 = self->_absoluteDate - *((double *)v4 + 1);
  if (v6 < 0.0)
    v6 = -v6;
  if (v6 > 2.22044605e-16)
    goto LABEL_14;
  sourceAppName = self->_sourceAppName;
  v8 = (NSString *)v4[3];
  if (sourceAppName == v8)
  {

  }
  else
  {
    v9 = v8;
    v10 = sourceAppName;
    v11 = -[NSString isEqual:](v10, "isEqual:", v9);

    if ((v11 & 1) == 0)
      goto LABEL_14;
  }
  contents = self->_contents;
  v13 = (NSArray *)v5[4];
  if (contents == v13)
  {

  }
  else
  {
    v14 = v13;
    v15 = contents;
    v16 = -[NSArray isEqual:](v15, "isEqual:", v14);

    if ((v16 & 1) == 0)
      goto LABEL_14;
  }
  previousActions = self->_previousActions;
  v18 = (NSArray *)v5[5];
  if (previousActions == v18)
  {

  }
  else
  {
    v19 = v18;
    v20 = previousActions;
    v21 = -[NSArray isEqual:](v20, "isEqual:", v19);

    if ((v21 & 1) == 0)
    {
LABEL_14:
      v22 = 0;
      goto LABEL_15;
    }
  }
  v24 = self->_searchTerm;
  v25 = v24;
  if (v24 == v5[6])
    v22 = 1;
  else
    v22 = -[NSString isEqual:](v24, "isEqual:");

LABEL_15:
  return v22;
}

- (unint64_t)hash
{
  unint64_t absoluteDate;
  NSUInteger v4;
  uint64_t v5;
  uint64_t v6;

  absoluteDate = (unint64_t)self->_absoluteDate;
  v4 = -[NSString hash](self->_sourceAppName, "hash") - absoluteDate + 32 * absoluteDate;
  v5 = -[NSArray hash](self->_contents, "hash") - v4 + 32 * v4;
  v6 = -[NSArray hash](self->_previousActions, "hash") - v5 + 32 * v5;
  return -[NSString hash](self->_searchTerm, "hash") - v6 + 32 * v6;
}

- (id)date
{
  return (id)objc_msgSend(objc_alloc(MEMORY[0x24BDBCE60]), "initWithTimeIntervalSince1970:", self->_absoluteDate);
}

- (void)setDate:(id)a3
{
  double v4;

  objc_msgSend(a3, "timeIntervalSince1970");
  self->_absoluteDate = v4;
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

- (BOOL)checkAndReportDecodingFailureIfNeededForint32_t:(int)a3 key:(id)a4 coder:(id)a5 errorDomain:(id)a6 errorCode:(int64_t)a7
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

- (BOOL)checkAndReportDecodingFailureIfNeededFordouble:(double)a3 key:(id)a4 coder:(id)a5 errorDomain:(id)a6 errorCode:(int64_t)a7
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
  if (a3 == 0.0)
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
  -[CAXPredictionContext encodeAsProto](self, "encodeAsProto");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("CAXProtobufData"));

}

- (CAXPredictionContext)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  CAXPredictionContext *v6;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("CAXProtobufData"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = -[CAXPredictionContext initWithProtoData:](self, "initWithProtoData:", v5);
  return v6;
}

- (id)encodeAsProto
{
  void *v2;
  void *v3;

  -[CAXPredictionContext proto](self, "proto");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "data");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (CAXPredictionContext)initWithProto:(id)a3
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
  CAXContextualActionContent *v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t j;
  CAXContextualAction *v23;
  double v24;
  double v25;
  void *v26;
  void *v27;
  CAXPredictionContext *v28;
  CAXPredictionContext *v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  _BYTE v39[128];
  _BYTE v40[128];
  uint64_t v41;

  v41 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (v4)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v30 = self;
      v5 = v4;
      v6 = objc_alloc(MEMORY[0x24BDBCEB8]);
      -[NSObject contents](v5, "contents");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = (void *)objc_msgSend(v6, "initWithCapacity:", objc_msgSend(v7, "count"));

      v37 = 0u;
      v38 = 0u;
      v35 = 0u;
      v36 = 0u;
      -[NSObject contents](v5, "contents");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v35, v40, 16);
      if (v10)
      {
        v11 = v10;
        v12 = *(_QWORD *)v36;
        do
        {
          for (i = 0; i != v11; ++i)
          {
            if (*(_QWORD *)v36 != v12)
              objc_enumerationMutation(v9);
            v14 = -[CAXContextualActionContent initWithProto:]([CAXContextualActionContent alloc], "initWithProto:", *(_QWORD *)(*((_QWORD *)&v35 + 1) + 8 * i));
            objc_msgSend(v8, "addObject:", v14);

          }
          v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v35, v40, 16);
        }
        while (v11);
      }

      v15 = objc_alloc(MEMORY[0x24BDBCEB8]);
      -[NSObject previousActions](v5, "previousActions");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = (void *)objc_msgSend(v15, "initWithCapacity:", objc_msgSend(v16, "count"));

      v33 = 0u;
      v34 = 0u;
      v31 = 0u;
      v32 = 0u;
      -[NSObject previousActions](v5, "previousActions");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v31, v39, 16);
      if (v19)
      {
        v20 = v19;
        v21 = *(_QWORD *)v32;
        do
        {
          for (j = 0; j != v20; ++j)
          {
            if (*(_QWORD *)v32 != v21)
              objc_enumerationMutation(v18);
            v23 = -[CAXContextualAction initWithProto:]([CAXContextualAction alloc], "initWithProto:", *(_QWORD *)(*((_QWORD *)&v31 + 1) + 8 * j));
            objc_msgSend(v17, "addObject:", v23);

          }
          v20 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v31, v39, 16);
        }
        while (v20);
      }

      -[NSObject suggestionDate](v5, "suggestionDate");
      v25 = v24;
      -[NSObject sourceAppName](v5, "sourceAppName");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSObject searchTerm](v5, "searchTerm");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      self = -[CAXPredictionContext initWithAbsoluteDate:sourceAppName:contents:previousActions:searchTerm:](v30, "initWithAbsoluteDate:sourceAppName:contents:previousActions:searchTerm:", v26, v8, v17, v27, v25);

      v28 = self;
    }
    else
    {
      __atxlog_handle_contextual_actions();
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT))
        -[CAXContextualActionsFeedbackEvent initWithProto:].cold.1((uint64_t)self, v5);
      v28 = 0;
    }

  }
  else
  {
    v28 = 0;
  }

  return v28;
}

- (CAXPredictionContext)initWithProtoData:(id)a3
{
  id v4;
  CAXPBPredictionContext *v5;
  CAXPredictionContext *v6;

  if (a3)
  {
    v4 = a3;
    v5 = -[CAXPBPredictionContext initWithData:]([CAXPBPredictionContext alloc], "initWithData:", v4);

    self = -[CAXPredictionContext initWithProto:](self, "initWithProto:", v5);
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
  NSArray *contents;
  NSArray *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  NSObject *v12;
  void *v13;
  NSArray *previousActions;
  NSArray *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  NSObject *v21;
  uint8_t v23;
  _BYTE v24[15];
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  uint8_t v29;
  _BYTE v30[15];
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  _BYTE v35[128];
  _BYTE v36[128];
  uint64_t v37;

  v37 = *MEMORY[0x24BDAC8D0];
  v3 = (void *)objc_opt_new();
  objc_msgSend(v3, "setSuggestionDate:", self->_absoluteDate);
  objc_msgSend(v3, "setSourceAppName:", self->_sourceAppName);
  objc_msgSend(v3, "setSearchTerm:", self->_searchTerm);
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  contents = self->_contents;
  if (contents && -[NSArray count](contents, "count"))
  {
    v33 = 0u;
    v34 = 0u;
    v31 = 0u;
    v32 = 0u;
    v6 = self->_contents;
    v7 = -[NSArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v31, v36, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v32;
      do
      {
        v10 = 0;
        do
        {
          if (*(_QWORD *)v32 != v9)
            objc_enumerationMutation(v6);
          objc_msgSend(*(id *)(*((_QWORD *)&v31 + 1) + 8 * v10), "proto");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          if (v11)
          {
            objc_msgSend(v4, "addObject:", v11);
          }
          else
          {
            __atxlog_handle_contextual_actions();
            v12 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT))
              -[CAXPredictionContext proto].cold.2(&v29, v30, v12);

          }
          ++v10;
        }
        while (v8 != v10);
        v8 = -[NSArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v31, v36, 16);
      }
      while (v8);
    }

  }
  objc_msgSend(v3, "setContents:", v4);
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  previousActions = self->_previousActions;
  if (previousActions && -[NSArray count](previousActions, "count"))
  {
    v27 = 0u;
    v28 = 0u;
    v25 = 0u;
    v26 = 0u;
    v15 = self->_previousActions;
    v16 = -[NSArray countByEnumeratingWithState:objects:count:](v15, "countByEnumeratingWithState:objects:count:", &v25, v35, 16);
    if (v16)
    {
      v17 = v16;
      v18 = *(_QWORD *)v26;
      do
      {
        v19 = 0;
        do
        {
          if (*(_QWORD *)v26 != v18)
            objc_enumerationMutation(v15);
          objc_msgSend(*(id *)(*((_QWORD *)&v25 + 1) + 8 * v19), "proto");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          if (v20)
          {
            objc_msgSend(v13, "addObject:", v20);
          }
          else
          {
            __atxlog_handle_contextual_actions();
            v21 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v21, OS_LOG_TYPE_FAULT))
              -[CAXPredictionContext proto].cold.1(&v23, v24, v21);

          }
          ++v19;
        }
        while (v17 != v19);
        v17 = -[NSArray countByEnumeratingWithState:objects:count:](v15, "countByEnumeratingWithState:objects:count:", &v25, v35, 16);
      }
      while (v17);
    }

  }
  objc_msgSend(v3, "setPreviousActions:", v13);

  return v3;
}

- (id)jsonRawData
{
  double absoluteDate;
  __CFString *v4;
  uint64_t v5;
  void *v6;
  const __CFString *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  const __CFString *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t i;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t j;
  void *v29;
  void *v30;
  void *v31;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  _BYTE v41[128];
  _BYTE v42[128];
  _QWORD v43[5];
  _QWORD v44[6];

  v44[5] = *MEMORY[0x24BDAC8D0];
  v43[0] = CFSTR("absoluteDate");
  absoluteDate = self->_absoluteDate;
  if (absoluteDate == 0.0)
  {
    v4 = CFSTR("nil");
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%lf"), *(_QWORD *)&absoluteDate);
    v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  v44[0] = v4;
  v43[1] = CFSTR("sourceAppName");
  -[CAXPredictionContext sourceAppName](self, "sourceAppName");
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = (void *)v5;
  if (v5)
    v7 = (const __CFString *)v5;
  else
    v7 = CFSTR("nil");
  v44[1] = v7;
  v43[2] = CFSTR("contents");
  v8 = (void *)objc_opt_new();
  v44[2] = v8;
  v43[3] = CFSTR("previousActions");
  v9 = (void *)objc_opt_new();
  v44[3] = v9;
  v43[4] = CFSTR("searchTerm");
  -[CAXPredictionContext searchTerm](self, "searchTerm");
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = (void *)v10;
  if (v10)
    v12 = (const __CFString *)v10;
  else
    v12 = CFSTR("nil");
  v44[4] = v12;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v44, v43, 5);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (absoluteDate != 0.0)
  -[CAXPredictionContext contents](self, "contents");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (v14)
  {
    v39 = 0u;
    v40 = 0u;
    v37 = 0u;
    v38 = 0u;
    -[CAXPredictionContext contents](self, "contents");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v37, v42, 16);
    if (v16)
    {
      v17 = v16;
      v18 = *(_QWORD *)v38;
      do
      {
        for (i = 0; i != v17; ++i)
        {
          if (*(_QWORD *)v38 != v18)
            objc_enumerationMutation(v15);
          v20 = *(void **)(*((_QWORD *)&v37 + 1) + 8 * i);
          objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("contents"));
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v20, "jsonRawData");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v21, "addObject:", v22);

        }
        v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v37, v42, 16);
      }
      while (v17);
    }

  }
  -[CAXPredictionContext previousActions](self, "previousActions");
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  if (v23)
  {
    v35 = 0u;
    v36 = 0u;
    v33 = 0u;
    v34 = 0u;
    -[CAXPredictionContext previousActions](self, "previousActions");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v33, v41, 16);
    if (v25)
    {
      v26 = v25;
      v27 = *(_QWORD *)v34;
      do
      {
        for (j = 0; j != v26; ++j)
        {
          if (*(_QWORD *)v34 != v27)
            objc_enumerationMutation(v24);
          v29 = *(void **)(*((_QWORD *)&v33 + 1) + 8 * j);
          objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("previousActions"));
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v29, "jsonRawData");
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v30, "addObject:", v31);

        }
        v26 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v33, v41, 16);
      }
      while (v26);
    }

  }
  return v13;
}

- (id)json
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x24BDD1608];
  -[CAXPredictionContext jsonRawData](self, "jsonRawData");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "dataWithJSONObject:options:error:", v3, 1, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (NSDate)suggestionDate
{
  return self->_suggestionDate;
}

- (void)setSuggestionDate:(id)a3
{
  objc_storeStrong((id *)&self->_suggestionDate, a3);
}

- (NSString)sourceAppName
{
  return self->_sourceAppName;
}

- (void)setSourceAppName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSArray)contents
{
  return self->_contents;
}

- (void)setContents:(id)a3
{
  objc_storeStrong((id *)&self->_contents, a3);
}

- (NSArray)previousActions
{
  return self->_previousActions;
}

- (void)setPreviousActions:(id)a3
{
  objc_storeStrong((id *)&self->_previousActions, a3);
}

- (NSString)searchTerm
{
  return self->_searchTerm;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_searchTerm, 0);
  objc_storeStrong((id *)&self->_previousActions, 0);
  objc_storeStrong((id *)&self->_contents, 0);
  objc_storeStrong((id *)&self->_sourceAppName, 0);
  objc_storeStrong((id *)&self->_suggestionDate, 0);
}

- (void)proto
{
  *a1 = 0;
  *a2 = 0;
  OUTLINED_FUNCTION_0_0(&dword_2196B3000, (int)a2, a3, "Unable to generate inner ProtoBuf class for CAXContextualActionContent", a1);
}

@end
