@implementation BSObjCProtocol

+ (id)protocolForProtocol:(id)a3
{
  objc_msgSend(a1, "protocolForProtocol:interpreter:", a3, 0);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)protocolForProtocol:(id)a3 interpreter:(id)a4
{
  Protocol *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  uint64_t v13;
  char v14;
  uint64_t v15;
  uint64_t i;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  id v22;
  objc_class *v23;
  void *v24;
  void *v25;
  id v26;
  objc_class *v27;
  void *v28;
  id v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  void *v34;
  void *v35;
  const __CFArray **v36;
  const __CFArray *v37;
  const __CFArray *v38;
  BOOL v39;
  const __CFArray *v40;
  const __CFArray *v41;
  BOOL v42;
  uint64_t v43;
  const __CFArray *v44;
  unint64_t v45;
  void *v46;
  void *v47;
  BOOL v48;
  NSObject *v49;
  _BOOL4 v50;
  uint64_t v51;
  BSObjCProtocol *v52;
  Protocol *v53;
  void *v54;
  Protocol **v55;
  unint64_t v56;
  Protocol *v57;
  void *v58;
  void *v59;
  Protocol *v60;
  void *v61;
  void *v62;
  void *v63;
  id *v64;
  void *v66;
  id v67;
  objc_class *v68;
  void *v69;
  Protocol *v70;
  char v71;
  Protocol *v72;
  void *v73;
  void (**v74)(id, _QWORD);
  id obj;
  id obja;
  void *v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  __int128 v83;
  __int128 v84;
  __int128 v85;
  _BYTE v86[128];
  uint8_t v87[128];
  uint8_t buf[4];
  id v89;
  __int16 v90;
  uint64_t v91;
  __int16 v92;
  id v93;
  __int16 v94;
  const __CFString *v95;
  __int16 v96;
  int v97;
  __int16 v98;
  void *v99;
  uint64_t v100;

  v100 = *MEMORY[0x1E0C80C00];
  v7 = (Protocol *)a3;
  v74 = (void (**)(id, _QWORD))a4;
  v70 = v7;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("protocol != ((void *)0)"), 0);
    v66 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(a2);
      v67 = (id)objc_claimAutoreleasedReturnValue();
      v68 = (objc_class *)objc_opt_class();
      NSStringFromClass(v68);
      v69 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544642;
      v89 = v67;
      v90 = 2114;
      v91 = (uint64_t)v69;
      v92 = 2048;
      v93 = a1;
      v94 = 2114;
      v95 = CFSTR("BSObjCRuntime.m");
      v96 = 1024;
      v97 = 1146;
      v98 = 2114;
      v99 = v66;
      _os_log_error_impl(&dword_18A184000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);

    }
    qword_1EDF5BAE8 = objc_msgSend(objc_retainAutorelease(v66), "UTF8String");
    __break(0);
    JUMPOUT(0x18A194840);
  }
  NSStringFromProtocol(v7);
  v73 = (void *)objc_claimAutoreleasedReturnValue();
  v72 = v7;
  objc_opt_self();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  +[BSObjCProtocol _gatherMethodMetadataForProtocol:required:]((uint64_t)BSObjCProtocol, v72, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "addObjectsFromArray:", v9);

  +[BSObjCProtocol _gatherMethodMetadataForProtocol:required:]((uint64_t)BSObjCProtocol, v72, 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "addObjectsFromArray:", v10);

  if (v74)
  {
    v11 = (void *)objc_msgSend(v8, "mutableCopy");
    v84 = 0u;
    v85 = 0u;
    v82 = 0u;
    v83 = 0u;
    v12 = v8;
    obj = v12;
    v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v82, v87, 16);
    v71 = v13 != 0;
    if (v13)
    {
      v14 = 0;
      v15 = *(_QWORD *)v83;
      do
      {
        for (i = 0; i != v13; ++i)
        {
          if (*(_QWORD *)v83 != v15)
            objc_enumerationMutation(obj);
          v17 = *(void **)(*((_QWORD *)&v82 + 1) + 8 * i);
          ((void (**)(id, void *))v74)[2](v74, v17);
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          v19 = v18;
          if (!v18)
          {
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("newMethod != nil"), v70);
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
            {
              NSStringFromSelector(a2);
              v22 = (id)objc_claimAutoreleasedReturnValue();
              v23 = (objc_class *)objc_opt_class();
              NSStringFromClass(v23);
              v24 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138544642;
              v89 = v22;
              v90 = 2114;
              v91 = (uint64_t)v24;
              v92 = 2048;
              v93 = a1;
              v94 = 2114;
              v95 = CFSTR("BSObjCRuntime.m");
              v96 = 1024;
              v97 = 1156;
              v98 = 2114;
              v99 = v21;
              _os_log_error_impl(&dword_18A184000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);

            }
            qword_1EDF5BAE8 = objc_msgSend(objc_retainAutorelease(v21), "UTF8String");
            __break(0);
            JUMPOUT(0x18A19413CLL);
          }
          v20 = objc_msgSend(v18, "selector");
          if (v20 != objc_msgSend(v19, "selector"))
          {
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("[newMethod selector] == [newMethod selector]"), v70);
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
            {
              NSStringFromSelector(a2);
              v26 = (id)objc_claimAutoreleasedReturnValue();
              v27 = (objc_class *)objc_opt_class();
              NSStringFromClass(v27);
              v28 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138544642;
              v89 = v26;
              v90 = 2114;
              v91 = (uint64_t)v28;
              v92 = 2048;
              v93 = a1;
              v94 = 2114;
              v95 = CFSTR("BSObjCRuntime.m");
              v96 = 1024;
              v97 = 1157;
              v98 = 2114;
              v99 = v25;
              _os_log_error_impl(&dword_18A184000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);

            }
            qword_1EDF5BAE8 = objc_msgSend(objc_retainAutorelease(v25), "UTF8String");
            __break(0);
            JUMPOUT(0x18A194244);
          }
          if (v19 != v17)
          {
            objc_msgSend(v11, "replaceObjectAtIndex:withObject:", objc_msgSend(obj, "indexOfObjectIdenticalTo:", v17), v19);
            v14 = 1;
          }

        }
        v13 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v82, v87, 16);
      }
      while (v13);

      if ((v14 & 1) == 0)
      {
        v71 = 0;
LABEL_25:

        v8 = obj;
        goto LABEL_26;
      }
      v12 = v11;
    }

    obj = v12;
    goto LABEL_25;
  }
  v71 = 0;
