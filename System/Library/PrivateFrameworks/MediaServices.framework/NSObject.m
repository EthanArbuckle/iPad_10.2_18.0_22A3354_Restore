@implementation NSObject

void __56__NSObject_MSVDebugUtilities____msv_inspectWithOptions___block_invoke(uint64_t a1, objc_class *a2, char a3)
{
  void *v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void (*v12)(uint64_t, Protocol *);
  void *v13;
  id v14;

  objc_msgSend(*(id *)(a1 + 32), "appendFormat:", CFSTR("%@ "), a2);
  if ((*(_BYTE *)(a1 + 40) & 2) == 0)
  {
LABEL_5:
    if ((a3 & 1) != 0)
      return;
LABEL_10:
    objc_msgSend(*(id *)(a1 + 32), "appendString:", CFSTR(": "));
    return;
  }
  if ((objc_class *)objc_opt_class() == a2 && (*(_BYTE *)(a1 + 40) & 4) == 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "appendString:", CFSTR("<NSObject, ...> "));
    goto LABEL_5;
  }
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = MEMORY[0x1E0C809B0];
  v11 = 3221225472;
  v12 = __56__NSObject_MSVDebugUtilities____msv_inspectWithOptions___block_invoke_2;
  v13 = &unk_1E43E8B08;
  v7 = v6;
  v14 = v7;
  _MSVEnumerateClassProtocols(a2, &v10);
  if (objc_msgSend(v7, "count"))
  {
    v8 = *(void **)(a1 + 32);
    objc_msgSend(v7, "componentsJoinedByString:", CFSTR(", "));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "appendFormat:", CFSTR("<%@> "), v9, v10, v11, v12, v13);

  }
  if ((a3 & 1) == 0)
    goto LABEL_10;
}

void __56__NSObject_MSVDebugUtilities____msv_inspectWithOptions___block_invoke_3(uint64_t a1, objc_class *a2)
{
  void *v3;
  char *v4;
  _QWORD *v5;
  Ivar *v6;
  unint64_t i;
  const char *TypeEncoding;
  const char *Name;
  ptrdiff_t Offset;
  _QWORD v11[2];
  void (*v12)(uint64_t, uint64_t, uint64_t, char *, unsigned int *);
  void *v13;
  id v14;
  objc_class *v15;
  unsigned int outCount;

  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v12 = __56__NSObject_MSVDebugUtilities____msv_inspectWithOptions___block_invoke_4;
  v13 = &unk_1E43E8B58;
  v3 = *(void **)(a1 + 32);
  v14 = *(id *)(a1 + 40);
  v15 = a2;
  v4 = v3;
  v5 = v11;
  outCount = 0;
  v6 = class_copyIvarList(a2, &outCount);
  if (outCount)
  {
    for (i = 0;
          i < outCount;
          v12((uint64_t)v5, (uint64_t)v6[i++], (uint64_t)Name, (char *)TypeEncoding, (unsigned int *)&v4[Offset]))
    {
      TypeEncoding = ivar_getTypeEncoding(v6[i]);
      Name = ivar_getName(v6[i]);
      Offset = ivar_getOffset(v6[i]);
    }
  }
  free(v6);

}

void __56__NSObject_MSVDebugUtilities____msv_inspectWithOptions___block_invoke_5(uint64_t a1, objc_class *a2)
{
  _QWORD *v4;
  const char *Name;
  objc_class *MetaClass;
  objc_property_t *v7;
  unint64_t i;
  objc_property_t *v9;
  unint64_t j;
  _QWORD v11[2];
  void (*v12)(_QWORD *, objc_property_t, int);
  void *v13;
  id v14;
  id v15;
  objc_class *v16;
  unsigned int outCount;

  if ((objc_class *)objc_opt_class() != a2 || (*(_BYTE *)(a1 + 57) & 4) != 0)
  {
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v12 = __56__NSObject_MSVDebugUtilities____msv_inspectWithOptions___block_invoke_6;
    v13 = &unk_1E43E8BA8;
    v14 = *(id *)(a1 + 40);
    v15 = *(id *)(a1 + 48);
    v16 = a2;
    v4 = v11;
    outCount = 0;
    Name = class_getName(a2);
    MetaClass = objc_getMetaClass(Name);
    v7 = class_copyPropertyList(MetaClass, &outCount);
    if (outCount)
    {
      for (i = 0; i < outCount; v12(v4, v7[i++], 1))
        ;
    }
    free(v7);
    v9 = class_copyPropertyList(a2, &outCount);
    if (outCount)
    {
      for (j = 0; j < outCount; v12(v4, v9[j++], 0))
        ;
    }
    free(v9);

  }
}

