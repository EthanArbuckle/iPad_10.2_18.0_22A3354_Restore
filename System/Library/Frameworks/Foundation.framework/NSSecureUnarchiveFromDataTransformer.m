@implementation NSSecureUnarchiveFromDataTransformer

- (id)reverseTransformedValue:(id)a3
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  NSString *v9;
  void *v10;
  const __CFString *v11;
  uint64_t v12;
  id result;
  BOOL v14;
  void *v15;
  uint64_t v16;
  id v17;
  const __CFString *v18;
  id v19;
  _BYTE v20[128];
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  if (!a3)
    return 0;
  v4 = (void *)objc_msgSend((id)objc_opt_class(), "allowedTopLevelClasses");
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v21, v20, 16);
  if (!v5)
    goto LABEL_10;
  v6 = v5;
  v7 = *(_QWORD *)v22;
LABEL_4:
  v8 = 0;
  while (1)
  {
    if (*(_QWORD *)v22 != v7)
      objc_enumerationMutation(v4);
    if ((objc_opt_isKindOfClass() & 1) != 0)
      break;
    if (v6 == ++v8)
    {
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v21, v20, 16);
      if (!v6)
      {
LABEL_10:
        v9 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Object of class %@ is not among allowed top level class list %@"), objc_opt_class(), v4);
        v10 = (void *)MEMORY[0x1E0C99DA0];
        v11 = (const __CFString *)*MEMORY[0x1E0C99778];
        v12 = 0;
        goto LABEL_16;
      }
      goto LABEL_4;
    }
  }
  v17 = 0;
  result = +[NSKeyedArchiver archivedDataWithRootObject:requiringSecureCoding:error:](NSKeyedArchiver, "archivedDataWithRootObject:requiringSecureCoding:error:", a3, 1, &v17);
  if (result)
    v14 = 1;
  else
    v14 = v17 == 0;
  if (!v14)
  {
    v15 = (void *)MEMORY[0x1E0C99DA0];
    v16 = objc_msgSend(v17, "localizedDescription");
    v18 = CFSTR("NSUnderlyingError");
    v19 = v17;
    v12 = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v19, &v18, 1);
    v10 = v15;
    v11 = CFSTR("NSInvalidArchiveOperationException");
    v9 = (NSString *)v16;
LABEL_16:
    objc_exception_throw((id)objc_msgSend(v10, "exceptionWithName:reason:userInfo:", v11, v9, v12));
  }
  return result;
}

- (id)transformedValue:(id)a3
{
  id v3;
  void *v4;
  BOOL v5;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  const __CFString *v11;
  const __CFString *v12;
  id v13;
  const __CFString *v14;
  _QWORD v15[2];

  v3 = a3;
  v15[1] = *MEMORY[0x1E0C80C00];
  if (a3)
  {
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v10 = (void *)MEMORY[0x1E0C99DA0];
      v11 = (const __CFString *)*MEMORY[0x1E0C99778];
      v12 = CFSTR("Cannot unarchive type from non-NSData object.");
      v9 = 0;
LABEL_10:
      objc_exception_throw((id)objc_msgSend(v10, "exceptionWithName:reason:userInfo:", v11, v12, v9));
    }
    v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithArray:", objc_msgSend((id)objc_opt_class(), "allowedTopLevelClasses"));
    v13 = 0;
    v3 = +[NSKeyedUnarchiver unarchivedObjectOfClasses:fromData:error:](NSKeyedUnarchiver, "unarchivedObjectOfClasses:fromData:error:", v4, v3, &v13);

    if (v3)
      v5 = 1;
    else
      v5 = v13 == 0;
    if (!v5)
    {
      v7 = (void *)MEMORY[0x1E0C99DA0];
      v8 = objc_msgSend(v13, "localizedDescription");
      v14 = CFSTR("NSUnderlyingError");
      v15[0] = v13;
      v9 = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v15, &v14, 1);
      v10 = v7;
      v11 = CFSTR("NSInvalidUnarchiveOperationException");
      v12 = (const __CFString *)v8;
      goto LABEL_10;
    }
  }
  return v3;
}

+ (NSArray)allowedTopLevelClasses
{
  uint64_t v2;
  _QWORD v4[2];

  v4[1] = *MEMORY[0x1E0C80C00];
  v2 = objc_msgSend((id)objc_opt_class(), "transformedValueClass");
  if (v2)
  {
    v4[0] = v2;
    return (NSArray *)objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v4, 1);
  }
  else
  {
    if (qword_1ECD0A288 != -1)
      dispatch_once(&qword_1ECD0A288, &__block_literal_global_67_0);
    return (NSArray *)qword_1ECD0A280;
  }
}

uint64_t __62__NSSecureUnarchiveFromDataTransformer_allowedTopLevelClasses__block_invoke()
{
  id v0;
  uint64_t result;

  v0 = objc_alloc(MEMORY[0x1E0C99D20]);
  result = objc_msgSend(v0, "initWithObjects:", MEMORY[0x1E0C99D20], MEMORY[0x1E0C99D80], MEMORY[0x1E0C99E60], NSString, NSNumber, MEMORY[0x1E0C99D68], MEMORY[0x1E0C99D50], objc_opt_class(), NSUUID, MEMORY[0x1E0C99E38], 0);
  qword_1ECD0A280 = result;
  return result;
}

- (id)description
{
  return CFSTR("<shared NSSecureUnarchiveFromData transformer>");
}

@end
