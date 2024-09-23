@implementation BSXPCServiceConnectionProxy

+ (uint64_t)decodeArguments:(uint64_t)a3 outArgs:(void *)a4 fromMessage:(void *)a5 forConnection:
{
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  char v14;
  unint64_t v15;
  __CFString *v16;
  unint64_t v17;
  uint64_t v18;
  void *v19;
  int v20;
  __CFString *v21;
  __CFString *v22;
  __CFString *v23;
  __CFString *v24;
  Class v25;
  void *v26;
  id v27;
  char v28;
  void *v29;
  uint64_t v30;
  __CFString *v31;
  __CFString *v32;
  uint64_t v33;
  __CFString *v34;
  uint64_t result;
  uint64_t v36;
  uint64_t v37;
  void *v38;
  NSString *v39;
  objc_class *v40;
  uint64_t v41;
  void *v42;
  NSString *v43;
  objc_class *v44;
  void *v45;
  NSString *v46;
  objc_class *v47;
  uint64_t v48;
  void *v49;
  void *v50;
  uint64_t v51;
  void *v52;
  uint8_t buf[4];
  NSString *v54;
  __int16 v55;
  NSString *v56;
  __int16 v57;
  uint64_t v58;
  __int16 v59;
  const __CFString *v60;
  __int16 v61;
  int v62;
  __int16 v63;
  void *v64;
  uint64_t v65;

  v65 = *MEMORY[0x1E0C80C00];
  v9 = objc_opt_self();
  if ((unint64_t)objc_msgSend(a2, "count") >= 0xB)
  {
    v41 = v9;
    v42 = (void *)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("[arguments count] <= 10"));
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      v43 = NSStringFromSelector(sel_decodeArguments_outArgs_fromMessage_forConnection_);
      v44 = (objc_class *)objc_opt_class();
      *(_DWORD *)buf = 138544642;
      v54 = v43;
      v55 = 2114;
      v56 = NSStringFromClass(v44);
      v57 = 2048;
      v58 = v41;
      v59 = 2114;
      v60 = CFSTR("BSXPCServiceConnectionProxy.m");
      v61 = 1024;
      v62 = 784;
      v63 = 2114;
      v64 = v42;
      _os_log_error_impl(&dword_19A799000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);
    }
    objc_msgSend(v42, "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x19A79EE14);
  }
  v48 = v9;
  v50 = a2;
  v10 = (void *)+[BSXPCServiceConnectionProxy concreteArgumentsForArguments:]((uint64_t)BSXPCServiceConnectionProxy, a2);
  v11 = (void *)objc_msgSend(v10, "lastObject");
  v12 = objc_msgSend(v11, "objectClass");
  v13 = objc_opt_class();
  v14 = objc_msgSend(a4, "containsValueForKey:", CFSTR("BSXPCReturnError"));
  if ((v14 & 1) == 0 && v12 == v13)
  {
    v15 = objc_msgSend(v11, "argumentIndex");
    if (v15 > 9)
      v16 = 0;
    else
      v16 = off_1E390D040[v15];
    v14 = objc_msgSend(a4, "containsValueForKey:", v16);
  }
  v51 = v13;
  v49 = v11;
  v52 = a5;
  if (objc_msgSend(v10, "count"))
  {
    v17 = 0;
    v18 = *MEMORY[0x1E0C99778];
    do
    {
      v19 = (void *)objc_msgSend(v10, "objectAtIndex:", v17);
      if (v17 != objc_msgSend(v19, "argumentIndex"))
      {
        v38 = (void *)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("[argument argumentIndex] == idx"));
        if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
        {
          v39 = NSStringFromSelector(sel_decodeArguments_outArgs_fromMessage_forConnection_);
          v40 = (objc_class *)objc_opt_class();
          *(_DWORD *)buf = 138544642;
          v54 = v39;
          v55 = 2114;
          v56 = NSStringFromClass(v40);
          v57 = 2048;
          v58 = v48;
          v59 = 2114;
          v60 = CFSTR("BSXPCServiceConnectionProxy.m");
          v61 = 1024;
          v62 = 797;
          v63 = 2114;
          v64 = v38;
          _os_log_error_impl(&dword_19A799000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);
        }
        objc_msgSend(v38, "UTF8String");
        _bs_set_crash_log_message();
        __break(0);
        JUMPOUT(0x19A79ED34);
      }
      v20 = objc_msgSend(v19, "type");
      if (v20 > 80)
      {
        if (v20 == 81)
        {
          if (v17 > 9)
            v24 = 0;
          else
            v24 = off_1E390D040[v17];
          v25 = (Class)objc_msgSend(a4, "decodeUInt64ForKey:", v24);
          goto LABEL_32;
        }
        if (v20 == 113)
        {
          if (v17 > 9)
            v22 = 0;
          else
            v22 = off_1E390D040[v17];
          v25 = (Class)objc_msgSend(a4, "decodeInt64ForKey:", v22);
          goto LABEL_32;
        }
      }
      else
      {
        if (v20 == 35)
        {
          if (v17 > 9)
            v23 = 0;
          else
            v23 = off_1E390D040[v17];
          v25 = NSClassFromString((NSString *)objc_msgSend(a4, "decodeStringForKey:", v23));
LABEL_32:
          *(_QWORD *)(a3 + 8 * v17) = v25;
          goto LABEL_33;
        }
        if (v20 == 64)
        {
          if (objc_msgSend(v19, "isXPCObject"))
          {
            if (v17 > 9)
              v21 = 0;
            else
              v21 = off_1E390D040[v17];
            v27 = (id)objc_msgSend(a4, "_implicitDecodeXPCObjectForKey:", v21);
          }
          else
          {
            v26 = (void *)objc_msgSend(v19, "objectClass");
            if (objc_msgSend(v26, "isSubclassOfClass:", objc_opt_class()))
            {
              v27 = v52;
            }
            else
            {
              v29 = (void *)objc_msgSend(v19, "objectContainedClasses");
              if (objc_msgSend(v29, "count"))
              {
                if (objc_msgSend(v26, "isSubclassOfClass:", objc_opt_class()))
                {
                  v30 = objc_msgSend(v29, "objectAtIndex:", 1);
                  if (v17 > 9)
                    v31 = 0;
                  else
                    v31 = off_1E390D040[v17];
                  v27 = (id)objc_msgSend(a4, "decodeDictionaryOfClass:forKey:", v30, v31);
                }
                else
                {
                  v33 = objc_msgSend(v29, "firstObject");
                  if (v17 > 9)
                    v34 = 0;
                  else
                    v34 = off_1E390D040[v17];
                  v27 = (id)objc_msgSend(a4, "decodeCollectionOfClass:containingClass:forKey:", v26, v33, v34);
                }
              }
              else
              {
                if (v17 > 9)
                  v32 = 0;
                else
                  v32 = off_1E390D040[v17];
                v27 = (id)objc_msgSend(a4, "decodeObjectOfClass:forKey:", v26, v32);
              }
            }
          }
          *(_QWORD *)(a3 + 8 * v17) = v27;
          if (v27)
            v28 = 1;
          else
            v28 = v14;
          if ((v28 & 1) == 0 && objc_msgSend(v19, "isObjectNonnull"))
            objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", v18, CFSTR("Decoded nil for nonnull parameter %ld; expected %@"),
              v17,
              NSStringFromClass((Class)objc_msgSend(v19, "objectClass")));
          goto LABEL_33;
        }
      }
      objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", v18, CFSTR("Decoding value of type %c not implemented or supported"), (int)objc_msgSend(v19, "type"));
LABEL_33:
      ++v17;
    }
    while (v17 < objc_msgSend(v10, "count"));
  }
  result = objc_msgSend(a4, "containsValueForKey:", CFSTR("BSXPCReturnError"));
  if ((result & 1) != 0)
  {
    result = objc_msgSend(a4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("BSXPCReturnError"));
    if (result)
    {
      if (v12 == v51)
      {
        v36 = result;
        v37 = objc_msgSend((id)objc_msgSend(v50, "lastObject"), "argumentIndex");
        if (v37 != objc_msgSend(v10, "count") - 1)
        {
          v45 = (void *)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("[[arguments lastObject] argumentIndex] == ([concreteArguments count] - 1)"));
          if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
          {
            v46 = NSStringFromSelector(sel_decodeArguments_outArgs_fromMessage_forConnection_);
            v47 = (objc_class *)objc_opt_class();
            *(_DWORD *)buf = 138544642;
            v54 = v46;
            v55 = 2114;
            v56 = NSStringFromClass(v47);
            v57 = 2048;
            v58 = v48;
            v59 = 2114;
            v60 = CFSTR("BSXPCServiceConnectionProxy.m");
            v61 = 1024;
            v62 = 855;
            v63 = 2114;
            v64 = v45;
            _os_log_error_impl(&dword_19A799000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);
          }
          objc_msgSend(v45, "UTF8String");
          _bs_set_crash_log_message();
          __break(0);
          JUMPOUT(0x19A79EEF4);
        }
        result = objc_msgSend(v49, "argumentIndex");
        *(_QWORD *)(a3 + 8 * result) = v36;
      }
    }
  }
  return result;
}

+ (uint64_t)concreteArgumentsForArguments:(uint64_t)a1
{
  void *v3;
  int v4;
  int v5;

  objc_opt_self();
  v3 = (void *)objc_msgSend(a2, "lastObject");
  v4 = objc_msgSend(v3, "isPointer");
  v5 = objc_msgSend(v3, "isBlock");
  if (v3 && v4 | v5)
    return objc_msgSend(a2, "subarrayWithRange:", 0, objc_msgSend(a2, "count") - 1);
  else
    return (uint64_t)a2;
}

+ (uint64_t)encodeArguments:(uint64_t)a1 inArgs:(void *)a2 toMessage:(uint64_t)a3 forConnection:(void *)a4
{
  uint64_t v7;
  unint64_t v8;
  uint64_t v9;
  void *v10;
  int v11;
  __CFString *v12;
  objc_class *v13;
  const __CFString *v14;
  __CFString *v15;
  objc_class *v16;
  NSString *v17;
  __CFString *v18;
  __CFString *v19;
  void *v20;
  NSString *v21;
  void *v23;
  NSString *v24;
  objc_class *v25;
  uint8_t buf[4];
  NSString *v27;
  __int16 v28;
  NSString *v29;
  __int16 v30;
  uint64_t v31;
  __int16 v32;
  const __CFString *v33;
  __int16 v34;
  int v35;
  __int16 v36;
  void *v37;
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v7 = objc_opt_self();
  if ((unint64_t)objc_msgSend(a2, "count") > 0xA)
  {
    v23 = (void *)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("[arguments count] <= 10"));
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      v24 = NSStringFromSelector(sel_encodeArguments_inArgs_toMessage_forConnection_);
      v25 = (objc_class *)objc_opt_class();
      *(_DWORD *)buf = 138544642;
      v27 = v24;
      v28 = 2114;
      v29 = NSStringFromClass(v25);
      v30 = 2048;
      v31 = v7;
      v32 = 2114;
      v33 = CFSTR("BSXPCServiceConnectionProxy.m");
      v34 = 1024;
      v35 = 724;
      v36 = 2114;
      v37 = v23;
      _os_log_error_impl(&dword_19A799000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);
    }
    objc_msgSend(v23, "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x19A79F47CLL);
  }
  if (objc_msgSend(a2, "count"))
  {
    v8 = 0;
    v9 = *MEMORY[0x1E0C99778];
    while (1)
    {
      v10 = (void *)objc_msgSend(a2, "objectAtIndex:", v8);
      v11 = objc_msgSend(v10, "type");
      if (v11 > 80)
        break;
      if (v11 == 35)
      {
        v16 = *(objc_class **)(a3 + 8 * v8);
        if (v16)
        {
          v17 = NSStringFromClass(v16);
          if (v8 > 9)
            v18 = 0;
          else
            v18 = off_1E390D040[v8];
          objc_msgSend(a4, "encodeObject:forKey:", v17, v18);
        }
        goto LABEL_36;
      }
      if (v11 != 64)
        goto LABEL_15;
      v12 = *(__CFString **)(a3 + 8 * v8);
      if (!v12)
      {
        if (objc_msgSend(v10, "isObjectNonnull"))
          objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", v9, CFSTR("Parameter %ld expected nonnull %@"), objc_msgSend(v10, "argumentIndex"), NSStringFromClass((Class)objc_msgSend(v10, "objectClass")));
        goto LABEL_36;
      }
      v13 = (objc_class *)objc_msgSend(v10, "objectClass");
      if (-[objc_class isSubclassOfClass:](v13, "isSubclassOfClass:", objc_opt_class()))
      {
        if (v8 >= 0xA)
          v14 = 0;
        else
          v14 = off_1E390D040[v8];
        v12 = CFSTR("local");
      }
      else
      {
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          v20 = (void *)MEMORY[0x1E0C99DA0];
          v21 = NSStringFromClass(v13);
          objc_msgSend(v20, "raise:format:", v9, CFSTR("Expected %@, but received %@"), v21, NSStringFromClass((Class)-[__CFString classForCoder](v12, "classForCoder")));
          goto LABEL_36;
        }
        v14 = CFSTR("1");
        switch(v8)
        {
          case 0uLL:
            break;
          case 1uLL:
            v14 = CFSTR("2");
            break;
          case 2uLL:
            v14 = CFSTR("3");
            break;
          case 3uLL:
            v14 = CFSTR("4");
            break;
          case 4uLL:
            v14 = CFSTR("5");
            break;
          case 5uLL:
            v14 = CFSTR("6");
            break;
          case 6uLL:
            v14 = CFSTR("7");
            break;
          case 7uLL:
            v14 = CFSTR("8");
            break;
          case 8uLL:
            v14 = CFSTR("9");
            break;
          case 9uLL:
            v14 = CFSTR("10");
            break;
          default:
            v14 = 0;
            break;
        }
      }
      objc_msgSend(a4, "encodeObject:forKey:", v12, v14);
LABEL_36:
      if (++v8 >= objc_msgSend(a2, "count"))
        return objc_msgSend(a4, "_finishCoding");
    }
    if (v11 == 81)
    {
      if (v8 > 9)
        v19 = 0;
      else
        v19 = off_1E390D040[v8];
      objc_msgSend(a4, "encodeUInt64:forKey:", *(_QWORD *)(a3 + 8 * v8), v19);
      goto LABEL_36;
    }
    if (v11 == 113)
    {
      if (v8 > 9)
        v15 = 0;
      else
        v15 = off_1E390D040[v8];
      objc_msgSend(a4, "encodeInt64:forKey:", *(_QWORD *)(a3 + 8 * v8), v15);
      goto LABEL_36;
    }
