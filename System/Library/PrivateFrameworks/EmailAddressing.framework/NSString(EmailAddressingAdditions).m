@implementation NSString(EmailAddressingAdditions)

- (id)ea_uncommentedAddress
{
  __int128 v2;
  unint64_t v3;
  UniChar *v4;
  const char *CStringPtr;
  UniChar *v6;
  uint64_t v7;
  char v8;
  uint64_t v9;
  unint64_t v10;
  int v11;
  char v12;
  int64_t v13;
  UniChar v14;
  unsigned int v15;
  int64_t v16;
  int64_t v17;
  uint64_t v18;
  int64_t v19;
  int64_t v20;
  UniChar v21;
  int64_t v22;
  int64_t v23;
  uint64_t v24;
  uint64_t v25;
  int v26;
  uint64_t v27;
  UniChar *v28;
  uint64_t v29;
  unint64_t v30;
  int v31;
  void *v32;
  char v34;
  UniChar buffer[8];
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  CFStringRef theString[2];
  __int128 v44;
  int64_t v45;
  int64_t v46;
  int64_t v47;
  CFRange v48;
  CFRange v49;

  v47 = 0xAAAAAAAAAAAAAAAALL;
  *(_QWORD *)&v2 = 0xAAAAAAAAAAAAAAAALL;
  *((_QWORD *)&v2 + 1) = 0xAAAAAAAAAAAAAAAALL;
  v44 = 0xAAAAAAAAAAAAAAAALL;
  v46 = 0xAAAAAAAAAAAAAAAALL;
  v42 = v2;
  v40 = v2;
  v41 = v2;
  v38 = v2;
  v39 = v2;
  v36 = v2;
  v37 = v2;
  *(_OWORD *)buffer = v2;
  v3 = -[__CFString length](a1, "length");
  v4 = (UniChar *)NSZoneMalloc(0, 2 * v3 + 2);
  theString[0] = a1;
  v45 = v3;
  theString[1] = (CFStringRef)CFStringGetCharactersPtr(a1);
  if (theString[1])
    CStringPtr = 0;
  else
    CStringPtr = CFStringGetCStringPtr(a1, 0x600u);
  v46 = 0;
  v47 = 0;
  *(_QWORD *)&v44 = CStringPtr;
  v6 = v4;
  v7 = MEMORY[0x24BDAC740];
  if (v3)
  {
    v8 = 0;
    v9 = 0;
    v10 = 0;
    v11 = 0;
    v34 = 0;
    v12 = 1;
    v6 = v4;
    do
    {
      if ((v10 & 0x8000000000000000) != 0 || (v13 = v45, v45 <= (uint64_t)v10))
      {
        if ((v8 & 1) != 0)
        {
          *v6++ = 0;
          v8 = 1;
        }
        else
        {
          if (v11 <= 0)
          {
            v15 = 0;
            v14 = 0;
            goto LABEL_15;
          }
          v8 = 0;
        }
      }
      else
      {
        if (theString[1])
        {
          v14 = *((_WORD *)&theString[1]->isa + *((_QWORD *)&v44 + 1) + v10);
        }
        else if ((_QWORD)v44)
        {
          v14 = *(char *)(v44 + *((_QWORD *)&v44 + 1) + v10);
        }
        else
        {
          if (v47 <= (uint64_t)v10 || (v16 = v46, v46 > (uint64_t)v10))
          {
            v17 = v10 - 4;
            if (v10 < 4)
              v17 = 0;
            v18 = v9;
            if (v17 + 64 < v45)
              v13 = v17 + 64;
            v46 = v17;
            v47 = v13;
            v48.location = *((_QWORD *)&v44 + 1) + v17;
            v48.length = v13 - v17;
            CFStringGetCharacters(theString[0], v48, buffer);
            v9 = v18;
            v16 = v46;
          }
          v14 = buffer[v10 - v16];
        }
        v15 = v14;
        if (v14 == 92)
        {
          v19 = v10 + 1;
          if (v10 + 1 < v3)
          {
            *v6 = 92;
            v20 = v45;
            if (v45 <= v19)
            {
              v21 = 0;
            }
            else if (theString[1])
            {
              v21 = *((_WORD *)&theString[1]->isa + *((_QWORD *)&v44 + 1) + v19);
            }
            else if ((_QWORD)v44)
            {
              v21 = *(char *)(v44 + *((_QWORD *)&v44 + 1) + v19);
            }
            else
            {
              if (v47 <= v19 || (v22 = v46, v46 > v19))
              {
                v23 = v10 - 3;
                if (v10 < 3)
                  v23 = 0;
                v24 = v9;
                if (v23 + 64 < v45)
                  v20 = v23 + 64;
                v46 = v23;
                v47 = v20;
                v49.location = *((_QWORD *)&v44 + 1) + v23;
                v49.length = v20 - v23;
                CFStringGetCharacters(theString[0], v49, buffer);
                v9 = v24;
                v22 = v46;
              }
              v21 = buffer[v19 - v22];
            }
            v6[1] = v21;
            v6 += 2;
            v10 = v19;
            goto LABEL_64;
          }
          if ((v8 & 1) == 0)
          {
            if (v11 <= 0)
            {
              v15 = 92;
              v14 = 92;
              goto LABEL_15;
            }
LABEL_45:
            v8 = 0;
            v11 -= v14 == 41;
            goto LABEL_64;
          }
LABEL_38:
          *v6++ = v14;
          v8 = v14 != 34;
          goto LABEL_64;
        }
        if ((v8 & 1) != 0)
          goto LABEL_38;
        if (v14 == 40)
        {
          v8 = 0;
          ++v11;
        }
        else
        {
          if (v11 > 0)
            goto LABEL_45;
          if (v14 == 60)
          {
            v9 = 0;
            v8 = 0;
            v34 = 1;
            v6 = v4;
          }
          else
          {
            if ((v34 & (v14 == 62)) == 0)
            {
              if (v14 > 0x7Fu)
              {
                v25 = v9;
                v26 = __maskrune(v14, 0x4000uLL);
                v9 = v25;
                if (!v26)
                {
LABEL_61:
                  if ((v9 & 1) == 0)
                    *v6++ = v14;
                  v12 = 0;
                  v8 |= v14 == 34;
                  goto LABEL_64;
                }
                goto LABEL_16;
              }
LABEL_15:
              if ((*(_DWORD *)(v7 + 4 * v15 + 60) & 0x4000) == 0)
                goto LABEL_61;
LABEL_16:
              v8 = 0;
              if ((v12 & 1) == 0)
                *v6++ = 32;
              v12 = 1;
              goto LABEL_64;
            }
            v34 = 0;
            v8 = 0;
            v9 = 1;
          }
        }
      }
LABEL_64:
      ++v10;
    }
    while (v10 < v3);
  }
  v27 = (char *)v6 - (char *)v4;
  do
  {
    v28 = v6;
    v29 = v27;
    if (v6 <= v4)
      break;
    --v6;
    v30 = *(v28 - 1);
    v31 = v30 > 0x7F ? __maskrune(v30, 0x4000uLL) : *(_DWORD *)(v7 + 4 * v30 + 60) & 0x4000;
    v27 = v29 - 2;
  }
  while (v31);
  *v28 = 0;
  v32 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithCharacters:length:", v4, v29 >> 1);
  NSZoneFree(0, v4);
  return v32;
}