void __56__NSObject_MSVDebugUtilities____msv_inspectWithOptions___block_invoke_7(uint64_t a1, objc_class *a2)
{
  void *v4;
  uint64_t v5;
  id v6;
  id v7;
  _QWORD *v8;
  const char *Name;
  objc_class *MetaClass;
  Method *v11;
  unint64_t i;
  Method *v13;
  unint64_t j;
  id v15;
  uint64_t v16;
  _QWORD v17[4];
  id v18;
  objc_class *v19;
  uint64_t v20;
  _QWORD v21[2];
  void (*v22)(uint64_t, Method, int);
  void *v23;
  id v24;
  id v25;
  id v26;
  uint64_t v27;
  objc_class *v28;
  _QWORD v29[4];
  id v30;
  unsigned int outCount;

  if ((objc_class *)objc_opt_class() != a2 || (*(_BYTE *)(a1 + 49) & 4) != 0)
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = MEMORY[0x1E0C809B0];
    v29[0] = MEMORY[0x1E0C809B0];
    v29[1] = 3221225472;
    v29[2] = __56__NSObject_MSVDebugUtilities____msv_inspectWithOptions___block_invoke_8;
    v29[3] = &unk_1E43E8B08;
    v6 = v4;
    v30 = v6;
    _MSVEnumerateClassProtocols(a2, v29);
    v21[0] = v5;
    v21[1] = 3221225472;
    v22 = __56__NSObject_MSVDebugUtilities____msv_inspectWithOptions___block_invoke_10;
    v23 = &unk_1E43E8C20;
    v27 = *(_QWORD *)(a1 + 48);
    v24 = *(id *)(a1 + 32);
    v7 = v6;
    v25 = v7;
    v26 = *(id *)(a1 + 40);
    v28 = a2;
    v8 = v21;
    outCount = 0;
    Name = class_getName(a2);
    MetaClass = objc_getMetaClass(Name);
    v11 = class_copyMethodList(MetaClass, &outCount);
    if (outCount)
    {
      for (i = 0; i < outCount; v22((uint64_t)v8, v11[i++], 1))
        ;
    }
    free(v11);
    v13 = class_copyMethodList(a2, &outCount);
    if (outCount)
    {
      for (j = 0; j < outCount; v22((uint64_t)v8, v13[j++], 0))
        ;
    }
    free(v13);

    if ((*(_BYTE *)(a1 + 51) & 0x10) != 0)
    {
      v17[0] = v5;
      v17[1] = 3221225472;
      v17[2] = __56__NSObject_MSVDebugUtilities____msv_inspectWithOptions___block_invoke_11;
      v17[3] = &unk_1E43E8C48;
      v19 = a2;
      v15 = *(id *)(a1 + 40);
      v16 = *(_QWORD *)(a1 + 48);
      v18 = v15;
      v20 = v16;
      objc_msgSend(v7, "enumerateKeysAndObjectsUsingBlock:", v17);

    }
  }
}

