void sub_1991D9C4C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;
  void *v11;

  v11 = v10;

  _Unwind_Resume(a1);
}

id _UTGetAllCoreTypesConstants()
{
  __objc2_class **v0;
  __objc2_class ***v1;
  uint64_t v2;
  _BYTE v4[1368];

  v0 = &UniformTypeIdentifiers::CoreTypes::constants;
  v1 = (__objc2_class ***)v4;
  v2 = 5472;
  do
  {
    *v1++ = v0;
    v0 += 4;
    v2 -= 32;
  }
  while (v2);
  return (id)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D20]), "initWithObjects:count:", v4, 171);
}

id UniformTypeIdentifiers::Type::getExportedType(__CFString *this, NSString *a2, UTType *a3, NSBundle *a4)
{
  void *v6;
  NSString *v7;

  __UTFindCoreTypesConstantWithIdentifier(this, 0x7FFFFFFFFFFFFFFFuLL);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v6)
  {
    v7 = a2;
    if (!a2)
    {
      objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
      v7 = (NSString *)objc_claimAutoreleasedReturnValue();
    }
    +[_UTRuntimeConstantType typeWithIdentifier:bundle:infoPlistKey:](_UTRuntimeConstantType, "typeWithIdentifier:bundle:infoPlistKey:", this, v7, *MEMORY[0x1E0CA5A70]);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (!a2)

  }
  return v6;
}

void sub_1991D9D64(_Unwind_Exception *exception_object)
{
  uint64_t v1;
  void *v2;

  if (!v1)

  _Unwind_Resume(exception_object);
}

void sub_1991D9E7C(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

uint64_t __UTGetDeclarationStatusFromInfoPlist(void *a1, int a2, void *a3, void *a4)
{
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  const mach_header *v17;
  UniformTypeIdentifiers::RuntimeIssues *v18;
  int v19;
  const mach_header *v20;
  uint64_t v21;
  void **v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  void *v29;
  void *v30;
  void *v31;
  int v32;
  void *v34[8];
  _QWORD v35[6];
  uint64_t v36;
  uint64_t *v37;
  uint64_t v38;
  int v39;

  v8 = (void *)MEMORY[0x19AEBD0C8]();
  if (a3)
  {
    v9 = a3;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
    v9 = (id)objc_claimAutoreleasedReturnValue();
  }
  v10 = v9;
  objc_msgSend(v9, "objectForInfoDictionaryKey:", *MEMORY[0x1E0CA5A70]);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "objectForInfoDictionaryKey:", *MEMORY[0x1E0CA5A78]);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v12;
  if (a2)
  {
    v12 = v11;
    v14 = v13;
  }
  else
  {
    v14 = v11;
  }
  v36 = 0;
  v37 = &v36;
  v38 = 0x2020000000;
  v39 = 1;
  v15 = MEMORY[0x1E0C809B0];
  v34[0] = (void *)MEMORY[0x1E0C809B0];
  v34[1] = (void *)3221225472;
  v34[2] = ___ZN22UniformTypeIdentifiers13RuntimeIssuesL27checkListsForTypeIdentifierEP8NSStringP7NSArrayIP12NSDictionaryIS2_P11objc_objectEESA__block_invoke;
  v34[3] = &unk_1E35CEAA0;
  v34[4] = a1;
  v34[5] = &v36;
  UniformTypeIdentifiers::RuntimeIssues::enumerateTypeIdentifiersInDeclarationsArray(v12, (uint64_t)v34);
  if (*((_DWORD *)v37 + 6))
  {
    v35[0] = v15;
    v35[1] = 3221225472;
    v35[2] = ___ZN22UniformTypeIdentifiers13RuntimeIssuesL27checkListsForTypeIdentifierEP8NSStringP7NSArrayIP12NSDictionaryIS2_P11objc_objectEESA__block_invoke_2;
    v35[3] = &unk_1E35CEAA0;
    v35[4] = a1;
    v35[5] = &v36;
    UniformTypeIdentifiers::RuntimeIssues::enumerateTypeIdentifiersInDeclarationsArray(v14, (uint64_t)v35);
    v16 = *((unsigned int *)v37 + 6);
  }
  else
  {
    v16 = 0;
  }
  _Block_object_dispose(&v36, 8);

  objc_autoreleasePoolPop(v8);
  if ((_DWORD)v16 && !_UTEnableAllRuntimeIssues)
  {
    if (a4)
      v18 = (UniformTypeIdentifiers::RuntimeIssues *)dyld_image_header_containing_address();
    else
      v18 = 0;
    if (!UniformTypeIdentifiers::RuntimeIssues::isBinaryTheCaller(v18, v17))
    {
      v19 = backtrace(v34, 8);
      if (v19 < 1)
      {
LABEL_24:
        v18 = 0;
      }
      else
      {
        v21 = v19;
        v22 = v34;
        while (1)
        {
          if (*v22 != a4)
          {
            v18 = *v22 ? (UniformTypeIdentifiers::RuntimeIssues *)dyld_image_header_containing_address() : 0;
            if (UniformTypeIdentifiers::RuntimeIssues::isBinaryTheCaller(v18, v20))
              break;
          }
          ++v22;
          if (!--v21)
            goto LABEL_24;
        }
      }
    }
    if (!v18)
      return 0;
    if ((UniformTypeIdentifiers::RuntimeIssues *)_dyld_get_prog_image_header() != v18)
    {
      v23 = dyld_image_path_containing_address();
      if (v23)
      {
        v24 = v23;
        v25 = (void *)MEMORY[0x19AEBD0C8]();
        objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "bundleURL");
        v27 = (void *)objc_claimAutoreleasedReturnValue();

        v28 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99E98]), "initFileURLWithFileSystemRepresentation:isDirectory:relativeToURL:", v24, 0, 0);
        v29 = (void *)v28;
        if (v27 && v28 && objc_msgSend(v27, "hasDirectoryPath"))
        {
          objc_msgSend(v29, "path");
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v27, "path");
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          v32 = objc_msgSend(v30, "hasPrefix:", v31);

          objc_autoreleasePoolPop(v25);
          if (v32)
            return v16;
        }
        else
        {

          objc_autoreleasePoolPop(v25);
        }
      }
      return 0;
    }
  }
  return v16;
}

void sub_1991DA1DC(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  _Unwind_Resume(a1);
}

BOOL UniformTypeIdentifiers::RuntimeIssues::isBinaryTheCaller(UniformTypeIdentifiers::RuntimeIssues *this, const mach_header *a2)
{
  _BOOL8 result;
  UniformTypeIdentifiers::RuntimeIssues *v4;

  result = 0;
  if (this && this != (UniformTypeIdentifiers::RuntimeIssues *)&dword_1991D8000)
  {
    if (os_unfair_lock_trylock((os_unfair_lock_t)&_MergedGlobals_4))
    {
      v4 = (UniformTypeIdentifiers::RuntimeIssues *)qword_1ECD26CD0;
      if (!qword_1ECD26CD0)
      {
        v4 = (UniformTypeIdentifiers::RuntimeIssues *)-[objc_class dsoHandle](objc_getClass("_UTSwiftOverlayRuntimeIssuesAssistant"), "dsoHandle");
        qword_1ECD26CD0 = (uint64_t)v4;
      }
      os_unfair_lock_unlock((os_unfair_lock_t)&_MergedGlobals_4);
    }
    else
    {
      v4 = (UniformTypeIdentifiers::RuntimeIssues *)-[objc_class dsoHandle](objc_getClass("_UTSwiftOverlayRuntimeIssuesAssistant"), "dsoHandle");
    }
    return v4 != this;
  }
  return result;
}

void sub_1991DA32C(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1991DA4F4(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1991DA598(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1991DA5DC(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1991DA6D8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{

  _Unwind_Resume(a1);
}

void sub_1991DA728(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void UniformTypeIdentifiers::RuntimeIssues::enumerateTypeIdentifiersInDeclarationsArray(void *a1, uint64_t a2)
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  char v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  if (_NSIsNSArray() && objc_msgSend(a1, "count"))
  {
    v14 = 0u;
    v15 = 0u;
    v12 = 0u;
    v13 = 0u;
    v4 = a1;
    v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    if (v5)
    {
      v6 = *(_QWORD *)v13;
      v7 = *MEMORY[0x1E0CA5B88];
      while (2)
      {
        for (i = 0; i != v5; ++i)
        {
          if (*(_QWORD *)v13 != v6)
            objc_enumerationMutation(v4);
          v9 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * i);
          if (_NSIsNSDictionary())
          {
            objc_msgSend(v9, "objectForKeyedSubscript:", v7);
            v10 = (void *)objc_claimAutoreleasedReturnValue();
            if (_NSIsNSString())
            {
              v11 = 0;
              (*(void (**)(uint64_t, void *, char *))(a2 + 16))(a2, v10, &v11);
              if (v11)
              {

                goto LABEL_16;
              }
            }

          }
        }
        v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
        if (v5)
          continue;
        break;
      }
    }
LABEL_16:

  }
}

void sub_1991DA8CC(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

BOOL ___ZN22UniformTypeIdentifiers13RuntimeIssuesL27checkListsForTypeIdentifierEP8NSStringP7NSArrayIP12NSDictionaryIS2_P11objc_objectEESA__block_invoke(uint64_t a1, __CFString *a2, _BYTE *a3)
{
  _BOOL8 result;

  result = _UTIdentifiersAreEqual(*(__CFString **)(a1 + 32), a2);
  if (result)
  {
    *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 0;
    *a3 = 1;
  }
  return result;
}

void sub_1991DAAA0(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1991DAE68(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void *a9)
{
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  _Unwind_Resume(a1);
}

void sub_1991DB254(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, void *__p,uint64_t a21)
{
  void *v21;

  _Unwind_Resume(a1);
}

void sub_1991DB3CC(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

id _UTTaggedTypeCreate(void *a1)
{
  void *v2;
  void *v3;
  char v4;
  int v5;
  id v6;
  void *v7;
  int v8;
  int v9;
  int v10;
  int v11;
  unint64_t v12;
  unint64_t v13;
  unint64_t v14;
  void *v16;
  void *v17;
  __int128 v18;
  _DWORD v19[2];

  if (!a1)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "_UTTaggedType *_UTTaggedTypeCreate(UTTypeRecord *const __strong _Nonnull)");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "handleFailureInFunction:file:lineNumber:description:", v17, CFSTR("UTTaggedType.mm"), 276, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("typeRecord != nil"));

  }
  if (objc_msgSend(a1, "isDynamic"))
  {
    if (qword_1ECD26C48 != -1)
      dispatch_once(&qword_1ECD26C48, &__block_literal_global_0);
    if (_MergedGlobals_0 == 1)
    {
      objc_msgSend(a1, "preferredTagOfClass:", CFSTR("public.filename-extension"));
      v2 = (void *)objc_claimAutoreleasedReturnValue();
      if (v2)
      {
        -[_UTConstantType identifier](&off_1ECD256F0, "identifier");
        v3 = (void *)objc_claimAutoreleasedReturnValue();
        v4 = objc_msgSend(a1, "isChildOfTypeIdentifier:", v3);

        if ((v4 & 1) != 0)
        {
          v5 = 0;
        }
        else
        {
          -[_UTConstantType identifier](&off_1ECD262F0, "identifier");
          v7 = (void *)objc_claimAutoreleasedReturnValue();
          v8 = objc_msgSend(a1, "isChildOfTypeIdentifier:", v7);

          if (!v8)
            goto LABEL_21;
          v5 = 1;
        }
        *(_DWORD *)((char *)v19 + 3) = 0;
        v19[0] = 0;
        v18 = xmmword_1991E58B0;
        v9 = objc_msgSend(v2, "getBytes:maxLength:usedLength:encoding:options:range:remainingRange:", v19, 6, 0, 4, 0, 0, objc_msgSend(v2, "length"), &v18);
        if (*((_QWORD *)&v18 + 1))
          v10 = 0;
        else
          v10 = v9;
        if (v10 == 1)
        {
          v11 = BYTE2(v19[1]) & 0xFE | v5;
          BYTE2(v19[1]) = BYTE2(v19[1]) & 0xFE | v5;
          v12 = v19[0] | ((unint64_t)(LOWORD(v19[1]) | (v11 << 16)) << 32);
          if (v12)
          {
            v13 = (8 * (v12 & 0xFFFFFFFFFFFFFLL)) | 0x8680000000000007;
            v14 = *MEMORY[0x1E0DE7C58] ^ v13;
            if ((~v14 & 0xC000000000000007) != 0)
              v13 = v14 & 0xFFFFFFFFFFFFFFF8 | *(unsigned __int8 *)(MEMORY[0x1E0DE7C48] + (v14 & 7));
            v6 = (id)v13;
            goto LABEL_22;
          }
        }
      }
LABEL_21:
      v6 = 0;
LABEL_22:

      return v6;
    }
  }
  return 0;
}

void sub_1991DB628(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void _UTDetachTypeRecords(uint64_t a1, uint64_t a2)
{
  void *v4;
  void *v5;

  if (!a2)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "void _UTDetachTypeRecords(UTTypeRecord *const __unsafe_unretained *const, NSUInteger)");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "handleFailureInFunction:file:lineNumber:description:", v5, CFSTR("UTType.mm"), 989, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("count > 0"));

  }
  if (qword_1ECD26C68 != -1)
    dispatch_once(&qword_1ECD26C68, &__block_literal_global_2);
  if (_MergedGlobals_2)
    objc_msgSend(MEMORY[0x1E0CA5900], "resolveAllPropertiesOfRecords:count:andDetachOnQueue:", a1, a2, 0);
}

void sub_1991DB750(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

id _UTTypeGetForIdentifier(__CFString *a1, int a2)
{
  void *v4;
  void *v5;
  void *v7;
  void *v8;

  if (!a1)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "UTType *_UTTypeGetForIdentifier(NSString *const __strong, BOOL)");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "handleFailureInFunction:file:lineNumber:description:", v8, CFSTR("UTType.mm"), 101, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("identifier != nil"));

  }
  __UTFindCoreTypesConstantWithIdentifier(a1, 0x7FFFFFFFFFFFFFFFuLL);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v4)
  {
    if (a2)
      objc_msgSend(MEMORY[0x1E0CA5928], "typeRecordWithPotentiallyUndeclaredIdentifier:", a1);
    else
      objc_msgSend(MEMORY[0x1E0CA5928], "typeRecordWithIdentifier:", a1);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      +[UTType _typeWithTypeRecord:detachTypeRecord:findConstant:](UTType, "_typeWithTypeRecord:detachTypeRecord:findConstant:", v5, 1, 0);
      v4 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v4 = 0;
    }

  }
  return v4;
}

