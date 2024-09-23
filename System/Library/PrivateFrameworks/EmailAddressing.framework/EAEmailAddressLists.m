@implementation EAEmailAddressLists

+ (id)addressListFromHeaderValue:(id)a3
{
  unint64_t v3;
  const char *CStringPtr;
  unint64_t v6;
  uint64_t v7;
  UniChar v8;
  int64_t v9;
  UniChar *v10;
  uint64_t v11;
  UniChar v12;
  int v13;
  unint64_t v14;
  uint64_t v15;
  int v16;
  uint64_t v17;
  BOOL v18;
  char v19;
  uint64_t v20;
  int v21;
  int v22;
  uint64_t v23;
  BOOL v24;
  uint64_t v25;
  uint64_t v26;
  unint64_t v27;
  unint64_t v28;
  unint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  int64_t v33;
  uint64_t v34;
  int64_t v35;
  UniChar v36;
  uint64_t v37;
  BOOL v38;
  uint64_t v39;
  uint64_t v40;
  int64_t v41;
  uint64_t v42;
  uint64_t v43;
  int64_t v44;
  uint64_t v45;
  uint64_t v47;
  unint64_t v48;
  uint64_t v49;
  uint64_t v51;
  uint64_t v52;
  void *v53;
  void *v54;
  id v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  void *v59;
  int64_t v60;
  int64_t v61;
  UniChar *v62;
  int64_t v63;
  UniChar v64;
  uint64_t v65;
  uint64_t v67;
  int64_t v69;
  uint64_t v70;
  uint64_t v71;
  unint64_t v72;
  int64_t v73;
  uint64_t v74;
  int64_t v75;
  UniChar v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  int64_t v80;
  uint64_t v81;
  int64_t v82;
  uint64_t v83;
  UniChar *v85;
  id v86;
  __CFString *theString;
  unint64_t v88;
  unint64_t v89;
  int v90;
  uint64_t v91;
  UniChar v92;
  __int128 v93;
  __int128 v94;
  __int128 v95;
  __int128 v96;
  UniChar buffer[8];
  __int128 v98;
  __int128 v99;
  __int128 v100;
  __int128 v101;
  __int128 v102;
  __int128 v103;
  __int128 v104;
  CFStringRef v105;
  const UniChar *CharactersPtr;
  const char *v107;
  uint64_t v108;
  int64_t v109;
  uint64_t v110;
  uint64_t v111;
  _BYTE v112[128];
  uint64_t v113;
  CFRange v114;
  CFRange v115;
  CFRange v116;
  CFRange v117;

  v113 = *MEMORY[0x24BDAC8D0];
  theString = (__CFString *)a3;
  v3 = -[__CFString length](theString, "length");
  if ((uint64_t)v3 >= 1)
  {
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v86 = (id)objc_claimAutoreleasedReturnValue();
    v103 = 0u;
    v104 = 0u;
    v101 = 0u;
    v102 = 0u;
    v99 = 0u;
    v100 = 0u;
    *(_OWORD *)buffer = 0u;
    v98 = 0u;
    v105 = theString;
    v108 = 0;
    v109 = v3;
    CharactersPtr = CFStringGetCharactersPtr(theString);
    if (CharactersPtr)
      CStringPtr = 0;
    else
      CStringPtr = CFStringGetCStringPtr(theString, 0x600u);
    v6 = 0;
    v90 = 0;
    v91 = 0;
    v92 = 0;
    v7 = 0;
    v110 = 0;
    v111 = 0;
    v107 = CStringPtr;
    v85 = &buffer[1];
    while (1)
    {
      v8 = v92;
      v9 = v109;
      if (v109 <= v7)
      {
        v12 = 0;
      }
      else
      {
        v10 = (UniChar *)CharactersPtr;
        if (CharactersPtr)
        {
          v11 = v108 + v7;
LABEL_11:
          v12 = v10[v11];
          goto LABEL_13;
        }
        if (!v107)
        {
          v49 = v110;
          if (v111 <= v7 || v110 > v7)
          {
            v51 = v7 - 4;
            if ((unint64_t)v7 < 4)
              v51 = 0;
            if (v51 + 64 < v109)
              v9 = v51 + 64;
            v110 = v51;
            v111 = v9;
            v115.location = v108 + v51;
            v115.length = v9 - v51;
            CFStringGetCharacters(v105, v115, buffer);
            v49 = v110;
          }
          v11 = v7 - v49;
          v10 = buffer;
          goto LABEL_11;
        }
        v12 = v107[v108 + v7];
      }
LABEL_13:
      v13 = v12;
      v92 = v12;
      if (((1 << v12) & 0x100000600) != 0)
        v14 = v6 + 1;
      else
        v14 = v6;
      if (v13 > 0x20)
        v14 = v6;
      if (v7 == v6)
        v6 = v14;
      if (v13 <= 40)
      {
        v20 = v91;
        v21 = v90;
        v22 = v90 ^ (v91 == 0);
        v23 = v91 + ((v90 & 1) == 0);
        if (v13 != 40)
          v23 = v91;
        v24 = v13 == 34;
        v19 = 0;
        if (!v24)
          v20 = v23;
        v91 = v20;
        if (v24)
          v21 = v22;
        v90 = v21;
      }
      else
      {
        switch(v13)
        {
          case ')':
            v19 = 0;
            v25 = v91 - 1;
            if (!v91)
              v25 = 0;
            v91 = v25;
            break;
          case ',':
            v26 = v91;
            v19 = (v90 | (v91 != 0)) ^ 1;
            if (!(v90 & 1 | (v91 != 0)))
              v26 = 0;
            v91 = v26;
            break;
          case '\\':
            v15 = v91;
            v16 = v90;
            if (v7 + 1 >= v3)
              v17 = v7;
            else
              v17 = v7 + 1;
            v18 = (v90 & 1 | (v91 != 0)) == 0;
            if (v90 & 1 | (v91 != 0))
              v7 = v17;
            v19 = 0;
            if (!(v90 & 1 | (v91 != 0)))
              v15 = 0;
            v91 = v15;
            if (v18)
              v16 = 0;
            v90 = v16;
            break;
          default:
            v19 = 0;
            break;
        }
      }
      v27 = v7 + 1;
      if ((v19 & 1) != 0 || v27 == v3)
      {
        v28 = v3;
        if ((v19 & 1) != 0)
        {
          v28 = v7;
          if (v8 != 62)
          {
            v29 = v7 + 1;
            if (v27 < v3)
            {
              v29 = v7 + 1;
              if (v7 >= -1)
              {
                v30 = ~v7;
                v31 = v7 + 65;
                v29 = v7 + 1;
                v32 = v7;
                while (1)
                {
                  v33 = v32 + 1;
                  v34 = v29 >= 4 ? 4 : v29;
                  v35 = v109;
                  if (v109 <= v33)
                    break;
                  if (CharactersPtr)
                  {
                    v36 = CharactersPtr[v32 + 1 + v108];
                  }
                  else if (v107)
                  {
                    v36 = v107[v108 + 1 + v32];
                  }
                  else
                  {
                    v37 = v110;
                    v38 = v111 > v33 && v110 <= v33;
                    if (!v38)
                    {
                      v39 = -v34;
                      v40 = v34 + v30;
                      v41 = v31 - v34;
                      v42 = v32 + v39;
                      v43 = v42 + 1;
                      v44 = v42 + 65;
                      if (v44 >= v109)
                        v44 = v109;
                      v110 = v43;
                      v111 = v44;
                      if (v109 >= v41)
                        v35 = v41;
                      v114.length = v35 + v40;
                      v114.location = v43 + v108;
                      CFStringGetCharacters(v105, v114, buffer);
                      v37 = v110;
                    }
                    v36 = v85[v32 - v37];
                  }
                  v38 = v36 > 0x20u;
                  v45 = (1 << v36) & 0x100000600;
                  if (v38 || v45 == 0)
                  {
                    v29 = v32 + 1;
                    break;
                  }
                  ++v29;
                  v47 = v32 + 1;
                  v48 = v32 + 2;
                  --v30;
                  ++v31;
                  ++v32;
                  if (v48 >= v3)
                  {
                    v29 = v47 + 1;
                    break;
                  }
                }
                v27 = v7 + 1;
              }
            }
            if (addressListFromHeaderValue__onceToken != -1)
              dispatch_once(&addressListFromHeaderValue__onceToken, &__block_literal_global_0);
            if (v3 - v29 >= 6)
              v52 = 6;
            else
              v52 = v3 - v29;
            -[__CFString substringWithRange:](theString, "substringWithRange:", v29, v52, v85);
            v53 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v53, "lowercaseString");
            v54 = (void *)objc_claimAutoreleasedReturnValue();

            v88 = v27;
            v95 = 0u;
            v96 = 0u;
            v93 = 0u;
            v94 = 0u;
            v55 = (id)addressListFromHeaderValue__nameExtensions;
            v56 = objc_msgSend(v55, "countByEnumeratingWithState:objects:count:", &v93, v112, 16);
            if (v56)
            {
              v57 = *(_QWORD *)v94;
              do
              {
                v58 = 0;
                do
                {
                  if (*(_QWORD *)v94 != v57)
                    objc_enumerationMutation(v55);
                  v59 = *(void **)(*((_QWORD *)&v93 + 1) + 8 * v58);
                  if (!objc_msgSend(v54, "hasPrefix:", v59))
                    goto LABEL_116;
                  v60 = objc_msgSend(v59, "length") + v29;
                  if (v60 >= v3)
                    goto LABEL_116;
                  v61 = v109;
                  if (v109 <= v60)
                    goto LABEL_116;
                  v62 = (UniChar *)CharactersPtr;
                  if (CharactersPtr)
                  {
                    v63 = v108 + v60;
LABEL_108:
                    v64 = v62[v63];
                    goto LABEL_111;
                  }
                  if (!v107)
                  {
                    v67 = v110;
                    if (v111 <= v60 || v110 > v60)
                    {
                      v69 = v60 - 4;
                      if ((unint64_t)v60 < 4)
                        v69 = 0;
                      if (v69 + 64 < v109)
                        v61 = v69 + 64;
                      v110 = v69;
                      v111 = v61;
                      v116.location = v108 + v69;
                      v116.length = v61 - v69;
                      CFStringGetCharacters(v105, v116, buffer);
                      v67 = v110;
                    }
                    v63 = v60 - v67;
                    v62 = buffer;
                    goto LABEL_108;
                  }
                  v64 = v107[v108 + v60];
LABEL_111:
                  v38 = v64 > 0x2Cu;
                  v65 = (1 << v64) & 0x100100000600;
                  if (!v38 && v65 != 0)
                  {
                    v7 = v60;
                    goto LABEL_157;
                  }
LABEL_116:
                  ++v58;
                }
                while (v56 != v58);
                v70 = objc_msgSend(v55, "countByEnumeratingWithState:objects:count:", &v93, v112, 16);
                v56 = v70;
              }
              while (v70);
            }

            v27 = v88;
            v28 = v7;
          }
        }
        if (v6 >= v28)
        {
          v6 = v27;
        }
        else
        {
          v89 = v27;
          v71 = -(uint64_t)v28;
          v72 = v28 + 64;
          while (1)
          {
            v73 = v28 - 1;
            v74 = v28 >= 5 ? 5 : v28;
            if (v73 < 0)
              break;
            v75 = v109;
            if (v109 <= v73)
              break;
            if (CharactersPtr)
            {
              v76 = CharactersPtr[v28 - 1 + v108];
            }
            else if (v107)
            {
              v76 = v107[v108 - 1 + v28];
            }
            else
            {
              if (v111 <= v73 || (v77 = v110, v110 > v73))
              {
                v78 = -v74;
                v79 = v74 + v71;
                v80 = v72 - v74;
                v81 = v28 + v78;
                v82 = v81 + 64;
                if (v81 + 64 >= v109)
                  v82 = v109;
                v110 = v81;
                v111 = v82;
                if (v109 >= v80)
                  v75 = v80;
                v117.length = v75 + v79;
                v117.location = v81 + v108;
                CFStringGetCharacters(v105, v117, buffer);
                v77 = v110;
              }
              v76 = buffer[v28 - 1 - v77];
            }
            v38 = v76 > 0x20u;
            v83 = (1 << v76) & 0x100000600;
            if (v38 || v83 == 0)
              break;
            ++v71;
            --v72;
            --v28;
            if (v6 >= v73)
            {
              v6 = v89;
              goto LABEL_158;
            }
          }
          -[__CFString substringWithRange:](theString, "substringWithRange:", v6, v28 - v6, v85);
          v54 = (void *)objc_claimAutoreleasedReturnValue();
          +[EAEmailAddressParser idnaDecodedAddressForAddress:](EAEmailAddressParser, "idnaDecodedAddressForAddress:", v54);
          v6 = v89;
          v55 = (id)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v86, "addObject:", v55);
LABEL_157:

        }
      }
LABEL_158:
      if (++v7 >= v3)
        goto LABEL_5;
    }
  }
  v86 = (id)MEMORY[0x24BDBD1A8];