- (id)ea_uncommentedAddressRespectingGroups
{
  uint64_t v2;
  uint64_t v3;
  id v5;

  v2 = objc_msgSend(a1, "rangeOfString:", CFSTR("@"));
  v3 = objc_msgSend(a1, "rangeOfString:", CFSTR("<"));
  if (v2 == 0x7FFFFFFFFFFFFFFFLL && v3 == 0x7FFFFFFFFFFFFFFFLL)
  {
    v5 = a1;
  }
  else
  {
    objc_msgSend(a1, "ea_uncommentedAddress");
    v5 = (id)objc_claimAutoreleasedReturnValue();
  }
  return v5;
}

- (BOOL)ea_isLegalEmailAddress
{
  __CFString *v2;
  unint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  BOOL v7;
  _BOOL8 v9;
  int64_t v10;
  __int128 v11;
  const char *CStringPtr;
  uint64_t v13;
  _BOOL4 v14;
  uint64_t v15;
  uint64_t v16;
  BOOL v17;
  int64_t v18;
  char v19;
  uint64_t v20;
  uint64_t v21;
  int64_t v22;
  UniChar v23;
  int64_t v24;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  int64_t v29;
  int64_t v30;
  char v31;
  const char *v32;
  uint64_t v33;
  int64_t v34;
  uint64_t v35;
  char v36;
  BOOL v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  int64_t v41;
  UniChar v42;
  int64_t v43;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  int64_t v48;
  int64_t v49;
  int v50;
  void *v51;
  void *v52;
  void *v53;
  char v55;
  __CFString *v56;
  addrinfo *v57;
  addrinfo buffer;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  CFStringRef theString;
  const UniChar *CharactersPtr;
  unint64_t v66;
  uint64_t v67;
  int64_t v68;
  int64_t v69;
  int64_t v70;
  CFRange v71;
  CFRange v72;

  if (ea_isLegalEmailAddress_onceToken != -1)
    dispatch_once(&ea_isLegalEmailAddress_onceToken, &__block_literal_global_2);
  +[EAEmailAddressParser idnaEncodedAddressForAddress:](EAEmailAddressParser, "idnaEncodedAddressForAddress:", a1);
  v2 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v3 = +[EAEmailAddressParser rangeOfAddressDomainFromAddress:](EAEmailAddressParser, "rangeOfAddressDomainFromAddress:", v2);
  v4 = v3;
  v6 = v5;
  if (v2)
    v7 = v3 == 0x7FFFFFFFFFFFFFFFLL;
  else
    v7 = 1;
  if (v7 || v3 < 2)
  {
    v9 = 0;
    goto LABEL_90;
  }
  v10 = v3 - 1;
  *(_QWORD *)&v11 = 0xAAAAAAAAAAAAAAAALL;
  *((_QWORD *)&v11 + 1) = 0xAAAAAAAAAAAAAAAALL;
  v69 = 0xAAAAAAAAAAAAAAAALL;
  v66 = 0xAAAAAAAAAAAAAAAALL;
  v62 = v11;
  v63 = v11;
  v60 = v11;
  v61 = v11;
  *(_OWORD *)&buffer.ai_addr = v11;
  v59 = v11;
  *(_OWORD *)&buffer.ai_flags = v11;
  *(_OWORD *)&buffer.ai_addrlen = v11;
  theString = v2;
  v67 = 0;
  v68 = v3 - 1;
  v70 = 0xAAAAAAAAAAAAAAAALL;
  CharactersPtr = CFStringGetCharactersPtr(v2);
  if (CharactersPtr)
    CStringPtr = 0;
  else
    CStringPtr = CFStringGetCStringPtr(v2, 0x600u);
  v69 = 0;
  v70 = 0;
  v66 = (unint64_t)CStringPtr;
  if (v4 < 2)
  {
    v13 = 0;
    v14 = 0;
    v15 = 0x7FFFFFFFFFFFFFFFLL;
    goto LABEL_89;
  }
  v56 = v2;
  v16 = 0;
  v17 = 0;
  v18 = 0;
  v19 = 0;
  v20 = 64;
  do
  {
    if ((unint64_t)v18 >= 4)
      v21 = 4;
    else
      v21 = v18;
    v22 = v68;
    if (v68 <= v18)
    {
      v23 = 0;
LABEL_39:
      if (!objc_msgSend((id)ea_isLegalEmailAddress_validLocalPartSet, "characterIsMember:", v23))
        break;
      v31 = 1;
      goto LABEL_41;
    }
    if (CharactersPtr)
    {
      v23 = CharactersPtr[v18 + v67];
    }
    else if (v66)
    {
      v23 = *(char *)(v66 + v67 + v18);
    }
    else
    {
      v24 = v69;
      if (v70 <= v18 || v69 > v18)
      {
        v26 = -v21;
        v27 = v21 + v16;
        v28 = v20 - v21;
        v29 = v18 + v26;
        v30 = v29 + 64;
        if (v29 + 64 >= v68)
          v30 = v68;
        v69 = v29;
        v70 = v30;
        if (v68 >= v28)
          v22 = v28;
        v71.length = v22 + v27;
        v71.location = v29 + v67;
        CFStringGetCharacters(theString, v71, (UniChar *)&buffer);
        v24 = v69;
      }
      v23 = *((_WORD *)&buffer.ai_flags + v18 - v24);
    }
    if (v23 != 46)
      goto LABEL_39;
    v31 = 0;
    if ((v19 & 1) == 0)
    {
      v13 = 0;
      v14 = 0;
      v15 = 0x7FFFFFFFFFFFFFFFLL;
LABEL_88:
      v2 = v56;
      goto LABEL_89;
    }
LABEL_41:
    v17 = ++v18 >= v10;
    --v16;
    ++v20;
    v19 = v31;
  }
  while (v10 != v18);
  v14 = 0;
  v13 = 0;
  v15 = 0x7FFFFFFFFFFFFFFFLL;
  if ((v19 & 1) == 0)
    goto LABEL_88;
  v2 = v56;
  if (!v17)
    goto LABEL_89;
  theString = v56;
  v67 = v4;
  v68 = v6;
  CharactersPtr = CFStringGetCharactersPtr(v56);
  if (CharactersPtr)
    v32 = 0;
  else
    v32 = CFStringGetCStringPtr(v56, 0x600u);
  v66 = (unint64_t)v32;
  v69 = 0;
  v70 = 0;
  if (v6 < 1)
  {
    v14 = 0;
    goto LABEL_87;
  }
  v33 = 0;
  v34 = 0;
  v35 = 0;
  v55 = 0;
  v36 = 0;
  v37 = 1;
  v38 = 64;
  v39 = 0x7FFFFFFFFFFFFFFFLL;
  while (2)
  {
    if ((unint64_t)v34 >= 4)
      v40 = 4;
    else
      v40 = v34;
    v41 = v68;
    if (v68 <= v34)
    {
      v42 = 0;
    }
    else
    {
      if (CharactersPtr)
      {
        v42 = CharactersPtr[v34 + v67];
      }
      else if (v66)
      {
        v42 = *(char *)(v66 + v67 + v34);
      }
      else
      {
        v43 = v69;
        if (v70 <= v34 || v69 > v34)
        {
          v45 = -v40;
          v46 = v40 + v33;
          v47 = v38 - v40;
          v48 = v34 + v45;
          v49 = v48 + 64;
          if (v48 + 64 >= v68)
            v49 = v68;
          v69 = v48;
          v70 = v49;
          if (v68 >= v47)
            v41 = v47;
          v72.length = v41 + v46;
          v72.location = v48 + v67;
          CFStringGetCharacters(theString, v72, (UniChar *)&buffer);
          v43 = v69;
        }
        v42 = *((_WORD *)&buffer.ai_flags + v34 - v43);
      }
      if (v42 == 46)
      {
        if ((v36 & 1) == 0)
          break;
        v36 = 0;
        v35 = 0;
        v39 = 0x7FFFFFFFFFFFFFFFLL;
        v55 = 1;
        goto LABEL_77;
      }
    }
    if (objc_msgSend((id)ea_isLegalEmailAddress_validDomainPartSet, "characterIsMember:", v42))
    {
      v36 = 1;
      if (v39 == 0x7FFFFFFFFFFFFFFFLL)
        v35 = 1;
      else
        ++v35;
      if (v39 == 0x7FFFFFFFFFFFFFFFLL)
        v39 = v4 + v34;
LABEL_77:
      v37 = ++v34 < v6;
      --v33;
      ++v38;
      if (v6 == v34)
      {
        v50 = 1;
        goto LABEL_81;
      }
      continue;
    }
    break;
  }
  v50 = 0;
LABEL_81:
  if (((v39 != 0x7FFFFFFFFFFFFFFFLL) & v55) != 0)
    v14 = v50;
  else
    v14 = 0;
  if (!v37 && ((v39 != 0x7FFFFFFFFFFFFFFFLL) & v55) != 0)
  {
    -[__CFString substringWithRange:](v56, "substringWithRange:", v39, v35);
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v51, "rangeOfCharacterFromSet:", ea_isLegalEmailAddress_invalidTLDPartSet) == 0x7FFFFFFFFFFFFFFFLL;

  }
