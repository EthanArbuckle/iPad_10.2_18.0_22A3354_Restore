@implementation NSObject(BSCoding)

+ (id)bs_secureObjectFromData:()BSCoding ofClasses:
{
  return _BSCreateObjectOfClassesFromData(a4, a3);
}

+ (id)bs_secureDecodedFromData:()BSCoding withAdditionalClasses:
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  NSObject *v13;
  id v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  void *v20;
  id v21;
  uint8_t buf[4];
  const char *v23;
  __int16 v24;
  id v25;
  __int16 v26;
  void *v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v21 = a1;
  v7 = a3;
  v8 = a4;
  if ((objc_msgSend(a1, "supportsSecureCoding") & 1) != 0)
  {
    if (v7)
      goto LABEL_3;
LABEL_17:
    v12 = 0;
    goto LABEL_18;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromClass((Class)a1);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("NSObject+BSCoding.m"), 133, CFSTR("%@ does not support secure coding"), v18);

  if (!v7)
    goto LABEL_17;
LABEL_3:
  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E20]), "initWithObjects:count:", &v21, 1);
  v10 = v9;
  if (v8)
    objc_msgSend(v9, "unionSet:", v8);
  v11 = _BSCreateObjectOfClassesFromData(v10, v7);
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    if (v11)
    {
      BSLogCommon();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        v14 = v21;
        v15 = (void *)objc_opt_class();
        *(_DWORD *)buf = 136315650;
        v23 = "+[NSObject(BSCoding) bs_secureDecodedFromData:withAdditionalClasses:]";
        v24 = 2114;
        v25 = v14;
        v26 = 2114;
        v27 = v15;
        v16 = v15;
        _os_log_error_impl(&dword_18A184000, v13, OS_LOG_TYPE_ERROR, "%s decoded an unexpected type : expected=%{public}@ decoded=%{public}@", buf, 0x20u);

      }
    }
    goto LABEL_12;
  }
  v12 = v11;
  if (!v12)
  {
LABEL_12:
    if ((objc_msgSend(v21, "conformsToProtocol:", &unk_1EDF5E3C8) & 1) == 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "handleFailureInMethod:object:file:lineNumber:description:", a2, v21);

    }
    v12 = 0;
  }

LABEL_18:
  return v12;
}

+ (id)bs_secureDataFromObject:()BSCoding
{
  return (id)_BSCreateDataFromObject(a3);
}

- (id)bs_secureEncoded
{
  return (id)_BSCreateDataFromObject(a1);
}

+ (id)bs_secureDecodedFromData:()BSCoding
{
  id v5;
  id v6;
  void *v8;

  v5 = a3;
  if (!v5)
  {
LABEL_5:
    v6 = 0;
    goto LABEL_6;
  }
  v6 = _BSCreateObjectOfClassFromData(a1, v5);
  if (!v6)
  {
    if ((-[objc_class conformsToProtocol:](a1, "conformsToProtocol:", &unk_1EDF5E3C8) & 1) == 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("NSObject+BSCoding.m"), 125, CFSTR("%@ does not implement NSSecureCoding"), a1);

    }
    goto LABEL_5;
  }
LABEL_6:

  return v6;
}

+ (uint64_t)bs_isPlistableType
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t i;
  uint64_t v6;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  if (qword_1ECD39AC0 != -1)
    dispatch_once(&qword_1ECD39AC0, &__block_literal_global_26);
  v10 = 0u;
  v11 = 0u;
  v8 = 0u;
  v9 = 0u;
  v2 = (id)_MergedGlobals_31;
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v3)
  {
    v4 = *(_QWORD *)v9;
    while (2)
    {
      for (i = 0; i != v3; ++i)
      {
        if (*(_QWORD *)v9 != v4)
          objc_enumerationMutation(v2);
        if ((objc_msgSend(a1, "isSubclassOfClass:", *(_QWORD *)(*((_QWORD *)&v8 + 1) + 8 * i), (_QWORD)v8) & 1) != 0)
        {
          v6 = 1;
          goto LABEL_13;
        }
      }
      v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
      if (v3)
        continue;
      break;
    }
  }
  v6 = 0;
LABEL_13:

  return v6;
}

- (uint64_t)bs_isPlistableType
{
  return objc_msgSend((id)objc_opt_class(), "bs_isPlistableType");
}

+ (id)bs_secureObjectFromData:()BSCoding ofClass:
{
  id v5;
  id v6;

  v5 = a3;
  v6 = 0;
  if (v5 && a4)
    v6 = _BSCreateObjectOfClassFromData(a4, v5);

  return v6;
}

@end
