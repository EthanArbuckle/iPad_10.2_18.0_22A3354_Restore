@implementation BSDescribeAppendObjectDescription

uint64_t __BSDescribeAppendObjectDescription_block_invoke(uint64_t a1, __CFString *a2, __CFString *a3)
{
  uint64_t v6;
  _QWORD *v7;
  _QWORD *v8;
  uint64_t v9;
  const char *v10;
  uint64_t v11;
  const char *v12;
  uint64_t v13;
  CFMutableStringRef *v14;
  const char *v15;
  uint64_t v16;
  const char *v17;
  uint64_t v18;
  const char *v19;
  size_t v20;
  uint64_t v21;
  char v22;
  uint64_t v23;
  uint64_t v24;
  CFIndex v26;
  uint64_t v27;
  CFIndex v28;
  __CFString *v29;
  int v30;
  uint64_t v31;
  void *v32;
  double v33;
  const __CFString *v34;
  uint64_t v35;
  void *v36;
  uint64_t v37;
  uint64_t v38;
  const __CFString *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  float v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  int *v51;
  unint64_t v52;
  _QWORD *v53;
  uint64_t v54;
  const char *v55;
  uint64_t v56;
  uint64_t v57;
  const char *v58;
  uint64_t v59;
  uint64_t v60;
  CFMutableStringRef *v61;
  const char *v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v66;
  uint64_t v67;
  CFIndex v68;
  uint64_t v69;
  CFIndex v70;
  uint64_t v71;
  uint64_t v72;
  __CFString *v73;
  int v74;
  uint64_t v75;
  void *v76;
  double v77;
  const __CFString *v78;
  uint64_t v79;
  void *v80;
  uint64_t v81;
  uint64_t v82;
  const __CFString *v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  float v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t v95;
  uint64_t v97;
  __CFString *v98;
  uint64_t v99;
  __CFString *v100;
  __CFString *v101;
  CFIndex v102;
  uint64_t v103;
  CFIndex v104;
  __CFString *v105;
  CFIndex v106;
  uint64_t v107;
  CFIndex v108;
  CFIndex usedBufLen;
  uint64_t v110;
  uint64_t (*v111)(uint64_t, __CFString *);
  void *v112;
  uint64_t v113;
  CFRange v114;
  CFRange v115;
  CFRange v116;
  CFRange v117;
  CFRange v118;
  CFRange v119;
  CFRange v120;
  CFRange v121;

  v6 = *(_QWORD *)(a1 + 32);
  v7 = *(id *)(v6 + 8);
  switch(*(_QWORD *)(v6 + 1104))
  {
    case 1:
      v8 = (_QWORD *)(v6 + 1040);
      v9 = *(_QWORD *)(v6 + 1040);
      v10 = (const char *)(v6 + 16);
      if (*(_QWORD *)(*(_QWORD *)(v6 + 8) + 24) == 3)
      {
        if (v9 > 1022)
        {
          v10[v9] = 0;
          CFStringAppendCString(*(CFMutableStringRef *)(v6 + 1064), v10, 0x8000100u);
          *(_QWORD *)(v6 + 1040) = 0;
          CFStringAppendCString(*(CFMutableStringRef *)(v6 + 1064), ";", 0x8000100u);
        }
        else
        {
          v10[v9] = 59;
          ++*v8;
        }
        goto LABEL_11;
      }
      if (v9 <= 1021)
      {
        *(_WORD *)&v10[v9] = 8251;
        v13 = 2;
        goto LABEL_19;
      }
      v10[v9] = 0;
      CFStringAppendCString(*(CFMutableStringRef *)(v6 + 1064), v10, 0x8000100u);
      v14 = (CFMutableStringRef *)(v6 + 1064);
      v15 = "; ";
      goto LABEL_24;
    case 2:
      v8 = (_QWORD *)(v6 + 1040);
      v11 = *(_QWORD *)(v6 + 1040);
      v12 = (const char *)(v6 + 16);
      if (v11 <= 1022)
      {
        v12[v11] = 32;
        v13 = 1;
        goto LABEL_19;
      }
      v12[v11] = 0;
      CFStringAppendCString(*(CFMutableStringRef *)(v6 + 1064), v12, 0x8000100u);
      v14 = (CFMutableStringRef *)(v6 + 1064);
      v15 = " ";
LABEL_24:
      *v8 = 0;
      CFStringAppendCString(*v14, v15, 0x8000100u);
      break;
    case 3:
LABEL_11:
      v16 = *(_QWORD *)(v6 + 1040);
      v17 = (const char *)(v6 + 16);
      if (v16 > 1022)
      {
        v17[v16] = 0;
        CFStringAppendCString(*(CFMutableStringRef *)(v6 + 1064), v17, 0x8000100u);
        *(_QWORD *)(v6 + 1040) = 0;
        CFStringAppendCString(*(CFMutableStringRef *)(v6 + 1064), "\n", 0x8000100u);
      }
      else
      {
        v17[v16] = 10;
        ++*(_QWORD *)(v6 + 1040);
      }
      goto LABEL_14;
    case 4:
LABEL_14:
      v18 = *(_QWORD *)(v6 + 1072);
      if (v18 < 1)
        break;
      if (v18 >= 8)
        v18 = 8;
      v19 = (const char *)*((_QWORD *)&sIndentSpaceStrings + v18);
      v20 = strlen(v19);
      v8 = (_QWORD *)(v6 + 1040);
      v21 = *(_QWORD *)(v6 + 1040);
      if ((uint64_t)(v21 + v20) > 1023)
      {
        if (v21 >= 1)
        {
          *(_BYTE *)(v6 + 16 + v21) = 0;
          CFStringAppendCString(*(CFMutableStringRef *)(v6 + 1064), (const char *)(v6 + 16), 0x8000100u);
          *v8 = 0;
        }
        CFStringAppendCString(*(CFMutableStringRef *)(v6 + 1064), v19, 0x8000100u);
      }
      else
      {
        v13 = v20;
        memcpy((void *)(v6 + v21 + 16), v19, v20);
LABEL_19:
        *v8 += v13;
      }
      break;
    default:
      goto LABEL_26;
  }
  *(_QWORD *)(v6 + 1104) = 0;
LABEL_26:
  if (!a2)
    goto LABEL_123;
  v22 = *(_BYTE *)(v6 + 1056);
  *(_BYTE *)(v6 + 1056) = 1;
  v23 = v7[6];
  v24 = v7[7];
  if (v23 < 2 || v24 < 1)
  {
    *(_QWORD *)(v6 + 1096) = 0;
  }
  else
  {
    *(_QWORD *)(v6 + 1096) = v23;
    *(_QWORD *)(v6 + 1080) = *(_QWORD *)(v6 + 1040) + objc_msgSend(*(id *)(v6 + 1064), "length");
    *(_QWORD *)(v6 + 1088) = v24;
  }
  if (!_NSIsNSString())
  {
    if (_NSIsNSNumber())
    {
      v29 = objc_retainAutorelease(a2);
      v30 = *(char *)-[__CFString objCType](v29, "objCType");
      if (v30 > 80)
      {
        switch(v30)
        {
          case 'c':
            goto LABEL_65;
          case 'd':
            v31 = *(_QWORD *)(v6 + 1040);
            if (v31 >= 1)
            {
              *(_BYTE *)(v6 + 16 + v31) = 0;
              CFStringAppendCString(*(CFMutableStringRef *)(v6 + 1064), (const char *)(v6 + 16), 0x8000100u);
              *(_QWORD *)(v6 + 1040) = 0;
            }
            v32 = *(void **)(v6 + 1064);
            -[__CFString doubleValue](v29, "doubleValue");
            v34 = CFSTR("%0.16g");
            goto LABEL_87;
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
            goto LABEL_79;
          case 'f':
            v44 = *(_QWORD *)(v6 + 1040);
            if (v44 >= 1)
            {
              *(_BYTE *)(v6 + 16 + v44) = 0;
              CFStringAppendCString(*(CFMutableStringRef *)(v6 + 1064), (const char *)(v6 + 16), 0x8000100u);
              *(_QWORD *)(v6 + 1040) = 0;
            }
            v32 = *(void **)(v6 + 1064);
            -[__CFString floatValue](v29, "floatValue");
            v33 = v45;
            v34 = CFSTR("%0.7g");
LABEL_87:
            objc_msgSend(v32, "appendFormat:", v34, *(_QWORD *)&v33);
            goto LABEL_105;
          case 'i':
            v46 = *(_QWORD *)(v6 + 1040);
            if (v46 >= 1)
            {
              *(_BYTE *)(v6 + 16 + v46) = 0;
              CFStringAppendCString(*(CFMutableStringRef *)(v6 + 1064), (const char *)(v6 + 16), 0x8000100u);
              *(_QWORD *)(v6 + 1040) = 0;
            }
            v36 = *(void **)(v6 + 1064);
            v37 = -[__CFString intValue](v29, "intValue");
            goto LABEL_91;
          case 'l':
            v47 = *(_QWORD *)(v6 + 1040);
            if (v47 >= 1)
            {
              *(_BYTE *)(v6 + 16 + v47) = 0;
              CFStringAppendCString(*(CFMutableStringRef *)(v6 + 1064), (const char *)(v6 + 16), 0x8000100u);
              *(_QWORD *)(v6 + 1040) = 0;
            }
            v36 = *(void **)(v6 + 1064);
            v37 = -[__CFString longValue](v29, "longValue");
            v39 = CFSTR("%ld");
            goto LABEL_104;
          case 'q':
            v48 = *(_QWORD *)(v6 + 1040);
            if (v48 >= 1)
            {
              *(_BYTE *)(v6 + 16 + v48) = 0;
              CFStringAppendCString(*(CFMutableStringRef *)(v6 + 1064), (const char *)(v6 + 16), 0x8000100u);
              *(_QWORD *)(v6 + 1040) = 0;
            }
            v36 = *(void **)(v6 + 1064);
            v37 = -[__CFString longLongValue](v29, "longLongValue");
            v39 = CFSTR("%lld");
            goto LABEL_104;
          case 's':
            v49 = *(_QWORD *)(v6 + 1040);
            if (v49 >= 1)
            {
              *(_BYTE *)(v6 + 16 + v49) = 0;
              CFStringAppendCString(*(CFMutableStringRef *)(v6 + 1064), (const char *)(v6 + 16), 0x8000100u);
              *(_QWORD *)(v6 + 1040) = 0;
            }
            v36 = *(void **)(v6 + 1064);
            v37 = -[__CFString shortValue](v29, "shortValue");
            v39 = CFSTR("%hi");
            goto LABEL_104;
          default:
            if (v30 == 81)
            {
              v50 = *(_QWORD *)(v6 + 1040);
              if (v50 >= 1)
              {
                *(_BYTE *)(v6 + 16 + v50) = 0;
                CFStringAppendCString(*(CFMutableStringRef *)(v6 + 1064), (const char *)(v6 + 16), 0x8000100u);
                *(_QWORD *)(v6 + 1040) = 0;
              }
              v36 = *(void **)(v6 + 1064);
              v37 = -[__CFString unsignedLongLongValue](v29, "unsignedLongLongValue");
              v39 = CFSTR("%llu");
            }
            else
            {
              if (v30 != 83)
                goto LABEL_79;
              v41 = *(_QWORD *)(v6 + 1040);
              if (v41 >= 1)
              {
                *(_BYTE *)(v6 + 16 + v41) = 0;
                CFStringAppendCString(*(CFMutableStringRef *)(v6 + 1064), (const char *)(v6 + 16), 0x8000100u);
                *(_QWORD *)(v6 + 1040) = 0;
              }
              v36 = *(void **)(v6 + 1064);
              v37 = -[__CFString unsignedShortValue](v29, "unsignedShortValue");
              v39 = CFSTR("%hu");
            }
            break;
        }
        goto LABEL_104;
      }
      if (v30 > 72)
      {
        if (v30 == 73)
        {
          v42 = *(_QWORD *)(v6 + 1040);
          if (v42 >= 1)
          {
            *(_BYTE *)(v6 + 16 + v42) = 0;
            CFStringAppendCString(*(CFMutableStringRef *)(v6 + 1064), (const char *)(v6 + 16), 0x8000100u);
            *(_QWORD *)(v6 + 1040) = 0;
          }
          v36 = *(void **)(v6 + 1064);
          v37 = -[__CFString unsignedIntValue](v29, "unsignedIntValue");
          goto LABEL_78;
        }
        if (v30 == 76)
        {
          v38 = *(_QWORD *)(v6 + 1040);
          if (v38 >= 1)
          {
            *(_BYTE *)(v6 + 16 + v38) = 0;
            CFStringAppendCString(*(CFMutableStringRef *)(v6 + 1064), (const char *)(v6 + 16), 0x8000100u);
            *(_QWORD *)(v6 + 1040) = 0;
          }
          v36 = *(void **)(v6 + 1064);
          v37 = -[__CFString unsignedLongValue](v29, "unsignedLongValue");
          v39 = CFSTR("%lu");
          goto LABEL_104;
        }
      }
      else
      {
        if (v30 == 66)
        {
LABEL_65:
          v40 = *(_QWORD *)(v6 + 1040);
          if (v40 >= 1)
          {
            *(_BYTE *)(v6 + 16 + v40) = 0;
            CFStringAppendCString(*(CFMutableStringRef *)(v6 + 1064), (const char *)(v6 + 16), 0x8000100u);
            *(_QWORD *)(v6 + 1040) = 0;
          }
          v36 = *(void **)(v6 + 1064);
          v37 = -[__CFString charValue](v29, "charValue");
LABEL_91:
          v39 = CFSTR("%d");
          goto LABEL_104;
        }
        if (v30 == 67)
        {
          v35 = *(_QWORD *)(v6 + 1040);
          if (v35 >= 1)
          {
            *(_BYTE *)(v6 + 16 + v35) = 0;
            CFStringAppendCString(*(CFMutableStringRef *)(v6 + 1064), (const char *)(v6 + 16), 0x8000100u);
            *(_QWORD *)(v6 + 1040) = 0;
          }
          v36 = *(void **)(v6 + 1064);
          v37 = -[__CFString unsignedCharValue](v29, "unsignedCharValue");
LABEL_78:
          v39 = CFSTR("%u");
LABEL_104:
          objc_msgSend(v36, "appendFormat:", v39, v37);
LABEL_105:

          goto LABEL_106;
        }
      }
LABEL_79:
      v43 = *(_QWORD *)(v6 + 1040);
      if (v43 >= 1)
      {
        *(_BYTE *)(v6 + 16 + v43) = 0;
        CFStringAppendCString(*(CFMutableStringRef *)(v6 + 1064), (const char *)(v6 + 16), 0x8000100u);
        *(_QWORD *)(v6 + 1040) = 0;
      }
      objc_msgSend(*(id *)(v6 + 1064), "appendFormat:", CFSTR("<***unknown type:%s>"), -[__CFString objCType](objc_retainAutorelease(v29), "objCType"));
      goto LABEL_105;
    }
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      -[__CFString appendDescriptionToStream:](a2, "appendDescriptionToStream:", v6);
      goto LABEL_106;
    }
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      -[__CFString appendDescriptionToFormatter:](a2, "appendDescriptionToFormatter:", v6);
      goto LABEL_106;
    }
    if (_NSIsNSDictionary())
    {
      usedBufLen = MEMORY[0x1E0C809B0];
      v110 = 3221225472;
      v111 = (uint64_t (*)(uint64_t, __CFString *))__BSDescribeAppendObjectDescription_block_invoke;
      v112 = &unk_1E1EBFB08;
      v113 = v6;
      -[BSDescriptionStream _appendDictionary:withName:itemBlock:](v6, a2, 0, (uint64_t)&usedBufLen);
      goto LABEL_106;
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend((id)v6, "appendIntegerSet:withName:format:", a2, 0, 0);
      goto LABEL_106;
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      usedBufLen = MEMORY[0x1E0C809B0];
      v110 = 3221225472;
      v111 = __BSDescribeAppendObjectDescription_block_invoke_2;
      v112 = &unk_1E1EBFB30;
      v113 = v6;
      objc_msgSend((id)v6, "appendIntegerMap:withName:keyFormat:valueBlock:", a2, 0, 0, &usedBufLen);
      goto LABEL_106;
    }
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      usedBufLen = MEMORY[0x1E0C809B0];
      v110 = 3221225472;
      v111 = __BSDescribeAppendObjectDescription_block_invoke_3;
      v112 = &unk_1E1EBFB30;
      v113 = v6;
      objc_msgSend((id)v6, "appendCollection:withName:itemBlock:", a2, 0, &usedBufLen);
      goto LABEL_106;
    }
    if (*(_BYTE *)(v6 + 1056) || (v99 = *(_QWORD *)(v6 + 8), *(_QWORD *)(v99 + 8) == 2))
    {
      if ((objc_opt_respondsToSelector() & 1) != 0)
      {
        -[__CFString succinctDescription](a2, "succinctDescription");
        v100 = (__CFString *)objc_claimAutoreleasedReturnValue();
        goto LABEL_236;
      }
      v99 = *(_QWORD *)(v6 + 8);
    }
    if (*(_QWORD *)(v99 + 16) == 2)
      -[__CFString debugDescription](a2, "debugDescription");
    else
      -[__CFString description](a2, "description");
    v100 = (__CFString *)objc_claimAutoreleasedReturnValue();
