@implementation NSOrthography

+ (id)_scriptNameForScriptIndex:(unint64_t)a3
{
  id result;

  if (!a3)
    return 0;
  result = CFSTR("Zyyy");
  if (a3 != 1 && a3 <= 0x1F)
    return (id)objc_msgSend(&unk_1E0FCEA58, "objectAtIndex:");
  return result;
}

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
    objc_msgSend(a1, "setVersion:", 1);
}

+ (NSOrthography)allocWithZone:(_NSZone *)a3
{
  if (NSOrthography == a1)
    a1 = (id)objc_opt_class();
  return (NSOrthography *)NSAllocateObject((Class)a1, 0, a3);
}

+ (NSOrthography)orthographyWithDominantScript:(NSString *)script languageMap:(NSDictionary *)map
{
  return (NSOrthography *)(id)objc_msgSend(objc_allocWithZone((Class)a1), "initWithDominantScript:languageMap:", script, map);
}

- (NSOrthography)initWithDominantScript:(NSString *)script languageMap:(NSDictionary *)map
{
  _NSRequestConcreteObject((int)self, a2);
}

- (unint64_t)hash
{
  unint64_t result;
  NSUInteger v4;

  LODWORD(result) = -[NSOrthography orthographyFlags](self, "orthographyFlags");
  if ((_DWORD)result)
    return result;
  v4 = -[NSString hash](-[NSOrthography dominantScript](self, "dominantScript"), "hash");
  return -[NSDictionary hash](-[NSOrthography languageMap](self, "languageMap"), "hash") ^ v4;
}

- (BOOL)isEqual:(id)a3
{
  unsigned int v5;
  int v6;

  if (a3 == self)
  {
    LOBYTE(v6) = 1;
  }
  else if (a3 && (objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = -[NSOrthography orthographyFlags](self, "orthographyFlags");
    if (v5)
    {
      LOBYTE(v6) = v5 == objc_msgSend(a3, "orthographyFlags");
    }
    else
    {
      v6 = -[NSString isEqualToString:](-[NSOrthography dominantScript](self, "dominantScript"), "isEqualToString:", objc_msgSend(a3, "dominantScript"));
      if (v6)
        LOBYTE(v6) = -[NSDictionary isEqual:](-[NSOrthography languageMap](self, "languageMap"), "isEqual:", objc_msgSend(a3, "languageMap"));
    }
  }
  else
  {
    LOBYTE(v6) = 0;
  }
  return v6;
}

- (id)description
{
  NSString *v3;
  NSString *v4;
  NSArray *v5;
  NSArray *v6;
  NSString *v7;
  NSString *v8;
  const __CFString *v9;
  NSString *v10;
  const __CFString *v11;
  objc_super v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v3 = -[NSOrthography dominantScript](self, "dominantScript");
  v4 = -[NSOrthography dominantLanguage](self, "dominantLanguage");
  v5 = -[NSOrthography allScripts](self, "allScripts");
  v6 = -[NSOrthography languagesForScript:](self, "languagesForScript:", v3);
  v7 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@->%@"), v3, v4);
  if (-[NSArray count](v6, "count") >= 3)
  {
    v8 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR(" and %lu other languages"), -[NSArray count](v6, "count") - 1);
LABEL_5:
    v9 = (const __CFString *)v8;
    goto LABEL_7;
  }
  if (-[NSArray count](v6, "count") == 2)
  {
    v8 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR(" and %@"), -[NSArray objectAtIndex:](v6, "objectAtIndex:", 1));
    goto LABEL_5;
  }
  v9 = &stru_1E0F56070;
LABEL_7:
  if (-[NSArray count](v5, "count") < 3)
  {
    if (-[NSArray count](v5, "count") != 2)
    {
      v11 = &stru_1E0F56070;
      goto LABEL_13;
    }
    v10 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR(", plus %@"), -[NSArray objectAtIndex:](v5, "objectAtIndex:", 1));
  }
  else
  {
    v10 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR(", plus %lu other scripts"), -[NSArray count](v5, "count") - 1);
  }
  v11 = (const __CFString *)v10;