LABEL_15:
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", v9, CFSTR("Unsupported ObjectiveC type: %c"), (int)objc_msgSend(v10, "type"));
    goto LABEL_36;
  }
  return objc_msgSend(a4, "_finishCoding");
}

+ (_QWORD)proxyForConnection:(void *)a3 handshake:(void *)a4 withProtocol:(int)a5 activationGeneration:(void *)a6 activeXPCConnection:(void *)a7 xpcConnectionTargetQueue:(void *)a8 replyQueue:(void *)a9 target:(void *)a10 attributes:(void *)a11 assertionProvider:
{
  uint64_t v18;
  int v19;
  uint64_t v20;
  uint64_t v21;
  NSObject *v22;
  _BOOL4 v23;
  void *v24;
  uint64_t v25;
  const char *v26;
  NSObject *v27;
  uint32_t v28;
  uint64_t v29;
  _QWORD *v30;
  void *v32;
  NSString *v33;
  objc_class *v34;
  void *v35;
  NSString *v36;
  objc_class *v37;
  void *v38;
  NSString *v39;
  objc_class *v40;
  void *v41;
  NSString *v42;
  objc_class *v43;
  void *v44;
  NSString *v45;
  objc_class *v46;
  void *v47;
  NSString *v48;
  objc_class *v49;
  void *v50;
  NSString *v51;
  objc_class *v52;
  void *v53;
  uint8_t buf[4];
  NSString *v55;
  __int16 v56;
  NSString *v57;
  __int16 v58;
  uint64_t v59;
  __int16 v60;
  const __CFString *v61;
  __int16 v62;
  int v63;
  __int16 v64;
  void *v65;
  uint64_t v66;

  v66 = *MEMORY[0x1E0C80C00];
  v18 = objc_opt_self();
  NSClassFromString(CFSTR("BSXPCServiceConnection"));
  if (!a2)
  {
    v32 = (void *)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("_bs_assert_object != nil"));
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      v33 = NSStringFromSelector(sel_proxyForConnection_handshake_withProtocol_activationGeneration_activeXPCConnection_xpcConnectionTargetQueue_replyQueue_target_attributes_assertionProvider_);
      v34 = (objc_class *)objc_opt_class();
      *(_DWORD *)buf = 138544642;
      v55 = v33;
      v56 = 2114;
      v57 = NSStringFromClass(v34);
      v58 = 2048;
      v59 = v18;
      v60 = 2114;
      v61 = CFSTR("BSXPCServiceConnectionProxy.m");
      v62 = 1024;
      v63 = 132;
      v64 = 2114;
      v65 = v32;
      _os_log_error_impl(&dword_19A799000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);
    }
    objc_msgSend(v32, "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x19A7ABD6CLL);
  }
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v35 = (void *)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("[_bs_assert_object isKindOfClass:BSXPCServiceConnectionClass]"));
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      v36 = NSStringFromSelector(sel_proxyForConnection_handshake_withProtocol_activationGeneration_activeXPCConnection_xpcConnectionTargetQueue_replyQueue_target_attributes_assertionProvider_);
      v37 = (objc_class *)objc_opt_class();
      *(_DWORD *)buf = 138544642;
      v55 = v36;
      v56 = 2114;
      v57 = NSStringFromClass(v37);
      v58 = 2048;
      v59 = v18;
      v60 = 2114;
      v61 = CFSTR("BSXPCServiceConnectionProxy.m");
      v62 = 1024;
      v63 = 132;
      v64 = 2114;
      v65 = v35;
      _os_log_error_impl(&dword_19A799000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);
    }
    objc_msgSend(v35, "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x19A7ABE48);
  }
  NSClassFromString(CFSTR("BSObjCProtocol"));
  if (!a4)
  {
    v38 = (void *)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("_bs_assert_object != nil"));
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      v39 = NSStringFromSelector(sel_proxyForConnection_handshake_withProtocol_activationGeneration_activeXPCConnection_xpcConnectionTargetQueue_replyQueue_target_attributes_assertionProvider_);
      v40 = (objc_class *)objc_opt_class();
      *(_DWORD *)buf = 138544642;
      v55 = v39;
      v56 = 2114;
      v57 = NSStringFromClass(v40);
      v58 = 2048;
      v59 = v18;
      v60 = 2114;
      v61 = CFSTR("BSXPCServiceConnectionProxy.m");
      v62 = 1024;
      v63 = 133;
      v64 = 2114;
      v65 = v38;
      _os_log_error_impl(&dword_19A799000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);
    }
    objc_msgSend(v38, "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x19A7ABF24);
  }
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v41 = (void *)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("[_bs_assert_object isKindOfClass:BSObjCProtocolClass]"));
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      v42 = NSStringFromSelector(sel_proxyForConnection_handshake_withProtocol_activationGeneration_activeXPCConnection_xpcConnectionTargetQueue_replyQueue_target_attributes_assertionProvider_);
      v43 = (objc_class *)objc_opt_class();
      *(_DWORD *)buf = 138544642;
      v55 = v42;
      v56 = 2114;
      v57 = NSStringFromClass(v43);
      v58 = 2048;
      v59 = v18;
      v60 = 2114;
      v61 = CFSTR("BSXPCServiceConnectionProxy.m");
      v62 = 1024;
      v63 = 133;
      v64 = 2114;
      v65 = v41;
      _os_log_error_impl(&dword_19A799000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);
    }
    objc_msgSend(v41, "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x19A7AC000);
  }
  if (!objc_msgSend((id)objc_msgSend(a4, "methods"), "count"))
  {
    v44 = (void *)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("remoteProtocol has no methods"));
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      v45 = NSStringFromSelector(sel_proxyForConnection_handshake_withProtocol_activationGeneration_activeXPCConnection_xpcConnectionTargetQueue_replyQueue_target_attributes_assertionProvider_);
      v46 = (objc_class *)objc_opt_class();
      *(_DWORD *)buf = 138544642;
      v55 = v45;
      v56 = 2114;
      v57 = NSStringFromClass(v46);
      v58 = 2048;
      v59 = v18;
      v60 = 2114;
      v61 = CFSTR("BSXPCServiceConnectionProxy.m");
      v62 = 1024;
      v63 = 134;
      v64 = 2114;
      v65 = v44;
      _os_log_error_impl(&dword_19A799000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);
    }
    objc_msgSend(v44, "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x19A7AC0D0);
  }
  if (!a8)
  {
    v47 = (void *)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("replyQueue"));
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      v48 = NSStringFromSelector(sel_proxyForConnection_handshake_withProtocol_activationGeneration_activeXPCConnection_xpcConnectionTargetQueue_replyQueue_target_attributes_assertionProvider_);
      v49 = (objc_class *)objc_opt_class();
      *(_DWORD *)buf = 138544642;
      v55 = v48;
      v56 = 2114;
      v57 = NSStringFromClass(v49);
      v58 = 2048;
      v59 = v18;
      v60 = 2114;
      v61 = CFSTR("BSXPCServiceConnectionProxy.m");
      v62 = 1024;
      v63 = 135;
      v64 = 2114;
      v65 = v47;
      _os_log_error_impl(&dword_19A799000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);
    }
    objc_msgSend(v47, "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x19A7AC1ACLL);
  }
  if (a3 && !objc_msgSend(a10, "count"))
  {
    v50 = (void *)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("handshake is only supported if there are launching attributes"));
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      v51 = NSStringFromSelector(sel_proxyForConnection_handshake_withProtocol_activationGeneration_activeXPCConnection_xpcConnectionTargetQueue_replyQueue_target_attributes_assertionProvider_);
      v52 = (objc_class *)objc_opt_class();
      *(_DWORD *)buf = 138544642;
      v55 = v51;
      v56 = 2114;
      v57 = NSStringFromClass(v52);
      v58 = 2048;
      v59 = v18;
      v60 = 2114;
      v61 = CFSTR("BSXPCServiceConnectionProxy.m");
      v62 = 1024;
      v63 = 136;
      v64 = 2114;
      v65 = v50;
      _os_log_error_impl(&dword_19A799000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);
    }
    objc_msgSend(v50, "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x19A7AC27CLL);
  }
  v19 = a5;
  v53 = a6;
  v20 = objc_msgSend(a4, "name");
  v21 = objc_msgSend(a10, "count");
  v22 = BSServiceXPCLog();
  v23 = os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT);
  if (v21)
  {
    v24 = a7;
    if (v23)
    {
      v25 = a2[22];
      if (v25)
        v25 = *(_QWORD *)(v25 + 8);
      *(_DWORD *)buf = 138543874;
      v55 = (NSString *)v25;
      v56 = 2114;
      v57 = (NSString *)v20;
      v58 = 2114;
      v59 = (uint64_t)a10;
      v26 = "%{public}@ Remote proxy: <%{public}@> with %{public}@";
      v27 = v22;
      v28 = 32;
LABEL_18:
      _os_log_impl(&dword_19A799000, v27, OS_LOG_TYPE_DEFAULT, v26, buf, v28);
    }
  }
  else
  {
    v24 = a7;
    if (v23)
    {
      v29 = a2[22];
      if (v29)
        v29 = *(_QWORD *)(v29 + 8);
      *(_DWORD *)buf = 138543618;
      v55 = (NSString *)v29;
      v56 = 2114;
      v57 = (NSString *)v20;
      v26 = "%{public}@ Remote proxy: <%{public}@>";
      v27 = v22;
      v28 = 22;
      goto LABEL_18;
    }
  }
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("BSXPCServiceConnectionProxy<%@>"), v20);
  objc_opt_class();
  v30 = objc_alloc_init((Class)BSObjCClassCreate());
  v30[1] = a2;
  v30[2] = a3;
  v30[3] = a4;
  *((_DWORD *)v30 + 24) = v19;
  v30[4] = v53;
  v30[5] = v24;
  v30[6] = a8;
  v30[7] = objc_msgSend(a9, "copy");
  v30[8] = objc_msgSend(a10, "copy");
  v30[9] = objc_msgSend(a11, "copy");
  *((_DWORD *)v30 + 22) = 0;
  return v30;
}

