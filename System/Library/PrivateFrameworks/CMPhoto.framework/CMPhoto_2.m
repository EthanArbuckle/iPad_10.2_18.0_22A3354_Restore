uint64_t _cmphotoDNGWriterIFDBegin(uint64_t a1, int a2)
{
  unsigned int *v4;
  unsigned int Length;
  void *v6;

  _cmphotoDNGWriterReleaseTagStorage((char **)a1);
  CFDataAppendBytes(*(CFMutableDataRef *)(a1 + 40), zero, 2);
  v4 = (unsigned int *)&CFDataGetMutableBytePtr(*(CFMutableDataRef *)(a1 + 40))[a2];
  Length = CFDataGetLength(*(CFDataRef *)(a1 + 40));
  CMPhotoDNGWrite32(v4, Length, *(unsigned __int8 *)(a1 + 48));
  *(_QWORD *)(a1 + 8) = 20;
  v6 = malloc_type_calloc(0x14uLL, 0x28uLL, 0x106004007C5E651uLL);
  *(_QWORD *)a1 = v6;
  if (v6)
    return 0;
  else
    return 4294950745;
}

void _addRawImageTags(char **a1, uint64_t a2, _DWORD *a3, _DWORD *a4)
{
  int v8;
  int v9;
  int v10;
  int v11;
  __int16 *p_src;
  __int16 *v13;
  char **v14;
  __int16 v15;
  unsigned int v16;
  __int16 *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  size_t Length;
  __int16 *BytePtr;
  int v24;
  unsigned int v25;
  int v26;
  unsigned int v27;
  unsigned int v28;
  int v29;
  unsigned int v30;
  unsigned int v31;
  const __CFData *v32;
  uint64_t v33;
  const UInt8 *v34;
  unsigned int *v35;
  __CFData *v36;
  int v37;
  int v38;
  size_t v39;
  __int16 *v40;
  const __CFData *v41;
  size_t v42;
  __int16 *v43;
  uint64_t v44;
  uint64_t v45;
  __CFData *Mutable;
  const UInt8 *v47;
  unsigned int *v48;
  unsigned int v49;
  size_t v50;
  __int16 *v51;
  size_t v52;
  int __src;
  __int16 v54;
  CFMutableDataRef theData;
  uint64_t v56;
  uint64_t v57;
  int v58;
  _OWORD __dst[4];
  uint64_t v60;

  v60 = *MEMORY[0x1E0C80C00];
  theData = 0;
  v56 = 0;
  v57 = 0;
  LODWORD(__dst[0]) = 0;
  _ifdAddTag4(a1, 254, 4u, 1uLL, (__int16 *)__dst);
  LODWORD(__dst[0]) = *(_DWORD *)(a2 + 100);
  _ifdAddTag4(a1, 256, 4u, 1uLL, (__int16 *)__dst);
  LODWORD(__dst[0]) = *(_DWORD *)(a2 + 104);
  _ifdAddTag4(a1, 257, 4u, 1uLL, (__int16 *)__dst);
  if (*(_BYTE *)(a2 + 4))
  {
    LOWORD(__dst[0]) = *(_WORD *)(a2 + 156);
    WORD1(__dst[0]) = __dst[0];
    WORD2(__dst[0]) = __dst[0];
    _ifdAddTag4(a1, 258, 3u, 3uLL, (__int16 *)__dst);
    v8 = *(_DWORD *)(a2 + 8) - 1;
    if (v8 > 4)
      v9 = 0;
    else
      v9 = dword_1A829626C[v8];
    __src = v9;
    _ifdAddTag4(a1, 259, 3u, 1uLL, (__int16 *)&__src);
    __src = 34892;
    _ifdAddTag4(a1, 262, 3u, 1uLL, (__int16 *)&__src);
    __src = 3;
    p_src = (__int16 *)&__src;
  }
  else
  {
    LODWORD(__dst[0]) = 16;
    _ifdAddTag4(a1, 258, 3u, 1uLL, (__int16 *)__dst);
    v10 = *(_DWORD *)(a2 + 8) - 1;
    if (v10 > 4)
      v11 = 0;
    else
      v11 = dword_1A829626C[v10];
    LODWORD(__dst[0]) = v11;
    _ifdAddTag4(a1, 259, 3u, 1uLL, (__int16 *)__dst);
    LODWORD(__dst[0]) = 32803;
    _ifdAddTag4(a1, 262, 3u, 1uLL, (__int16 *)__dst);
    LODWORD(__dst[0]) = 1;
    p_src = (__int16 *)__dst;
  }
  _ifdAddTag4(a1, 277, 3u, 1uLL, p_src);
  LODWORD(__dst[0]) = 1;
  _ifdAddTag4(a1, 284, 3u, 1uLL, (__int16 *)__dst);
  LODWORD(__dst[0]) = *(_DWORD *)(a2 + 1628);
  _ifdAddTag4(a1, 322, 4u, 1uLL, (__int16 *)__dst);
  LODWORD(__dst[0]) = *(_DWORD *)(a2 + 1632);
  _ifdAddTag4(a1, 323, 4u, 1uLL, (__int16 *)__dst);
  *a3 = _ifdAddTag4(a1, 324, 4u, *(unsigned int *)(a2 + 1636), 0);
  *a4 = _ifdAddTag4(a1, 325, 4u, *(unsigned int *)(a2 + 1636), 0);
  if (*(_BYTE *)(a2 + 4))
  {
    LOWORD(__dst[0]) = *(_WORD *)(a2 + 152);
    WORD1(__dst[0]) = __dst[0];
    WORD2(__dst[0]) = __dst[0];
    LOWORD(__src) = *(_WORD *)(a2 + 148);
    HIWORD(__src) = __src;
    v54 = __src;
    _ifdAddTag4(a1, 50714, 3u, 3uLL, (__int16 *)__dst);
    _ifdAddTag4(a1, 50717, 3u, 3uLL, (__int16 *)&__src);
    if (*(_DWORD *)(a2 + 144) != 1)
      goto LABEL_15;
    v58 = 1;
    v13 = (__int16 *)&v58;
    v14 = a1;
    v15 = -14426;
    v16 = 4;
  }
  else
  {
    _ifdAddTag4(a1, 50713, 3u, 2uLL, _addRawImageTags_blackLevelRepeatDim);
    LODWORD(__dst[0]) = *(_DWORD *)(a2 + 152);
    _ifdAddTag4(a1, 50714, 3u, 1uLL, (__int16 *)__dst);
    LODWORD(__dst[0]) = *(_DWORD *)(a2 + 148);
    v13 = (__int16 *)__dst;
    v14 = a1;
    v15 = -14819;
    v16 = 3;
  }
  _ifdAddTag4(v14, v15, v16, 1uLL, v13);
LABEL_15:
  if (!*(_BYTE *)(a2 + 4))
  {
    _ifdAddTag4(a1, 33421, 3u, 2uLL, _addRawImageTags_CFARepeatPatternDim);
    _ifdAddTag4(a1, 33422, 1u, 4uLL, (__int16 *)(a2 + 1624));
    _ifdAddTag4(a1, 50710, 1u, 3uLL, _addRawImageTags_CFAPlaneColor);
    if (*(_BYTE *)(a2 + 180))
      _ifdAddTag4(a1, 50829, 4u, 4uLL, (__int16 *)(a2 + 164));
    if (*(_BYTE *)(a2 + 192))
      _ifdAddTag4(a1, 50719, 4u, 2uLL, (__int16 *)(a2 + 184));
    if (*(_BYTE *)(a2 + 204))
      _ifdAddTag4(a1, 50720, 4u, 2uLL, (__int16 *)(a2 + 196));
  }
  v17 = *(__int16 **)(a2 + 2048);
  if (v17)
    _ifdAddTag4(a1, 50712, 3u, *(unsigned int *)(a2 + 2056), v17);
  if (*(_DWORD *)(a2 + 8) == 2)
  {
    if (_cmphotoDNGOPCodeWriterOpen(&theData))
      goto LABEL_118;
    if (*(int *)(a2 + 1876) >= 1)
    {
      v18 = 0;
      v19 = 1672;
      while (!_cmphotoDNGOPCodeWriterStartOPCode((uint64_t)&theData, 8u, 0))
      {
        if (_cmphotoDNGOPCodeWriterWrite32((uint64_t)&theData, 0))
          break;
        if (_cmphotoDNGOPCodeWriterWrite32((uint64_t)&theData, 0))
          break;
        if (_cmphotoDNGOPCodeWriterWrite32((uint64_t)&theData, *(_DWORD *)(a2 + 104)))
          break;
        if (_cmphotoDNGOPCodeWriterWrite32((uint64_t)&theData, *(_DWORD *)(a2 + 100)))
          break;
        if (_cmphotoDNGOPCodeWriterWrite32((uint64_t)&theData, v18))
          break;
        if (_cmphotoDNGOPCodeWriterWrite32((uint64_t)&theData, 1u))
          break;
        if (_cmphotoDNGOPCodeWriterWrite32((uint64_t)&theData, 1u))
          break;
        if (_cmphotoDNGOPCodeWriterWrite32((uint64_t)&theData, 1u))
          break;
        v20 = a2 + 4 * v18;
        if (_cmphotoDNGOPCodeWriterWrite32((uint64_t)&theData, *(_DWORD *)(v20 + 1864) - 1))
          break;
        memset(__dst, 0, sizeof(__dst));
        v21 = *(unsigned int *)(v20 + 1864);
        if ((int)v21 >= 1)
          memcpy(__dst, (const void *)(a2 + v19), 8 * v21);
        if (_cmphotoDNGOPCodeWriterWriteDoubles((uint64_t)&theData, (double *)__dst, v21)
          || _cmphotoDNGOPCodeWriterEndOPCode((uint64_t)&theData))
        {
          break;
        }
        ++v18;
        v19 += 64;
        if (v18 >= *(int *)(a2 + 1876))
          goto LABEL_43;
      }
      goto LABEL_118;
    }
LABEL_43:
    *(_QWORD *)&__dst[0] = 0;
    _cmphotoDNGOPCodeWriterCloseAndCopyData((uint64_t)&theData, (CFMutableDataRef *)__dst);
    if (*(_QWORD *)&__dst[0])
    {
      Length = CFDataGetLength(*(CFDataRef *)&__dst[0]);
      BytePtr = (__int16 *)CFDataGetBytePtr(*(CFDataRef *)&__dst[0]);
      _ifdAddTag4(a1, 51009, 7u, Length, BytePtr);
      if (*(_QWORD *)&__dst[0])
        CFRelease(*(CFTypeRef *)&__dst[0]);
    }
  }
  v24 = *(_DWORD *)(a2 + 928);
  if (v24 == 20)
    v25 = 3;
  else
    v25 = v24 == 8;
  v26 = *(_DWORD *)(a2 + 1416);
  v27 = v24 == 8 || v24 == 20;
  if (v26 == 59)
    v28 = 3;
  else
    v28 = v26 == 21;
  v29 = *(_DWORD *)(a2 + 1536);
  if (v29 == 14)
    v30 = 3;
  else
    v30 = v29 == 6;
  if ((v27 & 1) != 0
    || v26 == 59
    || v26 == 21
    || v29 == 14
    || v29 == 6
    || *(_DWORD *)(a2 + 1600)
    || *(_QWORD *)(a2 + 2040))
  {
    if (_cmphotoDNGOPCodeWriterOpen(&theData)
      || (v26 == 59 || v26 == 21)
      && _cmphotoDNGOPCodeWriterWriteStandardOPCode((uint64_t)&theData, 0xEu, v28, (double *)(a2 + 936), *(_DWORD *)(a2 + 1416), v27, *(_DWORD *)(a2 + 1420)))
    {
      goto LABEL_118;
    }
    if ((v24 == 20 || v24 == 8)
      && _cmphotoDNGOPCodeWriterWriteStandardOPCode((uint64_t)&theData, 1u, v25, (double *)(a2 + 768), *(_DWORD *)(a2 + 928), 0, 0))
    {
      goto LABEL_118;
    }
    if ((v29 | 8) == 0xE
      && _cmphotoDNGOPCodeWriterWriteStandardOPCode((uint64_t)&theData, 2u, v30, (double *)(a2 + 1424), *(_DWORD *)(a2 + 1536), 0, 0))
    {
      goto LABEL_118;
    }
    v31 = *(_DWORD *)(a2 + 1600);
    if (v31)
    {
      if (_cmphotoDNGOPCodeWriterWriteStandardOPCode((uint64_t)&theData, 3u, 0, (double *)(a2 + 1544), v31, 0, 0))goto LABEL_118;
    }
    v32 = *(const __CFData **)(a2 + 2040);
    if (v32)
    {
      v33 = (*(_DWORD *)(a2 + 1996) * *(_DWORD *)(a2 + 1992) * *(_DWORD *)(a2 + 2032));
      if (CFDataGetLength(v32) != 4 * (_DWORD)v33
        || _cmphotoDNGOPCodeWriterOpen(&theData)
        || _cmphotoDNGOPCodeWriterStartOPCode((uint64_t)&theData, 9u, 0)
        || _cmphotoDNGOPCodeWriterWrite32((uint64_t)&theData, *(_DWORD *)(a2 + 1960))
        || _cmphotoDNGOPCodeWriterWrite32((uint64_t)&theData, *(_DWORD *)(a2 + 1964))
        || _cmphotoDNGOPCodeWriterWrite32((uint64_t)&theData, *(_DWORD *)(a2 + 1968))
        || _cmphotoDNGOPCodeWriterWrite32((uint64_t)&theData, *(_DWORD *)(a2 + 1972))
        || _cmphotoDNGOPCodeWriterWrite32((uint64_t)&theData, *(_DWORD *)(a2 + 1976))
        || _cmphotoDNGOPCodeWriterWrite32((uint64_t)&theData, *(_DWORD *)(a2 + 1980))
        || _cmphotoDNGOPCodeWriterWrite32((uint64_t)&theData, *(_DWORD *)(a2 + 1984))
        || _cmphotoDNGOPCodeWriterWrite32((uint64_t)&theData, *(_DWORD *)(a2 + 1988))
        || _cmphotoDNGOPCodeWriterWrite32((uint64_t)&theData, *(_DWORD *)(a2 + 1992))
        || _cmphotoDNGOPCodeWriterWrite32((uint64_t)&theData, *(_DWORD *)(a2 + 1996))
        || _cmphotoDNGOPCodeWriterWriteDoubles((uint64_t)&theData, (double *)(a2 + 2000), 1u)
        || _cmphotoDNGOPCodeWriterWriteDoubles((uint64_t)&theData, (double *)(a2 + 2008), 1u)
        || _cmphotoDNGOPCodeWriterWriteDoubles((uint64_t)&theData, (double *)(a2 + 2016), 1u)
        || _cmphotoDNGOPCodeWriterWriteDoubles((uint64_t)&theData, (double *)(a2 + 2024), 1u)
        || _cmphotoDNGOPCodeWriterWrite32((uint64_t)&theData, *(_DWORD *)(a2 + 2032)))
      {
        goto LABEL_118;
      }
      v34 = CFDataGetBytePtr(*(CFDataRef *)(a2 + 2040));
      if ((_DWORD)v33)
      {
        v35 = (unsigned int *)v34;
        v36 = theData;
        v37 = HIDWORD(v56);
        v38 = v57;
        do
        {
          if (v37)
          {
            LODWORD(__dst[0]) = bswap32(*v35);
            CFDataAppendBytes(v36, (const UInt8 *)__dst, 4);
            v38 += 4;
          }
          else if (FigSignalErrorAt())
          {
            goto LABEL_118;
          }
          ++v35;
          --v33;
        }
        while (v33);
        LODWORD(v57) = v38;
      }
      if (_cmphotoDNGOPCodeWriterEndOPCode((uint64_t)&theData))
        goto LABEL_118;
    }
    *(_QWORD *)&__dst[0] = 0;
    _cmphotoDNGOPCodeWriterCloseAndCopyData((uint64_t)&theData, (CFMutableDataRef *)__dst);
    if (*(_QWORD *)&__dst[0])
    {
      v39 = CFDataGetLength(*(CFDataRef *)&__dst[0]);
      v40 = (__int16 *)CFDataGetBytePtr(*(CFDataRef *)&__dst[0]);
      _ifdAddTag4(a1, 51022, 7u, v39, v40);
      if (*(_QWORD *)&__dst[0])
        CFRelease(*(CFTypeRef *)&__dst[0]);
    }
  }
  v41 = *(const __CFData **)(a2 + 1952);
  if (v41)
  {
    if (*(_BYTE *)(a2 + 1944))
    {
      v42 = CFDataGetLength(v41);
      v43 = (__int16 *)CFDataGetBytePtr(*(CFDataRef *)(a2 + 1952));
      _ifdAddTag4(a1, 52525, 7u, v42, v43);
    }
    else
    {
      v44 = (*(_DWORD *)(a2 + 1884) * *(_DWORD *)(a2 + 1880) * *(_DWORD *)(a2 + 1920));
      v45 = (4 * v44);
      if (CFDataGetLength(v41) != v45)
        goto LABEL_118;
      Mutable = CFDataCreateMutable(0, (v45 + 64));
      LODWORD(__dst[0]) = bswap32(*(_DWORD *)(a2 + 1880));
      CFDataAppendBytes(Mutable, (const UInt8 *)__dst, 4);
      LODWORD(__dst[0]) = bswap32(*(_DWORD *)(a2 + 1884));
      CFDataAppendBytes(Mutable, (const UInt8 *)__dst, 4);
      *(_QWORD *)&__dst[0] = bswap64(*(_QWORD *)(a2 + 1888));
      CFDataAppendBytes(Mutable, (const UInt8 *)__dst, 8);
      *(_QWORD *)&__dst[0] = bswap64(*(_QWORD *)(a2 + 1896));
      CFDataAppendBytes(Mutable, (const UInt8 *)__dst, 8);
      *(_QWORD *)&__dst[0] = bswap64(*(_QWORD *)(a2 + 1904));
      CFDataAppendBytes(Mutable, (const UInt8 *)__dst, 8);
      *(_QWORD *)&__dst[0] = bswap64(*(_QWORD *)(a2 + 1912));
      CFDataAppendBytes(Mutable, (const UInt8 *)__dst, 8);
      LODWORD(__dst[0]) = bswap32(*(_DWORD *)(a2 + 1920));
      CFDataAppendBytes(Mutable, (const UInt8 *)__dst, 4);
      LODWORD(__dst[0]) = bswap32(*(_DWORD *)(a2 + 1924));
      CFDataAppendBytes(Mutable, (const UInt8 *)__dst, 4);
      LODWORD(__dst[0]) = bswap32(*(_DWORD *)(a2 + 1928));
      CFDataAppendBytes(Mutable, (const UInt8 *)__dst, 4);
      LODWORD(__dst[0]) = bswap32(*(_DWORD *)(a2 + 1932));
      CFDataAppendBytes(Mutable, (const UInt8 *)__dst, 4);
      LODWORD(__dst[0]) = bswap32(*(_DWORD *)(a2 + 1936));
      CFDataAppendBytes(Mutable, (const UInt8 *)__dst, 4);
      LODWORD(__dst[0]) = bswap32(*(_DWORD *)(a2 + 1940));
      CFDataAppendBytes(Mutable, (const UInt8 *)__dst, 4);
      v47 = CFDataGetBytePtr(*(CFDataRef *)(a2 + 1952));
      if ((_DWORD)v44)
      {
        v48 = (unsigned int *)v47;
        do
        {
          v49 = *v48++;
          LODWORD(__dst[0]) = bswap32(v49);
          CFDataAppendBytes(Mutable, (const UInt8 *)__dst, 4);
          --v44;
        }
        while (v44);
      }
      v50 = CFDataGetLength(Mutable);
      v51 = (__int16 *)CFDataGetBytePtr(Mutable);
      _ifdAddTag4(a1, 52525, 7u, v50, v51);
      if (Mutable)
        CFRelease(Mutable);
    }
  }
  v52 = *(unsigned int *)(a2 + 760);
  if ((int)v52 >= 1)
    _ifdAddTag4(a1, 51041, 0xCu, v52, (__int16 *)(a2 + 712));
LABEL_118:
  if (theData)
    CFRelease(theData);
}

uint64_t _cmphotoDNGWriterIFDEnd(char **a1)
{
  unsigned int v2;
  int Length;
  int v4;
  uint64_t v5;
  unint64_t v6;
  unsigned int v7;
  char *v8;
  unsigned int v9;
  unsigned int v10;
  unsigned int v11;
  const UInt8 *v12;
  uint64_t v13;
  unint64_t i;
  char *v15;
  char *v16;
  int v17;
  CFDataRef *v18;
  const __CFData *v19;
  __CFData *v20;
  const UInt8 *BytePtr;
  CFIndex v22;
  UInt8 bytes[4];

  v2 = *((_DWORD *)a1 + 3);
  *(_WORD *)bytes = v2;
  if (*((_BYTE *)a1 + 48))
    *(_WORD *)bytes = bswap32(v2) >> 16;
  CFDataAppendBytes((CFMutableDataRef)a1[5], bytes, 2);
  qsort(*a1, *((unsigned int *)a1 + 3), 0x28uLL, (int (__cdecl *)(const void *, const void *))_compareTagKeysAscending);
  Length = CFDataGetLength((CFDataRef)a1[5]);
  v4 = *((_DWORD *)a1 + 3);
  if (v4)
  {
    v5 = 0;
    v6 = 0;
    v7 = Length + 12 * v4 + 4;
    do
    {
      v8 = *a1;
      *(_WORD *)bytes = 0;
      v9 = *(unsigned __int16 *)&v8[v5];
      *(_WORD *)bytes = *(_WORD *)&v8[v5];
      if (*((_BYTE *)a1 + 48))
        *(_WORD *)bytes = __rev16(v9);
      CFDataAppendBytes((CFMutableDataRef)a1[5], bytes, 2);
      *(_WORD *)bytes = 0;
      v10 = *(unsigned __int16 *)&v8[v5 + 2];
      *(_WORD *)bytes = *(_WORD *)&v8[v5 + 2];
      if (*((_BYTE *)a1 + 48))
        *(_WORD *)bytes = __rev16(v10);
      CFDataAppendBytes((CFMutableDataRef)a1[5], bytes, 2);
      *(_DWORD *)bytes = 0;
      v11 = *(_DWORD *)&v8[v5 + 4];
      *(_DWORD *)bytes = v11;
      if (*((_BYTE *)a1 + 48))
        *(_DWORD *)bytes = bswap32(v11);
      CFDataAppendBytes((CFMutableDataRef)a1[5], bytes, 4);
      v12 = (const UInt8 *)&v8[v5];
      if (*(_DWORD *)&v8[v5 + 28] > 4u)
      {
        *(_DWORD *)&a1[3][4 * *((unsigned int *)v12 + 6)] = v7;
        *(_DWORD *)bytes = v7;
        if (*((_BYTE *)a1 + 48))
          *(_DWORD *)bytes = bswap32(v7);
        CFDataAppendBytes((CFMutableDataRef)a1[5], bytes, 4);
        v7 += *(_DWORD *)&v8[v5 + 32];
      }
      else
      {
        *(_DWORD *)&a1[3][4 * *((unsigned int *)v12 + 6)] = CFDataGetLength((CFDataRef)a1[5]);
        CFDataAppendBytes((CFMutableDataRef)a1[5], v12 + 8, 4);
      }
      ++v6;
      v5 += 40;
    }
    while (v6 < *((unsigned int *)a1 + 3));
  }
  *(_DWORD *)bytes = 0;
  CFDataAppendBytes((CFMutableDataRef)a1[5], bytes, 4);
  if (*((_DWORD *)a1 + 3))
  {
    v13 = 0;
    for (i = 0; i < *((unsigned int *)a1 + 3); ++i)
    {
      v15 = *a1;
      v16 = &(*a1)[v13];
      if (*((_DWORD *)v16 + 7) >= 5u)
      {
        v17 = *(_DWORD *)&a1[3][4 * *((unsigned int *)v16 + 6)];
        if (v17 != CFDataGetLength((CFDataRef)a1[5]))
          return FigSignalErrorAt();
        v18 = (CFDataRef *)&v15[v13];
        v19 = *(const __CFData **)&v15[v13 + 16];
        v20 = (__CFData *)a1[5];
        if (v19)
        {
          BytePtr = CFDataGetBytePtr(v19);
          v22 = CFDataGetLength(v18[2]);
          CFDataAppendBytes(v20, BytePtr, v22);
        }
        else
        {
          CFDataIncreaseLength((CFMutableDataRef)a1[5], *((unsigned int *)v18 + 8));
        }
      }
      v13 += 40;
    }
  }
  return 0;
}

uint64_t _cmphotoDNGWriterIFDGetTagDataOffset(uint64_t a1, unsigned int a2, _DWORD *a3)
{
  if (a2 == 0xFFFF || *(_DWORD *)(a1 + 16) <= a2)
    return FigSignalErrorAt();
  *a3 = *(_DWORD *)(*(_QWORD *)(a1 + 24) + 4 * a2);
  return 0;
}

const void *_readDictCFString(const __CFDictionary *a1, const void *a2, _DWORD *a3)
{
  const void *Value;
  const void *v7;

  CFStringGetTypeID();
  Value = CFDictionaryGetValue(a1, a2);
  v7 = Value;
  if (Value)
  {
    CFGetTypeID(Value);
  }
  else if (a3)
  {
    *a3 = 1;
  }
  return v7;
}

const void *_readDictCFNumber(const __CFDictionary *a1, const void *a2, _DWORD *a3)
{
  const void *Value;
  const void *v7;

  CFNumberGetTypeID();
  Value = CFDictionaryGetValue(a1, a2);
  v7 = Value;
  if (Value)
  {
    CFGetTypeID(Value);
  }
  else if (a3)
  {
    *a3 = 1;
  }
  return v7;
}

const void *_readDictCFData(const __CFDictionary *a1, const void *a2, _DWORD *a3)
{
  const void *Value;
  const void *v7;

  CFDataGetTypeID();
  Value = CFDictionaryGetValue(a1, a2);
  v7 = Value;
  if (Value)
  {
    CFGetTypeID(Value);
  }
  else if (a3)
  {
    *a3 = 1;
  }
  return v7;
}

uint64_t _unpackArrayOfDoubles(const __CFArray *a1, unsigned int a2, char *a3, _DWORD *a4)
{
  unint64_t Count;
  unint64_t v9;
  CFIndex v10;
  const void *ValueAtIndex;
  CFTypeID v12;
  uint64_t result;

  Count = CFArrayGetCount(a1);
  if (Count <= a2)
  {
    v9 = Count;
    if (!Count)
    {
LABEL_8:
      result = 0;
      *a4 = v9;
      return result;
    }
    v10 = 0;
    while (1)
    {
      ValueAtIndex = CFArrayGetValueAtIndex(a1, v10);
      v12 = CFGetTypeID(ValueAtIndex);
      if (v12 != CFNumberGetTypeID()
        || !CFNumberIsFloatType((CFNumberRef)ValueAtIndex)
        || !CFNumberGetValue((CFNumberRef)ValueAtIndex, kCFNumberDoubleType, a3))
      {
        break;
      }
      ++v10;
      a3 += 8;
      if (v9 == v10)
        goto LABEL_8;
    }
  }
  return 4294950740;
}

uint64_t readFloatArray(const void *a1, uint64_t a2, uint64_t a3)
{
  CFTypeID v6;
  CFIndex v7;
  uint64_t v8;

  v6 = CFGetTypeID(a1);
  if (v6 != CFArrayGetTypeID())
    return 4294950740;
  v7 = a1 ? CFArrayGetCount((CFArrayRef)a1) : 0;
  if (v7 != a2)
    return 4294950740;
  if (a2 >= 1)
  {
    v8 = 0;
    do
    {
      FigCFArrayGetFloatAtIndex();
      ++v8;
      a3 += 4;
    }
    while (a2 != v8);
  }
  return 0;
}

uint64_t _floatArrayToRational(const __CFArray *a1, uint64_t a2, int a3)
{
  CFIndex Count;
  CFIndex v7;
  CFIndex v8;
  const __CFNumber *ValueAtIndex;
  unsigned int v10;
  float v11;
  float v12;
  int v13;
  float v14;
  _DWORD *v15;
  double valuePtr;

  valuePtr = 0.0;
  Count = CFArrayGetCount(a1);
  if (Count != a3)
    return 4294950740;
  if (a3 >= 1)
  {
    v7 = Count;
    v8 = 0;
    while (1)
    {
      ValueAtIndex = (const __CFNumber *)CFArrayGetValueAtIndex(a1, v8);
      if (!CFNumberIsFloatType(ValueAtIndex) || !CFNumberGetValue(ValueAtIndex, kCFNumberDoubleType, &valuePtr))
        break;
      v10 = 0;
      v11 = valuePtr;
      v12 = -v11;
      if (v11 >= 0.0)
        v12 = valuePtr;
      do
      {
        v13 = 1 << v10;
        v14 = (float)(1 << v10);
        if (v10 > 0x1D)
          break;
        ++v10;
      }
      while ((float)(v12 * v14) < 1073700000.0);
      v15 = (_DWORD *)(a2 + 8 * v8);
      *v15 = llroundf(v11 * v14);
      v15[1] = v13;
      if (++v8 == v7)
        return 0;
    }
    return 4294950740;
  }
  return 0;
}

uint64_t _readInt32Array(const void *a1, uint64_t a2, uint64_t a3)
{
  CFTypeID v6;
  CFIndex v7;
  uint64_t v8;

  v6 = CFGetTypeID(a1);
  if (v6 != CFArrayGetTypeID())
    return 4294950740;
  v7 = a1 ? CFArrayGetCount((CFArrayRef)a1) : 0;
  if (v7 != a2)
    return 4294950740;
  if (a2 >= 1)
  {
    v8 = 0;
    do
    {
      FigCFArrayGetInt32AtIndex();
      ++v8;
      a3 += 4;
    }
    while (a2 != v8);
  }
  return 0;
}

uint64_t _parseOutWidthAndHeightFromJpeg(uint64_t a1)
{
  CGImageSourceRef v2;
  CGImageSource *v3;
  void *v4;
  const __CFDictionary *v5;
  const __CFDictionary *v6;
  CFDictionaryRef v7;
  uint64_t v8;
  void *values;
  void *keys[2];

  keys[1] = *(void **)MEMORY[0x1E0C80C00];
  v2 = CGImageSourceCreateWithData(*(CFDataRef *)(a1 + 1640), 0);
  if (!v2)
    return 4294950745;
  v3 = v2;
  v4 = (void *)*MEMORY[0x1E0CBD240];
  values = (void *)*MEMORY[0x1E0C9AE40];
  keys[0] = v4;
  v5 = CFDictionaryCreate((CFAllocatorRef)*MEMORY[0x1E0C9AE00], (const void **)keys, (const void **)&values, 1, MEMORY[0x1E0C9B390], MEMORY[0x1E0C9B3A0]);
  if (!v5)
  {
    v8 = 4294950745;
    v7 = v3;
LABEL_6:
    CFRelease(v7);
    return v8;
  }
  v6 = v5;
  v7 = CGImageSourceCopyPropertiesAtIndex(v3, 0, v5);
  if (v7)
  {
    *(_QWORD *)(a1 + 1648) = 0;
    FigCFDictionaryGetIntIfPresent();
    FigCFDictionaryGetIntIfPresent();
    v8 = 0;
  }
  else
  {
    v8 = 4294950745;
  }
  CFRelease(v3);
  CFRelease(v6);
  if (v7)
    goto LABEL_6;
  return v8;
}

uint64_t _cfaPatternFromPixelFormat(int a1, int *a2)
{
  uint64_t result;
  int *v4;

  result = 4294950746;
  if (a1 > 1735549491)
  {
    if (a1 == 1735549492)
    {
      v4 = &kCFAPatternGRBG;
    }
    else
    {
      if (a1 != 1919379252)
        return result;
      v4 = &kCFAPatternRGGB;
    }
  }
  else if (a1 == 1650943796)
  {
    v4 = &kCFAPatternBGGR;
  }
  else
  {
    if (a1 != 1734505012)
      return result;
    v4 = &kCFAPatternGBRG;
  }
  result = 0;
  *a2 = *v4;
  return result;
}

CFTypeRef _copyFilteredImageProperties(const __CFDictionary *a1)
{
  const __CFString *v1;
  uint64_t v2;
  const __CFDictionary *v3;
  const __CFAllocator *v4;
  CFMutableDictionaryRef Mutable;
  uint64_t v6;
  const __CFString *v7;
  const __CFDictionary *Value;
  const __CFDictionary *v9;
  CFTypeID v10;
  _BOOL4 v11;
  int v12;
  int v13;
  char *v14;
  CFTypeRef v15;
  __CFDictionary *MutableCopy;
  __CFArray *v17;
  uint64_t i;
  CFNumberRef v19;
  uint64_t j;
  CFTypeRef v21;
  const __CFDictionary *v23;
  __CFDictionary *theDict;
  void *key;
  const __CFString *v26;
  int v27;
  __int16 v28;
  _QWORD v29[4];

  v29[3] = *MEMORY[0x1E0C80C00];
  v1 = (const __CFString *)*MEMORY[0x1E0CBCB50];
  v2 = *MEMORY[0x1E0CBCD68];
  v29[0] = *MEMORY[0x1E0CBCB50];
  v29[1] = v2;
  v29[2] = *MEMORY[0x1E0CBCF70];
  if (!a1)
    return 0;
  v3 = a1;
  v4 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
  Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0, MEMORY[0x1E0C9B390], MEMORY[0x1E0C9B3A0]);
  if (!Mutable)
    return 0;
  theDict = Mutable;
  v6 = 0;
  key = (void *)*MEMORY[0x1E0CBCCB8];
  v26 = v1;
  v23 = v3;
  do
  {
    v7 = (const __CFString *)v29[v6];
    Value = (const __CFDictionary *)CFDictionaryGetValue(v3, v7);
    if (Value)
    {
      v9 = Value;
      v10 = CFGetTypeID(Value);
      if (v10 == CFDictionaryGetTypeID() && CFDictionaryGetCount(v9) >= 1)
      {
        if (CFStringCompare(v7, v1, 0))
          v11 = 0;
        else
          v11 = CFDictionaryContainsKey(v9, key) == 0;
        v12 = FigCFEqual();
        v13 = v12;
        if (v12)
          v14 = (char *)&sExifTagBlackList;
        else
          v14 = 0;
        if (v12 || v11)
        {
          MutableCopy = CFDictionaryCreateMutableCopy(v4, 0, v9);
          if (v11)
          {
            v28 = 1;
            v27 = 131074;
            v17 = CFArrayCreateMutable(v4, 3, MEMORY[0x1E0C9B378]);
            for (i = 0; i != 6; i += 2)
            {
              v19 = CFNumberCreate(v4, kCFNumberShortType, (char *)&v27 + i);
              CFArrayAppendValue(v17, v19);
              if (v19)
                CFRelease(v19);
            }
            CFDictionaryAddValue(MutableCopy, key, v17);
            if (v17)
              CFRelease(v17);
            v3 = v23;
          }
          if (v13)
          {
            for (j = 0; j != 32; j += 8)
              CFDictionaryRemoveValue(MutableCopy, **(const void ***)&v14[j]);
          }
          v15 = CFRetain(MutableCopy);
          if (MutableCopy)
            CFRelease(MutableCopy);
        }
        else
        {
          v15 = CFRetain(v9);
        }
        v1 = v26;
        if (v15)
        {
          if (CFDictionaryGetCount((CFDictionaryRef)v15) >= 1)
            CFDictionaryAddValue(theDict, v7, v15);
          CFRelease(v15);
        }
      }
    }
    ++v6;
  }
  while (v6 != 3);
  if (CFDictionaryGetCount(theDict) < 1)
    v21 = 0;
  else
    v21 = CFRetain(theDict);
  CFRelease(theDict);
  return v21;
}