LABEL_13:
  v13.receiver = self;
  v13.super_class = (Class)NSOrthography;
  return +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@{%@%@%@}"), -[NSOrthography description](&v13, sel_description), v7, v9, v11);
}

- (Class)classForCoder
{
  return (Class)NSOrthography;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *v5;
  NSDictionary *v6;

  v5 = -[NSOrthography dominantScript](self, "dominantScript");
  v6 = -[NSOrthography languageMap](self, "languageMap");
  if ((objc_msgSend(a3, "allowsKeyedCoding") & 1) != 0)
  {
    objc_msgSend(a3, "encodeObject:forKey:", v5, CFSTR("NSDominantScript"));
    objc_msgSend(a3, "encodeObject:forKey:", v6, CFSTR("NSLanguageMap"));
  }
  else
  {
    objc_msgSend(a3, "encodeObject:", v5);
    objc_msgSend(a3, "encodeObject:", v6);
  }
}

- (NSOrthography)initWithCoder:(NSCoder *)coder
{
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t j;
  NSInteger v21;
  const __CFString *v23;
  NSInteger v24;
  NSString *v25;
  uint64_t v26;
  _BYTE v27[128];
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _BYTE v32[128];
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  if (-[NSCoder allowsKeyedCoding](coder, "allowsKeyedCoding"))
  {
    v6 = -[NSCoder decodeObjectOfClass:forKey:](coder, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("NSDominantScript"));
    if ((_NSIsNSString() & 1) != 0)
    {
      v7 = (void *)MEMORY[0x1E0C99E60];
      v8 = objc_opt_class();
      v9 = objc_opt_class();
      v10 = -[NSCoder decodeObjectOfClasses:forKey:](coder, "decodeObjectOfClasses:forKey:", objc_msgSend(v7, "setWithObjects:", v8, v9, objc_opt_class(), 0), CFSTR("NSLanguageMap"));
      if ((_NSIsNSDictionary() & 1) != 0)
      {
        v35 = 0u;
        v36 = 0u;
        v33 = 0u;
        v34 = 0u;
        v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v33, v32, 16);
        if (v11)
        {
          v12 = v11;
          v13 = *(_QWORD *)v34;
          v26 = *(_QWORD *)v34;
          while (2)
          {
            for (i = 0; i != v12; ++i)
            {
              if (*(_QWORD *)v34 != v13)
                objc_enumerationMutation(v10);
              v15 = *(_QWORD *)(*((_QWORD *)&v33 + 1) + 8 * i);
              if ((_NSIsNSString() & 1) == 0)
              {

                v23 = CFSTR("Orthography language map key is not a string");
                goto LABEL_29;
              }
              v16 = (void *)objc_msgSend(v10, "objectForKeyedSubscript:", v15);
              if ((_NSIsNSArray() & 1) == 0)
              {

                v23 = CFSTR("Orthography language map value is not a list of languages");
                goto LABEL_29;
              }
              v30 = 0u;
              v31 = 0u;
              v28 = 0u;
              v29 = 0u;
              v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v28, v27, 16);
              if (v17)
              {
                v18 = v17;
                v19 = *(_QWORD *)v29;
                while (2)
                {
                  for (j = 0; j != v18; ++j)
                  {
                    if (*(_QWORD *)v29 != v19)
                      objc_enumerationMutation(v16);
                    if ((_NSIsNSString() & 1) == 0)
                    {

                      v23 = CFSTR("Orthography language map list contains non-string language");
                      goto LABEL_29;
                    }
                  }
                  v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v28, v27, 16);
                  if (v18)
                    continue;
                  break;
                }
              }
              v13 = v26;
            }
            v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v33, v32, 16);
            if (v12)
              continue;
            break;
          }
        }
        return -[NSOrthography initWithDominantScript:languageMap:](self, "initWithDominantScript:languageMap:", v6, v10);
      }

      v23 = CFSTR("Orthography language map is not a dictionary");
    }
    else
    {

      v23 = CFSTR("Orthography dominant script is not a string");
    }
