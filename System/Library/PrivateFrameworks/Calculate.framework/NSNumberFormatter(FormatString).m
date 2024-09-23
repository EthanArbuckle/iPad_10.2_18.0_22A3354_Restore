@implementation NSNumberFormatter(FormatString)

- (id)formatString:()FormatString
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v10;

  v4 = a3;
  if (objc_msgSend(a1, "numberStyle") == 1)
  {
    v5 = objc_msgSend(a1, "usesGroupingSeparator");
    objc_msgSend(a1, "groupingSeparator");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "decimalSeparator");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    LOBYTE(v10) = 1;
    objc_msgSend(a1, "formatString:usesGroupingSeparator:groupingSeparator:decimalSeparator:maximumIntegerDigits:maximumFractionDigits:localizeDigits:", v4, v5, v6, v7, objc_msgSend(a1, "maximumIntegerDigits"), objc_msgSend(a1, "maximumFractionDigits"), v10);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(a1, "numberFromString:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "stringFromNumber:", v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v8;
}

- (id)formatString:()FormatString usesGroupingSeparator:
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v11;

  v6 = a3;
  if (objc_msgSend(a1, "numberStyle") == 1)
  {
    objc_msgSend(a1, "groupingSeparator");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "decimalSeparator");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    LOBYTE(v11) = 1;
    objc_msgSend(a1, "formatString:usesGroupingSeparator:groupingSeparator:decimalSeparator:maximumIntegerDigits:maximumFractionDigits:localizeDigits:", v6, a4, v7, v8, objc_msgSend(a1, "maximumIntegerDigits"), objc_msgSend(a1, "maximumFractionDigits"), v11);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(a1, "numberFromString:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "stringFromNumber:", v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v9;
}

- (id)formatString:()FormatString usesGroupingSeparator:groupingSeparator:decimalSeparator:maximumIntegerDigits:maximumFractionDigits:localizeDigits:
{
  id v13;
  __CFString *v14;
  __CFString *v15;
  __CFString *v16;
  id v17;
  id v18;
  __int16 v19;
  int v20;
  _BOOL4 v24;
  int v25;
  int v26;
  int v27;
  uint64_t v28;
  uint64_t v29;
  _WORD *v30;
  uint64_t v31;
  uint64_t v32;
  int v33;
  uint64_t v34;
  __int16 v35;
  int v36;
  int v37;
  uint64_t v38;
  int v39;
  int v40;
  uint64_t v41;
  int v42;
  int v43;
  char v44;
  __int16 v45;
  uint64_t v46;
  unsigned __int16 *v47;
  __int16 v48;
  int v49;
  unsigned int v50;
  __int16 v51;
  __int16 v52;
  BOOL v53;
  unsigned int v54;
  char v55;
  int v57;
  _BOOL4 v58;
  __int16 v59;
  __CFString *v60;
  __int16 v61;

  v13 = a3;
  v14 = a5;
  v15 = a6;
  if (objc_msgSend(a1, "numberStyle") == 1)
  {
    if (-[__CFString length](v14, "length") == 1 && -[__CFString length](v15, "length") == 1)
    {
      if (a9)
      {
        objc_msgSend(a1, "stringFromNumber:", &unk_1E6EABEE0);
        v16 = (__CFString *)objc_claimAutoreleasedReturnValue();
        if (-[__CFString length](v16, "length") != 1)
        {
          v17 = v13;
          goto LABEL_13;
        }
      }
      else
      {
        v16 = CFSTR("0");
      }
      if ((a4 & 1) != 0 || !-[__CFString isEqualToString:](v16, "isEqualToString:", CFSTR("0")))
      {
        v61 = -[__CFString characterAtIndex:](v14, "characterAtIndex:", 0);
        v19 = -[__CFString characterAtIndex:](v15, "characterAtIndex:", 0);
        v20 = -[__CFString characterAtIndex:](v16, "characterAtIndex:", 0);
        v24 = v20 != 48 && v20 != 65296 && v20 != 2406 && v20 != 1632;
        v58 = v24;
        v59 = v20;
        v25 = objc_msgSend(v13, "lengthOfBytesUsingEncoding:", 2483028224);
        v26 = v25;
        if (v25 >= 0)
          v27 = v25;
        else
          v27 = v25 + 1;
        v28 = (v27 >> 1);
        v60 = v16;
        v29 = v25;
        v30 = malloc_type_calloc(v25, 2uLL, 0x1000040BDFB0063uLL);
        v31 = objc_msgSend(v13, "length");
        v32 = v29;
        v33 = v26;
        objc_msgSend(v13, "getBytes:maxLength:usedLength:encoding:options:range:remainingRange:", v30, v32, 0, 2483028224, 0, 0, v31, 0);
        if (v26 < 2)
        {
          LODWORD(v34) = 0;
          v35 = v61;
        }
        else
        {
          v34 = 0;
          v35 = v61;
          while (1)
          {
            v36 = (unsigned __int16)v30[v34];
            if (v36 == 46 || v36 == 101)
              break;
            if (v28 == ++v34)
            {
              LODWORD(v34) = v28;
              break;
            }
          }
        }
        v37 = 0x7FFFFFFF;
        if (a4)
        {
          v57 = v33;
          v38 = objc_msgSend(a1, "groupingSize");
          v39 = v38;
          if (v38)
            v40 = v38;
          else
            v40 = 0x7FFFFFFF;
          v41 = objc_msgSend(a1, "secondaryGroupingSize");
          if (v41)
            v37 = v41;
          else
            v37 = v40;
          if ((int)v34 <= v40)
          {
            v42 = 0;
            v39 = v40;
          }
          else
          {
            v42 = ((v34 + ~v40) & ~(((int)v34 + ~v40) >> 31)) / v37 + 1;
          }
          v35 = v61;
          v33 = v57;
        }
        else
        {
          v42 = 0;
          v39 = 0x7FFFFFFF;
        }
        v43 = v42 + v28;
        if (v42 + (int)v28 >= 1)
        {
          v44 = (_DWORD)v34 == (_DWORD)v28;
          if (v58)
            v45 = 48;
          else
            v45 = v59;
          v46 = (int)v34 - (uint64_t)(int)v28 + 1;
          v47 = &v30[(int)v28 - 1];
          do
          {
            v49 = *v47--;
            v48 = v49;
            v50 = v49 - 48;
            if (v49 == 101)
              v51 = 101;
            else
              v51 = v19;
            if (!v46)
              v48 = v51;
            if (v50 <= 9)
              v52 = v50 + v45;
            else
              v52 = v48;
            v53 = v43 >= 2;
            v54 = v43 - 2;
            v30[--v43] = v52;
            v55 = !v53;
            if (!(v55 & 1 | ((v44 & 1) == 0)) && !--v39)
            {
              v30[v54] = v35;
              v39 = v37;
              v43 = v54;
            }
            v44 |= v46++ == 0;
          }
          while (v43 > 0);
        }
        v18 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithBytesNoCopy:length:encoding:freeWhenDone:", v30, v33 + 2 * v42, 2483028224, 1);
        v16 = v60;
        goto LABEL_69;
      }
      objc_msgSend(v13, "stringByReplacingOccurrencesOfString:withString:", CFSTR("."), v15);
      v17 = (id)objc_claimAutoreleasedReturnValue();
LABEL_13:
      v18 = v17;
LABEL_69:

      goto LABEL_70;
    }

    v18 = v13;
    v14 = CFSTR(",");
    v15 = CFSTR(".");
  }
  else
  {
    v18 = v13;
  }
LABEL_70:

  return v18;
}

