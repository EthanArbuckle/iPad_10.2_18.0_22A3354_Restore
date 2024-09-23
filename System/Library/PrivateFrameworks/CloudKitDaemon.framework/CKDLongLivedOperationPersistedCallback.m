@implementation CKDLongLivedOperationPersistedCallback

- (void)_validateInvocation
{
  uint64_t v2;
  Protocol *v5;
  void *v6;
  const char *v7;
  uint64_t v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  const char *v12;
  void *v13;
  const char *v14;
  uint64_t v15;
  void *v16;
  const char *v17;
  uint64_t v18;
  void *v19;
  const char *v20;
  uint64_t v21;
  void *v22;
  const char *v23;
  uint64_t v24;
  void *v25;
  const char *v26;
  uint64_t v27;
  void *v28;
  uint64_t v29;
  id v30;
  id v31;
  void *v32;
  id v33;
  id v34;
  void *v35;
  const char *v36;
  uint64_t v37;
  void *v38;
  const char *v39;
  uint64_t v40;
  uint64_t v41;
  const char *v42;
  void *v43;
  const char *v44;
  _QWORD v45[5];
  id v46;
  id v47;
  SEL v48;
  _QWORD aBlock[5];
  id v50;
  id v51;
  SEL v52;

  objc_msgSend_protocol(self, a2, v2);
  v5 = (Protocol *)objc_claimAutoreleasedReturnValue();
  NSStringFromProtocol(v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend_invocation(self, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (const char *)objc_msgSend_selector(v9, v10, v11);
  NSStringFromSelector(v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend_protocol(self, v14, v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_invocation(self, v17, v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_selector(v19, v20, v21);
  CKExtendedMethodSignatureForProtocolSelector();
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v22)
  {
    objc_msgSend_currentHandler(MEMORY[0x1E0CB3488], v23, v24);
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v43, v44, (uint64_t)a2, self, CFSTR("CKDLongLivedOperationPersistedCallback.m"), 40, CFSTR("Selector %@ not part of expected protocol %@"), v6, v13);

  }
  objc_msgSend_invocation(self, v23, v24);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_methodSignature(v25, v26, v27);
  v28 = (void *)objc_claimAutoreleasedReturnValue();

  v29 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = sub_1BEB6CBF8;
  aBlock[3] = &unk_1E7834F98;
  aBlock[4] = self;
  v52 = a2;
  v30 = v6;
  v50 = v30;
  v31 = v13;
  v51 = v31;
  v32 = _Block_copy(aBlock);
  v45[0] = v29;
  v45[1] = 3221225472;
  v45[2] = sub_1BEB6CC94;
  v45[3] = &unk_1E7834F98;
  v45[4] = self;
  v46 = v30;
  v47 = v31;
  v48 = a2;
  v33 = v31;
  v34 = v30;
  v35 = _Block_copy(v45);
  objc_msgSend_invocation(self, v36, v37);
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  v41 = objc_msgSend_numberOfArguments(v28, v39, v40);
  objc_msgSend_CKIterateArgumentsForIndexRange_primitiveTypeBlock_objectBlock_blockBlock_(v38, v42, 2, v41 - 2, 0, v35, v32);

}

- (CKDLongLivedOperationPersistedCallback)initWithProtocol:(id)a3 invocation:(id)a4 isCompletionCallback:(BOOL)a5
{
  id v9;
  id v10;
  CKDLongLivedOperationPersistedCallback *v11;
  CKDLongLivedOperationPersistedCallback *v12;
  const char *v13;
  uint64_t v14;
  objc_super v16;

  v9 = a3;
  v10 = a4;
  v16.receiver = self;
  v16.super_class = (Class)CKDLongLivedOperationPersistedCallback;
  v11 = -[CKDLongLivedOperationPersistedCallback init](&v16, sel_init);
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_protocol, a3);
    objc_storeStrong((id *)&v12->_invocation, a4);
    v12->_isCompletionCallback = a5;
    objc_msgSend__validateInvocation(v12, v13, v14);
  }

  return v12;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CKDLongLivedOperationPersistedCallback)initWithCoder:(id)a3
{
  id v4;
  CKDLongLivedOperationPersistedCallback *v5;
  uint64_t v6;
  const char *v7;
  NSString *v8;
  void *v9;
  uint64_t v10;
  const char *v11;
  NSString *v12;
  const char *v13;
  objc_method_description MethodDescription;
  uint64_t v15;
  const char *v16;
  const char *v17;
  const char *v18;
  const char *v19;
  const char *v20;
  void *v21;
  const char *v22;
  uint64_t v23;
  const char *v24;
  uint64_t v25;
  id v26;
  id v27;
  id v28;
  id v29;
  id v30;
  void *v31;
  const char *v32;
  uint64_t v33;
  uint64_t v34;
  const char *v35;
  int v36;
  NSObject *v37;
  NSObject *v38;
  NSObject *v39;
  CKDLongLivedOperationPersistedCallback *v40;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  NSString *v46;
  void *context;
  _QWORD v48[4];
  id v49;
  id v50;
  _QWORD v51[4];
  id v52;
  id v53;
  _QWORD aBlock[4];
  id v55;
  id v56;
  objc_super v57;
  uint8_t buf[4];
  NSString *v59;
  __int16 v60;
  void *v61;
  __int16 v62;
  NSString *v63;
  __int16 v64;
  NSString *v65;
  uint64_t v66;

  v66 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v57.receiver = self;
  v57.super_class = (Class)CKDLongLivedOperationPersistedCallback;
  v5 = -[CKDLongLivedOperationPersistedCallback init](&v57, sel_init);
  if (!v5)
    goto LABEL_25;
  context = (void *)MEMORY[0x1C3B83E24]();
  v6 = objc_opt_class();
  objc_msgSend_decodeObjectOfClass_forKey_(v4, v7, v6, CFSTR("ProtocolNamme"));
  v8 = (NSString *)objc_claimAutoreleasedReturnValue();
  NSProtocolFromString(v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    objc_storeStrong((id *)&v5->_protocol, v9);
    v10 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v11, v10, CFSTR("SelectorName"));
    v12 = (NSString *)objc_claimAutoreleasedReturnValue();
    v13 = NSSelectorFromString(v12);
    MethodDescription = protocol_getMethodDescription((Protocol *)v9, v13, 1, 1);
    if (MethodDescription.name)
    {
      v5->_isCompletionCallback = objc_msgSend_decodeBoolForKey_(v4, MethodDescription.types, (uint64_t)CFSTR("isCompletionCallback"));
      v15 = objc_opt_class();
      objc_msgSend_decodeObjectOfClass_forKey_(v4, v16, v15, CFSTR("ArgumentTypes"));
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_stringWithUTF8String_(MEMORY[0x1E0CB3940], v17, (uint64_t)MethodDescription.types);
      v46 = (NSString *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend_isEqualToString_(v46, v18, (uint64_t)v45) & 1) != 0)
      {
        objc_msgSend_signatureWithObjCTypes_(MEMORY[0x1E0C99DD8], v19, (uint64_t)MethodDescription.types);
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_invocationWithMethodSignature_(MEMORY[0x1E0C99DB8], v20, (uint64_t)v44);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_retainArguments(v21, v22, v23);
        objc_msgSend_setSelector_(v21, v24, (uint64_t)v13);
        v25 = MEMORY[0x1E0C809B0];
        aBlock[0] = MEMORY[0x1E0C809B0];
        aBlock[1] = 3221225472;
        aBlock[2] = sub_1BEB6D448;
        aBlock[3] = &unk_1E7834FC0;
        v26 = v4;
        v55 = v26;
        v27 = v21;
        v56 = v27;
        v42 = _Block_copy(aBlock);
        v51[0] = v25;
        v51[1] = 3221225472;
        v51[2] = sub_1BEB6D4C4;
        v51[3] = &unk_1E7834FE8;
        v28 = v26;
        v52 = v28;
        v29 = v27;
        v53 = v29;
        v43 = _Block_copy(v51);
        v48[0] = v25;
        v48[1] = 3221225472;
        v48[2] = sub_1BEB6D588;
        v48[3] = &unk_1E7834FE8;
        v49 = v28;
        v30 = v29;
        v50 = v30;
        v31 = _Block_copy(v48);
        v34 = objc_msgSend_numberOfArguments(v44, v32, v33);
        objc_msgSend_CKIterateArgumentsForIndexRange_primitiveTypeBlock_objectBlock_blockBlock_(v30, v35, 2, v34 - 2, v42, v43, v31);
        objc_storeStrong((id *)&v5->_invocation, v21);
        v36 = 0;

      }
      else
      {
        if (*MEMORY[0x1E0C95300] != -1)
          dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
        v39 = *MEMORY[0x1E0C952B0];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952B0], OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138544130;
          v59 = v46;
          v60 = 2114;
          v61 = v45;
          v62 = 2114;
          v63 = v8;
          v64 = 2114;
          v65 = v12;
          _os_log_error_impl(&dword_1BE990000, v39, OS_LOG_TYPE_ERROR, "Unexpected live argument types \"%{public}@\" vs. archived argument types \"%{public}@\" on -[%{public}@ %{public}@], ignoring", buf, 0x2Au);
        }
        v36 = 1;
      }

    }
    else
    {
      if (*MEMORY[0x1E0C95300] != -1)
        dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
      v38 = *MEMORY[0x1E0C952B0];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952B0], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543618;
        v59 = v12;
        v60 = 2112;
        v61 = v9;
        _os_log_error_impl(&dword_1BE990000, v38, OS_LOG_TYPE_ERROR, "Unknown selector name %{public}@ not found on protocol %@, ignoring", buf, 0x16u);
      }
      v36 = 1;
    }

  }
  else
  {
    if (*MEMORY[0x1E0C95300] != -1)
      dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
    v37 = *MEMORY[0x1E0C952B0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952B0], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      v59 = v8;
      _os_log_error_impl(&dword_1BE990000, v37, OS_LOG_TYPE_ERROR, "Unknown protocol name %{public}@ in operation info, ignoring", buf, 0xCu);
    }
    v36 = 1;
  }

  objc_autoreleasePoolPop(context);
  if (v36)
    v40 = 0;
  else