LABEL_5:

  return v86;
}

void __50__EAEmailAddressLists_addressListFromHeaderValue___block_invoke()
{
  void *v0;

  v0 = (void *)addressListFromHeaderValue__nameExtensions;
  addressListFromHeaderValue__nameExtensions = (uint64_t)&unk_24C2B88A8;

}

+ (id)componentsSeparatedByCommaRespectingQuotesAndParensForString:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;

  v4 = a3;
  if (!componentsSeparatedByCommaRespectingQuotesAndParensForString__addressCharacterSet)
  {
    v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithFormat:", CFSTR(",%C%C%C"), 10, 13, 65532);
    objc_msgSend(MEMORY[0x24BDD14A8], "characterSetWithCharactersInString:", v5);
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = (void *)componentsSeparatedByCommaRespectingQuotesAndParensForString__addressCharacterSet;
    componentsSeparatedByCommaRespectingQuotesAndParensForString__addressCharacterSet = v6;

  }
  objc_msgSend(a1, "componentsSeparatedByCharactersRespectingQuotesAndParens:forString:");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

+ (id)componentsSeparatedByCharactersRespectingQuotesAndParens:(id)a3 forString:(id)a4
{
  id v5;
  id v6;
  unsigned __int16 *v7;
  uint64_t v8;
  unsigned __int16 *v9;
  char v10;
  void *v11;
  uint64_t v12;
  unsigned __int16 *v13;
  unsigned __int16 *v14;
  unsigned int v15;
  char v16;
  void *v17;
  void *v18;
  id v20;

  v5 = a3;
  v6 = a4;
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v20 = (id)objc_claimAutoreleasedReturnValue();
  v7 = (unsigned __int16 *)NSZoneMalloc(0, 2 * objc_msgSend(v6, "length"));
  objc_msgSend(v6, "getCharacters:", v7);
  v8 = objc_msgSend(v6, "length");
  v9 = &v7[v8];
  if (v8 >= 1)
  {
    v10 = 0;
    v11 = 0;
    v12 = 0;
    v13 = v7;
    v14 = v7;
    while (1)
    {
      v15 = *v13;
      if (v15 > 0x28)
      {
        if (v15 == 41)
        {
          if (v12)
            --v12;
          else
            v12 = 0;
          goto LABEL_16;
        }
        if (v15 == 92)
        {
          v16 = v10 | (v12 != 0);
          if (!(v10 & 1 | (v12 != 0)))
            v12 = 0;
          v13 += v16 & 1;
          goto LABEL_16;
        }
      }
      else
      {
        if (v15 == 34)
        {
          v10 ^= v12 == 0;
          goto LABEL_16;
        }
        if (v15 == 40)
        {
          v12 += (v10 & 1) == 0;
          goto LABEL_16;
        }
      }
      if (!(v10 & 1 | ((objc_msgSend(v5, "characterIsMember:") & 1) == 0)) && !v12)
      {
        objc_msgSend(v6, "substringWithRange:", v14 - v7, v13 - v14);
        v17 = (void *)objc_claimAutoreleasedReturnValue();

        if (objc_msgSend(v17, "length"))
          objc_msgSend(v20, "addObject:", v17);
        v12 = 0;
        v10 = 0;
        v14 = v13 + 1;
        goto LABEL_17;
      }
LABEL_16:
      v17 = v11;
LABEL_17:
      ++v13;
      v11 = v17;
      if (v13 >= v9)
        goto LABEL_25;
    }
  }
  v17 = 0;
  v14 = v7;
LABEL_25:
  if (v14 < v9)
  {
    objc_msgSend(v6, "substringWithRange:", v14 - v7, v9 - v14);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    v17 = v18;
    if (objc_msgSend(v18, "length"))
      objc_msgSend(v20, "addObject:", v18);
  }
  NSZoneFree(0, v7);

  return v20;
}

