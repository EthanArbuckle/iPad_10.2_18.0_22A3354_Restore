@implementation CLIntersiloProxy

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegateSilo);
  objc_destroyWeak((id *)&self->_delegate);
}

- (void)registerDelegate:(id)a3 inSilo:(id)a4
{
  id v6;
  CLIntersiloProxyDelegateProtocol **p_delegate;
  id WeakRetained;
  id v9;
  CLSilo **p_delegateSilo;
  id v11;
  NSObject *v12;
  NSObject *v13;
  NSObject *v14;
  id obj;
  uint8_t buf[4];
  int v17;
  __int16 v18;
  void *v19;
  __int16 v20;
  const char *v21;
  __int16 v22;
  const char *v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  obj = a3;
  v6 = a4;
  p_delegate = &self->_delegate;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(MEMORY[0x1E0C99E38], "null");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  if (WeakRetained != v9)
  {

LABEL_5:
    sub_1A1A12544();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 68289539;
      v17 = 0;
      v18 = 2082;
      v19 = &unk_1A1A18FAF;
      v20 = 2082;
      v21 = "assert";
      v22 = 2081;
      v23 = "_delegate == (id)[NSNull null] && !_delegateSilo";
      _os_log_impl(&dword_1A19F4000, v12, OS_LOG_TYPE_FAULT, "{\"msg%{public}.0s\":\"Once registered, delegate may not be changed\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", buf, 0x26u);
    }

    sub_1A1A12544();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_signpost_enabled(v13))
    {
      *(_DWORD *)buf = 68289539;
      v17 = 0;
      v18 = 2082;
      v19 = &unk_1A1A18FAF;
      v20 = 2082;
      v21 = "assert";
      v22 = 2081;
      v23 = "_delegate == (id)[NSNull null] && !_delegateSilo";
      _os_signpost_emit_with_name_impl(&dword_1A19F4000, v13, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "Once registered, delegate may not be changed", "{\"msg%{public}.0s\":\"Once registered, delegate may not be changed\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", buf, 0x26u);
    }

    sub_1A1A12544();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 68289539;
      v17 = 0;
      v18 = 2082;
      v19 = &unk_1A1A18FAF;
      v20 = 2082;
      v21 = "assert";
      v22 = 2081;
      v23 = "_delegate == (id)[NSNull null] && !_delegateSilo";
      _os_log_impl(&dword_1A19F4000, v14, OS_LOG_TYPE_INFO, "{\"msg%{public}.0s\":\"Once registered, delegate may not be changed\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", buf, 0x26u);
    }

    abort_report_np();
    __break(1u);
  }
  p_delegateSilo = &self->_delegateSilo;
  v11 = objc_loadWeakRetained((id *)p_delegateSilo);

  if (v11)
    goto LABEL_5;
  objc_storeWeak((id *)p_delegate, obj);
  objc_storeWeak((id *)p_delegateSilo, v6);

}

+ (id)proxyForRecipientObject:(id)a3 inSilo:(id)a4 recipientName:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  uint64_t v15;
  id v16;
  NSObject *v18;
  NSObject *v19;
  NSObject *v20;
  NSObject *v21;
  NSObject *v22;
  uint8_t buf[4];
  int v24;
  __int16 v25;
  void *v26;
  __int16 v27;
  const char *v28;
  __int16 v29;
  const char *v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = objc_alloc((Class)objc_msgSend(a1, "initiatorRepresentingClass"));
  v12 = objc_alloc((Class)objc_msgSend(a1, "recipientRepresentingClass"));
  v13 = v11;
  if ((id)objc_msgSend(v13, "initWithDelegateObject:delegateSilo:uninitializedPeer:", v8, v9, v12) != v13)
  {
    sub_1A1A12544();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 68289539;
      v24 = 0;
      v25 = 2082;
      v26 = &unk_1A1A18FAF;
      v27 = 2082;
      v28 = "assert";
      v29 = 2081;
      v30 = "postInit == initiatorProxy";
      _os_log_impl(&dword_1A19F4000, v18, OS_LOG_TYPE_FAULT, "{\"msg%{public}.0s\":\"Intersilo proxy init changed self\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", buf, 0x26u);
    }

    sub_1A1A12544();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_signpost_enabled(v19))
    {
      *(_DWORD *)buf = 68289539;
      v24 = 0;
      v25 = 2082;
      v26 = &unk_1A1A18FAF;
      v27 = 2082;
      v28 = "assert";
      v29 = 2081;
      v30 = "postInit == initiatorProxy";
      _os_signpost_emit_with_name_impl(&dword_1A19F4000, v19, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "Intersilo proxy init changed self", "{\"msg%{public}.0s\":\"Intersilo proxy init changed self\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", buf, 0x26u);
    }

    sub_1A1A12544();
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 68289539;
      v24 = 0;
      v25 = 2082;
      v26 = &unk_1A1A18FAF;
      v27 = 2082;
      v28 = "assert";
      v29 = 2081;
      v30 = "postInit == initiatorProxy";
      _os_log_impl(&dword_1A19F4000, v20, OS_LOG_TYPE_INFO, "{\"msg%{public}.0s\":\"Intersilo proxy init changed self\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", buf, 0x26u);
    }
