void sub_1DD771E18(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __objectEqual(void *a1, void *a2)
{
  unint64_t v3;
  unint64_t v4;
  void *v5;
  uint64_t v6;

  v3 = a1;
  v4 = a2;
  v5 = (void *)v4;
  if (v3 | v4)
  {
    v6 = 0;
    if (v3 && v4)
      v6 = objc_msgSend((id)v3, "isEqual:", v4);
  }
  else
  {
    v6 = 1;
  }

  return v6;
}

void __Block_byref_object_dispose_(uint64_t a1)
{

}

void __Block_byref_object_dispose__0(uint64_t a1)
{

}

uint64_t __Block_byref_object_copy_(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__0(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

id _compLayoutLog()
{
  if (qword_1ECF87FF8 != -1)
    dispatch_once(&qword_1ECF87FF8, &__block_literal_global);
  return (id)_MergedGlobals_22;
}

void sub_1DD77899C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,char a29)
{
  uint64_t v29;

  _Block_object_dispose(&a29, 8);
  _Block_object_dispose((const void *)(v29 - 128), 8);
  _Unwind_Resume(a1);
}

void ___compLayoutLog_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.UIKit", "CompositionalLayout");
  v1 = (void *)_MergedGlobals_22;
  _MergedGlobals_22 = (uint64_t)v0;

}

__CFString *_CVCContentInsetsReferenceDescription(uint64_t a1)
{
  if ((unint64_t)(a1 - 1) < 4)
    return off_1EA7CE500[a1 - 1];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown value: %ld)"), a1);
  return (__CFString *)(id)objc_claimAutoreleasedReturnValue();
}

double _CVCTotalEdgeDimensionsForLayoutAxis(uint64_t a1, double a2, double a3, double a4, double a5)
{
  void *v6;
  void *v7;

  if (a1 == 1)
    return a3 + a5;
  if (a1 == 2)
    return a2 + a4;
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "CGFloat _CVCTotalEdgeDimensionsForLayoutAxis(CVCDirectionalEdgeInsets, CVCAxis)");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "handleFailureInFunction:file:lineNumber:description:", v7, CFSTR("CollectionViewCoreGeometry.m"), 19, CFSTR("Unknown axis."));

  return 0.0;
}

void _CVCDirectionalInsetsForInsetsAlongAxis(uint64_t a1)
{
  void *v1;
  void *v2;

  if ((unint64_t)(a1 - 3) <= 0xFFFFFFFFFFFFFFFDLL)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v1 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "CVCDirectionalEdgeInsets _CVCDirectionalInsetsForInsetsAlongAxis(CVCDirectionalEdgeInsets, CVCAxis)");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v1, "handleFailureInFunction:file:lineNumber:description:", v2, CFSTR("CollectionViewCoreGeometry.m"), 25, CFSTR("Unknown axis provided."));

  }
}

double _CVCRectAnchorPointForUnitAnchorPoint(CGFloat a1, CGFloat a2, CGFloat a3, CGFloat a4, double a5)
{
  double MinX;
  double v11;
  CGRect v13;
  CGRect v14;
  CGRect v15;

  MinX = CGRectGetMinX(*(CGRect *)&a1);
  v13.origin.x = a1;
  v13.origin.y = a2;
  v13.size.width = a3;
  v13.size.height = a4;
  v11 = MinX + a5 * CGRectGetWidth(v13);
  v14.origin.x = a1;
  v14.origin.y = a2;
  v14.size.width = a3;
  v14.size.height = a4;
  CGRectGetMinY(v14);
  v15.origin.x = a1;
  v15.origin.y = a2;
  v15.size.width = a3;
  v15.size.height = a4;
  CGRectGetHeight(v15);
  return v11;
}

CGFloat _CVCRectAdjustWithAnchorPoint(CGFloat a1, CGFloat a2, CGFloat a3, CGFloat a4, double a5)
{
  double v9;
  CGRect v11;
  CGRect v12;
  CGRect v13;

  v9 = (a5 + -0.5) * CGRectGetWidth(*(CGRect *)&a1);
  v11.origin.x = a1;
  v11.origin.y = a2;
  v11.size.width = a3;
  v11.size.height = a4;
  CGRectGetHeight(v11);
  v12.origin.x = a1;
  v12.origin.y = a2;
  v12.size.width = a3;
  v12.size.height = a4;
  CGRectGetWidth(v12);
  v13.origin.x = a1;
  v13.origin.y = a2;
  v13.size.width = a3;
  v13.size.height = a4;
  CGRectGetHeight(v13);
  return a1 - v9;
}

uint64_t CVCIs__NSOrderedSetI(void *a1)
{
  id v1;
  char isKindOfClass;

  v1 = a1;
  if (_MergedGlobals_0 != -1)
    dispatch_once(&_MergedGlobals_0, &__block_literal_global_0);
  if (qword_1ECF88008)
    isKindOfClass = objc_opt_isKindOfClass();
  else
    isKindOfClass = 0;

  return isKindOfClass & 1;
}

void BUG_IN_CLIENT_OF_DIFFABLE_DATA_SOURCE__IDENTIFIER_HASH_VALUE_CHANGED(void *a1, int a2)
{
  id v3;
  void *v4;
  void *v5;
  const __CFString *v6;
  const __CFString *v7;

  v3 = a1;
  _CVCApplicationIsAppleApp();
  if (dyld_program_sdk_at_least())
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "void BUG_IN_CLIENT_OF_DIFFABLE_DATA_SOURCE__IDENTIFIER_HASH_VALUE_CHANGED(__strong id _Nonnull, BOOL)");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = CFSTR("a section");
    if (a2)
      v6 = CFSTR("an item");
    objc_msgSend(v4, "handleFailureInFunction:file:lineNumber:description:", v5, CFSTR("_UIDiffableDataSourceHelpers.m"), 70, CFSTR("Diffable data source detected %@ identifier whose hash value changed. The hash value of an identifier cannot change once it has been added to a snapshot. You must fix this in the Hashable (Swift) or hash property (Objective-C) implementation for this identifier's type. When fixing your implementation, also remember that two identifiers which are equal must have the same hash value. Identifier returning invalid hash values: %@"), v6, v3);

  }
  else
  {
    if (a2)
      v7 = CFSTR("an item");
    else
      v7 = CFSTR("a section");
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99750], CFSTR("Diffable data source detected %@ identifier whose hash value changed. The hash value of an identifier cannot change once it has been added to a snapshot. You must fix this in the Hashable (Swift) or hash property (Objective-C) implementation for this identifier's type. When fixing your implementation, also remember that two identifiers which are equal must have the same hash value. Identifier returning invalid hash values: %@ Set a symbolic breakpoint on BUG_IN_CLIENT_OF_DIFFABLE_DATA_SOURCE__IDENTIFIER_HASH_VALUE_CHANGED to catch this in the debugger. This will become an assert in a future version."), v7, v3);
  }

}

void BUG_IN_CLIENT_OF_DIFFABLE_DATA_SOURCE__IDENTIFIER_IS_NOT_EQUAL_TO_ITSELF(void *a1, int a2)
{
  id v3;
  void *v4;
  void *v5;
  const __CFString *v6;
  const __CFString *v7;

  v3 = a1;
  _CVCApplicationIsAppleApp();
  if (dyld_program_sdk_at_least())
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "void BUG_IN_CLIENT_OF_DIFFABLE_DATA_SOURCE__IDENTIFIER_IS_NOT_EQUAL_TO_ITSELF(__strong id _Nonnull, BOOL)");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = CFSTR("a section");
    if (a2)
      v6 = CFSTR("an item");
    objc_msgSend(v4, "handleFailureInFunction:file:lineNumber:description:", v5, CFSTR("_UIDiffableDataSourceHelpers.m"), 74, CFSTR("Diffable data source detected %@ identifier that is not equal to itself. An identifier must compare as equal to the same identifier. You must fix this in the == function (Swift) or -isEqual: method (Objective-C) implementation for this identifier's type. Identifier with invalid equality: %@"), v6, v3);

  }
  else
  {
    if (a2)
      v7 = CFSTR("an item");
    else
      v7 = CFSTR("a section");
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99750], CFSTR("Diffable data source detected %@ identifier that is not equal to itself. An identifier must compare as equal to the same identifier. You must fix this in the == function (Swift) or -isEqual: method (Objective-C) implementation for this identifier's type. Identifier with invalid equality: %@ Set a symbolic breakpoint on BUG_IN_CLIENT_OF_DIFFABLE_DATA_SOURCE__IDENTIFIER_IS_NOT_EQUAL_TO_ITSELF to catch this in the debugger. This will become an assert in a future version."), v7, v3);
  }

}

void BUG_IN_CLIENT_OF_DIFFABLE_DATA_SOURCE__EQUAL_IDENTIFIERS_HAVE_DIFFERENT_HASH_VALUES(void *a1, void *a2, int a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  const __CFString *v9;
  const __CFString *v10;

  v5 = a1;
  v6 = a2;
  _CVCApplicationIsAppleApp();
  if (dyld_program_sdk_at_least())
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "void BUG_IN_CLIENT_OF_DIFFABLE_DATA_SOURCE__EQUAL_IDENTIFIERS_HAVE_DIFFERENT_HASH_VALUES(__strong id _Nonnull, __strong id _Nonnull, BOOL)");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = CFSTR("section");
    if (a3)
      v9 = CFSTR("item");
    objc_msgSend(v7, "handleFailureInFunction:file:lineNumber:description:", v8, CFSTR("_UIDiffableDataSourceHelpers.m"), 78, CFSTR("Diffable data source detected %@ identifiers that are equal but have different hash values. Two identifiers which compare as equal must return the same hash value. You must fix this in the Hashable (Swift) or hash property (Objective-C) implementation for the type of these identifiers. Identifiers that are equal but have different hash values: (%@) and (%@)"), v9, v5, v6);

  }
  else
  {
    if (a3)
      v10 = CFSTR("item");
    else
      v10 = CFSTR("section");
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99750], CFSTR("Diffable data source detected %@ identifiers that are equal but have different hash values. Two identifiers which compare as equal must return the same hash value. You must fix this in the Hashable (Swift) or hash property (Objective-C) implementation for the type of these identifiers. Identifiers that are equal but have different hash values: (%@) and (%@) Set a symbolic breakpoint on BUG_IN_CLIENT_OF_DIFFABLE_DATA_SOURCE__EQUAL_IDENTIFIERS_HAVE_DIFFERENT_HASH_VALUES to catch this in the debugger. This will become an assert in a future version."), v10, v5, v6);
  }

}

