@implementation NSString(NameDecomposition)

+ (id)CUIK_attendeeNameExtensions
{
  void *v0;
  uint64_t v1;
  void *v2;

  v0 = (void *)CUIK_attendeeNameExtensions_nameExtensions;
  if (!CUIK_attendeeNameExtensions_nameExtensions)
  {
    v1 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99D20]), "initWithObjects:", CFSTR("jr."), CFSTR("sr."), CFSTR("iii"), CFSTR("m.d."), CFSTR("md"), CFSTR("d.d.s."), CFSTR("dds"), CFSTR("ph.d."), CFSTR("phd"), CFSTR("m.b.a."), CFSTR("mba"), CFSTR("esq."), CFSTR("esq"), CFSTR("jr"), CFSTR("sr"), CFSTR("ii"), CFSTR("iv"),
           CFSTR("v"),
           CFSTR("vi"),
           CFSTR("vii"),
           CFSTR("viii"),
           CFSTR("ix"),
           0);
    v2 = (void *)CUIK_attendeeNameExtensions_nameExtensions;
    CUIK_attendeeNameExtensions_nameExtensions = v1;

    v0 = (void *)CUIK_attendeeNameExtensions_nameExtensions;
  }
  return v0;
}

+ (id)CUIK_attendeePartialSurnames
{
  void *v0;
  uint64_t v1;
  void *v2;

  v0 = (void *)CUIK_attendeePartialSurnames_partialSurnames;
  if (!CUIK_attendeePartialSurnames_partialSurnames)
  {
    v1 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99D20]), "initWithObjects:", CFSTR("de"), CFSTR("den"), CFSTR("der"), CFSTR("di"), CFSTR("do"), CFSTR("du"), CFSTR("la"), CFSTR("le"), CFSTR("les"), CFSTR("van"), CFSTR("von"), 0);
    v2 = (void *)CUIK_attendeePartialSurnames_partialSurnames;
    CUIK_attendeePartialSurnames_partialSurnames = v1;

    v0 = (void *)CUIK_attendeePartialSurnames_partialSurnames;
  }
  return v0;
}

- (uint64_t)CUIK_attendeeAppearsToBeAnInitial
{
  uint64_t v2;
  uint64_t v3;

  v2 = objc_msgSend(a1, "length");
  if (v2 == 1)
    return 1;
  if (v2 != 2)
    return 0;
  v3 = 1;
  if (objc_msgSend(a1, "characterAtIndex:", 1) != 46)
  {
    v3 = 1;
    if (objc_msgSend(a1, "characterAtIndex:", 1) != 93)
      return 0;
  }
  return v3;
}