void sub_1991DB8D4(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

__objc2_class **__UTFindCoreTypesConstantWithIdentifier(__CFString *a1, unint64_t a2)
{
  __objc2_class **v4;
  __CFString *v5;
  BOOL v6;
  uint64_t v7;
  void *v8;
  void *v9;
  _QWORD v11[6];

  v11[5] = *MEMORY[0x1E0C80C00];
  if (!a1)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "CFTypeRef __UTFindCoreTypesConstantWithIdentifier(NSString *const __strong _Nonnull, NSInteger)");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInFunction:file:lineNumber:description:", v9, CFSTR("UTCoreTypes.mm"), 241, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("identifier != nil"));

    if ((a2 & 0x8000000000000000) == 0)
      goto LABEL_3;
    return 0;
  }
  if ((a2 & 0x8000000000000000) != 0)
    return 0;
LABEL_3:
  if (a2 > 0xAA
    || (v4 = &UniformTypeIdentifiers::CoreTypes::constants + 4 * a2,
        objc_msgSend(v4, "identifier"),
        v5 = (__CFString *)objc_claimAutoreleasedReturnValue(),
        v6 = _UTIdentifiersAreEqual(a1, v5),
        v5,
        !v6))
  {
    if (qword_1ECD26C80 != -1)
      dispatch_once(&qword_1ECD26C80, &__block_literal_global_3);
    v11[2] = a1;
    v11[3] = 0;
    v11[0] = _UTCoreType;
    v7 = objc_msgSend((id)qword_1ECD26C78, "indexOfObject:", v11);
    if (v7 == 0x7FFFFFFFFFFFFFFFLL)
      return 0;
    else
      return &UniformTypeIdentifiers::CoreTypes::constants + 4 * v7;
  }
  return v4;
}

void sub_1991DBA6C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

uint64_t UniformTypeIdentifiers::Type::isTagValid(UniformTypeIdentifiers::Type *this, __CFString *a2, NSString *a3)
{
  uint64_t result;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  if (this)
  {
    if (a2)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler", a3);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "BOOL isTagValid(NSString *const __strong, NSString *const __strong)");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "handleFailureInFunction:file:lineNumber:description:", v7, CFSTR("UTType.mm"), 1003, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("tag != nil"));

    if (a2)
      goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler", a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "BOOL isTagValid(NSString *const __strong, NSString *const __strong)");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "handleFailureInFunction:file:lineNumber:description:", v9, CFSTR("UTType.mm"), 1004, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("tagClass != nil"));

LABEL_3:
  result = -[UniformTypeIdentifiers::Type length](this, "length", a3);
  if (result)
  {
    if (_UTIdentifiersAreEqual(a2, CFSTR("public.filename-extension")))
    {
      return (-[UniformTypeIdentifiers::Type containsString:](this, "containsString:", CFSTR(".")) & 1) == 0
          && _CFExtensionIsValidToAppend() != 0;
    }
    else if (_UTIdentifiersAreEqual(a2, CFSTR("public.mime-type")))
    {
      return -[UniformTypeIdentifiers::Type containsString:](this, "containsString:", CFSTR("/"));
    }
    else
    {
      return 1;
    }
  }
  return result;
}

void sub_1991DBC2C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

BOOL _UTCoreTypesConstantSetTypeRecordIfNil(uint64_t a1, void *a2)
{
  id *v4;
  uint64_t v5;
  uint64_t v6;

  os_unfair_recursive_lock_lock_with_options();
  v6 = *(_QWORD *)(a1 + 8);
  v4 = (id *)(a1 + 8);
  v5 = v6;
  if (!v6)
    objc_storeStrong(v4, a2);
  os_unfair_recursive_lock_unlock();
  return v5 == 0;
}

BOOL ___ZN22UniformTypeIdentifiers13RuntimeIssuesL27checkListsForTypeIdentifierEP8NSStringP7NSArrayIP12NSDictionaryIS2_P11objc_objectEESA__block_invoke_2(uint64_t a1, __CFString *a2, _BYTE *a3)
{
  _BOOL8 result;

  result = _UTIdentifiersAreEqual(*(__CFString **)(a1 + 32), a2);
  if (result)
  {
    *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 2;
    *a3 = 1;
  }
  return result;
}

void sub_1991DBD68(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1991DBE88(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1991DBF4C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

BOOL _UTIdentifiersAreEqual(__CFString *theString, __CFString *a2)
{
  _BOOL8 v3;
  const char *CStringPtr;
  const char *v6;
  const char *v7;
  std::vector<char> *v8;
  uint64_t v10;
  std::vector<char>::size_type v11;
  BOOL v12;
  std::vector<char>::size_type v13;
  std::vector<char>::pointer begin;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  std::vector<char>::value_type v22[8];
  std::vector<char> v23;
  std::vector<char> __x[42];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  if (theString == a2)
    return 1;
  v3 = 0;
  if (!theString || !a2)
    return v3;
  CStringPtr = CFStringGetCStringPtr(theString, 0x8000100u);
  v6 = CFStringGetCStringPtr(a2, 0x8000100u);
  if (CStringPtr)
  {
    v7 = v6;
    if (v6)
    {
      v8 = (std::vector<char> *)CStringPtr;
      return strcasecmp((const char *)v8, v7) == 0;
    }
  }
  v10 = -[__CFString maximumLengthOfBytesUsingEncoding:](theString, "maximumLengthOfBytesUsingEncoding:", 4);
  v11 = -[__CFString maximumLengthOfBytesUsingEncoding:](a2, "maximumLengthOfBytesUsingEncoding:", 4) + 1;
  v12 = __CFADD__(v10, 1);
  v13 = v10 + 1;
  if (!v12)
  {
    if (v13 <= 0x400)
      goto LABEL_12;
    LOBYTE(__x[0].__begin_) = 0;
    std::vector<char>::vector(&v23, v13, (const std::vector<char>::value_type *)__x);
    if (v11)
    {
      if (v11 > 0x400)
      {
        v22[0] = 0;
        std::vector<char>::vector(__x, v11, v22);
        v21 = 0;
        *(_QWORD *)v22 = 0;
        v3 = -[__CFString getBytes:maxLength:usedLength:encoding:options:range:remainingRange:](theString, "getBytes:maxLength:usedLength:encoding:options:range:remainingRange:", v23.__begin_, v13, v22, 4, 0, 0, -[__CFString length](theString, "length"), 0)&& -[__CFString getBytes:maxLength:usedLength:encoding:options:range:remainingRange:](a2, "getBytes:maxLength:usedLength:encoding:options:range:remainingRange:", __x[0].__begin_, v11, &v21, 4, 0, 0,
                             -[__CFString length](a2, "length"),
                             0)
          && *(_QWORD *)v22 == v21
          && strcasecmp(v23.__begin_, __x[0].__begin_) == 0;
        if (__x[0].__begin_)
        {
          __x[0].__end_ = __x[0].__begin_;
          operator delete(__x[0].__begin_);
        }
        goto LABEL_40;
      }
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "void withFastBuffer(NSUInteger, const FunctionType &) [ElementType = char, ArraySize = 1024UL, FunctionType = (lambda at /Library/Caches/com.apple.xbs/Sources/UniformTypeIdentifiers/Framework/UTType.mm:871:91)]");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "handleFailureInFunction:file:lineNumber:description:", v20, CFSTR("UTType.mm"), 1151, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("count > 0"));

    }
    bzero(__x, 0x400uLL);
    v21 = 0;
    *(_QWORD *)v22 = 0;
    v3 = -[__CFString getBytes:maxLength:usedLength:encoding:options:range:remainingRange:](theString, "getBytes:maxLength:usedLength:encoding:options:range:remainingRange:", v23.__begin_, v13, v22, 4, 0, 0, -[__CFString length](theString, "length"), 0)&& -[__CFString getBytes:maxLength:usedLength:encoding:options:range:remainingRange:](a2, "getBytes:maxLength:usedLength:encoding:options:range:remainingRange:", __x, v11, &v21, 4, 0, 0,
                         -[__CFString length](a2, "length"),
                         0)
      && *(_QWORD *)v22 == v21
      && strcasecmp(v23.__begin_, (const char *)__x) == 0;
LABEL_40:
    begin = v23.__begin_;
    if (!v23.__begin_)
      return v3;
    v23.__end_ = v23.__begin_;
LABEL_42:
    operator delete(begin);
    return v3;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "void withFastBuffer(NSUInteger, const FunctionType &) [ElementType = char, ArraySize = 1024UL, FunctionType = (lambda at /Library/Caches/com.apple.xbs/Sources/UniformTypeIdentifiers/Framework/UTType.mm:871:37)]");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "handleFailureInFunction:file:lineNumber:description:", v16, CFSTR("UTType.mm"), 1151, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("count > 0"));

LABEL_12:
  bzero(&v23, 0x400uLL);
  if (!v11)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "void withFastBuffer(NSUInteger, const FunctionType &) [ElementType = char, ArraySize = 1024UL, FunctionType = (lambda at /Library/Caches/com.apple.xbs/Sources/UniformTypeIdentifiers/Framework/UTType.mm:871:91)]");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "handleFailureInFunction:file:lineNumber:description:", v18, CFSTR("UTType.mm"), 1151, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("count > 0"));