uint64_t _prepareAnalogBalance(uint64_t a1)
{
  float32x2_t *v1;
  float64x2_t *v8;
  float64x2_t v10;
  double v11;
  float v12;
  const __CFArray *v13;
  uint64_t result;
  float v15;
  double v16;
  int v17;
  _QWORD v18[4];

  v18[3] = *MEMORY[0x1E0C80C00];
  v1 = (float32x2_t *)(a1 + 2076);
  __asm { FMOV            V0.2S, #1.0 }
  *(_QWORD *)(a1 + 2076) = _D0;
  *(_DWORD *)(a1 + 2084) = 1065353216;
  if (!*(_BYTE *)(a1 + 464))
    return 0;
  v8 = (float64x2_t *)(a1 + 424);
  if (!*(_BYTE *)(a1 + 25))
  {
    if (*(_BYTE *)(a1 + 26))
    {
      result = 0;
      *v1 = vcvt_f32_f64(*v8);
      v15 = *(double *)(a1 + 440);
      *(float *)(a1 + 2084) = v15;
      return result;
    }
    return 0;
  }
  __asm { FMOV            V1.2D, #1.0 }
  v10 = vdivq_f64(_Q1, *v8);
  v11 = 1.0 / *(double *)(a1 + 440);
  if (!*(_BYTE *)(a1 + 26))
  {
    *v1 = vcvt_f32_f64(v10);
    v12 = v11;
    *(float *)(a1 + 2084) = v12;
  }
  v16 = v10.f64[1];
  v18[0] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", *(_QWORD *)&v10.f64[0]);
  v18[1] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v16);
  v18[2] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v11);
  v13 = (const __CFArray *)objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v18, 3);
  result = _floatArrayToRational(v13, a1 + 468, 3);
  if (!(_DWORD)result)
  {
    v17 = 0;
    result = _unpackArrayOfDoubles(v13, 3u, (char *)(a1 + 496), &v17);
    if (!(_DWORD)result)
    {
      if (v17 == 3)
      {
        *(_BYTE *)(a1 + 520) = 1;
        result = _floatArrayToRational((const __CFArray *)&unk_1E53FE780, a1 + 396, 3);
        if (!(_DWORD)result)
        {
          result = _unpackArrayOfDoubles((const __CFArray *)&unk_1E53FE780, 3u, (char *)v8, &v17);
          if (!(_DWORD)result)
          {
            if (v17 == 3)
              return 0;
            else
              return 4294950746;
          }
        }
      }
      else
      {
        return 4294950746;
      }
    }
  }
  return result;
}

uint64_t _applyLossyJPEGPerceptualCurve(uint64_t a1, __CVBuffer *a2)
{
  int v4;
  uint64_t v5;
  OSType PixelFormatType;
  OSType v7;
  void *v8;
  size_t WidthOfPlane;
  size_t HeightOfPlane;
  size_t BytesPerRowOfPlane;
  int8x16_t *BaseAddressOfPlane;
  uint64_t v13;
  int v14;
  int v15;
  int v16;
  uint16x8_t v17;
  uint16x8_t v18;
  uint64_t v19;
  uint16x8_t v20;
  int8x16_t v21;
  int16x8_t v22;
  int16x8_t v23;
  int16x8_t v24;
  uint64_t v25;
  int8x16_t *v26;
  uint16x8_t v27;
  uint16x8_t v28;
  uint16x8_t v29;
  uint16x8_t v30;
  int64x2_t v31;
  int64x2_t v32;
  int64x2_t v33;
  int v34;
  unint64_t v35;
  int v36;
  int v37;
  int v38;
  unsigned int v39;
  Class CIImageClass_0;
  uint64_t v42;
  void *v43;
  uint64_t v44;
  void *v45;
  uint64_t v46;
  void *v47;
  double v48;
  double v49;
  double v50;
  double v51;
  void *v52;
  double v53;
  CGFloat v54;
  double v55;
  CGFloat v56;
  double v57;
  CGFloat v58;
  double v59;
  CGFloat v60;
  Class CIVectorClass_0;
  void *v62;
  Class CIContextClass_0;
  Class v64;
  uint64_t v65;
  void *v66;
  float32x2_t *v67;
  double v68;
  double v69;
  double v70;
  double v71;
  int32x2_t v72;
  float v73;
  int v74;
  int v75;
  float v76;
  float v77;
  float v78;
  unsigned int v79;
  float v80;
  float v81;
  int v82;
  float v83;
  uint64_t v84;
  float v85;
  float v86;
  float v87;
  float v88;
  uint64_t v89;
  double *v90;
  double v91;
  double v92;
  uint64_t v93;
  int v94;
  int v95;
  void *v96;
  Class CIFilterClass;
  void *v98;
  uint64_t v99;
  void *v100;
  Class v101;
  void *v102;
  uint64_t v103;
  uint64_t v104;
  double v105;
  double v106;
  double v107;
  double v108;
  float v109;
  float v110;
  float v111;
  float v112;
  uint64_t v113;
  float v114;
  float v115;
  float v116;
  float v117;
  float v118;
  float v119;
  BOOL v120;
  float v121;
  float v122;
  double v123;
  float v124;
  float v125;
  float v126;
  float v127;
  float v128;
  uint64_t v129;
  float v130;
  int32x2_t v131;
  float v132;
  CGAffineTransform v133;
  uint64_t v134;
  const __CFString *v135;
  _QWORD v136[3];
  _QWORD v137[3];
  _QWORD v138[4];
  _QWORD v139[4];
  float v140[3];
  float v141[3];
  void *v142;
  float v143;
  _QWORD v144[2];
  _QWORD v145[2];
  const __CFString *v146;
  uint64_t v147;
  uint64_t v148;
  uint64_t v149;
  _QWORD v150[3];
  _QWORD v151[3];
  uint64_t v152;
  uint64_t v153;
  CGAffineTransform v154;
  uint64_t v155;
  CGRect v156;
  CGRect v157;
  CGRect v158;
  CGRect v159;

  v155 = *MEMORY[0x1E0C80C00];
  v4 = CMPhotoPerceptualCurveVersion();
  LODWORD(v5) = *(_DWORD *)(a1 + 32);
  if (*(float *)&v5 == 0.0)
    *(float *)&v5 = 1.0;
  v129 = v5;
  *(_QWORD *)(a1 + 2048) = 0;
  *(_DWORD *)(a1 + 2056) = 0;
  *(_OWORD *)(a1 + 1864) = 0u;
  PixelFormatType = CVPixelBufferGetPixelFormatType(a2);
  v7 = PixelFormatType;
  if (PixelFormatType != 1111970369 && PixelFormatType != 1751527984 && PixelFormatType != 1815491698)
    return FigSignalErrorAt();
  v8 = (void *)MEMORY[0x1A85D1038]();
  if (v7 == 1751527984)
  {
    if (CVPixelBufferLockBaseAddress(a2, 1uLL))
    {
LABEL_163:
      v93 = FigSignalErrorAt();
      goto LABEL_91;
    }
    WidthOfPlane = CVPixelBufferGetWidthOfPlane(a2, 0);
    HeightOfPlane = CVPixelBufferGetHeightOfPlane(a2, 0);
    BytesPerRowOfPlane = CVPixelBufferGetBytesPerRowOfPlane(a2, 0);
    BaseAddressOfPlane = (int8x16_t *)CVPixelBufferGetBaseAddressOfPlane(a2, 0);
    if (HeightOfPlane)
    {
      v13 = 0;
      v14 = 0;
      v15 = 0;
      v16 = 0;
      v17 = (uint16x8_t)vdupq_n_s16(0x1401u);
      v18 = (uint16x8_t)vdupq_n_s16(0xC01u);
      if (WidthOfPlane >> 5 <= 1)
        v19 = 1;
      else
        v19 = WidthOfPlane >> 5;
      v20 = (uint16x8_t)vdupq_n_s16(0x401u);
      v21.i64[0] = 0x7C007C007C007C00;
      v21.i64[1] = 0x7C007C007C007C00;
      do
      {
        v22 = 0uLL;
        if (WidthOfPlane >= 0x20)
        {
          v24 = 0uLL;
          v25 = v19;
          v26 = BaseAddressOfPlane;
          v23 = 0uLL;
          do
          {
            v27 = (uint16x8_t)vandq_s8(*v26, v21);
            v28 = (uint16x8_t)vandq_s8(v26[1], v21);
            v29 = (uint16x8_t)vandq_s8(v26[2], v21);
            v30 = (uint16x8_t)vandq_s8(v26[3], v21);
            v24 = vaddq_s16(vaddq_s16(vaddq_s16(v24, (int16x8_t)vcgtq_u16(v17, v27)), vaddq_s16((int16x8_t)vcgtq_u16(v17, v28), (int16x8_t)vcgtq_u16(v17, v29))), (int16x8_t)vcgtq_u16(v17, v30));
            v23 = vaddq_s16(vaddq_s16(vaddq_s16(v23, (int16x8_t)vcgtq_u16(v18, v27)), vaddq_s16((int16x8_t)vcgtq_u16(v18, v28), (int16x8_t)vcgtq_u16(v18, v29))), (int16x8_t)vcgtq_u16(v18, v30));
            v22 = vaddq_s16(vaddq_s16(vaddq_s16(v22, (int16x8_t)vcgtq_u16(v20, v27)), vaddq_s16((int16x8_t)vcgtq_u16(v20, v28), (int16x8_t)vcgtq_u16(v20, v29))), (int16x8_t)vcgtq_u16(v20, v30));
            v26 += 4;
            --v25;
          }
          while (v25);
          BaseAddressOfPlane += 4 * v19;
        }
        else
        {
          v23 = 0uLL;
          v24 = 0uLL;
        }
        v31 = vpaddlq_s32(vpaddlq_s16(v24));
        v14 += v31.i32[0] + v31.i32[2];
        v32 = vpaddlq_s32(vpaddlq_s16(v23));
        v15 += v32.i32[0] + v32.i32[2];
        v33 = vpaddlq_s32(vpaddlq_s16(v22));
        v16 += v33.i32[0] + v33.i32[2];
        BaseAddressOfPlane = (int8x16_t *)((char *)BaseAddressOfPlane
                                         + 2 * ((BytesPerRowOfPlane >> 1) - (WidthOfPlane & 0xFFFFFFFFFFFFFFE0)));
        ++v13;
      }
      while (v13 != HeightOfPlane);
      v34 = -16384 * v14;
      v35 = 32 * HeightOfPlane * (WidthOfPlane >> 5);
      v36 = -16384 * v15;
      if (v35 < -16384 * v16)
        v37 = 1;
      else
        v37 = 2;
      if (v35 < v36)
        v38 = v37;
      else
        v38 = 3;
      if (v35 >= v34)
        v39 = 4;
      else
        v39 = v38;
    }
    else
    {
      v39 = 4;
    }
    CVPixelBufferUnlockBaseAddress(a2, 1uLL);
  }
  else
  {
    v39 = 2;
  }
  CIImageClass_0 = getCIImageClass_0();
  v152 = getkCIImageColorSpace_0();
  v153 = objc_msgSend(MEMORY[0x1E0C99E38], "null");
  v42 = -[objc_class imageWithCVPixelBuffer:options:](CIImageClass_0, "imageWithCVPixelBuffer:options:", a2, objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v153, &v152, 1));
  if (!v42)
    goto LABEL_163;
  v43 = (void *)v42;
  if (*(float *)&v129 != 1.0 && (*(_DWORD *)(a1 + 8) == 2 || *(_DWORD *)(a1 + 156) == 16))
  {
    *(float32x2_t *)(a1 + 2076) = vmul_n_f32(*(float32x2_t *)(a1 + 2076), *(float *)&v129);
    *(float *)(a1 + 2084) = *(float *)&v129 * *(float *)(a1 + 2084);
  }
  v150[0] = CFSTR("inputRVector");
  v151[0] = -[objc_class vectorWithX:Y:Z:W:](getCIVectorClass_0(), "vectorWithX:Y:Z:W:", *(float *)(a1 + 2076), 0.0, 0.0, 0.0);
  v150[1] = CFSTR("inputGVector");
  v151[1] = -[objc_class vectorWithX:Y:Z:W:](getCIVectorClass_0(), "vectorWithX:Y:Z:W:", 0.0, *(float *)(a1 + 2080), 0.0, 0.0);
  v150[2] = CFSTR("inputBVector");
  v151[2] = -[objc_class vectorWithX:Y:Z:W:](getCIVectorClass_0(), "vectorWithX:Y:Z:W:", 0.0, 0.0, *(float *)(a1 + 2084), 0.0);
  v44 = objc_msgSend(v43, "imageByApplyingFilter:withInputParameters:", CFSTR("CIColorMatrix"), objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v151, v150, 3));
  v45 = (void *)v44;
  if (*(_DWORD *)(a1 + 156) == 16 || v4 == 2)
  {
    if (!v44)
      goto LABEL_44;
    v47 = (void *)-[objc_class kernelWithString:](getCIColorKernelClass(), "kernelWithString:", CFSTR("kernel vec4 maxComponent (__sample s)__attribute__((outputFormat(kCIFormatRh))){\treturn vec4(vec3(max(max(s.r,s.g),s.b)), s.a);}"));
    objc_msgSend(v45, "extent");
    *(_QWORD *)&v154.a = v45;
    v45 = (void *)objc_msgSend(v47, "applyWithExtent:arguments:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v154, 1), v48, v49, v50, v51);
    if (!v45)
      goto LABEL_44;
    v52 = (void *)-[objc_class kernelWithString:](getCIKernelClass(), "kernelWithString:", CFSTR("kernel vec4 downscale( sampler src)__attribute__((outputFormat(kCIFormatRh))) {      vec2 dc = (4.0 * (destCoord() - vec2(0.5))) + vec2(0.5);     vec4 s1  = sample(src, samplerTransform(src, dc + vec2(0,0)));     float s2  = sample(src, samplerTransform(src, dc + vec2(0,1))).r;     float s3  = sample(src, samplerTransform(src, dc + vec2(0,2))).r;     float s4  = sample(src, samplerTransform(src, dc + vec2(0,3))).r;     float s5  = sample(src, samplerTransform(src, dc + vec2(1,0))).r;     float s6  = sample(src, samplerTransform(src, dc + vec2(1,1))).r;     float s7  = sample(src, samplerTransform(src, dc + vec2(1,2))).r;     float s8  = sample(src, samplerTransform(src, dc + vec2(1,3))).r;     float s9  = sample(src, samplerTransform(src, dc + vec2(2,0))).r;     float s10 = sample(src, samplerTransform(src, dc + vec2(2,1))).r;     float s11 = sample(src, samplerTransform(src, dc + vec2(2,2))).r;     float s12 = sample(src, samplerTransform(src, dc + vec2(2,3))).r;     float s13 = sample(src, samplerTransform(src, dc + vec2(3,0))).r;     float s14 = sample(src, samplerTransform(src, dc + vec2(3,1))).r;     float s15 = sample(src, samplerTransform(src, dc + vec2(3,2))).r;     float s16 = sample(src, samplerTransform(src, dc + vec2(3,3))).r;     float g1 = max(max(max(s1.r, s2), s3), s4);     float g2 = max(max(max(s5, s6), s7), s8);     float g3 = max(max(max(s9, s10), s11), s12);     float g4 = max(max(max(s13, s14), s15), s16);     return vec4(vec3(max(max(max(g1, g2), g3), g4)), s1.a);}"));
    objc_msgSend(v45, "extent");
    v54 = v53;
    v56 = v55;
    v58 = v57;
    v60 = v59;
    CGAffineTransformMakeScale(&v154, 0.25, 0.25);
    v156.origin.x = v54;
    v156.origin.y = v56;
    v156.size.width = v58;
    v156.size.height = v60;
    v157 = CGRectApplyAffineTransform(v156, &v154);
    v142 = v45;
    v46 = objc_msgSend(v52, "applyWithExtent:roiCallback:arguments:", &__block_literal_global_200, objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v142, 1), v157.origin.x, v157.origin.y, v157.size.width, v157.size.height);
  }
  else
  {
    CGAffineTransformMakeScale(&v133, 0.25, 0.25);
    v46 = objc_msgSend(v45, "imageByApplyingTransform:highQualityDownsample:", &v133, 1);
  }
  v45 = (void *)v46;
LABEL_44:
  v148 = 0;
  v149 = 0;
  v146 = CFSTR("inputExtent");
  CIVectorClass_0 = getCIVectorClass_0();
  objc_msgSend(v45, "extent");
  v159 = CGRectInset(v158, -1.0, -1.0);
  v147 = -[objc_class vectorWithCGRect:](CIVectorClass_0, "vectorWithCGRect:", v159.origin.x, v159.origin.y, v159.size.width, v159.size.height);
  v62 = (void *)objc_msgSend(v45, "imageByApplyingFilter:withInputParameters:", CFSTR("CIAreaMaximum"), objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v147, &v146, 1));
  CIContextClass_0 = getCIContextClass_0();
  v64 = CIContextClass_0;
  if (v4 == 2)
  {
    v144[0] = getkCIContextCacheIntermediates_0();
    v145[0] = MEMORY[0x1E0C9AAA0];
    v144[1] = getkCIContextName_0();
    v145[1] = CFSTR("measure max value");
    v65 = -[objc_class contextWithOptions:](v64, "contextWithOptions:", objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v145, v144, 2));
  }
  else
  {
    v65 = -[objc_class context](CIContextClass_0, "context");
  }
  v66 = (void *)v65;
  v67 = (float32x2_t *)(a1 + 2076);
  objc_msgSend(v62, "extent", v129);
  objc_msgSend(v66, "render:toBitmap:rowBytes:bounds:format:colorSpace:", v62, &v148, 16, getkCIFormatRGBAf(), 0, v68, v69, v70, v71);
  v72.i32[0] = v148;
  if (*(float *)&v148 <= *((float *)&v148 + 1))
    v72.i32[0] = HIDWORD(v148);
  if (*(float *)v72.i32 <= *(float *)&v149)
    v72.i32[0] = v149;
  v73 = (float)*(int *)(a1 + 372) / (float)*(int *)(a1 + 376);
  v74 = *(_DWORD *)(a1 + 8);
  if (v74 != 2)
  {
    v75 = *(_DWORD *)(a1 + 156);
    if (v75 != 16)
    {
      if (v4 == 1 && v7 == 1751527984)
      {
        v109 = v130 * *(float *)v72.i32;
        v110 = 1.0;
        if (*(float *)v72.i32 <= 1.0)
          v111 = v130;
        else
          v111 = v130 * *(float *)v72.i32;
        if (*(float *)v72.i32 <= 1.0)
          v112 = 1.0;
        else
          v112 = 1.0 / *(float *)v72.i32;
        if (v111 >= 2.0)
        {
          if (v111 >= 8.0)
            v114 = 1.0;
          else
            v114 = 0.5;
          if (v111 >= 8.0)
            v110 = 0.5;
        }
        else
        {
          v113 = (int)v39 - 2;
          if (v113 > 2)
          {
            v114 = 0.0625;
          }
          else
          {
            v110 = flt_1A8296280[v113];
            v114 = flt_1A829628C[(int)v113];
          }
        }
        v122 = v112 * v110;
        v77 = 1.0;
        if (v122 != 1.0)
        {
          *v67 = vmul_n_f32(*v67, v122);
          *(float *)(a1 + 2084) = v122 * *(float *)(a1 + 2084);
        }
        v123 = 1.0 / v111;
        if (*(float *)v72.i32 <= 1.0)
          v124 = *(float *)v72.i32;
        else
          v124 = 1.0;
        if (v123 <= v124)
          v125 = v123;
        else
          v125 = v124;
        if (v109 <= 1.0)
          v126 = 0.5;
        else
          v126 = 0.5 / v109;
        if (v126 <= v114)
          v126 = v114;
        v78 = v110 * (float)(v125 * v126);
        v127 = v111 / v110;
      }
      else
      {
        if (v4 != 2)
        {
          v132 = *(float *)v72.i32;
          v76 = log2f(*(float *)v72.i32);
          v78 = 0.5;
          v77 = v132;
          goto LABEL_54;
        }
        if (*(float *)v72.i32 <= 1.0)
          v115 = *(float *)v72.i32;
        else
          v115 = 1.0;
        if (*(float *)v72.i32 <= 1.0)
          v116 = 1.0;
        else
          v116 = 1.0 / *(float *)v72.i32;
        if (v75 < 11)
        {
          if (v130 >= 1.5)
          {
            v121 = 1.0;
            if (v130 >= 16.0)
              v121 = 0.75;
          }
          else
          {
            v121 = 1.0 / v115;
          }
          if (v39 >= 3)
            v78 = 0.03125;
          else
            v78 = 0.015625;
        }
        else
        {
          v117 = 0.5;
          if (v39 == 3)
            v118 = 0.5;
          else
            v118 = 1.0;
          if (v39 == 4)
            v118 = 0.25;
          if (v130 < 4.0)
            v117 = 1.0;
          if (v130 >= 16.0)
            v117 = 0.25;
          if (v130 >= 1.5)
            v119 = v117;
          else
            v119 = v118;
          v120 = v119 != 1.0 || v115 <= 0.75;
          v121 = 0.75 / v115;
          if (v120)
            v121 = v119;
          v78 = 1.0 / (float)(1 << (16 - v75));
        }
        v128 = v116 * v121;
        v77 = 1.0;
        if (v128 != 1.0)
        {
          *v67 = vmul_n_f32(*v67, v128);
          *(float *)(a1 + 2084) = v128 * *(float *)(a1 + 2084);
        }
        v127 = v130 / v128;
      }
      *(float *)(a1 + 32) = v127;
      v76 = log2f(v127);
      goto LABEL_54;
    }
  }
  v131 = v72;
  v76 = log2f(*(float *)v72.i32);
  *v67 = vdiv_f32(*v67, (float32x2_t)vdup_lane_s32(v131, 0));
  *(float *)(a1 + 2084) = *(float *)(a1 + 2084) / *(float *)v131.i32;
  v77 = 1.0;
  v78 = 1.0;
LABEL_54:
  v79 = 0;
  v80 = v73 + v76;
  v81 = -v80;
  if (v80 >= 0.0)
    v81 = v80;
  do
  {
    v82 = 1 << v79;
    v83 = (float)(1 << v79);
    if (v79 > 0x1D)
      break;
    ++v79;
  }
  while ((float)(v81 * v83) < 1073700000.0);
  v84 = 0;
  *(_DWORD *)(a1 + 372) = llroundf(v80 * v83);
  *(_DWORD *)(a1 + 376) = v82;
  *(_BYTE *)(a1 + 24) = 1;
  *(_DWORD *)(a1 + 1876) = 3;
  v85 = fminf(v77, 1.0);
  do
  {
    v140[v84] = 0.0;
    if (v74 == 2)
    {
      v141[v84] = 0.03125;
      *(_DWORD *)((char *)&v142 + v84 * 4) = 1048576000;
      v86 = 0.71875;
    }
    else if (v4 == 2)
    {
      if (v78 <= 0.02)
      {
        v141[v84] = 0.015625;
        *(_DWORD *)((char *)&v142 + v84 * 4) = 0;
        v88 = 0.0;
        v87 = 0.015625;
      }
      else if (v78 <= 0.04)
      {
        v141[v84] = 0.03125;
        *(_DWORD *)((char *)&v142 + v84 * 4) = 1048576000;
        v88 = 0.25;
        v87 = 0.03125;
      }
      else if (v78 <= 0.08)
      {
        v141[v84] = 0.0625;
        *(_DWORD *)((char *)&v142 + v84 * 4) = 1050924810;
        v87 = 0.0625;
        v88 = 0.32;
      }
      else if (v78 <= 0.16)
      {
        v141[v84] = 0.125;
        *(_DWORD *)((char *)&v142 + v84 * 4) = 1050253722;
        v87 = 0.125;
        v88 = 0.3;
      }
      else if (v78 <= 0.32)
      {
        v141[v84] = 0.25;
        *(_DWORD *)((char *)&v142 + v84 * 4) = 1043207291;
        v87 = 0.25;
        v88 = 0.17;
      }
      else if (v78 <= 0.64)
      {
        v141[v84] = 0.5;
        *(_DWORD *)((char *)&v142 + v84 * 4) = -1095887749;
        v87 = 0.5;
        v88 = -0.34;
      }
      else
      {
        v141[v84] = 1.0;
        *(_DWORD *)((char *)&v142 + v84 * 4) = 0;
        v87 = 1.0;
        v88 = 0.0;
      }
      v86 = (float)(1.0 - v87) - v88;
    }
    else
    {
      if ((float)(v77 * 0.0625) > v78)
        v78 = v77 * 0.0625;
      v141[v84] = v85 * v78;
      *(_DWORD *)((char *)&v142 + v84 * 4) = 0;
      v86 = v77 - (float)(v78 * v77);
      if (v77 >= 1.0)
        v86 = v77 - v78;
    }
    *(float *)((char *)&v154.a + v84 * 4) = v86;
    ++v84;
  }
  while (v84 != 3);
  v89 = 0;
  v90 = (double *)(a1 + 1696);
  do
  {
    v91 = v141[v89];
    *(v90 - 3) = v140[v89];
    *(v90 - 2) = v91;
    v92 = *((float *)&v154.a + v89);
    *(v90 - 1) = *((float *)&v142 + v89);
    *v90 = v92;
    *(_DWORD *)(a1 + 1864 + 4 * v89++) = 4;
    v90 += 8;
  }
  while (v89 < *(int *)(a1 + 1876));
  if (v74 != 2)
  {
    v93 = 0;
    v94 = *(_DWORD *)(a1 + 156);
    if (v94 == 16 || v78 == 1.0)
      goto LABEL_91;
    v95 = 1 << v94;
    *(_DWORD *)(a1 + 2056) = v95;
    v96 = malloc_type_malloc(2 * v95, 0x1000040BDFB0063uLL);
    *(_QWORD *)(a1 + 2048) = v96;
    if (!v96)
      goto LABEL_164;
    CIFilterClass = getCIFilterClass();
    v138[0] = CFSTR("inputColor0");
    v139[0] = -[objc_class blackColor](getCIColorClass(), "blackColor");
    v138[1] = CFSTR("inputColor1");
    v139[1] = -[objc_class whiteColor](getCIColorClass(), "whiteColor");
    v138[2] = CFSTR("inputPoint0");
    v139[2] = -[objc_class vectorWithCGPoint:](getCIVectorClass_0(), "vectorWithCGPoint:", 0.5, 0.5);
    v138[3] = CFSTR("inputPoint1");
    v139[3] = -[objc_class vectorWithCGPoint:](getCIVectorClass_0(), "vectorWithCGPoint:", (float)*(int *)(a1 + 2056) + -0.5, 0.5);
    v98 = (void *)objc_msgSend((id)objc_msgSend((id)-[objc_class filterWithName:withInputParameters:](CIFilterClass, "filterWithName:withInputParameters:", CFSTR("CILinearGradient"), objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v139, v138, 4)), "outputImage"), "imageByCroppingToRect:", 0.0, 0.0, (double)*(int *)(a1 + 2056), 1.0);
    v136[0] = CFSTR("inputRedCoefficients");
    v137[0] = -[objc_class vectorWithX:Y:Z:W:](getCIVectorClass_0(), "vectorWithX:Y:Z:W:", (float)(v140[0] / v77), (float)(v141[0] / v77), (float)(*(float *)&v142 / v77), (float)(*(float *)&v154.a / v77));
    v136[1] = CFSTR("inputGreenCoefficients");
    v137[1] = -[objc_class vectorWithX:Y:Z:W:](getCIVectorClass_0(), "vectorWithX:Y:Z:W:", (float)(v140[1] / v77), (float)(v141[1] / v77), (float)(*((float *)&v142 + 1) / v77), (float)(*((float *)&v154.a + 1) / v77));
    v136[2] = CFSTR("inputBlueCoefficients");
    v137[2] = -[objc_class vectorWithX:Y:Z:W:](getCIVectorClass_0(), "vectorWithX:Y:Z:W:", (float)(v140[2] / v77), (float)(v141[2] / v77), (float)(v143 / v77), (float)(*(float *)&v154.b / v77));
    v99 = objc_msgSend(v98, "imageByApplyingFilter:withInputParameters:", CFSTR("CIColorPolynomial"), objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v137, v136, 3));
    if (!v99)
    {
LABEL_164:
      v93 = 4294950745;
      goto LABEL_91;
    }
    v100 = (void *)v99;
    v101 = getCIContextClass_0();
    v134 = getkCIContextName_0();
    v135 = CFSTR("linearizationTable creation");
    v102 = (void *)-[objc_class contextWithOptions:](v101, "contextWithOptions:", objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v135, &v134, 1));
    v103 = *(_QWORD *)(a1 + 2048);
    v104 = 2 * *(int *)(a1 + 2056);
    objc_msgSend(v100, "extent");
    objc_msgSend(v102, "render:toBitmap:rowBytes:bounds:format:colorSpace:", v100, v103, v104, getkCIFormatL16(), 0, v105, v106, v107, v108);
  }
  v93 = 0;
LABEL_91:
  objc_autoreleasePoolPop(v8);
  return v93;
}

Class initCIImage_0()
{
  Class result;

  if (CoreImageLibrary_sOnce_0 != -1)
    dispatch_once(&CoreImageLibrary_sOnce_0, &__block_literal_global_24);
  result = objc_getClass("CIImage");
  classCIImage_0 = (uint64_t)result;
  getCIImageClass_0 = CIImageFunction_0;
  return result;
}

uint64_t CIImageFunction_0()
{
  return classCIImage_0;
}

uint64_t initValkCIImageColorSpace_0()
{
  uint64_t *v0;
  uint64_t result;

  if (CoreImageLibrary_sOnce_0 != -1)
    dispatch_once(&CoreImageLibrary_sOnce_0, &__block_literal_global_24);
  v0 = (uint64_t *)dlsym((void *)CoreImageLibrary_sLib_0, "kCIImageColorSpace");
  if (v0)
  {
    result = *v0;
    constantValkCIImageColorSpace_0 = result;
  }
  else
  {
    result = constantValkCIImageColorSpace_0;
  }
  getkCIImageColorSpace_0 = kCIImageColorSpaceFunction_0;
  return result;
}

uint64_t kCIImageColorSpaceFunction_0()
{
  return constantValkCIImageColorSpace_0;
}

Class initCIVector_0()
{
  Class result;

  if (CoreImageLibrary_sOnce_0 != -1)
    dispatch_once(&CoreImageLibrary_sOnce_0, &__block_literal_global_24);
  result = objc_getClass("CIVector");
  classCIVector_0 = (uint64_t)result;
  getCIVectorClass_0 = CIVectorFunction_0;
  return result;
}

uint64_t CIVectorFunction_0()
{
  return classCIVector_0;
}

Class initCIColorKernel()
{
  Class result;

  if (CoreImageLibrary_sOnce_0 != -1)
    dispatch_once(&CoreImageLibrary_sOnce_0, &__block_literal_global_24);
  result = objc_getClass("CIColorKernel");
  classCIColorKernel = (uint64_t)result;
  getCIColorKernelClass = CIColorKernelFunction;
  return result;
}

uint64_t CIColorKernelFunction()
{
  return classCIColorKernel;
}

void ___downscaleRh_block_invoke(CGFloat a1, CGFloat a2, CGFloat a3, CGFloat a4)
{
  CGAffineTransform v8;
  CGRect v9;

  CGAffineTransformMakeScale(&v8, 4.0, 4.0);
  v9.origin.x = a1;
  v9.origin.y = a2;
  v9.size.width = a3;
  v9.size.height = a4;
  CGRectApplyAffineTransform(v9, &v8);
}

Class initCIKernel()
{
  Class result;

  if (CoreImageLibrary_sOnce_0 != -1)
    dispatch_once(&CoreImageLibrary_sOnce_0, &__block_literal_global_24);
  result = objc_getClass("CIKernel");
  classCIKernel = (uint64_t)result;
  getCIKernelClass = CIKernelFunction;
  return result;
}

uint64_t CIKernelFunction()
{
  return classCIKernel;
}

uint64_t initValkCIContextCacheIntermediates_0()
{
  uint64_t *v0;
  uint64_t result;

  if (CoreImageLibrary_sOnce_0 != -1)
    dispatch_once(&CoreImageLibrary_sOnce_0, &__block_literal_global_24);
  v0 = (uint64_t *)dlsym((void *)CoreImageLibrary_sLib_0, "kCIContextCacheIntermediates");
  if (v0)
  {
    result = *v0;
    constantValkCIContextCacheIntermediates_0 = result;
  }
  else
  {
    result = constantValkCIContextCacheIntermediates_0;
  }
  getkCIContextCacheIntermediates_0 = kCIContextCacheIntermediatesFunction_0;
  return result;
}

uint64_t kCIContextCacheIntermediatesFunction_0()
{
  return constantValkCIContextCacheIntermediates_0;
}

uint64_t initValkCIContextName_0()
{
  uint64_t *v0;
  uint64_t result;

  if (CoreImageLibrary_sOnce_0 != -1)
    dispatch_once(&CoreImageLibrary_sOnce_0, &__block_literal_global_24);
  v0 = (uint64_t *)dlsym((void *)CoreImageLibrary_sLib_0, "kCIContextName");
  if (v0)
  {
    result = *v0;
    constantValkCIContextName_0 = result;
  }
  else
  {
    result = constantValkCIContextName_0;
  }
  getkCIContextName_0 = kCIContextNameFunction_0;
  return result;
}

uint64_t kCIContextNameFunction_0()
{
  return constantValkCIContextName_0;
}

uint64_t initValkCIFormatRGBAf()
{
  unsigned int *v0;
  uint64_t result;

  if (CoreImageLibrary_sOnce_0 != -1)
    dispatch_once(&CoreImageLibrary_sOnce_0, &__block_literal_global_24);
  v0 = (unsigned int *)dlsym((void *)CoreImageLibrary_sLib_0, "kCIFormatRGBAf");
  if (v0)
  {
    result = *v0;
    constantValkCIFormatRGBAf = result;
  }
  else
  {
    result = constantValkCIFormatRGBAf;
  }
  getkCIFormatRGBAf = kCIFormatRGBAfFunction;
  return result;
}

uint64_t kCIFormatRGBAfFunction()
{
  return constantValkCIFormatRGBAf;
}

Class initCIColor()
{
  Class result;

  if (CoreImageLibrary_sOnce_0 != -1)
    dispatch_once(&CoreImageLibrary_sOnce_0, &__block_literal_global_24);
  result = objc_getClass("CIColor");
  classCIColor = (uint64_t)result;
  getCIColorClass = CIColorFunction;
  return result;
}

uint64_t CIColorFunction()
{
  return classCIColor;
}

uint64_t initValkCIFormatL16()
{
  unsigned int *v0;
  uint64_t result;

  if (CoreImageLibrary_sOnce_0 != -1)
    dispatch_once(&CoreImageLibrary_sOnce_0, &__block_literal_global_24);
  v0 = (unsigned int *)dlsym((void *)CoreImageLibrary_sLib_0, "kCIFormatL16");
  if (v0)
  {
    result = *v0;
    constantValkCIFormatL16 = result;
  }
  else
  {
    result = constantValkCIFormatL16;
  }
  getkCIFormatL16 = kCIFormatL16Function;
  return result;
}

uint64_t kCIFormatL16Function()
{
  return constantValkCIFormatL16;
}

void _cmphotoDNGWriterReleaseTagStorage(char **a1)
{
  char *v2;
  unint64_t v3;
  unint64_t v4;
  uint64_t v5;

  v2 = *a1;
  if (v2)
  {
    v3 = *((unsigned int *)a1 + 3);
    if ((_DWORD)v3)
    {
      v4 = 0;
      v5 = 16;
      do
      {
        if (*(_QWORD *)&v2[v5])
        {
          CFRelease(*(CFTypeRef *)&v2[v5]);
          v2 = *a1;
          *(_QWORD *)&(*a1)[v5] = 0;
          v3 = *((unsigned int *)a1 + 3);
        }
        ++v4;
        v5 += 40;
      }
      while (v4 < v3);
    }
    *a1 = 0;
    free(v2);
  }
  a1[1] = 0;
}

