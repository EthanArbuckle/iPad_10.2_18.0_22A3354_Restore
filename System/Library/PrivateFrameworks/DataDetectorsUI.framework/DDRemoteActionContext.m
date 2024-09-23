@implementation DDRemoteActionContext

+ (BOOL)isClassAllowedFromString:(id)a3
{
  if (a3)
    return objc_msgSend(&unk_1E426B270, "containsObject:");
  else
    return 0;
}

- (void)dealloc
{
  __DDResult *result;
  objc_super v4;

  result = self->_result;
  if (result)
  {
    CFRelease(result);
    self->_result = 0;
  }
  v4.receiver = self;
  v4.super_class = (Class)DDRemoteActionContext;
  -[DDRemoteActionContext dealloc](&v4, sel_dealloc);
}

- (DDRemoteActionContext)initWithURL:(id)a3 result:(__DDResult *)a4 context:(id)a5 associatedResults:(id)a6 associatedVisualResults:(id)a7 className:(id)a8
{
  id v15;
  id v16;
  id v17;
  DDRemoteActionContext *v18;
  __DDResult *v19;
  DDRemoteActionContext *v20;
  id v22;
  id v23;
  objc_super v24;

  v23 = a3;
  v22 = a5;
  v15 = a6;
  v16 = a7;
  v17 = a8;
  v24.receiver = self;
  v24.super_class = (Class)DDRemoteActionContext;
  v18 = -[DDRemoteActionContext init](&v24, sel_init);
  if (!v18)
  {
LABEL_7:
    v20 = 0;
    goto LABEL_10;
  }
  if (!+[DDRemoteActionContext isClassAllowedFromString:](DDRemoteActionContext, "isClassAllowedFromString:", v17, v22, v23))
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
      -[DDRemoteActionContext initWithURL:result:context:associatedResults:associatedVisualResults:className:].cold.1();
    goto LABEL_7;
  }
  objc_storeStrong((id *)&v18->_URL, a3);
  if (a4)
    v19 = (__DDResult *)CFRetain(a4);
  else
    v19 = 0;
  v18->_result = v19;
  objc_storeStrong((id *)&v18->_context, a5);
  objc_storeStrong((id *)&v18->_actionClass, a8);
  objc_storeStrong((id *)&v18->_associatedResults, a6);
  objc_storeStrong((id *)&v18->_associatedVisualResults, a7);
  v20 = v18;
LABEL_10:

  return v20;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  NSArray *associatedVisualResults;
  void *v8;
  id v9;

  v9 = a3;
  +[DDAction encodableContextWithContext:](DDAction, "encodableContextWithContext:", self->_context);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "encodeObject:forKey:", v4, CFSTR("context"));

  objc_msgSend(v9, "encodeObject:forKey:", self->_actionClass, CFSTR("actionClass"));
  if (self->_result)
  {
    objc_msgSend(MEMORY[0x1E0D1CE68], "resultFromCoreResult:");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "encodeObject:forKey:", v5, CFSTR("result"));

  }
  if (self->_associatedResults)
  {
    objc_msgSend(MEMORY[0x1E0D1CE68], "resultsFromCoreResults:");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "encodeObject:forKey:", v6, CFSTR("associatedResults"));

  }
  associatedVisualResults = self->_associatedVisualResults;
  if (associatedVisualResults)
    objc_msgSend(v9, "encodeObject:forKey:", associatedVisualResults, CFSTR("associatedVisualResults"));
  -[DDRemoteActionContext URL](self, "URL");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "encodeObject:forKey:", v8, CFSTR("url"));

}

