@implementation EAEmailAddressParser

+ (_NSRange)rangeOfAddressDomainFromAddress:(id)a3
{
  id v4;
  id v5;
  uint64_t v6;
  NSUInteger v7;
  NSUInteger v8;
  NSUInteger v9;
  NSUInteger v10;
  id v11;
  _NSRange result;

  v4 = a3;
  v11 = 0;
  objc_msgSend(a1, "_componentsForFullAddress:rawAddressIndexes:localPartIndexes:domainIndexes:", v4, 0, 0, &v11);
  v5 = v11;
  if (objc_msgSend(v5, "rangeCount"))
  {
    v6 = objc_msgSend(v5, "rangeAtIndex:", 0);
    v8 = v7;
  }
  else
  {
    v8 = 0;
    v6 = 0x7FFFFFFFFFFFFFFFLL;
  }

  v9 = v6;
  v10 = v8;
  result.length = v10;
  result.location = v9;
  return result;
}

+ (void)_componentsForFullAddress:(id)a3 rawAddressIndexes:(id *)a4 localPartIndexes:(id *)a5 domainIndexes:(id *)a6
{
  unint64_t v7;
  id v8;
  char v9;
  unint64_t v10;
  unint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  BOOL v15;
  unsigned int v16;
  unsigned int v17;
  unsigned int v18;
  int v19;
  unint64_t v20;
  int v21;
  int v22;
  unsigned int v23;
  uint64_t v24;
  int v25;
  int v26;
  uint64_t v27;
  unsigned int v28;
  void *v29;
  uint64_t v30;
  unsigned int v31;
  void *v32;
  char v33;
  unint64_t v34;
  char v35;
  int v36;
  id *v37;
  int v40;
  id v41;

  v41 = a3;
  v7 = objc_msgSend(v41, "length");
  v8 = objc_alloc_init(MEMORY[0x24BDD1698]);
  v37 = a5;
  if (!v7)
  {
    v24 = 0;
    v40 = 0;
    v25 = 1;
    goto LABEL_56;
  }
  v34 = 0;
  v9 = 0;
  v33 = 0;
  v40 = 0;
  v35 = 0;
  v10 = 0;
  v11 = 0;
  v12 = 0;
  v13 = 0;
  v14 = MEMORY[0x24BDAC740];
  v36 = 1;
  v15 = 1;
  do
  {
    v16 = objc_msgSend(v41, "characterAtIndex:", v10);
    v17 = v16;
    if (v15)
    {
      if (v16 > 0x7F)
      {
        if (__maskrune(v16, 0x4000uLL))
        {
LABEL_6:
          if (v12)
          {
            objc_msgSend(v8, "addIndexesInRange:", v11, v12);
            v11 = v10;
          }
          v12 = 0;
          ++v11;
          goto LABEL_9;
        }
      }
      else if ((*(_DWORD *)(v14 + 4 * v16 + 60) & 0x4000) != 0)
      {
        goto LABEL_6;
      }
    }
    if (v17 == 92)
    {
      if (v10 + 1 < v7)
      {
        v15 = 0;
        v12 += 2;
        ++v10;
        goto LABEL_27;
      }
      if ((v9 & 1) != 0)
      {
LABEL_18:
        v15 = 0;
        ++v12;
        v9 &= v17 != 34;
        goto LABEL_27;
      }
      if (v13 > 0)
      {
LABEL_26:
        v15 = 0;
        v9 = 0;
        goto LABEL_27;
      }
      v12 += (v35 & 1) == 0;
      goto LABEL_32;
    }
    if ((v9 & 1) != 0)
      goto LABEL_18;
    if (v17 == 40)
    {
      v15 = 0;
      v9 = 0;
      ++v13;
      goto LABEL_27;
    }
    if (v13 <= 0)
    {
      if (v17 == 60)
      {
        objc_msgSend(v8, "removeAllIndexes");
        v12 = 0;
        v35 = 0;
        v40 = 0;
        v9 = 0;
        v34 = 0;
        v11 = v10 + 1;
        v15 = 1;
        v33 = 1;
        goto LABEL_27;
      }
      if ((v33 & (v17 == 62)) != 0)
      {
        v15 = 0;
        v33 = 0;
        v9 = 0;
        v35 = 1;
        goto LABEL_27;
      }
      v12 += (v35 & 1) == 0;
      if (v17 != 64)
      {
        if (v17 > 0x7F)
        {
          if (__maskrune(v17, 0x4000uLL))
          {
LABEL_33:
            v9 = 0;
LABEL_9:
            v15 = 1;
            goto LABEL_27;
          }
          goto LABEL_42;
        }
LABEL_32:
        if ((*(_DWORD *)(v14 + 4 * v17 + 60) & 0x4000) != 0)
          goto LABEL_33;
LABEL_42:
        v21 = v36;
        v22 = (v40 ^ 1) & v36;
        if ((v33 & 1) == 0)
          v22 = v36;
        v15 = 0;
        v9 = v17 == 34;
        if (v17 == 34)
          v21 = v22;
        v36 = v21;
        goto LABEL_27;
      }
      v15 = 0;
      v9 = 0;
      v36 &= v40 ^ 1;
      v20 = v34;
      if ((v40 & 1) == 0)
        v20 = v10;
      v34 = v20;
      v40 = 1;
    }
    else
    {
      if (v17 != 41)
        goto LABEL_26;
      if (--v13)
        goto LABEL_26;
      if (v12)
      {
        v18 = objc_msgSend(v41, "characterAtIndex:", v12 + v11 - 1);
        if (v18 > 0x7F)
          v19 = __maskrune(v18, 0x4000uLL);
        else
          v19 = *(_DWORD *)(v14 + 4 * v18 + 60) & 0x4000;
        v15 = v19 != 0;
        objc_msgSend(v8, "addIndexesInRange:", v11, v12);
      }
      else
      {
        v15 = 0;
      }
      v13 = 0;
      v12 = 0;
      v9 = 0;
      v11 = v10 + 1;
    }
LABEL_27:
    ++v10;
  }
  while (v10 < v7);
  if (!v12)
  {
    v24 = v34;
    v25 = v36;
LABEL_56:
    v27 = objc_msgSend(v8, "lastIndex");
    if (v27 == 0x7FFFFFFFFFFFFFFFLL)
      goto LABEL_64;
    v28 = objc_msgSend(v41, "characterAtIndex:", v27);
    if (v28 > 0x7F)
    {
      if (!__maskrune(v28, 0x4000uLL))
        goto LABEL_64;
    }
    else if ((*(_DWORD *)(MEMORY[0x24BDAC740] + 4 * v28 + 60) & 0x4000) == 0)
    {
      goto LABEL_64;
    }
    objc_msgSend(v8, "removeIndex:", v27);
    goto LABEL_64;
  }
  v23 = objc_msgSend(v41, "characterAtIndex:", v12 + v11 - 1);
  v24 = v34;
  v25 = v36;
  if (v23 > 0x7F)
    v26 = __maskrune(v23, 0x4000uLL);
  else
    v26 = *(_DWORD *)(v14 + 4 * v23 + 60) & 0x4000;
  objc_msgSend(v8, "addIndexesInRange:", v11, v12 - (v26 != 0));
LABEL_64:
  if (a4)
    *a4 = (id)objc_msgSend(v8, "copy");
  if (v37)
  {
    if ((v25 & v40 & 1) == 0)
    {
      *v37 = objc_alloc_init(MEMORY[0x24BDD15E0]);
      goto LABEL_76;
    }
    v29 = (void *)objc_msgSend(v8, "mutableCopy");
    objc_msgSend(v29, "removeIndexesInRange:", v24, v7 - v24);
    v30 = objc_msgSend(v29, "lastIndex");
    if (v30 == 0x7FFFFFFFFFFFFFFFLL)
      goto LABEL_75;
    v31 = objc_msgSend(v41, "characterAtIndex:", v30);
    if (v31 > 0x7F)
    {
      if (!__maskrune(v31, 0x4000uLL))
        goto LABEL_75;
    }
    else if ((*(_DWORD *)(MEMORY[0x24BDAC740] + 4 * v31 + 60) & 0x4000) == 0)
    {
LABEL_75:
      *v37 = (id)objc_msgSend(v29, "copy");

      goto LABEL_76;
    }
    objc_msgSend(v29, "removeIndex:", v30);
    goto LABEL_75;
  }
LABEL_76:
  if (a6)
  {
    if ((v25 & v40 & 1) != 0)
    {
      v32 = (void *)objc_msgSend(v8, "mutableCopy");
      objc_msgSend(v32, "removeIndexesInRange:", 0, v24 + 1);
      *a6 = (id)objc_msgSend(v32, "copy");

    }
    else
    {
      *a6 = objc_alloc_init(MEMORY[0x24BDD15E0]);
    }
  }

}