void _ifdAddTagS(char **a1, __int16 a2, uint64_t a3)
{
  const char *CStringPtrAndBufferToFree;
  __int16 *v6;
  int v7;

  if (a3)
  {
    CStringPtrAndBufferToFree = (const char *)FigCFStringGetCStringPtrAndBufferToFree();
    if (CStringPtrAndBufferToFree)
    {
      v6 = (__int16 *)CStringPtrAndBufferToFree;
      v7 = strlen(CStringPtrAndBufferToFree);
      _ifdAddTag4(a1, a2, 2u, (v7 + 1), v6);
      free(0);
    }
  }
}

uint64_t _ifdAddTag4(char **a1, __int16 a2, unsigned int a3, size_t __n, __int16 *__src)
{
  uint64_t v6;
  int v10;
  int v11;
  char *v12;
  uint64_t result;
  char *v14;
  int v15;
  uint64_t v16;
  unsigned int *v17;
  unsigned int v18;
  size_t v19;
  CFIndex v20;
  unsigned int *v21;
  UInt8 *MutableBytePtr;
  int v23;
  __CFData *Mutable;
  char *v25;
  int v26;
  unsigned int v27;
  __int16 v28;
  uint64_t v29;
  unsigned int v30;
  unint64_t v31;

  LODWORD(v6) = __n;
  v10 = *((_DWORD *)a1 + 3);
  if (v10 == *((_DWORD *)a1 + 2))
  {
    v11 = 2 * v10;
    v12 = (char *)malloc_type_realloc(*a1, 40 * (2 * v10), 0x106004007C5E651uLL);
    *a1 = v12;
    bzero(&v12[40 * *((unsigned int *)a1 + 2)], 40 * (v11 - *((_DWORD *)a1 + 2)));
    *((_DWORD *)a1 + 2) = v11;
  }
  result = *((unsigned int *)a1 + 4);
  if ((_DWORD)result == *((_DWORD *)a1 + 8))
  {
    *((_DWORD *)a1 + 8) = 2 * result;
    a1[3] = (char *)malloc_type_realloc(a1[3], 4 * (2 * result), 0x100004052888210uLL);
    result = *((unsigned int *)a1 + 4);
  }
  v14 = *a1;
  v15 = *((_DWORD *)a1 + 3);
  v16 = (uint64_t)&(*a1)[40 * v15];
  *(_WORD *)v16 = a2;
  *(_WORD *)(v16 + 2) = a3;
  *(_DWORD *)(v16 + 4) = v6;
  *(_DWORD *)(v16 + 24) = result;
  v17 = (unsigned int *)(v16 + 24);
  v18 = tiffDataTypeToSize[a3] * (_DWORD)v6;
  *(_DWORD *)(v16 + 28) = v18;
  v19 = -v18 & 3;
  v20 = v19 + v18;
  *(_DWORD *)(v16 + 32) = v20;
  v21 = (unsigned int *)(v16 + 32);
  if (__src)
  {
    if (v18 > 4)
    {
      Mutable = CFDataCreateMutable((CFAllocatorRef)*MEMORY[0x1E0C9AE00], v20);
      v25 = &v14[40 * v15];
      *((_QWORD *)v25 + 2) = Mutable;
      CFDataSetLength(Mutable, *v21);
      MutableBytePtr = CFDataGetMutableBytePtr(*((CFMutableDataRef *)v25 + 2));
    }
    else
    {
      MutableBytePtr = (UInt8 *)(v16 + 8);
    }
    v26 = *((unsigned __int8 *)a1 + 48);
    switch((__int16)a3)
    {
      case 0:
      case 1:
      case 2:
      case 6:
      case 7:
        memcpy(MutableBytePtr, __src, v6);
        MutableBytePtr += v6;
        break;
      case 3:
      case 8:
        if ((_DWORD)v6)
        {
          v6 = v6;
          do
          {
            v28 = *__src++;
            CMPhotoDNGWrite16(MutableBytePtr, v28, v26);
            MutableBytePtr += 2;
            --v6;
          }
          while (v6);
        }
        break;
      case 4:
      case 9:
      case 11:
      case 13:
        if ((_DWORD)v6)
        {
          v6 = v6;
          do
          {
            v27 = *(_DWORD *)__src;
            __src += 2;
            CMPhotoDNGWrite32((unsigned int *)MutableBytePtr, v27, v26);
            MutableBytePtr += 4;
            --v6;
          }
          while (v6);
        }
        break;
      case 5:
      case 10:
        v29 = (2 * v6);
        if ((_DWORD)v29)
        {
          do
          {
            v30 = *(_DWORD *)__src;
            __src += 2;
            CMPhotoDNGWrite32((unsigned int *)MutableBytePtr, v30, v26);
            MutableBytePtr += 4;
            --v29;
          }
          while (v29);
        }
        break;
      case 12:
        if ((_DWORD)v6)
        {
          v6 = v6;
          do
          {
            v31 = *(_QWORD *)__src;
            __src += 4;
            CMPhotoDNGWrite64((unint64_t *)MutableBytePtr, v31, v26);
            MutableBytePtr += 8;
            --v6;
          }
          while (v6);
        }
        break;
      default:
        break;
    }
    bzero(MutableBytePtr, v19);
    v15 = *((_DWORD *)a1 + 3);
    v23 = *((_DWORD *)a1 + 4);
    result = *v17;
  }
  else
  {
    v23 = result;
  }
  *((_DWORD *)a1 + 3) = v15 + 1;
  *((_DWORD *)a1 + 4) = v23 + 1;
  return result;
}

uint64_t _cmphotoDNGOPCodeWriterOpen(__CFData **a1)
{
  __CFData *Mutable;

  a1[1] = 0;
  Mutable = CFDataCreateMutable((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0);
  *a1 = Mutable;
  if (!Mutable)
    return 4294950745;
  CFDataSetLength(Mutable, 4);
  return 0;
}

uint64_t _cmphotoDNGOPCodeWriterStartOPCode(uint64_t a1, unsigned int a2, unsigned int a3)
{
  UInt8 bytes[4];

  if (*(_DWORD *)(a1 + 12))
    return FigSignalErrorAt();
  *(_DWORD *)(a1 + 12) = CFDataGetLength(*(CFDataRef *)a1);
  *(_DWORD *)(a1 + 16) = 0;
  *(_DWORD *)bytes = bswap32(a2);
  CFDataAppendBytes(*(CFMutableDataRef *)a1, bytes, 4);
  *(_DWORD *)bytes = 769;
  CFDataAppendBytes(*(CFMutableDataRef *)a1, bytes, 4);
  *(_DWORD *)bytes = bswap32(a3);
  CFDataAppendBytes(*(CFMutableDataRef *)a1, bytes, 4);
  *(_DWORD *)bytes = 0;
  CFDataAppendBytes(*(CFMutableDataRef *)a1, bytes, 4);
  return 0;
}

uint64_t _cmphotoDNGOPCodeWriterWrite32(uint64_t a1, unsigned int a2)
{
  UInt8 bytes[4];

  if (!*(_DWORD *)(a1 + 12))
    return FigSignalErrorAt();
  *(_DWORD *)bytes = bswap32(a2);
  CFDataAppendBytes(*(CFMutableDataRef *)a1, bytes, 4);
  *(_DWORD *)(a1 + 16) += 4;
  return 0;
}

uint64_t _cmphotoDNGOPCodeWriterWriteDoubles(uint64_t a1, double *a2, unsigned int a3)
{
  CFIndex Length;
  int v7;
  uint64_t v8;
  double *v9;
  double v10;

  if (!*(_DWORD *)(a1 + 12))
    return FigSignalErrorAt();
  if (a3)
  {
    Length = CFDataGetLength(*(CFDataRef *)a1);
    v7 = 8 * a3;
    v8 = a3;
    CFDataIncreaseLength(*(CFMutableDataRef *)a1, 8 * a3);
    v9 = (double *)&CFDataGetMutableBytePtr(*(CFMutableDataRef *)a1)[Length];
    do
    {
      v10 = *a2++;
      CMPhotoDNGWriteDouble(v9++, 1, v10);
      --v8;
    }
    while (v8);
    *(_DWORD *)(a1 + 16) += v7;
  }
  return 0;
}

uint64_t _cmphotoDNGOPCodeWriterEndOPCode(uint64_t a1)
{
  UInt8 *MutableBytePtr;

  if (!*(_DWORD *)(a1 + 12))
    return FigSignalErrorAt();
  MutableBytePtr = CFDataGetMutableBytePtr(*(CFMutableDataRef *)a1);
  CMPhotoDNGWrite32((unsigned int *)&MutableBytePtr[*(unsigned int *)(a1 + 12) + 12], *(_DWORD *)(a1 + 16), 1);
  *(_DWORD *)(a1 + 12) = 0;
  *(_DWORD *)(a1 + 16) = 0;
  ++*(_DWORD *)(a1 + 8);
  return 0;
}

void _cmphotoDNGOPCodeWriterCloseAndCopyData(uint64_t a1, CFMutableDataRef *a2)
{
  unsigned int *MutableBytePtr;
  CFMutableDataRef v5;

  if (*(_DWORD *)(a1 + 8))
  {
    MutableBytePtr = (unsigned int *)CFDataGetMutableBytePtr(*(CFMutableDataRef *)a1);
    CMPhotoDNGWrite32(MutableBytePtr, *(_DWORD *)(a1 + 8), 1);
    v5 = *(CFMutableDataRef *)a1;
    *(_QWORD *)a1 = 0;
    if (!a2)
      goto LABEL_4;
    goto LABEL_3;
  }
  v5 = 0;
  if (a2)
LABEL_3:
    *a2 = v5;
LABEL_4:
  if (*(_QWORD *)a1)
  {
    CFRelease(*(CFTypeRef *)a1);
    *(_QWORD *)a1 = 0;
  }
}

uint64_t _cmphotoDNGOPCodeWriterWriteStandardOPCode(uint64_t a1, unsigned int a2, unsigned int a3, double *a4, unsigned int a5, unsigned int a6, unsigned int a7)
{
  uint64_t result;

  result = _cmphotoDNGOPCodeWriterStartOPCode(a1, a2, a6);
  if (!(_DWORD)result)
  {
    if (!a3 || (result = _cmphotoDNGOPCodeWriterWrite32(a1, a3), !(_DWORD)result))
    {
      result = _cmphotoDNGOPCodeWriterWriteDoubles(a1, a4, a5);
      if (!(_DWORD)result)
      {
        if (a2 != 14)
          return _cmphotoDNGOPCodeWriterEndOPCode(a1);
        result = _cmphotoDNGOPCodeWriterWrite32(a1, a7);
        if (!(_DWORD)result)
          return _cmphotoDNGOPCodeWriterEndOPCode(a1);
      }
    }
  }
  return result;
}

uint64_t _compareTagKeysAscending(unsigned __int16 *a1, unsigned __int16 *a2)
{
  return *a1 - *a2;
}

uint64_t _cmphotoDNGWriterIFDInsert(uint64_t a1, uint64_t a2, unsigned int a3, int a4)
{
  CFMutableDataRef Mutable;
  unsigned int *v9;
  unsigned int Length;
  unsigned __int16 *v11;
  unsigned int v12;
  int v13;
  uint64_t v14;
  unint64_t Tag;
  unsigned int v16;
  int v17;
  unsigned int v18;
  unint64_t v19;
  uint64_t v20;
  CFIndex v21;
  unsigned int v22;
  __CFData *v23;
  int v24;
  CFIndex v26;
  CFIndex v27;
  __CFData *v28;
  const UInt8 *BytePtr;
  uint64_t v31;
  int v32;
  uint64_t v33;
  const __CFData *theData;
  UInt8 bytes[8];
  unsigned int v36;
  UInt8 v37[8];
  unsigned int v38;
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  Mutable = CFDataCreateMutable((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0);
  if (!Mutable)
    return 4294950745;
  theData = Mutable;
  CFDataAppendBytes(*(CFMutableDataRef *)(a1 + 40), zero, 2);
  v9 = (unsigned int *)&CFDataGetMutableBytePtr(*(CFMutableDataRef *)(a1 + 40))[a4];
  Length = CFDataGetLength(*(CFDataRef *)(a1 + 40));
  CMPhotoDNGWrite32(v9, Length, *(unsigned __int8 *)(a1 + 48));
  v33 = a2;
  v11 = (unsigned __int16 *)(a2 + a3);
  v12 = CMPhotoDNGRead16(v11, *(unsigned __int8 *)(a1 + 48));
  v13 = CFDataGetLength(*(CFDataRef *)(a1 + 40));
  *(_WORD *)bytes = v12;
  if (*(_BYTE *)(a1 + 48))
    *(_WORD *)bytes = __rev16(v12);
  CFDataAppendBytes(*(CFMutableDataRef *)(a1 + 40), bytes, 2);
  if (v12)
  {
    v14 = (uint64_t)(v11 + 1);
    v32 = 12 * v12 + v13 + 6;
    v31 = a1;
    do
    {
      Tag = _readTag(v14, *(unsigned __int8 *)(a1 + 48));
      v17 = Tag;
      v18 = v16;
      v19 = HIDWORD(Tag);
      v20 = WORD1(Tag);
      v21 = HIDWORD(Tag) * tiffDataTypeToSize[WORD1(Tag)];
      if (v21 >= 5)
      {
        v22 = v16;
        v18 = v32 + CFDataGetLength(theData);
        CFDataAppendBytes(theData, (const UInt8 *)(v33 + v22), v21);
        if ((v21 & 1) != 0)
        {
          bytes[0] = 0;
          CFDataAppendBytes(theData, bytes, 1);
        }
        a1 = v31;
      }
      v23 = *(__CFData **)(a1 + 40);
      v24 = *(unsigned __int8 *)(a1 + 48);
      v36 = v18;
      v38 = 0;
      *(_QWORD *)v37 = 0;
      CMPhotoDNGWrite16(v37, v17, v24);
      CMPhotoDNGWrite16(&v37[2], v20, v24);
      CMPhotoDNGWrite32((unsigned int *)&v37[4], v19, v24);
      if (tiffDataTypeToSize[v20] * (int)v19 <= 4 && ((0x2A10uLL >> v20) & 1) == 0)
      {
        if (((0xC6uLL >> v20) & 1) != 0)
        {
          __memcpy_chk();
        }
        else if (HIWORD(v17) == 8 || HIWORD(v17) == 3)
        {
          CMPhotoDNGWrite16(&v38, v18, v24);
          if ((_DWORD)v19 == 2)
            CMPhotoDNGWrite16((_WORD *)&v38 + 1, SHIWORD(v18), v24);
        }
      }
      else
      {
        CMPhotoDNGWrite32(&v38, v18, v24);
      }
      CFDataAppendBytes(v23, v37, 12);
      v14 += 12;
      --v12;
    }
    while (v12);
  }
  *(_DWORD *)bytes = 0;
  CFDataAppendBytes(*(CFMutableDataRef *)(a1 + 40), bytes, 4);
  v26 = CFDataGetLength(theData);
  if (v26)
  {
    v27 = v26;
    v28 = *(__CFData **)(a1 + 40);
    BytePtr = CFDataGetBytePtr(theData);
    CFDataAppendBytes(v28, BytePtr, v27);
    CFDataAppendBytes(*(CFMutableDataRef *)(a1 + 40), zero, -(int)v27 & 3);
  }
  CFRelease(theData);
  return 0;
}

uint64_t _readTag(uint64_t a1, int a2)
{
  int v4;
  int v5;
  int v7;
  uint64_t v9;

  LOWORD(v9) = CMPhotoDNGRead16((unsigned __int16 *)a1, a2);
  v4 = CMPhotoDNGRead16((unsigned __int16 *)(a1 + 2), a2);
  WORD1(v9) = v4;
  v5 = CMPhotoDNGRead32((unsigned int *)(a1 + 4), a2);
  HIDWORD(v9) = v5;
  if (v5 * tiffDataTypeToSize[v4] <= 4 && ((0x2A10uLL >> v4) & 1) == 0)
  {
    if (((0xC6uLL >> v4) & 1) != 0)
    {
      __memcpy_chk();
    }
    else
    {
      v7 = v5;
      if (v4 == 8 || v4 == 3)
      {
        CMPhotoDNGRead16((unsigned __int16 *)(a1 + 8), a2);
        if (v7 == 2)
          CMPhotoDNGRead16((unsigned __int16 *)(a1 + 10), a2);
      }
    }
  }
  else
  {
    CMPhotoDNGRead32((unsigned int *)(a1 + 8), a2);
  }
  return v9;
}

void _pixelBufferPlanarReleaseCallback(CFTypeRef cf)
{
  if (cf)
    CFRelease(cf);
}

void _pixelBufferReleaseCallback(CFTypeRef cf)
{
  if (cf)
    CFRelease(cf);
}

Class initCIFilter()
{
  Class result;

  if (CoreImageLibrary_sOnce_0 != -1)
    dispatch_once(&CoreImageLibrary_sOnce_0, &__block_literal_global_24);
  result = objc_getClass("CIFilter");
  classCIFilter = (uint64_t)result;
  getCIFilterClass = CIFilterFunction;
  return result;
}

uint64_t CIFilterFunction()
{
  return classCIFilter;
}

Class initCIRenderDestination()
{
  Class result;

  if (CoreImageLibrary_sOnce_0 != -1)
    dispatch_once(&CoreImageLibrary_sOnce_0, &__block_literal_global_24);
  result = objc_getClass("CIRenderDestination");
  classCIRenderDestination = (uint64_t)result;
  getCIRenderDestinationClass = CIRenderDestinationFunction;
  return result;
}

uint64_t CIRenderDestinationFunction()
{
  return classCIRenderDestination;
}

Class initCIContext_0()
{
  Class result;

  if (CoreImageLibrary_sOnce_0 != -1)
    dispatch_once(&CoreImageLibrary_sOnce_0, &__block_literal_global_24);
  result = objc_getClass("CIContext");
  classCIContext_0 = (uint64_t)result;
  getCIContextClass_0 = CIContextFunction_0;
  return result;
}

uint64_t CIContextFunction_0()
{
  return classCIContext_0;
}

uint64_t ___addAuxiliaryImagesToJPEGData_block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  int v7;
  uint64_t v8;
  uint64_t v9;

  if (!a2)
    return 4294950739;
  v3 = (void *)objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("ImageList"));
  if (v3)
  {
    v4 = (void *)objc_msgSend(v3, "objectAtIndexedSubscript:", 0);
    if (v4)
    {
      v5 = (void *)objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("Auxiliary"));
      if (v5)
      {
        v6 = v5;
        v7 = objc_msgSend(v5, "count");
        if (v7 < 1)
          return 0;
        v8 = v7 + 1;
        while (1)
        {
          v9 = objc_msgSend((id)objc_msgSend(v6, "objectAtIndexedSubscript:", (v8 - 2)), "objectForKeyedSubscript:", CFSTR("ImageHandle"));
          if (!v9)
            break;
          if ((objc_msgSend(*(id *)(a1 + 32), "containsObject:", v9) & 1) == 0)
            objc_msgSend(v6, "removeObjectAtIndex:", (v8 - 2));
          if ((unint64_t)--v8 <= 1)
            return 0;
        }
      }
    }
  }
  return 4294950739;
}

uint64_t _cmphotoDNGReaderInit(uint64_t a1, CFDataRef theData)
{
  unsigned int Length;
  _DWORD *v5;
  int v7;
  unsigned int v8;

  if (!theData)
    return 4294950746;
  *(_OWORD *)a1 = 0u;
  *(_OWORD *)(a1 + 16) = 0u;
  *(_QWORD *)a1 = CFDataGetBytePtr(theData);
  Length = CFDataGetLength(theData);
  *(_DWORD *)(a1 + 8) = Length;
  if (Length < 9)
    return 4294950743;
  v5 = *(_DWORD **)a1;
  if (**(_DWORD **)a1 == _cmphotoDNGReaderInit_sTiffHeaderLE)
  {
    v7 = 0;
  }
  else
  {
    if (*v5 != _cmphotoDNGReaderInit_sTiffHeaderBE)
      return 4294950743;
    v7 = 1;
  }
  *(_BYTE *)(a1 + 26) = v7;
  v8 = CMPhotoDNGRead32(v5 + 1, v7);
  return _cmphotoDNGReaderOpenIFD(a1, v8);
}

uint64_t _readSubFileType(uint64_t a1, _DWORD *a2)
{
  int v4;
  unsigned __int16 *v5;
  int v6;
  uint64_t result;

  if (*(_WORD *)(a1 + 24))
  {
    v4 = 0;
    v5 = *(unsigned __int16 **)(a1 + 16);
    while (CMPhotoDNGRead16(v5, *(unsigned __int8 *)(a1 + 26)) != 254)
    {
      v5 += 6;
      if (++v4 >= *(unsigned __int16 *)(a1 + 24))
        goto LABEL_5;
    }
    _readTag((uint64_t)v5, *(unsigned __int8 *)(a1 + 26));
    result = 1;
  }
  else
  {
LABEL_5:
    v6 = 0;
    result = 0;
  }
  *a2 = v6;
  return result;
}

uint64_t _readPreviewTags(_QWORD *a1, CFDataRef *a2)
{
  int TagDataNvals;
  int v5;
  int v6;
  int v7;
  CFDataRef v8;
  uint64_t result;
  int v10;
  int v11;
  int v12;

  TagDataNvals = _getTagDataNvals((uint64_t)a1, 277, &v12);
  v5 = _getTagDataNvals((uint64_t)a1, 254, &v12);
  v10 = 0;
  v11 = 0;
  v6 = _getTagDataNvals((uint64_t)a1, 273, &v11);
  v7 = _getTagDataNvals((uint64_t)a1, 279, &v10);
  _getTagDataNvals((uint64_t)a1, 259, &v12);
  v8 = 0;
  if (!v11 || !v10)
  {
LABEL_8:
    result = 0;
    *a2 = v8;
    return result;
  }
  result = 4294950743;
  if (v11 == 1 && v10 == 1 && v5 == 1 && TagDataNvals == 3)
  {
    v8 = CFDataCreate((CFAllocatorRef)*MEMORY[0x1E0C9AE00], (const UInt8 *)(*a1 + v6), v7);
    if (!v8)
      return 4294950745;
    goto LABEL_8;
  }
  return result;
}

uint64_t _readRawImageTags(unint64_t a1, __CFDictionary *a2, uint64_t a3, int a4, int *a5, int *a6, int *a7, int *a8, int *a9, _DWORD *a10, _DWORD *a11, _DWORD *a12, unsigned __int16 **a13, unsigned __int16 **a14)
{
  int TagDataNvals;
  int v22;
  int v23;
  int v24;
  unsigned __int16 *j;
  int v26;
  unsigned __int16 *i;
  uint64_t Tag;
  unsigned int v29;
  unsigned __int16 *v30;
  unint64_t v31;
  unsigned int v32;
  unint64_t v33;
  uint64_t v34;
  int v35;
  int v36;
  int v37;
  _BOOL4 v38;
  int v39;
  unsigned __int16 *v40;
  BOOL v41;
  BOOL v42;
  uint64_t result;
  int v46;
  uint64_t v48;
  uint64_t v49;
  uint64_t v51;
  unsigned int v52;
  unsigned int *v53;
  int v54;
  unint64_t *v55;
  int v56;
  int v57;
  int v58;
  unint64_t *v59;
  unsigned int v60;
  const __CFString *v61;
  int v62;
  __CFArray *v63;
  double v64;
  int v65;
  int v66;
  int v67;
  unsigned int v68;
  unsigned __int16 *v69;
  int v70;
  unsigned int v71;
  int v72;
  unsigned __int16 *v73;
  unint64_t v74;
  unsigned int v75;
  unsigned int v76;
  unsigned __int16 *v77;
  unsigned int v78;
  unsigned __int16 *v79;
  unint64_t v80;
  int v81;
  unint64_t v82;
  unsigned int v83;
  int *v84;
  int v87;
  int v88;
  int v89;
  unsigned int v90;
  unsigned __int16 *v91;
  int v92;
  unsigned int v93;
  unint64_t v94;
  unsigned int v95;
  unsigned __int16 *v96;
  int v97;
  unsigned __int16 *v98;
  unint64_t v99;
  unsigned int v100;
  unsigned int v101;
  unsigned __int16 *v102;
  uint64_t v103;
  unsigned int v105;
  unsigned __int16 *v106;
  unsigned int v107;
  int v108;
  unint64_t v109;
  int v111;
  int v112;
  double v113;
  double v114;
  double v115;
  double v116;
  int v117;
  CFIndex v118;
  int v119;
  CFMutableArrayRef Mutable;
  __CFArray *v121;
  unsigned int *v122;
  float v123;
  __CFDictionary *v124;
  int v125;
  int v126;
  unsigned __int16 *v127;
  int v128;
  int v129;
  unsigned __int16 *v130;
  int v131;
  const __CFString *v132;
  int v133;
  const __CFString *v134;
  int v135;
  const __CFString *v136;
  int v137;
  int v138;
  int *v139;
  int v140;
  const __CFAllocator *allocator;
  int allocatora;
  int v143;
  unint64_t v144;
  int v145;
  int *v146;
  _DWORD v147[3];

  if (!a1)
    return 4294950746;
  TagDataNvals = _getTagDataNvals(a1, 254, v147);
  if ((TagDataNvals | 0x10) != 0x10)
    return 4294950738;
  v22 = TagDataNvals;
  v23 = _getTagDataNvals(a1, 262, v147);
  *a12 = v23;
  if (v23 == 34892)
  {
    if (!*(_WORD *)(a1 + 24))
      return 4294950743;
    v26 = 0;
    for (i = *(unsigned __int16 **)(a1 + 16);
          CMPhotoDNGRead16(i, *(unsigned __int8 *)(a1 + 26)) != 258;
          i += 6)
    {
      if (++v26 >= *(unsigned __int16 *)(a1 + 24))
        return 4294950743;
    }
    Tag = _readTag((uint64_t)i, *(unsigned __int8 *)(a1 + 26));
    if (HIDWORD(Tag) * tiffDataTypeToSize[WORD1(Tag)] < 5)
      v30 = i + 4;
    else
      v30 = (unsigned __int16 *)(*(_QWORD *)a1 + v29);
    v35 = CMPhotoDNGRead16(v30, *(unsigned __int8 *)(a1 + 26));
    if (a4)
      v36 = 1815491698;
    else
      v36 = 1647589490;
    if (v35 == 8)
      v36 = 1111970369;
    v140 = v36;
    if (!_copyShortsToDictAsArray(a1, 258, CFSTR("BitsPerSample"), a2))
      return 4294950743;
    v37 = _copyShortsOrLongOrRationalToDictAsArray(a1, (const void *)*MEMORY[0x1E0CBC928], a2);
    if (v22 != 16 && !v37)
      return 4294950743;
    v146 = a7;
    v38 = _copyShortsToDictAsArray(a1, 50717, (const void *)*MEMORY[0x1E0CBC9F0], a2);
    if (v22 != 16 && !v38)
      return 4294950743;
    _copyIntegerTagToDict(a1, 51110);
    _copyStringTagToDict(a1, 50936, (const void *)*MEMORY[0x1E0CBC9C0], a2);
    _copyRationalTagToDict(a1, 50935, (const void *)*MEMORY[0x1E0CBC9A0], a2);
    goto LABEL_34;
  }
  if (v23 != 32803)
    return 4294950738;
  if (_getTagDataNvals(a1, 258, v147) != 16
    || _getTagDataNvals(a1, 277, v147) != 1
    || _getTagDataNvals(a1, 284, v147) != 1
    || !*(_WORD *)(a1 + 24))
  {
    return 4294950743;
  }
  v24 = 0;
  for (j = *(unsigned __int16 **)(a1 + 16);
        CMPhotoDNGRead16(j, *(unsigned __int8 *)(a1 + 26)) != 33422;
        j += 6)
  {
    if (++v24 >= *(unsigned __int16 *)(a1 + 24))
      return 4294950743;
  }
  v31 = _readTag((uint64_t)j, *(unsigned __int8 *)(a1 + 26));
  v33 = HIDWORD(v31);
  v34 = HIDWORD(v31) * tiffDataTypeToSize[WORD1(v31)] < 5 ? (uint64_t)(j + 4) : *(_QWORD *)a1 + v32;
  v41 = HIDWORD(v31) == 16 || HIDWORD(v31) == 4;
  if (!v41 || (v31 & 0xFFFF0000) != 0x10000)
    return 4294950743;
  v42 = v33 == 16 || v33 == 4;
  result = 4294950743;
  if (!v42 || !v34)
    return result;
  if (v33 == 4)
  {
    if (*(_DWORD *)v34 != 65794)
    {
      if (*(_DWORD *)v34 != 33620224)
      {
        v46 = 1734505012;
        if (*(_DWORD *)v34 != 16908289)
        {
          if (*(_DWORD *)v34 != 16777729)
            return result;
          goto LABEL_160;
        }
        goto LABEL_159;
      }
      goto LABEL_148;
    }
  }
  else
  {
    if (v33 != 16)
      return result;
    if (*(_QWORD *)v34 != 0x101020201010202 || *(_QWORD *)(v34 + 8) != 0x10100000101)
    {
      if (*(_QWORD *)v34 != 0x101000001010000 || *(_QWORD *)(v34 + 8) != 0x202010102020101)
      {
        v46 = 1734505012;
        if (*(_QWORD *)v34 != 0x10100000101 || *(_QWORD *)(v34 + 8) != 0x101020201010202)
        {
          v49 = *(_QWORD *)v34;
          v48 = *(_QWORD *)(v34 + 8);
          if (v49 != 0x202010102020101 || v48 != 0x101000001010000)
            return result;
          goto LABEL_160;
        }
LABEL_159:
        v46 = 1735549492;
        goto LABEL_160;
      }
LABEL_148:
      v46 = 1919379252;
      goto LABEL_160;
    }
  }
  v46 = 1650943796;
LABEL_160:
  if (!*(_WORD *)(a1 + 24))
    return result;
  v140 = v46;
  v101 = 0;
  v102 = *(unsigned __int16 **)(a1 + 16);
  while (CMPhotoDNGRead16(v102, *(unsigned __int8 *)(a1 + 26)) != 50714)
  {
    v102 += 6;
    ++v101;
    result = 4294950743;
    if (v101 >= *(unsigned __int16 *)(a1 + 24))
      return result;
  }
  v103 = _readTag((uint64_t)v102, *(unsigned __int8 *)(a1 + 26));
  if (WORD1(v103) == 5)
  {
    if (!_copyShortsOrLongOrRationalToDictAsArray(a1, (const void *)*MEMORY[0x1E0CBC928], a2))
      return 4294950743;
  }
  else
  {
    if (WORD1(v103) - 3 > 1 || (v103 & 0xFFFFFFFF00000000) != 0x100000000)
      return 4294950743;
    FigCFDictionarySetInt();
  }
  if (!*(_WORD *)(a1 + 24))
    return 4294950743;
  v105 = 0;
  v106 = *(unsigned __int16 **)(a1 + 16);
  while (CMPhotoDNGRead16(v106, *(unsigned __int8 *)(a1 + 26)) != 50717)
  {
    v106 += 6;
    ++v105;
    result = 4294950743;
    if (v105 >= *(unsigned __int16 *)(a1 + 24))
      return result;
  }
  v146 = a7;
  v109 = _readTag((uint64_t)v106, *(unsigned __int8 *)(a1 + 26));
  if (HIDWORD(v109) != 1 || WORD1(v109) - 3 > 1)
    return 4294950743;
  FigCFDictionarySetInt();
LABEL_34:
  v139 = a8;
  if (*(_WORD *)(a1 + 24))
  {
    v39 = 0;
    v40 = *(unsigned __int16 **)(a1 + 16);
    while (CMPhotoDNGRead16(v40, *(unsigned __int8 *)(a1 + 26)) != 51022)
    {
      v40 += 6;
      if (++v39 >= *(unsigned __int16 *)(a1 + 24))
        goto LABEL_104;
    }
    v51 = _readTag((uint64_t)v40, *(unsigned __int8 *)(a1 + 26));
    if (HIDWORD(v51) * tiffDataTypeToSize[WORD1(v51)] < 5)
      v53 = (unsigned int *)(v40 + 4);
    else
      v53 = (unsigned int *)(*(_QWORD *)a1 + v52);
    v143 = CMPhotoDNGRead32(v53, 1);
    if (v143)
    {
      v54 = 0;
      v55 = (unint64_t *)(v53 + 1);
      v134 = (const __CFString *)*MEMORY[0x1E0CBC9E0];
      v136 = (const __CFString *)*MEMORY[0x1E0CBC988];
      v132 = (const __CFString *)*MEMORY[0x1E0CBC9E8];
      allocator = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
      while (2)
      {
        v56 = CMPhotoDNGRead32((unsigned int *)v55, 1);
        v57 = CMPhotoDNGRead32((unsigned int *)v55 + 3, 1);
        v58 = v57;
        v59 = v55 + 2;
        switch(v56)
        {
          case 1:
            v60 = 6 * CMPhotoDNGRead32((unsigned int *)v55 + 4, 1) + 2;
            if (((16 * (v60 >> 1)) | 4) == v58)
            {
              v59 = (unint64_t *)((char *)v55 + 20);
              v61 = v132;
              if (v60)
                goto LABEL_95;
            }
            break;
          case 2:
            v60 = (4 * CMPhotoDNGRead32((unsigned int *)v55 + 4, 1)) | 2;
            if (((16 * (v60 >> 1)) | 4) == v58)
            {
              v59 = (unint64_t *)((char *)v55 + 20);
              v61 = v134;
              goto LABEL_91;
            }
            break;
          case 3:
            if (v57 == 56)
            {
              v60 = 7;
              v61 = v136;
              goto LABEL_95;
            }
            break;
          case 4:
          case 5:
          case 6:
          case 7:
          case 8:
            break;
          case 9:
            v129 = CMPhotoDNGRead32((unsigned int *)v55 + 4, 1);
            v128 = CMPhotoDNGRead32((unsigned int *)v55 + 5, 1);
            v145 = CMPhotoDNGRead32((unsigned int *)v55 + 6, 1);
            v138 = CMPhotoDNGRead32((unsigned int *)v55 + 7, 1);
            v137 = CMPhotoDNGRead32((unsigned int *)v55 + 8, 1);
            v135 = CMPhotoDNGRead32((unsigned int *)v55 + 9, 1);
            v133 = CMPhotoDNGRead32((unsigned int *)v55 + 10, 1);
            v131 = CMPhotoDNGRead32((unsigned int *)v55 + 11, 1);
            v111 = CMPhotoDNGRead32((unsigned int *)v55 + 12, 1);
            v112 = CMPhotoDNGRead32((unsigned int *)v55 + 13, 1);
            v113 = CMPhotoDNGReadDouble(v55 + 7, 1);
            v114 = CMPhotoDNGReadDouble(v55 + 8, 1);
            v115 = CMPhotoDNGReadDouble(v55 + 9, 1);
            v116 = CMPhotoDNGReadDouble(v55 + 10, 1);
            v117 = v112;
            v126 = CMPhotoDNGRead32((unsigned int *)v55 + 22, 1);
            v118 = (v112 * v111 * v126);
            if ((4 * v118) + 76 == v58)
            {
              v119 = v111;
              Mutable = CFArrayCreateMutable(allocator, v118, MEMORY[0x1E0C9B378]);
              if (Mutable)
              {
                v121 = Mutable;
                if ((_DWORD)v118)
                {
                  v122 = (unsigned int *)v55 + 23;
                  do
                  {
                    v123 = CMPhotoDNGReadFloat(v122, 1);
                    CMPhotoCFArrayAppendFloat(v121, v123);
                    LODWORD(v118) = v118 - 1;
                  }
                  while ((_DWORD)v118);
                }
                v124 = CFDictionaryCreateMutable(allocator, 0, MEMORY[0x1E0C9B390], MEMORY[0x1E0C9B3A0]);
                CMPhotoCFDictionarySetInt32(v124, CFSTR("top"), v129);
                CMPhotoCFDictionarySetInt32(v124, CFSTR("left"), v128);
                CMPhotoCFDictionarySetInt32(v124, CFSTR("bottom"), v145);
                CMPhotoCFDictionarySetInt32(v124, CFSTR("right"), v138);
                CMPhotoCFDictionarySetInt32(v124, CFSTR("plane"), v137);
                CMPhotoCFDictionarySetInt32(v124, CFSTR("planes"), v135);
                CMPhotoCFDictionarySetInt32(v124, CFSTR("rowPitch"), v133);
                CMPhotoCFDictionarySetInt32(v124, CFSTR("colPitch"), v131);
                CMPhotoCFDictionarySetInt32(v124, CFSTR("mapsPointsV"), v119);
                CMPhotoCFDictionarySetInt32(v124, CFSTR("mapsPointsH"), v117);
                CMPhotoCFDictionarySetDouble(v124, CFSTR("mapsSpacingV"), v113);
                CMPhotoCFDictionarySetDouble(v124, CFSTR("mapsSpacingH"), v114);
                CMPhotoCFDictionarySetDouble(v124, CFSTR("mapOriginV"), v115);
                CMPhotoCFDictionarySetDouble(v124, CFSTR("mapOriginH"), v116);
                CMPhotoCFDictionarySetInt32(v124, CFSTR("mapPlanes"), v126);
                CFDictionarySetValue(v124, CFSTR("gainData"), v121);
                CFDictionarySetValue(a2, CFSTR("GainMap"), v124);
                CFRelease(v121);
                if (v124)
                  CFRelease(v124);
              }
            }
            break;
          default:
            if (v56 == 14)
            {
              v60 = 19 * CMPhotoDNGRead32((unsigned int *)v55 + 4, 1) + 2;
              if (8 * v60 + 8 == v58)
              {
                v59 = (unint64_t *)((char *)v55 + 20);
                v61 = CFSTR("WarpRectilinear2");
LABEL_91:
                if (v60)
                {
LABEL_95:
                  if (v61)
                  {
                    v62 = v56 == 14 ? v60 + 1 : v60;
                    v63 = CFArrayCreateMutable(allocator, v62, MEMORY[0x1E0C9B378]);
                    if (v63)
                    {
                      do
                      {
                        v64 = CMPhotoDNGReadDouble(v59++, 1);
                        CMPhotoCFArrayAppendDouble(v63, v64);
                        --v60;
                      }
                      while (v60);
                      if (v56 == 14)
                      {
                        v65 = CMPhotoDNGRead32((unsigned int *)v59, 1);
                        v59 = (unint64_t *)((char *)v59 + 4);
                        CMPhotoCFArrayAppendInt32(v63, v65);
                      }
                      CFDictionarySetValue(a2, v61, v63);
                      CFRelease(v63);
                      ++v54;
                      v55 = v59;
                      if (v54 != v143)
                        continue;
                    }
                  }
                }
              }
            }
            break;
        }
        break;
      }
    }
  }
LABEL_104:
  _copyDoublesToDictAsArray(a1, (const void *)*MEMORY[0x1E0CBC998], a2);
  _copyLongsToDictAsArray(a1, 50829, (const void *)*MEMORY[0x1E0CBC8E0], a2);
  _copyLongsToDictAsArray(a1, 50720, (const void *)*MEMORY[0x1E0CBC978], a2);
  _copyLongsToDictAsArray(a1, 50719, (const void *)*MEMORY[0x1E0CBC970], a2);
  v66 = _getTagDataNvals(a1, 256, v147);
  v67 = _getTagDataNvals(a1, 257, v147);
  result = 4294950743;
  if (v66 >= 1 && v67 >= 1 && *(_WORD *)(a1 + 24))
  {
    v68 = 0;
    v69 = *(unsigned __int16 **)(a1 + 16);
    allocatora = v66;
    while (1)
    {
      v70 = CMPhotoDNGRead16(v69, *(unsigned __int8 *)(a1 + 26));
      if (v70 == 324)
        break;
      v69 += 6;
      ++v68;
      v71 = *(unsigned __int16 *)(a1 + 24);
      if (v68 >= v71)
      {
        v72 = 0;
        LODWORD(v144) = 0;
        v73 = 0;
        goto LABEL_115;
      }
    }
    v74 = _readTag((uint64_t)v69, *(unsigned __int8 *)(a1 + 26));
    v72 = WORD1(v74);
    v144 = HIDWORD(v74);
    if (HIDWORD(v74) * tiffDataTypeToSize[WORD1(v74)] < 5)
      v73 = v69 + 4;
    else
      v73 = (unsigned __int16 *)(*(_QWORD *)a1 + v75);
    v71 = *(unsigned __int16 *)(a1 + 24);
LABEL_115:
    if (!v71)
      return 4294950743;
    v130 = v73;
    v76 = 0;
    v77 = *(unsigned __int16 **)(a1 + 16);
    while (CMPhotoDNGRead16(v77, *(unsigned __int8 *)(a1 + 26)) != 325)
    {
      v77 += 6;
      ++v76;
      v78 = *(unsigned __int16 *)(a1 + 24);
      if (v76 >= v78)
      {
        v79 = 0;
        LODWORD(v80) = 0;
        v81 = 0;
        goto LABEL_140;
      }
    }
    v82 = _readTag((uint64_t)v77, *(unsigned __int8 *)(a1 + 26));
    v81 = WORD1(v82);
    v80 = HIDWORD(v82);
    if (HIDWORD(v82) * tiffDataTypeToSize[WORD1(v82)] < 5)
      v79 = v77 + 4;
    else
      v79 = (unsigned __int16 *)(*(_QWORD *)a1 + v83);
    v84 = v146;
    if (v70 == 324)
    {
      if ((_DWORD)v144 != HIDWORD(v82) || v72 != 4 || WORD1(v82) - 3 > 1)
        return 4294950743;
      result = 4294950743;
      v87 = allocatora;
      if (!v130 || !v79)
        return result;
      _copyDNGDataTagToDict(a1, 52525, CFSTR("ProfileGainTableMapPacked"), a2);
      if ((int)v144 >= 2)
      {
        v88 = _getTagDataNvals(a1, 322, v147);
        v89 = _getTagDataNvals(a1, 323, v147);
        result = 4294950741;
        if (!v88)
          return result;
        if (!v89)
          return result;
        result = 4294950743;
        if (v88 > allocatora || v89 > v67)
          return result;
        goto LABEL_191;
      }
LABEL_190:
      v88 = v87;
      v89 = v67;
LABEL_191:
      v108 = _getTagDataNvals(a1, 259, v147);
      if (a5)
        *a5 = v87;
      if (a6)
        *a6 = v67;
      if (v84)
        *v84 = v88;
      if (v139)
        *v139 = v89;
      if (a9)
        *a9 = v140;
      if (a10)
        *a10 = v144;
      if (a11)
        *a11 = v108;
      if (a13)
        *a13 = v130;
      result = 0;
      if (a14)
        *a14 = v79;
      return result;
    }
    v78 = *(unsigned __int16 *)(a1 + 24);
LABEL_140:
    if (!v78)
      return 4294950743;
    v125 = v81;
    v127 = v79;
    v90 = 0;
    v91 = *(unsigned __int16 **)(a1 + 16);
    while (1)
    {
      v92 = CMPhotoDNGRead16(v91, *(unsigned __int8 *)(a1 + 26));
      if (v92 == 273)
        break;
      v91 += 6;
      ++v90;
      v93 = *(unsigned __int16 *)(a1 + 24);
      if (v90 >= v93)
        goto LABEL_151;
    }
    v94 = _readTag((uint64_t)v91, *(unsigned __int8 *)(a1 + 26));
    v72 = WORD1(v94);
    v144 = HIDWORD(v94);
    if (HIDWORD(v94) * tiffDataTypeToSize[WORD1(v94)] < 5)
      v96 = v91 + 4;
    else
      v96 = (unsigned __int16 *)(*(_QWORD *)a1 + v95);
    v130 = v96;
    v93 = *(unsigned __int16 *)(a1 + 24);
LABEL_151:
    if (v93)
    {
      v97 = 0;
      v98 = *(unsigned __int16 **)(a1 + 16);
      while (CMPhotoDNGRead16(v98, *(unsigned __int8 *)(a1 + 26)) != 279)
      {
        v98 += 6;
        if (++v97 >= *(unsigned __int16 *)(a1 + 24))
        {
          v93 = 0;
          goto LABEL_156;
        }
      }
      v99 = _readTag((uint64_t)v98, *(unsigned __int8 *)(a1 + 26));
      v125 = WORD1(v99);
      v80 = HIDWORD(v99);
      if (HIDWORD(v99) * tiffDataTypeToSize[WORD1(v99)] < 5)
        v79 = v98 + 4;
      else
        v79 = (unsigned __int16 *)(*(_QWORD *)a1 + v100);
      v93 = 1;
    }
    else
    {
LABEL_156:
      v79 = v127;
    }
    result = 4294950743;
    v84 = v146;
    if (v92 == 273)
    {
      v107 = v72 - 5;
      v87 = allocatora;
      if (v107 >= 0xFFFFFFFE)
      {
        if ((v125 - 3) >= 2)
          v93 = 0;
        if ((_DWORD)v144 == (_DWORD)v80 && v93)
        {
          if ((_DWORD)v144 != 1 || _getTagDataNvals(a1, 278, v147) != v67)
            return 4294950738;
          _copyDNGDataTagToDict(a1, 52525, CFSTR("ProfileGainTableMapPacked"), a2);
          LODWORD(v144) = 1;
          goto LABEL_190;
        }
      }
    }
  }
  return result;
}