LABEL_17:

    abort_report_np();
    __break(1u);
  }
  v14 = v12;
  v15 = objc_msgSend(v14, "initWithUninitializedPeer:", v13);

  if ((id)v15 != v14)
  {
    sub_1A1A12544();
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 68289539;
      v24 = 0;
      v25 = 2082;
      v26 = &unk_1A1A18FAF;
      v27 = 2082;
      v28 = "assert";
      v29 = 2081;
      v30 = "postInit == recipientProxy";
      _os_log_impl(&dword_1A19F4000, v21, OS_LOG_TYPE_FAULT, "{\"msg%{public}.0s\":\"Intersilo proxy init changed self\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", buf, 0x26u);
    }

    sub_1A1A12544();
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_signpost_enabled(v22))
    {
      *(_DWORD *)buf = 68289539;
      v24 = 0;
      v25 = 2082;
      v26 = &unk_1A1A18FAF;
      v27 = 2082;
      v28 = "assert";
      v29 = 2081;
      v30 = "postInit == recipientProxy";
      _os_signpost_emit_with_name_impl(&dword_1A19F4000, v22, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "Intersilo proxy init changed self", "{\"msg%{public}.0s\":\"Intersilo proxy init changed self\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", buf, 0x26u);
    }

    sub_1A1A12544();
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 68289539;
      v24 = 0;
      v25 = 2082;
      v26 = &unk_1A1A18FAF;
      v27 = 2082;
      v28 = "assert";
      v29 = 2081;
      v30 = "postInit == recipientProxy";
      _os_log_impl(&dword_1A19F4000, v20, OS_LOG_TYPE_INFO, "{\"msg%{public}.0s\":\"Intersilo proxy init changed self\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", buf, 0x26u);
    }
    goto LABEL_17;
  }
  v16 = objc_retainAutorelease(v10);
  objc_msgSend(v13, "setDelegateEntityName:", objc_msgSend(v16, "UTF8String"));

  return v14;
}

- (CLIntersiloProxy)init
{
  void *v3;

  objc_msgSend(MEMORY[0x1E0C99E38], "null");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_storeWeak((id *)&self->_delegate, v3);

  return self;
}

- (CLIntersiloProxy)initWithDelegateObject:(id)a3 delegateSilo:(id)a4
{
  CLIntersiloProxyDelegateProtocol **p_delegate;
  id v7;

  p_delegate = &self->_delegate;
  v7 = a4;
  objc_storeWeak((id *)p_delegate, a3);
  objc_storeWeak((id *)&self->_delegateSilo, v7);

  return self;
}

+ (Class)recipientRepresentingClass
{
  return (Class)objc_opt_class();
}

+ (Class)initiatorRepresentingClass
{
  return (Class)objc_opt_class();
}

- (BOOL)offsiloHandleInvocation:(id)a3 selectorInfo:(id)a4 peer:(id)a5
{
  return 1;
}