LABEL_14:
    bzero(__x, 0x400uLL);
    v21 = 0;
    *(_QWORD *)v22 = 0;
    if (!-[__CFString getBytes:maxLength:usedLength:encoding:options:range:remainingRange:](theString, "getBytes:maxLength:usedLength:encoding:options:range:remainingRange:", &v23, v13, v22, 4, 0, 0, -[__CFString length](theString, "length"), 0)|| !-[__CFString getBytes:maxLength:usedLength:encoding:options:range:remainingRange:](a2, "getBytes:maxLength:usedLength:encoding:options:range:remainingRange:", __x, v11, &v21, 4, 0, 0,
                          -[__CFString length](a2, "length"),
                          0)
      || *(_QWORD *)v22 != v21)
    {
      return 0;
    }
    v8 = &v23;
    v7 = (const char *)__x;
    return strcasecmp((const char *)v8, v7) == 0;
  }
  if (v11 <= 0x400)
    goto LABEL_14;
  v22[0] = 0;
  std::vector<char>::vector(__x, v11, v22);
  v21 = 0;
  *(_QWORD *)v22 = 0;
  v3 = -[__CFString getBytes:maxLength:usedLength:encoding:options:range:remainingRange:](theString, "getBytes:maxLength:usedLength:encoding:options:range:remainingRange:", &v23, v13, v22, 4, 0, 0, -[__CFString length](theString, "length"), 0)&& -[__CFString getBytes:maxLength:usedLength:encoding:options:range:remainingRange:](a2, "getBytes:maxLength:usedLength:encoding:options:range:remainingRange:", __x[0].__begin_, v11, &v21, 4, 0, 0,
                       -[__CFString length](a2, "length"),
                       0)
    && *(_QWORD *)v22 == v21
    && strcasecmp((const char *)&v23, __x[0].__begin_) == 0;
  begin = __x[0].__begin_;
  if (__x[0].__begin_)
  {
    __x[0].__end_ = __x[0].__begin_;
    goto LABEL_42;
  }
  return v3;
}

void sub_1991DC494(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *__p)
{
  void *v14;
  void *v15;

  if (__p)
    operator delete(__p);
  _Unwind_Resume(a1);
}

unint64_t _UTIdentifierGetHashCode(void *a1)
{
  id v1;
  uint64_t v2;
  std::vector<char>::size_type v3;
  unint64_t v4;
  std::vector<char> *v5;
  unint64_t v6;
  int v7;
  uint64_t *begin;
  unint64_t v9;
  unint64_t v10;
  unint64_t v11;
  void *v13;
  void *v14;
  std::vector<char>::value_type __x[8];
  std::vector<char> v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v1 = a1;
  v2 = objc_msgSend(v1, "maximumLengthOfBytesUsingEncoding:", 4);
  v3 = v2 + 1;
  if (v2 == -1)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "void withFastBuffer(NSUInteger, const FunctionType &) [ElementType = char, ArraySize = 1024UL, FunctionType = (lambda at /Library/Caches/com.apple.xbs/Sources/UniformTypeIdentifiers/Framework/UTType.mm:1167:34)]");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "handleFailureInFunction:file:lineNumber:description:", v14, CFSTR("UTType.mm"), 1151, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("count > 0"));

LABEL_3:
    bzero(&v16, 0x400uLL);
    *(_QWORD *)__x = 0;
    if (objc_msgSend(v1, "getBytes:maxLength:usedLength:encoding:options:range:remainingRange:", &v16, v3, __x, 4, 0, 0, objc_msgSend(v1, "length"), 0))
    {
      v4 = *(_QWORD *)__x;
      if (*(_QWORD *)__x)
      {
        v5 = &v16;
        do
        {
          LOBYTE(v5->__begin_) = __tolower(LOBYTE(v5->__begin_));
          v5 = (std::vector<char> *)((char *)v5 + 1);
          --v4;
        }
        while (v4);
        v6 = *(_QWORD *)__x;
      }
      else
      {
        v6 = 0;
      }
      v11 = std::__string_view_hash<char>::operator()[abi:ne180100]((uint64_t *)&v16, v6);
    }
    else
    {
      v11 = 0;
    }
    goto LABEL_20;
  }
  if (v3 <= 0x400)
    goto LABEL_3;
  __x[0] = 0;
  std::vector<char>::vector(&v16, v3, __x);
  *(_QWORD *)__x = 0;
  v7 = objc_msgSend(v1, "getBytes:maxLength:usedLength:encoding:options:range:remainingRange:", v16.__begin_, v3, __x, 4, 0, 0, objc_msgSend(v1, "length"), 0);
  begin = (uint64_t *)v16.__begin_;
  if (!v7)
  {
    v11 = 0;
    if (!v16.__begin_)
      goto LABEL_20;
    goto LABEL_19;
  }
  v9 = *(_QWORD *)__x;
  if (*(_QWORD *)__x)
  {
    do
    {
      *(_BYTE *)begin = __tolower(*(unsigned __int8 *)begin);
      begin = (uint64_t *)((char *)begin + 1);
      --v9;
    }
    while (v9);
    v10 = *(_QWORD *)__x;
    begin = (uint64_t *)v16.__begin_;
  }
  else
  {
    v10 = 0;
  }
  v11 = std::__string_view_hash<char>::operator()[abi:ne180100](begin, v10);
  if (begin)
  {
LABEL_19:
    v16.__end_ = (std::vector<char>::pointer)begin;
    operator delete(begin);
  }
LABEL_20:

  return v11;
}

void sub_1991DC72C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *__p, uint64_t a15)
{
  void *v15;
  void *v16;
  void *v17;

  _Unwind_Resume(a1);
}

void sub_1991DC7B8(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1991DC89C(void *a1)
{
  objc_begin_catch(a1);
  os_unfair_recursive_lock_unlock();
  objc_exception_rethrow();
}

void sub_1991DC8B4(_Unwind_Exception *a1)
{
  objc_end_catch();
  _Unwind_Resume(a1);
}

void sub_1991DC944(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, objc_super a9)
{
  a9.super_class = (Class)_UTRuntimeConstantType;
  -[_Unwind_Exception dealloc](&a9, sel_dealloc);
  _Unwind_Resume(a1);
}

void ___ZN22UniformTypeIdentifiers4TypeL23shouldDetachTypeRecordsEv_block_invoke()
{
  char *v0;
  id v1;

  v0 = getenv("_UTShouldDetachTypeRecords");
  if (v0)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v0);
    v1 = (id)objc_claimAutoreleasedReturnValue();
    _MergedGlobals_2 = objc_msgSend(v1, "BOOLValue");

  }
  else
  {
    _MergedGlobals_2 = objc_msgSend(MEMORY[0x1E0CA5900], "hasDatabaseAccess");
  }
}

void sub_1991DCA1C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

uint64_t ___ZN22UniformTypeIdentifiers14TaggedPointersL26registerTaggedPointerClassEv_block_invoke()
{
  uint64_t result;

  if (*MEMORY[0x1E0DE7C50])
  {
    objc_lookUpClass("_UTTaggedType");
    result = _objc_registerTaggedPointerClass();
    _MergedGlobals_0 = 1;
  }
  return result;
}

void sub_1991DCC8C(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

id UniformTypeIdentifiers::ModelCode::getDeviceTypeWithModelCode(UniformTypeIdentifiers::ModelCode *a1, UniformTypeIdentifiers::ModelCode *a2, char a3)
{
  UniformTypeIdentifiers::ModelCode *v5;
  id v6;
  UniformTypeIdentifiers::ModelCode *v7;
  uint64_t HardwareColorForCurrentDevice;
  char v9;
  UniformTypeIdentifiers::ModelCode *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  id *v14;
  NSObject *v16;
  _BOOL8 v17;
  id *v18;
  void *v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE buf[12];
  __int16 v25;
  uint64_t v26;
  __int16 v27;
  uint64_t v28;
  _BYTE v29[128];
  _QWORD v30[2];

  v5 = a1;
  v30[1] = *MEMORY[0x1E0C80C00];
  if ((a3 & 2) != 0)
  {
    if (!a1
      || (v30[0] = a1,
          objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v30, 1),
          a1 = (UniformTypeIdentifiers::ModelCode *)objc_claimAutoreleasedReturnValue(),
          (v7 = a1) == 0))
    {
      UniformTypeIdentifiers::ModelCode::getCurrentDeviceModelCodes(a1);
      a1 = (UniformTypeIdentifiers::ModelCode *)objc_claimAutoreleasedReturnValue();
      v7 = a1;
      if (!a1)
      {
        if ((a3 & 1) == 0)
          return 0;
        goto LABEL_27;
      }
    }
    *(_QWORD *)buf = *(_QWORD *)a2;
    *(_DWORD *)&buf[8] = *((_DWORD *)a2 + 2);
    if (!buf[8])
    {
      HardwareColorForCurrentDevice = UniformTypeIdentifiers::ModelCode::getHardwareColorForCurrentDevice(a1);
      if (v9)
      {
        buf[8] = 1;
        *(_QWORD *)buf = HardwareColorForCurrentDevice;
      }
    }
    v22 = 0u;
    v23 = 0u;
    v20 = 0u;
    v21 = 0u;
    v10 = v7;
    v11 = -[UniformTypeIdentifiers::ModelCode countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v20, v29, 16);
    if (v11)
    {
      v12 = *(_QWORD *)v21;
LABEL_12:
      v13 = 0;
      while (1)
      {
        if (*(_QWORD *)v21 != v12)
          objc_enumerationMutation(v10);
        UniformTypeIdentifiers::ModelCode::getDeviceTypeWithModelCodeAndHardwareColorWithoutResolvingCurrentDevice(*(void **)(*((_QWORD *)&v20 + 1) + 8 * v13), (UniformTypeIdentifiers::ModelCode *)buf);
        v6 = (id)objc_claimAutoreleasedReturnValue();
        if (v6)
          break;
        if (v11 == ++v13)
        {
          v11 = -[UniformTypeIdentifiers::ModelCode countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v20, v29, 16);
          if (v11)
            goto LABEL_12;
          goto LABEL_18;
        }
      }
    }
    else
    {
LABEL_18:
      v6 = 0;
    }

  }
  else
  {
    if (!a1)
      return 0;
    UniformTypeIdentifiers::ModelCode::getDeviceTypeWithModelCodeAndHardwareColorWithoutResolvingCurrentDevice(a1, a2);
    a1 = (UniformTypeIdentifiers::ModelCode *)objc_claimAutoreleasedReturnValue();
    v6 = a1;
  }
  if (!v6)
  {
    if ((a3 & 1) == 0)
      return 0;
    if ((a3 & 2) == 0)
    {
      if (v5)
      {
        v14 = (id *)&_UTTypeAppleDevice;
LABEL_42:
        v6 = *v14;
        return v6;
      }
      return 0;
    }
LABEL_27:
    if (qword_1ECD26C10 != -1)
      dispatch_once(&qword_1ECD26C10, &__block_literal_global_51);
    UniformTypeIdentifiers::ModelCode::log(a1);
    v16 = objc_claimAutoreleasedReturnValue();
    v17 = os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG);
    if (v17)
    {
      v19 = v5;
      if (!v5)
      {
        UniformTypeIdentifiers::ModelCode::getCurrentDeviceModelCodes((UniformTypeIdentifiers::ModelCode *)v17);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
      }
      *(_DWORD *)buf = 138412802;
      *(_QWORD *)&buf[4] = v19;
      v25 = 2114;
      v26 = qword_1ECD26C08;
      v27 = 2048;
      v28 = UniformTypeIdentifiers::ModelCode::getDeviceTypeWithModelCode(NSString *,std::optional<UTHardwareColor> const&,UniformTypeIdentifiers::ModelCode::Options)::deviceClass;
      _os_log_debug_impl(&dword_1991D8000, v16, OS_LOG_TYPE_DEBUG, "Current device model code %@ is unknown: falling back to device class %{public}@ / %lli", buf, 0x20u);
      if (!v5)

    }
    v14 = (id *)_UTTypeDevice;
    v18 = (id *)&_UTTypeiPhone;
    switch(UniformTypeIdentifiers::ModelCode::getDeviceTypeWithModelCode(NSString *,std::optional<UTHardwareColor> const&,UniformTypeIdentifiers::ModelCode::Options)::deviceClass)
    {
      case -1:
      case 5:
      case 8:
        goto LABEL_42;
      case 1:
        goto LABEL_40;
      case 2:
        v18 = (id *)&_UTTypeiPodTouch;
        goto LABEL_40;
      case 3:
        v18 = (id *)&_UTTypeiPad;
        goto LABEL_40;
      case 4:
        v18 = (id *)&_UTTypeAppleTV;
        goto LABEL_40;
      case 6:
        v18 = (id *)&_UTTypeAppleWatch;
        goto LABEL_40;
      case 7:
        v18 = (id *)&_UTTypeHomePod;
        goto LABEL_40;
      case 9:
        v18 = (id *)&_UTTypeMac;
        goto LABEL_40;
      case 11:
        v18 = (id *)&_UTTypeAppleVisionPro;
LABEL_40:
        v6 = *v18;
        if (!v6)
          goto LABEL_41;
        return v6;
      default:
        if (qword_1ECD26C18 != -1)
          dispatch_once(&qword_1ECD26C18, &__block_literal_global_57);
LABEL_41:
        v14 = (id *)_UTTypeDevice;
        break;
    }
    goto LABEL_42;
  }
  return v6;
}