uint64_t _getTagDataNvals(uint64_t a1, int a2, _DWORD *a3)
{
  unint64_t v4;
  int v7;
  unsigned __int16 *v8;
  uint64_t result;
  unint64_t Tag;
  uint64_t v11;

  LODWORD(v4) = *(unsigned __int16 *)(a1 + 24);
  if (*(_WORD *)(a1 + 24))
  {
    v7 = 0;
    v8 = *(unsigned __int16 **)(a1 + 16);
    while (CMPhotoDNGRead16(v8, *(unsigned __int8 *)(a1 + 26)) != a2)
    {
      v8 += 6;
      if (++v7 >= *(unsigned __int16 *)(a1 + 24))
      {
        LODWORD(v4) = 0;
        goto LABEL_6;
      }
    }
    Tag = _readTag((uint64_t)v8, *(unsigned __int8 *)(a1 + 26));
    result = v11;
    v4 = HIDWORD(Tag);
  }
  else
  {
LABEL_6:
    result = 0;
  }
  *a3 = v4;
  return result;
}

uint64_t _cmphotoDNGReaderOpenIFD(uint64_t a1, unsigned int a2)
{
  unsigned int v4;
  unsigned int v5;
  int v6;
  __int16 v7;
  uint64_t result;

  if (a2 < 8)
    return 4294950743;
  v4 = *(_DWORD *)(a1 + 8);
  v5 = v4 - a2;
  if (v4 <= a2)
    return 4294950743;
  if (v5 < 6)
    return 4294950743;
  v6 = CMPhotoDNGRead16((unsigned __int16 *)(*(_QWORD *)a1 + a2), *(unsigned __int8 *)(a1 + 26));
  if (v5 < 12 * v6 + 6)
    return 4294950743;
  v7 = v6;
  result = 0;
  *(_WORD *)(a1 + 24) = v7;
  *(_QWORD *)(a1 + 16) = *(_QWORD *)a1 + a2 + 2;
  return result;
}

CFStringRef _copyStringTag(uint64_t a1, int a2)
{
  int v4;
  unsigned __int16 *i;
  unint64_t Tag;
  unsigned int v7;
  unint64_t v8;
  const UInt8 *v9;

  if (!*(_WORD *)(a1 + 24))
    return 0;
  v4 = 0;
  for (i = *(unsigned __int16 **)(a1 + 16); CMPhotoDNGRead16(i, *(unsigned __int8 *)(a1 + 26)) != a2; i += 6)
  {
    if (++v4 >= *(unsigned __int16 *)(a1 + 24))
      return 0;
  }
  Tag = _readTag((uint64_t)i, *(unsigned __int8 *)(a1 + 26));
  v8 = HIDWORD(Tag);
  v9 = HIDWORD(Tag) * tiffDataTypeToSize[WORD1(Tag)] < 5
     ? (const UInt8 *)(i + 4)
     : (const UInt8 *)(*(_QWORD *)a1 + v7);
  if ((Tag & 0xFFFF0000) != 0x20000 || v9 == 0)
    return 0;
  if (HIDWORD(Tag) >= 2 && !v9[HIDWORD(Tag) - 1])
    LODWORD(v8) = HIDWORD(Tag) - 1;
  return CFStringCreateWithBytes((CFAllocatorRef)*MEMORY[0x1E0C9AE00], v9, (int)v8, 0x8000100u, 0);
}

void _copyStringTagToDict(uint64_t a1, int a2, const void *a3, __CFDictionary *a4)
{
  CFStringRef v6;
  CFStringRef v7;

  v6 = _copyStringTag(a1, a2);
  if (v6)
  {
    v7 = v6;
    CFDictionarySetValue(a4, a3, v6);
    CFRelease(v7);
  }
}

unint64_t _copyIntegerTagToDict(unint64_t result, int a2)
{
  unint64_t v3;
  int v4;
  unsigned __int16 *i;
  BOOL v6;

  if (*(_WORD *)(result + 24))
  {
    v3 = result;
    v4 = 0;
    for (i = *(unsigned __int16 **)(result + 16); ; i += 6)
    {
      result = CMPhotoDNGRead16(i, *(unsigned __int8 *)(v3 + 26));
      if ((_DWORD)result == a2)
        break;
      if (++v4 >= *(unsigned __int16 *)(v3 + 24))
        return result;
    }
    result = _readTag((uint64_t)i, *(unsigned __int8 *)(v3 + 26));
    v6 = HIDWORD(result) != 1 || WORD1(result) > 0xDu;
    if (!v6 && ((0x2BDFuLL >> SBYTE2(result)) & 1) != 0)
      return FigCFDictionarySetInt();
  }
  return result;
}

void _copyVersionToDictAsString(uint64_t a1, int a2, const void *a3, __CFDictionary *a4)
{
  int v8;
  unsigned __int16 *i;
  uint64_t Tag;
  unsigned int v11;
  unsigned __int8 *v12;
  CFMutableStringRef Mutable;
  __CFString *v15;
  unsigned int v16;
  unsigned int v17;
  unsigned int v18;
  unsigned int v19;

  if (*(_WORD *)(a1 + 24))
  {
    v8 = 0;
    for (i = *(unsigned __int16 **)(a1 + 16);
          CMPhotoDNGRead16(i, *(unsigned __int8 *)(a1 + 26)) != a2;
          i += 6)
    {
      if (++v8 >= *(unsigned __int16 *)(a1 + 24))
        return;
    }
    Tag = _readTag((uint64_t)i, *(unsigned __int8 *)(a1 + 26));
    if (HIDWORD(Tag) * tiffDataTypeToSize[WORD1(Tag)] < 5)
      v12 = (unsigned __int8 *)(i + 4);
    else
      v12 = (unsigned __int8 *)(*(_QWORD *)a1 + v11);
    if ((Tag & 0xFFFF0000) == 0x10000 && HIDWORD(Tag) == 4)
    {
      Mutable = CFStringCreateMutable((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0);
      if (Mutable)
      {
        v15 = Mutable;
        v16 = CMPhotoDNGRead8(v12);
        CFStringAppendFormat(v15, 0, CFSTR("%d"), v16);
        CFStringAppendFormat(v15, 0, CFSTR("."), 0);
        v17 = CMPhotoDNGRead8(v12 + 1);
        CFStringAppendFormat(v15, 0, CFSTR("%d"), v17);
        CFStringAppendFormat(v15, 0, CFSTR("."), 0);
        v18 = CMPhotoDNGRead8(v12 + 2);
        CFStringAppendFormat(v15, 0, CFSTR("%d"), v18);
        CFStringAppendFormat(v15, 0, CFSTR("."), 0);
        v19 = CMPhotoDNGRead8(v12 + 3);
        CFStringAppendFormat(v15, 0, CFSTR("%d"), v19);
        CFDictionarySetValue(a4, a3, v15);
        CFRelease(v15);
      }
    }
  }
}

uint64_t _copyRationalTagToDict(uint64_t a1, int a2, const void *a3, __CFDictionary *a4)
{
  int v8;
  unsigned __int16 *i;
  unint64_t Tag;
  unsigned int v11;
  CFIndex v12;
  unsigned int *v13;
  BOOL v14;
  CFMutableArrayRef Mutable;
  CFMutableArrayRef v16;
  uint64_t v18;

  if (!*(_WORD *)(a1 + 24))
    return 0;
  v8 = 0;
  for (i = *(unsigned __int16 **)(a1 + 16); CMPhotoDNGRead16(i, *(unsigned __int8 *)(a1 + 26)) != a2; i += 6)
  {
    if (++v8 >= *(unsigned __int16 *)(a1 + 24))
      return 0;
  }
  Tag = _readTag((uint64_t)i, *(unsigned __int8 *)(a1 + 26));
  v12 = HIDWORD(Tag);
  v13 = HIDWORD(Tag) * tiffDataTypeToSize[WORD1(Tag)] < 5
      ? (unsigned int *)(i + 4)
      : (unsigned int *)(*(_QWORD *)a1 + v11);
  v14 = WORD1(Tag) == 10 || WORD1(Tag) == 5;
  if (!v14 || !HIDWORD(Tag))
    return 0;
  if (HIDWORD(Tag) == 1)
  {
    CMPhotoDNGReadRational(v13, *(unsigned __int8 *)(a1 + 26));
    FigCFDictionarySetDouble();
    return 1;
  }
  Mutable = CFArrayCreateMutable((CFAllocatorRef)*MEMORY[0x1E0C9AE00], v12, MEMORY[0x1E0C9B378]);
  if (!Mutable)
    return 0;
  v16 = Mutable;
  while (1)
  {
    CMPhotoDNGReadRational(v13, *(unsigned __int8 *)(a1 + 26));
    if (FigCFArrayAppendDouble())
      break;
    v13 += 2;
    LODWORD(v12) = v12 - 1;
    if (!(_DWORD)v12)
    {
      CFDictionarySetValue(a4, a3, v16);
      v18 = 1;
      goto LABEL_25;
    }
  }
  v18 = 0;
LABEL_25:
  CFRelease(v16);
  return v18;
}

void _copyDNGDataTagToDict(uint64_t a1, int a2, const void *a3, __CFDictionary *a4)
{
  int v8;
  unsigned __int16 *i;
  unint64_t Tag;
  unsigned int v11;
  const UInt8 *v12;
  CFDataRef v13;
  CFDataRef v14;

  if (*(_WORD *)(a1 + 24))
  {
    v8 = 0;
    for (i = *(unsigned __int16 **)(a1 + 16);
          CMPhotoDNGRead16(i, *(unsigned __int8 *)(a1 + 26)) != a2;
          i += 6)
    {
      if (++v8 >= *(unsigned __int16 *)(a1 + 24))
        return;
    }
    Tag = _readTag((uint64_t)i, *(unsigned __int8 *)(a1 + 26));
    if (HIDWORD(Tag) * tiffDataTypeToSize[WORD1(Tag)] < 5)
      v12 = (const UInt8 *)(i + 4);
    else
      v12 = (const UInt8 *)(*(_QWORD *)a1 + v11);
    if (HIDWORD(Tag))
    {
      v13 = CFDataCreate((CFAllocatorRef)*MEMORY[0x1E0C9AE00], v12, HIDWORD(Tag));
      if (v13)
      {
        v14 = v13;
        CFDictionarySetValue(a4, a3, v13);
        CFRelease(v14);
      }
    }
  }
}

void _copyDoublesToDictAsArray(uint64_t a1, const void *a2, __CFDictionary *a3)
{
  int v6;
  unsigned __int16 *i;
  unint64_t Tag;
  unsigned int v9;
  CFIndex v10;
  unint64_t *v11;
  CFMutableArrayRef Mutable;
  __CFArray *v13;
  double v14;

  if (*(_WORD *)(a1 + 24))
  {
    v6 = 0;
    for (i = *(unsigned __int16 **)(a1 + 16);
          CMPhotoDNGRead16(i, *(unsigned __int8 *)(a1 + 26)) != 51041;
          i += 6)
    {
      if (++v6 >= *(unsigned __int16 *)(a1 + 24))
        return;
    }
    Tag = _readTag((uint64_t)i, *(unsigned __int8 *)(a1 + 26));
    v10 = HIDWORD(Tag);
    if (HIDWORD(Tag) * tiffDataTypeToSize[WORD1(Tag)] < 5)
      v11 = (unint64_t *)(i + 4);
    else
      v11 = (unint64_t *)(*(_QWORD *)a1 + v9);
    if ((Tag & 0xFFFF0000) == 0xC0000)
    {
      Mutable = CFArrayCreateMutable((CFAllocatorRef)*MEMORY[0x1E0C9AE00], v10, MEMORY[0x1E0C9B378]);
      if (Mutable)
      {
        v13 = Mutable;
        if ((_DWORD)v10)
        {
          while (1)
          {
            v14 = CMPhotoDNGReadDouble(v11, *(unsigned __int8 *)(a1 + 26));
            if (CMPhotoCFArrayAppendDouble(v13, v14))
              break;
            ++v11;
            LODWORD(v10) = v10 - 1;
            if (!(_DWORD)v10)
              goto LABEL_14;
          }
        }
        else
        {
LABEL_14:
          CFDictionarySetValue(a3, a2, v13);
        }
        CFRelease(v13);
      }
    }
  }
}

__CFArray *_createFloatArrayFromRationals(uint64_t a1, int a2, int a3)
{
  int v6;
  unsigned __int16 *i;
  unint64_t Tag;
  unsigned int v9;
  int v10;
  unsigned int *v11;
  BOOL v12;
  const __CFAllocator *v13;
  __CFArray *j;
  uint64_t v15;
  double v16;
  double v17;
  double v18;
  float v19;
  CFNumberRef v20;
  float valuePtr;

  if (!*(_WORD *)(a1 + 24))
    return 0;
  v6 = 0;
  for (i = *(unsigned __int16 **)(a1 + 16); CMPhotoDNGRead16(i, *(unsigned __int8 *)(a1 + 26)) != a2; i += 6)
  {
    if (++v6 >= *(unsigned __int16 *)(a1 + 24))
      return 0;
  }
  Tag = _readTag((uint64_t)i, *(unsigned __int8 *)(a1 + 26));
  v10 = WORD1(Tag);
  if (HIDWORD(Tag) * tiffDataTypeToSize[WORD1(Tag)] > 4)
  {
    if (*(_QWORD *)a1)
    {
      v11 = (unsigned int *)(*(_QWORD *)a1 + v9);
      goto LABEL_10;
    }
    return 0;
  }
  v11 = (unsigned int *)(i + 4);
LABEL_10:
  v12 = WORD1(Tag) == 10 || WORD1(Tag) == 5;
  if (!v12 || HIDWORD(Tag) != a3)
    return 0;
  v13 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
  for (j = CFArrayCreateMutable((CFAllocatorRef)*MEMORY[0x1E0C9AE00], HIDWORD(Tag), MEMORY[0x1E0C9B378]); a3; --a3)
  {
    v15 = CMPhotoDNGReadRational(v11, *(unsigned __int8 *)(a1 + 26));
    if (HIDWORD(v15))
    {
      if (v10 == 5)
      {
        v16 = (double)v15;
        v17 = (double)HIDWORD(v15);
      }
      else
      {
        v16 = (double)(int)v15;
        v17 = (double)SHIDWORD(v15);
      }
      v18 = v16 / v17;
    }
    else
    {
      v18 = 0.0;
    }
    v19 = v18;
    valuePtr = v19;
    v20 = CFNumberCreate(v13, kCFNumberFloatType, &valuePtr);
    CFArrayAppendValue(j, v20);
    if (v20)
      CFRelease(v20);
    v11 += 2;
  }
  return j;
}

uint64_t _copyShortsOrLongOrRationalToDictAsArray(uint64_t a1, const void *a2, __CFDictionary *a3)
{
  int v6;
  unsigned __int16 *i;
  unsigned int v9;

  if (!*(_WORD *)(a1 + 24))
    return 0;
  v6 = 0;
  for (i = *(unsigned __int16 **)(a1 + 16);
        CMPhotoDNGRead16(i, *(unsigned __int8 *)(a1 + 26)) != 50714;
        i += 6)
  {
    if (++v6 >= *(unsigned __int16 *)(a1 + 24))
      return 0;
  }
  v9 = _readTag((uint64_t)i, *(unsigned __int8 *)(a1 + 26)) >> 16;
  if (v9 == 3)
    return _copyShortsToDictAsArray(a1, 50714, a2, a3);
  if (v9 != 4)
  {
    if (v9 == 5)
      return _copyRationalTagToDict(a1, 50714, a2, a3);
    return 0;
  }
  return _copyLongsToDictAsArray(a1, 50714, a2, a3);
}

BOOL _copyShortsToDictAsArray(uint64_t a1, int a2, const void *a3, __CFDictionary *a4)
{
  int v8;
  unsigned __int16 *i;
  unint64_t Tag;
  unsigned int v11;
  CFIndex v12;
  unsigned __int16 *v13;
  CFMutableArrayRef Mutable;
  CFMutableArrayRef v15;
  int appended;
  int v17;

  if (!*(_WORD *)(a1 + 24))
    return 0;
  v8 = 0;
  for (i = *(unsigned __int16 **)(a1 + 16); CMPhotoDNGRead16(i, *(unsigned __int8 *)(a1 + 26)) != a2; i += 6)
  {
    if (++v8 >= *(unsigned __int16 *)(a1 + 24))
      return 0;
  }
  Tag = _readTag((uint64_t)i, *(unsigned __int8 *)(a1 + 26));
  v12 = HIDWORD(Tag);
  v13 = HIDWORD(Tag) * tiffDataTypeToSize[WORD1(Tag)] < 5
      ? i + 4
      : (unsigned __int16 *)(*(_QWORD *)a1 + v11);
  if ((Tag & 0xFFFF0000) != 0x30000)
    return 0;
  Mutable = CFArrayCreateMutable((CFAllocatorRef)*MEMORY[0x1E0C9AE00], v12, MEMORY[0x1E0C9B378]);
  if (Mutable)
  {
    v15 = Mutable;
    if ((_DWORD)v12)
    {
      while (1)
      {
        CMPhotoDNGRead16(v13, *(unsigned __int8 *)(a1 + 26));
        appended = FigCFArrayAppendInt32();
        if (appended)
          break;
        ++v13;
        LODWORD(v12) = v12 - 1;
        if (!(_DWORD)v12)
          goto LABEL_14;
      }
      v17 = appended;
    }
    else
    {
LABEL_14:
      CFDictionarySetValue(a4, a3, v15);
      v17 = 0;
    }
    CFRelease(v15);
  }
  else
  {
    v17 = -16551;
  }
  return v17 == 0;
}

BOOL _copyLongsToDictAsArray(uint64_t a1, int a2, const void *a3, __CFDictionary *a4)
{
  int v8;
  unsigned __int16 *i;
  unint64_t Tag;
  unsigned int v11;
  CFIndex v12;
  unsigned int *v13;
  CFMutableArrayRef Mutable;
  __CFArray *v15;
  int v16;
  int appended;
  int v18;

  if (!*(_WORD *)(a1 + 24))
    return 0;
  v8 = 0;
  for (i = *(unsigned __int16 **)(a1 + 16); CMPhotoDNGRead16(i, *(unsigned __int8 *)(a1 + 26)) != a2; i += 6)
  {
    if (++v8 >= *(unsigned __int16 *)(a1 + 24))
      return 0;
  }
  Tag = _readTag((uint64_t)i, *(unsigned __int8 *)(a1 + 26));
  v12 = HIDWORD(Tag);
  v13 = HIDWORD(Tag) * tiffDataTypeToSize[WORD1(Tag)] < 5
      ? (unsigned int *)(i + 4)
      : (unsigned int *)(*(_QWORD *)a1 + v11);
  if ((Tag & 0xFFFF0000) != 0x40000)
    return 0;
  Mutable = CFArrayCreateMutable((CFAllocatorRef)*MEMORY[0x1E0C9AE00], v12, MEMORY[0x1E0C9B378]);
  if (Mutable)
  {
    v15 = Mutable;
    if ((_DWORD)v12)
    {
      while (1)
      {
        v16 = CMPhotoDNGRead32(v13, *(unsigned __int8 *)(a1 + 26));
        appended = CMPhotoCFArrayAppendInt32(v15, v16);
        if (appended)
          break;
        ++v13;
        LODWORD(v12) = v12 - 1;
        if (!(_DWORD)v12)
          goto LABEL_14;
      }
      v18 = appended;
    }
    else
    {
LABEL_14:
      CFDictionarySetValue(a4, a3, v15);
      v18 = 0;
    }
    CFRelease(v15);
  }
  else
  {
    v18 = -16551;
  }
  return v18 == 0;
}

uint64_t _getTagRational(uint64_t a1, int a2, uint64_t *a3)
{
  int v6;
  unsigned __int16 *i;
  uint64_t Tag;
  unsigned int v9;
  unsigned int *v10;

  if (!*(_WORD *)(a1 + 24))
    return 0;
  v6 = 0;
  for (i = *(unsigned __int16 **)(a1 + 16); CMPhotoDNGRead16(i, *(unsigned __int8 *)(a1 + 26)) != a2; i += 6)
  {
    if (++v6 >= *(unsigned __int16 *)(a1 + 24))
      return 0;
  }
  Tag = _readTag((uint64_t)i, *(unsigned __int8 *)(a1 + 26));
  v10 = HIDWORD(Tag) * tiffDataTypeToSize[WORD1(Tag)] < 5
      ? (unsigned int *)(i + 4)
      : (unsigned int *)(*(_QWORD *)a1 + v9);
  if (HIDWORD(Tag) != 1)
    return 0;
  if (WORD1(Tag) != 10 && WORD1(Tag) != 5)
    return 0;
  *a3 = CMPhotoDNGReadRational(v10, *(unsigned __int8 *)(a1 + 26));
  return 1;
}

uint64_t CreateThreadContext(int a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4;
  uint64_t *v5;

  LODWORD(v4) = a1;
  *(_DWORD *)a3 = a1;
  *(_DWORD *)(a3 + 4) = 4 * (int)a2 * HIDWORD(a2) / (unint64_t)a1;
  *(_QWORD *)(a3 + 72) = operator new[]();
  if ((int)v4 >= 1)
  {
    v4 = v4;
    v5 = (uint64_t *)(a3 + 8);
    do
    {
      *v5++ = operator new[]();
      --v4;
    }
    while (v4);
  }
  return 0;
}

uint64_t DestroyThreadContext(uint64_t a1)
{
  int v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t result;

  v2 = *(_DWORD *)a1;
  if (*(int *)a1 >= 1)
  {
    v3 = 1;
    do
    {
      v4 = *(_QWORD *)(a1 + 8 * v3);
      if (v4)
      {
        MEMORY[0x1A85D0A14](v4, 0x1000C8077774924);
        v2 = *(_DWORD *)a1;
      }
    }
    while (v3++ < v2);
  }
  result = *(_QWORD *)(a1 + 72);
  if (result)
    JUMPOUT(0x1A85D0A14);
  return result;
}

uint64_t EncodeFrameThreads(unsigned int *a1, unsigned __int16 *a2, signed int a3, _WORD *a4, int a5, int a6)
{
  unsigned __int16 *v8;
  void *v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  unsigned int v14;
  uint64_t v15;
  __int16 v16;
  uint64_t v17;
  uint64_t v18;
  char *v19;
  int v20;
  uint64_t v21;
  int v22;
  int v23;
  int v24;
  int v25;
  int v26;
  std::__thread_struct *v27;
  uint64_t v28;
  int v29;
  int v30;
  uint64_t v31;
  uint64_t v32;
  int v33;
  char *v34;
  unsigned int *v35;
  int v36;
  char *v37;
  char *v38;
  uint64_t v39;
  char v40;
  uint64_t v42;
  _WORD *v43;
  int64_t v44;
  pthread_t v45;
  _QWORD v46[3];
  int v47;
  int v48;
  unsigned __int16 *v49;
  unsigned int *v50;
  uint64_t *v51[2];

  v8 = a2;
  v51[1] = *(uint64_t **)MEMORY[0x1E0C80C00];
  v49 = a2;
  v50 = a1;
  v47 = a6;
  v48 = a5;
  v10 = (void *)*((_QWORD *)a1 + 9);
  v11 = (char *)(a4 + 2);
  bzero(v10, 0x20000uLL);
  if (a3 >= 2)
  {
    v13 = 2 * (a3 >> 1);
    do
    {
      v14 = *v8++;
      *((_WORD *)v10 + v14) = 1;
      v13 -= 2;
    }
    while (v13);
  }
  v15 = 0;
  v16 = 0;
  do
  {
    if (*((_WORD *)v10 + v15) == 1)
    {
      *((_WORD *)v10 + v15) = v16++;
      *(_WORD *)v11 = v15;
      v11 += 2;
    }
    ++v15;
  }
  while (v15 != 0x10000);
  *a4 = 23043;
  a4[1] = v16;
  v17 = *a1;
  MEMORY[0x1E0C80A78](v12);
  v19 = (char *)&v42 - v18;
  std::vector<std::thread>::vector(v46, (int)v17);
  v20 = (_DWORD)v11 - (_DWORD)a4;
  if ((int)v17 < 1)
  {
    v33 = 0;
  }
  else
  {
    v43 = a4;
    v44 = v11 - (char *)a4;
    v21 = 0;
    v22 = 0;
    v23 = a3 / (int)v17;
    v24 = a3 % (int)v17;
    v25 = a3 / (int)v17;
    do
    {
      if ((_DWORD)v17 - 1 == v21)
        v26 = v24;
      else
        v26 = 0;
      v27 = (std::__thread_struct *)operator new();
      std::__thread_struct::__thread_struct(v27);
      v28 = operator new();
      v29 = v26 + v25;
      *(_QWORD *)v28 = v27;
      *(_QWORD *)(v28 + 8) = v17;
      *(_QWORD *)(v28 + 16) = v19;
      *(_QWORD *)(v28 + 24) = &v49;
      *(_QWORD *)(v28 + 32) = &v50;
      *(_QWORD *)(v28 + 40) = &v48;
      *(_QWORD *)(v28 + 48) = &v47;
      *(_DWORD *)(v28 + 56) = v22;
      *(_DWORD *)(v28 + 60) = v29;
      *(_DWORD *)(v28 + 64) = v21;
      v51[0] = (uint64_t *)v28;
      v30 = pthread_create(&v45, 0, (void *(__cdecl *)(void *))std::__thread_proxy[abi:ne180100]<std::tuple<std::unique_ptr<std::__thread_struct>,EncodeFrameThreads::$_0,int,int,int>>, (void *)v28);
      if (v30)
      {
        std::__throw_system_error(v30, "thread constructor failed");
        __break(1u);
      }
      v51[0] = 0;
      std::unique_ptr<std::tuple<std::unique_ptr<std::__thread_struct>,EncodeFrameThreads::$_0,int,int,int>>::~unique_ptr[abi:ne180100](v51);
      if (*(_QWORD *)(v46[0] + 8 * v21))
        std::terminate();
      *(_QWORD *)(v46[0] + 8 * v21) = v45;
      v45 = 0;
      std::thread::~thread((std::thread *)&v45);
      v25 = v29 + v23;
      ++v21;
      v22 = v29;
    }
    while (v17 != v21);
    v31 = 0;
    v20 = v44;
    do
    {
      std::thread::join((std::thread *)(v46[0] + v31));
      v31 += 8;
    }
    while (8 * v17 != v31);
    v32 = 0;
    v33 = 0;
    v34 = (char *)v43 + v20;
    v35 = v50;
    do
    {
      v36 = *(_DWORD *)&v19[4 * v32];
      if (v36 >= 1)
      {
        v37 = &v34[v33];
        v38 = *(char **)&v35[2 * v32 + 2];
        v39 = *(unsigned int *)&v19[4 * v32];
        do
        {
          v40 = *v38++;
          *v37++ = v40;
          --v39;
        }
        while (v39);
      }
      v33 += v36;
      ++v32;
    }
    while (v32 != v17);
  }
  v51[0] = v46;
  std::vector<std::thread>::__destroy_vector::operator()[abi:ne180100]((void ***)v51);
  return (v33 + v20);
}

void sub_1A82868A8(_Unwind_Exception *exception_object)
{
  _Unwind_Resume(exception_object);
}

_QWORD *std::vector<std::thread>::vector(_QWORD *a1, unint64_t a2)
{
  char *v4;

  *a1 = 0;
  a1[1] = 0;
  a1[2] = 0;
  if (a2)
  {
    std::vector<std::thread>::__vallocate[abi:ne180100](a1, a2);
    v4 = (char *)a1[1];
    bzero(v4, 8 * a2);
    a1[1] = &v4[8 * a2];
  }
  return a1;
}

void sub_1A828697C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void **a9)
{
  std::vector<std::thread>::__destroy_vector::operator()[abi:ne180100](&a9);
  _Unwind_Resume(a1);
}

