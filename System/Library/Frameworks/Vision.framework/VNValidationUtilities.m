@implementation VNValidationUtilities

+ (BOOL)validateAsyncStatusState:(id)a3 error:(id *)a4
{
  id v5;
  void *v6;
  int v7;
  void *v8;
  int v9;
  const __CFString *v10;
  void *v11;
  char v12;
  BOOL v13;

  v5 = a3;
  v6 = v5;
  if (!v5)
  {
    if (a4)
    {
      +[VNError errorForInternalErrorWithLocalizedDescription:](VNError, "errorForInternalErrorWithLocalizedDescription:", CFSTR("Async status object is nil"));
      v11 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_18:
      v13 = 0;
      *a4 = v11;
      goto LABEL_20;
    }
    goto LABEL_19;
  }
  v7 = objc_msgSend(v5, "completed");
  objc_msgSend(v6, "error");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
    v9 = v7;
  else
    v9 = 0;
  if (v9 == 1)
  {
    if (a4)
    {
      v10 = CFSTR("Async status object reported as completed successfully but with an error");
LABEL_17:
      +[VNError errorForInternalErrorWithLocalizedDescription:](VNError, "errorForInternalErrorWithLocalizedDescription:", v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_18;
    }
    goto LABEL_19;
  }
  if (v8)
    v12 = 1;
  else
    v12 = v7;
  if ((v12 & 1) == 0)
  {
    if (a4)
    {
      v10 = CFSTR("Async status object reported as failed but without an error");
      goto LABEL_17;
    }
LABEL_19:
    v13 = 0;
    goto LABEL_20;
  }
  v13 = 1;
LABEL_20:

  return v13;
}

+ (id)originatingRequestSpecifierInOptions:(id)a3 error:(id *)a4
{
  id v5;
  objc_class *v6;
  id v7;
  void *v8;
  id v9;
  id v11;

  v5 = a3;
  v11 = 0;
  v6 = (objc_class *)objc_opt_class();
  LODWORD(a4) = _getObjectFromOptionsDictionary(&v11, v5, CFSTR("VNDetectorOption_OriginatingRequestSpecifier"), 1, v6, (uint64_t)a4);
  v7 = v11;
  v8 = v7;
  if (!(_DWORD)a4)
    v7 = 0;
  v9 = v7;

  return v9;
}

+ (BOOL)validateAsyncStatusResults:(id)a3 error:(id *)a4
{
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  BOOL v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v6 = a3;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v7)
  {
    v8 = *(_QWORD *)v13;
    while (2)
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v13 != v8)
          objc_enumerationMutation(v6);
        if ((objc_msgSend(a1, "validateAsyncStatusResult:error:", *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * i), a4, (_QWORD)v12) & 1) == 0)
        {
          v10 = 0;
          goto LABEL_11;
        }
      }
      v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      if (v7)
        continue;
      break;
    }
  }
  v10 = 1;
LABEL_11:

  return v10;
}

+ (BOOL)validateAsyncStatusResult:(id)a3 error:(id *)a4
{
  id v5;
  BOOL v6;

  v5 = a3;
  if (+[VNValidationUtilities validateAsyncStatusState:error:](VNValidationUtilities, "validateAsyncStatusState:error:", v5, a4))
  {
    if ((objc_msgSend(v5, "completed") & 1) != 0)
    {
      v6 = 1;
    }
    else if (a4)
    {
      objc_msgSend(v5, "error");
      v6 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v6 = 0;
    }
  }
  else
  {
    +[VNError VNAssert:log:](VNError, "VNAssert:log:", 0, CFSTR("Invalid async status state"));
    v6 = 0;
  }

  return v6;
}

+ (BOOL)getBOOLValue:(BOOL *)a3 forKey:(id)a4 inOptions:(id)a5 withDefaultValue:(BOOL)a6 error:(id *)a7
{
  id v11;
  id v12;
  objc_class *v13;
  char ObjectFromOptionsDictionary;
  id v15;
  void *v16;
  char v17;
  id v19;

  v11 = a4;
  v12 = a5;
  v19 = 0;
  v13 = (objc_class *)objc_opt_class();
  ObjectFromOptionsDictionary = _getObjectFromOptionsDictionary(&v19, v12, v11, 0, v13, (uint64_t)a7);
  v15 = v19;
  v16 = v15;
  if (a3)
    v17 = ObjectFromOptionsDictionary;
  else
    v17 = 0;
  if ((v17 & 1) != 0)
  {
    if (v15)
      a6 = objc_msgSend(v15, "BOOLValue");
    *a3 = a6;
  }

  return ObjectFromOptionsDictionary;
}

+ (BOOL)validateNonZeroImageWidth:(unint64_t)a3 height:(unint64_t)a4 componentNameProvidingBlock:(id)a5 error:(id *)a6
{
  id v9;
  void *v10;
  BOOL v11;
  BOOL v12;
  void *v13;
  id v14;
  id v15;
  id v16;
  void *v17;

  v9 = a5;
  v10 = v9;
  if (a3)
    v11 = a4 == 0;
  else
    v11 = 1;
  v12 = !v11;
  if (v11 && a6)
  {
    if (v9)
    {
      (*((void (**)(id))v9 + 2))(v9);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v13 = 0;
    }
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("zero-dimensioned image (%ld x %ld)"), a3, a4);
    v14 = (id)objc_claimAutoreleasedReturnValue();
    v15 = v13;
    if (objc_msgSend(v15, "length"))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@ was given %@"), v15, v14);
      v16 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v16 = v14;
    }
    v17 = v16;

    +[VNError errorWithCode:message:](VNError, "errorWithCode:message:", 13, v17);
    *a6 = (id)objc_claimAutoreleasedReturnValue();

  }
  return v12;
}

+ (BOOL)getOptionalObject:(id *)a3 ofClass:(Class)a4 forKey:(id)a5 inOptions:(id)a6 error:(id *)a7
{
  return _getObjectFromOptionsDictionary(a3, a6, a5, 0, a4, (uint64_t)a7);
}