- (__CFString)CUIK_attendeeTrimCommasSpacesQuotes
{
  __CFString *v2;
  uint64_t v3;
  uint64_t v4;
  __int16 v5;
  char v6;
  unint64_t v7;
  uint64_t v8;
  unint64_t v9;
  char v10;
  int v11;
  const __CFString *v12;
  uint64_t v13;

  if (objc_msgSend(&unk_1E6ED7100, "containsObject:", a1))
  {
    v2 = (__CFString *)objc_msgSend(a1, "copy");
    return v2;
  }
  v3 = objc_msgSend(a1, "length");
  if (!v3)
    goto LABEL_24;
  v4 = v3;
  v5 = objc_msgSend(a1, "characterAtIndex:", 0);
  v6 = 0;
  v7 = v4 - 1;
  v8 = 1;
  while (v5 == 32 || v5 == 44)
  {
LABEL_9:
    if (v4 == v8)
    {
      v9 = v4 - 1;
      goto LABEL_13;
    }
    v5 = objc_msgSend(a1, "characterAtIndex:", v8++);
  }
  if (v5 == 34)
  {
    v6 ^= 1u;
    goto LABEL_9;
  }
  v9 = v8 - 1;
LABEL_13:
  v10 = 0;
  while (1)
  {
    v11 = objc_msgSend(a1, "characterAtIndex:", v7);
    if (v11 != 32 && v11 != 44)
    {
      if (v11 != 34)
        break;
      v10 ^= 1u;
    }
    if (!v7)
      break;
    --v7;
  }
  if (v9 >= v7)
  {
LABEL_24:
    v2 = &stru_1E6EBAE30;
    return v2;
  }
  objc_msgSend(a1, "substringWithRange:", v9, v7 - v9 + 1);
  v2 = (__CFString *)objc_claimAutoreleasedReturnValue();
  if (v10 & 1 | ((v6 & 1) == 0))
  {
    if (!(v6 & 1 | ((v10 & 1) == 0)))
    {
      v12 = CFSTR("%@\");
      goto LABEL_26;
    }
  }
  else
  {
    v12 = CFSTR("\"%@");
LABEL_26:
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", v12, v2);
    v13 = objc_claimAutoreleasedReturnValue();

    v2 = (__CFString *)v13;
  }
  return v2;
}

- (void)CUIK_attendeeFirstName:()NameDecomposition middleName:lastName:extension:
{
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  char v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t i;
  void *v27;
  void *v28;
  uint64_t v29;
  void **v30;
  void *v31;
  void *v32;
  void *v33;
  int v34;
  void *v35;
  unint64_t v36;
  void *v37;
  void *v38;
  void *v39;
  char v40;
  void *v41;
  void *v42;
  uint64_t v43;
  unint64_t v44;
  void *v45;
  char v46;
  void *v47;
  void *v48;
  int v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  _QWORD *v54;
  void **v55;
  id v56;

  v56 = a1;
  if (!objc_msgSend(v56, "length"))
  {
    v20 = 0;
    v21 = 0;
    v10 = 0;
    v22 = 0;
    *a3 = 0;
    *a4 = 0;
    *a5 = 0;
    *a6 = 0;
    goto LABEL_50;
  }
  objc_msgSend(v56, "componentsSeparatedByString:", CFSTR(","));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if ((unint64_t)objc_msgSend(v10, "count") > 2)
    goto LABEL_6;
  if (objc_msgSend(v10, "count") != 2)
    goto LABEL_5;
  objc_msgSend(MEMORY[0x1E0CB3940], "CUIK_attendeeNameExtensions");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "lastObject");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "CUIK_attendeeTrimCommasSpacesQuotes");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "lowercaseString");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v11, "containsObject:", v14);

  if ((v15 & 1) == 0)
  {
LABEL_6:
    if ((unint64_t)objc_msgSend(v10, "count") < 3)
    {
      v23 = (void *)MEMORY[0x1E0CB3940];
      objc_msgSend(v10, "objectAtIndex:", 1);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "objectAtIndex:", 0);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "stringWithFormat:", CFSTR("%@ %@"), v17, v18);
    }
    else
    {
      v17 = (void *)objc_msgSend(v10, "mutableCopy");
      objc_msgSend(v17, "objectAtIndexedSubscript:", 0);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "objectAtIndexedSubscript:", 1);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "setObject:atIndexedSubscript:", v19, 0);

      objc_msgSend(v17, "setObject:atIndexedSubscript:", v18, 1);
      objc_msgSend(v17, "componentsJoinedByString:", CFSTR(" "));
    }
    v24 = objc_claimAutoreleasedReturnValue();

    v16 = (void *)v24;
  }
  else
  {
LABEL_5:
    v16 = v56;
  }
  v54 = a4;
  v55 = a3;
  v56 = v16;
  objc_msgSend(v16, "componentsSeparatedByString:", CFSTR(" "));
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = objc_msgSend(v21, "count");
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", v25);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = 0;
  if (v25)
  {
    for (i = 0; i != v25; ++i)
    {
      v27 = v22;
      objc_msgSend(v21, "objectAtIndex:", i);
      v22 = (void *)objc_claimAutoreleasedReturnValue();

      if ((objc_msgSend(v22, "isEqualToString:", &stru_1E6EBAE30) & 1) == 0)
      {
        objc_msgSend(v22, "CUIK_attendeeTrimCommasSpacesQuotes");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v28, "length"))
          objc_msgSend(v20, "addObject:", v28);

      }
    }
  }
  v29 = objc_msgSend(v20, "count");
  if (v29 == 2)
  {
    objc_msgSend(v20, "objectAtIndex:", 0);
    v30 = v55;
    *v55 = (id)objc_claimAutoreleasedReturnValue();
    *v54 = 0;
    objc_msgSend(v20, "objectAtIndex:", 1);
    *a5 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v30 = v55;
    if (v29 != 1)
    {
      if (v29)
      {
        objc_msgSend(v20, "lastObject");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "CUIK_attendeeNameExtensions");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v31, "lowercaseString");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        v34 = objc_msgSend(v32, "containsObject:", v33);

        v53 = v31;
        if (v34)
        {
          *a6 = objc_retainAutorelease(v31);
          objc_msgSend(v20, "removeLastObject");
        }
        else
        {
          *a6 = 0;
        }
        if ((unint64_t)(objc_msgSend(v20, "count") - 3) > 0xFFFFFFFFFFFFFFFDLL)
        {
          v35 = 0;
        }
        else
        {
          v35 = 0;
          v36 = 1;
          do
          {
            v37 = v22;
            objc_msgSend(v20, "objectAtIndex:", v36);
            v22 = (void *)objc_claimAutoreleasedReturnValue();

            objc_msgSend(MEMORY[0x1E0CB3940], "CUIK_attendeePartialSurnames");
            v38 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v22, "lowercaseString");
            v39 = (void *)objc_claimAutoreleasedReturnValue();
            v40 = objc_msgSend(v38, "containsObject:", v39);

            if ((v40 & 1) != 0)
            {
              v41 = (void *)MEMORY[0x1E0CB3940];
              objc_msgSend(v20, "objectAtIndex:", v36 + 1);
              v42 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v41, "stringWithFormat:", CFSTR("%@ %@"), v22, v42);
              v43 = objc_claimAutoreleasedReturnValue();

              objc_msgSend(v20, "replaceObjectAtIndex:withObject:", v36, v43);
              objc_msgSend(v20, "removeObjectAtIndex:", ++v36);
              v35 = (void *)v43;
            }
            else
            {
              ++v36;
            }
          }
          while (v36 < objc_msgSend(v20, "count") - 1);
        }
        v44 = objc_msgSend(v20, "count");
        if (v44 < 4)
        {
          objc_msgSend(v20, "lastObject");
          v48 = v53;
          *a5 = (id)objc_claimAutoreleasedReturnValue();
          v30 = v55;
        }
        else
        {
          objc_msgSend(v20, "objectAtIndex:", v44 - 2);
          v45 = (void *)objc_claimAutoreleasedReturnValue();

          v46 = objc_msgSend(v45, "CUIK_attendeeAppearsToBeAnInitial");
          objc_msgSend(v20, "lastObject");
          v47 = (void *)objc_claimAutoreleasedReturnValue();
          v48 = v47;
          v30 = v55;
          if ((v46 & 1) != 0)
          {
            *a5 = v47;
            v48 = v53;
          }
          else
          {

            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@ %@"), v45, v48);
            *a5 = (id)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v20, "removeLastObject");
          }
          v22 = v45;
        }
        objc_msgSend(v20, "removeLastObject");
        objc_msgSend(v20, "objectAtIndex:", 0);
        *v30 = (id)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "removeObjectAtIndex:", 0);
        if (objc_msgSend(v20, "count"))
        {
          v49 = CurrentLocaleExpectsMultipleFamilyNames();
          objc_msgSend(v20, "componentsJoinedByString:", CFSTR(" "));
          v50 = (void *)objc_claimAutoreleasedReturnValue();
          v51 = v50;
          if (v49)
          {
            objc_msgSend(v50, "stringByAppendingFormat:", CFSTR(" %@"), *a5);
            *a5 = (id)objc_claimAutoreleasedReturnValue();

          }
          else
          {
            *v54 = v50;
          }
        }
        else
        {
          *v54 = 0;
        }

        goto LABEL_48;
      }
      *v55 = 0;
      *v54 = 0;
      *a5 = 0;
      *a6 = 0;
    }
    *v55 = objc_retainAutorelease(v56);
    *v54 = 0;
    *a5 = 0;
  }
  *a6 = 0;
LABEL_48:
  if (CurrentLocaleExpectsSurnameFirst())
  {
    v52 = *v30;
    *v30 = objc_retainAutorelease(*a5);
    *a5 = objc_retainAutorelease(v52);
  }
LABEL_50:

}

@end
