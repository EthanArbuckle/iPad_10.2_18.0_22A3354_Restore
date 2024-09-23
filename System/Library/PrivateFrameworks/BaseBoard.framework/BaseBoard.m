uint64_t BSEqualObjects(void *a1, void *a2)
{
  uint64_t result;

  if (a1 == a2)
    return 1;
  result = 0;
  if (a1)
  {
    if (a2)
      return objc_msgSend(a1, "isEqual:", a2);
  }
  return result;
}

uint64_t BSEqualStrings(void *a1, void *a2)
{
  uint64_t result;

  if (a1 == a2)
    return 1;
  result = 0;
  if (a1)
  {
    if (a2)
      return objc_msgSend(a1, "isEqualToString:", a2);
  }
  return result;
}

uint64_t BSEqualBools(int a1, int a2)
{
  return a1 ^ a2 ^ 1u;
}

BOOL BSFloatEqualToFloat(double a1, double a2)
{
  return vabdd_f64(a1, a2) < 2.22044605e-16;
}

void sub_18A18574C(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_18A1858A0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_18A185988(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_18A185EE8(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_18A1860DC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void sub_18A186198(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, id a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  void *v14;

  _Unwind_Resume(a1);
}

void BSIntegerMapEnumerateKeysWithBlock(void *a1, void *a2)
{
  NSMapTable **v3;
  id v4;
  void (**v5)(_QWORD, _QWORD, _QWORD);
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  NSMapEnumerator enumerator;
  void *key;
  char v12;

  v3 = a1;
  v4 = a2;
  v5 = (void (**)(_QWORD, _QWORD, _QWORD))v4;
  if (!v3)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "void BSIntegerMapEnumerateKeysWithBlock(BSIntegerMap *__strong _Nonnull, void (^__strong _Nonnull)(NSInteger, BOOL *))");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "handleFailureInFunction:file:lineNumber:description:", v7, CFSTR("BSIntegerMap.m"), 189, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("map"));

    if (v5)
      goto LABEL_3;
LABEL_11:
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "void BSIntegerMapEnumerateKeysWithBlock(BSIntegerMap *__strong _Nonnull, void (^__strong _Nonnull)(NSInteger, BOOL *))");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInFunction:file:lineNumber:description:", v9, CFSTR("BSIntegerMap.m"), 190, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("block"));

    goto LABEL_3;
  }
  if (!v4)
    goto LABEL_11;
LABEL_3:
  v12 = 0;
  if (!v3[2] || (((void (**)(_QWORD, _QWORD, char *))v5)[2](v5, 0, &v12), !v12))
  {
    key = 0;
    memset(&enumerator, 0, sizeof(enumerator));
    NSEnumerateMapTable(&enumerator, v3[1]);
    do
    {
      if (!NSNextMapEnumeratorPair(&enumerator, &key, 0))
        break;
      ((void (**)(_QWORD, void *, char *))v5)[2](v5, key, &v12);
    }
    while (!v12);
    NSEndMapTableEnumeration(&enumerator);
  }

}

void sub_18A186348(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  v5 = v3;

  _Unwind_Resume(a1);
}

void sub_18A1863F8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_18A186500(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_18A186664(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_18A186740(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_18A186858(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void sub_18A186908(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void BSIntegerMapSetObjectForKey(void *a1, void *a2, uint64_t a3)
{
  id v5;
  id *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id *v11;

  v11 = a1;
  v5 = a2;
  v6 = v11;
  if (v11)
  {
    if (v5)
      goto LABEL_3;
LABEL_6:
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "void BSIntegerMapSetObjectForKey(BSMutableIntegerMap *__strong _Nonnull, __strong id _Nonnull, NSInteger)");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "handleFailureInFunction:file:lineNumber:description:", v10, CFSTR("BSIntegerMap.m"), 236, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("object"));

    v6 = v11;
    if (a3)
      goto LABEL_4;
LABEL_7:
    objc_storeStrong(v6 + 2, a2);
    goto LABEL_8;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "void BSIntegerMapSetObjectForKey(BSMutableIntegerMap *__strong _Nonnull, __strong id _Nonnull, NSInteger)");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "handleFailureInFunction:file:lineNumber:description:", v8, CFSTR("BSIntegerMap.m"), 235, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("map"));

  v6 = 0;
  if (!v5)
    goto LABEL_6;
LABEL_3:
  if (!a3)
    goto LABEL_7;
LABEL_4:
  objc_msgSend(v6[1], "setObject:forKey:", v5, a3);
LABEL_8:

}

void sub_18A186A74(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;
  void *v11;
  void *v12;

  _Unwind_Resume(a1);
}

void sub_18A186D50(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, _Unwind_Exception *exception_object)
{
  void *v10;
  void *v11;
  void *v12;

  _Unwind_Resume(a1);
}

void sub_18A186F0C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void BSIntegerMapEnumerateWithBlock(void *a1, void *a2)
{
  id v3;
  id v4;
  void (**v5)(_QWORD, _QWORD, _QWORD, _QWORD);
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  NSMapEnumerator enumerator;
  void *value;
  void *key;
  char v14;

  v3 = a1;
  v4 = a2;
  v5 = (void (**)(_QWORD, _QWORD, _QWORD, _QWORD))v4;
  if (!v3)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "void BSIntegerMapEnumerateWithBlock(BSIntegerMap *__strong _Nonnull, void (^__strong _Nonnull)(NSInteger, __strong id, BOOL *))");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "handleFailureInFunction:file:lineNumber:description:", v8, CFSTR("BSIntegerMap.m"), 209, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("map"));

    if (v5)
      goto LABEL_3;
LABEL_11:
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "void BSIntegerMapEnumerateWithBlock(BSIntegerMap *__strong _Nonnull, void (^__strong _Nonnull)(NSInteger, __strong id, BOOL *))");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "handleFailureInFunction:file:lineNumber:description:", v10, CFSTR("BSIntegerMap.m"), 210, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("block"));

    goto LABEL_3;
  }
  if (!v4)
    goto LABEL_11;
LABEL_3:
  v14 = 0;
  v6 = *((_QWORD *)v3 + 2);
  if (!v6 || (((void (**)(_QWORD, _QWORD, uint64_t, char *))v5)[2](v5, 0, v6, &v14), !v14))
  {
    value = 0;
    key = 0;
    memset(&enumerator, 0, sizeof(enumerator));
    NSEnumerateMapTable(&enumerator, *((NSMapTable **)v3 + 1));
    do
    {
      if (!NSNextMapEnumeratorPair(&enumerator, &key, &value))
        break;
      ((void (**)(_QWORD, void *, void *, char *))v5)[2](v5, key, value, &v14);
    }
    while (!v14);
    NSEndMapTableEnumeration(&enumerator);
  }

}

void sub_18A1870EC(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  v5 = v3;

  _Unwind_Resume(a1);
}

void sub_18A1871C4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_18A1872A4(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_18A187334(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_18A1873A8(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_18A187450(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_18A187614(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_18A1876C8(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_18A187744(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

id BSIntegerMapAllKeys(void *a1)
{
  id v1;
  void *v2;
  id v3;
  void *v5;
  void *v6;
  _QWORD v7[4];
  id v8;

  v1 = a1;
  if (!v1)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "BSIntegerSet * _Nonnull BSIntegerMapAllKeys(BSIntegerMap *__strong _Nonnull)");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v6, CFSTR("BSIntegerMap.m"), 175, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("map"));

  }
  v2 = (void *)objc_opt_new();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __BSIntegerMapAllKeys_block_invoke;
  v7[3] = &unk_1E1EBF2B0;
  v3 = v2;
  v8 = v3;
  BSIntegerMapEnumerateKeysWithBlock(v1, v7);

  return v3;
}

void sub_18A187854(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  v4 = v3;

  _Unwind_Resume(a1);
}

void sub_18A1878F0(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_18A187988(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_18A187B28(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;
  void *v11;

  _Unwind_Resume(a1);
}

void sub_18A187C98(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void sub_18A187D24(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void BSSettingsEncodeAppendSettingArrayEntry(void *a1, uint64_t a2, void *a3, void *a4)
{
  id v7;
  id v8;
  void (**v9)(id, uint64_t, id, id *);
  void *v10;
  id v11;
  id v12;
  id v13;
  size_t v14;
  xpc_object_t v15;
  uint64_t i;
  void *v17;
  void *v18;
  id v19;
  xpc_object_t objects[4];

  objects[3] = *(xpc_object_t *)MEMORY[0x1E0C80C00];
  v7 = a1;
  v8 = a3;
  v9 = a4;
  v19 = 0;
  v9[2](v9, a2, v8, &v19);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v19;
  if (!v10)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "void BSSettingsEncodeAppendSettingArrayEntry(__strong xpc_object_t, NSUInteger, __strong id, __strong BSSettingEncodeBlock)");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "handleFailureInFunction:file:lineNumber:description:", v18, CFSTR("BSSettings.m"), 83, CFSTR("encodeBlock didn't return an object for %llu -> %@"), a2, v8);

  }
  objects[0] = xpc_uint64_create(a2);
  v12 = v10;
  objects[1] = v12;
  v13 = v11;
  objects[2] = v13;
  if (v13)
    v14 = 3;
  else
    v14 = 2;
  v15 = xpc_array_create(objects, v14);
  xpc_array_append_value(v7, v15);

  for (i = 2; i != -1; --i)
}

void sub_18A187ED4(_Unwind_Exception *a1, int a2)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v10;

  if (a2 == 1)
  {
    v10 = objc_retainAutorelease(objc_begin_catch(a1));
    objc_exception_throw(v10);
  }

  _Unwind_Resume(a1);
}

void BSIntegerMapRemoveObjectForKey(void *a1, uint64_t a2)
{
  id *v3;
  void *v4;
  void *v5;
  id v6;
  id *v7;

  v3 = a1;
  v7 = v3;
  if (!v3)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "void BSIntegerMapRemoveObjectForKey(BSMutableIntegerMap *__strong _Nonnull, NSInteger)");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "handleFailureInFunction:file:lineNumber:description:", v5, CFSTR("BSIntegerMap.m"), 245, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("map"));

    v3 = 0;
    if (a2)
      goto LABEL_3;
LABEL_5:
    v6 = v3[2];
    v3[2] = 0;

    goto LABEL_6;
  }
  if (!a2)
    goto LABEL_5;
LABEL_3:
  objc_msgSend(v3[1], "removeObjectForKey:", a2);
LABEL_6:

}

void sub_18A188058(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;
  void *v11;

  _Unwind_Resume(a1);
}

void sub_18A188230(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

id _BSSafeCast(void *a1, uint64_t a2)
{
  id v3;
  void *v4;
  id v5;

  v3 = a1;
  if (a2)
  {
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v4 = v3;
    else
      v4 = 0;
  }
  else
  {
    v4 = 0;
  }
  v5 = v4;

  return v5;
}

void sub_18A1882D4(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

id BSIntegerMapObjectForKey(void *a1, uint64_t a2)
{
  id *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = a1;
  if (!v3)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "id  _Nullable BSIntegerMapObjectForKey(BSIntegerMap *__strong _Nonnull, NSInteger)");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v6, CFSTR("BSIntegerMap.m"), 157, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("map"));

    if (a2)
      goto LABEL_3;
LABEL_5:
    v4 = v3[2];
    goto LABEL_6;
  }
  if (!a2)
    goto LABEL_5;
LABEL_3:
  objc_msgSend(v3[1], "objectForKey:", a2);
  v4 = (id)objc_claimAutoreleasedReturnValue();
LABEL_6:
  v7 = v4;

  return v7;
}

void sub_18A18840C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_18A1884EC(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_18A188568(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_18A1885F4(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_18A188668(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

id BSIntegerMapAllValues(void *a1)
{
  NSMapTable **v1;
  void *v2;
  void *v4;
  void *v5;

  v1 = a1;
  if (!v1)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "NSArray * _Nonnull BSIntegerMapAllValues(BSIntegerMap *__strong _Nonnull)");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "handleFailureInFunction:file:lineNumber:description:", v5, CFSTR("BSIntegerMap.m"), 184, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("map"));

  }
  NSAllMapTableValues(v1[1]);
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

void sub_18A18872C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_18A188898(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

id BSSettingsEncodeSettingObject(void *a1, _QWORD *a2)
{
  id v3;
  id v4;
  id v5;
  void *v6;
  uint64_t v7;

  v3 = a1;
  if (xpc_is_kind_of_xpc_object4NSXPC())
  {
    *a2 = 0;
    v4 = v3;
  }
  else
  {
    if ((objc_msgSend(v3, "supportsBSXPCSecureCoding") & 1) != 0 || (objc_opt_respondsToSelector() & 1) != 0)
    {
      *a2 = xpc_int64_create(1);
      +[BSXPCCoder coder](BSXPCCoder, "coder");
      v5 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "encodeObject:forKey:", v3, CFSTR("__BSXPCSecureValue"));
      NSStringFromClass((Class)objc_msgSend(v3, "classForCoder"));
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "encodeObject:forKey:", v6, CFSTR("__BSXPCSecureClass"));

      objc_msgSend(v5, "createMessage");
      v7 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      *a2 = xpc_int64_create(2);
      v5 = objc_alloc_init(MEMORY[0x1E0CB3B48]);
      objc_msgSend(v5, "beginEncoding");
      objc_msgSend(v5, "encodeObject:forKey:", v3, CFSTR("__BSXPCSecureValue"));
      objc_msgSend(v5, "finishEncoding");
      v7 = objc_claimAutoreleasedReturnValue();
    }
    v4 = (id)v7;

  }
  return v4;
}

void sub_18A188A10(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_18A188B00(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

id BSSerializeBSXPCEncodableObjectToXPCDictionary(void *a1, void *a2)
{
  id v3;
  id v4;
  void *v5;
  objc_class *v6;
  void *v7;
  void *v8;

  v3 = a1;
  v4 = a2;
  v5 = v4;
  if (v3)
  {
    if (v4)
    {
      objc_msgSend(v3, "encodeWithXPCDictionary:", v4);
      v6 = (objc_class *)objc_opt_class();
      NSStringFromClass(v6);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      BSSerializeStringToXPCDictionaryWithKey(v7, v5, "bs_class");

      if ((objc_opt_respondsToSelector() & 1) != 0)
      {
        NSStringFromClass((Class)objc_msgSend(v3, "fallbackXPCEncodableClass"));
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        BSSerializeStringToXPCDictionaryWithKey(v8, v5, "bs_fallback");

      }
    }
  }

  return v5;
}

void sub_18A188BC8(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  v4 = v3;

  _Unwind_Resume(a1);
}

void sub_18A188C80(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, objc_super a9)
{
  void *v9;
  void *v10;

  v10 = v9;

  a9.super_class = (Class)BSXPCCoder;
  -[_Unwind_Exception dealloc](&a9, sel_dealloc);
  _Unwind_Resume(a1);
}

void BSSerializeStringToXPCDictionaryWithKey(void *a1, void *a2, const char *a3)
{
  id v5;
  id v6;

  v6 = a1;
  v5 = a2;
  if (v6 && v5 && a3)
    xpc_dictionary_set_string(v5, a3, (const char *)objc_msgSend(objc_retainAutorelease(v6), "UTF8String"));

}

void sub_18A188D34(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_18A188E3C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  void *v14;
  void *v15;

  _Unwind_Resume(a1);
}

void sub_18A188F68(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, id a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14, void *a15, void *a16)
{
  void *v16;
  void *v17;

  _Unwind_Resume(a1);
}

void sub_18A18901C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_18A1890C4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_18A189114(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_18A1891C8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_18A1892C8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_18A18936C(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

BOOL BSFloatIsZero(double a1)
{
  return fabs(a1) < 2.22044605e-16;
}

BOOL BSSizeEqualToSize(double a1, double a2, double a3, double a4)
{
  _BOOL4 v4;

  v4 = vabdd_f64(a1, a3) < 2.22044605e-16;
  return vabdd_f64(a2, a4) < 2.22044605e-16 && v4;
}

double BSRectWithSize()
{
  return *MEMORY[0x1E0C9D538];
}

void sub_18A189500(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

double BSFloatByLinearlyInterpolatingFloats(double a1, double a2, double a3)
{
  return a2 * a3 + a1 * (1.0 - a3);
}

void sub_18A189630(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

BOOL BSSettingFlagIsYes(uint64_t a1)
{
  return a1 != 0x7FFFFFFFFFFFFFFFLL && a1 != 0;
}

void BSDispatchQueueAssertBarrier(void *a1)
{
  NSObject *queue;

  queue = a1;
  if (queue == MEMORY[0x1E0C80D38])
    BSDispatchQueueAssertMain();
  else
    dispatch_assert_queue_barrier(queue);

}

void sub_18A189750(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_18A189948(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, void *a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,void *a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,void *a28)
{
  void *v28;
  void *v29;
  void *v30;

  _Unwind_Resume(a1);
}

void sub_18A189A40(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_18A189AB8(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

objc_class *BSDeserializeBSXPCEncodableObjectFromXPCDictionaryWithKey(void *a1, const char *a2)
{
  return BSCreateDeserializedBSXPCEncodableObjectFromXPCDictionaryWithKey(a1, a2);
}

void sub_18A189E98(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_18A189F5C(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_18A18A024(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_18A18A824(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id a16)
{
  void *v16;
  void *v17;

  _Unwind_Resume(a1);
}

void sub_18A18AA70(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_18A18B0D8(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_18A18B204(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_18A18B3AC(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_18A18B630(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_18A18B718(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_18A18B774(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_18A18B820(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_18A18B874(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_18A18BC48(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,void *a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,void *a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,void *a33,uint64_t a34,char a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,id a40)
{
  void *v40;
  void *v41;
  uint64_t v42;

  _Block_object_dispose(&a35, 8);
  _Block_object_dispose((const void *)(v42 - 176), 8);

  _Block_object_dispose((const void *)(v42 - 128), 8);
  _Unwind_Resume(a1);
}

uint64_t BSSettingsIsEmpty(void *a1)
{
  id v1;
  void *v2;
  uint64_t v3;

  v1 = a1;
  v2 = v1;
  if (v1)
    v3 = objc_msgSend(v1, "isEmpty");
  else
    v3 = 1;

  return v3;
}

void sub_18A18BD34(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

uint64_t BSIntegerMapCount(void *a1)
{
  _QWORD *v1;
  _QWORD *v2;
  void *v3;
  uint64_t v4;

  v1 = a1;
  v2 = v1;
  if (v1)
  {
    v3 = (void *)v1[1];
    if (v2[2])
      v4 = objc_msgSend(v3, "count") + 1;
    else
      v4 = objc_msgSend(v3, "count");
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

void sub_18A18BDFC(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_18A18BF1C(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_18A18BF7C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_18A18C034(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_18A18C0BC(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_18A18C110(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, objc_super a9)
{
  void *v9;
  void *v10;

  v10 = v9;
  a9.receiver = v10;
  a9.super_class = (Class)BSEventQueueLock;
  -[_Unwind_Exception dealloc](&a9, sel_dealloc);
  _Unwind_Resume(a1);
}

void sub_18A18C2D0(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_18A18C374(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_18A18C3E0(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_18A18C430(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_18A18C480(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_18A18C4E8(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void BSDispatchQueueAssert(void *a1)
{
  NSObject *queue;

  queue = a1;
  if (queue == MEMORY[0x1E0C80D38])
    BSDispatchQueueAssertMain();
  else
    dispatch_assert_queue_V2(queue);

}

void sub_18A18C544(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void BSDispatchQueueAssertMain()
{
  if ((objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread") & 1) == 0)
    dispatch_assert_queue_V2(MEMORY[0x1E0C80D38]);
}

void sub_18A18C6C8(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_18A18C768(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, void *a16)
{
  void *v16;

  _Unwind_Resume(a1);
}

void sub_18A18C7FC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, void *a16)
{
  void *v16;

  _Unwind_Resume(a1);
}

void sub_18A18C858(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_18A18C9D8(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

__CFString *NSStringFromBSTransactionState(unint64_t a1)
{
  if (a1 < 4)
    return off_1E1EBEE00[a1];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(%li)"), a1);
  return (__CFString *)(id)objc_claimAutoreleasedReturnValue();
}

void sub_18A18CB4C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_18A18CCB0(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_18A18CD4C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, void *a16)
{
  void *v16;

  _Unwind_Resume(a1);
}

void sub_18A18CE88(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_18A18CF6C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_18A18D030(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  void *v14;

  _Unwind_Resume(a1);
}

void sub_18A18D10C(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_18A18D294(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_18A18D444(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

double BSRectRoundForScale(double a1, double a2, double a3, double a4, double a5)
{
  double v9;

  v9 = BSFloatRoundForScale(a1, a5);
  BSFloatRoundForScale(a2, a5);
  BSFloatRoundForScale(a3, a5);
  BSFloatRoundForScale(a4, a5);
  return v9;
}

double BSSizeRoundForScale(double a1, double a2, double a3)
{
  double v5;

  v5 = BSFloatRoundForScale(a1, a3);
  BSFloatRoundForScale(a2, a3);
  return v5;
}

double BSFloatRoundForScale(double a1, double a2)
{
  double v4;
  void *v7;
  void *v8;

  v4 = fabs(a2);
  if (a2 <= 0.0 || v4 < 2.22044605e-16)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler", v4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "CGFloat BSFloatRoundForScale(CGFloat, CGFloat)");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "handleFailureInFunction:file:lineNumber:description:", v8, CFSTR("BSMath.m"), 65, CFSTR("Scale must be specified and cannot be less than or equal to 0."));

  }
  return round(a1 * a2) / a2;
}

void sub_18A18D830(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

BOOL BSInterfaceOrientationIsLandscape(uint64_t a1)
{
  return (unint64_t)(a1 - 3) < 2;
}

uint64_t BSSettingFlagForBool(uint64_t result)
{
  return result;
}

void sub_18A18D99C(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

uint64_t BSAtomicSetFlag(unsigned int a1, unsigned int *a2)
{
  unsigned int v2;
  uint64_t result;

  if (!a2)
    __assert_rtn("BSAtomicSetFlag", "BSAtomicUtilities.m", 23, "value && (sizeof(int32_t) == sizeof(*value))");
  while (1)
  {
    v2 = __ldxr(a2);
    if (v2 != (a1 ^ 1))
      break;
    if (!__stxr(a1, a2))
      return 1;
  }
  result = 0;
  __clrex();
  return result;
}

void sub_18A18DA8C(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_18A18DBF4(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_18A18DE14(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_18A18DF70(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_18A18E43C(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_18A18E980(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, _Unwind_Exception *exception_object)
{
  void *v10;
  void *v11;

  _Unwind_Resume(a1);
}

id _BSXPCDecodeObjectForKey(uint64_t a1, void *a2, objc_class *a3, _BYTE *a4)
{
  void *v8;
  id v9;
  id v10;
  const char *v11;
  id v12;
  id v13;
  void *v14;
  Class Class;
  objc_class *v16;
  void *v17;
  void *v18;
  void *v20;
  void *v21;
  void *v22;
  void *v23;

  if (!a2)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "NSObject *_BSXPCDecodeObjectForKey(BSXPCCoder *const __strong, NSString *const __strong, __unsafe_unretained Class, __unsafe_unretained Class)");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "handleFailureInFunction:file:lineNumber:description:", v21, CFSTR("BSXPCCoder.m"), 455, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("key != nil"));

  }
  v8 = *(void **)(a1 + 24);
  if (!v8)
    v8 = *(void **)(a1 + 8);
  v9 = v8;
  v10 = objc_retainAutorelease(a2);
  v11 = (const char *)objc_msgSend(v10, "UTF8String");
  v12 = v9;
  if (!v11)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "xpc_object_t  _Nullable BSXPCDictionaryGetValue(xpc_object_t  _Nullable __strong, const char * _Nonnull, xpc_type_t _Nullable)");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "handleFailureInFunction:file:lineNumber:description:", v23, CFSTR("BSXPCObjectUtilities.h"), 50, CFSTR("key must not be nil"));

  }
  v13 = v12;
  v14 = v13;
  if (v13
    && (Class = object_getClass(v13),
        v16 = (objc_class *)MEMORY[0x1E0C812F8],
        v14,
        v14,
        Class == v16))
  {
    xpc_dictionary_get_value(v14, v11);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v17 = 0;
  }

  _BSXPCDecodeObjectFromContext(a1, v17, (uint64_t)v10, a3, a4);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  return v18;
}

void sub_18A18ECDC(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

id _BSXPCDecodeObjectFromContext(uint64_t a1, void *a2, uint64_t a3, objc_class *a4, _BYTE *a5)
{
  void **v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  Class Class;
  id v18;
  NSObject *v19;
  void *v20;
  objc_class *v21;
  void *v22;
  void *v23;
  NSObject *v24;
  const __CFString *v25;
  NSObject *v26;
  void *v27;
  void *v28;
  id v30;
  id v31;
  NSObject *v32;
  objc_class *v33;
  void *v34;
  void *v35;
  void *v36;
  uint64_t v37;
  void *v38;
  id v39;
  char *v40;
  objc_class *v41;
  void *v42;
  void *v43;
  id v44;
  char *v45;
  char *v46;
  char *v47;
  NSObject *v48;
  void *v49;
  void *v50;
  uint64_t v51;
  void *v52;
  NSObject *v53;
  NSObject *v54;
  void *v55;
  void *v56;
  NSObject *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  uint64_t v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  int v69;
  id v70;
  Class aClass;
  uint8_t v72[4];
  uint64_t v73;
  _BYTE applier[24];
  __int128 v75;
  id v76;
  _BYTE *v77;
  _BYTE *v78;
  _BYTE buf[24];
  uint64_t (*v80)(uint64_t, uint64_t);
  void (*v81)(uint64_t);
  id v82;
  uint64_t v83;

  v83 = *MEMORY[0x1E0C80C00];
  if (!a4)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "NSObject *_BSXPCDecodeObjectFromContext(BSXPCCoder *const __strong, const __strong xpc_object_t, NSString *const __strong, __unsafe_unretained Class, __unsafe_unretained Class)");
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v59, "handleFailureInFunction:file:lineNumber:description:", v60, CFSTR("BSXPCCoder.m"), 461, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("expectedClass != nil"));

  }
  v9 = (void **)(a1 + 24);
  v10 = *(void **)(a1 + 24);
  if (!v10)
    v10 = *(void **)(a1 + 8);
  v70 = v10;
  v11 = (id)MEMORY[0x1E0C81288];
  if (a2)
    v12 = a2;
  else
    v12 = (void *)MEMORY[0x1E0C81288];
  objc_storeStrong((id *)(a1 + 24), v12);
  v13 = (void *)MEMORY[0x18D769AE0]();
  aClass = a4;
  if (!a4)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "NSObject *_BSXPCDecodeObject(BSXPCCoder *const __strong, __unsafe_unretained Class, __unsafe_unretained Class)");
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v61, "handleFailureInFunction:file:lineNumber:description:", v62, CFSTR("BSXPCCoder.m"), 493, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("expectedClass != nil"));

  }
  v14 = *v9;
  if (!*v9)
    v14 = *(void **)(a1 + 8);
  v15 = v14;
  v16 = v15;
  if (v15 == v11)
    goto LABEL_31;
  Class = object_getClass(v15);
  if ((-[objc_class isSubclassOfClass:](aClass, "isSubclassOfClass:", BSXPCObjectBaseClass()) & 1) != 0)
  {
    v18 = v16;
    goto LABEL_15;
  }
  if ((-[objc_class isSubclassOfClass:](aClass, "isSubclassOfClass:", objc_opt_class()) & 1) != 0
    || (-[objc_class isSubclassOfClass:](aClass, "isSubclassOfClass:", objc_opt_class()) & 1) != 0
    || (-[objc_class isSubclassOfClass:](aClass, "isSubclassOfClass:", objc_opt_class()) & 1) != 0)
  {
    if (!a5)
    {
      BSLogCommon();
      v26 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
      {
        NSStringFromClass(aClass);
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)applier = 138543362;
        *(_QWORD *)&applier[4] = v42;
        _os_log_error_impl(&dword_18A184000, v26, OS_LOG_TYPE_ERROR, "Attempted to decode a collection (%{public}@) without specifying the class it contains", applier, 0xCu);

      }
      v27 = (void *)MEMORY[0x1E0C99DA0];
      NSStringFromClass(aClass);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "raise:format:", *MEMORY[0x1E0C99778], CFSTR("Attempted to decode a collection (%@) without specifying the class it contains"), v22);
      v18 = 0;
      goto LABEL_35;
    }
    if (Class != (Class)MEMORY[0x1E0C812C8])
    {
      BSLogCommon();
      v24 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)applier = 0;
        _os_log_error_impl(&dword_18A184000, v24, OS_LOG_TYPE_ERROR, "Invalid decoding context for collection", applier, 2u);
      }
      v25 = CFSTR("Invalid decoding context for collection");
LABEL_29:

LABEL_30:
      objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], v25);
LABEL_31:
      v18 = 0;
      goto LABEL_36;
    }
    v30 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    *(_QWORD *)applier = MEMORY[0x1E0C809B0];
    *(_QWORD *)&applier[8] = 3221225472;
    *(_QWORD *)&applier[16] = ___BSXPCDecodeObject_block_invoke;
    *(_QWORD *)&v75 = &unk_1E1EC0260;
    *((_QWORD *)&v75 + 1) = a1;
    v77 = a5;
    v31 = v30;
    v76 = v31;
    if (xpc_array_apply(v16, applier))
    {
      v18 = (id)objc_msgSend([aClass alloc], "initWithArray:", v31);
    }
    else
    {
      BSLogCommon();
      v32 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_error_impl(&dword_18A184000, v32, OS_LOG_TYPE_ERROR, "Unable to decode array: an object within the array failed to decode", buf, 2u);
      }

      objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("Unable to decode array: an object within the array failed to decode"));
      v18 = 0;
    }

    goto LABEL_15;
  }
  if (-[objc_class isSubclassOfClass:](aClass, "isSubclassOfClass:", objc_opt_class()))
  {
    if (a5)
    {
      if (Class != (Class)MEMORY[0x1E0C812F8])
      {
        BSLogCommon();
        v24 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)applier = 0;
          _os_log_error_impl(&dword_18A184000, v24, OS_LOG_TYPE_ERROR, "Invalid decoding context for dictionary", applier, 2u);
        }
        v25 = CFSTR("Invalid decoding context for dictionary");
        goto LABEL_29;
      }
      *(_QWORD *)buf = 0;
      *(_QWORD *)&buf[8] = buf;
      *(_QWORD *)&buf[16] = 0x3032000000;
      v80 = __Block_byref_object_copy__9;
      v81 = __Block_byref_object_dispose__9;
      v82 = 0;
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      *(_QWORD *)applier = MEMORY[0x1E0C809B0];
      *(_QWORD *)&applier[8] = 3221225472;
      *(_QWORD *)&applier[16] = ___BSXPCDecodeObject_block_invoke_218;
      *(_QWORD *)&v75 = &unk_1E1EC0288;
      *((_QWORD *)&v75 + 1) = a1;
      v78 = a5;
      v44 = v43;
      v76 = v44;
      v77 = buf;
      if (xpc_dictionary_apply(v16, applier))
      {
        v18 = (id)objc_msgSend([aClass alloc], "initWithDictionary:", v44);
      }
      else
      {
        BSLogCommon();
        v53 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v53, OS_LOG_TYPE_ERROR))
        {
          v64 = *(_QWORD *)(*(_QWORD *)&buf[8] + 40);
          *(_DWORD *)v72 = 138543362;
          v73 = v64;
          _os_log_error_impl(&dword_18A184000, v53, OS_LOG_TYPE_ERROR, "Unable to decode dictionary key %{public}@", v72, 0xCu);
        }

        objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("Unable to decode dictionary key %@"), *(_QWORD *)(*(_QWORD *)&buf[8] + 40));
        v18 = 0;
      }

      _Block_object_dispose(buf, 8);
LABEL_15:
      if (!v18)
        goto LABEL_36;
      goto LABEL_16;
    }
    xpc_dictionary_get_value(v16, "root");
    v36 = (void *)objc_claimAutoreleasedReturnValue();

    if (v36)
    {
      if (Class != (Class)MEMORY[0x1E0C812F8])
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("decodingContextType == XPC_TYPE_DICTIONARY"));
        v67 = (void *)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
        {
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "NSObject *_BSXPCDecodeObject(BSXPCCoder *const __strong, __unsafe_unretained Class, __unsafe_unretained Class)");
          v68 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)applier = 138544130;
          *(_QWORD *)&applier[4] = v68;
          *(_WORD *)&applier[12] = 2114;
          *(_QWORD *)&applier[14] = CFSTR("BSXPCCoder.m");
          *(_WORD *)&applier[22] = 1024;
          LODWORD(v75) = 669;
          WORD2(v75) = 2114;
          *(_QWORD *)((char *)&v75 + 6) = v67;
          _os_log_error_impl(&dword_18A184000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ (%{public}@:%i) : %{public}@", applier, 0x26u);

        }
        qword_1EDF5BAE8 = objc_msgSend(objc_retainAutorelease(v67), "UTF8String");
        __break(0);
        JUMPOUT(0x18A18FA34);
      }
      goto LABEL_59;
    }
    goto LABEL_52;
  }
  if (Class != (Class)MEMORY[0x1E0C812F8])
    goto LABEL_52;
  v69 = -[objc_class supportsBSXPCSecureCoding](aClass, "supportsBSXPCSecureCoding");
  if ((v69 & 1) != 0)
  {
    v40 = (char *)BSCreateDeserializedStringFromXPCDictionaryWithKey(v16, "bsx_class");
    goto LABEL_63;
  }
  if (-[objc_class instancesRespondToSelector:](aClass, "instancesRespondToSelector:", sel_initWithXPCDictionary_)&& (-[objc_class instancesRespondToSelector:](aClass, "instancesRespondToSelector:", sel_encodeWithXPCDictionary_) & 1) != 0)
  {
    v40 = (char *)BSCreateDeserializedStringFromXPCDictionaryWithKey(v16, "bs_class");
    if (!NSClassFromString((NSString *)v40))
    {
      v45 = (char *)BSCreateDeserializedStringFromXPCDictionaryWithKey(v16, "bs_fallback");
      v46 = v45;
      if (v45)
      {
        v47 = v45;

        v40 = v47;
      }

    }
LABEL_63:
    if (v40 && (v41 = NSClassFromString((NSString *)v40)) != 0)
    {
      if (aClass == v41)
      {
LABEL_80:
        if (v69)
          v51 = objc_msgSend([v41 alloc], "initWithBSXPCCoder:", a1);
        else
          v51 = objc_msgSend([v41 alloc], "initWithXPCDictionary:", v16);
        v18 = (id)v51;

        goto LABEL_15;
      }
      if ((-[objc_class isSubclassOfClass:](aClass, "isSubclassOfClass:", v41) & 1) != 0)
      {
        v41 = aClass;
        goto LABEL_80;
      }
      if ((-[objc_class isSubclassOfClass:](v41, "isSubclassOfClass:", aClass) & 1) != 0)
        goto LABEL_80;
      BSLogCommon();
      v57 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v57, OS_LOG_TYPE_ERROR))
      {
        NSStringFromClass(aClass);
        v66 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)applier = 138543618;
        *(_QWORD *)&applier[4] = v40;
        *(_WORD *)&applier[12] = 2114;
        *(_QWORD *)&applier[14] = v66;
        _os_log_error_impl(&dword_18A184000, v57, OS_LOG_TYPE_ERROR, "Decoded class %{public}@ is not compatible with expected class %{public}@", applier, 0x16u);

      }
      v58 = (void *)MEMORY[0x1E0C99DA0];
      NSStringFromClass(aClass);
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v58, "raise:format:", *MEMORY[0x1E0C99778], CFSTR("Decoded class %@ is not compatible with expected class %@"), v40, v50);
    }
    else
    {
      BSLogCommon();
      v48 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v48, OS_LOG_TYPE_ERROR))
      {
        NSStringFromClass(aClass);
        v63 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)applier = 138543618;
        *(_QWORD *)&applier[4] = v40;
        *(_WORD *)&applier[12] = 2114;
        *(_QWORD *)&applier[14] = v63;
        _os_log_error_impl(&dword_18A184000, v48, OS_LOG_TYPE_ERROR, "Unable to reify decoded class %{public}@ for expected class %{public}@", applier, 0x16u);

      }
      v49 = (void *)MEMORY[0x1E0C99DA0];
      NSStringFromClass(aClass);
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v49, "raise:format:", *MEMORY[0x1E0C99778], CFSTR("Unable to reify decoded class %@ for expected class %@"), v40, v50);
    }

    v41 = 0;
    goto LABEL_80;
  }
  if (-[objc_class supportsSecureCoding](aClass, "supportsSecureCoding"))
  {
    xpc_dictionary_get_value(v16, "root");
    v52 = (void *)objc_claimAutoreleasedReturnValue();

    if (v52)
    {
      if (a5)
      {
        objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", aClass, a5, 0);
        v37 = objc_claimAutoreleasedReturnValue();
        goto LABEL_60;
      }
LABEL_59:
      objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:count:", &aClass, 1);
      v37 = objc_claimAutoreleasedReturnValue();
LABEL_60:
      v38 = (void *)v37;
      v39 = objc_alloc_init(MEMORY[0x1E0CB3B40]);
      objc_msgSend(v39, "beginReadingFromXPCObject:", v16);
      objc_msgSend(v39, "decodeObjectOfClasses:forKey:", v38, CFSTR("bsx"));
      v18 = (id)objc_claimAutoreleasedReturnValue();

      goto LABEL_15;
    }
LABEL_52:
    v18 = (id)_CFXPCCreateCFObjectFromXPCObject();
    if (!v18 && Class == (Class)MEMORY[0x1E0C81398])
      v18 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37E8]), "initWithUnsignedLongLong:", xpc_uint64_get_value(v16));
    if (v18)
    {
LABEL_16:
      if ((objc_opt_isKindOfClass() & 1) != 0)
        goto LABEL_36;
      BSLogCommon();
      v19 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      {
        v33 = (objc_class *)objc_opt_class();
        NSStringFromClass(v33);
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        NSStringFromClass(aClass);
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        *(_QWORD *)&buf[4] = v34;
        *(_WORD *)&buf[12] = 2114;
        *(_QWORD *)&buf[14] = v35;
        _os_log_error_impl(&dword_18A184000, v19, OS_LOG_TYPE_ERROR, "Decoded object class %{public}@ does not match expected class %{public}@", buf, 0x16u);

      }
      v20 = (void *)MEMORY[0x1E0C99DA0];
      v21 = (objc_class *)objc_opt_class();
      NSStringFromClass(v21);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromClass(aClass);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "raise:format:", *MEMORY[0x1E0C99778], CFSTR("Decoded object class %@ does not match expected class %@"), v22, v23);
      goto LABEL_20;
    }
    v25 = CFSTR("Invalid decoding context for <CFXPCBridge>");
    goto LABEL_30;
  }
  BSLogCommon();
  v54 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v54, OS_LOG_TYPE_ERROR))
  {
    NSStringFromClass(aClass);
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)applier = 138543362;
    *(_QWORD *)&applier[4] = v65;
    _os_log_error_impl(&dword_18A184000, v54, OS_LOG_TYPE_ERROR, "No valid encoding type could be determined for expected class: %{public}@", applier, 0xCu);

  }
  v55 = (void *)MEMORY[0x1E0C99DA0];
  NSStringFromClass(aClass);
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v55, "raise:format:", *MEMORY[0x1E0C99778], CFSTR("No valid encoding type could be determined for expected class: %@"), v56);

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "NSObject *_BSXPCDecodeObject(BSXPCCoder *const __strong, __unsafe_unretained Class, __unsafe_unretained Class)");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "handleFailureInFunction:file:lineNumber:description:", v23, CFSTR("BSXPCCoder.m"), 685, CFSTR("we should not have been able to vet the class without defining the encoding"));
  v18 = 0;
LABEL_20:

LABEL_35:
LABEL_36:

  objc_storeStrong((id *)(a1 + 24), v10);
  v28 = *(void **)(a1 + 24);
  if (v28 == *(void **)(a1 + 8))
  {
    *v9 = 0;

  }
  objc_autoreleasePoolPop(v13);

  return v18;
}

void sub_18A18FA44(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *exc_buf, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,int buf,uint64_t a28,__int16 a29,uint64_t a30,__int16 a31,uint64_t a32,uint64_t a33,uint64_t a34)
{
  void *v34;
  id v36;

  if (a2)
  {

    if (a2 == 2)
    {
      v36 = objc_begin_catch(a1);
      objc_exception_rethrow();
    }
    objc_begin_catch(a1);
    objc_exception_rethrow();
  }
  _Unwind_Resume(a1);
}

void sub_18A18FCDC(_Unwind_Exception *a1, int a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,__int128 a27,int a28,__int16 a29,__int16 a30,id a31)
{
  objc_class *v31;
  void *v32;
  id v33;
  NSObject *v34;
  _BOOL4 v35;
  void *v36;
  void *v37;

  if (a2)
  {
    objc_end_catch();

    if (a2 != 2)
    {
      objc_begin_catch(a1);
      JUMPOUT(0x18A18EFB0);
    }
    v33 = objc_begin_catch(a1);
    BSLogCommon();
    v34 = objc_claimAutoreleasedReturnValue();
    v35 = os_log_type_enabled(v34, OS_LOG_TYPE_ERROR);
    if (a14)
    {
      if (v35)
      {
        NSStringFromClass(v31);
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        LODWORD(a27) = 138543874;
        *(_QWORD *)((char *)&a27 + 4) = v37;
        WORD6(a27) = 2114;
        *(_QWORD *)((char *)&a27 + 14) = a14;
        a30 = 2114;
        a31 = v33;
        _os_log_error_impl(&dword_18A184000, v34, OS_LOG_TYPE_ERROR, "Exception thrown while decoding class %{public}@ for key \"%{public}@\": %{public}@", (uint8_t *)&a27, 0x20u);

      }
    }
    else if (v35)
    {
      NSStringFromClass(v31);
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(a27) = 138543618;
      *(_QWORD *)((char *)&a27 + 4) = v36;
      WORD6(a27) = 2114;
      *(_QWORD *)((char *)&a27 + 14) = v33;
      _os_log_error_impl(&dword_18A184000, v34, OS_LOG_TYPE_ERROR, "Exception thrown while decoding class %{public}@: %{public}@", (uint8_t *)&a27, 0x16u);

    }
    objc_exception_rethrow();
  }
  _Unwind_Resume(a1);
}

void sub_18A18FCEC(_Unwind_Exception *a1, int a2)
{
  if (a2)
    objc_terminate();
  _Unwind_Resume(a1);
}

void sub_18A18FD2C(_Unwind_Exception *a1, int a2)
{
  if (a2)
    JUMPOUT(0x18A18FD34);
  _Unwind_Resume(a1);
}

void sub_18A18FE54(_Unwind_Exception *a1, int a2)
{
  void *v2;
  void *v3;

  if (a2)
  {

    objc_end_catch();
    JUMPOUT(0x18A18FD44);
  }
  _Unwind_Resume(a1);
}

void _BSXPCEncodeObjectForKey(uint64_t a1, void *a2, void *a3)
{
  void *v6;
  objc_class *v7;
  void *v8;
  id v9;
  void *v10;
  id v11;
  xpc_object_t v12;
  id v13;
  void *v14;
  Class Class;
  objc_class *v16;
  void *v17;
  void *v18;
  Class v19;
  objc_class *v20;
  id v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t i;
  const char *v25;
  id v26;
  id v27;
  void *v28;
  id v29;
  id v30;
  void *v31;
  id v32;
  id v33;
  void *v34;
  id v35;
  void *v36;
  objc_class *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  _QWORD v42[5];
  _QWORD v43[6];
  _QWORD v44[6];
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  _BYTE v49[128];
  uint64_t v50;

  v50 = *MEMORY[0x1E0C80C00];
  v6 = (void *)MEMORY[0x18D769AE0]();
  v7 = (objc_class *)objc_opt_class();
  if (!a2 || (BSXPCObjectBaseClass(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    if ((objc_msgSend(a2, "isNSArray") & 1) == 0
      && (objc_msgSend(a2, "isNSSet") & 1) == 0
      && !objc_msgSend(a2, "isNSOrderedSet"))
    {
      if (objc_msgSend(a2, "isNSDictionary"))
      {
        v44[0] = MEMORY[0x1E0C809B0];
        v44[1] = 3221225472;
        v44[2] = ___BSXPCEncodeObjectForKey_block_invoke;
        v44[3] = &unk_1E1EC0238;
        v44[4] = a2;
        v44[5] = a1;
        _BSXPCEncodeDictionaryWithKey(a1, a3, (uint64_t)v44);
        goto LABEL_41;
      }
      if (objc_msgSend(a2, "supportsBSXPCSecureCoding"))
      {
        v43[0] = MEMORY[0x1E0C809B0];
        v43[1] = 3221225472;
        v43[2] = ___BSXPCEncodeObjectForKey_block_invoke_2;
        v43[3] = &unk_1E1EC0238;
        v43[4] = a2;
        v43[5] = a1;
        _BSXPCEncodeDictionaryWithKey(a1, a3, (uint64_t)v43);
        goto LABEL_41;
      }
      if ((objc_opt_respondsToSelector() & 1) != 0 && (objc_opt_respondsToSelector() & 1) != 0)
      {
        v42[0] = MEMORY[0x1E0C809B0];
        v42[1] = 3221225472;
        v42[2] = ___BSXPCEncodeObjectForKey_block_invoke_3;
        v42[3] = &unk_1E1EBEF28;
        v42[4] = a2;
        _BSXPCEncodeDictionaryWithKey(a1, a3, (uint64_t)v42);
        goto LABEL_41;
      }
      if (-[objc_class supportsSecureCoding](v7, "supportsSecureCoding"))
      {
        v9 = (id)_CFXPCCreateXPCObjectFromCFObject();
        if (!v9)
        {
          v33 = objc_alloc_init(MEMORY[0x1E0CB3B48]);
          objc_msgSend(v33, "beginEncoding");
          objc_msgSend(v33, "encodeObject:forKey:", a2, CFSTR("bsx"));
          objc_msgSend(v33, "finishEncoding");
          v9 = (id)objc_claimAutoreleasedReturnValue();

        }
        v34 = *(void **)(a1 + 24);
        if (!a3)
        {
          if (!v34)
            v34 = *(void **)(a1 + 8);
          xpc_array_append_value(v34, v9);
          goto LABEL_7;
        }
        if (!v34)
          v34 = *(void **)(a1 + 8);
        v35 = v34;
        xpc_dictionary_set_value(v35, (const char *)objc_msgSend(objc_retainAutorelease(a3), "UTF8String"), v9);
      }
      else
      {
        v36 = (void *)MEMORY[0x1E0C99DA0];
        v37 = (objc_class *)objc_opt_class();
        NSStringFromClass(v37);
        v9 = (id)objc_claimAutoreleasedReturnValue();
        NSStringFromClass(v7);
        v35 = (id)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v36, "raise:format:", *MEMORY[0x1E0C99778], CFSTR("%@ could not encode object %@ because it supports neither BSXPC[Secure]Coding nor NSSecureCoding."), v9, v35);
      }

LABEL_7:
      goto LABEL_41;
    }
    v10 = *(void **)(a1 + 24);
    if (!v10)
      v10 = *(void **)(a1 + 8);
    v11 = v10;
    v12 = xpc_array_create(0, 0);
    objc_storeStrong((id *)(a1 + 24), v12);
    v13 = v11;
    v14 = v13;
    if (a3)
    {
      if (!v13
        || (Class = object_getClass(v13),
            v16 = (objc_class *)MEMORY[0x1E0C812F8],
            v14,
            v14,
            Class != v16))
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "void _BSXPCEncodeCollectionWithKey(BSXPCCoder *const __strong, NSString *const __strong, const __strong id<NSFastEnumeration>)");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "handleFailureInFunction:file:lineNumber:description:", v18, CFSTR("BSXPCCoder.m"), 328, &stru_1E1EC08D0);
        goto LABEL_63;
      }
    }
    else if (!v13
           || (v19 = object_getClass(v13),
               v20 = (objc_class *)MEMORY[0x1E0C812C8],
               v14,
               v14,
               v19 != v20))
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "void _BSXPCEncodeCollectionWithKey(BSXPCCoder *const __strong, NSString *const __strong, const __strong id<NSFastEnumeration>)");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "handleFailureInFunction:file:lineNumber:description:", v18, CFSTR("BSXPCCoder.m"), 327, &stru_1E1EC08D0);
LABEL_63:

      if (!a2)
        goto LABEL_64;
      goto LABEL_23;
    }
    if (!a2)
    {
LABEL_64:
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "void _BSXPCEncodeCollectionWithKey(BSXPCCoder *const __strong, NSString *const __strong, const __strong id<NSFastEnumeration>)");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v39, "handleFailureInFunction:file:lineNumber:description:", v40, CFSTR("BSXPCCoder.m"), 329, &stru_1E1EC08D0);

    }
LABEL_23:
    v47 = 0u;
    v48 = 0u;
    v45 = 0u;
    v46 = 0u;
    v21 = a2;
    v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v45, v49, 16);
    if (v22)
    {
      v23 = *(_QWORD *)v46;
      do
      {
        for (i = 0; i != v22; ++i)
        {
          if (*(_QWORD *)v46 != v23)
            objc_enumerationMutation(v21);
          _BSXPCEncodeObjectForKey(a1, *(_QWORD *)(*((_QWORD *)&v45 + 1) + 8 * i), 0);
        }
        v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v45, v49, 16);
      }
      while (v22);
    }

    if (v12)
    {
      if (a3)
      {
        v25 = (const char *)objc_msgSend(objc_retainAutorelease(a3), "UTF8String");
        v26 = v14;
        v27 = v12;
        v28 = v27;
        if (v25)
        {
          if (v14 && object_getClass(v27) == (Class)MEMORY[0x1E0C812C8])
            xpc_dictionary_set_value(v26, v25, v28);
        }
        else
        {
          objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
          v41 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "void BSXPCDictionarySetValue(xpc_object_t  _Nullable __strong, const char * _Nonnull, xpc_object_t  _Nullable __strong, xpc_type_t _Nullable)");
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v41, "handleFailureInFunction:file:lineNumber:description:", v38, CFSTR("BSXPCObjectUtilities.h"), 61, CFSTR("key must not be nil"));

        }
      }
      else
      {
        v29 = v14;
        v30 = v12;
        if (v14)
        {
          v31 = v30;
          if (object_getClass(v30) == (Class)MEMORY[0x1E0C812C8])
            xpc_array_append_value(v29, v31);
        }
      }

    }
    v32 = _BSXPCPopEncodingContext(a1, v14);

    goto LABEL_41;
  }
  v8 = *(void **)(a1 + 24);
  if (a3)
  {
    if (!v8)
      v8 = *(void **)(a1 + 8);
    v9 = v8;
    xpc_dictionary_set_value(v9, (const char *)objc_msgSend(objc_retainAutorelease(a3), "UTF8String"), a2);
    goto LABEL_7;
  }
  if (!v8)
    v8 = *(void **)(a1 + 8);
  xpc_array_append_value(v8, a2);
LABEL_41:
  objc_autoreleasePoolPop(v6);
}

void sub_18A19053C(int a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, void *exc_buf, Class aClass, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,char a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint8_t buf,int a40,int a41,__int16 a42,int a43,__int16 a44,__int16 a45,uint64_t a46)
{
  __break(1u);
}

void sub_18A190804(_Unwind_Exception *a1, int a2)
{
  void *v2;

  if (a2)
  {

    objc_end_catch();
    JUMPOUT(0x18A1907D0);
  }
  _Unwind_Resume(a1);
}

id BSXPCObjectBaseClass()
{
  if (qword_1ECD399E0 != -1)
    dispatch_once(&qword_1ECD399E0, &__block_literal_global_22);
  return (id)_MergedGlobals_25;
}

void sub_18A190998(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

const char *BSDeserializeStringFromXPCDictionaryWithKey(void *a1, const char *a2)
{
  return (id)BSCreateDeserializedStringFromXPCDictionaryWithKey(a1, a2);
}

objc_class *BSCreateDeserializedBSXPCEncodableObjectFromXPCDictionaryWithKey(void *a1, const char *a2)
{
  id v3;
  void *v4;
  void *v5;
  objc_class *v6;

  v3 = a1;
  v4 = v3;
  if (v3)
  {
    xpc_dictionary_get_value(v3, a2);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = BSCreateDeserializedBSXPCEncodableObjectFromXPCDictionary(v5);

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

void sub_18A190A24(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

objc_class *BSCreateDeserializedBSXPCEncodableObjectFromXPCDictionary(void *a1)
{
  id v1;
  void *v2;
  objc_class *v3;
  NSString *v4;
  Class v5;
  NSString *v6;

  v1 = a1;
  v2 = v1;
  if (v1 && object_getClass(v1) == (Class)MEMORY[0x1E0C812F8])
  {
    v4 = (NSString *)BSCreateDeserializedStringFromXPCDictionaryWithKey(v2, "bs_class");
    v5 = NSClassFromString(v4);
    v3 = v5;
    if (v4 && !v5)
    {
      v6 = (NSString *)BSCreateDeserializedStringFromXPCDictionaryWithKey(v2, "bs_fallback");
      v3 = NSClassFromString(v6);

    }
    if (v3)
      v3 = (objc_class *)objc_msgSend([v3 alloc], "initWithXPCDictionary:", v2);

  }
  else
  {
    v3 = 0;
  }

  return v3;
}

void sub_18A190AF4(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

const char *BSCreateDeserializedStringFromXPCDictionaryWithKey(void *a1, const char *a2)
{
  id v3;
  void *v4;
  const char *string;

  v3 = a1;
  v4 = v3;
  if (v3)
  {
    string = xpc_dictionary_get_string(v3, a2);
    if (string)
      string = (const char *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithCString:encoding:", string, 4);
  }
  else
  {
    string = 0;
  }

  return string;
}

void sub_18A190B8C(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void _BSXPCEncodeDictionaryWithKey(uint64_t a1, void *a2, uint64_t a3)
{
  void *v6;
  id *v7;
  id v8;
  xpc_object_t v9;
  id v10;
  Class Class;
  objc_class *v12;
  void *v13;
  void *v14;
  Class v15;
  objc_class *v16;
  const char *v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  void *v23;
  void *v24;
  id v25;

  v7 = (id *)(a1 + 24);
  v6 = *(void **)(a1 + 24);
  if (!v6)
    v6 = *(void **)(a1 + 8);
  v8 = v6;
  v9 = xpc_dictionary_create(0, 0, 0);
  objc_storeStrong(v7, v9);
  v10 = v8;
  v25 = v10;
  if (a2)
  {
    if (!v10
      || (Class = object_getClass(v10),
          v12 = (objc_class *)MEMORY[0x1E0C812F8],
          v25,
          v25,
          Class != v12))
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "void _BSXPCEncodeDictionaryWithKey(BSXPCCoder *const __strong, NSString *const __strong, void (^const __strong)(__strong xpc_object_t))");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "handleFailureInFunction:file:lineNumber:description:", v14, CFSTR("BSXPCCoder.m"), 358, &stru_1E1EC08D0);
LABEL_22:

    }
  }
  else if (!v10
         || (v15 = object_getClass(v10),
             v16 = (objc_class *)MEMORY[0x1E0C812C8],
             v25,
             v25,
             v15 != v16))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "void _BSXPCEncodeDictionaryWithKey(BSXPCCoder *const __strong, NSString *const __strong, void (^const __strong)(__strong xpc_object_t))");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "handleFailureInFunction:file:lineNumber:description:", v14, CFSTR("BSXPCCoder.m"), 357, &stru_1E1EC08D0);
    goto LABEL_22;
  }
  (*(void (**)(uint64_t, xpc_object_t))(a3 + 16))(a3, v9);
  if (v9 && xpc_dictionary_get_count(v9))
  {
    if (a2)
    {
      v17 = (const char *)objc_msgSend(objc_retainAutorelease(a2), "UTF8String");
      v18 = v25;
      v19 = v9;
      if (v17)
      {
        if (v25 && object_getClass(v19) == (Class)MEMORY[0x1E0C812F8])
          xpc_dictionary_set_value(v18, v17, v19);
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "void BSXPCDictionarySetValue(xpc_object_t  _Nullable __strong, const char * _Nonnull, xpc_object_t  _Nullable __strong, xpc_type_t _Nullable)");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "handleFailureInFunction:file:lineNumber:description:", v24, CFSTR("BSXPCObjectUtilities.h"), 61, CFSTR("key must not be nil"));

      }
    }
    else
    {
      v20 = v25;
      v21 = v9;
      if (v25 && object_getClass(v21) == (Class)MEMORY[0x1E0C812F8])
        xpc_array_append_value(v20, v21);
    }

  }
  v22 = _BSXPCPopEncodingContext(a1, v25);

}

void sub_18A190E90(int a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, int a9, int a10, id a11)
{
  __break(1u);
}

void sub_18A190F50()
{
  void *v0;

  objc_end_catch();
  JUMPOUT(0x18A190F1CLL);
}

void sub_18A190F64()
{
  JUMPOUT(0x18A190F84);
}

void sub_18A190F6C()
{
  JUMPOUT(0x18A190F74);
}

id _BSXPCPopEncodingContext(uint64_t a1, void *a2)
{
  void *v4;
  id *v5;
  id v6;
  void *v7;

  v5 = (id *)(a1 + 24);
  v4 = *(void **)(a1 + 24);
  if (!v4)
    v4 = *(void **)(a1 + 8);
  v6 = v4;
  objc_storeStrong(v5, a2);
  v7 = *(void **)(a1 + 24);
  if (v7 == *(void **)(a1 + 8))
  {
    *v5 = 0;

  }
  return v6;
}

void sub_18A1911C8(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_18A1913E4(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_18A191590(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_18A1916D0(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_18A191724(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_18A191788(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_18A1917E8(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_18A191860(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

BOOL BSFloatIsOne(double a1)
{
  return fabs(a1 + -1.0) < 2.22044605e-16;
}

void sub_18A19199C(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_18A191A30(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_18A191AC8(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_18A191B64(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_18A191BF8(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_18A191CB8(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

uint64_t BSRectEqualToRect(double a1, double a2, double a3, double a4, double a5, double a6, double a7, double a8)
{
  double v17;
  _BOOL4 v19;

  if (CGRectEqualToRect(*(CGRect *)&a1, *(CGRect *)&a5))
    return 1;
  v17 = vabdd_f64(a2, a6);
  if (vabdd_f64(a1, a5) >= 2.22044605e-16 || v17 >= 2.22044605e-16)
    return 0;
  v19 = vabdd_f64(a3, a7) < 2.22044605e-16;
  return vabdd_f64(a4, a8) < 2.22044605e-16 && v19;
}

uint64_t BSSettingsDiffIsEmpty(void *a1)
{
  id v1;
  void *v2;
  uint64_t v3;

  v1 = a1;
  v2 = v1;
  if (v1)
    v3 = objc_msgSend(v1, "isEmpty");
  else
    v3 = 1;

  return v3;
}

void sub_18A191DAC(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

BOOL BSFloatGreaterThanFloat(double a1, double a2)
{
  return vabdd_f64(a1, a2) >= 2.22044605e-16 && a1 > a2;
}

BOOL BSFloatLessThanOrEqualToFloat(double a1, double a2)
{
  return vabdd_f64(a1, a2) < 2.22044605e-16 || a1 < a2;
}

void sub_18A1921F0(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_18A1924A8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, objc_super a9)
{
  void *v9;
  void *v10;
  void *v11;

  a9.super_class = (Class)BSBlockSentinel;
  -[_Unwind_Exception dealloc](&a9, sel_dealloc);
  _Unwind_Resume(a1);
}

void sub_18A193230(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, id a18, _Unwind_Exception *exception_object, void *a20,uint64_t a21,void *a22)
{
  void *v22;
  void *v23;

  _Unwind_Resume(a1);
}

void sub_18A1935F0(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_18A1937F4(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

id BSCollectionFind(void *a1, void *a2)
{
  id v3;
  uint64_t (**v4)(id, void *);
  id v5;
  id v6;
  uint64_t v7;
  void *i;
  void *v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v3 = a1;
  v4 = a2;
  if (v4)
  {
    v13 = 0u;
    v14 = 0u;
    v11 = 0u;
    v12 = 0u;
    v5 = v3;
    v6 = (id)objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    if (v6)
    {
      v7 = *(_QWORD *)v12;
      while (2)
      {
        for (i = 0; i != v6; i = (char *)i + 1)
        {
          if (*(_QWORD *)v12 != v7)
            objc_enumerationMutation(v5);
          v9 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * (_QWORD)i);
          if ((v4[2](v4, v9) & 1) != 0)
          {
            v6 = v9;
            goto LABEL_12;
          }
        }
        v6 = (id)objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
        if (v6)
          continue;
        break;
      }
    }
LABEL_12:

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

void sub_18A193974(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_18A1939FC(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_18A193A9C(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_18A193D8C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_18A194848(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, void *a16)
{
  void *v16;

  _Unwind_Resume(a1);
}

void sub_18A194AAC(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_18A194F20(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, void *a19, void *a20)
{
  void *v20;

  _Unwind_Resume(a1);
}

void sub_18A1952AC(uint64_t a1, int a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, void *a11)
{
  void *v11;
  void *v12;
  _Unwind_Exception *v13;

  if (a2)
  {

    objc_end_catch();
    JUMPOUT(0x18A19530CLL);
  }
  _Unwind_Resume(v13);
}

void sub_18A19531C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, void *a17)
{
  void *v17;
  _Unwind_Exception *v18;

  objc_end_catch();

  _Unwind_Resume(v18);
}

void sub_18A19567C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void *a9, void *a10, void *a11, void *a12)
{
  void *v12;
  void *v13;
  void *v14;

  _Unwind_Resume(a1);
}

void sub_18A195948(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

id BSLogCommon()
{
  if (BSLogCommon_onceToken != -1)
    dispatch_once(&BSLogCommon_onceToken, &__block_literal_global_3);
  return (id)BSLogCommon___logObj;
}

void sub_18A195B0C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

double BSMonotonicReferencedTimeFromMachTime(unint64_t a1)
{
  if (_MergedGlobals_9 != -1)
    dispatch_once_f(&_MergedGlobals_9, 0, (dispatch_function_t)__machTimeScaleInit);
  return *(double *)&qword_1ECD39840 * (double)a1;
}

uint64_t BSEqualArrays(CFArrayRef theArray, const __CFArray *a2)
{
  uint64_t result;
  CFIndex Count;

  if (theArray == a2)
    return 1;
  result = 0;
  if (theArray && a2)
  {
    Count = CFArrayGetCount(theArray);
    if (Count == CFArrayGetCount(a2))
      return -[__CFArray isEqualToArray:](theArray, "isEqualToArray:", a2);
    else
      return 0;
  }
  return result;
}

BOOL BSFloatGreaterThanOrEqualToFloat(double a1, double a2)
{
  return vabdd_f64(a1, a2) < 2.22044605e-16 || a1 > a2;
}

BOOL BSFloatApproximatelyEqualToFloat(double a1, double a2, double a3)
{
  double v3;

  v3 = vabdd_f64(a1, a2);
  return vabdd_f64(v3, a3) < 2.22044605e-16 || v3 < a3;
}

void sub_18A195F60(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_18A1960D8(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_18A1963D0(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  _Unwind_Resume(a1);
}

dispatch_queue_t BSDispatchQueueCreateSerialWithQoS(void *a1, uint64_t a2)
{
  id v3;
  void *v4;
  void *v5;
  dispatch_queue_t v6;

  v3 = a1;
  +[BSDispatchQueueAttributes serial](BSDispatchQueueAttributes, "serial");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "serviceClass:", a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = BSDispatchQueueCreate(v3, v5);

  return v6;
}

void sub_18A196528(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  v4 = v3;

  _Unwind_Resume(a1);
}

dispatch_queue_t BSDispatchQueueCreateSerial(void *a1)
{
  id v1;
  void *v2;
  dispatch_queue_t v3;

  v1 = a1;
  +[BSDispatchQueueAttributes serial](BSDispatchQueueAttributes, "serial");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = BSDispatchQueueCreate(v1, v2);

  return v3;
}

void sub_18A1965F8(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

dispatch_queue_t BSDispatchQueueCreate(void *a1, void *a2)
{
  id v3;
  dispatch_queue_t *v4;
  dispatch_queue_t v5;
  id v6;
  const char *v7;
  NSObject *v8;
  dispatch_queue_t v9;
  id v10;
  const char *v11;
  dispatch_queue_t v12;

  v3 = a1;
  v4 = a2;
  if (!v4)
  {
    +[BSDispatchQueueAttributes serial](BSDispatchQueueAttributes, "serial");
    v4 = (dispatch_queue_t *)objc_claimAutoreleasedReturnValue();
    if (!v4)
    {
      v10 = objc_retainAutorelease(v3);
      goto LABEL_6;
    }
  }
  v5 = v4[2];
  v6 = objc_retainAutorelease(v3);
  if (!v5)
  {
LABEL_6:
    v11 = (const char *)objc_msgSend(v3, "UTF8String");
    -[dispatch_queue_t attributes](v4, "attributes");
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = BSDispatchQueueCreateWithQualityOfService(v11, v8, QOS_CLASS_UNSPECIFIED, 0);
    goto LABEL_7;
  }
  v7 = (const char *)objc_msgSend(v6, "UTF8String");
  -[dispatch_queue_t attributes](v4, "attributes");
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = dispatch_queue_create_with_target_V2(v7, v8, v4[2]);
LABEL_7:
  v12 = v9;

  return v12;
}

void sub_18A1966EC(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

dispatch_queue_t BSDispatchQueueCreateWithQualityOfService(const char *a1, void *a2, dispatch_qos_class_t a3, int a4)
{
  NSObject *v5;
  dispatch_queue_t v6;

  _BSDispatchQueueAttributesForAttributes(a2, a3, a4);
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = dispatch_queue_create(a1, v5);

  return v6;
}

NSObject *_BSDispatchQueueAttributesForAttributes(void *a1, dispatch_qos_class_t a2, int a3)
{
  NSObject *v5;
  int v6;
  uint64_t v7;

  v5 = a1;
  if (v5)
  {
    if (a2 == QOS_CLASS_UNSPECIFIED)
      return v5;
  }
  else
  {
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v5 = objc_claimAutoreleasedReturnValue();
    if (a2 == QOS_CLASS_UNSPECIFIED)
      return v5;
  }
  if (a3 <= -15)
    v6 = -15;
  else
    v6 = a3;
  dispatch_queue_attr_make_with_qos_class(v5, a2, v6 & (v6 >> 31));
  v7 = objc_claimAutoreleasedReturnValue();

  v5 = v7;
  return v5;
}

id BSBundlePathForExecutablePath(void *a1)
{
  id v1;
  id v3;

  v3 = 0;
  v1 = _BSBundleInfoForExecutablePath(a1, &v3);
  return v3;
}

void sub_18A1968A4(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

id BSBundleIDForPID(uint64_t a1)
{
  void *v2;
  void *v3;

  if (getpid() == (_DWORD)a1)
  {
    objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "bundleIdentifier");
  }
  else
  {
    BSExecutablePathForPID(a1);
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    BSBundleIDForExecutablePath(v2);
  }
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

void sub_18A196920(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

uint64_t BSPIDIsBeingDebugged(int a1)
{
  BOOL v1;
  _OWORD v3[2];
  __int128 v4;
  __int128 v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  if (a1 < 1)
    return 0;
  v4 = 0u;
  v5 = 0u;
  memset(v3, 0, sizeof(v3));
  v1 = _BSShortBSDProcessInfoForPID(a1, v3);
  return *(_DWORD *)&v1 & ((v4 & 2) >> 1);
}

void sub_18A196A38(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

id BSProcessDescriptionForPID(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x1E0CB3940];
  BSProcessNameForPID(a1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringWithFormat:", CFSTR("%@.%d"), v3, a1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

void sub_18A196ABC(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

id BSProcessNameForPID(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  _OWORD v9[41];
  __int128 v10;
  _OWORD v11[3];
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  if (getpid() == (_DWORD)a1)
  {
    objc_msgSend(MEMORY[0x1E0CB3898], "processInfo");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "processName");
    v3 = (void *)objc_claimAutoreleasedReturnValue();

    return v3;
  }
  else if ((int)a1 < 1)
  {
    return 0;
  }
  else
  {
    v10 = 0u;
    memset(v11, 0, sizeof(v11));
    if (_BSShortBSDProcessInfoForPID(a1, &v10))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v11);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v5 = 0;
    }
    if (!objc_msgSend(v5, "length"))
    {
      memset(v9, 0, 512);
      if (_BSProcessInfoForPID(a1, v9))
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", (char *)&v9[15] + 3);
        v6 = objc_claimAutoreleasedReturnValue();

        v5 = (void *)v6;
      }
    }
    if (!objc_msgSend(v5, "length"))
    {
      BSExecutablePathForPID(a1);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "lastPathComponent");
      v8 = objc_claimAutoreleasedReturnValue();

      v5 = (void *)v8;
    }
    return v5;
  }
}

void sub_18A196C6C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  v3 = v2;

  _Unwind_Resume(a1);
}

BOOL _BSShortBSDProcessInfoForPID(int a1, void *a2)
{
  _BOOL8 result;
  NSObject *v5;
  int *v6;
  char *v7;
  _DWORD v8[2];
  __int16 v9;
  char *v10;
  uint64_t v11;

  result = 0;
  v11 = *MEMORY[0x1E0C80C00];
  if (a1 >= 1)
  {
    if (a2)
    {
      result = BSSandboxCanGetProcessInfo(a1);
      if (result)
      {
        if (proc_pidinfo(a1, 13, 0, a2, 64) == 64)
        {
          return 1;
        }
        else
        {
          BSLogCommon();
          v5 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
          {
            v6 = __error();
            v7 = strerror(*v6);
            v8[0] = 67109378;
            v8[1] = a1;
            v9 = 2082;
            v10 = v7;
            _os_log_error_impl(&dword_18A184000, v5, OS_LOG_TYPE_ERROR, "Unable to get short BSD proc info for %d: %{public}s", (uint8_t *)v8, 0x12u);
          }

          return 0;
        }
      }
    }
  }
  return result;
}

void sub_18A196DB0(_Unwind_Exception *exception_object)
{
  _Unwind_Resume(exception_object);
}

BOOL BSSandboxCanGetProcessInfo(int a1)
{
  if (getpid() == a1)
    return 1;
  if (qword_1ECD398E0 != -1)
    dispatch_once(&qword_1ECD398E0, &__block_literal_global_1_0);
  return byte_1ECD398D1 != 0;
}

id BSExecutablePathForPID(uint64_t a1)
{
  int v1;
  int v2;
  void *v3;
  int v4;
  void *v5;
  void *v6;
  _BYTE buffer[4096];
  uint64_t v9;

  v1 = MEMORY[0x1E0C80A78](a1);
  v9 = *MEMORY[0x1E0C80C00];
  if (v1 < 1)
  {
    v6 = 0;
  }
  else
  {
    v2 = v1;
    v3 = (void *)MEMORY[0x18D769AE0]();
    if (BSSandboxCanGetProcessInfo(v2) && (v4 = proc_pidpath(v2, buffer, 0x1000u), v4 >= 1))
    {
      v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithBytes:length:encoding:", buffer, v4, 4);
      objc_msgSend(v5, "stringByStandardizingPath");
      v6 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v6 = 0;
    }
    objc_autoreleasePoolPop(v3);
  }
  return v6;
}

void sub_18A196F28(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_18A196FD8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;
  void *v11;
  void *v12;

  v12 = v11;

  _Unwind_Resume(a1);
}

void sub_18A197050(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_18A1970F4(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void BSSerializeCFValueToXPCDictionaryWithKey(uint64_t a1, void *a2, const char *a3)
{
  void *v5;
  xpc_object_t xdict;

  xdict = a2;
  if (a1 && xdict && a3)
  {
    v5 = (void *)_CFXPCCreateXPCObjectFromCFObject();
    if (v5)
      xpc_dictionary_set_value(xdict, a3, v5);

  }
}

void sub_18A19717C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void sub_18A197234(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

id BSBundleIDForAuditToken(__int128 *a1)
{
  uint64_t v2;
  __int128 v3;
  void *v4;
  __int128 v5;
  void *v6;
  __int128 v8;
  __int128 v9;

  v2 = BSGetVersionedPID();
  v3 = a1[1];
  v8 = *a1;
  v9 = v3;
  if (v2 == BSVersionedPIDForAuditToken(&v8))
  {
    objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "bundleIdentifier");
  }
  else
  {
    v5 = a1[1];
    v8 = *a1;
    v9 = v5;
    BSExecutablePathForAuditToken();
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    BSBundleIDForExecutablePath(v4);
  }
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

void sub_18A1972E8(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

uint64_t BSGetVersionedPID()
{
  if (BSGetVersionedPID_onceToken != -1)
    dispatch_once(&BSGetVersionedPID_onceToken, &__block_literal_global_5);
  return BSGetVersionedPID___versionedPID;
}

void sub_18A197414(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

id BSExecutablePathForAuditToken()
{
  audit_token_t *v0;
  int v1;
  void *v2;
  int v3;
  void *v4;
  void *v5;
  _BYTE buffer[4096];
  uint64_t v8;

  v0 = (audit_token_t *)MEMORY[0x1E0C80A78]();
  v8 = *MEMORY[0x1E0C80C00];
  v1 = BSPIDForAuditToken(v0);
  if (v1 < 1)
  {
    v5 = 0;
  }
  else
  {
    v2 = (void *)MEMORY[0x18D769AE0]();
    if (BSSandboxCanGetProcessInfo(v1) && (v3 = proc_pidpath_audittoken(v0, buffer, 0x1000u), v3 >= 1))
    {
      v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithBytes:length:encoding:", buffer, v3, 4);
      objc_msgSend(v4, "stringByStandardizingPath");
      v5 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v5 = 0;
    }
    objc_autoreleasePoolPop(v2);
  }
  return v5;
}

void sub_18A19753C(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

uint64_t _BSProcessInfoForPID(int a1, void *a2)
{
  uint64_t v2;
  BOOL v5;
  NSObject *v6;
  int *v8;
  char *v9;
  size_t v10;
  uint8_t buf[4];
  int v12;
  __int16 v13;
  char *v14;
  int v15[2];
  int v16;
  int v17;
  uint64_t v18;

  v2 = 0;
  v18 = *MEMORY[0x1E0C80C00];
  if (a1 >= 1 && a2)
  {
    if (BSSandboxCanGetProcessInfo(a1))
    {
      v10 = 648;
      *(_QWORD *)v15 = 0xE00000001;
      v16 = 1;
      v17 = a1;
      if (sysctl(v15, 4u, a2, &v10, 0, 0))
        v5 = 0;
      else
        v5 = v10 == 648;
      v2 = v5;
      if (!v5)
      {
        BSLogCommon();
        v6 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
        {
          v8 = __error();
          v9 = strerror(*v8);
          *(_DWORD *)buf = 67109378;
          v12 = a1;
          v13 = 2082;
          v14 = v9;
          _os_log_error_impl(&dword_18A184000, v6, OS_LOG_TYPE_ERROR, "Unable to get proc info for %d: %{public}s", buf, 0x12u);
        }

      }
    }
    else
    {
      return 0;
    }
  }
  return v2;
}

void sub_18A1976A4(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_18A197B68(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, void *a11, uint64_t a12, id a13, void *a14)
{
  void *v14;

  _Unwind_Resume(a1);
}

void sub_18A197E24(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

id BSBundleIDForExecutablePath(void *a1)
{
  void *v1;
  void *v2;

  _BSBundleInfoForExecutablePath(a1, 0);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "bs_safeStringForKey:", *MEMORY[0x1E0C9AE78]);
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

void sub_18A197EA8(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_18A197F08(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

CFDictionaryRef _BSBundleInfoForExecutablePath(void *a1, _QWORD *a2)
{
  id v3;
  void *v4;
  const __CFURL *v5;
  void *v6;
  CFDictionaryRef v7;
  const __CFURL *v8;
  CFDictionaryRef v9;
  const __CFURL *v10;
  const __CFURL *v11;
  void *v12;
  void *v13;
  int v14;
  const __CFDictionary *v15;
  NSObject *v16;
  void *v17;
  void *v18;
  CFDictionaryRef v20;
  uint8_t buf[4];
  void *v22;
  __int16 v23;
  void *v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v3 = a1;
  objc_msgSend(v3, "stringByDeletingLastPathComponent");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (BSSandboxCanAccessPath(v4))
  {
    objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:isDirectory:", v3, 0);
    v5 = (const __CFURL *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      v6 = (void *)MEMORY[0x18D769AE0]();
      v7 = CFBundleCopyInfoDictionaryForURL(v5);
      if (-[__CFDictionary count](v7, "count"))
      {
        v8 = 0;
LABEL_18:
        v9 = v7;
        objc_autoreleasePoolPop(v6);
        if (a2)
        {
          -[__CFURL path](v8, "path");
          *a2 = (id)objc_claimAutoreleasedReturnValue();
        }

        goto LABEL_21;
      }
      v10 = (const __CFURL *)_CFBundleCopyBundleURLForExecutableURL();
      v11 = v10;
      if (!v10)
      {
        v8 = 0;
LABEL_17:

        goto LABEL_18;
      }
      v20 = CFBundleCopyInfoDictionaryInDirectory(v10);
      if (-[__CFDictionary count](v20, "count"))
      {
        -[__CFURL lastPathComponent](v5, "lastPathComponent");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        -[__CFDictionary bs_safeStringForKey:](v20, "bs_safeStringForKey:", *MEMORY[0x1E0C9AE70]);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = objc_msgSend(v12, "isEqualToString:", v13);

        if (v14)
        {
          v8 = v11;
          v15 = v20;

          v7 = v15;
LABEL_16:

          goto LABEL_17;
        }
        BSLogCommon();
        v16 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
        {
          -[__CFURL path](v11, "path");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v3, "lastPathComponent");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412546;
          v22 = v17;
          v23 = 2112;
          v24 = v18;
          _os_log_impl(&dword_18A184000, v16, OS_LOG_TYPE_DEFAULT, "Resolved bundle path %@ does not match executable %@", buf, 0x16u);

        }
      }
      v8 = 0;
      goto LABEL_16;
    }
  }
  v9 = 0;
  if (a2)
    *a2 = 0;
LABEL_21:

  return v9;
}

void sub_18A1981A0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;

  _Unwind_Resume(a1);
}

void sub_18A1983CC(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_18A198674(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, _Unwind_Exception *exception_object)
{
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  _Unwind_Resume(a1);
}

id BSStackFrameInfoForAddresss(const void *a1)
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  BSStackFrameInfo *v7;
  _QWORD *v8;
  id v9;
  id v10;
  uint64_t v11;
  void *v12;
  id v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  unint64_t v20;
  unint64_t v21;
  void *v22;
  uint64_t v23;
  void *v24;
  Dl_info v26;
  objc_super v27;

  pthread_mutex_lock(&__StackInfoLock);
  if (!__StackInfoCache)
  {
    v2 = objc_alloc_init(MEMORY[0x1E0C99D38]);
    v3 = (void *)__StackInfoCache;
    __StackInfoCache = (uint64_t)v2;

    objc_msgSend((id)__StackInfoCache, "setCountLimit:", 100);
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLong:", a1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)__StackInfoCache, "objectForKey:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
    v6 = (void *)MEMORY[0x18D769AE0]();
    v7 = [BSStackFrameInfo alloc];
    if (!v7
      || (v27.receiver = v7,
          v27.super_class = (Class)BSStackFrameInfo,
          v8 = objc_msgSendSuper2(&v27, sel_init),
          (v9 = v8) == 0))
    {
      v5 = 0;
      goto LABEL_21;
    }
    v8[2] = a1;
    memset(&v26, 0, sizeof(v26));
    if (dladdr(a1, &v26))
    {
      if (v26.dli_fname)
      {
        v10 = objc_alloc(MEMORY[0x1E0CB3940]);
        v11 = objc_msgSend(v10, "initWithUTF8String:", v26.dli_fname);
        v12 = (void *)*((_QWORD *)v9 + 4);
        *((_QWORD *)v9 + 4) = v11;

      }
      if (v26.dli_sname)
      {
        v13 = objc_alloc(MEMORY[0x1E0CB3940]);
        v14 = objc_msgSend(v13, "initWithUTF8String:", v26.dli_sname);
        v15 = (void *)*((_QWORD *)v9 + 1);
        *((_QWORD *)v9 + 1) = v14;

      }
      v16 = (void *)*((_QWORD *)v9 + 1);
      if (!v16)
        goto LABEL_20;
      BSPrettyFunctionName(objc_msgSend(v16, "UTF8String"));
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = objc_msgSend(v17, "copy");
      v19 = (void *)*((_QWORD *)v9 + 3);
      *((_QWORD *)v9 + 3) = v18;

      v20 = objc_msgSend(*((id *)v9 + 3), "rangeOfString:", CFSTR("["));
      v21 = objc_msgSend(*((id *)v9 + 3), "rangeOfString:", CFSTR(" "));
      v22 = 0;
      if (v20 != 0x7FFFFFFFFFFFFFFFLL && v21 != 0x7FFFFFFFFFFFFFFFLL && v20 < v21)
      {
        objc_msgSend(*((id *)v9 + 3), "substringWithRange:", v20 + 1, v21 + ~v20);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
      }
      v23 = objc_msgSend(v22, "copy");
      v24 = (void *)*((_QWORD *)v9 + 5);
      *((_QWORD *)v9 + 5) = v23;

    }
    else
    {
      v22 = v9;
      v9 = 0;
    }

LABEL_20:
    v5 = v9;
LABEL_21:
    objc_autoreleasePoolPop(v6);
    if (v5)
      objc_msgSend((id)__StackInfoCache, "setObject:forKey:", v5, v4);
  }
  pthread_mutex_unlock(&__StackInfoLock);

  return v5;
}

void sub_18A198910(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

BOOL BSSandboxCanAccessPath(void *a1)
{
  id v1;
  _BOOL8 v2;

  v1 = a1;
  if (v1)
  {
    getpid();
    objc_msgSend(objc_retainAutorelease(v1), "fileSystemRepresentation");
    v2 = sandbox_check() == 0;
  }
  else
  {
    v2 = 0;
  }

  return v2;
}

void sub_18A1989DC(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

id BSPrettyFunctionName(uint64_t a1)
{
  void *v1;
  void *v2;
  id v3;
  id v5;

  if (a1)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", a1);
    v1 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3900], "scannerWithString:", v1);
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v2, "scanString:intoString:", CFSTR("__"), 0))
    {
      objc_msgSend(v2, "scanInteger:", 0);
      v5 = v1;
      objc_msgSend(v2, "scanUpToString:intoString:", CFSTR("_block_invoke"), &v5);
      v3 = v5;

      v1 = v3;
    }

  }
  else
  {
    v1 = 0;
  }
  return v1;
}

void sub_18A198AA4(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_18A198B64(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_18A198C60(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_18A198D04(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_18A198E9C(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_18A198FEC(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_18A19908C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

BOOL BSPointEqualToPoint(double a1, double a2, double a3, double a4)
{
  _BOOL4 v4;

  v4 = vabdd_f64(a1, a3) < 2.22044605e-16;
  return vabdd_f64(a2, a4) < 2.22044605e-16 && v4;
}

id BSDeserializeCFValueFromXPCDictionaryWithKey(void *a1, const char *a2)
{
  return (id)BSCreateDeserializedCFValueFromXPCDictionaryWithKey(a1, a2);
}

uint64_t _bsxpc_auditToken_init()
{
  BSAuditToken *v0;
  __int128 v1;
  uint64_t result;
  _OWORD v3[2];

  v0 = [BSAuditToken alloc];
  *(_QWORD *)&v1 = -1;
  *((_QWORD *)&v1 + 1) = -1;
  v3[0] = v1;
  v3[1] = v1;
  qword_1ECD39948 = -[BSAuditToken initWithAuditToken:](v0, "initWithAuditToken:", v3);
  result = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3748]), "initWithKeyOptions:valueOptions:capacity:", 0, 1282, 16);
  qword_1ECD39950 = result;
  return result;
}

void sub_18A199280(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_18A1993CC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13, uint64_t a14, char a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, id a20)
{
  void *v20;

  _Block_object_dispose(&a15, 8);
  _Unwind_Resume(a1);
}

void sub_18A199570(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_18A1995E0(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

uint64_t BSXPCConnectionHasEntitlement(void *a1, void *a2)
{
  id v3;
  id v4;
  __int128 v5;
  void *v6;
  uint64_t v7;
  _OWORD v9[2];
  __int128 v10;
  __int128 v11;

  v3 = a1;
  v4 = a2;
  *(_QWORD *)&v5 = -1;
  *((_QWORD *)&v5 + 1) = -1;
  v10 = v5;
  v11 = v5;
  xpc_connection_get_audit_token();
  v9[0] = v10;
  v9[1] = v11;
  +[BSSecTask secTaskForAuditToken:]((uint64_t)BSSecTask, v9);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[BSSecTask BOOLForEntitlement:]((uint64_t)v6, v4);

  return v7;
}

void sub_18A19967C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_18A199744(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, void *a6, uint64_t a7, ...)
{
  void *v7;
  va_list va;

  va_start(va, a7);

  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_18A199838(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_18A199898(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_18A199930(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_18A1999AC(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

id BSSecTaskCopyEntitlementValue(__SecTask *a1, void *a2)
{
  __CFString *v3;
  void *v4;
  NSObject *v5;
  NSObject *v6;
  CFErrorRef error;
  uint8_t buf[4];
  CFErrorRef v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (a1)
  {
    error = 0;
    v4 = (void *)SecTaskCopyValueForEntitlement(a1, v3, &error);
    if (error)
    {
      BSLogCommon();
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543362;
        v10 = error;
        _os_log_error_impl(&dword_18A184000, v5, OS_LOG_TYPE_ERROR, "Unable to get entitlements for client task. Error: %{public}@", buf, 0xCu);
      }

      CFRelease(error);
    }
  }
  else
  {
    BSLogCommon();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_18A184000, v6, OS_LOG_TYPE_ERROR, "Unable to get security task", buf, 2u);
    }

    v4 = 0;
  }

  return v4;
}

void sub_18A199B00(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_18A199D5C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  v3 = v2;

  _Unwind_Resume(a1);
}

void sub_18A199DE4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_18A199E8C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_18A199F94(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_18A19A060(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_18A19A110(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, id a9)
{
  void *v9;

  _Unwind_Resume(a1);
}

void sub_18A19A178(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_18A19A1E4(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_18A19A34C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_18A19A3E8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_18A19A50C(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_18A19A5E0(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_18A19A7B4(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_18A19A86C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  v4 = v3;

  _Unwind_Resume(a1);
}

void sub_18A19A9B0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, void *a18)
{
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;

  v22 = v21;

  _Unwind_Resume(a1);
}

void BSSettingsDecodeSettingEntries(void *a1, void *a2)
{
  NSObject *v3;
  id v4;
  void (**v5)(_QWORD, _QWORD, _QWORD, _QWORD);
  Class Class;
  objc_class *v7;
  NSObject *v8;
  size_t count;
  size_t v10;
  NSObject *v11;
  NSObject *v12;
  NSObject *v13;
  size_t v14;
  NSObject *v15;
  NSObject *v16;
  uint64_t value;
  uint64_t v18;
  void *v19;
  NSObject *v20;
  uint8_t buf[4];
  const char *v22;
  __int16 v23;
  NSObject *v24;
  __int16 v25;
  NSObject *v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v3 = a1;
  v4 = a2;
  v5 = (void (**)(_QWORD, _QWORD, _QWORD, _QWORD))v4;
  if (!v3 || !v4)
    goto LABEL_7;
  Class = object_getClass(v3);
  v7 = (objc_class *)MEMORY[0x1E0C812C8];
  if (Class == (Class)MEMORY[0x1E0C812C8])
  {
    count = xpc_array_get_count(v3);
    if (!count)
      goto LABEL_7;
    v10 = 0;
    while (1)
    {
      xpc_array_get_value(v3, v10);
      v11 = objc_claimAutoreleasedReturnValue();
      v12 = v11;
      if (v11 && object_getClass(v11) == v7)
      {
        v14 = xpc_array_get_count(v12);
        if ((v14 & 0xFFFFFFFFFFFFFFFELL) == 2)
        {
          xpc_array_get_value(v12, 0);
          v15 = objc_claimAutoreleasedReturnValue();
          v13 = v15;
          if (!v15 || object_getClass(v15) != (Class)MEMORY[0x1E0C81398])
          {
            BSLogCommon();
            v16 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 136315650;
              v22 = "void BSSettingsDecodeSettingEntries(__strong xpc_object_t, __strong BSSettingDecodeBlock)";
              v23 = 2112;
              v24 = v13;
              v25 = 2114;
              v26 = v12;
              _os_log_error_impl(&dword_18A184000, v16, OS_LOG_TYPE_ERROR, "%s an encoded entry key format is unknown -> %@ : %{public}@", buf, 0x20u);
            }
            goto LABEL_30;
          }
          value = xpc_uint64_get_value(v13);
          xpc_array_get_value(v12, 1uLL);
          v18 = objc_claimAutoreleasedReturnValue();
          v16 = v18;
          if (v14 < 3)
          {
            v19 = 0;
            if (v18)
              goto LABEL_28;
LABEL_24:
            BSLogCommon();
            v20 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 136315394;
              v22 = "void BSSettingsDecodeSettingEntries(__strong xpc_object_t, __strong BSSettingDecodeBlock)";
              v23 = 2114;
              v24 = v12;
              _os_log_error_impl(&dword_18A184000, v20, OS_LOG_TYPE_ERROR, "%s the encoded entry was empty -> %{public}@", buf, 0x16u);
            }

          }
          else
          {
            xpc_array_get_value(v12, 2uLL);
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            if (!v16)
              goto LABEL_24;
LABEL_28:
            ((void (**)(_QWORD, uint64_t, NSObject *, void *))v5)[2](v5, value, v16, v19);
          }

LABEL_30:
          goto LABEL_13;
        }
        BSLogCommon();
        v13 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
        {
LABEL_21:
          *(_DWORD *)buf = 136315394;
          v22 = "void BSSettingsDecodeSettingEntries(__strong xpc_object_t, __strong BSSettingDecodeBlock)";
          v23 = 2114;
          v24 = v12;
          _os_log_error_impl(&dword_18A184000, v13, OS_LOG_TYPE_ERROR, "%s an encoded entry format is unknown -> %{public}@", buf, 0x16u);
        }
      }
      else
      {
        BSLogCommon();
        v13 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
          goto LABEL_21;
      }
LABEL_13:

      if (count == ++v10)
        goto LABEL_7;
    }
  }
  BSLogCommon();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315394;
    v22 = "void BSSettingsDecodeSettingEntries(__strong xpc_object_t, __strong BSSettingDecodeBlock)";
    v23 = 2114;
    v24 = v3;
    _os_log_error_impl(&dword_18A184000, v8, OS_LOG_TYPE_ERROR, "%s the encoded entries format is unknown -> %{public}@", buf, 0x16u);
  }

LABEL_7:
}

void sub_18A19ADC4(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  _Unwind_Resume(a1);
}

NSString *BSSettingsDecodeSettingObject(void *a1, void *a2)
{
  NSString *v3;
  NSString *v4;
  NSString *v5;
  int64_t value;
  void *v7;
  NSString *v8;
  NSString *v9;
  Class v10;
  NSString *v11;
  id v12;
  NSObject *v13;
  NSObject *v14;
  const char *v15;
  int v17;
  NSString *v18;
  __int16 v19;
  NSString *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v3 = a1;
  v4 = a2;
  v5 = v4;
  if (v4)
  {
    value = xpc_int64_get_value(v4);
    if (value == 2)
    {
      v12 = objc_alloc_init(MEMORY[0x1E0CB3B40]);
      objc_msgSend(v12, "beginReadingFromXPCObject:", v3);
      if (qword_1ECD39B50 != -1)
        dispatch_once(&qword_1ECD39B50, &__block_literal_global_189);
      objc_msgSend(v12, "decodeObjectOfClasses:forKey:", _MergedGlobals_37, CFSTR("__BSXPCSecureValue"));
      v11 = (NSString *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      if (value == 1)
      {
        +[BSXPCCoder coderWithMessage:](BSXPCCoder, "coderWithMessage:", v3);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "decodeStringForKey:", CFSTR("__BSXPCSecureClass"));
        v8 = (NSString *)objc_claimAutoreleasedReturnValue();
        v9 = v8;
        if (v8)
        {
          v10 = NSClassFromString(v8);
          if (v10)
          {
            objc_msgSend(v7, "decodeObjectOfClass:forKey:", v10, CFSTR("__BSXPCSecureValue"));
            v11 = (NSString *)objc_claimAutoreleasedReturnValue();
LABEL_18:

            goto LABEL_19;
          }
          BSLogCommon();
          v14 = objc_claimAutoreleasedReturnValue();
          if (!os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
          {
LABEL_17:

            v11 = 0;
            goto LABEL_18;
          }
          v17 = 138412290;
          v18 = v9;
          v15 = "unable to decode \"%@\" because this class does not exist";
        }
        else
        {
          BSLogCommon();
          v14 = objc_claimAutoreleasedReturnValue();
          if (!os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
            goto LABEL_17;
          v17 = 138412290;
          v18 = v3;
          v15 = "no class specified in message: %@";
        }
        _os_log_error_impl(&dword_18A184000, v14, OS_LOG_TYPE_ERROR, v15, (uint8_t *)&v17, 0xCu);
        goto LABEL_17;
      }
      BSLogCommon();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        v17 = 138412546;
        v18 = v5;
        v19 = 2112;
        v20 = v3;
        _os_log_error_impl(&dword_18A184000, v13, OS_LOG_TYPE_ERROR, "unknown coder type (%@) specified by message: %@", (uint8_t *)&v17, 0x16u);
      }

      v11 = 0;
    }
  }
  else
  {
    v11 = v3;
  }
LABEL_19:

  return v11;
}

void sub_18A19B094(_Unwind_Exception *a1, int a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, __int128 a9)
{
  void *v9;
  void *v10;
  void *v11;
  id v14;
  NSObject *v15;

  if (a2 == 1)
  {
    v14 = objc_begin_catch(a1);
    BSLogCommon();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      LODWORD(a9) = 138412290;
      *(_QWORD *)((char *)&a9 + 4) = v14;
      _os_log_error_impl(&dword_18A184000, v15, OS_LOG_TYPE_ERROR, "exception caught while decoding message: %@", (uint8_t *)&a9, 0xCu);
    }

    objc_end_catch();
    JUMPOUT(0x18A19AF54);
  }

  _Unwind_Resume(a1);
}

void sub_18A19B2F0(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  _Unwind_Resume(a1);
}

void sub_18A19B444(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  v5 = v4;

  _Unwind_Resume(a1);
}

void sub_18A19B558(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  v4 = v3;

  _Unwind_Resume(a1);
}

uint64_t BSCreateDeserializedCFValueFromXPCDictionaryWithKey(void *a1, const char *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;

  v3 = a1;
  v4 = v3;
  v5 = 0;
  if (v3 && a2)
  {
    xpc_dictionary_get_value(v3, a2);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      v5 = _CFXPCCreateCFObjectFromXPCObject();

    }
    else
    {
      v5 = 0;
    }
  }

  return v5;
}

void sub_18A19B608(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_18A19B734(_Unwind_Exception *exception_object)
{
  _Unwind_Resume(exception_object);
}

void sub_18A19BA30(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void sub_18A19BD10(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  _Unwind_Resume(a1);
}

uint64_t BSPIDForAuditToken(_OWORD *a1)
{
  __int128 v2;
  audit_token_t v4;

  if (!BSAuditTokenIsValid((uint64_t)a1))
    return 0xFFFFFFFFLL;
  v2 = a1[1];
  *(_OWORD *)v4.val = *a1;
  *(_OWORD *)&v4.val[4] = v2;
  return audit_token_to_pid(&v4);
}

void sub_18A19BE20(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void BSStoreTokenFromMessageToVar(uint64_t a1, void **a2)
{
  __int128 v3;
  void *v4;
  void *v5;
  _BYTE v6[38];
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  if (!a1)
  {
    v4 = (void *)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("message must not be nil"));
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)v6 = 138544130;
      *(_QWORD *)&v6[4] = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "void BSStoreTokenFromMessageToVar(xpc_object_t _Nonnull, BSAuditToken * _Nullable * _Nonnull)");
      *(_WORD *)&v6[12] = 2114;
      *(_QWORD *)&v6[14] = CFSTR("BSAuditTokenCaching.m");
      *(_WORD *)&v6[22] = 1024;
      *(_DWORD *)&v6[24] = 170;
      *(_WORD *)&v6[28] = 2114;
      *(_QWORD *)&v6[30] = v4;
      _os_log_error_impl(&dword_18A184000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ (%{public}@:%i) : %{public}@", v6, 0x26u);
    }
    qword_1EDF5BAE8 = objc_msgSend(v4, "UTF8String");
    __break(0);
    JUMPOUT(0x18A19C00CLL);
  }
  if (!a2)
  {
    v5 = (void *)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("var must not be nil"));
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)v6 = 138544130;
      *(_QWORD *)&v6[4] = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "void BSStoreTokenFromMessageToVar(xpc_object_t _Nonnull, BSAuditToken * _Nullable * _Nonnull)");
      *(_WORD *)&v6[12] = 2114;
      *(_QWORD *)&v6[14] = CFSTR("BSAuditTokenCaching.m");
      *(_WORD *)&v6[22] = 1024;
      *(_DWORD *)&v6[24] = 171;
      *(_WORD *)&v6[28] = 2114;
      *(_QWORD *)&v6[30] = v5;
      _os_log_error_impl(&dword_18A184000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ (%{public}@:%i) : %{public}@", v6, 0x26u);
    }
    qword_1EDF5BAE8 = objc_msgSend(v5, "UTF8String");
    __break(0);
    JUMPOUT(0x18A19C0C4);
  }
  *(_QWORD *)&v3 = -1;
  *((_QWORD *)&v3 + 1) = -1;
  *(_OWORD *)v6 = v3;
  *(_OWORD *)&v6[16] = v3;
  xpc_dictionary_get_audit_token();
  BSStoreRealTokenToVar((uint64_t)v6, a2);
}

void BSStoreRealTokenToVar(uint64_t a1, void **a2)
{
  void *v4;
  __int128 v5;
  BSAuditToken *v9;
  __int128 v10;
  void *v11;
  void *v12;
  _OWORD v13[2];
  uint8_t buf[40];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  if (!a1)
  {
    v11 = (void *)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("token must not be nil"));
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138544130;
      *(_QWORD *)&buf[4] = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "void BSStoreRealTokenToVar(const audit_token_t *, BSAuditToken **)");
      *(_WORD *)&buf[12] = 2114;
      *(_QWORD *)&buf[14] = CFSTR("BSAuditTokenCaching.m");
      *(_WORD *)&buf[22] = 1024;
      *(_DWORD *)&buf[24] = 126;
      *(_WORD *)&buf[28] = 2114;
      *(_QWORD *)&buf[30] = v11;
      _os_log_error_impl(&dword_18A184000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ (%{public}@:%i) : %{public}@", buf, 0x26u);
    }
    qword_1EDF5BAE8 = objc_msgSend(v11, "UTF8String");
    __break(0);
    JUMPOUT(0x18A19C2B0);
  }
  if (!a2)
  {
    v12 = (void *)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("var must not be nil"));
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138544130;
      *(_QWORD *)&buf[4] = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "void BSStoreRealTokenToVar(const audit_token_t *, BSAuditToken **)");
      *(_WORD *)&buf[12] = 2114;
      *(_QWORD *)&buf[14] = CFSTR("BSAuditTokenCaching.m");
      *(_WORD *)&buf[22] = 1024;
      *(_DWORD *)&buf[24] = 127;
      *(_WORD *)&buf[28] = 2114;
      *(_QWORD *)&buf[30] = v12;
      _os_log_error_impl(&dword_18A184000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ (%{public}@:%i) : %{public}@", buf, 0x26u);
    }
    qword_1EDF5BAE8 = objc_msgSend(v12, "UTF8String");
    __break(0);
    JUMPOUT(0x18A19C368);
  }
  if (qword_1ECD39958 != -1)
    dispatch_once_f(&qword_1ECD39958, 0, (dispatch_function_t)_bsxpc_auditToken_init);
  v4 = *a2;
  if (BSAuditTokenIsValid(a1))
  {
    memset(buf, 0, 32);
    if (v4)
    {
      objc_msgSend(v4, "realToken");
    }
    else
    {
      *(_QWORD *)&v5 = -1;
      *((_QWORD *)&v5 + 1) = -1;
      *(_OWORD *)buf = v5;
      *(_OWORD *)&buf[16] = v5;
    }
    if (*(_QWORD *)a1 != *(_QWORD *)buf
      || *(_QWORD *)(a1 + 8) != *(_QWORD *)&buf[8]
      || *(_QWORD *)(a1 + 16) != *(_QWORD *)&buf[16]
      || *(_QWORD *)(a1 + 24) != *(_QWORD *)&buf[24])
    {
      v9 = [BSAuditToken alloc];
      v10 = *(_OWORD *)(a1 + 16);
      v13[0] = *(_OWORD *)a1;
      v13[1] = v10;
      _BSStoreNewRetainedTokenToVar(-[BSAuditToken initWithAuditToken:](v9, "initWithAuditToken:", v13), a2);
    }
  }
  else if (v4 != (void *)qword_1ECD39948)
  {
    _BSStoreNewRetainedTokenToVar((id)qword_1ECD39948, a2);
  }
}

uint64_t BSVersionedPIDForAuditToken(_OWORD *a1)
{
  __int128 v2;
  uint64_t v3;
  __int128 v4;
  audit_token_t v6;

  if (!BSAuditTokenIsValid((uint64_t)a1))
    return -1;
  v2 = a1[1];
  *(_OWORD *)v6.val = *a1;
  *(_OWORD *)&v6.val[4] = v2;
  v3 = audit_token_to_pidversion(&v6);
  v4 = a1[1];
  *(_OWORD *)v6.val = *a1;
  *(_OWORD *)&v6.val[4] = v4;
  return audit_token_to_pid(&v6) | (unint64_t)(v3 << 32);
}

BOOL BSAuditTokenIsValid(uint64_t a1)
{
  __int128 v1;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v1 = *(_OWORD *)(a1 + 16);
  return (*(_QWORD *)a1 != v7 || *(_QWORD *)(a1 + 8) != v8 || (_QWORD)v1 != v9 || *((_QWORD *)&v1 + 1) != v10)
      && (*(_QWORD *)a1 & *(_QWORD *)(a1 + 8) & *(_QWORD *)(a1 + 16) & *(_QWORD *)(a1 + 24)) != -1;
}

void _BSStoreNewRetainedTokenToVar(void *a1, void **a2)
{
  void *v2;
  void *v3;
  char *v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  uint64_t v10;
  void *value;
  void *originalKey;
  uint8_t buf[4];
  uint64_t v14;
  __int16 v15;
  const __CFString *v16;
  __int16 v17;
  int v18;
  __int16 v19;
  void *v20;
  uint64_t v21;

  v2 = a1;
  v21 = *MEMORY[0x1E0C80C00];
  v3 = *a2;
  if (*a2 == a1)
  {
    v7 = (void *)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("constraint violation: new=%p should not be previous=%p"), a1, a1);
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138544130;
      v14 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "void _BSStoreNewRetainedTokenToVar(BSAuditToken *, BSAuditToken **)");
      v15 = 2114;
      v16 = CFSTR("BSAuditTokenCaching.m");
      v17 = 1024;
      v18 = 82;
      v19 = 2114;
      v20 = v7;
      _os_log_error_impl(&dword_18A184000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ (%{public}@:%i) : %{public}@", buf, 0x26u);
    }
    qword_1EDF5BAE8 = objc_msgSend(v7, "UTF8String");
    __break(0);
    goto LABEL_23;
  }
  value = 0;
  originalKey = 0;
  os_unfair_lock_lock((os_unfair_lock_t)&_MergedGlobals_21);
  if (v2 && (void *)qword_1ECD39948 != v2)
  {
    if (NSMapMember((NSMapTable *)qword_1ECD39950, v2, &originalKey, &value))
    {
      v5 = (char *)value + 1;
      value = (char *)value + 1;
      if (originalKey != v2)
      {
        v6 = originalKey;

        v5 = (char *)value;
        v2 = originalKey;
      }
      NSMapInsert((NSMapTable *)qword_1ECD39950, v2, v5);
    }
    else
    {
      value = (void *)1;
      NSMapInsertKnownAbsent((NSMapTable *)qword_1ECD39950, v2, (const void *)1);
    }
  }
  *a2 = v2;
  if (v3)
  {
    if (v3 == (void *)qword_1ECD39948)
    {
LABEL_15:

      goto LABEL_16;
    }
    if (NSMapMember((NSMapTable *)qword_1ECD39950, v3, &originalKey, &value))
    {
      if ((int)value < 2)
      {
        NSMapRemove((NSMapTable *)qword_1ECD39950, originalKey);
      }
      else
      {
        value = (char *)value - 1;
        NSMapInsert((NSMapTable *)qword_1ECD39950, originalKey, value);
      }
      goto LABEL_15;
    }
    v8 = (id)_bsxpc_auditTokens_desc(1);
    os_unfair_lock_unlock((os_unfair_lock_t)&_MergedGlobals_21);
    v9 = (void *)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("failed to find %@ in tokens %@"), v3, v8);
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      v10 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "void _BSStoreNewRetainedTokenToVar(BSAuditToken *, BSAuditToken **)");
      *(_DWORD *)buf = 138544130;
      v14 = v10;
      v15 = 2114;
      v16 = CFSTR("BSAuditTokenCaching.m");
      v17 = 1024;
      v18 = 117;
      v19 = 2114;
      v20 = v9;
      _os_log_error_impl(&dword_18A184000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ (%{public}@:%i) : %{public}@", buf, 0x26u);
    }
    qword_1EDF5BAE8 = objc_msgSend(v9, "UTF8String");
    __break(0);
LABEL_23:
    JUMPOUT(0x18A19C678);
  }
LABEL_16:
  os_unfair_lock_unlock((os_unfair_lock_t)&_MergedGlobals_21);
}

void sub_18A19C7B8(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_18A19C96C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_18A19CAB4(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_18A19CB70(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_18A19CCF4(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_18A19CE30(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, void *a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22)
{
  void *v22;

  _Unwind_Resume(a1);
}

void sub_18A19D028(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_18A19D20C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_18A19D3DC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void sub_18A19D930(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_18A19DAB4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, void *a16)
{
  void *v16;

  _Unwind_Resume(a1);
}

void sub_18A19DBD0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, void *a18)
{
  void *v18;

  _Unwind_Resume(a1);
}

void sub_18A19DCEC(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_18A19DEC8(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_18A19DF90(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, void *a16)
{
  void *v16;

  _Unwind_Resume(a1);
}

void sub_18A19E140(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_18A19E21C(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_18A19E2F4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, void *a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, void *a20)
{
  void *v20;

  _Unwind_Resume(a1);
}

void sub_18A19E460(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_18A19E6D0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_18A19E86C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;
  void *v11;

  _Unwind_Resume(a1);
}

void sub_18A19EC48(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, id a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, void *a17, void *a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24)
{
  void *v24;
  void *v25;
  void *v26;
  void *v27;

  v27 = v26;

  _Unwind_Resume(a1);
}

double BSDeserializeCGRectFromXPCDictionaryWithKey(void *a1, const char *a2)
{
  id v3;
  void *v4;
  double v5;
  void *v6;

  v3 = a1;
  v4 = v3;
  if (v3 && object_getClass(v3) == (Class)MEMORY[0x1E0C812F8])
  {
    xpc_dictionary_get_value(v4, a2);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = BSDeserializeCGRectFromXPCObject(v6);

  }
  else
  {
    v5 = *MEMORY[0x1E0C9D648];
  }

  return v5;
}

void sub_18A19EDD4(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

double BSDeserializeCGRectFromXPCObject(void *a1)
{
  id v1;
  void *v2;
  double v3;

  v1 = a1;
  v2 = v1;
  v3 = *MEMORY[0x1E0C9D648];
  if (v1 && object_getClass(v1) == (Class)MEMORY[0x1E0C812C8] && xpc_array_get_count(v2) == 4)
  {
    v3 = xpc_array_get_double(v2, 0);
    xpc_array_get_double(v2, 1uLL);
    xpc_array_get_double(v2, 2uLL);
    xpc_array_get_double(v2, 3uLL);
  }

  return v3;
}

void sub_18A19EEB0(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

double BSDegreesToRadians(double a1)
{
  return a1 * 0.0174532925;
}

void sub_18A19F110(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_18A19F204(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_18A19F334(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  _Unwind_Resume(a1);
}

void sub_18A19F404(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void *BSDeserializeArrayOfBSXPCEncodableObjectsFromXPCDictionaryWithKey(void *a1, const char *a2)
{
  return BSCreateDeserializedArrayFromXPCDictionaryWithKey(a1, a2, &__block_literal_global_20);
}

id BSDeserializeSetOfBSXPCEncodableObjectsFromXPCDictionaryWithKey(void *a1, const char *a2)
{
  return (id)BSCreateDeserializedSetFromXPCDictionaryWithKey(a1, a2, &__block_literal_global_23);
}

uint64_t BSCreateDeserializedSetFromXPCDictionaryWithKey(void *a1, const char *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  uint64_t v8;

  v5 = a1;
  v6 = a3;
  if (v5 && (v7 = BSCreateDeserializedArrayFromXPCDictionaryWithKey(v5, a2, v6)) != 0)
  {
    v8 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithArray:", v7);

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

void sub_18A19F4D4(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void *BSCreateDeserializedArrayFromXPCDictionaryWithKey(void *a1, const char *a2, void *a3)
{
  id v5;
  id v6;
  void (**v7)(_QWORD, _QWORD);
  void *v8;
  void *v9;
  void *v10;
  size_t count;
  size_t i;
  void *v14;
  void *v15;

  v5 = a1;
  v6 = a3;
  v7 = (void (**)(_QWORD, _QWORD))v6;
  v8 = 0;
  if (v5 && v6)
  {
    xpc_dictionary_get_value(v5, a2);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v9;
    if (v9 && object_getClass(v9) == (Class)MEMORY[0x1E0C812C8])
    {
      count = xpc_array_get_count(v10);
      v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", count);
      if (count)
      {
        for (i = 0; i != count; ++i)
        {
          xpc_array_get_value(v10, i);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          if (v14)
          {
            ((void (**)(_QWORD, void *))v7)[2](v7, v14);
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            if (v15)
              objc_msgSend(v8, "addObject:", v15);

          }
        }
      }
    }
    else
    {
      v8 = 0;
    }

  }
  return v8;
}

void sub_18A19F610(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

uint64_t BSSettingFlagIfYes(int a1)
{
  if (a1)
    return 1;
  else
    return 0x7FFFFFFFFFFFFFFFLL;
}

BOOL BSFloatLessThanFloat(double a1, double a2)
{
  return vabdd_f64(a1, a2) >= 2.22044605e-16 && a1 < a2;
}

uint64_t BSAtomicGetFlag(unsigned int *a1)
{
  unsigned int v1;
  uint64_t v2;

  if (!a1)
    __assert_rtn("BSAtomicGetFlag", "BSAtomicUtilities.m", 16, "value && (sizeof(int32_t) == sizeof(*value))");
  while (1)
  {
    v1 = __ldxr(a1);
    if (v1 != 1)
      break;
    v2 = 1;
    if (!__stxr(1u, a1))
      return v2;
  }
  v2 = 0;
  __clrex();
  return v2;
}

id BSCollectionMap(objc_class *a1, void *a2, void *a3)
{
  id v5;
  void (**v6)(id, _QWORD);
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (v6)
  {
    v7 = (void *)objc_msgSend([a1 alloc], "initWithCapacity:", objc_msgSend(v5, "count"));
    v17 = 0u;
    v18 = 0u;
    v15 = 0u;
    v16 = 0u;
    v8 = v5;
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    if (v9)
    {
      v10 = *(_QWORD *)v16;
      v11 = *MEMORY[0x1E0C9B0D0];
      do
      {
        for (i = 0; i != v9; ++i)
        {
          if (*(_QWORD *)v16 != v10)
            objc_enumerationMutation(v8);
          v6[2](v6, *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * i));
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          if (v13)
            objc_msgSend(v7, "addObject:", v13);
          else
            objc_msgSend(v7, "addObject:", v11, (_QWORD)v15);

        }
        v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      }
      while (v9);
    }

  }
  else
  {
    v7 = (void *)objc_msgSend(v5, "copyWithZone:", 0);
  }

  return v7;
}

void sub_18A19F9FC(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

id sbDefaults_getObject(void *a1, const char *a2)
{
  id v3;
  _QWORD *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;

  v3 = a1;
  -[BSAbstractDefaultDomain _propertyFromSelector:]((uint64_t)v3, a2);
  v4 = (_QWORD *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_store");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
    v6 = (void *)v4[7];
  else
    v6 = 0;
  v7 = v6;
  objc_msgSend(v5, "objectForKey:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_opt_isKindOfClass() & 1) == 0)
  {

    v8 = 0;
  }

  return v8;
}

void sub_18A19FB88(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

uint64_t sbDefaults_getLongLong(void *a1, const char *a2)
{
  id v3;
  _QWORD *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  uint64_t v9;

  v3 = a1;
  -[BSAbstractDefaultDomain _propertyFromSelector:]((uint64_t)v3, a2);
  v4 = (_QWORD *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_store");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
    v6 = (void *)v4[7];
  else
    v6 = 0;
  v7 = v6;
  objc_msgSend(v5, "objectForKey:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "longLongValue");

  return v9;
}

void sub_18A19FC70(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  _Unwind_Resume(a1);
}

void sub_18A19FD78(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_18A19FF68(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  v3 = v2;

  _Unwind_Resume(a1);
}

uint64_t sbDefaults_getBool(void *a1, const char *a2)
{
  id v3;
  _QWORD *v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;

  v3 = a1;
  -[BSAbstractDefaultDomain _propertyFromSelector:]((uint64_t)v3, a2);
  v4 = (_QWORD *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_store");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
    v6 = (void *)v4[7];
  else
    v6 = 0;
  v7 = v6;
  v8 = objc_msgSend(v5, "BOOLForKey:", v7);

  return v8;
}

void sub_18A1A006C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  _Unwind_Resume(a1);
}

void sub_18A1A022C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

id __getMetadataForClass(objc_class *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v5;
  void *v6;

  NSStringFromClass(a1);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  if (v1)
  {
    pthread_mutex_lock(&__classNameToSelectorLock);
    v2 = (void *)qword_1ECD398C8;
    if (qword_1ECD398C8)
      goto LABEL_3;
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "BSAbstractDefaultDomainClassMetadata *__getMetadataForClass(__unsafe_unretained Class)");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v6, CFSTR("BSAbstractDefaultDomain.m"), 54, CFSTR("Class metadata map is expected to have been initialized before using %@."), v1);

    v2 = (void *)qword_1ECD398C8;
    if (qword_1ECD398C8)
    {
LABEL_3:
      objc_msgSend(v2, "objectForKey:", v1);
      v3 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v3 = 0;
    }
    pthread_mutex_unlock(&__classNameToSelectorLock);
  }
  else
  {
    v3 = 0;
  }

  return v3;
}

void sub_18A1A0358(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_18A1A0440(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_18A1A04C4(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_18A1A05CC(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  char v3;
  id *v4;

  if ((v3 & 1) == 0)

  _Unwind_Resume(a1);
}

void sub_18A1A0644(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_18A1A0714(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_18A1A07AC(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_18A1A08F8(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_18A1A0C24(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_18A1A0CE0(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_18A1A0EA0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, _Unwind_Exception *exception_object, objc_super a15)
{
  void *v15;

  a15.super_class = (Class)BSSimpleAssertion;
  -[_Unwind_Exception dealloc](&a15, sel_dealloc);
  _Unwind_Resume(a1);
}

void sub_18A1A0EEC(_Unwind_Exception *a1, int a2)
{
  if (a2)
    objc_terminate();
  _Unwind_Resume(a1);
}

void sub_18A1A0FF0(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_18A1A110C(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_18A1A257C(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void BSSerializeSetToXPCDictionaryWithKey(void *a1, void *a2, const char *a3, void *a4)
{
  id v7;
  void *v8;
  id v9;

  v9 = a2;
  v7 = a4;
  objc_msgSend(a1, "allObjects");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  BSSerializeArrayToXPCDictionaryWithKey(v8, v9, a3, v7);

}

void sub_18A1A264C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;
  void *v11;

  _Unwind_Resume(a1);
}

void BSSerializeArrayToXPCDictionaryWithKey(void *a1, void *a2, const char *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  void (**v10)(_QWORD, _QWORD);
  xpc_object_t v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v7 = a1;
  v8 = a2;
  v9 = a4;
  v10 = (void (**)(_QWORD, _QWORD))v9;
  if (a3 && v8 && v9 && objc_msgSend(v7, "count"))
  {
    v11 = xpc_array_create(0, 0);
    v19 = 0u;
    v20 = 0u;
    v17 = 0u;
    v18 = 0u;
    v12 = v7;
    v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    if (v13)
    {
      v14 = *(_QWORD *)v18;
      do
      {
        v15 = 0;
        do
        {
          if (*(_QWORD *)v18 != v14)
            objc_enumerationMutation(v12);
          v10[2](v10, *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * v15));
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          if (v16)
            xpc_array_append_value(v11, v16);

          ++v15;
        }
        while (v13 != v15);
        v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
      }
      while (v13);
    }

    xpc_dictionary_set_value(v8, a3, v11);
  }

}

void sub_18A1A27F4(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  _Unwind_Resume(a1);
}

void sub_18A1A2900(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void BSSerializeBSXPCEncodableObjectToXPCDictionaryWithKey(void *a1, void *a2, const char *a3)
{
  id v5;
  xpc_object_t v6;
  id v7;

  v7 = a1;
  v5 = a2;
  if (v5 && v7 && a3)
  {
    v6 = BSCreateSerializedBSXPCEncodableObject(v7);
    if (v6)
      xpc_dictionary_set_value(v5, a3, v6);

  }
}

void sub_18A1A2998(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;
  void *v11;

  _Unwind_Resume(a1);
}

xpc_object_t BSCreateSerializedBSXPCEncodableObject(void *a1)
{
  id v1;
  xpc_object_t v2;
  xpc_object_t v3;
  id v4;

  v1 = a1;
  v2 = xpc_dictionary_create(0, 0, 0);
  v3 = v2;
  if (v1 && v2)
    v4 = BSSerializeBSXPCEncodableObjectToXPCDictionary(v1, v2);

  return v3;
}

void sub_18A1A2A1C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_18A1A2AA0(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_18A1A2BDC(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_18A1A2CA4(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);

  _Unwind_Resume(a1);
}

void sub_18A1A2DF4(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_18A1A2F3C(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_18A1A2FE0(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_18A1A302C(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_18A1A30EC(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_18A1A3200(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

BOOL BSMachPortIsType(mach_port_name_t name, int a2)
{
  uint64_t v2;
  uint64_t v3;
  mach_error_t v6;
  mach_port_type_t ptype;
  uint64_t v9;
  uint64_t v10;

  if (name - 1 > 0xFFFFFFFD)
    return 0;
  v9 = v2;
  v10 = v3;
  ptype = 0;
  v6 = mach_port_type(*MEMORY[0x1E0C83DA0], name, &ptype);
  if (v6)
    _BSMachError(name, v6, CFSTR("Port has no valid type"));
  return (ptype & a2) != 0;
}

uint64_t _BSMachPortTypeEncode(int a1, uint64_t a2, _BYTE *a3)
{
  switch(a1)
  {
    case 3:
      *a3 = 0;
      return xpc_mach_send_create();
    case 2:
      *a3 = 1;
      return xpc_mach_send_once_create();
    case 1:
      *a3 = 1;
      return xpc_mach_recv_create();
    default:
      *a3 = 0;
      return 0;
  }
}

BOOL BSPIDExists(int a1)
{
  _OWORD v3[4];
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  if (getpid() == a1)
    return 1;
  if (a1 < 1)
    return 0;
  memset(v3, 0, sizeof(v3));
  return _BSShortBSDProcessInfoForPID(a1, v3);
}

void sub_18A1A3434(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_18A1A34D4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, objc_super a9)
{
  a9.super_class = (Class)BSSecTask;
  -[_Unwind_Exception dealloc](&a9, sel_dealloc);
  _Unwind_Resume(a1);
}

void sub_18A1A3608(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, objc_super a9)
{
  void *v9;
  void *v10;

  v10 = v9;
  a9.receiver = v10;
  a9.super_class = (Class)BSAbstractDefaultDomain;
  -[_Unwind_Exception dealloc](&a9, sel_dealloc);
  _Unwind_Resume(a1);
}

void sub_18A1A3724(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  _Unwind_Resume(a1);
}

void sub_18A1A3928(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_18A1A3B60(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_18A1A3C70(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{

  _Unwind_Resume(a1);
}

void sub_18A1A3E1C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void BSIntegerMapRemoveAllObjects(void *a1)
{
  id v1;
  void *v2;
  void *v3;
  void *v4;
  _QWORD *v5;

  v1 = a1;
  v5 = v1;
  if (!v1)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "void BSIntegerMapRemoveAllObjects(BSMutableIntegerMap *__strong _Nonnull)");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v4, CFSTR("BSIntegerMap.m"), 254, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("map"));

    v1 = 0;
  }
  objc_msgSend(*((id *)v1 + 1), "removeAllObjects");
  v2 = (void *)v5[2];
  v5[2] = 0;

}

void sub_18A1A3F50(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;
  void *v11;

  _Unwind_Resume(a1);
}

void sub_18A1A3FC4(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_18A1A401C(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_18A1A41D0(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_18A1A4248(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_18A1A4918(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_18A1A4CE0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, objc_super a15)
{
  void *v15;
  void *v16;

  a15.super_class = (Class)BSTransaction;
  -[_Unwind_Exception dealloc](&a15, sel_dealloc);
  _Unwind_Resume(a1);
}

void sub_18A1A4E2C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void sub_18A1A535C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_18A1A5444(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_18A1A567C(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_18A1A5834(_Unwind_Exception *exception_object)
{
  _Unwind_Resume(exception_object);
}

void sub_18A1A58FC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13)
{
  void *v13;

  _Unwind_Resume(a1);
}

void sub_18A1A5A6C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_18A1A5E08(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_18A1A5EB8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_18A1A6090(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

id BSDescribeAppendFieldFormat(uint64_t a1, __CFString *a2, const __CFString *a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
  _QWORD *v12;
  _QWORD *v13;
  uint64_t v14;
  const char *v15;
  uint64_t v16;
  const char *v17;
  uint64_t v18;
  CFMutableStringRef *v19;
  const char *v20;
  uint64_t v21;
  const char *v22;
  uint64_t v23;
  const char *v24;
  size_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  CFIndex v30;
  uint64_t v31;
  CFIndex v32;
  int *v33;
  unint64_t v34;
  uint64_t v35;
  const char *v36;
  uint64_t v37;
  uint64_t v38;
  const char *v39;
  uint64_t v40;
  uint64_t v41;
  const char *v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v46;
  uint64_t v47;
  CFIndex usedBufLen;
  CFRange v50;
  CFRange v51;

  v12 = *(id *)(a1 + 8);
  switch(*(_QWORD *)(a1 + 1104))
  {
    case 1:
      v13 = (_QWORD *)(a1 + 1040);
      v14 = *(_QWORD *)(a1 + 1040);
      v15 = (const char *)(a1 + 16);
      if (*(_QWORD *)(*(_QWORD *)(a1 + 8) + 24) == 3)
      {
        if (v14 > 1022)
        {
          v15[v14] = 0;
          CFStringAppendCString(*(CFMutableStringRef *)(a1 + 1064), v15, 0x8000100u);
          *(_QWORD *)(a1 + 1040) = 0;
          CFStringAppendCString(*(CFMutableStringRef *)(a1 + 1064), ";", 0x8000100u);
        }
        else
        {
          v15[v14] = 59;
          ++*v13;
        }
        goto LABEL_11;
      }
      if (v14 <= 1021)
      {
        *(_WORD *)&v15[v14] = 8251;
        v18 = 2;
        goto LABEL_19;
      }
      v15[v14] = 0;
      CFStringAppendCString(*(CFMutableStringRef *)(a1 + 1064), v15, 0x8000100u);
      v19 = (CFMutableStringRef *)(a1 + 1064);
      v20 = "; ";
      goto LABEL_24;
    case 2:
      v13 = (_QWORD *)(a1 + 1040);
      v16 = *(_QWORD *)(a1 + 1040);
      v17 = (const char *)(a1 + 16);
      if (v16 <= 1022)
      {
        v17[v16] = 32;
        v18 = 1;
        goto LABEL_19;
      }
      v17[v16] = 0;
      CFStringAppendCString(*(CFMutableStringRef *)(a1 + 1064), v17, 0x8000100u);
      v19 = (CFMutableStringRef *)(a1 + 1064);
      v20 = " ";
LABEL_24:
      *v13 = 0;
      CFStringAppendCString(*v19, v20, 0x8000100u);
      break;
    case 3:
LABEL_11:
      v21 = *(_QWORD *)(a1 + 1040);
      v22 = (const char *)(a1 + 16);
      if (v21 > 1022)
      {
        v22[v21] = 0;
        CFStringAppendCString(*(CFMutableStringRef *)(a1 + 1064), v22, 0x8000100u);
        *(_QWORD *)(a1 + 1040) = 0;
        CFStringAppendCString(*(CFMutableStringRef *)(a1 + 1064), "\n", 0x8000100u);
      }
      else
      {
        v22[v21] = 10;
        ++*(_QWORD *)(a1 + 1040);
      }
      goto LABEL_14;
    case 4:
LABEL_14:
      v23 = *(_QWORD *)(a1 + 1072);
      if (v23 < 1)
        break;
      if (v23 >= 8)
        v23 = 8;
      v24 = (const char *)*((_QWORD *)&sIndentSpaceStrings + v23);
      v25 = strlen(v24);
      v13 = (_QWORD *)(a1 + 1040);
      v26 = *(_QWORD *)(a1 + 1040);
      if ((uint64_t)(v26 + v25) > 1023)
      {
        if (v26 >= 1)
        {
          *(_BYTE *)(a1 + 16 + v26) = 0;
          CFStringAppendCString(*(CFMutableStringRef *)(a1 + 1064), (const char *)(a1 + 16), 0x8000100u);
          *v13 = 0;
        }
        CFStringAppendCString(*(CFMutableStringRef *)(a1 + 1064), v24, 0x8000100u);
      }
      else
      {
        v18 = v25;
        memcpy((void *)(a1 + v26 + 16), v24, v25);
LABEL_19:
        *v13 += v18;
      }
      break;
    default:
      goto LABEL_26;
  }
  *(_QWORD *)(a1 + 1104) = 0;
LABEL_26:
  if (!a2)
    goto LABEL_58;
  v27 = v12[6];
  v28 = v12[7];
  if (v27 < 2 || v28 < 1)
  {
    *(_QWORD *)(a1 + 1096) = 0;
  }
  else
  {
    *(_QWORD *)(a1 + 1096) = v27;
    *(_QWORD *)(a1 + 1080) = *(_QWORD *)(a1 + 1040) + objc_msgSend(*(id *)(a1 + 1064), "length");
    *(_QWORD *)(a1 + 1088) = v28;
  }
  v30 = -[__CFString length](a2, "length");
  v31 = *(_QWORD *)(a1 + 1040);
  if (v31 + 3 * v30 > 1023)
  {
    if (v31 >= 1)
    {
      *(_BYTE *)(a1 + 16 + v31) = 0;
      CFStringAppendCString(*(CFMutableStringRef *)(a1 + 1064), (const char *)(a1 + 16), 0x8000100u);
      *(_QWORD *)(a1 + 1040) = 0;
    }
    if (v30 > 341)
    {
      objc_msgSend(*(id *)(a1 + 1064), "appendString:", a2);
      goto LABEL_41;
    }
    usedBufLen = 0;
    v51.location = 0;
    v51.length = v30;
    CFStringGetBytes(a2, v51, 0x8000100u, 0, 0, (UInt8 *)(a1 + 16), 1024, &usedBufLen);
    v32 = usedBufLen;
  }
  else
  {
    usedBufLen = 0;
    v50.location = 0;
    v50.length = v30;
    CFStringGetBytes(a2, v50, 0x8000100u, 0, 0, (UInt8 *)(a1 + v31 + 16), 1024 - v31, &usedBufLen);
    v32 = *(_QWORD *)(a1 + 1040) + usedBufLen;
  }
  *(_QWORD *)(a1 + 1040) = v32;
LABEL_41:
  BSDescribeTruncationCommit(a1);
  if (*(uint64_t *)(a1 + 1048) <= 0)
    v33 = &OBJC_IVAR___BSDescriptionStyle__bodyItemSeparator;
  else
    v33 = &OBJC_IVAR___BSDescriptionStyle__proemItemSeparator;
  v34 = *(_QWORD *)(*(_QWORD *)(a1 + 8) + *v33);
  if (v34 < 2)
  {
    v38 = *(_QWORD *)(a1 + 1040);
    v39 = (const char *)(a1 + 16);
    if (v38 <= 1021)
    {
      *(_WORD *)&v39[v38] = 8250;
      v37 = 2;
      goto LABEL_53;
    }
    v39[v38] = 0;
    CFStringAppendCString(*(CFMutableStringRef *)(a1 + 1064), v39, 0x8000100u);
    v42 = ": ";
  }
  else if (v34 == 2)
  {
    v40 = *(_QWORD *)(a1 + 1040);
    v41 = a1 + 16 + v40;
    if (v40 <= 1020)
    {
      *(_BYTE *)(v41 + 2) = 32;
      *(_WORD *)v41 = 15648;
      v37 = 3;
      goto LABEL_53;
    }
    *(_BYTE *)v41 = 0;
    CFStringAppendCString(*(CFMutableStringRef *)(a1 + 1064), (const char *)(a1 + 16), 0x8000100u);
    v42 = " = ";
  }
  else
  {
    if (v34 != 3)
      goto LABEL_58;
    v35 = *(_QWORD *)(a1 + 1040);
    v36 = (const char *)(a1 + 16);
    if (v35 <= 1019)
    {
      *(_DWORD *)&v36[v35] = 540945696;
      v37 = 4;
LABEL_53:
      *(_QWORD *)(a1 + 1040) += v37;
      goto LABEL_58;
    }
    v36[v35] = 0;
    CFStringAppendCString(*(CFMutableStringRef *)(a1 + 1064), v36, 0x8000100u);
    v42 = " -> ";
  }
  *(_QWORD *)(a1 + 1040) = 0;
  CFStringAppendCString(*(CFMutableStringRef *)(a1 + 1064), v42, 0x8000100u);
LABEL_58:
  v43 = v12[8];
  v44 = v12[9];
  if (v43 <= 1 || v44 < 1)
  {
    v44 = 0;
    v46 = 1096;
  }
  else
  {
    *(_QWORD *)(a1 + 1096) = v43;
    *(_QWORD *)(a1 + 1080) = *(_QWORD *)(a1 + 1040) + objc_msgSend(*(id *)(a1 + 1064), "length");
    v46 = 1088;
  }
  *(_QWORD *)(a1 + v46) = v44;

  v47 = *(_QWORD *)(a1 + 1040);
  if (v47 >= 1)
  {
    *(_BYTE *)(a1 + 16 + v47) = 0;
    CFStringAppendCString(*(CFMutableStringRef *)(a1 + 1064), (const char *)(a1 + 16), 0x8000100u);
    *(_QWORD *)(a1 + 1040) = 0;
  }
  usedBufLen = (CFIndex)&a9;
  CFStringAppendFormatAndArguments(*(CFMutableStringRef *)(a1 + 1064), 0, a3, &a9);
  *(_QWORD *)(a1 + 1104) = 1;
  BSDescribeTruncationCommit(a1);
  return (id)a1;
}

void sub_18A1A6608(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_18A1A7368(_Unwind_Exception *exception_object)
{
  _Unwind_Resume(exception_object);
}

uint64_t BSDescribeTruncationCommit(uint64_t result)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  if (*(uint64_t *)(result + 1096) >= 2)
  {
    v1 = result;
    v2 = *(_QWORD *)(result + 1040);
    if (v2 >= 1)
    {
      *(_BYTE *)(result + 16 + v2) = 0;
      CFStringAppendCString(*(CFMutableStringRef *)(result + 1064), (const char *)(result + 16), 0x8000100u);
      *(_QWORD *)(v1 + 1040) = 0;
    }
    v3 = *(_QWORD *)(v1 + 1080);
    result = objc_msgSend(*(id *)(v1 + 1064), "length");
    v4 = result - v3 - *(_QWORD *)(v1 + 1088);
    if (v4 < 1)
      goto LABEL_11;
    v5 = *(_QWORD *)(v1 + 1096);
    if (v5 != 2)
    {
      if (v5 == 3)
      {
        v3 = v3 + (result - v3) / 2 - ((unint64_t)v4 >> 1);
      }
      else
      {
        if (v5 != 4)
        {
LABEL_11:
          *(_QWORD *)(v1 + 1088) = 0;
          *(_QWORD *)(v1 + 1096) = 0;
          return result;
        }
        v3 += *(_QWORD *)(v1 + 1088);
      }
    }
    result = objc_msgSend(*(id *)(v1 + 1064), "replaceCharactersInRange:withString:", v3);
    goto LABEL_11;
  }
  return result;
}

void sub_18A1A74B8(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_18A1A75D8(_Unwind_Exception *exception_object)
{
  _Unwind_Resume(exception_object);
}

void sub_18A1A76B8(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

id _BSDefaultDescriptionStyle()
{
  if (qword_1ECD39A50 != -1)
    dispatch_once(&qword_1ECD39A50, &__block_literal_global_25);
  return (id)_MergedGlobals_30;
}

void sub_18A1A7CF4(_Unwind_Exception *exception_object)
{
  _Unwind_Resume(exception_object);
}

void sub_18A1A86B8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{

  _Unwind_Resume(a1);
}

void sub_18A1A8A74(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

id _BSCollectionLineBreakNoneStyle()
{
  if (qword_1ECD39A70 != -1)
    dispatch_once(&qword_1ECD39A70, &__block_literal_global_36);
  return (id)qword_1ECD39A68;
}

void sub_18A1A9060(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_18A1A9254(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

uint64_t BSEqualSets(CFSetRef theSet, const __CFSet *a2)
{
  uint64_t result;
  CFIndex Count;

  if (theSet == a2)
    return 1;
  result = 0;
  if (theSet && a2)
  {
    Count = CFSetGetCount(theSet);
    if (Count == CFSetGetCount(a2))
      return -[__CFSet isEqualToSet:](theSet, "isEqualToSet:", a2);
    else
      return 0;
  }
  return result;
}

void sub_18A1A9598(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void BSDescribeAppendItem(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  unint64_t v5;
  uint64_t v6;
  const char *v7;
  uint64_t v8;
  const char *v9;
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  __CFString *v13;
  const char *v14;
  uint64_t v15;
  const char *v16;
  uint64_t v17;
  const char *v18;
  size_t v19;
  uint64_t v20;
  size_t v21;
  unint64_t v22;
  uint64_t v23;
  const char *v24;
  uint64_t v25;
  const char *v26;

  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 8) + 24);
  if (v4 == 2)
  {
    (*(void (**)(uint64_t))(a2 + 16))(a2);
    if (*(_QWORD *)(a1 + 1104) == 1)
      *(_QWORD *)(a1 + 1104) = 0;
    v5 = *(_QWORD *)(a1 + 1112);
    if ((v5 & 0x8000000000000000) == 0)
    {
      *(_QWORD *)(a1 + 1112) = v5 - 1;
      if (v5 >= 2)
      {
        v6 = *(_QWORD *)(a1 + 1040);
        v7 = (const char *)(a1 + 16);
        if (v6 > 1021)
        {
          v7[v6] = 0;
          CFStringAppendCString(*(CFMutableStringRef *)(a1 + 1064), v7, 0x8000100u);
          *(_QWORD *)(a1 + 1040) = 0;
          CFStringAppendCString(*(CFMutableStringRef *)(a1 + 1064), ", ", 0x8000100u);
        }
        else
        {
          *(_WORD *)&v7[v6] = 8236;
          *(_QWORD *)(a1 + 1040) += 2;
        }
      }
    }
  }
  else
  {
    switch(*(_QWORD *)(a1 + 1104))
    {
      case 1:
        v8 = *(_QWORD *)(a1 + 1040);
        v9 = (const char *)(a1 + 16);
        if (v4 == 3)
        {
          if (v8 > 1022)
          {
            v9[v8] = 0;
            CFStringAppendCString(*(CFMutableStringRef *)(a1 + 1064), v9, 0x8000100u);
            *(_QWORD *)(a1 + 1040) = 0;
            CFStringAppendCString(*(CFMutableStringRef *)(a1 + 1064), ";", 0x8000100u);
          }
          else
          {
            v9[v8] = 59;
            ++*(_QWORD *)(a1 + 1040);
          }
          goto LABEL_19;
        }
        if (v8 <= 1021)
        {
          *(_WORD *)&v9[v8] = 8251;
          v12 = *(_QWORD *)(a1 + 1040) + 2;
          goto LABEL_27;
        }
        v9[v8] = 0;
        CFStringAppendCString(*(CFMutableStringRef *)(a1 + 1064), v9, 0x8000100u);
        *(_QWORD *)(a1 + 1040) = 0;
        v13 = *(__CFString **)(a1 + 1064);
        v14 = "; ";
        goto LABEL_32;
      case 2:
        v10 = *(_QWORD *)(a1 + 1040);
        v11 = (const char *)(a1 + 16);
        if (v10 <= 1022)
        {
          v11[v10] = 32;
          v12 = *(_QWORD *)(a1 + 1040) + 1;
          goto LABEL_27;
        }
        v11[v10] = 0;
        CFStringAppendCString(*(CFMutableStringRef *)(a1 + 1064), v11, 0x8000100u);
        *(_QWORD *)(a1 + 1040) = 0;
        v13 = *(__CFString **)(a1 + 1064);
        v14 = " ";
        goto LABEL_32;
      case 3:
LABEL_19:
        v15 = *(_QWORD *)(a1 + 1040);
        v16 = (const char *)(a1 + 16);
        if (v15 > 1022)
        {
          v16[v15] = 0;
          CFStringAppendCString(*(CFMutableStringRef *)(a1 + 1064), v16, 0x8000100u);
          *(_QWORD *)(a1 + 1040) = 0;
          CFStringAppendCString(*(CFMutableStringRef *)(a1 + 1064), "\n", 0x8000100u);
        }
        else
        {
          v16[v15] = 10;
          ++*(_QWORD *)(a1 + 1040);
        }
        goto LABEL_22;
      case 4:
LABEL_22:
        v17 = *(_QWORD *)(a1 + 1072);
        if (v17 < 1)
          goto LABEL_33;
        if (v17 >= 8)
          v17 = 8;
        v18 = (const char *)*((_QWORD *)&sIndentSpaceStrings + v17);
        v19 = strlen(v18);
        v20 = *(_QWORD *)(a1 + 1040);
        if ((uint64_t)(v20 + v19) > 1023)
        {
          if (v20 >= 1)
          {
            *(_BYTE *)(a1 + 16 + v20) = 0;
            CFStringAppendCString(*(CFMutableStringRef *)(a1 + 1064), (const char *)(a1 + 16), 0x8000100u);
            *(_QWORD *)(a1 + 1040) = 0;
          }
          v13 = *(__CFString **)(a1 + 1064);
          v14 = v18;
LABEL_32:
          CFStringAppendCString(v13, v14, 0x8000100u);
        }
        else
        {
          v21 = v19;
          memcpy((void *)(a1 + v20 + 16), v18, v19);
          v12 = *(_QWORD *)(a1 + 1040) + v21;
LABEL_27:
          *(_QWORD *)(a1 + 1040) = v12;
        }
LABEL_33:
        *(_QWORD *)(a1 + 1104) = 0;
LABEL_34:
        (*(void (**)(uint64_t))(a2 + 16))(a2);
        v22 = *(_QWORD *)(a1 + 1112);
        if ((v22 & 0x8000000000000000) == 0)
        {
          *(_QWORD *)(a1 + 1112) = v22 - 1;
          if (v22 >= 2)
          {
            v23 = *(_QWORD *)(a1 + 1040);
            v24 = (const char *)(a1 + 16);
            if (v23 > 1022)
            {
              v24[v23] = 0;
              CFStringAppendCString(*(CFMutableStringRef *)(a1 + 1064), v24, 0x8000100u);
              *(_QWORD *)(a1 + 1040) = 0;
              CFStringAppendCString(*(CFMutableStringRef *)(a1 + 1064), ",", 0x8000100u);
            }
            else
            {
              v24[v23] = 44;
              ++*(_QWORD *)(a1 + 1040);
            }
          }
        }
        v25 = *(_QWORD *)(a1 + 1040);
        v26 = (const char *)(a1 + 16);
        if (v25 > 1022)
        {
          v26[v25] = 0;
          CFStringAppendCString(*(CFMutableStringRef *)(a1 + 1064), v26, 0x8000100u);
          *(_QWORD *)(a1 + 1040) = 0;
          CFStringAppendCString(*(CFMutableStringRef *)(a1 + 1064), "\n", 0x8000100u);
        }
        else
        {
          v26[v25] = 10;
          ++*(_QWORD *)(a1 + 1040);
        }
        *(_QWORD *)(a1 + 1104) = 4;
        break;
      default:
        goto LABEL_34;
    }
  }
}

void sub_18A1AA4B8(_Unwind_Exception *exception_object)
{
  _Unwind_Resume(exception_object);
}

void sub_18A1AAAC0(_Unwind_Exception *exception_object)
{
  _Unwind_Resume(exception_object);
}

id _BSCollectionLineBreakEachItemStyle()
{
  if (qword_1ECD39A80 != -1)
    dispatch_once(&qword_1ECD39A80, &__block_literal_global_37_0);
  return (id)qword_1ECD39A78;
}

id BSCollectionFilter(objc_class *a1, void *a2, void *a3)
{
  id v5;
  unsigned int (**v6)(id, _QWORD);
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  uint64_t v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (v6)
  {
    v7 = (void *)objc_msgSend([a1 alloc], "initWithCapacity:", objc_msgSend(v5, "count"));
    v16 = 0u;
    v17 = 0u;
    v14 = 0u;
    v15 = 0u;
    v8 = v5;
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    if (v9)
    {
      v10 = *(_QWORD *)v15;
      do
      {
        for (i = 0; i != v9; ++i)
        {
          if (*(_QWORD *)v15 != v10)
            objc_enumerationMutation(v8);
          v12 = *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * i);
          if (v6[2](v6, v12))
            objc_msgSend(v7, "addObject:", v12, (_QWORD)v14);
        }
        v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      }
      while (v9);
    }

  }
  else
  {
    v7 = (void *)objc_msgSend(v5, "copyWithZone:", 0);
  }

  return v7;
}

void sub_18A1AADF4(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

double BSRectGetCenter(CGFloat a1, CGFloat a2, CGFloat a3, CGFloat a4)
{
  double MidX;
  CGRect v10;

  MidX = CGRectGetMidX(*(CGRect *)&a1);
  v10.origin.x = a1;
  v10.origin.y = a2;
  v10.size.width = a3;
  v10.size.height = a4;
  CGRectGetMidY(v10);
  return MidX;
}

void sub_18A1AB03C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  _Unwind_Resume(a1);
}

void BSSerializeArrayOfBSXPCEncodableObjectsToXPCDictionaryWithKey(void *a1, void *a2, const char *a3)
{
  BSSerializeArrayToXPCDictionaryWithKey(a1, a2, a3, &__block_literal_global_2);
}

void sub_18A1AB188(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

double BSDeserializeDoubleFromXPCDictionaryWithKey(void *a1, const char *a2)
{
  id v3;
  void *v4;
  double value;
  void *v6;
  void *v7;

  v3 = a1;
  v4 = v3;
  value = 0.0;
  if (v3 && a2)
  {
    xpc_dictionary_get_value(v3, a2);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v6;
    if (v6 && object_getClass(v6) == (Class)MEMORY[0x1E0C81300])
      value = xpc_double_get_value(v7);

  }
  return value;
}

void sub_18A1AB224(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_18A1AB2A8(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_18A1AB480(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_18A1AB58C(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

uint64_t BSEqualDictionaries(CFDictionaryRef theDict, const __CFDictionary *a2)
{
  uint64_t result;
  CFIndex Count;

  if (theDict == a2)
    return 1;
  result = 0;
  if (theDict && a2)
  {
    Count = CFDictionaryGetCount(theDict);
    if (Count == CFDictionaryGetCount(a2))
      return -[__CFDictionary isEqualToDictionary:](theDict, "isEqualToDictionary:", a2);
    else
      return 0;
  }
  return result;
}

double BSAbsoluteMachTimeNow()
{
  uint64_t v0;

  v0 = mach_absolute_time();
  if (_MergedGlobals_9 != -1)
    dispatch_once_f(&_MergedGlobals_9, 0, (dispatch_function_t)__machTimeScaleInit);
  return *(double *)&qword_1ECD39840 * (double)v0;
}

double BSDeserializeCGSizeFromXPCDictionaryWithKey(void *a1, const char *a2)
{
  id v3;
  void *v4;
  double v5;
  void *v6;

  v3 = a1;
  v4 = v3;
  if (v3 && object_getClass(v3) == (Class)MEMORY[0x1E0C812F8])
  {
    xpc_dictionary_get_value(v4, a2);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = BSDeserializeCGSizeFromXPCObject(v6);

  }
  else
  {
    v5 = *MEMORY[0x1E0C9D820];
  }

  return v5;
}

void sub_18A1AB748(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

double BSDeserializeCGSizeFromXPCObject(void *a1)
{
  id v1;
  void *v2;
  double v3;

  v1 = a1;
  v2 = v1;
  v3 = *MEMORY[0x1E0C9D820];
  if (v1 && object_getClass(v1) == (Class)MEMORY[0x1E0C812C8] && xpc_array_get_count(v2) == 2)
  {
    v3 = xpc_array_get_double(v2, 0);
    xpc_array_get_double(v2, 1uLL);
  }

  return v3;
}

void sub_18A1AB7F0(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_18A1AB86C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_18A1AB93C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_18A1AB9B4(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_18A1ABAC0(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_18A1ABB40(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, objc_super a9)
{
  void *v9;
  void *v10;

  v10 = v9;
  a9.receiver = v10;
  a9.super_class = (Class)BSCFBundle;
  -[_Unwind_Exception dealloc](&a9, sel_dealloc);
  _Unwind_Resume(a1);
}

void sub_18A1ABC4C(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void BSDispatchQueueAssertNot(void *a1)
{
  NSObject *queue;

  queue = a1;
  if (queue == MEMORY[0x1E0C80D38])
    BSDispatchQueueAssertNotMain();
  else
    dispatch_assert_queue_not_V2(queue);

}

void sub_18A1ABCF8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

id BSCollectionCompactMap(objc_class *a1, void *a2, void *a3)
{
  id v5;
  void (**v6)(id, id);
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  uint64_t v12;
  id v13;
  uint64_t v14;
  BOOL v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  v7 = (void *)objc_msgSend([a1 alloc], "initWithCapacity:", objc_msgSend(v5, "count"));
  v19 = 0u;
  v20 = 0u;
  v17 = 0u;
  v18 = 0u;
  v8 = v5;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v9)
  {
    v10 = *(_QWORD *)v18;
    v11 = (id)*MEMORY[0x1E0C9B0D0];
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v18 != v10)
          objc_enumerationMutation(v8);
        v13 = *(id *)(*((_QWORD *)&v17 + 1) + 8 * v12);
        if (v6)
        {
          v6[2](v6, v13);
          v14 = objc_claimAutoreleasedReturnValue();

          v13 = (id)v14;
        }
        if (v13)
          v15 = v13 == v11;
        else
          v15 = 1;
        if (!v15)
          objc_msgSend(v7, "addObject:", v13, (_QWORD)v17);

        ++v12;
      }
      while (v9 != v12);
      v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v9);
  }

  return v7;
}

void sub_18A1ABFB4(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  _Unwind_Resume(a1);
}

void sub_18A1AC2F0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  void *v9;
  void *v10;
  void *v11;
  va_list va;

  va_start(va, a9);

  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_18A1AC448(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

const void *BSCreateDeserializedDataFromXPCDictionaryWithKey(void *a1, const char *a2)
{
  id v3;
  void *v4;
  const void *data;
  id v6;
  size_t length;

  v3 = a1;
  v4 = v3;
  length = 0;
  if (v3)
  {
    data = xpc_dictionary_get_data(v3, a2, &length);
    if (data)
    {
      v6 = objc_alloc(MEMORY[0x1E0C99D50]);
      data = (const void *)objc_msgSend(v6, "initWithBytes:length:", data, length);
    }
  }
  else
  {
    data = 0;
  }

  return data;
}

void sub_18A1AC4E0(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

__CFString *BSInterfaceOrientationMaskDescription(uint64_t a1)
{
  uint64_t v1;
  __CFString *v2;
  __CFString *v3;

  if (a1)
  {
    v1 = a1;
    objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithString:", CFSTR("("));
    v2 = (__CFString *)objc_claimAutoreleasedReturnValue();
    v3 = v2;
    if ((v1 & 2) != 0)
    {
      -[__CFString appendString:](v2, "appendString:", CFSTR(" Pu"));
      v1 &= ~2uLL;
    }
    if ((v1 & 0x10) != 0)
    {
      -[__CFString appendString:](v3, "appendString:", CFSTR(" Ll"));
      v1 &= ~0x10uLL;
    }
    if ((v1 & 8) != 0)
    {
      -[__CFString appendString:](v3, "appendString:", CFSTR(" Lr"));
      v1 &= ~8uLL;
    }
    if ((v1 & 4) != 0)
    {
      -[__CFString appendString:](v3, "appendString:", CFSTR(" Pd"));
      v1 &= ~4uLL;
    }
    if (v1)
      -[__CFString appendFormat:](v3, "appendFormat:", CFSTR(" %li"), v1);
    -[__CFString appendString:](v3, "appendString:", CFSTR(")"));
  }
  else
  {
    v3 = CFSTR("none");
  }
  return v3;
}

void sub_18A1AC5CC(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_18A1AC638(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

id BSInterfaceOrientationDescription(unint64_t a1)
{
  const __CFString *v1;

  if (a1 > 4)
    v1 = CFSTR("INVALID");
  else
    v1 = off_1E1EBF790[a1];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@ (%li)"), v1, a1);
  return (id)objc_claimAutoreleasedReturnValue();
}

BOOL BSSizeLessThanSize(double a1, double a2, double a3, double a4)
{
  return a2 < a4 && a1 < a3;
}

void sub_18A1AC808(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void BSSerializeDoubleToXPCDictionaryWithKey(void *a1, const char *a2, double a3)
{
  xpc_object_t xdict;

  xdict = a1;
  if (xdict && a2)
    xpc_dictionary_set_double(xdict, a2, a3);

}

void sub_18A1AC870(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_18A1AC97C(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_18A1ACA4C(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_18A1ACAE4(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_18A1AD114(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, void *a17, void *a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,void *a23)
{
  void *v23;
  void *v24;
  void *v25;

  _Unwind_Resume(a1);
}

void sub_18A1AD2EC(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_18A1AD468(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_18A1AD6A8(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_18A1AD8E8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, ...)
{
  va_list va;

  va_start(va, a4);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id getCAMediaTimingFunctionClass()
{
  void *v0;
  id v1;
  _QWORD v3[5];
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  uint64_t v7;

  v4 = 0;
  v5 = &v4;
  v6 = 0x2050000000;
  v0 = (void *)getCAMediaTimingFunctionClass_softClass;
  v7 = getCAMediaTimingFunctionClass_softClass;
  if (!getCAMediaTimingFunctionClass_softClass)
  {
    v3[0] = MEMORY[0x1E0C809B0];
    v3[1] = 3221225472;
    v3[2] = __getCAMediaTimingFunctionClass_block_invoke;
    v3[3] = &unk_1E1EBE608;
    v3[4] = &v4;
    __getCAMediaTimingFunctionClass_block_invoke((uint64_t)v3);
    v0 = (void *)v5[3];
  }
  v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_18A1AD9D8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_18A1ADC14(_Unwind_Exception *exception_object)
{
  void *v1;
  int v2;

  if (!v2)

  _Unwind_Resume(exception_object);
}

void sub_18A1ADF18(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_18A1AE0D4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_18A1AE21C(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

id getCASpringAnimationClass()
{
  void *v0;
  id v1;
  _QWORD v3[5];
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  uint64_t v7;

  v4 = 0;
  v5 = &v4;
  v6 = 0x2050000000;
  v0 = (void *)getCASpringAnimationClass_softClass;
  v7 = getCASpringAnimationClass_softClass;
  if (!getCASpringAnimationClass_softClass)
  {
    v3[0] = MEMORY[0x1E0C809B0];
    v3[1] = 3221225472;
    v3[2] = __getCASpringAnimationClass_block_invoke;
    v3[3] = &unk_1E1EBE608;
    v3[4] = &v4;
    __getCASpringAnimationClass_block_invoke((uint64_t)v3);
    v0 = (void *)v5[3];
  }
  v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_18A1AE2CC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id getCATransactionClass()
{
  void *v0;
  id v1;
  _QWORD v3[5];
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  uint64_t v7;

  v4 = 0;
  v5 = &v4;
  v6 = 0x2050000000;
  v0 = (void *)getCATransactionClass_softClass;
  v7 = getCATransactionClass_softClass;
  if (!getCATransactionClass_softClass)
  {
    v3[0] = MEMORY[0x1E0C809B0];
    v3[1] = 3221225472;
    v3[2] = __getCATransactionClass_block_invoke;
    v3[3] = &unk_1E1EBE608;
    v3[4] = &v4;
    __getCATransactionClass_block_invoke((uint64_t)v3);
    v0 = (void *)v5[3];
  }
  v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_18A1AE384(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id BSSystemRootDirectory()
{
  if (qword_1ECD39968 != -1)
    dispatch_once(&qword_1ECD39968, &__block_literal_global_20);
  return (id)_MergedGlobals_22;
}

void sub_18A1AE704(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{

  _Unwind_Resume(a1);
}

void sub_18A1AE828(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

uint64_t _BSProtobufDecodeRepeatFieldObject(_BYTE *a1, uint64_t a2, id *a3, _QWORD *a4)
{
  id v7;
  uint64_t v9;
  void *v10;
  BOOL v11;
  void *v13;

  v7 = *a3;
  if (!*a3)
  {
    v7 = objc_alloc_init(*(Class *)(a2 + 40));
    *a3 = v7;
  }
  v13 = 0;
  v9 = _BSProtobufDecodeObjectWithClassOverride(a1, *(void **)(a2 + 32), &v13, a4);
  v10 = v13;
  if ((_DWORD)v9)
    v11 = v13 == 0;
  else
    v11 = 1;
  if (!v11)
  {
    objc_msgSend(v7, "addObject:", v13);

  }
  return v9;
}

uint64_t _BSProtobufEncodeRepeatFieldObject(uint64_t a1, uint64_t a2, void **a3, uint64_t a4)
{
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t result;
  id obj;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v7 = *a3;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  obj = v7;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (!v8)
    return 1;
  v9 = v8;
  v10 = *(_QWORD *)v19;
LABEL_3:
  v11 = 0;
  while (1)
  {
    if (*(_QWORD *)v19 != v10)
      objc_enumerationMutation(obj);
    v12 = *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * v11);
    v13 = objc_msgSend(*(id *)(a2 + 32), "protobufSchema");
    if (*(uint64_t *)(a2 + 64) >= 1)
    {
      v14 = 0;
      while (1)
      {
        v15 = *(_QWORD *)(*(_QWORD *)(a2 + 72) + 8 * v14);
        if (objc_msgSend((id)objc_opt_class(), "isEqual:", *(_QWORD *)(v15 + 32)))
          break;
        if (++v14 >= *(_QWORD *)(a2 + 64))
          goto LABEL_12;
      }
      v13 = objc_msgSend(*(id *)(v15 + 32), "protobufSchema");
    }
LABEL_12:
    PBDataWriterPlaceMark();
    result = _BSProtobufSchemaEncodeMessage(v13, v12, a1, a4);
    if (!(_DWORD)result)
      return result;
    PBDataWriterRecallMark();
    if (++v11 == v9)
    {
      v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
      if (v9)
        goto LABEL_3;
      return 1;
    }
  }
}

uint64_t _BSProtobufSchemaEncodeMessage(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  void *v8;
  uint64_t v9;
  void *v11;
  uint8_t buf[4];
  uint64_t v13;
  __int16 v14;
  const __CFString *v15;
  __int16 v16;
  int v17;
  __int16 v18;
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  if (*(_BYTE *)(a1 + 74))
  {
    v8 = (void *)objc_msgSend(objc_alloc(*(Class *)(a1 + 8)), "initProtobufTranslatorForObject:", a2);
    v9 = _BSProtobufSchemaEncodeMessageWithExplicitIvarBaseAddress((_QWORD *)a1, (uint64_t)v8, a3, a4);
    if (v8)

    return v9;
  }
  else
  {
    if (objc_opt_class() != *(_QWORD *)(a1 + 8) && (objc_opt_isKindOfClass() & 1) == 0)
    {
      v11 = (void *)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("got:%@ expected:%@"), objc_opt_class(), *(_QWORD *)(a1 + 8));
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138544130;
        v13 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "BOOL _BSProtobufSchemaEncodeMessage(BSProtobufSchema *, id, PBDataWriter *, NSError **)");
        v14 = 2114;
        v15 = CFSTR("BSProtobufSerialization.m");
        v16 = 1024;
        v17 = 1106;
        v18 = 2114;
        v19 = v11;
        _os_log_error_impl(&dword_18A184000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ (%{public}@:%i) : %{public}@", buf, 0x26u);
      }
      qword_1EDF5BAE8 = objc_msgSend(v11, "UTF8String");
      __break(0);
      JUMPOUT(0x18A1AED74);
    }
    return _BSProtobufSchemaEncodeMessageWithExplicitIvarBaseAddress((_QWORD *)a1, a2, a3, a4);
  }
}

uint64_t _BSProtobufEncodePOD(uint64_t a1, uint64_t a2)
{
  const char *v2;
  int v3;
  void *v5;
  uint8_t buf[4];
  uint64_t v7;
  __int16 v8;
  const __CFString *v9;
  __int16 v10;
  int v11;
  __int16 v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v2 = *(const char **)(a2 + 8);
  v3 = *v2;
  if (v3 > 82)
  {
    switch(*v2)
    {
      case 'c':
      case 'i':
      case 'l':
      case 'q':
      case 's':
        goto LABEL_20;
      case 'd':
        goto LABEL_25;
      case 'e':
      case 'g':
      case 'h':
      case 'j':
      case 'k':
      case 'm':
      case 'n':
      case 'o':
      case 'p':
      case 'r':
        goto LABEL_28;
      case 'f':
        PBDataWriterWriteFloatField();
        return 1;
      default:
        if (v3 == 83)
          goto LABEL_20;
        if (v3 != 123)
          goto LABEL_28;
        if (!strncmp("{CGPoint=", *(const char **)(a2 + 8), 9uLL) || !strncmp("{CGSize=", v2, 8uLL))
        {
          PBDataWriterWriteDoubleField();
          goto LABEL_25;
        }
        if (!strncmp("{CGRect=", v2, 8uLL))
        {
          PBDataWriterWriteDoubleField();
          PBDataWriterWriteDoubleField();
          PBDataWriterWriteDoubleField();
          goto LABEL_25;
        }
        if (!strncmp("{CGAffineTransform=", v2, 0x13uLL))
        {
          PBDataWriterWriteDoubleField();
          PBDataWriterWriteDoubleField();
          PBDataWriterWriteDoubleField();
          PBDataWriterWriteDoubleField();
          PBDataWriterWriteDoubleField();
          goto LABEL_25;
        }
        if (!strncmp("{CATransform3D=", v2, 0xFuLL))
        {
          PBDataWriterWriteDoubleField();
          PBDataWriterWriteDoubleField();
          PBDataWriterWriteDoubleField();
          PBDataWriterWriteDoubleField();
          PBDataWriterWriteDoubleField();
          PBDataWriterWriteDoubleField();
          PBDataWriterWriteDoubleField();
          PBDataWriterWriteDoubleField();
          PBDataWriterWriteDoubleField();
          PBDataWriterWriteDoubleField();
          PBDataWriterWriteDoubleField();
          PBDataWriterWriteDoubleField();
          PBDataWriterWriteDoubleField();
          PBDataWriterWriteDoubleField();
          PBDataWriterWriteDoubleField();
LABEL_25:
          PBDataWriterWriteDoubleField();
          return 1;
        }
        v5 = (void *)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("unsupported encoding:%s"), v2);
        if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138544130;
          v7 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "BOOL _BSProtobufEncodePOD(PBDataWriter *, _BSProtobufFieldEntry *, void *, NSError **)");
          v8 = 2114;
          v9 = CFSTR("BSProtobufSerialization.m");
          v10 = 1024;
          v11 = 893;
          v12 = 2114;
          v13 = v5;
          _os_log_error_impl(&dword_18A184000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ (%{public}@:%i) : %{public}@", buf, 0x26u);
        }
        break;
    }
LABEL_33:
    qword_1EDF5BAE8 = objc_msgSend(v5, "UTF8String");
    __break(0);
    JUMPOUT(0x18A1AF1F8);
  }
  if (v3 > 72)
  {
    if (v3 == 73 || v3 == 76 || v3 == 81)
      goto LABEL_20;
LABEL_28:
    v5 = (void *)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("unsupported encoding:%s"), *(_QWORD *)(a2 + 8));
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138544130;
      v7 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "BOOL _BSProtobufEncodePOD(PBDataWriter *, _BSProtobufFieldEntry *, void *, NSError **)");
      v8 = 2114;
      v9 = CFSTR("BSProtobufSerialization.m");
      v10 = 1024;
      v11 = 899;
      v12 = 2114;
      v13 = v5;
      _os_log_error_impl(&dword_18A184000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ (%{public}@:%i) : %{public}@", buf, 0x26u);
    }
    goto LABEL_33;
  }
  if (v3 == 66)
  {
    PBDataWriterWriteBOOLField();
    return 1;
  }
  if (v3 != 67)
    goto LABEL_28;
LABEL_20:
  PBDataWriterWriteUint64Field();
  return 1;
}

uint64_t _BSProtobufEncodeObject(uint64_t a1, uint64_t a2, uint64_t *a3, uint64_t a4)
{
  uint64_t v4;
  uint64_t result;

  v4 = *a3;
  if (*a3)
  {
    PBDataWriterPlaceMark();
    result = _BSProtobufSchemaEncodeMessage(objc_msgSend(*(id *)(a2 + 32), "protobufSchema"), v4, a1, a4);
    if (!(_DWORD)result)
      return result;
    PBDataWriterRecallMark();
  }
  return 1;
}

objc_class *_BSProtobufValidateClassForEncoding(uint64_t a1, void *a2)
{
  objc_class *v4;
  Class v5;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint8_t buf[4];
  uint64_t v12;
  __int16 v13;
  const __CFString *v14;
  __int16 v15;
  int v16;
  __int16 v17;
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  if (BSProtobufClassImplmementsProtobufSchema(a2))
    return (objc_class *)a2;
  v5 = NSClassFromString((NSString *)objc_msgSend(CFSTR("_BSProtobufTranslator_"), "stringByAppendingString:", objc_msgSend(a2, "description")));
  if (!v5)
  {
    v7 = (void *)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s: Class %@ does not conform to BSProtobufSerializable, and a translator class does not exist for it"), a1, a2);
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138544130;
      v12 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Class _BSProtobufValidateClassForEncoding(const char *, Class)");
      v13 = 2114;
      v14 = CFSTR("BSProtobufSerialization.m");
      v15 = 1024;
      v16 = 363;
      v17 = 2114;
      v18 = v7;
      _os_log_error_impl(&dword_18A184000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ (%{public}@:%i) : %{public}@", buf, 0x26u);
    }
    qword_1EDF5BAE8 = objc_msgSend(v7, "UTF8String");
    __break(0);
    JUMPOUT(0x18A1AF5A4);
  }
  v4 = v5;
  if (!BSProtobufClassImplmementsProtobufSchema(v5))
  {
    v8 = (void *)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s: Class %@ does not conform to BSProtobufSerializable, and neither does the translator class"), a1, a2);
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138544130;
      v12 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Class _BSProtobufValidateClassForEncoding(const char *, Class)");
      v13 = 2114;
      v14 = CFSTR("BSProtobufSerialization.m");
      v15 = 1024;
      v16 = 366;
      v17 = 2114;
      v18 = v8;
      _os_log_error_impl(&dword_18A184000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ (%{public}@:%i) : %{public}@", buf, 0x26u);
    }
    qword_1EDF5BAE8 = objc_msgSend(v8, "UTF8String");
    __break(0);
    JUMPOUT(0x18A1AF660);
  }
  if (!class_getInstanceMethod(v4, sel_initProtobufTranslatorForObject_))
  {
    v9 = (void *)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s: Class %@ translator (%@) does not implement initProtobufTranslatorForObject:"), a1, a2, v4);
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138544130;
      v12 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Class _BSProtobufValidateClassForEncoding(const char *, Class)");
      v13 = 2114;
      v14 = CFSTR("BSProtobufSerialization.m");
      v15 = 1024;
      v16 = 369;
      v17 = 2114;
      v18 = v9;
      _os_log_error_impl(&dword_18A184000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ (%{public}@:%i) : %{public}@", buf, 0x26u);
    }
    qword_1EDF5BAE8 = objc_msgSend(v9, "UTF8String");
    __break(0);
    JUMPOUT(0x18A1AF720);
  }
  if (!class_getInstanceMethod(v4, sel_didFinishProtobufDecodingWithError_))
  {
    v10 = (void *)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s: Class %@ translator does not implement didFinishProtobufDecodingWithError: -- translators must return an instance of the original class"), a1, a2);
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138544130;
      v12 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Class _BSProtobufValidateClassForEncoding(const char *, Class)");
      v13 = 2114;
      v14 = CFSTR("BSProtobufSerialization.m");
      v15 = 1024;
      v16 = 372;
      v17 = 2114;
      v18 = v10;
      _os_log_error_impl(&dword_18A184000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ (%{public}@:%i) : %{public}@", buf, 0x26u);
    }
    qword_1EDF5BAE8 = objc_msgSend(v10, "UTF8String");
    __break(0);
    JUMPOUT(0x18A1AF7DCLL);
  }
  return v4;
}

BOOL BSProtobufClassImplmementsProtobufSchema(void *a1)
{
  objc_class *Class;
  Method *v2;
  Method *v3;
  unint64_t i;
  objc_method_description *Description;
  _BOOL8 v6;
  unsigned int outCount;

  outCount = 0;
  Class = object_getClass(a1);
  v2 = class_copyMethodList(Class, &outCount);
  if (!v2)
    return 0;
  v3 = v2;
  if (outCount)
  {
    for (i = 0; i < outCount; ++i)
    {
      Description = method_getDescription(v3[i]);
      v6 = Description->name == sel_protobufSchema;
      if (Description->name == sel_protobufSchema)
        break;
    }
  }
  else
  {
    v6 = 0;
  }
  free(v3);
  return v6;
}

uint64_t _BSProtobufDecodeObjectWithClassOverride(_BYTE *a1, void *a2, void **a3, _QWORD *a4)
{
  uint64_t v8;
  id v9;
  uint64_t v10;
  void *v12[3];

  v12[1] = 0;
  v12[2] = 0;
  if (!PBReaderPlaceMark())
    return 0;
  v8 = objc_msgSend(a2, "protobufSchema");
  if (*(_BYTE *)(v8 + 73))
    v9 = (id)objc_msgSend(objc_alloc((Class)a2), "initForProtobufDecoding");
  else
    v9 = objc_alloc_init((Class)a2);
  v12[0] = v9;
  v10 = _BSProtobufSchemaDecodeMessage(v8, v12, a1, a4);
  if ((v10 & 1) != 0)
  {
    *a3 = v12[0];
    PBReaderRecallMark();
  }
  else
  {
    *a3 = 0;

  }
  return v10;
}

uint64_t _BSProtobufSchemaDecodeMessage(uint64_t a1, void **a2, _BYTE *a3, _QWORD *a4)
{
  _QWORD *v4;
  _QWORD *v6;
  char v7;
  uint64_t v8;
  int *v9;
  int *v10;
  int *v11;
  int *v12;
  unsigned int v13;
  uint64_t v14;
  uint64_t v15;
  unint64_t v16;
  int v17;
  BOOL v18;
  int v19;
  char v20;
  int v21;
  void *v22;
  int *v23;
  int *v24;
  uint64_t v25;
  _QWORD *v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  uint64_t v30;
  char v31;
  unsigned int v32;
  unint64_t v33;
  uint64_t v34;
  uint64_t v35;
  unint64_t v36;
  unint64_t v37;
  uint64_t v38;
  uint64_t v39;
  NSObject *v40;
  char v41;
  char v42;
  uint64_t v43;
  void *v44;
  uint64_t v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  BOOL v50;
  uint64_t v51;
  void *v52;
  void *v53;
  uint64_t *v54;
  uint64_t *v55;
  uint64_t result;
  id v57;
  void *v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v64;
  uint64_t v65;
  void *v66;
  _QWORD v67[2];
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  uint8_t buf[4];
  _BYTE v77[18];
  __int16 v78;
  int v79;
  __int16 v80;
  void *v81;
  uint64_t v82;

  v4 = a4;
  v6 = (_QWORD *)a1;
  v82 = *MEMORY[0x1E0C80C00];
  if (a4)
    *a4 = 0;
  v7 = 0;
  v8 = *(_QWORD *)(a1 + 16);
  v65 = *MEMORY[0x1E0CB2FE0];
  v9 = (int *)MEMORY[0x1E0D82BF0];
  v64 = *MEMORY[0x1E0CB2D50];
  v10 = (int *)MEMORY[0x1E0D82BD8];
  v11 = (int *)MEMORY[0x1E0D82BC8];
  v12 = (int *)MEMORY[0x1E0D82BB8];
  while (1)
  {
LABEL_4:
    if (!v6)
      goto LABEL_63;
    v67[0] = 0;
    v67[1] = 0;
    if (v8)
      break;
    if (*(_QWORD *)&a3[*v9] >= *(_QWORD *)&a3[*v10] || a3[*v11])
    {
      if ((v7 & 1) != 0)
      {
        v7 = 1;
        goto LABEL_59;
      }
LABEL_55:
      if (!a3[*v11])
      {
        v7 = 0;
        goto LABEL_57;
      }
      if (v4)
      {
        v52 = (void *)MEMORY[0x1E0CB35C8];
        v68 = v64;
        v69 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("decode error: mystery error (at end) decoding class %@"), *(_QWORD *)(a1 + 8));
        v53 = (void *)MEMORY[0x1E0C99D80];
        v54 = &v69;
        v55 = &v68;
LABEL_77:
        *v4 = objc_msgSend(v52, "errorWithDomain:code:userInfo:", v65, 22, objc_msgSend(v53, "dictionaryWithObjects:forKeys:count:", v54, v55, 1));
      }
      return 0;
    }
LABEL_30:
    v31 = 0;
    v32 = 0;
    v33 = 0;
    do
    {
      while (1)
      {
        v34 = *v9;
        v35 = *(_QWORD *)&a3[v34];
        v36 = v35 + 1;
        if (v35 == -1 || v36 > *(_QWORD *)&a3[*v10])
        {
          a3[*v11] = 1;
          goto LABEL_34;
        }
        v42 = *(_BYTE *)(*(_QWORD *)&a3[*v12] + v35);
        *(_QWORD *)&a3[v34] = v36;
        v33 |= (unint64_t)(v42 & 0x7F) << v31;
        if (v42 < 0)
          break;
LABEL_34:
        if (a3[*v11])
          goto LABEL_60;
LABEL_35:
        if ((v33 & 7) == 4)
          goto LABEL_55;
        v37 = v33 >> 3;
        v38 = v6[3];
        if (v38 < 1)
        {
LABEL_40:
          v40 = BSLogCommon();
          if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR))
          {
            v43 = v6[1];
            *(_DWORD *)buf = 67109378;
            *(_DWORD *)v77 = v37;
            *(_WORD *)&v77[4] = 2114;
            *(_QWORD *)&v77[6] = v43;
            _os_log_error_impl(&dword_18A184000, v40, OS_LOG_TYPE_ERROR, "decode error: tag %d doesn't exist in schema for class %{public}@", buf, 0x12u);
          }
          v41 = PBReaderSkipValueWithTag();
          if (v4 && (v41 & 1) == 0)
          {
            v52 = (void *)MEMORY[0x1E0CB35C8];
            v70 = v64;
            v71 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("decode error: corruption at tag %d / class %@"), v37, v6[1]);
            v53 = (void *)MEMORY[0x1E0C99D80];
            v54 = &v71;
            v55 = &v70;
            goto LABEL_77;
          }
          v11 = (int *)MEMORY[0x1E0D82BC8];
          if ((v41 & 1) == 0)
            return 0;
        }
        else
        {
          v39 = v6[5];
          while (*(_DWORD *)v39 != (_DWORD)v37)
          {
            v39 += 96;
            if (!--v38)
              goto LABEL_40;
          }
          if (((*(uint64_t (**)(_BYTE *))(v39 + 56))(a3) & 1) == 0)
            return 0;
        }
        v12 = (int *)MEMORY[0x1E0D82BB8];
        if (*(_QWORD *)&a3[*v9] < *(_QWORD *)&a3[*v10])
        {
          v31 = 0;
          v32 = 0;
          v33 = 0;
          if (!a3[*v11])
            continue;
        }
        goto LABEL_55;
      }
      v31 += 7;
      v18 = v32++ >= 9;
    }
    while (!v18);
    v33 = 0;
    if (!a3[*v11])
      goto LABEL_35;
LABEL_60:
    if (v4)
    {
      v44 = (void *)MEMORY[0x1E0CB35C8];
      v72 = v64;
      v73 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("decode error: mystery error decoding class %@"), v6[1]);
      v7 = 1;
      v45 = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v73, &v72, 1);
      v46 = v44;
      v11 = (int *)MEMORY[0x1E0D82BC8];
      *v4 = objc_msgSend(v46, "errorWithDomain:code:userInfo:", v65, 22, v45);
    }
    else
    {
      v7 = 1;
    }
LABEL_57:
    if (v8)
      PBReaderRecallMark();
LABEL_59:
    v6 = (_QWORD *)v6[2];
  }
  v13 = 0;
  while (1)
  {
    v14 = *v9;
    v15 = *(_QWORD *)&a3[v14];
    v16 = v15 + 1;
    if (v15 == -1 || v16 > *(_QWORD *)&a3[*v10])
      break;
    v17 = *(char *)(*(_QWORD *)&a3[*v12] + v15);
    *(_QWORD *)&a3[v14] = v16;
    if (v17 < 0)
    {
      v18 = v13++ >= 9;
      if (!v18)
        continue;
    }
    goto LABEL_14;
  }
  a3[*v11] = 1;
LABEL_14:
  v19 = PBReaderPlaceMark();
  v20 = v19;
  if (v19)
    v21 = 0;
  else
    v21 = 3;
  if (v4 && (v19 & 1) == 0)
  {
    v66 = (void *)MEMORY[0x1E0CB35C8];
    v74 = v64;
    v22 = (void *)MEMORY[0x1E0CB3940];
    v23 = v9;
    v24 = v10;
    v25 = v8;
    v26 = v4;
    v27 = v6[1];
    v28 = objc_msgSend(a3, "position");
    v61 = objc_msgSend(a3, "length");
    v60 = v27;
    v4 = v26;
    v8 = v25;
    v10 = v24;
    v9 = v23;
    v29 = v22;
    v12 = (int *)MEMORY[0x1E0D82BB8];
    v75 = objc_msgSend(v29, "stringWithFormat:", CFSTR("decode error: mystery error (2) decoding class %@ (pos:%d length:%d)"), v60, v28, v61);
    v30 = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v75, &v74, 1);
    v11 = (int *)MEMORY[0x1E0D82BC8];
    *v4 = objc_msgSend(v66, "errorWithDomain:code:userInfo:", v65, 22, v30);
    v21 = 3;
  }
  if ((v20 & 1) != 0)
  {
    if (*(_QWORD *)&a3[*v9] >= *(_QWORD *)&a3[*v10] || a3[*v11])
      goto LABEL_55;
    goto LABEL_30;
  }
  v7 = 1;
  if (!v21)
    goto LABEL_4;
LABEL_63:
  if ((v7 & 1) != 0)
    return 0;
  if (!*(_BYTE *)(a1 + 72))
    return 1;
  v47 = *a2;
  v67[0] = 0;
  v48 = (void *)objc_msgSend(v47, "didFinishProtobufDecodingWithError:", v67);
  v49 = v48;
  if (v48)
    v50 = 1;
  else
    v50 = v67[0] == 0;
  v51 = v50;
  if (v4 && (v51 & 1) == 0)
  {
    *v4 = v67[0];
LABEL_83:
    if (v48 != v47)
    {
      v57 = v48;

      *a2 = v49;
    }
    return v51;
  }
  if (!v48 || !v67[0])
    goto LABEL_83;
  v58 = (void *)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("non-nil return value from -[%@ didFinishProtobufDecodingWithError:], but received error %@"), v47, v67[0]);
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v59 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "BOOL _BSProtobufInvokeDecodeDidFinish(id *, NSError **)");
    *(_DWORD *)buf = 138544130;
    *(_QWORD *)v77 = v59;
    *(_WORD *)&v77[8] = 2114;
    *(_QWORD *)&v77[10] = CFSTR("BSProtobufSerialization.m");
    v78 = 1024;
    v79 = 694;
    v80 = 2114;
    v81 = v58;
    _os_log_error_impl(&dword_18A184000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ (%{public}@:%i) : %{public}@", buf, 0x26u);
  }
  result = objc_msgSend(v58, "UTF8String");
  qword_1EDF5BAE8 = result;
  __break(0);
  return result;
}

uint64_t _BSProtobufDecodePOD(uint64_t a1, uint64_t a2, uint64_t a3)
{
  const char *v5;
  int v6;
  uint64_t v7;
  unint64_t v8;
  uint64_t v9;
  char v10;
  unsigned int v11;
  uint64_t v12;
  int *v13;
  int *v14;
  int *v15;
  uint64_t v16;
  uint64_t v17;
  unint64_t v18;
  char v19;
  BOOL v20;
  char v21;
  unsigned int v22;
  uint64_t v23;
  int *v24;
  int *v25;
  int *v26;
  uint64_t v27;
  uint64_t v28;
  unint64_t v29;
  char v30;
  char v31;
  unsigned int v32;
  uint64_t v33;
  int *v34;
  int *v35;
  int *v36;
  uint64_t v37;
  uint64_t v38;
  unint64_t v39;
  char v40;
  char v41;
  unsigned int v42;
  int *v43;
  int *v44;
  int *v45;
  uint64_t v46;
  uint64_t v47;
  unint64_t v48;
  char v49;
  int *v50;
  uint64_t v51;
  unint64_t v52;
  uint64_t v53;
  char v54;
  unsigned int v55;
  uint64_t v56;
  int *v57;
  int *v58;
  int *v59;
  uint64_t v60;
  uint64_t v61;
  unint64_t v62;
  char v63;
  char v64;
  unsigned int v65;
  uint64_t v66;
  int *v67;
  int *v68;
  int *v69;
  uint64_t v70;
  uint64_t v71;
  unint64_t v72;
  char v73;
  uint64_t v74;
  unint64_t v75;
  int v76;
  BOOL v77;
  int *v78;
  uint64_t v79;
  unint64_t v80;
  uint64_t v81;
  uint64_t v82;
  unint64_t v83;
  uint64_t v84;
  int *v85;
  uint64_t v86;
  unint64_t v87;
  uint64_t v88;
  int *v89;
  uint64_t v90;
  unint64_t v91;
  uint64_t v92;
  uint64_t v93;
  unint64_t v94;
  uint64_t v95;
  uint64_t v96;
  unint64_t v97;
  uint64_t v98;
  uint64_t v99;
  unint64_t v100;
  uint64_t v101;
  uint64_t v102;
  unint64_t v103;
  uint64_t v104;
  uint64_t v105;
  unint64_t v106;
  uint64_t v107;
  uint64_t v108;
  unint64_t v109;
  uint64_t v110;
  uint64_t v111;
  unint64_t v112;
  uint64_t v113;
  uint64_t v114;
  unint64_t v115;
  uint64_t v116;
  uint64_t v117;
  unint64_t v118;
  uint64_t v119;
  uint64_t v120;
  unint64_t v121;
  uint64_t v122;
  uint64_t v123;
  unint64_t v124;
  uint64_t v125;
  uint64_t v126;
  unint64_t v127;
  uint64_t v128;
  uint64_t v129;
  unint64_t v130;
  uint64_t v131;
  uint64_t v132;
  unint64_t v133;
  uint64_t v134;
  uint64_t v135;
  unint64_t v136;
  uint64_t v137;
  uint64_t v138;
  unint64_t v139;
  uint64_t v140;
  uint64_t v141;
  unint64_t v142;
  uint64_t v143;
  uint64_t v144;
  unint64_t v145;
  uint64_t v146;
  uint64_t v147;
  unint64_t v148;
  uint64_t v149;
  uint64_t v150;
  unint64_t v151;
  uint64_t v152;
  uint64_t v153;
  unint64_t v154;
  uint64_t v155;
  uint64_t v156;
  unint64_t v157;
  uint64_t v158;
  uint64_t v159;
  unint64_t v160;
  uint64_t v161;
  void *v163;
  uint8_t buf[4];
  uint64_t v165;
  __int16 v166;
  const __CFString *v167;
  __int16 v168;
  int v169;
  __int16 v170;
  void *v171;
  uint64_t v172;

  v172 = *MEMORY[0x1E0C80C00];
  v5 = *(const char **)(a2 + 8);
  v6 = *v5;
  if (v6 <= 82)
  {
    if (v6 > 72)
    {
      switch(v6)
      {
        case 'I':
LABEL_26:
          v31 = 0;
          v32 = 0;
          v33 = 0;
          v34 = (int *)MEMORY[0x1E0D82BF0];
          v35 = (int *)MEMORY[0x1E0D82BD8];
          v36 = (int *)MEMORY[0x1E0D82BB8];
          while (1)
          {
            v37 = *v34;
            v38 = *(_QWORD *)(a1 + v37);
            v39 = v38 + 1;
            if (v38 == -1 || v39 > *(_QWORD *)(a1 + *v35))
              break;
            v40 = *(_BYTE *)(*(_QWORD *)(a1 + *v36) + v38);
            *(_QWORD *)(a1 + v37) = v39;
            v33 |= (unint64_t)(v40 & 0x7F) << v31;
            if ((v40 & 0x80) == 0)
              goto LABEL_72;
            v31 += 7;
            v20 = v32++ >= 9;
            if (v20)
            {
              LODWORD(v33) = 0;
              goto LABEL_74;
            }
          }
          *(_BYTE *)(a1 + (int)*MEMORY[0x1E0D82BC8]) = 1;
LABEL_72:
          if (*(_BYTE *)(a1 + (int)*MEMORY[0x1E0D82BC8]))
            LODWORD(v33) = 0;
LABEL_74:
          *(_DWORD *)a3 = v33;
          return 1;
        case 'L':
LABEL_33:
          v41 = 0;
          v42 = 0;
          v12 = 0;
          v43 = (int *)MEMORY[0x1E0D82BF0];
          v44 = (int *)MEMORY[0x1E0D82BD8];
          v45 = (int *)MEMORY[0x1E0D82BB8];
          while (1)
          {
            v46 = *v43;
            v47 = *(_QWORD *)(a1 + v46);
            v48 = v47 + 1;
            if (v47 == -1 || v48 > *(_QWORD *)(a1 + *v44))
              goto LABEL_40;
            v49 = *(_BYTE *)(*(_QWORD *)(a1 + *v45) + v47);
            *(_QWORD *)(a1 + v46) = v48;
            v12 |= (unint64_t)(v49 & 0x7F) << v41;
            if ((v49 & 0x80) == 0)
              goto LABEL_41;
            v41 += 7;
            v20 = v42++ >= 9;
            if (v20)
            {
LABEL_39:
              v12 = 0;
              goto LABEL_43;
            }
          }
        case 'Q':
LABEL_10:
          v10 = 0;
          v11 = 0;
          v12 = 0;
          v13 = (int *)MEMORY[0x1E0D82BF0];
          v14 = (int *)MEMORY[0x1E0D82BD8];
          v15 = (int *)MEMORY[0x1E0D82BB8];
          while (1)
          {
            v16 = *v13;
            v17 = *(_QWORD *)(a1 + v16);
            v18 = v17 + 1;
            if (v17 == -1 || v18 > *(_QWORD *)(a1 + *v14))
              break;
            v19 = *(_BYTE *)(*(_QWORD *)(a1 + *v15) + v17);
            *(_QWORD *)(a1 + v16) = v18;
            v12 |= (unint64_t)(v19 & 0x7F) << v10;
            if ((v19 & 0x80) == 0)
              goto LABEL_41;
            v10 += 7;
            v20 = v11++ >= 9;
            if (v20)
              goto LABEL_39;
          }
LABEL_40:
          *(_BYTE *)(a1 + (int)*MEMORY[0x1E0D82BC8]) = 1;
LABEL_41:
          if (*(_BYTE *)(a1 + (int)*MEMORY[0x1E0D82BC8]))
            v12 = 0;
LABEL_43:
          *(_QWORD *)a3 = v12;
          return 1;
      }
LABEL_208:
      v163 = (void *)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("unsupported encoding:%s"), *(_QWORD *)(a2 + 8));
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138544130;
        v165 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "BOOL _BSProtobufDecodePOD(PBDataReader *, _BSProtobufFieldEntry *, void *, NSError **)");
        v166 = 2114;
        v167 = CFSTR("BSProtobufSerialization.m");
        v168 = 1024;
        v169 = 987;
        v170 = 2114;
        v171 = v163;
        _os_log_error_impl(&dword_18A184000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ (%{public}@:%i) : %{public}@", buf, 0x26u);
      }
      goto LABEL_213;
    }
    if (v6 == 66)
    {
      v64 = 0;
      v65 = 0;
      v66 = 0;
      v67 = (int *)MEMORY[0x1E0D82BF0];
      v68 = (int *)MEMORY[0x1E0D82BD8];
      v69 = (int *)MEMORY[0x1E0D82BB8];
      while (1)
      {
        v70 = *v67;
        v71 = *(_QWORD *)(a1 + v70);
        v72 = v71 + 1;
        if (v71 == -1 || v72 > *(_QWORD *)(a1 + *v68))
          break;
        v73 = *(_BYTE *)(*(_QWORD *)(a1 + *v69) + v71);
        *(_QWORD *)(a1 + v70) = v72;
        v66 |= (unint64_t)(v73 & 0x7F) << v64;
        if ((v73 & 0x80) == 0)
          goto LABEL_83;
        v64 += 7;
        v20 = v65++ >= 9;
        if (v20)
        {
LABEL_67:
          LOBYTE(v23) = 0;
          goto LABEL_89;
        }
      }
      *(_BYTE *)(a1 + (int)*MEMORY[0x1E0D82BC8]) = 1;
LABEL_83:
      if (*(_BYTE *)(a1 + (int)*MEMORY[0x1E0D82BC8]))
        v77 = 1;
      else
        v77 = v66 == 0;
      LOBYTE(v23) = !v77;
    }
    else
    {
      if (v6 != 67)
        goto LABEL_208;
LABEL_19:
      v21 = 0;
      v22 = 0;
      v23 = 0;
      v24 = (int *)MEMORY[0x1E0D82BF0];
      v25 = (int *)MEMORY[0x1E0D82BD8];
      v26 = (int *)MEMORY[0x1E0D82BB8];
      while (1)
      {
        v27 = *v24;
        v28 = *(_QWORD *)(a1 + v27);
        v29 = v28 + 1;
        if (v28 == -1 || v29 > *(_QWORD *)(a1 + *v25))
          break;
        v30 = *(_BYTE *)(*(_QWORD *)(a1 + *v26) + v28);
        *(_QWORD *)(a1 + v27) = v29;
        v23 |= (unint64_t)(v30 & 0x7F) << v21;
        if ((v30 & 0x80) == 0)
          goto LABEL_69;
        v21 += 7;
        v20 = v22++ >= 9;
        if (v20)
          goto LABEL_67;
      }
      *(_BYTE *)(a1 + (int)*MEMORY[0x1E0D82BC8]) = 1;
LABEL_69:
      if (*(_BYTE *)(a1 + (int)*MEMORY[0x1E0D82BC8]))
        LOBYTE(v23) = 0;
    }
LABEL_89:
    *(_BYTE *)a3 = v23;
    return 1;
  }
  switch(*v5)
  {
    case 'c':
      goto LABEL_19;
    case 'd':
      v7 = (int)*MEMORY[0x1E0D82BF0];
      v8 = *(_QWORD *)(a1 + v7);
      if (v8 <= 0xFFFFFFFFFFFFFFF7 && v8 + 8 <= *(_QWORD *)(a1 + (int)*MEMORY[0x1E0D82BD8]))
      {
        v9 = *(_QWORD *)(*(_QWORD *)(a1 + (int)*MEMORY[0x1E0D82BB8]) + v8);
        *(_QWORD *)(a1 + v7) = v8 + 8;
      }
      else
      {
        *(_BYTE *)(a1 + (int)*MEMORY[0x1E0D82BC8]) = 1;
        v9 = 0;
      }
      *(_QWORD *)a3 = v9;
      return 1;
    case 'e':
    case 'g':
    case 'h':
    case 'j':
    case 'k':
    case 'm':
    case 'n':
    case 'o':
    case 'p':
    case 'r':
      goto LABEL_208;
    case 'f':
      v74 = (int)*MEMORY[0x1E0D82BF0];
      v75 = *(_QWORD *)(a1 + v74);
      if (v75 <= 0xFFFFFFFFFFFFFFFBLL && v75 + 4 <= *(_QWORD *)(a1 + (int)*MEMORY[0x1E0D82BD8]))
      {
        v76 = *(_DWORD *)(*(_QWORD *)(a1 + (int)*MEMORY[0x1E0D82BB8]) + v75);
        *(_QWORD *)(a1 + v74) = v75 + 4;
      }
      else
      {
        *(_BYTE *)(a1 + (int)*MEMORY[0x1E0D82BC8]) = 1;
        v76 = 0;
      }
      *(_DWORD *)a3 = v76;
      return 1;
    case 'i':
      goto LABEL_26;
    case 'l':
      goto LABEL_33;
    case 'q':
      goto LABEL_10;
    case 's':
      goto LABEL_54;
    default:
      if (v6 == 83)
      {
LABEL_54:
        v54 = 0;
        v55 = 0;
        v56 = 0;
        v57 = (int *)MEMORY[0x1E0D82BF0];
        v58 = (int *)MEMORY[0x1E0D82BD8];
        v59 = (int *)MEMORY[0x1E0D82BB8];
        while (1)
        {
          v60 = *v57;
          v61 = *(_QWORD *)(a1 + v60);
          v62 = v61 + 1;
          if (v61 == -1 || v62 > *(_QWORD *)(a1 + *v58))
            break;
          v63 = *(_BYTE *)(*(_QWORD *)(a1 + *v59) + v61);
          *(_QWORD *)(a1 + v60) = v62;
          v56 |= (unint64_t)(v63 & 0x7F) << v54;
          if ((v63 & 0x80) == 0)
            goto LABEL_76;
          v54 += 7;
          v20 = v55++ >= 9;
          if (v20)
          {
            LOWORD(v56) = 0;
            goto LABEL_78;
          }
        }
        *(_BYTE *)(a1 + (int)*MEMORY[0x1E0D82BC8]) = 1;
LABEL_76:
        if (*(_BYTE *)(a1 + (int)*MEMORY[0x1E0D82BC8]))
          LOWORD(v56) = 0;
LABEL_78:
        *(_WORD *)a3 = v56;
        return 1;
      }
      if (v6 != 123)
        goto LABEL_208;
      if (!strncmp("{CGPoint=", *(const char **)(a2 + 8), 9uLL) || !strncmp("{CGSize=", v5, 8uLL))
      {
        v78 = (int *)MEMORY[0x1E0D82BF0];
        v79 = (int)*MEMORY[0x1E0D82BF0];
        v80 = *(_QWORD *)(a1 + v79);
        if (v80 <= 0xFFFFFFFFFFFFFFF7 && v80 + 8 <= *(_QWORD *)(a1 + (int)*MEMORY[0x1E0D82BD8]))
        {
          v81 = *(_QWORD *)(*(_QWORD *)(a1 + (int)*MEMORY[0x1E0D82BB8]) + v80);
          *(_QWORD *)(a1 + v79) = v80 + 8;
        }
        else
        {
          *(_BYTE *)(a1 + (int)*MEMORY[0x1E0D82BC8]) = 1;
          v81 = 0;
        }
        *(_QWORD *)a3 = v81;
        v82 = *v78;
        v83 = *(_QWORD *)(a1 + v82);
        if (v83 <= 0xFFFFFFFFFFFFFFF7 && v83 + 8 <= *(_QWORD *)(a1 + (int)*MEMORY[0x1E0D82BD8]))
        {
          v84 = *(_QWORD *)(*(_QWORD *)(a1 + (int)*MEMORY[0x1E0D82BB8]) + v83);
          *(_QWORD *)(a1 + v82) = v83 + 8;
        }
        else
        {
          *(_BYTE *)(a1 + (int)*MEMORY[0x1E0D82BC8]) = 1;
          v84 = 0;
        }
        *(_QWORD *)(a3 + 8) = v84;
      }
      else if (!strncmp("{CGRect=", v5, 8uLL))
      {
        v85 = (int *)MEMORY[0x1E0D82BF0];
        v86 = (int)*MEMORY[0x1E0D82BF0];
        v87 = *(_QWORD *)(a1 + v86);
        if (v87 <= 0xFFFFFFFFFFFFFFF7 && v87 + 8 <= *(_QWORD *)(a1 + (int)*MEMORY[0x1E0D82BD8]))
        {
          v88 = *(_QWORD *)(*(_QWORD *)(a1 + (int)*MEMORY[0x1E0D82BB8]) + v87);
          *(_QWORD *)(a1 + v86) = v87 + 8;
        }
        else
        {
          *(_BYTE *)(a1 + (int)*MEMORY[0x1E0D82BC8]) = 1;
          v88 = 0;
        }
        *(_QWORD *)a3 = v88;
        v138 = *v85;
        v139 = *(_QWORD *)(a1 + v138);
        if (v139 <= 0xFFFFFFFFFFFFFFF7 && v139 + 8 <= *(_QWORD *)(a1 + (int)*MEMORY[0x1E0D82BD8]))
        {
          v140 = *(_QWORD *)(*(_QWORD *)(a1 + (int)*MEMORY[0x1E0D82BB8]) + v139);
          *(_QWORD *)(a1 + v138) = v139 + 8;
        }
        else
        {
          *(_BYTE *)(a1 + (int)*MEMORY[0x1E0D82BC8]) = 1;
          v140 = 0;
        }
        *(_QWORD *)(a3 + 8) = v140;
        v141 = *v85;
        v142 = *(_QWORD *)(a1 + v141);
        if (v142 <= 0xFFFFFFFFFFFFFFF7 && v142 + 8 <= *(_QWORD *)(a1 + (int)*MEMORY[0x1E0D82BD8]))
        {
          v143 = *(_QWORD *)(*(_QWORD *)(a1 + (int)*MEMORY[0x1E0D82BB8]) + v142);
          *(_QWORD *)(a1 + v141) = v142 + 8;
        }
        else
        {
          *(_BYTE *)(a1 + (int)*MEMORY[0x1E0D82BC8]) = 1;
          v143 = 0;
        }
        *(_QWORD *)(a3 + 16) = v143;
        v144 = *v85;
        v145 = *(_QWORD *)(a1 + v144);
        if (v145 <= 0xFFFFFFFFFFFFFFF7 && v145 + 8 <= *(_QWORD *)(a1 + (int)*MEMORY[0x1E0D82BD8]))
        {
          v146 = *(_QWORD *)(*(_QWORD *)(a1 + (int)*MEMORY[0x1E0D82BB8]) + v145);
          *(_QWORD *)(a1 + v144) = v145 + 8;
        }
        else
        {
          *(_BYTE *)(a1 + (int)*MEMORY[0x1E0D82BC8]) = 1;
          v146 = 0;
        }
        *(_QWORD *)(a3 + 24) = v146;
      }
      else
      {
        if (strncmp("{CGAffineTransform=", v5, 0x13uLL))
        {
          if (!strncmp("{CATransform3D=", v5, 0xFuLL))
          {
            v50 = (int *)MEMORY[0x1E0D82BF0];
            v51 = (int)*MEMORY[0x1E0D82BF0];
            v52 = *(_QWORD *)(a1 + v51);
            if (v52 <= 0xFFFFFFFFFFFFFFF7 && v52 + 8 <= *(_QWORD *)(a1 + (int)*MEMORY[0x1E0D82BD8]))
            {
              v53 = *(_QWORD *)(*(_QWORD *)(a1 + (int)*MEMORY[0x1E0D82BB8]) + v52);
              *(_QWORD *)(a1 + v51) = v52 + 8;
            }
            else
            {
              *(_BYTE *)(a1 + (int)*MEMORY[0x1E0D82BC8]) = 1;
              v53 = 0;
            }
            *(_QWORD *)a3 = v53;
            v93 = *v50;
            v94 = *(_QWORD *)(a1 + v93);
            if (v94 <= 0xFFFFFFFFFFFFFFF7 && v94 + 8 <= *(_QWORD *)(a1 + (int)*MEMORY[0x1E0D82BD8]))
            {
              v95 = *(_QWORD *)(*(_QWORD *)(a1 + (int)*MEMORY[0x1E0D82BB8]) + v94);
              *(_QWORD *)(a1 + v93) = v94 + 8;
            }
            else
            {
              *(_BYTE *)(a1 + (int)*MEMORY[0x1E0D82BC8]) = 1;
              v95 = 0;
            }
            *(_QWORD *)(a3 + 8) = v95;
            v96 = *v50;
            v97 = *(_QWORD *)(a1 + v96);
            if (v97 <= 0xFFFFFFFFFFFFFFF7 && v97 + 8 <= *(_QWORD *)(a1 + (int)*MEMORY[0x1E0D82BD8]))
            {
              v98 = *(_QWORD *)(*(_QWORD *)(a1 + (int)*MEMORY[0x1E0D82BB8]) + v97);
              *(_QWORD *)(a1 + v96) = v97 + 8;
            }
            else
            {
              *(_BYTE *)(a1 + (int)*MEMORY[0x1E0D82BC8]) = 1;
              v98 = 0;
            }
            *(_QWORD *)(a3 + 16) = v98;
            v99 = *v50;
            v100 = *(_QWORD *)(a1 + v99);
            if (v100 <= 0xFFFFFFFFFFFFFFF7 && v100 + 8 <= *(_QWORD *)(a1 + (int)*MEMORY[0x1E0D82BD8]))
            {
              v101 = *(_QWORD *)(*(_QWORD *)(a1 + (int)*MEMORY[0x1E0D82BB8]) + v100);
              *(_QWORD *)(a1 + v99) = v100 + 8;
            }
            else
            {
              *(_BYTE *)(a1 + (int)*MEMORY[0x1E0D82BC8]) = 1;
              v101 = 0;
            }
            *(_QWORD *)(a3 + 24) = v101;
            v102 = *v50;
            v103 = *(_QWORD *)(a1 + v102);
            if (v103 <= 0xFFFFFFFFFFFFFFF7 && v103 + 8 <= *(_QWORD *)(a1 + (int)*MEMORY[0x1E0D82BD8]))
            {
              v104 = *(_QWORD *)(*(_QWORD *)(a1 + (int)*MEMORY[0x1E0D82BB8]) + v103);
              *(_QWORD *)(a1 + v102) = v103 + 8;
            }
            else
            {
              *(_BYTE *)(a1 + (int)*MEMORY[0x1E0D82BC8]) = 1;
              v104 = 0;
            }
            *(_QWORD *)(a3 + 32) = v104;
            v105 = *v50;
            v106 = *(_QWORD *)(a1 + v105);
            if (v106 <= 0xFFFFFFFFFFFFFFF7 && v106 + 8 <= *(_QWORD *)(a1 + (int)*MEMORY[0x1E0D82BD8]))
            {
              v107 = *(_QWORD *)(*(_QWORD *)(a1 + (int)*MEMORY[0x1E0D82BB8]) + v106);
              *(_QWORD *)(a1 + v105) = v106 + 8;
            }
            else
            {
              *(_BYTE *)(a1 + (int)*MEMORY[0x1E0D82BC8]) = 1;
              v107 = 0;
            }
            *(_QWORD *)(a3 + 40) = v107;
            v108 = *v50;
            v109 = *(_QWORD *)(a1 + v108);
            if (v109 <= 0xFFFFFFFFFFFFFFF7 && v109 + 8 <= *(_QWORD *)(a1 + (int)*MEMORY[0x1E0D82BD8]))
            {
              v110 = *(_QWORD *)(*(_QWORD *)(a1 + (int)*MEMORY[0x1E0D82BB8]) + v109);
              *(_QWORD *)(a1 + v108) = v109 + 8;
            }
            else
            {
              *(_BYTE *)(a1 + (int)*MEMORY[0x1E0D82BC8]) = 1;
              v110 = 0;
            }
            *(_QWORD *)(a3 + 48) = v110;
            v111 = *v50;
            v112 = *(_QWORD *)(a1 + v111);
            if (v112 <= 0xFFFFFFFFFFFFFFF7 && v112 + 8 <= *(_QWORD *)(a1 + (int)*MEMORY[0x1E0D82BD8]))
            {
              v113 = *(_QWORD *)(*(_QWORD *)(a1 + (int)*MEMORY[0x1E0D82BB8]) + v112);
              *(_QWORD *)(a1 + v111) = v112 + 8;
            }
            else
            {
              *(_BYTE *)(a1 + (int)*MEMORY[0x1E0D82BC8]) = 1;
              v113 = 0;
            }
            *(_QWORD *)(a3 + 56) = v113;
            v114 = *v50;
            v115 = *(_QWORD *)(a1 + v114);
            if (v115 <= 0xFFFFFFFFFFFFFFF7 && v115 + 8 <= *(_QWORD *)(a1 + (int)*MEMORY[0x1E0D82BD8]))
            {
              v116 = *(_QWORD *)(*(_QWORD *)(a1 + (int)*MEMORY[0x1E0D82BB8]) + v115);
              *(_QWORD *)(a1 + v114) = v115 + 8;
            }
            else
            {
              *(_BYTE *)(a1 + (int)*MEMORY[0x1E0D82BC8]) = 1;
              v116 = 0;
            }
            *(_QWORD *)(a3 + 64) = v116;
            v117 = *v50;
            v118 = *(_QWORD *)(a1 + v117);
            if (v118 <= 0xFFFFFFFFFFFFFFF7 && v118 + 8 <= *(_QWORD *)(a1 + (int)*MEMORY[0x1E0D82BD8]))
            {
              v119 = *(_QWORD *)(*(_QWORD *)(a1 + (int)*MEMORY[0x1E0D82BB8]) + v118);
              *(_QWORD *)(a1 + v117) = v118 + 8;
            }
            else
            {
              *(_BYTE *)(a1 + (int)*MEMORY[0x1E0D82BC8]) = 1;
              v119 = 0;
            }
            *(_QWORD *)(a3 + 72) = v119;
            v120 = *v50;
            v121 = *(_QWORD *)(a1 + v120);
            if (v121 <= 0xFFFFFFFFFFFFFFF7 && v121 + 8 <= *(_QWORD *)(a1 + (int)*MEMORY[0x1E0D82BD8]))
            {
              v122 = *(_QWORD *)(*(_QWORD *)(a1 + (int)*MEMORY[0x1E0D82BB8]) + v121);
              *(_QWORD *)(a1 + v120) = v121 + 8;
            }
            else
            {
              *(_BYTE *)(a1 + (int)*MEMORY[0x1E0D82BC8]) = 1;
              v122 = 0;
            }
            *(_QWORD *)(a3 + 80) = v122;
            v123 = *v50;
            v124 = *(_QWORD *)(a1 + v123);
            if (v124 <= 0xFFFFFFFFFFFFFFF7 && v124 + 8 <= *(_QWORD *)(a1 + (int)*MEMORY[0x1E0D82BD8]))
            {
              v125 = *(_QWORD *)(*(_QWORD *)(a1 + (int)*MEMORY[0x1E0D82BB8]) + v124);
              *(_QWORD *)(a1 + v123) = v124 + 8;
            }
            else
            {
              *(_BYTE *)(a1 + (int)*MEMORY[0x1E0D82BC8]) = 1;
              v125 = 0;
            }
            *(_QWORD *)(a3 + 88) = v125;
            v126 = *v50;
            v127 = *(_QWORD *)(a1 + v126);
            if (v127 <= 0xFFFFFFFFFFFFFFF7 && v127 + 8 <= *(_QWORD *)(a1 + (int)*MEMORY[0x1E0D82BD8]))
            {
              v128 = *(_QWORD *)(*(_QWORD *)(a1 + (int)*MEMORY[0x1E0D82BB8]) + v127);
              *(_QWORD *)(a1 + v126) = v127 + 8;
            }
            else
            {
              *(_BYTE *)(a1 + (int)*MEMORY[0x1E0D82BC8]) = 1;
              v128 = 0;
            }
            *(_QWORD *)(a3 + 96) = v128;
            v129 = *v50;
            v130 = *(_QWORD *)(a1 + v129);
            if (v130 <= 0xFFFFFFFFFFFFFFF7 && v130 + 8 <= *(_QWORD *)(a1 + (int)*MEMORY[0x1E0D82BD8]))
            {
              v131 = *(_QWORD *)(*(_QWORD *)(a1 + (int)*MEMORY[0x1E0D82BB8]) + v130);
              *(_QWORD *)(a1 + v129) = v130 + 8;
            }
            else
            {
              *(_BYTE *)(a1 + (int)*MEMORY[0x1E0D82BC8]) = 1;
              v131 = 0;
            }
            *(_QWORD *)(a3 + 104) = v131;
            v132 = *v50;
            v133 = *(_QWORD *)(a1 + v132);
            if (v133 <= 0xFFFFFFFFFFFFFFF7 && v133 + 8 <= *(_QWORD *)(a1 + (int)*MEMORY[0x1E0D82BD8]))
            {
              v134 = *(_QWORD *)(*(_QWORD *)(a1 + (int)*MEMORY[0x1E0D82BB8]) + v133);
              *(_QWORD *)(a1 + v132) = v133 + 8;
            }
            else
            {
              *(_BYTE *)(a1 + (int)*MEMORY[0x1E0D82BC8]) = 1;
              v134 = 0;
            }
            *(_QWORD *)(a3 + 112) = v134;
            v135 = *v50;
            v136 = *(_QWORD *)(a1 + v135);
            if (v136 <= 0xFFFFFFFFFFFFFFF7 && v136 + 8 <= *(_QWORD *)(a1 + (int)*MEMORY[0x1E0D82BD8]))
            {
              v137 = *(_QWORD *)(*(_QWORD *)(a1 + (int)*MEMORY[0x1E0D82BB8]) + v136);
              *(_QWORD *)(a1 + v135) = v136 + 8;
            }
            else
            {
              *(_BYTE *)(a1 + (int)*MEMORY[0x1E0D82BC8]) = 1;
              v137 = 0;
            }
            *(_QWORD *)(a3 + 120) = v137;
            return 1;
          }
          v163 = (void *)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("unsupported encoding:%s"), v5);
          if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138544130;
            v165 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "BOOL _BSProtobufDecodePOD(PBDataReader *, _BSProtobufFieldEntry *, void *, NSError **)");
            v166 = 2114;
            v167 = CFSTR("BSProtobufSerialization.m");
            v168 = 1024;
            v169 = 981;
            v170 = 2114;
            v171 = v163;
            _os_log_error_impl(&dword_18A184000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ (%{public}@:%i) : %{public}@", buf, 0x26u);
          }
LABEL_213:
          qword_1EDF5BAE8 = objc_msgSend(v163, "UTF8String");
          __break(0);
          JUMPOUT(0x18A1B120CLL);
        }
        v89 = (int *)MEMORY[0x1E0D82BF0];
        v90 = (int)*MEMORY[0x1E0D82BF0];
        v91 = *(_QWORD *)(a1 + v90);
        if (v91 <= 0xFFFFFFFFFFFFFFF7 && v91 + 8 <= *(_QWORD *)(a1 + (int)*MEMORY[0x1E0D82BD8]))
        {
          v92 = *(_QWORD *)(*(_QWORD *)(a1 + (int)*MEMORY[0x1E0D82BB8]) + v91);
          *(_QWORD *)(a1 + v90) = v91 + 8;
        }
        else
        {
          *(_BYTE *)(a1 + (int)*MEMORY[0x1E0D82BC8]) = 1;
          v92 = 0;
        }
        *(_QWORD *)a3 = v92;
        v147 = *v89;
        v148 = *(_QWORD *)(a1 + v147);
        if (v148 <= 0xFFFFFFFFFFFFFFF7 && v148 + 8 <= *(_QWORD *)(a1 + (int)*MEMORY[0x1E0D82BD8]))
        {
          v149 = *(_QWORD *)(*(_QWORD *)(a1 + (int)*MEMORY[0x1E0D82BB8]) + v148);
          *(_QWORD *)(a1 + v147) = v148 + 8;
        }
        else
        {
          *(_BYTE *)(a1 + (int)*MEMORY[0x1E0D82BC8]) = 1;
          v149 = 0;
        }
        *(_QWORD *)(a3 + 8) = v149;
        v150 = *v89;
        v151 = *(_QWORD *)(a1 + v150);
        if (v151 <= 0xFFFFFFFFFFFFFFF7 && v151 + 8 <= *(_QWORD *)(a1 + (int)*MEMORY[0x1E0D82BD8]))
        {
          v152 = *(_QWORD *)(*(_QWORD *)(a1 + (int)*MEMORY[0x1E0D82BB8]) + v151);
          *(_QWORD *)(a1 + v150) = v151 + 8;
        }
        else
        {
          *(_BYTE *)(a1 + (int)*MEMORY[0x1E0D82BC8]) = 1;
          v152 = 0;
        }
        *(_QWORD *)(a3 + 16) = v152;
        v153 = *v89;
        v154 = *(_QWORD *)(a1 + v153);
        if (v154 <= 0xFFFFFFFFFFFFFFF7 && v154 + 8 <= *(_QWORD *)(a1 + (int)*MEMORY[0x1E0D82BD8]))
        {
          v155 = *(_QWORD *)(*(_QWORD *)(a1 + (int)*MEMORY[0x1E0D82BB8]) + v154);
          *(_QWORD *)(a1 + v153) = v154 + 8;
        }
        else
        {
          *(_BYTE *)(a1 + (int)*MEMORY[0x1E0D82BC8]) = 1;
          v155 = 0;
        }
        *(_QWORD *)(a3 + 24) = v155;
        v156 = *v89;
        v157 = *(_QWORD *)(a1 + v156);
        if (v157 <= 0xFFFFFFFFFFFFFFF7 && v157 + 8 <= *(_QWORD *)(a1 + (int)*MEMORY[0x1E0D82BD8]))
        {
          v158 = *(_QWORD *)(*(_QWORD *)(a1 + (int)*MEMORY[0x1E0D82BB8]) + v157);
          *(_QWORD *)(a1 + v156) = v157 + 8;
        }
        else
        {
          *(_BYTE *)(a1 + (int)*MEMORY[0x1E0D82BC8]) = 1;
          v158 = 0;
        }
        *(_QWORD *)(a3 + 32) = v158;
        v159 = *v89;
        v160 = *(_QWORD *)(a1 + v159);
        if (v160 <= 0xFFFFFFFFFFFFFFF7 && v160 + 8 <= *(_QWORD *)(a1 + (int)*MEMORY[0x1E0D82BD8]))
        {
          v161 = *(_QWORD *)(*(_QWORD *)(a1 + (int)*MEMORY[0x1E0D82BB8]) + v160);
          *(_QWORD *)(a1 + v159) = v160 + 8;
        }
        else
        {
          *(_BYTE *)(a1 + (int)*MEMORY[0x1E0D82BC8]) = 1;
          v161 = 0;
        }
        *(_QWORD *)(a3 + 40) = v161;
      }
      break;
  }
  return 1;
}

uint64_t _BSProtobufDecodeObject(_BYTE *a1, uint64_t a2, void **a3, _QWORD *a4)
{
  return _BSProtobufDecodeObjectWithClassOverride(a1, *(void **)(a2 + 32), a3, a4);
}

uint64_t _BSProtobufEncodeString(uint64_t a1, uint64_t a2, _QWORD *a3)
{
  if (*a3)
    PBDataWriterWriteStringField();
  return 1;
}

uint64_t _BSProtobufDecodeString(uint64_t a1, uint64_t a2, _QWORD *a3)
{
  *a3 = (id)PBReaderReadString();
  return 1;
}

void sub_18A1B13F4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{

  _Unwind_Resume(a1);
}

void sub_18A1B164C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  _Unwind_Resume(a1);
}

id _BSCreateObjectOfClassesFromData(void *a1, void *a2)
{
  id v3;
  id v4;
  void *v5;
  void *v6;
  id v7;
  NSObject *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  NSObject *v13;
  id v14;
  objc_class *v16;
  void *v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  id v22;
  uint8_t buf[4];
  id v24;
  __int16 v25;
  void *v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v3 = a1;
  v4 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && objc_msgSend(v4, "length") && objc_msgSend(v3, "count"))
  {
    v5 = (void *)MEMORY[0x18D769AE0]();
    v22 = 0;
    objc_msgSend(MEMORY[0x1E0CB3710], "unarchivedObjectOfClasses:fromData:error:", v3, v4, &v22);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v22;
    if (v7)
    {
      BSLogCommon();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543362;
        v24 = v7;
        _os_log_error_impl(&dword_18A184000, v8, OS_LOG_TYPE_ERROR, "Error during decoding of data: %{public}@", buf, 0xCu);
      }

    }
    if (v6)
    {
      v20 = 0u;
      v21 = 0u;
      v18 = 0u;
      v19 = 0u;
      v9 = v3;
      v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v18, v27, 16);
      if (v10)
      {
        v11 = *(_QWORD *)v19;
        while (2)
        {
          for (i = 0; i != v10; ++i)
          {
            if (*(_QWORD *)v19 != v11)
              objc_enumerationMutation(v9);
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {

              v14 = v6;
              goto LABEL_25;
            }
          }
          v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v18, v27, 16);
          if (v10)
            continue;
          break;
        }
      }

      if (!v7)
      {
        BSLogCommon();
        v13 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
        {
          v16 = (objc_class *)objc_opt_class();
          NSStringFromClass(v16);
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          v24 = v9;
          v25 = 2114;
          v26 = v17;
          _os_log_error_impl(&dword_18A184000, v13, OS_LOG_TYPE_ERROR, "Error during decoding of data to types=%{public}@: decoded %{public}@ instead but unarchiver didn't filter it", buf, 0x16u);

        }
      }
    }
    v14 = 0;
LABEL_25:

    objc_autoreleasePoolPop(v5);
  }
  else
  {
    v14 = 0;
  }

  return v14;
}

void sub_18A1B195C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  _Unwind_Resume(a1);
}

void BSDispatchMain(void *a1)
{
  void (**block)(_QWORD);

  block = a1;
  if (objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread"))
    block[2](block);
  else
    dispatch_async(MEMORY[0x1E0C80D38], block);

}

void sub_18A1B1A08(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

double BSRadiansToDegrees(double a1)
{
  return a1 * 57.2957795;
}

void sub_18A1B1AA8(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_18A1B1B04(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_18A1B1E6C(_Unwind_Exception *a1)
{
  id *v1;
  id *v2;
  uint64_t v3;

  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v3 - 88));
  _Unwind_Resume(a1);
}

void sub_18A1B2100(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  _Unwind_Resume(a1);
}

void sub_18A1B2310(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  _Unwind_Resume(a1);
}

void BSSerializeCGSizeToXPCDictionaryWithKey(void *a1, const char *a2, double a3, double a4)
{
  xpc_object_t v7;
  xpc_object_t xdict;

  xdict = a1;
  if (xdict && a2)
  {
    v7 = BSCreateSerializedXPCObjectFromCGSize(a3, a4);
    xpc_dictionary_set_value(xdict, a2, v7);

  }
}

void sub_18A1B244C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

xpc_object_t BSCreateSerializedXPCObjectFromCGSize(double a1, double a2)
{
  xpc_object_t v3;
  uint64_t i;
  xpc_object_t objects[3];

  objects[2] = *(xpc_object_t *)MEMORY[0x1E0C80C00];
  objects[0] = xpc_double_create(a1);
  objects[1] = xpc_double_create(a2);
  v3 = xpc_array_create(objects, 2uLL);
  for (i = 1; i != -1; --i)

  return v3;
}

void sub_18A1B2514(_Unwind_Exception *a1)
{
  uint64_t v1;
  uint64_t i;

  for (i = 8; i != -8; i -= 8)

  _Unwind_Resume(a1);
}

void sub_18A1B26D0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, _Unwind_Exception *exception_object, objc_super a11)
{
  void *v11;

  a11.super_class = (Class)BSDispatchTimer;
  -[_Unwind_Exception dealloc](&a11, sel_dealloc);
  _Unwind_Resume(a1);
}

void sub_18A1B2718(_Unwind_Exception *a1, int a2)
{
  if (a2)
    objc_terminate();
  _Unwind_Resume(a1);
}

void sub_18A1B2804(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_18A1B296C(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_18A1B2B90(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{
  void *v10;
  void *v11;

  _Unwind_Resume(a1);
}

void sub_18A1B2D9C(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_18A1B2ED4(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

BOOL BSMachCreateReceiveRight(mach_port_name_t *a1)
{
  mach_error_t v2;
  mach_port_name_t v3;
  mach_port_name_t name;

  name = 0;
  v2 = mach_port_allocate(*MEMORY[0x1E0C83DA0], 1u, &name);
  v3 = name;
  if (v2)
  {
    _BSMachError(name, v2, CFSTR("Unable to allocate receive right"));
    v3 = 0;
  }
  if (a1)
    *a1 = v3;
  return v3 - 1 < 0xFFFFFFFE;
}

void sub_18A1B3064(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_18A1B31A8(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void __lockAndExecute(os_unfair_lock_s *a1, uint64_t a2)
{
  os_unfair_lock_lock(a1);
  (*(void (**)(uint64_t))(a2 + 16))(a2);
  os_unfair_lock_unlock(a1);
}

void sub_18A1B348C(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_18A1B3580(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_18A1B35E4(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_18A1B36CC(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_18A1B38F0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, _Unwind_Exception *exception_object)
{
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  _Unwind_Resume(a1);
}

void sub_18A1B39EC(_Unwind_Exception *exception_object)
{
  void *v1;
  uint64_t v2;

  if (!v2)

  _Unwind_Resume(exception_object);
}

void sub_18A1B3CC0(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_18A1B3DE8(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_18A1B4048(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_18A1B42B4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, _Unwind_Exception *exception_object)
{
  void *v10;
  void *v11;
  void *v12;

  _Unwind_Resume(a1);
}

void sub_18A1B47B4(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_18A1B4840(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_18A1B48B4(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_18A1B49C4(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void BSAuditTokenForCurrentProcess(_OWORD *a1@<X8>)
{
  __int128 v1;
  void *v2;
  id v3;

  *(_QWORD *)&v1 = -1;
  *((_QWORD *)&v1 + 1) = -1;
  *a1 = v1;
  a1[1] = v1;
  if (!BSAuditTokenForTask(*MEMORY[0x1E0C83DA0], a1))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "audit_token_t BSAuditTokenForCurrentProcess(void)");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v2, CFSTR("BSSecurityUtilities.m"), 116, CFSTR("Failed to fetch audit token for current task."));

  }
}

void sub_18A1B4A88(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void sub_18A1B4B40(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_18A1B4C10(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_18A1B4D04(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_18A1B5004(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, _Unwind_Exception *exception_object)
{
  void *v10;
  void *v11;
  void *v12;

  _Unwind_Resume(a1);
}

void sub_18A1B523C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  void *v7;
  void *v8;
  va_list va;

  va_start(va, a7);
  v8 = v7;

  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_18A1B537C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_18A1B54F4(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

BOOL BSMachSendRightRetain(mach_port_name_t name)
{
  int v1;
  mach_error_t inserted;

  v1 = name;
  if (name - 1 <= 0xFFFFFFFD)
  {
    inserted = mach_port_insert_right(*MEMORY[0x1E0C83DA0], name, name, 0x13u);
    if (inserted)
    {
      _BSMachError(v1, inserted, CFSTR("Unable to insert COPY_SEND"));
      v1 = 0;
    }
  }
  return (v1 - 1) < 0xFFFFFFFE;
}

BOOL BSAuditTokenForTask(task_name_t a1, _OWORD *a2)
{
  __int128 v3;
  mach_error_t v4;
  _BOOL8 v5;
  NSObject *v6;
  __int128 v7;
  char *v9;
  mach_msg_type_number_t task_info_outCnt;
  integer_t task_info_out[4];
  __int128 v12;
  uint8_t buf[4];
  const char *v14;
  __int16 v15;
  char *v16;
  __int16 v17;
  mach_error_t v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  *(_QWORD *)&v3 = -1;
  *((_QWORD *)&v3 + 1) = -1;
  *(_OWORD *)task_info_out = v3;
  v12 = v3;
  if (a1 - 1 > 0xFFFFFFFD)
  {
    v5 = 0;
  }
  else
  {
    task_info_outCnt = 8;
    v4 = task_info(a1, 0xFu, task_info_out, &task_info_outCnt);
    v5 = v4 == 0;
    if (v4)
    {
      BSLogCommon();
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      {
        v9 = mach_error_string(v4);
        *(_DWORD *)buf = 136315650;
        v14 = "BSAuditTokenForTask";
        v15 = 2082;
        v16 = v9;
        v17 = 1024;
        v18 = v4;
        _os_log_error_impl(&dword_18A184000, v6, OS_LOG_TYPE_ERROR, "%s failed: %{public}s (0x%x)", buf, 0x1Cu);
      }

    }
  }
  if (a2)
  {
    v7 = v12;
    *a2 = *(_OWORD *)task_info_out;
    a2[1] = v7;
  }
  return v5;
}

void sub_18A1B5784(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_18A1B59F8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, _Unwind_Exception *exception_object)
{
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  _Unwind_Resume(a1);
}

void sub_18A1B5B00(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_18A1B5BD8(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_18A1B5D6C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  if (!v2)

  _Unwind_Resume(a1);
}

uint64_t BSPIDForXPCConnection(void *a1)
{
  _xpc_connection_s *v1;
  _xpc_connection_s *v2;
  uint64_t pid;

  v1 = a1;
  v2 = v1;
  if (v1)
    pid = xpc_connection_get_pid(v1);
  else
    pid = 0xFFFFFFFFLL;

  return pid;
}

void sub_18A1B5DE8(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_18A1B5EB4(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_18A1B6098(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

id _BSMachPortRightDescription(unsigned int a1, int a2, uint64_t a3, uint64_t a4, void *a5)
{
  void *v10;
  uint64_t v11;
  __CFString *v12;
  const __CFString *v13;
  uint64_t v14;
  __CFString *v15;
  void *v16;

  v10 = (void *)MEMORY[0x1E0CB3940];
  v11 = getpid();
  if (a1 >= 4)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(%i)"), (int)a1);
    v12 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v12 = off_1E1EBF418[a1];
  }
  if (a2 == 1)
    v13 = CFSTR(":ext");
  else
    v13 = &stru_1E1EC08D0;
  v14 = objc_msgSend(a5, "length");
  if (v14)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR(" from %@"), a5);
    v15 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v15 = &stru_1E1EC08D0;
  }
  objc_msgSend(v10, "stringWithFormat:", CFSTR("(%i:%x:%@%@ %@)%@"), v11, a4, v12, v13, a3, v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if (v14)

  return v16;
}

void sub_18A1B620C(_Unwind_Exception *a1)
{
  void *v1;
  uint64_t v2;
  void *v3;

  if (v2)

  _Unwind_Resume(a1);
}

BOOL BSSandboxCanGetMachTaskName(int a1)
{
  if (getpid() == a1)
    return 1;
  if (qword_1ECD398E8 != -1)
    dispatch_once(&qword_1ECD398E8, &__block_literal_global_3_1);
  return byte_1ECD398D2 != 0;
}

id _BSBundleIDForXPCConnectionAndIKnowWhatImDoingISwear(void *a1)
{
  id v1;
  void *v2;
  void *v3;

  v1 = a1;
  if (v1 && (v2 = (void *)xpc_connection_copy_bundle_id()) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v2);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    free(v2);
  }
  else
  {
    v3 = 0;
  }

  return v3;
}

void sub_18A1B6354(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

uint64_t _BSMachPortTypeDecode(int a1, id a2)
{
  Class Class;
  uint64_t v4;
  objc_class *v5;

  if (!a2)
    return 0;
  Class = object_getClass(a2);
  v4 = a1 - 1;
  v5 = (objc_class *)(v4 > 2 ? MEMORY[0x1E0C81350] : qword_1E1EBF438[v4]);
  if (Class != v5)
    return 0;
  if (a1 == 3)
    return xpc_mach_send_copy_right();
  if (a1 == 2)
    return xpc_mach_send_once_extract_right();
  if (a1 != 1)
    return 0;
  return xpc_mach_recv_extract_right();
}

__CFString *NSStringFromBSVersionedPID(unint64_t a1)
{
  uint64_t v1;
  uint64_t v2;

  if (a1 == -1)
    return CFSTR("<invalid>");
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%d(v%X)"), a1, HIDWORD(a1), v1, v2);
  return (__CFString *)(id)objc_claimAutoreleasedReturnValue();
}

void sub_18A1B6540(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_18A1B6928(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;
  void *v11;
  void *v12;

  _Unwind_Resume(a1);
}

void sub_18A1B6D0C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_18A1B6E40(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_18A1B6FB0(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_18A1B70F8(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

id BSStringFromCGRect(double a1, double a2, double a3, double a4)
{
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v6 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("{%.*g, %.*g}"), 17, *(_QWORD *)&a1, 17, *(_QWORD *)&a2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("{%.*g, %.*g}"), 17, *(_QWORD *)&a3, 17, *(_QWORD *)&a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "stringWithFormat:", CFSTR("{%@, %@}"), v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

void sub_18A1B71CC(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void BSClearTokenVar(void **a1)
{
  void *v2;
  int v3;
  uint64_t v4;
  __int16 v5;
  const __CFString *v6;
  __int16 v7;
  int v8;
  __int16 v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  if (!a1)
  {
    v2 = (void *)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("var must not be nil"));
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      v3 = 138544130;
      v4 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "void BSClearTokenVar(BSAuditToken ** _Nonnull)");
      v5 = 2114;
      v6 = CFSTR("BSAuditTokenCaching.m");
      v7 = 1024;
      v8 = 179;
      v9 = 2114;
      v10 = v2;
      _os_log_error_impl(&dword_18A184000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ (%{public}@:%i) : %{public}@", (uint8_t *)&v3, 0x26u);
    }
    qword_1EDF5BAE8 = objc_msgSend(v2, "UTF8String");
    __break(0);
    JUMPOUT(0x18A1B7334);
  }
  if (*a1)
  {
    if (qword_1ECD39958 != -1)
      dispatch_once_f(&qword_1ECD39958, 0, (dispatch_function_t)_bsxpc_auditToken_init);
    _BSStoreNewRetainedTokenToVar(0, a1);
  }
}

void sub_18A1B7470(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_18A1B7584(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

uint64_t _BSCreateDataFromObject(void *a1)
{
  id v1;
  void *v2;
  uint64_t v3;
  __CFString *v4;
  NSObject *v5;
  void *v6;
  void *v8;
  id v9;
  void *v10;
  objc_class *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  id v21;
  uint8_t buf[4];
  uint64_t v23;
  __int16 v24;
  const __CFString *v25;
  __int16 v26;
  int v27;
  __int16 v28;
  void *v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v1 = a1;
  if (v1)
  {
    if ((objc_msgSend((id)objc_opt_class(), "supportsSecureCoding") & 1) == 0)
    {
      v10 = (void *)MEMORY[0x1E0CB3940];
      v11 = (objc_class *)objc_opt_class();
      NSStringFromClass(v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "stringWithFormat:", CFSTR("Object of type %@ does not support secure coding"), v12);
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "NSData *_BSCreateDataFromObject(__strong id)");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138544130;
        v23 = (uint64_t)v14;
        v24 = 2114;
        v25 = CFSTR("NSObject+BSCoding.m");
        v26 = 1024;
        v27 = 21;
        v28 = 2114;
        v29 = v13;
        _os_log_error_impl(&dword_18A184000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ (%{public}@:%i) : %{public}@", buf, 0x26u);

      }
      qword_1EDF5BAE8 = objc_msgSend(objc_retainAutorelease(v13), "UTF8String");
      __break(0);
      JUMPOUT(0x18A1B781CLL);
    }
    v2 = (void *)MEMORY[0x18D769AE0]();
    v21 = 0;
    objc_msgSend(MEMORY[0x1E0CB36F8], "archivedDataWithRootObject:requiringSecureCoding:error:", v1, 1, &v21);
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = (__CFString *)v21;
    if (v4)
    {
      BSLogCommon();
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      {
        v8 = (void *)objc_opt_class();
        *(_DWORD *)buf = 138543618;
        v23 = (uint64_t)v8;
        v24 = 2114;
        v25 = v4;
        v9 = v8;
        _os_log_error_impl(&dword_18A184000, v5, OS_LOG_TYPE_ERROR, "Error during encoding of %{public}@: %{public}@", buf, 0x16u);

      }
      v6 = &unk_1EDF5E3C8;
      if ((objc_msgSend(v1, "conformsToProtocol:", v6) & 1) == 0)
      {
        v15 = (void *)MEMORY[0x1E0CB3940];
        v16 = objc_opt_class();
        NSStringFromProtocol((Protocol *)v6);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "stringWithFormat:", CFSTR("%@ does not conform to %@"), v16, v17);
        v18 = (void *)objc_claimAutoreleasedReturnValue();

        if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
        {
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "NSData *_BSCreateDataFromObject(__strong id)");
          v19 = objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138544130;
          v23 = v19;
          v24 = 2114;
          v25 = CFSTR("NSObject+BSCoding.m");
          v26 = 1024;
          v27 = 31;
          v28 = 2114;
          v29 = v18;
          v20 = (void *)v19;
          _os_log_error_impl(&dword_18A184000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ (%{public}@:%i) : %{public}@", buf, 0x26u);

        }
        qword_1EDF5BAE8 = objc_msgSend(objc_retainAutorelease(v18), "UTF8String");
        __break(0);
        JUMPOUT(0x18A1B7914);
      }

    }
    objc_autoreleasePoolPop(v2);
  }
  else
  {
    v3 = 0;
  }

  return v3;
}

void sub_18A1B791C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, _Unwind_Exception *exception_object)
{
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;

  _Unwind_Resume(a1);
}

void sub_18A1B7A30(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

id BSLogAddStateCaptureBlockForUserRequestsOnlyWithTitle(void *a1, void *a2, void *a3)
{
  _BSLogAddStateCaptureBlockWithTitle(a1, a2, a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

id BSLogAddStateCaptureBlockWithTitle(void *a1, void *a2, void *a3)
{
  _BSLogAddStateCaptureBlockWithTitle(a1, a2, a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

id _BSLogAddStateCaptureBlockWithTitle(void *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  void *v8;
  id v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  id v13;
  void *v14;
  BSLogStateCaptureEntry *v15;
  id v16;
  void *v17;
  uint64_t v18;
  id captureBlock;
  id v20;
  id v21;
  void *v22;
  void *v23;
  BSStateCaptureInvalidator *v24;
  id v25;
  void *v26;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  id v32;
  objc_super v33;

  v5 = a1;
  v6 = a2;
  v7 = a3;
  v8 = v7;
  if (v6)
  {
    if (v7)
      goto LABEL_3;
LABEL_19:
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "id<BSInvalidatable> _BSLogAddStateCaptureBlockWithTitle(__strong dispatch_queue_t, NSString *__strong, __strong BSLogStateCaptureBlock, BOOL)");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "handleFailureInFunction:file:lineNumber:description:", v31, CFSTR("BSSharedStateCapturing.m"), 82, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("stateCaptureBlock"));

    if (v5)
      goto LABEL_7;
    goto LABEL_4;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "id<BSInvalidatable> _BSLogAddStateCaptureBlockWithTitle(__strong dispatch_queue_t, NSString *__strong, __strong BSLogStateCaptureBlock, BOOL)");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "handleFailureInFunction:file:lineNumber:description:", v29, CFSTR("BSSharedStateCapturing.m"), 81, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("stateCaptureTitle"));

  if (!v8)
    goto LABEL_19;
LABEL_3:
  if (v5)
    goto LABEL_7;
LABEL_4:
  if (qword_1ECD39AD8 != -1)
    dispatch_once(&qword_1ECD39AD8, &__block_literal_global_28);
  v5 = (id)qword_1ECD39AE0;
LABEL_7:
  v9 = v8;
  v10 = v6;
  v11 = os_state_add_handler();
  if (v11)
  {
    v12 = v11;
    os_unfair_lock_lock((os_unfair_lock_t)&_MergedGlobals_32);
    if (!qword_1ECD39AD0)
    {
      v13 = objc_alloc_init(MEMORY[0x1E0C99E08]);
      v14 = (void *)qword_1ECD39AD0;
      qword_1ECD39AD0 = (uint64_t)v13;

    }
    v15 = objc_alloc_init(BSLogStateCaptureEntry);
    v16 = v9;
    v17 = v16;
    if (v15)
    {
      v18 = objc_msgSend(v16, "copy");
      captureBlock = v15->_captureBlock;
      v15->_captureBlock = (id)v18;

      v20 = v10;
      objc_storeStrong((id *)&v15->_title, a2);

      v21 = v5;
      objc_storeStrong((id *)&v15->_queue, v5);
    }
    else
    {

      v32 = v5;
    }

    v22 = (void *)qword_1ECD39AD0;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", v12);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "setObject:forKey:", v15, v23);

    os_unfair_lock_unlock((os_unfair_lock_t)&_MergedGlobals_32);
    v24 = [BSStateCaptureInvalidator alloc];
    if (v24)
    {
      v33.receiver = v24;
      v33.super_class = (Class)BSStateCaptureInvalidator;
      v25 = objc_msgSendSuper2(&v33, sel_init);
      v26 = v25;
      if (v25)
        *((_QWORD *)v25 + 1) = v12;
    }
    else
    {
      v26 = 0;
    }

  }
  else
  {
    v26 = 0;
  }

  return v26;
}

void sub_18A1B7DA0(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  _Unwind_Resume(a1);
}

void sub_18A1B7FCC(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_18A1B805C(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void BSSerializeCGRectToXPCDictionaryWithKey(void *a1, const char *a2, double a3, double a4, double a5, double a6)
{
  xpc_object_t v11;
  xpc_object_t xdict;

  xdict = a1;
  if (xdict && a2)
  {
    v11 = BSCreateSerializedXPCObjectFromCGRect(a3, a4, a5, a6);
    xpc_dictionary_set_value(xdict, a2, v11);

  }
}

void sub_18A1B80F0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

xpc_object_t BSCreateSerializedXPCObjectFromCGRect(double a1, double a2, double a3, double a4)
{
  xpc_object_t v7;
  uint64_t i;
  xpc_object_t objects[5];

  objects[4] = *(xpc_object_t *)MEMORY[0x1E0C80C00];
  objects[0] = xpc_double_create(a1);
  objects[1] = xpc_double_create(a2);
  objects[2] = xpc_double_create(a3);
  objects[3] = xpc_double_create(a4);
  v7 = xpc_array_create(objects, 4uLL);
  for (i = 3; i != -1; --i)

  return v7;
}

void sub_18A1B81F0(_Unwind_Exception *a1)
{
  uint64_t v1;
  uint64_t i;

  for (i = 24; i != -8; i -= 8)

  _Unwind_Resume(a1);
}

void sub_18A1B843C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_18A1B87A4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, _Unwind_Exception *exception_object)
{
  void *v10;
  void *v11;
  void *v12;

  _Unwind_Resume(a1);
}

void sub_18A1B8858(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, objc_super a9)
{
  void *v9;
  void *v10;

  v10 = v9;
  a9.receiver = v10;
  a9.super_class = (Class)BSProcessDeathWatcher;
  -[_Unwind_Exception dealloc](&a9, sel_dealloc);
  _Unwind_Resume(a1);
}

void sub_18A1B8960(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_18A1B8ED8(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_18A1B9048(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;
  void *v11;

  _Unwind_Resume(a1);
}

void sub_18A1B9100(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void sub_18A1B9210(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, objc_super a9)
{
  void *v9;
  void *v10;

  v10 = v9;
  a9.receiver = v10;
  a9.super_class = (Class)BSActionResponse;
  -[_Unwind_Exception dealloc](&a9, sel_dealloc);
  _Unwind_Resume(a1);
}

void sub_18A1B9318(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void sub_18A1B9458(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_18A1B957C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_18A1B9E10(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_18A1BA0D0(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_18A1BA2AC(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_18A1BA3C4(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

__CFString *NSStringFromBSActionErrorCode(unint64_t a1)
{
  if (a1 < 8)
    return off_1E1EBFFA8[a1];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown - %ld)"), a1);
  return (__CFString *)(id)objc_claimAutoreleasedReturnValue();
}

void sub_18A1BA488(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_18A1BA54C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_18A1BA7D4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, _Unwind_Exception *exception_object, objc_super a11)
{
  void *v11;

  a11.super_class = (Class)_BSActionResponder;
  -[_Unwind_Exception dealloc](&a11, sel_dealloc);
  _Unwind_Resume(a1);
}

void sub_18A1BA830(_Unwind_Exception *a1, int a2)
{
  if (a2)
    objc_terminate();
  _Unwind_Resume(a1);
}

void sub_18A1BAF30(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

uint64_t BSMachCreateSendOnceRight(uint64_t a1)
{
  uint64_t result;
  mach_error_t v3;
  int v4;
  unsigned int v5;

  result = 0;
  v5 = 0;
  if ((a1 - 1) <= 0xFFFFFFFD)
  {
    v4 = 0;
    v3 = MEMORY[0x18D769960](*MEMORY[0x1E0C83DA0], a1, 21, &v5, &v4);
    if (v3)
    {
      _BSMachError(a1, v3, CFSTR("Unable to create send-once right"));
      if (v5)
        _os_assumes_log();
    }
    return v5;
  }
  return result;
}

void sub_18A1BB1A8(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_18A1BB38C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, objc_super a9)
{
  void *v9;
  void *v10;

  v10 = v9;
  a9.receiver = v10;
  a9.super_class = (Class)BSProcessHandle;
  -[_Unwind_Exception dealloc](&a9, sel_dealloc);
  _Unwind_Resume(a1);
}

void sub_18A1BB400(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, objc_super a9)
{
  void *v9;
  void *v10;

  v10 = v9;
  a9.receiver = v10;
  a9.super_class = (Class)BSMachPortRight;
  -[_Unwind_Exception dealloc](&a9, sel_dealloc);
  _Unwind_Resume(a1);
}

void sub_18A1BBA88(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_18A1BBCF8(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_18A1BBEE4(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

id BSLogMachPort()
{
  if (BSLogMachPort_onceToken != -1)
    dispatch_once(&BSLogMachPort_onceToken, &__block_literal_global_8);
  return (id)BSLogMachPort___logObj;
}

void sub_18A1BC024(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

BOOL BSMachSendRightRelease(mach_port_name_t name)
{
  int v1;
  mach_error_t v2;

  v1 = name;
  if (name - 1 <= 0xFFFFFFFD)
  {
    v2 = mach_port_deallocate(*MEMORY[0x1E0C83DA0], name);
    if (v2)
    {
      _BSMachError(v1, v2, CFSTR("Unable to deallocate send right"));
      v1 = 0;
    }
  }
  return (v1 - 1) < 0xFFFFFFFE;
}

void sub_18A1BC7CC(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_18A1BC88C(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_18A1BC924(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, objc_super a9)
{
  a9.super_class = (Class)BSAction;
  -[_Unwind_Exception dealloc](&a9, sel_dealloc);
  _Unwind_Resume(a1);
}

void sub_18A1BCA90(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_18A1BCC88(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  void *v14;

  _Unwind_Resume(a1);
}

void sub_18A1BD270(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;
  void *v11;

  _Unwind_Resume(a1);
}

void sub_18A1BD8DC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;
  void *v11;

  _Unwind_Resume(a1);
}

void sub_18A1BDF98(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{
  void *v10;
  void *v11;
  void *v12;

  _Unwind_Resume(a1);
}

void sub_18A1BE0D8(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_18A1BE174(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_18A1BE378(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, _Unwind_Exception *exception_object)
{
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  _Unwind_Resume(a1);
}

void sub_18A1BE478(_Unwind_Exception *exception_object)
{
  _Unwind_Resume(exception_object);
}

void sub_18A1BE548(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_18A1BE754(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, id a12)
{
  void *v12;

  _Unwind_Resume(a1);
}

void sub_18A1BEC8C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, id a12)
{
  void *v12;

  _Unwind_Resume(a1);
}

void sub_18A1BEDB8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, objc_super a9)
{
  void *v9;

  a9.super_class = (Class)BSActionResponder;
  -[_Unwind_Exception dealloc](&a9, sel_dealloc);
  _Unwind_Resume(a1);
}

void sub_18A1BEFAC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, _Unwind_Exception *exception_object, objc_super a13)
{
  void *v13;

  a13.super_class = (Class)_BSCompoundAssertionAcquisitionReference;
  -[_Unwind_Exception dealloc](&a13, sel_dealloc);
  _Unwind_Resume(a1);
}

void sub_18A1BEFFC(_Unwind_Exception *a1, int a2)
{
  if (a2)
    objc_terminate();
  _Unwind_Resume(a1);
}

void sub_18A1BF154(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_18A1BF234(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_18A1BF2F4(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void BSDispatchQueueAssertNotMain()
{
  void *v0;
  void *v1;
  int v2;
  void *v3;
  __int16 v4;
  const __CFString *v5;
  __int16 v6;
  int v7;
  __int16 v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  if (objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread"))
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Did not expect the main thread"));
    v0 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "void BSDispatchQueueAssertNotMain(void)");
      v1 = (void *)objc_claimAutoreleasedReturnValue();
      v2 = 138544130;
      v3 = v1;
      v4 = 2114;
      v5 = CFSTR("BSDispatchUtilities.m");
      v6 = 1024;
      v7 = 122;
      v8 = 2114;
      v9 = v0;
      _os_log_error_impl(&dword_18A184000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ (%{public}@:%i) : %{public}@", (uint8_t *)&v2, 0x26u);

    }
    qword_1EDF5BAE8 = objc_msgSend(objc_retainAutorelease(v0), "UTF8String");
    __break(0);
    JUMPOUT(0x18A1BF42CLL);
  }
  dispatch_assert_queue_not_V2(MEMORY[0x1E0C80D38]);
}

void sub_18A1BF434(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void BSSetMainThreadPriorityFixedForUI(int a1)
{
  int v2;
  NSObject *v3;
  const char *v4;
  uint32_t v5;
  int v6;
  const char *v7;
  __int16 v8;
  int v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  if (!pthread_main_np())
  {
    if (!os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      return;
    v6 = 136315138;
    v7 = "void BSSetMainThreadPriorityFixedForUI(BOOL)";
    v3 = MEMORY[0x1E0C81028];
    v4 = "%s: BUG: Non-main thread asking to set priority";
    goto LABEL_15;
  }
  if (!a1)
  {
    if (!pthread_set_timeshare_self() || !os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      return;
    v6 = 136315138;
    v7 = "void BSSetMainThreadPriorityFixedForUI(BOOL)";
    v3 = MEMORY[0x1E0C81028];
    v4 = "%s: pthread_set_timeshare_self: failed to set thread scheduling to timeshare";
LABEL_15:
    v5 = 12;
    goto LABEL_16;
  }
  if (pthread_set_fixedpriority_self() && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v6 = 136315138;
    v7 = "void BSSetMainThreadPriorityFixedForUI(BOOL)";
    _os_log_error_impl(&dword_18A184000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "%s: pthread_set_fixedpriority_self: failed to set thread priority to fixed", (uint8_t *)&v6, 0xCu);
  }
  if (proc_setthread_cpupercent() && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v2 = *__error();
    v6 = 136315394;
    v7 = "void BSSetMainThreadPriorityFixedForUI(BOOL)";
    v8 = 1024;
    v9 = v2;
    v3 = MEMORY[0x1E0C81028];
    v4 = "%s: proc_setthread_cpupercent: errno %{darwin.errno}d";
    v5 = 18;
LABEL_16:
    _os_log_error_impl(&dword_18A184000, v3, OS_LOG_TYPE_ERROR, v4, (uint8_t *)&v6, v5);
  }
}

void sub_18A1BF69C(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_18A1BF6FC(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_18A1BFA84(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_18A1BFCCC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, _Unwind_Exception *exception_object)
{
  void *v10;
  void *v11;

  _Unwind_Resume(a1);
}

void sub_18A1BFED8(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_18A1BFFA0(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

uint64_t BSPathExistsOnSystemPartition(void *a1)
{
  id v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;

  v1 = a1;
  v2 = v1;
  if (qword_1ECD399B0 == -1)
  {
    if (v1)
      goto LABEL_3;
LABEL_8:
    v5 = 0;
    goto LABEL_9;
  }
  dispatch_once(&qword_1ECD399B0, &__block_literal_global_10);
  if (!v2)
    goto LABEL_8;
LABEL_3:
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "attributesOfFileSystemForPath:error:", v2, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", *MEMORY[0x1E0CB2B08]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
  {
LABEL_9:
    v6 = 0;
    goto LABEL_10;
  }
  if ((objc_msgSend((id)qword_1ECD399A0, "isEqualToNumber:", v5) & 1) != 0)
    v6 = 1;
  else
    v6 = objc_msgSend((id)qword_1ECD399A8, "isEqualToNumber:", v5);
LABEL_10:

  return v6;
}

void sub_18A1C00DC(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  v4 = v3;

  _Unwind_Resume(a1);
}

id BSDeserializeNSSecureEncodableObjectOfClassFromXPCDictionaryWithKey(void *a1, void *a2, const char *a3)
{
  return (id)BSCreateDeserializedNSSecureEncodableObjectOfClassFromXPCDictionaryWithKey(a1, a2, a3);
}

uint64_t BSCreateDeserializedNSSecureEncodableObjectOfClassFromXPCDictionaryWithKey(void *a1, void *a2, const char *a3)
{
  id v5;
  uint64_t v6;
  void *v7;
  id v8;
  Class Class;
  objc_class *v10;
  void *v11;
  void *v12;
  id v13;
  Class v14;
  id v15;
  id v16;
  void *v18;
  void *v19;
  void *v20;
  void *v21;

  v5 = a2;
  if (!a1)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "NSObject<NSSecureCoding> *BSCreateDeserializedNSSecureEncodableObjectOfClassFromXPCDictionaryWithKey(__unsafe_unretained Class, __strong xpc_object_t, const char *)");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "handleFailureInFunction:file:lineNumber:description:", v19, CFSTR("BSXPCSerialization.m"), 136, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("class != nil"));

  }
  if ((objc_msgSend(a1, "supportsSecureCoding") & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "NSObject<NSSecureCoding> *BSCreateDeserializedNSSecureEncodableObjectOfClassFromXPCDictionaryWithKey(__unsafe_unretained Class, __strong xpc_object_t, const char *)");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "handleFailureInFunction:file:lineNumber:description:", v21, CFSTR("BSXPCSerialization.m"), 137, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("[class supportsSecureCoding]"));

  }
  v6 = 0;
  if (v5 && a3)
  {
    v7 = (void *)MEMORY[0x18D769AE0]();
    v8 = v5;
    Class = object_getClass(v8);
    v10 = (objc_class *)MEMORY[0x1E0C812F8];
    if (Class == (Class)MEMORY[0x1E0C812F8])
    {
      xpc_dictionary_get_value(v8, a3);
      v13 = (id)objc_claimAutoreleasedReturnValue();
      v11 = v13;
      if (v13)
      {
        v14 = object_getClass(v13);

        if (v14 == v10)
          v12 = v11;
        else
          v12 = 0;
LABEL_14:
        v15 = v12;

        if (v15)
        {
          v16 = objc_alloc_init(MEMORY[0x1E0CB3B40]);
          objc_msgSend(v16, "beginReadingFromXPCObject:", v15);
          objc_msgSend(v16, "decodeObjectOfClass:forKey:", a1, &stru_1E1EC08D0);
          v6 = objc_claimAutoreleasedReturnValue();

        }
        else
        {
          v6 = 0;
        }

        objc_autoreleasePoolPop(v7);
        goto LABEL_18;
      }
    }
    else
    {
      v11 = 0;
    }
    v12 = 0;
    goto LABEL_14;
  }
LABEL_18:

  return v6;
}

void sub_18A1C0328(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_18A1C04F4(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_18A1C07F8(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_18A1C0A4C(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

double BSFloatFloorForScale(double a1, double a2)
{
  double v4;
  void *v7;
  void *v8;

  v4 = fabs(a2);
  if (a2 <= 0.0 || v4 < 2.22044605e-16)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler", v4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "CGFloat BSFloatFloorForScale(CGFloat, CGFloat)");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "handleFailureInFunction:file:lineNumber:description:", v8, CFSTR("BSMath.m"), 60, CFSTR("Scale must be specified and cannot be less than or equal to 0."));

  }
  return floor(a1 * a2) / a2;
}

void sub_18A1C0B0C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_18A1C0BA4(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_18A1C0DA4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, _Unwind_Exception *exception_object)
{
  void *v10;
  void *v11;
  void *v12;

  _Unwind_Resume(a1);
}

void sub_18A1C0E98(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_18A1C0F00(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

BOOL BSInterfaceOrientationIsPortrait(uint64_t a1)
{
  return (unint64_t)(a1 - 1) < 2;
}

uint64_t BSPthreadCurrentEffectiveQualityOfService()
{
  _opaque_pthread_t *v0;
  int v1;
  int v2;
  int v3;
  unsigned int v4;
  uint64_t result;
  int v6;
  sched_param v7;

  v0 = pthread_self();
  v7 = 0;
  v6 = 0;
  pthread_getschedparam(v0, &v6, &v7);
  if (v7.sched_priority <= 4)
    v1 = 9;
  else
    v1 = 17;
  if (v7.sched_priority <= 20)
    v2 = v1;
  else
    v2 = 21;
  if (v7.sched_priority <= 31)
    v3 = v2;
  else
    v3 = 25;
  if (v7.sched_priority <= 37)
    v4 = v3;
  else
    v4 = 33;
  LODWORD(result) = qos_class_self();
  if (v4 <= result)
    return result;
  else
    return v4;
}

void sub_18A1C105C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_18A1C173C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void sub_18A1C1AE8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{

  _Unwind_Resume(a1);
}

void sub_18A1C1C18(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  _Unwind_Resume(a1);
}

void sub_18A1C1D30(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  _Unwind_Resume(a1);
}

void sub_18A1C1E48(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_18A1C1F64(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_18A1C214C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void BSStoreTokenFromXPCConnectionToVar(uint64_t a1, void **a2)
{
  __int128 v3;
  void *v4;
  void *v5;
  _BYTE v6[38];
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  if (!a1)
  {
    v4 = (void *)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("connection must not be nil"));
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)v6 = 138544130;
      *(_QWORD *)&v6[4] = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "void BSStoreTokenFromXPCConnectionToVar(xpc_connection_t _Nonnull, BSAuditToken * _Nullable * _Nonnull)");
      *(_WORD *)&v6[12] = 2114;
      *(_QWORD *)&v6[14] = CFSTR("BSAuditTokenCaching.m");
      *(_WORD *)&v6[22] = 1024;
      *(_DWORD *)&v6[24] = 161;
      *(_WORD *)&v6[28] = 2114;
      *(_QWORD *)&v6[30] = v4;
      _os_log_error_impl(&dword_18A184000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ (%{public}@:%i) : %{public}@", v6, 0x26u);
    }
    qword_1EDF5BAE8 = objc_msgSend(v4, "UTF8String");
    __break(0);
    JUMPOUT(0x18A1C228CLL);
  }
  if (!a2)
  {
    v5 = (void *)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("var must not be nil"));
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)v6 = 138544130;
      *(_QWORD *)&v6[4] = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "void BSStoreTokenFromXPCConnectionToVar(xpc_connection_t _Nonnull, BSAuditToken * _Nullable * _Nonnull)");
      *(_WORD *)&v6[12] = 2114;
      *(_QWORD *)&v6[14] = CFSTR("BSAuditTokenCaching.m");
      *(_WORD *)&v6[22] = 1024;
      *(_DWORD *)&v6[24] = 162;
      *(_WORD *)&v6[28] = 2114;
      *(_QWORD *)&v6[30] = v5;
      _os_log_error_impl(&dword_18A184000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ (%{public}@:%i) : %{public}@", v6, 0x26u);
    }
    qword_1EDF5BAE8 = objc_msgSend(v5, "UTF8String");
    __break(0);
    JUMPOUT(0x18A1C2344);
  }
  *(_QWORD *)&v3 = -1;
  *((_QWORD *)&v3 + 1) = -1;
  *(_OWORD *)v6 = v3;
  *(_OWORD *)&v6[16] = v3;
  xpc_connection_get_audit_token();
  BSStoreRealTokenToVar((uint64_t)v6, a2);
}

void sub_18A1C2958(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_18A1C2BA8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, id a12)
{
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;

  _Unwind_Resume(a1);
}

void sub_18A1C2F38(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_18A1C3100(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, _Unwind_Exception *exception_object, objc_super a11)
{
  void *v11;

  a11.super_class = (Class)BSCompoundAssertion;
  -[_Unwind_Exception dealloc](&a11, sel_dealloc);
  _Unwind_Resume(a1);
}

void sub_18A1C3148(_Unwind_Exception *a1, int a2)
{
  if (a2)
    objc_terminate();
  _Unwind_Resume(a1);
}

void sub_18A1C36D4(_Unwind_Exception *exception_object)
{
  _Unwind_Resume(exception_object);
}

void sub_18A1C3808(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_18A1C3964(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  void *v14;
  void *v15;
  void *v16;
  id *v17;

  objc_destroyWeak(v17);
  objc_destroyWeak(&location);

  _Unwind_Resume(a1);
}

void sub_18A1C3B40(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_18A1C3C74(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  _Unwind_Resume(a1);
}

void sub_18A1C3F6C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, void *a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, void *a16)
{
  void *v16;
  void *v17;
  void *v18;
  void *v19;

  _Unwind_Resume(a1);
}

void sub_18A1C4064(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_18A1C4590(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_18A1C46D4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, objc_super a11)
{
  void *v11;

  a11.super_class = (Class)BSWatchdog;
  -[_Unwind_Exception dealloc](&a11, sel_dealloc);
  _Unwind_Resume(a1);
}

void sub_18A1C47B0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_18A1C49D4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_18A1C4A6C(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_18A1C4AD0(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_18A1C4B64(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_18A1C4C18(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_18A1C4DB8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13, void *a14)
{
  void *v14;
  void *v15;

  _Unwind_Resume(a1);
}

void sub_18A1C4E48(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

id BSLogStateCaptureEncodePlist(void *a1, int a2, _QWORD *a3)
{
  id v5;
  void *v6;
  id v7;
  unint64_t v8;
  void *v9;
  unint64_t v10;
  unint64_t v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  id v21;
  uint64_t v22;
  _QWORD v23[2];

  v23[1] = *MEMORY[0x1E0C80C00];
  v5 = a1;
  v6 = v5;
  if (qword_1ECD39AF0 == -1)
  {
    if (!v5)
      goto LABEL_13;
  }
  else
  {
    dispatch_once(&qword_1ECD39AF0, &__block_literal_global_87);
    if (!v6)
      goto LABEL_13;
  }
  if (a2 && objc_msgSend(v6, "isNSString"))
  {
    v7 = v6;
    v8 = objc_msgSend(v7, "lengthOfBytesUsingEncoding:", 1);
    if (v8)
    {
      v9 = v7;
      if (v8 > qword_1ECD39AE8)
      {
        objc_msgSend(v7, "substringToIndex:");
        v9 = (void *)objc_claimAutoreleasedReturnValue();

      }
    }
    else
    {
      v10 = objc_msgSend(v7, "maximumLengthOfBytesUsingEncoding:", 10);
      v9 = v7;
      if (v10 > qword_1ECD39AE8)
      {
        v11 = objc_msgSend(v7, "lengthOfBytesUsingEncoding:", 10);
        v9 = v7;
        while (v11 > qword_1ECD39AE8)
        {
          objc_msgSend(v9, "substringToIndex:", objc_msgSend(v7, "length") - ((v11 - qword_1ECD39AE8 + 1) >> 1));
          v12 = (void *)objc_claimAutoreleasedReturnValue();

          v9 = v12;
          v11 = objc_msgSend(v12, "lengthOfBytesUsingEncoding:", 10);
        }
      }
    }

    v6 = v9;
  }
LABEL_13:
  v21 = 0;
  objc_msgSend(MEMORY[0x1E0CB38B0], "dataWithPropertyList:format:options:error:", v6, 200, 0, &v21);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v21;
  if (!v13)
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithObject:forKey:", CFSTR("Input generated no data"), *MEMORY[0x1E0CB2D68]);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = v19;
    if (v14)
      objc_msgSend(v19, "setObject:forKey:", v14, *MEMORY[0x1E0CB3388]);
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("BSSharedStateCapturing"), 1, v18);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_19:

    v13 = 0;
    if (!a3)
      goto LABEL_23;
    goto LABEL_22;
  }
  if ((unint64_t)objc_msgSend(v13, "length") >= 0x7F39)
  {
    v15 = (void *)MEMORY[0x1E0CB35C8];
    v22 = *MEMORY[0x1E0CB2D68];
    v23[0] = CFSTR("Encoded state data is larger than 32KB");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v23, &v22, 1);
    v16 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "errorWithDomain:code:userInfo:", CFSTR("BSSharedStateCapturing"), 2, v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    v14 = (id)v16;
    v18 = v13;
    goto LABEL_19;
  }
  v17 = v14;
  if (a3)
LABEL_22:
    *a3 = objc_retainAutorelease(v17);
LABEL_23:

  return v13;
}

void sub_18A1C5140(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

__CFString *BSOrientationRotationDirectionDescription(unint64_t a1)
{
  if (a1 < 3)
    return off_1E1EBF7B8[a1];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(%li)"), a1);
  return (__CFString *)(id)objc_claimAutoreleasedReturnValue();
}

void sub_18A1C5598(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

long double BSTimeUntilNextClockMinute()
{
  id v0;
  uint64_t v1;
  long double v2;
  long double v3;

  v0 = objc_alloc_init(MEMORY[0x1E0CB34F8]);
  v1 = objc_msgSend(v0, "secondOfMinute");
  objc_msgSend(MEMORY[0x1E0C99D68], "timeIntervalSinceReferenceDate");
  v3 = 60.0 - (double)v1 - fmod(v2, 1.0);

  return v3;
}

void sub_18A1C56B0(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_18A1C5718(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_18A1C59C4(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

uint64_t BSAuditTokenTaskHasEntitlement(_OWORD *a1, void *a2)
{
  id v3;
  __int128 v4;
  void *v5;
  uint64_t v6;
  _OWORD v8[2];

  v3 = a2;
  v4 = a1[1];
  v8[0] = *a1;
  v8[1] = v4;
  +[BSSecTask secTaskForAuditToken:]((uint64_t)BSSecTask, v8);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[BSSecTask BOOLForEntitlement:]((uint64_t)v5, v3);

  return v6;
}

void sub_18A1C5A94(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

id BSCollectionReduce(void *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void (**v7)(id, void *, _QWORD);
  id v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v5 = a1;
  v6 = a2;
  v7 = a3;
  v8 = v6;
  v9 = v8;
  if (v7)
  {
    v18 = 0u;
    v19 = 0u;
    v16 = 0u;
    v17 = 0u;
    v10 = v5;
    v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    v9 = v8;
    if (v11)
    {
      v12 = *(_QWORD *)v17;
      v9 = v8;
      do
      {
        v13 = 0;
        v14 = v9;
        do
        {
          if (*(_QWORD *)v17 != v12)
            objc_enumerationMutation(v10);
          v7[2](v7, v14, *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * v13));
          v9 = (void *)objc_claimAutoreleasedReturnValue();

          ++v13;
          v14 = v9;
        }
        while (v11 != v13);
        v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
      }
      while (v11);
    }

  }
  return v9;
}

void sub_18A1C5C2C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_18A1C5D18(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id BSEarlierDate(void *a1, void *a2)
{
  id v3;
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;

  v3 = a1;
  v4 = a2;
  v5 = v4;
  v6 = v4;
  if (v3 && (v6 = v3, v4))
  {
    objc_msgSend(v3, "earlierDate:", v4);
    v7 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = v6;
  }
  v8 = v7;

  return v8;
}

void sub_18A1C5DB8(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_18A1C5FD8(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

double BSContinuousMachTimeNow()
{
  uint64_t v0;

  v0 = mach_continuous_time();
  if (_MergedGlobals_9 != -1)
    dispatch_once_f(&_MergedGlobals_9, 0, (dispatch_function_t)__machTimeScaleInit);
  return *(double *)&qword_1ECD39840 * (double)v0;
}

void sub_18A1C62D4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, ...)
{
  va_list va;

  va_start(va, a14);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_18A1C636C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  v4 = v3;

  _Unwind_Resume(a1);
}

uint64_t BSSelfTaskHasEntitlement(void *a1)
{
  id v1;
  void *v2;
  uint64_t v3;

  v1 = a1;
  +[BSSecTask secTaskForCurrentProcess]();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = -[BSSecTask BOOLForEntitlement:]((uint64_t)v2, v1);

  return v3;
}

void sub_18A1C657C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_18A1C6690(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, objc_super a11)
{
  void *v11;

  a11.super_class = (Class)BSDispatchSource;
  -[_Unwind_Exception dealloc](&a11, sel_dealloc);
  _Unwind_Resume(a1);
}

void sub_18A1C796C(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_18A1C7AE8(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_18A1C7C0C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  _Unwind_Resume(a1);
}

void sub_18A1C7EF4(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  _Unwind_Resume(a1);
}

void sub_18A1C7FDC(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_18A1C810C(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_18A1C82AC(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_18A1C84F4(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_18A1C870C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void sub_18A1C8928(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void sub_18A1C89EC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

id BSCurrentUserDirectory()
{
  if (qword_1ECD39998 != -1)
    dispatch_once(&qword_1ECD39998, &__block_literal_global_6_1);
  return (id)qword_1ECD39990;
}

void sbDefaults_setObject(void *a1, const char *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  uint64_t v13;
  id v14;
  int v15;
  void *v16;
  id v17;
  void *v18;
  id v19;

  v5 = a1;
  v6 = a3;
  v19 = v5;
  -[BSAbstractDefaultDomain _propertyFromSelector:]((uint64_t)v19, a2);
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (!v6)
  {
    objc_msgSend(v19, "_store");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
      v11 = *(void **)(v8 + 56);
    else
      v11 = 0;
    v12 = v11;
    objc_msgSend(v10, "removeObjectForKey:", v12);
LABEL_19:

    if (!v8)
      goto LABEL_22;
    goto LABEL_20;
  }
  if (!v7)
  {
LABEL_16:
    objc_msgSend(v19, "_store");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
      v18 = *(void **)(v8 + 56);
    else
      v18 = 0;
    v12 = v18;
    objc_msgSend(v10, "setObject:forKey:", v6, v12);
    goto LABEL_19;
  }
  if ((*(_BYTE *)(v7 + 72) & 8) == 0)
    goto LABEL_13;
  v9 = v6;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {

      goto LABEL_13;
    }
  }
  v13 = objc_msgSend(v9, "count");

  if (v13)
  {
LABEL_13:
    if ((*(_BYTE *)(v8 + 72) & 4) != 0)
    {
      v14 = *(id *)(v8 + 64);
      v15 = objc_msgSend(v6, "isEqual:", v14);

      if (v15)
        goto LABEL_15;
    }
    goto LABEL_16;
  }
LABEL_15:
  objc_msgSend(v19, "_store");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = *(id *)(v8 + 56);
  objc_msgSend(v16, "removeObjectForKey:", v17);

LABEL_20:
  if ((*(_BYTE *)(v8 + 72) & 2) != 0)
    objc_msgSend(v19, "synchronizeDefaults");
LABEL_22:

}

void sub_18A1C8C84(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;

  v14 = v13;

  _Unwind_Resume(a1);
}

void __Block_byref_object_dispose_(uint64_t a1)
{

}

void __Block_byref_object_dispose__0(uint64_t a1)
{
  _Block_object_dispose(*(const void **)(a1 + 40), 131);
}

void __Block_byref_object_dispose__1(uint64_t a1)
{

}

void __Block_byref_object_dispose__2(uint64_t a1)
{

}

void __Block_byref_object_dispose__3(uint64_t a1)
{

}

void __Block_byref_object_dispose__4(uint64_t a1)
{
  _Block_object_dispose(*(const void **)(a1 + 40), 131);
}

void __Block_byref_object_dispose__5(uint64_t a1)
{

}

void __Block_byref_object_dispose__6(uint64_t a1)
{
  objc_destroyWeak((id *)(a1 + 40));
}

void __Block_byref_object_dispose__7(uint64_t a1)
{

}

void __Block_byref_object_dispose__8(uint64_t a1)
{

}

void __Block_byref_object_dispose__9(uint64_t a1)
{

}

void __Block_byref_object_dispose__10(uint64_t a1)
{

}

uint64_t __Block_byref_object_copy_(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_copy__0(uint64_t a1, uint64_t a2)
{
  _Block_object_assign((void *)(a1 + 40), *(const void **)(a2 + 40), 131);
}

uint64_t __Block_byref_object_copy__1(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__2(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__3(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_copy__4(uint64_t a1, uint64_t a2)
{
  _Block_object_assign((void *)(a1 + 40), *(const void **)(a2 + 40), 131);
}

uint64_t __Block_byref_object_copy__5(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  result = MEMORY[0x18D769CFC](*(_QWORD *)(a2 + 40));
  *(_QWORD *)(a1 + 40) = result;
  return result;
}

void __Block_byref_object_copy__6(uint64_t a1, uint64_t a2)
{
  objc_moveWeak((id *)(a1 + 40), (id *)(a2 + 40));
}

uint64_t __Block_byref_object_copy__7(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__8(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__9(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__10(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

id BSDeviceOrientationDescription(unint64_t a1)
{
  const __CFString *v1;

  if (a1 > 6)
    v1 = CFSTR("INVALID");
  else
    v1 = off_1E1EBF758[a1];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@ (%li)"), v1, a1);
  return (id)objc_claimAutoreleasedReturnValue();
}

uint64_t BSCompareFloats(double a1, double a2)
{
  double v2;
  BOOL v3;
  uint64_t v4;

  v2 = vabdd_f64(a1, a2);
  v3 = v2 < 2.22044605e-16 || a1 <= a2;
  v4 = 1;
  if (v3)
    v4 = -1;
  if (v2 >= 2.22044605e-16)
    return v4;
  else
    return 0;
}

void sub_18A1C8FC8(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_18A1C9024(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, objc_super a9)
{
  void *v9;
  void *v10;

  v10 = v9;
  a9.receiver = v10;
  a9.super_class = (Class)BSBasicServerClient;
  -[_Unwind_Exception dealloc](&a9, sel_dealloc);
  _Unwind_Resume(a1);
}

void sub_18A1C93D4(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_18A1C9474(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13)
{
  void *v13;

  _Unwind_Resume(a1);
}

void sub_18A1C9530(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_18A1C95BC(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_18A1C9674(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

id BSXPCBundleForPID(uint64_t a1)
{
  void *v1;
  void *v2;

  BSExecutablePathForPID(a1);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  BSXPCBundleForExecutablePath(v1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

void sub_18A1C96D4(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

id BSXPCBundleForExecutablePath(void *a1)
{
  id v1;
  void *v2;
  void *v3;

  v1 = a1;
  v2 = v1;
  if (v1)
  {
    objc_msgSend(objc_retainAutorelease(v1), "UTF8String");
    v3 = (void *)xpc_bundle_create();
  }
  else
  {
    v3 = 0;
  }

  return v3;
}

void sub_18A1C973C(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

id BSXPCBundleForBundlePath(void *a1)
{
  id v1;
  void *v2;
  void *v3;

  v1 = a1;
  v2 = v1;
  if (v1)
  {
    objc_msgSend(objc_retainAutorelease(v1), "UTF8String");
    v3 = (void *)xpc_bundle_create();
  }
  else
  {
    v3 = 0;
  }

  return v3;
}

void sub_18A1C97A4(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

char *BSXPCBundleGetIdentifier(void *a1)
{
  id v1;
  void *v2;
  char *string;

  v1 = a1;
  if (v1)
  {
    xpc_bundle_get_info_dictionary();
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    if (v2)
    {
      string = (char *)xpc_dictionary_get_string(v2, (const char *)objc_msgSend(objc_retainAutorelease((id)*MEMORY[0x1E0C9AE78]), "UTF8String"));
      if (string)
        string = (char *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithUTF8String:", string);
    }
    else
    {
      string = 0;
    }

  }
  else
  {
    string = 0;
  }

  return string;
}

void sub_18A1C9850(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

id BSXPCBundleGetBundlePath(void *a1)
{
  id v1;
  void *property;

  v1 = a1;
  if (v1)
  {
    property = (void *)xpc_bundle_get_property();
    if (property)
      property = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithUTF8String:", property);
  }
  else
  {
    property = 0;
  }

  return property;
}

void sub_18A1C98CC(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

id BSXPCBundleGetExecutablePath(void *a1)
{
  id v1;
  void *executable_path;

  v1 = a1;
  if (v1)
  {
    executable_path = (void *)xpc_bundle_get_executable_path();
    if (executable_path)
      executable_path = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithUTF8String:", executable_path);
  }
  else
  {
    executable_path = 0;
  }

  return executable_path;
}

void sub_18A1C9938(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

id BSXPCBundleGetInfoDictionary(void *a1)
{
  id v1;
  void *v2;
  void *v3;

  v1 = a1;
  if (v1)
  {
    xpc_bundle_get_info_dictionary();
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    if (v2)
      v3 = (void *)_CFXPCCreateCFObjectFromXPCObject();
    else
      v3 = 0;

  }
  else
  {
    v3 = 0;
  }

  return v3;
}

void sub_18A1C99B0(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_18A1C9A64(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_18A1C9AEC(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_18A1C9B48(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_18A1C9BA4(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_18A1C9C00(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_18A1C9C50(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_18A1C9CAC(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_18A1C9D08(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_18A1C9D64(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_18A1C9DC0(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_18A1C9E10(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_18A1C9EC0(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_18A1C9F18(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_18A1CA900(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_18A1CAAE4(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_18A1CAB44(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, objc_super a9)
{
  a9.super_class = (Class)BSCGImageFromIOSurfaceBuilder;
  -[_Unwind_Exception dealloc](&a9, sel_dealloc);
  _Unwind_Resume(a1);
}

void sub_18A1CAF4C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, ...)
{
  void *v5;
  void *v6;
  va_list va;

  va_start(va, a5);
  _Block_object_dispose(va, 8);

  _Unwind_Resume(a1);
}

void unlockIOSurface(void *a1)
{
  id cf;

  cf = a1;
  if (cf)
  {
    objc_msgSend(cf, "unlockWithOptions:seed:", 1, 0);
    objc_msgSend(cf, "decrementUseCount");
    CFRelease(cf);
  }

}

void sub_18A1CB020(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void *__getCVCreateColorSpaceFromIOSurfaceBulkAttachmentsSymbolLoc_block_invoke(_QWORD *a1)
{
  void *v2;
  void *result;
  void *v4;

  if (!qword_1ECD39710)
    qword_1ECD39710 = _sl_dlopen();
  v2 = (void *)qword_1ECD39710;
  if (!qword_1ECD39710)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    a1 = (_QWORD *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "void *CoreVideoLibrary(void)");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "handleFailureInFunction:file:lineNumber:description:", v2, CFSTR("IOSurface+BaseBoard.m"), 25, CFSTR("%s"), 0);

    __break(1u);
    free(v4);
  }
  result = dlsym(v2, "CVCreateColorSpaceFromIOSurfaceBulkAttachments");
  *(_QWORD *)(*(_QWORD *)(a1[4] + 8) + 24) = result;
  _MergedGlobals_4 = *(_UNKNOWN **)(*(_QWORD *)(a1[4] + 8) + 24);
  return result;
}

void sub_18A1CB180(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, _Unwind_Exception *exception_object)
{
  void *v11;
  void *v12;

  _Unwind_Resume(a1);
}

id BSLogBSAction()
{
  if (BSLogBSAction_onceToken != -1)
    dispatch_once(&BSLogBSAction_onceToken, &__block_literal_global_0);
  return (id)BSLogBSAction___logObj;
}

void sub_18A1CB2AC(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_18A1CB364(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_18A1CB414(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_18A1CB470(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_18A1CB558(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_18A1CB5D0(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_18A1CB630(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_18A1CB6F0(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_18A1CB74C(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_18A1CB834(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_18A1CB890(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_18A1CBC20(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_18A1CBD38(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_18A1CBD90(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

uint64_t BSStringFromCGPoint(double a1, double a2)
{
  return objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("{%.*g, %.*g}"), 17, *(_QWORD *)&a1, 17, *(_QWORD *)&a2);
}

uint64_t BSStringFromCGSize(double a1, double a2)
{
  return objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("{%.*g, %.*g}"), 17, *(_QWORD *)&a1, 17, *(_QWORD *)&a2);
}

void sub_18A1CBF64(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_18A1CC050(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_18A1CC0FC(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_18A1CC2C0(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_18A1CC570(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_18A1CC674(_Unwind_Exception *a1, int a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, __int128 buf)
{
  void *v17;
  id v20;
  NSObject *v21;

  if (a2 == 1)
  {
    v20 = objc_begin_catch(a1);
    BSLogCommon();
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      LODWORD(buf) = 138543362;
      *(_QWORD *)((char *)&buf + 4) = v20;
      _os_log_error_impl(&dword_18A184000, v21, OS_LOG_TYPE_ERROR, "Exception: %{public}@", (uint8_t *)&buf, 0xCu);
    }

    objc_end_catch();
    JUMPOUT(0x18A1CC63CLL);
  }
  _Unwind_Resume(a1);
}

void sub_18A1CC778(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_18A1CC7FC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_18A1CC9BC(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_18A1CCBB4(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_18A1CCC30(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_18A1CCCAC(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_18A1CCDA0(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_18A1CCE30(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_18A1CD044(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_18A1CD318(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  _Unwind_Resume(a1);
}

void sub_18A1CD400(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_18A1CD474(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_18A1CD538(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, objc_super a10)
{
  a10.super_class = (Class)_BSSqlitePreparedSimpleStatement;
  -[_Unwind_Exception dealloc](&a10, sel_dealloc);
  _Unwind_Resume(a1);
}

void sub_18A1CD65C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_18A1CD83C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_18A1CD988(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_18A1CDAE8(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_18A1CDB5C(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

objc_class *BSDeserializeBSXPCEncodableObjectFromXPCDictionary(void *a1)
{
  return BSCreateDeserializedBSXPCEncodableObjectFromXPCDictionary(a1);
}

void BSSerializeNSSecureEncodableObjectToXPCDictionaryWithKey(void *a1, void *a2, const char *a3)
{
  id v5;
  id v6;
  void *v7;
  Class Class;
  objc_class *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;

  v17 = a1;
  v5 = a2;
  if (v17 && (objc_msgSend((id)objc_opt_class(), "supportsSecureCoding") & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "void BSSerializeNSSecureEncodableObjectToXPCDictionaryWithKey(NSObject<NSSecureCoding> *__strong, __strong xpc_object_t, const char *)");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "handleFailureInFunction:file:lineNumber:description:", v16, CFSTR("BSXPCSerialization.m"), 124, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("!object || [[object class] supportsSecureCoding]"));

  }
  v6 = v5;
  v7 = v6;
  if (!v6
    || (Class = object_getClass(v6),
        v9 = (objc_class *)MEMORY[0x1E0C812F8],
        v7,
        v7,
        Class != v9))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "void BSSerializeNSSecureEncodableObjectToXPCDictionaryWithKey(NSObject<NSSecureCoding> *__strong, __strong xpc_object_t, const char *)");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "handleFailureInFunction:file:lineNumber:description:", v14, CFSTR("BSXPCSerialization.m"), 125, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("BSXPCObjectIsDictionary(dictionary)"));

  }
  if (v17 && a3)
  {
    v10 = (void *)MEMORY[0x18D769AE0]();
    v11 = objc_alloc_init(MEMORY[0x1E0CB3B48]);
    objc_msgSend(v11, "beginEncoding");
    objc_msgSend(v11, "encodeObject:forKey:", v17, &stru_1E1EC08D0);
    objc_msgSend(v11, "finishEncoding");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    xpc_dictionary_set_value(v7, a3, v12);

    objc_autoreleasePoolPop(v10);
  }

}

void sub_18A1CDD60(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;
  void *v11;
  void *v12;

  _Unwind_Resume(a1);
}

void *BSCreateDeserializedArrayOfBSXPCEncodableObjectsFromXPCDictionaryWithKey(void *a1, const char *a2)
{
  return BSCreateDeserializedArrayFromXPCDictionaryWithKey(a1, a2, &__block_literal_global_20);
}

void BSSerializeSetOfBSXPCEncodableObjectsToXPCDictionaryWithKey(void *a1, void *a2, const char *a3)
{
  BSSerializeSetToXPCDictionaryWithKey(a1, a2, a3, &__block_literal_global_22);
}

uint64_t BSCreateDeserializedSetOfBSXPCEncodableObjectsFromXPCDictionaryWithKey(void *a1, const char *a2)
{
  return BSCreateDeserializedSetFromXPCDictionaryWithKey(a1, a2, &__block_literal_global_23);
}

void BSSerializeDataToXPCDictionaryWithKey(void *a1, void *a2, const char *a3)
{
  id v5;
  id v6;
  id v7;

  v7 = a1;
  v5 = a2;
  if (v7 && v5 && a3)
  {
    v6 = objc_retainAutorelease(v7);
    xpc_dictionary_set_data(v5, a3, (const void *)objc_msgSend(v6, "bytes"), objc_msgSend(v6, "length"));
  }

}

void sub_18A1CDE8C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

const void *BSDeserializeDataFromXPCDictionaryWithKey(void *a1, const char *a2)
{
  return (id)BSCreateDeserializedDataFromXPCDictionaryWithKey(a1, a2);
}

xpc_object_t BSCreateSerializedXPCObjectFromCGPoint(double a1, double a2)
{
  xpc_object_t v3;
  uint64_t i;
  xpc_object_t objects[3];

  objects[2] = *(xpc_object_t *)MEMORY[0x1E0C80C00];
  objects[0] = xpc_double_create(a1);
  objects[1] = xpc_double_create(a2);
  v3 = xpc_array_create(objects, 2uLL);
  for (i = 1; i != -1; --i)

  return v3;
}

void sub_18A1CDF5C(_Unwind_Exception *a1)
{
  uint64_t v1;
  uint64_t i;

  for (i = 8; i != -8; i -= 8)

  _Unwind_Resume(a1);
}

void BSSerializeCGPointToXPCDictionaryWithKey(void *a1, const char *a2, double a3, double a4)
{
  xpc_object_t v7;
  xpc_object_t xdict;

  xdict = a1;
  if (xdict && a2)
  {
    v7 = BSCreateSerializedXPCObjectFromCGPoint(a3, a4);
    xpc_dictionary_set_value(xdict, a2, v7);

  }
}

void sub_18A1CE004(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

double BSDeserializeCGPointFromXPCObject(void *a1)
{
  id v1;
  void *v2;
  double v3;

  v1 = a1;
  v2 = v1;
  v3 = *MEMORY[0x1E0C9D538];
  if (v1 && object_getClass(v1) == (Class)MEMORY[0x1E0C812C8] && xpc_array_get_count(v2) == 2)
  {
    v3 = xpc_array_get_double(v2, 0);
    xpc_array_get_double(v2, 1uLL);
  }

  return v3;
}

void sub_18A1CE0B0(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

double BSDeserializeCGPointFromXPCDictionaryWithKey(void *a1, const char *a2)
{
  id v3;
  void *v4;
  double v5;
  void *v6;

  v3 = a1;
  v4 = v3;
  if (v3 && object_getClass(v3) == (Class)MEMORY[0x1E0C812F8])
  {
    xpc_dictionary_get_value(v4, a2);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = BSDeserializeCGPointFromXPCObject(v6);

  }
  else
  {
    v5 = *MEMORY[0x1E0C9D538];
  }

  return v5;
}

void sub_18A1CE150(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void BSSerializeIOSurfaceToXPCDictionaryWithKey(__IOSurface *a1, void *a2, const char *a3)
{
  xpc_object_t XPCObject;
  xpc_object_t xdict;

  xdict = a2;
  if (a1 && xdict && a3)
  {
    XPCObject = IOSurfaceCreateXPCObject(a1);
    if (XPCObject)
      xpc_dictionary_set_value(xdict, a3, XPCObject);

  }
}

void sub_18A1CE1D4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

IOSurfaceRef BSCreateDeserializedIOSurfaceFromXPCDictionaryWithKey(void *a1, const char *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  IOSurfaceRef v7;

  v3 = a1;
  v4 = v3;
  if (v3)
  {
    xpc_dictionary_get_value(v3, a2);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v5;
    if (v5)
      v7 = IOSurfaceLookupFromXPCObject(v5);
    else
      v7 = 0;

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

void sub_18A1CE264(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

BOOL BSSystemHasCapability()
{
  const __CFBoolean *v0;
  const __CFBoolean *v1;
  CFTypeID v2;
  _BOOL8 v3;

  v0 = (const __CFBoolean *)MGCopyAnswer();
  if (!v0)
    return 0;
  v1 = v0;
  v2 = CFGetTypeID(v0);
  v3 = v2 == CFBooleanGetTypeID() && CFBooleanGetValue(v1) != 0;
  CFRelease(v1);
  return v3;
}

void sub_18A1CE884(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_18A1CEA78(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_18A1CEB20(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void sub_18A1CEBB4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void sub_18A1CEC48(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void sub_18A1CECDC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void sub_18A1CEDFC(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_18A1CEF24(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_18A1CF04C(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_18A1CF174(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_18A1CF254(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_18A1CF324(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_18A1CF444(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_18A1CF4B4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_18A1CF5A4(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_18A1CF60C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_18A1CF71C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_18A1CFC18(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void BSAppendVersionedPIDToStringAppendTarget(unint64_t a1, void *a2)
{
  id v3;
  id v4;

  v3 = a2;
  v4 = v3;
  if (a1 == -1)
    objc_msgSend(v3, "appendString:", CFSTR("<invalid>"));
  else
    objc_msgSend(v3, "appendFormat:", CFSTR("%d(v%X)"), a1, HIDWORD(a1));

}

void sub_18A1CFFA4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, void *a12)
{

  _Unwind_Resume(a1);
}

void sub_18A1D0024(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_18A1D0560(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void _initializePath(uint64_t a1, void *a2)
{
  id v3;
  char v4;
  uint64_t v5;

  v3 = a2;
  *(_OWORD *)a1 = 0u;
  *(_OWORD *)(a1 + 16) = 0u;
  *(_BYTE *)a1 = 47;
  v5 = 0;
  if (objc_msgSend(v3, "getBytes:maxLength:usedLength:encoding:options:range:remainingRange:", a1 + 1, 29, &v5, 4, 1, 0, objc_msgSend(v3, "length"), 0))v4 = v5 + 1;
  else
    v4 = 1;
  *(_BYTE *)(a1 + 32) = v4;

}

void sub_18A1D06A4(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_18A1D0A94(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

id BSShmLoad(char *__s, void *a2, BOOL *a3, _BYTE *a4)
{
  int v8;
  int v9;
  uint64_t *v10;
  uint64_t *v11;
  char v12;
  NSObject *v13;
  void *v14;
  NSObject *v15;
  int *v16;
  NSObject *v17;
  int *v19;
  NSObject *v20;
  int *v21;
  NSObject *v22;
  uint64_t v23;
  NSObject *v24;
  int v25;
  void *v26;
  NSObject *v27;
  int v28;
  NSObject *v29;
  const char *v30;
  int v31;
  uint64_t v32;
  _BOOL4 v33;
  int *v34;
  NSObject *v35;
  int v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  id v47;
  _QWORD v48[4];
  id v49;
  _BYTE *v50;
  _BYTE *v51;
  uint64_t *v52;
  uint64_t v53;
  uint64_t *v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t *v57;
  uint64_t v58;
  char v59;
  _BYTE __strerrbuf[24];
  char v61;
  uint8_t v62[4];
  char *v63;
  _BYTE buf[32];
  stat v65;
  uint64_t v66;

  v66 = *MEMORY[0x1E0C80C00];
  if (!__s)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "id<BSSharedMemoryStoreData>  _Nullable BSShmLoad(const char *const _Nonnull, __unsafe_unretained Class, BOOL * _Nonnull, BOOL * _Nonnull)");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "handleFailureInFunction:file:lineNumber:description:", v38, CFSTR("BSSharedMemoryStore.m"), 419, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("path"));

  }
  if (strlen(__s) <= 2)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "id<BSSharedMemoryStoreData>  _Nullable BSShmLoad(const char *const _Nonnull, __unsafe_unretained Class, BOOL * _Nonnull, BOOL * _Nonnull)");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "handleFailureInFunction:file:lineNumber:description:", v40, CFSTR("BSSharedMemoryStore.m"), 420, CFSTR("path '%s' is too short"), __s);

  }
  if (strlen(__s) < 0x20)
  {
    if (a3)
      goto LABEL_7;
LABEL_61:
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "id<BSSharedMemoryStoreData>  _Nullable BSShmLoad(const char *const _Nonnull, __unsafe_unretained Class, BOOL * _Nonnull, BOOL * _Nonnull)");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v43, "handleFailureInFunction:file:lineNumber:description:", v44, CFSTR("BSSharedMemoryStore.m"), 422, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("outGenerationTwiddle"));

    if (a4)
      goto LABEL_8;
    goto LABEL_62;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "id<BSSharedMemoryStoreData>  _Nullable BSShmLoad(const char *const _Nonnull, __unsafe_unretained Class, BOOL * _Nonnull, BOOL * _Nonnull)");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v41, "handleFailureInFunction:file:lineNumber:description:", v42, CFSTR("BSSharedMemoryStore.m"), 421, CFSTR("path '%s' is too long"), __s);

  if (!a3)
    goto LABEL_61;
LABEL_7:
  if (a4)
    goto LABEL_8;
LABEL_62:
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "id<BSSharedMemoryStoreData>  _Nullable BSShmLoad(const char *const _Nonnull, __unsafe_unretained Class, BOOL * _Nonnull, BOOL * _Nonnull)");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v45, "handleFailureInFunction:file:lineNumber:description:", v46, CFSTR("BSSharedMemoryStore.m"), 423, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("outExisted"));

LABEL_8:
  *__error() = 0;
  v8 = shm_open(__s, 0);
  if ((v8 & 0x80000000) == 0)
  {
    v9 = v8;
    *a4 = 1;
    memset(&v65, 0, sizeof(v65));
    if (fstat(v8, &v65) || v65.st_size < 0x10uLL)
    {
      BSLogSharedMemory();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)__strerrbuf = 136315394;
        *(_QWORD *)&__strerrbuf[4] = __s;
        *(_WORD *)&__strerrbuf[12] = 2048;
        *(_QWORD *)&__strerrbuf[14] = v65.st_size;
        _os_log_error_impl(&dword_18A184000, v15, OS_LOG_TYPE_ERROR, "%s: invalid size - unlinking : size=%lli", __strerrbuf, 0x16u);
      }

      v14 = 0;
      BSShmDelete(__s, 0);
      goto LABEL_19;
    }
    *__error() = 0;
    v10 = (uint64_t *)mmap(0, v65.st_size, 1, 1, v9, 0);
    v11 = v10;
    if (v10 == (uint64_t *)-1)
    {
      v21 = __error();
      strerror_r(*v21, __strerrbuf, 0x100uLL);
      BSLogSharedMemory();
      v22 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      {
        v31 = *__error();
        *(_DWORD *)buf = 136315650;
        *(_QWORD *)&buf[4] = __s;
        *(_WORD *)&buf[12] = 1024;
        *(_DWORD *)&buf[14] = v31;
        *(_WORD *)&buf[18] = 2080;
        *(_QWORD *)&buf[20] = __strerrbuf;
        _os_log_error_impl(&dword_18A184000, v22, OS_LOG_TYPE_ERROR, "%s: failed to mmap - unlinking : errno=%i (%s)", buf, 0x1Cu);
      }

      BSShmDelete(__s, 0);
      v14 = 0;
      goto LABEL_19;
    }
    v12 = *((_BYTE *)v10 + 8);
    if ((v12 & 1) == 0)
    {
      BSLogSharedMemory();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)__strerrbuf = 136315138;
        *(_QWORD *)&__strerrbuf[4] = __s;
        _os_log_error_impl(&dword_18A184000, v13, OS_LOG_TYPE_ERROR, "%s: validity check failed - unlinking", __strerrbuf, 0xCu);
      }

      v14 = 0;
      BSShmDelete(__s, 0);
      goto LABEL_56;
    }
    v23 = *v10;
    if (*v10 > (unint64_t)(v65.st_size - 16))
    {
      BSLogSharedMemory();
      v24 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)__strerrbuf = 136315138;
        *(_QWORD *)&__strerrbuf[4] = __s;
        _os_log_error_impl(&dword_18A184000, v24, OS_LOG_TYPE_ERROR, "%s: size check failed - unlinking", __strerrbuf, 0xCu);
      }

      BSShmDelete(__s, 0);
      v14 = 0;
      goto LABEL_56;
    }
    *(_QWORD *)__strerrbuf = 0;
    *(_QWORD *)&__strerrbuf[8] = __strerrbuf;
    *(_QWORD *)&__strerrbuf[16] = 0x2020000000;
    v61 = 1;
    *(_QWORD *)buf = 0;
    *(_QWORD *)&buf[8] = buf;
    *(_QWORD *)&buf[16] = 0x2020000000;
    *(_QWORD *)&buf[24] = 0;
    v56 = 0;
    v57 = &v56;
    v58 = 0x2020000000;
    v59 = 0;
    objc_msgSend(MEMORY[0x1E0CB3978], "currentThread");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v48[0] = MEMORY[0x1E0C809B0];
    v48[1] = 3221225472;
    v48[2] = __BSShmLoad_block_invoke;
    v48[3] = &unk_1E1EBEAF0;
    v47 = v26;
    v49 = v47;
    v50 = __strerrbuf;
    v53 = v23;
    v54 = v11;
    v55 = 16;
    v51 = buf;
    v52 = &v56;
    objc_msgSend(a2, "deserializeFromReader:", v48);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    *(_BYTE *)(*(_QWORD *)&__strerrbuf[8] + 24) = 0;
    if (v14)
    {
      if (*((_BYTE *)v57 + 24))
      {
        BSLogSharedMemory();
        v27 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)v62 = 136315138;
          v63 = __s;
          _os_log_debug_impl(&dword_18A184000, v27, OS_LOG_TYPE_DEBUG, "%s: data deserialized but it tried to over read the shm", v62, 0xCu);
        }
      }
      else
      {
        if (*(_QWORD *)(*(_QWORD *)&buf[8] + 24) == v23)
          goto LABEL_41;
        BSLogSharedMemory();
        v27 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)v62 = 136315138;
          v63 = __s;
          _os_log_impl(&dword_18A184000, v27, OS_LOG_TYPE_INFO, "%s: data deserialized but it didn't read all of the shm", v62, 0xCu);
        }
      }

LABEL_41:
      *a3 = (v12 & 2) != 0;
LABEL_55:

      _Block_object_dispose(&v56, 8);
      _Block_object_dispose(buf, 8);
      _Block_object_dispose(__strerrbuf, 8);
LABEL_56:
      *__error() = 0;
      if (munmap(v11, v65.st_size) == -1)
      {
        v34 = __error();
        strerror_r(*v34, __strerrbuf, 0x100uLL);
        BSLogSharedMemory();
        v35 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
        {
          v36 = *__error();
          *(_DWORD *)buf = 136315650;
          *(_QWORD *)&buf[4] = __s;
          *(_WORD *)&buf[12] = 1024;
          *(_DWORD *)&buf[14] = v36;
          *(_WORD *)&buf[18] = 2080;
          *(_QWORD *)&buf[20] = __strerrbuf;
          _os_log_error_impl(&dword_18A184000, v35, OS_LOG_TYPE_ERROR, "%s: failed to munmap - unlinking : errno=%i (%s)", buf, 0x1Cu);
        }

        BSShmDelete(__s, 0);
      }
LABEL_19:
      *__error() = 0;
      if (close(v9))
      {
        v16 = __error();
        strerror_r(*v16, __strerrbuf, 0x100uLL);
        BSLogSharedMemory();
        v17 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
        {
          v25 = *__error();
          *(_DWORD *)buf = 136315650;
          *(_QWORD *)&buf[4] = __s;
          *(_WORD *)&buf[12] = 1024;
          *(_DWORD *)&buf[14] = v25;
          *(_WORD *)&buf[18] = 2080;
          *(_QWORD *)&buf[20] = __strerrbuf;
          _os_log_error_impl(&dword_18A184000, v17, OS_LOG_TYPE_ERROR, "%s: failed to close read : errno=%i (%s)", buf, 0x1Cu);
        }

      }
      return v14;
    }
    if (*((_BYTE *)v57 + 24))
    {
      BSLogSharedMemory();
      v29 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)v62 = 136315138;
        v63 = __s;
        v30 = "%s: data failed to deserialize (maybe because it tried to over read the shm) - unlinking";
LABEL_53:
        _os_log_error_impl(&dword_18A184000, v29, OS_LOG_TYPE_ERROR, v30, v62, 0xCu);
      }
    }
    else
    {
      v32 = *(_QWORD *)(*(_QWORD *)&buf[8] + 24);
      BSLogSharedMemory();
      v29 = objc_claimAutoreleasedReturnValue();
      v33 = os_log_type_enabled(v29, OS_LOG_TYPE_ERROR);
      if (v32 == v23)
      {
        if (v33)
        {
          *(_DWORD *)v62 = 136315138;
          v63 = __s;
          v30 = "%s: data failed to deserialize (external reason) - unlinking";
          goto LABEL_53;
        }
      }
      else if (v33)
      {
        *(_DWORD *)v62 = 136315138;
        v63 = __s;
        v30 = "%s: data failed to deserialize (maybe because it didn't read all of the shm) - unlinking";
        goto LABEL_53;
      }
    }

    BSShmDelete(__s, 0);
    goto LABEL_55;
  }
  if (*__error() == 2)
    return 0;
  v19 = __error();
  strerror_r(*v19, __strerrbuf, 0x100uLL);
  BSLogSharedMemory();
  v20 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
  {
    v28 = *__error();
    v65.st_dev = 136315650;
    *(_QWORD *)&v65.st_mode = __s;
    WORD2(v65.st_ino) = 1024;
    *(_DWORD *)((char *)&v65.st_ino + 6) = v28;
    HIWORD(v65.st_uid) = 2080;
    *(_QWORD *)&v65.st_gid = __strerrbuf;
    _os_log_error_impl(&dword_18A184000, v20, OS_LOG_TYPE_ERROR, "%s: failed to read : errno=%i (%s)", (uint8_t *)&v65, 0x1Cu);
  }

  v14 = 0;
  *a4 = 0;
  return v14;
}

void sub_18A1D1480(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void BSShmDelete(char *__s, char a2)
{
  int *v4;
  NSObject *v5;
  int v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint8_t buf[4];
  char *v14;
  __int16 v15;
  int v16;
  __int16 v17;
  char *v18;
  char __strerrbuf[256];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  if (!__s)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "void BSShmDelete(const char *const _Nonnull, BOOL)");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "handleFailureInFunction:file:lineNumber:description:", v8, CFSTR("BSSharedMemoryStore.m"), 404, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("path"));

  }
  if (strlen(__s) <= 2)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "void BSShmDelete(const char *const _Nonnull, BOOL)");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "handleFailureInFunction:file:lineNumber:description:", v10, CFSTR("BSSharedMemoryStore.m"), 405, CFSTR("path '%s' is too short"), __s);

  }
  if (strlen(__s) >= 0x20)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "void BSShmDelete(const char *const _Nonnull, BOOL)");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "handleFailureInFunction:file:lineNumber:description:", v12, CFSTR("BSSharedMemoryStore.m"), 406, CFSTR("path '%s' is too long"), __s);

  }
  *__error() = 0;
  if (shm_unlink(__s) && (a2 & 1) == 0)
  {
    v4 = __error();
    strerror_r(*v4, __strerrbuf, 0x100uLL);
    BSLogSharedMemory();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      v6 = *__error();
      *(_DWORD *)buf = 136315650;
      v14 = __s;
      v15 = 1024;
      v16 = v6;
      v17 = 2080;
      v18 = __strerrbuf;
      _os_log_error_impl(&dword_18A184000, v5, OS_LOG_TYPE_ERROR, "%s: failed to unlink : errno=%i (%s)", buf, 0x1Cu);
    }

  }
}

void sub_18A1D17E0(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_18A1D18B0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, objc_super a9)
{
  void *v9;
  void *v10;

  v10 = v9;

  a9.super_class = (Class)BSSharedMemoryStore;
  -[_Unwind_Exception dealloc](&a9, sel_dealloc);
  _Unwind_Resume(a1);
}

void sub_18A1D1A34(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_18A1D1B00(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, char a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, id a20)
{
  _Block_object_dispose(&a15, 8);

  _Unwind_Resume(a1);
}

void sub_18A1D1BC8(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

uint64_t BSShmStore(char *a1, void *a2, int a3, _BYTE *a4)
{
  id v7;
  int v8;
  unint64_t v9;
  NSObject *v10;
  int *v11;
  NSObject *v12;
  uint64_t v13;
  int *v14;
  NSObject *v15;
  _BYTE *v16;
  void *v17;
  int v18;
  NSObject *v19;
  const char *v20;
  int v21;
  int *v22;
  int *v23;
  NSObject *v24;
  int v26;
  NSObject *v27;
  const char *v28;
  int v29;
  NSObject *v30;
  char v31;
  int *v32;
  NSObject *v33;
  uint64_t v34;
  _BOOL4 v35;
  int *v36;
  NSObject *v37;
  int v38;
  int v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  int v52;
  id v53;
  _BYTE *v54;
  _QWORD v55[4];
  id v56;
  _BYTE *v57;
  uint64_t *v58;
  uint64_t *v59;
  unint64_t v60;
  _BYTE *v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t *v64;
  uint64_t v65;
  char v66;
  uint64_t v67;
  uint64_t *v68;
  uint64_t v69;
  uint64_t v70;
  uint8_t v71[4];
  char *v72;
  __int16 v73;
  int v74;
  __int16 v75;
  char *v76;
  char __strerrbuf[4];
  char *v78;
  _BYTE buf[28];
  uint64_t v80;

  v80 = *MEMORY[0x1E0C80C00];
  v7 = a2;
  if (!a1)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "BOOL BSShmStore(const char *const _Nonnull, __strong id<BSSharedMemoryStoreData>, BOOL, BSSharedMemoryStoreWriteFailure *)");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "handleFailureInFunction:file:lineNumber:description:", v41, CFSTR("BSSharedMemoryStore.m"), 529, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("path"));

  }
  if (strlen(a1) <= 2)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "BOOL BSShmStore(const char *const _Nonnull, __strong id<BSSharedMemoryStoreData>, BOOL, BSSharedMemoryStoreWriteFailure *)");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "handleFailureInFunction:file:lineNumber:description:", v43, CFSTR("BSSharedMemoryStore.m"), 530, CFSTR("path '%s' is too short"), a1);

  }
  if (strlen(a1) < 0x20)
  {
    if (v7)
      goto LABEL_7;
LABEL_73:
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "BOOL BSShmStore(const char *const _Nonnull, __strong id<BSSharedMemoryStoreData>, BOOL, BSSharedMemoryStoreWriteFailure *)");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v46, "handleFailureInFunction:file:lineNumber:description:", v47, CFSTR("BSSharedMemoryStore.m"), 532, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("data"));

    if (a4)
      goto LABEL_8;
    goto LABEL_74;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "BOOL BSShmStore(const char *const _Nonnull, __strong id<BSSharedMemoryStoreData>, BOOL, BSSharedMemoryStoreWriteFailure *)");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v44, "handleFailureInFunction:file:lineNumber:description:", v45, CFSTR("BSSharedMemoryStore.m"), 531, CFSTR("path '%s' is too long"), a1);

  if (!v7)
    goto LABEL_73;
LABEL_7:
  if (a4)
    goto LABEL_8;
LABEL_74:
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "BOOL BSShmStore(const char *const _Nonnull, __strong id<BSSharedMemoryStoreData>, BOOL, BSSharedMemoryStoreWriteFailure *)");
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v48, "handleFailureInFunction:file:lineNumber:description:", v49, CFSTR("BSSharedMemoryStore.m"), 533, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("failure"));

LABEL_8:
  *__error() = 0;
  v8 = shm_open(a1, 2562, 384);
  if ((v8 & 0x80000000) == 0)
  {
    v9 = objc_msgSend(v7, "serializedDataLength");
    if (v9 >= 0x7FFFFFFFFFFFFFF0)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "BOOL BSShmStore(const char *const _Nonnull, __strong id<BSSharedMemoryStoreData>, BOOL, BSSharedMemoryStoreWriteFailure *)");
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v50, "handleFailureInFunction:file:lineNumber:description:", v51, CFSTR("BSSharedMemoryStore.m"), 545, CFSTR("shmLength out of range"));

    }
    if (*a4 == 2)
    {
      *a4 = 0;
      BSLogSharedMemory();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)__strerrbuf = 136315138;
        v78 = a1;
        _os_log_error_impl(&dword_18A184000, v10, OS_LOG_TYPE_ERROR, "%s: simulating crash after opening new buffer", (uint8_t *)__strerrbuf, 0xCu);
      }
LABEL_14:

LABEL_34:
      v13 = 0;
LABEL_35:
      *__error() = 0;
      if (close(v8))
      {
        v23 = __error();
        strerror_r(*v23, __strerrbuf, 0x100uLL);
        BSLogSharedMemory();
        v24 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
        {
          v26 = *__error();
          *(_DWORD *)buf = 136315650;
          *(_QWORD *)&buf[4] = a1;
          *(_WORD *)&buf[12] = 1024;
          *(_DWORD *)&buf[14] = v26;
          *(_WORD *)&buf[18] = 2080;
          *(_QWORD *)&buf[20] = __strerrbuf;
          _os_log_error_impl(&dword_18A184000, v24, OS_LOG_TYPE_ERROR, "%s: failed to close write : errno=%i (%s)", buf, 0x1Cu);
        }

      }
      goto LABEL_39;
    }
    *__error() = 0;
    if (ftruncate(v8, v9 + 16))
    {
      v14 = __error();
      strerror_r(*v14, __strerrbuf, 0x100uLL);
      BSLogSharedMemory();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        v29 = *__error();
        *(_DWORD *)buf = 136315650;
        *(_QWORD *)&buf[4] = a1;
        *(_WORD *)&buf[12] = 1024;
        *(_DWORD *)&buf[14] = v29;
        *(_WORD *)&buf[18] = 2080;
        *(_QWORD *)&buf[20] = __strerrbuf;
        _os_log_error_impl(&dword_18A184000, v15, OS_LOG_TYPE_ERROR, "%s: failed to set the size - unlinking : errno=%i (%s)", buf, 0x1Cu);
      }
LABEL_33:

      BSShmDelete(a1, 0);
      goto LABEL_34;
    }
    if (*a4 == 3)
    {
      *a4 = 0;
      BSLogSharedMemory();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)__strerrbuf = 136315138;
        v78 = a1;
        _os_log_error_impl(&dword_18A184000, v10, OS_LOG_TYPE_ERROR, "%s: simulating crash after resizing new buffer", (uint8_t *)__strerrbuf, 0xCu);
      }
      goto LABEL_14;
    }
    *__error() = 0;
    v16 = mmap(0, v9 + 16, 2, 1, v8, 0);
    if (v16 == (_BYTE *)-1)
    {
      v22 = __error();
      strerror_r(*v22, __strerrbuf, 0x100uLL);
      BSLogSharedMemory();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        v38 = *__error();
        *(_DWORD *)buf = 136315650;
        *(_QWORD *)&buf[4] = a1;
        *(_WORD *)&buf[12] = 1024;
        *(_DWORD *)&buf[14] = v38;
        *(_WORD *)&buf[18] = 2080;
        *(_QWORD *)&buf[20] = __strerrbuf;
        _os_log_error_impl(&dword_18A184000, v15, OS_LOG_TYPE_ERROR, "%s: failed to mmap - unlinking : errno=%i (%s)", buf, 0x1Cu);
      }
      goto LABEL_33;
    }
    v54 = v16;
    *(_QWORD *)buf = 0;
    *(_QWORD *)&buf[8] = buf;
    *(_QWORD *)&buf[16] = 0x2020000000;
    buf[24] = 1;
    v67 = 0;
    v68 = &v67;
    v69 = 0x2020000000;
    v70 = 0;
    v63 = 0;
    v64 = &v63;
    v65 = 0x2020000000;
    v66 = 0;
    objc_msgSend(MEMORY[0x1E0CB3978], "currentThread");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v55[0] = MEMORY[0x1E0C809B0];
    v55[1] = 3221225472;
    v55[2] = __BSShmStore_block_invoke;
    v55[3] = &unk_1E1EBEB18;
    v53 = v17;
    v56 = v53;
    v57 = buf;
    v60 = v9;
    v61 = v54;
    v62 = 16;
    v58 = &v67;
    v59 = &v63;
    v18 = objc_msgSend(v7, "serializeToWriter:", v55);
    *(_BYTE *)(*(_QWORD *)&buf[8] + 24) = 0;
    if (v18)
    {
      if (*((_BYTE *)v64 + 24))
      {
        BSLogSharedMemory();
        v19 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)__strerrbuf = 136315138;
          v78 = a1;
          v20 = "%s: data serialized but it tried to serialize more than it declared necessary";
LABEL_46:
          _os_log_error_impl(&dword_18A184000, v19, OS_LOG_TYPE_ERROR, v20, (uint8_t *)__strerrbuf, 0xCu);
        }
      }
      else
      {
        if (v68[3] == v9)
          goto LABEL_48;
        BSLogSharedMemory();
        v19 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)__strerrbuf = 136315138;
          v78 = a1;
          v20 = "%s: data serialized but it serialized less than it declared necessary";
          goto LABEL_46;
        }
      }

LABEL_48:
      if (*a4 == 4)
      {
        *a4 = 0;
        BSLogSharedMemory();
        v30 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)__strerrbuf = 136315138;
          v78 = a1;
          _os_log_error_impl(&dword_18A184000, v30, OS_LOG_TYPE_ERROR, "%s: simulating crash after writing data to new buffer", (uint8_t *)__strerrbuf, 0xCu);
        }

        v13 = 0;
      }
      else
      {
        *(_QWORD *)v54 = v9;
        if (a3)
          v31 = 3;
        else
          v31 = 1;
        v54[8] = v31;
        *__error() = 0;
        if (msync(v54, v9 + 16, 16) == -1)
        {
          v32 = __error();
          strerror_r(*v32, __strerrbuf, 0x100uLL);
          BSLogSharedMemory();
          v33 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
          {
            v52 = *__error();
            *(_DWORD *)v71 = 136315650;
            v72 = a1;
            v73 = 1024;
            v74 = v52;
            v75 = 2080;
            v76 = __strerrbuf;
            _os_log_error_impl(&dword_18A184000, v33, OS_LOG_TYPE_ERROR, "%s: failed to msync : errno=%i (%s)", v71, 0x1Cu);
          }

        }
        v13 = 1;
      }
      goto LABEL_67;
    }
    if (*((_BYTE *)v64 + 24))
    {
      BSLogSharedMemory();
      v27 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)__strerrbuf = 136315138;
        v78 = a1;
        v28 = "%s: data failed to serialize (maybe because it tried to write more than it declared up front) - unlinking";
LABEL_65:
        _os_log_error_impl(&dword_18A184000, v27, OS_LOG_TYPE_ERROR, v28, (uint8_t *)__strerrbuf, 0xCu);
      }
    }
    else
    {
      v34 = v68[3];
      BSLogSharedMemory();
      v27 = objc_claimAutoreleasedReturnValue();
      v35 = os_log_type_enabled(v27, OS_LOG_TYPE_ERROR);
      if (v34 == v9)
      {
        if (v35)
        {
          *(_DWORD *)__strerrbuf = 136315138;
          v78 = a1;
          v28 = "%s: data failed to serialize (external reason) - unlinking";
          goto LABEL_65;
        }
      }
      else if (v35)
      {
        *(_DWORD *)__strerrbuf = 136315138;
        v78 = a1;
        v28 = "%s: data failed to serialize (maybe because it tried to write less than it declared up front) - unlinking";
        goto LABEL_65;
      }
    }

    BSShmDelete(a1, 0);
    v13 = 0;
LABEL_67:
    *__error() = 0;
    if (munmap(v54, v9 + 16) == -1)
    {
      v36 = __error();
      strerror_r(*v36, __strerrbuf, 0x100uLL);
      BSLogSharedMemory();
      v37 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
      {
        v39 = *__error();
        *(_DWORD *)v71 = 136315650;
        v72 = a1;
        v73 = 1024;
        v74 = v39;
        v75 = 2080;
        v76 = __strerrbuf;
        _os_log_error_impl(&dword_18A184000, v37, OS_LOG_TYPE_ERROR, "%s: failed to munmap - unlinking : errno=%i (%s)", v71, 0x1Cu);
      }

      BSShmDelete(a1, 0);
    }

    _Block_object_dispose(&v63, 8);
    _Block_object_dispose(&v67, 8);
    _Block_object_dispose(buf, 8);
    goto LABEL_35;
  }
  v11 = __error();
  strerror_r(*v11, __strerrbuf, 0x100uLL);
  BSLogSharedMemory();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
  {
    v21 = *__error();
    *(_DWORD *)buf = 136315650;
    *(_QWORD *)&buf[4] = a1;
    *(_WORD *)&buf[12] = 1024;
    *(_DWORD *)&buf[14] = v21;
    *(_WORD *)&buf[18] = 2080;
    *(_QWORD *)&buf[20] = __strerrbuf;
    _os_log_error_impl(&dword_18A184000, v12, OS_LOG_TYPE_ERROR, "%s: failed to create : errno=%i (%s)", buf, 0x1Cu);
  }

  v13 = 0;
LABEL_39:

  return v13;
}

void sub_18A1D29F8(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_18A1D3224(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_18A1D3484(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_18A1D36A0(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_18A1D3ACC(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_18A1D3D34(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_18A1D3F5C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_18A1D405C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_18A1D40A4(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_18A1D41F0(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_18A1D4370(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_18A1D44F8(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_18A1D4634(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_18A1D4798(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_18A1D48A8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{

  _Unwind_Resume(a1);
}

void sub_18A1D4978(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_18A1D4CFC(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_18A1D4DA0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_18A1D4F6C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_18A1D5174(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  _Unwind_Resume(a1);
}

void sub_18A1D51FC(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_18A1D52D0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void sub_18A1D5368(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_18A1D53E8(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_18A1D544C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_18A1D54AC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_18A1D5560(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_18A1D5908(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_18A1D5A84(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  v3 = v2;

  _Unwind_Resume(a1);
}

void sub_18A1D6260(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14, uint64_t a15, uint64_t a16, uint64_t a17, void *a18, uint64_t a19, void *a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,void *a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,void *a33)
{
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;

  _Unwind_Resume(a1);
}

void sub_18A1D6724(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, void *a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, void *a12, void *a13, uint64_t a14, uint64_t a15, ...)
{
  va_list va;

  va_start(va, a15);

  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_18A1D6850(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_18A1D68BC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_18A1D6B94(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_18A1D6D3C(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_18A1D6DD4(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_18A1D6FDC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, id a12)
{
  void *v12;

  _Unwind_Resume(a1);
}

void sub_18A1D71E4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, id a12)
{
  void *v12;

  _Unwind_Resume(a1);
}

void sub_18A1D7298(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_18A1D749C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_18A1D7598(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_18A1D76BC(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_18A1D77A8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, objc_super a9)
{
  void *v9;

  a9.super_class = (Class)BSSqliteDatabaseConnection;
  -[_Unwind_Exception dealloc](&a9, sel_dealloc);
  _Unwind_Resume(a1);
}

void sub_18A1D7A04(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_18A1D7D4C(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_18A1D7EC4(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

uint64_t BSFormattedTimeFromSeconds(double a1)
{
  return objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%02d:%02d:%02d"), ((int)(a1 / 60.0) / 60), ((int)(a1 / 60.0) % 60), ((int)llround(a1) % 60));
}

double BSAbsoluteTimeFromMachTime(unint64_t a1)
{
  if (_MergedGlobals_9 != -1)
    dispatch_once_f(&_MergedGlobals_9, 0, (dispatch_function_t)__machTimeScaleInit);
  return *(double *)&qword_1ECD39840 * (double)a1;
}

double __machTimeScaleInit()
{
  uint64_t v0;
  int v1;
  NSObject *v2;
  NSObject *v3;
  os_log_type_t v4;
  BOOL v5;
  double result;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  mach_timebase_info info;
  uint8_t buf[4];
  void *v13;
  __int16 v14;
  const __CFString *v15;
  __int16 v16;
  int v17;
  __int16 v18;
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  info = 0;
  v0 = mach_timebase_info(&info);
  if ((_DWORD)v0)
  {
    v1 = 2;
    do
    {
      if (!v1)
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("failed to fetch mach_timebase_info after multiple attempts : latest r=%i"), v0);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
        {
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "void __machTimeScaleInit(void *)");
          v8 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138544130;
          v13 = v8;
          v14 = 2114;
          v15 = CFSTR("BSTimeUtilities.m");
          v16 = 1024;
          v17 = 55;
          v18 = 2114;
          v19 = v7;
          _os_log_error_impl(&dword_18A184000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ (%{public}@:%i) : %{public}@", buf, 0x26u);

        }
        qword_1EDF5BAE8 = objc_msgSend(objc_retainAutorelease(v7), "UTF8String");
        __break(0);
        JUMPOUT(0x18A1D81CCLL);
      }
      BSLogCommon();
      v2 = objc_claimAutoreleasedReturnValue();
      v3 = v2;
      if (--v1)
        v4 = OS_LOG_TYPE_ERROR;
      else
        v4 = OS_LOG_TYPE_FAULT;
      if (os_log_type_enabled(v2, v4))
      {
        *(_DWORD *)buf = 67109120;
        LODWORD(v13) = v0;
        _os_log_impl(&dword_18A184000, v3, v4, "failed to fetch mach_timebase_info with r=%i", buf, 8u);
      }

      v0 = mach_timebase_info(&info);
    }
    while ((_DWORD)v0);
  }
  if (info.numer)
    v5 = info.denom == 0;
  else
    v5 = 1;
  if (v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("mach_timebase_info returned a numer or denom of zero : numer=%i denom=%i"), info.numer, info.denom);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "void __machTimeScaleInit(void *)");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544130;
      v13 = v10;
      v14 = 2114;
      v15 = CFSTR("BSTimeUtilities.m");
      v16 = 1024;
      v17 = 56;
      v18 = 2114;
      v19 = v9;
      _os_log_error_impl(&dword_18A184000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ (%{public}@:%i) : %{public}@", buf, 0x26u);

    }
    qword_1EDF5BAE8 = objc_msgSend(objc_retainAutorelease(v9), "UTF8String");
    __break(0);
    JUMPOUT(0x18A1D82A0);
  }
  result = (double)info.numer / (double)info.denom / 1000000000.0 * 1.84467441e19;
  *(double *)&qword_1ECD39840 = (double)info.numer / (double)info.denom / 1000000000.0;
  *(double *)&qword_1ECD39848 = result;
  *(double *)&qword_1ECD39850 = (double)info.denom / (double)info.numer * 1000000000.0;
  return result;
}

void sub_18A1D82A8(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

double BSTimeDifferenceFromMachTimeToMachTime(unint64_t a1, unint64_t a2)
{
  unint64_t v4;
  double result;

  if (_MergedGlobals_9 != -1)
    dispatch_once_f(&_MergedGlobals_9, 0, (dispatch_function_t)__machTimeScaleInit);
  v4 = a2 - a1;
  if (a1 > a2)
    v4 = a1 - a2;
  result = -(*(double *)&qword_1ECD39840 * (double)v4);
  if (a1 <= a2)
    return *(double *)&qword_1ECD39840 * (double)v4;
  return result;
}

uint64_t BSMachTimeForTimeDifferenceFromMachTime(unint64_t a1, double a2)
{
  double v3;
  double v5;
  unint64_t v8;
  BOOL v9;
  unint64_t v10;
  unint64_t v11;

  v3 = fabs(a2);
  if (v3 == INFINITY)
    return (uint64_t)~*(_QWORD *)&a2 >> 63;
  if (_MergedGlobals_9 != -1)
    dispatch_once_f(&_MergedGlobals_9, 0, (dispatch_function_t)__machTimeScaleInit);
  v5 = vabdd_f64(v3, *(double *)&qword_1ECD39848);
  if (v3 > *(double *)&qword_1ECD39848 || v5 < 2.22044605e-16)
    return (uint64_t)~*(_QWORD *)&a2 >> 63;
  v8 = (unint64_t)(v3 * *(double *)&qword_1ECD39850 + 0.5);
  if ((*(_QWORD *)&a2 & 0x8000000000000000) != 0)
  {
    v9 = a1 >= v8;
    v11 = a1 - v8;
    if (v9)
      return v11;
    else
      return 0;
  }
  else
  {
    v9 = __CFADD__(a1, v8);
    v10 = a1 + v8;
    if (v9)
      return -1;
    else
      return v10;
  }
}

void sub_18A1D8508(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

double BSTimeIntervalFromMachTimeValue(uint64_t a1)
{
  return (double)SHIDWORD(a1) / 1000000.0 + (double)(int)a1;
}

double BSTimeIntervalForCPUTicks(unsigned int a1)
{
  int v2;
  size_t v4;
  _QWORD v5[2];
  int v6;
  int v7[2];
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v2 = BSTimeIntervalForCPUTicks___MicrosecondsPerTick;
  if (BSTimeIntervalForCPUTicks___MicrosecondsPerTick <= 0)
  {
    v5[0] = 0;
    v5[1] = 0;
    v6 = 0;
    v4 = 20;
    *(_QWORD *)v7 = 0xC00000001;
    if (sysctl(v7, 2u, v5, &v4, 0, 0))
    {
      v2 = BSTimeIntervalForCPUTicks___MicrosecondsPerTick;
    }
    else
    {
      v2 = HIDWORD(v5[0]);
      BSTimeIntervalForCPUTicks___MicrosecondsPerTick = HIDWORD(v5[0]);
    }
  }
  return (double)(uint64_t)(v2 * (unint64_t)a1) / 1000000.0;
}

id BSLaterDate(void *a1, void *a2)
{
  id v3;
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;

  v3 = a1;
  v4 = a2;
  v5 = v4;
  v6 = v4;
  if (v3 && (v6 = v3, v4))
  {
    objc_msgSend(v3, "laterDate:", v4);
    v7 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = v6;
  }
  v8 = v7;

  return v8;
}

void sub_18A1D867C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

id BSDateAtStartOfDay(void *a1)
{
  id v1;
  __CFCalendar *v2;
  CFAbsoluteTime v3;
  void *v4;
  unsigned int v6;
  uint64_t v7;
  CFAbsoluteTime at;

  v1 = a1;
  v2 = CFCalendarCopyCurrent();
  if (v2)
  {
    v7 = 0;
    at = 0.0;
    v6 = 0;
    objc_msgSend(v1, "timeIntervalSinceReferenceDate");
    if (CFCalendarDecomposeAbsoluteTime(v2, v3, "yMd", (char *)&v7 + 4, &v7, &v6)
      && CFCalendarComposeAbsoluteTime(v2, &at, "yMd", HIDWORD(v7), v7, v6))
    {
      objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceReferenceDate:", at);
      v4 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v4 = 0;
    }
    CFRelease(v2);
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

void sub_18A1D8774(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

dispatch_time_t BSDispatchTimeFromTimeInterval(double a1)
{
  int64_t v1;

  if (a1 >= 9223372040.0)
    return -1;
  if (a1 <= -9223372040.0)
    v1 = 0x8000000000000000;
  else
    v1 = (uint64_t)(a1 * 1000000000.0);
  return dispatch_time(0, v1);
}

void sub_18A1D883C(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_18A1D88B4(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_18A1D8938(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_18A1D8990(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_18A1D8A18(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  v4 = v3;

  _Unwind_Resume(a1);
}

void sub_18A1D8ABC(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  v4 = v3;

  _Unwind_Resume(a1);
}

void sub_18A1D8C8C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, _Unwind_Exception *exception_object, objc_super a11)
{
  void *v11;

  a11.super_class = (Class)BSAbsoluteMachTimer;
  -[_Unwind_Exception dealloc](&a11, sel_dealloc);
  _Unwind_Resume(a1);
}

void sub_18A1D8CD8(_Unwind_Exception *a1, int a2)
{
  if (a2)
    objc_terminate();
  _Unwind_Resume(a1);
}

void sub_18A1D8D68(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_18A1D8DD4(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_18A1D9518(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;
  void *v11;

  _Unwind_Resume(a1);
}

void sub_18A1D97F0(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_18A1D9940(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_18A1D99B8(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_18A1D9A70(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_18A1D9B0C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_18A1D9B58(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_18A1DA400(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void *a9, void *a10, void *a11, void *a12, void *a13, void *a14)
{
  void *v14;
  void *v15;
  void *v16;

  _Unwind_Resume(a1);
}

void sub_18A1DA960(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, __int128 buf, __int16 a18, uint64_t a19, __int16 a20,uint64_t a21)
{
  void *v21;
  uint64_t v22;
  void *v23;
  objc_class *v24;
  void *v25;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  uint64_t v32;
  NSObject *v33;
  void *v34;
  void *v35;
  id v36;

  if (a2 == 1)
  {
    v36 = objc_begin_catch(a1);
    v28 = (void *)MEMORY[0x1E0CB3940];
    NSStringFromClass(v24);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(v22 + 8), "bundleIdentifier");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(v22 + 8), "bundlePath");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "stringWithFormat:", CFSTR("%s ERROR while loading plugin.\nClass: %@\nBundleID: %@\nPath: %@\nException: %@"));
    v31 = (void *)objc_claimAutoreleasedReturnValue();

    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v36, "callStackSymbols");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "stringByAppendingFormat:", CFSTR("\nCall stack: %@"));
      v32 = objc_claimAutoreleasedReturnValue();

      v31 = (void *)v32;
    }
    BSLogCommon();
    v33 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
    {
      LODWORD(buf) = 138543362;
      *(_QWORD *)((char *)&buf + 4) = v31;
      _os_log_error_impl(&dword_18A184000, v33, OS_LOG_TYPE_ERROR, "%{public}@", (uint8_t *)&buf, 0xCu);
    }

    objc_end_catch();
    JUMPOUT(0x18A1DA894);
  }

  _Unwind_Resume(a1);
}

void sub_18A1DAC6C(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_18A1DAD74(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_18A1DADBC(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_18A1DAEE0(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_18A1DAFE0(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_18A1DB02C(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_18A1DB078(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_18A1DB0BC(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_18A1DB114(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_18A1DB184(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void sub_18A1DB20C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void sub_18A1DB294(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void sub_18A1DB314(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void sub_18A1DB38C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

id BSLogTransactionAuditHistory()
{
  if (qword_1ECD39860 != -1)
    dispatch_once(&qword_1ECD39860, &__block_literal_global_2);
  return (id)_MergedGlobals_10;
}

id BSLogPowerMonitor()
{
  if (BSLogPowerMonitor_onceToken != -1)
    dispatch_once(&BSLogPowerMonitor_onceToken, &__block_literal_global_4);
  return (id)BSLogPowerMonitor___logObj;
}

id BSLogSharedMemory()
{
  if (BSLogSharedMemory_onceToken != -1)
    dispatch_once(&BSLogSharedMemory_onceToken, &__block_literal_global_6_0);
  return (id)BSLogSharedMemory___logObj;
}

id BSLogTimer()
{
  if (BSLogTimer_onceToken != -1)
    dispatch_once(&BSLogTimer_onceToken, &__block_literal_global_8);
  return (id)BSLogTimer___logObj;
}

void sub_18A1DB684(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_18A1DB80C(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_18A1DB884(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_18A1DB9D0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, objc_super a9)
{
  void *v9;

  a9.super_class = (Class)BSXPCConnectionListenerManager;
  -[_Unwind_Exception dealloc](&a9, sel_dealloc);
  _Unwind_Resume(a1);
}

void sub_18A1DBB50(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, id a12)
{

  _Unwind_Resume(a1);
}

void sub_18A1DBBD8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_18A1DC094(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, void *a12, void *a13, void *a14, void *a15, uint64_t a16, void *a17, void *a18, id a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24)
{
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;

  _Unwind_Resume(a1);
}

void sub_18A1DC208(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;
  void *v11;

  _Unwind_Resume(a1);
}

void sub_18A1DC34C(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_18A1DC3A4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_18A1DC46C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;
  void *v11;
  void *v12;

  objc_sync_exit(v11);
  _Unwind_Resume(a1);
}

void sub_18A1DC4F0(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_18A1DC598(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

NSUInteger BSObjCSizeForTypeEncoding(const char *a1)
{
  NSUInteger sizep;

  sizep = 0;
  NSGetSizeAndAlignment(a1, &sizep, 0);
  return sizep;
}

void sub_18A1DC764(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_18A1DC910(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_18A1DD330(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, void *a12, void *a13, void *a14, uint64_t a15, uint64_t a16, uint64_t a17, void *a18)
{
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;

  _Unwind_Resume(a1);
}

void sub_18A1DD5CC(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_18A1DDD84(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,id a32)
{
  void *v32;
  void *v33;

  _Block_object_dispose(&a27, 8);
  _Unwind_Resume(a1);
}

void sub_18A1DDEA4(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_18A1DE0B8(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_18A1DE164(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void sub_18A1DE224(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_18A1DE9BC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10, void *a11)
{
  void *v11;
  void *v12;

  _Unwind_Resume(a1);
}

void sub_18A1DEBAC(_Unwind_Exception *exception_object)
{
  _Unwind_Resume(exception_object);
}

void sub_18A1DED24(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_18A1DF134(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, _Unwind_Exception *exception_object)
{
  void *v10;
  void *v11;

  _Unwind_Resume(a1);
}

void sub_18A1DF500(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, _Unwind_Exception *exception_object)
{
  void *v11;
  void *v12;

  _Unwind_Resume(a1);
}

void sub_18A1DF690(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_18A1DF788(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_18A1DF7E4(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_18A1DF9D0(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_18A1DFA34(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_18A1DFAA4(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_18A1DFAFC(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_18A1DFCC4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, char a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,id a22)
{
  void *v22;
  void *v23;
  void *v24;
  void *v25;

  v25 = v24;

  _Block_object_dispose(&a17, 8);
  _Unwind_Resume(a1);
}

void sub_18A1DFDC8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void sub_18A1DFE54(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_18A1DFFA8(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_18A1E0118(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_18A1E01D4(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_18A1E0258(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_18A1E02A0(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_18A1E035C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  void *v14;
  void *v15;

  _Unwind_Resume(a1);
}

void sub_18A1E05C0(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_18A1E07F8(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_18A1E09D0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void sub_18A1E0B90(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void sub_18A1E0CB4(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_18A1E0DA0(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_18A1E0F40(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void sub_18A1E1104(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void sub_18A1E12E0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void sub_18A1E14C4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void sub_18A1E16BC(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_18A1E18B0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13, void *a14)
{
  void *v14;
  void *v15;

  _Unwind_Resume(a1);
}

void sub_18A1E1990(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_18A1E1A28(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_18A1E1AE0(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_18A1E1D98(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_18A1E203C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  _Unwind_Resume(a1);
}

void sub_18A1E23CC(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_18A1E2530(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

objc_class *BSObjCClassCreate(void *a1, objc_class *a2, void *a3)
{
  id v5;
  void (**v6)(id, objc_class *);
  id v7;
  void *v8;
  id v9;
  Class v10;
  objc_class *ClassPair;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  objc_class *v16;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  uint8_t buf[4];
  void *v23;
  __int16 v24;
  const __CFString *v25;
  __int16 v26;
  int v27;
  __int16 v28;
  void *v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v5 = a1;
  v6 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("preferredName != ((void *)0)"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Class  _Nonnull BSObjCClassCreate(NSString *__strong _Nonnull, __unsafe_unretained Class _Nonnull, BSObjCClassConfigurator  _Nullable __strong)");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544130;
      v23 = v19;
      v24 = 2114;
      v25 = CFSTR("BSObjCRuntime.m");
      v26 = 1024;
      v27 = 1950;
      v28 = 2114;
      v29 = v18;
      _os_log_error_impl(&dword_18A184000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ (%{public}@:%i) : %{public}@", buf, 0x26u);

    }
    qword_1EDF5BAE8 = objc_msgSend(objc_retainAutorelease(v18), "UTF8String");
    __break(0);
    JUMPOUT(0x18A1E287CLL);
  }
  if (!a2)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("creating root classes is not supported"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Class  _Nonnull BSObjCClassCreate(NSString *__strong _Nonnull, __unsafe_unretained Class _Nonnull, BSObjCClassConfigurator  _Nullable __strong)");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544130;
      v23 = v21;
      v24 = 2114;
      v25 = CFSTR("BSObjCRuntime.m");
      v26 = 1024;
      v27 = 1951;
      v28 = 2114;
      v29 = v20;
      _os_log_error_impl(&dword_18A184000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ (%{public}@:%i) : %{public}@", buf, 0x26u);

    }
    qword_1EDF5BAE8 = objc_msgSend(objc_retainAutorelease(v20), "UTF8String");
    __break(0);
    JUMPOUT(0x18A1E2948);
  }
  v7 = v5;
  v8 = v7;
  if (objc_msgSend(v7, "rangeOfString:", CFSTR(".")) != 0x7FFFFFFFFFFFFFFFLL)
  {
    objc_msgSend(v7, "stringByReplacingOccurrencesOfString:withString:", CFSTR("."), CFSTR("_"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  os_unfair_lock_lock((os_unfair_lock_t)&BSObjCClassCreate___ObjCLock);
  v9 = objc_retainAutorelease(v8);
  v10 = objc_lookUpClass((const char *)objc_msgSend(v9, "UTF8String"));
  ClassPair = v10;
  if (v10)
  {
    if ((-[objc_class isSubclassOfClass:](v10, "isSubclassOfClass:", a2) & 1) == 0)
    {
      v12 = (void *)MEMORY[0x1E0CB3940];
      NSStringFromClass(a2);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "stringWithFormat:", CFSTR("class %@ is not a subclass of %@"), v9, v13);
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Class  _Nonnull BSObjCClassCreate(NSString *__strong _Nonnull, __unsafe_unretained Class _Nonnull, BSObjCClassConfigurator  _Nullable __strong)");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138544130;
        v23 = v15;
        v24 = 2114;
        v25 = CFSTR("BSObjCRuntime.m");
        v26 = 1024;
        v27 = 1971;
        v28 = 2114;
        v29 = v14;
        _os_log_error_impl(&dword_18A184000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ (%{public}@:%i) : %{public}@", buf, 0x26u);

      }
      qword_1EDF5BAE8 = objc_msgSend(objc_retainAutorelease(v14), "UTF8String");
      __break(0);
      JUMPOUT(0x18A1E270CLL);
    }
  }
  else
  {
    ClassPair = objc_allocateClassPair(a2, (const char *)objc_msgSend(objc_retainAutorelease(v9), "UTF8String"), 0);
    if (v6)
      v6[2](v6, ClassPair);
    objc_registerClassPair(ClassPair);
  }
  os_unfair_lock_unlock((os_unfair_lock_t)&BSObjCClassCreate___ObjCLock);
  v16 = ClassPair;

  return v16;
}

void sub_18A1E2950(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  _Unwind_Resume(a1);
}

void sub_18A1E2A50(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_18A1E2C08(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, _Unwind_Exception *exception_object, objc_super a11)
{
  void *v11;

  a11.super_class = (Class)BSWallclockTimer;
  -[_Unwind_Exception dealloc](&a11, sel_dealloc);
  _Unwind_Resume(a1);
}

void sub_18A1E2C54(_Unwind_Exception *a1, int a2)
{
  if (a2)
    objc_terminate();
  _Unwind_Resume(a1);
}

void sub_18A1E2CE4(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_18A1E2D50(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_18A1E31F4(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  _Unwind_Resume(a1);
}

void sub_18A1E3340(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, objc_super a9)
{
  void *v9;
  void *v10;

  v10 = v9;
  a9.receiver = v10;
  a9.super_class = (Class)BSColor;
  -[_Unwind_Exception dealloc](&a9, sel_dealloc);
  _Unwind_Resume(a1);
}

void sub_18A1E340C(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);

  _Unwind_Resume(a1);
}

void sub_18A1E35E0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, void *a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,void *a23)
{
  void *v23;
  void *v24;
  uint64_t v25;

  _Unwind_Resume(a1);
}

void sub_18A1E3728(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_18A1E37B8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_18A1E3898(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_18A1E3928(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_18A1E398C(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_18A1E39F0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_18A1E3ACC(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_18A1E3B7C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  _Unwind_Resume(a1);
}

void sub_18A1E3C1C(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_18A1E3CB0(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_18A1E3D88(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_18A1E3E00(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_18A1E3E54(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_18A1E3F84(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_18A1E40D0(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_18A1E4140(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_18A1E41A0(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_18A1E41E8(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_18A1E42E8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13)
{
  void *v13;

  _Unwind_Resume(a1);
}

void sub_18A1E4394(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void BSRunLoopPerformAfterCACommit(void *a1)
{
  BSRunLoopPerformRelativeToCACommit(1, a1);
}

void BSRunLoopPerformRelativeToCACommit(uint64_t a1, void *a2)
{
  id v3;
  CFIndex v4;
  id v5;
  CFRunLoopObserverRef v6;
  __CFRunLoop *Current;
  _QWORD v8[4];
  id v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t v14;

  v3 = a2;
  v11 = 0;
  v12 = &v11;
  v13 = 0x2020000000;
  v14 = 0;
  v4 = a1 + 2000000;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __BSRunLoopPerformRelativeToCACommit_block_invoke;
  v8[3] = &unk_1E1EBF148;
  v5 = v3;
  v9 = v5;
  v10 = &v11;
  v6 = CFRunLoopObserverCreateWithHandler(0, 0xA0uLL, 0, v4, v8);
  v12[3] = (uint64_t)v6;
  Current = CFRunLoopGetCurrent();
  CFRunLoopAddObserver(Current, (CFRunLoopObserverRef)v12[3], (CFRunLoopMode)*MEMORY[0x1E0C9B270]);
  _Block_object_dispose(&v11, 8);

}

void sub_18A1E44EC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13)
{
  void *v13;

  _Unwind_Resume(a1);
}

void sub_18A1E48BC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void *a9, void *a10, void *a11)
{
  void *v11;

  _Unwind_Resume(a1);
}

void sub_18A1E4A1C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_18A1E4A7C(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_18A1E4AF8(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_18A1E4B40(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_18A1E4C68(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_18A1E4D48(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_18A1E4DE0(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_18A1E4F50(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_18A1E51D8(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  v2 = v1;

  _Unwind_Resume(a1);
}

void sub_18A1E5440(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_18A1E55DC(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sbDefaults_setBool(void *a1, const char *a2, uint64_t a3)
{
  uint64_t v5;
  uint64_t v6;
  id v7;
  int v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  id v13;
  id v14;

  v14 = a1;
  -[BSAbstractDefaultDomain _propertyFromSelector:]((uint64_t)v14, a2);
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    if ((*(_BYTE *)(v5 + 72) & 4) != 0)
    {
      v7 = *(id *)(v5 + 64);
      v8 = objc_msgSend(v7, "BOOLValue");

      if (v8 == (_DWORD)a3)
      {
        objc_msgSend(v14, "_store");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = *(id *)(v6 + 56);
        objc_msgSend(v12, "removeObjectForKey:", v13);

LABEL_9:
        if ((*(_BYTE *)(v6 + 72) & 2) != 0)
          objc_msgSend(v14, "synchronizeDefaults");
        goto LABEL_11;
      }
    }
  }
  objc_msgSend(v14, "_store");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
    v10 = *(void **)(v6 + 56);
  else
    v10 = 0;
  v11 = v10;
  objc_msgSend(v9, "setBool:forKey:", a3, v11);

  if (v6)
    goto LABEL_9;
LABEL_11:

}

void sub_18A1E572C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;
  void *v11;
  void *v12;

  _Unwind_Resume(a1);
}

uint64_t sbDefaults_getInt(void *a1, const char *a2)
{
  id v3;
  _QWORD *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  uint64_t v9;

  v3 = a1;
  -[BSAbstractDefaultDomain _propertyFromSelector:]((uint64_t)v3, a2);
  v4 = (_QWORD *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_store");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
    v6 = (void *)v4[7];
  else
    v6 = 0;
  v7 = v6;
  objc_msgSend(v5, "objectForKey:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "intValue");

  return v9;
}

void sub_18A1E5818(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  _Unwind_Resume(a1);
}

void sbDefaults_setInt(void *a1, const char *a2, uint64_t a3)
{
  uint64_t v5;
  uint64_t v6;
  id v7;
  int v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  id v15;

  v15 = a1;
  -[BSAbstractDefaultDomain _propertyFromSelector:]((uint64_t)v15, a2);
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    if ((*(_BYTE *)(v5 + 72) & 4) != 0)
    {
      v7 = *(id *)(v5 + 64);
      v8 = objc_msgSend(v7, "intValue");

      if (v8 == (_DWORD)a3)
      {
        objc_msgSend(v15, "_store");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = *(id *)(v6 + 56);
        objc_msgSend(v9, "removeObjectForKey:", v10);

LABEL_8:
        if ((*(_BYTE *)(v6 + 72) & 2) != 0)
          objc_msgSend(v15, "synchronizeDefaults");
        goto LABEL_10;
      }
    }
  }
  objc_msgSend(v15, "_store");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", a3);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
    v13 = *(void **)(v6 + 56);
  else
    v13 = 0;
  v14 = v13;
  objc_msgSend(v11, "setObject:forKey:", v12, v14);

  if (v6)
    goto LABEL_8;
LABEL_10:

}

void sub_18A1E5988(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;
  void *v11;
  void *v12;

  _Unwind_Resume(a1);
}

uint64_t sbDefaults_getShort(void *a1, const char *a2)
{
  id v3;
  _QWORD *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  uint64_t v9;

  v3 = a1;
  -[BSAbstractDefaultDomain _propertyFromSelector:]((uint64_t)v3, a2);
  v4 = (_QWORD *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_store");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
    v6 = (void *)v4[7];
  else
    v6 = 0;
  v7 = v6;
  objc_msgSend(v5, "objectForKey:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "shortValue");

  return v9;
}

void sub_18A1E5A88(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  _Unwind_Resume(a1);
}

void sbDefaults_setShort(void *a1, const char *a2, uint64_t a3)
{
  uint64_t v5;
  uint64_t v6;
  id v7;
  int v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  id v15;

  v15 = a1;
  -[BSAbstractDefaultDomain _propertyFromSelector:]((uint64_t)v15, a2);
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    if ((*(_BYTE *)(v5 + 72) & 4) != 0)
    {
      v7 = *(id *)(v5 + 64);
      v8 = objc_msgSend(v7, "shortValue");

      if (v8 == (_DWORD)a3)
      {
        objc_msgSend(v15, "_store");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = *(id *)(v6 + 56);
        objc_msgSend(v9, "removeObjectForKey:", v10);

LABEL_8:
        if ((*(_BYTE *)(v6 + 72) & 2) != 0)
          objc_msgSend(v15, "synchronizeDefaults");
        goto LABEL_10;
      }
    }
  }
  objc_msgSend(v15, "_store");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithShort:", a3);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
    v13 = *(void **)(v6 + 56);
  else
    v13 = 0;
  v14 = v13;
  objc_msgSend(v11, "setObject:forKey:", v12, v14);

  if (v6)
    goto LABEL_8;
LABEL_10:

}

void sub_18A1E5BF8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;
  void *v11;
  void *v12;

  _Unwind_Resume(a1);
}

uint64_t sbDefaults_getLong(void *a1, const char *a2)
{
  id v3;
  _QWORD *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  uint64_t v9;

  v3 = a1;
  -[BSAbstractDefaultDomain _propertyFromSelector:]((uint64_t)v3, a2);
  v4 = (_QWORD *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_store");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
    v6 = (void *)v4[7];
  else
    v6 = 0;
  v7 = v6;
  objc_msgSend(v5, "objectForKey:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "longValue");

  return v9;
}

void sub_18A1E5CF8(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  _Unwind_Resume(a1);
}

void sbDefaults_setLong(void *a1, const char *a2, uint64_t a3)
{
  uint64_t v5;
  uint64_t v6;
  id v7;
  uint64_t v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  id v15;

  v15 = a1;
  -[BSAbstractDefaultDomain _propertyFromSelector:]((uint64_t)v15, a2);
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    if ((*(_BYTE *)(v5 + 72) & 4) != 0)
    {
      v7 = *(id *)(v5 + 64);
      v8 = objc_msgSend(v7, "longValue");

      if (v8 == a3)
      {
        objc_msgSend(v15, "_store");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = *(id *)(v6 + 56);
        objc_msgSend(v9, "removeObjectForKey:", v10);

LABEL_8:
        if ((*(_BYTE *)(v6 + 72) & 2) != 0)
          objc_msgSend(v15, "synchronizeDefaults");
        goto LABEL_10;
      }
    }
  }
  objc_msgSend(v15, "_store");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLong:", a3);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
    v13 = *(void **)(v6 + 56);
  else
    v13 = 0;
  v14 = v13;
  objc_msgSend(v11, "setObject:forKey:", v12, v14);

  if (v6)
    goto LABEL_8;
LABEL_10:

}

void sub_18A1E5E68(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;
  void *v11;
  void *v12;

  _Unwind_Resume(a1);
}

void sbDefaults_setLongLong(void *a1, const char *a2, uint64_t a3)
{
  uint64_t v5;
  uint64_t v6;
  id v7;
  uint64_t v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  id v15;

  v15 = a1;
  -[BSAbstractDefaultDomain _propertyFromSelector:]((uint64_t)v15, a2);
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    if ((*(_BYTE *)(v5 + 72) & 4) != 0)
    {
      v7 = *(id *)(v5 + 64);
      v8 = objc_msgSend(v7, "longLongValue");

      if (v8 == a3)
      {
        objc_msgSend(v15, "_store");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = *(id *)(v6 + 56);
        objc_msgSend(v9, "removeObjectForKey:", v10);

LABEL_8:
        if ((*(_BYTE *)(v6 + 72) & 2) != 0)
          objc_msgSend(v15, "synchronizeDefaults");
        goto LABEL_10;
      }
    }
  }
  objc_msgSend(v15, "_store");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", a3);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
    v13 = *(void **)(v6 + 56);
  else
    v13 = 0;
  v14 = v13;
  objc_msgSend(v11, "setObject:forKey:", v12, v14);

  if (v6)
    goto LABEL_8;
LABEL_10:

}

void sub_18A1E5FF4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;
  void *v11;
  void *v12;

  _Unwind_Resume(a1);
}

uint64_t sbDefaults_getUnsignedInt(void *a1, const char *a2)
{
  id v3;
  _QWORD *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  uint64_t v9;

  v3 = a1;
  -[BSAbstractDefaultDomain _propertyFromSelector:]((uint64_t)v3, a2);
  v4 = (_QWORD *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_store");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
    v6 = (void *)v4[7];
  else
    v6 = 0;
  v7 = v6;
  objc_msgSend(v5, "objectForKey:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "unsignedIntValue");

  return v9;
}

void sub_18A1E60F4(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  _Unwind_Resume(a1);
}

void sbDefaults_setUnsignedInt(void *a1, const char *a2, uint64_t a3)
{
  uint64_t v5;
  uint64_t v6;
  id v7;
  int v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  id v15;

  v15 = a1;
  -[BSAbstractDefaultDomain _propertyFromSelector:]((uint64_t)v15, a2);
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    if ((*(_BYTE *)(v5 + 72) & 4) != 0)
    {
      v7 = *(id *)(v5 + 64);
      v8 = objc_msgSend(v7, "unsignedIntValue");

      if (v8 == (_DWORD)a3)
      {
        objc_msgSend(v15, "_store");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = *(id *)(v6 + 56);
        objc_msgSend(v9, "removeObjectForKey:", v10);

LABEL_8:
        if ((*(_BYTE *)(v6 + 72) & 2) != 0)
          objc_msgSend(v15, "synchronizeDefaults");
        goto LABEL_10;
      }
    }
  }
  objc_msgSend(v15, "_store");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", a3);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
    v13 = *(void **)(v6 + 56);
  else
    v13 = 0;
  v14 = v13;
  objc_msgSend(v11, "setObject:forKey:", v12, v14);

  if (v6)
    goto LABEL_8;
LABEL_10:

}

void sub_18A1E6264(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;
  void *v11;
  void *v12;

  _Unwind_Resume(a1);
}

uint64_t sbDefaults_getUnsignedShort(void *a1, const char *a2)
{
  id v3;
  _QWORD *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  uint64_t v9;

  v3 = a1;
  -[BSAbstractDefaultDomain _propertyFromSelector:]((uint64_t)v3, a2);
  v4 = (_QWORD *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_store");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
    v6 = (void *)v4[7];
  else
    v6 = 0;
  v7 = v6;
  objc_msgSend(v5, "objectForKey:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "unsignedShortValue");

  return v9;
}

void sub_18A1E6364(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  _Unwind_Resume(a1);
}

void sbDefaults_setUnsignedShort(void *a1, const char *a2, uint64_t a3)
{
  uint64_t v5;
  uint64_t v6;
  id v7;
  int v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  id v15;

  v15 = a1;
  -[BSAbstractDefaultDomain _propertyFromSelector:]((uint64_t)v15, a2);
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    if ((*(_BYTE *)(v5 + 72) & 4) != 0)
    {
      v7 = *(id *)(v5 + 64);
      v8 = objc_msgSend(v7, "unsignedShortValue");

      if (v8 == (_DWORD)a3)
      {
        objc_msgSend(v15, "_store");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = *(id *)(v6 + 56);
        objc_msgSend(v9, "removeObjectForKey:", v10);

LABEL_8:
        if ((*(_BYTE *)(v6 + 72) & 2) != 0)
          objc_msgSend(v15, "synchronizeDefaults");
        goto LABEL_10;
      }
    }
  }
  objc_msgSend(v15, "_store");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedShort:", a3);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
    v13 = *(void **)(v6 + 56);
  else
    v13 = 0;
  v14 = v13;
  objc_msgSend(v11, "setObject:forKey:", v12, v14);

  if (v6)
    goto LABEL_8;
LABEL_10:

}

void sub_18A1E64D4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;
  void *v11;
  void *v12;

  _Unwind_Resume(a1);
}

uint64_t sbDefaults_getUnsignedLong(void *a1, const char *a2)
{
  id v3;
  _QWORD *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  uint64_t v9;

  v3 = a1;
  -[BSAbstractDefaultDomain _propertyFromSelector:]((uint64_t)v3, a2);
  v4 = (_QWORD *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_store");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
    v6 = (void *)v4[7];
  else
    v6 = 0;
  v7 = v6;
  objc_msgSend(v5, "objectForKey:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "unsignedLongValue");

  return v9;
}

void sub_18A1E65D4(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  _Unwind_Resume(a1);
}

void sbDefaults_setUnsignedLong(void *a1, const char *a2, uint64_t a3)
{
  uint64_t v5;
  uint64_t v6;
  id v7;
  uint64_t v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  id v15;

  v15 = a1;
  -[BSAbstractDefaultDomain _propertyFromSelector:]((uint64_t)v15, a2);
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    if ((*(_BYTE *)(v5 + 72) & 4) != 0)
    {
      v7 = *(id *)(v5 + 64);
      v8 = objc_msgSend(v7, "unsignedLongValue");

      if (v8 == a3)
      {
        objc_msgSend(v15, "_store");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = *(id *)(v6 + 56);
        objc_msgSend(v9, "removeObjectForKey:", v10);

LABEL_8:
        if ((*(_BYTE *)(v6 + 72) & 2) != 0)
          objc_msgSend(v15, "synchronizeDefaults");
        goto LABEL_10;
      }
    }
  }
  objc_msgSend(v15, "_store");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLong:", a3);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
    v13 = *(void **)(v6 + 56);
  else
    v13 = 0;
  v14 = v13;
  objc_msgSend(v11, "setObject:forKey:", v12, v14);

  if (v6)
    goto LABEL_8;
LABEL_10:

}

void sub_18A1E6744(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;
  void *v11;
  void *v12;

  _Unwind_Resume(a1);
}

uint64_t sbDefaults_getUnsignedLongLong(void *a1, const char *a2)
{
  id v3;
  _QWORD *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  uint64_t v9;

  v3 = a1;
  -[BSAbstractDefaultDomain _propertyFromSelector:]((uint64_t)v3, a2);
  v4 = (_QWORD *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_store");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
    v6 = (void *)v4[7];
  else
    v6 = 0;
  v7 = v6;
  objc_msgSend(v5, "objectForKey:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "unsignedLongLongValue");

  return v9;
}

void sub_18A1E6844(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  _Unwind_Resume(a1);
}

void sbDefaults_setUnsignedLongLong(void *a1, const char *a2, uint64_t a3)
{
  uint64_t v5;
  uint64_t v6;
  id v7;
  uint64_t v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  id v15;

  v15 = a1;
  -[BSAbstractDefaultDomain _propertyFromSelector:]((uint64_t)v15, a2);
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    if ((*(_BYTE *)(v5 + 72) & 4) != 0)
    {
      v7 = *(id *)(v5 + 64);
      v8 = objc_msgSend(v7, "unsignedLongLongValue");

      if (v8 == a3)
      {
        objc_msgSend(v15, "_store");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = *(id *)(v6 + 56);
        objc_msgSend(v9, "removeObjectForKey:", v10);

LABEL_8:
        if ((*(_BYTE *)(v6 + 72) & 2) != 0)
          objc_msgSend(v15, "synchronizeDefaults");
        goto LABEL_10;
      }
    }
  }
  objc_msgSend(v15, "_store");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", a3);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
    v13 = *(void **)(v6 + 56);
  else
    v13 = 0;
  v14 = v13;
  objc_msgSend(v11, "setObject:forKey:", v12, v14);

  if (v6)
    goto LABEL_8;
LABEL_10:

}

void sub_18A1E69B4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;
  void *v11;
  void *v12;

  _Unwind_Resume(a1);
}

float sbDefaults_getFloat(void *a1, const char *a2)
{
  id v3;
  _QWORD *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  float v9;
  float v10;

  v3 = a1;
  -[BSAbstractDefaultDomain _propertyFromSelector:]((uint64_t)v3, a2);
  v4 = (_QWORD *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_store");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
    v6 = (void *)v4[7];
  else
    v6 = 0;
  v7 = v6;
  objc_msgSend(v5, "objectForKey:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "floatValue");
  v10 = v9;

  return v10;
}

void sub_18A1E6ABC(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v6 = v5;

  _Unwind_Resume(a1);
}

void sbDefaults_setFloat(void *a1, const char *a2, float a3)
{
  uint64_t v5;
  uint64_t v6;
  id v7;
  float v8;
  float v9;
  void *v10;
  id v11;
  void *v12;
  double v13;
  void *v14;
  void *v15;
  id v16;
  id v17;

  v17 = a1;
  -[BSAbstractDefaultDomain _propertyFromSelector:]((uint64_t)v17, a2);
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    if ((*(_BYTE *)(v5 + 72) & 4) != 0)
    {
      v7 = *(id *)(v5 + 64);
      objc_msgSend(v7, "floatValue");
      v9 = v8;

      if (v9 == a3)
      {
        objc_msgSend(v17, "_store");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = *(id *)(v6 + 56);
        objc_msgSend(v10, "removeObjectForKey:", v11);

LABEL_8:
        if ((*(_BYTE *)(v6 + 72) & 2) != 0)
          objc_msgSend(v17, "synchronizeDefaults");
        goto LABEL_10;
      }
    }
  }
  objc_msgSend(v17, "_store");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  *(float *)&v13 = a3;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
    v15 = *(void **)(v6 + 56);
  else
    v15 = 0;
  v16 = v15;
  objc_msgSend(v12, "setObject:forKey:", v14, v16);

  if (v6)
    goto LABEL_8;
LABEL_10:

}

void sub_18A1E6C38(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;
  void *v11;
  void *v12;

  _Unwind_Resume(a1);
}

double sbDefaults_getDouble(void *a1, const char *a2)
{
  id v3;
  _QWORD *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  double v9;
  double v10;

  v3 = a1;
  -[BSAbstractDefaultDomain _propertyFromSelector:]((uint64_t)v3, a2);
  v4 = (_QWORD *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_store");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
    v6 = (void *)v4[7];
  else
    v6 = 0;
  v7 = v6;
  objc_msgSend(v5, "objectForKey:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "doubleValue");
  v10 = v9;

  return v10;
}

void sub_18A1E6D40(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v6 = v5;

  _Unwind_Resume(a1);
}

void sbDefaults_setDouble(void *a1, const char *a2, double a3)
{
  uint64_t v5;
  uint64_t v6;
  id v7;
  double v8;
  double v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  id v16;

  v16 = a1;
  -[BSAbstractDefaultDomain _propertyFromSelector:]((uint64_t)v16, a2);
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    if ((*(_BYTE *)(v5 + 72) & 4) != 0)
    {
      v7 = *(id *)(v5 + 64);
      objc_msgSend(v7, "doubleValue");
      v9 = v8;

      if (v9 == a3)
      {
        objc_msgSend(v16, "_store");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = *(id *)(v6 + 56);
        objc_msgSend(v10, "removeObjectForKey:", v11);

LABEL_8:
        if ((*(_BYTE *)(v6 + 72) & 2) != 0)
          objc_msgSend(v16, "synchronizeDefaults");
        goto LABEL_10;
      }
    }
  }
  objc_msgSend(v16, "_store");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a3);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
    v14 = *(void **)(v6 + 56);
  else
    v14 = 0;
  v15 = v14;
  objc_msgSend(v12, "setObject:forKey:", v13, v15);

  if (v6)
    goto LABEL_8;
LABEL_10:

}

void sub_18A1E6EBC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;
  void *v11;
  void *v12;

  _Unwind_Resume(a1);
}

id sbDefaults_getURL(void *a1, const char *a2)
{
  id v3;
  _QWORD *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;

  v3 = a1;
  -[BSAbstractDefaultDomain _propertyFromSelector:]((uint64_t)v3, a2);
  v4 = (_QWORD *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_store");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
    v6 = (void *)v4[7];
  else
    v6 = 0;
  v7 = v6;
  objc_msgSend(v5, "URLForKey:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

void sub_18A1E6FB0(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  _Unwind_Resume(a1);
}

void sbDefaults_setURL(void *a1, const char *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  id v9;
  int v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  id v17;

  v5 = a1;
  v6 = a3;
  v17 = v5;
  -[BSAbstractDefaultDomain _propertyFromSelector:]((uint64_t)v17, a2);
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (!v6)
  {
    objc_msgSend(v17, "_store");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
      v16 = *(void **)(v8 + 56);
    else
      v16 = 0;
    v15 = v16;
    objc_msgSend(v13, "removeObjectForKey:", v15);
LABEL_12:

    if (!v8)
      goto LABEL_15;
    goto LABEL_13;
  }
  if (!v7
    || (*(_BYTE *)(v7 + 72) & 4) == 0
    || (v9 = *(id *)(v7 + 64), v10 = objc_msgSend(v6, "isEqual:", v9), v9, !v10))
  {
    objc_msgSend(v17, "_store");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
      v14 = *(void **)(v8 + 56);
    else
      v14 = 0;
    v15 = v14;
    objc_msgSend(v13, "setURL:forKey:", v6, v15);
    goto LABEL_12;
  }
  objc_msgSend(v17, "_store");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = *(id *)(v8 + 56);
  objc_msgSend(v11, "removeObjectForKey:", v12);

LABEL_13:
  if ((*(_BYTE *)(v8 + 72) & 2) != 0)
    objc_msgSend(v17, "synchronizeDefaults");
LABEL_15:

}

void sub_18A1E7140(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;

  v14 = v13;

  _Unwind_Resume(a1);
}

dispatch_queue_t BSDispatchQueueCreateWithAttributes(const char *a1, void *a2)
{
  return BSDispatchQueueCreateWithQualityOfService(a1, a2, QOS_CLASS_UNSPECIFIED, 0);
}

uint64_t BSDispatchQueueCreateSerialWithFixedPriority(void *a1, uint64_t a2)
{
  const char *v3;
  void *v4;
  uint64_t v5;

  v3 = (const char *)objc_msgSend(objc_retainAutorelease(a1), "UTF8String");
  dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  _BSDispatchQueueCreateWithPriority(v3, v4, a2);
  v5 = objc_claimAutoreleasedReturnValue();

  return v5;
}

void sub_18A1E7200(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

dispatch_queue_t _BSDispatchQueueCreateWithPriority(const char *a1, void *a2, uint64_t a3)
{
  id v5;
  id v6;
  NSObject *inactive;
  NSObject *v8;
  dispatch_queue_t v9;

  v5 = a2;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("com.apple.baseboard.fixpri-%d"), a3);
  v6 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  inactive = dispatch_workloop_create_inactive((const char *)objc_msgSend(v6, "UTF8String"));
  dispatch_workloop_set_scheduler_priority();
  dispatch_activate(inactive);
  _BSDispatchQueueAttributesForAttributes(v5, QOS_CLASS_UNSPECIFIED, 0);
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = dispatch_queue_create_with_target_V2(a1, v8, inactive);

  return v9;
}

void sub_18A1E72D4(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

uint64_t BSDispatchQueueCreateWithFixedPriority(const char *a1, void *a2, uint64_t a3)
{
  _BSDispatchQueueCreateWithPriority(a1, a2, a3);
  return objc_claimAutoreleasedReturnValue();
}

uint64_t BSDispatchQueueCreateWithFixedPriorityAndSchedulingPolicy(const char *a1, void *a2, uint64_t a3)
{
  _BSDispatchQueueCreateWithPriority(a1, a2, a3);
  return objc_claimAutoreleasedReturnValue();
}

NSObject *BSDispatchQueueName(NSObject *label)
{
  if (label)
  {
    label = dispatch_queue_get_label(label);
    if (label)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", label);
      label = objc_claimAutoreleasedReturnValue();
    }
  }
  return label;
}

dispatch_block_t BSDispatchBlockCreateWithCurrentQualityOfService(int a1, void *a2)
{
  id v3;
  dispatch_qos_class_t v4;
  int v5;
  dispatch_block_t v6;

  v3 = a2;
  v4 = BSPthreadCurrentEffectiveQualityOfService();
  if (a1 <= -15)
    v5 = -15;
  else
    v5 = a1;
  v6 = dispatch_block_create_with_qos_class(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, v4, v5 & (v5 >> 31), v3);

  return v6;
}

void sub_18A1E7474(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

dispatch_block_t BSDispatchBlockCreateWithQualityOfService(dispatch_qos_class_t qos_class, int a2, dispatch_block_t block)
{
  int v3;

  if (a2 <= -15)
    v3 = -15;
  else
    v3 = a2;
  return dispatch_block_create_with_qos_class(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, qos_class, v3 & (v3 >> 31), block);
}

dispatch_time_t BSDispatchTimeForIntervalFromNow(double a1)
{
  int64_t v1;

  if (a1 >= 9223372040.0)
    return -1;
  if (a1 <= -9223372040.0)
    v1 = 0x8000000000000000;
  else
    v1 = (uint64_t)(a1 * 1000000000.0);
  return dispatch_time(0, v1);
}

dispatch_time_t BSDispatchTimeWithInterval(dispatch_time_t a1, double a2)
{
  int64_t v2;

  if (a2 >= 9223372040.0)
    return -1;
  if (a2 <= -9223372040.0)
    v2 = 0x8000000000000000;
  else
    v2 = (uint64_t)(a2 * 1000000000.0);
  return dispatch_time(a1, v2);
}

uint64_t BSDispatchTimeDeltaForInterval(double a1)
{
  if (a1 >= 9223372040.0)
    return 0x7FFFFFFFFFFFFFFFLL;
  if (a1 <= -9223372040.0)
    return 0x8000000000000000;
  return (uint64_t)(a1 * 1000000000.0);
}

void sub_18A1E75FC(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  _Unwind_Resume(a1);
}

void sub_18A1E7694(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  v4 = v3;

  _Unwind_Resume(a1);
}

BOOL BSIntegerMapContainsObjectForKey(void *a1, uint64_t a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = a1;
  if (!v3)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "BOOL BSIntegerMapContainsObjectForKey(BSIntegerMap *__strong _Nonnull, NSInteger)");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v6, CFSTR("BSIntegerMap.m"), 166, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("map"));

    if (a2)
      goto LABEL_3;
LABEL_5:
    v4 = (void *)*((_QWORD *)v3 + 2);
    goto LABEL_6;
  }
  if (!a2)
    goto LABEL_5;
LABEL_3:
  objc_msgSend(*((id *)v3 + 1), "objectForKey:", a2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_6:
  return v4 != 0;
}

void sub_18A1E7ED4(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

id BSIntegerMapDescription(uint64_t a1)
{
  +[BSDescriptionStream descriptionForRootObject:](BSDescriptionStream, "descriptionForRootObject:", a1);
  return (id)objc_claimAutoreleasedReturnValue();
}

BOOL BSIntegerMapIsEmpty(void *a1)
{
  return BSIntegerMapCount(a1) == 0;
}

BOOL BSEqualAuditTokens(_QWORD *a1, _QWORD *a2)
{
  return *a1 == *a2 && a1[1] == a2[1] && a1[2] == a2[2] && a1[3] == a2[3];
}

uint64_t BSProcessHasSandbox()
{
  if (qword_1ECD398D8 != -1)
    dispatch_once(&qword_1ECD398D8, &__block_literal_global_13);
  return _MergedGlobals_15;
}

BOOL BSSandboxCanAccessMachService(void *a1)
{
  id v1;
  _BOOL8 v2;

  v1 = a1;
  if (v1)
  {
    getpid();
    objc_msgSend(objc_retainAutorelease(v1), "UTF8String");
    v2 = sandbox_check() == 0;
  }
  else
  {
    v2 = 0;
  }

  return v2;
}

void sub_18A1E80A0(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

uint64_t BSASIDForAuditToken(_OWORD *a1)
{
  __int128 v2;
  audit_token_t v4;

  if (!BSAuditTokenIsValid((uint64_t)a1))
    return 4294967294;
  v2 = a1[1];
  *(_OWORD *)v4.val = *a1;
  *(_OWORD *)&v4.val[4] = v2;
  return audit_token_to_asid(&v4);
}

uint64_t BSEUIDForAuditToken(_OWORD *a1)
{
  __int128 v2;
  audit_token_t v4;

  if (!BSAuditTokenIsValid((uint64_t)a1))
    return 0xFFFFFFFFLL;
  v2 = a1[1];
  *(_OWORD *)v4.val = *a1;
  *(_OWORD *)&v4.val[4] = v2;
  return audit_token_to_euid(&v4);
}

uint64_t BSEGIDForAuditToken(_OWORD *a1)
{
  __int128 v2;
  audit_token_t v4;

  if (!BSAuditTokenIsValid((uint64_t)a1))
    return 0xFFFFFFFFLL;
  v2 = a1[1];
  *(_OWORD *)v4.val = *a1;
  *(_OWORD *)&v4.val[4] = v2;
  return audit_token_to_egid(&v4);
}

__n128 BSAuditTokenFromMachMessage(uint64_t a1, __n128 *a2)
{
  __n128 result;
  uint64_t v3;
  __n128 v4;
  __n128 v5;

  result.n128_u64[0] = -1;
  result.n128_u64[1] = -1;
  v4 = result;
  v5 = result;
  v3 = ((*(unsigned int *)(a1 + 4) + 3) & 0x1FFFFFFFCLL) + a1;
  if (*(_DWORD *)v3 || *(_DWORD *)(v3 + 4) < 0x20u)
  {
    if (!a2)
      return result;
    goto LABEL_6;
  }
  result = *(__n128 *)(v3 + 20);
  v4 = result;
  v5 = *(__n128 *)(v3 + 36);
  if (a2)
  {
LABEL_6:
    result = v4;
    *a2 = v4;
    a2[1] = v5;
  }
  return result;
}

id BSAuditTokenTaskCopyEntitlementValue(_OWORD *a1, void *a2)
{
  id v3;
  __int128 v4;
  void *v5;
  void *v6;
  _OWORD v8[2];

  v3 = a2;
  v4 = a1[1];
  v8[0] = *a1;
  v8[1] = v4;
  +[BSSecTask secTaskForAuditToken:]((uint64_t)BSSecTask, v8);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[BSSecTask valueForEntitlement:]((uint64_t)v5, v3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

void sub_18A1E8284(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

uint64_t BSSecTaskHasEntitlement(__SecTask *a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  CFTypeID v6;
  uint64_t v7;
  NSObject *v8;
  uint8_t v10[16];

  v3 = a2;
  if (a1)
  {
    BSSecTaskCopyEntitlementValue(a1, v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v4;
    if (v4 && (v6 = CFGetTypeID(v4), v6 == CFBooleanGetTypeID()))
      v7 = objc_msgSend(v5, "BOOLValue");
    else
      v7 = 0;

  }
  else
  {
    BSLogCommon();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v10 = 0;
      _os_log_error_impl(&dword_18A184000, v8, OS_LOG_TYPE_ERROR, "Unable to get entitlement for an invalid secTask", v10, 2u);
    }

    v7 = 0;
  }

  return v7;
}

void sub_18A1E8378(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

id BSBundlePathForPID(uint64_t a1)
{
  void *v2;
  void *v3;

  if (getpid() == (_DWORD)a1)
  {
    objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "bundlePath");
  }
  else
  {
    BSExecutablePathForPID(a1);
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    BSBundlePathForExecutablePath(v2);
  }
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

void sub_18A1E8400(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

id BSBundlePathForAuditToken(__int128 *a1)
{
  uint64_t v2;
  __int128 v3;
  void *v4;
  __int128 v5;
  void *v6;
  __int128 v8;
  __int128 v9;

  v2 = BSGetVersionedPID();
  v3 = a1[1];
  v8 = *a1;
  v9 = v3;
  if (v2 == BSVersionedPIDForAuditToken(&v8))
  {
    objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "bundlePath");
  }
  else
  {
    v5 = a1[1];
    v8 = *a1;
    v9 = v5;
    BSExecutablePathForAuditToken();
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    BSBundlePathForExecutablePath(v4);
  }
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

void sub_18A1E84A4(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

id BSBundleIDForXPCConnection(void *a1)
{
  _BSBundleIDForXPCConnectionAndIKnowWhatImDoingISwear(a1);
  return (id)objc_claimAutoreleasedReturnValue();
}

os_unfair_lock_s *BSAuditTokenRepresentsPlatformBinary(_OWORD *a1)
{
  __int128 v1;
  os_unfair_lock_s *v2;
  os_unfair_lock_s *v3;
  _OWORD v5[2];

  v1 = a1[1];
  v5[0] = *a1;
  v5[1] = v1;
  +[BSSecTask secTaskForAuditToken:]((uint64_t)BSSecTask, v5);
  v2 = (os_unfair_lock_s *)objc_claimAutoreleasedReturnValue();
  v3 = -[BSSecTask representsPlatformBinary](v2);

  return v3;
}

void sub_18A1E8524(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

BOOL BSEqualProcessAuditTokens(__int128 *a1, __int128 *a2)
{
  __int128 v3;
  uint64_t v4;
  __int128 v5;
  uint64_t v6;
  __int128 v10;
  __int128 v11;

  v3 = a1[1];
  v10 = *a1;
  v11 = v3;
  v4 = BSVersionedPIDForAuditToken(&v10);
  v5 = a2[1];
  v10 = *a2;
  v11 = v5;
  v6 = BSVersionedPIDForAuditToken(&v10);
  return v4 != -1 && v6 != -1 && v4 == v6;
}

void sub_18A1E85F4(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_18A1E86B0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, id a12)
{
  void *v12;
  void *v13;
  void *v14;

  _Unwind_Resume(a1);
}

void sub_18A1E8790(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_18A1E8830(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_18A1E89D8(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_18A1E8AFC(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_18A1E9160(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;
  void *v11;

  _Unwind_Resume(a1);
}

void sub_18A1E928C(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_18A1E92E0(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_18A1E9A2C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, void *a11)
{
  void *v11;
  void *v12;

  _Unwind_Resume(a1);
}

void sub_18A1E9DA0(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  objc_sync_exit(v3);
  _Unwind_Resume(a1);
}

void sub_18A1E9F54(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  objc_sync_exit(v2);
  _Unwind_Resume(a1);
}

void sub_18A1EA0F8(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  objc_sync_exit(v3);
  _Unwind_Resume(a1);
}

void sub_18A1EA228(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_18A1EA350(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_18A1EA414(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;

  v14 = v13;

  _Unwind_Resume(a1);
}

void sub_18A1EA534(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  _Unwind_Resume(a1);
}

void sub_18A1EA5FC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;

  v14 = v13;

  _Unwind_Resume(a1);
}

void sub_18A1EA6CC(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_18A1EA754(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_18A1EA888(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  _Unwind_Resume(a1);
}

void sub_18A1EA9C0(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  _Unwind_Resume(a1);
}

void sub_18A1EAA5C(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_18A1EAB6C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_18A1EABF8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_18A1EAC88(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_18A1EAD54(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_18A1EAE30(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_18A1EAEE8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void sub_18A1EAF48(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_18A1EAFA0(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_18A1EB05C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_18A1EB154(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_18A1EB360(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_18A1EB51C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, id a11)
{
  void *v11;

  _Unwind_Resume(a1);
}

void sub_18A1EB608(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_18A1EB734(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  void *v7;
  void *v8;
  va_list va;

  va_start(va, a7);
  v8 = v7;

  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_18A1EB898(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_18A1EB9C0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  void *v7;
  void *v8;
  va_list va;

  va_start(va, a7);
  v8 = v7;

  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_18A1EBBC8(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_18A1EBCAC(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_18A1EBD08(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_18A1EBE68(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_18A1EC038(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_18A1EC2B4(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_18A1EC32C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void _BSPowerChanged(void *a1, uint64_t a2, int a3, intptr_t a4)
{
  uint64_t v6;
  void *v7;
  unint64_t v8;
  _DWORD *v9;
  io_connect_t v10;
  io_connect_t *v11;
  io_connect_t *v12;
  _QWORD v13[4];
  id v14;
  _QWORD v15[4];
  id v16;
  _QWORD v17[4];
  io_connect_t *v18;
  _QWORD v19[4];
  id v20;
  _QWORD v21[4];
  id v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t *v25;
  uint64_t v26;
  char v27;

  objc_msgSend(a1, "object");
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = (void *)v6;
  if (v6)
  {
    BSDispatchQueueAssert(*(void **)(v6 + 32));
    HIDWORD(v8) = a3;
    LODWORD(v8) = a3 + 536870288;
    switch((v8 >> 4))
    {
      case 0u:
        v24 = 0;
        v25 = &v24;
        v26 = 0x2020000000;
        v27 = 1;
        v21[0] = MEMORY[0x1E0C809B0];
        v21[1] = 3221225472;
        v21[2] = ___BSPowerChanged_block_invoke;
        v21[3] = &unk_1E1EBF480;
        v9 = v7;
        v22 = v9;
        v23 = &v24;
        _bsDispatchToObservers(v9, v21);
        v10 = v9[14];
        if (*((_BYTE *)v25 + 24))
          IOAllowPowerChange(v10, a4);
        else
          IOCancelPowerChange(v10, a4);

        _Block_object_dispose(&v24, 8);
        break;
      case 1u:
        v17[0] = MEMORY[0x1E0C809B0];
        v17[1] = 3221225472;
        v17[2] = ___BSPowerChanged_block_invoke_36;
        v17[3] = &unk_1E1EBF4A8;
        v11 = v7;
        v18 = v11;
        _bsDispatchToObservers(v11, v17);
        IOAllowPowerChange(v11[14], a4);
        v12 = v18;
        goto LABEL_9;
      case 2u:
        v19[0] = MEMORY[0x1E0C809B0];
        v19[1] = 3221225472;
        v19[2] = ___BSPowerChanged_block_invoke_33;
        v19[3] = &unk_1E1EBF4A8;
        v20 = v7;
        _bsDispatchToObservers(v20, v19);
        v12 = (io_connect_t *)v20;
        goto LABEL_9;
      case 9u:
        v13[0] = MEMORY[0x1E0C809B0];
        v13[1] = 3221225472;
        v13[2] = ___BSPowerChanged_block_invoke_42;
        v13[3] = &unk_1E1EBF4A8;
        v14 = v7;
        _bsDispatchToObservers(v14, v13);
        v12 = (io_connect_t *)v14;
        goto LABEL_9;
      case 0xBu:
        v15[0] = MEMORY[0x1E0C809B0];
        v15[1] = 3221225472;
        v15[2] = ___BSPowerChanged_block_invoke_39;
        v15[3] = &unk_1E1EBF4A8;
        v16 = v7;
        _bsDispatchToObservers(v16, v15);
        v12 = (io_connect_t *)v16;
LABEL_9:

        break;
      default:
        break;
    }
  }

}

void sub_18A1EC584(_Unwind_Exception *a1)
{
  void *v1;
  uint64_t v2;

  _Block_object_dispose((const void *)(v2 - 80), 8);
  _Unwind_Resume(a1);
}

void sub_18A1EC6B0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, objc_super a10)
{
  a10.super_class = (Class)BSPowerMonitor;
  -[_Unwind_Exception dealloc](&a10, sel_dealloc);
  _Unwind_Resume(a1);
}

void sub_18A1EC750(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_18A1EC7B8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void _bsDispatchToObservers(void *a1, void *a2)
{
  id v3;
  void (**v4)(id, _QWORD);
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  uint64_t v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  uint8_t buf[4];
  uint64_t v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v3 = a1;
  v4 = a2;
  if (!v4)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "void _bsDispatchToObservers(BSPowerMonitor *__strong, __strong BSPowerObserverBlock)");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "handleFailureInFunction:file:lineNumber:description:", v14, CFSTR("BSPowerMonitor.m"), 51, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("callout"));

  }
  BSDispatchQueueAssert(*((void **)v3 + 4));
  os_unfair_lock_lock((os_unfair_lock_t)v3 + 10);
  objc_msgSend(*((id *)v3 + 6), "allObjects");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  os_unfair_lock_unlock((os_unfair_lock_t)v3 + 10);
  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  v6 = v5;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v21, 16);
  if (v7)
  {
    v8 = *(_QWORD *)v16;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v16 != v8)
          objc_enumerationMutation(v6);
        v10 = *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * i);
        BSLogPowerMonitor();
        v11 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412290;
          v20 = v10;
          _os_log_impl(&dword_18A184000, v11, OS_LOG_TYPE_INFO, "Preparing to messaging power observer: %@", buf, 0xCu);
        }

        v12 = (void *)MEMORY[0x18D769AE0]();
        v4[2](v4, v10);
        objc_autoreleasePoolPop(v12);
      }
      v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v21, 16);
    }
    while (v7);
  }

}

void sub_18A1ECA30(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  _Unwind_Resume(a1);
}

void sub_18A1ECB64(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_18A1ECC50(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_18A1ECD3C(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_18A1ECE28(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_18A1ECF14(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_18A1ECFEC(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_18A1ED2E8(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void _BSHandleSignificantTimeChange()
{
  id v0;

  +[BSDateTimeCache sharedInstance](BSDateTimeCache, "sharedInstance");
  v0 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "_resetAndConfigure");

}

void sub_18A1ED344(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_18A1ED3D0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, objc_super a9)
{
  void *v9;
  void *v10;

  v10 = v9;

  a9.super_class = (Class)BSDateTimeCache;
  -[_Unwind_Exception dealloc](&a9, sel_dealloc);
  _Unwind_Resume(a1);
}

void sub_18A1ED874(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_18A1EDA8C(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_18A1EDBF4(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  v3 = v2;

  _Unwind_Resume(a1);
}

void _BSHandleSignificantTimeChange_0(uint64_t a1, void *a2)
{
  _QWORD *v2;

  v2 = a2;
  if (v2 && v2[3])
    objc_msgSend(v2, "fireAndSchedule");

}

void sub_18A1EDC64(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_18A1EDD24(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, objc_super a9)
{
  void *v9;
  void *v10;

  v10 = v9;

  a9.super_class = (Class)BSRelativeDateTimer;
  -[_Unwind_Exception dealloc](&a9, sel_dealloc);
  _Unwind_Resume(a1);
}

void sub_18A1EDDCC(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_18A1EDE80(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_18A1EE120(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{
  void *v10;
  void *v11;

  _Unwind_Resume(a1);
}

void sub_18A1EE318(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_18A1EE420(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_18A1EE6CC(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_18A1EE7A4(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 24));
  _Unwind_Resume(a1);
}

void sub_18A1EE808(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_18A1EE91C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_18A1EE9D0(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_18A1EEA40(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_18A1EEAA4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void sub_18A1EEBC8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;
  void *v11;
  void *v12;

  _Unwind_Resume(a1);
}

void sub_18A1EECC0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, void *a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);

  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_18A1EEE0C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id _BSXPCAuditTokensDescription()
{
  return (id)_bsxpc_auditTokens_desc(0);
}

uint64_t _bsxpc_auditTokens_desc(char a1)
{
  void *v2;
  NSArray *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *context;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  context = (void *)MEMORY[0x18D769AE0]();
  if ((a1 & 1) == 0)
    os_unfair_lock_lock((os_unfair_lock_t)&_MergedGlobals_21);
  v2 = (void *)objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithFormat:", CFSTR("invalid=%@\ntokens={"), qword_1ECD39948);
  v3 = -[NSArray sortedArrayUsingComparator:](NSAllMapTableKeys((NSMapTable *)qword_1ECD39950), "sortedArrayUsingComparator:", &__block_literal_global_19);
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v4 = -[NSArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v12;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v12 != v6)
          objc_enumerationMutation(v3);
        objc_msgSend(v2, "appendFormat:", CFSTR("\n\t%10i -> %5i : %@"), objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * v7), "pid"), NSMapGet((NSMapTable *)qword_1ECD39950, *(const void **)(*((_QWORD *)&v11 + 1) + 8 * v7)), *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * v7), context);
        ++v7;
      }
      while (v5 != v7);
      v5 = -[NSArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v5);
  }
  objc_msgSend(v2, "appendString:", CFSTR("\n}"));
  if ((a1 & 1) == 0)
    os_unfair_lock_unlock((os_unfair_lock_t)&_MergedGlobals_21);
  v8 = objc_msgSend(v2, "copy");
  objc_autoreleasePoolPop(context);
  return v8;
}

void BSStoreTokenToVar(void *a1, void **a2)
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  int v8;
  uint64_t v9;
  __int16 v10;
  const __CFString *v11;
  __int16 v12;
  int v13;
  __int16 v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  if (!a1)
  {
    v6 = (void *)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("token must not be nil"));
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      v8 = 138544130;
      v9 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "void BSStoreTokenToVar(BSAuditToken *, BSAuditToken **)");
      v10 = 2114;
      v11 = CFSTR("BSAuditTokenCaching.m");
      v12 = 1024;
      v13 = 143;
      v14 = 2114;
      v15 = v6;
      _os_log_error_impl(&dword_18A184000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ (%{public}@:%i) : %{public}@", (uint8_t *)&v8, 0x26u);
    }
    qword_1EDF5BAE8 = objc_msgSend(v6, "UTF8String");
    __break(0);
    JUMPOUT(0x18A1EF2DCLL);
  }
  if (!a2)
  {
    v7 = (void *)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("var must not be nil"));
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      v8 = 138544130;
      v9 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "void BSStoreTokenToVar(BSAuditToken *, BSAuditToken **)");
      v10 = 2114;
      v11 = CFSTR("BSAuditTokenCaching.m");
      v12 = 1024;
      v13 = 144;
      v14 = 2114;
      v15 = v7;
      _os_log_error_impl(&dword_18A184000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ (%{public}@:%i) : %{public}@", (uint8_t *)&v8, 0x26u);
    }
    qword_1EDF5BAE8 = objc_msgSend(v7, "UTF8String");
    __break(0);
    JUMPOUT(0x18A1EF394);
  }
  if (qword_1ECD39958 != -1)
    dispatch_once_f(&qword_1ECD39958, 0, (dispatch_function_t)_bsxpc_auditToken_init);
  v4 = *a2;
  if (objc_msgSend(a1, "isInvalid"))
  {
    if (v4 != (void *)qword_1ECD39948)
    {
      v5 = (id)qword_1ECD39948;
LABEL_13:
      _BSStoreNewRetainedTokenToVar(v5, a2);
    }
  }
  else if (v4 != a1 && (!v4 || (objc_msgSend(a1, "isEqual:", v4) & 1) == 0))
  {
    v5 = a1;
    goto LABEL_13;
  }
}

uint64_t ___bsxpc_auditTokens_desc_block_invoke(uint64_t a1, void *a2, void *a3)
{
  int v5;
  uint64_t v6;
  _BOOL4 v7;
  int v8;
  BOOL v9;
  uint64_t v10;

  v5 = objc_msgSend(a2, "pid");
  if (v5 != objc_msgSend(a3, "pid"))
  {
    v8 = objc_msgSend(a2, "pid");
    v9 = v8 < (int)objc_msgSend(a3, "pid");
    goto LABEL_6;
  }
  v6 = objc_msgSend(a2, "versionedPID");
  if (v6 != objc_msgSend(a3, "versionedPID"))
  {
    v10 = objc_msgSend(a2, "versionedPID");
    v9 = v10 < objc_msgSend(a3, "versionedPID");
LABEL_6:
    v7 = v9;
    goto LABEL_9;
  }
  v7 = a2 < a3;
LABEL_9:
  if (v7)
    return -1;
  else
    return 1;
}

void sub_18A1EF794(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_18A1EFB50(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, void *a20)
{
  void *v20;
  void *v21;
  void *v22;

  _Unwind_Resume(a1);
}

void sub_18A1EFC0C(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_18A1EFDE8(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_18A1EFE88(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_18A1EFF28(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_18A1EFFC8(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_18A1F0068(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_18A1F00C4(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_18A1F0250(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_18A1F0478(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_18A1F05DC(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_18A1F07D8(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_18A1F0888(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_18A1F0944(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void __getCAMediaTimingFunctionClass_block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;

  QuartzCoreLibrary();
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = objc_getClass("CAMediaTimingFunction");
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    getCAMediaTimingFunctionClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Class getCAMediaTimingFunctionClass(void)_block_invoke");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, CFSTR("BSAnimationSettings.m"), 21, CFSTR("Unable to find class %s"), "CAMediaTimingFunction");

    __break(1u);
  }
}

void sub_18A1F0C48(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void *QuartzCoreLibrary()
{
  void *v0;
  void *v2;
  void *v3;

  if (!QuartzCoreLibraryCore_frameworkLibrary)
    QuartzCoreLibraryCore_frameworkLibrary = _sl_dlopen();
  v0 = (void *)QuartzCoreLibraryCore_frameworkLibrary;
  if (!QuartzCoreLibraryCore_frameworkLibrary)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v0 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "void *QuartzCoreLibrary(void)");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v3, CFSTR("BSAnimationSettings.m"), 20, CFSTR("%s"), 0);

    __break(1u);
    free(v2);
  }
  return v0;
}

void sub_18A1F0D6C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *a10, _Unwind_Exception *exception_object)
{
  void *v11;

  _Unwind_Resume(a1);
}

void __getCASpringAnimationClass_block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;

  QuartzCoreLibrary();
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = objc_getClass("CASpringAnimation");
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    getCASpringAnimationClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Class getCASpringAnimationClass(void)_block_invoke");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, CFSTR("BSAnimationSettings.m"), 22, CFSTR("Unable to find class %s"), "CASpringAnimation");

    __break(1u);
  }
}

void sub_18A1F0E54(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void __getCATransactionClass_block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;

  QuartzCoreLibrary();
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = objc_getClass("CATransaction");
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    getCATransactionClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Class getCATransactionClass(void)_block_invoke");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, CFSTR("BSAnimationSettings.m"), 23, CFSTR("Unable to find class %s"), "CATransaction");

    __break(1u);
  }
}

void sub_18A1F0F34(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

CFRunLoopSourceRef BSCreateMIGServerSource(uint64_t a1, int a2, CFIndex a3)
{
  return BSCreateMIGServerSourceWithContext(a1, a2, a3, 0);
}

CFRunLoopSourceRef BSCreateMIGServerSourceWithContext(uint64_t a1, int a2, CFIndex a3, uint64_t a4)
{
  _QWORD *v8;
  CFRunLoopSourceRef v9;
  CFRunLoopSourceContext context;

  pthread_once(&__BSMIGServerCalloutContextKeyOnce, (void (*)(void))makeCalloutContextKey);
  v8 = malloc_type_malloc(0x18uLL, 0x10A0040FC6C5850uLL);
  *(_DWORD *)v8 = a2;
  v8[1] = a1;
  v8[2] = a4;
  context.version = 1;
  context.info = v8;
  context.retain = 0;
  context.release = (void (__cdecl *)(const void *))MEMORY[0x1E0C834A8];
  context.copyDescription = (CFStringRef (__cdecl *)(const void *))migHelperCopyDescription;
  context.equal = (Boolean (__cdecl *)(const void *, const void *))migHelperEqual;
  context.hash = (CFHashCode (__cdecl *)(const void *))migHelperHash;
  context.schedule = (void (__cdecl *)(void *, CFRunLoopRef, CFRunLoopMode))migHelperGetPort;
  context.cancel = (void (__cdecl *)(void *, CFRunLoopRef, CFRunLoopMode))migHelperRecievePortCallout;
  v9 = CFRunLoopSourceCreate(0, a3, &context);
  if (!v9)
    free(v8);
  return v9;
}

uint64_t makeCalloutContextKey()
{
  return pthread_key_create((pthread_key_t *)&__BSMIGServerCalloutContextKey, 0);
}

CFStringRef migHelperCopyDescription(unsigned int *a1)
{
  return CFStringCreateWithFormat(0, 0, CFSTR("<CFRunLoopSource MIG Server> {port = %u, subsystem = %p, context = %p}"), *a1, *((_QWORD *)a1 + 1), *((_QWORD *)a1 + 2));
}

BOOL migHelperEqual(_DWORD *a1, _DWORD *a2)
{
  return *a1 == *a2;
}

uint64_t migHelperHash(unsigned int *a1)
{
  return *a1;
}

uint64_t migHelperGetPort(unsigned int *a1)
{
  return *a1;
}

uint64_t migHelperRecievePortCallout(mach_msg_header_t *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v6;
  mach_msg_id_t msgh_id;
  int v8;
  BOOL v9;
  int v10;
  void (*v11)(mach_msg_header_t *, mach_msg_header_t *);
  char v12;
  size_t v13;
  mach_msg_header_t *v14;
  mach_msg_header_t *v15;
  mach_port_t msgh_remote_port;
  const void *v17;
  mach_msg_bits_t msgh_bits;
  mach_port_t v19;
  mach_msg_option_t v20;
  mach_msg_return_t v21;
  FILE *v23;
  char *v24;

  v6 = *(_QWORD *)(a4 + 8);
  msgh_id = a1->msgh_id;
  v8 = *(_DWORD *)(v6 + 8);
  v9 = __OFSUB__(msgh_id, v8);
  v10 = msgh_id - v8;
  if (v10 < 0 != v9 || msgh_id >= *(_DWORD *)(v6 + 12))
  {
    v11 = 0;
  }
  else
  {
    v11 = *(void (**)(mach_msg_header_t *, mach_msg_header_t *))(v6 + 40 * v10 + 40);
    if (v11)
    {
      v12 = 0;
      v13 = *(unsigned int *)(v6 + 40 * v10 + 64);
      goto LABEL_7;
    }
  }
  v12 = 1;
  v13 = 36;
LABEL_7:
  v14 = (mach_msg_header_t *)malloc_type_malloc(v13, 0xE5F8CC19uLL);
  if (v14)
  {
    v15 = v14;
    msgh_remote_port = a1->msgh_remote_port;
    v14->msgh_bits = a1->msgh_bits & 0x1F;
    v14->msgh_size = 36;
    *(_QWORD *)&v14->msgh_remote_port = msgh_remote_port;
    v14->msgh_id = a1->msgh_id + 100;
    if ((v12 & 1) != 0)
    {
      *(_QWORD *)&v14[1].msgh_bits = *MEMORY[0x1E0C804E8];
      v14[1].msgh_remote_port = -303;
    }
    else
    {
      v17 = *(const void **)(a4 + 16);
      if (v17)
      {
        pthread_setspecific(__BSMIGServerCalloutContextKey, v17);
        v11(a1, v15);
        pthread_setspecific(__BSMIGServerCalloutContextKey, 0);
      }
      else
      {
        v11(a1, v14);
      }
    }
    msgh_bits = v15->msgh_bits;
    if ((v15->msgh_bits & 0x80000000) == 0)
    {
      v19 = v15[1].msgh_remote_port;
      if (v19 == -305)
      {
LABEL_31:
        free(v15);
        return 0;
      }
      if (v19 && (a1->msgh_bits & 0x80000000) != 0)
      {
        a1->msgh_remote_port = 0;
        mach_msg_destroy(a1);
        msgh_bits = v15->msgh_bits;
      }
    }
    if (v15->msgh_remote_port)
    {
      if ((msgh_bits & 0x1F) == 0x12)
        v20 = 1;
      else
        v20 = 17;
      v21 = mach_msg(v15, v20, v15->msgh_size, 0, 0, 0, 0);
      if ((v21 - 268435459) >= 2 && v21 != 0)
      {
        v23 = (FILE *)*MEMORY[0x1E0C80C10];
        v24 = mach_error_string(v21);
        fprintf(v23, "<CFRunLoopSource MIG Server> mach_msg send error in reply: %s\n", v24);
        goto LABEL_31;
      }
      if ((v21 - 268435459) > 1)
        goto LABEL_31;
      msgh_bits = v15->msgh_bits;
    }
    if ((msgh_bits & 0x80000000) != 0)
      mach_msg_destroy(v15);
    goto LABEL_31;
  }
  return 0;
}

uint64_t BSGetMachPortForMIGServerSource(__CFRunLoopSource *a1)
{
  CFRunLoopSourceContext context;

  memset(&context.info, 0, 64);
  context.version = 1;
  CFRunLoopSourceGetContext(a1, &context);
  return *(unsigned int *)context.info;
}

void *BSGetContextForCalloutCurrentMIGServerSource()
{
  return pthread_getspecific(__BSMIGServerCalloutContextKey);
}

void sub_18A1F1400(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_18A1F14E4(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_18A1F15BC(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

const __CFString *NSStringFromBSProcessExceptionCode(uint64_t a1)
{
  const __CFString *v1;
  const __CFString *v2;
  const __CFString *v3;
  const __CFString *v4;
  const __CFString *v5;
  const __CFString *v6;
  const __CFString *v7;
  const __CFString *v8;

  v1 = CFSTR("UserInitiatedQuit");
  if (a1 != 3735943697)
    v1 = 0;
  if (a1 == 3735883980)
    v2 = CFSTR("ResourceExclusion");
  else
    v2 = v1;
  v3 = CFSTR("ThermalPressure");
  if (a1 != 3221229823)
    v3 = 0;
  if (a1 == 2343432205)
    v4 = CFSTR("WatchdogViolation");
  else
    v4 = v3;
  if (a1 <= 3735883979)
    v5 = v4;
  else
    v5 = v2;
  v6 = CFSTR("(none)");
  v7 = CFSTR("BlownAnimationFence");
  if (a1 != 1307235759)
    v7 = 0;
  if (a1 == 732775916)
    v8 = CFSTR("SecurityViolation");
  else
    v8 = v7;
  if (a1)
    v6 = v8;
  if (a1 <= 2343432204)
    return v6;
  else
    return v5;
}

id BSSystemSharedResourcesDirectoryForCurrentProcess()
{
  if (qword_1ECD39988 != -1)
    dispatch_once(&qword_1ECD39988, &__block_literal_global_4_0);
  return (id)qword_1ECD39980;
}

id BSSystemSharedDirectoryForCurrentProcess()
{
  if (qword_1ECD39978 != -1)
    dispatch_once(&qword_1ECD39978, &__block_literal_global_2_0);
  return (id)qword_1ECD39970;
}

void sub_18A1F1768(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

id BSSystemSharedDirectoryForIdentifier(void *a1)
{
  id v1;
  void *v2;
  void *v3;
  uint64_t v4;
  NSObject *v5;
  void *v7;
  uint8_t buf[4];
  void *v9;
  __int16 v10;
  uint64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v1 = objc_retainAutorelease(a1);
  objc_msgSend(v1, "UTF8String");
  v2 = (void *)container_system_path_for_identifier();
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v2);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    free(v2);
  }
  else
  {
    v4 = 1;
    BSLogCommon();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      v7 = v1;
      if (!v1)
      {
        objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
        v4 = objc_claimAutoreleasedReturnValue();
        objc_msgSend((id)v4, "bundleIdentifier");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
      }
      *(_DWORD *)buf = 138543618;
      v9 = v7;
      v10 = 2048;
      v11 = 1;
      _os_log_error_impl(&dword_18A184000, v5, OS_LOG_TYPE_ERROR, "Error getting shared system container for bundleID: %{public}@: %llu", buf, 0x16u);
      if (!v1)
      {

      }
    }

    v3 = 0;
  }

  return v3;
}

void sub_18A1F1904(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_18A1F197C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

id BSSystemSharedResourcesDirectoryForIdentifier(void *a1)
{
  void *v1;
  void *v2;

  BSSystemSharedDirectoryForIdentifier(a1);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "stringByAppendingPathComponent:", CFSTR("Library"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

void sub_18A1F19D0(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

id BSPathForSystemDirectory(NSSearchPathDirectory a1)
{
  return _BSSearchPathForDirectoryInDomain(a1, 8uLL);
}

id _BSSearchPathForDirectoryInDomain(NSSearchPathDirectory a1, NSSearchPathDomainMask domainMask)
{
  char v2;
  uint8x8_t v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;

  v2 = domainMask;
  v3 = (uint8x8_t)vcnt_s8((int8x8_t)domainMask);
  v3.i16[0] = vaddlv_u8(v3);
  if (v3.u32[0] == 1)
  {
    NSSearchPathForDirectoriesInDomains(a1, domainMask, 1);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "firstObject");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5)
    {
      if ((v2 & 1) != 0)
        BSCurrentUserDirectory();
      else
        BSSystemRootDirectory();
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v5, "hasPrefix:", v7) & 1) != 0)
      {
        v6 = v5;
      }
      else
      {
        objc_msgSend(v7, "stringByAppendingPathComponent:", v5);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "stringByStandardizingPath");
        v6 = (id)objc_claimAutoreleasedReturnValue();

      }
    }
    else
    {
      v6 = 0;
    }

  }
  else
  {
    v6 = 0;
  }
  return v6;
}

void sub_18A1F1AC4(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

id BSPathForCurrentUserDirectory(NSSearchPathDirectory a1)
{
  return _BSSearchPathForDirectoryInDomain(a1, 1uLL);
}

uint64_t BSIsSymbolicLinkAtPath(void *a1)
{
  id v1;
  BOOL v2;
  uint64_t v3;
  stat v5;

  memset(&v5, 0, sizeof(v5));
  v1 = objc_retainAutorelease(a1);
  if (lstat((const char *)objc_msgSend(v1, "fileSystemRepresentation", 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
                         0,
                         0),
         &v5))
  {
    v2 = 0;
  }
  else
  {
    v2 = (v5.st_mode & 0xF000) == 40960;
  }
  v3 = v2;

  return v3;
}

void sub_18A1F1B68(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

double BSModificationDateForPath(void *a1)
{
  id v1;
  double v2;
  stat v4;

  memset(&v4, 0, sizeof(v4));
  v1 = objc_retainAutorelease(a1);
  v2 = 0.0;
  if (!stat((const char *)objc_msgSend(v1, "fileSystemRepresentation", 0, 0, 0, 0, 0, 0), &v4))
    v2 = (double)v4.st_mtimespec.tv_nsec / 1000000000.0 + (double)v4.st_mtimespec.tv_sec + -978307200.0;

  return v2;
}

void sub_18A1F1C08(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

BOOL BSEnsureDirectoryExistsAtPath(void *a1)
{
  id v1;
  int v2;
  _BOOL8 v3;
  void *v4;
  id v5;
  id v7;

  v1 = objc_retainAutorelease(a1);
  v2 = mkdir((const char *)objc_msgSend(v1, "fileSystemRepresentation"), 0x1FFu);
  if (!v2 || v2 == -1 && *__error() == 17)
  {
    v3 = 1;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = 0;
    objc_msgSend(v4, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", v1, 1, 0, &v7);
    v5 = v7;

    v3 = v5 == 0;
  }

  return v3;
}

void sub_18A1F1CCC(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

id BSTemporaryFileAtPath(void *a1, int *a2)
{
  id v3;
  id v4;
  char *v5;
  int v6;
  void *v7;
  void *v8;

  v3 = a1;
  if (!v3)
  {
    v8 = 0;
    if (!a2)
      goto LABEL_8;
    v6 = -1;
LABEL_7:
    *a2 = v6;
    goto LABEL_8;
  }
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@.XXXXXX"), v3);
  v4 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v5 = strdup((const char *)objc_msgSend(v4, "fileSystemRepresentation"));
  v6 = mkstemp(v5);
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "stringWithFileSystemRepresentation:length:", v5, strlen(v5));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  free(v5);
  if (a2)
    goto LABEL_7;
  if ((v6 & 0x80000000) == 0)
    close(v6);
LABEL_8:

  return v8;
}

void sub_18A1F1DDC(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_18A1F2058(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_18A1F2414(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, void *a11, void *a12)
{
  void *v12;
  void *v13;
  void *v14;
  void *v15;

  _Unwind_Resume(a1);
}

void sub_18A1F2520(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, objc_super a9)
{
  void *v9;
  void *v10;

  v10 = v9;

  a9.super_class = (Class)_BSDefaultObserver;
  -[_Unwind_Exception dealloc](&a9, sel_dealloc);
  _Unwind_Resume(a1);
}

void sub_18A1F269C(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_18A1F2804(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_18A1F2848(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_18A1F28B8(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_18A1F2914(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_18A1F2970(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_18A1F29E8(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_18A1F2DF4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;
  void *v11;

  _Unwind_Resume(a1);
}

void sub_18A1F3048(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void sub_18A1F3530(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_18A1F3624(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_18A1F3834(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_18A1F38E4(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_18A1F3A80(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13, void *a14, void *a15, void *a16)
{
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;

  _Unwind_Resume(a1);
}

void sub_18A1F3D3C(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_18A1F3DEC(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_18A1F3E48(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_18A1F3F34(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_18A1F3FF8(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_18A1F406C(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_18A1F40E0(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_18A1F437C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, void *a12)
{
  void *v12;
  void *v13;
  void *v14;

  _Unwind_Resume(a1);
}

void sub_18A1F448C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_18A1F46A0(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  _Unwind_Resume(a1);
}

void sub_18A1F4710(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, objc_super a9)
{
  void *v9;
  void *v10;

  v10 = v9;
  a9.receiver = v10;
  a9.super_class = (Class)BSTimer;
  -[_Unwind_Exception dealloc](&a9, sel_dealloc);
  _Unwind_Resume(a1);
}

void sub_18A1F4A28(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_18A1F4CF4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void sub_18A1F4E04(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, char a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,void *a22)
{
  _Block_object_dispose(&a17, 8);

  _Unwind_Resume(a1);
}

void sub_18A1F5024(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_18A1F5108(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

uint64_t BSIsBeingDebugged()
{
  pid_t v0;
  BOOL v1;
  _OWORD v3[2];
  __int128 v4;
  __int128 v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v0 = getpid();
  if (v0 < 1)
    return 0;
  v4 = 0u;
  v5 = 0u;
  memset(v3, 0, sizeof(v3));
  v1 = _BSShortBSDProcessInfoForPID(v0, v3);
  return *(_DWORD *)&v1 & ((v4 & 2) >> 1);
}

uint64_t BSHashPurify32(unsigned int a1)
{
  unsigned int v1;

  v1 = 321982955 * ((484763065 * (a1 ^ (a1 >> 14))) ^ ((484763065 * (a1 ^ (a1 >> 14))) >> 13));
  return v1 ^ (v1 >> 15);
}

unint64_t BSHashPurify64(unint64_t a1)
{
  unint64_t v1;

  v1 = 0x94D049BB133111EBLL
     * ((0xBF58476D1CE4E5B9 * (a1 ^ (a1 >> 30))) ^ ((0xBF58476D1CE4E5B9 * (a1 ^ (a1 >> 30))) >> 27));
  return v1 ^ (v1 >> 31);
}

unint64_t BSHashPurifyNS(unint64_t a1)
{
  unint64_t v1;

  v1 = 0x94D049BB133111EBLL
     * ((0xBF58476D1CE4E5B9 * (a1 ^ (a1 >> 30))) ^ ((0xBF58476D1CE4E5B9 * (a1 ^ (a1 >> 30))) >> 27));
  return v1 ^ (v1 >> 31);
}

void sub_18A1F5318(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_18A1F5420(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_18A1F55F8(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_18A1F5798(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_18A1F5804(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_18A1F5870(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_18A1F58B8(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_18A1F5920(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_18A1F59B8(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_18A1F5ACC(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  if (!v1)

  _Unwind_Resume(a1);
}

void sub_18A1F5B38(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_18A1F5D98(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, _Unwind_Exception *exception_object)
{
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  _Unwind_Resume(a1);
}

void sub_18A1F5E48(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_18A1F5EB4(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_18A1F5F28(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_18A1F612C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  _Unwind_Resume(a1);
}

void sub_18A1F6280(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, id a12)
{
  void *v12;
  void *v13;

  _Unwind_Resume(a1);
}

void BSPthreadCreate(void *a1)
{
  id v1;
  void (**v2)(_QWORD, _QWORD);
  pthread_t v3;

  v1 = a1;
  v2 = (void (**)(_QWORD, _QWORD))objc_msgSend(v1, "copy");

  v3 = 0;
  if (pthread_create(&v3, 0, (void *(__cdecl *)(void *))BSStartPthread, v2) && v2)
    v2[2](v2, 0);

}

void sub_18A1F6334(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

uint64_t BSStartPthread()
{
  void (**v0)(_QWORD, _QWORD);
  pthread_t v1;

  v0 = (void (**)(_QWORD, _QWORD))MEMORY[0x18D769CFC]();
  if (v0)
  {
    v1 = pthread_self();
    ((void (**)(_QWORD, pthread_t))v0)[2](v0, v1);
  }

  return 0;
}

void sub_18A1F6390(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void BSPthreadFixPriority(_opaque_pthread_t *a1)
{
  thread_act_t v1;
  int v2;
  int v3;
  NSObject *v4;
  integer_t policy_info;
  uint8_t buf[4];
  const char *v7;
  __int16 v8;
  int v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  policy_info = 0;
  v1 = pthread_mach_thread_np(a1);
  thread_policy_set(v1, 1u, &policy_info, 1u);
  v2 = proc_setthread_cpupercent();
  if (v2)
  {
    v3 = v2;
    BSLogCommon();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v7 = "BSPthreadFixPriority";
      v8 = 1024;
      v9 = v3;
      _os_log_error_impl(&dword_18A184000, v4, OS_LOG_TYPE_ERROR, "%s Error %d setting thread CPU percent", buf, 0x12u);
    }

  }
}

void BSPthreadSetFixedPriority(_opaque_pthread_t *a1, int a2)
{
  int v4;
  NSObject *v5;
  void *v6;
  sched_param v7;
  int v8;
  uint8_t buf[4];
  const char *v10;
  __int16 v11;
  int v12;
  __int16 v13;
  int v14;
  __int16 v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v8 = 0;
  v7 = 0;
  pthread_getschedparam(a1, &v8, &v7);
  v7.sched_priority = a2;
  v4 = pthread_setschedparam(a1, v8, &v7);
  if (v4)
  {
    BSLogCommon();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      BSPthreadGetName(a1);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 136315906;
      v10 = "BSPthreadSetFixedPriority";
      v11 = 1024;
      v12 = v4;
      v13 = 1024;
      v14 = a2;
      v15 = 2114;
      v16 = v6;
      _os_log_error_impl(&dword_18A184000, v5, OS_LOG_TYPE_ERROR, "%s Error %d setting priority %d for thread: %{public}@", buf, 0x22u);

    }
  }
  BSPthreadFixPriority(a1);
}

void sub_18A1F65AC(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

id BSPthreadGetName(_opaque_pthread_t *a1)
{
  _OWORD v2[8];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  memset(v2, 0, sizeof(v2));
  pthread_getname_np(a1, (char *)v2, 0x80uLL);
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v2);
  return (id)objc_claimAutoreleasedReturnValue();
}

void BSPthreadAttrSetFixedPriority(pthread_attr_t *a1, int a2)
{
  int v4;
  int v5;
  NSObject *v6;
  sched_param v7;
  uint8_t buf[4];
  const char *v9;
  __int16 v10;
  int v11;
  __int16 v12;
  int v13;
  __int16 v14;
  pthread_attr_t *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v7 = 0;
  pthread_attr_getschedparam(a1, &v7);
  v7.sched_priority = a2;
  v4 = pthread_attr_setschedparam(a1, &v7);
  if (v4)
  {
    v5 = v4;
    BSLogCommon();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315906;
      v9 = "BSPthreadAttrSetFixedPriority";
      v10 = 1024;
      v11 = v5;
      v12 = 1024;
      v13 = a2;
      v14 = 2048;
      v15 = a1;
      _os_log_error_impl(&dword_18A184000, v6, OS_LOG_TYPE_ERROR, "%s Error %d setting priority %d for attributes: %p", buf, 0x22u);
    }

  }
}

uint64_t BSPthreadGetCurrentPriority()
{
  _opaque_pthread_t *v0;
  int v2;
  sched_param v3;

  v0 = pthread_self();
  v3 = 0;
  v2 = 0;
  pthread_getschedparam(v0, &v2, &v3);
  return v3.sched_priority;
}

uint64_t BSPthreadGetPriority(_opaque_pthread_t *a1)
{
  int v2;
  sched_param v3;

  v3 = 0;
  v2 = 0;
  pthread_getschedparam(a1, &v2, &v3);
  return v3.sched_priority;
}

void BSPthreadSetName(uint64_t a1, void *a2)
{
  id v2;
  id v3;
  NSObject *v4;
  int v5;
  const char *v6;
  __int16 v7;
  id v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v2 = a2;
  if (!pthread_main_np())
  {
    v3 = objc_retainAutorelease(v2);
    if (pthread_setname_np((const char *)objc_msgSend(v3, "UTF8String")))
    {
      BSLogCommon();
      v4 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      {
        v5 = 136315394;
        v6 = "BSPthreadSetName";
        v7 = 2114;
        v8 = v3;
        _os_log_error_impl(&dword_18A184000, v4, OS_LOG_TYPE_ERROR, "%s Unable to set pthread name: %{public}@", (uint8_t *)&v5, 0x16u);
      }

    }
  }

}

void sub_18A1F6884(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_18A1F6974(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  void *v14;
  void *v15;

  _Unwind_Resume(a1);
}

void sub_18A1F69DC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_18A1F6BE8(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_18A1F6C80(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_18A1F6CF4(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_18A1F6EB8(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_18A1F70FC(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_18A1F71C8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_18A1F7224(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_18A1F728C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_18A1F72EC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

BOOL BSInterfaceOrientationIsValid(uint64_t a1)
{
  return (unint64_t)(a1 - 1) < 4;
}

BOOL BSInterfaceOrientationMaskContainsInterfaceOrientation(unint64_t a1, char a2)
{
  return ((1 << a2) & a1) != 0;
}

void sub_18A1F744C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_18A1F75D8(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_18A1F7A74(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, id a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18)
{
  void *v18;
  void *v19;
  void *v20;

  _Unwind_Resume(a1);
}

void sub_18A1F7D0C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, char a18)
{
  id *v18;
  id *v19;
  uint64_t v20;

  objc_destroyWeak(v19);
  _Block_object_dispose(&a18, 8);
  objc_destroyWeak(v18);
  objc_destroyWeak((id *)(v20 - 104));
  _Unwind_Resume(a1);
}

void sub_18A1F7FB8(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  _Unwind_Resume(a1);
}

void sub_18A1F8360(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_18A1F8434(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_18A1F85E8(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_18A1F89E0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{
  void *v10;
  void *v11;
  void *v12;

  _Unwind_Resume(a1);
}

void sub_18A1F8C84(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  _Unwind_Resume(a1);
}

void sub_18A1F8D00(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_18A1F8D54(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_18A1F8E88(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

double BSDispatchTimerTimeRemainingForFireTimeWithRepeat(dispatch_time_t a1, uint64_t a2, uint64_t a3)
{
  dispatch_time_t v6;
  dispatch_time_t v7;
  NSObject *v9;
  const char *v10;
  NSObject *v11;
  uint32_t v12;
  NSObject *v13;
  uint8_t buf[4];
  dispatch_time_t v15;
  __int16 v16;
  uint64_t v17;
  __int16 v18;
  uint64_t v19;
  __int16 v20;
  uint64_t v21;
  __int16 v22;
  dispatch_time_t v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  if (a1 == -1)
    return INFINITY;
  if (!dispatch_time_to_nsec())
  {
    BSLogTimer();
    v9 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    {
LABEL_14:

      return 0.0;
    }
    *(_DWORD *)buf = 134217984;
    v15 = a1;
    v10 = "fireTime couldn't be decomposed to nanoseconds : orig=%llu";
    v11 = v9;
    v12 = 12;
LABEL_21:
    _os_log_debug_impl(&dword_18A184000, v11, OS_LOG_TYPE_DEBUG, v10, buf, v12);
    goto LABEL_14;
  }
  if (!dispatch_time_to_nsec())
  {
    BSLogTimer();
    v9 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
      goto LABEL_14;
    *(_DWORD *)buf = 134218240;
    v15 = a1;
    v16 = 2048;
    v17 = 0;
    v10 = "next fireTime couldn't be decomposed to nanoseconds : orig=%llu now=%llu";
    v11 = v9;
    v12 = 22;
    goto LABEL_21;
  }
  if (a2)
  {
    if (a3 < 1)
      return 0.0;
    if ((unint64_t)(a3 * a2) <= 0x7FFFFFFFFFFFFFFELL)
    {
      v6 = dispatch_time(a1, a3 * a2);
      if (v6 != -1)
      {
        v7 = v6;
        if (dispatch_time_to_nsec())
          return 0.0;
        BSLogTimer();
        v13 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 134219008;
          v15 = a1;
          v16 = 2048;
          v17 = 0;
          v18 = 2048;
          v19 = a2;
          v20 = 2048;
          v21 = a3;
          v22 = 2048;
          v23 = v7;
          _os_log_debug_impl(&dword_18A184000, v13, OS_LOG_TYPE_DEBUG, "next fireTime couldn't be decomposed to nanoseconds : orig=%llu now=%lluns repeat=%llux%lluns next=%llu", buf, 0x34u);
        }

        return 0.0;
      }
    }
    return INFINITY;
  }
  return 0.0;
}

void sub_18A1F9424(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  _Unwind_Resume(a1);
}

void sub_18A1F959C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  void *v14;
  void *v15;

  _Unwind_Resume(a1);
}

void sub_18A1F9A10(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_18A1F9AA0(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_18A1F9B64(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void _wrapRunLoopWithAutoreleasePoolHandler(int a1, uint64_t a2, CFArrayRef theArray)
{
  CFIndex Count;
  CFIndex v6;
  const void *ValueAtIndex;
  const void *v8;

  if (a2 == 1)
    goto LABEL_6;
  if (a2 == 128 || a2 == 32)
  {
    Count = CFArrayGetCount(theArray);
    if (Count <= 0)
      __assert_rtn("_wrapRunLoopWithAutoreleasePoolHandler", "BSMIGServer.m", 33, "count > 0");
    v6 = Count - 1;
    ValueAtIndex = CFArrayGetValueAtIndex(theArray, Count - 1);
    MEMORY[0x18D76927C](ValueAtIndex);
    CFArrayRemoveValueAtIndex(theArray, v6);
    if (a2 == 32)
    {
LABEL_6:
      v8 = (const void *)MEMORY[0x18D769294](0);
      CFArrayAppendValue(theArray, v8);
    }
  }
}

void sub_18A1F9D10(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_18A1F9DC0(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  _Unwind_Resume(a1);
}

void sub_18A1FA1B8(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_18A1FA2B0(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_18A1FA34C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, id a9)
{

  _Unwind_Resume(a1);
}

void sub_18A1FA3E0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_18A1FA5F4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_18A1FACB0(_Unwind_Exception *exception_object)
{
  _Unwind_Resume(exception_object);
}

void sub_18A1FAD6C(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_18A1FB3F4(_Unwind_Exception *exception_object)
{
  _Unwind_Resume(exception_object);
}

void sub_18A1FB50C(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_18A1FB684(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_18A1FC68C(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_18A1FCDBC(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_18A1FD440(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_18A1FDAE0(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_18A1FE1CC(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_18A1FE744(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_18A1FEE24(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_18A1FF4A8(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_18A1FFAAC(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_18A2000AC(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_18A200730(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_18A200C68(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_18A201788(_Unwind_Exception *exception_object)
{
  _Unwind_Resume(exception_object);
}

const __CFString *NSStringFromBSDiagnosticReportType(unint64_t a1)
{
  if (a1 > 2)
    return CFSTR("(unknown)");
  else
    return off_1E1EBFB68[a1];
}

void BSProcessGenerateDiagnosticReport(uint64_t a1, int a2, uint64_t a3, void *a4)
{
  uint64_t v5;
  id v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  void *v20;

  LODWORD(v5) = a2;
  v7 = a4;
  v8 = v7;
  if ((_DWORD)v5)
    v5 = v5;
  else
    v5 = 0xFFFFFFFFLL;
  if (a1 == 2)
  {
    v12 = v7;
    v17 = 0;
    v18 = &v17;
    v19 = 0x2020000000;
    v13 = off_1ECD39A20;
    v20 = off_1ECD39A20;
    if (!off_1ECD39A20)
    {
      v14 = OSAnalyticsLibrary();
      v13 = dlsym(v14, "WriteStackshotReportWithPID");
      v18[3] = (uint64_t)v13;
      off_1ECD39A20 = v13;
    }
    _Block_object_dispose(&v17, 8);
    if (v13)
    {
      ((void (*)(id, uint64_t, uint64_t))v13)(v12, a3, v5);
      goto LABEL_14;
    }
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "BOOL softlinkWriteStackshotReportWithPID(NSString *__strong, mach_exception_data_type_t, pid_t)");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "handleFailureInFunction:file:lineNumber:description:", v16, CFSTR("BSProcessDiagnosticReporting.m"), 16, CFSTR("%s"), dlerror());
  }
  else
  {
    if (a1 != 1)
    {
LABEL_15:

      return;
    }
    v9 = v7;
    v17 = 0;
    v18 = &v17;
    v19 = 0x2020000000;
    v10 = _MergedGlobals_28;
    v20 = _MergedGlobals_28;
    if (!_MergedGlobals_28)
    {
      v11 = OSAnalyticsLibrary();
      v10 = dlsym(v11, "SimulateCrash");
      v18[3] = (uint64_t)v10;
      _MergedGlobals_28 = v10;
    }
    _Block_object_dispose(&v17, 8);
    if (v10)
    {
      ((void (*)(uint64_t, uint64_t, id))v10)(v5, a3, v9);
LABEL_14:

      goto LABEL_15;
    }
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "BOOL softlinkSimulateCrash(pid_t, mach_exception_data_type_t, NSString *__strong)");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "handleFailureInFunction:file:lineNumber:description:", v16, CFSTR("BSProcessDiagnosticReporting.m"), 15, CFSTR("%s"), dlerror());
  }

  __break(1u);
}

void sub_18A2019FC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  void *v3;
  va_list va;

  va_start(va, a3);
  _Block_object_dispose(va, 8);

  _Unwind_Resume(a1);
}

void *OSAnalyticsLibrary()
{
  void *v0;
  void *v2;
  void *v3;

  if (!OSAnalyticsLibraryCore_frameworkLibrary)
    OSAnalyticsLibraryCore_frameworkLibrary = _sl_dlopen();
  v0 = (void *)OSAnalyticsLibraryCore_frameworkLibrary;
  if (!OSAnalyticsLibraryCore_frameworkLibrary)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v0 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "void *OSAnalyticsLibrary(void)");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v3, CFSTR("BSProcessDiagnosticReporting.m"), 14, CFSTR("%s"), 0);

    __break(1u);
    free(v2);
  }
  return v0;
}

void sub_18A201B54(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *a10, _Unwind_Exception *exception_object)
{
  void *v11;

  _Unwind_Resume(a1);
}

void sub_18A201E28(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_18A201F1C(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_18A201F80(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_18A202004(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_18A20211C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v6 = v4;

  _Unwind_Resume(a1);
}

void sub_18A2022E4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, void *a15, uint64_t a16, char a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,id a22)
{
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;

  v26 = v23;

  _Block_object_dispose(&a17, 8);
  _Unwind_Resume(a1);
}

void sub_18A2024D8(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_18A202630(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_18A2026F4(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_18A20280C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13, uint64_t a14, void *a15)
{
  void *v15;
  void *v16;
  void *v17;

  _Unwind_Resume(a1);
}

void sub_18A2028C8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, void *a15)
{

  _Unwind_Resume(a1);
}

void sub_18A202CFC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;
  void *v11;
  void *v12;

  _Unwind_Resume(a1);
}

void sub_18A202EE0(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_18A2031DC(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  _Unwind_Resume(a1);
}

void sub_18A2033A8(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_18A20366C(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_18A2037E8(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

__CFString *NSStringFromBSDescriptionCollectionLineBreak(unint64_t a1)
{
  if (a1 < 4)
    return off_1E1EBFE00[a1];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("<invalid:%X>"), a1);
  return (__CFString *)(id)objc_claimAutoreleasedReturnValue();
}

__CFString *NSStringFromBSDescriptionVerbosity(unint64_t a1)
{
  if (a1 < 3)
    return off_1E1EBFE20[a1];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("<invalid:%X>"), a1);
  return (__CFString *)(id)objc_claimAutoreleasedReturnValue();
}

__CFString *NSStringFromBSDescriptionKeyValuePairSorting(unint64_t a1)
{
  if (a1 < 3)
    return off_1E1EBFE38[a1];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("<invalid:%X>"), a1);
  return (__CFString *)(id)objc_claimAutoreleasedReturnValue();
}

__CFString *NSStringFromBSDescriptionCollectionTruncationStyle(unint64_t a1)
{
  if (a1 < 3)
    return off_1E1EBFE50[a1];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("<invalid:%X>"), a1);
  return (__CFString *)(id)objc_claimAutoreleasedReturnValue();
}

__CFString *NSStringFromBSDescriptionLineTruncation(unint64_t a1)
{
  if (a1 < 5)
    return off_1E1EBFE68[a1];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("<invalid:%X>"), a1);
  return (__CFString *)(id)objc_claimAutoreleasedReturnValue();
}

__CFString *NSStringFromBSDescriptionDebugging(unint64_t a1)
{
  if (a1 < 3)
    return off_1E1EBFE90[a1];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("<invalid:%X>"), a1);
  return (__CFString *)(id)objc_claimAutoreleasedReturnValue();
}

__CFString *NSStringFromBSDescriptionItemSeparator(unint64_t a1)
{
  if (a1 < 4)
    return off_1E1EBFEA8[a1];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("<invalid:%X>"), a1);
  return (__CFString *)(id)objc_claimAutoreleasedReturnValue();
}

void sub_18A203C18(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, _Unwind_Exception *exception_object)
{
  void *v10;
  void *v11;

  _Unwind_Resume(a1);
}

id _BSDefaultCollectionLineBreakStyle()
{
  if (qword_1ECD39A60 != -1)
    dispatch_once(&qword_1ECD39A60, &__block_literal_global_35);
  return (id)qword_1ECD39A58;
}

void sub_18A204024(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_18A204128(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_18A20423C(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_18A2044AC(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_18A2045D4(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_18A2048D8(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_18A204B64(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

id _BSCreateObjectOfClassFromData(objc_class *a1, void *a2)
{
  id v3;
  uint64_t v4;
  id v5;
  void *v6;
  void *v7;
  id v8;
  NSObject *v9;
  NSObject *v10;
  void *v12;
  id v13;
  objc_class *v14;
  void *v15;
  id v16;
  uint8_t buf[4];
  id v18;
  __int16 v19;
  id v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v4 = objc_msgSend(v3, "length");
    v5 = 0;
    if (a1 && v4)
    {
      v6 = (void *)MEMORY[0x18D769AE0]();
      v16 = 0;
      objc_msgSend(MEMORY[0x1E0CB3710], "unarchivedObjectOfClass:fromData:error:", a1, v3, &v16);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = v16;
      if (v8)
      {
        BSLogCommon();
        v9 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
        {
          NSStringFromClass(a1);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          v18 = v12;
          v19 = 2114;
          v20 = v8;
          _os_log_error_impl(&dword_18A184000, v9, OS_LOG_TYPE_ERROR, "Error during decoding of data to type=%{public}@: %{public}@", buf, 0x16u);

        }
      }
      if (v7)
      {
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v5 = v7;
LABEL_17:

          objc_autoreleasePoolPop(v6);
          goto LABEL_18;
        }
        if (!v8)
        {
          BSLogCommon();
          v10 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
          {
            NSStringFromClass(a1);
            v13 = (id)objc_claimAutoreleasedReturnValue();
            v14 = (objc_class *)objc_opt_class();
            NSStringFromClass(v14);
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543618;
            v18 = v13;
            v19 = 2114;
            v20 = v15;
            _os_log_error_impl(&dword_18A184000, v10, OS_LOG_TYPE_ERROR, "Error during decoding of data to type=%{public}@: decoded %{public}@ instead but unarchiver didn't filter it", buf, 0x16u);

          }
        }
      }
      v5 = 0;
      goto LABEL_17;
    }
  }
  else
  {
    v5 = 0;
  }
LABEL_18:

  return v5;
}

void sub_18A204E90(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  _Unwind_Resume(a1);
}

id BSSecureDecodeOfTypes(void *a1, void *a2)
{
  return _BSCreateObjectOfClassesFromData(a2, a1);
}

void sub_18A204F5C(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_18A204FAC(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_18A2050A4(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_18A205164(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_18A205348(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_18A205448(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

BOOL BSEqualDoubles(double a1, double a2)
{
  return vabdd_f64(a1, a2) < 0.00000011920929;
}

uint64_t BSCompareSizes(double a1, double a2, double a3, double a4)
{
  double v4;
  double v5;
  BOOL v6;
  uint64_t v7;

  v4 = vabdd_f64(a1, a3);
  v5 = vabdd_f64(a2, a4);
  v6 = a2 < a4 && a1 < a3;
  v7 = -1;
  if (!v6)
    v7 = 1;
  if (v5 < 2.22044605e-16 && v4 < 2.22044605e-16)
    return 0;
  else
    return v7;
}

uint64_t BSCompareIntegers(uint64_t a1, uint64_t a2)
{
  if (a1 < a2)
    return -1;
  else
    return a1 > a2;
}

uint64_t BSCompareBuildVersions(void *a1, void *a2, uint64_t a3)
{
  id v5;
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  void *v26;
  void *v27;

  v5 = a1;
  v6 = a2;
  objc_msgSend(MEMORY[0x1E0CB3500], "letterCharacterSet");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v5, "rangeOfCharacterFromSet:", v7);
  v10 = v9;

  objc_msgSend(MEMORY[0x1E0CB3500], "letterCharacterSet");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v6, "rangeOfCharacterFromSet:", v11);
  v14 = v13;

  objc_msgSend(v5, "substringToIndex:", v8);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "substringToIndex:", v12);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v15, "integerValue");
  v18 = objc_msgSend(v16, "integerValue");
  if (v17 < v18)
    v19 = -1;
  else
    v19 = v17 > v18;
  if (!v19)
  {
    if ((unint64_t)(a3 - 1) > 1)
    {
      v19 = 0;
    }
    else
    {
      objc_msgSend(v5, "substringWithRange:", v8, v10);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "substringWithRange:", v12, v14);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = objc_msgSend(v27, "localizedCaseInsensitiveCompare:", v26);
      v19 = v20;
      if (a3 == 2 && !v20)
      {
        objc_msgSend(v5, "substringFromIndex:", v8 + v10);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v22 = objc_msgSend(v21, "integerValue");
        objc_msgSend(v6, "substringFromIndex:", v12 + v14);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        v24 = objc_msgSend(v23, "integerValue");
        if (v22 < v24)
          v19 = -1;
        else
          v19 = v22 > v24;

      }
    }
  }

  return v19;
}

void sub_18A20569C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void *a9, void *a10)
{
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;

  _Unwind_Resume(a1);
}

void sub_18A205770(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_18A2057D4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_18A205848(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void sub_18A2058E8(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

double BSSizeSwap(double a1, double a2)
{
  return a2;
}

__n128 BSIntegralTransform@<Q0>(float64x2_t *a1@<X0>, uint64_t a2@<X8>)
{
  float64x2_t v2;
  float64x2_t v3;
  __n128 result;

  v2 = vrndaq_f64(a1[1]);
  *a1 = vrndaq_f64(*a1);
  a1[1] = v2;
  v3 = a1[1];
  a1[2] = vrndaq_f64(a1[2]);
  *(float64x2_t *)a2 = *a1;
  *(float64x2_t *)(a2 + 16) = v3;
  result = (__n128)a1[2];
  *(__n128 *)(a2 + 32) = result;
  return result;
}

double _BSRectTransformByTransformingCorners(uint64_t a1, double a2, double a3, double a4, double a5)
{
  uint64_t v6;
  double *v7;
  uint64_t v8;
  double v9;
  double v10;
  double v12[2];
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  uint64_t v19;

  v6 = 0;
  v19 = *MEMORY[0x1E0C80C00];
  v12[0] = a2;
  v12[1] = a3;
  v13 = a2;
  v14 = a3 + a5;
  v15 = a2 + a4;
  v16 = a3 + a5;
  v17 = a2 + a4;
  v18 = a3;
  do
  {
    v7 = &v12[v6];
    *v7 = (*(double (**)(uint64_t, double, double))(a1 + 16))(a1, v12[v6], v12[v6 + 1]);
    *((_QWORD *)v7 + 1) = v8;
    v6 += 2;
  }
  while (v6 != 8);
  if (v15 >= v17)
    v9 = v17;
  else
    v9 = v15;
  if (v12[0] >= v13)
    v10 = v13;
  else
    v10 = v12[0];
  if (v10 >= v9)
    return v9;
  else
    return v10;
}

double BSConvertPointFromOrientationToOrientation(uint64_t a1, uint64_t a2, double result, double a4, double a5, double a6)
{
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;

  if (a1 != a2)
  {
    v6 = a5 - result;
    v7 = a6 - a4;
    v8 = a5 - a4;
    if (a1 == 4)
      v9 = a4;
    else
      v9 = result;
    if (a1 == 4)
      a4 = a6 - result;
    if (a1 != 3)
    {
      v8 = v9;
      result = a4;
    }
    if (a1 == 2)
      v10 = v6;
    else
      v10 = v8;
    if (a1 == 2)
      v11 = v7;
    else
      v11 = result;
    switch(a2)
    {
      case 2:
        return a5 - v10;
      case 3:
        return v11;
      case 4:
        return a6 - v11;
      default:
        return v10;
    }
  }
  return result;
}

double BSConvertRectFromOrientationToOrientation(uint64_t a1, uint64_t a2, double result, double a4, double a5, double a6, double a7, double a8)
{
  uint64_t v8;
  uint64_t v9;
  _QWORD v10[10];

  if (a1 != a2)
  {
    v10[8] = v8;
    v10[9] = v9;
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __BSConvertRectFromOrientationToOrientation_block_invoke;
    v10[3] = &__block_descriptor_64_e30__CGPoint_dd_24__0_CGPoint_dd_8l;
    *(double *)&v10[4] = a7;
    *(double *)&v10[5] = a8;
    v10[6] = a1;
    v10[7] = a2;
    return _BSRectTransformByTransformingCorners((uint64_t)v10, result, a4, a5, a6);
  }
  return result;
}

double BSRadiansFromAffineTransform(long double *a1)
{
  return atan2(a1[1], *a1);
}

uint64_t BSValueWithPoint()
{
  return objc_msgSend(MEMORY[0x1E0CB3B18], "bs_valueWithCGPoint:");
}

uint64_t BSValueWithSize()
{
  return objc_msgSend(MEMORY[0x1E0CB3B18], "bs_valueWithCGSize:");
}

uint64_t BSValueWithRect()
{
  return objc_msgSend(MEMORY[0x1E0CB3B18], "bs_valueWithCGRect:");
}

id BSValueWithAffineTransform(_OWORD *a1)
{
  __int128 v1;
  _OWORD v3[3];

  v1 = a1[1];
  v3[0] = *a1;
  v3[1] = v1;
  v3[2] = a1[2];
  objc_msgSend(MEMORY[0x1E0CB3B18], "bs_valueWithCGAffineTransform:", v3);
  return (id)objc_claimAutoreleasedReturnValue();
}

void BSAffineTransformFromValue(void *a1@<X0>, _OWORD *a2@<X8>)
{
  id v3;
  id v4;

  v3 = a1;
  v4 = v3;
  if (v3)
  {
    objc_msgSend(v3, "bs_CGAffineTransformValue");
  }
  else
  {
    a2[1] = 0u;
    a2[2] = 0u;
    *a2 = 0u;
  }

}

void sub_18A205BFC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

uint64_t BSNSStringFromCGPoint(double a1, double a2)
{
  return objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("{%.*g, %.*g}"), 17, *(_QWORD *)&a1, 17, *(_QWORD *)&a2);
}

uint64_t BSNSStringFromCGVector(double a1, double a2)
{
  return objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("{%.*g, %.*g}"), 17, *(_QWORD *)&a1, 17, *(_QWORD *)&a2);
}

uint64_t BSNSStringFromCGSize(double a1, double a2)
{
  return objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("{%.*g, %.*g}"), 17, *(_QWORD *)&a1, 17, *(_QWORD *)&a2);
}

uint64_t BSNSStringFromCGRect(double a1, double a2, double a3, double a4)
{
  return objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("{{%.*g, %.*g}, {%.*g, %.*g}}"), 17, *(_QWORD *)&a1, 17, *(_QWORD *)&a2, 17, *(_QWORD *)&a3, 17, *(_QWORD *)&a4);
}

uint64_t BSNSStringFromCGAffineTransform(_QWORD *a1)
{
  return objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("[%.*g, %.*g, %.*g, %.*g, %.*g, %.*g]"), 17, *a1, 17, a1[1], 17, a1[2], 17, a1[3], 17, a1[4], 17, a1[5]);
}

CFTypeRef BSCopyDeviceTreeProperty(char *path, const __CFString *a2)
{
  io_registry_entry_t v3;
  io_object_t v4;
  CFTypeRef CFProperty;

  v3 = IORegistryEntryFromPath(*MEMORY[0x1E0CBBAA8], path);
  if (!v3)
    return 0;
  v4 = v3;
  CFProperty = IORegistryEntryCreateCFProperty(v3, a2, 0, 0);
  IOObjectRelease(v4);
  return CFProperty;
}

uint64_t BSGetDeviceType()
{
  if (BSGetDeviceType_onceToken != -1)
    dispatch_once(&BSGetDeviceType_onceToken, &__block_literal_global_27);
  return BSGetDeviceType___DeviceType;
}

void sub_18A205FBC(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

id BSCollectionPartition(objc_class *a1, void *a2, void *a3)
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t j;
  void *v12;
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id obj;
  uint64_t v22;
  void (**v23)(id, void *);
  uint64_t v24;
  id v25;
  uint64_t i;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  _BYTE v36[128];
  _BYTE v37[128];
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v4 = a2;
  v23 = a3;
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v34 = 0u;
  v35 = 0u;
  v32 = 0u;
  v33 = 0u;
  obj = v4;
  v24 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v32, v37, 16);
  if (v24)
  {
    v22 = *(_QWORD *)v33;
    do
    {
      for (i = 0; i != v24; ++i)
      {
        if (*(_QWORD *)v33 != v22)
          objc_enumerationMutation(obj);
        v6 = *(void **)(*((_QWORD *)&v32 + 1) + 8 * i);
        v23[2](v23, v6);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        if (v7)
        {
          v25 = v7;
          if (_NSIsNSArray())
          {
            v30 = 0u;
            v31 = 0u;
            v28 = 0u;
            v29 = 0u;
            v8 = v25;
            v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v28, v36, 16);
            if (v9)
            {
              v10 = *(_QWORD *)v29;
              do
              {
                for (j = 0; j != v9; ++j)
                {
                  if (*(_QWORD *)v29 != v10)
                    objc_enumerationMutation(v8);
                  v12 = *(void **)(*((_QWORD *)&v28 + 1) + 8 * j);
                  v13 = v5;
                  v14 = v12;
                  v15 = v6;
                  objc_msgSend(v13, "objectForKey:", v14);
                  v16 = (id)objc_claimAutoreleasedReturnValue();
                  if (!v16)
                  {
                    v16 = objc_alloc_init(a1);
                    objc_msgSend(v13, "setObject:forKey:", v16, v14);
                  }
                  objc_msgSend(v16, "addObject:", v15);

                }
                v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v28, v36, 16);
              }
              while (v9);
            }
          }
          else
          {
            v8 = v5;
            v17 = v25;
            v18 = v6;
            objc_msgSend(v8, "objectForKey:", v17);
            v19 = (id)objc_claimAutoreleasedReturnValue();
            if (!v19)
            {
              v19 = objc_alloc_init(a1);
              objc_msgSend(v8, "setObject:forKey:", v19, v17);
            }
            objc_msgSend(v19, "addObject:", v18);

          }
          v7 = v25;
        }

      }
      v24 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v32, v37, 16);
    }
    while (v24);
  }

  return v5;
}

void sub_18A2062A4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void *a9, void *a10, uint64_t a11, void *a12)
{
  void *v12;

  _Unwind_Resume(a1);
}

void sub_18A2063D8(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void vmDeallocateCallback()
{
  JUMPOUT(0x18D76A224);
}

void sub_18A206498(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

uint64_t _bs_set_crash_log_message(uint64_t result)
{
  qword_1EDF5BAE8 = result;
  return result;
}

void sub_18A206518(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_18A206594(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_18A2065F8(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_18A206650(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_18A2066A0(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_18A206728(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_18A206858(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_18A206AB0(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

uint64_t BSLogStateCaptureMaximumDataSize()
{
  return 32568;
}

BOOL BSLogStateCaptureCheckPlistSizeIsPermitted(void *a1)
{
  id v1;
  uint64_t v3;

  v3 = 0;
  v1 = BSLogStateCaptureEncodePlist(a1, 0, &v3);
  return v3 == 0;
}

id BSLogGetAllRegisteredStateCaptureBlocks()
{
  void *v0;

  os_unfair_lock_lock((os_unfair_lock_t)&_MergedGlobals_32);
  objc_msgSend((id)qword_1ECD39AD0, "allValues");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  os_unfair_lock_unlock((os_unfair_lock_t)&_MergedGlobals_32);
  return v0;
}

void sub_18A206C88(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_18A2072A8(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_18A207604(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, void *a7, void *a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  void *v11;
  void *v12;
  void *v13;
  va_list va;

  va_start(va, a11);

  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_18A207910(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void sub_18A2079C4(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_18A207B58(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  _Unwind_Resume(a1);
}

void sub_18A207C70(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  v4 = v3;

  _Unwind_Resume(a1);
}

void sub_18A207D1C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void sub_18A207E8C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  v5 = v4;

  _Unwind_Resume(a1);
}

void sub_18A207FEC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, id a12)
{
  void *v12;
  void *v13;

  _Unwind_Resume(a1);
}

void sub_18A2080D8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void sub_18A208208(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_18A208264(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_18A2082E4(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_18A208354(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_18A208408(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  v4 = v3;

  _Unwind_Resume(a1);
}

void sub_18A2084BC(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  v4 = v3;

  _Unwind_Resume(a1);
}

void sub_18A208588(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_18A2085DC(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_18A208634(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_18A208710(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13)
{
  void *v13;
  void *v14;

  _Unwind_Resume(a1);
}

void sub_18A208808(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_18A208950(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_18A208A48(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_18A208AD0(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_18A208B98(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  v4 = v3;

  _Unwind_Resume(a1);
}

void sub_18A208C48(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_18A208D34(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  v4 = v3;

  _Unwind_Resume(a1);
}

void sub_18A208DE4(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_18A208EC8(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  v4 = v3;

  _Unwind_Resume(a1);
}

void sub_18A208F48(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void sub_18A208FA0(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_18A20900C(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_18A209054(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_18A2090BC(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

uint64_t _BSProtobufSchemaEncodeMessageWithExplicitIvarBaseAddress(_QWORD *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  _QWORD *v4;
  uint64_t v5;
  int v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  int v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t result;
  void *v16;
  const char *Name;
  void *v18;
  uint64_t v20;
  uint8_t buf[4];
  uint64_t v25;
  __int16 v26;
  const __CFString *v27;
  __int16 v28;
  int v29;
  __int16 v30;
  void *v31;
  uint64_t v32;

  v4 = a1;
  v32 = *MEMORY[0x1E0C80C00];
  v5 = a1[2];
  v6 = 1;
  v20 = v5;
  do
  {
    while (1)
    {
      if (v5)
        PBDataWriterPlaceMark();
      v7 = v4[3];
      if (v7 >= 1)
      {
        v8 = 0;
        while (1)
        {
          v9 = v4[5];
          v10 = v9 + 96 * v8;
          v11 = *(unsigned __int8 *)(v10 + 88);
          v12 = a2 + *(_QWORD *)(v10 + 16);
          if (*(uint64_t *)(v10 + 64) >= 1)
            break;
          if (!*(_BYTE *)(v10 + 88))
            goto LABEL_15;
LABEL_17:
          if (++v8 >= v7)
            goto LABEL_18;
        }
        v13 = 0;
        do
        {
          v14 = *(_QWORD *)(*(_QWORD *)(v9 + 96 * v8 + 72) + 8 * v13);
          if ((objc_msgSend((id)objc_opt_class(), "isEqual:", *(_QWORD *)(v14 + 32)) & 1) != 0)
          {
            v10 = v14;
            goto LABEL_15;
          }
          ++v13;
        }
        while (v13 < *(_QWORD *)(v10 + 64));
        if (v11)
        {
          v16 = (void *)MEMORY[0x1E0CB3940];
          Name = ivar_getName(*(Ivar *)(v9 + 96 * v8 + 24));
          v18 = (void *)objc_msgSend(v16, "stringWithFormat:", CFSTR("encode ivar %s: unexpected class %@"), Name, objc_opt_class());
          if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138544130;
            v25 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "BOOL _BSProtobufSchemaEncodeMessageWithExplicitIvarBaseAddress(BSProtobufSchema *, void *, PBDataWriter *, NSError **)");
            v26 = 2114;
            v27 = CFSTR("BSProtobufSerialization.m");
            v28 = 1024;
            v29 = 1145;
            v30 = 2114;
            v31 = v18;
            _os_log_error_impl(&dword_18A184000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ (%{public}@:%i) : %{public}@", buf, 0x26u);
          }
          qword_1EDF5BAE8 = objc_msgSend(v18, "UTF8String");
          __break(0);
          JUMPOUT(0x18A2093A0);
        }
LABEL_15:
        result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v10 + 48))(a3, v10, v12, a4);
        if (!(_DWORD)result)
          return result;
        v7 = v4[3];
        goto LABEL_17;
      }
LABEL_18:
      v4 = (_QWORD *)v4[2];
      v5 = v20;
      if (!v20)
        break;
      PBDataWriterRecallMark();
      ++v6;
      if (!v4)
        return 1;
    }
  }
  while (v4);
  return 1;
}

uint64_t BSProtobufValidateIncomingTag(uint64_t result, uint64_t a2)
{
  uint64_t v2;
  int *v3;
  int v4;
  void *v5;
  const __CFString *v6;
  void *v7;
  uint8_t buf[4];
  uint64_t v9;
  __int16 v10;
  const __CFString *v11;
  __int16 v12;
  int v13;
  __int16 v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  if (a2 < 1)
  {
    v6 = CFSTR("tag must be > 0");
    goto LABEL_15;
  }
  if ((unint64_t)(a2 - 19000) < 0x3E8)
  {
    v6 = CFSTR("tag must not be between 19000 and 19999, inclusive");
    goto LABEL_15;
  }
  if ((unint64_t)a2 >> 29)
  {
    v6 = CFSTR("tag must be <= ((2^29) - 1)");
LABEL_15:
    v7 = (void *)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@"), v6);
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138544130;
      v9 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "void BSProtobufValidateIncomingTag(BSProtobufSchema *, NSInteger)");
      v10 = 2114;
      v11 = CFSTR("BSProtobufSerialization.m");
      v12 = 1024;
      v13 = 382;
      v14 = 2114;
      v15 = v7;
      _os_log_error_impl(&dword_18A184000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ (%{public}@:%i) : %{public}@", buf, 0x26u);
    }
    qword_1EDF5BAE8 = objc_msgSend(v7, "UTF8String");
    __break(0);
    JUMPOUT(0x18A209EC4);
  }
  v2 = *(_QWORD *)(result + 24);
  if (v2 >= 1)
  {
    v3 = *(int **)(result + 40);
    do
    {
      v4 = *v3;
      v3 += 24;
      if (v4 == a2)
      {
        v5 = (void *)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("cannot add duplicate tag %d"), a2);
        if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138544130;
          v9 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "void BSProtobufValidateIncomingTag(BSProtobufSchema *, NSInteger)");
          v10 = 2114;
          v11 = CFSTR("BSProtobufSerialization.m");
          v12 = 1024;
          v13 = 387;
          v14 = 2114;
          v15 = v5;
          _os_log_error_impl(&dword_18A184000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ (%{public}@:%i) : %{public}@", buf, 0x26u);
        }
        qword_1EDF5BAE8 = objc_msgSend(v5, "UTF8String");
        __break(0);
        JUMPOUT(0x18A209DE8);
      }
      --v2;
    }
    while (v2);
  }
  return result;
}

uint64_t _BSProtobufEncodeData(uint64_t a1, uint64_t a2, _QWORD *a3)
{
  if (*a3)
    PBDataWriterWriteDataField();
  return 1;
}

uint64_t _BSProtobufDecodeData(uint64_t a1, uint64_t a2, _QWORD *a3)
{
  *a3 = (id)PBReaderReadData();
  return 1;
}

uint64_t _BSProtobufEncodeRepeatFieldString(uint64_t a1, uint64_t a2, void **a3)
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v3 = *a3;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v10;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v10 != v6)
          objc_enumerationMutation(v3);
        PBDataWriterWriteStringField();
        ++v7;
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v5);
  }
  return 1;
}

uint64_t _BSProtobufDecodeRepeatFieldString(uint64_t a1, uint64_t a2, id *a3)
{
  id v3;
  id v5;
  void *v6;

  v3 = *a3;
  if (!*a3)
  {
    v3 = objc_alloc_init(*(Class *)(a2 + 40));
    *a3 = v3;
  }
  v5 = (id)PBReaderReadString();
  if (v5)
  {
    v6 = v5;
    objc_msgSend(v3, "addObject:", v5);

  }
  return 1;
}

void sub_18A20B628(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_18A20B7C8(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_18A20B8E8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_18A20B974(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, id a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{

  _Unwind_Resume(a1);
}

void sub_18A20BA14(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, id a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{

  _Unwind_Resume(a1);
}

void sub_18A20BB74(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_18A20BD3C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_18A20BDBC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, objc_super a9)
{
  void *v9;
  void *v10;

  v10 = v9;

  a9.super_class = (Class)BSDateFormatterCache;
  -[_Unwind_Exception dealloc](&a9, sel_dealloc);
  _Unwind_Resume(a1);
}

void sub_18A20BEE4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
  void *v10;

  objc_sync_exit(obj);
  _Unwind_Resume(a1);
}

void sub_18A20BF90(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  void *v14;

  _Unwind_Resume(a1);
}

void sub_18A20C0E4(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_18A20C198(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  void *v14;

  _Unwind_Resume(a1);
}

void sub_18A20C248(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_18A20C2DC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  void *v14;

  _Unwind_Resume(a1);
}

void sub_18A20C394(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_18A20C428(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  void *v14;

  _Unwind_Resume(a1);
}

void sub_18A20C4E0(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_18A20C574(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  void *v14;

  _Unwind_Resume(a1);
}

void sub_18A20C62C(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_18A20C6C0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  void *v14;

  _Unwind_Resume(a1);
}

void sub_18A20C778(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_18A20C80C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  void *v14;

  _Unwind_Resume(a1);
}

void sub_18A20C8C4(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_18A20C958(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  void *v14;

  _Unwind_Resume(a1);
}

void sub_18A20CA10(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_18A20CAA4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  void *v14;

  _Unwind_Resume(a1);
}

void sub_18A20CBC0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  void *v14;

  _Unwind_Resume(a1);
}

void sub_18A20CCEC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  void *v14;

  _Unwind_Resume(a1);
}

void sub_18A20CDB4(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_18A20CE48(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  void *v14;

  _Unwind_Resume(a1);
}

void sub_18A20D0C4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
  void *v10;

  objc_sync_exit(obj);
  _Unwind_Resume(a1);
}

void sub_18A20D188(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  void *v14;

  _Unwind_Resume(a1);
}

void sub_18A20D280(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  void *v14;

  _Unwind_Resume(a1);
}

void sub_18A20D390(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  void *v14;

  _Unwind_Resume(a1);
}

void sub_18A20D43C(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_18A20D4D0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  void *v14;

  _Unwind_Resume(a1);
}

void sub_18A20D5E0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  void *v14;

  _Unwind_Resume(a1);
}

void sub_18A20D9F4(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  _Unwind_Resume(a1);
}

void sub_18A20DB18(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);

  _Unwind_Resume(a1);
}

void sub_18A20DBD4(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);

  _Unwind_Resume(a1);
}

void sub_18A20DC54(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_18A20DE68(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_18A20E024(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  v4 = v3;

  _Unwind_Resume(a1);
}

void sub_18A20E1C8(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  _Unwind_Resume(a1);
}

void sub_18A20E2E4(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_18A20E3B0(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  v4 = v3;

  _Unwind_Resume(a1);
}

void sub_18A20E474(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;
  void *v11;
  void *v12;

  v12 = v11;

  _Unwind_Resume(a1);
}

void sub_18A20E684(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_18A20E6F4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_18A20E7A4(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_18A20E9EC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, _Unwind_Exception *exception_object, objc_super a11)
{
  void *v11;

  a11.super_class = (Class)BSContinuousMachTimer;
  -[_Unwind_Exception dealloc](&a11, sel_dealloc);
  _Unwind_Resume(a1);
}

void sub_18A20EA38(_Unwind_Exception *a1, int a2)
{
  if (a2)
    objc_terminate();
  _Unwind_Resume(a1);
}

void sub_18A20EAC8(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_18A20EB34(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_18A20F278(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;
  void *v11;

  _Unwind_Resume(a1);
}

void sub_18A20F54C(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_18A20F5FC(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_18A20F67C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{

  _Unwind_Resume(a1);
}

void sub_18A20F75C(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_18A20F84C(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_18A20F8AC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_18A20F910(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_18A20F974(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_18A20F9EC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_18A20FAAC(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_18A20FB20(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_18A20FBAC(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_18A20FC18(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_18A20FD34(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  v13 = v12;

  _Unwind_Resume(a1);
}

void sub_18A20FE10(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_18A20FFE8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void sub_18A210184(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_18A2101CC(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_18A210238(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_18A210280(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_18A2102DC(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_18A210384(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_18A2104C4(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_18A210614(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_18A210810(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, _Unwind_Exception *exception_object)
{
  void *v10;
  void *v11;

  _Unwind_Resume(a1);
}

void sub_18A210884(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_18A210A1C(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_18A210AB0(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_18A210B84(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_18A210BF8(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_18A210C70(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_18A210D10(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_18A210E6C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_18A210F3C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  void *v14;

  _Unwind_Resume(a1);
}

void sub_18A2110B8(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_18A211254(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_18A21137C(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_18A211580(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_18A211710(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16)
{

  _Unwind_Resume(a1);
}

void sub_18A21179C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{

  _Unwind_Resume(a1);
}

void sub_18A211804(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_18A211BA0(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_18A2122B4(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_18A2127E8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, _Unwind_Exception *exception_object)
{
  void *v10;
  void *v11;

  _Unwind_Resume(a1);
}

void sub_18A212A38(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_18A212DA4(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_18A213168(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_18A2133F4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, id a12)
{
  void *v12;

  _Unwind_Resume(a1);
}

void sub_18A2134A8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void sub_18A213540(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void sub_18A213B30(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, id a12)
{
  void *v12;
  void *v13;

  _Unwind_Resume(a1);
}

void sub_18A213C54(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void sub_18A213D58(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_18A213E4C(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_18A213ED4(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_18A213F60(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_18A213FE8(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_18A21408C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

BOOL BSSettingFlagIsExplicitNo(uint64_t a1)
{
  return a1 == 0;
}

const __CFString *BSSettingFlagDescription(uint64_t a1)
{
  const __CFString *v1;

  v1 = CFSTR("Yes");
  if (!a1)
    v1 = CFSTR("No");
  if (a1 == 0x7FFFFFFFFFFFFFFFLL)
    return CFSTR("NotSet");
  else
    return v1;
}

void sub_18A214254(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_18A214368(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_18A214400(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void sub_18A2144A0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_18A21450C(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_18A214564(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_18A2145E8(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  v4 = v3;

  _Unwind_Resume(a1);
}

void sub_18A214750(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_18A2148B4(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

uint64_t BSSettingsEqualToSettings(void *a1, void *a2)
{
  return _BSSettingsEqualToSettings(a1, a2, 0);
}

uint64_t _BSSettingsEqualToSettings(void *a1, void *a2, int a3)
{
  id v5;
  id v6;
  char IsEmpty;
  char v8;
  uint64_t v9;

  v5 = a1;
  v6 = a2;
  if (a3 && BSSettingsIsEmpty(v5))
  {
    IsEmpty = BSSettingsIsEmpty(v6);
    if (v5 == v6)
      v8 = 1;
    else
      v8 = IsEmpty;
    if ((v8 & 1) != 0)
      goto LABEL_7;
  }
  else if (v5 == v6)
  {
LABEL_7:
    v9 = 1;
    goto LABEL_12;
  }
  v9 = 0;
  if (v5 && v6)
    v9 = objc_msgSend(v5, "isEqual:", v6);
LABEL_12:

  return v9;
}

void sub_18A2149A0(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_18A214BB8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13)
{
  void *v13;

  _Unwind_Resume(a1);
}

void sub_18A214C80(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

uint64_t BSPIDIsExiting(int a1)
{
  BOOL v1;
  _OWORD v3[2];
  __int128 v4;
  __int128 v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  if (a1 < 1)
    return 0;
  v4 = 0u;
  v5 = 0u;
  memset(v3, 0, sizeof(v3));
  v1 = _BSShortBSDProcessInfoForPID(a1, v3);
  return *(_DWORD *)&v1 & ((v4 & 4) >> 2);
}

uint64_t BSPIDIsExtension()
{
  void *v0;
  void *v1;
  uint64_t v2;

  v0 = (void *)launch_copy_properties_for_pid_4assertiond();
  v1 = v0;
  if (v0)
  {
    LODWORD(v2) = xpc_dictionary_get_BOOL(v0, (const char *)*MEMORY[0x1E0C83AF8]);
    if (xpc_dictionary_get_string(v1, (const char *)*MEMORY[0x1E0C83AE8]))
      v2 = v2;
    else
      v2 = 0;
  }
  else
  {
    v2 = 0;
  }

  return v2;
}

void sub_18A214D6C(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

id BSProcessDescriptionForAuditToken(_OWORD *a1)
{
  uint64_t v1;

  v1 = BSPIDForAuditToken(a1);
  return BSProcessDescriptionForPID(v1);
}

void sub_18A214DD4(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

BOOL BSMachPortIsUsable(mach_port_name_t a1)
{
  return BSMachPortIsType(a1, 458752);
}

void _BSMachError(int a1, mach_error_t a2, void *a3)
{
  id v5;
  NSObject *v6;
  _BOOL4 v7;
  const char *v8;
  NSObject *v9;
  uint32_t v10;
  int v11;
  const char *v12;
  __int16 v13;
  _BYTE v14[14];
  __int16 v15;
  _WORD v16[17];

  *(_QWORD *)&v16[13] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  BSLogCommon();
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = os_log_type_enabled(v6, OS_LOG_TYPE_ERROR);
  if (a1)
  {
    if (v7)
    {
      v11 = 136447234;
      v12 = "_BSMachError";
      v13 = 1024;
      *(_DWORD *)v14 = a1;
      *(_WORD *)&v14[4] = 2082;
      *(_QWORD *)&v14[6] = mach_error_string(a2);
      v15 = 1024;
      *(_DWORD *)v16 = a2;
      v16[2] = 2114;
      *(_QWORD *)&v16[3] = v5;
      v8 = "%{public}s: port %x; %{public}s (0x%x) \"%{public}@\"";
      v9 = v6;
      v10 = 44;
LABEL_10:
      _os_log_error_impl(&dword_18A184000, v9, OS_LOG_TYPE_ERROR, v8, (uint8_t *)&v11, v10);
    }
  }
  else if (v7)
  {
    v11 = 136315906;
    v12 = "_BSMachError";
    v13 = 2080;
    *(_QWORD *)v14 = mach_error_string(a2);
    *(_WORD *)&v14[8] = 1024;
    *(_DWORD *)&v14[10] = a2;
    v15 = 2114;
    *(_QWORD *)v16 = v5;
    v8 = "%s: %s (0x%x) \"%{public}@\"";
    v9 = v6;
    v10 = 38;
    goto LABEL_10;
  }

  if ((a1 - 1) < 0xFFFFFFFE || a2 != 15)
    _os_assumes_log();

}

void sub_18A214F70(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

BOOL BSMachReceiveRightRelease(mach_port_name_t name)
{
  int v1;
  mach_error_t v2;

  v1 = name;
  if (name - 1 <= 0xFFFFFFFD)
  {
    v2 = mach_port_mod_refs(*MEMORY[0x1E0C83DA0], name, 1u, -1);
    if (v2)
    {
      _BSMachError(v1, v2, CFSTR("Unable to release receive right (modrefs -1)"));
      v1 = 0;
    }
  }
  return (v1 - 1) < 0xFFFFFFFE;
}

BOOL BSMachCreateSendRight(mach_port_name_t name)
{
  int v1;
  mach_error_t inserted;

  v1 = name;
  if (name - 1 <= 0xFFFFFFFD)
  {
    inserted = mach_port_insert_right(*MEMORY[0x1E0C83DA0], name, name, 0x14u);
    if (inserted)
    {
      _BSMachError(v1, inserted, CFSTR("Unable to create send right"));
      v1 = 0;
    }
  }
  return (v1 - 1) < 0xFFFFFFFE;
}

double BSFloatCeilForScale(double a1, double a2)
{
  double v4;
  void *v7;
  void *v8;

  v4 = fabs(a2);
  if (a2 <= 0.0 || v4 < 2.22044605e-16)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler", v4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "CGFloat BSFloatCeilForScale(CGFloat, CGFloat)");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "handleFailureInFunction:file:lineNumber:description:", v8, CFSTR("BSMath.m"), 70, CFSTR("Scale must be specified and cannot be less than or equal to 0."));

  }
  return ceil(a1 * a2) / a2;
}

void sub_18A215120(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

double BSFloatPowerOf2Ceil(double a1)
{
  double result;
  uint64_t v3;
  uint64_t v4;

  result = 0.0;
  if (a1 > 0.0)
  {
    v3 = vcvtpd_u64_f64(a1);
    if ((v3 & (v3 - 1)) != 0)
    {
      do
      {
        v4 = v3;
        v3 &= v3 - 1;
      }
      while (v3);
      v3 = 2 * v4;
    }
    return (double)(unint64_t)v3;
  }
  return result;
}

double BSCGFloatEpsilon()
{
  return 2.22044605e-16;
}

double BSPointRoundForScale(double a1, double a2, double a3)
{
  double v5;

  v5 = BSFloatRoundForScale(a1, a3);
  BSFloatRoundForScale(a2, a3);
  return v5;
}

double BSPointByLinearlyInterpolatingPoints(double a1, double a2, double a3, double a4, double a5)
{
  return a3 * a5 + a1 * (1.0 - a5);
}

uint64_t BSSizeGreaterThanOrEqualToSize(double a1, double a2, double a3, double a4)
{
  double v4;
  _BOOL4 v6;

  v4 = vabdd_f64(a1, a3);
  if (a1 <= a3 && v4 >= 2.22044605e-16)
    return 0;
  v6 = vabdd_f64(a2, a4) < 2.22044605e-16;
  return a2 > a4 || v6;
}

double BSSizeCeilForScale(double a1, double a2, double a3)
{
  double v5;

  v5 = BSFloatCeilForScale(a1, a3);
  BSFloatCeilForScale(a2, a3);
  return v5;
}

double BSRectCenteredAboutPoint(double a1, double a2, double a3, double a4, double a5)
{
  return a5 - a3 * 0.5;
}

double BSRectByLinearlyInterpolatingRects(double a1, double a2, double a3, double a4, double a5, double a6, double a7, double a8, double a9)
{
  return a5 * a9 + a1 * (1.0 - a9);
}

uint64_t BSIntervalOrder(double *a1)
{
  double v1;
  double v2;
  uint64_t v3;

  v1 = a1[2];
  v2 = vabdd_f64(*a1, v1);
  v3 = -1;
  if (*a1 >= v1)
    v3 = 1;
  if (v2 >= 2.22044605e-16)
    return v3;
  else
    return 0;
}

void BSIntervalFractionForValue(double *a1, double a2)
{
  __int128 v2;
  _OWORD v3[2];

  if (vabdd_f64(a1[2], *a1) >= 2.22044605e-16)
  {
    v2 = *((_OWORD *)a1 + 1);
    v3[0] = *(_OWORD *)a1;
    v3[1] = v2;
    BSIntervalClip((double *)v3, a2);
  }
}

double BSIntervalClip(double *a1, double result)
{
  double v2;
  double v3;
  double v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  __int128 *v8;
  double v9;
  double v10;
  double v11;
  _BYTE *v12;
  __int128 v13;
  __int128 v14;

  v2 = *(double *)&v13;
  v3 = *(double *)&v14;
  v4 = vabdd_f64(*(double *)&v13, *(double *)&v14);
  v5 = -1;
  if (*(double *)&v13 >= *(double *)&v14)
    v6 = 1;
  else
    v6 = -1;
  if (v4 >= 2.22044605e-16)
    v7 = v6;
  else
    v7 = 0;
  if (v7)
  {
    v8 = &v13;
    if (v7 == -1)
    {
      v8 = &v14;
      v2 = *(double *)&v14;
    }
    v3 = v2 + -2.22044605e-16;
    if ((*((_BYTE *)v8 + 8) & 1) != 0)
      v3 = v2;
  }
  v9 = *a1;
  v10 = a1[2];
  v11 = vabdd_f64(*a1, v10);
  if (*a1 >= v10)
    v5 = 1;
  if (v11 < 2.22044605e-16)
    v5 = 0;
  if (v5 == -1)
  {
    v12 = a1 + 1;
  }
  else
  {
    if (!v5)
      goto LABEL_22;
    v12 = a1 + 3;
    v9 = a1[2];
  }
  if ((*v12 & 1) == 0)
    v9 = v9 + 2.22044605e-16;
LABEL_22:
  if (v9 >= result)
    result = v9;
  if (v3 <= result)
    return v3;
  return result;
}

double BSIntervalValueForFraction(double *a1, double a2)
{
  double v2;
  double result;

  v2 = a1[2];
  result = *a1 + (v2 - *a1) * a2;
  if (vabdd_f64(v2, *a1) < 2.22044605e-16)
    return a1[2];
  return result;
}

double BSIntervalMin(double *a1)
{
  double result;
  double v2;
  double v3;
  uint64_t v4;
  _BYTE *v5;

  result = *a1;
  v2 = a1[2];
  v3 = vabdd_f64(*a1, v2);
  v4 = -1;
  if (*a1 >= v2)
    v4 = 1;
  if (v3 < 2.22044605e-16)
    v4 = 0;
  if (v4 == -1)
  {
    v5 = a1 + 1;
  }
  else
  {
    if (!v4)
      return result;
    v5 = a1 + 3;
    result = a1[2];
  }
  if ((*v5 & 1) == 0)
    return result + 2.22044605e-16;
  return result;
}

double BSIntervalMax(uint64_t a1)
{
  double v1;
  double result;
  double v3;
  uint64_t v4;

  v1 = *(double *)a1;
  result = *(double *)(a1 + 16);
  v3 = vabdd_f64(*(double *)a1, result);
  v4 = -1;
  if (*(double *)a1 >= result)
    v4 = 1;
  if (v3 < 2.22044605e-16)
    v4 = 0;
  if (v4)
  {
    if (v4 == -1)
    {
      v1 = *(double *)(a1 + 16);
      a1 += 16;
    }
    result = v1 + -2.22044605e-16;
    if ((*(_BYTE *)(a1 + 8) & 1) != 0)
      return v1;
  }
  return result;
}

double BSIntervalSubIntervalFractionForValue(_OWORD *a1, double *a2, double a3)
{
  __int128 v4;
  double v5;
  __int128 v7;
  uint64_t v8;
  uint64_t v9;
  _OWORD v10[2];

  v4 = a1[1];
  v10[0] = *a1;
  v10[1] = v4;
  BSIntervalFractionForValue((double *)v10, a3);
  v7 = 0u;
  v9 = 1;
  v8 = 0x3FF0000000000000;
  BYTE8(v7) = 1;
  return BSIntervalClip((double *)&v7, (v5 - *a2) / (a2[2] - *a2));
}

double BSIntervalSubIntervalValueForValue(_OWORD *a1, _OWORD *a2, double *a3, double a4)
{
  __int128 v5;
  __int128 v6;
  double v7;
  double v8;
  double result;
  _OWORD v10[2];
  _OWORD v11[2];

  v5 = a1[1];
  v11[0] = *a1;
  v11[1] = v5;
  v6 = a2[1];
  v10[0] = *a2;
  v10[1] = v6;
  v7 = BSIntervalSubIntervalFractionForValue(v11, (double *)v10, a4);
  v8 = a3[2];
  result = *a3 + (v8 - *a3) * v7;
  if (vabdd_f64(v8, *a3) < 2.22044605e-16)
    return a3[2];
  return result;
}

double BSIntervalInterpolate(_OWORD *a1, void *a2, double a3)
{
  id v5;
  void *v6;
  double (*v7)(id, _OWORD *, double);
  __int128 v8;
  _OWORD v10[2];

  v5 = a2;
  v6 = v5;
  if (v5)
  {
    v7 = (double (*)(id, _OWORD *, double))*((_QWORD *)v5 + 2);
    v8 = a1[1];
    v10[0] = *a1;
    v10[1] = v8;
    a3 = v7(v5, v10, a3);
  }

  return a3;
}

void sub_18A215644(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

uint64_t NSStringFromInterval(uint64_t a1)
{
  const __CFString *v1;
  const __CFString *v2;

  v1 = CFSTR("[");
  if (!*(_BYTE *)(a1 + 8))
    v1 = CFSTR("(");
  if (*(_BYTE *)(a1 + 24))
    v2 = CFSTR("]");
  else
    v2 = CFSTR(")");
  return objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("<BSInterval: %@%.2f, %.2f%@>"), v1, *(_QWORD *)a1, *(_QWORD *)(a1 + 16), v2);
}

double BSIntervalMap(__int128 *a1, __int128 *a2, double a3)
{
  double v3;
  char v4;
  double v5;
  char v6;
  double v7;
  uint64_t v8;
  double v9;
  char v10;
  __int128 v11;
  double v12;
  double v13;
  double v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  __int128 *v18;
  double v19;
  char v20;
  double v21;
  char v22;
  double v23;
  double v24;
  char v25;
  __int128 v26;
  double v27;
  double v28;
  double v29;
  uint64_t v30;
  uint64_t v31;
  __int128 *v32;
  __int128 v34;
  __int128 v35;

  v3 = *(double *)a1;
  v4 = *((_BYTE *)a1 + 8);
  v5 = *((double *)a1 + 2);
  v6 = *((_BYTE *)a1 + 24);
  v7 = vabdd_f64(*(double *)a1, v5);
  v8 = -1;
  if (*(double *)a1 >= v5)
    v8 = 1;
  if (v7 < 2.22044605e-16)
    v8 = 0;
  v9 = *(double *)a1;
  v10 = *((_BYTE *)a1 + 8);
  if (v8 != -1)
  {
    v9 = *(double *)a1;
    if (!v8)
      goto LABEL_10;
    v9 = *((double *)a1 + 2);
    v10 = *((_BYTE *)a1 + 24);
  }
  if ((v10 & 1) == 0)
    v9 = v9 + 2.22044605e-16;
LABEL_10:
  v11 = a2[1];
  v34 = *a2;
  v35 = v11;
  v12 = *(double *)&v34;
  v13 = *(double *)&v35;
  v14 = vabdd_f64(*(double *)&v34, *(double *)&v35);
  v15 = -1;
  if (*(double *)&v34 >= *(double *)&v35)
    v16 = 1;
  else
    v16 = -1;
  if (v14 >= 2.22044605e-16)
    v17 = v16;
  else
    v17 = 0;
  if (v17)
  {
    v18 = &v34;
    if (v17 == -1)
    {
      v18 = &v35;
      v12 = *(double *)&v35;
    }
    v13 = v12 + -2.22044605e-16;
    if ((*((_BYTE *)v18 + 8) & 1) != 0)
      v13 = v12;
  }
  v19 = *(double *)a2;
  v20 = *((_BYTE *)a2 + 8);
  v21 = *((double *)a2 + 2);
  v22 = *((_BYTE *)a2 + 24);
  v23 = vabdd_f64(*(double *)a2, v21);
  if (*(double *)a2 >= v21)
    v15 = 1;
  if (v23 < 2.22044605e-16)
    v15 = 0;
  v24 = *(double *)a2;
  v25 = *((_BYTE *)a2 + 8);
  if (v15 != -1)
  {
    v24 = *(double *)a2;
    if (!v15)
      goto LABEL_30;
    v24 = *((double *)a2 + 2);
    v25 = *((_BYTE *)a2 + 24);
  }
  if ((v25 & 1) == 0)
    v24 = v24 + 2.22044605e-16;
LABEL_30:
  v26 = a1[1];
  v34 = *a1;
  v35 = v26;
  v27 = *(double *)&v34;
  v28 = *(double *)&v35;
  v29 = vabdd_f64(*(double *)&v34, *(double *)&v35);
  v30 = -1;
  if (*(double *)&v34 >= *(double *)&v35)
    v30 = 1;
  if (v29 >= 2.22044605e-16)
    v31 = v30;
  else
    v31 = 0;
  if (v31)
  {
    v32 = &v34;
    if (v31 == -1)
    {
      v32 = &v35;
      v27 = *(double *)&v35;
    }
    v28 = v27 + -2.22044605e-16;
    if ((*((_BYTE *)v32 + 8) & 1) != 0)
      v28 = v27;
  }
  if (v8 == -1)
  {
    v5 = v3;
    v6 = v4;
  }
  else if (!v8)
  {
    goto LABEL_46;
  }
  v3 = v5 + 2.22044605e-16;
  if ((v6 & 1) != 0)
    v3 = v5;
LABEL_46:
  if (v15 == -1)
  {
    v21 = v19;
    v22 = v20;
  }
  else if (!v15)
  {
    return (a3 - v9) * (v13 - v24) / (v28 - v3) + v19;
  }
  if ((v22 & 1) != 0)
    v19 = v21;
  else
    v19 = v21 + 2.22044605e-16;
  return (a3 - v9) * (v13 - v24) / (v28 - v3) + v19;
}

CFAbsoluteTime CFAbsoluteTimeGetCurrent(void)
{
  CFAbsoluteTime result;

  MEMORY[0x1E0C97C58]();
  return result;
}

CFAllocatorRef CFAllocatorCreate(CFAllocatorRef allocator, CFAllocatorContext *context)
{
  return (CFAllocatorRef)MEMORY[0x1E0C97CA8](allocator, context);
}

void CFArrayAppendValue(CFMutableArrayRef theArray, const void *value)
{
  MEMORY[0x1E0C97CF8](theArray, value);
}

CFMutableArrayRef CFArrayCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFArrayCallBacks *callBacks)
{
  return (CFMutableArrayRef)MEMORY[0x1E0C97D38](allocator, capacity, callBacks);
}

CFIndex CFArrayGetCount(CFArrayRef theArray)
{
  return MEMORY[0x1E0C97D60](theArray);
}

const void *__cdecl CFArrayGetValueAtIndex(CFArrayRef theArray, CFIndex idx)
{
  return (const void *)MEMORY[0x1E0C97D98](theArray, idx);
}

void CFArrayRemoveValueAtIndex(CFMutableArrayRef theArray, CFIndex idx)
{
  MEMORY[0x1E0C97DC0](theArray, idx);
}

CFTypeID CFBooleanGetTypeID(void)
{
  return MEMORY[0x1E0C97FC8]();
}

Boolean CFBooleanGetValue(CFBooleanRef BOOLean)
{
  return MEMORY[0x1E0C97FE0](BOOLean);
}

CFURLRef CFBundleCopyBundleURL(CFBundleRef bundle)
{
  return (CFURLRef)MEMORY[0x1E0C98000](bundle);
}

CFURLRef CFBundleCopyExecutableURL(CFBundleRef bundle)
{
  return (CFURLRef)MEMORY[0x1E0C98020](bundle);
}

CFDictionaryRef CFBundleCopyInfoDictionaryForURL(CFURLRef url)
{
  return (CFDictionaryRef)MEMORY[0x1E0C98028](url);
}

CFDictionaryRef CFBundleCopyInfoDictionaryInDirectory(CFURLRef bundleURL)
{
  return (CFDictionaryRef)MEMORY[0x1E0C98030](bundleURL);
}

CFStringRef CFBundleCopyLocalizedString(CFBundleRef bundle, CFStringRef key, CFStringRef value, CFStringRef tableName)
{
  return (CFStringRef)MEMORY[0x1E0C98050](bundle, key, value, tableName);
}

CFURLRef CFBundleCopyResourceURL(CFBundleRef bundle, CFStringRef resourceName, CFStringRef resourceType, CFStringRef subDirName)
{
  return (CFURLRef)MEMORY[0x1E0C98080](bundle, resourceName, resourceType, subDirName);
}

CFArrayRef CFBundleCopyResourceURLsOfType(CFBundleRef bundle, CFStringRef resourceType, CFStringRef subDirName)
{
  return (CFArrayRef)MEMORY[0x1E0C98098](bundle, resourceType, subDirName);
}

CFStringRef CFBundleGetIdentifier(CFBundleRef bundle)
{
  return (CFStringRef)MEMORY[0x1E0C98120](bundle);
}

CFDictionaryRef CFBundleGetInfoDictionary(CFBundleRef bundle)
{
  return (CFDictionaryRef)MEMORY[0x1E0C98130](bundle);
}

CFDictionaryRef CFBundleGetLocalInfoDictionary(CFBundleRef bundle)
{
  return (CFDictionaryRef)MEMORY[0x1E0C98138](bundle);
}

Boolean CFBundleIsExecutableLoaded(CFBundleRef bundle)
{
  return MEMORY[0x1E0C98190](bundle);
}

Boolean CFCalendarAddComponents(CFCalendarRef calendar, CFAbsoluteTime *at, CFOptionFlags options, const char *componentDesc, ...)
{
  return MEMORY[0x1E0C98220](calendar, at, options, componentDesc);
}

Boolean CFCalendarComposeAbsoluteTime(CFCalendarRef calendar, CFAbsoluteTime *at, const char *componentDesc, ...)
{
  return MEMORY[0x1E0C98228](calendar, at, componentDesc);
}

CFCalendarRef CFCalendarCopyCurrent(void)
{
  return (CFCalendarRef)MEMORY[0x1E0C98230]();
}

Boolean CFCalendarDecomposeAbsoluteTime(CFCalendarRef calendar, CFAbsoluteTime at, const char *componentDesc, ...)
{
  uint64_t v3;
  va_list va;

  va_start(va, componentDesc);
  v3 = va_arg(va, _QWORD);
  return MEMORY[0x1E0C98248](calendar, v3, at);
}

Boolean CFCalendarGetTimeRangeOfUnit(CFCalendarRef calendar, CFCalendarUnit unit, CFAbsoluteTime at, CFAbsoluteTime *startp, CFTimeInterval *tip)
{
  return MEMORY[0x1E0C98278](calendar, unit, startp, tip, at);
}

CFDataRef CFDataCreateWithBytesNoCopy(CFAllocatorRef allocator, const UInt8 *bytes, CFIndex length, CFAllocatorRef bytesDeallocator)
{
  return (CFDataRef)MEMORY[0x1E0C983C8](allocator, bytes, length, bytesDeallocator);
}

const UInt8 *__cdecl CFDataGetBytePtr(CFDataRef theData)
{
  return (const UInt8 *)MEMORY[0x1E0C983E0](theData);
}

CFIndex CFDataGetLength(CFDataRef theData)
{
  return MEMORY[0x1E0C983F8](theData);
}

CFTypeID CFDataGetTypeID(void)
{
  return MEMORY[0x1E0C98418]();
}

CFIndex CFDictionaryGetCount(CFDictionaryRef theDict)
{
  return MEMORY[0x1E0C98570](theDict);
}

const void *__cdecl CFDictionaryGetValue(CFDictionaryRef theDict, const void *key)
{
  return (const void *)MEMORY[0x1E0C985B8](theDict, key);
}

Boolean CFEqual(CFTypeRef cf1, CFTypeRef cf2)
{
  return MEMORY[0x1E0C98620](cf1, cf2);
}

CFTypeID CFGetTypeID(CFTypeRef cf)
{
  return MEMORY[0x1E0C98738](cf);
}

void CFNotificationCenterAddObserver(CFNotificationCenterRef center, const void *observer, CFNotificationCallback callBack, CFStringRef name, const void *object, CFNotificationSuspensionBehavior suspensionBehavior)
{
  MEMORY[0x1E0C988B0](center, observer, callBack, name, object, suspensionBehavior);
}

CFNotificationCenterRef CFNotificationCenterGetDarwinNotifyCenter(void)
{
  return (CFNotificationCenterRef)MEMORY[0x1E0C988B8]();
}

void CFNotificationCenterRemoveObserver(CFNotificationCenterRef center, const void *observer, CFNotificationName name, const void *object)
{
  MEMORY[0x1E0C98900](center, observer, name, object);
}

void CFRelease(CFTypeRef cf)
{
  MEMORY[0x1E0C98BC0](cf);
}

CFTypeRef CFRetain(CFTypeRef cf)
{
  return (CFTypeRef)MEMORY[0x1E0C98BD0](cf);
}

void CFRunLoopAddObserver(CFRunLoopRef rl, CFRunLoopObserverRef observer, CFRunLoopMode mode)
{
  MEMORY[0x1E0C98BE8](rl, observer, mode);
}

void CFRunLoopAddSource(CFRunLoopRef rl, CFRunLoopSourceRef source, CFRunLoopMode mode)
{
  MEMORY[0x1E0C98BF8](rl, source, mode);
}

Boolean CFRunLoopContainsObserver(CFRunLoopRef rl, CFRunLoopObserverRef observer, CFRunLoopMode mode)
{
  return MEMORY[0x1E0C98C08](rl, observer, mode);
}

CFRunLoopRef CFRunLoopGetCurrent(void)
{
  return (CFRunLoopRef)MEMORY[0x1E0C98C30]();
}

CFRunLoopRef CFRunLoopGetMain(void)
{
  return (CFRunLoopRef)MEMORY[0x1E0C98C40]();
}

CFRunLoopObserverRef CFRunLoopObserverCreate(CFAllocatorRef allocator, CFOptionFlags activities, Boolean repeats, CFIndex order, CFRunLoopObserverCallBack callout, CFRunLoopObserverContext *context)
{
  return (CFRunLoopObserverRef)MEMORY[0x1E0C98C60](allocator, activities, repeats, order, callout, context);
}

CFRunLoopObserverRef CFRunLoopObserverCreateWithHandler(CFAllocatorRef allocator, CFOptionFlags activities, Boolean repeats, CFIndex order, void *block)
{
  return (CFRunLoopObserverRef)MEMORY[0x1E0C98C68](allocator, activities, repeats, order, block);
}

void CFRunLoopPerformBlock(CFRunLoopRef rl, CFTypeRef mode, void *block)
{
  MEMORY[0x1E0C98C80](rl, mode, block);
}

void CFRunLoopRemoveObserver(CFRunLoopRef rl, CFRunLoopObserverRef observer, CFRunLoopMode mode)
{
  MEMORY[0x1E0C98C88](rl, observer, mode);
}

void CFRunLoopRun(void)
{
  MEMORY[0x1E0C98CA8]();
}

CFRunLoopSourceRef CFRunLoopSourceCreate(CFAllocatorRef allocator, CFIndex order, CFRunLoopSourceContext *context)
{
  return (CFRunLoopSourceRef)MEMORY[0x1E0C98CC8](allocator, order, context);
}

void CFRunLoopSourceGetContext(CFRunLoopSourceRef source, CFRunLoopSourceContext *context)
{
  MEMORY[0x1E0C98CD0](source, context);
}

CFIndex CFSetGetCount(CFSetRef theSet)
{
  return MEMORY[0x1E0C98DA8](theSet);
}

void CFStringAppendCString(CFMutableStringRef theString, const char *cStr, CFStringEncoding encoding)
{
  MEMORY[0x1E0C98EE0](theString, cStr, *(_QWORD *)&encoding);
}

void CFStringAppendFormatAndArguments(CFMutableStringRef theString, CFDictionaryRef formatOptions, CFStringRef format, va_list arguments)
{
  MEMORY[0x1E0C98EF8](theString, formatOptions, format, arguments);
}

CFStringRef CFStringCreateWithBytes(CFAllocatorRef alloc, const UInt8 *bytes, CFIndex numBytes, CFStringEncoding encoding, Boolean isExternalRepresentation)
{
  return (CFStringRef)MEMORY[0x1E0C98FB8](alloc, bytes, numBytes, *(_QWORD *)&encoding, isExternalRepresentation);
}

CFStringRef CFStringCreateWithFileSystemRepresentation(CFAllocatorRef alloc, const char *buffer)
{
  return (CFStringRef)MEMORY[0x1E0C99008](alloc, buffer);
}

CFStringRef CFStringCreateWithFormat(CFAllocatorRef alloc, CFDictionaryRef formatOptions, CFStringRef format, ...)
{
  return (CFStringRef)MEMORY[0x1E0C99018](alloc, formatOptions, format);
}

CFIndex CFStringGetBytes(CFStringRef theString, CFRange range, CFStringEncoding encoding, UInt8 lossByte, Boolean isExternalRepresentation, UInt8 *buffer, CFIndex maxBufLen, CFIndex *usedBufLen)
{
  return MEMORY[0x1E0C99080](theString, range.location, range.length, *(_QWORD *)&encoding, lossByte, isExternalRepresentation, buffer, maxBufLen);
}

Boolean CFStringHasPrefix(CFStringRef theString, CFStringRef prefix)
{
  return MEMORY[0x1E0C99180](theString, prefix);
}

BOOL CGAffineTransformEqualToTransform(CGAffineTransform *t1, CGAffineTransform *t2)
{
  return MEMORY[0x1E0C9BAA0](t1, t2);
}

CGColorRef CGColorCreate(CGColorSpaceRef space, const CGFloat *components)
{
  return (CGColorRef)MEMORY[0x1E0C9BC78](space, components);
}

void CGColorRelease(CGColorRef color)
{
  MEMORY[0x1E0C9BD60](color);
}

CGColorSpaceRef CGColorSpaceCreateDeviceRGB(void)
{
  return (CGColorSpaceRef)MEMORY[0x1E0C9BDF0]();
}

CGColorSpaceRef CGColorSpaceCreateWithPropertyList(CFPropertyListRef plist)
{
  return (CGColorSpaceRef)MEMORY[0x1E0C9BE60](plist);
}

void CGColorSpaceRelease(CGColorSpaceRef space)
{
  MEMORY[0x1E0C9BF30](space);
}

CGDataProviderRef CGDataProviderCreateWithData(void *info, const void *data, size_t size, CGDataProviderReleaseDataCallback releaseData)
{
  return (CGDataProviderRef)MEMORY[0x1E0C9C600](info, data, size, releaseData);
}

void CGDataProviderRelease(CGDataProviderRef provider)
{
  MEMORY[0x1E0C9C638](provider);
}

CGImageRef CGImageCreate(size_t width, size_t height, size_t bitsPerComponent, size_t bitsPerPixel, size_t bytesPerRow, CGColorSpaceRef space, CGBitmapInfo bitmapInfo, CGDataProviderRef provider, const CGFloat *decode, BOOL shouldInterpolate, CGColorRenderingIntent intent)
{
  return (CGImageRef)MEMORY[0x1E0C9CB80](width, height, bitsPerComponent, bitsPerPixel, bytesPerRow, space, *(_QWORD *)&bitmapInfo, provider);
}

uint64_t CGImageCreateFromIOSurface()
{
  return MEMORY[0x1E0CBC2D8]();
}

uint64_t CGImageSetProperty()
{
  return MEMORY[0x1E0C9CDC0]();
}

BOOL CGRectEqualToRect(CGRect rect1, CGRect rect2)
{
  return MEMORY[0x1E0C9D570]((__n128)rect1.origin, *(__n128 *)&rect1.origin.y, (__n128)rect1.size, *(__n128 *)&rect1.size.height, (__n128)rect2.origin, *(__n128 *)&rect2.origin.y, (__n128)rect2.size, *(__n128 *)&rect2.size.height);
}

CGFloat CGRectGetMidX(CGRect rect)
{
  CGFloat result;

  MEMORY[0x1E0C9D5A8]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMidY(CGRect rect)
{
  CGFloat result;

  MEMORY[0x1E0C9D5B0]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

IOReturn IOAllowPowerChange(io_connect_t kernelPort, intptr_t notificationID)
{
  return MEMORY[0x1E0CBAD20](*(_QWORD *)&kernelPort, notificationID);
}

IOReturn IOCancelPowerChange(io_connect_t kernelPort, intptr_t notificationID)
{
  return MEMORY[0x1E0CBAD50](*(_QWORD *)&kernelPort, notificationID);
}

IOReturn IODeregisterForSystemPower(io_object_t *notifier)
{
  return MEMORY[0x1E0CBAE38](notifier);
}

void IONotificationPortDestroy(IONotificationPortRef notify)
{
  MEMORY[0x1E0CBB6A0](notify);
}

void IONotificationPortSetDispatchQueue(IONotificationPortRef notify, dispatch_queue_t queue)
{
  MEMORY[0x1E0CBB6B8](notify, queue);
}

kern_return_t IOObjectRelease(io_object_t object)
{
  return MEMORY[0x1E0CBB6F0](*(_QWORD *)&object);
}

io_connect_t IORegisterForSystemPower(void *refcon, IONotificationPortRef *thePortRef, IOServiceInterestCallback callback, io_object_t *notifier)
{
  return MEMORY[0x1E0CBB8D8](refcon, thePortRef, callback, notifier);
}

CFTypeRef IORegistryEntryCreateCFProperty(io_registry_entry_t entry, CFStringRef key, CFAllocatorRef allocator, IOOptionBits options)
{
  return (CFTypeRef)MEMORY[0x1E0CBB900](*(_QWORD *)&entry, key, allocator, *(_QWORD *)&options);
}

io_registry_entry_t IORegistryEntryFromPath(mach_port_t mainPort, const io_string_t path)
{
  return MEMORY[0x1E0CBB918](*(_QWORD *)&mainPort, path);
}

kern_return_t IOServiceClose(io_connect_t connect)
{
  return MEMORY[0x1E0CBB9D0](*(_QWORD *)&connect);
}

size_t IOSurfaceAlignProperty(CFStringRef property, size_t value)
{
  return MEMORY[0x1E0CBBAC0](property, value);
}

CFTypeRef IOSurfaceCopyValue(IOSurfaceRef buffer, CFStringRef key)
{
  return (CFTypeRef)MEMORY[0x1E0CBBAE8](buffer, key);
}

xpc_object_t IOSurfaceCreateXPCObject(IOSurfaceRef aSurface)
{
  return (xpc_object_t)MEMORY[0x1E0CBBB10](aSurface);
}

uint64_t IOSurfaceGetBulkAttachments()
{
  return MEMORY[0x1E0CBBB70]();
}

size_t IOSurfaceGetPropertyMaximum(CFStringRef property)
{
  return MEMORY[0x1E0CBBC88](property);
}

IOSurfaceRef IOSurfaceLookupFromXPCObject(xpc_object_t xobj)
{
  return (IOSurfaceRef)MEMORY[0x1E0CBBD48](xobj);
}

uint64_t MGCopyAnswer()
{
  return MEMORY[0x1E0DE2B20]();
}

uint64_t MGCopyMultipleAnswers()
{
  return MEMORY[0x1E0DE2B40]();
}

uint64_t MGGetBoolAnswer()
{
  return MEMORY[0x1E0DE2B50]();
}

uint64_t MGGetSInt32Answer()
{
  return MEMORY[0x1E0DE2B70]();
}

NSArray *__cdecl NSAllMapTableKeys(NSMapTable *table)
{
  return (NSArray *)MEMORY[0x1E0CB2850](table);
}

NSArray *__cdecl NSAllMapTableValues(NSMapTable *table)
{
  return (NSArray *)MEMORY[0x1E0CB2858](table);
}

Class NSClassFromString(NSString *aClassName)
{
  return (Class)MEMORY[0x1E0CB28A0](aClassName);
}

NSUInteger NSCountHashTable(NSHashTable *table)
{
  return MEMORY[0x1E0CB28D8](table);
}

void NSEndMapTableEnumeration(NSMapEnumerator *enumerator)
{
  MEMORY[0x1E0CB29A0](enumerator);
}

NSMapEnumerator *__cdecl NSEnumerateMapTable(NSMapEnumerator *__return_ptr retstr, NSMapTable *table)
{
  return (NSMapEnumerator *)MEMORY[0x1E0CB29B0](retstr, table);
}

const char *__cdecl NSGetSizeAndAlignment(const char *typePtr, NSUInteger *sizep, NSUInteger *alignp)
{
  return (const char *)MEMORY[0x1E0C99758](typePtr, sizep, alignp);
}

void *__cdecl NSHashGet(NSHashTable *table, const void *pointer)
{
  return (void *)MEMORY[0x1E0CB2BD0](table, pointer);
}

void *__cdecl NSHashInsertIfAbsent(NSHashTable *table, const void *pointer)
{
  return (void *)MEMORY[0x1E0CB2BE0](table, pointer);
}

void NSHashRemove(NSHashTable *table, const void *pointer)
{
  MEMORY[0x1E0CB2BF0](table, pointer);
}

NSString *NSHomeDirectory(void)
{
  return (NSString *)MEMORY[0x1E0CB2C00]();
}

void *__cdecl NSMapGet(NSMapTable *table, const void *key)
{
  return (void *)MEMORY[0x1E0CB2DA0](table, key);
}

void NSMapInsert(NSMapTable *table, const void *key, const void *value)
{
  MEMORY[0x1E0CB2DA8](table, key, value);
}

void NSMapInsertKnownAbsent(NSMapTable *table, const void *key, const void *value)
{
  MEMORY[0x1E0CB2DB8](table, key, value);
}

BOOL NSMapMember(NSMapTable *table, const void *key, void **originalKey, void **value)
{
  return MEMORY[0x1E0CB2DC0](table, key, originalKey, value);
}

void NSMapRemove(NSMapTable *table, const void *key)
{
  MEMORY[0x1E0CB2DC8](table, key);
}

BOOL NSNextMapEnumeratorPair(NSMapEnumerator *enumerator, void **key, void **value)
{
  return MEMORY[0x1E0CB2F88](enumerator, key, value);
}

uint64_t NSPopAutoreleasePool()
{
  return MEMORY[0x1E0CB3038]();
}

Protocol *__cdecl NSProtocolFromString(NSString *namestr)
{
  return (Protocol *)MEMORY[0x1E0CB3118](namestr);
}

uint64_t NSPushAutoreleasePool()
{
  return MEMORY[0x1E0CB3120]();
}

NSArray *__cdecl NSSearchPathForDirectoriesInDomains(NSSearchPathDirectory directory, NSSearchPathDomainMask domainMask, BOOL expandTilde)
{
  return (NSArray *)MEMORY[0x1E0CB3178](directory, domainMask, expandTilde);
}

SEL NSSelectorFromString(NSString *aSelectorName)
{
  return (SEL)MEMORY[0x1E0CB3190](aSelectorName);
}

uint64_t NSStringFromBOOL()
{
  return MEMORY[0x1E0CB31F8]();
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x1E0CB3200](aClass);
}

NSString *__cdecl NSStringFromProtocol(Protocol *proto)
{
  return (NSString *)MEMORY[0x1E0CB3218](proto);
}

NSString *__cdecl NSStringFromRange(NSRange range)
{
  return (NSString *)MEMORY[0x1E0CB3220](range.location, range.length);
}

NSString *__cdecl NSStringFromSelector(SEL aSelector)
{
  return (NSString *)MEMORY[0x1E0CB3230](aSelector);
}

uint64_t PBDataWriterPlaceMark()
{
  return MEMORY[0x1E0D82BF8]();
}

uint64_t PBDataWriterRecallMark()
{
  return MEMORY[0x1E0D82C00]();
}

uint64_t PBDataWriterWriteBOOLField()
{
  return MEMORY[0x1E0D82C10]();
}

uint64_t PBDataWriterWriteDataField()
{
  return MEMORY[0x1E0D82C28]();
}

uint64_t PBDataWriterWriteDoubleField()
{
  return MEMORY[0x1E0D82C38]();
}

uint64_t PBDataWriterWriteFloatField()
{
  return MEMORY[0x1E0D82C50]();
}

uint64_t PBDataWriterWriteStringField()
{
  return MEMORY[0x1E0D82C98]();
}

uint64_t PBDataWriterWriteUint64Field()
{
  return MEMORY[0x1E0D82CC0]();
}

uint64_t PBReaderPlaceMark()
{
  return MEMORY[0x1E0D82CE0]();
}

uint64_t PBReaderReadData()
{
  return MEMORY[0x1E0D82CF0]();
}

uint64_t PBReaderReadString()
{
  return MEMORY[0x1E0D82D00]();
}

uint64_t PBReaderRecallMark()
{
  return MEMORY[0x1E0D82D10]();
}

uint64_t PBReaderSkipValueWithTag()
{
  return MEMORY[0x1E0D82D28]();
}

CFTypeRef SecTaskCopyValueForEntitlement(SecTaskRef task, CFStringRef entitlement, CFErrorRef *error)
{
  return (CFTypeRef)MEMORY[0x1E0CD65F0](task, entitlement, error);
}

SecTaskRef SecTaskCreateWithAuditToken(CFAllocatorRef allocator, audit_token_t *token)
{
  return (SecTaskRef)MEMORY[0x1E0CD6620](allocator, token);
}

uint32_t SecTaskGetCodeSignStatus(SecTaskRef task)
{
  return MEMORY[0x1E0CD6638](task);
}

void _Block_object_assign(void *a1, const void *a2, const int a3)
{
  MEMORY[0x1E0C80940](a1, a2, *(_QWORD *)&a3);
}

void _Block_object_dispose(const void *a1, const int a2)
{
  MEMORY[0x1E0C80948](a1, *(_QWORD *)&a2);
}

uint64_t _CFBundleCopyBundleURLForExecutableURL()
{
  return MEMORY[0x1E0C99F70]();
}

uint64_t _CFBundleCreateUnique()
{
  return MEMORY[0x1E0C99FF0]();
}

uint64_t _CFCopySystemVersionDictionary()
{
  return MEMORY[0x1E0C9A0D0]();
}

uint64_t _CFPreferencesHasAppValue()
{
  return MEMORY[0x1E0C9A348]();
}

uint64_t _CFRunLoopSetPerCalloutAutoreleasepoolEnabled()
{
  return MEMORY[0x1E0C9A488]();
}

uint64_t _CFXPCCreateCFObjectFromXPCObject()
{
  return MEMORY[0x1E0C9A800]();
}

uint64_t _CFXPCCreateXPCObjectFromCFObject()
{
  return MEMORY[0x1E0C9A818]();
}

uint64_t _NSIsNSArray()
{
  return MEMORY[0x1E0C9A860]();
}

uint64_t _NSIsNSDictionary()
{
  return MEMORY[0x1E0C9A888]();
}

uint64_t _NSIsNSNumber()
{
  return MEMORY[0x1E0C9A890]();
}

uint64_t _NSIsNSOrderedSet()
{
  return MEMORY[0x1E0C9A8A0]();
}

uint64_t _NSIsNSSet()
{
  return MEMORY[0x1E0C9A8A8]();
}

uint64_t _NSIsNSString()
{
  return MEMORY[0x1E0C9A8B0]();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
  MEMORY[0x1E0C80A20](exception_object);
}

void __assert_rtn(const char *a1, const char *a2, int a3, const char *a4)
{
  MEMORY[0x1E0C80A58](a1, a2, *(_QWORD *)&a3, a4);
}

int *__error(void)
{
  return (int *)MEMORY[0x1E0C80AC0]();
}

uint64_t __strlcpy_chk()
{
  return MEMORY[0x1E0C80C48]();
}

uint64_t _dyld_is_memory_immutable()
{
  return MEMORY[0x1E0C80EC8]();
}

uint64_t _os_assert_log()
{
  return MEMORY[0x1E0C80FF0]();
}

uint64_t _os_assumes_log()
{
  return MEMORY[0x1E0C80FF8]();
}

uint64_t _os_crash()
{
  return MEMORY[0x1E0C81000]();
}

void _os_log_debug_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x1E0C81020](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x1E0C81038](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_log_fault_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x1E0C81040](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x1E0C81048](dso, log, type, format, buf, *(_QWORD *)&size);
}

uint64_t _protocol_getMethodTypeEncoding()
{
  return MEMORY[0x1E0DE7A40]();
}

uint64_t _sl_dlopen()
{
  return MEMORY[0x1E0DA88F0]();
}

void abort(void)
{
  MEMORY[0x1E0C813A8]();
}

int asprintf(char **a1, const char *a2, ...)
{
  return MEMORY[0x1E0C81608](a1, a2);
}

long double atan2(long double __y, long double __x)
{
  long double result;

  MEMORY[0x1E0C81620](__y, __x);
  return result;
}

au_asid_t audit_token_to_asid(audit_token_t *atoken)
{
  return MEMORY[0x1E0DE40C0](atoken);
}

uid_t audit_token_to_auid(audit_token_t *atoken)
{
  return MEMORY[0x1E0DE40D0](atoken);
}

gid_t audit_token_to_egid(audit_token_t *atoken)
{
  return MEMORY[0x1E0DE40D8](atoken);
}

uid_t audit_token_to_euid(audit_token_t *atoken)
{
  return MEMORY[0x1E0DE40E0](atoken);
}

pid_t audit_token_to_pid(audit_token_t *atoken)
{
  return MEMORY[0x1E0DE40F0](atoken);
}

int audit_token_to_pidversion(audit_token_t *atoken)
{
  return MEMORY[0x1E0DE40F8](atoken);
}

gid_t audit_token_to_rgid(audit_token_t *atoken)
{
  return MEMORY[0x1E0DE4100](atoken);
}

uid_t audit_token_to_ruid(audit_token_t *atoken)
{
  return MEMORY[0x1E0DE4108](atoken);
}

uint64_t bootstrap_check_in2()
{
  return MEMORY[0x1E0C81700]();
}

kern_return_t bootstrap_look_up(mach_port_t bp, const name_t service_name, mach_port_t *sp)
{
  return MEMORY[0x1E0C81708](*(_QWORD *)&bp, service_name, sp);
}

uint64_t bootstrap_register2()
{
  return MEMORY[0x1E0C81728]();
}

void bzero(void *a1, size_t a2)
{
  MEMORY[0x1E0C81758](a1, a2);
}

BOOL class_addMethod(Class cls, SEL name, IMP imp, const char *types)
{
  return MEMORY[0x1E0DE7A50](cls, name, imp, types);
}

Method *__cdecl class_copyMethodList(Class cls, unsigned int *outCount)
{
  return (Method *)MEMORY[0x1E0DE7A78](cls, outCount);
}

objc_property_t *__cdecl class_copyPropertyList(Class cls, unsigned int *outCount)
{
  return (objc_property_t *)MEMORY[0x1E0DE7A80](cls, outCount);
}

Method class_getInstanceMethod(Class cls, SEL name)
{
  return (Method)MEMORY[0x1E0DE7AA8](cls, name);
}

Ivar class_getInstanceVariable(Class cls, const char *name)
{
  return (Ivar)MEMORY[0x1E0DE7AB8](cls, name);
}

const char *__cdecl class_getName(Class cls)
{
  return (const char *)MEMORY[0x1E0DE7AC8](cls);
}

Class class_getSuperclass(Class cls)
{
  return (Class)MEMORY[0x1E0DE7AD8](cls);
}

int clock_gettime(clockid_t __clock_id, timespec *__tp)
{
  return MEMORY[0x1E0C82668](*(_QWORD *)&__clock_id, __tp);
}

int close(int a1)
{
  return MEMORY[0x1E0C82688](*(_QWORD *)&a1);
}

uint64_t container_system_path_for_identifier()
{
  return MEMORY[0x1E0C82A98]();
}

void dispatch_activate(dispatch_object_t object)
{
  MEMORY[0x1E0C82BC0](object);
}

void dispatch_after(dispatch_time_t when, dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x1E0C82BC8](when, queue, block);
}

void dispatch_assert_queue_V2(dispatch_queue_t queue)
{
  MEMORY[0x1E0C82BE8](queue);
}

void dispatch_assert_queue_barrier(dispatch_queue_t queue)
{
  MEMORY[0x1E0C82BF0](queue);
}

void dispatch_assert_queue_not_V2(dispatch_queue_t queue)
{
  MEMORY[0x1E0C82BF8](queue);
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x1E0C82C00](queue, block);
}

void dispatch_async_and_wait(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x1E0C82C08](queue, block);
}

dispatch_block_t dispatch_block_create_with_qos_class(dispatch_block_flags_t flags, dispatch_qos_class_t qos_class, int relative_priority, dispatch_block_t block)
{
  return (dispatch_block_t)MEMORY[0x1E0C82C68](flags, *(_QWORD *)&qos_class, *(_QWORD *)&relative_priority, block);
}

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return (dispatch_queue_global_t)MEMORY[0x1E0C82D00](identifier, flags);
}

uint64_t dispatch_mach_cancel()
{
  return MEMORY[0x1E0C82DB8]();
}

uint64_t dispatch_mach_connect()
{
  return MEMORY[0x1E0C82DC0]();
}

uint64_t dispatch_mach_create()
{
  return MEMORY[0x1E0C82DC8]();
}

uint64_t dispatch_mach_msg_get_msg()
{
  return MEMORY[0x1E0C82DE8]();
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
  MEMORY[0x1E0C82E08](predicate, block);
}

void dispatch_once_f(dispatch_once_t *predicate, void *context, dispatch_function_t function)
{
  MEMORY[0x1E0C82E10](predicate, context, function);
}

dispatch_queue_attr_t dispatch_queue_attr_make_initially_inactive(dispatch_queue_attr_t attr)
{
  return (dispatch_queue_attr_t)MEMORY[0x1E0C82E20](attr);
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_autorelease_frequency(dispatch_queue_attr_t attr, dispatch_autorelease_frequency_t frequency)
{
  return (dispatch_queue_attr_t)MEMORY[0x1E0C82E28](attr, frequency);
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_qos_class(dispatch_queue_attr_t attr, dispatch_qos_class_t qos_class, int relative_priority)
{
  return (dispatch_queue_attr_t)MEMORY[0x1E0C82E38](attr, *(_QWORD *)&qos_class, *(_QWORD *)&relative_priority);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x1E0C82E48](label, attr);
}

dispatch_queue_t dispatch_queue_create_with_target_V2(const char *label, dispatch_queue_attr_t attr, dispatch_queue_t target)
{
  return (dispatch_queue_t)MEMORY[0x1E0C82E50](label, attr, target);
}

const char *__cdecl dispatch_queue_get_label(dispatch_queue_t queue)
{
  return (const char *)MEMORY[0x1E0C82E58](queue);
}

void dispatch_release(dispatch_object_t object)
{
  MEMORY[0x1E0C82E98](object);
}

void dispatch_resume(dispatch_object_t object)
{
  MEMORY[0x1E0C82EA0](object);
}

void dispatch_retain(dispatch_object_t object)
{
  MEMORY[0x1E0C82EA8](object);
}

dispatch_semaphore_t dispatch_semaphore_create(intptr_t value)
{
  return (dispatch_semaphore_t)MEMORY[0x1E0C82EB8](value);
}

intptr_t dispatch_semaphore_signal(dispatch_semaphore_t dsema)
{
  return MEMORY[0x1E0C82EC8](dsema);
}

intptr_t dispatch_semaphore_wait(dispatch_semaphore_t dsema, dispatch_time_t timeout)
{
  return MEMORY[0x1E0C82ED8](dsema, timeout);
}

void dispatch_source_cancel(dispatch_source_t source)
{
  MEMORY[0x1E0C82F10](source);
}

dispatch_source_t dispatch_source_create(dispatch_source_type_t type, uintptr_t handle, uintptr_t mask, dispatch_queue_t queue)
{
  return (dispatch_source_t)MEMORY[0x1E0C82F20](type, handle, mask, queue);
}

void dispatch_source_set_cancel_handler(dispatch_source_t source, dispatch_block_t handler)
{
  MEMORY[0x1E0C82F48](source, handler);
}

void dispatch_source_set_event_handler(dispatch_source_t source, dispatch_block_t handler)
{
  MEMORY[0x1E0C82F58](source, handler);
}

uint64_t dispatch_source_set_mandatory_cancel_handler()
{
  return MEMORY[0x1E0C82F68]();
}

void dispatch_source_set_timer(dispatch_source_t source, dispatch_time_t start, uint64_t interval, uint64_t leeway)
{
  MEMORY[0x1E0C82F78](source, start, interval, leeway);
}

intptr_t dispatch_source_testcancel(dispatch_source_t source)
{
  return MEMORY[0x1E0C82F80](source);
}

void dispatch_suspend(dispatch_object_t object)
{
  MEMORY[0x1E0C82F88](object);
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x1E0C82F90](queue, block);
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return MEMORY[0x1E0C82FB8](when, delta);
}

uint64_t dispatch_time_to_nsec()
{
  return MEMORY[0x1E0C82FC0]();
}

dispatch_time_t dispatch_walltime(const timespec *when, int64_t delta)
{
  return MEMORY[0x1E0C82FC8](when, delta);
}

dispatch_workloop_t dispatch_workloop_create_inactive(const char *label)
{
  return (dispatch_workloop_t)MEMORY[0x1E0C82FE0](label);
}

uint64_t dispatch_workloop_set_scheduler_priority()
{
  return MEMORY[0x1E0C83010]();
}

int dladdr(const void *a1, Dl_info *a2)
{
  return MEMORY[0x1E0C83028](a1, a2);
}

char *dlerror(void)
{
  return (char *)MEMORY[0x1E0C83038]();
}

void *__cdecl dlsym(void *__handle, const char *__symbol)
{
  return (void *)MEMORY[0x1E0C83050](__handle, __symbol);
}

long double fmod(long double __x, long double __y)
{
  long double result;

  MEMORY[0x1E0C83440](__x, __y);
  return result;
}

int fprintf(FILE *a1, const char *a2, ...)
{
  return MEMORY[0x1E0C83478](a1, a2);
}

void free(void *a1)
{
  MEMORY[0x1E0C834A8](a1);
}

int fstat(int a1, stat *a2)
{
  return MEMORY[0x1E0C83560](*(_QWORD *)&a1, a2);
}

int ftruncate(int a1, off_t a2)
{
  return MEMORY[0x1E0C83590](*(_QWORD *)&a1, a2);
}

pid_t getpid(void)
{
  return MEMORY[0x1E0C83760]();
}

passwd *__cdecl getpwuid(uid_t a1)
{
  return (passwd *)MEMORY[0x1E0C837A0](*(_QWORD *)&a1);
}

uid_t getuid(void)
{
  return MEMORY[0x1E0C83828]();
}

const char *__cdecl ivar_getName(Ivar v)
{
  return (const char *)MEMORY[0x1E0DE7B28](v);
}

ptrdiff_t ivar_getOffset(Ivar v)
{
  return MEMORY[0x1E0DE7B30](v);
}

const char *__cdecl ivar_getTypeEncoding(Ivar v)
{
  return (const char *)MEMORY[0x1E0DE7B38](v);
}

uint64_t launch_copy_properties_for_pid_4assertiond()
{
  return MEMORY[0x1E0C83A98]();
}

int lstat(const char *a1, stat *a2)
{
  return MEMORY[0x1E0C83C40](a1, a2);
}

uint64_t mach_absolute_time(void)
{
  return MEMORY[0x1E0C83C50]();
}

uint64_t mach_continuous_time(void)
{
  return MEMORY[0x1E0C83C70]();
}

char *__cdecl mach_error_string(mach_error_t error_value)
{
  return (char *)MEMORY[0x1E0C83C80](*(_QWORD *)&error_value);
}

mach_msg_return_t mach_msg(mach_msg_header_t *msg, mach_msg_option_t option, mach_msg_size_t send_size, mach_msg_size_t rcv_size, mach_port_name_t rcv_name, mach_msg_timeout_t timeout, mach_port_name_t notify)
{
  return MEMORY[0x1E0C83CB0](msg, *(_QWORD *)&option, *(_QWORD *)&send_size, *(_QWORD *)&rcv_size, *(_QWORD *)&rcv_name, *(_QWORD *)&timeout, *(_QWORD *)&notify);
}

void mach_msg_destroy(mach_msg_header_t *a1)
{
  MEMORY[0x1E0C83CC0](a1);
}

kern_return_t mach_port_allocate(ipc_space_t task, mach_port_right_t right, mach_port_name_t *name)
{
  return MEMORY[0x1E0C83CE0](*(_QWORD *)&task, *(_QWORD *)&right, name);
}

kern_return_t mach_port_construct(ipc_space_t task, mach_port_options_ptr_t options, mach_port_context_t context, mach_port_name_t *name)
{
  return MEMORY[0x1E0C83CE8](*(_QWORD *)&task, options, context, name);
}

kern_return_t mach_port_deallocate(ipc_space_t task, mach_port_name_t name)
{
  return MEMORY[0x1E0C83CF8](*(_QWORD *)&task, *(_QWORD *)&name);
}

kern_return_t mach_port_destruct(ipc_space_t task, mach_port_name_t name, mach_port_delta_t srdelta, mach_port_context_t guard)
{
  return MEMORY[0x1E0C83D08](*(_QWORD *)&task, *(_QWORD *)&name, *(_QWORD *)&srdelta, guard);
}

kern_return_t mach_port_extract_right(ipc_space_t task, mach_port_name_t name, mach_msg_type_name_t msgt_name, mach_port_t *poly, mach_msg_type_name_t *polyPoly)
{
  return MEMORY[0x1E0C83D18](*(_QWORD *)&task, *(_QWORD *)&name, *(_QWORD *)&msgt_name, poly, polyPoly);
}

kern_return_t mach_port_insert_right(ipc_space_t task, mach_port_name_t name, mach_port_t poly, mach_msg_type_name_t polyPoly)
{
  return MEMORY[0x1E0C83D48](*(_QWORD *)&task, *(_QWORD *)&name, *(_QWORD *)&poly, *(_QWORD *)&polyPoly);
}

kern_return_t mach_port_mod_refs(ipc_space_t task, mach_port_name_t name, mach_port_right_t right, mach_port_delta_t delta)
{
  return MEMORY[0x1E0C83D58](*(_QWORD *)&task, *(_QWORD *)&name, *(_QWORD *)&right, *(_QWORD *)&delta);
}

kern_return_t mach_port_request_notification(ipc_space_t task, mach_port_name_t name, mach_msg_id_t msgid, mach_port_mscount_t sync, mach_port_t notify, mach_msg_type_name_t notifyPoly, mach_port_t *previous)
{
  return MEMORY[0x1E0C83D70](*(_QWORD *)&task, *(_QWORD *)&name, *(_QWORD *)&msgid, *(_QWORD *)&sync, *(_QWORD *)&notify, *(_QWORD *)&notifyPoly, previous);
}

kern_return_t mach_port_set_attributes(ipc_space_t task, mach_port_name_t name, mach_port_flavor_t flavor, mach_port_info_t port_info, mach_msg_type_number_t port_infoCnt)
{
  return MEMORY[0x1E0C83D78](*(_QWORD *)&task, *(_QWORD *)&name, *(_QWORD *)&flavor, port_info, *(_QWORD *)&port_infoCnt);
}

kern_return_t mach_port_type(ipc_space_t task, mach_port_name_t name, mach_port_type_t *ptype)
{
  return MEMORY[0x1E0C83D88](*(_QWORD *)&task, *(_QWORD *)&name, ptype);
}

kern_return_t mach_timebase_info(mach_timebase_info_t info)
{
  return MEMORY[0x1E0C83DB8](info);
}

void *__cdecl malloc_type_calloc(size_t count, size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x1E0C83EF8](count, size, type_id);
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x1E0C83F00](size, type_id);
}

void *__cdecl memchr(void *__s, int __c, size_t __n)
{
  return (void *)MEMORY[0x1E0C84070](__s, *(_QWORD *)&__c, __n);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x1E0C84088](__dst, __src, __n);
}

objc_method_description *__cdecl method_getDescription(Method m)
{
  return (objc_method_description *)MEMORY[0x1E0DE7B60](m);
}

IMP method_getImplementation(Method m)
{
  return (IMP)MEMORY[0x1E0DE7B68](m);
}

SEL method_getName(Method m)
{
  return (SEL)MEMORY[0x1E0DE7B70](m);
}

int mkdir(const char *a1, mode_t a2)
{
  return MEMORY[0x1E0C84160](a1, a2);
}

int mkstemp(char *a1)
{
  return MEMORY[0x1E0C841A0](a1);
}

void *__cdecl mmap(void *a1, size_t a2, int a3, int a4, int a5, off_t a6)
{
  return (void *)MEMORY[0x1E0C841D8](a1, a2, *(_QWORD *)&a3, *(_QWORD *)&a4, *(_QWORD *)&a5, a6);
}

long double modf(long double __x, long double *__y)
{
  long double result;

  MEMORY[0x1E0C841E0](__y, __x);
  return result;
}

int msync(void *a1, size_t a2, int a3)
{
  return MEMORY[0x1E0C84210](a1, a2, *(_QWORD *)&a3);
}

int munmap(void *a1, size_t a2)
{
  return MEMORY[0x1E0C84220](a1, a2);
}

uint32_t notify_cancel(int token)
{
  return MEMORY[0x1E0C843D8](*(_QWORD *)&token);
}

uint32_t notify_get_state(int token, uint64_t *state64)
{
  return MEMORY[0x1E0C843E8](*(_QWORD *)&token, state64);
}

BOOL notify_is_valid_token(int val)
{
  return MEMORY[0x1E0C843F0](*(_QWORD *)&val);
}

uint32_t notify_post(const char *name)
{
  return MEMORY[0x1E0C843F8](name);
}

uint32_t notify_register_check(const char *name, int *out_token)
{
  return MEMORY[0x1E0C84400](name, out_token);
}

uint32_t notify_register_dispatch(const char *name, int *out_token, dispatch_queue_t queue, notify_handler_t handler)
{
  return MEMORY[0x1E0C84408](name, out_token, queue, handler);
}

uint32_t notify_set_state(int token, uint64_t state64)
{
  return MEMORY[0x1E0C84428](*(_QWORD *)&token, state64);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x1E0DE7BA8](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x1E0DE7BB8]();
}

Class objc_allocateClassPair(Class superclass, const char *name, size_t extraBytes)
{
  return (Class)MEMORY[0x1E0DE7BC0](superclass, name, extraBytes);
}

id objc_autorelease(id a1)
{
  return (id)MEMORY[0x1E0DE7BD0](a1);
}

void objc_autoreleasePoolPop(void *context)
{
  MEMORY[0x1E0DE7BD8](context);
}

void *objc_autoreleasePoolPush(void)
{
  return (void *)MEMORY[0x1E0DE7BE0]();
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x1E0DE7BE8](a1);
}

id objc_begin_catch(void *exc_buf)
{
  return (id)MEMORY[0x1E0DE7BF0](exc_buf);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x1E0DE7BF8]();
}

void objc_copyWeak(id *to, id *from)
{
  MEMORY[0x1E0DE7C38](to, from);
}

void objc_destroyWeak(id *location)
{
  MEMORY[0x1E0DE7C60](location);
}

void objc_end_catch(void)
{
  MEMORY[0x1E0DE7C80]();
}

void objc_enumerationMutation(id obj)
{
  MEMORY[0x1E0DE7C90](obj);
}

void objc_exception_rethrow(void)
{
  MEMORY[0x1E0DE7C98]();
}

void objc_exception_throw(id exception)
{
  MEMORY[0x1E0DE7CA0](exception);
}

id objc_getAssociatedObject(id object, const void *key)
{
  return (id)MEMORY[0x1E0DE7CA8](object, key);
}

Class objc_getClass(const char *name)
{
  return (Class)MEMORY[0x1E0DE7CB0](name);
}

id objc_getProperty(id self, SEL _cmd, ptrdiff_t offset, BOOL atomic)
{
  return (id)MEMORY[0x1E0DE7CD0](self, _cmd, offset, atomic);
}

Protocol *__cdecl objc_getProtocol(const char *name)
{
  return (Protocol *)MEMORY[0x1E0DE7CD8](name);
}

id objc_initWeak(id *location, id val)
{
  return (id)MEMORY[0x1E0DE7CE0](location, val);
}

id objc_loadWeak(id *location)
{
  return (id)MEMORY[0x1E0DE7D00](location);
}

id objc_loadWeakRetained(id *location)
{
  return (id)MEMORY[0x1E0DE7D08](location);
}

Class objc_lookUpClass(const char *name)
{
  return (Class)MEMORY[0x1E0DE7D10](name);
}

void objc_moveWeak(id *to, id *from)
{
  MEMORY[0x1E0DE7D18](to, from);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x1E0DE7D30](a1, a2);
}

uint64_t objc_opt_class()
{
  return MEMORY[0x1E0DE7D38]();
}

uint64_t objc_opt_isKindOfClass()
{
  return MEMORY[0x1E0DE7D40]();
}

uint64_t objc_opt_new()
{
  return MEMORY[0x1E0DE7D48]();
}

uint64_t objc_opt_respondsToSelector()
{
  return MEMORY[0x1E0DE7D50]();
}

uint64_t objc_opt_self()
{
  return MEMORY[0x1E0DE7D58]();
}

void objc_registerClassPair(Class cls)
{
  MEMORY[0x1E0DE7D68](cls);
}

void objc_release(id a1)
{
  MEMORY[0x1E0DE7D78](a1);
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x1E0DE7E50](a1);
}

id objc_retainAutorelease(id a1)
{
  return (id)MEMORY[0x1E0DE7E58](a1);
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x1E0DE7E60](a1);
}

id objc_retainAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x1E0DE7E68](a1);
}

id objc_retainBlock(id a1)
{
  return (id)MEMORY[0x1E0DE7E70](a1);
}

void objc_setAssociatedObject(id object, const void *key, id value, void *policy)
{
  MEMORY[0x1E0DE7F40](object, key, value, policy);
}

void objc_setProperty_atomic(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
  MEMORY[0x1E0DE7F88](self, _cmd, newValue, offset);
}

void objc_setProperty_nonatomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
  MEMORY[0x1E0DE7FA0](self, _cmd, newValue, offset);
}

void objc_storeStrong(id *location, id obj)
{
  MEMORY[0x1E0DE7FB0](location, obj);
}

id objc_storeWeak(id *location, id obj)
{
  return (id)MEMORY[0x1E0DE7FB8](location, obj);
}

int objc_sync_enter(id obj)
{
  return MEMORY[0x1E0DE7FC8](obj);
}

int objc_sync_exit(id obj)
{
  return MEMORY[0x1E0DE7FD0](obj);
}

void objc_terminate(void)
{
  MEMORY[0x1E0DE7FD8]();
}

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x1E0DE7FE0](a1);
}

Class object_getClass(id a1)
{
  return (Class)MEMORY[0x1E0DE7FF8](a1);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x1E0C84728](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x1E0C84780](oslog, type);
}

uint64_t os_state_add_handler()
{
  return MEMORY[0x1E0C84940]();
}

uint64_t os_state_remove_handler()
{
  return MEMORY[0x1E0C84948]();
}

void os_unfair_lock_assert_not_owner(const os_unfair_lock *lock)
{
  MEMORY[0x1E0C84988](lock);
}

void os_unfair_lock_assert_owner(const os_unfair_lock *lock)
{
  MEMORY[0x1E0C84990](lock);
}

void os_unfair_lock_lock(os_unfair_lock_t lock)
{
  MEMORY[0x1E0C84998](lock);
}

void os_unfair_lock_unlock(os_unfair_lock_t lock)
{
  MEMORY[0x1E0C849B0](lock);
}

uint64_t os_variant_has_internal_content()
{
  return MEMORY[0x1E0C849F0]();
}

uint64_t os_variant_has_internal_ui()
{
  return MEMORY[0x1E0C84A00]();
}

int proc_pidinfo(int pid, int flavor, uint64_t arg, void *buffer, int buffersize)
{
  return MEMORY[0x1E0C84C40](*(_QWORD *)&pid, *(_QWORD *)&flavor, arg, buffer, *(_QWORD *)&buffersize);
}

int proc_pidpath(int pid, void *buffer, uint32_t buffersize)
{
  return MEMORY[0x1E0C84C50](*(_QWORD *)&pid, buffer, *(_QWORD *)&buffersize);
}

int proc_pidpath_audittoken(audit_token_t *audittoken, void *buffer, uint32_t buffersize)
{
  return MEMORY[0x1E0C84C58](audittoken, buffer, *(_QWORD *)&buffersize);
}

uint64_t proc_setthread_cpupercent()
{
  return MEMORY[0x1E0C84C88]();
}

objc_property_attribute_t *__cdecl property_copyAttributeList(objc_property_t property, unsigned int *outCount)
{
  return (objc_property_attribute_t *)MEMORY[0x1E0DE8058](property, outCount);
}

char *__cdecl property_copyAttributeValue(objc_property_t property, const char *attributeName)
{
  return (char *)MEMORY[0x1E0DE8060](property, attributeName);
}

const char *__cdecl property_getName(objc_property_t property)
{
  return (const char *)MEMORY[0x1E0DE8070](property);
}

objc_method_description *__cdecl protocol_copyMethodDescriptionList(Protocol *p, BOOL isRequiredMethod, BOOL isInstanceMethod, unsigned int *outCount)
{
  return (objc_method_description *)MEMORY[0x1E0DE8088](p, isRequiredMethod, isInstanceMethod, outCount);
}

objc_property_t *__cdecl protocol_copyPropertyList2(Protocol *proto, unsigned int *outCount, BOOL isRequiredProperty, BOOL isInstanceProperty)
{
  return (objc_property_t *)MEMORY[0x1E0DE8098](proto, outCount, isRequiredProperty, isInstanceProperty);
}

Protocol **__cdecl protocol_copyProtocolList(Protocol *proto, unsigned int *outCount)
{
  return (Protocol **)MEMORY[0x1E0DE80A0](proto, outCount);
}

objc_method_description protocol_getMethodDescription(Protocol *p, SEL aSel, BOOL isRequiredMethod, BOOL isInstanceMethod)
{
  const char *v4;
  char *v5;
  objc_method_description result;

  v4 = (const char *)MEMORY[0x1E0DE80A8](p, aSel, isRequiredMethod, isInstanceMethod);
  result.types = v5;
  result.name = v4;
  return result;
}

int pthread_attr_getschedparam(const pthread_attr_t *a1, sched_param *a2)
{
  return MEMORY[0x1E0C84CB8](a1, a2);
}

int pthread_attr_setschedparam(pthread_attr_t *a1, const sched_param *a2)
{
  return MEMORY[0x1E0C84CE8](a1, a2);
}

int pthread_create(pthread_t *a1, const pthread_attr_t *a2, void *(__cdecl *a3)(void *), void *a4)
{
  return MEMORY[0x1E0C84D50](a1, a2, a3, a4);
}

int pthread_getname_np(pthread_t a1, char *a2, size_t a3)
{
  return MEMORY[0x1E0C84DB0](a1, a2, a3);
}

int pthread_getschedparam(pthread_t a1, int *a2, sched_param *a3)
{
  return MEMORY[0x1E0C84DB8](a1, a2, a3);
}

void *__cdecl pthread_getspecific(pthread_key_t a1)
{
  return (void *)MEMORY[0x1E0C84DC0](a1);
}

int pthread_key_create(pthread_key_t *a1, void (__cdecl *a2)(void *))
{
  return MEMORY[0x1E0C84DE0](a1, a2);
}

mach_port_t pthread_mach_thread_np(pthread_t a1)
{
  return MEMORY[0x1E0C84E00](a1);
}

int pthread_main_np(void)
{
  return MEMORY[0x1E0C84E08]();
}

int pthread_mutex_lock(pthread_mutex_t *a1)
{
  return MEMORY[0x1E0C84E28](a1);
}

int pthread_mutex_unlock(pthread_mutex_t *a1)
{
  return MEMORY[0x1E0C84E38](a1);
}

int pthread_once(pthread_once_t *a1, void (*a2)(void))
{
  return MEMORY[0x1E0C84E68](a1, a2);
}

pthread_t pthread_self(void)
{
  return (pthread_t)MEMORY[0x1E0C84ED8]();
}

uint64_t pthread_set_fixedpriority_self()
{
  return MEMORY[0x1E0C84EE8]();
}

uint64_t pthread_set_timeshare_self()
{
  return MEMORY[0x1E0C84EF8]();
}

int pthread_setname_np(const char *a1)
{
  return MEMORY[0x1E0C84F08](a1);
}

int pthread_setschedparam(pthread_t a1, int a2, const sched_param *a3)
{
  return MEMORY[0x1E0C84F10](a1, *(_QWORD *)&a2, a3);
}

int pthread_setspecific(pthread_key_t a1, const void *a2)
{
  return MEMORY[0x1E0C84F18](a1, a2);
}

qos_class_t qos_class_self(void)
{
  return MEMORY[0x1E0C84F80]();
}

void qsort_b(void *__base, size_t __nel, size_t __width, void *__compar)
{
  MEMORY[0x1E0C84F90](__base, __nel, __width, __compar);
}

uint64_t sandbox_check()
{
  return MEMORY[0x1E0C85178]();
}

SEL sel_registerName(const char *str)
{
  return (SEL)MEMORY[0x1E0DE80E8](str);
}

int shm_open(const char *a1, int a2, ...)
{
  return MEMORY[0x1E0C853A8](a1, *(_QWORD *)&a2);
}

int shm_unlink(const char *a1)
{
  return MEMORY[0x1E0C853B0](a1);
}

int sqlite3_bind_blob64(sqlite3_stmt *a1, int a2, const void *a3, sqlite3_uint64 a4, void (__cdecl *a5)(void *))
{
  return MEMORY[0x1E0DE8588](a1, *(_QWORD *)&a2, a3, a4, a5);
}

int sqlite3_bind_double(sqlite3_stmt *a1, int a2, double a3)
{
  return MEMORY[0x1E0DE8598](a1, *(_QWORD *)&a2, a3);
}

int sqlite3_bind_int64(sqlite3_stmt *a1, int a2, sqlite3_int64 a3)
{
  return MEMORY[0x1E0DE85A8](a1, *(_QWORD *)&a2, a3);
}

int sqlite3_bind_null(sqlite3_stmt *a1, int a2)
{
  return MEMORY[0x1E0DE85B0](a1, *(_QWORD *)&a2);
}

int sqlite3_bind_parameter_index(sqlite3_stmt *a1, const char *zName)
{
  return MEMORY[0x1E0DE85C0](a1, zName);
}

int sqlite3_bind_text(sqlite3_stmt *a1, int a2, const char *a3, int a4, void (__cdecl *a5)(void *))
{
  return MEMORY[0x1E0DE85D8](a1, *(_QWORD *)&a2, a3, *(_QWORD *)&a4, a5);
}

int sqlite3_clear_bindings(sqlite3_stmt *a1)
{
  return MEMORY[0x1E0DE8648](a1);
}

int sqlite3_close_v2(sqlite3 *a1)
{
  return MEMORY[0x1E0DE8658](a1);
}

const void *__cdecl sqlite3_column_blob(sqlite3_stmt *a1, int iCol)
{
  return (const void *)MEMORY[0x1E0DE8660](a1, *(_QWORD *)&iCol);
}

int sqlite3_column_bytes(sqlite3_stmt *a1, int iCol)
{
  return MEMORY[0x1E0DE8668](a1, *(_QWORD *)&iCol);
}

int sqlite3_column_count(sqlite3_stmt *pStmt)
{
  return MEMORY[0x1E0DE8678](pStmt);
}

double sqlite3_column_double(sqlite3_stmt *a1, int iCol)
{
  double result;

  MEMORY[0x1E0DE8688](a1, *(_QWORD *)&iCol);
  return result;
}

sqlite3_int64 sqlite3_column_int64(sqlite3_stmt *a1, int iCol)
{
  return MEMORY[0x1E0DE8698](a1, *(_QWORD *)&iCol);
}

const char *__cdecl sqlite3_column_name(sqlite3_stmt *a1, int N)
{
  return (const char *)MEMORY[0x1E0DE86A0](a1, *(_QWORD *)&N);
}

const unsigned __int8 *__cdecl sqlite3_column_text(sqlite3_stmt *a1, int iCol)
{
  return (const unsigned __int8 *)MEMORY[0x1E0DE86B8](a1, *(_QWORD *)&iCol);
}

int sqlite3_column_type(sqlite3_stmt *a1, int iCol)
{
  return MEMORY[0x1E0DE86C8](a1, *(_QWORD *)&iCol);
}

const char *__cdecl sqlite3_errmsg(sqlite3 *a1)
{
  return (const char *)MEMORY[0x1E0DE8788](a1);
}

const char *__cdecl sqlite3_errstr(int a1)
{
  return (const char *)MEMORY[0x1E0DE8790](*(_QWORD *)&a1);
}

int sqlite3_extended_errcode(sqlite3 *db)
{
  return MEMORY[0x1E0DE87B0](db);
}

int sqlite3_file_control(sqlite3 *a1, const char *zDbName, int op, void *a4)
{
  return MEMORY[0x1E0DE87C0](a1, zDbName, *(_QWORD *)&op, a4);
}

int sqlite3_finalize(sqlite3_stmt *pStmt)
{
  return MEMORY[0x1E0DE87C8](pStmt);
}

int sqlite3_open_v2(const char *filename, sqlite3 **ppDb, int flags, const char *zVfs)
{
  return MEMORY[0x1E0DE8870](filename, ppDb, *(_QWORD *)&flags, zVfs);
}

int sqlite3_prepare_v2(sqlite3 *db, const char *zSql, int nByte, sqlite3_stmt **ppStmt, const char **pzTail)
{
  return MEMORY[0x1E0DE8880](db, zSql, *(_QWORD *)&nByte, ppStmt, pzTail);
}

int sqlite3_reset(sqlite3_stmt *pStmt)
{
  return MEMORY[0x1E0DE88B0](pStmt);
}

const char *__cdecl sqlite3_sql(sqlite3_stmt *pStmt)
{
  return (const char *)MEMORY[0x1E0DE8998](pStmt);
}

int sqlite3_step(sqlite3_stmt *a1)
{
  return MEMORY[0x1E0DE89A8](a1);
}

int stat(const char *a1, stat *a2)
{
  return MEMORY[0x1E0C854D8](a1, a2);
}

char *__cdecl strdup(const char *__s1)
{
  return (char *)MEMORY[0x1E0C85540](__s1);
}

char *__cdecl strerror(int __errnum)
{
  return (char *)MEMORY[0x1E0C85548](*(_QWORD *)&__errnum);
}

int strerror_r(int __errnum, char *__strerrbuf, size_t __buflen)
{
  return MEMORY[0x1E0C85550](*(_QWORD *)&__errnum, __strerrbuf, __buflen);
}

size_t strlen(const char *__s)
{
  return MEMORY[0x1E0C85578](__s);
}

int strncmp(const char *__s1, const char *__s2, size_t __n)
{
  return MEMORY[0x1E0C855A8](__s1, __s2, __n);
}

int sysctl(int *a1, u_int a2, void *a3, size_t *a4, void *a5, size_t a6)
{
  return MEMORY[0x1E0C85798](a1, *(_QWORD *)&a2, a3, a4, a5, a6);
}

kern_return_t task_info(task_name_t target_task, task_flavor_t flavor, task_info_t task_info_out, mach_msg_type_number_t *task_info_outCnt)
{
  return MEMORY[0x1E0C85838](*(_QWORD *)&target_task, *(_QWORD *)&flavor, task_info_out, task_info_outCnt);
}

kern_return_t task_name_for_pid(mach_port_name_t target_tport, int pid, mach_port_name_t *tn)
{
  return MEMORY[0x1E0C85848](*(_QWORD *)&target_tport, *(_QWORD *)&pid, tn);
}

kern_return_t thread_policy_set(thread_act_t thread, thread_policy_flavor_t flavor, thread_policy_t policy_info, mach_msg_type_number_t policy_infoCnt)
{
  return MEMORY[0x1E0C85908](*(_QWORD *)&thread, *(_QWORD *)&flavor, policy_info, *(_QWORD *)&policy_infoCnt);
}

uint64_t uacal_getDayPeriod()
{
  return MEMORY[0x1E0DE5B48]();
}

kern_return_t vm_deallocate(vm_map_t target_task, vm_address_t address, vm_size_t size)
{
  return MEMORY[0x1E0C85A98](*(_QWORD *)&target_task, address, size);
}

void xpc_array_append_value(xpc_object_t xarray, xpc_object_t value)
{
  MEMORY[0x1E0C85DE0](xarray, value);
}

BOOL xpc_array_apply(xpc_object_t xarray, xpc_array_applier_t applier)
{
  return MEMORY[0x1E0C85DF8](xarray, applier);
}

xpc_object_t xpc_array_create(xpc_object_t *objects, size_t count)
{
  return (xpc_object_t)MEMORY[0x1E0C85E00](objects, count);
}

size_t xpc_array_get_count(xpc_object_t xarray)
{
  return MEMORY[0x1E0C85E30](xarray);
}

double xpc_array_get_double(xpc_object_t xarray, size_t index)
{
  double result;

  MEMORY[0x1E0C85E58](xarray, index);
  return result;
}

xpc_object_t xpc_array_get_value(xpc_object_t xarray, size_t index)
{
  return (xpc_object_t)MEMORY[0x1E0C85E90](xarray, index);
}

xpc_object_t xpc_BOOL_create(BOOL value)
{
  return (xpc_object_t)MEMORY[0x1E0C85EF0](value);
}

BOOL xpc_BOOL_get_value(xpc_object_t xBOOL)
{
  return MEMORY[0x1E0C85F00](xBOOL);
}

uint64_t xpc_bundle_create()
{
  return MEMORY[0x1E0C85F18]();
}

uint64_t xpc_bundle_create_main()
{
  return MEMORY[0x1E0C85F20]();
}

uint64_t xpc_bundle_get_executable_path()
{
  return MEMORY[0x1E0C85F30]();
}

uint64_t xpc_bundle_get_info_dictionary()
{
  return MEMORY[0x1E0C85F38]();
}

uint64_t xpc_bundle_get_property()
{
  return MEMORY[0x1E0C85F40]();
}

void xpc_connection_cancel(xpc_connection_t connection)
{
  MEMORY[0x1E0C85F68](connection);
}

uint64_t xpc_connection_copy_bundle_id()
{
  return MEMORY[0x1E0C85F70]();
}

xpc_connection_t xpc_connection_create(const char *name, dispatch_queue_t targetq)
{
  return (xpc_connection_t)MEMORY[0x1E0C85F90](name, targetq);
}

xpc_connection_t xpc_connection_create_from_endpoint(xpc_endpoint_t endpoint)
{
  return (xpc_connection_t)MEMORY[0x1E0C85FA0](endpoint);
}

xpc_connection_t xpc_connection_create_mach_service(const char *name, dispatch_queue_t targetq, uint64_t flags)
{
  return (xpc_connection_t)MEMORY[0x1E0C85FB0](name, targetq, flags);
}

uint64_t xpc_connection_get_audit_token()
{
  return MEMORY[0x1E0C85FD0]();
}

pid_t xpc_connection_get_pid(xpc_connection_t connection)
{
  return MEMORY[0x1E0C86008](connection);
}

void xpc_connection_resume(xpc_connection_t connection)
{
  MEMORY[0x1E0C86018](connection);
}

void xpc_connection_send_barrier(xpc_connection_t connection, dispatch_block_t barrier)
{
  MEMORY[0x1E0C86020](connection, barrier);
}

void xpc_connection_send_message(xpc_connection_t connection, xpc_object_t message)
{
  MEMORY[0x1E0C86030](connection, message);
}

void xpc_connection_send_message_with_reply(xpc_connection_t connection, xpc_object_t message, dispatch_queue_t replyq, xpc_handler_t handler)
{
  MEMORY[0x1E0C86038](connection, message, replyq, handler);
}

xpc_object_t xpc_connection_send_message_with_reply_sync(xpc_connection_t connection, xpc_object_t message)
{
  return (xpc_object_t)MEMORY[0x1E0C86048](connection, message);
}

void xpc_connection_set_event_handler(xpc_connection_t connection, xpc_handler_t handler)
{
  MEMORY[0x1E0C86080](connection, handler);
}

uint64_t xpc_connection_set_oneshot_instance()
{
  return MEMORY[0x1E0C860A8]();
}

void xpc_connection_set_target_queue(xpc_connection_t connection, dispatch_queue_t targetq)
{
  MEMORY[0x1E0C860C8](connection, targetq);
}

void xpc_connection_suspend(xpc_connection_t connection)
{
  MEMORY[0x1E0C860E0](connection);
}

BOOL xpc_dictionary_apply(xpc_object_t xdict, xpc_dictionary_applier_t applier)
{
  return MEMORY[0x1E0C861F0](xdict, applier);
}

xpc_object_t xpc_dictionary_create(const char *const *keys, xpc_object_t *values, size_t count)
{
  return (xpc_object_t)MEMORY[0x1E0C86208](keys, values, count);
}

xpc_object_t xpc_dictionary_create_reply(xpc_object_t original)
{
  return (xpc_object_t)MEMORY[0x1E0C86228](original);
}

uint64_t xpc_dictionary_get_audit_token()
{
  return MEMORY[0x1E0C86258]();
}

BOOL xpc_dictionary_get_BOOL(xpc_object_t xdict, const char *key)
{
  return MEMORY[0x1E0C86260](xdict, key);
}

size_t xpc_dictionary_get_count(xpc_object_t xdict)
{
  return MEMORY[0x1E0C86270](xdict);
}

const void *__cdecl xpc_dictionary_get_data(xpc_object_t xdict, const char *key, size_t *length)
{
  return (const void *)MEMORY[0x1E0C86278](xdict, key, length);
}

int64_t xpc_dictionary_get_int64(xpc_object_t xdict, const char *key)
{
  return MEMORY[0x1E0C862A0](xdict, key);
}

xpc_connection_t xpc_dictionary_get_remote_connection(xpc_object_t xdict)
{
  return (xpc_connection_t)MEMORY[0x1E0C862B0](xdict);
}

const char *__cdecl xpc_dictionary_get_string(xpc_object_t xdict, const char *key)
{
  return (const char *)MEMORY[0x1E0C862C8](xdict, key);
}

uint64_t xpc_dictionary_get_uint64(xpc_object_t xdict, const char *key)
{
  return MEMORY[0x1E0C862D0](xdict, key);
}

xpc_object_t xpc_dictionary_get_value(xpc_object_t xdict, const char *key)
{
  return (xpc_object_t)MEMORY[0x1E0C862E0](xdict, key);
}

void xpc_dictionary_set_BOOL(xpc_object_t xdict, const char *key, BOOL value)
{
  MEMORY[0x1E0C86310](xdict, key, value);
}

void xpc_dictionary_set_data(xpc_object_t xdict, const char *key, const void *bytes, size_t length)
{
  MEMORY[0x1E0C86330](xdict, key, bytes, length);
}

void xpc_dictionary_set_double(xpc_object_t xdict, const char *key, double value)
{
  MEMORY[0x1E0C86348](xdict, key, value);
}

void xpc_dictionary_set_int64(xpc_object_t xdict, const char *key, int64_t value)
{
  MEMORY[0x1E0C86360](xdict, key, value);
}

void xpc_dictionary_set_string(xpc_object_t xdict, const char *key, const char *string)
{
  MEMORY[0x1E0C86390](xdict, key, string);
}

void xpc_dictionary_set_uint64(xpc_object_t xdict, const char *key, uint64_t value)
{
  MEMORY[0x1E0C86398](xdict, key, value);
}

void xpc_dictionary_set_value(xpc_object_t xdict, const char *key, xpc_object_t value)
{
  MEMORY[0x1E0C863B8](xdict, key, value);
}

xpc_object_t xpc_double_create(double value)
{
  return (xpc_object_t)MEMORY[0x1E0C863D0](value);
}

double xpc_double_get_value(xpc_object_t xdouble)
{
  double result;

  MEMORY[0x1E0C863E0](xdouble);
  return result;
}

xpc_endpoint_t xpc_endpoint_create(xpc_connection_t connection)
{
  return (xpc_endpoint_t)MEMORY[0x1E0C863F0](connection);
}

uint64_t xpc_get_class4NSXPC()
{
  return MEMORY[0x1E0C86508]();
}

xpc_type_t xpc_get_type(xpc_object_t object)
{
  return (xpc_type_t)MEMORY[0x1E0C86520](object);
}

xpc_object_t xpc_int64_create(int64_t value)
{
  return (xpc_object_t)MEMORY[0x1E0C86568](value);
}

int64_t xpc_int64_get_value(xpc_object_t xint)
{
  return MEMORY[0x1E0C86570](xint);
}

uint64_t xpc_is_kind_of_xpc_object4NSXPC()
{
  return MEMORY[0x1E0C86580]();
}

uint64_t xpc_mach_recv_create()
{
  return MEMORY[0x1E0C865C8]();
}

uint64_t xpc_mach_recv_extract_right()
{
  return MEMORY[0x1E0C865D0]();
}

uint64_t xpc_mach_send_copy_right()
{
  return MEMORY[0x1E0C865D8]();
}

uint64_t xpc_mach_send_create()
{
  return MEMORY[0x1E0C865E0]();
}

uint64_t xpc_mach_send_once_create()
{
  return MEMORY[0x1E0C865F8]();
}

uint64_t xpc_mach_send_once_extract_right()
{
  return MEMORY[0x1E0C86600]();
}

uint64_t xpc_pipe_create_reply_from_port()
{
  return MEMORY[0x1E0C86630]();
}

uint64_t xpc_pipe_receive()
{
  return MEMORY[0x1E0C86638]();
}

uint64_t xpc_pipe_routine_reply()
{
  return MEMORY[0x1E0C86640]();
}

void xpc_release(xpc_object_t object)
{
  MEMORY[0x1E0C86658](object);
}

xpc_object_t xpc_retain(xpc_object_t object)
{
  return (xpc_object_t)MEMORY[0x1E0C86660](object);
}

const char *__cdecl xpc_string_get_string_ptr(xpc_object_t xstring)
{
  return (const char *)MEMORY[0x1E0C86758](xstring);
}

xpc_object_t xpc_uint64_create(uint64_t value)
{
  return (xpc_object_t)MEMORY[0x1E0C867B0](value);
}

uint64_t xpc_uint64_get_value(xpc_object_t xuint)
{
  return MEMORY[0x1E0C867B8](xuint);
}

xpc_object_t xpc_uuid_create(const unsigned __int8 *uuid)
{
  return (xpc_object_t)MEMORY[0x1E0C867E0](uuid);
}

const uint8_t *__cdecl xpc_uuid_get_bytes(xpc_object_t xuuid)
{
  return (const uint8_t *)MEMORY[0x1E0C867F8](xuuid);
}