+ (id)originatingRequestSpecifierInOptions:(id)a3 specifyingRequestClass:(Class)a4 error:(id *)a5
{
  objc_msgSend(a1, "originatingRequestSpecifierForKey:inOptions:specifyingRequestClass:error:", CFSTR("VNDetectorOption_OriginatingRequestSpecifier"), a3, a4, a5);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)originatingRequestSpecifierForKey:(id)a3 inOptions:(id)a4 specifyingRequestClass:(Class)a5 error:(id *)a6
{
  id v10;
  void *v11;
  void *v12;
  id v13;

  v10 = a3;
  objc_msgSend(a1, "originatingRequestSpecifierForKey:inOptions:error:", v10, a4, a6);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v11;
  if (v11 && (_validateRequestSpecifierRequestClass(v11, a5, v10, (uint64_t)a6) & 1) != 0)
    v13 = v12;
  else
    v13 = 0;

  return v13;
}

+ (id)originatingRequestSpecifierForKey:(id)a3 inOptions:(id)a4 error:(id *)a5
{
  id v7;
  id v8;
  objc_class *v9;
  id v10;
  void *v11;
  id v12;
  id v14;

  v7 = a3;
  v8 = a4;
  v14 = 0;
  v9 = (objc_class *)objc_opt_class();
  LODWORD(a5) = _getObjectFromOptionsDictionary(&v14, v8, v7, 1, v9, (uint64_t)a5);
  v10 = v14;
  v11 = v10;
  if (!(_DWORD)a5)
    v10 = 0;
  v12 = v10;

  return v12;
}

+ (BOOL)validateVNConfidenceRange:(float)a3 error:(id *)a4
{
  BOOL v4;
  void *v6;

  v4 = a3 <= 1.0 && a3 >= 0.0;
  if (!v4 && a4)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("The confidence value %f must be in the range [0..1]"), a3);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    +[VNError errorForOutOfBoundsErrorWithLocalizedDescription:](VNError, "errorForOutOfBoundsErrorWithLocalizedDescription:", v6);
    *a4 = (id)objc_claimAutoreleasedReturnValue();

  }
  return v4;
}

+ (BOOL)validateNonNilOptionsDictionary:(id)a3 selector:(SEL)a4 error:(id *)a5
{
  id v7;
  void *v8;
  void *v9;
  void *v10;

  v7 = a3;
  if (!v7 && a5)
  {
    v8 = (void *)MEMORY[0x1E0CB3940];
    NSStringFromSelector(a4);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "stringWithFormat:", CFSTR("%@ cannot be called with nil options"), v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    +[VNError errorForInvalidOperationWithLocalizedDescription:](VNError, "errorForInvalidOperationWithLocalizedDescription:", v10);
    *a5 = (id)objc_claimAutoreleasedReturnValue();

  }
  return v7 != 0;
}

+ (BOOL)getFloatValue:(float *)a3 forKey:(id)a4 inOptions:(id)a5 error:(id *)a6
{
  id v9;
  id v10;
  objc_class *v11;
  char ObjectFromOptionsDictionary;
  id v13;
  void *v14;
  char v15;
  int v16;
  id v18;

  v9 = a4;
  v10 = a5;
  v18 = 0;
  v11 = (objc_class *)objc_opt_class();
  ObjectFromOptionsDictionary = _getObjectFromOptionsDictionary(&v18, v10, v9, 1, v11, (uint64_t)a6);
  v13 = v18;
  v14 = v13;
  if (a3)
    v15 = ObjectFromOptionsDictionary;
  else
    v15 = 0;
  if ((v15 & 1) != 0)
  {
    objc_msgSend(v13, "floatValue");
    *(_DWORD *)a3 = v16;
  }

  return ObjectFromOptionsDictionary;
}

+ (BOOL)validateArray:(id)a3 named:(id)a4 hasElementsOfClass:(Class)a5 requiredMinimumCount:(unint64_t)a6 allowedMaximumCount:(unint64_t)a7 error:(id *)a8
{
  id v13;
  __CFString *v14;
  __CFString *v15;
  unint64_t v16;
  void *v17;
  id v18;
  id v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t i;
  void *v24;
  void *v25;
  void *v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v13 = a3;
  v14 = (__CFString *)a4;
  if (v14)
    v15 = v14;
  else
    v15 = CFSTR("array");
  if (!v13)
  {
    if (!a8)
      goto LABEL_16;
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@ is nil"), v15);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    +[VNError errorWithCode:message:](VNError, "errorWithCode:message:", 14, v17);
    v18 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_14;
  }
  v16 = objc_msgSend(v13, "count");
  if (v16 < a6)
  {
    if (!a8)
      goto LABEL_16;
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("The %@ array has %lu items, which is less than the required count of %lu"), v15, v16, a6);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    +[VNError errorWithCode:message:](VNError, "errorWithCode:message:", 5, v17);
    v18 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_14;
  }
  if (a7 && v16 > a7)
  {
    if (!a8)
      goto LABEL_16;
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("The %@ array has %lu items, which is more than the maximum allowed of %lu"), v15, v16, a7);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    +[VNError errorWithCode:message:](VNError, "errorWithCode:message:", 5, v17);
    v18 = (id)objc_claimAutoreleasedReturnValue();
LABEL_14:
    *a8 = v18;

LABEL_15:
    LOBYTE(a8) = 0;
    goto LABEL_16;
  }
  if (a5)
  {
    v29 = 0u;
    v30 = 0u;
    v27 = 0u;
    v28 = 0u;
    v20 = v13;
    v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
    if (v21)
    {
      v22 = *(_QWORD *)v28;
      while (2)
      {
        for (i = 0; i != v21; ++i)
        {
          if (*(_QWORD *)v28 != v22)
            objc_enumerationMutation(v20);
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {
            if (a8)
            {
              v24 = (void *)MEMORY[0x1E0CB3940];
              NSStringFromClass(a5);
              v25 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v24, "stringWithFormat:", CFSTR("All elements in the %@ array must be of class %@ (%@)"), v15, v25, v20);
              v26 = (void *)objc_claimAutoreleasedReturnValue();

              +[VNError errorWithCode:message:](VNError, "errorWithCode:message:", 5, v26);
              *a8 = (id)objc_claimAutoreleasedReturnValue();

            }
            goto LABEL_15;
          }
        }
        v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
        if (v21)
          continue;
        break;
      }
    }

  }
  LOBYTE(a8) = 1;
LABEL_16:

  return (char)a8;
}

