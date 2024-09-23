@implementation ATXStackState

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;

  v16 = objc_alloc(MEMORY[0x1E0CB3940]);
  -[ATXHomeScreenEvent date](self->_stackCreationEvent, "date");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[ATXHomeScreenEvent date](self->_lastStackRotationEvent, "date");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[ATXHomeScreenEvent eventTypeString](self->_lastStackRotationEvent, "eventTypeString");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[ATXHomeScreenEvent widgetBundleId](self->_lastStackRotationEvent, "widgetBundleId");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[ATXHomeScreenEvent reason](self->_lastStackRotationEvent, "reason");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[ATXHomeScreenEvent date](self->_lastStackShownEvent, "date");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[ATXHomeScreenEvent widgetBundleId](self->_lastStackShownEvent, "widgetBundleId");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[ATXHomeScreenEvent date](self->_lastUserScrollStackRotationEvent, "date");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[ATXHomeScreenEvent eventTypeString](self->_lastUserScrollStackRotationEvent, "eventTypeString");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[ATXHomeScreenEvent widgetBundleId](self->_lastUserScrollStackRotationEvent, "widgetBundleId");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[ATXHomeScreenEvent reason](self->_lastUserScrollStackRotationEvent, "reason");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[ATXSuggestionLayout jsonRawData](self->_layoutForLastStalenessRotation, "jsonRawData");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = (void *)objc_msgSend(v16, "initWithFormat:", CFSTR("Stack created %@\nLast stack rotation: %@: %@ - %@ - %@\nLast stack shown: %@: %@\nLast user scroll stack rotation: %@: %@ - %@ - %@\nLast staleness rotation layout for stack: %@\nDate of last staleness rotation: %@\n"), v15, v13, v3, v14, v11, v12, v4, v5, v6, v7, v8, v9, self->_dateOfLastStalenessRotation);

  return v17;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  ATXHomeScreenEvent *stackCreationEvent;
  id v5;

  stackCreationEvent = self->_stackCreationEvent;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", stackCreationEvent, CFSTR("codingKeyForStackCreationEvent"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_lastStackRotationEvent, CFSTR("codingKeyForLastStackRotationEvent"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_lastStackShownEvent, CFSTR("codingKeyForLastStackShownEvent"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_lastUserScrollStackRotationEvent, CFSTR("codingKeyForLastUserScrollStackRotationEvent"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_layoutForLastStalenessRotation, CFSTR("codingKeyForLayoutForLastStalenessRotation"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_dateOfLastStalenessRotation, CFSTR("codingKeyFordateOfLastStalenessRotation"));

}