- (void)dealloc
{
  BSXPCServiceConnection *connection;
  BSXPCServiceConnectionContext *context;
  NSString *proem;
  void *v7;
  NSString *v8;
  objc_class *v9;
  objc_super v10;
  uint8_t buf[4];
  NSString *v12;
  __int16 v13;
  NSString *v14;
  __int16 v15;
  BSXPCServiceConnectionProxy *v16;
  __int16 v17;
  const __CFString *v18;
  __int16 v19;
  int v20;
  __int16 v21;
  void *v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  if (self->_lock_assertion)
  {
    connection = self->_connection;
    if (connection && (context = connection->_context) != 0)
      proem = context->_proem;
    else
      proem = 0;
    v7 = (void *)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@ <%@:%p> dealloced before releasing its assertion : in-flight-messages=%u"), proem, objc_opt_class(), self, self->_lock_messagesCount);
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      v8 = NSStringFromSelector(a2);
      v9 = (objc_class *)objc_opt_class();
      *(_DWORD *)buf = 138544642;
      v12 = v8;
      v13 = 2114;
      v14 = NSStringFromClass(v9);
      v15 = 2048;
      v16 = self;
      v17 = 2114;
      v18 = CFSTR("BSXPCServiceConnectionProxy.m");
      v19 = 1024;
      v20 = 328;
      v21 = 2114;
      v22 = v7;
      _os_log_error_impl(&dword_19A799000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);
    }
    objc_msgSend(v7, "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x19A7B11CCLL);
  }

  v10.receiver = self;
  v10.super_class = (Class)BSXPCServiceConnectionProxy;
  -[BSXPCServiceConnectionProxy dealloc](&v10, sel_dealloc);
}

void __186__BSXPCServiceConnectionProxy_proxyForConnection_handshake_withProtocol_activationGeneration_activeXPCConnection_xpcConnectionTargetQueue_replyQueue_target_attributes_assertionProvider___block_invoke(uint64_t a1, objc_class *a2)
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  int v15;
  char v16;
  void (*v17)(void);
  const char *v18;
  NSObject *v19;
  uint64_t v20;
  void *v21;
  NSString *v22;
  objc_class *v23;
  NSString *v24;
  id obj;
  uint64_t v26;
  NSString *v27;
  objc_class *cls;
  void *v29;
  _QWORD block[13];
  char v31;
  char v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  uint8_t buf[4];
  uint64_t v38;
  __int16 v39;
  NSString *v40;
  __int16 v41;
  uint64_t v42;
  __int16 v43;
  const __CFString *v44;
  __int16 v45;
  int v46;
  __int16 v47;
  void *v48;
  _BYTE v49[128];
  uint64_t v50;

  v50 = *MEMORY[0x1E0C80C00];
  v3 = *(void **)(a1 + 32);
  v26 = objc_opt_self();
  cls = a2;
  v27 = NSStringFromClass(a2);
  v29 = v3;
  v33 = 0u;
  v34 = 0u;
  v35 = 0u;
  v36 = 0u;
  obj = (id)objc_msgSend(v3, "methods");
  v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v33, v49, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v34;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v34 != v6)
          objc_enumerationMutation(obj);
        v8 = *(void **)(*((_QWORD *)&v33 + 1) + 8 * i);
        v9 = objc_msgSend(v8, "name");
        v10 = (void *)objc_msgSend(v8, "returnValue");
        v11 = (void *)objc_msgSend(v8, "arguments");
        v12 = +[BSXPCServiceConnectionProxy concreteArgumentsForArguments:]((uint64_t)BSXPCServiceConnectionProxy, v11);
        v13 = (void *)objc_msgSend(v11, "lastObject");
        if (objc_msgSend(v13, "isPointer"))
          v14 = v13;
        else
          v14 = 0;
        if (!objc_msgSend(v13, "isBlock"))
          v13 = 0;
        v15 = objc_msgSend(v10, "isOneWay");
        if (v15 && (v15 = objc_msgSend(v10, "isVoid")) != 0)
        {
          LOBYTE(v15) = objc_msgSend(v10, "hasQualifier:", 82);
          v16 = 1;
        }
        else
        {
          v16 = 0;
        }
        block[0] = MEMORY[0x1E0C809B0];
        block[1] = 3221225472;
        block[2] = __71__BSXPCServiceConnectionProxy_createImplementationOfProtocol_forClass___block_invoke;
        block[3] = &unk_1E390CFB8;
        block[4] = v13;
        block[5] = v27;
        block[11] = v10;
        block[12] = sel_createImplementationOfProtocol_forClass_;
        v31 = v15;
        block[6] = v26;
        block[7] = v9;
        block[8] = v12;
        block[9] = v29;
        v32 = v16;
        block[10] = v14;
        v17 = imp_implementationWithBlock(block);
        v18 = NSSelectorFromString((NSString *)objc_msgSend(v8, "name"));
        if (!class_addMethod(cls, v18, v17, (const char *)objc_msgSend((id)objc_msgSend(v8, "encoding"), "UTF8String")))
        {
          v21 = (void *)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("unable to register method \"%@\" on class \"%@\"), objc_msgSend(v8, "name"), v27);
          if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
          {
            v22 = NSStringFromSelector(sel_createImplementationOfProtocol_forClass_);
            v23 = (objc_class *)objc_opt_class();
            v24 = NSStringFromClass(v23);
            *(_DWORD *)buf = 138544642;
            v38 = (uint64_t)v22;
            v39 = 2114;
            v40 = v24;
            v41 = 2048;
            v42 = v26;
            v43 = 2114;
            v44 = CFSTR("BSXPCServiceConnectionProxy.m");
            v45 = 1024;
            v46 = 571;
            v47 = 2114;
            v48 = v21;
            _os_log_error_impl(&dword_19A799000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);
          }
          objc_msgSend(v21, "UTF8String");
          _bs_set_crash_log_message();
          __break(0);
          JUMPOUT(0x19A7BDFA8);
        }
      }
      v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v33, v49, 16);
    }
    while (v5);
  }
  if (!class_addProtocol(cls, (Protocol *)objc_msgSend(v29, "protocol")))
  {
    v19 = BSServiceXPCErrorsLog();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      v20 = objc_msgSend(v29, "name");
      *(_DWORD *)buf = 138543618;
      v38 = v20;
      v39 = 2114;
      v40 = v27;
      _os_log_error_impl(&dword_19A799000, v19, OS_LOG_TYPE_ERROR, "[BSXPCServiceConnectionProxy] Error adding protocol %{public}@ to class %{public}@", buf, 0x16u);
    }
  }
}