+ (BOOL)validateOptionalFaceObservations:(id)a3 forRequest:(id)a4 error:(id *)a5
{
  return objc_msgSend(a1, "_validateFaceObservations:withMinimumCount:forOptionalRequest:error:", a3, 0, a4, a5);
}

+ (BOOL)_validateFaceObservations:(id)a3 withMinimumCount:(unint64_t)a4 forOptionalRequest:(id)a5 error:(id *)a6
{
  id v10;
  id v11;
  void *v12;
  objc_class *v13;
  void *v14;
  __CFString *v15;
  char v16;

  v10 = a3;
  v11 = a5;
  if (v11)
  {
    v12 = (void *)MEMORY[0x1E0CB3940];
    v13 = (objc_class *)objc_opt_class();
    NSStringFromClass(v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "stringWithFormat:", CFSTR("%@ %@"), v14, CFSTR("face observations"));
    v15 = (__CFString *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v15 = CFSTR("face observations");
  }
  v16 = objc_msgSend(a1, "validateArray:named:hasElementsOfClass:requiredMinimumCount:allowedMaximumCount:error:", v10, v15, objc_opt_class(), a4, 0, a6);

  return v16;
}

+ (BOOL)getArray:(id *)a3 forKey:(id)a4 inOptions:(id)a5 withElementsOfClass:(Class)a6 requiredMinimumCount:(unint64_t)a7 allowedMaximumCount:(unint64_t)a8 error:(id *)a9
{
  id v15;
  id v16;
  objc_class *v17;
  char ObjectFromOptionsDictionary;
  id v19;
  void *v20;
  void *v21;
  char v22;
  BOOL v23;
  id v25;

  v15 = a4;
  v16 = a5;
  v25 = 0;
  v17 = (objc_class *)objc_opt_class();
  ObjectFromOptionsDictionary = _getObjectFromOptionsDictionary(&v25, v16, v15, a7 != 0, v17, (uint64_t)a9);
  v19 = v25;
  v20 = v19;
  if ((ObjectFromOptionsDictionary & 1) == 0)
    goto LABEL_8;
  if (!v19)
    v20 = (void *)MEMORY[0x1E0C9AA60];
  objc_msgSend(v15, "description");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = objc_msgSend(a1, "validateArray:named:hasElementsOfClass:requiredMinimumCount:allowedMaximumCount:error:", v20, v21, a6, a7, a8, a9);

  if ((v22 & 1) != 0)
  {
    if (a3)
      *a3 = (id)objc_msgSend(v20, "copy");
    v23 = 1;
  }
  else
  {
LABEL_8:
    v23 = 0;
  }

  return v23;
}

+ (BOOL)getNSUIntegerValue:(unint64_t *)a3 forKey:(id)a4 inOptions:(id)a5 error:(id *)a6
{
  id v9;
  id v10;
  objc_class *v11;
  char ObjectFromOptionsDictionary;
  id v13;
  void *v14;
  char v15;
  id v17;

  v9 = a4;
  v10 = a5;
  v17 = 0;
  v11 = (objc_class *)objc_opt_class();
  ObjectFromOptionsDictionary = _getObjectFromOptionsDictionary(&v17, v10, v9, 1, v11, (uint64_t)a6);
  v13 = v17;
  v14 = v13;
  if (a3)
    v15 = ObjectFromOptionsDictionary;
  else
    v15 = 0;
  if ((v15 & 1) != 0)
    *a3 = objc_msgSend(v13, "unsignedIntegerValue");

  return ObjectFromOptionsDictionary;
}

+ (id)requiredObjectConformingToProtocol:(id)a3 forKey:(id)a4 inOptions:(id)a5 error:(id *)a6
{
  id v9;
  id v10;
  id v11;
  id v12;
  Protocol *v13;
  void *v14;
  void *v15;
  int v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id *v21;
  id *v22;
  id *v23;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v12 = v10;
  v13 = (Protocol *)v9;
  objc_msgSend(v11, "objectForKey:", v12);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = v14;
  if (v14)
  {
    if ((objc_msgSend(v14, "conformsToProtocol:", v13) & 1) != 0)
    {
      a6 = objc_retainAutorelease(v15);
      v16 = 1;
      goto LABEL_10;
    }
    if (a6)
    {
      v19 = (void *)MEMORY[0x1E0CB3940];
      NSStringFromProtocol(v13);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "stringWithFormat:", CFSTR("The %@ option was expected to conform to %@ (%@)"), v12, v20, v15);
      v17 = (void *)objc_claimAutoreleasedReturnValue();

      +[VNError errorWithCode:message:](VNError, "errorWithCode:message:", 5, v17);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_8;
    }
  }
  else if (a6)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("The %@ required option was not found"), v12);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    +[VNError errorWithCode:message:](VNError, "errorWithCode:message:", 7, v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_8:
    *a6 = v18;

    a6 = 0;
  }
  v16 = 0;
LABEL_10:

  v21 = a6;
  v22 = v21;
  if (v16)
    v23 = v21;
  else
    v23 = 0;

  return v23;
}

