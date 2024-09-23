@implementation FBSShutdownOptions

- (FBSShutdownOptions)init
{
  void *v4;
  void *v5;
  objc_class *v6;
  void *v7;
  FBSShutdownOptions *result;
  int v9;
  void *v10;
  __int16 v11;
  void *v12;
  __int16 v13;
  FBSShutdownOptions *v14;
  __int16 v15;
  const __CFString *v16;
  __int16 v17;
  int v18;
  __int16 v19;
  void *v20;

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Please use \"-[FBSShutdownOptions initWithReason:] instead."));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    NSStringFromSelector(a2);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (objc_class *)objc_opt_class();
    NSStringFromClass(v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = 138544642;
    v10 = v5;
    v11 = 2114;
    v12 = v7;
    v13 = 2048;
    v14 = self;
    v15 = 2114;
    v16 = CFSTR("FBSShutdownOptions.m");
    v17 = 1024;
    v18 = 17;
    v19 = 2114;
    v20 = v4;
    _os_log_error_impl(&dword_19A6D4000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", (uint8_t *)&v9, 0x3Au);

  }
  objc_msgSend(objc_retainAutorelease(v4), "UTF8String");
  result = (FBSShutdownOptions *)_bs_set_crash_log_message();
  __break(0);
  return result;
}

- (FBSShutdownOptions)initWithReason:(id)a3
{
  id v5;
  FBSShutdownOptions *v6;
  uint64_t v7;
  NSString *reason;
  void *v10;
  objc_super v11;

  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("FBSShutdownOptions.m"), 22, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("reason"));

  }
  v11.receiver = self;
  v11.super_class = (Class)FBSShutdownOptions;
  v6 = -[FBSShutdownOptions init](&v11, sel_init);
  if (v6)
  {
    v7 = objc_msgSend(v5, "copy");
    reason = v6->_reason;
    v6->_reason = (NSString *)v7;

  }
  return v6;
}

- (BOOL)isShutdown
{
  return self->_rebootType == 0;
}

- (BOOL)isReboot
{
  return (unint64_t)(self->_rebootType - 1) < 2;
}

- (BOOL)isUserInitiated
{
  return self->_source == 1;
}

- (id)copyWithZone:(_NSZone *)a3
{
  FBSShutdownOptions *v5;
  void *v6;
  FBSShutdownOptions *v7;
  id WeakRetained;
  void *v9;

  v5 = [FBSShutdownOptions alloc];
  v6 = (void *)-[NSString copyWithZone:](self->_reason, "copyWithZone:", a3);
  v7 = -[FBSShutdownOptions initWithReason:](v5, "initWithReason:", v6);

  -[FBSShutdownOptions setRebootType:](v7, "setRebootType:", self->_rebootType);
  -[FBSShutdownOptions setSource:](v7, "setSource:", self->_source);
  -[FBSShutdownOptions setLPEMOption:](v7, "setLPEMOption:", self->_LPEMOption);
  WeakRetained = objc_loadWeakRetained((id *)&self->_localContext);
  v9 = (void *)objc_msgSend(WeakRetained, "copyWithZone:", a3);
  -[FBSShutdownOptions setLocalContext:](v7, "setLocalContext:", v9);

  return v7;
}

- (NSString)description
{
  return (NSString *)-[FBSShutdownOptions descriptionWithMultilinePrefix:](self, "descriptionWithMultilinePrefix:", 0);
}

