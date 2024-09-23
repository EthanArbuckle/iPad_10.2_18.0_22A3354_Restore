void __CFPhoneNumberDeallocate(_QWORD *a1)
{
  void *v2;
  const void *v3;
  const void *v4;
  const void *v5;
  const void *v6;
  const void *v7;

  v2 = (void *)a1[2];
  if (v2)
    free(v2);
  v3 = (const void *)a1[3];
  if (v3)
    CFRelease(v3);
  v4 = (const void *)a1[4];
  if (v4)
    CFRelease(v4);
  v5 = (const void *)a1[5];
  if (v5)
    CFRelease(v5);
  v6 = (const void *)a1[6];
  if (v6)
    CFRelease(v6);
  v7 = (const void *)a1[7];
  if (v7)
    CFRelease(v7);
}

char *PNCopyBestGuessNormalizedNumberForCountry(char *result, __CFString *a2)
{
  char v2;
  __int128 v3[4];

  if (result)
  {
    if (a2)
    {
      memset(v3, 0, sizeof(v3));
      return _PNCopyBestGuessNumberForCountry((const __CFString *)result, a2, 1, v3, &v2);
    }
    else
    {
      return _PNCopyNormalized((const __CFString *)result);
    }
  }
  return result;
}

uint64_t _PNFindFormatRuleForDigitsWithCountry(const __CFString *a1, const __CFString *a2, int a3, uint64_t a4)
{
  unsigned int *v8;
  uint64_t v9;
  uint64_t InfoIndex;
  int v11;
  CFStringRef v12;
  int v14;

  v8 = (unsigned int *)PNGetFormatFileHeader();
  v9 = 0;
  if (a1 && a2 && v8)
  {
    if (a4)
    {
      *(_OWORD *)(a4 + 48) = 0u;
      *(_OWORD *)(a4 + 64) = 0u;
      *(_OWORD *)(a4 + 16) = 0u;
      *(_OWORD *)(a4 + 32) = 0u;
      *(_OWORD *)a4 = 0u;
      *(_QWORD *)(a4 + 64) = -1;
    }
    InfoIndex = UIPhoneFormatCountryGetInfoIndex(v8, a2);
    if ((_DWORD)InfoIndex == -1)
    {
      return 0;
    }
    else
    {
      v11 = InfoIndex;
      v14 = -1;
      v12 = _CreateFormattedNumberForDigitsWithCountryIndex(a1, InfoIndex, 0, 0, &v14, (_QWORD *)a4);
      if (v12)
        CFRelease(v12);
      LODWORD(v9) = a3 ^ 1;
      if (v14 == v11)
        return 1;
      else
        return v9;
    }
  }
  return v9;
}

CFHashCode __CFPhoneNumberHash(uint64_t a1)
{
  const void *v2;
  const void *v3;
  CFHashCode v4;
  _OWORD v6[3];
  UInt8 *bytes[2];

  memset(v6, 0, sizeof(v6));
  *(_OWORD *)bytes = unk_2064F3A90;
  __CFPhoneNumberNormalize((char *)a1);
  PNDecomposeForCountry(*(char **)(a1 + 16), *(const __CFString **)(a1 + 48), (uint64_t)v6);
  if (LODWORD(bytes[1]))
    v2 = CFStringCreateWithBytesNoCopy((CFAllocatorRef)*MEMORY[0x24BDBD240], bytes[0], LODWORD(bytes[1]), 0x8000100u, 0, (CFAllocatorRef)*MEMORY[0x24BDBD258]);
  else
    v2 = CFRetain(*(CFTypeRef *)(a1 + 40));
  v3 = v2;
  v4 = CFHash(v2);
  CFRelease(v3);
  return v4;
}

char *_PNCopyBestGuessNumberForCountry(const __CFString *a1, __CFString *a2, int a3, __int128 *a4, _BYTE *a5)
{
  __int128 *v9;
  UInt8 *v10;
  const __CFString *v11;
  CFIndex Length;
  CFIndex MaximumSizeForEncoding;
  char v14;
  unsigned int *v15;
  unsigned int *v16;
  int InfoIndex;
  int v18;
  unsigned int Count;
  unsigned int *v20;
  const char *v21;
  size_t v22;
  size_t v23;
  _BYTE *v24;
  size_t v25;
  const __CFString *v26;
  char valid;
  UInt8 **v28;
  unsigned int *v29;
  unsigned int *v30;
  unsigned int v31;
  unsigned int v32;
  uint64_t v33;
  size_t v34;
  size_t v35;
  char *v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  NSObject *v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  _BYTE usedBufLen[12];
  __int16 v47;
  __CFString *v48;
  __int16 v49;
  UInt8 *v50;
  uint64_t v51;
  CFRange v52;

  v51 = *MEMORY[0x24BDAC8D0];
  v44 = 0u;
  v45 = 0u;
  if (a4)
    v9 = a4;
  else
    v9 = &v42;
  v42 = 0uLL;
  v43 = 0uLL;
  if (a3)
  {
    v10 = _PNCopyNormalized(a1);
  }
  else
  {
    v11 = _PNCreateStringByStrippingFormattingAndNotVisiblyAllowable(a1);
    Length = CFStringGetLength(v11);
    MaximumSizeForEncoding = CFStringGetMaximumSizeForEncoding(Length, 0x8000100u);
    *(_QWORD *)usedBufLen = 0;
    v10 = (UInt8 *)malloc_type_malloc(MaximumSizeForEncoding + 1, 0xC347A27BuLL);
    v52.location = 0;
    v52.length = Length;
    CFStringGetBytes(v11, v52, 0x8000100u, 0, 0, v10, MaximumSizeForEncoding, (CFIndex *)usedBufLen);
    v10[*(_QWORD *)usedBufLen] = 0;
    CFRelease(v11);
  }
  v14 = _PNDecomposeForCountry((char *)v10, a2, (uint64_t)v9, 1);
  *a5 = v14;
  if ((v14 & 1) != 0)
    goto LABEL_23;
  v15 = (unsigned int *)PNGetFormatFileHeader();
  if (!a2)
    goto LABEL_23;
  v16 = v15;
  if (!v15)
    goto LABEL_23;
  InfoIndex = UIPhoneFormatCountryGetInfoIndex(v15, a2);
  if (InfoIndex == -1)
    goto LABEL_23;
  v18 = InfoIndex;
  Count = UIPhoneFormatCountryGetCount(v16);
  if (!v10)
    goto LABEL_23;
  if (!*(unsigned int *)((char *)&v16[3 * Count + 3] + v16[3 * v18 + 3]))
    goto LABEL_23;
  v20 = _PNGetITUCountryCode((unsigned int *)a2);
  if (!v20)
    goto LABEL_23;
  v21 = (const char *)v20;
  v22 = strlen((const char *)v10);
  v23 = strlen(v21);
  if (!v22 || v22 < v23 || strncmp((const char *)v10, v21, v23))
    goto LABEL_23;
  v24 = malloc_type_malloc(v22 + 2, 0x5F0EBBuLL);
  *v24 = 43;
  v24[v22 + 1] = 0;
  strncpy(v24 + 1, (const char *)v10, v22);
  v25 = strlen(v24);
  v26 = CFStringCreateWithBytesNoCopy((CFAllocatorRef)*MEMORY[0x24BDBD240], v24, v25, 0x8000100u, 0, (CFAllocatorRef)*MEMORY[0x24BDBD258]);
  valid = _PNIsValidPhoneNumberForCountry(v26, a2, 0, 0, 1);
  CFRelease(v26);
  if ((valid & 1) == 0)
  {
    free(v24);
LABEL_23:
    v24 = v10;
    goto LABEL_24;
  }
  *a5 = _PNDecomposeForCountry(v24, a2, (uint64_t)v9, 1);
  v28 = (UInt8 **)&v42;
  if (a4)
    v28 = (UInt8 **)a4;
  if (v10 == v28[6])
  {
    cpn_default_log();
    v41 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v41, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)usedBufLen = 138412802;
      *(_QWORD *)&usedBufLen[4] = a1;
      v47 = 2112;
      v48 = a2;
      v49 = 2080;
      v50 = v10;
      _os_log_fault_impl(&dword_2064EB000, v41, OS_LOG_TYPE_FAULT, "Decompose failure for digits %@ ISO country code %@; cannot deallocate %s",
        usedBufLen,
        0x20u);
    }

  }
  else
  {
    free(v10);
  }
LABEL_24:
  if (*v24 == 43)
  {
    v44 = 0u;
    v45 = 0u;
    v42 = 0u;
    v43 = 0u;
    v29 = (unsigned int *)PNGetFormatFileHeader();
    if (a2)
    {
      v30 = v29;
      if (v29)
      {
        v31 = UIPhoneFormatCountryGetInfoIndex(v29, a2);
        if (v31 != -1)
        {
          v32 = v31;
          v33 = (uint64_t)&v30[3 * UIPhoneFormatCountryGetCount(v30) + 1] + v30[3 * v31 + 3];
          *(_QWORD *)usedBufLen = 0;
          v34 = strlen(v24);
          if (_InternationalPrefixForDigitsInCountry(v33, v32, 0, v24, 0, v34, 0, (const char **)usedBufLen))
          {
            if (*(_QWORD *)usedBufLen)
            {
              v35 = strlen(*(const char **)usedBufLen);
              v36 = strdup(&v24[v35]);
              if ((_PNDecomposeForCountry(v36, a2, (uint64_t)&v42, 1) & 1) != 0)
              {
                if (v36)
                {
                  v37 = v42;
                  v38 = v43;
                  v39 = v45;
                  v9[2] = v44;
                  v9[3] = v39;
                  *v9 = v37;
                  v9[1] = v38;
                  *a5 = 1;
                  free(v24);
                  return v36;
                }
              }
              else
              {
                free(v36);
              }
            }
          }
        }
      }
    }
  }
  return v24;
}

_BYTE *_PNCopyNormalized(const __CFString *a1)
{
  CFIndex Length;
  _BYTE *v3;
  const UniChar *CharactersPtr;
  const char *CStringPtr;
  uint64_t v6;
  int64_t v7;
  int v8;
  char v9;
  int v10;
  uint64_t v11;
  uint64_t v12;
  CFIndex v13;
  UniChar v14;
  unsigned int v15;
  char v16;
  int64_t v17;
  int64_t v19;
  uint64_t v20;
  uint64_t v21;
  CFIndex v22;
  uint64_t v23;
  _BYTE *v25;
  UniChar buffer[8];
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  CFStringRef theString;
  const UniChar *v35;
  const char *v36;
  uint64_t v37;
  CFIndex v38;
  int64_t v39;
  int64_t v40;
  CFRange v41;

  Length = CFStringGetLength(a1);
  v3 = malloc_type_malloc(Length + 1, 0x11DB78AFuLL);
  theString = a1;
  v37 = 0;
  v38 = Length;
  CharactersPtr = CFStringGetCharactersPtr(a1);
  CStringPtr = 0;
  v35 = CharactersPtr;
  if (!CharactersPtr)
    CStringPtr = CFStringGetCStringPtr(a1, 0x600u);
  v32 = 0u;
  v33 = 0u;
  v30 = 0u;
  v31 = 0u;
  v28 = 0u;
  v29 = 0u;
  *(_OWORD *)buffer = 0u;
  v27 = 0u;
  v39 = 0;
  v40 = 0;
  v25 = v3;
  v36 = CStringPtr;
  if (Length >= 1)
  {
    v6 = 0;
    v7 = 0;
    v8 = 0;
    v9 = 0;
    v10 = 1;
    v11 = 64;
    do
    {
      if ((unint64_t)v7 >= 4)
        v12 = 4;
      else
        v12 = v7;
      v13 = v38;
      if (v38 <= v7)
      {
        v15 = 0;
        if (!u_isdigit(0))
          goto LABEL_33;
      }
      else
      {
        if (v35)
        {
          v14 = v35[v7 + v37];
        }
        else if (v36)
        {
          v14 = v36[v37 + v7];
        }
        else
        {
          v17 = v39;
          if (v40 <= v7 || v39 > v7)
          {
            v19 = v7 - v12;
            v20 = v12 + v6;
            v21 = v11 - v12;
            v22 = v19 + 64;
            if (v19 + 64 >= v38)
              v22 = v38;
            v39 = v19;
            v40 = v22;
            if (v38 >= v21)
              v13 = v21;
            v41.length = v13 + v20;
            v41.location = v37 + v19;
            CFStringGetCharacters(theString, v41, buffer);
            v17 = v39;
          }
          v14 = buffer[v7 - v17];
        }
        v15 = v14;
        if (!(v9 & 1 | (v14 != 43)))
        {
          v10 = 0;
          v8 = 0;
          *v3++ = 43;
          v9 = 1;
          goto LABEL_36;
        }
        if (v14 == 42 || v14 == 35)
        {
          *v3++ = v14;
          v8 |= v10;
          goto LABEL_36;
        }
        if (!u_isdigit(v14))
        {
          if (v15 > 0x7F)
          {
            if (!__maskrune(v15, 0x100uLL))
              goto LABEL_36;
          }
          else
          {
LABEL_33:
            if ((*(_DWORD *)(MEMORY[0x24BDAC740] + 4 * v15 + 60) & 0x100) == 0)
              goto LABEL_36;
          }
          v23 = (char)v15 - 65;
          if (v23 > 0x39 || ((0x3FFFFFF03FFFFFFuLL >> v23) & 1) == 0)
            goto LABEL_36;
          v16 = byte_2064F3AA0[v23];
          goto LABEL_13;
        }
      }
      v16 = u_charDigitValue(v15) + 48;
LABEL_13:
      *v3++ = v16;
      v9 |= v8 ^ 1;
      v10 &= v8;
LABEL_36:
      ++v7;
      --v6;
      ++v11;
    }
    while (Length != v7);
  }
  *v3 = 0;
  return v25;
}

CFStringRef _CreateFormattedNumberForDigitsWithCountryIndex(const __CFString *a1, uint64_t a2, unsigned int a3, const __CFString *a4, _DWORD *a5, _QWORD *a6)
{
  unsigned int *v12;
  unsigned int *v13;
  unsigned __int16 *v14;
  uint64_t v15;
  uint64_t v16;
  CFIndex Length;
  const UniChar *CharactersPtr;
  const char *CStringPtr;
  uint64_t v20;
  CFIndex v21;
  CFIndex v22;
  CFIndex v23;
  CFIndex v24;
  const __CFAllocator *v25;
  CFIndex v26;
  CFRange v27;
  CFStringRef v28;
  CFStringRef v29;
  CFStringRef v30;
  const __CFString *FormattedNumberForDigitsWithCountryIndex;
  const char *v32;
  CFStringRef Copy;
  CFStringRef v34;
  const __CFString *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  const char *v40;
  size_t v41;
  uint64_t v42;
  uint64_t v43;
  CFStringRef v44;
  char v45;
  const __CFString *v46;
  uint64_t v47;
  unsigned __int8 *v48;
  uint64_t v49;
  char *v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  char *v54;
  uint64_t v55;
  int v56;
  const __CFAllocator *v57;
  int v58;
  CFStringRef v59;
  const char *v60;
  const char *v61;
  const __CFString *v62;
  int CharacterAtIndex;
  const __CFAllocator *v64;
  __CFString *MutableCopy;
  CFStringRef v66;
  __CFString *v67;
  CFStringRef v68;
  const __CFAllocator *v69;
  const char *v70;
  CFStringRef v71;
  CFIndex v72;
  const char *v73;
  const char *v74;
  unsigned int v75;
  int64_t v76;
  CFStringRef FormattedStringForDigitsInRange;
  const __CFAllocator *v78;
  int64_t v79;
  const __CFString *v80;
  const char *v81;
  uint64_t v82;
  unsigned int *v83;
  CFIndex v84;
  unsigned int *v85;
  const __CFString *v86;
  uint64_t v87;
  unsigned int *v88;
  const __CFString *v89;
  uint64_t CountryOffsetFromDialingCode;
  uint64_t v91;
  uint64_t v92;
  CFStringRef v93;
  CFIndex v94;
  CFIndex v95;
  CFStringRef v96;
  CFStringRef v97;
  const char *v98;
  const char *v99;
  _BOOL4 v101;
  unsigned __int8 *v102;
  _DWORD *v103;
  unsigned int v104;
  _QWORD *v105;
  const char *v106;
  CFStringRef theString;
  CFIndex v108;
  int v109[2];
  _OWORD v110[8];
  const __CFString *v111;
  const UniChar *v112;
  const char *v113;
  uint64_t v114;
  CFIndex v115;
  uint64_t v116;
  uint64_t v117;
  unsigned __int8 *v118;
  unsigned int v119;
  CFRange v120;
  CFRange v121;
  CFRange v122;
  CFRange v123;
  CFRange v124;
  CFRange v125;
  CFRange v126;
  CFRange v127;

  v12 = (unsigned int *)PNGetFormatFileHeader();
  if (!v12)
    return 0;
  v13 = v12;
  v103 = a5;
  v104 = a3;
  v14 = (unsigned __int16 *)((char *)&v12[3 * UIPhoneFormatCountryGetCount(v12) + 1]
                           + v12[3 * a2 + 3]);
  v15 = *v14;
  v16 = *((unsigned int *)v14 + 1);
  v118 = (unsigned __int8 *)(v14 + 6);
  if (a6)
    *a6 = v14;
  v105 = a6;
  memset(v110, 0, sizeof(v110));
  Length = CFStringGetLength(a1);
  v108 = 0;
  *(_QWORD *)v109 = Length;
  v111 = a1;
  v114 = 0;
  v115 = Length;
  CharactersPtr = CFStringGetCharactersPtr(a1);
  CStringPtr = 0;
  v112 = CharactersPtr;
  if (!CharactersPtr)
    CStringPtr = CFStringGetCStringPtr(a1, 0x600u);
  v116 = 0;
  v117 = 0;
  v113 = CStringPtr;
  v20 = _NumberRangeWithoutVerticalServiceCode(a1, 0, a2);
  if (v20 != -1)
  {
    v22 = v20;
    v23 = v21;
    v24 = v20 + v21;
    v25 = (const __CFAllocator *)*MEMORY[0x24BDBD240];
    v26 = CFStringGetLength(a1);
    v27.length = v22;
    if (v22 >= v26)
      v27.length = CFStringGetLength(a1);
    v27.location = 0;
    v28 = CFStringCreateWithSubstring(v25, a1, v27);
    v120.location = v22;
    v120.length = v23;
    v29 = CFStringCreateWithSubstring(v25, a1, v120);
    v121.length = Length - v24;
    v121.location = v24;
    v30 = CFStringCreateWithSubstring(v25, a1, v121);
    FormattedNumberForDigitsWithCountryIndex = (const __CFString *)_CreateFormattedNumberForDigitsWithCountryIndex(v29, a2, v104, a4, v103, v105);
    if ((v104 & 1) != 0)
    {
      CFRelease(v28);
      v28 = &stru_24BF25160;
    }
    v32 = "";
    if (CFStringGetLength(FormattedNumberForDigitsWithCountryIndex) && CFStringGetLength(v28))
      v32 = " ";
    Copy = CFStringCreateWithFormat(v25, 0, CFSTR("%@%s%@%@"), v28, v32, FormattedNumberForDigitsWithCountryIndex, v30);
    CFRelease(v28);
    CFRelease(v29);
    CFRelease(FormattedNumberForDigitsWithCountryIndex);
    v34 = v30;
LABEL_122:
    CFRelease(v34);
    return Copy;
  }
  v35 = a4;
  if (a4)
    goto LABEL_17;
  v106 = 0;
  theString = 0;
  v47 = _InternationalPrefixForDigitsInCountry(v14, a2, a1, 0, 0, Length, &v106, &theString);
  if (v47)
  {
    v48 = (unsigned __int8 *)v47;
    if (v105)
      *((_BYTE *)v105 + 40) = 1;
    if (theString)
      v49 = NumberOfDigitsRequiredForPattern((unsigned __int8 *)theString);
    else
      v49 = 0;
    v75 = NumberOfDigitsRequiredForPattern(v48);
    if (v49 + v75 <= Length)
      v76 = v75;
    else
      v76 = Length - v49;
    v102 = v48;
    FormattedStringForDigitsInRange = _CreateFormattedStringForDigitsInRange((uint64_t)v110, 0, v49, v76, (char *)v48, v104, 0, 0, 1);
    v78 = (const __CFAllocator *)*MEMORY[0x24BDBD240];
    v79 = v76 + v49;
    v125.length = CFStringGetLength(a1) - (v76 + v49);
    v125.location = v76 + v49;
    v80 = CFStringCreateWithSubstring(v78, a1, v125);
    v81 = v106;
    v82 = PNGetFormatFileHeader();
    if (v82)
    {
      v83 = (unsigned int *)v82;
      v119 = 0;
      if (v81)
      {
        v84 = strlen(v81);
        v85 = v83;
        v86 = 0;
        v87 = (uint64_t)v81;
        v88 = 0;
      }
      else
      {
        v84 = CFStringGetLength(v80);
        v88 = &v119;
        v85 = v83;
        v86 = v80;
        v87 = 0;
      }
      CountryOffsetFromDialingCode = _GetCountryOffsetFromDialingCode(v85, v86, v87, 0, v84, v88);
      v91 = CountryOffsetFromDialingCode;
      if ((_DWORD)CountryOffsetFromDialingCode == (_DWORD)a2)
        v92 = v104;
      else
        v92 = v104 & 0xFFFFFFFD;
      if ((_DWORD)CountryOffsetFromDialingCode != -1)
      {
        v126.length = v119;
        v126.location = 0;
        v93 = CFStringCreateWithSubstring(v78, v80, v126);
        v94 = v119;
        v95 = CFStringGetLength(v80);
        v127.length = v95 - v119;
        v127.location = v94;
        v96 = CFStringCreateWithSubstring(v78, v80, v127);
        v89 = (const __CFString *)_CreateFormattedNumberForDigitsWithCountryIndex(v96, v91, v92, v93, v103, v105);
        if (v105 && *((_BYTE *)v105 + 41))
          v105[6] = v119;
        CFRelease(v96);
        CFRelease(v93);
        if ((v92 & 2) == 0)
          goto LABEL_107;
LABEL_109:
        CFRelease(FormattedStringForDigitsInRange);
        v97 = 0;
        theString = 0;
        FormattedStringForDigitsInRange = &stru_24BF25160;
        goto LABEL_110;
      }
      v89 = (const __CFString *)CFRetain(v80);
      if ((v92 & 2) != 0)
        goto LABEL_109;
    }
    else
    {
      v89 = 0;
      if ((v104 & 2) != 0)
        goto LABEL_109;
    }
LABEL_107:
    v97 = theString;
LABEL_110:
    v98 = "";
    if (v97)
      v99 = (const char *)v97;
    else
      v99 = "";
    if ((*v102 != 43 || v76 >= 2) && CFStringGetLength(v89) && CFStringGetLength(FormattedStringForDigitsInRange) > 0)
      v98 = " ";
    Copy = CFStringCreateWithFormat(v78, 0, CFSTR("%s%@%s%@"), v99, FormattedStringForDigitsInRange, v98, v89);
    if (v105 && *((_BYTE *)v105 + 41))
      v105[6] += v79;
    CFRelease(FormattedStringForDigitsInRange);
    CFRelease(v80);
    v34 = v89;
    goto LABEL_122;
  }
  v35 = 0;
LABEL_17:
  theString = 0;
  v36 = _FormatEntryAndNationalPrefixForDigitsInCountry((uint64_t)v14, (UniChar *)v110, 0, &v108, v35 != 0, &v118, &theString, (uint64_t)a6);
  v37 = v36;
  v101 = v36 != 0;
  if (!v36)
    goto LABEL_43;
  v38 = *(unsigned __int16 *)(v36 + 14);
  v39 = _UIPhoneFormatEntryReplacementCountryCodeRange(v14, v36);
  if (v39 != -1)
  {
    v40 = (char *)v14 + *v14 + *((unsigned int *)v14 + 1) + v38 + v39;
    v41 = strlen(v40);
    v42 = _GetCountryOffsetFromDialingCode(v13, 0, (uint64_t)v40, 0, v41, 0);
    if ((_DWORD)v42 != -1)
    {
      v43 = v42;
      v122.location = v108;
      v122.length = *(_QWORD *)v109;
      v44 = CFStringCreateWithSubstring((CFAllocatorRef)*MEMORY[0x24BDBD240], a1, v122);
      v45 = v104;
      Copy = (CFStringRef)_CreateFormattedNumberForDigitsWithCountryIndex(v44, v43, v104, 0, v103, v105);
      CFRelease(v44);
      v46 = a4;
      if (!a4)
      {
LABEL_87:
        v34 = theString;
        if (!theString)
          return Copy;
        goto LABEL_122;
      }
      goto LABEL_57;
    }
  }
  v50 = (char *)v14 + v15 + v16;
  if (v50)
  {
    v45 = v104;
    v46 = a4;
    Copy = _CreateFormattedStringForDigitsInRange((uint64_t)v110, 0, v108, *(size_t *)v109, &v50[v38], v104, theString, a4, 0);
    if (v103)
      *v103 = a2;
    if (v105)
    {
      v51 = 0;
      v52 = 0;
      *(_OWORD *)(v105 + 1) = *(_OWORD *)v37;
      v53 = *(unsigned __int16 *)(v37 + 14);
      v105[3] = &v50[v53];
      v54 = (char *)v14 + *v14 + *((unsigned int *)v14 + 1) + v53;
      v55 = -1;
      while (1)
      {
        v56 = v54[v51];
        if (v56 == 91)
        {
          if (v54[v51 + 1] == 91)
          {
            if ((v54[v51 + 2] - 48) > 9)
            {
LABEL_49:
              v105[8] = v55;
              v105[9] = v52;
              break;
            }
            v55 = v51 + 2;
          }
        }
        else
        {
          if (!v54[v51])
            goto LABEL_49;
          if (v55 != -1 && v56 == 93 && v54[v51 + 1] == 93)
            v52 = v51 - v55;
        }
        ++v51;
      }
    }
    if (!v118 || (*(_BYTE *)(v37 + 12) & 1) != 0)
    {
      v58 = 1;
    }
    else
    {
      v59 = CFStringCreateWithFormat((CFAllocatorRef)*MEMORY[0x24BDBD240], 0, CFSTR("%@%@"), theString, Copy);
      CFRelease(Copy);
      v58 = 1;
      Copy = v59;
    }
  }
  else
  {
LABEL_43:
    v57 = (const __CFAllocator *)*MEMORY[0x24BDBD240];
    v46 = a4;
    if (a4 && theString)
    {
      v123.location = v108;
      v123.length = *(_QWORD *)v109;
      Copy = CFStringCreateWithSubstring(v57, a1, v123);
      v45 = v104;
      if (v37)
        goto LABEL_56;
      goto LABEL_57;
    }
    Copy = CFStringCreateCopy(v57, a1);
    v45 = v104;
    v58 = v101;
  }
  if (!v46)
    goto LABEL_87;
  if (v58)
  {
LABEL_56:
    if ((*(_BYTE *)(v37 + 12) & 2) != 0)
      goto LABEL_87;
  }
LABEL_57:
  if (theString)
  {
    v60 = "";
    if ((v45 & 4) != 0)
      v61 = "";
    else
      v61 = "(";
    if ((v45 & 4) != 0)
      v62 = &stru_24BF25160;
    else
      v62 = CFSTR(")");
    if (CFStringGetLength(Copy))
    {
      CharacterAtIndex = CFStringGetCharacterAtIndex(Copy, 0);
      v64 = (const __CFAllocator *)*MEMORY[0x24BDBD240];
      if (CharacterAtIndex == 40)
      {
        v124.length = CFStringGetLength(Copy) - 1;
        v124.location = 1;
        MutableCopy = (__CFString *)CFStringCreateWithSubstring(v64, Copy, v124);
        if (CFStringGetLength(v46))
          v60 = " ";
        v66 = theString;
        if (CFStringGetLength(MutableCopy))
          v67 = MutableCopy;
        else
          v67 = (__CFString *)v62;
        v68 = CFStringCreateWithFormat(v64, 0, CFSTR("%@%s%s%@%@"), v46, v60, v61, v66, v67);
        goto LABEL_85;
      }
    }
    else
    {
      v64 = (const __CFAllocator *)*MEMORY[0x24BDBD240];
    }
    v72 = CFStringGetLength(theString);
    MutableCopy = CFStringCreateMutableCopy(v64, v72, theString);
    CFStringTrimWhitespace(MutableCopy);
    if (CFStringGetLength(v46))
      v73 = " ";
    else
      v73 = "";
    if (CFStringGetLength(Copy))
      v74 = " ";
    else
      v74 = "";
    v68 = CFStringCreateWithFormat(v64, 0, CFSTR("%@%s%s%@%@%s%@"), v46, v73, v61, MutableCopy, v62, v74, Copy);
LABEL_85:
    v71 = v68;
    CFRelease(MutableCopy);
LABEL_86:
    CFRelease(Copy);
    Copy = v71;
    goto LABEL_87;
  }
  if ((v45 & 2) == 0)
  {
    v69 = (const __CFAllocator *)*MEMORY[0x24BDBD240];
    v70 = "";
    if (CFStringGetLength(Copy) && CFStringGetLength(v46))
      v70 = " ";
    v71 = CFStringCreateWithFormat(v69, 0, CFSTR("%@%s%@"), v46, v70, Copy);
    goto LABEL_86;
  }
  return Copy;
}