void BUG_IN_CLIENT_OF_DIFFABLE_DATA_SOURCE__IDENTIFIERS_ARE_NOT_UNIQUE(void *a1, void *a2, int a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  const __CFString *v9;
  const __CFString *v10;

  v5 = a1;
  v6 = a2;
  _CVCApplicationIsAppleApp();
  if (dyld_program_sdk_at_least())
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "void BUG_IN_CLIENT_OF_DIFFABLE_DATA_SOURCE__IDENTIFIERS_ARE_NOT_UNIQUE(__strong id _Nonnull, __strong id _Nonnull, BOOL)");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = CFSTR("section");
    if (a3)
      v9 = CFSTR("item");
    objc_msgSend(v7, "handleFailureInFunction:file:lineNumber:description:", v8, CFSTR("_UIDiffableDataSourceHelpers.m"), 82, CFSTR("Diffable data source detected %@ identifiers that are not unique. You cannot add multiple identifiers to the same snapshot that compare as equal. This probably also means you have an issue in the Hashable (Swift) or hash property (Objective-C) implementation for the type of these identifiers, that causes equal identifiers to return different hash values. Identifiers that are not unique: (%@) and (%@)"), v9, v5, v6);

  }
  else
  {
    if (a3)
      v10 = CFSTR("item");
    else
      v10 = CFSTR("section");
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99750], CFSTR("Diffable data source detected %@ identifiers that are not unique. You cannot add multiple identifiers to the same snapshot that compare as equal. This probably also means you have an issue in the Hashable (Swift) or hash property (Objective-C) implementation for the type of these identifiers, that causes equal identifiers to return different hash values. Identifiers that are not unique: (%@) and (%@) Set a symbolic breakpoint on BUG_IN_CLIENT_OF_DIFFABLE_DATA_SOURCE__IDENTIFIERS_ARE_NOT_UNIQUE to catch this in the debugger. This will become an assert in a future version."), v10, v5, v6);
  }

}

void BUG_IN_CLIENT_OF_DIFFABLE_DATA_SOURCE__IDENTIFIER_ALREADY_EXISTS(void *a1, int a2)
{
  id v3;
  uint64_t v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  const __CFString *v10;
  void *v11;
  const __CFString *v12;
  const __CFString *v13;
  uint8_t buf[4];
  uint64_t v15;
  __int16 v16;
  const __CFString *v17;
  __int16 v18;
  const __CFString *v19;
  __int16 v20;
  const __CFString *v21;
  __int16 v22;
  void *v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v3 = a1;
  v4 = objc_msgSend(v3, "count");
  if (a2)
  {
    if (qword_1ECF88018 != -1)
      dispatch_once(&qword_1ECF88018, &__block_literal_global_42);
    v5 = (id)qword_1ECF88010;
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      v11 = v3;
      if (v4 == 1)
        v12 = CFSTR("identifier that already exists");
      else
        v12 = CFSTR("identifiers that already exist");
      if (v4 == 1)
        v13 = CFSTR("identifier");
      else
        v13 = CFSTR("identifiers");
      if (v4 == 1)
      {
        objc_msgSend(v3, "firstObject");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
      }
      *(_DWORD *)buf = 134219010;
      v15 = v4;
      v16 = 2112;
      v17 = v12;
      v18 = 2112;
      v19 = v13;
      v20 = 2112;
      v21 = v12;
      v22 = 2112;
      v23 = v11;
      _os_log_error_impl(&dword_1DD770000, v5, OS_LOG_TYPE_ERROR, "Diffable data source detected an attempt to insert or append %ld item %@ in the snapshot. The existing item %@ will be moved into place instead, but this operation will be more expensive. For best performance, inserted item identifiers should always be unique. Set a symbolic breakpoint on BUG_IN_CLIENT_OF_DIFFABLE_DATA_SOURCE__IDENTIFIER_ALREADY_EXISTS to catch this in the debugger. Item %@: %@", buf, 0x34u);
      if (v4 == 1)

    }
    goto LABEL_19;
  }
  _CVCApplicationIsAppleApp();
  if (dyld_program_sdk_at_least())
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "void BUG_IN_CLIENT_OF_DIFFABLE_DATA_SOURCE__IDENTIFIER_ALREADY_EXISTS(NSArray *__strong _Nonnull, BOOL)");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v4 == 1)
    {
      objc_msgSend(v3, "firstObject");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "handleFailureInFunction:file:lineNumber:description:", v7, CFSTR("_UIDiffableDataSourceHelpers.m"), 99, CFSTR("Diffable data source detected an attempt to insert or append %ld section %@ in the snapshot. Identifiers in a snapshot must be unique. Section %@: %@"), 1, CFSTR("identifier that already exists"), CFSTR("identifier that already exists"), v8);

    }
    else
    {
      objc_msgSend(v6, "handleFailureInFunction:file:lineNumber:description:", v7, CFSTR("_UIDiffableDataSourceHelpers.m"), 99, CFSTR("Diffable data source detected an attempt to insert or append %ld section %@ in the snapshot. Identifiers in a snapshot must be unique. Section %@: %@"), v4, CFSTR("identifiers that already exist"), CFSTR("identifiers that already exist"), v3);
    }

LABEL_18:
    goto LABEL_19;
  }
  v9 = (void *)MEMORY[0x1E0C99DA0];
  v6 = v3;
  if (v4 == 1)
    v10 = CFSTR("identifier that already exists");
  else
    v10 = CFSTR("identifiers that already exist");
  if (v4 == 1)
  {
    objc_msgSend(v3, "firstObject");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v9, "raise:format:", *MEMORY[0x1E0C99750], CFSTR("Diffable data source detected an attempt to insert or append %ld section %@ in the snapshot. Identifiers in a snapshot must be unique. Section %@: %@ Set a symbolic breakpoint on BUG_IN_CLIENT_OF_DIFFABLE_DATA_SOURCE__IDENTIFIER_ALREADY_EXISTS to catch this in the debugger. This will become an assert in a future version."), v4, v10, v10, v6);
  if (v4 == 1)
    goto LABEL_18;
LABEL_19:

}

void _UIDiffableDataSourceValidateIdentifiers(void *a1, int a2)
{
  id v2;
  unint64_t v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  unint64_t v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v2 = a1;
  v3 = objc_msgSend(v2, "count");
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v4 = v2;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v5)
  {
    v6 = v5;
    v7 = 0;
    v8 = *(_QWORD *)v18;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v18 != v8)
          objc_enumerationMutation(v4);
        v10 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * v9);
        if ((objc_msgSend(v10, "isEqual:", v10) & 1) == 0)
          BUG_IN_CLIENT_OF_DIFFABLE_DATA_SOURCE__IDENTIFIER_IS_NOT_EQUAL_TO_ITSELF(v10, a2);
        v11 = objc_msgSend(v10, "hash");
        if (v11 != objc_msgSend(v10, "hash"))
          BUG_IN_CLIENT_OF_DIFFABLE_DATA_SOURCE__IDENTIFIER_HASH_VALUE_CHANGED(v10, a2);
        if ((objc_msgSend(v4, "containsObject:", v10) & 1) == 0)
        {
          if (objc_msgSend(v10, "isEqual:", v10))
            BUG_IN_CLIENT_OF_DIFFABLE_DATA_SOURCE__IDENTIFIER_HASH_VALUE_CHANGED(v10, a2);
          else
            BUG_IN_CLIENT_OF_DIFFABLE_DATA_SOURCE__IDENTIFIER_IS_NOT_EQUAL_TO_ITSELF(v10, a2);
        }
        v12 = ++v7;
        if (v7 < v3)
        {
          do
          {
            v13 = (id)objc_msgSend(v4, "objectAtIndexedSubscript:", v12);
            if (objc_msgSend(v10, "isEqual:", v13))
            {
              v14 = objc_msgSend(v10, "hash");
              if (v14 != objc_msgSend(v13, "hash"))
                BUG_IN_CLIENT_OF_DIFFABLE_DATA_SOURCE__EQUAL_IDENTIFIERS_HAVE_DIFFERENT_HASH_VALUES(v10, v13, a2);
              BUG_IN_CLIENT_OF_DIFFABLE_DATA_SOURCE__IDENTIFIERS_ARE_NOT_UNIQUE(v10, v13, a2);
            }
            ++v12;
          }
          while (v12 < v3);
        }
        ++v9;
      }
      while (v9 != v6);
      v15 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
      v6 = v15;
    }
    while (v15);
  }

}

void _UIDiffableDataSourceValidateIdentifiersForDiff(void *a1, void *a2, int a3)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t j;
  void *v14;
  uint64_t v15;
  id obj;
  id v18;
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
  obj = a1;
  v18 = a2;
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v23, v28, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v24;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v24 != v6)
          objc_enumerationMutation(obj);
        v8 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * i);
        v19 = 0u;
        v20 = 0u;
        v21 = 0u;
        v22 = 0u;
        v9 = v18;
        v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v19, v27, 16);
        if (v10)
        {
          v11 = v10;
          v12 = *(_QWORD *)v20;
          do
          {
            for (j = 0; j != v11; ++j)
            {
              if (*(_QWORD *)v20 != v12)
                objc_enumerationMutation(v9);
              v14 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * j);
              if (objc_msgSend(v8, "isEqual:", v14))
              {
                v15 = objc_msgSend(v8, "hash");
                if (v15 != objc_msgSend(v14, "hash"))
                  BUG_IN_CLIENT_OF_DIFFABLE_DATA_SOURCE__EQUAL_IDENTIFIERS_HAVE_DIFFERENT_HASH_VALUES(v8, v14, a3);
              }
            }
            v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v19, v27, 16);
          }
          while (v11);
        }

      }
      v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v23, v28, 16);
    }
    while (v5);
  }
  _UIDiffableDataSourceValidateIdentifiers(obj, a3);
  _UIDiffableDataSourceValidateIdentifiers(v18, a3);

}

void ___diffableLog_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.UIKit", "DiffableDataSource");
  v1 = (void *)qword_1ECF88010;
  qword_1ECF88010 = (uint64_t)v0;

}

void _CVCDiffableDataSourceInitializeWithUpdateItemClass(uint64_t a1)
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = ___CVCDiffableDataSourceInitializeWithUpdateItemClass_block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
  block[4] = a1;
  if (_CVCDiffableDataSourceInitializeWithUpdateItemClass_onceToken != -1)
    dispatch_once(&_CVCDiffableDataSourceInitializeWithUpdateItemClass_onceToken, block);
}