- (void)forwardInvocation:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  int v7;
  uint64_t v8;
  void *v9;
  int v10;
  NSObject *v11;
  char *v12;
  NSObject *v13;
  char *v14;
  id WeakRetained;
  id v16;
  BOOL v17;
  id v18;
  _BOOL4 v19;
  id v20;
  _BOOL4 v21;
  void *v22;
  std::__shared_weak_count *v23;
  unint64_t *p_shared_owners;
  id v25;
  id v26;
  std::__shared_weak_count_vtbl *v27;
  id v28;
  std::__shared_weak_count_vtbl *v29;
  id v30;
  unint64_t v31;
  void *v32;
  uint64_t *v33;
  unint64_t v34;
  std::__shared_weak_count *v35;
  unint64_t *v36;
  unint64_t v37;
  int v38;
  uint64_t v39;
  id v40;
  void *v41;
  id v42;
  id v43;
  BOOL v44;
  id v45;
  id v46;
  _BOOL4 v47;
  NSObject *v48;
  _BOOL4 v49;
  NSObject *v50;
  NSObject *v51;
  void *v52;
  void *v53;
  id v54;
  id v55;
  void *v56;
  void *v57;
  _BOOL4 v58;
  NSObject *v59;
  NSObject *v60;
  NSObject *v61;
  NSObject *v62;
  NSObject *v63;
  NSObject *v64;
  NSObject *v65;
  NSObject *v66;
  NSObject *v67;
  NSObject *v68;
  NSObject *v69;
  id v70;
  id v71;
  void *v72;
  void *v73;
  _QWORD aBlock[4];
  id v75;
  CLIntersiloProxy *v76;
  id v77;
  id v78;
  id v79;
  uint64_t v80;
  uint64_t v81;
  void (*v82)(uint64_t, void *);
  void *v83;
  std::__shared_weak_count_vtbl *v84;
  id v85;
  id v86;
  std::__shared_weak_count *v87;
  std::__shared_weak_count *v88;
  id v89;
  id v90;
  uint8_t buf[8];
  _BYTE v92[10];
  __int16 v93;
  const char *v94;
  __int16 v95;
  const char *v96;
  uint64_t v97;

  v97 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = objc_msgSend(v4, "selector");
  +[CLIntersiloInterface sharedInterface](CLIntersiloInterface, "sharedInterface");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "getInfoForSelector:", v5);
  v73 = (void *)objc_claimAutoreleasedReturnValue();

  -[CLIntersiloProxy peer](self, "peer");
  v72 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "argumentsRetained"))
  {
    sub_1A1A12544();
    v59 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v59, OS_LOG_TYPE_FAULT))
    {
      *(_QWORD *)buf = 68289539;
      *(_WORD *)v92 = 2082;
      *(_QWORD *)&v92[2] = &unk_1A1A18FAF;
      v93 = 2082;
      v94 = "assert";
      v95 = 2081;
      v96 = "![inv argumentsRetained]";
      _os_log_impl(&dword_1A19F4000, v59, OS_LOG_TYPE_FAULT, "{\"msg%{public}.0s\":\"Didn't expect the arguments to be retained before now\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", buf, 0x26u);
    }

    sub_1A1A12544();
    v60 = objc_claimAutoreleasedReturnValue();
    if (os_signpost_enabled(v60))
    {
      *(_QWORD *)buf = 68289539;
      *(_WORD *)v92 = 2082;
      *(_QWORD *)&v92[2] = &unk_1A1A18FAF;
      v93 = 2082;
      v94 = "assert";
      v95 = 2081;
      v96 = "![inv argumentsRetained]";
      _os_signpost_emit_with_name_impl(&dword_1A19F4000, v60, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "Didn't expect the arguments to be retained before now", "{\"msg%{public}.0s\":\"Didn't expect the arguments to be retained before now\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", buf, 0x26u);
    }

    sub_1A1A12544();
    v61 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v61, OS_LOG_TYPE_INFO))
    {
      *(_QWORD *)buf = 68289539;
      *(_WORD *)v92 = 2082;
      *(_QWORD *)&v92[2] = &unk_1A1A18FAF;
      v93 = 2082;
      v94 = "assert";
      v95 = 2081;
      v96 = "![inv argumentsRetained]";
      _os_log_impl(&dword_1A19F4000, v61, OS_LOG_TYPE_INFO, "{\"msg%{public}.0s\":\"Didn't expect the arguments to be retained before now\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", buf, 0x26u);
    }

    abort_report_np();
    goto LABEL_86;
  }
  v90 = 0;
  if (!objc_msgSend(v73, "lastArgBlockIndex"))
    goto LABEL_35;
  v7 = objc_msgSend(v73, "lastArgBlockIndex");
  if (v7 >= 0)
    v8 = v7;
  else
    v8 = -v7;
  v89 = 0;
  objc_msgSend(v4, "getArgument:atIndex:", &v89, v8);
  v9 = (void *)objc_msgSend(v89, "copy");
  v10 = *(unsigned __int8 *)_Block_signature(v9);
  if ((v10 == 118) == (int)objc_msgSend(v73, "lastArgBlockIndex") < 1)
  {
    if (qword_1ECE24CB0 != -1)
      dispatch_once(&qword_1ECE24CB0, &unk_1E45FB720);
    v11 = (id)qword_1ECE24CA8;
    if (os_log_type_enabled(v11, OS_LOG_TYPE_FAULT))
    {
      objc_msgSend(v73, "description");
      v12 = (char *)objc_claimAutoreleasedReturnValue();
      *(_QWORD *)buf = 68289282;
      *(_WORD *)v92 = 2082;
      *(_QWORD *)&v92[2] = &unk_1A1A18FAF;
      v93 = 2114;
      v94 = v12;
      _os_log_impl(&dword_1A19F4000, v11, OS_LOG_TYPE_FAULT, "{\"msg%{public}.0s\":\"withReply: and void-returning block must be used in conjunction for correct reply handling\", \"selector\":%{public, location:escape_only}@}", buf, 0x1Cu);

    }
    if (qword_1ECE24CB0 != -1)
      dispatch_once(&qword_1ECE24CB0, &unk_1E45FB720);
    v13 = (id)qword_1ECE24CA8;
    if (os_signpost_enabled(v13))
    {
      objc_msgSend(v73, "description");
      v14 = (char *)objc_claimAutoreleasedReturnValue();
      *(_QWORD *)buf = 68289282;
      *(_WORD *)v92 = 2082;
      *(_QWORD *)&v92[2] = &unk_1A1A18FAF;
      v93 = 2114;
      v94 = v14;
      _os_signpost_emit_with_name_impl(&dword_1A19F4000, v13, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "withReply: and void-returning block must be used in conjunction for correct reply handling", "{\"msg%{public}.0s\":\"withReply: and void-returning block must be used in conjunction for correct reply handling\", \"selector\":%{public, location:escape_only}@}", buf, 0x1Cu);

    }
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    if (!WeakRetained)
      goto LABEL_34;
    v16 = objc_loadWeakRetained((id *)&self->_delegateSilo);
    v17 = v16 != 0;

    if (!v17 || v10 != 118)
      goto LABEL_34;
    goto LABEL_19;
  }
  if (v10 == 118)
  {
LABEL_19:
    v18 = objc_loadWeakRetained((id *)&self->_delegate);
    v19 = v18 == 0;

    if (v19)
    {
      sub_1A1A12544();
      v64 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v64, OS_LOG_TYPE_FAULT))
      {
        *(_QWORD *)buf = 68289539;
        *(_WORD *)v92 = 2082;
        *(_QWORD *)&v92[2] = &unk_1A1A18FAF;
        v93 = 2082;
        v94 = "assert";
        v95 = 2081;
        v96 = "_delegate";
        _os_log_impl(&dword_1A19F4000, v64, OS_LOG_TYPE_FAULT, "{\"msg%{public}.0s\":\"Delegate is necessary for reply delivery\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", buf, 0x26u);
      }

      sub_1A1A12544();
      v65 = objc_claimAutoreleasedReturnValue();
      if (os_signpost_enabled(v65))
      {
        *(_QWORD *)buf = 68289539;
        *(_WORD *)v92 = 2082;
        *(_QWORD *)&v92[2] = &unk_1A1A18FAF;
        v93 = 2082;
        v94 = "assert";
        v95 = 2081;
        v96 = "_delegate";
        _os_signpost_emit_with_name_impl(&dword_1A19F4000, v65, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "Delegate is necessary for reply delivery", "{\"msg%{public}.0s\":\"Delegate is necessary for reply delivery\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", buf, 0x26u);
      }

      sub_1A1A12544();
      v66 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v66, OS_LOG_TYPE_INFO))
      {
        *(_QWORD *)buf = 68289539;
        *(_WORD *)v92 = 2082;
        *(_QWORD *)&v92[2] = &unk_1A1A18FAF;
        v93 = 2082;
        v94 = "assert";
        v95 = 2081;
        v96 = "_delegate";
        _os_log_impl(&dword_1A19F4000, v66, OS_LOG_TYPE_INFO, "{\"msg%{public}.0s\":\"Delegate is necessary for reply delivery\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", buf, 0x26u);
      }
    }
    else
    {
      v20 = objc_loadWeakRetained((id *)&self->_delegateSilo);
      v21 = v20 == 0;

      if (!v21)
      {
        v70 = objc_loadWeakRetained((id *)&self->_delegate);
        v71 = objc_loadWeakRetained((id *)&self->_delegateSilo);
        objc_msgSend(v72, "delegateSilo");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        v23 = (std::__shared_weak_count *)operator new(0x30uLL);
        v23->__shared_owners_ = 0;
        p_shared_owners = (unint64_t *)&v23->__shared_owners_;
        v23->__shared_weak_owners_ = 0;
        v23->__vftable = (std::__shared_weak_count_vtbl *)&off_1E45FB178;
        v25 = v71;
        v26 = v22;
        v27 = (std::__shared_weak_count_vtbl *)v25;
        v23[1].__vftable = v27;
        v28 = v26;
        v23[1].__shared_owners_ = (uint64_t)v28;
        v23[1].__shared_weak_owners_ = (uint64_t)CFRetain(v9);

        *(_QWORD *)buf = v23 + 1;
        *(_QWORD *)v92 = v23;

        v80 = MEMORY[0x1E0C809B0];
        v81 = 3321888768;
        v82 = sub_1A19F912C;
        v83 = &unk_1E45FB4C0;
        v86 = v9;
        v29 = v27;
        v84 = v29;
        v30 = v70;
        v85 = v30;
        v87 = v23 + 1;
        v88 = v23;
        do
          v31 = __ldxr(p_shared_owners);
        while (__stxr(v31 + 1, p_shared_owners));
        v32 = (void *)__NSMakeSpecialForwardingCaptureBlock();
        v90 = (id)objc_msgSend(v32, "copy");
        objc_msgSend(v4, "setArgument:atIndex:", &v90, v8);

        if (v88)
        {
          v33 = &v88->__shared_owners_;
          do
            v34 = __ldaxr((unint64_t *)v33);
          while (__stlxr(v34 - 1, (unint64_t *)v33));
          if (!v34)
          {
            ((void (*)(std::__shared_weak_count *))v88->__on_zero_shared)(v88);
            std::__shared_weak_count::__release_weak(v88);
          }
        }

        v35 = *(std::__shared_weak_count **)v92;
        if (*(_QWORD *)v92)
        {
          v36 = (unint64_t *)(*(_QWORD *)v92 + 8);
          do
            v37 = __ldaxr(v36);
          while (__stlxr(v37 - 1, v36));
          if (!v37)
          {
            ((void (*)(std::__shared_weak_count *))v35->__on_zero_shared)(v35);
            std::__shared_weak_count::__release_weak(v35);
          }
        }

        goto LABEL_34;
      }
      sub_1A1A12544();
      v67 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v67, OS_LOG_TYPE_FAULT))
      {
        *(_QWORD *)buf = 68289539;
        *(_WORD *)v92 = 2082;
        *(_QWORD *)&v92[2] = &unk_1A1A18FAF;
        v93 = 2082;
        v94 = "assert";
        v95 = 2081;
        v96 = "_delegateSilo";
        _os_log_impl(&dword_1A19F4000, v67, OS_LOG_TYPE_FAULT, "{\"msg%{public}.0s\":\"Silo is necessary for reply delivery\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", buf, 0x26u);
      }

      sub_1A1A12544();
      v68 = objc_claimAutoreleasedReturnValue();
      if (os_signpost_enabled(v68))
      {
        *(_QWORD *)buf = 68289539;
        *(_WORD *)v92 = 2082;
        *(_QWORD *)&v92[2] = &unk_1A1A18FAF;
        v93 = 2082;
        v94 = "assert";
        v95 = 2081;
        v96 = "_delegateSilo";
        _os_signpost_emit_with_name_impl(&dword_1A19F4000, v68, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "Silo is necessary for reply delivery", "{\"msg%{public}.0s\":\"Silo is necessary for reply delivery\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", buf, 0x26u);
      }

      sub_1A1A12544();
      v66 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v66, OS_LOG_TYPE_INFO))
      {
        *(_QWORD *)buf = 68289539;
        *(_WORD *)v92 = 2082;
        *(_QWORD *)&v92[2] = &unk_1A1A18FAF;
        v93 = 2082;
        v94 = "assert";
        v95 = 2081;
        v96 = "_delegateSilo";
        _os_log_impl(&dword_1A19F4000, v66, OS_LOG_TYPE_INFO, "{\"msg%{public}.0s\":\"Silo is necessary for reply delivery\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", buf, 0x26u);
      }
    }

    abort_report_np();