BOOL __CFPhoneNumberEqual(char *a1, uint64_t a2)
{
  char *v3;
  _OWORD v5[4];
  _OWORD v6[4];

  v3 = a1;
  memset(v6, 0, sizeof(v6));
  memset(v5, 0, sizeof(v5));
  __CFPhoneNumberNormalize(a1);
  __CFPhoneNumberNormalize((char *)a2);
  LODWORD(v3) = PNDecomposeForCountry(*((char **)v3 + 2), *((const __CFString **)v3 + 6), (uint64_t)v6);
  return (_DWORD)v3 == PNDecomposeForCountry(*(char **)(a2 + 16), *(const __CFString **)(a2 + 48), (uint64_t)v5)&& decomposedPhoneNumbersEqual((uint64_t)v6, (uint64_t)v5, 0, 0);
}

uint64_t _PNDecomposeForCountry(char *a1, const __CFString *a2, uint64_t a3, int a4)
{
  unsigned int *v8;
  unsigned int InfoIndex;

  v8 = (unsigned int *)PNGetFormatFileHeader();
  if (a2 && v8)
  {
    InfoIndex = UIPhoneFormatCountryGetInfoIndex(v8, a2);
    if (InfoIndex != -1)
      return _DecomposePhoneNumberWithCountryIndex(a1, InfoIndex, a3, 0, a4);
    *(_QWORD *)(a3 + 48) = a1;
    *(_DWORD *)(a3 + 56) = strlen(a1);
  }
  return 0;
}

uint64_t UIPhoneFormatCountryGetInfoIndex(unsigned int *a1, CFStringRef theString)
{
  CFIndex Length;
  CFIndex v5;
  const __CFDictionary *IndexCache;
  const __CFNumber *Value;
  CFIndex v9;
  char *v10;
  const char *CStringPtr;
  uint64_t v12;
  uint64_t v13;
  const char *i;
  CFNumberRef v15;
  CFNumberRef v16;
  __CFDictionary *v17;
  unsigned int v18;
  unsigned int valuePtr;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  if (!theString)
    return 0xFFFFFFFFLL;
  Length = CFStringGetLength(theString);
  if (Length < 1)
    return 0xFFFFFFFFLL;
  v5 = Length;
  valuePtr = 0;
  os_unfair_lock_lock_with_options();
  IndexCache = __CFPhoneNumberCountryGetIndexCache();
  Value = (const __CFNumber *)CFDictionaryGetValue(IndexCache, theString);
  os_unfair_lock_unlock((os_unfair_lock_t)&__CFPhoneNumberCountryCacheUnfairLock);
  if (Value && CFNumberGetValue(Value, kCFNumberSInt32Type, &valuePtr))
    return valuePtr;
  v9 = v5 + 1;
  MEMORY[0x24BDAC7A8]();
  v10 = (char *)&v18 - ((v5 + 16) & 0xFFFFFFFFFFFFFFF0);
  CStringPtr = CFStringGetCStringPtr(theString, 0x8000100u);
  if (!CStringPtr)
  {
    CStringPtr = v10;
    if (!CFStringGetCString(theString, v10, v9, 0x8000100u))
      return 0xFFFFFFFFLL;
  }
  if (!a1)
    return 0xFFFFFFFFLL;
  v12 = *a1;
  v18 = 0;
  if (!(_DWORD)v12)
    return 0xFFFFFFFFLL;
  v13 = 0;
  for (i = (const char *)(a1 + 2); strcasecmp(i, CStringPtr); i += 12)
  {
    v18 = ++v13;
    if (v12 == v13)
      return 0xFFFFFFFFLL;
  }
  v15 = CFNumberCreate((CFAllocatorRef)*MEMORY[0x24BDBD240], kCFNumberSInt32Type, &v18);
  if (v15)
  {
    v16 = v15;
    os_unfair_lock_lock_with_options();
    v17 = __CFPhoneNumberCountryGetIndexCache();
    CFDictionarySetValue(v17, theString, v16);
    os_unfair_lock_unlock((os_unfair_lock_t)&__CFPhoneNumberCountryCacheUnfairLock);
    CFRelease(v16);
  }
  return v18;
}

CFMutableDictionaryRef __CFPhoneNumberCountryGetIndexCache()
{
  CFMutableDictionaryRef result;

  os_unfair_lock_assert_owner((const os_unfair_lock *)&__CFPhoneNumberCountryCacheUnfairLock);
  result = (CFMutableDictionaryRef)__CFPhoneNumberCountryGetIndexCache_sCache;
  if (!__CFPhoneNumberCountryGetIndexCache_sCache)
  {
    result = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x24BDBD240], 0, MEMORY[0x24BDBD6A0], MEMORY[0x24BDBD6B0]);
    __CFPhoneNumberCountryGetIndexCache_sCache = (uint64_t)result;
  }
  return result;
}

uint64_t PNDecomposeForCountry(char *a1, const __CFString *a2, uint64_t a3)
{
  return _PNDecomposeForCountry(a1, a2, a3, 1);
}

char *__CFPhoneNumberNormalize(char *result)
{
  char *v1;
  char v2;
  __int128 v3[4];

  if (!*((_QWORD *)result + 2))
  {
    v1 = result;
    memset(v3, 0, sizeof(v3));
    v2 = 0;
    result = _PNCopyBestGuessNumberForCountry(*((const __CFString **)result + 5), *((__CFString **)result + 6), 1, v3, &v2);
    *((_QWORD *)v1 + 2) = result;
  }
  return result;
}

CFStringRef _PNCreateStringByStrippingFormattingAndNotVisiblyAllowable(const __CFString *a1)
{
  CFIndex Length;
  CFIndex v3;
  size_t v4;
  UniChar *v5;
  UniChar *v6;
  CFIndex v7;
  UniChar *v8;
  unsigned int v9;
  unsigned int v10;
  CFStringRef v11;
  CFRange v13;

  if (!a1)
    return 0;
  Length = CFStringGetLength(a1);
  if (!Length)
    return (CFStringRef)CFRetain(a1);
  v3 = Length;
  v4 = 2 * Length;
  v5 = (UniChar *)malloc_type_malloc(2 * Length, 0x1000040BDFB0063uLL);
  v6 = (UniChar *)malloc_type_malloc(v4, 0x1000040BDFB0063uLL);
  v13.location = 0;
  v13.length = v3;
  CFStringGetCharacters(a1, v13, v5);
  if (v3 < 1)
    goto LABEL_13;
  v7 = 0;
  v8 = v5;
  do
  {
    v10 = *v8++;
    v9 = v10;
    if (pn_uset_expandedPresentationSetContains() == 1 && !_IsInFormattingSet(v9))
      v6[v7++] = v9;
    --v3;
  }
  while (v3);
  if (v7)
    v11 = CFStringCreateWithCharacters((CFAllocatorRef)*MEMORY[0x24BDBD240], v6, v7);
  else
LABEL_13:
    v11 = &stru_24BF25160;
  free(v5);
  free(v6);
  return v11;
}

uint64_t pn_uset_expandedPresentationSetContains()
{
  uint64_t result;

  os_unfair_lock_lock(&__pn_uset_unfair_lock);
  if (!__pn_uset_getExpandedPresentationSet_set)
  {
    os_unfair_lock_assert_owner(&__pn_uset_unfair_lock);
    if ((__pn_uset_getExpandedPresentationPattern_didInit & 1) == 0)
    {
      u_charsToUChars("[[+][:Nd:][,;][\\ \"'()\\-./<>\\[\\]][*#][A-Za-z]]",
        __pn_uset_getExpandedPresentationPattern_pattern,
        46);
      __pn_uset_getExpandedPresentationPattern_didInit = 1;
    }
    __pn_uset_getExpandedPresentationSet_set = uset_openPattern();
  }
  os_unfair_lock_unlock(&__pn_uset_unfair_lock);
  result = __pn_uset_getExpandedPresentationSet_set;
  if (__pn_uset_getExpandedPresentationSet_set)
    JUMPOUT(0x20BCF7F44);
  return result;
}

uint64_t _IsInFormattingSet(unsigned int a1)
{
  uint64_t result;
  unsigned int v3;
  _BOOL4 v4;

  result = 1;
  if (a1 > 0x2F || ((1 << a1) & 0xE30100000000) == 0)
  {
    v3 = a1 - 8236;
    v4 = a1 == 160;
    return v3 < 2 || v4;
  }
  return result;
}

const char *_InternationalPrefixForDigitsInCountry(uint64_t a1, unsigned int a2, const __CFString *a3, const char *a4, CFIndex a5, uint64_t a6, _QWORD *a7, const char **a8)
{
  unsigned int *v16;
  const char *v17;
  const char *v18;
  uint64_t v19;
  const char *v20;

  v16 = (unsigned int *)PNGetFormatFileHeader();
  v17 = __InternationalPrefixForDigitsInCountry(a1, a2, a3, a4, a5, a6, a7);
  v18 = v17;
  if (a8)
  {
    if (v17)
    {
      if (*v17 == 43 && !v17[1])
      {
        v19 = a6 - 1;
        if (_GetCountryOffsetFromDialingCode(v16, a3, (uint64_t)a4, 1, v19, 0) == -1)
        {
          v20 = __InternationalPrefixForDigitsInCountry(a1, a2, a3, a4, 1, v19, a7);
          if (v20)
          {
            *a8 = v18;
            return v20;
          }
        }
      }
    }
  }
  return v18;
}

const char *__InternationalPrefixForDigitsInCountry(uint64_t a1, unsigned int a2, const __CFString *a3, const char *a4, CFIndex a5, uint64_t a6, _QWORD *a7)
{
  uint64_t v10;
  uint64_t v11;
  const char *v12;
  size_t v13;
  uint64_t v14;
  const UniChar *CharactersPtr;
  const char *CStringPtr;
  const __CFAllocator *v17;
  const __CFAllocator *v18;
  const char *v19;
  const char *v20;
  int v21;
  unsigned __int8 *v22;
  int v23;
  int v24;
  const char *v25;
  uint64_t v26;
  const char *v27;
  size_t v28;
  const __CFString *v29;
  size_t v30;
  CFStringRef v31;
  const __CFString *v32;
  CFMutableStringRef MutableCopy;
  int valid;
  size_t v35;
  int CharacterAtIndex;
  _QWORD *v38;
  CFIndex v40;
  size_t v41;
  UniChar buffer[8];
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  uint64_t v55;
  CFRange v56;

  v10 = 0;
  v11 = a1 + 12;
  v12 = (const char *)(a1 + 12);
  do
  {
    v13 = strlen(v12);
    v10 += v13 + 1;
    v12 += v13 + 1;
  }
  while (*v12);
  if (!a6)
    return 0;
  v55 = 0;
  v14 = v11 + v10 + 1;
  v53 = 0u;
  v54 = 0u;
  v51 = 0u;
  v52 = 0u;
  v49 = 0u;
  v50 = 0u;
  v47 = 0u;
  v48 = 0u;
  v45 = 0u;
  v46 = 0u;
  *(_OWORD *)buffer = 0u;
  if (!a4)
  {
    *(_QWORD *)&v52 = a3;
    *((_QWORD *)&v53 + 1) = 0;
    *(_QWORD *)&v54 = CFStringGetLength(a3);
    CharactersPtr = CFStringGetCharactersPtr(a3);
    CStringPtr = 0;
    *((_QWORD *)&v52 + 1) = CharactersPtr;
    if (!CharactersPtr)
      CStringPtr = CFStringGetCStringPtr(a3, 0x600u);
    *((_QWORD *)&v54 + 1) = 0;
    v55 = 0;
    *(_QWORD *)&v53 = CStringPtr;
  }
  v38 = a7;
  v17 = (const __CFAllocator *)*MEMORY[0x24BDBD240];
  v18 = (const __CFAllocator *)*MEMORY[0x24BDBD258];
  v19 = "[[if valid]]";
  v20 = a4;
  v40 = a5;
  while (1)
  {
    if (*(_BYTE *)v14 == 45)
    {
      if (*(_BYTE *)(v14 + 1) == 62)
        goto LABEL_23;
    }
    else if (!*(_BYTE *)v14)
    {
      if (v20)
        CharacterAtIndex = v20[a5];
      else
        CharacterAtIndex = CFStringGetCharacterAtIndex(a3, a5);
      if (CharacterAtIndex == 43)
        return "+";
      else
        return 0;
    }
    v21 = strncmp(v19, (const char *)v14, 0xCuLL);
    v22 = (unsigned __int8 *)(v14 + 12);
    if (!v21)
      v14 += 12;
    if (InlineBufferHasPatternAtOffset(buffer, (uint64_t)v20, (char *)v14, a5))
    {
      v41 = strlen((const char *)v14);
      if (v21)
        break;
      v23 = NumberOfDigitsRequiredForPattern(v22);
      if (a6 <= v23)
        break;
      v24 = v23;
      if (!InlineBufferHasPatternAtOffset(buffer, (uint64_t)v20, (char *)v22, a5))
        break;
      v25 = v19;
      v26 = v24;
      v27 = (const char *)(PNGetFormatFileHeader() + 12 * a2 + 8);
      v28 = strlen(v27);
      v29 = CFStringCreateWithBytesNoCopy(v17, (const UInt8 *)v27, v28, 0x8000100u, 0, v18);
      if (v20)
      {
        v30 = strlen(v20);
        v31 = CFStringCreateWithBytesNoCopy(v17, (const UInt8 *)&v20[v26], v30 - v26, 0x8000100u, 0, v18);
      }
      else
      {
        v56.length = CFStringGetLength(a3) - v26;
        v56.location = v26;
        v31 = CFStringCreateWithSubstring(v17, a3, v56);
      }
      v32 = v31;
      MutableCopy = CFStringCreateMutableCopy(v17, 0, CFSTR("+"));
      CFStringAppend(MutableCopy, v32);
      valid = _PNIsValidPhoneNumberForCountry(MutableCopy, v29, 0, 1, 0);
      CFRelease(v29);
      CFRelease(v32);
      CFRelease(MutableCopy);
      v19 = v25;
      a5 = v40;
      v20 = a4;
      if (valid)
        break;
    }
LABEL_23:
    v14 += strlen((const char *)v14) + 1;
  }
  if (v38)
  {
    v35 = v14 + v41;
    if (*(_BYTE *)(v14 + v41 + 1) == 45 && *(_BYTE *)(v35 + 2) == 62)
      *v38 = v35 + 3;
  }
  return (const char *)v14;
}

uint64_t _DecomposePhoneNumberWithCountryIndex(char *a1, unsigned int a2, uint64_t a3, uint64_t a4, int a5)
{
  uint64_t result;
  unsigned int *v11;
  unsigned __int16 *v12;
  size_t v13;
  uint64_t v14;
  size_t v15;
  CFIndex v16;
  const char **v17;
  const char *v18;
  unsigned __int8 *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  unint64_t v23;
  size_t v24;
  size_t v25;
  char *v26;
  size_t v27;
  size_t v28;
  unint64_t v29;
  char *v30;
  unsigned int v31;
  uint64_t v32;
  unint64_t v33;
  unint64_t v34;
  char *v35;
  uint64_t v36;
  const char *v37;
  size_t v38;
  uint64_t CountryOffsetFromDialingCode;
  unsigned int v40;
  int64_t v41;
  int64_t v42;
  const char *v43;
  unsigned int *v44;
  size_t v45;
  unsigned int *v46;
  uint64_t v47;
  int *v48;
  uint64_t v49;
  int v50;
  const char *v51;
  unsigned __int8 *v52;
  unint64_t v53;
  size_t v54;
  unsigned __int8 *v55;
  int v56;

  result = PNGetFormatFileHeader();
  if (result)
  {
    v11 = (unsigned int *)result;
    v12 = (unsigned __int16 *)(result
                             + 4
                             + 12 * UIPhoneFormatCountryGetCount((unsigned int *)result)
                             + *(unsigned int *)(result + 4 + 12 * a2 + 8));
    v55 = (unsigned __int8 *)(v12 + 6);
    v13 = strlen(a1);
    v53 = 0;
    v54 = v13;
    v14 = _NumberRangeWithoutVerticalServiceCode(0, a1, a2);
    if (v14 == -1)
    {
      v16 = 0;
    }
    else
    {
      v16 = v14;
      v53 = v14;
      v54 = v15;
      v13 = v15;
    }
    *(_QWORD *)a3 = &v11[3 * a2 + 1];
    if ((a4 & 1) != 0
      || ((v51 = 0, v52 = 0, !a5) ? (v17 = 0) : (v17 = (const char **)&v52),
          (v18 = _InternationalPrefixForDigitsInCountry((uint64_t)v12, a2, 0, a1, v16, v13, &v51, v17)) == 0))
    {
      v21 = _FormatEntryAndNationalPrefixForDigitsInCountry((uint64_t)v12, 0, a1, (uint64_t *)&v53, a4, &v55, 0, 0);
      v22 = v21;
      if (v55)
        *(_QWORD *)(a3 + 8) = v55;
      if (!v21)
      {
LABEL_52:
        *(_OWORD *)(a3 + 32) = 0u;
        *(_OWORD *)(a3 + 48) = 0u;
        *(_OWORD *)a3 = 0u;
        *(_OWORD *)(a3 + 16) = 0u;
        *(_QWORD *)(a3 + 48) = a1;
        v50 = strlen(a1);
        result = 0;
        *(_DWORD *)(a3 + 56) = v50;
        return result;
      }
      v23 = v53;
      v24 = v54;
      v25 = v54 + v53;
      v26 = &a1[v53];
      if (v54 + v53 > v53 && (*(_BYTE *)(v21 + 10) & 0x80) == 0)
      {
        v27 = *(_BYTE *)(v21 + 10) & 0x7F;
        if ((*(_BYTE *)(v21 + 10) & 0x7F) != 0)
        {
          *(_QWORD *)(a3 + 16) = v26;
          if (v24 >= v27)
            LODWORD(v24) = v27;
          *(_DWORD *)(a3 + 24) = v24;
          v23 += v27;
          v26 += v27;
        }
      }
      v28 = v25 - v23;
      if (v25 <= v23)
      {
        v31 = *(_DWORD *)(a3 + 40);
      }
      else
      {
        v29 = *(unsigned __int8 *)(v21 + 11);
        if (*(_BYTE *)(v21 + 11))
          v30 = v26;
        else
          v30 = 0;
        *(_QWORD *)(a3 + 32) = v30;
        if (v28 >= v29)
          v31 = v29;
        else
          v31 = v25 - v23;
        *(_DWORD *)(a3 + 40) = v31;
      }
      v32 = v31;
      v33 = v23 + v31;
      if (v25 > v33 && (*(_BYTE *)(v21 + 10) & 0x80) != 0)
      {
        v34 = *(_BYTE *)(v21 + 10) & 0x7F;
        if ((*(_BYTE *)(v21 + 10) & 0x7F) != 0)
        {
          *(_QWORD *)(a3 + 16) = &v26[v32];
          if (v28 >= v34)
            LODWORD(v28) = v34;
          *(_DWORD *)(a3 + 24) = v28;
          v26 += v34;
          v33 = v23 + v34 + v32;
        }
      }
      if (v25 > v33)
      {
        v35 = &v26[v32];
        *(_QWORD *)(a3 + 48) = v35;
        *(_DWORD *)(a3 + 56) = v25 + (_DWORD)a1 - (_DWORD)v35;
      }
      v36 = _UIPhoneFormatEntryReplacementCountryCodeRange(v12, v21);
      if (v36 != -1)
      {
        v37 = (char *)v12 + *v12 + *((unsigned int *)v12 + 1) + *(unsigned __int16 *)(v22 + 14) + v36;
        v38 = strlen(v37);
        CountryOffsetFromDialingCode = _GetCountryOffsetFromDialingCode(v11, 0, (uint64_t)v37, 0, v38, 0);
        if ((_DWORD)CountryOffsetFromDialingCode != -1)
        {
          *(_QWORD *)a3 = &v11[3 * CountryOffsetFromDialingCode + 1];
          _DecomposePhoneNumberWithCountryIndex(a1, CountryOffsetFromDialingCode, a3, a4, 0);
        }
      }
      return 1;
    }
    else
    {
      v19 = (unsigned __int8 *)v18;
      if (v52)
        v20 = NumberOfDigitsRequiredForPattern(v52);
      else
        v20 = 0;
      v40 = NumberOfDigitsRequiredForPattern(v19);
      v41 = strlen(a1);
      if (v41 >= v20 + v40)
        v42 = v20 + v40;
      else
        v42 = v41;
      v43 = v51;
      result = PNGetFormatFileHeader();
      if (result)
      {
        v44 = (unsigned int *)result;
        a1 += v42;
        v56 = 0;
        if (v43)
        {
          v45 = strlen(v43);
          v46 = v44;
          v47 = (uint64_t)v43;
          v48 = 0;
        }
        else
        {
          v45 = strlen(a1);
          v48 = &v56;
          v46 = v44;
          v47 = (uint64_t)a1;
        }
        v49 = _GetCountryOffsetFromDialingCode(v46, 0, v47, 0, v45, v48);
        if ((_DWORD)v49 != -1)
          return _DecomposePhoneNumberWithCountryIndex(&a1[v56], v49, a3, 1, 0);
        goto LABEL_52;
      }
    }
  }
  return result;
}