+ (id)addressListFromAddressString:(id)a3
{
  objc_msgSend(a3, "componentsSeparatedByString:", CFSTR(", "));
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)addressStringFromAddressList:(id)a3
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  __CFString *v7;
  void *v8;
  CFIndex Length;
  const char *CStringPtr;
  uint64_t v11;
  uint64_t v12;
  char v13;
  __CFString *v14;
  uint64_t v15;
  UniChar *v16;
  uint64_t v17;
  UniChar v18;
  char v19;
  __CFString *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  id v26;
  void *v27;
  id obj;
  UniChar buffer[8];
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  CFStringRef theString[2];
  __int128 v38;
  __int128 v39;
  uint64_t v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  _BYTE v45[128];
  uint64_t v46;
  CFRange v47;

  v46 = *MEMORY[0x24BDAC8D0];
  v26 = a3;
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", objc_msgSend(v26, "count"));
  v43 = 0u;
  v44 = 0u;
  v41 = 0u;
  v42 = 0u;
  obj = v26;
  v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v41, v45, 16);
  if (v4)
  {
    v5 = *(_QWORD *)v42;
    v27 = v3;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v42 != v5)
          objc_enumerationMutation(obj);
        v7 = (__CFString *)*(id *)(*((_QWORD *)&v41 + 1) + 8 * i);
        +[EAEmailAddressParser displayNameFromAddress:](EAEmailAddressParser, "displayNameFromAddress:", v7);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_msgSend(v8, "isEqualToString:", v7) & 1) == 0
          && objc_msgSend(v8, "rangeOfString:", CFSTR(",")) != 0x7FFFFFFFFFFFFFFFLL)
        {
          Length = CFStringGetLength(v7);
          v38 = 0u;
          v36 = 0u;
          theString[1] = 0;
          v34 = 0u;
          v35 = 0u;
          v32 = 0u;
          v33 = 0u;
          v30 = 0u;
          v31 = 0u;
          *(_OWORD *)buffer = 0u;
          theString[0] = v7;
          v40 = 0;
          v39 = (unint64_t)Length;
          theString[1] = (CFStringRef)CFStringGetCharactersPtr(v7);
          if (theString[1])
            CStringPtr = 0;
          else
            CStringPtr = CFStringGetCStringPtr(v7, 0x600u);
          *(_QWORD *)&v38 = CStringPtr;
          *((_QWORD *)&v39 + 1) = 0;
          v40 = 0;
          if (Length >= 1)
          {
            v11 = 0;
            v12 = 0;
            v13 = 0;
            v14 = v7;
            while (1)
            {
              if ((v11 & 0x8000000000000000) == 0)
              {
                v15 = v39;
                if ((uint64_t)v39 > v11)
                  break;
              }
LABEL_38:
              if (++v11 >= Length)
                goto LABEL_49;
            }
            v16 = (UniChar *)theString[1];
            if (theString[1])
            {
              v17 = *((_QWORD *)&v38 + 1) + v11;
              goto LABEL_17;
            }
            if ((_QWORD)v38)
            {
              v18 = *(char *)(v38 + *((_QWORD *)&v38 + 1) + v11);
            }
            else
            {
              if (v40 <= v11 || (v22 = *((_QWORD *)&v39 + 1), *((uint64_t *)&v39 + 1) > v11))
              {
                v23 = v11 - 4;
                if ((unint64_t)v11 < 4)
                  v23 = 0;
                if (v23 + 64 < (uint64_t)v39)
                  v15 = v23 + 64;
                *((_QWORD *)&v39 + 1) = v23;
                v40 = v15;
                v47.location = *((_QWORD *)&v38 + 1) + v23;
                v47.length = v15 - v23;
                CFStringGetCharacters(theString[0], v47, buffer);
                v22 = *((_QWORD *)&v39 + 1);
              }
              v17 = v11 - v22;
              v16 = buffer;
LABEL_17:
              v18 = v16[v17];
            }
            if (v18 <= 0x28u)
            {
              if (v18 == 34)
              {
                v13 ^= v12 == 0;
              }
              else if (v18 == 40)
              {
                v12 += (v13 & 1) == 0;
              }
            }
            else
            {
              switch(v18)
              {
                case ')':
                  if (v12)
                    --v12;
                  else
                    v12 = 0;
                  break;
                case ',':
                  if (!(v13 & 1 | (v12 != 0)))
                  {
                    +[EAEmailAddressParser rawAddressFromFullAddress:](EAEmailAddressParser, "rawAddressFromFullAddress:", v7);
                    v20 = (__CFString *)objc_claimAutoreleasedReturnValue();
                    if (!v20)
                      v20 = v7;
                    +[EAEmailAddressGenerator formattedAddressWithName:email:useQuotes:](EAEmailAddressGenerator, "formattedAddressWithName:email:useQuotes:", v8, v20, 1, v26);
                    v21 = objc_claimAutoreleasedReturnValue();

                    v13 = 0;
                    v12 = 0;
                    v14 = (__CFString *)v21;
                    v11 = Length;
                  }
                  break;
                case '\\':
                  v19 = v13 | (v12 != 0);
                  if (!(v13 & 1 | (v12 != 0)))
                    v12 = 0;
                  v11 += v19 & 1;
                  break;
              }
            }
            goto LABEL_38;
          }
          v14 = v7;
LABEL_49:
          v7 = v14;
          v3 = v27;
        }
        objc_msgSend(v3, "addObject:", v7, v26);

      }
      v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v41, v45, 16);
    }
    while (v4);
  }

  objc_msgSend(v3, "componentsJoinedByString:", CFSTR(", "));
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  return v24;
}