LABEL_86:
    __break(1u);
  }
LABEL_34:

LABEL_35:
  v38 = objc_msgSend(v73, "returnAddressIndex");
  if (v38)
  {
    v89 = 0;
    v39 = v38;
    objc_msgSend(v4, "getArgument:atIndex:", &v89, v38);
    v40 = objc_loadWeakRetained((id *)&self->_delegate);
    v41 = v40;
    if (!v40 || (v42 = v89, v89 == (id)CLISP_ME_TOKEN))
    {

    }
    else
    {
      v43 = objc_loadWeakRetained((id *)&self->_delegate);
      v44 = v42 == v43;

      if (!v44)
      {
        objc_msgSend(MEMORY[0x1E0C99E38], "null");
        v45 = (id)objc_claimAutoreleasedReturnValue();
        v46 = objc_loadWeakRetained((id *)&self->_delegate);
        v47 = v45 == v46;

        sub_1A1A12544();
        v48 = objc_claimAutoreleasedReturnValue();
        v49 = os_log_type_enabled(v48, OS_LOG_TYPE_FAULT);
        if (v47)
        {
          if (v49)
          {
            *(_QWORD *)buf = 68289539;
            *(_WORD *)v92 = 2082;
            *(_QWORD *)&v92[2] = &unk_1A1A18FAF;
            v93 = 2082;
            v94 = "assert";
            v95 = 2081;
            v96 = "(id)[NSNull null] != _delegate";
            _os_log_impl(&dword_1A19F4000, v48, OS_LOG_TYPE_FAULT, "{\"msg%{public}.0s\":\"A delegate must be set before sending messages with byref return address parameters\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", buf, 0x26u);
          }

          sub_1A1A12544();
          v69 = objc_claimAutoreleasedReturnValue();
          if (os_signpost_enabled(v69))
          {
            *(_QWORD *)buf = 68289539;
            *(_WORD *)v92 = 2082;
            *(_QWORD *)&v92[2] = &unk_1A1A18FAF;
            v93 = 2082;
            v94 = "assert";
            v95 = 2081;
            v96 = "(id)[NSNull null] != _delegate";
            _os_signpost_emit_with_name_impl(&dword_1A19F4000, v69, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "A delegate must be set before sending messages with byref return address parameters", "{\"msg%{public}.0s\":\"A delegate must be set before sending messages with byref return address parameters\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", buf, 0x26u);
          }

          sub_1A1A12544();
          v51 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v51, OS_LOG_TYPE_INFO))
          {
            *(_QWORD *)buf = 68289539;
            *(_WORD *)v92 = 2082;
            *(_QWORD *)&v92[2] = &unk_1A1A18FAF;
            v93 = 2082;
            v94 = "assert";
            v95 = 2081;
            v96 = "(id)[NSNull null] != _delegate";
            _os_log_impl(&dword_1A19F4000, v51, OS_LOG_TYPE_INFO, "{\"msg%{public}.0s\":\"A delegate must be set before sending messages with byref return address parameters\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", buf, 0x26u);
          }
        }
        else
        {
          if (v49)
          {
            *(_QWORD *)buf = 68289539;
            *(_WORD *)v92 = 2082;
            *(_QWORD *)&v92[2] = &unk_1A1A18FAF;
            v93 = 2082;
            v94 = "assert";
            v95 = 2081;
            v96 = "__objc_no";
            _os_log_impl(&dword_1A19F4000, v48, OS_LOG_TYPE_FAULT, "{\"msg%{public}.0s\":\"The object passed to byref return address parameters MUST BE the registered delegate\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", buf, 0x26u);
          }

          sub_1A1A12544();
          v50 = objc_claimAutoreleasedReturnValue();
          if (os_signpost_enabled(v50))
          {
            *(_QWORD *)buf = 68289539;
            *(_WORD *)v92 = 2082;
            *(_QWORD *)&v92[2] = &unk_1A1A18FAF;
            v93 = 2082;
            v94 = "assert";
            v95 = 2081;
            v96 = "__objc_no";
            _os_signpost_emit_with_name_impl(&dword_1A19F4000, v50, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "The object passed to byref return address parameters MUST BE the registered delegate", "{\"msg%{public}.0s\":\"The object passed to byref return address parameters MUST BE the registered delegate\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", buf, 0x26u);
          }

          sub_1A1A12544();
          v51 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v51, OS_LOG_TYPE_INFO))
          {
            *(_QWORD *)buf = 68289539;
            *(_WORD *)v92 = 2082;
            *(_QWORD *)&v92[2] = &unk_1A1A18FAF;
            v93 = 2082;
            v94 = "assert";
            v95 = 2081;
            v96 = "__objc_no";
            _os_log_impl(&dword_1A19F4000, v51, OS_LOG_TYPE_INFO, "{\"msg%{public}.0s\":\"The object passed to byref return address parameters MUST BE the registered delegate\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", buf, 0x26u);
          }
        }