uint64_t PNGetFormatFileHeader()
{
  uint64_t result;

  result = sOverrideFormatFile;
  if (!sOverrideFormatFile)
  {
    if (PNGetFormatFileHeader_initOnce != -1)
      dispatch_once(&PNGetFormatFileHeader_initOnce, &__block_literal_global_36);
    return sFormatFile;
  }
  return result;
}

uint64_t _GetCountryOffsetFromDialingCode(unsigned int *a1, CFStringRef theString, uint64_t a3, CFIndex a4, CFIndex a5, _DWORD *a6)
{
  CFIndex v7;
  int v11;
  uint64_t result;
  const __CFString *CharactersPtr;
  const char *CStringPtr;
  CFRange v16;
  unsigned int Count;
  uint64_t v18;
  CFIndex v19;
  unsigned int *v20;
  size_t v21;
  size_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  int32_t v27;
  UChar32 v28;
  uint64_t v29;
  UniChar v30;
  uint64_t v31;
  uint64_t v32;
  _DWORD *v33;
  uint64_t v34;
  unsigned int *v35;
  CFIndex v36;
  UniChar buffer[8];
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  CFStringRef theStringa[2];
  __int128 v46;
  __int128 v47;
  CFIndex length;
  CFRange v49;

  if (!a5)
    return 0xFFFFFFFFLL;
  v7 = a5;
  length = 0;
  v46 = 0u;
  v47 = 0u;
  v44 = 0u;
  *(_OWORD *)theStringa = 0u;
  v42 = 0u;
  v43 = 0u;
  v40 = 0u;
  v41 = 0u;
  v38 = 0u;
  v39 = 0u;
  *(_OWORD *)buffer = 0u;
  if (a3)
  {
    v11 = *(char *)(a3 + a4);
    goto LABEL_17;
  }
  theStringa[0] = theString;
  *((_QWORD *)&v46 + 1) = a4;
  *(_QWORD *)&v47 = a5;
  CharactersPtr = (const __CFString *)CFStringGetCharactersPtr(theString);
  theStringa[1] = CharactersPtr;
  if (!CharactersPtr)
  {
    CStringPtr = CFStringGetCStringPtr(theString, 0x600u);
    *((_QWORD *)&v47 + 1) = 0;
    length = 0;
    *(_QWORD *)&v46 = CStringPtr;
    if (v7 > 0)
    {
      if (CStringPtr)
      {
        LOWORD(v11) = CStringPtr[a4];
      }
      else
      {
        if ((unint64_t)v7 >= 0x40)
          v16.length = 64;
        else
          v16.length = v7;
        length = v16.length;
        v16.location = a4;
        CFStringGetCharacters(theString, v16, buffer);
        LOWORD(v11) = buffer[-*((_QWORD *)&v47 + 1)];
      }
      goto LABEL_16;
    }
    goto LABEL_11;
  }
  *((_QWORD *)&v47 + 1) = 0;
  length = 0;
  *(_QWORD *)&v46 = 0;
  if (v7 < 1)
  {
LABEL_11:
    LOWORD(v11) = 0;
    goto LABEL_16;
  }
  LOWORD(v11) = *((_WORD *)&CharactersPtr->isa + a4);
LABEL_16:
  v11 = (unsigned __int16)v11;
LABEL_17:
  if (v11 == 48)
    return 0xFFFFFFFFLL;
  Count = UIPhoneFormatCountryGetCount(a1);
  if (!Count)
    return 0xFFFFFFFFLL;
  v18 = 0;
  v19 = a3 + a4;
  v20 = a1 + 1;
  v33 = a6;
  v34 = Count;
  v35 = a1;
  v36 = v7;
  while (1)
  {
    v21 = strlen((const char *)&a1[3 * v18 + 1]);
    if (v7 >= v21)
      break;
LABEL_21:
    ++v18;
    v20 += 3;
    result = 0xFFFFFFFFLL;
    a1 = v35;
    v7 = v36;
    if (v18 == v34)
      return result;
  }
  v22 = v21;
  if (v21)
  {
    v23 = 0;
    v24 = 0;
    v25 = 64;
    do
    {
      v26 = (unint64_t)v24 >= 4 ? 4 : v24;
      v27 = u_charDigitValue(*((char *)v20 + v24));
      if (a3)
      {
        v28 = *(char *)(v19 + v24);
      }
      else
      {
        if (v24 < 0 || (v29 = v47, (uint64_t)v47 <= v24))
        {
          v30 = 0;
        }
        else if (theStringa[1])
        {
          v30 = *((_WORD *)&theStringa[1]->isa + v24 + *((_QWORD *)&v46 + 1));
        }
        else if ((_QWORD)v46)
        {
          v30 = *(char *)(v46 + *((_QWORD *)&v46 + 1) + v24);
        }
        else
        {
          if (length <= v24 || (v31 = *((_QWORD *)&v47 + 1), *((uint64_t *)&v47 + 1) > v24))
          {
            v32 = v24 - v26 + 64;
            if (v32 >= (uint64_t)v47)
              v32 = v47;
            *((_QWORD *)&v47 + 1) = v24 - v26;
            length = v32;
            if ((uint64_t)v47 >= v25 - v26)
              v29 = v25 - v26;
            v49.length = v29 + v26 + v23;
            v49.location = v24 - v26 + *((_QWORD *)&v46 + 1);
            CFStringGetCharacters(theStringa[0], v49, buffer);
            v31 = *((_QWORD *)&v47 + 1);
          }
          v30 = buffer[v24 - v31];
        }
        v28 = v30;
      }
      if (v27 != u_charDigitValue(v28))
        goto LABEL_21;
      ++v24;
      --v23;
      ++v25;
    }
    while (v22 != v24);
  }
  if (v33)
    *v33 = v22;
  return v18;
}

unsigned int *UIPhoneFormatCountryGetCount(unsigned int *result)
{
  if (result)
    return (unsigned int *)*result;
  return result;
}

uint64_t _NumberRangeWithoutVerticalServiceCode(const __CFString *a1, const char *a2, int a3)
{
  uint64_t v6;
  unsigned int *v7;
  int v8;
  BOOL v9;
  size_t v10;
  int CharacterAtIndex;
  int v12;
  UChar32 v13;
  UChar32 v14;
  CFIndex Length;
  uint64_t v16;
  char v17;
  CFIndex v18;
  uint64_t v19;
  UniChar v20;
  unint64_t v21;
  const __CFAllocator *v22;
  const char *v23;
  size_t v24;
  CFStringRef v25;
  CFStringRef v26;
  uint64_t v27;
  const __CFString *v28;
  const __CFAllocator *v30;
  size_t v31;
  uint64_t v32;
  CFIndex v33;
  CFIndex v34;
  UChar32 v35;
  CFStringRef v36;
  char valid;
  const UniChar *CharactersPtr;
  const char *CStringPtr;
  unsigned int Count;
  int v41;
  const __CFString *theString1;
  uint64_t v43;
  CFIndex v44;
  _OWORD v45[8];
  const __CFString *v46;
  const UniChar *v47;
  const char *v48;
  uint64_t v49;
  CFIndex v50;
  uint64_t v51;
  uint64_t v52;
  CFRange v53;
  CFRange v54;

  v6 = PNGetFormatFileHeader();
  if (v6)
  {
    v7 = (unsigned int *)v6;
    if (a2)
    {
      if (strlen(a2) >= 3)
      {
        v8 = *(unsigned __int8 *)a2;
        v9 = v8 == 42;
        if ((v8 == 35 || v8 == 42) && u_isdigit(a2[1]) && u_isdigit(a2[2]))
        {
          v10 = strlen(a2);
          a1 = CFStringCreateWithBytesNoCopy((CFAllocatorRef)*MEMORY[0x24BDBD240], (const UInt8 *)a2, v10, 0x8000100u, 0, (CFAllocatorRef)*MEMORY[0x24BDBD258]);
          goto LABEL_17;
        }
      }
    }
    else if ((unint64_t)CFStringGetLength(a1) >= 3)
    {
      CharacterAtIndex = CFStringGetCharacterAtIndex(a1, 0);
      v12 = CFStringGetCharacterAtIndex(a1, 0);
      v9 = CharacterAtIndex == 42;
      if (CharacterAtIndex == 42 || v12 == 35)
      {
        v13 = CFStringGetCharacterAtIndex(a1, 1);
        if (u_isdigit(v13))
        {
          v14 = CFStringGetCharacterAtIndex(a1, 2);
          if (u_isdigit(v14))
          {
            CFRetain(a1);
LABEL_17:
            Length = CFStringGetLength(a1);
            if (Length < 2)
            {
              v27 = -1;
            }
            else
            {
              v16 = Length;
              v17 = 0;
              v18 = Length - 1;
              v19 = -1;
              do
              {
                if (a2)
                  v20 = a2[v18];
                else
                  v20 = CFStringGetCharacterAtIndex(a1, v18);
                if (v20 == 42 || v20 == 35)
                {
                  if (v19 == -1)
                    v19 = v18;
                  v17 = 1;
                }
                v21 = v18-- + 1;
              }
              while (v21 > 2);
              if (v19 == -1)
              {
                v27 = -1;
                if (v17 & 1 | !v9 || v16 < 4)
                  goto LABEL_62;
                v30 = (const __CFAllocator *)*MEMORY[0x24BDBD240];
                v41 = a3;
                v31 = strlen((const char *)&v7[3 * a3 + 2]);
                theString1 = CFStringCreateWithBytesNoCopy((CFAllocatorRef)*MEMORY[0x24BDBD240], (const UInt8 *)&v7[3 * a3 + 2], v31, 0x8000100u, 0, (CFAllocatorRef)*MEMORY[0x24BDBD258]);
                if (v16 >= 5)
                  v32 = 5;
                else
                  v32 = v16;
                v33 = 3;
                v34 = v16 - 3;
                while (v32 != v33)
                {
                  v35 = CFStringGetCharacterAtIndex(a1, v33);
                  if (!u_isdigit(v35))
                    break;
                  v54.location = v33;
                  v54.length = v34;
                  v36 = CFStringCreateWithSubstring(v30, a1, v54);
                  valid = _PNIsValidPhoneNumberForCountry(v36, theString1, 0, 1, 0);
                  CFRelease(v36);
                  ++v33;
                  --v34;
                  if ((valid & 1) != 0)
                  {
                    v27 = v33 - 1;
                    goto LABEL_60;
                  }
                }
                memset(v45, 0, sizeof(v45));
                v43 = 0;
                v44 = CFStringGetLength(a1);
                v46 = a1;
                v49 = 0;
                v50 = v44;
                CharactersPtr = CFStringGetCharactersPtr(a1);
                CStringPtr = 0;
                v47 = CharactersPtr;
                if (!CharactersPtr)
                  CStringPtr = CFStringGetCStringPtr(a1, 0x600u);
                v51 = 0;
                v52 = 0;
                v48 = CStringPtr;
                Count = UIPhoneFormatCountryGetCount(v7);
                if (_FindFormatEntryForDigitsInCountry((unsigned __int16 *)((char *)&v7[3 * Count + 1] + v7[3 * v41 + 3]), (uint64_t)v45, 0, &v43, 0, 0, 0))
                {
                  v27 = -1;
                }
                else if (CFStringGetCharacterAtIndex(a1, 3) == 43)
                {
                  v27 = 3;
                }
                else if (v16 >= 5 && CFStringGetCharacterAtIndex(a1, 4) == 43)
                {
                  v27 = 4;
                }
                else if (CFStringCompare(theString1, CFSTR("us"), 0))
                {
                  v27 = -1;
                }
                else
                {
                  v27 = 3;
                }
LABEL_60:
                v28 = theString1;
              }
              else
              {
                v22 = (const __CFAllocator *)*MEMORY[0x24BDBD240];
                v23 = (const char *)&v7[3 * a3 + 2];
                v24 = strlen(v23);
                v25 = CFStringCreateWithBytesNoCopy((CFAllocatorRef)*MEMORY[0x24BDBD240], (const UInt8 *)v23, v24, 0x8000100u, 0, (CFAllocatorRef)*MEMORY[0x24BDBD258]);
                v53.length = v16 + ~v19;
                v53.location = v19 + 1;
                v26 = CFStringCreateWithSubstring(v22, a1, v53);
                if (_PNIsValidPhoneNumberForCountry(v26, v25, 1, 1, 0))
                  v27 = v19 + 1;
                else
                  v27 = -1;
                CFRelease(v26);
                v28 = v25;
              }
              CFRelease(v28);
            }
LABEL_62:
            CFRelease(a1);
            return v27;
          }
        }
      }
    }
    return -1;
  }
  else
  {
    if (a2)
      strlen(a2);
    else
      CFStringGetLength(a1);
    return 0;
  }
}

uint64_t InlineBufferHasPatternAtOffset(UniChar *buffer, uint64_t a2, char *a3, uint64_t a4)
{
  char v4;
  int v9;
  uint64_t v10;
  char *v11;
  int64_t v12;
  UniChar v13;
  int64_t v14;
  uint64_t v15;
  uint64_t v16;
  int64_t v17;
  int64_t v18;
  UChar32 v19;
  int v20;
  BOOL v21;
  int32_t v22;
  UChar32 v23;
  int v24;
  unsigned int v25;
  char v26;
  CFRange v28;

  v4 = *a3;
  if (!*a3)
    return v4 & 1;
  v9 = 0;
  LODWORD(v10) = 0;
  v11 = a3;
  while (1)
  {
    v12 = a4 + v9;
    if (a2)
    {
      v13 = *(char *)(a2 + v12);
      goto LABEL_19;
    }
    if (v12 < 0)
      break;
    v14 = *((_QWORD *)buffer + 20);
    if (v14 <= v12)
      break;
    v15 = *((_QWORD *)buffer + 17);
    if (v15)
    {
      v13 = *(_WORD *)(v15 + 2 * (*((_QWORD *)buffer + 19) + v12));
    }
    else
    {
      v16 = *((_QWORD *)buffer + 18);
      if (v16)
      {
        v13 = *(char *)(v16 + *((_QWORD *)buffer + 19) + v12);
      }
      else
      {
        if (*((_QWORD *)buffer + 22) <= v12 || (v17 = *((_QWORD *)buffer + 21), v17 > v12))
        {
          v18 = v12 - 4;
          if ((unint64_t)v12 < 4)
            v18 = 0;
          if (v18 + 64 < v14)
            v14 = v18 + 64;
          *((_QWORD *)buffer + 21) = v18;
          *((_QWORD *)buffer + 22) = v14;
          v28.location = *((_QWORD *)buffer + 19) + v18;
          v28.length = v14 - v18;
          CFStringGetCharacters(*((CFStringRef *)buffer + 16), v28, buffer);
          v17 = *((_QWORD *)buffer + 21);
        }
        v13 = buffer[v12 - v17];
      }
    }
LABEL_19:
    v19 = v13;
    if (!v13)
      break;
    v20 = *v11;
    v21 = (v20 & 0xFE) != 0x2A || v19 == v20;
    if (!v21 || u_isdigit((char)v20) && (v22 = u_charDigitValue(*v11), v22 != u_charDigitValue(v19)))
    {
LABEL_38:
      v26 = 0;
      LOBYTE(v24) = 0;
      goto LABEL_40;
    }
    v23 = *v11;
    if (v23 != 92)
      goto LABEL_44;
    v24 = a3[(int)v10 + 1];
    if (v19 != 35 && v24 == 35)
      goto LABEL_38;
    if (v24 == 35)
    {
      ++v9;
      LODWORD(v10) = v10 + 1;
    }
    else
    {
LABEL_44:
      if (u_isdigit(v23)
        || (v25 = *v11, v25 <= 0x2B) && (LOBYTE(v24) = 1, ((1 << v25) & 0xC0800000000) != 0))
      {
        ++v9;
      }
    }
    v10 = (int)v10 + 1;
    v11 = &a3[v10];
    if (!a3[v10])
    {
      v26 = 1;
      goto LABEL_40;
    }
  }
  v26 = 0;
  LOBYTE(v24) = 1;
LABEL_40:
  v4 = v26 | v24;
  return v4 & 1;
}

uint64_t _FormatEntryAndNationalPrefixForDigitsInCountry(uint64_t a1, UniChar *a2, char *__s1, uint64_t *a4, int a5, unsigned __int8 **a6, CFStringRef *a7, uint64_t a8)
{
  unsigned __int8 *NationalAccessCodeForDigitsInCountry;
  uint64_t result;
  uint64_t v18;

  if ((a5 & 1) != 0)
    NationalAccessCodeForDigitsInCountry = 0;
  else
    NationalAccessCodeForDigitsInCountry = _FindNationalAccessCodeForDigitsInCountry(a2, (uint64_t)__s1, a4, (unsigned __int8 *)(a1 + 12), a7);
  *a6 = NationalAccessCodeForDigitsInCountry;
  result = _FindFormatEntryForDigitsInCountry((unsigned __int16 *)a1, (uint64_t)a2, __s1, a4, a5, NationalAccessCodeForDigitsInCountry != 0, a8);
  if (a5)
  {
    if (!result)
    {
      v18 = a4[1];
      result = (uint64_t)_FindNationalAccessCodeForDigitsInCountry(a2, (uint64_t)__s1, a4, (unsigned __int8 *)(a1 + 12), a7);
      if (result)
      {
        if (a8)
        {
          *(_BYTE *)(a8 + 41) = 1;
          *(_QWORD *)(a8 + 56) = v18 - a4[1];
        }
        result = _FindFormatEntryForDigitsInCountry((unsigned __int16 *)a1, (uint64_t)a2, __s1, a4, 1, *a6 != 0, a8);
      }
    }
  }
  if ((a5 & 1) == 0 && !*a6 && result && (*(_WORD *)(a1 + 2) & 1) != 0 && (*(_BYTE *)(result + 12) & 1) != 0)
    return 0;
  return result;
}

uint64_t _FindFormatEntryForDigitsInCountry(unsigned __int16 *a1, uint64_t a2, char *__s1, uint64_t *a4, int a5, int a6, uint64_t a7)
{
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  unsigned int v12;
  uint64_t v13;
  int64_t v14;
  int v15;
  int64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  int64_t v20;
  int64_t v21;
  uint64_t v22;
  unsigned __int16 *v23;
  uint64_t result;
  unsigned int v25;
  unsigned __int16 *v26;
  int v27;
  uint64_t v28;
  uint64_t v29;
  unsigned int v30;
  uint64_t v31;
  unsigned __int16 *v32;
  uint64_t v33;
  unsigned int v34;
  uint64_t v35;
  unsigned __int16 *v36;
  _BYTE *v37;
  char v38;
  uint64_t v39;
  unsigned __int8 *v40;
  int64_t v41;
  int v42;
  int64_t v43;
  uint64_t v44;
  int v45;
  _BOOL4 v46;
  uint64_t v47;
  int64_t v48;
  int64_t v49;
  uint64_t v50;
  uint64_t v51;
  size_t v52;
  size_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  size_t v57;
  uint64_t v58;
  UChar32 v59;
  uint64_t v60;
  uint64_t v61;
  unsigned __int16 v62;
  int32_t v63;
  BOOL v64;
  uint64_t v65;
  BOOL v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  int v75;
  BOOL v76;
  uint64_t v78;
  int v81;
  uint64_t v83;
  uint64_t v84;
  CFRange v85;
  CFRange v86;
  CFRange v87;

  v9 = a2;
  v10 = *a1;
  if (a4[1] < 1)
  {
    LODWORD(v13) = 0;
  }
  else
  {
    v11 = 0;
    v12 = 0;
    v13 = 0;
    do
    {
      v14 = *a4 + v11;
      if (__s1)
      {
        v15 = __s1[v14];
      }
      else
      {
        if (v14 < 0 || (v16 = *(_QWORD *)(v9 + 160), v16 <= v14))
        {
          LOWORD(v15) = 0;
        }
        else
        {
          v17 = *(_QWORD *)(v9 + 136);
          if (v17)
          {
            LOWORD(v15) = *(_WORD *)(v17 + 2 * (*(_QWORD *)(v9 + 152) + v14));
          }
          else
          {
            v19 = *(_QWORD *)(v9 + 144);
            if (v19)
            {
              LOWORD(v15) = *(char *)(v19 + *(_QWORD *)(v9 + 152) + v14);
            }
            else
            {
              if (*(_QWORD *)(v9 + 176) <= v14 || (v20 = *(_QWORD *)(v9 + 168), v20 > v14))
              {
                v21 = v14 - 4;
                if ((unint64_t)v14 < 4)
                  v21 = 0;
                if (v21 + 64 < v16)
                  v16 = v21 + 64;
                *(_QWORD *)(v9 + 168) = v21;
                *(_QWORD *)(v9 + 176) = v16;
                v22 = v13;
                v85.location = *(_QWORD *)(v9 + 152) + v21;
                v85.length = v16 - v21;
                CFStringGetCharacters(*(CFStringRef *)(v9 + 128), v85, (UniChar *)a2);
                v13 = v22;
                v9 = a2;
                v20 = *(_QWORD *)(a2 + 168);
              }
              LOWORD(v15) = *(_WORD *)(v9 + 2 * (v14 - v20));
            }
          }
        }
        v15 = (unsigned __int16)v15;
      }
      if (v15 == 42 || v15 == 35)
      {
        v13 = (v13 + 1);
        v18 = a4[1];
      }
      else
      {
        v18 = a4[1];
        v12 = v18;
      }
      v11 = ++v12;
    }
    while (v18 > v12);
  }
  v23 = a1;
  if (!*((_DWORD *)a1 + 2))
    return 0;
  result = 0;
  v25 = 0;
  v26 = (unsigned __int16 *)((char *)a1 + v10);
  if (a5)
    v27 = 2;
  else
    v27 = 0;
  v75 = v27 | a6;
  v28 = v13;
  v76 = (v9 | (unint64_t)__s1) == 0;
  v73 = v13 + 64;
  v81 = v13;
  v78 = v13;
  do
  {
    v29 = *v26;
    if (a4[1] - v28 < v29)
      goto LABEL_109;
    v83 = result;
    if (v76)
      goto LABEL_35;
    v30 = 0;
    if (*v26)
    {
      v50 = *a4;
      v51 = *a4 + v28;
      if ((v51 & 0x8000000000000000) == 0)
      {
        v52 = v51 + v29;
        if (__s1)
        {
          v53 = strnlen(__s1, v52);
          v9 = a2;
          LODWORD(v13) = v81;
        }
        else if ((*(_QWORD *)(v9 + 160) & (unint64_t)~(*(uint64_t *)(v9 + 160) >> 63)) >= v52)
        {
          v53 = v51 + v29;
        }
        else
        {
          v53 = *(_QWORD *)(v9 + 160) & ~(*(uint64_t *)(v9 + 160) >> 63);
        }
        if (v51 < v53)
        {
          LODWORD(v54) = 0;
          v55 = -v51;
          v56 = v73 + v50;
          v57 = v53;
          while (1)
          {
            v58 = (unint64_t)v51 >= 4 ? 4 : v51;
            if (__s1)
            {
              v59 = __s1[v51];
            }
            else
            {
              if (v51 < 0 || (v60 = *(_QWORD *)(v9 + 160), v60 <= v51))
              {
                v62 = 0;
              }
              else
              {
                v61 = *(_QWORD *)(v9 + 136);
                if (v61)
                {
                  v62 = *(_WORD *)(v61 + 2 * (v51 + *(_QWORD *)(v9 + 152)));
                }
                else
                {
                  v67 = *(_QWORD *)(v9 + 144);
                  if (v67)
                  {
                    v62 = *(char *)(v67 + *(_QWORD *)(v9 + 152) + v51);
                  }
                  else
                  {
                    if (*(_QWORD *)(v9 + 176) <= v51 || (v68 = *(_QWORD *)(v9 + 168), v68 > v51))
                    {
                      v69 = v58 + v55;
                      v70 = v56 - v58;
                      v71 = v51 - v58;
                      v72 = v71 + 64;
                      if (v71 + 64 >= v60)
                        v72 = *(_QWORD *)(v9 + 160);
                      *(_QWORD *)(v9 + 168) = v71;
                      *(_QWORD *)(v9 + 176) = v72;
                      if (v60 >= v70)
                        v60 = v70;
                      v87.length = v60 + v69;
                      v87.location = v71 + *(_QWORD *)(v9 + 152);
                      CFStringGetCharacters(*(CFStringRef *)(v9 + 128), v87, (UniChar *)a2);
                      v9 = a2;
                      v68 = *(_QWORD *)(a2 + 168);
                    }
                    v62 = *(_WORD *)(v9 - 2 * v68 + 2 * v51);
                  }
                }
              }
              v59 = v62;
            }
            v63 = u_charDigitValue(v59);
            v30 = 0;
            v64 = ((10 * v54) & 0xFFFFFFFF00000000) != 0;
            v65 = (10 * v54) + (uint64_t)v63;
            v54 = v65 << 31 >> 31;
            v66 = v54 != v65;
            if (v64 || v66)
              break;
            v9 = a2;
            LODWORD(v13) = v81;
            if ((v54 & 0x8000000000000000) == 0)
            {
              ++v51;
              --v55;
              ++v56;
              v30 = v54;
              if (v57 != v51)
                continue;
            }
            goto LABEL_36;
          }
          v9 = a2;
          LODWORD(v13) = v81;
          goto LABEL_36;
        }
LABEL_35:
        v30 = 0;
      }
    }
LABEL_36:
    if (!v26[1])
    {
      v28 = v78;
      v23 = a1;
      result = v83;
      goto LABEL_109;
    }
    v31 = 0;
    v28 = v78;
    v23 = a1;
    result = v83;
    while (2)
    {
      v32 = &v26[8 * v31];
      v34 = *((_DWORD *)v32 + 1);
      v33 = (uint64_t)(v32 + 2);
      if (v30 < v34)
        goto LABEL_102;
      if (v30 > *(_DWORD *)&v26[8 * v31 + 4])
        goto LABEL_102;
      v35 = a4[1];
      v36 = &v26[8 * v31];
      if (v35 - v28 > *((unsigned __int8 *)v36 + 13))
        goto LABEL_102;
      v38 = *((_BYTE *)v36 + 16);
      v37 = v36 + 8;
      if (((_DWORD)v13 == 0) == (v38 & 0x10) >> 4)
        goto LABEL_102;
      if (!(_DWORD)v13)
        goto LABEL_79;
      if (v35 < 1)
      {
        v25 = 0;
        goto LABEL_79;
      }
      v84 = result;
      v39 = 0;
      v25 = 0;
      v40 = (unsigned __int8 *)v23 + *v23 + *((unsigned int *)v23 + 1) + v26[8 * v31 + 9];
      do
      {
        v41 = *a4 + v39;
        if (__s1)
        {
          v42 = __s1[v41];
        }
        else
        {
          if (v41 < 0 || (v43 = *(_QWORD *)(v9 + 160), v43 <= v41))
          {
            LOWORD(v42) = 0;
          }
          else
          {
            v44 = *(_QWORD *)(v9 + 136);
            if (v44)
            {
              LOWORD(v42) = *(_WORD *)(v44 + 2 * (*(_QWORD *)(v9 + 152) + v41));
            }
            else
            {
              v47 = *(_QWORD *)(v9 + 144);
              if (v47)
              {
                LOWORD(v42) = *(char *)(v47 + *(_QWORD *)(v9 + 152) + v41);
              }
              else
              {
                if (*(_QWORD *)(v9 + 176) <= v41 || (v48 = *(_QWORD *)(v9 + 168), v48 > v41))
                {
                  v49 = v41 - 4;
                  if ((unint64_t)v41 < 4)
                    v49 = 0;
                  if (v49 + 64 < v43)
                    v43 = v49 + 64;
                  *(_QWORD *)(v9 + 168) = v49;
                  *(_QWORD *)(v9 + 176) = v43;
                  v86.location = *(_QWORD *)(v9 + 152) + v49;
                  v86.length = v43 - v49;
                  CFStringGetCharacters(*(CFStringRef *)(v9 + 128), v86, (UniChar *)a2);
                  LODWORD(v13) = v81;
                  v9 = a2;
                  v48 = *(_QWORD *)(a2 + 168);
                }
                LOWORD(v42) = *(_WORD *)(v9 + 2 * (v41 - v48));
              }
            }
          }
          v42 = (unsigned __int16)v42;
        }
        if (v42 == 35)
        {
          v46 = *v40 == 92 && v40[1] == 35;
          ++v40;
          goto LABEL_62;
        }
        if (v42 != 42)
        {
          v46 = 1;
LABEL_62:
          v35 = a4[1];
          v25 = v35;
          goto LABEL_63;
        }
        v45 = *v40++;
        v46 = v45 == 42;
        v35 = a4[1];
LABEL_63:
        v39 = ++v25;
      }
      while (v35 > v25 && v46);
      v28 = v78;
      v23 = a1;
      result = v84;
      if (!v46)
        goto LABEL_102;
LABEL_79:
      if (a5 && (*v37 & 0x40) != 0)
        goto LABEL_102;
      if (!result
        || a6 && (*(_BYTE *)(result + 12) & 1) == 0 && (*v37 & 1) != 0
        || a5 && (*(_BYTE *)(result + 12) & 2) == 0 && (*v37 & 2) != 0)
      {
        if (a7)
          goto LABEL_94;
      }
      else
      {
        if (v75)
          goto LABEL_96;
        if ((*(_BYTE *)(result + 12) & 3) == 0)
          goto LABEL_96;
        if ((*v37 & 3) != 0)
          goto LABEL_96;
        result = v33;
        if (!a7)
          goto LABEL_96;
LABEL_94:
        *(_DWORD *)(a7 + 32) = *v26;
        *(_DWORD *)(a7 + 36) = v35;
      }
      result = v33;
LABEL_96:
      if (a6 && (*(_BYTE *)(result + 12) & 1) == 0
        || a5 && (*(_BYTE *)(result + 12) & 2) == 0
        || !v75 && (*(_BYTE *)(result + 12) & 3) != 0)
      {
LABEL_102:
        if (++v31 >= (unint64_t)v26[1])
          break;
        continue;
      }
      break;
    }
LABEL_109:
    v26 += 8 * v26[1] + 2;
    ++v25;
  }
  while (v25 < *((_DWORD *)v23 + 2));
  return result;
}

