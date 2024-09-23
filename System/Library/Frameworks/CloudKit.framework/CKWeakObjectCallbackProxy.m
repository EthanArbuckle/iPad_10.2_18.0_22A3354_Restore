@implementation CKWeakObjectCallbackProxy

- (void)forwardInvocation:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  Protocol *v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  const char *v15;
  SEL name;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  const char *v24;
  uint64_t v25;
  uint64_t v26;
  int v27;
  const char *v28;
  uint64_t v29;
  uint64_t v30;
  const char *v31;
  uint64_t v32;
  const char *v33;
  void *v34;
  void *v35;
  const char *v36;
  uint64_t v37;
  uint64_t v38;
  void *v39;
  const char *v40;
  objc_super v41;

  v4 = a3;
  objc_msgSend_retainArguments(v4, v5, v6, v7);
  objc_msgSend_callbackProtocol(self, v8, v9, v10);
  v11 = (Protocol *)objc_claimAutoreleasedReturnValue();
  v15 = (const char *)objc_msgSend_selector(v4, v12, v13, v14);
  name = protocol_getMethodDescription(v11, v15, 1, 1).name;

  if (name)
  {
    objc_msgSend_weakObject(self, v17, v18, v19);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    if (v23)
    {
      objc_msgSend_setTarget_(v4, v20, (uint64_t)v23, v22);
      objc_msgSend_invoke(v4, v24, v25, v26);
    }
    else
    {
      v27 = objc_msgSend_hadObject(self, v20, v21, v22);
      v31 = (const char *)objc_msgSend_selector(v4, v28, v29, v30);
      NSStringFromSelector(v31);
      v32 = objc_claimAutoreleasedReturnValue();
      v34 = (void *)v32;
      if (v27)
        objc_msgSend_errorWithDomain_code_format_(CKPrettyError, v33, (uint64_t)CFSTR("CKInternalErrorDomain"), 1000, CFSTR("Weak object went nil before proxy could forward %@ to it."), v32);
      else
        objc_msgSend_errorWithDomain_code_format_(CKPrettyError, v33, (uint64_t)CFSTR("CKInternalErrorDomain"), 1000, CFSTR("Proxy never had a real target for %@"), v32);
      v35 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend_callbackProtocol(self, v36, v37, v38);
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_CKInvokeAndNilOutReplyBlockWithError_forProtocol_(v4, v40, (uint64_t)v35, (uint64_t)v39);

    }
  }
  else
  {
    v41.receiver = self;
    v41.super_class = (Class)CKWeakObjectCallbackProxy;
    -[CKWeakObjectCallbackProxy forwardInvocation:](&v41, sel_forwardInvocation_, v4);
  }

}

- (id)methodSignatureForSelector:(SEL)a3
{
  uint64_t v3;
  Protocol *v5;
  objc_method_description MethodDescription;
  const char *v7;
  uint64_t v8;
  void *v9;

  objc_msgSend_callbackProtocol(self, a2, (uint64_t)a3, v3);
  v5 = (Protocol *)objc_claimAutoreleasedReturnValue();
  MethodDescription = protocol_getMethodDescription(v5, a3, 1, 1);

  if (MethodDescription.name)
  {
    objc_msgSend_signatureWithObjCTypes_(MEMORY[0x1E0C99DD8], v7, (uint64_t)MethodDescription.types, v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v9 = 0;
  }
  return v9;
}

- (Protocol)callbackProtocol
{
  return self->_callbackProtocol;
}

- (id)weakObject
{
  return objc_loadWeakRetained(&self->_weakObject);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_callbackProtocol, 0);
  objc_destroyWeak(&self->_weakObject);
}

- (CKWeakObjectCallbackProxy)initWithWeakObject:(id)a3 callbackProtocol:(id)a4
{
  id v6;
  id v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  CKWeakObjectCallbackProxy *v12;

  v6 = a3;
  v7 = a4;
  v11 = objc_msgSend_init(self, v8, v9, v10);
  v12 = (CKWeakObjectCallbackProxy *)v11;
  if (v11)
  {
    *(_BYTE *)(v11 + 8) = v6 != 0;
    objc_storeWeak((id *)(v11 + 16), v6);
    objc_storeStrong((id *)&v12->_callbackProtocol, a4);
  }

  return v12;
}

- (void)setWeakObject:(id)a3
{
  objc_storeWeak(&self->_weakObject, a3);
}

- (BOOL)hadObject
{
  return self->_hadObject;
}

@end