LABEL_26:
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v77 = (void *)objc_claimAutoreleasedReturnValue();
  v80 = 0u;
  v81 = 0u;
  v78 = 0u;
  v79 = 0u;
  v29 = v8;
  obja = v29;
  v30 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v78, v86, 16);
  if (!v30)
    goto LABEL_66;
  v31 = *(_QWORD *)v79;
  do
  {
    v32 = 0;
    do
    {
      if (*(_QWORD *)v79 != v31)
        objc_enumerationMutation(obja);
      v33 = *(_QWORD *)(*((_QWORD *)&v78 + 1) + 8 * v32);
      objc_msgSend(v77, "member:", v33);
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      v35 = v34;
      if (!v34)
      {
        objc_msgSend(v77, "addObject:", v33);
        goto LABEL_60;
      }
      v36 = v34;
      if (!v33
        || !objc_msgSend((id)v33, "isEqual:", v36)
        || (v37 = *(const __CFArray **)(v33 + 24), v38 = v36[3], v37 != v38)
        && (v37 ? (v39 = v38 == 0) : (v39 = 1),
            v39 || (-[__CFArray isEqualToString:](v37, "isEqualToString:") & 1) == 0)
        || (v40 = *(const __CFArray **)(v33 + 16), v41 = v36[2], v40 != v41)
        && (v40 ? (v42 = v41 == 0) : (v42 = 1),
            v42 || !-[__CFArray isEqualToString:](v40, "isEqualToString:")))
      {
LABEL_56:

        goto LABEL_57;
      }
      v43 = *(_QWORD *)(v33 + 48);
      v44 = v36[6];
      if (v43)
      {
        if (!v44 || !-[BSObjCValue _isIndistinguishableFromValue:](v43, v44))
          goto LABEL_56;
      }
      else if (v44)
      {
        goto LABEL_56;
      }
      if (!BSEqualArrays(*(CFArrayRef *)(v33 + 40), v36[5]))
        goto LABEL_56;
      v45 = 0;
      while (v45 < objc_msgSend(*(id *)(v33 + 40), "count"))
      {
        objc_msgSend(*(id *)(v33 + 40), "objectAtIndex:", v45);
        v46 = (void *)objc_claimAutoreleasedReturnValue();
        -[__CFArray objectAtIndex:](v36[5], "objectAtIndex:", v45);
        v47 = (void *)objc_claimAutoreleasedReturnValue();
        v48 = -[BSObjCValue _isIndistinguishableFromValue:]((uint64_t)v46, v47);

        ++v45;
        if (!v48)
          goto LABEL_56;
      }
      v50 = *(_QWORD *)(v33 + 8) == (_QWORD)v36[1];

      if (v50)
      {
        BSLogCommon();
        v49 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v49, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138543874;
          v89 = v73;
          v90 = 2114;
          v91 = v33;
          v92 = 2114;
          v93 = v36;
          _os_log_debug_impl(&dword_18A184000, v49, OS_LOG_TYPE_DEBUG, "BSObjCProtocol '%{public}@' : dropping duplicated method : method=%{public}@ existing=%{public}@", buf, 0x20u);
        }
        goto LABEL_59;
      }
LABEL_57:
      BSLogCommon();
      v49 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v49, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 138543874;
        v89 = v73;
        v90 = 2114;
        v91 = v33;
        v92 = 2114;
        v93 = v36;
        _os_log_fault_impl(&dword_18A184000, v49, OS_LOG_TYPE_FAULT, "BSObjCProtocol '%{public}@' : dropping distinguishable method due to selector collision : method=%{public}@ existing=%{public}@", buf, 0x20u);
      }