LABEL_87:
  v15 = v4;
  v13 = v6;
LABEL_89:
  v9 = v14;
  v4 = v15;
  v6 = v13;
  if (!v14)
  {
LABEL_90:
    if (v6)
    {
      -[__CFString substringWithRange:](v2, "substringWithRange:", v4, v6);
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      v53 = v52;
      if (v52 && objc_msgSend(v52, "length"))
      {
        v57 = 0;
        memset(&buffer, 0, sizeof(buffer));
        buffer.ai_flags = 4;
        v9 = 0;
        if (!getaddrinfo((const char *)objc_msgSend(objc_retainAutorelease(v53), "UTF8String"), 0, &buffer, &v57)
          && v57)
        {
          v9 = v57->ai_addr != 0;
          freeaddrinfo(v57);
        }
      }
      else
      {
        v9 = 0;
      }

    }
  }

  return v9;
}

- (id)ea_addressCommentPersonNameComponents
{
  void *v2;
  void *v3;

  objc_msgSend(a1, "ea_addressComment");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v2, "isEqualToString:", a1))
  {

    v2 = 0;
  }
  objc_msgSend(v2, "ea_personNameComponents");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)ea_addressComment
{
  id v1;
  size_t v2;
  char *v3;
  void *v4;
  size_t v5;
  unsigned __int8 *v6;
  unsigned __int8 *v7;

  v1 = a1;
  v2 = objc_msgSend(v1, "maximumLengthOfBytesUsingEncoding:", 4) + 1;
  v3 = (char *)malloc_type_malloc(v2, 0xE4F97978uLL);
  v4 = v1;
  if (objc_msgSend(v1, "getCString:maxLength:encoding:", v3, v2, 4))
  {
    v5 = strlen(v3);
    v6 = (unsigned __int8 *)malloc_type_malloc(v5 + 1, 0xCEE1A32BuLL);
    v7 = EAAddressComment((unsigned __int8 *)v3, v5, v6);
    v4 = v1;
    if (v7 != (unsigned __int8 *)v3)
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", v7);
      v4 = (void *)objc_claimAutoreleasedReturnValue();

    }
    free(v6);
  }
  free(v3);

  return v4;
}

- (uint64_t)ea_isLegalCommentedEmailAddress
{
  void *v1;
  uint64_t v2;

  objc_msgSend(a1, "ea_uncommentedAddressRespectingGroups");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "ea_isLegalEmailAddress");

  return v2;
}

- (BOOL)ea_isEqualToEmailAddress:()EmailAddressingAdditions
{
  return objc_msgSend(a1, "caseInsensitiveCompare:") == 0;
}

@end