void __56__NSObject_MSVDebugUtilities____msv_inspectWithOptions___block_invoke_8(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  Protocol *v6;
  uint64_t *v7;
  objc_method_description *v8;
  objc_method_description *v9;
  unint64_t v10;
  char **p_types;
  objc_method_description *v12;
  objc_method_description *v13;
  unint64_t v14;
  char **v15;
  objc_method_description *v16;
  objc_method_description *v17;
  unint64_t v18;
  char **v19;
  objc_method_description *v20;
  objc_method_description *v21;
  unint64_t v22;
  char **v23;
  void *v24;
  void *v25;
  const char *Name;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  void (*v30)(uint64_t, SEL, uint64_t, uint64_t);
  void *v31;
  id v32;
  unsigned int outCount;

  v3 = a2;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = MEMORY[0x1E0C809B0];
  v29 = 3221225472;
  v30 = __56__NSObject_MSVDebugUtilities____msv_inspectWithOptions___block_invoke_9;
  v31 = &unk_1E43E8BF8;
  v5 = v4;
  v32 = v5;
  v6 = (Protocol *)v3;
  v7 = &v28;
  outCount = 0;
  v8 = protocol_copyMethodDescriptionList(v6, 1, 0, &outCount);
  v9 = v8;
  if (outCount)
  {
    v10 = 0;
    p_types = &v8->types;
    do
    {
      ((void (*)(uint64_t *, _QWORD, char *, uint64_t, uint64_t))v30)(v7, *(p_types - 1), *p_types, 1, 1);
      ++v10;
      p_types += 2;
    }
    while (v10 < outCount);
  }
  free(v9);
  v12 = protocol_copyMethodDescriptionList(v6, 1, 1, &outCount);
  v13 = v12;
  if (outCount)
  {
    v14 = 0;
    v15 = &v12->types;
    do
    {
      ((void (*)(uint64_t *, _QWORD, char *, _QWORD, uint64_t))v30)(v7, *(v15 - 1), *v15, 0, 1);
      ++v14;
      v15 += 2;
    }
    while (v14 < outCount);
  }
  free(v13);
  v16 = protocol_copyMethodDescriptionList(v6, 0, 0, &outCount);
  v17 = v16;
  if (outCount)
  {
    v18 = 0;
    v19 = &v16->types;
    do
    {
      ((void (*)(uint64_t *, _QWORD, char *, uint64_t, _QWORD))v30)(v7, *(v19 - 1), *v19, 1, 0);
      ++v18;
      v19 += 2;
    }
    while (v18 < outCount);
  }
  free(v17);
  v20 = protocol_copyMethodDescriptionList(v6, 0, 1, &outCount);
  v21 = v20;
  if (outCount)
  {
    v22 = 0;
    v23 = &v20->types;
    do
    {
      ((void (*)(uint64_t *, _QWORD, char *, uint64_t, _QWORD))v30)(v7, *(v23 - 1), *v23, 1, 0);
      ++v22;
      v23 += 2;
    }
    while (v22 < outCount);
  }
  free(v21);

  v24 = *(void **)(a1 + 32);
  v25 = (void *)MEMORY[0x1E0CB3940];
  Name = protocol_getName(v6);
  objc_msgSend(v25, "stringWithUTF8String:", Name, v28, v29);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "setObject:forKeyedSubscript:", v5, v27);

}

void __56__NSObject_MSVDebugUtilities____msv_inspectWithOptions___block_invoke_10(uint64_t a1, Method m, int a3)
{
  const char *Name;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  char v18;
  void *v19;
  uint64_t v20;
  void *v21;
  int v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  _BYTE v34[128];
  _BYTE v35[128];
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  Name = method_getName(m);
  NSStringFromSelector(Name);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((!objc_msgSend(v7, "isEqualToString:", CFSTR(".cxx_destruct")) || (*(_BYTE *)(a1 + 59) & 4) != 0)
    && (objc_msgSend(*(id *)(a1 + 32), "containsObject:", v7) & 1) == 0)
  {
    v32 = 0u;
    v33 = 0u;
    v30 = 0u;
    v31 = 0u;
    objc_msgSend(*(id *)(a1 + 40), "allValues");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v30, v35, 16);
    if (v24)
    {
      v9 = *(_QWORD *)v31;
      v22 = a3;
      v25 = v8;
      v23 = *(_QWORD *)v31;
      do
      {
        v10 = 0;
        do
        {
          if (*(_QWORD *)v31 != v9)
            objc_enumerationMutation(v8);
          v11 = *(void **)(*((_QWORD *)&v30 + 1) + 8 * v10);
          v26 = 0u;
          v27 = 0u;
          v28 = 0u;
          v29 = 0u;
          v12 = v11;
          v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v26, v34, 16);
          if (v13)
          {
            v14 = v13;
            v15 = *(_QWORD *)v27;
            while (2)
            {
              v16 = 0;
              do
              {
                if (*(_QWORD *)v27 != v15)
                  objc_enumerationMutation(v12);
                objc_msgSend(*(id *)(*((_QWORD *)&v26 + 1) + 8 * v16), "second");
                v17 = (void *)objc_claimAutoreleasedReturnValue();
                v18 = objc_msgSend(v17, "isEqual:", v7);

                if ((v18 & 1) != 0)
                {

                  goto LABEL_23;
                }
                ++v16;
              }
              while (v14 != v16);
              v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v26, v34, 16);
              if (v14)
                continue;
              break;
            }
          }

          ++v10;
          v8 = v25;
          v9 = v23;
        }
        while (v10 != v24);
        a3 = v22;
        v24 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v30, v35, 16);
      }
      while (v24);
    }

    v19 = *(void **)(a1 + 48);
    v20 = *(_QWORD *)(a1 + 64);
    _MSVDescribeMethod(m, a3);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "appendFormat:", CFSTR("/* %@ */ %@"), v20, v21);

    if ((*(_BYTE *)(a1 + 59) & 8) != 0)
      objc_msgSend(*(id *)(a1 + 48), "appendFormat:", CFSTR("// IMP: %p"), method_getImplementation(m));
    objc_msgSend(*(id *)(a1 + 48), "appendString:", CFSTR("\n"));
  }