LABEL_59:

LABEL_60:
      ++v32;
    }
    while (v32 != v30);
    v29 = obja;
    v51 = objc_msgSend(obja, "countByEnumeratingWithState:objects:count:", &v78, v86, 16);
    v30 = v51;
  }
  while (v51);
LABEL_66:

  v52 = [BSObjCProtocol alloc];
  v53 = v72;
  objc_opt_self();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  *(_DWORD *)buf = 0;
  v55 = protocol_copyProtocolList(v53, (unsigned int *)buf);
  if (v55)
  {
    if (*(_DWORD *)buf)
    {
      v56 = 0;
      do
      {
        if (qword_1ECD39898 != -1)
          dispatch_once(&qword_1ECD39898, &__block_literal_global_445);
        v57 = v55[v56];
        if (v57 != (Protocol *)qword_1ECD398A0)
        {
          +[BSObjCProtocol protocolForProtocol:](BSObjCProtocol, "protocolForProtocol:", v57);
          v58 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v54, "addObject:", v58);

        }
        ++v56;
      }
      while (v56 < *(unsigned int *)buf);
    }
    free(v55);
  }

  objc_msgSend(v77, "allObjects");
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  v60 = v53;
  objc_opt_self();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  +[BSObjCProtocol _gatherPropertyMetadataForProtocol:required:]((uint64_t)BSObjCProtocol, v60, 1);
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v61, "addObjectsFromArray:", v62);

  +[BSObjCProtocol _gatherPropertyMetadataForProtocol:required:]((uint64_t)BSObjCProtocol, v60, 0);
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v61, "addObjectsFromArray:", v63);

  v64 = -[BSObjCProtocol _initWithName:protocol:inherited:methods:properties:virtual:]((id *)&v52->super.isa, v73, v60, v54, v59, v61, v71);
  return v64;
}