LABEL_46:

        abort_report_np();
        goto LABEL_86;
      }
    }
    v89 = v72;
    objc_msgSend(v4, "setArgument:atIndex:", &v89, v39);
  }
  if (objc_msgSend(v4, "argumentsRetained"))
  {
    sub_1A1A12544();
    v62 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v62, OS_LOG_TYPE_FAULT))
    {
      *(_QWORD *)buf = 68289539;
      *(_WORD *)v92 = 2082;
      *(_QWORD *)&v92[2] = &unk_1A1A18FAF;
      v93 = 2082;
      v94 = "assert";
      v95 = 2081;
      v96 = "![inv argumentsRetained]";
      _os_log_impl(&dword_1A19F4000, v62, OS_LOG_TYPE_FAULT, "{\"msg%{public}.0s\":\"Didn't expect the arguments to be retained before now\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", buf, 0x26u);
    }

    sub_1A1A12544();
    v63 = objc_claimAutoreleasedReturnValue();
    if (os_signpost_enabled(v63))
    {
      *(_QWORD *)buf = 68289539;
      *(_WORD *)v92 = 2082;
      *(_QWORD *)&v92[2] = &unk_1A1A18FAF;
      v93 = 2082;
      v94 = "assert";
      v95 = 2081;
      v96 = "![inv argumentsRetained]";
      _os_signpost_emit_with_name_impl(&dword_1A19F4000, v63, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "Didn't expect the arguments to be retained before now", "{\"msg%{public}.0s\":\"Didn't expect the arguments to be retained before now\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", buf, 0x26u);
    }

    sub_1A1A12544();
    v51 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v51, OS_LOG_TYPE_INFO))
    {
      *(_QWORD *)buf = 68289539;
      *(_WORD *)v92 = 2082;
      *(_QWORD *)&v92[2] = &unk_1A1A18FAF;
      v93 = 2082;
      v94 = "assert";
      v95 = 2081;
      v96 = "![inv argumentsRetained]";
      _os_log_impl(&dword_1A19F4000, v51, OS_LOG_TYPE_INFO, "{\"msg%{public}.0s\":\"Didn't expect the arguments to be retained before now\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", buf, 0x26u);
    }
    goto LABEL_46;
  }
  objc_msgSend(v4, "retainArguments");
  if (v90)
  {

    v90 = 0;
  }
  objc_msgSend(v72, "delegateSilo");
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  if (v52)
  {
    objc_msgSend(v72, "delegate");
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = sub_1A1A125D8;
    aBlock[3] = &unk_1E45FBC00;
    v54 = v53;
    v75 = v54;
    v76 = self;
    v77 = v4;
    v55 = v73;
    v78 = v55;
    v79 = v72;
    v56 = _Block_copy(aBlock);
    objc_msgSend(v55, "sig");
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    v58 = objc_msgSend(v57, "methodReturnLength") == 0;

    if (v58)
      objc_msgSend(v52, "async:", v56);
    else
      objc_msgSend((id)objc_opt_class(), "performSyncOnSilo:invoker:", v52, v56);

  }
}