+ (id)computeDeviceForKey:(id)a3 inOptions:(id)a4 error:(id *)a5
{
  objc_msgSend(a1, "requiredObjectConformingToProtocol:forKey:inOptions:error:", &unk_1EE66D668, a3, a4, a5);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (BOOL)validateClassArray:(id)a3 named:(id)a4 hasElementsAncestoredFromClass:(Class)a5 requiredMinimumCount:(unint64_t)a6 allowedMaximumCount:(unint64_t)a7 error:(id *)a8
{
  id v13;
  __CFString *v14;
  BOOL v15;
  unint64_t v16;
  void *v17;
  id v18;
  id v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t i;
  void *v24;
  void *v25;
  void *v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v13 = a3;
  v14 = (__CFString *)a4;
  if (a5)
  {
    if ((-[objc_class isSubclassOfClass:](a5, "isSubclassOfClass:", objc_opt_class()) & 1) == 0)
    {
      if (a8)
      {
        +[VNError errorForInvalidArgument:named:](VNError, "errorForInvalidArgument:named:", a5, CFSTR("expectedAncestoralClass"));
        v15 = 0;
        *a8 = (id)objc_claimAutoreleasedReturnValue();
        goto LABEL_20;
      }
LABEL_19:
      v15 = 0;
      goto LABEL_20;
    }
  }
  else
  {
    a5 = (Class)objc_opt_class();
  }
  if (!v14)
    v14 = CFSTR("array");
  if (!v13)
  {
    if (!a8)
      goto LABEL_19;
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@ is nil"), v14);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    +[VNError errorWithCode:message:](VNError, "errorWithCode:message:", 14, v17);
    v18 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_18;
  }
  v16 = objc_msgSend(v13, "count");
  if (v16 < a6)
  {
    if (!a8)
      goto LABEL_19;
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("The %@ array has %lu items, which is less than the required count of %lu"), v14, v16, a6);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    +[VNError errorWithCode:message:](VNError, "errorWithCode:message:", 5, v17);
    v18 = (id)objc_claimAutoreleasedReturnValue();
LABEL_18:
    *a8 = v18;

    goto LABEL_19;
  }
  if (a7 && v16 > a7)
  {
    if (!a8)
      goto LABEL_19;
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("The %@ array has %lu items, which is more than the maximum allowed of %lu"), v14, v16, a7);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    +[VNError errorWithCode:message:](VNError, "errorWithCode:message:", 5, v17);
    v18 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_18;
  }
  v29 = 0u;
  v30 = 0u;
  v27 = 0u;
  v28 = 0u;
  v20 = v13;
  v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
  if (!v21)
  {
    v15 = 1;
    goto LABEL_38;
  }
  v22 = *(_QWORD *)v28;
  while (2)
  {
    for (i = 0; i != v21; ++i)
    {
      if (*(_QWORD *)v28 != v22)
        objc_enumerationMutation(v20);
      v24 = *(void **)(*((_QWORD *)&v27 + 1) + 8 * i);
      if (!object_isClass(v24))
      {
        if (a8)
        {
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("All elements in the %@ array must be a Class object (%@)"), v14, v20);
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          +[VNError errorWithCode:message:](VNError, "errorWithCode:message:", 5, v25);
          v26 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_36:
          *a8 = v26;

        }
LABEL_37:
        v15 = 0;
        goto LABEL_38;
      }
      if ((objc_msgSend(v24, "isSubclassOfClass:", a5) & 1) == 0)
      {
        if (a8)
        {
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("All elements in the %@ array must be a VNRequest subclass (%@)"), v14, v20);
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          +[VNError errorWithCode:message:](VNError, "errorWithCode:message:", 5, v25);
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          goto LABEL_36;
        }
        goto LABEL_37;
      }
    }
    v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
    v15 = 1;
    if (v21)
      continue;
    break;
  }
LABEL_38:

LABEL_20:
  return v15;
}

+ (BOOL)_validateDetectedObjectObservations:(id)a3 forObservationClass:(Class)a4 withMinimumCount:(unint64_t)a5 forOptionalRequest:(id)a6 error:(id *)a7
{
  id v12;
  id v13;
  void *v14;
  objc_class *v15;
  void *v16;
  __CFString *v17;
  char v18;

  v12 = a3;
  v13 = a6;
  if (v13)
  {
    v14 = (void *)MEMORY[0x1E0CB3940];
    v15 = (objc_class *)objc_opt_class();
    NSStringFromClass(v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "stringWithFormat:", CFSTR("%@ %@"), v16, CFSTR("detected object observations"));
    v17 = (__CFString *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v17 = CFSTR("detected object observations");
  }
  v18 = objc_msgSend(a1, "validateArray:named:hasElementsOfClass:requiredMinimumCount:allowedMaximumCount:error:", v12, v17, a4, a5, 0, a7);

  return v18;
}

+ (BOOL)validateRequiredFaceObservations:(id)a3 error:(id *)a4
{
  return objc_msgSend(a1, "_validateFaceObservations:withMinimumCount:forOptionalRequest:error:", a3, 1, 0, a4);
}

+ (BOOL)validateRequiredFaceObservations:(id)a3 forRequest:(id)a4 error:(id *)a5
{
  return objc_msgSend(a1, "_validateFaceObservations:withMinimumCount:forOptionalRequest:error:", a3, 1, a4, a5);
}

+ (BOOL)validateOptionalFaceObservations:(id)a3 error:(id *)a4
{
  return objc_msgSend(a1, "_validateFaceObservations:withMinimumCount:forOptionalRequest:error:", a3, 0, 0, a4);
}

+ (BOOL)validateRequiredDetectedObjectObservations:(id)a3 forObservationClass:(Class)a4 error:(id *)a5
{
  return objc_msgSend(a1, "_validateDetectedObjectObservations:forObservationClass:withMinimumCount:forOptionalRequest:error:", a3, a4, 1, 0, a5);
}

+ (BOOL)validateRequiredDetectedObjectObservations:(id)a3 forObservationClass:(Class)a4 forRequest:(id)a5 error:(id *)a6
{
  return objc_msgSend(a1, "_validateDetectedObjectObservations:forObservationClass:withMinimumCount:forOptionalRequest:error:", a3, a4, 1, a5, a6);
}

+ (BOOL)validateOptionalDetectedObjectObservations:(id)a3 forObservationClass:(Class)a4 error:(id *)a5
{
  return objc_msgSend(a1, "_validateDetectedObjectObservations:forObservationClass:withMinimumCount:forOptionalRequest:error:", a3, a4, 0, 0, a5);
}

+ (BOOL)validateOptionalDetectedObjectObservations:(id)a3 forObservationClass:(Class)a4 forRequest:(id)a5 error:(id *)a6
{
  return objc_msgSend(a1, "_validateDetectedObjectObservations:forObservationClass:withMinimumCount:forOptionalRequest:error:", a3, a4, 0, a5, a6);
}

+ (BOOL)validateRequiredClusterIDs:(id)a3 error:(id *)a4
{
  id v6;

  v6 = a3;
  LOBYTE(a4) = objc_msgSend(a1, "validateArray:named:hasElementsOfClass:requiredMinimumCount:allowedMaximumCount:error:", v6, CFSTR("cluster IDs"), objc_opt_class(), 1, 0, a4);

  return (char)a4;
}

+ (BOOL)validateScoreRange:(float)a3 named:(id)a4 error:(id *)a5
{
  __CFString *v7;
  __CFString *v8;
  BOOL v9;
  uint64_t v10;
  __CFString *v11;
  __CFString *v12;
  void *v13;

  v7 = (__CFString *)a4;
  v8 = v7;
  v9 = a3 <= 1.0 && a3 >= -1.0;
  if (!v9 && a5)
  {
    v10 = -[__CFString length](v7, "length");
    v11 = CFSTR("score");
    if (v10)
      v11 = v8;
    v12 = v11;
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("The %@ value %f must be in the range [-1..1]"), v12, a3);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    +[VNError errorForOutOfBoundsErrorWithLocalizedDescription:](VNError, "errorForOutOfBoundsErrorWithLocalizedDescription:", v13);
    *a5 = (id)objc_claimAutoreleasedReturnValue();

  }
  return v9;
}