char *std::vector<std::thread>::__vallocate[abi:ne180100](_QWORD *a1, unint64_t a2)
{
  char *result;
  uint64_t v4;

  if (a2 >> 61)
    std::vector<std::thread>::__throw_length_error[abi:ne180100]();
  result = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<std::thread>>((uint64_t)(a1 + 2), a2);
  *a1 = result;
  a1[1] = result;
  a1[2] = &result[8 * v4];
  return result;
}

void std::vector<std::thread>::__throw_length_error[abi:ne180100]()
{
  std::__throw_length_error[abi:ne180100]("vector");
}

void *std::__allocate_at_least[abi:ne180100]<std::allocator<std::thread>>(uint64_t a1, unint64_t a2)
{
  if (a2 >> 61)
    std::__throw_bad_array_new_length[abi:ne180100]();
  return operator new(8 * a2);
}

void std::__throw_length_error[abi:ne180100](const char *a1)
{
  std::logic_error *exception;

  exception = (std::logic_error *)__cxa_allocate_exception(0x10uLL);
  std::length_error::length_error[abi:ne180100](exception, a1);
  __cxa_throw(exception, (struct type_info *)off_1E53F2638, MEMORY[0x1E0DE42D0]);
}

void sub_1A8286A54(_Unwind_Exception *a1)
{
  void *v1;

  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

std::logic_error *std::length_error::length_error[abi:ne180100](std::logic_error *a1, const char *a2)
{
  std::logic_error *result;

  result = std::logic_error::logic_error(a1, a2);
  result->__vftable = (std::logic_error_vtbl *)(MEMORY[0x1E0DE5020] + 16);
  return result;
}

void std::__throw_bad_array_new_length[abi:ne180100]()
{
  std::bad_array_new_length *exception;
  std::bad_array_new_length *v1;

  exception = (std::bad_array_new_length *)__cxa_allocate_exception(8uLL);
  v1 = std::bad_array_new_length::bad_array_new_length(exception);
  __cxa_throw(v1, MEMORY[0x1E0DE4E98], MEMORY[0x1E0DE4390]);
}

void std::vector<std::thread>::__destroy_vector::operator()[abi:ne180100](void ***a1)
{
  void **v1;
  std::thread *v2;
  std::thread *v4;
  void *v5;

  v1 = *a1;
  v2 = (std::thread *)**a1;
  if (v2)
  {
    v4 = (std::thread *)v1[1];
    v5 = v2;
    if (v4 != v2)
    {
      do
        std::thread::~thread(v4 - 1);
      while (v4 != v2);
      v5 = **a1;
    }
    v1[1] = v2;
    operator delete(v5);
  }
}

uint64_t std::__thread_proxy[abi:ne180100]<std::tuple<std::unique_ptr<std::__thread_struct>,EncodeFrameThreads::$_0,int,int,int>>(uint64_t *a1)
{
  std::__thread_specific_ptr<std::__thread_struct> *v1;
  const void *v2;
  uint64_t *v3;
  uint64_t v4;
  uint64_t v5;
  unsigned __int16 *v6;
  unsigned int v7;
  uint64_t v8;
  _BYTE *v9;
  int v10;
  unsigned int v11;
  uint64_t v12;
  unsigned int v13;
  unsigned int v14;
  _BYTE *v15;
  int v16;
  unsigned __int16 *v17;
  unsigned __int16 *v18;
  int v19;
  int v20;
  unsigned int v21;
  unsigned int v22;
  int v23;
  char v24;
  unsigned int v25;
  uint64_t *v27;

  v27 = a1;
  v1 = std::__thread_local_data();
  v2 = (const void *)*v27;
  *v27 = 0;
  pthread_setspecific(v1->__key_, v2);
  v3 = v27;
  v4 = *((int *)v27 + 14);
  v5 = *((int *)v27 + 16);
  v6 = (unsigned __int16 *)(*(_QWORD *)v27[3] + v4);
  v7 = *((_DWORD *)v27 + 15) - v4;
  v8 = *(_QWORD *)v27[4];
  v9 = *(_BYTE **)(v8 + 8 * v5 + 8);
  v10 = *(_DWORD *)v27[5];
  v11 = *(_DWORD *)v27[6];
  v12 = *(_QWORD *)(v8 + 72);
  v13 = v7 >> 1;
  v14 = *(unsigned __int16 *)(v12 + 2 * *v6);
  *v9 = (v14 >> 12) | 0xF0;
  v9[1] = v14 >> 4;
  v15 = v9 + 2;
  v16 = 16 * v14;
  if (v13 == 1)
  {
LABEL_27:
    *v15 = v16 + 13;
    LODWORD(v15) = (_DWORD)v15 + 1;
    goto LABEL_28;
  }
  v17 = &v6[v13];
  v18 = v6 + 1;
  v19 = 1;
  v20 = 1;
  do
  {
    v21 = v14;
    v14 = *(unsigned __int16 *)(v12 + 2 * *v18);
    v22 = v14 - v21;
    v23 = (__int16)(v14 - v21);
    if (v23 < 0)
      v23 = -v23;
    if ((unsigned __int16)v23 <= 6u)
    {
      v22 += 6;
      if (!v20)
      {
        v24 = 0;
        goto LABEL_14;
      }
      v20 = 0;
      v16 += v22;
      *v15++ = v16;
LABEL_16:
      v24 = 1;
      goto LABEL_19;
    }
    if (v20)
    {
      v16 += 15;
      *v15 = v16;
      if ((unsigned __int16)(v22 + 64) <= 0x7Fu)
      {
        v20 = 0;
        v15[1] = v22 - 64;
        v24 = 1;
        v15 += 2;
        goto LABEL_19;
      }
      v20 = 0;
      *(_WORD *)(v15 + 1) = __rev16(v14);
      v15 += 3;
      goto LABEL_16;
    }
    if ((unsigned __int16)(v22 + 64) > 0x7Fu)
    {
      v24 = 0;
      *v15 = (v14 >> 12) | 0xF0;
      v15[1] = v14 >> 4;
      v15 += 2;
      v16 = 16 * v14;
      goto LABEL_18;
    }
    v24 = 0;
    *v15++ = ((v22 + 192) >> 4) - 16;
LABEL_14:
    v16 = 16 * v22;
LABEL_18:
    v20 = 1;
LABEL_19:
    if (v19 + 1 == v10)
      v25 = v11;
    else
      v25 = 0;
    v18 += v25 + 1;
    if (v19 + 1 == v10)
      v19 = 0;
    else
      ++v19;
  }
  while (v18 != v17);
  if ((v24 & 1) == 0)
    goto LABEL_27;
LABEL_28:
  *(_DWORD *)(v3[2] + 4 * v5) = (_DWORD)v15 - (_DWORD)v9;
  std::unique_ptr<std::tuple<std::unique_ptr<std::__thread_struct>,EncodeFrameThreads::$_0,int,int,int>>::~unique_ptr[abi:ne180100](&v27);
  return 0;
}

void sub_1A8286D0C(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_list va;

  va_start(va, a2);
  std::unique_ptr<std::tuple<std::unique_ptr<std::__thread_struct>,EncodeFrameThreads::$_0,int,int,int>>::~unique_ptr[abi:ne180100]((uint64_t **)va);
  _Unwind_Resume(a1);
}

uint64_t **std::unique_ptr<std::tuple<std::unique_ptr<std::__thread_struct>,EncodeFrameThreads::$_0,int,int,int>>::~unique_ptr[abi:ne180100](uint64_t **a1)
{
  uint64_t *v2;

  v2 = *a1;
  *a1 = 0;
  if (v2)
  {
    std::unique_ptr<std::__thread_struct>::reset[abi:ne180100](v2, 0);
    MEMORY[0x1A85D0A2C](v2, 0x10B0C40A21EAA3BLL);
  }
  return a1;
}

uint64_t std::unique_ptr<std::__thread_struct>::reset[abi:ne180100](uint64_t *a1, uint64_t a2)
{
  uint64_t result;

  result = *a1;
  *a1 = a2;
  if (result)
  {
    MEMORY[0x1A85D09CC]();
    JUMPOUT(0x1A85D0A2CLL);
  }
  return result;
}

void vectorload_1x16_packed10_cold_1()
{
  __assert_rtn("vectorload_1x16_packed10", "SlimXPackInlines.h", 361, "0");
}

void CMPhotoInterchangeCompactEncode_cold_1()
{
  __assert_rtn("_compact", "CMPhotoInterchangeCompact.m", 172, "size == dataLength");
}

void CMPhotoInterchangeCompactDecode_cold_1()
{
  __assert_rtn("_expand", "CMPhotoInterchangeCompact.m", 208, "size == dataLength");
}

void _logHang_cold_1()
{
  uint8_t v0[16];

  *(_WORD *)v0 = 0;
  _os_log_fault_impl(&dword_1A819D000, MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT, "CMPhoto: Hang detected while waiting for callbacks from decoder. Please file a radar to CoreMedia Photo | all.", v0, 2u);
}

void _startDecoderSession_cold_1()
{
  __assert_rtn("_startDecoderSession", "SlimVideoDecoder.c", 358, "NULL != storage->slimHandle->root");
}

void CreateTreeLeaves_cold_1()
{
  __assert_rtn("CreateTreeLeaves", "SlimPack.c", 631, "NULL != leaves_ptr[i]");
}

void CreateHuffTree_cold_1()
{
  __assert_rtn("CreateHuffTree", "SlimPack.c", 665, "i <1024");
}

void CreateHuffTree_cold_2()
{
  __assert_rtn("CreateHuffTree", "SlimPack.c", 666, "leaves_ptr[i] != NULL");
}

void CreateHuffTree_cold_3()
{
  __assert_rtn("CreateHuffTree", "SlimPack.c", 667, "node!=NULL");
}

void SlimDecodeFrame_cold_1()
{
  __assert_rtn("SlimDecodeFrame", "SlimPack.c", 944, "(slimHandle->pixelFormat == '2vuy' || slimHandle->pixelFormat == 'yuvs' || slimHandle->pixelFormat == '420v' || slimHandle->pixelFormat == '420f' || slimHandle->pixelFormat == 'bgg4' || slimHandle->pixelFormat == '444f' || slimHandle->pixelFormat == '444v' || slimHandle->pixelFormat == 'yuvf' || slimHandle->pixelFormat == 'L016' || slimHandle->pixelFormat == '13.3' || slimHandle->pixelFormat == 'L00h')");
}

void SlimDecodeFrame_cold_2()
{
  __assert_rtn("SlimDecodeFrame", "SlimPack.c", 976, "NULL != in32 || NULL != out32 || NULL != out16");
}

void SlimDecodeFrame_cold_3()
{
  __assert_rtn("UnHuffBgg4", "SlimPack.c", 713, "NULL != *in");
}

void SlimDecodeFrame_cold_4()
{
  __assert_rtn("SlimDecodeFrame", "SlimPack.c", 940, "(slimHandle->width >= 16) && (slimHandle->height >= 16)");
}

void *__cdecl CFAllocatorAllocate(CFAllocatorRef allocator, CFIndex size, CFOptionFlags hint)
{
  return (void *)MEMORY[0x1E0C97C98](allocator, size, hint);
}

CFAllocatorRef CFAllocatorCreate(CFAllocatorRef allocator, CFAllocatorContext *context)
{
  return (CFAllocatorRef)MEMORY[0x1E0C97CA8](allocator, context);
}

void CFAllocatorDeallocate(CFAllocatorRef allocator, void *ptr)
{
  MEMORY[0x1E0C97CB0](allocator, ptr);
}

void CFArrayAppendArray(CFMutableArrayRef theArray, CFArrayRef otherArray, CFRange otherRange)
{
  MEMORY[0x1E0C97CE8](theArray, otherArray, otherRange.location, otherRange.length);
}

void CFArrayAppendValue(CFMutableArrayRef theArray, const void *value)
{
  MEMORY[0x1E0C97CF8](theArray, value);
}

void CFArrayApplyFunction(CFArrayRef theArray, CFRange range, CFArrayApplierFunction applier, void *context)
{
  MEMORY[0x1E0C97D00](theArray, range.location, range.length, applier, context);
}

CFIndex CFArrayBSearchValues(CFArrayRef theArray, CFRange range, const void *value, CFComparatorFunction comparator, void *context)
{
  return MEMORY[0x1E0C97D08](theArray, range.location, range.length, value, comparator, context);
}

CFArrayRef CFArrayCreate(CFAllocatorRef allocator, const void **values, CFIndex numValues, const CFArrayCallBacks *callBacks)
{
  return (CFArrayRef)MEMORY[0x1E0C97D20](allocator, values, numValues, callBacks);
}

CFMutableArrayRef CFArrayCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFArrayCallBacks *callBacks)
{
  return (CFMutableArrayRef)MEMORY[0x1E0C97D38](allocator, capacity, callBacks);
}

CFMutableArrayRef CFArrayCreateMutableCopy(CFAllocatorRef allocator, CFIndex capacity, CFArrayRef theArray)
{
  return (CFMutableArrayRef)MEMORY[0x1E0C97D50](allocator, capacity, theArray);
}

CFIndex CFArrayGetCount(CFArrayRef theArray)
{
  return MEMORY[0x1E0C97D60](theArray);
}

CFIndex CFArrayGetFirstIndexOfValue(CFArrayRef theArray, CFRange range, const void *value)
{
  return MEMORY[0x1E0C97D78](theArray, range.location, range.length, value);
}

CFTypeID CFArrayGetTypeID(void)
{
  return MEMORY[0x1E0C97D90]();
}

const void *__cdecl CFArrayGetValueAtIndex(CFArrayRef theArray, CFIndex idx)
{
  return (const void *)MEMORY[0x1E0C97D98](theArray, idx);
}

void CFArrayGetValues(CFArrayRef theArray, CFRange range, const void **values)
{
  MEMORY[0x1E0C97DA8](theArray, range.location, range.length, values);
}

void CFArrayInsertValueAtIndex(CFMutableArrayRef theArray, CFIndex idx, const void *value)
{
  MEMORY[0x1E0C97DB0](theArray, idx, value);
}

void CFArrayRemoveAllValues(CFMutableArrayRef theArray)
{
  MEMORY[0x1E0C97DB8](theArray);
}

void CFArrayRemoveValueAtIndex(CFMutableArrayRef theArray, CFIndex idx)
{
  MEMORY[0x1E0C97DC0](theArray, idx);
}

void CFArraySetValueAtIndex(CFMutableArrayRef theArray, CFIndex idx, const void *value)
{
  MEMORY[0x1E0C97DD0](theArray, idx, value);
}

void CFArraySortValues(CFMutableArrayRef theArray, CFRange range, CFComparatorFunction comparator, void *context)
{
  MEMORY[0x1E0C97DE0](theArray, range.location, range.length, comparator, context);
}

CFTypeRef CFAutorelease(CFTypeRef arg)
{
  return (CFTypeRef)MEMORY[0x1E0C97E90](arg);
}

CFTypeID CFBooleanGetTypeID(void)
{
  return MEMORY[0x1E0C97FC8]();
}

Boolean CFBooleanGetValue(CFBooleanRef BOOLean)
{
  return MEMORY[0x1E0C97FE0](BOOLean);
}

CFStringRef CFCopyDescription(CFTypeRef cf)
{
  return (CFStringRef)MEMORY[0x1E0C98350](cf);
}

void CFDataAppendBytes(CFMutableDataRef theData, const UInt8 *bytes, CFIndex length)
{
  MEMORY[0x1E0C98390](theData, bytes, length);
}

CFDataRef CFDataCreate(CFAllocatorRef allocator, const UInt8 *bytes, CFIndex length)
{
  return (CFDataRef)MEMORY[0x1E0C983A0](allocator, bytes, length);
}

CFDataRef CFDataCreateCopy(CFAllocatorRef allocator, CFDataRef theData)
{
  return (CFDataRef)MEMORY[0x1E0C983B0](allocator, theData);
}

CFMutableDataRef CFDataCreateMutable(CFAllocatorRef allocator, CFIndex capacity)
{
  return (CFMutableDataRef)MEMORY[0x1E0C983B8](allocator, capacity);
}

CFMutableDataRef CFDataCreateMutableCopy(CFAllocatorRef allocator, CFIndex capacity, CFDataRef theData)
{
  return (CFMutableDataRef)MEMORY[0x1E0C983C0](allocator, capacity, theData);
}

CFDataRef CFDataCreateWithBytesNoCopy(CFAllocatorRef allocator, const UInt8 *bytes, CFIndex length, CFAllocatorRef bytesDeallocator)
{
  return (CFDataRef)MEMORY[0x1E0C983C8](allocator, bytes, length, bytesDeallocator);
}

void CFDataDeleteBytes(CFMutableDataRef theData, CFRange range)
{
  MEMORY[0x1E0C983D0](theData, range.location, range.length);
}

const UInt8 *__cdecl CFDataGetBytePtr(CFDataRef theData)
{
  return (const UInt8 *)MEMORY[0x1E0C983E0](theData);
}

void CFDataGetBytes(CFDataRef theData, CFRange range, UInt8 *buffer)
{
  MEMORY[0x1E0C983F0](theData, range.location, range.length, buffer);
}

CFIndex CFDataGetLength(CFDataRef theData)
{
  return MEMORY[0x1E0C983F8](theData);
}

UInt8 *__cdecl CFDataGetMutableBytePtr(CFMutableDataRef theData)
{
  return (UInt8 *)MEMORY[0x1E0C98408](theData);
}

CFTypeID CFDataGetTypeID(void)
{
  return MEMORY[0x1E0C98418]();
}

void CFDataIncreaseLength(CFMutableDataRef theData, CFIndex extraLength)
{
  MEMORY[0x1E0C98420](theData, extraLength);
}

void CFDataReplaceBytes(CFMutableDataRef theData, CFRange range, const UInt8 *newBytes, CFIndex newLength)
{
  MEMORY[0x1E0C98428](theData, range.location, range.length, newBytes, newLength);
}

void CFDataSetLength(CFMutableDataRef theData, CFIndex length)
{
  MEMORY[0x1E0C98430](theData, length);
}

CFDateFormatterRef CFDateFormatterCreate(CFAllocatorRef allocator, CFLocaleRef locale, CFDateFormatterStyle dateStyle, CFDateFormatterStyle timeStyle)
{
  return (CFDateFormatterRef)MEMORY[0x1E0C98460](allocator, locale, dateStyle, timeStyle);
}

CFStringRef CFDateFormatterCreateStringWithDate(CFAllocatorRef allocator, CFDateFormatterRef formatter, CFDateRef date)
{
  return (CFStringRef)MEMORY[0x1E0C98490](allocator, formatter, date);
}

void CFDateFormatterSetFormat(CFDateFormatterRef formatter, CFStringRef formatString)
{
  MEMORY[0x1E0C984C0](formatter, formatString);
}

CFTypeID CFDateGetTypeID(void)
{
  return MEMORY[0x1E0C984E8]();
}

void CFDictionaryAddValue(CFMutableDictionaryRef theDict, const void *key, const void *value)
{
  MEMORY[0x1E0C98500](theDict, key, value);
}

void CFDictionaryApplyFunction(CFDictionaryRef theDict, CFDictionaryApplierFunction applier, void *context)
{
  MEMORY[0x1E0C98508](theDict, applier, context);
}

Boolean CFDictionaryContainsKey(CFDictionaryRef theDict, const void *key)
{
  return MEMORY[0x1E0C98518](theDict, key);
}

CFDictionaryRef CFDictionaryCreate(CFAllocatorRef allocator, const void **keys, const void **values, CFIndex numValues, const CFDictionaryKeyCallBacks *keyCallBacks, const CFDictionaryValueCallBacks *valueCallBacks)
{
  return (CFDictionaryRef)MEMORY[0x1E0C98530](allocator, keys, values, numValues, keyCallBacks, valueCallBacks);
}

CFDictionaryRef CFDictionaryCreateCopy(CFAllocatorRef allocator, CFDictionaryRef theDict)
{
  return (CFDictionaryRef)MEMORY[0x1E0C98538](allocator, theDict);
}

CFMutableDictionaryRef CFDictionaryCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFDictionaryKeyCallBacks *keyCallBacks, const CFDictionaryValueCallBacks *valueCallBacks)
{
  return (CFMutableDictionaryRef)MEMORY[0x1E0C98550](allocator, capacity, keyCallBacks, valueCallBacks);
}

CFMutableDictionaryRef CFDictionaryCreateMutableCopy(CFAllocatorRef allocator, CFIndex capacity, CFDictionaryRef theDict)
{
  return (CFMutableDictionaryRef)MEMORY[0x1E0C98558](allocator, capacity, theDict);
}

CFIndex CFDictionaryGetCount(CFDictionaryRef theDict)
{
  return MEMORY[0x1E0C98570](theDict);
}

void CFDictionaryGetKeysAndValues(CFDictionaryRef theDict, const void **keys, const void **values)
{
  MEMORY[0x1E0C985A0](theDict, keys, values);
}

CFTypeID CFDictionaryGetTypeID(void)
{
  return MEMORY[0x1E0C985A8]();
}

const void *__cdecl CFDictionaryGetValue(CFDictionaryRef theDict, const void *key)
{
  return (const void *)MEMORY[0x1E0C985B8](theDict, key);
}

Boolean CFDictionaryGetValueIfPresent(CFDictionaryRef theDict, const void *key, const void **value)
{
  return MEMORY[0x1E0C985C8](theDict, key, value);
}

void CFDictionaryRemoveAllValues(CFMutableDictionaryRef theDict)
{
  MEMORY[0x1E0C985D8](theDict);
}

void CFDictionaryRemoveValue(CFMutableDictionaryRef theDict, const void *key)
{
  MEMORY[0x1E0C985E8](theDict, key);
}

void CFDictionarySetValue(CFMutableDictionaryRef theDict, const void *key, const void *value)
{
  MEMORY[0x1E0C98610](theDict, key, value);
}

CFErrorRef CFErrorCreate(CFAllocatorRef allocator, CFErrorDomain domain, CFIndex code, CFDictionaryRef userInfo)
{
  return (CFErrorRef)MEMORY[0x1E0C98650](allocator, domain, code, userInfo);
}

CFAllocatorRef CFGetAllocator(CFTypeRef cf)
{
  return (CFAllocatorRef)MEMORY[0x1E0C98718](cf);
}

CFTypeID CFGetTypeID(CFTypeRef cf)
{
  return MEMORY[0x1E0C98738](cf);
}

CFLocaleRef CFLocaleCreate(CFAllocatorRef allocator, CFLocaleIdentifier localeIdentifier)
{
  return (CFLocaleRef)MEMORY[0x1E0C98798](allocator, localeIdentifier);
}

CFLocaleIdentifier CFLocaleCreateCanonicalLocaleIdentifierFromString(CFAllocatorRef allocator, CFStringRef localeIdentifier)
{
  return (CFLocaleIdentifier)MEMORY[0x1E0C987B0](allocator, localeIdentifier);
}

CFTypeRef CFMakeCollectable(CFTypeRef cf)
{
  return (CFTypeRef)MEMORY[0x1E0C98858](cf);
}

CFNumberRef CFNumberCreate(CFAllocatorRef allocator, CFNumberType theType, const void *valuePtr)
{
  return (CFNumberRef)MEMORY[0x1E0C98928](allocator, theType, valuePtr);
}

CFNumberFormatterRef CFNumberFormatterCreate(CFAllocatorRef allocator, CFLocaleRef locale, CFNumberFormatterStyle style)
{
  return (CFNumberFormatterRef)MEMORY[0x1E0C98938](allocator, locale, style);
}

CFNumberRef CFNumberFormatterCreateNumberFromString(CFAllocatorRef allocator, CFNumberFormatterRef formatter, CFStringRef string, CFRange *rangep, CFOptionFlags options)
{
  return (CFNumberRef)MEMORY[0x1E0C98940](allocator, formatter, string, rangep, options);
}

CFTypeID CFNumberGetTypeID(void)
{
  return MEMORY[0x1E0C989B8]();
}

Boolean CFNumberGetValue(CFNumberRef number, CFNumberType theType, void *valuePtr)
{
  return MEMORY[0x1E0C989C0](number, theType, valuePtr);
}

Boolean CFNumberIsFloatType(CFNumberRef number)
{
  return MEMORY[0x1E0C989D0](number);
}

CFDataRef CFPropertyListCreateData(CFAllocatorRef allocator, CFPropertyListRef propertyList, CFPropertyListFormat format, CFOptionFlags options, CFErrorRef *error)
{
  return (CFDataRef)MEMORY[0x1E0C98AA0](allocator, propertyList, format, options, error);
}

CFPropertyListRef CFPropertyListCreateDeepCopy(CFAllocatorRef allocator, CFPropertyListRef propertyList, CFOptionFlags mutabilityOption)
{
  return (CFPropertyListRef)MEMORY[0x1E0C98AB0](allocator, propertyList, mutabilityOption);
}

CFPropertyListRef CFPropertyListCreateWithData(CFAllocatorRef allocator, CFDataRef data, CFOptionFlags options, CFPropertyListFormat *format, CFErrorRef *error)
{
  return (CFPropertyListRef)MEMORY[0x1E0C98AD0](allocator, data, options, format, error);
}

void CFRelease(CFTypeRef cf)
{
  MEMORY[0x1E0C98BC0](cf);
}

CFTypeRef CFRetain(CFTypeRef cf)
{
  return (CFTypeRef)MEMORY[0x1E0C98BD0](cf);
}

void CFRunLoopAddSource(CFRunLoopRef rl, CFRunLoopSourceRef source, CFRunLoopMode mode)
{
  MEMORY[0x1E0C98BF8](rl, source, mode);
}

CFRunLoopRef CFRunLoopGetCurrent(void)
{
  return (CFRunLoopRef)MEMORY[0x1E0C98C30]();
}

void CFRunLoopRemoveSource(CFRunLoopRef rl, CFRunLoopSourceRef source, CFRunLoopMode mode)
{
  MEMORY[0x1E0C98C90](rl, source, mode);
}

CFRunLoopRunResult CFRunLoopRunInMode(CFRunLoopMode mode, CFTimeInterval seconds, Boolean returnAfterSourceHandled)
{
  return MEMORY[0x1E0C98CB0](mode, returnAfterSourceHandled, seconds);
}

void CFSetAddValue(CFMutableSetRef theSet, const void *value)
{
  MEMORY[0x1E0C98D70](theSet, value);
}

void CFSetApplyFunction(CFSetRef theSet, CFSetApplierFunction applier, void *context)
{
  MEMORY[0x1E0C98D78](theSet, applier, context);
}

Boolean CFSetContainsValue(CFSetRef theSet, const void *value)
{
  return MEMORY[0x1E0C98D80](theSet, value);
}

CFMutableSetRef CFSetCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFSetCallBacks *callBacks)
{
  return (CFMutableSetRef)MEMORY[0x1E0C98D98](allocator, capacity, callBacks);
}

CFIndex CFSetGetCount(CFSetRef theSet)
{
  return MEMORY[0x1E0C98DA8](theSet);
}

void CFSetRemoveValue(CFMutableSetRef theSet, const void *value)
{
  MEMORY[0x1E0C98DE0](theSet, value);
}

void CFStringAppendFormat(CFMutableStringRef theString, CFDictionaryRef formatOptions, CFStringRef format, ...)
{
  MEMORY[0x1E0C98EF0](theString, formatOptions, format);
}

CFComparisonResult CFStringCompare(CFStringRef theString1, CFStringRef theString2, CFStringCompareFlags compareOptions)
{
  return MEMORY[0x1E0C98F10](theString1, theString2, compareOptions);
}

CFComparisonResult CFStringCompareWithOptions(CFStringRef theString1, CFStringRef theString2, CFRange rangeToCompare, CFStringCompareFlags compareOptions)
{
  return MEMORY[0x1E0C98F18](theString1, theString2, rangeToCompare.location, rangeToCompare.length, compareOptions);
}

CFArrayRef CFStringCreateArrayBySeparatingStrings(CFAllocatorRef alloc, CFStringRef theString, CFStringRef separatorString)
{
  return (CFArrayRef)MEMORY[0x1E0C98F58](alloc, theString, separatorString);
}

CFStringRef CFStringCreateByCombiningStrings(CFAllocatorRef alloc, CFArrayRef theArray, CFStringRef separatorString)
{
  return (CFStringRef)MEMORY[0x1E0C98F68](alloc, theArray, separatorString);
}

CFDataRef CFStringCreateExternalRepresentation(CFAllocatorRef alloc, CFStringRef theString, CFStringEncoding encoding, UInt8 lossByte)
{
  return (CFDataRef)MEMORY[0x1E0C98F80](alloc, theString, *(_QWORD *)&encoding, lossByte);
}

CFStringRef CFStringCreateFromExternalRepresentation(CFAllocatorRef alloc, CFDataRef data, CFStringEncoding encoding)
{
  return (CFStringRef)MEMORY[0x1E0C98F88](alloc, data, *(_QWORD *)&encoding);
}

CFMutableStringRef CFStringCreateMutable(CFAllocatorRef alloc, CFIndex maxLength)
{
  return (CFMutableStringRef)MEMORY[0x1E0C98F90](alloc, maxLength);
}

CFMutableStringRef CFStringCreateMutableCopy(CFAllocatorRef alloc, CFIndex maxLength, CFStringRef theString)
{
  return (CFMutableStringRef)MEMORY[0x1E0C98F98](alloc, maxLength, theString);
}

CFStringRef CFStringCreateWithBytes(CFAllocatorRef alloc, const UInt8 *bytes, CFIndex numBytes, CFStringEncoding encoding, Boolean isExternalRepresentation)
{
  return (CFStringRef)MEMORY[0x1E0C98FB8](alloc, bytes, numBytes, *(_QWORD *)&encoding, isExternalRepresentation);
}

CFStringRef CFStringCreateWithCString(CFAllocatorRef alloc, const char *cStr, CFStringEncoding encoding)
{
  return (CFStringRef)MEMORY[0x1E0C98FD0](alloc, cStr, *(_QWORD *)&encoding);
}

CFStringRef CFStringCreateWithCStringNoCopy(CFAllocatorRef alloc, const char *cStr, CFStringEncoding encoding, CFAllocatorRef contentsDeallocator)
{
  return (CFStringRef)MEMORY[0x1E0C98FE0](alloc, cStr, *(_QWORD *)&encoding, contentsDeallocator);
}

CFStringRef CFStringCreateWithFormat(CFAllocatorRef alloc, CFDictionaryRef formatOptions, CFStringRef format, ...)
{
  return (CFStringRef)MEMORY[0x1E0C99018](alloc, formatOptions, format);
}

void CFStringDelete(CFMutableStringRef theString, CFRange range)
{
  MEMORY[0x1E0C99038](theString, range.location, range.length);
}

const char *__cdecl CFStringGetCStringPtr(CFStringRef theString, CFStringEncoding encoding)
{
  return (const char *)MEMORY[0x1E0C990A0](theString, *(_QWORD *)&encoding);
}

void CFStringGetCharacters(CFStringRef theString, CFRange range, UniChar *buffer)
{
  MEMORY[0x1E0C990C0](theString, range.location, range.length, buffer);
}

SInt32 CFStringGetIntValue(CFStringRef str)
{
  return MEMORY[0x1E0C990F0](str);
}

CFIndex CFStringGetLength(CFStringRef theString)
{
  return MEMORY[0x1E0C99100](theString);
}

CFStringEncoding CFStringGetSystemEncoding(void)
{
  return MEMORY[0x1E0C99168]();
}

CFTypeID CFStringGetTypeID(void)
{
  return MEMORY[0x1E0C99170]();
}

CFStringRef CFURLCopyPathExtension(CFURLRef url)
{
  return (CFStringRef)MEMORY[0x1E0C99320](url);
}

CFTypeID CFURLGetTypeID(void)
{
  return MEMORY[0x1E0C994B8]();
}

void CFWriteStreamClose(CFWriteStreamRef stream)
{
  MEMORY[0x1E0C99600](stream);
}

uint64_t CFWriteStreamCreate()
{
  return MEMORY[0x1E0C99618]();
}

Boolean CFWriteStreamOpen(CFWriteStreamRef stream)
{
  return MEMORY[0x1E0C99650](stream);
}

CGAffineTransform *__cdecl CGAffineTransformMakeScale(CGAffineTransform *__return_ptr retstr, CGFloat sx, CGFloat sy)
{
  return (CGAffineTransform *)MEMORY[0x1E0C9BAD8](retstr, sx, sy);
}

CGAffineTransform *__cdecl CGAffineTransformMakeTranslation(CGAffineTransform *__return_ptr retstr, CGFloat tx, CGFloat ty)
{
  return (CGAffineTransform *)MEMORY[0x1E0C9BAE0](retstr, tx, ty);
}

CGAffineTransform *__cdecl CGAffineTransformTranslate(CGAffineTransform *__return_ptr retstr, CGAffineTransform *t, CGFloat tx, CGFloat ty)
{
  return (CGAffineTransform *)MEMORY[0x1E0C9BB00](retstr, t, tx, ty);
}

uint64_t CGBitmapAllocateData()
{
  return MEMORY[0x1E0C9BB08]();
}

CGContextRef CGBitmapContextCreate(void *data, size_t width, size_t height, size_t bitsPerComponent, size_t bytesPerRow, CGColorSpaceRef space, uint32_t bitmapInfo)
{
  return (CGContextRef)MEMORY[0x1E0C9BB10](data, width, height, bitsPerComponent, bytesPerRow, space, *(_QWORD *)&bitmapInfo);
}

void *__cdecl CGBitmapContextGetData(CGContextRef context)
{
  return (void *)MEMORY[0x1E0C9BB70](context);
}

uint64_t CGBitmapFreeData()
{
  return MEMORY[0x1E0C9BB90]();
}

uint64_t CGBitmapGetFastestAlignment()
{
  return MEMORY[0x1E0C9BBA0]();
}

CGColorConversionInfoRef CGColorConversionInfoCreateFromList(CFDictionaryRef options, CGColorSpaceRef a2, CGColorConversionInfoTransformType a3, CGColorRenderingIntent a4, ...)
{
  return (CGColorConversionInfoRef)MEMORY[0x1E0C9BC50](options, a2, *(_QWORD *)&a3, *(_QWORD *)&a4);
}

CGColorRef CGColorCreate(CGColorSpaceRef space, const CGFloat *components)
{
  return (CGColorRef)MEMORY[0x1E0C9BC78](space, components);
}