id _UIDiffableDataSourceApplyInsertUpdate(void *a1, void *a2, void *a3, void *a4, int a5)
{
  id v9;
  id v10;
  id v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  id v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  uint64_t v34;
  uint64_t v35;
  id v36;
  id v37;
  uint64_t v38;
  id v39;
  id v40;
  id v41;
  id v42;
  void *v43;
  uint64_t v44;
  void *v45;
  id v46;
  void *v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t j;
  uint64_t v51;
  void *v52;
  _UIDiffableDataSourceUpdate *v53;
  void *v54;
  void *v55;
  BOOL v56;
  void *v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t k;
  uint64_t v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  unint64_t v66;
  void *v67;
  uint64_t v68;
  void *v69;
  unint64_t v70;
  void *v71;
  void *v72;
  void *v73;
  uint64_t v74;
  void *v75;
  uint64_t v76;
  void *v77;
  uint64_t v78;
  uint64_t v79;
  id v80;
  void *v82;
  void *v83;
  id v84;
  void *v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t i;
  uint64_t v89;
  void *v90;
  void *v91;
  void *v92;
  void *v93;
  void *v94;
  void *v95;
  uint64_t v96;
  id v97;
  void *v98;
  id v99;
  void *v100;
  void *v101;
  void *v102;
  void *v103;
  uint64_t (**v104)(void);
  id v105;
  void *v106;
  void *v107;
  void *v108;
  void *v109;
  void *v110;
  __int128 v111;
  __int128 v112;
  __int128 v113;
  __int128 v114;
  __int128 v115;
  __int128 v116;
  __int128 v117;
  __int128 v118;
  _QWORD v119[4];
  id v120;
  id v121;
  id v122;
  id v123;
  id v124;
  uint64_t *v125;
  _QWORD v126[4];
  id v127;
  id v128;
  uint64_t *v129;
  uint64_t v130;
  uint64_t *v131;
  uint64_t v132;
  uint64_t (*v133)(uint64_t, uint64_t);
  void (*v134)(uint64_t);
  id v135;
  __int128 v136;
  __int128 v137;
  __int128 v138;
  __int128 v139;
  _BYTE v140[128];
  _BYTE v141[128];
  _BYTE v142[128];
  uint64_t v143;

  v143 = *MEMORY[0x1E0C80C00];
  v9 = a1;
  v10 = a2;
  v11 = a3;
  v12 = a4;
  v107 = v10;
  v108 = v9;
  v106 = v11;
  v109 = v12;
  if (v9)
  {
    if (v10)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "NSArray<id<_CVCCollectionUpdateItem>> * _Nonnull _UIDiffableDataSourceApplyInsertUpdate(_UIDiffableDataSourceUpdate *__strong _Nonnull, NSMutableOrderedSet *__strong _Nonnull, NSMutableOrderedSet *__strong _Nonnull, _UIDataSourceSnapshotter *__strong _Nonnull, BOOL)");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "handleFailureInFunction:file:lineNumber:description:", v19, CFSTR("_UIDiffableDataSourceUpdate.m"), 191, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("update"));

    v9 = 0;
    v11 = v106;
    if (v10)
    {
LABEL_3:
      if (v11)
        goto LABEL_4;
LABEL_14:
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "NSArray<id<_CVCCollectionUpdateItem>> * _Nonnull _UIDiffableDataSourceApplyInsertUpdate(_UIDiffableDataSourceUpdate *__strong _Nonnull, NSMutableOrderedSet *__strong _Nonnull, NSMutableOrderedSet *__strong _Nonnull, _UIDataSourceSnapshotter *__strong _Nonnull, BOOL)");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "handleFailureInFunction:file:lineNumber:description:", v23, CFSTR("_UIDiffableDataSourceUpdate.m"), 193, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("itemIdentifiers"));

      v9 = v108;
      v11 = v106;
      if (v12)
        goto LABEL_5;
      goto LABEL_15;
    }
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "NSArray<id<_CVCCollectionUpdateItem>> * _Nonnull _UIDiffableDataSourceApplyInsertUpdate(_UIDiffableDataSourceUpdate *__strong _Nonnull, NSMutableOrderedSet *__strong _Nonnull, NSMutableOrderedSet *__strong _Nonnull, _UIDataSourceSnapshotter *__strong _Nonnull, BOOL)");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "handleFailureInFunction:file:lineNumber:description:", v21, CFSTR("_UIDiffableDataSourceUpdate.m"), 192, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("sectionIdentifiers"));

  v9 = v108;
  v11 = v106;
  if (!v106)
    goto LABEL_14;
LABEL_4:
  if (v12)
    goto LABEL_5;
LABEL_15:
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "NSArray<id<_CVCCollectionUpdateItem>> * _Nonnull _UIDiffableDataSourceApplyInsertUpdate(_UIDiffableDataSourceUpdate *__strong _Nonnull, NSMutableOrderedSet *__strong _Nonnull, NSMutableOrderedSet *__strong _Nonnull, _UIDataSourceSnapshotter *__strong _Nonnull, BOOL)");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "handleFailureInFunction:file:lineNumber:description:", v25, CFSTR("_UIDiffableDataSourceUpdate.m"), 194, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("dataSourceSnapshot"));

  v9 = v108;
  v11 = v106;
LABEL_5:
  v13 = objc_msgSend(v12, "numberOfItems");
  if (v13 != objc_msgSend(v11, "count"))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "NSArray<id<_CVCCollectionUpdateItem>> * _Nonnull _UIDiffableDataSourceApplyInsertUpdate(_UIDiffableDataSourceUpdate *__strong _Nonnull, NSMutableOrderedSet *__strong _Nonnull, NSMutableOrderedSet *__strong _Nonnull, _UIDataSourceSnapshotter *__strong _Nonnull, BOOL)");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "handleFailureInFunction:file:lineNumber:description:", v27, CFSTR("_UIDiffableDataSourceUpdate.m"), 195, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("dataSourceSnapshot.numberOfItems == itemIdentifiers.count"));

    v9 = v108;
    v11 = v106;
  }
  v14 = objc_msgSend(v12, "numberOfSections");
  if (v14 != objc_msgSend(v10, "count"))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "NSArray<id<_CVCCollectionUpdateItem>> * _Nonnull _UIDiffableDataSourceApplyInsertUpdate(_UIDiffableDataSourceUpdate *__strong _Nonnull, NSMutableOrderedSet *__strong _Nonnull, NSMutableOrderedSet *__strong _Nonnull, _UIDataSourceSnapshotter *__strong _Nonnull, BOOL)");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "handleFailureInFunction:file:lineNumber:description:", v29, CFSTR("_UIDiffableDataSourceUpdate.m"), 196, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("dataSourceSnapshot.numberOfSections == sectionIdentifiers.count"));

    v9 = v108;
    v11 = v106;
  }
  if (objc_msgSend(v9, "action"))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "NSArray<id<_CVCCollectionUpdateItem>> * _Nonnull _UIDiffableDataSourceApplyInsertUpdate(_UIDiffableDataSourceUpdate *__strong _Nonnull, NSMutableOrderedSet *__strong _Nonnull, NSMutableOrderedSet *__strong _Nonnull, _UIDataSourceSnapshotter *__strong _Nonnull, BOOL)");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "handleFailureInFunction:file:lineNumber:description:", v31, CFSTR("_UIDiffableDataSourceUpdate.m"), 197, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("update.action == _CVCCollectionUpdateActionInsert"));

    v9 = v108;
    v11 = v106;
    if (a5)
      goto LABEL_11;
  }
  else if (a5)
  {
LABEL_11:
    v15 = objc_alloc(MEMORY[0x1E0C99DE8]);
    objc_msgSend(v9, "identifiers");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v15, "initWithCapacity:", objc_msgSend(v16, "count"));

    v110 = (void *)v17;
    v105 = (id)v17;
    v9 = v108;
    v11 = v106;
    goto LABEL_18;
  }
  v110 = 0;
  v105 = (id)MEMORY[0x1E0C9AA60];
