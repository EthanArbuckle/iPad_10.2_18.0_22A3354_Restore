@implementation NSInvocation(NAAdditions)

- (id)na_argumentDescriptionsWithObjectFormatter:()NAAdditions
{
  void (**v4)(id, void *, _QWORD);
  void *v5;
  char *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  void *v14;
  id v15;
  uint64_t v16;
  __CFString *v17;
  __CFString *v18;
  void *v19;
  int v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t *v28;
  void *v29;
  char *v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  _BYTE v35[128];
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(a1, "na_argumentsAsObjects");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v5, "count"))
  {
    v22 = (void *)MEMORY[0x1E0C9AA60];
    goto LABEL_22;
  }
  v28 = &v25;
  v26 = objc_msgSend(v5, "count");
  v6 = (char *)&v25 - ((8 * v26 + 15) & 0xFFFFFFFFFFFFFFF0);
  v27 = 8 * v26;
  bzero(v6, 8 * v26);
  v33 = 0u;
  v34 = 0u;
  v32 = 0u;
  v31 = 0u;
  v29 = v5;
  v7 = v5;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v31, v35, 16);
  if (!v8)
    goto LABEL_18;
  v9 = v8;
  v10 = 0;
  v11 = *(_QWORD *)v32;
  v30 = v6;
  do
  {
    v12 = 0;
    v13 = &v6[8 * v10];
    do
    {
      if (*(_QWORD *)v32 != v11)
        objc_enumerationMutation(v7);
      v14 = *(void **)(*((_QWORD *)&v31 + 1) + 8 * v12);
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
        goto LABEL_10;
      v15 = objc_retainAutorelease(v14);
      if (strcmp((const char *)objc_msgSend(v15, "objCType"), "B"))
      {

LABEL_10:
        v4[2](v4, v14, v10 + v12);
        v16 = objc_claimAutoreleasedReturnValue();
        v15 = (id)v16;
        v17 = CFSTR("(null)");
        if (v16)
          v17 = (__CFString *)v16;
        goto LABEL_12;
      }
      v20 = objc_msgSend(v15, "BOOLValue");
      v17 = CFSTR("NO");
      if (v20)
        v17 = CFSTR("YES");
LABEL_12:
      v18 = v17;

      v19 = *(void **)&v13[8 * v12];
      *(_QWORD *)&v13[8 * v12] = v18;

      ++v12;
    }
    while (v9 != v12);
    v21 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v31, v35, 16);
    v9 = v21;
    v10 += v12;
    v6 = v30;
  }
  while (v21);
LABEL_18:

  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v6, objc_msgSend(v7, "count"));
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = v27;
  if (v26)
  {
    do
    {

      v23 -= 8;
    }
    while (v23);
  }
  v5 = v29;
LABEL_22:

  return v22;
}