uint64_t _UIPhoneFormatEntryReplacementCountryCodeRange(unsigned __int16 *a1, uint64_t a2)
{
  uint64_t v2;
  unint64_t v3;
  uint64_t v4;

  v2 = 0;
  v3 = (unint64_t)a1 + *a1 + *((unsigned int *)a1 + 1) + (unint64_t)*(unsigned __int16 *)(a2 + 14);
  v4 = -1;
  while (*(_BYTE *)(v3 + v2) == 91)
  {
    if (*(_BYTE *)(v3 + v2 + 1) == 91 && !strncmp("country:", (const char *)(v3 + v2 + 2), 8uLL))
      v4 = v2 + 10;
LABEL_8:
    ++v2;
  }
  if (*(_BYTE *)(v3 + v2))
    goto LABEL_8;
  return v4;
}

uint64_t NumberOfDigitsRequiredForPattern(unsigned __int8 *a1)
{
  unsigned __int8 *v1;
  int v2;
  uint64_t result;
  int v4;
  unsigned int v5;
  char v7;

  v1 = a1;
  v2 = *a1;
  result = v2 == 43;
  while (v2 == 92)
  {
    if (v1[1] == 35)
    {
      ++v1;
      goto LABEL_13;
    }
LABEL_7:
    v4 = v2;
    v5 = (char)v2 - 48;
    if (v4 != 35 && v5 >= 0xA)
      result = result;
    else
      result = (result + 1);
LABEL_13:
    v7 = *++v1;
    LOBYTE(v2) = v7;
  }
  if ((_BYTE)v2)
    goto LABEL_7;
  return result;
}

BOOL decomposedPhoneNumbersEqual(uint64_t a1, uint64_t a2, char a3, _BYTE *a4)
{
  size_t v8;
  _BOOL8 v9;
  _BOOL8 v10;
  uint64_t v11;
  size_t v12;
  BOOL v13;
  BOOL v14;

  if (!itu_streql(*(const char **)a1, *(const char **)a2))
  {
    v10 = 0;
    LOBYTE(v11) = 0;
    if (!a4)
      return v10;
    goto LABEL_26;
  }
  v8 = *(unsigned int *)(a1 + 40);
  v9 = (_DWORD)v8 == *(_DWORD *)(a2 + 40) && itu_strneql(*(const char **)(a1 + 32), *(const char **)(a2 + 32), v8);
  v12 = *(unsigned int *)(a1 + 56);
  if ((_DWORD)v12 == *(_DWORD *)(a2 + 56))
  {
    v13 = itu_strneql(*(const char **)(a1 + 48), *(const char **)(a2 + 48), v12);
    LOBYTE(v10) = v13;
    if ((a3 & 1) != 0)
    {
      LOBYTE(v11) = 1;
      if (v13)
        goto LABEL_25;
LABEL_20:
      v10 = 0;
      if (!a4)
        return v10;
      goto LABEL_26;
    }
  }
  else
  {
    v10 = 0;
    if ((a3 & 1) != 0)
    {
      LOBYTE(v11) = 1;
      if (!a4)
        return v10;
      goto LABEL_26;
    }
  }
  if (*(_QWORD *)a1)
    v14 = strcmp(*(const char **)a1, "86") == 0;
  else
    v14 = 0;
  LOBYTE(v11) = v14 || v10 && v9;
  if (!v10)
    goto LABEL_20;
  if ((v11 & 1) != 0)
  {
    LOBYTE(v11) = 1;
  }
  else
  {
    v11 = *(_QWORD *)(a1 + 32);
    if (v11)
    {
      LOBYTE(v11) = 0;
      v9 = *(_QWORD *)(a2 + 32) == 0;
    }
    else
    {
      v9 = 1;
    }
  }
LABEL_25:
  v10 = v9;
  if (a4)
LABEL_26:
    *a4 = v11;
  return v10;
}

BOOL itu_strneql(const char *a1, const char *a2, size_t a3)
{
  if (!a1 && a2)
    return 0;
  if (a1 == a2)
    return 1;
  if (a1 && !a2)
    return 0;
  return strncmp(a1, a2, a3) == 0;
}

BOOL itu_streql(const char *a1, const char *a2)
{
  if (!a1 && a2)
    return 0;
  if (a1 == a2)
    return 1;
  if (a1 && !a2)
    return 0;
  return strcmp(a1, a2) == 0;
}

CFStringRef _CreateFormattedStringForDigitsInRange(uint64_t a1, uint64_t a2, uint64_t a3, size_t a4, char *__s, char a6, const __CFString *a7, const __CFString *a8, char a9)
{
  const __CFString *v9;
  BOOL v13;
  int v14;
  size_t v15;
  CFIndex Length;
  CFIndex v17;
  size_t v18;
  size_t v19;
  void *v20;
  uint64_t v21;
  char v22;
  UniChar *v23;
  unint64_t v24;
  char v25;
  const __CFString *v26;
  int v27;
  BOOL v28;
  size_t v29;
  uint64_t v30;
  int v31;
  uint64_t v32;
  CFIndex v33;
  int64_t v34;
  UniChar v35;
  int64_t v36;
  UniChar v37;
  uint64_t v38;
  int64_t v39;
  uint64_t v40;
  int32_t v41;
  BOOL v42;
  uint64_t v43;
  int64_t v44;
  uint64_t v45;
  CFIndex v46;
  UChar *v47;
  int32_t v48;
  uint64_t v49;
  unint64_t v50;
  uint64_t v51;
  unint64_t v52;
  unint64_t v53;
  uint64_t v54;
  unint64_t v55;
  unint64_t v56;
  UniChar *v57;
  uint64_t v58;
  uint64_t v59;
  UniChar v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  unint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  int v73;
  CFIndex v74;
  CFIndex v75;
  UniChar *v76;
  uint64_t v77;
  CFIndex v78;
  uint64_t v79;
  int64_t v80;
  int64_t v81;
  int64_t v82;
  int64_t v83;
  int v84;
  const __CFAllocator *v85;
  int32_t v86;
  uint64_t v88;
  unint64_t v89;
  void *v90;
  size_t v91;
  uint64_t v92;
  unint64_t v93;
  const __CFString *theString;
  _BOOL4 v95;
  const __CFString *v96;
  uint64_t v98;
  int v100;
  unint64_t v101;
  CFRange v104;
  CFRange v105;
  CFRange v106;
  CFRange v107;
  CFRange v108;
  CFRange v109;
  CFRange v110;

  v9 = a8;
  if (a7)
    v13 = a8 == 0;
  else
    v13 = 1;
  v14 = !v13;
  v15 = strlen(__s);
  if (a7)
  {
    Length = CFStringGetLength(a7);
    if (v9)
    {
LABEL_9:
      v17 = CFStringGetLength(v9);
      goto LABEL_12;
    }
  }
  else
  {
    Length = 0;
    if (v9)
      goto LABEL_9;
  }
  v17 = 0;
LABEL_12:
  v18 = v15 + 4;
  if (!v14)
    v18 = v15 + 1;
  v19 = v18 + Length + v17;
  v20 = malloc_type_malloc(2 * v19, 0x743F1568uLL);
  bzero(v20, 2 * v19);
  v21 = 0;
  v22 = *__s;
  if (!*__s)
  {
    v23 = (UniChar *)v20;
    goto LABEL_165;
  }
  v23 = (UniChar *)v20;
  if (a4)
  {
    v92 = 2 * v19;
    v24 = 0;
    v21 = 0;
    v100 = 0;
    v25 = 0;
    v26 = a7;
    v27 = 0;
    v98 = 0;
    v28 = 0;
    theString = v26;
    v95 = v26 == 0;
    if (a4 >= v19)
      v29 = v19;
    else
      v29 = a4;
    v93 = v29;
    v30 = a2;
    v23 = (UniChar *)v20;
    v96 = v9;
    while (1)
    {
      if (v28)
      {
        if (v22 != 93)
        {
          v25 = 0;
          v28 = 1;
          goto LABEL_72;
        }
        v25 = 0;
        v31 = __s[v21 + 1];
        v13 = v31 == 93;
        v28 = v31 != 93;
        if (v13)
          v32 = v21 + 1;
        else
          v32 = v21;
      }
      else
      {
        if (v22 <= 90)
        {
          switch(v22)
          {
            case ' ':
              v28 = 0;
              if (((v27 | HIDWORD(v98) | v98) & 1) != 0 && ((a6 & 8) == 0) | v25 & 1)
                goto LABEL_71;
              v25 = 0;
              goto LABEL_72;
            case '!':
            case '"':
            case '$':
            case '%':
            case '&':
            case '\'':
              goto LABEL_43;
            case '#':
              v36 = v24 + a3;
              if (v30)
              {
                v37 = *(char *)(v30 + v36);
              }
              else if (v36 < 0 || (v43 = a1, v44 = *(_QWORD *)(a1 + 160), v44 <= v36))
              {
                v37 = 0;
              }
              else
              {
                v45 = *(_QWORD *)(a1 + 136);
                if (v45)
                {
                  v37 = *(_WORD *)(v45 + 2 * (*(_QWORD *)(a1 + 152) + v36));
                }
                else
                {
                  v79 = *(_QWORD *)(a1 + 144);
                  if (v79)
                  {
                    v37 = *(char *)(v79 + *(_QWORD *)(a1 + 152) + v36);
                  }
                  else
                  {
                    if (*(_QWORD *)(a1 + 176) <= v36 || (v82 = *(_QWORD *)(a1 + 168), v82 > v36))
                    {
                      v83 = v36 - 4;
                      if ((unint64_t)v36 < 4)
                        v83 = 0;
                      if (v83 + 64 < v44)
                        v44 = v83 + 64;
                      *(_QWORD *)(a1 + 168) = v83;
                      *(_QWORD *)(a1 + 176) = v44;
                      v110.location = *(_QWORD *)(a1 + 152) + v83;
                      v110.length = v44 - v83;
                      CFStringGetCharacters(*(CFStringRef *)(a1 + 128), v110, (UniChar *)a1);
                      v43 = a1;
                      v82 = *(_QWORD *)(a1 + 168);
                    }
                    v37 = *(_WORD *)(v43 + 2 * (v36 - v82));
                  }
                }
              }
              *v23 = v37;
              if (pn_uset_basicPresentationSetContains() == 1)
              {
                v28 = 0;
                v25 = 0;
                ++v23;
                goto LABEL_90;
              }
              *v23 = 0;
              if ((v100 & 1) != 0)
              {
                v47 = u_strrchr((const UChar *)v20, 0x28u);
                if (v47 < v23)
                {
                  if ((char *)v23 - (char *)v47 >= 2)
                    v48 = ((unint64_t)((char *)v23 - (char *)v47) >> 1) - 1;
                  else
                    v48 = 0;
                  u_strncpy(v47, v47 + 1, v48);
                  *--v23 = 0;
                }
              }
              v30 = a2;
              v49 = a1;
              v50 = v93 - v24;
              if (v93 <= v24)
              {
                v28 = 0;
                v25 = 0;
                v100 = 0;
                v27 = 1;
                goto LABEL_72;
              }
              v90 = v20;
              v91 = a4;
              v51 = 0;
              v52 = a2 + a3 + v24;
              v53 = a3 + v24;
              v54 = -(uint64_t)(a3 + v24);
              v55 = a3 + 64 + v24;
              v56 = v53;
              v57 = v23;
              v58 = a1 + 2 * v53;
              do
              {
                if (v56 >= 4)
                  v59 = 4;
                else
                  v59 = v56;
                if (v30)
                {
                  v60 = *(char *)(v52 + v51);
                }
                else
                {
                  v61 = v53 + v51;
                  if (((v53 + v51) & 0x8000000000000000) != 0 || (v62 = *(_QWORD *)(v49 + 160), v62 <= v61))
                  {
                    v60 = 0;
                  }
                  else
                  {
                    v63 = v49;
                    v64 = *(_QWORD *)(v49 + 136);
                    if (v64)
                    {
                      v60 = *(_WORD *)(v64 + 2 * (v53 + v51 + *(_QWORD *)(v63 + 152)));
                    }
                    else
                    {
                      v65 = *(_QWORD *)(v63 + 144);
                      if (v65)
                      {
                        v60 = *(char *)(v65 + *(_QWORD *)(v63 + 152) + v53 + v51);
                      }
                      else
                      {
                        if (*(_QWORD *)(v63 + 176) <= v61 || (v66 = *(_QWORD *)(v63 + 168), v66 > v61))
                        {
                          v67 = v53 - v59;
                          v68 = v59 + v54;
                          v69 = v55 - v59;
                          v70 = v51 + v67;
                          v71 = v70 + 64;
                          if (v70 + 64 >= v62)
                            v71 = v62;
                          *(_QWORD *)(v63 + 168) = v70;
                          *(_QWORD *)(v63 + 176) = v71;
                          if (v62 >= v69)
                            v62 = v69;
                          v106.length = v62 + v68;
                          v101 = v52;
                          v88 = v58;
                          v89 = v53;
                          v106.location = v70 + *(_QWORD *)(v63 + 152);
                          CFStringGetCharacters(*(CFStringRef *)(v63 + 128), v106, (UniChar *)v63);
                          v58 = v88;
                          v53 = v89;
                          v52 = v101;
                          v30 = a2;
                          v66 = *(_QWORD *)(v63 + 168);
                        }
                        v60 = *(_WORD *)(v58 - 2 * v66 + 2 * v51);
                      }
                    }
                    v49 = v63;
                  }
                }
                v23[v51] = v60;
                ++v57;
                ++v51;
                ++v56;
                --v54;
                ++v55;
                v27 = 1;
              }
              while (v50 != v51);
              v28 = 0;
              v25 = 0;
              v100 = 0;
              v23 = v57;
              v32 = v21;
              v24 = v93;
              v20 = v90;
              a4 = v91;
              v9 = v96;
              goto LABEL_73;
            case '(':
              v100 = 1;
              if ((a6 & 4) != 0)
                goto LABEL_57;
              goto LABEL_71;
            case ')':
              if (((v27 | HIDWORD(v98) | v98) & 1) == 0 && ((v100 ^ 1) & 1) == 0)
              {
                bzero(v20, v92);
                v30 = a2;
                v28 = 0;
                v98 = 0;
                v27 = 0;
                v25 = 0;
                v100 = 0;
                v23 = (UniChar *)v20;
                goto LABEL_72;
              }
              v100 = 0;
              if ((a6 & 4) == 0)
                goto LABEL_71;
              v25 = 0;
              v28 = 0;
              break;
            default:
              if (v22 != 45)
                goto LABEL_43;
              if ((a6 & 8) == 0)
                goto LABEL_71;
              goto LABEL_57;
          }
          goto LABEL_72;
        }
        if (v22 > 98)
        {
          if (v22 == 99)
          {
            if (v9)
            {
              if ((v98 & 1) != 0)
              {
                v28 = 0;
                v25 = 0;
                LODWORD(v98) = 1;
              }
              else
              {
                if ((a6 & 2) != 0)
                {
                  do
                  {
                    v72 = v21 + 1;
                    v73 = __s[++v21];
                  }
                  while (v73 == 32);
                  v21 = v72 - 1;
                }
                else
                {
                  v46 = CFStringGetLength(v9);
                  v105.location = 0;
                  v105.length = v46;
                  CFStringGetCharacters(v9, v105, v23);
                  v30 = a2;
                  v23 += v46;
                }
                v28 = (char)theString;
                if (theString)
                {
                  if ((v98 & 0x100000000) == 0)
                  {
                    v74 = CFStringGetLength(theString);
                    *v23 = 32;
                    if ((a6 & 4) != 0)
                    {
                      v108.location = 0;
                      v78 = v74;
                      v108.length = v74;
                      CFStringGetCharacters(theString, v108, v23 + 1);
                      v28 = 0;
                      v25 = 1;
                      v98 = 0x100000001;
                      v32 = v21;
                      v23 += v78 + 1;
                    }
                    else
                    {
                      v23[1] = 40;
                      v107.location = 0;
                      v75 = v74;
                      v107.length = v74;
                      CFStringGetCharacters(theString, v107, v23 + 2);
                      v28 = 0;
                      v76 = &v23[v75 + 2];
                      *v76 = 41;
                      v23 = v76 + 1;
                      v25 = 1;
                      v98 = 0x100000001;
                      v32 = v21;
                    }
LABEL_91:
                    v30 = a2;
                    goto LABEL_73;
                  }
                  v28 = 0;
                  v25 = 1;
                  HIDWORD(v98) = 1;
                }
                else
                {
                  v25 = 1;
                }
                LODWORD(v98) = 1;
              }
            }
            else
            {
LABEL_57:
              v28 = 0;
              v25 = 0;
            }
LABEL_72:
            v32 = v21;
            goto LABEL_73;
          }
          if (v22 != 110)
            goto LABEL_43;
          if ((v95 | HIDWORD(v98)) & 1 | (v9 != 0))
            goto LABEL_57;
          v33 = CFStringGetLength(theString);
          v104.location = 0;
          v104.length = v33;
          CFStringGetCharacters(theString, v104, v23);
          v30 = a2;
          v28 = 0;
          v25 = 0;
          HIDWORD(v98) = 1;
          v32 = v21;
          v23 += v33;
        }
        else
        {
          if (v22 != 91)
          {
            if (v22 == 92)
              ++v21;
LABEL_43:
            v34 = v24 + a3;
            if (v30)
            {
              v35 = *(char *)(v30 + v34);
            }
            else if (v34 < 0 || (v38 = a1, v39 = *(_QWORD *)(a1 + 160), v39 <= v34))
            {
              v35 = 0;
            }
            else
            {
              v40 = *(_QWORD *)(a1 + 136);
              if (v40)
              {
                v35 = *(_WORD *)(v40 + 2 * (*(_QWORD *)(a1 + 152) + v34));
              }
              else
              {
                v77 = *(_QWORD *)(a1 + 144);
                if (v77)
                {
                  v35 = *(char *)(v77 + *(_QWORD *)(a1 + 152) + v34);
                }
                else
                {
                  if (*(_QWORD *)(a1 + 176) <= v34 || (v80 = *(_QWORD *)(a1 + 168), v80 > v34))
                  {
                    v81 = v34 - 4;
                    if ((unint64_t)v34 < 4)
                      v81 = 0;
                    if (v81 + 64 < v39)
                      v39 = v81 + 64;
                    *(_QWORD *)(a1 + 168) = v81;
                    *(_QWORD *)(a1 + 176) = v39;
                    v109.location = *(_QWORD *)(a1 + 152) + v81;
                    v109.length = v39 - v81;
                    CFStringGetCharacters(*(CFStringRef *)(a1 + 128), v109, (UniChar *)a1);
                    v38 = a1;
                    v80 = *(_QWORD *)(a1 + 168);
                  }
                  v35 = *(_WORD *)(v38 + 2 * (v34 - v80));
                }
              }
            }
            if (u_isdigit(__s[v21]))
            {
              if (u_isdigit(v35))
              {
                v41 = u_charDigitValue(__s[v21]);
                v13 = v41 == u_charDigitValue(v35);
                v9 = v96;
                if (v13)
                {
                  v28 = 0;
                  v25 = 0;
                  *v23++ = v35;
LABEL_90:
                  ++v24;
                  v27 = 1;
                  v32 = v21;
                  goto LABEL_91;
                }
              }
            }
            if (v35 == __s[v21])
              ++v24;
            v30 = a2;
LABEL_71:
            v28 = 0;
            v25 = 0;
            *v23++ = __s[v21];
            goto LABEL_72;
          }
          v32 = v21 + 1;
          if (__s[v21 + 1] != 91)
            goto LABEL_71;
          v25 = 0;
          v28 = 1;
        }
      }
LABEL_73:
      v21 = v32 + 1;
      v22 = __s[v32 + 1];
      if (v22)
        v42 = v24 >= a4;
      else
        v42 = 1;
      if (v42)
      {
        if (!(((v100 & 1) == 0) | ((a6 & 4) >> 2) & 1))
        {
          while (1)
          {
            v84 = __s[v32 + 1];
            if (v84 == 35)
              break;
            if (v84 == 41)
              goto LABEL_161;
            if (v84 != 92 || __s[v32 + 2] != 35)
            {
              v21 = v32 + 1;
              goto LABEL_165;
            }
LABEL_162:
            ++v32;
          }
          LOWORD(v84) = 32;
LABEL_161:
          *v23++ = v84;
          goto LABEL_162;
        }
        break;
      }
    }
  }
LABEL_165:
  if (a9 && __s[v21] == 32 && !__s[v21 + 1])
    *v23 = 32;
  v85 = (const __CFAllocator *)*MEMORY[0x24BDBD240];
  v86 = u_strlen((const UChar *)v20);
  return CFStringCreateWithCharactersNoCopy(v85, (const UniChar *)v20, v86, (CFAllocatorRef)*MEMORY[0x24BDBD248]);
}