LABEL_29:
    -[NSCoder failWithError:](coder, "failWithError:", +[NSError _readCorruptErrorWithFormat:](NSError, "_readCorruptErrorWithFormat:", v23));
  }
  else
  {
    v21 = -[NSCoder versionForClassName:](coder, "versionForClassName:", CFSTR("NSOrthography"));
    if (v21 == 1)
    {
      v6 = -[NSCoder decodeObject](coder, "decodeObject");
      v10 = -[NSCoder decodeObject](coder, "decodeObject");
      return -[NSOrthography initWithDominantScript:languageMap:](self, "initWithDominantScript:languageMap:", v6, v10);
    }
    v24 = v21;
    v25 = _NSFullMethodName((objc_class *)self, a2);
    NSLog((NSString *)CFSTR("%@: class version %ld cannot read instances archived with version %ld"), v25, 1, v24);
    -[NSOrthography dealloc](self, "dealloc");
  }
  return 0;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)replacementObjectForPortCoder:(id)a3
{
  objc_super v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  if ((objc_msgSend(a3, "isBycopy") & 1) == 0)
  {
    v6.receiver = self;
    v6.super_class = (Class)NSOrthography;
    return -[NSOrthography replacementObjectForPortCoder:](&v6, sel_replacementObjectForPortCoder_, a3);
  }
  return self;
}

- (NSString)dominantScript
{
  objc_class *v4;

  v4 = NSClassFromString((NSString *)CFSTR("NSOrthography"));
  NSRequestConcreteImplementation((uint64_t)self, a2, v4);
}

- (NSDictionary)languageMap
{
  objc_class *v4;

  v4 = NSClassFromString((NSString *)CFSTR("NSOrthography"));
  NSRequestConcreteImplementation((uint64_t)self, a2, v4);
}

- (unsigned)orthographyFlags
{
  return NSOrthographyFlagsForDominantScriptAndLanguageMap((uint64_t)-[NSOrthography dominantScript](self, "dominantScript"), -[NSOrthography languageMap](self, "languageMap"));
}

- (NSArray)languagesForScript:(NSString *)script
{
  return (NSArray *)-[NSDictionary objectForKey:](-[NSOrthography languageMap](self, "languageMap"), "objectForKey:", script);
}

- (NSString)dominantLanguageForScript:(NSString *)script
{
  NSArray *v3;
  NSString *result;

  v3 = -[NSOrthography languagesForScript:](self, "languagesForScript:", script);
  result = -[NSArray count](v3, "count");
  if (result)
    return (NSString *)-[NSArray objectAtIndex:](v3, "objectAtIndex:", 0);
  return result;
}

- (NSString)dominantLanguage
{
  return -[NSOrthography dominantLanguageForScript:](self, "dominantLanguageForScript:", -[NSOrthography dominantScript](self, "dominantScript"));
}

- (NSArray)allScripts
{
  NSArray *v3;
  NSString *v4;

  v3 = (NSArray *)objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithArray:", -[NSDictionary allKeys](-[NSOrthography languageMap](self, "languageMap"), "allKeys"));
  v4 = -[NSOrthography dominantScript](self, "dominantScript");
  -[NSArray removeObject:](v3, "removeObject:", v4);
  -[NSArray insertObject:atIndex:](v3, "insertObject:atIndex:", v4, 0);
  return v3;
}

- (NSArray)allLanguages
{
  NSArray *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  NSArray *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t j;
  uint64_t v13;
  NSArray *obj;
  _BYTE v16[128];
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v3 = (NSArray *)objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  obj = -[NSOrthography allScripts](self, "allScripts");
  v4 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v22, v21, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v23;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v23 != v6)
          objc_enumerationMutation(obj);
        v8 = -[NSOrthography languagesForScript:](self, "languagesForScript:", *(_QWORD *)(*((_QWORD *)&v22 + 1) + 8 * i));
        v17 = 0u;
        v18 = 0u;
        v19 = 0u;
        v20 = 0u;
        v9 = -[NSArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v17, v16, 16);
        if (v9)
        {
          v10 = v9;
          v11 = *(_QWORD *)v18;
          do
          {
            for (j = 0; j != v10; ++j)
            {
              if (*(_QWORD *)v18 != v11)
                objc_enumerationMutation(v8);
              v13 = *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * j);
              if (!-[NSArray containsObject:](v3, "containsObject:", v13))
                -[NSArray addObject:](v3, "addObject:", v13);
            }
            v10 = -[NSArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v17, v16, 16);
          }
          while (v10);
        }
      }
      v5 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v22, v21, 16);
    }
    while (v5);
  }
  return v3;
}