+ (id)rawAddressListFromFullAddressList:(id)a3
{
  id v3;
  uint64_t v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  uint64_t v10;
  void *v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  v4 = objc_msgSend(v3, "count");
  if (v4)
  {
    objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = 0u;
    v16 = 0u;
    v13 = 0u;
    v14 = 0u;
    v6 = v3;
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    if (v7)
    {
      v8 = *(_QWORD *)v14;
      do
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v14 != v8)
            objc_enumerationMutation(v6);
          v10 = *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * i);
          +[EAEmailAddressParser rawAddressFromFullAddress:](EAEmailAddressParser, "rawAddressFromFullAddress:", v10, (_QWORD)v13);
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          if (v11)
            objc_msgSend(v5, "addObject:", v11);
          else
            objc_msgSend(v5, "addObject:", v10);

        }
        v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      }
      while (v7);
    }

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

+ (id)displayNameFromAddressList:(id)a3
{
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", objc_msgSend(v3, "count"));
  v14 = 0u;
  v15 = 0u;
  v12 = 0u;
  v13 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v13;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v13 != v7)
          objc_enumerationMutation(v5);
        +[EAEmailAddressParser displayNameFromAddress:](EAEmailAddressParser, "displayNameFromAddress:", *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * v8), (_QWORD)v12);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "addObject:", v9);

        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v6);
  }

  objc_msgSend(v4, "componentsJoinedByString:", CFSTR(", "));
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