void CGColorRelease(CGColorRef color)
{
  MEMORY[0x1E0C9BD60](color);
}

uint64_t CGColorSpaceContainsFlexGTCInfo()
{
  return MEMORY[0x1E0C9BD70]();
}

uint64_t CGColorSpaceCopyBaseColorSpace()
{
  return MEMORY[0x1E0C9BD78]();
}

uint64_t CGColorSpaceCopyFlexGTCInfo()
{
  return MEMORY[0x1E0C9BD90]();
}

CFDataRef CGColorSpaceCopyICCData(CGColorSpaceRef space)
{
  return (CFDataRef)MEMORY[0x1E0C9BD98](space);
}

uint64_t CGColorSpaceCopyICCProfileASCIIDescriptionString()
{
  return MEMORY[0x1E0C9BDA8]();
}

CFStringRef CGColorSpaceCopyName(CGColorSpaceRef space)
{
  return (CFStringRef)MEMORY[0x1E0C9BDB8](space);
}

CGColorSpaceRef CGColorSpaceCreateExtendedLinearized(CGColorSpaceRef space)
{
  return (CGColorSpaceRef)MEMORY[0x1E0C9BE00](space);
}

uint64_t CGColorSpaceCreateFromCICP()
{
  return MEMORY[0x1E0C9BE08]();
}

CGColorSpaceRef CGColorSpaceCreateWithICCData(CFTypeRef data)
{
  return (CGColorSpaceRef)MEMORY[0x1E0C9BE40](data);
}

CGColorSpaceRef CGColorSpaceCreateWithName(CFStringRef name)
{
  return (CGColorSpaceRef)MEMORY[0x1E0C9BE50](name);
}

uint64_t CGColorSpaceEqualToColorSpace()
{
  return MEMORY[0x1E0C9BE68]();
}

uint64_t CGColorSpaceGetCICPInfo()
{
  return MEMORY[0x1E0C9BE88]();
}

CGColorSpaceModel CGColorSpaceGetModel(CGColorSpaceRef space)
{
  return MEMORY[0x1E0C9BEC8](space);
}

CFStringRef CGColorSpaceGetName(CGColorSpaceRef space)
{
  return (CFStringRef)MEMORY[0x1E0C9BED0](space);
}

size_t CGColorSpaceGetNumberOfComponents(CGColorSpaceRef space)
{
  return MEMORY[0x1E0C9BED8](space);
}

CFTypeID CGColorSpaceGetTypeID(void)
{
  return MEMORY[0x1E0C9BEF8]();
}

BOOL CGColorSpaceIsHLGBased(CGColorSpaceRef s)
{
  return MEMORY[0x1E0C9BF08](s);
}

BOOL CGColorSpaceIsPQBased(CGColorSpaceRef s)
{
  return MEMORY[0x1E0C9BF18](s);
}

void CGColorSpaceRelease(CGColorSpaceRef space)
{
  MEMORY[0x1E0C9BF30](space);
}

BOOL CGColorSpaceSupportsOutput(CGColorSpaceRef space)
{
  return MEMORY[0x1E0C9BF40](space);
}

BOOL CGColorSpaceUsesExtendedRange(CGColorSpaceRef space)
{
  return MEMORY[0x1E0C9BF48](space);
}

BOOL CGColorSpaceUsesITUR_2100TF(CGColorSpaceRef a1)
{
  return MEMORY[0x1E0C9BF50](a1);
}