LABEL_236:
    v105 = v100;
    v106 = -[__CFString length](v100, "length");
    v107 = *(_QWORD *)(v6 + 1040);
    if (v107 + 3 * v106 > 1023)
    {
      if (v107 >= 1)
      {
        *(_BYTE *)(v6 + 16 + v107) = 0;
        CFStringAppendCString(*(CFMutableStringRef *)(v6 + 1064), (const char *)(v6 + 16), 0x8000100u);
        *(_QWORD *)(v6 + 1040) = 0;
      }
      if (v106 > 341)
      {
        objc_msgSend(*(id *)(v6 + 1064), "appendString:", v105);
        goto LABEL_246;
      }
      usedBufLen = 0;
      v121.location = 0;
      v121.length = v106;
      CFStringGetBytes(v105, v121, 0x8000100u, 0, 0, (UInt8 *)(v6 + 16), 1024, &usedBufLen);
      v108 = usedBufLen;
    }
    else
    {
      usedBufLen = 0;
      v120.location = 0;
      v120.length = v106;
      CFStringGetBytes(v105, v120, 0x8000100u, 0, 0, (UInt8 *)(v6 + v107 + 16), 1024 - v107, &usedBufLen);
      v108 = *(_QWORD *)(v6 + 1040) + usedBufLen;
    }
    *(_QWORD *)(v6 + 1040) = v108;