+ (id)rawAddressFromFullAddress:(id)a3
{
  objc_msgSend(a1, "rawAddressFromFullAddress:cacheResults:", a3, 1);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)rawAddressFromFullAddress:(id)a3 cacheResults:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  void *v7;
  id v8;
  id v9;
  void *v10;
  id v12;

  v4 = a4;
  v6 = a3;
  if (v6)
  {
    if (rawAddressFromFullAddress_cacheResults__onceToken != -1)
      dispatch_once(&rawAddressFromFullAddress_cacheResults__onceToken, &__block_literal_global_1);
    objc_sync_enter(CFSTR("com.apple.EmailAddressing.rawAddressesLock"));
    objc_msgSend((id)rawAddressFromFullAddress_cacheResults__rawAddresses, "objectForKeyedSubscript:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_sync_exit(CFSTR("com.apple.EmailAddressing.rawAddressesLock"));
    if (v7)
    {
      v8 = v7;
    }
    else
    {
      v12 = 0;
      objc_msgSend(a1, "_componentsForFullAddress:rawAddressIndexes:localPartIndexes:domainIndexes:", v6, &v12, 0, 0);
      v9 = v12;
      if (objc_msgSend(v9, "count"))
      {
        objc_msgSend(v6, "ef_substringWithIndexes:", v9);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        if (v4)
        {
          objc_sync_enter(CFSTR("com.apple.EmailAddressing.rawAddressesLock"));
          objc_msgSend((id)rawAddressFromFullAddress_cacheResults__rawAddresses, "setObject:forKeyedSubscript:", v10, v6);
          objc_sync_exit(CFSTR("com.apple.EmailAddressing.rawAddressesLock"));
        }
        v8 = v10;
      }
      else
      {
        v8 = 0;
      }

    }
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

void __63__EAEmailAddressParser_rawAddressFromFullAddress_cacheResults___block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = objc_opt_new();
  v1 = (void *)rawAddressFromFullAddress_cacheResults__rawAddresses;
  rawAddressFromFullAddress_cacheResults__rawAddresses = v0;

}

+ (OS_os_log)log
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __27__EAEmailAddressParser_log__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (log_onceToken != -1)
    dispatch_once(&log_onceToken, block);
  return (OS_os_log *)(id)log_log;
}

