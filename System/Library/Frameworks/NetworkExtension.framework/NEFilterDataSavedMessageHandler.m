@implementation NEFilterDataSavedMessageHandler

- (_QWORD)initWithGetVerdictBlock:(void *)a3 handleVerdictBlock:
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  objc_super v12;

  v5 = a2;
  v6 = a3;
  if (a1)
  {
    v12.receiver = a1;
    v12.super_class = (Class)NEFilterDataSavedMessageHandler;
    a1 = objc_msgSendSuper2(&v12, sel_init);
    if (a1)
    {
      v7 = _Block_copy(v5);
      v8 = (void *)a1[1];
      a1[1] = v7;

      v9 = _Block_copy(v6);
      v10 = (void *)a1[2];
      a1[2] = v9;

    }
  }

  return a1;
}

- (void)enqueueWithFlow:(void *)a3 context:
{
  const char *v5;
  id v6;
  id Property;
  id v8;
  uint64_t v9;
  const char *v10;
  id v11;
  id v12;
  id self;

  self = a2;
  v6 = a3;
  if (a1)
  {
    Property = self;
    if (self)
      Property = objc_getProperty(self, v5, 128, 1);
    v8 = Property;
    v9 = objc_msgSend(v8, "count");

    if (v9)
    {
      v11 = self;
      if (self)
        v11 = objc_getProperty(self, v10, 128, 1);
      v12 = v11;
      objc_msgSend(v12, "addObject:", a1);

    }
    else
    {
      -[NEFilterDataSavedMessageHandler executeWithFlow:context:](a1, self, v6);
    }
  }

}

- (void)executeWithFlow:(void *)a3 context:
{
  id v5;
  uint64_t v6;
  const char *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  id Property;
  id v13;
  const char *v14;
  id v15;
  id v16;
  const char *v17;
  void *v18;
  id v19;
  _BYTE *self;

  self = a2;
  v5 = a3;
  if (a1)
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 8) + 16))();
    v6 = objc_claimAutoreleasedReturnValue();
    v8 = (void *)v6;
    if (v6)
    {
      if ((*(_BYTE *)(v6 + 13) & 1) != 0)
      {
        Property = self;
        if (self)
        {
          if ((self[11] & 1) != 0)
          {
            objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99768], CFSTR("Flow is already paused"), 0);
            v19 = (id)objc_claimAutoreleasedReturnValue();
            objc_exception_throw(v19);
          }
          self[11] = 1;
          Property = objc_getProperty(self, v7, 128, 1);
        }
        v13 = Property;

        if (v13)
        {
          v15 = self;
          if (self)
            v15 = objc_getProperty(self, v14, 128, 1);
          v16 = v15;
          objc_msgSend(v16, "insertObject:atIndex:", a1, 0);

        }
        else
        {
          v18 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithObjects:", a1, 0);
          if (self)
            objc_setProperty_atomic(self, v17, v18, 128);

        }
        goto LABEL_17;
      }
      v9 = a1;
      v10 = self;
      v11 = v8;
    }
    else
    {
      v9 = a1;
      v10 = self;
      v11 = 0;
    }
    -[NEFilterDataSavedMessageHandler executeVerdictHandlerWithFlow:verdict:context:](v9, v10, v11, v5);
LABEL_17:

  }
}

- (void)executeVerdictHandlerWithFlow:(void *)a3 verdict:(void *)a4 context:
{
  id v7;
  id v8;
  id v9;
  void *v10;
  _QWORD v11[4];
  id v12;
  id v13;
  uint64_t v14;
  id v15;

  v7 = a2;
  v8 = a3;
  v9 = a4;
  v10 = v9;
  if (a1)
  {
    if (v9 && v8 && *((_BYTE *)v9 + 104) && objc_msgSend(v8, "needRules"))
    {
      v11[0] = MEMORY[0x1E0C809B0];
      v11[1] = 3221225472;
      v11[2] = __81__NEFilterDataSavedMessageHandler_executeVerdictHandlerWithFlow_verdict_context___block_invoke;
      v11[3] = &unk_1E3CC0388;
      v12 = v7;
      v13 = v10;
      v14 = a1;
      v15 = v8;
      objc_msgSend(v13, "fetchCurrentRulesForFlow:completionHandler:", v12, v11);

    }
    else
    {
      (*(void (**)(void))(*(_QWORD *)(a1 + 16) + 16))();
    }
  }

}

void __81__NEFilterDataSavedMessageHandler_executeVerdictHandlerWithFlow_verdict_context___block_invoke(uint64_t a1, void *a2)
{
  _BYTE *v3;
  NSObject *v4;
  void *v5;
  int v6;
  char isKindOfClass;
  __objc2_class *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  __objc2_class *v16;
  void *v17;
  int v18;
  void *v19;
  __int16 v20;
  _BYTE *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (nelog_is_debug_logging_enabled())
  {
    ne_log_obj();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    {
      objc_msgSend(*(id *)(a1 + 32), "identifierString");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = 138412546;
      v19 = v17;
      v20 = 2112;
      v21 = v3;
      _os_log_debug_impl(&dword_19BD16000, v4, OS_LOG_TYPE_DEBUG, "Control verdict for flow %@: %@", (uint8_t *)&v18, 0x16u);

    }
  }
  if (!v3)
  {
    objc_msgSend(*(id *)(a1 + 40), "_principalObject");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "handleRulesChanged");

LABEL_13:
    v10 = *(_QWORD *)(a1 + 48);
    if (v10)
      v11 = *(_QWORD *)(v10 + 8);
    else
      v11 = 0;
    (*(void (**)(void))(v11 + 16))();
    v12 = objc_claimAutoreleasedReturnValue();
    goto LABEL_16;
  }
  if ((v3[72] & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 40), "_principalObject");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "handleRulesChanged");

  }
  if ((v3[73] & 1) != 0)
    goto LABEL_13;
  v6 = objc_msgSend(v3, "drop");
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();
  if (!v6)
  {
    if ((isKindOfClass & 1) != 0)
    {
      v16 = NEFilterNewFlowVerdict;
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v16 = NEFilterDataVerdict;
      }
      else
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
          goto LABEL_32;
        v16 = NEFilterRemediationVerdict;
      }
    }
    -[__objc2_class allowVerdict](v16, "allowVerdict");
    v12 = objc_claimAutoreleasedReturnValue();
    goto LABEL_16;
  }
  if ((isKindOfClass & 1) != 0)
  {
    v8 = NEFilterNewFlowVerdict;
LABEL_28:
    -[__objc2_class dropVerdict](v8, "dropVerdict");
    v12 = objc_claimAutoreleasedReturnValue();
LABEL_16:
    v13 = (void *)v12;
    goto LABEL_17;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v8 = NEFilterDataVerdict;
    goto LABEL_28;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v8 = NEFilterRemediationVerdict;
    goto LABEL_28;
  }
LABEL_32:
  v13 = 0;
LABEL_17:
  v14 = *(_QWORD *)(a1 + 48);
  if (v14)
    v15 = *(_QWORD *)(v14 + 16);
  else
    v15 = 0;
  (*(void (**)(uint64_t, void *))(v15 + 16))(v15, v13);

}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_handleVerdict, 0);
  objc_storeStrong(&self->_getVerdict, 0);
}

@end