LABEL_18:
  if (objc_msgSend(v9, "isSectionOperation"))
  {
    objc_msgSend(v9, "destinationIdentifier");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v33 = v107;
    if (v32)
      v34 = objc_msgSend(v107, "indexOfObject:", v32);
    else
      v34 = objc_msgSend(v107, "count");
    v66 = v34;
    if (v34 == 0x7FFFFFFFFFFFFFFFLL)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v82 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "NSArray<id<_CVCCollectionUpdateItem>> * _Nonnull _UIDiffableDataSourceApplyInsertUpdate(_UIDiffableDataSourceUpdate *__strong _Nonnull, NSMutableOrderedSet *__strong _Nonnull, NSMutableOrderedSet *__strong _Nonnull, _UIDataSourceSnapshotter *__strong _Nonnull, BOOL)");
      v83 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v82, "handleFailureInFunction:file:lineNumber:description:", v83, CFSTR("_UIDiffableDataSourceUpdate.m"), 206, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("insertIndex != NSNotFound"));

      v33 = v107;
    }
    if (objc_msgSend(v108, "relativePosition") == 1 && v66 < objc_msgSend(v33, "count"))
      ++v66;
    objc_msgSend(v108, "identifiers");
    v67 = (void *)objc_claimAutoreleasedReturnValue();
    v68 = objc_msgSend(v67, "count");

    v69 = v12;
    if (v68 >= 1)
    {
      v70 = v66;
      do
      {
        objc_msgSend(v69, "_insertSection:withInitialCount:", v70, 0);
        if (a5)
        {
          objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForItem:inSection:", 0x7FFFFFFFFFFFFFFFLL, v70);
          v71 = (void *)objc_claimAutoreleasedReturnValue();
          _CVCUpdateItemAlloc();
          v72 = (void *)objc_msgSend((id)objc_claimAutoreleasedReturnValue(), "initWithInitialIndexPath:finalIndexPath:updateAction:", 0, v71, 0);
          objc_msgSend(v110, "addObject:", v72);

          v69 = v12;
        }
        ++v70;
        --v68;
      }
      while (v68);
    }
    v73 = (void *)objc_msgSend(v107, "copy");
    v74 = objc_msgSend(v107, "count");
    objc_msgSend(v108, "identifiers");
    v75 = (void *)objc_claimAutoreleasedReturnValue();
    _UIDiffableDataSourceInsertIdentifiersAtIndex(v107, v75, v66, 0);

    v76 = objc_msgSend(v107, "count");
    objc_msgSend(v108, "identifiers");
    v77 = (void *)objc_claimAutoreleasedReturnValue();
    v78 = v76 - v74;
    v79 = objc_msgSend(v77, "count");

    if (v78 != v79)
    {
      v84 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v136 = 0u;
      v137 = 0u;
      v138 = 0u;
      v139 = 0u;
      objc_msgSend(v108, "identifiers");
      v85 = (void *)objc_claimAutoreleasedReturnValue();
      v86 = objc_msgSend(v85, "countByEnumeratingWithState:objects:count:", &v136, v142, 16);
      if (v86)
      {
        v87 = *(_QWORD *)v137;
        do
        {
          for (i = 0; i != v86; ++i)
          {
            if (*(_QWORD *)v137 != v87)
              objc_enumerationMutation(v85);
            v89 = *(_QWORD *)(*((_QWORD *)&v136 + 1) + 8 * i);
            if (objc_msgSend(v73, "containsObject:", v89))
              objc_msgSend(v84, "addObject:", v89);
          }
          v86 = objc_msgSend(v85, "countByEnumeratingWithState:objects:count:", &v136, v142, 16);
        }
        while (v86);
      }

      if (objc_msgSend(v84, "count"))
        BUG_IN_CLIENT_OF_DIFFABLE_DATA_SOURCE__IDENTIFIER_ALREADY_EXISTS(v84, 0);
      _UIDiffableDataSourceValidateIdentifiers(v107, 0);
      objc_msgSend(v108, "identifiers");
      v90 = (void *)objc_claimAutoreleasedReturnValue();
      _UIDiffableDataSourceValidateIdentifiers(v90, 0);

    }
  }
  else
  {
    v130 = 0;
    v131 = &v130;
    v132 = 0x3032000000;
    v133 = __Block_byref_object_copy__0;
    v134 = __Block_byref_object_dispose__0;
    v35 = MEMORY[0x1E0C809B0];
    v135 = 0;
    v126[0] = MEMORY[0x1E0C809B0];
    v126[1] = 3221225472;
    v126[2] = ___UIDiffableDataSourceApplyInsertUpdate_block_invoke;
    v126[3] = &unk_1EA7CE590;
    v129 = &v130;
    v36 = v11;
    v127 = v36;
    v37 = v9;
    v128 = v37;
    v38 = MEMORY[0x1DF0DB6D0](v126);
    v119[0] = v35;
    v119[1] = 3221225472;
    v119[2] = ___UIDiffableDataSourceApplyInsertUpdate_block_invoke_2;
    v119[3] = &unk_1EA7CE5B8;
    v39 = v37;
    v120 = v39;
    v99 = v107;
    v121 = v99;
    v40 = (id)v38;
    v124 = v40;
    v41 = v12;
    v122 = v41;
    v123 = v36;
    v125 = &v130;
    v42 = v123;
    v104 = (uint64_t (**)(void))MEMORY[0x1DF0DB6D0](v119);
    v43 = (void *)objc_msgSend(v42, "copy");
    v103 = (void *)objc_msgSend(v41, "copy");
    v44 = v104[2]();
    objc_msgSend(v39, "identifiers");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    LOBYTE(v38) = v44 == objc_msgSend(v45, "count");

    if ((v38 & 1) == 0)
    {
      v46 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v95 = v42;
      v97 = v39;
      v117 = 0u;
      v118 = 0u;
      v115 = 0u;
      v116 = 0u;
      objc_msgSend(v39, "identifiers");
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      v48 = objc_msgSend(v47, "countByEnumeratingWithState:objects:count:", &v115, v141, 16);
      if (v48)
      {
        v49 = *(_QWORD *)v116;
        do
        {
          for (j = 0; j != v48; ++j)
          {
            if (*(_QWORD *)v116 != v49)
              objc_enumerationMutation(v47);
            v51 = *(_QWORD *)(*((_QWORD *)&v115 + 1) + 8 * j);
            if (objc_msgSend(v43, "containsObject:", v51))
              objc_msgSend(v46, "addObject:", v51);
          }
          v48 = objc_msgSend(v47, "countByEnumeratingWithState:objects:count:", &v115, v141, 16);
        }
        while (v48);
      }

      v42 = v95;
      v39 = v97;
      if (objc_msgSend(v46, "count"))
        BUG_IN_CLIENT_OF_DIFFABLE_DATA_SOURCE__IDENTIFIER_ALREADY_EXISTS(v46, 1);
      objc_msgSend(v95, "removeAllObjects");
      _UIDiffableDataSourceInsertIdentifiersAtIndex(v95, v43, 0, 1);
      v52 = (void *)v131[5];
      v131[5] = 0;

      objc_msgSend(v41, "_resetToStateOfSnapshotter:", v103);
      v53 = -[_UIDiffableDataSourceUpdate initWithItemIdentifiers:action:]([_UIDiffableDataSourceUpdate alloc], "initWithItemIdentifiers:action:", v46, 1);
      _UIDiffableDataSourceApplyDeleteUpdate(v53, v99, v95, v41, a5);
      v54 = (void *)objc_claimAutoreleasedReturnValue();
      if (a5)
        objc_msgSend(v110, "addObjectsFromArray:", v54);
      v44 = v104[2]();

    }
    objc_msgSend(v39, "identifiers");
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    v56 = v44 == objc_msgSend(v55, "count");

    if (!v56)
    {
      _UIDiffableDataSourceValidateIdentifiers(v42, 1);
      objc_msgSend(v39, "identifiers");
      v91 = (void *)objc_claimAutoreleasedReturnValue();
      _UIDiffableDataSourceValidateIdentifiers(v91, 1);

      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v98 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "NSArray<id<_CVCCollectionUpdateItem>> * _Nonnull _UIDiffableDataSourceApplyInsertUpdate(_UIDiffableDataSourceUpdate *__strong _Nonnull, NSMutableOrderedSet *__strong _Nonnull, NSMutableOrderedSet *__strong _Nonnull, _UIDataSourceSnapshotter *__strong _Nonnull, BOOL)");
      v102 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v39, "identifiers");
      v92 = (void *)objc_claimAutoreleasedReturnValue();
      v96 = objc_msgSend(v92, "count");
      objc_msgSend(v39, "identifiers");
      v93 = (void *)objc_claimAutoreleasedReturnValue();
      v94 = (void *)objc_msgSend(v93, "mutableCopy");

      objc_msgSend(v94, "minusOrderedSet:", v42);
      objc_msgSend(v98, "handleFailureInFunction:file:lineNumber:description:", v102, CFSTR("_UIDiffableDataSourceUpdate.m"), 378, CFSTR("Diffable data source internal inconsistency: attempted to insert %ld identifiers but only %ld inserted. Identifiers that failed to insert: %@"), v96, v44, v94);

    }
    if (a5)
    {
      v113 = 0u;
      v114 = 0u;
      v111 = 0u;
      v112 = 0u;
      objc_msgSend(v39, "identifiers");
      v57 = (void *)objc_claimAutoreleasedReturnValue();
      v58 = objc_msgSend(v57, "countByEnumeratingWithState:objects:count:", &v111, v140, 16);
      if (v58)
      {
        v59 = *(_QWORD *)v112;
        do
        {
          for (k = 0; k != v58; ++k)
          {
            if (*(_QWORD *)v112 != v59)
              objc_enumerationMutation(v57);
            v61 = (*((uint64_t (**)(id, _QWORD))v40 + 2))(v40, *(_QWORD *)(*((_QWORD *)&v111 + 1) + 8 * k));
            if (v61 == 0x7FFFFFFFFFFFFFFFLL)
            {
              objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
              v100 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "NSArray<id<_CVCCollectionUpdateItem>> * _Nonnull _UIDiffableDataSourceApplyInsertUpdate(_UIDiffableDataSourceUpdate *__strong _Nonnull, NSMutableOrderedSet *__strong _Nonnull, NSMutableOrderedSet *__strong _Nonnull, _UIDataSourceSnapshotter *__strong _Nonnull, BOOL)");
              v64 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v100, "handleFailureInFunction:file:lineNumber:description:", v64, CFSTR("_UIDiffableDataSourceUpdate.m"), 385, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("index != NSNotFound"));

            }
            objc_msgSend(v41, "indexPathForGlobalIndex:", v61);
            v62 = (void *)objc_claimAutoreleasedReturnValue();
            if (!v62)
            {
              objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
              v101 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "NSArray<id<_CVCCollectionUpdateItem>> * _Nonnull _UIDiffableDataSourceApplyInsertUpdate(_UIDiffableDataSourceUpdate *__strong _Nonnull, NSMutableOrderedSet *__strong _Nonnull, NSMutableOrderedSet *__strong _Nonnull, _UIDataSourceSnapshotter *__strong _Nonnull, BOOL)");
              v65 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v101, "handleFailureInFunction:file:lineNumber:description:", v65, CFSTR("_UIDiffableDataSourceUpdate.m"), 387, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("indexPath"));

            }
            _CVCUpdateItemAlloc();
            v63 = (void *)objc_msgSend((id)objc_claimAutoreleasedReturnValue(), "initWithInitialIndexPath:finalIndexPath:updateAction:", 0, v62, 0);
            objc_msgSend(v110, "addObject:", v63);

          }
          v58 = objc_msgSend(v57, "countByEnumeratingWithState:objects:count:", &v111, v140, 16);
        }
        while (v58);
      }

    }
    _Block_object_dispose(&v130, 8);

  }
  v80 = v105;

  return v80;
}

void sub_1DD77E908(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,char a57)
{
  _Block_object_dispose(&a57, 8);
  _Unwind_Resume(a1);
}

id _CVCUpdateItemAlloc()
{
  objc_class *v0;
  void *v2;
  void *v3;

  v0 = (objc_class *)CollectionUpdateItemClass;
  if (!CollectionUpdateItemClass)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "id<_CVCCollectionUpdateItem> _CVCUpdateItemAlloc(void)");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, CFSTR("_UIDiffableDataSourceUpdate.m"), 47, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("CollectionUpdateItemClass != nil"));

    v0 = (objc_class *)CollectionUpdateItemClass;
  }
  return [v0 alloc];
}

id _UIDiffableDataSourceApplyDeleteUpdate(void *a1, void *a2, void *a3, void *a4, int a5)
{
  id v8;
  id v9;
  id v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  id v14;
  void *v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t i;
  void *v20;
  void *v21;
  char v22;
  int v23;
  uint64_t v24;
  id v25;
  id v26;
  uint64_t (**v27)(_QWORD, _QWORD);
  id v28;
  void *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t j;
  uint64_t v33;
  uint64_t (**v34)(_QWORD, _QWORD);
  id v35;
  void *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t k;
  uint64_t v40;
  uint64_t v41;
  void *v42;
  void *v43;
  void *v44;
  id v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t m;
  void *v49;
  id v50;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  id v68;
  id v69;
  id v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  __int128 v83;
  _QWORD v84[4];
  id v85;
  id v86;
  uint64_t *v87;
  _QWORD v88[4];
  id v89;
  id v90;
  id v91;
  char v92;
  __int128 v93;
  __int128 v94;
  __int128 v95;
  __int128 v96;
  _QWORD v97[4];
  id v98;
  id v99;
  uint64_t *v100;
  uint64_t v101;
  uint64_t *v102;
  uint64_t v103;
  uint64_t (*v104)(uint64_t, uint64_t);
  void (*v105)(uint64_t);
  id v106;
  _BYTE v107[128];
  _BYTE v108[128];
  _BYTE v109[128];
  uint64_t v110;

  v110 = *MEMORY[0x1E0C80C00];
  v8 = a1;
  v9 = a2;
  v10 = a3;
  v11 = a4;
  v71 = v9;
  v72 = v8;
  v73 = v10;
  if (v8)
  {
    if (v9)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "NSArray<id<_CVCCollectionUpdateItem>> * _Nonnull _UIDiffableDataSourceApplyDeleteUpdate(_UIDiffableDataSourceUpdate *__strong _Nonnull, NSMutableOrderedSet *__strong _Nonnull, NSMutableOrderedSet *__strong _Nonnull, _UIDataSourceSnapshotter *__strong _Nonnull, BOOL)");
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v52, "handleFailureInFunction:file:lineNumber:description:", v53, CFSTR("_UIDiffableDataSourceUpdate.m"), 403, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("update"));

    v8 = 0;
    v10 = v73;
    if (v9)
    {
LABEL_3:
      if (v10)
        goto LABEL_4;
LABEL_57:
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v56 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "NSArray<id<_CVCCollectionUpdateItem>> * _Nonnull _UIDiffableDataSourceApplyDeleteUpdate(_UIDiffableDataSourceUpdate *__strong _Nonnull, NSMutableOrderedSet *__strong _Nonnull, NSMutableOrderedSet *__strong _Nonnull, _UIDataSourceSnapshotter *__strong _Nonnull, BOOL)");
      v57 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v56, "handleFailureInFunction:file:lineNumber:description:", v57, CFSTR("_UIDiffableDataSourceUpdate.m"), 405, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("itemIdentifiers"));

      v8 = v72;
      v10 = v73;
      if (v11)
        goto LABEL_5;
      goto LABEL_58;
    }
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "NSArray<id<_CVCCollectionUpdateItem>> * _Nonnull _UIDiffableDataSourceApplyDeleteUpdate(_UIDiffableDataSourceUpdate *__strong _Nonnull, NSMutableOrderedSet *__strong _Nonnull, NSMutableOrderedSet *__strong _Nonnull, _UIDataSourceSnapshotter *__strong _Nonnull, BOOL)");
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v54, "handleFailureInFunction:file:lineNumber:description:", v55, CFSTR("_UIDiffableDataSourceUpdate.m"), 404, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("sectionIdentifiers"));

  v8 = v72;
  v10 = v73;
  if (!v73)
    goto LABEL_57;