LABEL_246:

    goto LABEL_106;
  }
  v26 = -[__CFString length](a2, "length");
  v27 = *(_QWORD *)(v6 + 1040);
  if (v27 + 3 * v26 > 1023)
  {
    if (v27 >= 1)
    {
      *(_BYTE *)(v6 + 16 + v27) = 0;
      CFStringAppendCString(*(CFMutableStringRef *)(v6 + 1064), (const char *)(v6 + 16), 0x8000100u);
      *(_QWORD *)(v6 + 1040) = 0;
    }
    if (v26 > 341)
    {
      objc_msgSend(*(id *)(v6 + 1064), "appendString:", a2);
      goto LABEL_106;
    }
    usedBufLen = 0;
    v115.location = 0;
    v115.length = v26;
    CFStringGetBytes(a2, v115, 0x8000100u, 0, 0, (UInt8 *)(v6 + 16), 1024, &usedBufLen);
    v28 = usedBufLen;
  }
  else
  {
    usedBufLen = 0;
    v114.location = 0;
    v114.length = v26;
    CFStringGetBytes(a2, v114, 0x8000100u, 0, 0, (UInt8 *)(v6 + v27 + 16), 1024 - v27, &usedBufLen);
    v28 = *(_QWORD *)(v6 + 1040) + usedBufLen;
  }
  *(_QWORD *)(v6 + 1040) = v28;
LABEL_106:
  BSDescribeTruncationCommit(v6);
  *(_BYTE *)(v6 + 1056) = v22;
  if (*(uint64_t *)(v6 + 1048) <= 0)
    v51 = &OBJC_IVAR___BSDescriptionStyle__bodyItemSeparator;
  else
    v51 = &OBJC_IVAR___BSDescriptionStyle__proemItemSeparator;
  v52 = *(_QWORD *)(*(_QWORD *)(v6 + 8) + *v51);
  if (v52 < 2)
  {
    v53 = (_QWORD *)(v6 + 1040);
    v57 = *(_QWORD *)(v6 + 1040);
    v58 = (const char *)(v6 + 16);
    if (v57 <= 1021)
    {
      *(_WORD *)&v58[v57] = 8250;
      v56 = 2;
      goto LABEL_118;
    }
    v58[v57] = 0;
    CFStringAppendCString(*(CFMutableStringRef *)(v6 + 1064), v58, 0x8000100u);
    v61 = (CFMutableStringRef *)(v6 + 1064);
    v62 = ": ";
  }
  else if (v52 == 2)
  {
    v53 = (_QWORD *)(v6 + 1040);
    v59 = *(_QWORD *)(v6 + 1040);
    v60 = v6 + 16 + v59;
    if (v59 <= 1020)
    {
      *(_BYTE *)(v60 + 2) = 32;
      *(_WORD *)v60 = 15648;
      v56 = 3;
      goto LABEL_118;
    }
    *(_BYTE *)v60 = 0;
    CFStringAppendCString(*(CFMutableStringRef *)(v6 + 1064), (const char *)(v6 + 16), 0x8000100u);
    v61 = (CFMutableStringRef *)(v6 + 1064);
    v62 = " = ";
  }
  else
  {
    if (v52 != 3)
      goto LABEL_123;
    v53 = (_QWORD *)(v6 + 1040);
    v54 = *(_QWORD *)(v6 + 1040);
    v55 = (const char *)(v6 + 16);
    if (v54 <= 1019)
    {
      *(_DWORD *)&v55[v54] = 540945696;
      v56 = 4;
LABEL_118:
      *v53 += v56;
      goto LABEL_123;
    }
    v55[v54] = 0;
    CFStringAppendCString(*(CFMutableStringRef *)(v6 + 1064), v55, 0x8000100u);
    v61 = (CFMutableStringRef *)(v6 + 1064);
    v62 = " -> ";
  }
  *v53 = 0;
  CFStringAppendCString(*v61, v62, 0x8000100u);
