@implementation NSException(NSException)

- (uint64_t)encodeWithCoder:()NSException
{
  char v5;
  uint64_t v6;

  v5 = objc_msgSend(a3, "allowsKeyedCoding");
  v6 = objc_msgSend(a1, "name");
  if ((v5 & 1) != 0)
  {
    objc_msgSend(a3, "encodeObject:forKey:", v6, CFSTR("NS.name"));
    objc_msgSend(a3, "encodeObject:forKey:", objc_msgSend(a1, "reason"), CFSTR("NS.reason"));
    return objc_msgSend(a3, "encodeObject:forKey:", objc_msgSend(a1, "userInfo"), CFSTR("NS.userinfo"));
  }
  else
  {
    objc_msgSend(a3, "encodeObject:", v6);
    objc_msgSend(a3, "encodeObject:", objc_msgSend(a1, "reason"));
    return objc_msgSend(a3, "encodeObject:", objc_msgSend(a1, "userInfo"));
  }
}

- (uint64_t)initWithCoder:()NSException
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v17;
  NSString **v18;
  const __CFString **v19;
  NSError *v20;
  const __CFString *v21;
  NSString *v22;
  const __CFString *v23;
  NSString *v24;
  const __CFString *v25;
  NSString *v26;
  const __CFString *v27;
  NSString *v28;
  const __CFString *v29;
  NSString *v30;
  _BYTE v31[128];
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  if ((objc_msgSend(a3, "allowsKeyedCoding") & 1) == 0)
    return objc_msgSend(a1, "initWithName:reason:userInfo:", objc_msgSend(a3, "decodeObject"), objc_msgSend(a3, "decodeObject"), objc_msgSend(a3, "decodeObject"));
  v34 = 0u;
  v35 = 0u;
  v32 = 0u;
  v33 = 0u;
  v5 = objc_msgSend(&unk_1E0FCCAA8, "countByEnumeratingWithState:objects:count:", &v32, v31, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v33;
    while (2)
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v33 != v7)
          objc_enumerationMutation(&unk_1E0FCCAA8);
        v9 = *(_QWORD *)(*((_QWORD *)&v32 + 1) + 8 * i);
        if ((objc_msgSend(a3, "containsValueForKey:", v9) & 1) == 0)
        {
          v29 = CFSTR("NSDebugDescription");
          v30 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Missing required key '%@'"), v9);
          v17 = (void *)MEMORY[0x1E0C99D80];
          v18 = &v30;
          v19 = &v29;
          goto LABEL_19;
        }
      }
      v6 = objc_msgSend(&unk_1E0FCCAA8, "countByEnumeratingWithState:objects:count:", &v32, v31, 16);
      if (v6)
        continue;
      break;
    }
  }
  v10 = objc_opt_class();
  v11 = objc_msgSend(a3, "decodeObjectOfClass:forKey:", v10, CFSTR("NS.name"));
  if (!v11)
  {
    v27 = CFSTR("NSDebugDescription");
    v28 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Missing required 'name' for the exception."));
    v17 = (void *)MEMORY[0x1E0C99D80];
    v18 = &v28;
    v19 = &v27;
LABEL_19:
    v20 = +[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("NSCocoaErrorDomain"), 4864, objc_msgSend(v17, "dictionaryWithObjects:forKeys:count:", v18, v19, 1));

    objc_msgSend(a3, "failWithError:", v20);
    return 0;
  }
  v12 = v11;
  if ((_NSIsNSString() & 1) == 0)
  {
    v25 = CFSTR("NSDebugDescription");
    v26 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Name must be a string - got: %@"), objc_opt_class());
    v17 = (void *)MEMORY[0x1E0C99D80];
    v18 = &v26;
    v19 = &v25;
    goto LABEL_19;
  }
  v13 = objc_msgSend(a3, "decodeObjectOfClass:forKey:", v10, CFSTR("NS.reason"));
  if (v13 && (_NSIsNSString() & 1) == 0)
  {
    v23 = CFSTR("NSDebugDescription");
    v24 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Reason must be a string - got: %@"), objc_opt_class());
    v17 = (void *)MEMORY[0x1E0C99D80];
    v18 = &v24;
    v19 = &v23;
    goto LABEL_19;
  }
  v14 = objc_msgSend(a3, "decodeObjectOfClasses:forKey:", objc_msgSend((id)objc_msgSend(a3, "allowedClasses"), "setByAddingObjectsFromSet:", __NSPropertyListClasses_ForArchival_ErrorAndException()), CFSTR("NS.userinfo"));
  if (v14 && (_NSIsNSDictionary() & 1) == 0)
  {
    v21 = CFSTR("NSDebugDescription");
    v22 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("UserInfo must be a dictionary - got: %@"), objc_opt_class());
    v17 = (void *)MEMORY[0x1E0C99D80];
    v18 = &v22;
    v19 = &v21;
    goto LABEL_19;
  }
  v15 = (void *)objc_msgSend(a1, "initWithName:reason:userInfo:", v12, v13, v14);
  objc_msgSend(v15, "_markAsUnarchived");
  return (uint64_t)v15;
}

+ (uint64_t)supportsSecureCoding
{
  return 1;
}

- (NSString)debugDescription
{
  int v2;
  uint64_t v3;
  uint64_t v5;

  v2 = objc_msgSend(a1, "_isUnarchived");
  v3 = objc_msgSend(a1, "description");
  if (v2)
    return +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@\n UNARCHIVED"), v3, v5);
  else
    return +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@\n%@"), v3, objc_msgSend(a1, "callStackSymbols"));
}

@end