+ (id)addressDisplayStringWithMaxNumberOfAddresses:(unint64_t)a3 fromAddressList:(id)a4
{
  id v5;
  uint64_t v6;
  unint64_t v7;
  __CFString *v8;
  void *v9;
  unint64_t v10;
  id v11;
  unint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v18;
  uint64_t v19;
  uint64_t (*v20)(uint64_t, uint64_t);
  void *v21;
  __CFString *v22;

  v5 = a4;
  v6 = objc_msgSend(v5, "count");
  v7 = v6;
  if (v6)
  {
    if (v6 == 1)
    {
      objc_msgSend(v5, "objectAtIndexedSubscript:", 0);
      v8 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      objc_msgSend(MEMORY[0x24BDD16A8], "string");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      if (v7 >= a3)
        v10 = v7 - a3;
      else
        v10 = 0;
      v11 = objc_alloc(MEMORY[0x24BDD15E0]);
      if (v7 <= a3)
        v12 = v7 - 1;
      else
        v12 = a3;
      v13 = (void *)objc_msgSend(v11, "initWithIndexesInRange:", 0, v12);
      v18 = MEMORY[0x24BDAC760];
      v19 = 3221225472;
      v20 = __84__EAEmailAddressLists_addressDisplayStringWithMaxNumberOfAddresses_fromAddressList___block_invoke;
      v21 = &unk_24C2B71F8;
      v8 = v9;
      v22 = v8;
      objc_msgSend(v5, "enumerateObjectsAtIndexes:options:usingBlock:", v13, 0, &v18);
      if (v7 <= a3)
      {
        _EFLocalizedString();
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "objectAtIndexedSubscript:", v7 - 1);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        -[__CFString appendFormat:](v8, "appendFormat:", v15, v16, v18, v19, v20, v21);
      }
      else
      {
        v14 = (void *)MEMORY[0x24BDD17C8];
        _EFLocalizedString();
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "localizedStringWithFormat:", v15, v10, v18, v19, v20, v21);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        -[__CFString appendString:](v8, "appendString:", v16);
      }

    }
  }
  else
  {
    v8 = &stru_24C2B7358;
  }

  return v8;
}

uint64_t __84__EAEmailAddressLists_addressDisplayStringWithMaxNumberOfAddresses_fromAddressList___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "appendFormat:", CFSTR("%@, "), a2);
}

@end
