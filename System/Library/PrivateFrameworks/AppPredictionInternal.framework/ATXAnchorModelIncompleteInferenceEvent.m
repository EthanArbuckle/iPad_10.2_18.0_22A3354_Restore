@implementation ATXAnchorModelIncompleteInferenceEvent

- (ATXAnchorModelIncompleteInferenceEvent)initWithAnchor:(id)a3 anchorEvent:(id)a4
{
  id v5;
  objc_class *v6;
  void *v7;
  void *v8;
  ATXAnchorModelIncompleteInferenceEvent *v9;

  v5 = a4;
  v6 = (objc_class *)objc_opt_class();
  NSStringFromClass(v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_opt_new();
  v9 = -[ATXAnchorModelIncompleteInferenceEvent initWithAnchorClassString:anchorEvent:dateFirstAdded:retryCount:](self, "initWithAnchorClassString:anchorEvent:dateFirstAdded:retryCount:", v7, v5, v8, &unk_1E83CD9A8);

  return v9;
}

- (ATXAnchorModelIncompleteInferenceEvent)initWithAnchorClassString:(id)a3 anchorEvent:(id)a4 dateFirstAdded:(id)a5 retryCount:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  ATXAnchorModelIncompleteInferenceEvent *v14;
  uint64_t v15;
  NSString *anchorClassString;
  objc_super v18;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v18.receiver = self;
  v18.super_class = (Class)ATXAnchorModelIncompleteInferenceEvent;
  v14 = -[ATXAnchorModelIncompleteInferenceEvent init](&v18, sel_init);
  if (v14)
  {
    v15 = objc_msgSend(v10, "copy");
    anchorClassString = v14->_anchorClassString;
    v14->_anchorClassString = (NSString *)v15;

    objc_storeStrong((id *)&v14->_anchorEvent, a4);
    objc_storeStrong((id *)&v14->_dateFirstAdded, a5);
    objc_storeStrong((id *)&v14->_retryCount, a6);
  }

  return v14;
}

- (id)description
{
  return (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Anchor class: %@, anchorEvent: %@, dateAdded: %@, retryCount: %@"), self->_anchorClassString, self->_anchorEvent, self->_dateFirstAdded, self->_retryCount);
}

- (ATXAnchor)anchor
{
  uint64_t *p_anchorClassString;
  void *v4;
  void *v5;
  NSObject *v6;

  p_anchorClassString = (uint64_t *)&self->_anchorClassString;
  if (NSClassFromString(self->_anchorClassString))
  {
    v4 = (void *)objc_opt_new();
    -[ATXDuetEvent identifier](self->_anchorEvent, "identifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setAnchorEventIdentifier:", v5);

  }
  else
  {
    __atxlog_handle_anchor();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT))
      -[ATXAnchorModelIncompleteInferenceEvent anchor].cold.1(p_anchorClassString, v6);

    v4 = 0;
  }
  return (ATXAnchor *)v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  v6 = a3;
  -[ATXAnchorModelIncompleteInferenceEvent dateFirstAdded](self, "dateFirstAdded");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "encodeObject:forKey:", v4, CFSTR("codingKeyForDateFirstAdded"));

  objc_msgSend(v6, "encodeObject:forKey:", self->_anchorClassString, CFSTR("codingKeyForAnchorClassString"));
  -[ATXAnchorModelIncompleteInferenceEvent anchorEvent](self, "anchorEvent");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "encodeObject:forKey:", v5, CFSTR("codingKeyForAnchorEvent"));

  objc_msgSend(v6, "encodeObject:forKey:", self->_retryCount, CFSTR("codingKeyForRetryCount"));
}

- (ATXAnchorModelIncompleteInferenceEvent)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  ATXAnchorModelIncompleteInferenceEvent *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;

  v4 = a3;
  v5 = (void *)MEMORY[0x1E0D81610];
  v6 = objc_opt_class();
  __atxlog_handle_anchor();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "robustDecodeObjectOfClass:forKey:withCoder:expectNonNull:errorDomain:errorCode:logHandle:", v6, CFSTR("codingKeyForDateFirstAdded"), v4, 1, CFSTR("com.apple.proactive.AnchorModelInferenceEvent"), -1, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8 && (objc_msgSend(v4, "error"), v9 = (void *)objc_claimAutoreleasedReturnValue(), v9, !v9))
  {
    v11 = (void *)MEMORY[0x1E0D81610];
    v12 = objc_opt_class();
    __atxlog_handle_anchor();
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "robustDecodeObjectOfClass:forKey:withCoder:expectNonNull:errorDomain:errorCode:logHandle:", v12, CFSTR("codingKeyForAnchorClassString"), v4, 1, CFSTR("com.apple.proactive.AnchorModelInferenceEvent"), -1, v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    if (v14 && (objc_msgSend(v4, "error"), v15 = (void *)objc_claimAutoreleasedReturnValue(), v15, !v15))
    {
      v16 = (void *)MEMORY[0x1E0D81610];
      v17 = objc_opt_class();
      __atxlog_handle_anchor();
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "robustDecodeObjectOfClass:forKey:withCoder:expectNonNull:errorDomain:errorCode:logHandle:", v17, CFSTR("codingKeyForAnchorEvent"), v4, 1, CFSTR("com.apple.proactive.AnchorModelInferenceEvent"), -1, v18);
      v19 = (void *)objc_claimAutoreleasedReturnValue();

      if (v19
        && (objc_msgSend(v4, "error"), v20 = (void *)objc_claimAutoreleasedReturnValue(), v20, !v20))
      {
        v21 = (void *)MEMORY[0x1E0D81610];
        v22 = objc_opt_class();
        __atxlog_handle_anchor();
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "robustDecodeObjectOfClass:forKey:withCoder:expectNonNull:errorDomain:errorCode:logHandle:", v22, CFSTR("codingKeyForRetryCount"), v4, 1, CFSTR("com.apple.proactive.AnchorModelInferenceEvent"), -1, v23);
        v24 = (void *)objc_claimAutoreleasedReturnValue();

        if (v24
          && (objc_msgSend(v4, "error"), v25 = (void *)objc_claimAutoreleasedReturnValue(), v25, !v25))
        {
          self = -[ATXAnchorModelIncompleteInferenceEvent initWithAnchorClassString:anchorEvent:dateFirstAdded:retryCount:](self, "initWithAnchorClassString:anchorEvent:dateFirstAdded:retryCount:", v14, v19, v8, v24);
          v10 = self;
        }
        else
        {
          v10 = 0;
        }

      }
      else
      {
        v10 = 0;
      }

    }
    else
    {
      v10 = 0;
    }

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (ATXDuetEvent)anchorEvent
{
  return self->_anchorEvent;
}

- (NSDate)dateFirstAdded
{
  return self->_dateFirstAdded;
}

- (NSNumber)retryCount
{
  return self->_retryCount;
}

- (void)setRetryCount:(id)a3
{
  objc_storeStrong((id *)&self->_retryCount, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_retryCount, 0);
  objc_storeStrong((id *)&self->_dateFirstAdded, 0);
  objc_storeStrong((id *)&self->_anchorEvent, 0);
  objc_storeStrong((id *)&self->_anchorClassString, 0);
}

- (void)anchor
{
  uint64_t v2;
  int v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v2 = *a1;
  v3 = 138412290;
  v4 = v2;
  _os_log_fault_impl(&dword_1C9A3B000, a2, OS_LOG_TYPE_FAULT, "Failed to retrieve appropriate Class for anchor. Anchor Class: %@", (uint8_t *)&v3, 0xCu);
  OUTLINED_FUNCTION_1_0();
}

@end