LABEL_123:
  v63 = v7[8];
  v64 = v7[9];
  if (v63 < 2 || v64 < 1)
  {
    v64 = 0;
    v66 = 1096;
  }
  else
  {
    *(_QWORD *)(v6 + 1096) = v63;
    *(_QWORD *)(v6 + 1080) = *(_QWORD *)(v6 + 1040) + objc_msgSend(*(id *)(v6 + 1064), "length");
    v66 = 1088;
  }
  *(_QWORD *)(v6 + v66) = v64;

  v67 = *(_QWORD *)(a1 + 32);
  if (a3)
  {
    if (_NSIsNSString())
    {
      v68 = -[__CFString length](a3, "length");
      v69 = *(_QWORD *)(v67 + 1040);
      if (3 * v68 + v69 > 1023)
      {
        if (v69 >= 1)
        {
          *(_BYTE *)(v67 + 16 + v69) = 0;
          CFStringAppendCString(*(CFMutableStringRef *)(v67 + 1064), (const char *)(v67 + 16), 0x8000100u);
          *(_QWORD *)(v67 + 1040) = 0;
        }
        if (v68 > 341)
        {
          objc_msgSend(*(id *)(v67 + 1064), "appendString:", a3);
          goto LABEL_206;
        }
        usedBufLen = 0;
        v117.location = 0;
        v117.length = v68;
        CFStringGetBytes(a3, v117, 0x8000100u, 0, 0, (UInt8 *)(v67 + 16), 1024, &usedBufLen);
        v70 = usedBufLen;
      }
      else
      {
        usedBufLen = 0;
        v116.location = 0;
        v116.length = v68;
        CFStringGetBytes(a3, v116, 0x8000100u, 0, 0, (UInt8 *)(v67 + v69 + 16), 1024 - v69, &usedBufLen);
        v70 = *(_QWORD *)(v67 + 1040) + usedBufLen;
      }
      goto LABEL_146;
    }
    if (_NSIsNSNumber())
    {
      v73 = objc_retainAutorelease(a3);
      v74 = *(char *)-[__CFString objCType](v73, "objCType");
      if (v74 > 80)
      {
        switch(v74)
        {
          case 'c':
            goto LABEL_165;
          case 'd':
            v75 = *(_QWORD *)(v67 + 1040);
            if (v75 >= 1)
            {
              *(_BYTE *)(v67 + 16 + v75) = 0;
              CFStringAppendCString(*(CFMutableStringRef *)(v67 + 1064), (const char *)(v67 + 16), 0x8000100u);
              *(_QWORD *)(v67 + 1040) = 0;
            }
            v76 = *(void **)(v67 + 1064);
            -[__CFString doubleValue](v73, "doubleValue");
            v78 = CFSTR("%0.16g");
            goto LABEL_187;
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
            goto LABEL_179;
          case 'f':
            v88 = *(_QWORD *)(v67 + 1040);
            if (v88 >= 1)
            {
              *(_BYTE *)(v67 + 16 + v88) = 0;
              CFStringAppendCString(*(CFMutableStringRef *)(v67 + 1064), (const char *)(v67 + 16), 0x8000100u);
              *(_QWORD *)(v67 + 1040) = 0;
            }
            v76 = *(void **)(v67 + 1064);
            -[__CFString floatValue](v73, "floatValue");
            v77 = v89;
            v78 = CFSTR("%0.7g");
LABEL_187:
            objc_msgSend(v76, "appendFormat:", v78, *(_QWORD *)&v77);
            goto LABEL_205;
          case 'i':
            v90 = *(_QWORD *)(v67 + 1040);
            if (v90 >= 1)
            {
              *(_BYTE *)(v67 + 16 + v90) = 0;
              CFStringAppendCString(*(CFMutableStringRef *)(v67 + 1064), (const char *)(v67 + 16), 0x8000100u);
              *(_QWORD *)(v67 + 1040) = 0;
            }
            v80 = *(void **)(v67 + 1064);
            v81 = -[__CFString intValue](v73, "intValue");
            goto LABEL_191;
          case 'l':
            v91 = *(_QWORD *)(v67 + 1040);
            if (v91 >= 1)
            {
              *(_BYTE *)(v67 + 16 + v91) = 0;
              CFStringAppendCString(*(CFMutableStringRef *)(v67 + 1064), (const char *)(v67 + 16), 0x8000100u);
              *(_QWORD *)(v67 + 1040) = 0;
            }
            v80 = *(void **)(v67 + 1064);
            v81 = -[__CFString longValue](v73, "longValue");
            v83 = CFSTR("%ld");
            goto LABEL_204;
          case 'q':
            v92 = *(_QWORD *)(v67 + 1040);
            if (v92 >= 1)
            {
              *(_BYTE *)(v67 + 16 + v92) = 0;
              CFStringAppendCString(*(CFMutableStringRef *)(v67 + 1064), (const char *)(v67 + 16), 0x8000100u);
              *(_QWORD *)(v67 + 1040) = 0;
            }
            v80 = *(void **)(v67 + 1064);
            v81 = -[__CFString longLongValue](v73, "longLongValue");
            v83 = CFSTR("%lld");
            goto LABEL_204;
          case 's':
            v93 = *(_QWORD *)(v67 + 1040);
            if (v93 >= 1)
            {
              *(_BYTE *)(v67 + 16 + v93) = 0;
              CFStringAppendCString(*(CFMutableStringRef *)(v67 + 1064), (const char *)(v67 + 16), 0x8000100u);
              *(_QWORD *)(v67 + 1040) = 0;
            }
            v80 = *(void **)(v67 + 1064);
            v81 = -[__CFString shortValue](v73, "shortValue");
            v83 = CFSTR("%hi");
            goto LABEL_204;
          default:
            if (v74 == 81)
            {
              v94 = *(_QWORD *)(v67 + 1040);
              if (v94 >= 1)
              {
                *(_BYTE *)(v67 + 16 + v94) = 0;
                CFStringAppendCString(*(CFMutableStringRef *)(v67 + 1064), (const char *)(v67 + 16), 0x8000100u);
                *(_QWORD *)(v67 + 1040) = 0;
              }
              v80 = *(void **)(v67 + 1064);
              v81 = -[__CFString unsignedLongLongValue](v73, "unsignedLongLongValue");
              v83 = CFSTR("%llu");
            }
            else
            {
              if (v74 != 83)
                goto LABEL_179;
              v85 = *(_QWORD *)(v67 + 1040);
              if (v85 >= 1)
              {
                *(_BYTE *)(v67 + 16 + v85) = 0;
                CFStringAppendCString(*(CFMutableStringRef *)(v67 + 1064), (const char *)(v67 + 16), 0x8000100u);
                *(_QWORD *)(v67 + 1040) = 0;
              }
              v80 = *(void **)(v67 + 1064);
              v81 = -[__CFString unsignedShortValue](v73, "unsignedShortValue");
              v83 = CFSTR("%hu");
            }
            break;
        }
        goto LABEL_204;
      }
      if (v74 > 72)
      {
        if (v74 == 73)
        {
          v86 = *(_QWORD *)(v67 + 1040);
          if (v86 >= 1)
          {
            *(_BYTE *)(v67 + 16 + v86) = 0;
            CFStringAppendCString(*(CFMutableStringRef *)(v67 + 1064), (const char *)(v67 + 16), 0x8000100u);
            *(_QWORD *)(v67 + 1040) = 0;
          }
          v80 = *(void **)(v67 + 1064);
          v81 = -[__CFString unsignedIntValue](v73, "unsignedIntValue");
          goto LABEL_178;
        }
        if (v74 == 76)
        {
          v82 = *(_QWORD *)(v67 + 1040);
          if (v82 >= 1)
          {
            *(_BYTE *)(v67 + 16 + v82) = 0;
            CFStringAppendCString(*(CFMutableStringRef *)(v67 + 1064), (const char *)(v67 + 16), 0x8000100u);
            *(_QWORD *)(v67 + 1040) = 0;
          }
          v80 = *(void **)(v67 + 1064);
          v81 = -[__CFString unsignedLongValue](v73, "unsignedLongValue");
          v83 = CFSTR("%lu");
          goto LABEL_204;
        }
      }
      else
      {
        if (v74 == 66)
        {
LABEL_165:
          v84 = *(_QWORD *)(v67 + 1040);
          if (v84 >= 1)
          {
            *(_BYTE *)(v67 + 16 + v84) = 0;
            CFStringAppendCString(*(CFMutableStringRef *)(v67 + 1064), (const char *)(v67 + 16), 0x8000100u);
            *(_QWORD *)(v67 + 1040) = 0;
          }
          v80 = *(void **)(v67 + 1064);
          v81 = -[__CFString charValue](v73, "charValue");
LABEL_191:
          v83 = CFSTR("%d");
          goto LABEL_204;
        }
        if (v74 == 67)
        {
          v79 = *(_QWORD *)(v67 + 1040);
          if (v79 >= 1)
          {
            *(_BYTE *)(v67 + 16 + v79) = 0;
            CFStringAppendCString(*(CFMutableStringRef *)(v67 + 1064), (const char *)(v67 + 16), 0x8000100u);
            *(_QWORD *)(v67 + 1040) = 0;
          }
          v80 = *(void **)(v67 + 1064);
          v81 = -[__CFString unsignedCharValue](v73, "unsignedCharValue");
LABEL_178:
          v83 = CFSTR("%u");
LABEL_204:
          objc_msgSend(v80, "appendFormat:", v83, v81);
LABEL_205:

          goto LABEL_206;
        }
      }
LABEL_179:
      v87 = *(_QWORD *)(v67 + 1040);
      if (v87 >= 1)
      {
        *(_BYTE *)(v67 + 16 + v87) = 0;
        CFStringAppendCString(*(CFMutableStringRef *)(v67 + 1064), (const char *)(v67 + 16), 0x8000100u);
        *(_QWORD *)(v67 + 1040) = 0;
      }
      objc_msgSend(*(id *)(v67 + 1064), "appendFormat:", CFSTR("<***unknown type:%s>"), -[__CFString objCType](objc_retainAutorelease(v73), "objCType"));
      goto LABEL_205;
    }
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      -[__CFString appendDescriptionToStream:](a3, "appendDescriptionToStream:", v67);
      goto LABEL_206;
    }
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      -[__CFString appendDescriptionToFormatter:](a3, "appendDescriptionToFormatter:", v67);
      goto LABEL_206;
    }
    if (_NSIsNSDictionary())
    {
      usedBufLen = MEMORY[0x1E0C809B0];
      v110 = 3221225472;
      v111 = (uint64_t (*)(uint64_t, __CFString *))__BSDescribeAppendObjectDescription_block_invoke;
      v112 = &unk_1E1EBFB08;
      v113 = v67;
      -[BSDescriptionStream _appendDictionary:withName:itemBlock:](v67, a3, 0, (uint64_t)&usedBufLen);
      goto LABEL_206;
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend((id)v67, "appendIntegerSet:withName:format:", a3, 0, 0);
      goto LABEL_206;
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      usedBufLen = MEMORY[0x1E0C809B0];
      v110 = 3221225472;
      v111 = __BSDescribeAppendObjectDescription_block_invoke_2;
      v112 = &unk_1E1EBFB30;
      v113 = v67;
      objc_msgSend((id)v67, "appendIntegerMap:withName:keyFormat:valueBlock:", a3, 0, 0, &usedBufLen);
      goto LABEL_206;
    }
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      usedBufLen = MEMORY[0x1E0C809B0];
      v110 = 3221225472;
      v111 = __BSDescribeAppendObjectDescription_block_invoke_3;
      v112 = &unk_1E1EBFB30;
      v113 = v67;
      objc_msgSend((id)v67, "appendCollection:withName:itemBlock:", a3, 0, &usedBufLen);
      goto LABEL_206;
    }
    if (*(_BYTE *)(v67 + 1056) || (v97 = *(_QWORD *)(v67 + 8), *(_QWORD *)(v97 + 8) == 2))
    {
      if ((objc_opt_respondsToSelector() & 1) != 0)
      {
        -[__CFString succinctDescription](a3, "succinctDescription");
        v98 = (__CFString *)objc_claimAutoreleasedReturnValue();
        goto LABEL_228;
      }
      v97 = *(_QWORD *)(v67 + 8);
    }
    if (*(_QWORD *)(v97 + 16) == 2)
      -[__CFString debugDescription](a3, "debugDescription");
    else
      -[__CFString description](a3, "description");
    v98 = (__CFString *)objc_claimAutoreleasedReturnValue();
LABEL_228:
    v101 = v98;
    v102 = -[__CFString length](v98, "length");
    v103 = *(_QWORD *)(v67 + 1040);
    if (v103 + 3 * v102 > 1023)
    {
      if (v103 >= 1)
      {
        *(_BYTE *)(v67 + 16 + v103) = 0;
        CFStringAppendCString(*(CFMutableStringRef *)(v67 + 1064), (const char *)(v67 + 16), 0x8000100u);
        *(_QWORD *)(v67 + 1040) = 0;
      }
      if (v102 > 341)
      {
        objc_msgSend(*(id *)(v67 + 1064), "appendString:", v101);
        goto LABEL_244;
      }
      usedBufLen = 0;
      v119.location = 0;
      v119.length = v102;
      CFStringGetBytes(v101, v119, 0x8000100u, 0, 0, (UInt8 *)(v67 + 16), 1024, &usedBufLen);
      v104 = usedBufLen;
    }
    else
    {
      usedBufLen = 0;
      v118.location = 0;
      v118.length = v102;
      CFStringGetBytes(v101, v118, 0x8000100u, 0, 0, (UInt8 *)(v67 + v103 + 16), 1024 - v103, &usedBufLen);
      v104 = *(_QWORD *)(v67 + 1040) + usedBufLen;
    }
    *(_QWORD *)(v67 + 1040) = v104;
LABEL_244:

    goto LABEL_206;
  }
  v71 = *(_QWORD *)(v67 + 1040);
  v72 = v67 + 16 + v71;
  if (v71 <= 1018)
  {
    *(_BYTE *)(v72 + 4) = 62;
    *(_DWORD *)v72 = 1818848828;
    v70 = *(_QWORD *)(v67 + 1040) + 5;
LABEL_146:
    *(_QWORD *)(v67 + 1040) = v70;
    goto LABEL_206;
  }
  *(_BYTE *)v72 = 0;
  CFStringAppendCString(*(CFMutableStringRef *)(v67 + 1064), (const char *)(v67 + 16), 0x8000100u);
  *(_QWORD *)(v67 + 1040) = 0;
  CFStringAppendCString(*(CFMutableStringRef *)(v67 + 1064), "<nil>", 0x8000100u);
LABEL_206:
  v95 = *(_QWORD *)(a1 + 32);
  *(_QWORD *)(v95 + 1104) = 1;
  return BSDescribeTruncationCommit(v95);
}