void __27__EAEmailAddressParser_log__block_invoke(uint64_t a1)
{
  os_log_t v1;
  void *v2;
  id v3;

  NSStringFromClass(*(Class *)(a1 + 32));
  v3 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v1 = os_log_create("com.apple.email", (const char *)objc_msgSend(v3, "UTF8String"));
  v2 = (void *)log_log;
  log_log = (uint64_t)v1;

}

+ (BOOL)isLegalEmailAddress:(id)a3
{
  id v4;
  __CFString *v5;
  uint64_t v6;
  uint64_t v7;
  const char *CStringPtr;
  uint64_t v9;
  uint64_t v10;
  char v11;
  char v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  UniChar v16;
  uint64_t v17;
  uint64_t v18;
  unint64_t v19;
  BOOL v20;
  BOOL v21;
  void *v23;
  _BOOL4 v24;
  void *v25;
  char v26;
  unint64_t v27;
  unint64_t v28;
  int v29;
  unint64_t v30;
  unint64_t v31;
  int *v32;
  UniChar *v33;
  int v34;
  uint64_t v35;
  int v36;
  int v37;
  void *v38;
  void *v39;
  int v40;
  int v41;
  __int128 v42;
  uint64_t v43;
  _QWORD v44[2];
  int v45;
  _QWORD v46[2];
  UniChar buffer[8];
  _OWORD v48[7];
  CFStringRef theString[2];
  __int128 v50;
  __int128 v51;
  uint64_t v52;
  uint64_t v53;
  CFRange v54;

  v53 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(a1, "rawAddressRespectingGroupsFromFullAddress:", v4);
  v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v6 = -[__CFString length](v5, "length");
  v7 = v6;
  if (v6 < 3)
    goto LABEL_40;
  v50 = 0u;
  memset(v48, 0, sizeof(v48));
  *(_OWORD *)buffer = 0u;
  theString[0] = v5;
  v52 = 0;
  v51 = (unint64_t)v6;
  theString[1] = (CFStringRef)CFStringGetCharactersPtr(v5);
  if (theString[1])
    CStringPtr = 0;
  else
    CStringPtr = CFStringGetCStringPtr(v5, 0x600u);
  v9 = 0;
  v10 = 0;
  v11 = 0;
  v12 = 0;
  v13 = 0;
  *((_QWORD *)&v51 + 1) = 0;
  v52 = 0;
  *(_QWORD *)&v50 = CStringPtr;
  while (1)
  {
    v14 = v12 & 1;
    v15 = v13;
    if (v13 >= v7)
      break;
    while (1)
    {
      if (v15 < 0 || (uint64_t)v51 <= v15)
        goto LABEL_26;
      if (theString[1])
      {
        v16 = *((_WORD *)&theString[1]->isa + *((_QWORD *)&v50 + 1) + v15);
      }
      else if ((_QWORD)v50)
      {
        v16 = *(char *)(v50 + *((_QWORD *)&v50 + 1) + v15);
      }
      else
      {
        if (v52 <= v15 || v10 > v15)
        {
          v17 = v15 - 4;
          if ((unint64_t)v15 < 4)
            v17 = 0;
          v18 = v17 + 64;
          if (v17 + 64 >= (uint64_t)v51)
            v18 = v51;
          *((_QWORD *)&v51 + 1) = v17;
          v52 = v18;
          v54.location = *((_QWORD *)&v50 + 1) + v17;
          v54.length = v18 - v17;
          CFStringGetCharacters(theString[0], v54, buffer);
          v9 = *((_QWORD *)&v51 + 1);
        }
        v16 = buffer[v15 - v9];
        v10 = v9;
      }
      if (v16 == 64)
      {
        if ((_DWORD)v14)
          v19 = 0x7FFFFFFFFFFFFFFFLL;
        else
          v19 = v15;
        goto LABEL_27;
      }
      if (v16 == 92)
      {
        v15 += v14;
        goto LABEL_26;
      }
      if (v16 == 34)
        break;
LABEL_26:
      v19 = 0x7FFFFFFFFFFFFFFFLL;
LABEL_27:
      ++v15;
      v20 = v19 == 0x7FFFFFFFFFFFFFFFLL;
      if (v15 >= v7 || v19 != 0x7FFFFFFFFFFFFFFFLL)
        goto LABEL_39;
    }
    v12 = v14 ^ 1;
    if (!(_DWORD)v14)
      v11 = 1;
    v13 = v15 + 1;
    if ((v14 & 1) == 0 && v15)
      goto LABEL_40;
  }
  v20 = 1;
  v19 = 0x7FFFFFFFFFFFFFFFLL;
LABEL_39:
  if (v20)
  {
LABEL_40:
    v21 = 0;
  }
  else
  {
    if ((v11 & 1) != 0)
    {
      if (v19 < 3)
        goto LABEL_40;
      if (-[__CFString characterAtIndex:](v5, "characterAtIndex:", v19 - 1) != 34)
        goto LABEL_40;
      -[__CFString substringWithRange:](v5, "substringWithRange:", 0, v19);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = objc_msgSend(v25, "canBeConvertedToEncoding:", 1);

      if ((v26 & 1) == 0)
        goto LABEL_40;
    }
    else
    {
      if (!v19)
        goto LABEL_40;
      if (-[__CFString characterAtIndex:](v5, "characterAtIndex:", 0) == 46)
        goto LABEL_40;
      if (-[__CFString characterAtIndex:](v5, "characterAtIndex:", v19 - 1) == 46)
        goto LABEL_40;
      if (-[__CFString rangeOfString:options:range:](v5, "rangeOfString:options:range:", CFSTR(".."), 0, 0, v19) != 0x7FFFFFFFFFFFFFFFLL)
        goto LABEL_40;
      objc_msgSend(MEMORY[0x24BDD14A8], "ef_unsafeAddressLocalPartCharacterSet");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = -[__CFString rangeOfCharacterFromSet:options:range:](v5, "rangeOfCharacterFromSet:options:range:", v23, 0, 0, v19) == 0x7FFFFFFFFFFFFFFFLL;

      if (!v24)
        goto LABEL_40;
    }
    v27 = v7 + ~v19;
    if (!v27)
      goto LABEL_40;
    v28 = v19 + 1;
    if (-[__CFString characterAtIndex:](v5, "characterAtIndex:", v19 + 1) == 91)
    {
      v29 = -[__CFString characterAtIndex:](v5, "characterAtIndex:", v7 - 1);
      v21 = 0;
      if (v27 >= 9 && v29 == 93)
      {
        v46[0] = 0;
        v46[1] = 0;
        *(_OWORD *)buffer = 0u;
        memset(v48, 0, 30);
        v45 = 0;
        v30 = v19 + 2;
        v44[0] = 0;
        v44[1] = 0;
        if (-[__CFString rangeOfString:options:range:](v5, "rangeOfString:options:range:", CFSTR("IPv6:"), 1, v19 + 2, 5) == 0x7FFFFFFFFFFFFFFFLL)
        {
          v31 = v27 - 2;
          v32 = &v45;
          v33 = (UniChar *)v46;
          v34 = 2;
          v35 = 15;
        }
        else
        {
          v30 = v19 + 7;
          v31 = v27 - 7;
          v32 = (int *)v44;
          v33 = buffer;
          v34 = 30;
          v35 = 45;
        }
        v43 = 0;
        v42 = xmmword_20A03F9E0;
        v40 = -[__CFString getBytes:maxLength:usedLength:encoding:options:range:remainingRange:](v5, "getBytes:maxLength:usedLength:encoding:options:range:remainingRange:", v33, v35, &v43, 1, 0, v30, v31, &v42);
        if (*((_QWORD *)&v42 + 1))
          v41 = 0;
        else
          v41 = v40;
        if (v41 != 1)
          goto LABEL_40;
        *((_BYTE *)v33 + v43) = 0;
        v21 = inet_pton(v34, (const char *)v33, v32) == 1;
      }
    }
    else
    {
      v36 = -[__CFString characterAtIndex:](v5, "characterAtIndex:", v19 + 1);
      v37 = -[__CFString characterAtIndex:](v5, "characterAtIndex:", v7 - 1);
      v21 = 0;
      if (v27 >= 3 && v36 != 46 && v36 != 45 && v37 != 46 && v37 != 45)
      {
        if (-[__CFString rangeOfString:options:range:](v5, "rangeOfString:options:range:", CFSTR(".-"), 0, v28, v27) != 0x7FFFFFFFFFFFFFFFLL
          || -[__CFString rangeOfString:options:range:](v5, "rangeOfString:options:range:", CFSTR("-."), 0, v28, v27) != 0x7FFFFFFFFFFFFFFFLL)
        {
          goto LABEL_40;
        }
        objc_msgSend(MEMORY[0x24BDD14A8], "alphanumericCharacterSet");
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        v39 = (void *)objc_msgSend(v38, "mutableCopy");

        objc_msgSend(v39, "addCharactersInString:", CFSTR(".-"));
        objc_msgSend(v39, "invert");
        v21 = -[__CFString rangeOfCharacterFromSet:options:range:](v5, "rangeOfCharacterFromSet:options:range:", v39, 0, v28, v27) == 0x7FFFFFFFFFFFFFFFLL;

      }
    }
  }

  return v21;
}