uint64_t pn_uset_basicPresentationSetContains()
{
  uint64_t result;

  os_unfair_lock_lock(&__pn_uset_unfair_lock);
  if (!__pn_uset_getBasicPresentationSet_set)
  {
    os_unfair_lock_assert_owner(&__pn_uset_unfair_lock);
    if ((__pn_uset_getBasicPresentationPattern_didInit & 1) == 0)
    {
      u_charsToUChars("[[+][:Nd:][,;][\\ \"'()\\-./<>\\[\\]][*#]]", __pn_uset_getBasicPresentationPattern_pattern, 38);
      __pn_uset_getBasicPresentationPattern_didInit = 1;
    }
    __pn_uset_getBasicPresentationSet_set = uset_openPattern();
  }
  os_unfair_lock_unlock(&__pn_uset_unfair_lock);
  result = __pn_uset_getBasicPresentationSet_set;
  if (__pn_uset_getBasicPresentationSet_set)
    JUMPOUT(0x20BCF7F44);
  return result;
}

unsigned __int8 *_FindNationalAccessCodeForDigitsInCountry(UniChar *a1, uint64_t a2, uint64_t *a3, unsigned __int8 *a4, CFStringRef *a5)
{
  unsigned __int8 *v6;
  unsigned int v10;
  unsigned int v11;
  unsigned __int8 *v12;
  int v13;
  uint64_t v14;

  if (!*a4)
    return 0;
  v6 = a4;
  while (1)
  {
    v10 = NumberOfDigitsRequiredForPattern(v6);
    if (a3[1] >= (unint64_t)v10)
    {
      v11 = v10;
      if (InlineBufferHasPatternAtOffset(a1, a2, (char *)v6, *a3))
        break;
    }
    v12 = &v6[strlen((const char *)v6)];
    v13 = v12[1];
    v6 = v12 + 1;
    if (!v13)
      return 0;
  }
  if (a5)
    *a5 = _CreateFormattedStringForDigitsInRange((uint64_t)a1, a2, *a3, v11, (char *)v6, 0, 0, 0, 1);
  v14 = a3[1] - v11;
  *a3 += v11;
  a3[1] = v14;
  return v6;
}

CFTypeRef CFPhoneNumberCopyUnformattedRepresentation(uint64_t a1)
{
  return CFRetain(*(CFTypeRef *)(a1 + 40));
}

CFStringRef PNCreateFormattedStringWithCountry(const __CFString *a1, const __CFString *a2, int a3, unsigned int a4)
{
  const __CFString *v5;
  const __CFString *v6;
  CFTypeRef v7;

  if (a1)
  {
    if (a3 == 2)
    {
      v5 = _PNCopyCompressedFormattedStringWithCountry(a1, a2, a4);
      if (v5)
      {
        v6 = v5;
        v7 = _PNCreateLocalizedStringWithString((const __CFAllocator *)*MEMORY[0x24BDBD240], v5);
        CFRelease(v6);
        return (CFStringRef)v7;
      }
    }
    else if (a3 == 1)
    {
      return _PNCopyCompressedFormattedStringWithCountry(a1, a2, a4);
    }
  }
  return 0;
}

CFStringRef _PNCopyCompressedFormattedStringWithCountry(const __CFString *a1, const __CFString *cf, unsigned int a3)
{
  const __CFString *v4;
  const __CFString *v6;
  const __CFString *v7;
  CFStringRef v8;
  CFTypeRef cfa;

  if (!a1)
    return 0;
  v4 = cf;
  if (!cf)
  {
    v4 = PNCopyBestGuessCountryCodeForNumber(a1);
    if (v4)
      goto LABEL_5;
    return 0;
  }
  CFRetain(cf);
LABEL_5:
  cfa = 0;
  v6 = (const __CFString *)_PNCopyStrippedNumberWithoutPauses(a1, (uint64_t)v4, (CFStringRef *)&cfa, 0);
  v7 = _PNCopyFormattedNumberForDigitsWithCountry(v6, v4, a3);
  v8 = _PNCreateStringByAddingPauses(v7, (CFStringRef)cfa);
  CFRelease(v6);
  if (cfa)
    CFRelease(cfa);
  if (v7)
    CFRelease(v7);
  CFRelease(v4);
  return v8;
}

const __CFString *CFPhoneNumberCreateString(const __CFAllocator *a1, uint64_t a2, char a3)
{
  const __CFString *v5;
  const __CFString *v6;
  CFTypeRef v8;

  if (!a2)
    return 0;
  if ((a3 & 1) != 0)
  {
    if ((a3 & 2) != 0)
      v5 = _CFPhoneNumberCopyFormattedInternationalRepresentation(a2);
    else
      v5 = (const __CFString *)_CFPhoneNumberCopyFormattedRepresentation(a2);
  }
  else if ((a3 & 2) != 0)
  {
    v5 = __CFPhoneNumberCopyFullyQualified(a2, 1, 1);
  }
  else
  {
    v5 = (const __CFString *)CFRetain(*(CFTypeRef *)(a2 + 40));
  }
  v6 = v5;
  if (!v5 || (a3 & 4) == 0)
    return v6;
  v8 = _PNCreateLocalizedStringWithString(a1, v5);
  CFRelease(v6);
  return (const __CFString *)v8;
}

CFTypeRef _PNCreateLocalizedStringWithString(const __CFAllocator *a1, CFStringRef theString)
{
  CFIndex Length;
  CFIndex v5;
  const __CFLocale *v6;
  const __CFString *v7;
  const __CFString *Copy;
  void *v9;
  CFMutableStringRef Mutable;
  __CFNumberFormatter *v12;
  CFIndex i;
  const __CFString *v14;
  void *v15;
  __int16 valuePtr;
  CFRange rangep;
  CFRange v18;

  if (!theString)
    return 0;
  Length = CFStringGetLength(theString);
  if (!Length)
    return CFRetain(&stru_24BF25160);
  v5 = Length;
  v6 = CFLocaleCopyCurrent();
  v7 = (const __CFString *)MEMORY[0x20BCF7B6C]();
  if (CFPhoneNumberLocaleGetNumberingSystemFromLocaleIdentifier(v7) == 2)
  {
    Copy = (const __CFString *)CFRetain(theString);
  }
  else
  {
    Mutable = CFStringCreateMutable(a1, v5);
    v12 = CFNumberFormatterCreate(a1, v6, kCFNumberFormatterDecimalStyle);
    if (v5 >= 1)
    {
      for (i = 0; i != v5; ++i)
      {
        rangep.location = i;
        rangep.length = 1;
        valuePtr = 0;
        if (!CFNumberFormatterGetValueFromString(v12, theString, &rangep, kCFNumberShortType, &valuePtr)
          || (v14 = CFNumberFormatterCreateStringWithValue(a1, v12, kCFNumberShortType, &valuePtr)) == 0)
        {
          rangep.length = 1;
          v18.location = rangep.location;
          v18.length = 1;
          v14 = CFStringCreateWithSubstring(a1, theString, v18);
          if (!v14)
            continue;
        }
        CFStringAppend(Mutable, v14);
        CFRelease(v14);
      }
    }
    Copy = CFStringCreateCopy(a1, Mutable);
    CFRelease(Mutable);
    CFRelease(v12);
  }
  if (CFLocaleGetLanguageCharacterDirection(v7) == kCFLocaleLanguageDirectionRightToLeft
    && CFStringGetLength(Copy) >= 1)
  {
    v15 = (void *)CFStringCreateWithFormat(a1, 0, CFSTR("\u202D%@\u202C"), Copy);
  }
  else
  {
    v15 = (void *)CFRetain(Copy);
  }
  v9 = v15;
  if (v6)
    CFRelease(v6);
  if (Copy)
    CFRelease(Copy);
  return v9;
}

uint64_t CFPhoneNumberLocaleGetNumberingSystemFromLocaleIdentifier(CFLocaleIdentifier localeID)
{
  uint64_t v1;
  const __CFAllocator *v2;
  const __CFDictionary *ComponentsFromLocaleIdentifier;
  const __CFDictionary *v4;
  const void *Value;
  const void *v6;
  const __CFString *v7;
  CFIndex Count;
  __CFDictionary *MutableCopy;
  const __CFString *LocaleIdentifierFromComponents;
  const __CFString *v11;
  CFStringRef v12;

  v1 = (uint64_t)localeID;
  if (localeID)
  {
    v2 = (const __CFAllocator *)*MEMORY[0x24BDBD240];
    ComponentsFromLocaleIdentifier = CFLocaleCreateComponentsFromLocaleIdentifier((CFAllocatorRef)*MEMORY[0x24BDBD240], localeID);
    if (!ComponentsFromLocaleIdentifier)
      return 0;
    v4 = ComponentsFromLocaleIdentifier;
    if (CFDictionaryGetCount(ComponentsFromLocaleIdentifier) < 1)
    {
      v1 = 0;
    }
    else
    {
      Value = CFDictionaryGetValue(v4, CFSTR("numbers"));
      if (Value)
      {
        v6 = Value;
        if (CFEqual(Value, CFSTR("default")))
          v7 = __CFPhoneNumberLocaleCopyNumberingSystemNameFromLocaleIdentifier(v2, (CFStringRef)v1);
        else
          v7 = (const __CFString *)CFRetain(v6);
        v12 = v7;
        goto LABEL_15;
      }
      Count = CFDictionaryGetCount(v4);
      MutableCopy = CFDictionaryCreateMutableCopy(v2, Count, v4);
      v1 = (uint64_t)MutableCopy;
      if (MutableCopy)
      {
        CFDictionarySetValue(MutableCopy, CFSTR("numbers"), CFSTR("default"));
        LocaleIdentifierFromComponents = CFLocaleCreateLocaleIdentifierFromComponents(v2, (CFDictionaryRef)v1);
        if (LocaleIdentifierFromComponents)
        {
          v11 = LocaleIdentifierFromComponents;
          v12 = __CFPhoneNumberLocaleCopyNumberingSystemNameFromLocaleIdentifier(v2, LocaleIdentifierFromComponents);
          CFRelease(v11);
        }
        else
        {
          v12 = 0;
        }
        CFRelease((CFTypeRef)v1);
LABEL_15:
        CFRelease(v4);
        if (v12)
        {
          if (CFEqual(v12, CFSTR("arab")))
            v1 = 1;
          else
            v1 = 2 * (CFEqual(v12, CFSTR("latn")) != 0);
          v4 = (const __CFDictionary *)v12;
          goto LABEL_21;
        }
        return 0;
      }
    }
LABEL_21:
    CFRelease(v4);
  }
  return v1;
}

CFStringRef __CFPhoneNumberLocaleCopyNumberingSystemNameFromLocaleIdentifier(const __CFAllocator *a1, CFStringRef theString)
{
  uint64_t v3;
  CFStringRef v4;
  const char *v5;

  if (!CFStringGetCStringPtr(theString, 0x8000100u))
    return 0;
  v3 = unumsys_open();
  if (!v3)
    return 0;
  v5 = (const char *)MEMORY[0x20BCF7F2C](v3);
  if (v5)
    v4 = CFStringCreateWithCString(a1, v5, 0x8000100u);
  else
    v4 = 0;
  unumsys_close();
  return v4;
}

CFTypeRef _CFPhoneNumberCopyFormattedRepresentation(uint64_t a1)
{
  const void *v2;
  const __CFString *v4;
  const __CFString *v5;

  v2 = *(const void **)(a1 + 56);
  if (v2)
    return CFRetain(v2);
  v4 = _PNCopyFormattedNumberForDigitsWithCountry(*(const __CFString **)(a1 + 24), *(const __CFString **)(a1 + 48), 0);
  if (v4)
  {
    v5 = v4;
    *(_QWORD *)(a1 + 56) = _PNCreateStringByAddingPauses(v4, *(CFStringRef *)(a1 + 32));
    CFRelease(v5);
    v2 = *(const void **)(a1 + 56);
    if (v2)
      return CFRetain(v2);
  }
  else
  {
    *(_QWORD *)(a1 + 56) = 0;
  }
  return 0;
}

CFStringRef _PNCreateStringByAddingPauses(const __CFString *a1, CFStringRef theString)
{
  CFStringRef v5;

  if (theString && CFStringGetLength(theString))
  {
    if (a1 && CFStringGetLength(a1))
      return CFStringCreateWithFormat((CFAllocatorRef)*MEMORY[0x24BDBD240], 0, CFSTR("%@%@"), a1, theString);
    v5 = theString;
    return (CFStringRef)CFRetain(v5);
  }
  if (a1)
  {
    v5 = a1;
    return (CFStringRef)CFRetain(v5);
  }
  return 0;
}

CFStringRef _PNCopyFormattedNumberForDigitsWithCountry(const __CFString *a1, const __CFString *a2, unsigned int a3)
{
  unsigned int *v6;
  const __CFString *FormattedNumberForDigitsWithCountryIndex;
  uint64_t InfoIndex;
  uint64_t v9;
  CFIndex location;
  CFIndex v11;
  const __CFAllocator *v12;
  const __CFString *v13;
  CFStringRef v14;
  CFStringRef v15;
  CFStringRef v16;
  CFRange v18;
  CFRange v19;

  v6 = (unsigned int *)PNGetFormatFileHeader();
  FormattedNumberForDigitsWithCountryIndex = 0;
  if (a1 && a2 && v6)
  {
    InfoIndex = UIPhoneFormatCountryGetInfoIndex(v6, a2);
    if ((_DWORD)InfoIndex == -1)
      return CFStringCreateCopy((CFAllocatorRef)*MEMORY[0x24BDBD240], a1);
    v9 = InfoIndex;
    FormattedNumberForDigitsWithCountryIndex = _CreateFormattedNumberForDigitsWithCountryIndex(a1, InfoIndex, a3, 0, 0, 0);
    if (FormattedNumberForDigitsWithCountryIndex)
    {
      if (CFEqual(a1, FormattedNumberForDigitsWithCountryIndex))
      {
        location = CFStringFind(FormattedNumberForDigitsWithCountryIndex, CFSTR("x"), 0).location;
        if (location != -1)
        {
          v11 = location;
          v12 = (const __CFAllocator *)*MEMORY[0x24BDBD240];
          v18.location = 0;
          v18.length = location;
          v13 = CFStringCreateWithSubstring((CFAllocatorRef)*MEMORY[0x24BDBD240], FormattedNumberForDigitsWithCountryIndex, v18);
          v19.length = CFStringGetLength(FormattedNumberForDigitsWithCountryIndex) - v11;
          v19.location = v11;
          v14 = CFStringCreateWithSubstring(v12, FormattedNumberForDigitsWithCountryIndex, v19);
          CFRelease(FormattedNumberForDigitsWithCountryIndex);
          v15 = _CreateFormattedNumberForDigitsWithCountryIndex(v13, v9, a3, 0, 0, 0);
          if (v15)
          {
            v16 = v15;
            if (!CFEqual(v15, v13))
            {
              FormattedNumberForDigitsWithCountryIndex = CFStringCreateWithFormat(v12, 0, CFSTR("%@ %@"), v16, v14);
              CFRelease(v16);
              goto LABEL_14;
            }
            CFRelease(v16);
          }
          FormattedNumberForDigitsWithCountryIndex = CFStringCreateCopy(v12, a1);
LABEL_14:
          CFRelease(v13);
          CFRelease(v14);
        }
      }
    }
  }
  return FormattedNumberForDigitsWithCountryIndex;
}

CFStringRef _CFPhoneNumberCopyFormattedInternationalRepresentation(uint64_t a1)
{
  const __CFString *v2;
  const __CFString *v3;
  const __CFString *v4;
  CFStringRef v5;

  v2 = __CFPhoneNumberCopyFullyQualified(a1, 0, 1);
  if (!v2)
    return 0;
  v3 = v2;
  v4 = _PNCopyFormattedNumberForDigitsWithCountry(v2, *(const __CFString **)(a1 + 48), 0);
  CFRelease(v3);
  if (!v4)
    return 0;
  v5 = _PNCreateStringByAddingPauses(v4, *(CFStringRef *)(a1 + 32));
  CFRelease(v4);
  return v5;
}

CFStringRef __CFPhoneNumberCopyFullyQualified(uint64_t a1, int a2, int a3)
{
  const __CFString *v6;
  __CFString *v7;
  const __CFString *v8;
  CFStringRef result;
  BOOL v10;

  v6 = *(const __CFString **)(a1 + 24);
  v7 = *(__CFString **)(a1 + 48);
  if (a2)
  {
    v8 = *(const __CFString **)(a1 + 32);
    if ((a3 & 1) == 0)
      return _PNCopyFullyQualifiedNumberForCountryInternal(v6, v7, v8, &__block_literal_global_7, 0, 0);
  }
  else
  {
    v8 = 0;
    if ((a3 & 1) == 0)
      return _PNCopyFullyQualifiedNumberForCountryInternal(v6, v7, v8, &__block_literal_global_7, 0, 0);
  }
  result = _PNCopyFullyQualifiedNumberForCountryInternal(v6, v7, v8, &__block_literal_global_7, *(unsigned __int8 *)(a1 + 64), 0);
  if (result)
    v10 = 1;
  else
    v10 = a3 == 0;
  if (!v10)
  {
    if (PNIsValidPhoneNumberForCountry(*(const __CFString **)(a1 + 40), *(const __CFString **)(a1 + 48))
      && (CFStringHasPrefix(*(CFStringRef *)(a1 + 40), CFSTR("+1800"))
       || CFStringHasPrefix(*(CFStringRef *)(a1 + 40), CFSTR("+1888"))
       || CFStringHasPrefix(*(CFStringRef *)(a1 + 40), CFSTR("+1877"))
       || CFStringHasPrefix(*(CFStringRef *)(a1 + 40), CFSTR("+1866"))
       || CFStringHasPrefix(*(CFStringRef *)(a1 + 40), CFSTR("+1855"))
       || CFStringHasPrefix(*(CFStringRef *)(a1 + 40), CFSTR("+1844"))))
    {
      return CFStringCreateCopy((CFAllocatorRef)*MEMORY[0x24BDBD240], *(CFStringRef *)(a1 + 40));
    }
    else
    {
      return 0;
    }
  }
  return result;
}

__CFString *_PNCopyFullyQualifiedNumberForCountryInternal(const __CFString *a1, __CFString *a2, const __CFString *a3, void *a4, int a5, _DWORD *a6)
{
  uint64_t (**v11)(id, CFStringRef);
  char *v12;
  uint64_t v13;
  unsigned __int8 *v14;
  int v15;
  int v16;
  uint64_t v17;
  unsigned __int8 *v18;
  int v19;
  int v20;
  uint64_t v21;
  unsigned __int8 *v22;
  int v23;
  int v24;
  char *v25;
  const __CFAllocator *v26;
  __CFString *MutableCopy;
  const __CFString *v28;
  unsigned int *v30;
  unsigned int *v31;
  const __CFString *v32;
  const __CFString *v33;
  __CFString *v34;
  const __CFString *v35;
  const __CFString *v36;
  CFStringRef v37;
  const __CFString *v38;
  CFStringRef v39;
  uint64_t v40;
  const __CFAllocator *v41;
  const __CFString *v42;
  const __CFAllocator *v43;
  const __CFAllocator *v44;
  char v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  CFIndex numBytes[2];
  char *cStr[2];
  __int128 v52;
  CFIndex v53[2];
  __int128 v54;

  v11 = a4;
  if (!a6)
  {
    if (CFStringGetLength(a1) >= 5 && (_PNIsValidPhoneNumberForCountry(a1, a2, 1, 1, 0) & 1) != 0)
      goto LABEL_9;
LABEL_33:
    if (!a5)
    {
LABEL_48:
      MutableCopy = 0;
      goto LABEL_49;
    }
    goto LABEL_34;
  }
  *a6 = 0;
  if (CFStringGetLength(a1) <= 4)
  {
    *a6 = 2;
    if (!a5)
      goto LABEL_48;
    goto LABEL_34;
  }
  if ((_PNIsValidPhoneNumberForCountry(a1, a2, 1, 1, 0) & 1) == 0)
  {
    *a6 = 3;
    goto LABEL_33;
  }
LABEL_9:
  CFStringGetLength(a1);
  if (!CFStringGetCharactersPtr(a1))
    CFStringGetCStringPtr(a1, 0x600u);
  v48 = 0u;
  v49 = 0u;
  v46 = 0u;
  v47 = 0u;
  LOBYTE(cStr[0]) = 0;
  v12 = _PNCopyBestGuessNumberForCountry(a1, a2, 1, &v46, cStr);
  if (LOBYTE(cStr[0]))
  {
    v13 = DWORD2(v47);
    if (DWORD2(v47))
    {
      v14 = (unsigned __int8 *)v47;
      while (1)
      {
        v16 = *v14++;
        v15 = v16;
        if (v16 == 35 || v15 == 42)
          break;
        if (!--v13)
          goto LABEL_17;
      }
LABEL_37:
      if (a6)
        *a6 = 4;
      free(v12);
      if (!a5)
        goto LABEL_48;
LABEL_34:
      if (a6)
        *a6 = 0;
LABEL_36:
      MutableCopy = (__CFString *)_PNCopyFullyQualifiedOriginalValue(a1, a3);
      goto LABEL_49;
    }
LABEL_17:
    v17 = DWORD2(v48);
    if (DWORD2(v48))
    {
      v18 = (unsigned __int8 *)v48;
      do
      {
        v20 = *v18++;
        v19 = v20;
        if (v20 == 35 || v19 == 42)
          goto LABEL_37;
      }
      while (--v17);
    }
    v21 = DWORD2(v49);
    if (DWORD2(v49))
    {
      v22 = (unsigned __int8 *)v49;
      do
      {
        v24 = *v22++;
        v23 = v24;
        if (v24 == 35 || v23 == 42)
          goto LABEL_37;
      }
      while (--v21);
    }
  }
  free(v12);
  v54 = 0u;
  v52 = 0u;
  *(_OWORD *)v53 = 0u;
  *(_OWORD *)numBytes = 0u;
  *(_OWORD *)cStr = 0u;
  v48 = 0u;
  v49 = 0u;
  v46 = 0u;
  v47 = 0u;
  v45 = 0;
  v25 = _PNCopyBestGuessNumberForCountry(a1, a2, 1, (__int128 *)cStr, &v45);
  _PNFindFormatRuleForDigitsWithCountry(a1, a2, 0, (uint64_t)&v46);
  if (!v45 || !(_QWORD)v54)
  {
    if (a6)
      *a6 = 3;
LABEL_43:
    free(v25);
    if (!a5)
      goto LABEL_48;
    goto LABEL_36;
  }
  if ((BYTE4(v47) & 4) != 0)
  {
    if (a6)
      *a6 = 5;
    free(v25);
    goto LABEL_48;
  }
  v26 = (const __CFAllocator *)*MEMORY[0x24BDBD240];
  MutableCopy = CFStringCreateMutableCopy((CFAllocatorRef)*MEMORY[0x24BDBD240], 0, CFSTR("+"));
  if (cStr[0])
  {
    v28 = CFStringCreateWithCString(v26, cStr[0], 0x8000100u);
    CFStringAppend(MutableCopy, v28);
    CFRelease(v28);
    goto LABEL_52;
  }
  v43 = v26;
  v30 = _PNCopyInternationalCodeForCountry((unsigned int *)a2);
  if (!v30)
  {
    if (a6)
      *a6 = 6;
    CFRelease(MutableCopy);
    goto LABEL_43;
  }
  v31 = v30;
  CFStringAppend(MutableCopy, (CFStringRef)v30);
  CFRelease(v31);
  v26 = v43;
LABEL_52:
  if (numBytes[0] != -1)
  {
    v32 = CFStringCreateWithBytes(v26, (const UInt8 *)(*((_QWORD *)&v47 + 1) + numBytes[0]), numBytes[1], 0x8000100u, 0);
    CFStringAppend(MutableCopy, v32);
    CFRelease(v32);
  }
  if (v53[0])
  {
    v33 = CFStringCreateWithBytes(v26, (const UInt8 *)v53[0], LODWORD(v53[1]), 0x8000100u, 0);
    CFStringAppend(MutableCopy, v33);
    CFRelease(v33);
  }
  else if ((BYTE4(v47) & 8) != 0)
  {
    if (cStr[0])
    {
      v38 = CFStringCreateWithCString(v26, cStr[0], 0x8000100u);
      v39 = _PNCopyCountryCodeForInternationalCode(v38);
      v40 = v11[2](v11, v39);
      if (v40)
      {
        v41 = v26;
        v42 = (const __CFString *)v40;
        v44 = v41;
        v34 = CFStringCreateMutableCopy(v41, 0, MutableCopy);
        CFStringAppend(MutableCopy, v42);
        CFRelease(v42);
        CFRelease(v38);
        if (v39)
          CFRelease(v39);
        v26 = v44;
        if (!MutableCopy)
          goto LABEL_63;
        goto LABEL_58;
      }
      CFRelease(v38);
      if (v39)
        CFRelease(v39);
    }
    if (a6)
      *a6 = 7;
    CFRelease(MutableCopy);
    MutableCopy = 0;
    goto LABEL_65;
  }
  v34 = 0;
  if (MutableCopy)
  {
LABEL_58:
    v35 = CFStringCreateWithBytes(v26, (const UInt8 *)v54, DWORD2(v54), 0x8000100u, 0);
    if (v35)
    {
      v36 = v35;
      CFStringAppend(MutableCopy, v35);
      if (v34 && (_PNIsValidPhoneNumberForCountry(MutableCopy, a2, 1, 1, 0) & 1) == 0)
      {
        CFRelease(MutableCopy);
        CFStringAppend(v34, v36);
        MutableCopy = v34;
        v34 = 0;
      }
      CFRelease(v36);
    }
  }
LABEL_63:
  if (v34)
    CFRelease(v34);
LABEL_65:
  free(v25);
  if (a3 && MutableCopy)
  {
    v37 = _PNCreateStringByAddingPauses(MutableCopy, a3);
    CFRelease(MutableCopy);
    MutableCopy = (__CFString *)v37;
  }
LABEL_49:

  return MutableCopy;
}