LABEL_4:
  if (v11)
    goto LABEL_5;
LABEL_58:
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "NSArray<id<_CVCCollectionUpdateItem>> * _Nonnull _UIDiffableDataSourceApplyDeleteUpdate(_UIDiffableDataSourceUpdate *__strong _Nonnull, NSMutableOrderedSet *__strong _Nonnull, NSMutableOrderedSet *__strong _Nonnull, _UIDataSourceSnapshotter *__strong _Nonnull, BOOL)");
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v58, "handleFailureInFunction:file:lineNumber:description:", v59, CFSTR("_UIDiffableDataSourceUpdate.m"), 406, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("dataSourceSnapshot"));

  v8 = v72;
  v10 = v73;
LABEL_5:
  v12 = objc_msgSend(v11, "numberOfItems");
  if (v12 != objc_msgSend(v10, "count"))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "NSArray<id<_CVCCollectionUpdateItem>> * _Nonnull _UIDiffableDataSourceApplyDeleteUpdate(_UIDiffableDataSourceUpdate *__strong _Nonnull, NSMutableOrderedSet *__strong _Nonnull, NSMutableOrderedSet *__strong _Nonnull, _UIDataSourceSnapshotter *__strong _Nonnull, BOOL)");
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v60, "handleFailureInFunction:file:lineNumber:description:", v61, CFSTR("_UIDiffableDataSourceUpdate.m"), 407, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("dataSourceSnapshot.numberOfItems == itemIdentifiers.count"));

    v8 = v72;
    v10 = v73;
  }
  v13 = objc_msgSend(v11, "numberOfSections");
  if (v13 != objc_msgSend(v9, "count"))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "NSArray<id<_CVCCollectionUpdateItem>> * _Nonnull _UIDiffableDataSourceApplyDeleteUpdate(_UIDiffableDataSourceUpdate *__strong _Nonnull, NSMutableOrderedSet *__strong _Nonnull, NSMutableOrderedSet *__strong _Nonnull, _UIDataSourceSnapshotter *__strong _Nonnull, BOOL)");
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v62, "handleFailureInFunction:file:lineNumber:description:", v63, CFSTR("_UIDiffableDataSourceUpdate.m"), 408, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("dataSourceSnapshot.numberOfSections == sectionIdentifiers.count"));

    v8 = v72;
    v10 = v73;
  }
  if (objc_msgSend(v8, "action") != 1)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "NSArray<id<_CVCCollectionUpdateItem>> * _Nonnull _UIDiffableDataSourceApplyDeleteUpdate(_UIDiffableDataSourceUpdate *__strong _Nonnull, NSMutableOrderedSet *__strong _Nonnull, NSMutableOrderedSet *__strong _Nonnull, _UIDataSourceSnapshotter *__strong _Nonnull, BOOL)");
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v64, "handleFailureInFunction:file:lineNumber:description:", v65, CFSTR("_UIDiffableDataSourceUpdate.m"), 409, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("update.action == _CVCCollectionUpdateActionDelete"));

    v8 = v72;
    v10 = v73;
  }
  if (a5)
  {
    v14 = objc_alloc(MEMORY[0x1E0C99DE8]);
    objc_msgSend(v8, "identifiers");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = (id)objc_msgSend(v14, "initWithCapacity:", objc_msgSend(v15, "count"));

    v8 = v72;
    if ((objc_msgSend(v72, "isDeleteAll") & 1) != 0)
    {
      v17 = objc_msgSend(v11, "numberOfSections");
      if (v17 < 1)
      {
        v70 = v16;
      }
      else
      {
        v18 = v17;
        for (i = 0; i != v18; ++i)
        {
          objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForItem:inSection:", 0x7FFFFFFFFFFFFFFFLL, i);
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          _CVCUpdateItemAlloc();
          v21 = (void *)objc_msgSend((id)objc_claimAutoreleasedReturnValue(), "initWithAction:forIndexPath:", 1, v20);
          objc_msgSend(v16, "addObject:", v21);

        }
        v70 = v16;
      }
      v10 = v73;
      goto LABEL_53;
    }
    v70 = v16;
    v10 = v73;
  }
  else
  {
    v22 = objc_msgSend(v8, "isDeleteAll");
    v16 = 0;
    v70 = (id)MEMORY[0x1E0C9AA60];
    if ((v22 & 1) != 0)
    {
LABEL_53:
      objc_msgSend(v9, "removeAllObjects");
      objc_msgSend(v10, "removeAllObjects");
      objc_msgSend(v11, "_deleteAllSections");
      goto LABEL_54;
    }
  }
  v74 = v16;
  v23 = objc_msgSend(v8, "isSectionOperation");
  v24 = MEMORY[0x1E0C809B0];
  if (v23)
  {
    v101 = 0;
    v102 = &v101;
    v103 = 0x3032000000;
    v104 = __Block_byref_object_copy__0;
    v105 = __Block_byref_object_dispose__0;
    v106 = 0;
    v97[0] = MEMORY[0x1E0C809B0];
    v97[1] = 3221225472;
    v97[2] = ___UIDiffableDataSourceApplyDeleteUpdate_block_invoke;
    v97[3] = &unk_1EA7CE590;
    v100 = &v101;
    v25 = v9;
    v98 = v25;
    v26 = v8;
    v99 = v26;
    v27 = (uint64_t (**)(_QWORD, _QWORD))MEMORY[0x1DF0DB6D0](v97);
    v28 = objc_alloc_init(MEMORY[0x1E0CB3788]);
    v95 = 0u;
    v96 = 0u;
    v93 = 0u;
    v94 = 0u;
    objc_msgSend(v26, "identifiers");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v93, v109, 16);
    if (v30)
    {
      v31 = *(_QWORD *)v94;
      do
      {
        for (j = 0; j != v30; ++j)
        {
          if (*(_QWORD *)v94 != v31)
            objc_enumerationMutation(v29);
          v33 = v27[2](v27, *(_QWORD *)(*((_QWORD *)&v93 + 1) + 8 * j));
          if (v33 != 0x7FFFFFFFFFFFFFFFLL)
            objc_msgSend(v28, "addIndex:", v33);
        }
        v30 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v93, v109, 16);
      }
      while (v30);
    }

    objc_msgSend(v25, "removeObjectsAtIndexes:", v28);
    v88[0] = v24;
    v88[1] = 3221225472;
    v88[2] = ___UIDiffableDataSourceApplyDeleteUpdate_block_invoke_2;
    v88[3] = &unk_1EA7CE5E0;
    v89 = v11;
    v90 = v73;
    v92 = a5;
    v16 = v74;
    v91 = v16;
    objc_msgSend(v28, "enumerateIndexesWithOptions:usingBlock:", 2, v88);

    _Block_object_dispose(&v101, 8);
  }
  else
  {
    v101 = 0;
    v102 = &v101;
    v103 = 0x3032000000;
    v104 = __Block_byref_object_copy__0;
    v105 = __Block_byref_object_dispose__0;
    v106 = 0;
    v84[0] = MEMORY[0x1E0C809B0];
    v84[1] = 3221225472;
    v84[2] = ___UIDiffableDataSourceApplyDeleteUpdate_block_invoke_3;
    v84[3] = &unk_1EA7CE590;
    v87 = &v101;
    v68 = v10;
    v85 = v68;
    v69 = v8;
    v86 = v69;
    v34 = (uint64_t (**)(_QWORD, _QWORD))MEMORY[0x1DF0DB6D0](v84);
    v35 = objc_alloc_init(MEMORY[0x1E0CB3550]);
    v82 = 0u;
    v83 = 0u;
    v80 = 0u;
    v81 = 0u;
    objc_msgSend(v69, "identifiers");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    v37 = objc_msgSend(v36, "countByEnumeratingWithState:objects:count:", &v80, v108, 16);
    if (v37)
    {
      v38 = *(_QWORD *)v81;
      do
      {
        for (k = 0; k != v37; ++k)
        {
          if (*(_QWORD *)v81 != v38)
            objc_enumerationMutation(v36);
          v40 = v34[2](v34, *(_QWORD *)(*((_QWORD *)&v80 + 1) + 8 * k));
          if (v40 != 0x7FFFFFFFFFFFFFFFLL)
          {
            v41 = objc_msgSend(v11, "sectionForGlobalIndex:", v40);
            if (v41 == 0x7FFFFFFFFFFFFFFFLL)
            {
              objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
              v67 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "NSArray<id<_CVCCollectionUpdateItem>> * _Nonnull _UIDiffableDataSourceApplyDeleteUpdate(_UIDiffableDataSourceUpdate *__strong _Nonnull, NSMutableOrderedSet *__strong _Nonnull, NSMutableOrderedSet *__strong _Nonnull, _UIDataSourceSnapshotter *__strong _Nonnull, BOOL)");
              v66 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v67, "handleFailureInFunction:file:lineNumber:description:", v66, CFSTR("_UIDiffableDataSourceUpdate.m"), 490, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("section != NSNotFound"));

            }
            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v41);
            v42 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v35, "addObject:", v42);

            if (a5)
            {
              objc_msgSend(v11, "indexPathForGlobalIndex:", v40);
              v43 = (void *)objc_claimAutoreleasedReturnValue();
              _CVCUpdateItemAlloc();
              v44 = (void *)objc_msgSend((id)objc_claimAutoreleasedReturnValue(), "initWithAction:forIndexPath:", 1, v43);
              objc_msgSend(v74, "addObject:", v44);

            }
          }
        }
        v37 = objc_msgSend(v36, "countByEnumeratingWithState:objects:count:", &v80, v108, 16);
      }
      while (v37);
    }

    v78 = 0u;
    v79 = 0u;
    v76 = 0u;
    v77 = 0u;
    v45 = v35;
    v46 = objc_msgSend(v45, "countByEnumeratingWithState:objects:count:", &v76, v107, 16);
    if (v46)
    {
      v47 = *(_QWORD *)v77;
      do
      {
        for (m = 0; m != v46; ++m)
        {
          if (*(_QWORD *)v77 != v47)
            objc_enumerationMutation(v45);
          objc_msgSend(v11, "_decrementSectionCount:byCount:", objc_msgSend(*(id *)(*((_QWORD *)&v76 + 1) + 8 * m), "integerValue"), objc_msgSend(v45, "countForObject:", *(_QWORD *)(*((_QWORD *)&v76 + 1) + 8 * m)));
        }
        v46 = objc_msgSend(v45, "countByEnumeratingWithState:objects:count:", &v76, v107, 16);
      }
      while (v46);
    }

    objc_msgSend(v69, "identifiers");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v68, "minusOrderedSet:", v49);

    _Block_object_dispose(&v101, 8);
    v16 = v74;
  }