+ (id)requiredObjectOfClass:(Class)a3 forKey:(id)a4 inOptions:(id)a5 error:(id *)a6
{
  int ObjectFromOptionsDictionary;
  id v7;
  void *v8;
  id v9;
  id v11;

  v11 = 0;
  ObjectFromOptionsDictionary = _getObjectFromOptionsDictionary(&v11, a5, a4, 1, a3, (uint64_t)a6);
  v7 = v11;
  v8 = v7;
  if (!ObjectFromOptionsDictionary)
    v7 = 0;
  v9 = v7;

  return v9;
}

+ (BOOL)getBOOLValue:(BOOL *)a3 forKey:(id)a4 inOptions:(id)a5 error:(id *)a6
{
  id v9;
  id v10;
  objc_class *v11;
  char ObjectFromOptionsDictionary;
  id v13;
  void *v14;
  char v15;
  id v17;

  v9 = a4;
  v10 = a5;
  v17 = 0;
  v11 = (objc_class *)objc_opt_class();
  ObjectFromOptionsDictionary = _getObjectFromOptionsDictionary(&v17, v10, v9, 1, v11, (uint64_t)a6);
  v13 = v17;
  v14 = v13;
  if (a3)
    v15 = ObjectFromOptionsDictionary;
  else
    v15 = 0;
  if ((v15 & 1) != 0)
    *a3 = objc_msgSend(v13, "BOOLValue");

  return ObjectFromOptionsDictionary;
}

+ (BOOL)getNSIntegerValue:(int64_t *)a3 forKey:(id)a4 inOptions:(id)a5 error:(id *)a6
{
  id v9;
  id v10;
  objc_class *v11;
  char ObjectFromOptionsDictionary;
  id v13;
  void *v14;
  char v15;
  id v17;

  v9 = a4;
  v10 = a5;
  v17 = 0;
  v11 = (objc_class *)objc_opt_class();
  ObjectFromOptionsDictionary = _getObjectFromOptionsDictionary(&v17, v10, v9, 1, v11, (uint64_t)a6);
  v13 = v17;
  v14 = v13;
  if (a3)
    v15 = ObjectFromOptionsDictionary;
  else
    v15 = 0;
  if ((v15 & 1) != 0)
    *a3 = objc_msgSend(v13, "integerValue");

  return ObjectFromOptionsDictionary;
}

+ (BOOL)getNSIntegerValue:(int64_t *)a3 forKey:(id)a4 inOptions:(id)a5 withDefaultValue:(int64_t)a6 error:(id *)a7
{
  id v11;
  id v12;
  objc_class *v13;
  char ObjectFromOptionsDictionary;
  id v15;
  void *v16;
  char v17;
  id v19;

  v11 = a4;
  v12 = a5;
  v19 = 0;
  v13 = (objc_class *)objc_opt_class();
  ObjectFromOptionsDictionary = _getObjectFromOptionsDictionary(&v19, v12, v11, 0, v13, (uint64_t)a7);
  v15 = v19;
  v16 = v15;
  if (a3)
    v17 = ObjectFromOptionsDictionary;
  else
    v17 = 0;
  if ((v17 & 1) != 0)
  {
    if (v15)
      a6 = objc_msgSend(v15, "integerValue");
    *a3 = a6;
  }

  return ObjectFromOptionsDictionary;
}

+ (BOOL)getNSUIntegerValue:(unint64_t *)a3 forKey:(id)a4 inOptions:(id)a5 withDefaultValue:(unint64_t)a6 error:(id *)a7
{
  id v11;
  id v12;
  objc_class *v13;
  char ObjectFromOptionsDictionary;
  id v15;
  void *v16;
  char v17;
  id v19;

  v11 = a4;
  v12 = a5;
  v19 = 0;
  v13 = (objc_class *)objc_opt_class();
  ObjectFromOptionsDictionary = _getObjectFromOptionsDictionary(&v19, v12, v11, 0, v13, (uint64_t)a7);
  v15 = v19;
  v16 = v15;
  if (a3)
    v17 = ObjectFromOptionsDictionary;
  else
    v17 = 0;
  if ((v17 & 1) != 0)
  {
    if (v15)
      a6 = objc_msgSend(v15, "unsignedIntegerValue");
    *a3 = a6;
  }

  return ObjectFromOptionsDictionary;
}

+ (BOOL)getIntValue:(int *)a3 forKey:(id)a4 inOptions:(id)a5 error:(id *)a6
{
  id v9;
  id v10;
  objc_class *v11;
  char ObjectFromOptionsDictionary;
  id v13;
  void *v14;
  char v15;
  id v17;

  v9 = a4;
  v10 = a5;
  v17 = 0;
  v11 = (objc_class *)objc_opt_class();
  ObjectFromOptionsDictionary = _getObjectFromOptionsDictionary(&v17, v10, v9, 1, v11, (uint64_t)a6);
  v13 = v17;
  v14 = v13;
  if (a3)
    v15 = ObjectFromOptionsDictionary;
  else
    v15 = 0;
  if ((v15 & 1) != 0)
    *a3 = objc_msgSend(v13, "intValue");

  return ObjectFromOptionsDictionary;
}

