@implementation NSDate(MFDateUtils)

+ (uint64_t)mf_copyDateInCommonFormatsWithString:()MFDateUtils
{
  __CFString *v3;
  __int128 v4;
  CFIndex v5;
  uint64_t v6;
  uint64_t v7;
  int v8;
  int v9;
  uint64_t v10;
  size_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  int v15;
  uint64_t v16;
  int v17;
  uint64_t v19;
  uint64_t v20;
  char v21;
  uint64_t v22;
  char *v23;
  int i;
  uint64_t v25;
  size_t v26;
  size_t v27;
  char *v28;
  int v29;
  unsigned int v31;
  unsigned int v32;
  unsigned int v33;
  char *v35;
  uint64_t v36;
  int v37;
  unsigned int v38;
  int v39;
  char v40;
  int v41;
  int v42;
  int v43;
  char v44;
  uint64_t v45;
  unsigned int v46;
  unsigned int v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  unsigned int v51;
  uint64_t v52;
  unsigned __int8 *v53;
  unsigned int v54;
  uint64_t v55;
  _BYTE *v57;
  unsigned int v58;
  uint64_t v59;
  signed int v60;
  int v63;
  unint64_t v64;
  BOOL v65;
  int v66;
  uint64_t v67;
  void *v69;
  id v70;
  void *v71;
  int v72;
  CFIndex length;
  _OWORD v74[16];
  uint64_t v75;
  CFRange v76;

  v75 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  *(_QWORD *)&v4 = 0xAAAAAAAAAAAAAAAALL;
  *((_QWORD *)&v4 + 1) = 0xAAAAAAAAAAAAAAAALL;
  v74[14] = v4;
  v74[15] = v4;
  v74[12] = v4;
  v74[13] = v4;
  v74[10] = v4;
  v74[11] = v4;
  v74[8] = v4;
  v74[9] = v4;
  v74[6] = v4;
  v74[7] = v4;
  v74[4] = v4;
  v74[5] = v4;
  v74[2] = v4;
  v74[3] = v4;
  v74[0] = v4;
  v74[1] = v4;
  v76.length = -[__CFString length](v3, "length");
  length = v76.length;
  v76.location = 0;
  MFStringGetBytes(v3, v76, 0x600u, 0, 0, (UInt8 *)v74, 256, &length);
  v5 = length;
  if (!length)
    goto LABEL_171;
  v6 = 0;
  if (length == 256)
    v5 = 255;
  *((_BYTE *)v74 + v5) = 0;
  v7 = MEMORY[0x1E0C80978];
  while (1)
  {
    v8 = *((unsigned __int8 *)v74 + v6);
    if (*((char *)v74 + v6) < 0)
      break;
    if ((*(_DWORD *)(v7 + 4 * *((unsigned __int8 *)v74 + v6) + 60) & 0x4000) == 0)
      goto LABEL_10;
LABEL_9:
    ++v6;
  }
  if (__maskrune(*((unsigned __int8 *)v74 + v6), 0x4000uLL))
    goto LABEL_9;
LABEL_10:
  v9 = v8 - 48;
  if ((v8 - 48) < 0xA)
  {
    LODWORD(v10) = -1;
    goto LABEL_28;
  }
  v10 = 0;
  while (1)
  {
    v11 = strlen(kDayStrs[v10]);
    if (!memcmp(kDayStrs[v10], (char *)v74 + v6, v11))
      break;
    if (++v10 == 14)
      goto LABEL_171;
  }
  v12 = v6 + v11;
  v13 = v6 + v11 - 1;
  do
  {
    v6 = v12;
    v14 = v13;
    v15 = *((unsigned __int8 *)v74 + v12);
    v16 = *((unsigned __int8 *)v74 + v12);
    if (*((char *)v74 + v12) < 0)
      v17 = __maskrune(*((unsigned __int8 *)v74 + v12), 0x4000uLL);
    else
      v17 = *(_DWORD *)(v7 + 4 * v16 + 60) & 0x4000;
    ++v12;
    v13 = v14 + 1;
  }
  while (v15 == 44 || v17 != 0);
  if (v10 >= 7)
    LODWORD(v10) = v10 - 7;
  v9 = v16 - 48;
  if ((v16 - 48) < 0xA)
  {
LABEL_28:
    LODWORD(v19) = -1;
    goto LABEL_29;
  }
  v19 = 0;
  while (1)
  {
    v27 = strlen(kMonthStrs[v19]);
    if (!memcmp(kMonthStrs[v19], (char *)v74 + v6, v27))
      break;
    if (++v19 == 12)
      goto LABEL_171;
  }
  v6 = v14 + v27;
  v35 = (char *)v74 + v27 - 1;
  do
  {
    v36 = v35[v12];
    if (v35[v12] < 0)
      v37 = __maskrune(v35[v12], 0x4000uLL);
    else
      v37 = *(_DWORD *)(v7 + 4 * v36 + 60) & 0x4000;
    ++v35;
    ++v6;
  }
  while (v37);
  v9 = v36 - 48;
  if ((v36 - 48) > 9)
    goto LABEL_171;
LABEL_29:
  LODWORD(v20) = 0;
  v21 = 1;
  do
  {
    v20 = (v9 + 10 * v20);
    v22 = *((unsigned __int8 *)v74 + ++v6);
    if ((v21 & 1) == 0)
      break;
    v21 = 0;
    v9 = v22 - 48;
  }
  while ((v22 - 48) < 0xA);
  if ((v22 & 0x80) == 0)
    goto LABEL_36;
LABEL_35:
  for (i = __maskrune(v22, 0x4000uLL); v22 == 45 || i; i = *(_DWORD *)(v7 + 4 * v22 + 60) & 0x4000)
  {
    v23 = (char *)v74 + v6++;
    v22 = v23[1];
    if ((v22 & 0x80) != 0)
      goto LABEL_35;
LABEL_36:
    ;
  }
  if ((_DWORD)v19 == -1)
  {
    v19 = 0;
    while (1)
    {
      v26 = strlen(kMonthStrs[v19]);
      if (!memcmp(kMonthStrs[v19], (char *)v74 + v6, v26))
        break;
      if (++v19 == 12)
        goto LABEL_171;
    }
    v28 = (char *)v74 + v6 + v26;
    v6 = v6 + v26 - 1;
    do
    {
      v22 = *v28;
      if (*v28 < 0)
        v29 = __maskrune(*v28, 0x4000uLL);
      else
        v29 = *(_DWORD *)(v7 + 4 * v22 + 60) & 0x4000;
      ++v28;
      ++v6;
    }
    while (v22 == 45 || v29 != 0);
    v31 = v22 - 48;
    if ((v22 - 48) > 9)
    {
      LODWORD(v25) = 0;
    }
    else
    {
      LODWORD(v25) = 0;
      v32 = 0;
      do
      {
        LODWORD(v25) = v31 + 10 * v25;
        v33 = *v28++;
        v22 = v33;
        ++v6;
        v31 = v33 - 48;
      }
      while (v33 - 48 <= 9 && v32++ < 3);
    }
    if ((v22 & 0x80) == 0)
      goto LABEL_79;
    while (__maskrune(v22, 0x4000uLL))
    {
      while (1)
      {
        v22 = *((unsigned __int8 *)v74 + ++v6);
        if ((v22 & 0x80) != 0)
          break;
LABEL_79:
        if ((*(_DWORD *)(v7 + 4 * v22 + 60) & 0x4000) == 0)
          goto LABEL_80;
      }
    }
  }
  else
  {
    LODWORD(v25) = -1;
  }
LABEL_80:
  v38 = v22 - 48;
  if (v38 > 9)
  {
    v39 = 0;
  }
  else
  {
    v39 = 0;
    v40 = 1;
    do
    {
      v39 = v38 + 10 * v39;
      v22 = *((unsigned __int8 *)v74 + ++v6);
      if ((v40 & 1) == 0)
        break;
      v40 = 0;
      v38 = v22 - 48;
    }
    while ((v22 - 48) < 0xA);
  }
  if (v22 != 58)
    goto LABEL_171;
  v41 = *((unsigned __int8 *)v74 + v6 + 1);
  v42 = v41 - 48;
  if ((v41 - 48) > 9)
  {
    v43 = 0;
  }
  else
  {
    v43 = 0;
    v44 = 1;
    do
    {
      v43 = v42 + 10 * v43;
      v41 = *((unsigned __int8 *)v74 + v6++ + 2);
      if ((v44 & 1) == 0)
        break;
      v44 = 0;
      v42 = v41 - 48;
    }
    while ((v41 - 48) < 0xA);
  }
  if (v41 != 58)
    goto LABEL_171;
  v45 = v6 + 2;
  v46 = *((unsigned __int8 *)v74 + v6 + 2) - 48;
  if (v46 > 9)
  {
    v72 = 0;
  }
  else
  {
    v45 = v6 + 3;
    v47 = *((unsigned __int8 *)v74 + v6 + 3) - 48;
    if (v47 < 0xA)
      v46 = v47 + 10 * v46;
    v72 = v46;
    if (v47 < 0xA)
      v45 = v6 + 4;
  }
  v48 = v45 + 1;
  v49 = *((unsigned __int8 *)v74 + v45 + 1);
  if ((_DWORD)v25 == -1)
  {
    v50 = v45 + 2;
    if ((v49 & 0x80) == 0)
      goto LABEL_107;
    while (__maskrune(v49, 0x4000uLL))
    {
      while (1)
      {
        v49 = *((unsigned __int8 *)v74 + v50++);
        if ((v49 & 0x80) != 0)
          break;
LABEL_107:
        if ((*(_DWORD *)(v7 + 4 * v49 + 60) & 0x4000) == 0)
          goto LABEL_108;
      }
    }
LABEL_108:
    v51 = v49 - 48;
    if (v51 > 9)
    {
      LODWORD(v25) = 0;
      v48 = v50 - 1;
    }
    else
    {
      v52 = 0;
      LODWORD(v25) = 0;
      v53 = (unsigned __int8 *)v74 + v50;
      do
      {
        v54 = *v53++;
        v49 = v54;
        LODWORD(v25) = v51 + 10 * v25;
        v51 = v54 - 48;
        v55 = v52 + 1;
      }
      while (v54 - 48 <= 9 && v52++ < 3);
      v48 = v50 + v55 - 1;
    }
  }
  v57 = (char *)v74 + v48 + 2;
  if ((v49 & 0x80) == 0)
    goto LABEL_122;
  while (__maskrune(v49, 0x4000uLL))
  {
    while (1)
    {
      v49 = *(v57++ - 1);
      if ((v49 & 0x80) != 0)
        break;
LABEL_122:
      if ((*(_DWORD *)(v7 + 4 * v49 + 60) & 0x4000) == 0)
        goto LABEL_123;
    }
  }
LABEL_123:
  if (v49)
  {
    if (v49 == 45 || v49 == 43)
    {
      v58 = *(v57 - 1) - 48;
      if (v58 > 9)
      {
        v60 = 0;
      }
      else
      {
        v59 = 0;
        v60 = 0;
        do
        {
          v60 = v58 + 10 * v60;
          v58 = v57[v59] - 48;
        }
        while (v58 <= 9 && v59++ < 3);
      }
      v63 = 60 * (v60 % 100) + 3600 * (v60 / 100);
      if (v49 == 45)
        v63 = -v63;
      goto LABEL_143;
    }
    if (*((_WORD *)v57 - 1) != 19783 || *v57 != 84)
      goto LABEL_171;
  }
  v63 = 0;
LABEL_143:
  if ((int)v25 >= 100)
    v25 = v25;
  else
    v25 = (v25 + 1900);
  if ((v20 - 32) < 0xFFFFFFE1)
    goto LABEL_171;
  if ((_DWORD)v19 == 1)
  {
    if ((_DWORD)v20 == 29)
    {
      if ((v25 & 3) != 0)
        goto LABEL_171;
      HIDWORD(v64) = -1030792151 * v25 + 85899344;
      LODWORD(v64) = HIDWORD(v64);
      if ((v64 >> 2) <= 0x28F5C28)
      {
        if ((int)v25 % 400)
          goto LABEL_171;
      }
    }
    else if (v20 > 0x1C)
    {
      goto LABEL_171;
    }
  }
  else if ((_DWORD)v20 == 31 && (v19 - 3) < 8 && ((0xA5u >> (v19 - 3)) & 1) != 0)
  {
    goto LABEL_171;
  }
  if ((v25 - 2100) >= 0xFFFFFF39
    && ((v25 & 3) == 0 ? (v65 = (int)v19 < 2) : (v65 = 0),
        v65 ? (v66 = -2) : (v66 = -1),
        (_DWORD)v10 == (int)(v25 - 1900 + v20 + ((v25 - 1900) >> 2) + v66 + monthStarts[(int)v19]) % 7))
  {
    v67 = 0;
    if (v39 <= 23 && v43 <= 59 && v72 <= 59)
    {
      if (v49)
        objc_msgSend(MEMORY[0x1E0C99E80], "timeZoneForSecondsFromGMT:", v63);
      else
        objc_msgSend(MEMORY[0x1E0C99E80], "systemTimeZone");
      v69 = (void *)objc_claimAutoreleasedReturnValue();
      v70 = objc_alloc_init(MEMORY[0x1E0C99D78]);
      objc_msgSend(MEMORY[0x1E0C99D48], "calendarWithIdentifier:", *MEMORY[0x1E0C996C8]);
      v71 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v70, "setCalendar:", v71);

      objc_msgSend(v70, "setYear:", v25);
      objc_msgSend(v70, "setMonth:", (int)v19 + 1);
      objc_msgSend(v70, "setDay:", v20);
      objc_msgSend(v70, "setHour:", v39);
      objc_msgSend(v70, "setMinute:", v43);
      objc_msgSend(v70, "setSecond:", v72);
      objc_msgSend(v70, "setTimeZone:", v69);
      objc_msgSend(v70, "date");
      v67 = objc_claimAutoreleasedReturnValue();

    }
  }
  else
  {
LABEL_171:
    v67 = 0;
  }

  if (!v67)
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "mf_copyLenientDateInCommonFormatsWithString:", v3);
    v67 = objc_claimAutoreleasedReturnValue();
  }

  return v67;
}

@end
