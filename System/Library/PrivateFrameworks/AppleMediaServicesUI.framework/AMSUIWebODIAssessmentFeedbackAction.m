@implementation AMSUIWebODIAssessmentFeedbackAction

- (AMSUIWebODIAssessmentFeedbackAction)initWithJSObject:(id)a3 context:(id)a4
{
  id v6;
  AMSUIWebODIAssessmentFeedbackAction *v7;
  void *v8;
  NSString *v9;
  NSString *cacheIdentifier;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  NSObject *v15;
  uint64_t v16;
  void *v17;
  objc_super v19;
  uint8_t buf[4];
  uint64_t v21;
  __int16 v22;
  void *v23;
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v19.receiver = self;
  v19.super_class = (Class)AMSUIWebODIAssessmentFeedbackAction;
  v7 = -[AMSUIWebAction initWithJSObject:context:](&v19, sel_initWithJSObject_context_, v6, a4);
  if (v7)
  {
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("cacheIdentifier"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v9 = v8;
    else
      v9 = 0;

    cacheIdentifier = v7->_cacheIdentifier;
    v7->_cacheIdentifier = v9;

    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("outcome"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v11;
    if (v11)
    {
      v13 = objc_msgSend(v11, "integerValue");
    }
    else
    {
      objc_msgSend(MEMORY[0x24BE081D8], "sharedWebUIConfig");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v14)
      {
        objc_msgSend(MEMORY[0x24BE081D8], "sharedConfig");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
      }
      objc_msgSend(v14, "OSLogObject");
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        v16 = objc_opt_class();
        AMSLogKey();
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v21 = v16;
        v22 = 2114;
        v23 = v17;
        _os_log_impl(&dword_211102000, v15, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Failed to parse outcome. Falling back to discarded outcome.", buf, 0x16u);

      }
      v13 = 1;
    }
    v7->_outcome = v13;

  }
  return v7;
}

- (id)runAction
{
  id v3;
  void *v4;
  unint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  objc_super v15;
  const __CFString *v16;
  _QWORD v17[2];

  v17[1] = *MEMORY[0x24BDAC8D0];
  v15.receiver = self;
  v15.super_class = (Class)AMSUIWebODIAssessmentFeedbackAction;
  v3 = -[AMSUIWebAction runAction](&v15, sel_runAction);
  v4 = (void *)MEMORY[0x24BE082E0];
  v5 = -[AMSUIWebODIAssessmentFeedbackAction outcome](self, "outcome");
  -[AMSUIWebODIAssessmentFeedbackAction cacheIdentifier](self, "cacheIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[AMSUIWebAction context](self, "context");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "bag");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v4, "provideFeedbackOnPayloadOutcome:cacheIdentifier:bag:", v5, v6, v8);

  v10 = (void *)MEMORY[0x24BE08340];
  v16 = CFSTR("status");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = v11;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v17, &v16, 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "promiseWithResult:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

- (NSString)cacheIdentifier
{
  return self->_cacheIdentifier;
}

- (void)setCacheIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_cacheIdentifier, a3);
}

- (unint64_t)outcome
{
  return self->_outcome;
}

- (void)setOutcome:(unint64_t)a3
{
  self->_outcome = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cacheIdentifier, 0);
}

@end