+ (void)invokeMethod:(uint64_t)a3 onTarget:(void *)a4 withMessage:(_QWORD *)a5 forConnection:(uint64_t)a6 completion:
{
  NSObject *v11;
  void *v12;
  int v13;
  uint64_t v14;
  uint64_t v15;
  objc_class *v16;
  void *v17;
  unint64_t v18;
  unint64_t v19;
  uint64_t v20;
  void **v21;
  id v22;
  NSObject *v23;
  objc_class *v24;
  NSString *v25;
  uint64_t v26;
  unint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  objc_class *v31;
  uint64_t v32;
  uint64_t v33;
  void *v34;
  uint64_t v35;
  char isKindOfClass;
  void *v37;
  id v38;
  void *v39;
  NSString *v40;
  objc_class *v41;
  void *v42;
  NSString *v43;
  objc_class *v44;
  void *v45;
  NSString *v46;
  objc_class *v47;
  void *v48;
  NSString *v49;
  objc_class *v50;
  void *v51;
  NSString *v52;
  objc_class *v53;
  void *v54;
  NSString *v55;
  objc_class *v56;
  void *v57;
  NSString *v58;
  objc_class *v59;
  void *v60;
  NSString *v61;
  objc_class *v62;
  NSString *v63;
  void *v64;
  NSString *v65;
  objc_class *v66;
  NSString *v67;
  void *v68;
  NSString *v69;
  objc_class *v70;
  NSString *v71;
  void *v72;
  NSString *v73;
  objc_class *v74;
  NSString *v75;
  int v76;
  __int128 v77;
  __int128 v78;
  uint64_t v79;
  _QWORD v80[8];
  _QWORD v81[8];
  _QWORD v82[17];
  _QWORD v83[11];
  void *v84;
  const __CFString *v85;
  uint64_t v86[9];
  _QWORD v87[4];
  __int128 v88;
  __int128 v89;
  __int128 v90;
  uint8_t buf[4];
  NSString *v92;
  __int16 v93;
  uint64_t v94;
  __int16 v95;
  uint64_t v96;
  __int16 v97;
  const __CFString *v98;
  __int16 v99;
  int v100;
  __int16 v101;
  void *v102;
  uint64_t v103;

  v103 = *MEMORY[0x1E0C80C00];
  v79 = objc_opt_self();
  NSClassFromString(CFSTR("BSObjCMethod"));
  if (!a2)
  {
    v39 = (void *)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("_bs_assert_object != nil"));
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      v40 = NSStringFromSelector(sel_invokeMethod_onTarget_withMessage_forConnection_completion_);
      v41 = (objc_class *)objc_opt_class();
      LODWORD(v87[0]) = 138544642;
      *(_QWORD *)((char *)v87 + 4) = v40;
      WORD2(v87[1]) = 2114;
      *(_QWORD *)((char *)&v87[1] + 6) = NSStringFromClass(v41);
      HIWORD(v87[2]) = 2048;
      v87[3] = v79;
      LOWORD(v88) = 2114;
      *(_QWORD *)((char *)&v88 + 2) = CFSTR("BSXPCServiceConnectionProxy.m");
      WORD5(v88) = 1024;
      HIDWORD(v88) = 171;
      LOWORD(v89) = 2114;
      *(_QWORD *)((char *)&v89 + 2) = v39;
      _os_log_error_impl(&dword_19A799000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", (uint8_t *)v87, 0x3Au);
    }
    objc_msgSend(v39, "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x19A7BEA88);
  }
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v42 = (void *)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("[_bs_assert_object isKindOfClass:BSObjCMethodClass]"));
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      v43 = NSStringFromSelector(sel_invokeMethod_onTarget_withMessage_forConnection_completion_);
      v44 = (objc_class *)objc_opt_class();
      LODWORD(v87[0]) = 138544642;
      *(_QWORD *)((char *)v87 + 4) = v43;
      WORD2(v87[1]) = 2114;
      *(_QWORD *)((char *)&v87[1] + 6) = NSStringFromClass(v44);
      HIWORD(v87[2]) = 2048;
      v87[3] = v79;
      LOWORD(v88) = 2114;
      *(_QWORD *)((char *)&v88 + 2) = CFSTR("BSXPCServiceConnectionProxy.m");
      WORD5(v88) = 1024;
      HIDWORD(v88) = 171;
      LOWORD(v89) = 2114;
      *(_QWORD *)((char *)&v89 + 2) = v42;
      _os_log_error_impl(&dword_19A799000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", (uint8_t *)v87, 0x3Au);
    }
    objc_msgSend(v42, "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x19A7BEB6CLL);
  }
  if (!a3)
  {
    v45 = (void *)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("target"));
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      v46 = NSStringFromSelector(sel_invokeMethod_onTarget_withMessage_forConnection_completion_);
      v47 = (objc_class *)objc_opt_class();
      LODWORD(v87[0]) = 138544642;
      *(_QWORD *)((char *)v87 + 4) = v46;
      WORD2(v87[1]) = 2114;
      *(_QWORD *)((char *)&v87[1] + 6) = NSStringFromClass(v47);
      HIWORD(v87[2]) = 2048;
      v87[3] = v79;
      LOWORD(v88) = 2114;
      *(_QWORD *)((char *)&v88 + 2) = CFSTR("BSXPCServiceConnectionProxy.m");
      WORD5(v88) = 1024;
      HIDWORD(v88) = 172;
      LOWORD(v89) = 2114;
      *(_QWORD *)((char *)&v89 + 2) = v45;
      _os_log_error_impl(&dword_19A799000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", (uint8_t *)v87, 0x3Au);
    }
    objc_msgSend(v45, "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x19A7BEC50);
  }
  NSClassFromString(CFSTR("BSXPCServiceConnectionMessage"));
  if (!a4)
  {
    v48 = (void *)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("_bs_assert_object != nil"));
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      v49 = NSStringFromSelector(sel_invokeMethod_onTarget_withMessage_forConnection_completion_);
      v50 = (objc_class *)objc_opt_class();
      LODWORD(v87[0]) = 138544642;
      *(_QWORD *)((char *)v87 + 4) = v49;
      WORD2(v87[1]) = 2114;
      *(_QWORD *)((char *)&v87[1] + 6) = NSStringFromClass(v50);
      HIWORD(v87[2]) = 2048;
      v87[3] = v79;
      LOWORD(v88) = 2114;
      *(_QWORD *)((char *)&v88 + 2) = CFSTR("BSXPCServiceConnectionProxy.m");
      WORD5(v88) = 1024;
      HIDWORD(v88) = 173;
      LOWORD(v89) = 2114;
      *(_QWORD *)((char *)&v89 + 2) = v48;
      _os_log_error_impl(&dword_19A799000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", (uint8_t *)v87, 0x3Au);
    }
    objc_msgSend(v48, "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x19A7BED34);
  }
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v51 = (void *)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("[_bs_assert_object isKindOfClass:BSXPCServiceConnectionMessageClass]"));
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      v52 = NSStringFromSelector(sel_invokeMethod_onTarget_withMessage_forConnection_completion_);
      v53 = (objc_class *)objc_opt_class();
      LODWORD(v87[0]) = 138544642;
      *(_QWORD *)((char *)v87 + 4) = v52;
      WORD2(v87[1]) = 2114;
      *(_QWORD *)((char *)&v87[1] + 6) = NSStringFromClass(v53);
      HIWORD(v87[2]) = 2048;
      v87[3] = v79;
      LOWORD(v88) = 2114;
      *(_QWORD *)((char *)&v88 + 2) = CFSTR("BSXPCServiceConnectionProxy.m");
      WORD5(v88) = 1024;
      HIDWORD(v88) = 173;
      LOWORD(v89) = 2114;
      *(_QWORD *)((char *)&v89 + 2) = v51;
      _os_log_error_impl(&dword_19A799000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", (uint8_t *)v87, 0x3Au);
    }
    objc_msgSend(v51, "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x19A7BEE18);
  }
  NSClassFromString(CFSTR("BSXPCServiceConnection"));
  if (!a5)
  {
    v54 = (void *)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("_bs_assert_object != nil"));
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      v55 = NSStringFromSelector(sel_invokeMethod_onTarget_withMessage_forConnection_completion_);
      v56 = (objc_class *)objc_opt_class();
      LODWORD(v87[0]) = 138544642;
      *(_QWORD *)((char *)v87 + 4) = v55;
      WORD2(v87[1]) = 2114;
      *(_QWORD *)((char *)&v87[1] + 6) = NSStringFromClass(v56);
      HIWORD(v87[2]) = 2048;
      v87[3] = v79;
      LOWORD(v88) = 2114;
      *(_QWORD *)((char *)&v88 + 2) = CFSTR("BSXPCServiceConnectionProxy.m");
      WORD5(v88) = 1024;
      HIDWORD(v88) = 174;
      LOWORD(v89) = 2114;
      *(_QWORD *)((char *)&v89 + 2) = v54;
      _os_log_error_impl(&dword_19A799000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", (uint8_t *)v87, 0x3Au);
    }
    objc_msgSend(v54, "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x19A7BEEFCLL);
  }
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v57 = (void *)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("[_bs_assert_object isKindOfClass:BSXPCServiceConnectionClass]"));
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      v58 = NSStringFromSelector(sel_invokeMethod_onTarget_withMessage_forConnection_completion_);
      v59 = (objc_class *)objc_opt_class();
      LODWORD(v87[0]) = 138544642;
      *(_QWORD *)((char *)v87 + 4) = v58;
      WORD2(v87[1]) = 2114;
      *(_QWORD *)((char *)&v87[1] + 6) = NSStringFromClass(v59);
      HIWORD(v87[2]) = 2048;
      v87[3] = v79;
      LOWORD(v88) = 2114;
      *(_QWORD *)((char *)&v88 + 2) = CFSTR("BSXPCServiceConnectionProxy.m");
      WORD5(v88) = 1024;
      HIDWORD(v88) = 174;
      LOWORD(v89) = 2114;
      *(_QWORD *)((char *)&v89 + 2) = v57;
      _os_log_error_impl(&dword_19A799000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", (uint8_t *)v87, 0x3Au);
    }
    objc_msgSend(v57, "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x19A7BEFE0);
  }
  v11 = BSServiceXPCLog();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
  {
    v29 = a5[22];
    if (v29)
      v30 = *(_QWORD *)(v29 + 8);
    else
      v30 = 0;
    v31 = (objc_class *)objc_opt_class();
    LODWORD(v87[0]) = 138543874;
    *(_QWORD *)((char *)v87 + 4) = v30;
    WORD2(v87[1]) = 2112;
    *(_QWORD *)((char *)&v87[1] + 6) = NSStringFromClass(v31);
    HIWORD(v87[2]) = 2112;
    v87[3] = objc_msgSend(a2, "name");
    _os_log_debug_impl(&dword_19A799000, v11, OS_LOG_TYPE_DEBUG, "%{public}@ Invoking -[%@ %@]", (uint8_t *)v87, 0x20u);
  }
  v89 = 0u;
  v90 = 0u;
  v88 = 0u;
  memset(v87, 0, sizeof(v87));
  +[BSXPCServiceConnectionProxy decodeArguments:outArgs:fromMessage:forConnection:]((uint64_t)BSXPCServiceConnectionProxy, (void *)objc_msgSend(a2, "arguments"), (uint64_t)v87, a4, a5);
  v12 = (void *)objc_msgSend(a4, "createReply");
  v84 = 0;
  v13 = objc_msgSend((id)objc_msgSend(a2, "returnValue"), "type");
  v16 = (objc_class *)objc_opt_class();
  if (class_getInstanceMethod(v16, (SEL)objc_msgSend(a2, "selector")))
  {
    v17 = (void *)objc_msgSend(a2, "lastArgument");
    if ((objc_msgSend(v17, "isBlock") & 1) != 0 || objc_msgSend(v17, "isPointer"))
    {
      v18 = objc_msgSend(v17, "argumentIndex");
      v19 = v18;
      if (v18 >= 0xA)
      {
        v68 = (void *)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("reply parameter argument is out of bounds"));
        if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
        {
          v69 = NSStringFromSelector(sel_invokeMethod_onTarget_withMessage_forConnection_completion_);
          v70 = (objc_class *)objc_opt_class();
          v71 = NSStringFromClass(v70);
          *(_DWORD *)buf = 138544642;
          v92 = v69;
          v93 = 2114;
          v94 = (uint64_t)v71;
          v95 = 2048;
          v96 = v79;
          v97 = 2114;
          v98 = CFSTR("BSXPCServiceConnectionProxy.m");
          v99 = 1024;
          v100 = 209;
          v101 = 2114;
          v102 = v68;
          _os_log_error_impl(&dword_19A799000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);
        }
        objc_msgSend(v68, "UTF8String");
        _bs_set_crash_log_message();
        __break(0);
        JUMPOUT(0x19A7BF278);
      }
      if (v87[v18])
      {
        v72 = (void *)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("reply parameter argument slot is not empty"));
        if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
        {
          v73 = NSStringFromSelector(sel_invokeMethod_onTarget_withMessage_forConnection_completion_);
          v74 = (objc_class *)objc_opt_class();
          v75 = NSStringFromClass(v74);
          *(_DWORD *)buf = 138544642;
          v92 = v73;
          v93 = 2114;
          v94 = (uint64_t)v75;
          v95 = 2048;
          v96 = v79;
          v97 = 2114;
          v98 = CFSTR("BSXPCServiceConnectionProxy.m");
          v99 = 1024;
          v100 = 210;
          v101 = 2114;
          v102 = v72;
          _os_log_error_impl(&dword_19A799000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);
        }
        objc_msgSend(v72, "UTF8String");
        _bs_set_crash_log_message();
        __break(0);
        JUMPOUT(0x19A7BF350);
      }
      if (objc_msgSend(v17, "isBlock"))
      {
        v20 = objc_msgSend(v17, "blockArguments");
        v83[0] = MEMORY[0x1E0C809B0];
        v83[1] = 3221225472;
        v83[2] = __90__BSXPCServiceConnectionProxy_invokeMethod_onTarget_withMessage_forConnection_completion___block_invoke;
        v83[3] = &unk_1E390CEC8;
        v83[4] = v12;
        v83[5] = v20;
        v83[6] = a5;
        v83[7] = a2;
        v83[10] = sel_invokeMethod_onTarget_withMessage_forConnection_completion_;
        v21 = (void **)v83;
        v83[8] = v79;
        v83[9] = a6;
        v12 = 0;
        a6 = 0;
      }
      else
      {
        v21 = &v84;
      }
      v87[v19] = v21;
    }
    v27 = objc_msgSend((id)objc_msgSend(a2, "arguments"), "count");
    v28 = objc_opt_self();
    if (v27 >= 0xB)
    {
      v60 = (void *)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("count <= BSOBJC_MAX_ARGS"));
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      {
        v61 = NSStringFromSelector(sel_invokeMethod_onTarget_withArguments_count_returnValue_);
        v62 = (objc_class *)objc_opt_class();
        v63 = NSStringFromClass(v62);
        *(_DWORD *)buf = 138544642;
        v92 = v61;
        v93 = 2114;
        v94 = (uint64_t)v63;
        v95 = 2048;
        v96 = v28;
        v97 = 2114;
        v98 = CFSTR("BSXPCServiceConnectionProxy.m");
        v99 = 1024;
        v100 = 590;
        v101 = 2114;
        v102 = v60;
        _os_log_error_impl(&dword_19A799000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);
      }
      objc_msgSend(v60, "UTF8String");
      _bs_set_crash_log_message();
      __break(0);
      JUMPOUT(0x19A7BF0C0);
    }
    NSClassFromString(CFSTR("NSObject"));
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v64 = (void *)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("[_bs_assert_object isKindOfClass:NSObjectClass]"));
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      {
        v65 = NSStringFromSelector(sel_invokeMethod_onTarget_withArguments_count_returnValue_);
        v66 = (objc_class *)objc_opt_class();
        v67 = NSStringFromClass(v66);
        *(_DWORD *)buf = 138544642;
        v92 = v65;
        v93 = 2114;
        v94 = (uint64_t)v67;
        v95 = 2048;
        v96 = v28;
        v97 = 2114;
        v98 = CFSTR("BSXPCServiceConnectionProxy.m");
        v99 = 1024;
        v100 = 591;
        v101 = 2114;
        v102 = v64;
        _os_log_error_impl(&dword_19A799000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);
      }
      objc_msgSend(v64, "UTF8String");
      _bs_set_crash_log_message();
      __break(0);
      JUMPOUT(0x19A7BF1A0);
    }
    switch(v27)
    {
      case 0uLL:
        switch(v13)
        {
          case '@':
            goto LABEL_84;
          case 'B':
            goto LABEL_82;
          case 'v':
            goto LABEL_63;
        }
        v76 = 601;
        goto LABEL_165;
      case 1uLL:
        switch(v13)
        {
          case '@':
            goto LABEL_84;
          case 'B':
            goto LABEL_82;
          case 'v':
            goto LABEL_63;
        }
        v76 = 607;
        goto LABEL_165;
      case 2uLL:
        switch(v13)
        {
          case '@':
            goto LABEL_84;
          case 'B':
            goto LABEL_82;
          case 'v':
            goto LABEL_63;
        }
        v76 = 613;
        goto LABEL_165;
      case 3uLL:
        switch(v13)
        {
          case '@':
            goto LABEL_84;
          case 'B':
            goto LABEL_82;
          case 'v':
            goto LABEL_63;
        }
        v76 = 619;
        goto LABEL_165;
      case 4uLL:
        switch(v13)
        {
          case '@':
            goto LABEL_84;
          case 'B':
            goto LABEL_82;
          case 'v':
            goto LABEL_63;
        }
        v76 = 625;
        goto LABEL_165;
      case 5uLL:
        switch(v13)
        {
          case '@':
            goto LABEL_84;
          case 'B':
            goto LABEL_82;
          case 'v':
            goto LABEL_63;
        }
        v76 = 631;
        goto LABEL_165;
      case 6uLL:
        if (v13 != 64)
        {
          if (v13 != 66)
          {
            if (v13 == 118)
            {
LABEL_63:
              method_invoke();
              goto LABEL_72;
            }
            v76 = 637;
LABEL_165:
            __assert_rtn("+[BSXPCServiceConnectionProxy invokeMethod:onTarget:withArguments:count:returnValue:]", "BSXPCServiceConnectionProxy.m", v76, "false");
          }
LABEL_82:
          method_invoke();
          goto LABEL_90;
        }
LABEL_84:
        method_invoke();
        break;
      case 7uLL:
        if (v13 != 64)
        {
          if (v13 == 66)
          {
            *(_QWORD *)&v77 = v89;
            method_invoke();
            goto LABEL_90;
          }
          if (v13 != 118)
          {
            v76 = 643;
            goto LABEL_165;
          }
          *(_QWORD *)&v77 = v89;
          method_invoke();
          goto LABEL_72;
        }
        *(_QWORD *)&v77 = v89;
        method_invoke();
        break;
      case 8uLL:
        if (v13 != 64)
        {
          if (v13 != 66)
          {
            if (v13 == 118)
            {
              v77 = v89;
              method_invoke();
              goto LABEL_72;
            }
            v76 = 649;
            goto LABEL_165;
          }
          v77 = v89;
          method_invoke();
          goto LABEL_90;
        }
        v77 = v89;
        method_invoke();
        break;
      case 9uLL:
        if (v13 != 64)
        {
          if (v13 == 66)
          {
            *(_QWORD *)&v78 = v90;
            v77 = v89;
            method_invoke();
            goto LABEL_90;
          }
          if (v13 != 118)
          {
            v76 = 655;
            goto LABEL_165;
          }
          *(_QWORD *)&v78 = v90;
          v77 = v89;
          method_invoke();
LABEL_72:
          v15 = 0;
LABEL_95:
          v14 = 0;
          goto LABEL_96;
        }
        *(_QWORD *)&v78 = v90;
        v77 = v89;
        method_invoke();
        break;
      case 0xAuLL:
        if (v13 != 64)
        {
          if (v13 != 66)
          {
            if (v13 == 118)
            {
              v78 = v90;
              v77 = v89;
              method_invoke();
              goto LABEL_72;
            }
            v76 = 661;
            goto LABEL_165;
          }
          v78 = v90;
          v77 = v89;
          method_invoke();
LABEL_90:
          v14 = v32;
          v15 = 0;
LABEL_96:
          v22 = 0;
          goto LABEL_97;
        }
        v78 = v90;
        v77 = v89;
        method_invoke();
        break;
      default:
        goto LABEL_72;
    }
    v15 = v33;
    goto LABEL_95;
  }
  v85 = CFSTR("BSServiceInterfaceMethod");
  v86[0] = objc_msgSend(a2, "name");
  v22 = BSServiceConnectionErrorCreateWithInfo(3uLL, CFSTR("No method on target found for selector"), (void *)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v86, &v85, 1));
  v23 = BSServiceXPCErrorsLog();
  if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
  {
    v24 = (objc_class *)objc_opt_class();
    v25 = NSStringFromClass(v24);
    v26 = objc_msgSend(a2, "name");
    *(_DWORD *)buf = 138412546;
    v92 = v25;
    v93 = 2112;
    v94 = v26;
    _os_log_error_impl(&dword_19A799000, v23, OS_LOG_TYPE_ERROR, "[BSXPCServiceConnectionProxy] Error: No method found on object %@ for @selector(%@)", buf, 0x16u);
  }
  v14 = 0;
  v15 = 0;