- (id)succinctDescription
{
  void *v2;
  void *v3;

  -[FBSShutdownOptions succinctDescriptionBuilder](self, "succinctDescriptionBuilder");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "build");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)succinctDescriptionBuilder
{
  return (id)objc_msgSend(off_1E38E9DF0, "builderWithObject:", self);
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  void *v3;
  void *v4;

  -[FBSShutdownOptions descriptionBuilderWithMultilinePrefix:](self, "descriptionBuilderWithMultilinePrefix:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "build");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  void *v4;
  id v5;
  id v6;
  id v7;
  _QWORD v9[4];
  id v10;
  FBSShutdownOptions *v11;

  -[FBSShutdownOptions succinctDescriptionBuilder](self, "succinctDescriptionBuilder", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __60__FBSShutdownOptions_descriptionBuilderWithMultilinePrefix___block_invoke;
  v9[3] = &unk_1E38EAE08;
  v5 = v4;
  v10 = v5;
  v11 = self;
  v6 = (id)objc_msgSend(v5, "modifyProem:", v9);
  v7 = v5;

  return v7;
}

void __60__FBSShutdownOptions_descriptionBuilderWithMultilinePrefix___block_invoke(uint64_t a1)
{
  uint64_t v2;
  const __CFString *v3;
  id v4;
  uint64_t v5;
  const __CFString *v6;
  id v7;
  uint64_t v8;
  const __CFString *v9;
  id v10;
  void *v11;
  id v12;
  id WeakRetained;

  objc_msgSend(*(id *)(a1 + 32), "appendString:withName:", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8), CFSTR("reason"));
  v2 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 16);
  if (v2 == 2)
  {
    v3 = CFSTR("RebootDark");
  }
  else
  {
    if (v2 != 1)
      goto LABEL_6;
    v3 = CFSTR("Reboot");
  }
  v4 = (id)objc_msgSend(*(id *)(a1 + 32), "appendBool:withName:", 1, v3);
LABEL_6:
  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 24);
  if (v5)
  {
    if (v5 != 1)
      goto LABEL_11;
    v6 = CFSTR("UserInitiated");
  }
  else
  {
    v6 = CFSTR("UnknownSource");
  }
  v7 = (id)objc_msgSend(*(id *)(a1 + 32), "appendBool:withName:", 1, v6);
LABEL_11:
  v8 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 32);
  if (v8 == 1)
  {
    v9 = CFSTR("disableLPEM");
    goto LABEL_15;
  }
  if (v8 == 2)
  {
    v9 = CFSTR("enableLPEM");
LABEL_15:
    v10 = (id)objc_msgSend(*(id *)(a1 + 32), "appendBool:withName:", 1, v9);
  }
  v11 = *(void **)(a1 + 32);
  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 40) + 40));
  v12 = (id)objc_msgSend(v11, "appendObject:withName:skipIfNil:", WeakRetained, CFSTR("localContext"), 1);

}

- (FBSShutdownOptions)initWithXPCDictionary:(id)a3
{
  id v4;
  void *v5;
  FBSShutdownOptions *v6;

  v4 = a3;
  BSDeserializeStringFromXPCDictionaryWithKey();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[FBSShutdownOptions initWithReason:](self, "initWithReason:", v5);
  if (v6)
  {
    v6->_rebootType = xpc_dictionary_get_int64(v4, "rebootType");
    v6->_source = xpc_dictionary_get_int64(v4, "source");
    v6->_LPEMOption = xpc_dictionary_get_int64(v4, "lpem");
  }

  return v6;
}

- (void)encodeWithXPCDictionary:(id)a3
{
  xpc_object_t xdict;

  xdict = a3;
  BSSerializeStringToXPCDictionaryWithKey();
  xpc_dictionary_set_int64(xdict, "rebootType", self->_rebootType);
  xpc_dictionary_set_int64(xdict, "source", self->_source);
  xpc_dictionary_set_int64(xdict, "lpem", self->_LPEMOption);

}

- (NSString)reason
{
  return self->_reason;
}

- (int64_t)rebootType
{
  return self->_rebootType;
}

- (void)setRebootType:(int64_t)a3
{
  self->_rebootType = a3;
}

- (int64_t)source
{
  return self->_source;
}

- (void)setSource:(int64_t)a3
{
  self->_source = a3;
}

- (int64_t)LPEMOption
{
  return self->_LPEMOption;
}

- (void)setLPEMOption:(int64_t)a3
{
  self->_LPEMOption = a3;
}

- (NSCopying)localContext
{
  return (NSCopying *)objc_loadWeakRetained((id *)&self->_localContext);
}

- (void)setLocalContext:(id)a3
{
  objc_storeWeak((id *)&self->_localContext, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_localContext);
  objc_storeStrong((id *)&self->_reason, 0);
}

@end