- (CLSilo)delegateSilo
{
  return (CLSilo *)objc_loadWeakRetained((id *)&self->_delegateSilo);
}

- (id)methodSignatureForSelector:(SEL)a3
{
  void *v4;
  void *v5;
  void *v6;

  +[CLIntersiloInterface sharedInterface](CLIntersiloInterface, "sharedInterface");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "getInfoForSelector:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "sig");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (CLIntersiloProxyDelegateProtocol)delegate
{
  return (CLIntersiloProxyDelegateProtocol *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[CLIntersiloProxy peer](self, "peer");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "delegateSilo");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "identifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: peer silo:%@>"), v5, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (BOOL)respondsToSelector:(SEL)a3
{
  void *v4;

  +[CLIntersiloInterface sharedInterface](CLIntersiloInterface, "sharedInterface");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(a3) = objc_msgSend(v4, "hasInfoForSelector:", a3);

  return (char)a3;
}

- (id)peer
{
  NSObject *v2;
  NSObject *v3;
  NSObject *v4;
  uint8_t buf[4];
  int v6;
  __int16 v7;
  void *v8;
  __int16 v9;
  const char *v10;
  __int16 v11;
  const char *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  if (qword_1ECE24CB0 != -1)
    goto LABEL_11;
  while (1)
  {
    v2 = qword_1ECE24CA8;
    if (os_log_type_enabled((os_log_t)qword_1ECE24CA8, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 68289539;
      v6 = 0;
      v7 = 2082;
      v8 = &unk_1A1A18FAF;
      v9 = 2082;
      v10 = "assert";
      v11 = 2081;
      v12 = "__objc_no";
      _os_log_impl(&dword_1A19F4000, v2, OS_LOG_TYPE_FAULT, "{\"msg%{public}.0s\":\"-peer should never be invoked at this level...\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", buf, 0x26u);
      if (qword_1ECE24CB0 != -1)
        dispatch_once(&qword_1ECE24CB0, &unk_1E45FB720);
    }
    v3 = qword_1ECE24CA8;
    if (os_signpost_enabled((os_log_t)qword_1ECE24CA8))
    {
      *(_DWORD *)buf = 68289539;
      v6 = 0;
      v7 = 2082;
      v8 = &unk_1A1A18FAF;
      v9 = 2082;
      v10 = "assert";
      v11 = 2081;
      v12 = "__objc_no";
      _os_signpost_emit_with_name_impl(&dword_1A19F4000, v3, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "-peer should never be invoked at this level...", "{\"msg%{public}.0s\":\"-peer should never be invoked at this level...\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", buf, 0x26u);
      if (qword_1ECE24CB0 != -1)
        dispatch_once(&qword_1ECE24CB0, &unk_1E45FB720);
    }
    v4 = qword_1ECE24CA8;
    if (os_log_type_enabled((os_log_t)qword_1ECE24CA8, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 68289539;
      v6 = 0;
      v7 = 2082;
      v8 = &unk_1A1A18FAF;
      v9 = 2082;
      v10 = "assert";
      v11 = 2081;
      v12 = "__objc_no";
      _os_log_impl(&dword_1A19F4000, v4, OS_LOG_TYPE_INFO, "{\"msg%{public}.0s\":\"-peer should never be invoked at this level...\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", buf, 0x26u);
    }
    abort_report_np();
LABEL_11:
    dispatch_once(&qword_1ECE24CB0, &unk_1E45FB720);
  }
}

@end