LABEL_97:
  if (v12)
  {
    if (v13 == 66)
    {
      objc_msgSend(v12, "encodeBool:forKey:", v14, CFSTR("BSXPCReturnValue"));
    }
    else if (v13 == 64)
    {
      v34 = (void *)objc_msgSend(a2, "returnValue", v14);
      v35 = objc_msgSend(v34, "objectClass");
      if (v15)
      {
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          v82[0] = MEMORY[0x1E0C809B0];
          v82[1] = 3221225472;
          v82[2] = __90__BSXPCServiceConnectionProxy_invokeMethod_onTarget_withMessage_forConnection_completion___block_invoke_57;
          v82[3] = &unk_1E390CEF0;
          v82[4] = v15;
          v82[5] = a2;
          v82[6] = v35;
          v82[7] = v79;
          v82[8] = sel_invokeMethod_onTarget_withMessage_forConnection_completion_;
          __90__BSXPCServiceConnectionProxy_invokeMethod_onTarget_withMessage_forConnection_completion___block_invoke_57((uint64_t)v82);
        }
        objc_msgSend(v12, "encodeObject:forKey:", v15, CFSTR("BSXPCReturnValue"));
      }
      else if (objc_msgSend(v34, "isObjectNonnull"))
      {
        v81[0] = MEMORY[0x1E0C809B0];
        v81[1] = 3221225472;
        v81[2] = __90__BSXPCServiceConnectionProxy_invokeMethod_onTarget_withMessage_forConnection_completion___block_invoke_60;
        v81[3] = &unk_1E390CEA0;
        v81[4] = a2;
        v81[5] = v35;
        v81[6] = v79;
        v81[7] = sel_invokeMethod_onTarget_withMessage_forConnection_completion_;
        __90__BSXPCServiceConnectionProxy_invokeMethod_onTarget_withMessage_forConnection_completion___block_invoke_60((uint64_t)v81);
      }
    }
    if (v84)
    {
      objc_opt_class();
      isKindOfClass = objc_opt_isKindOfClass();
      v37 = v84;
      if ((isKindOfClass & 1) == 0)
      {
        v80[0] = MEMORY[0x1E0C809B0];
        v80[1] = 3221225472;
        v80[2] = __90__BSXPCServiceConnectionProxy_invokeMethod_onTarget_withMessage_forConnection_completion___block_invoke_64;
        v80[3] = &unk_1E390CEA0;
        v80[4] = v84;
        v80[5] = a2;
        v80[6] = v79;
        v80[7] = sel_invokeMethod_onTarget_withMessage_forConnection_completion_;
        __90__BSXPCServiceConnectionProxy_invokeMethod_onTarget_withMessage_forConnection_completion___block_invoke_64((uint64_t)v80);
      }
    }
    else
    {
      v37 = 0;
    }
    if (v37)
      v38 = v37;
    else
      v38 = v22;
    if (v38)
      objc_msgSend(v12, "encodeObject:forKey:", v38, CFSTR("BSXPCReturnError"));
    objc_msgSend(v12, "send", v77, v78);
    objc_msgSend(v12, "invalidate");
  }
  if (a6)
    (*(void (**)(uint64_t))(a6 + 16))(a6);
}

uint64_t __90__BSXPCServiceConnectionProxy_invokeMethod_onTarget_withMessage_forConnection_completion___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11)
{
  void *v13;
  uint64_t result;
  void *v15;
  _BYTE buf[24];
  __int128 v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v13 = *(void **)(a1 + 32);
  if (v13)
  {
    *(_QWORD *)buf = a2;
    *(_QWORD *)&buf[8] = a3;
    *(_QWORD *)&buf[16] = a4;
    *(_QWORD *)&v17 = a5;
    *((_QWORD *)&v17 + 1) = a6;
    v18 = a7;
    v19 = a8;
    v20 = a9;
    v21 = a10;
    v22 = a11;
    +[BSXPCServiceConnectionProxy encodeArguments:inArgs:toMessage:forConnection:]((uint64_t)BSXPCServiceConnectionProxy, *(void **)(a1 + 40), (uint64_t)buf, v13);
    objc_msgSend(*(id *)(a1 + 32), "send");
    objc_msgSend(*(id *)(a1 + 32), "invalidate");
  }
  else if (a2)
  {
    v15 = (void *)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("arg1 == nil"));
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138544130;
      *(_QWORD *)&buf[4] = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "+[BSXPCServiceConnectionProxy invokeMethod:onTarget:withMessage:forConnection:completion:]_block_invoke");
      *(_WORD *)&buf[12] = 2114;
      *(_QWORD *)&buf[14] = CFSTR("BSXPCServiceConnectionProxy.m");
      *(_WORD *)&buf[22] = 1024;
      LODWORD(v17) = 234;
      WORD2(v17) = 2114;
      *(_QWORD *)((char *)&v17 + 6) = v15;
      _os_log_error_impl(&dword_19A799000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ (%{public}@:%i) : %{public}@", buf, 0x26u);
    }
    objc_msgSend(v15, "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x19A7BF908);
  }
  result = *(_QWORD *)(a1 + 72);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

void __90__BSXPCServiceConnectionProxy_invokeMethod_onTarget_withMessage_forConnection_completion___block_invoke_2(uint64_t a1)
{
  void *v2;
  NSString *v3;
  objc_class *v4;
  NSString *v5;
  uint64_t v6;
  uint8_t buf[4];
  NSString *v8;
  __int16 v9;
  NSString *v10;
  __int16 v11;
  uint64_t v12;
  __int16 v13;
  const __CFString *v14;
  __int16 v15;
  int v16;
  __int16 v17;
  void *v18;

  v2 = (void *)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Error encoding reply block for %@: %@ -> %@"), objc_msgSend(*(id *)(a1 + 32), "name"), objc_msgSend(*(id *)(a1 + 40), "description"), objc_msgSend(*(id *)(a1 + 40), "callStackSymbols"));
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v3 = NSStringFromSelector(*(SEL *)(a1 + 56));
    v4 = (objc_class *)objc_opt_class();
    v5 = NSStringFromClass(v4);
    v6 = *(_QWORD *)(a1 + 48);
    *(_DWORD *)buf = 138544642;
    v8 = v3;
    v9 = 2114;
    v10 = v5;
    v11 = 2048;
    v12 = v6;
    v13 = 2114;
    v14 = CFSTR("BSXPCServiceConnectionProxy.m");
    v15 = 1024;
    v16 = 226;
    v17 = 2114;
    v18 = v2;
    _os_log_error_impl(&dword_19A799000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);
  }
  objc_msgSend(v2, "UTF8String");
  _bs_set_crash_log_message();
  __break(0);
}

void __90__BSXPCServiceConnectionProxy_invokeMethod_onTarget_withMessage_forConnection_completion___block_invoke_54(uint64_t a1)
{
  void *v2;
  NSString *v3;
  objc_class *v4;
  NSString *v5;
  uint64_t v6;
  uint8_t buf[4];
  NSString *v8;
  __int16 v9;
  NSString *v10;
  __int16 v11;
  uint64_t v12;
  __int16 v13;
  const __CFString *v14;
  __int16 v15;
  int v16;
  __int16 v17;
  void *v18;

  v2 = (void *)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Error encoding return value from %@: %@ -> %@"), objc_msgSend(*(id *)(a1 + 32), "name"), objc_msgSend(*(id *)(a1 + 40), "description"), objc_msgSend(*(id *)(a1 + 40), "callStackSymbols"));
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v3 = NSStringFromSelector(*(SEL *)(a1 + 56));
    v4 = (objc_class *)objc_opt_class();
    v5 = NSStringFromClass(v4);
    v6 = *(_QWORD *)(a1 + 48);
    *(_DWORD *)buf = 138544642;
    v8 = v3;
    v9 = 2114;
    v10 = v5;
    v11 = 2048;
    v12 = v6;
    v13 = 2114;
    v14 = CFSTR("BSXPCServiceConnectionProxy.m");
    v15 = 1024;
    v16 = 276;
    v17 = 2114;
    v18 = v2;
    _os_log_error_impl(&dword_19A799000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);
  }
  objc_msgSend(v2, "UTF8String");
  _bs_set_crash_log_message();
  __break(0);
}

void __90__BSXPCServiceConnectionProxy_invokeMethod_onTarget_withMessage_forConnection_completion___block_invoke_57(uint64_t a1)
{
  void *v2;
  NSString *v3;
  void *v4;
  NSString *v5;
  objc_class *v6;
  NSString *v7;
  uint64_t v8;
  uint8_t buf[4];
  NSString *v10;
  __int16 v11;
  NSString *v12;
  __int16 v13;
  uint64_t v14;
  __int16 v15;
  const __CFString *v16;
  __int16 v17;
  int v18;
  __int16 v19;
  void *v20;

  v2 = (void *)MEMORY[0x1E0CB3940];
  v3 = NSStringFromClass((Class)objc_msgSend(*(id *)(a1 + 32), "classForCoder"));
  v4 = (void *)objc_msgSend(v2, "stringWithFormat:", CFSTR("Return value %@ from %@ does not match expected type %@"), v3, objc_msgSend(*(id *)(a1 + 40), "name"), NSStringFromClass(*(Class *)(a1 + 48)));
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v5 = NSStringFromSelector(*(SEL *)(a1 + 64));
    v6 = (objc_class *)objc_opt_class();
    v7 = NSStringFromClass(v6);
    v8 = *(_QWORD *)(a1 + 56);
    *(_DWORD *)buf = 138544642;
    v10 = v5;
    v11 = 2114;
    v12 = v7;
    v13 = 2048;
    v14 = v8;
    v15 = 2114;
    v16 = CFSTR("BSXPCServiceConnectionProxy.m");
    v17 = 1024;
    v18 = 281;
    v19 = 2114;
    v20 = v4;
    _os_log_error_impl(&dword_19A799000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);
  }
  objc_msgSend(v4, "UTF8String");
  _bs_set_crash_log_message();
  __break(0);
}