uint64_t _PNIsValidPhoneNumberForCountry(const __CFString *a1, CFStringRef a2, uint64_t a3, char a4, char a5)
{
  const __CFString *v10;
  uint64_t v11;
  _BYTE *v12;
  void *v13;
  unsigned int v14;
  unsigned int v15;
  _OWORD v17[4];
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;

  if (a1 && CFStringGetLength(a1))
  {
    if (a2)
    {
      CFRetain(a2);
      goto LABEL_6;
    }
    a2 = PNCopyBestGuessCountryCodeForNumber(a1);
    if (a2)
    {
LABEL_6:
      v10 = (const __CFString *)_PNCopyStrippedNumberWithoutPauses(a1, (uint64_t)a2, 0, a3);
      v21 = 0u;
      v22 = 0u;
      v19 = 0u;
      v20 = 0u;
      v18 = 0u;
      memset(v17, 0, sizeof(v17));
      v11 = 0;
      if (!_PNFindFormatRuleForDigitsWithCountry(v10, a2, 0, (uint64_t)&v18))
      {
LABEL_20:
        CFRelease(v10);
        CFRelease(a2);
        return v11;
      }
      v12 = _PNCopyNormalized(v10);
      v13 = v12;
      if (((a4 & 1) != 0 || (BYTE4(v19) & 4) == 0) && _PNDecomposeForCountry(v12, a2, v17, a3))
      {
        if ((_BYTE)v19)
        {
          v14 = DWORD1(v20);
          v15 = BYTE1(v19);
          if (DWORD1(v20) >= v19 && DWORD1(v20) <= BYTE1(v19))
            goto LABEL_13;
        }
        else
        {
          v14 = DWORD1(v20);
          v15 = BYTE1(v19);
          if (DWORD1(v20) == BYTE1(v19))
          {
LABEL_13:
            v11 = 1;
LABEL_19:
            free(v13);
            goto LABEL_20;
          }
        }
        if (v14 > 4 || (a5 & 1) == 0)
        {
          v11 = 0;
          if (v14 < v15 && *(_QWORD *)&v17[0])
            v11 = (*(unsigned __int16 *)(v18 + 2) >> 1) & 1;
          goto LABEL_19;
        }
      }
      v11 = 0;
      goto LABEL_19;
    }
  }
  return 0;
}

const __CFString *_PNCopyLastFourDigitsOfLocalNumber(const __CFString *a1, uint64_t a2)
{
  const __CFString *result;
  const __CFString *v3;
  char *v4;
  int64_t v5;
  CFIndex v6;
  CFStringRef v7;

  result = (const __CFString *)_PNCopyStrippedNumberWithoutPauses(a1, a2, 0, 0);
  if (result)
  {
    v3 = result;
    v4 = _PNCopyNormalized(result);
    v5 = strlen(v4);
    if (v5 >= 4)
      v6 = 4;
    else
      v6 = v5;
    v7 = CFStringCreateWithBytes((CFAllocatorRef)*MEMORY[0x24BDBD240], (const UInt8 *)&v4[v5 - v6], v6, 0x8000100u, 0);
    free(v4);
    CFRelease(v3);
    return v7;
  }
  return result;
}

CFStringRef CFPhoneNumberStringCreateLowercaseCopy(const __CFAllocator *a1, CFStringRef theString)
{
  CFMutableStringRef MutableCopy;
  __CFString *v5;
  const __CFLocale *v6;
  CFStringRef Copy;

  if (!CFStringGetLength(theString))
    return 0;
  MutableCopy = CFStringCreateMutableCopy(a1, 0, theString);
  if (!MutableCopy)
    return 0;
  v5 = MutableCopy;
  if (CFPhoneNumberStringIsEncodingASCII(theString))
    v6 = 0;
  else
    v6 = CFLocaleCopyCurrent();
  CFStringLowercase(v5, v6);
  Copy = CFStringCreateCopy(a1, v5);
  CFRelease(v5);
  if (v6)
    CFRelease(v6);
  return Copy;
}

CFStringRef CFPhoneNumberCreate(const __CFAllocator *a1, CFStringRef theString, const __CFString *a3)
{
  CFStringRef v3;
  const __CFString *Copy;
  const __CFString *v7;
  const __CFString *v8;
  __CFString *v9;
  __CFString *v10;
  uint64_t Instance;
  BOOL v12;

  v3 = theString;
  if (theString)
  {
    if (CFStringGetLength(theString))
    {
      if (CFPhoneNumberStringIsEncodingASCII(v3))
        Copy = (const __CFString *)CFRetain(v3);
      else
        Copy = CFPhoneNumberStringTransformCreateCopy(a1, v3, 0, CFSTR("NFD; Any-Latin; [:Mn:] Remove; Latin-ASCII; [:^ASCII:] Remove; NFC"),
                 0);
      v7 = Copy;
      if (Copy)
      {
        if (!CFStringGetLength(Copy))
          goto LABEL_25;
        v8 = PNCopyBestGuessCountryCodeForNumber(v7);
        if (v8)
        {
          v9 = (__CFString *)v8;
          if (CFStringGetLength(v8))
          {
LABEL_19:
            if (CFPhoneNumberGetITUCountryCodeForISOCountryCode(v9) == -1)
            {
              v3 = 0;
            }
            else
            {
              if (CFPhoneNumberGetTypeID_initOnce != -1)
                dispatch_once(&CFPhoneNumberGetTypeID_initOnce, &__block_literal_global_1);
              Instance = _CFRuntimeCreateInstance();
              v3 = (CFStringRef)Instance;
              if (Instance)
              {
                *(_OWORD *)(Instance + 32) = 0u;
                *(_BYTE *)(Instance + 64) = 0;
                *(_OWORD *)(Instance + 48) = 0u;
                *(_OWORD *)(Instance + 16) = 0u;
                *(_QWORD *)(Instance + 48) = CFPhoneNumberStringCreateLowercaseCopy(a1, v9);
                v3[1].info = (uint64_t)_PNCreateStringByStrippingFormattingAndNotVisiblyAllowable(v7);
                v3->length = (uint64_t)_PNCopyStrippedNumberWithoutPauses(v7, (uint64_t)v3[1].data, (CFStringRef *)&v3[1], 0);
                v12 = CFStringGetLength((CFStringRef)v3[1].info) >= 1
                   && CFStringGetCharacterAtIndex((CFStringRef)v3[1].info, 0) == 43;
                LOBYTE(v3[2].isa) = v12;
              }
            }
            CFRelease(v7);
            goto LABEL_30;
          }
          CFRelease(v9);
        }
LABEL_13:
        if (a3)
        {
          v10 = (__CFString *)(CFPhoneNumberStringIsEncodingASCII(a3)
                             ? CFRetain(a3)
                             : CFPhoneNumberStringTransformCreateCopy(a1, v3, 0, CFSTR("NFD; Any-Latin; [:Mn:] Remove; Latin-ASCII; [:^ASCII:] Remove; NFC"),
                                 0));
          v9 = v10;
          if (v10)
            goto LABEL_19;
        }
LABEL_25:
        v3 = 0;
        v9 = (__CFString *)v7;
LABEL_30:
        CFRelease(v9);
        return v3;
      }
    }
    else
    {
      v7 = (const __CFString *)CFRetain(v3);
      if (v7)
        goto LABEL_13;
    }
    return 0;
  }
  return v3;
}

CFStringRef PNCopyBestGuessCountryCodeForNumber(const __CFString *a1)
{
  const __CFString *v1;
  CFStringRef v2;
  const __CFAllocator *v3;
  const __CFString *v4;
  CFRange v6;

  if (!a1)
    return 0;
  v1 = _PNCreateStringByStrippingFormattingAndNotVisiblyAllowable(a1);
  if (CFStringGetLength(v1))
  {
    v2 = 0;
    if (CFStringGetCharacterAtIndex(v1, 0) == 43)
    {
      v3 = (const __CFAllocator *)*MEMORY[0x24BDBD240];
      v6.length = CFStringGetLength(v1) - 1;
      v6.location = 1;
      v4 = CFStringCreateWithSubstring(v3, v1, v6);
      v2 = _PNCopyCountryCodeForInternationalCode(v4);
      CFRelease(v4);
    }
  }
  else
  {
    v2 = 0;
  }
  CFRelease(v1);
  return v2;
}

void *_PNCopyStrippedNumberWithoutPauses(const __CFString *a1, uint64_t a2, CFStringRef *a3, int a4)
{
  CFAllocatorRef *v8;
  const char *v9;
  size_t v10;
  const __CFString *v11;
  const __CFString *v12;
  const __CFCharacterSet *v13;
  const __CFAllocator *v14;
  void *v15;
  CFIndex location;
  CFIndex Length;
  CFRange result;
  char v20;
  CFRange v21;
  CFRange v22;
  CFRange v23;

  if (_PNCopyStrippedNumberWithoutPauses_initOnce != -1)
    dispatch_once(&_PNCopyStrippedNumberWithoutPauses_initOnce, &__block_literal_global_0);
  result.location = 0;
  result.length = 0;
  v8 = (CFAllocatorRef *)MEMORY[0x24BDBD240];
  if (a4)
  {
    v9 = (const char *)_PNCopyBestGuessNumberForCountry(a1, a2, 0, 0, &v20);
    v10 = strlen(v9);
    v11 = CFStringCreateWithBytesNoCopy(*v8, (const UInt8 *)v9, v10, 0x8000100u, 0, (CFAllocatorRef)*MEMORY[0x24BDBD248]);
  }
  else
  {
    v11 = _PNCreateStringByStrippingFormattingAndNotVisiblyAllowable(a1);
  }
  v12 = v11;
  v13 = (const __CFCharacterSet *)_PNCopyStrippedNumberWithoutPauses_pauses;
  v21.length = CFStringGetLength(v11);
  v21.location = 0;
  if (CFStringFindCharacterFromSet(v12, v13, v21, 0, &result))
  {
    v14 = *v8;
    v22.length = result.location;
    v22.location = 0;
    v15 = (void *)CFStringCreateWithSubstring(*v8, v12, v22);
    if (a3)
    {
      location = result.location;
      Length = CFStringGetLength(v12);
      v23.length = Length - result.location;
      v23.location = location;
      *a3 = CFStringCreateWithSubstring(v14, v12, v23);
    }
  }
  else
  {
    v15 = (void *)CFRetain(v12);
  }
  CFRelease(v12);
  return v15;
}

uint64_t CFPhoneNumberStringIsEncodingASCII(const __CFString *a1)
{
  CFIndex Length;
  const UniChar *CharactersPtr;
  const char *CStringPtr;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  uint64_t v9;
  UniChar v10;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  CFIndex v16;
  CFRange v17;
  uint64_t v18;
  _OWORD v20[8];
  CFStringRef theString;
  const UniChar *v22;
  const char *v23;
  uint64_t v24;
  CFIndex v25;
  uint64_t v26;
  uint64_t v27;

  if (!a1)
    return 1;
  memset(v20, 0, sizeof(v20));
  Length = CFStringGetLength(a1);
  theString = a1;
  v24 = 0;
  v25 = Length;
  CharactersPtr = CFStringGetCharactersPtr(a1);
  CStringPtr = 0;
  v22 = CharactersPtr;
  if (!CharactersPtr)
    CStringPtr = CFStringGetCStringPtr(a1, 0x600u);
  v26 = 0;
  v27 = 0;
  v23 = CStringPtr;
  if (Length < 1)
    return 1;
  v5 = 0;
  v6 = 0;
  v7 = 0;
  for (i = 64; ; ++i)
  {
    v9 = (unint64_t)v7 >= 4 ? 4 : v7;
    if (v25 > v7)
    {
      if (v22)
      {
        v10 = v22[v7 + v24];
      }
      else if (v23)
      {
        v10 = v23[v24 + v7];
      }
      else
      {
        if (v27 <= v7 || v6 > v7)
        {
          v12 = -v9;
          v13 = v9 + v5;
          v14 = i - v9;
          v15 = v7 + v12;
          v16 = v15 + 64;
          if (v15 + 64 >= v25)
            v16 = v25;
          v26 = v15;
          v27 = v16;
          v17.location = v15 + v24;
          if (v25 >= v14)
            v18 = v14;
          else
            v18 = v25;
          v17.length = v18 + v13;
          CFStringGetCharacters(theString, v17, (UniChar *)v20);
          v6 = v26;
        }
        v10 = *((_WORD *)v20 + v7 - v6);
      }
      if (v10 > 0x7Fu)
        break;
    }
    ++v7;
    --v5;
    if (Length == v7)
      return 1;
  }
  return 0;
}

CFStringRef _PNCopyCountryCodeForInternationalCode(const __CFString *a1)
{
  unsigned int *v2;
  CFStringRef result;
  CFIndex Length;
  int CountryOffsetFromDialingCode;
  int v6;

  v2 = (unsigned int *)PNGetFormatFileHeader();
  result = 0;
  if (a1 && v2)
  {
    v6 = 0;
    Length = CFStringGetLength(a1);
    CountryOffsetFromDialingCode = _GetCountryOffsetFromDialingCode(v2, a1, 0, 0, Length, &v6);
    if (CountryOffsetFromDialingCode == -1)
      return 0;
    else
      return CFStringCreateWithCString((CFAllocatorRef)*MEMORY[0x24BDBD240], (const char *)&v2[3 * CountryOffsetFromDialingCode + 2], 0x8000100u);
  }
  return result;
}

uint64_t CFPhoneNumberGetITUCountryCodeForISOCountryCode(__CFString *a1)
{
  unsigned int *v2;
  unsigned int *v3;
  unsigned int IntValue;
  int v5;
  uint64_t v6;

  if (!a1)
    return -1;
  if (!CFStringGetLength(a1))
    return -1;
  v2 = _PNCopyInternationalCodeForCountry((unsigned int *)a1);
  if (!v2)
    return -1;
  v3 = v2;
  IntValue = CFStringGetIntValue((CFStringRef)v2);
  if (IntValue > 0x7FFFFFFE)
    v5 = -1;
  else
    v5 = IntValue;
  v6 = v5;
  CFRelease(v3);
  return v6;
}

unsigned int *_PNCopyInternationalCodeForCountry(unsigned int *a1)
{
  unsigned int *result;

  result = _PNGetITUCountryCode(a1);
  if (result)
    return (unsigned int *)CFStringCreateWithCString((CFAllocatorRef)*MEMORY[0x24BDBD240], (const char *)result, 0x8000100u);
  return result;
}

unsigned int *_PNGetITUCountryCode(unsigned int *result)
{
  const __CFString *v1;
  unsigned int *v2;
  int InfoIndex;

  if (result)
  {
    v1 = (const __CFString *)result;
    if (CFStringGetLength((CFStringRef)result) == 2)
    {
      result = (unsigned int *)PNGetFormatFileHeader();
      if (result)
      {
        v2 = result;
        InfoIndex = UIPhoneFormatCountryGetInfoIndex(result, v1);
        if (InfoIndex == -1)
          return 0;
        else
          return &v2[3 * InfoIndex + 1];
      }
    }
    else
    {
      return 0;
    }
  }
  return result;
}

uint64_t PNIsValidPhoneNumberForCountry(const __CFString *a1, const __CFString *a2)
{
  return _PNIsValidPhoneNumberForCountry(a1, a2, 1, 1, 0);
}

CFTypeRef CFPhoneNumberCopyISOCountryCode(uint64_t a1, uint64_t a2)
{
  CFTypeRef result;

  result = *(CFTypeRef *)(a2 + 48);
  if (result)
    return CFRetain(result);
  return result;
}

CFStringRef CFPhoneNumberCopyUnformattedInternationalRepresentation(uint64_t a1)
{
  return __CFPhoneNumberCopyFullyQualified(a1, 1, 1);
}

__CFBundle *CFPhoneNumberBundleCopyRulesetFileSystemPath()
{
  __CFBundle *result;
  __CFBundle *v1;
  CFStringRef v2;

  result = CFPhoneNumberBundleCopyRulesetURL();
  if (result)
  {
    v1 = result;
    v2 = CFURLCopyFileSystemPath(result, kCFURLPOSIXPathStyle);
    CFRelease(v1);
    return (__CFBundle *)v2;
  }
  return result;
}

__CFBundle *CFPhoneNumberBundleCopyRulesetURL()
{
  __CFBundle *result;

  result = CFBundleGetBundleWithIdentifier(CFSTR("com.apple.CorePhoneNumbers"));
  if (result)
    return CFBundleCopyResourceURL(result, CFSTR("CorePhoneNumbers.ruleset"), 0, 0);
  return result;
}

uint64_t _PNIndexCountingNonPhoneFormattingCharactersFromStart(const __CFString *a1, uint64_t a2)
{
  uint64_t Length;
  uint64_t result;
  uint64_t v6;
  UniChar *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD v11[2];
  CFRange v12;

  v11[1] = *MEMORY[0x24BDAC8D0];
  Length = CFStringGetLength(a1);
  result = 0;
  if (a2 && Length)
  {
    MEMORY[0x24BDAC7A8](0);
    v7 = (UniChar *)((char *)v11 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0));
    v12.location = 0;
    v12.length = Length;
    CFStringGetCharacters(a1, v12, v7);
    if (Length < 1)
    {
      v10 = 0;
    }
    else
    {
      v8 = 0;
      v9 = 0;
      while (_IsInFormattingSet(v7[v9]) || ++v8 != a2)
      {
        if (Length == ++v9)
        {
          v10 = Length;
          goto LABEL_11;
        }
      }
      v10 = v9 + 1;
    }
LABEL_11:
    if (v10 >= Length)
      return Length;
    else
      return v10;
  }
  return result;
}

uint64_t _PNCountNonPhoneFormattingCharactersPrecedingIndex(const __CFString *a1, CFIndex a2)
{
  CFIndex Length;
  uint64_t v5;
  unsigned __int16 *v6;
  uint64_t v7;
  unsigned int v8;
  _QWORD v10[2];
  CFRange v11;

  v10[1] = *MEMORY[0x24BDAC8D0];
  Length = CFStringGetLength(a1);
  if (!Length)
    return 0;
  if (Length < a2)
    a2 = Length;
  MEMORY[0x24BDAC7A8](Length);
  v6 = (unsigned __int16 *)((char *)v10 - v5);
  v11.location = 0;
  v11.length = a2;
  CFStringGetCharacters(a1, v11, (UniChar *)((char *)v10 - v5));
  if (a2 < 1)
    return 0;
  v7 = 0;
  do
  {
    v8 = *v6++;
    if (!_IsInFormattingSet(v8))
      ++v7;
    --a2;
  }
  while (a2);
  return v7;
}

const __CFString *_PNCopyFormattedNumberSuggestionForDigitsWithCountry(const __CFString *a1, CFIndex a2, const __CFString *a3, uint64_t *a4, const __CFString *a5)
{
  CFIndex Length;
  CFIndex v11;
  uint64_t v12;
  CFTypeID v13;
  CFIndex v14;
  CFIndex v15;
  unsigned int CharacterAtIndex;
  const __CFString *v17;
  uint64_t v18;

  if (!a1 || (Length = CFStringGetLength(a1)) == 0)
  {
    v18 = 0;
    v17 = 0;
    if (!a4)
      return v17;
    goto LABEL_20;
  }
  v11 = Length;
  v12 = _PNCountNonPhoneFormattingCharactersPrecedingIndex(a1, a2);
  if (a3
    && (v13 = CFGetTypeID(a3), v13 == CFStringGetTypeID())
    && (v14 = CFStringGetLength(a3), v11 < v14)
    && (v14 <= a2 ? (v15 = v14 - 1) : (v15 = (int)a2),
        CharacterAtIndex = CFStringGetCharacterAtIndex(a3, v15),
        _IsInFormattingSet(CharacterAtIndex)))
  {
    v17 = _PNCopyFormattedNumberForDigitsWithCountryByRemovingAtIndex(a1, a5, a2);
    --v12;
    if (!v17)
      goto LABEL_17;
  }
  else
  {
    v17 = _PNCopyCompressedFormattedStringWithCountry(a1, a5, 0);
    if (!v17)
      goto LABEL_17;
  }
  if (CFStringGetLength(v17))
    goto LABEL_18;
  CFRelease(v17);
LABEL_17:
  v17 = &stru_24BF25160;
LABEL_18:
  if (a4)
  {
    v18 = _PNIndexCountingNonPhoneFormattingCharactersFromStart(v17, v12);
LABEL_20:
    *a4 = v18;
  }
  return v17;
}

CFBundleRef CFPhoneNumberBundleGetBundle()
{
  return CFBundleGetBundleWithIdentifier(CFSTR("com.apple.CorePhoneNumbers"));
}

uint64_t cpn_default_log()
{
  if (cpn_default_log_onceToken != -1)
    dispatch_once(&cpn_default_log_onceToken, &__block_literal_global);
  return cpn_default_log_sLog;
}

os_log_t __cpn_default_log_block_invoke()
{
  os_log_t result;

  result = os_log_create("com.apple.corephonenumbers", "default");
  cpn_default_log_sLog = (uint64_t)result;
  return result;
}

CFStringRef PNCopyFormattedStringWithCountry(const __CFString *a1, const __CFString *a2)
{
  return _PNCopyCompressedFormattedStringWithCountry(a1, a2, 0);
}

BOOL PNPhoneNumbersEqual(const __CFString *a1, __CFString *cf, const __CFString *a3, __CFString *a4, char a5, _BYTE *a6)
{
  _BOOL8 v6;
  __CFString *v11;
  char *v13;
  char *v14;
  __int16 v16;
  __int128 v17[4];
  __int128 v18[4];

  v6 = 0;
  if (!a1 || !a3)
    return v6;
  v11 = cf;
  if (cf)
  {
    CFRetain(cf);
    if (a4)
      goto LABEL_5;
  }
  else
  {
    v11 = (__CFString *)PNCopyBestGuessCountryCodeForNumber(a1);
    if (a4)
    {
LABEL_5:
      CFRetain(a4);
      if (!v11)
        goto LABEL_17;
      goto LABEL_9;
    }
  }
  a4 = (__CFString *)PNCopyBestGuessCountryCodeForNumber(a3);
  if (!v11)
  {
LABEL_17:
    if (v11)
      CFRelease(v11);
    if (a4)
      CFRelease(a4);
    return 0;
  }
LABEL_9:
  if (!a4)
    goto LABEL_17;
  memset(v18, 0, sizeof(v18));
  memset(v17, 0, sizeof(v17));
  v16 = 0;
  v13 = _PNCopyBestGuessNumberForCountry(a1, v11, 1, v18, (_BYTE *)&v16 + 1);
  v14 = _PNCopyBestGuessNumberForCountry(a3, a4, 1, v17, &v16);
  v6 = 0;
  if (HIBYTE(v16) == v16)
    v6 = decomposedPhoneNumbersEqual((uint64_t)v18, (uint64_t)v17, a5, a6);
  if (v13)
    free(v13);
  if (v14)
    free(v14);
  CFRelease(v11);
  CFRelease(a4);
  return v6;
}

__CFString *_PNCopyFullyQualifiedNumberForCountry(const __CFString *a1, __CFString *a2, uint64_t a3, _DWORD *a4)
{
  const __CFString *v7;
  __CFString *v8;
  _QWORD v10[6];
  CFStringRef v11;

  if (a1 && a2)
  {
    v11 = 0;
    v7 = (const __CFString *)_PNCopyStrippedNumberWithoutPauses(a1, (uint64_t)a2, &v11, 0);
    v10[0] = MEMORY[0x24BDAC760];
    v10[1] = 3221225472;
    v10[2] = ___PNCopyFullyQualifiedNumberForCountry_block_invoke;
    v10[3] = &__block_descriptor_48_e34_____CFString__16__0____CFString__8l;
    v10[4] = a3;
    v10[5] = a2;
    v8 = _PNCopyFullyQualifiedNumberForCountryInternal(v7, a2, v11, v10, 0, a4);
    if (v11)
      CFRelease(v11);
    if (v7)
      CFRelease(v7);
  }
  else
  {
    v8 = 0;
    if (a4)
      *a4 = 1;
  }
  return v8;
}