+ (id)_orthographyWithDominantScript:(id)a3 languageMap:(id)a4
{
  uint64_t v6;

  v6 = NSOrthographyFlagsForDominantScriptAndLanguageMap((uint64_t)a3, a4);
  if ((_DWORD)v6)
    return +[NSSimpleOrthography orthographyWithFlags:](NSSimpleOrthography, "orthographyWithFlags:", v6);
  else
    return +[NSOrthography orthographyWithDominantScript:languageMap:](NSComplexOrthography, "orthographyWithDominantScript:languageMap:", a3, a4);
}

+ (NSOrthography)defaultOrthographyForLanguage:(NSString *)language
{
  uint64_t v5;
  void *v6;
  void *v7;
  const __CFString *v8;
  BOOL v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;

  v5 = objc_msgSend(&unk_1E0FCE9C8, "indexOfObject:");
  if (v5 == 0x7FFFFFFFFFFFFFFFLL)
  {
    v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DC8]), "initWithLocaleIdentifier:", language);
    v7 = (void *)objc_msgSend(v6, "languageCode");
    v8 = (const __CFString *)objc_msgSend(v6, "scriptCode");
    v5 = 0x7FFFFFFFFFFFFFFFLL;
    if (v8)
      v9 = 1;
    else
      v9 = v7 == 0;
    if (!v9)
    {
      v10 = objc_msgSend(&unk_1E0FCE9E0, "indexOfObject:", v7);
      if (v10 != 0x7FFFFFFFFFFFFFFFLL)
      {
        v13 = v10;

        v5 = v13;
        goto LABEL_16;
      }
      v11 = objc_msgSend(v7, "stringByAppendingString:", CFSTR("-"));
      v12 = 0;
      do
      {
        if (objc_msgSend((id)objc_msgSend(&unk_1E0FCE9F8, "objectAtIndex:", v12), "hasPrefix:", v11))
          v5 = v12;
        else
          v5 = 0x7FFFFFFFFFFFFFFFLL;
        if (v12 > 0xF6)
          break;
        ++v12;
      }
      while (v5 == 0x7FFFFFFFFFFFFFFFLL);
    }

    if (v8)
      goto LABEL_31;
  }
LABEL_16:
  if ((unint64_t)(v5 - 1) <= 4)
  {
    v14 = &unk_1E0FCEAD0;
    v15 = v5;
LABEL_30:
    v8 = (const __CFString *)objc_msgSend(v14, "objectAtIndex:", v15);
    goto LABEL_31;
  }
  if ((unint64_t)(v5 - 6) <= 0x79)
  {
    v14 = &unk_1E0FCEAE8;
    v15 = 6;
    goto LABEL_30;
  }
  if ((unint64_t)(v5 - 128) <= 0x13)
  {
    v14 = &unk_1E0FCEB00;
    v15 = 8;
    goto LABEL_30;
  }
  if ((unint64_t)(v5 - 160) <= 0x1B)
  {
    v14 = &unk_1E0FCEB18;
    v15 = 11;
    goto LABEL_30;
  }
  if ((unint64_t)(v5 - 192) <= 0xD)
  {
    v14 = &unk_1E0FCEB30;
    v15 = 12;
    goto LABEL_30;
  }
  if ((unint64_t)(v5 - 208) <= 2)
  {
    v14 = &unk_1E0FCEB48;
    v15 = 29;
    goto LABEL_30;
  }
  if ((unint64_t)(v5 - 224) <= 0x18)
  {
    v15 = v5 - 217;
    v14 = &unk_1E0FCEB60;
    goto LABEL_30;
  }
  v8 = 0;
LABEL_31:
  if (!v8)
    v8 = CFSTR("Latn");
  return (NSOrthography *)objc_msgSend(a1, "_orthographyWithDominantScript:languageMap:", v8, objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObject:forKey:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObject:", language), v8));
}

@end