void __90__BSXPCServiceConnectionProxy_invokeMethod_onTarget_withMessage_forConnection_completion___block_invoke_60(uint64_t a1)
{
  void *v2;
  NSString *v3;
  objc_class *v4;
  NSString *v5;
  uint64_t v6;
  uint8_t buf[4];
  NSString *v8;
  __int16 v9;
  NSString *v10;
  __int16 v11;
  uint64_t v12;
  __int16 v13;
  const __CFString *v14;
  __int16 v15;
  int v16;
  __int16 v17;
  void *v18;

  v2 = (void *)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Return value from %@ is declared nonnull"), objc_msgSend(*(id *)(a1 + 32), "name"), NSStringFromClass(*(Class *)(a1 + 40)));
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v3 = NSStringFromSelector(*(SEL *)(a1 + 56));
    v4 = (objc_class *)objc_opt_class();
    v5 = NSStringFromClass(v4);
    v6 = *(_QWORD *)(a1 + 48);
    *(_DWORD *)buf = 138544642;
    v8 = v3;
    v9 = 2114;
    v10 = v5;
    v11 = 2048;
    v12 = v6;
    v13 = 2114;
    v14 = CFSTR("BSXPCServiceConnectionProxy.m");
    v15 = 1024;
    v16 = 287;
    v17 = 2114;
    v18 = v2;
    _os_log_error_impl(&dword_19A799000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);
  }
  objc_msgSend(v2, "UTF8String");
  _bs_set_crash_log_message();
  __break(0);
}

void __90__BSXPCServiceConnectionProxy_invokeMethod_onTarget_withMessage_forConnection_completion___block_invoke_64(uint64_t a1)
{
  void *v2;
  objc_class *v3;
  void *v4;
  NSString *v5;
  objc_class *v6;
  NSString *v7;
  uint64_t v8;
  uint8_t buf[4];
  NSString *v10;
  __int16 v11;
  NSString *v12;
  __int16 v13;
  uint64_t v14;
  __int16 v15;
  const __CFString *v16;
  __int16 v17;
  int v18;
  __int16 v19;
  void *v20;

  v2 = (void *)MEMORY[0x1E0CB3940];
  v3 = (objc_class *)objc_opt_class();
  v4 = (void *)objc_msgSend(v2, "stringWithFormat:", CFSTR("Invalid out-parameter error (%@) from %@"), NSStringFromClass(v3), objc_msgSend(*(id *)(a1 + 40), "name"));
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v5 = NSStringFromSelector(*(SEL *)(a1 + 56));
    v6 = (objc_class *)objc_opt_class();
    v7 = NSStringFromClass(v6);
    v8 = *(_QWORD *)(a1 + 48);
    *(_DWORD *)buf = 138544642;
    v10 = v5;
    v11 = 2114;
    v12 = v7;
    v13 = 2048;
    v14 = v8;
    v15 = 2114;
    v16 = CFSTR("BSXPCServiceConnectionProxy.m");
    v17 = 1024;
    v18 = 297;
    v19 = 2114;
    v20 = v4;
    _os_log_error_impl(&dword_19A799000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);
  }
  objc_msgSend(v4, "UTF8String");
  _bs_set_crash_log_message();
  __break(0);
}

void __90__BSXPCServiceConnectionProxy_invokeMethod_onTarget_withMessage_forConnection_completion___block_invoke_69(uint64_t a1)
{
  void *v2;
  NSString *v3;
  objc_class *v4;
  NSString *v5;
  uint64_t v6;
  uint8_t buf[4];
  NSString *v8;
  __int16 v9;
  NSString *v10;
  __int16 v11;
  uint64_t v12;
  __int16 v13;
  const __CFString *v14;
  __int16 v15;
  int v16;
  __int16 v17;
  void *v18;

  v2 = (void *)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Error encoding return error from %@: %@ -> %@"), objc_msgSend(*(id *)(a1 + 32), "name"), objc_msgSend(*(id *)(a1 + 40), "description"), objc_msgSend(*(id *)(a1 + 40), "callStackSymbols"));
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v3 = NSStringFromSelector(*(SEL *)(a1 + 56));
    v4 = (objc_class *)objc_opt_class();
    v5 = NSStringFromClass(v4);
    v6 = *(_QWORD *)(a1 + 48);
    *(_DWORD *)buf = 138544642;
    v8 = v3;
    v9 = 2114;
    v10 = v5;
    v11 = 2048;
    v12 = v6;
    v13 = 2114;
    v14 = CFSTR("BSXPCServiceConnectionProxy.m");
    v15 = 1024;
    v16 = 306;
    v17 = 2114;
    v18 = v2;
    _os_log_error_impl(&dword_19A799000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);
  }
  objc_msgSend(v2, "UTF8String");
  _bs_set_crash_log_message();
  __break(0);
}

void __90__BSXPCServiceConnectionProxy_invokeMethod_onTarget_withMessage_forConnection_completion___block_invoke_72(uint64_t a1)
{
  objc_exception_throw(*(id *)(a1 + 32));
}

- (void)_decrementInFlightMessageCounter
{
  os_unfair_lock_s *v2;
  int v3;
  int v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  NSString *v9;
  objc_class *v10;
  uint8_t buf[4];
  NSString *v12;
  __int16 v13;
  NSString *v14;
  __int16 v15;
  uint64_t v16;
  __int16 v17;
  const __CFString *v18;
  __int16 v19;
  int v20;
  __int16 v21;
  void *v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  if (a1)
  {
    v2 = (os_unfair_lock_s *)(a1 + 88);
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 88));
    v3 = *(_DWORD *)(a1 + 92);
    if (!v3)
    {
      v5 = *(_QWORD *)(a1 + 8);
      if (v5 && (v6 = *(_QWORD *)(v5 + 176)) != 0)
        v7 = *(_QWORD *)(v6 + 8);
      else
        v7 = 0;
      v8 = (void *)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@ <%@:%p> unbalanced message tracking detected"), v7, objc_opt_class(), a1);
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      {
        v9 = NSStringFromSelector(sel__decrementInFlightMessageCounter);
        v10 = (objc_class *)objc_opt_class();
        *(_DWORD *)buf = 138544642;
        v12 = v9;
        v13 = 2114;
        v14 = NSStringFromClass(v10);
        v15 = 2048;
        v16 = a1;
        v17 = 2114;
        v18 = CFSTR("BSXPCServiceConnectionProxy.m");
        v19 = 1024;
        v20 = 347;
        v21 = 2114;
        v22 = v8;
        _os_log_error_impl(&dword_19A799000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);
      }
      objc_msgSend(v8, "UTF8String");
      _bs_set_crash_log_message();
      __break(0);
      JUMPOUT(0x19A7C01B8);
    }
    v4 = v3 - 1;
    *(_DWORD *)(a1 + 92) = v4;
    if (!v4)
    {
      objc_msgSend(*(id *)(a1 + 80), "invalidate");

      *(_QWORD *)(a1 + 80) = 0;
    }
    os_unfair_lock_unlock(v2);
  }
}