+ (BOOL)getIntValue:(int *)a3 forKey:(id)a4 inOptions:(id)a5 minimumValue:(int)a6 maximumValue:(int)a7 error:(id *)a8
{
  uint64_t v9;
  uint64_t v10;
  id v14;
  void *v16;
  int v18;

  v9 = *(_QWORD *)&a7;
  v10 = *(_QWORD *)&a6;
  v14 = a4;
  v18 = 0;
  if ((objc_msgSend(a1, "getIntValue:forKey:inOptions:error:", &v18, v14, a5, a8) & 1) == 0)
    goto LABEL_8;
  if (v18 >= (int)v10 && v18 <= (int)v9)
  {
    if (a3)
      *a3 = v18;
    LOBYTE(a8) = 1;
  }
  else if (a8)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@ is %d which is not in the range [%d..%d]"), v14, v18, v10, v9);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    +[VNError errorForOutOfBoundsErrorWithLocalizedDescription:](VNError, "errorForOutOfBoundsErrorWithLocalizedDescription:", v16);
    *a8 = (id)objc_claimAutoreleasedReturnValue();

LABEL_8:
    LOBYTE(a8) = 0;
  }

  return (char)a8;
}

+ (BOOL)getIntValue:(int *)a3 forKey:(id)a4 inOptions:(id)a5 withDefaultValue:(int)a6 error:(id *)a7
{
  id v11;
  id v12;
  objc_class *v13;
  char ObjectFromOptionsDictionary;
  id v15;
  void *v16;
  char v17;
  id v19;

  v11 = a4;
  v12 = a5;
  v19 = 0;
  v13 = (objc_class *)objc_opt_class();
  ObjectFromOptionsDictionary = _getObjectFromOptionsDictionary(&v19, v12, v11, 0, v13, (uint64_t)a7);
  v15 = v19;
  v16 = v15;
  if (a3)
    v17 = ObjectFromOptionsDictionary;
  else
    v17 = 0;
  if ((v17 & 1) != 0)
  {
    if (v15)
      a6 = objc_msgSend(v15, "intValue");
    *a3 = a6;
  }

  return ObjectFromOptionsDictionary;
}

+ (BOOL)getDoubleValue:(double *)a3 forKey:(id)a4 inOptions:(id)a5 error:(id *)a6
{
  id v9;
  id v10;
  objc_class *v11;
  char ObjectFromOptionsDictionary;
  id v13;
  void *v14;
  char v15;
  uint64_t v16;
  id v18;

  v9 = a4;
  v10 = a5;
  v18 = 0;
  v11 = (objc_class *)objc_opt_class();
  ObjectFromOptionsDictionary = _getObjectFromOptionsDictionary(&v18, v10, v9, 1, v11, (uint64_t)a6);
  v13 = v18;
  v14 = v13;
  if (a3)
    v15 = ObjectFromOptionsDictionary;
  else
    v15 = 0;
  if ((v15 & 1) != 0)
  {
    objc_msgSend(v13, "doubleValue");
    *(_QWORD *)a3 = v16;
  }

  return ObjectFromOptionsDictionary;
}

+ (BOOL)getDoubleValue:(double *)a3 forKey:(id)a4 inOptions:(id)a5 withDefaultValue:(double)a6 error:(id *)a7
{
  id v11;
  id v12;
  objc_class *v13;
  char ObjectFromOptionsDictionary;
  id v15;
  void *v16;
  char v17;
  double v18;
  id v20;

  v11 = a4;
  v12 = a5;
  v20 = 0;
  v13 = (objc_class *)objc_opt_class();
  ObjectFromOptionsDictionary = _getObjectFromOptionsDictionary(&v20, v12, v11, 0, v13, (uint64_t)a7);
  v15 = v20;
  v16 = v15;
  if (a3)
    v17 = ObjectFromOptionsDictionary;
  else
    v17 = 0;
  if ((v17 & 1) != 0)
  {
    if (v15)
    {
      objc_msgSend(v15, "doubleValue");
      a6 = v18;
    }
    *a3 = a6;
  }

  return ObjectFromOptionsDictionary;
}

+ (BOOL)getFloatValue:(float *)a3 forKey:(id)a4 inOptions:(id)a5 minimumValue:(float)a6 maximumValue:(float)a7 error:(id *)a8
{
  id v14;
  void *v16;
  float v18;

  v14 = a4;
  v18 = 0.0;
  if ((objc_msgSend(a1, "getFloatValue:forKey:inOptions:error:", &v18, v14, a5, a8) & 1) == 0)
    goto LABEL_8;
  if (v18 >= a6 && v18 <= a7)
  {
    if (a3)
      *a3 = v18;
    LOBYTE(a8) = 1;
  }
  else if (a8)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@ is %f which is not in the range [%f..%f]"), v14, v18, a6, a7);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    +[VNError errorForOutOfBoundsErrorWithLocalizedDescription:](VNError, "errorForOutOfBoundsErrorWithLocalizedDescription:", v16);
    *a8 = (id)objc_claimAutoreleasedReturnValue();

LABEL_8:
    LOBYTE(a8) = 0;
  }

  return (char)a8;
}

+ (BOOL)getFloatValue:(float *)a3 forKey:(id)a4 inOptions:(id)a5 withDefaultValue:(float)a6 error:(id *)a7
{
  id v11;
  id v12;
  objc_class *v13;
  char ObjectFromOptionsDictionary;
  id v15;
  void *v16;
  char v17;
  float v18;
  id v20;

  v11 = a4;
  v12 = a5;
  v20 = 0;
  v13 = (objc_class *)objc_opt_class();
  ObjectFromOptionsDictionary = _getObjectFromOptionsDictionary(&v20, v12, v11, 0, v13, (uint64_t)a7);
  v15 = v20;
  v16 = v15;
  if (a3)
    v17 = ObjectFromOptionsDictionary;
  else
    v17 = 0;
  if ((v17 & 1) != 0)
  {
    if (v15)
    {
      objc_msgSend(v15, "floatValue");
      a6 = v18;
    }
    *a3 = a6;
  }

  return ObjectFromOptionsDictionary;
}