LABEL_23:

}

void __56__NSObject_MSVDebugUtilities____msv_inspectWithOptions___block_invoke_11(uint64_t a1, void *a2, void *a3)
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  NSString *v11;
  const char *v12;
  void *v13;
  int v14;
  objc_class *v15;
  Method ClassMethod;
  objc_method *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  id obj;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  obj = a3;
  v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v24;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v24 != v8)
          objc_enumerationMutation(obj);
        v10 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * i);
        objc_msgSend(v10, "second");
        v11 = (NSString *)objc_claimAutoreleasedReturnValue();
        v12 = NSSelectorFromString(v11);

        objc_msgSend(v10, "first");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = objc_msgSend(v13, "BOOLValue");
        v15 = *(objc_class **)(a1 + 40);
        if (v14)
          ClassMethod = class_getClassMethod(v15, v12);
        else
          ClassMethod = class_getInstanceMethod(v15, v12);
        v17 = ClassMethod;

        v19 = *(void **)(a1 + 32);
        v18 = *(_QWORD *)(a1 + 40);
        objc_msgSend(v10, "first");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        _MSVDescribeMethod(v17, objc_msgSend(v20, "BOOLValue"));
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "appendFormat:", CFSTR("/* %@ <%@> */ %@"), v18, v5, v21);

        if ((*(_BYTE *)(a1 + 51) & 8) != 0)
          objc_msgSend(*(id *)(a1 + 32), "appendFormat:", CFSTR("// IMP: %p"), method_getImplementation(v17));
        objc_msgSend(*(id *)(a1 + 32), "appendString:", CFSTR("\n"));
      }
      v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
    }
    while (v7);
  }

}

void __56__NSObject_MSVDebugUtilities____msv_inspectWithOptions___block_invoke_9(uint64_t a1, SEL aSelector, uint64_t a3, uint64_t a4)
{
  void *v6;
  void *v7;
  void *v8;
  id v9;

  NSStringFromSelector(aSelector);
  v9 = (id)objc_claimAutoreleasedReturnValue();
  v6 = *(void **)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  +[MSVPair pairWithFirst:second:](MSVPair, "pairWithFirst:second:", v7, v9);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addObject:", v8);

}

void __56__NSObject_MSVDebugUtilities____msv_inspectWithOptions___block_invoke_6(_QWORD *a1, objc_property_t property, int a3)
{
  const char *Name;
  char *v7;
  char *v8;
  const char *Uid;
  void *v10;
  void *v11;
  char *v12;
  char *v13;
  char *v14;
  const char *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  void *v22;
  objc_property_attribute_t *v23;
  unint64_t v24;
  const char **p_value;
  const char *v26;
  const char *v27;
  uint64_t v28;
  void *v29;
  const __CFString *v30;
  void *v31;
  uint64_t v32;
  void *v33;
  const __CFString *v34;
  void *v35;
  id v36;
  void *v37;
  void *v38;
  void *v39;
  id v40;
  char v41;
  void *v42;
  objc_property_attribute_t *v43;
  void *v44;
  uint64_t v45;
  void *v46;
  char v47;
  void *v48;
  unsigned int outCount;

  Name = property_getName(property);
  v7 = property_copyAttributeValue(property, "G");
  v8 = v7;
  if (!v7)
    v7 = (char *)Name;
  Uid = sel_getUid(v7);
  free(v8);
  if (Uid)
  {
    v10 = (void *)a1[4];
    NSStringFromSelector(Uid);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "addObject:", v11);

  }
  v12 = property_copyAttributeValue(property, "R");
  if (v12)
  {
    free(v12);
    goto LABEL_10;
  }
  v13 = property_copyAttributeValue(property, "S");
  if (v13)
  {
    v14 = v13;
    v15 = sel_getUid(v13);
    free(v14);
    if (!v15)
      goto LABEL_10;
    goto LABEL_9;
  }
  objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithUTF8String:", property_getName(property));
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "substringToIndex:", 1);
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "uppercaseString");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "replaceCharactersInRange:withString:", 0, 1, v39);

  objc_msgSend(v37, "insertString:atIndex:", CFSTR("set"), 0);
  objc_msgSend(v37, "appendString:", CFSTR(":"));
  v40 = objc_retainAutorelease(v37);
  v15 = sel_getUid((const char *)objc_msgSend(v40, "UTF8String"));

  if (v15)
  {
LABEL_9:
    v16 = (void *)a1[4];
    NSStringFromSelector(v15);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "addObject:", v17);

  }