id __71__BSXPCServiceConnectionProxy_createImplementationOfProtocol_forClass___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, __int128 a9, uint64_t a10, uint64_t a11)
{
  __CFString *v18;
  char *i;
  void *v20;
  void *v21;
  id v22;
  __CFString *v23;
  os_unfair_lock_s *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  _BYTE *v28;
  _BOOL8 v29;
  NSObject *v30;
  const char *v31;
  _QWORD *v32;
  NSObject *v33;
  uint64_t v34;
  os_unfair_lock_s *v35;
  int v36;
  char *v37;
  void *v38;
  NSString *v39;
  objc_class *v40;
  NSString *v41;
  void (*v42)(uint64_t, uint64_t);
  int v43;
  uint64_t v44;
  void *v45;
  _QWORD *v46;
  int v47;
  void *v48;
  unint64_t v49;
  void *v50;
  NSObject *v51;
  uint64_t v52;
  objc_class *v53;
  uint64_t v54;
  uint64_t v55;
  NSObject *v56;
  const char *v57;
  uint32_t v58;
  NSObject *v59;
  uint64_t v60;
  objc_class *v61;
  uint64_t v62;
  void *v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  id v67;
  void *v68;
  void *v69;
  void *v70;
  id v71;
  objc_class *v72;
  id v73;
  void *v74;
  _QWORD *v75;
  void *v76;
  NSObject *v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  id v82;
  id v83;
  char *v85;
  uint64_t v86;
  uint64_t v87;
  void *v88;
  uint64_t v89;
  uint64_t v90;
  objc_class *v91;
  void *v92;
  NSString *v93;
  objc_class *v94;
  NSString *v95;
  void (*v96)(uint64_t, uint64_t);
  char *v97;
  void *v98;
  NSString *v99;
  objc_class *v100;
  NSString *v101;
  void (*v102)(uint64_t, uint64_t);
  uint64_t v103;
  uint64_t v104;
  uint64_t v105;
  char *v106;
  id v107;
  void *v108;
  int v109;
  id v110;
  os_unfair_lock_s *v112;
  os_unfair_lock_s *lock;
  _QWORD newValue[5];
  _QWORD v115[8];
  char v116;
  _QWORD v117[22];
  id v118[9];
  _QWORD v119[6];
  __int128 v120;
  uint64_t v121;
  uint64_t v122;
  _BYTE buf[24];
  void (*v124)(uint64_t, uint64_t);
  _BYTE v125[40];
  uint64_t v126;

  v126 = *MEMORY[0x1E0C80C00];
  v110 = objc_alloc_init(MEMORY[0x1E0CB34A8]);
  v119[0] = a3;
  v119[1] = a4;
  v119[2] = a5;
  v119[3] = a6;
  v119[4] = a7;
  v119[5] = a8;
  v120 = a9;
  v121 = a10;
  v122 = a11;
  v18 = *(__CFString **)(a2 + 8);
  if (!v18)
    goto LABEL_124;
  for (i = v18[5].data; ; i = 0)
  {
    v20 = *(void **)(a1 + 32);
    if (v20)
    {
      v21 = (void *)v119[objc_msgSend(v20, "argumentIndex")];
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        v88 = (void *)MEMORY[0x1E0CB3940];
        if (i)
          v89 = *((_QWORD *)i + 1);
        else
          v89 = 0;
        v90 = *(_QWORD *)(a1 + 40);
        v91 = (objc_class *)objc_opt_class();
        v92 = (void *)objc_msgSend(v88, "stringWithFormat:", CFSTR("%@ <%@:%p> Reply block argument was not a block, but a %@"), v89, v90, a2, NSStringFromClass(v91));
        if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
        {
          v93 = NSStringFromSelector(*(SEL *)(a1 + 96));
          v94 = (objc_class *)objc_opt_class();
          v95 = NSStringFromClass(v94);
          v96 = *(void (**)(uint64_t, uint64_t))(a1 + 48);
          *(_DWORD *)buf = 138544642;
          *(_QWORD *)&buf[4] = v93;
          *(_WORD *)&buf[12] = 2114;
          *(_QWORD *)&buf[14] = v95;
          *(_WORD *)&buf[22] = 2048;
          v124 = v96;
          *(_WORD *)v125 = 2114;
          *(_QWORD *)&v125[2] = CFSTR("BSXPCServiceConnectionProxy.m");
          *(_WORD *)&v125[10] = 1024;
          *(_DWORD *)&v125[12] = 391;
          *(_WORD *)&v125[16] = 2114;
          *(_QWORD *)&v125[18] = v92;
          _os_log_error_impl(&dword_19A799000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);
        }
        objc_msgSend(v92, "UTF8String");
        _bs_set_crash_log_message();
        __break(0);
        JUMPOUT(0x19A7C0E18);
      }
      v22 = (id)objc_msgSend(v21, "copy");
      v23 = *(__CFString **)(a2 + 8);
    }
    else
    {
      v22 = 0;
      v23 = v18;
    }
    v107 = v22;
    if (-[__CFString _isInvalidated](v23, "_isInvalidated"))
    {
      v24 = (os_unfair_lock_s *)(a2 + 88);
      os_unfair_lock_lock((os_unfair_lock_t)(a2 + 88));
    }
    else
    {
      v25 = *(_QWORD *)(a2 + 32);
      v24 = (os_unfair_lock_s *)(a2 + 88);
      os_unfair_lock_lock((os_unfair_lock_t)(a2 + 88));
      if (v25)
      {
        v26 = *(void **)(a2 + 16);
        os_unfair_lock_unlock((os_unfair_lock_t)(a2 + 88));
        v27 = *(void **)(a2 + 32);
        v109 = 1;
        goto LABEL_12;
      }
    }
    os_unfair_lock_unlock(v24);
    v26 = 0;
    v109 = 0;
    v27 = 0;
LABEL_12:
    v28 = +[BSXPCServiceConnectionMessage messageWithXPCConnection:targetQueue:handshake:activationGeneration:delegate:]((uint64_t)BSXPCServiceConnectionMessage, v27, *(void **)(a2 + 40), v26, *(_DWORD *)(a2 + 96), v18);
    -[BSXPCServiceConnectionMessage setReplyQueue:]((uint64_t)v28, *(void **)(a2 + 48));
    if (v28)
      v28[60] = *(_BYTE *)(a1 + 104);
    if (objc_msgSend(i, "isChild"))
    {
      if (i)
      {
        -[BSXPCServiceConnectionMessage setChildIdentifier:](v28, *((_QWORD *)i + 4));
        v29 = i[24] != 0;
      }
      else
      {
        -[BSXPCServiceConnectionMessage setChildIdentifier:](v28, 0);
        v29 = 0;
      }
      -[BSXPCServiceConnectionMessage setChildIdentifierIsRemotelyDefined:](v28, (const char *)v29);
    }
    v106 = i;
    v108 = v26;
    lock = v24;
    -[BSXPCServiceConnectionMessage setSelectorName:](v28, *(void **)(a1 + 56));
    v112 = (os_unfair_lock_s *)v18;
    +[BSXPCServiceConnectionProxy encodeArguments:inArgs:toMessage:forConnection:]((uint64_t)BSXPCServiceConnectionProxy, *(void **)(a1 + 64), (uint64_t)v119, v28);
    v30 = BSServiceXPCLog();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_DEBUG))
    {
      v33 = BSServiceXPCLog();
      if (os_log_type_enabled(v33, OS_LOG_TYPE_DEBUG))
      {
        if (i)
          v78 = *((_QWORD *)i + 1);
        else
          v78 = 0;
        v79 = *(_QWORD *)(a1 + 40);
        if (*(_BYTE *)(a1 + 105))
          v18 = CFSTR("async");
        else
          v18 = CFSTR("sync");
        v80 = objc_msgSend(*(id *)(a1 + 72), "name");
        v81 = *(_QWORD *)(a1 + 56);
        *(_DWORD *)buf = 138544642;
        *(_QWORD *)&buf[4] = v78;
        *(_WORD *)&buf[12] = 2114;
        *(_QWORD *)&buf[14] = v79;
        *(_WORD *)&buf[22] = 2048;
        v124 = (void (*)(uint64_t, uint64_t))a2;
        *(_WORD *)v125 = 2114;
        *(_QWORD *)&v125[2] = v18;
        *(_WORD *)&v125[10] = 2114;
        *(_QWORD *)&v125[12] = v80;
        *(_WORD *)&v125[20] = 2114;
        *(_QWORD *)&v125[22] = v81;
        _os_log_debug_impl(&dword_19A799000, v33, OS_LOG_TYPE_DEBUG, "%{public}@ <%{public}@:%p> Sending %{public}@ -[<%{public}@> %{public}@]", buf, 0x3Eu);
      }
      if (objc_msgSend(*(id *)(a1 + 64), "count"))
      {
        v34 = objc_msgSend((id)objc_msgSend(*(id *)(a1 + 64), "firstObject"), "argumentIndex");
        if (v34 <= objc_msgSend((id)objc_msgSend(*(id *)(a1 + 64), "lastObject"), "argumentIndex"))
        {
          do
          {
            v50 = (void *)v119[v34];
            if ((objc_msgSend(v50, "isNSString") & 1) != 0 || objc_msgSend(v50, "isNSNumber"))
            {
              v51 = BSServiceXPCLog();
              if (os_log_type_enabled(v51, OS_LOG_TYPE_DEBUG))
              {
                if (v106)
                  v52 = *((_QWORD *)v106 + 1);
                else
                  v52 = 0;
                v18 = *(__CFString **)(a1 + 40);
                v53 = (objc_class *)objc_opt_class();
                v54 = -[NSString classForCoder](NSStringFromClass(v53), "classForCoder");
                v55 = objc_msgSend(v50, "description");
                *(_DWORD *)buf = 138544898;
                *(_QWORD *)&buf[4] = v52;
                *(_WORD *)&buf[12] = 2114;
                *(_QWORD *)&buf[14] = v18;
                *(_WORD *)&buf[22] = 2048;
                v124 = (void (*)(uint64_t, uint64_t))a2;
                *(_WORD *)v125 = 1024;
                *(_DWORD *)&v125[2] = v34;
                *(_WORD *)&v125[6] = 2114;
                *(_QWORD *)&v125[8] = v54;
                *(_WORD *)&v125[16] = 2048;
                *(_QWORD *)&v125[18] = v50;
                *(_WORD *)&v125[26] = 2114;
                *(_QWORD *)&v125[28] = v55;
                v56 = v51;
                v57 = "%{public}@ <%{public}@:%p> [%d] <%{public}@: %p; \"%{public}@\">";
                v58 = 68;
LABEL_56:
                _os_log_debug_impl(&dword_19A799000, v56, OS_LOG_TYPE_DEBUG, v57, buf, v58);
              }
            }
            else
            {
              v59 = BSServiceXPCLog();
              if (os_log_type_enabled(v59, OS_LOG_TYPE_DEBUG))
              {
                if (v106)
                  v18 = (__CFString *)*((_QWORD *)v106 + 1);
                else
                  v18 = 0;
                v60 = *(_QWORD *)(a1 + 40);
                v61 = (objc_class *)objc_opt_class();
                v62 = -[NSString classForCoder](NSStringFromClass(v61), "classForCoder");
                *(_DWORD *)buf = 138544642;
                *(_QWORD *)&buf[4] = v18;
                *(_WORD *)&buf[12] = 2114;
                *(_QWORD *)&buf[14] = v60;
                *(_WORD *)&buf[22] = 2048;
                v124 = (void (*)(uint64_t, uint64_t))a2;
                *(_WORD *)v125 = 1024;
                *(_DWORD *)&v125[2] = v34;
                *(_WORD *)&v125[6] = 2114;
                *(_QWORD *)&v125[8] = v62;
                *(_WORD *)&v125[16] = 2048;
                *(_QWORD *)&v125[18] = v50;
                v56 = v59;
                v57 = "%{public}@ <%{public}@:%p> [%d] <%{public}@: %p>";
                v58 = 58;
                goto LABEL_56;
              }
            }
            ++v34;
          }
          while (v34 - 1 < objc_msgSend((id)objc_msgSend(*(id *)(a1 + 64), "lastObject"), "argumentIndex"));
        }
      }
    }
    if (!v109 || !*(_QWORD *)(a2 + 56) || !*(_QWORD *)(a2 + 64))
    {
      v43 = 0;
      goto LABEL_33;
    }
    v35 = lock;
    os_unfair_lock_lock(lock);
    v36 = *(_DWORD *)(a2 + 92);
    if (v36)
      break;
    v66 = *(_QWORD *)(a2 + 72);
    if (v66)
    {
      v67 = (id)(*(uint64_t (**)(uint64_t, _QWORD, _QWORD, _QWORD))(v66 + 16))(v66, *(_QWORD *)(a1 + 40), *(_QWORD *)(a2 + 56), *(_QWORD *)(a2 + 64));
    }
    else
    {
      *(_QWORD *)buf = 0;
      *(_QWORD *)&buf[8] = buf;
      *(_QWORD *)&buf[16] = 0x3052000000;
      v124 = __Block_byref_object_copy_;
      *(_QWORD *)v125 = __Block_byref_object_dispose_;
      v72 = (objc_class *)_MergedGlobals_2;
      *(_QWORD *)&v125[8] = _MergedGlobals_2;
      if (!_MergedGlobals_2)
      {
        v118[0] = (id)MEMORY[0x1E0C809B0];
        v118[1] = (id)3221225472;
        v118[2] = __getRBSAssertionClass_block_invoke_0;
        v118[3] = &unk_1E390CFE0;
        v118[4] = buf;
        __getRBSAssertionClass_block_invoke_0((uint64_t)v118);
        v72 = *(objc_class **)(*(_QWORD *)&buf[8] + 40);
      }
      _Block_object_dispose(buf, 8);
      v67 = (id)objc_msgSend([v72 alloc], "initWithExplanation:target:attributes:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a2 + 56), *(_QWORD *)(a2 + 64));
    }
    v73 = v67;
    if (!v67)
    {
      v97 = v106;
      if (v106)
        v97 = (char *)*((_QWORD *)v106 + 1);
      v98 = (void *)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@ <%@:%p> failed to create assertion with attributes=%@"), v97, *(_QWORD *)(a1 + 40), a2, *(_QWORD *)(a2 + 64));
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      {
        v99 = NSStringFromSelector(*(SEL *)(a1 + 96));
        v100 = (objc_class *)objc_opt_class();
        v101 = NSStringFromClass(v100);
        v102 = *(void (**)(uint64_t, uint64_t))(a1 + 48);
        *(_DWORD *)buf = 138544642;
        *(_QWORD *)&buf[4] = v99;
        *(_WORD *)&buf[12] = 2114;
        *(_QWORD *)&buf[14] = v101;
        *(_WORD *)&buf[22] = 2048;
        v124 = v102;
        *(_WORD *)v125 = 2114;
        *(_QWORD *)&v125[2] = CFSTR("BSXPCServiceConnectionProxy.m");
        *(_WORD *)&v125[10] = 1024;
        *(_DWORD *)&v125[12] = 447;
        *(_WORD *)&v125[16] = 2114;
        *(_QWORD *)&v125[18] = v98;
        _os_log_error_impl(&dword_19A799000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);
      }
      objc_msgSend(v98, "UTF8String");
      _bs_set_crash_log_message();
      __break(0);
      JUMPOUT(0x19A7C0F18);
    }
    v118[0] = 0;
    if ((objc_msgSend(v67, "acquireWithError:", v118) & 1) != 0)
      goto LABEL_92;
    v74 = (void *)objc_msgSend(v118[0], "domain");
    *(_QWORD *)buf = 0;
    *(_QWORD *)&buf[8] = buf;
    *(_QWORD *)&buf[16] = 0x2020000000;
    v75 = (_QWORD *)qword_1ECD9C5A0;
    v124 = (void (*)(uint64_t, uint64_t))qword_1ECD9C5A0;
    if (!qword_1ECD9C5A0)
    {
      v76 = RunningBoardServicesLibrary_0();
      v75 = dlsym(v76, "RBSAssertionErrorDomain");
      *(_QWORD *)(*(_QWORD *)&buf[8] + 24) = v75;
      qword_1ECD9C5A0 = (uint64_t)v75;
    }
    _Block_object_dispose(buf, 8);
    if (v75)
    {
      if (objc_msgSend(v74, "isEqualToString:", *v75) && objc_msgSend(v118[0], "code") == 4)
      {
        v117[0] = MEMORY[0x1E0C809B0];
        v117[1] = 3221225472;
        v117[2] = __71__BSXPCServiceConnectionProxy_createImplementationOfProtocol_forClass___block_invoke_99;
        v117[3] = &unk_1E390CF40;
        v103 = *(_QWORD *)(a1 + 40);
        v104 = *(_QWORD *)(a1 + 48);
        v117[4] = v106;
        v117[5] = v103;
        v117[6] = a2;
        v117[7] = v118[0];
        v105 = *(_QWORD *)(a1 + 96);
        v117[8] = v104;
        v117[9] = v105;
        __71__BSXPCServiceConnectionProxy_createImplementationOfProtocol_forClass___block_invoke_99((uint64_t)v117);
      }
      v77 = BSServiceXPCErrorsLog();
      if (os_log_type_enabled(v77, OS_LOG_TYPE_ERROR))
      {
        v85 = v106;
        if (v106)
          v85 = (char *)*((_QWORD *)v106 + 1);
        v86 = *(_QWORD *)(a1 + 40);
        v87 = *(_QWORD *)(a2 + 64);
        *(_DWORD *)buf = 138544386;
        *(_QWORD *)&buf[4] = v85;
        *(_WORD *)&buf[12] = 2114;
        *(_QWORD *)&buf[14] = v86;
        *(_WORD *)&buf[22] = 2048;
        v124 = (void (*)(uint64_t, uint64_t))a2;
        *(_WORD *)v125 = 2114;
        *(id *)&v125[2] = v118[0];
        *(_WORD *)&v125[10] = 2114;
        *(_QWORD *)&v125[12] = v87;
        _os_log_error_impl(&dword_19A799000, v77, OS_LOG_TYPE_ERROR, "%{public}@ <%{public}@:%p> failed to acquire assertion : error=%{public}@ attributes=%{public}@", buf, 0x34u);
      }
LABEL_92:
      *(_QWORD *)(a2 + 80) = v73;
      v36 = *(_DWORD *)(a2 + 92);
      v35 = lock;
      goto LABEL_93;
    }
    a2 = objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    objc_msgSend((id)a2, "handleFailureInFunction:file:lineNumber:description:", objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "NSString *getRBSAssertionErrorDomain(void)"), CFSTR("BSXPCServiceConnectionProxy.m"), 30, CFSTR("%s"), dlerror());
    __break(1u);