LABEL_54:
  v50 = v70;

  return v50;
}

void sub_1DD77F774(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,uint64_t a57,uint64_t a58,uint64_t a59,uint64_t a60,uint64_t a61,uint64_t a62,uint64_t a63)
{
  char a69;

  _Block_object_dispose(&a69, 8);
  _Unwind_Resume(a1);
}

id _UIDiffableDataSourceApplyMoveUpdate(void *a1, void *a2, void *a3, void *a4, int a5)
{
  id v9;
  id v10;
  id v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  id v20;
  unint64_t v21;
  unint64_t v22;
  uint64_t v23;
  uint64_t v24;
  unint64_t v25;
  unint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  unint64_t v32;
  void *v33;
  uint64_t v34;
  uint64_t v35;
  void *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  void *v43;
  void *v44;
  void *v45;
  unint64_t v47;
  void *v48;
  void *v49;
  id v50;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  void *v80;
  void *v81;
  void *v82;
  void *v83;
  void *v84;
  void *v85;
  void *v86;
  void *v87;
  void *v88;
  void *v89;
  int v90;
  void *v91;
  _QWORD v92[2];

  v92[1] = *MEMORY[0x1E0C80C00];
  v9 = a1;
  v10 = a2;
  v11 = a3;
  v12 = a4;
  if (v9)
  {
    if (v10)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "NSArray<id<_CVCCollectionUpdateItem>> * _Nonnull _UIDiffableDataSourceApplyMoveUpdate(_UIDiffableDataSourceUpdate *__strong _Nonnull, NSMutableOrderedSet *__strong _Nonnull, NSMutableOrderedSet *__strong _Nonnull, _UIDataSourceSnapshotter *__strong _Nonnull, BOOL)");
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v52, "handleFailureInFunction:file:lineNumber:description:", v53, CFSTR("_UIDiffableDataSourceUpdate.m"), 518, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("update"));

    if (v10)
    {
LABEL_3:
      if (v11)
        goto LABEL_4;
LABEL_75:
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v56 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "NSArray<id<_CVCCollectionUpdateItem>> * _Nonnull _UIDiffableDataSourceApplyMoveUpdate(_UIDiffableDataSourceUpdate *__strong _Nonnull, NSMutableOrderedSet *__strong _Nonnull, NSMutableOrderedSet *__strong _Nonnull, _UIDataSourceSnapshotter *__strong _Nonnull, BOOL)");
      v57 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v56, "handleFailureInFunction:file:lineNumber:description:", v57, CFSTR("_UIDiffableDataSourceUpdate.m"), 520, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("itemIdentifiers"));

      if (v12)
        goto LABEL_5;
      goto LABEL_76;
    }
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "NSArray<id<_CVCCollectionUpdateItem>> * _Nonnull _UIDiffableDataSourceApplyMoveUpdate(_UIDiffableDataSourceUpdate *__strong _Nonnull, NSMutableOrderedSet *__strong _Nonnull, NSMutableOrderedSet *__strong _Nonnull, _UIDataSourceSnapshotter *__strong _Nonnull, BOOL)");
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v54, "handleFailureInFunction:file:lineNumber:description:", v55, CFSTR("_UIDiffableDataSourceUpdate.m"), 519, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("sectionIdentifiers"));

  if (!v11)
    goto LABEL_75;
LABEL_4:
  if (v12)
    goto LABEL_5;
LABEL_76:
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "NSArray<id<_CVCCollectionUpdateItem>> * _Nonnull _UIDiffableDataSourceApplyMoveUpdate(_UIDiffableDataSourceUpdate *__strong _Nonnull, NSMutableOrderedSet *__strong _Nonnull, NSMutableOrderedSet *__strong _Nonnull, _UIDataSourceSnapshotter *__strong _Nonnull, BOOL)");
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v58, "handleFailureInFunction:file:lineNumber:description:", v59, CFSTR("_UIDiffableDataSourceUpdate.m"), 521, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("dataSourceSnapshot"));

LABEL_5:
  v13 = objc_msgSend(v12, "numberOfItems");
  if (v13 != objc_msgSend(v11, "count"))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "NSArray<id<_CVCCollectionUpdateItem>> * _Nonnull _UIDiffableDataSourceApplyMoveUpdate(_UIDiffableDataSourceUpdate *__strong _Nonnull, NSMutableOrderedSet *__strong _Nonnull, NSMutableOrderedSet *__strong _Nonnull, _UIDataSourceSnapshotter *__strong _Nonnull, BOOL)");
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v60, "handleFailureInFunction:file:lineNumber:description:", v61, CFSTR("_UIDiffableDataSourceUpdate.m"), 522, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("dataSourceSnapshot.numberOfItems == itemIdentifiers.count"));

  }
  v14 = objc_msgSend(v12, "numberOfSections");
  if (v14 != objc_msgSend(v10, "count"))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "NSArray<id<_CVCCollectionUpdateItem>> * _Nonnull _UIDiffableDataSourceApplyMoveUpdate(_UIDiffableDataSourceUpdate *__strong _Nonnull, NSMutableOrderedSet *__strong _Nonnull, NSMutableOrderedSet *__strong _Nonnull, _UIDataSourceSnapshotter *__strong _Nonnull, BOOL)");
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v62, "handleFailureInFunction:file:lineNumber:description:", v63, CFSTR("_UIDiffableDataSourceUpdate.m"), 523, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("dataSourceSnapshot.numberOfSections == sectionIdentifiers.count"));

  }
  if (objc_msgSend(v9, "action") != 3)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "NSArray<id<_CVCCollectionUpdateItem>> * _Nonnull _UIDiffableDataSourceApplyMoveUpdate(_UIDiffableDataSourceUpdate *__strong _Nonnull, NSMutableOrderedSet *__strong _Nonnull, NSMutableOrderedSet *__strong _Nonnull, _UIDataSourceSnapshotter *__strong _Nonnull, BOOL)");
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v64, "handleFailureInFunction:file:lineNumber:description:", v65, CFSTR("_UIDiffableDataSourceUpdate.m"), 524, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("update.action == _CVCCollectionUpdateActionMove"));

  }
  objc_msgSend(v9, "identifiers");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "firstObject");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "destinationIdentifier");
  v17 = objc_claimAutoreleasedReturnValue();
  v18 = (void *)v17;
  if (v16)
  {
    if (v17)
      goto LABEL_13;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v66 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "NSArray<id<_CVCCollectionUpdateItem>> * _Nonnull _UIDiffableDataSourceApplyMoveUpdate(_UIDiffableDataSourceUpdate *__strong _Nonnull, NSMutableOrderedSet *__strong _Nonnull, NSMutableOrderedSet *__strong _Nonnull, _UIDataSourceSnapshotter *__strong _Nonnull, BOOL)");
    v67 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v66, "handleFailureInFunction:file:lineNumber:description:", v67, CFSTR("_UIDiffableDataSourceUpdate.m"), 528, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("fromIdentifier"));

    if (v18)
      goto LABEL_13;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v68 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "NSArray<id<_CVCCollectionUpdateItem>> * _Nonnull _UIDiffableDataSourceApplyMoveUpdate(_UIDiffableDataSourceUpdate *__strong _Nonnull, NSMutableOrderedSet *__strong _Nonnull, NSMutableOrderedSet *__strong _Nonnull, _UIDataSourceSnapshotter *__strong _Nonnull, BOOL)");
  v69 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v68, "handleFailureInFunction:file:lineNumber:description:", v69, CFSTR("_UIDiffableDataSourceUpdate.m"), 529, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("toIdentifier"));