+ (id)_gatherPropertyMetadataForProtocol:(_BOOL4)a3 required:
{
  unint64_t v4;
  const __CFString *v5;
  void *v6;
  objc_property *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  id v13;
  uint64_t v14;
  void *v15;
  NSObject *v16;
  _BYTE *v17;
  const char *v18;
  NSObject *v19;
  void *v20;
  uint64_t v22;
  void *v23;
  id v24;
  objc_class *v25;
  __CFString *v26;
  const __CFString *v27;
  BOOL isRequiredMethod;
  id v29;
  Protocol *proto;
  objc_property_t *v31;
  unsigned int outCount;
  uint8_t buf[4];
  id v34;
  __int16 v35;
  const __CFString *v36;
  __int16 v37;
  uint64_t v38;
  __int16 v39;
  const __CFString *v40;
  __int16 v41;
  int v42;
  __int16 v43;
  void *v44;
  uint64_t v45;

  v45 = *MEMORY[0x1E0C80C00];
  proto = a2;
  objc_opt_self();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v29 = (id)objc_claimAutoreleasedReturnValue();
  outCount = 0;
  v31 = protocol_copyPropertyList2(proto, &outCount, a3, 1);
  if (v31)
  {
    if (outCount)
    {
      v4 = 0;
      v5 = CFSTR("optional --> required");
      isRequiredMethod = !a3;
      if (a3)
        v5 = CFSTR("required --> optional");
      v27 = v5;
      do
      {
        v6 = (void *)MEMORY[0x18D769AE0]();
        v7 = v31[v4];
        v8 = objc_opt_self();
        if (!v7)
        {
          v22 = v8;
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("aProperty != ((void *)0)"));
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
          {
            NSStringFromSelector(sel_propertyWithProperty_required_);
            v24 = (id)objc_claimAutoreleasedReturnValue();
            v25 = (objc_class *)objc_opt_class();
            NSStringFromClass(v25);
            v26 = (__CFString *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138544642;
            v34 = v24;
            v35 = 2114;
            v36 = v26;
            v37 = 2048;
            v38 = v22;
            v39 = 2114;
            v40 = CFSTR("BSObjCRuntime.m");
            v41 = 1024;
            v42 = 581;
            v43 = 2114;
            v44 = v23;
            _os_log_error_impl(&dword_18A184000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);

          }
          qword_1EDF5BAE8 = objc_msgSend(objc_retainAutorelease(v23), "UTF8String");
          __break(0);
          JUMPOUT(0x18A194F18);
        }
        objc_msgSend(MEMORY[0x1E0CB3940], "bs_stringWithUTF8String:", property_getName(v7));
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0C99E08], "bsobjc_attributesForProperty:", v7);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = v10;
        if (!a3)
          objc_msgSend(v10, "setObject:forKey:", &stru_1E1EC08D0, CFSTR("?"));
        v12 = v9;
        v13 = v11;
        v14 = objc_opt_self();
        objc_msgSend(v13, "objectForKey:", CFSTR("T"));
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v15, "length"))
        {
          +[BSObjCValue _valueWithEncoding:]((uint64_t)BSObjCValue, v15);
          v16 = objc_claimAutoreleasedReturnValue();
          +[BSObjCProperty propertyWithName:value:attributes:](v14, v12, v16, v13);
          v17 = (_BYTE *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          BSLogCommon();
          v16 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138543362;
            v34 = v12;
            _os_log_impl(&dword_18A184000, v16, OS_LOG_TYPE_DEFAULT, "Attributes for property \"%{public}@\" contained no type information.", buf, 0xCu);
          }
          v17 = 0;
        }

        if (v17)
        {
          v18 = -[BSObjCProperty _getSelector]((uint64_t)v17);
          if (!(unint64_t)protocol_getMethodDescription(proto, v18, a3, 1).name
            && (unint64_t)protocol_getMethodDescription(proto, v18, isRequiredMethod, 1).name)
          {
            v17[32] = isRequiredMethod;
            BSLogCommon();
            v19 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
            {
              objc_msgSend(v17, "name");
              v20 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138412546;
              v34 = v20;
              v35 = 2112;
              v36 = v27;
              _os_log_debug_impl(&dword_18A184000, v19, OS_LOG_TYPE_DEBUG, "[rdar://100354962] Fixing incorrect property returned by protocol_copyPropertyList2() for \"%@\": %@", buf, 0x16u);

            }
          }
          objc_msgSend(v29, "addObject:", v17);
        }

        objc_autoreleasePoolPop(v6);
        ++v4;
      }
      while (v4 < outCount);
    }
    free(v31);
  }

  return v29;
}

+ (id)_gatherMethodMetadataForProtocol:(_BOOL4)a3 required:
{
  Protocol *v4;
  objc_method_description *v5;
  unint64_t v6;
  const char **p_name;
  void *v8;
  const char *v9;
  uint64_t MethodTypeEncoding;
  uint64_t v11;
  void *v12;
  objc_method_description *v14;
  id v15;
  unsigned int outCount;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v4 = a2;
  objc_opt_self();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v15 = (id)objc_claimAutoreleasedReturnValue();
  outCount = 0;
  v5 = protocol_copyMethodDescriptionList(v4, a3, 1, &outCount);
  if (v5)
  {
    v14 = v5;
    if (outCount)
    {
      v6 = 0;
      p_name = &v5->name;
      do
      {
        v8 = (void *)MEMORY[0x18D769AE0]();
        v9 = *p_name;
        MethodTypeEncoding = _protocol_getMethodTypeEncoding();
        if (!MethodTypeEncoding)
          MethodTypeEncoding = (uint64_t)protocol_getMethodDescription(v4, v9, a3, 1).types;
        +[BSObjCMethod methodWithSelector:typeEncoding:]((uint64_t)BSObjCMethod, v9, MethodTypeEncoding);
        v11 = objc_claimAutoreleasedReturnValue();
        v12 = (void *)v11;
        if (v11)
        {
          *(_QWORD *)(v11 + 8) = a3;
          objc_msgSend(v15, "addObject:", v11);
        }

        objc_autoreleasePoolPop(v8);
        ++v6;
        p_name += 2;
      }
      while (v6 < outCount);
    }
    free(v14);
  }

  return v15;
}

