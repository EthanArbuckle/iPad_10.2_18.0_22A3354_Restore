@implementation DDContactUtils

+ (BOOL)phoneNumber:(id)a3 isEqualToPhoneNumber:(id)a4
{
  id v6;
  id v7;
  void *v8;
  char v9;
  void *v10;
  void *v11;
  id v12;
  id v13;
  unint64_t v14;
  unint64_t v15;
  unint64_t v16;
  unint64_t v17;
  unint64_t v18;
  unint64_t v19;
  unint64_t v20;
  int v21;

  v6 = a3;
  v7 = a4;
  v8 = v7;
  v9 = 0;
  if (v6 && v7)
  {
    if (v6 == v7)
    {
      v9 = 1;
    }
    else if ((unint64_t)objc_msgSend(v6, "length") >= 5 && (unint64_t)objc_msgSend(v8, "length") > 4)
    {
      objc_msgSend(a1, "normalizedPhoneNumberFromString:", v6);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(a1, "normalizedPhoneNumberFromString:", v8);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = v10;
      v13 = v11;
      v14 = objc_msgSend(v12, "length");
      v15 = objc_msgSend(v13, "length");
      if (v14 >= v15)
        v16 = v15;
      else
        v16 = v14;
      if (v14 <= v15)
        v17 = v15;
      else
        v17 = v14;
      if (v17 && (double)v16 / (double)v17 >= 0.5)
      {
        v18 = 0;
        if (v16)
        {
          v19 = v15 - 1;
          v20 = v14 - 1;
          while (1)
          {
            v21 = objc_msgSend(v12, "characterAtIndex:", v20);
            if (v21 != objc_msgSend(v13, "characterAtIndex:", v19))
              break;
            ++v18;
            --v19;
            --v20;
            if (v16 == v18)
            {
              v18 = v16;
              break;
            }
          }
        }
        v9 = (double)v18 / (double)v16 >= 0.75;
      }
      else
      {
        v9 = 0;
      }

    }
    else
    {
      v9 = objc_msgSend(v6, "isEqualToString:", v8);
    }
  }

  return v9;
}

+ (id)normalizedPhoneNumberFromString:(id)a3
{
  id v3;
  uint64_t v4;
  __CFString *v5;
  unint64_t v6;
  void *v7;
  uint64_t v8;
  _WORD *v9;
  unint64_t v10;
  uint64_t v11;
  unsigned int v12;
  int v13;
  unsigned int v14;
  __int16 v16;
  unsigned int v17;
  uint64_t v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = objc_msgSend(v3, "length");
  if ((unint64_t)(v4 - 31) < 0xFFFFFFFFFFFFFFE2)
  {
    v5 = &stru_1E4259460;
    goto LABEL_40;
  }
  v6 = v4;
  if ((objc_msgSend(v3, "containsString:", CFSTR("+")) & 1) != 0
    || objc_msgSend(v3, "containsString:", CFSTR("＋")))
  {
    objc_msgSend(v3, "stringByReplacingOccurrencesOfString:withString:", CFSTR("(0)"), &stru_1E4259460);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    v6 = objc_msgSend(v7, "length");
    v3 = v7;
  }
  MEMORY[0x1E0C80A78]();
  v9 = (_WORD *)((char *)&v19 - ((v8 + 17) & 0xFFFFFFFFFFFFFFF0));
  objc_msgSend(v3, "getCharacters:range:", v9, 0, v6);
  if (!v6)
  {
    *v9 = 0;
    v5 = &stru_1E4259460;
    goto LABEL_40;
  }
  v19 = (uint64_t)&v19;
  v10 = 0;
  v11 = 0;
  do
  {
    v12 = (unsigned __int16)v9[v10];
    if (v12 >> 10 == 54)
    {
      if (v10 + 1 >= v6)
        goto LABEL_21;
      v13 = (unsigned __int16)v9[v10 + 1];
      if ((v13 & 0xFC00) != 0xDC00)
        goto LABEL_21;
      v12 = v13 + (v12 << 10) - 56613888;
      ++v10;
LABEL_12:
      if (u_isdigit(v12))
      {
        v14 = u_charDigitValue(v12);
        if (v14 > 9)
          goto LABEL_21;
        LOWORD(v12) = v14 + 48;
        goto LABEL_20;
      }
      if (v12 == 65291)
      {
        LOWORD(v12) = 43;
LABEL_20:
        v9[v11++] = v12;
        goto LABEL_21;
      }
      goto LABEL_21;
    }
    if (v12 - 48 < 0xA)
      goto LABEL_20;
    if (v12 <= 0x2B && ((1 << v12) & 0xC0800000000) != 0)
      goto LABEL_20;
    if (v12 - 65 <= 0x19)
    {
      if (v12 < 0x57)
        v16 = 8;
      else
        v16 = 9;
      if (v12 == 83)
        v16 = 7;
      v17 = (v12 - 65) / 3 + 2;
      if (v12 > 0x52)
        LOWORD(v17) = v16;
      LOWORD(v12) = v17 + 48;
      goto LABEL_20;
    }
    if (v9[v10])
      goto LABEL_12;
LABEL_21:
    ++v10;
  }
  while (v10 < v6);
  v9[v11] = 0;
  if (v11)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCharacters:length:", v9, v11, v19, v20);
    v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = &stru_1E4259460;
  }
LABEL_40:

  return v5;
}

@end