- (DDRemoteActionContext)initWithCoder:(id)a3
{
  id v5;
  DDRemoteActionContext *v6;
  void *v7;
  id v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  void *v24;
  NSArray *v25;
  id v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  NSArray *associatedResults;
  void *v32;
  uint64_t v33;
  uint64_t v34;
  void *v35;
  uint64_t v36;
  NSArray *associatedVisualResults;
  void *v38;
  void *v39;
  DDRemoteActionContext *v40;
  SEL v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  objc_super v47;
  _BYTE v48[128];
  uint64_t v49;

  v49 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v47.receiver = self;
  v47.super_class = (Class)DDRemoteActionContext;
  v6 = -[DDRemoteActionContext init](&v47, sel_init);
  if (v6)
  {
    v42 = a2;
    objc_msgSend(v5, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("url"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[DDRemoteActionContext setURL:](v6, "setURL:", v7);

    v8 = objc_alloc(MEMORY[0x1E0C99E08]);
    v9 = (void *)MEMORY[0x1E0C99E60];
    v10 = objc_opt_class();
    v11 = objc_opt_class();
    v12 = objc_opt_class();
    v13 = objc_opt_class();
    v14 = objc_opt_class();
    v15 = objc_opt_class();
    objc_msgSend(v9, "setWithObjects:", v10, v11, v12, v13, v14, v15, objc_opt_class(), 0);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "decodeObjectOfClasses:forKey:", v16, CFSTR("context"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = (void *)objc_msgSend(v8, "initWithDictionary:", v17);
    -[DDRemoteActionContext setContext:](v6, "setContext:", v18);

    if (objc_msgSend(v5, "containsValueForKey:", CFSTR("result")))
    {
      objc_msgSend(v5, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("result"));
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      -[DDRemoteActionContext setResult:](v6, "setResult:", CFRetain((CFTypeRef)objc_msgSend(v19, "coreResult")));

    }
    if (objc_msgSend(v5, "containsValueForKey:", CFSTR("associatedResults")))
    {
      v20 = (void *)MEMORY[0x1E0C99E60];
      v21 = objc_opt_class();
      v22 = objc_opt_class();
      objc_msgSend(v20, "setWithObjects:", v21, v22, objc_opt_class(), 0);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "decodeObjectOfClasses:forKey:", v23, CFSTR("associatedResults"));
      v24 = (void *)objc_claimAutoreleasedReturnValue();

      v25 = (NSArray *)objc_opt_new();
      v43 = 0u;
      v44 = 0u;
      v45 = 0u;
      v46 = 0u;
      v26 = v24;
      v27 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v43, v48, 16);
      if (v27)
      {
        v28 = v27;
        v29 = *(_QWORD *)v44;
        do
        {
          v30 = 0;
          do
          {
            if (*(_QWORD *)v44 != v29)
              objc_enumerationMutation(v26);
            -[NSArray addObject:](v25, "addObject:", objc_msgSend(*(id *)(*((_QWORD *)&v43 + 1) + 8 * v30++), "coreResult"));
          }
          while (v28 != v30);
          v28 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v43, v48, 16);
        }
        while (v28);
      }

      associatedResults = v6->_associatedResults;
      v6->_associatedResults = v25;

    }
    if (objc_msgSend(v5, "containsValueForKey:", CFSTR("associatedVisualResults")))
    {
      v32 = (void *)MEMORY[0x1E0C99E60];
      v33 = objc_opt_class();
      v34 = objc_opt_class();
      objc_msgSend(v32, "setWithObjects:", v33, v34, objc_opt_class(), 0);
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "decodeObjectOfClasses:forKey:", v35, CFSTR("associatedVisualResults"));
      v36 = objc_claimAutoreleasedReturnValue();
      associatedVisualResults = v6->_associatedVisualResults;
      v6->_associatedVisualResults = (NSArray *)v36;

    }
    objc_msgSend(v5, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("actionClass"));
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    if (+[DDRemoteActionContext isClassAllowedFromString:](DDRemoteActionContext, "isClassAllowedFromString:", v38))
    {
      -[DDRemoteActionContext setActionClass:](v6, "setActionClass:", v38);
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v39, "handleFailureInMethod:object:file:lineNumber:description:", v42, v6, CFSTR("DDRemoteAction.m"), 632, CFSTR("Trying to create a context with an invalid preview action class or an empty class."));

    }
    v40 = v6;

  }
  return v6;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSURL)URL
{
  return (NSURL *)objc_getProperty(self, a2, 8, 1);
}

- (void)setURL:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 8);
}

- (__DDResult)result
{
  return self->_result;
}

- (void)setResult:(__DDResult *)a3
{
  self->_result = a3;
}

- (NSDictionary)context
{
  return (NSDictionary *)objc_getProperty(self, a2, 24, 1);
}

- (void)setContext:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 24);
}

- (NSArray)associatedResults
{
  return (NSArray *)objc_getProperty(self, a2, 32, 1);
}

- (void)setAssociatedResults:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 32);
}

- (NSArray)associatedVisualResults
{
  return (NSArray *)objc_getProperty(self, a2, 40, 1);
}

- (NSString)hostApplicationIdentifier
{
  return (NSString *)objc_getProperty(self, a2, 48, 1);
}

- (void)setHostApplicationIdentifier:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 48);
}

- (NSString)actionClass
{
  return (NSString *)objc_getProperty(self, a2, 56, 1);
}

- (void)setActionClass:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 56);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_actionClass, 0);
  objc_storeStrong((id *)&self->_hostApplicationIdentifier, 0);
  objc_storeStrong((id *)&self->_associatedVisualResults, 0);
  objc_storeStrong((id *)&self->_associatedResults, 0);
  objc_storeStrong((id *)&self->_context, 0);
  objc_storeStrong((id *)&self->_URL, 0);
}

- (void)initWithURL:result:context:associatedResults:associatedVisualResults:className:.cold.1()
{
  uint8_t v0[16];

  *(_WORD *)v0 = 0;
  _os_log_fault_impl(&dword_19EFBB000, MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT, "Trying to create a context with an invalid preview action class.", v0, 2u);
}

@end