void CGContextDrawImage(CGContextRef c, CGRect rect, CGImageRef image)
{
  MEMORY[0x1E0C9C170](c, image, (__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

void CGContextFillRect(CGContextRef c, CGRect rect)
{
  MEMORY[0x1E0C9C220](c, (__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

void CGContextFlush(CGContextRef c)
{
  MEMORY[0x1E0C9C230](c);
}

void CGContextSetFillColorWithColor(CGContextRef c, CGColorRef color)
{
  MEMORY[0x1E0C9C408](c, color);
}

CGDataConsumerRef CGDataConsumerCreate(void *info, const CGDataConsumerCallbacks *cbks)
{
  return (CGDataConsumerRef)MEMORY[0x1E0C9C5A8](info, cbks);
}

CGDataProviderRef CGDataProviderCreateDirect(void *info, off_t size, const CGDataProviderDirectCallbacks *callbacks)
{
  return (CGDataProviderRef)MEMORY[0x1E0C9C5E0](info, size, callbacks);
}

CGDataProviderRef CGDataProviderCreateWithData(void *info, const void *data, size_t size, CGDataProviderReleaseDataCallback releaseData)
{
  return (CGDataProviderRef)MEMORY[0x1E0C9C600](info, data, size, releaseData);
}

void CGDataProviderRelease(CGDataProviderRef provider)
{
  MEMORY[0x1E0C9C638](provider);
}

uint64_t CGImageApplyHDRGainMap()
{
  return MEMORY[0x1E0CBC270]();
}

uint64_t CGImageConvertHDRPixelBufferToSDR()
{
  return MEMORY[0x1E0CBC278]();
}

CGImageRef CGImageCreate(size_t width, size_t height, size_t bitsPerComponent, size_t bitsPerPixel, size_t bytesPerRow, CGColorSpaceRef space, CGBitmapInfo bitmapInfo, CGDataProviderRef provider, const CGFloat *decode, BOOL shouldInterpolate, CGColorRenderingIntent intent)
{
  return (CGImageRef)MEMORY[0x1E0C9CB80](width, height, bitsPerComponent, bitsPerPixel, bytesPerRow, space, *(_QWORD *)&bitmapInfo, provider);
}

uint64_t CGImageCreateColorSpaceFromExifOrData()
{
  return MEMORY[0x1E0CBC2A8]();
}

CGImageRef CGImageCreateCopyWithColorSpace(CGImageRef image, CGColorSpaceRef space)
{
  return (CGImageRef)MEMORY[0x1E0C9CB98](image, space);
}

uint64_t CGImageCreateDataFromMetadata()
{
  return MEMORY[0x1E0CBC2B8]();
}

uint64_t CGImageCreateEXIFDataFromProperties()
{
  return MEMORY[0x1E0CBC2C0]();
}

uint64_t CGImageCreateFlexRangeMetadata()
{
  return MEMORY[0x1E0CBC2D0]();
}

uint64_t CGImageCreateMetadataFromData()
{
  return MEMORY[0x1E0CBC2E0]();
}

CGImageRef CGImageCreateWithImageInRect(CGImageRef image, CGRect rect)
{
  return (CGImageRef)MEMORY[0x1E0C9CBA8](image, (__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

CGImageRef CGImageCreateWithMask(CGImageRef image, CGImageRef mask)
{
  return (CGImageRef)MEMORY[0x1E0C9CBC0](image, mask);
}

void CGImageDestinationAddImage(CGImageDestinationRef idst, CGImageRef image, CFDictionaryRef properties)
{
  MEMORY[0x1E0CBC308](idst, image, properties);
}

CGImageDestinationRef CGImageDestinationCreateWithDataConsumer(CGDataConsumerRef consumer, CFStringRef type, size_t count, CFDictionaryRef options)
{
  return (CGImageDestinationRef)MEMORY[0x1E0CBC340](consumer, type, count, options);
}

BOOL CGImageDestinationFinalize(CGImageDestinationRef idst)
{
  return MEMORY[0x1E0CBC358](idst);
}

CGImageAlphaInfo CGImageGetAlphaInfo(CGImageRef image)
{
  return MEMORY[0x1E0C9CBE8](image);
}

CGBitmapInfo CGImageGetBitmapInfo(CGImageRef image)
{
  return MEMORY[0x1E0C9CBF0](image);
}

size_t CGImageGetBitsPerComponent(CGImageRef image)
{
  return MEMORY[0x1E0C9CBF8](image);
}

CGColorSpaceRef CGImageGetColorSpace(CGImageRef image)
{
  return (CGColorSpaceRef)MEMORY[0x1E0C9CC20](image);
}

size_t CGImageGetHeight(CGImageRef image)
{
  return MEMORY[0x1E0C9CC60](image);
}

CFTypeID CGImageGetTypeID(void)
{
  return MEMORY[0x1E0C9CCC0]();
}

size_t CGImageGetWidth(CGImageRef image)
{
  return MEMORY[0x1E0C9CCD0](image);
}

CFArrayRef CGImageMetadataCopyTags(CGImageMetadataRef metadata)
{
  return (CFArrayRef)MEMORY[0x1E0CBC398](metadata);
}

CGImageMetadataRef CGImageMetadataCreateFromXMPData(CFDataRef data)
{
  return (CGImageMetadataRef)MEMORY[0x1E0CBC3B0](data);
}

CGMutableImageMetadataRef CGImageMetadataCreateMutable(void)
{
  return (CGMutableImageMetadataRef)MEMORY[0x1E0CBC3C0]();
}

CGMutableImageMetadataRef CGImageMetadataCreateMutableCopy(CGImageMetadataRef metadata)
{
  return (CGMutableImageMetadataRef)MEMORY[0x1E0CBC3C8](metadata);
}

CFDataRef CGImageMetadataCreateXMPData(CGImageMetadataRef metadata, CFDictionaryRef options)
{
  return (CFDataRef)MEMORY[0x1E0CBC3D8](metadata, options);
}

void CGImageMetadataEnumerateTagsUsingBlock(CGImageMetadataRef metadata, CFStringRef rootPath, CFDictionaryRef options, CGImageMetadataTagBlock block)
{
  MEMORY[0x1E0CBC3E0](metadata, rootPath, options, block);
}

CFTypeID CGImageMetadataGetTypeID(void)
{
  return MEMORY[0x1E0CBC3E8]();
}

BOOL CGImageMetadataRegisterNamespaceForPrefix(CGMutableImageMetadataRef metadata, CFStringRef xmlns, CFStringRef prefix, CFErrorRef *err)
{
  return MEMORY[0x1E0CBC408](metadata, xmlns, prefix, err);
}

BOOL CGImageMetadataRemoveTagWithPath(CGMutableImageMetadataRef metadata, CGImageMetadataTagRef parent, CFStringRef path)
{
  return MEMORY[0x1E0CBC410](metadata, parent, path);
}

BOOL CGImageMetadataSetTagWithPath(CGMutableImageMetadataRef metadata, CGImageMetadataTagRef parent, CFStringRef path, CGImageMetadataTagRef tag)
{
  return MEMORY[0x1E0CBC418](metadata, parent, path, tag);
}

CFStringRef CGImageMetadataTagCopyName(CGImageMetadataTagRef tag)
{
  return (CFStringRef)MEMORY[0x1E0CBC430](tag);
}

CFStringRef CGImageMetadataTagCopyNamespace(CGImageMetadataTagRef tag)
{
  return (CFStringRef)MEMORY[0x1E0CBC438](tag);
}

CFStringRef CGImageMetadataTagCopyPrefix(CGImageMetadataTagRef tag)
{
  return (CFStringRef)MEMORY[0x1E0CBC440](tag);
}

CFTypeRef CGImageMetadataTagCopyValue(CGImageMetadataTagRef tag)
{
  return (CFTypeRef)MEMORY[0x1E0CBC448](tag);
}

CGImageMetadataTagRef CGImageMetadataTagCreate(CFStringRef xmlns, CFStringRef prefix, CFStringRef name, CGImageMetadataType type, CFTypeRef value)
{
  return (CGImageMetadataTagRef)MEMORY[0x1E0CBC450](xmlns, prefix, name, *(_QWORD *)&type, value);
}

void CGImageRelease(CGImageRef image)
{
  MEMORY[0x1E0C9CDA0](image);
}

uint64_t CGImageSetProperty()
{
  return MEMORY[0x1E0C9CDC0]();
}

CFDictionaryRef CGImageSourceCopyPropertiesAtIndex(CGImageSourceRef isrc, size_t index, CFDictionaryRef options)
{
  return (CFDictionaryRef)MEMORY[0x1E0CBC530](isrc, index, options);
}

CGImageRef CGImageSourceCreateImageAtIndex(CGImageSourceRef isrc, size_t index, CFDictionaryRef options)
{
  return (CGImageRef)MEMORY[0x1E0CBC568](isrc, index, options);
}

CGImageSourceRef CGImageSourceCreateWithData(CFDataRef data, CFDictionaryRef options)
{
  return (CGImageSourceRef)MEMORY[0x1E0CBC590](data, options);
}

uint64_t CGImageWriteEXIFJPEGWithMetadata()
{
  return MEMORY[0x1E0CBC670]();
}

CFDictionaryRef CGPointCreateDictionaryRepresentation(CGPoint point)
{
  return (CFDictionaryRef)MEMORY[0x1E0C9D528]((__n128)point, *(__n128 *)&point.y);
}

BOOL CGPointMakeWithDictionaryRepresentation(CFDictionaryRef dict, CGPoint *point)
{
  return MEMORY[0x1E0C9D530](dict, point);
}

CGRect CGRectApplyAffineTransform(CGRect rect, CGAffineTransform *t)
{
  double v2;
  double v3;
  double v4;
  double v5;
  CGRect result;

  MEMORY[0x1E0C9D548](t, (__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

BOOL CGRectContainsRect(CGRect rect1, CGRect rect2)
{
  return MEMORY[0x1E0C9D558]((__n128)rect1.origin, *(__n128 *)&rect1.origin.y, (__n128)rect1.size, *(__n128 *)&rect1.size.height, (__n128)rect2.origin, *(__n128 *)&rect2.origin.y, (__n128)rect2.size, *(__n128 *)&rect2.size.height);
}

CFDictionaryRef CGRectCreateDictionaryRepresentation(CGRect a1)
{
  return (CFDictionaryRef)MEMORY[0x1E0C9D560]((__n128)a1.origin, *(__n128 *)&a1.origin.y, (__n128)a1.size, *(__n128 *)&a1.size.height);
}

BOOL CGRectEqualToRect(CGRect rect1, CGRect rect2)
{
  return MEMORY[0x1E0C9D570]((__n128)rect1.origin, *(__n128 *)&rect1.origin.y, (__n128)rect1.size, *(__n128 *)&rect1.size.height, (__n128)rect2.origin, *(__n128 *)&rect2.origin.y, (__n128)rect2.size, *(__n128 *)&rect2.size.height);
}

CGRect CGRectInset(CGRect rect, CGFloat dx, CGFloat dy)
{
  double v3;
  double v4;
  double v5;
  double v6;
  CGRect result;

  MEMORY[0x1E0C9D5E8]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height, dx, dy);
  result.size.height = v6;
  result.size.width = v5;
  result.origin.y = v4;
  result.origin.x = v3;
  return result;
}

CGRect CGRectIntersection(CGRect r1, CGRect r2)
{
  double v2;
  double v3;
  double v4;
  double v5;
  CGRect result;

  MEMORY[0x1E0C9D5F8]((__n128)r1.origin, *(__n128 *)&r1.origin.y, (__n128)r1.size, *(__n128 *)&r1.size.height, (__n128)r2.origin, *(__n128 *)&r2.origin.y, (__n128)r2.size, *(__n128 *)&r2.size.height);
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

BOOL CGRectIsEmpty(CGRect rect)
{
  return MEMORY[0x1E0C9D608]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

BOOL CGRectIsNull(CGRect rect)
{
  return MEMORY[0x1E0C9D618]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

BOOL CGRectMakeWithDictionaryRepresentation(CFDictionaryRef dict, CGRect *rect)
{
  return MEMORY[0x1E0C9D620](dict, rect);
}

CFDictionaryRef CGSizeCreateDictionaryRepresentation(CGSize size)
{
  return (CFDictionaryRef)MEMORY[0x1E0C9D808]((__n128)size, *(__n128 *)&size.height);
}

BOOL CGSizeMakeWithDictionaryRepresentation(CFDictionaryRef dict, CGSize *size)
{
  return MEMORY[0x1E0C9D818](dict, size);
}

uint64_t CMBaseObjectGetVTable()
{
  return MEMORY[0x1E0C9EB28]();
}

OSStatus CMBlockBufferAppendBufferReference(CMBlockBufferRef theBuffer, CMBlockBufferRef targetBBuf, size_t offsetToData, size_t dataLength, CMBlockBufferFlags flags)
{
  return MEMORY[0x1E0C9EB50](theBuffer, targetBBuf, offsetToData, dataLength, *(_QWORD *)&flags);
}

OSStatus CMBlockBufferAppendMemoryBlock(CMBlockBufferRef theBuffer, void *memoryBlock, size_t blockLength, CFAllocatorRef blockAllocator, const CMBlockBufferCustomBlockSource *customBlockSource, size_t offsetToData, size_t dataLength, CMBlockBufferFlags flags)
{
  return MEMORY[0x1E0C9EB58](theBuffer, memoryBlock, blockLength, blockAllocator, customBlockSource, offsetToData, dataLength, *(_QWORD *)&flags);
}

OSStatus CMBlockBufferCreateContiguous(CFAllocatorRef structureAllocator, CMBlockBufferRef sourceBuffer, CFAllocatorRef blockAllocator, const CMBlockBufferCustomBlockSource *customBlockSource, size_t offsetToData, size_t dataLength, CMBlockBufferFlags flags, CMBlockBufferRef *blockBufferOut)
{
  return MEMORY[0x1E0C9EB70](structureAllocator, sourceBuffer, blockAllocator, customBlockSource, offsetToData, dataLength, *(_QWORD *)&flags, blockBufferOut);
}

OSStatus CMBlockBufferCreateEmpty(CFAllocatorRef structureAllocator, uint32_t subBlockCapacity, CMBlockBufferFlags flags, CMBlockBufferRef *blockBufferOut)
{
  return MEMORY[0x1E0C9EB78](structureAllocator, *(_QWORD *)&subBlockCapacity, *(_QWORD *)&flags, blockBufferOut);
}

OSStatus CMBlockBufferCreateWithBufferReference(CFAllocatorRef structureAllocator, CMBlockBufferRef bufferReference, size_t offsetToData, size_t dataLength, CMBlockBufferFlags flags, CMBlockBufferRef *blockBufferOut)
{
  return MEMORY[0x1E0C9EB80](structureAllocator, bufferReference, offsetToData, dataLength, *(_QWORD *)&flags, blockBufferOut);
}

OSStatus CMBlockBufferCreateWithMemoryBlock(CFAllocatorRef structureAllocator, void *memoryBlock, size_t blockLength, CFAllocatorRef blockAllocator, const CMBlockBufferCustomBlockSource *customBlockSource, size_t offsetToData, size_t dataLength, CMBlockBufferFlags flags, CMBlockBufferRef *blockBufferOut)
{
  return MEMORY[0x1E0C9EB88](structureAllocator, memoryBlock, blockLength, blockAllocator, customBlockSource, offsetToData, dataLength, *(_QWORD *)&flags);
}

size_t CMBlockBufferGetDataLength(CMBlockBufferRef theBuffer)
{
  return MEMORY[0x1E0C9EB98](theBuffer);
}

OSStatus CMBlockBufferGetDataPointer(CMBlockBufferRef theBuffer, size_t offset, size_t *lengthAtOffsetOut, size_t *totalLengthOut, char **dataPointerOut)
{
  return MEMORY[0x1E0C9EBA8](theBuffer, offset, lengthAtOffsetOut, totalLengthOut, dataPointerOut);
}

CFTypeID CMBlockBufferGetTypeID(void)
{
  return MEMORY[0x1E0C9EBB0]();
}

Boolean CMBlockBufferIsRangeContiguous(CMBlockBufferRef theBuffer, size_t offset, size_t length)
{
  return MEMORY[0x1E0C9EBC0](theBuffer, offset, length);
}

OSStatus CMBlockBufferReplaceDataBytes(const void *sourceBytes, CMBlockBufferRef destinationBuffer, size_t offsetIntoDestination, size_t dataLength)
{
  return MEMORY[0x1E0C9EBC8](sourceBytes, destinationBuffer, offsetIntoDestination, dataLength);
}

Boolean CMBufferQueueContainsEndOfData(CMBufferQueueRef queue)
{
  return MEMORY[0x1E0C9EBD8](queue);
}

CMTime *__cdecl CMBufferQueueGetDuration(CMTime *__return_ptr retstr, CMBufferQueueRef queue)
{
  return (CMTime *)MEMORY[0x1E0C9EC28](retstr, queue);
}

OSStatus CMBufferQueueInstallTrigger(CMBufferQueueRef queue, CMBufferQueueTriggerCallback callback, void *refcon, CMBufferQueueTriggerCondition condition, CMTime *time, CMBufferQueueTriggerToken *triggerTokenOut)
{
  return MEMORY[0x1E0C9EC78](queue, callback, refcon, *(_QWORD *)&condition, time, triggerTokenOut);
}

OSStatus CMBufferQueueMarkEndOfData(CMBufferQueueRef queue)
{
  return MEMORY[0x1E0C9ECA8](queue);
}

OSStatus CMBufferQueueRemoveTrigger(CMBufferQueueRef queue, CMBufferQueueTriggerToken triggerToken)
{
  return MEMORY[0x1E0C9ECB0](queue, triggerToken);
}

uint64_t CMByteStreamAppend()
{
  return MEMORY[0x1E0C9ECE0]();
}

uint64_t CMByteStreamAppendBlockBuffer()
{
  return MEMORY[0x1E0C9ECE8]();
}

uint64_t CMByteStreamBaseGetTypeID()
{
  return MEMORY[0x1E0C9ECF0]();
}

uint64_t CMByteStreamCreateForBlockBuffer()
{
  return MEMORY[0x1E0C9ED00]();
}

uint64_t CMByteStreamCreateForFileURL()
{
  return MEMORY[0x1E0C9ED08]();
}

uint64_t CMByteStreamCreateWritableForBlockBuffer()
{
  return MEMORY[0x1E0C9ED10]();
}

uint64_t CMByteStreamGetCMBaseObject()
{
  return MEMORY[0x1E0C9ED18]();
}

uint64_t CMCreateContiguousBlockBufferFromStream()
{
  return MEMORY[0x1E0C9ED88]();
}

Boolean CMFormatDescriptionEqualIgnoringExtensionKeys(CMFormatDescriptionRef formatDescription, CMFormatDescriptionRef otherFormatDescription, CFTypeRef formatDescriptionExtensionKeysToIgnore, CFTypeRef sampleDescriptionExtensionAtomKeysToIgnore)
{
  return MEMORY[0x1E0C9EDC0](formatDescription, otherFormatDescription, formatDescriptionExtensionKeysToIgnore, sampleDescriptionExtensionAtomKeysToIgnore);
}

CFPropertyListRef CMFormatDescriptionGetExtension(CMFormatDescriptionRef desc, CFStringRef extensionKey)
{
  return (CFPropertyListRef)MEMORY[0x1E0C9EDC8](desc, extensionKey);
}

CFDictionaryRef CMFormatDescriptionGetExtensions(CMFormatDescriptionRef desc)
{
  return (CFDictionaryRef)MEMORY[0x1E0C9EDD0](desc);
}

FourCharCode CMFormatDescriptionGetMediaSubType(CMFormatDescriptionRef desc)
{
  return MEMORY[0x1E0C9EDD8](desc);
}

CFTypeID CMFormatDescriptionGetTypeID(void)
{
  return MEMORY[0x1E0C9EDE8]();
}

CFTypeRef CMGetAttachment(CMAttachmentBearerRef target, CFStringRef key, CMAttachmentMode *attachmentModeOut)
{
  return (CFTypeRef)MEMORY[0x1E0C9EE00](target, key, attachmentModeOut);
}

CMMemoryPoolRef CMMemoryPoolCreate(CFDictionaryRef options)
{
  return (CMMemoryPoolRef)MEMORY[0x1E0C9EE18](options);
}

void CMMemoryPoolFlush(CMMemoryPoolRef pool)
{
  MEMORY[0x1E0C9EE20](pool);
}

CFAllocatorRef CMMemoryPoolGetAllocator(CMMemoryPoolRef pool)
{
  return (CFAllocatorRef)MEMORY[0x1E0C9EE28](pool);
}

void CMMemoryPoolInvalidate(CMMemoryPoolRef pool)
{
  MEMORY[0x1E0C9EE30](pool);
}

uint64_t CMNotificationCenterAddListener()
{
  return MEMORY[0x1E0C9EEB8]();
}

uint64_t CMNotificationCenterGetDefaultLocalCenter()
{
  return MEMORY[0x1E0C9EEC8]();
}

uint64_t CMNotificationCenterRemoveListener()
{
  return MEMORY[0x1E0C9EEE8]();
}

void CMPropagateAttachments(CMAttachmentBearerRef source, CMAttachmentBearerRef destination)
{
  MEMORY[0x1E0C9EF08](source, destination);
}

OSStatus CMSampleBufferCreate(CFAllocatorRef allocator, CMBlockBufferRef dataBuffer, Boolean dataReady, CMSampleBufferMakeDataReadyCallback makeDataReadyCallback, void *makeDataReadyRefcon, CMFormatDescriptionRef formatDescription, CMItemCount numSamples, CMItemCount numSampleTimingEntries, const CMSampleTimingInfo *sampleTimingArray, CMItemCount numSampleSizeEntries, const size_t *sampleSizeArray, CMSampleBufferRef *sampleBufferOut)
{
  return MEMORY[0x1E0C9EF40](allocator, dataBuffer, dataReady, makeDataReadyCallback, makeDataReadyRefcon, formatDescription, numSamples, numSampleTimingEntries);
}

OSStatus CMSampleBufferCreateCopyWithNewTiming(CFAllocatorRef allocator, CMSampleBufferRef originalSBuf, CMItemCount numSampleTimingEntries, const CMSampleTimingInfo *sampleTimingArray, CMSampleBufferRef *sampleBufferOut)
{
  return MEMORY[0x1E0C9EF50](allocator, originalSBuf, numSampleTimingEntries, sampleTimingArray, sampleBufferOut);
}

OSStatus CMSampleBufferCreateForImageBuffer(CFAllocatorRef allocator, CVImageBufferRef imageBuffer, Boolean dataReady, CMSampleBufferMakeDataReadyCallback makeDataReadyCallback, void *makeDataReadyRefcon, CMVideoFormatDescriptionRef formatDescription, const CMSampleTimingInfo *sampleTiming, CMSampleBufferRef *sampleBufferOut)
{
  return MEMORY[0x1E0C9EF58](allocator, imageBuffer, dataReady, makeDataReadyCallback, makeDataReadyRefcon, formatDescription, sampleTiming, sampleBufferOut);
}

CMBlockBufferRef CMSampleBufferGetDataBuffer(CMSampleBufferRef sbuf)
{
  return (CMBlockBufferRef)MEMORY[0x1E0C9EFB0](sbuf);
}

CMFormatDescriptionRef CMSampleBufferGetFormatDescription(CMSampleBufferRef sbuf)
{
  return (CMFormatDescriptionRef)MEMORY[0x1E0C9EFD0](sbuf);
}

CVImageBufferRef CMSampleBufferGetImageBuffer(CMSampleBufferRef sbuf)
{
  return (CVImageBufferRef)MEMORY[0x1E0C9EFD8](sbuf);
}

CMItemCount CMSampleBufferGetNumSamples(CMSampleBufferRef sbuf)
{
  return MEMORY[0x1E0C9EFE0](sbuf);
}

CMTime *__cdecl CMSampleBufferGetPresentationTimeStamp(CMTime *__return_ptr retstr, CMSampleBufferRef sbuf)
{
  return (CMTime *)MEMORY[0x1E0C9F008](retstr, sbuf);
}

CFArrayRef CMSampleBufferGetSampleAttachmentsArray(CMSampleBufferRef sbuf, Boolean createIfNecessary)
{
  return (CFArrayRef)MEMORY[0x1E0C9F010](sbuf, createIfNecessary);
}

size_t CMSampleBufferGetSampleSize(CMSampleBufferRef sbuf, CMItemIndex sampleIndex)
{
  return MEMORY[0x1E0C9F018](sbuf, sampleIndex);
}

OSStatus CMSampleBufferGetSampleTimingInfo(CMSampleBufferRef sbuf, CMItemIndex sampleIndex, CMSampleTimingInfo *timingInfoOut)
{
  return MEMORY[0x1E0C9F028](sbuf, sampleIndex, timingInfoOut);
}

size_t CMSampleBufferGetTotalSampleSize(CMSampleBufferRef sbuf)
{
  return MEMORY[0x1E0C9F040](sbuf);
}

CFTypeID CMSampleBufferGetTypeID(void)
{
  return MEMORY[0x1E0C9F048]();
}

void CMSetAttachment(CMAttachmentBearerRef target, CFStringRef key, CFTypeRef value, CMAttachmentMode attachmentMode)
{
  MEMORY[0x1E0C9F0C8](target, key, value, *(_QWORD *)&attachmentMode);
}

void CMSetAttachments(CMAttachmentBearerRef target, CFDictionaryRef theAttachments, CMAttachmentMode attachmentMode)
{
  MEMORY[0x1E0C9F0D0](target, theAttachments, *(_QWORD *)&attachmentMode);
}

CMTime *__cdecl CMTimeAdd(CMTime *__return_ptr retstr, CMTime *lhs, CMTime *rhs)
{
  return (CMTime *)MEMORY[0x1E0C9F298](retstr, lhs, rhs);
}

int32_t CMTimeCompare(CMTime *time1, CMTime *time2)
{
  return MEMORY[0x1E0C9F2D8](time1, time2);
}

CMTime *__cdecl CMTimeConvertScale(CMTime *__return_ptr retstr, CMTime *time, int32_t newTimescale, CMTimeRoundingMethod method)
{
  return (CMTime *)MEMORY[0x1E0C9F2E0](retstr, time, *(_QWORD *)&newTimescale, *(_QWORD *)&method);
}

CFDictionaryRef CMTimeCopyAsDictionary(CMTime *time, CFAllocatorRef allocator)
{
  return (CFDictionaryRef)MEMORY[0x1E0C9F2F0](time, allocator);
}

CMTime *__cdecl CMTimeMake(CMTime *__return_ptr retstr, int64_t value, int32_t timescale)
{
  return (CMTime *)MEMORY[0x1E0C9F318](retstr, value, *(_QWORD *)&timescale);
}

CMTime *__cdecl CMTimeMakeFromDictionary(CMTime *__return_ptr retstr, CFDictionaryRef dictionaryRepresentation)
{
  return (CMTime *)MEMORY[0x1E0C9F320](retstr, dictionaryRepresentation);
}

Boolean CMTimeRangeEqual(CMTimeRange *range1, CMTimeRange *range2)
{
  return MEMORY[0x1E0C9F3C0](range1, range2);
}

CMTime *__cdecl CMTimeSubtract(CMTime *__return_ptr retstr, CMTime *lhs, CMTime *rhs)
{
  return (CMTime *)MEMORY[0x1E0C9F400](retstr, lhs, rhs);
}

OSStatus CMVideoFormatDescriptionCreate(CFAllocatorRef allocator, CMVideoCodecType codecType, int32_t width, int32_t height, CFDictionaryRef extensions, CMVideoFormatDescriptionRef *formatDescriptionOut)
{
  return MEMORY[0x1E0C9F520](allocator, *(_QWORD *)&codecType, *(_QWORD *)&width, *(_QWORD *)&height, extensions, formatDescriptionOut);
}

OSStatus CMVideoFormatDescriptionCreateForImageBuffer(CFAllocatorRef allocator, CVImageBufferRef imageBuffer, CMVideoFormatDescriptionRef *formatDescriptionOut)
{
  return MEMORY[0x1E0C9F528](allocator, imageBuffer, formatDescriptionOut);
}

OSStatus CMVideoFormatDescriptionCreateFromHEVCParameterSets(CFAllocatorRef allocator, size_t parameterSetCount, const uint8_t *const *parameterSetPointers, const size_t *parameterSetSizes, int NALUnitHeaderLength, CFDictionaryRef extensions, CMFormatDescriptionRef *formatDescriptionOut)
{
  return MEMORY[0x1E0C9F548](allocator, parameterSetCount, parameterSetPointers, parameterSetSizes, *(_QWORD *)&NALUnitHeaderLength, extensions, formatDescriptionOut);
}

CGRect CMVideoFormatDescriptionGetCleanAperture(CMVideoFormatDescriptionRef videoDesc, Boolean originIsAtTopLeft)
{
  double v2;
  double v3;
  double v4;
  double v5;
  CGRect result;

  MEMORY[0x1E0C9F550](videoDesc, originIsAtTopLeft);
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

CMVideoDimensions CMVideoFormatDescriptionGetDimensions(CMVideoFormatDescriptionRef videoDesc)
{
  return (CMVideoDimensions)MEMORY[0x1E0C9F558](videoDesc);
}

CFTypeRef CVBufferCopyAttachment(CVBufferRef buffer, CFStringRef key, CVAttachmentMode *attachmentMode)
{
  return (CFTypeRef)MEMORY[0x1E0CA8900](buffer, key, attachmentMode);
}

CFDictionaryRef CVBufferCopyAttachments(CVBufferRef buffer, CVAttachmentMode attachmentMode)
{
  return (CFDictionaryRef)MEMORY[0x1E0CA8908](buffer, *(_QWORD *)&attachmentMode);
}

Boolean CVBufferHasAttachment(CVBufferRef buffer, CFStringRef key)
{
  return MEMORY[0x1E0CA8920](buffer, key);
}

void CVBufferPropagateAttachments(CVBufferRef sourceBuffer, CVBufferRef destinationBuffer)
{
  MEMORY[0x1E0CA8928](sourceBuffer, destinationBuffer);
}

void CVBufferRemoveAttachment(CVBufferRef buffer, CFStringRef key)
{
  MEMORY[0x1E0CA8940](buffer, key);
}

void CVBufferSetAttachment(CVBufferRef buffer, CFStringRef key, CFTypeRef value, CVAttachmentMode attachmentMode)
{
  MEMORY[0x1E0CA8950](buffer, key, value, *(_QWORD *)&attachmentMode);
}

void CVBufferSetAttachments(CVBufferRef buffer, CFDictionaryRef theAttachments, CVAttachmentMode attachmentMode)
{
  MEMORY[0x1E0CA8958](buffer, theAttachments, *(_QWORD *)&attachmentMode);
}

int CVColorPrimariesGetIntegerCodePointForString(CFStringRef colorPrimariesString)
{
  return MEMORY[0x1E0CA8960](colorPrimariesString);
}

CFStringRef CVColorPrimariesGetStringForIntegerCodePoint(int colorPrimariesCodePoint)
{
  return (CFStringRef)MEMORY[0x1E0CA8968](*(_QWORD *)&colorPrimariesCodePoint);
}

CGColorSpaceRef CVImageBufferCreateColorSpaceFromAttachments(CFDictionaryRef attachments)
{
  return (CGColorSpaceRef)MEMORY[0x1E0CA89D0](attachments);
}

CVReturn CVPixelBufferCreate(CFAllocatorRef allocator, size_t width, size_t height, OSType pixelFormatType, CFDictionaryRef pixelBufferAttributes, CVPixelBufferRef *pixelBufferOut)
{
  return MEMORY[0x1E0CA8A98](allocator, width, height, *(_QWORD *)&pixelFormatType, pixelBufferAttributes, pixelBufferOut);
}

CVReturn CVPixelBufferCreateWithBytes(CFAllocatorRef allocator, size_t width, size_t height, OSType pixelFormatType, void *baseAddress, size_t bytesPerRow, CVPixelBufferReleaseBytesCallback releaseCallback, void *releaseRefCon, CFDictionaryRef pixelBufferAttributes, CVPixelBufferRef *pixelBufferOut)
{
  return MEMORY[0x1E0CA8AB8](allocator, width, height, *(_QWORD *)&pixelFormatType, baseAddress, bytesPerRow, releaseCallback, releaseRefCon);
}

CVReturn CVPixelBufferCreateWithIOSurface(CFAllocatorRef allocator, IOSurfaceRef surface, CFDictionaryRef pixelBufferAttributes, CVPixelBufferRef *pixelBufferOut)
{
  return MEMORY[0x1E0CA8AC0](allocator, surface, pixelBufferAttributes, pixelBufferOut);
}

CVReturn CVPixelBufferCreateWithPlanarBytes(CFAllocatorRef allocator, size_t width, size_t height, OSType pixelFormatType, void *dataPtr, size_t dataSize, size_t numberOfPlanes, void **planeBaseAddress, size_t *planeWidth, size_t *planeHeight, size_t *planeBytesPerRow, CVPixelBufferReleasePlanarBytesCallback releaseCallback, void *releaseRefCon, CFDictionaryRef pixelBufferAttributes, CVPixelBufferRef *pixelBufferOut)
{
  return MEMORY[0x1E0CA8AC8](allocator, width, height, *(_QWORD *)&pixelFormatType, dataPtr, dataSize, numberOfPlanes, planeBaseAddress);
}

uint64_t CVPixelBufferGetAttributes()
{
  return MEMORY[0x1E0CA8AD8]();
}

void *__cdecl CVPixelBufferGetBaseAddress(CVPixelBufferRef pixelBuffer)
{
  return (void *)MEMORY[0x1E0CA8AE0](pixelBuffer);
}

void *__cdecl CVPixelBufferGetBaseAddressOfPlane(CVPixelBufferRef pixelBuffer, size_t planeIndex)
{
  return (void *)MEMORY[0x1E0CA8AE8](pixelBuffer, planeIndex);
}

size_t CVPixelBufferGetBytesPerRow(CVPixelBufferRef pixelBuffer)
{
  return MEMORY[0x1E0CA8AF8](pixelBuffer);
}

size_t CVPixelBufferGetBytesPerRowOfPlane(CVPixelBufferRef pixelBuffer, size_t planeIndex)
{
  return MEMORY[0x1E0CA8B00](pixelBuffer, planeIndex);
}

size_t CVPixelBufferGetDataSize(CVPixelBufferRef pixelBuffer)
{
  return MEMORY[0x1E0CA8B08](pixelBuffer);
}

void CVPixelBufferGetExtendedPixels(CVPixelBufferRef pixelBuffer, size_t *extraColumnsOnLeft, size_t *extraColumnsOnRight, size_t *extraRowsOnTop, size_t *extraRowsOnBottom)
{
  MEMORY[0x1E0CA8B10](pixelBuffer, extraColumnsOnLeft, extraColumnsOnRight, extraRowsOnTop, extraRowsOnBottom);
}

size_t CVPixelBufferGetHeight(CVPixelBufferRef pixelBuffer)
{
  return MEMORY[0x1E0CA8B20](pixelBuffer);
}

size_t CVPixelBufferGetHeightOfPlane(CVPixelBufferRef pixelBuffer, size_t planeIndex)
{
  return MEMORY[0x1E0CA8B28](pixelBuffer, planeIndex);
}

IOSurfaceRef CVPixelBufferGetIOSurface(CVPixelBufferRef pixelBuffer)
{
  return (IOSurfaceRef)MEMORY[0x1E0CA8B30](pixelBuffer);
}

OSType CVPixelBufferGetPixelFormatType(CVPixelBufferRef pixelBuffer)
{
  return MEMORY[0x1E0CA8B38](pixelBuffer);
}

size_t CVPixelBufferGetPlaneCount(CVPixelBufferRef pixelBuffer)
{
  return MEMORY[0x1E0CA8B40](pixelBuffer);
}

CFTypeID CVPixelBufferGetTypeID(void)
{
  return MEMORY[0x1E0CA8B48]();
}

size_t CVPixelBufferGetWidth(CVPixelBufferRef pixelBuffer)
{
  return MEMORY[0x1E0CA8B50](pixelBuffer);
}

size_t CVPixelBufferGetWidthOfPlane(CVPixelBufferRef pixelBuffer, size_t planeIndex)
{
  return MEMORY[0x1E0CA8B58](pixelBuffer, planeIndex);
}

Boolean CVPixelBufferIsPlanar(CVPixelBufferRef pixelBuffer)
{
  return MEMORY[0x1E0CA8B68](pixelBuffer);
}

CVReturn CVPixelBufferLockBaseAddress(CVPixelBufferRef pixelBuffer, CVPixelBufferLockFlags lockFlags)
{
  return MEMORY[0x1E0CA8B70](pixelBuffer, lockFlags);
}

CVReturn CVPixelBufferPoolCreatePixelBuffer(CFAllocatorRef allocator, CVPixelBufferPoolRef pixelBufferPool, CVPixelBufferRef *pixelBufferOut)
{
  return MEMORY[0x1E0CA8B80](allocator, pixelBufferPool, pixelBufferOut);
}

CFDictionaryRef CVPixelBufferPoolGetPixelBufferAttributes(CVPixelBufferPoolRef pool)
{
  return (CFDictionaryRef)MEMORY[0x1E0CA8BA8](pool);
}

void CVPixelBufferRelease(CVPixelBufferRef texture)
{
  MEMORY[0x1E0CA8BF0](texture);
}

CVPixelBufferRef CVPixelBufferRetain(CVPixelBufferRef texture)
{
  return (CVPixelBufferRef)MEMORY[0x1E0CA8BF8](texture);
}

CVReturn CVPixelBufferUnlockBaseAddress(CVPixelBufferRef pixelBuffer, CVPixelBufferLockFlags unlockFlags)
{
  return MEMORY[0x1E0CA8C00](pixelBuffer, unlockFlags);
}

CFDictionaryRef CVPixelFormatDescriptionCreateWithPixelFormatType(CFAllocatorRef allocator, OSType pixelFormat)
{
  return (CFDictionaryRef)MEMORY[0x1E0CA8C08](allocator, *(_QWORD *)&pixelFormat);
}

uint64_t CVPixelFormatDescriptionGetDescriptionWithPixelFormatType()
{
  return MEMORY[0x1E0CA8C10]();
}

int CVTransferFunctionGetIntegerCodePointForString(CFStringRef transferFunctionString)
{
  return MEMORY[0x1E0CA8C30](transferFunctionString);
}

CFStringRef CVTransferFunctionGetStringForIntegerCodePoint(int transferFunctionCodePoint)
{
  return (CFStringRef)MEMORY[0x1E0CA8C38](*(_QWORD *)&transferFunctionCodePoint);
}

int CVYCbCrMatrixGetIntegerCodePointForString(CFStringRef yCbCrMatrixString)
{
  return MEMORY[0x1E0CA8C40](yCbCrMatrixString);
}

CFStringRef CVYCbCrMatrixGetStringForIntegerCodePoint(int yCbCrMatrixCodePoint)
{
  return (CFStringRef)MEMORY[0x1E0CA8C48](*(_QWORD *)&yCbCrMatrixCodePoint);
}

ColorSyncProfileRef ColorSyncProfileCreate(CFDataRef data, CFErrorRef *error)
{
  return (ColorSyncProfileRef)MEMORY[0x1E0C95470](data, error);
}

CFTypeRef ColorSyncTransformCopyProperty(ColorSyncTransformRef transform, CFTypeRef key, CFDictionaryRef options)
{
  return (CFTypeRef)MEMORY[0x1E0C954C8](transform, key, options);
}

ColorSyncTransformRef ColorSyncTransformCreate(CFArrayRef profileSequence, CFDictionaryRef options)
{
  return (ColorSyncTransformRef)MEMORY[0x1E0C954D0](profileSequence, options);
}

uint64_t FigAV1Bridge_GetChromaFormatAndBitDepthsFromAV1CodecConfigurationRecord()
{
  return MEMORY[0x1E0C9F668]();
}

uint64_t FigAtomStreamInitWithByteStream()
{
  return MEMORY[0x1E0C9F6E8]();
}

uint64_t FigAtomStreamPositionAtFirstAtomWithType()
{
  return MEMORY[0x1E0C9F708]();
}

uint64_t FigByteStreamCreateWithCFData()
{
  return MEMORY[0x1E0C9F9A0]();
}

uint64_t FigByteStreamCreateWithIOSurface()
{
  return MEMORY[0x1E0C9F9A8]();
}

uint64_t FigByteStreamCreateWritableWithCFMutableData()
{
  return MEMORY[0x1E0C9F9B0]();
}

uint64_t FigByteStreamCreateWritableWithIOSurface()
{
  return MEMORY[0x1E0C9F9B8]();
}

uint64_t FigCFArrayAppendDouble()
{
  return MEMORY[0x1E0C9FA08]();
}

uint64_t FigCFArrayAppendInt()
{
  return MEMORY[0x1E0C9FA18]();
}

uint64_t FigCFArrayAppendInt32()
{
  return MEMORY[0x1E0C9FA20]();
}

uint64_t FigCFArrayAppendInt64()
{
  return MEMORY[0x1E0C9FA28]();
}

uint64_t FigCFArrayApplyBlock()
{
  return MEMORY[0x1E0C9FA30]();
}

uint64_t FigCFArrayApplyFunction()
{
  return MEMORY[0x1E0C9FA38]();
}

uint64_t FigCFArrayContainsInt()
{
  return MEMORY[0x1E0C9FA40]();
}

uint64_t FigCFArrayContainsValue()
{
  return MEMORY[0x1E0C9FA58]();
}

uint64_t FigCFArrayCreateMutableCopy()
{
  return MEMORY[0x1E0C9FA80]();
}

uint64_t FigCFArrayGetDoubleAtIndex()
{
  return MEMORY[0x1E0C9FAB0]();
}

uint64_t FigCFArrayGetFloatAtIndex()
{
  return MEMORY[0x1E0C9FAD0]();
}

uint64_t FigCFArrayGetInt32AtIndex()
{
  return MEMORY[0x1E0C9FAE0]();
}

uint64_t FigCFArrayGetInt64AtIndex()
{
  return MEMORY[0x1E0C9FAE8]();
}

uint64_t FigCFArrayGetIntAtIndex()
{
  return MEMORY[0x1E0C9FAF0]();
}

uint64_t FigCFArrayGetValueAtIndex()
{
  return MEMORY[0x1E0C9FB00]();
}

uint64_t FigCFDictionaryAddEntriesToDictionaryWithRecursion()
{
  return MEMORY[0x1E0C9FB50]();
}

uint64_t FigCFDictionaryApplyBlock()
{
  return MEMORY[0x1E0C9FB58]();
}

uint64_t FigCFDictionaryCreateMutableCopy()
{
  return MEMORY[0x1E0C9FB80]();
}

uint64_t FigCFDictionaryCreateMutableCopyWithCFTypeCallbacks()
{
  return MEMORY[0x1E0C9FB88]();
}

uint64_t FigCFDictionaryGetBooleanIfPresent()
{
  return MEMORY[0x1E0C9FB98]();
}

uint64_t FigCFDictionaryGetCFIndexIfPresent()
{
  return MEMORY[0x1E0C9FBA8]();
}

uint64_t FigCFDictionaryGetCGSizeIfPresent()
{
  return MEMORY[0x1E0C9FBC0]();
}

uint64_t FigCFDictionaryGetCount()
{
  return MEMORY[0x1E0C9FBD8]();
}

uint64_t FigCFDictionaryGetDoubleIfPresent()
{
  return MEMORY[0x1E0C9FBF0]();
}

uint64_t FigCFDictionaryGetFloatIfPresent()
{
  return MEMORY[0x1E0C9FC00]();
}

uint64_t FigCFDictionaryGetInt16IfPresent()
{
  return MEMORY[0x1E0C9FC08]();
}

uint64_t FigCFDictionaryGetInt32IfPresent()
{
  return MEMORY[0x1E0C9FC10]();
}

uint64_t FigCFDictionaryGetInt64IfPresent()
{
  return MEMORY[0x1E0C9FC18]();
}

uint64_t FigCFDictionaryGetIntIfPresent()
{
  return MEMORY[0x1E0C9FC20]();
}

uint64_t FigCFDictionaryGetValue()
{
  return MEMORY[0x1E0C9FC48]();
}

uint64_t FigCFDictionaryGetValueIfPresent()
{
  return MEMORY[0x1E0C9FC58]();
}

uint64_t FigCFDictionarySetBoolean()
{
  return MEMORY[0x1E0C9FC78]();
}

uint64_t FigCFDictionarySetCFIndex()
{
  return MEMORY[0x1E0C9FC80]();
}

uint64_t FigCFDictionarySetDouble()
{
  return MEMORY[0x1E0C9FCB0]();
}

uint64_t FigCFDictionarySetFloat()
{
  return MEMORY[0x1E0C9FCB8]();
}

uint64_t FigCFDictionarySetInt()
{
  return MEMORY[0x1E0C9FCC8]();
}

uint64_t FigCFDictionarySetInt16()
{
  return MEMORY[0x1E0C9FCD0]();
}

uint64_t FigCFDictionarySetInt32()
{
  return MEMORY[0x1E0C9FCD8]();
}

uint64_t FigCFDictionarySetInt64()
{
  return MEMORY[0x1E0C9FCE0]();
}

uint64_t FigCFDictionarySetUInt32()
{
  return MEMORY[0x1E0C9FCF0]();
}

uint64_t FigCFDictionarySetValue()
{
  return MEMORY[0x1E0C9FD00]();
}

uint64_t FigCFDictionarySetValueFromKeyInDict()
{
  return MEMORY[0x1E0C9FD08]();
}

uint64_t FigCFEqual()
{
  return MEMORY[0x1E0C9FD10]();
}

uint64_t FigCFNumberCreateSInt32()
{
  return MEMORY[0x1E0C9FD48]();
}

uint64_t FigCFNumberCreateUInt32()
{
  return MEMORY[0x1E0C9FD68]();
}

uint64_t FigCFNumberGetFloat64()
{
  return MEMORY[0x1E0C9FD88]();
}

uint64_t FigCFNumberGetSInt32()
{
  return MEMORY[0x1E0C9FD90]();
}

uint64_t FigCFNumberGetUInt32()
{
  return MEMORY[0x1E0C9FDA8]();
}

uint64_t FigCFStringGetCStringPtrAndBufferToFree()
{
  return MEMORY[0x1E0C9FE38]();
}

uint64_t FigCFStringGetCStringPtrMaybeUsingPreallocatedBuffer()
{
  return MEMORY[0x1E0C9FE40]();
}

uint64_t FigCreateBlockBufferWithCFDataNoCopy()
{
  return MEMORY[0x1E0CA0220]();
}

uint64_t FigCreateIOSurfaceBackedCVPixelBufferWithAttributes()
{
  return MEMORY[0x1E0CEC8D0]();
}

uint64_t FigCreatePixelBufferAttributesWithIOSurfaceSupport()
{
  return MEMORY[0x1E0CEC8E0]();
}

uint64_t FigDebugIsInternalBuild()
{
  return MEMORY[0x1E0CA04F0]();
}

uint64_t FigDispatchQueueCreateTargetingPThreadRootQueueWithPriority()
{
  return MEMORY[0x1E0CA05B0]();
}

uint64_t FigDispatchQueueCreateWithPriority()
{
  return MEMORY[0x1E0CA05C0]();
}

uint64_t FigEditCursorGetFigBaseObject()
{
  return MEMORY[0x1E0CC2A20]();
}

uint64_t FigFileForkClose()
{
  return MEMORY[0x1E0CA0878]();
}

uint64_t FigFileForkGetLengthAtOffset()
{
  return MEMORY[0x1E0CA0880]();
}

uint64_t FigFileForkOpenMainByCFURL()
{
  return MEMORY[0x1E0CA0888]();
}

uint64_t FigFileForkWrite()
{
  return MEMORY[0x1E0CA08A0]();
}

uint64_t FigFormatDescriptionRelease()
{
  return MEMORY[0x1E0CA0918]();
}

uint64_t FigFormatDescriptionRetain()
{
  return MEMORY[0x1E0CA0920]();
}

uint64_t FigFormatReaderCreateForStreamReturningMatchingContainerLabel()
{
  return MEMORY[0x1E0CC2A90]();
}

uint64_t FigFormatReaderGetFigBaseObject()
{
  return MEMORY[0x1E0CC2AA0]();
}

uint64_t FigFormatReaderGetTypeID()
{
  return MEMORY[0x1E0CC2AA8]();
}

uint64_t FigFormatWriterGetFigBaseObject()
{
  return MEMORY[0x1E0CC2AB8]();
}

uint64_t FigGetAlignmentForIOSurfaceOutput()
{
  return MEMORY[0x1E0CEC8F0]();
}

uint64_t FigGetDefaultManagedFilePool()
{
  return MEMORY[0x1E0CA0AA0]();
}

uint64_t FigGetNumberOfScalerCores()
{
  return MEMORY[0x1E0CEC900]();
}

uint64_t FigH264Bridge_GetSPSChromaFormatAndBitDepths()
{
  return MEMORY[0x1E0CA0B78]();
}

uint64_t FigH264Bridge_GetSPSFromAVCC()
{
  return MEMORY[0x1E0CA0B80]();
}

uint64_t FigH264Bridge_GetSPS_VUI_ChromaLocation()
{
  return MEMORY[0x1E0CA0BA0]();
}

uint64_t FigH264Bridge_GetSPS_VUI_NCLC()
{
  return MEMORY[0x1E0CA0BB0]();
}

uint64_t FigHEVCBridge_GetHEVCParameterSetAtIndex()
{
  return MEMORY[0x1E0CA0C88]();
}

uint64_t FigHEVCBridge_GetSPSChromaFormatAndBitDepths()
{
  return MEMORY[0x1E0CA0C98]();
}

uint64_t FigHEVCBridge_GetSPS_VUI_ChromaLocation()
{
  return MEMORY[0x1E0CA0CA8]();
}

uint64_t FigHEVCBridge_GetSPS_VUI_NCLC()
{
  return MEMORY[0x1E0CA0CB0]();
}

uint64_t FigIFFPictureCollectionWriterCreateWithByteStream()
{
  return MEMORY[0x1E0CC2AD8]();
}

uint64_t FigKTraceInit()
{
  return MEMORY[0x1E0CA0D90]();
}

uint64_t FigManagedFilePoolCreateByteStreamForFile()
{
  return MEMORY[0x1E0CA0DB8]();
}

uint64_t FigMovieFormatWriterCreateWithByteStream()
{
  return MEMORY[0x1E0CC2BF8]();
}

uint64_t FigPictureCollectionCreateBrandsFromByteStream()
{
  return MEMORY[0x1E0CC2D60]();
}

uint64_t FigPictureCollectionCreateFromByteStream()
{
  return MEMORY[0x1E0CC2D68]();
}

uint64_t FigPictureCollectionCreateFromByteStreamWithOptions()
{
  return MEMORY[0x1E0CC2D70]();
}

uint64_t FigPictureCollectionGetCMBaseObject()
{
  return MEMORY[0x1E0CC2D78]();
}

uint64_t FigPictureCollectionWriterGetCMBaseObject()
{
  return MEMORY[0x1E0CC2D80]();
}

uint64_t FigPictureReaderGetFigBaseObject()
{
  return MEMORY[0x1E0CC2D88]();
}

uint64_t FigPictureTileCursorGetCMBaseObject()
{
  return MEMORY[0x1E0CC2D90]();
}

uint64_t FigPictureTileCursorServiceGetCMBaseObject()
{
  return MEMORY[0x1E0CC2D98]();
}

uint64_t FigSampleBufferCreateCopyWithNoData()
{
  return MEMORY[0x1E0CA1420]();
}

uint64_t FigSampleCursorGetFigBaseObject()
{
  return MEMORY[0x1E0CC3020]();
}

uint64_t FigSampleGeneratorCreateForFormatReaderUsingByteStreams()
{
  return MEMORY[0x1E0CC3030]();
}

uint64_t FigSemaphoreCreate()
{
  return MEMORY[0x1E0CA14C8]();
}

uint64_t FigSemaphoreDestroy()
{
  return MEMORY[0x1E0CA14D0]();
}

uint64_t FigSemaphoreSignal()
{
  return MEMORY[0x1E0CA14D8]();
}

uint64_t FigSemaphoreWaitRelative()
{
  return MEMORY[0x1E0CA14E0]();
}

uint64_t FigServer_IsServerProcess()
{
  return MEMORY[0x1E0CA1528]();
}

uint64_t FigSignalErrorAt()
{
  return MEMORY[0x1E0CA1550]();
}

uint64_t FigSimpleMutexCreate()
{
  return MEMORY[0x1E0CA1570]();
}

uint64_t FigSimpleMutexDestroy()
{
  return MEMORY[0x1E0CA1578]();
}

uint64_t FigSimpleMutexLock()
{
  return MEMORY[0x1E0CA1580]();
}

uint64_t FigSimpleMutexUnlock()
{
  return MEMORY[0x1E0CA1590]();
}

uint64_t FigThreadRunOnce()
{
  return MEMORY[0x1E0CA1810]();
}

uint64_t FigTrackReaderGetFigBaseObject()
{
  return MEMORY[0x1E0CC3108]();
}

uint64_t FigVideoFormatDescriptionCreateWithSampleDescriptionExtensionAtom()
{
  return MEMORY[0x1E0CA1A58]();
}

kern_return_t IOConnectCallStructMethod(mach_port_t connection, uint32_t selector, const void *inputStruct, size_t inputStructCnt, void *outputStruct, size_t *outputStructCnt)
{
  return MEMORY[0x1E0CBAD90](*(_QWORD *)&connection, *(_QWORD *)&selector, inputStruct, inputStructCnt, outputStruct, outputStructCnt);
}

kern_return_t IOConnectSetNotificationPort(io_connect_t connect, uint32_t type, mach_port_t port, uintptr_t reference)
{
  return MEMORY[0x1E0CBADC0](*(_QWORD *)&connect, *(_QWORD *)&type, *(_QWORD *)&port, reference);
}

IONotificationPortRef IONotificationPortCreate(mach_port_t mainPort)
{
  return (IONotificationPortRef)MEMORY[0x1E0CBB698](*(_QWORD *)&mainPort);
}

void IONotificationPortDestroy(IONotificationPortRef notify)
{
  MEMORY[0x1E0CBB6A0](notify);
}

mach_port_t IONotificationPortGetMachPort(IONotificationPortRef notify)
{
  return MEMORY[0x1E0CBB6A8](notify);
}

void IONotificationPortSetDispatchQueue(IONotificationPortRef notify, dispatch_queue_t queue)
{
  MEMORY[0x1E0CBB6B8](notify, queue);
}

kern_return_t IOObjectRelease(io_object_t object)
{
  return MEMORY[0x1E0CBB6F0](*(_QWORD *)&object);
}

CFTypeRef IORegistryEntryCreateCFProperty(io_registry_entry_t entry, CFStringRef key, CFAllocatorRef allocator, IOOptionBits options)
{
  return (CFTypeRef)MEMORY[0x1E0CBB900](*(_QWORD *)&entry, key, allocator, *(_QWORD *)&options);
}

kern_return_t IORegistryEntryGetProperty(io_registry_entry_t entry, const io_name_t propertyName, io_struct_inband_t buffer, uint32_t *size)
{
  return MEMORY[0x1E0CBB978](*(_QWORD *)&entry, propertyName, buffer, size);
}

CFTypeRef IORegistryEntrySearchCFProperty(io_registry_entry_t entry, const io_name_t plane, CFStringRef key, CFAllocatorRef allocator, IOOptionBits options)
{
  return (CFTypeRef)MEMORY[0x1E0CBB9A0](*(_QWORD *)&entry, plane, key, allocator, *(_QWORD *)&options);
}

kern_return_t IOServiceClose(io_connect_t connect)
{
  return MEMORY[0x1E0CBB9D0](*(_QWORD *)&connect);
}

io_service_t IOServiceGetMatchingService(mach_port_t mainPort, CFDictionaryRef matching)
{
  return MEMORY[0x1E0CBB9E0](*(_QWORD *)&mainPort, matching);
}

CFMutableDictionaryRef IOServiceMatching(const char *name)
{
  return (CFMutableDictionaryRef)MEMORY[0x1E0CBBA00](name);
}

kern_return_t IOServiceOpen(io_service_t service, task_port_t owningTask, uint32_t type, io_connect_t *connect)
{
  return MEMORY[0x1E0CBBA10](*(_QWORD *)&service, *(_QWORD *)&owningTask, *(_QWORD *)&type, connect);
}

uint64_t IOSurfaceAcceleratorBlitSurface()
{
  return MEMORY[0x1E0D3A1C8]();
}

uint64_t IOSurfaceAcceleratorCreate()
{
  return MEMORY[0x1E0D3A1D0]();
}

uint64_t IOSurfaceAcceleratorGetRunLoopSource()
{
  return MEMORY[0x1E0D3A1E0]();
}

uint64_t IOSurfaceBindAccel()
{
  return MEMORY[0x1E0CBBAD0]();
}

CFTypeRef IOSurfaceCopyValue(IOSurfaceRef buffer, CFStringRef key)
{
  return (CFTypeRef)MEMORY[0x1E0CBBAE8](buffer, key);
}

IOSurfaceRef IOSurfaceCreate(CFDictionaryRef properties)
{
  return (IOSurfaceRef)MEMORY[0x1E0CBBAF0](properties);
}

uint64_t IOSurfaceCreateChildSurface()
{
  return MEMORY[0x1E0CBBAF8]();
}

uint64_t IOSurfaceCreateWiringAssertion()
{
  return MEMORY[0x1E0CBBB08]();
}

void IOSurfaceDecrementUseCount(IOSurfaceRef buffer)
{
  MEMORY[0x1E0CBBB18](buffer);
}

size_t IOSurfaceGetAllocSize(IOSurfaceRef buffer)
{
  return MEMORY[0x1E0CBBB38](buffer);
}

void *__cdecl IOSurfaceGetBaseAddress(IOSurfaceRef buffer)
{
  return (void *)MEMORY[0x1E0CBBB40](buffer);
}

uint64_t IOSurfaceGetBaseAddressOfCompressedTileDataRegionOfPlane()
{
  return MEMORY[0x1E0CBBB48]();
}

uint64_t IOSurfaceGetBaseAddressOfCompressedTileHeaderRegionOfPlane()
{
  return MEMORY[0x1E0CBBB58]();
}

void *__cdecl IOSurfaceGetBaseAddressOfPlane(IOSurfaceRef buffer, size_t planeIndex)
{
  return (void *)MEMORY[0x1E0CBBB68](buffer, planeIndex);
}

size_t IOSurfaceGetBytesPerRow(IOSurfaceRef buffer)
{
  return MEMORY[0x1E0CBBB90](buffer);
}

size_t IOSurfaceGetBytesPerRowOfPlane(IOSurfaceRef buffer, size_t planeIndex)
{
  return MEMORY[0x1E0CBBBA0](buffer, planeIndex);
}

uint64_t IOSurfaceGetBytesPerTileDataOfPlane()
{
  return MEMORY[0x1E0CBBBB0]();
}

uint64_t IOSurfaceGetCompressedTileHeightOfPlane()
{
  return MEMORY[0x1E0CBBBC8]();
}

uint64_t IOSurfaceGetCompressedTileWidthOfPlane()
{
  return MEMORY[0x1E0CBBBD0]();
}

uint64_t IOSurfaceGetCompressionTypeOfPlane()
{
  return MEMORY[0x1E0CBBBD8]();
}

uint64_t IOSurfaceGetExtendedPixelsOfPlane()
{
  return MEMORY[0x1E0CBBC10]();
}

size_t IOSurfaceGetHeight(IOSurfaceRef buffer)
{
  return MEMORY[0x1E0CBBC28](buffer);
}

uint64_t IOSurfaceGetHeightInCompressedTilesOfPlane()
{
  return MEMORY[0x1E0CBBC30]();
}

size_t IOSurfaceGetHeightOfPlane(IOSurfaceRef buffer, size_t planeIndex)
{
  return MEMORY[0x1E0CBBC38](buffer, planeIndex);
}

IOSurfaceID IOSurfaceGetID(IOSurfaceRef buffer)
{
  return MEMORY[0x1E0CBBC48](buffer);
}

OSType IOSurfaceGetPixelFormat(IOSurfaceRef buffer)
{
  return MEMORY[0x1E0CBBC68](buffer);
}

size_t IOSurfaceGetPlaneCount(IOSurfaceRef buffer)
{
  return MEMORY[0x1E0CBBC70](buffer);
}

CFTypeID IOSurfaceGetTypeID(void)
{
  return MEMORY[0x1E0CBBCC8]();
}

int32_t IOSurfaceGetUseCount(IOSurfaceRef buffer)
{
  return MEMORY[0x1E0CBBCD0](buffer);
}

size_t IOSurfaceGetWidth(IOSurfaceRef buffer)
{
  return MEMORY[0x1E0CBBCE0](buffer);
}

uint64_t IOSurfaceGetWidthInCompressedTilesOfPlane()
{
  return MEMORY[0x1E0CBBCE8]();
}

void IOSurfaceIncrementUseCount(IOSurfaceRef buffer)
{
  MEMORY[0x1E0CBBD00](buffer);
}

Boolean IOSurfaceIsInUse(IOSurfaceRef buffer)
{
  return MEMORY[0x1E0CBBD18](buffer);
}

uint64_t IOSurfaceIsTiled()
{
  return MEMORY[0x1E0CBBD20]();
}

kern_return_t IOSurfaceLock(IOSurfaceRef buffer, IOSurfaceLockOptions options, uint32_t *seed)
{
  return MEMORY[0x1E0CBBD28](buffer, *(_QWORD *)&options, seed);
}

void IOSurfaceRemoveAllValues(IOSurfaceRef buffer)
{
  MEMORY[0x1E0CBBDD8](buffer);
}

void IOSurfaceRemoveValue(IOSurfaceRef buffer, CFStringRef key)
{
  MEMORY[0x1E0CBBDE8](buffer, key);
}

uint64_t IOSurfaceSetOwnership()
{
  return MEMORY[0x1E0CBBE20]();
}

kern_return_t IOSurfaceSetPurgeable(IOSurfaceRef buffer, uint32_t newState, uint32_t *oldState)
{
  return MEMORY[0x1E0CBBE30](buffer, *(_QWORD *)&newState, oldState);
}

void IOSurfaceSetValue(IOSurfaceRef buffer, CFStringRef key, CFTypeRef value)
{
  MEMORY[0x1E0CBBE40](buffer, key, value);
}

kern_return_t IOSurfaceUnlock(IOSurfaceRef buffer, IOSurfaceLockOptions options, uint32_t *seed)
{
  return MEMORY[0x1E0CBBE88](buffer, *(_QWORD *)&options, seed);
}

uint64_t IOSurfaceWrapClientImage()
{
  return MEMORY[0x1E0CBBE98]();
}

uint64_t JxlDecoderCreate()
{
  return MEMORY[0x1E0CFD1A0]();
}

uint64_t JxlDecoderDestroy()
{
  return MEMORY[0x1E0CFD1A8]();
}

uint64_t JxlDecoderGetBasicInfo()
{
  return MEMORY[0x1E0CFD1B0]();
}

uint64_t JxlDecoderGetBoxSizeRaw()
{
  return MEMORY[0x1E0CFD1B8]();
}

uint64_t JxlDecoderGetBoxType()
{
  return MEMORY[0x1E0CFD1C0]();
}

uint64_t JxlDecoderGetColorAsEncodedProfile()
{
  return MEMORY[0x1E0CFD1C8]();
}

uint64_t JxlDecoderGetColorAsICCProfile()
{
  return MEMORY[0x1E0CFD1D0]();
}

uint64_t JxlDecoderGetICCProfileSize()
{
  return MEMORY[0x1E0CFD1D8]();
}

uint64_t JxlDecoderImageOutBufferSize()
{
  return MEMORY[0x1E0CFD1E0]();
}

uint64_t JxlDecoderProcessInput()
{
  return MEMORY[0x1E0CFD1E8]();
}

uint64_t JxlDecoderReleaseBoxBuffer()
{
  return MEMORY[0x1E0CFD1F0]();
}

uint64_t JxlDecoderSetBoxBuffer()
{
  return MEMORY[0x1E0CFD1F8]();
}

uint64_t JxlDecoderSetDecompressBoxes()
{
  return MEMORY[0x1E0CFD200]();
}

uint64_t JxlDecoderSetImageOutBitDepth()
{
  return MEMORY[0x1E0CFD208]();
}

uint64_t JxlDecoderSetImageOutCallback()
{
  return MEMORY[0x1E0CFD218]();
}

uint64_t JxlDecoderSetInput()
{
  return MEMORY[0x1E0CFD220]();
}

uint64_t JxlDecoderSetKeepOrientation()
{
  return MEMORY[0x1E0CFD228]();
}

uint64_t JxlDecoderSetParallelRunner()
{
  return MEMORY[0x1E0CFD230]();
}

uint64_t JxlDecoderSetPreferredColorProfile()
{
  return MEMORY[0x1E0CFD238]();
}

uint64_t JxlDecoderSetUnpremultiplyAlpha()
{
  return MEMORY[0x1E0CFD240]();
}

uint64_t JxlDecoderSubscribeEvents()
{
  return MEMORY[0x1E0CFD248]();
}

uint64_t JxlDecoderVersion()
{
  return MEMORY[0x1E0CFD250]();
}

uint64_t JxlEncoderAddImageFrame()
{
  return MEMORY[0x1E0CFD258]();
}

uint64_t JxlEncoderCloseInput()
{
  return MEMORY[0x1E0CFD260]();
}

uint64_t JxlEncoderCreate()
{
  return MEMORY[0x1E0CFD268]();
}

uint64_t JxlEncoderDestroy()
{
  return MEMORY[0x1E0CFD270]();
}

uint64_t JxlEncoderFrameSettingsCreate()
{
  return MEMORY[0x1E0CFD278]();
}

uint64_t JxlEncoderFrameSettingsSetOption()
{
  return MEMORY[0x1E0CFD280]();
}

uint64_t JxlEncoderInitBasicInfo()
{
  return MEMORY[0x1E0CFD288]();
}

uint64_t JxlEncoderProcessOutput()
{
  return MEMORY[0x1E0CFD290]();
}

uint64_t JxlEncoderSetBasicInfo()
{
  return MEMORY[0x1E0CFD298]();
}

uint64_t JxlEncoderSetColorEncoding()
{
  return MEMORY[0x1E0CFD2A0]();
}

uint64_t JxlEncoderSetFrameDistance()
{
  return MEMORY[0x1E0CFD2A8]();
}

uint64_t JxlEncoderSetFrameLossless()
{
  return MEMORY[0x1E0CFD2B0]();
}

uint64_t JxlEncoderSetICCProfile()
{
  return MEMORY[0x1E0CFD2B8]();
}

uint64_t JxlEncoderSetParallelRunner()
{
  return MEMORY[0x1E0CFD2C0]();
}

uint64_t JxlThreadParallelRunnerCreate()
{
  return MEMORY[0x1E0CFD2D0]();
}

uint64_t JxlThreadParallelRunnerDestroy()
{
  return MEMORY[0x1E0CFD2D8]();
}

uint64_t MGCopyAnswer()
{
  return MEMORY[0x1E0DE2B20]();
}

uint64_t MGGetBoolAnswer()
{
  return MEMORY[0x1E0DE2B50]();
}

id MTLCreateSystemDefaultDevice(void)
{
  return (id)MEMORY[0x1E0CC6980]();
}

void NSLog(NSString *format, ...)
{
  MEMORY[0x1E0CB2D88](format);
}

CFStringRef SecTaskCopySigningIdentifier(SecTaskRef task, CFErrorRef *error)
{
  return (CFStringRef)MEMORY[0x1E0CD65E0](task, error);
}

SecTaskRef SecTaskCreateFromSelf(CFAllocatorRef allocator)
{
  return (SecTaskRef)MEMORY[0x1E0CD6610](allocator);
}

uint64_t VTAreVideoDecodersRunningInProcess()
{
  return MEMORY[0x1E0CEC908]();
}

OSStatus VTCompressionSessionCompleteFrames(VTCompressionSessionRef session, CMTime *completeUntilPresentationTimeStamp)
{
  return MEMORY[0x1E0CEC938](session, completeUntilPresentationTimeStamp);
}

OSStatus VTCompressionSessionCreate(CFAllocatorRef allocator, int32_t width, int32_t height, CMVideoCodecType codecType, CFDictionaryRef encoderSpecification, CFDictionaryRef sourceImageBufferAttributes, CFAllocatorRef compressedDataAllocator, VTCompressionOutputCallback outputCallback, void *outputCallbackRefCon, VTCompressionSessionRef *compressionSessionOut)
{
  return MEMORY[0x1E0CEC948](allocator, *(_QWORD *)&width, *(_QWORD *)&height, *(_QWORD *)&codecType, encoderSpecification, sourceImageBufferAttributes, compressedDataAllocator, outputCallback);
}

OSStatus VTCompressionSessionEncodeFrame(VTCompressionSessionRef session, CVImageBufferRef imageBuffer, CMTime *presentationTimeStamp, CMTime *duration, CFDictionaryRef frameProperties, void *sourceFrameRefcon, VTEncodeInfoFlags *infoFlagsOut)
{
  return MEMORY[0x1E0CEC958](session, imageBuffer, presentationTimeStamp, duration, frameProperties, sourceFrameRefcon, infoFlagsOut);
}

CFTypeID VTCompressionSessionGetTypeID(void)
{
  return MEMORY[0x1E0CEC988]();
}

void VTCompressionSessionInvalidate(VTCompressionSessionRef session)
{
  MEMORY[0x1E0CEC990](session);
}

OSStatus VTCompressionSessionPrepareToEncodeFrames(VTCompressionSessionRef session)
{
  return MEMORY[0x1E0CEC998](session);
}

uint64_t VTDecoderSessionGetPixelBufferPool()
{
  return MEMORY[0x1E0CEC9F8]();
}

uint64_t VTDecoderSessionSetPixelBufferAttributes()
{
  return MEMORY[0x1E0CECA00]();
}

uint64_t VTDecompressionSessionCreateWithOptions()
{
  return MEMORY[0x1E0CECA38]();
}

OSStatus VTDecompressionSessionDecodeFrame(VTDecompressionSessionRef session, CMSampleBufferRef sampleBuffer, VTDecodeFrameFlags decodeFlags, void *sourceFrameRefCon, VTDecodeInfoFlags *infoFlagsOut)
{
  return MEMORY[0x1E0CECA40](session, sampleBuffer, *(_QWORD *)&decodeFlags, sourceFrameRefCon, infoFlagsOut);
}

CFTypeID VTDecompressionSessionGetTypeID(void)
{
  return MEMORY[0x1E0CECA68]();
}

void VTDecompressionSessionInvalidate(VTDecompressionSessionRef session)
{
  MEMORY[0x1E0CECA70](session);
}

OSStatus VTDecompressionSessionWaitForAsynchronousFrames(VTDecompressionSessionRef session)
{
  return MEMORY[0x1E0CECA98](session);
}

uint64_t VTEncoderSessionCreateVideoFormatDescription()
{
  return MEMORY[0x1E0CECAB0]();
}

uint64_t VTEncoderSessionSetPixelBufferAttributes()
{
  return MEMORY[0x1E0CECAD8]();
}

uint64_t VTFillPixelBufferBorderWithBlack()
{
  return MEMORY[0x1E0CECAF8]();
}

uint64_t VTFillPixelBufferWithBlack()
{
  return MEMORY[0x1E0CECB00]();
}

uint64_t VTImageRotationSessionCreate()
{
  return MEMORY[0x1E0CECB88]();
}

uint64_t VTImageRotationSessionInvalidate()
{
  return MEMORY[0x1E0CECB90]();
}

uint64_t VTImageRotationSessionTransferImage()
{
  return MEMORY[0x1E0CECBA8]();
}

uint64_t VTImageRotationSessionTransferSubImage()
{
  return MEMORY[0x1E0CECBB0]();
}

uint64_t VTParavirtualizedJPEGSessionCopyCapabilities()
{
  return MEMORY[0x1E0CECC48]();
}

uint64_t VTParavirtualizedJPEGSessionCreate()
{
  return MEMORY[0x1E0CECC50]();
}

uint64_t VTParavirtualizedJPEGSessionDecodeImage()
{
  return MEMORY[0x1E0CECC58]();
}

uint64_t VTParavirtualizedJPEGSessionEncodeImage()
{
  return MEMORY[0x1E0CECC60]();
}

OSStatus VTPixelRotationSessionCreate(CFAllocatorRef allocator, VTPixelRotationSessionRef *pixelRotationSessionOut)
{
  return MEMORY[0x1E0CECCD8](allocator, pixelRotationSessionOut);
}

uint64_t VTPixelRotationSessionRotateSubImage()
{
  return MEMORY[0x1E0CECCF8]();
}

OSStatus VTPixelTransferSessionCreate(CFAllocatorRef allocator, VTPixelTransferSessionRef *pixelTransferSessionOut)
{
  return MEMORY[0x1E0CECD18](allocator, pixelTransferSessionOut);
}

void VTPixelTransferSessionInvalidate(VTPixelTransferSessionRef session)
{
  MEMORY[0x1E0CECD28](session);
}

OSStatus VTPixelTransferSessionTransferImage(VTPixelTransferSessionRef session, CVPixelBufferRef sourceBuffer, CVPixelBufferRef destinationBuffer)
{
  return MEMORY[0x1E0CECD38](session, sourceBuffer, destinationBuffer);
}

uint64_t VTSelectAndCreateVideoDecoderInstance()
{
  return MEMORY[0x1E0CECD58]();
}

uint64_t VTSelectAndCreateVideoEncoderInstance()
{
  return MEMORY[0x1E0CECD60]();
}

OSStatus VTSessionCopyProperty(VTSessionRef session, CFStringRef propertyKey, CFAllocatorRef allocator, void *propertyValueOut)
{
  return MEMORY[0x1E0CECD68](session, propertyKey, allocator, propertyValueOut);
}

OSStatus VTSessionCopySupportedPropertyDictionary(VTSessionRef session, CFDictionaryRef *supportedPropertyDictionaryOut)
{
  return MEMORY[0x1E0CECD70](session, supportedPropertyDictionaryOut);
}

OSStatus VTSessionSetProperties(VTSessionRef session, CFDictionaryRef propertyDictionary)
{
  return MEMORY[0x1E0CECD78](session, propertyDictionary);
}

OSStatus VTSessionSetProperty(VTSessionRef session, CFStringRef propertyKey, CFTypeRef propertyValue)
{
  return MEMORY[0x1E0CECD80](session, propertyKey, propertyValue);
}

uint64_t VTTileCompressionSessionCompleteTiles()
{
  return MEMORY[0x1E0CECDB0]();
}

uint64_t VTTileCompressionSessionCreate()
{
  return MEMORY[0x1E0CECDB8]();
}

uint64_t VTTileCompressionSessionEncodeTile()
{
  return MEMORY[0x1E0CECDC0]();
}

uint64_t VTTileCompressionSessionGetTypeID()
{
  return MEMORY[0x1E0CECDC8]();
}

uint64_t VTTileCompressionSessionInvalidate()
{
  return MEMORY[0x1E0CECDD0]();
}

uint64_t VTTileCompressionSessionPrepareToEncodeTiles()
{
  return MEMORY[0x1E0CECDD8]();
}

uint64_t VTTileDecompressionSessionCreate()
{
  return MEMORY[0x1E0CECDF0]();
}

uint64_t VTTileDecompressionSessionDecodeTile()
{
  return MEMORY[0x1E0CECDF8]();
}

uint64_t VTTileDecompressionSessionGetTypeID()
{
  return MEMORY[0x1E0CECE00]();
}

uint64_t VTTileDecompressionSessionInvalidate()
{
  return MEMORY[0x1E0CECE08]();
}

uint64_t WriteStackshotReportWithPID()
{
  return MEMORY[0x1E0D1BD40]();
}

void *__cdecl _Block_copy(const void *aBlock)
{
  return (void *)MEMORY[0x1E0C80928](aBlock);
}

void _Block_object_assign(void *a1, const void *a2, const int a3)
{
  MEMORY[0x1E0C80940](a1, a2, *(_QWORD *)&a3);
}

void _Block_object_dispose(const void *a1, const int a2)
{
  MEMORY[0x1E0C80948](a1, *(_QWORD *)&a2);
}

void _Block_release(const void *aBlock)
{
  MEMORY[0x1E0C80958](aBlock);
}

uint64_t _CFRuntimeCreateInstance()
{
  return MEMORY[0x1E0C9A498]();
}

uint64_t _CFRuntimeRegisterClass()
{
  return MEMORY[0x1E0C9A4B0]();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
  MEMORY[0x1E0C80A20](exception_object);
}

std::logic_error *__cdecl std::logic_error::logic_error(std::logic_error *this, const char *a2)
{
  return (std::logic_error *)MEMORY[0x1E0DE4288](this, a2);
}

std::bad_array_new_length *__cdecl std::bad_array_new_length::bad_array_new_length(std::bad_array_new_length *this)
{
  return (std::bad_array_new_length *)MEMORY[0x1E0DE4388](this);
}

std::__thread_struct *__cdecl std::__thread_struct::__thread_struct(std::__thread_struct *this)
{
  return (std::__thread_struct *)MEMORY[0x1E0DE47D0](this);
}

void std::__thread_struct::~__thread_struct(std::__thread_struct *this)
{
  MEMORY[0x1E0DE47D8](this);
}

std::__thread_specific_ptr<std::__thread_struct> *std::__thread_local_data(void)
{
  return (std::__thread_specific_ptr<std::__thread_struct> *)MEMORY[0x1E0DE4908]();
}

void std::__throw_system_error(int __ev, const char *__what_arg)
{
  MEMORY[0x1E0DE4920](*(_QWORD *)&__ev, __what_arg);
}

void std::thread::join(std::thread *this)
{
  MEMORY[0x1E0DE4BB8](this);
}

void std::thread::~thread(std::thread *this)
{
  MEMORY[0x1E0DE4BC8](this);
}

void std::terminate(void)
{
  MEMORY[0x1E0DE4E18]();
}

uint64_t operator delete[]()
{
  return off_1E53F2650();
}

void operator delete(void *__p)
{
  off_1E53F2658(__p);
}

uint64_t operator delete()
{
  return off_1E53F2660();
}

uint64_t operator new[]()
{
  return off_1E53F2668();
}

void *__cdecl operator new(size_t __sz)
{
  return (void *)off_1E53F2670(__sz);
}

uint64_t operator new()
{
  return off_1E53F2678();
}

void __assert_rtn(const char *a1, const char *a2, int a3, const char *a4)
{
  MEMORY[0x1E0C80A58](a1, a2, *(_QWORD *)&a3, a4);
}

void *__cxa_allocate_exception(size_t thrown_size)
{
  return (void *)MEMORY[0x1E0DE5068](thrown_size);
}

void __cxa_free_exception(void *a1)
{
  MEMORY[0x1E0DE50A0](a1);
}

void __cxa_throw(void *a1, struct type_info *lptinfo, void (*a3)(void *))
{
  MEMORY[0x1E0DE50D8](a1, lptinfo, a3);
}

uint64_t __memcpy_chk()
{
  return MEMORY[0x1E0C80B68]();
}

uint64_t __memmove_chk()
{
  return MEMORY[0x1E0C80B70]();
}

double __tanpi(double a1)
{
  double result;

  MEMORY[0x1E0C80C68](a1);
  return result;
}

void _os_log_fault_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x1E0C81040](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x1E0C81048](dso, log, type, format, buf, *(_QWORD *)&size);
}

uLong adler32(uLong adler, const Bytef *buf, uInt len)
{
  return MEMORY[0x1E0DE9290](adler, buf, *(_QWORD *)&len);
}

uint64_t analytics_send_event_lazy()
{
  return MEMORY[0x1E0D15470]();
}

uint64_t applejpeg_decode_build_index()
{
  return MEMORY[0x1E0CFCF70]();
}

uint64_t applejpeg_decode_clear_options()
{
  return MEMORY[0x1E0CFCF80]();
}

uint64_t applejpeg_decode_create()
{
  return MEMORY[0x1E0CFCF90]();
}

uint64_t applejpeg_decode_destroy()
{
  return MEMORY[0x1E0CFCF98]();
}

uint64_t applejpeg_decode_dump_ra_table()
{
  return MEMORY[0x1E0CFCFA0]();
}

uint64_t applejpeg_decode_get_chroma_subsampling()
{
  return MEMORY[0x1E0CFCFA8]();
}

uint64_t applejpeg_decode_get_image_info()
{
  return MEMORY[0x1E0CFCFB0]();
}

uint64_t applejpeg_decode_get_output_buffer_size()
{
  return MEMORY[0x1E0CFCFB8]();
}

uint64_t applejpeg_decode_get_output_dimensions()
{
  return MEMORY[0x1E0CFCFC0]();
}

uint64_t applejpeg_decode_get_precision()
{
  return MEMORY[0x1E0CFCFD0]();
}

uint64_t applejpeg_decode_get_ra_table_sz()
{
  return MEMORY[0x1E0CFCFE0]();
}

uint64_t applejpeg_decode_image_all()
{
  return MEMORY[0x1E0CFCFF0]();
}

uint64_t applejpeg_decode_open_file()
{
  return MEMORY[0x1E0CFCFF8]();
}

uint64_t applejpeg_decode_open_mem()
{
  return MEMORY[0x1E0CFD008]();
}

uint64_t applejpeg_decode_set_option_buildindex()
{
  return MEMORY[0x1E0CFD020]();
}

uint64_t applejpeg_decode_set_option_crop()
{
  return MEMORY[0x1E0CFD028]();
}

uint64_t applejpeg_decode_set_option_multithread()
{
  return MEMORY[0x1E0CFD048]();
}

uint64_t applejpeg_decode_set_option_orientation()
{
  return MEMORY[0x1E0CFD050]();
}

uint64_t applejpeg_decode_set_option_outformat()
{
  return MEMORY[0x1E0CFD058]();
}

uint64_t applejpeg_decode_set_option_outsize()
{
  return MEMORY[0x1E0CFD060]();
}

uint64_t applejpeg_decode_set_option_stride()
{
  return MEMORY[0x1E0CFD068]();
}

uint64_t applejpeg_decode_set_parse_option_use_first_sof()
{
  return MEMORY[0x1E0CFD078]();
}

uint64_t applejpeg_decode_set_ra_table()
{
  return MEMORY[0x1E0CFD080]();
}

uint64_t applejpeg_encode_commit_options_for_file()
{
  return MEMORY[0x1E0CFD088]();
}

uint64_t applejpeg_encode_create()
{
  return MEMORY[0x1E0CFD090]();
}

uint64_t applejpeg_encode_destroy()
{
  return MEMORY[0x1E0CFD098]();
}

uint64_t applejpeg_encode_image_all()
{
  return MEMORY[0x1E0CFD0A0]();
}

uint64_t applejpeg_encode_image_all_with_bitstream_offset()
{
  return MEMORY[0x1E0CFD0A8]();
}

uint64_t applejpeg_encode_set_option_insert_segment()
{
  return MEMORY[0x1E0CFD0C0]();
}

uint64_t applejpeg_encode_set_option_num_threads()
{
  return MEMORY[0x1E0CFD0C8]();
}

uint64_t applejpeg_encode_set_option_q_tables()
{
  return MEMORY[0x1E0CFD0D0]();
}

uint64_t applejpeg_encode_set_option_record_rst_offsets()
{
  return MEMORY[0x1E0CFD0D8]();
}

uint64_t applejpeg_encode_set_option_restart_markers()
{
  return MEMORY[0x1E0CFD0E0]();
}

uint64_t applejpeg_encode_set_option_strip_encode()
{
  return MEMORY[0x1E0CFD0E8]();
}

uint64_t applejpeg_encode_set_option_type_baseline()
{
  return MEMORY[0x1E0CFD0F0]();
}

uint64_t applejpeg_encode_set_option_type_lossless()
{
  return MEMORY[0x1E0CFD0F8]();
}

uint64_t applejpeg_recode_all_file()
{
  return MEMORY[0x1E0CFD110]();
}

uint64_t applejpeg_recode_clear_options()
{
  return MEMORY[0x1E0CFD118]();
}

uint64_t applejpeg_recode_close()
{
  return MEMORY[0x1E0CFD120]();
}

uint64_t applejpeg_recode_open_file()
{
  return MEMORY[0x1E0CFD130]();
}

uint64_t applejpeg_recode_set_option_aspect()
{
  return MEMORY[0x1E0CFD140]();
}

uint64_t applejpeg_recode_set_option_converter()
{
  return MEMORY[0x1E0CFD148]();
}

uint64_t applejpeg_recode_set_option_crop()
{
  return MEMORY[0x1E0CFD150]();
}

uint64_t applejpeg_recode_set_option_hw_accelerated_resize()
{
  return MEMORY[0x1E0CFD158]();
}

uint64_t applejpeg_recode_set_option_jpeg_format()
{
  return MEMORY[0x1E0CFD160]();
}

uint64_t applejpeg_recode_set_option_orientation()
{
  return MEMORY[0x1E0CFD178]();
}

uint64_t applejpeg_recode_set_option_outsize()
{
  return MEMORY[0x1E0CFD180]();
}

uint64_t applejpeg_recode_set_option_quantization_tables()
{
  return MEMORY[0x1E0CFD188]();
}

uint64_t applejpeg_recode_set_option_skip_app0()
{
  return MEMORY[0x1E0CFD190]();
}

long double atan(long double __x)
{
  long double result;

  MEMORY[0x1E0C81618](__x);
  return result;
}

int atoi(const char *a1)
{
  return MEMORY[0x1E0C81668](a1);
}

void bzero(void *a1, size_t a2)
{
  MEMORY[0x1E0C81758](a1, a2);
}

size_t compression_encode_buffer(uint8_t *dst_buffer, size_t dst_size, const uint8_t *src_buffer, size_t src_size, void *scratch_buffer, compression_algorithm algorithm)
{
  return MEMORY[0x1E0DE5280](dst_buffer, dst_size, src_buffer, src_size, scratch_buffer, *(_QWORD *)&algorithm);
}

compression_status compression_stream_destroy(compression_stream *stream)
{
  return MEMORY[0x1E0DE5290](stream);
}

compression_status compression_stream_init(compression_stream *stream, compression_stream_operation operation, compression_algorithm algorithm)
{
  return MEMORY[0x1E0DE52A0](stream, *(_QWORD *)&operation, *(_QWORD *)&algorithm);
}

compression_status compression_stream_process(compression_stream *stream, int flags)
{
  return MEMORY[0x1E0DE52B0](stream, *(_QWORD *)&flags);
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x1E0C82C00](queue, block);
}

void dispatch_async_f(dispatch_queue_t queue, void *context, dispatch_function_t work)
{
  MEMORY[0x1E0C82C18](queue, context, work);
}

void dispatch_barrier_sync(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x1E0C82C48](queue, block);
}

void dispatch_barrier_sync_f(dispatch_queue_t queue, void *context, dispatch_function_t work)
{
  MEMORY[0x1E0C82C50](queue, context, work);
}

dispatch_block_t dispatch_block_create(dispatch_block_flags_t flags, dispatch_block_t block)
{
  return (dispatch_block_t)MEMORY[0x1E0C82C60](flags, block);
}

intptr_t dispatch_block_wait(dispatch_block_t block, dispatch_time_t timeout)
{
  return MEMORY[0x1E0C82C98](block, timeout);
}

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return (dispatch_queue_global_t)MEMORY[0x1E0C82D00](identifier, flags);
}

dispatch_group_t dispatch_group_create(void)
{
  return (dispatch_group_t)MEMORY[0x1E0C82D20]();
}

void dispatch_group_enter(dispatch_group_t group)
{
  MEMORY[0x1E0C82D28](group);
}

void dispatch_group_leave(dispatch_group_t group)
{
  MEMORY[0x1E0C82D30](group);
}

intptr_t dispatch_group_wait(dispatch_group_t group, dispatch_time_t timeout)
{
  return MEMORY[0x1E0C82D48](group, timeout);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
  MEMORY[0x1E0C82E08](predicate, block);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x1E0C82E48](label, attr);
}

void *__cdecl dispatch_queue_get_specific(dispatch_queue_t queue, const void *key)
{
  return (void *)MEMORY[0x1E0C82E68](queue, key);
}

void dispatch_queue_set_specific(dispatch_queue_t queue, const void *key, void *context, dispatch_function_t destructor)
{
  MEMORY[0x1E0C82E80](queue, key, context, destructor);
}

void dispatch_release(dispatch_object_t object)
{
  MEMORY[0x1E0C82E98](object);
}

void dispatch_resume(dispatch_object_t object)
{
  MEMORY[0x1E0C82EA0](object);
}

void dispatch_retain(dispatch_object_t object)
{
  MEMORY[0x1E0C82EA8](object);
}

dispatch_semaphore_t dispatch_semaphore_create(intptr_t value)
{
  return (dispatch_semaphore_t)MEMORY[0x1E0C82EB8](value);
}

intptr_t dispatch_semaphore_signal(dispatch_semaphore_t dsema)
{
  return MEMORY[0x1E0C82EC8](dsema);
}

intptr_t dispatch_semaphore_wait(dispatch_semaphore_t dsema, dispatch_time_t timeout)
{
  return MEMORY[0x1E0C82ED8](dsema, timeout);
}

void dispatch_set_context(dispatch_object_t object, void *context)
{
  MEMORY[0x1E0C82EE0](object, context);
}

void dispatch_source_cancel(dispatch_source_t source)
{
  MEMORY[0x1E0C82F10](source);
}

dispatch_source_t dispatch_source_create(dispatch_source_type_t type, uintptr_t handle, uintptr_t mask, dispatch_queue_t queue)
{
  return (dispatch_source_t)MEMORY[0x1E0C82F20](type, handle, mask, queue);
}

void dispatch_source_set_cancel_handler_f(dispatch_source_t source, dispatch_function_t handler)
{
  MEMORY[0x1E0C82F50](source, handler);
}

void dispatch_source_set_event_handler_f(dispatch_source_t source, dispatch_function_t handler)
{
  MEMORY[0x1E0C82F60](source, handler);
}

void dispatch_source_set_timer(dispatch_source_t source, dispatch_time_t start, uint64_t interval, uint64_t leeway)
{
  MEMORY[0x1E0C82F78](source, start, interval, leeway);
}

void dispatch_suspend(dispatch_object_t object)
{
  MEMORY[0x1E0C82F88](object);
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x1E0C82F90](queue, block);
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return MEMORY[0x1E0C82FB8](when, delta);
}

void *__cdecl dlopen(const char *__path, int __mode)
{
  return (void *)MEMORY[0x1E0C83040](__path, *(_QWORD *)&__mode);
}

void *__cdecl dlsym(void *__handle, const char *__symbol)
{
  return (void *)MEMORY[0x1E0C83050](__handle, __symbol);
}

long double exp2(long double __x)
{
  long double result;

  MEMORY[0x1E0C83288](__x);
  return result;
}

float exp2f(float a1)
{
  float result;

  MEMORY[0x1E0C83290](a1);
  return result;
}

float expf(float a1)
{
  float result;

  MEMORY[0x1E0C83298](a1);
  return result;
}

void free(void *a1)
{
  MEMORY[0x1E0C834A8](a1);
}

char *__cdecl getenv(const char *a1)
{
  return (char *)MEMORY[0x1E0C83660](a1);
}

pid_t getpid(void)
{
  return MEMORY[0x1E0C83760]();
}

uint64_t kdebug_trace()
{
  return MEMORY[0x1E0C83A20]();
}

long double ldexp(long double __x, int __e)
{
  long double result;

  MEMORY[0x1E0C83B40](*(_QWORD *)&__e, __x);
  return result;
}

float ldexpf(float a1, int a2)
{
  float result;

  MEMORY[0x1E0C83B48](*(_QWORD *)&a2, a1);
  return result;
}

long double log10(long double __x)
{
  long double result;

  MEMORY[0x1E0C83BC0](__x);
  return result;
}

long double log2(long double __x)
{
  long double result;

  MEMORY[0x1E0C83BE8](__x);
  return result;
}

float log2f(float a1)
{
  float result;

  MEMORY[0x1E0C83BF0](a1);
  return result;
}

void longjmp(jmp_buf a1, int a2)
{
  MEMORY[0x1E0C83C08](a1, *(_QWORD *)&a2);
}

void *__cdecl malloc_type_calloc(size_t count, size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x1E0C83EF8](count, size, type_id);
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x1E0C83F00](size, type_id);
}

void *__cdecl malloc_type_realloc(void *ptr, size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x1E0C83F10](ptr, size, type_id);
}

void *__cdecl memchr(void *__s, int __c, size_t __n)
{
  return (void *)MEMORY[0x1E0C84070](__s, *(_QWORD *)&__c, __n);
}

int memcmp(const void *__s1, const void *__s2, size_t __n)
{
  return MEMORY[0x1E0C84078](__s1, __s2, __n);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x1E0C84088](__dst, __src, __n);
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return (void *)MEMORY[0x1E0C84098](__dst, __src, __len);
}

void *__cdecl memset(void *__b, int __c, size_t __len)
{
  return (void *)MEMORY[0x1E0C840B0](__b, *(_QWORD *)&__c, __len);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x1E0DE7BA8](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x1E0DE7BB8]();
}

id objc_autorelease(id a1)
{
  return (id)MEMORY[0x1E0DE7BD0](a1);
}

void objc_autoreleasePoolPop(void *context)
{
  MEMORY[0x1E0DE7BD8](context);
}

void *objc_autoreleasePoolPush(void)
{
  return (void *)MEMORY[0x1E0DE7BE0]();
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x1E0DE7BF8]();
}

void objc_enumerationMutation(id obj)
{
  MEMORY[0x1E0DE7C90](obj);
}

Class objc_getClass(const char *name)
{
  return (Class)MEMORY[0x1E0DE7CB0](name);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x1E0DE7D30](a1, a2);
}

uint64_t objc_opt_class()
{
  return MEMORY[0x1E0DE7D38]();
}

uint64_t objc_opt_isKindOfClass()
{
  return MEMORY[0x1E0DE7D40]();
}

uint64_t objc_opt_new()
{
  return MEMORY[0x1E0DE7D48]();
}

uint64_t objc_opt_respondsToSelector()
{
  return MEMORY[0x1E0DE7D50]();
}

void objc_release(id a1)
{
  MEMORY[0x1E0DE7D78](a1);
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x1E0DE7E50](a1);
}