- (id)_initWithName:(void *)a3 protocol:(void *)a4 inherited:(void *)a5 methods:(void *)a6 properties:(char)a7 virtual:
{
  id v13;
  uint64_t v14;
  id v15;
  uint64_t v16;
  id v17;
  uint64_t v18;
  id v19;
  uint64_t v20;
  id v21;
  id v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  void *v29;
  _BOOL4 v30;
  uint64_t v31;
  void *v32;
  void *v33;
  const char *v34;
  uint64_t v35;
  const char *v36;
  uint64_t v37;
  void *v38;
  uint64_t v39;
  void *v40;
  id v42;
  id v43;
  id v44;
  id v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  objc_super v50;
  _BYTE v51[128];
  uint64_t v52;

  v52 = *MEMORY[0x1E0C80C00];
  v43 = a2;
  v42 = a3;
  v44 = a4;
  v45 = a5;
  v13 = a6;
  if (a1)
  {
    v50.receiver = a1;
    v50.super_class = (Class)BSObjCProtocol;
    a1 = (id *)objc_msgSendSuper2(&v50, sel_init, v42);
    if (a1)
    {
      v14 = objc_msgSend(v43, "copy");
      v15 = a1[3];
      a1[3] = (id)v14;

      objc_storeStrong(a1 + 4, a3);
      v16 = objc_msgSend(v44, "copy");
      v17 = a1[1];
      a1[1] = (id)v16;

      v18 = objc_msgSend(v45, "copy");
      v19 = a1[5];
      a1[5] = (id)v18;

      v20 = objc_msgSend(v13, "copy");
      v21 = a1[6];
      a1[6] = (id)v20;

      *((_BYTE *)a1 + 16) = a7;
      v48 = 0u;
      v49 = 0u;
      v46 = 0u;
      v47 = 0u;
      v22 = a1[6];
      v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v46, v51, 16);
      if (!v23)
        goto LABEL_21;
      v24 = *(_QWORD *)v47;
      while (1)
      {
        v25 = 0;
        do
        {
          if (*(_QWORD *)v47 != v24)
            objc_enumerationMutation(v22);
          v26 = *(_QWORD *)(*((_QWORD *)&v46 + 1) + 8 * v25);
          if (!*(_QWORD *)(v26 + 16))
          {
            objc_msgSend(a1, "methodForSelector:", -[BSObjCProperty _getSelector](*(_QWORD *)(*((_QWORD *)&v46 + 1) + 8 * v25)));
            v27 = objc_claimAutoreleasedReturnValue();
            v28 = *(void **)(v26 + 16);
            *(_QWORD *)(v26 + 16) = v27;

            if (!*(_QWORD *)(v26 + 16))
            {
              v33 = *(void **)(v26 + 8);
              v34 = -[BSObjCProperty _getSelector](v26);
              +[BSObjCMethod _propertyGetterForValue:withSelector:]((uint64_t)BSObjCMethod, v33, v34);
              v35 = objc_claimAutoreleasedReturnValue();
              v32 = *(void **)(v26 + 16);
              *(_QWORD *)(v26 + 16) = v35;
              goto LABEL_14;
            }
            if (objc_msgSend(*(id *)(v26 + 8), "isBlock"))
            {
              objc_msgSend(*(id *)(v26 + 8), "blockReturnValue");
              v29 = (void *)objc_claimAutoreleasedReturnValue();
              v30 = v29 == 0;

              if (v30)
              {
                objc_msgSend(*(id *)(v26 + 16), "returnValue");
                v31 = objc_claimAutoreleasedReturnValue();
                v32 = *(void **)(v26 + 8);
                *(_QWORD *)(v26 + 8) = v31;
LABEL_14:

              }
            }
          }
          v36 = -[BSObjCProperty _setSelector]((id *)v26);
          if (v36)
          {
            if (!*(_QWORD *)(v26 + 24))
            {
              objc_msgSend(a1, "methodForSelector:", v36);
              v37 = objc_claimAutoreleasedReturnValue();
              v38 = *(void **)(v26 + 24);
              *(_QWORD *)(v26 + 24) = v37;

              if (!*(_QWORD *)(v26 + 24))
              {
                +[BSObjCMethod _propertySetterForValue:withSelector:]((uint64_t)BSObjCMethod, *(void **)(v26 + 8), v36);
                v39 = objc_claimAutoreleasedReturnValue();
                v40 = *(void **)(v26 + 24);
                *(_QWORD *)(v26 + 24) = v39;

              }
            }
          }
          ++v25;
        }
        while (v23 != v25);
        v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v46, v51, 16);
        if (!v23)
        {
LABEL_21:

          break;
        }
      }
    }
  }

  return a1;
}