uint64_t __BSDescribeAppendObjectDescription_block_invoke_3(uint64_t a1, __CFString *a2)
{
  uint64_t v4;
  _QWORD *v5;
  _QWORD *v6;
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  const char *v10;
  uint64_t v11;
  CFMutableStringRef *v12;
  const char *v13;
  uint64_t v14;
  const char *v15;
  uint64_t v16;
  const char *v17;
  size_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v23;
  uint64_t v24;
  CFIndex v25;
  uint64_t v26;
  CFIndex v27;
  uint64_t v28;
  uint64_t v29;
  __CFString *v30;
  int v31;
  uint64_t v32;
  void *v33;
  double v34;
  const __CFString *v35;
  uint64_t v36;
  void *v37;
  uint64_t v38;
  uint64_t v39;
  const __CFString *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  float v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v54;
  __CFString *v55;
  __CFString *v56;
  CFIndex v57;
  uint64_t v58;
  CFIndex v59;
  CFIndex usedBufLen;
  uint64_t v61;
  uint64_t (*v62)(uint64_t, __CFString *);
  void *v63;
  uint64_t v64;
  CFRange v65;
  CFRange v66;
  CFRange v67;
  CFRange v68;

  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(id *)(v4 + 8);
  switch(*(_QWORD *)(v4 + 1104))
  {
    case 1:
      v6 = (_QWORD *)(v4 + 1040);
      v7 = *(_QWORD *)(v4 + 1040);
      v8 = (const char *)(v4 + 16);
      if (*(_QWORD *)(*(_QWORD *)(v4 + 8) + 24) == 3)
      {
        if (v7 > 1022)
        {
          v8[v7] = 0;
          CFStringAppendCString(*(CFMutableStringRef *)(v4 + 1064), v8, 0x8000100u);
          *(_QWORD *)(v4 + 1040) = 0;
          CFStringAppendCString(*(CFMutableStringRef *)(v4 + 1064), ";", 0x8000100u);
        }
        else
        {
          v8[v7] = 59;
          ++*v6;
        }
        goto LABEL_11;
      }
      if (v7 <= 1021)
      {
        *(_WORD *)&v8[v7] = 8251;
        v11 = 2;
        goto LABEL_19;
      }
      v8[v7] = 0;
      CFStringAppendCString(*(CFMutableStringRef *)(v4 + 1064), v8, 0x8000100u);
      v12 = (CFMutableStringRef *)(v4 + 1064);
      v13 = "; ";
      goto LABEL_24;
    case 2:
      v6 = (_QWORD *)(v4 + 1040);
      v9 = *(_QWORD *)(v4 + 1040);
      v10 = (const char *)(v4 + 16);
      if (v9 <= 1022)
      {
        v10[v9] = 32;
        v11 = 1;
        goto LABEL_19;
      }
      v10[v9] = 0;
      CFStringAppendCString(*(CFMutableStringRef *)(v4 + 1064), v10, 0x8000100u);
      v12 = (CFMutableStringRef *)(v4 + 1064);
      v13 = " ";
LABEL_24:
      *v6 = 0;
      CFStringAppendCString(*v12, v13, 0x8000100u);
      break;
    case 3:
LABEL_11:
      v14 = *(_QWORD *)(v4 + 1040);
      v15 = (const char *)(v4 + 16);
      if (v14 > 1022)
      {
        v15[v14] = 0;
        CFStringAppendCString(*(CFMutableStringRef *)(v4 + 1064), v15, 0x8000100u);
        *(_QWORD *)(v4 + 1040) = 0;
        CFStringAppendCString(*(CFMutableStringRef *)(v4 + 1064), "\n", 0x8000100u);
      }
      else
      {
        v15[v14] = 10;
        ++*(_QWORD *)(v4 + 1040);
      }
      goto LABEL_14;
    case 4:
LABEL_14:
      v16 = *(_QWORD *)(v4 + 1072);
      if (v16 < 1)
        break;
      if (v16 >= 8)
        v16 = 8;
      v17 = (const char *)*((_QWORD *)&sIndentSpaceStrings + v16);
      v18 = strlen(v17);
      v6 = (_QWORD *)(v4 + 1040);
      v19 = *(_QWORD *)(v4 + 1040);
      if ((uint64_t)(v19 + v18) > 1023)
      {
        if (v19 >= 1)
        {
          *(_BYTE *)(v4 + 16 + v19) = 0;
          CFStringAppendCString(*(CFMutableStringRef *)(v4 + 1064), (const char *)(v4 + 16), 0x8000100u);
          *v6 = 0;
        }
        CFStringAppendCString(*(CFMutableStringRef *)(v4 + 1064), v17, 0x8000100u);
      }
      else
      {
        v11 = v18;
        memcpy((void *)(v4 + v19 + 16), v17, v18);
LABEL_19:
        *v6 += v11;
      }
      break;
    default:
      goto LABEL_26;
  }
  *(_QWORD *)(v4 + 1104) = 0;
LABEL_26:
  v20 = v5[8];
  v21 = v5[9];
  if (v20 < 2 || v21 < 1)
  {
    v21 = 0;
    v23 = 1096;
  }
  else
  {
    *(_QWORD *)(v4 + 1096) = v20;
    *(_QWORD *)(v4 + 1080) = *(_QWORD *)(v4 + 1040) + objc_msgSend(*(id *)(v4 + 1064), "length");
    v23 = 1088;
  }
  *(_QWORD *)(v4 + v23) = v21;

  v24 = *(_QWORD *)(a1 + 32);
  if (a2)
  {
    if (_NSIsNSString())
    {
      v25 = -[__CFString length](a2, "length");
      v26 = *(_QWORD *)(v24 + 1040);
      if (3 * v25 + v26 > 1023)
      {
        if (v26 >= 1)
        {
          *(_BYTE *)(v24 + 16 + v26) = 0;
          CFStringAppendCString(*(CFMutableStringRef *)(v24 + 1064), (const char *)(v24 + 16), 0x8000100u);
          *(_QWORD *)(v24 + 1040) = 0;
        }
        if (v25 > 341)
        {
          objc_msgSend(*(id *)(v24 + 1064), "appendString:", a2);
          goto LABEL_109;
        }
        usedBufLen = 0;
        v66.location = 0;
        v66.length = v25;
        CFStringGetBytes(a2, v66, 0x8000100u, 0, 0, (UInt8 *)(v24 + 16), 1024, &usedBufLen);
        v27 = usedBufLen;
      }
      else
      {
        usedBufLen = 0;
        v65.location = 0;
        v65.length = v25;
        CFStringGetBytes(a2, v65, 0x8000100u, 0, 0, (UInt8 *)(v24 + v26 + 16), 1024 - v26, &usedBufLen);
        v27 = *(_QWORD *)(v24 + 1040) + usedBufLen;
      }
      goto LABEL_49;
    }
    if (_NSIsNSNumber())
    {
      v30 = objc_retainAutorelease(a2);
      v31 = *(char *)-[__CFString objCType](v30, "objCType");
      if (v31 > 80)
      {
        switch(v31)
        {
          case 'c':
            goto LABEL_68;
          case 'd':
            v32 = *(_QWORD *)(v24 + 1040);
            if (v32 >= 1)
            {
              *(_BYTE *)(v24 + 16 + v32) = 0;
              CFStringAppendCString(*(CFMutableStringRef *)(v24 + 1064), (const char *)(v24 + 16), 0x8000100u);
              *(_QWORD *)(v24 + 1040) = 0;
            }
            v33 = *(void **)(v24 + 1064);
            -[__CFString doubleValue](v30, "doubleValue");
            v35 = CFSTR("%0.16g");
            goto LABEL_90;
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
            goto LABEL_82;
          case 'f':
            v45 = *(_QWORD *)(v24 + 1040);
            if (v45 >= 1)
            {
              *(_BYTE *)(v24 + 16 + v45) = 0;
              CFStringAppendCString(*(CFMutableStringRef *)(v24 + 1064), (const char *)(v24 + 16), 0x8000100u);
              *(_QWORD *)(v24 + 1040) = 0;
            }
            v33 = *(void **)(v24 + 1064);
            -[__CFString floatValue](v30, "floatValue");
            v34 = v46;
            v35 = CFSTR("%0.7g");
LABEL_90:
            objc_msgSend(v33, "appendFormat:", v35, *(_QWORD *)&v34);
            goto LABEL_108;
          case 'i':
            v47 = *(_QWORD *)(v24 + 1040);
            if (v47 >= 1)
            {
              *(_BYTE *)(v24 + 16 + v47) = 0;
              CFStringAppendCString(*(CFMutableStringRef *)(v24 + 1064), (const char *)(v24 + 16), 0x8000100u);
              *(_QWORD *)(v24 + 1040) = 0;
            }
            v37 = *(void **)(v24 + 1064);
            v38 = -[__CFString intValue](v30, "intValue");
            goto LABEL_94;
          case 'l':
            v48 = *(_QWORD *)(v24 + 1040);
            if (v48 >= 1)
            {
              *(_BYTE *)(v24 + 16 + v48) = 0;
              CFStringAppendCString(*(CFMutableStringRef *)(v24 + 1064), (const char *)(v24 + 16), 0x8000100u);
              *(_QWORD *)(v24 + 1040) = 0;
            }
            v37 = *(void **)(v24 + 1064);
            v38 = -[__CFString longValue](v30, "longValue");
            v40 = CFSTR("%ld");
            goto LABEL_107;
          case 'q':
            v49 = *(_QWORD *)(v24 + 1040);
            if (v49 >= 1)
            {
              *(_BYTE *)(v24 + 16 + v49) = 0;
              CFStringAppendCString(*(CFMutableStringRef *)(v24 + 1064), (const char *)(v24 + 16), 0x8000100u);
              *(_QWORD *)(v24 + 1040) = 0;
            }
            v37 = *(void **)(v24 + 1064);
            v38 = -[__CFString longLongValue](v30, "longLongValue");
            v40 = CFSTR("%lld");
            goto LABEL_107;
          case 's':
            v50 = *(_QWORD *)(v24 + 1040);
            if (v50 >= 1)
            {
              *(_BYTE *)(v24 + 16 + v50) = 0;
              CFStringAppendCString(*(CFMutableStringRef *)(v24 + 1064), (const char *)(v24 + 16), 0x8000100u);
              *(_QWORD *)(v24 + 1040) = 0;
            }
            v37 = *(void **)(v24 + 1064);
            v38 = -[__CFString shortValue](v30, "shortValue");
            v40 = CFSTR("%hi");
            goto LABEL_107;
          default:
            if (v31 == 81)
            {
              v51 = *(_QWORD *)(v24 + 1040);
              if (v51 >= 1)
              {
                *(_BYTE *)(v24 + 16 + v51) = 0;
                CFStringAppendCString(*(CFMutableStringRef *)(v24 + 1064), (const char *)(v24 + 16), 0x8000100u);
                *(_QWORD *)(v24 + 1040) = 0;
              }
              v37 = *(void **)(v24 + 1064);
              v38 = -[__CFString unsignedLongLongValue](v30, "unsignedLongLongValue");
              v40 = CFSTR("%llu");
            }
            else
            {
              if (v31 != 83)
                goto LABEL_82;
              v42 = *(_QWORD *)(v24 + 1040);
              if (v42 >= 1)
              {
                *(_BYTE *)(v24 + 16 + v42) = 0;
                CFStringAppendCString(*(CFMutableStringRef *)(v24 + 1064), (const char *)(v24 + 16), 0x8000100u);
                *(_QWORD *)(v24 + 1040) = 0;
              }
              v37 = *(void **)(v24 + 1064);
              v38 = -[__CFString unsignedShortValue](v30, "unsignedShortValue");
              v40 = CFSTR("%hu");
            }
            break;
        }
        goto LABEL_107;
      }
      if (v31 > 72)
      {
        if (v31 == 73)
        {
          v43 = *(_QWORD *)(v24 + 1040);
          if (v43 >= 1)
          {
            *(_BYTE *)(v24 + 16 + v43) = 0;
            CFStringAppendCString(*(CFMutableStringRef *)(v24 + 1064), (const char *)(v24 + 16), 0x8000100u);
            *(_QWORD *)(v24 + 1040) = 0;
          }
          v37 = *(void **)(v24 + 1064);
          v38 = -[__CFString unsignedIntValue](v30, "unsignedIntValue");
          goto LABEL_81;
        }
        if (v31 == 76)
        {
          v39 = *(_QWORD *)(v24 + 1040);
          if (v39 >= 1)
          {
            *(_BYTE *)(v24 + 16 + v39) = 0;
            CFStringAppendCString(*(CFMutableStringRef *)(v24 + 1064), (const char *)(v24 + 16), 0x8000100u);
            *(_QWORD *)(v24 + 1040) = 0;
          }
          v37 = *(void **)(v24 + 1064);
          v38 = -[__CFString unsignedLongValue](v30, "unsignedLongValue");
          v40 = CFSTR("%lu");
          goto LABEL_107;
        }
      }
      else
      {
        if (v31 == 66)
        {
LABEL_68:
          v41 = *(_QWORD *)(v24 + 1040);
          if (v41 >= 1)
          {
            *(_BYTE *)(v24 + 16 + v41) = 0;
            CFStringAppendCString(*(CFMutableStringRef *)(v24 + 1064), (const char *)(v24 + 16), 0x8000100u);
            *(_QWORD *)(v24 + 1040) = 0;
          }
          v37 = *(void **)(v24 + 1064);
          v38 = -[__CFString charValue](v30, "charValue");
LABEL_94:
          v40 = CFSTR("%d");
          goto LABEL_107;
        }
        if (v31 == 67)
        {
          v36 = *(_QWORD *)(v24 + 1040);
          if (v36 >= 1)
          {
            *(_BYTE *)(v24 + 16 + v36) = 0;
            CFStringAppendCString(*(CFMutableStringRef *)(v24 + 1064), (const char *)(v24 + 16), 0x8000100u);
            *(_QWORD *)(v24 + 1040) = 0;
          }
          v37 = *(void **)(v24 + 1064);
          v38 = -[__CFString unsignedCharValue](v30, "unsignedCharValue");
LABEL_81:
          v40 = CFSTR("%u");
LABEL_107:
          objc_msgSend(v37, "appendFormat:", v40, v38);
LABEL_108:

          goto LABEL_109;
        }
      }
LABEL_82:
      v44 = *(_QWORD *)(v24 + 1040);
      if (v44 >= 1)
      {
        *(_BYTE *)(v24 + 16 + v44) = 0;
        CFStringAppendCString(*(CFMutableStringRef *)(v24 + 1064), (const char *)(v24 + 16), 0x8000100u);
        *(_QWORD *)(v24 + 1040) = 0;
      }
      objc_msgSend(*(id *)(v24 + 1064), "appendFormat:", CFSTR("<***unknown type:%s>"), -[__CFString objCType](objc_retainAutorelease(v30), "objCType"));
      goto LABEL_108;
    }
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      -[__CFString appendDescriptionToStream:](a2, "appendDescriptionToStream:", v24);
      goto LABEL_109;
    }
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      -[__CFString appendDescriptionToFormatter:](a2, "appendDescriptionToFormatter:", v24);
      goto LABEL_109;
    }
    if (_NSIsNSDictionary())
    {
      usedBufLen = MEMORY[0x1E0C809B0];
      v61 = 3221225472;
      v62 = (uint64_t (*)(uint64_t, __CFString *))__BSDescribeAppendObjectDescription_block_invoke;
      v63 = &unk_1E1EBFB08;
      v64 = v24;
      -[BSDescriptionStream _appendDictionary:withName:itemBlock:](v24, a2, 0, (uint64_t)&usedBufLen);
      goto LABEL_109;
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend((id)v24, "appendIntegerSet:withName:format:", a2, 0, 0);
      goto LABEL_109;
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      usedBufLen = MEMORY[0x1E0C809B0];
      v61 = 3221225472;
      v62 = __BSDescribeAppendObjectDescription_block_invoke_2;
      v63 = &unk_1E1EBFB30;
      v64 = v24;
      objc_msgSend((id)v24, "appendIntegerMap:withName:keyFormat:valueBlock:", a2, 0, 0, &usedBufLen);
      goto LABEL_109;
    }
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      usedBufLen = MEMORY[0x1E0C809B0];
      v61 = 3221225472;
      v62 = (uint64_t (*)(uint64_t, __CFString *))__BSDescribeAppendObjectDescription_block_invoke_3;
      v63 = &unk_1E1EBFB30;
      v64 = v24;
      objc_msgSend((id)v24, "appendCollection:withName:itemBlock:", a2, 0, &usedBufLen);
      goto LABEL_109;
    }
    if (*(_BYTE *)(v24 + 1056) || (v54 = *(_QWORD *)(v24 + 8), *(_QWORD *)(v54 + 8) == 2))
    {
      if ((objc_opt_respondsToSelector() & 1) != 0)
      {
        -[__CFString succinctDescription](a2, "succinctDescription");
        v55 = (__CFString *)objc_claimAutoreleasedReturnValue();
        goto LABEL_121;
      }
      v54 = *(_QWORD *)(v24 + 8);
    }
    if (*(_QWORD *)(v54 + 16) == 2)
      -[__CFString debugDescription](a2, "debugDescription");
    else
      -[__CFString description](a2, "description");
    v55 = (__CFString *)objc_claimAutoreleasedReturnValue();