+ (BOOL)getPercentageValue:(double *)a3 forKey:(id)a4 inOptions:(id)a5 withDefaultValue:(double)a6 error:(id *)a7
{
  id v11;
  id v12;
  objc_class *v13;
  char ObjectFromOptionsDictionary;
  id v15;
  void *v16;
  double v17;
  void *v18;
  BOOL v19;
  BOOL v20;
  id v22;

  v11 = a4;
  v12 = a5;
  if (_validatePercentageValue(CFSTR("default value"), a7, a6))
  {
    v22 = 0;
    v13 = (objc_class *)objc_opt_class();
    ObjectFromOptionsDictionary = _getObjectFromOptionsDictionary(&v22, v12, v11, 0, v13, (uint64_t)a7);
    v15 = v22;
    v16 = v15;
    if ((ObjectFromOptionsDictionary & 1) != 0
      && (!v15
       || (objc_msgSend(v15, "doubleValue"),
           a6 = v17,
           objc_msgSend(v11, "description"),
           v18 = (void *)objc_claimAutoreleasedReturnValue(),
           v19 = _validatePercentageValue(v18, a7, a6),
           v18,
           v19)))
    {
      if (a3)
        *a3 = a6;
      v20 = 1;
    }
    else
    {
      v20 = 0;
    }

  }
  else
  {
    v20 = 0;
  }

  return v20;
}

+ (BOOL)getOSTypeValue:(unsigned int *)a3 forKey:(id)a4 inOptions:(id)a5 error:(id *)a6
{
  id v9;
  id v10;
  objc_class *v11;
  char ObjectFromOptionsDictionary;
  id v13;
  void *v14;
  char v15;
  id v17;

  v9 = a4;
  v10 = a5;
  v17 = 0;
  v11 = (objc_class *)objc_opt_class();
  ObjectFromOptionsDictionary = _getObjectFromOptionsDictionary(&v17, v10, v9, 1, v11, (uint64_t)a6);
  v13 = v17;
  v14 = v13;
  if (a3)
    v15 = ObjectFromOptionsDictionary;
  else
    v15 = 0;
  if ((v15 & 1) != 0)
    *a3 = objc_msgSend(v13, "unsignedIntValue");

  return ObjectFromOptionsDictionary;
}

+ (BOOL)getOSTypeValue:(unsigned int *)a3 forKey:(id)a4 inOptions:(id)a5 withDefaultValue:(unsigned int)a6 error:(id *)a7
{
  id v11;
  id v12;
  objc_class *v13;
  char ObjectFromOptionsDictionary;
  id v15;
  void *v16;
  char v17;
  id v19;

  v11 = a4;
  v12 = a5;
  v19 = 0;
  v13 = (objc_class *)objc_opt_class();
  ObjectFromOptionsDictionary = _getObjectFromOptionsDictionary(&v19, v12, v11, 0, v13, (uint64_t)a7);
  v15 = v19;
  v16 = v15;
  if (a3)
    v17 = ObjectFromOptionsDictionary;
  else
    v17 = 0;
  if ((v17 & 1) != 0)
  {
    if (v15)
      a6 = objc_msgSend(v15, "unsignedIntValue");
    *a3 = a6;
  }

  return ObjectFromOptionsDictionary;
}

+ (BOOL)getMTLGPUPriority:(unint64_t *)a3 forKey:(id)a4 inOptions:(id)a5 withDefaultValue:(unint64_t)a6 error:(id *)a7
{
  id v11;
  id v12;
  objc_class *v13;
  char ObjectFromOptionsDictionary;
  id v15;
  void *v16;
  id v18;

  v11 = a4;
  v12 = a5;
  v18 = 0;
  v13 = (objc_class *)objc_opt_class();
  ObjectFromOptionsDictionary = _getObjectFromOptionsDictionary(&v18, v12, v11, 0, v13, (uint64_t)a7);
  v15 = v18;
  v16 = v15;
  if ((ObjectFromOptionsDictionary & 1) != 0)
  {
    if (v15)
      a6 = objc_msgSend(v15, "unsignedIntegerValue");
    if (a3)
      *a3 = a6;
  }

  return ObjectFromOptionsDictionary;
}

+ (BOOL)getEspressoPriority:(int *)a3 forKey:(id)a4 inOptions:(id)a5 withDefaultValue:(int)a6 error:(id *)a7
{
  id v11;
  id v12;
  objc_class *v13;
  char ObjectFromOptionsDictionary;
  id v15;
  void *v16;
  id v18;

  v11 = a4;
  v12 = a5;
  v18 = 0;
  v13 = (objc_class *)objc_opt_class();
  ObjectFromOptionsDictionary = _getObjectFromOptionsDictionary(&v18, v12, v11, 0, v13, (uint64_t)a7);
  v15 = v18;
  v16 = v15;
  if ((ObjectFromOptionsDictionary & 1) != 0)
  {
    if (v15)
      a6 = objc_msgSend((id)objc_opt_class(), "espressoPriorityForModelExecutionPriority:", objc_msgSend(v15, "unsignedIntegerValue"));
    if (a3)
      *a3 = a6;
  }

  return ObjectFromOptionsDictionary;
}

+ (int)espressoPriorityForModelExecutionPriority:(unint64_t)a3
{
  if (a3 - 1 > 4)
    return 0;
  else
    return dword_1A15E77A0[a3 - 1];
}

+ (BOOL)getOptionalArray:(id *)a3 forKey:(id)a4 inOptions:(id)a5 withElementsOfClass:(Class)a6 error:(id *)a7
{
  return objc_msgSend(a1, "getArray:forKey:inOptions:withElementsOfClass:requiredMinimumCount:allowedMaximumCount:error:", a3, a4, a5, a6, 0, 0, a7);
}

+ (id)requiredArrayForKey:(id)a3 inOptions:(id)a4 withElementsOfClass:(Class)a5 error:(id *)a6
{
  int v6;
  id v7;
  void *v8;
  id v9;
  id v11;

  v11 = 0;
  v6 = objc_msgSend(a1, "getArray:forKey:inOptions:withElementsOfClass:requiredMinimumCount:allowedMaximumCount:error:", &v11, a3, a4, a5, 1, 0, a6);
  v7 = v11;
  v8 = v7;
  v9 = 0;
  if (v6)
    v9 = v7;

  return v9;
}