- (NSString)name
{
  return self->_name;
}

- (BOOL)isEqual:(id)a3
{
  BSObjCProtocol *v4;
  uint64_t v5;
  char v6;
  NSString *name;
  NSString *v8;
  NSArray *inheritedProtocols;
  NSArray *v10;
  NSArray *methods;
  NSArray *v12;

  v4 = (BSObjCProtocol *)a3;
  if (self == v4)
    goto LABEL_18;
  v5 = objc_opt_class();
  if (v5 != objc_opt_class() || self->_virtual || v4->_virtual)
    goto LABEL_5;
  name = self->_name;
  v8 = v4->_name;
  if (name != v8)
  {
    v6 = 0;
    if (!name || !v8)
      goto LABEL_19;
    if (!-[NSString isEqualToString:](name, "isEqualToString:"))
      goto LABEL_5;
  }
  inheritedProtocols = self->_inheritedProtocols;
  v10 = v4->_inheritedProtocols;
  if (inheritedProtocols != v10)
  {
    v6 = 0;
    if (!inheritedProtocols || !v10)
      goto LABEL_19;
    if (!-[NSArray isEqual:](inheritedProtocols, "isEqual:"))
    {
LABEL_5:
      v6 = 0;
      goto LABEL_19;
    }
  }
  methods = self->_methods;
  v12 = v4->_methods;
  if (methods == v12)
  {
LABEL_18:
    v6 = 1;
    goto LABEL_19;
  }
  v6 = 0;
  if (methods && v12)
    v6 = -[NSArray isEqual:](methods, "isEqual:");
LABEL_19:

  return v6;
}

- (id)methodForSelector:(SEL)a3
{
  void *v4;
  NSArray *v5;
  id v6;
  uint64_t v7;
  void *i;
  void *v9;
  void *v10;
  char v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  NSStringFromSelector(a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = 0u;
  v16 = 0u;
  v13 = 0u;
  v14 = 0u;
  v5 = self->_methods;
  v6 = (id)-[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v14;
    while (2)
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(_QWORD *)v14 != v7)
          objc_enumerationMutation(v5);
        v9 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * (_QWORD)i);
        objc_msgSend(v9, "name", (_QWORD)v13);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = objc_msgSend(v10, "isEqualToString:", v4);

        if ((v11 & 1) != 0)
        {
          v6 = v9;
          goto LABEL_11;
        }
      }
      v6 = (id)-[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      if (v6)
        continue;
      break;
    }
  }
LABEL_11:

  return v6;
}

- (id)flattenWithIgnoredInheritedProtocols:(id)a3
{
  id v4;
  BSObjCProtocol *v5;
  NSString *name;
  Protocol *protocol;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  BSObjCProtocol *v12;

  v4 = a3;
  if (-[NSArray count](self->_inheritedProtocols, "count"))
  {
    v5 = [BSObjCProtocol alloc];
    name = self->_name;
    protocol = self->_protocol;
    -[BSObjCProtocol _unionMethodsIgnoringObjCProtocols:](self, v4);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "allObjects");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[BSObjCProtocol _unionPropertiesIgnoringObjCProtocols:](self, v4);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "allObjects");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = (BSObjCProtocol *)-[BSObjCProtocol _initWithName:protocol:inherited:methods:properties:virtual:]((id *)&v5->super.isa, name, protocol, 0, v9, v11, self->_virtual);

  }
  else
  {
    v12 = self;
  }

  return v12;
}