void sub_1991DD000(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1991DD134(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1991DD1F0(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1991DD298(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

id UniformTypeIdentifiers::ModelCode::getDeviceTypeWithModelCodeAndHardwareColorWithoutResolvingCurrentDevice(void *a1, UniformTypeIdentifiers::ModelCode *a2)
{
  void *v4;
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  unint64_t v11;
  unint64_t v12;
  void *v13;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  id obj;
  _QWORD v20[16];
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  if (!a1)
    return 0;
  if (*((_BYTE *)a2 + 8))
  {
    UniformTypeIdentifiers::ModelCode::getHardwareColorSuffix(a2, (const UTHardwareColor *)a2);
    v16 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v16 = 0;
  }
  v4 = (void *)objc_msgSend(a1, "mutableCopy", a1);
  if (v4)
  {
    while (objc_msgSend(v4, "length"))
    {
      if (v16)
      {
        objc_msgSend(v4, "stringByAppendingString:");
        v5 = (id)objc_claimAutoreleasedReturnValue();
        if (!v5)
          goto LABEL_38;
      }
      else
      {
        v5 = v4;
      }
      v17 = v5;
      +[UTType typeWithTag:tagClass:conformingToType:](UTType, "typeWithTag:tagClass:conformingToType:");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      if (v18 && (objc_msgSend(v18, "isDeclared") & 1) != 0)
      {
        v6 = v18;
      }
      else if (*((_BYTE *)a2 + 8))
      {
        v23 = 0u;
        v24 = 0u;
        v21 = 0u;
        v22 = 0u;
        +[UTType typesWithTag:tagClass:conformingToType:](UTType, "typesWithTag:tagClass:conformingToType:", v4, CFSTR("com.apple.device-model-code"), &off_1ECD26A10);
        obj = (id)objc_claimAutoreleasedReturnValue();
        v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
        if (v7)
        {
          v8 = *(_QWORD *)v22;
LABEL_18:
          v9 = 0;
          while (1)
          {
            if (*(_QWORD *)v22 != v8)
              objc_enumerationMutation(obj);
            v10 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * v9);
            if (v10)
            {
              if (objc_msgSend(*(id *)(*((_QWORD *)&v21 + 1) + 8 * v9), "isDeclared"))
              {
                v11 = objc_msgSend(v10, "_getEnclosureColors:count:", v20, 16);
                if (v11)
                {
                  v12 = 0;
                  do
                  {
                    if (!*((_BYTE *)a2 + 8))
                      std::__throw_bad_optional_access[abi:ne180100]();
                    if (_UTHardwareColorsAreEqual(v20[v12], *(_QWORD *)a2))
                      v6 = v10;
                    else
                      v6 = 0;
                    ++v12;
                  }
                  while (v12 < v11 && !v6);
                  if (v6)
                    break;
                }
              }
            }
            if (++v9 == v7)
            {
              v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
              if (v7)
                goto LABEL_18;
              goto LABEL_34;
            }
          }
        }
        else
        {
LABEL_34:
          v6 = 0;
        }

      }
      else
      {
        v6 = 0;
      }

      if (v6)
      {

        goto LABEL_43;
      }
LABEL_38:
      objc_msgSend(v4, "deleteCharactersInRange:", objc_msgSend(v4, "length", v5) - 1, 1);
    }
  }

  if (*((_BYTE *)a2 + 8))
  {
    v25[0] = 0;
    v25[8] = 0;
    v13 = (void *)v16;
    UniformTypeIdentifiers::ModelCode::getDeviceTypeWithModelCodeAndHardwareColorWithoutResolvingCurrentDevice(v15, v25);
    v6 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = 0;
LABEL_43:
    v13 = (void *)v16;
  }

  return v6;
}

void sub_1991DD584(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, void *a11)
{

  _Unwind_Resume(a1);
}

void sub_1991DD68C(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1991DDB64(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void _UTPrintModelCodesForCurrentDevice(UniformTypeIdentifiers::ModelCode *a1)
{
  UniformTypeIdentifiers::ModelCode *v2;
  const UTHardwareColor *v3;
  __CFString *v4;
  UniformTypeIdentifiers::ModelCode *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  uint64_t HardwareColorForCurrentDevice;
  int v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  UniformTypeIdentifiers::ModelCode::getCurrentDeviceModelCodes(a1);
  v2 = (UniformTypeIdentifiers::ModelCode *)objc_claimAutoreleasedReturnValue();
  HardwareColorForCurrentDevice = UniformTypeIdentifiers::ModelCode::getHardwareColorForCurrentDevice(v2);
  v14 = (int)v3;
  if ((_BYTE)v3)
  {
    UniformTypeIdentifiers::ModelCode::getHardwareColorSuffix((UniformTypeIdentifiers::ModelCode *)&HardwareColorForCurrentDevice, v3);
    v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
    if (v4)
      goto LABEL_6;
  }
  else
  {
    fputs("No enclosure color. If this hardware has different enclosure colors, please file a firmware radar.\n", (FILE *)a1);
  }
  v4 = &stru_1E35CEBE8;
LABEL_6:
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v5 = v2;
  v6 = -[UniformTypeIdentifiers::ModelCode countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v9, v15, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v10;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v10 != v7)
          objc_enumerationMutation(v5);
        fprintf((FILE *)a1, "%s%s\n", (const char *)objc_msgSend(objc_retainAutorelease(*(id *)(*((_QWORD *)&v9 + 1) + 8 * i)), "UTF8String"), (const char *)-[__CFString UTF8String](objc_retainAutorelease(v4), "UTF8String"));
      }
      v6 = -[UniformTypeIdentifiers::ModelCode countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v9, v15, 16);
    }
    while (v6);
  }

}

void sub_1991DDD60(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

id UniformTypeIdentifiers::ModelCode::getCurrentDeviceModelCodes(UniformTypeIdentifiers::ModelCode *this)
{
  if (qword_1ECD26C00 != -1)
    dispatch_once(&qword_1ECD26C00, &__block_literal_global_43);
  return (id)qword_1ECD26BF8;
}

uint64_t UniformTypeIdentifiers::ModelCode::getHardwareColorForCurrentDevice(UniformTypeIdentifiers::ModelCode *this)
{
  if (qword_1ECD26BF0 != -1)
    dispatch_once(&qword_1ECD26BF0, &__block_literal_global_38);
  return qword_1ECD26C30;
}

id UniformTypeIdentifiers::ModelCode::getHardwareColorSuffix(UniformTypeIdentifiers::ModelCode *this, const UTHardwareColor *a2)
{
  void *v2;
  uint64_t v4;
  uint64_t v5;

  if (*(_BYTE *)this == 1)
  {
    v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("@ECOLOR=%llu"), *((int *)this + 1), v4, v5);
  }
  else if (*(_BYTE *)this)
  {
    v2 = 0;
  }
  else
  {
    v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("@ECOLOR=%i,%i,%i"), *((unsigned __int8 *)this + 4), *((unsigned __int8 *)this + 5), *((unsigned __int8 *)this + 6));
  }
  return v2;
}

BOOL _UTHardwareColorGetCurrentEnclosureColor(UniformTypeIdentifiers::ModelCode *a1)
{
  uint64_t HardwareColorForCurrentDevice;
  char v3;

  HardwareColorForCurrentDevice = UniformTypeIdentifiers::ModelCode::getHardwareColorForCurrentDevice(a1);
  if (a1 && v3)
    *(_QWORD *)a1 = HardwareColorForCurrentDevice;
  return v3 != 0;
}

void std::__throw_bad_optional_access[abi:ne180100]()
{
  _QWORD *exception;

  exception = __cxa_allocate_exception(8uLL);
  *exception = MEMORY[0x1E0DE5048] + 16;
}

uint64_t ___ZN22UniformTypeIdentifiers9ModelCodeL20getModelCodeOverrideEPU8__strongP8NSStringPNSt3__18optionalI15UTHardwareColorEE_block_invoke()
{
  uint64_t result;

  result = os_variant_has_internal_content();
  _MergedGlobals = result;
  return result;
}

void ___ZN22UniformTypeIdentifiers9ModelCodeL32getHardwareColorForCurrentDeviceEv_block_invoke()
{
  void *v0;
  void *v1;
  uint64_t v2;
  unsigned __int8 v3;
  char v4;
  unint64_t v5;
  void *v6;
  void *v7;

  v0 = (void *)MGCopyAnswer();
  v1 = v0;
  if (v0)
  {
    v2 = objc_msgSend(v0, "unsignedLongLongValue");
    v3 = 0;
    v4 = 1;
    v5 = (v2 << 32) & 0xFF0000000000 | ((unint64_t)v2 << 48) | ((unint64_t)BYTE2(v2) << 32);
  }
  else
  {
    v6 = (void *)MGCopyAnswer();
    v7 = v6;
    if (v6)
    {
      v5 = objc_msgSend(v6, "longLongValue") << 32;
      v4 = 1;
      v3 = 1;
    }
    else
    {
      v3 = 0;
      v4 = 0;
      v5 = 0;
    }

  }
  qword_1ECD26C30 = v5 & 0xFFFFFFFFFFFFFF00 | v3;
  LOBYTE(dword_1ECD26C38) = v4;
}

void sub_1991DDFF4(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void ___ZN22UniformTypeIdentifiers9ModelCodeL26getCurrentDeviceModelCodesEv_block_invoke()
{
  void *v0;
  void *v1;
  uint64_t v2;
  void *v3;
  id v4;

  v4 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  if (v4)
  {
    v0 = (void *)MGCopyAnswer();
    if (v0)
      objc_msgSend(v4, "addObject:", v0);

    v1 = (void *)MGCopyAnswer();
    if (v1)
      objc_msgSend(v4, "addObject:", v1);

    if (objc_msgSend(v4, "count"))
    {
      v2 = objc_msgSend(v4, "copy");
      v3 = (void *)qword_1ECD26BF8;
      qword_1ECD26BF8 = v2;

    }
  }

}

void sub_1991DE0C0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;
  void *v11;

  v11 = v10;

  _Unwind_Resume(a1);
}

void ___ZN22UniformTypeIdentifiers9ModelCodeL26getDeviceTypeWithModelCodeEP8NSStringRKNSt3__18optionalI15UTHardwareColorEENS0_7OptionsE_block_invoke()
{
  void *v0;
  void *v1;
  uint64_t v2;
  void *v3;

  v0 = (void *)MGCopyAnswer();
  v1 = v0;
  if (v0)
    UniformTypeIdentifiers::ModelCode::getDeviceTypeWithModelCode(NSString *,std::optional<UTHardwareColor> const&,UniformTypeIdentifiers::ModelCode::Options)::deviceClass = objc_msgSend(v0, "unsignedLongLongValue");

  v2 = MGCopyAnswer();
  v3 = (void *)qword_1ECD26C08;
  qword_1ECD26C08 = v2;

}

void sub_1991DE150(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

id UniformTypeIdentifiers::ModelCode::log(UniformTypeIdentifiers::ModelCode *this)
{
  if (qword_1ECD26C28 != -1)
    dispatch_once(&qword_1ECD26C28, &__block_literal_global_58);
  return (id)qword_1ECD26C20;
}

void ___ZN22UniformTypeIdentifiers9ModelCodeL26getDeviceTypeWithModelCodeEP8NSStringRKNSt3__18optionalI15UTHardwareColorEENS0_7OptionsE_block_invoke_56(UniformTypeIdentifiers::ModelCode *a1)
{
  uint64_t v1;
  NSObject *v2;
  _BOOL4 v3;
  const char *v4;
  NSObject *v5;
  uint32_t v6;
  int v7;
  uint64_t v8;
  __int16 v9;
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v1 = qword_1ECD26C08;
  UniformTypeIdentifiers::ModelCode::log(a1);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = os_log_type_enabled(v2, OS_LOG_TYPE_ERROR);
  if (v1)
  {
    if (v3)
    {
      v7 = 138543618;
      v8 = qword_1ECD26C08;
      v9 = 2048;
      v10 = UniformTypeIdentifiers::ModelCode::getDeviceTypeWithModelCode(NSString *,std::optional<UTHardwareColor> const&,UniformTypeIdentifiers::ModelCode::Options)::deviceClass;
      v4 = "Unknown device class %{public}@ / %lli -- please send a bug report to UniformTypeIdentifiers to add support.";
      v5 = v2;
      v6 = 22;
LABEL_7:
      _os_log_error_impl(&dword_1991D8000, v5, OS_LOG_TYPE_ERROR, v4, (uint8_t *)&v7, v6);
    }
  }
  else if (v3)
  {
    v7 = 134217984;
    v8 = UniformTypeIdentifiers::ModelCode::getDeviceTypeWithModelCode(NSString *,std::optional<UTHardwareColor> const&,UniformTypeIdentifiers::ModelCode::Options)::deviceClass;
    v4 = "Unknown device class %lli -- please send a bug report to UniformTypeIdentifiers to add support.";
    v5 = v2;
    v6 = 12;
    goto LABEL_7;
  }

}

void ___ZN22UniformTypeIdentifiers9ModelCodeL3logEv_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.uti", "modelcode");
  v1 = (void *)qword_1ECD26C20;
  qword_1ECD26C20 = (uint64_t)v0;

}

void sub_1991DE3C4(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1991DE48C(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1991DE778(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1991DE898(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, char a10)
{
  uint64_t i;

  for (i = 16; i != -8; i -= 8)

  _Unwind_Resume(a1);
}

void sub_1991DE9A4(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  v3 = v2;

  _Unwind_Resume(a1);
}

void sub_1991DEEC8(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

id UniformTypeIdentifiers::Accessory::log(UniformTypeIdentifiers::Accessory *this)
{
  if (qword_1ECD26C58 != -1)
    dispatch_once(&qword_1ECD26C58, &__block_literal_global_1);
  return (id)_MergedGlobals_1;
}

void ___ZN22UniformTypeIdentifiers9AccessoryL3logEv_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.uti", "accessory");
  v1 = (void *)_MergedGlobals_1;
  _MergedGlobals_1 = (uint64_t)v0;

}

void sub_1991DEF90(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1991DF004(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1991DF04C(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1991DF090(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1991DF24C(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1991DF5CC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,char a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,void *a31,uint64_t a32,void *__p,uint64_t a34)
{
  void *v34;
  void *v35;

  if (__p)
  {
    a34 = (uint64_t)__p;
    operator delete(__p);
  }

  _Block_object_dispose(&a26, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy_(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose_(uint64_t a1)
{

}

void sub_1991DF750(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void sub_1991DF81C(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1991DF880(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1991DF8CC(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1991DF984(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1991DF9F4(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1991DFB0C(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1991DFC58(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1991DFFC4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14, void *__p, uint64_t a16)
{
  void *v16;
  void *v17;

  if (__p)
    operator delete(__p);

  _Unwind_Resume(a1);
}

void sub_1991E00C0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_1991E019C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  void *v14;

  _Unwind_Resume(a1);
}

void sub_1991E0228(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void UniformTypeIdentifiers::Type::detachTypeRecordsInTypes<NSMutableSet<UTType *> * {__strong}>(void *a1)
{
  id v1;
  unint64_t v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t j;
  unint64_t v8;
  void *v9;
  id v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  unint64_t v16;
  void *v17;
  id v18;
  void *__p[2];
  __int128 v20;
  __int128 v21;
  __int128 v22;
  uint64_t v23[128];
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v1 = a1;
  if (qword_1ECD26C68 != -1)
    dispatch_once(&qword_1ECD26C68, &__block_literal_global_2);
  if (_MergedGlobals_2)
  {
    v2 = objc_msgSend(v1, "count");
    if (v2)
    {
      if (v2 > 0x80)
      {
        v23[0] = 0;
        std::vector<UTTypeRecord *>::vector(__p, v2, v23);
        v24 = 0u;
        v25 = 0u;
        v26 = 0u;
        v27 = 0u;
        v11 = v1;
        v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v24, v23, 16);
        if (v12)
        {
          v13 = 0;
          v14 = *(_QWORD *)v25;
          do
          {
            for (i = 0; i != v12; ++i)
            {
              if (*(_QWORD *)v25 != v14)
                objc_enumerationMutation(v11);
              v16 = (unint64_t)*(id *)(*((_QWORD *)&v24 + 1) + 8 * i);
              v17 = (void *)v16;
              if ((v16 & 0x8000000000000000) == 0 && objc_msgSend((id)v16, "_constantIndex") < 0)
              {
                v18 = (id)objc_msgSend(v17, "_typeRecord");
                if (v18)
                  *((_QWORD *)__p[0] + v13++) = v18;
              }

            }
            v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v24, v23, 16);
          }
          while (v12);

          if (v13)
            _UTDetachTypeRecords((uint64_t)__p[0], v13);
        }
        else
        {

        }
        if (__p[0])
        {
          __p[1] = __p[0];
          operator delete(__p[0]);
        }
      }
      else
      {
        bzero(v23, 0x400uLL);
        *(_OWORD *)__p = 0u;
        v20 = 0u;
        v21 = 0u;
        v22 = 0u;
        v3 = v1;
        v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", __p, &v24, 16);
        if (v4)
        {
          v5 = 0;
          v6 = *(_QWORD *)v20;
          do
          {
            for (j = 0; j != v4; ++j)
            {
              if (*(_QWORD *)v20 != v6)
                objc_enumerationMutation(v3);
              v8 = (unint64_t)*((id *)__p[1] + j);
              v9 = (void *)v8;
              if ((v8 & 0x8000000000000000) == 0 && objc_msgSend((id)v8, "_constantIndex", __p[0]) < 0)
              {
                v10 = (id)objc_msgSend(v9, "_typeRecord");
                if (v10)
                  v23[v5++] = (uint64_t)v10;
              }

            }
            v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", __p, &v24, 16);
          }
          while (v4);

          if (v5)
            _UTDetachTypeRecords((uint64_t)v23, v5);
        }
        else
        {

        }
      }
    }
  }

}

void sub_1991E04E8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10)
{
  void *v10;

  if (__p)
    operator delete(__p);

  _Unwind_Resume(a1);
}

void sub_1991E062C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  void *v14;

  _Unwind_Resume(a1);
}

void sub_1991E06B8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_1991E0700(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1991E0744(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1991E0788(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1991E07DC(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1991E08D4(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1991E09C0(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1991E0A58(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1991E0B4C(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1991E0EA0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14, void *__p, uint64_t a16)
{
  void *v16;
  void *v17;

  if (__p)
    operator delete(__p);

  _Unwind_Resume(a1);
}

void sub_1991E0FB4(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1991E1030(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1991E1110(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

id UniformTypeIdentifiers::Type::getImportedType(UniformTypeIdentifiers::Type *this, NSString *a2, UTType *a3, NSBundle *a4)
{
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  UTType *v10;

  v6 = (void *)MEMORY[0x1E0CA5928];
  -[NSString identifier](a2, "identifier", a3, a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "typeRecordForImportedTypeWithIdentifier:conformingToIdentifier:", this, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    +[UTType _typeWithTypeRecord:detachTypeRecord:findConstant:](UTType, "_typeWithTypeRecord:detachTypeRecord:findConstant:", v8, 1, 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v10 = a3;
    if (!a3)
    {
      objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
      v10 = (UTType *)objc_claimAutoreleasedReturnValue();
    }
    +[_UTRuntimeConstantType typeWithIdentifier:bundle:infoPlistKey:](_UTRuntimeConstantType, "typeWithIdentifier:bundle:infoPlistKey:", this, v10, *MEMORY[0x1E0CA5A78]);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (!a3)

  }
  return v9;
}

void sub_1991E125C(_Unwind_Exception *a1)
{
  uint64_t v1;
  void *v2;

  if (!v1)

  _Unwind_Resume(a1);
}

void sub_1991E1358(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

id _UTIdentifierGetCanonicalRepresentation(void *a1)
{
  id v1;
  uint64_t v2;
  std::vector<char>::size_type v3;
  uint64_t v4;
  std::vector<char> *v5;
  void *v6;
  std::vector<char>::pointer begin;
  uint64_t v8;
  void *v10;
  void *v11;
  std::vector<char>::value_type __x[8];
  std::vector<char> v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v1 = a1;
  v2 = objc_msgSend(v1, "maximumLengthOfBytesUsingEncoding:", 4);
  v3 = v2 + 1;
  if (v2 == -1)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "void withFastBuffer(NSUInteger, const FunctionType &) [ElementType = char, ArraySize = 1024UL, FunctionType = (lambda at /Library/Caches/com.apple.xbs/Sources/UniformTypeIdentifiers/Framework/UTType.mm:1167:34)]");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInFunction:file:lineNumber:description:", v11, CFSTR("UTType.mm"), 1151, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("count > 0"));

LABEL_3:
    bzero(&v13, 0x400uLL);
    *(_QWORD *)__x = 0;
    if (objc_msgSend(v1, "getBytes:maxLength:usedLength:encoding:options:range:remainingRange:", &v13, v3, __x, 4, 0, 0, objc_msgSend(v1, "length"), 0))
    {
      v4 = *(_QWORD *)__x;
      if (*(_QWORD *)__x)
      {
        v5 = &v13;
        do
        {
          LOBYTE(v5->__begin_) = __tolower(LOBYTE(v5->__begin_));
          v5 = (std::vector<char> *)((char *)v5 + 1);
          --v4;
        }
        while (v4);
        v4 = *(_QWORD *)__x;
      }
      v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithBytes:length:encoding:", &v13, v4, 4);
    }
    else
    {
      v6 = 0;
    }
    goto LABEL_18;
  }
  if (v3 <= 0x400)
    goto LABEL_3;
  __x[0] = 0;
  std::vector<char>::vector(&v13, v3, __x);
  *(_QWORD *)__x = 0;
  if (objc_msgSend(v1, "getBytes:maxLength:usedLength:encoding:options:range:remainingRange:", v13.__begin_, v3, __x, 4, 0, 0, objc_msgSend(v1, "length"), 0))
  {
    v8 = *(_QWORD *)__x;
    begin = v13.__begin_;
    if (*(_QWORD *)__x)
    {
      do
      {
        *begin = __tolower(*begin);
        ++begin;
        --v8;
      }
      while (v8);
      v8 = *(_QWORD *)__x;
      begin = v13.__begin_;
    }
    v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithBytes:length:encoding:", begin, v8, 4);
  }
  else
  {
    v6 = 0;
  }
  if (v13.__begin_)
  {
    v13.__end_ = v13.__begin_;
    operator delete(v13.__begin_);
  }
LABEL_18:

  return v6;
}

void sub_1991E1648(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *__p, uint64_t a15)
{
  void *v15;
  void *v16;
  void *v17;

  _Unwind_Resume(a1);
}

void sub_1991E1874(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

_QWORD *std::vector<UTTypeRecord *>::vector(_QWORD *a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6;
  _QWORD *v7;
  _QWORD *v8;
  uint64_t v9;

  *a1 = 0;
  a1[1] = 0;
  a1[2] = 0;
  if (a2 >> 61)
    std::vector<UTTypeRecord *>::__throw_length_error[abi:ne180100]();
  v6 = 8 * a2;
  v7 = operator new(8 * a2);
  *a1 = v7;
  a1[1] = v7;
  v8 = &v7[a2];
  a1[2] = v8;
  v9 = *a3;
  do
  {
    *v7++ = v9;
    v6 -= 8;
  }
  while (v6);
  a1[1] = v8;
  return a1;
}

void sub_1991E1930(_Unwind_Exception *exception_object)
{
  uint64_t v1;
  void *v3;

  v3 = *(void **)v1;
  if (*(_QWORD *)v1)
  {
    *(_QWORD *)(v1 + 8) = v3;
    operator delete(v3);
  }
  _Unwind_Resume(exception_object);
}

void std::vector<UTTypeRecord *>::__throw_length_error[abi:ne180100]()
{
  std::__throw_length_error[abi:ne180100]("vector");
}

void __clang_call_terminate(void *a1)
{
  __cxa_begin_catch(a1);
  std::terminate();
}

void std::__throw_length_error[abi:ne180100](const char *a1)
{
  std::logic_error *exception;

  exception = (std::logic_error *)__cxa_allocate_exception(0x10uLL);
  std::length_error::length_error[abi:ne180100](exception, a1);
}

void sub_1991E19AC(_Unwind_Exception *a1)
{
  void *v1;

  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

std::logic_error *std::length_error::length_error[abi:ne180100](std::logic_error *a1, const char *a2)
{
  std::logic_error *result;

  result = std::logic_error::logic_error(a1, a2);
  result->__vftable = (std::logic_error_vtbl *)(MEMORY[0x1E0DE5020] + 16);
  return result;
}

void std::__throw_bad_array_new_length[abi:ne180100]()
{
  std::bad_array_new_length *exception;
  std::bad_array_new_length *v1;

  exception = (std::bad_array_new_length *)__cxa_allocate_exception(8uLL);
  v1 = std::bad_array_new_length::bad_array_new_length(exception);
}

std::vector<char> *__cdecl std::vector<char>::vector(std::vector<char> *this, std::vector<char>::size_type __n, const std::vector<char>::value_type *__x)
{
  char *v6;
  char *v7;

  this->__begin_ = 0;
  this->__end_ = 0;
  this->__end_cap_.__value_ = 0;
  if ((__n & 0x8000000000000000) != 0)
    std::vector<UTTypeRecord *>::__throw_length_error[abi:ne180100]();
  v6 = (char *)operator new(__n);
  this->__begin_ = v6;
  this->__end_ = v6;
  v7 = &v6[__n];
  this->__end_cap_.__value_ = &v6[__n];
  memset(v6, *(unsigned __int8 *)__x, __n);
  this->__end_ = v7;
  return this;
}

void sub_1991E1A74(_Unwind_Exception *exception_object)
{
  uint64_t v1;
  void *v3;

  v3 = *(void **)v1;
  if (*(_QWORD *)v1)
  {
    *(_QWORD *)(v1 + 8) = v3;
    operator delete(v3);
  }
  _Unwind_Resume(exception_object);
}

unint64_t std::__string_view_hash<char>::operator()[abi:ne180100](uint64_t *a1, unint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  unint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  unint64_t v23;
  unint64_t v24;
  unint64_t v25;
  uint64_t v26;
  unint64_t v27;
  uint64_t v28;
  unint64_t v29;
  unint64_t v30;
  unint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  unint64_t v39;
  unint64_t v40;
  unint64_t v41;
  unint64_t v42;
  uint64_t v43;
  unint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  _QWORD *v50;
  uint64_t v51;
  unint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  unint64_t v66;
  unint64_t v67;
  unint64_t v68;
  unint64_t v69;
  unint64_t v70;
  uint64_t v72;
  unint64_t v73;

  if (a2 > 0x20)
  {
    if (a2 <= 0x40)
    {
      v5 = *(uint64_t *)((char *)a1 + a2 - 16);
      v6 = *a1 - 0x3C5A37A36834CED9 * (v5 + a2);
      v8 = a1[2];
      v7 = a1[3];
      v9 = __ROR8__(v6 + v7, 52);
      v10 = v6 + a1[1];
      v11 = __ROR8__(v10, 7);
      v12 = v10 + v8;
      v13 = *(uint64_t *)((char *)a1 + a2 - 32) + v8;
      v14 = *(uint64_t *)((char *)a1 + a2 - 8) + v7;
      v15 = __ROR8__(v14 + v13, 52);
      v16 = v11 + __ROR8__(*a1 - 0x3C5A37A36834CED9 * (v5 + a2), 37) + v9;
      v17 = __ROR8__(v13, 37);
      v18 = *(uint64_t *)((char *)a1 + a2 - 24) + v13;
      v19 = __ROR8__(v18, 7);
      v20 = v16 + __ROR8__(v12, 31);
      v21 = v18 + v5;
      v22 = v21 + v14;
      v23 = 0x9AE16A3B2F90404FLL;
      v24 = 0xC3A5C85C97CB3127 * (v22 + v20) - 0x651E95C4D06FBFB1 * (v12 + v7 + v17 + v19 + v15 + __ROR8__(v21, 31));
      v25 = v20 - 0x3C5A37A36834CED9 * (v24 ^ (v24 >> 47));
      return (v25 ^ (v25 >> 47)) * v23;
    }
    v4 = 0x9DDFEA08EB382D69;
    v32 = *(uint64_t *)((char *)a1 + a2 - 48);
    v33 = *(uint64_t *)((char *)a1 + a2 - 40);
    v34 = *(uint64_t *)((char *)a1 + a2 - 24);
    v36 = *(uint64_t *)((char *)a1 + a2 - 64);
    v35 = *(uint64_t *)((char *)a1 + a2 - 56);
    v37 = *(uint64_t *)((char *)a1 + a2 - 16);
    v38 = *(uint64_t *)((char *)a1 + a2 - 8);
    v39 = v35 + v37;
    v40 = 0x9DDFEA08EB382D69
        * (v34 ^ ((0x9DDFEA08EB382D69 * (v34 ^ (v32 + a2))) >> 47) ^ (0x9DDFEA08EB382D69 * (v34 ^ (v32 + a2))));
    v41 = 0x9DDFEA08EB382D69 * (v40 ^ (v40 >> 47));
    v42 = v32 + v35 + v36 + a2;
    v43 = v42 + v33;
    v44 = __ROR8__(v42, 44) + v36 + a2 + __ROR8__(v36 + a2 + v33 - 0x622015F714C7D297 * (v40 ^ (v40 >> 47)), 21);
    v45 = v35 + v37 + *(uint64_t *)((char *)a1 + a2 - 32) - 0x4B6D499041670D8DLL;
    v46 = v34 + v37 + v45;
    v47 = __ROR8__(v46, 44);
    v48 = v46 + v38;
    v49 = v47 + v45 + __ROR8__(v45 + v33 + v38, 21);
    v51 = *a1;
    v50 = a1 + 4;
    v52 = v51 - 0x4B6D499041670D8DLL * v33;
    v53 = -(uint64_t)((a2 - 1) & 0xFFFFFFFFFFFFFFC0);
    do
    {
      v54 = *(v50 - 3);
      v55 = v52 + v43 + v39 + v54;
      v56 = v50[2];
      v57 = v50[3];
      v58 = v50[1];
      v39 = v58 + v43 - 0x4B6D499041670D8DLL * __ROR8__(v39 + v44 + v56, 42);
      v59 = v41 + v48;
      v60 = *(v50 - 2);
      v61 = *(v50 - 1);
      v62 = *(v50 - 4) - 0x4B6D499041670D8DLL * v44;
      v63 = v62 + v48 + v61;
      v64 = v62 + v54 + v60;
      v43 = v64 + v61;
      v65 = __ROR8__(v64, 44) + v62;
      v66 = (0xB492B66FBE98F273 * __ROR8__(v55, 37)) ^ v49;
      v52 = 0xB492B66FBE98F273 * __ROR8__(v59, 33);
      v44 = v65 + __ROR8__(v63 + v66, 21);
      v67 = v52 + v49 + *v50;
      v48 = v58 + v56 + v67 + v57;
      v49 = __ROR8__(v58 + v56 + v67, 44) + v67 + __ROR8__(v39 + v60 + v67 + v57, 21);
      v50 += 8;
      v41 = v66;
      v53 += 64;
    }
    while (v53);
    v68 = v52
        - 0x622015F714C7D297
        * ((0x9DDFEA08EB382D69
          * (v49 ^ ((0x9DDFEA08EB382D69 * (v49 ^ v44)) >> 47) ^ (0x9DDFEA08EB382D69 * (v49 ^ v44)))) ^ ((0x9DDFEA08EB382D69 * (v49 ^ ((0x9DDFEA08EB382D69 * (v49 ^ v44)) >> 47) ^ (0x9DDFEA08EB382D69 * (v49 ^ v44)))) >> 47));
    v69 = 0x9DDFEA08EB382D69
        * (v68 ^ (v66
                - 0x4B6D499041670D8DLL * (v39 ^ (v39 >> 47))
                - 0x622015F714C7D297
                * ((0x9DDFEA08EB382D69
                  * (v48 ^ ((0x9DDFEA08EB382D69 * (v48 ^ v43)) >> 47) ^ (0x9DDFEA08EB382D69 * (v48 ^ v43)))) ^ ((0x9DDFEA08EB382D69 * (v48 ^ ((0x9DDFEA08EB382D69 * (v48 ^ v43)) >> 47) ^ (0x9DDFEA08EB382D69 * (v48 ^ v43)))) >> 47))));
    v70 = 0x9DDFEA08EB382D69 * (v68 ^ (v69 >> 47) ^ v69);
    goto LABEL_13;
  }
  if (a2 > 0x10)
  {
    v26 = a1[1];
    v27 = 0xB492B66FBE98F273 * *a1;
    v28 = __ROR8__(0x9AE16A3B2F90404FLL * *(uint64_t *)((char *)a1 + a2 - 8), 30) + __ROR8__(v27 - v26, 43);
    v29 = v27 + a2 + __ROR8__(v26 ^ 0xC949D7C7509E6557, 20) - 0x9AE16A3B2F90404FLL * *(uint64_t *)((char *)a1 + a2 - 8);
    v23 = 0x9DDFEA08EB382D69;
    v30 = 0x9DDFEA08EB382D69 * ((v28 - 0x3C5A37A36834CED9 * *(uint64_t *)((char *)a1 + a2 - 16)) ^ v29);
    v31 = v29 ^ (v30 >> 47) ^ v30;
LABEL_8:
    v25 = 0x9DDFEA08EB382D69 * v31;
    return (v25 ^ (v25 >> 47)) * v23;
  }
  if (a2 < 9)
  {
    if (a2 >= 4)
    {
      v72 = *(unsigned int *)((char *)a1 + a2 - 4);
      v23 = 0x9DDFEA08EB382D69;
      v73 = 0x9DDFEA08EB382D69 * ((a2 + (8 * *(_DWORD *)a1)) ^ v72);
      v31 = v72 ^ (v73 >> 47) ^ v73;
      goto LABEL_8;
    }
    v4 = 0x9AE16A3B2F90404FLL;
    if (a1 == (uint64_t *)((char *)a1 + a2))
      return v4;
    v70 = (0xC949D7C7509E6557 * (a2 + 4 * *((unsigned __int8 *)a1 + a2 - 1))) ^ (0x9AE16A3B2F90404FLL
                                                                                   * (*(unsigned __int8 *)a1 | ((unint64_t)*((unsigned __int8 *)a1 + (a2 >> 1)) << 8)));
LABEL_13:
    v4 *= v70 ^ (v70 >> 47);
    return v4;
  }
  v2 = *(uint64_t *)((char *)a1 + a2 - 8);
  v3 = __ROR8__(v2 + a2, a2);
  return (0x9DDFEA08EB382D69
        * ((0x9DDFEA08EB382D69
          * (v3 ^ ((0x9DDFEA08EB382D69 * (v3 ^ *a1)) >> 47) ^ (0x9DDFEA08EB382D69 * (v3 ^ *a1)))) ^ ((0x9DDFEA08EB382D69 * (v3 ^ ((0x9DDFEA08EB382D69 * (v3 ^ *a1)) >> 47) ^ (0x9DDFEA08EB382D69 * (v3 ^ *a1)))) >> 47))) ^ v2;
}

void sub_1991E23A4(_Unwind_Exception *exception_object)
{
  void *v1;

  if (v1)
    operator delete(v1);
  _Unwind_Resume(exception_object);
}

id UniformTypeIdentifiers::CoreTypes::log(UniformTypeIdentifiers::CoreTypes *this)
{
  if (qword_1ECD26C98 != -1)
    dispatch_once(&qword_1ECD26C98, &__block_literal_global_427);
  return (id)qword_1ECD26C90;
}

void __UNIFORM_TYPE_IDENTIFIERS_FAILED_TO_REALIZE_A_COMPILE_TIME_CONSTANT_TYPE_OBJECT__(_QWORD *a1)
{
  uint64_t v2;
  uint64_t isKindOfClass;
  NSObject *v4;
  UniformTypeIdentifiers::CoreTypes *v5;
  void *v6;
  NSObject *v7;
  void *v8;
  UniformTypeIdentifiers::CoreTypes *v9;
  NSObject *v10;
  Dl_info __s;
  uint8_t buf[4];
  _QWORD *v13;
  __int16 v14;
  uint64_t v15;
  __int16 v16;
  UniformTypeIdentifiers::CoreTypes *v17;
  __int16 v18;
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v2 = a1[2];
  isKindOfClass = objc_opt_isKindOfClass();
  if ((isKindOfClass & 1) != 0)
  {
    UniformTypeIdentifiers::CoreTypes::log((UniformTypeIdentifiers::CoreTypes *)isKindOfClass);
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 134218242;
      v13 = a1;
      v14 = 2114;
      v15 = v2;
      _os_log_error_impl(&dword_1991D8000, v4, OS_LOG_TYPE_ERROR, "Failed to realize static UTType instance %p for identifier %{public}@. Please file a bug. The type should be present in Core Types.", buf, 0x16u);
    }

  }
  else
  {
    v5 = (UniformTypeIdentifiers::CoreTypes *)dladdr(a1, &__s);
    if ((_DWORD)v5 && __s.dli_fname)
    {
      objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "stringWithFileSystemRepresentation:length:", __s.dli_fname, strlen(__s.dli_fname));
      v7 = objc_claimAutoreleasedReturnValue();

      -[NSObject lastPathComponent](v7, "lastPathComponent");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSObject stringByDeletingLastPathComponent](v7, "stringByDeletingLastPathComponent");
      v9 = (UniformTypeIdentifiers::CoreTypes *)objc_claimAutoreleasedReturnValue();
      UniformTypeIdentifiers::CoreTypes::log(v9);
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 134218754;
        v13 = a1;
        v14 = 2114;
        v15 = v2;
        v16 = 2112;
        v17 = v9;
        v18 = 2114;
        v19 = v8;
        _os_log_error_impl(&dword_1991D8000, v10, OS_LOG_TYPE_ERROR, "Failed to realize static UTType instance %p for identifier %{public}@. The type was defined in the binary %@/%{public}@. If that is an Apple binary, please file a bug.", buf, 0x2Au);
      }

    }
    else
    {
      UniformTypeIdentifiers::CoreTypes::log(v5);
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 134218242;
        v13 = a1;
        v14 = 2114;
        v15 = v2;
        _os_log_error_impl(&dword_1991D8000, v7, OS_LOG_TYPE_ERROR, "Failed to realize static UTType instance %p for identifier %{public}@. The faulting component was unknown at runtime.", buf, 0x16u);
      }
    }

  }
}

void sub_1991E26B0(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void ___ZN22UniformTypeIdentifiers9CoreTypesL3logEv_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.uti", "static");
  v1 = (void *)qword_1ECD26C90;
  qword_1ECD26C90 = (uint64_t)v0;

}

id _typeIdentifierFromUTType(void *a1)
{
  id v1;
  void *v2;
  void *v4;
  void *v5;

  v1 = a1;
  objc_msgSend(v1, "identifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v2, "length"))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "NSString *_typeIdentifierFromUTType(UTType *__strong)");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "handleFailureInFunction:file:lineNumber:description:", v5, CFSTR("NSItemProvider+UTType.m"), 17, CFSTR("Content type %@ has an invalid type identifier."), v1);

  }
  return v2;
}

id _utTypesFromTypeIdentifiers(void *a1)
{
  id v1;
  void *v2;
  id v3;
  uint64_t v4;
  __int128 v5;
  uint64_t v6;
  uint64_t v7;
  NSObject *v8;
  uint64_t i;
  uint64_t v10;
  void *v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  uint8_t buf[4];
  uint64_t v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v1 = a1;
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v1, "count"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v3 = v1;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v14, v20, 16);
  if (v4)
  {
    v6 = v4;
    v7 = *(_QWORD *)v15;
    v8 = MEMORY[0x1E0C81028];
    *(_QWORD *)&v5 = 138543362;
    v13 = v5;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v15 != v7)
          objc_enumerationMutation(v3);
        v10 = *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * i);
        +[UTType _typeWithIdentifier:allowUndeclared:](UTType, "_typeWithIdentifier:allowUndeclared:", v10, 1, v13, (_QWORD)v14);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        if (v11)
        {
          objc_msgSend(v2, "addObject:", v11);
        }
        else if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = v13;
          v19 = v10;
          _os_log_error_impl(&dword_1991D8000, v8, OS_LOG_TYPE_ERROR, "NSItemProvider contains an invalid type identifier “%{public}@” which will be ignored.", buf, 0xCu);
        }

      }
      v6 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v14, v20, 16);
    }
    while (v6);
  }

  return v2;
}

void _UTSetRuntimeIssueCatcher(uint64_t a1)
{
  uint64_t v2;
  void *v3;

  if (qword_1ECD26CB8 != -1)
    dispatch_once(&qword_1ECD26CB8, &__block_literal_global_4);
  v2 = MEMORY[0x19AEBD224](a1);
  v3 = (void *)qword_1ECD26CA8;
  qword_1ECD26CA8 = v2;

}

void __UNIFORM_TYPE_IDENTIFIER_WAS_NOT_DECLARED_IN_INFO_PLIST_OF_BUNDLE__(uint64_t a1, int a2, void *a3, int a4)
{
  UniformTypeIdentifiers::RuntimeIssues *v7;
  UniformTypeIdentifiers::RuntimeIssues *v8;
  NSObject *v9;
  _BOOL4 v10;
  const char *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  const char *v15;
  const char *v16;
  void *v17;
  void *v18;
  int v19;
  uint64_t v20;
  __int16 v21;
  const char *v22;
  __int16 v23;
  uint64_t v24;
  __int16 v25;
  const char *v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = v7;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
    v7 = (UniformTypeIdentifiers::RuntimeIssues *)objc_claimAutoreleasedReturnValue();
    v8 = v7;
  }
  UniformTypeIdentifiers::RuntimeIssues::runtimeIssueLog(v7);
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = os_log_type_enabled(v9, OS_LOG_TYPE_FAULT);
  if (a4 == 2)
  {
    if (v10)
    {
      if (a2)
        v11 = "exported";
      else
        v11 = "imported";
      -[UniformTypeIdentifiers::RuntimeIssues bundleURL](v8, "bundleURL");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "lastPathComponent");
      v13 = objc_claimAutoreleasedReturnValue();
      v14 = (void *)v13;
      if (a2)
        v15 = "imported";
      else
        v15 = "exported";
      v19 = 138544130;
      v20 = a1;
      v21 = 2082;
      v22 = v11;
      v23 = 2114;
      v24 = v13;
      v25 = 2082;
      v26 = v15;
      _os_log_fault_impl(&dword_1991D8000, v9, OS_LOG_TYPE_FAULT, "Type \"%{public}@\" was expected to be %{public}s in the Info.plist of %{public}@, but it was %{public}s instead.", (uint8_t *)&v19, 0x2Au);

    }
  }
  else if (v10)
  {
    if (a2)
      v16 = "exported";
    else
      v16 = "imported";
    -[UniformTypeIdentifiers::RuntimeIssues bundleURL](v8, "bundleURL");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "lastPathComponent");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = 138543874;
    v20 = a1;
    v21 = 2082;
    v22 = v16;
    v23 = 2114;
    v24 = (uint64_t)v18;
    _os_log_fault_impl(&dword_1991D8000, v9, OS_LOG_TYPE_FAULT, "Type \"%{public}@\" was expected to be declared and %{public}s in the Info.plist of %{public}@, but it was not found.", (uint8_t *)&v19, 0x20u);

  }
}

void sub_1991E3F1C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

id UniformTypeIdentifiers::RuntimeIssues::runtimeIssueLog(UniformTypeIdentifiers::RuntimeIssues *this)
{
  if (qword_1ECD26CC8 != -1)
    dispatch_once(&qword_1ECD26CC8, &__block_literal_global_5);
  return (id)qword_1ECD26CC0;
}

void _ZZZ25_UTSetRuntimeIssueCatcherEUb_EN3__08__invokeEP28os_log_fault_callback_info_s(UniformTypeIdentifiers::RuntimeIssues *a1)
{
  UniformTypeIdentifiers::RuntimeIssues *v1;
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  const __CFString *v6;
  __CFString *v7;

  v1 = a1;
  if (off_1ECD26CB0)
    a1 = (UniformTypeIdentifiers::RuntimeIssues *)off_1ECD26CB0(a1);
  if (qword_1ECD26CA8)
  {
    v2 = (void *)*((_QWORD *)v1 + 1);
    UniformTypeIdentifiers::RuntimeIssues::runtimeIssueLog(a1);
    v3 = (void *)objc_claimAutoreleasedReturnValue();

    if (v2 == v3)
    {
      v4 = qword_1ECD26CA8;
      v5 = *((_QWORD *)v1 + 5);
      if (v5)
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v5);
        v6 = (const __CFString *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v6 = CFSTR("?");
      }
      v7 = (__CFString *)v6;
      (*(void (**)(uint64_t))(v4 + 16))(v4);
      if (v5)

    }
  }
}

void sub_1991E4058(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  uint64_t v10;

  if (v10)

  _Unwind_Resume(exception_object);
}

void ___ZN22UniformTypeIdentifiers13RuntimeIssuesL15runtimeIssueLogEv_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.runtime-issues", "Type Declaration Issues");
  v1 = (void *)qword_1ECD26CC0;
  qword_1ECD26CC0 = (uint64_t)v0;

}

uint64_t _UTHardwareColorMakeWithRGBComponents(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (a2 << 40) | (a3 << 48) | (a1 << 32);
}

uint64_t _UTHardwareColorMakeWithIndex(uint64_t a1)
{
  return (a1 << 32) | 1;
}

BOOL _UTHardwareColorsAreEqual(uint64_t a1, uint64_t a2)
{
  if (a1 != a2)
    return 0;
  if (a1 != 1)
  {
    if (!(_BYTE)a1)
      return WORD2(a1) == WORD2(a2) && BYTE6(a1) == BYTE6(a2);
    return 0;
  }
  return HIDWORD(a1) == HIDWORD(a2);
}

id _UTHardwareColorGetDebugDescription(unint64_t a1)
{
  unint64_t v1;
  void *v2;
  uint64_t v4;
  uint64_t v5;

  v1 = HIBYTE(a1);
  if (a1 == 1)
  {
    v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("<indexed hardware color> { %li }"), ((_DWORD)v1 << 24) | (BYTE6(a1) << 16) | (BYTE5(a1) << 8) | BYTE4(a1), v4, v5);
  }
  else if ((_BYTE)a1)
  {
    v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("<hardware color type %u> { %016llx }"), a1, a1 | ((unint64_t)(((_DWORD)v1 << 24) | (BYTE6(a1) << 16) | (BYTE5(a1) << 8) | BYTE4(a1)) << 32), v5);
  }
  else
  {
    v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("<RGB hardware color> { r = %u, g = %u, b = %u }"), BYTE4(a1), BYTE5(a1), BYTE6(a1));
  }
  return v2;
}

void sub_1991E4318(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_1991E4704(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__0(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__0(uint64_t a1)
{

}

void sub_1991E485C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_1991E49A0(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_1991E4AE8(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

Boolean CFEqual(CFTypeRef cf1, CFTypeRef cf2)
{
  return MEMORY[0x1E0C98620](cf1, cf2);
}

void CFRelease(CFTypeRef cf)
{
  MEMORY[0x1E0C98BC0](cf);
}

CFStringRef CFStringCreateWithSubstring(CFAllocatorRef alloc, CFStringRef str, CFRange range)
{
  return (CFStringRef)MEMORY[0x1E0C99030](alloc, str, range.location, range.length);
}

CFRange CFStringFind(CFStringRef theString, CFStringRef stringToFind, CFStringCompareFlags compareOptions)
{
  CFIndex v3;
  CFIndex v4;
  CFRange result;

  v3 = MEMORY[0x1E0C99050](theString, stringToFind, compareOptions);
  result.length = v4;
  result.location = v3;
  return result;
}

const char *__cdecl CFStringGetCStringPtr(CFStringRef theString, CFStringEncoding encoding)
{
  return (const char *)MEMORY[0x1E0C990A0](theString, *(_QWORD *)&encoding);
}

uint64_t MGCopyAnswer()
{
  return MEMORY[0x1E0DE2B20]();
}

Boolean UTTypeIsDynamic(CFStringRef inUTI)
{
  return MEMORY[0x1E0CA5998](inUTI);
}

void _Block_object_dispose(const void *a1, const int a2)
{
  MEMORY[0x1E0C80948](a1, *(_QWORD *)&a2);
}

uint64_t _CFExtensionIsValidToAppend()
{
  return MEMORY[0x1E0C9A180]();
}

uint64_t _CFGetPathExtensionRangesFromPathComponent()
{
  return MEMORY[0x1E0C9A1A8]();
}

uint64_t _NSIsNSArray()
{
  return MEMORY[0x1E0C9A860]();
}

uint64_t _NSIsNSDictionary()
{
  return MEMORY[0x1E0C9A888]();
}

uint64_t _NSIsNSString()
{
  return MEMORY[0x1E0C9A8B0]();
}

uint64_t _UTTypeCopyDescriptionLocalizationDictionary()
{
  return MEMORY[0x1E0CA5A18]();
}

uint64_t _UTTypeCopyKindStringDictionaryForNonMaterializedItem()
{
  return MEMORY[0x1E0CA5A30]();
}

uint64_t _UTTypeCopyKindStringForNonMaterializedItem()
{
  return MEMORY[0x1E0CA5A38]();
}

uint64_t _UTTypeCreateDynamicIdentifierForTaggedPointerObject()
{
  return MEMORY[0x1E0CA5A48]();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
  MEMORY[0x1E0C80A20](exception_object);
}

std::logic_error *__cdecl std::logic_error::logic_error(std::logic_error *this, const char *a2)
{
  return (std::logic_error *)MEMORY[0x1E0DE4288](this, a2);
}

std::bad_array_new_length *__cdecl std::bad_array_new_length::bad_array_new_length(std::bad_array_new_length *this)
{
  return (std::bad_array_new_length *)MEMORY[0x1E0DE4388](this);
}

void std::terminate(void)
{
  MEMORY[0x1E0DE4E18]();
}

void operator delete(void *__p)
{
  off_1E35CDDA8(__p);
}

void *__cdecl operator new(size_t __sz)
{
  return (void *)off_1E35CDDB0(__sz);
}

void *__cdecl operator new(size_t __sz, const std::nothrow_t *a2)
{
  return (void *)off_1E35CDDB8(__sz, a2);
}

void *__cxa_allocate_exception(size_t thrown_size)
{
  return (void *)MEMORY[0x1E0DE5068](thrown_size);
}

void *__cxa_begin_catch(void *a1)
{
  return (void *)MEMORY[0x1E0DE5080](a1);
}

void __cxa_free_exception(void *a1)
{
  MEMORY[0x1E0DE50A0](a1);
}

void __cxa_throw(void *a1, struct type_info *lptinfo, void (*a3)(void *))
{
  MEMORY[0x1E0DE50D8](a1, lptinfo, a3);
}

__darwin_ct_rune_t __tolower(__darwin_ct_rune_t a1)
{
  return MEMORY[0x1E0C80C70](*(_QWORD *)&a1);
}

uint64_t _dyld_get_prog_image_header()
{
  return MEMORY[0x1E0C80E90]();
}

uint64_t _objc_registerTaggedPointerClass()
{
  return MEMORY[0x1E0DE79C8]();
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

void abort(void)
{
  MEMORY[0x1E0C813A8]();
}

int backtrace(void **a1, int a2)
{
  return MEMORY[0x1E0C816B8](a1, *(_QWORD *)&a2);
}

void bzero(void *a1, size_t a2)
{
  MEMORY[0x1E0C81758](a1, a2);
}

Ivar *__cdecl class_copyIvarList(Class cls, unsigned int *outCount)
{
  return (Ivar *)MEMORY[0x1E0DE7A70](cls, outCount);
}

id class_createInstance(Class cls, size_t extraBytes)
{
  return (id)MEMORY[0x1E0DE7A90](cls, extraBytes);
}

size_t class_getInstanceSize(Class cls)
{
  return MEMORY[0x1E0DE7AB0](cls);
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

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
  MEMORY[0x1E0C82E08](predicate, block);
}

int dladdr(const void *a1, Dl_info *a2)
{
  return MEMORY[0x1E0C83028](a1, a2);
}

uint64_t dyld_image_header_containing_address()
{
  return MEMORY[0x1E0C830F8]();
}

uint64_t dyld_image_path_containing_address()
{
  return MEMORY[0x1E0C83100]();
}

int fprintf(FILE *a1, const char *a2, ...)
{
  return MEMORY[0x1E0C83478](a1, a2);
}

int fputs(const char *a1, FILE *a2)
{
  return MEMORY[0x1E0C83490](a1, a2);
}

void free(void *a1)
{
  MEMORY[0x1E0C834A8](a1);
}

char *__cdecl getenv(const char *a1)
{
  return (char *)MEMORY[0x1E0C83660](a1);
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

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return (void *)MEMORY[0x1E0C84098](__dst, __src, __len);
}

void *__cdecl memset(void *__b, int __c, size_t __len)
{
  return (void *)MEMORY[0x1E0C840B0](__b, *(_QWORD *)&__c, __len);
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

Class objc_getClass(const char *name)
{
  return (Class)MEMORY[0x1E0DE7CB0](name);
}

id objc_getProperty(id self, SEL _cmd, ptrdiff_t offset, BOOL atomic)
{
  return (id)MEMORY[0x1E0DE7CD0](self, _cmd, offset, atomic);
}

Class objc_lookUpClass(const char *name)
{
  return (Class)MEMORY[0x1E0DE7D10](name);
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

id objc_retainBlock(id a1)
{
  return (id)MEMORY[0x1E0DE7E70](a1);
}

void objc_storeStrong(id *location, id obj)
{
  MEMORY[0x1E0DE7FB0](location, obj);
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

uint64_t os_log_set_fault_callback()
{
  return MEMORY[0x1E0C84750]();
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x1E0C84780](oslog, type);
}

BOOL os_unfair_lock_trylock(os_unfair_lock_t lock)
{
  return MEMORY[0x1E0C849A8](lock);
}

void os_unfair_lock_unlock(os_unfair_lock_t lock)
{
  MEMORY[0x1E0C849B0](lock);
}

uint64_t os_unfair_recursive_lock_lock_with_options()
{
  return MEMORY[0x1E0C849B8]();
}

uint64_t os_unfair_recursive_lock_unlock()
{
  return MEMORY[0x1E0C849D0]();
}

uint64_t os_variant_has_internal_content()
{
  return MEMORY[0x1E0C849F0]();
}

uint64_t os_variant_has_internal_diagnostics()
{
  return MEMORY[0x1E0C849F8]();
}

int sscanf(const char *a1, const char *a2, ...)
{
  return MEMORY[0x1E0C85498](a1, a2);
}

int strcasecmp(const char *a1, const char *a2)
{
  return MEMORY[0x1E0C85500](a1, a2);
}

char *__cdecl strchr(char *__s, int __c)
{
  return (char *)MEMORY[0x1E0C85518](__s, *(_QWORD *)&__c);
}

size_t strlen(const char *__s)
{
  return MEMORY[0x1E0C85578](__s);
}

int strncmp(const char *__s1, const char *__s2, size_t __n)
{
  return MEMORY[0x1E0C855A8](__s1, __s2, __n);
}

size_t strnlen(const char *__s1, size_t __n)
{
  return MEMORY[0x1E0C855C0](__s1, __n);
}

uint64_t strtoll(const char *__str, char **__endptr, int __base)
{
  return MEMORY[0x1E0C85678](__str, __endptr, *(_QWORD *)&__base);
}