LABEL_10:
  v18 = (void *)a1[5];
  v19 = a1[6];
  v42 = v18;
  objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithString:", CFSTR("@property "));
  v20 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = v21;
  if (a3)
    objc_msgSend(v21, "addObject:", CFSTR("class"));
  outCount = 0;
  v23 = property_copyAttributeList(property, &outCount);
  v44 = (void *)v20;
  v45 = v19;
  v43 = v23;
  if (outCount)
  {
    v24 = 0;
    v41 = 0;
    v47 = 0;
    v48 = 0;
    v46 = 0;
    p_value = &v23->value;
    while (1)
    {
      v27 = *(p_value - 1);
      v26 = *p_value;
      if (!strcmp(v27, "R"))
      {
        v29 = v22;
        v30 = CFSTR("readonly");
      }
      else if (!strcmp(v27, "C"))
      {
        v29 = v22;
        v30 = CFSTR("copy");
      }
      else if (!strcmp(v27, "&"))
      {
        v29 = v22;
        v30 = CFSTR("retain");
      }
      else if (!strcmp(v27, "N"))
      {
        v29 = v22;
        v30 = CFSTR("nonatomic");
      }
      else
      {
        if (!strcmp(v27, "G"))
        {
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("getter=%s"), v26);
LABEL_34:
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v22, "addObject:", v31);

          goto LABEL_30;
        }
        if (!strcmp(v27, "S"))
        {
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("setter=%s"), v26);
          goto LABEL_34;
        }
        if (!strcmp(v27, "D"))
        {
          v41 = 1;
          goto LABEL_30;
        }
        if (strcmp(v27, "W"))
        {
          if (!strcmp(v27, "T"))
          {
            _MSVObjCTypeDescription(v26);
            v32 = objc_claimAutoreleasedReturnValue();

            v47 |= *v26 == 64;
            v48 = (void *)v32;
          }
          else if (!strcmp(v27, "V"))
          {
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v26);
            v28 = objc_claimAutoreleasedReturnValue();

            v46 = (void *)v28;
          }
          goto LABEL_30;
        }
        v29 = v22;
        v30 = CFSTR("weak");
      }
      objc_msgSend(v29, "addObject:", v30);
LABEL_30:
      ++v24;
      p_value += 2;
      if (v24 >= outCount)
        goto LABEL_39;
    }
  }
  v46 = 0;
  v48 = 0;
  v47 = 0;
  v41 = 0;
LABEL_39:
  free(v43);
  if (objc_msgSend(v22, "count"))
  {
    objc_msgSend(v22, "sortUsingComparator:", &__block_literal_global_296);
    objc_msgSend(v22, "componentsJoinedByString:", CFSTR(", "));
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v44, "appendFormat:", CFSTR("(%@) "), v33);

  }
  if ((v47 & 1) != 0)
    v34 = &stru_1E43EA7B0;
  else
    v34 = CFSTR(" ");
  objc_msgSend(v44, "appendFormat:", CFSTR("%@%@%s;"), v48, v34, property_getName(property));
  if (v46)
  {
    objc_msgSend(v44, "appendFormat:", CFSTR("  // @synthesize %s=%@;"), property_getName(property), v46);
    v35 = v42;
  }
  else
  {
    v35 = v42;
    if ((v41 & 1) != 0)
      objc_msgSend(v44, "appendFormat:", CFSTR("  // @dynamic %s;"), property_getName(property));
  }
  v36 = v44;

  objc_msgSend(v35, "appendFormat:", CFSTR("/* %@ */ %@\n"), v45, v36);
}

void __56__NSObject_MSVDebugUtilities____msv_inspectWithOptions___block_invoke_4(uint64_t a1, uint64_t a2, uint64_t a3, char *a4, unsigned int *a5)
{
  void *v9;
  id v10;

  _MSVObjCTypeDescription(a4);
  v10 = (id)objc_claimAutoreleasedReturnValue();
  _MSVDebugIvarValue(a5, a4, 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "appendFormat:", CFSTR("\t/* %@ */ %s: (%@) = %@;\n"),
    *(_QWORD *)(a1 + 40),
    a3,
    v10,
    v9);

}

void __56__NSObject_MSVDebugUtilities____msv_inspectWithOptions___block_invoke_2(uint64_t a1, Protocol *p)
{
  void *v2;
  id v3;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s"), protocol_getName(p));
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObject:", v3);

}

@end