+ (BOOL)addressIsEmptyGroup:(id)a3
{
  id v3;
  uint64_t v4;
  unint64_t v5;
  char v6;
  unint64_t v7;
  unint64_t v8;
  uint64_t v9;
  unsigned int v10;
  unsigned int v11;
  BOOL v12;

  v3 = a3;
  if (objc_msgSend(v3, "length"))
  {
    v4 = objc_msgSend(v3, "rangeOfString:options:", CFSTR(":"), 2);
    v5 = objc_msgSend(v3, "rangeOfString:options:", CFSTR(";"), 14);
    v6 = 0;
    if (v4 != 0x7FFFFFFFFFFFFFFFLL)
    {
      v7 = v5;
      if (v5 != 0x7FFFFFFFFFFFFFFFLL)
      {
        v8 = v4 + 1;
        v6 = 1;
        if (v8 < v5)
        {
          v9 = MEMORY[0x24BDAC740];
          do
          {
            v10 = objc_msgSend(v3, "characterAtIndex:", v8);
            v11 = v10;
            if (v10 > 0x7F)
            {
              if (__maskrune(v10, 0x4000uLL))
                goto LABEL_12;
            }
            else if ((*(_DWORD *)(v9 + 4 * v10 + 60) & 0x4000) != 0)
            {
              goto LABEL_12;
            }
            if ((v11 | 2) != 0x3E)
            {
              v6 = 0;
              break;
            }
LABEL_12:
            ++v8;
          }
          while (v7 != v8);
        }
      }
    }
    v12 = v6 & 1;
  }
  else
  {
    v12 = 0;
  }

  return v12;
}