- (id)na_argumentsAsObjects
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  size_t v5;
  char *v6;
  uint64_t v7;
  id v8;
  const char *v9;
  const char *v10;
  unint64_t v11;
  unsigned __int8 *v12;
  size_t v13;
  double v14;
  int v15;
  id v16;
  void *v17;
  void *v18;
  uint64_t v19;
  _QWORD v21[2];
  NSUInteger sizep[2];

  sizep[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "methodSignature");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "numberOfArguments");
  v4 = v3 - 2;

  if (v3 == 2)
  {
    v18 = (void *)MEMORY[0x1E0C9AA60];
    return v18;
  }
  v21[0] = v3;
  v21[1] = v21;
  ((void (*)(void))MEMORY[0x1E0C80A78])();
  v6 = (char *)v21 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  bzero(v6, v5);
  v7 = 0;
  do
  {
    objc_msgSend(a1, "methodSignature");
    v8 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v9 = (const char *)objc_msgSend(v8, "getArgumentTypeAtIndex:", v7 + 2);

    if (!strcmp(v9, "@"))
    {
      sizep[0] = 0;
      objc_msgSend(a1, "getArgument:atIndex:", sizep, v7 + 2);
      if (sizep[0])
      {
        v16 = (id)sizep[0];
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0C99E38], "null");
        v16 = (id)objc_claimAutoreleasedReturnValue();
      }
    }
    else
    {
      sizep[0] = 0;
      v10 = NSGetSizeAndAlignment(v9, sizep, 0);
      MEMORY[0x1E0C80A78](v10);
      v12 = (unsigned __int8 *)v21 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
      if (v11 >= 0x200)
        v13 = 512;
      else
        v13 = v11;
      bzero((char *)v21 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0), v13);
      objc_msgSend(a1, "getArgument:atIndex:", v12, v7 + 2);
      v15 = *v9;
      if (v15 > 80)
      {
        switch(*v9)
        {
          case 'c':
            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithChar:", (char)*v12);
            v16 = (id)objc_claimAutoreleasedReturnValue();
            if (!v16)
              break;
            goto LABEL_43;
          case 'd':
            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", *(double *)v12);
            v16 = (id)objc_claimAutoreleasedReturnValue();
            if (!v16)
              break;
            goto LABEL_43;
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
            break;
          case 'f':
            LODWORD(v14) = *(_DWORD *)v12;
            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v14);
            v16 = (id)objc_claimAutoreleasedReturnValue();
            if (!v16)
              break;
            goto LABEL_43;
          case 'i':
            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", *(unsigned int *)v12);
            v16 = (id)objc_claimAutoreleasedReturnValue();
            if (!v16)
              break;
            goto LABEL_43;
          case 'l':
            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLong:", *(_QWORD *)v12);
            v16 = (id)objc_claimAutoreleasedReturnValue();
            if (!v16)
              break;
            goto LABEL_43;
          case 'q':
            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", *(_QWORD *)v12);
            v16 = (id)objc_claimAutoreleasedReturnValue();
            if (!v16)
              break;
            goto LABEL_43;
          case 's':
            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithShort:", *(__int16 *)v12);
            v16 = (id)objc_claimAutoreleasedReturnValue();
            if (!v16)
              break;
            goto LABEL_43;
          default:
            if (v15 == 81)
            {
              objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", *(_QWORD *)v12);
              v16 = (id)objc_claimAutoreleasedReturnValue();
              if (v16)
                goto LABEL_43;
            }
            else if (v15 == 83)
            {
              objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedShort:", *(unsigned __int16 *)v12);
              v16 = (id)objc_claimAutoreleasedReturnValue();
              if (v16)
                goto LABEL_43;
            }
            break;
        }
LABEL_42:
        objc_msgSend(MEMORY[0x1E0CB3B18], "value:withObjCType:", v12, v9);
        v16 = (id)objc_claimAutoreleasedReturnValue();
        goto LABEL_43;
      }
      if (v15 > 72)
      {
        if (v15 == 73)
        {
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", *(unsigned int *)v12);
          v16 = (id)objc_claimAutoreleasedReturnValue();
          if (v16)
            goto LABEL_43;
          goto LABEL_42;
        }
        if (v15 != 76)
          goto LABEL_42;
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLong:", *(_QWORD *)v12);
        v16 = (id)objc_claimAutoreleasedReturnValue();
        if (!v16)
          goto LABEL_42;
      }
      else
      {
        if (v15 == 66)
        {
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *v12);
          v16 = (id)objc_claimAutoreleasedReturnValue();
          if (v16)
            goto LABEL_43;
          goto LABEL_42;
        }
        if (v15 != 67)
          goto LABEL_42;
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedChar:", *v12);
        v16 = (id)objc_claimAutoreleasedReturnValue();
        if (!v16)
          goto LABEL_42;
      }
    }
LABEL_43:
    v17 = *(void **)&v6[8 * v7];
    *(_QWORD *)&v6[8 * v7] = v16;

    ++v7;
  }
  while (v4 != v7);
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v6, v4);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = 8 * v21[0];
  do
  {

    v19 -= 8;
  }
  while (v19 != 16);
  return v18;
}

@end