CFStringRef _PNCopyAreaCodeForCountry(const __CFString *a1, const __CFString *a2)
{
  unsigned int *v4;
  unsigned int InfoIndex;

  v4 = (unsigned int *)PNGetFormatFileHeader();
  if (a1 && a2 && v4 && (InfoIndex = UIPhoneFormatCountryGetInfoIndex(v4, a2), InfoIndex != -1))
    return _CopyPrefixForDigitsWithCountryIndex(a1, InfoIndex);
  else
    return 0;
}

uint64_t PNSetFormatFileHeader(uint64_t result)
{
  sOverrideFormatFile = result;
  return result;
}

__CFArray *_PNCopyIndexStringsForAddressBookSearch(const __CFString *a1, __CFString *a2)
{
  const __CFAllocator *v4;
  __CFArray *Mutable;
  const __CFString *v6;
  char *v7;
  __CFString *v8;
  const __CFString *v9;
  CFStringRef v10;
  uint64_t v11;
  const char *v12;
  size_t v13;
  const char *v14;
  CFStringRef v15;
  CFStringRef v16;
  CFStringRef v17;
  CFStringRef v18;
  const UInt8 *v19;
  CFStringRef v20;
  CFStringRef v21;
  CFStringRef v22;
  CFStringRef v23;
  CFStringRef v24;
  CFStringRef v25;
  CFStringRef v26;
  CFStringRef v27;
  __int128 v29;
  CFIndex v30[2];
  CFIndex numBytes[2];
  CFIndex v32[2];
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  CFRange v38;

  v4 = (const __CFAllocator *)*MEMORY[0x24BDBD240];
  Mutable = CFArrayCreateMutable((CFAllocatorRef)*MEMORY[0x24BDBD240], 0, MEMORY[0x24BDBD690]);
  if ((_PNIsValidPhoneNumberForCountry(a1, a2, 1, 1, 0) & 1) != 0)
  {
    v6 = (const __CFString *)_PNCopyStrippedNumberWithoutPauses(a1, (uint64_t)a2, 0, 1);
    v7 = _PNCopyNormalized(v6);
    v36 = 0u;
    v37 = 0u;
    v34 = 0u;
    v35 = 0u;
    *(_OWORD *)v32 = 0u;
    v33 = 0u;
    *(_OWORD *)v30 = 0u;
    *(_OWORD *)numBytes = 0u;
    v29 = 0u;
    if (!_PNFindFormatRuleForDigitsWithCountry(v6, a2, 0, (uint64_t)&v33))
      goto LABEL_38;
    v8 = _PNCopyFullyQualifiedNumberForCountry(a1, a2, 0, 0);
    if (v8)
    {
      v9 = v8;
      if (CFStringGetLength(v8) && CFStringGetCharacterAtIndex(v9, 0))
      {
        v38.length = CFStringGetLength(v9) - 1;
        v38.location = 1;
        v10 = CFStringCreateWithSubstring(v4, v9, v38);
        v11 = 0;
        v12 = (const char *)(v33 + 12);
        do
        {
          v13 = strlen(v12);
          v11 += v13 + 1;
          v12 += v13 + 1;
        }
        while (*v12);
        v14 = (const char *)(v33 + 12 + v11 + 1);
        CFArrayAppendValue(Mutable, v9);
        v15 = CFStringCreateWithFormat(v4, 0, CFSTR("%s%@"), v14, v10);
        CFArrayAppendValue(Mutable, v15);
        CFRelease(v15);
        if (strcmp(v14, "00"))
        {
          v16 = CFStringCreateWithFormat(v4, 0, CFSTR("00%@"), v10);
          CFArrayAppendValue(Mutable, v16);
          CFRelease(v16);
        }
        if (strcmp(v14, "011"))
        {
          v17 = CFStringCreateWithFormat(v4, 0, CFSTR("011%@"), v10);
          CFArrayAppendValue(Mutable, v17);
          CFRelease(v17);
        }
        CFRelease(v10);
      }
      CFRelease(v9);
    }
    if (!_PNDecomposeForCountry(v7, a2, (uint64_t)&v29, 1))
      goto LABEL_38;
    if (numBytes[0])
    {
      v18 = CFStringCreateWithBytes(v4, (const UInt8 *)numBytes[0], LODWORD(numBytes[1]), 0x8000100u, 0);
      v19 = (const UInt8 *)v32[0];
      if (!v32[0])
      {
LABEL_30:
        if (!v18)
          goto LABEL_38;
        goto LABEL_37;
      }
    }
    else
    {
      v19 = (const UInt8 *)v32[0];
      if (!v32[0])
      {
LABEL_38:
        CFRelease(v6);
        free(v7);
        return Mutable;
      }
      v18 = 0;
    }
    v20 = CFStringCreateWithBytes(v4, v19, LODWORD(v32[1]), 0x8000100u, 0);
    v21 = v20;
    if (v18 && v20)
    {
      if (v30[0] && LODWORD(v30[1]))
      {
        v22 = CFStringCreateWithBytes(v4, (const UInt8 *)v30[0], LODWORD(v30[1]), 0x8000100u, 0);
        v23 = v22;
        if (SBYTE2(v34) < 0)
          v24 = CFStringCreateWithFormat(v4, 0, CFSTR("%s%@%@%@"), (_QWORD)v33 + 12, v18, v22, v21, v29);
        else
          v24 = CFStringCreateWithFormat(v4, 0, CFSTR("%s%@%@%@"), (_QWORD)v33 + 12, v22, v18, v21, v29);
        v25 = v24;
        CFArrayAppendValue(Mutable, v24);
        CFRelease(v25);
        CFRelease(v23);
      }
      v26 = CFStringCreateWithFormat(v4, 0, CFSTR("%s%@%@"), (_QWORD)v33 + 12, v18, v21);
      CFArrayAppendValue(Mutable, v26);
      CFRelease(v26);
      v27 = CFStringCreateWithFormat(v4, 0, CFSTR("%@%@"), v18, v21);
      CFArrayAppendValue(Mutable, v27);
      CFRelease(v27);
      CFArrayAppendValue(Mutable, v21);
    }
    else
    {
      if (!v20)
        goto LABEL_30;
      CFArrayAppendValue(Mutable, v20);
      if (!v18)
      {
LABEL_36:
        v18 = v21;
LABEL_37:
        CFRelease(v18);
        goto LABEL_38;
      }
    }
    CFRelease(v18);
    goto LABEL_36;
  }
  CFArrayAppendValue(Mutable, a1);
  return Mutable;
}

uint64_t UIPhoneFormatGetInternationalAccessCode(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  const char *v3;
  size_t v4;

  v1 = 0;
  v2 = a1 + 12;
  v3 = (const char *)(a1 + 12);
  do
  {
    v4 = strlen(v3);
    v1 += v4 + 1;
    v3 += v4 + 1;
  }
  while (*v3);
  return v2 + v1 + 1;
}

void _PNSetSampleNumberForCountry(const __CFString *a1, CFTypeRef cf1)
{
  char *v4;
  size_t v5;
  CFStringRef v6;

  if (_PNInitializeSamplePhoneNumbers_sSampleNumberOnceToken == -1)
  {
    if (a1)
    {
LABEL_3:
      v4 = _PNCopyNormalized(a1);
      v5 = strlen(v4);
      v6 = CFStringCreateWithBytes((CFAllocatorRef)*MEMORY[0x24BDBD240], (const UInt8 *)v4, v5, 0x8000100u, 0);
      CFDictionarySetValue((CFMutableDictionaryRef)sSamplePhoneNumbers, cf1, v6);
      CFRelease(v6);
      free(v4);
      return;
    }
  }
  else
  {
    dispatch_once(&_PNInitializeSamplePhoneNumbers_sSampleNumberOnceToken, &__block_literal_global_41);
    if (a1)
      goto LABEL_3;
  }
  if (CFEqual(cf1, CFSTR("us")))
    CFDictionarySetValue((CFMutableDictionaryRef)sSamplePhoneNumbers, CFSTR("us"), CFSTR("14085551212"));
  else
    CFDictionaryRemoveValue((CFMutableDictionaryRef)sSamplePhoneNumbers, cf1);
}

const __CFString *_PNCopySampleNumberForCountry(const __CFString *key)
{
  const void *Value;
  unsigned int *v4;
  unsigned int *v5;
  int InfoIndex;
  unsigned __int16 *v7;
  int v8;
  int v9;
  char *v10;
  unsigned __int8 *v11;
  uint64_t v12;
  CFMutableStringRef Mutable;

  if (_PNInitializeSamplePhoneNumbers_sSampleNumberOnceToken != -1)
  {
    dispatch_once(&_PNInitializeSamplePhoneNumbers_sSampleNumberOnceToken, &__block_literal_global_41);
    if (key)
      goto LABEL_3;
    return &stru_24BF25160;
  }
  if (!key)
    return &stru_24BF25160;
LABEL_3:
  Value = CFDictionaryGetValue((CFDictionaryRef)sSamplePhoneNumbers, key);
  if (Value)
    return (const __CFString *)CFRetain(Value);
  v4 = (unsigned int *)PNGetFormatFileHeader();
  if (!v4)
    return 0;
  v5 = v4;
  InfoIndex = UIPhoneFormatCountryGetInfoIndex(v4, key);
  if (InfoIndex == -1)
    return 0;
  v7 = (unsigned __int16 *)((char *)&v5[3 * UIPhoneFormatCountryGetCount(v5) + 1] + v5[3 * InfoIndex + 3]);
  v8 = *((_DWORD *)v7 + 2);
  if (!v8)
    return 0;
  v9 = 0;
  v10 = (char *)v7 + *v7;
  while (!*((_WORD *)v10 + 1))
  {
LABEL_13:
    Mutable = 0;
    v10 += 16 * *((unsigned __int16 *)v10 + 1) + 4;
    if (++v9 == v8)
      return Mutable;
  }
  v11 = (unsigned __int8 *)(v10 + 13);
  v12 = *((unsigned __int16 *)v10 + 1);
  while (!v11[2])
  {
    v11 += 16;
    if (!--v12)
      goto LABEL_13;
  }
  Mutable = CFStringCreateMutable((CFAllocatorRef)*MEMORY[0x24BDBD240], *v11);
  CFStringAppendFormat(Mutable, 0, CFSTR("%d"), *(unsigned int *)(v11 - 9));
  while (CFStringGetLength(Mutable) < *v11)
    CFStringAppendFormat(Mutable, 0, CFSTR("%c"), 53);
  return Mutable;
}

unsigned int *_PNCopyInternationalPrefix(const __CFString *a1, const __CFString *a2)
{
  unsigned int *result;
  unsigned int *v5;
  unsigned int InfoIndex;
  unsigned int v7;
  uint64_t v8;
  uint64_t v9;
  CFIndex v10;
  CFIndex v11;
  CFIndex Length;
  uint64_t v13;
  const char *v14;

  result = 0;
  if (a1)
  {
    if (a2)
    {
      result = (unsigned int *)PNGetFormatFileHeader();
      if (result)
      {
        v5 = result;
        InfoIndex = UIPhoneFormatCountryGetInfoIndex(result, a2);
        if (InfoIndex == -1)
          return 0;
        v7 = InfoIndex;
        v8 = (uint64_t)&v5[3 * UIPhoneFormatCountryGetCount(v5) + 1] + v5[3 * InfoIndex + 3];
        if (!v8)
        {
          return 0;
        }
        else
        {
          v9 = _NumberRangeWithoutVerticalServiceCode(a1, 0, v7);
          if (v9 == -1)
          {
            Length = CFStringGetLength(a1);
            v11 = 0;
          }
          else
          {
            v11 = v9;
            Length = v10;
          }
          v13 = 0;
          v14 = 0;
          result = (unsigned int *)_InternationalPrefixForDigitsInCountry(v8, v7, a1, 0, v11, Length, &v13, &v14);
          if (result)
            return (unsigned int *)CFStringCreateWithCString((CFAllocatorRef)*MEMORY[0x24BDBD240], (const char *)result, 0x8000100u);
        }
      }
    }
  }
  return result;
}

uint64_t UIPhoneFormatFileGetCountryHeader(unsigned int *a1, int a2)
{
  return (uint64_t)&a1[3 * UIPhoneFormatCountryGetCount(a1) + 1] + a1[3 * a2 + 3];
}

BOOL _PNIsDomesticNumber(const __CFString *a1, const __CFString *a2)
{
  const __CFString *v4;
  const __CFString *v5;
  _BOOL8 v6;
  const __CFString *v7;
  const __CFString *v8;

  if (CFStringGetCharacterAtIndex(a1, 0) == 43)
  {
    v4 = PNCopyBestGuessCountryCodeForNumber(a1);
    if (!v4)
    {
      CFRelease(0);
      return 0;
    }
    v5 = v4;
    v6 = CFStringCompare(v4, a2, 1uLL) == kCFCompareEqualTo;
    v7 = v5;
  }
  else
  {
    v8 = _PNCopyInternationalDirectDialingPrefixForCountry((const __CFAllocator *)*MEMORY[0x24BDBD240], a2);
    v6 = CFStringHasPrefix(a1, v8) == 0;
    v7 = v8;
  }
  CFRelease(v7);
  return v6;
}

CFStringRef _PNCopyInternationalDirectDialingPrefixForCountry(const __CFAllocator *a1, CFStringRef theString)
{
  unsigned int *v4;
  unsigned int *v5;
  int InfoIndex;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  const char *v10;
  size_t v11;

  if (!theString)
    return 0;
  if (CFStringGetLength(theString) != 2)
    return 0;
  v4 = (unsigned int *)PNGetFormatFileHeader();
  if (!v4)
    return 0;
  v5 = v4;
  InfoIndex = UIPhoneFormatCountryGetInfoIndex(v4, theString);
  if (InfoIndex == -1)
    return 0;
  v7 = (uint64_t)&v5[3 * UIPhoneFormatCountryGetCount(v5) + 1] + v5[3 * InfoIndex + 3];
  if (!v7)
    return 0;
  v8 = 0;
  v9 = v7 + 12;
  v10 = (const char *)(v7 + 12);
  do
  {
    v11 = strlen(v10);
    v8 += v11 + 1;
    v10 += v11 + 1;
  }
  while (*v10);
  return CFStringCreateWithCString(a1, (const char *)(v9 + v8 + 1), 0x8000100u);
}

CFStringRef _CopyPrefixForDigitsWithCountryIndex(const __CFString *a1, unsigned int a2)
{
  CFIndex Bytes;
  uint64_t v5;
  UInt8 *v6;
  int v7;
  CFStringRef result;
  BOOL v9;
  _OWORD v10[2];
  __int128 v11;
  __int128 v12;
  CFIndex v13;
  CFIndex v14[2];
  CFRange v15;
  CFRange v16;

  v14[1] = *MEMORY[0x24BDAC8D0];
  v13 = 0;
  v14[0] = 0;
  v15.length = CFStringGetLength(a1);
  v15.location = 0;
  Bytes = CFStringGetBytes(a1, v15, 0x8000100u, 0, 0, 0, 0, v14);
  MEMORY[0x24BDAC7A8](Bytes);
  v6 = (UInt8 *)v10 - ((v5 + 16) & 0xFFFFFFFFFFFFFFF0);
  v16.length = CFStringGetLength(a1);
  v16.location = 0;
  CFStringGetBytes(a1, v16, 0x8000100u, 0, 0, v6, v14[0], &v13);
  v6[v13] = 0;
  v11 = 0u;
  v12 = 0u;
  memset(v10, 0, sizeof(v10));
  v7 = _DecomposePhoneNumberWithCountryIndex((char *)v6, a2, (uint64_t)v10, 0, 1);
  result = 0;
  if (v7)
    v9 = (_QWORD)v11 == 0;
  else
    v9 = 1;
  if (!v9)
    return CFStringCreateWithBytes((CFAllocatorRef)*MEMORY[0x24BDBD240], (const UInt8 *)v11, DWORD2(v11), 0x8000100u, 0);
  return result;
}

CFStringRef _PNCopyNationalDirectDialingPrefixForCountry(const __CFAllocator *a1, CFStringRef theString)
{
  unsigned int *v4;
  unsigned int *v5;
  int InfoIndex;
  uint64_t v7;

  if (theString
    && CFStringGetLength(theString) == 2
    && (v4 = (unsigned int *)PNGetFormatFileHeader()) != 0
    && (v5 = v4, InfoIndex = UIPhoneFormatCountryGetInfoIndex(v4, theString), InfoIndex != -1)
    && (v7 = (uint64_t)&v5[3 * UIPhoneFormatCountryGetCount(v5) + 1] + v5[3 * InfoIndex + 3]) != 0)
  {
    return CFStringCreateWithCString(a1, (const char *)(v7 + 12), 0x8000100u);
  }
  else
  {
    return 0;
  }
}

uint64_t UIPhoneFormatGetNationalAccessCode(uint64_t a1)
{
  return a1 + 12;
}

CFStringRef _PNCopyFormattedNumberForDigitsWithCountryByRemovingAtIndex(const __CFString *a1, const __CFString *a2, uint64_t a3)
{
  CFIndex Length;
  CFIndex v7;
  CFIndex v8;
  CFIndex v9;
  uint64_t v10;
  UniChar *v11;
  CFIndex v12;
  CFStringRef v14;
  CFMutableStringRef MutableCopy;
  _QWORD v17[2];
  CFRange v18;
  CFRange v19;

  v17[1] = *MEMORY[0x24BDAC8D0];
  if (!a1)
    return &stru_24BF25160;
  Length = CFStringGetLength(a1);
  v7 = Length - 1;
  if (Length < 1)
    return &stru_24BF25160;
  v8 = Length;
  v9 = a3 - 1;
  MEMORY[0x24BDAC7A8](Length);
  v11 = (UniChar *)((char *)v17 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0));
  v18.location = 0;
  v18.length = v8;
  CFStringGetCharacters(a1, v18, v11);
  if (v9 <= v8)
    v12 = v9;
  else
    v12 = v7;
  if (v12 < 0)
    return _PNCopyCompressedFormattedStringWithCountry(a1, a2, 0);
  while (_IsInFormattingSet(v11[v12]))
  {
    if (v12-- <= 0)
      return _PNCopyCompressedFormattedStringWithCountry(a1, a2, 0);
  }
  MutableCopy = CFStringCreateMutableCopy((CFAllocatorRef)*MEMORY[0x24BDBD240], 0, a1);
  v19.location = v12;
  v19.length = 1;
  CFStringDelete(MutableCopy, v19);
  if (CFStringGetLength(MutableCopy))
    v14 = _PNCopyCompressedFormattedStringWithCountry(MutableCopy, a2, 0);
  else
    v14 = &stru_24BF25160;
  CFRelease(MutableCopy);
  return v14;
}

char *UIPhoneFormatFileFirstPrefixSectionHeader(unsigned __int16 *a1)
{
  return (char *)a1 + *a1;
}

uint64_t UIPhoneFormatFileNextPrefixSectionHeader(uint64_t a1)
{
  return a1 + 16 * *(unsigned __int16 *)(a1 + 2) + 4;
}

uint64_t UIPhoneFormatFileGetCountryLength(unsigned int *a1, int a2, int a3)
{
  unsigned int *v6;
  uint64_t v7;
  unsigned int Count;
  unsigned int v9;
  unsigned int v10;
  unsigned int v11;
  uint64_t v12;
  uint64_t v13;

  v6 = a1 + 1;
  v7 = (uint64_t)&v6[3 * UIPhoneFormatCountryGetCount(a1)] + v6[3 * a3 + 2];
  Count = UIPhoneFormatCountryGetCount(a1);
  v9 = a3 + 1;
  if (a3 + 1 >= Count)
    goto LABEL_7;
  v10 = Count;
  v11 = a3 + 2;
  v12 = 12 * v9 + 12;
  do
  {
    v13 = (uint64_t)&v6[3 * UIPhoneFormatCountryGetCount(a1)] + *(unsigned int *)((char *)a1 + v12);
    if (v13 != v7)
      break;
    v12 += 12;
  }
  while (v11++ < v10);
  if (v13 == v7)
LABEL_7:
    LODWORD(v13) = (_DWORD)a1 + a2;
  return (v13 - v7);
}

char *UIPhoneFormatGetFirstFormatString(unsigned __int16 *a1)
{
  return (char *)a1 + *a1 + *((unsigned int *)a1 + 1);
}

const char *shouldEnableStrictEquality(const char **a1)
{
  const char *result;

  result = *a1;
  if (result)
    return (const char *)(strcmp(result, "86") == 0);
  return result;
}

CFStringRef _PNCopyFullyQualifiedOriginalValue(const __CFString *a1, const __CFString *a2)
{
  if (a2)
    return _PNCreateStringByAddingPauses(a1, a2);
  else
    return CFStringCreateCopy((CFAllocatorRef)*MEMORY[0x24BDBD240], a1);
}

uint64_t itu_strcmp(const char *a1, const char *a2)
{
  if (!a1 && a2)
    return 0xFFFFFFFFLL;
  if (a1 == a2)
    return 0;
  if (!a1 || a2)
    return strcmp(a1, a2);
  return 1;
}

uint64_t itu_strncmp(const char *a1, const char *a2, size_t a3)
{
  if (!a1 && a2)
    return 0xFFFFFFFFLL;
  if (a1 == a2)
    return 0;
  if (!a1 || a2)
    return strncmp(a1, a2, a3);
  return 1;
}

uint64_t pn_uset_alphabetSetContains()
{
  uint64_t result;

  os_unfair_lock_lock(&__pn_uset_unfair_lock);
  if (!__pn_uset_getAlphabetSet_set)
  {
    os_unfair_lock_assert_owner(&__pn_uset_unfair_lock);
    if ((__pn_uset_getAlphabetPattern_didInit & 1) == 0)
    {
      u_charsToUChars("[A-Za-z]", __pn_uset_getAlphabetPattern_pattern, 9);
      __pn_uset_getAlphabetPattern_didInit = 1;
    }
    __pn_uset_getAlphabetSet_set = uset_openPattern();
  }
  os_unfair_lock_unlock(&__pn_uset_unfair_lock);
  result = __pn_uset_getAlphabetSet_set;
  if (__pn_uset_getAlphabetSet_set)
    JUMPOUT(0x20BCF7F44);
  return result;
}

uint64_t pn_uset_internationalPrefixSetContains()
{
  uint64_t result;

  os_unfair_lock_lock(&__pn_uset_unfair_lock);
  if (!__pn_uset_getInternationalPrefixSet_set)
  {
    os_unfair_lock_assert_owner(&__pn_uset_unfair_lock);
    if ((__pn_uset_getInternationalPrefixPattern_didInit & 1) == 0)
    {
      u_charsToUChars("[+]", __pn_uset_getInternationalPrefixPattern_pattern, 4);
      __pn_uset_getInternationalPrefixPattern_didInit = 1;
    }
    __pn_uset_getInternationalPrefixSet_set = uset_openPattern();
  }
  os_unfair_lock_unlock(&__pn_uset_unfair_lock);
  result = __pn_uset_getInternationalPrefixSet_set;
  if (__pn_uset_getInternationalPrefixSet_set)
    JUMPOUT(0x20BCF7F44);
  return result;
}

uint64_t pn_uset_numeralSetContains()
{
  uint64_t result;

  os_unfair_lock_lock(&__pn_uset_unfair_lock);
  if (!__pn_uset_getNumeralSet_set)
  {
    os_unfair_lock_assert_owner(&__pn_uset_unfair_lock);
    if ((__pn_uset_getNumeralPattern_didInit & 1) == 0)
    {
      u_charsToUChars("[:Nd:]", __pn_uset_getNumeralPattern_pattern, 7);
      __pn_uset_getNumeralPattern_didInit = 1;
    }
    __pn_uset_getNumeralSet_set = uset_openPattern();
  }
  os_unfair_lock_unlock(&__pn_uset_unfair_lock);
  result = __pn_uset_getNumeralSet_set;
  if (__pn_uset_getNumeralSet_set)
    JUMPOUT(0x20BCF7F44);
  return result;
}

uint64_t pn_uset_pauseSetContains()
{
  uint64_t result;

  os_unfair_lock_lock(&__pn_uset_unfair_lock);
  if (!__pn_uset_getPauseSet_set)
  {
    os_unfair_lock_assert_owner(&__pn_uset_unfair_lock);
    if ((__pn_uset_getPausePattern_didInit & 1) == 0)
    {
      u_charsToUChars("[,;]", __pn_uset_getPausePattern_pattern, 5);
      __pn_uset_getPausePattern_didInit = 1;
    }
    __pn_uset_getPauseSet_set = uset_openPattern();
  }
  os_unfair_lock_unlock(&__pn_uset_unfair_lock);
  result = __pn_uset_getPauseSet_set;
  if (__pn_uset_getPauseSet_set)
    JUMPOUT(0x20BCF7F44);
  return result;
}