LABEL_121:
    v56 = v55;
    v57 = -[__CFString length](v55, "length");
    v58 = *(_QWORD *)(v24 + 1040);
    if (v58 + 3 * v57 > 1023)
    {
      if (v58 >= 1)
      {
        *(_BYTE *)(v24 + 16 + v58) = 0;
        CFStringAppendCString(*(CFMutableStringRef *)(v24 + 1064), (const char *)(v24 + 16), 0x8000100u);
        *(_QWORD *)(v24 + 1040) = 0;
      }
      if (v57 > 341)
      {
        objc_msgSend(*(id *)(v24 + 1064), "appendString:", v56);
        goto LABEL_129;
      }
      usedBufLen = 0;
      v68.location = 0;
      v68.length = v57;
      CFStringGetBytes(v56, v68, 0x8000100u, 0, 0, (UInt8 *)(v24 + 16), 1024, &usedBufLen);
      v59 = usedBufLen;
    }
    else
    {
      usedBufLen = 0;
      v67.location = 0;
      v67.length = v57;
      CFStringGetBytes(v56, v67, 0x8000100u, 0, 0, (UInt8 *)(v24 + v58 + 16), 1024 - v58, &usedBufLen);
      v59 = *(_QWORD *)(v24 + 1040) + usedBufLen;
    }
    *(_QWORD *)(v24 + 1040) = v59;
LABEL_129:

    goto LABEL_109;
  }
  v28 = *(_QWORD *)(v24 + 1040);
  v29 = v24 + 16 + v28;
  if (v28 <= 1018)
  {
    *(_BYTE *)(v29 + 4) = 62;
    *(_DWORD *)v29 = 1818848828;
    v27 = *(_QWORD *)(v24 + 1040) + 5;
LABEL_49:
    *(_QWORD *)(v24 + 1040) = v27;
    goto LABEL_109;
  }
  *(_BYTE *)v29 = 0;
  CFStringAppendCString(*(CFMutableStringRef *)(v24 + 1064), (const char *)(v24 + 16), 0x8000100u);
  *(_QWORD *)(v24 + 1040) = 0;
  CFStringAppendCString(*(CFMutableStringRef *)(v24 + 1064), "<nil>", 0x8000100u);
LABEL_109:
  v52 = *(_QWORD *)(a1 + 32);
  *(_QWORD *)(v52 + 1104) = 1;
  return BSDescribeTruncationCommit(v52);
}