- (id)_unionPropertiesIgnoringObjCProtocols:(void *)a1
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  char v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (a1)
  {
    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = 0u;
    v20 = 0u;
    v17 = 0u;
    v18 = 0u;
    objc_msgSend(a1, "inheritedProtocols", 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    if (v6)
    {
      v7 = *(_QWORD *)v18;
      do
      {
        for (i = 0; i != v6; ++i)
        {
          if (*(_QWORD *)v18 != v7)
            objc_enumerationMutation(v5);
          v9 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * i);
          objc_msgSend(v9, "protocol");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          v11 = objc_msgSend(v3, "containsObject:", v10);

          if ((v11 & 1) == 0)
          {
            -[BSObjCProtocol _unionPropertiesIgnoringObjCProtocols:](v9, v3);
            v12 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v4, "unionSet:", v12);

          }
        }
        v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
      }
      while (v6);
    }

    v13 = (void *)MEMORY[0x1E0C99E60];
    objc_msgSend(a1, "properties");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setWithArray:", v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "minusSet:", v15);
    objc_msgSend(v4, "unionSet:", v15);

  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (NSArray)properties
{
  return self->_properties;
}

- (id)_unionMethodsIgnoringObjCProtocols:(void *)a1
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  char v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (a1)
  {
    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = 0u;
    v20 = 0u;
    v17 = 0u;
    v18 = 0u;
    objc_msgSend(a1, "inheritedProtocols", 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    if (v6)
    {
      v7 = *(_QWORD *)v18;
      do
      {
        for (i = 0; i != v6; ++i)
        {
          if (*(_QWORD *)v18 != v7)
            objc_enumerationMutation(v5);
          v9 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * i);
          objc_msgSend(v9, "protocol");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          v11 = objc_msgSend(v3, "containsObject:", v10);

          if ((v11 & 1) == 0)
          {
            -[BSObjCProtocol _unionMethodsIgnoringObjCProtocols:](v9, v3);
            v12 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v4, "unionSet:", v12);

          }
        }
        v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
      }
      while (v6);
    }

    v13 = (void *)MEMORY[0x1E0C99E60];
    objc_msgSend(a1, "methods");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setWithArray:", v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "minusSet:", v15);
    objc_msgSend(v4, "unionSet:", v15);

  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (NSArray)methods
{
  return self->_methods;
}

- (NSArray)inheritedProtocols
{
  if (self->_inheritedProtocols)
    return self->_inheritedProtocols;
  else
    return (NSArray *)MEMORY[0x1E0C9AA60];
}

- (Protocol)protocol
{
  return self->_protocol;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_properties, 0);
  objc_storeStrong((id *)&self->_methods, 0);
  objc_storeStrong((id *)&self->_protocol, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_inheritedProtocols, 0);
}

void __53__BSObjCProtocol__gatherAdoptedProtocolsForProtocol___block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_getProtocol("NSObject");
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)qword_1ECD398A0;
  qword_1ECD398A0 = v0;

}

- (BSObjCProtocol)init
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("BSObjCRuntime.m"), 1100, CFSTR("init is not allowed on BSObjCProtocol"));

  return 0;
}

- (id)propertyWithName:(id)a3
{
  id v4;
  NSArray *v5;
  id v6;
  uint64_t v7;
  void *i;
  void *v9;
  void *v10;
  char v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v5 = self->_properties;
  v6 = (id)-[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v14;
    while (2)
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(_QWORD *)v14 != v7)
          objc_enumerationMutation(v5);
        v9 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * (_QWORD)i);
        objc_msgSend(v9, "name", (_QWORD)v13);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = objc_msgSend(v10, "isEqualToString:", v4);

        if ((v11 & 1) != 0)
        {
          v6 = v9;
          goto LABEL_11;
        }
      }
      v6 = (id)-[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      if (v6)
        continue;
      break;
    }
  }
LABEL_11:

  return v6;
}