- (id)formatString:()FormatString byAppendingExponent:
{
  id v6;
  void *v7;
  id v8;
  void *v9;
  char v10;
  void *v11;
  unint64_t v12;
  void *v13;
  BOOL v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;

  v6 = a3;
  v7 = v6;
  if ((_DWORD)a4 == 1)
  {
    v8 = v6;
  }
  else
  {
    objc_msgSend(a1, "stringFromNumber:", &unk_1E6EABEF8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "isEqualToString:", CFSTR("1"));

    if ((v10 & 1) != 0)
    {
      v11 = (void *)objc_opt_new();
      if ((_DWORD)a4)
      {
        if ((int)a4 >= 0)
          v12 = a4;
        else
          v12 = -(int)a4;
        do
        {
          objc_msgSend(&unk_1E6EACC38, "objectAtIndexedSubscript:", v12 % 0xA);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "addObject:", v13);

          v14 = v12 > 9;
          v12 /= 0xAuLL;
        }
        while (v14);
        if ((a4 & 0x80000000) != 0)
        {
          objc_msgSend(&unk_1E6EACC38, "objectAtIndexedSubscript:", 10);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "addObject:", v15);

        }
      }
      objc_msgSend(v11, "reverseObjectEnumerator");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "allObjects");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "componentsJoinedByString:", &stru_1E6EA0F18);
      v18 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@%@"), v7, v18);
      v8 = (id)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v19 = (void *)MEMORY[0x1E0CB3940];
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", a4);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(a1, "stringFromNumber:", v20);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "stringWithFormat:", CFSTR("%@^%@"), v7, v21);
      v8 = (id)objc_claimAutoreleasedReturnValue();

    }
  }

  return v8;
}

- (BOOL)shouldIgnoreChanges
{
  void *v1;
  _BOOL8 v2;

  objc_getAssociatedObject(a1, &ignore);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = v1 != 0;

  return v2;
}

- (void)ignoreChanges:()FormatString
{
  void (**v4)(_QWORD);
  id value;

  v4 = a3;
  objc_getAssociatedObject(a1, &ignore);
  value = (id)objc_claimAutoreleasedReturnValue();
  objc_setAssociatedObject(a1, &ignore, MEMORY[0x1E0C9AAB0], (void *)1);
  v4[2](v4);

  objc_setAssociatedObject(a1, &ignore, value, (void *)1);
}

@end