+ (id)requiredFaceObservationInOptions:(id)a3 error:(id *)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v11;

  v6 = a3;
  v11 = 0;
  LOBYTE(a4) = objc_msgSend(a1, "getArray:forKey:inOptions:withElementsOfClass:requiredMinimumCount:allowedMaximumCount:error:", &v11, CFSTR("VNDetectorProcessOption_InputFaceObservations"), v6, objc_opt_class(), 1, 1, a4);
  v7 = v11;
  v8 = v7;
  if ((a4 & 1) != 0)
  {
    objc_msgSend(v7, "firstObject");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

+ (id)requiredFaceObservationsInOptions:(id)a3 error:(id *)a4
{
  id v6;
  objc_class *v7;
  char ObjectFromOptionsDictionary;
  id v9;
  id v10;
  id v12;

  v6 = a3;
  v12 = 0;
  v7 = (objc_class *)objc_opt_class();
  ObjectFromOptionsDictionary = _getObjectFromOptionsDictionary(&v12, v6, CFSTR("VNDetectorProcessOption_InputFaceObservations"), 1, v7, (uint64_t)a4);
  v9 = v12;
  if ((ObjectFromOptionsDictionary & 1) != 0
    && objc_msgSend(a1, "validateArray:named:hasElementsOfClass:requiredMinimumCount:allowedMaximumCount:error:", v9, CFSTR("VNDetectorProcessOption_InputFaceObservations"), objc_opt_class(), 0, 0, a4))
  {
    v10 = v9;
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

+ (BOOL)getOptionalFaceObservation:(id *)a3 inOptions:(id)a4 error:(id *)a5
{
  id v8;
  objc_class *v9;
  char ObjectFromOptionsDictionary;
  id v11;
  void *v12;
  unint64_t v13;
  void *v14;
  BOOL v15;
  id v17;

  v8 = a4;
  v17 = 0;
  v9 = (objc_class *)objc_opt_class();
  ObjectFromOptionsDictionary = _getObjectFromOptionsDictionary(&v17, v8, CFSTR("VNDetectorProcessOption_InputFaceObservations"), 0, v9, (uint64_t)a5);
  v11 = v17;
  v12 = v11;
  if ((ObjectFromOptionsDictionary & 1) == 0)
    goto LABEL_7;
  if (!v11)
    goto LABEL_9;
  if (objc_msgSend(a1, "validateArray:named:hasElementsOfClass:requiredMinimumCount:allowedMaximumCount:error:", v11, CFSTR("VNDetectorProcessOption_InputFaceObservations"), objc_opt_class(), 0, 0, a5))
  {
    v13 = objc_msgSend(v12, "count");
    if (a5 && v13 >= 2)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("The options dictuionary contains (%lu) more than 1 VNFaceObservation(s) whiile only one is expected for key: %@"), objc_msgSend(v12, "count"), CFSTR("VNDetectorProcessOption_InputFaceObservations"));
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      +[VNError errorWithCode:message:](VNError, "errorWithCode:message:", 5, v14);
      *a5 = (id)objc_claimAutoreleasedReturnValue();

      goto LABEL_7;
    }
    +[VNError VNAssert:log:](VNError, "VNAssert:log:", a3 != 0, CFSTR("faceObservationOut must not be NULL"));
    objc_msgSend(v12, "firstObject");
    *a3 = (id)objc_claimAutoreleasedReturnValue();
LABEL_9:
    v15 = 1;
    goto LABEL_10;
  }
LABEL_7:
  v15 = 0;
LABEL_10:

  return v15;
}

+ (BOOL)getOptionalFaceObservations:(id *)a3 inOptions:(id)a4 error:(id *)a5
{
  id v8;
  objc_class *v9;
  char ObjectFromOptionsDictionary;
  id v11;
  void *v12;
  BOOL v13;
  id v15;

  v8 = a4;
  v15 = 0;
  v9 = (objc_class *)objc_opt_class();
  ObjectFromOptionsDictionary = _getObjectFromOptionsDictionary(&v15, v8, CFSTR("VNDetectorProcessOption_InputFaceObservations"), 0, v9, (uint64_t)a5);
  v11 = v15;
  v12 = v11;
  if ((ObjectFromOptionsDictionary & 1) != 0
    && (!v11
     || objc_msgSend(a1, "validateArray:named:hasElementsOfClass:requiredMinimumCount:allowedMaximumCount:error:", v11, CFSTR("VNDetectorProcessOption_InputFaceObservations"), objc_opt_class(), 0, 0, a5)))
  {
    *a3 = objc_retainAutorelease(v12);
    v13 = 1;
  }
  else
  {
    v13 = 0;
  }

  return v13;
}

+ (id)requiredDetectedObjectObservationInOptions:(id)a3 withOptionName:(id)a4 forObservationClass:(Class)a5 error:(id *)a6
{
  int v6;
  id v7;
  void *v8;
  void *v9;
  id v11;

  v11 = 0;
  v6 = objc_msgSend(a1, "getArray:forKey:inOptions:withElementsOfClass:requiredMinimumCount:allowedMaximumCount:error:", &v11, a4, a3, a5, 1, 1, a6);
  v7 = v11;
  v8 = v7;
  v9 = 0;
  if (v6)
  {
    objc_msgSend(v7, "firstObject");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v9;
}

+ (id)requiredSessionInOptions:(id)a3 error:(id *)a4
{
  id v5;
  objc_class *v6;
  id v7;
  void *v8;
  id v9;
  id v11;

  v5 = a3;
  v11 = 0;
  v6 = (objc_class *)objc_opt_class();
  LODWORD(a4) = _getObjectFromOptionsDictionary(&v11, v5, CFSTR("VNDetectorProcessOption_Session"), 1, v6, (uint64_t)a4);
  v7 = v11;
  v8 = v7;
  if (!(_DWORD)a4)
    v7 = 0;
  v9 = v7;

  return v9;
}

+ (BOOL)getOptionalOriginatingRequestSpecifier:(id *)a3 forKey:(id)a4 inOptions:(id)a5 specifyingRequestClass:(Class)a6 error:(id *)a7
{
  id v12;
  id v13;
  id v14;
  void *v15;
  BOOL v16;
  id v18;

  v12 = a4;
  v13 = a5;
  v18 = 0;
  LOBYTE(a1) = objc_msgSend(a1, "getOptionalObject:ofClass:forKey:inOptions:error:", &v18, objc_opt_class(), v12, v13, a7);
  v14 = v18;
  v15 = v14;
  if ((a1 & 1) != 0
    && (!v14 || _validateRequestSpecifierRequestClass(v14, a6, v12, (uint64_t)a7)))
  {
    *a3 = objc_retainAutorelease(v15);
    v16 = 1;
  }
  else
  {
    v16 = 0;
  }

  return v16;
}

@end