+ (id)rawAddressRespectingGroupsFromFullAddress:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  id v8;
  uint64_t v9;

  v4 = a3;
  v5 = v4;
  if (v4)
  {
    v6 = objc_msgSend(v4, "rangeOfString:", CFSTR("@"));
    v7 = objc_msgSend(v5, "rangeOfString:", CFSTR("<"));
    v8 = v5;
    if (v6 != 0x7FFFFFFFFFFFFFFFLL || v7 != 0x7FFFFFFFFFFFFFFFLL)
    {
      objc_msgSend(a1, "rawAddressFromFullAddress:", v8);
      v9 = objc_claimAutoreleasedReturnValue();

      v8 = (id)v9;
    }
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

+ (id)localPartFromAddress:(id)a3
{
  id v4;
  id v5;
  void *v6;
  id v8;

  v4 = a3;
  if (v4)
  {
    v8 = 0;
    objc_msgSend(a1, "_componentsForFullAddress:rawAddressIndexes:localPartIndexes:domainIndexes:", v4, 0, &v8, 0);
    v5 = v8;
    if (objc_msgSend(v5, "count"))
    {
      objc_msgSend(v4, "ef_substringWithIndexes:", v5);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v6 = 0;
    }

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

+ (id)addressDomainFromAddress:(id)a3
{
  id v4;
  id v5;
  void *v6;
  id v8;

  v4 = a3;
  if (v4)
  {
    v8 = 0;
    objc_msgSend(a1, "_componentsForFullAddress:rawAddressIndexes:localPartIndexes:domainIndexes:", v4, 0, 0, &v8);
    v5 = v8;
    if (objc_msgSend(v5, "count"))
    {
      objc_msgSend(v4, "ef_substringWithIndexes:", v5);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v6 = 0;
    }

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

+ (id)displayNameFromAddress:(id)a3
{
  objc_msgSend(a1, "displayNameFromAddress:cacheResults:", a3, 1);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)displayNameFromAddress:(id)a3 cacheResults:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  void *v7;
  id v8;
  void *v9;
  unint64_t v10;
  NSUInteger v11;
  unsigned __int16 *v12;
  _WORD *v13;
  uint64_t v14;
  uint64_t v15;
  int v16;
  BOOL v17;
  int v18;
  uint64_t v20;
  int v21;
  char v22;
  uint64_t v23;
  char v24;
  int v25;
  uint64_t v26;
  unsigned int v27;
  unint64_t v29;
  int v30;
  unsigned __int16 *v31;
  int v32;
  unsigned __int16 *v33;
  _BOOL4 v34;
  unsigned __int16 *v35;
  unint64_t v36;
  unsigned __int16 *v38;
  void *v40;
  int v41;
  id v42;
  id v43;
  id v44;
  void *v45;
  void *v46;
  uint64_t v47;
  uint64_t v48;
  void *v49;
  id v51;
  _BOOL4 v52;
  void *v53;
  unsigned __int16 *v54;
  _WORD *ptr;
  char v56;
  uint64_t v57;
  _WORD *v58;
  id v59;
  unsigned __int16 *v60;

  v4 = a4;
  v6 = a3;
  if (!v6)
  {
    v9 = 0;
    goto LABEL_113;
  }
  if (displayNameFromAddress_cacheResults__onceToken != -1)
    dispatch_once(&displayNameFromAddress_cacheResults__onceToken, &__block_literal_global_24);
  objc_sync_enter(CFSTR("com.apple.EmailAddressing.displayNamesLock"));
  objc_msgSend((id)displayNameFromAddress_cacheResults__displayNames, "objectForKeyedSubscript:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_sync_exit(CFSTR("com.apple.EmailAddressing.displayNamesLock"));
  if (v7)
  {
    v8 = v7;
    goto LABEL_112;
  }
  v53 = v6;
  v10 = objc_msgSend(v6, "length");
  v11 = 2 * v10 + 2;
  v12 = (unsigned __int16 *)NSZoneMalloc(0, v11);
  v13 = NSZoneMalloc(0, v11);
  objc_msgSend(v6, "getCharacters:", v13);
  v51 = a1;
  v52 = v4;
  if (v10)
  {
    v14 = 0;
    v15 = 0;
    v16 = 0;
    v17 = 1;
    while (1)
    {
      v18 = (unsigned __int16)v13[v14];
      if (v18 != 92)
      {
        if (v18 == 34 && v15 == 0)
        {
          v15 = 0;
          v16 ^= 1u;
        }
        else if ((v18 != 40) | v16 & 1)
        {
          if ((v18 != 41) | v16 & 1)
          {
            if (v18 == 60 && ((v16 ^ 1) & 1) != 0 && !v15)
              goto LABEL_26;
          }
          else
          {
            v16 = 0;
            --v15;
          }
        }
        else
        {
          v16 = 0;
          ++v15;
        }
      }
      v17 = ++v14 < v10;
      if (v10 == v14)
        goto LABEL_26;
    }
  }
  v17 = 0;
LABEL_26:
  ptr = NSZoneMalloc(0, v11);
  v60 = v12;
  if (!v10)
  {
    v23 = 0;
    LOBYTE(v25) = 0;
    v33 = v12;
    v34 = v4;
    goto LABEL_83;
  }
  v20 = 0;
  v21 = 0;
  v57 = 0;
  v54 = 0;
  v56 = 0;
  v22 = 0;
  v23 = 0;
  v24 = 0;
  v25 = 0;
  v26 = MEMORY[0x24BDAC740];
  v58 = ptr;
  do
  {
    v27 = (unsigned __int16)v13[v20];
    if (v27 == 92)
    {
      if (!(v24 & 1 | (v13[v20 + 1] == 0)))
      {
        v24 = 1;
        goto LABEL_72;
      }
      v27 = 92;
LABEL_47:
      if ((*(_DWORD *)(v26 + 4 * v27 + 60) & 0x4000) == 0)
        goto LABEL_55;
      goto LABEL_48;
    }
    if (v27 == 34 && v23 == 0)
    {
      v23 = 0;
      v25 ^= 1u;
      v27 = 34;
      goto LABEL_47;
    }
    if (!((v27 != 41) | v25 & 1))
    {
      v25 = 0;
      --v23;
      v27 = 41;
      goto LABEL_47;
    }
    if (v27 == 60 && ((v25 ^ 1) & 1) != 0 && !v23)
    {
      if ((v56 & 1) != 0)
      {
        objc_msgSend(v51, "insertPreviousRoute:ofLength:toBuffer:ofLength:atPosition:addSpace:", ptr, v57, &v60, v10, v54, v21 > 0);
        v21 -= v21 > 0;
        v27 = (unsigned __int16)v13[v20];
      }
      else
      {
        v27 = 60;
      }
      v23 = 0;
      v56 = 0;
      v22 = 1;
      v54 = v60;
      v57 = 0;
      v58 = ptr;
    }
    if (v27 <= 0x7F)
      goto LABEL_47;
    if (!__maskrune(v27, 0x4000uLL))
      goto LABEL_55;
LABEL_48:
    if (v60 == v12)
      goto LABEL_53;
    v29 = *(v60 - 1);
    if (v29 > 0x7F)
    {
      if (__maskrune(v29, 0x4000uLL))
      {
LABEL_53:
        ++v21;
        goto LABEL_65;
      }
    }
    else if ((*(_DWORD *)(v26 + 4 * v29 + 60) & 0x4000) != 0)
    {
      goto LABEL_53;
    }
LABEL_55:
    v30 = (unsigned __int16)v13[v20];
    if (v30 != 34 || v23)
    {
      if (v17)
      {
        if ((v22 & 1) == 0)
          goto LABEL_61;
LABEL_63:
        *v58 = v30;
        ++v57;
        ++v58;
        v22 = 1;
        goto LABEL_65;
      }
      if (v23 >= 1)
      {
LABEL_61:
        v31 = v60;
        *v60 = v30;
        v60 = v31 + 1;
        goto LABEL_65;
      }
      if ((v22 & 1) != 0)
        goto LABEL_63;
      v22 = 0;
    }
LABEL_65:
    v32 = (unsigned __int16)v13[v20];
    if ((v32 != 40) | v25 & 1)
    {
      v24 = 0;
      if (!((v32 != 62) | v25 & 1) && !v23)
      {
        v25 = 0;
        v24 = 0;
        v23 = 0;
        if ((v22 & 1) != 0)
        {
          v22 = 0;
          *v58 = 0;
          v56 = 1;
        }
        else
        {
          v22 = 0;
        }
      }
    }
    else
    {
      v25 = 0;
      v24 = 0;
      ++v23;
    }
LABEL_72:
    ++v20;
  }
  while (v10 != v20);
  v33 = v60;
  v34 = v52;
  if (v60 > v12)
  {
    v35 = v60 - 1;
    while (1)
    {
      v36 = *v35;
      if (!(v36 > 0x7F ? __maskrune(v36, 0x4000uLL) : *(_DWORD *)(v26 + 4 * v36 + 60) & 0x4000))
        break;
      v60 = v35;
      v38 = v35 - 1;
      if (v35-- <= v12)
      {
        v33 = v38 + 1;
        goto LABEL_83;
      }
    }
    v33 = v60;
  }
LABEL_83:
  *v33 = 0;
  v6 = v53;
  if (v23 || (v25 & 1) != 0)
  {
    v42 = v53;
LABEL_95:
    if (!v42)
      goto LABEL_96;
    goto LABEL_100;
  }
  if (v33 <= v12 + 1)
    goto LABEL_96;
  v40 = 0;
  while (2)
  {
    v41 = *v12;
    if (v41 == 39)
    {
      if (*(v33 - 1) != 39)
        break;
      goto LABEL_92;
    }
    if (v41 == 34 && *(v33 - 1) == 34)
    {
LABEL_92:
      *(v33 - 1) = 0;
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCharacters:length:", v12 + 1, v33 - v12 - 2, v51);
      v42 = (id)objc_claimAutoreleasedReturnValue();

      v33 = v60 - 1;
      v60 = v33;
      v40 = v42;
      if (v33 <= v12 + 1)
        goto LABEL_95;
      continue;
    }
    break;
  }
  v42 = v40;
  if (v40)
    goto LABEL_100;
LABEL_96:
  if (v60 == v12)
  {
    v42 = 0;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCharacters:length:", v12, v60 - v12);
    v42 = (id)objc_claimAutoreleasedReturnValue();
  }
LABEL_100:
  NSZoneFree(0, v12);
  NSZoneFree(0, v13);
  NSZoneFree(0, ptr);
  if (v60 == v12)
  {
    v43 = v53;

    v59 = 0;
    objc_msgSend(v51, "_componentsForFullAddress:rawAddressIndexes:localPartIndexes:domainIndexes:", v43, 0, 0, &v59);
    v44 = v59;
    if (objc_msgSend(v44, "count"))
    {
      objc_msgSend(v43, "ef_substringWithIndexes:", v44);
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v45, "_lp_userVisibleHost");
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v46, "isEqualToString:", v45) & 1) == 0)
      {
        objc_msgSend(v43, "stringByReplacingCharactersInRange:withString:", objc_msgSend(v44, "firstIndex"), objc_msgSend(v44, "lastIndex") - objc_msgSend(v44, "firstIndex") + 1, v46);
        v47 = objc_claimAutoreleasedReturnValue();

        v43 = (id)v47;
      }

    }
    v42 = v43;
  }
  if (objc_msgSend(v42, "containsString:", &stru_24C2B7838, v51))
  {
    objc_msgSend(v42, "stringByReplacingOccurrencesOfString:withString:", &stru_24C2B7838, &stru_24C2B7358);
    v48 = objc_claimAutoreleasedReturnValue();

    v42 = (id)v48;
  }
  if (v34)
  {
    objc_sync_enter(CFSTR("com.apple.EmailAddressing.displayNamesLock"));
    v49 = (void *)objc_msgSend(v42, "copy");

    objc_msgSend((id)displayNameFromAddress_cacheResults__displayNames, "setObject:forKeyedSubscript:", v49, v53);
    objc_sync_exit(CFSTR("com.apple.EmailAddressing.displayNamesLock"));
  }
  else
  {
    v49 = v42;
  }
  v8 = v49;
LABEL_112:
  v9 = v8;

LABEL_113:
  return v9;
}

void __60__EAEmailAddressParser_displayNameFromAddress_cacheResults___block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = objc_opt_new();
  v1 = (void *)displayNameFromAddress_cacheResults__displayNames;
  displayNameFromAddress_cacheResults__displayNames = v0;

}

