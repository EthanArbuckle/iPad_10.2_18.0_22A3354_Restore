@implementation CPLSerializedFeedbackMessage

- (CPLSerializedFeedbackMessage)initWithMessage:(id)a3
{
  id v4;
  CPLSerializedFeedbackMessage *v5;
  uint64_t v6;
  NSUUID *uuid;
  void *v8;
  uint64_t v9;
  NSString *feedbackType;
  uint64_t v11;
  CPLServerFeedbackMessage *serverMessage;
  objc_super v14;

  v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)CPLSerializedFeedbackMessage;
  v5 = -[CPLSerializedFeedbackMessage init](&v14, sel_init);
  if (v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
    v6 = objc_claimAutoreleasedReturnValue();
    uuid = v5->_uuid;
    v5->_uuid = (NSUUID *)v6;

    objc_msgSend(v4, "feedbackType");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "copy");
    feedbackType = v5->_feedbackType;
    v5->_feedbackType = (NSString *)v9;

    objc_msgSend(v4, "serverMessage");
    v11 = objc_claimAutoreleasedReturnValue();
    serverMessage = v5->_serverMessage;
    v5->_serverMessage = (CPLServerFeedbackMessage *)v11;

  }
  return v5;
}

- (CPLSerializedFeedbackMessage)initWithDictionaryRepresentation:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  CPLServerFeedbackMessage *v8;
  CPLServerFeedbackMessage *v9;
  void *v10;
  void *v11;
  int v12;
  CPLSerializedFeedbackMessage *v13;
  CPLSerializedFeedbackMessage *v14;
  uint64_t v15;
  NSString *feedbackType;
  CPLSerializedFeedbackMessage *v17;
  objc_super v19;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("uuid"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("msg"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3A28]), "initWithUUIDString:", v5);
      if (v7)
      {
        v8 = -[CPLServerFeedbackMessage initWithData:]([CPLServerFeedbackMessage alloc], "initWithData:", v6);
        v9 = v8;
        if (v8 && -[CPLServerFeedbackMessage keysAndValuesCount](v8, "keysAndValuesCount"))
        {
          -[CPLServerFeedbackMessage keysAndValuesAtIndex:](v9, "keysAndValuesAtIndex:", 0);
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v10, "hasKey")
            && objc_msgSend(v10, "hasValue")
            && (objc_msgSend(v10, "key"),
                v11 = (void *)objc_claimAutoreleasedReturnValue(),
                v12 = objc_msgSend(v11, "isEqualToString:", CFSTR("type")),
                v11,
                v12))
          {
            v19.receiver = self;
            v19.super_class = (Class)CPLSerializedFeedbackMessage;
            v13 = -[CPLSerializedFeedbackMessage init](&v19, sel_init);
            v14 = v13;
            if (v13)
            {
              objc_storeStrong((id *)&v13->_uuid, v7);
              objc_msgSend(v10, "value");
              v15 = objc_claimAutoreleasedReturnValue();
              feedbackType = v14->_feedbackType;
              v14->_feedbackType = (NSString *)v15;

              objc_storeStrong((id *)&v14->_serverMessage, v9);
            }
            self = v14;
            v17 = self;
          }
          else
          {
            v17 = 0;
          }

        }
        else
        {
          v17 = 0;
        }

      }
      else
      {
        v17 = 0;
      }

    }
    else
    {
      v17 = 0;
    }

  }
  else
  {
    v17 = 0;
  }

  return v17;
}

- (NSDictionary)dictionaryRepresentation
{
  void *v3;
  void *v4;
  void *v5;
  _QWORD v7[2];
  _QWORD v8[3];

  v8[2] = *MEMORY[0x1E0C80C00];
  v7[0] = CFSTR("uuid");
  -[NSUUID UUIDString](self->_uuid, "UUIDString");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v7[1] = CFSTR("msg");
  v8[0] = v3;
  -[CPLServerFeedbackMessage data](self->_serverMessage, "data");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v8[1] = v4;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v8, v7, 2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDictionary *)v5;
}

- (id)description
{
  void *v3;
  unint64_t v4;
  unint64_t v5;
  uint64_t v6;
  const __CFString *v7;
  void *v8;
  void *v9;
  void *v10;

  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37A0]), "initWithFormat:", CFSTR("<%@ ["), objc_opt_class());
  v4 = -[CPLServerFeedbackMessage keysAndValuesCount](self->_serverMessage, "keysAndValuesCount");
  if (v4)
  {
    v5 = v4;
    v6 = 0;
    v7 = CFSTR("%@='%@'");
    do
    {
      -[CPLServerFeedbackMessage keysAndValuesAtIndex:](self->_serverMessage, "keysAndValuesAtIndex:", v6);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "key");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "value");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "appendFormat:", v7, v9, v10);

      ++v6;
      v7 = CFSTR(", %@='%@'");
    }
    while (v5 != v6);
  }
  objc_msgSend(v3, "appendString:", CFSTR("]"));
  return v3;
}

- (NSUUID)uuid
{
  return self->_uuid;
}

- (NSString)feedbackType
{
  return self->_feedbackType;
}

- (CPLServerFeedbackMessage)serverMessage
{
  return self->_serverMessage;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_feedbackType, 0);
  objc_storeStrong((id *)&self->_serverMessage, 0);
  objc_storeStrong((id *)&self->_uuid, 0);
}

+ (id)plistRepresentationForMessages:(id)a3
{
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v3, "count"));
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v13;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v13 != v8)
          objc_enumerationMutation(v5);
        objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * v9), "dictionaryRepresentation", (_QWORD)v12);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "addObject:", v10);

        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v7);
  }

  return v4;
}

+ (id)messagesForPlistRepresentation:(id)a3
{
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  CPLSerializedFeedbackMessage *v11;
  CPLSerializedFeedbackMessage *v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v3, "count"));
    v14 = 0u;
    v15 = 0u;
    v16 = 0u;
    v17 = 0u;
    v5 = v3;
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v15;
      do
      {
        v9 = 0;
        do
        {
          if (*(_QWORD *)v15 != v8)
            objc_enumerationMutation(v5);
          v10 = *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * v9);
          v11 = [CPLSerializedFeedbackMessage alloc];
          v12 = -[CPLSerializedFeedbackMessage initWithDictionaryRepresentation:](v11, "initWithDictionaryRepresentation:", v10, (_QWORD)v14);
          if (v12)
            objc_msgSend(v4, "addObject:", v12);

          ++v9;
        }
        while (v7 != v9);
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      }
      while (v7);
    }

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99D20], "array");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v4;
}

@end