uint64_t __BSDescribeAppendObjectDescription_block_invoke_2(uint64_t a1, __CFString *a2)
{
  uint64_t v4;
  _QWORD *v5;
  _QWORD *v6;
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  const char *v10;
  uint64_t v11;
  CFMutableStringRef *v12;
  const char *v13;
  uint64_t v14;
  const char *v15;
  uint64_t v16;
  const char *v17;
  size_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v23;
  uint64_t v24;
  CFIndex v25;
  uint64_t v26;
  CFIndex v27;
  uint64_t v28;
  uint64_t v29;
  __CFString *v30;
  int v31;
  uint64_t v32;
  void *v33;
  double v34;
  const __CFString *v35;
  uint64_t v36;
  void *v37;
  uint64_t v38;
  uint64_t v39;
  const __CFString *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  float v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v54;
  __CFString *v55;
  __CFString *v56;
  CFIndex v57;
  uint64_t v58;
  CFIndex v59;
  CFIndex usedBufLen;
  uint64_t v61;
  uint64_t (*v62)();
  void *v63;
  uint64_t v64;
  CFRange v65;
  CFRange v66;
  CFRange v67;
  CFRange v68;

  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(id *)(v4 + 8);
  switch(*(_QWORD *)(v4 + 1104))
  {
    case 1:
      v6 = (_QWORD *)(v4 + 1040);
      v7 = *(_QWORD *)(v4 + 1040);
      v8 = (const char *)(v4 + 16);
      if (*(_QWORD *)(*(_QWORD *)(v4 + 8) + 24) == 3)
      {
        if (v7 > 1022)
        {
          v8[v7] = 0;
          CFStringAppendCString(*(CFMutableStringRef *)(v4 + 1064), v8, 0x8000100u);
          *(_QWORD *)(v4 + 1040) = 0;
          CFStringAppendCString(*(CFMutableStringRef *)(v4 + 1064), ";", 0x8000100u);
        }
        else
        {
          v8[v7] = 59;
          ++*v6;
        }
        goto LABEL_11;
      }
      if (v7 <= 1021)
      {
        *(_WORD *)&v8[v7] = 8251;
        v11 = 2;
        goto LABEL_19;
      }
      v8[v7] = 0;
      CFStringAppendCString(*(CFMutableStringRef *)(v4 + 1064), v8, 0x8000100u);
      v12 = (CFMutableStringRef *)(v4 + 1064);
      v13 = "; ";
      goto LABEL_24;
    case 2:
      v6 = (_QWORD *)(v4 + 1040);
      v9 = *(_QWORD *)(v4 + 1040);
      v10 = (const char *)(v4 + 16);
      if (v9 <= 1022)
      {
        v10[v9] = 32;
        v11 = 1;
        goto LABEL_19;
      }
      v10[v9] = 0;
      CFStringAppendCString(*(CFMutableStringRef *)(v4 + 1064), v10, 0x8000100u);
      v12 = (CFMutableStringRef *)(v4 + 1064);
      v13 = " ";
LABEL_24:
      *v6 = 0;
      CFStringAppendCString(*v12, v13, 0x8000100u);
      break;
    case 3:
LABEL_11:
      v14 = *(_QWORD *)(v4 + 1040);
      v15 = (const char *)(v4 + 16);
      if (v14 > 1022)
      {
        v15[v14] = 0;
        CFStringAppendCString(*(CFMutableStringRef *)(v4 + 1064), v15, 0x8000100u);
        *(_QWORD *)(v4 + 1040) = 0;
        CFStringAppendCString(*(CFMutableStringRef *)(v4 + 1064), "\n", 0x8000100u);
      }
      else
      {
        v15[v14] = 10;
        ++*(_QWORD *)(v4 + 1040);
      }
      goto LABEL_14;
    case 4:
LABEL_14:
      v16 = *(_QWORD *)(v4 + 1072);
      if (v16 < 1)
        break;
      if (v16 >= 8)
        v16 = 8;
      v17 = (const char *)*((_QWORD *)&sIndentSpaceStrings + v16);
      v18 = strlen(v17);
      v6 = (_QWORD *)(v4 + 1040);
      v19 = *(_QWORD *)(v4 + 1040);
      if ((uint64_t)(v19 + v18) > 1023)
      {
        if (v19 >= 1)
        {
          *(_BYTE *)(v4 + 16 + v19) = 0;
          CFStringAppendCString(*(CFMutableStringRef *)(v4 + 1064), (const char *)(v4 + 16), 0x8000100u);
          *v6 = 0;
        }
        CFStringAppendCString(*(CFMutableStringRef *)(v4 + 1064), v17, 0x8000100u);
      }
      else
      {
        v11 = v18;
        memcpy((void *)(v4 + v19 + 16), v17, v18);
LABEL_19:
        *v6 += v11;
      }
      break;
    default:
      goto LABEL_26;
  }
  *(_QWORD *)(v4 + 1104) = 0;
LABEL_26:
  v20 = v5[8];
  v21 = v5[9];
  if (v20 < 2 || v21 < 1)
  {
    v21 = 0;
    v23 = 1096;
  }
  else
  {
    *(_QWORD *)(v4 + 1096) = v20;
    *(_QWORD *)(v4 + 1080) = *(_QWORD *)(v4 + 1040) + objc_msgSend(*(id *)(v4 + 1064), "length");
    v23 = 1088;
  }
  *(_QWORD *)(v4 + v23) = v21;

  v24 = *(_QWORD *)(a1 + 32);
  if (a2)
  {
    if (_NSIsNSString())
    {
      v25 = -[__CFString length](a2, "length");
      v26 = *(_QWORD *)(v24 + 1040);
      if (3 * v25 + v26 > 1023)
      {
        if (v26 >= 1)
        {
          *(_BYTE *)(v24 + 16 + v26) = 0;
          CFStringAppendCString(*(CFMutableStringRef *)(v24 + 1064), (const char *)(v24 + 16), 0x8000100u);
          *(_QWORD *)(v24 + 1040) = 0;
        }
        if (v25 > 341)
        {
          objc_msgSend(*(id *)(v24 + 1064), "appendString:", a2);
          goto LABEL_109;
        }
        usedBufLen = 0;
        v66.location = 0;
        v66.length = v25;
        CFStringGetBytes(a2, v66, 0x8000100u, 0, 0, (UInt8 *)(v24 + 16), 1024, &usedBufLen);
        v27 = usedBufLen;
      }
      else
      {
        usedBufLen = 0;
        v65.location = 0;
        v65.length = v25;
        CFStringGetBytes(a2, v65, 0x8000100u, 0, 0, (UInt8 *)(v24 + v26 + 16), 1024 - v26, &usedBufLen);
        v27 = *(_QWORD *)(v24 + 1040) + usedBufLen;
      }
      goto LABEL_49;
    }
    if (_NSIsNSNumber())
    {
      v30 = objc_retainAutorelease(a2);
      v31 = *(char *)-[__CFString objCType](v30, "objCType");
      if (v31 > 80)
      {
        switch(v31)
        {
          case 'c':
            goto LABEL_68;
          case 'd':
            v32 = *(_QWORD *)(v24 + 1040);
            if (v32 >= 1)
            {
              *(_BYTE *)(v24 + 16 + v32) = 0;
              CFStringAppendCString(*(CFMutableStringRef *)(v24 + 1064), (const char *)(v24 + 16), 0x8000100u);
              *(_QWORD *)(v24 + 1040) = 0;
            }
            v33 = *(void **)(v24 + 1064);
            -[__CFString doubleValue](v30, "doubleValue");
            v35 = CFSTR("%0.16g");
            goto LABEL_90;
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
            goto LABEL_82;
          case 'f':
            v45 = *(_QWORD *)(v24 + 1040);
            if (v45 >= 1)
            {
              *(_BYTE *)(v24 + 16 + v45) = 0;
              CFStringAppendCString(*(CFMutableStringRef *)(v24 + 1064), (const char *)(v24 + 16), 0x8000100u);
              *(_QWORD *)(v24 + 1040) = 0;
            }
            v33 = *(void **)(v24 + 1064);
            -[__CFString floatValue](v30, "floatValue");
            v34 = v46;
            v35 = CFSTR("%0.7g");
LABEL_90:
            objc_msgSend(v33, "appendFormat:", v35, *(_QWORD *)&v34);
            goto LABEL_108;
          case 'i':
            v47 = *(_QWORD *)(v24 + 1040);
            if (v47 >= 1)
            {
              *(_BYTE *)(v24 + 16 + v47) = 0;
              CFStringAppendCString(*(CFMutableStringRef *)(v24 + 1064), (const char *)(v24 + 16), 0x8000100u);
              *(_QWORD *)(v24 + 1040) = 0;
            }
            v37 = *(void **)(v24 + 1064);
            v38 = -[__CFString intValue](v30, "intValue");
            goto LABEL_94;
          case 'l':
            v48 = *(_QWORD *)(v24 + 1040);
            if (v48 >= 1)
            {
              *(_BYTE *)(v24 + 16 + v48) = 0;
              CFStringAppendCString(*(CFMutableStringRef *)(v24 + 1064), (const char *)(v24 + 16), 0x8000100u);
              *(_QWORD *)(v24 + 1040) = 0;
            }
            v37 = *(void **)(v24 + 1064);
            v38 = -[__CFString longValue](v30, "longValue");
            v40 = CFSTR("%ld");
            goto LABEL_107;
          case 'q':
            v49 = *(_QWORD *)(v24 + 1040);
            if (v49 >= 1)
            {
              *(_BYTE *)(v24 + 16 + v49) = 0;
              CFStringAppendCString(*(CFMutableStringRef *)(v24 + 1064), (const char *)(v24 + 16), 0x8000100u);
              *(_QWORD *)(v24 + 1040) = 0;
            }
            v37 = *(void **)(v24 + 1064);
            v38 = -[__CFString longLongValue](v30, "longLongValue");
            v40 = CFSTR("%lld");
            goto LABEL_107;
          case 's':
            v50 = *(_QWORD *)(v24 + 1040);
            if (v50 >= 1)
            {
              *(_BYTE *)(v24 + 16 + v50) = 0;
              CFStringAppendCString(*(CFMutableStringRef *)(v24 + 1064), (const char *)(v24 + 16), 0x8000100u);
              *(_QWORD *)(v24 + 1040) = 0;
            }
            v37 = *(void **)(v24 + 1064);
            v38 = -[__CFString shortValue](v30, "shortValue");
            v40 = CFSTR("%hi");
            goto LABEL_107;
          default:
            if (v31 == 81)
            {
              v51 = *(_QWORD *)(v24 + 1040);
              if (v51 >= 1)
              {
                *(_BYTE *)(v24 + 16 + v51) = 0;
                CFStringAppendCString(*(CFMutableStringRef *)(v24 + 1064), (const char *)(v24 + 16), 0x8000100u);
                *(_QWORD *)(v24 + 1040) = 0;
              }
              v37 = *(void **)(v24 + 1064);
              v38 = -[__CFString unsignedLongLongValue](v30, "unsignedLongLongValue");
              v40 = CFSTR("%llu");
            }
            else
            {
              if (v31 != 83)
                goto LABEL_82;
              v42 = *(_QWORD *)(v24 + 1040);
              if (v42 >= 1)
              {
                *(_BYTE *)(v24 + 16 + v42) = 0;
                CFStringAppendCString(*(CFMutableStringRef *)(v24 + 1064), (const char *)(v24 + 16), 0x8000100u);
                *(_QWORD *)(v24 + 1040) = 0;
              }
              v37 = *(void **)(v24 + 1064);
              v38 = -[__CFString unsignedShortValue](v30, "unsignedShortValue");
              v40 = CFSTR("%hu");
            }
            break;
        }
        goto LABEL_107;
      }
      if (v31 > 72)
      {
        if (v31 == 73)
        {
          v43 = *(_QWORD *)(v24 + 1040);
          if (v43 >= 1)
          {
            *(_BYTE *)(v24 + 16 + v43) = 0;
            CFStringAppendCString(*(CFMutableStringRef *)(v24 + 1064), (const char *)(v24 + 16), 0x8000100u);
            *(_QWORD *)(v24 + 1040) = 0;
          }
          v37 = *(void **)(v24 + 1064);
          v38 = -[__CFString unsignedIntValue](v30, "unsignedIntValue");
          goto LABEL_81;
        }
        if (v31 == 76)
        {
          v39 = *(_QWORD *)(v24 + 1040);
          if (v39 >= 1)
          {
            *(_BYTE *)(v24 + 16 + v39) = 0;
            CFStringAppendCString(*(CFMutableStringRef *)(v24 + 1064), (const char *)(v24 + 16), 0x8000100u);
            *(_QWORD *)(v24 + 1040) = 0;
          }
          v37 = *(void **)(v24 + 1064);
          v38 = -[__CFString unsignedLongValue](v30, "unsignedLongValue");
          v40 = CFSTR("%lu");
          goto LABEL_107;
        }
      }
      else
      {
        if (v31 == 66)
        {
LABEL_68:
          v41 = *(_QWORD *)(v24 + 1040);
          if (v41 >= 1)
          {
            *(_BYTE *)(v24 + 16 + v41) = 0;
            CFStringAppendCString(*(CFMutableStringRef *)(v24 + 1064), (const char *)(v24 + 16), 0x8000100u);
            *(_QWORD *)(v24 + 1040) = 0;
          }
          v37 = *(void **)(v24 + 1064);
          v38 = -[__CFString charValue](v30, "charValue");
LABEL_94:
          v40 = CFSTR("%d");
          goto LABEL_107;
        }
        if (v31 == 67)
        {
          v36 = *(_QWORD *)(v24 + 1040);
          if (v36 >= 1)
          {
            *(_BYTE *)(v24 + 16 + v36) = 0;
            CFStringAppendCString(*(CFMutableStringRef *)(v24 + 1064), (const char *)(v24 + 16), 0x8000100u);
            *(_QWORD *)(v24 + 1040) = 0;
          }
          v37 = *(void **)(v24 + 1064);
          v38 = -[__CFString unsignedCharValue](v30, "unsignedCharValue");
LABEL_81:
          v40 = CFSTR("%u");
LABEL_107:
          objc_msgSend(v37, "appendFormat:", v40, v38);
LABEL_108:

          goto LABEL_109;
        }
      }
LABEL_82:
      v44 = *(_QWORD *)(v24 + 1040);
      if (v44 >= 1)
      {
        *(_BYTE *)(v24 + 16 + v44) = 0;
        CFStringAppendCString(*(CFMutableStringRef *)(v24 + 1064), (const char *)(v24 + 16), 0x8000100u);
        *(_QWORD *)(v24 + 1040) = 0;
      }
      objc_msgSend(*(id *)(v24 + 1064), "appendFormat:", CFSTR("<***unknown type:%s>"), -[__CFString objCType](objc_retainAutorelease(v30), "objCType"));
      goto LABEL_108;
    }
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      -[__CFString appendDescriptionToStream:](a2, "appendDescriptionToStream:", v24);
      goto LABEL_109;
    }
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      -[__CFString appendDescriptionToFormatter:](a2, "appendDescriptionToFormatter:", v24);
      goto LABEL_109;
    }
    if (_NSIsNSDictionary())
    {
      usedBufLen = MEMORY[0x1E0C809B0];
      v61 = 3221225472;
      v62 = __BSDescribeAppendObjectDescription_block_invoke;
      v63 = &unk_1E1EBFB08;
      v64 = v24;
      -[BSDescriptionStream _appendDictionary:withName:itemBlock:](v24, a2, 0, (uint64_t)&usedBufLen);
      goto LABEL_109;
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend((id)v24, "appendIntegerSet:withName:format:", a2, 0, 0);
      goto LABEL_109;
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      usedBufLen = MEMORY[0x1E0C809B0];
      v61 = 3221225472;
      v62 = __BSDescribeAppendObjectDescription_block_invoke_2;
      v63 = &unk_1E1EBFB30;
      v64 = v24;
      objc_msgSend((id)v24, "appendIntegerMap:withName:keyFormat:valueBlock:", a2, 0, 0, &usedBufLen);
      goto LABEL_109;
    }
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      usedBufLen = MEMORY[0x1E0C809B0];
      v61 = 3221225472;
      v62 = __BSDescribeAppendObjectDescription_block_invoke_3;
      v63 = &unk_1E1EBFB30;
      v64 = v24;
      objc_msgSend((id)v24, "appendCollection:withName:itemBlock:", a2, 0, &usedBufLen);
      goto LABEL_109;
    }
    if (*(_BYTE *)(v24 + 1056) || (v54 = *(_QWORD *)(v24 + 8), *(_QWORD *)(v54 + 8) == 2))
    {
      if ((objc_opt_respondsToSelector() & 1) != 0)
      {
        -[__CFString succinctDescription](a2, "succinctDescription");
        v55 = (__CFString *)objc_claimAutoreleasedReturnValue();
        goto LABEL_121;
      }
      v54 = *(_QWORD *)(v24 + 8);
    }
    if (*(_QWORD *)(v54 + 16) == 2)
      -[__CFString debugDescription](a2, "debugDescription");
    else
      -[__CFString description](a2, "description");
    v55 = (__CFString *)objc_claimAutoreleasedReturnValue();