+ (void)insertPreviousRoute:(unsigned __int16 *)a3 ofLength:(unint64_t)a4 toBuffer:(unsigned __int16 *)a5 ofLength:(unint64_t)a6 atPosition:(unsigned __int16 *)a7 addSpace:(BOOL)a8
{
  _BOOL4 v8;
  void *v13;
  size_t v14;
  unsigned __int16 *v15;

  v8 = a8;
  v13 = NSZoneMalloc(0, 2 * a6 + 2);
  v14 = (char *)*a5 - (char *)a7;
  memcpy(v13, a7, v14);
  memcpy(a7, a3, 2 * a4);
  v15 = &a7[a4];
  if (v8)
    *v15++ = 32;
  memcpy(v15, v13, v14);
  *a5 = (unsigned __int16 *)((char *)v15 + v14);
  NSZoneFree(0, v13);
}

+ (id)idnaDecodedAddressForAddress:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;

  v4 = a3;
  v5 = objc_msgSend(a1, "rangeOfAddressDomainFromAddress:", v4);
  objc_msgSend(a1, "_stringByDecodingIDNAString:inRange:", v4, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

+ (id)idnaEncodedAddressForAddress:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;

  v4 = a3;
  v5 = objc_msgSend(a1, "rangeOfAddressDomainFromAddress:", v4);
  objc_msgSend(a1, "_stringByEncodingIDNAString:inRange:", v4, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

+ (id)_stringByDecodingIDNAString:(id)a3 inRange:(_NSRange)a4
{
  NSUInteger length;
  NSUInteger location;
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;

  length = a4.length;
  location = a4.location;
  v6 = a3;
  if (location == 0x7FFFFFFFFFFFFFFFLL
    || !length
    || (objc_msgSend(MEMORY[0x24BDBCEA0], "ef_posixLocale"),
        v7 = (void *)objc_claimAutoreleasedReturnValue(),
        v8 = objc_msgSend(v6, "rangeOfString:options:range:locale:", CFSTR("xn--"), 1, location, length, v7),
        v7,
        v8 == 0x7FFFFFFFFFFFFFFFLL))
  {
    v9 = objc_msgSend(v6, "copy");
  }
  else
  {
    _createStringByApplyingIDNATranslationWithRange(v6, location, length, MEMORY[0x24BEDC160]);
    v9 = objc_claimAutoreleasedReturnValue();
  }
  v10 = (void *)v9;

  return v10;
}

+ (id)_stringByEncodingIDNAString:(id)a3 inRange:(_NSRange)a4
{
  NSUInteger length;
  NSUInteger location;
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;

  length = a4.length;
  location = a4.location;
  v6 = a3;
  if (location == 0x7FFFFFFFFFFFFFFFLL
    || !length
    || (objc_msgSend(MEMORY[0x24BDD14A8], "ef_unsafeDomainNameCharacterSet"),
        v7 = (void *)objc_claimAutoreleasedReturnValue(),
        v8 = objc_msgSend(v6, "rangeOfCharacterFromSet:options:range:", v7, 0, location, length),
        v7,
        v8 == 0x7FFFFFFFFFFFFFFFLL))
  {
    v9 = objc_msgSend(v6, "copy");
  }
  else
  {
    _createStringByApplyingIDNATranslationWithRange(v6, location, length, MEMORY[0x24BEDC150]);
    v9 = objc_claimAutoreleasedReturnValue();
  }
  v10 = (void *)v9;

  return v10;
}

@end
