@implementation GDViewUpdateSourceRequest

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_state, 0);
  objc_storeStrong((id *)&self->_latestBookmark, 0);
  objc_storeStrong((id *)&self->_initialBookmark, 0);
  objc_storeStrong((id *)&self->_configIdentifier, 0);
}

- (void)encodeWithCoder:(id)a3
{
  GDSourceListenerConfigIdentifier *configIdentifier;
  id v5;
  void *v6;
  const char *v7;
  NSData *initialBookmark;
  void *v9;
  const char *v10;
  NSData *latestBookmark;
  void *v12;
  const char *v13;
  NSString *state;
  void *v15;
  const char *v16;
  _BOOL8 triggered;
  const char *v18;
  id v19;

  configIdentifier = self->_configIdentifier;
  v5 = a3;
  NSStringFromSelector(sel_configIdentifier);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v5, v7, (uint64_t)configIdentifier, v6);

  initialBookmark = self->_initialBookmark;
  NSStringFromSelector(sel_initialBookmark);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v5, v10, (uint64_t)initialBookmark, v9);

  latestBookmark = self->_latestBookmark;
  NSStringFromSelector(sel_latestBookmark);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v5, v13, (uint64_t)latestBookmark, v12);

  state = self->_state;
  NSStringFromSelector(sel_state);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v5, v16, (uint64_t)state, v15);

  triggered = self->_triggered;
  NSStringFromSelector(sel_triggered);
  v19 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeBool_forKey_(v5, v18, triggered, v19);

}

- (GDViewUpdateSourceRequest)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  const char *v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  void *v12;
  GDViewUpdateSourceRequest *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  const char *v17;
  void *v18;
  const char *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  const char *v25;
  void *v26;
  const char *v27;
  uint64_t v28;
  void *v29;
  void *v30;
  uint64_t v31;
  void *v32;
  const char *v33;
  void *v34;
  const char *v35;
  uint64_t v36;
  void *v37;
  void *v38;
  const char *v39;
  uint64_t v40;
  const char *v41;
  uint64_t v42;
  void *v43;
  const char *v44;

  v4 = a3;
  v5 = (void *)MEMORY[0x1E0D81610];
  v6 = objc_opt_class();
  NSStringFromSelector(sel_configIdentifier);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_robustDecodeObjectOfClass_forKey_withCoder_expectNonNull_errorDomain_errorCode_logHandle_(v5, v8, v6, v7, v4, 1, CFSTR("GDViewUpdateSourceKeyError"), 9, 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9
    && (objc_msgSend_error(v4, v10, v11), v12 = (void *)objc_claimAutoreleasedReturnValue(), v12, !v12))
  {
    v14 = (void *)MEMORY[0x1E0D81610];
    v15 = objc_opt_class();
    NSStringFromSelector(sel_initialBookmark);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_robustDecodeObjectOfClass_forKey_withCoder_expectNonNull_errorDomain_errorCode_logHandle_(v14, v17, v15, v16, v4, 0, CFSTR("GDViewUpdateSourceKeyError"), 9, 0);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend_error(v4, v19, v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue();

    if (v21)
    {
      v13 = 0;
    }
    else
    {
      v22 = (void *)MEMORY[0x1E0D81610];
      v23 = objc_opt_class();
      NSStringFromSelector(sel_latestBookmark);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_robustDecodeObjectOfClass_forKey_withCoder_expectNonNull_errorDomain_errorCode_logHandle_(v22, v25, v23, v24, v4, 0, CFSTR("GDViewUpdateSourceKeyError"), 9, 0);
      v26 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend_error(v4, v27, v28);
      v29 = (void *)objc_claimAutoreleasedReturnValue();

      if (v29)
      {
        v13 = 0;
      }
      else
      {
        v30 = (void *)MEMORY[0x1E0D81610];
        v31 = objc_opt_class();
        NSStringFromSelector(sel_state);
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_robustDecodeObjectOfClass_forKey_withCoder_expectNonNull_errorDomain_errorCode_logHandle_(v30, v33, v31, v32, v4, 1, CFSTR("GDViewUpdateSourceKeyError"), 9, 0);
        v34 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v34)
          goto LABEL_11;
        objc_msgSend_error(v4, v35, v36);
        v37 = (void *)objc_claimAutoreleasedReturnValue();

        if (v37
          || (NSStringFromSelector(sel_triggered),
              v38 = (void *)objc_claimAutoreleasedReturnValue(),
              v40 = objc_msgSend_decodeBoolForKey_(v4, v39, (uint64_t)v38),
              v38,
              objc_msgSend_error(v4, v41, v42),
              v43 = (void *)objc_claimAutoreleasedReturnValue(),
              v43,
              v43))
        {
LABEL_11:
          v13 = 0;
        }
        else
        {
          self = (GDViewUpdateSourceRequest *)(id)objc_msgSend_initWithConfigIdentifier_initialBookmark_latestBookmark_state_triggered_(self, v44, (uint64_t)v9, v18, v26, v34, v40);
          v13 = self;
        }

      }
    }

  }
  else
  {
    v13 = 0;
  }

  return v13;
}

- (GDViewUpdateSourceRequest)initWithConfigIdentifier:(id)a3 initialBookmark:(id)a4 latestBookmark:(id)a5 state:(id)a6 triggered:(BOOL)a7
{
  id v13;
  id v14;
  id v15;
  id v16;
  GDViewUpdateSourceRequest *v17;
  GDViewUpdateSourceRequest *v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  NSString *state;
  objc_super v24;

  v13 = a3;
  v14 = a4;
  v15 = a5;
  v16 = a6;
  v24.receiver = self;
  v24.super_class = (Class)GDViewUpdateSourceRequest;
  v17 = -[GDViewUpdateSourceRequest init](&v24, sel_init);
  v18 = v17;
  if (v17)
  {
    objc_storeStrong((id *)&v17->_configIdentifier, a3);
    objc_storeStrong((id *)&v18->_initialBookmark, a4);
    objc_storeStrong((id *)&v18->_latestBookmark, a5);
    v21 = objc_msgSend_copy(v16, v19, v20);
    state = v18->_state;
    v18->_state = (NSString *)v21;

    v18->_triggered = a7;
  }

  return v18;
}

- (id)description
{
  const char *v3;
  id v4;
  _BOOL8 triggered;
  const __CFString *v6;

  v4 = objc_alloc(MEMORY[0x1E0CB3940]);
  triggered = self->_triggered;
  v6 = CFSTR("notActionable");
  if (self->_triggered)
  {
    if (!objc_msgSend_isEqual_(self->_state, v3, (uint64_t)CFSTR("noChanges")))
      v6 = CFSTR("actionable ");
    triggered = self->_triggered;
  }
  return (id)objc_msgSend_initWithFormat_(v4, v3, (uint64_t)CFSTR("<GDViewUpdateSourceRequest %@, configId: %@, state: %@, triggered: %d>"), v6, self->_configIdentifier, self->_state, triggered);
}

- (GDSourceListenerConfigIdentifier)configIdentifier
{
  return self->_configIdentifier;
}

- (NSString)state
{
  return self->_state;
}

- (BOOL)triggered
{
  return self->_triggered;
}

- (NSData)initialBookmark
{
  return self->_initialBookmark;
}

- (NSData)latestBookmark
{
  return self->_latestBookmark;
}

- (void)setLatestBookmark:(id)a3
{
  objc_storeStrong((id *)&self->_latestBookmark, a3);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