LABEL_121:
    v56 = v55;
    v57 = -[__CFString length](v55, "length");
    v58 = *(_QWORD *)(v24 + 1040);
    if (v58 + 3 * v57 > 1023)
    {
      if (v58 >= 1)
      {
        *(_BYTE *)(v24 + 16 + v58) = 0;
        CFStringAppendCString(*(CFMutableStringRef *)(v24 + 1064), (const char *)(v24 + 16), 0x8000100u);
        *(_QWORD *)(v24 + 1040) = 0;
      }
      if (v57 > 341)
      {
        objc_msgSend(*(id *)(v24 + 1064), "appendString:", v56);
        goto LABEL_129;
      }
      usedBufLen = 0;
      v68.location = 0;
      v68.length = v57;
      CFStringGetBytes(v56, v68, 0x8000100u, 0, 0, (UInt8 *)(v24 + 16), 1024, &usedBufLen);
      v59 = usedBufLen;
    }
    else
    {
      usedBufLen = 0;
      v67.location = 0;
      v67.length = v57;
      CFStringGetBytes(v56, v67, 0x8000100u, 0, 0, (UInt8 *)(v24 + v58 + 16), 1024 - v58, &usedBufLen);
      v59 = *(_QWORD *)(v24 + 1040) + usedBufLen;
    }
    *(_QWORD *)(v24 + 1040) = v59;
LABEL_129:

    goto LABEL_109;
  }
  v28 = *(_QWORD *)(v24 + 1040);
  v29 = v24 + 16 + v28;
  if (v28 <= 1018)
  {
    *(_BYTE *)(v29 + 4) = 62;
    *(_DWORD *)v29 = 1818848828;
    v27 = *(_QWORD *)(v24 + 1040) + 5;
LABEL_49:
    *(_QWORD *)(v24 + 1040) = v27;
    goto LABEL_109;
  }
  *(_BYTE *)v29 = 0;
  CFStringAppendCString(*(CFMutableStringRef *)(v24 + 1064), (const char *)(v24 + 16), 0x8000100u);
  *(_QWORD *)(v24 + 1040) = 0;
  CFStringAppendCString(*(CFMutableStringRef *)(v24 + 1064), "<nil>", 0x8000100u);
LABEL_109:
  v52 = *(_QWORD *)(a1 + 32);
  *(_QWORD *)(v52 + 1104) = 1;
  return BSDescribeTruncationCommit(v52);
}

@end