- (ATXStackState)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  ATXStackState *v10;
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
  void *v26;
  uint64_t v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  uint64_t v32;
  void *v33;
  void *v34;
  void *v35;
  ATXStackState *v36;
  id *p_isa;
  objc_super v39;

  v4 = a3;
  v5 = (void *)MEMORY[0x1E0D81610];
  v6 = objc_opt_class();
  __atxlog_handle_blending();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "robustDecodeObjectOfClass:forKey:withCoder:expectNonNull:errorDomain:errorCode:logHandle:", v6, CFSTR("codingKeyForStackCreationEvent"), v4, 0, CFSTR("com.apple.proactive.StackRotationStatus"), -1, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "error");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    v10 = 0;
  }
  else
  {
    v11 = (void *)MEMORY[0x1E0D81610];
    v12 = objc_opt_class();
    __atxlog_handle_blending();
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "robustDecodeObjectOfClass:forKey:withCoder:expectNonNull:errorDomain:errorCode:logHandle:", v12, CFSTR("codingKeyForLastStackRotationEvent"), v4, 0, CFSTR("com.apple.proactive.StackRotationStatus"), -1, v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "error");
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    if (v15)
    {
      v10 = 0;
    }
    else
    {
      v16 = (void *)MEMORY[0x1E0D81610];
      v17 = objc_opt_class();
      __atxlog_handle_blending();
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "robustDecodeObjectOfClass:forKey:withCoder:expectNonNull:errorDomain:errorCode:logHandle:", v17, CFSTR("codingKeyForLastStackShownEvent"), v4, 0, CFSTR("com.apple.proactive.StackRotationStatus"), -1, v18);
      v19 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v4, "error");
      v20 = (void *)objc_claimAutoreleasedReturnValue();

      if (v20)
      {
        v10 = 0;
      }
      else
      {
        v21 = (void *)MEMORY[0x1E0D81610];
        v22 = objc_opt_class();
        __atxlog_handle_blending();
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "robustDecodeObjectOfClass:forKey:withCoder:expectNonNull:errorDomain:errorCode:logHandle:", v22, CFSTR("codingKeyForLastUserScrollStackRotationEvent"), v4, 0, CFSTR("com.apple.proactive.StackRotationStatus"), -1, v23);
        v24 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v4, "error");
        v25 = (void *)objc_claimAutoreleasedReturnValue();

        if (v25)
        {
          v10 = 0;
        }
        else
        {
          v26 = (void *)MEMORY[0x1E0D81610];
          v27 = objc_opt_class();
          __atxlog_handle_blending();
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v26, "robustDecodeObjectOfClass:forKey:withCoder:expectNonNull:errorDomain:errorCode:logHandle:", v27, CFSTR("codingKeyForLayoutForLastStalenessRotation"), v4, 0, CFSTR("com.apple.proactive.StackRotationStatus"), -1, v28);
          v29 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v4, "error");
          v30 = (void *)objc_claimAutoreleasedReturnValue();

          if (v30)
          {
            v10 = 0;
          }
          else
          {
            v31 = (void *)MEMORY[0x1E0D81610];
            v32 = objc_opt_class();
            __atxlog_handle_blending();
            v33 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v31, "robustDecodeObjectOfClass:forKey:withCoder:expectNonNull:errorDomain:errorCode:logHandle:", v32, CFSTR("codingKeyFordateOfLastStalenessRotation"), v4, 0, CFSTR("com.apple.proactive.StackRotationStatus"), -1, v33);
            v34 = (void *)objc_claimAutoreleasedReturnValue();

            objc_msgSend(v4, "error");
            v35 = (void *)objc_claimAutoreleasedReturnValue();

            if (v35)
            {
              v10 = 0;
            }
            else
            {
              v39.receiver = self;
              v39.super_class = (Class)ATXStackState;
              v36 = -[ATXStackState init](&v39, sel_init);
              p_isa = (id *)&v36->super.isa;
              if (v36)
              {
                objc_storeStrong((id *)&v36->_stackCreationEvent, v8);
                objc_storeStrong(p_isa + 2, v14);
                objc_storeStrong(p_isa + 3, v19);
                objc_storeStrong(p_isa + 4, v24);
                objc_storeStrong(p_isa + 5, v29);
                objc_storeStrong(p_isa + 6, v34);
              }
              self = p_isa;
              v10 = self;
            }

          }
        }

      }
    }

  }
  return v10;
}

- (ATXHomeScreenEvent)stackCreationEvent
{
  return self->_stackCreationEvent;
}

- (void)setStackCreationEvent:(id)a3
{
  objc_storeStrong((id *)&self->_stackCreationEvent, a3);
}

- (ATXHomeScreenEvent)lastStackRotationEvent
{
  return self->_lastStackRotationEvent;
}

- (void)setLastStackRotationEvent:(id)a3
{
  objc_storeStrong((id *)&self->_lastStackRotationEvent, a3);
}

- (ATXHomeScreenEvent)lastStackShownEvent
{
  return self->_lastStackShownEvent;
}

- (void)setLastStackShownEvent:(id)a3
{
  objc_storeStrong((id *)&self->_lastStackShownEvent, a3);
}

- (ATXHomeScreenEvent)lastUserScrollStackRotationEvent
{
  return self->_lastUserScrollStackRotationEvent;
}

- (void)setLastUserScrollStackRotationEvent:(id)a3
{
  objc_storeStrong((id *)&self->_lastUserScrollStackRotationEvent, a3);
}

- (ATXSuggestionLayout)layoutForLastStalenessRotation
{
  return self->_layoutForLastStalenessRotation;
}

- (void)setLayoutForLastStalenessRotation:(id)a3
{
  objc_storeStrong((id *)&self->_layoutForLastStalenessRotation, a3);
}

- (NSDate)dateOfLastStalenessRotation
{
  return self->_dateOfLastStalenessRotation;
}

- (void)setDateOfLastStalenessRotation:(id)a3
{
  objc_storeStrong((id *)&self->_dateOfLastStalenessRotation, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dateOfLastStalenessRotation, 0);
  objc_storeStrong((id *)&self->_layoutForLastStalenessRotation, 0);
  objc_storeStrong((id *)&self->_lastUserScrollStackRotationEvent, 0);
  objc_storeStrong((id *)&self->_lastStackShownEvent, 0);
  objc_storeStrong((id *)&self->_lastStackRotationEvent, 0);
  objc_storeStrong((id *)&self->_stackCreationEvent, 0);
}

@end