uint64_t pn_uset_separatorSetContains()
{
  uint64_t result;

  os_unfair_lock_lock(&__pn_uset_unfair_lock);
  if (!__pn_uset_getSeparatorSet_set)
  {
    os_unfair_lock_assert_owner(&__pn_uset_unfair_lock);
    if ((__pn_uset_getSeparatorPattern_didInit & 1) == 0)
    {
      u_charsToUChars("[\\ \"'()\\-./<>\\[\\]]", __pn_uset_getSeparatorPattern_pattern, 19);
      __pn_uset_getSeparatorPattern_didInit = 1;
    }
    __pn_uset_getSeparatorSet_set = uset_openPattern();
  }
  os_unfair_lock_unlock(&__pn_uset_unfair_lock);
  result = __pn_uset_getSeparatorSet_set;
  if (__pn_uset_getSeparatorSet_set)
    JUMPOUT(0x20BCF7F44);
  return result;
}

uint64_t pn_uset_verticalServiceSetContains()
{
  uint64_t result;

  os_unfair_lock_lock(&__pn_uset_unfair_lock);
  if (!__pn_uset_getVerticalServiceSet_set)
  {
    os_unfair_lock_assert_owner(&__pn_uset_unfair_lock);
    if ((__pn_uset_getVerticalServicePattern_didInit & 1) == 0)
    {
      u_charsToUChars("[*#]", __pn_uset_getVerticalServicePattern_pattern, 5);
      __pn_uset_getVerticalServicePattern_didInit = 1;
    }
    __pn_uset_getVerticalServiceSet_set = uset_openPattern();
  }
  os_unfair_lock_unlock(&__pn_uset_unfair_lock);
  result = __pn_uset_getVerticalServiceSet_set;
  if (__pn_uset_getVerticalServiceSet_set)
    JUMPOUT(0x20BCF7F44);
  return result;
}

CFStringRef CFPhoneNumberStringTransformCreateCopy(const __CFAllocator *a1, CFStringRef theString, CFRange *a3, const __CFString *a4, Boolean a5)
{
  CFIndex Length;
  CFMutableStringRef MutableCopy;
  CFStringRef Copy;

  if (theString)
  {
    Length = CFStringGetLength(theString);
    MutableCopy = CFStringCreateMutableCopy(a1, Length, theString);
    if (CFStringTransform(MutableCopy, a3, a4, a5))
    {
      if (MutableCopy)
      {
        Copy = CFStringCreateCopy(a1, MutableCopy);
        CFRelease(MutableCopy);
        return Copy;
      }
    }
    else
    {
      CFRelease(MutableCopy);
    }
  }
  return 0;
}

uint64_t CFPhoneNumberGetTypeID()
{
  if (CFPhoneNumberGetTypeID_initOnce != -1)
    dispatch_once(&CFPhoneNumberGetTypeID_initOnce, &__block_literal_global_1);
  return __kCFPhoneNumberTypeID;
}

uint64_t CFPhoneNumberCreateCopy(uint64_t a1, uint64_t a2)
{
  uint64_t Instance;
  char *v4;
  CFTypeRef v5;
  CFTypeRef v6;
  CFTypeRef v7;
  CFTypeRef v8;
  CFTypeRef v9;

  if (CFPhoneNumberGetTypeID_initOnce != -1)
    dispatch_once(&CFPhoneNumberGetTypeID_initOnce, &__block_literal_global_1);
  Instance = _CFRuntimeCreateInstance();
  if (Instance)
  {
    v4 = *(char **)(a2 + 16);
    if (v4)
      v4 = strdup(v4);
    *(_QWORD *)(Instance + 16) = v4;
    v5 = *(CFTypeRef *)(a2 + 24);
    if (v5)
      v5 = CFRetain(v5);
    *(_QWORD *)(Instance + 24) = v5;
    v6 = *(CFTypeRef *)(a2 + 32);
    if (v6)
      v6 = CFRetain(v6);
    *(_QWORD *)(Instance + 32) = v6;
    v7 = *(CFTypeRef *)(a2 + 40);
    if (v7)
      v7 = CFRetain(v7);
    *(_QWORD *)(Instance + 40) = v7;
    v8 = *(CFTypeRef *)(a2 + 48);
    if (v8)
      v8 = CFRetain(v8);
    *(_QWORD *)(Instance + 48) = v8;
    v9 = *(CFTypeRef *)(a2 + 56);
    if (v9)
      v9 = CFRetain(v9);
    *(_QWORD *)(Instance + 56) = v9;
    *(_BYTE *)(Instance + 64) = *(_BYTE *)(a2 + 64);
  }
  return Instance;
}

CFStringRef CFPhoneNumberCopyNumberForInternationalAssist(uint64_t a1, char *a2)
{
  __CFString *v4;
  CFStringRef Copy;
  char v6;

  v4 = _PNCopyFullyQualifiedNumberForCountryInternal(*(const __CFString **)(a1 + 24), *(__CFString **)(a1 + 48), *(const __CFString **)(a1 + 32), &__block_literal_global_7, 0, 0);
  if (v4)
  {
    Copy = v4;
    if (CFStringCompare(v4, *(CFStringRef *)(a1 + 40), 0))
    {
      if (a2)
      {
        v6 = 1;
LABEL_8:
        *a2 = v6;
        return Copy;
      }
      return Copy;
    }
    CFRelease(Copy);
  }
  Copy = CFStringCreateCopy((CFAllocatorRef)*MEMORY[0x24BDBD240], *(CFStringRef *)(a1 + 40));
  if (a2)
  {
    v6 = 0;
    goto LABEL_8;
  }
  return Copy;
}

CFStringRef CFPhoneNumberCopyNumberForLocalAssist(const __CFString **a1, char *a2)
{
  int valid;
  CFAllocatorRef *v5;
  char *v6;
  UInt8 *v7;
  const __CFAllocator *v8;
  size_t v9;
  const __CFString *v10;
  uint64_t v11;
  CFStringRef v12;
  CFStringRef v13;
  CFStringRef v14;
  CFStringRef Copy;
  char v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23[4];
  char v24;
  CFRange v25;
  CFRange v26;

  valid = PNIsValidPhoneNumberForCountry(a1[5], a1[6]);
  v5 = (CFAllocatorRef *)MEMORY[0x24BDBD240];
  if (valid)
  {
    v24 = 0;
    memset(v23, 0, sizeof(v23));
    v6 = _PNCopyBestGuessNumberForCountry(a1[3], (__CFString *)a1[6], 0, v23, &v24);
    v7 = (UInt8 *)v6;
    if (v24 && v6)
    {
      v8 = *v5;
      v9 = strlen(v6);
      v10 = CFStringCreateWithBytes(*v5, v7, v9, 0x8000100u, 0);
      free(v7);
      v21 = 0u;
      v22 = 0u;
      v19 = 0u;
      v20 = 0u;
      v18 = 0u;
      if (_PNFindFormatRuleForDigitsWithCountry(v10, a1[6], 0, (uint64_t)&v18))
      {
        if (BYTE9(v20))
        {
          v25.length = v21;
          v11 = *((_QWORD *)&v21 + 1) + v21;
          v25.location = 0;
          v12 = CFStringCreateWithSubstring(v8, v10, v25);
          v26.length = CFStringGetLength(v10) - v11;
          v26.location = v11;
          v13 = CFStringCreateWithSubstring(v8, v10, v26);
          CFRelease(v10);
          v10 = CFStringCreateWithFormat(v8, 0, CFSTR("%@%@"), v12, v13);
          CFRelease(v12);
          CFRelease(v13);
        }
        if ((BYTE4(v19) & 0x20) != 0 && !BYTE8(v20) && (!*((_QWORD *)&v23[0] + 1) || !**((_BYTE **)&v23[0] + 1)))
        {
          v14 = CFStringCreateWithFormat(v8, 0, CFSTR("%s%@"), (_QWORD)v18 + 12, v10);
          CFRelease(v10);
          v10 = v14;
        }
      }
      if (v10)
      {
        if (CFStringCompare(v10, a1[3], 0))
        {
          Copy = _PNCreateStringByAddingPauses(v10, a1[4]);
          CFRelease(v10);
          if (a2)
          {
            v16 = 1;
LABEL_21:
            *a2 = v16;
            return Copy;
          }
          return Copy;
        }
        CFRelease(v10);
      }
    }
    else if (v6)
    {
      free(v6);
    }
  }
  Copy = CFStringCreateCopy(*v5, a1[5]);
  if (a2)
  {
    v16 = 0;
    goto LABEL_21;
  }
  return Copy;
}

CFTypeRef CFPhoneNumberCopyCountryCode(uint64_t a1)
{
  return CFRetain(*(CFTypeRef *)(a1 + 48));
}

CFTypeRef _CFPhoneNumberCopyCountryCode(uint64_t a1)
{
  return CFRetain(*(CFTypeRef *)(a1 + 48));
}

uint64_t __CFPhoneNumberCopyDescription(uint64_t a1)
{
  if (a1)
    return (uint64_t)_CFPhoneNumberCopyFormattedRepresentation(a1);
  return a1;
}

void CFArrayAppendValue(CFMutableArrayRef theArray, const void *value)
{
  MEMORY[0x24BDBB7C8](theArray, value);
}

CFMutableArrayRef CFArrayCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFArrayCallBacks *callBacks)
{
  return (CFMutableArrayRef)MEMORY[0x24BDBB808](allocator, capacity, callBacks);
}

CFURLRef CFBundleCopyResourceURL(CFBundleRef bundle, CFStringRef resourceName, CFStringRef resourceType, CFStringRef subDirName)
{
  return (CFURLRef)MEMORY[0x24BDBBA80](bundle, resourceName, resourceType, subDirName);
}

CFBundleRef CFBundleGetBundleWithIdentifier(CFStringRef bundleID)
{
  return (CFBundleRef)MEMORY[0x24BDBBAA8](bundleID);
}

CFCharacterSetRef CFCharacterSetCreateWithCharactersInString(CFAllocatorRef alloc, CFStringRef theString)
{
  return (CFCharacterSetRef)MEMORY[0x24BDBBC18](alloc, theString);
}

CFMutableDictionaryRef CFDictionaryCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFDictionaryKeyCallBacks *keyCallBacks, const CFDictionaryValueCallBacks *valueCallBacks)
{
  return (CFMutableDictionaryRef)MEMORY[0x24BDBBDF0](allocator, capacity, keyCallBacks, valueCallBacks);
}

CFMutableDictionaryRef CFDictionaryCreateMutableCopy(CFAllocatorRef allocator, CFIndex capacity, CFDictionaryRef theDict)
{
  return (CFMutableDictionaryRef)MEMORY[0x24BDBBDF8](allocator, capacity, theDict);
}

CFIndex CFDictionaryGetCount(CFDictionaryRef theDict)
{
  return MEMORY[0x24BDBBE00](theDict);
}

const void *__cdecl CFDictionaryGetValue(CFDictionaryRef theDict, const void *key)
{
  return (const void *)MEMORY[0x24BDBBE30](theDict, key);
}

void CFDictionaryRemoveValue(CFMutableDictionaryRef theDict, const void *key)
{
  MEMORY[0x24BDBBE48](theDict, key);
}

void CFDictionarySetValue(CFMutableDictionaryRef theDict, const void *key, const void *value)
{
  MEMORY[0x24BDBBE60](theDict, key, value);
}

Boolean CFEqual(CFTypeRef cf1, CFTypeRef cf2)
{
  return MEMORY[0x24BDBBE68](cf1, cf2);
}

CFTypeID CFGetTypeID(CFTypeRef cf)
{
  return MEMORY[0x24BDBBEF8](cf);
}

CFHashCode CFHash(CFTypeRef cf)
{
  return MEMORY[0x24BDBBF10](cf);
}

CFLocaleRef CFLocaleCopyCurrent(void)
{
  return (CFLocaleRef)MEMORY[0x24BDBBF28]();
}

CFDictionaryRef CFLocaleCreateComponentsFromLocaleIdentifier(CFAllocatorRef allocator, CFLocaleIdentifier localeID)
{
  return (CFDictionaryRef)MEMORY[0x24BDBBF60](allocator, localeID);
}

CFLocaleIdentifier CFLocaleCreateLocaleIdentifierFromComponents(CFAllocatorRef allocator, CFDictionaryRef dictionary)
{
  return (CFLocaleIdentifier)MEMORY[0x24BDBBF70](allocator, dictionary);
}

CFLocaleIdentifier CFLocaleGetIdentifier(CFLocaleRef locale)
{
  return (CFLocaleIdentifier)MEMORY[0x24BDBBF78](locale);
}

CFLocaleLanguageDirection CFLocaleGetLanguageCharacterDirection(CFStringRef isoLangCode)
{
  return MEMORY[0x24BDBBF80](isoLangCode);
}

CFNumberRef CFNumberCreate(CFAllocatorRef allocator, CFNumberType theType, const void *valuePtr)
{
  return (CFNumberRef)MEMORY[0x24BDBC0A0](allocator, theType, valuePtr);
}

CFNumberFormatterRef CFNumberFormatterCreate(CFAllocatorRef allocator, CFLocaleRef locale, CFNumberFormatterStyle style)
{
  return (CFNumberFormatterRef)MEMORY[0x24BDBC0B8](allocator, locale, style);
}

CFStringRef CFNumberFormatterCreateStringWithValue(CFAllocatorRef allocator, CFNumberFormatterRef formatter, CFNumberType numberType, const void *valuePtr)
{
  return (CFStringRef)MEMORY[0x24BDBC0D0](allocator, formatter, numberType, valuePtr);
}

Boolean CFNumberFormatterGetValueFromString(CFNumberFormatterRef formatter, CFStringRef string, CFRange *rangep, CFNumberType numberType, void *valuePtr)
{
  return MEMORY[0x24BDBC0F0](formatter, string, rangep, numberType, valuePtr);
}

Boolean CFNumberGetValue(CFNumberRef number, CFNumberType theType, void *valuePtr)
{
  return MEMORY[0x24BDBC130](number, theType, valuePtr);
}

void CFRelease(CFTypeRef cf)
{
  MEMORY[0x24BDBC298](cf);
}

CFTypeRef CFRetain(CFTypeRef cf)
{
  return (CFTypeRef)MEMORY[0x24BDBC2A8](cf);
}

void CFStringAppend(CFMutableStringRef theString, CFStringRef appendedString)
{
  MEMORY[0x24BDBC4A8](theString, appendedString);
}

void CFStringAppendFormat(CFMutableStringRef theString, CFDictionaryRef formatOptions, CFStringRef format, ...)
{
  MEMORY[0x24BDBC4C0](theString, formatOptions, format);
}

CFComparisonResult CFStringCompare(CFStringRef theString1, CFStringRef theString2, CFStringCompareFlags compareOptions)
{
  return MEMORY[0x24BDBC4D0](theString1, theString2, compareOptions);
}

CFStringRef CFStringCreateCopy(CFAllocatorRef alloc, CFStringRef theString)
{
  return (CFStringRef)MEMORY[0x24BDBC520](alloc, theString);
}

CFMutableStringRef CFStringCreateMutable(CFAllocatorRef alloc, CFIndex maxLength)
{
  return (CFMutableStringRef)MEMORY[0x24BDBC538](alloc, maxLength);
}

CFMutableStringRef CFStringCreateMutableCopy(CFAllocatorRef alloc, CFIndex maxLength, CFStringRef theString)
{
  return (CFMutableStringRef)MEMORY[0x24BDBC540](alloc, maxLength, theString);
}

CFStringRef CFStringCreateWithBytes(CFAllocatorRef alloc, const UInt8 *bytes, CFIndex numBytes, CFStringEncoding encoding, Boolean isExternalRepresentation)
{
  return (CFStringRef)MEMORY[0x24BDBC558](alloc, bytes, numBytes, *(_QWORD *)&encoding, isExternalRepresentation);
}

CFStringRef CFStringCreateWithBytesNoCopy(CFAllocatorRef alloc, const UInt8 *bytes, CFIndex numBytes, CFStringEncoding encoding, Boolean isExternalRepresentation, CFAllocatorRef contentsDeallocator)
{
  return (CFStringRef)MEMORY[0x24BDBC560](alloc, bytes, numBytes, *(_QWORD *)&encoding, isExternalRepresentation, contentsDeallocator);
}

CFStringRef CFStringCreateWithCString(CFAllocatorRef alloc, const char *cStr, CFStringEncoding encoding)
{
  return (CFStringRef)MEMORY[0x24BDBC568](alloc, cStr, *(_QWORD *)&encoding);
}

CFStringRef CFStringCreateWithCharacters(CFAllocatorRef alloc, const UniChar *chars, CFIndex numChars)
{
  return (CFStringRef)MEMORY[0x24BDBC580](alloc, chars, numChars);
}

CFStringRef CFStringCreateWithCharactersNoCopy(CFAllocatorRef alloc, const UniChar *chars, CFIndex numChars, CFAllocatorRef contentsDeallocator)
{
  return (CFStringRef)MEMORY[0x24BDBC588](alloc, chars, numChars, contentsDeallocator);
}

CFStringRef CFStringCreateWithFormat(CFAllocatorRef alloc, CFDictionaryRef formatOptions, CFStringRef format, ...)
{
  return (CFStringRef)MEMORY[0x24BDBC598](alloc, formatOptions, format);
}

CFStringRef CFStringCreateWithSubstring(CFAllocatorRef alloc, CFStringRef str, CFRange range)
{
  return (CFStringRef)MEMORY[0x24BDBC5B0](alloc, str, range.location, range.length);
}

void CFStringDelete(CFMutableStringRef theString, CFRange range)
{
  MEMORY[0x24BDBC5B8](theString, range.location, range.length);
}

CFRange CFStringFind(CFStringRef theString, CFStringRef stringToFind, CFStringCompareFlags compareOptions)
{
  CFIndex v3;
  CFIndex v4;
  CFRange result;

  v3 = MEMORY[0x24BDBC5D0](theString, stringToFind, compareOptions);
  result.length = v4;
  result.location = v3;
  return result;
}

Boolean CFStringFindCharacterFromSet(CFStringRef theString, CFCharacterSetRef theSet, CFRange rangeToSearch, CFStringCompareFlags searchOptions, CFRange *result)
{
  return MEMORY[0x24BDBC5E0](theString, theSet, rangeToSearch.location, rangeToSearch.length, searchOptions, result);
}

CFIndex CFStringGetBytes(CFStringRef theString, CFRange range, CFStringEncoding encoding, UInt8 lossByte, Boolean isExternalRepresentation, UInt8 *buffer, CFIndex maxBufLen, CFIndex *usedBufLen)
{
  return MEMORY[0x24BDBC5F8](theString, range.location, range.length, *(_QWORD *)&encoding, lossByte, isExternalRepresentation, buffer, maxBufLen);
}

Boolean CFStringGetCString(CFStringRef theString, char *buffer, CFIndex bufferSize, CFStringEncoding encoding)
{
  return MEMORY[0x24BDBC600](theString, buffer, bufferSize, *(_QWORD *)&encoding);
}

const char *__cdecl CFStringGetCStringPtr(CFStringRef theString, CFStringEncoding encoding)
{
  return (const char *)MEMORY[0x24BDBC610](theString, *(_QWORD *)&encoding);
}

UniChar CFStringGetCharacterAtIndex(CFStringRef theString, CFIndex idx)
{
  return MEMORY[0x24BDBC618](theString, idx);
}

void CFStringGetCharacters(CFStringRef theString, CFRange range, UniChar *buffer)
{
  MEMORY[0x24BDBC620](theString, range.location, range.length, buffer);
}

const UniChar *__cdecl CFStringGetCharactersPtr(CFStringRef theString)
{
  return (const UniChar *)MEMORY[0x24BDBC628](theString);
}

SInt32 CFStringGetIntValue(CFStringRef str)
{
  return MEMORY[0x24BDBC650](str);
}

CFIndex CFStringGetLength(CFStringRef theString)
{
  return MEMORY[0x24BDBC658](theString);
}

CFIndex CFStringGetMaximumSizeForEncoding(CFIndex length, CFStringEncoding encoding)
{
  return MEMORY[0x24BDBC660](length, *(_QWORD *)&encoding);
}

CFTypeID CFStringGetTypeID(void)
{
  return MEMORY[0x24BDBC698]();
}

Boolean CFStringHasPrefix(CFStringRef theString, CFStringRef prefix)
{
  return MEMORY[0x24BDBC6A8](theString, prefix);
}

void CFStringLowercase(CFMutableStringRef theString, CFLocaleRef locale)
{
  MEMORY[0x24BDBC6C8](theString, locale);
}

Boolean CFStringTransform(CFMutableStringRef string, CFRange *range, CFStringRef transform, Boolean reverse)
{
  return MEMORY[0x24BDBC730](string, range, transform, reverse);
}

void CFStringTrimWhitespace(CFMutableStringRef theString)
{
  MEMORY[0x24BDBC740](theString);
}

CFStringRef CFURLCopyFileSystemPath(CFURLRef anURL, CFURLPathStyle pathStyle)
{
  return (CFStringRef)MEMORY[0x24BDBC798](anURL, pathStyle);
}

uint64_t _CFRuntimeCreateInstance()
{
  return MEMORY[0x24BDBD0A8]();
}

uint64_t _CFRuntimeRegisterClass()
{
  return MEMORY[0x24BDBD0B0]();
}

int *__error(void)
{
  return (int *)MEMORY[0x24BDAC7D0]();
}

int __maskrune(__darwin_ct_rune_t a1, unint64_t a2)
{
  return MEMORY[0x24BDAC838](*(_QWORD *)&a1, a2);
}

void _os_log_fault_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB88](dso, log, type, format, buf, *(_QWORD *)&size);
}

void bzero(void *a1, size_t a2)
{
  MEMORY[0x24BDAD320](a1, a2);
}

int close(int a1)
{
  return MEMORY[0x24BDAD9D8](*(_QWORD *)&a1);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
  MEMORY[0x24BDADE98](predicate, block);
}

int fprintf(FILE *a1, const char *a2, ...)
{
  return MEMORY[0x24BDAE428](a1, a2);
}

void free(void *a1)
{
  MEMORY[0x24BDAE450](a1);
}

size_t fwrite(const void *__ptr, size_t __size, size_t __nitems, FILE *__stream)
{
  return MEMORY[0x24BDAE590](__ptr, __size, __nitems, __stream);
}

off_t lseek(int a1, off_t a2, int a3)
{
  return MEMORY[0x24BDAEB20](*(_QWORD *)&a1, a2, *(_QWORD *)&a3);
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x24BDAED78](size, type_id);
}

void *__cdecl mmap(void *a1, size_t a2, int a3, int a4, int a5, off_t a6)
{
  return (void *)MEMORY[0x24BDAEFA8](a1, a2, *(_QWORD *)&a3, *(_QWORD *)&a4, *(_QWORD *)&a5, a6);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x24BEDCFE8]();
}

int open(const char *a1, int a2, ...)
{
  return MEMORY[0x24BDAF228](a1, *(_QWORD *)&a2);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x24BDAF368](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x24BDAF398](oslog, type);
}

void os_unfair_lock_assert_owner(const os_unfair_lock *lock)
{
  MEMORY[0x24BDAF458](lock);
}

void os_unfair_lock_lock(os_unfair_lock_t lock)
{
  MEMORY[0x24BDAF460](lock);
}

uint64_t os_unfair_lock_lock_with_options()
{
  return MEMORY[0x24BDAF470]();
}

void os_unfair_lock_unlock(os_unfair_lock_t lock)
{
  MEMORY[0x24BDAF488](lock);
}

int strcasecmp(const char *a1, const char *a2)
{
  return MEMORY[0x24BDAFED0](a1, a2);
}

int strcmp(const char *__s1, const char *__s2)
{
  return MEMORY[0x24BDAFEF0](__s1, __s2);
}

char *__cdecl strdup(const char *__s1)
{
  return (char *)MEMORY[0x24BDAFF10](__s1);
}

size_t strlen(const char *__s)
{
  return MEMORY[0x24BDAFF40](__s);
}

int strncmp(const char *__s1, const char *__s2, size_t __n)
{
  return MEMORY[0x24BDAFF68](__s1, __s2, __n);
}

char *__cdecl strncpy(char *__dst, const char *__src, size_t __n)
{
  return (char *)MEMORY[0x24BDAFF70](__dst, __src, __n);
}

size_t strnlen(const char *__s1, size_t __n)
{
  return MEMORY[0x24BDAFF80](__s1, __n);
}

int32_t u_charDigitValue(UChar32 c)
{
  return MEMORY[0x24BEDBF38](*(_QWORD *)&c);
}

void u_charsToUChars(const char *cs, UChar *us, int32_t length)
{
  MEMORY[0x24BEDBF58](cs, us, *(_QWORD *)&length);
}

UBool u_isdigit(UChar32 c)
{
  return MEMORY[0x24BEDBFA8](*(_QWORD *)&c);
}

int32_t u_strlen(const UChar *s)
{
  return MEMORY[0x24BEDC020](s);
}

UChar *__cdecl u_strncpy(UChar *dst, const UChar *src, int32_t n)
{
  return (UChar *)MEMORY[0x24BEDC028](dst, src, *(_QWORD *)&n);
}

UChar *__cdecl u_strrchr(const UChar *s, UChar c)
{
  return (UChar *)MEMORY[0x24BEDC030](s, c);
}

uint64_t unumsys_close()
{
  return MEMORY[0x24BEDC258]();
}

uint64_t unumsys_getName()
{
  return MEMORY[0x24BEDC260]();
}

uint64_t unumsys_open()
{
  return MEMORY[0x24BEDC268]();
}

uint64_t uset_contains()
{
  return MEMORY[0x24BEDC2F0]();
}