LABEL_25:
    v40 = v5;

  return v40;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  const char *v6;
  uint64_t v7;
  Protocol *v8;
  const char *Name;
  const char *v10;
  void *v11;
  const char *v12;
  const char *v13;
  uint64_t v14;
  void *v15;
  const char *v16;
  uint64_t v17;
  const char *v18;
  const char *v19;
  const char *v20;
  void *v21;
  const char *v22;
  const char *v23;
  const char *v24;
  uint64_t v25;
  Protocol *v26;
  char *types;
  const char *v28;
  void *v29;
  const char *v30;
  uint64_t v31;
  id v32;
  void *v33;
  id v34;
  void *v35;
  id v36;
  void *v37;
  const char *v38;
  uint64_t v39;
  void *v40;
  const char *v41;
  uint64_t v42;
  void *v43;
  const char *v44;
  uint64_t v45;
  void *v46;
  const char *v47;
  uint64_t v48;
  uint64_t v49;
  const char *v50;
  uint64_t v51;
  uint64_t v52;
  void (*v53)(uint64_t, const char *);
  void *v54;
  CKDLongLivedOperationPersistedCallback *v55;
  id v56;
  _QWORD v57[5];
  id v58;
  _QWORD aBlock[5];
  id v60;

  v4 = a3;
  v5 = (void *)MEMORY[0x1C3B83E24]();
  objc_msgSend_protocol(self, v6, v7);
  v8 = (Protocol *)objc_claimAutoreleasedReturnValue();
  Name = protocol_getName(v8);

  objc_msgSend_stringWithUTF8String_(MEMORY[0x1E0CB3940], v10, (uint64_t)Name);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v4, v12, (uint64_t)v11, CFSTR("ProtocolNamme"));

  objc_msgSend_invocation(self, v13, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = (const char *)objc_msgSend_selector(v15, v16, v17);

  v19 = sel_getName(v18);
  objc_msgSend_stringWithUTF8String_(MEMORY[0x1E0CB3940], v20, (uint64_t)v19);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v4, v22, (uint64_t)v21, CFSTR("SelectorName"));

  objc_msgSend_encodeBool_forKey_(v4, v23, self->_isCompletionCallback, CFSTR("isCompletionCallback"));
  objc_msgSend_protocol(self, v24, v25);
  v26 = (Protocol *)objc_claimAutoreleasedReturnValue();
  types = protocol_getMethodDescription(v26, v18, 1, 1).types;

  objc_msgSend_stringWithUTF8String_(MEMORY[0x1E0CB3940], v28, (uint64_t)types);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v4, v30, (uint64_t)v29, CFSTR("ArgumentTypes"));
  v31 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = sub_1BEB6D8D8;
  aBlock[3] = &unk_1E7834FC0;
  aBlock[4] = self;
  v32 = v4;
  v60 = v32;
  v33 = _Block_copy(aBlock);
  v57[0] = v31;
  v57[1] = 3221225472;
  v57[2] = sub_1BEB6D9C0;
  v57[3] = &unk_1E7834FE8;
  v57[4] = self;
  v34 = v32;
  v58 = v34;
  v35 = _Block_copy(v57);
  v51 = v31;
  v52 = 3221225472;
  v53 = sub_1BEB6DA70;
  v54 = &unk_1E7834FE8;
  v55 = self;
  v36 = v34;
  v56 = v36;
  v37 = _Block_copy(&v51);
  objc_msgSend_invocation(self, v38, v39, v51, v52, v53, v54, v55);
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_invocation(self, v41, v42);
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_methodSignature(v43, v44, v45);
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  v49 = objc_msgSend_numberOfArguments(v46, v47, v48);
  objc_msgSend_CKIterateArgumentsForIndexRange_primitiveTypeBlock_objectBlock_blockBlock_(v40, v50, 2, v49 - 2, v33, v35, v37);

  objc_autoreleasePoolPop(v5);
}

- (Protocol)protocol
{
  return self->_protocol;
}

- (void)setProtocol:(id)a3
{
  objc_storeStrong((id *)&self->_protocol, a3);
}

- (NSInvocation)invocation
{
  return self->_invocation;
}

- (void)setInvocation:(id)a3
{
  objc_storeStrong((id *)&self->_invocation, a3);
}

- (BOOL)isCompletionCallback
{
  return self->_isCompletionCallback;
}

- (void)setIsCompletionCallback:(BOOL)a3
{
  self->_isCompletionCallback = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_invocation, 0);
  objc_storeStrong((id *)&self->_protocol, 0);
}

@end
