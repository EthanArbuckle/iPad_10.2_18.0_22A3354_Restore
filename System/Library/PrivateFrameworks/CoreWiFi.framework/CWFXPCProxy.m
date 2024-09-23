@implementation CWFXPCProxy

- (id)__copyReplyBlockFromInvocation:(id)a3
{
  id v3;
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  unint64_t v14;
  id v15;
  uint64_t v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  const char *ArgumentTypeAtIndex;
  const char *v21;
  uint64_t v22;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  void *v29;

  v3 = a3;
  objc_msgSend_methodSignature(v3, v4, v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend_numberOfArguments(v8, v9, v10, v11, v12);
  if (v13 >= 3
    && (v14 = v13,
        v15 = objc_retainAutorelease(v8),
        v16 = v14 - 1,
        ArgumentTypeAtIndex = (const char *)objc_msgSend_getArgumentTypeAtIndex_(v15, v17, v16, v18, v19),
        !strcmp(ArgumentTypeAtIndex, "@?")))
  {
    v29 = 0;
    objc_msgSend_getArgument_atIndex_(v3, v21, (uint64_t)&v29, v16, v22);
    v27 = (void *)objc_msgSend_copy(v29, v23, v24, v25, v26);
  }
  else
  {
    v27 = 0;
  }

  return v27;
}

- (void)forwardInvocation:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  dispatch_block_t v14;
  id v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  const char *v26;
  uint64_t v27;
  const char *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  const char *v33;
  uint64_t v34;
  uint64_t v35;
  const char *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  void *v40;
  const char *v41;
  uint64_t v42;
  uint64_t v43;
  const char *v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  void *v48;
  NSObject *v49;
  id v50;
  id v51;
  void *v52;
  _BYTE v53[12];
  __int16 v54;
  const char *v55;
  __int16 v56;
  int v57;
  __int16 v58;
  id v59;
  uint64_t v60;

  v60 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (objc_msgSend_isSynchronous(self, v5, v6, v7, v8))
  {
    v13 = (void *)objc_msgSend___copyReplyBlockFromInvocation_(self, v9, (uint64_t)v4, v11, v12);
    if (v13)
    {
      v14 = dispatch_block_create((dispatch_block_flags_t)0, &unk_1E61326E0);
      _Block_signature(v13);
      v51 = v13;
      v52 = v14;
      v15 = v14;
      *(_QWORD *)v53 = __NSMakeSpecialForwardingCaptureBlock();
      objc_msgSend_methodSignature(v4, v16, v17, v18, v19);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = objc_msgSend_numberOfArguments(v20, v21, v22, v23, v24);
      objc_msgSend_setArgument_atIndex_(v4, v26, (uint64_t)v53, v25 - 1, v27);

      objc_msgSend_target(self, v28, v29, v30, v31);
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_setTarget_(v4, v33, (uint64_t)v32, v34, v35);

      objc_msgSend_invoke(v4, v36, v37, v38, v39);
      dispatch_block_wait(v15, 0xFFFFFFFFFFFFFFFFLL);

    }
    else
    {
      CWFGetOSLog();
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      if (v48)
      {
        CWFGetOSLog();
        v49 = objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v49 = MEMORY[0x1E0C81028];
        v50 = MEMORY[0x1E0C81028];
      }

      if (os_log_type_enabled(v49, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)v53 = 136446978;
        *(_QWORD *)&v53[4] = "-[CWFXPCProxy forwardInvocation:]";
        v54 = 2082;
        v55 = "CWFXPCProxy.m";
        v56 = 1024;
        v57 = 81;
        v58 = 2114;
        v59 = v4;
        _os_log_send_and_compose_impl();
      }

    }
  }
  else
  {
    objc_msgSend_target(self, v9, v10, v11, v12);
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setTarget_(v4, v41, (uint64_t)v40, v42, v43);

    objc_msgSend_invoke(v4, v44, v45, v46, v47);
  }

}

- (id)methodSignatureForSelector:(SEL)a3
{
  uint64_t v3;
  uint64_t v4;
  void *v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;

  objc_msgSend_target(self, a2, (uint64_t)a3, v3, v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_methodSignatureForSelector_(v6, v7, (uint64_t)a3, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (BOOL)isSynchronous
{
  return self->_synchronous;
}

- (void)setSynchronous:(BOOL)a3
{
  self->_synchronous = a3;
}

- (id)target
{
  return self->_target;
}

- (void)setTarget:(id)a3
{
  objc_storeStrong(&self->_target, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_target, 0);
}

@end