id objc_retainAutorelease(id a1)
{
  return (id)MEMORY[0x1E0DE7E58](a1);
}

void objc_setAssociatedObject(id object, const void *key, id value, void *policy)
{
  MEMORY[0x1E0DE7F40](object, key, value, policy);
}

void objc_setProperty_nonatomic(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
  MEMORY[0x1E0DE7F98](self, _cmd, newValue, offset);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x1E0C84780](oslog, type);
}

size_t os_proc_available_memory(void)
{
  return MEMORY[0x1E0C84908]();
}

uint64_t os_transaction_create()
{
  return MEMORY[0x1E0C84970]();
}

uint64_t os_transaction_needs_more_time()
{
  return MEMORY[0x1E0C84980]();
}

void os_unfair_lock_lock(os_unfair_lock_t lock)
{
  MEMORY[0x1E0C84998](lock);
}

void os_unfair_lock_unlock(os_unfair_lock_t lock)
{
  MEMORY[0x1E0C849B0](lock);
}

long double pow(long double __x, long double __y)
{
  long double result;

  MEMORY[0x1E0C84BB8](__x, __y);
  return result;
}

float powf(float a1, float a2)
{
  float result;

  MEMORY[0x1E0C84BC0](a1, a2);
  return result;
}

int printf(const char *a1, ...)
{
  return MEMORY[0x1E0C84BD0](a1);
}

uint64_t proc_can_use_foreground_hw()
{
  return MEMORY[0x1E0C84BD8]();
}

int pthread_create(pthread_t *a1, const pthread_attr_t *a2, void *(__cdecl *a3)(void *), void *a4)
{
  return MEMORY[0x1E0C84D50](a1, a2, a3, a4);
}

int pthread_mutex_init(pthread_mutex_t *a1, const pthread_mutexattr_t *a2)
{
  return MEMORY[0x1E0C84E20](a1, a2);
}

int pthread_mutex_lock(pthread_mutex_t *a1)
{
  return MEMORY[0x1E0C84E28](a1);
}

int pthread_mutex_unlock(pthread_mutex_t *a1)
{
  return MEMORY[0x1E0C84E38](a1);
}

int pthread_mutexattr_destroy(pthread_mutexattr_t *a1)
{
  return MEMORY[0x1E0C84E40](a1);
}

int pthread_mutexattr_init(pthread_mutexattr_t *a1)
{
  return MEMORY[0x1E0C84E48](a1);
}

int pthread_mutexattr_settype(pthread_mutexattr_t *a1, int a2)
{
  return MEMORY[0x1E0C84E60](a1, *(_QWORD *)&a2);
}

int pthread_once(pthread_once_t *a1, void (*a2)(void))
{
  return MEMORY[0x1E0C84E68](a1, a2);
}

int pthread_setspecific(pthread_key_t a1, const void *a2)
{
  return MEMORY[0x1E0C84F18](a1, a2);
}

void qsort(void *__base, size_t __nel, size_t __width, int (__cdecl *__compar)(const void *, const void *))
{
  MEMORY[0x1E0C84F88](__base, __nel, __width, __compar);
}

void qsort_b(void *__base, size_t __nel, size_t __width, void *__compar)
{
  MEMORY[0x1E0C84F90](__base, __nel, __width, __compar);
}

int rand(void)
{
  return MEMORY[0x1E0C84FB0]();
}

uint64_t sandbox_check()
{
  return MEMORY[0x1E0C85178]();
}

int setjmp(jmp_buf a1)
{
  return MEMORY[0x1E0C85348](a1);
}

long double sin(long double __x)
{
  long double result;

  MEMORY[0x1E0C85418](__x);
  return result;
}

int snprintf(char *__str, size_t __size, const char *__format, ...)
{
  return MEMORY[0x1E0C85440](__str, __size, __format);
}

int strcmp(const char *__s1, const char *__s2)
{
  return MEMORY[0x1E0C85520](__s1, __s2);
}

size_t strlen(const char *__s)
{
  return MEMORY[0x1E0C85578](__s);
}

int strncasecmp(const char *a1, const char *a2, size_t a3)
{
  return MEMORY[0x1E0C85590](a1, a2, a3);
}

int strncmp(const char *__s1, const char *__s2, size_t __n)
{
  return MEMORY[0x1E0C855A8](__s1, __s2, __n);
}

double strtod(const char *a1, char **a2)
{
  double result;

  MEMORY[0x1E0C85618](a1, a2);
  return result;
}

uint64_t strtol(const char *__str, char **__endptr, int __base)
{
  return MEMORY[0x1E0C85658](__str, __endptr, *(_QWORD *)&__base);
}

int sysctlbyname(const char *a1, void *a2, size_t *a3, void *a4, size_t a5)
{
  return MEMORY[0x1E0C857A0](a1, a2, a3, a4, a5);
}

void syslog(int a1, const char *a2, ...)
{
  MEMORY[0x1E0C857D0](*(_QWORD *)&a1, a2);
}

vImage_Error vImageClipToAlpha_RGBA8888(const vImage_Buffer *src, const vImage_Buffer *dest, vImage_Flags flags)
{
  return MEMORY[0x1E0C8CD00](src, dest, *(_QWORD *)&flags);
}

vImage_Error vImageConvert_AnyToAny(const vImageConverterRef converter, const vImage_Buffer *srcs, const vImage_Buffer *dests, void *tempBuffer, vImage_Flags flags)
{
  return MEMORY[0x1E0C8CEF0](converter, srcs, dests, tempBuffer, *(_QWORD *)&flags);
}

vImage_Error vImageConvert_Planar16FtoPlanarF(const vImage_Buffer *src, const vImage_Buffer *dest, vImage_Flags flags)
{
  return MEMORY[0x1E0C8CF28](src, dest, *(_QWORD *)&flags);
}

vImage_Error vImageConvert_PlanarFtoPlanar16F(const vImage_Buffer *src, const vImage_Buffer *dest, vImage_Flags flags)
{
  return MEMORY[0x1E0C8CFC0](src, dest, *(_QWORD *)&flags);
}

vImageConverterRef vImageConverter_CreateWithColorSyncCodeFragment(CFTypeRef codeFragment, const vImage_CGImageFormat *srcFormat, const vImage_CGImageFormat *destFormat, const CGFloat *backgroundColor, vImage_Flags flags, vImage_Error *error)
{
  return (vImageConverterRef)MEMORY[0x1E0C8D128](codeFragment, srcFormat, destFormat, backgroundColor, *(_QWORD *)&flags, error);
}

vImage_Error vImageExtractChannel_ARGB16U(const vImage_Buffer *src, const vImage_Buffer *dest, uint64_t channelIndex, vImage_Flags flags)
{
  return MEMORY[0x1E0C8D280](src, dest, channelIndex, *(_QWORD *)&flags);
}

vImage_Error vImageExtractChannel_ARGB8888(const vImage_Buffer *src, const vImage_Buffer *dest, uint64_t channelIndex, vImage_Flags flags)
{
  return MEMORY[0x1E0C8D288](src, dest, channelIndex, *(_QWORD *)&flags);
}

uint64_t vImageOverwriteChannels_ARGB16U()
{
  return MEMORY[0x1E0C8D4E0]();
}

vImage_Error vImageOverwriteChannels_ARGB8888(const vImage_Buffer *newSrc, const vImage_Buffer *origSrc, const vImage_Buffer *dest, uint8_t copyMask, vImage_Flags flags)
{
  return MEMORY[0x1E0C8D4E8](newSrc, origSrc, dest, copyMask, *(_QWORD *)&flags);
}

vImage_Error vImagePremultiplyData_RGBA16U(const vImage_Buffer *src, const vImage_Buffer *dest, vImage_Flags flags)
{
  return MEMORY[0x1E0C8D628](src, dest, *(_QWORD *)&flags);
}

vImage_Error vImagePremultiplyData_RGBA8888(const vImage_Buffer *src, const vImage_Buffer *dest, vImage_Flags flags)
{
  return MEMORY[0x1E0C8D630](src, dest, *(_QWORD *)&flags);
}

vImage_Error vImageUnpremultiplyData_RGBA16U(const vImage_Buffer *src, const vImage_Buffer *dest, vImage_Flags flags)
{
  return MEMORY[0x1E0C8D7D0](src, dest, *(_QWORD *)&flags);
}

xpc_object_t xpc_dictionary_create_empty(void)
{
  return (xpc_object_t)MEMORY[0x1E0C86218]();
}

void xpc_dictionary_set_double(xpc_object_t xdict, const char *key, double value)
{
  MEMORY[0x1E0C86348](xdict, key, value);
}

void xpc_dictionary_set_uint64(xpc_object_t xdict, const char *key, uint64_t value)
{
  MEMORY[0x1E0C86398](xdict, key, value);
}

uint64_t yzip_codec_create()
{
  return MEMORY[0x1E0DE52F0]();
}

uint64_t yzip_codec_destroy()
{
  return MEMORY[0x1E0DE52F8]();
}

uint64_t yzip_image_create()
{
  return MEMORY[0x1E0DE5300]();
}

uint64_t yzip_image_decode()
{
  return MEMORY[0x1E0DE5308]();
}

uint64_t yzip_image_destroy()
{
  return MEMORY[0x1E0DE5310]();
}

uint64_t yzip_image_encode()
{
  return MEMORY[0x1E0DE5318]();
}

uint64_t yzip_image_get_max_payload_size()
{
  return MEMORY[0x1E0DE5320]();
}

uint64_t yzip_image_get_plane_descriptor()
{
  return MEMORY[0x1E0DE5328]();
}

uint64_t yzip_image_set_plane_data()
{
  return MEMORY[0x1E0DE5330]();
}