- (id)inheritedProtocolForProtocol:(id)a3
{
  void *v4;
  NSArray *v5;
  id v6;
  uint64_t v7;
  void *i;
  void *v9;
  void *v10;
  char v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  NSStringFromProtocol((Protocol *)a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = 0u;
  v16 = 0u;
  v13 = 0u;
  v14 = 0u;
  v5 = self->_inheritedProtocols;
  v6 = (id)-[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v14;
    while (2)
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(_QWORD *)v14 != v7)
          objc_enumerationMutation(v5);
        v9 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * (_QWORD)i);
        objc_msgSend(v9, "name", (_QWORD)v13);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = objc_msgSend(v10, "isEqualToString:", v4);

        if ((v11 & 1) != 0)
        {
          v6 = v9;
          goto LABEL_11;
        }
      }
      v6 = (id)-[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      if (v6)
        continue;
      break;
    }
  }
LABEL_11:

  return v6;
}

- (unint64_t)hash
{
  NSUInteger v3;
  NSArray *inheritedProtocols;
  uint64_t v5;

  v3 = -[NSString hash](self->_name, "hash");
  inheritedProtocols = self->_inheritedProtocols;
  if (inheritedProtocols)
    v5 = -[NSArray count](inheritedProtocols, "count") + 117991;
  else
    v5 = 108109;
  return v5 ^ v3;
}

- (NSString)description
{
  return (NSString *)-[BSObjCProtocol descriptionWithMultilinePrefix:](self, "descriptionWithMultilinePrefix:", 0);
}

- (id)succinctDescription
{
  void *v2;
  void *v3;

  -[BSObjCProtocol succinctDescriptionBuilder](self, "succinctDescriptionBuilder");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "build");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)succinctDescriptionBuilder
{
  void *v3;
  id v4;
  id v5;

  +[BSDescriptionBuilder builderWithObject:](BSDescriptionBuilder, "builderWithObject:", self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (id)objc_msgSend(v3, "appendObject:withName:", self->_name, CFSTR("name"));
  if (self->_virtual)
    v5 = (id)objc_msgSend(v3, "appendObject:withName:", CFSTR("VIRTUAL"), 0);
  return v3;
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  void *v3;
  void *v4;

  -[BSObjCProtocol descriptionBuilderWithMultilinePrefix:](self, "descriptionBuilderWithMultilinePrefix:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "build");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  id v8;
  _QWORD v10[5];
  id v11;

  v4 = a3;
  -[BSObjCProtocol succinctDescriptionBuilder](self, "succinctDescriptionBuilder");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __56__BSObjCProtocol_descriptionBuilderWithMultilinePrefix___block_invoke;
  v10[3] = &unk_1E1EBE700;
  v10[4] = self;
  v6 = v5;
  v11 = v6;
  objc_msgSend(v6, "appendBodySectionWithName:multilinePrefix:block:", 0, v4, v10);
  v7 = v11;
  v8 = v6;

  return v8;
}

void __56__BSObjCProtocol_descriptionBuilderWithMultilinePrefix___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t j;
  id v16;
  void *v17;
  void *v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "methods");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_msgSend(v2, "mutableCopy");

  v25 = 0u;
  v26 = 0u;
  v23 = 0u;
  v24 = 0u;
  objc_msgSend(*(id *)(a1 + 32), "properties");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v23, v28, 16);
  if (v5)
  {
    v6 = *(_QWORD *)v24;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v24 != v6)
          objc_enumerationMutation(v4);
        v8 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * i);
        objc_msgSend(v8, "getter");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "removeObject:", v9);

        objc_msgSend(v8, "setter");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "removeObject:", v10);

      }
      v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v23, v28, 16);
    }
    while (v5);
  }

  objc_msgSend(*(id *)(a1 + 32), "properties");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObjectsFromArray:", v11);

  v21 = 0u;
  v22 = 0u;
  v19 = 0u;
  v20 = 0u;
  v12 = v3;
  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v19, v27, 16);
  if (v13)
  {
    v14 = *(_QWORD *)v20;
    do
    {
      for (j = 0; j != v13; ++j)
      {
        if (*(_QWORD *)v20 != v14)
          objc_enumerationMutation(v12);
        v16 = (id)objc_msgSend(*(id *)(a1 + 40), "appendObject:withName:", *(_QWORD *)(*((_QWORD *)&v19 + 1) + 8 * j), 0, (_QWORD)v19);
      }
      v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v19, v27, 16);
    }
    while (v13);
  }

  v17 = *(void **)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "inheritedProtocols");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "appendArraySection:withName:skipIfEmpty:", v18, CFSTR("inheritedProtocols"), 1);

}

@end