LABEL_124:
    ;
  }
  if (v36 == -1)
  {
    v37 = v106;
    if (v106)
      v37 = (char *)*((_QWORD *)v106 + 1);
    v38 = (void *)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@ <%@:%p> message tracking overflow"), v37, *(_QWORD *)(a1 + 40), a2);
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      v39 = NSStringFromSelector(*(SEL *)(a1 + 96));
      v40 = (objc_class *)objc_opt_class();
      v41 = NSStringFromClass(v40);
      v42 = *(void (**)(uint64_t, uint64_t))(a1 + 48);
      *(_DWORD *)buf = 138544642;
      *(_QWORD *)&buf[4] = v39;
      *(_WORD *)&buf[12] = 2114;
      *(_QWORD *)&buf[14] = v41;
      *(_WORD *)&buf[22] = 2048;
      v124 = v42;
      *(_WORD *)v125 = 2114;
      *(_QWORD *)&v125[2] = CFSTR("BSXPCServiceConnectionProxy.m");
      *(_WORD *)&v125[10] = 1024;
      *(_DWORD *)&v125[12] = 439;
      *(_WORD *)&v125[16] = 2114;
      *(_QWORD *)&v125[18] = v38;
      _os_log_error_impl(&dword_19A799000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);
    }
    objc_msgSend(v38, "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x19A7C056CLL);
  }
LABEL_93:
  *(_DWORD *)(a2 + 92) = v36 + 1;
  os_unfair_lock_unlock(v35);
  v43 = 1;
LABEL_33:
  if (*(_BYTE *)(a1 + 105))
  {
    if (v107)
    {
      v115[0] = MEMORY[0x1E0C809B0];
      v115[1] = 3221225472;
      v115[2] = __71__BSXPCServiceConnectionProxy_createImplementationOfProtocol_forClass___block_invoke_102;
      v115[3] = &unk_1E390CF68;
      v116 = v43;
      v44 = *(_QWORD *)(a1 + 32);
      v115[4] = a2;
      v115[5] = v44;
      v115[6] = v112;
      v115[7] = v107;
      v32 = v115;
      if (!v28)
        goto LABEL_43;
    }
    else
    {
      if (!v43)
        goto LABEL_43;
      newValue[0] = MEMORY[0x1E0C809B0];
      newValue[1] = 3221225472;
      newValue[2] = __71__BSXPCServiceConnectionProxy_createImplementationOfProtocol_forClass___block_invoke_2;
      newValue[3] = &unk_1E390CF90;
      newValue[4] = a2;
      v32 = newValue;
      if (!v28)
        goto LABEL_43;
    }
    objc_setProperty_nonatomic_copy(v28, v31, v32, 80);
LABEL_43:
    objc_msgSend(v28, "send", v32);
    v47 = 0;
    v48 = 0;
    v49 = 0;
    goto LABEL_105;
  }
  v45 = *(void **)(a1 + 80);
  if (v45)
  {
    v46 = (_QWORD *)v119[objc_msgSend(v45, "argumentIndex")];
    if (v46)
      *v46 = 0;
  }
  else
  {
    v46 = 0;
  }
  v118[0] = 0;
  v63 = (void *)objc_msgSend(v28, "sendSynchronouslyWithError:", v118);
  if (v43)
    -[BSXPCServiceConnectionProxy _decrementInFlightMessageCounter](a2);
  if (objc_msgSend(*(id *)(a1 + 88), "isVoid"))
  {
    if (v107)
    {
      v64 = *(_QWORD *)(a1 + 32);
      v65 = objc_msgSend(v63, "message");
      *(_QWORD *)buf = MEMORY[0x1E0C809B0];
      *(_QWORD *)&buf[8] = 3221225472;
      *(_QWORD *)&buf[16] = ____BSXPCServiceConnection_IS_INVOKING_A_MESSAGE_REPLY_BLOCK___block_invoke;
      v124 = (void (*)(uint64_t, uint64_t))&unk_1E390D020;
      *(_QWORD *)v125 = v64;
      *(_QWORD *)&v125[8] = v65;
      *(id *)&v125[16] = v118[0];
      *(_QWORD *)&v125[24] = v112;
      *(_QWORD *)&v125[32] = v107;
      BSXPCServiceConnectionExecuteCallOut(v112, 0, (uint64_t)buf);
    }
  }
  else if (v63)
  {
    if (objc_msgSend(*(id *)(a1 + 88), "isBoolean"))
    {
      v47 = 0;
      v49 = objc_msgSend(v63, "decodeBoolForKey:", CFSTR("BSXPCReturnValue"));
      if (!v46)
        goto LABEL_103;
      goto LABEL_76;
    }
    if (objc_msgSend(*(id *)(a1 + 88), "isObject"))
    {
      v68 = (void *)objc_msgSend(*(id *)(a1 + 88), "objectClass");
      v69 = (void *)objc_msgSend(*(id *)(a1 + 88), "objectContainedClasses");
      if (objc_msgSend(v69, "count"))
      {
        if (objc_msgSend(v68, "isSubclassOfClass:", objc_opt_class()))
          v70 = (void *)objc_msgSend(v63, "decodeDictionaryOfClass:forKey:", objc_msgSend(v69, "objectAtIndex:", 1), CFSTR("BSXPCReturnValue"));
        else
          v70 = (void *)objc_msgSend(v63, "decodeCollectionOfClass:containingClass:forKey:", v68, objc_msgSend(v69, "firstObject"), CFSTR("BSXPCReturnValue"));
      }
      else
      {
        v70 = (void *)objc_msgSend(v63, "decodeObjectOfClass:forKey:", v68, CFSTR("BSXPCReturnValue"));
      }
      v49 = (unint64_t)v70;
      v82 = v70;
      v47 = 1;
      if (!v46)
        goto LABEL_103;
      goto LABEL_76;
    }
  }
  v47 = 0;
  v49 = 0;
  if (!v46)
    goto LABEL_103;
LABEL_76:
  if (!v118[0])
  {
    if (v63)
    {
      v71 = (id)objc_msgSend(v63, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("BSXPCReturnError"));
      goto LABEL_80;
    }
LABEL_103:
    v48 = 0;
    goto LABEL_104;
  }
  v71 = v118[0];
LABEL_80:
  v48 = v71;
  *v46 = v71;
LABEL_104:
  objc_msgSend(v63, "invalidate");
LABEL_105:
  objc_msgSend(v28, "invalidate");
  if (v108)
  {
    os_unfair_lock_lock(lock);

    *(_QWORD *)(a2 + 16) = 0;
    os_unfair_lock_unlock(lock);
  }
  objc_msgSend(v110, "drain");
  v83 = v48;
  if (v47)
    return (id)v49;
  return (id)v49;
}

void __71__BSXPCServiceConnectionProxy_createImplementationOfProtocol_forClass___block_invoke_88(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  NSString *v5;
  objc_class *v6;
  NSString *v7;
  uint64_t v8;
  uint8_t buf[4];
  NSString *v10;
  __int16 v11;
  NSString *v12;
  __int16 v13;
  uint64_t v14;
  __int16 v15;
  const __CFString *v16;
  __int16 v17;
  int v18;
  __int16 v19;
  void *v20;

  v2 = *(_QWORD *)(a1 + 32);
  if (v2)
    v3 = *(_QWORD *)(v2 + 8);
  else
    v3 = 0;
  v4 = (void *)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@ <%@:%p> Encoding of %@ in <%@> failed: %@ -> %@"), v3, *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), objc_msgSend(*(id *)(a1 + 64), "name"), objc_msgSend(*(id *)(a1 + 72), "description"), objc_msgSend(*(id *)(a1 + 72), "callStackSymbols"));
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v5 = NSStringFromSelector(*(SEL *)(a1 + 88));
    v6 = (objc_class *)objc_opt_class();
    v7 = NSStringFromClass(v6);
    v8 = *(_QWORD *)(a1 + 80);
    *(_DWORD *)buf = 138544642;
    v10 = v5;
    v11 = 2114;
    v12 = v7;
    v13 = 2048;
    v14 = v8;
    v15 = 2114;
    v16 = CFSTR("BSXPCServiceConnectionProxy.m");
    v17 = 1024;
    v18 = 417;
    v19 = 2114;
    v20 = v4;
    _os_log_error_impl(&dword_19A799000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);
  }
  objc_msgSend(v4, "UTF8String");
  _bs_set_crash_log_message();
  __break(0);
  JUMPOUT(0x19A7C12F8);
}

void __71__BSXPCServiceConnectionProxy_createImplementationOfProtocol_forClass___block_invoke_99(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  NSString *v4;
  objc_class *v5;
  NSString *v6;
  uint64_t v7;
  uint8_t buf[4];
  NSString *v9;
  __int16 v10;
  NSString *v11;
  __int16 v12;
  uint64_t v13;
  __int16 v14;
  const __CFString *v15;
  __int16 v16;
  int v17;
  __int16 v18;
  void *v19;

  v2 = *(_QWORD *)(a1 + 32);
  if (v2)
    v2 = *(_QWORD *)(v2 + 8);
  v3 = (void *)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@ <%@:%p> failed to acquire assertion : error=%@  attributes=%@"), v2, *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), *(_QWORD *)(*(_QWORD *)(a1 + 48) + 64));
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v4 = NSStringFromSelector(*(SEL *)(a1 + 72));
    v5 = (objc_class *)objc_opt_class();
    v6 = NSStringFromClass(v5);
    v7 = *(_QWORD *)(a1 + 64);
    *(_DWORD *)buf = 138544642;
    v9 = v4;
    v10 = 2114;
    v11 = v6;
    v12 = 2048;
    v13 = v7;
    v14 = 2114;
    v15 = CFSTR("BSXPCServiceConnectionProxy.m");
    v16 = 1024;
    v17 = 453;
    v18 = 2114;
    v19 = v3;
    _os_log_error_impl(&dword_19A799000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);
  }
  objc_msgSend(v3, "UTF8String");
  _bs_set_crash_log_message();
  __break(0);
}

void __71__BSXPCServiceConnectionProxy_createImplementationOfProtocol_forClass___block_invoke_102(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  os_unfair_lock_s *v9;
  _QWORD v10[9];

  if (*(_BYTE *)(a1 + 64))
    -[BSXPCServiceConnectionProxy _decrementInFlightMessageCounter](*(_QWORD *)(a1 + 32));
  v6 = *(_QWORD *)(a1 + 56);
  v7 = *(_QWORD *)(a1 + 40);
  v8 = objc_msgSend(a2, "message");
  v9 = *(os_unfair_lock_s **)(a1 + 48);
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = ____BSXPCServiceConnection_IS_INVOKING_A_MESSAGE_REPLY_BLOCK___block_invoke;
  v10[3] = &unk_1E390D020;
  v10[7] = v9;
  v10[8] = v6;
  v10[4] = v7;
  v10[5] = v8;
  v10[6] = a3;
  BSXPCServiceConnectionExecuteCallOut(v9, 0, (uint64_t)v10);
}

void __71__BSXPCServiceConnectionProxy_createImplementationOfProtocol_forClass___block_invoke_2(uint64_t a1)
{
  -[BSXPCServiceConnectionProxy _decrementInFlightMessageCounter](*(_QWORD *)(a1 + 32));
}

@end
