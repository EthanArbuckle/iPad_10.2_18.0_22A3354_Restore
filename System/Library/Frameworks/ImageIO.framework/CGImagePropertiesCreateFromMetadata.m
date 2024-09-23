@implementation CGImagePropertiesCreateFromMetadata

void __CGImagePropertiesCreateFromMetadata_block_invoke(uint64_t a1, uint64_t a2)
{
  const __CFDictionary *TopLevelTag;
  uint64_t Source;
  __CFString *v6;
  int v7;
  const __CFString *v8;
  IIODictionary *v9;
  IIONumber *v10;
  int v11;
  int v12;
  const char *v13;
  const char *v14;
  CFTypeID v15;
  IIOArray *v16;
  unsigned int Count;
  CFIndex v18;
  uint64_t v19;
  const __CFArray *ObjectAtIndex;
  const __CFString *v21;
  CFTypeID v22;
  unsigned __int8 v23;
  const __CFString *v24;
  uint64_t *v25;
  const __CFDictionary *ObjectForKey;
  const __CFDictionary *v27;
  const void *v28;
  const __CFString *v29;
  int IntFromXMPFlashStruct;
  IIODictionary *v31;
  CFStringRef GPSTimeStringWithXMPDateTimeString;
  IIODictionary *v33;
  const void *DefaultString;
  const void *v35;
  const __CFString *EXIFDataTimeStringWithXMPDateTimeString;
  CFTypeID v37;
  IIOArray *v38;
  unsigned int v39;
  CFIndex v40;
  uint64_t v41;
  const __CFArray *v42;
  const __CFString *v43;
  float v44;
  CFTypeID v45;
  IIOArray *v46;
  unsigned int v47;
  CFIndex v48;
  uint64_t v49;
  const __CFArray *v50;
  const void *v51;
  CFTypeID v52;
  const __CFArray *v53;
  const __CFArray *v54;
  IIOArray *v55;
  uint64_t v56;
  CFIndex v57;
  const __CFString *v58;
  CFTypeID v59;
  const __CFAllocator *v60;
  CFIndex v61;
  CFMutableArrayRef Mutable;
  __CFArray *v63;
  CFIndex v64;
  const void *ValueAtIndex;
  const void *v66;
  CFStringRef v67;
  CFStringRef v68;
  IIODictionary *v69;
  __CFString *v70;
  char v71;
  IIODictionary *v72;
  CFTypeID v73;
  IIOArray *v74;
  unsigned int v75;
  CFIndex v76;
  uint64_t v77;
  const __CFArray *v78;
  const __CFString *v79;
  IIODictionary *v80;
  CFTypeID v81;
  const void **v82;
  CFTypeID v83;
  IIOString *v84;
  const char *v85;
  char *v86;
  char *i;
  CFTypeID v88;
  IIOString *v89;
  const char *v90;
  char *v91;
  char *j;
  IIONumber *v93;
  double v94;
  CFTypeID v95;
  const __CFArray *ArrayBySeparatingStrings;
  IIOArray *v97;
  unsigned int v98;
  CFIndex v99;
  uint64_t v100;
  const __CFArray *v101;
  CFTypeID v102;
  const char *CStringPtr;
  const char *v104;
  CGImageMetadataTag *v105;
  CGImageMetadataTag *v106;
  CFTypeRef v107;
  const void *v108;
  CFTypeID TypeID;
  IIODictionary *v110;
  const __CFString **v111;
  CGImageMetadataTag *v112;
  CFTypeRef v113;
  CFTypeID v114;
  char v115;
  IIODictionary *v116;
  char v117;
  IIODictionary *v118;
  char v119;
  IIODictionary *v120;
  _BYTE v121[24];
  _BYTE v122[24];
  _BYTE v123[24];
  _BYTE v124[24];
  _BYTE v125[16];
  void *v126;
  _BYTE v127[24];
  _BYTE v128[24];
  _BYTE v129[24];
  _BYTE v130[24];
  _BYTE v131[24];
  _BYTE v132[24];
  _BYTE v133[24];
  char v134[24];
  char v135[8];
  const void *v136;
  uint64_t v137;
  CFMutableArrayRef v138;
  const void *v139;
  const void *v140;
  _BYTE v141[24];
  _BYTE v142[24];
  _BYTE v143[24];
  double v144;
  uint64_t v145;
  uint64_t v146;

  v145 = 0;
  v146 = 0;
  v144 = 0.0;
  TopLevelTag = CGImageMetadataGetTopLevelTag(*(const __CFDictionary **)(a1 + 40), **(_QWORD **)(a2 + 24), **(_QWORD **)(a2 + 32));
  if (!TopLevelTag)
  {
    v11 = *(unsigned __int16 *)(a2 + 16);
    if (v11 == 16)
    {
      TopLevelTag = CGImageMetadataGetTopLevelTag(*(const __CFDictionary **)(a1 + 40), **(_QWORD **)(a2 + 24), (uint64_t)CFSTR("GPSTime"));
      if (TopLevelTag)
        goto LABEL_2;
      v11 = *(unsigned __int16 *)(a2 + 16);
    }
    if (v11 != 15)
      return;
    TopLevelTag = CGImageMetadataGetTopLevelTag(*(const __CFDictionary **)(a1 + 40), **(_QWORD **)(a2 + 24), (uint64_t)CFSTR("GPSDate"));
    if (!TopLevelTag)
      return;
  }
LABEL_2:
  Source = CGImageSourceGetSource((uint64_t)TopLevelTag);
  if (Source)
  {
    v6 = *(__CFString **)(Source + 48);
    if (!v6)
    {
      CFStringGetCStringPtr(**(CFStringRef **)(a2 + 24), 0);
      CFStringGetCStringPtr(**(CFStringRef **)(a2 + 32), 0);
      LogMetadata("CGImagePropertiesCreateFromMetadata_block_invoke", 1589, "Tag with namespace = %s, name = %s, has a NULL value\n");
      return;
    }
    v7 = *(unsigned __int16 *)(a2 + 16);
    v8 = **(const __CFString ***)(a2 + 8);
    switch(*(_WORD *)(a2 + 16))
    {
      case 0:
        if (GetIntegerFromPropertyValue(*(const __CFString **)(Source + 48), (SInt32 *)&v146 + 1))
        {
          v9 = *(IIODictionary **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
          IIONumber::IIONumber((IIONumber *)v143, SHIDWORD(v146));
          IIODictionary::setObjectForKeyGroup(v9, (uint64_t)v143, v8, **(const __CFString ***)a2);
          v10 = (IIONumber *)v143;
          goto LABEL_115;
        }
        return;
      case 1:
        if (GetDoubleFromPropertyValue(*(const __CFString **)(Source + 48), &v144))
        {
          v33 = *(IIODictionary **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
          IIONumber::IIONumber((IIONumber *)v141, v144);
          IIODictionary::setObjectForKeyGroup(v33, (uint64_t)v141, v8, **(const __CFString ***)a2);
          v10 = (IIONumber *)v141;
          goto LABEL_115;
        }
        return;
      case 2:
        DefaultString = CGImageMetadataGetDefaultString(*(const void **)(Source + 48));
        if (DefaultString)
        {
          v35 = DefaultString;
          IIODictionary::setObjectForKeyGroup(*(IIODictionary **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24), DefaultString, v8, **(const __CFString ***)a2);
          if (CFStringCompare(**(CFStringRef **)(a2 + 24), CFSTR("http://purl.org/dc/elements/1.1/"), 0) == kCFCompareEqualTo
            && CFStringCompare(**(CFStringRef **)(a2 + 32), CFSTR("rights"), 0) == kCFCompareEqualTo)
          {
            IIODictionary::setObjectForKeyGroup(*(IIODictionary **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24), v35, CFSTR("Copyright"), CFSTR("{TIFF}"));
          }
        }
        return;
      case 3:
        EXIFDataTimeStringWithXMPDateTimeString = CreateEXIFDataTimeStringWithXMPDateTimeString(*(const __CFString **)(Source + 48));
        if (EXIFDataTimeStringWithXMPDateTimeString)
          goto LABEL_104;
        return;
      case 4:
        v138 = 0;
        v139 = 0;
        v140 = 0;
        IIOArray::IIOArray((IIOArray *)&v138);
        v15 = CFGetTypeID(v6);
        if (v15 == CFArrayGetTypeID())
        {
          *(_QWORD *)v135 = 0;
          v136 = 0;
          v137 = 0;
          v16 = IIOArray::IIOArray((IIOArray *)v135, (const __CFArray *)v6);
          Count = IIOArray::getCount(v16);
          if (Count)
          {
            v18 = 0;
            v19 = Count;
            do
            {
              ObjectAtIndex = IIOArray::getObjectAtIndex((IIOArray *)v135, v18);
              v21 = (const __CFString *)CGImageMetadataGetDefaultString(ObjectAtIndex);
              if (v21)
              {
                HIDWORD(v146) = CFStringGetIntValue(v21);
                IIONumber::IIONumber((IIONumber *)v134, SHIDWORD(v146));
                IIOArray::addObject(&v138, (uint64_t)v134);
                IIONumber::~IIONumber((IIONumber *)v134);
              }
              ++v18;
            }
            while (v19 != v18);
          }
          IIOArray::~IIOArray((IIOArray *)v135);
        }
        else
        {
          v83 = CFGetTypeID(v6);
          if (v83 == CFStringGetTypeID())
          {
            *(_QWORD *)v135 = 0;
            v136 = 0;
            v137 = 0;
            v84 = IIOString::IIOString((IIOString *)v135, v6);
            v85 = (const char *)IIOString::utf8String(v84);
            v86 = strdup(v85);
            for (i = strtok(v86, ";"); i; i = strtok(0, ";"))
            {
              sscanf(i, "%d", (char *)&v146 + 4);
              IIONumber::IIONumber((IIONumber *)v133, SHIDWORD(v146));
              IIOArray::addObject(&v138, (uint64_t)v133);
              IIONumber::~IIONumber((IIONumber *)v133);
            }
            free(v86);
            IIOString::~IIOString((IIOString *)v135);
          }
        }
        IIODictionary::setObjectForKeyGroup(*(IIODictionary **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24), v139, v8, **(const __CFString ***)a2);
        goto LABEL_147;
      case 5:
        v138 = 0;
        v139 = 0;
        v140 = 0;
        IIOArray::IIOArray((IIOArray *)&v138);
        v37 = CFGetTypeID(v6);
        if (v37 == CFArrayGetTypeID())
        {
          *(_QWORD *)v135 = 0;
          v136 = 0;
          v137 = 0;
          v38 = IIOArray::IIOArray((IIOArray *)v135, (const __CFArray *)v6);
          v39 = IIOArray::getCount(v38);
          if (v39)
          {
            v40 = 0;
            v41 = v39;
            do
            {
              v42 = IIOArray::getObjectAtIndex((IIOArray *)v135, v40);
              v43 = (const __CFString *)CGImageMetadataGetDefaultString(v42);
              if (v43 && GetDoubleFromPropertyValue(v43, &v144))
              {
                v44 = v144;
                IIONumber::IIONumber((IIONumber *)v132, v44);
                IIOArray::addObject(&v138, (uint64_t)v132);
                IIONumber::~IIONumber((IIONumber *)v132);
              }
              ++v40;
            }
            while (v41 != v40);
            IIODictionary::setObjectForKeyGroup(*(IIODictionary **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24), v139, v8, **(const __CFString ***)a2);
          }
          IIOArray::~IIOArray((IIOArray *)v135);
        }
        else
        {
          v88 = CFGetTypeID(v6);
          if (v88 == CFStringGetTypeID())
          {
            *(_QWORD *)v135 = 0;
            v136 = 0;
            v137 = 0;
            v89 = IIOString::IIOString((IIOString *)v135, v6);
            v90 = (const char *)IIOString::utf8String(v89);
            v91 = strdup(v90);
            for (j = strtok(v91, ";"); j; j = strtok(0, ";"))
            {
              if (sscanf(j, "%d/%d", (char *)&v146 + 4, &v146) == 1)
              {
                IIONumber::IIONumber((IIONumber *)v131, SHIDWORD(v146));
                v93 = (IIONumber *)v131;
                IIOArray::addObject(&v138, (uint64_t)v131);
              }
              else
              {
                if ((_DWORD)v146)
                  v94 = (double)SHIDWORD(v146) / (double)(int)v146;
                else
                  v94 = 0.0;
                v144 = v94;
                IIONumber::IIONumber((IIONumber *)v130, v94);
                v93 = (IIONumber *)v130;
                IIOArray::addObject(&v138, (uint64_t)v130);
              }
              IIONumber::~IIONumber(v93);
            }
            free(v91);
            IIODictionary::setObjectForKeyGroup(*(IIODictionary **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24), v139, v8, **(const __CFString ***)a2);
            IIOString::~IIOString((IIOString *)v135);
          }
        }
        goto LABEL_147;
      case 6:
        if (!GetMajorVersionFromPropertyValue(*(const __CFString **)(Source + 48), (SInt32 *)&v146 + 1))
          return;
        v138 = 0;
        v139 = 0;
        v140 = 0;
        IIOArray::IIOArray((IIOArray *)&v138);
        IIONumber::IIONumber((IIONumber *)v129, SHIDWORD(v146));
        IIOArray::addObject(&v138, (uint64_t)v129);
        IIONumber::~IIONumber((IIONumber *)v129);
        IIODictionary::setObjectForKeyGroup(*(IIODictionary **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24), v139, v8, **(const __CFString ***)a2);
        if (GetMinorVersionFromPropertyValue(v6, (SInt32 *)&v146 + 1))
        {
          IIONumber::IIONumber((IIONumber *)v128, SHIDWORD(v146));
          IIOArray::addObject(&v138, (uint64_t)v128);
          IIONumber::~IIONumber((IIONumber *)v128);
          if (GetRevisionVersionFromPropertyValue(v6, (SInt32 *)&v146 + 1))
          {
            if (HIDWORD(v146))
            {
              IIONumber::IIONumber((IIONumber *)v127, SHIDWORD(v146));
              IIOArray::addObject(&v138, (uint64_t)v127);
              IIONumber::~IIONumber((IIONumber *)v127);
            }
          }
        }
        goto LABEL_147;
      case 7:
        v138 = 0;
        v139 = 0;
        v140 = 0;
        IIOArray::IIOArray((IIOArray *)&v138);
        v45 = CFGetTypeID(v6);
        if (v45 == CFArrayGetTypeID())
        {
          *(_QWORD *)v135 = 0;
          v136 = 0;
          v137 = 0;
          v46 = IIOArray::IIOArray((IIOArray *)v135, (const __CFArray *)v6);
          v47 = IIOArray::getCount(v46);
          if (v47)
          {
            v48 = 0;
            v49 = v47;
            do
            {
              v50 = IIOArray::getObjectAtIndex((IIOArray *)v135, v48);
              v51 = CGImageMetadataGetDefaultString(v50);
              IIOArray::addObject(&v138, v51);
              ++v48;
            }
            while (v49 != v48);
          }
LABEL_140:
          IIOArray::~IIOArray((IIOArray *)v135);
          goto LABEL_145;
        }
        v95 = CFGetTypeID(v6);
        if (v95 == CFStringGetTypeID())
        {
          ArrayBySeparatingStrings = CFStringCreateArrayBySeparatingStrings((CFAllocatorRef)*MEMORY[0x1E0C9AE00], v6, CFSTR("; "));
          if (!ArrayBySeparatingStrings)
            goto LABEL_145;
          *(_QWORD *)v135 = 0;
          v136 = 0;
          v137 = 0;
          v97 = IIOArray::IIOArray((IIOArray *)v135, ArrayBySeparatingStrings);
          v98 = IIOArray::getCount(v97);
          if (v98)
          {
            v99 = 0;
            v100 = v98;
            do
            {
              v101 = IIOArray::getObjectAtIndex((IIOArray *)v135, v99);
              IIOArray::addObject(&v138, v101);
              ++v99;
            }
            while (v100 != v99);
          }
          CFRelease(ArrayBySeparatingStrings);
          goto LABEL_140;
        }
        CStringPtr = CFStringGetCStringPtr(**(CFStringRef **)(a2 + 24), 0);
        v104 = CFStringGetCStringPtr(**(CFStringRef **)(a2 + 32), 0);
        LogMetadata("CGImagePropertiesCreateFromMetadata_block_invoke", 1791, " Unexpected CFType found for schema = %s, property = %s\n", CStringPtr, v104);
LABEL_145:
        if (IIOArray::getCount((IIOArray *)&v138))
          IIODictionary::setObjectForKeyGroup(*(IIODictionary **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24), v139, v8, **(const __CFString ***)a2);
LABEL_147:
        IIOArray::~IIOArray((IIOArray *)&v138);
        return;
      case 8:
        EXIFDataTimeStringWithXMPDateTimeString = CreateIPTCDateStringWithXMPDateTimeString(*(const __CFString **)(Source + 48));
        if (!EXIFDataTimeStringWithXMPDateTimeString)
          return;
        goto LABEL_104;
      case 9:
        EXIFDataTimeStringWithXMPDateTimeString = CreateIPTCTimeStringWithXMPDateTimeString(*(const __CFString **)(Source + 48));
        if (!EXIFDataTimeStringWithXMPDateTimeString)
          return;
        goto LABEL_104;
      case 0xA:
        v52 = CFGetTypeID(*(CFTypeRef *)(Source + 48));
        if (v52 != CFStringGetTypeID())
          return;
        v53 = CFStringCreateArrayBySeparatingStrings((CFAllocatorRef)*MEMORY[0x1E0C9AE00], v6, CFSTR(" "));
        if (!v53)
          return;
        v54 = v53;
        v138 = 0;
        v139 = 0;
        v140 = 0;
        v55 = IIOArray::IIOArray((IIOArray *)&v138, v53);
        LODWORD(v56) = IIOArray::getCount(v55);
        if ((_DWORD)v56)
        {
          *(_QWORD *)v135 = 0;
          v136 = 0;
          v137 = 0;
          IIOArray::IIOArray((IIOArray *)v135);
          v57 = 0;
          if (v56 >= 4)
            v56 = 4;
          else
            v56 = v56;
          do
          {
            v58 = (const __CFString *)IIOArray::getObjectAtIndex((IIOArray *)&v138, v57);
            if (GetDoubleFromPropertyValue(v58, &v144))
            {
              IIONumber::IIONumber((IIONumber *)v125, v144);
              IIOArray::addObject((CFMutableArrayRef *)v135, v126);
              IIONumber::~IIONumber((IIONumber *)v125);
            }
            ++v57;
          }
          while (v56 != v57);
          IIODictionary::setObjectForKeyGroup(*(IIODictionary **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24), v136, v8, **(const __CFString ***)a2);
          IIOArray::~IIOArray((IIOArray *)v135);
        }
        CFRelease(v54);
        goto LABEL_147;
      case 0xB:
        v22 = CFGetTypeID(*(CFTypeRef *)(Source + 48));
        if (v22 == CFDictionaryGetTypeID())
        {
          v138 = 0;
          v139 = 0;
          v140 = 0;
          IIODictionary::IIODictionary((IIODictionary *)&v138);
          *(_QWORD *)v135 = 0;
          v136 = 0;
          v137 = 0;
          IIODictionary::IIODictionary((IIODictionary *)v135, (const __CFDictionary *)v6);
          v23 = atomic_load((unsigned __int8 *)&_ZGVZZ35CGImagePropertiesCreateFromMetadataEUb_E4keys);
          if ((v23 & 1) == 0 && __cxa_guard_acquire(&_ZGVZZ35CGImagePropertiesCreateFromMetadataEUb_E4keys))
          {
            _ZZZ35CGImagePropertiesCreateFromMetadataEUb_E4keys = (uint64_t)CFSTR("CiAdrCity");
            unk_1EDF035E0 = CFSTR("CiAdrCity");
            qword_1EDF035E8 = (uint64_t)CFSTR("CiAdrCtry");
            unk_1EDF035F0 = CFSTR("CiAdrCtry");
            qword_1EDF035F8 = (uint64_t)CFSTR("CiAdrExtadr");
            unk_1EDF03600 = CFSTR("CiAdrExtadr");
            qword_1EDF03608 = (uint64_t)CFSTR("CiAdrPcode");
            unk_1EDF03610 = CFSTR("CiAdrPcode");
            qword_1EDF03618 = (uint64_t)CFSTR("CiAdrRegion");
            unk_1EDF03620 = CFSTR("CiAdrRegion");
            qword_1EDF03628 = (uint64_t)CFSTR("CiEmailWork");
            unk_1EDF03630 = CFSTR("CiEmailWork");
            qword_1EDF03638 = (uint64_t)CFSTR("CiTelWork");
            unk_1EDF03640 = CFSTR("CiTelWork");
            qword_1EDF03648 = (uint64_t)CFSTR("CiUrlWork");
            unk_1EDF03650 = CFSTR("CiUrlWork");
            qword_1EDF03658 = 0;
            unk_1EDF03660 = 0;
            __cxa_guard_release(&_ZGVZZ35CGImagePropertiesCreateFromMetadataEUb_E4keys);
          }
          v24 = (const __CFString *)_ZZZ35CGImagePropertiesCreateFromMetadataEUb_E4keys;
          if (_ZZZ35CGImagePropertiesCreateFromMetadataEUb_E4keys)
          {
            v25 = &qword_1EDF035E8;
            do
            {
              ObjectForKey = IIODictionary::getObjectForKey((IIODictionary *)v135, v24);
              v27 = ObjectForKey;
              if (ObjectForKey && CGImageMetadataGetDefaultString(ObjectForKey))
              {
                v28 = CGImageMetadataGetDefaultString(v27);
                IIODictionary::setObjectForKey((IIODictionary *)&v138, v28, (const __CFString *)*(v25 - 1));
              }
              v29 = (const __CFString *)*v25;
              v25 += 2;
              v24 = v29;
            }
            while (v29);
          }
          IIODictionary::setObjectForKeyGroup(*(IIODictionary **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24), v139, v8, **(const __CFString ***)a2);
          IIODictionary::~IIODictionary((IIODictionary *)v135);
          IIODictionary::~IIODictionary((IIODictionary *)&v138);
        }
        return;
      case 0xC:
        EXIFDataTimeStringWithXMPDateTimeString = (const __CFString *)CreateRegionFromPropertyValue(*(const void **)(Source + 48));
        if (!EXIFDataTimeStringWithXMPDateTimeString)
          return;
        goto LABEL_104;
      case 0xD:
        v59 = CFGetTypeID(*(CFTypeRef *)(Source + 48));
        if (v59 == CFArrayGetTypeID())
        {
          v60 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
          v61 = CFArrayGetCount((CFArrayRef)v6);
          Mutable = CFArrayCreateMutable(v60, v61, MEMORY[0x1E0C9B378]);
          if (Mutable)
          {
            v63 = Mutable;
            if (CFArrayGetCount((CFArrayRef)v6) >= 1)
            {
              v64 = 0;
              do
              {
                ValueAtIndex = CFArrayGetValueAtIndex((CFArrayRef)v6, v64);
                v66 = CGImageMetadataGetDefaultString(ValueAtIndex);
                if (v66)
                  CFArrayAppendValue(v63, v66);
                ++v64;
              }
              while (v64 < CFArrayGetCount((CFArrayRef)v6));
            }
            v67 = CFStringCreateByCombiningStrings(v60, v63, CFSTR("; "));
            if (v67)
            {
              v68 = v67;
              IIODictionary::setObjectForKeyGroup(*(IIODictionary **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24), v67, v8, **(const __CFString ***)a2);
              CFRelease(v68);
            }
            CFRelease(v63);
          }
        }
        else
        {
          CFStringGetCStringPtr(**(CFStringRef **)a2, 0);
          CFStringGetCStringPtr(v8, 0);
          LogMetadata("CGImagePropertiesCreateFromMetadata_block_invoke", 1940, "{%s}:%s has type kLegacyTypeSemicolonString, expected a CFArray as its XMP value, but got %d\n");
        }
        return;
      case 0xE:
        IntFromXMPFlashStruct = CreateIntFromXMPFlashStruct(*(const void **)(Source + 48));
        v31 = *(IIODictionary **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
        IIONumber::IIONumber((IIONumber *)v124, IntFromXMPFlashStruct);
        IIODictionary::setObjectForKeyGroup(v31, (uint64_t)v124, v8, **(const __CFString ***)a2);
        v10 = (IIONumber *)v124;
        goto LABEL_115;
      case 0xF:
        EXIFDataTimeStringWithXMPDateTimeString = CreateGPSDateStringWithXMPDateTimeString(*(const __CFString **)(Source + 48));
        if (!EXIFDataTimeStringWithXMPDateTimeString)
          return;
        goto LABEL_104;
      case 0x10:
        GPSTimeStringWithXMPDateTimeString = CreateGPSTimeStringWithXMPDateTimeString(*(const __CFString **)(Source + 48));
        if (!GPSTimeStringWithXMPDateTimeString)
        {
          GPSTimeStringWithXMPDateTimeString = CGImageMetadataCopyStringValueWithPath(*(CGImageMetadataRef *)(a1 + 40), 0, CFSTR("exif:GPSTime"));
          if (!GPSTimeStringWithXMPDateTimeString)
            return;
        }
        goto LABEL_105;
      case 0x11:
        *(_WORD *)v135 = 0;
        if (!GetLegacyGPSFromXMPGPSCoordinate(v6, &v144, v135))
          return;
        v69 = *(IIODictionary **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
        IIONumber::IIONumber((IIONumber *)v123, v144);
        IIODictionary::setObjectForKeyGroup(v69, (uint64_t)v123, v8, **(const __CFString ***)a2);
        IIONumber::~IIONumber((IIONumber *)v123);
        v135[1] = 0;
        v70 = **(__CFString ***)(a2 + 8);
        if (v70 == CFSTR("Latitude"))
        {
          if (!v135[0])
          {
            v105 = CGImageMetadataCopyTagWithPath(*(CGImageMetadataRef *)(a1 + 40), 0, CFSTR("exif:GPSLatitudeRef"));
            if (v105)
            {
              v106 = v105;
              v107 = CGImageMetadataTagCopyValue(v105);
              if (v107)
              {
                v108 = v107;
                TypeID = CFStringGetTypeID();
                if (TypeID == CFGetTypeID(v108))
                {
                  v110 = *(IIODictionary **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
                  v111 = (const __CFString **)&kCGImagePropertyGPSLatitudeRef;
LABEL_159:
                  IIODictionary::setObjectForKeyGroup(v110, v108, *v111, CFSTR("{GPS}"));
                  CFRelease(v108);
                  CFRelease(v106);
                  return;
                }
                CFRelease(v108);
              }
              CFRelease(v106);
            }
            if (v144 < 0.0)
              v117 = 83;
            else
              v117 = 78;
            v135[0] = v117;
          }
          v118 = *(IIODictionary **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
          IIOString::IIOString((IIOString *)&v138, v135);
          IIODictionary::setObjectForKeyGroup(v118, v140, CFSTR("LatitudeRef"), CFSTR("{GPS}"));
        }
        else
        {
          if (v70 != CFSTR("Longitude"))
          {
            if (v70 == CFSTR("DestLatitude"))
            {
              if (!v135[0])
              {
                if (v144 < 0.0)
                  v115 = 83;
                else
                  v115 = 78;
                v135[0] = v115;
              }
              v116 = *(IIODictionary **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
              IIOString::IIOString((IIOString *)&v138, v135);
              IIODictionary::setObjectForKeyGroup(v116, v140, CFSTR("DestLatitudeRef"), CFSTR("{GPS}"));
            }
            else
            {
              if (v70 != CFSTR("DestLongitude"))
                return;
              if (!v135[0])
              {
                if (v144 < 0.0)
                  v71 = 87;
                else
                  v71 = 69;
                v135[0] = v71;
              }
              v72 = *(IIODictionary **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
              IIOString::IIOString((IIOString *)&v138, v135);
              IIODictionary::setObjectForKeyGroup(v72, v140, CFSTR("DestLongitudeRef"), CFSTR("{GPS}"));
            }
            goto LABEL_180;
          }
          if (!v135[0])
          {
            v112 = CGImageMetadataCopyTagWithPath(*(CGImageMetadataRef *)(a1 + 40), 0, CFSTR("exif:GPSLongitudeRef"));
            if (v112)
            {
              v106 = v112;
              v113 = CGImageMetadataTagCopyValue(v112);
              if (v113)
              {
                v108 = v113;
                v114 = CFStringGetTypeID();
                if (v114 == CFGetTypeID(v108))
                {
                  v110 = *(IIODictionary **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
                  v111 = (const __CFString **)&kCGImagePropertyGPSLongitudeRef;
                  goto LABEL_159;
                }
                CFRelease(v108);
              }
              CFRelease(v106);
            }
            if (v144 < 0.0)
              v119 = 87;
            else
              v119 = 69;
            v135[0] = v119;
          }
          v120 = *(IIODictionary **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
          IIOString::IIOString((IIOString *)&v138, v135);
          IIODictionary::setObjectForKeyGroup(v120, v140, CFSTR("LongitudeRef"), CFSTR("{GPS}"));
        }
LABEL_180:
        IIOString::~IIOString((IIOString *)&v138);
        return;
      case 0x12:
        EXIFDataTimeStringWithXMPDateTimeString = (const __CFString *)CreateGPSVersionArrayFromString(*(const __CFString **)(Source + 48));
        if (EXIFDataTimeStringWithXMPDateTimeString)
        {
LABEL_104:
          GPSTimeStringWithXMPDateTimeString = EXIFDataTimeStringWithXMPDateTimeString;
LABEL_105:
          IIODictionary::setObjectForKeyGroup(*(IIODictionary **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24), GPSTimeStringWithXMPDateTimeString, v8, **(const __CFString ***)a2);
          CFRelease(GPSTimeStringWithXMPDateTimeString);
        }
        return;
      case 0x13:
        IIODictionary::removeObjectForKeyGroup(*(IIODictionary **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24), CFSTR("ISOSpeedRatings"), CFSTR("{Exif}"));
        v138 = 0;
        v139 = 0;
        v140 = 0;
        IIOArray::IIOArray((IIOArray *)&v138);
        v73 = CFGetTypeID(v6);
        if (v73 == CFArrayGetTypeID())
        {
          *(_QWORD *)v135 = 0;
          v136 = 0;
          v137 = 0;
          v74 = IIOArray::IIOArray((IIOArray *)v135, (const __CFArray *)v6);
          v75 = IIOArray::getCount(v74);
          if (v75)
          {
            v76 = 0;
            v77 = v75;
            do
            {
              v78 = IIOArray::getObjectAtIndex((IIOArray *)v135, v76);
              v79 = (const __CFString *)CGImageMetadataGetDefaultString(v78);
              if (v79)
              {
                HIDWORD(v146) = CFStringGetIntValue(v79);
                IIONumber::IIONumber((IIONumber *)v122, SHIDWORD(v146));
                IIOArray::addObject(&v138, (uint64_t)v122);
                IIONumber::~IIONumber((IIONumber *)v122);
              }
              ++v76;
            }
            while (v77 != v76);
          }
          IIOArray::~IIOArray((IIOArray *)v135);
        }
        else
        {
          v102 = CFGetTypeID(v6);
          if (v102 == CFStringGetTypeID())
          {
            HIDWORD(v146) = CFStringGetIntValue(v6);
            IIONumber::IIONumber((IIONumber *)v121, SHIDWORD(v146));
            IIOArray::addObject(&v138, (uint64_t)v121);
            IIONumber::~IIONumber((IIONumber *)v121);
          }
        }
        IIODictionary::setObjectForKeyGroup(*(IIODictionary **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24), v139, v8, **(const __CFString ***)a2);
        goto LABEL_147;
      case 0x14:
        if (GetLongLongFromPropertyValue(*(const __CFString **)(Source + 48), &v145))
        {
          v80 = *(IIODictionary **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
          IIONumber::IIONumber((IIONumber *)v142, v145);
          IIODictionary::setObjectForKeyGroup(v80, (uint64_t)v142, v8, **(const __CFString ***)a2);
          v10 = (IIONumber *)v142;
LABEL_115:
          IIONumber::~IIONumber(v10);
        }
        return;
      case 0x15:
        v81 = CFGetTypeID(*(CFTypeRef *)(Source + 48));
        if (v81 == CFArrayGetTypeID())
        {
          v82 = (const void **)operator new();
          IIOArray::IIOArray((IIOArray *)v82);
          addPropertiesFromMetadata(0, (CFMutableArrayRef *)v82, v6, 0);
          IIODictionary::setObjectForKeyGroup(*(IIODictionary **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24), v82[1], v8, **(const __CFString ***)a2);
          (*((void (**)(const void **))*v82 + 1))(v82);
        }
        return;
      default:
        if (v7 != 98)
        {
          v12 = *(unsigned __int16 *)(a2 + 18);
          v13 = CFStringGetCStringPtr(**(CFStringRef **)a2, 0);
          v14 = CFStringGetCStringPtr(**(CFStringRef **)(a2 + 8), 0);
          _cg_jpeg_mem_term("CGImagePropertiesCreateFromMetadata_block_invoke", 2156, "Unhandled conversion from tag type (%d) to property type (%d) for {%s}:%s\n", v12, v7, v13, v14);
        }
        return;
    }
  }
}

@end