LABEL_13:
  v19 = (void *)MEMORY[0x1E0C9AA60];
  v90 = a5;
  if (!a5)
    v19 = 0;
  v20 = v19;
  v88 = v10;
  v89 = v11;
  if (objc_msgSend(v9, "isSectionOperation"))
  {
    v21 = objc_msgSend(v10, "indexOfObject:", v16);
    v22 = objc_msgSend(v10, "indexOfObject:", v18);
    if (v21 == 0x7FFFFFFFFFFFFFFFLL)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v70 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "NSArray<id<_CVCCollectionUpdateItem>> * _Nonnull _UIDiffableDataSourceApplyMoveUpdate(_UIDiffableDataSourceUpdate *__strong _Nonnull, NSMutableOrderedSet *__strong _Nonnull, NSMutableOrderedSet *__strong _Nonnull, _UIDataSourceSnapshotter *__strong _Nonnull, BOOL)");
      v71 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v70, "handleFailureInFunction:file:lineNumber:description:", v71, CFSTR("_UIDiffableDataSourceUpdate.m"), 560, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("fromSection != NSNotFound"));

    }
    if (v22 == 0x7FFFFFFFFFFFFFFFLL)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v72 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "NSArray<id<_CVCCollectionUpdateItem>> * _Nonnull _UIDiffableDataSourceApplyMoveUpdate(_UIDiffableDataSourceUpdate *__strong _Nonnull, NSMutableOrderedSet *__strong _Nonnull, NSMutableOrderedSet *__strong _Nonnull, _UIDataSourceSnapshotter *__strong _Nonnull, BOOL)");
      v73 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v72, "handleFailureInFunction:file:lineNumber:description:", v73, CFSTR("_UIDiffableDataSourceUpdate.m"), 561, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("toSection != NSNotFound"));

    }
    v23 = objc_msgSend(v9, "relativePosition");
    if (v21 >= v22)
    {
      v24 = v21 > v22 && v23 == 1;
    }
    else if (v23)
    {
      v24 = 0;
    }
    else
    {
      v24 = -1;
    }
    v32 = v24 + v22;
    if (v24 + v22 != v21)
    {
      objc_msgSend(MEMORY[0x1E0CB36B8], "indexSetWithIndex:", v21);
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v88, "moveObjectsAtIndexes:toIndex:", v33, v32);
      v34 = objc_msgSend(v12, "rangeForSection:", v21);
      objc_msgSend(MEMORY[0x1E0CB36B8], "indexSetWithIndexesInRange:", v34, v35);
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      v37 = objc_msgSend(v12, "rangeForSection:", v22);
      v39 = v38;
      if (objc_msgSend(v9, "relativePosition") == 1)
        v40 = v39;
      else
        v40 = 0;
      v41 = v40 + v37 - objc_msgSend(v36, "countOfIndexesInRange:", 0, v40 + v37);
      if (v41 == 0x7FFFFFFFFFFFFFFFLL)
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v79 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "NSArray<id<_CVCCollectionUpdateItem>> * _Nonnull _UIDiffableDataSourceApplyMoveUpdate(_UIDiffableDataSourceUpdate *__strong _Nonnull, NSMutableOrderedSet *__strong _Nonnull, NSMutableOrderedSet *__strong _Nonnull, _UIDataSourceSnapshotter *__strong _Nonnull, BOOL)");
        v87 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v79, "handleFailureInFunction:file:lineNumber:description:", v87, CFSTR("_UIDiffableDataSourceUpdate.m"), 590, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("insertionIndex != NSNotFound"));

      }
      objc_msgSend(v89, "moveObjectsAtIndexes:toIndex:", v36, v41);
      v42 = objc_msgSend(v12, "numberOfItemsInSection:", v21);
      objc_msgSend(v12, "_deleteSection:", v21);
      objc_msgSend(v12, "_insertSection:withInitialCount:", v32, v42);
      if (v90)
      {
        objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForItem:inSection:", 0x7FFFFFFFFFFFFFFFLL, v21);
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForItem:inSection:", 0x7FFFFFFFFFFFFFFFLL, v32);
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        _CVCUpdateItemAlloc();
        v45 = (void *)objc_msgSend((id)objc_claimAutoreleasedReturnValue(), "initWithInitialIndexPath:finalIndexPath:updateAction:", v43, v44, 3);
        v92[0] = v45;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v92, 1);
        v20 = (id)objc_claimAutoreleasedReturnValue();

LABEL_66:
LABEL_68:

        goto LABEL_69;
      }
      goto LABEL_67;
    }
  }
  else
  {
    v25 = objc_msgSend(v11, "indexOfObject:", v16);
    v26 = objc_msgSend(v11, "indexOfObject:", v18);
    if (v25 == 0x7FFFFFFFFFFFFFFFLL)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v74 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "NSArray<id<_CVCCollectionUpdateItem>> * _Nonnull _UIDiffableDataSourceApplyMoveUpdate(_UIDiffableDataSourceUpdate *__strong _Nonnull, NSMutableOrderedSet *__strong _Nonnull, NSMutableOrderedSet *__strong _Nonnull, _UIDataSourceSnapshotter *__strong _Nonnull, BOOL)");
      v75 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v74, "handleFailureInFunction:file:lineNumber:description:", v75, CFSTR("_UIDiffableDataSourceUpdate.m"), 614, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("fromIndex != NSNotFound"));

    }
    if (v26 == 0x7FFFFFFFFFFFFFFFLL)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v76 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "NSArray<id<_CVCCollectionUpdateItem>> * _Nonnull _UIDiffableDataSourceApplyMoveUpdate(_UIDiffableDataSourceUpdate *__strong _Nonnull, NSMutableOrderedSet *__strong _Nonnull, NSMutableOrderedSet *__strong _Nonnull, _UIDataSourceSnapshotter *__strong _Nonnull, BOOL)");
      v77 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v76, "handleFailureInFunction:file:lineNumber:description:", v77, CFSTR("_UIDiffableDataSourceUpdate.m"), 615, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("toIndex != NSNotFound"));

    }
    v27 = objc_msgSend(v12, "sectionForGlobalIndex:", v25);
    v28 = objc_msgSend(v12, "sectionForGlobalIndex:", v26);
    if (v27 == 0x7FFFFFFFFFFFFFFFLL)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v85 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "NSArray<id<_CVCCollectionUpdateItem>> * _Nonnull _UIDiffableDataSourceApplyMoveUpdate(_UIDiffableDataSourceUpdate *__strong _Nonnull, NSMutableOrderedSet *__strong _Nonnull, NSMutableOrderedSet *__strong _Nonnull, _UIDataSourceSnapshotter *__strong _Nonnull, BOOL)");
      v84 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v85, "handleFailureInFunction:file:lineNumber:description:", v84, CFSTR("_UIDiffableDataSourceUpdate.m"), 619, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("fromSection != NSNotFound"));

    }
    if (v28 == 0x7FFFFFFFFFFFFFFFLL)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v78 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "NSArray<id<_CVCCollectionUpdateItem>> * _Nonnull _UIDiffableDataSourceApplyMoveUpdate(_UIDiffableDataSourceUpdate *__strong _Nonnull, NSMutableOrderedSet *__strong _Nonnull, NSMutableOrderedSet *__strong _Nonnull, _UIDataSourceSnapshotter *__strong _Nonnull, BOOL)");
      v86 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v78, "handleFailureInFunction:file:lineNumber:description:", v86, CFSTR("_UIDiffableDataSourceUpdate.m"), 620, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("toSection != NSNotFound"));

    }
    v29 = objc_msgSend(v9, "relativePosition");
    if (v25 >= v26)
    {
      v30 = v25 > v26 && v29 == 1;
    }
    else if (v29)
    {
      v30 = 0;
    }
    else
    {
      v30 = -1;
    }
    v47 = v30 + v26;
    if (v30 + v26 != v25 || v27 != v28)
    {
      if (v47 != v25)
      {
        objc_msgSend(MEMORY[0x1E0CB36B8], "indexSetWithIndex:", v25);
        v48 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v89, "moveObjectsAtIndexes:toIndex:", v48, v47);

      }
      objc_msgSend(v12, "indexPathForGlobalIndex:", v25);
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v33)
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v80 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "NSArray<id<_CVCCollectionUpdateItem>> * _Nonnull _UIDiffableDataSourceApplyMoveUpdate(_UIDiffableDataSourceUpdate *__strong _Nonnull, NSMutableOrderedSet *__strong _Nonnull, NSMutableOrderedSet *__strong _Nonnull, _UIDataSourceSnapshotter *__strong _Nonnull, BOOL)");
        v81 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v80, "handleFailureInFunction:file:lineNumber:description:", v81, CFSTR("_UIDiffableDataSourceUpdate.m"), 643, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("fromIndexPath"));

      }
      objc_msgSend(v12, "_decrementSectionCount:", v27);
      objc_msgSend(v12, "_incrementSectionCount:", v28);
      objc_msgSend(v12, "indexPathForGlobalIndex:", v47);
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v36)
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v82 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "NSArray<id<_CVCCollectionUpdateItem>> * _Nonnull _UIDiffableDataSourceApplyMoveUpdate(_UIDiffableDataSourceUpdate *__strong _Nonnull, NSMutableOrderedSet *__strong _Nonnull, NSMutableOrderedSet *__strong _Nonnull, _UIDataSourceSnapshotter *__strong _Nonnull, BOOL)");
        v83 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v82, "handleFailureInFunction:file:lineNumber:description:", v83, CFSTR("_UIDiffableDataSourceUpdate.m"), 651, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("toIndexPath"));

      }
      if (v90)
      {
        _CVCUpdateItemAlloc();
        v43 = (void *)objc_msgSend((id)objc_claimAutoreleasedReturnValue(), "initWithInitialIndexPath:finalIndexPath:updateAction:", v33, v36, 3);
        v91 = v43;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v91, 1);
        v20 = (id)objc_claimAutoreleasedReturnValue();
        goto LABEL_66;
      }
LABEL_67:
      v20 = 0;
      goto LABEL_68;
    }
  }
LABEL_69:
  if (v90)
    v49 = v20;
  else
    v49 = 0;
  v50 = v49;

  return v50;
}

uint64_t _ensureOrderedSetsHaveGuaranteedPerformanceBeforeCopyingState(void *a1)
{
  id v1;
  char v2;

  v1 = a1;
  v2 = objc_opt_respondsToSelector();
  if ((v2 & 1) != 0)
    objc_msgSend(v1, "ensureOrderedSetsHaveGuaranteedPerformance");

  return v2 & 1;
}

void _UIDiffableDataSourceInsertIdentifiersAtIndex(void *a1, void *a2, unint64_t a3, int a4)
{
  id v7;
  id v8;
  uint64_t v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v7 = a1;
  v8 = a2;
  if (objc_msgSend(v7, "count") < a3)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "void _UIDiffableDataSourceInsertIdentifiersAtIndex(NSMutableOrderedSet *__strong _Nonnull, NSOrderedSet *__strong _Nonnull, NSUInteger, BOOL)");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "handleFailureInFunction:file:lineNumber:description:", v19, CFSTR("_UIDiffableDataSourceState.m"), 109, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("insertionIndex <= identifiers.count"));

  }
  v9 = objc_msgSend(v7, "count");
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v10 = v8;
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
  if (v11)
  {
    v12 = v11;
    v13 = a3 - v9;
    v14 = *(_QWORD *)v21;
    do
    {
      v15 = 0;
      do
      {
        if (*(_QWORD *)v21 != v14)
          objc_enumerationMutation(v10);
        v16 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * v15);
        if ((objc_msgSend(v10, "containsObject:", v16) & 1) == 0)
        {
          if (objc_msgSend(v16, "isEqual:", v16))
            BUG_IN_CLIENT_OF_DIFFABLE_DATA_SOURCE__IDENTIFIER_HASH_VALUE_CHANGED(v16, a4);
          else
            BUG_IN_CLIENT_OF_DIFFABLE_DATA_SOURCE__IDENTIFIER_IS_NOT_EQUAL_TO_ITSELF(v16, a4);
        }
        objc_msgSend(v7, "insertObject:atIndex:", v16, v13 + objc_msgSend(v7, "count"));
        ++v15;
      }
      while (v12 != v15);
      v17 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
      v12 = v17;
    }
    while (v17);
  }

}

uint64_t _CVCApplicationIsAppleApp()
{
  if (qword_1ECF88028 != -1)
    dispatch_once(&qword_1ECF88028, &__block_literal_global_1);
  return _MergedGlobals_1;
}

id __CVCForceCastToSnapshotImpl(void *a1)
{
  return a1;
}

void sub_1DD783380(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1DD7833D0(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1DD7834B8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  void *v14;
  void *v15;

  _Unwind_Resume(a1);
}

void sub_1DD783718(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{
  void *v10;
  void *v11;

  _Unwind_Resume(a1);
}

void std::vector<_NSRange>::reserve(void **a1, unint64_t a2)
{
  int64_t v3;
  char *v4;
  char *v5;
  uint64_t v6;
  char *v7;
  char *v8;
  char *v9;
  char *v10;

  if (a2 > ((_BYTE *)a1[2] - (_BYTE *)*a1) >> 4)
  {
    if (a2 >> 60)
      abort();
    v3 = (_BYTE *)a1[1] - (_BYTE *)*a1;
    v4 = (char *)std::__allocate_at_least[abi:nn180100]<std::allocator<_NSRange>>(a2);
    v5 = &v4[v3 & 0xFFFFFFFFFFFFFFF0];
    v7 = &v4[16 * v6];
    v9 = (char *)*a1;
    v8 = (char *)a1[1];
    v10 = v5;
    if (v8 != *a1)
    {
      do
      {
        *((_OWORD *)v10 - 1) = *((_OWORD *)v8 - 1);
        v10 -= 16;
        v8 -= 16;
      }
      while (v8 != v9);
      v8 = (char *)*a1;
    }
    *a1 = v10;
    a1[1] = v5;
    a1[2] = v7;
    if (v8)
      operator delete(v8);
  }
}

void sub_1DD783858(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void _UIDataSourceSnapshotterCommonInit(void *a1, void *a2, void *a3)
{
  unint64_t v5;
  id v6;
  int64_t v7;
  void *v8;
  void *v9;
  int64_t v10;
  void **v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  unint64_t v16;
  char *v17;
  _QWORD *v18;
  char *v19;
  uint64_t v20;
  unint64_t v21;
  uint64_t v22;
  unint64_t v23;
  uint64_t v24;
  _QWORD *v25;
  _QWORD *v26;
  void **v27;

  v27 = a1;
  v5 = a2;
  v6 = a3;
  if (v5 | (unint64_t)v6)
  {
    if (v5)
    {
      v7 = objc_msgSend((id)v5, "_dataSourceNumberOfSections");
      goto LABEL_6;
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "void _UIDataSourceSnapshotterCommonInit(_UIDataSourceSnapshotter *__strong, __strong id<_UICollectionDataSourceBackedView>, __strong _UIDataSourceSnapshotterSectionCountsProvider)");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInFunction:file:lineNumber:description:", v9, CFSTR("_UIDataSourceSnapshotter.mm"), 94, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("dataSourceBackedView != nil || sectionCountsProvider != nil"));

  }
  v7 = (*((uint64_t (**)(id, uint64_t))v6 + 2))(v6, -1);
LABEL_6:
  v10 = v7;
  if (v7 >= 1)
  {
    v11 = v27 + 1;
    std::vector<_NSRange>::reserve(v27 + 1, v7);
    v12 = 0;
    v13 = 0;
    do
    {
      if (v5)
        v14 = objc_msgSend((id)v5, "_dataSourceNumberOfItemsInSection:", v12);
      else
        v14 = (*((uint64_t (**)(id, uint64_t))v6 + 2))(v6, v12);
      v15 = v14;
      v17 = (char *)v27[2];
      v16 = (unint64_t)v27[3];
      if ((unint64_t)v17 >= v16)
      {
        v19 = (char *)*v11;
        v20 = (v17 - (_BYTE *)*v11) >> 4;
        v21 = v20 + 1;
        if ((unint64_t)(v20 + 1) >> 60)
          abort();
        v22 = v16 - (_QWORD)v19;
        if (v22 >> 3 > v21)
          v21 = v22 >> 3;
        if ((unint64_t)v22 >= 0x7FFFFFFFFFFFFFF0)
          v23 = 0xFFFFFFFFFFFFFFFLL;
        else
          v23 = v21;
        if (v23)
        {
          v23 = (unint64_t)std::__allocate_at_least[abi:nn180100]<std::allocator<_NSRange>>(v23);
          v19 = (char *)v27[1];
          v17 = (char *)v27[2];
        }
        else
        {
          v24 = 0;
        }
        v25 = (_QWORD *)(v23 + 16 * v20);
        *v25 = v13;
        v25[1] = v15;
        v26 = v25;
        if (v17 != v19)
        {
          do
          {
            *((_OWORD *)v26 - 1) = *((_OWORD *)v17 - 1);
            v26 -= 2;
            v17 -= 16;
          }
          while (v17 != v19);
          v19 = (char *)*v11;
        }
        v18 = v25 + 2;
        v27[1] = v26;
        v27[2] = v25 + 2;
        v27[3] = (void *)(v23 + 16 * v24);
        if (v19)
          operator delete(v19);
      }
      else
      {
        *(_QWORD *)v17 = v13;
        *((_QWORD *)v17 + 1) = v14;
        v18 = v17 + 16;
      }
      v27[2] = v18;
      v13 += v15;
      ++v12;
    }
    while (v12 != v10);
  }

}

void sub_1DD783A98(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  _Unwind_Resume(a1);
}

void sub_1DD783B38(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1DD783C60(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1DD783E20(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1DD783F84(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1DD784024(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1DD784104(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1DD78444C(_Unwind_Exception *exception_object)
{
  void *v1;

  if (v1)
    operator delete(v1);
  _Unwind_Resume(exception_object);
}

void sub_1DD78453C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void sub_1DD7845FC(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void *std::__allocate_at_least[abi:nn180100]<std::allocator<_NSRange>>(unint64_t a1)
{
  if (a1 >> 60)
    std::__throw_bad_array_new_length[abi:nn180100]();
  return operator new(16 * a1);
}

void std::__throw_bad_array_new_length[abi:nn180100]()
{
  abort();
}

_QWORD *std::vector<_NSRange>::__assign_with_size[abi:nn180100]<_NSRange*,_NSRange*>(_QWORD *result, char *__src, char *a3, unint64_t a4)
{
  char *v6;
  _QWORD *v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;
  size_t v13;
  void **v14;
  _BYTE *v15;
  unint64_t v16;
  char *v17;
  void *v18;

  v6 = __src;
  v7 = result;
  v8 = result[2];
  v9 = (char *)*result;
  if (a4 > (v8 - *result) >> 4)
  {
    if (v9)
    {
      result[1] = v9;
      operator delete(v9);
      v8 = 0;
      *v7 = 0;
      v7[1] = 0;
      v7[2] = 0;
    }
    if (a4 >> 60)
      goto LABEL_23;
    v10 = v8 >> 3;
    if (v8 >> 3 <= a4)
      v10 = a4;
    v11 = (unint64_t)v8 >= 0x7FFFFFFFFFFFFFF0 ? 0xFFFFFFFFFFFFFFFLL : v10;
    if (v11 >> 60)
LABEL_23:
      abort();
    result = std::__allocate_at_least[abi:nn180100]<std::allocator<_NSRange>>(v11);
    v9 = (char *)result;
    *v7 = result;
    v7[1] = result;
    v7[2] = &result[2 * v12];
    v13 = a3 - v6;
    if (v13)
      result = memmove(result, v6, v13);
    v14 = (void **)(v7 + 1);
    goto LABEL_22;
  }
  v14 = (void **)(result + 1);
  v15 = (_BYTE *)result[1];
  v16 = (v15 - v9) >> 4;
  if (v16 >= a4)
  {
    v13 = a3 - __src;
    if (a3 == __src)
      goto LABEL_22;
    v18 = (void *)*result;
LABEL_21:
    result = memmove(v18, __src, v13);
    goto LABEL_22;
  }
  v17 = &__src[16 * v16];
  if (v15 != v9)
  {
    result = memmove((void *)*result, __src, v15 - v9);
    v9 = (char *)*v14;
  }
  v13 = a3 - v17;
  if (v13)
  {
    v18 = v9;
    __src = v17;
    goto LABEL_21;
  }
LABEL_22:
  *v14 = &v9[v13];
  return result;
}

CFStringRef CFStringCreateWithFormat(CFAllocatorRef alloc, CFDictionaryRef formatOptions, CFStringRef format, ...)
{
  return (CFStringRef)MEMORY[0x1E0C99018](alloc, formatOptions, format);
}

CGFloat CGRectGetHeight(CGRect rect)
{
  CGFloat result;

  MEMORY[0x1E0C9D580]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMinX(CGRect rect)
{
  CGFloat result;

  MEMORY[0x1E0C9D5C0]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMinY(CGRect rect)
{
  CGFloat result;

  MEMORY[0x1E0C9D5C8]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetWidth(CGRect rect)
{
  CGFloat result;

  MEMORY[0x1E0C9D5D0]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

Class NSClassFromString(NSString *aClassName)
{
  return (Class)MEMORY[0x1E0CB28A0](aClassName);
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x1E0CB3200](aClass);
}

void _Block_object_dispose(const void *a1, const int a2)
{
  MEMORY[0x1E0C80948](a1, *(_QWORD *)&a2);
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
  MEMORY[0x1E0C80A20](exception_object);
}

void operator delete(void *__p)
{
  off_1EA7CE090(__p);
}

void *__cdecl operator new(size_t __sz)
{
  return (void *)off_1EA7CE098(__sz);
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x1E0C81038](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_log_fault_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x1E0C81040](dso, log, type, format, buf, *(_QWORD *)&size);
}

void abort(void)
{
  MEMORY[0x1E0C813A8]();
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
  MEMORY[0x1E0C82E08](predicate, block);
}

uint64_t dyld_program_sdk_at_least()
{
  return MEMORY[0x1E0C83158]();
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return (void *)MEMORY[0x1E0C84098](__dst, __src, __len);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x1E0DE7BA8](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x1E0DE7BB8]();
}

id objc_autorelease(id a1)
{
  return (id)MEMORY[0x1E0DE7BD0](a1);
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

void objc_end_catch(void)
{
  MEMORY[0x1E0DE7C80]();
}

void objc_enumerationMutation(id obj)
{
  MEMORY[0x1E0DE7C90](obj);
}

void objc_exception_throw(id exception)
{
  MEMORY[0x1E0DE7CA0](exception);
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

uint64_t objc_opt_respondsToSelector()
{
  return MEMORY[0x1E0DE7D50]();
}

void objc_release(id a1)
{
  MEMORY[0x1E0DE7D78](a1);
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x1E0DE7E50](a1);
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

void objc_setProperty_nonatomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
  MEMORY[0x1E0DE7FA0](self, _cmd, newValue, offset);
}

void objc_storeStrong(id *location, id obj)
{
  MEMORY[0x1E0DE7FB0](location, obj);
}

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x1E0DE7FE0](a1);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x1E0C84728](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x1E0C84780](oslog, type);
}

