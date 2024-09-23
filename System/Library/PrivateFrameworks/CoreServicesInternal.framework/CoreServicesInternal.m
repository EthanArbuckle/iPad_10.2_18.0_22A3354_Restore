uint64_t _FSURLCopyResourcePropertyForKey(const __CFURL *a1, const __CFString *a2, void **a3, const void *a4, __CFError **a5)
{
  return _FSURLCopyResourcePropertyForKeyInternal(a1, a2, a3, a4, a5, 1);
}

CFTypeRef FileCachePropertyValueRetainCallBack(const __CFAllocator *a1, CFTypeRef cf)
{
  if (cf)
    return CFRetain(cf);
  else
    return 0;
}

void FileCachePropertyValueReleaseCallBack(const __CFAllocator *a1, CFTypeRef cf)
{
  if (cf)
    CFRelease(cf);
}

double _FileCacheInit(const void *a1)
{
  double result;

  *((_QWORD *)a1 + 3) = 0;
  *((_QWORD *)a1 + 4) = 0;
  *((_QWORD *)a1 + 5) = 0;
  atomic_store(0xFFFFFFFF, (unsigned int *)a1 + 4);
  atomic_store(0, (unsigned int *)a1 + 5);
  atomic_store(0xFFFFFFFF, (unsigned int *)a1 + 4);
  result = 0.0;
  *((_OWORD *)a1 + 18) = 0u;
  *((_OWORD *)a1 + 19) = 0u;
  *((_OWORD *)a1 + 16) = 0u;
  *((_OWORD *)a1 + 17) = 0u;
  *((_OWORD *)a1 + 14) = 0u;
  *((_OWORD *)a1 + 15) = 0u;
  *((_OWORD *)a1 + 12) = 0u;
  *((_OWORD *)a1 + 13) = 0u;
  *((_OWORD *)a1 + 10) = 0u;
  *((_OWORD *)a1 + 11) = 0u;
  *((_OWORD *)a1 + 8) = 0u;
  *((_OWORD *)a1 + 9) = 0u;
  *((_OWORD *)a1 + 6) = 0u;
  *((_OWORD *)a1 + 7) = 0u;
  *((_OWORD *)a1 + 4) = 0u;
  *((_OWORD *)a1 + 5) = 0u;
  *((_OWORD *)a1 + 3) = 0u;
  return result;
}

uint64_t _FileCacheGetName(uint64_t a1)
{
  return *(_QWORD *)(a1 + 56);
}

CFDictionaryRef _FSURLCopyResourcePropertiesForKeys(const __CFURL *a1, const __CFArray *a2, const void *a3, __CFError **a4)
{
  return _FSURLCopyResourcePropertiesForKeysInternal(a1, a2, a3, a4, 1);
}

BOOL volumePropertyProviderPrepareValues(const __CFString *a1, uint64_t a2, uint64_t a3, CFTypeRef **a4, uint64_t a5, uint64_t a6, CFErrorRef *a7)
{
  uint64_t v12;
  char *v13;
  fsid *Attributes;
  int v15;
  const __CFAllocator *v16;
  fsid *v17;
  const __CFString *v18;
  char *v19;
  CFErrorRef *v20;
  const __CFString *v21;
  int *v22;
  const __CFString *v23;
  const __CFAllocator *v24;
  int v25;
  int32_t MountID;
  BOOL v27;
  const void *v28;
  const void *v29;
  const void *v30;
  const void *v31;
  CFTypeRef *v32;
  const void *v33;
  __CFData *VolumeInfo;
  UInt8 *MutableBytePtr;
  UInt8 *v36;
  fsid *v37;
  const __CFString *v38;
  char *v39;
  CFTypeRef v40;
  int PropertyValueForKey;
  const void *v42;
  uint64_t VolumeName;
  const char *v44;
  const __CFAllocator *v45;
  CFStringRef v46;
  uint64_t v47;
  CFTypeRef v48;
  uint64_t v49;
  CFTypeRef v50;
  const void *v51;
  CFTypeRef v52;
  int v53;
  CFTypeRef v54;
  int v55;
  char *MountPoint;
  fsid v57;
  int StatfsByFSID;
  int v59;
  char *v60;
  int v61;
  const __CFAllocator *v62;
  const char *v63;
  fsid v64;
  int v65;
  int v66;
  const char *v67;
  fsid v68;
  int v69;
  const char *v70;
  int v71;
  fsid v72;
  int v73;
  CFStringRef v74;
  double v75;
  CFStringRef v76;
  fsid v77;
  int v78;
  CFStringRef v79;
  double v80;
  CFStringRef v81;
  fsid v82;
  size_t v83;
  const __CFAllocator *v84;
  fsid *v85;
  const char *v86;
  int v87;
  fsid v88;
  size_t v89;
  CFStringRef v90;
  fsid *v92;
  char *v93;
  const __CFString *v94;
  const void *v95;
  const void *v96;
  const void *v97;
  const void *v98;
  CFAllocatorRef v99;
  const void *v100;
  const void *v101;
  const void *v102;
  char *f_mntonname;
  const void *v104;
  CFTypeRef v105;
  CFTypeRef v106;
  CFTypeRef v107;
  int v108;
  CFErrorRef *v109;
  fsid **v110;
  _BOOL4 v111;
  int v112;
  int v113;
  unsigned int v114;
  fsid v115;
  const char *v116;
  void *v117;
  __int128 v118;
  uint64_t v119;
  statfs v120;
  uint64_t v121;

  v121 = *MEMORY[0x1E0C80C00];
  v116 = 0;
  v117 = 0;
  v12 = MountInfoStorageSize();
  v13 = (char *)&v92 - ((MEMORY[0x1E0C80A78](v12) + 15) & 0xFFFFFFFFFFFFFFF0);
  _FileCacheLock(a2);
  Attributes = (fsid *)_FileCacheGetAttributes(a2);
  if ((Attributes->val[0] & 2) == 0)
  {
    _FileCacheUnlock(a2);
    if (CFURLGetFileSystemRepresentation((CFURLRef)a1, 1u, (UInt8 *)&v120, 1024))
    {
      v118 = xmmword_1817D5288;
      v119 = 0;
      v15 = filtered_getattrlist((char *)&v120, &v118, &v114, 0xCuLL, 0x21u);
      _FileCacheLock(a2);
      if (v15)
      {
        if (a7)
        {
          v16 = CFGetAllocator(a1);
          v94 = (const __CFString *)a2;
          v17 = Attributes;
          v18 = a1;
          v19 = v13;
          v20 = a7;
          v21 = (const __CFString *)*MEMORY[0x1E0C9AFD0];
          v22 = __error();
          v23 = v21;
          a7 = v20;
          v13 = v19;
          a1 = v18;
          Attributes = v17;
          a2 = (uint64_t)v94;
          *a7 = _FSURLCreateStandardError(v16, v23, *v22, 0, a1, 0);
        }
      }
      else
      {
        v25 = v115.val[0];
        Attributes[13] = v115;
        MountID = MountInfoPrepare(&v116, 0, v25, v13, 0, a1, 0);
        if (MountID)
          MountID = MountInfoGetMountID((uint64_t)v116);
        Attributes[14].val[0] = MountID;
        Attributes->val[0] |= 2u;
      }
    }
    else
    {
      if (a7)
      {
        v24 = CFGetAllocator(a1);
        *a7 = _FSURLCreateStandardError(v24, (const __CFString *)*MEMORY[0x1E0C9AFB8], 4, 0, a1, 0);
      }
      _FileCacheLock(a2);
    }
    if ((Attributes->val[0] & 2) == 0)
    {
      v27 = 0;
      goto LABEL_140;
    }
  }
  v110 = &v92;
  if (a5 < 1)
  {
    v111 = 1;
    goto LABEL_139;
  }
  v109 = a7;
  v112 = Attributes[14].val[0];
  v113 = 0;
  v108 = Attributes[13].val[0];
  v28 = (const void *)*MEMORY[0x1E0C9B718];
  v107 = (CFTypeRef)*MEMORY[0x1E0C9B6F8];
  v29 = (const void *)*MEMORY[0x1E0C9ADC8];
  f_mntonname = v120.f_mntonname;
  v105 = (CFTypeRef)*MEMORY[0x1E0C9B780];
  v98 = (const void *)*MEMORY[0x1E0C9AE40];
  v97 = (const void *)*MEMORY[0x1E0C9AE50];
  v104 = (const void *)*MEMORY[0x1E0C9B730];
  v30 = (const void *)*MEMORY[0x1E0C9B688];
  v99 = (CFAllocatorRef)*MEMORY[0x1E0C9AE00];
  v31 = (const void *)*MEMORY[0x1E0C9B680];
  v111 = 1;
  v100 = (const void *)*MEMORY[0x1E0C9B7D8];
  v96 = (const void *)*MEMORY[0x1E0C9B728];
  v95 = (const void *)*MEMORY[0x1E0C9B710];
  v106 = v29;
  v101 = v31;
  v102 = v30;
  while (1)
  {
    v32 = *a4;
    if ((*a4)[3])
      goto LABEL_40;
    v33 = v28;
    if (CFEqual(*v32, CFSTR("__kCFURLCheapVolumeInformationKey")))
    {
      if (!v113 && !_FileCacheGetVolumeInfo(a2))
      {
        if (v112 && !MountInfoPrepare(&v116, v112, v108, v13, 0, a1, v109))
          goto LABEL_141;
        prepareCheapVolumeInformation(a1, a2, (uint64_t)v116);
      }
LABEL_38:
      v113 = 1;
      goto LABEL_39;
    }
    if (!CFEqual(*v32, CFSTR("__kCFURLExpensiveVolumeInformationKey")))
      break;
    if (!v113 && !_FileCacheGetVolumeInfo(a2))
    {
      if (v112 && !MountInfoPrepare(&v116, v112, v108, v13, 0, a1, v109))
      {
LABEL_141:
        v111 = 0;
        goto LABEL_139;
      }
      prepareCheapVolumeInformation(a1, a2, (uint64_t)v116);
    }
    VolumeInfo = (__CFData *)_FileCacheGetVolumeInfo(a2);
    MutableBytePtr = CFDataGetMutableBytePtr(VolumeInfo);
    if (!MutableBytePtr)
      goto LABEL_38;
    v36 = MutableBytePtr;
    v28 = v33;
    if (*(_QWORD *)MutableBytePtr == -1)
    {
      if (v112)
      {
        if (!MountInfoPrepare(&v116, v112, v108, v13, 0, a1, v109))
          goto LABEL_141;
        MountInfoGetMutableVolumeInfo(v116, v36, (_QWORD *)v36 + 1, (_QWORD *)v36 + 2, (uint64_t *)v36 + 3);
        goto LABEL_38;
      }
      *(_OWORD *)MutableBytePtr = 0u;
      *((_OWORD *)MutableBytePtr + 1) = 0u;
    }
    v113 = 1;
LABEL_40:
    ++a4;
    if (!--a5)
      goto LABEL_139;
  }
  v37 = Attributes;
  v38 = a1;
  v39 = v13;
  if (CFEqual(*v32, v33))
  {
    if (_FileCacheGetPropertyValueForKey(a2, v33, &v117))
    {
      v28 = v33;
LABEL_46:
      a1 = v38;
      Attributes = v37;
      goto LABEL_40;
    }
    a1 = v38;
    Attributes = v37;
    if (v112)
    {
      if (!MountInfoPrepare(&v116, v112, v108, v13, 0, a1, v109))
        goto LABEL_141;
      VolumeName = MountInfoGetVolumeName((uint64_t)v116);
      if (VolumeName)
      {
        v44 = (const char *)VolumeName;
        v45 = CFGetAllocator(a1);
        v46 = CFStringCreateWithCString(v45, v44, 0x8000100u);
        v47 = a2;
        v48 = v33;
LABEL_51:
        _FileCacheSetPropertyValueForKey(v47, v48, v46);
        if (v46)
          CFRelease(v46);
LABEL_39:
        v28 = v33;
        goto LABEL_40;
      }
    }
    v49 = a2;
    v50 = v33;
LABEL_55:
    v51 = 0;
LABEL_56:
    _FileCacheSetPropertyValueForKey(v49, v50, v51);
    goto LABEL_39;
  }
  v40 = v107;
  if (CFEqual(*v32, v107))
  {
    PropertyValueForKey = _FileCacheGetPropertyValueForKey(a2, v40, &v117);
    v42 = v40;
    v13 = v39;
    if (!PropertyValueForKey)
      _FileCacheSetPropertyValueForKey(a2, v42, 0);
    v28 = v33;
    goto LABEL_46;
  }
  v52 = v106;
  v53 = CFEqual(*v32, v106);
  v93 = v39;
  if (v53)
  {
    a1 = v38;
    if (_FileCacheGetPropertyValueForKey(a2, v52, &v117))
    {
      v28 = v33;
      Attributes = v37;
      v13 = v93;
      goto LABEL_40;
    }
    Attributes = v37;
    v57 = v37[13];
    StatfsByFSID = GetStatfsByFSID(v57, &v120);
    v13 = v93;
    if (!StatfsByFSID)
    {
      v62 = CFGetAllocator(a1);
      v46 = CFStringCreateWithCString(v62, f_mntonname, 0x8000100u);
      v47 = a2;
      v48 = v106;
      goto LABEL_51;
    }
    v49 = a2;
    v50 = v106;
    goto LABEL_55;
  }
  v54 = v105;
  a1 = v38;
  if (CFEqual(*v32, v105))
  {
    v55 = _FileCacheGetPropertyValueForKey(a2, v54, &v117);
    Attributes = v37;
    v13 = v93;
    if (v55)
      goto LABEL_39;
    if (v112)
    {
      if (!MountInfoPrepare(&v116, v112, v108, v93, 0, a1, v109))
        goto LABEL_141;
      MountPoint = (char *)MountInfoGetMountPoint((uint64_t)v116);
      if (!MountPoint)
      {
LABEL_86:
        v51 = 0;
        goto LABEL_87;
      }
    }
    else
    {
      v64 = v37[13];
      v65 = GetStatfsByFSID(v64, &v120);
      MountPoint = f_mntonname;
      if (v65)
        goto LABEL_86;
    }
    v118 = xmmword_1817D52A0;
    v119 = 0;
    v66 = filtered_getattrlist(MountPoint, &v118, &v120, 0x24uLL, 0x21u);
    v51 = 0;
    if (!v66)
    {
      if ((v120.f_bfree & 0x20000000000000) == 0)
        goto LABEL_86;
      if ((v120.f_iosize & 0x200000) != 0)
        v51 = v98;
      else
        v51 = v97;
    }
LABEL_87:
    v49 = a2;
    v50 = v105;
    goto LABEL_56;
  }
  v59 = CFEqual(*v32, v104);
  Attributes = v37;
  v13 = v93;
  if (v59)
  {
    if (_FileCacheGetPropertyValueForKey(a2, v104, &v117))
      goto LABEL_39;
    if (v112)
    {
      if (!MountInfoPrepare(&v116, v112, v108, v13, 0, a1, v109))
        goto LABEL_141;
      v60 = (char *)MountInfoGetMountPoint((uint64_t)v116);
      if (v60)
      {
LABEL_73:
        v118 = xmmword_1817D52A0;
        v119 = 0;
        v61 = filtered_getattrlist(v60, &v118, &v120, 0x24uLL, 0x21u);
        v51 = 0;
        v50 = v104;
        if (!v61)
        {
          if ((v120.f_bfree & 0x40000000000000) != 0)
          {
            if ((v120.f_iosize & 0x400000) != 0)
              v51 = v98;
            else
              v51 = v97;
          }
          else
          {
            v51 = 0;
          }
        }
        goto LABEL_96;
      }
    }
    else
    {
      v68 = v37[13];
      v69 = GetStatfsByFSID(v68, &v120);
      v60 = f_mntonname;
      if (!v69)
        goto LABEL_73;
    }
    v51 = 0;
    v50 = v104;
LABEL_96:
    v49 = a2;
    goto LABEL_56;
  }
  if (CFEqual(*v32, v102))
  {
    if (_FileCacheGetPropertyValueForKey(a2, v102, &v117))
      goto LABEL_39;
    if (v112)
    {
      if (!MountInfoPrepare(&v116, v112, v108, v13, 0, a1, v109))
        goto LABEL_141;
      v63 = (const char *)MountInfoGetMountPoint((uint64_t)v116);
      if (!v63)
        goto LABEL_110;
LABEL_108:
      v74 = CFStringCreateWithFileSystemRepresentation(v99, v63);
      if (v74)
      {
        v76 = v74;
        v94 = (const __CFString *)Call_CacheDeleteCopyAvailableSpaceForVolume(v75);
        CFRelease(v76);
        v47 = a2;
        v48 = v102;
LABEL_125:
        v46 = v94;
        goto LABEL_51;
      }
    }
    else
    {
      v72 = v37[13];
      v73 = GetStatfsByFSID(v72, &v120);
      v63 = f_mntonname;
      if (!v73)
        goto LABEL_108;
    }
LABEL_110:
    v49 = a2;
    v50 = v102;
    goto LABEL_55;
  }
  if (CFEqual(*v32, v101))
  {
    if (_FileCacheGetPropertyValueForKey(a2, v101, &v117))
      goto LABEL_39;
    if (v112)
    {
      if (!MountInfoPrepare(&v116, v112, v108, v13, 0, a1, v109))
        goto LABEL_141;
      v67 = (const char *)MountInfoGetMountPoint((uint64_t)v116);
      if (!v67)
        goto LABEL_117;
LABEL_115:
      v79 = CFStringCreateWithFileSystemRepresentation(v99, v67);
      if (v79)
      {
        v81 = v79;
        v94 = (const __CFString *)Call_CacheDeleteCopyAvailableSpaceForVolume(v80);
        CFRelease(v81);
        v47 = a2;
        v48 = v101;
        goto LABEL_125;
      }
    }
    else
    {
      v77 = v37[13];
      v78 = GetStatfsByFSID(v77, &v120);
      v67 = f_mntonname;
      if (!v78)
        goto LABEL_115;
    }
LABEL_117:
    v49 = a2;
    v50 = v101;
    goto LABEL_55;
  }
  if (CFEqual(*v32, v100) || CFEqual(*v32, v96))
  {
    if (_FileCacheGetPropertyValueForKey(a2, v100, &v117)
      && _FileCacheGetPropertyValueForKey(a2, v96, &v117))
    {
      goto LABEL_39;
    }
    v118 = 0uLL;
    v114 = 0;
    if (v112)
    {
      if (MountInfoPrepare(&v116, v112, v108, v13, 0, a1, v109))
      {
        v70 = (const char *)MountInfoGetMountPoint((uint64_t)v116);
        v71 = _FSGetTypeInfoForPath(v70, (char *)&v118, 0x10uLL, &v114);
        goto LABEL_120;
      }
    }
    else
    {
      v82 = v37[13];
      if (!GetStatfsByFSID(v82, &v120))
      {
        v71 = _FSGetTypeInfoFromStatfs((uint64_t)&v120, (char *)&v118, 0x10uLL, &v114);
LABEL_120:
        v111 = v71 == 0;
      }
    }
    if (!v111)
      goto LABEL_141;
    *(_QWORD *)&v120.f_bsize = v114;
    v83 = strlen((const char *)&v118);
    v84 = v99;
    v92 = (fsid *)CFStringCreateWithBytes(v99, (const UInt8 *)&v118, v83, 0x8000100u, 0);
    v94 = (const __CFString *)CFNumberCreate(v84, kCFNumberSInt64Type, &v120);
    v85 = v92;
    _FileCacheSetPropertyValueForKey(a2, v100, v92);
    if (v85)
      CFRelease(v85);
    v47 = a2;
    v48 = v96;
    goto LABEL_125;
  }
  if (!CFEqual(*v32, v95))
    goto LABEL_39;
  v92 = v37;
  v94 = (const __CFString *)a2;
  if (_FileCacheGetPropertyValueForKey(a2, v95, &v117))
  {
LABEL_137:
    Attributes = v92;
    a2 = (uint64_t)v94;
    goto LABEL_39;
  }
  bzero(&v118, 0x400uLL);
  if (v112)
  {
    if (MountInfoPrepare(&v116, v112, v108, v13, 0, a1, v109))
    {
      v86 = (const char *)MountInfoGetMountPoint((uint64_t)v116);
      v87 = _FSGetLocationForPath(v86, (char *)&v118, 0x400uLL);
      goto LABEL_133;
    }
  }
  else
  {
    v88 = v92[13];
    if (!GetStatfsByFSID(v88, &v120))
    {
      v87 = _FSGetLocationFromStatfs((uint64_t)&v120, (char *)&v118, 0x400uLL);
LABEL_133:
      v111 = v87 == 0;
    }
  }
  if (v111)
  {
    v89 = strlen((const char *)&v118);
    v90 = CFStringCreateWithBytes(v99, (const UInt8 *)&v118, v89, 0x8000100u, 0);
    _FileCacheSetPropertyValueForKey((uint64_t)v94, v95, v90);
    if (v90)
      CFRelease(v90);
    goto LABEL_137;
  }
  v111 = 0;
  a2 = (uint64_t)v94;
LABEL_139:
  MountInfoDestroy(v116);
  v27 = v111;
LABEL_140:
  _FileCacheUnlock(a2);
  return v27;
}

uint64_t parseAttributeBuffer(CFAllocatorRef alloc, const char *a2, _DWORD *a3, _DWORD *a4, uint64_t a5, uint64_t a6, int a7)
{
  int v7;
  unsigned int v10;
  int v11;
  int v12;
  unsigned int v13;
  uint64_t v14;
  unsigned int v15;
  unsigned int v16;
  _DWORD *v17;
  int v18;
  unsigned int v19;
  int v20;
  _BOOL4 v21;
  UInt8 *v22;
  int v23;
  _BOOL4 v24;
  UInt8 *v26;
  int v27;
  uint64_t v28;
  int v29;
  uint64_t *v30;
  double v31;
  uint64_t v32;
  uint64_t v33;
  double v34;
  uint64_t v35;
  uint64_t v36;
  double v37;
  uint64_t v38;
  uint64_t v39;
  double v40;
  uint64_t v41;
  uint64_t v42;
  int *v43;
  int v44;
  uint64_t v45;
  int v46;
  __int128 v47;
  __int128 v48;
  int8x8_t *v49;
  int8x8_t v50;
  int8x8_t v51;
  int v52;
  int v53;
  int v54;
  int v55;
  int v56;
  int v57;
  int v58;
  int v59;
  char v60;
  int v61;
  int *v62;
  int v63;
  acl_t v64;
  __int128 v65;
  __int128 v66;
  uint64_t v67;
  uint64_t v68;
  const void *v69;
  int v70;
  unsigned int v71;
  uint64_t v72;
  CFIndex v73;
  const void *v74;
  int v75;
  int *v76;
  const UInt8 *v77;
  int v78;
  CFStringRef v79;
  double v80;
  uint64_t v81;
  uint64_t v82;
  int v83;
  BOOL v84;
  unsigned int v85;
  unsigned int v86;
  char v87;
  char v88;
  int v89;
  int v90;
  int v91;
  int v92;
  int v93;
  uint64_t v94;
  int v95;
  char v96;
  uint64_t v97;
  uint64_t v98;
  uint64_t v99;
  uint64_t v100;
  uint64_t v101;
  int *v102;
  int v103;
  uint64_t v104;
  _BOOL4 v105;
  BOOL v106;
  uint64_t v107;
  char *v108;
  int FSID;
  int v110;
  char v111;
  uint64_t v112;
  acl_t v113;
  unint64_t Capabilities;
  int v115;
  char v116;
  const char *VolumeName;
  UInt8 *v118;
  size_t v119;
  const void *v120;
  int v121;
  int v122;
  int v123;
  _filesec *v124;
  _filesec *v125;
  uint64_t v127;
  uint64_t v128;
  _BOOL4 v129;
  int v130;
  const char *v131;
  const unsigned __int8 *v132;
  int v133;
  const unsigned __int8 *v134;
  int v135;
  uint64_t v136;
  int v137;
  acl_t v138;
  uint64_t v139;
  __int16 v140;
  int v141;
  int v142;
  acl_t v143;
  __int128 v144;
  __int128 v145;
  uint64_t v146;

  v7 = a7;
  v136 = a5;
  v131 = a2;
  v146 = *MEMORY[0x1E0C80C00];
  v139 = a5;
  v145 = 0uLL;
  v144 = 0uLL;
  v10 = a3[1];
  v11 = a3[3];
  v12 = a3[4];
  v13 = a3[5];
  v135 = v11;
  if ((v10 & 0x80000000) != 0)
  {
    v16 = a4[1];
    v133 = a4[3];
    v15 = a4[5];
    v137 = a4[4];
    v14 = 6;
  }
  else
  {
    v14 = 1;
    v15 = v13;
    v137 = v12;
    v133 = v11;
    v16 = v10;
  }
  v17 = &a4[v14];
  if (*(_DWORD *)a6 & 1 | ((~v16 & 0x79C0D) == 0))
    v18 = 3;
  else
    v18 = 0;
  v19 = v18 | *(_DWORD *)a6 & 0xFFFFFFFC;
  *(_DWORD *)a6 = v19;
  v20 = dword_1ECD2A4B4 & ~v10 | dword_1ECD2A4C4 & ~v13;
  v21 = v20 != 0;
  if (!v20)
  {
    v19 |= 4u;
    *(_DWORD *)a6 = v19;
  }
  v22 = (UInt8 *)v17 + ((v16 >> 27) & 4);
  if ((dword_1ECD2A4D8 & ~v12) == 0)
    *(_DWORD *)a6 = v19 | 0x40;
  if ((v10 & 1) != 0)
  {
    if ((v16 & 1) != 0)
    {
      v23 = *((_DWORD *)v22 + 1);
      if (!v23)
      {
        syslog(3, "parseAttributeBuffer: ATTR_CMN_NAME was returned with 0 attr_length");
        return 22;
      }
      v130 = v12;
      v24 = v20 != 0;
      SetNameAndHiddenFlagsFromCString(alloc, &v22[*(int *)v22], (v23 - 1), a6);
      v22 += 8;
      v7 = a7;
      v21 = v24;
      v12 = v130;
    }
    else
    {
      SetNameAndHiddenFlagsFromCString(alloc, (UInt8 *)"", 0, a6);
    }
  }
  v26 = &v22[(2 * v16) & 4];
  if ((v10 & 4) != 0)
  {
    if ((v16 & 4) != 0)
    {
      v28 = *(_QWORD *)v26;
      v26 += 8;
      *(_QWORD *)(a6 + 104) = v28;
      if ((v16 & 8) == 0)
        goto LABEL_20;
      goto LABEL_22;
    }
    *(_QWORD *)(a6 + 104) = 0;
  }
  if ((v16 & 8) == 0)
  {
LABEL_20:
    v27 = 0;
    goto LABEL_23;
  }
LABEL_22:
  v29 = *(_DWORD *)v26;
  v26 += 4;
  v27 = v29;
LABEL_23:
  v30 = (uint64_t *)&v26[((v16 >> 4) & 8)
                      + ((v16 >> 2) & 4)
                      + (unint64_t)((v16 >> 2) & 8)
                      + ((v16 >> 3) & 8)
                      + ((v16 >> 6) & 4)];
  if ((v10 & 0x200) != 0)
  {
    if ((v16 & 0x200) != 0)
    {
      v32 = *v30;
      v33 = v30[1];
      v30 += 2;
      v31 = (double)v32 - *MEMORY[0x1E0C9ADF8] + (double)v33 * 0.000000001;
    }
    else
    {
      v31 = -1.0 - *MEMORY[0x1E0C9ADE8];
    }
    *(double *)(a6 + 80) = v31;
    if ((v10 & 0x400) == 0)
    {
LABEL_25:
      if ((v10 & 0x800) == 0)
        goto LABEL_26;
      goto LABEL_36;
    }
  }
  else if ((v10 & 0x400) == 0)
  {
    goto LABEL_25;
  }
  if ((v16 & 0x400) != 0)
  {
    v35 = *v30;
    v36 = v30[1];
    v30 += 2;
    v34 = (double)v35 - *MEMORY[0x1E0C9ADF8] + (double)v36 * 0.000000001;
  }
  else
  {
    v34 = -*MEMORY[0x1E0C9ADF8];
  }
  *(double *)(a6 + 64) = v34;
  if ((v10 & 0x800) == 0)
  {
LABEL_26:
    if ((v10 & 0x1000) == 0)
      goto LABEL_44;
    goto LABEL_40;
  }
LABEL_36:
  if ((v16 & 0x800) != 0)
  {
    v38 = *v30;
    v39 = v30[1];
    v30 += 2;
    v37 = (double)v38 - *MEMORY[0x1E0C9ADF8] + (double)v39 * 0.000000001;
  }
  else
  {
    v37 = -*MEMORY[0x1E0C9ADF8];
  }
  *(double *)(a6 + 72) = v37;
  if ((v10 & 0x1000) != 0)
  {
LABEL_40:
    if ((v16 & 0x1000) != 0)
    {
      v41 = *v30;
      v42 = v30[1];
      v30 += 2;
      v40 = (double)v41 - *MEMORY[0x1E0C9ADF8] + (double)v42 * 0.000000001;
    }
    else
    {
      v40 = -*MEMORY[0x1E0C9ADF8];
    }
    *(double *)(a6 + 56) = v40;
  }
LABEL_44:
  v43 = (int *)((char *)v30 + ((v16 >> 9) & 0x10));
  if ((v10 & 0x4000) != 0)
  {
    if ((v16 & 0x4000) != 0)
    {
      v45 = 0;
      v46 = *(_DWORD *)a6 | 0x10;
      *(_DWORD *)a6 = v46;
      do
      {
        if (*((_BYTE *)v43 + v45))
          break;
        ++v45;
      }
      while (v45 != 32);
      *(_DWORD *)a6 = v46 & 0xFBFFFFFF | ((v45 == 32) << 26);
      v47 = *(_OWORD *)v43;
      v48 = *((_OWORD *)v43 + 1);
      v43 += 8;
      *(_OWORD *)(a6 + 160) = v47;
      *(_OWORD *)(a6 + 176) = v48;
      if (v45 != 32)
      {
        v49 = (int8x8_t *)(a6 + 160);
        if (v27 == 2)
          v50 = vrev16_s8(*v49);
        else
          v50 = vrev32_s8(*v49);
        v51 = vrev16_s8(*(int8x8_t *)(a6 + 168));
        *(int8x8_t *)(a6 + 160) = v50;
        *(int8x8_t *)(a6 + 168) = v51;
        if (v27 == 2)
        {
          *(_WORD *)(a6 + 178) = bswap32(*(unsigned __int16 *)(a6 + 178)) >> 16;
          *(_WORD *)(a6 + 176) = bswap32(*(unsigned __int16 *)(a6 + 176)) >> 16;
          *(_DWORD *)(a6 + 180) = bswap32(*(_DWORD *)(a6 + 180));
        }
        else
        {
          *(int8x8_t *)(a6 + 176) = vrev16_s8(*(int8x8_t *)(a6 + 176));
        }
        *(_WORD *)(a6 + 184) = bswap32(*(unsigned __int16 *)(a6 + 184)) >> 16;
        *(_WORD *)(a6 + 186) = bswap32(*(unsigned __int16 *)(a6 + 186)) >> 16;
        *(_DWORD *)(a6 + 188) = bswap32(*(_DWORD *)(a6 + 188));
      }
    }
    else
    {
      if (v7)
        v44 = 67108880;
      else
        v44 = 0x4000000;
      *(_DWORD *)a6 = v44 | *(_DWORD *)a6 & 0xFBFFFFEF;
      *(_OWORD *)(a6 + 160) = 0u;
      *(_OWORD *)(a6 + 176) = 0u;
    }
  }
  if ((v10 & 0x8000) != 0)
  {
    if ((v16 & 0x8000) != 0)
    {
      v52 = *v43++;
      *(_DWORD *)(a6 + 40) = v52;
      if ((v10 & 0x10000) != 0)
        goto LABEL_69;
    }
    else
    {
      *(_DWORD *)(a6 + 40) = 0;
      if ((v10 & 0x10000) != 0)
        goto LABEL_69;
    }
LABEL_63:
    if ((v10 & 0x20000) == 0)
      goto LABEL_78;
    goto LABEL_73;
  }
  if ((v10 & 0x10000) == 0)
    goto LABEL_63;
LABEL_69:
  if ((v16 & 0x10000) != 0)
  {
    v53 = *v43++;
    *(_DWORD *)(a6 + 44) = v53;
    if ((v10 & 0x20000) == 0)
      goto LABEL_78;
  }
  else
  {
    *(_DWORD *)(a6 + 44) = 0;
    if ((v10 & 0x20000) == 0)
      goto LABEL_78;
  }
LABEL_73:
  if ((v16 & 0x20000) != 0)
  {
    v55 = *v43++;
    v54 = v55;
  }
  else
  {
    v54 = 0;
  }
  *(_DWORD *)(a6 + 16) = v54;
  if ((v27 - 1) <= 6)
    *(_DWORD *)(a6 + 16) = v54 | dword_1817D52B8[v27 - 1];
LABEL_78:
  if ((v10 & 0x40000) == 0)
  {
    if ((v10 & 0x80000) == 0)
      goto LABEL_80;
LABEL_87:
    if ((v16 & 0x80000) != 0)
    {
      v57 = *v43++;
      *(_DWORD *)(a6 + 32) = v57;
      if ((v10 & 0x100000) != 0)
        goto LABEL_91;
    }
    else
    {
      *(_DWORD *)(a6 + 32) = 0;
      if ((v10 & 0x100000) != 0)
        goto LABEL_91;
    }
LABEL_81:
    if ((v10 & 0x200000) == 0)
      goto LABEL_99;
    goto LABEL_95;
  }
  if ((v16 & 0x40000) != 0)
  {
    v56 = *v43++;
    *(_DWORD *)(a6 + 20) = v56;
    if ((v10 & 0x80000) != 0)
      goto LABEL_87;
  }
  else
  {
    *(_DWORD *)(a6 + 20) = 0;
    if ((v10 & 0x80000) != 0)
      goto LABEL_87;
  }
LABEL_80:
  if ((v10 & 0x100000) == 0)
    goto LABEL_81;
LABEL_91:
  if ((v16 & 0x100000) != 0)
  {
    v58 = *v43++;
    *(_DWORD *)(a6 + 36) = v58;
    if ((v10 & 0x200000) == 0)
      goto LABEL_99;
  }
  else
  {
    *(_DWORD *)(a6 + 36) = 0;
    if ((v10 & 0x200000) == 0)
      goto LABEL_99;
  }
LABEL_95:
  v59 = *(_DWORD *)a6 | 8;
  *(_DWORD *)a6 = v59;
  if ((v16 & 0x200000) != 0)
  {
    v61 = *v43++;
    v60 = v61;
  }
  else
  {
    v60 = 0;
  }
  *(_DWORD *)a6 = v59 & 0xFC7FFFFF | ((v60 & 7) << 23);
LABEL_99:
  v138 = 0;
  if ((v10 & 0x400000) == 0 || (v16 & 0x400000) == 0)
  {
    v62 = v43;
    if ((v16 & 0x800000) != 0)
      goto LABEL_109;
    goto LABEL_105;
  }
  v62 = v43 + 2;
  if (!v43[1])
  {
    v138 = 0;
    if ((v16 & 0x800000) != 0)
      goto LABEL_109;
LABEL_105:
    v134 = 0;
    if ((v16 & 0x1000000) == 0)
      goto LABEL_110;
    goto LABEL_106;
  }
  v63 = v27;
  v64 = acl_copy_int_native((char *)v43 + *v43);
  v27 = v63;
  v138 = v64;
  if ((v16 & 0x800000) == 0)
    goto LABEL_105;
LABEL_109:
  v66 = *(_OWORD *)v62;
  v62 += 4;
  v145 = v66;
  v134 = (const unsigned __int8 *)&v145;
  if ((v16 & 0x1000000) == 0)
  {
LABEL_110:
    v132 = 0;
    if ((v10 & 0x2000000) == 0)
      goto LABEL_113;
    goto LABEL_111;
  }
LABEL_106:
  v65 = *(_OWORD *)v62;
  v62 += 4;
  v144 = v65;
  v132 = (const unsigned __int8 *)&v144;
  if ((v10 & 0x2000000) == 0)
  {
LABEL_113:
    if ((v10 & 0x4000000) == 0)
      goto LABEL_114;
LABEL_119:
    if ((v16 & 0x4000000) != 0)
    {
      v68 = *(_QWORD *)v62;
      v62 += 2;
      *(_QWORD *)(a6 + 136) = v68;
      if ((v10 & 0x8000000) != 0)
        goto LABEL_123;
    }
    else
    {
      *(_QWORD *)(a6 + 136) = 0;
      if ((v10 & 0x8000000) != 0)
        goto LABEL_123;
    }
LABEL_115:
    if ((v10 & 0x10000000) == 0)
      goto LABEL_116;
    goto LABEL_133;
  }
LABEL_111:
  if ((v16 & 0x2000000) == 0)
  {
    *(_QWORD *)(a6 + 120) = 0;
    goto LABEL_113;
  }
  v67 = *(_QWORD *)v62;
  v62 += 2;
  *(_QWORD *)(a6 + 120) = v67;
  if ((v10 & 0x4000000) != 0)
    goto LABEL_119;
LABEL_114:
  if ((v10 & 0x8000000) == 0)
    goto LABEL_115;
LABEL_123:
  if ((v16 & 0x8000000) != 0)
  {
    v129 = v21;
    v130 = v12;
    HIDWORD(v128) = v13;
    v71 = v15;
    v72 = *v62;
    v73 = (v62[1] - 1);
    v74 = *(const void **)(a6 + 232);
    if (v74)
    {
      v75 = v27;
      CFRelease(v74);
      v27 = v75;
    }
    v76 = v62 + 2;
    if ((_DWORD)v73)
    {
      v77 = (const UInt8 *)v62 + v72;
      v78 = v27;
      v79 = CFStringCreateWithBytes(alloc, v77, v73, 0x8000100u, 0);
      v27 = v78;
    }
    else
    {
      v79 = 0;
    }
    *(_QWORD *)(a6 + 232) = v79;
    v62 = v76;
    v15 = v71;
    LOWORD(v13) = WORD2(v128);
    LOBYTE(v21) = v129;
    v12 = v130;
  }
  else
  {
    v69 = *(const void **)(a6 + 232);
    if (v69)
    {
      v70 = v27;
      CFRelease(v69);
      v27 = v70;
      *(_QWORD *)(a6 + 232) = 0;
    }
  }
  *(_DWORD *)a6 |= 0x100u;
  if ((v10 & 0x10000000) == 0)
  {
LABEL_116:
    if ((v10 & 0x40000000) == 0)
      goto LABEL_140;
    goto LABEL_137;
  }
LABEL_133:
  if ((v16 & 0x10000000) != 0)
  {
    v81 = *(_QWORD *)v62;
    v82 = *((_QWORD *)v62 + 1);
    v62 += 4;
    v80 = (double)v81 - *MEMORY[0x1E0C9ADF8] + (double)v82 * 0.000000001;
  }
  else
  {
    v80 = -1.0 - *MEMORY[0x1E0C9ADE8];
  }
  *(double *)(a6 + 88) = v80;
  if ((v10 & 0x40000000) != 0)
  {
LABEL_137:
    if ((v16 & 0x40000000) != 0)
    {
      v83 = *v62++;
      *(_DWORD *)(a6 + 48) = v83;
    }
    else
    {
      *(_DWORD *)(a6 + 48) = 0;
    }
  }
LABEL_140:
  v84 = v27 == 2;
  v85 = v137;
  if (!v84)
  {
    v86 = *(_DWORD *)a6 & 0xFFFFDFFF;
    *(_DWORD *)a6 = v86;
    if (!v12)
      goto LABEL_185;
    if ((v12 & 1) != 0)
    {
      if ((v85 & 1) != 0)
      {
        v91 = *v62++;
        v89 = v91;
      }
      else
      {
        v89 = 1;
      }
      *(_DWORD *)(a6 + 24) = v89;
    }
    v62 = (int *)((char *)v62 + ((4 * v85) & 8)
                              + ((2 * v85) & 8)
                              + (unint64_t)((v85 >> 1) & 4)
                              + ((v85 >> 3) & 4));
    if ((v12 & 0x200) == 0)
    {
      if ((v12 & 0x400) == 0)
        goto LABEL_156;
LABEL_169:
      if ((v85 & 0x400) != 0)
      {
        v97 = *(_QWORD *)v62;
        v62 += 2;
        *(_QWORD *)(a6 + 216) = v97;
        if ((v12 & 0x1000) != 0)
          goto LABEL_178;
      }
      else
      {
        *(_QWORD *)(a6 + 216) = 0;
        if ((v12 & 0x1000) != 0)
          goto LABEL_178;
      }
LABEL_157:
      if ((v12 & 0x2000) == 0)
        goto LABEL_185;
LABEL_182:
      if ((v85 & 0x2000) != 0)
      {
        v99 = *(_QWORD *)v62;
        v62 += 2;
        *(_QWORD *)(a6 + 200) = v99;
      }
      else
      {
        *(_QWORD *)(a6 + 200) = 0;
      }
      goto LABEL_185;
    }
    if ((v85 & 0x200) != 0)
    {
      v94 = *(_QWORD *)v62;
      v62 += 2;
      *(_QWORD *)(a6 + 208) = v94;
      if ((v12 & 0x400) != 0)
        goto LABEL_169;
    }
    else
    {
      *(_QWORD *)(a6 + 208) = 0;
      if ((v12 & 0x400) != 0)
        goto LABEL_169;
    }
LABEL_156:
    if ((v12 & 0x1000) == 0)
      goto LABEL_157;
LABEL_178:
    v86 |= 0x20u;
    *(_DWORD *)a6 = v86;
    if ((v85 & 0x1000) != 0)
    {
      v98 = *(_QWORD *)v62;
      v62 += 2;
      *(_QWORD *)(a6 + 192) = v98;
      if ((v12 & 0x2000) == 0)
        goto LABEL_185;
    }
    else
    {
      *(_QWORD *)(a6 + 192) = 0;
      if ((v12 & 0x2000) == 0)
        goto LABEL_185;
    }
    goto LABEL_182;
  }
  *(_OWORD *)(a6 + 192) = 0u;
  *(_OWORD *)(a6 + 208) = 0u;
  v86 = *(_DWORD *)a6 & 0xFFFFFFDF;
  *(_DWORD *)a6 = v86;
  v87 = v135;
  if (!v135)
    goto LABEL_185;
  if ((v135 & 1) == 0)
  {
    v88 = v133;
    if ((v133 & 2) == 0)
      goto LABEL_165;
LABEL_164:
    v93 = *v62++;
    *(_DWORD *)(a6 + 28) = v93;
    v86 |= 0x400u;
    *(_DWORD *)a6 = v86;
    goto LABEL_165;
  }
  v88 = v133;
  if ((v133 & 1) != 0)
  {
    v92 = *v62++;
    v90 = v92;
  }
  else
  {
    v90 = 1;
  }
  *(_DWORD *)(a6 + 24) = v90;
  if ((v88 & 2) != 0)
    goto LABEL_164;
LABEL_165:
  if ((v87 & 4) != 0)
  {
    if ((v88 & 4) != 0)
    {
      v95 = *v62++;
      v86 = v86 & 0xFFFF9FFF | ((v95 & 3) << 13);
      *(_DWORD *)a6 = v86;
      v96 = (v95 & 3) == 0 || v21;
      if ((v96 & 1) == 0)
      {
        *(int64x2_t *)(a6 + 120) = vdupq_n_s64(2uLL);
        *(_QWORD *)(a6 + 136) = 1;
      }
    }
    else
    {
      v86 &= 0xFFFF9FFF;
      *(_DWORD *)a6 = v86;
    }
  }
LABEL_185:
  v100 = 0;
  if ((v13 & 0x10) != 0 && (v15 & 0x10) != 0)
  {
    v101 = *(_QWORD *)v62;
    v62 += 2;
    v100 = v101;
  }
  v102 = (int *)((char *)v62 + ((v15 >> 2) & 8));
  if ((v13 & 0x40) != 0 && (v15 & 0x40) != 0)
  {
    v103 = *v102++;
    *(_DWORD *)(a6 + 100) = v103;
  }
  if ((v13 & 0x100) != 0 && (v15 & 0x100) != 0)
  {
    v104 = *(_QWORD *)v102;
    v102 += 2;
    *(_QWORD *)(a6 + 144) = v104;
  }
  if ((v13 & 0x200) != 0 && (v15 & 0x200) != 0)
  {
    v86 |= 0x200u;
    *(_DWORD *)a6 = v86;
    *(_QWORD *)(a6 + 152) = *(_QWORD *)v102;
  }
  v105 = (dword_1ECD2A49C & ~v10) == 0;
  if ((v86 & 0x4000) != 0)
  {
    *(_DWORD *)a6 = v86 & 0xFF817FFF | 0x400000;
    *(_DWORD *)(a6 + 112) = 0;
    if (!v21)
    {
      *(int64x2_t *)(a6 + 120) = vdupq_n_s64(2uLL);
      *(_OWORD *)(a6 + 136) = xmmword_1817D5150;
    }
    v113 = v138;
    if (!v105)
      goto LABEL_244;
    goto LABEL_226;
  }
  v106 = v21;
  v107 = MountInfoStorageSize();
  v108 = (char *)&v128 - ((MEMORY[0x1E0C80A78](v107) + 15) & 0xFFFFFFFFFFFFFFF0);
  if (v136)
  {
    FSID = MountInfoGetFSID(v136);
    v110 = *(_DWORD *)(a6 + 104);
    if (v110 == FSID)
    {
      v111 = v15;
      v137 = 1;
      v112 = v136;
      goto LABEL_208;
    }
  }
  else
  {
    v110 = *(_DWORD *)(a6 + 104);
  }
  v139 = 0;
  if (!MountInfoPrepare(&v139, 0, v110, v108, 0, 0, 0))
  {
    *(_QWORD *)(a6 + 128) = *(_QWORD *)(a6 + 120);
    v113 = v138;
    goto LABEL_225;
  }
  v111 = v15;
  v137 = 0;
  v112 = v139;
LABEL_208:
  Capabilities = MountInfoGetCapabilities(v112);
  *(_DWORD *)(a6 + 112) = MountInfoGetMountID(v139);
  *(_DWORD *)a6 = (Capabilities >> 44) & 0x10000 | (Capabilities >> 36) & 0x8000 | ((Capabilities & 0x800000000000) >> 30) | (Capabilities >> 40) & 0x80000 | (Capabilities >> 29) & 0x100000 | (Capabilities >> 37) & 0x200000 | *(_DWORD *)a6 & 0xFFC47FFF;
  *(_DWORD *)a6 = *(_DWORD *)a6 & 0xFFBFFFFF | (((MountInfoGetVolumeFlags(v139) >> 1) & 1) << 22);
  *(_DWORD *)(a6 + 96) = MountInfoGetIOBlockSize(v139);
  if ((Capabilities & 0x800000000000) == 0 && (dword_1ECD2A49C & ~v10 & 0xFE3FFFFF) == 0)
    v105 = 1;
  v115 = *(_DWORD *)a6;
  v116 = (*(_DWORD *)a6 & 0x8000) == 0 || v106;
  if ((v116 & 1) == 0)
  {
    if ((v111 & 0x10) == 0)
      v100 = *(_QWORD *)(a6 + 120);
    *(_QWORD *)(a6 + 128) = v100;
  }
  if ((v115 & 0x2000) != 0 && !strcmp(v131, "/"))
  {
    VolumeName = (const char *)MountInfoGetVolumeName(v139);
    if (VolumeName)
    {
      v118 = (UInt8 *)VolumeName;
      v119 = strlen(VolumeName);
      SetNameAndHiddenFlagsFromCString(alloc, v118, v119, a6);
    }
  }
  v113 = v138;
  if ((v137 & 1) == 0)
    MountInfoDestroy(v139);
LABEL_225:
  if (v105)
  {
LABEL_226:
    *(_DWORD *)a6 |= 0x80u;
    v120 = *(const void **)(a6 + 224);
    if (v120)
    {
      CFRelease(v120);
      *(_QWORD *)(a6 + 224) = 0;
    }
    v121 = *(_DWORD *)(a6 + 40);
    v122 = *(_DWORD *)(a6 + 44);
    v123 = *(_DWORD *)(a6 + 16);
    v143 = v113;
    v141 = v122;
    v142 = v121;
    v140 = v123;
    v124 = filesec_init();
    if (!v124)
      goto LABEL_244;
    v125 = v124;
    if (!v113)
      goto LABEL_252;
    if (filesec_set_property(v124, FILESEC_ACL, &v143))
      goto LABEL_243;
    if (!v143)
    {
LABEL_252:
      if (!v134 || uuid_is_null(v134))
      {
LABEL_235:
        if ((!v143 && (!v132 || uuid_is_null(v132)) || !filesec_set_property(v125, FILESEC_GRPUUID, v132))
          && !filesec_set_property(v125, FILESEC_OWNER, &v142)
          && !filesec_set_property(v125, FILESEC_GROUP, &v141)
          && !filesec_set_property(v125, FILESEC_MODE, &v140))
        {
          v127 = _CFFileSecurityCreateFromFilesec();
          *(_QWORD *)(a6 + 224) = v127;
          if (v127)
            goto LABEL_244;
        }
        goto LABEL_243;
      }
    }
    if (!filesec_set_property(v125, FILESEC_UUID, v134))
      goto LABEL_235;
LABEL_243:
    filesec_free(v125);
  }
LABEL_244:
  if (v113)
    acl_free(v113);
  return 0;
}

uint64_t MountInfoStorageSize()
{
  return 3024;
}

uint64_t MountInfoGetCapabilities(uint64_t a1)
{
  return *(_QWORD *)(a1 + 2952);
}

uint64_t MountInfoGetVolumeFlags(uint64_t a1)
{
  unsigned int v1;
  int v2;
  uint64_t v3;
  uint64_t v4;

  v1 = *(_DWORD *)(a1 + 64);
  if ((*(_BYTE *)(a1 + 2136) & 2) != 0)
  {
    v3 = 64;
  }
  else
  {
    v2 = strcmp((const char *)(a1 + 72), "lifs");
    v3 = 128;
    if (!v2)
      v3 = 64;
  }
  v4 = v3 | (v1 << 9) & 0x800000 | ((v1 >> 21) & 2 | (v1 >> 12) & 1 | (v1 >> 18) & 4 | (8 * (v1 & 1)) | (v1 >> 6) & 0x10) ^ 1;
  if ((v1 & 0x80) != 0)
    v4 |= 0x3000000uLL;
  return v4 | (32 * v1) & 0x4000000;
}

uint64_t MountInfoGetMountID(uint64_t a1)
{
  return *(unsigned int *)(a1 + 48);
}

uint64_t MountInfoPrepare(_QWORD *a1, int a2, int a3, char *a4, uint64_t a5, const __CFString *a6, CFErrorRef *a7)
{
  int v12;
  int v13;
  void *v14;
  uint64_t *v15;
  uint64_t result;
  int v17;
  statfs *v18;
  uint64_t v19;
  statfs *v20;
  int v21;
  int32x4_t v22;
  int32x4_t v23;
  __int16 v24;
  const __CFAllocator *v25;
  CFErrorRef v26;
  int8x16_t v27;
  int8x16_t v28;
  int8x16_t v29;
  int32x4_t v30;
  int32x4_t v31;
  uint64x2_t v32;
  int8x16_t v33;
  int32x4_t v34;
  int8x16_t v35;
  int8x16_t v36;
  int8x16_t v37;
  int8x16_t v38;
  int8x16_t v39;
  int8x16_t v40;
  uint64x2_t v41;
  uint64x2_t v42;
  int64x2_t v43;
  int8x16_t v44;
  int8x16_t v45;
  int8x16_t v46;
  int8x16_t v47;
  int8x16_t v48;
  int32x4_t v49;
  int32x4_t v50;
  int32x4_t v51;
  int8x16_t v52;
  int32x4_t v53;
  int8x16_t v54;
  int32x4_t v55;
  int8x16_t v56;
  int32x4_t v57;
  int8x16_t v58;
  int8x16_t v59;
  int8x16_t v60;
  int8x16_t v61;
  int8x16_t v62;
  int8x16_t v63;
  int8x16_t v64;
  int8x16_t v65;
  int8x16_t v66;
  uint64x2_t v67;
  uint64x2_t v68;
  int64x2_t v69;
  uint64x2_t v70;
  uint64x2_t v71;
  uint64x2_t v72;
  uint64x2_t v73;
  int8x16_t v74;
  int8x8_t v75;
  uint64_t v76;
  unint64_t v78;
  unint64_t v79;
  unint64_t v80;
  unint64_t v81;
  char *v82;
  size_t v83;
  size_t v84;
  const char *v85;
  char *v86;
  const char *v87;
  int v88;
  __int128 v89;
  uint64_t v90;
  unint64_t v91;
  _QWORD *v92;
  __int128 v93;
  uint64_t v94;
  char __dst[535];
  statfs *v96;
  int v97;
  __int128 v98;
  _DWORD v99[2];
  int32x2_t v100;
  int32x2_t v101;
  unsigned __int8 v102[16];
  __int128 v103;
  __int128 v104;
  uint64_t v105;
  uint64_t v106;

  v106 = *MEMORY[0x1E0C80C00];
  if (*a1)
    return 1;
  if (a2)
    a3 = a2;
  bzero(a4, 0xBD0uLL);
  if (CreateMountInfo(int,MountInfoBuf *)::onceToken != -1)
    dispatch_once(&CreateMountInfo(int,MountInfoBuf *)::onceToken, &__block_literal_global_5);
  os_unfair_lock_lock(&sMountEntrysSpinLock);
  while (1)
  {
    v12 = __ldaxr(sEntriesChanged);
    if (v12 != 1)
      break;
    if (!__stlxr(0, sEntriesChanged))
    {
      v13 = 1;
      goto LABEL_12;
    }
  }
  v13 = 0;
  __clrex();
LABEL_12:
  if (v13)
  {
    while (1)
    {
      v14 = (void *)sMountEntrys;
      if (!sMountEntrys)
        break;
      sMountEntrys = *(_QWORD *)sMountEntrys;
      free(v14);
    }
  }
  v15 = &sMountEntrys;
  while (1)
  {
    v15 = (uint64_t *)*v15;
    if (!v15)
      break;
    if (*((_DWORD *)v15 + 14) == a3)
    {
      memcpy(a4, v15 + 1, 0xBD0uLL);
LABEL_19:
      os_unfair_lock_unlock(&sMountEntrysSpinLock);
      *a1 = a4;
      return 1;
    }
  }
  v96 = 0;
  v17 = getmntinfo_r_np(&v96, 2);
  if (v17)
  {
    v18 = v96;
    if (v17 < 1)
    {
LABEL_27:
      v21 = 2;
    }
    else
    {
      v19 = v17;
      v20 = v96;
      while (v20->f_fsid.val[0] != a3)
      {
        ++v20;
        if (!--v19)
          goto LABEL_27;
      }
      memcpy(a4, v20, 0x878uLL);
      v21 = 0;
    }
    free(v18);
    if (!v21)
    {
LABEL_32:
      v93 = xmmword_1817D54A8;
      v94 = 0;
      bzero(&v96, 0x388uLL);
      v21 = filtered_getattrlist(a4 + 88, &v93, &v96, 0x388uLL, 9u);
      if (!v21)
      {
        v24 = v97;
        if ((v97 & 0x20000) != 0)
        {
          *(int32x2_t *)v22.i8 = v100;
          *(int32x2_t *)v23.i8 = v101;
          v27 = (int8x16_t)vdupq_lane_s32(v100, 0);
          v28 = (int8x16_t)vdupq_lane_s32(v101, 0);
          v29 = (int8x16_t)vdupq_lane_s32(v100, 1);
          v30 = (int32x4_t)vandq_s8(v29, (int8x16_t)xmmword_1817D5380);
          v31 = vceqzq_s32((int32x4_t)vandq_s8(v29, (int8x16_t)xmmword_1817D5390));
          v32.i64[0] = v31.i32[2];
          v32.i64[1] = v31.i32[3];
          v33 = (int8x16_t)v32;
          v34 = vceqzq_s32(v30);
          v32.i64[0] = v34.i32[2];
          v32.i64[1] = v34.i32[3];
          v35 = (int8x16_t)v32;
          v32.i64[0] = v31.i32[0];
          v32.i64[1] = v31.i32[1];
          v36 = (int8x16_t)v32;
          v32.i64[0] = v34.i32[0];
          v32.i64[1] = v34.i32[1];
          v37 = (int8x16_t)v32;
          v38 = (int8x16_t)vdupq_lane_s32(v101, 1);
          v39 = vandq_s8(v38, (int8x16_t)xmmword_1817D5390);
          v40 = vandq_s8(v38, (int8x16_t)xmmword_1817D5380);
          v32.i64[0] = v40.u32[0];
          v32.i64[1] = v40.u32[1];
          v41 = v32;
          v32.i64[0] = v39.u32[0];
          v32.i64[1] = v39.u32[1];
          v42 = v32;
          v32.i64[0] = v40.u32[2];
          v32.i64[1] = v40.u32[3];
          v43 = (int64x2_t)v32;
          v32.i64[0] = v39.u32[2];
          v32.i64[1] = v39.u32[3];
          v44 = (int8x16_t)vshlq_n_s64(v43, 0x2CuLL);
          v45 = vbicq_s8((int8x16_t)vshlq_u64(v41, (uint64x2_t)xmmword_1817D53C0), v37);
          v46 = vbicq_s8((int8x16_t)vshlq_u64(v42, (uint64x2_t)xmmword_1817D53B0), v36);
          v47 = vbicq_s8(v44, v35);
          v48 = vbicq_s8((int8x16_t)vshlq_u64(v32, (uint64x2_t)xmmword_1817D53A0), v33);
          v49 = (int32x4_t)vandq_s8(v27, (int8x16_t)xmmword_1817D53D0);
          v50 = (int32x4_t)vandq_s8(v27, (int8x16_t)xmmword_1817D53E0);
          v51 = vceqzq_s32((int32x4_t)vandq_s8(v27, (int8x16_t)xmmword_1817D5400));
          v32.i64[0] = v51.i32[2];
          v32.i64[1] = v51.i32[3];
          v52 = (int8x16_t)v32;
          v53 = vceqzq_s32((int32x4_t)vandq_s8((int8x16_t)vzip1q_s32(v22, v22), (int8x16_t)xmmword_1817D53F0));
          v32.i64[0] = v53.i32[2];
          v32.i64[1] = v53.i32[3];
          v54 = (int8x16_t)v32;
          v55 = vceqzq_s32(v50);
          v32.i64[0] = v55.i32[2];
          v32.i64[1] = v55.i32[3];
          v56 = (int8x16_t)v32;
          v57 = vceqzq_s32(v49);
          v32.i64[0] = v57.i32[2];
          v32.i64[1] = v57.i32[3];
          v58 = (int8x16_t)v32;
          v32.i64[0] = v51.i32[0];
          v32.i64[1] = v51.i32[1];
          v59 = (int8x16_t)v32;
          v32.i64[0] = v53.i32[0];
          v32.i64[1] = v53.i32[1];
          v60 = (int8x16_t)v32;
          v32.i64[0] = v55.i32[0];
          v32.i64[1] = v55.i32[1];
          v61 = (int8x16_t)v32;
          v32.i64[0] = v57.i32[0];
          v32.i64[1] = v57.i32[1];
          v62 = (int8x16_t)v32;
          v63 = vandq_s8(v28, (int8x16_t)xmmword_1817D5400);
          v64 = vandq_s8((int8x16_t)vzip1q_s32(v23, v23), (int8x16_t)xmmword_1817D53F0);
          v65 = vandq_s8(v28, (int8x16_t)xmmword_1817D53E0);
          v66 = vandq_s8(v28, (int8x16_t)xmmword_1817D53D0);
          v32.i64[0] = v66.u32[0];
          v32.i64[1] = v66.u32[1];
          v67 = v32;
          v32.i64[0] = v65.u32[0];
          v32.i64[1] = v65.u32[1];
          v68 = v32;
          v32.i64[0] = v64.u32[0];
          v32.i64[1] = v64.u32[1];
          v69 = (int64x2_t)v32;
          v32.i64[0] = v63.u32[0];
          v32.i64[1] = v63.u32[1];
          v70 = v32;
          v32.i64[0] = v66.u32[2];
          v32.i64[1] = v66.u32[3];
          v71 = v32;
          v32.i64[0] = v65.u32[2];
          v32.i64[1] = v65.u32[3];
          v72 = v32;
          v32.i64[0] = v64.u32[2];
          v32.i64[1] = v64.u32[3];
          v73 = v32;
          v32.i64[0] = v63.u32[2];
          v32.i64[1] = v63.u32[3];
          v74 = vorrq_s8(vorrq_s8(vorrq_s8(vorrq_s8(vbicq_s8((int8x16_t)vshlq_u64(v68, (uint64x2_t)xmmword_1817D5450), v61), vbicq_s8((int8x16_t)vshlq_u64(v67, (uint64x2_t)xmmword_1817D5460), v62)), vorrq_s8(vbicq_s8((int8x16_t)vshlq_u64(v70, (uint64x2_t)xmmword_1817D5450), v59), vbicq_s8((int8x16_t)vshlq_n_s64(v69, 0x30uLL), v60))), vorrq_s8(vorrq_s8(vbicq_s8((int8x16_t)vshlq_u64(v72, (uint64x2_t)xmmword_1817D5430), v56), vbicq_s8((int8x16_t)vshlq_u64(v71, (uint64x2_t)xmmword_1817D5440), v58)), vorrq_s8(vbicq_s8((int8x16_t)vshlq_u64(v32, (uint64x2_t)xmmword_1817D5410), v52), vbicq_s8((int8x16_t)vshlq_u64(v73, (uint64x2_t)xmmword_1817D5420), v54)))), vorrq_s8(vorrq_s8(v46, v45), vorrq_s8(v48, v47)));
          v75 = vorr_s8(*(int8x8_t *)v74.i8, (int8x8_t)*(_OWORD *)&vextq_s8(v74, v74, 8uLL));
          v76 = (uint64_t)v75;
          if ((v101.i16[0] & 0x8000) == 0 || (v100.i16[0] & 0x8000) == 0)
            v76 = *(_QWORD *)&v75 | 0x100000000000000;
          if (v100.i16[2] < 0)
            v78 = (unint64_t)(v101.i16[2] & 0x8000) << 42;
          else
            v78 = 0;
          v79 = (unint64_t)(v101.i16[0] & 0x2000) << 45;
          if ((v100.i16[0] & 0x2000) == 0)
            v79 = 0;
          v80 = (unint64_t)(v101.i32[0] & 0x10000) << 43;
          if ((v100.i32[0] & 0x10000) == 0)
            v80 = 0;
          if ((v100.i32[0] & 0x20000) != 0)
            v81 = (unint64_t)(v101.i32[0] & 0x20000) << 43;
          else
            v81 = 0;
          *((_QWORD *)a4 + 369) = v80 | v79 | v81 | v78 | v45.i64[1] | v47.i64[0] | v47.i64[1] | v76;
          if ((BYTE5(v96) & 2) != 0)
            *(_OWORD *)(a4 + 2168) = v98;
          if ((v24 & 0x2000) != 0)
          {
            v86 = a4 + 2184;
            v87 = (char *)v99 + v99[0];
          }
          else
          {
            if ((a4[65] & 0x10) != 0)
              goto LABEL_61;
            v82 = a4 + 1112;
            v83 = strlen(a4 + 1112);
            if (v83)
            {
              v84 = v83 - 1;
              if (v82[v83 - 1] == 47)
              {
                strncpy(__dst, a4 + 1112, v84);
                __dst[v84] = 0;
                v82 = __dst;
              }
              v83 = (size_t)strrchr(v82, 47);
              if (!v83)
LABEL_61:
                v83 = (size_t)strrchr(a4 + 88, 47);
            }
            if (v83)
              v85 = (const char *)v83;
            else
              v85 = a4 + 88;
            if (strlen(v85) != 1 && *v85 == 47)
              ++v85;
            v86 = a4 + 2184;
            v87 = v85;
          }
          strlcpy(v86, v87, 0x2FEuLL);
          v88 = v97;
          if ((v97 & 0x40000) != 0)
          {
            uuid_copy((unsigned __int8 *)a4 + 3000, v102);
            v88 = v97;
          }
          if ((v88 & 0x40000000) != 0)
          {
            v89 = v104;
            *((_OWORD *)a4 + 185) = v103;
            *((_OWORD *)a4 + 186) = v89;
            *((_QWORD *)a4 + 374) = v105;
          }
          v90 = pathconf(a4 + 88, 18);
          if (v90 == -1)
          {
            if ((a4[2958] & 1) != 0)
              v91 = 0x20000000000;
            else
              v91 = -1;
          }
          else if (v90 < 65)
          {
            if (v90 > 31)
              v91 = 0xFFFFFFFFFFFFFFFFLL >> (65 - v90);
            else
              v91 = 0x7FFFFFFFLL;
          }
          else
          {
            v91 = 0x7FFFFFFFFFFFFFFFLL;
          }
          *((_QWORD *)a4 + 377) = v91;
          v92 = malloc_type_malloc(0xBD8uLL, 0x1020040C75464EAuLL);
          memcpy(v92 + 1, a4, 0xBD0uLL);
          *v92 = sMountEntrys;
          sMountEntrys = (uint64_t)v92;
          goto LABEL_19;
        }
        v21 = 2;
      }
    }
  }
  else
  {
    v21 = *__error();
    if (!v21)
      goto LABEL_32;
  }
  os_unfair_lock_unlock(&sMountEntrysSpinLock);
  result = 0;
  if (a6)
  {
    if (a7)
    {
      v25 = CFGetAllocator(a6);
      v26 = _FSURLCreateStandardError(v25, (const __CFString *)*MEMORY[0x1E0C9AFD0], v21, 0, a6, 0);
      result = 0;
      *a7 = v26;
    }
  }
  return result;
}

void SetNameAndHiddenFlagsFromCString(CFAllocatorRef alloc, UInt8 *bytes, CFIndex numBytes, uint64_t a4)
{
  const void *v8;
  CFStringRef v9;
  CFStringRef v10;
  BOOL v11;
  unsigned int v12;
  int v13;

  v8 = *(const void **)(a4 + 8);
  if (v8)
    CFRelease(v8);
  v9 = CFStringCreateWithBytes(alloc, bytes, numBytes, 0x8000100u, 0);
  *(_QWORD *)(a4 + 8) = v9;
  if (!v9)
  {
    syslog(3, "SetNameAndExtensionLengthFromCString: CFStringCreateWithBytes failed with kCFStringEncodingUTF8; retrying with kCF"
      "StringEncodingISOLatin1");
    v10 = CFStringCreateWithBytes(alloc, bytes, numBytes, 0x201u, 0);
    *(_QWORD *)(a4 + 8) = v10;
    if (!v10)
    {
      syslog(3, "SetNameAndExtensionLengthFromCString: CFStringCreateWithBytes failed with kCFStringEncodingISOLatin1; setting na"
        "me to empty string");
      *(_QWORD *)(a4 + 8) = &stru_1E0F0BB40;
    }
  }
  v11 = *bytes == 46;
  v12 = *(_DWORD *)a4 & 0xFFFFF7FF | (v11 << 11);
  *(_DWORD *)a4 = v12;
  if (v11)
    v13 = (bytes[1] == 46) << 12;
  else
    v13 = 0;
  *(_DWORD *)a4 = v13 | v12 & 0xFFFFEFFF;
}

uint64_t MountInfoGetIOBlockSize(uint64_t a1)
{
  return *(unsigned int *)(a1 + 4);
}

uint64_t _FSURLCopyResourcePropertyValuesAndFlags(const void *a1, uint64_t a2, _QWORD *a3, uint64_t a4, uint64_t a5, _QWORD *a6, CFTypeRef cf, CFErrorRef *a8)
{
  CFTypeRef v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  char *v19;
  uint64_t v20;
  uint64_t v21;
  size_t v22;
  _QWORD *v23;
  uint64_t v24;
  uint64_t v25;
  char *v26;
  int v27;
  _QWORD *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  _QWORD *v32;
  uint64_t v33;
  int v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  _QWORD *v42;
  uint64_t v43;
  _QWORD *v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t *v50;
  uint64_t *v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  char *v55;
  uint64_t v56;
  char *v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  _QWORD *v62;
  uint64_t Attributes;
  uint64_t v64;
  const void *v65;
  _QWORD *v66;
  char *v67;
  unsigned int v68;
  uint64_t v69;
  double v70;
  _OWORD *v71;
  CFFileSecurityRef Copy;
  const __CFAllocator *v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  _QWORD *v77;
  _QWORD *v78;
  uint64_t v80;
  uint64_t v81;
  CFErrorRef *v82;
  _QWORD *v83;
  _QWORD *v84;
  _QWORD *v85;
  uint64_t v86;
  uint64_t *v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
  CFTypeRef v92;
  uint64_t v93;
  uint64_t (*v94)(CFTypeRef, uint64_t, uint64_t, char *, uint64_t, uint64_t, uint64_t);
  uint64_t *v95;
  _OWORD v96[4];
  uint64_t v97;

  v89 = a2;
  v97 = *MEMORY[0x1E0C80C00];
  v92 = a1;
  v13 = _FileCacheGetForURL((const __CFURL *)a1, cf);
  v93 = (uint64_t)v13;
  v14 = qword_1ECD2A538;
  if (_FSURLCopyResourcePropertyValuesAndFlags::sOnce != -1)
    dispatch_once(&_FSURLCopyResourcePropertyValuesAndFlags::sOnce, &__block_literal_global_2);
  if (_FSURLCopyResourcePropertyValuesAndFlags::maskToPropertyTableCount)
    v15 = 31;
  else
    v15 = 0;
  v16 = MEMORY[0x1E0C80A78](v13);
  v17 = MEMORY[0x1E0C80A78](v16);
  v19 = (char *)&v80 - v18;
  v20 = MEMORY[0x1E0C80A78](v17);
  v21 = MEMORY[0x1E0C80A78](v20);
  MEMORY[0x1E0C80A78](v21);
  v26 = (char *)&v80 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0);
  v27 = 0;
  if (a3 && a4 && a6)
  {
    v85 = a3;
    v86 = a4;
    v87 = (uint64_t *)((char *)&v80 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0));
    if (v14 >= 1)
    {
      v28 = v23;
      v29 = v24;
      v30 = v25;
      bzero(v26, v22);
      v25 = v30;
      v24 = v29;
      v26 = (char *)v87;
      v23 = v28;
    }
    v31 = _ZZZ40_FSURLCopyResourcePropertyValuesAndFlagsEUb_E8theTable;
    v32 = (_QWORD *)(_FSURLCopyResourcePropertyValuesAndFlags::maskToPropertyTable + 32);
    v33 = v89;
    do
    {
      v34 = *((_DWORD *)v32 - 6);
      if (v34)
        v35 = a5;
      else
        v35 = v33;
      if ((v35 & v31) != 0)
      {
        v36 = *(v32 - 1);
        v37 = **(int **)(v36 + 140);
        v38 = *(_QWORD *)&v26[8 * v37];
        if (v38 <= 95)
        {
          v39 = (int)v15 * (uint64_t)(int)v37;
          *(_QWORD *)(v24 + 8 * v39 + 8 * v38) = *(_QWORD *)(v36 + 8);
          *(_QWORD *)&v19[8 * v39 + 8 * v38] = 0;
          *(_QWORD *)(v25 + 8 * v39 + 8 * v38) = *(_QWORD *)v36;
          if (v34 == 1)
          {
            v23[v39 + v38] = v31;
            *(_QWORD *)&v26[8 * v37] = v38 + 1;
          }
        }
      }
      v40 = *v32;
      v32 += 4;
      v31 = v40;
    }
    while (v40);
    v90 = v25;
    v91 = v24;
    v84 = v23;
    _FileCacheLock(v93);
    memset(v96, 0, 60);
    v41 = _ZZZ40_FSURLCopyResourcePropertyValuesAndFlagsEUb_E8theTable;
    v42 = (_QWORD *)(_FSURLCopyResourcePropertyValuesAndFlags::maskToPropertyTable + 32);
    v44 = v85;
    v43 = v86;
    do
    {
      if (*((_DWORD *)v42 - 6))
        v45 = a5;
      else
        v45 = v33;
      if ((v45 & v41) != 0)
        addPropertyAndDependenciesToBitmap(*(v42 - 1), (uint64_t)v96);
      v46 = *v42;
      v42 += 4;
      v41 = v46;
    }
    while (v46);
    v47 = v93;
    _FileCacheLockTransitionToPreparer(v93);
    v27 = prepareValuesForBitmap((uint64_t)v92, v47, (uint64_t)v96, (uint64_t)a8);
    _FileCacheLockTransitionFromPreparer(v47);
    if (v27)
    {
      v83 = a6;
      v48 = 8 * v15;
      if (v14 < 1)
        goto LABEL_34;
      v82 = a8;
      v49 = 0;
      v50 = v87;
      v81 = v14;
      v51 = &qword_1ECD2A550;
      v88 = 8 * v15;
      do
      {
        v53 = *v50++;
        v52 = v53;
        if (v53 >= 1)
        {
          v94 = (uint64_t (*)(CFTypeRef, uint64_t, uint64_t, char *, uint64_t, uint64_t, uint64_t))*v51;
          v95 = v50;
          v54 = v91 + v49;
          v55 = &v19[v49];
          v56 = v90 + v49;
          v57 = v19;
          v58 = *(v51 - 1);
          v59 = v93;
          _FileCacheIncrementInProvider(v93);
          v60 = v58;
          v19 = v57;
          v27 = v94(v92, v59, v54, v55, v56, v52, v60);
          v61 = v59;
          v48 = v88;
          _FileCacheDecrementInProvider(v61);
          v50 = v95;
        }
        v49 += v48;
        v51 += 7;
        --v14;
      }
      while (v14);
      a8 = v82;
      v14 = v81;
      v44 = v85;
      v43 = v86;
      if (v27)
      {
LABEL_34:
        v62 = v83;
        *v83 = 0;
        *v44 = 0;
        Attributes = _FileCacheGetAttributes(v93);
        v64 = Attributes;
        if ((v89 & 1) != 0)
        {
          v65 = *(const void **)(Attributes + 8);
          if (v65)
          {
            *(_QWORD *)v43 = CFRetain(v65);
            *v44 |= 1uLL;
          }
          else
          {
            *(_QWORD *)v43 = 0;
          }
        }
        if ((v89 & 2) != 0)
        {
          *v44 |= 2uLL;
          *(_DWORD *)(v43 + 8) = *(_DWORD *)(v64 + 24);
        }
        v66 = v84;
        v67 = (char *)v87;
        if ((v89 & 4) != 0)
        {
          *v44 |= 4uLL;
          v68 = *(_DWORD *)(v64 + 112);
          if (v68)
          {
            v69 = 0;
          }
          else
          {
            v68 = *(_DWORD *)(v64 + 104);
            v69 = *(unsigned int *)(v64 + 108);
          }
          *(_QWORD *)(v43 + 16) = v68 | (unint64_t)(v69 << 32);
        }
        if ((v89 & 8) != 0)
        {
          *v44 |= 8uLL;
          *(_QWORD *)(v43 + 24) = *(_QWORD *)(v64 + 120);
        }
        if ((v89 & 0x10) != 0)
        {
          v70 = *(double *)(v64 + 80);
          if (v70 == -1.0 - *MEMORY[0x1E0C9ADE8])
            v70 = -*MEMORY[0x1E0C9ADF8];
          else
            *v44 |= 0x10uLL;
          *(double *)(v43 + 32) = v70;
        }
        if ((v89 & 0x20) != 0)
        {
          *v44 |= 0x20uLL;
          *(_QWORD *)(v43 + 40) = *(_QWORD *)(v64 + 64);
        }
        if ((v89 & 0x40) != 0)
        {
          *v44 |= 0x40uLL;
          *(_QWORD *)(v43 + 48) = *(_QWORD *)(v64 + 72);
        }
        if ((v89 & 0x80) != 0)
        {
          *v44 |= 0x80uLL;
          *(_QWORD *)(v43 + 56) = *(_QWORD *)(v64 + 208);
        }
        if ((v89 & 0x100) != 0)
        {
          *v44 |= 0x100uLL;
          *(_QWORD *)(v43 + 64) = *(_QWORD *)(v64 + 216);
        }
        if ((v89 & 0x200) != 0)
        {
          *v44 |= 0x200uLL;
          *(_QWORD *)(v43 + 72) = *(_QWORD *)(v64 + 192);
        }
        if ((v89 & 0x400) != 0)
        {
          *v44 |= 0x400uLL;
          *(_QWORD *)(v43 + 80) = *(_QWORD *)(v64 + 200);
        }
        if ((v89 & 0x800) != 0)
        {
          v71 = (_OWORD *)(v43 + 88);
          *v44 |= 0x800uLL;
          if ((*(_DWORD *)v64 & 0x4000010) == 0x10)
          {
            *v71 = *(_OWORD *)(v64 + 160);
            *(_OWORD *)(v43 + 104) = *(_OWORD *)(v64 + 176);
          }
          else
          {
            *v71 = 0u;
            *(_OWORD *)(v43 + 104) = 0u;
          }
          if ((*(_DWORD *)(v64 + 16) & 0xF000) == 0xA000)
          {
            *(_QWORD *)(v43 + 88) = 0x72686170736C6E6BLL;
            *(_WORD *)(v43 + 96) = *(_WORD *)(v43 + 96) & 0x4000 | 0x8000;
            *(_QWORD *)(v43 + 104) = 0;
            *(_QWORD *)(v43 + 112) = 0;
          }
        }
        if ((v89 & 0x1000) != 0)
        {
          if ((*(_BYTE *)v64 & 0x80) != 0)
          {
            *v44 |= 0x1000uLL;
            v73 = CFGetAllocator(v92);
            Copy = CFFileSecurityCreateCopy(v73, *(CFFileSecurityRef *)(v64 + 224));
            v67 = (char *)v87;
          }
          else
          {
            Copy = 0;
          }
          *(_QWORD *)(v43 + 120) = Copy;
          v66 = v84;
        }
        if (v14 >= 1)
        {
          v74 = 0;
          v75 = *MEMORY[0x1E0C9AE50];
          do
          {
            v76 = *(_QWORD *)&v67[8 * v74];
            if (v76 >= 1)
            {
              v77 = v19;
              v78 = v66;
              do
              {
                if (*v77 == v75)
                  *v62 |= *v78;
                ++v78;
                ++v77;
                --v76;
              }
              while (v76);
            }
            ++v74;
            v66 = (_QWORD *)((char *)v66 + v48);
            v19 += v48;
          }
          while (v74 != v14);
        }
      }
    }
    _FileCacheUnlock(v93);
  }
  if (a8 && !v27 && !*a8)
  {
    if (os_log_type_enabled((os_log_t)defaultLog, OS_LOG_TYPE_ERROR))
      _FSURLCopyResourcePropertyValuesAndFlags_cold_1();
    *a8 = CFErrorCreate((CFAllocatorRef)*MEMORY[0x1E0C9AE00], (CFErrorDomain)*MEMORY[0x1E0C9AFB8], 256, 0);
  }
  return v27;
}

uint64_t _FileCacheLockTransitionFromPreparer(uint64_t a1)
{
  _opaque_pthread_t *v2;

  v2 = *(_opaque_pthread_t **)(a1 + 24);
  if (v2 == pthread_self())
  {
    ++*(_DWORD *)(a1 + 32);
  }
  else
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 36));
    *(_DWORD *)(a1 + 32) = 1;
    *(_QWORD *)(a1 + 24) = pthread_self();
  }
  return os_unfair_recursive_lock_unlock();
}

uint64_t _FileCacheLockTransitionToPreparer(uint64_t a1)
{
  os_unfair_lock_s *v2;
  uint64_t v3;
  int v4;

  v2 = (os_unfair_lock_s *)(a1 + 36);
  os_unfair_lock_assert_owner((const os_unfair_lock *)(a1 + 36));
  v3 = os_unfair_recursive_lock_trylock();
  v4 = *(_DWORD *)(a1 + 32);
  *(_QWORD *)(a1 + 24) = 0;
  os_unfair_lock_unlock(v2);
  if ((v3 & 1) == 0)
    os_unfair_recursive_lock_lock_with_options();
  if (v4 >= 2)
  {
    os_unfair_lock_lock(v2);
    *(_DWORD *)(a1 + 32) = v4 - 1;
    *(_QWORD *)(a1 + 24) = pthread_self();
  }
  return v3;
}

void _RegisterFilePropertyWithOptions(void *key, char a2, const void **a3, uint64_t a4, uint64_t a5)
{
  char *Value;
  const void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  int v16;
  unint64_t v17;
  unint64_t v18;
  int v19;
  int v20;
  BOOL v21;
  uint64_t v22;
  int v23;
  int v24;
  int v26;
  int v27;
  BOOL v28;
  uint64_t v29;
  int v30;
  unint64_t v31;
  int v32;
  int64_t v33;
  int64_t v34;
  uint64_t v35;
  int v36;

  Value = (char *)CFDictionaryGetValue((CFDictionaryRef)qword_1ECD2A668, key);
  if ((a2 & 1) != 0)
    CFArrayAppendValue((CFMutableArrayRef)qword_1ECD2A678, key);
  if (a4)
  {
    if (a4 >= 1)
    {
      do
      {
        v11 = CFDictionaryGetValue((CFDictionaryRef)qword_1ECD2A668, *a3);
        if (v11)
          addPropertyAndDependenciesToBitmap((uint64_t)v11, (uint64_t)(Value + 16));
        ++a3;
        --a4;
      }
      while (a4);
    }
    if (qword_1ECD2A538 >= 1)
    {
      v12 = 0;
      do
      {
        v13 = (uint64_t)&Value[12 * v12 + 16];
        v14 = *(_QWORD *)v13;
        v34 = 0;
        v35 = v14;
        v36 = *(_DWORD *)(v13 + 8);
        v33 = 0;
        if (PropertyMaskIsNotZero((uint64_t)&v35, (unint64_t *)&v34, &v33) && v34 <= v33)
        {
          v15 = v35;
          v16 = v36;
          v17 = v33 - v34 + 1;
          v18 = sFileProviderGlobals[7 * v12 + 8] + 148 * v34;
          do
          {
            v19 = *(_DWORD *)(v18 + 136);
            v20 = 1 << v19;
            v21 = v19 < 64;
            if (v19 >= 64)
              v22 = 0;
            else
              v22 = 1 << v19;
            if (v21)
              v23 = 0;
            else
              v23 = v20;
            v24 = v16 & v23;
            if ((v22 & v15) != 0 || v24 != 0)
            {
              v26 = *((_DWORD *)Value + 34);
              v27 = 1 << v26;
              v28 = v26 < 64;
              if (v26 >= 64)
                v29 = 0;
              else
                v29 = 1 << v26;
              if (v28)
                v30 = 0;
              else
                v30 = v27;
              v31 = v18 + 12 * **(int **)(Value + 140);
              v32 = *(_DWORD *)(v31 + 84) | v30;
              *(_QWORD *)(v31 + 76) |= v29;
              *(_DWORD *)(v31 + 84) = v32;
            }
            v18 += 148;
            --v17;
          }
          while (v17);
        }
        ++v12;
      }
      while (v12 < qword_1ECD2A538);
    }
  }
  *(_QWORD *)Value = a5;
}

uint64_t addPropertyAndDependenciesToBitmap(uint64_t result, uint64_t a2)
{
  int v2;
  int v3;
  BOOL v4;
  uint64_t v5;
  uint64_t v6;
  int v7;
  uint64_t v8;
  _DWORD *v9;
  int *v10;
  uint64_t v11;
  int v12;
  int v13;

  v2 = *(_DWORD *)(result + 136);
  v3 = 1 << v2;
  v4 = v2 < 64;
  if (v2 >= 64)
    v5 = 0;
  else
    v5 = 1 << v2;
  if (v4)
    v3 = 0;
  v6 = a2 + 12 * **(int **)(result + 140);
  v7 = *(_DWORD *)(v6 + 8) | v3;
  *(_QWORD *)v6 |= v5;
  *(_DWORD *)(v6 + 8) = v7;
  v8 = qword_1ECD2A538;
  if (qword_1ECD2A538 >= 1)
  {
    v9 = (_DWORD *)(result + 24);
    v10 = (int *)(a2 + 8);
    do
    {
      v11 = *((_QWORD *)v9 - 1) | *((_QWORD *)v10 - 1);
      v12 = *v9;
      v9 += 3;
      v13 = v12 | *v10;
      *((_QWORD *)v10 - 1) = v11;
      *v10 = v13;
      v10 += 3;
      --v8;
    }
    while (v8);
  }
  return result;
}

uint64_t prepareValuesForBitmap(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v5;
  int v6;
  uint64_t *v7;
  uint64_t v8;
  unint64_t v9;
  unint64_t v10;
  char *v11;
  size_t v12;
  char *v13;
  uint64_t v14;
  uint64_t v15;
  int v16;
  unint64_t v17;
  unint64_t v18;
  int v19;
  int v20;
  BOOL v21;
  uint64_t v22;
  int v23;
  int v24;
  uint64_t *v26;
  uint64_t (*v27)(uint64_t, uint64_t, char *, char *, uint64_t, uint64_t, uint64_t);
  uint64_t v28;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  int64_t v33;
  int64_t v34;
  uint64_t v35;
  int v36;
  uint64_t v37;

  v31 = a4;
  v32 = a3;
  v30 = a1;
  v37 = *MEMORY[0x1E0C80C00];
  if (qword_1ECD2A538 < 1)
  {
    LOBYTE(v6) = 1;
  }
  else
  {
    v5 = 0;
    LOBYTE(v6) = 1;
    do
    {
      v7 = (uint64_t *)(v32 + 12 * v5);
      v8 = *v7;
      v34 = 0;
      v35 = v8;
      v36 = *((_DWORD *)v7 + 2);
      v33 = 0;
      if (PropertyMaskIsNotZero((uint64_t)&v35, (unint64_t *)&v34, &v33))
      {
        v9 = 8 * SHIDWORD(sFileProviderGlobals[7 * v5 + 2]);
        MEMORY[0x1E0C80A78]();
        v10 = (v9 + 15) & 0xFFFFFFFFFFFFFFF0;
        v11 = (char *)&v30 - v10;
        v12 = v9 >= 0x200 ? 512 : v9;
        bzero((char *)&v30 - v10, v12);
        MEMORY[0x1E0C80A78]();
        v13 = (char *)&v30 - v10;
        bzero((char *)&v30 - v10, v12);
        if (v34 <= v33)
        {
          v14 = 0;
          v15 = v35;
          v16 = v36;
          v17 = v33 - v34 + 1;
          v18 = sFileProviderGlobals[7 * v5 + 8] + 148 * v34;
          do
          {
            v19 = *(_DWORD *)(v18 + 136);
            v20 = 1 << v19;
            v21 = v19 < 64;
            if (v19 >= 64)
              v22 = 0;
            else
              v22 = 1 << v19;
            if (v21)
              v23 = 0;
            else
              v23 = v20;
            v24 = v16 & v23;
            if ((v22 & v15) != 0 || v24 != 0)
            {
              *(_QWORD *)&v11[8 * v14] = *(_QWORD *)(v18 + 8);
              *(_QWORD *)&v13[8 * v14++] = *(_QWORD *)v18;
            }
            v18 += 148;
            --v17;
          }
          while (v17);
        }
        else
        {
          v14 = 0;
        }
        v26 = &sFileProviderGlobals[7 * v5];
        v27 = (uint64_t (*)(uint64_t, uint64_t, char *, char *, uint64_t, uint64_t, uint64_t))v26[5];
        v28 = v26[3];
        _FileCacheIncrementInProvider(a2);
        v6 = v27(v30, a2, v11, v13, v14, v28, v31);
        _FileCacheDecrementInProvider(a2);
        if (!v6)
          break;
      }
      ++v5;
    }
    while (v5 < qword_1ECD2A538);
  }
  return v6;
}

uint64_t PropertyMaskIsNotZero(uint64_t a1, unint64_t *a2, _QWORD *a3)
{
  unint64_t v6;
  uint64_t result;
  unint64_t v8;
  int v9;
  uint64_t v10;
  unsigned int v11;

  v6 = *(_QWORD *)a1;
  result = *(unsigned int *)(a1 + 8);
  if (v6)
  {
    v8 = __clz(__rbit64(v6));
    v9 = flsll(result);
    if (v9)
      v10 = v9 + 64;
    else
      v10 = flsll(*(_QWORD *)a1);
  }
  else
  {
    if (!(_DWORD)result)
      return result;
    v11 = __clz(__rbit32(result));
    v10 = flsll(result) + 64;
    v8 = v11 | 0x40;
  }
  *a2 = v8;
  *a3 = v10 - 1;
  return 1;
}

uint64_t corePropertyProviderPrepareValues(const __CFString *a1, uint64_t a2, uint64_t a3, uint64_t *a4, uint64_t a5, uint64_t a6, CFErrorRef *a7)
{
  uint64_t v12;
  attrgroup_t v13;
  attrgroup_t v14;
  attrgroup_t v15;
  attrgroup_t v16;
  attrgroup_t v17;
  int v18;
  size_t v19;
  uint64_t v20;
  char *v21;
  uint64_t v22;
  int *v23;
  uint64_t v24;
  const __CFAllocator *v25;
  const __CFString *v26;
  uint64_t v27;
  uint64_t v28;
  const __CFAllocator *v29;
  size_t v30;
  int v31;
  const __CFAllocator *v32;
  uint64_t Attributes;
  unsigned int v34;
  unsigned int v35;
  attrlist v37;
  char v38;
  uint64_t v39;
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  *(_OWORD *)&v37.bitmapcount = xmmword_1817D5258;
  *(_QWORD *)&v37.fileattr = 0;
  _FileCacheLock(a2);
  v39 = 0;
  if (a5 < 1)
    goto LABEL_6;
  do
  {
    v12 = *a4++;
    *(&v38 + *(_QWORD *)(v12 + 16)) = 1;
    --a5;
  }
  while (a5);
  if (!HIBYTE(v39) || (*(_BYTE *)(_FileCacheGetAttributes(a2) + 1) & 4) != 0)
  {
LABEL_6:
    v17 = 0;
    v15 = 0;
    v16 = 0;
    v13 = 0;
    v14 = 0;
    v18 = 0;
  }
  else
  {
    v14 = dword_1ECD2A4FC;
    v13 = qword_1ECD2A500;
    v37.commonattr = dword_1ECD2A4FC;
    *(_QWORD *)&v37.volattr = qword_1ECD2A500;
    v16 = HIDWORD(qword_1ECD2A500);
    v15 = qword_1ECD2A508;
    *(_QWORD *)&v37.fileattr = qword_1ECD2A508;
    v17 = HIDWORD(qword_1ECD2A508);
    v18 = 1;
  }
  if (BYTE4(v39) && (*(_BYTE *)_FileCacheGetAttributes(a2) & 4) == 0)
  {
    v14 |= dword_1ECD2A4B4;
    v13 |= unk_1ECD2A4B8;
    v16 |= dword_1ECD2A4BC;
    v37.commonattr = v14;
    v37.volattr = v13;
    v15 |= unk_1ECD2A4C0;
    v37.dirattr = v16;
    v37.fileattr = v15;
    v17 |= dword_1ECD2A4C4;
    v37.forkattr = v17;
    v18 = 1;
  }
  if (BYTE6(v39) && (*(_BYTE *)(_FileCacheGetAttributes(a2) + 1) & 1) == 0)
  {
    v14 |= dword_1ECD2A4E4;
    v13 |= unk_1ECD2A4E8;
    v16 |= dword_1ECD2A4EC;
    v37.commonattr = v14;
    v37.volattr = v13;
    v15 |= unk_1ECD2A4F0;
    v37.dirattr = v16;
    v37.fileattr = v15;
    v17 |= dword_1ECD2A4F4;
    v37.forkattr = v17;
    v18 = 1;
  }
  if (BYTE5(v39) && (*(_BYTE *)_FileCacheGetAttributes(a2) & 0x40) == 0)
  {
    v14 |= dword_1ECD2A4CC;
    v13 |= unk_1ECD2A4D0;
    v16 |= dword_1ECD2A4D4;
    v37.commonattr = v14;
    v37.volattr = v13;
    v15 |= dword_1ECD2A4D8;
    v37.dirattr = v16;
    v37.fileattr = v15;
    v17 |= dword_1ECD2A4DC;
    v37.forkattr = v17;
    v18 = 1;
  }
  if (BYTE3(v39) && (*(_BYTE *)_FileCacheGetAttributes(a2) & 0x80) == 0)
  {
    v14 |= dword_1ECD2A49C;
    v13 |= unk_1ECD2A4A0;
    v16 |= dword_1ECD2A4A4;
    v37.commonattr = v14;
    v37.volattr = v13;
    v15 |= unk_1ECD2A4A8;
    v37.dirattr = v16;
    v37.fileattr = v15;
    v17 |= dword_1ECD2A4AC;
    v37.forkattr = v17;
    v18 = 1;
  }
  if (BYTE2(v39)
    && (*(_DWORD *)(_FileCacheGetAttributes(a2) + 16) & 0xF000) != 0x4000
    && (*(_BYTE *)_FileCacheGetAttributes(a2) & 0x20) == 0)
  {
    v14 |= dword_1ECD2A484;
    v13 |= unk_1ECD2A488;
    v16 |= dword_1ECD2A48C;
    v37.commonattr = v14;
    v37.volattr = v13;
    v15 |= unk_1ECD2A490;
    v37.dirattr = v16;
    v37.fileattr = v15;
    v17 |= dword_1ECD2A494;
    v37.forkattr = v17;
    v18 = 1;
  }
  if (BYTE1(v39) && (*(_BYTE *)_FileCacheGetAttributes(a2) & 0x10) == 0)
  {
    v14 |= dword_1ECD2A46C;
    v13 |= unk_1ECD2A470;
    v16 |= dword_1ECD2A474;
    v37.commonattr = v14;
    v37.volattr = v13;
    v15 |= unk_1ECD2A478;
    v37.dirattr = v16;
    v37.fileattr = v15;
    v17 |= dword_1ECD2A47C;
    v37.forkattr = v17;
    v18 = 1;
  }
  if (!(_BYTE)v39 || (*(_BYTE *)_FileCacheGetAttributes(a2) & 8) != 0)
  {
    if (!v18 && (!v38 || (*(_BYTE *)_FileCacheGetAttributes(a2) & 1) != 0))
    {
      v28 = 1;
      goto LABEL_50;
    }
  }
  else
  {
    v14 |= dword_1ECD2A454;
    v13 |= unk_1ECD2A458;
    v16 |= dword_1ECD2A45C;
    v15 |= unk_1ECD2A460;
    v17 |= dword_1ECD2A464;
  }
  v37.commonattr = v14 | dword_1ECD2A43C;
  v37.volattr = v13 | unk_1ECD2A440;
  v37.dirattr = v16 | dword_1ECD2A444;
  v37.fileattr = v15 | unk_1ECD2A448;
  v37.forkattr = v17 | dword_1ECD2A44C;
  _FileCacheUnlock(a2);
  if (!CFURLGetFileSystemRepresentation((CFURLRef)a1, 1u, (UInt8 *)&v38, 1024))
  {
    if (a7)
    {
      v29 = CFGetAllocator(a1);
      *a7 = _FSURLCreateStandardError(v29, (const __CFString *)*MEMORY[0x1E0C9AFB8], 258, 0, a1, 0);
    }
    _FileCacheLock(a2);
    goto LABEL_39;
  }
  v37.commonattr |= 0x80000000;
  v19 = calculateAttributeBufferSize(&v37, 0);
  MEMORY[0x1E0C80A78](v19);
  v21 = (char *)&v37 - v20;
  bzero((char *)&v37 - v20, v19);
  v22 = filtered_getattrlist(&v38, &v37, v21, v19, 0x25u);
  if ((_DWORD)v22)
  {
    _FileCacheLock(a2);
    goto LABEL_33;
  }
  v30 = *(unsigned int *)v21;
  if (v19 >= v30)
  {
    _FileCacheLock(a2);
    goto LABEL_47;
  }
  MEMORY[0x1E0C80A78](v22);
  v21 = (char *)&v37 - ((v30 + 15) & 0x1FFFFFFF0);
  bzero(v21, v30);
  v31 = filtered_getattrlist(&v38, &v37, v21, v30, 0x21u);
  _FileCacheLock(a2);
  if (!v31)
  {
LABEL_47:
    v32 = CFGetAllocator(a1);
    Attributes = _FileCacheGetAttributes(a2);
    v28 = 1;
    v34 = parseAttributeBuffer(v32, &v38, &v37, v21, 0, Attributes, 1);
    if (!v34)
      goto LABEL_50;
    if (a7)
    {
      v35 = v34;
      v25 = CFGetAllocator(a1);
      v26 = (const __CFString *)*MEMORY[0x1E0C9AFC8];
      v27 = v35;
      goto LABEL_35;
    }
LABEL_39:
    v28 = 0;
    goto LABEL_50;
  }
LABEL_33:
  v23 = __error();
  if (!a7)
    goto LABEL_39;
  v24 = *v23;
  v25 = CFGetAllocator(a1);
  v26 = (const __CFString *)*MEMORY[0x1E0C9AFD0];
  v27 = v24;
LABEL_35:
  v28 = 0;
  *a7 = _FSURLCreateStandardError(v25, v26, v27, 0, a1, 0);
LABEL_50:
  _FileCacheUnlock(a2);
  return v28;
}

uint64_t _FSURLCopyResourcePropertyForKeyInternal(const __CFURL *a1, const __CFString *a2, void **a3, CFTypeRef cf, __CFError **a5, int a6)
{
  _QWORD *v11;
  uint64_t *v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t (*v16)(const __CFURL *, _QWORD *, const __CFString **, void **, uint64_t *, uint64_t, uint64_t);
  uint64_t v17;
  uint64_t v18;
  void (*v19)(const __CFURL *, _QWORD *, const __CFString **, void **, uint64_t *, uint64_t, uint64_t);
  uint64_t v20;
  const __CFDictionary *TemporaryPropertyDictionary;
  const __CFDictionary *PermanentPropertyDictionary;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t (*v26)(const __CFURL *, _QWORD *, const __CFString **, void **, uint64_t *, uint64_t, uint64_t);
  _OWORD v28[4];
  uint64_t v29;
  void *value;
  const __CFString *v31;

  v31 = a2;
  value = 0;
  v11 = _FileCacheGetForURL(a1, cf);
  v12 = (uint64_t *)CFDictionaryGetValue((CFDictionaryRef)qword_1ECD2A668, a2);
  if (!v12)
  {
    _FileCacheLockTempPermProperties();
    TemporaryPropertyDictionary = _FileCacheGetTemporaryPropertyDictionary(v11, 0);
    if (TemporaryPropertyDictionary
      && CFDictionaryGetValueIfPresent(TemporaryPropertyDictionary, a2, (const void **)&value)
      || (PermanentPropertyDictionary = _FileCacheGetPermanentPropertyDictionary(v11, 0)) != 0
      && CFDictionaryGetValueIfPresent(PermanentPropertyDictionary, a2, (const void **)&value))
    {
      v23 = value;
      if (value)
        v23 = (void *)CFRetain(value);
      value = v23;
    }
    _FileCacheUnlockTempPermProperties();
    v17 = 1;
    goto LABEL_18;
  }
  v13 = v12;
  _FileCacheLock((uint64_t)v11);
  v29 = *v13;
  v14 = *(uint64_t *)((char *)v13 + 140);
  v15 = *(_QWORD *)(v14 + 8);
  v16 = *(uint64_t (**)(const __CFURL *, _QWORD *, const __CFString **, void **, uint64_t *, uint64_t, uint64_t))(v14 + 16);
  _FileCacheIncrementInProvider((uint64_t)v11);
  v17 = v16(a1, v11, &v31, &value, &v29, 1, v15);
  _FileCacheDecrementInProvider((uint64_t)v11);
  if (a6 && !(_DWORD)v17)
  {
    if (_FileCacheLockTransitionToPreparer((uint64_t)v11))
      goto LABEL_28;
    _FileCacheLock((uint64_t)v11);
    v24 = *(uint64_t *)((char *)v13 + 140);
    v25 = *(_QWORD *)(v24 + 8);
    v26 = *(uint64_t (**)(const __CFURL *, _QWORD *, const __CFString **, void **, uint64_t *, uint64_t, uint64_t))(v24 + 16);
    _FileCacheIncrementInProvider((uint64_t)v11);
    v17 = v26(a1, v11, &v31, &value, &v29, 1, v25);
    _FileCacheDecrementInProvider((uint64_t)v11);
    _FileCacheUnlock((uint64_t)v11);
    if (!(_DWORD)v17)
    {
LABEL_28:
      memset(v28, 0, 60);
      addPropertyAndDependenciesToBitmap((uint64_t)v13, (uint64_t)v28);
      v17 = prepareValuesForBitmap((uint64_t)a1, (uint64_t)v11, (uint64_t)v28, (uint64_t)a5);
      if ((_DWORD)v17)
      {
        _FileCacheLock((uint64_t)v11);
        v18 = *(uint64_t *)((char *)v13 + 140);
        v19 = *(void (**)(const __CFURL *, _QWORD *, const __CFString **, void **, uint64_t *, uint64_t, uint64_t))(v18 + 32);
        v20 = *(_QWORD *)(v18 + 8);
        _FileCacheIncrementInProvider((uint64_t)v11);
        v19(a1, v11, &v31, &value, &v29, 1, v20);
        _FileCacheDecrementInProvider((uint64_t)v11);
        _FileCacheUnlock((uint64_t)v11);
      }
    }
    _FileCacheLockTransitionFromPreparer((uint64_t)v11);
  }
  _FileCacheUnlock((uint64_t)v11);
  if ((_DWORD)v17)
  {
LABEL_18:
    *a3 = value;
    return v17;
  }
  if (!a5 || *a5)
    return 0;
  if (os_log_type_enabled((os_log_t)defaultLog, OS_LOG_TYPE_ERROR))
    _FSURLCopyResourcePropertyForKeyInternal();
  v17 = 0;
  *a5 = CFErrorCreate((CFAllocatorRef)*MEMORY[0x1E0C9AE00], (CFErrorDomain)*MEMORY[0x1E0C9AFB8], 256, 0);
  return v17;
}

pthread_t _FileCacheLock(uint64_t a1)
{
  _opaque_pthread_t *v2;
  pthread_t result;
  int v4;

  v2 = *(_opaque_pthread_t **)(a1 + 24);
  result = pthread_self();
  if (v2 == result)
  {
    v4 = *(_DWORD *)(a1 + 32) + 1;
  }
  else
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 36));
    result = pthread_self();
    *(_QWORD *)(a1 + 24) = result;
    v4 = 1;
  }
  *(_DWORD *)(a1 + 32) = v4;
  return result;
}

void _FileCacheUnlock(uint64_t a1)
{
  int v1;

  v1 = *(_DWORD *)(a1 + 32) - 1;
  *(_DWORD *)(a1 + 32) = v1;
  if (!v1)
  {
    *(_QWORD *)(a1 + 24) = 0;
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 36));
  }
}

uint64_t _FileCacheDecrementInProvider(uint64_t result)
{
  unsigned int *v1;
  unsigned int v2;

  v1 = (unsigned int *)(result + 20);
  do
    v2 = __ldaxr(v1);
  while (__stlxr(v2 - 1, v1));
  return result;
}

uint64_t _FileCacheIncrementInProvider(uint64_t result)
{
  unsigned int *v1;
  unsigned int v2;

  v1 = (unsigned int *)(result + 20);
  do
    v2 = __ldaxr(v1);
  while (__stlxr(v2 + 1, v1));
  return result;
}

CFTypeRef _FileCacheGetForURL(const __CFURL *a1, CFTypeRef cf)
{
  uint64_t Instance;
  const void *v4;

  if (cf)
    return cf;
  CFGetAllocator(a1);
  initGlobalsOnce();
  Instance = _CFRuntimeCreateInstance();
  if (Instance)
  {
    v4 = (const void *)Instance;
    __CFURLSetResourceInfoPtr();
    CFRelease(v4);
  }
  return (CFTypeRef)__CFURLResourceInfoPtr();
}

uint64_t corePropertyProviderCopyValues(uint64_t a1, uint64_t a2, uint64_t a3, CFTypeRef *a4, uint64_t *a5, uint64_t a6)
{
  uint64_t v6;
  uint64_t result;
  uint64_t v12;
  unsigned int (*v13)(uint64_t, uint64_t, CFTypeRef *);
  uint64_t Attributes;
  CFTypeRef cf;

  if (!a6)
    return 1;
  v6 = a6;
  if ((*(_BYTE *)_FileCacheGetAttributes(a2) & 1) == 0)
    return 0;
  if (v6 < 1)
    return 1;
  while (1)
  {
    cf = 0;
    v12 = *a5;
    if ((*(_BYTE *)(*a5 + 8) & 2) == 0
      || !_FileCacheGetPropertyValueForKey(a2, *(const void **)v12, (void **)&cf))
    {
      break;
    }
    if (cf)
      CFRetain(cf);
LABEL_12:
    *a4++ = cf;
    ++a5;
    if (!--v6)
      return 1;
  }
  v13 = *(unsigned int (**)(uint64_t, uint64_t, CFTypeRef *))(v12 + 24);
  if (v13)
  {
    Attributes = _FileCacheGetAttributes(a2);
    if (v13(a1, Attributes, &cf))
      goto LABEL_12;
  }
  result = 0;
  *a4 = 0;
  return result;
}

uint64_t _FileCacheGetAttributes(uint64_t a1)
{
  return a1 + 48;
}

void initGlobalsOnce(void)
{
  if (initGlobalsOnce(void)::onceToken != -1)
    dispatch_once(&initGlobalsOnce(void)::onceToken, &__block_literal_global_3);
}

uint64_t filtered_getattrlist(char *a1, _DWORD *a2, void *a3, size_t a4, unsigned int a5)
{
  if (filtered_getattrlist::onceToken != -1)
    dispatch_once(&filtered_getattrlist::onceToken, &__block_literal_global_6);
  if (filtered_getattrlist::isJazz)
    a2[5] &= 0xFCu;
  return getattrlist(a1, a2, a3, a4, a5);
}

unint64_t calculateAttributeBufferSize(const attrlist *a1, uint64_t a2)
{
  attrgroup_t commonattr;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  attrgroup_t dirattr;
  uint64_t v7;
  unint64_t v8;
  attrgroup_t fileattr;
  uint64_t v10;
  unint64_t v11;
  attrgroup_t forkattr;
  uint64_t v13;
  uint64_t v14;

  commonattr = a1->commonattr;
  if (a2 <= 0)
    v3 = (commonattr >> 17) & 0x400 | (commonattr >> 14) & 0x100 | ((int)(commonattr << 31) >> 31) & 0x2FE;
  else
    v3 = a2;
  v4 = v3 + 4;
  if (commonattr)
  {
    v5 = v3 + 12;
    if ((commonattr & 1) != 0)
      v4 = v5;
    if ((commonattr & 2) != 0)
      v4 += 4;
    if ((commonattr & 4) != 0)
      v4 += 8;
    if ((commonattr & 8) != 0)
      v4 += 4;
    if ((commonattr & 0x10) != 0)
      v4 += 4;
    if ((commonattr & 0x20) != 0)
      v4 += 8;
    if ((commonattr & 0x40) != 0)
      v4 += 8;
    if ((commonattr & 0x80) != 0)
      v4 += 8;
    if ((commonattr & 0x100) != 0)
      v4 += 4;
    if ((commonattr & 0x200) != 0)
      v4 += 16;
    if ((commonattr & 0x400) != 0)
      v4 += 16;
    if ((commonattr & 0x800) != 0)
      v4 += 16;
    if ((commonattr & 0x1000) != 0)
      v4 += 16;
    if ((commonattr & 0x2000) != 0)
      v4 += 16;
    if ((commonattr & 0x4000) != 0)
      v4 += 32;
    if ((commonattr & 0x8000) != 0)
      v4 += 4;
    if ((commonattr & 0x10000) != 0)
      v4 += 4;
    if ((commonattr & 0x20000) != 0)
      v4 += 4;
    if ((commonattr & 0x40000) != 0)
      v4 += 4;
    if ((commonattr & 0x80000) != 0)
      v4 += 4;
    if ((commonattr & 0x100000) != 0)
      v4 += 4;
    if ((commonattr & 0x200000) != 0)
      v4 += 4;
    if ((commonattr & 0x400000) != 0)
      v4 += 8;
    if ((commonattr & 0x800000) != 0)
      v4 += 16;
    if ((commonattr & 0x1000000) != 0)
      v4 += 16;
    if ((commonattr & 0x2000000) != 0)
      v4 += 8;
    if ((commonattr & 0x4000000) != 0)
      v4 += 8;
    if ((commonattr & 0x8000000) != 0)
      v4 += 8;
    if ((commonattr & 0x10000000) != 0)
      v4 += 16;
    if ((commonattr & 0x20000000) != 0)
      v4 += 4;
    if ((commonattr & 0x40000000) != 0)
      v4 += 4;
    if ((commonattr & 0x80000000) != 0)
      v4 += 20;
  }
  dirattr = a1->dirattr;
  if (dirattr)
  {
    v7 = 4 * (dirattr & 1);
    if ((dirattr & 2) != 0)
      v7 += 4;
    if ((dirattr & 4) != 0)
      v7 += 4;
    if ((dirattr & 8) != 0)
      v7 += 8;
    if ((dirattr & 0x10) != 0)
      v7 += 4;
    if ((dirattr & 0x20) != 0)
      v8 = v7 + 8;
    else
      v8 = v7;
  }
  else
  {
    v8 = 0;
  }
  fileattr = a1->fileattr;
  if (fileattr)
  {
    v10 = 4 * (fileattr & 3);
    if ((fileattr & 4) != 0)
      v10 += 8;
    if ((fileattr & 8) != 0)
      v10 += 4;
    if ((fileattr & 0x20) != 0)
      v10 += 4;
    if ((fileattr & 0x200) != 0)
      v10 += 8;
    if ((fileattr & 0x400) != 0)
      v10 += 8;
    if ((fileattr & 0x1000) != 0)
      v10 += 8;
    if ((fileattr & 0x2000) != 0)
      v11 = v10 + 8;
    else
      v11 = v10;
  }
  else
  {
    v11 = 0;
  }
  forkattr = a1->forkattr;
  if (forkattr)
  {
    v13 = (2 * forkattr) & 8;
    if ((forkattr & 8) != 0)
      v13 += 8;
    if ((forkattr & 0x10) != 0)
      v13 += 8;
    if ((forkattr & 0x20) != 0)
      v13 += 8;
    if ((forkattr & 0x40) != 0)
      v13 += 4;
    if ((forkattr & 0x80) != 0)
      v14 = v13 + 8;
    else
      v14 = v13;
  }
  else
  {
    v14 = 0;
  }
  if (v8 <= v11)
    v8 = v11;
  return v8 + v4 + v14;
}

uint64_t MountInfoGetFSID(uint64_t a1)
{
  return *(_QWORD *)(a1 + 48);
}

uint64_t corePropertyProviderCopyAndCacheValues(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v11;
  const void *v12;
  const void *v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t, CFTypeRef *);
  uint64_t Attributes;
  int v17;
  uint64_t v18;
  uint64_t v20;
  const void *v21;
  CFTypeRef v22;
  CFTypeRef cf;

  _FileCacheLock(a2);
  if (a6 < 1)
  {
LABEL_19:
    _FileCacheUnlock(a2);
    return 1;
  }
  v11 = 0;
  v12 = (const void *)*MEMORY[0x1E0C9B3F0];
  v13 = (const void *)*MEMORY[0x1E0C9B5B0];
  while (1)
  {
    cf = 0;
    v14 = *(_QWORD *)(a5 + 8 * v11);
    if ((*(_BYTE *)(v14 + 8) & 2) == 0
      || !_FileCacheGetPropertyValueForKey(a2, *(const void **)v14, (void **)&cf))
    {
      break;
    }
    if (cf)
      CFRetain(cf);
LABEL_18:
    *(_QWORD *)(a4 + 8 * v11++) = cf;
    if (a6 == v11)
      goto LABEL_19;
  }
  v15 = *(uint64_t (**)(uint64_t, uint64_t, CFTypeRef *))(v14 + 24);
  if (v15)
  {
    Attributes = _FileCacheGetAttributes(a2);
    v17 = v15(a1, Attributes, &cf);
    if (v17 == 2)
      _FileCacheSetPropertyValueForKey(a2, *(const void **)v14, cf);
    if (cf)
    {
      if (*(_QWORD *)(v14 + 16) == 7)
      {
        if (CFEqual(*(CFTypeRef *)v14, v12))
        {
          v22 = 0;
          if (_FileCacheGetPropertyValueForKey(a2, v13, (void **)&v22))
          {
            if (cf != v22 && CFEqual(cf, v22))
            {
              v18 = _FileCacheGetAttributes(a2);
              _FileCacheSetPropertyValueForKey(a2, v13, *(const void **)(v18 + 232));
            }
          }
        }
      }
    }
    if (v17)
      goto LABEL_18;
  }
  _FileCacheUnlock(a2);
  v20 = 0;
  do
  {
    v21 = *(const void **)(a4 + 8 * v20);
    if (v21)
    {
      CFRelease(v21);
      *(_QWORD *)(a4 + 8 * v20) = 0;
    }
    ++v20;
  }
  while (v11 + 1 != v20);
  return 0;
}

uint64_t createCanonicalPathValue(uint64_t a1, uint64_t a2, _QWORD *a3)
{
  CFTypeRef v5;

  if ((*(_BYTE *)(a2 + 1) & 1) == 0)
    return 0;
  v5 = *(CFTypeRef *)(a2 + 232);
  if (v5)
    v5 = CFRetain(v5);
  *a3 = v5;
  return 1;
}

uint64_t createNameValue(uint64_t a1, uint64_t a2, _QWORD *a3)
{
  CFTypeRef v4;

  v4 = *(CFTypeRef *)(a2 + 8);
  if (v4)
    v4 = CFRetain(v4);
  *a3 = v4;
  return 1;
}

uint64_t _FileCacheGetVolumeInfo(uint64_t a1)
{
  return *(_QWORD *)(a1 + 312);
}

uint64_t createIsDirectoryValue(uint64_t a1, uint64_t a2, _QWORD *a3)
{
  _QWORD *v3;

  if ((*(_DWORD *)(a2 + 16) & 0xF000) == 0x4000)
    v3 = (_QWORD *)MEMORY[0x1E0C9AE50];
  else
    v3 = (_QWORD *)MEMORY[0x1E0C9AE40];
  *a3 = *v3;
  return 1;
}

uint64_t createIsHiddenValue(uint64_t a1, uint64_t a2, _QWORD *a3)
{
  _QWORD *v4;

  if ((*(_DWORD *)a2 & 0x800) != 0 || (*(_BYTE *)(a2 + 21) & 0x80) != 0)
  {
    v4 = (_QWORD *)MEMORY[0x1E0C9AE50];
  }
  else
  {
    if ((*(_DWORD *)a2 & 0x10) == 0)
      return 0;
    v4 = (_QWORD *)MEMORY[0x1E0C9AE50];
    if ((*(_WORD *)(a2 + 168) & 0x4000) == 0)
      v4 = (_QWORD *)MEMORY[0x1E0C9AE40];
  }
  *a3 = *v4;
  return 1;
}

CFMutableDictionaryRef _FileCacheGetTemporaryPropertyDictionary(_QWORD *cf, int a2)
{
  CFMutableDictionaryRef result;
  const __CFAllocator *v4;

  result = (CFMutableDictionaryRef)cf[37];
  if (a2)
  {
    if (!result)
    {
      v4 = CFGetAllocator(cf);
      result = CFDictionaryCreateMutable(v4, 0, MEMORY[0x1E0C9B390], MEMORY[0x1E0C9B3A0]);
      cf[37] = result;
    }
  }
  return result;
}

void _FileCacheLockTempPermProperties(void)
{
  os_unfair_lock_lock((os_unfair_lock_t)&sTempPermDictionaryLock);
}

void _FileCacheUnlockTempPermProperties(void)
{
  os_unfair_lock_unlock((os_unfair_lock_t)&sTempPermDictionaryLock);
}

uint64_t createFileResourceTypeValue(uint64_t a1, uint64_t a2, const void **a3)
{
  unsigned int v3;
  const void **v4;
  const void *v5;

  v3 = (*(_DWORD *)(a2 + 16) & 0xF000) - 4096;
  if (v3 >> 14 > 2)
    v4 = (const void **)MEMORY[0x1E0C9B498];
  else
    v4 = (const void **)qword_1E0F0B140[v3 >> 12];
  v5 = *v4;
  *a3 = *v4;
  CFRetain(v5);
  return 1;
}

uint64_t createHasHiddenExtensionValue(uint64_t a1, uint64_t a2, _QWORD *a3)
{
  const __CFString *v5;
  CFIndex Length;
  CFIndex v7;
  const UniChar *v8;
  UniChar v9;
  const __CFString *v10;
  CFIndex v11;
  CFIndex v12;
  const UniChar *v13;
  UniChar v14;
  const UniChar *CharactersPtr;
  const char *CStringPtr;
  const UniChar *v17;
  const char *v18;
  const char *v19;
  uint64_t v20;
  UniChar v21;
  const char *v22;
  uint64_t v23;
  UniChar v24;
  uint64_t v25;
  CFRange v26;
  uint64_t v27;
  UniChar v28;
  uint64_t v29;
  CFRange v30;
  uint64_t v31;
  UniChar v32;
  uint64_t v33;
  CFRange v34;
  uint64_t v35;
  UniChar v36;
  uint64_t v37;
  CFRange v38;
  uint64_t v40;
  CFRange v41;
  uint64_t v42;
  UniChar v43;
  uint64_t v44;
  CFRange v45;
  _QWORD *v46;
  UniChar buffer[64];
  CFStringRef theString;
  const UniChar *v49;
  const char *v50;
  CFIndex v51;
  CFIndex v52;
  uint64_t v53;
  CFIndex v54;
  CFRange v55;
  CFRange v56;

  if ((*(_BYTE *)a2 & 0x10) == 0)
  {
    v5 = *(const __CFString **)(a2 + 8);
    if (v5)
    {
      Length = CFStringGetLength(*(CFStringRef *)(a2 + 8));
      if ((*(_BYTE *)(a2 + 3) & 8) != 0)
      {
        if (*(_WORD *)(a2 + 4) == 3)
        {
          theString = v5;
          v51 = Length - 3;
          v52 = 3;
          CharactersPtr = CFStringGetCharactersPtr(v5);
          v49 = CharactersPtr;
          if (CharactersPtr)
            CStringPtr = 0;
          else
            CStringPtr = CFStringGetCStringPtr(v5, 0x600u);
          v20 = 0;
          v53 = 0;
          v54 = 0;
          v50 = CStringPtr;
          if (!CharactersPtr)
          {
LABEL_32:
            if (v50)
            {
              v21 = v50[v51 + v20];
            }
            else
            {
              if (v54 <= v20 || (v25 = v53, v53 > v20))
              {
                v26.location = v51;
                if (v52 >= 64)
                  v26.length = 64;
                else
                  v26.length = v52;
                v53 = 0;
                v54 = v26.length;
                CFStringGetCharacters(theString, v26, buffer);
                v25 = v53;
              }
              v21 = buffer[v20 - v25];
            }
LABEL_41:
            if ((v21 & 0xFFDF) != 0x41)
              return 0;
            v27 = v20 + 1;
            if (v49)
            {
              v28 = v49[v51 + v27];
            }
            else if (v50)
            {
              v28 = v50[v51 + v27];
            }
            else
            {
              if (v54 <= v27 || (v29 = v53, v53 > v27))
              {
                v30.location = v51;
                if (v52 >= 64)
                  v30.length = 64;
                else
                  v30.length = v52;
                v53 = 0;
                v54 = v30.length;
                CFStringGetCharacters(theString, v30, buffer);
                v29 = v53;
              }
              v28 = buffer[v27 - v29];
            }
            if ((v28 & 0xFFDF) != 0x50)
              return 0;
            v31 = v20 | 2;
            if (v49)
            {
              v32 = v49[v51 + v31];
            }
            else if (v50)
            {
              v32 = v50[v51 + v31];
            }
            else
            {
              if (v54 <= v31 || (v37 = v53, v53 > v31))
              {
                v38.location = v51;
                if (v52 >= 64)
                  v38.length = 64;
                else
                  v38.length = v52;
                v53 = 0;
                v54 = v38.length;
                CFStringGetCharacters(theString, v38, buffer);
                v37 = v53;
              }
              v32 = buffer[v31 - v37];
            }
            if ((v32 & 0xFFDF) != 0x50)
              return 0;
            goto LABEL_104;
          }
LABEL_23:
          v21 = CharactersPtr[v51 + v20];
          goto LABEL_41;
        }
      }
      else if (Length >= 5)
      {
        v7 = Length - 4;
        theString = v5;
        v51 = Length - 4;
        v52 = 4;
        v8 = CFStringGetCharactersPtr(v5);
        v49 = v8;
        if (v8)
        {
          v53 = 0;
          v54 = 0;
          v50 = 0;
          v9 = v8[v7];
        }
        else
        {
          v19 = CFStringGetCStringPtr(v5, 0x600u);
          v53 = 0;
          v54 = 0;
          v50 = v19;
          if (v19)
          {
            v9 = v19[v7];
          }
          else
          {
            v54 = 4;
            v55.location = v7;
            v55.length = 4;
            CFStringGetCharacters(v5, v55, buffer);
            v9 = buffer[-v53];
          }
        }
        if (v9 == 46)
        {
          CharactersPtr = v49;
          v20 = 1;
          if (!v49)
            goto LABEL_32;
          goto LABEL_23;
        }
      }
    }
    return 0;
  }
  if ((*(_WORD *)(a2 + 168) & 0x10) == 0)
  {
    v10 = *(const __CFString **)(a2 + 8);
    if (!v10)
      goto LABEL_106;
    v11 = CFStringGetLength(*(CFStringRef *)(a2 + 8));
    if ((*(_BYTE *)(a2 + 3) & 8) != 0)
    {
      if (*(_WORD *)(a2 + 4) != 3)
        goto LABEL_106;
      theString = v10;
      v51 = v11 - 3;
      v52 = 3;
      v17 = CFStringGetCharactersPtr(v10);
      v49 = v17;
      if (v17)
        v18 = 0;
      else
        v18 = CFStringGetCStringPtr(v10, 0x600u);
      v23 = 0;
      v53 = 0;
      v54 = 0;
      v50 = v18;
      if (!v17)
        goto LABEL_61;
    }
    else
    {
      if (v11 < 5)
        goto LABEL_106;
      v12 = v11 - 4;
      theString = v10;
      v51 = v11 - 4;
      v52 = 4;
      v13 = CFStringGetCharactersPtr(v10);
      v49 = v13;
      if (v13)
      {
        v53 = 0;
        v54 = 0;
        v50 = 0;
        v14 = v13[v12];
      }
      else
      {
        v22 = CFStringGetCStringPtr(v10, 0x600u);
        v53 = 0;
        v54 = 0;
        v50 = v22;
        if (v22)
        {
          v14 = v22[v12];
        }
        else
        {
          v54 = 4;
          v56.location = v12;
          v56.length = 4;
          CFStringGetCharacters(v10, v56, buffer);
          v14 = buffer[-v53];
        }
      }
      if (v14 != 46)
        goto LABEL_106;
      v17 = v49;
      v23 = 1;
      if (!v49)
      {
LABEL_61:
        if (v50)
        {
          v24 = v50[v51 + v23];
        }
        else
        {
          if (v54 <= v23 || (v33 = v53, v53 > v23))
          {
            v34.location = v51;
            if (v52 >= 64)
              v34.length = 64;
            else
              v34.length = v52;
            v53 = 0;
            v54 = v34.length;
            CFStringGetCharacters(theString, v34, buffer);
            v33 = v53;
          }
          v24 = buffer[v23 - v33];
        }
LABEL_70:
        if ((v24 & 0xFFDF) == 0x41)
        {
          v35 = v23 + 1;
          if (v49)
          {
            v36 = v49[v51 + v35];
          }
          else if (v50)
          {
            v36 = v50[v51 + v35];
          }
          else
          {
            if (v54 <= v35 || (v40 = v53, v53 > v35))
            {
              v41.location = v51;
              if (v52 >= 64)
                v41.length = 64;
              else
                v41.length = v52;
              v53 = 0;
              v54 = v41.length;
              CFStringGetCharacters(theString, v41, buffer);
              v40 = v53;
            }
            v36 = buffer[v35 - v40];
          }
          if ((v36 & 0xFFDF) == 0x50)
          {
            v42 = v23 | 2;
            if (v49)
            {
              v43 = v49[v51 + v42];
            }
            else if (v50)
            {
              v43 = v50[v51 + v42];
            }
            else
            {
              if (v54 <= v42 || (v44 = v53, v53 > v42))
              {
                v45.location = v51;
                if (v52 >= 64)
                  v45.length = 64;
                else
                  v45.length = v52;
                v53 = 0;
                v54 = v45.length;
                CFStringGetCharacters(theString, v45, buffer);
                v44 = v53;
              }
              v43 = buffer[v42 - v44];
            }
            if ((v43 & 0xFFDF) == 0x50)
            {
LABEL_104:
              *(_WORD *)(a2 + 4) = 3;
              *(_DWORD *)a2 |= 0x8000000u;
              goto LABEL_105;
            }
          }
        }
LABEL_106:
        v46 = (_QWORD *)MEMORY[0x1E0C9AE40];
        goto LABEL_107;
      }
    }
    v24 = v17[v51 + v23];
    goto LABEL_70;
  }
LABEL_105:
  v46 = (_QWORD *)MEMORY[0x1E0C9AE50];
LABEL_107:
  *a3 = *v46;
  return 1;
}

uint64_t createFileFlagsValue(const void *a1, uint64_t a2, CFNumberRef *a3)
{
  const __CFAllocator *v5;

  v5 = CFGetAllocator(a1);
  *a3 = CFNumberCreate(v5, kCFNumberSInt32Type, (const void *)(a2 + 20));
  return 1;
}

uint64_t createIsVolumeValue(uint64_t a1, _DWORD *a2, _QWORD *a3)
{
  _QWORD *v3;

  v3 = (_QWORD *)MEMORY[0x1E0C9AE50];
  if ((*a2 & 0x2000) == 0)
    v3 = (_QWORD *)MEMORY[0x1E0C9AE40];
  *a3 = *v3;
  return 1;
}

uint64_t createIsMountTriggerValue(uint64_t a1, _DWORD *a2, _QWORD *a3)
{
  _QWORD *v3;

  v3 = (_QWORD *)MEMORY[0x1E0C9AE50];
  if ((*a2 & 0x4000) == 0)
    v3 = (_QWORD *)MEMORY[0x1E0C9AE40];
  *a3 = *v3;
  return 1;
}

uint64_t createCreationDateValue(const void *a1, uint64_t a2, CFDateRef *a3)
{
  CFDateRef v4;
  const __CFAllocator *v6;

  if (*(double *)(a2 + 80) == -1.0 - *MEMORY[0x1E0C9ADE8])
  {
    v4 = 0;
  }
  else
  {
    v6 = CFGetAllocator(a1);
    v4 = CFDateCreate(v6, *(CFAbsoluteTime *)(a2 + 80));
  }
  *a3 = v4;
  return 1;
}

uint64_t createIsRegularFileValue(uint64_t a1, uint64_t a2, _QWORD *a3)
{
  _QWORD *v3;

  if ((*(_DWORD *)(a2 + 16) & 0xF000) == 0x8000)
    v3 = (_QWORD *)MEMORY[0x1E0C9AE50];
  else
    v3 = (_QWORD *)MEMORY[0x1E0C9AE40];
  *a3 = *v3;
  return 1;
}

uint64_t createParentDirectoryIsVolumeRoot(uint64_t a1, uint64_t a2, _QWORD *a3)
{
  _QWORD *v4;

  if ((*(_BYTE *)a2 & 4) == 0)
    return 0;
  v4 = (_QWORD *)MEMORY[0x1E0C9AE50];
  if (*(_QWORD *)(a2 + 136) != 2)
    v4 = (_QWORD *)MEMORY[0x1E0C9AE40];
  *a3 = *v4;
  return 1;
}

uint64_t createVolumeIDValue(const void *a1, uint64_t a2, CFNumberRef *a3)
{
  const void *v4;
  const __CFAllocator *v5;
  CFNumberRef v6;

  v4 = (const void *)(a2 + 112);
  if (*(_DWORD *)(a2 + 112))
  {
    v5 = CFGetAllocator(a1);
    v6 = CFNumberCreate(v5, kCFNumberSInt32Type, v4);
  }
  else
  {
    v6 = 0;
  }
  *a3 = v6;
  return 1;
}

uint64_t createIsAliasFileValue(uint64_t a1, uint64_t a2, _QWORD *a3)
{
  _QWORD *v3;

  if ((*(_DWORD *)(a2 + 16) & 0xF000) == 0x8000)
  {
    if ((*(_BYTE *)a2 & 0x10) == 0)
      return 0;
    v3 = (_QWORD *)MEMORY[0x1E0C9AE50];
    if (*(__int16 *)(a2 + 168) >= 0)
      v3 = (_QWORD *)MEMORY[0x1E0C9AE40];
  }
  else if ((*(_DWORD *)(a2 + 16) & 0xF000) == 0xA000)
  {
    v3 = (_QWORD *)MEMORY[0x1E0C9AE50];
  }
  else
  {
    v3 = (_QWORD *)MEMORY[0x1E0C9AE40];
  }
  *a3 = *v3;
  return 1;
}

uint64_t createAddedToDirectoryDateValue(const void *a1, uint64_t a2, CFDateRef *a3)
{
  CFDateRef v4;
  const __CFAllocator *v6;

  if (*(double *)(a2 + 88) == -1.0 - *MEMORY[0x1E0C9ADE8])
  {
    v4 = 0;
  }
  else
  {
    v6 = CFGetAllocator(a1);
    v4 = CFDateCreate(v6, *(CFAbsoluteTime *)(a2 + 88));
  }
  *a3 = v4;
  return 1;
}

uint64_t createIsReadableValue(uint64_t a1, _DWORD *a2, _QWORD *a3)
{
  _QWORD *v4;

  if ((*a2 & 8) == 0)
    return 0;
  if ((*a2 & 0x2000000) != 0)
    v4 = (_QWORD *)MEMORY[0x1E0C9AE50];
  else
    v4 = (_QWORD *)MEMORY[0x1E0C9AE40];
  *a3 = *v4;
  return 1;
}

uint64_t createIsSymbolicLinkValue(uint64_t a1, uint64_t a2, _QWORD *a3)
{
  _QWORD *v3;

  if ((*(_DWORD *)(a2 + 16) & 0xF000) == 0xA000)
    v3 = (_QWORD *)MEMORY[0x1E0C9AE50];
  else
    v3 = (_QWORD *)MEMORY[0x1E0C9AE40];
  *a3 = *v3;
  return 1;
}

uint64_t createIsSystemImmutableValue(uint64_t a1, uint64_t a2, _QWORD *a3)
{
  _QWORD *v3;

  v3 = (_QWORD *)MEMORY[0x1E0C9AE50];
  if ((*(_DWORD *)(a2 + 20) & 0x20000) == 0)
    v3 = (_QWORD *)MEMORY[0x1E0C9AE40];
  *a3 = *v3;
  return 1;
}

uint64_t createIsUserImmutableValue(uint64_t a1, uint64_t a2, _QWORD *a3)
{
  _QWORD *v3;

  v3 = (_QWORD *)MEMORY[0x1E0C9AE50];
  if ((*(_DWORD *)(a2 + 20) & 2) == 0)
    v3 = (_QWORD *)MEMORY[0x1E0C9AE40];
  *a3 = *v3;
  return 1;
}

uint64_t createIsExecutableValue(uint64_t a1, _DWORD *a2, _QWORD *a3)
{
  _QWORD *v4;

  if ((*a2 & 8) == 0)
    return 0;
  if ((*a2 & 0x800000) != 0)
    v4 = (_QWORD *)MEMORY[0x1E0C9AE50];
  else
    v4 = (_QWORD *)MEMORY[0x1E0C9AE40];
  *a3 = *v4;
  return 1;
}

uint64_t createIsCompressedValue(uint64_t a1, uint64_t a2, _QWORD *a3)
{
  _QWORD *v3;

  v3 = (_QWORD *)MEMORY[0x1E0C9AE50];
  if ((*(_DWORD *)(a2 + 20) & 0x20) == 0)
    v3 = (_QWORD *)MEMORY[0x1E0C9AE40];
  *a3 = *v3;
  return 1;
}

uint64_t createIsWriteableValue(uint64_t a1, _DWORD *a2, _QWORD *a3)
{
  _QWORD *v4;

  if ((*a2 & 8) == 0)
    return 0;
  if ((*a2 & 0x1000000) != 0)
    v4 = (_QWORD *)MEMORY[0x1E0C9AE50];
  else
    v4 = (_QWORD *)MEMORY[0x1E0C9AE40];
  *a3 = *v4;
  return 1;
}

uint64_t createFileSizeValue(const void *a1, uint64_t a2, CFNumberRef *a3)
{
  const __CFAllocator *v6;
  CFNumberRef v7;

  if ((*(_BYTE *)a2 & 0x40) == 0)
    return 0;
  if ((*(_DWORD *)(a2 + 16) & 0xD000 | 0x2000) == 0xA000)
  {
    v6 = CFGetAllocator(a1);
    v7 = CFNumberCreate(v6, kCFNumberSInt64Type, (const void *)(a2 + 208));
  }
  else
  {
    v7 = 0;
  }
  *a3 = v7;
  return 1;
}

uint64_t createFinderInfoValue(const void *a1, uint64_t a2, _QWORD *a3)
{
  uint64_t result;
  const __CFAllocator *v6;
  void *v7;

  if ((*(_DWORD *)a2 & 0x10) == 0)
    return 0;
  if ((*(_DWORD *)a2 & 0x4000000) != 0)
  {
    if (createFinderInfoValue(__CFURL const*,_FileAttributes const*,void *)::onceToken != -1)
      dispatch_once(&createFinderInfoValue(__CFURL const*,_FileAttributes const*,void *)::onceToken, &__block_literal_global_20);
    v7 = (void *)CFRetain((CFTypeRef)createFinderInfoValue(__CFURL const*,_FileAttributes const*,void *)::zeroFinderInfoData);
    result = 1;
  }
  else
  {
    v6 = CFGetAllocator(a1);
    v7 = CFDataCreate(v6, (const UInt8 *)(a2 + 160), 32);
    result = 2;
  }
  *a3 = v7;
  return result;
}

uint64_t createIsSystemNoUnlinkValue(uint64_t a1, uint64_t a2, _QWORD *a3)
{
  _QWORD *v3;

  v3 = (_QWORD *)MEMORY[0x1E0C9AE50];
  if ((*(_DWORD *)(a2 + 20) & 0x100000) == 0)
    v3 = (_QWORD *)MEMORY[0x1E0C9AE40];
  *a3 = *v3;
  return 1;
}

uint64_t createContentModificationDateValue(const void *a1, uint64_t a2, CFDateRef *a3)
{
  const __CFAllocator *v5;

  v5 = CFGetAllocator(a1);
  *a3 = CFDateCreate(v5, *(CFAbsoluteTime *)(a2 + 64));
  return 1;
}

uint64_t createFileIDValue(const void *a1, _BYTE *a2, CFNumberRef *a3)
{
  const void *v5;
  const __CFAllocator *v6;
  CFNumberRef v7;

  if ((*a2 & 4) == 0)
    return 0;
  v5 = a2 + 128;
  if (*((_QWORD *)a2 + 16))
  {
    v6 = CFGetAllocator(a1);
    v7 = CFNumberCreate(v6, kCFNumberSInt64Type, v5);
  }
  else
  {
    v7 = 0;
  }
  *a3 = v7;
  return 1;
}

uint64_t createFileAllocatedSizeOfResourceForkValue(const void *a1, uint64_t a2, CFNumberRef *a3)
{
  CFNumberRef v6;
  const __CFAllocator *v7;
  uint64_t valuePtr;

  if ((*(_DWORD *)(a2 + 16) & 0xF000) == 0x8000)
  {
    if ((*(_BYTE *)a2 & 0x20) == 0)
      return 0;
    v7 = CFGetAllocator(a1);
    valuePtr = *(_QWORD *)(a2 + 200);
    v6 = CFNumberCreate(v7, kCFNumberSInt64Type, &valuePtr);
  }
  else
  {
    v6 = 0;
  }
  *a3 = v6;
  return 1;
}

uint64_t createAttributeModificationDateValue(const void *a1, uint64_t a2, CFDateRef *a3)
{
  const __CFAllocator *v5;

  v5 = CFGetAllocator(a1);
  *a3 = CFDateCreate(v5, *(CFAbsoluteTime *)(a2 + 72));
  return 1;
}

uint64_t createFileSizeOfResourceForkValue(const void *a1, uint64_t a2, CFNumberRef *a3)
{
  CFNumberRef v6;
  const __CFAllocator *v7;

  if ((*(_DWORD *)(a2 + 16) & 0xF000) == 0x8000)
  {
    if ((*(_BYTE *)a2 & 0x20) == 0)
      return 0;
    v7 = CFGetAllocator(a1);
    v6 = CFNumberCreate(v7, kCFNumberSInt64Type, (const void *)(a2 + 192));
  }
  else
  {
    v6 = 0;
  }
  *a3 = v6;
  return 1;
}

uint64_t createFileAllocatedSizeValue(const void *a1, uint64_t a2, CFNumberRef *a3)
{
  const __CFAllocator *v6;
  CFNumberRef v7;
  uint64_t valuePtr;

  if ((*(_BYTE *)a2 & 0x40) == 0)
    return 0;
  if ((*(_DWORD *)(a2 + 16) & 0xD000 | 0x2000) == 0xA000)
  {
    v6 = CFGetAllocator(a1);
    valuePtr = *(_QWORD *)(a2 + 216);
    v7 = CFNumberCreate(v6, kCFNumberSInt64Type, &valuePtr);
  }
  else
  {
    v7 = 0;
  }
  *a3 = v7;
  return 1;
}

uint64_t createIsSystemFirmlinkValue(uint64_t a1, uint64_t a2, _QWORD *a3)
{
  _QWORD *v3;

  v3 = (_QWORD *)MEMORY[0x1E0C9AE50];
  if ((*(_DWORD *)(a2 + 20) & 0x800000) == 0)
    v3 = (_QWORD *)MEMORY[0x1E0C9AE40];
  *a3 = *v3;
  return 1;
}

uint64_t createIsSystemDatalessValue(uint64_t a1, uint64_t a2, _QWORD *a3)
{
  _QWORD *v3;

  v3 = (_QWORD *)MEMORY[0x1E0C9AE50];
  if ((*(_DWORD *)(a2 + 20) & 0x40000000) == 0)
    v3 = (_QWORD *)MEMORY[0x1E0C9AE40];
  *a3 = *v3;
  return 1;
}

uint64_t createIsRestrictedValue(uint64_t a1, uint64_t a2, _QWORD *a3)
{
  _QWORD *v3;

  v3 = (_QWORD *)MEMORY[0x1E0C9AE50];
  if ((*(_DWORD *)(a2 + 20) & 0x80000) == 0)
    v3 = (_QWORD *)MEMORY[0x1E0C9AE40];
  *a3 = *v3;
  return 1;
}

uint64_t createLabelNumberValue(const void *a1, uint64_t a2, CFNumberRef *a3)
{
  const __CFAllocator *v5;
  int valuePtr;

  if ((*(_BYTE *)a2 & 0x10) == 0)
    return 0;
  valuePtr = (*(unsigned __int16 *)(a2 + 168) >> 1) & 7;
  v5 = CFGetAllocator(a1);
  *a3 = CFNumberCreate(v5, kCFNumberSInt32Type, &valuePtr);
  return 1;
}

uint64_t createLinkCountValue(const void *a1, uint64_t a2, CFNumberRef *a3)
{
  const __CFAllocator *v5;

  v5 = CFGetAllocator(a1);
  *a3 = CFNumberCreate(v5, kCFNumberSInt32Type, (const void *)(a2 + 24));
  return 1;
}

uint64_t createTotalFileSizeValue(const void *a1, uint64_t a2, CFNumberRef *a3)
{
  const __CFAllocator *v5;
  uint64_t *v6;
  uint64_t v8;

  if ((*(_DWORD *)(a2 + 16) & 0xF000) == 0xA000)
  {
    if ((*(_BYTE *)a2 & 0x40) != 0)
    {
      v5 = CFGetAllocator(a1);
      v6 = (uint64_t *)(a2 + 208);
      goto LABEL_9;
    }
    return 0;
  }
  if ((*(_DWORD *)(a2 + 16) & 0xF000) == 0x8000)
  {
    if ((~*(_DWORD *)a2 & 0x60) == 0)
    {
      v8 = *(_QWORD *)(a2 + 192) + *(_QWORD *)(a2 + 208);
      v5 = CFGetAllocator(a1);
      v6 = &v8;
LABEL_9:
      *a3 = CFNumberCreate(v5, kCFNumberSInt64Type, v6);
      return 1;
    }
    return 0;
  }
  *a3 = 0;
  return 1;
}

uint64_t createTotalFileAllocatedSizeValue(const void *a1, uint64_t a2, CFNumberRef *a3)
{
  uint64_t v5;
  const __CFAllocator *v6;
  CFNumberRef v8;
  uint64_t valuePtr;

  if ((*(_DWORD *)(a2 + 16) & 0xF000) == 0xA000)
  {
    if ((*(_BYTE *)a2 & 0x40) != 0)
    {
      v6 = CFGetAllocator(a1);
      valuePtr = *(_QWORD *)(a2 + 216);
      goto LABEL_9;
    }
    return 0;
  }
  if ((*(_DWORD *)(a2 + 16) & 0xF000) == 0x8000)
  {
    if ((~*(_DWORD *)a2 & 0x60) == 0)
    {
      v5 = *(_QWORD *)(a2 + 200) + *(_QWORD *)(a2 + 216);
      v6 = CFGetAllocator(a1);
      valuePtr = v5;
LABEL_9:
      v8 = CFNumberCreate(v6, kCFNumberSInt64Type, &valuePtr);
      goto LABEL_10;
    }
    return 0;
  }
  v8 = 0;
LABEL_10:
  *a3 = v8;
  return 1;
}

uint64_t createParentDirectoryIDValue(const void *a1, _BYTE *a2, CFNumberRef *a3)
{
  const void *v5;
  const __CFAllocator *v6;
  CFNumberRef v7;

  if ((*a2 & 4) == 0)
    return 0;
  v5 = a2 + 136;
  if (*((_QWORD *)a2 + 17))
  {
    v6 = CFGetAllocator(a1);
    v7 = CFNumberCreate(v6, kCFNumberSInt64Type, v5);
  }
  else
  {
    v7 = 0;
  }
  *a3 = v7;
  return 1;
}

uint64_t createGenerationIdentifierValue(const void *a1, uint64_t a2, CFDataRef *a3)
{
  int v4;
  const __CFAllocator *v6;
  uint64_t v7;
  int v8;

  v4 = *(_DWORD *)(a2 + 32);
  if (v4)
  {
    if ((*(_BYTE *)a2 & 4) == 0)
      return 0;
    v7 = *(_QWORD *)(a2 + 120);
    v8 = v4;
    v6 = CFGetAllocator(a1);
    *a3 = CFDataCreate(v6, (const UInt8 *)&v7, 12);
  }
  else
  {
    *a3 = 0;
  }
  return 1;
}

uint64_t createFileProtectionValue(uint64_t a1, uint64_t a2, const void **a3)
{
  int v3;
  const void **v4;
  const void *v5;

  v3 = *(_DWORD *)(a2 + 48) - 1;
  if (v3 >= 4)
  {
    *a3 = 0;
  }
  else
  {
    v4 = (const void **)qword_1E0F0B120[v3];
    v5 = *v4;
    *a3 = *v4;
    if (v5)
      CFRetain(v5);
  }
  return 1;
}

uint64_t createVolumeIsHFSStandardValue(uint64_t a1, _DWORD *a2, _QWORD *a3)
{
  _QWORD *v3;

  v3 = (_QWORD *)MEMORY[0x1E0C9AE50];
  if ((*a2 & 0x40000) == 0)
    v3 = (_QWORD *)MEMORY[0x1E0C9AE40];
  *a3 = *v3;
  return 1;
}

uint64_t MountInfoGetVolumeName(uint64_t a1)
{
  return a1 + 2184;
}

uint64_t MountInfoGetMutableVolumeInfo(const char *a1, _QWORD *a2, _QWORD *a3, _QWORD *a4, uint64_t *a5)
{
  uint64_t result;
  uint64_t f_bavail_low;
  uint64_t v12;
  uint64_t v13;
  uint64_t f_bsize;
  uint64_t f_bavail;
  _QWORD v16[3];
  statfs v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  if ((~*((_DWORD *)a1 + 741) & 0x614) != 0)
  {
    result = statfs(a1 + 88, &v17);
    if (!(_DWORD)result)
    {
      *a2 = v17.f_files - v17.f_ffree;
      *a3 = 0;
      f_bsize = v17.f_bsize;
      f_bavail = v17.f_bavail;
      *a4 = v17.f_blocks * v17.f_bsize;
      v12 = f_bavail * f_bsize;
      goto LABEL_8;
    }
  }
  else
  {
    v16[2] = 0;
    v16[0] = 5;
    v16[1] = 2147485204;
    result = filtered_getattrlist((char *)a1 + 88, v16, &v17, 0x1CuLL, 0);
    if (!(_DWORD)result)
    {
      f_bavail_low = LODWORD(v17.f_bavail);
      *a2 = HIDWORD(v17.f_bfree);
      *a3 = f_bavail_low;
      *a4 = *(_QWORD *)&v17.f_iosize;
      v12 = *(uint64_t *)((char *)&v17.f_blocks + 4);
LABEL_8:
      *a5 = v12;
      return result;
    }
  }
  *a2 = *((_QWORD *)a1 + 4) - *((_QWORD *)a1 + 5);
  *a3 = 0;
  v13 = *(unsigned int *)a1;
  *a4 = *((_QWORD *)a1 + 1) * v13;
  *a5 = *((_QWORD *)a1 + 3) * v13;
  return result;
}

uint64_t createInodeNumberValue(const void *a1, _BYTE *a2, CFNumberRef *a3)
{
  const void *v5;
  const __CFAllocator *v6;
  CFNumberRef v7;

  if ((*a2 & 4) == 0)
    return 0;
  v5 = a2 + 120;
  if (*((_QWORD *)a2 + 15))
  {
    v6 = CFGetAllocator(a1);
    v7 = CFNumberCreate(v6, kCFNumberSInt64Type, v5);
  }
  else
  {
    v7 = 0;
  }
  *a3 = v7;
  return 1;
}

uint64_t GetStatfsByFSID(fsid a1, statfs *a2)
{
  int v4;
  statfs *v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  statfs *v10;

  v10 = 0;
  v4 = getmntinfo_r_np(&v10, 2);
  if (!v4)
    return 0xFFFFFFFFLL;
  v5 = v10;
  if (v4 < 1)
  {
LABEL_7:
    v8 = 0xFFFFFFFFLL;
  }
  else
  {
    v6 = (char *)&v10->f_fsid + 4;
    v7 = v4;
    while (*(_QWORD *)(v6 - 4) != a1)
    {
      v6 += 2168;
      if (!--v7)
        goto LABEL_7;
    }
    memmove(a2, v6 - 52, 0x878uLL);
    v8 = 0;
  }
  free(v5);
  return v8;
}

uint64_t _FSURLCopyResourcePropertyForKeyFromCache(const __CFURL *a1, const __CFString *a2, void **a3, const void *a4)
{
  return _FSURLCopyResourcePropertyForKeyInternal(a1, a2, a3, a4, 0, 0);
}

void _FSURLBeginResourcePropertyCacheAccess(const __CFURL *a1, const void *a2)
{
  CFTypeRef v4;
  int GlobalSeed;
  const __CFURL *v6;
  const void *v7;
  CFTypeRef v8;
  CFTypeRef cf;

  if (a2 && _CFRunLoopCurrentIsMain())
  {
    v4 = _FileCacheGetForURL(a1, a2);
    _FileCacheLock((uint64_t)v4);
    if (!_FileCacheGetAutoFlushingEnabled((uint64_t)v4)
      || _FileCacheGetInProvider((uint64_t)v4)
      || (GlobalSeed = _FileCacheGetGlobalSeed(), _FileCacheIsValid((uint64_t)v4, GlobalSeed)))
    {
      _FileCacheUnlock((uint64_t)v4);
    }
    else
    {
      _FileCacheReleaseContents((uint64_t)v4, 1, 1, 1, 0);
      _FileCacheUnlock((uint64_t)v4);
      cf = 0;
      if (_FSURLCopyResourcePropertyForKeyInternal(a1, (const __CFString *)*MEMORY[0x1E0C9AD40], (void **)&cf, a2, 0, 1))
      {
        v6 = (const __CFURL *)cf;
        if (cf)
        {
          if (cf != (CFTypeRef)*MEMORY[0x1E0C9B0D0])
          {
            v7 = (const void *)__CFURLResourceInfoPtr();
            if (v7)
            {
              v8 = _FileCacheGetForURL(v6, v7);
              _FileCacheLock((uint64_t)v8);
              _FileCacheReleaseContents((uint64_t)v8, 1, 1, 1, 0);
              _FileCacheUnlock((uint64_t)v8);
            }
          }
          CFRelease(v6);
        }
      }
    }
  }
}

void _FSURLEndResourcePropertyCacheAccess(const __CFURL *a1, const void *a2)
{
  CFTypeRef v2;
  unsigned int GlobalSeed;
  __CFRunLoop *Main;

  if (a2)
  {
    v2 = _FileCacheGetForURL(a1, a2);
    _FileCacheLock((uint64_t)v2);
    if (!_FileCacheGetInProvider((uint64_t)v2) && _FileCacheNeedsValidSeed((uint64_t)v2))
    {
      if (_CFRunLoopCurrentIsMain())
      {
        GlobalSeed = _FileCacheGetGlobalSeed();
        _FileCacheSetValidSeed((uint64_t)v2, GlobalSeed);
        Main = CFRunLoopGetMain();
        _FileCacheScheduleGlobalSeedIncrement(Main);
      }
    }
    _FileCacheUnlock((uint64_t)v2);
  }
}

uint64_t _FileCacheGetInProvider(uint64_t a1)
{
  return atomic_load((unsigned int *)(a1 + 20));
}

BOOL _FileCacheNeedsValidSeed(uint64_t a1)
{
  unsigned int v1;

  v1 = atomic_load((unsigned int *)(a1 + 16));
  return v1 == -1;
}

uint64_t _FileCacheGetGlobalSeed(void)
{
  return seedGlobals;
}

void _FileCacheScheduleGlobalSeedIncrement(CFRunLoopRef rl)
{
  __CFRunLoopObserver *v2;
  CFRunLoopObserverContext v3;

  v2 = (__CFRunLoopObserver *)seedGlobals;
  if (!seedGlobals)
  {
    memset(&v3, 0, sizeof(v3));
    v2 = CFRunLoopObserverCreate((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0x40uLL, 1u, 0, (CFRunLoopObserverCallBack)observerCall, &v3);
    seedGlobals = (uint64_t)v2;
  }
  if ((seedGlobals & 1) == 0)
  {
    if (v2)
    {
      CFRunLoopAddObserver(rl, v2, (CFRunLoopMode)*MEMORY[0x1E0C9B270]);
      seedGlobals = 1;
    }
  }
}

uint64_t _FileCacheSetValidSeed(uint64_t result, unsigned int a2)
{
  int v2;

  v2 = atomic_load((unsigned int *)(result + 16));
  if (v2 >= -1)
    atomic_store(a2, (unsigned int *)(result + 16));
  return result;
}

BOOL _FileCacheGetAutoFlushingEnabled(uint64_t a1)
{
  unsigned int v1;

  v1 = atomic_load((unsigned int *)(a1 + 16));
  return v1 != -2;
}

BOOL _FileCacheIsValid(uint64_t a1, int a2)
{
  unsigned int v2;
  unsigned int v3;

  v2 = atomic_load((unsigned int *)(a1 + 16));
  if ((v2 & 0x80000000) != 0)
    return 1;
  v3 = atomic_load((unsigned int *)(a1 + 16));
  return v3 == a2;
}

uint64_t _FileCacheGetFinderInfo(uint64_t result)
{
  if (result)
  {
    if ((*(_BYTE *)(result + 48) & 0x10) != 0)
      result += 208;
    else
      return 0;
  }
  return result;
}

uint64_t _URLEnumeratorGetNextURL(uint64_t a1, _QWORD *a2, CFErrorRef *a3)
{
  uint64_t result;
  uint64_t v7;
  const void *v8;
  __CFError *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  _BOOL8 v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;

  if (*(_BYTE *)(a1 + 120))
    goto LABEL_2;
  v7 = *(_QWORD *)(a1 + 48);
  *(_QWORD *)(a1 + 104) = 0;
  v8 = *(const void **)(a1 + 112);
  if (v7)
  {
    if (v8)
    {
      CFRelease(v8);
      *(_QWORD *)(a1 + 112) = 0;
    }
    if (!*(_QWORD *)(a1 + 160))
      _InitalizeDirectoryEnumerator(a1);
    if (*(_BYTE *)(a1 + 120))
    {
      *(_QWORD *)(a1 + 56) = 0;
      if (!a3)
        return 3;
      v9 = *(__CFError **)(a1 + 112);
      if (!v9)
      {
LABEL_38:
        *a3 = v9;
        if (!v9)
        {
LABEL_39:
          v16 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR);
          if (v16)
            _URLEnumeratorGetNextURL_cold_1(v16, v17, v18, v19, v20, v21, v22, v23);
          *a3 = CFErrorCreate((CFAllocatorRef)*MEMORY[0x1E0C9AE00], (CFErrorDomain)*MEMORY[0x1E0C9AFB8], 256, 0);
        }
        return 3;
      }
    }
    else
    {
      while (1)
      {
        v10 = *(_QWORD *)(a1 + 88);
        if (v10 < *(_QWORD *)(a1 + 80))
        {
          if (*(_BYTE *)(a1 + v10 + 488))
            result = 4;
          else
            result = 1;
          if (a2)
          {
            v11 = *(_QWORD *)(*(_QWORD *)(a1 + 72) + 8 * v10);
            *(_QWORD *)(a1 + 104) = v11;
            *a2 = v11;
            *(_QWORD *)(a1 + 56) = *(_QWORD *)(a1 + 8 * v10 + 168);
          }
          *(_QWORD *)(a1 + 88) = v10 + 1;
          return result;
        }
        v9 = *(__CFError **)(a1 + 96);
        if (v9)
          break;
        if (!_GetDirectoryURLs(a1))
          goto LABEL_2;
      }
      *(_QWORD *)(a1 + 112) = v9;
      *(_QWORD *)(a1 + 56) = *(_QWORD *)(a1 + 528);
      *(_QWORD *)(a1 + 96) = 0;
      if (!a3)
        return 3;
    }
    v9 = (__CFError *)CFRetain(v9);
    goto LABEL_38;
  }
  if (v8)
  {
    CFRelease(v8);
    *(_QWORD *)(a1 + 112) = 0;
  }
  if (!*(_QWORD *)(a1 + 72))
    _InitalizeVolumeEnumerator(a1);
  if (*(_BYTE *)(a1 + 120) || (v13 = *(_QWORD *)(a1 + 72)) == 0)
  {
    if (!a3)
      return 3;
    v12 = *(void **)(a1 + 112);
    if (v12)
      v12 = (void *)CFRetain(v12);
    *a3 = (CFErrorRef)v12;
    *(_QWORD *)(a1 + 56) = 0;
    if (v12)
      return 3;
    goto LABEL_39;
  }
  v14 = *(_QWORD *)(a1 + 88);
  if (v14 >= *(_QWORD *)(a1 + 80))
  {
LABEL_2:
    *(_QWORD *)(a1 + 56) = 0;
    return 2;
  }
  *(_QWORD *)(a1 + 56) = 1;
  if (a2)
  {
    v15 = *(_QWORD *)(v13 + 8 * v14);
    *(_QWORD *)(a1 + 104) = v15;
    *a2 = v15;
  }
  *(_QWORD *)(a1 + 88) = v14 + 1;
  return 1;
}

uint64_t _GetDirectoryURLs(uint64_t a1)
{
  uint64_t v2;
  char *v3;
  _OWORD *v4;
  uint64_t *v5;
  uint64_t v6;
  int v7;
  uint64_t v8;
  uint64_t v9;
  unsigned __int8 v10;
  const __CFString *v11;
  unsigned int v12;
  int v13;
  const __CFAllocator *v14;
  int v15;
  const char *v16;
  int v17;
  int v18;
  void *HasExtendedAttributes;
  CFURLRef v20;
  const __CFURL *v21;
  const __CFArray *v22;
  const void *v23;
  uint64_t v24;
  uint64_t v25;
  const __CFArray *v26;
  const void *v27;
  uint64_t v28;
  uint64_t v29;
  CFErrorRef v30;
  uint64_t v31;
  CFBooleanRef v32;
  uint64_t v34;
  const __CFString *v35;
  CFBooleanRef propertyValueTypeRefPtr;
  uint64_t v37;
  const __CFBoolean *v38;
  __CFError *v39;
  void **v40[2];

  v40[1] = *(void ***)MEMORY[0x1E0C80C00];
  v40[0] = 0;
  v2 = MountInfoStorageSize();
  v3 = (char *)&v34 - ((MEMORY[0x1E0C80A78](v2) + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = *(_OWORD **)(a1 + 72);
  if (!v4)
    return 0;
  v5 = (uint64_t *)(a1 + 80);
  if (*(uint64_t *)(a1 + 80) >= 1)
  {
    v6 = 0;
    do
      CFRelease(*(CFTypeRef *)(*(_QWORD *)(a1 + 72) + 8 * v6++));
    while (v6 < *(_QWORD *)(a1 + 80));
    v4 = *(_OWORD **)(a1 + 72);
  }
  v4[18] = 0u;
  v4[19] = 0u;
  v4[16] = 0u;
  v4[17] = 0u;
  v4[14] = 0u;
  v4[15] = 0u;
  v4[12] = 0u;
  v4[13] = 0u;
  v4[10] = 0u;
  v4[11] = 0u;
  v4[8] = 0u;
  v4[9] = 0u;
  v4[6] = 0u;
  v4[7] = 0u;
  v4[4] = 0u;
  v4[5] = 0u;
  v4[2] = 0u;
  v4[3] = 0u;
  *v4 = 0u;
  v4[1] = 0u;
  *(_QWORD *)(a1 + 520) = 0;
  *(_OWORD *)(a1 + 488) = 0u;
  *(_OWORD *)(a1 + 504) = 0u;
  *v5 = 0;
  *(_QWORD *)(a1 + 88) = 0;
  if (*(_BYTE *)(a1 + 121))
  {
    v7 = *(_DWORD *)(*(_QWORD *)(a1 + 160) + 1792);
    if (v7)
    {
      if (!MountInfoPrepare(v40, 0, v7, v3, a1 + 152, 0, 0))
        *(_BYTE *)(a1 + 121) = 0;
    }
  }
  v39 = 0;
  v8 = DirEnumRead(*(_QWORD *)(a1 + 160));
  if (!v8)
  {
    v10 = 0;
    goto LABEL_85;
  }
  v9 = v8;
  v10 = 0;
  v11 = (const __CFString *)*MEMORY[0x1E0C9B4F8];
  v35 = (const __CFString *)*MEMORY[0x1E0C9B508];
  while (1)
  {
    v12 = *(_DWORD *)(v9 + 48);
    if (v12 > 6)
      goto LABEL_76;
    v13 = 1 << v12;
    if (((1 << v12) & 6) != 0)
    {
      if (!*(_DWORD *)(v9 + 44))
        goto LABEL_76;
      if (v12 != 1)
        goto LABEL_52;
      if ((*(_BYTE *)(a1 + 32) & 1) != 0)
        goto LABEL_22;
      DirEnumSkipDescendents(*(_QWORD *)(a1 + 160));
      v12 = *(_DWORD *)(v9 + 48);
      if (v12 == 2)
      {
LABEL_52:
        if ((*(_BYTE *)(a1 + 32) & 0x20) == 0)
          goto LABEL_76;
        v18 = 0;
        v17 = 1;
        goto LABEL_28;
      }
      if (v12 == 1)
      {
LABEL_22:
        if ((*(_QWORD *)(a1 + 32) & 0x30) == 0x20)
          goto LABEL_76;
        v17 = 0;
        v18 = 1;
        goto LABEL_28;
      }
    }
    else if ((v13 & 0x18) == 0)
    {
      if ((v13 & 0x60) == 0)
        goto LABEL_76;
      v14 = *(const __CFAllocator **)(a1 + 16);
      v15 = *(_DWORD *)(v9 + 40);
      v16 = *(const char **)(v9 + 8);
      goto LABEL_55;
    }
    if (v12 == 3 && (*(_BYTE *)(a1 + 35) & 0x80) == 0 && !strncmp(*(const char **)(v9 + 24), "._", 2uLL))
      goto LABEL_76;
    v18 = 0;
    v17 = 0;
LABEL_28:
    if (*(_BYTE *)(a1 + 121) && *(_QWORD *)(v9 + 56))
      break;
    v25 = MEMORY[0x186DA3264](*(_QWORD *)(a1 + 16), *(_QWORD *)(v9 + 8) + *(_QWORD *)(a1 + 544), *(_QWORD *)(v9 + 16) - *(_QWORD *)(a1 + 544), v18 | v17, *(_QWORD *)(a1 + 536));
    if (!v25)
    {
      v14 = *(const __CFAllocator **)(a1 + 16);
      v16 = *(const char **)(v9 + 8);
      v15 = 63;
LABEL_55:
      v30 = _CFErrorWithPOSIXPathAndErrno(v14, v15, v16);
      if (v30)
        goto LABEL_83;
      goto LABEL_77;
    }
    v21 = (const __CFURL *)v25;
    v26 = *(const __CFArray **)(a1 + 64);
    if (v26)
    {
      v27 = (const void *)__CFURLResourceInfoPtr();
      _FSURLCacheResourcePropertiesForKeys(v21, v26, v27, 0);
    }
LABEL_46:
    v28 = *(_QWORD *)(a1 + 80);
    *(_QWORD *)(*(_QWORD *)(a1 + 72) + 8 * v28) = v21;
    *(_QWORD *)(a1 + 8 * v28 + 168) = *(unsigned int *)(v9 + 44);
    if (*(_DWORD *)(v9 + 48) == 2)
      *(_BYTE *)(a1 + *(_QWORD *)(a1 + 80) + 488) = 1;
    v29 = *v5 + 1;
    *v5 = v29;
    if (v29 == 40)
      goto LABEL_84;
    v10 = 1;
    if ((*(_DWORD *)(v9 + 48) - 1) <= 1 && (*(_BYTE *)(a1 + 32) & 1) != 0)
      goto LABEL_85;
LABEL_79:
    v39 = 0;
    v9 = DirEnumRead(*(_QWORD *)(a1 + 160));
    if (!v9)
      goto LABEL_85;
  }
  HasExtendedAttributes = (void *)DirEnumHasExtendedAttributes(*(_QWORD *)(a1 + 160));
  v20 = _FSURLCreateWithPathAndExtendedAttributes(*(CFAllocatorRef *)(a1 + 16), *(unsigned __int8 **)(v9 + 8), *(_QWORD *)(v9 + 16), *(_QWORD *)(a1 + 544), *(const __CFURL **)(a1 + 536), (attrlist *)(*(_QWORD *)(a1 + 160) + 1796), *(attrlist **)(v9 + 56), HasExtendedAttributes, (*(_BYTE *)(a1 + 32) & 4) != 0, *(_WORD *)(a1 + 123), HIBYTE(*(_WORD *)(a1 + 123)), -1, v40[0], &v39);
  if (!v20)
    goto LABEL_76;
  v21 = v20;
  if ((*(_BYTE *)(a1 + 32) & 2) == 0)
    goto LABEL_32;
  v31 = __CFURLResourceInfoPtr();
  v37 = 0;
  v38 = 0;
  if (!v31 || !_FileCacheGetFlags(v31, (unint64_t *)&v38, &v37, 0, 0) || (v37 & 0x80) == 0)
  {
    propertyValueTypeRefPtr = 0;
    if (CFURLCopyResourcePropertyForKey(v21, v11, &propertyValueTypeRefPtr, 0) && propertyValueTypeRefPtr)
    {
      if (CFBooleanGetValue(propertyValueTypeRefPtr))
      {
        if (*(_DWORD *)(v9 + 48) == 1)
          DirEnumSkipDescendents(*(_QWORD *)(a1 + 160));
        CFRelease(v21);
        v32 = propertyValueTypeRefPtr;
        goto LABEL_75;
      }
      CFRelease(propertyValueTypeRefPtr);
    }
    goto LABEL_32;
  }
  if ((v38 & 0x80) == 0)
  {
LABEL_32:
    if (*(_BYTE *)(a1 + 122))
      _FSURLCacheCheapVolumeInformation(v21, *(_DWORD *)(*(_QWORD *)(a1 + 160) + 1792), (uint64_t)v40[0]);
    v22 = *(const __CFArray **)(a1 + 64);
    if (v22)
    {
      v23 = (const void *)__CFURLResourceInfoPtr();
      _FSURLCacheResourcePropertiesForKeys(v21, v22, v23, 0);
    }
    if ((*(_BYTE *)(a1 + 32) & 8) != 0 && *(_DWORD *)(v9 + 48) == 1)
    {
      v24 = __CFURLResourceInfoPtr();
      v38 = 0;
      if (v24 && _FileCacheGetPropertyValueForKey(v24, v35, (void **)&v38) && v38)
      {
        if (CFBooleanGetValue(v38))
          DirEnumSkipDescendents(*(_QWORD *)(a1 + 160));
      }
      else if (CFURLCopyResourcePropertyForKey(v21, v35, &v38, 0) && v38)
      {
        if (CFBooleanGetValue(v38))
          DirEnumSkipDescendents(*(_QWORD *)(a1 + 160));
        CFRelease(v38);
      }
    }
    goto LABEL_46;
  }
  if (*(_DWORD *)(v9 + 48) == 1)
    DirEnumSkipDescendents(*(_QWORD *)(a1 + 160));
  v32 = v21;
LABEL_75:
  CFRelease(v32);
LABEL_76:
  v30 = v39;
  if (!v39)
  {
LABEL_77:
    if ((*(_DWORD *)(v9 + 48) - 1) <= 1 && (*(_BYTE *)(a1 + 32) & 1) != 0)
      goto LABEL_84;
    goto LABEL_79;
  }
LABEL_83:
  *(_QWORD *)(a1 + 96) = v30;
  *(_QWORD *)(a1 + 528) = *(unsigned int *)(v9 + 44);
LABEL_84:
  v10 = 1;
LABEL_85:
  MountInfoDestroy(v40[0]);
  return v10;
}

uint64_t _FileCacheGetFlags(uint64_t result, unint64_t *a2, uint64_t *a3, _QWORD *a4, uint64_t *a5)
{
  uint64_t v9;
  unint64_t v10;
  unint64_t v11;
  uint64_t v12;
  int v13;
  uint64_t v14;
  unint64_t v15;
  uint64_t v16;
  __int16 v17;
  uint64_t v18;
  char v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  const __CFData *v23;
  uint64_t v24;
  uint64_t v25;
  int v26;

  if (!result)
    return result;
  v9 = result;
  _FileCacheLock(result);
  if (a2 && a3)
  {
    v10 = *(unsigned int *)(v9 + 48);
    if ((v10 & 1) == 0)
    {
      v11 = 0;
      v12 = 0;
LABEL_31:
      *a3 = v12;
      *a2 = v11;
      goto LABEL_32;
    }
    v13 = *(_DWORD *)(v9 + 64) & 0xF000;
    if (v13 == 0x4000)
    {
      v14 = 2;
    }
    else if (v13 == 40960)
    {
      v14 = 4;
    }
    else
    {
      v14 = v13 == 0x8000;
    }
    v15 = *(unsigned int *)(v9 + 68);
    v16 = v14 | (v10 >> 10) & 8 | (v15 >> 12) & 0x20;
    v17 = 32 * v15;
    v18 = v16 | (32 * (_WORD)v15) & 0x40;
    if (*(_DWORD *)(v9 + 48) & 0x800 | *(_DWORD *)(v9 + 68) & 0x8000)
    {
      v18 |= 0x80uLL;
      if ((v10 & 0x10) == 0)
      {
        v19 = 1;
LABEL_19:
        v20 = 239;
        goto LABEL_23;
      }
    }
    else
    {
      if ((v10 & 0x10) == 0)
      {
        v19 = 1;
        v20 = 111;
LABEL_23:
        v21 = v18 | v17 & 0x400;
        v22 = v20 | 0x7400;
        if ((v10 & 8) != 0)
          v21 |= (v10 >> 13) & 0x1000 | (v10 >> 11) & 0x2000 | (v10 >> 9) & 0x4000;
        else
          v22 = v20 | 0x400;
        if ((v21 & 4) != 0)
        {
          v22 |= 0x8000uLL;
          v21 |= 0x8000uLL;
        }
        else if ((v21 & 1) != 0)
        {
          if ((v19 & 1) == 0)
          {
            v22 |= 0x8000uLL;
            if (*(__int16 *)(v9 + 216) < 0)
              v21 |= 0x8000uLL;
          }
        }
        else
        {
          v22 |= 0x8000uLL;
        }
        v12 = v22 | 0x10000;
        v11 = v21 & 0xFFFFFFFFFFFEFFFFLL | (((v10 >> 14) & 1) << 16);
        goto LABEL_31;
      }
      v18 |= ((unint64_t)*(unsigned __int16 *)(v9 + 216) >> 7) & 0x80;
    }
    if ((*(_WORD *)(v9 + 216) & 0x10) != 0)
    {
      v19 = 0;
      v18 |= 0x100uLL;
      v20 = 495;
      goto LABEL_23;
    }
    v19 = 0;
    if ((v10 & 0x8000000) != 0)
    {
      v20 = 495;
      if (*(_WORD *)(v9 + 52) == 3)
        v20 = 239;
      goto LABEL_23;
    }
    goto LABEL_19;
  }
LABEL_32:
  if (a4 && a5)
  {
    v23 = *(const __CFData **)(v9 + 312);
    if (v23)
    {
      v24 = *((_QWORD *)CFDataGetBytePtr(v23) + 4);
      v25 = -1;
    }
    else
    {
      v24 = 0;
      v25 = 0;
    }
    *a4 = v24;
    *a5 = v25;
  }
  v26 = *(_DWORD *)(v9 + 32) - 1;
  *(_DWORD *)(v9 + 32) = v26;
  if (!v26)
  {
    *(_QWORD *)(v9 + 24) = 0;
    os_unfair_lock_unlock((os_unfair_lock_t)(v9 + 36));
  }
  return 1;
}

uint64_t DirEnumRead(uint64_t a1)
{
  uint64_t i;
  int v3;
  uint64_t v4;
  _BYTE *v5;
  _BYTE *v6;
  int v7;
  size_t v8;
  uint64_t v9;
  uint64_t v10;
  int v11;
  void *v12;
  int v13;
  int v14;
  int v16;
  stat v17;

  for (i = *(_QWORD *)(a1 + 1840); ; i = 0)
  {
    if (!i || *(_BYTE *)(a1 + 1833))
    {
      i = 0;
      *(_BYTE *)(a1 + 1833) = 1;
      goto LABEL_43;
    }
    v16 = 0;
    v3 = *(_DWORD *)(i + 48);
    if (v3 == 1)
      break;
    if (!v3)
    {
      v4 = *(_QWORD *)i;
LABEL_7:
      DirEnumEntryFree(a1, i);
      goto LABEL_31;
    }
    v10 = *(_QWORD *)i;
    if (*(_QWORD *)i)
    {
      *(_QWORD *)&v17.st_dev = 0;
      v11 = NextEntryFromParent(a1, v10, &v17, &v16);
      if (v11 == 2)
      {
        v4 = *(_QWORD *)i;
      }
      else
      {
        if (v11 == 1)
        {
          v4 = *(_QWORD *)&v17.st_dev;
          goto LABEL_7;
        }
        v4 = *(_QWORD *)i;
        *(_DWORD *)(v4 + 40) = v16;
        *(_DWORD *)(v4 + 48) = 6;
      }
      DirEnumEntryFree(a1, i);
      *(_BYTE *)(a1 + *(_QWORD *)(v4 + 16)) = 0;
      goto LABEL_31;
    }
    DirEnumEntryFree(a1, i);
LABEL_21:
    *(_QWORD *)(a1 + 1840) = 0;
LABEL_32:
    v4 = 0;
    if (*(_BYTE *)(a1 + 1833))
      return v4;
  }
  *(_DWORD *)(i + 48) = 2;
  if ((*(_BYTE *)(i + 52) & 2) != 0 || *(_DWORD *)(i + 64) != *(_DWORD *)(a1 + 1792))
    goto LABEL_43;
  *(_BYTE *)(a1 + *(_QWORD *)(i + 16)) = 0;
  v5 = malloc_type_malloc(0x30uLL, 0x10A004010CD0317uLL);
  if (!v5)
  {
    v14 = *__error();
    goto LABEL_40;
  }
  v6 = v5;
  v7 = open((const char *)a1, 17825792);
  *(_DWORD *)v6 = v7;
  if ((v7 & 0x80000000) == 0)
  {
    memset(&v17, 0, sizeof(v17));
    if (!fstat(v7, &v17))
    {
      if (v17.st_dev != *(_DWORD *)(a1 + 1792))
      {
        v14 = 18;
        goto LABEL_38;
      }
      v6[4] = 0;
      *((_QWORD *)v6 + 1) = a1;
      v8 = 20 * *(_QWORD *)(a1 + 1824);
      *((_QWORD *)v6 + 2) = v8;
      v9 = *(_QWORD *)(a1 + 1856);
      if (v9)
      {
        *(_QWORD *)(a1 + 1856) = 0;
        *((_QWORD *)v6 + 3) = v9;
LABEL_23:
        *((_QWORD *)v6 + 4) = 0;
        *((_QWORD *)v6 + 5) = 0;
        *(_QWORD *)(i + 72) = v6;
        *(_QWORD *)&v17.st_dev = 0;
        v13 = NextEntryFromParent(a1, i, &v17, &v16);
        if (v13 != 2)
        {
          if (v13 == 1)
          {
            v4 = *(_QWORD *)&v17.st_dev;
            goto LABEL_31;
          }
          *(_DWORD *)(i + 40) = v16;
          *(_DWORD *)(i + 48) = 6;
        }
        *(_BYTE *)(a1 + *(_QWORD *)(i + 16)) = 0;
        v4 = i;
LABEL_31:
        *(_QWORD *)(a1 + 1840) = v4;
        if (v4)
          return v4;
        goto LABEL_32;
      }
      v12 = malloc_type_malloc(v8, 0x8C0FF819uLL);
      *((_QWORD *)v6 + 3) = v12;
      if (v12)
        goto LABEL_23;
    }
    v14 = *__error();
LABEL_38:
    v16 = v14;
    close(*(_DWORD *)v6);
    goto LABEL_39;
  }
  v14 = *__error();
  v16 = v14;
LABEL_39:
  free(v6);
LABEL_40:
  *(_QWORD *)(i + 72) = 0;
  *(_DWORD *)(i + 40) = v14;
  if (v14 == 12)
  {
    DirEnumEntryFree(a1, i);
    *(_BYTE *)(a1 + 1833) = 1;
    goto LABEL_21;
  }
  if (v14 == 18)
    *(_DWORD *)(i + 40) = 0;
  else
    *(_DWORD *)(i + 48) = 6;
LABEL_43:
  *(_QWORD *)(a1 + 1840) = i;
  return i;
}

void DirEnumEntryFree(uint64_t a1, uint64_t a2)
{
  void *v4;
  int *v5;
  int v6;
  uint64_t v7;
  void *v8;

  if ((*(_BYTE *)(a2 + 52) & 1) != 0)
  {
    v4 = *(void **)(a2 + 56);
    if (v4)
      free(v4);
  }
  v5 = *(int **)(a2 + 72);
  if (v5)
  {
    v6 = *v5;
    v7 = *((_QWORD *)v5 + 1);
    v8 = (void *)*((_QWORD *)v5 + 3);
    if (*(_QWORD *)(v7 + 1856))
      free(v8);
    else
      *(_QWORD *)(v7 + 1856) = v8;
    free(v5);
    close(v6);
    *(_QWORD *)(a2 + 72) = 0;
  }
  *(_QWORD *)a2 = *(_QWORD *)(a1 + 1848);
  *(_QWORD *)(a1 + 1848) = a2;
}

uint64_t NextEntryFromParent(uint64_t a1, uint64_t a2, _QWORD *a3, int *a4)
{
  _OWORD *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  int v12;
  int v13;
  int v14;
  int v15;
  _DWORD *v16;
  _DWORD **v17;
  _QWORD *v18;
  int v19;
  uint64_t v20;
  _DWORD *v21;
  int v22;
  uint64_t v23;
  unint64_t v24;
  int v26;
  int v27;
  unsigned __int8 v28;
  __int16 v29;
  uint64_t v30;

  *a3 = 0;
  *a4 = 0;
  v8 = DirEnumEntryAllocate(a1);
  *a3 = v8;
  if (!v8)
  {
    *a4 = *__error();
    return 3;
  }
  v9 = (uint64_t)v8;
  v10 = *(_QWORD *)(a2 + 72);
  if (*(_BYTE *)(v10 + 4))
    goto LABEL_3;
  v12 = *(_DWORD *)(v10 + 40);
  v13 = *(_DWORD *)(v10 + 44);
  if (v13 >= v12)
  {
    *(_DWORD *)(v10 + 44) = 0;
  }
  else if (v13)
  {
    v11 = 0;
    if (!v12)
      goto LABEL_7;
LABEL_16:
    v16 = *(_DWORD **)(v10 + 32);
    *(_QWORD *)(v10 + 32) = (char *)v16 + *v16;
    ++*(_DWORD *)(v10 + 44);
    *a4 = 0;
    *(_QWORD *)(v9 + 56) = v16;
    v17 = (_DWORD **)(v9 + 56);
    v30 = 0;
    v29 = 0;
    v28 = 0;
    v18 = (_QWORD *)(v9 + 32);
    if ((ParseAttributes(v16, (_DWORD *)&v30 + 1, (_QWORD *)(v9 + 24), (_QWORD *)(v9 + 32), (_DWORD *)(v9 + 64), &v30, (_BYTE *)&v29 + 1, &v29, &v28) & 1) == 0)
    {
      *(_DWORD *)(v9 + 48) = 5;
      v26 = HIDWORD(v30);
      goto LABEL_45;
    }
    v19 = HIDWORD(v30);
    if (HIDWORD(v30))
    {
      *(_DWORD *)(v9 + 48) = 5;
      *(_DWORD *)(v9 + 40) = v19;
      *(_BYTE *)(v9 + 52) &= ~1u;
      goto LABEL_34;
    }
    if (!(HIBYTE(v29) | v28))
    {
      *(_BYTE *)(v9 + 52) &= ~1u;
LABEL_28:
      *(_DWORD *)(v9 + 40) = 0;
      if ((_DWORD)v30 == 2)
      {
        v22 = 1;
      }
      else if ((_DWORD)v30 == 1)
      {
        v22 = 3;
      }
      else
      {
        v22 = 4;
      }
      *(_DWORD *)(v9 + 48) = v22;
LABEL_34:
      *(_QWORD *)v9 = a2;
      *(_QWORD *)(v9 + 8) = a1;
      v23 = *(_QWORD *)(a2 + 16);
      if (*(_BYTE *)(v23 + a1 - 1) != 47)
      {
        if ((unint64_t)(v23 + 1) >= 0x6FD)
        {
LABEL_43:
          *(_DWORD *)(v9 + 48) = 5;
          v26 = 63;
LABEL_45:
          *(_DWORD *)(v9 + 40) = v26;
          return 1;
        }
        *(_BYTE *)(a1 + v23++) = 47;
      }
      *(_BYTE *)(a1 + v23) = 0;
      if ((unint64_t)(*v18 + v23) < 0x6FD)
      {
        memcpy((void *)(a1 + v23), *(const void **)(v9 + 24), *v18 + 1);
        *(_DWORD *)(v9 + 44) = *(_DWORD *)(a2 + 44) + 1;
        v24 = *(_QWORD *)(v9 + 32) + v23;
        *(_QWORD *)(v9 + 16) = v24;
        if (v24 < 0x400)
        {
          *(_BYTE *)(v9 + 52) = *(_BYTE *)(v9 + 52) & 0xFD | (2 * ((v29 | HIBYTE(v29)) != 0));
          *(_QWORD *)(v9 + 72) = 0;
          return 1;
        }
      }
      goto LABEL_43;
    }
    v20 = *(_QWORD *)(a2 + 16);
    if (*(_BYTE *)(v20 + a1 - 1) != 47)
    {
      if ((unint64_t)(v20 + 1) >= 0x6FD)
        goto LABEL_46;
      *(_BYTE *)(a1 + v20++) = 47;
    }
    *(_BYTE *)(a1 + v20) = 0;
    if ((unint64_t)(*v18 + v20) < 0x6FD)
    {
      memcpy((void *)(a1 + v20), *(const void **)(v9 + 24), *v18 + 1);
      v21 = malloc_type_malloc(*(_QWORD *)(a1 + 1824), 0x50535794uLL);
      *v17 = v21;
      if (v21)
      {
        *(_BYTE *)(v9 + 52) |= 1u;
        if (GetattrlistRetry((char *)a1, (_DWORD *)(a1 + 1796), (void **)(v9 + 56), *(_QWORD *)(a1 + 1824)))
        {
          *(_DWORD *)(v9 + 48) = 5;
          v27 = *__error();
        }
        else
        {
          if ((ParseAttributes(*v17, (_DWORD *)&v30 + 1, (_QWORD *)(v9 + 24), (_QWORD *)(v9 + 32), (_DWORD *)(v9 + 64), &v30, (_BYTE *)&v29 + 1, &v29, &v28) & 1) != 0)goto LABEL_28;
          *(_DWORD *)(v9 + 48) = 5;
          v27 = HIDWORD(v30);
        }
      }
      else
      {
        *(_DWORD *)(v9 + 48) = 5;
        v27 = 12;
      }
LABEL_50:
      *(_DWORD *)(v9 + 40) = v27;
      goto LABEL_34;
    }
LABEL_46:
    *(_DWORD *)(v9 + 48) = 5;
    v27 = 63;
    goto LABEL_50;
  }
  v14 = getattrlistbulk(*(_DWORD *)v10, (void *)(*(_QWORD *)(v10 + 8) + 1796), *(void **)(v10 + 24), *(_QWORD *)(v10 + 16), 0x20uLL);
  if (v14 < 1)
  {
    *(_DWORD *)(v10 + 40) = 0;
    *(_BYTE *)(v10 + 4) = 1;
    if (v14)
    {
      v15 = *__error();
      v11 = 3;
    }
    else
    {
      v15 = 0;
      v11 = 2;
    }
  }
  else
  {
    v15 = 0;
    v11 = 0;
    *(_DWORD *)(v10 + 40) = v14;
    *(_QWORD *)(v10 + 32) = *(_QWORD *)(v10 + 24);
  }
  *a4 = v15;
  if (*(_DWORD *)(v10 + 40))
    goto LABEL_16;
LABEL_7:
  if ((_DWORD)v11 != 2)
  {
    DirEnumEntryFree(a1, v9);
    *a3 = 0;
    return v11;
  }
LABEL_3:
  DirEnumEntryFree(a1, v9);
  *a3 = 0;
  return 2;
}

_OWORD *DirEnumEntryAllocate(uint64_t a1)
{
  _OWORD *result;

  result = *(_OWORD **)(a1 + 1848);
  if (!result)
    return malloc_type_calloc(1uLL, 0x50uLL, 0x10F004033F4FF7FuLL);
  *(_QWORD *)(a1 + 1848) = *(_QWORD *)result;
  result[2] = 0u;
  result[3] = 0u;
  result[4] = 0u;
  *result = 0u;
  result[1] = 0u;
  return result;
}

uint64_t ParseAttributes(_DWORD *a1, _DWORD *a2, _QWORD *a3, _QWORD *a4, _DWORD *a5, _DWORD *a6, _BYTE *a7, _BYTE *a8, _BYTE *a9)
{
  unint64_t v9;
  int v10;
  int v11;
  uint64_t v12;
  int *v13;
  int v14;
  int v15;
  int *v16;
  int v17;
  _DWORD *v18;
  uint64_t v19;
  int v20;
  int v21;

  *a5 = 0;
  *a6 = 0;
  *a7 = 0;
  *a8 = 0;
  *a9 = 0;
  v9 = a1[1];
  if ((v9 & 1) != 0)
  {
    if ((v9 & 0x20000000) != 0)
    {
      *a2 = a1[6];
      v19 = (int)a1[7];
      v18 = a1 + 7;
      *a3 = (char *)v18 + v19;
      *a4 = (v18[1] - 1);
    }
    else
    {
      v10 = a1[3];
      *a2 = 0;
      v11 = a1[7];
      *a3 = (char *)a1 + a1[6] + 24;
      *a4 = (v11 - 1);
      v12 = 9;
      if ((v9 & 2) == 0)
        v12 = 8;
      v13 = &a1[v12];
      if ((v9 & 4) != 0)
      {
        v14 = *v13;
        v13 += 2;
        *a5 = v14;
      }
      if ((v9 & 8) != 0)
      {
        v15 = *v13++;
        *a6 = v15;
      }
      v16 = (int *)((char *)v13
                  + ((v9 >> 2) & 4)
                  + ((v9 >> 2) & 8)
                  + ((v9 >> 3) & 8)
                  + ((v9 >> 4) & 8)
                  + ((v9 >> 6) & 4)
                  + ((v9 >> 5) & 0x10)
                  + ((v9 >> 6) & 0x10)
                  + ((v9 >> 7) & 0x10)
                  + ((v9 >> 8) & 0x10)
                  + ((v9 >> 9) & 0x30)
                  + ((v9 >> 13) & 4)
                  + ((v9 >> 14) & 4)
                  + ((v9 >> 15) & 4));
      if ((v9 & 0x40000) != 0)
      {
        v20 = *v16++;
        v17 = v20 & 0x800000;
      }
      else
      {
        v17 = 0;
      }
      if (*a6 == 2)
      {
        if (v17)
          *a9 = 1;
        if ((v10 & 4) != 0)
        {
          v21 = *(int *)((char *)&v16[v10 & 1]
                       + ((v9 >> 22) & 8)
                       + ((v9 >> 17) & 4)
                       + (unint64_t)((v9 >> 18) & 4)
                       + ((v9 >> 19) & 4)
                       + ((v9 >> 19) & 8)
                       + ((v9 >> 19) & 0x10)
                       + ((v9 >> 20) & 0x10)
                       + ((v9 >> 23) & 8)
                       + (BYTE3(v9) & 0x18)
                       + ((v9 >> 28) & 4)
                       + ((2 * v10) & 4));
          if ((v21 & 1) != 0)
            *a7 = 1;
          if ((v21 & 2) != 0)
            *a8 = 1;
        }
      }
    }
  }
  else
  {
    *a2 = 22;
  }
  return v9 & 1;
}

CFURLRef __FSURLCreateWithPathAndAttributes(CFAllocatorRef allocator, unsigned __int8 *a2, size_t __n, uint64_t a4, const __CFURL *a5, attrlist *a6, attrlist *a7, void *a8, unsigned __int8 a9, unsigned __int8 a10, unsigned __int8 a11, int a12, void **a13, __CFError **a14)
{
  const __CFAllocator *v20;
  void **v21;
  BOOL v22;
  const __CFAllocator *v24;
  const void *BaseCacheWithPathAndAttributes;
  const void *v26;
  uint64_t Attributes;
  uint64_t v28;
  int v29;
  uint64_t v30;
  uint64_t v31;
  Boolean v32;
  const __CFAllocator *v33;
  uint64_t v34;
  const __CFString *v35;
  CFURLRef FileReferenceURLRef;
  CFURLRef v37;
  _BOOL8 v38;
  int v39;
  CFStringRef v40;
  CFStringRef v41;
  const void *v42;
  ssize_t v43;
  CFIndex v44;
  Boolean v45;
  uint64_t v46;
  CFIndex v47;
  CFErrorRef *v48;
  const __CFString *v49;
  __CFError **v51;
  CFAllocatorRef v52;
  void **v53;
  const unsigned __int8 *v54;
  uint64_t v55;
  char v56[1024];
  uint64_t v57;

  v20 = allocator;
  v21 = (void **)a14;
  LODWORD(v55) = a11;
  HIDWORD(v55) = a10;
  v57 = *MEMORY[0x1E0C80C00];
  if (initGlobalsOnce(void)::onceToken != -1)
  {
    v54 = a2;
    v52 = allocator;
    dispatch_once(&initGlobalsOnce(void)::onceToken, &__block_literal_global_3);
    v21 = (void **)a14;
    a2 = (unsigned __int8 *)v54;
    v20 = v52;
  }
  if (a9)
    v22 = 0;
  else
    v22 = a7 == 0;
  if (v22 && a12 != -1)
    JUMPOUT(0x186DA3264);
  v53 = v21;
  v24 = v20;
  v54 = a2;
  BaseCacheWithPathAndAttributes = createBaseCacheWithPathAndAttributes(v20, (char *)a2, __n, a9, a6, a7, a8, (uint64_t)a13, v21, v51);
  if (!BaseCacheWithPathAndAttributes)
    return 0;
  v26 = BaseCacheWithPathAndAttributes;
  Attributes = _FileCacheGetAttributes((uint64_t)BaseCacheWithPathAndAttributes);
  v28 = Attributes;
  if (a9 && (*(_DWORD *)Attributes & 4) != 0)
  {
    v29 = *(_DWORD *)(Attributes + 16) & 0xF000;
    if ((*(_DWORD *)Attributes & 0x40000) != 0 && v29 != 0x4000)
    {
      v30 = *(unsigned int *)(Attributes + 112);
      v34 = *(_QWORD *)(Attributes + 136);
      v35 = *(const __CFString **)(Attributes + 8);
      v33 = v24;
      v31 = 0;
      v32 = 0;
    }
    else
    {
      v30 = *(unsigned int *)(Attributes + 112);
      v31 = *(_QWORD *)(Attributes + 128);
      v32 = v29 == 0x4000;
      v33 = v24;
      v34 = 0;
      v35 = 0;
    }
    FileReferenceURLRef = createFileReferenceURLRef(v33, v30, v34, v31, v35, v32);
    v37 = FileReferenceURLRef;
    if (FileReferenceURLRef)
      goto LABEL_21;
  }
  if (v54)
  {
    v38 = objectTypeFromAccessMask(*(_DWORD *)(v28 + 16)) == 2;
    FileReferenceURLRef = (CFURLRef)MEMORY[0x186DA3264](v24, &v54[a4], __n - a4, v38, a5);
    v37 = FileReferenceURLRef;
    if (FileReferenceURLRef)
    {
LABEL_21:
      v39 = v55;
      if (v55)
      {
        MEMORY[0x1E0C80A78](FileReferenceURLRef);
        memcpy((char *)&v52 - ((__n + 16) & 0xFFFFFFFFFFFFFFF0), v54, __n);
        *((_BYTE *)&v52 + __n - ((__n + 16) & 0xFFFFFFFFFFFFFFF0)) = 0;
        v40 = CFStringCreateWithFileSystemRepresentation(v24, (const char *)&v52 - ((__n + 16) & 0xFFFFFFFFFFFFFFF0));
        if (v40)
        {
          v41 = v40;
          if (HIDWORD(v55))
            _FileCacheSetPropertyValueForKey((uint64_t)v26, (const void *)*MEMORY[0x1E0C9B5B0], v40);
          if (v39)
          {
            v42 = *(const void **)(v28 + 232);
            if (v42)
              CFRelease(v42);
            *(_QWORD *)(v28 + 232) = CFRetain(v41);
            *(_DWORD *)v28 |= 0x100u;
          }
          CFRelease(v41);
        }
      }
      __CFURLSetResourceInfoPtr();
      goto LABEL_36;
    }
    syslog(3, "_FSURLCreateWithPathAndAttributes: CFURLCreateFromFileSystemRepresentation failed; pathLen = %ld", __n);
  }
  else
  {
    if ((~*(_DWORD *)v28 & 0x8004) != 0)
    {
      v46 = 0;
      v37 = 0;
      goto LABEL_37;
    }
    v43 = fsgetpath(v56, 0x400uLL, (fsid_t *)(v28 + 104), *(_QWORD *)(v28 + 128));
    v44 = v43;
    if (v43 < 0)
    {
      v37 = 0;
      v46 = (int)v43;
      goto LABEL_37;
    }
    v45 = objectTypeFromAccessMask(*(_DWORD *)(v28 + 16)) == 2;
    FileReferenceURLRef = CFURLCreateFromFileSystemRepresentation(v24, (const UInt8 *)v56, v44, v45);
    v37 = FileReferenceURLRef;
    if (FileReferenceURLRef)
      goto LABEL_21;
  }
LABEL_36:
  v46 = 0;
LABEL_37:
  CFRelease(v26);
  if (v53 && !v37)
  {
    v47 = __n;
    v48 = (CFErrorRef *)v53;
    v49 = (const __CFString *)CFURLCreateFromFileSystemRepresentation(v24, v54, v47, 0);
    *v48 = _FSURLCreateStandardError(v24, (const __CFString *)*MEMORY[0x1E0C9AFD0], v46, 0, v49, 0);
    if (v49)
      CFRelease(v49);
    return 0;
  }
  return v37;
}

const void *createBaseCacheWithPathAndAttributes(CFAllocatorRef allocator, char *__src, size_t __n, int a4, _DWORD *a5, attrlist *a6, const void *a7, uint64_t a8, void **a9, __CFError **a10)
{
  CFIndex v12;
  const void *v13;
  int v14;
  int v16;
  uint64_t Attributes;
  uint64_t v21;
  attrgroup_t commonattr;
  unint64_t v23;
  uint64_t v24;
  _DWORD *v25;
  size_t v26;
  const __CFString *v27;
  attrlist v29;
  char v30[1024];
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v12 = __n;
  if (__n <= 0x3FF)
  {
    v16 = (int)a7;
    strncpy(v30, __src, __n);
    v30[v12] = 0;
    v13 = (const void *)FileCacheCreate(allocator);
    Attributes = _FileCacheGetAttributes((uint64_t)v13);
    if (a6)
    {
      v14 = parseAttributeBuffer(allocator, v30, a5, a6, a8, Attributes, v16);
      if (!v14)
        return v13;
    }
    else
    {
      v29 = *(attrlist *)corePropertyAttrListTable;
      if (a4)
      {
        v21 = Attributes;
        commonattr = v29.commonattr | dword_1ECD2A4B4;
        *(int8x16_t *)&v29.volattr = vorrq_s8(*(int8x16_t *)&v29.volattr, unk_1ECD2A4B8);
      }
      else
      {
        v21 = Attributes;
        commonattr = v29.commonattr;
      }
      v29.commonattr = commonattr | 0x80000000;
      v23 = calculateAttributeBufferSize(&v29, 0);
      MEMORY[0x1E0C80A78](v23);
      v25 = (_DWORD *)((char *)&v29.bitmapcount - v24);
      if (filtered_getattrlist(v30, &v29, (char *)&v29 - v24, v26, 0x25u))
        v14 = *__error();
      else
        v14 = parseAttributeBuffer(allocator, __src, &v29, v25, a8, v21, v16);
      if (!v14)
        return v13;
    }
  }
  else
  {
    v13 = 0;
    v14 = 63;
  }
  if (a9)
  {
    v27 = (const __CFString *)CFURLCreateFromFileSystemRepresentation(allocator, (const UInt8 *)__src, v12, 0);
    *a9 = _FSURLCreateStandardError(allocator, (const __CFString *)*MEMORY[0x1E0C9AFD0], v14, 0, v27, 0);
    if (v27)
      CFRelease(v27);
  }
  if (v13)
  {
    CFRelease(v13);
    return 0;
  }
  return v13;
}

uint64_t FileCacheCreate(const __CFAllocator *a1)
{
  initGlobalsOnce();
  return _CFRuntimeCreateInstance();
}

CFURLRef _FSURLCreateWithPathAndExtendedAttributes(CFAllocatorRef allocator, unsigned __int8 *a2, size_t __n, uint64_t a4, const __CFURL *a5, attrlist *a6, attrlist *a7, void *a8, unsigned __int8 a9, unsigned __int8 a10, unsigned __int8 a11, int a12, void **a13, __CFError **a14)
{
  return __FSURLCreateWithPathAndAttributes(allocator, a2, __n, a4, a5, a6, a7, a8, a9, a10, a11, a12, a13, a14);
}

uint64_t DirEnumHasExtendedAttributes(uint64_t a1)
{
  return *(unsigned __int8 *)(a1 + 1832);
}

uint64_t objectTypeFromAccessMask(__int16 a1)
{
  unsigned int v1;

  v1 = (a1 & 0xF000) - 4096;
  if (v1 >> 14 > 2)
    return 0;
  else
    return dword_1817D52D4[v1 >> 12];
}

uint64_t DirEnumSkipDescendents(uint64_t a1)
{
  uint64_t v1;
  uint64_t result;

  v1 = *(_QWORD *)(a1 + 1840);
  if (*(_DWORD *)(v1 + 48) == 1)
  {
    result = 0;
    *(_BYTE *)(v1 + 52) |= 2u;
  }
  else
  {
    *__error() = 20;
    return 0xFFFFFFFFLL;
  }
  return result;
}

uint64_t _FSURLCacheResourcePropertiesForKeys(const __CFURL *a1, CFArrayRef theArray, const void *a3, CFErrorRef *a4)
{
  uint64_t Count;
  CFTypeRef v9;
  uint64_t v10;
  _OWORD v12[4];

  Count = CFArrayGetCount(theArray);
  if (!Count)
    return 1;
  v9 = _FileCacheGetForURL(a1, a3);
  _FileCacheLock((uint64_t)v9);
  memset(v12, 0, 60);
  getPropertyBitmapForKeys(theArray, Count, (uint64_t)v12);
  _FileCacheLockTransitionToPreparer((uint64_t)v9);
  v10 = prepareValuesForBitmap((uint64_t)a1, (uint64_t)v9, (uint64_t)v12, (uint64_t)a4);
  _FileCacheLockTransitionFromPreparer((uint64_t)v9);
  _FileCacheUnlock((uint64_t)v9);
  if (a4 && !(_DWORD)v10)
  {
    if (*a4)
    {
      return 0;
    }
    else
    {
      if (os_log_type_enabled((os_log_t)defaultLog, OS_LOG_TYPE_ERROR))
        _FSURLCacheResourcePropertiesForKeys_cold_1();
      v10 = 0;
      *a4 = CFErrorCreate((CFAllocatorRef)*MEMORY[0x1E0C9AE00], (CFErrorDomain)*MEMORY[0x1E0C9AFB8], 256, 0);
    }
  }
  return v10;
}

CFDictionaryRef _FSURLCopyResourcePropertiesForKeysInternal(const __CFURL *a1, const __CFArray *a2, CFTypeRef cf, __CFError **a4, int a5)
{
  _QWORD *v7;
  const __CFArray *v8;
  CFIndex Count;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t v21;
  const __CFArray *v22;
  uint64_t v23;
  size_t v24;
  char *v25;
  __int16 v26;
  size_t v27;
  size_t v28;
  uint64_t v29;
  const void **v30;
  int v31;
  CFIndex v32;
  CFIndex v33;
  const void *ValueAtIndex;
  char *v35;
  uint64_t v36;
  const __CFArray *v37;
  uint64_t v38;
  const __CFDictionary *TemporaryPropertyDictionary;
  const void *v40;
  const __CFDictionary *PermanentPropertyDictionary;
  const void *v42;
  uint64_t *v43;
  _QWORD *v44;
  uint64_t v45;
  CFTypeRef *v46;
  uint64_t v47;
  char *v48;
  uint64_t *v49;
  int v50;
  uint64_t v51;
  _QWORD *v52;
  uint64_t v53;
  uint64_t (*v54)(CFTypeRef, _QWORD *, char *, CFTypeRef *, uint64_t, uint64_t, uint64_t);
  int v55;
  BOOL v56;
  uint64_t v57;
  uint64_t v58;
  CFTypeRef *v59;
  int v60;
  BOOL v61;
  int v62;
  _QWORD *v63;
  int v64;
  uint64_t v65;
  CFTypeRef *v66;
  char *v67;
  char *v68;
  uint64_t *v69;
  uint64_t v70;
  _QWORD *v71;
  uint64_t v72;
  uint64_t v73;
  int v74;
  int v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  CFTypeRef *v79;
  int v80;
  int v81;
  const __CFArray *v82;
  _QWORD *v83;
  uint64_t *v84;
  uint64_t *v85;
  uint64_t v86;
  uint64_t *v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t *v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t i;
  uint64_t v94;
  const void **v95;
  uint64_t *v96;
  const void *v97;
  const __CFAllocator *v98;
  CFDictionaryRef v99;
  const void *v100;
  uint64_t v102;
  uint64_t v103;
  __CFError **v104;
  uint64_t *v105;
  int v106;
  uint64_t v107;
  uint64_t *v108;
  uint64_t v109;
  uint64_t v110;
  uint64_t (*v111)(CFTypeRef, _QWORD *, char *, CFTypeRef *, uint64_t, uint64_t, uint64_t);
  CFTypeRef v112;
  uint64_t *v113;
  const __CFArray *v114;
  _QWORD *v115;
  uint64_t v116;
  const __CFArray *v117;
  void *value[2];
  __int128 v119;
  _DWORD v120[7];
  uint64_t v121;

  v106 = a5;
  v121 = *MEMORY[0x1E0C80C00];
  v112 = a1;
  v7 = _FileCacheGetForURL(a1, cf);
  if (a2)
    v8 = a2;
  else
    v8 = (const __CFArray *)qword_1ECD2A678;
  v117 = v8;
  Count = CFArrayGetCount(v8);
  v10 = qword_1ECD2A538;
  v11 = MEMORY[0x1E0C80A78](Count);
  v13 = &v102 - 32 * v12;
  v14 = MEMORY[0x1E0C80A78](v11);
  v16 = &v102 - 32 * v15;
  v17 = MEMORY[0x1E0C80A78](v14);
  v19 = &v102 - 32 * v18;
  v20 = MEMORY[0x1E0C80A78](v17);
  v22 = (const __CFArray *)((char *)&v102 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0));
  v23 = MEMORY[0x1E0C80A78](v20);
  v25 = (char *)&v102 - (((int)v24 + 15) & 0xFF0);
  if ((v26 & 0x600) != 0)
    v27 = 512;
  else
    v27 = v24;
  MEMORY[0x1E0C80A78](v23);
  v30 = (const void **)((char *)&v102 - v29);
  if (v10 >= 1)
    bzero(v22, v28);
  bzero(v25, v27);
  bzero(v30, v27);
  LOBYTE(v116) = CFArrayGetCount(v117);
  v116 = v116;
  if (!(_BYTE)v116)
  {
    v33 = 0;
    goto LABEL_87;
  }
  v113 = v19;
  v114 = v22;
  v115 = v7;
  v109 = v10;
  v31 = 0;
  v32 = 0;
  v33 = 0;
  do
  {
    ValueAtIndex = CFArrayGetValueAtIndex(v117, v32);
    v35 = (char *)CFDictionaryGetValue((CFDictionaryRef)qword_1ECD2A668, ValueAtIndex);
    if (v35)
    {
      v36 = **(int **)(v35 + 140);
      v37 = v114;
      v38 = *((_QWORD *)v114 + v36);
      if (v38 <= 95)
      {
        v13[96 * v36 + v38] = *((_QWORD *)v35 + 1);
        v16[96 * v36 + v38] = 0;
        v113[96 * v36 + v38] = *(_QWORD *)v35;
        *((_QWORD *)v37 + v36) = v38 + 1;
      }
      v31 = 1;
    }
    else
    {
      _FileCacheLockTempPermProperties();
      TemporaryPropertyDictionary = _FileCacheGetTemporaryPropertyDictionary(v115, 0);
      if (TemporaryPropertyDictionary)
      {
        value[0] = 0;
        if (CFDictionaryGetValueIfPresent(TemporaryPropertyDictionary, ValueAtIndex, (const void **)value))
        {
          v40 = value[0];
          if (value[0])
          {
            *(_QWORD *)&v25[8 * v33] = ValueAtIndex;
            v30[v33++] = CFRetain(v40);
          }
        }
      }
      PermanentPropertyDictionary = _FileCacheGetPermanentPropertyDictionary(v115, 0);
      if (PermanentPropertyDictionary)
      {
        value[0] = 0;
        if (CFDictionaryGetValueIfPresent(PermanentPropertyDictionary, ValueAtIndex, (const void **)value))
        {
          v42 = value[0];
          if (value[0])
          {
            *(_QWORD *)&v25[8 * v33] = ValueAtIndex;
            v30[v33++] = CFRetain(v42);
          }
        }
      }
      _FileCacheUnlockTempPermProperties();
    }
    ++v32;
  }
  while (v116 != v32);
  v43 = v113;
  if (!v31)
  {
    v10 = v109;
    v22 = v114;
    goto LABEL_87;
  }
  v44 = v115;
  _FileCacheLock((uint64_t)v115);
  if (v109 < 1)
  {
    _FileCacheUnlock((uint64_t)v44);
LABEL_94:
    v98 = CFGetAllocator(v112);
    v99 = CFDictionaryCreate(v98, (const void **)v25, v30, v33, MEMORY[0x1E0C9B390], MEMORY[0x1E0C9B3A0]);
    goto LABEL_95;
  }
  v104 = a4;
  v103 = -768;
  v45 = 768 * v109 - 768;
  v108 = v16;
  v46 = (CFTypeRef *)((char *)v16 + v45);
  v47 = (uint64_t)v43 + v45;
  v105 = v13;
  v48 = (char *)v13 + v45;
  v49 = &sFileProviderGlobals[7 * v109 - 4];
  v50 = 1;
  v107 = v109 - 1;
  v51 = v109 - 1;
  v22 = v114;
  v52 = v115;
  while (1)
  {
    v53 = *((_QWORD *)v22 + v51);
    if (v53 >= 1)
    {
      v54 = (uint64_t (*)(CFTypeRef, _QWORD *, char *, CFTypeRef *, uint64_t, uint64_t, uint64_t))v49[1];
      v110 = *v49;
      v111 = v54;
      _FileCacheIncrementInProvider((uint64_t)v52);
      v55 = v111(v112, v52, v48, v46, v47, v53, v110);
      _FileCacheDecrementInProvider((uint64_t)v52);
      v50 = v55;
      if (!v55)
        break;
    }
    v46 -= 96;
    v47 -= 768;
    v48 -= 768;
    v49 -= 7;
    v56 = v51-- <= 0;
    v22 = v114;
    if (v56)
      goto LABEL_45;
  }
  v57 = v109;
  if (v51 >= v109)
  {
    v50 = 0;
    v22 = v114;
  }
  else
  {
    v22 = v114;
    do
    {
      v58 = *((_QWORD *)v22 + v51);
      v59 = v46;
      if (v58 >= 1)
      {
        do
        {
          if (*v59)
          {
            CFRelease(*v59);
            *v59 = 0;
          }
          ++v59;
          --v58;
        }
        while (v58);
      }
      ++v51;
      v46 += 96;
    }
    while (v51 != v57);
    v50 = 0;
  }
LABEL_45:
  v60 = v106;
  if (v106)
    v61 = v50 == 0;
  else
    v61 = 0;
  v62 = v61;
  a4 = v104;
  v13 = v105;
  v16 = v108;
  v63 = v115;
  LODWORD(v110) = v62;
  if (v61)
  {
    if (_FileCacheLockTransitionToPreparer((uint64_t)v115))
    {
      v50 = 0;
    }
    else
    {
      _FileCacheLock((uint64_t)v63);
      if (v109 < 1)
      {
        v64 = 0;
      }
      else
      {
        v64 = 0;
        v65 = v103 + 768 * v109;
        v66 = (CFTypeRef *)((char *)v16 + v65);
        v67 = (char *)v113 + v65;
        v68 = (char *)v13 + v65;
        v69 = &sFileProviderGlobals[7 * v109 - 4];
        v70 = v107;
        v71 = v115;
        while (1)
        {
          v107 = v70;
          v72 = *((_QWORD *)v22 + v70);
          if (v72 >= 1)
          {
            v73 = *v69;
            v111 = (uint64_t (*)(CFTypeRef, _QWORD *, char *, CFTypeRef *, uint64_t, uint64_t, uint64_t))v69[1];
            _FileCacheIncrementInProvider((uint64_t)v71);
            v74 = v111(v112, v71, v68, v66, (uint64_t)v67, v72, v73);
            v13 = v105;
            v75 = v74;
            _FileCacheDecrementInProvider((uint64_t)v71);
            v64 = v75;
            if (!v75)
              break;
          }
          v70 = v107 - 1;
          v66 -= 96;
          v67 -= 768;
          v68 -= 768;
          v69 -= 7;
          v22 = v114;
          if (v107 <= 0)
            goto LABEL_71;
        }
        v76 = v109;
        v77 = v107;
        if (v107 >= v109)
        {
          v64 = 0;
          v13 = v105;
          v22 = v114;
        }
        else
        {
          v22 = v114;
          do
          {
            v78 = *((_QWORD *)v22 + v77);
            v79 = v66;
            if (v78 >= 1)
            {
              do
              {
                if (*v79)
                {
                  CFRelease(*v79);
                  *v79 = 0;
                }
                ++v79;
                --v78;
              }
              while (v78);
            }
            ++v77;
            v66 += 96;
          }
          while (v77 != v76);
          v64 = 0;
          v13 = v105;
        }
      }
LABEL_71:
      v63 = v115;
      v80 = v64;
      _FileCacheUnlock((uint64_t)v115);
      v50 = v80;
      a4 = v104;
      v16 = v108;
      v60 = v106;
    }
    v62 = v110;
  }
  if (!v60 || v50)
  {
    LODWORD(v107) = v50;
    v10 = v109;
    if (!v62)
      goto LABEL_86;
    goto LABEL_85;
  }
  v119 = 0u;
  memset(v120, 0, sizeof(v120));
  *(_OWORD *)value = 0u;
  getPropertyBitmapForKeys(v117, v116, (uint64_t)value);
  v81 = prepareValuesForBitmap((uint64_t)v112, (uint64_t)v63, (uint64_t)value, (uint64_t)a4);
  v10 = v109;
  LODWORD(v107) = v81;
  if (v81)
  {
    _FileCacheLock((uint64_t)v63);
    if (v10 >= 1)
    {
      v82 = v114;
      v83 = v115;
      v84 = v105;
      v85 = v16;
      v86 = v109;
      v87 = &qword_1ECD2A560;
      do
      {
        v89 = *(_QWORD *)v82;
        v82 = (const __CFArray *)((char *)v82 + 8);
        v88 = v89;
        v90 = v113;
        if (v89 >= 1)
        {
          v116 = *v87;
          v117 = v82;
          v111 = (uint64_t (*)(CFTypeRef, _QWORD *, char *, CFTypeRef *, uint64_t, uint64_t, uint64_t))*(v87 - 3);
          v91 = v88;
          _FileCacheIncrementInProvider((uint64_t)v83);
          v92 = v91;
          v16 = v108;
          ((void (*)(CFTypeRef, _QWORD *, uint64_t *, uint64_t *, uint64_t *, uint64_t, uint64_t (*)(CFTypeRef, _QWORD *, char *, CFTypeRef *, uint64_t, uint64_t, uint64_t)))v116)(v112, v83, v84, v85, v90, v92, v111);
          _FileCacheDecrementInProvider((uint64_t)v83);
          v82 = v117;
        }
        v113 = v90 + 96;
        v85 += 96;
        v84 += 96;
        v87 += 7;
        --v86;
      }
      while (v86);
    }
    v63 = v115;
    _FileCacheUnlock((uint64_t)v115);
    a4 = v104;
    v10 = v109;
    v13 = v105;
    v22 = v114;
  }
  if ((v110 & 1) != 0)
LABEL_85:
    _FileCacheLockTransitionFromPreparer((uint64_t)v63);
LABEL_86:
  _FileCacheUnlock((uint64_t)v63);
  if ((_DWORD)v107)
  {
LABEL_87:
    if (v10 >= 1)
    {
      for (i = 0; i != v10; ++i)
      {
        v94 = *((_QWORD *)v22 + i);
        v95 = (const void **)v16;
        v96 = v13;
        if (v94 >= 1)
        {
          do
          {
            v97 = *v95;
            if (*v95)
            {
              *(_QWORD *)&v25[8 * v33] = *v96;
              v30[v33++] = v97;
            }
            ++v96;
            ++v95;
            --v94;
          }
          while (v94);
        }
        v13 += 96;
        v16 += 96;
      }
    }
    goto LABEL_94;
  }
  v99 = 0;
LABEL_95:
  if (v33 >= 1)
  {
    do
    {
      v100 = *v30++;
      CFRelease(v100);
      --v33;
    }
    while (v33);
  }
  if (a4 && !v99 && !*a4)
  {
    if (os_log_type_enabled((os_log_t)defaultLog, OS_LOG_TYPE_ERROR))
      _FSURLCopyResourcePropertiesForKeysInternal();
    *a4 = CFErrorCreate((CFAllocatorRef)*MEMORY[0x1E0C9AE00], (CFErrorDomain)*MEMORY[0x1E0C9AFB8], 256, 0);
  }
  return v99;
}

uint64_t volumePropertyProviderCopyValues(uint64_t a1, uint64_t a2, const void **a3, void **a4, uint64_t *a5, uint64_t a6)
{
  uint64_t result;
  CFIndex Length;
  const UInt8 *BytePtr;
  uint64_t v15;
  BOOL v16;
  const __CFData *v17;

  if ((*(_BYTE *)_FileCacheGetAttributes(a2) & 2) == 0)
    return 0;
  if (a6 >= 1)
  {
    Length = 0;
    BytePtr = 0;
    do
    {
      v15 = *a5;
      if (!*(_QWORD *)(*a5 + 24))
        goto LABEL_17;
      if (CFEqual(*(CFTypeRef *)(v15 + 8), CFSTR("__kCFURLNoDependsVolumeInformationKey")))
        v16 = 0;
      else
        v16 = BytePtr == 0;
      if (v16)
      {
        result = _FileCacheGetVolumeInfo(a2);
        if (!result)
          return result;
        v17 = (const __CFData *)result;
        BytePtr = CFDataGetBytePtr((CFDataRef)result);
        Length = CFDataGetLength(v17);
      }
      if (CFEqual(*(CFTypeRef *)(v15 + 8), CFSTR("__kCFURLExpensiveVolumeInformationKey"))
        && (!BytePtr || *(_QWORD *)BytePtr == -1))
      {
        return 0;
      }
      if (!(*(unsigned int (**)(uint64_t, uint64_t, const UInt8 *, CFIndex, uint64_t, _QWORD, void **))(v15 + 24))(a1, a2, BytePtr, Length, v15, 0, a4))
      {
LABEL_17:
        result = _FileCacheGetPropertyValueForKey(a2, *a3, a4);
        if (!(_DWORD)result)
          return result;
        if (*a4)
          CFRetain(*a4);
      }
      ++a4;
      ++a3;
      ++a5;
      --a6;
    }
    while (a6);
  }
  return 1;
}

const __CFArray *getPropertyBitmapForKeys(const __CFArray *theArray, uint64_t a2, uint64_t a3)
{
  const __CFArray *v5;
  CFIndex i;
  const void *ValueAtIndex;

  if (a2 >= 1)
  {
    v5 = theArray;
    for (i = 0; i != a2; ++i)
    {
      ValueAtIndex = CFArrayGetValueAtIndex(v5, i);
      theArray = (const __CFArray *)CFDictionaryGetValue((CFDictionaryRef)qword_1ECD2A668, ValueAtIndex);
      if (theArray)
        theArray = (const __CFArray *)addPropertyAndDependenciesToBitmap((uint64_t)theArray, a3);
    }
  }
  return theArray;
}

uint64_t createVolumeFlagValue(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, _QWORD *a7)
{
  _QWORD *v7;

  if ((*(_QWORD *)(a5 + 16) & *(_QWORD *)(a3 + 32)) != 0)
    v7 = (_QWORD *)MEMORY[0x1E0C9AE50];
  else
    v7 = (_QWORD *)MEMORY[0x1E0C9AE40];
  *a7 = *v7;
  return 1;
}

uint64_t pathURLPropertyProviderCopyAndCacheValues(const __CFURL *a1, uint64_t a2, CFTypeRef *a3, void **a4, uint64_t a5, uint64_t a6)
{
  uint64_t v6;
  const void *v11;
  const void *v12;
  const void *v13;
  const void *v14;
  CFTypeRef v15;
  uint64_t result;
  uint64_t Attributes;
  uint64_t v18;
  void *v19;
  void *v20;
  CFTypeRef v21;
  CFTypeRef cf2;

  if (a6 < 1)
    return 1;
  v6 = a6;
  v11 = (const void *)*MEMORY[0x1E0C9B7E8];
  v12 = (const void *)*MEMORY[0x1E0C9B5B0];
  v13 = (const void *)*MEMORY[0x1E0C9B5A8];
  v14 = (const void *)*MEMORY[0x1E0C9B4E8];
  cf2 = (CFTypeRef)*MEMORY[0x1E0C9AC90];
  v21 = (CFTypeRef)*MEMORY[0x1E0C9AC98];
  while (1)
  {
    v15 = *a3;
    if (CFEqual(*a3, v11))
      break;
    if (CFEqual(v15, v12))
    {
      result = _FileCacheGetPropertyValueForKey(a2, v15, a4);
      if (!(_DWORD)result)
        return result;
      if (!*a4)
        goto LABEL_24;
      Attributes = _FileCacheGetAttributes(a2);
      if ((*(_BYTE *)(Attributes + 1) & 1) != 0)
      {
        v18 = Attributes;
        v19 = *(void **)(Attributes + 232);
        if (v19)
        {
          if (v19 != *a4)
          {
            if (CFEqual(v19, *a4))
            {
              _FileCacheSetPropertyValueForKey(a2, v12, *(const void **)(v18 + 232));
              *a4 = *(void **)(v18 + 232);
            }
          }
        }
      }
      v20 = *a4;
LABEL_23:
      CFRetain(v20);
      goto LABEL_24;
    }
    if (!CFEqual(v15, v13) && !CFEqual(v15, v14) && !CFEqual(v15, cf2))
    {
      result = CFEqual(v15, v21);
      if (!(_DWORD)result)
        return result;
    }
    result = _FileCacheGetPropertyValueForKey(a2, v15, a4);
    if (!(_DWORD)result)
      return result;
LABEL_22:
    v20 = *a4;
    if (*a4)
      goto LABEL_23;
LABEL_24:
    ++a4;
    ++a3;
    if (!--v6)
      return 1;
  }
  if (_FileCacheGetPropertyValueForKey(a2, v11, a4))
    goto LABEL_22;
  if ((*(_BYTE *)(_FileCacheGetAttributes(a2) + 1) & 0x20) != 0)
  {
    result = CFURLHasDirectoryPath(a1);
    if (!(_DWORD)result)
      return result;
    *a4 = (void *)CFRetain(a1);
    goto LABEL_24;
  }
  return 0;
}

uint64_t volumePropertyProviderCopyAndCacheValues(uint64_t a1, uint64_t a2, const void **a3, CFTypeRef *a4, uint64_t *a5, uint64_t a6)
{
  uint64_t v6;
  const UInt8 *BytePtr;
  unsigned __int8 v12;
  uint64_t v13;
  BOOL v14;
  const __CFData *VolumeInfo;
  const __CFData *v16;
  CFIndex Length;

  if (a6 >= 1)
  {
    v6 = a6;
    Length = 0;
    BytePtr = 0;
    v12 = 0;
    while (1)
    {
      if (_FileCacheGetPropertyValueForKey(a2, *a3, (void **)a4))
      {
        if (*a4)
          CFRetain(*a4);
        v12 = 1;
      }
      else
      {
        v13 = *a5;
        if (*(_QWORD *)(*a5 + 24))
        {
          if (CFEqual(*(CFTypeRef *)(v13 + 8), CFSTR("__kCFURLNoDependsVolumeInformationKey")))
            v14 = 0;
          else
            v14 = BytePtr == 0;
          if (!v14)
            goto LABEL_15;
          VolumeInfo = (const __CFData *)_FileCacheGetVolumeInfo(a2);
          if (VolumeInfo)
          {
            v16 = VolumeInfo;
            BytePtr = CFDataGetBytePtr(VolumeInfo);
            Length = CFDataGetLength(v16);
LABEL_15:
            v12 = 1;
            if ((*(unsigned int (**)(uint64_t, uint64_t, const UInt8 *, CFIndex, uint64_t, uint64_t, CFTypeRef *))(v13 + 24))(a1, a2, BytePtr, Length, v13, 1, a4) == 2)_FileCacheSetPropertyValueForKey(a2, *a3, *a4);
            goto LABEL_17;
          }
          BytePtr = 0;
          *a4 = 0;
        }
      }
LABEL_17:
      ++a5;
      ++a4;
      ++a3;
      if (!--v6)
        return v12;
    }
  }
  return 0;
}

uint64_t pathURLPropertyProviderCopyValues(const __CFURL *a1, uint64_t a2, CFTypeRef *a3, void **a4, uint64_t a5, uint64_t a6)
{
  uint64_t v6;
  const void *v11;
  const void *v12;
  const void *v13;
  CFTypeRef v14;
  uint64_t result;
  CFTypeRef v16;
  CFTypeRef v17;
  CFTypeRef cf2;

  if (a6 < 1)
    return 1;
  v6 = a6;
  v11 = (const void *)*MEMORY[0x1E0C9B7E8];
  v12 = (const void *)*MEMORY[0x1E0C9B5A8];
  v13 = (const void *)*MEMORY[0x1E0C9B5B0];
  v17 = (CFTypeRef)*MEMORY[0x1E0C9AC90];
  cf2 = (CFTypeRef)*MEMORY[0x1E0C9B4E8];
  v16 = (CFTypeRef)*MEMORY[0x1E0C9AC98];
  while (1)
  {
    v14 = *a3;
    if (!CFEqual(*a3, v11))
    {
      if (!CFEqual(v14, v12) && !CFEqual(v14, v13) && !CFEqual(v14, cf2) && !CFEqual(v14, v17))
      {
        result = CFEqual(v14, v16);
        if (!(_DWORD)result)
          return result;
      }
      result = _FileCacheGetPropertyValueForKey(a2, v14, a4);
      if (!(_DWORD)result)
        return result;
      goto LABEL_14;
    }
    if (!_FileCacheGetPropertyValueForKey(a2, v11, a4))
      break;
LABEL_14:
    if (*a4)
      CFRetain(*a4);
LABEL_16:
    ++a4;
    ++a3;
    if (!--v6)
      return 1;
  }
  if ((~*(_DWORD *)_FileCacheGetAttributes(a2) & 0x2001) == 0)
  {
    result = CFURLHasDirectoryPath(a1);
    if (!(_DWORD)result)
      return result;
    *a4 = (void *)CFRetain(a1);
    goto LABEL_16;
  }
  return 0;
}

uint64_t pathURLPropertyProviderPrepareValues(const __CFURL *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, CFErrorRef *a7)
{
  uint64_t v12;
  uint64_t v13;
  int v14;
  const void *v15;
  const void *v16;
  const void *v17;
  uint64_t Attributes;
  __CFAllocator *v19;
  uint64_t v20;
  int v21;
  const void *v22;
  uint64_t v23;
  const __CFAllocator *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  CFURLRef FileReferenceURLRef;
  uint64_t v29;
  const __CFURL *v30;
  const __CFAllocator *v31;
  CFURLRef v32;
  uint64_t v33;
  CFAllocatorRef v34;
  size_t v35;
  const __CFURL *v36;
  uint64_t v37;
  CFErrorRef *v38;
  CFAllocatorRef v39;
  uint64_t v40;
  const __CFAllocator *v41;
  const __CFString *v42;
  CFStringRef v43;
  ssize_t v44;
  const void *v45;
  const __CFAllocator *v46;
  char *v47;
  size_t v48;
  unsigned __int8 *v49;
  char *v50;
  char *v51;
  int v52;
  int v53;
  char *v54;
  char *v55;
  const void *v56;
  const void *v57;
  const char *v58;
  size_t v59;
  const __CFAllocator *v60;
  size_t v61;
  CFURLRef v62;
  CFURLRef v63;
  const __CFAllocator *v64;
  const __CFAllocator *v65;
  const __CFAllocator *v67;
  unsigned int v68;
  int v69[2];
  CFTypeRef v70;
  const void *v71;
  const __CFString *v72;
  CFTypeRef v73;
  const void *v74;
  CFErrorRef *v75;
  int v76;
  CFTypeRef v77;
  const void *v78;
  uint64_t v79;
  CFTypeRef cf2;
  __int128 v81;
  uint64_t v82;
  CFURLRef v83;
  void *v84;
  CFTypeRef cf;
  unsigned int v86;
  UInt8 __s[1024];
  UInt8 buffer[1024];
  uint64_t v89;

  v89 = *MEMORY[0x1E0C80C00];
  _FileCacheLock(a2);
  if (a5 < 1)
  {
    v27 = 1;
    goto LABEL_127;
  }
  v75 = a7;
  v12 = 0;
  v76 = 0;
  v13 = 0;
  v14 = 0;
  v15 = (const void *)*MEMORY[0x1E0C9B7E8];
  v16 = (const void *)*MEMORY[0x1E0C9B5A8];
  *(_QWORD *)v69 = *MEMORY[0x1E0C9AFD0];
  v72 = (const __CFString *)*MEMORY[0x1E0C9AFB8];
  cf2 = (CFTypeRef)*MEMORY[0x1E0C9B5B0];
  v77 = (CFTypeRef)*MEMORY[0x1E0C9B4E8];
  v74 = (const void *)*MEMORY[0x1E0C9AE50];
  v71 = (const void *)*MEMORY[0x1E0C9AE40];
  v73 = (CFTypeRef)*MEMORY[0x1E0C9AC90];
  v70 = (CFTypeRef)*MEMORY[0x1E0C9AC98];
  v78 = (const void *)*MEMORY[0x1E0C9B5A8];
  v79 = a5;
  while (1)
  {
    v17 = *(const void **)(a3 + 8 * v12);
    if (CFEqual(v17, v15))
    {
      Attributes = _FileCacheGetAttributes(a2);
      if ((*(_BYTE *)(Attributes + 1) & 0x20) == 0 || !CFURLHasDirectoryPath(a1))
      {
        cf = 0;
        if (!_FileCacheGetPropertyValueForKey(a2, v15, (void **)&cf))
        {
          if (!v14)
            v13 = CFURLIsFileReferenceURL(a1);
          v19 = CFGetAllocator(a1);
          if (!createVolumeURL(v19, v13, (fsid *)Attributes, (CFURLRef *)&cf))
            goto LABEL_124;
          _FileCacheSetPropertyValueForKey(a2, v15, cf);
          if (cf)
            CFRelease(cf);
          v14 = 1;
        }
      }
      goto LABEL_54;
    }
    if (!CFEqual(v17, v16))
      break;
    v84 = 0;
    if (!_FileCacheGetPropertyValueForKey(a2, v16, &v84))
    {
      v20 = _FileCacheGetAttributes(a2);
      v83 = 0;
      if (!v14)
        v13 = CFURLIsFileReferenceURL(a1);
      if ((*(_DWORD *)v20 & 0x2000) != 0)
      {
        v31 = CFGetAllocator(a1);
        if (!createVolumeParentURL(v31, v13, (fsid *)v20, (size_t *)&v83))
          goto LABEL_124;
        v32 = v83;
        _FileCacheSetPropertyValueForKey(a2, v16, v83);
        if (v32)
          goto LABEL_44;
        goto LABEL_45;
      }
      v21 = *(_DWORD *)(v20 + 112);
      if ((_DWORD)v13)
      {
        if (v21)
        {
          if (*(_QWORD *)(v20 + 136))
          {
            v22 = v16;
            v23 = v13;
            v24 = CFGetAllocator(a1);
            v25 = *(unsigned int *)(v20 + 112);
            v26 = *(_QWORD *)(v20 + 136);
            v27 = 1;
            FileReferenceURLRef = createFileReferenceURLRef(v24, v25, 0, v26, 0, 1u);
            _FileCacheSetPropertyValueForKey(a2, v22, FileReferenceURLRef);
            if (FileReferenceURLRef)
              CFRelease(FileReferenceURLRef);
LABEL_91:
            v13 = v23;
            v16 = v78;
LABEL_122:
            v14 = 1;
            goto LABEL_55;
          }
LABEL_38:
          if ((*(_DWORD *)v20 & 0x8000) != 0)
          {
            if (!getFileSystemPathForFileID(v21, *(_QWORD *)(v20 + 136), (char *)__s, (char *)0x400))
              goto LABEL_124;
            v33 = v13;
            v34 = CFGetAllocator(a1);
            v35 = strlen((const char *)__s);
            if (initGlobalsOnce(void)::onceToken != -1)
              dispatch_once(&initGlobalsOnce(void)::onceToken, &__block_literal_global_3);
            v36 = (const __CFURL *)MEMORY[0x186DA3264](v34, __s, v35, 1, 0);
            v83 = v36;
            v13 = v33;
            v16 = v78;
            if (!v36)
              goto LABEL_124;
            v32 = v36;
            _FileCacheSetPropertyValueForKey(a2, v78, v36);
LABEL_44:
            CFRelease(v32);
LABEL_45:
            v27 = 1;
            goto LABEL_122;
          }
        }
      }
      else if (v21)
      {
        goto LABEL_38;
      }
      if (!CFURLGetFileSystemRepresentation(a1, 1u, __s, 1024))
      {
        v23 = v13;
        if (v75)
        {
          v46 = CFGetAllocator(a1);
          v27 = 0;
          *v75 = _FSURLCreateStandardError(v46, v72, 4, 0, (const __CFString *)a1, 0);
        }
        else
        {
          v27 = 0;
        }
        goto LABEL_91;
      }
      v82 = 0;
      v81 = xmmword_1817D5270;
      _FileCacheUnlock(a2);
      if (filtered_getattrlist((char *)__s, &v81, &cf, 0x40CuLL, 0x21u))
      {
        v37 = v13;
        v38 = v75;
        if (v75)
        {
          v39 = CFGetAllocator(a1);
          v40 = *__error();
          v41 = v39;
          v42 = *(const __CFString **)v69;
          goto LABEL_50;
        }
LABEL_103:
        v27 = 0;
        goto LABEL_104;
      }
      v47 = (char *)&cf + SHIDWORD(cf) + 4;
      if (v86 < 3)
      {
        if (!strcmp("/", (const char *)&cf + SHIDWORD(cf) + 4))
        {
          _FileCacheSetPropertyValueForKey(a2, v16, 0);
          goto LABEL_116;
        }
        v37 = v13;
        v38 = v75;
        if (!v75)
          goto LABEL_103;
        v41 = CFGetAllocator(a1);
        v42 = v72;
        v40 = 4;
LABEL_50:
        v27 = 0;
        *v38 = _FSURLCreateStandardError(v41, v42, v40, 0, (const __CFString *)a1, 0);
LABEL_104:
        v13 = v37;
        v16 = v78;
      }
      else
      {
        v68 = v13;
        if (*v47)
        {
          v48 = strlen((const char *)&cf + SHIDWORD(cf) + 4);
          v49 = (unsigned __int8 *)&cf + v48 + SHIDWORD(cf) + 3;
          v50 = (char *)&cf + v48 + SHIDWORD(cf) + 2;
          while (v49 > (unsigned __int8 *)v47)
          {
            v51 = v50;
            v52 = *v49--;
            --v50;
            if (v52 != 47)
            {
              while (v51 > v47)
              {
                v53 = *v51--;
                if (v53 == 47)
                {
                  v49 = (unsigned __int8 *)(v51 + 1);
                  goto LABEL_78;
                }
              }
              goto LABEL_107;
            }
          }
LABEL_78:
          if (v49 != (unsigned __int8 *)v47)
          {
            v54 = (char *)(v49 - 1);
            do
            {
              v55 = v54;
              if (v54 <= v47)
                break;
              --v54;
            }
            while (*v55 == 47);
            goto LABEL_111;
          }
LABEL_107:
          if (*v47 == 47)
            v58 = "/";
          else
            v58 = ".";
          strlcpy((char *)__s, v58, 0x400uLL);
          v55 = v47;
LABEL_111:
          v59 = v55 - v47 + 1;
          if (v59 >= 0x400)
            *__error() = 63;
          memcpy(__s, v47, v59);
          __s[v59] = 0;
        }
        else
        {
          strncpy((char *)__s, ".", 0x400uLL);
        }
        v60 = CFGetAllocator(a1);
        v61 = strlen((const char *)__s);
        v62 = CFURLCreateFromFileSystemRepresentation(v60, __s, v61, 1u);
        v83 = v62;
        v13 = v68;
        if (v62)
        {
          v63 = v62;
          _FileCacheSetPropertyValueForKey(a2, v16, v62);
          CFRelease(v63);
LABEL_116:
          v27 = 1;
        }
        else
        {
          if (v75)
          {
            v64 = CFGetAllocator(a1);
            v27 = 0;
            *v75 = _FSURLCreateStandardError(v64, v72, 4, 0, (const __CFString *)a1, 0);
          }
          else
          {
            v27 = 0;
          }
          v13 = v68;
        }
      }
      _FileCacheLock(a2);
      goto LABEL_122;
    }
LABEL_54:
    v27 = 1;
LABEL_55:
    if (++v12 == a5)
      goto LABEL_127;
  }
  if (CFEqual(v17, cf2))
  {
    cf = 0;
    a5 = v79;
    if (!_FileCacheGetPropertyValueForKey(a2, cf2, (void **)&cf))
    {
      v29 = v13;
      if (CFURLGetBaseURL(a1))
      {
        v30 = CFURLCopyAbsoluteURL(a1);
        if (!v30)
          goto LABEL_124;
      }
      else
      {
        CFRetain(a1);
        v30 = a1;
        if (!a1)
          goto LABEL_124;
      }
      v43 = CFURLCopyFileSystemPath(v30, kCFURLPOSIXPathStyle);
      CFRelease(v30);
      if (!v43)
      {
LABEL_124:
        if (v75)
        {
          v65 = CFGetAllocator(a1);
          *v75 = _FSURLCreateStandardError(v65, v72, 4, 0, (const __CFString *)a1, 0);
        }
        goto LABEL_126;
      }
      _FileCacheSetPropertyValueForKey(a2, cf2, v43);
      CFRelease(v43);
      v13 = v29;
      v16 = v78;
    }
    goto LABEL_54;
  }
  if (CFEqual(v17, v77))
  {
    cf = 0;
    if (!_FileCacheGetPropertyValueForKey(a2, v77, (void **)&cf))
    {
      if (!v76 && !CFURLGetFileSystemRepresentation(a1, 1u, buffer, 1024))
        goto LABEL_124;
      v44 = getxattr((const char *)buffer, "com.apple.metadata:com_apple_backup_excludeItem", 0, 0, 0, 1);
      v45 = v74;
      if (v44 <= 0)
      {
        if (getxattr((const char *)buffer, "com.apple.MobileBackup", 0, 0, 0, 1) >= 1)
          v45 = v74;
        else
          v45 = v71;
      }
      _FileCacheSetPropertyValueForKey(a2, v77, v45);
      v76 = 1;
    }
    v27 = 1;
LABEL_99:
    a5 = v79;
    goto LABEL_55;
  }
  if (CFEqual(v17, v73))
  {
    cf = 0;
    if (!_FileCacheGetPropertyValueForKey(a2, v73, (void **)&cf))
    {
      if (!v76 && !CFURLGetFileSystemRepresentation(a1, 1u, buffer, 1024))
        goto LABEL_124;
      v76 = 1;
      if (getxattr((const char *)buffer, "com.apple.metadata:com_apple_cloudBackup_excludeItem", 0, 0, 0, 1) >= 1)
        v56 = v74;
      else
        v56 = v71;
      _FileCacheSetPropertyValueForKey(a2, v73, v56);
    }
    v27 = 1;
    goto LABEL_99;
  }
  if (CFEqual(v17, v70))
  {
    cf = 0;
    if (!_FileCacheGetPropertyValueForKey(a2, v70, (void **)&cf))
    {
      if (!v76 && !CFURLGetFileSystemRepresentation(a1, 1u, buffer, 1024))
        goto LABEL_124;
      v76 = 1;
      if (getxattr((const char *)buffer, "com.apple.metadata:com_apple_unencryptedBackup_excludeItem", 0, 0, 0, 1) >= 1)
        v57 = v74;
      else
        v57 = v71;
      _FileCacheSetPropertyValueForKey(a2, v70, v57);
    }
    v27 = 1;
    goto LABEL_99;
  }
  if (!v75)
  {
LABEL_126:
    v27 = 0;
    goto LABEL_127;
  }
  v67 = CFGetAllocator(a1);
  v27 = 0;
  *v75 = _FSURLCreateStandardError(v67, v72, 256, 1, (const __CFString *)a1, 0);
LABEL_127:
  _FileCacheUnlock(a2);
  return v27;
}

uint64_t _FileCacheGetPropertyValueForKey(uint64_t a1, const void *a2, void **a3)
{
  const __CFDictionary *v6;
  uint64_t v7;
  int v8;
  void *value;

  value = 0;
  _FileCacheLock(a1);
  v6 = *(const __CFDictionary **)(a1 + 288);
  if (v6 && CFDictionaryGetValueIfPresent(v6, a2, (const void **)&value))
  {
    *a3 = value;
    v7 = 1;
  }
  else
  {
    v7 = 0;
  }
  v8 = *(_DWORD *)(a1 + 32) - 1;
  *(_DWORD *)(a1 + 32) = v8;
  if (!v8)
  {
    *(_QWORD *)(a1 + 24) = 0;
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 36));
  }
  return v7;
}

void _FileCacheSetPropertyValueForKey(uint64_t a1, const void *a2, const void *a3)
{
  __CFDictionary *v6;
  const __CFAllocator *v7;
  int v8;
  CFDictionaryValueCallBacks v9;

  _FileCacheLock(a1);
  v6 = *(__CFDictionary **)(a1 + 288);
  if (!v6)
  {
    *(_OWORD *)&v9.version = xmmword_1E0F0AEC8;
    *(_OWORD *)&v9.release = *(_OWORD *)&off_1E0F0AED8;
    v9.equal = (CFDictionaryEqualCallBack)FileCachePropertyValueEqualCallBack;
    v7 = CFGetAllocator((CFTypeRef)a1);
    v6 = CFDictionaryCreateMutable(v7, 0, MEMORY[0x1E0C9B390], &v9);
    *(_QWORD *)(a1 + 288) = v6;
  }
  CFDictionarySetValue(v6, a2, a3);
  v8 = *(_DWORD *)(a1 + 32) - 1;
  *(_DWORD *)(a1 + 32) = v8;
  if (!v8)
  {
    *(_QWORD *)(a1 + 24) = 0;
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 36));
  }
}

uint64_t createVolumeIdentifierValue(const void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, CFDataRef *a7)
{
  uint64_t Attributes;
  uint64_t v10;
  const __CFAllocator *v11;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x1E0C80C00];
  Attributes = _FileCacheGetAttributes(a2);
  if (*(_DWORD *)(Attributes + 112))
    v10 = *(unsigned int *)(Attributes + 112);
  else
    v10 = *(_QWORD *)(Attributes + 104);
  v13[0] = v10;
  v11 = CFGetAllocator(a1);
  *a7 = CFDataCreate(v11, (const UInt8 *)v13, 8);
  return 1;
}

void _FSURLSetPermanentResourcePropertyForKey(const __CFURL *a1, const void *a2, const void *a3)
{
  const void *v6;
  _QWORD *v7;
  __CFDictionary *TemporaryPropertyDictionary;
  __CFDictionary *PermanentPropertyDictionary;

  v6 = (const void *)__CFURLResourceInfoPtr();
  v7 = _FileCacheGetForURL(a1, v6);
  _FileCacheLockTempPermProperties();
  TemporaryPropertyDictionary = _FileCacheGetTemporaryPropertyDictionary(v7, 0);
  if (TemporaryPropertyDictionary)
    CFDictionaryRemoveValue(TemporaryPropertyDictionary, a2);
  PermanentPropertyDictionary = _FileCacheGetPermanentPropertyDictionary(v7, 1);
  if (PermanentPropertyDictionary)
  {
    if (a3)
      CFDictionarySetValue(PermanentPropertyDictionary, a2, a3);
    else
      CFDictionaryRemoveValue(PermanentPropertyDictionary, a2);
  }
  _FileCacheUnlockTempPermProperties();
}

CFMutableDictionaryRef _FileCacheGetPermanentPropertyDictionary(_QWORD *cf, int a2)
{
  CFMutableDictionaryRef result;
  const __CFAllocator *v4;

  result = (CFMutableDictionaryRef)cf[38];
  if (a2)
  {
    if (!result)
    {
      v4 = CFGetAllocator(cf);
      result = CFDictionaryCreateMutable(v4, 0, MEMORY[0x1E0C9B390], MEMORY[0x1E0C9B3A0]);
      cf[38] = result;
    }
  }
  return result;
}

void _FSURLCacheCheapVolumeInformation(const __CFURL *a1, int a2, uint64_t a3)
{
  const void *v6;
  CFTypeRef v7;
  uint64_t Attributes;

  v6 = (const void *)__CFURLResourceInfoPtr();
  if (v6)
  {
    v7 = _FileCacheGetForURL(a1, v6);
    _FileCacheLock((uint64_t)v7);
    Attributes = _FileCacheGetAttributes((uint64_t)v7);
    if ((*(_BYTE *)Attributes & 2) != 0 && *(_DWORD *)(Attributes + 104) == a2 && !_FileCacheGetVolumeInfo((uint64_t)v7))
    {
      _FileCacheLockTransitionToPreparer((uint64_t)v7);
      prepareCheapVolumeInformation(a1, (uint64_t)v7, a3);
      _FileCacheLockTransitionFromPreparer((uint64_t)v7);
    }
    _FileCacheUnlock((uint64_t)v7);
  }
}

void prepareCheapVolumeInformation(const void *a1, uint64_t a2, uint64_t a3)
{
  unint64_t VolumeFlags;
  uint64_t v7;
  uint64_t VolumeCreationDate;
  uint64_t v9;
  double v10;
  fsid v11;
  unint64_t v12;
  CFIndex v14;
  const __CFAllocator *v15;
  __CFData *Mutable;
  __CFData *v17;
  statfs v18;
  UInt8 bytes[8];
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v23 = 0u;
  v22 = 0u;
  v21 = 0u;
  v20 = 0u;
  *(_QWORD *)bytes = -1;
  if (!a3)
  {
    v11 = *(fsid *)(_FileCacheGetAttributes(a2) + 104);
    if (GetStatfsByFSID(v11, &v18))
    {
LABEL_21:
      *(double *)&v22 = -1.0 - *MEMORY[0x1E0C9ADE8];
      *((_QWORD *)&v22 + 1) = -1;
      v14 = 56;
      goto LABEL_27;
    }
    if ((v18.f_flags & 0x1000) != 0)
    {
      *((_QWORD *)&v21 + 1) |= 1uLL;
      if ((v18.f_flags & 0x400000) == 0)
      {
LABEL_9:
        if ((v18.f_flags & 0x100000) == 0)
          goto LABEL_10;
        goto LABEL_32;
      }
    }
    else if ((v18.f_flags & 0x400000) == 0)
    {
      goto LABEL_9;
    }
    *((_QWORD *)&v21 + 1) |= 2uLL;
    if ((v18.f_flags & 0x100000) == 0)
    {
LABEL_10:
      if ((v18.f_flags & 1) == 0)
        goto LABEL_11;
      goto LABEL_33;
    }
LABEL_32:
    *((_QWORD *)&v21 + 1) |= 4uLL;
    if ((v18.f_flags & 1) == 0)
    {
LABEL_11:
      if ((v18.f_flags & 0x400) == 0)
        goto LABEL_12;
      goto LABEL_34;
    }
LABEL_33:
    *((_QWORD *)&v21 + 1) |= 8uLL;
    if ((v18.f_flags & 0x400) == 0)
    {
LABEL_12:
      if ((v18.f_flags & 0x4000) == 0)
        goto LABEL_13;
      goto LABEL_35;
    }
LABEL_34:
    *((_QWORD *)&v21 + 1) |= 0x10uLL;
    if ((v18.f_flags & 0x4000) == 0)
    {
LABEL_13:
      if ((v18.f_flags & 0x80) == 0)
        goto LABEL_15;
      goto LABEL_14;
    }
LABEL_35:
    *((_QWORD *)&v21 + 1) |= 0x4000000uLL;
    if ((v18.f_flags & 0x80) == 0)
    {
LABEL_15:
      v12 = *((_QWORD *)&v21 + 1) & 0xFEFFFFFFFFFFFFFFLL | (v18.f_flags << 8) & 0x20000000;
      *((_QWORD *)&v21 + 1) = v12;
      if (*(_DWORD *)v18.f_fstypename == 1719035236 && *(unsigned __int16 *)&v18.f_fstypename[4] == 115)
        *((_QWORD *)&v21 + 1) = v12 | 0x10000;
      goto LABEL_21;
    }
LABEL_14:
    *((_QWORD *)&v21 + 1) |= 0x8000000uLL;
    goto LABEL_15;
  }
  VolumeFlags = MountInfoGetVolumeFlags(a3);
  v7 = VolumeFlags & 0x7F ^ 1;
  if ((VolumeFlags & 0x80) != 0)
  {
    v7 |= 0x80uLL;
    *((_QWORD *)&v21 + 1) = v7;
  }
  *((_QWORD *)&v21 + 1) = VolumeFlags & 0x700 | v7 & 0xFFFFFFFFC3FFEFFFLL | (((VolumeFlags >> 11) & 1) << 12) & 0xFFFFFFFFC3FFFFFFLL | (((VolumeFlags >> 23) & 0xF) << 26) | MountInfoGetCapabilities(a3);
  VolumeCreationDate = MountInfoGetVolumeCreationDate(a3);
  if (VolumeCreationDate | v9)
    v10 = (double)VolumeCreationDate - *MEMORY[0x1E0C9ADF8] + (double)v9 * 0.000000001;
  else
    v10 = -1.0 - *MEMORY[0x1E0C9ADE8];
  *(double *)&v22 = v10;
  if (MountInfoGetVolumeUUID(a3, (unsigned __int8 *)&v23))
    v14 = 72;
  else
    v14 = 56;
  *((_QWORD *)&v22 + 1) = MountInfoGetMaxFileSize(a3);
LABEL_27:
  v15 = CFGetAllocator(a1);
  Mutable = CFDataCreateMutable(v15, v14);
  if (Mutable)
  {
    v17 = Mutable;
    CFDataAppendBytes(Mutable, bytes, v14);
    _FileCacheSetVolumeInfo(a2, v17);
    CFRelease(v17);
  }
}

void _FileCacheSetVolumeInfo(uint64_t a1, CFTypeRef cf)
{
  const void *v3;
  CFTypeRef v4;

  v3 = *(const void **)(a1 + 312);
  if (cf)
    v4 = CFRetain(cf);
  else
    v4 = 0;
  *(_QWORD *)(a1 + 312) = v4;
  if (v3)
    CFRelease(v3);
}

uint64_t MountInfoGetVolumeUUID(uint64_t a1, unsigned __int8 *a2)
{
  const unsigned __int8 *v3;

  v3 = (const unsigned __int8 *)(a1 + 3000);
  if (uuid_is_null((const unsigned __int8 *)(a1 + 3000)))
    return 0;
  uuid_copy(a2, v3);
  return 1;
}

uint64_t MountInfoGetVolumeCreationDate(uint64_t a1)
{
  return *(_QWORD *)(a1 + 2168);
}

uint64_t MountInfoGetMaxFileSize(uint64_t a1)
{
  return *(_QWORD *)(a1 + 3016);
}

CFURLRef createFileReferenceURLRef(const __CFAllocator *a1, uint64_t a2, uint64_t a3, uint64_t a4, CFStringRef theString, Boolean a6)
{
  size_t v10;
  uint64_t v11;
  uint64_t v12;
  const char *v13;
  char *v14;
  char *v15;
  unint64_t v16;
  BOOL v17;
  size_t v18;
  size_t v20;
  char v22[1024];
  char v23[1024];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  if (!a2)
    return 0;
  if (!theString)
  {
    if (snprintf(v23, 0x400uLL, "/.file/id=%lld.%lld", a2, a4) <= 0x3FF)
    {
      v20 = strlen(v23);
      return CFURLCreateFromFileSystemRepresentation(a1, (const UInt8 *)v23, v20, a6);
    }
    return 0;
  }
  if (!CFStringGetCString(theString, v22, 1024, 0x8000100u))
    return 0;
  v10 = strlen(v22);
  v11 = MEMORY[0x1E0C80A78](v10);
  v13 = &v22[-((v12 + 15) & 0xFFFFFFFFFFFFFFF0) - 8];
  v14 = (char *)v13;
  if (v11 >= 1)
  {
    v15 = v22;
    v14 = (char *)v13;
    do
    {
      v16 = *v15;
      v17 = (v16 - 34) > 0x3E || ((1 << (v16 - 34)) & 0x5A0000003600000BLL) == 0;
      if (v17 && (v16 - 123) >= 3 && (v16 - 127) > 0xFFFFFFA1)
      {
        *v14++ = v16;
      }
      else
      {
        *v14 = 37;
        v14[1] = createFileReferenceURLRef(__CFAllocator const*,unsigned long long,unsigned long long,unsigned long long,__CFString const*,unsigned char)::hexchars[v16 >> 4];
        v14[2] = createFileReferenceURLRef(__CFAllocator const*,unsigned long long,unsigned long long,unsigned long long,__CFString const*,unsigned char)::hexchars[v16 & 0xF];
        v14 += 3;
      }
      ++v15;
      --v11;
    }
    while (v11);
  }
  *v14 = 0;
  if (snprintf(v23, 0x400uLL, "/.file/id=%lld.%lld/%s", a2, a3, v13) > 0x3FF)
    return 0;
  v18 = strlen(v23);
  return CFURLCreateFromFileSystemRepresentation(a1, (const UInt8 *)v23, v18, a6);
}

uint64_t createVolumeDeviceIDValue(const void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, int a6, CFNumberRef *a7)
{
  uint64_t Attributes;
  const __CFAllocator *v10;

  if (!a6)
    return 0;
  Attributes = _FileCacheGetAttributes(a2);
  v10 = CFGetAllocator(a1);
  *a7 = CFNumberCreate(v10, kCFNumberSInt32Type, (const void *)(Attributes + 104));
  return 2;
}

uint64_t ExternalProviderCopyValues(uint64_t a1, uint64_t a2, uint64_t a3, _QWORD *a4, const void ***a5, uint64_t a6)
{
  const void *v6;
  const void *v7;
  uint64_t v8;
  uint64_t result;
  CFTypeRef v13;
  CFTypeRef cf[7];

  if (a6 < 1)
    return 1;
  cf[5] = v6;
  cf[6] = v7;
  v8 = a6;
  while (1)
  {
    cf[0] = 0;
    result = _FileCacheGetPropertyValueForKey(a2, **a5, (void **)cf);
    if (!(_DWORD)result)
      break;
    if (cf[0])
    {
      CFRetain(cf[0]);
      v13 = cf[0];
    }
    else
    {
      v13 = 0;
    }
    *a4++ = v13;
    ++a5;
    if (!--v8)
      return 1;
  }
  *a4 = 0;
  return result;
}

uint64_t createVolumeAvailableCapacityValue(const void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, int a6, CFNumberRef *a7)
{
  CFNumberRef v9;
  const __CFAllocator *v11;

  if (!a6)
    return 0;
  if ((*(_BYTE *)(a3 + 39) & 1) != 0)
  {
    v11 = CFGetAllocator(a1);
    v9 = CFNumberCreate(v11, kCFNumberSInt64Type, (const void *)(a3 + 24));
  }
  else
  {
    v9 = 0;
  }
  *a7 = v9;
  return 2;
}

uint64_t createVolumeUUIDStringValue(const void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, int a6, CFStringRef *a7)
{
  const __CFAllocator *v9;
  _BYTE v11[37];
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  if (a4 == 72)
  {
    if (a6)
    {
      memset(v11, 0, sizeof(v11));
      uuid_unparse_upper((const unsigned __int8 *)(a3 + 56), v11);
      v9 = CFGetAllocator(a1);
      *a7 = CFStringCreateWithCString(v9, v11, 0x8000100u);
      return 2;
    }
    else
    {
      return 0;
    }
  }
  else
  {
    *a7 = 0;
    return 1;
  }
}

BOOL _FSGetFileSystemRepresentationForFileID(const __CFAllocator *a1, int a2, uint64_t a3, char *a4, char *a5, CFErrorRef *a6)
{
  _BOOL8 FileSystemPathForFileID;
  _BOOL8 v9;
  const __CFString *v10;
  CFErrorRef v11;

  FileSystemPathForFileID = getFileSystemPathForFileID(a2, a3, a4, a5);
  v9 = FileSystemPathForFileID;
  if (a6)
  {
    if (!FileSystemPathForFileID)
    {
      v10 = (const __CFString *)*MEMORY[0x1E0C9AFB8];
      v11 = _FSURLCreateStandardError(a1, (const __CFString *)*MEMORY[0x1E0C9AFB8], 4, 0, 0, 0);
      *a6 = v11;
      if (!v11)
      {
        if (os_log_type_enabled((os_log_t)defaultLog, OS_LOG_TYPE_ERROR))
          _FSGetFileSystemRepresentationForFileID_cold_1();
        *a6 = CFErrorCreate((CFAllocatorRef)*MEMORY[0x1E0C9AE00], v10, 256, 0);
      }
    }
  }
  return v9;
}

CFStringRef _FSCreatePathForFileID(const __CFAllocator *a1, int a2, uint64_t a3, CFErrorRef *a4)
{
  CFStringRef result;
  CFErrorRef v7;
  CFErrorRef v8;
  char cStr[1024];
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  if (getFileSystemPathForFileID(a2, a3, cStr, (char *)0x400))
  {
    result = CFStringCreateWithCString(a1, cStr, 0x8000100u);
    if (!a4)
      return result;
  }
  else
  {
    if (!a4)
      return 0;
    v7 = _FSURLCreateStandardError(a1, (const __CFString *)*MEMORY[0x1E0C9AFB8], 4, 0, 0, 0);
    result = 0;
    *a4 = v7;
  }
  if (result)
    return result;
  if (*a4)
    return 0;
  if (os_log_type_enabled((os_log_t)defaultLog, OS_LOG_TYPE_ERROR))
    _FSCreatePathForFileID_cold_1();
  v8 = CFErrorCreate((CFAllocatorRef)*MEMORY[0x1E0C9AE00], (CFErrorDomain)*MEMORY[0x1E0C9AFB8], 256, 0);
  result = 0;
  *a4 = v8;
  return result;
}

BOOL getFileSystemPathForFileID(int a1, uint64_t a2, char *a3, char *a4)
{
  uint64_t v8;
  uint64_t v9;
  _BOOL8 v10;
  const char *MountPoint;
  uint64_t v13;
  fsid_t FSID;
  uint64_t v15[2];

  v15[1] = *MEMORY[0x1E0C80C00];
  v15[0] = 0;
  v8 = MountInfoStorageSize();
  v9 = MEMORY[0x1E0C80A78](v8);
  if (!MountInfoPrepare(v15, a1, 0, (char *)&v13 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0), 0, 0, 0))
    return 0;
  if (a2)
  {
    if ((MountInfoGetCapabilities(v15[0]) & 0x8000000000000) != 0)
    {
      FSID = (fsid_t)MountInfoGetFSID(v15[0]);
      v10 = fsgetpath(a3, (size_t)a4, &FSID, a2) >= 0;
    }
    else
    {
      v10 = 0;
    }
  }
  else
  {
    MountPoint = (const char *)MountInfoGetMountPoint(v15[0]);
    v10 = strlcpy(a3, MountPoint, (size_t)a4) < (unint64_t)a4;
  }
  MountInfoDestroy(v15[0]);
  return v10;
}

void _FSURLClearResourcePropertyCacheForKey(const __CFURL *a1, const void *a2, CFTypeRef cf)
{
  _QWORD *v6;
  _QWORD *v7;
  const void *Value;
  uint64_t v9;
  __CFDictionary *TemporaryPropertyDictionary;
  int v11;
  const __CFURL *v12;
  BOOL v13;
  const void *v14;
  _QWORD *v15;
  _QWORD *v16;
  __CFDictionary *v17;
  CFTypeRef cfa;

  if (!cf)
    return;
  v6 = _FileCacheGetForURL(a1, cf);
  v7 = v6;
  if (a2)
  {
    Value = CFDictionaryGetValue((CFDictionaryRef)qword_1ECD2A668, a2);
    if (Value)
    {
      v9 = (uint64_t)Value;
      _FileCacheLock((uint64_t)v7);
      clearPropertyAndDependentValues((uint64_t)a1, (uint64_t)v7, v9);
      _FileCacheUnlock((uint64_t)v7);
      goto LABEL_10;
    }
    _FileCacheLockTempPermProperties();
    TemporaryPropertyDictionary = _FileCacheGetTemporaryPropertyDictionary(v7, 0);
    if (TemporaryPropertyDictionary)
      CFDictionaryRemoveValue(TemporaryPropertyDictionary, a2);
    _FileCacheUnlockTempPermProperties();
  }
  else
  {
    _FileCacheLock((uint64_t)v6);
    _FileCacheReleaseContents((uint64_t)v7, 1, 0, 1, 0);
    _FileCacheUnlock((uint64_t)v7);
  }
  v9 = 0;
LABEL_10:
  cfa = 0;
  v11 = _FSURLCopyResourcePropertyForKeyInternal(a1, (const __CFString *)*MEMORY[0x1E0C9AD40], (void **)&cfa, cf, 0, 1);
  v12 = (const __CFURL *)cfa;
  if (v11)
    v13 = cfa == 0;
  else
    v13 = 1;
  if (!v13)
  {
    if (cfa != (CFTypeRef)*MEMORY[0x1E0C9B0D0])
    {
      v14 = (const void *)__CFURLResourceInfoPtr();
      if (v14)
      {
        v15 = _FileCacheGetForURL(v12, v14);
        v16 = v15;
        if (a2)
        {
          if (!v9)
          {
            _FileCacheLockTempPermProperties();
            v17 = _FileCacheGetTemporaryPropertyDictionary(v16, 0);
            if (v17)
              CFDictionaryRemoveValue(v17, a2);
            _FileCacheUnlockTempPermProperties();
            goto LABEL_24;
          }
          _FileCacheLock((uint64_t)v15);
          clearPropertyAndDependentValues((uint64_t)v12, (uint64_t)v16, v9);
        }
        else
        {
          _FileCacheLock((uint64_t)v15);
          _FileCacheReleaseContents((uint64_t)v16, 1, 0, 1, 0);
        }
        _FileCacheUnlock((uint64_t)v16);
      }
    }
LABEL_24:
    CFRelease(v12);
  }
}

uint64_t _FileCacheFinalize(os_unfair_lock_s *a1)
{
  os_unfair_recursive_lock_lock_with_options();
  os_unfair_lock_lock(a1 + 9);
  _FileCacheReleaseContents((uint64_t)a1, 0, 0, 0, 1);
  os_unfair_lock_unlock(a1 + 9);
  return os_unfair_recursive_lock_unlock();
}

void _FileCacheReleaseContents(uint64_t a1, int a2, int a3, int a4, int a5)
{
  const void *v10;
  const void *v11;
  const void *v12;
  const void *v13;
  const void *v14;
  const void *v15;
  const void *v16;
  const void *v17;
  const void *v18;
  int v19;

  if (!a5)
  {
    _FileCacheLock(a1);
    _FileCacheLockTransitionToPreparer(a1);
  }
  v10 = *(const void **)(a1 + 56);
  if (v10)
  {
    CFRelease(v10);
    *(_QWORD *)(a1 + 56) = 0;
  }
  v11 = *(const void **)(a1 + 272);
  if (v11)
  {
    CFRelease(v11);
    *(_QWORD *)(a1 + 272) = 0;
  }
  v12 = *(const void **)(a1 + 280);
  if (v12)
  {
    CFRelease(v12);
    *(_QWORD *)(a1 + 280) = 0;
  }
  v13 = *(const void **)(a1 + 288);
  if (v13)
  {
    *(_QWORD *)(a1 + 288) = 0;
    CFRelease(v13);
  }
  *(_OWORD *)(a1 + 256) = 0u;
  *(_OWORD *)(a1 + 272) = 0u;
  *(_OWORD *)(a1 + 224) = 0u;
  *(_OWORD *)(a1 + 240) = 0u;
  *(_OWORD *)(a1 + 192) = 0u;
  *(_OWORD *)(a1 + 208) = 0u;
  *(_OWORD *)(a1 + 160) = 0u;
  *(_OWORD *)(a1 + 176) = 0u;
  *(_OWORD *)(a1 + 128) = 0u;
  *(_OWORD *)(a1 + 144) = 0u;
  *(_OWORD *)(a1 + 96) = 0u;
  *(_OWORD *)(a1 + 112) = 0u;
  *(_OWORD *)(a1 + 64) = 0u;
  *(_OWORD *)(a1 + 80) = 0u;
  *(_OWORD *)(a1 + 48) = 0u;
  if (a3)
  {
LABEL_12:
    if (a4)
      goto LABEL_25;
    if (a5)
    {
      v14 = *(const void **)(a1 + 304);
      if (v14)
      {
        *(_QWORD *)(a1 + 304) = 0;
        CFRelease(v14);
      }
      goto LABEL_25;
    }
    goto LABEL_22;
  }
  if (a5)
  {
    v15 = *(const void **)(a1 + 296);
    if (v15)
    {
      *(_QWORD *)(a1 + 296) = 0;
      CFRelease(v15);
    }
    goto LABEL_12;
  }
  os_unfair_lock_lock((os_unfair_lock_t)&sTempPermDictionaryLock);
  v16 = *(const void **)(a1 + 296);
  if (v16)
  {
    *(_QWORD *)(a1 + 296) = 0;
    CFRelease(v16);
  }
  os_unfair_lock_unlock((os_unfair_lock_t)&sTempPermDictionaryLock);
  if (!a4)
  {
LABEL_22:
    os_unfair_lock_lock((os_unfair_lock_t)&sTempPermDictionaryLock);
    v17 = *(const void **)(a1 + 304);
    if (v17)
    {
      *(_QWORD *)(a1 + 304) = 0;
      CFRelease(v17);
    }
    os_unfair_lock_unlock((os_unfair_lock_t)&sTempPermDictionaryLock);
  }
LABEL_25:
  v18 = *(const void **)(a1 + 312);
  if (v18)
  {
    CFRelease(v18);
    *(_QWORD *)(a1 + 312) = 0;
  }
  if (a2)
    atomic_store(0xFFFFFFFF, (unsigned int *)(a1 + 16));
  if (!a5)
  {
    _FileCacheLockTransitionFromPreparer(a1);
    v19 = *(_DWORD *)(a1 + 32) - 1;
    *(_DWORD *)(a1 + 32) = v19;
    if (!v19)
    {
      *(_QWORD *)(a1 + 24) = 0;
      os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 36));
    }
  }
}

uint64_t _FSURLSetResourcePropertyForKey(const __CFURL *a1, const void *a2, const void *a3, int a4, CFTypeRef cf, CFErrorRef *a6)
{
  const void *v8;
  _QWORD *v11;
  uint64_t *Value;
  uint64_t v13;
  uint64_t v14;
  uint64_t (*v15)(const __CFURL *, _QWORD *, const void **, const void **, uint64_t *, uint64_t, uint64_t, CFErrorRef *);
  uint64_t v16;
  uint64_t v17;
  __CFDictionary *PermanentPropertyDictionary;
  __CFDictionary *TemporaryPropertyDictionary;
  uint64_t v21;
  const void *v22;
  const void *v23;

  v8 = a3;
  v22 = a3;
  v23 = a2;
  v11 = _FileCacheGetForURL(a1, cf);
  Value = (uint64_t *)CFDictionaryGetValue((CFDictionaryRef)qword_1ECD2A668, a2);
  v13 = (uint64_t)Value;
  if (v8)
  {
    if (!a4)
      goto LABEL_9;
  }
  else
  {
    v8 = (const void *)*MEMORY[0x1E0C9B0D0];
    v22 = (const void *)*MEMORY[0x1E0C9B0D0];
    if (!a4)
    {
LABEL_9:
      v17 = 1;
      if (!a4 && !Value)
      {
        _FileCacheLockTempPermProperties();
        PermanentPropertyDictionary = _FileCacheGetPermanentPropertyDictionary(v11, 0);
        if (PermanentPropertyDictionary)
          CFDictionaryRemoveValue(PermanentPropertyDictionary, a2);
        TemporaryPropertyDictionary = _FileCacheGetTemporaryPropertyDictionary(v11, 1);
        if (TemporaryPropertyDictionary)
          CFDictionarySetValue(TemporaryPropertyDictionary, a2, v8);
        _FileCacheUnlockTempPermProperties();
      }
      return v17;
    }
  }
  if (!Value)
    goto LABEL_9;
  if (!*(_QWORD *)(*(uint64_t *)((char *)Value + 140) + 40))
    return 1;
  v21 = *Value;
  _FileCacheLock((uint64_t)v11);
  v14 = *(_QWORD *)(v13 + 140);
  v15 = *(uint64_t (**)(const __CFURL *, _QWORD *, const void **, const void **, uint64_t *, uint64_t, uint64_t, CFErrorRef *))(v14 + 40);
  v16 = *(_QWORD *)(v14 + 8);
  _FileCacheIncrementInProvider((uint64_t)v11);
  v17 = v15(a1, v11, &v23, &v22, &v21, 1, v16, a6);
  _FileCacheDecrementInProvider((uint64_t)v11);
  if ((_DWORD)v17)
  {
    clearPropertyAndDependentValues((uint64_t)a1, (uint64_t)v11, v13);
    _FileCacheUnlock((uint64_t)v11);
  }
  else
  {
    _FileCacheUnlock((uint64_t)v11);
    if (a6 && !*a6)
    {
      if (os_log_type_enabled((os_log_t)defaultLog, OS_LOG_TYPE_ERROR))
        _FSURLSetResourcePropertyForKey_cold_1();
      v17 = 0;
      *a6 = CFErrorCreate((CFAllocatorRef)*MEMORY[0x1E0C9AE00], (CFErrorDomain)*MEMORY[0x1E0C9AFB8], 256, 0);
    }
    else
    {
      return 0;
    }
  }
  return v17;
}

void clearPropertyAndDependentValues(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t v10;
  int v11;
  unint64_t v12;
  unint64_t v13;
  unint64_t v14;
  int v15;
  int v16;
  BOOL v17;
  uint64_t v18;
  int v19;
  int v20;
  int64_t v22;
  int64_t v23;
  uint64_t v24;
  int v25;

  if (qword_1ECD2A658 == **(_DWORD **)(a3 + 140))
  {
    if ((*(_BYTE *)_FileCacheGetAttributes(a2) & 1) != 0)
      _FileCacheReleaseContents(a2, 1, 1, 1, 0);
  }
  else
  {
    clearPropertyValue(a1, a2, (uint64_t *)a3);
    if (qword_1ECD2A538 >= 1)
    {
      v6 = 0;
      v7 = a3 + 76;
      do
      {
        v8 = (uint64_t *)(v7 + 12 * v6);
        v9 = *v8;
        v23 = 0;
        v24 = v9;
        v25 = *((_DWORD *)v8 + 2);
        v22 = 0;
        if (PropertyMaskIsNotZero((uint64_t)&v24, (unint64_t *)&v23, &v22) && v23 <= v22)
        {
          v10 = v24;
          v11 = v25;
          v12 = v22 - v23 + 1;
          v13 = 148 * v23;
          do
          {
            v14 = sFileProviderGlobals[7 * v6 + 8] + v13;
            v15 = *(_DWORD *)(v14 + 136);
            v16 = 1 << v15;
            v17 = v15 < 64;
            if (v15 >= 64)
              v18 = 0;
            else
              v18 = 1 << v15;
            if (v17)
              v19 = 0;
            else
              v19 = v16;
            v20 = v19 & v11;
            if ((v18 & v10) != 0 || v20 != 0)
              clearPropertyValue(a1, a2, (uint64_t *)v14);
            v13 += 148;
            --v12;
          }
          while (v12);
        }
        ++v6;
      }
      while (v6 < qword_1ECD2A538);
    }
  }
}

void clearPropertyValue(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5;
  void (*v6)(uint64_t, uint64_t, uint64_t, uint64_t *, uint64_t *, uint64_t, uint64_t, _QWORD);
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  v5 = *(uint64_t *)((char *)a3 + 140);
  v6 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t *, uint64_t *, uint64_t, uint64_t, _QWORD))(v5 + 40);
  if (v6)
  {
    v8 = *a3;
    v10 = 0;
    v11 = v8;
    v9 = *(_QWORD *)(v5 + 8);
    _FileCacheIncrementInProvider(a2);
    v6(a1, a2, (uint64_t)(a3 + 1), &v10, &v11, 1, v9, 0);
    _FileCacheDecrementInProvider(a2);
  }
  _FileCacheClearPropertyValueForKey(a2, (const void *)a3[1]);
}

uint64_t pathURLPropertyProviderSetValues(const __CFURL *a1, uint64_t a2, CFTypeRef *a3, const __CFBoolean **a4, uint64_t a5, uint64_t a6, uint64_t a7, CFErrorRef *a8)
{
  uint64_t v8;
  int v12;
  const void *v13;
  const __CFBoolean *v14;
  const void *v15;
  const __CFBoolean *v16;
  CFTypeRef v17;
  uint64_t v18;
  NSObject *v19;
  const char *v20;
  int v21;
  int v22;
  uint64_t v23;
  int v24;
  uint64_t v25;
  NSObject *v26;
  _BOOL4 v27;
  BOOL v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t result;
  CFErrorRef *v32;
  const __CFAllocator *v33;
  const __CFString *v34;
  uint64_t v35;
  CFErrorRef v36;
  CFTypeRef cf2;
  uint8_t buf[4];
  UInt8 *v40;
  UInt8 buffer[1024];
  uint64_t v42;

  v42 = *MEMORY[0x1E0C80C00];
  if (a6 < 1)
    return 1;
  v8 = a6;
  v12 = 0;
  v13 = (const void *)*MEMORY[0x1E0C9B4E8];
  v14 = (const __CFBoolean *)*MEMORY[0x1E0C9B0D0];
  v15 = (const void *)*MEMORY[0x1E0C9AC90];
  cf2 = (CFTypeRef)*MEMORY[0x1E0C9AC98];
  while (1)
  {
    v16 = *a4;
    if (*a4)
      break;
LABEL_50:
    ++a4;
    ++a3;
    if (!--v8)
      return 1;
  }
  v17 = *a3;
  if (CFEqual(*a3, v13))
  {
    if (!v12 && !CFURLGetFileSystemRepresentation(a1, 1u, buffer, 1024))
      goto LABEL_60;
    if (v16 != v14 && valueOfBoolean(v16))
    {
      if (!setxattr((const char *)buffer, "com.apple.metadata:com_apple_backup_excludeItem", "com.apple.MobileBackup", 0x16uLL, 0, 1))
      {
        v18 = defaultLog;
        if (os_log_type_enabled((os_log_t)defaultLog, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136380675;
          v40 = buffer;
          v19 = v18;
          v20 = "kExcludedFromBackupXattrName set on path: %{private}s";
LABEL_56:
          _os_log_impl(&dword_1817A6000, v19, OS_LOG_TYPE_DEFAULT, v20, buf, 0xCu);
          goto LABEL_49;
        }
        goto LABEL_49;
      }
      goto LABEL_45;
    }
    if (removexattr((const char *)buffer, "com.apple.MobileBackup", 1))
    {
      v21 = *__error();
      if (v21 == 93)
        v22 = 0;
      else
        v22 = v21;
    }
    else
    {
      v22 = 0;
    }
    if (removexattr((const char *)buffer, "com.apple.metadata:com_apple_backup_excludeItem", 1))
    {
      v24 = *__error();
      if (v24 == 93)
        v24 = 0;
    }
    else
    {
      v26 = defaultLog;
      v27 = os_log_type_enabled((os_log_t)defaultLog, OS_LOG_TYPE_DEFAULT);
      v24 = 0;
      if (v27)
      {
        *(_DWORD *)buf = 136380675;
        v40 = buffer;
        _os_log_impl(&dword_1817A6000, v26, OS_LOG_TYPE_DEFAULT, "kExcludedFromBackupXattrName removed from path: %{private}s", buf, 0xCu);
        v24 = 0;
      }
    }
    if (v22)
      v28 = v24 == 0;
    else
      v28 = 0;
    if (!v28)
      v22 = v24;
LABEL_48:
    if (v22)
    {
      v32 = a8;
      if (a8)
      {
        v33 = CFGetAllocator(a1);
        v34 = (const __CFString *)*MEMORY[0x1E0C9AFD0];
        v35 = v22;
LABEL_64:
        v36 = _FSURLCreateStandardError(v33, v34, v35, 1, (const __CFString *)a1, 0);
        result = 0;
        *v32 = v36;
        return result;
      }
      return 0;
    }
    goto LABEL_49;
  }
  if (CFEqual(v17, v15))
  {
    if (!v12 && !CFURLGetFileSystemRepresentation(a1, 1u, buffer, 1024))
      goto LABEL_60;
    if (v16 != v14 && valueOfBoolean(v16))
    {
      if (!setxattr((const char *)buffer, "com.apple.metadata:com_apple_cloudBackup_excludeItem", "com.apple.MobileBackup", 0x16uLL, 0, 1))
      {
        v23 = defaultLog;
        if (os_log_type_enabled((os_log_t)defaultLog, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136380675;
          v40 = buffer;
          v19 = v23;
          v20 = "kExcludedFromCloudBackupName set on path: %{private}s";
          goto LABEL_56;
        }
LABEL_49:
        v12 = 1;
        goto LABEL_50;
      }
      goto LABEL_45;
    }
    if (!removexattr((const char *)buffer, "com.apple.metadata:com_apple_cloudBackup_excludeItem", 1))
    {
      v25 = defaultLog;
      if (os_log_type_enabled((os_log_t)defaultLog, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136380675;
        v40 = buffer;
        v19 = v25;
        v20 = "kExcludedFromCloudBackupName removed from path: %{private}s";
        goto LABEL_56;
      }
      goto LABEL_49;
    }
LABEL_47:
    v22 = *__error();
    if (v22 == 93)
      goto LABEL_49;
    goto LABEL_48;
  }
  if (!CFEqual(v17, cf2))
  {
    v32 = a8;
    if (a8)
    {
      v33 = CFGetAllocator(a1);
      v34 = (const __CFString *)*MEMORY[0x1E0C9AFB8];
      v35 = 512;
      goto LABEL_64;
    }
    return 0;
  }
  if (v12 || CFURLGetFileSystemRepresentation(a1, 1u, buffer, 1024))
  {
    if (v16 != v14 && valueOfBoolean(v16))
    {
      if (!setxattr((const char *)buffer, "com.apple.metadata:com_apple_unencryptedBackup_excludeItem", "com.apple.MobileBackup", 0x16uLL, 0, 1))
      {
        v30 = defaultLog;
        if (os_log_type_enabled((os_log_t)defaultLog, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136380675;
          v40 = buffer;
          v19 = v30;
          v20 = "kExcludedFromUnencryptedBackupName set on path: %{private}s";
          goto LABEL_56;
        }
        goto LABEL_49;
      }
LABEL_45:
      v22 = *__error();
      goto LABEL_48;
    }
    if (!removexattr((const char *)buffer, "com.apple.metadata:com_apple_unencryptedBackup_excludeItem", 1))
    {
      v29 = defaultLog;
      if (os_log_type_enabled((os_log_t)defaultLog, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136380675;
        v40 = buffer;
        v19 = v29;
        v20 = "kExcludedFromUnencryptedBackupName removed from path: %{private}s";
        goto LABEL_56;
      }
      goto LABEL_49;
    }
    goto LABEL_47;
  }
LABEL_60:
  v32 = a8;
  if (a8)
  {
    v33 = CFGetAllocator(a1);
    v34 = (const __CFString *)*MEMORY[0x1E0C9AFB8];
    v35 = 4;
    goto LABEL_64;
  }
  return 0;
}

CFErrorRef _InitalizeDirectoryEnumerator(uint64_t a1)
{
  uint64_t v1;
  _OWORD *v2;
  int v3;
  const __CFAllocator *v4;
  const __CFString *v5;
  const __CFString *v6;
  uint64_t v7;
  CFErrorRef result;
  int v9;
  int v10;
  _BOOL4 v11;
  const __CFAllocator *v12;
  const __CFURL *v13;
  const __CFURL *v14;
  const __CFURL *v15;
  const __CFString *v16;
  size_t v17;
  CFURLRef v18;
  CFURLRef v19;
  ssize_t v20;
  const __CFURL *v21;
  const __CFURL *v22;
  const __CFURL *v23;
  const __CFURL *v24;
  int v25;
  const __CFArray *v26;
  BOOL v27;
  const __CFArray *v28;
  BOOL v29;
  size_t v30;
  uint64_t v31;
  __int128 *v32;
  uint64_t v33;
  const __CFAllocator *v34;
  int *v35;
  CFTypeRef cf1;
  CFURLRef url;
  CFTypeRef propertyValueTypeRefPtr;
  UInt8 __dst[1024];
  UInt8 buffer[1024];
  __int128 v41;
  uint64_t v42;
  UInt8 v43[7];
  char v44;
  int v45;
  int v46;
  _DWORD v47[258];
  uint64_t v48;
  CFRange v49;
  CFRange v50;

  v1 = MEMORY[0x1E0C80A78](a1);
  v48 = *MEMORY[0x1E0C80C00];
  *(_DWORD *)(v1 + 152) = _CFGetEUID();
  v2 = CFAllocatorAllocate(*(CFAllocatorRef *)(v1 + 16), 320, 0);
  *(_QWORD *)(v1 + 72) = v2;
  if (!v2)
  {
    v4 = *(const __CFAllocator **)(v1 + 16);
    v5 = (const __CFString *)*MEMORY[0x1E0C9AFD0];
    v7 = 12;
    v6 = 0;
    goto LABEL_11;
  }
  v2[18] = 0u;
  v2[19] = 0u;
  v2[16] = 0u;
  v2[17] = 0u;
  v2[14] = 0u;
  v2[15] = 0u;
  v2[12] = 0u;
  v2[13] = 0u;
  v2[10] = 0u;
  v2[11] = 0u;
  v2[8] = 0u;
  v2[9] = 0u;
  v2[6] = 0u;
  v2[7] = 0u;
  v2[4] = 0u;
  v2[5] = 0u;
  v2[2] = 0u;
  v2[3] = 0u;
  *v2 = 0u;
  v2[1] = 0u;
  if (!CFURLGetFileSystemRepresentation(*(CFURLRef *)(v1 + 48), 1u, buffer, 1024))
  {
    v4 = *(const __CFAllocator **)(v1 + 16);
    v5 = (const __CFString *)*MEMORY[0x1E0C9AFD0];
    v6 = *(const __CFString **)(v1 + 48);
    v7 = 63;
    goto LABEL_11;
  }
  v41 = xmmword_1817D5304;
  v42 = 0;
  if (filtered_getattrlist((char *)buffer, &v41, v43, 0x428uLL, 0x29u))
  {
    __dst[0] = 0;
    v3 = *__error();
    if (!v3)
    {
LABEL_5:
      v4 = *(const __CFAllocator **)(v1 + 16);
      v5 = (const __CFString *)*MEMORY[0x1E0C9AFD0];
      v6 = *(const __CFString **)(v1 + 48);
      v7 = 20;
LABEL_11:
      result = _FSURLCreateStandardError(v4, v5, v7, 0, v6, 0);
      goto LABEL_12;
    }
LABEL_10:
    v4 = *(const __CFAllocator **)(v1 + 16);
    v5 = (const __CFString *)*MEMORY[0x1E0C9AFD0];
    v7 = v3;
    v6 = *(const __CFString **)(v1 + 48);
    goto LABEL_11;
  }
  if ((v44 & 8) == 0)
  {
    __dst[0] = 0;
    v3 = 22;
    goto LABEL_10;
  }
  v9 = v46;
  v10 = v45;
  v11 = v46 == 2;
  strlcpy((char *)__dst, (const char *)v47 + v47[0], 0x400uLL);
  if (v9 == 5)
  {
    v12 = *(const __CFAllocator **)(v1 + 16);
    v13 = *(const __CFURL **)(v1 + 48);
    v14 = CFURLCreateWithFileSystemPath(v12, CFSTR("/private/"), kCFURLPOSIXPathStyle, 1u);
    if (!v14)
      goto LABEL_5;
    v15 = v14;
    propertyValueTypeRefPtr = 0;
    v16 = (const __CFString *)*MEMORY[0x1E0C9B470];
    if (CFURLCopyResourcePropertyForKey(v14, (CFStringRef)*MEMORY[0x1E0C9B470], &propertyValueTypeRefPtr, 0)
      && propertyValueTypeRefPtr)
    {
      if (CFURLGetFileSystemRepresentation(v13, 1u, v43, 1024)
        && (v17 = strlen((const char *)v43), (v18 = CFURLCreateFromFileSystemRepresentation(v12, v43, v17, 0)) != 0))
      {
        v19 = v18;
        v20 = readlink((const char *)v43, (char *)&v41, 0x400uLL);
        if (v20 < 0 || (v21 = (const __CFURL *)MEMORY[0x186DA3264](v12, &v41, v20, 0, v19)) == 0)
        {
          v23 = 0;
        }
        else
        {
          v22 = v21;
          url = 0;
          v23 = 0;
          if (CFURLCopyResourcePropertyForKey(v21, (CFStringRef)*MEMORY[0x1E0C9B5A8], &url, 0) && url)
          {
            cf1 = 0;
            v23 = 0;
            if (CFURLCopyResourcePropertyForKey(url, v16, &cf1, 0) && cf1)
            {
              if (CFEqual(cf1, propertyValueTypeRefPtr))
                v23 = CFURLCopyAbsoluteURL(v22);
              else
                v23 = 0;
              CFRelease(cf1);
            }
            CFRelease(url);
          }
          CFRelease(v22);
        }
        CFRelease(v19);
      }
      else
      {
        v23 = 0;
      }
      CFRelease(propertyValueTypeRefPtr);
      CFRelease(v15);
      if (!v23)
        goto LABEL_5;
      if (CFURLGetFileSystemRepresentation(v23, 1u, buffer, 1024))
      {
        v41 = xmmword_1817D5304;
        v42 = 0;
        if (filtered_getattrlist((char *)buffer, &v41, v43, 0x428uLL, 0x29u))
        {
          __dst[0] = 0;
          if (!*__error())
          {
            v11 = 0;
            v10 = 0;
LABEL_47:
            CFRelease(*(CFTypeRef *)(v1 + 48));
            *(_QWORD *)(v1 + 48) = v23;
            goto LABEL_48;
          }
        }
        else
        {
          if ((v44 & 8) != 0)
          {
            v10 = v45;
            v11 = v46 == 2;
            strlcpy((char *)__dst, (const char *)v47 + v47[0], 0x400uLL);
            goto LABEL_47;
          }
          __dst[0] = 0;
        }
      }
      v24 = v23;
    }
    else
    {
      v24 = v15;
    }
    CFRelease(v24);
    goto LABEL_5;
  }
LABEL_48:
  if (!v11)
    goto LABEL_5;
  if (!v10)
  {
    v4 = *(const __CFAllocator **)(v1 + 16);
    v5 = (const __CFString *)*MEMORY[0x1E0C9AFD0];
    v6 = *(const __CFString **)(v1 + 48);
    v7 = 2;
    goto LABEL_11;
  }
  *(_WORD *)(v1 + 128) = 5;
  *(_QWORD *)(v1 + 138) = 0;
  *(_QWORD *)(v1 + 130) = 0;
  *(_QWORD *)(v1 + 144) = 0;
  *(_BYTE *)(v1 + 121) = _FSURLGetAttrListForPropertyKeys(0, *(CFArrayRef *)(v1 + 40), v1 + 128, (__CFArray **)(v1 + 64), (Boolean *)(v1 + 122));
  v25 = *(_DWORD *)(v1 + 132);
  *(_DWORD *)(v1 + 132) = v25 & 0xF7FFFFFF;
  v26 = *(const __CFArray **)(v1 + 64);
  if (v26)
  {
    v49.length = CFArrayGetCount(*(CFArrayRef *)(v1 + 64));
    v49.location = 0;
    v27 = CFArrayContainsValue(v26, v49, (const void *)*MEMORY[0x1E0C9B5B0]) != 0;
  }
  else
  {
    v27 = 0;
  }
  *(_BYTE *)(v1 + 123) = v27;
  if ((v25 & 0x8000000) != 0)
  {
    v29 = 1;
  }
  else
  {
    v28 = *(const __CFArray **)(v1 + 40);
    if (v28)
    {
      v50.length = CFArrayGetCount(*(CFArrayRef *)(v1 + 40));
      v50.location = 0;
      v29 = CFArrayContainsValue(v28, v50, (const void *)*MEMORY[0x1E0C9B3F0]) != 0;
    }
    else
    {
      v29 = 0;
    }
  }
  *(_BYTE *)(v1 + 124) = v29;
  if ((*(_BYTE *)(v1 + 32) & 0x40) != 0)
  {
    v30 = strlen((const char *)__dst);
    *(_QWORD *)(v1 + 544) = v30;
    *(_QWORD *)(v1 + 536) = CFURLCreateFromFileSystemRepresentation(*(CFAllocatorRef *)(v1 + 16), __dst, v30, 1u);
    v31 = *(_QWORD *)(v1 + 544);
    if (__dst[v31 - 1] != 47)
      *(_QWORD *)(v1 + 544) = v31 + 1;
  }
  if (*(_BYTE *)(v1 + 121))
    v32 = (__int128 *)(v1 + 128);
  else
    v32 = 0;
  v33 = DirEnumOpen((const char *)__dst, v32);
  *(_QWORD *)(v1 + 160) = v33;
  if (!v33)
  {
    v34 = *(const __CFAllocator **)(v1 + 16);
    v35 = __error();
    result = _CFErrorWithPOSIXPathAndErrno(v34, *v35, (const char *)__dst);
LABEL_12:
    *(_QWORD *)(v1 + 112) = result;
    if (!result)
      return result;
    goto LABEL_13;
  }
  result = *(CFErrorRef *)(v1 + 112);
  if (result)
LABEL_13:
    *(_BYTE *)(v1 + 120) = 1;
  return result;
}

BOOL _FSURLResourceIsReachable(const __CFString *a1, CFErrorRef *a2)
{
  int v4;
  _BOOL4 v5;
  _BOOL8 v6;
  CFErrorRef v7;
  const __CFAllocator *v8;
  uint64_t v9;
  const __CFAllocator *v10;
  stat v12;
  UInt8 buffer[1024];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  if (!a1)
  {
    if (!a2)
      return 0;
    v7 = CFErrorCreate((CFAllocatorRef)*MEMORY[0x1E0C9AE00], (CFErrorDomain)*MEMORY[0x1E0C9AFB8], 4, 0);
    goto LABEL_11;
  }
  if (!CFURLGetFileSystemRepresentation((CFURLRef)a1, 1u, buffer, 1024))
  {
    if (!a2)
      return 0;
    v8 = CFGetAllocator(a1);
    v7 = _FSURLCreateStandardError(v8, (const __CFString *)*MEMORY[0x1E0C9AFB8], 4, 0, a1, 0);
LABEL_11:
    v6 = 0;
    goto LABEL_17;
  }
  if (faccessat(-2, (const char *)buffer, 0, 48))
  {
    if (*__error() == 22)
    {
      v4 = lstat((const char *)buffer, &v12);
      v5 = v4 != 0;
      v6 = v4 == 0;
      if (!a2)
      {
LABEL_18:
        if (!a2)
          return v6;
        goto LABEL_19;
      }
    }
    else
    {
      v6 = 0;
      v5 = 1;
      if (!a2)
        goto LABEL_18;
    }
    if (!v5)
      goto LABEL_18;
    v9 = *__error();
    v10 = CFGetAllocator(a1);
    v7 = _FSURLCreateStandardError(v10, (const __CFString *)*MEMORY[0x1E0C9AFD0], v9, 0, a1, 0);
LABEL_17:
    *a2 = v7;
    goto LABEL_18;
  }
  v6 = 1;
  if (!a2)
    return v6;
LABEL_19:
  if (!v6)
  {
    if (*a2)
      return 0;
    if (os_log_type_enabled((os_log_t)defaultLog, OS_LOG_TYPE_ERROR))
      _FSURLResourceIsReachable_cold_1();
    v6 = 0;
    *a2 = CFErrorCreate((CFAllocatorRef)*MEMORY[0x1E0C9AE00], (CFErrorDomain)*MEMORY[0x1E0C9AFB8], 256, 0);
  }
  return v6;
}

CFErrorRef _FSURLCreateStandardError(const __CFAllocator *a1, const __CFString *a2, uint64_t a3, int a4, const __CFString *cf, void *a6)
{
  const __CFString *v7;
  CFTypeID v12;
  const __CFURL *v13;
  const __CFURL *v14;
  const __CFURL *v15;
  const __CFAllocator *v16;
  Boolean HasSuffix;
  const __CFString *v18;
  CFErrorRef v19;
  CFIndex v20;
  CFErrorRef v21;
  CFIndex code;
  void *userInfoValues[2];
  __int128 v25;
  __int128 v26;
  void *userInfoKeys[2];
  __int128 v28;
  __int128 v29;
  uint64_t v30;

  v7 = cf;
  v30 = *MEMORY[0x1E0C80C00];
  if (!cf)
  {
    v13 = 0;
    goto LABEL_10;
  }
  v12 = CFGetTypeID(cf);
  if (v12 == CFURLGetTypeID())
  {
    v13 = (const __CFURL *)CFRetain(v7);
    v14 = CFURLCopyAbsoluteURL(v13);
    if (v14)
    {
      v15 = v14;
      v7 = CFURLCopyFileSystemPath(v14, kCFURLPOSIXPathStyle);
      CFRelease(v15);
      goto LABEL_10;
    }
  }
  else
  {
    if (v12 == CFStringGetTypeID())
    {
      v7 = (const __CFString *)CFRetain(v7);
      v16 = CFGetAllocator(v7);
      HasSuffix = CFStringHasSuffix(v7, CFSTR("/"));
      v13 = CFURLCreateWithFileSystemPath(v16, v7, kCFURLPOSIXPathStyle, HasSuffix);
      goto LABEL_10;
    }
    v13 = 0;
  }
  v7 = 0;
LABEL_10:
  v28 = 0u;
  v29 = 0u;
  v26 = 0u;
  *(_OWORD *)userInfoKeys = 0u;
  *(_OWORD *)userInfoValues = 0u;
  v25 = 0u;
  code = 0;
  _FSURLTranslateDomainAndCodeToCocoaError(a2, a3, a4, &code);
  v18 = (const __CFString *)*MEMORY[0x1E0C9AFB8];
  if ((const __CFString *)*MEMORY[0x1E0C9AFB8] == a2)
  {
    v19 = 0;
    if (v13)
    {
LABEL_12:
      userInfoKeys[0] = *(void **)MEMORY[0x1E0C9AFF8];
      userInfoValues[0] = v13;
      v20 = 1;
      if (!v7)
        goto LABEL_14;
      goto LABEL_13;
    }
  }
  else
  {
    v19 = CFErrorCreate(a1, a2, a3, 0);
    if (v13)
      goto LABEL_12;
  }
  v20 = 0;
  if (v7)
  {
LABEL_13:
    *(_QWORD *)((unint64_t)userInfoKeys | (8 * v20)) = *MEMORY[0x1E0C9AFD8];
    *(_QWORD *)((unint64_t)userInfoValues & 0xFFFFFFFFFFFFFFF7 | (8 * (v20++ & 1))) = v7;
  }
LABEL_14:
  if (a6)
  {
    userInfoKeys[v20] = CFSTR("NSURLKeys");
    userInfoValues[v20++] = a6;
  }
  if (v19)
  {
    userInfoKeys[v20] = (void *)*MEMORY[0x1E0C9B000];
    userInfoValues[v20++] = v19;
  }
  v21 = CFErrorCreateWithUserInfoKeysAndValues(a1, v18, code, (const void *const *)userInfoKeys, (const void *const *)userInfoValues, v20);
  if (v13)
    CFRelease(v13);
  if (v7)
    CFRelease(v7);
  if (v19)
    CFRelease(v19);
  if (!v21)
  {
    if (os_log_type_enabled((os_log_t)defaultLog, OS_LOG_TYPE_ERROR))
      _FSURLCreateStandardError_cold_1();
    return CFErrorCreate((CFAllocatorRef)*MEMORY[0x1E0C9AE00], v18, 256, 0);
  }
  return v21;
}

uint64_t _FSURLTranslateDomainAndCodeToCocoaError(const void *a1, uint64_t a2, int a3, uint64_t *a4)
{
  const void *v7;
  uint64_t result;
  const void *v9;

  v7 = a1;
  result = CFEqual(a1, (CFTypeRef)*MEMORY[0x1E0C9AFB8]);
  if (!(_DWORD)result)
  {
    if (CFEqual(v7, (CFTypeRef)*MEMORY[0x1E0C9AFC8]))
    {
      if ((int)a2 > -62)
      {
        switch((int)a2)
        {
          case -54:
            a2 = 1;
            goto LABEL_39;
          case -53:
          case -52:
          case -49:
          case -47:
          case -46:
          case -45:
          case -44:
          case -41:
          case -40:
          case -39:
          case -38:
            goto LABEL_25;
          case -51:
            a2 = 9;
            goto LABEL_39;
          case -50:
            a2 = 22;
            goto LABEL_39;
          case -48:
            a2 = 17;
            goto LABEL_39;
          case -43:
            goto LABEL_21;
          case -42:
            a2 = 24;
            goto LABEL_39;
          case -37:
            a2 = 63;
            goto LABEL_39;
          case -36:
            a2 = 5;
            goto LABEL_39;
          case -35:
            a2 = 6;
            goto LABEL_39;
          case -34:
            a2 = 28;
            goto LABEL_39;
          default:
            if ((_DWORD)a2 == -61)
            {
              a2 = 30;
            }
            else
            {
              if ((_DWORD)a2)
                goto LABEL_25;
              a2 = 0;
            }
            break;
        }
        goto LABEL_39;
      }
      if ((int)a2 > -1310)
      {
        if ((int)a2 > -129)
        {
          if ((_DWORD)a2 == -128)
          {
            a2 = 89;
            goto LABEL_39;
          }
          if ((_DWORD)a2 == -120)
          {
LABEL_21:
            a2 = 2;
            goto LABEL_39;
          }
        }
        else
        {
          if ((_DWORD)a2 == -1309)
          {
            a2 = 27;
            goto LABEL_39;
          }
          if ((_DWORD)a2 == -1303)
          {
            a2 = 18;
            goto LABEL_39;
          }
        }
      }
      else if ((int)a2 > -1426)
      {
        if ((_DWORD)a2 == -1425)
        {
          a2 = 69;
          goto LABEL_39;
        }
        if ((_DWORD)a2 == -1407)
        {
          a2 = 20;
          goto LABEL_39;
        }
      }
      else
      {
        if ((_DWORD)a2 == -5023)
        {
          a2 = 80;
          goto LABEL_39;
        }
        if ((_DWORD)a2 == -5000)
        {
          a2 = 13;
LABEL_39:
          v9 = (const void *)*MEMORY[0x1E0C9AFD0];
          v7 = (const void *)*MEMORY[0x1E0C9AFD0];
LABEL_40:
          result = CFEqual(v7, v9);
          if (!(_DWORD)result)
          {
            if (a3)
              a2 = 512;
            else
              a2 = 256;
            goto LABEL_2;
          }
          if (a3)
          {
            if (a2 > 27)
            {
              if (a2 > 62)
              {
                if (a2 == 63)
                {
                  a2 = 514;
                  goto LABEL_2;
                }
                if (a2 != 69)
                  goto LABEL_68;
              }
              else if (a2 != 28)
              {
                if (a2 == 30)
                {
                  a2 = 642;
                  goto LABEL_2;
                }
LABEL_68:
                a2 = 512;
                goto LABEL_2;
              }
              a2 = 640;
              goto LABEL_2;
            }
            switch(a2)
            {
              case 1:
                goto LABEL_58;
              case 2:
                a2 = 4;
                goto LABEL_2;
              case 13:
LABEL_58:
                a2 = 513;
                goto LABEL_2;
            }
            goto LABEL_68;
          }
          if (a2 <= 12)
          {
            if (a2 != 1)
            {
              if (a2 == 2)
              {
                a2 = 260;
                goto LABEL_2;
              }
              goto LABEL_70;
            }
          }
          else if (a2 != 13)
          {
            if (a2 == 27)
            {
              a2 = 263;
              goto LABEL_2;
            }
            if (a2 == 63)
            {
              a2 = 258;
              goto LABEL_2;
            }
LABEL_70:
            a2 = 256;
            goto LABEL_2;
          }
          a2 = 257;
          goto LABEL_2;
        }
      }
    }
LABEL_25:
    v9 = (const void *)*MEMORY[0x1E0C9AFD0];
    goto LABEL_40;
  }
LABEL_2:
  *a4 = a2;
  return result;
}

uint64_t DirEnumOpen(const char *a1, __int128 *a2)
{
  size_t v3;
  void *v4;
  uint64_t v5;
  unsigned int v6;
  __int128 v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  int v12;
  uint64_t v13;
  unint64_t v14;
  uint64_t v15;
  int v16;
  uint64_t v17;
  unint64_t v18;
  uint64_t v19;
  int v20;
  uint64_t v21;
  uint64_t v22;
  _OWORD *v23;
  _QWORD *v24;
  _OWORD *v25;
  _OWORD *v26;
  _QWORD *v27;
  void *v28;
  int v30;
  _OWORD v31[2];
  int v32;
  __int128 v33;
  uint64_t v34;
  char v35;
  char v36;
  char v37;
  uint64_t v38;

  v3 = strlen(a1);
  v4 = malloc_type_calloc(1uLL, 0x748uLL, 0x10A0040CD28BF90uLL);
  if (!v4)
  {
    v30 = *__error();
LABEL_124:
    v5 = 0;
    *__error() = v30;
    return v5;
  }
  v5 = (uint64_t)v4;
  if ((unint64_t)__strlcpy_chk() > 0x6FC)
  {
    v30 = 63;
LABEL_123:
    free((void *)v5);
    goto LABEL_124;
  }
  v6 = -1610350579;
  if (a2)
  {
    v7 = *a2;
    *(_QWORD *)(v5 + 1812) = *((_QWORD *)a2 + 2);
    *(_OWORD *)(v5 + 1796) = v7;
    v6 = *(_DWORD *)(v5 + 1800) | 0xA004000D;
    *(_DWORD *)(v5 + 1800) = v6;
    *(_DWORD *)(v5 + 1808) |= 4u;
  }
  else
  {
    *(_DWORD *)(v5 + 1796) = 5;
    *(_OWORD *)(v5 + 1800) = xmmword_1817D5350;
    *(_DWORD *)(v5 + 1816) = 0;
  }
  v8 = 794;
  if ((v6 & 2) == 0)
    v8 = 790;
  if ((v6 & 0x10) != 0)
    v8 += 4;
  if ((v6 & 0x20) != 0)
    v8 += 8;
  if ((v6 & 0x40) != 0)
    v8 += 8;
  if ((v6 & 0x80) != 0)
    v8 += 8;
  if ((v6 & 0x100) != 0)
    v8 += 4;
  if ((v6 & 0x200) != 0)
    v8 += 16;
  if ((v6 & 0x400) != 0)
    v8 += 16;
  if ((v6 & 0x800) != 0)
    v8 += 16;
  if ((v6 & 0x1000) != 0)
    v8 += 16;
  if ((v6 & 0x2000) != 0)
    v8 += 16;
  if ((v6 & 0x4000) != 0)
    v8 += 32;
  if ((v6 & 0x8000) != 0)
    v8 += 4;
  if ((v6 & 0x10000) != 0)
    v8 += 4;
  if ((v6 & 0x20000) != 0)
    v8 += 4;
  v9 = 8;
  if ((v6 & 0x80000) != 0)
    v10 = 8;
  else
    v10 = 4;
  v11 = v8 + v10;
  if ((v6 & 0x100000) != 0)
    v11 += 4;
  if ((v6 & 0x200000) != 0)
    v11 += 4;
  if ((v6 & 0x400000) != 0)
    v11 += 264;
  if ((v6 & 0x800000) != 0)
    v11 += 16;
  if ((v6 & 0x1000000) != 0)
    v11 += 16;
  if ((v6 & 0x2000000) != 0)
    v11 += 8;
  if ((v6 & 0x4000000) != 0)
    v11 += 8;
  if ((v6 & 0x8000000) != 0)
    v11 += 1032;
  if ((v6 & 0x10000000) != 0)
    v11 += 16;
  if ((v6 & 0x40000000) == 0)
    v9 = 4;
  v12 = *(_DWORD *)(v5 + 1808);
  if (v12)
  {
    v13 = 4 * (v12 & 1);
    if ((v12 & 2) != 0)
      v13 += 4;
    if ((v12 & 4) != 0)
      v13 += 4;
    if ((v12 & 8) != 0)
      v13 += 8;
    if ((v12 & 0x10) != 0)
      v13 += 4;
    if ((v12 & 0x20) != 0)
      v14 = v13 + 8;
    else
      v14 = v13;
  }
  else
  {
    v14 = 0;
  }
  v15 = v11 + v9;
  v16 = *(_DWORD *)(v5 + 1812);
  if (v16)
  {
    v17 = 4 * (v16 & 3);
    if ((v16 & 4) != 0)
      v17 += 8;
    if ((v16 & 8) != 0)
      v17 += 4;
    if ((v16 & 0x20) != 0)
      v17 += 4;
    if ((v16 & 0x80) != 0)
      v17 += 4;
    if ((v16 & 0x100) != 0)
      v17 += 8;
    if ((v16 & 0x200) != 0)
      v17 += 8;
    if ((v16 & 0x400) != 0)
      v17 += 8;
    if ((v16 & 0x1000) != 0)
      v17 += 8;
    if ((v16 & 0x2000) != 0)
      v18 = v17 + 8;
    else
      v18 = v17;
  }
  else
  {
    v18 = 0;
  }
  v19 = v15 + 20;
  v20 = *(_DWORD *)(v5 + 1816);
  if (v20)
  {
    v21 = (2 * v20) & 8;
    if ((v20 & 8) != 0)
      v21 += 8;
    if ((v20 & 0x10) != 0)
      v22 = v21 + 8;
    else
      v22 = v21;
  }
  else
  {
    v22 = 0;
  }
  if (v14 <= v18)
    v14 = v18;
  *(_QWORD *)(v5 + 1824) = v14 + v19 + v22;
  *(_BYTE *)(v5 + 1833) = 0;
  *(_OWORD *)(v5 + 1848) = 0u;
  v23 = DirEnumEntryAllocate(v5);
  if (!v23)
  {
    v30 = *__error();
    goto LABEL_123;
  }
  v24 = v23;
  *(_QWORD *)(v5 + 1840) = v23;
  *((_DWORD *)v23 + 12) = 0;
  *((_BYTE *)v23 + 52) &= ~1u;
  v25 = DirEnumEntryAllocate(v5);
  if (!v25)
  {
    v30 = *__error();
LABEL_122:
    free(*(void **)(v5 + 1840));
    goto LABEL_123;
  }
  v26 = v25;
  *v24 = v25;
  *(_QWORD *)v25 = 0;
  *((_QWORD *)v25 + 1) = v5;
  *((_QWORD *)v25 + 4) = v3;
  v27 = v25 + 2;
  *((_QWORD *)v25 + 2) = v3;
  *((_QWORD *)v25 + 5) = 0;
  *((_DWORD *)v25 + 12) = 1;
  *((_BYTE *)v25 + 52) = *((_BYTE *)v25 + 52) & 0xFC | 1;
  v28 = malloc_type_malloc(*(_QWORD *)(v5 + 1824), 0xADC40DF8uLL);
  *((_QWORD *)v26 + 7) = v28;
  if (!v28)
  {
    v30 = *__error();
LABEL_121:
    free(**(void ***)(v5 + 1840));
    goto LABEL_122;
  }
  if (GetattrlistRetry(*((char **)v26 + 1), (_DWORD *)(v5 + 1796), (void **)v26 + 7, *(_QWORD *)(v5 + 1824)))
  {
    v30 = *__error();
LABEL_120:
    free(*((void **)v26 + 7));
    goto LABEL_121;
  }
  v38 = 0;
  if (!ParseAttributes(*((_DWORD **)v26 + 7), (_DWORD *)&v38 + 1, (_QWORD *)v26 + 3, v27, (_DWORD *)v26 + 16, &v38, &v37, &v36, &v35))
  {
    v30 = 22;
    goto LABEL_120;
  }
  if ((_DWORD)v38 != 2)
  {
    v30 = 20;
    goto LABEL_120;
  }
  *(_DWORD *)(v5 + 1792) = *((_DWORD *)v26 + 16);
  v34 = 0;
  v33 = xmmword_1817D5360;
  memset(v31, 0, sizeof(v31));
  v32 = 0;
  if (!getattrlist((const char *)v5, &v33, v31, 0x24uLL, 0))
    *(_BYTE *)(v5 + 1832) = (WORD4(v31[0]) & 0x4000) != 0;
  *((_QWORD *)v26 + 9) = 0;
  return v5;
}

uint64_t _FSURLGetAttrListForPropertyKeys(int a1, CFArrayRef theArray, uint64_t a3, __CFArray **a4, Boolean *a5)
{
  CFIndex Count;
  CFIndex v9;
  CFIndex i;
  const void *ValueAtIndex;
  const void *Value;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  __CFArray *Mutable;
  uint64_t v17;
  char *v18;
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  int v22;
  unint64_t v23;
  unint64_t v24;
  uint64_t v25;
  int v26;
  int v27;
  BOOL v28;
  uint64_t v29;
  int v30;
  int v31;
  const __CFAllocator *v33;
  uint64_t v34;
  char *v35;
  uint64_t v36;
  int v37;
  _DWORD *v38;
  int v39;
  uint64_t v40;
  int v41;
  unsigned __int8 v42;
  uint64_t v43;
  char *v44;
  _OWORD v47[4];
  _OWORD v48[4];
  int64_t v49;
  int64_t v50;
  uint64_t v51;
  int v52;
  uint64_t v53;

  v53 = *MEMORY[0x1E0C80C00];
  if (initGlobalsOnce(void)::onceToken == -1)
  {
    if (theArray)
      goto LABEL_3;
    return 0;
  }
  dispatch_once(&initGlobalsOnce(void)::onceToken, &__block_literal_global_3);
  if (!theArray)
    return 0;
LABEL_3:
  if (a5)
    *a5 = 0;
  Count = CFArrayGetCount(theArray);
  if (!Count)
    return 0;
  v9 = Count;
  memset(v48, 0, 60);
  memset(v47, 0, 60);
  if (Count >= 1)
  {
    for (i = 0; i != v9; ++i)
    {
      ValueAtIndex = CFArrayGetValueAtIndex(theArray, i);
      Value = CFDictionaryGetValue((CFDictionaryRef)qword_1ECD2A668, ValueAtIndex);
      if (Value)
      {
        v13 = (uint64_t)Value;
        addPropertyAndDependenciesToBitmap((uint64_t)Value, (uint64_t)v48);
        if (a4 && qword_1ECD2A658 != **(_DWORD **)(v13 + 140))
          addPropertyAndDependenciesToBitmap(v13, (uint64_t)v47);
        if (a5 && !*a5 && qword_1ECD2A660 == **(_DWORD **)(v13 + 140))
          *a5 = CFEqual(*(CFTypeRef *)(*(_QWORD *)v13 + 8), CFSTR("__kCFURLCheapVolumeInformationKey"));
      }
    }
  }
  v14 = qword_1ECD2A658;
  if (a4)
  {
    v15 = (char *)v47 + 12 * qword_1ECD2A658;
    *((_DWORD *)v15 + 2) = 0;
    *(_QWORD *)v15 = 0;
    if (qword_1ECD2A538 < 1)
    {
      Mutable = 0;
    }
    else
    {
      Mutable = 0;
      v17 = 0;
      do
      {
        v18 = (char *)v47 + 12 * v17;
        v19 = *(_QWORD *)v18;
        v50 = 0;
        v51 = v19;
        v52 = *((_DWORD *)v18 + 2);
        v49 = 0;
        if (PropertyMaskIsNotZero((uint64_t)&v51, (unint64_t *)&v50, &v49) && v50 <= v49)
        {
          v20 = &sFileProviderGlobals[7 * v17 + 8];
          v21 = v51;
          v22 = v52;
          v23 = 148 * v50;
          v24 = v49 - v50 + 1;
          do
          {
            v25 = *v20;
            v26 = *(_DWORD *)(*v20 + v23 + 136);
            v27 = 1 << v26;
            v28 = v26 < 64;
            if (v26 >= 64)
              v29 = 0;
            else
              v29 = 1 << v26;
            if (v28)
              v30 = 0;
            else
              v30 = v27;
            v31 = v30 & v22;
            if ((v29 & v21) != 0 || v31 != 0)
            {
              if (Mutable
                || (v33 = CFGetAllocator(*(CFTypeRef *)(v25 + v23 + 8)),
                    (Mutable = CFArrayCreateMutable(v33, 0, MEMORY[0x1E0C9B378])) != 0))
              {
                CFArrayAppendValue(Mutable, *(const void **)(v25 + v23 + 8));
              }
            }
            v23 += 148;
            --v24;
          }
          while (v24);
        }
        ++v17;
      }
      while (v17 < qword_1ECD2A538);
      v14 = qword_1ECD2A658;
    }
    *a4 = Mutable;
  }
  LOBYTE(v52) = 0;
  v51 = 0;
  v34 = SHIDWORD(sFileProviderGlobals[7 * v14 + 2]);
  if ((int)v34 >= 1)
  {
    v35 = (char *)v48 + 12 * v14;
    v36 = *(_QWORD *)v35;
    v37 = *((_DWORD *)v35 + 2);
    v38 = (_DWORD *)sFileProviderGlobals[7 * v14 + 8];
    do
    {
      v39 = v38[34];
      v40 = 1 << v39;
      if (v39 >= 64)
        v40 = 0;
      if ((v40 & v36) != 0 || (v39 >= 64 ? (v41 = 1 << v39) : (v41 = 0), (v41 & v37) != 0))
      {
        *((_BYTE *)&v51 + *(_QWORD *)(*(_QWORD *)v38 + 16)) = 1;
        LOBYTE(v51) = 1;
      }
      v38 += 37;
      --v34;
    }
    while (v34);
  }
  v42 = 0;
  v43 = 0;
  v44 = &corePropertyAttrListTable[20];
  do
  {
    if (*((_BYTE *)&v51 + v43))
    {
      *(int8x16_t *)(a3 + 4) = vorrq_s8(*(int8x16_t *)(a3 + 4), *((int8x16_t *)v44 - 1));
      *(_DWORD *)(a3 + 20) |= *(_DWORD *)v44;
      v42 = 1;
    }
    ++v43;
    v44 += 24;
  }
  while (v43 != 9);
  return v42;
}

uint64_t GetattrlistRetry(char *a1, _DWORD *a2, void **a3, size_t a4)
{
  uint64_t result;
  size_t v9;
  void *v10;

  result = filtered_getattrlist(a1, a2, *a3, a4, 0x25u);
  if (!(_DWORD)result)
  {
    v9 = *(unsigned int *)*a3;
    if (v9 <= a4)
    {
      return 0;
    }
    else
    {
      if (v9 > 0x10000)
      {
        syslog(3, "GetattrlistRetry: realloc request too large (%d)", *(_DWORD *)*a3);
        *__error() = 12;
      }
      else
      {
        v10 = malloc_type_realloc(*a3, *(unsigned int *)*a3, 0xC3C97953uLL);
        if (v10)
        {
          *a3 = v10;
          return filtered_getattrlist(a1, a2, v10, v9, 0x21u);
        }
      }
      return 0xFFFFFFFFLL;
    }
  }
  return result;
}

uint64_t valueOfBoolean(const __CFBoolean *a1)
{
  CFTypeID v2;
  BOOL v3;
  int valuePtr;

  v2 = CFGetTypeID(a1);
  if (v2 != CFNumberGetTypeID())
    return CFBooleanGetValue(a1);
  valuePtr = 0;
  if (CFNumberGetValue(a1, kCFNumberSInt32Type, &valuePtr))
    v3 = valuePtr == 0;
  else
    v3 = 1;
  return !v3;
}

void _FileCacheClearPropertyValueForKey(uint64_t a1, const void *a2)
{
  __CFDictionary *v4;
  int v5;

  _FileCacheLock(a1);
  v4 = *(__CFDictionary **)(a1 + 288);
  if (v4)
    CFDictionaryRemoveValue(v4, a2);
  v5 = *(_DWORD *)(a1 + 32) - 1;
  *(_DWORD *)(a1 + 32) = v5;
  if (!v5)
  {
    *(_QWORD *)(a1 + 24) = 0;
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 36));
  }
}

void _URLEnumeratorFinalize(const void *a1)
{
  const void *v2;
  const void *v3;
  void *v4;
  uint64_t v5;
  const void *v6;
  const void *v7;
  const void *v8;
  _QWORD *v9;
  const void *v10;

  v2 = (const void *)*((_QWORD *)a1 + 5);
  if (v2)
    CFRelease(v2);
  v3 = (const void *)*((_QWORD *)a1 + 6);
  if (v3)
    CFRelease(v3);
  v4 = (void *)*((_QWORD *)a1 + 9);
  if (v4)
  {
    if (*((uint64_t *)a1 + 10) >= 1)
    {
      v5 = 0;
      do
        CFRelease(*(CFTypeRef *)(*((_QWORD *)a1 + 9) + 8 * v5++));
      while (v5 < *((_QWORD *)a1 + 10));
      v4 = (void *)*((_QWORD *)a1 + 9);
    }
    CFAllocatorDeallocate(*((CFAllocatorRef *)a1 + 2), v4);
  }
  v6 = (const void *)*((_QWORD *)a1 + 8);
  if (v6)
    CFRelease(v6);
  v7 = (const void *)*((_QWORD *)a1 + 12);
  if (v7)
    CFRelease(v7);
  v8 = (const void *)*((_QWORD *)a1 + 14);
  if (v8)
    CFRelease(v8);
  v9 = (_QWORD *)*((_QWORD *)a1 + 20);
  if (v9)
    DirEnumClose(v9);
  v10 = (const void *)*((_QWORD *)a1 + 67);
  if (v10)
    CFRelease(v10);
}

uint64_t DirEnumClose(_QWORD *a1)
{
  _QWORD *v2;
  _QWORD *v3;
  _QWORD *v4;
  _QWORD *v5;
  void *v6;

  v2 = (_QWORD *)a1[230];
  if (v2)
  {
    do
    {
      v3 = (_QWORD *)*v2;
      DirEnumEntryFree((uint64_t)a1, (uint64_t)v2);
      v2 = v3;
    }
    while (v3);
  }
  v4 = (_QWORD *)a1[231];
  if (v4)
  {
    do
    {
      v5 = (_QWORD *)*v4;
      free(v4);
      v4 = v5;
    }
    while (v5);
  }
  v6 = (void *)a1[232];
  if (v6)
    free(v6);
  free(a1);
  return 0;
}

void observerCall(__CFRunLoopObserver *a1, unint64_t a2, void *a3)
{
  int v4;
  __CFRunLoop *Current;

  v4 = seedGlobals;
  if (seedGlobals < 0)
    v4 = -1;
  seedGlobals = v4 + 1;
  Current = CFRunLoopGetCurrent();
  CFRunLoopRemoveObserver(Current, a1, (CFRunLoopMode)*MEMORY[0x1E0C9B270]);
  seedGlobals = 0;
}

uint64_t _URLEnumeratorCreateForDirectoryURL(const __CFAllocator *a1, const void *a2, uint64_t a3, const __CFArray *a4)
{
  uint64_t v8;
  uint64_t v9;
  CFMutableArrayRef MutableCopy;
  unint64_t v11;
  const __CFArray *Mutable;
  CFIndex v13;
  const void *v14;
  CFIndex Count;
  const void *v16;
  CFIndex v17;
  const void *v18;
  CFIndex v19;
  const void *v20;
  CFRange v22;
  CFRange v23;
  CFRange v24;
  CFRange v25;

  v8 = _URLEnumeratorCreate(a1);
  v9 = v8;
  if (v8)
  {
    *(_QWORD *)(v8 + 16) = a1;
    *(_QWORD *)(v8 + 32) = a3;
    if (a4)
    {
      MutableCopy = CFArrayCreateMutableCopy(a1, 0, a4);
      a3 = *(_QWORD *)(v9 + 32);
    }
    else
    {
      MutableCopy = 0;
    }
    *(_QWORD *)(v9 + 40) = MutableCopy;
    if ((a3 & 0x40) == 0)
    {
      if (CFURLIsFileReferenceURL((CFURLRef)a2))
      {
        if (_CFURLGetVolumePropertyFlags())
          v11 = *(_QWORD *)(v9 + 32) & 0xFFFFFFFFFFFFFFFBLL;
        else
          v11 = *(_QWORD *)(v9 + 32) & 0xFFFFFFFFFFFFFFFBLL;
LABEL_11:
        *(_QWORD *)(v9 + 32) = v11;
        if ((v11 & 0xE) == 0)
        {
LABEL_30:
          *(_QWORD *)(v9 + 48) = CFRetain(a2);
          _SetHashCode((_QWORD *)v9);
          return v9;
        }
        Mutable = *(const __CFArray **)(v9 + 40);
        if (Mutable)
        {
          if ((v11 & 2) == 0)
            goto LABEL_19;
        }
        else
        {
          Mutable = CFArrayCreateMutable(a1, 0, MEMORY[0x1E0C9B378]);
          *(_QWORD *)(v9 + 40) = Mutable;
          if ((*(_QWORD *)(v9 + 32) & 2) == 0)
          {
LABEL_19:
            if ((*(_BYTE *)(v9 + 32) & 4) != 0)
            {
              Count = CFArrayGetCount(*(CFArrayRef *)(v9 + 40));
              v16 = (const void *)*MEMORY[0x1E0C9AD78];
              if (!Count
                || (v23.length = Count - 1,
                    v23.location = 0,
                    !CFArrayContainsValue(*(CFArrayRef *)(v9 + 40), v23, (const void *)*MEMORY[0x1E0C9AD78])))
              {
                CFArrayAppendValue(*(CFMutableArrayRef *)(v9 + 40), v16);
              }
              v17 = CFArrayGetCount(*(CFArrayRef *)(v9 + 40));
              v18 = (const void *)*MEMORY[0x1E0C9AC50];
              if (!v17
                || (v24.length = v17 - 1,
                    v24.location = 0,
                    !CFArrayContainsValue(*(CFArrayRef *)(v9 + 40), v24, (const void *)*MEMORY[0x1E0C9AC50])))
              {
                CFArrayAppendValue(*(CFMutableArrayRef *)(v9 + 40), v18);
              }
            }
            if ((*(_BYTE *)(v9 + 32) & 8) != 0)
            {
              v19 = CFArrayGetCount(*(CFArrayRef *)(v9 + 40));
              v20 = (const void *)*MEMORY[0x1E0C9B508];
              if (!v19
                || (v25.length = v19 - 1,
                    v25.location = 0,
                    !CFArrayContainsValue(*(CFArrayRef *)(v9 + 40), v25, (const void *)*MEMORY[0x1E0C9B508])))
              {
                CFArrayAppendValue(*(CFMutableArrayRef *)(v9 + 40), v20);
              }
            }
            goto LABEL_30;
          }
        }
        v13 = CFArrayGetCount(Mutable);
        v14 = (const void *)*MEMORY[0x1E0C9B4F8];
        if (!v13
          || (v22.length = v13 - 1,
              v22.location = 0,
              !CFArrayContainsValue(*(CFArrayRef *)(v9 + 40), v22, (const void *)*MEMORY[0x1E0C9B4F8])))
        {
          CFArrayAppendValue(*(CFMutableArrayRef *)(v9 + 40), v14);
        }
        goto LABEL_19;
      }
      a3 = *(_QWORD *)(v9 + 32);
    }
    v11 = a3 & 0xFFFFFFFFFFFFFFFBLL;
    goto LABEL_11;
  }
  return v9;
}

uint64_t _URLEnumeratorCreate(const __CFAllocator *a1)
{
  uint64_t Instance;
  uint64_t v2;

  if (_URLEnumeratorGetTypeID::onceToken != -1)
    dispatch_once(&_URLEnumeratorGetTypeID::onceToken, &__block_literal_global_4);
  Instance = _CFRuntimeCreateInstance();
  v2 = Instance;
  if (Instance)
    bzero((void *)(Instance + 16), 0x218uLL);
  return v2;
}

CFHashCode _SetHashCode(_QWORD *a1)
{
  const void *v2;
  uint64_t v3;
  CFHashCode result;

  v3 = a1[4];
  v2 = (const void *)a1[5];
  if (v2)
    v3 ^= CFHash(v2);
  result = a1[6];
  if (result)
  {
    result = CFHash((CFTypeRef)result);
    v3 ^= result;
  }
  a1[3] = v3;
  return result;
}

BOOL _FSURLStopAccessingSecurityScopedResource(const __CFURL *a1)
{
  SandboxExtensionCache *v2;
  os_unfair_lock_s *v3;
  _BOOL8 v4;
  int v5;
  CFTypeRef v6;
  BOOL v7;
  CFTypeRef cf;
  const __CFData *propertyValueTypeRefPtr;

  propertyValueTypeRefPtr = 0;
  if (!a1 || !_CFURLIsFileURL())
    return 0;
  v2 = (SandboxExtensionCache *)CFURLCopyResourcePropertyForKey(a1, CFSTR("_NSURLSecuritySandboxExtensionKey"), &propertyValueTypeRefPtr, 0);
  v3 = (os_unfair_lock_s *)SandboxExtensionCache::shared(v2);
  v4 = SandboxExtensionCache::release(v3, a1, propertyValueTypeRefPtr);
  if (propertyValueTypeRefPtr)
    CFRelease(propertyValueTypeRefPtr);
  cf = 0;
  v5 = CFURLCopyResourcePropertyForKey(a1, (CFStringRef)*MEMORY[0x1E0C9AD40], &cf, 0);
  v6 = cf;
  if (v5)
    v7 = cf == 0;
  else
    v7 = 1;
  if (!v7)
  {
    if (cf != (CFTypeRef)*MEMORY[0x1E0C9B0D0])
    {
      _FSURLStopAccessingSecurityScopedResource();
      v6 = cf;
    }
    CFRelease(v6);
  }
  return v4;
}

void _URLAttachSecurityScopeToFileURL(const __CFURL *a1, CFDataRef Copy)
{
  CFTypeID v4;
  CFIndex Length;
  const __CFAllocator *v6;
  __CFData *MutableCopy;
  const __CFData *v8;
  const __CFAllocator *v9;
  CFDataRef v10;
  NSObject *v11;
  NSObject *v12;
  NSObject *v13;
  NSObject *v14;
  SandboxExtensionCache *v15;
  os_unfair_lock_s *v16;

  if (a1 && _CFURLIsFileURL())
  {
    if (Copy)
    {
      v4 = CFGetTypeID(Copy);
      if (v4 == CFDataGetTypeID())
      {
        Length = CFDataGetLength(Copy);
        if (Length && !CFDataGetBytePtr(Copy)[Length - 1])
        {
          v10 = 0;
        }
        else
        {
          v6 = CFGetAllocator(Copy);
          MutableCopy = CFDataCreateMutableCopy(v6, 0, Copy);
          if (!MutableCopy)
            return;
          v8 = MutableCopy;
          CFDataAppendBytes(MutableCopy, (const UInt8 *)&_URLAttachSecurityScopeToFileURL::zero, 1);
          v9 = CFGetAllocator(Copy);
          Copy = CFDataCreateCopy(v9, v8);
          CFRelease(v8);
          v10 = Copy;
          if (!Copy)
            return;
        }
        v14 = securityScopedLog;
        if (os_log_type_enabled((os_log_t)securityScopedLog, OS_LOG_TYPE_DEBUG))
          _URLAttachSecurityScopeToFileURL_cold_3((uint64_t)a1, Copy, v14);
        _FSURLSetPermanentResourcePropertyForKey(a1, CFSTR("_NSURLSecuritySandboxExtensionKey"), Copy);
        v16 = (os_unfair_lock_s *)SandboxExtensionCache::shared(v15);
        SandboxExtensionCache::insert(v16, a1, Copy);
        if (v10)
          CFRelease(v10);
      }
      else
      {
        v13 = securityScopedLog;
        if (os_log_type_enabled((os_log_t)securityScopedLog, OS_LOG_TYPE_ERROR))
          _URLAttachSecurityScopeToFileURL_cold_4(v13);
      }
    }
    else
    {
      v12 = securityScopedLog;
      if (os_log_type_enabled((os_log_t)securityScopedLog, OS_LOG_TYPE_DEBUG))
        _URLAttachSecurityScopeToFileURL_cold_2((uint64_t)a1, v12);
      _FSURLSetPermanentResourcePropertyForKey(a1, CFSTR("_NSURLSecuritySandboxExtensionKey"), 0);
    }
  }
  else
  {
    v11 = securityScopedLog;
    if (os_log_type_enabled((os_log_t)securityScopedLog, OS_LOG_TYPE_ERROR))
      _URLAttachSecurityScopeToFileURL_cold_1((uint64_t)a1, v11);
  }
}

BOOL _FSURLStartAccessingSecurityScopedResource(const __CFURL *a1)
{
  SandboxExtensionCache *v2;
  os_unfair_lock_s *v3;
  __CFData *v4;
  BOOL v5;
  _BOOL8 v6;
  int v8;
  int v9;
  CFTypeRef v10;
  BOOL v11;
  CFTypeRef cf;
  const __CFData *propertyValueTypeRefPtr;

  propertyValueTypeRefPtr = 0;
  if (!a1 || !_CFURLIsFileURL())
    return 0;
  v2 = (SandboxExtensionCache *)CFURLCopyResourcePropertyForKey(a1, CFSTR("_NSURLSecuritySandboxExtensionKey"), &propertyValueTypeRefPtr, 0);
  v3 = (os_unfair_lock_s *)SandboxExtensionCache::shared(v2);
  v4 = SandboxExtensionCache::consume(v3, a1, propertyValueTypeRefPtr);
  if (v4)
  {
    if (v4 == propertyValueTypeRefPtr)
    {
      CFRelease(v4);
      cf = 0;
      v6 = 1;
LABEL_14:
      v9 = CFURLCopyResourcePropertyForKey(a1, (CFStringRef)*MEMORY[0x1E0C9AD40], &cf, 0);
      v10 = cf;
      if (v9)
        v11 = cf == 0;
      else
        v11 = 1;
      if (!v11)
      {
        if (cf != (CFTypeRef)*MEMORY[0x1E0C9B0D0])
        {
          _FSURLStartAccessingSecurityScopedResource();
          v10 = cf;
        }
        CFRelease(v10);
      }
      return v6;
    }
    _FSURLSetPermanentResourcePropertyForKey(a1, CFSTR("_NSURLSecuritySandboxExtensionKey"), v4);
    v5 = 0;
    v6 = 1;
  }
  else
  {
    getpid();
    v8 = sandbox_check();
    v5 = v8 != 0;
    v6 = v8 == 0;
  }
  if (propertyValueTypeRefPtr)
    CFRelease(propertyValueTypeRefPtr);
  cf = 0;
  if (!v5)
    goto LABEL_14;
  return v6;
}

uint64_t SandboxExtensionCache::shared(SandboxExtensionCache *this)
{
  if (SandboxExtensionCache::shared(void)::onceToken != -1)
    dispatch_once(&SandboxExtensionCache::shared(void)::onceToken, &__block_literal_global_5);
  return SandboxExtensionCache::shared(void)::shared;
}

__CFData *SandboxExtensionCache::consume(os_unfair_lock_s *this, CFURLRef url, const __CFData *a3)
{
  int v5;
  __CFData *result;
  BOOL v7;
  int v8;
  CFTypeRef cf;
  __CFData *v10;

  cf = 0;
  v10 = 0;
  v5 = CFURLCopyResourcePropertyForKey(url, (CFStringRef)*MEMORY[0x1E0C9B5B0], &cf, 0);
  result = 0;
  if (v5)
    v7 = cf == 0;
  else
    v7 = 1;
  if (!v7)
  {
    os_unfair_lock_lock(this);
    v8 = SandboxExtensionCache::_consume((CFDictionaryRef *)this, (const __CFString *)cf, a3, &v10);
    os_unfair_lock_unlock(this);
    CFRelease(cf);
    if ((v8 & 5) != 0)
    {
      if (v8 == 3)
      {
        if (os_log_type_enabled((os_log_t)securityScopedLog, OS_LOG_TYPE_DEBUG))
          SandboxExtensionCache::consume();
      }
      else if (os_log_type_enabled((os_log_t)securityScopedLog, OS_LOG_TYPE_ERROR))
      {
        SandboxExtensionCache::consume();
      }
      return 0;
    }
    else
    {
      return v10;
    }
  }
  return result;
}

uint64_t SandboxExtensionCache::_consume(CFDictionaryRef *this, const __CFString *a2, const __CFData *a3, const __CFData **a4)
{
  uint64_t *Item;
  uint64_t *v9;
  uint64_t v10;
  uint64_t v11;
  NSObject *v12;
  uint64_t result;
  uint64_t v14;
  NSObject *v15;
  _BOOL4 v16;
  uint64_t v17;
  int v18;
  uint64_t v19;
  __int16 v20;
  uint64_t v21;
  __int16 v22;
  const __CFString *v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  if (!a2)
    SandboxExtensionCache::_consume();
  *a4 = 0;
  Item = (uint64_t *)SandboxExtensionCache::_findItem(this, a2, a3);
  v9 = Item;
  if (a3 && !Item)
    v9 = SandboxExtensionCache::_insert(this, a2, a3);
  if (v9)
  {
    v10 = *v9;
    if (*v9)
    {
      v11 = v10 + 1;
      *v9 = v10 + 1;
      v12 = securityScopedLog;
      if (os_log_type_enabled((os_log_t)securityScopedLog, OS_LOG_TYPE_DEBUG))
      {
        v17 = v9[1];
        v18 = 134218498;
        v19 = v17;
        v20 = 2048;
        v21 = v11;
        v22 = 2112;
        v23 = a2;
        _os_log_debug_impl(&dword_1817A6000, v12, OS_LOG_TYPE_DEBUG, "handle %lld: incrementing ref count to %lld for path %@", (uint8_t *)&v18, 0x20u);
      }
      result = 0;
LABEL_17:
      *a4 = (const __CFData *)v9[2];
      return result;
    }
    CFDataGetBytePtr((CFDataRef)v9[2]);
    v14 = sandbox_extension_consume();
    v9[1] = v14;
    if ((v14 & 0x8000000000000000) == 0)
    {
      v15 = securityScopedLog;
      if (os_log_type_enabled((os_log_t)securityScopedLog, OS_LOG_TYPE_DEBUG))
        SandboxExtensionCache::_consume((uint64_t)a2, v14, v15);
      result = 0;
      *v9 = 1;
      goto LABEL_17;
    }
    v16 = os_log_type_enabled((os_log_t)securityScopedLog, OS_LOG_TYPE_ERROR);
    if (v14 == -1)
    {
      if (v16)
        SandboxExtensionCache::_consume();
    }
    else if (v16)
    {
      SandboxExtensionCache::_consume();
    }
    return 4;
  }
  else
  {
    getpid();
    if (sandbox_check())
      return 3;
    else
      return 2;
  }
}

const void *SandboxExtensionCache::_findItem(CFDictionaryRef *this, const __CFString *a2, const __CFData *a3)
{
  const void *Value;
  const void *v5;
  const void *v6;

  Value = CFDictionaryGetValue(this[1], a2);
  v5 = Value;
  if (Value && a3)
  {
    v6 = Value;
    while (!CFEqual(a3, *((CFTypeRef *)v6 + 2)))
    {
      v6 = (const void *)*((_QWORD *)v6 + 3);
      if (!v6)
        return v5;
    }
    return v6;
  }
  return v5;
}

BOOL SandboxExtensionCache::insert(os_unfair_lock_s *this, CFURLRef url, const __CFData *a3)
{
  BOOL v5;
  _BOOL8 v6;
  const __CFString *propertyValueTypeRefPtr;

  if (!url)
    SandboxExtensionCache::insert();
  if (!a3)
    SandboxExtensionCache::insert();
  propertyValueTypeRefPtr = 0;
  if (CFURLCopyResourcePropertyForKey(url, (CFStringRef)*MEMORY[0x1E0C9B5B0], &propertyValueTypeRefPtr, 0))
    v5 = propertyValueTypeRefPtr == 0;
  else
    v5 = 1;
  if (v5)
    return 0;
  os_unfair_lock_lock(this);
  v6 = SandboxExtensionCache::_insert((CFDictionaryRef *)this, propertyValueTypeRefPtr, a3) != 0;
  os_unfair_lock_unlock(this);
  CFRelease(propertyValueTypeRefPtr);
  return v6;
}

_QWORD *SandboxExtensionCache::_insert(CFDictionaryRef *this, const __CFString *a2, const __CFData *a3)
{
  CFTypeRef *Item;
  CFTypeRef *v7;
  _QWORD *v8;
  CFTypeRef *v9;
  NSObject *v10;

  if (!a2)
    SandboxExtensionCache::_insert();
  if (!a3)
    SandboxExtensionCache::_insert();
  Item = (CFTypeRef *)SandboxExtensionCache::_findItem(this, a2, a3);
  if (Item)
  {
    v7 = Item;
    if (CFEqual(a3, Item[2]))
    {
      v8 = v7;
    }
    else
    {
      v8 = (_QWORD *)operator new();
      v8[3] = 0;
      *v8 = 0;
      v8[1] = 0;
      v8[2] = CFDataCreateCopy((CFAllocatorRef)*MEMORY[0x1E0C9AE00], a3);
      do
      {
        v9 = v7;
        v7 = (CFTypeRef *)v7[3];
      }
      while (v7);
      v9[3] = v8;
    }
  }
  else
  {
    v8 = (_QWORD *)operator new();
    v8[3] = 0;
    *v8 = 0;
    v8[1] = 0;
    v8[2] = CFDataCreateCopy((CFAllocatorRef)*MEMORY[0x1E0C9AE00], a3);
    CFDictionarySetValue(this[1], a2, v8);
  }
  v10 = securityScopedLog;
  if (os_log_type_enabled((os_log_t)securityScopedLog, OS_LOG_TYPE_DEBUG))
    SandboxExtensionCache::_insert((uint64_t)this, v10);
  return v8;
}

BOOL SandboxExtensionCache::release(os_unfair_lock_s *this, CFURLRef url, const __CFData *a3)
{
  BOOL v5;
  _BOOL8 v6;
  int v7;
  int v8;
  int v9;
  CFStringRef string;
  char buffer[1024];
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  string = 0;
  if (CFURLCopyResourcePropertyForKey(url, (CFStringRef)*MEMORY[0x1E0C9B5B0], &string, 0))
    v5 = string == 0;
  else
    v5 = 1;
  if (!v5)
  {
    os_unfair_lock_lock(this);
    v7 = SandboxExtensionCache::_release((CFDictionaryRef *)this, string, a3);
    os_unfair_lock_unlock(this);
    if ((v7 & 5) != 0)
    {
      if (v7 == 3)
      {
        if (os_log_type_enabled((os_log_t)securityScopedLog, OS_LOG_TYPE_DEBUG))
          SandboxExtensionCache::release();
        bzero(buffer, 0x400uLL);
        if (CFStringGetFileSystemRepresentation(string, buffer, 1024))
        {
          if (os_log_type_enabled((os_log_t)securityScopedLog, OS_LOG_TYPE_DEBUG))
            SandboxExtensionCache::release();
          v8 = sandbox_extension_release_file();
          v6 = v8 == 0;
          if (v8)
            v9 = -2;
          else
            v9 = 2;
          *__error() = v9;
          goto LABEL_22;
        }
      }
      else if (os_log_type_enabled((os_log_t)securityScopedLog, OS_LOG_TYPE_ERROR))
      {
        SandboxExtensionCache::release();
      }
      v6 = 0;
    }
    else
    {
      v6 = 1;
    }
LABEL_22:
    CFRelease(string);
    return v6;
  }
  return 0;
}

uint64_t SandboxExtensionCache::_release(CFDictionaryRef *this, const __CFString *a2, const __CFData *a3)
{
  CacheItem *Item;
  CacheItem *v6;
  uint64_t v7;
  uint64_t v8;
  NSObject *v9;
  uint64_t v10;
  CacheItem *Value;
  BOOL v12;
  const void *v13;
  __CFDictionary *v14;
  int v15;
  NSObject *v16;
  const void *v17;

  Item = (CacheItem *)SandboxExtensionCache::_findItem(this, a2, a3);
  if (!Item)
    return 3;
  v6 = Item;
  v7 = *(_QWORD *)Item;
  if (*(uint64_t *)Item < 2)
  {
    Value = (CacheItem *)CFDictionaryGetValue(this[1], a2);
    if (Value)
      v12 = v6 == Value;
    else
      v12 = 0;
    if (v12)
    {
      v13 = (const void *)*((_QWORD *)v6 + 3);
      v14 = this[1];
      if (v13)
      {
        CFDictionarySetValue(v14, a2, v13);
        *((_QWORD *)v6 + 3) = 0;
      }
      else
      {
        CFDictionaryRemoveValue(v14, a2);
      }
    }
    else
    {
      remove(Value, v6);
    }
    v15 = sandbox_extension_release();
    v16 = securityScopedLog;
    if (v15)
    {
      if (os_log_type_enabled((os_log_t)securityScopedLog, OS_LOG_TYPE_ERROR))
        SandboxExtensionCache::_release();
      v10 = 4;
    }
    else
    {
      if (os_log_type_enabled((os_log_t)securityScopedLog, OS_LOG_TYPE_DEBUG))
        SandboxExtensionCache::_release((_QWORD *)v6 + 1, (uint64_t)a2, v16);
      v10 = 0;
      *__error() = 1;
    }
    v17 = (const void *)*((_QWORD *)v6 + 2);
    if (v17)
      CFRelease(v17);
    MEMORY[0x186DA3528](v6, 0x1060C40E6D94C38);
  }
  else
  {
    v8 = v7 - 1;
    *(_QWORD *)Item = v7 - 1;
    v9 = securityScopedLog;
    if (os_log_type_enabled((os_log_t)securityScopedLog, OS_LOG_TYPE_DEBUG))
      SandboxExtensionCache::_release((uint64_t)v6, v8, v9);
    v10 = 0;
    *__error() = 3;
  }
  return v10;
}

void remove(CacheItem *a1, CacheItem *a2)
{
  CacheItem *v3;
  NSObject *v4;

  if (!a1)
    remove();
  if (!a2)
    remove();
  while (a1)
  {
    v3 = a1;
    a1 = (CacheItem *)*((_QWORD *)a1 + 3);
    if (a1 == a2)
    {
      *((_QWORD *)v3 + 3) = *((_QWORD *)a2 + 3);
      *((_QWORD *)a2 + 3) = 0;
      return;
    }
  }
  v4 = securityScopedLog;
  if (os_log_type_enabled((os_log_t)securityScopedLog, OS_LOG_TYPE_ERROR))
    remove((uint64_t)a2, v4);
}

uint64_t ___Z19_FileCacheInitClassv_block_invoke()
{
  uint64_t result;

  result = _CFRuntimeRegisterClass();
  sFileCacheTypeID = result;
  return result;
}

_QWORD *_FileCacheCreateShallowCopy(uint64_t a1)
{
  const __CFAllocator *v2;
  _OWORD *Instance;
  _QWORD *v4;
  __int128 v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  const void *v16;
  _BYTE *v17;
  const void *v18;
  __CFFileSecurity *v19;
  CFFileSecurityRef Copy;
  const __CFDictionary *v21;
  CFIndex Count;
  CFMutableDictionaryRef MutableCopy;
  const __CFDictionary *v24;
  CFIndex v25;
  CFMutableDictionaryRef v26;
  const __CFDictionary *v27;
  CFIndex v28;
  CFMutableDictionaryRef v29;
  const __CFData *v30;
  int v31;

  if (!a1)
    return 0;
  _FileCacheLock(a1);
  v2 = CFGetAllocator((CFTypeRef)a1);
  initGlobalsOnce();
  Instance = (_OWORD *)_CFRuntimeCreateInstance();
  v4 = Instance;
  if (Instance)
  {
    v5 = *(_OWORD *)(a1 + 48);
    v6 = *(_OWORD *)(a1 + 80);
    Instance[4] = *(_OWORD *)(a1 + 64);
    Instance[5] = v6;
    Instance[3] = v5;
    v7 = *(_OWORD *)(a1 + 96);
    v8 = *(_OWORD *)(a1 + 112);
    v9 = *(_OWORD *)(a1 + 144);
    Instance[8] = *(_OWORD *)(a1 + 128);
    Instance[9] = v9;
    Instance[6] = v7;
    Instance[7] = v8;
    v10 = *(_OWORD *)(a1 + 160);
    v11 = *(_OWORD *)(a1 + 176);
    v12 = *(_OWORD *)(a1 + 208);
    Instance[12] = *(_OWORD *)(a1 + 192);
    Instance[13] = v12;
    Instance[10] = v10;
    Instance[11] = v11;
    v13 = *(_OWORD *)(a1 + 224);
    v14 = *(_OWORD *)(a1 + 240);
    v15 = *(_OWORD *)(a1 + 272);
    Instance[16] = *(_OWORD *)(a1 + 256);
    Instance[17] = v15;
    Instance[14] = v13;
    Instance[15] = v14;
    v16 = *(const void **)(a1 + 56);
    if (v16)
      v4[7] = CFRetain(v16);
    v17 = (_BYTE *)(a1 + 48);
    v18 = *(const void **)(a1 + 280);
    if (v18)
      v4[35] = CFRetain(v18);
    if ((*v17 & 0x80) == 0)
      goto LABEL_11;
    v19 = *(__CFFileSecurity **)(a1 + 272);
    if (v19)
    {
      Copy = CFFileSecurityCreateCopy(v2, v19);
      v4[34] = Copy;
      if (Copy)
        goto LABEL_11;
    }
    else if (v4[34])
    {
LABEL_11:
      v21 = *(const __CFDictionary **)(a1 + 288);
      if (v21)
      {
        Count = CFDictionaryGetCount(*(CFDictionaryRef *)(a1 + 288));
        MutableCopy = CFDictionaryCreateMutableCopy(v2, Count, v21);
      }
      else
      {
        MutableCopy = 0;
      }
      v4[36] = MutableCopy;
      v24 = *(const __CFDictionary **)(a1 + 296);
      if (v24)
      {
        v25 = CFDictionaryGetCount(*(CFDictionaryRef *)(a1 + 296));
        v26 = CFDictionaryCreateMutableCopy(v2, v25, v24);
      }
      else
      {
        v26 = 0;
      }
      v4[37] = v26;
      v27 = *(const __CFDictionary **)(a1 + 304);
      if (v27)
      {
        v28 = CFDictionaryGetCount(*(CFDictionaryRef *)(a1 + 304));
        v29 = CFDictionaryCreateMutableCopy(v2, v28, v27);
      }
      else
      {
        v29 = 0;
      }
      v4[38] = v29;
      v30 = *(const __CFData **)(a1 + 312);
      if (v30)
        v4[39] = CFDataCreateMutableCopy(v2, 0, v30);
      goto LABEL_23;
    }
    *(_DWORD *)v17 &= ~0x80u;
    goto LABEL_11;
  }
LABEL_23:
  v31 = *(_DWORD *)(a1 + 32) - 1;
  *(_DWORD *)(a1 + 32) = v31;
  if (!v31)
  {
    *(_QWORD *)(a1 + 24) = 0;
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 36));
  }
  return v4;
}

uint64_t __filtered_getattrlist_block_invoke()
{
  uint64_t result;
  BOOL v2;
  size_t v3;
  int v4;
  char v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v3 = 16;
  result = sysctlbyname("kern.osproductversion", &v4, &v3, 0, 0);
  if (!(_DWORD)result)
  {
    v2 = v4 == 825110577 && v5 == 53;
    filtered_getattrlist::isJazz = v2;
  }
  return result;
}

void ___ZL15CreateMountInfoiP12MountInfoBuf_block_invoke()
{
  NSObject *v0;
  NSObject *v1;

  atomic_store(0, sEntriesChanged);
  v0 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_UTILITY, 0);
  v1 = dispatch_queue_create("com.apple.coreservicesinternal.vfs_notifications", v0);
  if (v1)
  {
    CreateMountInfo(int,MountInfoBuf *)::source = (uint64_t)dispatch_source_create(MEMORY[0x1E0C80DD8], 0, 0x118uLL, v1);
    dispatch_source_set_event_handler((dispatch_source_t)CreateMountInfo(int,MountInfoBuf *)::source, &__block_literal_global_8_0);
    dispatch_resume((dispatch_object_t)CreateMountInfo(int,MountInfoBuf *)::source);
  }
}

void ___Z15initGlobalsOncev_block_invoke()
{
  int v0;
  int8x16_t v1;
  uint64_t v2;
  const __CFAllocator *v3;
  NSObject *v4;
  _BOOL8 v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  NSObject *v9;
  size_t v10;
  uint8_t buf[4];
  char v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  init_logging();
  v10 = 16;
  if (sysctlbyname("kern.osproductversion", buf, &v10, 0, 0)
    || bswap32(*(unsigned int *)buf) == 825241137 && 53 == v12)
  {
    v0 = 252;
  }
  else
  {
    v0 = 8188;
  }
  v1.i64[0] = 0x3FF0B7FFFFLL;
  v1.i32[2] = 14335;
  v1.i32[3] = v0;
  v2 = 8u;
  do
  {
    *(int8x16_t *)&corePropertyAttrListTable[v2] = vandq_s8(*(int8x16_t *)&corePropertyAttrListTable[v2], v1);
    v2 += 24;
  }
  while (v2 != 224);
  sFileProviderGlobals[0] = _FileCacheInitClass();
  v3 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
  qword_1ECD2A668 = (uint64_t)CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0, MEMORY[0x1E0C9B390], 0);
  qword_1ECD2A678 = (uint64_t)CFArrayCreateMutable(v3, 0, MEMORY[0x1E0C9B378]);
  v4 = defaultLog;
  v5 = os_signpost_enabled((os_log_t)defaultLog);
  if (v5)
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1817A6000, v4, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "Register Property Providers", (const char *)&unk_1817D8366, buf, 2u);
  }
  registerCoreProperties(v5);
  registerPathURLProperties(v6);
  registerVolumeProperties(v7);
  v8 = _LSRegisterFilePropertyProvider();
  registerExternalProviderProperties(v8);
  v9 = defaultLog;
  if (os_signpost_enabled((os_log_t)defaultLog))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1817A6000, v9, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "Register Property Providers", (const char *)&unk_1817D8366, buf, 2u);
  }
}

void registerExternalProviderProperties(uint64_t a1)
{
  uint64_t v1;
  uint64_t *v2;
  _QWORD *v3;
  uint64_t v4;
  __int128 v5;
  uint64_t i;
  const __CFString *v7[26];
  _OWORD v8[2];
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  {
    registerExternalProviderProperties::thumbnailsDependencyKeys = *MEMORY[0x1E0C9B418];
  }
  {
    registerExternalProviderProperties::propertyTable[0] = *MEMORY[0x1E0C9B540];
    *(_QWORD *)algn_1ECD2A768 = 0;
    qword_1ECD2A770 = (uint64_t)CopyFromFileProvider;
    unk_1ECD2A778 = 0;
    qword_1ECD2A780 = 0;
    unk_1ECD2A788 = 0;
    qword_1ECD2A790 = *MEMORY[0x1E0C9B608];
    unk_1ECD2A798 = 0;
    qword_1ECD2A7A0 = (uint64_t)CopyFromFileProvider;
    unk_1ECD2A7A8 = 0;
    qword_1ECD2A7B0 = 0;
    unk_1ECD2A7B8 = 0;
    qword_1ECD2A7C0 = *MEMORY[0x1E0C9B618];
    unk_1ECD2A7C8 = 0;
    qword_1ECD2A7D0 = (uint64_t)CopyFromFileProvider;
    unk_1ECD2A7D8 = 0;
    qword_1ECD2A7E0 = 0;
    unk_1ECD2A7E8 = 0;
    qword_1ECD2A7F0 = *MEMORY[0x1E0C9AD60];
    unk_1ECD2A7F8 = 0;
    qword_1ECD2A800 = (uint64_t)CopyFromFileProvider;
    unk_1ECD2A808 = 0;
    qword_1ECD2A810 = 0;
    unk_1ECD2A818 = 0;
    qword_1ECD2A820 = *MEMORY[0x1E0C9B600];
    unk_1ECD2A828 = 0;
    qword_1ECD2A830 = (uint64_t)CopyFromFileProvider;
    unk_1ECD2A838 = 0;
    qword_1ECD2A840 = 0;
    unk_1ECD2A848 = 0;
    qword_1ECD2A850 = *MEMORY[0x1E0C9B5F8];
    unk_1ECD2A858 = 0;
    qword_1ECD2A860 = (uint64_t)CopyFromFileProvider;
    unk_1ECD2A868 = 0;
    qword_1ECD2A870 = 0;
    unk_1ECD2A878 = 0;
    qword_1ECD2A880 = *MEMORY[0x1E0C9B648];
    unk_1ECD2A888 = 0;
    qword_1ECD2A890 = (uint64_t)CopyFromFileProvider;
    unk_1ECD2A898 = 0;
    qword_1ECD2A8A0 = 0;
    unk_1ECD2A8A8 = 0;
    qword_1ECD2A8B0 = *MEMORY[0x1E0C9B628];
    unk_1ECD2A8B8 = 0;
    qword_1ECD2A8C0 = (uint64_t)CopyFromFileProvider;
    unk_1ECD2A8C8 = 0;
    qword_1ECD2A8D0 = 0;
    unk_1ECD2A8D8 = 0;
    qword_1ECD2A8E0 = *MEMORY[0x1E0C9B630];
    unk_1ECD2A8E8 = 0;
    qword_1ECD2A8F0 = (uint64_t)CopyFromFileProvider;
    unk_1ECD2A8F8 = 0;
    qword_1ECD2A900 = 0;
    unk_1ECD2A908 = 0;
    qword_1ECD2A910 = *MEMORY[0x1E0C9B5F0];
    unk_1ECD2A918 = 0;
    qword_1ECD2A920 = (uint64_t)CopyFromFileProvider;
    unk_1ECD2A928 = 0;
    qword_1ECD2A930 = 0;
    unk_1ECD2A938 = 0;
    qword_1ECD2A940 = *MEMORY[0x1E0C9B5E8];
    unk_1ECD2A948 = 0;
    qword_1ECD2A958 = 0;
    unk_1ECD2A960 = 0;
    qword_1ECD2A950 = (uint64_t)CopyFromFileProvider;
    qword_1ECD2A968 = 0;
    qword_1ECD2A970 = *MEMORY[0x1E0C9B620];
    qword_1ECD2A978 = 0;
    qword_1ECD2A980 = (uint64_t)CopyFromFileProvider;
    qword_1ECD2A990 = 0;
    qword_1ECD2A988 = 0;
    qword_1ECD2A998 = 0;
    qword_1ECD2A9A0 = *MEMORY[0x1E0C9B668];
    qword_1ECD2A9A8 = 0;
    qword_1ECD2A9B0 = (uint64_t)CopyFromFileProvider;
    qword_1ECD2A9C0 = 0;
    qword_1ECD2A9B8 = 0;
    qword_1ECD2A9C8 = 0;
    qword_1ECD2A9D0 = *MEMORY[0x1E0C9B670];
    qword_1ECD2A9D8 = 0;
    qword_1ECD2A9E0 = (uint64_t)CopyFromFileProvider;
    qword_1ECD2A9F0 = 0;
    qword_1ECD2A9E8 = 0;
    qword_1ECD2A9F8 = 0;
    qword_1ECD2AA00 = *MEMORY[0x1E0C9B678];
    qword_1ECD2AA08 = 0;
    qword_1ECD2AA10 = (uint64_t)CopyFromFileProvider;
    qword_1ECD2AA20 = 0;
    qword_1ECD2AA18 = 0;
    qword_1ECD2AA28 = 0;
    qword_1ECD2AA30 = *MEMORY[0x1E0C9B658];
    qword_1ECD2AA38 = 0;
    qword_1ECD2AA40 = (uint64_t)CopyFromFileProvider;
    qword_1ECD2AA50 = 0;
    qword_1ECD2AA48 = 0;
    qword_1ECD2AA58 = 0;
    qword_1ECD2AA60 = *MEMORY[0x1E0C9B650];
    qword_1ECD2AA68 = 0;
    qword_1ECD2AA70 = (uint64_t)CopyFromFileProvider;
    qword_1ECD2AA80 = 0;
    qword_1ECD2AA78 = 0;
    qword_1ECD2AA88 = 0;
    qword_1ECD2AA90 = *MEMORY[0x1E0C9B660];
    qword_1ECD2AA98 = 0;
    qword_1ECD2AAA0 = (uint64_t)CopyFromFileProvider;
    qword_1ECD2AAB0 = 0;
    qword_1ECD2AAA8 = 0;
    qword_1ECD2AAB8 = 0;
    qword_1ECD2AAC0 = (uint64_t)CFSTR("NSURLUbiquitousItemIsExcludedFromSyncKey");
    qword_1ECD2AAC8 = 0;
    qword_1ECD2AAD0 = (uint64_t)CopyFromFileProvider;
    qword_1ECD2AAD8 = (uint64_t)SetWithFileProvider;
    qword_1ECD2AAE8 = 0;
    qword_1ECD2AAE0 = 0;
    qword_1ECD2AAF0 = *MEMORY[0x1E0C9B638];
    qword_1ECD2AAF8 = 0;
    qword_1ECD2AB00 = (uint64_t)CopyFromFileProvider;
    qword_1ECD2AB10 = 0;
    qword_1ECD2AB08 = 0;
    qword_1ECD2AB18 = 0;
    qword_1ECD2AB20 = *MEMORY[0x1E0C9B640];
    qword_1ECD2AB28 = 0;
    qword_1ECD2AB30 = (uint64_t)CopyFromFileProvider;
    qword_1ECD2AB40 = 0;
    qword_1ECD2AB38 = 0;
    qword_1ECD2AB48 = 0;
    qword_1ECD2AB50 = *MEMORY[0x1E0C9B610];
    qword_1ECD2AB58 = 0;
    qword_1ECD2AB60 = (uint64_t)CopyFromFileProvider;
    qword_1ECD2AB70 = 0;
    qword_1ECD2AB68 = 0;
    qword_1ECD2AB78 = 0;
    qword_1ECD2AB80 = *MEMORY[0x1E0C9AC00];
    qword_1ECD2AB88 = 0;
    qword_1ECD2AB90 = (uint64_t)GetFromCFURLPromises;
    qword_1ECD2AB98 = (uint64_t)SetWithCFURLPromises;
    qword_1ECD2ABA8 = 0;
    qword_1ECD2ABA0 = 0;
    qword_1ECD2ABB0 = *MEMORY[0x1E0C9AC08];
    qword_1ECD2ABB8 = 0;
    qword_1ECD2ABC0 = (uint64_t)GetFromCFURLPromises;
    qword_1ECD2ABC8 = (uint64_t)SetWithCFURLPromises;
    qword_1ECD2ABD8 = 0;
    qword_1ECD2ABD0 = 0;
    qword_1ECD2ABE0 = *MEMORY[0x1E0C9B5C0];
    qword_1ECD2ABE8 = 2;
    qword_1ECD2ABF0 = (uint64_t)GetFromQuickLook;
    qword_1ECD2ABF8 = (uint64_t)SetWithQuickLook;
    qword_1ECD2AC00 = (uint64_t)&registerExternalProviderProperties::thumbnailsDependencyKeys;
    qword_1ECD2AC08 = 1;
    qword_1ECD2AC10 = *MEMORY[0x1E0C9B5C8];
    qword_1ECD2AC18 = 2;
    qword_1ECD2AC20 = (uint64_t)GetFromQuickLook;
    qword_1ECD2AC28 = (uint64_t)SetWithQuickLook;
    qword_1ECD2AC30 = (uint64_t)&registerExternalProviderProperties::thumbnailsDependencyKeys;
    qword_1ECD2AC38 = 1;
  }
  v8[0] = xmmword_1E0F0B280;
  v8[1] = *(_OWORD *)&off_1E0F0B290;
  MEMORY[0x1E0C80A78](a1);
  v1 = 0;
  memset(v7, 0, sizeof(v7));
  v2 = registerExternalProviderProperties::propertyTable;
  do
  {
    v3 = v2 + 6;
    v4 = *v2;
    v2 += 12;
    *(_QWORD *)&v5 = v4;
    *((_QWORD *)&v5 + 1) = *v3;
    *(_OWORD *)&v7[v1] = v5;
    v1 += 2;
  }
  while (v1 != 26);
  _RegisterFilePropertyProvider(v8, 0, v7, 0x1AuLL);
  for (i = 0; i != 156; i += 6)
    _RegisterFilePropertyWithOptions((void *)registerExternalProviderProperties::propertyTable[i], registerExternalProviderProperties::propertyTable[i + 1], (const void **)registerExternalProviderProperties::propertyTable[i + 4], registerExternalProviderProperties::propertyTable[i + 5], (uint64_t)&registerExternalProviderProperties::propertyTable[i]);
}

void registerPathURLProperties(uint64_t a1)
{
  uint64_t v1;
  uint64_t *v2;
  __int128 v3;
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  const __CFString *v7[8];

  v7[7] = *(const __CFString **)MEMORY[0x1E0C80C00];
  {
    v6 = *MEMORY[0x1E0C9AD30];
    registerPathURLProperties(void)::parentDependencyKeys = *MEMORY[0x1E0C9B550];
    unk_1ECD2A730 = v6;
  }
  {
    registerPathURLProperties(void)::propertyTable = *MEMORY[0x1E0C9B7E8];
    qword_1ECD2AC50 = 1;
    qword_1ECD2AC58 = MEMORY[0x1E0C9B550];
    qword_1ECD2AC60 = 1;
    qword_1ECD2AC68 = *MEMORY[0x1E0C9B5A8];
    unk_1ECD2AC70 = 1;
    qword_1ECD2AC78 = (uint64_t)&registerPathURLProperties(void)::parentDependencyKeys;
    unk_1ECD2AC80 = 2;
    qword_1ECD2AC88 = *MEMORY[0x1E0C9B4E8];
    unk_1ECD2AC90 = 1;
    qword_1ECD2AC98 = 0;
    unk_1ECD2ACA0 = 0;
    qword_1ECD2ACA8 = *MEMORY[0x1E0C9B5B0];
    unk_1ECD2ACB0 = 1;
    qword_1ECD2ACB8 = 0;
    unk_1ECD2ACC0 = 0;
    qword_1ECD2ACC8 = *MEMORY[0x1E0C9AC90];
    unk_1ECD2ACD0 = 0;
    qword_1ECD2ACD8 = 0;
    unk_1ECD2ACE0 = 0;
    qword_1ECD2ACE8 = *MEMORY[0x1E0C9AC98];
    unk_1ECD2ACF0 = 0;
    qword_1ECD2ACF8 = 0;
    unk_1ECD2AD00 = 0;
  }
  MEMORY[0x1E0C80A78](a1);
  v1 = 0;
  memset(v7, 0, 48);
  v2 = &qword_1ECD2AC68;
  do
  {
    *(_QWORD *)&v3 = *(v2 - 4);
    *((_QWORD *)&v3 + 1) = *v2;
    *(_OWORD *)&v7[v1] = v3;
    v2 += 8;
    v1 += 2;
  }
  while (v1 != 6);
  _RegisterFilePropertyProvider(off_1E0F0B0E0, 0, v7, 6uLL);
  v4 = 0;
  v5 = &registerPathURLProperties(void)::propertyTable;
  do
  {
    _RegisterFilePropertyWithOptions((void *)v7[v4++], v5[1], (const void **)v5[2], v5[3], (uint64_t)v5);
    v5 += 4;
  }
  while (v4 != 6);
}

void registerVolumeProperties(uint64_t a1)
{
  uint64_t v1;
  uint64_t *v2;
  __int128 v3;
  uint64_t v4;
  const void **v5;
  const void **v6;
  __CFString *v7;
  const void *v8;
  _BOOL8 v9;
  const __CFString *v10[60];

  v10[59] = *(const __CFString **)MEMORY[0x1E0C80C00];
  {
    registerVolumeProperties(void)::propertyTable = (uint64_t)CFSTR("__kCFURLCheapVolumeInformationKey");
    qword_1ECD2AD10 = (uint64_t)CFSTR("__kCFURLNoDependsVolumeInformationKey");
    qword_1ECD2AD18 = 0;
    unk_1ECD2AD20 = 0;
    qword_1ECD2AD28 = (uint64_t)CFSTR("__kCFURLExpensiveVolumeInformationKey");
    unk_1ECD2AD30 = CFSTR("__kCFURLNoDependsVolumeInformationKey");
    qword_1ECD2AD38 = 0;
    unk_1ECD2AD40 = 0;
    qword_1ECD2AD48 = *MEMORY[0x1E0C9B718];
    unk_1ECD2AD50 = CFSTR("__kCFURLNoDependsVolumeInformationKey");
    qword_1ECD2AD58 = 0;
    unk_1ECD2AD60 = 0;
    qword_1ECD2AD68 = *MEMORY[0x1E0C9B6F8];
    unk_1ECD2AD70 = CFSTR("__kCFURLNoDependsVolumeInformationKey");
    qword_1ECD2AD78 = 0;
    unk_1ECD2AD80 = 0;
    qword_1ECD2AD88 = *MEMORY[0x1E0C9B7E0];
    unk_1ECD2AD90 = CFSTR("__kCFURLNoDependsVolumeInformationKey");
    qword_1ECD2AD98 = 0;
    unk_1ECD2ADA0 = 0;
    qword_1ECD2ADA8 = *MEMORY[0x1E0C9B6D8];
    unk_1ECD2ADB0 = CFSTR("__kCFURLCheapVolumeInformationKey");
    qword_1ECD2ADB8 = 1;
    unk_1ECD2ADC0 = createVolumeFlagValue;
    qword_1ECD2ADC8 = *MEMORY[0x1E0C9B6A8];
    unk_1ECD2ADD0 = CFSTR("__kCFURLCheapVolumeInformationKey");
    qword_1ECD2ADD8 = 2;
    unk_1ECD2ADE0 = createVolumeFlagValue;
    qword_1ECD2ADE8 = *MEMORY[0x1E0C9B6B0];
    unk_1ECD2ADF0 = CFSTR("__kCFURLCheapVolumeInformationKey");
    qword_1ECD2ADF8 = 4;
    unk_1ECD2AE00 = createNegatedVolumeFlagValue;
    qword_1ECD2AE08 = *MEMORY[0x1E0C9B6E0];
    unk_1ECD2AE10 = CFSTR("__kCFURLCheapVolumeInformationKey");
    qword_1ECD2AE18 = 8;
    unk_1ECD2AE20 = createVolumeFlagValue;
    qword_1ECD2AE28 = *MEMORY[0x1E0C9B6B8];
    unk_1ECD2AE30 = CFSTR("__kCFURLCheapVolumeInformationKey");
    qword_1ECD2AE38 = 32;
    unk_1ECD2AE40 = createVolumeFlagValue;
    qword_1ECD2AE48 = *MEMORY[0x1E0C9B6E8];
    unk_1ECD2AE50 = CFSTR("__kCFURLCheapVolumeInformationKey");
    qword_1ECD2AE58 = 64;
    unk_1ECD2AE60 = createVolumeFlagValue;
    qword_1ECD2AE68 = *MEMORY[0x1E0C9B6C0];
    unk_1ECD2AE70 = CFSTR("__kCFURLCheapVolumeInformationKey");
    qword_1ECD2AE78 = 0x8000000;
    unk_1ECD2AE80 = createVolumeFlagValue;
    qword_1ECD2AE88 = *MEMORY[0x1E0C9B770];
    unk_1ECD2AE90 = CFSTR("__kCFURLCheapVolumeInformationKey");
    qword_1ECD2AE98 = 0x10000000;
    unk_1ECD2AEA0 = createVolumeFlagValue;
    qword_1ECD2AEA8 = *MEMORY[0x1E0C9B6F0];
    unk_1ECD2AEB0 = CFSTR("__kCFURLCheapVolumeInformationKey");
    qword_1ECD2AEB8 = 0x4000000;
    unk_1ECD2AEC0 = createVolumeFlagValue;
    qword_1ECD2AEC8 = *MEMORY[0x1E0C9B750];
    unk_1ECD2AED0 = CFSTR("__kCFURLCheapVolumeInformationKey");
    qword_1ECD2AED8 = 0x800000000000000;
    unk_1ECD2AEE0 = createVolumeFlagValue;
    qword_1ECD2AEE8 = *MEMORY[0x1E0C9B790];
    unk_1ECD2AEF0 = CFSTR("__kCFURLCheapVolumeInformationKey");
    qword_1ECD2AEF8 = 0x100000000;
    unk_1ECD2AF00 = createVolumeFlagValue;
    qword_1ECD2AF08 = *MEMORY[0x1E0C9B7B8];
    qword_1ECD2AF10 = (uint64_t)CFSTR("__kCFURLCheapVolumeInformationKey");
    qword_1ECD2AF18 = 0x1000000000;
    qword_1ECD2AF20 = (uint64_t)createVolumeFlagValue;
    qword_1ECD2AF28 = *MEMORY[0x1E0C9B788];
    qword_1ECD2AF30 = (uint64_t)CFSTR("__kCFURLCheapVolumeInformationKey");
    qword_1ECD2AF38 = 0x10000000000;
    qword_1ECD2AF40 = (uint64_t)createVolumeFlagValue;
    qword_1ECD2AF48 = *MEMORY[0x1E0C9B798];
    qword_1ECD2AF50 = (uint64_t)CFSTR("__kCFURLCheapVolumeInformationKey");
    qword_1ECD2AF58 = 0x20000000000;
    qword_1ECD2AF60 = (uint64_t)createVolumeFlagValue;
    qword_1ECD2AF68 = *MEMORY[0x1E0C9B748];
    qword_1ECD2AF70 = (uint64_t)CFSTR("__kCFURLCheapVolumeInformationKey");
    qword_1ECD2AF78 = 0x80000000000;
    qword_1ECD2AF80 = (uint64_t)createVolumeFlagValue;
    qword_1ECD2AF88 = *MEMORY[0x1E0C9B740];
    qword_1ECD2AF90 = (uint64_t)CFSTR("__kCFURLCheapVolumeInformationKey");
    qword_1ECD2AF98 = 0x100000000000;
    qword_1ECD2AFA0 = (uint64_t)createVolumeFlagValue;
    qword_1ECD2AFA8 = *MEMORY[0x1E0C9B738];
    qword_1ECD2AFB0 = (uint64_t)CFSTR("__kCFURLCheapVolumeInformationKey");
    qword_1ECD2AFB8 = 0x200000000000;
    qword_1ECD2AFC0 = (uint64_t)createVolumeFlagValue;
    qword_1ECD2AFC8 = *MEMORY[0x1E0C9B7A0];
    qword_1ECD2AFD0 = (uint64_t)CFSTR("__kCFURLCheapVolumeInformationKey");
    qword_1ECD2AFD8 = 0x400000000000;
    qword_1ECD2AFE0 = (uint64_t)createNegatedVolumeFlagValue;
    qword_1ECD2AFE8 = *MEMORY[0x1E0C9B760];
    qword_1ECD2AFF0 = (uint64_t)CFSTR("__kCFURLCheapVolumeInformationKey");
    qword_1ECD2AFF8 = 0x800000000000;
    qword_1ECD2B000 = (uint64_t)createVolumeFlagValue;
    qword_1ECD2B008 = *MEMORY[0x1E0C9B778];
    qword_1ECD2B010 = (uint64_t)CFSTR("__kCFURLCheapVolumeInformationKey");
    qword_1ECD2B018 = 0x2000000000000;
    qword_1ECD2B020 = (uint64_t)createVolumeFlagValue;
    qword_1ECD2B028 = *MEMORY[0x1E0C9B6D0];
    qword_1ECD2B030 = (uint64_t)CFSTR("__kCFURLCheapVolumeInformationKey");
    qword_1ECD2B038 = 0x20000000000000;
    qword_1ECD2B040 = (uint64_t)createVolumeFlagValue;
    qword_1ECD2B048 = *MEMORY[0x1E0C9B7A8];
    qword_1ECD2B050 = (uint64_t)CFSTR("__kCFURLCheapVolumeInformationKey");
    qword_1ECD2B058 = 0x40000000000000;
    qword_1ECD2B060 = (uint64_t)createVolumeFlagValue;
    qword_1ECD2B068 = *MEMORY[0x1E0C9B7C8];
    qword_1ECD2B070 = (uint64_t)CFSTR("__kCFURLCheapVolumeInformationKey");
    qword_1ECD2B078 = 0x80000000000000;
    qword_1ECD2B080 = (uint64_t)createVolumeFlagValue;
    qword_1ECD2B088 = *MEMORY[0x1E0C9B7C0];
    qword_1ECD2B090 = (uint64_t)CFSTR("__kCFURLCheapVolumeInformationKey");
    qword_1ECD2B098 = 0x100000000000000;
    qword_1ECD2B0A0 = (uint64_t)createVolumeFlagValue;
    qword_1ECD2B0A8 = *MEMORY[0x1E0C9B768];
    qword_1ECD2B0B0 = (uint64_t)CFSTR("__kCFURLCheapVolumeInformationKey");
    qword_1ECD2B0B8 = 0x2000000000000000;
    qword_1ECD2B0C0 = (uint64_t)createVolumeFlagValue;
    qword_1ECD2B0C8 = *MEMORY[0x1E0C9B7B0];
    qword_1ECD2B0D0 = (uint64_t)CFSTR("__kCFURLCheapVolumeInformationKey");
    qword_1ECD2B0D8 = 0x4000000000000000;
    qword_1ECD2B0E0 = (uint64_t)createVolumeFlagValue;
    qword_1ECD2B0E8 = *MEMORY[0x1E0C9B758];
    qword_1ECD2B0F0 = (uint64_t)CFSTR("__kCFURLCheapVolumeInformationKey");
    qword_1ECD2B0F8 = 0x8000000000000000;
    qword_1ECD2B100 = (uint64_t)createVolumeFlagValue;
    qword_1ECD2B108 = *MEMORY[0x1E0C9B780];
    qword_1ECD2B110 = (uint64_t)CFSTR("__kCFURLNoDependsVolumeInformationKey");
    qword_1ECD2B120 = 0;
    qword_1ECD2B118 = 0;
    qword_1ECD2B128 = *MEMORY[0x1E0C9B730];
    qword_1ECD2B130 = (uint64_t)CFSTR("__kCFURLNoDependsVolumeInformationKey");
    qword_1ECD2B140 = 0;
    qword_1ECD2B138 = 0;
    qword_1ECD2B148 = *MEMORY[0x1E0C9B6C8];
    qword_1ECD2B150 = (uint64_t)CFSTR("__kCFURLCheapVolumeInformationKey");
    qword_1ECD2B158 = 0;
    qword_1ECD2B160 = (uint64_t)createVolumeIsInternalValue;
    qword_1ECD2B168 = *MEMORY[0x1E0C9B708];
    qword_1ECD2B170 = (uint64_t)CFSTR("__kCFURLCheapVolumeInformationKey");
    qword_1ECD2B178 = 0;
    qword_1ECD2B180 = (uint64_t)createVolumeMaximumFileSizeValue;
    qword_1ECD2B188 = *MEMORY[0x1E0C9B698];
    qword_1ECD2B190 = (uint64_t)CFSTR("__kCFURLCheapVolumeInformationKey");
    qword_1ECD2B198 = 0;
    qword_1ECD2B1A0 = (uint64_t)createVolumeCreationDateValue;
    qword_1ECD2B1A8 = *MEMORY[0x1E0C9B7F0];
    qword_1ECD2B1B0 = (uint64_t)CFSTR("__kCFURLCheapVolumeInformationKey");
    qword_1ECD2B1B8 = 0;
    qword_1ECD2B1C0 = (uint64_t)createVolumeUUIDStringValue;
    qword_1ECD2B1C8 = *MEMORY[0x1E0C9B6A0];
    qword_1ECD2B1D0 = (uint64_t)CFSTR("__kCFURLCheapVolumeInformationKey");
    qword_1ECD2B1D8 = 0;
    qword_1ECD2B1E0 = (uint64_t)createVolumeIdentifierValue;
    qword_1ECD2B1E8 = *MEMORY[0x1E0C9B7D0];
    qword_1ECD2B1F0 = (uint64_t)CFSTR("__kCFURLExpensiveVolumeInformationKey");
    qword_1ECD2B1F8 = 0;
    qword_1ECD2B200 = (uint64_t)createVolumeTotalCapacityValue;
    qword_1ECD2B208 = *MEMORY[0x1E0C9B690];
    qword_1ECD2B210 = (uint64_t)CFSTR("__kCFURLExpensiveVolumeInformationKey");
    qword_1ECD2B218 = 0;
    qword_1ECD2B220 = (uint64_t)createVolumeAvailableCapacityValue;
    qword_1ECD2B228 = *MEMORY[0x1E0C9B720];
    qword_1ECD2B230 = (uint64_t)CFSTR("__kCFURLExpensiveVolumeInformationKey");
    qword_1ECD2B238 = 0;
    qword_1ECD2B240 = (uint64_t)createVolumeResourceCountValue;
    qword_1ECD2B248 = *MEMORY[0x1E0C9AC18];
    qword_1ECD2B250 = (uint64_t)CFSTR("__kCFURLNoDependsVolumeInformationKey");
    qword_1ECD2B258 = 0;
    qword_1ECD2B260 = 0;
    qword_1ECD2B268 = *MEMORY[0x1E0C9ADC8];
    qword_1ECD2B270 = (uint64_t)CFSTR("__kCFURLNoDependsVolumeInformationKey");
    qword_1ECD2B280 = 0;
    qword_1ECD2B278 = 0;
    qword_1ECD2B288 = *MEMORY[0x1E0C9B7D8];
    qword_1ECD2B290 = (uint64_t)CFSTR("__kCFURLCheapVolumeInformationKey");
    qword_1ECD2B298 = 0;
    qword_1ECD2B2A0 = 0;
    qword_1ECD2B2A8 = *MEMORY[0x1E0C9B728];
    qword_1ECD2B2B0 = (uint64_t)CFSTR("__kCFURLCheapVolumeInformationKey");
    qword_1ECD2B2B8 = 0;
    qword_1ECD2B2C0 = 0;
    qword_1ECD2B2C8 = *MEMORY[0x1E0C9B710];
    qword_1ECD2B2D0 = (uint64_t)CFSTR("__kCFURLCheapVolumeInformationKey");
    qword_1ECD2B2D8 = 0;
    qword_1ECD2B2E0 = 0;
    qword_1ECD2B2E8 = *MEMORY[0x1E0C9ADB8];
    qword_1ECD2B2F0 = (uint64_t)CFSTR("__kCFURLCheapVolumeInformationKey");
    qword_1ECD2B2F8 = 16;
    qword_1ECD2B300 = (uint64_t)createVolumeFlagValue;
    qword_1ECD2B308 = *MEMORY[0x1E0C9AD98];
    qword_1ECD2B310 = (uint64_t)CFSTR("__kCFURLCheapVolumeInformationKey");
    qword_1ECD2B318 = 512;
    qword_1ECD2B320 = (uint64_t)createVolumeFlagValue;
    qword_1ECD2B328 = *MEMORY[0x1E0C9ADA0];
    qword_1ECD2B330 = (uint64_t)CFSTR("__kCFURLCheapVolumeInformationKey");
    qword_1ECD2B338 = 1024;
    qword_1ECD2B340 = (uint64_t)createVolumeFlagValue;
    qword_1ECD2B348 = *MEMORY[0x1E0C9ADC0];
    qword_1ECD2B350 = (uint64_t)CFSTR("__kCFURLCheapVolumeInformationKey");
    qword_1ECD2B358 = 4096;
    qword_1ECD2B360 = (uint64_t)createVolumeFlagValue;
    qword_1ECD2B368 = *MEMORY[0x1E0C9AD80];
    qword_1ECD2B370 = (uint64_t)CFSTR("__kCFURLCheapVolumeInformationKey");
    qword_1ECD2B378 = 0x4000;
    qword_1ECD2B380 = (uint64_t)createVolumeFlagValue;
    qword_1ECD2B388 = *MEMORY[0x1E0C9AD88];
    qword_1ECD2B390 = (uint64_t)CFSTR("__kCFURLCheapVolumeInformationKey");
    qword_1ECD2B398 = 0x8000;
    qword_1ECD2B3A0 = (uint64_t)createVolumeFlagValue;
    qword_1ECD2B3A8 = *MEMORY[0x1E0C9AD90];
    qword_1ECD2B3B0 = (uint64_t)CFSTR("__kCFURLCheapVolumeInformationKey");
    qword_1ECD2B3B8 = 0x10000;
    qword_1ECD2B3C0 = (uint64_t)createVolumeFlagValue;
    qword_1ECD2B3C8 = *MEMORY[0x1E0C9AD70];
    qword_1ECD2B3D0 = (uint64_t)CFSTR("__kCFURLCheapVolumeInformationKey");
    qword_1ECD2B3D8 = 0;
    qword_1ECD2B3E0 = (uint64_t)createVolumeDeviceIDValue;
    qword_1ECD2B3E8 = *MEMORY[0x1E0C9B688];
    qword_1ECD2B3F0 = (uint64_t)CFSTR("__kCFURLNoDependsVolumeInformationKey");
    qword_1ECD2B3F8 = 0;
    qword_1ECD2B400 = 0;
    qword_1ECD2B408 = *MEMORY[0x1E0C9B680];
    qword_1ECD2B410 = (uint64_t)CFSTR("__kCFURLNoDependsVolumeInformationKey");
    qword_1ECD2B420 = 0;
    qword_1ECD2B418 = 0;
    qword_1ECD2B428 = *MEMORY[0x1E0C9ADB0];
    qword_1ECD2B430 = (uint64_t)CFSTR("__kCFURLCheapVolumeInformationKey");
    qword_1ECD2B438 = 0x20000000;
    qword_1ECD2B440 = (uint64_t)createVolumeFlagValue;
  }
  MEMORY[0x1E0C80A78](a1);
  v1 = 0;
  v2 = &qword_1ECD2AD28;
  memset(v10, 0, 464);
  do
  {
    *(_QWORD *)&v3 = *(v2 - 4);
    *((_QWORD *)&v3 + 1) = *v2;
    *(_OWORD *)&v10[v1] = v3;
    v2 += 8;
    v1 += 2;
  }
  while (v1 != 58);
  v4 = 0;
  qword_1ECD2A660 = _RegisterFilePropertyProvider(off_1E0F0B100, 0, v10, 0x3AuLL);
  v5 = (const void **)&qword_1ECD2AD10;
  v6 = (const void **)&qword_1ECD2AD10;
  do
  {
    v7 = (__CFString *)v10[v4];
    v8 = *v6;
    v6 += 4;
    v9 = CFEqual(v8, CFSTR("__kCFURLNoDependsVolumeInformationKey")) == 0;
    _RegisterFilePropertyWithOptions(v7, 0, v5, v9, (uint64_t)(v5 - 1));
    ++v4;
    v5 = v6;
  }
  while (v4 != 58);
}

void registerCoreProperties(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v2;
  __int128 v3;
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  const __CFString *v22[70];

  v22[69] = *(const __CFString **)MEMORY[0x1E0C80C00];
  {
    registerCoreProperties(void)::corePropertyTable = *MEMORY[0x1E0C9B4E0];
    *(_OWORD *)&qword_1ECD2B458 = xmmword_1817D5150;
    v6 = *MEMORY[0x1E0C9B5A0];
    qword_1ECD2B468 = (uint64_t)createIsDirectoryValue;
    qword_1ECD2B470[0] = v6;
    *(_OWORD *)&qword_1ECD2B470[1] = xmmword_1817D5150;
    v7 = *MEMORY[0x1E0C9B4F8];
    qword_1ECD2B488 = (uint64_t)createNameValue;
    unk_1ECD2B490 = v7;
    unk_1ECD2B498 = xmmword_1817D5160;
    v8 = *MEMORY[0x1E0C9B548];
    qword_1ECD2B4A8 = (uint64_t)createIsHiddenValue;
    unk_1ECD2B4B0 = v8;
    unk_1ECD2B4B8 = xmmword_1817D5150;
    v9 = *MEMORY[0x1E0C9B538];
    qword_1ECD2B4C8 = (uint64_t)createIsUserImmutableValue;
    unk_1ECD2B4D0 = v9;
    unk_1ECD2B4D8 = xmmword_1817D5150;
    v10 = *MEMORY[0x1E0C9B570];
    qword_1ECD2B4E8 = (uint64_t)createIsSystemImmutableValue;
    unk_1ECD2B4F0 = v10;
    unk_1ECD2B4F8 = xmmword_1817D5150;
    v11 = *MEMORY[0x1E0C9ACD0];
    qword_1ECD2B508 = (uint64_t)createLinkCountValue;
    unk_1ECD2B510 = v11;
    qword_1ECD2B518 = 0;
    unk_1ECD2B520 = 0;
    v12 = *MEMORY[0x1E0C9ACA8];
    qword_1ECD2B528 = (uint64_t)createIsSystemNoUnlinkValue;
    unk_1ECD2B530 = v12;
    qword_1ECD2B538 = 0;
    unk_1ECD2B540 = 0;
    v13 = *MEMORY[0x1E0C9ACB0];
    qword_1ECD2B548 = (uint64_t)createIsRestrictedValue;
    unk_1ECD2B550 = v13;
    qword_1ECD2B558 = 0;
    unk_1ECD2B560 = 0;
    v14 = *MEMORY[0x1E0C9ACD8];
    qword_1ECD2B568 = (uint64_t)createIsSystemAppendValue;
    unk_1ECD2B570 = v14;
    qword_1ECD2B578 = 0;
    unk_1ECD2B580 = 0;
    v15 = *MEMORY[0x1E0C9B3B8];
    qword_1ECD2B588 = (uint64_t)createIsUserAppendValue;
    unk_1ECD2B590 = v15;
    unk_1ECD2B598 = xmmword_1817D5150;
    v16 = *MEMORY[0x1E0C9B4A8];
    qword_1ECD2B5A8 = (uint64_t)createAddedToDirectoryDateValue;
    unk_1ECD2B5B0 = v16;
    unk_1ECD2B5B8 = xmmword_1817D5170;
    v17 = *MEMORY[0x1E0C9B520];
    qword_1ECD2B5C8 = (uint64_t)createFileSizeValue;
    unk_1ECD2B5D0 = v17;
    unk_1ECD2B5D8 = xmmword_1817D5150;
    v18 = *MEMORY[0x1E0C9B530];
    qword_1ECD2B5E8 = (uint64_t)createIsRegularFileValue;
    unk_1ECD2B5F0 = v18;
    unk_1ECD2B5F8 = xmmword_1817D5150;
    v19 = *MEMORY[0x1E0C9B4D0];
    qword_1ECD2B608 = (uint64_t)createIsSymbolicLinkValue;
    unk_1ECD2B610 = v19;
    unk_1ECD2B618 = xmmword_1817D5160;
    v20 = *MEMORY[0x1E0C9B550];
    qword_1ECD2B628 = (uint64_t)createIsAliasFileValue;
    unk_1ECD2B630 = v20;
    unk_1ECD2B638 = xmmword_1817D5150;
    v21 = *MEMORY[0x1E0C9B420];
    qword_1ECD2B648 = (uint64_t)createIsVolumeValue;
    unk_1ECD2B650 = v21;
    unk_1ECD2B658 = xmmword_1817D5170;
    qword_1ECD2B668 = (uint64_t)createFileAllocatedSizeValue;
    qword_1ECD2B670 = *MEMORY[0x1E0C9AC60];
    unk_1ECD2B678 = vdupq_n_s64(2uLL);
    qword_1ECD2B688 = (uint64_t)createFinderInfoValue;
    qword_1ECD2B690 = *MEMORY[0x1E0C9AC58];
    unk_1ECD2B698 = xmmword_1817D5180;
    qword_1ECD2B6A8 = (uint64_t)createFileSizeOfResourceForkValue;
    qword_1ECD2B6B0 = *MEMORY[0x1E0C9AC40];
    unk_1ECD2B6B8 = xmmword_1817D5180;
    qword_1ECD2B6C8 = (uint64_t)createFileAllocatedSizeOfResourceForkValue;
    qword_1ECD2B6D0 = *MEMORY[0x1E0C9AC88];
    qword_1ECD2B6D8 = 0;
    qword_1ECD2B6E0 = 0;
    qword_1ECD2B6E8 = (uint64_t)createIsCompressedValue;
    qword_1ECD2B6F0 = *MEMORY[0x1E0C9AD38];
    unk_1ECD2B6F8 = xmmword_1817D5190;
    qword_1ECD2B708 = (uint64_t)createParentDirectoryIsVolumeRoot;
    qword_1ECD2B710 = *MEMORY[0x1E0C9AC50];
    unk_1ECD2B718 = xmmword_1817D5190;
    qword_1ECD2B728 = (uint64_t)createFileIDValue;
    qword_1ECD2B730 = *MEMORY[0x1E0C9B400];
    unk_1ECD2B738 = xmmword_1817D5150;
    qword_1ECD2B748 = (uint64_t)createContentModificationDateValue;
    qword_1ECD2B750 = *MEMORY[0x1E0C9B3C0];
    unk_1ECD2B758 = xmmword_1817D5150;
    qword_1ECD2B768 = (uint64_t)createAttributeModificationDateValue;
    qword_1ECD2B770 = *MEMORY[0x1E0C9B408];
    unk_1ECD2B778 = xmmword_1817D5150;
    qword_1ECD2B788 = (uint64_t)createCreationDateValue;
    qword_1ECD2B790 = *MEMORY[0x1E0C9B4C8];
    unk_1ECD2B798 = xmmword_1817D5160;
    qword_1ECD2B7A8 = (uint64_t)createHasHiddenExtensionValue;
    qword_1ECD2B7B0 = *MEMORY[0x1E0C9B518];
    unk_1ECD2B7B8 = vdupq_n_s64(1uLL);
    qword_1ECD2B7C8 = (uint64_t)createIsReadableValue;
    qword_1ECD2B7D0 = *MEMORY[0x1E0C9B558];
    unk_1ECD2B7D8 = unk_1ECD2B7B8;
    qword_1ECD2B7E8 = (uint64_t)createIsWriteableValue;
    qword_1ECD2B7F0 = *MEMORY[0x1E0C9B4F0];
    unk_1ECD2B7F8 = unk_1ECD2B7B8;
    qword_1ECD2B808 = (uint64_t)createIsExecutableValue;
    qword_1ECD2B810 = *MEMORY[0x1E0C9B568];
    unk_1ECD2B818 = xmmword_1817D5160;
    qword_1ECD2B828 = (uint64_t)createLabelNumberValue;
    qword_1ECD2B830 = *MEMORY[0x1E0C9B4A0];
    unk_1ECD2B838 = xmmword_1817D51A0;
    qword_1ECD2B848 = (uint64_t)createFileSecurityValue;
    qword_1ECD2B850 = *MEMORY[0x1E0C9B460];
    unk_1ECD2B858 = xmmword_1817D5150;
    qword_1ECD2B868 = (uint64_t)createFileProtectionValue;
    qword_1ECD2B870 = *MEMORY[0x1E0C9B3F8];
    unk_1ECD2B878 = xmmword_1817D5150;
    qword_1ECD2B888 = (uint64_t)createContentAccessDateValue;
    qword_1ECD2B890 = *MEMORY[0x1E0C9B5D8];
    unk_1ECD2B898 = xmmword_1817D51B0;
    qword_1ECD2B8A8 = (uint64_t)createTotalFileSizeValue;
    qword_1ECD2B8B0 = *MEMORY[0x1E0C9B5D0];
    unk_1ECD2B8B8 = xmmword_1817D51B0;
    qword_1ECD2B8C8 = (uint64_t)createTotalFileAllocatedSizeValue;
    qword_1ECD2B8D0 = *MEMORY[0x1E0C9B470];
    unk_1ECD2B8D8 = xmmword_1817D51C0;
    qword_1ECD2B8E8 = (uint64_t)createFileResourceIdentifierValue;
    qword_1ECD2B8F0 = *MEMORY[0x1E0C9B4B0];
    unk_1ECD2B8F8 = xmmword_1817D51C0;
    qword_1ECD2B908 = (uint64_t)createGenerationIdentifierValue;
    qword_1ECD2B910 = *MEMORY[0x1E0C9B418];
    unk_1ECD2B918 = xmmword_1817D5150;
    qword_1ECD2B928 = (uint64_t)createDocumentIdentifierValue;
    qword_1ECD2B930 = *MEMORY[0x1E0C9B480];
    unk_1ECD2B938 = xmmword_1817D5150;
    qword_1ECD2B948 = (uint64_t)createFileResourceTypeValue;
    qword_1ECD2B950 = *MEMORY[0x1E0C9B5B8];
    unk_1ECD2B958 = xmmword_1817D5150;
    qword_1ECD2B968 = (uint64_t)createPreferredIOBlockSizeValue;
    qword_1ECD2B970 = *MEMORY[0x1E0C9B500];
    unk_1ECD2B978 = xmmword_1817D5150;
    qword_1ECD2B988 = (uint64_t)createIsMountTriggerValue;
    qword_1ECD2B990 = *MEMORY[0x1E0C9B3F0];
    unk_1ECD2B998 = xmmword_1817D51D0;
    qword_1ECD2B9A8 = (uint64_t)createCanonicalPathValue;
    qword_1ECD2B9B0 = *MEMORY[0x1E0C9B440];
    unk_1ECD2B9B8 = xmmword_1817D5190;
    qword_1ECD2B9C8 = (uint64_t)createInodeNumberValue;
    qword_1ECD2B9D0 = *MEMORY[0x1E0C9B428];
    unk_1ECD2B9D8 = xmmword_1817D5190;
    qword_1ECD2B9E8 = (uint64_t)createFileContentIdentifierValue;
    qword_1ECD2B9F0 = *MEMORY[0x1E0C9B598];
    qword_1ECD2BA00 = 0;
    qword_1ECD2B9F8 = 0;
    qword_1ECD2BA08 = (uint64_t)createMayShareFileContentValue;
    qword_1ECD2BA10 = *MEMORY[0x1E0C9B590];
    qword_1ECD2BA20 = 0;
    qword_1ECD2BA18 = 0;
    qword_1ECD2BA28 = (uint64_t)createMayHaveExtendedAttributesValue;
    qword_1ECD2BA30 = *MEMORY[0x1E0C9B510];
    qword_1ECD2BA38 = 0;
    qword_1ECD2BA40 = 0;
    qword_1ECD2BA48 = (uint64_t)createIsPurgeableValue;
    qword_1ECD2BA50 = *MEMORY[0x1E0C9B528];
    qword_1ECD2BA58 = 0;
    qword_1ECD2BA60 = 0;
    qword_1ECD2BA68 = (uint64_t)createIsSparseValue;
    qword_1ECD2BA70 = (uint64_t)CFSTR("NSURLDirectoryEntryCountKey");
    unk_1ECD2BA78 = xmmword_1817D51E0;
    qword_1ECD2BA88 = (uint64_t)createDirectoryEntryCountValue;
    qword_1ECD2BA90 = *MEMORY[0x1E0C9AC38];
    unk_1ECD2BA98 = xmmword_1817D51F0;
    qword_1ECD2BAA8 = (uint64_t)createFaultLogicalFileIsHiddenValue;
    qword_1ECD2BAB0 = *MEMORY[0x1E0C9AD20];
    qword_1ECD2BAB8 = 0;
    qword_1ECD2BAC0 = 0;
    qword_1ECD2BAC8 = (uint64_t)createNameExtensionValue;
    qword_1ECD2BAD0 = *MEMORY[0x1E0C9ADA8];
    qword_1ECD2BAE0 = 0;
    qword_1ECD2BAD8 = 0;
    qword_1ECD2BAE8 = (uint64_t)createVolumeIsHFSStandardValue;
    qword_1ECD2BAF0 = *MEMORY[0x1E0C9ACE8];
    qword_1ECD2BAF8 = 0;
    qword_1ECD2BB00 = 0;
    qword_1ECD2BB08 = (uint64_t)createIsUserNoDumpValue;
    qword_1ECD2BB10 = *MEMORY[0x1E0C9ACF0];
    qword_1ECD2BB18 = 0;
    qword_1ECD2BB20 = 0;
    qword_1ECD2BB28 = (uint64_t)createIsUserOpaqueValue;
    qword_1ECD2BB30 = *MEMORY[0x1E0C9ACF8];
    qword_1ECD2BB38 = 0;
    qword_1ECD2BB40 = 0;
    qword_1ECD2BB48 = (uint64_t)createIsUserTrackedValue;
    qword_1ECD2BB50 = *MEMORY[0x1E0C9ACE0];
    qword_1ECD2BB58 = 0;
    qword_1ECD2BB60 = 0;
    qword_1ECD2BB68 = (uint64_t)createIsUserDataVaultValue;
    qword_1ECD2BB70 = *MEMORY[0x1E0C9ACB8];
    qword_1ECD2BB80 = 0;
    qword_1ECD2BB78 = 0;
    qword_1ECD2BB88 = (uint64_t)createIsSystemArchivedValue;
    qword_1ECD2BB90 = *MEMORY[0x1E0C9AD78];
    qword_1ECD2BBA0 = 0;
    qword_1ECD2BB98 = 0;
    qword_1ECD2BBA8 = (uint64_t)createVolumeIDValue;
    qword_1ECD2BBB0 = *MEMORY[0x1E0C9AC80];
    unk_1ECD2BBB8 = xmmword_1817D5190;
    qword_1ECD2BBC8 = (uint64_t)createInodeNumberValue;
    qword_1ECD2BBD0 = *MEMORY[0x1E0C9AD30];
    unk_1ECD2BBD8 = xmmword_1817D5190;
    qword_1ECD2BBE8 = (uint64_t)createParentDirectoryIDValue;
    qword_1ECD2BBF0 = *MEMORY[0x1E0C9AD28];
    qword_1ECD2BC00 = 0;
    qword_1ECD2BBF8 = 0;
    qword_1ECD2BC08 = (uint64_t)createOwnerIDValue;
    qword_1ECD2BC10 = *MEMORY[0x1E0C9AC70];
    qword_1ECD2BC20 = 0;
    qword_1ECD2BC18 = 0;
    qword_1ECD2BC28 = (uint64_t)createGroupIDValue;
    qword_1ECD2BC30 = *MEMORY[0x1E0C9AD50];
    qword_1ECD2BC40 = 0;
    qword_1ECD2BC38 = 0;
    qword_1ECD2BC48 = (uint64_t)createStatModeValue;
    qword_1ECD2BC50 = *MEMORY[0x1E0C9ACC8];
    qword_1ECD2BC60 = 0;
    qword_1ECD2BC58 = 0;
    qword_1ECD2BC68 = (uint64_t)createIsSystemFirmlinkValue;
    qword_1ECD2BC70 = *MEMORY[0x1E0C9ACC0];
    qword_1ECD2BC80 = 0;
    qword_1ECD2BC78 = 0;
    qword_1ECD2BC88 = (uint64_t)createIsSystemDatalessValue;
    qword_1ECD2BC90 = *MEMORY[0x1E0C9AC48];
    qword_1ECD2BCA0 = 0;
    qword_1ECD2BC98 = 0;
    qword_1ECD2BCA8 = (uint64_t)createFileFlagsValue;
    qword_1ECD2BCB0 = *MEMORY[0x1E0C9AC68];
    qword_1ECD2BCC0 = 0;
    qword_1ECD2BCB8 = 0;
    qword_1ECD2BCC8 = (uint64_t)createGenerationCountValue;
  }
  MEMORY[0x1E0C80A78](a1);
  v1 = 0;
  v2 = qword_1ECD2B470;
  memset(v22, 0, 512);
  do
  {
    *(_QWORD *)&v3 = *(v2 - 4);
    *((_QWORD *)&v3 + 1) = *v2;
    *(_OWORD *)&v22[v1] = v3;
    v2 += 8;
    v1 += 2;
  }
  while (v1 != 68);
  v4 = 0;
  qword_1ECD2A658 = _RegisterFilePropertyProvider(off_1E0F0B080, 0, v22, 0x44uLL);
  v5 = &registerCoreProperties(void)::corePropertyTable;
  do
  {
    _RegisterFilePropertyWithOptions((void *)v22[v4++], v5[1], 0, 0, (uint64_t)v5);
    v5 += 4;
  }
  while (v4 != 68);
}

uint64_t _RegisterFilePropertyProvider(_OWORD *a1, uint64_t a2, const __CFString **a3, size_t count)
{
  uint64_t v4;
  uint64_t v6;
  uint64_t *v7;
  uint64_t *v8;
  _DWORD *v9;
  _QWORD *v10;
  const __CFAllocator *v11;
  const __CFString *v12;
  int v13;
  uint64_t v14;
  CFStringRef Copy;

  v4 = count;
  v6 = qword_1ECD2A538++;
  v7 = &sFileProviderGlobals[7 * v6];
  *((_DWORD *)v7 + 4) = v6;
  v8 = v7 + 2;
  v7[3] = a2;
  *((_OWORD *)v7 + 2) = *a1;
  *((_OWORD *)v7 + 3) = a1[1];
  *((_DWORD *)v7 + 5) = 0;
  v9 = (_DWORD *)v7 + 5;
  v7[8] = (uint64_t)malloc_type_calloc(count, 0x94uLL, 0x10E0040CEEF78F5uLL);
  v10 = v7 + 8;
  if (v4 >= 1)
  {
    v11 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
    do
    {
      v12 = *a3++;
      v13 = (*v9)++;
      v14 = *v10 + 148 * v13;
      *(_DWORD *)(v14 + 136) = v13;
      Copy = CFStringCreateCopy(v11, v12);
      *(_QWORD *)(v14 + 8) = Copy;
      *(_QWORD *)(v14 + 140) = v8;
      CFDictionaryAddValue((CFMutableDictionaryRef)qword_1ECD2A668, Copy, (const void *)v14);
      --v4;
    }
    while (v4);
  }
  return v6;
}

uint64_t _FileCacheInitClass(void)
{
  if (_FileCacheInitClass(void)::once != -1)
    dispatch_once(&_FileCacheInitClass(void)::once, &__block_literal_global_0);
  return sFileCacheTypeID;
}

os_log_t init_logging(void)
{
  os_log_t result;

  defaultLog = (uint64_t)os_log_create("com.apple.FileURL", "default");
  securityScopedLog = (uint64_t)os_log_create("com.apple.FileURL", "scoped");
  bmarkLog = (uint64_t)os_log_create("com.apple.FileURL", "bookmark");
  resolveLog = (uint64_t)os_log_create("com.apple.FileURL", "resolve");
  result = os_log_create("com.apple.FileURL", "alias");
  aliasLog = (uint64_t)result;
  return result;
}

uint64_t _FSURLSetResourcePropertiesForKeys(const __CFURL *a1, const __CFDictionary *a2, CFTypeRef cf, CFErrorRef *a4)
{
  CFTypeRef v7;
  CFIndex Count;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  size_t v14;
  uint64_t v15;
  uint64_t v16;
  char *v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  const void *v21;
  uint64_t *v22;
  int *v23;
  int v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  const void *v29;
  char *v30;
  uint64_t v31;
  uint64_t v32;
  int v33;
  unint64_t v34;
  const void **v35;
  size_t v36;
  uint64_t v37;
  void **v38;
  const void *v39;
  void *v40;
  char *v41;
  const void *v42;
  uint64_t v43;
  char *v44;
  uint64_t v45;
  void *v46;
  uint64_t v47;
  uint64_t v48;
  const void **v49;
  uint64_t *v50;
  uint64_t *v51;
  uint64_t *v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  int v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  unint64_t v61;
  uint64_t v62;
  uint64_t v63;
  char *v64;
  uint64_t v65;
  uint64_t (*v66)(uint64_t, uint64_t, uint64_t, _QWORD *, void **, uint64_t, uint64_t, CFErrorRef *);
  CFErrorRef *v67;
  uint64_t v68;
  uint64_t v69;
  char *v70;
  uint64_t i;
  uint64_t v72;
  const void **v73;
  const void *v74;
  const void *v75;
  CFTypeRef v76;
  uint64_t v77;
  CFErrorRef *v78;
  unint64_t v79;
  uint64_t v80;
  const void **v81;
  size_t v82;
  CFIndex v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  const __CFURL *v88;
  const __CFAllocator *v89;
  CFArrayRef v90;
  CFDictionaryRef v91;
  const __CFDictionary *v92;
  const __CFAllocator *v93;
  __CFDictionary *MutableCopy;
  const __CFAllocator *v95;
  const __CFAllocator *v96;
  CFErrorDomain Domain;
  CFIndex Code;
  const __CFString *v99;
  CFErrorRef v100;
  uint64_t v101;
  CFTypeRef v102;
  CFErrorRef *v103;
  const __CFURL *v104;
  uint64_t v105;
  uint64_t *v106;
  uint64_t v107;
  uint64_t *v108;
  uint64_t *v109;
  const void **v110;
  void *keys;
  void *value;
  _QWORD v113[2];

  v113[1] = *MEMORY[0x1E0C80C00];
  v7 = _FileCacheGetForURL(a1, cf);
  Count = CFDictionaryGetCount(a2);
  v9 = MEMORY[0x1E0C80A78](Count);
  v110 = (const void **)(&v101 - 32 * v10);
  v11 = MEMORY[0x1E0C80A78](v9);
  v108 = &v101 - 32 * v12;
  v13 = MEMORY[0x1E0C80A78](v11);
  MEMORY[0x1E0C80A78](v13);
  v17 = (char *)&v101 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  v113[0] = 0;
  if (Count < 1)
  {
    LOBYTE(v33) = 1;
    return v33;
  }
  v109 = (uint64_t *)((char *)&v101 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0));
  v18 = v16;
  v105 = v16;
  v107 = v15;
  if (v16 >= 1)
  {
    bzero(v17, v14);
    if ((unint64_t)Count >= 0x100)
    {
      v103 = a4;
      v104 = a1;
      v102 = v7;
      v19 = 0;
      v20 = 0;
      v106 = (uint64_t *)*MEMORY[0x1E0C9B0D0];
      v21 = (const void *)*MEMORY[0x1E0C9B5A0];
      while (1)
      {
        v22 = &sFileProviderGlobals[7 * v20];
        v24 = *((_DWORD *)v22 + 5);
        v23 = (int *)v22 + 5;
        if (v24 >= 1)
          break;
        v28 = v19;
LABEL_17:
        ++v20;
        v19 = v28;
        v18 = v105;
        if (v20 == v105)
          goto LABEL_37;
      }
      v25 = 0;
      v26 = 0;
      while (1)
      {
        v27 = sFileProviderGlobals[7 * v20 + 8] + v25;
        value = 0;
        if (CFDictionaryGetValueIfPresent(a2, *(const void **)(v27 + 8), (const void **)&value))
        {
          v28 = value;
          if (!value)
          {
            v28 = v106;
            value = v106;
          }
          v29 = *(const void **)(v27 + 8);
          if (v29 == v21)
          {
            v113[0] = v28;
            goto LABEL_14;
          }
          v30 = (char *)v109;
          v31 = v109[v20];
          *(&v110[96 * v20] + v31) = v29;
          v32 = v107;
          v108[96 * v20 + v31] = (uint64_t)v28;
          *(_QWORD *)(v32 + 768 * v20 + 8 * v31) = *(_QWORD *)v27;
          *(_QWORD *)&v30[8 * v20] = v31 + 1;
        }
        v28 = v19;
LABEL_14:
        ++v26;
        v25 += 148;
        v19 = v28;
        if (v26 >= *v23)
          goto LABEL_17;
      }
    }
    goto LABEL_21;
  }
  if ((unint64_t)Count < 0x100)
  {
LABEL_21:
    v104 = a1;
    v102 = v7;
    v106 = &v101;
    MEMORY[0x1E0C80A78](v17);
    v34 = (8 * Count + 15) & 0xFFFFFFFFFFFFFFF0;
    v35 = (const void **)((char *)&v101 - v34);
    if ((unint64_t)(8 * Count) >= 0x200)
      v36 = 512;
    else
      v36 = 8 * Count;
    bzero((char *)&v101 - v34, v36);
    MEMORY[0x1E0C80A78](v37);
    v38 = (void **)((char *)&v101 - v34);
    bzero((char *)&v101 - v34, v36);
    CFDictionaryGetKeysAndValues(a2, (const void **)((char *)&v101 - v34), (const void **)((char *)&v101 - v34));
    v28 = 0;
    v39 = (const void *)*MEMORY[0x1E0C9B5A0];
    v40 = (void *)*MEMORY[0x1E0C9B0D0];
    do
    {
      v41 = (char *)CFDictionaryGetValue((CFDictionaryRef)qword_1ECD2A668, *v35);
      if (v41)
      {
        v42 = (const void *)*((_QWORD *)v41 + 1);
        if (v42 == v39)
        {
          if (*v38)
            v28 = *v38;
          else
            v28 = v40;
          v113[0] = v28;
        }
        else
        {
          v43 = **(int **)(v41 + 140);
          v44 = (char *)v109;
          v45 = v109[v43];
          if (v45 <= 95)
          {
            *(&v110[96 * v43] + v45) = v42;
            v46 = *v38;
            if (!*v38)
              v46 = v40;
            v108[96 * v43 + v45] = (uint64_t)v46;
            *(_QWORD *)(v107 + 768 * v43 + 8 * v45) = *(_QWORD *)v41;
            *(_QWORD *)&v44[8 * v43] = v45 + 1;
          }
        }
      }
      ++v38;
      ++v35;
      --Count;
    }
    while (Count);
    v103 = a4;
LABEL_37:
    v7 = v102;
    _FileCacheLock((uint64_t)v102);
    if (v18 < 1)
    {
      v59 = 0;
      v33 = 1;
LABEL_44:
      a4 = v103;
      v60 = (uint64_t)v104;
      v61 = 0x1ECD2A000uLL;
      if (v28)
      {
        v62 = MEMORY[0x1E0C9B5A0];
        v63 = (uint64_t)v7;
        v64 = (char *)CFDictionaryGetValue((CFDictionaryRef)qword_1ECD2A668, (const void *)*MEMORY[0x1E0C9B5A0]);
        value = *(void **)v64;
        v65 = *(_QWORD *)(v64 + 140);
        v66 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, _QWORD *, void **, uint64_t, uint64_t, CFErrorRef *))(v65 + 40);
        v67 = a4;
        v68 = *(_QWORD *)(v65 + 8);
        _FileCacheIncrementInProvider(v63);
        v69 = v68;
        a4 = v67;
        v33 = v66(v60, v63, v62, v113, &value, 1, v69, v67);
        _FileCacheDecrementInProvider(v63);
        if (v33)
          clearPropertyAndDependentValues(v60, v63, (uint64_t)v64);
        v7 = (CFTypeRef)v63;
      }
      v70 = (char *)v109;
    }
    else
    {
      v47 = v18;
      v48 = 0;
      v33 = 1;
      v50 = v109;
      v49 = v110;
      v51 = &qword_1ECD2A568;
      v53 = v107;
      v52 = v108;
      while (1)
      {
        v54 = *v50;
        if (*v50 >= 1)
        {
          v108 = (uint64_t *)*v51;
          v55 = *(v51 - 4);
          _FileCacheIncrementInProvider((uint64_t)v7);
          v56 = ((uint64_t (*)(const __CFURL *, CFTypeRef, const void **, uint64_t *, uint64_t, uint64_t, uint64_t, CFErrorRef *))v108)(v104, v7, v49, v52, v53, v54, v55, v103);
          v57 = v105;
          v33 = v56;
          v58 = _FileCacheDecrementInProvider((uint64_t)v7);
          v47 = v57;
          if (!v33)
            break;
        }
        v49 += 96;
        ++v50;
        v51 += 7;
        v52 += 96;
        v53 += 768;
        if (v47 == ++v48)
        {
          v59 = v47;
          goto LABEL_44;
        }
      }
      a4 = v103;
      if (v103)
      {
        v76 = v7;
        v59 = v48;
        if (*v103)
        {
          v77 = v47;
          v78 = v103;
          MEMORY[0x1E0C80A78](v58);
          v81 = (const void **)(&v101 - 32 * v80);
          if (v79 >= 0x200)
            v82 = 512;
          else
            v82 = v79;
          bzero(&v101 - 32 * v80, v82);
          if (v77 <= v59)
          {
            v83 = 0;
          }
          else
          {
            v83 = 0;
            v84 = v77 - v59;
            do
            {
              v86 = *v50++;
              v85 = v86;
              if (v86 >= 1)
              {
                memcpy(&v81[v83], v49, 8 * v85);
                v83 += v85;
              }
              v49 += 96;
              --v84;
            }
            while (v84);
          }
          v88 = v104;
          v89 = CFGetAllocator(v104);
          v90 = CFArrayCreate(v89, v81, v83, MEMORY[0x1E0C9B378]);
          value = v90;
          v91 = CFErrorCopyUserInfo(*v78);
          if (v91)
          {
            v92 = v91;
            v93 = CFGetAllocator(v88);
            MutableCopy = CFDictionaryCreateMutableCopy(v93, 0, v92);
            CFDictionaryAddValue(MutableCopy, (const void *)*MEMORY[0x1E0C9B560], v90);
            CFRelease(v92);
          }
          else
          {
            keys = (void *)*MEMORY[0x1E0C9B560];
            v95 = CFGetAllocator(v88);
            MutableCopy = CFDictionaryCreate(v95, (const void **)&keys, (const void **)&value, 1, MEMORY[0x1E0C9B390], MEMORY[0x1E0C9B3A0]);
          }
          v96 = CFGetAllocator(v88);
          Domain = CFErrorGetDomain(*v78);
          Code = CFErrorGetCode(*v78);
          v99 = Domain;
          a4 = v78;
          v100 = CFErrorCreate(v96, v99, Code, MutableCopy);
          CFRelease(*v78);
          CFRelease(value);
          CFRelease(MutableCopy);
          *v78 = v100;
          v33 = 0;
          v7 = v76;
          v60 = (uint64_t)v88;
        }
        else
        {
          if (os_log_type_enabled((os_log_t)defaultLog, OS_LOG_TYPE_ERROR))
            _FSURLSetResourcePropertiesForKeys_cold_2();
          v33 = 0;
          v60 = (uint64_t)v104;
        }
        v70 = (char *)v109;
        v61 = 0x1ECD2A000;
      }
      else
      {
        v33 = 0;
        v60 = (uint64_t)v104;
        v70 = (char *)v109;
        v61 = 0x1ECD2A000;
        v59 = v48;
      }
    }
    if (v59)
    {
      for (i = 0; i != v59; ++i)
      {
        v72 = *(_QWORD *)&v70[8 * i];
        if (v72 >= 1)
        {
          v73 = v110;
          do
          {
            v74 = *v73++;
            v75 = CFDictionaryGetValue(*(CFDictionaryRef *)(v61 + 1640), v74);
            clearPropertyAndDependentValues(v60, (uint64_t)v7, (uint64_t)v75);
            --v72;
          }
          while (v72);
        }
        v110 += 96;
      }
    }
    goto LABEL_68;
  }
  _FileCacheLock((uint64_t)v7);
  v33 = 1;
LABEL_68:
  _FileCacheUnlock((uint64_t)v7);
  if (a4 && !v33)
  {
    if (*a4)
    {
      LOBYTE(v33) = 0;
    }
    else
    {
      if (os_log_type_enabled((os_log_t)defaultLog, OS_LOG_TYPE_ERROR))
        _FSURLSetResourcePropertiesForKeys_cold_1();
      LOBYTE(v33) = 0;
      *a4 = CFErrorCreate((CFAllocatorRef)*MEMORY[0x1E0C9AE00], (CFErrorDomain)*MEMORY[0x1E0C9AFB8], 256, 0);
    }
  }
  return v33;
}

BOOL corePropertyProviderSetValues(const __CFString *a1, uint64_t a2, CFTypeRef *a3, const void **a4, uint64_t a5, uint64_t a6, uint64_t a7, CFErrorRef *a8)
{
  uint64_t Attributes;
  uint64_t v15;
  char *v16;
  __int128 v17;
  const __CFString *v18;
  const __CFString *v19;
  const void *v20;
  const void *v21;
  uint64_t v22;
  CFTypeRef v23;
  const __CFString *v24;
  _BOOL4 v25;
  uint64_t v26;
  NSObject *v27;
  _BOOL4 v28;
  const __CFAllocator *v29;
  CFErrorRef v30;
  _BOOL8 v31;
  int v32;
  unint64_t v33;
  const __CFBoolean *v34;
  const __CFBoolean *v35;
  const __CFBoolean *v36;
  const __CFBoolean *v37;
  int v38;
  const __CFData *v39;
  __int128 v40;
  unint64_t v41;
  unsigned int *v42;
  unint64_t v43;
  _BOOL4 v44;
  unsigned int v45;
  uint64_t v46;
  const void *v47;
  int v48;
  CFErrorRef *v49;
  unint64_t v50;
  uint64_t v51;
  char *v52;
  size_t v53;
  int v54;
  int32x2_t v55;
  const __CFString *v56;
  const __CFAllocator *v57;
  const __CFString *v58;
  int *v59;
  CFErrorRef v60;
  int v61;
  char *v62;
  int v63;
  int v64;
  __int128 v65;
  int32x2_t v66;
  int v67;
  unint64_t Capabilities;
  const __CFString *v69;
  const __CFString *v70;
  const __CFBoolean *v71;
  __CFFileSecurity *v72;
  ssize_t v73;
  unint64_t v74;
  uint64_t v75;
  int8x8_t *v76;
  int8x8_t *v77;
  long double v78;
  double v79;
  double v80;
  size_t v81;
  const __CFString *v82;
  const __CFString *v83;
  const __CFString *v84;
  const __CFString *v85;
  long double v86;
  double v87;
  double v88;
  const __CFString *v89;
  const __CFString *v90;
  long double v91;
  double v92;
  double v93;
  const __CFString *v94;
  size_t v95;
  char v96;
  BOOL v97;
  __int16 v98;
  BOOL v99;
  BOOL v100;
  BOOL v101;
  __int128 v102;
  int8x8_t v103;
  int8x8_t v104;
  char v105;
  unsigned int v106;
  const __CFBoolean *v107;
  const __CFBoolean *v108;
  CFUUIDBytes *v109;
  ssize_t v110;
  _acl *v111;
  ssize_t v112;
  ssize_t v113;
  long double v114;
  double v115;
  double v116;
  int v117;
  const __CFAllocator *v118;
  const __CFString *v119;
  int *v120;
  int v121;
  DIR *v122;
  DIR *v123;
  const __CFString *v124;
  const void *v125;
  NSObject *v126;
  int v127;
  int v128;
  const __CFAllocator *v129;
  const __CFAllocator *v130;
  size_t v131;
  int v132;
  UInt8 *v133;
  UInt8 *v134;
  UInt8 *v135;
  _BYTE *v136;
  uint64_t v137;
  CFIndex Bytes;
  std::error_code *v139;
  int v140;
  const __CFAllocator *v141;
  const __CFString *v142;
  uint64_t v143;
  int v144;
  int v146;
  CFAllocatorRef v147;
  const __CFString *v148;
  uint64_t v149;
  uint64_t v150;
  const __CFAllocator *v151;
  const __CFString *Copy;
  const void *v153;
  CFIndex Length;
  int v155;
  int v156;
  unsigned int v157;
  uint64_t v158;
  CFTypeRef v159;
  CFTypeRef v160;
  CFTypeRef v161;
  CFTypeRef v162;
  CFTypeRef v163;
  CFTypeRef v164;
  CFTypeRef v165;
  __int128 v166;
  CFTypeRef v167;
  CFTypeRef v168;
  CFTypeRef v169;
  CFTypeRef v170;
  CFTypeRef v171;
  CFTypeRef v172;
  CFTypeRef v173;
  CFTypeRef v174;
  CFTypeRef v175;
  CFTypeRef v176;
  CFTypeRef v177;
  CFTypeRef v178;
  CFTypeRef v179;
  uint64_t v180;
  CFTypeRef v181;
  char *v182;
  _BOOL4 v183;
  CFTypeRef v184;
  uint64_t v185;
  int v186;
  CFTypeRef v187;
  CFTypeRef v188;
  CFTypeRef v189;
  uint64_t *v190;
  const __CFString *v191;
  const __CFString *v192;
  const __CFString *v193;
  const __CFBoolean *v194;
  const __CFBoolean *v195;
  const __CFBoolean *v196;
  const __CFBoolean *v197;
  const __CFBoolean *v198;
  CFErrorRef *v199;
  const __CFBoolean *v200;
  uint64_t v201;
  const __CFBoolean *v202;
  const __CFBoolean *v203;
  const __CFBoolean *v204;
  const __CFBoolean *v205;
  const __CFBoolean *v206;
  CFNumberRef v207;
  CFFileSecurityRef v208;
  const __CFBoolean *v209;
  const __CFString *v210;
  const __CFBoolean *v211;
  CFTypeRef v212;
  uint64_t v213;
  CFDataRef v214;
  const __CFBoolean *v215;
  const __CFString *v216;
  _BYTE *v217;
  uint64_t v218;
  __int128 v219;
  __int128 v220;
  acl_t v221;
  attrlist v222;
  attrlist v223;
  _BYTE v224[1024];
  std::__fs::filesystem::path v225[42];
  uint64_t v226;
  CFRange v227;
  CFRange v228;

  v226 = *MEMORY[0x1E0C80C00];
  Attributes = _FileCacheGetAttributes(a2);
  *(_OWORD *)&v223.bitmapcount = xmmword_1817D5258;
  *(_QWORD *)&v223.fileattr = 0;
  *(_OWORD *)&v222.bitmapcount = xmmword_1817D5258;
  *(_QWORD *)&v222.fileattr = 0;
  v221 = 0;
  v219 = 0u;
  v220 = 0u;
  v218 = 0;
  v15 = MountInfoStorageSize();
  v16 = (char *)&v158 - ((MEMORY[0x1E0C80A78](v15) + 15) & 0xFFFFFFFFFFFFFFF0);
  if (!CFURLGetFileSystemRepresentation((CFURLRef)a1, 1u, (UInt8 *)v225, 1024))
  {
    if (!a8)
      return 0;
    v29 = CFGetAllocator(a1);
    v30 = _FSURLCreateStandardError(v29, (const __CFString *)*MEMORY[0x1E0C9AFB8], 4, 1, a1, 0);
    v31 = 0;
    *a8 = v30;
    return v31;
  }
  v201 = Attributes;
  v182 = v16;
  v180 = a2;
  v192 = a1;
  v199 = a8;
  v190 = &v158;
  v185 = a6;
  if (a6 >= 1)
  {
    v18 = 0;
    v19 = 0;
    v210 = 0;
    v211 = 0;
    v191 = 0;
    v193 = 0;
    v194 = 0;
    v214 = 0;
    v215 = 0;
    v216 = 0;
    v186 = 0;
    v183 = 0;
    v208 = 0;
    v209 = 0;
    v206 = 0;
    v207 = 0;
    v195 = 0;
    v196 = 0;
    v197 = 0;
    v198 = 0;
    v204 = 0;
    v205 = 0;
    v202 = 0;
    v203 = 0;
    v200 = 0;
    v213 = 0;
    v20 = (const void *)*MEMORY[0x1E0C9B5A0];
    v21 = (const void *)*MEMORY[0x1E0C9B408];
    v212 = (CFTypeRef)*MEMORY[0x1E0C9B400];
    v189 = (CFTypeRef)*MEMORY[0x1E0C9B3F8];
    *(_QWORD *)&v17 = 138412546;
    v166 = v17;
    v188 = (CFTypeRef)*MEMORY[0x1E0C9B3B8];
    v187 = (CFTypeRef)*MEMORY[0x1E0C9AC60];
    v184 = (CFTypeRef)*MEMORY[0x1E0C9B4F8];
    v181 = (CFTypeRef)*MEMORY[0x1E0C9B4D0];
    v179 = (CFTypeRef)*MEMORY[0x1E0C9B4C8];
    v178 = (CFTypeRef)*MEMORY[0x1E0C9B568];
    v177 = (CFTypeRef)*MEMORY[0x1E0C9ACE8];
    v176 = (CFTypeRef)*MEMORY[0x1E0C9B548];
    v175 = (CFTypeRef)*MEMORY[0x1E0C9ACD8];
    v174 = (CFTypeRef)*MEMORY[0x1E0C9ACF0];
    v173 = (CFTypeRef)*MEMORY[0x1E0C9AC88];
    v172 = (CFTypeRef)*MEMORY[0x1E0C9ACF8];
    v171 = (CFTypeRef)*MEMORY[0x1E0C9ACE0];
    v170 = (CFTypeRef)*MEMORY[0x1E0C9ACB8];
    v169 = (CFTypeRef)*MEMORY[0x1E0C9B538];
    v168 = (CFTypeRef)*MEMORY[0x1E0C9ACB0];
    v167 = (CFTypeRef)*MEMORY[0x1E0C9ACA8];
    v165 = (CFTypeRef)*MEMORY[0x1E0C9ACD0];
    v164 = (CFTypeRef)*MEMORY[0x1E0C9B4A0];
    v163 = (CFTypeRef)*MEMORY[0x1E0C9B460];
    v162 = (CFTypeRef)*MEMORY[0x1E0C9B468];
    v161 = (CFTypeRef)*MEMORY[0x1E0C9B448];
    v160 = (CFTypeRef)*MEMORY[0x1E0C9B450];
    v159 = (CFTypeRef)*MEMORY[0x1E0C9B458];
    v22 = a6;
    while (1)
    {
      v23 = *a3;
      v24 = (const __CFString *)*a4;
      if (CFEqual(*a3, v20))
      {
        v18 = v24;
      }
      else if (CFEqual(v23, v21))
      {
        v223.commonattr |= 0x200u;
        v19 = v24;
      }
      else if (CFEqual(v23, v212))
      {
        v223.commonattr |= 0x400u;
        v210 = v24;
      }
      else if (CFEqual(v23, v189))
      {
        v223.commonattr |= 0x1000u;
        v191 = v24;
      }
      else if (CFEqual(v23, v188))
      {
        v223.commonattr |= 0x10000000u;
        v193 = v24;
      }
      else if (CFEqual(v23, v187))
      {
        v223.commonattr |= 0x4000u;
        v214 = (CFDataRef)v24;
      }
      else if (CFEqual(v23, v184))
      {
        v186 = valueOfBoolean((const __CFBoolean *)v24);
        if (v186)
          v25 = (~*(_DWORD *)v201 & 0x801) != 0;
        else
          v25 = 1;
        v183 = v25;
        v223.commonattr |= 0x44000u;
        v216 = v24;
      }
      else if (CFEqual(v23, v181))
      {
        v223.commonattr |= 0x4000u;
        v211 = (const __CFBoolean *)v24;
      }
      else if (CFEqual(v23, v179))
      {
        v223.commonattr |= 0x4000u;
        v209 = (const __CFBoolean *)v24;
      }
      else if (CFEqual(v23, v178))
      {
        v223.commonattr |= 0x4000u;
        v207 = (CFNumberRef)v24;
      }
      else if (CFEqual(v23, v177))
      {
        v223.commonattr |= 0x40000u;
        v196 = (const __CFBoolean *)v24;
      }
      else if (CFEqual(v23, v176))
      {
        v223.commonattr |= 0x40000u;
        v198 = (const __CFBoolean *)v24;
      }
      else if (CFEqual(v23, v175))
      {
        v223.commonattr |= 0x40000u;
        v195 = (const __CFBoolean *)v24;
      }
      else if (CFEqual(v23, v174))
      {
        v223.commonattr |= 0x40000u;
        v194 = (const __CFBoolean *)v24;
      }
      else if (CFEqual(v23, v173))
      {
        v223.commonattr |= 0x40000u;
        v215 = (const __CFBoolean *)v24;
      }
      else if (CFEqual(v23, v172))
      {
        v223.commonattr |= 0x40000u;
        v206 = (const __CFBoolean *)v24;
      }
      else if (CFEqual(v23, v171))
      {
        v223.commonattr |= 0x40000u;
        v205 = (const __CFBoolean *)v24;
      }
      else if (CFEqual(v23, v170))
      {
        if (!_CFGetEUID())
        {
          v223.commonattr |= 0x40000u;
          v204 = (const __CFBoolean *)v24;
        }
      }
      else if (CFEqual(v23, v169))
      {
        if (!_CFGetEUID())
        {
          v223.commonattr |= 0x40000u;
          v203 = (const __CFBoolean *)v24;
        }
      }
      else if (CFEqual(v23, v168))
      {
        if (!_CFGetEUID())
        {
          v223.commonattr |= 0x40000u;
          v202 = (const __CFBoolean *)v24;
        }
      }
      else if (CFEqual(v23, v167))
      {
        if (!_CFGetEUID())
        {
          v223.commonattr |= 0x40000u;
          v200 = (const __CFBoolean *)v24;
        }
      }
      else if (CFEqual(v23, v165))
      {
        if (!_CFGetEUID())
        {
          v223.commonattr |= 0x40000u;
          v197 = (const __CFBoolean *)v24;
        }
      }
      else if (CFEqual(v23, v164))
      {
        v223.commonattr |= 0x1C38000u;
        v208 = (CFFileSecurityRef)v24;
      }
      else if (CFEqual(v23, v163))
      {
        if (CFEqual(v24, v162))
        {
          v26 = 4;
        }
        else if (CFEqual(v24, v161))
        {
          v26 = 1;
        }
        else if (CFEqual(v24, v160))
        {
          v26 = 2;
        }
        else
        {
          if (!CFEqual(v24, v159))
          {
            v27 = defaultLog;
            v28 = os_log_type_enabled((os_log_t)defaultLog, OS_LOG_TYPE_DEFAULT);
            v213 = 0;
            if (v28)
            {
              *(_DWORD *)v224 = v166;
              *(_QWORD *)&v224[4] = v24;
              *(_WORD *)&v224[12] = 2112;
              *(_QWORD *)&v224[14] = v192;
              _os_log_impl(&dword_1817A6000, v27, OS_LOG_TYPE_DEFAULT, "ignoring unsupported value: kCFURLFileProtectionKey=%@ for %@", v224, 0x16u);
              v213 = 0;
            }
            goto LABEL_23;
          }
          v26 = 3;
        }
        v213 = v26;
      }
LABEL_23:
      ++a4;
      ++a3;
      if (!--v22)
        goto LABEL_75;
    }
  }
  v197 = 0;
  v198 = 0;
  v207 = 0;
  v208 = 0;
  v213 = 0;
  v214 = 0;
  v200 = 0;
  v202 = 0;
  v203 = 0;
  v204 = 0;
  v205 = 0;
  v206 = 0;
  v215 = 0;
  v216 = 0;
  v194 = 0;
  v195 = 0;
  v196 = 0;
  v209 = 0;
  v210 = 0;
  v211 = 0;
  v183 = 0;
  v186 = 0;
  v193 = 0;
  v191 = 0;
  v19 = 0;
  v18 = 0;
LABEL_75:
  if (!v18 && !v214 && !v216 && !v211 && !v209 && !v207 && !(_DWORD)v213)
  {
    LODWORD(v181) = 0;
    v32 = 0;
    LODWORD(v212) = 0;
    v33 = (unint64_t)v208;
    v34 = v202;
    v35 = v203;
    v36 = v204;
    v37 = v205;
    goto LABEL_102;
  }
  v34 = v202;
  v38 = *(_DWORD *)v201;
  v35 = v203;
  v36 = v204;
  v37 = v205;
  if ((*(_DWORD *)v201 & 1) != 0)
  {
    LODWORD(v181) = *(_DWORD *)(v201 + 112);
    v32 = *(_DWORD *)(v201 + 104);
    LODWORD(v212) = objectTypeFromAccessMask(*(_DWORD *)(v201 + 16));
  }
  else
  {
    LODWORD(v181) = 0;
    v32 = 0;
    LODWORD(v212) = 0;
    v222.commonattr |= 0x8000000C;
  }
  if (v214 || v216 || v211 || v209 || v207)
  {
    if (v214)
    {
      v39 = v214;
      if (CFDataGetLength(v214) == 32)
      {
        v227.location = 0;
        v227.length = 32;
        CFDataGetBytes(v39, v227, (UInt8 *)&v219);
        goto LABEL_99;
      }
      v38 = *(_DWORD *)v201;
    }
    if ((v38 & 0x10) != 0)
    {
      v40 = *(_OWORD *)(v201 + 176);
      v219 = *(_OWORD *)(v201 + 160);
      v220 = v40;
    }
    else
    {
      v222.commonattr |= 0x8004400C;
    }
  }
LABEL_99:
  if ((_DWORD)v213)
    v222.commonattr |= 0xC0000008;
  v33 = (unint64_t)v208;
LABEL_102:
  v41 = (unint64_t)v216 | (unint64_t)v196 | (unint64_t)v198 | (unint64_t)v195 | (unint64_t)v194;
  LODWORD(v187) = v41 != 0;
  if (v41 || v215 || v206 || v37 || v36 || v35 || v34 || v200 || v197)
  {
    v222.commonattr |= 0x8004000C;
    if (v18)
    {
LABEL_112:
      v42 = (unsigned int *)v201;
      if ((*(_DWORD *)v201 & 1) != 0)
      {
        LODWORD(v188) = (*(_DWORD *)v201 >> 13) & 1;
      }
      else
      {
        LODWORD(v188) = 0;
        v222.dirattr |= 4u;
      }
      goto LABEL_117;
    }
  }
  else if (v18)
  {
    goto LABEL_112;
  }
  LODWORD(v188) = 0;
  v42 = (unsigned int *)v201;
LABEL_117:
  v43 = (unint64_t)v216 | (unint64_t)v215 | v33;
  v44 = v43 != 0;
  if (v43)
  {
    v45 = *v42;
    if ((*v42 & 1) != 0)
    {
      v201 = (v45 >> 17) & 1;
      LODWORD(v46) = (v45 >> 19) & 1;
      v47 = (const void *)((v45 >> 21) & 1);
    }
    else
    {
      v201 = 0;
      LODWORD(v46) = 0;
      v47 = 0;
      v222.commonattr |= 0x80000004;
    }
  }
  else
  {
    v201 = 0;
    LODWORD(v46) = 0;
    v47 = 0;
  }
  v184 = v47;
  if ((vmaxv_u16((uint16x4_t)vmovn_s32(vtstq_s32(*(int32x4_t *)&v222.commonattr, *(int32x4_t *)&v222.commonattr))) & 1) == 0
    && !v222.forkattr)
  {
    v48 = 0;
    LODWORD(v189) = 0;
    v31 = 1;
    v49 = v199;
    goto LABEL_149;
  }
  v50 = calculateAttributeBufferSize(&v222, 0);
  MEMORY[0x1E0C80A78](v50);
  v52 = (char *)&v158 - v51;
  v54 = filtered_getattrlist((char *)v225, &v222, (char *)&v158 - v51, v53, 0x21u);
  v31 = v54 == 0;
  if (v54)
  {
    v49 = v199;
    if (v199)
    {
      v56 = v192;
      v57 = CFGetAllocator(v192);
      v58 = (const __CFString *)*MEMORY[0x1E0C9AFD0];
      v59 = __error();
      v60 = _FSURLCreateStandardError(v57, v58, *v59, 1, v56, 0);
      v48 = 0;
      LODWORD(v189) = 0;
      *v49 = v60;
    }
    else
    {
      v48 = 0;
      LODWORD(v189) = 0;
    }
    goto LABEL_149;
  }
  v61 = *((_DWORD *)v52 + 1);
  if ((v61 & 4) != 0)
  {
    v32 = *((_DWORD *)v52 + 6);
    v62 = v52 + 32;
    if ((v61 & 8) == 0)
      goto LABEL_134;
    goto LABEL_133;
  }
  v62 = v52 + 24;
  if ((v61 & 8) != 0)
  {
LABEL_133:
    v63 = *(_DWORD *)v62;
    v62 += 4;
    LODWORD(v212) = v63;
  }
LABEL_134:
  if ((v61 & 0x4000) == 0)
  {
    if ((v61 & 0x40000) == 0)
      goto LABEL_136;
LABEL_142:
    v67 = *(_DWORD *)v62;
    v62 += 4;
    LODWORD(v189) = v67;
    if ((v61 & 0x40000000) != 0)
      goto LABEL_137;
LABEL_143:
    v48 = 0;
    goto LABEL_144;
  }
  v65 = *((_OWORD *)v62 + 1);
  v219 = *(_OWORD *)v62;
  v66.i32[1] = DWORD1(v219);
  v220 = v65;
  v66.i32[0] = 2;
  v55.i32[0] = (int)v212;
  *(int8x8_t *)&v219 = vbsl_s8((int8x8_t)vdup_lane_s32(vceq_s32(v55, v66), 0), vrev16_s8(*(int8x8_t *)&v219), vrev32_s8(*(int8x8_t *)&v219));
  *((int8x8_t *)&v219 + 1) = vrev16_s8(*(int8x8_t *)((char *)&v219 + 8));
  if ((_DWORD)v212 == 2)
  {
    WORD1(v220) = bswap32(WORD1(v220)) >> 16;
    LOWORD(v220) = bswap32((unsigned __int16)v220) >> 16;
    DWORD1(v220) = bswap32(DWORD1(v220));
  }
  else
  {
    *(int8x8_t *)&v220 = vrev16_s8(*(int8x8_t *)&v220);
  }
  WORD4(v220) = bswap32(WORD4(v220)) >> 16;
  WORD5(v220) = bswap32(WORD5(v220)) >> 16;
  HIDWORD(v220) = bswap32(HIDWORD(v220));
  v62 += 32;
  if ((v61 & 0x40000) != 0)
    goto LABEL_142;
LABEL_136:
  LODWORD(v189) = 0;
  if ((v61 & 0x40000000) == 0)
    goto LABEL_143;
LABEL_137:
  v64 = *(_DWORD *)v62;
  v62 += 4;
  v48 = v64;
LABEL_144:
  if ((v52[12] & 4) != 0)
    LODWORD(v188) = *(_DWORD *)v62 & 1;
  v49 = v199;
  if (v44 && MountInfoPrepare(&v218, (int)v181, v32, v182, 0, 0, 0))
  {
    Capabilities = MountInfoGetCapabilities(v218);
    v201 = (Capabilities >> 47) & 1;
    v46 = (Capabilities >> 59) & 1;
    v184 = (CFTypeRef)((Capabilities >> 58) & 1);
  }
LABEL_149:
  v69 = v192;
  v70 = v193;
  v71 = 0;
  if (v215 && (_DWORD)v46)
  {
    v223.commonattr |= 0x40000u;
    v71 = v215;
  }
  v72 = v208;
  if (v208 && (_DWORD)v201 && !CFFileSecurityCopyAccessControlList(v208, &v221))
    v221 = 0;
  if (v31 && v223.commonattr)
  {
    LODWORD(v193) = v48;
    if (v221)
      v73 = acl_size(v221);
    else
      v73 = 0;
    v74 = calculateAttributeBufferSize(&v223, v73);
    v215 = (const __CFBoolean *)&v158;
    MEMORY[0x1E0C80A78](v74);
    v76 = (int8x8_t *)((char *)&v158 - v75);
    v223.commonattr = 0;
    v77 = (int8x8_t *)((char *)&v158 - v75);
    if (v19)
    {
      if (CFEqual(v19, (CFTypeRef)*MEMORY[0x1E0C9B0D0]))
      {
        *v76 = 0;
        v76[1] = 0;
      }
      else
      {
        v78 = MEMORY[0x186DA2DD8](v19);
        *(_QWORD *)v224 = 0;
        v79 = modf(v78, (long double *)v224);
        v80 = *(double *)v224;
        if (v79 < 0.0)
        {
          v80 = *(double *)v224 + -1.0;
          v79 = v79 + 1.0;
        }
        *v76 = (int8x8_t)(uint64_t)(v80 + *MEMORY[0x1E0C9ADF8]);
        v76[1] = (int8x8_t)(uint64_t)(v79 * 1000000000.0 + 0.5);
      }
      v77 = v76 + 2;
      v223.commonattr |= 0x200u;
    }
    v81 = v74;
    if (v210)
    {
      v82 = v70;
      v83 = v69;
      v84 = v210;
      if (CFEqual(v210, (CFTypeRef)*MEMORY[0x1E0C9B0D0]))
      {
        *v77 = 0;
        v77[1] = 0;
      }
      else
      {
        v86 = MEMORY[0x186DA2DD8](v84);
        *(_QWORD *)v224 = 0;
        v87 = modf(v86, (long double *)v224);
        v88 = *(double *)v224;
        if (v87 < 0.0)
        {
          v88 = *(double *)v224 + -1.0;
          v87 = v87 + 1.0;
        }
        *v77 = (int8x8_t)(uint64_t)(v88 + *MEMORY[0x1E0C9ADF8]);
        v77[1] = (int8x8_t)(uint64_t)(v87 * 1000000000.0 + 0.5);
      }
      v85 = v191;
      v77 += 2;
      v223.commonattr |= 0x400u;
      v69 = v83;
      if (!v191)
      {
LABEL_183:
        v94 = v82;
        if (v214 || v216 || v211 || v209 || v207)
        {
          *(_OWORD *)v224 = v219;
          *(_OWORD *)&v224[16] = v220;
          v95 = v81;
          if (v216 && v183)
            WORD4(v219) = WORD4(v219) & 0xBFFF | ((v186 != 0) << 14);
          v96 = (char)v187;
          if (v211 && (_DWORD)v212 == 1)
          {
            v97 = valueOfBoolean(v211) != 0;
            WORD4(v219) = WORD4(v219) & 0x7FFF | (v97 << 15);
          }
          if (v209)
          {
            v98 = valueOfBoolean(v209) != 0;
            WORD4(v219) = WORD4(v219) & 0xFFEF | (16 * v98);
          }
          if (v207)
          {
            LODWORD(v217) = 0;
            if (CFNumberGetValue(v207, kCFNumberSInt32Type, &v217))
            {
              if ((v217 & 0x80000000) == 0 && (int)v217 <= 7)
                WORD4(v219) = WORD4(v219) & 0xFFF1 | (2 * (_WORD)v217);
            }
          }
          if (v214
            || (*(_QWORD *)v224 == (_QWORD)v219 ? (v99 = *(_QWORD *)&v224[8] == *((_QWORD *)&v219 + 1)) : (v99 = 0),
                v99 ? (v100 = *(_QWORD *)&v224[16] == (_QWORD)v220) : (v100 = 0),
                v100 ? (v101 = *(_QWORD *)&v224[24] == *((_QWORD *)&v220 + 1)) : (v101 = 0),
                !v101))
          {
            v102 = v220;
            *(_OWORD *)v77->i8 = v219;
            *(_OWORD *)v77[2].i8 = v102;
            if ((_DWORD)v212 == 2)
              v103 = vrev16_s8(*v77);
            else
              v103 = vrev32_s8(*v77);
            v104 = vrev16_s8(v77[1]);
            *v77 = v103;
            v77[1] = v104;
            if ((_DWORD)v212 == 2)
            {
              v77[2].i16[1] = bswap32(v77[2].u16[1]) >> 16;
              v77[2].i16[0] = bswap32(v77[2].u16[0]) >> 16;
              v77[2].i32[1] = bswap32(v77[2].u32[1]);
            }
            else
            {
              v77[2] = vrev16_s8(v77[2]);
            }
            v77[3].i16[0] = bswap32(v77[3].u16[0]) >> 16;
            v77[3].i16[1] = bswap32(v77[3].u16[1]) >> 16;
            v77[3].i32[1] = bswap32(v77[3].u32[1]);
            v77 += 4;
            v223.commonattr |= 0x4000u;
          }
        }
        else
        {
          v95 = v81;
          v96 = (char)v187;
        }
        if (v72)
        {
          *(_WORD *)v224 = 0;
          if (CFFileSecurityGetOwner(v72, (uid_t *)v77))
          {
            v77 = (int8x8_t *)((char *)v77 + 4);
            v223.commonattr |= 0x8000u;
          }
          if (CFFileSecurityGetGroup(v72, (gid_t *)v77))
          {
            v77 = (int8x8_t *)((char *)v77 + 4);
            v223.commonattr |= 0x10000u;
          }
          if (CFFileSecurityGetMode(v72, (mode_t *)v224))
          {
            v77->i32[0] = *(unsigned __int16 *)v224;
            v77 = (int8x8_t *)((char *)v77 + 4);
            v223.commonattr |= 0x20000u;
          }
        }
        if (v71)
          v105 = 1;
        else
          v105 = v96;
        if ((v105 & 1) == 0 && !v206 && !v205 && !v204 && !v203 && !v202 && !v200 && !v197)
        {
LABEL_295:
          if (v72)
          {
            if (v221)
            {
              v109 = (CFUUIDBytes *)&v77[1];
              v223.commonattr |= 0x400000u;
            }
            else
            {
              v109 = (CFUUIDBytes *)v77;
              v77 = 0;
            }
            if ((_DWORD)v201)
            {
              *(_QWORD *)v224 = 0;
              if (CFFileSecurityCopyOwnerUUID(v72, (CFUUIDRef *)v224))
              {
                *v109++ = CFUUIDGetUUIDBytes(*(CFUUIDRef *)v224);
                CFRelease(*(CFTypeRef *)v224);
                v223.commonattr |= 0x800000u;
              }
              if (CFFileSecurityCopyGroupUUID(v72, (CFUUIDRef *)v224))
              {
                *v109++ = CFUUIDGetUUIDBytes(*(CFUUIDRef *)v224);
                CFRelease(*(CFTypeRef *)v224);
                v223.commonattr |= 0x1000000u;
              }
            }
            if (v77)
            {
              v110 = acl_size(v221);
              bzero(v109, v110);
              v77->i32[0] = (_DWORD)v109 - (_DWORD)v77;
              v111 = v221;
              v112 = acl_size(v221);
              v113 = acl_copy_ext_native(v109, v111, v112);
              v77->i32[1] = v113;
              v77 = (int8x8_t *)(&v109->byte0 + v113);
              if (!v94)
              {
LABEL_316:
                v117 = setattrlist((const char *)v225, &v223, v76, v95, 1u);
                v31 = v117 == 0;
                v49 = v199;
                if (v199 && v117)
                {
                  v118 = CFGetAllocator(v69);
                  v119 = (const __CFString *)*MEMORY[0x1E0C9AFD0];
                  v120 = __error();
                  *v49 = _FSURLCreateStandardError(v118, v119, *v120, 1, v69, 0);
                }
                v48 = (int)v193;
                goto LABEL_320;
              }
            }
            else
            {
              v77 = (int8x8_t *)v109;
              if (!v94)
                goto LABEL_316;
            }
          }
          else if (!v94)
          {
            goto LABEL_316;
          }
          if (CFEqual(v94, (CFTypeRef)*MEMORY[0x1E0C9B0D0]))
          {
            *v77 = 0;
            v77[1] = 0;
          }
          else
          {
            v114 = MEMORY[0x186DA2DD8](v94);
            *(_QWORD *)v224 = 0;
            v115 = modf(v114, (long double *)v224);
            v116 = *(double *)v224;
            if (v115 < 0.0)
            {
              v116 = *(double *)v224 + -1.0;
              v115 = v115 + 1.0;
            }
            *v77 = (int8x8_t)(uint64_t)(v116 + *MEMORY[0x1E0C9ADF8]);
            v77[1] = (int8x8_t)(uint64_t)(v115 * 1000000000.0 + 0.5);
          }
          v223.commonattr |= 0x10000000u;
          goto LABEL_316;
        }
        v106 = v189;
        v107 = v198;
        if (v216)
        {
          v106 = v189;
          if ((_DWORD)v184)
          {
            if (!v186)
            {
              v106 = v189 & 0xFFFF7FFF;
              if (!v196)
                goto LABEL_247;
              goto LABEL_243;
            }
            v106 = v189 | 0x8000;
          }
        }
        if (!v196)
          goto LABEL_247;
LABEL_243:
        if (valueOfBoolean(v196))
          v106 |= 1u;
        else
          v106 &= ~1u;
        v107 = v198;
LABEL_247:
        if (v107)
        {
          if (valueOfBoolean(v107))
            v106 |= 2u;
          else
            v106 &= ~2u;
        }
        if (v195)
        {
          if (valueOfBoolean(v195))
            v106 |= 4u;
          else
            v106 &= ~4u;
        }
        if (v194)
        {
          if (!valueOfBoolean(v194))
          {
            v106 &= ~8u;
            if (!v71)
              goto LABEL_264;
            goto LABEL_259;
          }
          v106 |= 8u;
        }
        if (!v71)
          goto LABEL_264;
LABEL_259:
        if (valueOfBoolean(v71))
          v106 |= 0x20u;
        else
          v106 &= ~0x20u;
LABEL_264:
        v108 = v197;
        if (v206)
        {
          if (valueOfBoolean(v206))
            v106 |= 0x40u;
          else
            v106 &= ~0x40u;
        }
        if (v205)
        {
          if (valueOfBoolean(v205))
            v106 |= 0x80u;
          else
            v106 &= ~0x80u;
        }
        if (v204)
        {
          if (valueOfBoolean(v204))
            v106 |= 0x10000u;
          else
            v106 &= ~0x10000u;
        }
        if (v203)
        {
          if (valueOfBoolean(v203))
            v106 |= 0x20000u;
          else
            v106 &= ~0x20000u;
        }
        if (v202)
        {
          if (valueOfBoolean(v202))
            v106 |= 0x40000u;
          else
            v106 &= ~0x40000u;
        }
        if (v200)
        {
          if (!valueOfBoolean(v200))
          {
            v106 &= ~0x80000u;
            if (!v108)
              goto LABEL_293;
            goto LABEL_288;
          }
          v106 |= 0x80000u;
        }
        if (!v108)
          goto LABEL_293;
LABEL_288:
        if (valueOfBoolean(v108))
          v106 |= 0x100000u;
        else
          v106 &= ~0x100000u;
LABEL_293:
        if (v106 != (_DWORD)v189)
        {
          v77->i32[0] = v106;
          v77 = (int8x8_t *)((char *)v77 + 4);
          v223.commonattr |= 0x40000u;
        }
        goto LABEL_295;
      }
    }
    else
    {
      v82 = v70;
      v85 = v191;
      if (!v191)
        goto LABEL_183;
    }
    v89 = v69;
    v90 = v85;
    if (CFEqual(v85, (CFTypeRef)*MEMORY[0x1E0C9B0D0]))
    {
      *v77 = 0;
      v77[1] = 0;
    }
    else
    {
      v91 = MEMORY[0x186DA2DD8](v90);
      *(_QWORD *)v224 = 0;
      v92 = modf(v91, (long double *)v224);
      v93 = *(double *)v224;
      if (v92 < 0.0)
      {
        v93 = *(double *)v224 + -1.0;
        v92 = v92 + 1.0;
      }
      *v77 = (int8x8_t)(uint64_t)(v93 + *MEMORY[0x1E0C9ADF8]);
      v77[1] = (int8x8_t)(uint64_t)(v92 * 1000000000.0 + 0.5);
    }
    v77 += 2;
    v223.commonattr |= 0x1000u;
    v69 = v89;
    goto LABEL_183;
  }
LABEL_320:
  if (v31 && (_DWORD)v213 && (_DWORD)v213 != v48 && ((_DWORD)v212 - 1) <= 1)
  {
    if ((_DWORD)v212 == 1)
    {
      v121 = open((const char *)v225, 1);
      v122 = 0;
      if (v121 < 0)
      {
LABEL_334:
        v127 = 0;
        goto LABEL_340;
      }
    }
    else
    {
      v123 = opendir((const char *)v225);
      if (!v123)
        goto LABEL_334;
      v122 = v123;
      v121 = dirfd(v123);
      if (v121 < 0)
        goto LABEL_334;
    }
    v217 = 0;
    v124 = (const __CFString *)*MEMORY[0x1E0C9B770];
    v125 = (const void *)__CFURLResourceInfoPtr();
    if (_FSURLCopyResourcePropertyForKeyInternal((const __CFURL *)v69, v124, (void **)&v217, v125, 0, 1))
    {
      if (v217 == (_BYTE *)*MEMORY[0x1E0C9AE50] && fcntl(v121, 64, v213) == -1)
      {
        v126 = defaultLog;
        v127 = 0;
        if (os_log_type_enabled((os_log_t)defaultLog, OS_LOG_TYPE_DEFAULT))
        {
          v128 = *__error();
          *(_DWORD *)v224 = 138412546;
          *(_QWORD *)&v224[4] = v69;
          *(_WORD *)&v224[12] = 1024;
          *(_DWORD *)&v224[14] = v128;
          _os_log_impl(&dword_1817A6000, v126, OS_LOG_TYPE_DEFAULT, "%@: error setting protection class: %{errno}d", v224, 0x12u);
          v127 = 0;
        }
        goto LABEL_337;
      }
    }
    else
    {
      fcntl(v121, 64, v213);
    }
    v127 = 1;
LABEL_337:
    if (v122)
      closedir(v122);
    else
      close(v121);
LABEL_340:
    if (v185 == 1 && !v127)
    {
      if (v49)
      {
        v129 = CFGetAllocator(v69);
        v31 = 0;
        *v49 = _FSURLCreateStandardError(v129, (const __CFString *)*MEMORY[0x1E0C9AFB8], 513, 1, v69, 0);
      }
      else
      {
        v31 = 0;
      }
      goto LABEL_384;
    }
  }
  if (!v18 || !v31)
    goto LABEL_384;
  v217 = 0;
  if ((_DWORD)v188)
  {
    if (v49)
    {
      v130 = CFGetAllocator(v69);
      v31 = 0;
      *v49 = _FSURLCreateStandardError(v130, (const __CFString *)*MEMORY[0x1E0C9AFD0], 45, 1, v69, 0);
      goto LABEL_384;
    }
    goto LABEL_380;
  }
  v131 = strlcpy(v224, (const char *)v225, 0x400uLL);
  if (!v131)
  {
LABEL_377:
    if (v49)
    {
      v141 = CFGetAllocator(v69);
      v142 = (const __CFString *)*MEMORY[0x1E0C9AFB8];
      v143 = 4;
      v144 = 0;
LABEL_379:
      *v49 = _FSURLCreateStandardError(v141, v142, v143, v144, v69, 0);
    }
LABEL_380:
    v31 = 0;
    goto LABEL_384;
  }
  v132 = 0;
  v133 = &v224[v131];
  do
  {
    if (v133 - 1 <= v224)
      goto LABEL_377;
    v134 = &v133[-(*(v133 - 1) == 0) - 1];
    if (v134 > v224)
    {
      while (*v134 == 47)
      {
        if (--v134 <= v224)
        {
          v134 = v224;
          break;
        }
      }
    }
    if (v134 == v224)
      goto LABEL_377;
    v135 = v134;
    if (v134 > v224)
    {
      v135 = v134;
      while (*v135 != 47)
      {
        if (--v135 <= v224)
        {
          v135 = v224;
          break;
        }
      }
    }
    v136 = v134 + 1;
    if (*v135 == 47)
      v133 = v135 + 1;
    else
      v133 = v135;
    v137 = v136 - v133;
    if (v137 == 1)
    {
      if (*v133 == 46)
        continue;
    }
    else if (v137 == 2 && *v133 == 46 && v133[1] == 46)
    {
      ++v132;
      continue;
    }
    --v132;
  }
  while (v132 != -1);
  v228.length = CFStringGetLength(v18);
  v228.location = 0;
  Bytes = CFStringGetBytes(v18, v228, 0x8000100u, 0, 0, v133, (CFIndex)&v224[~(unint64_t)v133 + 1024], (CFIndex *)&v217);
  if (Bytes != CFStringGetLength(v18))
    goto LABEL_391;
  if (v217 != (_BYTE *)2)
  {
    if (v217 == (_BYTE *)1)
    {
      v140 = *v133;
      goto LABEL_390;
    }
    goto LABEL_393;
  }
  if (*v133 == 46)
  {
    v140 = v133[1];
LABEL_390:
    if (v140 == 46)
    {
LABEL_391:
      if (!v49)
        goto LABEL_380;
      v141 = CFGetAllocator(v69);
      v142 = (const __CFString *)*MEMORY[0x1E0C9AFB8];
      v143 = 514;
      goto LABEL_396;
    }
  }
LABEL_393:
  v217[(_QWORD)v133] = 0;
  rename(v225, (const std::__fs::filesystem::path *)v224, v139);
  if (v49 && v146)
  {
    v147 = CFGetAllocator(v69);
    v148 = (const __CFString *)*MEMORY[0x1E0C9AFD0];
    v143 = *__error();
    v141 = v147;
    v142 = v148;
LABEL_396:
    v144 = 1;
    goto LABEL_379;
  }
  if (v146)
    goto LABEL_380;
  v149 = v180;
  if ((*(_BYTE *)_FileCacheGetAttributes(v180) & 1) != 0)
  {
    v150 = _FileCacheGetAttributes(v149);
    v151 = CFGetAllocator(v69);
    Copy = CFStringCreateCopy(v151, v18);
    v153 = *(const void **)(v150 + 8);
    if (v153)
      CFRelease(v153);
    *(_QWORD *)(v150 + 8) = Copy;
    Length = CFStringGetLength(Copy);
    if (Length < 1)
      v155 = 0;
    else
      v155 = (CFStringGetCharacterAtIndex(Copy, 0) == 46) << 11;
    v156 = 0;
    v157 = *(_DWORD *)v150 & 0xFFFFF7FF | v155;
    *(_DWORD *)v150 = v157;
    if (Length > 1 && v155)
    {
      v156 = (CFStringGetCharacterAtIndex(Copy, 1) == 46) << 12;
      v157 = *(_DWORD *)v150;
    }
    *(_DWORD *)v150 = v157 & 0xFFFFEFFF | v156;
  }
  v31 = 1;
LABEL_384:
  if (v221)
    acl_free(v221);
  MountInfoDestroy(v218);
  return v31;
}

CFMutableDictionaryRef ___ZN21SandboxExtensionCache6sharedEv_block_invoke()
{
  uint64_t v0;
  CFMutableDictionaryRef result;

  v0 = operator new();
  *(_DWORD *)v0 = 0;
  result = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0, MEMORY[0x1E0C9B390], 0);
  *(_QWORD *)(v0 + 8) = result;
  SandboxExtensionCache::shared(void)::shared = v0;
  return result;
}

uint64_t createVolumeURL(__CFAllocator *a1, int a2, fsid *a3, CFURLRef *a4)
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  const char *MountPoint;
  fsid v11;
  NSObject *v12;
  fsid v13;
  size_t v14;
  size_t v15;
  CFURLRef v16;
  uint64_t v18;
  uint64_t v19;
  int v20;
  const char *v21;
  __int16 v22;
  fsid v23;
  statfs v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  if (a2)
  {
    v7 = 1;
    *a4 = createFileReferenceURLRef(a1, a3[14].val[0], 0, 2, 0, 1u);
    return v7;
  }
  v19 = 0;
  v8 = MountInfoStorageSize();
  v9 = MEMORY[0x1E0C80A78](v8);
  if (MountInfoPrepare(&v19, a3[14].val[0], 0, (char *)&v18 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0), 0, 0, 0))
  {
    MountPoint = (const char *)MountInfoGetMountPoint(v19);
    if (!MountPoint)
      goto LABEL_7;
LABEL_10:
    v14 = strlen(MountPoint);
    if (v14)
    {
      v15 = v14;
      if (v19)
      {
        if (initGlobalsOnce(void)::onceToken != -1)
          dispatch_once(&initGlobalsOnce(void)::onceToken, &__block_literal_global_3);
        v16 = (CFURLRef)MEMORY[0x186DA3264](a1, MountPoint, v15, 1, 0);
      }
      else
      {
        v16 = CFURLCreateFromFileSystemRepresentation(a1, (const UInt8 *)MountPoint, v14, 1u);
      }
      *a4 = v16;
      v7 = 1;
      goto LABEL_18;
    }
    goto LABEL_15;
  }
  v11 = a3[13];
  if (!GetStatfsByFSID(v11, &v24))
  {
    MountPoint = v24.f_mntonname;
    goto LABEL_10;
  }
LABEL_7:
  v12 = defaultLog;
  v7 = 0;
  if (!os_log_type_enabled((os_log_t)defaultLog, OS_LOG_TYPE_DEFAULT))
    goto LABEL_18;
  v13 = a3[29];
  v20 = 136315394;
  v21 = "createVolumeURL";
  v22 = 2112;
  v23 = v13;
  _os_log_impl(&dword_1817A6000, v12, OS_LOG_TYPE_DEFAULT, "%s: no mountpoint for path: %@", (uint8_t *)&v20, 0x16u);
LABEL_15:
  v7 = 0;
LABEL_18:
  if (v19)
    MountInfoDestroy(v19);
  return v7;
}

uint64_t MountInfoGetMountPoint(uint64_t a1)
{
  return a1 + 88;
}

uint64_t _FSURLGetVolumePropertyFlags(const __CFURL *a1, uint64_t a2, uint64_t *a3, CFTypeRef cf, CFErrorRef *a5)
{
  CFTypeRef v9;
  const void *Value;
  uint64_t v11;
  const __CFData *VolumeInfo;
  const __CFAllocator *v13;
  _OWORD v15[4];

  v9 = _FileCacheGetForURL(a1, cf);
  _FileCacheLock((uint64_t)v9);
  Value = CFDictionaryGetValue((CFDictionaryRef)qword_1ECD2A668, CFSTR("__kCFURLCheapVolumeInformationKey"));
  memset(v15, 0, 60);
  addPropertyAndDependenciesToBitmap((uint64_t)Value, (uint64_t)v15);
  _FileCacheLockTransitionToPreparer((uint64_t)v9);
  v11 = prepareValuesForBitmap((uint64_t)a1, (uint64_t)v9, (uint64_t)v15, (uint64_t)a5);
  _FileCacheLockTransitionFromPreparer((uint64_t)v9);
  if ((_DWORD)v11)
  {
    VolumeInfo = (const __CFData *)_FileCacheGetVolumeInfo((uint64_t)v9);
    if (VolumeInfo)
    {
      *a3 = *((_QWORD *)CFDataGetBytePtr(VolumeInfo) + 4) & a2;
    }
    else if (a5)
    {
      v13 = CFGetAllocator(a1);
      v11 = 0;
      *a5 = _FSURLCreateStandardError(v13, (const __CFString *)*MEMORY[0x1E0C9AFB8], 256, 0, (const __CFString *)a1, 0);
    }
    else
    {
      v11 = 0;
    }
  }
  _FileCacheUnlock((uint64_t)v9);
  if (a5 && !(_DWORD)v11 && !*a5)
  {
    if (os_log_type_enabled((os_log_t)defaultLog, OS_LOG_TYPE_ERROR))
      _FSURLGetVolumePropertyFlags_cold_1();
    *a5 = CFErrorCreate((CFAllocatorRef)*MEMORY[0x1E0C9AE00], (CFErrorDomain)*MEMORY[0x1E0C9AFB8], 256, 0);
  }
  return v11;
}

CFDataRef ___ZL21createFinderInfoValuePK7__CFURLPK15_FileAttributesPv_block_invoke()
{
  CFDataRef result;

  result = CFDataCreateWithBytesNoCopy((CFAllocatorRef)*MEMORY[0x1E0C9AE00], zeroFinderInfoBytes, 32, (CFAllocatorRef)*MEMORY[0x1E0C9AE20]);
  createFinderInfoValue(__CFURL const*,_FileAttributes const*,void *)::zeroFinderInfoData = (uint64_t)result;
  return result;
}

uint64_t Call_CacheDeleteCopyAvailableSpaceForVolume(double a1)
{
  double v1;
  uint64_t v2;

  v1 = gotLoadHelper_x8__CacheDeleteCopyAvailableSpaceForVolume(a1);
  if (*(_QWORD *)(v2 + 2888))
    return CacheDeleteCopyAvailableSpaceForVolume_delayInitStub(v1);
  else
    return 0;
}

uint64_t createFileResourceIdentifierValue(const void *a1, uint64_t a2, CFDataRef *a3)
{
  uint64_t v5;
  const __CFAllocator *v6;
  _QWORD v7[2];

  if ((*(_BYTE *)a2 & 4) == 0)
    return 0;
  if (*(_DWORD *)(a2 + 112))
    v5 = *(unsigned int *)(a2 + 112);
  else
    v5 = *(_QWORD *)(a2 + 104);
  v7[0] = *(_QWORD *)(a2 + 120);
  v7[1] = v5;
  v6 = CFGetAllocator(a1);
  *a3 = CFDataCreate(v6, (const UInt8 *)v7, 16);
  return 1;
}

uint64_t VolumePropertyProviderSetValues(const __CFString *a1, uint64_t a2, CFTypeRef *a3, uint64_t *a4, uint64_t *a5, uint64_t a6, uint64_t a7, CFErrorRef *a8)
{
  uint64_t v8;
  char v12;
  const void *v13;
  uint64_t v14;
  int v15;
  int v16;
  uint64_t v17;
  int v18;
  uint64_t v20;
  __CFData *VolumeInfo;
  const __CFAllocator *v22;
  CFErrorRef v23;
  uint64_t result;

  if (a6 < 1)
    return 1;
  v8 = a6;
  v12 = 0;
  v13 = (const void *)*MEMORY[0x1E0C9B718];
  v14 = *MEMORY[0x1E0C9B0D0];
  v15 = 1;
  v16 = 1;
  do
  {
    v17 = *a4;
    if (*a4)
    {
      v18 = CFEqual(*a3, v13);
      if (v17 != v14 && v18 != 0)
        v12 = 1;
    }
    else
    {
      if (!v16)
        goto LABEL_9;
      v20 = *a5;
      if (CFEqual(*(CFTypeRef *)(*a5 + 8), CFSTR("__kCFURLCheapVolumeInformationKey")))
      {
        _FileCacheSetVolumeInfo(a2, 0);
        v16 = 0;
        goto LABEL_9;
      }
      if (!v15)
        goto LABEL_18;
      if (CFEqual(*(CFTypeRef *)(v20 + 8), CFSTR("__kCFURLExpensiveVolumeInformationKey")))
      {
        VolumeInfo = (__CFData *)_FileCacheGetVolumeInfo(a2);
        if (VolumeInfo)
        {
          v15 = 0;
          *(_QWORD *)CFDataGetMutableBytePtr(VolumeInfo) = -1;
LABEL_18:
          v16 = 1;
          goto LABEL_9;
        }
        v16 = 0;
      }
      else
      {
        v16 = 1;
      }
      v15 = 1;
    }
LABEL_9:
    ++a5;
    ++a4;
    ++a3;
    --v8;
  }
  while (v8);
  if (!v12)
    return 1;
  if (!a8)
    return 0;
  v22 = CFGetAllocator(a1);
  v23 = _FSURLCreateStandardError(v22, (const __CFString *)*MEMORY[0x1E0C9AFD0], 45, 1, a1, 0);
  result = 0;
  *a8 = v23;
  return result;
}

uint64_t createDirectoryEntryCountValue(uint64_t a1, uint64_t a2, CFNumberRef *a3)
{
  uint64_t valuePtr;

  if ((*(_BYTE *)(a2 + 1) & 4) == 0)
    return 0;
  valuePtr = *(unsigned int *)(a2 + 28);
  *a3 = CFNumberCreate((CFAllocatorRef)*MEMORY[0x1E0C9AE00], kCFNumberSInt64Type, &valuePtr);
  return 2;
}

uint64_t createDocumentIdentifierValue(const void *a1, uint64_t a2, CFNumberRef *a3)
{
  const void *v4;
  const __CFAllocator *v5;
  CFNumberRef v6;

  v4 = (const void *)(a2 + 36);
  if (*(_DWORD *)(a2 + 36))
  {
    v5 = CFGetAllocator(a1);
    v6 = CFNumberCreate(v5, kCFNumberSInt32Type, v4);
  }
  else
  {
    v6 = 0;
  }
  *a3 = v6;
  return 1;
}

uint64_t ExternalProviderPrepareValues(const __CFURL *a1, uint64_t a2, const void **a3, uint64_t *a4, uint64_t a5, uint64_t a6, __CFError **a7)
{
  uint64_t v8;
  __CFArray *Mutable;
  const void *v14;
  uint64_t v15;
  double v16;
  uint64_t (*v17)(const __CFURL *, const void *, const void **, __CFError **, double);
  uint64_t v18;
  CFIndex Count;
  CFIndex v20;
  CFIndex i;
  const void *ValueAtIndex;
  const void *Value;
  const __CFAllocator *allocator;
  CFTypeRef v26;
  CFTypeRef cf2;
  CFTypeRef cf;

  if (a5 < 1)
    return 1;
  v8 = a5;
  Mutable = 0;
  cf2 = (CFTypeRef)*MEMORY[0x1E0C9B638];
  allocator = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
  v26 = (CFTypeRef)*MEMORY[0x1E0C9B640];
  while (1)
  {
    cf = 0;
    v14 = *a3;
    v15 = *a4;
    if (!_FileCacheGetPropertyValueForKey(a2, *a3, (void **)&cf))
      break;
LABEL_4:
    ++a4;
    ++a3;
    if (!--v8)
    {
      v18 = 1;
      if (!Mutable)
        return v18;
      goto LABEL_17;
    }
  }
  v17 = *(uint64_t (**)(const __CFURL *, const void *, const void **, __CFError **, double))(v15 + 16);
  if (v17 == CopyFromFileProvider)
  {
    if (CFEqual(v14, cf2) || CFEqual(v14, v26))
    {
      _FileCacheSetPropertyValueForKey(a2, v14, 0);
    }
    else
    {
      if (!Mutable)
        Mutable = CFArrayCreateMutable(allocator, 0, MEMORY[0x1E0C9B378]);
      CFArrayAppendValue(Mutable, v14);
    }
    goto LABEL_4;
  }
  if (((unsigned int (*)(const __CFURL *, const void *, CFTypeRef *, __CFError **))v17)(a1, v14, &cf, a7))
  {
    _FileCacheSetPropertyValueForKey(a2, v14, cf);
    if (cf)
      CFRelease(cf);
    goto LABEL_4;
  }
  v18 = 0;
  if (!Mutable)
    return v18;
LABEL_17:
  cf = 0;
  if (CopyFromFileProvider(a1, Mutable, &cf, a7, v16))
  {
    if (cf)
    {
      Count = CFArrayGetCount(Mutable);
      if (Count >= 1)
      {
        v20 = Count;
        for (i = 0; i != v20; ++i)
        {
          ValueAtIndex = CFArrayGetValueAtIndex(Mutable, i);
          Value = CFDictionaryGetValue((CFDictionaryRef)cf, ValueAtIndex);
          _FileCacheSetPropertyValueForKey(a2, ValueAtIndex, Value);
        }
      }
      CFRelease(cf);
    }
  }
  else
  {
    v18 = 0;
  }
  CFRelease(Mutable);
  return v18;
}

uint64_t createVolumeIsInternalValue(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, _QWORD *a7)
{
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;

  v7 = *(_QWORD *)(a3 + 32) & 0x180;
  if (v7 == 256)
  {
    v8 = (uint64_t *)MEMORY[0x1E0C9AE40];
  }
  else
  {
    if (v7 != 128)
    {
      v9 = 0;
      goto LABEL_7;
    }
    v8 = (uint64_t *)MEMORY[0x1E0C9AE50];
  }
  v9 = *v8;
LABEL_7:
  *a7 = v9;
  return 1;
}

uint64_t createFileSecurityValue(uint64_t a1, uint64_t a2, CFFileSecurityRef *a3)
{
  const __CFAllocator *v6;

  if ((*(_BYTE *)a2 & 0x80) == 0)
    return 0;
  v6 = CFGetAllocator(*(CFTypeRef *)(a2 + 224));
  *a3 = CFFileSecurityCreateCopy(v6, *(CFFileSecurityRef *)(a2 + 224));
  return 1;
}

uint64_t CopyFromFileProvider(const __CFURL *a1, const void *a2, const void **a3, __CFError **a4, double a5)
{
  double Helper_x8__FPCFCopyAttributeValuesForItem;
  uint64_t v6;

  Helper_x8__FPCFCopyAttributeValuesForItem = gotLoadHelper_x8__FPCFCopyAttributeValuesForItem(a5);
  if (*(_QWORD *)(v6 + 1728))
    *a3 = (const void *)FPCFCopyAttributeValuesForItem_delayInitStub(Helper_x8__FPCFCopyAttributeValuesForItem);
  else
    *a3 = 0;
  return 1;
}

uint64_t currentBookmarkVersion(void)
{
  return 268697600;
}

BOOL bookmarkVersionOK(int a1)
{
  return (a1 - 1) < 0x1FFFFFFF;
}

CFArrayRef createURLParentageArray(const __CFAllocator *a1, const __CFURL *a2)
{
  const __CFAllocator *v2;
  const __CFURL *v3;
  int v4;
  const __CFAllocator *v5;
  int v6;
  CFURLRef v7;
  uint64_t v8;
  const __CFString *v9;
  unint64_t v10;
  int v11;
  const __CFString *v12;
  const __CFString *v13;
  CFArrayRef v14;
  uint64_t v15;
  const void *v17;
  CFURLRef PathComponent;
  void *values[513];

  v2 = (const __CFAllocator *)MEMORY[0x1E0C80A78](a1);
  v5 = v2;
  values[512] = *(void **)MEMORY[0x1E0C80C00];
  if (!v3)
    return CFArrayCreate(v2, 0, 0, MEMORY[0x1E0C9B378]);
  v6 = v4;
  v7 = v3;
  bzero(values, 0xFF8uLL);
  v8 = 0;
  values[511] = v7;
  v9 = (const __CFString *)*MEMORY[0x1E0C9B5A8];
  v10 = -4088;
  while (1)
  {
    PathComponent = 0;
    v11 = CFURLCopyResourcePropertyForKey(v7, v9, &PathComponent, 0);
    if ((v6 & 0x10000000) != 0 && !v11)
    {
      v12 = CFURLCopyPath(v7);
      if (v12)
      {
        v13 = v12;
        if (CFStringGetLength(v12) >= 1)
          PathComponent = CFURLCreateCopyDeletingLastPathComponent(v5, v7);
        CFRelease(v13);
      }
    }
    v7 = PathComponent;
    values[v8 + 510] = PathComponent;
    if (!v7)
      break;
    --v8;
    v10 += 8;
    if (v8 == -511)
    {
      v14 = CFArrayCreate(v5, (const void **)values, 512, MEMORY[0x1E0C9B378]);
      v15 = 0;
      goto LABEL_15;
    }
  }
  v14 = CFArrayCreate(v5, (const void **)&values[v10 / 0xFFFFFFFFFFFFFFF8], 1 - v8, MEMORY[0x1E0C9B378]);
  if ((1 - v8) < 2)
    return v14;
  v15 = v8 + 511;
  do
  {
LABEL_15:
    v17 = values[v15];
    if (v17)
    {
      CFRelease(v17);
      values[v15] = 0;
    }
    ++v15;
  }
  while ((_DWORD)v15 != 511);
  return v14;
}

CFArrayRef copyOfArray(const __CFAllocator *a1, CFArrayRef theArray, CFRange a3)
{
  CFIndex length;
  CFIndex location;
  CFArrayRef Copy;
  __CFArray *Mutable;
  _OWORD v10[50];
  uint64_t v11;
  CFRange v12;
  CFRange v13;

  v11 = *MEMORY[0x1E0C80C00];
  if (!theArray)
    return 0;
  length = a3.length;
  location = a3.location;
  if (CFArrayGetCount(theArray) >= a3.length)
  {
    Mutable = CFArrayCreateMutable(a1, 0, MEMORY[0x1E0C9B378]);
    v13.location = location;
    v13.length = length;
    CFArrayAppendArray(Mutable, theArray, v13);
    Copy = CFArrayCreateCopy(a1, Mutable);
    if (Mutable)
      CFRelease(Mutable);
  }
  else
  {
    memset(v10, 0, 512);
    v12.location = location;
    v12.length = length;
    CFArrayGetValues(theArray, v12, (const void **)v10);
    return CFArrayCreate(a1, (const void **)v10 + location, length, MEMORY[0x1E0C9B378]);
  }
  return Copy;
}

const __CFArray *createArrayOfPathComponentsFromString(const __CFAllocator *a1, const __CFString *a2, int a3)
{
  CFIndex v3;
  const __CFArray *ArrayBySeparatingStrings;
  const __CFArray *v6;
  const __CFString *ValueAtIndex;
  CFArrayRef v8;
  CFArrayRef v9;
  CFRange v11;

  if (!a2)
    return 0;
  LODWORD(v3) = a3;
  ArrayBySeparatingStrings = CFStringCreateArrayBySeparatingStrings(a1, a2, CFSTR("/"));
  v6 = ArrayBySeparatingStrings;
  if (ArrayBySeparatingStrings && CFArrayGetCount(ArrayBySeparatingStrings) >= 1)
  {
    ValueAtIndex = (const __CFString *)CFArrayGetValueAtIndex(v6, 0);
    if (CFStringGetLength(ValueAtIndex))
      v3 = v3;
    else
      v3 = (v3 + 1);
    if ((_DWORD)v3)
    {
      v11.length = CFArrayGetCount(v6) - v3;
      v11.location = v3;
      v8 = copyOfArray(a1, v6, v11);
      if (v6 != v8)
      {
        v9 = v8;
        CFRelease(v6);
        return v9;
      }
    }
  }
  return v6;
}

uint64_t sameFileURL(CFTypeRef cf1, CFTypeRef cf2)
{
  uint64_t result;
  CFTypeID v5;
  CFTypeID v6;

  result = cf1 == cf2;
  if (cf2)
  {
    if (cf1)
    {
      if (cf1 != cf2)
      {
        result = CFEqual(cf1, cf2);
        if (!(_DWORD)result)
        {
          v5 = CFGetTypeID(cf1);
          if (v5 == CFURLGetTypeID() && (v6 = CFGetTypeID(cf2), v6 == CFURLGetTypeID()))
          {
            _CFURLCopyResourcePropertyValuesAndFlags();
            return 0;
          }
          else
          {
            return 0;
          }
        }
      }
    }
  }
  return result;
}

CFDictionaryRef CFDictionaryCreateWithItems(const __CFAllocator *a1, void *a2, void *a3, void *a4, void *a5)
{
  CFIndex v5;
  uint64_t v6;
  void *values[2];
  void *keys[3];

  keys[2] = *(void **)MEMORY[0x1E0C80C00];
  keys[0] = 0;
  keys[1] = 0;
  values[0] = 0;
  values[1] = 0;
  if (a2 && a3)
  {
    keys[0] = a2;
    values[0] = a3;
    v5 = 1;
    if (!a4 || !a5)
      return CFDictionaryCreate(a1, (const void **)keys, (const void **)values, v5, MEMORY[0x1E0C9B390], MEMORY[0x1E0C9B3A0]);
    goto LABEL_8;
  }
  if (!a4)
    return 0;
  v5 = 0;
  v6 = 0;
  if (a5)
  {
LABEL_8:
    keys[v5] = a4;
    values[v5++] = a5;
    return CFDictionaryCreate(a1, (const void **)keys, (const void **)values, v5, MEMORY[0x1E0C9B390], MEMORY[0x1E0C9B3A0]);
  }
  return (CFDictionaryRef)v6;
}

uint64_t asString(const void *const *a1)
{
  CFTypeRef *v1;
  uint64_t v2;
  uint64_t v3;
  CFTypeID v4;
  const char *CStringPtr;
  _QWORD *v6;
  size_t v7;
  _QWORD *v8;
  const char *v9;
  uint64_t v10;
  CFIndex v11;
  char *v12;
  void **v13;
  uint64_t v14;
  _QWORD *v15;
  __CFString **v16;
  uint64_t v17;
  CFTypeID TypeID;
  const __CFDictionary *v20;
  int64_t Count;
  unint64_t v22;
  const void **v23;
  size_t v24;
  uint64_t v25;
  char *v26;
  void **v27;
  uint64_t v28;
  _QWORD *v29;
  __CFString **v30;
  uint64_t v31;
  _QWORD *v32;
  _QWORD *v33;
  const void **v34;
  uint64_t v35;
  _QWORD *v36;
  _QWORD *v37;
  const __CFString *v38;
  _QWORD *v39;
  size_t v40;
  CFAbsoluteTime v41;
  _QWORD *v42;
  _QWORD *v43;
  _QWORD *v44;
  _QWORD *v45;
  _QWORD *v46;
  _QWORD *v47;
  _QWORD *v48;
  _QWORD *v49;
  _QWORD *v50;
  _QWORD *v51;
  CFTypeID v52;
  CFTypeRef v53;
  CFURLRef v54;
  const __CFURL *v55;
  __CFString *v56;
  void **v57;
  uint64_t v58;
  _QWORD *v59;
  const char *v60;
  uint64_t v61;
  _QWORD *v62;
  _QWORD *v63;
  void **v64;
  uint64_t v65;
  _QWORD v66[3];
  char v67;
  char v68;
  const void *Value;
  const void *v70[2];
  unsigned __int8 v71;
  __CFString *v72;
  uint64_t v73;
  unsigned __int8 v74;
  _QWORD v75[11];
  char v76;
  uint64_t v77;
  void **v78;
  uint64_t v79;
  unsigned __int8 v80;
  uint64_t v81;
  CFRange v82;

  v1 = (CFTypeRef *)MEMORY[0x1E0C80A78](a1);
  v3 = v2;
  v81 = *MEMORY[0x1E0C80C00];
  std::ostringstream::basic_ostringstream[abi:nn180100]((uint64_t)v75);
  if (!*v1)
  {
    v9 = "<NULL>";
LABEL_9:
    v8 = v75;
    v10 = 6;
    goto LABEL_34;
  }
  v4 = CFGetTypeID(*v1);
  if (v4 == CFStringGetTypeID())
  {
    CStringPtr = CFStringGetCStringPtr((CFStringRef)*v1, 0x8000100u);
    if (CStringPtr
      || (CStringPtr = CFStringGetCStringPtr((CFStringRef)*v1, 0x600u)) != 0
      || (CStringPtr = CFStringGetCStringPtr((CFStringRef)*v1, 0)) != 0)
    {
      LOBYTE(v78) = 34;
      v6 = std::__put_character_sequence[abi:nn180100]<char,std::char_traits<char>>(v75, (uint64_t)&v78, 1);
      v7 = strlen(CStringPtr);
      v8 = std::__put_character_sequence[abi:nn180100]<char,std::char_traits<char>>(v6, (uint64_t)CStringPtr, v7);
      LOBYTE(v78) = 34;
      v9 = (const char *)&v78;
    }
    else
    {
      v72 = 0;
      v38 = (const __CFString *)*v1;
      v82.length = CFStringGetLength(v38);
      v82.location = 0;
      if (!CFStringGetBytes(v38, v82, 0x8000100u, 0, 0, (UInt8 *)&v78, 0xFFFFLL, (CFIndex *)&v72))
      {
        v9 = "< unrepresentable string>";
        v8 = v75;
        v10 = 25;
        goto LABEL_34;
      }
      *((_BYTE *)&v78 + (_QWORD)v72) = 0;
      LOBYTE(v70[0]) = 34;
      v39 = std::__put_character_sequence[abi:nn180100]<char,std::char_traits<char>>(v75, (uint64_t)v70, 1);
      v40 = strlen((const char *)&v78);
      v8 = std::__put_character_sequence[abi:nn180100]<char,std::char_traits<char>>(v39, (uint64_t)&v78, v40);
      LOBYTE(v70[0]) = 34;
      v9 = (const char *)v70;
    }
    goto LABEL_7;
  }
  if (v4 == CFArrayGetTypeID())
  {
    std::__put_character_sequence[abi:nn180100]<char,std::char_traits<char>>(v75, (uint64_t)"[", 1);
    if (CFArrayGetCount((CFArrayRef)*v1) >= 1)
    {
      v11 = 0;
      do
      {
        v70[0] = CFArrayGetValueAtIndex((CFArrayRef)*v1, v11);
        if (v11)
          v12 = ", ";
        else
          v12 = "";
        std::string::basic_string[abi:nn180100]<0>(&v78, v12);
        if ((v80 & 0x80u) == 0)
          v13 = (void **)&v78;
        else
          v13 = v78;
        if ((v80 & 0x80u) == 0)
          v14 = v80;
        else
          v14 = v79;
        v15 = std::__put_character_sequence[abi:nn180100]<char,std::char_traits<char>>(v75, (uint64_t)v13, v14);
        asString((uint64_t *)&v72, v70);
        if ((v74 & 0x80u) == 0)
          v16 = &v72;
        else
          v16 = (__CFString **)v72;
        if ((v74 & 0x80u) == 0)
          v17 = v74;
        else
          v17 = v73;
        std::__put_character_sequence[abi:nn180100]<char,std::char_traits<char>>(v15, (uint64_t)v16, v17);
        if ((char)v74 < 0)
          operator delete(v72);
        if ((char)v80 < 0)
          operator delete(v78);
        ++v11;
      }
      while (v11 < CFArrayGetCount((CFArrayRef)*v1));
    }
    v9 = "] ";
    v8 = v75;
    v10 = 2;
    goto LABEL_34;
  }
  TypeID = CFDictionaryGetTypeID();
  v20 = (const __CFDictionary *)*v1;
  if (v4 == TypeID)
  {
    v66[2] = v3;
    Count = CFDictionaryGetCount(v20);
    v66[1] = v66;
    MEMORY[0x1E0C80A78](Count);
    v23 = (const void **)((char *)v66 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0));
    if (v22 >= 0x200)
      v24 = 512;
    else
      v24 = v22;
    bzero((char *)v66 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0), v24);
    CFDictionaryGetKeysAndValues(v20, v23, 0);
    qsort_b(v23, Count, 8uLL, &__block_literal_global);
    std::__put_character_sequence[abi:nn180100]<char,std::char_traits<char>>(v75, (uint64_t)"{", 1);
    if (Count >= 1)
    {
      v25 = 0;
      do
      {
        if (v25)
          v26 = ", ";
        else
          v26 = "";
        std::string::basic_string[abi:nn180100]<0>(&v78, v26);
        if ((v80 & 0x80u) == 0)
          v27 = (void **)&v78;
        else
          v27 = v78;
        if ((v80 & 0x80u) == 0)
          v28 = v80;
        else
          v28 = v79;
        v29 = std::__put_character_sequence[abi:nn180100]<char,std::char_traits<char>>(v75, (uint64_t)v27, v28);
        asString((uint64_t *)&v72, v23);
        if ((v74 & 0x80u) == 0)
          v30 = &v72;
        else
          v30 = (__CFString **)v72;
        if ((v74 & 0x80u) == 0)
          v31 = v74;
        else
          v31 = v73;
        v32 = std::__put_character_sequence[abi:nn180100]<char,std::char_traits<char>>(v29, (uint64_t)v30, v31);
        v33 = std::__put_character_sequence[abi:nn180100]<char,std::char_traits<char>>(v32, (uint64_t)"=", 1);
        Value = CFDictionaryGetValue(v20, *v23);
        asString((uint64_t *)v70, &Value);
        if ((v71 & 0x80u) == 0)
          v34 = v70;
        else
          v34 = (const void **)v70[0];
        if ((v71 & 0x80u) == 0)
          v35 = v71;
        else
          v35 = (uint64_t)v70[1];
        std::__put_character_sequence[abi:nn180100]<char,std::char_traits<char>>(v33, (uint64_t)v34, v35);
        if ((char)v71 < 0)
          operator delete((void *)v70[0]);
        if ((char)v74 < 0)
          operator delete(v72);
        if ((char)v80 < 0)
          operator delete(v78);
        --v25;
        ++v23;
      }
      while (-Count != v25);
    }
    std::__put_character_sequence[abi:nn180100]<char,std::char_traits<char>>(v75, (uint64_t)"} ", 2);
    goto LABEL_35;
  }
  if (v20 == (const __CFDictionary *)*MEMORY[0x1E0C9AE50])
  {
    v9 = "TRUE ";
    v8 = v75;
    v10 = 5;
    goto LABEL_34;
  }
  if (v20 == (const __CFDictionary *)*MEMORY[0x1E0C9AE40])
  {
    v9 = "FALSE ";
    goto LABEL_9;
  }
  if (v4 == CFNumberGetTypeID())
  {
    LODWORD(v72) = 0;
    v78 = 0;
    if (CFNumberGetValue((CFNumberRef)*v1, kCFNumberSInt32Type, &v72))
    {
      std::__put_character_sequence[abi:nn180100]<char,std::char_traits<char>>(v75, (uint64_t)"#", 1);
      v36 = (_QWORD *)std::ostream::operator<<();
      v37 = std::__put_character_sequence[abi:nn180100]<char,std::char_traits<char>>(v36, (uint64_t)"/0x", 3);
      *(_DWORD *)((char *)v37 + *(_QWORD *)(*v37 - 24) + 8) = *(_DWORD *)((_BYTE *)v37 + *(_QWORD *)(*v37 - 24) + 8) & 0xFFFFFFB5 | 8;
      v8 = (_QWORD *)std::ostream::operator<<();
    }
    else
    {
      if (!CFNumberGetValue((CFNumberRef)*v1, kCFNumberSInt64Type, &v78))
      {
        v9 = "[CFNumber?] ";
        v8 = v75;
        v10 = 12;
        goto LABEL_34;
      }
      std::__put_character_sequence[abi:nn180100]<char,std::char_traits<char>>(v75, (uint64_t)"#", 1);
      v62 = (_QWORD *)std::ostream::operator<<();
      v63 = std::__put_character_sequence[abi:nn180100]<char,std::char_traits<char>>(v62, (uint64_t)"/0x", 3);
      *(_DWORD *)((char *)v63 + *(_QWORD *)(*v63 - 24) + 8) = *(_DWORD *)((_BYTE *)v63 + *(_QWORD *)(*v63 - 24) + 8) & 0xFFFFFFB5 | 8;
      v8 = (_QWORD *)std::ostream::operator<<();
    }
    *(_DWORD *)((char *)v8 + *(_QWORD *)(*v8 - 24) + 8) = *(_DWORD *)((_BYTE *)v8 + *(_QWORD *)(*v8 - 24) + 8) & 0xFFFFFFB5 | 2;
    v9 = " ";
LABEL_7:
    v10 = 1;
LABEL_34:
    std::__put_character_sequence[abi:nn180100]<char,std::char_traits<char>>(v8, (uint64_t)v9, v10);
    goto LABEL_35;
  }
  if (v4 == CFDateGetTypeID())
  {
    v41 = MEMORY[0x186DA2DD8](*v1);
    CFAbsoluteTimeGetGregorianDate(v41, 0);
    *(_QWORD *)((char *)&v75[3] + *(_QWORD *)(v75[0] - 24)) = 4;
    LOBYTE(v78) = 48;
    std::operator<<[abi:nn180100]<std::char_traits<char>>(v75, (char *)&v78);
    v42 = (_QWORD *)std::ostream::operator<<();
    v43 = std::__put_character_sequence[abi:nn180100]<char,std::char_traits<char>>(v42, (uint64_t)"/", 1);
    *(_QWORD *)((char *)v43 + *(_QWORD *)(*v43 - 24) + 24) = 2;
    LOBYTE(v72) = 48;
    std::operator<<[abi:nn180100]<std::char_traits<char>>(v43, (char *)&v72);
    v44 = (_QWORD *)std::ostream::operator<<();
    v45 = std::__put_character_sequence[abi:nn180100]<char,std::char_traits<char>>(v44, (uint64_t)"/", 1);
    *(_QWORD *)((char *)v45 + *(_QWORD *)(*v45 - 24) + 24) = 2;
    LOBYTE(v70[0]) = 48;
    std::operator<<[abi:nn180100]<std::char_traits<char>>(v45, (char *)v70);
    v46 = (_QWORD *)std::ostream::operator<<();
    v47 = std::__put_character_sequence[abi:nn180100]<char,std::char_traits<char>>(v46, (uint64_t)" ", 1);
    *(_QWORD *)((char *)v47 + *(_QWORD *)(*v47 - 24) + 24) = 2;
    LOBYTE(Value) = 48;
    std::operator<<[abi:nn180100]<std::char_traits<char>>(v47, (char *)&Value);
    v48 = (_QWORD *)std::ostream::operator<<();
    v49 = std::__put_character_sequence[abi:nn180100]<char,std::char_traits<char>>(v48, (uint64_t)":", 1);
    *(_QWORD *)((char *)v49 + *(_QWORD *)(*v49 - 24) + 24) = 2;
    v68 = 48;
    std::operator<<[abi:nn180100]<std::char_traits<char>>(v49, &v68);
    v50 = (_QWORD *)std::ostream::operator<<();
    v51 = std::__put_character_sequence[abi:nn180100]<char,std::char_traits<char>>(v50, (uint64_t)":", 1);
    *(_QWORD *)((char *)v51 + *(_QWORD *)(*v51 - 24) + 24) = 2;
    v67 = 48;
    std::operator<<[abi:nn180100]<std::char_traits<char>>(v51, &v67);
    std::ostream::operator<<();
    goto LABEL_35;
  }
  v52 = CFURLGetTypeID();
  v53 = *v1;
  if (v4 != v52)
  {
    v56 = (__CFString *)CFCopyDescription(v53);
    v72 = v56;
    asString((uint64_t *)&v78, (const void *const *)&v72);
    if ((v80 & 0x80u) == 0)
      v60 = (const char *)&v78;
    else
      v60 = (const char *)v78;
    if ((v80 & 0x80u) == 0)
      v61 = v80;
    else
      v61 = v79;
    v59 = v75;
    goto LABEL_104;
  }
  v54 = CFURLGetBaseURL((CFURLRef)v53);
  v55 = (const __CFURL *)*v1;
  if (v54)
  {
    v56 = (__CFString *)CFURLCopyAbsoluteURL(v55);
    v72 = (__CFString *)CFURLGetString((CFURLRef)v56);
    asString((uint64_t *)&v78, (const void *const *)&v72);
    if ((v80 & 0x80u) == 0)
      v57 = (void **)&v78;
    else
      v57 = v78;
    if ((v80 & 0x80u) == 0)
      v58 = v80;
    else
      v58 = v79;
    v59 = std::__put_character_sequence[abi:nn180100]<char,std::char_traits<char>>(v75, (uint64_t)v57, v58);
    v60 = "(*)";
    v61 = 3;
LABEL_104:
    std::__put_character_sequence[abi:nn180100]<char,std::char_traits<char>>(v59, (uint64_t)v60, v61);
    if ((char)v80 < 0)
      operator delete(v78);
    if (v56)
      CFRelease(v56);
    goto LABEL_35;
  }
  v72 = (__CFString *)CFURLGetString(v55);
  asString((uint64_t *)&v78, (const void *const *)&v72);
  if ((v80 & 0x80u) == 0)
    v64 = (void **)&v78;
  else
    v64 = v78;
  if ((v80 & 0x80u) == 0)
    v65 = v80;
  else
    v65 = v79;
  std::__put_character_sequence[abi:nn180100]<char,std::char_traits<char>>(v75, (uint64_t)v64, v65);
  if ((char)v80 < 0)
    operator delete(v78);
LABEL_35:
  std::stringbuf::str();
  v75[0] = *MEMORY[0x1E0DE4F60];
  *(_QWORD *)((char *)v75 + *(_QWORD *)(v75[0] - 24)) = *(_QWORD *)(MEMORY[0x1E0DE4F60] + 24);
  v75[1] = MEMORY[0x1E0DE4FB8] + 16;
  if (v76 < 0)
    operator delete((void *)v75[9]);
  std::streambuf::~streambuf();
  std::ostream::~ostream();
  return MEMORY[0x186DA3510](&v77);
}

uint64_t std::ostringstream::basic_ostringstream[abi:nn180100](uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  std::ios_base *v6;

  v2 = MEMORY[0x1E0DE4FE0];
  v3 = MEMORY[0x1E0DE4FE0] + 64;
  *(_QWORD *)(a1 + 112) = MEMORY[0x1E0DE4FE0] + 64;
  v5 = *(_QWORD *)(MEMORY[0x1E0DE4F60] + 8);
  v4 = *(_QWORD *)(MEMORY[0x1E0DE4F60] + 16);
  *(_QWORD *)a1 = v5;
  *(_QWORD *)(a1 + *(_QWORD *)(v5 - 24)) = v4;
  v6 = (std::ios_base *)(a1 + *(_QWORD *)(*(_QWORD *)a1 - 24));
  std::ios_base::init(v6, (void *)(a1 + 8));
  v6[1].__vftable = 0;
  v6[1].__fmtflags_ = -1;
  *(_QWORD *)a1 = v2 + 24;
  *(_QWORD *)(a1 + 112) = v3;
  std::streambuf::basic_streambuf();
  *(_QWORD *)(a1 + 8) = MEMORY[0x1E0DE4FB8] + 16;
  *(_OWORD *)(a1 + 72) = 0u;
  *(_OWORD *)(a1 + 88) = 0u;
  *(_DWORD *)(a1 + 104) = 16;
  return a1;
}

CFComparisonResult ___Z8asStringRKPKv_block_invoke(uint64_t a1, CFStringRef *a2, CFStringRef *a3)
{
  return CFStringCompare(*a2, *a3, 0);
}

_QWORD *std::operator<<[abi:nn180100]<std::char_traits<char>>(_QWORD *a1, char *a2)
{
  char *v3;
  int v4;
  const std::locale::facet *v5;
  std::locale v7;

  v3 = (char *)a1 + *(_QWORD *)(*a1 - 24);
  v4 = *a2;
  if (*((_DWORD *)v3 + 36) == -1)
  {
    std::ios_base::getloc((const std::ios_base *)((char *)a1 + *(_QWORD *)(*a1 - 24)));
    v5 = std::locale::use_facet(&v7, MEMORY[0x1E0DE4A90]);
    ((void (*)(const std::locale::facet *, uint64_t))v5->__vftable[2].~facet_0)(v5, 32);
    std::locale::~locale(&v7);
  }
  *((_DWORD *)v3 + 36) = v4;
  return a1;
}

_QWORD *std::__put_character_sequence[abi:nn180100]<char,std::char_traits<char>>(_QWORD *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  int v10;
  const std::locale::facet *v11;
  _BYTE v13[16];
  std::locale v14;

  MEMORY[0x186DA3498](v13, a1);
  if (v13[0])
  {
    v6 = (uint64_t)a1 + *(_QWORD *)(*a1 - 24);
    v7 = *(_QWORD *)(v6 + 40);
    v8 = a2 + a3;
    if ((*(_DWORD *)(v6 + 8) & 0xB0) == 0x20)
      v9 = v8;
    else
      v9 = a2;
    v10 = *(_DWORD *)(v6 + 144);
    if (v10 == -1)
    {
      std::ios_base::getloc((const std::ios_base *)((char *)a1 + *(_QWORD *)(*a1 - 24)));
      v11 = std::locale::use_facet(&v14, MEMORY[0x1E0DE4A90]);
      v10 = ((uint64_t (*)(const std::locale::facet *, uint64_t))v11->__vftable[2].~facet_0)(v11, 32);
      std::locale::~locale(&v14);
      *(_DWORD *)(v6 + 144) = v10;
    }
    if (!std::__pad_and_output[abi:nn180100]<char,std::char_traits<char>>(v7, a2, v9, v8, v6, (char)v10))
      std::ios_base::clear((std::ios_base *)((char *)a1 + *(_QWORD *)(*a1 - 24)), *(_DWORD *)((char *)a1 + *(_QWORD *)(*a1 - 24) + 32) | 5);
  }
  MEMORY[0x186DA34A4](v13);
  return a1;
}

uint64_t std::__pad_and_output[abi:nn180100]<char,std::char_traits<char>>(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, int __c)
{
  uint64_t v6;
  uint64_t v11;
  int64_t v12;
  void **v13;
  uint64_t v14;
  uint64_t v15;
  void *__p[2];
  char v18;

  v6 = a1;
  if (a1)
  {
    v11 = *(_QWORD *)(a5 + 24);
    if (v11 <= a4 - a2)
      v12 = 0;
    else
      v12 = v11 - (a4 - a2);
    if (a3 - a2 >= 1 && (*(uint64_t (**)(uint64_t))(*(_QWORD *)a1 + 96))(a1) != a3 - a2)
      return 0;
    if (v12 >= 1)
    {
      std::string::basic_string[abi:nn180100](__p, v12, __c);
      v13 = v18 >= 0 ? __p : (void **)__p[0];
      v14 = (*(uint64_t (**)(uint64_t, void **, int64_t))(*(_QWORD *)v6 + 96))(v6, v13, v12);
      if (v18 < 0)
        operator delete(__p[0]);
      if (v14 != v12)
        return 0;
    }
    v15 = a4 - a3;
    if (v15 < 1 || (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)v6 + 96))(v6, a3, v15) == v15)
      *(_QWORD *)(a5 + 24) = 0;
    else
      return 0;
  }
  return v6;
}

_QWORD *std::string::basic_string[abi:nn180100](_QWORD *__b, size_t __len, int __c)
{
  void *v6;
  size_t v7;
  size_t v8;

  if (__len >= 0x7FFFFFFFFFFFFFF8)
    abort();
  if (__len >= 0x17)
  {
    v7 = (__len & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((__len | 7) != 0x17)
      v7 = __len | 7;
    v8 = v7 + 1;
    v6 = operator new(v7 + 1);
    __b[1] = __len;
    __b[2] = v8 | 0x8000000000000000;
    *__b = v6;
  }
  else
  {
    *((_BYTE *)__b + 23) = __len;
    v6 = __b;
    if (!__len)
      goto LABEL_9;
  }
  memset(v6, __c, __len);
LABEL_9:
  *((_BYTE *)v6 + __len) = 0;
  return __b;
}

_QWORD *std::string::basic_string[abi:nn180100]<0>(_QWORD *a1, char *__s)
{
  size_t v4;
  size_t v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;

  v4 = strlen(__s);
  if (v4 >= 0x7FFFFFFFFFFFFFF8)
    abort();
  v5 = v4;
  if (v4 >= 0x17)
  {
    v7 = (v4 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((v4 | 7) != 0x17)
      v7 = v4 | 7;
    v8 = v7 + 1;
    v6 = operator new(v7 + 1);
    a1[1] = v5;
    a1[2] = v8 | 0x8000000000000000;
    *a1 = v6;
  }
  else
  {
    *((_BYTE *)a1 + 23) = v4;
    v6 = a1;
    if (!v4)
      goto LABEL_9;
  }
  memmove(v6, __s, v5);
LABEL_9:
  *((_BYTE *)v6 + v5) = 0;
  return a1;
}

BOOL CFBookmarkHeader::validate(CFBookmarkHeader *this)
{
  BOOL v1;

  v1 = *(_DWORD *)this == 1936288865 || *(_DWORD *)this == 1802465122;
  return v1 && *((_DWORD *)this + 3) >= 0x10u && bookmarkVersionOK(*((_DWORD *)this + 2));
}

void BookmarkData::BookmarkData(BookmarkData *this, const __CFAllocator *a2, CFTypeRef cf)
{
  char *v4;
  CFBookmarkHeader **v6;
  CFBookmarkHeader **v7;
  const __CFData *v8;
  const char *v9;
  CFBookmarkHeader *v10;
  unsigned int v11;
  uint64_t v12;
  BOOL v13;
  unsigned int v14;
  unsigned int v15;
  NSObject *v16;
  uint64_t TOCAtOffset;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  unsigned int *v21;
  unsigned int v22;
  uint64_t v23;

  *(_QWORD *)this = a2;
  v4 = (char *)this + 8;
  if (cf)
  {
    CFRetain(cf);
    *((_QWORD *)this + 1) = cf;
    *((_QWORD *)this + 2) = 0;
    v6 = (CFBookmarkHeader **)((char *)this + 16);
    *((_QWORD *)this + 3) = CFDataGetBytePtr((CFDataRef)cf);
    v7 = (CFBookmarkHeader **)((char *)this + 24);
    v8 = (const __CFData *)*((_QWORD *)this + 1);
    if (v8)
    {
      if (CFDataGetLength(v8) < 1 || (unint64_t)CFDataGetLength(*(CFDataRef *)v4) > 0xFFFFFFFE)
        LODWORD(v8) = 0;
      else
        LODWORD(v8) = CFDataGetLength(*(CFDataRef *)v4);
    }
  }
  else
  {
    LODWORD(v8) = 0;
    v6 = (CFBookmarkHeader **)((char *)this + 16);
    v7 = (CFBookmarkHeader **)((char *)this + 24);
    *(_QWORD *)v4 = 0;
    *((_QWORD *)v4 + 1) = 0;
    *((_QWORD *)v4 + 2) = 0;
  }
  *((_QWORD *)this + 7) = 0;
  *(_QWORD *)((char *)this + 36) = 0;
  *((_DWORD *)this + 8) = (_DWORD)v8;
  *((_QWORD *)this + 8) = 0;
  *((_QWORD *)this + 6) = (char *)this + 56;
  v9 = "invalid bookmark length";
  if (v8 >= 0x10)
  {
    v10 = *v7;
    if (CFBookmarkHeader::validate(*v7) && (v11 = *((_DWORD *)this + 8), *((_DWORD *)v10 + 1) <= v11))
    {
      *v6 = v10;
      v12 = *((unsigned int *)v10 + 3);
      if (v12 >= 0x10
        && ((v12 & 3) == 0 ? (v13 = v11 > v12) : (v13 = 0),
            v13 && (v14 = v11 - v12, *((_DWORD *)this + 9) = v12, *((_DWORD *)this + 10) = v14, v14 >= 4)))
      {
        if (*v7)
          v15 = *(_DWORD *)((char *)*v7 + v12);
        else
          v15 = 0;
        TOCAtOffset = BookmarkData::getTOCAtOffset(this, v15);
        if (!TOCAtOffset)
          return;
        v18 = TOCAtOffset;
        v19 = BookmarkData::getTOCAtOffset(this, *(_DWORD *)(TOCAtOffset + 12));
        v9 = "invalid TOC: cycle";
        while (!v19 || v18 != v19)
        {
          v20 = *(unsigned int *)(v18 + 16);
          if ((_DWORD)v20)
          {
            v21 = (unsigned int *)(v18 + 24);
            while (1)
            {
              v22 = *v21;
              v21 += 3;
              if (!BookmarkData::getDataItemAtOffset(this, v22))
                break;
              if (!--v20)
                goto LABEL_38;
            }
            v9 = "invalid data item pointer";
            break;
          }
LABEL_38:
          v18 = BookmarkData::getTOCAtOffset(this, *(_DWORD *)(v18 + 12));
          if (v19)
          {
            v23 = BookmarkData::getTOCAtOffset(this, *(_DWORD *)(v19 + 12));
            if (v23)
              v19 = BookmarkData::getTOCAtOffset(this, *(_DWORD *)(v23 + 12));
            else
              v19 = 0;
          }
          if (!v18)
            return;
        }
      }
      else
      {
        v9 = "invalid data section length";
      }
    }
    else if (!CFBookmarkHeader::validate(v10))
    {
      v9 = "invalid header";
    }
  }
  if (*(_QWORD *)v4)
  {
    CFRelease(*(CFTypeRef *)v4);
    *(_QWORD *)v4 = 0;
  }
  *((_QWORD *)this + 2) = 0;
  *((_QWORD *)this + 3) = 0;
  *((_DWORD *)this + 10) = 0;
  *((_QWORD *)this + 4) = 0;
  v16 = bmarkLog;
  if (os_log_type_enabled((os_log_t)bmarkLog, OS_LOG_TYPE_ERROR))
    BookmarkData::BookmarkData((uint64_t)v9, v16);
}

uint64_t BookmarkData::getTOCAtOffset(BookmarkData *this, unsigned int a2)
{
  unint64_t v2;
  unint64_t v3;
  BOOL v4;
  BOOL v5;
  uint64_t v6;
  uint64_t v7;
  unsigned int v8;

  if (!a2)
    return 0;
  v2 = *((unsigned int *)this + 10);
  v3 = a2 + 20;
  if (v2 >= a2)
  {
    v4 = v3 >= v2;
    v5 = v3 == v2;
  }
  else
  {
    v4 = 1;
    v5 = 0;
  }
  if (!v5 && v4)
    return 0;
  v6 = *((unsigned int *)this + 9);
  if ((((_BYTE)v6 + (_BYTE)a2) & 3) != 0)
    return 0;
  v7 = *((_QWORD *)this + 3) + v6 + a2;
  if (*(_DWORD *)(v7 + 4) != -2)
    return 0;
  v8 = *(_DWORD *)(v7 + 16);
  if (v8 > 0x15555552)
    return 0;
  if (a2 + 12 * (unint64_t)v8 + 20 <= v2)
    return v7;
  return 0;
}

unsigned int *BookmarkData::getDataItemAtOffset(BookmarkData *this, unsigned int a2)
{
  unint64_t v2;
  uint64_t v4;
  uint64_t v6;
  unsigned int *v7;
  uint64_t v8;

  v2 = *((unsigned int *)this + 10);
  if (v2 < a2 || (unint64_t)a2 + 8 > v2)
    return 0;
  v4 = *((unsigned int *)this + 9);
  if ((((_BYTE)v4 + (_BYTE)a2) & 3) != 0)
    return 0;
  v6 = *((_QWORD *)this + 3);
  if (!v6)
    return 0;
  v7 = (unsigned int *)(v6 + v4 + a2);
  v8 = *v7;
  if (v8 > 0xFFFFFFF6)
    return 0;
  if (v8 + (unint64_t)a2 + 8 <= v2)
    return v7;
  return 0;
}

void BookmarkData::~BookmarkData(BookmarkData *this)
{
  char *v2;
  char *v3;
  char *v4;
  const void *v5;
  char *v6;
  char *v7;
  BOOL v8;
  const void *v9;

  v2 = (char *)this + 48;
  v3 = (char *)*((_QWORD *)this + 6);
  v4 = (char *)this + 56;
  if (v3 != (char *)this + 56)
  {
    do
    {
      v5 = (const void *)*((_QWORD *)v3 + 5);
      if (v5)
      {
        CFRelease(v5);
        *((_QWORD *)v3 + 5) = 0;
      }
      v6 = (char *)*((_QWORD *)v3 + 1);
      if (v6)
      {
        do
        {
          v7 = v6;
          v6 = *(char **)v6;
        }
        while (v6);
      }
      else
      {
        do
        {
          v7 = (char *)*((_QWORD *)v3 + 2);
          v8 = *(_QWORD *)v7 == (_QWORD)v3;
          v3 = v7;
        }
        while (!v8);
      }
      v3 = v7;
    }
    while (v7 != v4);
  }
  v9 = (const void *)*((_QWORD *)this + 1);
  if (v9)
  {
    CFRelease(v9);
    *((_QWORD *)this + 1) = 0;
  }
  std::__tree<std::__value_type<std::pair<unsigned int,unsigned int>,void const*>,std::__map_value_compare<std::pair<unsigned int,unsigned int>,std::__value_type<std::pair<unsigned int,unsigned int>,void const*>,std::less<std::pair<unsigned int,unsigned int>>,true>,std::allocator<std::__value_type<std::pair<unsigned int,unsigned int>,void const*>>>::destroy((uint64_t)v2, *((_QWORD **)this + 7));
}

uint64_t BookmarkData::dataSectionAtOffset(BookmarkData *this, unsigned int a2, unsigned int a3)
{
  unint64_t v3;
  uint64_t v5;

  v3 = *((unsigned int *)this + 10);
  if (v3 < a2 || a3 + (unint64_t)a2 > v3)
    return 0;
  v5 = *((unsigned int *)this + 9);
  if ((((_BYTE)v5 + (_BYTE)a2) & 3) != 0)
    return 0;
  else
    return *((_QWORD *)this + 3) + v5 + a2;
}

unsigned int *BookmarkData::getDataItemForTOCItem(BookmarkData *a1, uint64_t a2)
{
  if (a2)
    return BookmarkData::getDataItemAtOffset(a1, *(_DWORD *)(a2 + 4));
  else
    return 0;
}

CFNumberRef BookmarkData::copyItem(CFAllocatorRef *a1, unsigned int *a2, uint64_t a3)
{
  CFNumberRef v3;
  _QWORD **v5;
  _QWORD *v6[2];

  v6[0] = 0;
  v6[1] = 0;
  v5 = v6;
  v3 = BookmarkData::copyItem(a1, a2, (uint64_t)&v5, a3);
  std::__tree<std::__value_type<std::pair<unsigned int,unsigned int>,void const*>,std::__map_value_compare<std::pair<unsigned int,unsigned int>,std::__value_type<std::pair<unsigned int,unsigned int>,void const*>,std::less<std::pair<unsigned int,unsigned int>>,true>,std::allocator<std::__value_type<std::pair<unsigned int,unsigned int>,void const*>>>::destroy((uint64_t)&v5, v6[0]);
  return v3;
}

CFNumberRef BookmarkData::copyItem(CFAllocatorRef *a1, unsigned int *a2, uint64_t a3, uint64_t a4)
{
  _QWORD *v8;
  uint64_t v9;
  unint64_t v10;
  BOOL v11;
  _QWORD *v12;
  CFNumberRef v13;
  CFIndex v14;
  int v15;
  const __CFAllocator *v16;
  CFNumberType v17;
  CFNumberRef *v18;
  NSObject *v19;
  const __CFNumber *v20;
  unsigned int v21;
  uint64_t v22;
  uint64_t v23;
  unsigned int *DataItemAtOffset;
  uint64_t v25;
  uint64_t v26;
  uint64_t *v27;
  uint64_t *v28;
  uint64_t v29;
  unint64_t v30;
  unint64_t v31;
  char *v32;
  uint64_t *v33;
  char *v34;
  char *v35;
  uint64_t v36;
  uint64_t *v37;
  CFTypeRef *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  const __CFString *v43;
  const void *v44;
  unsigned int *v45;
  unsigned int *v46;
  CFTypeID v47;
  const __CFURL *v48;
  CFTypeID TypeID;
  const __CFString *v50;
  unsigned int v51;
  uint64_t v52;
  uint64_t v53;
  unsigned int *v54;
  uint64_t v55;
  unint64_t v56;
  unint64_t v57;
  unsigned int *v58;
  unsigned int *v59;
  unsigned int *v60;
  uint64_t v61;
  void *v62;
  void *v63;
  uint64_t *v64;
  uint64_t *v65;
  uint64_t v66;
  unint64_t v67;
  unint64_t v68;
  char *v69;
  uint64_t *v70;
  char *v71;
  char *v72;
  uint64_t v73;
  void **v74;
  uint64_t v75;
  unint64_t v76;
  unint64_t v77;
  char *v78;
  void **v79;
  void **v80;
  void *v81;
  CFTypeRef *v82;
  CFTypeRef *v83;
  CFTypeRef *v84;
  CFTypeRef *v85;
  const void *v86;
  UInt8 byte7[8];
  void **values;
  void **v90;
  void **v91;
  void *__p;
  uint64_t *v93;
  char *v94;
  unsigned int *v95;

  v95 = a2;
  if (!a2)
    return 0;
  v8 = *(_QWORD **)(a3 + 8);
  if (v8)
  {
    v9 = a3 + 8;
    do
    {
      v10 = v8[4];
      v11 = v10 >= (unint64_t)a2;
      if (v10 >= (unint64_t)a2)
        v12 = v8;
      else
        v12 = v8 + 1;
      if (v11)
        v9 = (uint64_t)v8;
      v8 = (_QWORD *)*v12;
    }
    while (*v12);
    if (v9 != a3 + 8 && *(_QWORD *)(v9 + 32) <= (unint64_t)a2)
    {
      v19 = bmarkLog;
      if (os_log_type_enabled((os_log_t)bmarkLog, OS_LOG_TYPE_ERROR))
        BookmarkData::copyItem((uint64_t)a2, v19);
      return 0;
    }
  }
  v13 = 0;
  v14 = *a2;
  v15 = a2[1];
  if (v15 <= 1023)
  {
    switch(v15)
    {
      case 769:
        if (!(_DWORD)v14)
          goto LABEL_95;
        LOBYTE(__p) = *((_BYTE *)a2 + 8);
        v16 = *a1;
        v17 = kCFNumberSInt8Type;
        goto LABEL_196;
      case 770:
        if (v14 < 2)
          goto LABEL_95;
        LOWORD(__p) = *((_WORD *)a2 + 4);
        v16 = *a1;
        v17 = kCFNumberSInt16Type;
        goto LABEL_196;
      case 771:
        if (v14 < 4)
          goto LABEL_95;
        LODWORD(__p) = a2[2];
        v16 = *a1;
        v17 = kCFNumberSInt32Type;
        goto LABEL_196;
      case 772:
        if (v14 < 8)
          goto LABEL_95;
        __p = *((void **)a2 + 1);
        v16 = *a1;
        v17 = kCFNumberSInt64Type;
        goto LABEL_196;
      case 773:
        if (v14 < 4)
          goto LABEL_95;
        LODWORD(__p) = a2[2];
        v16 = *a1;
        v17 = kCFNumberFloat32Type;
        goto LABEL_196;
      case 774:
        if (v14 < 8)
          goto LABEL_95;
        __p = *((void **)a2 + 1);
        v16 = *a1;
        v17 = kCFNumberFloat64Type;
        goto LABEL_196;
      case 775:
        if (!(_DWORD)v14)
          goto LABEL_95;
        LOBYTE(__p) = *((_BYTE *)a2 + 8);
        v16 = *a1;
        v17 = kCFNumberCharType;
        goto LABEL_196;
      case 776:
        if (v14 < 2)
          goto LABEL_95;
        LOWORD(__p) = *((_WORD *)a2 + 4);
        v16 = *a1;
        v17 = kCFNumberShortType;
        goto LABEL_196;
      case 777:
        if (v14 < 4)
          goto LABEL_95;
        LODWORD(__p) = a2[2];
        v16 = *a1;
        v17 = kCFNumberIntType;
        goto LABEL_196;
      case 778:
        if ((_DWORD)v14 == 8)
        {
          v40 = (void *)*((_QWORD *)a2 + 1);
        }
        else
        {
          if ((_DWORD)v14 != 4)
            return 0;
          v40 = (void *)(int)a2[2];
        }
        __p = v40;
        v16 = *a1;
        v17 = kCFNumberLongType;
        goto LABEL_196;
      case 779:
        if (v14 < 8)
          goto LABEL_95;
        __p = *((void **)a2 + 1);
        v16 = *a1;
        v17 = kCFNumberLongLongType;
        goto LABEL_196;
      case 780:
        if (v14 < 4)
          goto LABEL_95;
        LODWORD(__p) = a2[2];
        v16 = *a1;
        v17 = kCFNumberFloatType;
        goto LABEL_196;
      case 781:
        if (v14 >= 8)
        {
          __p = *((void **)a2 + 1);
          v16 = *a1;
          v17 = kCFNumberDoubleType;
          goto LABEL_196;
        }
LABEL_95:
        v13 = 0;
        if (a4)
          goto LABEL_198;
        return v13;
      case 782:
        if ((_DWORD)v14 == 8)
        {
          v41 = (void *)*((_QWORD *)a2 + 1);
        }
        else
        {
          if ((_DWORD)v14 != 4)
            return 0;
          v41 = (void *)(int)a2[2];
        }
        __p = v41;
        v16 = *a1;
        v17 = kCFNumberCFIndexType;
        goto LABEL_196;
      case 783:
        if ((_DWORD)v14 == 8)
        {
          v42 = (void *)*((_QWORD *)a2 + 1);
        }
        else
        {
          if ((_DWORD)v14 != 4)
            return 0;
          v42 = (void *)(int)a2[2];
        }
        __p = v42;
        v16 = *a1;
        v17 = kCFNumberNSIntegerType;
        goto LABEL_196;
      case 784:
        if ((_DWORD)v14 == 8)
        {
          __p = *((void **)a2 + 1);
        }
        else
        {
          if ((_DWORD)v14 != 4)
            return 0;
          *(double *)&__p = *((float *)a2 + 2);
        }
        v16 = *a1;
        v17 = kCFNumberCGFloatType;
LABEL_196:
        v13 = CFNumberCreate(v16, v17, &__p);
        goto LABEL_197;
      default:
        if (v15 == 257)
        {
          v20 = (const __CFNumber *)CFStringCreateWithBytes(*a1, (const UInt8 *)a2 + 8, v14, 0x8000100u, 0);
        }
        else
        {
          if (v15 != 513)
            return v13;
          v20 = CFDataCreate(*a1, (const UInt8 *)a2 + 8, v14);
        }
        break;
    }
LABEL_115:
    v13 = v20;
    if (!a4)
      return v13;
    goto LABEL_198;
  }
  if (v15 <= 1792)
  {
    if (v15 > 1280)
    {
      if (v15 != 1281)
      {
        if (v15 != 1537)
          return v13;
        if (v14 < 4)
          return 0;
        v21 = v14 >> 2;
        *(double *)&__p = 0.0;
        v93 = 0;
        v94 = 0;
        std::__tree<CFBookmarkDataItem const*>::__emplace_unique_key_args<CFBookmarkDataItem const*,CFBookmarkDataItem const* const&>((uint64_t **)a3, (unint64_t *)&v95, (uint64_t *)&v95);
        v22 = 0;
        if (v21 <= 1)
          v23 = 1;
        else
          v23 = v21;
        do
        {
          if (v95)
          {
            if (4 * v22 + 4 <= (unint64_t)*v95)
            {
              DataItemAtOffset = BookmarkData::getDataItemAtOffset((BookmarkData *)a1, v95[v22 + 2]);
              if (DataItemAtOffset)
              {
                v25 = BookmarkData::copyItem(a1, DataItemAtOffset, a3, 0);
                if (v25)
                {
                  v26 = v25;
                  v27 = v93;
                  if (v93 >= (uint64_t *)v94)
                  {
                    v29 = ((char *)v93 - (_BYTE *)__p) >> 3;
                    if ((unint64_t)(v29 + 1) >> 61)
LABEL_210:
                      abort();
                    v30 = (v94 - (_BYTE *)__p) >> 2;
                    if (v30 <= v29 + 1)
                      v30 = v29 + 1;
                    if ((unint64_t)(v94 - (_BYTE *)__p) >= 0x7FFFFFFFFFFFFFF8)
                      v31 = 0x1FFFFFFFFFFFFFFFLL;
                    else
                      v31 = v30;
                    if (v31)
                      v32 = (char *)std::__allocate_at_least[abi:nn180100]<std::allocator<void const*>>((uint64_t)&v94, v31);
                    else
                      v32 = 0;
                    v33 = (uint64_t *)&v32[8 * v29];
                    *v33 = v26;
                    v28 = v33 + 1;
                    v35 = (char *)__p;
                    v34 = (char *)v93;
                    if (v93 != __p)
                    {
                      do
                      {
                        v36 = *((_QWORD *)v34 - 1);
                        v34 -= 8;
                        *--v33 = v36;
                      }
                      while (v34 != v35);
                      v34 = (char *)__p;
                    }
                    __p = v33;
                    v93 = v28;
                    v94 = &v32[8 * v31];
                    if (v34)
                      operator delete(v34);
                  }
                  else
                  {
                    *v93 = v25;
                    v28 = v27 + 1;
                  }
                  v93 = v28;
                }
              }
            }
          }
          ++v22;
        }
        while (v22 != v23);
        std::__tree<CFBookmarkDataItem const*>::__erase_unique<CFBookmarkDataItem const*>(a3, (unint64_t *)&v95);
        v13 = CFArrayCreate(*a1, (const void **)__p, ((char *)v93 - (_BYTE *)__p) >> 3, MEMORY[0x1E0C9B378]);
        v38 = (CFTypeRef *)__p;
        v37 = v93;
        if (__p < v93)
        {
          do
          {
            if (*v38)
            {
              CFRelease(*v38);
              *v38 = 0;
              v37 = v93;
            }
            ++v38;
          }
          while (v38 < (CFTypeRef *)v37);
          v38 = (CFTypeRef *)__p;
        }
        if (v38)
        {
          v93 = (uint64_t *)v38;
          v39 = v38;
          goto LABEL_186;
        }
        goto LABEL_197;
      }
      v18 = (CFNumberRef *)MEMORY[0x1E0C9AE50];
    }
    else
    {
      if (v15 == 1024)
      {
        if (v14 >= 8)
        {
          v20 = CFDateCreate(*a1, COERCE_CFABSOLUTETIME(bswap64(*((_QWORD *)a2 + 1))));
          goto LABEL_115;
        }
        return 0;
      }
      if (v15 != 1280)
        return v13;
      v18 = (CFNumberRef *)MEMORY[0x1E0C9AE40];
    }
LABEL_174:
    v13 = *v18;
    if (!a4)
      return v13;
    goto LABEL_198;
  }
  if (v15 > 2304)
  {
    if (v15 != 2305)
    {
      if (v15 != 2306)
      {
        if (v15 != 2561)
          return v13;
        v18 = (CFNumberRef *)MEMORY[0x1E0C9B0D0];
        goto LABEL_174;
      }
      if (v14 >= 8)
      {
        std::__tree<CFBookmarkDataItem const*>::__emplace_unique_key_args<CFBookmarkDataItem const*,CFBookmarkDataItem const* const&>((uint64_t **)a3, (unint64_t *)&v95, (uint64_t *)&v95);
        v45 = BookmarkData::getDataItemAtOffset((BookmarkData *)a1, a2[2]);
        v46 = BookmarkData::getDataItemAtOffset((BookmarkData *)a1, a2[3]);
        v47 = CFURLGetTypeID();
        v48 = (const __CFURL *)BookmarkData::copyItem(a1, v45, a3, v47);
        TypeID = CFStringGetTypeID();
        v50 = (const __CFString *)BookmarkData::copyItem(a1, v46, a3, TypeID);
        std::__tree<CFBookmarkDataItem const*>::__erase_unique<CFBookmarkDataItem const*>(a3, (unint64_t *)&v95);
        if (!v48)
        {
          if (!v50)
            return 0;
          v86 = v50;
          goto LABEL_201;
        }
        if (v50)
        {
          v13 = CFURLCreateWithString(*a1, v50, v48);
          CFRelease(v50);
        }
        else
        {
          v13 = 0;
        }
        v44 = v48;
        goto LABEL_208;
      }
      return 0;
    }
    v43 = CFStringCreateWithBytes(*a1, (const UInt8 *)a2 + 8, v14, 0x8000100u, 0);
    v13 = CFURLCreateWithString(*a1, v43, 0);
    if (v43)
    {
      v44 = v43;
LABEL_208:
      CFRelease(v44);
      if (!a4)
        return v13;
      goto LABEL_198;
    }
LABEL_197:
    if (!a4)
      return v13;
    goto LABEL_198;
  }
  if (v15 != 1793)
  {
    if (v15 != 2049)
      return v13;
    if ((_DWORD)v14 == 16)
    {
      *(_QWORD *)byte7 = *(_QWORD *)((char *)a2 + 15);
      v20 = CFUUIDCreateWithBytes(*a1, *((_BYTE *)a2 + 8), *((_BYTE *)a2 + 9), *((_BYTE *)a2 + 10), *((_BYTE *)a2 + 11), *((_BYTE *)a2 + 12), *((_BYTE *)a2 + 13), *((_BYTE *)a2 + 14), byte7[0], byte7[1], byte7[2], byte7[3], byte7[4], byte7[5], byte7[6], byte7[7], *((_BYTE *)a2 + 23));
      goto LABEL_115;
    }
    return 0;
  }
  if (v14 < 8)
    return 0;
  v51 = v14 >> 3;
  *(double *)&__p = 0.0;
  v93 = 0;
  v94 = 0;
  values = 0;
  v90 = 0;
  v91 = 0;
  std::__tree<CFBookmarkDataItem const*>::__emplace_unique_key_args<CFBookmarkDataItem const*,CFBookmarkDataItem const* const&>((uint64_t **)a3, (unint64_t *)&v95, (uint64_t *)&v95);
  v52 = 0;
  if (v51 <= 1)
    v53 = 1;
  else
    v53 = v51;
  do
  {
    v54 = v95;
    if (!v95)
      goto LABEL_167;
    v55 = 2 * v52;
    v56 = *v95;
    v57 = (8 * v52) | 4;
    v58 = v57 <= v56 ? BookmarkData::getDataItemAtOffset((BookmarkData *)a1, v95[v55 + 2]) : 0;
    if (v55 * 4 + 8 > v56)
      goto LABEL_167;
    v59 = BookmarkData::getDataItemAtOffset((BookmarkData *)a1, *(unsigned int *)((char *)v54 + v57 + 8));
    if (!v58)
      goto LABEL_167;
    v60 = v59;
    if (!v59)
      goto LABEL_167;
    v61 = BookmarkData::copyItem(a1, v58, a3, 0);
    v62 = (void *)BookmarkData::copyItem(a1, v60, a3, 0);
    v63 = v62;
    if (!v61)
    {
      if (!v62)
        goto LABEL_167;
      goto LABEL_135;
    }
    if (!v62)
    {
      v62 = (void *)v61;
LABEL_135:
      CFRelease(v62);
      goto LABEL_167;
    }
    v64 = v93;
    if (v93 >= (uint64_t *)v94)
    {
      v66 = ((char *)v93 - (_BYTE *)__p) >> 3;
      if ((unint64_t)(v66 + 1) >> 61)
        goto LABEL_210;
      v67 = (v94 - (_BYTE *)__p) >> 2;
      if (v67 <= v66 + 1)
        v67 = v66 + 1;
      if ((unint64_t)(v94 - (_BYTE *)__p) >= 0x7FFFFFFFFFFFFFF8)
        v68 = 0x1FFFFFFFFFFFFFFFLL;
      else
        v68 = v67;
      if (v68)
        v69 = (char *)std::__allocate_at_least[abi:nn180100]<std::allocator<void const*>>((uint64_t)&v94, v68);
      else
        v69 = 0;
      v70 = (uint64_t *)&v69[8 * v66];
      *v70 = v61;
      v65 = v70 + 1;
      v72 = (char *)__p;
      v71 = (char *)v93;
      if (v93 != __p)
      {
        do
        {
          v73 = *((_QWORD *)v71 - 1);
          v71 -= 8;
          *--v70 = v73;
        }
        while (v71 != v72);
        v71 = (char *)__p;
      }
      __p = v70;
      v93 = v65;
      v94 = &v69[8 * v68];
      if (v71)
        operator delete(v71);
    }
    else
    {
      *v93 = v61;
      v65 = v64 + 1;
    }
    v93 = v65;
    if (v90 >= v91)
    {
      v75 = v90 - values;
      if ((unint64_t)(v75 + 1) >> 61)
        goto LABEL_210;
      v76 = ((char *)v91 - (char *)values) >> 2;
      if (v76 <= v75 + 1)
        v76 = v75 + 1;
      if ((unint64_t)((char *)v91 - (char *)values) >= 0x7FFFFFFFFFFFFFF8)
        v77 = 0x1FFFFFFFFFFFFFFFLL;
      else
        v77 = v76;
      if (v77)
        v78 = (char *)std::__allocate_at_least[abi:nn180100]<std::allocator<void const*>>((uint64_t)&v91, v77);
      else
        v78 = 0;
      v79 = (void **)&v78[8 * v75];
      *v79 = v63;
      v74 = v79 + 1;
      v80 = v90;
      if (v90 != values)
      {
        do
        {
          v81 = *--v80;
          *--v79 = v81;
        }
        while (v80 != values);
        v80 = values;
      }
      values = v79;
      v91 = (void **)&v78[8 * v77];
      if (v80)
        operator delete(v80);
    }
    else
    {
      *v90 = v63;
      v74 = v90 + 1;
    }
    v90 = v74;
LABEL_167:
    ++v52;
  }
  while (v52 != v53);
  std::__tree<CFBookmarkDataItem const*>::__erase_unique<CFBookmarkDataItem const*>(a3, (unint64_t *)&v95);
  v13 = CFDictionaryCreate(*a1, (const void **)__p, (const void **)values, ((char *)v93 - (_BYTE *)__p) >> 3, MEMORY[0x1E0C9B390], MEMORY[0x1E0C9B3A0]);
  v83 = (CFTypeRef *)__p;
  v82 = (CFTypeRef *)v93;
  while (v83 != v82)
  {
    if (*v83)
    {
      CFRelease(*v83);
      *v83 = 0;
      v82 = (CFTypeRef *)v93;
    }
    ++v83;
  }
  v85 = (CFTypeRef *)values;
  v84 = (CFTypeRef *)v90;
  if (values != v90)
  {
    do
    {
      if (*v85)
      {
        CFRelease(*v85);
        *v85 = 0;
        v84 = (CFTypeRef *)v90;
      }
      ++v85;
    }
    while (v85 != v84);
    v85 = (CFTypeRef *)values;
  }
  if (v85)
    operator delete(v85);
  v39 = __p;
  if (*(double *)&__p == 0.0)
    goto LABEL_197;
  v93 = (uint64_t *)__p;
LABEL_186:
  operator delete(v39);
  if (a4)
  {
LABEL_198:
    if (!v13 || CFGetTypeID(v13) == a4)
      return v13;
    v86 = v13;
LABEL_201:
    CFRelease(v86);
    return 0;
  }
  return v13;
}

CFTypeRef BookmarkData::copyItemFromCache(BookmarkData *this, unsigned int a2, unsigned int a3)
{
  CFTypeRef v3;
  CFTypeRef *v5;
  unsigned int v7[2];

  v3 = 0;
  if (a2 && a3)
  {
    v7[0] = a2;
    v7[1] = a3;
    v5 = (CFTypeRef *)std::__tree<std::__value_type<std::pair<unsigned int,unsigned int>,void const*>,std::__map_value_compare<std::pair<unsigned int,unsigned int>,std::__value_type<std::pair<unsigned int,unsigned int>,void const*>,std::less<std::pair<unsigned int,unsigned int>>,true>,std::allocator<std::__value_type<std::pair<unsigned int,unsigned int>,void const*>>>::find<std::pair<unsigned int,unsigned int>>((uint64_t)this + 48, v7);
    if ((CFTypeRef *)((char *)this + 56) == v5)
    {
      return 0;
    }
    else
    {
      v3 = v5[5];
      if (v3)
        CFRetain(v5[5]);
    }
  }
  return v3;
}

uint64_t BookmarkData::addItemToCache(BookmarkData *this, unsigned int a2, unsigned int a3, const void *a4)
{
  uint64_t **v6;
  uint64_t *v7;
  const void *v8;
  __int128 v10;
  unint64_t v11;

  if (a2 && a3)
  {
    v11 = __PAIR64__(a3, a2);
    v6 = (uint64_t **)((char *)this + 48);
    v7 = std::__tree<std::__value_type<std::pair<unsigned int,unsigned int>,void const*>,std::__map_value_compare<std::pair<unsigned int,unsigned int>,std::__value_type<std::pair<unsigned int,unsigned int>,void const*>,std::less<std::pair<unsigned int,unsigned int>>,true>,std::allocator<std::__value_type<std::pair<unsigned int,unsigned int>,void const*>>>::find<std::pair<unsigned int,unsigned int>>((uint64_t)this + 48, (unsigned int *)&v11);
    if ((uint64_t *)((char *)this + 56) == v7)
    {
      if (a4)
        CFRetain(a4);
      *(_QWORD *)&v10 = v11;
      *((_QWORD *)&v10 + 1) = a4;
      std::__tree<std::__value_type<std::pair<unsigned int,unsigned int>,void const*>,std::__map_value_compare<std::pair<unsigned int,unsigned int>,std::__value_type<std::pair<unsigned int,unsigned int>,void const*>,std::less<std::pair<unsigned int,unsigned int>>,true>,std::allocator<std::__value_type<std::pair<unsigned int,unsigned int>,void const*>>>::__emplace_unique_key_args<std::pair<unsigned int,unsigned int>,std::pair<std::pair<unsigned int,unsigned int> const,void const*> const&>(v6, (unsigned int *)&v10, &v10);
    }
    else
    {
      v8 = (const void *)v7[5];
      if (v8 != a4)
      {
        if (a4)
          CFRetain(a4);
        *(_QWORD *)&v10 = v11;
        *((_QWORD *)&v10 + 1) = a4;
        std::__tree<std::__value_type<std::pair<unsigned int,unsigned int>,void const*>,std::__map_value_compare<std::pair<unsigned int,unsigned int>,std::__value_type<std::pair<unsigned int,unsigned int>,void const*>,std::less<std::pair<unsigned int,unsigned int>>,true>,std::allocator<std::__value_type<std::pair<unsigned int,unsigned int>,void const*>>>::__emplace_unique_key_args<std::pair<unsigned int,unsigned int>,std::pair<std::pair<unsigned int,unsigned int> const,void const*> const&>(v6, (unsigned int *)&v10, &v10);
        if (v8)
          CFRelease(v8);
      }
    }
  }
  return 0;
}

const void *BookmarkData::copyItem(BookmarkData *this, unsigned int a2, unsigned int a3, uint64_t a4)
{
  const void *v8;
  uint64_t ItemInTOC;

  v8 = BookmarkData::copyItemFromCache(this, a2, a3);
  if (!v8)
  {
    ItemInTOC = BookmarkData::findItemInTOC(this, a2, a3);
    if (ItemInTOC)
    {
      v8 = BookmarkData::copyDataItemAtOffset(this, *(_DWORD *)(ItemInTOC + 4), a4);
      if (v8)
        BookmarkData::addItemToCache(this, a2, a3, v8);
    }
    else
    {
      return 0;
    }
  }
  return v8;
}

uint64_t BookmarkData::findItemInTOC(BookmarkData *this, unsigned int a2, int a3)
{
  uint64_t FirstTOC;
  uint64_t v7;
  uint64_t ItemInSingleTOCByItemType;
  _BOOL4 v9;

  if (!a2)
    return 0;
  FirstTOC = BookmarkData::getFirstTOC(this, a3);
  if (!FirstTOC)
    return 0;
  v7 = FirstTOC;
  do
  {
    if (a3 && *(_DWORD *)(v7 + 8) != a3)
      ItemInSingleTOCByItemType = 0;
    else
      ItemInSingleTOCByItemType = BookmarkData::findItemInSingleTOCByItemType(FirstTOC, v7, a2);
    FirstTOC = BookmarkData::getTOCAtOffset(this, *(_DWORD *)(v7 + 12));
    v9 = FirstTOC != 0 && FirstTOC != v7;
    if (FirstTOC != 0 && FirstTOC != v7)
      v7 = FirstTOC;
    else
      v7 = 0;
  }
  while (v9 && ItemInSingleTOCByItemType == 0);
  return ItemInSingleTOCByItemType;
}

CFNumberRef BookmarkData::copyItem(BookmarkData *a1, uint64_t a2, uint64_t a3)
{
  return BookmarkData::copyDataItemAtOffset(a1, *(_DWORD *)(a2 + 4), a3);
}

CFNumberRef BookmarkData::copyItem(BookmarkData *this, const __CFString *a2, int a3, uint64_t a4)
{
  CFNumberRef result;

  result = (CFNumberRef)BookmarkData::findItemInTOC(this, a2, a3);
  if (result)
    return BookmarkData::copyDataItemAtOffset(this, *((_DWORD *)result + 1), a4);
  return result;
}

uint64_t BookmarkData::findItemInTOC(BookmarkData *this, CFStringRef theString, int a3)
{
  const char *CStringPtr;
  UInt8 *v7;
  CFIndex Length;
  UInt8 *v9;
  uint64_t ItemInSingleTOCByKeyStringBytes;
  size_t v11;
  uint64_t FirstTOC;
  uint64_t v13;
  uint64_t TOCAtOffset;
  BOOL v15;
  CFIndex maxBufLen;
  CFIndex usedBufLen;
  UInt8 buffer[128];
  uint64_t v20;
  CFRange v21;
  CFRange v22;
  CFRange v23;

  v20 = *MEMORY[0x1E0C80C00];
  if (!theString)
    return 0;
  CStringPtr = CFStringGetCStringPtr(theString, 0x8000100u);
  if (CStringPtr)
  {
    v7 = (UInt8 *)CStringPtr;
    Length = CFStringGetLength(theString);
    v9 = 0;
    usedBufLen = Length;
  }
  else
  {
    usedBufLen = 0;
    v21.length = CFStringGetLength(theString);
    v7 = buffer;
    v21.location = 0;
    if (CFStringGetBytes(theString, v21, 0x8000100u, 0, 0, buffer, 128, &usedBufLen))
    {
      v9 = 0;
    }
    else
    {
      maxBufLen = 0;
      v22.length = CFStringGetLength(theString);
      v22.location = 0;
      if (CFStringGetBytes(theString, v22, 0x8000100u, 0, 0, 0, 0, &maxBufLen))
      {
        v7 = (UInt8 *)malloc_type_malloc(maxBufLen, 0xC31A1981uLL);
        v23.length = CFStringGetLength(theString);
        v23.location = 0;
        if (!CFStringGetBytes(theString, v23, 0x8000100u, 0, 0, v7, maxBufLen, &usedBufLen))
          usedBufLen = 0;
      }
      else
      {
        v7 = 0;
      }
      v9 = v7;
    }
  }
  ItemInSingleTOCByKeyStringBytes = 0;
  if (v7)
  {
    v11 = usedBufLen;
    if (usedBufLen >= 1)
    {
      FirstTOC = BookmarkData::getFirstTOC(this, a3);
      if (!FirstTOC)
      {
        ItemInSingleTOCByKeyStringBytes = 0;
        if (!v9)
          return ItemInSingleTOCByKeyStringBytes;
        goto LABEL_24;
      }
      v13 = FirstTOC;
      ItemInSingleTOCByKeyStringBytes = 0;
      do
      {
        if (*(_DWORD *)(v13 + 8) == a3)
          ItemInSingleTOCByKeyStringBytes = BookmarkData::findItemInSingleTOCByKeyStringBytes(this, v13, v7, v11);
        TOCAtOffset = BookmarkData::getTOCAtOffset(this, *(_DWORD *)(v13 + 12));
        if (TOCAtOffset)
          v15 = TOCAtOffset == v13;
        else
          v15 = 1;
        v13 = TOCAtOffset;
      }
      while (!v15);
    }
  }
  if (v9)
LABEL_24:
    free(v9);
  return ItemInSingleTOCByKeyStringBytes;
}

CFNumberRef BookmarkData::copyDataItemAtOffset(BookmarkData *this, unsigned int a2, uint64_t a3)
{
  unsigned int *DataItemAtOffset;
  CFNumberRef v6;
  _QWORD **v8;
  _QWORD *v9[2];

  DataItemAtOffset = BookmarkData::getDataItemAtOffset(this, a2);
  v9[0] = 0;
  v9[1] = 0;
  v8 = v9;
  v6 = BookmarkData::copyItem((CFAllocatorRef *)this, DataItemAtOffset, (uint64_t)&v8, a3);
  std::__tree<std::__value_type<std::pair<unsigned int,unsigned int>,void const*>,std::__map_value_compare<std::pair<unsigned int,unsigned int>,std::__value_type<std::pair<unsigned int,unsigned int>,void const*>,std::less<std::pair<unsigned int,unsigned int>>,true>,std::allocator<std::__value_type<std::pair<unsigned int,unsigned int>,void const*>>>::destroy((uint64_t)&v8, v9[0]);
  return v6;
}

BOOL BookmarkData::getItemAs(BookmarkData *this, unsigned int a2, int a3, unsigned int *a4)
{
  uint64_t ItemInTOC;
  unsigned int v7;
  unsigned int *DataItemAtOffset;
  unsigned int v9;
  _BOOL8 v10;
  CFTypeID TypeID;
  const __CFNumber *v12;
  const __CFNumber *v13;

  ItemInTOC = BookmarkData::findItemInTOC(this, a2, a3);
  if (!ItemInTOC)
    return 0;
  v7 = *(_DWORD *)(ItemInTOC + 4);
  DataItemAtOffset = BookmarkData::getDataItemAtOffset(this, v7);
  if (!DataItemAtOffset)
    return 0;
  v9 = DataItemAtOffset[1];
  if (v9 != 771 && v9 != 513)
  {
    TypeID = CFNumberGetTypeID();
    v12 = BookmarkData::copyDataItemAtOffset(this, v7, TypeID);
    if (v12)
    {
      v13 = v12;
      v10 = CFNumberGetValue(v12, kCFNumberSInt32Type, a4) != 0;
      CFRelease(v13);
      return v10;
    }
    return 0;
  }
  if (*DataItemAtOffset != 4)
    return 0;
  *a4 = DataItemAtOffset[2];
  return 1;
}

uint64_t BookmarkData::getItemAs(BookmarkData *this, unsigned int a2, int a3, BOOL *a4)
{
  uint64_t result;
  int v7;
  BOOL v8;

  result = BookmarkData::findItemInTOC(this, a2, a3);
  if (result)
  {
    result = (uint64_t)BookmarkData::getDataItemAtOffset(this, *(_DWORD *)(result + 4));
    if (result)
    {
      v7 = *(_DWORD *)(result + 4);
      if (v7 == 1281)
      {
        v8 = 1;
        goto LABEL_7;
      }
      if (v7 == 1280)
      {
        v8 = 0;
LABEL_7:
        *a4 = v8;
        return 1;
      }
      return 0;
    }
  }
  return result;
}

BOOL BookmarkData::getURLResourceProperties(BookmarkData *a1, int a2, uint64_t a3)
{
  unsigned int *MisalignedItemDataPtr;
  __int128 v5;
  unsigned int v7;

  MisalignedItemDataPtr = BookmarkData::getMisalignedItemDataPtr(a1, 0x1010u, 0x18u, a2, &v7);
  if (MisalignedItemDataPtr)
  {
    v5 = *(_OWORD *)MisalignedItemDataPtr;
    *(_QWORD *)(a3 + 16) = *((_QWORD *)MisalignedItemDataPtr + 2);
    *(_OWORD *)a3 = v5;
  }
  return MisalignedItemDataPtr != 0;
}

unsigned int *BookmarkData::getMisalignedItemDataPtr(BookmarkData *this, unsigned int a2, unsigned int a3, int a4)
{
  unsigned int v5;

  return BookmarkData::getMisalignedItemDataPtr(this, a2, a3, a4, &v5);
}

BOOL BookmarkData::getURLVolumeProperties(BookmarkData *a1, int a2, uint64_t a3)
{
  unsigned int *MisalignedItemDataPtr;
  __int128 v5;
  unsigned int v7;

  MisalignedItemDataPtr = BookmarkData::getMisalignedItemDataPtr(a1, 0x2020u, 0x18u, a2, &v7);
  if (MisalignedItemDataPtr)
  {
    v5 = *(_OWORD *)MisalignedItemDataPtr;
    *(_QWORD *)(a3 + 16) = *((_QWORD *)MisalignedItemDataPtr + 2);
    *(_OWORD *)a3 = v5;
  }
  return MisalignedItemDataPtr != 0;
}

uint64_t BookmarkData::getNextTOC(BookmarkData *a1, uint64_t a2)
{
  uint64_t result;

  if (a2)
    result = BookmarkData::getTOCAtOffset(a1, *(_DWORD *)(a2 + 12));
  else
    result = 0;
  if (result == a2 || result == 0)
    return 0;
  return result;
}

uint64_t BookmarkData::getFirstTOC(BookmarkData *this, int a2)
{
  uint64_t v4;
  unsigned int v5;
  uint64_t TOCAtOffset;
  uint64_t result;
  uint64_t v8;
  BOOL v9;

  v4 = *((_QWORD *)this + 3);
  if (v4)
    v5 = *(_DWORD *)(v4 + *((unsigned int *)this + 9));
  else
    v5 = 0;
  TOCAtOffset = BookmarkData::getTOCAtOffset(this, v5);
  result = 0;
  if (a2 && TOCAtOffset)
  {
    while (*(_DWORD *)(TOCAtOffset + 8) != a2)
    {
      v8 = BookmarkData::getTOCAtOffset(this, *(_DWORD *)(TOCAtOffset + 12));
      if (v8)
        v9 = v8 == TOCAtOffset;
      else
        v9 = 1;
      TOCAtOffset = v8;
      if (v9)
        return 0;
    }
    return TOCAtOffset;
  }
  return result;
}

_DWORD *BookmarkData::getIndexedItemInTOC(BookmarkData *this, unsigned int a2, int a3)
{
  _DWORD *result;
  _DWORD *v7;
  unsigned int v8;
  BOOL v9;
  unsigned int v10;
  uint64_t TOCAtOffset;
  BOOL v12;

  result = (_DWORD *)BookmarkData::getFirstTOC(this, a3);
  if (result)
  {
    v7 = result;
    while (1)
    {
      if (!a3 || v7[2] == a3)
      {
        v8 = v7[4];
        v9 = a2 >= v8;
        v10 = a2 - v8;
        if (v10 == 0 || !v9)
        {
          if (v9)
            return 0;
          else
            return &v7[3 * a2 + 5];
        }
        a2 = v10;
      }
      TOCAtOffset = BookmarkData::getTOCAtOffset(this, v7[3]);
      if (TOCAtOffset)
        v12 = TOCAtOffset == (_QWORD)v7;
      else
        v12 = 1;
      v7 = (_DWORD *)TOCAtOffset;
      if (v12)
        return 0;
    }
  }
  return result;
}

uint64_t BookmarkData::findItemInSingleTOCByItemType(uint64_t a1, uint64_t a2, unsigned int a3)
{
  int v3;
  uint64_t result;
  signed int v5;
  signed int v6;
  int v7;
  unsigned int v8;
  uint64_t v9;
  unsigned int v10;
  unsigned int v11;

  v3 = *(_DWORD *)(a2 + 16);
  if (a3 == -1)
  {
    if (v3)
      return a2 + 20;
    else
      return 0;
  }
  else
  {
    result = 0;
    if (a3)
    {
      if (v3)
      {
        v5 = v3 - 1;
        if ((v5 & 0x80000000) == 0)
        {
          v6 = 0;
          while (1)
          {
            v7 = v5 + v6;
            if (v5 + v6 < 0 != __OFADD__(v5, v6))
              ++v7;
            v8 = v7 >> 1;
            v9 = a2 + 12 * v8;
            v11 = *(_DWORD *)(v9 + 20);
            result = v9 + 20;
            v10 = v11;
            if (v11 == a3)
              break;
            if (v10 > a3)
              v5 = v8 - 1;
            else
              v6 = v8 + 1;
            if (v6 > v5)
              return 0;
          }
        }
      }
    }
  }
  return result;
}

uint64_t BookmarkData::findItemInSingleTOCByKeyStringBytes(BookmarkData *this, uint64_t a2, const void *a3, size_t a4)
{
  uint64_t v4;
  uint64_t v9;
  uint64_t v10;
  int v11;
  unsigned int *DataItemAtOffset;

  v4 = *(unsigned int *)(a2 + 16);
  if ((_DWORD)v4)
  {
    v9 = 12 * v4;
    v10 = a2 + 8;
    do
    {
      v11 = *(_DWORD *)(v10 + v9);
      if ((v11 & 0x80000000) == 0)
        break;
      DataItemAtOffset = BookmarkData::getDataItemAtOffset(this, v11 & 0x7FFFFFFF);
      if (DataItemAtOffset
        && DataItemAtOffset[1] == 257
        && *DataItemAtOffset == (_DWORD)a4
        && !memcmp(a3, DataItemAtOffset + 2, a4))
      {
        return a2 + v9 + 8;
      }
      v9 -= 12;
    }
    while (v9);
  }
  return 0;
}

unsigned int *BookmarkData::getMisalignedItemDataPtr(BookmarkData *this, unsigned int a2, unsigned int a3, int a4, unsigned int *a5)
{
  unsigned int *result;
  unsigned int v9;

  result = (unsigned int *)BookmarkData::findItemInTOC(this, a2, a4);
  if (result)
  {
    result = BookmarkData::getDataItemAtOffset(this, result[1]);
    if (result)
    {
      v9 = *result;
      result += 2;
      *a5 = v9;
      if (v9 < a3)
        return 0;
    }
  }
  return result;
}

void BookmarkMutableData::BookmarkMutableData(BookmarkMutableData *this, const __CFAllocator *a2, int a3)
{
  _DWORD *v4;

  *(_QWORD *)this = a2;
  *((_DWORD *)this + 2) = a3;
  *((_DWORD *)this + 3) = currentBookmarkVersion();
  *((_QWORD *)this + 2) = 0;
  *((_DWORD *)this + 8) = 0;
  *((_QWORD *)this + 5) = (char *)this + 40;
  *((_QWORD *)this + 6) = (char *)this + 40;
  *((_QWORD *)this + 7) = 0;
  *((_QWORD *)this + 3) = 0x20000000004;
  v4 = malloc_type_malloc(0x200uLL, 0x9C87C9CuLL);
  *((_QWORD *)this + 2) = v4;
  *v4 = 0;
}

void BookmarkMutableData::BookmarkMutableData(BookmarkMutableData *this, const __CFAllocator *a2, const __CFData *a3)
{
  _DWORD *v6;
  _DWORD *v7;
  uint64_t FirstTOC;
  uint64_t v9;
  uint64_t v10;
  int *v11;
  int v12;
  const __CFString *v13;
  unsigned int *DataItemAtOffset;
  const __CFString *v15;
  int v16;
  uint64_t TOCAtOffset;
  BOOL v18;
  CFAllocatorRef v19[2];
  _DWORD *v20;
  _QWORD **v21;
  _QWORD *v22[2];

  *((_QWORD *)this + 1) = 0;
  *((_QWORD *)this + 2) = 0;
  *(_QWORD *)this = a2;
  *((_DWORD *)this + 8) = 0;
  *((_QWORD *)this + 5) = (char *)this + 40;
  *((_QWORD *)this + 6) = (char *)this + 40;
  *((_QWORD *)this + 7) = 0;
  *((_QWORD *)this + 3) = 0x20000000004;
  v6 = malloc_type_malloc(0x200uLL, 0xFD736F9DuLL);
  *((_QWORD *)this + 2) = v6;
  *v6 = 0;
  BookmarkData::BookmarkData((BookmarkData *)v19, a2, a3);
  v7 = v20;
  if (v20)
  {
    *((_DWORD *)this + 2) = *v20;
    *((_DWORD *)this + 3) = v7[2];
    FirstTOC = BookmarkData::getFirstTOC((BookmarkData *)v19, 1);
    if (FirstTOC)
    {
      v9 = FirstTOC;
      do
      {
        BookmarkMutableData::createTOC(this, *(_DWORD *)(v9 + 8));
        v10 = *(unsigned int *)(v9 + 16);
        if ((_DWORD)v10)
        {
          v11 = (int *)(v9 + 28);
          do
          {
            v12 = *(v11 - 2);
            if (v12 < 0)
            {
              DataItemAtOffset = BookmarkData::getDataItemAtOffset((BookmarkData *)v19, v12 & 0x7FFFFFFF);
              v22[0] = 0;
              v22[1] = 0;
              v21 = v22;
              v13 = (const __CFString *)BookmarkData::copyItem(v19, DataItemAtOffset, (uint64_t)&v21, 0);
              std::__tree<std::__value_type<std::pair<unsigned int,unsigned int>,void const*>,std::__map_value_compare<std::pair<unsigned int,unsigned int>,std::__value_type<std::pair<unsigned int,unsigned int>,void const*>,std::less<std::pair<unsigned int,unsigned int>>,true>,std::allocator<std::__value_type<std::pair<unsigned int,unsigned int>,void const*>>>::destroy((uint64_t)&v21, v22[0]);
              v15 = (const __CFString *)BookmarkData::copyDataItemAtOffset((BookmarkData *)v19, *(v11 - 1), 0);
              BookmarkMutableData::encodeItem((void **)this, v13, v15, *v11);
              if (v15)
                CFRelease(v15);
            }
            else
            {
              v13 = (const __CFString *)BookmarkData::copyDataItemAtOffset((BookmarkData *)v19, *(v11 - 1), 0);
              BookmarkMutableData::encodeItem((uint64_t **)this, *(v11 - 2), v13, *v11);
            }
            if (v13)
              CFRelease(v13);
            v11 += 3;
            --v10;
          }
          while (v10);
        }
        v16 = *(_DWORD *)(v9 + 8);
        if (v16 != 1)
          BookmarkMutableData::finalizeTOC(this, v16);
        TOCAtOffset = BookmarkData::getTOCAtOffset((BookmarkData *)v19, *(_DWORD *)(v9 + 12));
        if (TOCAtOffset)
          v18 = TOCAtOffset == v9;
        else
          v18 = 1;
        v9 = TOCAtOffset;
      }
      while (!v18);
    }
  }
  BookmarkData::~BookmarkData((BookmarkData *)v19);
}

uint64_t BookmarkMutableData::createTOC(BookmarkMutableData *this, int a2)
{
  char *v4;
  char *v5;
  char *v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  _QWORD *v10;
  uint64_t v11;
  uint64_t *v12;
  _QWORD *v13;
  uint64_t v14;
  _DWORD *v15;
  uint64_t *v16;
  _QWORD *v17;
  uint64_t v18;

  v4 = (char *)this + 40;
  v5 = (char *)*((_QWORD *)this + 6);
  if (v5 == v4)
    goto LABEL_18;
  v6 = v5;
  do
  {
    v7 = *((_QWORD *)v6 + 2);
    if (a2 && *(_DWORD *)(v7 + 8) != a2)
      v7 = 0;
    if (v7)
      break;
    v6 = (char *)*((_QWORD *)v6 + 1);
  }
  while (v6 != v4);
  if (!v7)
  {
LABEL_18:
    v15 = malloc_type_malloc(0x14uLL, 0x3BC47EBCuLL);
    *(_QWORD *)v15 = 0xFFFFFFFE00000014;
    v15[3] = 0;
    v15[4] = 0;
    v15[2] = a2;
    v16 = (uint64_t *)*((_QWORD *)this + 6);
    v17 = operator new(0x18uLL);
    v17[2] = v15;
    v18 = *v16;
    *(_QWORD *)(v18 + 8) = v17;
    *v17 = v18;
    *v16 = (uint64_t)v17;
    v17[1] = v16;
    v10 = (_QWORD *)((char *)this + 56);
LABEL_19:
    ++*v10;
    return 1;
  }
  v8 = v5;
  while (*((_QWORD *)v8 + 2) != v7)
  {
    v8 = (char *)*((_QWORD *)v8 + 1);
    if (v8 == v4)
    {
      v8 = v4;
      break;
    }
  }
  if (v8 != v5)
  {
    while (*((_QWORD *)v5 + 2) != v7)
    {
      v5 = (char *)*((_QWORD *)v5 + 1);
      if (v5 == v4)
      {
        v5 = v4;
        break;
      }
    }
    v9 = *(_QWORD *)v5;
    *(_QWORD *)(v9 + 8) = *((_QWORD *)v5 + 1);
    **((_QWORD **)v5 + 1) = v9;
    v11 = *((_QWORD *)this + 7);
    v10 = (_QWORD *)((char *)this + 56);
    *v10 = v11 - 1;
    operator delete(v5);
    v12 = (uint64_t *)*(v10 - 1);
    v13 = operator new(0x18uLL);
    v13[2] = v7;
    v14 = *v12;
    *(_QWORD *)(v14 + 8) = v13;
    *v13 = v14;
    *v12 = (uint64_t)v13;
    v13[1] = v12;
    goto LABEL_19;
  }
  return 1;
}

uint64_t BookmarkMutableData::encodeItem(void **this, const __CFString *cf2, const __CFString *a3, int a4)
{
  unsigned int v8;
  unsigned int v9;
  int v10;

  if (!a3)
    return 0;
  v8 = CFBookmarkPropertyKeyToKnownType(cf2);
  if (!v8)
  {
    v9 = BookmarkMutableData::encodeItem(this, cf2);
    if (v9)
      v8 = v9 | 0x80000000;
    else
      v8 = 0;
  }
  if (!BookmarkMutableData::itemInTOC((BookmarkMutableData *)this, v8, 0)
    && (v10 = BookmarkMutableData::encodeItem(this, a3), v8)
    && v10)
  {
    return BookmarkMutableData::appendTOCItem((uint64_t **)this, v8, v10, a4);
  }
  else
  {
    return 0;
  }
}

uint64_t BookmarkMutableData::encodeItem(uint64_t **this, unsigned int a2, const __CFString *a3, int a4)
{
  int v7;

  if (a3 && (v7 = BookmarkMutableData::encodeItem((void **)this, a3)) != 0)
    return BookmarkMutableData::appendTOCItem(this, a2, v7, a4);
  else
    return 0;
}

BOOL BookmarkMutableData::finalizeTOC(BookmarkMutableData *this, int a2)
{
  _QWORD *v2;
  _DWORD *v3;

  v2 = (_QWORD *)*((_QWORD *)this + 6);
  if (v2 == (_QWORD *)((char *)this + 40))
    return 0;
  do
  {
    v3 = (_DWORD *)v2[2];
    if (a2 && v3[2] != a2)
      v3 = 0;
    if (v3)
      break;
    v2 = (_QWORD *)v2[1];
  }
  while (v2 != (_QWORD *)((char *)this + 40));
  return v3 && BookmarkMutableData::finalizeTOC(this, v3);
}

void BookmarkMutableData::~BookmarkMutableData(BookmarkMutableData *this)
{
  uint64_t *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;

  while (*((_QWORD *)this + 7))
  {
    free(*(void **)(*((_QWORD *)this + 6) + 16));
    v2 = (uint64_t *)*((_QWORD *)this + 6);
    v3 = *((_QWORD *)this + 7);
    v4 = *v2;
    *(_QWORD *)(v4 + 8) = v2[1];
    *(_QWORD *)v2[1] = v4;
    *((_QWORD *)this + 7) = v3 - 1;
    operator delete(v2);
  }
  v5 = (void *)*((_QWORD *)this + 2);
  if (v5)
    free(v5);
  *((_QWORD *)this + 2) = 0;
  std::__list_imp<CFBookmarkTOC *>::clear((_QWORD *)this + 5);
}

unsigned int *BookmarkMutableData::getDataItemAtOffset(BookmarkMutableData *this, unsigned int a2)
{
  unint64_t v2;
  uint64_t v3;
  unsigned int *result;
  uint64_t v5;

  v2 = *((unsigned int *)this + 6);
  if ((unint64_t)a2 + 8 > v2)
    return 0;
  v3 = *((_QWORD *)this + 2);
  if (!v3)
    return 0;
  result = (unsigned int *)(v3 + a2);
  v5 = *result;
  if (v5 <= 0xFFFFFFF6 && v5 + (unint64_t)a2 + 8 > v2)
    return 0;
  return result;
}

uint64_t BookmarkMutableData::getTOCAtOffset(BookmarkMutableData *this, unsigned int a2)
{
  unint64_t v2;
  uint64_t v3;
  unsigned int v4;

  if (!a2)
    return 0;
  v2 = *((unsigned int *)this + 6);
  if ((unint64_t)a2 + 20 > v2)
    return 0;
  v3 = *((_QWORD *)this + 2) + a2;
  if (*(_DWORD *)(v3 + 4) != -2)
    return 0;
  v4 = *(_DWORD *)(v3 + 16);
  if (v4 > 0x15555552)
    return 0;
  if (a2 + 12 * (unint64_t)v4 + 20 <= v2)
    return *((_QWORD *)this + 2) + a2;
  return 0;
}

uint64_t BookmarkMutableData::findDataItem(BookmarkMutableData *this, int a2, const void *__s1, size_t __n)
{
  unint64_t v5;
  uint64_t v9;
  uint64_t v10;
  unsigned int *v11;
  uint64_t v12;

  if (a2)
  {
    v5 = *((unsigned int *)this + 6);
    if (v5 >= 5)
    {
      v9 = 4;
      do
      {
        if ((unint64_t)v9 + 8 > v5)
          break;
        v10 = *((_QWORD *)this + 2);
        if (!v10)
          break;
        v11 = (unsigned int *)(v10 + v9);
        v12 = *v11;
        if (v12 <= 0xFFFFFFF6 && v12 + (unint64_t)v9 + 8 > v5)
          break;
        if (v12 == __n && v11[1] == a2 && (!__s1 || !memcmp(__s1, v11 + 2, __n)))
          return v9;
        v9 = ((_DWORD)v9 + (_DWORD)v12 + 11) & 0xFFFFFFFC;
      }
      while (v9 < v5);
    }
  }
  return 0;
}

uint64_t BookmarkMutableData::appendDataItem(void **this, int a2, const void *a3, size_t a4)
{
  uint64_t DataItem;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  unint64_t v12;
  unint64_t v13;
  size_t v14;
  char *v15;
  char *v16;
  char *v17;

  DataItem = BookmarkMutableData::findDataItem((BookmarkMutableData *)this, a2, a3, a4);
  v9 = DataItem;
  if (a4 <= 0x7FFFFFFE && !(_DWORD)DataItem)
  {
    if ((a4 & 3) != 0)
      v10 = 4 - (a4 & 3);
    else
      v10 = 0;
    v9 = *((unsigned int *)this + 6);
    v11 = a4 + 8 + v10 + v9;
    if (v11 > 0x7FFFFFFE)
    {
      return 0;
    }
    else
    {
      v12 = *((unsigned int *)this + 7);
      if (v11 <= v12)
      {
        v15 = (char *)this[2];
      }
      else
      {
        v13 = 2 * v12;
        if (v13 >= 0x7FFFFFFF)
          v13 = 0x7FFFFFFFLL;
        if (v11 <= v13)
          v14 = v13;
        else
          v14 = v11;
        *((_DWORD *)this + 7) = v14;
        v15 = (char *)malloc_type_realloc(this[2], v14, 0xC102FDF2uLL);
        this[2] = v15;
        v9 = *((unsigned int *)this + 6);
      }
      *((_DWORD *)this + 6) = v11;
      v16 = &v15[v9];
      *(_DWORD *)v16 = a4;
      *((_DWORD *)v16 + 1) = a2;
      if (a3)
      {
        if ((v9 + 8) <= *((_DWORD *)this + 6))
          v17 = (char *)this[2] + (v9 + 8);
        else
          v17 = 0;
        memcpy(v17, a3, a4);
      }
      if ((a4 & 3) != 0)
        bzero((char *)this[2] + (a4 + 8 + v9), 4 - (a4 & 3));
    }
  }
  return v9;
}

uint64_t BookmarkMutableData::encodeCFStringAs(void **this, CFStringRef theString, int a3)
{
  CFIndex Length;
  const char *CStringPtr;
  const char *v8;
  size_t v9;
  uint64_t v11;
  uint64_t appended;
  UInt8 *v13;
  char *v14;
  int DataItem;
  CFIndex maxBufLen;
  UInt8 buffer[128];
  uint64_t v18;
  CFRange v19;
  CFRange v20;
  CFRange v21;

  v18 = *MEMORY[0x1E0C80C00];
  Length = CFStringGetLength(theString);
  CStringPtr = CFStringGetCStringPtr(theString, 0x8000100u);
  if (CStringPtr)
  {
    v8 = CStringPtr;
    v9 = strlen(CStringPtr);
    return BookmarkMutableData::appendDataItem(this, a3, v8, v9);
  }
  else if (Length)
  {
    maxBufLen = 0;
    v19.location = 0;
    v19.length = Length;
    if (CFStringGetBytes(theString, v19, 0x8000100u, 0, 0, buffer, 128, &maxBufLen) == Length)
      return BookmarkMutableData::appendDataItem(this, a3, buffer, maxBufLen);
    v20.location = 0;
    v20.length = Length;
    v11 = 0;
    if (CFStringGetBytes(theString, v20, 0x8000100u, 0, 0, 0, 0, &maxBufLen) == Length)
    {
      appended = BookmarkMutableData::appendDataItem(this, a3, 0, maxBufLen);
      v11 = appended;
      if ((_DWORD)appended)
      {
        if ((appended + 8) <= *((_DWORD *)this + 6))
          v13 = (UInt8 *)this[2] + (appended + 8);
        else
          v13 = 0;
        v21.location = 0;
        v21.length = Length;
        if (CFStringGetBytes(theString, v21, 0x8000100u, 0, 0, v13, maxBufLen, 0) == Length)
          v11 = v11;
        else
          v11 = 0;
      }
      if ((v11 + 8) <= *((_DWORD *)this + 6))
        v14 = (char *)this[2] + (v11 + 8);
      else
        v14 = 0;
      DataItem = BookmarkMutableData::findDataItem((BookmarkMutableData *)this, a3, v14, maxBufLen);
      if ((_DWORD)v11)
      {
        if (DataItem != (_DWORD)v11)
        {
          *((_DWORD *)this + 6) = v11;
          return 1;
        }
      }
    }
    return v11;
  }
  else
  {
    return BookmarkMutableData::appendDataItem(this, a3, 0, 0);
  }
}

_DWORD *BookmarkMutableData::encodeItem(void **this, const __CFString *a2)
{
  CFTypeID v4;
  CFTypeID v5;
  void **v7;
  int v8;
  _DWORD *v9;
  void **v10;
  int v11;
  const UInt8 *BytePtr;
  size_t Length;
  size_t v14;
  CFIndex v15;
  CFIndex v16;
  uint64_t v17;
  const void *ValueAtIndex;
  int v19;
  CFIndex Count;
  const void **v21;
  _DWORD *v22;
  _DWORD *v23;
  uint64_t v24;
  const void **v25;
  int v26;
  const void *Value;
  int v28;
  uint64_t appended;
  const __CFAllocator *v30;
  const __CFURL *v31;
  CFURLRef v32;
  CFStringRef v33;
  uint64_t v34;
  uint64_t v35;
  const __CFString *v36;
  CFUUIDBytes valuePtr;
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  if (!a2)
    return 0;
  v4 = CFGetTypeID(a2);
  if ((const __CFString *)*MEMORY[0x1E0C9AE50] == a2)
  {
    v7 = this;
    v8 = 1281;
    return (_DWORD *)BookmarkMutableData::appendDataItem(v7, v8, 0, 0);
  }
  if ((const __CFString *)*MEMORY[0x1E0C9AE40] == a2)
  {
    v7 = this;
    v8 = 1280;
    return (_DWORD *)BookmarkMutableData::appendDataItem(v7, v8, 0, 0);
  }
  v5 = v4;
  if (v4 == CFStringGetTypeID())
    return (_DWORD *)BookmarkMutableData::encodeCFStringAs(this, a2, 257);
  if (v5 == CFNumberGetTypeID())
  {
    v9 = 0;
    switch(CFNumberGetType((CFNumberRef)a2))
    {
      case kCFNumberSInt8Type:
        valuePtr.byte0 = 0;
        if (!CFNumberGetValue((CFNumberRef)a2, kCFNumberSInt8Type, &valuePtr))
          return 0;
        v10 = this;
        v11 = 769;
        goto LABEL_49;
      case kCFNumberSInt16Type:
        *(_WORD *)&valuePtr.byte0 = 0;
        if (!CFNumberGetValue((CFNumberRef)a2, kCFNumberSInt16Type, &valuePtr))
          return 0;
        v10 = this;
        v11 = 770;
        goto LABEL_52;
      case kCFNumberSInt32Type:
        *(_DWORD *)&valuePtr.byte0 = 0;
        if (!CFNumberGetValue((CFNumberRef)a2, kCFNumberSInt32Type, &valuePtr))
          return 0;
        v10 = this;
        v11 = 771;
        goto LABEL_55;
      case kCFNumberSInt64Type:
        *(_QWORD *)&valuePtr.byte0 = 0;
        if (!CFNumberGetValue((CFNumberRef)a2, kCFNumberSInt64Type, &valuePtr))
          return 0;
        v10 = this;
        v11 = 772;
        goto LABEL_17;
      case kCFNumberFloat32Type:
        *(_DWORD *)&valuePtr.byte0 = 0;
        if (!CFNumberGetValue((CFNumberRef)a2, kCFNumberFloat32Type, &valuePtr))
          return 0;
        v10 = this;
        v11 = 773;
        goto LABEL_55;
      case kCFNumberFloat64Type:
        *(_QWORD *)&valuePtr.byte0 = 0;
        if (!CFNumberGetValue((CFNumberRef)a2, kCFNumberFloat64Type, &valuePtr))
          return 0;
        v10 = this;
        v11 = 774;
        goto LABEL_17;
      case kCFNumberCharType:
        valuePtr.byte0 = 0;
        if (!CFNumberGetValue((CFNumberRef)a2, kCFNumberCharType, &valuePtr))
          return 0;
        v10 = this;
        v11 = 775;
LABEL_49:
        v14 = 1;
        return (_DWORD *)BookmarkMutableData::appendDataItem(v10, v11, &valuePtr, v14);
      case kCFNumberShortType:
        *(_WORD *)&valuePtr.byte0 = 0;
        if (!CFNumberGetValue((CFNumberRef)a2, kCFNumberShortType, &valuePtr))
          return 0;
        v10 = this;
        v11 = 776;
LABEL_52:
        v14 = 2;
        return (_DWORD *)BookmarkMutableData::appendDataItem(v10, v11, &valuePtr, v14);
      case kCFNumberIntType:
        *(_DWORD *)&valuePtr.byte0 = 0;
        if (!CFNumberGetValue((CFNumberRef)a2, kCFNumberIntType, &valuePtr))
          return 0;
        v10 = this;
        v11 = 777;
LABEL_55:
        v14 = 4;
        return (_DWORD *)BookmarkMutableData::appendDataItem(v10, v11, &valuePtr, v14);
      case kCFNumberLongType:
        *(_QWORD *)&valuePtr.byte0 = 0;
        if (!CFNumberGetValue((CFNumberRef)a2, kCFNumberLongType, &valuePtr))
          return 0;
        v10 = this;
        v11 = 778;
        goto LABEL_17;
      case kCFNumberLongLongType:
        *(_QWORD *)&valuePtr.byte0 = 0;
        if (!CFNumberGetValue((CFNumberRef)a2, kCFNumberLongLongType, &valuePtr))
          return 0;
        v10 = this;
        v11 = 779;
        goto LABEL_17;
      case kCFNumberCFIndexType:
        *(_QWORD *)&valuePtr.byte0 = 0;
        if (!CFNumberGetValue((CFNumberRef)a2, kCFNumberCFIndexType, &valuePtr))
          return 0;
        v10 = this;
        v11 = 782;
        goto LABEL_17;
      case kCFNumberNSIntegerType:
        *(_QWORD *)&valuePtr.byte0 = 0;
        if (!CFNumberGetValue((CFNumberRef)a2, kCFNumberNSIntegerType, &valuePtr))
          return 0;
        v10 = this;
        v11 = 783;
        goto LABEL_17;
      case kCFNumberCGFloatType:
        *(_QWORD *)&valuePtr.byte0 = 0;
        if (!CFNumberGetValue((CFNumberRef)a2, kCFNumberCGFloatType, &valuePtr))
          return 0;
        v10 = this;
        v11 = 784;
        goto LABEL_17;
      default:
        return v9;
    }
  }
  if (v5 == CFDataGetTypeID())
  {
    BytePtr = CFDataGetBytePtr((CFDataRef)a2);
    Length = CFDataGetLength((CFDataRef)a2);
    return (_DWORD *)BookmarkMutableData::appendDataItem(this, 513, BytePtr, Length);
  }
  if (v5 == CFDateGetTypeID())
  {
    *(_QWORD *)&valuePtr.byte0 = bswap64(COERCE_UNSIGNED_INT64(MEMORY[0x186DA2DD8](a2)));
    v10 = this;
    v11 = 1024;
LABEL_17:
    v14 = 8;
    return (_DWORD *)BookmarkMutableData::appendDataItem(v10, v11, &valuePtr, v14);
  }
  if (v5 != CFArrayGetTypeID())
  {
    if (v5 == CFDictionaryGetTypeID())
    {
      Count = CFDictionaryGetCount((CFDictionaryRef)a2);
      v21 = (const void **)malloc_type_malloc(8 * Count, 0xC0040B8AA526DuLL);
      v22 = malloc_type_malloc(8 * Count, 0x738D9100uLL);
      v23 = v22;
      if (v21 && v22)
      {
        CFDictionaryGetKeysAndValues((CFDictionaryRef)a2, v21, 0);
        if (Count < 1)
        {
          v24 = 0;
        }
        else
        {
          v24 = 0;
          v25 = v21;
          do
          {
            v26 = BookmarkMutableData::encodeItem((BookmarkMutableData *)this, *v25);
            v23[v24] = v26;
            if (v26)
            {
              Value = CFDictionaryGetValue((CFDictionaryRef)a2, *v25);
              v28 = BookmarkMutableData::encodeItem((BookmarkMutableData *)this, Value);
              if (v28)
              {
                v23[v24 + 1] = v28;
                v24 += 2;
              }
            }
            ++v25;
            --Count;
          }
          while (Count);
        }
        appended = BookmarkMutableData::appendDataItem(this, 1793, v23, 4 * v24);
      }
      else
      {
        appended = 0;
        v9 = 0;
        if (!v21)
        {
LABEL_85:
          if (v23)
            free(v23);
          return v9;
        }
      }
      free(v21);
      v9 = (_DWORD *)appended;
      goto LABEL_85;
    }
    if (v5 == CFUUIDGetTypeID())
    {
      valuePtr = CFUUIDGetUUIDBytes((CFUUIDRef)a2);
      v10 = this;
      v11 = 2049;
      v14 = 16;
      return (_DWORD *)BookmarkMutableData::appendDataItem(v10, v11, &valuePtr, v14);
    }
    if (v5 == CFURLGetTypeID())
    {
      if (!CFURLIsFileReferenceURL((CFURLRef)a2)
        || (v30 = CFGetAllocator(a2), (v31 = CFURLCreateFilePathURL(v30, (CFURLRef)a2, 0)) == 0))
      {
        CFRetain(a2);
        v31 = (const __CFURL *)a2;
      }
      v32 = CFURLGetBaseURL(v31);
      if (v32)
      {
        *(_DWORD *)&valuePtr.byte0 = BookmarkMutableData::encodeItem((BookmarkMutableData *)this, v32);
        v33 = CFURLGetString(v31);
        *(_DWORD *)&valuePtr.byte4 = BookmarkMutableData::encodeItem((BookmarkMutableData *)this, v33);
        v34 = BookmarkMutableData::appendDataItem(this, 2306, &valuePtr, 8uLL);
      }
      else
      {
        v36 = CFURLGetString(v31);
        v34 = BookmarkMutableData::encodeCFStringAs(this, v36, 2305);
      }
      v9 = (_DWORD *)v34;
      CFRelease(v31);
      return v9;
    }
    if (v5 == CFNullGetTypeID())
    {
      v7 = this;
      v8 = 2561;
      return (_DWORD *)BookmarkMutableData::appendDataItem(v7, v8, 0, 0);
    }
    return 0;
  }
  v15 = CFArrayGetCount((CFArrayRef)a2);
  v9 = malloc_type_malloc(4 * v15, 0x100004052888210uLL);
  if (!v9)
    return v9;
  if (v15 < 1)
  {
    v17 = 0;
  }
  else
  {
    v16 = 0;
    v17 = 0;
    do
    {
      ValueAtIndex = CFArrayGetValueAtIndex((CFArrayRef)a2, v16);
      v19 = BookmarkMutableData::encodeItem((BookmarkMutableData *)this, ValueAtIndex);
      if (v19)
        v9[v17++] = v19;
      ++v16;
    }
    while (v15 != v16);
  }
  v35 = BookmarkMutableData::appendDataItem(this, 1537, v9, 4 * v17);
  free(v9);
  return (_DWORD *)v35;
}

uint64_t BookmarkMutableData::appendTOCItem(uint64_t **this, unsigned int a2, int a3, int a4)
{
  uint64_t *v8;
  _DWORD *v9;
  int v10;
  char v11;
  _DWORD *v12;
  uint64_t v13;
  uint64_t *v14;
  size_t v15;
  uint64_t v16;
  _DWORD *v17;
  uint64_t *v18;
  _QWORD *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  _DWORD *v23;
  _DWORD *v24;
  unsigned int v25;
  uint64_t v26;
  _DWORD *v27;

  if (!this[7])
    BookmarkMutableData::createTOC((BookmarkMutableData *)this, 1);
  v8 = this[6];
  v9 = (_DWORD *)v8[2];
  v10 = v9[4];
  if (v10)
  {
    v11 = 0;
    v12 = v9 + 6;
    v13 = v9[4];
    do
    {
      if (a2 == *(v12 - 1))
      {
        v11 |= *v12 == a3;
        if (*v12 == a3)
          a2 = 0;
      }
      v12 += 3;
      --v13;
    }
    while (v13);
    if (!a2)
      return v11 & 1;
  }
  else
  {
    v11 = 0;
    if (!a2)
      return v11 & 1;
  }
  v14 = (uint64_t *)(this + 5);
  v15 = 12 * (v10 + 1) + 20;
  while (v8 != v14)
  {
    if ((_DWORD *)v8[2] == v9)
    {
      v14 = v8;
      break;
    }
    v8 = (uint64_t *)v8[1];
  }
  v16 = *v14;
  *(_QWORD *)(v16 + 8) = v14[1];
  *(_QWORD *)v14[1] = v16;
  this[7] = (uint64_t *)((char *)this[7] - 1);
  operator delete(v14);
  v17 = malloc_type_realloc(v9, v15, 0x8DD0CEAAuLL);
  v18 = this[6];
  v19 = operator new(0x18uLL);
  v19[2] = v17;
  v20 = *v18;
  *(_QWORD *)(v20 + 8) = v19;
  *v19 = v20;
  *v18 = (uint64_t)v19;
  v19[1] = v18;
  this[7] = (uint64_t *)((char *)this[7] + 1);
  *v17 = v15;
  v17[4] = v10 + 1;
  if (v10)
  {
    v21 = (uint64_t)&v17[3 * v10 + 5];
    while (1)
    {
      v22 = (v10 - 1);
      v23 = &v17[3 * v22];
      v25 = v23[5];
      v24 = v23 + 5;
      if (a2 >= v25)
        break;
      v26 = *(_QWORD *)v24;
      *(_DWORD *)(v21 + 8) = v24[2];
      *(_QWORD *)v21 = v26;
      v21 -= 12;
      --v10;
      if (!v22)
        goto LABEL_21;
    }
  }
  else
  {
LABEL_21:
    v10 = 0;
  }
  v27 = &v17[3 * v10];
  v27[5] = a2;
  v27[6] = a3;
  v27[7] = a4;
  v11 = 1;
  return v11 & 1;
}

BOOL BookmarkMutableData::itemInTOC(BookmarkMutableData *this, int a2, int a3)
{
  int v3;
  _QWORD *v6;
  BOOL v7;
  uint64_t v8;
  unint64_t v9;
  int *v10;
  unint64_t v11;
  int v12;
  int v13;
  _BOOL8 v14;
  unsigned int v15;
  _DWORD *TOCAtOffset;
  unint64_t v17;
  int *v18;
  unint64_t v19;
  int v20;
  int v21;
  BOOL v22;

  v3 = a3;
  if (!a3)
  {
    if (*((_QWORD *)this + 7))
      v3 = *(_DWORD *)(*(_QWORD *)(*((_QWORD *)this + 6) + 16) + 8);
    else
      v3 = 0;
  }
  v6 = (_QWORD *)*((_QWORD *)this + 6);
  if (v6 == (_QWORD *)((char *)this + 40))
    goto LABEL_15;
  v7 = 0;
  do
  {
    v8 = v6[2];
    v9 = *(unsigned int *)(v8 + 16);
    if ((_DWORD)v9 && !v7)
    {
      v10 = (int *)(v8 + 20);
      v11 = 1;
      do
      {
        v13 = *v10;
        v10 += 3;
        v12 = v13;
        v7 = v13 == a2;
        if (v11 >= v9)
          break;
        ++v11;
      }
      while (v12 != a2);
    }
    v6 = (_QWORD *)v6[1];
  }
  while (v6 != (_QWORD *)((char *)this + 40));
  if (v7)
    return 1;
LABEL_15:
  v15 = *((_DWORD *)this + 8);
  if (!v15)
    return 0;
  TOCAtOffset = (_DWORD *)BookmarkMutableData::getTOCAtOffset(this, v15);
  if (!TOCAtOffset)
    return 0;
  do
  {
    if (TOCAtOffset[2] == v3 && (v17 = TOCAtOffset[4], (_DWORD)v17))
    {
      v18 = TOCAtOffset + 5;
      v19 = 1;
      do
      {
        v21 = *v18;
        v18 += 3;
        v20 = v21;
        v14 = v21 == a2;
        if (v19 >= v17)
          break;
        ++v19;
      }
      while (v20 != a2);
    }
    else
    {
      v14 = 0;
    }
    TOCAtOffset = (_DWORD *)BookmarkMutableData::getTOCAtOffset(this, TOCAtOffset[3]);
    if (TOCAtOffset)
      v22 = !v14;
    else
      v22 = 0;
  }
  while (v22);
  return v14;
}

uint64_t BookmarkMutableData::encodeValue(void **this, unsigned int a2, int a3, int a4)
{
  uint64_t result;
  int v8;

  v8 = a3;
  result = BookmarkMutableData::appendDataItem(this, 771, &v8, 4uLL);
  if ((_DWORD)result)
    return BookmarkMutableData::appendTOCItem((uint64_t **)this, a2, result, a4);
  return result;
}

uint64_t BookmarkMutableData::encodeRawData(uint64_t **this, unsigned int a2, UInt8 *bytes, CFIndex length)
{
  const __CFString *v6;
  const __CFString *v7;
  uint64_t v8;

  v6 = (const __CFString *)CFDataCreateWithBytesNoCopy((CFAllocatorRef)*MEMORY[0x1E0C9AE00], bytes, length, (CFAllocatorRef)*MEMORY[0x1E0C9AE20]);
  if (!v6)
    return 0;
  v7 = v6;
  v8 = BookmarkMutableData::encodeItem(this, a2, v6, 0);
  CFRelease(v7);
  return v8;
}

uint64_t BookmarkMutableData::tocExists(BookmarkMutableData *this, int a2)
{
  _QWORD *v2;
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
  uint64_t i;
  uint64_t v8;

  v2 = (_QWORD *)*((_QWORD *)this + 6);
  if (v2 == (_QWORD *)((char *)this + 40))
    goto LABEL_9;
  do
  {
    v3 = v2[2];
    if (a2 && *(_DWORD *)(v3 + 8) != a2)
      v3 = 0;
    if (v3)
      break;
    v2 = (_QWORD *)v2[1];
  }
  while (v2 != (_QWORD *)((char *)this + 40));
  if (!v3)
  {
LABEL_9:
    v4 = *((unsigned int *)this + 8);
    if ((_DWORD)v4)
    {
      v5 = *((unsigned int *)this + 6);
      if (v4 + 20 <= v5)
      {
        for (i = *((_QWORD *)this + 2) + v4; ; i = *((_QWORD *)this + 2) + v8)
        {
          LOBYTE(v4) = *(_DWORD *)(i + 8) == a2;
          if (*(_DWORD *)(i + 8) == a2)
            break;
          v8 = *(unsigned int *)(i + 12);
          if (!(_DWORD)v8)
            goto LABEL_11;
          if (v8 + 20 > v5)
            break;
        }
      }
      else
      {
LABEL_11:
        LOBYTE(v4) = 0;
      }
    }
  }
  else
  {
    LOBYTE(v4) = 1;
  }
  return v4 & 1;
}

uint64_t BookmarkMutableData::findOpenTOC(BookmarkMutableData *this, int a2)
{
  char *v2;
  char *v3;
  uint64_t result;

  v2 = (char *)this + 40;
  v3 = (char *)*((_QWORD *)this + 6);
  if (v3 == (char *)this + 40)
    return 0;
  do
  {
    result = *((_QWORD *)v3 + 2);
    if (a2 && *(_DWORD *)(result + 8) != a2)
      result = 0;
    if (result)
      break;
    v3 = (char *)*((_QWORD *)v3 + 1);
  }
  while (v3 != v2);
  return result;
}

uint64_t BookmarkMutableData::findUnusedDepth(BookmarkMutableData *this, uint64_t a2, unsigned int a3)
{
  uint64_t v4;

  if (a2 >= a3)
    return 0;
  v4 = a2;
  while (BookmarkMutableData::tocExists(this, v4))
  {
    v4 = (v4 + 1);
    if (a3 == (_DWORD)v4)
      return 0;
  }
  return v4;
}

BOOL BookmarkMutableData::finalizeTOC(BookmarkMutableData *this, _DWORD *a2)
{
  int v4;
  uint64_t v5;
  void **v6;
  void **i;
  _QWORD *v8;

  if (a2)
  {
    v4 = a2[4];
    if (v4)
    {
      v5 = (12 * v4 + 20);
      *a2 = v5;
      a2[3] = *((_DWORD *)this + 8);
      *((_DWORD *)this + 8) = BookmarkMutableData::appendDataItem((void **)this, -2, a2 + 2, v5 - 8);
    }
    v6 = (void **)((char *)this + 40);
    for (i = (void **)*((_QWORD *)this + 6); i != v6; i = (void **)i[1])
    {
      if (i[2] == a2)
      {
        if (i != v6)
        {
          v8 = *i;
          v8[1] = i[1];
          *(_QWORD *)i[1] = v8;
          --*((_QWORD *)this + 7);
          operator delete(i);
        }
        break;
      }
    }
    free(a2);
  }
  return a2 != 0;
}

uint64_t BookmarkMutableData::setRevocable(uint64_t this, int a2)
{
  *(_DWORD *)(this + 12) = *(_DWORD *)(this + 12) & 0xFFFFFFFE | a2;
  return this;
}

CFDataRef BookmarkMutableData::Finalize(CFAllocatorRef *this, const void *a2, uint64_t a3)
{
  __CFData *Mutable;
  int v7;
  char *v8;
  CFAllocatorRef v9;
  _DWORD *v10;
  _DWORD *v11;
  UInt8 *v12;
  UInt8 *MutableBytePtr;
  size_t Length;
  CFDataRef Copy;
  UInt8 bytes[4];
  int v18;
  int v19;
  int v20;
  __int128 v21;
  __int128 v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  Mutable = CFDataCreateMutable(*this, 0);
  v22 = 0u;
  v21 = 0u;
  v7 = *((_DWORD *)this + 3);
  *(_DWORD *)bytes = *((_DWORD *)this + 2);
  v18 = 0;
  v19 = v7;
  v20 = 48;
  CFDataAppendBytes(Mutable, bytes, 48);
  if (this[7])
  {
    v8 = (char *)(this + 5);
    while (1)
    {
      v9 = this[6];
      if (v9 != (CFAllocatorRef)v8)
        break;
      v10 = 0;
LABEL_13:
      BookmarkMutableData::finalizeTOC((BookmarkMutableData *)this, v10);
      if (!this[7])
        goto LABEL_14;
    }
    v10 = 0;
    while (1)
    {
      if (v10)
      {
        v11 = (_DWORD *)*((_QWORD *)v9 + 2);
        if (v10[2] <= v11[2])
          goto LABEL_10;
      }
      else
      {
        v11 = (_DWORD *)*((_QWORD *)v9 + 2);
      }
      v10 = v11;
LABEL_10:
      v9 = (CFAllocatorRef)*((_QWORD *)v9 + 1);
      if (v9 == (CFAllocatorRef)v8)
        goto LABEL_13;
    }
  }
LABEL_14:
  v12 = (UInt8 *)this[2];
  *(_DWORD *)v12 = *((_DWORD *)this + 8);
  CFDataAppendBytes(Mutable, v12, *((unsigned int *)this + 6));
  if (CFDataGetLength(Mutable) > 2147483646)
  {
    if (Mutable)
      CFRelease(Mutable);
    return 0;
  }
  MutableBytePtr = CFDataGetMutableBytePtr(Mutable);
  *((_DWORD *)MutableBytePtr + 1) = CFDataGetLength(Mutable);
  if (a2)
  {
    if (a3 != 32)
      BookmarkMutableData::Finalize();
    Length = CFDataGetLength(Mutable);
    CCHmac(2u, a2, 0x20uLL, MutableBytePtr, Length, MutableBytePtr + 16);
  }
  if (!Mutable)
    return 0;
  Copy = CFDataCreateCopy(*this, Mutable);
  CFRelease(Mutable);
  return Copy;
}

_QWORD *std::__list_imp<CFBookmarkTOC *>::clear(_QWORD *result)
{
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;
  _QWORD *v4;

  if (result[2])
  {
    v1 = result;
    result = (_QWORD *)result[1];
    v2 = *v1;
    v3 = *result;
    *(_QWORD *)(v3 + 8) = *(_QWORD *)(*v1 + 8);
    **(_QWORD **)(v2 + 8) = v3;
    v1[2] = 0;
    if (result != v1)
    {
      do
      {
        v4 = (_QWORD *)result[1];
        operator delete(result);
        result = v4;
      }
      while (v4 != v1);
    }
  }
  return result;
}

void std::__tree<std::__value_type<std::pair<unsigned int,unsigned int>,void const*>,std::__map_value_compare<std::pair<unsigned int,unsigned int>,std::__value_type<std::pair<unsigned int,unsigned int>,void const*>,std::less<std::pair<unsigned int,unsigned int>>,true>,std::allocator<std::__value_type<std::pair<unsigned int,unsigned int>,void const*>>>::destroy(uint64_t a1, _QWORD *a2)
{
  if (a2)
  {
    std::__tree<std::__value_type<std::pair<unsigned int,unsigned int>,void const*>,std::__map_value_compare<std::pair<unsigned int,unsigned int>,std::__value_type<std::pair<unsigned int,unsigned int>,void const*>,std::less<std::pair<unsigned int,unsigned int>>,true>,std::allocator<std::__value_type<std::pair<unsigned int,unsigned int>,void const*>>>::destroy(a1, *a2);
    std::__tree<std::__value_type<std::pair<unsigned int,unsigned int>,void const*>,std::__map_value_compare<std::pair<unsigned int,unsigned int>,std::__value_type<std::pair<unsigned int,unsigned int>,void const*>,std::less<std::pair<unsigned int,unsigned int>>,true>,std::allocator<std::__value_type<std::pair<unsigned int,unsigned int>,void const*>>>::destroy(a1, a2[1]);
    operator delete(a2);
  }
}

uint64_t *std::__tree<CFBookmarkDataItem const*>::__emplace_unique_key_args<CFBookmarkDataItem const*,CFBookmarkDataItem const* const&>(uint64_t **a1, unint64_t *a2, uint64_t *a3)
{
  uint64_t *v5;
  uint64_t **v6;
  unint64_t v7;
  uint64_t **v8;
  unint64_t v9;
  uint64_t *v10;

  v6 = a1 + 1;
  v5 = a1[1];
  if (v5)
  {
    v7 = *a2;
    while (1)
    {
      while (1)
      {
        v8 = (uint64_t **)v5;
        v9 = v5[4];
        if (v7 >= v9)
          break;
        v5 = *v8;
        v6 = v8;
        if (!*v8)
          goto LABEL_10;
      }
      if (v9 >= v7)
        break;
      v5 = v8[1];
      if (!v5)
      {
        v6 = v8 + 1;
        goto LABEL_10;
      }
    }
  }
  else
  {
    v8 = a1 + 1;
LABEL_10:
    v10 = (uint64_t *)operator new(0x28uLL);
    v10[4] = *a3;
    std::__tree<CFBookmarkDataItem const*>::__insert_node_at(a1, (uint64_t)v8, v6, v10);
    return v10;
  }
  return (uint64_t *)v8;
}

uint64_t *std::__tree<CFBookmarkDataItem const*>::__insert_node_at(uint64_t **a1, uint64_t a2, uint64_t **a3, uint64_t *a4)
{
  uint64_t *v5;
  uint64_t *result;

  *a4 = 0;
  a4[1] = 0;
  a4[2] = a2;
  *a3 = a4;
  v5 = (uint64_t *)**a1;
  if (v5)
  {
    *a1 = v5;
    a4 = *a3;
  }
  result = std::__tree_balance_after_insert[abi:nn180100]<std::__tree_node_base<void *> *>(a1[1], a4);
  a1[2] = (uint64_t *)((char *)a1[2] + 1);
  return result;
}

void std::__throw_bad_array_new_length[abi:nn180100]()
{
  abort();
}

uint64_t *std::__tree_balance_after_insert[abi:nn180100]<std::__tree_node_base<void *> *>(uint64_t *result, uint64_t *a2)
{
  uint64_t *v2;
  uint64_t *v3;
  uint64_t *v4;
  _BYTE *v5;
  int v6;
  uint64_t v7;
  int v8;
  uint64_t **v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;

  *((_BYTE *)a2 + 24) = a2 == result;
  if (a2 != result)
  {
    do
    {
      v2 = (uint64_t *)a2[2];
      if (*((_BYTE *)v2 + 24))
        return result;
      v3 = (uint64_t *)v2[2];
      v4 = (uint64_t *)*v3;
      if ((uint64_t *)*v3 == v2)
      {
        v7 = v3[1];
        if (!v7 || (v8 = *(unsigned __int8 *)(v7 + 24), v5 = (_BYTE *)(v7 + 24), v8))
        {
          if ((uint64_t *)*v2 == a2)
          {
            v9 = (uint64_t **)a2[2];
          }
          else
          {
            v9 = (uint64_t **)v2[1];
            v10 = *v9;
            v2[1] = (uint64_t)*v9;
            if (v10)
            {
              v10[2] = (uint64_t)v2;
              v3 = (uint64_t *)v2[2];
            }
            v9[2] = v3;
            *(_QWORD *)(v2[2] + 8 * (*(_QWORD *)v2[2] != (_QWORD)v2)) = v9;
            *v9 = v2;
            v2[2] = (uint64_t)v9;
            v3 = v9[2];
            v2 = (uint64_t *)*v3;
          }
          *((_BYTE *)v9 + 24) = 1;
          *((_BYTE *)v3 + 24) = 0;
          v13 = v2[1];
          *v3 = v13;
          if (v13)
            *(_QWORD *)(v13 + 16) = v3;
          v2[2] = v3[2];
          *(_QWORD *)(v3[2] + 8 * (*(_QWORD *)v3[2] != (_QWORD)v3)) = v2;
          v2[1] = (uint64_t)v3;
          goto LABEL_27;
        }
      }
      else if (!v4 || (v6 = *((unsigned __int8 *)v4 + 24), v5 = v4 + 3, v6))
      {
        if ((uint64_t *)*v2 == a2)
        {
          v11 = a2[1];
          *v2 = v11;
          if (v11)
          {
            *(_QWORD *)(v11 + 16) = v2;
            v3 = (uint64_t *)v2[2];
          }
          a2[2] = (uint64_t)v3;
          *(_QWORD *)(v2[2] + 8 * (*(_QWORD *)v2[2] != (_QWORD)v2)) = a2;
          a2[1] = (uint64_t)v2;
          v2[2] = (uint64_t)a2;
          v3 = (uint64_t *)a2[2];
        }
        else
        {
          a2 = (uint64_t *)a2[2];
        }
        *((_BYTE *)a2 + 24) = 1;
        *((_BYTE *)v3 + 24) = 0;
        v2 = (uint64_t *)v3[1];
        v12 = *v2;
        v3[1] = *v2;
        if (v12)
          *(_QWORD *)(v12 + 16) = v3;
        v2[2] = v3[2];
        *(_QWORD *)(v3[2] + 8 * (*(_QWORD *)v3[2] != (_QWORD)v3)) = v2;
        *v2 = (uint64_t)v3;
LABEL_27:
        v3[2] = (uint64_t)v2;
        return result;
      }
      *((_BYTE *)v2 + 24) = 1;
      a2 = v3;
      *((_BYTE *)v3 + 24) = v3 == result;
      *v5 = 1;
    }
    while (v3 != result);
  }
  return result;
}

void *std::__allocate_at_least[abi:nn180100]<std::allocator<void const*>>(uint64_t a1, unint64_t a2)
{
  if (a2 >> 61)
    std::__throw_bad_array_new_length[abi:nn180100]();
  return operator new(8 * a2);
}

uint64_t std::__tree<CFBookmarkDataItem const*>::__erase_unique<CFBookmarkDataItem const*>(uint64_t a1, unint64_t *a2)
{
  _QWORD *v2;
  unint64_t v3;
  uint64_t *v4;
  unint64_t v5;
  BOOL v6;
  _QWORD *v7;

  v2 = *(_QWORD **)(a1 + 8);
  if (!v2)
    return 0;
  v3 = *a2;
  v4 = (uint64_t *)(a1 + 8);
  do
  {
    v5 = v2[4];
    v6 = v5 >= v3;
    if (v5 >= v3)
      v7 = v2;
    else
      v7 = v2 + 1;
    if (v6)
      v4 = v2;
    v2 = (_QWORD *)*v7;
  }
  while (*v7);
  if (v4 == (uint64_t *)(a1 + 8) || v3 < v4[4])
    return 0;
  std::__tree<CFBookmarkDataItem const*>::__remove_node_pointer((uint64_t **)a1, v4);
  operator delete(v4);
  return 1;
}

uint64_t *std::__tree<CFBookmarkDataItem const*>::__remove_node_pointer(uint64_t **a1, uint64_t *a2)
{
  uint64_t *v2;
  uint64_t *v3;
  uint64_t *v4;
  BOOL v5;
  uint64_t *v6;

  v2 = (uint64_t *)a2[1];
  if (v2)
  {
    do
    {
      v3 = v2;
      v2 = (uint64_t *)*v2;
    }
    while (v2);
  }
  else
  {
    v4 = a2;
    do
    {
      v3 = (uint64_t *)v4[2];
      v5 = *v3 == (_QWORD)v4;
      v4 = v3;
    }
    while (!v5);
  }
  if (*a1 == a2)
    *a1 = v3;
  v6 = a1[1];
  a1[2] = (uint64_t *)((char *)a1[2] - 1);
  std::__tree_remove[abi:nn180100]<std::__tree_node_base<void *> *>(v6, a2);
  return v3;
}

uint64_t *std::__tree_remove[abi:nn180100]<std::__tree_node_base<void *> *>(uint64_t *result, uint64_t *a2)
{
  uint64_t v2;
  uint64_t *v3;
  uint64_t *v4;
  int v5;
  uint64_t **v6;
  uint64_t *v7;
  int v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  _QWORD *v15;
  uint64_t *v16;
  uint64_t *v17;
  uint64_t v18;
  _QWORD *v19;
  uint64_t *v20;
  BOOL v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;

  v2 = *a2;
  v3 = a2;
  if (*a2)
  {
    v4 = (uint64_t *)a2[1];
    if (!v4)
    {
      v3 = a2;
      goto LABEL_7;
    }
    do
    {
      v3 = v4;
      v4 = (uint64_t *)*v4;
    }
    while (v4);
  }
  v2 = v3[1];
  if (v2)
  {
LABEL_7:
    v5 = 0;
    *(_QWORD *)(v2 + 16) = v3[2];
    goto LABEL_8;
  }
  v5 = 1;
LABEL_8:
  v6 = (uint64_t **)v3[2];
  v7 = *v6;
  if (*v6 == v3)
  {
    *v6 = (uint64_t *)v2;
    if (v3 == result)
    {
      v7 = 0;
      result = (uint64_t *)v2;
    }
    else
    {
      v7 = v6[1];
    }
  }
  else
  {
    v6[1] = (uint64_t *)v2;
  }
  v8 = *((unsigned __int8 *)v3 + 24);
  if (v3 != a2)
  {
    v9 = a2[2];
    v3[2] = v9;
    *(_QWORD *)(v9 + 8 * (*(_QWORD *)a2[2] != (_QWORD)a2)) = v3;
    v11 = *a2;
    v10 = a2[1];
    *(_QWORD *)(v11 + 16) = v3;
    *v3 = v11;
    v3[1] = v10;
    if (v10)
      *(_QWORD *)(v10 + 16) = v3;
    *((_BYTE *)v3 + 24) = *((_BYTE *)a2 + 24);
    if (result == a2)
      result = v3;
  }
  if (!v8 || !result)
    return result;
  if (!v5)
  {
    *(_BYTE *)(v2 + 24) = 1;
    return result;
  }
  while (1)
  {
    v12 = v7[2];
    if (*(uint64_t **)v12 == v7)
      break;
    if (!*((_BYTE *)v7 + 24))
    {
      *((_BYTE *)v7 + 24) = 1;
      *(_BYTE *)(v12 + 24) = 0;
      v13 = *(uint64_t **)(v12 + 8);
      v14 = *v13;
      *(_QWORD *)(v12 + 8) = *v13;
      if (v14)
        *(_QWORD *)(v14 + 16) = v12;
      v13[2] = *(_QWORD *)(v12 + 16);
      *(_QWORD *)(*(_QWORD *)(v12 + 16) + 8 * (**(_QWORD **)(v12 + 16) != v12)) = v13;
      *v13 = v12;
      *(_QWORD *)(v12 + 16) = v13;
      if (result == (uint64_t *)*v7)
        result = v7;
      v7 = *(uint64_t **)(*v7 + 8);
    }
    v15 = (_QWORD *)*v7;
    if (*v7 && !*((_BYTE *)v15 + 24))
    {
      v16 = (uint64_t *)v7[1];
      if (!v16)
        goto LABEL_56;
LABEL_55:
      if (*((_BYTE *)v16 + 24))
      {
LABEL_56:
        *((_BYTE *)v15 + 24) = 1;
        *((_BYTE *)v7 + 24) = 0;
        v22 = v15[1];
        *v7 = v22;
        if (v22)
          *(_QWORD *)(v22 + 16) = v7;
        v15[2] = v7[2];
        *(_QWORD *)(v7[2] + 8 * (*(_QWORD *)v7[2] != (_QWORD)v7)) = v15;
        v15[1] = v7;
        v7[2] = (uint64_t)v15;
        v16 = v7;
      }
      else
      {
        v15 = v7;
      }
      v23 = v15[2];
      *((_BYTE *)v15 + 24) = *(_BYTE *)(v23 + 24);
      *(_BYTE *)(v23 + 24) = 1;
      *((_BYTE *)v16 + 24) = 1;
      v24 = *(uint64_t **)(v23 + 8);
      v25 = *v24;
      *(_QWORD *)(v23 + 8) = *v24;
      if (v25)
        *(_QWORD *)(v25 + 16) = v23;
      v24[2] = *(_QWORD *)(v23 + 16);
      *(_QWORD *)(*(_QWORD *)(v23 + 16) + 8 * (**(_QWORD **)(v23 + 16) != v23)) = v24;
      *v24 = v23;
      goto LABEL_72;
    }
    v16 = (uint64_t *)v7[1];
    if (v16 && !*((_BYTE *)v16 + 24))
      goto LABEL_55;
    *((_BYTE *)v7 + 24) = 0;
    v17 = (uint64_t *)v7[2];
    if (v17 == result)
    {
      v17 = result;
LABEL_53:
      *((_BYTE *)v17 + 24) = 1;
      return result;
    }
    if (!*((_BYTE *)v17 + 24))
      goto LABEL_53;
LABEL_49:
    v7 = *(uint64_t **)(v17[2] + 8 * (*(_QWORD *)v17[2] == (_QWORD)v17));
  }
  if (!*((_BYTE *)v7 + 24))
  {
    *((_BYTE *)v7 + 24) = 1;
    *(_BYTE *)(v12 + 24) = 0;
    v18 = v7[1];
    *(_QWORD *)v12 = v18;
    if (v18)
      *(_QWORD *)(v18 + 16) = v12;
    v7[2] = *(_QWORD *)(v12 + 16);
    *(_QWORD *)(*(_QWORD *)(v12 + 16) + 8 * (**(_QWORD **)(v12 + 16) != v12)) = v7;
    v7[1] = v12;
    *(_QWORD *)(v12 + 16) = v7;
    if (result == (uint64_t *)v12)
      result = v7;
    v7 = *(uint64_t **)v12;
  }
  v19 = (_QWORD *)*v7;
  if (*v7 && !*((_BYTE *)v19 + 24))
    goto LABEL_68;
  v20 = (uint64_t *)v7[1];
  if (!v20 || *((_BYTE *)v20 + 24))
  {
    *((_BYTE *)v7 + 24) = 0;
    v17 = (uint64_t *)v7[2];
    if (*((_BYTE *)v17 + 24))
      v21 = v17 == result;
    else
      v21 = 1;
    if (v21)
      goto LABEL_53;
    goto LABEL_49;
  }
  if (v19 && !*((_BYTE *)v19 + 24))
  {
LABEL_68:
    v20 = v7;
  }
  else
  {
    *((_BYTE *)v20 + 24) = 1;
    *((_BYTE *)v7 + 24) = 0;
    v26 = *v20;
    v7[1] = *v20;
    if (v26)
      *(_QWORD *)(v26 + 16) = v7;
    v20[2] = v7[2];
    *(_QWORD *)(v7[2] + 8 * (*(_QWORD *)v7[2] != (_QWORD)v7)) = v20;
    *v20 = (uint64_t)v7;
    v7[2] = (uint64_t)v20;
    v19 = v7;
  }
  v23 = v20[2];
  *((_BYTE *)v20 + 24) = *(_BYTE *)(v23 + 24);
  *(_BYTE *)(v23 + 24) = 1;
  *((_BYTE *)v19 + 24) = 1;
  v24 = *(uint64_t **)v23;
  v27 = *(_QWORD *)(*(_QWORD *)v23 + 8);
  *(_QWORD *)v23 = v27;
  if (v27)
    *(_QWORD *)(v27 + 16) = v23;
  v24[2] = *(_QWORD *)(v23 + 16);
  *(_QWORD *)(*(_QWORD *)(v23 + 16) + 8 * (**(_QWORD **)(v23 + 16) != v23)) = v24;
  v24[1] = v23;
LABEL_72:
  *(_QWORD *)(v23 + 16) = v24;
  return result;
}

uint64_t *std::__tree<std::__value_type<std::pair<unsigned int,unsigned int>,void const*>,std::__map_value_compare<std::pair<unsigned int,unsigned int>,std::__value_type<std::pair<unsigned int,unsigned int>,void const*>,std::less<std::pair<unsigned int,unsigned int>>,true>,std::allocator<std::__value_type<std::pair<unsigned int,unsigned int>,void const*>>>::find<std::pair<unsigned int,unsigned int>>(uint64_t a1, unsigned int *a2)
{
  uint64_t *v2;
  uint64_t *v3;
  uint64_t *v4;
  unsigned int v5;
  unsigned int v6;
  uint64_t *v7;
  unsigned int v8;
  unsigned int v9;

  v4 = *(uint64_t **)(a1 + 8);
  v2 = (uint64_t *)(a1 + 8);
  v3 = v4;
  if (!v4)
    return v2;
  v6 = *a2;
  v5 = a2[1];
  v7 = v2;
  do
  {
    v8 = *((_DWORD *)v3 + 8);
    if (v8 >= v6)
    {
      if (v6 >= v8)
      {
        if (*((_DWORD *)v3 + 9) < v5)
          ++v3;
        else
          v7 = v3;
      }
      else
      {
        v7 = v3;
      }
    }
    else
    {
      ++v3;
    }
    v3 = (uint64_t *)*v3;
  }
  while (v3);
  if (v7 == v2)
    return v2;
  v9 = *((_DWORD *)v7 + 8);
  if (v6 < v9 || v9 >= v6 && v5 < *((_DWORD *)v7 + 9))
    return v2;
  return v7;
}

uint64_t *std::__tree<std::__value_type<std::pair<unsigned int,unsigned int>,void const*>,std::__map_value_compare<std::pair<unsigned int,unsigned int>,std::__value_type<std::pair<unsigned int,unsigned int>,void const*>,std::less<std::pair<unsigned int,unsigned int>>,true>,std::allocator<std::__value_type<std::pair<unsigned int,unsigned int>,void const*>>>::__emplace_unique_key_args<std::pair<unsigned int,unsigned int>,std::pair<std::pair<unsigned int,unsigned int> const,void const*> const&>(uint64_t **a1, unsigned int *a2, _OWORD *a3)
{
  uint64_t *v5;
  uint64_t *v6;
  uint64_t **v7;
  uint64_t v9;

  v5 = std::__tree<std::__value_type<std::pair<unsigned int,unsigned int>,void const*>,std::__map_value_compare<std::pair<unsigned int,unsigned int>,std::__value_type<std::pair<unsigned int,unsigned int>,void const*>,std::less<std::pair<unsigned int,unsigned int>>,true>,std::allocator<std::__value_type<std::pair<unsigned int,unsigned int>,void const*>>>::__find_equal<std::pair<unsigned int,unsigned int>>((uint64_t)a1, &v9, a2);
  v6 = (uint64_t *)*v5;
  if (!*v5)
  {
    v7 = (uint64_t **)v5;
    v6 = (uint64_t *)operator new(0x30uLL);
    *((_OWORD *)v6 + 2) = *a3;
    std::__tree<CFBookmarkDataItem const*>::__insert_node_at(a1, v9, v7, v6);
  }
  return v6;
}

uint64_t *std::__tree<std::__value_type<std::pair<unsigned int,unsigned int>,void const*>,std::__map_value_compare<std::pair<unsigned int,unsigned int>,std::__value_type<std::pair<unsigned int,unsigned int>,void const*>,std::less<std::pair<unsigned int,unsigned int>>,true>,std::allocator<std::__value_type<std::pair<unsigned int,unsigned int>,void const*>>>::__find_equal<std::pair<unsigned int,unsigned int>>(uint64_t a1, _QWORD *a2, unsigned int *a3)
{
  uint64_t *result;
  uint64_t *v4;
  uint64_t *v5;
  unsigned int v6;
  unsigned int v7;
  uint64_t *v8;
  unsigned int v9;
  unsigned int v10;

  v5 = *(uint64_t **)(a1 + 8);
  result = (uint64_t *)(a1 + 8);
  v4 = v5;
  if (v5)
  {
    v6 = *a3;
    v7 = a3[1];
    while (1)
    {
      while (1)
      {
        v8 = v4;
        v9 = *((_DWORD *)v4 + 8);
        if (v6 >= v9)
          break;
LABEL_4:
        v4 = (uint64_t *)*v8;
        result = v8;
        if (!*v8)
          goto LABEL_12;
      }
      if (v9 >= v6)
      {
        v10 = *((_DWORD *)v8 + 9);
        if (v7 < v10)
          goto LABEL_4;
        if (v10 >= v7)
          goto LABEL_12;
      }
      result = v8 + 1;
      v4 = (uint64_t *)v8[1];
      if (!v4)
        goto LABEL_12;
    }
  }
  v8 = result;
LABEL_12:
  *a2 = v8;
  return result;
}

uint64_t _CFURLCreateBookmarkDataFromAliasRecord()
{
  return 0;
}

uint64_t _CFURLBookmarkToAliasHandle()
{
  return 4294967253;
}

CFDataRef __CFURLCreateBookmarkData(const __CFAllocator *a1, const __CFURL *a2, unint64_t a3, const __CFArray *a4, const __CFURL *a5, __CFError **a6)
{
  int IsReachable;
  int v13;
  CFDataRef v14;
  NSObject *v15;
  CFAllocatorRef v17[8];

  BookmarkMutableData::BookmarkMutableData((BookmarkMutableData *)v17, a1, 0x6B6F6F62u);
  if (a2)
  {
    CFRetain(a2);
    IsReachable = CFURLResourceIsReachable(a2, 0);
    v13 = _CFURLIsFileURL();
    if ((a3 & 0x10000400) == 0x10000000 || !v13 || IsReachable)
    {
      createBookmarkWithURLAtDepth(a1, a2, a3, a5, a4, (BookmarkMutableData *)v17, 1, IsReachable != 0, a6);
      v14 = BookmarkMutableData::Finalize(v17, 0, 0);
      if (!a6)
        goto LABEL_15;
    }
    else
    {
      if (!a6)
      {
        v14 = 0;
        goto LABEL_16;
      }
      v14 = 0;
      *a6 = CFErrorCreate((CFAllocatorRef)*MEMORY[0x1E0C9AE00], (CFErrorDomain)*MEMORY[0x1E0C9AFB8], 260, 0);
    }
  }
  else
  {
    v14 = 0;
    if (!a6)
      goto LABEL_15;
  }
  if (!v14 && !*a6)
  {
    v15 = bmarkLog;
    if (os_log_type_enabled((os_log_t)bmarkLog, OS_LOG_TYPE_ERROR))
      __CFURLCreateBookmarkData(v15);
    *a6 = CFErrorCreate((CFAllocatorRef)*MEMORY[0x1E0C9AE00], (CFErrorDomain)*MEMORY[0x1E0C9AFB8], 256, 0);
  }
LABEL_15:
  if (a2)
LABEL_16:
    CFRelease(a2);
  BookmarkMutableData::~BookmarkMutableData((BookmarkMutableData *)v17);
  return v14;
}

void createBookmarkWithURLAtDepth(const __CFAllocator *a1, const __CFURL *cf, unint64_t a3, const __CFURL *a4, const __CFArray *a5, BookmarkMutableData *this, int a7, char a8, __CFError **a9)
{
  const __CFURL *v14;
  int TOC;
  double v16;
  int v17;
  const __CFString *inited;
  double Helper_x8__FPCreateBookmarkableStringFromDocumentURL;
  uint64_t v20;
  __CFError **v21;
  const __CFURL *v22;
  const __CFString *String;
  const __CFString *v24;
  const __CFString *v25;
  const __CFString *v26;
  const __CFString *v27;
  const __CFArray *URLParentageArray;
  uint64_t Count;
  const CFArrayCallBacks *v30;
  CFMutableArrayRef v31;
  char v32;
  CFIndex v33;
  const __CFString *v34;
  const __CFString *v35;
  const __CFURL *ValueAtIndex;
  const __CFString *v37;
  CFIndex v38;
  __CFArray *v39;
  const __CFURL *v40;
  CFStringRef PathComponent;
  __CFArray *v42;
  CFTypeRef v43;
  int v44;
  CFTypeRef *v45;
  CFIndex v46;
  _BOOL8 v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  unint64_t v53;
  unint64_t v54;
  unint64_t v55;
  unint64_t v56;
  uint64_t v57;
  const __CFURL *v58;
  __CFArray *v59;
  const __CFAllocator *v60;
  uint64_t v61;
  const void *v62;
  CFNumberRef v63;
  CFNumberRef v64;
  CFTypeID v65;
  const __CFURL *v66;
  const __CFArray *v67;
  CFIndex v68;
  CFIndex v69;
  uint64_t v70;
  CFIndex v71;
  const void *v72;
  const void *v73;
  CFIndex v74;
  CFIndex v75;
  CFURLRef v76;
  CFURLRef v77;
  CFURLRef v78;
  CFIndex v79;
  const void *v81;
  const void *v82;
  const __CFAllocator *v83;
  const __CFString *v84;
  const __CFString *v85;
  const __CFString *v86;
  CFIndex v87;
  unint64_t v88;
  BOOL v89;
  const void *v90;
  __CFArray *v91;
  const __CFAllocator *v92;
  CFNumberRef v93;
  CFIndex i;
  CFIndex v95;
  int v96;
  CFIndex v97;
  const void *v98;
  const void *v99;
  CFTypeID v100;
  CFIndex FirstIndexOfValue;
  const void *v102;
  CFNumberRef v103;
  const void *v104;
  const __CFString *v105;
  BOOL v106;
  CFTypeID v107;
  CFIndex v108;
  const __CFString *v109;
  const __CFString *v110;
  CFTypeID v111;
  int v112;
  CFTypeRef v113;
  char v114;
  __CFError *v115;
  const char *v116;
  UInt8 *v117;
  CFIndex v118;
  uint64_t **v119;
  unsigned int v120;
  const char *v121;
  char v122;
  const __CFAllocator *v123;
  const __CFURL *NormalizedFileURL;
  const __CFURL *v125;
  char v126;
  const __CFString *v127;
  const __CFURL *v128;
  __CFArray *v130;
  BookmarkMutableData *v131;
  unint64_t v132;
  unsigned int v134;
  __CFArray *v135;
  __CFArray *Mutable;
  CFMutableArrayRef theArray;
  CFTypeRef v138;
  CFTypeRef propertyValueTypeRefPtr;
  CFTypeRef cfa[130];
  CFRange v141;
  CFRange v142;
  CFRange v143;
  CFRange v144;
  CFRange v145;
  CFRange v146;
  CFRange v147;
  CFRange v148;
  CFRange v149;
  CFRange v150;
  CFRange v151;

  v14 = cf;
  cfa[128] = *(CFTypeRef *)MEMORY[0x1E0C80C00];
  v138 = 0;
  if (cf)
    CFRetain(cf);
  v134 = a7;
  TOC = BookmarkMutableData::createTOC(this, a7);
  v17 = TOC;
  if (a3 && TOC)
    BookmarkMutableData::encodeValue((void **)this, 0xD010u, a3, 0);
  inited = 0;
  if (v17)
  {
    Helper_x8__FPCreateBookmarkableStringFromDocumentURL = gotLoadHelper_x8__FPCreateBookmarkableStringFromDocumentURL(v16);
    if (*(_QWORD *)(v20 + 1776))
      inited = (const __CFString *)FPCreateBookmarkableStringFromDocumentURL_delayInitStub(Helper_x8__FPCreateBookmarkableStringFromDocumentURL);
  }
  v21 = a9;
  v22 = CFURLCopyAbsoluteURL(v14);
  if (!v17)
    goto LABEL_207;
  v135 = a5;
  if (!_CFURLIsFileURL())
  {
    v26 = CFURLGetString(v22);
    BookmarkMutableData::encodeItem((uint64_t **)this, 0x1003u, v26, 0);
    goto LABEL_186;
  }
  v127 = inited;
  v126 = v17;
  v125 = v22;
  if ((a8 & 1) != 0)
  {
    String = CFURLCopyQueryString(v22, 0);
    if (String)
      BookmarkMutableData::encodeItem((uint64_t **)this, 0x1102u, String, 0);
    v24 = CFURLCopyFragment(v22, 0);
    if (v24)
    {
      v25 = v24;
      BookmarkMutableData::encodeItem((uint64_t **)this, 0x1101u, v24, 0);
      CFRelease(v25);
    }
    if (String)
      CFRelease(String);
  }
  else
  {
    v27 = CFURLGetString(v22);
    BookmarkMutableData::encodeItem((uint64_t **)this, 0x1003u, v27, 0);
  }
  NormalizedFileURL = createNormalizedFileURL(v14);
  v132 = a3;
  URLParentageArray = createURLParentageArray(a1, NormalizedFileURL);
  Count = CFArrayGetCount(URLParentageArray);
  v30 = (const CFArrayCallBacks *)MEMORY[0x1E0C9B378];
  Mutable = CFArrayCreateMutable(a1, Count, MEMORY[0x1E0C9B378]);
  theArray = CFArrayCreateMutable(a1, 0, v30);
  v31 = CFArrayCreateMutable(a1, 0, v30);
  v128 = v14;
  v131 = this;
  if (Count < 1)
  {
    v44 = 0;
    v122 = 0;
  }
  else
  {
    v32 = 0;
    v33 = 0;
    v34 = (const __CFString *)*MEMORY[0x1E0C9B7E8];
    v35 = (const __CFString *)*MEMORY[0x1E0C9B0D0];
    do
    {
      cfa[0] = 0;
      ValueAtIndex = (const __CFURL *)CFArrayGetValueAtIndex(URLParentageArray, v33);
      if (cfa[0])
      {
        CFRelease(cfa[0]);
        cfa[0] = 0;
      }
      if (CFURLCopyResourcePropertyForKey(ValueAtIndex, v34, cfa, 0)
        && cfa[0]
        && sameFileURL(ValueAtIndex, cfa[0]))
      {
        CFArrayAppendValue(Mutable, cfa[0]);
        v32 |= v33 != 0;
      }
      else
      {
        CFArrayAppendValue(Mutable, v35);
      }
      if (cfa[0])
        CFRelease(cfa[0]);
      ++v33;
    }
    while (Count != v33);
    v122 = v32;
    if (Count >= 2)
    {
      v37 = (const __CFString *)*MEMORY[0x1E0C9B5A0];
      v38 = 1;
      while (1)
      {
        v39 = v31;
        v40 = (const __CFURL *)CFArrayGetValueAtIndex(URLParentageArray, v38);
        cfa[0] = 0;
        if (v138)
        {
          CFRelease(v138);
          v138 = 0;
        }
        if (CFURLCopyResourcePropertyForKey(v40, v37, cfa, (CFErrorRef *)&v138))
        {
          PathComponent = (CFStringRef)cfa[0];
        }
        else
        {
          if ((v132 & 0x10000000) == 0)
          {
            if (cfa[0])
              CFRelease(cfa[0]);
            cfa[0] = 0;
            v42 = theArray;
LABEL_44:
            PathComponent = v35;
            goto LABEL_45;
          }
          PathComponent = CFURLCopyLastPathComponent(v40);
          if (cfa[0] != PathComponent)
          {
            if (cfa[0])
              CFRelease(cfa[0]);
            cfa[0] = PathComponent;
          }
        }
        v42 = theArray;
        if (!PathComponent)
          goto LABEL_44;
LABEL_45:
        CFArrayAppendValue(v42, PathComponent);
        propertyValueTypeRefPtr = 0;
        _CFURLGetVolumePropertyFlags();
        if (propertyValueTypeRefPtr)
          v43 = propertyValueTypeRefPtr;
        else
          v43 = v35;
        v31 = v39;
        CFArrayAppendValue(v39, v43);
        if (propertyValueTypeRefPtr)
          CFRelease(propertyValueTypeRefPtr);
        if (cfa[0])
          CFRelease(cfa[0]);
        if (Count == ++v38)
        {
          v44 = 1;
          goto LABEL_60;
        }
      }
    }
    v44 = 0;
LABEL_60:
    v14 = v128;
    a5 = v135;
  }
  BookmarkMutableData::encodeItem((uint64_t **)this, 0x1004u, (const __CFString *)theArray, 0);
  if (!CFArrayGetCount(theArray))
  {
    cfa[0] = 0;
    if (CFURLCopyResourcePropertyForKey(v14, (CFStringRef)*MEMORY[0x1E0C9B5A0], cfa, 0))
    {
      if (cfa[0])
      {
        BookmarkMutableData::encodeItem((uint64_t **)this, 0x1020u, (const __CFString *)cfa[0], 0);
        CFRelease(cfa[0]);
      }
    }
  }
  if (v138)
    v45 = 0;
  else
    v45 = &v138;
  encodeResourcePropertyIntoBookmark((uint64_t **)this, v14, (CFStringRef)*MEMORY[0x1E0C9B408], 0x1040u, (CFErrorRef *)v45);
  if (a5)
  {
    v46 = CFArrayGetCount(a5);
    v141.location = 0;
    v141.length = v46;
    v47 = CFArrayContainsValue(a5, v141, (const void *)*MEMORY[0x1E0C9B520]) != 0;
    v142.location = 0;
    v142.length = v46;
    v48 = v47 | (2 * (CFArrayContainsValue(a5, v142, (const void *)*MEMORY[0x1E0C9B4E0]) != 0));
    v143.location = 0;
    v143.length = v46;
    v49 = v48 | (4 * (CFArrayContainsValue(a5, v143, (const void *)*MEMORY[0x1E0C9B530]) != 0));
    v144.location = 0;
    v144.length = v46;
    v50 = v49 | (8 * (CFArrayContainsValue(a5, v144, (const void *)*MEMORY[0x1E0C9B550]) != 0));
    v145.location = 0;
    v145.length = v46;
    v51 = v50 | (16 * (CFArrayContainsValue(a5, v145, (const void *)*MEMORY[0x1E0C9B508]) != 0));
    v146.location = 0;
    v146.length = v46;
    v52 = v51 | (32 * (CFArrayContainsValue(a5, v146, (const void *)*MEMORY[0x1E0C9B538]) != 0));
    v147.location = 0;
    v147.length = v46;
    v53 = v52 | ((unint64_t)(CFArrayContainsValue(a5, v147, (const void *)*MEMORY[0x1E0C9B548]) != 0) << 6);
    v148.location = 0;
    v148.length = v46;
    v54 = v53 | ((unint64_t)(CFArrayContainsValue(a5, v148, (const void *)*MEMORY[0x1E0C9B4F8]) != 0) << 7);
    v149.location = 0;
    v149.length = v46;
    v55 = v54 | ((unint64_t)(CFArrayContainsValue(a5, v149, (const void *)*MEMORY[0x1E0C9B4C8]) != 0) << 8);
    v150.location = 0;
    v150.length = v46;
    v56 = v55 | ((unint64_t)(CFArrayContainsValue(a5, v150, (const void *)*MEMORY[0x1E0C9B4D8]) != 0) << 9);
  }
  else
  {
    v56 = 0;
  }
  if (v138)
  {
    CFRelease(v138);
    v138 = 0;
  }
  if ((v132 & 0x400) != 0)
    v57 = v56 | 0x21F;
  else
    v57 = v56;
  propertyValueTypeRefPtr = 0;
  if (_CFURLGetResourcePropertyFlags())
  {
    cfa[0] = propertyValueTypeRefPtr;
    cfa[1] = (CFTypeRef)(v57 | 0xF);
    cfa[2] = (CFTypeRef)v57;
    BookmarkMutableData::encodeRawData((uint64_t **)this, 0x1010u, (UInt8 *)cfa, 24);
  }
  if (CFURLIsFileReferenceURL(v14))
    BookmarkMutableData::encodeItem((uint64_t **)this, 0xD001u, (const __CFString *)*MEMORY[0x1E0C9AE50], 0);
  if (CFURLGetBaseURL(v14))
  {
    v58 = CFURLGetBaseURL(v14);
    v59 = CFArrayCreateMutable(a1, 0, MEMORY[0x1E0C9B378]);
    v60 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
    if (v44)
    {
      v44 = 0;
      v61 = Count + 1;
      do
      {
        v62 = CFArrayGetValueAtIndex(URLParentageArray, v61 - 2);
        if (v58 && sameFileURL(v62, v58))
        {
          LODWORD(propertyValueTypeRefPtr) = v44;
          v63 = CFNumberCreate(v60, kCFNumberSInt32Type, &propertyValueTypeRefPtr);
          CFArrayInsertValueAtIndex(v59, 0, v63);
          if (v63)
            CFRelease(v63);
          v58 = CFURLGetBaseURL(v58);
          v44 = 0;
        }
        ++v44;
        --v61;
      }
      while (v61 > 2);
    }
    LODWORD(propertyValueTypeRefPtr) = v44;
    v64 = CFNumberCreate(v60, kCFNumberSInt32Type, &propertyValueTypeRefPtr);
    CFArrayInsertValueAtIndex(v59, 0, v64);
    if (v64)
      CFRelease(v64);
    BookmarkMutableData::encodeItem((uint64_t **)this, 0xE003u, (const __CFString *)v59, 0);
    v14 = v128;
    if (v59)
      CFRelease(v59);
  }
  if (a4)
  {
    v65 = CFGetTypeID(a4);
    if (v65 == CFURLGetTypeID() && !sameFileURL(a4, v14))
    {
      v66 = createNormalizedFileURL(a4);
      v67 = createURLParentageArray(a1, v66);
      v68 = CFArrayGetCount(URLParentageArray);
      v69 = CFArrayGetCount(v67);
      if (v69 >= v68)
        v70 = v68;
      else
        v70 = v69;
      if (v70 >= 1)
      {
        v71 = 0;
        while (1)
        {
          v72 = CFArrayGetValueAtIndex(URLParentageArray, v71);
          v73 = CFArrayGetValueAtIndex(v67, v71);
          if (!sameFileURL(v72, v73))
            break;
          if (v70 == ++v71)
          {
            v71 = v70;
            break;
          }
        }
        if ((unint64_t)v71 > 1)
        {
          BookmarkMutableData::encodeItem((uint64_t **)this, 0x1056u, (const __CFString *)*MEMORY[0x1E0C9AE50], 0);
          if (CFArrayGetCount(v67) > v71)
          {
            v74 = CFArrayGetCount(v67);
            if (v74 - v71 <= 2147483646)
              BookmarkMutableData::encodeValue((void **)this, 0x1054u, v74 - v71, 0);
          }
          if (CFArrayGetCount(URLParentageArray) > v71)
          {
            v75 = CFArrayGetCount(URLParentageArray);
            if (v75 - v71 <= 2147483646)
              BookmarkMutableData::encodeValue((void **)this, 0x1055u, v75 - v71, 0);
          }
        }
      }
      if (v67)
        CFRelease(v67);
      v14 = v128;
      if (v66)
        CFRelease(v66);
    }
  }
  v76 = copyUserHomeFolderURL(a1);
  inited = v127;
  if (v76)
  {
    v77 = v76;
    if (sameFileURL(v14, v76))
    {
      CFRelease(v77);
      goto LABEL_118;
    }
    v87 = CFArrayGetCount(URLParentageArray);
    if (v87 < 1)
    {
LABEL_137:
      CFRelease(v77);
      inited = v127;
      goto LABEL_138;
    }
    v88 = v87;
    v89 = 0;
    do
    {
      v90 = CFArrayGetValueAtIndex(URLParentageArray, v88 - 1);
      if (v90)
        v89 = sameFileURL(v90, v77) != 0;
      if (v88 < 2)
        break;
      --v88;
    }
    while (!v89);
    CFRelease(v77);
    inited = v127;
    v14 = v128;
    if (v89)
    {
LABEL_118:
      v78 = copyUserHomeFolderURL(a1);
      if (!v78)
        goto LABEL_138;
      v77 = v78;
      v79 = CFArrayGetCount(URLParentageArray);
      while (v79-- >= 1)
      {
        v81 = CFArrayGetValueAtIndex(URLParentageArray, v79);
        if (sameFileURL(v81, v77))
        {
          v82 = (const void *)(~v79 + CFArrayGetCount(URLParentageArray));
          v83 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
          propertyValueTypeRefPtr = v82;
          v84 = (const __CFString *)CFNumberCreate(v83, kCFNumberLongType, &propertyValueTypeRefPtr);
          BookmarkMutableData::encodeItem((uint64_t **)this, 0xC001u, v84, 0);
          if (v84)
            CFRelease(v84);
          v85 = (const __CFString *)CFCopyUserName();
          BookmarkMutableData::encodeItem((uint64_t **)this, 0xC011u, v85, 0);
          if (v85)
            CFRelease(v85);
          LODWORD(propertyValueTypeRefPtr) = _CFGetEUID();
          v86 = (const __CFString *)CFNumberCreate(v83, kCFNumberSInt32Type, &propertyValueTypeRefPtr);
          BookmarkMutableData::encodeItem((uint64_t **)this, 0xC012u, v86, 0);
          if (v86)
            CFRelease(v86);
          v14 = v128;
          goto LABEL_137;
        }
      }
      goto LABEL_137;
    }
  }
LABEL_138:
  if ((v122 & 1) != 0)
  {
    v130 = v31;
    v91 = CFArrayCreateMutable(a1, Count, MEMORY[0x1E0C9B378]);
    v92 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
    LODWORD(propertyValueTypeRefPtr) = 0;
    v123 = v92;
    v93 = CFNumberCreate(v92, kCFNumberSInt32Type, &propertyValueTypeRefPtr);
    if (Count >= 1)
    {
      for (i = 0; i != Count; ++i)
        CFArrayInsertValueAtIndex(v91, i, v93);
      v95 = Count;
      v96 = v134;
      do
      {
        v97 = v95--;
        v98 = CFArrayGetValueAtIndex(Mutable, v95);
        if (v98)
        {
          v99 = v98;
          v100 = CFGetTypeID(v98);
          if (v100 == CFURLGetTypeID())
          {
            v151.length = Count - v97;
            v151.location = v97;
            FirstIndexOfValue = CFArrayGetFirstIndexOfValue(Mutable, v151, v99);
            this = v131;
            if (FirstIndexOfValue == -1)
            {
              if (v138)
              {
                CFRelease(v138);
                v138 = 0;
              }
              if (addVolumeInfoForURLToBookmark(a1, v131, v99, v132, v96, v135, (__CFError **)&v138))
              {
                LODWORD(propertyValueTypeRefPtr) = v96;
                v103 = CFNumberCreate(v123, kCFNumberSInt32Type, &propertyValueTypeRefPtr);
                CFArraySetValueAtIndex(v91, v95, v103);
                if (v103)
                  CFRelease(v103);
              }
            }
            else
            {
              v102 = CFArrayGetValueAtIndex(v91, FirstIndexOfValue);
              CFArraySetValueAtIndex(v91, v95, v102);
            }
            if (BookmarkMutableData::tocExists(v131, v96))
            {
              do
              {
                if ((v96 + 1) > 0xF000)
                  ++v96;
                else
                  v96 = 61440;
              }
              while ((BookmarkMutableData::tocExists(v131, v96) & 1) != 0);
            }
          }
          else
          {
            this = v131;
          }
        }
      }
      while (v97 > 1);
    }
    BookmarkMutableData::encodeItem((uint64_t **)this, 0x2000u, (const __CFString *)v91, 0);
    if (v93)
      CFRelease(v93);
    inited = v127;
    v14 = v128;
    v31 = v130;
LABEL_169:
    if (v91)
      CFRelease(v91);
    goto LABEL_171;
  }
  if (CFArrayGetCount(Mutable) >= 1)
  {
    v91 = CFURLCreateWithFileSystemPath((CFAllocatorRef)*MEMORY[0x1E0C9AE00], CFSTR("/"), kCFURLPOSIXPathStyle, 1u);
    v104 = CFArrayGetValueAtIndex(Mutable, 0);
    if (v138)
    {
      CFRelease(v138);
      v138 = 0;
    }
    addVolumeInfoForURLToBookmark(a1, this, v104, v132, v134, v135, (__CFError **)&v138);
    if (sameFileURL(v104, v91))
      BookmarkMutableData::encodeItem((uint64_t **)this, 0x2030u, (const __CFString *)*MEMORY[0x1E0C9AE50], 0);
    goto LABEL_169;
  }
LABEL_171:
  propertyValueTypeRefPtr = 0;
  v105 = (const __CFString *)*MEMORY[0x1E0C9B418];
  if (CFURLCopyResourcePropertyForKey(v14, (CFStringRef)*MEMORY[0x1E0C9B418], &propertyValueTypeRefPtr, 0))
    v106 = propertyValueTypeRefPtr == 0;
  else
    v106 = 1;
  if (!v106)
  {
    BookmarkMutableData::encodeItem((void **)this, v105, (const __CFString *)propertyValueTypeRefPtr, 0);
    CFRelease(propertyValueTypeRefPtr);
  }
  a5 = v135;
  if (v31)
    CFRelease(v31);
  if (theArray)
    CFRelease(theArray);
  if (Mutable)
    CFRelease(Mutable);
  if (URLParentageArray)
    CFRelease(URLParentageArray);
  LOBYTE(v17) = v126;
  v21 = a9;
  v22 = v125;
  LODWORD(a3) = v132;
  if (NormalizedFileURL)
    CFRelease(NormalizedFileURL);
LABEL_186:
  if (inited)
  {
    BookmarkMutableData::encodeItem((uint64_t **)this, 0x2070u, inited, 0);
    CFRelease(inited);
  }
  if ((a3 & 0x400) != 0 && v134 == 1)
  {
    encodeResourcePropertyIntoBookmark((uint64_t **)this, v14, (CFStringRef)*MEMORY[0x1E0C9B580], 0xF017u, 0);
    encodeResourcePropertyIntoBookmark((uint64_t **)this, v14, (CFStringRef)*MEMORY[0x1E0C9AD58], 0xF022u, 0);
  }
  if (a5)
  {
    v107 = CFGetTypeID(a5);
    if (v107 == CFArrayGetTypeID() && CFArrayGetCount(a5) >= 1)
    {
      v108 = 0;
      do
      {
        v109 = (const __CFString *)CFArrayGetValueAtIndex(a5, v108);
        if (v109)
        {
          v110 = v109;
          v111 = CFGetTypeID(v109);
          v106 = v111 == CFStringGetTypeID();
          a5 = v135;
          if (v106)
          {
            cfa[0] = 0;
            if (v138)
            {
              CFRelease(v138);
              v138 = 0;
            }
            v112 = CFURLCopyResourcePropertyForKey(v14, v110, cfa, (CFErrorRef *)&v138);
            v113 = cfa[0];
            if (v112 && cfa[0])
            {
              BookmarkMutableData::encodeItem((void **)this, v110, (const __CFString *)cfa[0], 0);
              v113 = cfa[0];
            }
            if (v113)
              CFRelease(v113);
          }
        }
        ++v108;
      }
      while (v108 < CFArrayGetCount(a5));
    }
  }
  if ((a3 & 0x20000400) == 0 && CFURLGetFileSystemRepresentation(v14, 1u, (UInt8 *)cfa, 1024))
  {
    if ((a3 & 0x40000000) != 0
      || (getpid(), sandbox_check())
      || (v116 = (const char *)sandbox_extension_issue_file()) == 0)
    {
      getpid();
      if (sandbox_check())
        goto LABEL_207;
      v121 = (const char *)sandbox_extension_issue_file();
      if (!v121)
        goto LABEL_207;
      v117 = (UInt8 *)v121;
      v118 = strlen(v121) + 1;
      v119 = (uint64_t **)this;
      v120 = 61569;
    }
    else
    {
      v117 = (UInt8 *)v116;
      v118 = strlen(v116) + 1;
      v119 = (uint64_t **)this;
      v120 = 61568;
    }
    BookmarkMutableData::encodeRawData(v119, v120, v117, v118);
    free(v117);
  }
LABEL_207:
  BookmarkMutableData::finalizeTOC(this, v134);
  if (v21)
    v114 = v17;
  else
    v114 = 1;
  if ((v114 & 1) == 0)
  {
    v115 = (__CFError *)v138;
    if (v138)
      v138 = 0;
    else
      v115 = CFErrorCreate((CFAllocatorRef)*MEMORY[0x1E0C9AE00], (CFErrorDomain)*MEMORY[0x1E0C9AFB8], 256, 0);
    *v21 = v115;
  }
  if (v22)
    CFRelease(v22);
  if (v14)
    CFRelease(v14);
  if (v138)
    CFRelease(v138);
}

uint64_t _CFURLCreateBookmarkData(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v6;
  _QWORD activity_block[11];
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t v12;

  v9 = 0;
  v10 = &v9;
  v11 = 0x2000000000;
  v12 = 0;
  activity_block[0] = MEMORY[0x1E0C809B0];
  activity_block[1] = 0x40000000;
  activity_block[2] = ___CFURLCreateBookmarkData_block_invoke;
  activity_block[3] = &unk_1E0F0AE88;
  activity_block[6] = a3;
  activity_block[7] = a4;
  activity_block[4] = &v9;
  activity_block[5] = a2;
  activity_block[8] = a5;
  activity_block[9] = a1;
  activity_block[10] = a6;
  _os_activity_initiate(&dword_1817A6000, "CFURLCreateBookmarkData", OS_ACTIVITY_FLAG_IF_NONE_PRESENT, activity_block);
  v6 = v10[3];
  _Block_object_dispose(&v9, 8);
  return v6;
}

CFURLRef createNormalizedFileURL(const __CFURL *a1)
{
  const __CFAllocator *v2;
  int v3;
  const __CFURL *v4;
  const __CFURL *v5;
  const __CFString *v6;
  const __CFString *v7;
  const __CFString *CleanPath;
  const __CFString *v9;
  CFIndex Length;
  CFURLRef v11;
  const __CFString *v12;
  CFIndex v13;
  CFIndex v14;
  int CharacterAtIndex;
  int v16;
  CFIndex v17;
  CFIndex v18;
  CFIndex v19;
  CFStringRef v20;
  const __CFString *v21;
  CFIndex v22;
  CFIndex v23;
  CFIndex v24;
  UniChar *v25;
  CFIndex v26;
  UniChar *v27;
  UniChar chars[1024];
  CFIndex numChars;
  CFMutableStringRef theString;
  uint64_t v32;
  CFRange v33;
  CFRange v34;
  CFRange v35;
  CFRange v36;

  if (_CFURLIsFileURL())
  {
    v2 = CFGetAllocator(a1);
    v32 = 0;
    v3 = _CFURLGetResourcePropertyFlags() ? (v32 >> 1) & 1 : CFURLHasDirectoryPath(a1);
    v4 = CFURLCopyAbsoluteURL(a1);
    if (v4)
    {
      v5 = v4;
      v6 = CFURLCopyPath(v4);
      if (!v6)
      {
        v11 = 0;
LABEL_48:
        CFRelease(v5);
        return v11;
      }
      v7 = v6;
      CleanPath = CreateCleanPath(v2, v6);
      if (!CleanPath)
      {
        v11 = 0;
LABEL_47:
        CFRelease(v7);
        goto LABEL_48;
      }
      v9 = CleanPath;
      if (CFStringCompare(CleanPath, CFSTR("/"), 0) == kCFCompareEqualTo)
      {
        v12 = (const __CFString *)CFRetain(CFSTR("file:///"));
        if (v12)
        {
LABEL_45:
          v11 = CFURLCreateWithString(v2, v12, 0);
          CFRelease(v12);
          goto LABEL_46;
        }
LABEL_15:
        v11 = 0;
LABEL_46:
        CFRelease(v9);
        goto LABEL_47;
      }
      numChars = 0;
      theString = CFStringCreateMutable(v2, 0);
      Length = CFStringGetLength(CFSTR("file://"));
      if (Length < 1025)
      {
        v13 = Length;
        if (numChars + Length >= 1025)
        {
          CFStringAppendCharacters(theString, chars, 0);
          numChars = 0;
        }
        v33.location = 0;
        v33.length = v13;
        CFStringGetCharacters(CFSTR("file://"), v33, chars);
        numChars += v13;
      }
      else
      {
        CFStringAppend(theString, CFSTR("file://"));
      }
      v14 = CFStringGetLength(v9);
      CharacterAtIndex = CFStringGetCharacterAtIndex(v9, v14 - 1);
      v16 = CharacterAtIndex;
      if (v3)
      {
        v17 = CFStringGetLength(v9);
        v18 = numChars;
        if (v17 < 1025)
        {
          v24 = v17;
          if (numChars + v17 >= 1025)
          {
            CFStringAppendCharacters(theString, chars, numChars);
            v18 = 0;
            numChars = 0;
          }
          v25 = &chars[v18];
          v34.location = 0;
          v34.length = v24;
          CFStringGetCharacters(v9, v34, v25);
          v19 = numChars + v24;
          numChars += v24;
        }
        else
        {
          if (numChars)
          {
            CFStringAppendCharacters(theString, chars, numChars);
            numChars = 0;
          }
          CFStringAppend(theString, v9);
          v19 = numChars;
        }
        if (v16 != 47)
        {
          if (v19 >= 1024)
          {
            CFStringAppendCharacters(theString, chars, v19);
            v19 = 0;
            numChars = 0;
          }
          chars[v19] = 47;
          v19 = numChars + 1;
LABEL_41:
          numChars = v19;
        }
      }
      else
      {
        if (CharacterAtIndex == 47)
        {
          v36.length = CFStringGetLength(v9) - 1;
          v36.location = 0;
          v20 = CFStringCreateWithSubstring(v2, v9, v36);
          if (v20)
          {
            v21 = v20;
            CFRelease(v9);
            v9 = v21;
          }
        }
        v22 = CFStringGetLength(v9);
        v23 = numChars;
        if (v22 < 1025)
        {
          v26 = v22;
          if (numChars + v22 >= 1025)
          {
            CFStringAppendCharacters(theString, chars, numChars);
            v23 = 0;
            numChars = 0;
          }
          v27 = &chars[v23];
          v35.location = 0;
          v35.length = v26;
          CFStringGetCharacters(v9, v35, v27);
          v19 = numChars + v26;
          goto LABEL_41;
        }
        if (numChars)
        {
          CFStringAppendCharacters(theString, chars, numChars);
          numChars = 0;
        }
        CFStringAppend(theString, v9);
        v19 = numChars;
      }
      if (v19)
        CFStringAppendCharacters(theString, chars, v19);
      v12 = theString;
      if (theString)
        goto LABEL_45;
      goto LABEL_15;
    }
  }
  return 0;
}

void encodeResourcePropertyIntoBookmark(uint64_t **a1, CFURLRef url, CFStringRef key, unsigned int a4, CFErrorRef *error)
{
  int v7;
  const __CFString *v8;
  const __CFString *propertyValueTypeRefPtr;

  propertyValueTypeRefPtr = 0;
  v7 = CFURLCopyResourcePropertyForKey(url, key, &propertyValueTypeRefPtr, error);
  v8 = propertyValueTypeRefPtr;
  if (v7 && propertyValueTypeRefPtr)
  {
    BookmarkMutableData::encodeItem(a1, a4, propertyValueTypeRefPtr, 0);
    v8 = propertyValueTypeRefPtr;
  }
  if (v8)
    CFRelease(v8);
}

CFURLRef copyUserHomeFolderURL(const __CFAllocator *a1)
{
  const __CFURL *v2;
  const __CFURL *v3;
  const __CFString *v4;
  CFURLRef v5;

  pthread_mutex_lock(&copyUserHomeFolderURL(__CFAllocator const*,unsigned long)::sCopyHomeFolderLock);
  v2 = (const __CFURL *)CFCopyHomeDirectoryURLForUser();
  if (v2)
  {
    v3 = v2;
    v4 = CFURLGetString(v2);
    v5 = CFURLCreateWithString(a1, v4, 0);
    CFRelease(v3);
  }
  else
  {
    v5 = 0;
  }
  pthread_mutex_unlock(&copyUserHomeFolderURL(__CFAllocator const*,unsigned long)::sCopyHomeFolderLock);
  return v5;
}

uint64_t addVolumeInfoForURLToBookmark(const __CFAllocator *a1, BookmarkMutableData *a2, CFTypeRef cf, unint64_t a4, int a5, const __CFArray *a6, __CFError **a7)
{
  CFTypeID v14;
  int v15;
  const __CFString *v16;
  char v17;
  CFIndex Count;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v24;
  int v25;
  CFTypeRef v26;
  CFTypeID v27;
  int UnusedDepth;
  unsigned int v29;
  const __CFString *v30;
  UInt8 bytes[8];
  uint64_t v32;
  uint64_t v33;
  const __CFString *propertyValueTypeRefPtr;
  CFTypeRef cfa;
  CFRange v36;
  CFRange v37;
  CFRange v38;
  CFRange v39;
  CFRange v40;
  CFRange v41;
  CFRange v42;
  CFRange v43;
  CFRange v44;

  propertyValueTypeRefPtr = 0;
  if (!cf)
    return 0;
  v14 = CFGetTypeID(cf);
  if (v14 != CFURLGetTypeID())
    return 0;
  v15 = CFURLCopyResourcePropertyForKey((CFURLRef)cf, (CFStringRef)*MEMORY[0x1E0C9B7E8], &propertyValueTypeRefPtr, a7);
  v16 = propertyValueTypeRefPtr;
  if (!v15)
  {
    v22 = 0;
    if (!propertyValueTypeRefPtr)
      return v22;
    goto LABEL_51;
  }
  if (!propertyValueTypeRefPtr)
    return 0;
  v17 = BookmarkMutableData::tocExists(a2, a5);
  BookmarkMutableData::createTOC(a2, a5);
  if (_CFURLIsFileURL())
    BookmarkMutableData::encodeItem((uint64_t **)a2, 0x2005u, propertyValueTypeRefPtr, 0);
  encodeResourcePropertyIntoBookmark((uint64_t **)a2, (CFURLRef)propertyValueTypeRefPtr, (CFStringRef)*MEMORY[0x1E0C9B718], 0x2010u, a7);
  encodeResourcePropertyIntoBookmark((uint64_t **)a2, (CFURLRef)propertyValueTypeRefPtr, (CFStringRef)*MEMORY[0x1E0C9B7D0], 0x2012u, a7);
  encodeResourcePropertyIntoBookmark((uint64_t **)a2, (CFURLRef)propertyValueTypeRefPtr, (CFStringRef)*MEMORY[0x1E0C9B408], 0x2013u, a7);
  encodeResourcePropertyIntoBookmark((uint64_t **)a2, (CFURLRef)propertyValueTypeRefPtr, (CFStringRef)*MEMORY[0x1E0C9B7F0], 0x2011u, a7);
  if (a6)
  {
    Count = CFArrayGetCount(a6);
    v36.location = 0;
    v36.length = Count;
    v19 = CFArrayContainsValue(a6, v36, (const void *)*MEMORY[0x1E0C9B790]) != 0;
    v37.location = 0;
    v37.length = Count;
    if (CFArrayContainsValue(a6, v37, (const void *)*MEMORY[0x1E0C9B7B8]))
      v20 = ((unint64_t)(v19 & 1) << 32) | 0x1000000000;
    else
      v20 = v19 << 32;
    v38.location = 0;
    v38.length = Count;
    if (CFArrayContainsValue(a6, v38, (const void *)*MEMORY[0x1E0C9B778]))
      v20 |= 0x2000000000000uLL;
    v39.location = 0;
    v39.length = Count;
    if (CFArrayContainsValue(a6, v39, (const void *)*MEMORY[0x1E0C9B788]))
      v20 |= 0x10000000000uLL;
    v40.location = 0;
    v40.length = Count;
    if (CFArrayContainsValue(a6, v40, (const void *)*MEMORY[0x1E0C9B6D0]))
      v20 |= 0x20000000000000uLL;
    v41.location = 0;
    v41.length = Count;
    if (CFArrayContainsValue(a6, v41, (const void *)*MEMORY[0x1E0C9B7A8]))
      v20 |= 0x40000000000000uLL;
    v42.location = 0;
    v42.length = Count;
    if (CFArrayContainsValue(a6, v42, (const void *)*MEMORY[0x1E0C9B7C8]))
      v20 |= 0x80000000000000uLL;
    v43.location = 0;
    v43.length = Count;
    if (CFArrayContainsValue(a6, v43, (const void *)*MEMORY[0x1E0C9B748]))
      v20 |= 0x80000000000uLL;
    v44.location = 0;
    v44.length = Count;
    if (CFArrayContainsValue(a6, v44, (const void *)*MEMORY[0x1E0C9B740]))
      v21 = v20 | 0x100000000000;
    else
      v21 = v20;
  }
  else
  {
    v21 = 0;
  }
  *(_QWORD *)bytes = 0;
  v32 = 0;
  v33 = 0;
  cfa = 0;
  if (_CFURLGetVolumePropertyFlags())
  {
    v24 = (a4 & 0x400) != 0 ? v21 | 0x1000013EFLL : v21;
    *(_QWORD *)bytes = cfa;
    v32 = v21 | 0x1000013EFLL;
    v33 = v24;
    BookmarkMutableData::encodeRawData((uint64_t **)a2, 0x2020u, bytes, 24);
    if ((bytes[1] & 2) != 0)
    {
      cfa = 0;
      v25 = CFURLCopyResourcePropertyForKey((CFURLRef)propertyValueTypeRefPtr, (CFStringRef)*MEMORY[0x1E0C9AC18], &cfa, 0);
      v26 = cfa;
      if (v25 && cfa)
      {
        v27 = CFGetTypeID(cfa);
        if (v27 == CFURLGetTypeID())
        {
          UnusedDepth = BookmarkMutableData::findUnusedDepth(a2, 4000, 0xFFFFFFFF);
          if (UnusedDepth)
          {
            v29 = UnusedDepth;
            BookmarkMutableData::encodeValue((void **)a2, 0x2040u, UnusedDepth, 0);
            createBookmarkWithURLAtDepth(a1, cfa, a4, 0, 0, a2, v29, 1, a7);
          }
        }
        v26 = cfa;
      }
      if (v26)
        CFRelease(v26);
    }
  }
  v30 = CFURLCopyFileSystemPath((CFURLRef)propertyValueTypeRefPtr, kCFURLPOSIXPathStyle);
  if (v30)
    BookmarkMutableData::encodeItem((uint64_t **)a2, 0x2002u, v30, 0);
  if ((v17 & 1) == 0)
    BookmarkMutableData::finalizeTOC(a2, a5);
  if (v30)
    CFRelease(v30);
  v22 = 1;
  v16 = propertyValueTypeRefPtr;
  if (propertyValueTypeRefPtr)
LABEL_51:
    CFRelease(v16);
  return v22;
}

CFStringRef CreateCleanPath(const __CFAllocator *a1, CFStringRef theString)
{
  CFIndex Length;
  CFIndex v5;
  uint64_t v6;
  uint64_t v7;
  UniChar *v8;
  uint64_t v9;
  UniChar *v10;
  CFStringRef v11;
  UniChar *v13;
  UniChar *v14;
  UniChar *v15;
  CFStringRef CleanPathInternal;
  _QWORD v17[2];
  CFRange v18;
  CFRange v19;

  v17[1] = *MEMORY[0x1E0C80C00];
  Length = CFStringGetLength(theString);
  if (!Length)
    return CFStringCreateCopy(a1, theString);
  v5 = Length;
  if (Length > 1024)
  {
    v13 = (UniChar *)CFAllocatorAllocate(a1, 2 * Length, 0);
    v14 = (UniChar *)CFAllocatorAllocate(a1, 2 * v5 + 2, 0);
    v15 = v14;
    if (v13 && v14)
    {
      v19.location = 0;
      v19.length = v5;
      CFStringGetCharacters(theString, v19, v13);
      CleanPathInternal = CreateCleanPathInternal(a1, v5, v13, v15);
    }
    else
    {
      CleanPathInternal = 0;
      v11 = 0;
      if (!v13)
        goto LABEL_10;
    }
    CFAllocatorDeallocate(a1, v13);
    v11 = CleanPathInternal;
LABEL_10:
    if (v15)
      CFAllocatorDeallocate(a1, v15);
    return v11;
  }
  v6 = MEMORY[0x1E0C80A78](Length);
  v8 = (UniChar *)((char *)v17 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0));
  MEMORY[0x1E0C80A78](v6);
  v10 = (UniChar *)((char *)v17 - ((v9 + 17) & 0xFFFFFFFFFFFFFFF0));
  v18.location = 0;
  v18.length = v5;
  CFStringGetCharacters(theString, v18, v8);
  return CreateCleanPathInternal(a1, v5, v8, v10);
}

CFStringRef CreateCleanPathInternal(CFAllocatorRef alloc, uint64_t a2, unsigned __int16 *a3, UniChar *chars)
{
  uint64_t v8;
  uint64_t v9;
  int v10;
  int v11;
  uint64_t v12;
  uint64_t v13;
  int v14;
  uint64_t v15;
  uint64_t v16;
  int v17;

  if (*a3 == 47)
  {
    *chars = 47;
    v8 = 1;
  }
  else
  {
    v8 = 0;
  }
  if (v8 < a2)
  {
    v9 = v8;
    while (1)
    {
      v10 = 0;
      v11 = 0;
      if (a2 <= v9 + 1)
        v12 = v9 + 1;
      else
        v12 = a2;
      v13 = v9;
      while (a3[v13] != 47)
      {
        if (v10)
          v14 = v10;
        else
          v14 = a3[v13];
        if (v11)
          v10 = v14;
        else
          v11 = a3[v13];
        if (v12 == ++v13)
        {
          v13 = v12;
          break;
        }
      }
      v15 = v13 - v9;
      if (v11 == 46)
      {
        if (v13 != v9 && v15 != 1)
        {
          if (v10 != 46 || v15 != 2)
          {
LABEL_30:
            memcpy(&chars[v8], &a3[v9], 2 * v15);
            chars[v15 + v8] = 47;
            v16 = v15 + v8 + 1;
            goto LABEL_31;
          }
          if (v8 >= 2)
          {
            do
            {
              v16 = v8 - 1;
              if (v8 == 1)
                break;
              v17 = chars[v8-- - 2];
            }
            while (v17 != 47);
            goto LABEL_31;
          }
        }
      }
      else if (v13 != v9)
      {
        goto LABEL_30;
      }
      v16 = v8;
LABEL_31:
      v9 = v13 + 1;
      v8 = v16;
      if (v13 + 1 >= a2)
        return CFStringCreateWithCharacters(alloc, chars, v16 - (v16 > 1));
    }
  }
  v16 = v8;
  return CFStringCreateWithCharacters(alloc, chars, v16 - (v16 > 1));
}

__CFString *_FileCacheCopyDebugDesc(unsigned int *a1)
{
  const __CFAllocator *v2;
  const __CFAllocator *v3;
  const __CFLocale *System;
  __CFDateFormatter *v5;
  __CFDateFormatter *v6;
  __CFString *Mutable;
  __CFString *v8;
  uint64_t v9;
  unsigned int v10;
  const __CFString *v11;
  const __CFString *v12;
  const __CFString *v13;
  const __CFString *v14;
  const __CFString *v15;
  const __CFString *v16;
  const __CFString *v17;
  const __CFString *v18;
  const __CFString *v19;
  const __CFString *v20;
  const __CFString *v21;
  CFStringRef StringWithAbsoluteTime;
  CFStringRef v23;
  CFStringRef v24;
  double v25;
  double v26;
  CFStringRef v27;
  double v28;
  CFStringRef v29;
  unsigned int v30;
  const __CFString *v31;
  const __CFString *v32;
  const __CFString *v33;
  const __CFString *v34;
  const UInt8 *BytePtr;
  CFIndex Length;
  CFStringRef v37;
  CFStringRef v38;
  int v39;
  uint64_t v41;
  char out[48];
  uint64_t v43;

  v43 = *MEMORY[0x1E0C80C00];
  v2 = CFGetAllocator(a1);
  _FileCacheLock((uint64_t)a1);
  v3 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
  System = CFLocaleGetSystem();
  v5 = CFDateFormatterCreate(v3, System, kCFDateFormatterNoStyle, kCFDateFormatterNoStyle);
  if (!v5)
    _FileCacheCopyDebugDesc();
  v6 = v5;
  CFDateFormatterSetFormat(v5, CFSTR("MM/dd/yyyy HH:mm:ss.SSS"));
  Mutable = CFStringCreateMutable(v2, 0);
  if (!Mutable)
    _FileCacheCopyDebugDesc();
  v8 = Mutable;
  v9 = atomic_load(a1 + 4);
  CFStringAppendFormat(Mutable, 0, CFSTR("<_FileCacheRef %p>{\n\tvalidSeed = %d\n\tattributes = (\n"), a1, v9);
  v10 = a1[12];
  if ((v10 & 1) != 0)
  {
    v11 = CFSTR("NameIsHidden");
    if ((v10 & 0x800) == 0)
      v11 = CFSTR("!NameIsHidden");
    v12 = CFSTR("FaultLogicalFileIsHidden");
    if ((v10 & 0x1000) == 0)
      v12 = CFSTR("!FaultLogicalFileIsHidden");
    v13 = CFSTR("IsMountPoint");
    if ((v10 & 0x2000) == 0)
      v13 = CFSTR("!IsMountPoint");
    v14 = CFSTR("IsTrigger");
    if ((v10 & 0x4000) == 0)
      v14 = CFSTR("!IsTrigger");
    v15 = CFSTR("HasPathFromID");
    if ((v10 & 0x8000) == 0)
      v15 = CFSTR("!HasPathFromID");
    v16 = CFSTR("Has64BitObjectIDs");
    if ((v10 & 0x10000) == 0)
      v16 = CFSTR("!Has64BitObjectIDs");
    v17 = CFSTR("HasExtendedSecurity");
    if ((v10 & 0x20000) == 0)
      v17 = CFSTR("!HasExtendedSecurity");
    v18 = CFSTR("IsHFSStandard");
    if ((v10 & 0x40000) == 0)
      v18 = CFSTR("!IsHFSStandard");
    v19 = CFSTR("HasDecmpFSCompression");
    if ((v10 & 0x80000) == 0)
      v19 = CFSTR("!HasDecmpFSCompression");
    v20 = CFSTR("SupportsHardLinks");
    if ((v10 & 0x100000) == 0)
      v20 = CFSTR("!SupportsHardLinks");
    if ((v10 & 0x200000) != 0)
      v21 = CFSTR("SupportsHiddenFiles");
    else
      v21 = CFSTR("!SupportsHiddenFiles");
    CFStringAppendFormat(v8, 0, CFSTR("\t\thasBase\n\t\t\t%@\n\t\t\t%@\n\t\t\t%@\n\t\t\t%@\n\t\t\t%@\n\t\t\t%@\n\t\t\t%@\n\t\t\t%@\n\t\t\t%@\n\t\t\t%@\n\t\t\t%@\n\t\t\t"), v11, v12, v13, v14, v15, v16, v17, v18, v19, v20, v21);
    CFStringAppendFormat(v8, 0, CFSTR("Name = <CFString %p> %@\n\t\t\tAccessMask = 0%.4lo\n\t\t\tFlags = %lu\n\t\t\tDirFileLinkCount = %lu\n\t\t\tGenCount = %lu\n\t\t\tDocumentID = %lu\n\t\t\tOwnerID = %d\n\t\t\tGrpID = %d\n\t\t\t"), *((_QWORD *)a1 + 7), *((_QWORD *)a1 + 7), a1[16], a1[17], a1[18], a1[20], a1[21], a1[22], a1[23]);
    if ((*((_BYTE *)a1 + 51) & 8) != 0)
      CFStringAppendFormat(v8, 0, CFSTR("extensionLength = %hu\n\t\t\t"), *((unsigned __int16 *)a1 + 26));
    CFStringAppendFormat(v8, 0, CFSTR("DataProtectFlags = %lu\n\t\t\t"), a1[24]);
    StringWithAbsoluteTime = CFDateFormatterCreateStringWithAbsoluteTime(v3, v6, *((CFAbsoluteTime *)a1 + 13));
    CFStringAppendFormat(v8, 0, CFSTR("AccTime = %@\n\t\t\t"), StringWithAbsoluteTime);
    if (StringWithAbsoluteTime)
      CFRelease(StringWithAbsoluteTime);
    v23 = CFDateFormatterCreateStringWithAbsoluteTime(v3, v6, *((CFAbsoluteTime *)a1 + 14));
    CFStringAppendFormat(v8, 0, CFSTR("ModTime = %@\n\t\t\t"), v23);
    if (v23)
      CFRelease(v23);
    v24 = CFDateFormatterCreateStringWithAbsoluteTime(v3, v6, *((CFAbsoluteTime *)a1 + 15));
    CFStringAppendFormat(v8, 0, CFSTR("ChgTime = %@\n\t\t\t"), v24);
    if (v24)
      CFRelease(v24);
    v25 = *((double *)a1 + 16);
    v26 = -1.0 - *MEMORY[0x1E0C9ADE8];
    if (v25 == v26)
    {
      CFStringAppend(v8, CFSTR("CrTime  = <n/a>\n\t\t\t"));
    }
    else
    {
      v27 = CFDateFormatterCreateStringWithAbsoluteTime(v3, v6, v25);
      CFStringAppendFormat(v8, 0, CFSTR("CrTime  = %@\n\t\t\t"), v27);
      if (v27)
        CFRelease(v27);
    }
    v28 = *((double *)a1 + 17);
    if (v28 == v26)
    {
      CFStringAppend(v8, CFSTR("AddedTime = <n/a>\n\t\t\t"));
    }
    else
    {
      v29 = CFDateFormatterCreateStringWithAbsoluteTime(v3, v6, v28);
      CFStringAppendFormat(v8, 0, CFSTR("AddedTime = %@\n\t\t\t"), v29);
      if (v29)
        CFRelease(v29);
    }
    CFStringAppendFormat(v8, 0, CFSTR("IOBlockSize = %lu"), a1[36]);
    CFStringAppend(v8, CFSTR("\n"));
    CFStringAppendFormat(v8, 0, CFSTR("\t\thasDevice\n\t\t\tFSID = {0x%.8x 0x%.8x}\n\t\t\tVolumeID = %lu\n"), a1[38], a1[39], a1[40]);
    v30 = a1[12];
    if ((v30 & 4) != 0)
    {
      CFStringAppendFormat(v8, 0, CFSTR("\t\thasFileIDs\n\t\t\tInodeNumber = %llu\n\t\t\tFileID = %llu\n\t\t\tParentID = %llu\n"), *((_QWORD *)a1 + 21), *((_QWORD *)a1 + 22), *((_QWORD *)a1 + 23));
      v30 = a1[12];
      if ((v30 & 8) == 0)
      {
LABEL_47:
        if ((v30 & 0x10) == 0)
          goto LABEL_48;
        goto LABEL_62;
      }
    }
    else if ((v30 & 8) == 0)
    {
      goto LABEL_47;
    }
    v31 = CFSTR("userAccessExecuteOK");
    if ((v30 & 0x800000) == 0)
      v31 = CFSTR("!userAccessExecuteOK");
    v32 = CFSTR("userAccessWriteOK");
    if ((v30 & 0x1000000) == 0)
      v32 = CFSTR("!userAccessWriteOK");
    if ((v30 & 0x2000000) != 0)
      v33 = CFSTR("userAccessReadOK");
    else
      v33 = CFSTR("!userAccessReadOK");
    CFStringAppendFormat(v8, 0, CFSTR("\t\thasUserAccess\n\t\t\t%@\n\t\t\t%@\n\t\t\t%@\n"), v31, v32, v33);
    v30 = a1[12];
    if ((v30 & 0x10) == 0)
    {
LABEL_48:
      if ((v30 & 0x20) == 0)
        goto LABEL_49;
      goto LABEL_66;
    }
LABEL_62:
    if ((v30 & 0x4000000) != 0)
      v34 = CFSTR("finderInfoZeros");
    else
      v34 = CFSTR("!finderInfoZeros");
    CFStringAppendFormat(v8, 0, CFSTR("\t\thasFinderInfo\n\t\t\t%@\n\t\t\tfinderInfo    = %.2x %.2x %.2x %.2x  %.2x %.2x %.2x %.2x  %.2x %.2x %.2x %.2x  %.2x %.2x %.2x %.2x\n\t\t\textFinderInfo = %.2x %.2x %.2x %.2x  %.2x %.2x %.2x %.2x  %.2x %.2x %.2x %.2x  %.2x %.2x %.2x %.2x\n"), v34, *((unsigned __int8 *)a1 + 208), *((unsigned __int8 *)a1 + 209), *((unsigned __int8 *)a1 + 210), *((unsigned __int8 *)a1 + 211), *((unsigned __int8 *)a1 + 212), *((unsigned __int8 *)a1 + 213), *((unsigned __int8 *)a1 + 214), *((unsigned __int8 *)a1 + 215), *((unsigned __int8 *)a1 + 216), *((unsigned __int8 *)a1 + 217), *((unsigned __int8 *)a1 + 218), *((unsigned __int8 *)a1 + 219), *((unsigned __int8 *)a1 + 220), *((unsigned __int8 *)a1 + 221), *((unsigned __int8 *)a1 + 222),
      *((unsigned __int8 *)a1 + 223),
      *((unsigned __int8 *)a1 + 224),
      *((unsigned __int8 *)a1 + 225),
      *((unsigned __int8 *)a1 + 226),
      *((unsigned __int8 *)a1 + 227),
      *((unsigned __int8 *)a1 + 228),
      *((unsigned __int8 *)a1 + 229),
      *((unsigned __int8 *)a1 + 230),
      *((unsigned __int8 *)a1 + 231),
      *((unsigned __int8 *)a1 + 232),
      *((unsigned __int8 *)a1 + 233),
      *((unsigned __int8 *)a1 + 234),
      *((unsigned __int8 *)a1 + 235),
      *((unsigned __int8 *)a1 + 236),
      *((unsigned __int8 *)a1 + 237),
      *((unsigned __int8 *)a1 + 238),
      *((unsigned __int8 *)a1 + 239),
      *((unsigned __int8 *)a1 + 215),
      *((unsigned __int8 *)a1 + 214),
      *((unsigned __int8 *)a1 + 213),
      *((unsigned __int8 *)a1 + 212),
      *((unsigned __int8 *)a1 + 211));
    v30 = a1[12];
    if ((v30 & 0x20) == 0)
    {
LABEL_49:
      if ((v30 & 0x40) == 0)
        goto LABEL_50;
      goto LABEL_67;
    }
LABEL_66:
    CFStringAppendFormat(v8, 0, CFSTR("\t\thasRsrcInfo\n\t\t\trsrcLength = %llu\n\t\t\trsrcAllocSize = %llu\n"), *((_QWORD *)a1 + 30), *((_QWORD *)a1 + 31));
    v30 = a1[12];
    if ((v30 & 0x40) == 0)
    {
LABEL_50:
      if ((v30 & 0x80) == 0)
        goto LABEL_51;
      goto LABEL_68;
    }
LABEL_67:
    CFStringAppendFormat(v8, 0, CFSTR("\t\thasFileDataLength\n\t\t\tFileDataLength = %llu\n\t\t\tFileDataAllocSize = %llu\n"), *((_QWORD *)a1 + 32), *((_QWORD *)a1 + 33));
    v30 = a1[12];
    if ((v30 & 0x80) == 0)
    {
LABEL_51:
      if ((v30 & 0x100) == 0)
        goto LABEL_70;
LABEL_69:
      CFStringAppendFormat(v8, 0, CFSTR("\t\thasFullPath\n\t\t\t<CFString %p> %@\n"), *((_QWORD *)a1 + 35), *((_QWORD *)a1 + 35), v41);
      goto LABEL_70;
    }
LABEL_68:
    CFStringAppendFormat(v8, 0, CFSTR("\t\thasFileSecurity\n\t\t\t%@\n"), *((_QWORD *)a1 + 34));
    if ((a1[12] & 0x100) == 0)
      goto LABEL_70;
    goto LABEL_69;
  }
  if ((v10 & 2) != 0)
    CFStringAppendFormat(v8, 0, CFSTR("\t\thasDevice\n\t\t\tFSID = {0x%.8x 0x%.8x}\n\t\t\tVolumeID = %lu\n"), a1[38], a1[39], a1[40]);
LABEL_70:
  CFStringAppend(v8, CFSTR("\t)\n"));
  CFStringAppendFormat(v8, 0, CFSTR("\tpropertyValues = %@\n\ttemporaryPropertyValues = %@\n\tpermanentPropertyValues = %@\n\tvolumeInfo = %@\n"), *((_QWORD *)a1 + 36), *((_QWORD *)a1 + 37), *((_QWORD *)a1 + 38), *((_QWORD *)a1 + 39));
  if (*((_QWORD *)a1 + 39))
  {
    CFStringAppend(v8, CFSTR("\tvolumeInfo = (\n"));
    BytePtr = CFDataGetBytePtr(*((CFDataRef *)a1 + 39));
    Length = CFDataGetLength(*((CFDataRef *)a1 + 39));
    if (*(_QWORD *)BytePtr != -1)
      CFStringAppendFormat(v8, 0, CFSTR("\t\tvolFileCount = %llu\n\t\tvolDirCount = %llu\n\t\tvolSize = %llu\n\t\tvolSpaceAvail = %llu\n"), *(_QWORD *)BytePtr, *((_QWORD *)BytePtr + 1), *((_QWORD *)BytePtr + 2), *((_QWORD *)BytePtr + 3));
    CFStringAppendFormat(v8, 0, CFSTR("\t\tflags = 0x%llx\n"), *((_QWORD *)BytePtr + 4));
    v37 = CFDateFormatterCreateStringWithAbsoluteTime(v3, v6, *((CFAbsoluteTime *)BytePtr + 5));
    CFStringAppendFormat(v8, 0, CFSTR("\t\tcreationDate = %@\n"), v37);
    if (v37)
      CFRelease(v37);
    CFStringAppendFormat(v8, 0, CFSTR("\t\tmaxFileSize = %llu\n"), *((_QWORD *)BytePtr + 6));
    if (Length == 72)
    {
      memset(out, 0, 37);
      uuid_unparse_upper(BytePtr + 56, out);
      v38 = CFStringCreateWithCString(v2, out, 0x8000100u);
      CFStringAppendFormat(v8, 0, CFSTR("\t\tuuid = %@\n"), v38);
      if (v38)
        CFRelease(v38);
    }
    CFStringAppend(v8, CFSTR("\t)\n"));
  }
  CFStringAppend(v8, CFSTR("}"));
  CFRelease(v6);
  v39 = a1[8] - 1;
  a1[8] = v39;
  if (!v39)
  {
    *((_QWORD *)a1 + 3) = 0;
    os_unfair_lock_unlock((os_unfair_lock_t)a1 + 9);
  }
  return v8;
}

uint64_t _FileCacheGetTypeID()
{
  initGlobalsOnce();
  return sFileCacheTypeID;
}

uint64_t _FileCacheSetAutoFlushingEnabled(uint64_t result, int a2)
{
  unsigned int *v2;
  int v3;
  unsigned int v4;
  unsigned int v5;
  unsigned int v6;

  v2 = (unsigned int *)(result + 16);
  v3 = atomic_load((unsigned int *)(result + 16));
  if (a2)
  {
    if (v3 <= -2)
    {
      do
        v4 = __ldaxr(v2);
      while (__stlxr(v4 + 1, v2));
    }
  }
  else if (v3 < 0)
  {
    v5 = atomic_load(v2);
    if (v5 != 0x80000000)
    {
      do
        v6 = __ldaxr(v2);
      while (__stlxr(v6 - 1, v2));
    }
  }
  else
  {
    atomic_store(0xFFFFFFFE, v2);
  }
  return result;
}

uint64_t _FileCachePreparerLock(const os_unfair_lock *a1)
{
  os_unfair_lock_assert_not_owner(a1 + 10);
  return os_unfair_recursive_lock_lock_with_options();
}

uint64_t _FileCachePreparerUnlock()
{
  return os_unfair_recursive_lock_unlock();
}

uint64_t FileCachePropertyValueEqualCallBack(unint64_t cf1, unint64_t a2)
{
  uint64_t result;

  if (!(cf1 | a2))
    return 1;
  result = 0;
  if (cf1)
  {
    if (a2)
      return CFEqual((CFTypeRef)cf1, (CFTypeRef)a2);
  }
  return result;
}

const __CFData *_CFURLCreateBookmarkDataFromFile(CFAllocatorRef allocator, const __CFURL *a2, CFErrorRef *a3)
{
  const __CFAllocator *v6;
  __CFReadStream *v7;
  __CFReadStream *v8;
  BOOL v11;
  const __CFData *Mutable;
  CFErrorRef v13;
  __CFError *v14;
  __CFError *v15;
  const __CFString *Domain;
  CFIndex Code;
  _BOOL4 v18;
  unsigned int v20;
  unsigned int v21;
  UInt8 *MutableBytePtr;
  CFNumberRef v23;
  unsigned int v24;
  UInt8 *v25;
  CFIndex v26;
  CFDataRef Copy;
  _DWORD v28[4];
  uint64_t v29;
  UInt8 buffer[4];
  int v31;
  int v32;
  int v33;
  int v34;
  unsigned int v35[8];
  __CFError *v36;
  CFDataRef v37;

  v36 = 0;
  v37 = 0;
  if (!a2)
  {
    if (!a3)
      return 0;
    goto LABEL_29;
  }
  v6 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
  v7 = CFReadStreamCreateWithFile((CFAllocatorRef)*MEMORY[0x1E0C9AE00], a2);
  if (!v7)
  {
    v13 = 0;
    Mutable = 0;
    goto LABEL_26;
  }
  v8 = v7;
  if (CFReadStreamOpen(v7))
  {
    v11 = CFReadStreamRead(v8, buffer, 56) == 56 && *(_DWORD *)buffer == 1802465122 && v32 == 1802658157 && v31 == 0;
    if (v11 && !v33 && v35[0] <= 0xFFFFFFE && bookmarkVersionOK(v35[1]))
    {
      Mutable = CFDataCreateMutable(allocator, v35[0] + 16);
      v21 = v35[0];
      v20 = v35[1];
      if (!CFDataIncreaseLengthSafe(Mutable, 16)
        || (MutableBytePtr = CFDataGetMutableBytePtr(Mutable),
            *(_DWORD *)MutableBytePtr = 1802465122,
            *((_DWORD *)MutableBytePtr + 1) = v21 + 16,
            *((_DWORD *)MutableBytePtr + 2) = v20,
            *((_DWORD *)MutableBytePtr + 3) = 16,
            !CFDataIncreaseLengthSafe(Mutable, v35[0])))
      {
        if (a3)
          v13 = CFErrorCreate(allocator, (CFErrorDomain)*MEMORY[0x1E0C9AFB8], 263, 0);
        else
          v13 = 0;
LABEL_68:
        if (Mutable)
        {
          BookmarkData::BookmarkData((BookmarkData *)v28, allocator, Mutable);
          if (v29)
          {
            Copy = CFDataCreateCopy(allocator, Mutable);
            if (v37 != Copy)
            {
              if (v37)
                CFRelease(v37);
              v37 = Copy;
            }
          }
          else if (a3 && !v13)
          {
            v13 = CFErrorCreate(allocator, (CFErrorDomain)*MEMORY[0x1E0C9AFB8], 259, 0);
          }
          BookmarkData::~BookmarkData((BookmarkData *)v28);
          CFRelease(Mutable);
          v15 = v36;
          Mutable = v37;
        }
        else
        {
          v15 = 0;
        }
        CFReadStreamClose(v8);
        goto LABEL_23;
      }
      v28[0] = v34;
      v23 = CFNumberCreate(v6, kCFNumberSInt32Type, v28);
      CFReadStreamSetProperty(v8, (CFStreamPropertyKey)*MEMORY[0x1E0C9B2B0], v23);
      if (v35[0])
      {
        v24 = 0;
        while (1)
        {
          v25 = CFDataGetMutableBytePtr(Mutable);
          v26 = CFReadStreamRead(v8, &v25[v24 + 16], v35[0] - v24);
          if (v26 <= 0)
            break;
          v24 += v26;
          if (v24 >= v35[0])
            goto LABEL_65;
        }
        if (Mutable)
          CFRelease(Mutable);
        if (a3)
        {
          v13 = CFErrorCreate(allocator, (CFErrorDomain)*MEMORY[0x1E0C9AFB8], 259, 0);
          Mutable = 0;
          goto LABEL_66;
        }
        Mutable = 0;
      }
LABEL_65:
      v13 = 0;
LABEL_66:
      if (v23)
        CFRelease(v23);
      goto LABEL_68;
    }
    CFReadStreamClose(v8);
    goto LABEL_21;
  }
  if (!a3)
  {
LABEL_21:
    v15 = 0;
    goto LABEL_22;
  }
  v14 = CFReadStreamCopyError(v8);
  v15 = v14;
  if (!v14)
  {
LABEL_22:
    Mutable = 0;
    v13 = 0;
    goto LABEL_23;
  }
  Domain = CFErrorGetDomain(v14);
  Code = CFErrorGetCode(v15);
  v13 = _FSURLCreateStandardError(v6, Domain, Code, 1, (const __CFString *)a2, 0);
  CFRelease(v15);
  v15 = 0;
  Mutable = 0;
LABEL_23:
  CFRelease(v8);
  if (!Mutable && v15)
  {
    CFReleaser<__CFData const*>::operator=((const void **)&v37, (CFTypeRef *)&v36);
    Mutable = v37;
  }
LABEL_26:
  v18 = a3 != 0;
  if (a3 && !Mutable && !v13)
  {
LABEL_29:
    v13 = CFErrorCreate(allocator, (CFErrorDomain)*MEMORY[0x1E0C9AFB8], 256, 0);
    v18 = 1;
    Mutable = v37;
  }
  if (v18 && !Mutable)
  {
    if (v13)
    {
      Mutable = 0;
      *a3 = v13;
    }
    else
    {
      if (!*a3)
      {
        if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
          _CFURLCreateBookmarkDataFromFile_cold_1();
        v13 = 0;
        *a3 = CFErrorCreate((CFAllocatorRef)*MEMORY[0x1E0C9AE00], (CFErrorDomain)*MEMORY[0x1E0C9AFB8], 256, 0);
        Mutable = v37;
        goto LABEL_37;
      }
      Mutable = 0;
    }
    v13 = 0;
  }
LABEL_37:
  v37 = 0;
  if (v36)
    CFRelease(v36);
  if (v13)
    CFRelease(v13);
  if (v37)
    CFRelease(v37);
  return Mutable;
}

BOOL CFDataIncreaseLengthSafe(__CFData *a1, CFIndex a2)
{
  CFIndex Length;
  CFIndex v5;

  Length = CFDataGetLength(a1);
  CFDataIncreaseLength(a1, a2);
  v5 = CFDataGetLength(a1);
  return v5 >= Length && v5 >= Length + a2 && a2 >= 0;
}

const void **CFReleaser<__CFData const*>::operator=(const void **a1, CFTypeRef *a2)
{
  const void *v4;
  CFTypeRef v5;

  v4 = *a1;
  if (v4)
    CFRelease(v4);
  if (*a2)
  {
    CFRetain(*a2);
    v5 = *a2;
  }
  else
  {
    v5 = 0;
  }
  *a1 = v5;
  return a1;
}

uint64_t _CFURLWriteBookmarkDataToFile(__CFData *a1, const __CFString *a2, uint64_t a3, _QWORD *a4)
{
  const __CFAllocator *v6;
  int v7;
  __CFError *v8;
  NSObject *v9;
  NSObject *v10;
  uint64_t v11;
  char v12;
  CFErrorDomain Domain;
  const __CFString *v14;
  const __CFString *v15;
  CFIndex Code;
  CFErrorRef v17;
  char v18;
  __CFWriteStream *v19;
  __CFWriteStream *v20;
  int v21;
  _BOOL4 v22;
  CFIndex v23;
  int v25;
  __CFData *Mutable;
  __CFData *v27;
  char v28;
  UInt8 v30[8];
  uint64_t v31;
  UInt8 bytes[8];
  uint64_t v33;
  uint64_t v34;
  unsigned int v35;
  _BYTE v36[16];
  uint64_t v37;
  uint64_t v38;
  unsigned int v39;
  unsigned int v40;
  UInt8 buffer[16];
  uint64_t v42;
  unsigned int v43;
  int v44;
  int v45;
  CFAbsoluteTime Current;
  int v47;
  uint64_t v48;

  v48 = *MEMORY[0x1E0C80C00];
  v6 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
  BookmarkData::BookmarkData((BookmarkData *)v36, (const __CFAllocator *)*MEMORY[0x1E0C9AE00], a1);
  v35 = 0;
  if (!a2 || !v37 || !BookmarkData::getItemAs((BookmarkData *)v36, 0xD010u, 1, &v35) || (v35 & 0x400) == 0 || v40 >> 28)
  {
    v8 = 0;
    goto LABEL_12;
  }
  v34 = 0;
  v7 = _CFURLGetResourcePropertyFlags();
  if (v7 && ((v7 != 0) & v34) == 0)
  {
    v8 = _FSURLCreateStandardError(v6, (const __CFString *)*MEMORY[0x1E0C9AFB8], 512, 1, a2, 0);
    v9 = bmarkLog;
    if (os_log_type_enabled((os_log_t)bmarkLog, OS_LOG_TYPE_ERROR))
      _CFURLWriteBookmarkDataToFile_cold_2((uint64_t)a2, (uint64_t)v8, v9);
    CFURLClearResourcePropertyCache((CFURLRef)a2);
    goto LABEL_12;
  }
  v19 = CFWriteStreamCreateWithFile(v6, (CFURLRef)a2);
  if (v19)
  {
    v20 = v19;
    if (CFWriteStreamOpen(v19))
    {
      *(_OWORD *)buffer = xmmword_1817D5070;
      v42 = 0x3800000038;
      v43 = v40;
      v21 = v37;
      if (v37)
        v21 = *(_DWORD *)(v37 + 8);
      v44 = v21;
      v45 = 0;
      Current = CFAbsoluteTimeGetCurrent();
      v47 = 0;
      v22 = 0;
      if (CFWriteStreamWrite(v20, buffer, 56) == 56)
      {
        v23 = CFWriteStreamWrite(v20, (const UInt8 *)(v38 + v39), v40);
        v22 = v23 >= 0 && v40 == (_DWORD)v23;
      }
      v8 = 0;
      if (a4)
      {
        if (!v22)
        {
          v8 = CFWriteStreamCopyError(v20);
          if (!v8)
            v8 = CFErrorCreate(v6, (CFErrorDomain)*MEMORY[0x1E0C9AFB8], 640, 0);
        }
      }
      v25 = !v22;
    }
    else
    {
      if (a4)
        v8 = CFWriteStreamCopyError(v20);
      else
        v8 = 0;
      v25 = 0;
      v22 = 0;
    }
    CFWriteStreamClose(v20);
    CFRelease(v20);
  }
  else
  {
    v22 = 0;
    v25 = 0;
    v8 = 0;
  }
  if (!CFURLGetFileSystemRepresentation((CFURLRef)a2, 1u, buffer, 1024))
    buffer[0] = 0;
  if (v22)
  {
    if (v7 && buffer[0])
      removexattr((const char *)buffer, "com.apple.ResourceFork", 1);
    Mutable = CFDataCreateMutable(v6, 32);
    if (Mutable)
    {
      v27 = Mutable;
      *(_QWORD *)bytes = 0;
      *(_QWORD *)v30 = 0;
      v31 = 0;
      v33 = 0x8000;
      CFDataAppendBytes(Mutable, bytes, 16);
      CFDataAppendBytes(v27, v30, 16);
      CFURLSetResourcePropertyForKey((CFURLRef)a2, (CFStringRef)*MEMORY[0x1E0C9AC60], v27, 0);
      CFRelease(v27);
    }
  }
  if (v25 && !v7 && buffer[0])
    removefile((const char *)buffer, 0, 0);
  CFURLClearResourcePropertyCache((CFURLRef)a2);
  if (!v22)
  {
LABEL_12:
    v10 = bmarkLog;
    if (os_log_type_enabled((os_log_t)bmarkLog, OS_LOG_TYPE_ERROR))
      _CFURLWriteBookmarkDataToFile_cold_1((uint64_t)a2, (uint64_t)v8, v10);
    v11 = 0;
    v12 = 1;
    if (v8)
      goto LABEL_15;
    goto LABEL_61;
  }
  v12 = 0;
  v11 = 1;
  if (v8)
  {
LABEL_15:
    Domain = CFErrorGetDomain(v8);
    v14 = (const __CFString *)*MEMORY[0x1E0C9AFB8];
    if (!CFEqual(Domain, (CFTypeRef)*MEMORY[0x1E0C9AFB8]))
    {
      v15 = CFErrorGetDomain(v8);
      Code = CFErrorGetCode(v8);
      v17 = _FSURLCreateStandardError(v6, v15, Code, 1, a2, 0);
      CFRelease(v8);
      v8 = v17;
    }
    if (a4)
      v18 = v12;
    else
      v18 = 0;
    if ((v18 & 1) != 0)
    {
      if (v8)
      {
        *a4 = CFRetain(v8);
LABEL_24:
        CFRelease(v8);
        goto LABEL_66;
      }
LABEL_65:
      *a4 = CFErrorCreate(v6, v14, 512, 0);
      goto LABEL_66;
    }
    if (v8)
      goto LABEL_24;
    goto LABEL_66;
  }
LABEL_61:
  v28 = v12 ^ 1;
  if (!a4)
    v28 = 1;
  if ((v28 & 1) == 0)
  {
    v14 = (const __CFString *)*MEMORY[0x1E0C9AFB8];
    goto LABEL_65;
  }
LABEL_66:
  BookmarkData::~BookmarkData((BookmarkData *)v36);
  return v11;
}

uint64_t CFBookmarkPropertyKeyToKnownType(CFTypeRef cf2)
{
  __int128 v3;

  if (BookmarkResourcePropertyKeyToInfoStructInit(void)::onceToken != -1)
    dispatch_once(&BookmarkResourcePropertyKeyToInfoStructInit(void)::onceToken, &__block_literal_global_1);
  if (GetBookmarkResourcePropertyToInfo(cf2, &v3))
    return DWORD2(v3);
  else
    return 0;
}

uint64_t GetBookmarkResourcePropertyToInfo(CFTypeRef cf2, _OWORD *a2)
{
  uint64_t v4;
  unint64_t v5;
  uint64_t result;
  __int128 v8;

  if (BookmarkResourcePropertyKeyToInfoStructInit(void)::onceToken != -1)
    dispatch_once(&BookmarkResourcePropertyKeyToInfoStructInit(void)::onceToken, &__block_literal_global_1);
  if (sResourcePropertiesInfoCount != 1)
    return 0;
  v4 = 0;
  v5 = 0;
  while (1)
  {
    result = CFEqual(*(CFTypeRef *)(sResourcePropertiesInfoPtr + v4), cf2);
    if ((_DWORD)result)
      break;
    if (sResourcePropertiesInfoCount == 1)
    {
      v4 += 32;
      if (v5++ <= 0x44)
        continue;
    }
    return result;
  }
  if (a2)
  {
    v8 = *(_OWORD *)(sResourcePropertiesInfoPtr + v4 + 16);
    *a2 = *(_OWORD *)(sResourcePropertiesInfoPtr + v4);
    a2[1] = v8;
  }
  return 1;
}

uint64_t CFBookmarkPropertyEnumToStringKey(int a1)
{
  _DWORD *v2;
  uint64_t v3;

  if (BookmarkResourcePropertyKeyToInfoStructInit(void)::onceToken != -1)
    dispatch_once(&BookmarkResourcePropertyKeyToInfoStructInit(void)::onceToken, &__block_literal_global_1);
  if (sResourcePropertiesInfoCount != 1)
    return 0;
  v2 = (_DWORD *)(sResourcePropertiesInfoPtr + 8);
  v3 = -1;
  while (*v2 != a1)
  {
    v2 += 8;
    if ((unint64_t)++v3 > 0x44)
      return 0;
  }
  return *((_QWORD *)v2 - 1);
}

BOOL bookmarkHasPathComponents(BookmarkData *a1, int a2)
{
  return BookmarkData::findItemInTOC(a1, 0x1004u, a2) != 0;
}

_DWORD *countPathComponents(BookmarkData *a1, int a2)
{
  _DWORD *result;

  result = (_DWORD *)BookmarkData::findItemInTOC(a1, 0x1004u, a2);
  if (result)
  {
    result = BookmarkData::getDataItemForTOCItem(a1, (uint64_t)result);
    if (result)
    {
      if (result[1] == 1537)
        return (_DWORD *)(*result >> 2);
      else
        return 0;
    }
  }
  return result;
}

CFNumberRef copyIndexedPathComponent(BookmarkData *a1, int a2, unsigned int a3)
{
  uint64_t ItemInTOC;
  unsigned int *DataItemForTOCItem;
  unsigned int *DataItemAtOffset;
  unsigned int *v8;
  CFTypeID TypeID;

  ItemInTOC = BookmarkData::findItemInTOC(a1, 0x1004u, a2);
  if (!ItemInTOC)
    return 0;
  DataItemForTOCItem = BookmarkData::getDataItemForTOCItem(a1, ItemInTOC);
  if (!DataItemForTOCItem)
    return 0;
  if (DataItemForTOCItem[1] != 1537)
    return 0;
  if (a3 >= *DataItemForTOCItem >> 2)
    return 0;
  DataItemAtOffset = BookmarkData::getDataItemAtOffset(a1, DataItemForTOCItem[a3 + 2]);
  if (!DataItemAtOffset)
    return 0;
  v8 = DataItemAtOffset;
  TypeID = CFStringGetTypeID();
  return BookmarkData::copyItem((CFAllocatorRef *)a1, v8, TypeID);
}

const __CFString *copyPathComponentsAsString(BookmarkData *a1, int a2, int a3, char a4)
{
  unsigned int v8;
  unsigned int v9;
  const __CFAllocator *v10;
  int v11;
  CFNumberRef v12;
  BOOL v13;
  const __CFString *v14;
  char v15;
  unsigned int v16;
  CFIndex v17;
  CFIndex Length;
  CFIndex v19;
  CFIndex v20;
  UniChar *v21;
  const __CFString *result;
  CFIndex v23;
  CFIndex v24;
  _BYTE v25[24];
  UniChar chars[1024];
  CFIndex numChars;
  CFMutableStringRef theString;
  CFRange v29;

  v8 = countPathComponents(a1, a2);
  if (v8)
  {
    v9 = v8;
    v10 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
    numChars = 0;
    theString = CFStringCreateMutable(v10, 0);
    v11 = v9 & (a3 >> 31);
    if (v11 + a3 >= v9)
    {
      v13 = 1;
    }
    else
    {
      v12 = copyIndexedPathComponent(a1, a2, v11 + a3);
      v13 = v12 == 0;
      if (v12)
      {
        v14 = (const __CFString *)v12;
        v15 = a4 ^ 1;
        if (v11 + a3)
          v15 = 1;
        v16 = v11 + a3 + 1;
        do
        {
          if ((v15 & 1) == 0)
          {
            v17 = numChars;
            if (numChars >= 1024)
            {
              CFStringAppendCharacters(theString, chars, numChars);
              v17 = 0;
              numChars = 0;
            }
            chars[v17] = 47;
            ++numChars;
          }
          Length = CFStringGetLength(v14);
          v19 = numChars;
          if (Length < 1025)
          {
            v20 = Length;
            if (numChars + Length >= 1025)
            {
              CFStringAppendCharacters(theString, chars, numChars);
              v19 = 0;
              numChars = 0;
            }
            v21 = &chars[v19];
            v29.location = 0;
            v29.length = v20;
            CFStringGetCharacters(v14, v29, v21);
            numChars += v20;
          }
          else
          {
            if (numChars)
            {
              CFStringAppendCharacters(theString, chars, numChars);
              numChars = 0;
            }
            CFStringAppend(theString, v14);
          }
          CFRelease(v14);
          if (v16 >= v9)
            break;
          v14 = (const __CFString *)copyIndexedPathComponent(a1, a2, v16);
          v15 = 0;
          ++v16;
        }
        while (v14);
      }
    }
    if (BookmarkData::getURLResourceProperties(a1, a2, (uint64_t)v25) && (v25[8] & 2) != 0 && (v25[0] & 2) != 0)
    {
      v24 = numChars;
      if (numChars >= 1024)
      {
        CFStringAppendCharacters(theString, chars, numChars);
        v24 = 0;
        numChars = 0;
      }
      chars[v24] = 47;
      v23 = numChars + 1;
      numChars = v23;
      if (!v23)
        return theString;
    }
    else
    {
      if (v13)
      {
        result = theString;
        if (theString)
        {
          CFRelease(theString);
          return 0;
        }
        return result;
      }
      v23 = numChars;
      if (!numChars)
        return theString;
    }
    CFStringAppendCharacters(theString, chars, v23);
    return theString;
  }
  if (a3)
    return &stru_1E0F0BB40;
  else
    return CFSTR("/");
}

CFArrayRef copyPathComponentsAsArray(BookmarkData *a1, int a2, unsigned int a3)
{
  unsigned int v6;
  CFMutableArrayRef Mutable;
  __CFArray *v8;
  BOOL v9;
  CFArrayRef Copy;
  CFNumberRef v11;
  CFNumberRef v12;

  v6 = countPathComponents(a1, a2);
  Mutable = CFArrayCreateMutable(*(CFAllocatorRef *)a1, 0, MEMORY[0x1E0C9B378]);
  v8 = Mutable;
  if (Mutable)
    v9 = v6 > a3;
  else
    v9 = 0;
  if (v9)
  {
    while (1)
    {
      v11 = copyIndexedPathComponent(a1, a2, a3);
      if (!v11)
        break;
      v12 = v11;
      CFArrayAppendValue(v8, v11);
      CFRelease(v12);
      if (++a3 >= v6)
        goto LABEL_9;
    }
    Copy = 0;
    goto LABEL_11;
  }
  if (Mutable)
  {
LABEL_9:
    Copy = CFArrayCreateCopy(*(CFAllocatorRef *)a1, v8);
LABEL_11:
    CFRelease(v8);
    return Copy;
  }
  return 0;
}

const __CFArray *copyVolumePathComponentsAsArray(BookmarkData *a1, unsigned int a2)
{
  const __CFArray *ArrayOfPathComponentsFromString;
  CFTypeID TypeID;
  const __CFString *v6;
  CFTypeID v7;
  const __CFString *v9;
  BOOL v10;

  v10 = 0;
  if (!BookmarkData::getItemAs(a1, 0x2030u, a2, &v10)
    || !v10
    || (v9 = CFSTR("/"),
        (ArrayOfPathComponentsFromString = CFArrayCreate((CFAllocatorRef)*MEMORY[0x1E0C9AE00], (const void **)&v9, 1, MEMORY[0x1E0C9B378])) == 0))
  {
    TypeID = CFStringGetTypeID();
    v6 = (const __CFString *)BookmarkData::copyItem(a1, 0x2002u, a2, TypeID);
    ArrayOfPathComponentsFromString = createArrayOfPathComponentsFromString(*(const __CFAllocator **)a1, v6, 0);
    if (v6)
      CFRelease(v6);
    if (!ArrayOfPathComponentsFromString)
    {
      v7 = CFArrayGetTypeID();
      return (const __CFArray *)BookmarkData::copyItem(a1, 0x2004u, a2, v7);
    }
  }
  return ArrayOfPathComponentsFromString;
}

CFDictionaryRef _CFURLCreateResourcePropertiesForKeysFromBookmarkData(const __CFAllocator *a1, CFTypeRef cf, const void *a3)
{
  CFTypeID v6;
  CFTypeID TypeID;
  CFDictionaryRef Copy;
  CFTypeID v9;
  CFIndex Count;
  __CFDictionary *Mutable;
  CFIndex v12;
  unint64_t v13;
  const __CFString *ValueAtIndex;
  const __CFString *v15;
  CFTypeID v16;
  CFNumberRef v17;
  CFNumberRef v18;
  _BYTE v20[16];
  uint64_t v21;

  if (!cf)
    return 0;
  v6 = CFGetTypeID(cf);
  TypeID = CFArrayGetTypeID();
  Copy = 0;
  if (!a3 || v6 != TypeID)
    return Copy;
  v9 = CFGetTypeID(a3);
  if (v9 != CFDataGetTypeID())
    return 0;
  BookmarkData::BookmarkData((BookmarkData *)v20, a1, (const __CFData *)a3);
  if (v21)
  {
    Count = CFArrayGetCount((CFArrayRef)cf);
    Mutable = CFDictionaryCreateMutable(a1, Count, MEMORY[0x1E0C9B390], MEMORY[0x1E0C9B3A0]);
    v12 = CFArrayGetCount((CFArrayRef)cf);
    if (v12 >= 1)
    {
      v13 = v12 + 1;
      do
      {
        ValueAtIndex = (const __CFString *)CFArrayGetValueAtIndex((CFArrayRef)cf, v13 - 2);
        if (ValueAtIndex)
        {
          v15 = ValueAtIndex;
          v16 = CFGetTypeID(ValueAtIndex);
          if (v16 == CFStringGetTypeID() && !CFDictionaryContainsKey(Mutable, v15))
          {
            v17 = BookmarkCopyPropertyFromBookmarkData((BookmarkData *)v20, v15, 0);
            if (v17)
            {
              v18 = v17;
              CFDictionaryAddValue(Mutable, v15, v17);
              CFRelease(v18);
            }
          }
        }
        --v13;
      }
      while (v13 > 1);
    }
    Copy = CFDictionaryCreateCopy(a1, Mutable);
    if (Mutable)
      CFRelease(Mutable);
  }
  else
  {
    Copy = 0;
  }
  BookmarkData::~BookmarkData((BookmarkData *)v20);
  return Copy;
}

CFNumberRef BookmarkCopyPropertyFromBookmarkData(BookmarkData *a1, const __CFString *cf2, uint64_t a3)
{
  CFNumberRef v6;
  uint64_t ItemInTOC;
  CFNumberRef v8;
  __int128 v10;
  uint64_t (*v11)(BookmarkData *, uint64_t, uint64_t);
  uint64_t v12;

  if (!cf2)
    return 0;
  if (!GetBookmarkResourcePropertyToInfo(cf2, &v10))
  {
    ItemInTOC = BookmarkData::findItemInTOC(a1, cf2, 1);
    if (!ItemInTOC)
      return 0;
LABEL_8:
    v6 = BookmarkData::copyItem(a1, ItemInTOC, 0);
    goto LABEL_9;
  }
  if (!v11)
  {
    ItemInTOC = BookmarkData::findItemInTOC(a1, DWORD2(v10), 1);
    if (!ItemInTOC)
      return 0;
    goto LABEL_8;
  }
  v6 = (CFNumberRef)v11(a1, 1, v12);
LABEL_9:
  v8 = v6;
  if (a3 && v6 && CFGetTypeID(v6) != a3)
  {
    CFRelease(v8);
    return 0;
  }
  return v8;
}

CFNumberRef _CFURLCreateResourcePropertyForKeyFromBookmarkData(const __CFAllocator *a1, const __CFString *a2, CFTypeRef cf)
{
  CFTypeID v6;
  CFTypeID TypeID;
  CFNumberRef v8;
  CFTypeID v9;
  _BYTE v11[72];

  if (!cf)
    return 0;
  v6 = CFGetTypeID(cf);
  TypeID = CFDataGetTypeID();
  v8 = 0;
  if (a2 && v6 == TypeID)
  {
    v9 = CFGetTypeID(a2);
    if (v9 == CFStringGetTypeID())
    {
      BookmarkData::BookmarkData((BookmarkData *)v11, a1, (const __CFData *)cf);
      v8 = BookmarkCopyPropertyFromBookmarkData((BookmarkData *)v11, a2, 0);
      BookmarkData::~BookmarkData((BookmarkData *)v11);
      return v8;
    }
    return 0;
  }
  return v8;
}

__CFString *_CFURLBookmarkDataCopyDescription(const void *a1)
{
  __CFString *Mutable;
  CFTypeID v3;
  const __CFAllocator *v4;
  unsigned int *v5;
  const UInt8 *BytePtr;
  CFIndex Length;
  uint64_t v8;
  const UInt8 *v9;
  CFIndex v10;
  uint64_t v11;
  uint64_t i;
  uint64_t j;
  uint64_t v14;
  uint64_t v15;
  uint64_t FirstTOC;
  unsigned int *TOCAtOffset;
  const UInt8 *v18;
  unint64_t v19;
  unsigned int *v20;
  int v21;
  const char *v22;
  const __CFString *v23;
  unsigned int v24;
  CFTypeID TypeID;
  const __CFString *v26;
  CFIndex Bytes;
  CFIndex v28;
  unsigned int v29;
  unsigned int *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  unsigned int *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  unsigned int *DataItemAtOffset;
  unsigned int v39;
  const __CFString *v40;
  const __CFString *v41;
  const char *v42;
  const char *v43;
  const char *v44;
  const char *v45;
  const char *v46;
  const char *v47;
  const char *v48;
  const char *v49;
  const char *v50;
  const char *v51;
  const char *v52;
  const char *v53;
  const char *v54;
  const char *v55;
  const char *v56;
  const char *v57;
  const char *v58;
  const char *v59;
  const char *v60;
  const char *v61;
  const char *v62;
  const char *v63;
  const char *v64;
  const char *v65;
  const char *v66;
  const char *v67;
  const char *v68;
  const char *v69;
  const char *v70;
  const char *v71;
  const char *v72;
  const char *v73;
  const char *v74;
  const char *v75;
  const char *v76;
  const char *v77;
  const char *v78;
  BOOL v79;
  const char *v80;
  const char *v81;
  const char *v82;
  const char *v83;
  const char *v84;
  const char *v85;
  const char *v86;
  const char *v87;
  const char *v88;
  const char *v89;
  const char *v90;
  const char *v91;
  const char *v92;
  const char *v93;
  const char *v94;
  const char *v95;
  const char *v96;
  const char *v97;
  const char *v98;
  CFIndex *usedBufLen;
  unsigned int *v101;
  CFIndex v102;
  _BYTE v103[16];
  unsigned int *v104;
  uint64_t v105;
  unsigned int v106;
  UInt8 buffer[16];
  __int128 v108;
  __int128 v109;
  __int128 v110;
  __int128 v111;
  __int128 v112;
  __int128 v113;
  __int128 v114;
  uint64_t v115;
  CFRange v116;

  v115 = *MEMORY[0x1E0C80C00];
  Mutable = CFStringCreateMutable((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0);
  if (a1)
  {
    v3 = CFGetTypeID(a1);
    if (v3 == CFDataGetTypeID())
    {
      v4 = CFGetAllocator(a1);
      BookmarkData::BookmarkData((BookmarkData *)v103, v4, (const __CFData *)a1);
      v5 = v104;
      BytePtr = CFDataGetBytePtr((CFDataRef)a1);
      Length = CFDataGetLength((CFDataRef)a1);
      CFStringAppendFormat(Mutable, 0, CFSTR("Bookmark: dataRef=%p len=%d\n"), BytePtr, Length);
      if (v5)
      {
        CFStringAppendFormat(Mutable, 0, CFSTR("  signature = 0x%x\n"), *v5);
        CFStringAppendFormat(Mutable, 0, CFSTR("  length = 0x%x\n"), v5[1]);
        CFStringAppendFormat(Mutable, 0, CFSTR("  version = 0x%x\n"), v5[2]);
        CFStringAppendFormat(Mutable, 0, CFSTR("  bookmarkDataSectionOffset = 0x%x\n"), v106);
        v8 = v105;
        v101 = v5;
        if (v105)
          v8 = *(unsigned int *)(v105 + v106);
        CFStringAppendFormat(Mutable, 0, CFSTR("  bookmarkDataSectionFirstTOCOffset = 0x%x\n"), v8);
        v9 = CFDataGetBytePtr((CFDataRef)a1);
        if (CFDataGetLength((CFDataRef)a1) >= 1)
        {
          v10 = 0;
          v11 = MEMORY[0x1E0C80978];
          do
          {
            CFStringAppendFormat(Mutable, 0, CFSTR(" 0x%5.5lx:"), v10);
            for (i = 0; i != 16; ++i)
            {
              if (v10 + i >= CFDataGetLength((CFDataRef)a1))
                CFStringAppendFormat(Mutable, 0, CFSTR("  "), usedBufLen);
              else
                CFStringAppendFormat(Mutable, 0, CFSTR("%2.2x"), v9[i]);
              if ((~(_DWORD)i & 3) == 0)
                CFStringAppend(Mutable, CFSTR(" "));
            }
            CFStringAppendFormat(Mutable, 0, CFSTR("  | "));
            for (j = 0; j != 16; ++j)
            {
              v14 = v9[j];
              if ((char)v9[j] < 0)
              {
                if (__maskrune(v14, 0x40000uLL))
                {
LABEL_18:
                  v15 = v9[j];
                  goto LABEL_21;
                }
              }
              else if ((*(_DWORD *)(v11 + 4 * v14 + 60) & 0x40000) != 0)
              {
                goto LABEL_18;
              }
              v15 = 46;
LABEL_21:
              CFStringAppendFormat(Mutable, 0, CFSTR("%c"), v15);
              if ((~(_DWORD)j & 3) == 0)
                CFStringAppendFormat(Mutable, 0, CFSTR(" "));
            }
            CFStringAppendFormat(Mutable, 0, CFSTR(" \n"));
            v10 += 16;
            v9 += 16;
          }
          while (v10 < CFDataGetLength((CFDataRef)a1));
        }
        FirstTOC = BookmarkData::getFirstTOC((BookmarkData *)v103, 1);
        if (FirstTOC)
        {
          TOCAtOffset = (unsigned int *)FirstTOC;
          while (1)
          {
            v18 = CFDataGetBytePtr((CFDataRef)a1);
            CFStringAppendFormat(Mutable, 0, CFSTR(" toc @ offset:0x%x(0x%p) level=%d count=%d next=0x%d\n"), (char *)TOCAtOffset - (char *)v18, TOCAtOffset, TOCAtOffset[2], TOCAtOffset[4], TOCAtOffset[3]);
            if (TOCAtOffset[4])
              break;
LABEL_341:
            TOCAtOffset = (unsigned int *)BookmarkData::getTOCAtOffset((BookmarkData *)v103, TOCAtOffset[3]);
            if (!TOCAtOffset)
              goto LABEL_342;
          }
          v19 = 0;
          v20 = TOCAtOffset + 5;
          while (1)
          {
            v113 = 0u;
            v114 = 0u;
            v111 = 0u;
            v112 = 0u;
            v109 = 0u;
            v110 = 0u;
            *(_OWORD *)buffer = 0u;
            v108 = 0u;
            v21 = *v20;
            if ((int)*v20 > 8223)
            {
              if (v21 > 61461)
              {
                if (v21 > 61568)
                {
                  if (v21 <= 983060)
                  {
                    switch(v21)
                    {
                      case 61569:
                        v22 = "sandboxROExtension:";
                        goto LABEL_143;
                      case 61570:
                        v22 = "securityScopeCookie:";
                        goto LABEL_143;
                      case 65024:
                        v22 = "aliasData:";
                        goto LABEL_143;
                    }
                  }
                  else if (v21 > 1048577)
                  {
                    if (v21 == 1048578)
                    {
                      v22 = "testKey2";
                      goto LABEL_143;
                    }
                    if (v21 == 251658516)
                    {
                      v22 = "version:";
                      goto LABEL_143;
                    }
                  }
                  else
                  {
                    if (v21 == 983061)
                    {
                      v22 = "shortVersion:";
                      goto LABEL_143;
                    }
                    if (v21 == 1048561)
                    {
                      v22 = "testKey1";
                      goto LABEL_143;
                    }
                  }
                }
                else if (v21 <= 61472)
                {
                  switch(v21)
                  {
                    case 61462:
                      v22 = "displayNamesDict:";
                      goto LABEL_143;
                    case 61463:
                      v22 = "displayName:";
                      goto LABEL_143;
                    case 61472:
                      v22 = "effectiveIconData:";
                      goto LABEL_143;
                  }
                }
                else if (v21 > 61487)
                {
                  if (v21 == 61488)
                  {
                    v22 = "bookmarkCreationTime:";
                    goto LABEL_143;
                  }
                  if (v21 == 61568)
                  {
                    v22 = "sandboxRWExtension:";
                    goto LABEL_143;
                  }
                }
                else
                {
                  if (v21 == 61473)
                  {
                    v22 = "effectiveFlattenedIconRef:";
                    goto LABEL_143;
                  }
                  if (v21 == 61474)
                  {
                    v22 = "typeBindingData:";
                    goto LABEL_143;
                  }
                }
              }
              else if (v21 > 49152)
              {
                if (v21 <= 53248)
                {
                  switch(v21)
                  {
                    case 49153:
                      v22 = "volHomeDirRelativePathComponentCount:";
                      goto LABEL_143;
                    case 49169:
                      v22 = "userName:";
                      goto LABEL_143;
                    case 49170:
                      v22 = "userUID:";
                      goto LABEL_143;
                  }
                }
                else if (v21 > 57345)
                {
                  if (v21 == 57346)
                  {
                    v22 = "haseBaseURL:";
                    goto LABEL_143;
                  }
                  if (v21 == 57347)
                  {
                    v22 = "baseURLComponentCount:";
                    goto LABEL_143;
                  }
                }
                else
                {
                  if (v21 == 53249)
                  {
                    v22 = "wasFileIDFormat:";
                    goto LABEL_143;
                  }
                  if (v21 == 53264)
                  {
                    v22 = "creationOptions:";
                    goto LABEL_143;
                  }
                }
              }
              else if (v21 <= 8255)
              {
                switch(v21)
                {
                  case 8224:
                    v22 = "volProps:";
                    goto LABEL_143;
                  case 8240:
                    v22 = "volWasBoot:";
                    goto LABEL_143;
                  case 8242:
                    v22 = "volIDiskUserName:";
                    goto LABEL_143;
                }
              }
              else if (v21 > 8287)
              {
                if (v21 == 8288)
                {
                  v22 = "volAutomountPath:";
                  goto LABEL_143;
                }
                if (v21 == 8304)
                {
                  v22 = "bookmarkFileProviderString:";
                  goto LABEL_143;
                }
              }
              else
              {
                if (v21 == 8256)
                {
                  v22 = "diskImageDepth:";
                  goto LABEL_143;
                }
                if (v21 == 8272)
                {
                  v22 = "volMountURL:";
                  goto LABEL_143;
                }
              }
LABEL_136:
              if (v21 < 0)
              {
                v24 = v21 & 0x7FFFFFFF;
                TypeID = CFStringGetTypeID();
                v23 = (const __CFString *)BookmarkData::copyDataItemAtOffset((BookmarkData *)v103, v24, TypeID);
              }
              else
              {
                v23 = (const __CFString *)CFBookmarkPropertyEnumToStringKey(v21);
              }
              v26 = v23;
              v22 = (const char *)buffer;
              if (v23)
              {
                v102 = 0;
                v116.length = CFStringGetLength(v23);
                v116.location = 0;
                Bytes = CFStringGetBytes(v26, v116, 0x8000100u, 0, 0, buffer, 128, &v102);
                v28 = v102;
                if (!Bytes)
                  v28 = 0;
                buffer[v28] = 0;
              }
            }
            else if (v21 <= 4176)
            {
              if (v21 > 4127)
              {
                switch(v21)
                {
                  case 4160:
                    v22 = "creationDate:";
                    break;
                  case 4161:
                    v22 = "accessDate:";
                    break;
                  case 4162:
                    v22 = "modificationDate:";
                    break;
                  case 4163:
                    v22 = "attrModificationDate:";
                    break;
                  default:
                    if (v21 == 4128)
                    {
                      v22 = "fileName:";
                    }
                    else
                    {
                      if (v21 != 4144)
                        goto LABEL_136;
                      v22 = "fileID:";
                    }
                    break;
                }
              }
              else
              {
                v22 = "pathComponents:";
                switch(v21)
                {
                  case 4099:
                    v22 = "urlString:";
                    break;
                  case 4100:
                    break;
                  case 4101:
                    v22 = "fileIDs:";
                    break;
                  case 4102:
                    v22 = "pathComponentProps:";
                    break;
                  case 4103:
                  case 4105:
                  case 4106:
                  case 4107:
                  case 4108:
                  case 4109:
                  case 4110:
                  case 4111:
                    goto LABEL_136;
                  case 4104:
                    v22 = "tagStyle:";
                    break;
                  case 4112:
                    v22 = "resourceProps:";
                    break;
                  default:
                    if (v21 != -2)
                      goto LABEL_136;
                    v22 = "toc:";
                    break;
                }
              }
            }
            else if (v21 < 0x2000)
            {
              switch(v21)
              {
                case 4177:
                  v22 = "relativeDirsUpMinusOne:";
                  break;
                case 4178:
                  goto LABEL_136;
                case 4179:
                  v22 = "relativeDirsDownMinusOne:";
                  break;
                case 4180:
                  v22 = "relativeDirsUp:";
                  break;
                case 4181:
                  v22 = "relativeDirsDown:";
                  break;
                case 4182:
                  v22 = "createdWithRelativeURL";
                  break;
                default:
                  if (v21 == 4353)
                  {
                    v22 = "fragmentString:";
                  }
                  else
                  {
                    if (v21 != 4354)
                      goto LABEL_136;
                    v22 = "queryString:";
                  }
                  break;
              }
            }
            else
            {
              switch(v21)
              {
                case 8192:
                  v22 = "volInfoDepths:";
                  break;
                case 8194:
                  v22 = "volPath:";
                  break;
                case 8196:
                  v22 = "volPathComponents:";
                  break;
                case 8197:
                  v22 = "volURL:";
                  break;
                case 8208:
                  v22 = "volName:";
                  break;
                case 8209:
                  v22 = "volUUID:";
                  break;
                case 8210:
                  v22 = "volCapacity:";
                  break;
                case 8211:
                  v22 = "volCreationDate:";
                  break;
                default:
                  goto LABEL_136;
              }
            }
LABEL_143:
            CFStringAppendFormat(Mutable, 0, CFSTR(" %3d) itemType=0x%x flags=0x%x dataOffset=0x%x %s"), v19, *v20, v20[2], v101[3] + v20[1], v22);
            v29 = *v20;
            if (*v20 == 53264)
            {
              DataItemAtOffset = BookmarkData::getDataItemAtOffset((BookmarkData *)v103, v20[1]);
              if (!DataItemAtOffset || *DataItemAtOffset < 4)
                goto LABEL_335;
              v39 = DataItemAtOffset[2];
              if ((v39 & 0x10000000) != 0)
              {
                CFStringAppendFormat(Mutable, 0, CFSTR("%s "), "kCFURLBookmarkCreationAllowCreationIfResourceDoesNotExistMask");
                if ((v39 & 0x20000000) == 0)
                  goto LABEL_185;
              }
              else if ((v39 & 0x20000000) == 0)
              {
LABEL_185:
                if ((v39 & 0x200) == 0)
                  goto LABEL_186;
LABEL_339:
                CFStringAppendFormat(Mutable, 0, CFSTR("%s "), "kCFURLBookmarkCreationMinimalBookmarkMask");
                if ((v39 & 0x400) != 0)
                {
LABEL_340:
                  CFStringAppendFormat(Mutable, 0, CFSTR("%s "), "kCFURLBookmarkCreationSuitableForBookmarkFile");
                  goto LABEL_335;
                }
                goto LABEL_335;
              }
              CFStringAppendFormat(Mutable, 0, CFSTR("%s "), "kCFURLBookmarkCreationDoNotIncludeSandboxExtensionsMask");
              if ((v39 & 0x200) == 0)
              {
LABEL_186:
                if ((v39 & 0x400) != 0)
                  goto LABEL_340;
                goto LABEL_335;
              }
              goto LABEL_339;
            }
            if (v29 == 8224)
            {
              v34 = BookmarkData::getDataItemAtOffset((BookmarkData *)v103, v20[1]);
              if (!v34 || *v34 < 0x18)
                goto LABEL_335;
              v35 = *((_QWORD *)v34 + 1);
              v36 = *((_QWORD *)v34 + 2);
              v37 = *((_QWORD *)v34 + 3);
              CFStringAppendFormat(Mutable, 0, CFSTR("Props:["));
              if ((v36 & 1) != 0)
              {
                v42 = "local";
                if ((v35 & 1) == 0)
                  v42 = "!local";
                v43 = "**";
                if ((v37 & 1) == 0)
                  v43 = "";
                CFStringAppendFormat(Mutable, 0, CFSTR("%s%s "), v42, v43);
                if ((v36 & 2) != 0)
                  goto LABEL_195;
LABEL_163:
                if ((v36 & 4) == 0)
                  goto LABEL_164;
LABEL_200:
                v46 = "browse";
                if ((v35 & 4) == 0)
                  v46 = "!browse";
                v47 = "**";
                if ((v37 & 4) == 0)
                  v47 = "";
                CFStringAppendFormat(Mutable, 0, CFSTR("%s%s "), v46, v47);
                if ((v36 & 8) != 0)
                  goto LABEL_205;
LABEL_165:
                if ((v36 & 0x20) == 0)
                  goto LABEL_166;
LABEL_210:
                v50 = "eject";
                if ((v35 & 0x20) == 0)
                  v50 = "!eject";
                v51 = "**";
                if ((v37 & 0x20) == 0)
                  v51 = "";
                CFStringAppendFormat(Mutable, 0, CFSTR("%s%s "), v50, v51);
                if ((v36 & 0x40) != 0)
                  goto LABEL_215;
LABEL_167:
                if ((v36 & 0x80) == 0)
                  goto LABEL_168;
LABEL_220:
                v54 = "internal";
                if ((v35 & 0x80) == 0)
                  v54 = "!internal";
                v55 = "**";
                if ((v37 & 0x80) == 0)
                  v55 = "";
                CFStringAppendFormat(Mutable, 0, CFSTR("%s%s "), v54, v55);
                if ((v36 & 0x100) != 0)
                  goto LABEL_225;
LABEL_169:
                if ((v36 & 0x200) == 0)
                  goto LABEL_170;
LABEL_230:
                v58 = "diskimage";
                if ((v35 & 0x200) == 0)
                  v58 = "!diskimage";
                v59 = "**";
                if ((v37 & 0x200) == 0)
                  v59 = "";
                CFStringAppendFormat(Mutable, 0, CFSTR("%s%s "), v58, v59);
                if ((v36 & 0x1000) != 0)
                  goto LABEL_235;
LABEL_171:
                if ((v36 & 0x100000000) == 0)
                  goto LABEL_172;
LABEL_240:
                v62 = "file-ids";
                if ((v35 & 0x100000000) == 0)
                  v62 = "!file-ids";
                v63 = "**";
                if ((v37 & 0x100000000) == 0)
                  v63 = "";
                CFStringAppendFormat(Mutable, 0, CFSTR("%s%s "), v62, v63);
                if ((v36 & 0x1000000000) != 0)
                  goto LABEL_245;
LABEL_173:
                if ((v36 & 0x2000000000000) == 0)
                  goto LABEL_174;
LABEL_250:
                v66 = "hard-links";
                if ((v35 & 0x2000000000000) == 0)
                  v66 = "!hard-links";
                v67 = "**";
                if ((v37 & 0x2000000000000) == 0)
                  v67 = "";
                CFStringAppendFormat(Mutable, 0, CFSTR("%s%s "), v66, v67);
                if ((v36 & 0x10000000000) != 0)
                  goto LABEL_255;
LABEL_175:
                if ((v36 & 0x20000000000000) == 0)
                  goto LABEL_176;
LABEL_260:
                v70 = "isJournaling";
                if ((v35 & 0x20000000000000) == 0)
                  v70 = "!isJournaling";
                v71 = "**";
                if ((v37 & 0x20000000000000) == 0)
                  v71 = "";
                CFStringAppendFormat(Mutable, 0, CFSTR("%s%s "), v70, v71);
                if ((v36 & 0x40000000000000) != 0)
                  goto LABEL_265;
LABEL_177:
                if ((v36 & 0x80000000000000) == 0)
                  goto LABEL_178;
LABEL_270:
                v74 = "zeroRuns";
                if ((v35 & 0x80000000000000) == 0)
                  v74 = "!zeroRuns";
                v75 = "**";
                if ((v37 & 0x80000000000000) == 0)
                  v75 = "";
                CFStringAppendFormat(Mutable, 0, CFSTR("%s%s "), v74, v75);
                if ((v36 & 0x80000000000) != 0)
                  goto LABEL_275;
LABEL_179:
                if ((v36 & 0x100000000000) == 0)
                  goto LABEL_334;
              }
              else
              {
                if ((v36 & 2) == 0)
                  goto LABEL_163;
LABEL_195:
                v44 = "auto";
                if ((v35 & 2) == 0)
                  v44 = "!auto";
                v45 = "**";
                if ((v37 & 2) == 0)
                  v45 = "";
                CFStringAppendFormat(Mutable, 0, CFSTR("%s%s "), v44, v45);
                if ((v36 & 4) != 0)
                  goto LABEL_200;
LABEL_164:
                if ((v36 & 8) == 0)
                  goto LABEL_165;
LABEL_205:
                v48 = "ro";
                if ((v35 & 8) == 0)
                  v48 = "rw";
                v49 = "**";
                if ((v37 & 8) == 0)
                  v49 = "";
                CFStringAppendFormat(Mutable, 0, CFSTR("%s%s "), v48, v49);
                if ((v36 & 0x20) != 0)
                  goto LABEL_210;
LABEL_166:
                if ((v36 & 0x40) == 0)
                  goto LABEL_167;
LABEL_215:
                v52 = "rmvbl";
                if ((v35 & 0x40) == 0)
                  v52 = "!rmvbl";
                v53 = "**";
                if ((v37 & 0x40) == 0)
                  v53 = "";
                CFStringAppendFormat(Mutable, 0, CFSTR("%s%s "), v52, v53);
                if ((v36 & 0x80) != 0)
                  goto LABEL_220;
LABEL_168:
                if ((v36 & 0x100) == 0)
                  goto LABEL_169;
LABEL_225:
                v56 = "external";
                if ((v35 & 0x100) == 0)
                  v56 = "!external";
                v57 = "**";
                if ((v37 & 0x100) == 0)
                  v57 = "";
                CFStringAppendFormat(Mutable, 0, CFSTR("%s%s "), v56, v57);
                if ((v36 & 0x200) != 0)
                  goto LABEL_230;
LABEL_170:
                if ((v36 & 0x1000) == 0)
                  goto LABEL_171;
LABEL_235:
                v60 = "ipod";
                if ((v35 & 0x1000) == 0)
                  v60 = "!ipod";
                v61 = "**";
                if ((v37 & 0x1000) == 0)
                  v61 = "";
                CFStringAppendFormat(Mutable, 0, CFSTR("%s%s "), v60, v61);
                if ((v36 & 0x100000000) != 0)
                  goto LABEL_240;
LABEL_172:
                if ((v36 & 0x1000000000) == 0)
                  goto LABEL_173;
LABEL_245:
                v64 = "symlinks";
                if ((v35 & 0x1000000000) == 0)
                  v64 = "!symlinks";
                v65 = "**";
                if ((v37 & 0x1000000000) == 0)
                  v65 = "";
                CFStringAppendFormat(Mutable, 0, CFSTR("%s%s "), v64, v65);
                if ((v36 & 0x2000000000000) != 0)
                  goto LABEL_250;
LABEL_174:
                if ((v36 & 0x10000000000) == 0)
                  goto LABEL_175;
LABEL_255:
                v68 = "journal";
                if ((v35 & 0x10000000000) == 0)
                  v68 = "!journal";
                v69 = "**";
                if ((v37 & 0x10000000000) == 0)
                  v69 = "";
                CFStringAppendFormat(Mutable, 0, CFSTR("%s%s "), v68, v69);
                if ((v36 & 0x20000000000000) != 0)
                  goto LABEL_260;
LABEL_176:
                if ((v36 & 0x40000000000000) == 0)
                  goto LABEL_177;
LABEL_265:
                v72 = "sparseFiles";
                if ((v35 & 0x40000000000000) == 0)
                  v72 = "!sparseFiles";
                v73 = "**";
                if ((v37 & 0x40000000000000) == 0)
                  v73 = "";
                CFStringAppendFormat(Mutable, 0, CFSTR("%s%s "), v72, v73);
                if ((v36 & 0x80000000000000) != 0)
                  goto LABEL_270;
LABEL_178:
                if ((v36 & 0x80000000000) == 0)
                  goto LABEL_179;
LABEL_275:
                v76 = "case-sens";
                if ((v35 & 0x80000000000) == 0)
                  v76 = "!case-sens";
                v77 = "**";
                if ((v37 & 0x80000000000) == 0)
                  v77 = "";
                CFStringAppendFormat(Mutable, 0, CFSTR("%s%s "), v76, v77);
                if ((v36 & 0x100000000000) == 0)
                  goto LABEL_334;
              }
              v78 = "case-presrv";
              if ((v35 & 0x100000000000) == 0)
                v78 = "!case-presrv";
              v79 = (v37 & 0x100000000000) == 0;
              goto LABEL_331;
            }
            if (v29 != 4112)
            {
              v40 = (const __CFString *)BookmarkData::copyDataItemAtOffset((BookmarkData *)v103, v20[1], 0);
              if (v40)
              {
                v41 = v40;
                describeURLType(v40, Mutable);
                CFRelease(v41);
              }
              goto LABEL_335;
            }
            v30 = BookmarkData::getDataItemAtOffset((BookmarkData *)v103, v20[1]);
            if (v30 && *v30 >= 0x18)
            {
              v31 = *((_QWORD *)v30 + 1);
              v32 = *((_QWORD *)v30 + 2);
              v33 = *((_QWORD *)v30 + 3);
              CFStringAppendFormat(Mutable, 0, CFSTR("Props:["));
              if ((v32 & 1) != 0)
              {
                v80 = "file";
                if ((v31 & 1) == 0)
                  v80 = "!file";
                v81 = "**";
                if ((v33 & 1) == 0)
                  v81 = "";
                CFStringAppendFormat(Mutable, 0, CFSTR("%s%s "), v80, v81);
                if ((v32 & 2) != 0)
                  goto LABEL_288;
LABEL_150:
                if ((v32 & 4) == 0)
                  goto LABEL_151;
LABEL_293:
                v84 = "sym";
                if ((v31 & 4) == 0)
                  v84 = "!sym";
                v85 = "**";
                if ((v33 & 4) == 0)
                  v85 = "";
                CFStringAppendFormat(Mutable, 0, CFSTR("%s%s "), v84, v85);
                if ((v32 & 8) != 0)
                  goto LABEL_298;
LABEL_152:
                if ((v32 & 0x10) == 0)
                  goto LABEL_153;
LABEL_303:
                v88 = "pkg";
                if ((v31 & 0x10) == 0)
                  v88 = "!pkg";
                v89 = "**";
                if ((v33 & 0x10) == 0)
                  v89 = "";
                CFStringAppendFormat(Mutable, 0, CFSTR("%s%s "), v88, v89);
                if ((v32 & 0x20) != 0)
                  goto LABEL_308;
LABEL_154:
                if ((v32 & 0x40) == 0)
                  goto LABEL_155;
LABEL_313:
                v92 = "user-immut";
                if ((v31 & 0x40) == 0)
                  v92 = "user-mut";
                v93 = "**";
                if ((v33 & 0x40) == 0)
                  v93 = "";
                CFStringAppendFormat(Mutable, 0, CFSTR("%s%s "), v92, v93);
                if ((v32 & 0x80) != 0)
                  goto LABEL_318;
LABEL_156:
                if ((v32 & 0x100) == 0)
                  goto LABEL_157;
LABEL_323:
                v96 = "ext-hid";
                if ((v31 & 0x100) == 0)
                  v96 = "ext-vis";
                v97 = "**";
                if ((v33 & 0x100) == 0)
                  v97 = "";
                CFStringAppendFormat(Mutable, 0, CFSTR("%s%s "), v96, v97);
                if ((v32 & 0x200) == 0)
                {
LABEL_334:
                  CFStringAppendFormat(Mutable, 0, CFSTR("]"));
                  goto LABEL_335;
                }
              }
              else
              {
                if ((v32 & 2) == 0)
                  goto LABEL_150;
LABEL_288:
                v82 = "dir";
                if ((v31 & 2) == 0)
                  v82 = "!dir";
                v83 = "**";
                if ((v33 & 2) == 0)
                  v83 = "";
                CFStringAppendFormat(Mutable, 0, CFSTR("%s%s "), v82, v83);
                if ((v32 & 4) != 0)
                  goto LABEL_293;
LABEL_151:
                if ((v32 & 8) == 0)
                  goto LABEL_152;
LABEL_298:
                v86 = "vol";
                if ((v31 & 8) == 0)
                  v86 = "!vol";
                v87 = "**";
                if ((v33 & 8) == 0)
                  v87 = "";
                CFStringAppendFormat(Mutable, 0, CFSTR("%s%s "), v86, v87);
                if ((v32 & 0x10) != 0)
                  goto LABEL_303;
LABEL_153:
                if ((v32 & 0x20) == 0)
                  goto LABEL_154;
LABEL_308:
                v90 = "sys-immut";
                if ((v31 & 0x20) == 0)
                  v90 = "sys-mut";
                v91 = "**";
                if ((v33 & 0x20) == 0)
                  v91 = "";
                CFStringAppendFormat(Mutable, 0, CFSTR("%s%s "), v90, v91);
                if ((v32 & 0x40) != 0)
                  goto LABEL_313;
LABEL_155:
                if ((v32 & 0x80) == 0)
                  goto LABEL_156;
LABEL_318:
                v94 = "hid";
                if ((v31 & 0x80) == 0)
                  v94 = "vis";
                v95 = "**";
                if ((v33 & 0x80) == 0)
                  v95 = "";
                CFStringAppendFormat(Mutable, 0, CFSTR("%s%s "), v94, v95);
                if ((v32 & 0x100) != 0)
                  goto LABEL_323;
LABEL_157:
                if ((v32 & 0x200) == 0)
                  goto LABEL_334;
              }
              v78 = "app";
              if ((v31 & 0x200) == 0)
                v78 = "!app";
              v79 = (v33 & 0x200) == 0;
LABEL_331:
              v98 = "**";
              if (v79)
                v98 = "";
              CFStringAppendFormat(Mutable, 0, CFSTR("%s%s "), v78, v98);
              goto LABEL_334;
            }
LABEL_335:
            CFStringAppendFormat(Mutable, 0, CFSTR(" \n"));
            ++v19;
            v20 += 3;
            if (v19 >= TOCAtOffset[4])
              goto LABEL_341;
          }
        }
      }
LABEL_342:
      BookmarkData::~BookmarkData((BookmarkData *)v103);
    }
  }
  return Mutable;
}

void describeURLType(const __CFString *a1, __CFString *a2)
{
  CFTypeID v4;
  CFTypeID v5;
  CFTypeID v6;
  const UInt8 *BytePtr;
  CFIndex Length;
  CFIndex v9;
  uint64_t v10;
  CFTypeID v11;
  CFAbsoluteTime v12;
  CFGregorianDate GregorianDate;
  uint64_t i;
  CFIndex v15;
  CFTypeID v16;
  CFIndex v17;
  const void *ValueAtIndex;
  CFStringRef v19;
  const __CFString *v20;
  CFTypeID v21;
  uint64_t v22;
  uint64_t valuePtr;

  if (a1)
  {
    v4 = CFGetTypeID(a1);
    if (v4 == CFStringGetTypeID())
    {
      CFStringAppend(a2, CFSTR("\""));
      CFStringAppend(a2, a1);
      CFStringAppend(a2, CFSTR("\""));
    }
    else
    {
      v5 = CFGetTypeID(a1);
      if (v5 == CFNumberGetTypeID())
      {
        v22 = 0;
        valuePtr = 0;
        if (CFNumberGetValue((CFNumberRef)a1, kCFNumberLongLongType, &valuePtr))
        {
          CFStringAppendFormat(a2, 0, CFSTR(" %ld/0x%x "), valuePtr, valuePtr);
        }
        else if (CFNumberGetValue((CFNumberRef)a1, kCFNumberDoubleType, &v22))
        {
          CFStringAppendFormat(a2, 0, CFSTR(" %lg "), v22);
        }
        else
        {
          CFStringAppendFormat(a2, 0, CFSTR(" <number> "));
        }
      }
      else
      {
        v6 = CFGetTypeID(a1);
        if (v6 == CFDataGetTypeID())
        {
          BytePtr = CFDataGetBytePtr((CFDataRef)a1);
          Length = CFDataGetLength((CFDataRef)a1);
          v9 = Length;
          if (Length >= 32)
          {
            for (i = 0; i != 16; ++i)
            {
              CFStringAppendFormat(a2, 0, CFSTR(" %2.2x"), BytePtr[i]);
              if ((~(_BYTE)i & 3) == 0)
                CFStringAppend(a2, CFSTR(" "));
            }
            CFStringAppend(a2, CFSTR("..."));
            v15 = v9 - 16;
            do
            {
              CFStringAppendFormat(a2, 0, CFSTR(" %2.2x"), BytePtr[v15]);
              if ((v15 & 0x8000000000000003) == 3)
                CFStringAppend(a2, CFSTR(" "));
              ++v15;
            }
            while (v15 < v9);
          }
          else if (Length >= 1)
          {
            v10 = 0;
            do
            {
              CFStringAppendFormat(a2, 0, CFSTR(" %2.2x"), BytePtr[v10]);
              if ((~(_BYTE)v10 & 3) == 0)
                CFStringAppend(a2, CFSTR(" "));
              ++v10;
            }
            while (v9 != v10);
          }
        }
        else
        {
          v11 = CFGetTypeID(a1);
          if (v11 == CFDateGetTypeID())
          {
            v12 = MEMORY[0x186DA2DD8](a1);
            GregorianDate = CFAbsoluteTimeGetGregorianDate(v12, 0);
            CFStringAppendFormat(a2, 0, CFSTR(" %4.4d/%2.2d/%2.2d %2.2d:%2.2d:%-6.4f "), *(_QWORD *)&GregorianDate.year, ((int)(*(_QWORD *)&GregorianDate.year >> 8) >> 24), ((int)(*(_QWORD *)&GregorianDate.year >> 16) >> 24), ((int)(*(_QWORD *)&GregorianDate.year >> 24) >> 24), (*(int *)&GregorianDate.month >> 24), *(_QWORD *)&GregorianDate.second);
          }
          else if ((const __CFString *)*MEMORY[0x1E0C9AE50] == a1)
          {
            CFStringAppendFormat(a2, 0, CFSTR(" true  "));
          }
          else if ((const __CFString *)*MEMORY[0x1E0C9AE40] == a1)
          {
            CFStringAppendFormat(a2, 0, CFSTR(" false "));
          }
          else
          {
            v16 = CFGetTypeID(a1);
            if (v16 == CFArrayGetTypeID())
            {
              CFStringAppendFormat(a2, 0, CFSTR("[ "));
              if (CFArrayGetCount((CFArrayRef)a1) >= 1)
              {
                v17 = 0;
                do
                {
                  if (v17)
                    CFStringAppendFormat(a2, 0, CFSTR(", "));
                  ValueAtIndex = CFArrayGetValueAtIndex((CFArrayRef)a1, v17);
                  describeURLType(ValueAtIndex, a2);
                  ++v17;
                }
                while (v17 < CFArrayGetCount((CFArrayRef)a1));
              }
              CFStringAppendFormat(a2, 0, CFSTR("] "));
            }
            else
            {
              v19 = CFCopyDescription(a1);
              if (v19)
              {
                v20 = v19;
                CFStringAppend(a2, CFSTR("\""));
                CFStringAppend(a2, v20);
                CFStringAppend(a2, CFSTR("\""));
                CFRelease(v20);
              }
              else
              {
                v21 = CFGetTypeID(a1);
                CFStringAppendFormat(a2, 0, CFSTR(" Unknown encoded type, typeID=%d"), v21);
              }
            }
          }
        }
      }
    }
  }
  else
  {
    CFStringAppendFormat(a2, 0, CFSTR("NULL"));
  }
}

uint64_t _CFURLCompareBookmarkData(CFTypeRef cf, const void *a2, uint64_t a3, _QWORD *a4)
{
  CFTypeID v6;
  CFTypeID TypeID;
  uint64_t v8;
  CFTypeID v9;
  const __CFAllocator *v10;
  CFIndex Length;
  const UInt8 *BytePtr;
  const UInt8 *v13;
  size_t v14;
  uint64_t ItemInTOC;
  uint64_t v16;
  uint64_t v17;
  CFTypeID v18;
  const __CFString *v19;
  CFTypeID v20;
  const __CFString *v21;
  CFNumberRef v22;
  _BOOL4 v23;
  const __CFString *v24;
  CFTypeID v25;
  CFTypeID v26;
  const __CFBoolean *v27;
  int v29;
  int v31;
  _BOOL4 v33;
  CFTypeID v34;
  const void *v35;
  CFTypeID v36;
  const void *v37;
  BOOL v38;
  int v39;
  const __CFString *v40;
  CFTypeID v41;
  const __CFString *v42;
  CFTypeID v43;
  const __CFString *v44;
  const __CFString *v45;
  CFTypeID v46;
  CFTypeID v47;
  CFTypeID v48;
  CFTypeID v49;
  const __CFString *v50;
  CFTypeID v51;
  CFTypeID v52;
  _BOOL4 v53;
  _BOOL4 v54;
  const void *v55;
  double v56;
  _BOOL4 v57;
  _BOOL4 v58;
  int Value;
  const __CFArray *v60;
  const __CFArray *v61;
  CFRange v62;
  const __CFString *v63;
  const __CFArray *v64;
  const __CFString *v65;
  CFTypeID v66;
  const __CFString *v67;
  const __CFArray *v68;
  CFTypeID v69;
  const __CFString *v70;
  const __CFString *v71;
  _BOOL4 v72;
  const __CFString *v73;
  CFTypeID v74;
  const __CFString *v75;
  CFTypeID v76;
  const __CFString *v77;
  const __CFString *v78;
  int v79;
  const void *v80;
  const __CFString *v81;
  const __CFString *v82;
  CFTypeID v83;
  CFNumberRef v84;
  CFTypeID v85;
  CFNumberRef v86;
  CFNumberRef v87;
  _BOOL4 v88;
  const __CFString *v89;
  CFTypeID v90;
  CFNumberRef v91;
  CFTypeID v92;
  CFNumberRef v93;
  CFNumberRef v94;
  _BOOL4 v95;
  const void *v96;
  CFStringRef v97;
  const __CFString *v98;
  CFNumberRef v99;
  const void *v100;
  CFNumberRef v101;
  const __CFArray *v102;
  CFArrayRef v103;
  unsigned int Count;
  CFRange v105;
  const __CFArray *v106;
  const __CFString *v107;
  const __CFString *v108;
  _BOOL4 v109;
  CFTypeRef v110;
  CFStringRef theString2;
  CFTypeRef cfa;
  const __CFString *theString1;
  CFTypeRef v114;
  CFNumberRef cf2;
  const __CFString *v116;
  CFNumberRef cf1;
  CFTypeRef v118;
  unsigned int valuePtr;
  BOOL v120[2];
  _BYTE v121[16];
  int *v122;
  _BYTE v123[16];
  int *v124;

  if (a4)
    *a4 = 0;
  if (!cf)
    return 0;
  v6 = CFGetTypeID(cf);
  TypeID = CFDataGetTypeID();
  v8 = 0;
  if (a2 && v6 == TypeID)
  {
    v9 = CFGetTypeID(a2);
    if (v9 == CFDataGetTypeID())
    {
      v10 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
      BookmarkData::BookmarkData((BookmarkData *)v123, (const __CFAllocator *)*MEMORY[0x1E0C9AE00], (const __CFData *)cf);
      BookmarkData::BookmarkData((BookmarkData *)v121, v10, (const __CFData *)a2);
      if (v124 && v122)
      {
        Length = CFDataGetLength((CFDataRef)cf);
        if (Length != CFDataGetLength((CFDataRef)a2)
          || (BytePtr = CFDataGetBytePtr((CFDataRef)cf),
              v13 = CFDataGetBytePtr((CFDataRef)a2),
              v14 = CFDataGetLength((CFDataRef)cf),
              memcmp(BytePtr, v13, v14)))
        {
          ItemInTOC = BookmarkData::findItemInTOC((BookmarkData *)v123, 0x1003u, 1);
          v16 = BookmarkData::findItemInTOC((BookmarkData *)v121, 0x1003u, 1);
          if (ItemInTOC | v16)
          {
            v8 = 4096;
            if (!ItemInTOC)
              goto LABEL_51;
            v17 = v16;
            if (!v16)
              goto LABEL_51;
            v18 = CFStringGetTypeID();
            v19 = (const __CFString *)BookmarkData::copyItem((BookmarkData *)v123, ItemInTOC, v18);
            v20 = CFStringGetTypeID();
            v21 = (const __CFString *)BookmarkData::copyItem((BookmarkData *)v121, v17, v20);
            v22 = (CFNumberRef)v21;
            if (v19)
            {
              if (v21)
              {
                if (CFStringCompare(v19, v21, 0))
                  v8 = 4096;
                else
                  v8 = 0x8000;
                CFRelease(v22);
              }
              else
              {
                v8 = 4096;
              }
              v22 = (CFNumberRef)v19;
LABEL_50:
              CFRelease(v22);
              goto LABEL_51;
            }
            v8 = 4096;
LABEL_46:
            if (!v22)
              goto LABEL_51;
            goto LABEL_50;
          }
          v23 = compareBookmarkProperties((BookmarkData *)v123, (BookmarkData *)v121, (const __CFString *)*MEMORY[0x1E0C9B6D8])&& compareBookmarkProperties((BookmarkData *)v123, (BookmarkData *)v121, (const __CFString *)*MEMORY[0x1E0C9B790])&& compareBookmarkProperties((BookmarkData *)v123, (BookmarkData *)v121, (const __CFString *)*MEMORY[0x1E0C9B6A8]);
          v24 = (const __CFString *)*MEMORY[0x1E0C9B550];
          v25 = CFBooleanGetTypeID();
          v22 = BookmarkCopyPropertyFromBookmarkData((BookmarkData *)v123, v24, v25);
          v26 = CFBooleanGetTypeID();
          v27 = BookmarkCopyPropertyFromBookmarkData((BookmarkData *)v121, v24, v26);
          if (v22 && CFBooleanGetValue(v22) && v27 && CFBooleanGetValue(v27) && !v23)
          {
            v8 = 4096;
            goto LABEL_45;
          }
          if (!compareBookmarkProperties((BookmarkData *)v123, (BookmarkData *)v121, (const __CFString *)*MEMORY[0x1E0C9B520])|| !compareBookmarkProperties((BookmarkData *)v123, (BookmarkData *)v121, (const __CFString *)*MEMORY[0x1E0C9B4E0])|| !compareBookmarkProperties((BookmarkData *)v123, (BookmarkData *)v121, (const __CFString *)*MEMORY[0x1E0C9B530])|| !compareBookmarkProperties((BookmarkData *)v123, (BookmarkData *)v121, v24))
          {
            v8 = 4096;
            goto LABEL_40;
          }
          if (v124)
            v29 = *v124;
          else
            v29 = 0;
          if (v122)
            v31 = *v122;
          else
            v31 = 0;
          *(_WORD *)v120 = 0;
          if (v29 != 1936288865)
            BookmarkData::getItemAs((BookmarkData *)v123, 0x2030u, 1, &v120[1]);
          if (v31 != 1936288865)
            BookmarkData::getItemAs((BookmarkData *)v121, 0x2030u, 1, v120);
          v33 = v120[1] && v120[0];
          v109 = v33;
          v34 = CFNumberGetTypeID();
          v35 = BookmarkData::copyItem((BookmarkData *)v123, 0xC001u, 1u, v34);
          v36 = CFNumberGetTypeID();
          v37 = BookmarkData::copyItem((BookmarkData *)v121, 0xC001u, 1u, v36);
          cfa = v35;
          v110 = v37;
          if (v35)
            v38 = v37 == 0;
          else
            v38 = 1;
          v39 = !v38;
          v40 = (const __CFString *)*MEMORY[0x1E0C9B7F0];
          v41 = CFStringGetTypeID();
          v42 = (const __CFString *)BookmarkCopyPropertyFromBookmarkData((BookmarkData *)v123, v40, v41);
          v43 = CFStringGetTypeID();
          v44 = (const __CFString *)BookmarkCopyPropertyFromBookmarkData((BookmarkData *)v121, v40, v43);
          v45 = (const __CFString *)*MEMORY[0x1E0C9B698];
          v46 = CFDateGetTypeID();
          cf1 = BookmarkCopyPropertyFromBookmarkData((BookmarkData *)v123, v45, v46);
          v47 = CFDateGetTypeID();
          cf2 = BookmarkCopyPropertyFromBookmarkData((BookmarkData *)v121, v45, v47);
          v48 = CFURLGetTypeID();
          v118 = BookmarkData::copyItem((BookmarkData *)v123, 0x2050u, 1u, v48);
          v49 = CFURLGetTypeID();
          v114 = BookmarkData::copyItem((BookmarkData *)v121, 0x2050u, 1u, v49);
          v50 = (const __CFString *)*MEMORY[0x1E0C9B3E8];
          v51 = CFStringGetTypeID();
          theString1 = (const __CFString *)BookmarkCopyPropertyFromBookmarkData((BookmarkData *)v123, v50, v51);
          v52 = CFStringGetTypeID();
          v116 = (const __CFString *)BookmarkCopyPropertyFromBookmarkData((BookmarkData *)v121, v50, v52);
          v53 = 0;
          theString2 = v44;
          if (v42 && v44)
            v53 = CFStringCompare(v42, v44, 1uLL) == kCFCompareEqualTo;
          v108 = v42;
          v54 = 0;
          if (cf1)
          {
            v55 = v114;
            if (cf2)
            {
              if (v29 == 1936288865)
              {
                v56 = floor(MEMORY[0x186DA2DD8](cf1));
                v54 = v56 == floor(MEMORY[0x186DA2DD8](cf2));
              }
              else
              {
                v54 = CFEqual(cf1, cf2) != 0;
              }
            }
          }
          else
          {
            v55 = v114;
          }
          v57 = 0;
          if (v118 && v55)
            v57 = CFEqual(v118, v55) != 0;
          v58 = 0;
          if (theString1 && v116)
            v58 = CFStringCompare(theString1, v116, 1uLL) == kCFCompareEqualTo;
          if ((v109 | v39) == 1)
          {
            if (v58 || v53 || v54 || v57)
              v8 = 0x8000;
            else
              v8 = 0x4000;
          }
          else if (!v23
                 || ((v79 = v53 || v54 || v57, (v79 & v58) == 0) ? (v8 = 0x4000) : (v8 = 0x8000), (v79 | v58) != 1))
          {
            v8 = 4096;
            v80 = cfa;
LABEL_138:
            v96 = v110;
            v97 = theString2;
            v98 = v108;
            v99 = cf1;
            v100 = v118;
            v101 = cf2;
LABEL_153:
            if (v116)
              CFRelease(v116);
            if (theString1)
              CFRelease(theString1);
            if (v114)
              CFRelease(v114);
            if (v100)
              CFRelease(v100);
            if (v101)
              CFRelease(v101);
            if (v99)
              CFRelease(v99);
            if (v97)
              CFRelease(v97);
            if (v98)
              CFRelease(v98);
            if (v96)
              CFRelease(v96);
            if (v80)
              CFRelease(v80);
LABEL_40:
            if (!v27)
              goto LABEL_46;
LABEL_45:
            CFRelease(v27);
            goto LABEL_46;
          }
          valuePtr = 0;
          if (v39)
          {
            if (CFEqual(cfa, v110))
            {
              CFRetain(cfa);
              Value = CFNumberGetValue((CFNumberRef)cfa, kCFNumberSInt32Type, &valuePtr);
              CFRelease(cfa);
              if (Value)
              {
                if (!valuePtr)
                {
                  v72 = 1;
                  goto LABEL_126;
                }
                v60 = copyPathComponentsAsArray((BookmarkData *)v123, 1, 0);
                v61 = v60;
                if (v60)
                  LODWORD(v60) = CFArrayGetCount(v60);
                v62.length = valuePtr;
                if (v60 >= valuePtr)
                {
                  v62.location = v60 - valuePtr;
                  v102 = copyOfArray(v10, v61, v62);
                  v63 = CFStringCreateByCombiningStrings(v10, v102, CFSTR("/"));
                  if (v102)
                    CFRelease(v102);
                }
                else
                {
                  v63 = 0;
                }
                v103 = copyPathComponentsAsArray((BookmarkData *)v121, 1, 0);
                v64 = v103;
                if (v61 && v61 != v103)
                  CFRelease(v61);
                if (v64)
                  Count = CFArrayGetCount(v64);
                else
                  Count = 0;
                v105.length = valuePtr;
                if (Count >= valuePtr)
                {
                  v105.location = Count - valuePtr;
                  v106 = copyOfArray(v10, v64, v105);
                  v107 = CFStringCreateByCombiningStrings(v10, v106, CFSTR("/"));
                  if (v106)
                    CFRelease(v106);
                  if (v63)
                  {
                    if (v107)
                    {
                      v72 = CFStringCompare(v63, v107, 1uLL) == kCFCompareEqualTo;
                      CFRelease(v107);
                    }
                    else
                    {
                      v72 = 0;
                    }
                  }
                  else
                  {
                    v72 = 0;
                    v63 = v107;
                    if (!v107)
                    {
LABEL_124:
                      if (v64)
                        CFRelease(v64);
LABEL_126:
                      v82 = (const __CFString *)*MEMORY[0x1E0C9AC50];
                      v83 = CFNumberGetTypeID();
                      v84 = BookmarkCopyPropertyFromBookmarkData((BookmarkData *)v123, v82, v83);
                      v85 = CFNumberGetTypeID();
                      v86 = BookmarkCopyPropertyFromBookmarkData((BookmarkData *)v121, v82, v85);
                      v87 = v86;
                      v88 = 0;
                      if (v84 && v86)
                        v88 = CFEqual(v84, v86) != 0;
                      v89 = (const __CFString *)*MEMORY[0x1E0C9B418];
                      v90 = CFNumberGetTypeID();
                      v91 = BookmarkCopyPropertyFromBookmarkData((BookmarkData *)v123, v89, v90);
                      v92 = CFNumberGetTypeID();
                      v93 = BookmarkCopyPropertyFromBookmarkData((BookmarkData *)v121, v89, v92);
                      v94 = v93;
                      v95 = 0;
                      if (v91)
                      {
                        v80 = cfa;
                        if (v93)
                          v95 = CFEqual(v91, v93) != 0;
                      }
                      else
                      {
                        v80 = cfa;
                      }
                      if (v72)
                      {
                        if (!v84 && !v87 && !v91 && !v94)
                          goto LABEL_138;
                        if (!v88)
                          v8 = 0x4000;
                      }
                      else if (v88 || v95)
                      {
                        v8 = 0x4000;
                      }
                      else
                      {
                        v8 = 0x2000;
                      }
                      if (v94)
                        CFRelease(v94);
                      if (v91)
                        CFRelease(v91);
                      v98 = v108;
                      v101 = cf2;
                      v100 = v118;
                      if (v87)
                        CFRelease(v87);
                      v96 = v110;
                      if (v84)
                        CFRelease(v84);
                      v97 = theString2;
                      v99 = cf1;
                      goto LABEL_153;
                    }
                  }
                }
                else
                {
                  v72 = 0;
                  if (!v63)
                    goto LABEL_124;
                }
                v81 = v63;
LABEL_123:
                CFRelease(v81);
                goto LABEL_124;
              }
            }
          }
          v64 = copyVolumePathComponentsAsArray((BookmarkData *)v123, 1u);
          v65 = (const __CFString *)*MEMORY[0x1E0C9B3E0];
          v66 = CFStringGetTypeID();
          v67 = (const __CFString *)BookmarkCopyPropertyFromBookmarkData((BookmarkData *)v123, v65, v66);
          v68 = copyVolumePathComponentsAsArray((BookmarkData *)v121, 1u);
          v69 = CFStringGetTypeID();
          v70 = (const __CFString *)BookmarkCopyPropertyFromBookmarkData((BookmarkData *)v121, v65, v69);
          v71 = v70;
          if (v67)
          {
            if (v70)
            {
              v72 = 1;
              if (CFStringCompare(v67, v70, 1uLL) == kCFCompareEqualTo)
                goto LABEL_118;
            }
          }
          v73 = (const __CFString *)*MEMORY[0x1E0C9B3D0];
          v74 = CFStringGetTypeID();
          v75 = (const __CFString *)BookmarkCopyPropertyFromBookmarkData((BookmarkData *)v123, v73, v74);
          v76 = CFStringGetTypeID();
          v77 = (const __CFString *)BookmarkCopyPropertyFromBookmarkData((BookmarkData *)v121, v73, v76);
          v78 = v77;
          if (v75)
          {
            if (v77)
            {
              v72 = CFStringCompare(v75, v77, 1uLL) == kCFCompareEqualTo;
              CFRelease(v78);
            }
            else
            {
              v72 = 0;
            }
            v78 = v75;
          }
          else
          {
            v72 = 0;
            if (!v77)
            {
LABEL_117:
              if (!v71)
              {
LABEL_119:
                if (v68)
                  CFRelease(v68);
                if (!v67)
                  goto LABEL_124;
                v81 = v67;
                goto LABEL_123;
              }
LABEL_118:
              CFRelease(v71);
              goto LABEL_119;
            }
          }
          CFRelease(v78);
          goto LABEL_117;
        }
        v8 = 61440;
      }
      else
      {
        v8 = 0;
      }
LABEL_51:
      BookmarkData::~BookmarkData((BookmarkData *)v121);
      BookmarkData::~BookmarkData((BookmarkData *)v123);
      return v8;
    }
    return 0;
  }
  return v8;
}

BOOL compareBookmarkProperties(BookmarkData *a1, BookmarkData *a2, const __CFString *cf2)
{
  CFNumberRef v5;
  CFNumberRef v6;
  CFNumberRef v7;
  _BOOL8 v8;

  v5 = BookmarkCopyPropertyFromBookmarkData(a1, cf2, 0);
  v6 = BookmarkCopyPropertyFromBookmarkData(a2, cf2, 0);
  v7 = v6;
  if (v5)
  {
    if (v6)
    {
      v8 = CFEqual(v5, v6) != 0;
      CFRelease(v7);
    }
    else
    {
      v8 = 1;
    }
    v7 = v5;
  }
  else
  {
    v8 = 1;
    if (!v6)
      return v8;
  }
  CFRelease(v7);
  return v8;
}

double ___ZL43BookmarkResourcePropertyKeyToInfoStructInitv_block_invoke()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD *v10;
  double result;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;

  v39 = *MEMORY[0x1E0C9B520];
  v38 = *MEMORY[0x1E0C9B4E0];
  v37 = *MEMORY[0x1E0C9B530];
  v36 = *MEMORY[0x1E0C9B550];
  v35 = *MEMORY[0x1E0C9B508];
  v34 = *MEMORY[0x1E0C9B538];
  v33 = *MEMORY[0x1E0C9B548];
  v32 = *MEMORY[0x1E0C9B4F8];
  v31 = *MEMORY[0x1E0C9B4C8];
  v67 = *MEMORY[0x1E0C9B4D8];
  v30 = *MEMORY[0x1E0C9B6D8];
  v29 = *MEMORY[0x1E0C9B6A8];
  v28 = *MEMORY[0x1E0C9B6E0];
  v27 = *MEMORY[0x1E0C9B6B8];
  v26 = *MEMORY[0x1E0C9B6E8];
  v25 = *MEMORY[0x1E0C9B6C8];
  v24 = *MEMORY[0x1E0C9AD98];
  v23 = *MEMORY[0x1E0C9ADC0];
  v22 = *MEMORY[0x1E0C9B790];
  v21 = *MEMORY[0x1E0C9B7B8];
  v20 = *MEMORY[0x1E0C9B778];
  v19 = *MEMORY[0x1E0C9B788];
  v18 = *MEMORY[0x1E0C9B6D0];
  v17 = *MEMORY[0x1E0C9B7A8];
  v16 = *MEMORY[0x1E0C9B7C8];
  v15 = *MEMORY[0x1E0C9B748];
  v14 = *MEMORY[0x1E0C9B740];
  v13 = *MEMORY[0x1E0C9B5A0];
  v12 = *MEMORY[0x1E0C9AC50];
  sResourcePropertiesInfoCount = 1;
  sResourcePropertiesInfoCountIncludedInAll = 1;
  v0 = *MEMORY[0x1E0C9B580];
  v1 = *MEMORY[0x1E0C9AC28];
  v2 = *MEMORY[0x1E0C9AC30];
  v3 = *MEMORY[0x1E0C9B408];
  v4 = *MEMORY[0x1E0C9B3F8];
  v5 = *MEMORY[0x1E0C9B400];
  v6 = *MEMORY[0x1E0C9B3C0];
  v7 = *MEMORY[0x1E0C9B570];
  v8 = *MEMORY[0x1E0C9B5E0];
  v9 = *MEMORY[0x1E0C9B588];
  v40 = *MEMORY[0x1E0C9B568];
  v41 = *MEMORY[0x1E0C9B578];
  v42 = *MEMORY[0x1E0C9AD58];
  v43 = *MEMORY[0x1E0C9B4A8];
  v44 = *MEMORY[0x1E0C9B420];
  v45 = *MEMORY[0x1E0C9ABF8];
  v46 = *MEMORY[0x1E0C9B518];
  v47 = *MEMORY[0x1E0C9B558];
  v48 = *MEMORY[0x1E0C9B4F0];
  v49 = *MEMORY[0x1E0C9AC58];
  v50 = *MEMORY[0x1E0C9AC40];
  v51 = *MEMORY[0x1E0C9ABF0];
  v52 = *MEMORY[0x1E0C9AD68];
  v53 = *MEMORY[0x1E0C9AD48];
  v54 = *MEMORY[0x1E0C9B3D0];
  v55 = *MEMORY[0x1E0C9B3E0];
  v56 = *MEMORY[0x1E0C9B3D8];
  v57 = *MEMORY[0x1E0C9B3E8];
  v58 = *MEMORY[0x1E0C9B718];
  v59 = *MEMORY[0x1E0C9B5B0];
  v60 = *MEMORY[0x1E0C9B6B0];
  v61 = *MEMORY[0x1E0C9B7F0];
  v62 = *MEMORY[0x1E0C9B7E8];
  v63 = *MEMORY[0x1E0C9ABE8];
  v64 = *MEMORY[0x1E0C9B7D0];
  v65 = *MEMORY[0x1E0C9B698];
  v66 = *MEMORY[0x1E0C9B3C8];
  v10 = malloc_type_malloc(0x8C0uLL, 0x10E00408BA53399uLL);
  *v10 = v39;
  v10[4] = v38;
  v10[8] = v37;
  v10[12] = v36;
  v10[16] = v35;
  v10[20] = v34;
  v10[24] = v33;
  v10[28] = v32;
  v10[32] = v31;
  v10[40] = v30;
  v10[44] = v29;
  v10[48] = v28;
  v10[52] = v27;
  v10[56] = v26;
  v10[60] = v25;
  v10[64] = v24;
  v10[68] = v23;
  v10[72] = v22;
  v10[76] = v21;
  v10[80] = v20;
  v10[84] = v19;
  v10[88] = v18;
  v10[92] = v17;
  v10[96] = v16;
  v10[100] = v15;
  v10[104] = v14;
  v10[108] = v13;
  v10[112] = v12;
  v10[116] = v0;
  v10[120] = v1;
  v10[124] = v2;
  v10[128] = v3;
  v10[132] = v4;
  v10[136] = v5;
  v10[140] = v6;
  v10[144] = v7;
  v10[148] = v8;
  v10[152] = v9;
  sResourcePropertiesInfoPtr = (uint64_t)v10;
  v10[19] = 16;
  v10[35] = 256;
  *((_DWORD *)v10 + 2) = 4112;
  *((_DWORD *)v10 + 10) = 4112;
  *((_DWORD *)v10 + 18) = 4112;
  *((_DWORD *)v10 + 26) = 4112;
  *((_DWORD *)v10 + 34) = 4112;
  *((_DWORD *)v10 + 42) = 4112;
  *((_DWORD *)v10 + 50) = 4112;
  *((_DWORD *)v10 + 58) = 4112;
  *((_DWORD *)v10 + 66) = 4112;
  *((_DWORD *)v10 + 74) = 4112;
  v10[7] = 2;
  v10[47] = 2;
  v10[15] = 8;
  v10[51] = 8;
  v10[23] = 32;
  v10[55] = 32;
  v10[27] = 64;
  v10[59] = 64;
  v10[31] = 128;
  v10[63] = 128;
  v10[39] = 512;
  v10[67] = 512;
  v10[71] = 4096;
  v10[75] = 0x100000000;
  v10[79] = 0x1000000000;
  v10[83] = 0x2000000000000;
  v10[87] = 0x10000000000;
  v10[91] = 0x20000000000000;
  v10[95] = 0x40000000000000;
  v10[99] = 0x80000000000000;
  v10[103] = 0x80000000000;
  *((_DWORD *)v10 + 82) = 8224;
  *((_DWORD *)v10 + 90) = 8224;
  *((_DWORD *)v10 + 98) = 8224;
  *((_DWORD *)v10 + 106) = 8224;
  *((_DWORD *)v10 + 114) = 8224;
  *((_DWORD *)v10 + 122) = 8224;
  *((_DWORD *)v10 + 130) = 8224;
  *((_DWORD *)v10 + 138) = 8224;
  *((_DWORD *)v10 + 146) = 8224;
  *((_DWORD *)v10 + 154) = 8224;
  *((_DWORD *)v10 + 162) = 8224;
  *((_DWORD *)v10 + 170) = 8224;
  *((_DWORD *)v10 + 178) = 8224;
  *((_DWORD *)v10 + 186) = 8224;
  *((_DWORD *)v10 + 194) = 8224;
  *((_DWORD *)v10 + 202) = 8224;
  *((_DWORD *)v10 + 210) = 8224;
  v10[46] = extractVPFlags;
  v10[50] = extractVPFlags;
  v10[54] = extractVPFlags;
  v10[58] = extractVPFlags;
  v10[62] = extractVPFlags;
  v10[42] = extractVPFlags;
  v10[66] = extractVPFlags;
  v10[70] = extractVPFlags;
  v10[74] = extractVPFlags;
  v10[78] = extractVPFlags;
  v10[82] = extractVPFlags;
  v10[86] = extractVPFlags;
  v10[90] = extractVPFlags;
  v10[94] = extractVPFlags;
  v10[98] = extractVPFlags;
  v10[102] = extractVPFlags;
  v10[106] = extractVPFlags;
  v10[107] = 0x100000000000;
  *((_DWORD *)v10 + 218) = 4128;
  v10[110] = extractNameKey;
  *((_DWORD *)v10 + 226) = 4144;
  v10[114] = extractFileIDKey;
  *((_DWORD *)v10 + 234) = 61463;
  *((_DWORD *)v10 + 242) = 61473;
  *((_DWORD *)v10 + 250) = 61472;
  *((_DWORD *)v10 + 258) = 4160;
  *((_DWORD *)v10 + 266) = 4161;
  *((_DWORD *)v10 + 274) = 4162;
  *((_DWORD *)v10 + 282) = 4163;
  *((_DWORD *)v10 + 298) = 983044;
  *((_DWORD *)v10 + 306) = 983045;
  v10[156] = v40;
  *((_DWORD *)v10 + 314) = 983046;
  v10[6] = extractRPFlags;
  v10[14] = extractRPFlags;
  v10[18] = extractRPFlags;
  v10[22] = extractRPFlags;
  v10[26] = extractRPFlags;
  v10[30] = extractRPFlags;
  v10[34] = extractRPFlags;
  v10[38] = extractRPFlags;
  v10[10] = extractRPFlags;
  v10[11] = 4;
  v10[2] = extractRPFlags;
  v10[3] = 1;
  v10[36] = v67;
  v10[43] = 1;
  v10[111] = 0;
  v10[115] = 0;
  result = 0.0;
  *((_OWORD *)v10 + 59) = 0u;
  *((_OWORD *)v10 + 61) = 0u;
  *((_OWORD *)v10 + 63) = 0u;
  *((_OWORD *)v10 + 65) = 0u;
  *((_OWORD *)v10 + 67) = 0u;
  *((_OWORD *)v10 + 69) = 0u;
  *((_OWORD *)v10 + 71) = 0u;
  *((_DWORD *)v10 + 290) = 983041;
  *((_OWORD *)v10 + 73) = 0u;
  *((_OWORD *)v10 + 75) = 0u;
  *((_OWORD *)v10 + 77) = 0u;
  *((_OWORD *)v10 + 79) = 0u;
  v10[160] = v41;
  *((_DWORD *)v10 + 322) = 983048;
  *((_OWORD *)v10 + 81) = 0u;
  v10[164] = v42;
  *((_DWORD *)v10 + 330) = 61474;
  *((_OWORD *)v10 + 83) = 0u;
  v10[168] = v43;
  *((_DWORD *)v10 + 338) = 983049;
  *((_OWORD *)v10 + 85) = 0u;
  v10[172] = v44;
  *((_DWORD *)v10 + 346) = 61450;
  *((_OWORD *)v10 + 87) = 0u;
  v10[176] = v67;
  *((_DWORD *)v10 + 354) = 983051;
  *((_OWORD *)v10 + 89) = 0u;
  v10[180] = v45;
  *((_DWORD *)v10 + 362) = 983052;
  *((_OWORD *)v10 + 91) = 0u;
  v10[184] = v46;
  *((_DWORD *)v10 + 370) = 983053;
  *((_OWORD *)v10 + 93) = 0u;
  v10[188] = v47;
  *((_DWORD *)v10 + 378) = 983054;
  *((_OWORD *)v10 + 95) = 0u;
  v10[192] = v48;
  *((_DWORD *)v10 + 386) = 983055;
  *((_OWORD *)v10 + 97) = 0u;
  v10[196] = v49;
  *((_DWORD *)v10 + 394) = 983057;
  *((_OWORD *)v10 + 99) = 0u;
  v10[200] = v50;
  *((_DWORD *)v10 + 402) = 983058;
  *((_OWORD *)v10 + 101) = 0u;
  v10[204] = v51;
  *((_DWORD *)v10 + 410) = 983059;
  *((_OWORD *)v10 + 103) = 0u;
  v10[208] = v52;
  *((_DWORD *)v10 + 418) = 251658516;
  *((_OWORD *)v10 + 105) = 0u;
  v10[212] = v53;
  *((_DWORD *)v10 + 426) = 983061;
  *((_OWORD *)v10 + 107) = 0u;
  v10[216] = v54;
  *((_DWORD *)v10 + 434) = 65280;
  v10[218] = returnPathComponentsAsString;
  v10[219] = 0;
  v10[220] = v55;
  *((_DWORD *)v10 + 442) = 65281;
  v10[222] = returnRelativePathComponentsAsStringForVolume;
  v10[223] = 1;
  v10[224] = v56;
  *((_DWORD *)v10 + 450) = 65283;
  v10[226] = returnPathComponentsArray;
  v10[227] = 0;
  v10[228] = v57;
  *((_DWORD *)v10 + 458) = 65282;
  v10[230] = returnVolumeNameAsString;
  v10[231] = 0;
  v10[232] = v58;
  *((_DWORD *)v10 + 466) = 0;
  v10[234] = returnVolumeNameAsString;
  v10[235] = 0;
  v10[236] = v59;
  *((_DWORD *)v10 + 474) = 0;
  v10[238] = returnPathComponentsAsString;
  v10[239] = 0;
  v10[240] = v60;
  *((_DWORD *)v10 + 482) = 0;
  v10[242] = extractVPFlagsAndNegate;
  v10[243] = 4;
  v10[244] = v61;
  *((_DWORD *)v10 + 490) = 8209;
  *((_OWORD *)v10 + 123) = 0u;
  v10[248] = v62;
  *((_DWORD *)v10 + 498) = 0;
  v10[250] = returnVolumeURL;
  v10[251] = 0;
  v10[252] = v63;
  *((_DWORD *)v10 + 506) = 0;
  v10[254] = returnURLString;
  v10[255] = 0;
  v10[256] = v64;
  *((_DWORD *)v10 + 514) = 8210;
  *((_OWORD *)v10 + 129) = 0u;
  v10[260] = v65;
  *((_DWORD *)v10 + 522) = 8211;
  *((_OWORD *)v10 + 131) = 0u;
  v10[264] = v66;
  *((_DWORD *)v10 + 530) = 8304;
  *((_OWORD *)v10 + 133) = 0u;
  v10[268] = CFSTR("NSURLBookmarkAllPropertiesKey");
  *((_DWORD *)v10 + 538) = 0;
  v10[270] = returnAllPropertiesInBookmark;
  v10[271] = 0;
  v10[272] = CFSTR("NSURLBookmarkAllPropertyKeysKey");
  *((_DWORD *)v10 + 546) = 0;
  v10[274] = returnAllPropertyKeysInBookmark;
  v10[275] = 0;
  v10[276] = CFSTR("NSURLBookmarkDetailedDescription");
  *((_DWORD *)v10 + 554) = 0;
  v10[278] = returnDetailedDump;
  v10[279] = 0;
  return result;
}

CFTypeRef extractRPFlags(BookmarkData *a1, int a2, uint64_t a3)
{
  CFTypeRef *v4;
  CFTypeRef v5;
  _QWORD v7[3];

  if (!BookmarkData::getURLResourceProperties(a1, a2, (uint64_t)v7) || (v7[1] & a3) == 0)
    return 0;
  v4 = (CFTypeRef *)MEMORY[0x1E0C9AE40];
  if ((v7[0] & a3) != 0)
    v4 = (CFTypeRef *)MEMORY[0x1E0C9AE50];
  v5 = *v4;
  CFRetain(*v4);
  return v5;
}

CFTypeRef extractVPFlags(BookmarkData *a1, int a2, uint64_t a3)
{
  CFTypeRef *v4;
  CFTypeRef v5;
  _QWORD v7[3];

  if (!BookmarkData::getURLVolumeProperties(a1, a2, (uint64_t)v7) || (v7[1] & a3) == 0)
    return 0;
  v4 = (CFTypeRef *)MEMORY[0x1E0C9AE40];
  if ((v7[0] & a3) != 0)
    v4 = (CFTypeRef *)MEMORY[0x1E0C9AE50];
  v5 = *v4;
  CFRetain(*v4);
  return v5;
}

CFNumberRef extractNameKey(BookmarkData *a1, unsigned int a2)
{
  CFTypeID TypeID;
  CFNumberRef result;
  unsigned int v6;

  TypeID = CFStringGetTypeID();
  result = (CFNumberRef)BookmarkData::copyItem(a1, 0x1020u, a2, TypeID);
  if (!result)
  {
    v6 = countPathComponents(a1, a2);
    if (v6)
      return copyIndexedPathComponent(a1, a2, v6 - 1);
    else
      return 0;
  }
  return result;
}

const void *extractFileIDKey(BookmarkData *a1, unsigned int a2)
{
  CFTypeID TypeID;
  const void *v5;
  CFTypeID v6;
  const __CFArray *v7;
  const __CFArray *v8;
  CFIndex Count;
  const void *ValueAtIndex;

  TypeID = CFNumberGetTypeID();
  v5 = BookmarkData::copyItem(a1, 0x1030u, 1u, TypeID);
  if (!v5)
  {
    v6 = CFArrayGetTypeID();
    v7 = (const __CFArray *)BookmarkData::copyItem(a1, 0x1005u, a2, v6);
    if (v7)
    {
      v8 = v7;
      Count = CFArrayGetCount(v7);
      if (Count >= 1)
      {
        ValueAtIndex = CFArrayGetValueAtIndex(v8, Count - 1);
        v5 = ValueAtIndex;
        if (!ValueAtIndex)
        {
LABEL_9:
          CFRelease(v8);
          return v5;
        }
        if (CFGetTypeID(ValueAtIndex) == TypeID)
        {
          CFRetain(v5);
          goto LABEL_9;
        }
      }
      v5 = 0;
      goto LABEL_9;
    }
    return 0;
  }
  return v5;
}

const __CFString *returnPathComponentsAsString(BookmarkData *a1, int a2, unint64_t a3)
{
  const __CFString *v3;
  const __CFString *v4;
  CFIndex Length;
  CFIndex v6;
  CFStringRef v7;
  CFRange v9;

  if (HIDWORD(a3))
    return 0;
  v3 = copyPathComponentsAsString(a1, a2, a3, 1);
  v4 = v3;
  if (v3)
  {
    Length = CFStringGetLength(v3);
    if (Length >= 2)
    {
      v6 = Length - 1;
      if (CFStringGetCharacterAtIndex(v4, Length - 1) == 47)
      {
        v9.location = 0;
        v9.length = v6;
        v7 = CFStringCreateWithSubstring((CFAllocatorRef)*MEMORY[0x1E0C9AE00], v4, v9);
        CFRelease(v4);
        return v7;
      }
    }
  }
  return v4;
}

CFStringRef returnRelativePathComponentsAsStringForVolume(BookmarkData *a1, int a2, uint64_t a3)
{
  CFTypeID TypeID;
  const __CFArray *v7;
  const __CFArray *v8;
  const __CFAllocator *v9;
  CFNumberRef v10;
  CFIndex LastIndexOfValue;
  const __CFString *v12;
  const __CFString *v13;
  CFIndex Length;
  CFIndex v15;
  CFStringRef v16;
  uint64_t valuePtr;
  CFRange v19;
  CFRange v20;

  if (a3)
  {
    TypeID = CFArrayGetTypeID();
    v7 = (const __CFArray *)BookmarkData::copyItem(a1, 0x2000u, 1u, TypeID);
    if (v7)
    {
      v8 = v7;
      if (CFArrayGetCount(v7) < 1)
      {
        v12 = copyPathComponentsAsString(a1, a2, 0, 0);
        goto LABEL_14;
      }
      v9 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
      valuePtr = a3;
      v10 = CFNumberCreate(v9, kCFNumberSInt64Type, &valuePtr);
      v19.length = CFArrayGetCount(v8);
      v19.location = 0;
      LastIndexOfValue = CFArrayGetLastIndexOfValue(v8, v19, v10);
      if (LastIndexOfValue == -1)
      {
        v12 = 0;
        if (!v10)
          goto LABEL_14;
      }
      else
      {
        v12 = copyPathComponentsAsString(a1, a2, LastIndexOfValue, 0);
        if (!v10)
        {
LABEL_14:
          CFRelease(v8);
          if (!v12)
            return v12;
          goto LABEL_15;
        }
      }
      CFRelease(v10);
      goto LABEL_14;
    }
    v13 = copyPathComponentsAsString(a1, a2, 0, 0);
  }
  else
  {
    v13 = returnPathComponentsAsString(a1, a2, 0);
  }
  v12 = v13;
  if (!v13)
    return v12;
LABEL_15:
  Length = CFStringGetLength(v12);
  if (Length >= 2)
  {
    v15 = Length - 1;
    if (CFStringGetCharacterAtIndex(v12, Length - 1) == 47)
    {
      v20.location = 0;
      v20.length = v15;
      v16 = CFStringCreateWithSubstring((CFAllocatorRef)*MEMORY[0x1E0C9AE00], v12, v20);
      CFRelease(v12);
      return v16;
    }
  }
  return v12;
}

CFArrayRef returnPathComponentsArray(BookmarkData *a1, int a2)
{
  return copyPathComponentsAsArray(a1, a2, 0);
}

const void *returnVolumeNameAsString(BookmarkData *a1, unsigned int a2)
{
  CFTypeID TypeID;

  TypeID = CFStringGetTypeID();
  return BookmarkData::copyItem(a1, 0x2010u, a2, TypeID);
}

CFTypeRef extractVPFlagsAndNegate(BookmarkData *a1, int a2, uint64_t a3)
{
  CFTypeRef *v4;
  CFTypeRef v5;
  _QWORD v7[3];

  if (!BookmarkData::getURLVolumeProperties(a1, a2, (uint64_t)v7) || (v7[1] & a3) == 0)
    return 0;
  v4 = (CFTypeRef *)MEMORY[0x1E0C9AE50];
  if ((v7[0] & a3) != 0)
    v4 = (CFTypeRef *)MEMORY[0x1E0C9AE40];
  v5 = *v4;
  CFRetain(*v4);
  return v5;
}

CFURLRef returnVolumeURL(BookmarkData *a1, unsigned int a2)
{
  CFURLRef v4;
  CFTypeID TypeID;
  const __CFString *v6;
  const __CFString *v7;
  BOOL v9;

  v9 = 0;
  if (!BookmarkData::getItemAs(a1, 0x2030u, a2, &v9)
    || !v9
    || (v4 = CFURLCreateWithFileSystemPath((CFAllocatorRef)*MEMORY[0x1E0C9AE00], CFSTR("/"), kCFURLPOSIXPathStyle, 1u)) == 0)
  {
    TypeID = CFStringGetTypeID();
    v6 = (const __CFString *)BookmarkData::copyItem(a1, 0x2002u, a2, TypeID);
    if (v6)
    {
      v7 = v6;
      v4 = CFURLCreateWithFileSystemPath((CFAllocatorRef)*MEMORY[0x1E0C9AE00], v6, kCFURLPOSIXPathStyle, 1u);
      CFRelease(v7);
    }
    else
    {
      return 0;
    }
  }
  return v4;
}

void *returnURLString(BookmarkData *a1, unsigned int a2)
{
  CFTypeID TypeID;
  void *v5;
  const __CFString *v6;
  const __CFString *v7;
  const __CFString *v8;
  CFTypeID v9;
  const __CFBoolean *v10;
  const __CFBoolean *v11;
  Boolean Value;
  const __CFURL *v13;
  const __CFURL *v14;
  CFStringRef v15;

  TypeID = CFStringGetTypeID();
  v5 = (void *)BookmarkData::copyItem(a1, 0x1003u, a2, TypeID);
  if (!v5)
  {
    v6 = returnPathComponentsAsString(a1, a2, 0);
    if (v6)
    {
      v7 = v6;
      v8 = (const __CFString *)*MEMORY[0x1E0C9B4E0];
      v9 = CFBooleanGetTypeID();
      v10 = BookmarkCopyPropertyFromBookmarkData(a1, v8, v9);
      v11 = v10;
      if (v10)
        Value = CFBooleanGetValue(v10);
      else
        Value = 0;
      v13 = CFURLCreateWithFileSystemPath((CFAllocatorRef)*MEMORY[0x1E0C9AE00], v7, kCFURLPOSIXPathStyle, Value);
      if (v13)
      {
        v14 = v13;
        v15 = CFURLGetString(v13);
        v5 = (void *)v15;
        if (v15)
          CFRetain(v15);
        CFRelease(v14);
        if (!v11)
          goto LABEL_12;
      }
      else
      {
        v5 = 0;
        if (!v11)
          goto LABEL_12;
      }
      CFRelease(v11);
LABEL_12:
      CFRelease(v7);
      return v5;
    }
    return 0;
  }
  return v5;
}

CFArrayRef returnAllPropertyKeysInBookmark(BookmarkData *a1, uint64_t a2)
{
  __CFDictionary *v3;
  const __CFDictionary *v4;
  CFIndex Count;
  unint64_t v6;
  const void **v7;
  size_t v8;
  const __CFAllocator *v9;
  CFIndex v10;
  CFArrayRef v11;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x1E0C80C00];
  v3 = copyAllPropertiesInBookmark(a1, a2);
  if (!v3)
    return 0;
  v4 = v3;
  if (CFDictionaryGetCount(v3) < 1)
  {
    v11 = 0;
  }
  else
  {
    Count = CFDictionaryGetCount(v4);
    MEMORY[0x1E0C80A78](Count);
    v7 = (const void **)((char *)v13 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0));
    if (v6 >= 0x200)
      v8 = 512;
    else
      v8 = v6;
    bzero((char *)v13 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0), v8);
    CFDictionaryGetKeysAndValues(v4, v7, 0);
    v9 = *(const __CFAllocator **)a1;
    v10 = CFDictionaryGetCount(v4);
    v11 = CFArrayCreate(v9, v7, v10, MEMORY[0x1E0C9B378]);
  }
  CFRelease(v4);
  return v11;
}

__CFString *returnDetailedDump(const void **a1)
{
  return _CFURLBookmarkDataCopyDescription(a1[1]);
}

__CFDictionary *copyAllPropertiesInBookmark(BookmarkData *a1, uint64_t a2)
{
  __CFDictionary *Mutable;
  _DWORD *IndexedItemInTOC;
  _DWORD *v6;
  unsigned int v7;
  unsigned int *DataItemAtOffset;
  CFNumberRef v9;
  CFNumberRef v10;
  CFNumberRef v11;
  BOOL v12;
  uint64_t v13;
  unint64_t v14;
  const void *v15;
  uint64_t v16;
  uint64_t (*v17)(BookmarkData *, uint64_t, _QWORD);
  const void *v18;
  unsigned int v19;
  const void *v20;
  const void *v21;
  BOOL v22;
  BOOL v24;
  uint64_t v25;
  unint64_t v26;
  uint64_t (*v27)(BookmarkData *, uint64_t, _QWORD);
  const void *v28;
  const void *v29;
  const void *v30;
  __CFDictionary *v31;

  Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0, MEMORY[0x1E0C9B390], MEMORY[0x1E0C9B3A0]);
  if (BookmarkResourcePropertyKeyToInfoStructInit(void)::onceToken != -1)
    dispatch_once(&BookmarkResourcePropertyKeyToInfoStructInit(void)::onceToken, &__block_literal_global_1);
  IndexedItemInTOC = BookmarkData::getIndexedItemInTOC(a1, 0, 1);
  if (IndexedItemInTOC)
  {
    v6 = IndexedItemInTOC;
    v7 = 1;
    while ((*v6 & 0x80000000) == 0)
    {
LABEL_16:
      v6 = BookmarkData::getIndexedItemInTOC(a1, v7++, 1);
      if (!v6)
        goto LABEL_17;
    }
    DataItemAtOffset = BookmarkData::getDataItemAtOffset(a1, *v6 & 0x7FFFFFFF);
    v9 = BookmarkData::copyItem((CFAllocatorRef *)a1, DataItemAtOffset, 0);
    v10 = BookmarkData::copyItem(a1, (uint64_t)v6, 0);
    v11 = v10;
    if (!Mutable || (v9 ? (v12 = v10 == 0) : (v12 = 1), v12))
    {
      if (!v10)
        goto LABEL_14;
    }
    else
    {
      CFDictionaryAddValue(Mutable, v9, v10);
    }
    CFRelease(v11);
LABEL_14:
    if (v9)
      CFRelease(v9);
    goto LABEL_16;
  }
LABEL_17:
  if (sResourcePropertiesInfoCountIncludedInAll == 1)
  {
    v13 = 0;
    v14 = 0;
    while (1)
    {
      v15 = *(const void **)(sResourcePropertiesInfoPtr + v13);
      if (!v15 || CFDictionaryContainsKey(Mutable, v15))
        goto LABEL_36;
      v16 = sResourcePropertiesInfoPtr + v13;
      v17 = *(uint64_t (**)(BookmarkData *, uint64_t, _QWORD))(sResourcePropertiesInfoPtr + v13 + 16);
      if (v17)
        break;
      v19 = *(_DWORD *)(v16 + 8);
      if (v19 >> 8 <= 0xFE)
      {
        v18 = BookmarkData::copyItem(a1, v19, a2, 0);
        goto LABEL_25;
      }
      v20 = 0;
LABEL_26:
      v21 = *(const void **)(sResourcePropertiesInfoPtr + v13);
      if (v20)
        v22 = Mutable == 0;
      else
        v22 = 1;
      if (v22 || v21 == 0)
      {
        if (!v20)
          goto LABEL_36;
      }
      else
      {
        CFDictionaryAddValue(Mutable, v21, v20);
      }
      CFRelease(v20);
LABEL_36:
      if (sResourcePropertiesInfoCountIncludedInAll == 1)
      {
        v13 += 32;
        v24 = v14++ >= 0x42;
        if (!v24)
          continue;
      }
      goto LABEL_41;
    }
    v18 = (const void *)v17(a1, a2, *(_QWORD *)(v16 + 24));
LABEL_25:
    v20 = v18;
    goto LABEL_26;
  }
LABEL_41:
  if (sResourcePropertiesInfoCount == 1)
  {
    v25 = 0;
    v26 = 0;
    do
    {
      if (*(_DWORD *)(sResourcePropertiesInfoPtr + v25 + 8) >= 0xF000u)
      {
        if (*(_QWORD *)(sResourcePropertiesInfoPtr + v25))
        {
          v27 = *(uint64_t (**)(BookmarkData *, uint64_t, _QWORD))(sResourcePropertiesInfoPtr + v25 + 16);
          if (v27)
          {
            v28 = (const void *)v27(a1, a2, *(_QWORD *)(sResourcePropertiesInfoPtr + v25 + 24));
            if (v28)
            {
              v29 = v28;
              if (Mutable)
              {
                v30 = *(const void **)(sResourcePropertiesInfoPtr + v25);
                if (v30)
                  CFDictionaryAddValue(Mutable, v30, v28);
              }
              CFRelease(v29);
            }
          }
        }
      }
      if (sResourcePropertiesInfoCount != 1)
        break;
      v25 += 32;
      v24 = v26++ >= 0x45;
    }
    while (!v24);
  }
  if (!Mutable)
    return 0;
  if (CFDictionaryGetCount(Mutable) < 1)
  {
    v31 = 0;
  }
  else
  {
    CFRetain(Mutable);
    v31 = Mutable;
  }
  CFRelease(Mutable);
  return v31;
}

void *_CFURLCreateByResolvingBookmarkData(const __CFAllocator *a1, const __CFData *a2, unint64_t a3, const __CFURL *a4, const __CFArray *a5, BOOL *a6, CFErrorRef *a7)
{
  NSObject *v14;
  void *v15;
  NSObject *v16;
  const __CFURL *v18;
  CFTypeID v19;
  int IsReachable;
  const __CFURL *PathComponent;
  const __CFURL *v22;
  __CFError *v23;
  NSObject *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  const __CFURL *v32;
  const __CFURL *v33;
  CFTypeRef cf;
  CFTypeRef v35;
  os_activity_scope_state_s state;
  uint64_t v37;
  uint64_t v38;
  _BYTE v39[16];
  uint64_t v40;

  v14 = _os_activity_create(&dword_1817A6000, "CFURLResolveBookmarkData", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_IF_NONE_PRESENT);
  os_activity_scope_enter(v14, &state);
  cf = 0;
  v35 = 0;
  v15 = createByResolvingBookmarkDataInternal(a1, a2, a3, a4, a5, a6, (__CFError **)&v35, (const __CFURL **)&cf);
  if (v15)
  {
LABEL_2:
    v16 = resolveLog;
    if (os_log_type_enabled((os_log_t)resolveLog, OS_LOG_TYPE_DEBUG))
      _CFURLCreateByResolvingBookmarkData_cold_2((uint64_t)v15, v16);
    goto LABEL_4;
  }
  v18 = (const __CFURL *)cf;
  if (!cf)
    goto LABEL_30;
  if (!a2)
    goto LABEL_30;
  if ((a3 & 0x4000) != 0)
    goto LABEL_30;
  v19 = CFGetTypeID(a2);
  if (v19 != CFDataGetTypeID())
    goto LABEL_30;
  BookmarkData::BookmarkData((BookmarkData *)v39, a1, a2);
  if (!v40)
    goto LABEL_29;
  if (!BookmarkData::getURLResourceProperties((BookmarkData *)v39, 1, (uint64_t)&v37))
    goto LABEL_19;
  if ((v38 & v37 & 8) != 0)
  {
LABEL_29:
    BookmarkData::~BookmarkData((BookmarkData *)v39);
    goto LABEL_30;
  }
  if ((v38 & 0x10) != 0 && (v38 & v37 & 2) != 0)
  {
    IsReachable = v37 & 0x10;
    goto LABEL_21;
  }
LABEL_19:
  PathComponent = CFURLCreateCopyDeletingLastPathComponent(a1, v18);
  if (!PathComponent)
    goto LABEL_29;
  v22 = PathComponent;
  IsReachable = CFURLResourceIsReachable(PathComponent, 0);
  CFRelease(v22);
LABEL_21:
  BookmarkData::~BookmarkData((BookmarkData *)v39);
  if (IsReachable)
  {
    if ((a3 & 0x1000) != 0)
    {
      v32 = (const __CFURL *)_CFURLCopyPromiseURLOfLogicalURL();
      if (!v32)
        goto LABEL_30;
      v33 = v32;
      if (CFURLResourceIsReachable(v32, 0))
      {
        _CFURLPromiseSetPhysicalURL();
        v15 = (void *)cf;
        cf = 0;
      }
      else
      {
        v15 = 0;
      }
      CFRelease(v33);
    }
    else
    {
      if (!DownloadCloudDocumentSync((const __CFURL *)cf))
        goto LABEL_30;
      if (v35)
      {
        CFRelease(v35);
        v35 = 0;
      }
      if (cf)
      {
        CFRelease(cf);
        cf = 0;
      }
      v15 = createByResolvingBookmarkDataInternal(a1, a2, a3, a4, a5, a6, (__CFError **)&v35, (const __CFURL **)&cf);
    }
    if (v15)
      goto LABEL_2;
  }
LABEL_30:
  v15 = 0;
  if (a7)
  {
    v23 = (__CFError *)v35;
    v35 = 0;
    *a7 = v23;
    if (!v23)
    {
      v24 = resolveLog;
      if (os_log_type_enabled((os_log_t)resolveLog, OS_LOG_TYPE_ERROR))
        _CFURLCreateByResolvingBookmarkData_cold_1(v24, v25, v26, v27, v28, v29, v30, v31);
      v15 = 0;
      *a7 = CFErrorCreate((CFAllocatorRef)*MEMORY[0x1E0C9AE00], (CFErrorDomain)*MEMORY[0x1E0C9AFB8], 256, 0);
    }
  }
LABEL_4:
  os_activity_scope_leave(&state);
  os_release(v14);
  if (cf)
    CFRelease(cf);
  if (v35)
    CFRelease(v35);
  return v15;
}

const __CFURL *createByResolvingBookmarkDataInternal(const __CFAllocator *a1, const __CFData *a2, unint64_t a3, CFURLRef relativeURL, const __CFArray *a5, BOOL *a6, __CFError **a7, const __CFURL **a8)
{
  CFURLRef v14;
  NSObject *v15;
  CFTypeID v16;
  CFTypeID TypeID;
  const __CFBoolean *v18;
  unsigned int *BookmarkSandboxExtensionForTag;
  uint64_t v20;
  uint64_t v21;
  CFErrorRef v22;
  const __CFURL *v23;
  CFErrorRef v24;
  NSObject *v25;
  int v26;
  CFTypeID v27;
  const __CFURL **v28;
  const void *v29;
  double v30;
  double Helper_x8__FPCreateDocumentURLFromBookmarkableString;
  uint64_t v32;
  const void *v33;
  const void *v34;
  uint64_t inited;
  const void *v36;
  unsigned int v37;
  BOOL v38;
  _DWORD *v39;
  unsigned int v40;
  _DWORD *v41;
  NSObject *v42;
  const __CFURL *v43;
  unsigned int v44;
  _DWORD *v45;
  const __CFString *v46;
  NSObject *v47;
  NSObject *v48;
  const __CFString *v49;
  int v50;
  const __CFURL *v51;
  NSObject *v52;
  Boolean v54;
  const __CFString *v55;
  const __CFString *v56;
  const __CFString *v57;
  const __CFArray *v58;
  const __CFArray *v59;
  unsigned __int8 *v60;
  const __CFArray *v61;
  CFTypeRef matched;
  const __CFString *v63;
  CFTypeID v64;
  CFNumberRef v65;
  int v66;
  int v67;
  uint64_t v68;
  CFArrayRef v69;
  CFArrayRef v70;
  const __CFDictionary *v71;
  const __CFDictionary *v72;
  const __CFString *Value;
  const void *v74;
  CFTypeID v75;
  const void *v76;
  __CFError *v77;
  const __CFURL *v80;
  CFNumberRef cf1;
  const __CFArray *v82;
  uint64_t v83;
  const void *v84;
  const __CFBoolean *v85;
  const __CFData *v86;
  CFTypeRef cf;
  void *values;
  CFTypeRef cf2;
  unsigned int v91;
  CFTypeRef propertyValueTypeRefPtr;
  unsigned int v93;
  const __CFURL *length;
  BOOL v95;
  uint8_t v96[4];
  _BYTE v97[20];
  unint64_t v98;
  __int16 v99;
  CFURLRef v100;
  __int16 v101;
  const __CFArray *v102;
  __int16 v103;
  BOOL *v104;
  __int16 v105;
  __CFError **v106;
  _BYTE buf[18];
  uint64_t v108;

  v108 = *MEMORY[0x1E0C80C00];
  cf = 0;
  if (relativeURL)
    v14 = CFURLCopyAbsoluteURL(relativeURL);
  else
    v14 = 0;
  v15 = resolveLog;
  if (os_log_type_enabled((os_log_t)resolveLog, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)v96 = 134219522;
    *(_QWORD *)v97 = a2;
    *(_WORD *)&v97[8] = 2112;
    *(_QWORD *)&v97[10] = a2;
    *(_WORD *)&v97[18] = 2048;
    v98 = a3;
    v99 = 2112;
    v100 = v14;
    v101 = 2112;
    v102 = a5;
    v103 = 2048;
    v104 = a6;
    v105 = 2048;
    v106 = a7;
    _os_log_debug_impl(&dword_1817A6000, v15, OS_LOG_TYPE_DEBUG, "bookmarkRef=<%p %@>  options=%#lx relativeToURL=%@ propertiesToInclude=%@ repIsStaleP=%p errorRefP=%p", v96, 0x48u);
    if (!a6)
      goto LABEL_7;
    goto LABEL_6;
  }
  if (a6)
LABEL_6:
    *a6 = 0;
LABEL_7:
  if (a2)
  {
    v16 = CFGetTypeID(a2);
    if (v16 == CFDataGetTypeID())
    {
      BookmarkData::BookmarkData((BookmarkData *)v96, a1, a2);
      if (!*(_QWORD *)&v97[12])
      {
        v24 = CFErrorCreate(a1, (CFErrorDomain)*MEMORY[0x1E0C9AFB8], 259, 0);
        if (cf == v24)
        {
          v23 = 0;
        }
        else
        {
          if (cf)
            CFRelease(cf);
          v23 = 0;
          cf = v24;
        }
        goto LABEL_180;
      }
      TypeID = CFBooleanGetTypeID();
      v18 = BookmarkData::copyItem((BookmarkData *)v96, CFSTR("NSURLBookmarkQuarantineMountedNetworkVolumesKey"), 1, TypeID);
      v85 = v18;
      if (v18 && CFBooleanGetValue(v18))
        a3 |= 0x2000uLL;
      LODWORD(length) = 0;
      BookmarkSandboxExtensionForTag = getBookmarkSandboxExtensionForTag((BookmarkData *)v96, 0xF080u, (unsigned int *)&length);
      if (BookmarkSandboxExtensionForTag
        || (BookmarkSandboxExtensionForTag = getBookmarkSandboxExtensionForTag((BookmarkData *)v96, 0xF081u, (unsigned int *)&length)) != 0)
      {
        if (os_log_type_enabled((os_log_t)securityScopedLog, OS_LOG_TYPE_DEBUG))
          createByResolvingBookmarkDataInternal();
        v20 = sandbox_extension_consume();
        v21 = v20;
        if (v20 >= 1)
        {
          v86 = CFDataCreate((CFAllocatorRef)*MEMORY[0x1E0C9AE00], (const UInt8 *)BookmarkSandboxExtensionForTag, length);
LABEL_36:
          v27 = CFStringGetTypeID();
          v29 = BookmarkData::copyItem((BookmarkData *)v96, 0x2070u, 1u, v27);
          if (v29)
          {
            Helper_x8__FPCreateDocumentURLFromBookmarkableString = gotLoadHelper_x8__FPCreateDocumentURLFromBookmarkableString(v30);
            if (*(_QWORD *)(v32 + 1792))
            {
              if (cf)
              {
                v33 = v29;
                CFRelease(cf);
                v29 = v33;
                cf = 0;
              }
              v34 = v29;
              inited = FPCreateDocumentURLFromBookmarkableString_delayInitStub(Helper_x8__FPCreateDocumentURLFromBookmarkableString);
              v36 = v34;
              v23 = (const __CFURL *)inited;
              goto LABEL_164;
            }
          }
          v84 = v29;
          if (!v14)
            goto LABEL_160;
          v95 = 0;
          if (!_CFURLIsFileURL()
            || !BookmarkData::getItemAs((BookmarkData *)v96, 0x1056u, 1, &v95)
            || !v95)
          {
            goto LABEL_160;
          }
          v83 = v21;
          CFRetain(v14);
          length = v14;
          v93 = 0;
          if (BookmarkData::getItemAs((BookmarkData *)v96, 0x1054u, 1, &v93) && (v37 = v93) != 0
            || BookmarkData::getItemAs((BookmarkData *)v96, 0x1051u, 1, &v93)
            && (v38 = __CFADD__(v93, 1), v37 = v93 + 1, ++v93, !v38))
          {
            v48 = resolveLog;
            if (os_log_type_enabled((os_log_t)resolveLog, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = 67109378;
              *(_DWORD *)&buf[4] = v37;
              *(_WORD *)&buf[8] = 2112;
              *(_QWORD *)&buf[10] = length;
              _os_log_debug_impl(&dword_1817A6000, v48, OS_LOG_TYPE_DEBUG, "REMOVING %u from relative url=%@", buf, 0x12u);
              if (!v93--)
                goto LABEL_50;
            }
            else
            {
              v93 = v37 - 1;
            }
            v49 = (const __CFString *)*MEMORY[0x1E0C9B5A8];
            do
            {
              if (!length)
                break;
              propertyValueTypeRefPtr = 0;
              v50 = CFURLCopyResourcePropertyForKey(length, v49, &propertyValueTypeRefPtr, 0);
              v51 = (const __CFURL *)propertyValueTypeRefPtr;
              if (!v50 && propertyValueTypeRefPtr)
              {
                CFRelease(propertyValueTypeRefPtr);
                v51 = 0;
                propertyValueTypeRefPtr = 0;
              }
              v52 = resolveLog;
              if (os_log_type_enabled((os_log_t)resolveLog, OS_LOG_TYPE_DEBUG))
              {
                *(_DWORD *)buf = 138412290;
                *(_QWORD *)&buf[4] = v51;
                _os_log_debug_impl(&dword_1817A6000, v52, OS_LOG_TYPE_DEBUG, " provisionalURL=%@", buf, 0xCu);
                v51 = (const __CFURL *)propertyValueTypeRefPtr;
              }
              propertyValueTypeRefPtr = 0;
              if (length != v51)
              {
                if (length)
                {
                  CFRelease(length);
                  length = v51;
                  if (propertyValueTypeRefPtr)
                    CFRelease(propertyValueTypeRefPtr);
                }
                else
                {
                  length = v51;
                }
              }
            }
            while (v93--);
          }
LABEL_50:
          v91 = 0;
          v82 = a5;
          if ((BookmarkData::getItemAs((BookmarkData *)v96, 0x1055u, 1, &v91) && v91
             || BookmarkData::getItemAs((BookmarkData *)v96, 0x1053u, 1, &v91) && (v38 = __CFADD__(v91, 1), ++v91, !v38))
            && (v39 = countPathComponents((BookmarkData *)v96, 1), (v40 = v91) != 0)
            && (v41 = v39, v91 < v39))
          {
            v42 = resolveLog;
            if (os_log_type_enabled((os_log_t)resolveLog, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = 67109120;
              *(_DWORD *)&buf[4] = v40;
              _os_log_debug_impl(&dword_1817A6000, v42, OS_LOG_TYPE_DEBUG, "Adding %u from path components to relative URL", buf, 8u);
              v40 = v91;
            }
            v43 = length;
            if (length)
            {
              v44 = (_DWORD)v41 - v40;
              v21 = v83;
              if (v44 < v41)
              {
                do
                {
                  v45 = v41;
                  v46 = (const __CFString *)copyIndexedPathComponent((BookmarkData *)v96, 1, v44);
                  propertyValueTypeRefPtr = CFURLCreateCopyAppendingPathComponent(a1, length, v46, 1u);
                  CFReleaser<__CFData const*>::operator=((const void **)&length, &propertyValueTypeRefPtr);
                  v47 = resolveLog;
                  if (os_log_type_enabled((os_log_t)resolveLog, OS_LOG_TYPE_DEBUG))
                  {
                    *(_DWORD *)buf = 138412290;
                    *(_QWORD *)&buf[4] = length;
                    _os_log_debug_impl(&dword_1817A6000, v47, OS_LOG_TYPE_DEBUG, " - provisionalURL=%@", buf, 0xCu);
                  }
                  if (length && !CFURLResourceIsReachable(length, 0) && length)
                  {
                    CFRelease(length);
                    length = 0;
                  }
                  v21 = v83;
                  if (propertyValueTypeRefPtr)
                    CFRelease(propertyValueTypeRefPtr);
                  if (v46)
                    CFRelease(v46);
                  v43 = length;
                  if (!length)
                    break;
                  ++v44;
                  v41 = v45;
                }
                while (v44 < v45);
              }
LABEL_75:
              if (!v43)
                goto LABEL_127;
              if (sameFileURL(v43, v14))
              {
                if (length)
                {
                  CFRelease(length);
                  length = 0;
                }
                goto LABEL_127;
              }
              *(_QWORD *)buf = 0;
              if (!CFURLCopyResourcePropertyForKey(length, (CFStringRef)*MEMORY[0x1E0C9B4E0], buf, 0))
              {
                if (length)
                {
                  CFRelease(length);
                  length = 0;
                }
                goto LABEL_125;
              }
              if (*(_QWORD *)buf && CFBooleanGetValue(*(CFBooleanRef *)buf))
              {
                if (CFURLHasDirectoryPath(length))
                  goto LABEL_107;
                v54 = 1;
              }
              else
              {
                if (!CFURLHasDirectoryPath(length))
                  goto LABEL_107;
                v54 = 0;
              }
              v55 = CFURLCopyFileSystemPath(length, kCFURLPOSIXPathStyle);
              if (v55)
              {
                v56 = v55;
                propertyValueTypeRefPtr = CFURLCreateWithFileSystemPath(a1, v55, kCFURLPOSIXPathStyle, v54);
                if (propertyValueTypeRefPtr)
                {
                  CFReleaser<__CFData const*>::operator=((const void **)&length, &propertyValueTypeRefPtr);
                  if (propertyValueTypeRefPtr)
                    CFRelease(propertyValueTypeRefPtr);
                }
                CFRelease(v56);
              }
LABEL_107:
              propertyValueTypeRefPtr = 0;
              cf2 = 0;
              v57 = (const __CFString *)*MEMORY[0x1E0C9B6A0];
              if (!CFURLCopyResourcePropertyForKey(length, (CFStringRef)*MEMORY[0x1E0C9B6A0], &propertyValueTypeRefPtr, 0)|| !CFURLCopyResourcePropertyForKey(v14, v57, &cf2, 0)|| !propertyValueTypeRefPtr|| !cf2)
              {
                if (length)
                {
                  CFRelease(length);
                  length = 0;
                }
                goto LABEL_119;
              }
              if (CFEqual(propertyValueTypeRefPtr, cf2))
              {
LABEL_119:
                if (cf2)
                  CFRelease(cf2);
                if (propertyValueTypeRefPtr)
                  CFRelease(propertyValueTypeRefPtr);
LABEL_125:
                if (*(_QWORD *)buf)
                  CFRelease(*(CFTypeRef *)buf);
LABEL_127:
                v63 = (const __CFString *)*MEMORY[0x1E0C9B418];
                v64 = CFNumberGetTypeID();
                v65 = BookmarkData::copyItem((BookmarkData *)v96, v63, 1, v64);
                *(_QWORD *)buf = 0;
                a5 = v82;
                if (!length)
                {
                  v23 = 0;
                  goto LABEL_155;
                }
                cf1 = v65;
                v66 = CFURLCopyResourcePropertyForKey(length, v63, buf, 0);
                if (a6 && v66)
                {
                  if (!cf1)
                  {
                    if (!*(_QWORD *)buf)
                      goto LABEL_137;
                    goto LABEL_136;
                  }
                  if (!*(_QWORD *)buf || !CFEqual(cf1, *(CFTypeRef *)buf))
LABEL_136:
                    *a6 = 1;
                }
LABEL_137:
                if (length)
                {
                  CFRetain(length);
                  v23 = length;
                  if (a6)
                  {
                    if (!*a6)
                    {
                      v67 = fileIDsMatch((BookmarkData *)v96, 1u, length);
                      *a6 = v67 == 0;
                      if (v67)
                      {
                        propertyValueTypeRefPtr = 0;
                        if (!CFURLCopyResourcePropertyForKey(v23, (CFStringRef)*MEMORY[0x1E0C9B3F0], &propertyValueTypeRefPtr, 0))
                        {
LABEL_149:
                          v21 = v83;
                          if (propertyValueTypeRefPtr)
                            CFRelease(propertyValueTypeRefPtr);
                          goto LABEL_152;
                        }
                        v21 = v83;
                        if (propertyValueTypeRefPtr)
                        {
                          v68 = *MEMORY[0x1E0C9AE00];
                          v69 = CFArrayCreate((CFAllocatorRef)*MEMORY[0x1E0C9AE00], MEMORY[0x1E0C9B5B0], 1, MEMORY[0x1E0C9B378]);
                          if (v69)
                          {
                            v70 = v69;
                            v71 = (const __CFDictionary *)MEMORY[0x186DA3270](v68, v69, *(_QWORD *)&v97[4]);
                            if (v71)
                            {
                              v72 = v71;
                              Value = (const __CFString *)CFDictionaryGetValue(v71, (const void *)*MEMORY[0x1E0C9B5B0]);
                              if (Value)
                                *a6 = CFStringCompare((CFStringRef)propertyValueTypeRefPtr, Value, 0) != kCFCompareEqualTo;
                              CFRelease(v72);
                            }
                            CFRelease(v70);
                          }
                          goto LABEL_149;
                        }
                      }
                    }
                  }
                }
                else
                {
                  v23 = 0;
                }
LABEL_152:
                if (*(_QWORD *)buf)
                  CFRelease(*(CFTypeRef *)buf);
                v65 = cf1;
LABEL_155:
                if (v65)
                  CFRelease(v65);
                if (length)
                  CFRelease(length);
                if (v23)
                {
LABEL_163:
                  v36 = v84;
                  if (!v84)
                  {
LABEL_165:
                    if (!v86)
                    {
LABEL_171:
                      if (v85)
                        CFRelease(v85);
                      if (v23)
                      {
                        if (!a6 || !*a6)
                        {
                          CFURLSetTemporaryResourcePropertyForKey(v23, CFSTR("CFURLCreatedFromBookmark"), a2);
                          *(_DWORD *)buf = 0;
                          BookmarkData::getItemAs((BookmarkData *)v96, 0xD010u, 1, (unsigned int *)buf);
                        }
                        if (a5)
                        {
                          v75 = CFGetTypeID(a5);
                          if (v75 == CFArrayGetTypeID())
                          {
                            v76 = (const void *)__CFURLResourceInfoPtr();
                            _FSURLCacheResourcePropertiesForKeys(v23, a5, v76, 0);
                          }
                        }
                      }
LABEL_180:
                      BookmarkData::~BookmarkData((BookmarkData *)v96);
                      goto LABEL_181;
                    }
                    if (!v23)
                      goto LABEL_169;
                    v74 = (const void *)MEMORY[0x186DA3408](v23);
                    if (!v74)
                    {
                      releaseBookmarkExtension(v21);
                      _URLAttachSecurityScopeToFileURL(v23, v86);
                      if ((a3 & 0x8000) == 0)
                        _CFURLStartAccessingSecurityScopedResource(v23);
                      goto LABEL_170;
                    }
                    CFRelease(v74);
                    if ((a3 & 0x8000) != 0)
LABEL_169:
                      releaseBookmarkExtension(v21);
LABEL_170:
                    CFRelease(v86);
                    goto LABEL_171;
                  }
LABEL_164:
                  CFRelease(v36);
                  goto LABEL_165;
                }
LABEL_160:
                if (cf)
                {
                  CFRelease(cf);
                  cf = 0;
                }
                v23 = (const __CFURL *)CFURLCreateByResolvingDataInBookmark(a1, (BookmarkData *)v96, 1, a3, (const __CFArray *)a6, (unsigned __int8 *)&cf, a8, v28);
                goto LABEL_163;
              }
              values = 0;
              if (CFURLCopyResourcePropertyForKey(length, (CFStringRef)*MEMORY[0x1E0C9B7E8], &values, 0) && values)
              {
                v58 = CFArrayCreate(a1, (const void **)&values, 1, MEMORY[0x1E0C9B378]);
                if (v58)
                {
                  v61 = v58;
                  matched = matchVolumeURLForBookmark((BookmarkData *)v96, 1u, v58, (char *)a6, v59, v60);
                  if (matched)
                  {
                    CFRelease(matched);
                  }
                  else if (length)
                  {
                    CFRelease(length);
                    length = 0;
                  }
                  CFRelease(v61);
                  v21 = v83;
                  goto LABEL_206;
                }
                v80 = length;
                v21 = v83;
                if (length)
                  goto LABEL_202;
              }
              else
              {
                v80 = length;
                if (length)
                {
LABEL_202:
                  CFRelease(v80);
                  length = 0;
                }
              }
LABEL_206:
              if (values)
                CFRelease(values);
              goto LABEL_119;
            }
          }
          else
          {
            v43 = length;
          }
          v21 = v83;
          goto LABEL_75;
        }
        if (v20)
        {
          v25 = resolveLog;
          if (os_log_type_enabled((os_log_t)resolveLog, OS_LOG_TYPE_INFO))
          {
            v26 = *__error();
            *(_DWORD *)buf = 67109120;
            *(_DWORD *)&buf[4] = v26;
            _os_log_impl(&dword_1817A6000, v25, OS_LOG_TYPE_INFO, "failed to consume sandbox extension: %{errno}d", buf, 8u);
          }
        }
      }
      else
      {
        v21 = 0;
      }
      v86 = 0;
      goto LABEL_36;
    }
  }
  v22 = CFErrorCreate(a1, (CFErrorDomain)*MEMORY[0x1E0C9AFB8], 259, 0);
  if (cf == v22)
  {
    v23 = 0;
  }
  else
  {
    if (cf)
      CFRelease(cf);
    v23 = 0;
    cf = v22;
  }
LABEL_181:
  if (os_log_type_enabled((os_log_t)resolveLog, OS_LOG_TYPE_DEBUG))
  {
    createByResolvingBookmarkDataInternal();
    if (!a7)
      goto LABEL_188;
  }
  else if (!a7)
  {
    goto LABEL_188;
  }
  if (!v23)
  {
    v77 = (__CFError *)cf;
    if (cf)
      cf = 0;
    else
      v77 = CFErrorCreate(a1, (CFErrorDomain)*MEMORY[0x1E0C9AFB8], 4, 0);
    *a7 = v77;
  }
LABEL_188:
  if (v14)
    CFRelease(v14);
  if (cf)
    CFRelease(cf);
  return v23;
}

uint64_t DownloadCloudDocumentSync(const __CFURL *a1)
{
  dispatch_group_t v2;
  NSObject *v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  char v10;
  uint8_t buf[4];
  const char *v12;
  __int16 v13;
  const __CFURL *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v7 = 0;
  v8 = &v7;
  v9 = 0x2000000000;
  v10 = 0;
  v2 = dispatch_group_create();
  if (v2)
  {
    v3 = v2;
    v4 = bmarkLog;
    if (os_log_type_enabled((os_log_t)bmarkLog, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315394;
      v12 = "DownloadCloudDocumentSync";
      v13 = 2112;
      v14 = a1;
      _os_log_impl(&dword_1817A6000, v4, OS_LOG_TYPE_INFO, "%s: downloading %@", buf, 0x16u);
    }
    dispatch_group_enter(v3);
    _CFFileCoordinateReadingItemAtURL2();
    dispatch_group_wait(v3, 0xFFFFFFFFFFFFFFFFLL);
    dispatch_release(v3);
    v5 = *((unsigned __int8 *)v8 + 24);
  }
  else
  {
    v5 = 0;
    *((_BYTE *)v8 + 24) = 0;
  }
  _Block_object_dispose(&v7, 8);
  return v5;
}

uint64_t _URLCreateByResolvingAliasFile(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v5;
  _QWORD v7[10];
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t v11;

  v8 = 0;
  v9 = &v8;
  v10 = 0x2000000000;
  v11 = 0;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 0x40000000;
  v7[2] = ___URLCreateByResolvingAliasFile_block_invoke;
  v7[3] = &unk_1E0F0AF38;
  v7[6] = a1;
  v7[7] = a2;
  v7[4] = &v8;
  v7[5] = a3;
  v7[8] = a5;
  v7[9] = a4;
  _os_activity_initiate(&dword_1817A6000, "CFURLResolveBookmarkData", OS_ACTIVITY_FLAG_IF_NONE_PRESENT, v7);
  v5 = v9[3];
  _Block_object_dispose(&v8, 8);
  return v5;
}

const __CFURL *_CreateByResolvingAliasFile(const __CFAllocator *a1, CFTypeRef cf, unint64_t a3, unsigned __int8 *a4, __CFError **a5)
{
  const __CFURL *v9;
  BOOL v10;
  BOOL v11;
  const __CFURL *v12;
  int v14;
  int v15;
  ssize_t v16;
  ssize_t v17;
  size_t v18;
  CFURLRef v19;
  const __CFURL *v20;
  const __CFURL *v21;
  size_t v22;
  BOOL v23;
  Boolean v24;
  const __CFData *v25;
  const __CFData *v26;
  CFURLRef v27;
  uint64_t v28;
  const __CFString *v29;
  const __CFAllocator *v30;
  stat v31;
  CFBooleanRef propertyValueTypeRefPtr;
  char v33[1024];
  CFTypeRef cf1[129];

  cf1[128] = *(CFTypeRef *)MEMORY[0x1E0C80C00];
  propertyValueTypeRefPtr = 0;
  v9 = (const __CFURL *)CFRetain(cf);
  *a4 = 0;
  if (CFURLCopyResourcePropertyForKey(v9, (CFStringRef)*MEMORY[0x1E0C9B4D0], &propertyValueTypeRefPtr, 0))
    v10 = propertyValueTypeRefPtr == 0;
  else
    v10 = 1;
  if (v10)
    goto LABEL_12;
  if (!CFBooleanGetValue(propertyValueTypeRefPtr)
    || ((cf1[0] = 0, CFURLCopyResourcePropertyForKey(v9, (CFStringRef)*MEMORY[0x1E0C9B480], cf1, 0))
      ? (v11 = cf1[0] == 0)
      : (v11 = 1),
        v11))
  {
    CFRelease(propertyValueTypeRefPtr);
    goto LABEL_12;
  }
  v14 = CFEqual(cf1[0], (CFTypeRef)*MEMORY[0x1E0C9B490]);
  v15 = v14;
  if (v14)
  {
    *a4 = 1;
  }
  else if (CFEqual(cf1[0], (CFTypeRef)*MEMORY[0x1E0C9B488]))
  {
    *a4 = 1;
    CFRelease(cf1[0]);
    CFRelease(propertyValueTypeRefPtr);
    v25 = (const __CFData *)MEMORY[0x186DA321C](a1, v9, a5);
    if (v25)
    {
      v26 = v25;
      v12 = (const __CFURL *)_CFURLCreateByResolvingBookmarkData(a1, v25, a3, v9, 0, 0, a5);
      CFRelease(v26);
      if (v12 && CFURLIsFileReferenceURL(v12))
      {
        v27 = CFURLCreateFilePathURL(a1, v12, a5);
        CFRelease(v12);
        v12 = v27;
      }
      goto LABEL_13;
    }
LABEL_39:
    v12 = 0;
    goto LABEL_13;
  }
  CFRelease(cf1[0]);
  CFRelease(propertyValueTypeRefPtr);
  if (!v15)
  {
LABEL_12:
    v12 = (const __CFURL *)CFRetain(v9);
    goto LABEL_13;
  }
  if (!CFURLGetFileSystemRepresentation(v9, 1u, (UInt8 *)cf1, 1024))
  {
    if (a5)
    {
LABEL_45:
      v29 = (const __CFString *)*MEMORY[0x1E0C9AFB8];
      v30 = a1;
      v28 = 260;
      goto LABEL_46;
    }
    goto LABEL_39;
  }
  v16 = readlink((const char *)cf1, v33, 0x400uLL);
  if (v16 < 0)
  {
    if (a5)
    {
      v28 = *__error();
      v29 = (const __CFString *)*MEMORY[0x1E0C9AFD0];
      v30 = a1;
LABEL_46:
      v12 = 0;
      *a5 = _FSURLCreateStandardError(v30, v29, v28, 0, (const __CFString *)v9, 0);
      goto LABEL_13;
    }
    goto LABEL_39;
  }
  v17 = v16;
  if (CFURLHasDirectoryPath(v9))
  {
    v18 = strlen((const char *)cf1);
    v19 = CFURLCreateFromFileSystemRepresentation(a1, (const UInt8 *)cf1, v18, 0);
    CFRelease(v9);
    v9 = v19;
  }
  v20 = (const __CFURL *)MEMORY[0x186DA3264](a1, v33, v17, 0, v9);
  if (v20)
  {
    v21 = v20;
    if (CFURLGetFileSystemRepresentation(v20, 1u, (UInt8 *)cf1, 1024))
    {
      v22 = strlen((const char *)cf1);
      if (lstat((const char *)cf1, &v31))
        v23 = 0;
      else
        v23 = (v31.st_mode & 0xF000) == 0x4000;
      v24 = v23;
      v12 = CFURLCreateFromFileSystemRepresentation(a1, (const UInt8 *)cf1, v22, v24);
    }
    else
    {
      v12 = 0;
    }
    CFRelease(v21);
  }
  else
  {
    v12 = 0;
  }
  if (a5 && !v12)
    goto LABEL_45;
LABEL_13:
  CFRelease(v9);
  return v12;
}

CFTypeRef CFURLCreateByResolvingDataInBookmark(const __CFAllocator *a1, BookmarkData *a2, uint64_t a3, unint64_t a4, const __CFArray *a5, unsigned __int8 *a6, __CFError **a7, const __CFURL **a8)
{
  uint64_t v10;
  BookmarkData *v11;
  NSObject *v13;
  const __CFArray *Mutable;
  _BOOL4 URLVolumeProperties;
  unsigned int v16;
  __CFError *v17;
  CFTypeID TypeID;
  NSObject *v19;
  const __CFString **v20;
  CFTypeID v21;
  const void *v22;
  const void *v23;
  CFTypeID v24;
  const void *v25;
  NSObject *v26;
  const __CFURL *v27;
  const __CFURL *v28;
  _BOOL4 matched;
  _BOOL4 v30;
  const void *v31;
  const __CFString *v32;
  int v33;
  _BOOL4 v34;
  _BOOL4 v35;
  NSObject *v36;
  const void *v37;
  uint64_t v38;
  CFURLRef v39;
  NSObject *v41;
  const __CFString *v42;
  const __CFString *v43;
  const __CFString *v44;
  CFIndex Length;
  CFIndex v46;
  const __CFString *v47;
  CFTypeID v48;
  const void *v49;
  CFIndex v50;
  char v51;
  const void *v52;
  const __CFArray *v53;
  const void *ValueAtIndex;
  NSObject *v55;
  _BOOL4 v56;
  CFURLRef v57;
  CFTypeID v58;
  const void *v59;
  uint64_t v60;
  __CFArray *v61;
  CFTypeID v62;
  const __CFString *v63;
  uint64_t v64;
  const __CFString **v65;
  const void *v66;
  const __CFString *v67;
  uint64_t v68;
  const __CFString *PathComponent;
  const __CFString *v71;
  const __CFURL *v72;
  void *v73;
  _BOOL4 v74;
  NSObject *v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  const __CFURL **v81;
  const void *v82;
  CFTypeID v83;
  const __CFString *v84;
  const __CFString *v85;
  const char *CStringPtr;
  size_t v87;
  int v88;
  unint64_t v89;
  const UInt8 *v90;
  CFURLRef v91;
  CFURLRef v92;
  CFIndex v93;
  const __CFString *v94;
  _BOOL4 v95;
  NSObject *v96;
  CFErrorDomain Domain;
  int v98;
  NSObject *v99;
  uint64_t v100;
  uint64_t v101;
  uint64_t v102;
  uint64_t v103;
  uint64_t v104;
  uint64_t v105;
  CFTypeID v106;
  const void *v107;
  const void *v108;
  int Value;
  unint64_t v110;
  const __CFString *v111;
  CFURLRef v112;
  const __CFArray *v113;
  const __CFArray *v114;
  unsigned int Count;
  CFURLRef v116;
  NSObject *v117;
  uint64_t v118;
  uint64_t v119;
  uint64_t v120;
  uint64_t v121;
  uint64_t v122;
  uint64_t v123;
  CFRange v124;
  const __CFArray *v125;
  CFStringRef v126;
  _BOOL8 v127;
  const __CFURL *v128;
  const __CFURL *v129;
  const __CFURL **v130;
  CFTypeRef v131;
  CFTypeID v132;
  const __CFAllocator *v133;
  const __CFAllocator *v134;
  const void *v135;
  int v136;
  unint64_t v137;
  const __CFString *v138;
  int v139;
  CFURLRef v140;
  const __CFAllocator *v141;
  const __CFArray *v142;
  const __CFArray *v143;
  unsigned int v144;
  NSObject *v145;
  uint64_t v146;
  uint64_t v147;
  uint64_t v148;
  uint64_t v149;
  uint64_t v150;
  uint64_t v151;
  CFRange v152;
  BookmarkData *v153;
  CFStringRef v154;
  _BOOL8 v155;
  const __CFURL *v156;
  const __CFURL *v157;
  const __CFURL **v158;
  CFURLRef v159;
  CFTypeRef v160;
  int v161;
  int v162;
  CFTypeID v163;
  const void *v164;
  const __CFArray *v165;
  unsigned __int8 *v166;
  CFTypeRef v167;
  CFTypeID v168;
  const __CFArray *v169;
  CFIndex v170;
  CFIndex v171;
  uint64_t v172;
  uint64_t v173;
  const __CFArray *v174;
  unsigned __int8 *v175;
  CFTypeRef v176;
  const void *v177;
  const __CFString *v178;
  NSObject *v179;
  const __CFURL *v180;
  const __CFURL **v181;
  const __CFURL *v182;
  CFURLRef v183;
  BOOL v184;
  CFErrorRef v185;
  CFTypeRef v186;
  const __CFString *v187;
  const __CFString *v188;
  const __CFURL *v189;
  const __CFURL **v190;
  CFURLRef v191;
  const __CFArray *v192;
  unsigned __int8 *v193;
  const __CFURL *v194;
  const __CFURL *v195;
  CFTypeID v196;
  const __CFArray *v197;
  CFURLRef v198;
  NSObject *v199;
  const __CFURL **v200;
  CFTypeID v201;
  const __CFArray *v202;
  CFIndex v203;
  const void *v204;
  const void *v205;
  CFTypeID v206;
  const __CFArray *v207;
  const __CFArray *v208;
  const __CFString *v209;
  CFTypeID v210;
  CFNumberRef v211;
  CFTypeID v212;
  const __CFString *v213;
  CFTypeID v214;
  const __CFString *v215;
  const __CFString *v216;
  CFIndex v217;
  CFIndex v218;
  CFIndex v219;
  CFIndex v220;
  UniChar *v221;
  CFIndex v222;
  CFIndex v223;
  CFIndex v224;
  UniChar *v225;
  CFIndex v226;
  CFIndex v227;
  const __CFString *v228;
  const __CFURL *v229;
  uint64_t ItemInTOC;
  uint64_t v231;
  CFTypeID v232;
  const __CFString *v233;
  const __CFString *v234;
  CFURLRef v235;
  CFTypeID v236;
  const void *v237;
  const void *v238;
  const __CFURL *v239;
  CFTypeRef v240;
  CFTypeRef v241;
  CFIndex v243;
  UniChar *v244;
  CFTypeID v245;
  const __CFArray *v246;
  unsigned int v247;
  uint64_t v248;
  CFTypeID v249;
  const __CFArray *v250;
  const __CFArray *v251;
  unsigned __int8 *v252;
  const __CFArray *v253;
  uint64_t v254;
  CFIndex v255;
  uint64_t v256;
  const __CFArray *v257;
  unsigned __int8 *v258;
  const __CFURL *v260;
  const __CFURL *v261;
  NSObject *v262;
  uint64_t v263;
  double v264;
  uint64_t v265;
  const __CFString *v266;
  CFTypeID v267;
  CFNumberRef v268;
  const __CFArray *v269;
  unsigned __int8 *v270;
  CFNumberRef v271;
  const __CFURL *v272;
  const __CFURL *v273;
  double v274;
  const __CFNumber *v275;
  const __CFNumber *v276;
  NSObject *v277;
  const __CFURL **v278;
  const void *v279;
  CFTypeID v280;
  const void *v281;
  const __CFArray *v282;
  unsigned __int8 *v283;
  const void *v284;
  const __CFString *v285;
  Boolean v286;
  CFURLRef v287;
  const __CFURL **v288;
  const void *v289;
  CFTypeRef v290;
  CFTypeID v291;
  const void *v292;
  uint64_t v293;
  const __CFString *v294;
  CFTypeID v295;
  int v296;
  const __CFArray *v297;
  const __CFArray *v298;
  int v299;
  const __CFString *v300;
  const __CFString *v301;
  _BOOL8 v302;
  const __CFURL *v303;
  NSObject *v304;
  const __CFURL **v305;
  CFTypeRef v306;
  __CFError **v307;
  unsigned __int8 *v308;
  const __CFArray *v310;
  __CFAllocator *v312;
  unsigned int v313;
  BookmarkData *v314;
  const __CFString *v315;
  CFURLRef v316;
  const void *cf;
  const __CFString *cfa;
  const __CFAllocator *cfb;
  const __CFString *cfc;
  __CFArray *theArray;
  unsigned __int8 v322;
  CFTypeRef v323;
  CFTypeRef v324;
  uint64_t inited;
  int valuePtr;
  CFURLRef anURL;
  _BYTE buf[2016];
  CFIndex v329;
  CFMutableStringRef v330;
  void *userInfoValues;
  int v332;
  uint64_t v333;
  CFRange v334;
  CFRange v335;
  CFRange v336;
  CFRange v337;

  v10 = a3;
  v11 = a2;
  v333 = *MEMORY[0x1E0C80C00];
  v323 = 0;
  v324 = 0;
  v322 = 0;
  if (BookmarkData::getMisalignedItemDataPtr(a2, 0x1010u, 0, a3))
  {
    v13 = resolveLog;
    if (os_log_type_enabled((os_log_t)resolveLog, OS_LOG_TYPE_DEBUG))
    {
      v32 = copyPathComponentsAsString(v11, v10, 0, 0);
      *(_DWORD *)buf = 134218242;
      *(_QWORD *)&buf[4] = a4;
      *(_WORD *)&buf[12] = 2112;
      *(_QWORD *)&buf[14] = v32;
      _os_log_debug_impl(&dword_1817A6000, v13, OS_LOG_TYPE_DEBUG, "STARTING RESOLUTION of a bookmark to a filesystem item. options=%#lx, originalItemPath=%@", buf, 0x16u);
      if (v32)
        CFRelease(v32);
      v13 = resolveLog;
    }
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
      CFURLCreateByResolvingDataInBookmark();
    Mutable = CFArrayCreateMutable(a1, 0, MEMORY[0x1E0C9B378]);
    URLVolumeProperties = BookmarkData::getURLVolumeProperties(v11, v10, (uint64_t)&userInfoValues);
    if (URLVolumeProperties)
      v16 = v332 & userInfoValues & 1;
    else
      v16 = 0;
    v308 = a6;
    TypeID = CFStringGetTypeID();
    cf = BookmarkData::copyItem(v11, 0x2011u, v10, TypeID);
    v19 = resolveLog;
    if (os_log_type_enabled((os_log_t)resolveLog, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136315906;
      *(_QWORD *)&buf[4] = "copyVolumesArrayForBookmark";
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = v10;
      *(_WORD *)&buf[18] = 1024;
      *(_DWORD *)&buf[20] = v16;
      *(_WORD *)&buf[24] = 2112;
      *(_QWORD *)&buf[26] = cf;
      _os_log_debug_impl(&dword_1817A6000, v19, OS_LOG_TYPE_DEBUG, "%s: (depth=%u bookmarkItemWasLocal=%{BOOL}d volumeUUID=%@", buf, 0x22u);
    }
    v20 = (const __CFString **)MEMORY[0x1E0C9B7F0];
    v312 = a1;
    v313 = v10;
    v314 = v11;
    theArray = Mutable;
    if (!v16)
      goto LABEL_31;
    v21 = CFBooleanGetTypeID();
    v22 = BookmarkData::copyItem(v11, 0x2030u, v10, v21);
    if (!v22)
      goto LABEL_31;
    v23 = v22;
    if (CFEqual(v22, (CFTypeRef)*MEMORY[0x1E0C9AE50]))
    {
      v24 = CFStringGetTypeID();
      v25 = BookmarkData::copyItem(v11, 0x2002u, v10, v24);
      v26 = resolveLog;
      if (os_log_type_enabled((os_log_t)resolveLog, OS_LOG_TYPE_DEBUG))
      {
        CFURLCreateByResolvingDataInBookmark((uint64_t)v25, v26);
        if (v25)
        {
LABEL_16:
          if (CFEqual(v25, CFSTR("/")))
          {
            v27 = CFURLCreateWithFileSystemPath(a1, CFSTR("/"), kCFURLPOSIXPathStyle, 1u);
            if (v27)
            {
              v28 = v27;
              v315 = *v20;
              matched = matchURLProperty(v27, *v20, cf);
              v30 = os_log_type_enabled((os_log_t)resolveLog, OS_LOG_TYPE_DEBUG);
              if (matched)
              {
                v10 = v313;
                if (v30)
                  CFURLCreateByResolvingDataInBookmark();
                CFArrayAppendValue(theArray, v28);
                CFRelease(v28);
                v31 = v25;
                Mutable = theArray;
                CFRelease(v31);
                CFRelease(v23);
                if (CFArrayGetCount(theArray))
                  goto LABEL_74;
                goto LABEL_31;
              }
              if (v30)
                CFURLCreateByResolvingDataInBookmark();
              CFRelease(v28);
              v10 = v313;
            }
          }
          CFRelease(v25);
        }
      }
      else if (v25)
      {
        goto LABEL_16;
      }
    }
    CFRelease(v23);
    Mutable = theArray;
LABEL_31:
    v307 = a7;
    if (URLVolumeProperties)
    {
      v33 = v332 & ~(_DWORD)userInfoValues & 1;
      v34 = (*(_QWORD *)&v332 & 0x10000 & (unint64_t)userInfoValues) != 0;
      v35 = (*(_QWORD *)&v332 & 0x10000 & ~(unint64_t)userInfoValues) != 0;
    }
    else
    {
      v34 = 0;
      v33 = 0;
      v35 = 0;
    }
    v36 = resolveLog;
    if (os_log_type_enabled((os_log_t)resolveLog, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 67109888;
      *(_DWORD *)&buf[4] = v16;
      *(_WORD *)&buf[8] = 1024;
      *(_DWORD *)&buf[10] = v33;
      *(_WORD *)&buf[14] = 1024;
      *(_DWORD *)&buf[16] = v34;
      *(_WORD *)&buf[20] = 1024;
      *(_DWORD *)&buf[22] = v35;
      _os_log_debug_impl(&dword_1817A6000, v36, OS_LOG_TYPE_DEBUG, "Necessary matching props for volume from bookmark: wasLocal=%{BOOL}d wasNetwork=%{BOOL}d wasDevFS=%{BOOL}d/%{BOOL}d", buf, 0x1Au);
    }
    if (copyVolumesArrayForBookmark(__CFAllocator const*,BookmarkData &,unsigned int)::onceToken != -1)
      dispatch_once(&copyVolumesArrayForBookmark(__CFAllocator const*,BookmarkData &,unsigned int)::onceToken, &__block_literal_global_2);
    v37 = (const void *)MEMORY[0x186DA32A0](*MEMORY[0x1E0C9AE00], 0, copyVolumesArrayForBookmark(__CFAllocator const*,BookmarkData &,unsigned int)::sPropertyKeys);
    v315 = *v20;
    while (1)
    {
      while (1)
      {
        anURL = 0;
        v38 = MEMORY[0x186DA32AC](v37, &anURL, 0);
        v39 = anURL;
        if (anURL && v38 == 1)
          break;
        if (v38 == 2)
          goto LABEL_72;
      }
      inited = 0;
      v41 = resolveLog;
      if (os_log_type_enabled((os_log_t)resolveLog, OS_LOG_TYPE_DEBUG))
        break;
      if (v16)
      {
LABEL_47:
        if (!_CFURLGetVolumePropertyFlags())
          goto LABEL_48;
      }
      else
      {
LABEL_48:
        if (v33)
          _CFURLGetVolumePropertyFlags();
        if (v35)
          _CFURLGetVolumePropertyFlags();
        if (!v34 || !_CFURLGetVolumePropertyFlags())
        {
          if (cf && matchURLProperty(anURL, v315, cf))
          {
            v42 = CFURLCopyFileSystemPath(anURL, kCFURLPOSIXPathStyle);
            v43 = copyPathComponentsAsString(v314, v10, 0, 1);
            v44 = v43;
            if (v42)
            {
              if (!v43)
              {
                v44 = v42;
                goto LABEL_69;
              }
              Length = CFStringGetLength(v42);
              v46 = CFStringGetLength(v44);
              if (v46 >= 2 && CFStringGetCharacterAtIndex(v44, v46 - 1) == 47)
                --v46;
              if (Length != v46
                || (v337.location = 0, v337.length = Length, CFStringCompareWithOptions(v44, v42, v337, 0)))
              {
                CFRelease(v44);
                v44 = v42;
                v10 = v313;
LABEL_69:
                CFRelease(v44);
                goto LABEL_70;
              }
              CFArrayRemoveAllValues(theArray);
              CFArrayAppendValue(theArray, anURL);
              v47 = v44;
              Mutable = theArray;
              CFRelease(v47);
              CFRelease(v42);
              v10 = v313;
LABEL_72:
              a7 = v307;
              a1 = v312;
              v11 = v314;
              if (v37)
                CFRelease(v37);
LABEL_74:
              if (cf)
                CFRelease(cf);
              if (!os_log_type_enabled((os_log_t)resolveLog, OS_LOG_TYPE_DEBUG))
              {
                if (Mutable)
                  goto LABEL_78;
                goto LABEL_103;
              }
              CFURLCreateByResolvingDataInBookmark();
              if (!Mutable)
                goto LABEL_103;
LABEL_78:
              if (CFArrayGetCount(Mutable) >= 2 && BookmarkData::getMisalignedItemDataPtr(v11, 0x2011u, 0, v10))
              {
                v48 = CFStringGetTypeID();
                v49 = BookmarkData::copyItem(v11, 0x2011u, v10, v48);
                if (CFArrayGetCount(Mutable) >= 1)
                {
                  v50 = 0;
                  v51 = 0;
                  v52 = 0;
                  v53 = theArray;
                  while (1)
                  {
                    ValueAtIndex = CFArrayGetValueAtIndex(v53, v50);
                    if (matchURLProperty((const __CFURL *)ValueAtIndex, v315, v49))
                    {
                      if (v52 && !CFEqual(v52, ValueAtIndex))
                      {
                        v96 = resolveLog;
                        if (os_log_type_enabled((os_log_t)resolveLog, OS_LOG_TYPE_DEBUG))
                        {
                          *(_DWORD *)buf = 138412802;
                          *(_QWORD *)&buf[4] = v52;
                          *(_WORD *)&buf[12] = 2112;
                          *(_QWORD *)&buf[14] = ValueAtIndex;
                          *(_WORD *)&buf[22] = 2112;
                          *(_QWORD *)&buf[24] = v49;
                          _os_log_debug_impl(&dword_1817A6000, v96, OS_LOG_TYPE_DEBUG, "ERROR-- two mounted volumes (%@,%@) have the same UUID %@", buf, 0x20u);
                        }
                        CFRelease(v52);
                        v52 = 0;
                        if (!v49)
                          goto LABEL_100;
LABEL_99:
                        CFRelease(v49);
                        goto LABEL_100;
                      }
                      if (ValueAtIndex)
                        CFRetain(ValueAtIndex);
                      if (v52 && v52 != ValueAtIndex)
                        CFRelease(v52);
                      v52 = ValueAtIndex;
                    }
                    if (v52)
                    {
                      v55 = resolveLog;
                      if (os_log_type_enabled((os_log_t)resolveLog, OS_LOG_TYPE_DEBUG))
                      {
                        *(_DWORD *)buf = 138412290;
                        *(_QWORD *)&buf[4] = v52;
                        _os_log_debug_impl(&dword_1817A6000, v55, OS_LOG_TYPE_DEBUG, "Pruning volume list to %@ because its UUID matches the one in the bookmark data.", buf, 0xCu);
                      }
                      CFArrayRemoveAllValues(theArray);
                      CFArrayAppendValue(theArray, v52);
                      v51 = 1;
                    }
                    ++v50;
                    v53 = theArray;
                    if (v50 >= CFArrayGetCount(theArray))
                      goto LABEL_98;
                  }
                }
                v51 = 0;
                v52 = 0;
LABEL_98:
                if (v49)
                  goto LABEL_99;
LABEL_100:
                v11 = v314;
                Mutable = theArray;
                if (v52)
                  CFRelease(v52);
                if ((v51 & 1) != 0)
                {
                  v74 = 0;
                  goto LABEL_193;
                }
              }
LABEL_103:
              if (os_log_type_enabled((os_log_t)resolveLog, OS_LOG_TYPE_DEBUG))
                CFURLCreateByResolvingDataInBookmark();
              v56 = BookmarkData::getURLVolumeProperties(v11, v10, (uint64_t)&userInfoValues);
              if ((a4 & 0x200) != 0)
              {
                v73 = (void *)v323;
              }
              else
              {
                if (!v56)
                  goto LABEL_111;
                if ((v332 & 0x200) != 0 && (BYTE1(userInfoValues) & 2) != 0)
                {
                  *(_DWORD *)buf = 0;
                  if (BookmarkData::getItemAs(v11, 0x2040u, v10, (unsigned int *)buf))
                  {
                    v75 = resolveLog;
                    if (os_log_type_enabled((os_log_t)resolveLog, OS_LOG_TYPE_DEBUG))
                      CFURLCreateByResolvingDataInBookmark(v10, v75, v76, v77, v78, v79, v80, (uint64_t)v81);
                    v82 = (const void *)CFURLCreateByResolvingDataInBookmark(a1, v11, *(unsigned int *)buf, a4, (const __CFArray *)&v322, (unsigned __int8 *)&v323, 0, v81);
                    if (v82)
                      CFRelease(v82);
                  }
                  v57 = 0;
                  v322 = 1;
                }
                else
                {
                  if ((v332 & 2) == 0 || (userInfoValues & 2) == 0)
                  {
LABEL_111:
                    v57 = 0;
                    goto LABEL_112;
                  }
                  v83 = CFStringGetTypeID();
                  v84 = (const __CFString *)BookmarkData::copyItem(v11, 0x2002u, v10, v83);
                  v85 = v84;
                  if (!v84)
                    goto LABEL_263;
                  CStringPtr = CFStringGetCStringPtr(v84, 0x8000100u);
                  if (os_log_type_enabled((os_log_t)resolveLog, OS_LOG_TYPE_DEBUG))
                  {
                    CFURLCreateByResolvingDataInBookmark();
                    if (CStringPtr)
                      goto LABEL_150;
LABEL_149:
                    CStringPtr = buf;
                    if (CFStringGetCString(v85, buf, 1024, 0x8000100u))
                      goto LABEL_150;
                    goto LABEL_263;
                  }
                  if (!CStringPtr)
                    goto LABEL_149;
LABEL_150:
                  v87 = strlen(CStringPtr);
                  anURL = 0;
                  v88 = getmntinfo_r_np((statfs **)&anURL, 2);
                  if (!v88)
                    goto LABEL_263;
                  if (!v87 || v87 > 0x400uLL || v88 <= 0)
                  {
                    free(anURL);
                    goto LABEL_263;
                  }
                  v57 = 0;
                  v89 = v88 + 1;
                  do
                  {
                    v90 = (const UInt8 *)anURL + 2168 * (v89 - 2) + 88;
                    if (!v90[v87] && !strcmp(CStringPtr, (const char *)anURL + 2168 * (v89 - 2) + 88))
                    {
                      v91 = CFURLCreateFromFileSystemRepresentation(a1, v90, v87, 1u);
                      if (v57 != v91)
                      {
                        v92 = v91;
                        if (v57)
                          CFRelease(v57);
                        v57 = v92;
                      }
                    }
                    --v89;
                  }
                  while (v89 > 1);
                  free(anURL);
                  LODWORD(v10) = v313;
                  Mutable = theArray;
                  if (!v57)
                  {
LABEL_263:
                    v57 = 0;
                    v322 = 1;
                  }
                  if (v85)
                    CFRelease(v85);
                }
LABEL_112:
                if (BookmarkData::getMisalignedItemDataPtr(v11, 0x2050u, 0, v10))
                {
                  v58 = CFURLGetTypeID();
                  v59 = BookmarkData::copyItem(v11, 0x2050u, v10, v58);
                  if (os_log_type_enabled((os_log_t)resolveLog, OS_LOG_TYPE_DEBUG))
                  {
                    CFURLCreateByResolvingDataInBookmark();
                    if (v59)
                    {
LABEL_115:
                      v60 = *MEMORY[0x1E0C9AE00];
                      v61 = CFArrayCreateMutable((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0, MEMORY[0x1E0C9B378]);
                      if (!v57)
                      {
                        v62 = CFStringGetTypeID();
                        v63 = (const __CFString *)BookmarkData::copyItem(v11, 0x2010u, v10, v62);
                        v64 = MEMORY[0x186DA32A0](v60, 0, 0);
                        v65 = (const __CFString **)MEMORY[0x1E0C9B7E0];
                        if (!v64)
                          goto LABEL_165;
                        v66 = (const void *)v64;
                        v57 = 0;
                        v67 = (const __CFString *)*MEMORY[0x1E0C9B718];
                        cfa = (const __CFString *)*MEMORY[0x1E0C9B7E0];
                        do
                        {
                          while (1)
                          {
                            *(_QWORD *)buf = 0;
                            v68 = MEMORY[0x186DA32AC](v66, buf, 0);
                            if (!*(_QWORD *)buf || v68 != 1)
                              break;
                            CFArrayAppendValue(v61, *(const void **)buf);
                            if (v63)
                            {
                              PathComponent = CFURLCopyLastPathComponent(*(CFURLRef *)buf);
                              if (PathComponent)
                              {
                                v71 = PathComponent;
                                if (CFStringCompare(PathComponent, v63, 0)
                                  || !matchURLProperty(*(const __CFURL **)buf, v67, v63)
                                  || !matchURLProperty(*(const __CFURL **)buf, cfa, v59))
                                {
                                  goto LABEL_134;
                                }
                                v72 = *(const __CFURL **)buf;
                                if (*(_QWORD *)buf)
                                  CFRetain(*(CFTypeRef *)buf);
                                if (v57 == v72)
                                {
LABEL_134:
                                  v72 = v57;
                                }
                                else if (v57)
                                {
                                  CFRelease(v57);
                                }
                                CFRelease(v71);
                                v57 = v72;
                                v11 = v314;
                              }
                            }
                          }
                        }
                        while (v68 != 2);
                        CFRelease(v66);
                        Mutable = theArray;
                        if (!v57)
                        {
LABEL_165:
                          if (CFArrayGetCount(v61) < 1)
                          {
                            v57 = 0;
                          }
                          else
                          {
                            v93 = 0;
                            v94 = *v65;
                            while (1)
                            {
                              v57 = (CFURLRef)CFArrayGetValueAtIndex(v61, v93);
                              v95 = matchURLProperty(v57, v94, v59);
                              if (v57)
                              {
                                if (v95)
                                  break;
                              }
                              if (++v93 >= CFArrayGetCount(v61))
                              {
                                v57 = 0;
                                goto LABEL_179;
                              }
                            }
                            CFRetain(v57);
LABEL_179:
                            Mutable = theArray;
                          }
                        }
                        if (v63)
                          CFRelease(v63);
                        a1 = v312;
                        LODWORD(v10) = v313;
                      }
                      if (v61)
                        CFRelease(v61);
                    }
                  }
                  else if (v59)
                  {
                    goto LABEL_115;
                  }
                  if (!v57)
                    v322 = 1;
                  if (v59)
                    CFRelease(v59);
                }
                if (v57)
                {
                  if (os_log_type_enabled((os_log_t)resolveLog, OS_LOG_TYPE_DEBUG))
                    CFURLCreateByResolvingDataInBookmark();
                  v74 = v322 == 0;
                  CFArrayInsertValueAtIndex(Mutable, 0, v57);
                  CFRelease(v57);
LABEL_193:
                  a6 = v308;
LABEL_203:
                  v99 = resolveLog;
                  if (os_log_type_enabled((os_log_t)resolveLog, OS_LOG_TYPE_DEBUG))
                    CFURLCreateByResolvingDataInBookmark(v313, v99, v100, v101, v102, v103, v104, v105);
                  if (v324)
                  {
                    v17 = 0;
                    goto LABEL_324;
                  }
                  v106 = CFNumberGetTypeID();
                  v107 = BookmarkData::copyItem(v11, 0xC001u, v313, v106);
                  if (v107)
                  {
                    v108 = v107;
                    *(_DWORD *)buf = 0;
                    if (os_log_type_enabled((os_log_t)resolveLog, OS_LOG_TYPE_DEBUG))
                      CFURLCreateByResolvingDataInBookmark();
                    CFRetain(v108);
                    Value = CFNumberGetValue((CFNumberRef)v108, kCFNumberSInt32Type, buf);
                    CFRelease(v108);
                    if (Value)
                    {
                      v112 = (CFURLRef)copyHomeFolderURLForUser(0, v110, v111);
                      if (os_log_type_enabled((os_log_t)resolveLog, OS_LOG_TYPE_DEBUG))
                        CFURLCreateByResolvingDataInBookmark();
                      if (*(_DWORD *)buf)
                      {
                        v113 = copyPathComponentsAsArray(v11, v313, 0);
                        v114 = v113;
                        if (v113)
                          Count = CFArrayGetCount(v113);
                        else
                          Count = 0;
                        v117 = resolveLog;
                        if (os_log_type_enabled((os_log_t)resolveLog, OS_LOG_TYPE_DEBUG))
                          CFURLCreateByResolvingDataInBookmark((uint64_t)buf, v117, v118, v119, v120, v121, v122, v123);
                        v124.length = *(unsigned int *)buf;
                        if (Count >= *(_DWORD *)buf)
                        {
                          v124.location = Count - *(_DWORD *)buf;
                          v125 = copyOfArray(v312, v114, v124);
                          v126 = CFStringCreateByCombiningStrings(v312, v125, CFSTR("/"));
                          v127 = isDirectory(v11, v313);
                          v128 = (const __CFURL *)MEMORY[0x186DA3288](v312, v126, 0, v127, v112);
                          if (v128)
                          {
                            v129 = v128;
                            v116 = CFURLCopyAbsoluteURL(v128);
                            CFRelease(v129);
                          }
                          else
                          {
                            v116 = 0;
                          }
                          a6 = v308;
                          if (v126)
                            CFRelease(v126);
                          if (v125)
                            CFRelease(v125);
                        }
                        else
                        {
                          v116 = 0;
                        }
                        if (v114)
                          CFRelease(v114);
                      }
                      else
                      {
                        if (v112)
                          CFRetain(v112);
                        v116 = v112;
                        if (os_log_type_enabled((os_log_t)resolveLog, OS_LOG_TYPE_DEBUG))
                        {
                          CFURLCreateByResolvingDataInBookmark();
                          v116 = v112;
                        }
                      }
                      if (os_log_type_enabled((os_log_t)resolveLog, OS_LOG_TYPE_DEBUG))
                        CFURLCreateByResolvingDataInBookmark();
                      if (matchURLToBookmark(v314, v313, v116, (BOOL *)&v322, v130))
                      {
                        if (v116)
                        {
                          CFRetain(v116);
                          v131 = v116;
                        }
                        else
                        {
                          v131 = 0;
                        }
                        if (v324 == v131)
                        {
                          v17 = 0;
                        }
                        else
                        {
                          if (v324)
                            CFRelease(v324);
                          v17 = 0;
                          v324 = v131;
                        }
                      }
                      else
                      {
                        v17 = 0;
                        if (a7 && v116)
                        {
                          CFRetain(v116);
                          v17 = v116;
                        }
                        v131 = v324;
                      }
                      if (!v131)
                      {
                        v132 = CFStringGetTypeID();
                        v133 = (const __CFAllocator *)BookmarkData::copyItem(v314, 0xC011u, v313, v132);
                        if (v133)
                        {
                          v134 = v133;
                          v135 = (const void *)CFCopyUserName();
                          cfb = v134;
                          v136 = CFEqual(v134, v135);
                          v139 = v136;
                          if (v135)
                          {
                            CFRelease(v135);
                            if (v139)
                              goto LABEL_255;
LABEL_259:
                            v141 = cfb;
                            v316 = (CFURLRef)copyHomeFolderURLForUser(cfb, v137, v138);
                            if (v112 == v316)
                            {
                              v316 = v112;
                            }
                            else if (v112)
                            {
                              CFRelease(v112);
                            }
                            if (os_log_type_enabled((os_log_t)resolveLog, OS_LOG_TYPE_DEBUG))
                              CFURLCreateByResolvingDataInBookmark();
                            if (*(_DWORD *)buf)
                            {
                              v142 = copyPathComponentsAsArray(v314, v313, 0);
                              v143 = v142;
                              if (v142)
                                v144 = CFArrayGetCount(v142);
                              else
                                v144 = 0;
                              v145 = resolveLog;
                              if (os_log_type_enabled((os_log_t)resolveLog, OS_LOG_TYPE_DEBUG))
                                CFURLCreateByResolvingDataInBookmark((uint64_t)buf, v145, v146, v147, v148, v149, v150, v151);
                              v152.length = *(unsigned int *)buf;
                              if (v144 >= *(_DWORD *)buf)
                              {
                                v152.location = v144 - *(_DWORD *)buf;
                                v310 = copyOfArray(v312, v143, v152);
                                v154 = CFStringCreateByCombiningStrings(v312, v310, CFSTR("/"));
                                v155 = isDirectory(v314, v313);
                                v156 = (const __CFURL *)MEMORY[0x186DA3288](v312, v154, 0, v155, v316);
                                v157 = v156;
                                if (v156)
                                  v140 = CFURLCopyAbsoluteURL(v156);
                                else
                                  v140 = 0;
                                if (v116 == v140)
                                {
                                  v140 = v116;
                                }
                                else if (v116)
                                {
                                  CFRelease(v116);
                                }
                                v153 = v314;
                                if (v157)
                                  CFRelease(v157);
                                if (v154)
                                  CFRelease(v154);
                                Mutable = theArray;
                                if (v310)
                                  CFRelease(v310);
                              }
                              else
                              {
                                v140 = v116;
                                v153 = v314;
                              }
                              v141 = cfb;
                              if (v143)
                                CFRelease(v143);
                            }
                            else
                            {
                              if (v316)
                                CFRetain(v316);
                              if (v116 == v316)
                              {
                                v140 = v116;
                              }
                              else
                              {
                                v140 = v316;
                                if (v116)
                                {
                                  CFRelease(v116);
                                  v140 = v316;
                                }
                              }
                              if (os_log_type_enabled((os_log_t)resolveLog, OS_LOG_TYPE_DEBUG))
                                CFURLCreateByResolvingDataInBookmark();
                              v153 = v314;
                            }
                            if (os_log_type_enabled((os_log_t)resolveLog, OS_LOG_TYPE_DEBUG))
                              CFURLCreateByResolvingDataInBookmark();
                            if (matchURLToBookmark(v153, v313, v140, (BOOL *)&v322, v158))
                            {
                              if (v140)
                              {
                                CFRetain(v140);
                                v159 = v140;
                              }
                              else
                              {
                                v159 = 0;
                              }
                              if (v324 != v159)
                              {
                                if (v324)
                                  CFRelease(v324);
                                v324 = v159;
                              }
                            }
                            v112 = v316;
                          }
                          else
                          {
                            if (!v136)
                              goto LABEL_259;
LABEL_255:
                            v140 = v116;
                            v141 = cfb;
                          }
                          CFRelease(v141);
                          v116 = v140;
                        }
                      }
                      if (v112)
                        CFRelease(v112);
                      if (v116)
                        CFRelease(v116);
                      v11 = v314;
                    }
                    else
                    {
                      v17 = 0;
                    }
                    if (!v324)
                      v322 = 1;
                    CFRelease(v108);
                  }
                  else
                  {
                    v17 = 0;
                  }
                  a1 = v312;
                  if (v324)
                  {
LABEL_324:
                    LODWORD(v10) = v313;
                    goto LABEL_325;
                  }
                  if (!BookmarkData::getURLResourceProperties(v11, v313, (uint64_t)buf)
                    || (buf[8] & 8) == 0
                    || (buf[0] & 8) == 0)
                  {
                    goto LABEL_608;
                  }
                  v163 = CFBooleanGetTypeID();
                  v164 = BookmarkData::copyItem(v11, 0x2030u, v313, v163);
                  if (os_log_type_enabled((os_log_t)resolveLog, OS_LOG_TYPE_DEBUG))
                  {
                    CFURLCreateByResolvingDataInBookmark();
                    if (!v164)
                      goto LABEL_595;
LABEL_335:
                    if (!CFEqual(v164, (CFTypeRef)*MEMORY[0x1E0C9AE50]))
                      goto LABEL_595;
                    v167 = CFURLCreateWithFileSystemPath(v312, CFSTR("/"), kCFURLPOSIXPathStyle, 1u);
                    if (v324 != v167)
                    {
                      if (v324)
                        CFRelease(v324);
                      v324 = v167;
                    }
                    CFRelease(v164);
                  }
                  else
                  {
                    if (v164)
                      goto LABEL_335;
LABEL_595:
                    if (v74)
                    {
                      v279 = CFArrayGetValueAtIndex(Mutable, 0);
                      v167 = v279;
                      if (v279)
                        CFRetain(v279);
                    }
                    else
                    {
                      v167 = matchVolumeURLForBookmark(v11, v313, Mutable, (char *)&v322, v165, v166);
                    }
                    if (v324 != v167)
                    {
                      if (v324)
                        CFRelease(v324);
                      v324 = v167;
                    }
                    if (v164)
                    {
                      CFRelease(v164);
                      if (!v167)
                        goto LABEL_605;
LABEL_608:
                      if (v324)
                        goto LABEL_630;
                      v280 = CFBooleanGetTypeID();
                      v281 = BookmarkData::copyItem(v11, 0x2030u, v313, v280);
                      if (v281)
                      {
                        v284 = v281;
                        if (CFEqual(v281, (CFTypeRef)*MEMORY[0x1E0C9AE50]))
                        {
                          v285 = copyPathComponentsAsString(v11, v313, 0, 1);
                          if (os_log_type_enabled((os_log_t)resolveLog, OS_LOG_TYPE_DEBUG))
                          {
                            CFURLCreateByResolvingDataInBookmark();
                            if (v285)
                            {
LABEL_613:
                              v286 = isDirectory(v11, v313);
                              v287 = CFURLCreateWithFileSystemPath(v312, v285, kCFURLPOSIXPathStyle, v286);
                              if (os_log_type_enabled((os_log_t)resolveLog, OS_LOG_TYPE_DEBUG))
                                CFURLCreateByResolvingDataInBookmark();
                              a6 = v308;
                              Mutable = theArray;
                              if (matchURLToBookmark(v11, v313, v287, (BOOL *)&v322, v288))
                              {
                                if (v287)
                                  CFRetain(v287);
                                if (v324 != v287)
                                {
                                  if (v324)
                                    CFRelease(v324);
                                  v324 = v287;
                                }
                              }
                              if (v287)
                                CFRelease(v287);
                            }
                          }
                          else if (v285)
                          {
                            goto LABEL_613;
                          }
                          if (!v324)
                            v322 = 1;
                          if (v285)
                            CFRelease(v285);
                        }
                        CFRelease(v284);
                      }
                      if (v324)
                      {
LABEL_630:
                        LODWORD(v10) = v313;
                        goto LABEL_325;
                      }
                      if (v74)
                      {
                        v289 = CFArrayGetValueAtIndex(Mutable, 0);
                        LODWORD(v10) = v313;
                        if (v289)
                        {
                          v290 = v289;
                          CFRetain(v289);
                          goto LABEL_655;
                        }
LABEL_636:
                        v291 = CFStringGetTypeID();
                        cfc = (const __CFString *)BookmarkData::copyItem(v11, 0x2010u, v10, v291);
                        if (cfc)
                        {
                          v322 = 1;
                          v292 = (const void *)MEMORY[0x186DA32A0](*MEMORY[0x1E0C9AE00], 0, 0);
                          *(_QWORD *)buf = 0;
                          v293 = MEMORY[0x186DA32AC](v292, buf, 0);
                          v290 = 0;
                          if (v293 != 2)
                          {
                            v290 = 0;
                            v294 = (const __CFString *)*MEMORY[0x1E0C9B718];
                            do
                            {
                              if (v293 != 1 || !*(_QWORD *)buf)
                                goto LABEL_650;
                              userInfoValues = 0;
                              if (!CFURLCopyResourcePropertyForKey(*(CFURLRef *)buf, v294, &userInfoValues, 0))
                                goto LABEL_646;
                              if (!userInfoValues)
                                goto LABEL_650;
                              v295 = CFGetTypeID(userInfoValues);
                              if (v295 == CFStringGetTypeID())
                              {
                                v296 = 1;
                                if (CFStringCompare(cfc, (CFStringRef)userInfoValues, 1uLL) == kCFCompareEqualTo)
                                {
                                  v290 = *(CFTypeRef *)buf;
                                  CFRetain(*(CFTypeRef *)buf);
                                  v296 = 0;
                                }
                              }
                              else
                              {
LABEL_646:
                                v296 = 1;
                              }
                              if (userInfoValues)
                                CFRelease(userInfoValues);
                              if (!v296)
                                break;
LABEL_650:
                              v293 = MEMORY[0x186DA32AC](v292, buf, 0);
                            }
                            while (v293 != 2);
                          }
                          if (v292)
                            CFRelease(v292);
                          CFRelease(cfc);
                          v11 = v314;
                        }
                        else
                        {
                          v290 = 0;
                        }
                      }
                      else
                      {
                        LODWORD(v10) = v313;
                        v290 = matchVolumeURLForBookmark(v11, v313, Mutable, (char *)&v322, v282, v283);
                        if (!v290)
                          goto LABEL_636;
                      }
LABEL_655:
                      v297 = copyVolumePathComponentsAsArray(v11, v10);
                      v298 = v297;
                      if (v297)
                        v299 = CFArrayGetCount(v297);
                      else
                        v299 = 0;
                      v300 = copyPathComponentsAsString(v11, v10, v299, 0);
                      v301 = v300;
                      if (v290)
                      {
                        if (v300)
                        {
                          v302 = isDirectory(v314, v10);
                          v303 = (const __CFURL *)MEMORY[0x186DA3288](v312, v301, 0, v302, v290);
                          v304 = resolveLog;
                          if (os_log_type_enabled((os_log_t)resolveLog, OS_LOG_TYPE_DEBUG))
                          {
                            *(_DWORD *)buf = 138413058;
                            *(_QWORD *)&buf[4] = v303;
                            *(_WORD *)&buf[12] = 2112;
                            *(_QWORD *)&buf[14] = v298;
                            *(_WORD *)&buf[22] = 2112;
                            *(_QWORD *)&buf[24] = v301;
                            *(_WORD *)&buf[32] = 2112;
                            *(_QWORD *)&buf[34] = v290;
                            _os_log_debug_impl(&dword_1817A6000, v304, OS_LOG_TYPE_DEBUG, "4. Trying to match by volume name + path components, maybeURL=%@ volumePathElements=%@ pathComponents=%@ volumeURL=%@", buf, 0x2Au);
                            if (!v303)
                              goto LABEL_672;
LABEL_662:
                            if (!matchURLToBookmark(v314, v10, v303, (BOOL *)&v322, v305))
                              goto LABEL_672;
                            v306 = CFURLCopyAbsoluteURL(v303);
                            if (v324 != v306)
                            {
                              if (v324)
                                CFRelease(v324);
                              v324 = v306;
                            }
                          }
                          else
                          {
                            if (v303)
                              goto LABEL_662;
LABEL_672:
                            v306 = v324;
                          }
                          if (!v306)
                            v322 = 1;
                          if (v303)
                            CFRelease(v303);
LABEL_677:
                          CFRelease(v301);
                        }
                      }
                      else if (v300)
                      {
                        goto LABEL_677;
                      }
                      if (v298)
                        CFRelease(v298);
                      v11 = v314;
                      if (v290)
                        CFRelease(v290);
LABEL_325:
                      v160 = v324;
                      v161 = 1;
                      if ((a4 & 0x200) != 0 && !v324)
                      {
                        if (BookmarkData::getURLVolumeProperties(v11, v10, (uint64_t)buf) && (buf[8] & 2) != 0)
                          v162 = (buf[0] >> 1) & 1;
                        else
                          v162 = 0;
                        v161 = v162 ^ 1;
                        v160 = v324;
                      }
                      if (v160 || !v161)
                      {
                        *(_QWORD *)buf = *MEMORY[0x1E0C9AFA8];
                        userInfoValues = CFSTR("kCFBookmarkResolutionWithoutMountingMask was passed and the volume needed wasn't available");
                        v185 = CFErrorCreateWithUserInfoKeysAndValues(a1, (CFErrorDomain)*MEMORY[0x1E0C9AFB8], 260, (const void *const *)buf, (const void *const *)&userInfoValues, 1);
                        if (v323 != v185)
                        {
                          if (v323)
                            CFRelease(v323);
                          v323 = v185;
                        }
                        v186 = v324;
                        goto LABEL_382;
                      }
                      v322 = 1;
                      if (bookmarkHasPathComponents(v11, v10))
                      {
                        v168 = CFArrayGetTypeID();
                        v169 = (const __CFArray *)BookmarkData::copyItem(v314, 0x2000u, v10, v168);
                        if (!os_log_type_enabled((os_log_t)resolveLog, OS_LOG_TYPE_DEBUG))
                        {
                          if (v169)
                            goto LABEL_348;
                          goto LABEL_385;
                        }
                        CFURLCreateByResolvingDataInBookmark();
                        if (!v169)
                          goto LABEL_385;
LABEL_348:
                        v170 = countPathComponents(v314, v313);
                        v171 = CFArrayGetCount(v169);
                        if (v171 >= v170)
                          v172 = v170;
                        else
                          v172 = v171;
                        if (v172 >= 1)
                        {
                          while (2)
                          {
                            if (v324)
                              goto LABEL_397;
                            v173 = v172 - 1;
                            *(_QWORD *)buf = CFArrayGetValueAtIndex(v169, v172 - 1);
                            CFNumber::CFNumber((CFNumber *)&userInfoValues, (CFTypeRef *)buf);
                            LODWORD(anURL) = 0;
                            if (userInfoValues)
                            {
                              if (CFNumberGetValue((CFNumberRef)userInfoValues, kCFNumberSInt32Type, &anURL))
                              {
                                if ((_DWORD)anURL)
                                {
                                  v176 = matchVolumeURLForBookmark(v314, anURL, theArray, 0, v174, v175);
                                  if (v176)
                                  {
                                    v177 = v176;
                                    if ((unint64_t)v172 > 0x7FFFFFFE)
                                      v178 = 0;
                                    else
                                      v178 = copyPathComponentsAsString(v314, v313, (int)v172 - 1, 0);
                                    v179 = resolveLog;
                                    if (os_log_type_enabled((os_log_t)resolveLog, OS_LOG_TYPE_DEBUG))
                                    {
                                      *(_DWORD *)buf = 138412802;
                                      *(_QWORD *)&buf[4] = v177;
                                      *(_WORD *)&buf[12] = 2112;
                                      *(_QWORD *)&buf[14] = v178;
                                      *(_WORD *)&buf[22] = 1024;
                                      *(_DWORD *)&buf[24] = (_DWORD)anURL;
                                      _os_log_debug_impl(&dword_1817A6000, v179, OS_LOG_TYPE_DEBUG, "5a.  Trying volume url=%@ with partial path %@ volumeDepth=%u", buf, 0x1Cu);
                                      if (v178)
                                      {
LABEL_362:
                                        v180 = (const __CFURL *)MEMORY[0x186DA3288](v312, v178, 0, 0, v177);
                                        if (v180)
                                        {
                                          v182 = v180;
                                          if (matchURLToBookmark(v314, v313, v180, (BOOL *)&v322, v181))
                                          {
                                            v183 = CFURLCopyAbsoluteURL(v182);
                                            if (v324 != v183)
                                            {
                                              if (v324)
                                                CFRelease(v324);
                                              v324 = v183;
                                            }
                                          }
                                          CFRelease(v182);
                                          a6 = v308;
                                        }
                                        CFRelease(v178);
                                      }
                                    }
                                    else if (v178)
                                    {
                                      goto LABEL_362;
                                    }
                                    CFRelease(v177);
                                  }
                                }
                              }
                              if (userInfoValues)
                                CFRelease(userInfoValues);
                            }
                            v172 = v173;
                            v184 = (unint64_t)(v173 + 1) > 1;
                            a1 = v312;
                            if (!v184)
                              break;
                            continue;
                          }
                        }
LABEL_385:
                        if (!v324)
                        {
                          v187 = copyPathComponentsAsString(v314, v313, 0, 0);
                          if (v187)
                          {
                            v188 = v187;
                            v189 = CFURLCreateWithFileSystemPath(a1, v187, kCFURLPOSIXPathStyle, 0);
                            if (os_log_type_enabled((os_log_t)resolveLog, OS_LOG_TYPE_DEBUG))
                              CFURLCreateByResolvingDataInBookmark();
                            if (v189)
                            {
                              if (matchURLToBookmark(v314, v313, v189, (BOOL *)&v322, v190))
                              {
                                v191 = CFURLCopyAbsoluteURL(v189);
                                if (v324 != v191)
                                {
                                  if (v324)
                                    CFRelease(v324);
                                  v324 = v191;
                                }
                              }
                              CFRelease(v189);
                            }
                            CFRelease(v188);
                            a6 = v308;
                          }
                        }
LABEL_397:
                        LODWORD(v10) = v313;
                        if (v169)
                          CFRelease(v169);
                      }
                      if (v324)
                        goto LABEL_426;
                      if (os_log_type_enabled((os_log_t)resolveLog, OS_LOG_TYPE_DEBUG))
                        CFURLCreateByResolvingDataInBookmark();
                      v194 = (const __CFURL *)matchVolumeURLForBookmark(v314, v10, theArray, (char *)&v322, v192, v193);
                      if (v194)
                      {
                        v195 = v194;
                        if (!volumeSupportsPathFromID((uint64_t)v194))
                          goto LABEL_417;
                        v196 = CFNumberGetTypeID();
                        v197 = (const __CFArray *)BookmarkData::copyItem(v314, 0x1030u, v10, v196);
                        if (v197)
                          goto LABEL_405;
                        v201 = CFArrayGetTypeID();
                        v202 = (const __CFArray *)BookmarkData::copyItem(v314, 0x1005u, v10, v201);
                        if (v202)
                        {
                          v197 = v202;
                          if (CFArrayGetCount(v202) < 1)
                            goto LABEL_418;
                          v203 = CFArrayGetCount(v197);
                          v204 = CFArrayGetValueAtIndex(v197, v203 - 1);
                          if (!v204)
                            goto LABEL_418;
                          v205 = v204;
                          v206 = CFGetTypeID(v204);
                          if (v206 != CFNumberGetTypeID())
                          {
                            v198 = 0;
                            a6 = v308;
                            goto LABEL_419;
                          }
                          v207 = (const __CFArray *)CFRetain(v205);
                          a6 = v308;
                          if (!v207)
                          {
LABEL_418:
                            v198 = 0;
                            goto LABEL_419;
                          }
                          v208 = v207;
                          CFRelease(v197);
                          v197 = v208;
LABEL_405:
                          v198 = _CFURLCreateWithVolumeURLAndResourceID(a1, v195, v197);
                          v199 = resolveLog;
                          if (os_log_type_enabled((os_log_t)resolveLog, OS_LOG_TYPE_DEBUG))
                          {
                            *(_DWORD *)buf = 67109890;
                            *(_DWORD *)&buf[4] = v10;
                            *(_WORD *)&buf[8] = 2048;
                            *(_QWORD *)&buf[10] = a4;
                            *(_WORD *)&buf[18] = 2112;
                            *(_QWORD *)&buf[20] = v197;
                            *(_WORD *)&buf[28] = 2112;
                            *(_QWORD *)&buf[30] = v195;
                            _os_log_debug_impl(&dword_1817A6000, v199, OS_LOG_TYPE_DEBUG, " -- Trying to match by targetFileID, depth=%u  options=%#lx fileID=%@ on volume %@", buf, 0x26u);
                          }
                          if (!matchURLToBookmark(v314, v10, v198, (BOOL *)&v322, v200) && v198)
                          {
                            CFRelease(v198);
                            goto LABEL_418;
                          }
LABEL_419:
                          CFRelease(v197);
                        }
                        else
                        {
LABEL_417:
                          v198 = 0;
                        }
                        CFRelease(v195);
                      }
                      else
                      {
                        v198 = 0;
                      }
                      if (v324 != v198)
                      {
                        if (v324)
                          CFRelease(v324);
                        v324 = v198;
                      }
                      if (v198)
                      {
LABEL_426:
                        v209 = (const __CFString *)*MEMORY[0x1E0C9B418];
                        v210 = CFNumberGetTypeID();
                        v211 = BookmarkData::copyItem(v314, v209, v10, v210);
                        *(_QWORD *)buf = 0;
                        CFURLCopyResourcePropertyForKey((CFURLRef)v324, v209, buf, 0);
                        if (v211)
                        {
                          if (!*(_QWORD *)buf || !CFEqual(v211, *(CFTypeRef *)buf))
LABEL_431:
                            v322 = 1;
                          if (*(_QWORD *)buf)
                            CFRelease(*(CFTypeRef *)buf);
                          if (v211)
                            CFRelease(v211);
                        }
                        else if (*(_QWORD *)buf)
                        {
                          goto LABEL_431;
                        }
LABEL_436:
                        v11 = v314;
                        if (v324
                          && (BookmarkData::getMisalignedItemDataPtr(v314, 0x1101u, 0, v10)
                           || BookmarkData::getMisalignedItemDataPtr(v314, 0x1102u, 0, v10)))
                        {
                          v212 = CFStringGetTypeID();
                          v213 = (const __CFString *)BookmarkData::copyItem(v314, 0x1102u, v10, v212);
                          v214 = CFStringGetTypeID();
                          v215 = (const __CFString *)BookmarkData::copyItem(v314, 0x1101u, v10, v214);
                          v329 = 0;
                          v330 = CFStringCreateMutable(a1, 0);
                          v216 = CFURLGetString((CFURLRef)v324);
                          v217 = CFStringGetLength(v216);
                          v218 = v329;
                          if (v217 < 1025)
                          {
                            v220 = v217;
                            if (v329 + v217 >= 1025)
                            {
                              CFStringAppendCharacters(v330, (const UniChar *)buf, v329);
                              v218 = 0;
                              v329 = 0;
                            }
                            v221 = (UniChar *)&buf[2 * v218];
                            v334.location = 0;
                            v334.length = v220;
                            CFStringGetCharacters(v216, v334, v221);
                            v219 = v329 + v220;
                            v329 += v220;
                            if (v213)
                              goto LABEL_447;
LABEL_453:
                            if (!v215)
                              goto LABEL_464;
LABEL_458:
                            if (v219 >= 1024)
                            {
                              CFStringAppendCharacters(v330, (const UniChar *)buf, v219);
                              v219 = 0;
                              v329 = 0;
                            }
                            *(_WORD *)&buf[2 * v219] = 35;
                            ++v329;
                            v226 = CFStringGetLength(v215);
                            v227 = v329;
                            if (v226 > 1024)
                            {
                              if (v329)
                              {
                                CFStringAppendCharacters(v330, (const UniChar *)buf, v329);
                                v329 = 0;
                              }
                              CFStringAppend(v330, v215);
                              v219 = v329;
                              goto LABEL_464;
                            }
                            v243 = v226;
                            if (v329 + v226 >= 1025)
                            {
                              CFStringAppendCharacters(v330, (const UniChar *)buf, v329);
                              v227 = 0;
                              v329 = 0;
                            }
                            v244 = (UniChar *)&buf[2 * v227];
                            v336.location = 0;
                            v336.length = v243;
                            CFStringGetCharacters(v215, v336, v244);
                            v219 = v329 + v243;
                            v329 = v219;
                            if (v219)
                            {
LABEL_465:
                              CFStringAppendCharacters(v330, (const UniChar *)buf, v219);
                              v329 = 0;
                            }
                          }
                          else
                          {
                            if (v329)
                            {
                              CFStringAppendCharacters(v330, (const UniChar *)buf, v329);
                              v329 = 0;
                            }
                            CFStringAppend(v330, v216);
                            v219 = v329;
                            if (!v213)
                              goto LABEL_453;
LABEL_447:
                            if (v219 >= 1024)
                            {
                              CFStringAppendCharacters(v330, (const UniChar *)buf, v219);
                              v219 = 0;
                              v329 = 0;
                            }
                            *(_WORD *)&buf[2 * v219] = 63;
                            ++v329;
                            v222 = CFStringGetLength(v213);
                            v223 = v329;
                            if (v222 > 1024)
                            {
                              if (v329)
                              {
                                CFStringAppendCharacters(v330, (const UniChar *)buf, v329);
                                v329 = 0;
                              }
                              CFStringAppend(v330, v213);
                              v219 = v329;
                              goto LABEL_453;
                            }
                            v224 = v222;
                            if (v329 + v222 >= 1025)
                            {
                              CFStringAppendCharacters(v330, (const UniChar *)buf, v329);
                              v223 = 0;
                              v329 = 0;
                            }
                            v225 = (UniChar *)&buf[2 * v223];
                            v335.location = 0;
                            v335.length = v224;
                            CFStringGetCharacters(v213, v335, v225);
                            v219 = v329 + v224;
                            v329 += v224;
                            if (v215)
                              goto LABEL_458;
LABEL_464:
                            if (v219)
                              goto LABEL_465;
                          }
                          v228 = v330;
                          v330 = 0;
                          v229 = CFURLGetBaseURL((CFURLRef)v324);
                          userInfoValues = CFURLCreateWithString(a1, v228, v229);
                          CFReleaser<__CFData const*>::operator=(&v324, (CFTypeRef *)&userInfoValues);
                          if (userInfoValues)
                            CFRelease(userInfoValues);
                          if (v228)
                            CFRelease(v228);
                          if (v215)
                            CFRelease(v215);
                          v11 = v314;
                          if (v213)
                            CFRelease(v213);
                        }
                        Mutable = theArray;
                        if (os_log_type_enabled((os_log_t)resolveLog, OS_LOG_TYPE_DEBUG))
                          CFURLCreateByResolvingDataInBookmark();
                        v98 = 1;
                        if (theArray)
LABEL_477:
                          CFRelease(Mutable);
LABEL_478:
                        if (v98)
                        {
                          if (!v324)
                            goto LABEL_480;
                          goto LABEL_488;
                        }
                        goto LABEL_495;
                      }
                      if (os_log_type_enabled((os_log_t)resolveLog, OS_LOG_TYPE_DEBUG))
                        CFURLCreateByResolvingDataInBookmark();
                      v245 = CFArrayGetTypeID();
                      v246 = (const __CFArray *)BookmarkData::copyItem(v314, 0x1005u, v10, v245);
                      v247 = countPathComponents(v314, v10);
                      if (v246)
                      {
                        LODWORD(v248) = v247;
                        v249 = CFArrayGetTypeID();
                        v250 = (const __CFArray *)BookmarkData::copyItem(v314, 0x2000u, v10, v249);
                        if (v250)
                        {
                          v253 = v250;
                          v254 = v248;
                          v255 = CFArrayGetCount(v250);
                          if (v255 >= v248)
                            v248 = v248;
                          else
                            v248 = v255;
                          if (v248 >= 1)
                          {
                            v256 = v254;
                            while (1)
                            {
                              *(_QWORD *)buf = CFArrayGetValueAtIndex(v253, (v248 - 1));
                              CFNumber::CFNumber((CFNumber *)&userInfoValues, (CFTypeRef *)buf);
                              LODWORD(anURL) = 0;
                              if (!userInfoValues)
                              {
                                v186 = 0;
                                goto LABEL_543;
                              }
                              if (!CFNumberGetValue((CFNumberRef)userInfoValues, kCFNumberSInt32Type, &anURL)
                                || (_DWORD)anURL == 0)
                              {
                                break;
                              }
                              LOBYTE(inited) = 0;
                              v260 = (const __CFURL *)matchVolumeURLForBookmark(v314, anURL, theArray, (char *)&inited, v257, v258);
                              v261 = v260;
                              if (v260)
                              {
                                v262 = resolveLog;
                                if (os_log_type_enabled((os_log_t)resolveLog, OS_LOG_TYPE_DEBUG))
                                {
                                  *(_DWORD *)buf = 138412546;
                                  *(_QWORD *)&buf[4] = v261;
                                  *(_WORD *)&buf[12] = 2112;
                                  *(_QWORD *)&buf[14] = v246;
                                  _os_log_debug_impl(&dword_1817A6000, v262, OS_LOG_TYPE_DEBUG, " --  on volume=%@ fileIDRefs=%@", buf, 0x16u);
                                }
                                v263 = resolveBookmarkByRelativePathFromFileIDOnGivenVolume(v312, v314, v313, a4, v261, v246, v248, v256, &v322);
                                v186 = (CFTypeRef)v263;
                                a6 = v308;
                                if (!v322 && v263)
                                  v322 = inited;
                                CFRelease(v261);
                                goto LABEL_539;
                              }
                              v186 = 0;
LABEL_540:
                              if (userInfoValues)
                                CFRelease(userInfoValues);
                              if (!(_DWORD)v261)
                              {
LABEL_548:
                                LODWORD(v10) = v313;
                                goto LABEL_554;
                              }
LABEL_543:
                              if (v248 >= 2)
                              {
                                --v248;
                                if (!v186)
                                  continue;
                              }
                              goto LABEL_548;
                            }
                            v186 = 0;
LABEL_539:
                            LODWORD(v261) = 1;
                            goto LABEL_540;
                          }
                          v186 = 0;
LABEL_554:
                          CFRelease(v253);
                        }
                        else
                        {
                          v253 = (const __CFArray *)matchVolumeURLForBookmark(v314, v10, theArray, (char *)&v322, v251, v252);
                          if (os_log_type_enabled((os_log_t)resolveLog, OS_LOG_TYPE_DEBUG))
                            CFURLCreateByResolvingDataInBookmark();
                          v186 = (CFTypeRef)resolveBookmarkByRelativePathFromFileIDOnGivenVolume(v312, v314, v10, a4, v253, v246, 0, v248, &v322);
                          a6 = v308;
                          if (v253)
                            goto LABEL_554;
                        }
                        CFRelease(v246);
                        a1 = v312;
                      }
                      else
                      {
                        v186 = 0;
                      }
                      if (v324 != v186)
                      {
                        if (v324)
                          CFRelease(v324);
                        v324 = v186;
                      }
                      if ((_DWORD)v10 != 1 || v186)
                      {
LABEL_382:
                        if (v186)
                          goto LABEL_426;
                        goto LABEL_436;
                      }
                      if (os_log_type_enabled((os_log_t)resolveLog, OS_LOG_TYPE_DEBUG))
                        CFURLCreateByResolvingDataInBookmark();
                      gotLoadHelper_x8__GSLibraryResolveDocumentId2(v264);
                      if (!*(_QWORD *)(v265 + 3352))
                      {
                        v186 = 0;
                        goto LABEL_590;
                      }
                      v266 = (const __CFString *)*MEMORY[0x1E0C9B418];
                      v267 = CFNumberGetTypeID();
                      v268 = BookmarkData::copyItem(v314, v266, 1, v267);
                      if (!v268)
                      {
                        v186 = 0;
                        goto LABEL_590;
                      }
                      v271 = v268;
                      v272 = (const __CFURL *)matchVolumeURLForBookmark(v314, 1u, theArray, (char *)&v322, v269, v270);
                      if (!v272)
                      {
                        v186 = 0;
                        goto LABEL_589;
                      }
                      v273 = v272;
                      if (volumeSupportsPathFromID((uint64_t)v272))
                      {
                        userInfoValues = 0;
                        if (!CFURLCopyResourcePropertyForKey(v273, (CFStringRef)*MEMORY[0x1E0C9AD70], &userInfoValues, 0))goto LABEL_585;
                        if (userInfoValues)
                        {
                          anURL = 0;
                          valuePtr = 0;
                          if (CFNumberGetValue((CFNumberRef)userInfoValues, kCFNumberSInt32Type, &valuePtr))
                          {
                            if (CFNumberGetValue(v271, kCFNumberSInt64Type, &anURL))
                            {
                              inited = GSLibraryResolveDocumentId2_delayInitStub(v274);
                              if (inited)
                              {
                                v275 = CFNumberCreate(a1, kCFNumberSInt64Type, &inited);
                                if (v275)
                                {
                                  v276 = v275;
                                  v186 = _CFURLCreateWithVolumeURLAndResourceID(a1, v273, v275);
                                  v277 = resolveLog;
                                  if (os_log_type_enabled((os_log_t)resolveLog, OS_LOG_TYPE_DEBUG))
                                  {
                                    *(_DWORD *)buf = 134218498;
                                    *(_QWORD *)&buf[4] = a4;
                                    *(_WORD *)&buf[12] = 2112;
                                    *(_QWORD *)&buf[14] = v276;
                                    *(_WORD *)&buf[22] = 2112;
                                    *(_QWORD *)&buf[24] = v273;
                                    _os_log_debug_impl(&dword_1817A6000, v277, OS_LOG_TYPE_DEBUG, " -- Trying to match by targetFileID from documentID, options=%#lx fileID=%@ on volume %@", buf, 0x20u);
                                  }
                                  if (!matchURLToBookmark(v314, 1u, (const __CFURL *)v186, (BOOL *)&v322, v278) && v186)
                                  {
                                    CFRelease(v186);
                                    v186 = 0;
                                  }
                                  CFRelease(v276);
                                  a6 = v308;
                                  a1 = v312;
                                  LODWORD(v10) = v313;
LABEL_586:
                                  if (userInfoValues)
                                    CFRelease(userInfoValues);
LABEL_588:
                                  CFRelease(v273);
LABEL_589:
                                  CFRelease(v271);
LABEL_590:
                                  if (v324 != v186)
                                  {
                                    if (v324)
                                      CFRelease(v324);
                                    v324 = v186;
                                  }
                                  goto LABEL_382;
                                }
                              }
                            }
                          }
LABEL_585:
                          v186 = 0;
                          goto LABEL_586;
                        }
                      }
                      v186 = 0;
                      goto LABEL_588;
                    }
                  }
                  if (v167)
                    goto LABEL_608;
LABEL_605:
                  v98 = 0;
                  LODWORD(v10) = v313;
                  if (Mutable)
                    goto LABEL_477;
                  goto LABEL_478;
                }
                v73 = CFErrorCreate(a1, (CFErrorDomain)*MEMORY[0x1E0C9AFB8], 4, 0);
                v323 = v73;
              }
              a6 = v308;
              if (!v73
                || (Domain = CFErrorGetDomain((CFErrorRef)v73), !CFEqual(Domain, (CFTypeRef)*MEMORY[0x1E0C9AFC8]))
                || CFErrorGetCode((CFErrorRef)v323) != -128)
              {
                v74 = 0;
                goto LABEL_203;
              }
              if (os_log_type_enabled((os_log_t)resolveLog, OS_LOG_TYPE_DEBUG))
                CFURLCreateByResolvingDataInBookmark();
              v17 = 0;
              v98 = 0;
              if (Mutable)
                goto LABEL_477;
              goto LABEL_478;
            }
            if (v43)
              goto LABEL_69;
          }
LABEL_70:
          Mutable = theArray;
          CFArrayAppendValue(theArray, anURL);
        }
      }
    }
    *(_DWORD *)buf = 138412290;
    *(_QWORD *)&buf[4] = v39;
    _os_log_debug_impl(&dword_1817A6000, v41, OS_LOG_TYPE_DEBUG, "Checking volume for match to bookmark, volumeURL=%@", buf, 0xCu);
    if (!v16)
      goto LABEL_48;
    goto LABEL_47;
  }
  v17 = 0;
LABEL_480:
  ItemInTOC = BookmarkData::findItemInTOC(v11, 0x1003u, v10);
  if (ItemInTOC)
  {
    v231 = ItemInTOC;
    v232 = CFStringGetTypeID();
    v233 = (const __CFString *)BookmarkData::copyItem(v11, v231, v232);
    if (v233)
    {
      v234 = v233;
      v235 = CFURLCreateWithString(a1, v233, 0);
      if (v324 != v235)
      {
        if (v324)
          CFRelease(v324);
        v324 = v235;
      }
      CFRelease(v234);
    }
  }
  if (v324)
  {
LABEL_488:
    v236 = CFBooleanGetTypeID();
    v237 = BookmarkData::copyItem(v11, 0xD001u, v10, v236);
    if (v237)
    {
      v238 = v237;
      if (CFEqual(v237, (CFTypeRef)*MEMORY[0x1E0C9AE50]))
      {
        v239 = (const __CFURL *)v324;
        if (v323)
        {
          CFRelease(v323);
          v323 = 0;
        }
        *(_QWORD *)buf = CFURLCreateFileReferenceURL(a1, v239, (CFErrorRef *)&v323);
        CFReleaser<__CFData const*>::operator=(&v324, (CFTypeRef *)buf);
        if (*(_QWORD *)buf)
          CFRelease(*(CFTypeRef *)buf);
      }
      CFRelease(v238);
    }
  }
LABEL_495:
  v240 = v324;
  if (!a6 || v324)
  {
    if (a5 && v324)
    {
      *(_BYTE *)a5 = v322;
      goto LABEL_504;
    }
  }
  else
  {
    v241 = v323;
    v323 = 0;
    *(_QWORD *)a6 = v241;
  }
  if (a7 && !v240)
  {
    *a7 = v17;
    v17 = 0;
  }
LABEL_504:
  v324 = 0;
  if (v323)
    CFRelease(v323);
  if (v17)
    CFRelease(v17);
  if (v324)
    CFRelease(v324);
  return v240;
}

void releaseBookmarkExtension(uint64_t a1)
{
  NSObject *v2;
  int v3;
  int v4;
  uint64_t v5;
  __int16 v6;
  int v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  if (a1 >= 1 && sandbox_extension_release())
  {
    v2 = resolveLog;
    if (os_log_type_enabled((os_log_t)resolveLog, OS_LOG_TYPE_INFO))
    {
      v3 = *__error();
      v4 = 134218240;
      v5 = a1;
      v6 = 1024;
      v7 = v3;
      _os_log_impl(&dword_1817A6000, v2, OS_LOG_TYPE_INFO, "failed to release sandbox extension handle %lld, error=%{errno}d", (uint8_t *)&v4, 0x12u);
    }
  }
}

unsigned int *getBookmarkSandboxExtensionForTag(BookmarkData *a1, unsigned int a2, unsigned int *a3)
{
  unsigned int *result;
  unsigned int *v5;
  uint64_t v6;

  result = BookmarkData::getMisalignedItemDataPtr(a1, a2, 0, 1, a3);
  if (result)
  {
    if (*a3 && (v5 = result, v6 = *a3 - 1, !*((_BYTE *)result + v6)))
    {
      if (strlen((const char *)result) == v6)
        return v5;
      else
        return 0;
    }
    else
    {
      return 0;
    }
  }
  return result;
}

CFTypeRef matchVolumeURLForBookmark(BookmarkData *a1, unsigned int a2, CFArrayRef theArray, char *a4, const __CFArray *a5, unsigned __int8 *a6)
{
  CFIndex Count;
  CFTypeID TypeID;
  __CFString *v11;
  CFTypeID v12;
  __CFString *v13;
  CFTypeID v14;
  __CFString *v15;
  CFTypeID v16;
  __CFString *v17;
  CFTypeID v18;
  __CFString *v19;
  _BOOL4 URLVolumeProperties;
  __CFString *v21;
  CFIndex v22;
  const __CFString *v23;
  CFTypeRef v24;
  CFTypeRef ValueAtIndex;
  NSObject *v26;
  CFIndex v27;
  const __CFString *v28;
  CFTypeRef v29;
  NSObject *v30;
  char v31;
  char *v32;
  _BOOL4 v33;
  __CFString *v34;
  CFIndex v35;
  const __CFURL *v36;
  const __CFURL *v37;
  CFIndex v38;
  const __CFString *v39;
  const void *v40;
  CFTypeRef v41;
  NSObject *v42;
  NSObject *log;
  const __CFString *v45;
  unsigned int v46;
  __CFString *v47;
  __CFString *v48;
  __CFString *v49;
  __CFString *v50;
  __CFString *v51;
  __CFString *v52;
  CFTypeRef v54;
  int v55;
  uint64_t v56;
  CFTypeRef cf;
  uint8_t buf[4];
  CFTypeRef v59;
  __int16 v60;
  __CFString *v61;
  __int16 v62;
  __CFString *v63;
  __int16 v64;
  __CFString *v65;
  uint64_t v66;

  v66 = *MEMORY[0x1E0C80C00];
  cf = 0;
  Count = CFArrayGetCount(theArray);
  TypeID = CFStringGetTypeID();
  v11 = (__CFString *)BookmarkData::copyItem(a1, 0x2010u, a2, TypeID);
  v12 = CFURLGetTypeID();
  v13 = (__CFString *)BookmarkData::copyItem(a1, 0x2050u, a2, v12);
  v14 = CFStringGetTypeID();
  v15 = (__CFString *)BookmarkData::copyItem(a1, 0x2011u, a2, v14);
  v16 = CFNumberGetTypeID();
  v17 = (__CFString *)BookmarkData::copyItem(a1, 0x2012u, a2, v16);
  v18 = CFDateGetTypeID();
  v19 = (__CFString *)BookmarkData::copyItem(a1, 0x2013u, a2, v18);
  URLVolumeProperties = BookmarkData::getURLVolumeProperties(a1, a2, (uint64_t)&v55);
  if (v15)
  {
    if (Count >= 1)
    {
      v47 = v11;
      v50 = v17;
      v21 = v19;
      v22 = 0;
      v23 = (const __CFString *)*MEMORY[0x1E0C9B7F0];
      while (1)
      {
        v24 = cf;
        if (cf)
          break;
        ValueAtIndex = CFArrayGetValueAtIndex(theArray, v22);
        if (matchURLProperty((const __CFURL *)ValueAtIndex, v23, v15))
        {
          if (ValueAtIndex)
            CFRetain(ValueAtIndex);
          if (cf != ValueAtIndex)
          {
            if (cf)
              CFRelease(cf);
            cf = ValueAtIndex;
          }
          v26 = resolveLog;
          if (os_log_type_enabled((os_log_t)resolveLog, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 138412546;
            v59 = ValueAtIndex;
            v60 = 2112;
            v61 = v15;
            _os_log_debug_impl(&dword_1817A6000, v26, OS_LOG_TYPE_DEBUG, "matched volume %@ by uuid %@", buf, 0x16u);
          }
        }
        if (Count == ++v22)
          goto LABEL_34;
      }
LABEL_31:
      v31 = 0;
      v11 = v47;
      v19 = v21;
      goto LABEL_32;
    }
    goto LABEL_62;
  }
  if (v13)
  {
    if (Count >= 1)
    {
      v47 = v11;
      v50 = v17;
      v21 = v19;
      v27 = 0;
      v28 = (const __CFString *)*MEMORY[0x1E0C9B7E0];
      while (1)
      {
        v24 = cf;
        if (cf)
          goto LABEL_31;
        v29 = CFArrayGetValueAtIndex(theArray, v27);
        if (matchURLProperty((const __CFURL *)v29, v28, v13))
        {
          if (v29)
            CFRetain(v29);
          if (cf != v29)
          {
            if (cf)
              CFRelease(cf);
            cf = v29;
          }
          v30 = resolveLog;
          if (os_log_type_enabled((os_log_t)resolveLog, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 138412546;
            v59 = v29;
            v60 = 2112;
            v61 = v13;
            _os_log_debug_impl(&dword_1817A6000, v30, OS_LOG_TYPE_DEBUG, "matched volume %@ by VolumeMountURL %@", buf, 0x16u);
          }
        }
        if (Count == ++v27)
        {
LABEL_34:
          v24 = cf;
          v19 = v21;
          v32 = a4;
          if (!cf)
          {
            v11 = v47;
            v17 = v50;
            goto LABEL_89;
          }
          v31 = 0;
          v11 = v47;
          if (!a4)
            goto LABEL_87;
          goto LABEL_36;
        }
      }
    }
LABEL_62:
    v24 = 0;
    goto LABEL_89;
  }
  v33 = URLVolumeProperties;
  if (!v11)
  {
    v24 = 0;
    if (!v17 || !v19)
      goto LABEL_88;
    if (Count >= 1)
    {
      v52 = v19;
      v38 = 0;
      v46 = 0;
      v39 = (const __CFString *)*MEMORY[0x1E0C9B7D0];
      v49 = (__CFString *)*MEMORY[0x1E0C9B408];
      do
      {
        v54 = 0;
        v40 = CFArrayGetValueAtIndex(theArray, v38);
        v41 = CFRetain(v40);
        if (v54 != v41)
        {
          if (v54)
            CFRelease(v54);
          v54 = v41;
        }
        if (matchURLProperty((const __CFURL *)v41, v39, v17) && matchURLProperty((const __CFURL *)v54, v49, v52) && v33)
        {
          if (_CFURLGetVolumePropertyFlags())
          {
            if ((v56 & 1) != 0 && (v55 & 1) == 0)
            {
              CFReleaser<__CFData const*>::operator=(&cf, &v54);
              ++v46;
              v42 = resolveLog;
              if (os_log_type_enabled((os_log_t)resolveLog, OS_LOG_TYPE_DEBUG))
              {
                *(_DWORD *)buf = 138412802;
                v59 = cf;
                v60 = 2112;
                v61 = v17;
                v62 = 2112;
                v63 = v52;
                _os_log_debug_impl(&dword_1817A6000, v42, OS_LOG_TYPE_DEBUG, "(possible) matched volume %@ by capacity=%@ and creationDate=%@ (renamed volume case)", buf, 0x20u);
              }
            }
          }
        }
        if (v54)
          CFRelease(v54);
        ++v38;
      }
      while (Count != v38);
      v19 = v52;
      if (v46 > 1)
      {
        if (os_log_type_enabled((os_log_t)resolveLog, OS_LOG_TYPE_DEBUG))
          matchVolumeURLForBookmark();
        if (cf)
          CFRelease(cf);
        v24 = 0;
        goto LABEL_88;
      }
    }
    v50 = v17;
    v31 = 1;
    v24 = cf;
LABEL_32:
    v32 = a4;
    if (!a4)
      goto LABEL_87;
    goto LABEL_36;
  }
  if (Count < 1)
    goto LABEL_62;
  v34 = v19;
  v35 = 0;
  v51 = (__CFString *)*MEMORY[0x1E0C9B7D0];
  v48 = (__CFString *)*MEMORY[0x1E0C9B408];
  v45 = (const __CFString *)*MEMORY[0x1E0C9B718];
  do
  {
    v24 = cf;
    if (cf)
    {
      v50 = v17;
      v31 = 0;
      v19 = v34;
      goto LABEL_32;
    }
    v36 = (const __CFURL *)CFArrayGetValueAtIndex(theArray, v35);
    v37 = v36;
    if ((!v17 || matchURLProperty(v36, v51, v17)) && (!v34 || matchURLProperty(v37, v48, v34)))
    {
      v54 = 0;
      if (v33
        && (v56 & 1) != 0
        && _CFURLGetVolumePropertyFlags()
        && ((v55 ^ v54) & 1) == 0
        && matchURLProperty(v37, v45, v11))
      {
        if (v37)
          CFRetain(v37);
        if (cf != v37)
        {
          if (cf)
            CFRelease(cf);
          cf = v37;
        }
        log = resolveLog;
        if (os_log_type_enabled((os_log_t)resolveLog, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138413058;
          v59 = v37;
          v60 = 2112;
          v61 = v11;
          v62 = 2112;
          v63 = v17;
          v64 = 2112;
          v65 = v34;
          _os_log_debug_impl(&dword_1817A6000, log, OS_LOG_TYPE_DEBUG, "matched volume %@ by name=%@ and capacity=%@ and creationDate=%@", buf, 0x2Au);
        }
      }
    }
    ++v35;
  }
  while (Count != v35);
  v24 = cf;
  v19 = v34;
  v32 = a4;
  if (cf)
  {
    v50 = v17;
    v31 = 0;
    if (!a4)
    {
LABEL_87:
      v17 = v50;
LABEL_88:
      cf = 0;
      goto LABEL_89;
    }
LABEL_36:
    if (v24)
    {
      v17 = v50;
      if (!*v32)
        *v32 = v31;
      goto LABEL_88;
    }
    goto LABEL_87;
  }
LABEL_89:
  if (v19)
    CFRelease(v19);
  if (v17)
    CFRelease(v17);
  if (v15)
    CFRelease(v15);
  if (v13)
    CFRelease(v13);
  if (v11)
    CFRelease(v11);
  if (cf)
    CFRelease(cf);
  return v24;
}

uint64_t fileIDsMatch(BookmarkData *a1, unsigned int a2, const __CFURL *a3)
{
  CFTypeID TypeID;
  const void *v7;
  uint64_t v8;
  CFTypeID v9;
  const __CFArray *v10;
  const __CFArray *v11;
  CFIndex Count;
  const void *ValueAtIndex;
  const void *v14;
  CFTypeID v15;
  CFTypeRef v16;
  CFTypeRef propertyValueTypeRefPtr;

  TypeID = CFNumberGetTypeID();
  v7 = BookmarkData::copyItem(a1, 0x1030u, a2, TypeID);
  if (v7)
  {
LABEL_2:
    if (volumeSupportsPersistentIDs((uint64_t)a3))
    {
      propertyValueTypeRefPtr = 0;
      if (!CFURLCopyResourcePropertyForKey(a3, (CFStringRef)*MEMORY[0x1E0C9AC50], &propertyValueTypeRefPtr, 0))
      {
        v8 = 0;
LABEL_16:
        if (propertyValueTypeRefPtr)
          CFRelease(propertyValueTypeRefPtr);
        goto LABEL_18;
      }
      if (propertyValueTypeRefPtr)
      {
        v8 = CFEqual(v7, propertyValueTypeRefPtr);
        goto LABEL_16;
      }
    }
    v8 = 0;
LABEL_18:
    CFRelease(v7);
    return v8;
  }
  v9 = CFArrayGetTypeID();
  v10 = (const __CFArray *)BookmarkData::copyItem(a1, 0x1005u, a2, v9);
  if (v10)
  {
    v11 = v10;
    if (CFArrayGetCount(v10) >= 1)
    {
      Count = CFArrayGetCount(v11);
      ValueAtIndex = CFArrayGetValueAtIndex(v11, Count - 1);
      if (ValueAtIndex)
      {
        v14 = ValueAtIndex;
        v15 = CFGetTypeID(ValueAtIndex);
        if (v15 == CFNumberGetTypeID())
        {
          v16 = CFRetain(v14);
          if (v16)
          {
            v7 = v16;
            CFRelease(v11);
            goto LABEL_2;
          }
        }
      }
    }
    CFRelease(v11);
  }
  return volumeSupportsPersistentIDs((uint64_t)a3) ^ 1;
}

BOOL matchURLProperty(const __CFURL *a1, const __CFString *a2, CFTypeRef a3)
{
  _BOOL8 v4;
  CFTypeID v5;
  int v6;
  CFTypeRef propertyValueTypeRefPtr;

  propertyValueTypeRefPtr = 0;
  if (!CFURLCopyResourcePropertyForKey(a1, a2, &propertyValueTypeRefPtr, 0))
    goto LABEL_8;
  if (propertyValueTypeRefPtr == a3)
  {
    v4 = 1;
    if (!a3)
      return v4;
    goto LABEL_10;
  }
  v4 = 0;
  if (a3 && propertyValueTypeRefPtr)
  {
    v5 = CFGetTypeID(a3);
    if (v5 == CFGetTypeID(propertyValueTypeRefPtr))
    {
      if (v5 == CFURLGetTypeID())
        v6 = sameFileURL(a3, propertyValueTypeRefPtr);
      else
        v6 = CFEqual(a3, propertyValueTypeRefPtr);
      v4 = v6 != 0;
      goto LABEL_9;
    }
LABEL_8:
    v4 = 0;
  }
LABEL_9:
  a3 = propertyValueTypeRefPtr;
  if (propertyValueTypeRefPtr)
LABEL_10:
    CFRelease(a3);
  return v4;
}

uint64_t volumeSupportsPersistentIDs(uint64_t result)
{
  if (result)
  {
    result = _CFURLGetVolumePropertyFlags();
    if ((_DWORD)result)
      return 0;
  }
  return result;
}

const void *copyHomeFolderURLForUser(const __CFAllocator *a1, unint64_t a2, const __CFString *a3)
{
  const void *v4;
  uint64_t v5;

  pthread_mutex_lock(&copyHomeFolderURLForUser(__CFAllocator const*,unsigned long,__CFString const*)::sCopyHomeFolderLock);
  if (a1
    || (v4 = (const void *)copyHomeFolderURLForUser(__CFAllocator const*,unsigned long,__CFString const*)::sUserHomeFolderURL) == 0)
  {
    v5 = CFCopyHomeDirectoryURLForUser();
    v4 = (const void *)v5;
    if (!a1 && v5)
    {
      if (copyHomeFolderURLForUser(__CFAllocator const*,unsigned long,__CFString const*)::sUserHomeFolderURL)
      {
        CFRelease((CFTypeRef)copyHomeFolderURLForUser(__CFAllocator const*,unsigned long,__CFString const*)::sUserHomeFolderURL);
        copyHomeFolderURLForUser(__CFAllocator const*,unsigned long,__CFString const*)::sUserHomeFolderURL = 0;
      }
      CFRetain(v4);
      copyHomeFolderURLForUser(__CFAllocator const*,unsigned long,__CFString const*)::sUserHomeFolderURL = (uint64_t)v4;
    }
  }
  else
  {
    CFRetain((CFTypeRef)copyHomeFolderURLForUser(__CFAllocator const*,unsigned long,__CFString const*)::sUserHomeFolderURL);
  }
  pthread_mutex_unlock(&copyHomeFolderURLForUser(__CFAllocator const*,unsigned long,__CFString const*)::sCopyHomeFolderLock);
  return v4;
}

BOOL isDirectory(BookmarkData *a1, int a2)
{
  _BOOL8 result;
  _BYTE v3[24];

  result = BookmarkData::getURLResourceProperties(a1, a2, (uint64_t)v3);
  if (result)
  {
    if ((v3[8] & 2) != 0)
      return (v3[0] >> 1) & 1;
    else
      return 0;
  }
  return result;
}

BOOL matchURLToBookmark(BookmarkData *a1, unsigned int a2, const __CFURL *a3, BOOL *a4, const __CFURL **a5)
{
  _BOOL4 URLResourceProperties;
  int v10;
  _BOOL8 result;
  CFStringRef v12;
  int v13;
  CFStringRef string;
  CFStringRef propertyValueTypeRefPtr[2];
  uint64_t v16;
  int v17;
  uint64_t v18;
  char __s2[1024];
  char buffer[1024];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  URLResourceProperties = BookmarkData::getURLResourceProperties(a1, a2, (uint64_t)&v17);
  if (os_log_type_enabled((os_log_t)resolveLog, OS_LOG_TYPE_DEBUG))
  {
    matchURLToBookmark();
    if (!a3)
      return 0;
  }
  else if (!a3)
  {
    return 0;
  }
  propertyValueTypeRefPtr[1] = 0;
  v16 = 0;
  v10 = v18 & 0xF;
  if (!_CFURLCopyResourcePropertyValuesAndFlags())
    return 0;
  if (URLResourceProperties)
  {
    if (((v17 ^ v16) & v10) != 0)
      return 0;
    if (os_log_type_enabled((os_log_t)resolveLog, OS_LOG_TYPE_DEBUG))
      matchURLToBookmark();
  }
  else if (os_log_type_enabled((os_log_t)resolveLog, OS_LOG_TYPE_DEBUG))
  {
    matchURLToBookmark();
  }
  string = 0;
  propertyValueTypeRefPtr[0] = 0;
  if (!CFURLCopyResourcePropertyForKey(a3, (CFStringRef)*MEMORY[0x1E0C9B5B0], propertyValueTypeRefPtr, 0)
    || !CFURLCopyResourcePropertyForKey(a3, (CFStringRef)*MEMORY[0x1E0C9B3F0], &string, 0))
  {
    goto LABEL_23;
  }
  v12 = propertyValueTypeRefPtr[0];
  if (!propertyValueTypeRefPtr[0] || !string)
  {
    if (os_log_type_enabled((os_log_t)resolveLog, OS_LOG_TYPE_DEBUG))
      matchURLToBookmark();
LABEL_23:
    v13 = 1;
    goto LABEL_24;
  }
  if (propertyValueTypeRefPtr[0] == string)
  {
    v13 = 1;
    goto LABEL_25;
  }
  CFStringGetFileSystemRepresentation(propertyValueTypeRefPtr[0], buffer, 1024);
  CFStringGetFileSystemRepresentation(string, __s2, 1024);
  if (!strcmp(buffer, __s2))
    goto LABEL_23;
  if (os_log_type_enabled((os_log_t)resolveLog, OS_LOG_TYPE_DEBUG))
    matchURLToBookmark();
  v13 = 0;
LABEL_24:
  v12 = string;
  if (string)
LABEL_25:
    CFRelease(v12);
  if (propertyValueTypeRefPtr[0])
    CFRelease(propertyValueTypeRefPtr[0]);
  result = v13 != 0;
  if (a4 && v13)
  {
    if (!*a4)
      *a4 = fileIDsMatch(a1, a2, a3) == 0;
    return 1;
  }
  return result;
}

CFArrayRef ___ZL27copyVolumesArrayForBookmarkPK13__CFAllocatorR12BookmarkDataj_block_invoke()
{
  void *v0;
  CFArrayRef result;
  void *values[3];

  values[2] = *(void **)MEMORY[0x1E0C80C00];
  v0 = (void *)*MEMORY[0x1E0C9B7F0];
  values[0] = *(void **)MEMORY[0x1E0C9B6D8];
  values[1] = v0;
  result = CFArrayCreate((CFAllocatorRef)*MEMORY[0x1E0C9AE00], (const void **)values, 2, MEMORY[0x1E0C9B378]);
  copyVolumesArrayForBookmark(__CFAllocator const*,BookmarkData &,unsigned int)::sPropertyKeys = (uint64_t)result;
  return result;
}

void CFNumber::CFNumber(CFNumber *this, CFTypeRef *a2)
{
  CFTypeID v4;
  CFTypeRef v5;

  if (*a2 && (v4 = CFGetTypeID(*a2), v4 == CFNumberGetTypeID()))
  {
    v5 = *a2;
    if (v5)
      CFRetain(v5);
  }
  else
  {
    v5 = 0;
  }
  *(_QWORD *)this = v5;
}

uint64_t volumeSupportsPathFromID(uint64_t result)
{
  if (result)
  {
    result = _CFURLGetVolumePropertyFlags();
    if ((_DWORD)result)
      return 0;
  }
  return result;
}

uint64_t resolveBookmarkByRelativePathFromFileIDOnGivenVolume(const __CFAllocator *a1, BookmarkData *a2, unsigned int a3, unint64_t a4, const __CFURL *a5, const __CFArray *a6, uint64_t a7, uint64_t a8, unsigned __int8 *a9)
{
  if (a5)
    _CFURLGetResourcePropertyFlags();
  return 0;
}

void ___ZL25DownloadCloudDocumentSyncPK7__CFURL_block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  NSObject *v7;
  uint64_t v8;
  int v9;
  const char *v10;
  __int16 v11;
  uint64_t v12;
  __int16 v13;
  uint64_t v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v7 = bmarkLog;
  if (os_log_type_enabled((os_log_t)bmarkLog, OS_LOG_TYPE_INFO))
  {
    v8 = *(_QWORD *)(a1 + 40);
    v9 = 136315650;
    v10 = "DownloadCloudDocumentSync";
    v11 = 2112;
    v12 = v8;
    v13 = 2112;
    v14 = a3;
    _os_log_impl(&dword_1817A6000, v7, OS_LOG_TYPE_INFO, "%s: finished %@, error=%@", (uint8_t *)&v9, 0x20u);
  }
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = a3 == 0;
  (*(void (**)(uint64_t))(a4 + 16))(a4);
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 48));
}

void OUTLINED_FUNCTION_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 2u);
}

void OUTLINED_FUNCTION_1(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 0xCu);
}

void OUTLINED_FUNCTION_5(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 8u);
}

void OUTLINED_FUNCTION_7(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_list va;

  va_start(va, a4);
  _os_log_debug_impl(a1, log, OS_LOG_TYPE_DEBUG, a4, (uint8_t *)va, 0x12u);
}

void OUTLINED_FUNCTION_9(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_list va;

  va_start(va, a4);
  _os_log_debug_impl(a1, log, OS_LOG_TYPE_DEBUG, a4, (uint8_t *)va, 0x16u);
}

void OUTLINED_FUNCTION_10(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

__CFDictionary *_FSURLCopyTemporaryPropertiesForKeys(const __CFURL *a1, const __CFArray *a2)
{
  const void *v4;
  _QWORD *v5;
  CFMutableDictionaryRef TemporaryPropertyDictionary;
  const __CFDictionary *v7;
  CFIndex Count;
  CFIndex v9;
  CFIndex v10;
  __CFDictionary *Mutable;
  const CFDictionaryKeyCallBacks *v12;
  const CFDictionaryValueCallBacks *v13;
  const void *ValueAtIndex;
  const __CFAllocator *v15;
  CFMutableDictionaryRef PermanentPropertyDictionary;
  const __CFDictionary *v17;
  CFIndex v18;
  CFIndex v19;
  CFIndex v20;
  const CFDictionaryKeyCallBacks *v21;
  const CFDictionaryValueCallBacks *v22;
  const void *v23;
  const __CFAllocator *v24;
  void *value;

  v4 = (const void *)__CFURLResourceInfoPtr();
  v5 = _FileCacheGetForURL(a1, v4);
  _FileCacheLockTempPermProperties();
  TemporaryPropertyDictionary = _FileCacheGetTemporaryPropertyDictionary(v5, 0);
  if (TemporaryPropertyDictionary && (v7 = TemporaryPropertyDictionary, Count = CFArrayGetCount(a2), Count >= 1))
  {
    v9 = Count;
    v10 = 0;
    Mutable = 0;
    v12 = (const CFDictionaryKeyCallBacks *)MEMORY[0x1E0C9B390];
    v13 = (const CFDictionaryValueCallBacks *)MEMORY[0x1E0C9B3A0];
    do
    {
      ValueAtIndex = CFArrayGetValueAtIndex(a2, v10);
      value = 0;
      if (CFDictionaryGetValueIfPresent(v7, ValueAtIndex, (const void **)&value))
      {
        if (!Mutable)
        {
          v15 = CFGetAllocator(a1);
          Mutable = CFDictionaryCreateMutable(v15, 0, v12, v13);
        }
        CFDictionaryAddValue(Mutable, ValueAtIndex, value);
      }
      ++v10;
    }
    while (v9 != v10);
  }
  else
  {
    Mutable = 0;
  }
  PermanentPropertyDictionary = _FileCacheGetPermanentPropertyDictionary(v5, 0);
  if (PermanentPropertyDictionary)
  {
    v17 = PermanentPropertyDictionary;
    v18 = CFArrayGetCount(a2);
    if (v18 >= 1)
    {
      v19 = v18;
      v20 = 0;
      v21 = (const CFDictionaryKeyCallBacks *)MEMORY[0x1E0C9B390];
      v22 = (const CFDictionaryValueCallBacks *)MEMORY[0x1E0C9B3A0];
      do
      {
        v23 = CFArrayGetValueAtIndex(a2, v20);
        value = 0;
        if (CFDictionaryGetValueIfPresent(v17, v23, (const void **)&value))
        {
          if (!Mutable)
          {
            v24 = CFGetAllocator(a1);
            Mutable = CFDictionaryCreateMutable(v24, 0, v21, v22);
          }
          CFDictionaryAddValue(Mutable, v23, value);
        }
        ++v20;
      }
      while (v19 != v20);
    }
  }
  _FileCacheUnlockTempPermProperties();
  return Mutable;
}

CFDictionaryRef _FSURLCopyResourcePropertiesForKeysFromCache(const __CFURL *a1, const __CFArray *a2, const void *a3)
{
  return _FSURLCopyResourcePropertiesForKeysInternal(a1, a2, a3, 0, 0);
}

uint64_t _FSURLGetResourcePropertyFlags(const __CFURL *a1, uint64_t a2, _QWORD *a3, CFTypeRef cf, CFErrorRef *a5)
{
  CFTypeRef v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t *v20;
  size_t v21;
  char *v22;
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t *v33;
  int v34;
  uint64_t v35;
  uint64_t v36;
  char *v37;
  char *v38;
  uint64_t v39;
  uint64_t (*v40)(const __CFURL *, uint64_t, char *, char *, char *, uint64_t, uint64_t);
  int v41;
  BOOL v42;
  int v43;
  _QWORD *v44;
  uint64_t v45;
  uint64_t *v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t *v50;
  uint64_t v51;
  uint64_t v52;
  char *v53;
  char *v54;
  char *v55;
  uint64_t (*v56)(const __CFURL *, uint64_t, char *, char *, char *, uint64_t, uint64_t);
  uint64_t v57;
  int v58;
  uint64_t v59;
  uint64_t *v60;
  uint64_t *v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t *v66;
  uint64_t *v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  char *v72;
  char *v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  char *v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t *v81;
  uint64_t *v82;
  CFErrorRef *v83;
  uint64_t v85;
  uint64_t v86;
  char *v87;
  CFErrorRef *v88;
  uint64_t *v89;
  _QWORD *v90;
  uint64_t v91;
  uint64_t v92;
  const __CFURL *v93;
  uint64_t v94;
  char *v95;
  uint64_t *v96;
  uint64_t *v97;
  uint64_t v98;
  _OWORD v99[4];
  uint64_t v100;

  v100 = *MEMORY[0x1E0C80C00];
  v93 = a1;
  v8 = _FileCacheGetForURL(a1, cf);
  v98 = (uint64_t)v8;
  v9 = qword_1ECD2A538;
  v88 = a5;
  if (_FSURLGetResourcePropertyFlags::sOnce != -1)
    dispatch_once(&_FSURLGetResourcePropertyFlags::sOnce, &__block_literal_global_4);
  if (_FSURLGetResourcePropertyFlags::maskToPropertyTableCount)
    v10 = 18;
  else
    v10 = 0;
  v11 = MEMORY[0x1E0C80A78](v8);
  v97 = &v85 - v12;
  v13 = MEMORY[0x1E0C80A78](v11);
  v15 = &v85 - v14;
  v16 = MEMORY[0x1E0C80A78](v13);
  v96 = &v85 - v17;
  v18 = MEMORY[0x1E0C80A78](v16);
  v20 = &v85 - v19;
  MEMORY[0x1E0C80A78](v18);
  v22 = (char *)&v85 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a3)
  {
    if (v9 >= 1)
      bzero((char *)&v85 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0), v21);
    v23 = _ZZZ30_FSURLGetResourcePropertyFlagsEUb0_E8theTable;
    v24 = (uint64_t *)(_FSURLGetResourcePropertyFlags::maskToPropertyTable + 24);
    do
    {
      if ((v23 & a2) != 0)
      {
        v25 = *(v24 - 1);
        v26 = **(int **)(v25 + 140);
        v27 = *(_QWORD *)&v22[8 * v26];
        if (v27 <= 95)
        {
          v28 = (int)v10 * (uint64_t)(int)v26;
          v97[v28 + v27] = *(_QWORD *)(v25 + 8);
          v15[v28 + v27] = 0;
          v96[v28 + v27] = *(_QWORD *)v25;
          v20[v28 + v27] = v23;
          *(_QWORD *)&v22[8 * v26] = v27 + 1;
        }
      }
      v29 = *v24;
      v24 += 3;
      v23 = v29;
    }
    while (v29);
    v89 = v20;
    v90 = a3;
    v30 = v98;
    _FileCacheLock(v98);
    v31 = 8 * v10;
    v94 = 8 * v10;
    v91 = v9;
    v87 = v22;
    if (v9 < 1)
    {
      v34 = 1;
LABEL_31:
      _FileCacheUnlock(v30);
      v44 = v90;
      v45 = v91;
      v46 = v89;
    }
    else
    {
      v86 = a2;
      v95 = v22 - 8;
      v32 = v9;
      v33 = &sFileProviderGlobals[7 * v9 - 4];
      v34 = 1;
      v92 = 8 * v10 * (v9 - 1);
      v35 = v92;
      while (1)
      {
        v36 = *(_QWORD *)&v95[8 * v32];
        if (v36 >= 1)
        {
          v37 = (char *)v97 + v35;
          v38 = (char *)v96 + v35;
          v39 = *v33;
          v40 = (uint64_t (*)(const __CFURL *, uint64_t, char *, char *, char *, uint64_t, uint64_t))v33[1];
          _FileCacheIncrementInProvider(v98);
          v41 = v40(v93, v98, v37, (char *)v15 + v35, v38, v36, v39);
          v30 = v98;
          v34 = v41;
          _FileCacheDecrementInProvider(v98);
          v31 = v94;
          if (!v34)
            break;
        }
        v35 -= v31;
        v33 -= 7;
        v42 = v32-- <= 1;
        if (v42)
          goto LABEL_31;
      }
      v43 = _FileCacheLockTransitionToPreparer(v30);
      v44 = v90;
      v45 = v91;
      v46 = v89;
      if (!v43)
      {
        _FileCacheLock(v98);
        v42 = v45 < 1;
        v47 = v94;
        v48 = v92;
        if (!v42)
        {
          v34 = 0;
          v49 = v91;
          v50 = &sFileProviderGlobals[7 * v91 - 4];
          v51 = v98;
          while (1)
          {
            v52 = *(_QWORD *)&v95[8 * v49];
            if (v52 >= 1)
            {
              v53 = (char *)v97 + v48;
              v54 = (char *)v15 + v48;
              v55 = (char *)v96 + v48;
              v92 = v48;
              v57 = *v50;
              v56 = (uint64_t (*)(const __CFURL *, uint64_t, char *, char *, char *, uint64_t, uint64_t))v50[1];
              _FileCacheIncrementInProvider(v51);
              v58 = v56(v93, v51, v53, v54, v55, v52, v57);
              v48 = v92;
              v34 = v58;
              _FileCacheDecrementInProvider(v51);
              v47 = v94;
              if (!v34)
                break;
            }
            v48 -= v47;
            v50 -= 7;
            v42 = v49-- <= 1;
            if (v42)
            {
              _FileCacheUnlock(v98);
              v44 = v90;
              v45 = v91;
              v46 = v89;
              if (v34)
                goto LABEL_44;
              goto LABEL_33;
            }
          }
        }
        _FileCacheUnlock(v98);
        v44 = v90;
        v45 = v91;
        v46 = v89;
      }
LABEL_33:
      memset(v99, 0, 60);
      v59 = _ZZZ30_FSURLGetResourcePropertyFlagsEUb0_E8theTable;
      v60 = (uint64_t *)(_FSURLGetResourcePropertyFlags::maskToPropertyTable + 24);
      v61 = (uint64_t *)v87;
      v62 = v86;
      do
      {
        if ((v59 & v62) != 0)
          addPropertyAndDependenciesToBitmap(*(v60 - 1), (uint64_t)v99);
        v63 = *v60;
        v60 += 3;
        v59 = v63;
      }
      while (v63);
      v64 = v98;
      v34 = prepareValuesForBitmap((uint64_t)v93, v98, (uint64_t)v99, (uint64_t)v88);
      if (v34)
      {
        _FileCacheLock(v64);
        if (v45 >= 1)
        {
          v65 = 0;
          v66 = v61;
          v67 = &qword_1ECD2A550;
          v68 = v94;
          v69 = v98;
          do
          {
            v71 = *v66++;
            v70 = v71;
            if (v71 >= 1)
            {
              v95 = (char *)*v67;
              v72 = (char *)v97 + v65;
              v73 = (char *)v96 + v65;
              v92 = *(v67 - 1);
              _FileCacheIncrementInProvider(v69);
              v34 = ((uint64_t (*)(const __CFURL *, uint64_t, char *, char *, char *, uint64_t, uint64_t))v95)(v93, v69, v72, (char *)v15 + v65, v73, v70, v92);
              _FileCacheDecrementInProvider(v69);
              v68 = v94;
            }
            v65 += v68;
            v67 += 7;
            --v45;
          }
          while (v45);
        }
        _FileCacheUnlock(v98);
        v44 = v90;
        v45 = v91;
        v46 = v89;
      }
LABEL_44:
      v74 = v98;
      _FileCacheLockTransitionFromPreparer(v98);
      _FileCacheUnlock(v74);
      if (!v34)
        goto LABEL_53;
    }
    *v44 = 0;
    if (v45 < 1)
      return v34;
    v75 = 0;
    v76 = 0;
    v77 = *MEMORY[0x1E0C9AE50];
    v78 = v87;
    v79 = v94;
    do
    {
      v80 = *(_QWORD *)&v78[8 * v76];
      if (v80 >= 1)
      {
        v81 = v15;
        v82 = v46;
        do
        {
          if (*v81 == v77)
          {
            v75 |= *v82;
            *v44 = v75;
          }
          ++v82;
          ++v81;
          --v80;
        }
        while (v80);
      }
      ++v76;
      v46 = (uint64_t *)((char *)v46 + v79);
      v15 = (uint64_t *)((char *)v15 + v79);
    }
    while (v76 != v45);
  }
  else
  {
    v34 = 0;
  }
LABEL_53:
  v83 = v88;
  if (v88 && !v34)
  {
    if (*v88)
    {
      LOBYTE(v34) = 0;
    }
    else
    {
      if (os_log_type_enabled((os_log_t)defaultLog, OS_LOG_TYPE_ERROR))
        _FSURLGetResourcePropertyFlags_cold_1();
      LOBYTE(v34) = 0;
      *v83 = CFErrorCreate((CFAllocatorRef)*MEMORY[0x1E0C9AE00], (CFErrorDomain)*MEMORY[0x1E0C9AFB8], 256, 0);
    }
  }
  return v34;
}

void _FSURLSetCacheAutoFlushingEnabled(const __CFURL *a1, const void *a2, int a3)
{
  CFTypeRef v4;

  v4 = _FileCacheGetForURL(a1, a2);
  _FileCacheLock((uint64_t)v4);
  _FileCacheSetAutoFlushingEnabled((uint64_t)v4, a3);
  _FileCacheUnlock((uint64_t)v4);
}

BOOL _FSURLGetCacheAutoFlushingEnabled(const __CFURL *a1, const void *a2)
{
  CFTypeRef v2;
  _BOOL8 AutoFlushingEnabled;

  v2 = _FileCacheGetForURL(a1, a2);
  _FileCacheLock((uint64_t)v2);
  AutoFlushingEnabled = _FileCacheGetAutoFlushingEnabled((uint64_t)v2);
  _FileCacheUnlock((uint64_t)v2);
  return AutoFlushingEnabled;
}

uint64_t _FSURLCreateFileReferenceURLFromFSRef()
{
  return 0;
}

uint64_t _FSURLGetFSRef()
{
  return 0;
}

uint64_t _FSURLGetObjectInformationNoIO(const __CFURL *a1, unint64_t *a2, uint64_t *a3, _DWORD *a4)
{
  const void *v8;
  CFTypeRef v9;
  uint64_t Attributes;
  uint64_t v11;
  unsigned int v12;
  unint64_t v13;
  CFStringRef v14;
  const __CFString *v15;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  char *v20;
  uint64_t v22;
  __int16 v23;
  char v24;
  char *__endptr[2];

  __endptr[1] = *(char **)MEMORY[0x1E0C80C00];
  if (!a1)
    return 0;
  v8 = (const void *)__CFURLResourceInfoPtr();
  if (!v8)
  {
    v11 = 0;
    if (a4)
      return v11;
LABEL_18:
    if ((_DWORD)v11)
      return v11;
    if (CFURLIsFileReferenceURL(a1))
    {
      v14 = CFURLCopyPath(a1);
      if (v14)
      {
        v15 = v14;
        MEMORY[0x1E0C80A78](v14);
        bzero(&v22, 0x800uLL);
        if (!CFStringGetCString(v15, (char *)&v22, 2048, 0x8000100u))
          goto LABEL_31;
        if (v22 != 0x692F656C69662E2FLL || v23 != 15716)
          goto LABEL_31;
        __endptr[0] = 0;
        v17 = strtoll(&v24, __endptr, 10);
        if (*__endptr[0] != 46)
          goto LABEL_31;
        v18 = v17;
        v19 = strtoll(__endptr[0] + 1, __endptr, 10);
        v20 = __endptr[0];
        if (*__endptr[0] == 47)
          v20 = __endptr[0] + 1;
        if (!*v20)
        {
          if (a2)
            *a2 = v18;
          if (a3)
            *a3 = v19;
          v11 = 1;
        }
        else
        {
LABEL_31:
          v11 = 0;
        }
        CFRelease(v15);
        return v11;
      }
    }
    return 0;
  }
  v9 = _FileCacheGetForURL(a1, v8);
  _FileCacheLock((uint64_t)v9);
  Attributes = _FileCacheGetAttributes((uint64_t)v9);
  if ((*(_BYTE *)Attributes & 4) != 0)
  {
    if (a2)
    {
      v12 = *(_DWORD *)(Attributes + 112);
      if (v12)
      {
        v13 = 0;
      }
      else
      {
        v12 = *(_DWORD *)(Attributes + 104);
        v13 = (unint64_t)*(unsigned int *)(Attributes + 108) << 32;
      }
      *a2 = v13 | v12;
    }
    if (a3)
      *a3 = *(_QWORD *)(Attributes + 120);
    if (a4)
      *a4 = *(_DWORD *)(Attributes + 16);
    v11 = 1;
  }
  else
  {
    v11 = 0;
  }
  _FileCacheUnlock((uint64_t)v9);
  if (!a4)
    goto LABEL_18;
  return v11;
}

uint64_t _FSURLGetCatalogInfo(const __CFURL *a1, int a2, uint64_t a3, unsigned __int16 *a4)
{
  _BYTE *v8;
  _WORD *v9;
  unsigned int v10;
  _BYTE *v11;
  const void *v12;
  CFTypeRef v13;
  _DWORD *Attributes;
  _DWORD *v15;
  int v16;
  int v17;
  int *v18;
  int v19;
  _DWORD *v20;
  int v21;
  int v22;
  __int16 v23;
  _BYTE *v24;
  _BYTE *v25;
  uint64_t v26;
  __CFError *v27;
  CFErrorDomain Domain;
  CFIndex Code;
  _BYTE *v30;
  _BYTE *v31;
  int v32;
  _BYTE *v33;
  double v34;
  int *v35;
  uint64_t v36;
  _BYTE *v37;
  double v38;
  _BYTE *v39;
  int *v40;
  double v41;
  _BYTE *v42;
  int *v43;
  double v44;
  _BYTE *v45;
  int *v46;
  _BYTE *v47;
  CFFileSecurityRef Copy;
  const __CFAllocator *v49;
  _BYTE *v50;
  _OWORD *v51;
  _OWORD *v52;
  _QWORD *v53;
  _QWORD *v54;
  _BYTE *v55;
  _QWORD *v56;
  _BYTE *v57;
  _BYTE *v58;
  int v59;
  int v60;
  _BYTE *v61;
  _BYTE *v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t VolumeName;
  const char *v66;
  const __CFAllocator *v67;
  const __CFString *v68;
  uint64_t Length;
  uint64_t v70;
  _WORD *v71;
  uint64_t v73;
  __CFError *v74;
  _BYTE v75[60];
  _BYTE v76[16];
  int v77;
  int v78;
  int v79;
  int v80;
  _BYTE v81[16];
  _QWORD v82[9];
  CFRange v83;

  v82[7] = *MEMORY[0x1E0C80C00];
  if (!a1 || (a2 & 0xBFFFFFFF) != 0 && !a3)
    return 4294967246;
  v8 = v76;
  if (a3)
    v9 = (_WORD *)a3;
  else
    v9 = v76;
  if (a4)
    v10 = a2 & 0x3FFFFFFF | 0x80000000;
  else
    v10 = a2 & 0x3FFFFFFF;
  if ((v10 & 1) != 0)
  {
    v10 &= 0xBFFFFFFE;
    if (a3)
      v8 = (_BYTE *)a3;
    *((_DWORD *)v8 + 36) = 0;
    if ((v10 & 0x2000) == 0)
    {
LABEL_12:
      if ((v10 & 0x200) == 0)
        goto LABEL_13;
      goto LABEL_58;
    }
  }
  else if ((v10 & 0x2000) == 0)
  {
    goto LABEL_12;
  }
  v10 &= ~0x2000u;
  v24 = v76;
  if (a3)
    v24 = (_BYTE *)a3;
  *((_DWORD *)v24 + 35) = 0;
  if ((v10 & 0x200) == 0)
  {
LABEL_13:
    if ((v10 & 0x10000) == 0)
      goto LABEL_17;
    goto LABEL_14;
  }
LABEL_58:
  v10 &= ~0x200u;
  v25 = v76;
  if (a3)
    v25 = (_BYTE *)a3;
  *((_QWORD *)v25 + 6) = 0;
  if ((v10 & 0x10000) != 0)
  {
LABEL_14:
    v10 &= ~0x10000u;
    v11 = v76;
    if (a3)
      v11 = (_BYTE *)a3;
    v11[12] = 0;
  }
LABEL_17:
  if ((v10 & 0xFFFDFFFF) != 0)
  {
    v12 = (const void *)__CFURLResourceInfoPtr();
    v13 = _FileCacheGetForURL(a1, v12);
    _FileCacheLock((uint64_t)v13);
    Attributes = (_DWORD *)_FileCacheGetAttributes((uint64_t)v13);
    v15 = Attributes;
    v16 = *Attributes;
    if ((*Attributes & 1) != 0
      && ((v10 & 0x18) == 0 || (v16 & 4) != 0)
      && ((v10 & 0x80000) == 0 || (v16 & 8) != 0)
      && ((v10 & 0x41800) == 0 || (v16 & 0x10) != 0)
      && ((v10 & 0x8000) == 0 || (v16 & 0x20) != 0 || (Attributes[4] & 0xF000) == 0x4000)
      && ((v10 & 0x400000) == 0 || (v16 & 0x80) != 0))
    {
      goto LABEL_40;
    }
    _FileCacheLockTransitionToPreparer((uint64_t)v13);
    if ((a2 & 0x40000000) != 0)
    {
      v26 = 4294956641;
      goto LABEL_202;
    }
    if (_FSURLGetCatalogInfo::sOnce != -1)
      dispatch_once(&_FSURLGetCatalogInfo::sOnce, &__block_literal_global_8);
    v17 = _ZZZ20_FSURLGetCatalogInfoEUb1_E8theTable;
    v18 = (int *)(_FSURLGetCatalogInfo::maskToPropertyTable + 24);
    do
    {
      v19 = *v18;
      v18 += 6;
    }
    while (v19);
    memset(v75, 0, sizeof(v75));
    v20 = (_DWORD *)(_FSURLGetCatalogInfo::maskToPropertyTable + 24);
    do
    {
      if ((v17 & v10 & 0xFFFDFFFF) != 0)
        addPropertyAndDependenciesToBitmap(*((_QWORD *)v20 - 1), (uint64_t)v75);
      v21 = *v20;
      v20 += 6;
      v17 = v21;
    }
    while (v21);
    v74 = 0;
    v22 = prepareValuesForBitmap((uint64_t)a1, (uint64_t)v13, (uint64_t)v75, (uint64_t)&v74);
    _FileCacheLockTransitionFromPreparer((uint64_t)v13);
    if (v22)
    {
LABEL_40:
      if ((v10 & 2) != 0)
      {
        v23 = (v15[5] & 0x20002) != 0;
        *v9 = v23;
        if ((v15[4] & 0xF000) == 0x4000)
        {
          v23 |= 0x10u;
          *v9 = v23;
        }
        if (v15[6] >= 2u)
        {
          v23 |= 0x100u;
          *v9 = v23;
        }
        if ((*((_BYTE *)v15 + 1) & 0x40) != 0)
          *v9 = v23 | 0x100;
      }
      if ((v10 & 4) != 0)
      {
        v30 = v76;
        if (a3)
          v30 = (_BYTE *)a3;
        *((_WORD *)v30 + 1) = -100;
        if ((v10 & 0x10) == 0)
        {
LABEL_49:
          if ((v10 & 8) == 0)
            goto LABEL_50;
          goto LABEL_72;
        }
      }
      else if ((v10 & 0x10) == 0)
      {
        goto LABEL_49;
      }
      v31 = v76;
      if (a3)
        v31 = (_BYTE *)a3;
      *((_DWORD *)v31 + 2) = *((_QWORD *)v15 + 16);
      if ((v10 & 8) == 0)
      {
LABEL_50:
        if ((v10 & 0x20) == 0)
          goto LABEL_84;
LABEL_78:
        v34 = *((double *)v15 + 10);
        if (v34 == -1.0 - *MEMORY[0x1E0C9ADE8] || v34 == -*MEMORY[0x1E0C9ADF8])
        {
          v37 = v76;
          if (a3)
            v37 = (_BYTE *)a3;
          *((_QWORD *)v37 + 2) = 0;
          if ((v10 & 0x40) == 0)
            goto LABEL_94;
          goto LABEL_89;
        }
        if (a3)
          v35 = (int *)(a3 + 16);
        else
          v35 = &v77;
        v36 = ConvertCFAbsoluteTimeToUTCDateTime((uint64_t)v35, v34);
        if ((_DWORD)v36)
          goto LABEL_109;
LABEL_84:
        if ((v10 & 0x40) == 0)
          goto LABEL_94;
LABEL_89:
        v38 = *((double *)v15 + 8);
        v39 = v76;
        if (a3)
        {
          v39 = (_BYTE *)a3;
          v40 = (int *)(a3 + 24);
        }
        else
        {
          v40 = &v78;
        }
        if (v38 == -*MEMORY[0x1E0C9ADF8])
        {
          *((_QWORD *)v39 + 3) = 0;
          if ((v10 & 0x80) == 0)
            goto LABEL_103;
          goto LABEL_95;
        }
        v36 = ConvertCFAbsoluteTimeToUTCDateTime((uint64_t)v40, v38);
        if ((_DWORD)v36)
        {
LABEL_109:
          v26 = v36;
          goto LABEL_202;
        }
LABEL_94:
        if ((v10 & 0x80) == 0)
          goto LABEL_103;
LABEL_95:
        v41 = *((double *)v15 + 9);
        v42 = v76;
        if (a3)
        {
          v42 = (_BYTE *)a3;
          v43 = (int *)(a3 + 32);
        }
        else
        {
          v43 = &v79;
        }
        if (v41 == -*MEMORY[0x1E0C9ADF8])
        {
          *((_QWORD *)v42 + 4) = 0;
          if ((v10 & 0x100) == 0)
            goto LABEL_113;
          goto LABEL_104;
        }
        v36 = ConvertCFAbsoluteTimeToUTCDateTime((uint64_t)v43, v41);
        if ((_DWORD)v36)
          goto LABEL_109;
LABEL_103:
        if ((v10 & 0x100) == 0)
          goto LABEL_113;
LABEL_104:
        v44 = *((double *)v15 + 7);
        v45 = v76;
        if (a3)
        {
          v45 = (_BYTE *)a3;
          v46 = (int *)(a3 + 40);
        }
        else
        {
          v46 = &v80;
        }
        if (v44 == -*MEMORY[0x1E0C9ADF8])
        {
          *((_QWORD *)v45 + 5) = 0;
        }
        else
        {
          v36 = ConvertCFAbsoluteTimeToUTCDateTime((uint64_t)v46, v44);
          if ((_DWORD)v36)
            goto LABEL_109;
        }
LABEL_113:
        if ((v10 & 0x400) != 0)
        {
          v47 = v76;
          if (a3)
            v47 = (_BYTE *)a3;
          *((_DWORD *)v47 + 14) = v15[10];
          *((_DWORD *)v47 + 15) = v15[11];
          *((_WORD *)v47 + 33) = v15[4];
        }
        if ((v10 & 0x400000) != 0)
        {
          if ((*(_BYTE *)v15 & 0x80) != 0)
          {
            v49 = CFGetAllocator(a1);
            Copy = CFFileSecurityCreateCopy(v49, *((CFFileSecurityRef *)v15 + 28));
          }
          else
          {
            Copy = 0;
          }
          v50 = v76;
          if (a3)
            v50 = (_BYTE *)a3;
          *(_QWORD *)(v50 + 68) = Copy;
        }
        if ((v10 & 0x41800) != 0)
        {
          if ((*v15 & 0x4000010) == 0x10)
          {
            v51 = v81;
            if (a3)
              v51 = (_OWORD *)(a3 + 76);
            *v51 = *((_OWORD *)v15 + 10);
            v52 = v82;
            if (a3)
              v52 = (_OWORD *)(a3 + 92);
            *v52 = *((_OWORD *)v15 + 11);
          }
          else
          {
            v53 = v81;
            if (a3)
              v53 = (_QWORD *)(a3 + 76);
            *v53 = 0;
            v53[1] = 0;
            v54 = v82;
            if (a3)
              v54 = (_QWORD *)(a3 + 92);
            *v54 = 0;
            v54[1] = 0;
          }
          if ((v15[4] & 0xF000) == 0xA000)
          {
            if (a3)
              v55 = (_BYTE *)a3;
            else
              v55 = v76;
            *(_QWORD *)(v55 + 76) = 0x72686170736C6E6BLL;
            *((_WORD *)v55 + 42) = *((_WORD *)v55 + 42) & 0x4000 | 0x8000;
            v56 = v82;
            if (a3)
              v56 = (_QWORD *)(a3 + 92);
            *v56 = 0;
            v56[1] = 0;
          }
        }
        if ((v15[4] & 0xF000) == 0x4000)
        {
          v57 = v76;
          if (a3)
            v57 = (_BYTE *)a3;
          *(_QWORD *)(v57 + 132) = 0;
          *(_QWORD *)(v57 + 124) = 0;
          *(_QWORD *)(v57 + 116) = 0;
          *(_QWORD *)(v57 + 108) = 0;
          if ((v10 & 0x80000) == 0)
            goto LABEL_163;
          goto LABEL_151;
        }
        if ((v10 & 0x4000) != 0)
        {
          v61 = v76;
          if (a3)
            v61 = (_BYTE *)a3;
          *(_QWORD *)(v61 + 108) = *((_QWORD *)v15 + 26);
          *(_QWORD *)(v61 + 116) = *((_QWORD *)v15 + 27);
          if ((v10 & 0x8000) == 0)
          {
LABEL_150:
            if ((v10 & 0x80000) == 0)
              goto LABEL_163;
            goto LABEL_151;
          }
        }
        else if ((v10 & 0x8000) == 0)
        {
          goto LABEL_150;
        }
        v62 = v76;
        if (a3)
          v62 = (_BYTE *)a3;
        *(_QWORD *)(v62 + 124) = *((_QWORD *)v15 + 24);
        *(_QWORD *)(v62 + 132) = *((_QWORD *)v15 + 25);
        if ((v10 & 0x80000) == 0)
        {
LABEL_163:
          v26 = 0;
          if (a4 && (v10 & 0x80000000) != 0)
          {
            if ((*((_BYTE *)v15 + 1) & 0x20) != 0)
            {
              *(_QWORD *)v75 = 0;
              v63 = MountInfoStorageSize();
              v64 = MEMORY[0x1E0C80A78](v63);
              if (MountInfoPrepare(v75, v15[28], 0, (char *)&v73 - ((v64 + 15) & 0xFFFFFFFFFFFFFFF0), 0, 0, 0))
              {
                VolumeName = MountInfoGetVolumeName(*(uint64_t *)v75);
                if (VolumeName)
                {
                  v66 = (const char *)VolumeName;
                  v67 = CFGetAllocator(a1);
                  v68 = CFStringCreateWithCString(v67, v66, 0x8000100u);
                }
                else
                {
                  v68 = 0;
                }
                MountInfoDestroy(*(_QWORD *)v75);
                if (v68)
                  goto LABEL_175;
              }
            }
            v68 = (const __CFString *)*((_QWORD *)v15 + 1);
            if (v68)
            {
LABEL_175:
              Length = CFStringGetLength(v68);
              if (Length < 256)
              {
                v83.length = Length;
                *a4 = Length;
                v83.location = 0;
                CFStringGetCharacters(v68, v83, a4 + 1);
                if (v68 != *((const __CFString **)v15 + 1))
                  CFRelease(v68);
                v70 = *a4;
                if (*a4)
                {
                  v71 = a4 + 1;
                  do
                  {
                    if (*v71 == 58)
                      *v71 = 47;
                    ++v71;
                    --v70;
                  }
                  while (v70);
                }
                v26 = 0;
                goto LABEL_202;
              }
              if (v68 != *((const __CFString **)v15 + 1))
                CFRelease(v68);
            }
            v26 = 4294967259;
          }
LABEL_202:
          _FileCacheUnlock((uint64_t)v13);
          return v26;
        }
LABEL_151:
        v58 = v76;
        if (a3)
          v58 = (_BYTE *)a3;
        v58[65] = 0;
        v59 = (*v15 >> 23) & 1;
        v58[65] = (*v15 & 0x800000) != 0;
        v60 = *v15;
        if ((*v15 & 0x1000000) != 0)
        {
          LOBYTE(v59) = v59 | 2;
          v58[65] = v59;
          v60 = *v15;
        }
        if ((v60 & 0x2000000) != 0)
          v58[65] = v59 | 4;
        goto LABEL_163;
      }
LABEL_72:
      if (*((_QWORD *)v15 + 16) == 2)
        v32 = 1;
      else
        v32 = v15[34];
      v33 = v76;
      if (a3)
        v33 = (_BYTE *)a3;
      *((_DWORD *)v33 + 1) = v32;
      if ((v10 & 0x20) == 0)
        goto LABEL_84;
      goto LABEL_78;
    }
    v27 = v74;
    if (!v74)
    {
      v26 = 4294967260;
      goto LABEL_202;
    }
    Domain = CFErrorGetDomain(v74);
    Code = CFErrorGetCode(v27);
    if (CFEqual(Domain, (CFTypeRef)*MEMORY[0x1E0C9AFC8]))
    {
      v26 = Code;
    }
    else if (CFEqual(Domain, (CFTypeRef)*MEMORY[0x1E0C9AFD0]))
    {
      v26 = PosixToOSStatusTranslate(Code);
    }
    else
    {
      if (CFEqual(Domain, (CFTypeRef)*MEMORY[0x1E0C9AFB8]))
      {
        if (Code <= 512)
        {
          v26 = 4294967253;
          switch(Code)
          {
            case 257:
              goto LABEL_197;
            case 258:
              goto LABEL_193;
            case 259:
            case 261:
            case 262:
              goto LABEL_189;
            case 260:
              goto LABEL_201;
            case 263:
              v26 = 4294965987;
              break;
            default:
              if (Code != 4)
                goto LABEL_189;
              break;
          }
          goto LABEL_201;
        }
        if (Code > 639)
        {
          if (Code == 640)
          {
            v26 = 4294967262;
            goto LABEL_201;
          }
          if (Code == 642)
          {
            v26 = 4294967235;
            goto LABEL_201;
          }
        }
        else
        {
          if (Code == 513)
          {
LABEL_197:
            v26 = 4294962296;
            goto LABEL_201;
          }
          if (Code == 514)
          {
LABEL_193:
            v26 = 4294967259;
            goto LABEL_201;
          }
        }
      }
      else
      {
        CFEqual(Domain, (CFTypeRef)*MEMORY[0x1E0C9AFC0]);
      }
LABEL_189:
      v26 = 4294967260;
    }
LABEL_201:
    CFRelease(v74);
    goto LABEL_202;
  }
  return 0;
}

CFURLRef _FSCreateFileReferenceURLFromIDs(const __CFAllocator *a1, int a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  CFURLRef FileReferenceURLRef;
  unsigned int MountID;
  uint64_t v11[2];

  v11[1] = *MEMORY[0x1E0C80C00];
  v11[0] = 0;
  v6 = MountInfoStorageSize();
  v7 = MEMORY[0x1E0C80A78](v6);
  if (!MountInfoPrepare(v11, 0, a2, (char *)v11 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0), 0, 0, 0))
    return 0;
  if ((MountInfoGetCapabilities(v11[0]) & 0x8000000000000) != 0)
  {
    MountID = MountInfoGetMountID(v11[0]);
    FileReferenceURLRef = createFileReferenceURLRef(a1, MountID, 0, a3, 0, 0);
  }
  else
  {
    FileReferenceURLRef = 0;
  }
  MountInfoDestroy(v11[0]);
  return FileReferenceURLRef;
}

CFURLRef _CFURLCreateWithVolumeURLAndResourceID(const __CFAllocator *a1, CFURLRef url, const __CFNumber *a3)
{
  CFURLRef v3;
  const __CFString *v8;
  const __CFString *v9;
  stat v10;
  unint64_t v11;
  uint64_t valuePtr;
  CFNumberRef propertyValueTypeRefPtr;
  char cStr[1024];
  uint64_t v15;

  v3 = 0;
  v15 = *MEMORY[0x1E0C80C00];
  if (url && a3)
  {
    propertyValueTypeRefPtr = 0;
    v3 = 0;
    if (CFURLCopyResourcePropertyForKey(url, (CFStringRef)*MEMORY[0x1E0C9AD78], &propertyValueTypeRefPtr, 0)
      && propertyValueTypeRefPtr != 0)
    {
      valuePtr = 0;
      v3 = 0;
      if (CFNumberGetValue(propertyValueTypeRefPtr, kCFNumberSInt64Type, &valuePtr))
      {
        if (valuePtr)
        {
          v11 = 0;
          v3 = 0;
          if (CFNumberGetValue(a3, kCFNumberSInt64Type, &v11))
          {
            if (v11)
            {
              if (getFileSystemPathForFileID(valuePtr, v11, cStr, (char *)0x400)
                && !lstat(cStr, &v10)
                && (v8 = CFStringCreateWithCString(a1, cStr, 0x8000100u)) != 0)
              {
                v9 = v8;
                v3 = CFURLCreateWithFileSystemPath(a1, v8, kCFURLPOSIXPathStyle, (v10.st_mode & 0xF000) == 0x4000);
                CFRelease(v9);
              }
              else
              {
                v3 = 0;
              }
            }
          }
        }
      }
      CFRelease(propertyValueTypeRefPtr);
    }
  }
  return v3;
}

CFURLRef _FSURLCreateWithPathAndAttributes(const __CFAllocator *a1, unsigned __int8 *a2, size_t a3, uint64_t a4, const __CFURL *a5, attrlist *a6, attrlist *a7, unsigned __int8 a8, char a9, char a10, char a11, int a12, void **a13, __CFError **a14)
{
  return __FSURLCreateWithPathAndAttributes(a1, a2, a3, a4, a5, a6, a7, (void *)1, a8, a9, a10, a12, a13, a14);
}

const attrlist *_FSURLCalculateAttributeBufferSize(const attrlist *result)
{
  if (result)
    return (const attrlist *)calculateAttributeBufferSize(result, 0);
  return result;
}

void _FSURLCacheCheapVolumeInformationForVolume(const __CFURL *a1, uint64_t a2)
{
  const void *v4;
  CFTypeRef v5;
  uint64_t Attributes;
  _DWORD *v7;

  v4 = (const void *)__CFURLResourceInfoPtr();
  v5 = _FileCacheGetForURL(a1, v4);
  _FileCacheLock((uint64_t)v5);
  Attributes = _FileCacheGetAttributes((uint64_t)v5);
  if ((*(_BYTE *)Attributes & 2) == 0)
  {
    v7 = (_DWORD *)Attributes;
    *(_QWORD *)(Attributes + 104) = MountInfoGetFSID(a2);
    v7[28] = MountInfoGetMountID(a2);
    *v7 |= 2u;
  }
  if (!_FileCacheGetVolumeInfo((uint64_t)v5))
  {
    _FileCacheLockTransitionToPreparer((uint64_t)v5);
    prepareCheapVolumeInformation(a1, (uint64_t)v5, a2);
    _FileCacheLockTransitionFromPreparer((uint64_t)v5);
  }
  _FileCacheUnlock((uint64_t)v5);
}

uint64_t _FSURLCacheResourcePropertyForKey(const __CFURL *a1, const void *a2, CFTypeRef cf, CFErrorRef *a4)
{
  CFTypeRef v7;
  const void *Value;
  uint64_t v9;
  _OWORD v11[4];

  v7 = _FileCacheGetForURL(a1, cf);
  _FileCacheLock((uint64_t)v7);
  Value = CFDictionaryGetValue((CFDictionaryRef)qword_1ECD2A668, a2);
  if (Value)
  {
    memset(v11, 0, 60);
    addPropertyAndDependenciesToBitmap((uint64_t)Value, (uint64_t)v11);
    _FileCacheLockTransitionToPreparer((uint64_t)v7);
    v9 = prepareValuesForBitmap((uint64_t)a1, (uint64_t)v7, (uint64_t)v11, (uint64_t)a4);
    _FileCacheLockTransitionFromPreparer((uint64_t)v7);
  }
  else
  {
    v9 = 1;
  }
  _FileCacheUnlock((uint64_t)v7);
  if (a4 && !(_DWORD)v9 && !*a4)
  {
    if (os_log_type_enabled((os_log_t)defaultLog, OS_LOG_TYPE_ERROR))
      _FSURLCacheResourcePropertyForKey_cold_1();
    *a4 = CFErrorCreate((CFAllocatorRef)*MEMORY[0x1E0C9AE00], (CFErrorDomain)*MEMORY[0x1E0C9AFB8], 256, 0);
  }
  return v9;
}

__CFArray *_FileURLCreateDisplayPathComponentsArray(const void *a1, __CFError **a2)
{
  const __CFAllocator *v4;
  CFTypeRef v5;
  __CFArray *Mutable;
  const __CFString *v7;
  const __CFString *v8;
  const __CFString *v9;
  unsigned __int8 v11;
  unsigned __int8 v12;
  const void *propertyValueTypeRefPtr;

  v4 = CFGetAllocator(a1);
  v5 = CFRetain(a1);
  Mutable = CFArrayCreateMutable(v4, 0, MEMORY[0x1E0C9B378]);
  if (Mutable)
  {
    v7 = (const __CFString *)*MEMORY[0x1E0C9B550];
    v8 = (const __CFString *)*MEMORY[0x1E0C9B6A8];
    v9 = (const __CFString *)*MEMORY[0x1E0C9B5A8];
    while (1)
    {
      propertyValueTypeRefPtr = 0;
      v12 = 0;
      CFArrayAppendValue(Mutable, v5);
      if (!GetBooleanPropertyValue((const __CFURL *)v5, v7, &v12, a2))
        break;
      if (v12)
      {
        v11 = 0;
        if (!GetBooleanPropertyValue((const __CFURL *)v5, v8, &v11, a2))
          break;
        if (!v11)
          goto LABEL_13;
      }
      if (!CFURLCopyResourcePropertyForKey((CFURLRef)v5, v9, &propertyValueTypeRefPtr, a2))
        break;
      if (!propertyValueTypeRefPtr)
        goto LABEL_13;
      CFRelease(v5);
      v5 = propertyValueTypeRefPtr;
    }
    if (v5)
      CFRelease(v5);
    CFRelease(Mutable);
    if (a2 && !*a2)
    {
      if (os_log_type_enabled((os_log_t)defaultLog, OS_LOG_TYPE_ERROR))
        _FileURLCreateDisplayPathComponentsArray_cold_2();
      goto LABEL_21;
    }
    return 0;
  }
  if (a2)
    *a2 = _FSURLCreateStandardError(v4, (const __CFString *)*MEMORY[0x1E0C9AFD0], 12, 0, 0, 0);
LABEL_13:
  if (v5)
    CFRelease(v5);
  if (a2 && !Mutable)
  {
    if (!*a2)
    {
      if (os_log_type_enabled((os_log_t)defaultLog, OS_LOG_TYPE_ERROR))
        _FileURLCreateDisplayPathComponentsArray_cold_1();
LABEL_21:
      Mutable = 0;
      *a2 = CFErrorCreate((CFAllocatorRef)*MEMORY[0x1E0C9AE00], (CFErrorDomain)*MEMORY[0x1E0C9AFB8], 256, 0);
      return Mutable;
    }
    return 0;
  }
  return Mutable;
}

uint64_t GetBooleanPropertyValue(const __CFURL *a1, const __CFString *a2, unsigned __int8 *a3, __CFError **a4)
{
  uint64_t result;
  const __CFBoolean *propertyValueTypeRefPtr;

  propertyValueTypeRefPtr = 0;
  result = CFURLCopyResourcePropertyForKey(a1, a2, &propertyValueTypeRefPtr, a4);
  if ((_DWORD)result)
  {
    if (propertyValueTypeRefPtr)
    {
      *a3 = valueOfBoolean(propertyValueTypeRefPtr);
      CFRelease(propertyValueTypeRefPtr);
    }
    else
    {
      *a3 = 0;
    }
    return 1;
  }
  return result;
}

CFDataRef _FSURLNoteSecurityScopedResourceMoved(SandboxExtensionCache *a1, const __CFURL *a2)
{
  os_unfair_lock_s *v4;
  CFDataRef result;
  const void *v6;

  v4 = (os_unfair_lock_s *)SandboxExtensionCache::shared(a1);
  result = SandboxExtensionCache::move(v4, a1, a2, 0, 0);
  if (result)
  {
    v6 = result;
    _FSURLSetPermanentResourcePropertyForKey(a2, CFSTR("_NSURLSecuritySandboxExtensionKey"), result);
    CFRelease(v6);
    return (CFDataRef)1;
  }
  return result;
}

CFDataRef _FSURLNoteSecurityScopedResourceMovedWithFileIdentifier(SandboxExtensionCache *a1, const __CFURL *a2, fsid a3, uint64_t a4)
{
  os_unfair_lock_s *v7;
  CFDataRef result;
  const void *v9;
  fsid v10;

  v10 = a3;
  v7 = (os_unfair_lock_s *)SandboxExtensionCache::shared(a1);
  result = SandboxExtensionCache::move(v7, a1, a2, &v10, a4);
  if (result)
  {
    v9 = result;
    _FSURLSetPermanentResourcePropertyForKey(a2, CFSTR("_NSURLSecuritySandboxExtensionKey"), result);
    CFRelease(v9);
    return (CFDataRef)1;
  }
  return result;
}

uint64_t createIsSystemAppendValue(uint64_t a1, uint64_t a2, _QWORD *a3)
{
  _QWORD *v3;

  v3 = (_QWORD *)MEMORY[0x1E0C9AE50];
  if ((*(_DWORD *)(a2 + 20) & 0x40000) == 0)
    v3 = (_QWORD *)MEMORY[0x1E0C9AE40];
  *a3 = *v3;
  return 1;
}

uint64_t createIsUserAppendValue(uint64_t a1, uint64_t a2, _QWORD *a3)
{
  _QWORD *v3;

  v3 = (_QWORD *)MEMORY[0x1E0C9AE50];
  if ((*(_DWORD *)(a2 + 20) & 4) == 0)
    v3 = (_QWORD *)MEMORY[0x1E0C9AE40];
  *a3 = *v3;
  return 1;
}

uint64_t createContentAccessDateValue(const void *a1, uint64_t a2, CFDateRef *a3)
{
  const __CFAllocator *v5;

  v5 = CFGetAllocator(a1);
  *a3 = CFDateCreate(v5, *(CFAbsoluteTime *)(a2 + 56));
  return 1;
}

uint64_t createPreferredIOBlockSizeValue(const void *a1, uint64_t a2, CFNumberRef *a3)
{
  const __CFAllocator *v5;
  CFNumberRef v6;
  uint64_t valuePtr;

  if (*(_DWORD *)(a2 + 96))
  {
    v5 = CFGetAllocator(a1);
    valuePtr = *(unsigned int *)(a2 + 96);
    v6 = CFNumberCreate(v5, kCFNumberSInt64Type, &valuePtr);
  }
  else
  {
    v6 = 0;
  }
  *a3 = v6;
  return 1;
}

uint64_t createFileContentIdentifierValue(uint64_t a1, _BYTE *a2, CFNumberRef *a3)
{
  CFNumberRef v5;

  if ((*a2 & 4) == 0)
    return 0;
  if (*((_QWORD *)a2 + 18))
    v5 = CFNumberCreate((CFAllocatorRef)*MEMORY[0x1E0C9AE00], kCFNumberSInt64Type, a2 + 144);
  else
    v5 = 0;
  *a3 = v5;
  return 1;
}

uint64_t createMayShareFileContentValue(uint64_t a1, uint64_t a2, _QWORD *a3)
{
  uint64_t v4;
  uint64_t *v5;

  if ((*(_DWORD *)a2 & 1) == 0)
    return 0;
  if ((*(_DWORD *)a2 & 0x200) != 0)
  {
    v5 = (uint64_t *)MEMORY[0x1E0C9AE50];
    if ((*(_BYTE *)(a2 + 152) & 1) == 0)
      v5 = (uint64_t *)MEMORY[0x1E0C9AE40];
    v4 = *v5;
  }
  else
  {
    v4 = 0;
  }
  *a3 = v4;
  return 1;
}

uint64_t createMayHaveExtendedAttributesValue(uint64_t a1, uint64_t a2, _QWORD *a3)
{
  uint64_t v4;
  uint64_t *v5;

  if ((*(_DWORD *)a2 & 1) == 0)
    return 0;
  if ((*(_DWORD *)a2 & 0x200) != 0)
  {
    v5 = (uint64_t *)MEMORY[0x1E0C9AE40];
    if ((*(_BYTE *)(a2 + 152) & 2) == 0)
      v5 = (uint64_t *)MEMORY[0x1E0C9AE50];
    v4 = *v5;
  }
  else
  {
    v4 = 0;
  }
  *a3 = v4;
  return 1;
}

uint64_t createIsPurgeableValue(uint64_t a1, uint64_t a2, _QWORD *a3)
{
  uint64_t v4;
  uint64_t *v5;

  if ((*(_DWORD *)a2 & 1) == 0)
    return 0;
  if ((*(_DWORD *)a2 & 0x200) != 0)
  {
    v5 = (uint64_t *)MEMORY[0x1E0C9AE50];
    if ((*(_BYTE *)(a2 + 152) & 8) == 0)
      v5 = (uint64_t *)MEMORY[0x1E0C9AE40];
    v4 = *v5;
  }
  else
  {
    v4 = 0;
  }
  *a3 = v4;
  return 1;
}

uint64_t createIsSparseValue(uint64_t a1, uint64_t a2, _QWORD *a3)
{
  uint64_t v4;
  uint64_t *v5;

  if ((*(_DWORD *)a2 & 1) == 0)
    return 0;
  if ((*(_DWORD *)a2 & 0x200) != 0)
  {
    v5 = (uint64_t *)MEMORY[0x1E0C9AE50];
    if ((*(_BYTE *)(a2 + 152) & 0x10) == 0)
      v5 = (uint64_t *)MEMORY[0x1E0C9AE40];
    v4 = *v5;
  }
  else
  {
    v4 = 0;
  }
  *a3 = v4;
  return 1;
}

uint64_t createFaultLogicalFileIsHiddenValue(uint64_t a1, uint64_t a2, _QWORD *a3)
{
  _QWORD *v4;

  if ((*(_DWORD *)a2 & 0x1000) != 0 || (*(_BYTE *)(a2 + 21) & 0x80) != 0)
  {
    v4 = (_QWORD *)MEMORY[0x1E0C9AE50];
  }
  else
  {
    if ((*(_DWORD *)a2 & 0x10) == 0)
      return 0;
    v4 = (_QWORD *)MEMORY[0x1E0C9AE50];
    if ((*(_WORD *)(a2 + 168) & 0x4000) == 0)
      v4 = (_QWORD *)MEMORY[0x1E0C9AE40];
  }
  *a3 = *v4;
  return 1;
}

uint64_t createNameExtensionValue(CFTypeRef cf, uint64_t a2, CFStringRef *a3)
{
  __int16 v6;
  const __CFAllocator *v7;
  const __CFString *v8;
  CFIndex Length;
  CFStringRef v10;
  uint64_t v12;
  __int16 v13;
  CFRange v14;

  if ((*(_BYTE *)(a2 + 3) & 8) == 0 && *(_QWORD *)(a2 + 8))
  {
    _CFGetPathExtensionRangesFromPathComponent();
    if (v12 == -1)
      v6 = 0;
    else
      v6 = v13;
    *(_WORD *)(a2 + 4) = v6;
    *(_DWORD *)a2 |= 0x8000000u;
  }
  if (*(_QWORD *)(a2 + 8) && *(_WORD *)(a2 + 4))
  {
    v7 = CFGetAllocator(cf);
    v8 = *(const __CFString **)(a2 + 8);
    Length = CFStringGetLength(v8);
    v14.length = *(unsigned __int16 *)(a2 + 4);
    v14.location = Length - v14.length;
    v10 = CFStringCreateWithSubstring(v7, v8, v14);
  }
  else
  {
    v10 = 0;
  }
  *a3 = v10;
  return 1;
}

uint64_t createIsUserNoDumpValue(uint64_t a1, uint64_t a2, _QWORD *a3)
{
  _QWORD *v3;

  v3 = (_QWORD *)MEMORY[0x1E0C9AE50];
  if ((*(_DWORD *)(a2 + 20) & 1) == 0)
    v3 = (_QWORD *)MEMORY[0x1E0C9AE40];
  *a3 = *v3;
  return 1;
}

uint64_t createIsUserOpaqueValue(uint64_t a1, uint64_t a2, _QWORD *a3)
{
  _QWORD *v3;

  v3 = (_QWORD *)MEMORY[0x1E0C9AE50];
  if ((*(_DWORD *)(a2 + 20) & 8) == 0)
    v3 = (_QWORD *)MEMORY[0x1E0C9AE40];
  *a3 = *v3;
  return 1;
}

uint64_t createIsUserTrackedValue(uint64_t a1, uint64_t a2, _QWORD *a3)
{
  _QWORD *v3;

  v3 = (_QWORD *)MEMORY[0x1E0C9AE50];
  if ((*(_DWORD *)(a2 + 20) & 0x40) == 0)
    v3 = (_QWORD *)MEMORY[0x1E0C9AE40];
  *a3 = *v3;
  return 1;
}

uint64_t createIsUserDataVaultValue(uint64_t a1, uint64_t a2, _QWORD *a3)
{
  _QWORD *v3;

  v3 = (_QWORD *)MEMORY[0x1E0C9AE50];
  if ((*(_DWORD *)(a2 + 20) & 0x80) == 0)
    v3 = (_QWORD *)MEMORY[0x1E0C9AE40];
  *a3 = *v3;
  return 1;
}

uint64_t createIsSystemArchivedValue(uint64_t a1, uint64_t a2, _QWORD *a3)
{
  _QWORD *v3;

  v3 = (_QWORD *)MEMORY[0x1E0C9AE50];
  if ((*(_DWORD *)(a2 + 20) & 0x10000) == 0)
    v3 = (_QWORD *)MEMORY[0x1E0C9AE40];
  *a3 = *v3;
  return 1;
}

uint64_t createOwnerIDValue(const void *a1, uint64_t a2, CFNumberRef *a3)
{
  const __CFAllocator *v5;

  v5 = CFGetAllocator(a1);
  *a3 = CFNumberCreate(v5, kCFNumberSInt32Type, (const void *)(a2 + 40));
  return 1;
}

uint64_t createGroupIDValue(const void *a1, uint64_t a2, CFNumberRef *a3)
{
  const __CFAllocator *v5;

  v5 = CFGetAllocator(a1);
  *a3 = CFNumberCreate(v5, kCFNumberSInt32Type, (const void *)(a2 + 44));
  return 1;
}

uint64_t createStatModeValue(const void *a1, uint64_t a2, CFNumberRef *a3)
{
  const __CFAllocator *v5;

  v5 = CFGetAllocator(a1);
  *a3 = CFNumberCreate(v5, kCFNumberSInt32Type, (const void *)(a2 + 16));
  return 1;
}

uint64_t createGenerationCountValue(const void *a1, uint64_t a2, CFNumberRef *a3)
{
  const void *v4;
  const __CFAllocator *v5;
  CFNumberRef v6;

  v4 = (const void *)(a2 + 32);
  if (*(_DWORD *)(a2 + 32))
  {
    v5 = CFGetAllocator(a1);
    v6 = CFNumberCreate(v5, kCFNumberSInt32Type, v4);
  }
  else
  {
    v6 = 0;
  }
  *a3 = v6;
  return 1;
}

uint64_t createVolumeParentURL(const __CFAllocator *a1, unsigned __int8 a2, fsid *a3, size_t *a4)
{
  uint64_t v8;
  uint64_t v9;
  char *MountPoint;
  fsid v11;
  size_t v12;
  size_t v13;
  int v14;
  int v15;
  uint64_t v16;
  size_t v17;
  uint64_t v19;
  void **v20;
  statfs v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v20 = 0;
  v8 = MountInfoStorageSize();
  v9 = MEMORY[0x1E0C80A78](v8);
  if (MountInfoPrepare(&v20, a3[14].val[0], 0, (char *)&v19 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0), 0, 0, 0))
  {
    MountPoint = (char *)MountInfoGetMountPoint((uint64_t)v20);
    if (!MountPoint)
      goto LABEL_12;
  }
  else
  {
    v11 = a3[13];
    if (GetStatfsByFSID(v11, &v21))
      goto LABEL_12;
    MountPoint = v21.f_mntonname;
  }
  v12 = strlen(MountPoint);
  do
  {
    if (!v12)
    {
LABEL_16:
      *a4 = v12;
      v16 = 1;
      goto LABEL_17;
    }
    v13 = v12 - 1;
    v14 = MountPoint[--v12];
  }
  while (v14 == 47);
  while (v13 != -1)
  {
    v15 = MountPoint[v13--];
    if (v15 == 47)
    {
      v17 = v13 + 2;
      if (v20)
        v12 = (size_t)__FSURLCreateWithPathAndAttributes(a1, (unsigned __int8 *)MountPoint, v17, 0, 0, 0, 0, (void *)1, a2, 0, 0, 1, v20, 0);
      else
        v12 = (size_t)CFURLCreateFromFileSystemRepresentation(a1, (const UInt8 *)MountPoint, v17, 1u);
      goto LABEL_16;
    }
  }
LABEL_12:
  v16 = 0;
LABEL_17:
  if (v20)
    MountInfoDestroy(v20);
  return v16;
}

uint64_t createNegatedVolumeFlagValue(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, _QWORD *a7)
{
  _QWORD *v7;

  if ((*(_QWORD *)(a5 + 16) & *(_QWORD *)(a3 + 32)) != 0)
    v7 = (_QWORD *)MEMORY[0x1E0C9AE40];
  else
    v7 = (_QWORD *)MEMORY[0x1E0C9AE50];
  *a7 = *v7;
  return 1;
}

uint64_t createVolumeMaximumFileSizeValue(const void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, int a6, CFNumberRef *a7)
{
  const void *v8;
  const __CFAllocator *v9;
  CFNumberRef v10;
  uint64_t result;

  v8 = (const void *)(a3 + 48);
  if ((*(_QWORD *)(a3 + 48) & 0x8000000000000000) != 0)
  {
    v10 = 0;
    result = 1;
    goto LABEL_5;
  }
  if (a6)
  {
    v9 = CFGetAllocator(a1);
    v10 = CFNumberCreate(v9, kCFNumberSInt64Type, v8);
    result = 2;
LABEL_5:
    *a7 = v10;
    return result;
  }
  return 0;
}

uint64_t createVolumeCreationDateValue(const void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, int a6, CFDateRef *a7)
{
  CFDateRef v8;
  uint64_t result;
  const __CFAllocator *v11;

  if (*(double *)(a3 + 40) == -1.0 - *MEMORY[0x1E0C9ADE8])
  {
    v8 = 0;
    result = 1;
LABEL_5:
    *a7 = v8;
    return result;
  }
  if (a6)
  {
    v11 = CFGetAllocator(a1);
    v8 = CFDateCreate(v11, *(CFAbsoluteTime *)(a3 + 40));
    result = 2;
    goto LABEL_5;
  }
  return 0;
}

uint64_t createVolumeTotalCapacityValue(const void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, int a6, CFNumberRef *a7)
{
  CFNumberRef v9;
  const __CFAllocator *v11;

  if (!a6)
    return 0;
  if ((*(_BYTE *)(a3 + 39) & 1) != 0)
  {
    v11 = CFGetAllocator(a1);
    v9 = CFNumberCreate(v11, kCFNumberSInt64Type, (const void *)(a3 + 16));
  }
  else
  {
    v9 = 0;
  }
  *a7 = v9;
  return 2;
}

uint64_t createVolumeResourceCountValue(const void *a1, uint64_t a2, _QWORD *a3, uint64_t a4, uint64_t a5, int a6, CFNumberRef *a7)
{
  const __CFAllocator *v8;
  uint64_t valuePtr;

  if (!a6)
    return 0;
  valuePtr = a3[1] + *a3;
  v8 = CFGetAllocator(a1);
  *a7 = CFNumberCreate(v8, kCFNumberSInt64Type, &valuePtr);
  return 2;
}

void OUTLINED_FUNCTION_0_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 2u);
}

uint64_t _URLEnumeratorGetTypeID()
{
  if (_URLEnumeratorGetTypeID::onceToken != -1)
    dispatch_once(&_URLEnumeratorGetTypeID::onceToken, &__block_literal_global_4);
  return _kCFURLEnumeratorTypeID;
}

_QWORD *_URLEnumeratorCreateForMountedVolumes(const __CFAllocator *a1, uint64_t a2, const __CFArray *a3)
{
  _QWORD *v6;
  _QWORD *v7;
  const __CFArray *MutableCopy;
  CFArrayRef *v9;
  uint64_t v10;
  CFIndex v11;
  const void *v12;
  CFIndex Count;
  const void *v14;
  CFIndex v15;
  const void *v16;
  CFRange v18;
  CFRange v19;
  CFRange v20;

  v6 = (_QWORD *)_URLEnumeratorCreate(a1);
  v7 = v6;
  if (v6)
  {
    v6[2] = a1;
    v6[4] = a2;
    if (a3)
    {
      MutableCopy = CFArrayCreateMutableCopy(a1, 0, a3);
      v7[5] = MutableCopy;
      v7[6] = 0;
      v9 = (CFArrayRef *)(v7 + 5);
      v10 = v7[4];
      if ((v10 & 6) != 0)
      {
        if (MutableCopy)
        {
          if ((v10 & 2) == 0)
          {
LABEL_12:
            if ((v7[4] & 4) != 0)
            {
              Count = CFArrayGetCount(*v9);
              v14 = (const void *)*MEMORY[0x1E0C9AD78];
              if (!Count
                || (v19.length = Count - 1,
                    v19.location = 0,
                    !CFArrayContainsValue(*v9, v19, (const void *)*MEMORY[0x1E0C9AD78])))
              {
                CFArrayAppendValue(*v9, v14);
              }
              v15 = CFArrayGetCount(*v9);
              v16 = (const void *)*MEMORY[0x1E0C9AC50];
              if (!v15
                || (v20.length = v15 - 1,
                    v20.location = 0,
                    !CFArrayContainsValue(*v9, v20, (const void *)*MEMORY[0x1E0C9AC50])))
              {
                CFArrayAppendValue(*v9, v16);
              }
            }
            goto LABEL_19;
          }
LABEL_9:
          v11 = CFArrayGetCount(MutableCopy);
          v12 = (const void *)*MEMORY[0x1E0C9B4F8];
          if (!v11
            || (v18.length = v11 - 1,
                v18.location = 0,
                !CFArrayContainsValue(*v9, v18, (const void *)*MEMORY[0x1E0C9B4F8])))
          {
            CFArrayAppendValue(*v9, v12);
          }
          goto LABEL_12;
        }
LABEL_8:
        MutableCopy = CFArrayCreateMutable(a1, 0, MEMORY[0x1E0C9B378]);
        v7[5] = MutableCopy;
        if ((v7[4] & 2) == 0)
          goto LABEL_12;
        goto LABEL_9;
      }
    }
    else
    {
      v6[5] = 0;
      v6[6] = 0;
      v9 = (CFArrayRef *)(v6 + 5);
      if ((a2 & 6) != 0)
        goto LABEL_8;
    }
LABEL_19:
    _SetHashCode(v7);
  }
  return v7;
}

uint64_t _URLEnumeratorGetURLsBulk(uint64_t a1, uint64_t a2, _QWORD *a3, _QWORD *a4, CFErrorRef *a5)
{
  uint64_t i;
  const void *v11;
  uint64_t v12;
  const void *v13;
  const void *v14;
  __CFError *v15;
  _BOOL8 v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  int v28;
  uint64_t v29;
  uint64_t v30;

  if (*(_BYTE *)(a1 + 120))
    goto LABEL_2;
  if (*(_QWORD *)(a1 + 48))
  {
    *(_QWORD *)(a1 + 56) = 0;
    *a3 = 0;
    *(_QWORD *)(a1 + 104) = 0;
    v11 = *(const void **)(a1 + 112);
    if (v11)
    {
      CFRelease(v11);
      *(_QWORD *)(a1 + 112) = 0;
    }
    if (!*(_QWORD *)(a1 + 160))
      _InitalizeDirectoryEnumerator(a1);
    if (!*(_BYTE *)(a1 + 120))
    {
      i = 2;
      while (1)
      {
        v12 = *(_QWORD *)(a1 + 88);
        if (v12 < *(_QWORD *)(a1 + 80))
        {
          *(_QWORD *)(a1 + 56) = *(_QWORD *)(a1 + 8 * v12 + 168);
          if (!a2)
            return 2;
          v27 = a2 - 1;
          do
          {
            v28 = *(unsigned __int8 *)(a1 + v12 + 488);
            ++*a3;
            v29 = *(_QWORD *)(a1 + 80);
            v30 = *(_QWORD *)(*(_QWORD *)(a1 + 72) + 8 * v12);
            *(_QWORD *)(a1 + 104) = v30;
            *a4 = v30;
            v12 = *(_QWORD *)(a1 + 88) + 1;
            *(_QWORD *)(a1 + 88) = v12;
            if (v12 >= v29)
              break;
            ++a4;
          }
          while (v28 == *(unsigned __int8 *)(a1 + v12 + 488) && v27-- != 0);
          if (v28)
            return 4;
          else
            return 1;
        }
        v13 = *(const void **)(a1 + 96);
        if (v13)
          break;
        if (!_GetDirectoryURLs(a1))
          return i;
      }
      *(_QWORD *)(a1 + 112) = v13;
      *(_QWORD *)(a1 + 96) = 0;
      if (a5)
        goto LABEL_22;
      return 3;
    }
LABEL_20:
    *(_QWORD *)(a1 + 56) = 0;
    if (a5)
    {
      v13 = *(const void **)(a1 + 112);
      if (!v13)
      {
        *a5 = 0;
LABEL_25:
        v16 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR);
        if (v16)
          _URLEnumeratorGetURLsBulk_cold_1(v16, v17, v18, v19, v20, v21, v22, v23);
        *a5 = CFErrorCreate((CFAllocatorRef)*MEMORY[0x1E0C9AE00], (CFErrorDomain)*MEMORY[0x1E0C9AFB8], 256, 0);
        return 3;
      }
LABEL_22:
      v15 = (__CFError *)CFRetain(v13);
      *a5 = v15;
      if (!v15)
        goto LABEL_25;
    }
    return 3;
  }
  *a3 = 0;
  *(_QWORD *)(a1 + 104) = 0;
  v14 = *(const void **)(a1 + 112);
  if (v14)
  {
    CFRelease(v14);
    *(_QWORD *)(a1 + 112) = 0;
  }
  if (!*(_QWORD *)(a1 + 72))
    _InitalizeVolumeEnumerator(a1);
  if (*(_BYTE *)(a1 + 120) || !*(_QWORD *)(a1 + 72))
    goto LABEL_20;
  v25 = *(_QWORD *)(a1 + 88);
  if (v25 < *(_QWORD *)(a1 + 80))
  {
    *(_QWORD *)(a1 + 56) = *(_QWORD *)(a1 + 8 * v25 + 168);
    for (i = 1; a2; --a2)
    {
      if (v25 >= *(_QWORD *)(a1 + 80))
        break;
      v26 = *(_QWORD *)(*(_QWORD *)(a1 + 72) + 8 * v25);
      *(_QWORD *)(a1 + 104) = v26;
      *a4++ = v26;
      ++*a3;
      v25 = *(_QWORD *)(a1 + 88) + 1;
      *(_QWORD *)(a1 + 88) = v25;
    }
    return i;
  }
LABEL_2:
  *(_QWORD *)(a1 + 56) = 0;
  return 2;
}

uint64_t _URLEnumeratorSkipDescendents(uint64_t result)
{
  uint64_t v1;

  if (*(_QWORD *)(result + 48))
  {
    if ((*(_BYTE *)(result + 32) & 1) != 0)
    {
      result = *(_QWORD *)(result + 160);
      if (result)
      {
        v1 = *(_QWORD *)(result + 1840);
        if (v1)
        {
          if (*(_DWORD *)(v1 + 48) == 1)
            return DirEnumSkipDescendents(result);
        }
      }
    }
  }
  return result;
}

uint64_t _URLEnumeratorGetDescendentLevel(uint64_t a1)
{
  return *(_QWORD *)(a1 + 56);
}

uint64_t _URLEnumeratorGetSourceDidChange()
{
  return 0;
}

uint64_t _URLEnumeratorEqual(_QWORD *a1, _QWORD *a2)
{
  uint64_t v5;
  const void *v6;
  const void *v7;
  const void *v8;
  const void *v9;

  v5 = a1[4] == a2[4] && a1[3] == a2[3];
  v6 = (const void *)a1[5];
  v7 = (const void *)a2[5];
  if (v6)
  {
    if (!v7 || !CFEqual(v6, v7))
      v5 = 0;
  }
  else if (v7)
  {
    v5 = 0;
  }
  else
  {
    v5 = v5;
  }
  v8 = (const void *)a1[6];
  v9 = (const void *)a2[6];
  if (v8)
  {
    if (!v9 || !CFEqual(v8, v9))
      return 0;
  }
  else if (v9)
  {
    return 0;
  }
  else
  {
    return v5;
  }
  return v5;
}

uint64_t _URLEnumeratorHash(_QWORD *a1)
{
  return a1[3];
}

__CFString *_URLEnumeratorCopyDebugDesc(const void *a1)
{
  const __CFAllocator *v2;
  __CFString *Mutable;

  v2 = CFGetAllocator(a1);
  Mutable = CFStringCreateMutable(v2, 0);
  CFStringAppendFormat(Mutable, 0, CFSTR("<CFURLEnumerator %p>{enumeratorOptions = %ld, propertyKeys = %@"), a1, *((_QWORD *)a1 + 4), *((_QWORD *)a1 + 5));
  if (*((_QWORD *)a1 + 6))
    CFStringAppendFormat(Mutable, 0, CFSTR(", directoryURL = %@, currentLevel = %ld"), *((_QWORD *)a1 + 6), *((_QWORD *)a1 + 7));
  if (*((_QWORD *)a1 + 14))
  {
    CFStringAppendFormat(Mutable, 0, CFSTR(", currentError = %@"), *((_QWORD *)a1 + 14));
  }
  else if (*((_QWORD *)a1 + 13))
  {
    CFStringAppendFormat(Mutable, 0, CFSTR(", currentURL = %@"), *((_QWORD *)a1 + 13));
  }
  CFStringAppend(Mutable, CFSTR("}"));
  return Mutable;
}

CFErrorRef _CFErrorWithPOSIXPathAndErrno(CFAllocatorRef alloc, int a2, const char *cStr)
{
  const __CFString *v6;
  CFErrorRef v7;

  if (cStr)
  {
    v6 = CFStringCreateWithCString(alloc, cStr, 0x8000100u);
    if (!v6)
      v6 = CFStringCreateWithCString(alloc, cStr, 0);
  }
  else
  {
    v6 = 0;
  }
  v7 = _FSURLCreateStandardError(alloc, (const __CFString *)*MEMORY[0x1E0C9AFD0], a2, 0, v6, 0);
  if (v6)
    CFRelease(v6);
  return v7;
}

CFErrorRef _InitalizeVolumeEnumerator(uint64_t a1)
{
  int v2;
  CFErrorRef result;
  uint64_t v4;
  void *ptr;

  v4 = 0;
  ptr = 0;
  *(_DWORD *)(a1 + 152) = _CFGetEUID();
  v2 = CreateMountPointArray(*(const __CFAllocator **)(a1 + 16), *(_QWORD *)(a1 + 32), (char **)&ptr, &v4);
  if (v2)
  {
    result = _FSURLCreateStandardError(*(const __CFAllocator **)(a1 + 16), (const __CFString *)*MEMORY[0x1E0C9AFD0], v2, 0, 0, 0);
    *(_QWORD *)(a1 + 112) = result;
    if (!result)
      return result;
  }
  else
  {
    _CreateVolumeURLsArray(a1, (char *)ptr, v4);
    CFAllocatorDeallocate(*(CFAllocatorRef *)(a1 + 16), ptr);
    result = *(CFErrorRef *)(a1 + 112);
    if (!result)
      return result;
  }
  *(_BYTE *)(a1 + 120) = 1;
  return result;
}

void _CreateVolumeURLsArray(uint64_t a1, char *a2, uint64_t a3)
{
  size_t v5;
  void *v6;
  const __CFArray *v7;
  BOOL v8;
  const __CFArray *v9;
  BOOL v10;
  const attrlist *v11;
  size_t p_forkattr;
  attrlist *v13;
  attrlist *v14;
  uint64_t v15;
  uint64_t v16;
  size_t v17;
  const __CFURL *v18;
  const __CFURL *v19;
  const __CFArray *v20;
  const void *v21;
  uint64_t v22;
  size_t v23;
  size_t v24;
  CFURLRef v25;
  uint64_t v26;
  attrlist *v27;
  size_t v28;
  const __CFURL *v29;
  const __CFURL *v30;
  const __CFArray *v31;
  const void *v32;
  char v33;
  const __CFString *v34;
  const __CFArray **v35;
  char v36;
  CFBooleanRef propertyValueTypeRefPtr;
  void **v39;
  uint64_t v40;
  CFRange v41;
  CFRange v42;

  v40 = *MEMORY[0x1E0C80C00];
  v5 = 8 * a3;
  v6 = CFAllocatorAllocate(*(CFAllocatorRef *)(a1 + 16), 8 * a3, 0);
  *(_QWORD *)(a1 + 72) = v6;
  if (!v6)
    goto LABEL_12;
  bzero(v6, v5);
  *(_WORD *)(a1 + 128) = 5;
  *(_QWORD *)(a1 + 138) = 0;
  *(_QWORD *)(a1 + 130) = 0;
  *(_QWORD *)(a1 + 144) = 0;
  v35 = (const __CFArray **)(a1 + 64);
  *(_BYTE *)(a1 + 121) = _FSURLGetAttrListForPropertyKeys(0, *(CFArrayRef *)(a1 + 40), a1 + 128, (__CFArray **)(a1 + 64), (Boolean *)(a1 + 122));
  *(_DWORD *)(a1 + 132) &= ~0x8000000u;
  v7 = *(const __CFArray **)(a1 + 64);
  if (v7)
  {
    v41.length = CFArrayGetCount(*(CFArrayRef *)(a1 + 64));
    v41.location = 0;
    v8 = CFArrayContainsValue(v7, v41, (const void *)*MEMORY[0x1E0C9B5B0]) != 0;
  }
  else
  {
    v8 = 0;
  }
  *(_BYTE *)(a1 + 123) = v8;
  v9 = *(const __CFArray **)(a1 + 40);
  if (v9)
  {
    v42.length = CFArrayGetCount(*(CFArrayRef *)(a1 + 40));
    v42.location = 0;
    v10 = CFArrayContainsValue(v9, v42, (const void *)*MEMORY[0x1E0C9B3F0]) != 0;
  }
  else
  {
    v10 = 0;
  }
  *(_BYTE *)(a1 + 124) = v10;
  if (!*(_BYTE *)(a1 + 121)
    || (v11 = _FSURLCalculateAttributeBufferSize((const attrlist *)(a1 + 128)), !*(_BYTE *)(a1 + 121)))
  {
    p_forkattr = 0;
    v14 = 0;
    v36 = 1;
    goto LABEL_14;
  }
  *(_DWORD *)(a1 + 132) |= 0x80000000;
  p_forkattr = (size_t)&v11->forkattr;
  v13 = (attrlist *)malloc_type_malloc((size_t)&v11->forkattr, 0x470910A4uLL);
  if (!v13)
  {
LABEL_12:
    *(_QWORD *)(a1 + 112) = _FSURLCreateStandardError(*(const __CFAllocator **)(a1 + 16), (const __CFString *)*MEMORY[0x1E0C9AFD0], 12, 0, 0, 0);
    return;
  }
  v14 = v13;
  v36 = 0;
LABEL_14:
  *(_QWORD *)(a1 + 80) = 0;
  if (a3 >= 1)
  {
    v15 = 0;
    v34 = (const __CFString *)*MEMORY[0x1E0C9B4F8];
    do
    {
      v39 = 0;
      v16 = MountInfoStorageSize();
      MEMORY[0x1E0C80A78](v16);
      if (!MountInfoPrepareWithMountPointString())
        v39 = 0;
      if ((v36 & 1) != 0)
      {
        v17 = strlen(a2);
        v18 = CFURLCreateFromFileSystemRepresentation(*(CFAllocatorRef *)(a1 + 16), (const UInt8 *)a2, v17, 1u);
        if (v18)
        {
          v19 = v18;
          if (v39)
            _FSURLCacheCheapVolumeInformationForVolume(v18, (uint64_t)v39);
          v20 = *v35;
          if (*v35)
          {
            v21 = (const void *)__CFURLResourceInfoPtr();
            _FSURLCacheResourcePropertiesForKeys(v19, v20, v21, 0);
          }
          v22 = *(_QWORD *)(a1 + 80);
          *(_QWORD *)(*(_QWORD *)(a1 + 72) + 8 * v22) = v19;
          *(_QWORD *)(a1 + 80) = v22 + 1;
        }
        v23 = p_forkattr;
        goto LABEL_31;
      }
      if (filtered_getattrlist(a2, (_DWORD *)(a1 + 128), v14, p_forkattr, 0x25u))
      {
        v23 = p_forkattr;
        goto LABEL_28;
      }
      v23 = *(unsigned int *)&v14->bitmapcount;
      if (p_forkattr >= v23)
      {
        v23 = p_forkattr;
      }
      else
      {
        v27 = (attrlist *)malloc_type_realloc(v14, *(unsigned int *)&v14->bitmapcount, 0x2CBD2195uLL);
        if (!v27)
          goto LABEL_28;
        v14 = v27;
        if (filtered_getattrlist(a2, (_DWORD *)(a1 + 128), v27, v23, 0x21u))
          goto LABEL_28;
      }
      v28 = strlen(a2);
      v29 = _FSURLCreateWithPathAndAttributes(*(const __CFAllocator **)(a1 + 16), (unsigned __int8 *)a2, v28, 0, 0, (attrlist *)(a1 + 128), v14, (*(_BYTE *)(a1 + 32) & 4) != 0, *(_WORD *)(a1 + 123), HIBYTE(*(_WORD *)(a1 + 123)), v33, 1, v39, 0);
      if (v29)
      {
        v30 = v29;
        if ((*(_BYTE *)(a1 + 32) & 2) != 0)
        {
          propertyValueTypeRefPtr = 0;
          if (CFURLCopyResourcePropertyForKey(v29, v34, &propertyValueTypeRefPtr, 0))
          {
            if (propertyValueTypeRefPtr)
            {
              if (CFBooleanGetValue(propertyValueTypeRefPtr))
              {
                CFRelease(v30);
                CFRelease(propertyValueTypeRefPtr);
                goto LABEL_31;
              }
              CFRelease(propertyValueTypeRefPtr);
            }
          }
        }
        if (v39)
          _FSURLCacheCheapVolumeInformationForVolume(v30, (uint64_t)v39);
        v31 = *v35;
        if (*v35)
        {
          v32 = (const void *)__CFURLResourceInfoPtr();
          _FSURLCacheResourcePropertiesForKeys(v30, v31, v32, 0);
        }
        v26 = *(_QWORD *)(a1 + 80);
        *(_QWORD *)(*(_QWORD *)(a1 + 72) + 8 * v26) = v30;
        goto LABEL_30;
      }
LABEL_28:
      v24 = strlen(a2);
      v25 = CFURLCreateFromFileSystemRepresentation(*(CFAllocatorRef *)(a1 + 16), (const UInt8 *)a2, v24, 1u);
      if (v25)
      {
        v26 = *(_QWORD *)(a1 + 80);
        *(_QWORD *)(*(_QWORD *)(a1 + 72) + 8 * v26) = v25;
LABEL_30:
        *(_QWORD *)(a1 + 80) = v26 + 1;
      }
LABEL_31:
      ++v15;
      MountInfoDestroy(v39);
      a2 += 1024;
      p_forkattr = v23;
    }
    while (v15 < a3);
  }
  if (v14)
    free(v14);
  *(_QWORD *)(a1 + 88) = 0;
}

void CacheItem::CacheItem(CacheItem *this, const __CFData *a2)
{
  CFDataRef Copy;

  *((_QWORD *)this + 3) = 0;
  *(_QWORD *)this = 0;
  *((_QWORD *)this + 1) = 0;
  if (a2)
    Copy = CFDataCreateCopy((CFAllocatorRef)*MEMORY[0x1E0C9AE00], a2);
  else
    Copy = 0;
  *((_QWORD *)this + 2) = Copy;
}

void CacheItem::~CacheItem(CacheItem *this)
{
  const void *v1;

  v1 = (const void *)*((_QWORD *)this + 2);
  if (v1)
    CFRelease(v1);
}

uint64_t append(uint64_t result, CacheItem *a2)
{
  uint64_t v2;

  if (!result)
    append();
  if (!a2)
    append();
  do
  {
    v2 = result;
    result = *(_QWORD *)(result + 24);
  }
  while (result);
  *(_QWORD *)(v2 + 24) = a2;
  return result;
}

void SandboxExtensionCache::SandboxExtensionCache(SandboxExtensionCache *this)
{
  *(_DWORD *)this = 0;
  *((_QWORD *)this + 1) = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0, MEMORY[0x1E0C9B390], 0);
}

void SandboxExtensionCache::~SandboxExtensionCache(SandboxExtensionCache *this)
{
  const void *v1;

  v1 = (const void *)*((_QWORD *)this + 1);
  if (v1)
    CFRelease(v1);
}

CFDataRef SandboxExtensionCache::move(os_unfair_lock_t lock, const __CFURL *a2, CFURLRef url, fsid *a4, uint64_t a5)
{
  BOOL v7;
  char v8;
  fsid *v9;
  uint64_t v10;
  NSObject *v11;
  char v12;
  NSObject *v13;
  NSObject *v14;
  uint64_t v15;
  uint64_t v16;
  BOOL v17;
  NSObject *v18;
  uint64_t v19;
  uint64_t v20;
  CFDataRef v21;
  CFErrorRef v23;
  uint64_t v24;
  const __CFString *propertyValueTypeRefPtr;
  _BYTE v26[4];
  __int128 v27;
  int v28;
  uint64_t v29;
  uint64_t v30;
  _BYTE v31[24];
  char buffer[1024];
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  if (!url && (!a4 || !a5))
    SandboxExtensionCache::move();
  propertyValueTypeRefPtr = 0;
  v23 = 0;
  if (a4)
    v7 = a5 == 0;
  else
    v7 = 1;
  v8 = v7;
  if (v7)
    v9 = 0;
  else
    v9 = a4;
  if (v7)
    v10 = 0;
  else
    v10 = a5;
  if (url)
  {
    if (!CFURLCopyResourcePropertyForKey(url, (CFStringRef)*MEMORY[0x1E0C9B5B0], &propertyValueTypeRefPtr, &v23))
    {
      v11 = securityScopedLog;
      if (os_log_type_enabled((os_log_t)securityScopedLog, OS_LOG_TYPE_ERROR))
        SandboxExtensionCache::move((uint64_t)url, (uint64_t *)&v23, v11);
    }
  }
  v12 = v8 ^ 1;
  if (!propertyValueTypeRefPtr)
    v12 = 1;
  if ((v12 & 1) == 0)
  {
    if (CFStringGetFileSystemRepresentation(propertyValueTypeRefPtr, buffer, 1024))
    {
      *(_QWORD *)&v31[16] = 0;
      *(_OWORD *)v31 = xmmword_1817D5328;
      if (!getattrlist(buffer, v31, v26, 0x28uLL, 1u) && *(_OWORD *)&v31[4] == v27 && *(_DWORD *)&v31[20] == v28)
      {
        v10 = v30;
        v24 = v29;
        v9 = (fsid *)&v24;
        goto LABEL_33;
      }
      v13 = securityScopedLog;
      if (os_log_type_enabled((os_log_t)securityScopedLog, OS_LOG_TYPE_ERROR))
        SandboxExtensionCache::move((uint64_t)buffer, v13);
    }
    else
    {
      v14 = securityScopedLog;
      if (os_log_type_enabled((os_log_t)securityScopedLog, OS_LOG_TYPE_ERROR))
        SandboxExtensionCache::move(v14, v15, v16);
    }
    v9 = 0;
    v10 = 0;
  }
LABEL_33:
  if (v9)
    v17 = v10 == 0;
  else
    v17 = 1;
  if (v17)
  {
    v18 = securityScopedLog;
    if (os_log_type_enabled((os_log_t)securityScopedLog, OS_LOG_TYPE_ERROR))
      SandboxExtensionCache::move(v18, v19, v20);
    v21 = 0;
  }
  else
  {
    os_unfair_lock_lock(lock);
    v21 = SandboxExtensionCache::_move((CFDictionaryRef *)lock, propertyValueTypeRefPtr, v9, v10);
    os_unfair_lock_unlock(lock);
  }
  if (propertyValueTypeRefPtr)
    CFRelease(propertyValueTypeRefPtr);
  return v21;
}

CFDataRef SandboxExtensionCache::_move(CFDictionaryRef *this, const __CFString *a2, fsid *a3, uint64_t a4)
{
  int updated;
  int v9;
  NSObject *v10;
  CFDataRef v11;
  const __CFString *v13;
  const __CFString *v14;
  const char *v15;
  UInt8 *v16;
  size_t v17;
  int32_t v18;
  int32_t v19;
  _DWORD v20[2];
  __int16 v21;
  int32_t v22;
  __int16 v23;
  uint64_t v24;
  __int16 v25;
  int v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  updated = sandbox_extension_update_file_by_fileid();
  if (updated)
  {
    v9 = updated;
    v10 = securityScopedLog;
    if (os_log_type_enabled((os_log_t)securityScopedLog, OS_LOG_TYPE_ERROR))
    {
      v18 = a3->val[0];
      v19 = a3->val[1];
      v20[0] = 67109888;
      v20[1] = v18;
      v21 = 1024;
      v22 = v19;
      v23 = 2048;
      v24 = a4;
      v25 = 1024;
      v26 = v9;
      _os_log_error_impl(&dword_1817A6000, v10, OS_LOG_TYPE_ERROR, "sandbox_extension_update_file_by_fileid error for fsid={%#x, %#x}, id=%#llx: %{errno}d", (uint8_t *)v20, 0x1Eu);
    }
    return 0;
  }
  if (a2 && CFStringGetFileSystemRepresentation(a2, (char *)v20, 1024))
  {
    v13 = (const __CFString *)CFRetain(a2);
  }
  else
  {
    if (fsgetpath((char *)v20, 0x400uLL, a3, a4) < 1)
      return 0;
    v13 = CFStringCreateWithFileSystemRepresentation((CFAllocatorRef)*MEMORY[0x1E0C9AE00], (const char *)v20);
  }
  v14 = v13;
  if (!v13)
    return 0;
  access((const char *)v20, 2);
  v15 = (const char *)sandbox_extension_issue_file();
  if (v15)
  {
    v16 = (UInt8 *)v15;
    v17 = strlen(v15);
    v11 = CFDataCreate((CFAllocatorRef)*MEMORY[0x1E0C9AE00], v16, v17 + 1);
    if (v11 && !SandboxExtensionCache::_insert(this, v14, v11))
    {
      CFRelease(v11);
      v11 = 0;
    }
    free(v16);
  }
  else
  {
    v11 = 0;
  }
  CFRelease(v14);
  return v11;
}

CFDataRef SandboxExtensionCache::copyExtensionForURL(SandboxExtensionCache *this, CFURLRef url)
{
  CFDataRef Copy;
  BOOL v4;
  CFDataRef *Value;
  const void *propertyValueTypeRefPtr;

  propertyValueTypeRefPtr = 0;
  Copy = 0;
  if (CFURLCopyResourcePropertyForKey(url, (CFStringRef)*MEMORY[0x1E0C9B5B0], &propertyValueTypeRefPtr, 0))
    v4 = propertyValueTypeRefPtr == 0;
  else
    v4 = 1;
  if (!v4)
  {
    os_unfair_lock_lock((os_unfair_lock_t)this);
    Value = (CFDataRef *)CFDictionaryGetValue(*((CFDictionaryRef *)this + 1), propertyValueTypeRefPtr);
    if (Value)
      Copy = CFDataCreateCopy((CFAllocatorRef)*MEMORY[0x1E0C9AE00], Value[2]);
    else
      Copy = 0;
    os_unfair_lock_unlock((os_unfair_lock_t)this);
    CFRelease(propertyValueTypeRefPtr);
  }
  return Copy;
}

BOOL SandboxExtensionCache::containsPath(SandboxExtensionCache *this, const __CFString *a2)
{
  _BOOL8 v4;

  os_unfair_lock_lock((os_unfair_lock_t)this);
  v4 = CFDictionaryContainsKey(*((CFDictionaryRef *)this + 1), a2) != 0;
  os_unfair_lock_unlock((os_unfair_lock_t)this);
  return v4;
}

BOOL SandboxExtensionCache::_containsPath(CFDictionaryRef *this, const __CFString *a2)
{
  return CFDictionaryContainsKey(this[1], a2) != 0;
}

BOOL SandboxExtensionCache::containsURL(SandboxExtensionCache *this, CFURLRef url)
{
  BOOL v3;
  _BOOL8 v4;
  const void *propertyValueTypeRefPtr;

  propertyValueTypeRefPtr = 0;
  if (CFURLCopyResourcePropertyForKey(url, (CFStringRef)*MEMORY[0x1E0C9B5B0], &propertyValueTypeRefPtr, 0))
    v3 = propertyValueTypeRefPtr == 0;
  else
    v3 = 1;
  if (v3)
    return 0;
  os_unfair_lock_lock((os_unfair_lock_t)this);
  v4 = CFDictionaryContainsKey(*((CFDictionaryRef *)this + 1), propertyValueTypeRefPtr) != 0;
  os_unfair_lock_unlock((os_unfair_lock_t)this);
  CFRelease(propertyValueTypeRefPtr);
  return v4;
}

void OUTLINED_FUNCTION_2_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, a5, 0x16u);
}

void OUTLINED_FUNCTION_5_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, a5, 0xCu);
}

void OUTLINED_FUNCTION_6_0(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  NSObject *v9;

  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0x12u);
}

void OUTLINED_FUNCTION_7_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0x16u);
}

uint64_t _URLReplaceObject(const __CFAllocator *MutableCopy, const __CFURL *cf, const void *a3, const __CFString *a4, const __CFString *a5, unint64_t a6, CFTypeRef *a7, CFErrorRef *a8)
{
  const __CFURL *v14;
  CFTypeRef v16;
  int v17;
  const __CFURL *v18;
  CFURLRef v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  const __CFString *v24;
  const __CFString *v25;
  const __CFString *v26;
  const __CFString *v27;
  uint64_t v28;
  const __CFString *v29;
  const __CFString *v30;
  const CFArrayCallBacks *v31;
  const __CFAllocator *v32;
  CFIndex v33;
  __CFError *v34;
  uint64_t v35;
  const __CFURL *v36;
  int v37;
  int v38;
  const __CFString *v39;
  const void *v40;
  const __CFString *v41;
  const CFArrayCallBacks *v42;
  const __CFAllocator *v43;
  CFIndex v44;
  const __CFArray *v45;
  const __CFURL *v46;
  const void *v47;
  int v48;
  int v49;
  uid_t v50;
  int v51;
  CFIndex v52;
  const __CFAllocator *v53;
  const __CFURL *v54;
  const __CFURL *v55;
  int v56;
  uint64_t v57;
  const __CFAllocator *v58;
  int v59;
  int v60;
  const __CFString *v61;
  __CFError *v62;
  CFErrorDomain v63;
  CFIndex v64;
  CFErrorDomain v65;
  const __CFString *v66;
  __CFDictionary *Mutable;
  CFErrorRef v68;
  const __CFString *v70;
  char v71;
  CFStringRef v72;
  CFStringRef v73;
  CFStringRef v74;
  CFStringRef v75;
  int v76;
  const __CFString *v77;
  CFFileSecurityRef v78;
  __CFFileSecurity *v79;
  mode_t v80;
  CFTypeRef v81;
  const char *v82;
  UInt8 *v83;
  size_t v84;
  int v85;
  gid_t v86;
  int v87;
  mode_t v88;
  mode_t v89;
  uid_t v90;
  mode_t v91;
  CFIndex v92;
  int v93;
  _acl *v94;
  int v95;
  int entry;
  int permset;
  int v98;
  int v99;
  int v100;
  __CFFileSecurity *Copy;
  __CFFileSecurity *v102;
  int v103;
  int v104;
  int v105;
  ssize_t v106;
  size_t v107;
  void *v108;
  void *v109;
  void *v110;
  _BOOL4 v111;
  const __CFString *v112;
  const UInt8 *BytePtr;
  UInt8 *MutableBytePtr;
  __int16 v115;
  __int16 v116;
  char v117;
  __int16 v118;
  const void *v119;
  int v120;
  const __CFString *v121;
  CFTypeRef v122;
  const __CFURL *v123;
  const void *v124;
  __CFError *v125;
  CFTypeRef *v126;
  const __CFURL *v127;
  const __CFString *v128;
  const __CFString *v129;
  const __CFString *v130;
  int v131;
  int v132;
  const __CFString *v133;
  CFTypeRef *v134;
  const __CFString *v135;
  CFStringRef v136;
  int v137;
  const __CFString *v138;
  const __CFString *key;
  __CFDictionary *keya;
  const __CFString *pathComponent;
  const void *v142;
  CFErrorRef *v143;
  const __CFString *domain;
  const __CFURL *cfa;
  const __CFURL *value;
  void *v147;
  CFTypeRef v148;
  const __CFURL *v149;
  const __CFAllocator *allocator;
  CFIndex code;
  CFErrorRef error;
  unsigned __int8 v153;
  CFTypeRef cf2;
  CFURLRef url;
  unsigned __int8 v156[2];
  mode_t v157;
  acl_t accessControlList;
  gid_t v159;
  gid_t group;
  mode_t mode;
  CFFileSecurityRef v162;
  CFFileSecurityRef fileSec;
  int ismember;
  accessx_descriptor values;
  uint64_t v166;
  uint64_t v167;
  const __CFString *v168;
  const __CFString *v169;
  uint64_t v170;
  const __CFString *v171;
  uint64_t v172;
  const __CFString *v173;
  uint64_t v174;
  uint64_t v175;
  uint64_t v176;
  const __CFString *v177;
  int propertyValueTypeRefPtr[2];
  uint64_t v179;
  uint64_t v180;

  v14 = cf;
  v180 = *MEMORY[0x1E0C80C00];
  *(_WORD *)v156 = 0;
  cf2 = 0;
  url = 0;
  v153 = 0;
  v16 = CFRetain(cf);
  v148 = CFRetain(a3);
  code = 22;
  error = 0;
  domain = (const __CFString *)*MEMORY[0x1E0C9AFD0];
  if (a5)
    v17 = (a6 >> 4) & 1;
  else
    v17 = 0;
  if (a4 && CFStringFind(a4, CFSTR("/"), 0).location != -1 || a5 && CFStringFind(a5, CFSTR("/"), 0).location != -1)
    goto LABEL_14;
  if (CFURLResourceIsReachable(v14, 0))
  {
    v138 = a5;
    v18 = CFURLCreateFilePathURL(MutableCopy, v14, &error);
    value = v14;
    v147 = (void *)v16;
    allocator = MutableCopy;
    if (!v18)
    {
      LODWORD(MutableCopy) = 0;
      v35 = 0;
      v36 = 0;
      v37 = 0;
      v38 = 0;
      goto LABEL_71;
    }
    v19 = CFURLCreateFilePathURL(MutableCopy, (CFURLRef)a3, &error);
    v149 = v18;
    if (!v19)
    {
      v35 = 0;
      v36 = 0;
      v37 = 0;
      v38 = 0;
      v18 = 0;
      LODWORD(MutableCopy) = 1;
      goto LABEL_70;
    }
    pathComponent = a4;
    v142 = a3;
    v137 = v17;
    v134 = a7;
    cfa = v19;
    v143 = a8;
    v20 = *MEMORY[0x1E0C9B520];
    v21 = *MEMORY[0x1E0C9B4E0];
    *(_QWORD *)&values.ad_name_offset = *MEMORY[0x1E0C9B520];
    *(_QWORD *)values.ad_pad = v21;
    v22 = *MEMORY[0x1E0C9B548];
    v23 = *MEMORY[0x1E0C9B538];
    v166 = *MEMORY[0x1E0C9B548];
    v167 = v23;
    v24 = (const __CFString *)*MEMORY[0x1E0C9B5A8];
    v133 = (const __CFString *)*MEMORY[0x1E0C9B5A0];
    v168 = (const __CFString *)*MEMORY[0x1E0C9B5A0];
    v169 = v24;
    v135 = v24;
    v25 = (const __CFString *)*MEMORY[0x1E0C9B6A0];
    v26 = (const __CFString *)*MEMORY[0x1E0C9B470];
    v170 = *MEMORY[0x1E0C9B6A0];
    v171 = v26;
    if ((a6 & 2) != 0)
    {
      v29 = (const __CFString *)*MEMORY[0x1E0C9B7B0];
      v39 = (const __CFString *)*MEMORY[0x1E0C9B778];
      v172 = *MEMORY[0x1E0C9B7B0];
      v173 = v39;
      key = v39;
      v31 = (const CFArrayCallBacks *)MEMORY[0x1E0C9B378];
      v32 = MutableCopy;
      v33 = 10;
    }
    else
    {
      v27 = (const __CFString *)*MEMORY[0x1E0C9AC58];
      v172 = *MEMORY[0x1E0C9B408];
      v173 = v27;
      v28 = *MEMORY[0x1E0C9B4A0];
      v174 = *MEMORY[0x1E0C9AC60];
      v175 = v28;
      v29 = (const __CFString *)*MEMORY[0x1E0C9B7B0];
      v30 = (const __CFString *)*MEMORY[0x1E0C9B778];
      v176 = *MEMORY[0x1E0C9B7B0];
      v177 = v30;
      key = v30;
      v31 = (const CFArrayCallBacks *)MEMORY[0x1E0C9B378];
      v32 = MutableCopy;
      v33 = 14;
    }
    MutableCopy = CFArrayCreate(v32, (const void **)&values, v33, v31);
    if (MutableCopy)
    {
      v40 = (const void *)__CFURLResourceInfoPtr();
      v38 = _FSURLCacheResourcePropertiesForKeys(v149, MutableCopy, v40, &error);
      CFRelease(MutableCopy);
      if (v38)
      {
        *(_QWORD *)&values.ad_name_offset = v20;
        *(_QWORD *)values.ad_pad = v21;
        v166 = v22;
        v167 = v23;
        v168 = v25;
        v169 = v26;
        if ((a6 & 2) != 0)
        {
          v42 = (const CFArrayCallBacks *)MEMORY[0x1E0C9B378];
          v43 = allocator;
          v44 = 6;
        }
        else
        {
          v41 = (const __CFString *)*MEMORY[0x1E0C9B4A0];
          v170 = *MEMORY[0x1E0C9AC60];
          v171 = v41;
          v42 = (const CFArrayCallBacks *)MEMORY[0x1E0C9B378];
          v43 = allocator;
          v44 = 8;
        }
        v45 = CFArrayCreate(v43, (const void **)&values, v44, v42);
        a3 = v142;
        a8 = v143;
        v46 = v149;
        if (v45)
        {
          v47 = (const void *)__CFURLResourceInfoPtr();
          v38 = _FSURLCacheResourcePropertiesForKeys(cfa, v45, v47, &error);
          CFRelease(v45);
          if (v38)
          {
            if (!_URLIsDirectory(v149, (BOOL *)&v156[1], &error))
              goto LABEL_64;
            v48 = v156[1];
            if (!v156[1])
            {
              LOBYTE(values.ad_name_offset) = 0;
              if (!_URLIsFile(v149, (BOOL *)&values, &error))
              {
                v18 = 0;
                goto LABEL_68;
              }
              if (!LOBYTE(values.ad_name_offset))
              {
                v52 = 2;
                goto LABEL_67;
              }
            }
            if (!_URLIsDirectory(cfa, (BOOL *)v156, &error))
              goto LABEL_64;
            v49 = v156[0];
            if (!v156[0])
            {
              LOBYTE(values.ad_name_offset) = 0;
              if (!_URLIsFile(cfa, (BOOL *)&values, &error))
              {
                v18 = 0;
LABEL_174:
                v35 = 0;
                v36 = 0;
                v37 = 0;
                v38 = 0;
                goto LABEL_175;
              }
              if (!LOBYTE(values.ad_name_offset))
              {
                v92 = 2;
LABEL_173:
                code = v92;
                v18 = (const __CFURL *)CFRetain(cfa);
                goto LABEL_174;
              }
            }
            if (!_URLIsLocked(v149, (BOOL *)&v153, &error))
              goto LABEL_64;
            if (v153)
            {
LABEL_38:
              v52 = 13;
LABEL_67:
              code = v52;
              v18 = (const __CFURL *)CFRetain(v149);
LABEL_68:
              LODWORD(MutableCopy) = 0;
              v35 = 0;
              v36 = 0;
              v37 = 0;
              v38 = 0;
              goto LABEL_69;
            }
            if (_URLIsLocked(cfa, (BOOL *)&v153, &error))
            {
              if (!v153)
              {
                propertyValueTypeRefPtr[0] = 0;
                *(_QWORD *)&values.ad_name_offset = 0x40000000010;
                if (!CFURLGetFileSystemRepresentation(v149, 1u, (UInt8 *)&v166, 1024))
                {
                  v51 = 2;
LABEL_40:
                  v53 = CFGetAllocator(v149);
                  LODWORD(MutableCopy) = 0;
                  v35 = 0;
                  v36 = 0;
                  v37 = 0;
                  v38 = 0;
                  v18 = 0;
                  error = _FSURLCreateStandardError(v53, domain, v51, 1, (const __CFString *)v149, 0);
LABEL_69:
                  CFRelease(cfa);
LABEL_70:
                  CFRelease(v149);
                  goto LABEL_71;
                }
                v50 = _CFGetEUID();
                if (accessx_np(&values, 0x410uLL, propertyValueTypeRefPtr, v50))
                {
                  v51 = *__error();
                  if (!v51)
                    goto LABEL_38;
                  goto LABEL_40;
                }
                if (propertyValueTypeRefPtr[0])
                  goto LABEL_38;
                if (pathComponent)
                {
                  v132 = 0;
                }
                else
                {
                  *(_QWORD *)&values.ad_name_offset = 0;
                  if (!CFURLCopyResourcePropertyForKey(v149, v29, &values, &error))
                    goto LABEL_64;
                  v132 = CFBooleanGetValue(*(CFBooleanRef *)&values.ad_name_offset);
                  CFRelease(*(CFTypeRef *)&values.ad_name_offset);
                }
                *(_QWORD *)&values.ad_name_offset = 0;
                v58 = allocator;
                if (!CFURLCopyResourcePropertyForKey(v149, key, &values, &error))
                  goto LABEL_64;
                v131 = CFBooleanGetValue(*(CFBooleanRef *)&values.ad_name_offset);
                CFRelease(*(CFTypeRef *)&values.ad_name_offset);
                *(_QWORD *)&values.ad_name_offset = 0;
                *(_QWORD *)propertyValueTypeRefPtr = 0;
                if (CFURLCopyResourcePropertyForKey(v149, v26, &values, 0))
                {
                  if (CFURLCopyResourcePropertyForKey(cfa, v26, propertyValueTypeRefPtr, 0))
                  {
                    v59 = CFEqual(*(CFTypeRef *)&values.ad_name_offset, *(CFTypeRef *)propertyValueTypeRefPtr);
                    CFRelease(*(CFTypeRef *)propertyValueTypeRefPtr);
                    CFRelease(*(CFTypeRef *)&values.ad_name_offset);
                    if (v59)
                    {
                      v52 = 22;
                      goto LABEL_67;
                    }
                  }
                  else
                  {
                    CFRelease(*(CFTypeRef *)&values.ad_name_offset);
                  }
                }
                *(_QWORD *)&values.ad_name_offset = 0;
                *(_QWORD *)propertyValueTypeRefPtr = 0;
                if (CFURLCopyResourcePropertyForKey(v149, v25, &values, 0))
                {
                  if (CFURLCopyResourcePropertyForKey(cfa, v25, propertyValueTypeRefPtr, 0))
                  {
                    v60 = CFEqual(*(CFTypeRef *)&values.ad_name_offset, *(CFTypeRef *)propertyValueTypeRefPtr);
                    CFRelease(*(CFTypeRef *)propertyValueTypeRefPtr);
                    CFRelease(*(CFTypeRef *)&values.ad_name_offset);
                    if (v60)
                    {
                      if (CFURLCopyResourcePropertyForKey(v149, v135, &url, &error))
                      {
                        if (pathComponent)
                          v61 = (const __CFString *)CFURLCreateCopyAppendingPathComponent(allocator, url, pathComponent, v49);
                        else
                          v61 = (const __CFString *)CFRetain(v149);
                        v70 = v61;
                        if (!v61)
                        {
                          code = 2;
                          v18 = (const __CFURL *)CFRetain(v149);
                          LODWORD(MutableCopy) = 0;
                          v35 = 0;
                          v36 = 0;
                          v37 = 0;
                          v38 = 0;
LABEL_315:
                          CFRelease(url);
                          goto LABEL_69;
                        }
                        if (v132)
                        {
                          if ((v137 & 1) == 0)
                          {
LABEL_127:
                            v36 = 0;
                            goto LABEL_130;
                          }
LABEL_122:
                          v36 = CFURLCreateCopyAppendingPathComponent(allocator, url, v138, v48);
                          if (!v36)
                          {
                            code = 2;
                            v18 = (const __CFURL *)CFRetain(url);
                            LODWORD(MutableCopy) = 0;
                            v35 = 0;
                            v37 = 0;
LABEL_313:
                            v38 = 0;
LABEL_314:
                            CFRelease(v70);
                            goto LABEL_315;
                          }
LABEL_123:
                          v72 = CFURLCopyLastPathComponent((CFURLRef)v70);
                          if (v72)
                          {
                            v73 = v72;
                            v129 = v70;
                            v74 = CFURLCopyLastPathComponent(v36);
                            if (v74)
                            {
                              v75 = v74;
                              v76 = CFEqual(v73, v74);
                              CFRelease(v75);
                              CFRelease(v73);
                              if (v76)
                              {
                                code = 22;
                                v70 = v129;
                                v18 = (const __CFURL *)CFRetain(v129);
                                LODWORD(MutableCopy) = 0;
                                v35 = 0;
                                v37 = 0;
                                v38 = 0;
                                goto LABEL_310;
                              }
                              v58 = allocator;
                            }
                            else
                            {
                              CFRelease(v73);
                            }
                            v70 = v129;
                          }
LABEL_130:
                          if ((a6 & 2) != 0)
                          {
                            v136 = 0;
                            keya = 0;
                            v81 = v147;
                            goto LABEL_261;
                          }
                          keya = CFDictionaryCreateMutable(v58, 0, MEMORY[0x1E0C9B390], MEMORY[0x1E0C9B3A0]);
                          if (keya)
                          {
                            v162 = 0;
                            fileSec = 0;
                            mode = 0;
                            v159 = 0;
                            group = 0;
                            accessControlList = 0;
                            v77 = (const __CFString *)*MEMORY[0x1E0C9B4A0];
                            if (CFURLCopyResourcePropertyForKey(v149, (CFStringRef)*MEMORY[0x1E0C9B4A0], &fileSec, &error)&& fileSec)
                            {
                              v128 = v77;
                              if (CFURLCopyResourcePropertyForKey(cfa, v77, &v162, &error) && v162)
                              {
                                v78 = CFFileSecurityCreate(v58);
                                if (!v78)
                                {
                                  v136 = 0;
                                  v93 = 0;
                                  v81 = v147;
LABEL_236:
                                  CFRelease(v162);
                                  CFRelease(fileSec);
                                  if (v93)
                                  {
                                    if (TransferExtendedAttributes(v58, v46, cfa, &error)
                                      && (*(_QWORD *)&values.ad_name_offset = 0,
                                          *(_QWORD *)propertyValueTypeRefPtr = 0,
                                          v112 = (const __CFString *)*MEMORY[0x1E0C9AC60],
                                          CFURLCopyResourcePropertyForKey(v46, (CFStringRef)*MEMORY[0x1E0C9AC60], &values, &error))&& *(_QWORD *)&values.ad_name_offset&& CFDataGetLength(*(CFDataRef *)&values.ad_name_offset) == 32)
                                    {
                                      BytePtr = CFDataGetBytePtr(*(CFDataRef *)&values.ad_name_offset);
                                      LODWORD(MutableCopy) = 1;
                                      if (CFURLCopyResourcePropertyForKey(cfa, v112, propertyValueTypeRefPtr, &error))
                                      {
                                        if (*(_QWORD *)propertyValueTypeRefPtr)
                                        {
                                          if (CFDataGetLength(*(CFDataRef *)propertyValueTypeRefPtr) == 32)
                                          {
                                            MutableCopy = CFDataCreateMutableCopy(v58, 0, *(CFDataRef *)propertyValueTypeRefPtr);
                                            CFRelease(*(CFTypeRef *)propertyValueTypeRefPtr);
                                            if (MutableCopy)
                                            {
                                              MutableBytePtr = CFDataGetMutableBytePtr(MutableCopy);
                                              v115 = *((_WORD *)BytePtr + 4);
                                              if ((v115 & 0xE) != 0
                                                && (v116 = *((_WORD *)MutableBytePtr + 4), (v116 & 0xE) == 0))
                                              {
                                                v117 = 0;
                                                *((_WORD *)MutableBytePtr + 4) = v116 | *((_WORD *)BytePtr + 4) & 0xE;
                                                v115 = *((_WORD *)BytePtr + 4);
                                              }
                                              else
                                              {
                                                v117 = 1;
                                              }
                                              if ((v115 & 0x10) == 0
                                                || (v118 = *((_WORD *)MutableBytePtr + 4), (v118 & 0x10) != 0))
                                              {
                                                if ((v117 & 1) != 0)
                                                  goto LABEL_254;
                                              }
                                              else
                                              {
                                                *((_WORD *)MutableBytePtr + 4) = v118 | 0x10;
                                              }
                                              CFDictionaryAddValue(keya, v112, MutableCopy);
LABEL_254:
                                              CFRelease(MutableCopy);
                                              CFRelease(*(CFTypeRef *)&values.ad_name_offset);
                                              v119 = (const void *)*MEMORY[0x1E0C9B408];
                                              if (CFURLCopyResourcePropertyForKey(v46, (CFStringRef)*MEMORY[0x1E0C9B408], &cf2, 0)&& cf2)
                                              {
                                                CFDictionaryAddValue(keya, v119, cf2);
                                                CFRelease(cf2);
                                              }
                                              if (!CFURLSetResourcePropertiesForKeys(cfa, keya, &error))
                                              {
                                                v35 = 0;
                                                v37 = 0;
                                                v38 = 0;
                                                v18 = 0;
                                                LODWORD(MutableCopy) = 1;
                                                goto LABEL_306;
                                              }
                                              if (v136)
                                                CFURLSetResourcePropertyForKey(cfa, v128, v136, 0);
                                              else
                                                v136 = 0;
LABEL_261:
                                              if (!v138 || !v36 || !CFURLResourceIsReachable(v36, 0))
                                              {
LABEL_267:
                                                if (v132)
                                                {
                                                  if (CFURLGetFileSystemRepresentation(cfa, 1u, (UInt8 *)&values, 1024))
                                                  {
                                                    if (CFURLGetFileSystemRepresentation((CFURLRef)v70, 1u, (UInt8 *)propertyValueTypeRefPtr, 1024))
                                                    {
                                                      if (!renamex_np((const char *)&values, (const char *)propertyValueTypeRefPtr, 2u)|| (v120 = *__error(), v121 = (const __CFString *)cfa, !v120))
                                                      {
                                                        CFRelease(v148);
                                                        v148 = CFRetain(v70);
                                                        CFRelease(v81);
                                                        v122 = CFRetain(cfa);
                                                        if (v137)
                                                        {
                                                          if (_RenameURL(v58, cfa, v36, &error))
                                                          {
                                                            CFRelease(v122);
                                                            v81 = CFRetain(v36);
LABEL_302:
                                                            v126 = v134;
LABEL_303:
                                                            v147 = (void *)v81;
                                                            LODWORD(MutableCopy) = 0;
                                                            v37 = 0;
                                                            v38 = 0;
                                                            v18 = 0;
                                                            if (v126)
                                                              *v126 = CFRetain(v70);
                                                            v35 = 1;
                                                            goto LABEL_306;
                                                          }
                                                          v147 = (void *)v122;
                                                          goto LABEL_342;
                                                        }
                                                        if (_RemoveObjectAtURL(v58, cfa, &error))
                                                        {
                                                          v124 = v122;
                                                          goto LABEL_301;
                                                        }
                                                        v147 = (void *)v122;
                                                        v127 = cfa;
                                                        goto LABEL_349;
                                                      }
                                                    }
                                                    else
                                                    {
                                                      v120 = 2;
                                                      v121 = v70;
                                                    }
                                                  }
                                                  else
                                                  {
                                                    v120 = 2;
                                                    v121 = (const __CFString *)cfa;
                                                  }
                                                  v125 = _FSURLCreateStandardError(v58, domain, v120, 1, v121, 0);
                                                  LODWORD(MutableCopy) = 0;
                                                  v35 = 0;
                                                  v37 = 0;
                                                  v38 = 0;
                                                  v18 = 0;
                                                  error = v125;
LABEL_306:
                                                  if (keya)
                                                    CFRelease(keya);
                                                  if (v136)
                                                    CFRelease(v136);
                                                  goto LABEL_310;
                                                }
                                                if (v36)
                                                {
                                                  if ((v156[1]
                                                     || v156[0]
                                                     || !v131
                                                     || !_HardLinkURL(v58, v46, v36, &error))
                                                    && !_RenameURL(v58, v46, v36, &error))
                                                  {
                                                    goto LABEL_342;
                                                  }
                                                  CFRelease(v81);
                                                  v81 = CFRetain(v36);
                                                }
                                                if (_RenameURL(v58, cfa, (const __CFURL *)v70, &error))
                                                {
                                                  if (pathComponent)
                                                  {
                                                    v123 = v36 ? v36 : v46;
                                                    if (CFURLCopyResourcePropertyForKey(v123, v133, &cf2, 0) && cf2)
                                                    {
                                                      if (!CFEqual(pathComponent, cf2))
                                                        TransferDocumentIdentifier(v123, (const __CFURL *)v70);
                                                      CFRelease(cf2);
                                                    }
                                                  }
                                                  CFRelease(v148);
                                                  v148 = CFRetain(v70);
                                                  if ((v137 & 1) != 0)
                                                    goto LABEL_302;
                                                  if (v36)
                                                  {
                                                    if (_RemoveObjectAtURL(v58, v36, &error))
                                                    {
                                                      v124 = v81;
LABEL_301:
                                                      CFRelease(v124);
                                                      v81 = 0;
                                                      goto LABEL_302;
                                                    }
                                                    v147 = (void *)v81;
LABEL_350:
                                                    LODWORD(MutableCopy) = 0;
                                                    v35 = 0;
                                                    v37 = 0;
                                                    v18 = 0;
                                                    v38 = 1;
                                                    goto LABEL_306;
                                                  }
                                                  if (!pathComponent
                                                    || !CFURLCopyResourcePropertyForKey(v46, v133, &cf2, 0)
                                                    || !cf2)
                                                  {
                                                    goto LABEL_302;
                                                  }
                                                  if (!CFEqual(pathComponent, cf2))
                                                  {
                                                    if (!_RemoveObjectAtURL(v58, v46, &error))
                                                    {
                                                      v147 = (void *)v81;
                                                      v127 = v46;
LABEL_349:
                                                      v36 = (const __CFURL *)CFRetain(v127);
                                                      goto LABEL_350;
                                                    }
                                                    CFRelease(v81);
                                                    v81 = 0;
                                                  }
                                                  v126 = v134;
                                                  CFRelease(cf2);
                                                  goto LABEL_303;
                                                }
                                                v147 = (void *)v81;
LABEL_342:
                                                LODWORD(MutableCopy) = 0;
                                                v35 = 0;
                                                v37 = 0;
                                                v38 = 0;
                                                v18 = 0;
                                                goto LABEL_306;
                                              }
                                              if (_URLIsLocked(v36, (BOOL *)&v153, &error))
                                              {
                                                if (v153)
                                                {
                                                  code = 13;
                                                  v18 = (const __CFURL *)CFRetain(v36);
                                                  LODWORD(MutableCopy) = 0;
                                                  v35 = 0;
                                                  v38 = 0;
                                                  goto LABEL_344;
                                                }
                                                if (_RemoveObjectAtURL(v58, v36, &error))
                                                  goto LABEL_267;
                                              }
                                              LODWORD(MutableCopy) = 0;
                                              v35 = 0;
                                              v38 = 0;
                                              v18 = 0;
LABEL_344:
                                              v37 = 1;
                                              goto LABEL_306;
                                            }
                                          }
                                        }
                                      }
                                      CFRelease(*(CFTypeRef *)&values.ad_name_offset);
                                    }
                                    else
                                    {
                                      LODWORD(MutableCopy) = 0;
                                    }
                                    if (!error)
                                    {
                                      code = 512;
                                      domain = (const __CFString *)*MEMORY[0x1E0C9AFB8];
                                      v18 = (const __CFURL *)CFRetain(v149);
LABEL_339:
                                      v35 = 0;
                                      v37 = 0;
                                      v38 = 0;
                                      goto LABEL_340;
                                    }
                                    goto LABEL_334;
                                  }
LABEL_332:
                                  if (!error)
                                  {
                                    code = 512;
                                    domain = (const __CFString *)*MEMORY[0x1E0C9AFB8];
                                    v18 = (const __CFURL *)CFRetain(v149);
                                    LODWORD(MutableCopy) = 0;
                                    goto LABEL_339;
                                  }
                                  LODWORD(MutableCopy) = 0;
LABEL_334:
                                  v35 = 0;
                                  v37 = 0;
                                  v38 = 0;
                                  v18 = 0;
LABEL_340:
                                  a3 = v142;
                                  a8 = v143;
                                  goto LABEL_306;
                                }
                                v79 = v78;
                                if (!CFFileSecurityGetMode(fileSec, &mode))
                                  goto LABEL_177;
                                if (!v48 || v49)
                                {
                                  if (v48 || !v49)
                                  {
LABEL_152:
                                    if (CFFileSecurityGetGroup(fileSec, &group) && CFFileSecurityGetGroup(v162, &v159))
                                    {
                                      v86 = group;
                                      v130 = v70;
                                      if (v159 == group)
                                      {
                                        v87 = 0;
                                        v88 = 0;
                                        v89 = mode;
                                        goto LABEL_182;
                                      }
                                      *(_QWORD *)&values.ad_name_offset = 0;
                                      *(_QWORD *)values.ad_pad = 0;
                                      v179 = 0;
                                      *(_QWORD *)propertyValueTypeRefPtr = 0;
                                      ismember = 0;
                                      v90 = _CFGetEUID();
                                      if (mbr_uid_to_uuid(v90, (unsigned __int8 *)&values)
                                        || mbr_gid_to_uuid(v86, (unsigned __int8 *)propertyValueTypeRefPtr)
                                        || mbr_check_membership((const unsigned __int8 *)&values, (const unsigned __int8 *)propertyValueTypeRefPtr, &ismember))
                                      {
                                        v91 = mode;
                                      }
                                      else
                                      {
                                        v91 = mode;
                                        v87 = ismember;
                                        if ((_BYTE)ismember)
                                        {
                                          v88 = mode;
LABEL_181:
                                          v89 = (8 * (v91 & 7)) | v91 & 0xFFC7;
                                          mode = v89;
LABEL_182:
                                          if (CFFileSecuritySetMode(v79, v89))
                                          {
                                            if (CFFileSecurityCopyAccessControlList(fileSec, &accessControlList))
                                            {
                                              if (v48 != v49)
                                              {
                                                v94 = accessControlList;
                                                v95 = 0;
                                                if (v48)
                                                {
                                                  *(_QWORD *)&values.ad_name_offset = 0;
                                                  *(_QWORD *)propertyValueTypeRefPtr = 0;
                                                  while (1)
                                                  {
                                                    entry = acl_get_entry(v94, v95, (acl_entry_t *)&values);
                                                    if (entry)
                                                      break;
                                                    permset = acl_get_permset(*(acl_entry_t *)&values.ad_name_offset, (acl_permset_t *)propertyValueTypeRefPtr);
                                                    v95 = -1;
                                                    if (!permset)
                                                    {
                                                      v98 = acl_delete_perm(*(acl_permset_t *)propertyValueTypeRefPtr, ACL_DELETE_CHILD|ACL_SEARCH);
                                                      v95 = -1;
                                                      if (!v98)
                                                      {
                                                        acl_set_permset(*(acl_entry_t *)&values.ad_name_offset, *(acl_permset_t *)propertyValueTypeRefPtr);
                                                        v95 = -1;
                                                      }
                                                    }
                                                  }
                                                }
                                                else
                                                {
                                                  *(_QWORD *)&values.ad_name_offset = 0;
                                                  *(_QWORD *)propertyValueTypeRefPtr = 0;
                                                  while (1)
                                                  {
                                                    entry = acl_get_entry(v94, v95, (acl_entry_t *)&values);
                                                    if (entry)
                                                      break;
                                                    v99 = acl_get_permset(*(acl_entry_t *)&values.ad_name_offset, (acl_permset_t *)propertyValueTypeRefPtr);
                                                    v95 = -1;
                                                    if (!v99)
                                                    {
                                                      v100 = acl_add_perm(*(acl_permset_t *)propertyValueTypeRefPtr, ACL_EXECUTE);
                                                      v95 = -1;
                                                      if (!v100)
                                                      {
                                                        acl_set_permset(*(acl_entry_t *)&values.ad_name_offset, *(acl_permset_t *)propertyValueTypeRefPtr);
                                                        v95 = -1;
                                                      }
                                                    }
                                                  }
                                                }
                                                if (entry == -1)
                                                {
                                                  if (*__error() == 22)
                                                    entry = 0;
                                                  else
                                                    entry = -1;
                                                }
                                                if (entry)
                                                  goto LABEL_203;
                                              }
                                              v93 = CFFileSecuritySetAccessControlList(v79, accessControlList);
                                              acl_free(accessControlList);
                                              if (!v93)
                                              {
                                                v136 = 0;
                                                goto LABEL_204;
                                              }
LABEL_206:
                                              if (v87)
                                              {
                                                Copy = CFFileSecurityCreateCopy(v58, v79);
                                                v81 = v147;
                                                if (Copy)
                                                {
                                                  v102 = Copy;
                                                  v70 = v130;
                                                  if (CFFileSecuritySetMode(Copy, v88)
                                                    && CFFileSecuritySetGroup(v102, group))
                                                  {
                                                    v136 = (CFStringRef)v102;
                                                  }
                                                  else
                                                  {
                                                    CFRelease(v102);
                                                    v136 = 0;
                                                  }
LABEL_215:
                                                  v157 = 0;
                                                  if (!CFFileSecurityGetMode(v162, &v157) || v157 != mode)
                                                    goto LABEL_233;
                                                  *(_QWORD *)&values.ad_name_offset = 0;
                                                  *(_QWORD *)propertyValueTypeRefPtr = 0;
                                                  v103 = CFFileSecurityCopyAccessControlList(v162, (acl_t *)&values);
                                                  v104 = CFFileSecurityCopyAccessControlList(v79, (acl_t *)propertyValueTypeRefPtr);
                                                  if (v103 | v104)
                                                  {
                                                    v105 = v104;
                                                    if (!v103)
                                                      *(_QWORD *)&values.ad_name_offset = acl_init(0);
                                                    if (!v105)
                                                      *(_QWORD *)propertyValueTypeRefPtr = acl_init(0);
                                                    v106 = acl_size(*(acl_t *)&values.ad_name_offset);
                                                    if (v106 >= 1
                                                      && (v107 = v106,
                                                          v106 == acl_size(*(acl_t *)propertyValueTypeRefPtr)))
                                                    {
                                                      v108 = malloc_type_malloc(v107, 0x509991C8uLL);
                                                      v109 = malloc_type_malloc(v107, 0x302F95CDuLL);
                                                      v110 = v109;
                                                      v111 = 0;
                                                      if (v108 && v109)
                                                        v111 = acl_copy_ext(v108, *(acl_t *)&values.ad_name_offset, v107) >= 1&& acl_copy_ext(v110, *(acl_t *)propertyValueTypeRefPtr, v107) >= 1&& memcmp(v108, v110, v107) == 0;
                                                      free(v108);
                                                      free(v110);
                                                      v81 = v147;
                                                    }
                                                    else
                                                    {
                                                      v111 = 0;
                                                    }
                                                    acl_free(*(void **)&values.ad_name_offset);
                                                    acl_free(*(void **)propertyValueTypeRefPtr);
                                                    if (!v111)
LABEL_233:
                                                      CFDictionaryAddValue(keya, v128, v79);
                                                  }
                                                  v93 = 1;
                                                  v46 = v149;
                                                  goto LABEL_235;
                                                }
                                                v136 = 0;
                                              }
                                              else
                                              {
                                                v136 = 0;
                                                v81 = v147;
                                              }
                                              v70 = v130;
                                              goto LABEL_215;
                                            }
                                            if (CFFileSecuritySetAccessControlList(v79, (acl_t)1))
                                              goto LABEL_206;
                                          }
LABEL_203:
                                          v136 = 0;
                                          v93 = 0;
LABEL_204:
                                          v81 = v147;
                                          v70 = v130;
                                          goto LABEL_235;
                                        }
                                      }
                                      v87 = 0;
                                      v88 = 0;
                                      goto LABEL_181;
                                    }
LABEL_177:
                                    v136 = 0;
                                    v93 = 0;
                                    v81 = v147;
LABEL_235:
                                    CFRelease(v79);
                                    goto LABEL_236;
                                  }
                                  if ((mode & 6) != 0)
                                    v80 = mode & 0xFFB7 | (8 * ((mode & 0x30) != 0)) | (((mode & 0x180) != 0) << 6) | 1;
                                  else
                                    v80 = mode & 0xFFB6 | (8 * ((mode & 0x30) != 0)) | (((mode & 0x180) != 0) << 6);
                                }
                                else
                                {
                                  v80 = mode & 0xFFB6;
                                }
                                mode = v80;
                                goto LABEL_152;
                              }
                              CFRelease(fileSec);
                            }
                            v136 = 0;
                            goto LABEL_332;
                          }
                          LODWORD(MutableCopy) = 0;
                          v35 = 0;
                          v37 = 0;
                          v38 = 0;
                          v18 = 0;
                          code = 12;
LABEL_310:
                          if (v38 || !v36)
                            goto LABEL_314;
                          CFRelease(v36);
                          v36 = 0;
                          goto LABEL_313;
                        }
                        v71 = v137;
                        if (v48 | v49)
                          v71 = 1;
                        if ((v71 & 1) == 0)
                          goto LABEL_127;
                        if (v138)
                          goto LABEL_122;
                        if (CFURLGetFileSystemRepresentation(v149, 1u, (UInt8 *)&values, 1024))
                        {
                          v82 = (const char *)_amkrtemp();
                          if (!v82)
                          {
                            v85 = *__error();
                            goto LABEL_352;
                          }
                          v83 = (UInt8 *)v82;
                          v84 = strlen(v82);
                          v36 = CFURLCreateFromFileSystemRepresentation(allocator, v83, v84, v48);
                          free(v83);
                          if (v36)
                            goto LABEL_123;
                        }
                        v85 = 2;
LABEL_352:
                        code = v85;
                        v18 = (const __CFURL *)CFRetain(url);
                        LODWORD(MutableCopy) = 0;
                        v35 = 0;
                        v36 = 0;
                        v37 = 0;
                        v38 = 0;
                        a3 = v142;
                        a8 = v143;
                        goto LABEL_314;
                      }
LABEL_64:
                      LODWORD(MutableCopy) = 0;
                      v35 = 0;
                      v36 = 0;
                      v37 = 0;
                      v38 = 0;
                      v18 = 0;
                      goto LABEL_69;
                    }
                  }
                  else
                  {
                    CFRelease(*(CFTypeRef *)&values.ad_name_offset);
                  }
                }
                v52 = 18;
                goto LABEL_67;
              }
              v92 = 13;
              goto LABEL_173;
            }
            v35 = 0;
            v36 = 0;
            v37 = 0;
            v38 = 0;
          }
          else
          {
            v35 = 0;
            v36 = 0;
            v37 = 0;
          }
          v18 = 0;
        }
        else
        {
          v35 = 0;
          v36 = 0;
          v37 = 0;
          v38 = 0;
          v18 = 0;
          error = CFErrorCreate(allocator, domain, 12, 0);
        }
LABEL_175:
        LODWORD(MutableCopy) = 1;
        goto LABEL_69;
      }
      LODWORD(MutableCopy) = 0;
      v35 = 0;
      v36 = 0;
      v37 = 0;
      v18 = 0;
    }
    else
    {
      v35 = 0;
      v36 = 0;
      v37 = 0;
      v38 = 0;
      v18 = 0;
      error = CFErrorCreate(allocator, domain, 12, 0);
    }
    a3 = v142;
    a8 = v143;
    goto LABEL_69;
  }
  if (a4)
  {
LABEL_14:
    value = v14;
    v147 = (void *)v16;
    allocator = MutableCopy;
    v34 = CFErrorCreate(MutableCopy, (CFErrorDomain)*MEMORY[0x1E0C9AFC8], -50, 0);
    LODWORD(MutableCopy) = 0;
    v35 = 0;
    v36 = 0;
    v37 = 0;
    v38 = 0;
    v18 = 0;
    error = v34;
  }
  else
  {
    if (_RenameURL(MutableCopy, (CFURLRef)a3, v14, &error))
    {
      if (a7)
        *a7 = CFRetain(v14);
      v54 = (const __CFURL *)_CFURLPromiseCopyPhysicalURL();
      if (!v54)
      {
        v56 = 0;
        v18 = 0;
        v36 = 0;
        v35 = 1;
        goto LABEL_99;
      }
      v55 = v54;
      TransferDocumentIdentifier(v54, v14);
      v56 = 0;
      v18 = 0;
      v36 = 0;
      v57 = 1;
LABEL_98:
      CFRelease(v55);
      v35 = v57;
      goto LABEL_99;
    }
    allocator = MutableCopy;
    value = v14;
    v147 = (void *)v16;
    LODWORD(MutableCopy) = 0;
    v35 = 0;
    v36 = 0;
    v37 = 0;
    v38 = 0;
    v18 = 0;
  }
LABEL_71:
  v56 = 0;
  if (!a8 || (_DWORD)v35)
  {
    v14 = value;
    v16 = v147;
    goto LABEL_99;
  }
  v62 = error;
  if (!error)
  {
    if (v18)
    {
      *(_QWORD *)&values.ad_name_offset = CFSTR("NSURL");
      *(_QWORD *)propertyValueTypeRefPtr = v18;
      v62 = CFErrorCreateWithUserInfoKeysAndValues(allocator, domain, code, (const void *const *)&values, (const void *const *)propertyValueTypeRefPtr, 1);
    }
    else
    {
      v62 = CFErrorCreate(allocator, domain, code, 0);
    }
    error = v62;
  }
  if (v37 | MutableCopy)
  {
    code = 512;
  }
  else
  {
    if (v62)
    {
      v63 = CFErrorGetDomain(v62);
      v64 = CFErrorGetCode(error);
      v65 = v63;
    }
    else
    {
      v64 = code;
      v65 = domain;
    }
    _FSURLTranslateDomainAndCodeToCocoaError(v65, v64, 1, &code);
  }
  v66 = (const __CFString *)*MEMORY[0x1E0C9AFB8];
  Mutable = CFDictionaryCreateMutable(allocator, 0, MEMORY[0x1E0C9B390], MEMORY[0x1E0C9B3A0]);
  v55 = Mutable;
  if (Mutable)
  {
    CFDictionarySetValue(Mutable, CFSTR("NSURL"), value);
    if (v147)
      CFDictionarySetValue(v55, CFSTR("NSFileOriginalItemLocationKey"), v147);
    CFDictionarySetValue(v55, CFSTR("NSFileNewItemLocationKey"), v148);
    if (v38 && v36)
      CFDictionarySetValue(v55, CFSTR("NSFileBackupItemLeftBehindLocationKey"), v36);
    if (error)
      CFDictionarySetValue(v55, (const void *)*MEMORY[0x1E0C9B000], error);
    if (v37)
      CFDictionarySetValue(v55, CFSTR("NSUserStringVariant"), CFSTR("Backup"));
  }
  v68 = CFErrorCreate(allocator, v66, code, v55);
  *a8 = v68;
  if (!v68)
    *a8 = CFErrorCreate(allocator, v66, 512, 0);
  v57 = 0;
  v35 = 0;
  v56 = 1;
  v14 = value;
  v16 = v147;
  if (v55)
    goto LABEL_98;
LABEL_99:
  if (error)
    CFRelease(error);
  if (v18)
    CFRelease(v18);
  if (v16)
    CFRelease(v16);
  CFRelease(v148);
  if (v36)
    CFRelease(v36);
  CFURLClearResourcePropertyCache(v14);
  CFURLClearResourcePropertyCache((CFURLRef)a3);
  if (v56 && !*a8)
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      _URLReplaceObject_cold_1();
    *a8 = CFErrorCreate((CFAllocatorRef)*MEMORY[0x1E0C9AE00], (CFErrorDomain)*MEMORY[0x1E0C9AFB8], 256, 0);
  }
  return v35;
}

uint64_t _RenameURL(const __CFAllocator *a1, CFURLRef url, const __CFURL *a3, __CFError **a4)
{
  const __CFURL *v6;
  std::error_code *v8;
  int v9;
  int v10;
  uint64_t result;
  __CFError *v12;
  std::__fs::filesystem::path v13[42];
  std::__fs::filesystem::path buffer[42];
  uint64_t v15;

  v6 = url;
  v15 = *MEMORY[0x1E0C80C00];
  if (CFURLGetFileSystemRepresentation(url, 1u, (UInt8 *)buffer, 1024))
  {
    if (!CFURLGetFileSystemRepresentation(a3, 1u, (UInt8 *)v13, 1024))
    {
      v10 = 2;
      v6 = a3;
      if (a4)
        goto LABEL_8;
      return 0;
    }
    rename(buffer, v13, v8);
    if (!v9)
      return 1;
    v10 = *__error();
    if (!v10)
      return 1;
  }
  else
  {
    v10 = 2;
  }
  if (a4)
  {
LABEL_8:
    v12 = _FSURLCreateStandardError(a1, (const __CFString *)*MEMORY[0x1E0C9AFD0], v10, 1, (const __CFString *)v6, 0);
    result = 0;
    *a4 = v12;
    return result;
  }
  return 0;
}

void TransferDocumentIdentifier(const __CFURL *a1, const __CFURL *a2)
{
  BOOL v4;
  int v5;
  CFTypeRef propertyValueTypeRefPtr;
  UInt8 v7[1024];
  UInt8 buffer[1024];
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  propertyValueTypeRefPtr = 0;
  if (CFURLCopyResourcePropertyForKey(a1, (CFStringRef)*MEMORY[0x1E0C9B418], &propertyValueTypeRefPtr, 0))
    v4 = propertyValueTypeRefPtr == 0;
  else
    v4 = 1;
  if (!v4)
  {
    if (CFURLGetFileSystemRepresentation(a1, 1u, buffer, 1024)
      && CFURLGetFileSystemRepresentation(a2, 1u, v7, 1024))
    {
      v5 = open((const char *)v7, 0);
      if ((v5 & 0x80000000) == 0)
      {
        fsctl((const char *)buffer, 0x80046820uLL, &v5, 0);
        close(v5);
      }
    }
    CFRelease(propertyValueTypeRefPtr);
  }
}

uint64_t _URLIsDirectory(const __CFURL *a1, BOOL *a2, CFErrorRef *error)
{
  uint64_t v4;
  const void *v5;
  const void *propertyValueTypeRefPtr;

  propertyValueTypeRefPtr = 0;
  v4 = CFURLCopyResourcePropertyForKey(a1, (CFStringRef)*MEMORY[0x1E0C9B4E0], &propertyValueTypeRefPtr, error);
  if ((_DWORD)v4)
  {
    v5 = propertyValueTypeRefPtr;
    *a2 = propertyValueTypeRefPtr == (const void *)*MEMORY[0x1E0C9AE50];
    CFRelease(v5);
  }
  else
  {
    *a2 = 0;
  }
  return v4;
}

uint64_t _URLIsFile(const __CFURL *a1, BOOL *a2, CFErrorRef *error)
{
  uint64_t v4;
  const void *v5;
  const void *propertyValueTypeRefPtr;

  propertyValueTypeRefPtr = 0;
  v4 = CFURLCopyResourcePropertyForKey(a1, (CFStringRef)*MEMORY[0x1E0C9B520], &propertyValueTypeRefPtr, error);
  if ((_DWORD)v4)
  {
    v5 = propertyValueTypeRefPtr;
    *a2 = propertyValueTypeRefPtr == (const void *)*MEMORY[0x1E0C9AE50];
    CFRelease(v5);
  }
  else
  {
    *a2 = 0;
  }
  return v4;
}

uint64_t _URLIsLocked(const __CFURL *a1, BOOL *a2, CFErrorRef *error)
{
  uint64_t v6;
  const void *v7;
  const void *v8;
  CFTypeRef cf;
  const void *propertyValueTypeRefPtr;

  cf = 0;
  propertyValueTypeRefPtr = 0;
  *a2 = 0;
  v6 = CFURLCopyResourcePropertyForKey(a1, (CFStringRef)*MEMORY[0x1E0C9B538], &cf, error);
  if ((_DWORD)v6)
  {
    v7 = (const void *)*MEMORY[0x1E0C9AE50];
    if (cf == (CFTypeRef)*MEMORY[0x1E0C9AE50])
    {
      *a2 = 1;
    }
    else if (_CFGetEUID())
    {
      v6 = CFURLCopyResourcePropertyForKey(a1, (CFStringRef)*MEMORY[0x1E0C9B548], &propertyValueTypeRefPtr, error);
      if ((_DWORD)v6)
      {
        v8 = propertyValueTypeRefPtr;
        *a2 = propertyValueTypeRefPtr == v7;
        CFRelease(v8);
      }
    }
    CFRelease(cf);
  }
  return v6;
}

uint64_t _RemoveObjectAtURL(const __CFAllocator *a1, CFURLRef url, __CFError **a3)
{
  uint64_t v6;
  int v7;
  UInt8 buffer[1024];
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  if (!CFURLGetFileSystemRepresentation(url, 1u, buffer, 1024))
  {
    v7 = 2;
    if (a3)
      goto LABEL_5;
    return 0;
  }
  v6 = 1;
  if (removefile((const char *)buffer, 0, 1u))
  {
    v7 = *__error();
    if (v7)
    {
      if (a3)
      {
LABEL_5:
        v6 = 0;
        *a3 = _FSURLCreateStandardError(a1, (const __CFString *)*MEMORY[0x1E0C9AFD0], v7, 1, (const __CFString *)url, 0);
        return v6;
      }
      return 0;
    }
  }
  return v6;
}

uint64_t _HardLinkURL(const __CFAllocator *a1, CFURLRef url, const __CFURL *a3, __CFError **a4)
{
  const __CFURL *v6;
  int v8;
  uint64_t result;
  __CFError *v10;
  UInt8 v11[1024];
  UInt8 buffer[1024];
  uint64_t v13;

  v6 = url;
  v13 = *MEMORY[0x1E0C80C00];
  if (CFURLGetFileSystemRepresentation(url, 1u, buffer, 1024))
  {
    if (!CFURLGetFileSystemRepresentation(a3, 1u, v11, 1024))
    {
      v8 = 2;
      v6 = a3;
      if (a4)
        goto LABEL_8;
      return 0;
    }
    if (!link((const char *)buffer, (const char *)v11))
      return 1;
    v8 = *__error();
    if (!v8)
      return 1;
  }
  else
  {
    v8 = 2;
  }
  if (a4)
  {
LABEL_8:
    v10 = _FSURLCreateStandardError(a1, (const __CFString *)*MEMORY[0x1E0C9AFD0], v8, 1, (const __CFString *)v6, 0);
    result = 0;
    *a4 = v10;
    return result;
  }
  return 0;
}

uint64_t TransferExtendedAttributes(const __CFAllocator *a1, CFURLRef url, const __CFURL *a3, __CFError **a4)
{
  const __CFURL *v6;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  ssize_t v11;
  ssize_t v12;
  int v13;
  char *v14;
  const char *v15;
  int v16;
  ssize_t v17;
  size_t v18;
  char *v19;
  ssize_t v20;
  int v22;
  __CFError *v23;
  char v24[512];
  UInt8 v25[1024];
  UInt8 v26[1024];
  uint64_t v27;

  v6 = url;
  v27 = *MEMORY[0x1E0C80C00];
  if (!CFURLGetFileSystemRepresentation(url, 1u, v26, 1024))
  {
    v22 = 2;
    goto LABEL_26;
  }
  v8 = CFURLGetFileSystemRepresentation(a3, 1u, v25, 1024);
  if (!(_DWORD)v8)
  {
    v22 = 2;
LABEL_25:
    v6 = a3;
    goto LABEL_26;
  }
  MEMORY[0x1E0C80A78](v8);
  v9 = v24;
  memset(v24, 0, sizeof(v24));
  v10 = 1;
  v11 = listxattr((const char *)v26, v24, 0x200uLL, 1);
  if (!v11)
    return v10;
  v12 = v11;
  if ((v11 & 0x8000000000000000) == 0)
  {
    v13 = 0;
    v14 = &v24[v11];
    goto LABEL_6;
  }
  if (*__error() != 34)
  {
    v13 = 0;
LABEL_23:
    a3 = 0;
    v22 = *__error();
    if (v13)
LABEL_24:
      free(v9);
    goto LABEL_25;
  }
  v17 = listxattr((const char *)v26, 0, 0, 1);
  if (!v17)
    return v10;
  if (v17 <= 0 || (v18 = v17 + 4096, (v19 = (char *)malloc_type_malloc(v17 + 4096, 0x98429E16uLL)) == 0))
  {
    v22 = *__error();
LABEL_26:
    if (!a4)
      return 0;
    v23 = _FSURLCreateStandardError(a1, (const __CFString *)*MEMORY[0x1E0C9AFD0], v22, 1, (const __CFString *)v6, 0);
    v10 = 0;
    *a4 = v23;
    return v10;
  }
  v9 = v19;
  v13 = 1;
  v20 = listxattr((const char *)v26, v19, v18, 1);
  if (v20 < 0)
    goto LABEL_23;
  if (v20)
  {
    v14 = &v9[v20];
LABEL_6:
    v15 = v9;
    while (1)
    {
      if (xattr_preserve_for_intent(v15, 2u))
      {
        v16 = copyExtendedAttribute((const char *)v26, (const char *)v25, v15);
        if (v16)
          break;
      }
      v15 += strlen(v15) + 1;
      if (v15 >= v14)
      {
        if ((v12 & 0x8000000000000000) == 0)
          return 1;
        goto LABEL_19;
      }
    }
    v22 = v16;
    if (v13)
      goto LABEL_24;
    goto LABEL_25;
  }
LABEL_19:
  free(v9);
  return 1;
}

uint64_t copyExtendedAttribute(const char *a1, const char *path, const char *name)
{
  ssize_t v6;
  uint64_t v7;
  _BYTE *v8;
  ssize_t v9;
  ssize_t v10;
  int v11;
  ssize_t v12;
  size_t v13;
  _BYTE *v14;
  _BYTE v16[520];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v6 = getxattr(path, name, 0, 0, 0, 1);
  v7 = 0;
  if ((v6 & 0x8000000000000000) == 0)
    return v7;
  MEMORY[0x1E0C80A78](v6);
  v8 = v16;
  memset(v16, 0, 512);
  v9 = getxattr(a1, name, v16, 0x200uLL, 0, 1);
  if (v9 < 0)
  {
    if (*__error() != 34)
    {
      v11 = 0;
LABEL_13:
      v7 = *__error();
      if (!v11)
        return v7;
      goto LABEL_10;
    }
    v12 = getxattr(a1, name, 0, 0, 0, 1);
    if (v12 < 0)
      return *__error();
    v13 = v12 + 4096;
    v14 = malloc_type_malloc(v12 + 4096, 0xF204A2EDuLL);
    if (!v14)
      return 4294967188;
    v8 = v14;
    v11 = 1;
    v10 = getxattr(a1, name, v14, v13, 0, 1);
    if (v10 < 0)
      goto LABEL_13;
  }
  else
  {
    v10 = v9;
    v11 = 0;
  }
  v7 = 0;
  if (setxattr(path, name, v8, v10, 0, 1))
    goto LABEL_13;
  if (v11)
LABEL_10:
    free(v8);
  return v7;
}

uint64_t MountInfoPrepareWithMountPointString()
{
  return 1;
}

uint64_t PosixToOSStatusTranslate(int a1)
{
  int v2;

  if (a1 >= -1)
  {
    while (2)
    {
      if (a1 <= 62)
      {
        v2 = a1 + 1;
        LOWORD(a1) = 0;
        switch(v2)
        {
          case 0:
            if (*__error() == -1)
              goto LABEL_18;
            a1 = *__error();
            if (a1 < -1)
              return (__int16)a1;
            continue;
          case 1:
            return (__int16)a1;
          case 2:
          case 14:
            LOWORD(a1) = -5000;
            return (__int16)a1;
          case 3:
            LOWORD(a1) = -43;
            return (__int16)a1;
          case 10:
            LOWORD(a1) = -51;
            return (__int16)a1;
          case 13:
          case 24:
            LOWORD(a1) = -41;
            return (__int16)a1;
          case 17:
            goto LABEL_15;
          case 18:
            LOWORD(a1) = -48;
            return (__int16)a1;
          case 19:
            LOWORD(a1) = -1303;
            return (__int16)a1;
          case 21:
            LOWORD(a1) = -1407;
            return (__int16)a1;
          case 23:
            LOWORD(a1) = -50;
            return (__int16)a1;
          case 25:
            LOWORD(a1) = -42;
            return (__int16)a1;
          case 28:
            LOWORD(a1) = -1309;
            return (__int16)a1;
          case 29:
            LOWORD(a1) = -34;
            return (__int16)a1;
          case 31:
            LOWORD(a1) = -61;
            return (__int16)a1;
          default:
            goto LABEL_18;
        }
      }
      break;
    }
    if (a1 <= 68)
    {
      if (a1 == 63)
      {
        LOWORD(a1) = -37;
        return (__int16)a1;
      }
      if (a1 == 66)
      {
LABEL_15:
        LOWORD(a1) = -47;
        return (__int16)a1;
      }
    }
    else
    {
      switch(a1)
      {
        case 'E':
          LOWORD(a1) = -1425;
          return (__int16)a1;
        case 'P':
          LOWORD(a1) = -5023;
          return (__int16)a1;
        case 'Y':
          LOWORD(a1) = -128;
          return (__int16)a1;
      }
    }
LABEL_18:
    LOWORD(a1) = -36;
  }
  return (__int16)a1;
}

uint64_t CreateMountPointArray(const __CFAllocator *a1, char a2, char **a3, _QWORD *a4)
{
  int v8;
  unsigned int v9;
  char *v10;
  unint64_t v11;
  uint64_t v12;
  uint64_t v13;
  __int128 v15;
  uint64_t v16;
  _OWORD v17[2];
  int v18;
  statfs *v19;

  *a4 = 0;
  v19 = 0;
  v8 = getmntinfo_r_np(&v19, 2);
  if (v8 < 1)
  {
    v10 = 0;
    v13 = *__error();
  }
  else
  {
    v9 = v8;
    v10 = (char *)CFAllocatorAllocate(a1, (unint64_t)v8 << 10, 0);
    if (v10)
    {
      v11 = 0;
      v12 = 2168 * v9;
      do
      {
        if ((a2 & 2) == 0 || (v19[v11 / 0x878].f_flags & 0x500000) == 0)
        {
          v15 = xmmword_1817D5490;
          v16 = 0;
          memset(v17, 0, sizeof(v17));
          v18 = 0;
          if (!filtered_getattrlist(v19[v11 / 0x878].f_mntonname, &v15, v17, 0x24uLL, 1u)
            && strlcpy(&v10[1024 * *a4], v19[v11 / 0x878].f_mntonname, 0x400uLL) <= 0x3FF)
          {
            ++*a4;
          }
        }
        v11 += 2168;
      }
      while (v12 != v11);
      v13 = 0;
    }
    else
    {
      v13 = 12;
    }
    free(v19);
  }
  *a3 = v10;
  return v13;
}

uint64_t ConvertCFAbsoluteTimeToUTCDateTime(uint64_t a1, double a2)
{
  double v2;
  unint64_t v3;
  unint64_t v4;
  unint64_t v5;
  uint64_t v6;
  double v9;
  BOOL v10;

  if (!a1)
    return 4294967246;
  v2 = a2 + 3061152000.0;
  if (v2 <= 9.22337204e18)
  {
    if (v2 >= -9.22337204e18)
    {
      if (v2 < 0.0)
        goto LABEL_9;
      if (v2 > -0.5 && v2 < 0.5)
        v3 = 0;
      else
        v3 = (unint64_t)v2;
      if (v3 > 0xFFFFFFFFFFFELL)
        goto LABEL_4;
    }
    else
    {
      if (v2 < 0.0)
        goto LABEL_9;
      v3 = 0;
    }
    v5 = HIDWORD(v3);
    v9 = v2 * 65536.0 + 0.5;
    if (v9 <= 9.22337204e18)
    {
      if (v9 >= -9.22337204e18 && (v9 < 0.5 ? (v10 = v9 <= -0.5) : (v10 = 1), v10))
        v4 = (unint64_t)v9;
      else
        LOWORD(v4) = 0;
    }
    else
    {
      LOWORD(v4) = -1;
    }
    goto LABEL_10;
  }
  if (v2 < 0.0)
  {
LABEL_9:
    LOWORD(v4) = 0;
    LODWORD(v3) = 0;
    LOWORD(v5) = 0;
    goto LABEL_10;
  }
LABEL_4:
  LODWORD(v3) = -1;
  LOWORD(v4) = -1;
  LOWORD(v5) = -1;
LABEL_10:
  v6 = 0;
  *(_WORD *)a1 = v5;
  *(_DWORD *)(a1 + 2) = v3;
  *(_WORD *)(a1 + 6) = v4;
  return v6;
}

void ___ZL15CreateMountInfoiP12MountInfoBuf_block_invoke_2()
{
  atomic_store(1u, sEntriesChanged);
}

uint64_t SetWithFileProvider(const __CFURL *a1, const __CFString *a2, const void *a3, __CFError **a4, double a5)
{
  double Helper_x8__FPCFSetAttributeValueForItem;
  uint64_t v6;

  Helper_x8__FPCFSetAttributeValueForItem = gotLoadHelper_x8__FPCFSetAttributeValueForItem(a5);
  if (*(_QWORD *)(v6 + 1736))
    return FPCFSetAttributeValueForItem_delayInitStub(Helper_x8__FPCFSetAttributeValueForItem);
  else
    return 1;
}

uint64_t GetFromCFURLPromises(const __CFURL *a1, const void *a2, const void **a3, __CFError **a4)
{
  return _CFURLPromiseCopyResourcePropertyForKey();
}

uint64_t SetWithCFURLPromises(const __CFURL *a1, const __CFString *a2, const void *a3, __CFError **a4)
{
  return _CFURLPromiseSetResourcePropertyForKey();
}

uint64_t GetFromQuickLook(const __CFURL *a1, const void *a2, const void **a3, __CFError **a4, double a5)
{
  double Helper_x8___QLCopyResourcePropertyForKey;
  uint64_t v6;

  Helper_x8___QLCopyResourcePropertyForKey = gotLoadHelper_x8___QLCopyResourcePropertyForKey(a5);
  if (*(_QWORD *)(v6 + 896))
  {
    return _QLCopyResourcePropertyForKey_delayInitStub(Helper_x8___QLCopyResourcePropertyForKey);
  }
  else
  {
    *a3 = 0;
    return 1;
  }
}

uint64_t SetWithQuickLook(const __CFURL *a1, const __CFString *a2, const void *a3, __CFError **a4, double a5)
{
  double Helper_x8___QLSetResourcePropertyForKey;
  uint64_t v6;

  Helper_x8___QLSetResourcePropertyForKey = gotLoadHelper_x8___QLSetResourcePropertyForKey(a5);
  if (*(_QWORD *)(v6 + 904))
    return _QLSetResourcePropertyForKey_delayInitStub(Helper_x8___QLSetResourcePropertyForKey);
  else
    return 1;
}

uint64_t ExternalProviderSetValues(uint64_t a1, uint64_t a2, _QWORD *a3, _QWORD *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v9;
  uint64_t (*v14)(uint64_t, _QWORD, _QWORD, uint64_t);
  uint64_t result;

  if (a6 < 1)
    return 1;
  v9 = a6;
  while (1)
  {
    v14 = *(uint64_t (**)(uint64_t, _QWORD, _QWORD, uint64_t))(*(_QWORD *)a5 + 24);
    if (v14)
    {
      result = v14(a1, *a3, *a4, a8);
      if (!(_DWORD)result)
        break;
    }
    a5 += 8;
    ++a4;
    ++a3;
    if (!--v9)
      return 1;
  }
  return result;
}

uint64_t _CFURLCopySecurityEAs()
{
  return 0;
}

CFDataRef _URLCopySecurityScopeFromFileURL(CFDataRef result)
{
  const __CFURL *v1;
  SandboxExtensionCache *v2;
  CFTypeID v3;
  CFTypeID TypeID;
  const __CFData *propertyValueTypeRefPtr;

  propertyValueTypeRefPtr = 0;
  if (result)
  {
    v1 = result;
    if (!_CFURLIsFileURL())
      return 0;
    result = (CFDataRef)CFURLCopyResourcePropertyForKey(v1, CFSTR("_NSURLSecuritySandboxExtensionKey"), &propertyValueTypeRefPtr, 0);
    if ((_DWORD)result && (result = propertyValueTypeRefPtr) != 0
      || (v2 = (SandboxExtensionCache *)SandboxExtensionCache::shared(result),
          result = SandboxExtensionCache::copyExtensionForURL(v2, v1),
          (propertyValueTypeRefPtr = result) != 0))
    {
      v3 = CFGetTypeID(result);
      TypeID = CFDataGetTypeID();
      result = propertyValueTypeRefPtr;
      if (v3 != TypeID)
      {
        CFRelease(propertyValueTypeRefPtr);
        return 0;
      }
    }
  }
  return result;
}

uint64_t _FSGetTypeInfoFromStatfs(uint64_t a1, char *a2, size_t a3, _DWORD *a4)
{
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t result;
  char __source[16];
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  if (!check_mntfromname((const char *)(a1 + 72)))
  {
    __strlcpy_chk();
    if (!a2)
      goto LABEL_10;
    goto LABEL_9;
  }
  v8 = a1 + 1112;
  v9 = strstr((char *)(a1 + 1112), "://");
  if (!v9)
    return 22;
  if ((unint64_t)&v9[-v8] >= 0xF)
    v10 = 15;
  else
    v10 = (uint64_t)&v9[-v8];
  __memcpy_chk();
  __source[v10] = 0;
  if (a2)
LABEL_9:
    strlcpy(a2, __source, a3);
LABEL_10:
  result = 0;
  if (a4)
    *a4 = *(_DWORD *)(a1 + 68);
  return result;
}

BOOL check_mntfromname(const char *a1)
{
  return !strcmp(a1, "lifs") || strcmp(a1, "fskit") == 0;
}

uint64_t _FSGetTypeInfoForPath(const char *a1, char *a2, size_t a3, _DWORD *a4)
{
  statfs v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  memset(&v8, 0, 512);
  if (statfs(a1, &v8) == -1)
    return *__error();
  else
    return _FSGetTypeInfoFromStatfs((uint64_t)&v8, a2, a3, a4);
}

uint64_t _FSGetTypeInfoForFileDescriptor(int a1, char *a2, size_t a3, _DWORD *a4)
{
  statfs v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  memset(&v8, 0, 512);
  if (fstatfs(a1, &v8) == -1)
    return *__error();
  else
    return _FSGetTypeInfoFromStatfs((uint64_t)&v8, a2, a3, a4);
}

uint64_t _FSGetLocationFromStatfs(uint64_t a1, char *a2, size_t a3)
{
  void *v6;
  void *v7;
  char *v8;
  char *v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;

  v6 = malloc_type_calloc(1uLL, 0x400uLL, 0x1359B406uLL);
  if (v6)
  {
    v7 = v6;
    if (check_mntfromname((const char *)(a1 + 72)))
    {
      v8 = strstr((char *)(a1 + 1112), "://");
      if (!v8 || (v9 = v8 + 3, (v10 = strchr(v8 + 3, 47)) == 0))
      {
        v12 = 22;
LABEL_17:
        free(v7);
        return v12;
      }
      if (v10 - v9 >= 1023)
        v11 = 1023;
      else
        v11 = v10 - v9;
      __memcpy_chk();
      *((_BYTE *)v7 + v11) = 0;
      if (!a2)
      {
LABEL_16:
        v12 = 0;
        goto LABEL_17;
      }
    }
    else
    {
      if (strncmp((const char *)(a1 + 1112), "/dev/disk", 9uLL))
        strncmp((const char *)(a1 + 1112), "/dev/rdisk", 0xAuLL);
      __strlcpy_chk();
      if (!a2)
        goto LABEL_16;
    }
    strlcpy(a2, (const char *)v7, a3);
    goto LABEL_16;
  }
  return 12;
}

uint64_t _FSGetLocationForPath(const char *a1, char *a2, size_t a3)
{
  statfs v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  memset(&v6, 0, 512);
  if (statfs(a1, &v6) == -1)
    return *__error();
  else
    return _FSGetLocationFromStatfs((uint64_t)&v6, a2, a3);
}

uint64_t _FSGetLocationForFileDescriptor(int a1, char *a2, size_t a3)
{
  statfs v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  memset(&v6, 0, 512);
  if (fstatfs(a1, &v6) == -1)
    return *__error();
  else
    return _FSGetLocationFromStatfs((uint64_t)&v6, a2, a3);
}

void BookmarkData::BookmarkData(uint64_t a1, NSObject *a2)
{
  int v2;
  const char *v3;
  __int16 v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v2 = 136315394;
  v3 = "BookmarkData";
  v4 = 2080;
  v5 = a1;
  _os_log_error_impl(&dword_1817A6000, a2, OS_LOG_TYPE_ERROR, "%s: %s", (uint8_t *)&v2, 0x16u);
}

void BookmarkData::copyItem(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 134349056;
  v3 = a1;
  _os_log_error_impl(&dword_1817A6000, a2, OS_LOG_TYPE_ERROR, "BookmarkData: Corrupt bookmark file; container dataItemPtr %{public}p already used",
    (uint8_t *)&v2,
    0xCu);
}

void BookmarkMutableData::Finalize()
{
  __assert_rtn("Finalize", "BookmarkData.cpp", 1672, "scopeKeyLength == kBookmarkSecurityScopeCookieSize");
}

void __CFURLCreateBookmarkData(os_log_t log)
{
  int v1;
  const char *v2;
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  v1 = 136315138;
  v2 = "__CFURLCreateBookmarkData";
  _os_log_error_impl(&dword_1817A6000, log, OS_LOG_TYPE_ERROR, "%s: NULL result with no real error", (uint8_t *)&v1, 0xCu);
}

void _FileCacheCopyDebugDesc()
{
  __assert_rtn("_FileCacheCopyDebugDesc", "FileCache.cp", 219, "formatter != NULL");
}

{
  __assert_rtn("_FileCacheCopyDebugDesc", "FileCache.cp", 223, "result != NULL");
}

void _CFURLCreateBookmarkDataFromFile_cold_1()
{
  uint8_t v0[16];

  *(_WORD *)v0 = 0;
  _os_log_error_impl(&dword_1817A6000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "_URLCreateByResolvingAliasFile: NULL result with no real error", v0, 2u);
}

void _CFURLWriteBookmarkDataToFile_cold_1(uint64_t a1, uint64_t a2, os_log_t log)
{
  int v3;
  uint64_t v4;
  __int16 v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v3 = 138412546;
  v4 = a1;
  v5 = 2112;
  v6 = a2;
  _os_log_error_impl(&dword_1817A6000, log, OS_LOG_TYPE_ERROR, "FAILED creating bookmark file at %@, error=%@", (uint8_t *)&v3, 0x16u);
}

void _CFURLWriteBookmarkDataToFile_cold_2(uint64_t a1, uint64_t a2, os_log_t log)
{
  int v3;
  const char *v4;
  __int16 v5;
  uint64_t v6;
  __int16 v7;
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v3 = 136315650;
  v4 = "_CFURLWriteBookmarkDataToFile";
  v5 = 2114;
  v6 = a1;
  v7 = 2114;
  v8 = a2;
  _os_log_error_impl(&dword_1817A6000, log, OS_LOG_TYPE_ERROR, "%s: destination URL %{public}@ exists but does not point to a valid file, so exiting with an error %{public}@", (uint8_t *)&v3, 0x20u);
}

void _CFURLCreateByResolvingBookmarkData_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_10(&dword_1817A6000, a1, a3, "%s: NULL result with no real error", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_2();
}

void _CFURLCreateByResolvingBookmarkData_cold_2(uint64_t a1, NSObject *a2)
{
  int v2;
  const char *v3;
  __int16 v4;
  uint64_t v5;
  __int16 v6;
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v2 = 136315650;
  v3 = "_CFURLCreateByResolvingBookmarkData";
  v4 = 2048;
  v5 = a1;
  v6 = 2112;
  v7 = a1;
  _os_log_debug_impl(&dword_1817A6000, a2, OS_LOG_TYPE_DEBUG, "%s: returning <%p %@>", (uint8_t *)&v2, 0x20u);
}

void createByResolvingBookmarkDataInternal()
{
  void *v0;
  os_log_t v1;
  os_log_type_t v2;
  const char *v3;
  uint8_t *v4;

  OUTLINED_FUNCTION_11();
  _os_log_debug_impl(v0, v1, v2, v3, v4, 0x2Au);
}

{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_1(&dword_1817A6000, v0, v1, "Consuming sandbox extension in bookmark: %s", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

void CFURLCreateByResolvingDataInBookmark()
{
  void *v0;
  os_log_t v1;
  os_log_type_t v2;
  const char *v3;
  uint8_t *v4;

  OUTLINED_FUNCTION_11();
  _os_log_debug_impl(v0, v1, v2, v3, v4, 0x1Cu);
}

{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0(&dword_1817A6000, v0, v1, "8. Trying to find target at depth 1 solely by documentID on matched volumes.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_12();
  OUTLINED_FUNCTION_9(&dword_1817A6000, v0, v1, " -- trying to match by relative path from fileIDsRef=%@ volumeURL=%@");
  OUTLINED_FUNCTION_2();
}

{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0(&dword_1817A6000, v0, v1, "7. Trying to find target by fileID and partial paths, to deal with renamed parent items.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0(&dword_1817A6000, v0, v1, "6. Trying to find target solely by fileID on matched volumes.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_12();
  OUTLINED_FUNCTION_9(&dword_1817A6000, v0, v1, "5b. Trying to find by partial paths on volume by mount path, partialPath=%@ maybeURL=%@");
  OUTLINED_FUNCTION_2();
}

{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0(&dword_1817A6000, v0, v1, "5. Trying to match by partial path across all of the volumes(in case the volume it was on got renamed.)", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0(&dword_1817A6000, v0, v1, "3. - Trying to match by relative path on current boot volume.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_1(&dword_1817A6000, v0, v1, "3. Original item was on the boot drive, so looking for an item by relative path on the current boot drive.  path=%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0(&dword_1817A6000, v0, v1, "2. Bookmark was to a volume, so try to just find a matching volume.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0(&dword_1817A6000, v0, v1, "Checking for home-directory relative match by relative path", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_1(&dword_1817A6000, v0, v1, "Bookmark was to home directory, so trying %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_1(&dword_1817A6000, v0, v1, "Trying relative to bookmark user's home directory: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0(&dword_1817A6000, v0, v1, "Checking for home-directory match by relative path for current user ", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_1(&dword_1817A6000, v0, v1, "Trying relative to current home directory: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0(&dword_1817A6000, v0, v1, "1. Original item was in a home folder, so look for an item in the home directory.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0(&dword_1817A6000, v0, v1, " -- got userCanceledErr from mount attempt, making further resolution for this bookmark fail.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_1(&dword_1817A6000, v0, v1, " -- Returning volumeURLRef=%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_1(&dword_1817A6000, v0, v1, " -- Attempting to find already mounted URLMount volume item, at url %@ which is needed for bookmark resolution.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_1(&dword_1817A6000, v0, v1, " -- Attempting to mount(or find already mounted) possible network filesystem item, at path %@ which is needed for bookmark resolution.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

{
  void *v0;
  os_log_t v1;
  os_log_type_t v2;
  const char *v3;
  uint8_t *v4;

  OUTLINED_FUNCTION_11();
  _os_log_debug_impl(v0, v1, v2, v3, v4, 0xCu);
  OUTLINED_FUNCTION_2();
}

{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0(&dword_1817A6000, v0, v1, "-. Pruning array of potential volumes based on information in the bookmark.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_1(&dword_1817A6000, v0, v1, "Bookmark was to an item on the boot drive, which appears to match the current boot drive by UUID, so using that volume. uuid=%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_1(&dword_1817A6000, v0, v1, "Bookmark was to an item on the boot drive, which does not appear to match the current boot drive by UUID.  Saved uuid=%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0(&dword_1817A6000, v0, v1, "-. Constructing array of potential volumes to be considered for items in this bookmark.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

void CFURLCreateByResolvingDataInBookmark(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_5(&dword_1817A6000, a2, a3, "Bookmark was homeDirectoryRelative, depth inside homeDirectory=%u", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_3();
}

{
  OUTLINED_FUNCTION_5(&dword_1817A6000, a2, a3, "VOLUME(S) IDENTIFIED; starting the attempt to find this item represented by this bookmark item at depth %u on one of these volumes.",
    a5,
    a6,
    a7,
    a8,
    0);
  OUTLINED_FUNCTION_3();
}

{
  OUTLINED_FUNCTION_5(&dword_1817A6000, a2, a3, "-. Resolving url to disk image for volume at depth %u to determine image file to be mounted.", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_3();
}

void CFURLCreateByResolvingDataInBookmark(uint64_t a1, NSObject *a2)
{
  _DWORD v2[2];
  __int16 v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v2[0] = 67109378;
  v2[1] = 1;
  v3 = 2112;
  v4 = a1;
  _os_log_debug_impl(&dword_1817A6000, a2, OS_LOG_TYPE_DEBUG, "Bookmark was to an item on a local drive; checking if it's the boot drive and if the uuid matches.  onBoot=%{BOOL}d volMountPath=%@",
    (uint8_t *)v2,
    0x12u);
  OUTLINED_FUNCTION_2();
}

void matchVolumeURLForBookmark()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0(&dword_1817A6000, v0, v1, "Discarding capacity & creation date match because we found more than one possibility.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

void matchURLToBookmark()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0(&dword_1817A6000, v0, v1, " -- matchURLToBookmark: the path or canonical path is NULL.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0(&dword_1817A6000, v0, v1, " -- REJECTED: canonical path does not match the path under test.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_7(&dword_1817A6000, v0, v1, " -- SUCCESS, bookmark, depth=%u is a matchToURL=%@ because the item properties matched those of the original item, and the item exists.");
  OUTLINED_FUNCTION_2();
}

{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_7(&dword_1817A6000, v0, v1, " -- SUCCESS, bookmark, depth=%u is a matchToURL=%@ because the bookmark doesn't contain any properties to match, and the item exists.");
  OUTLINED_FUNCTION_2();
}

{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_7(&dword_1817A6000, v0, v1, "match bookmark, depth=%u matchToURL=%@");
  OUTLINED_FUNCTION_2();
}

void _FSURLCopyResourcePropertyForKeyInternal()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_0(&dword_1817A6000, v0, v1, "_FSURLCopyResourcePropertyForKeyInternal: false result with no real error", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

void _FSURLCopyResourcePropertiesForKeysInternal()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_0(&dword_1817A6000, v0, v1, "_FSURLCopyResourcePropertiesForKeysInternal: NULL result with no real error", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

void _FSURLSetResourcePropertyForKey_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_0(&dword_1817A6000, v0, v1, "_FSURLSetResourcePropertyForKey: false result with no real error", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

void _FSURLSetResourcePropertiesForKeys_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_0(&dword_1817A6000, v0, v1, "_FSURLSetResourcePropertiesForKeys: false result with no real error", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

void _FSURLSetResourcePropertiesForKeys_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_0(&dword_1817A6000, v0, v1, "_FSURLSetResourcePropertiesForKeys: returning false without an error", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

void _FSURLResourceIsReachable_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_0(&dword_1817A6000, v0, v1, "_FSURLResourceIsReachable: false result with no real error", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

void _FSURLCreateStandardError_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_0(&dword_1817A6000, v0, v1, "_FSURLCreateStandardError: NULL result with no real error", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

void _FSURLCopyResourcePropertyValuesAndFlags_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_0(&dword_1817A6000, v0, v1, "_FSURLCopyResourcePropertyValuesAndFlags: false result with no real error", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

void _FSURLGetResourcePropertyFlags_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_0(&dword_1817A6000, v0, v1, "_FSURLGetResourcePropertyFlags: false result with no real error", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

void _FSURLGetVolumePropertyFlags_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_0(&dword_1817A6000, v0, v1, "_FSURLGetVolumePropertyFlags: false result with no real error", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

void _FSCreatePathForFileID_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_0(&dword_1817A6000, v0, v1, "_FSCreatePathForFileID: NULL result with no real error", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

void _FSGetFileSystemRepresentationForFileID_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_0(&dword_1817A6000, v0, v1, "_FSGetFileSystemRepresentationForFileID: false result with no real error", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

void _FSURLCacheResourcePropertyForKey_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_0(&dword_1817A6000, v0, v1, "_FSURLCacheResourcePropertyForKey: false result with no real error", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

void _FSURLCacheResourcePropertiesForKeys_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_0(&dword_1817A6000, v0, v1, "_FSURLCacheResourcePropertiesForKeys: false result with no real error", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

void _FileURLCreateDisplayPathComponentsArray_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_0(&dword_1817A6000, v0, v1, "_FileURLCreateDisplayPathComponentsArray(1): NULL result with no real error", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

void _FileURLCreateDisplayPathComponentsArray_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_0(&dword_1817A6000, v0, v1, "_FileURLCreateDisplayPathComponentsArray(2): NULL result with no real error", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

void _URLEnumeratorGetNextURL_cold_1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_1817A6000, MEMORY[0x1E0C81028], a3, "_URLEnumeratorGetNextURL: NULL result with no real error", a5, a6, a7, a8, 0);
}

void _URLEnumeratorGetURLsBulk_cold_1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_1817A6000, MEMORY[0x1E0C81028], a3, "_URLEnumeratorGetURLsBulk: NULL result with no real error", a5, a6, a7, a8, 0);
}

void append()
{
  __assert_rtn("append", "SandboxExtensionCache.cpp", 105, "head");
}

{
  __assert_rtn("append", "SandboxExtensionCache.cpp", 106, "newItem");
}

void remove()
{
  __assert_rtn("remove", "SandboxExtensionCache.cpp", 117, "head");
}

{
  __assert_rtn("remove", "SandboxExtensionCache.cpp", 118, "oldItem");
}

void remove(uint64_t a1, NSObject *a2)
{
  uint64_t v3;
  uint8_t v4[24];
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  CFDataGetBytePtr(*(CFDataRef *)(a1 + 16));
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_5_0(&dword_1817A6000, a2, v3, "CacheItem list corrupted for extension %s", v4);
  OUTLINED_FUNCTION_4_0();
}

void SandboxExtensionCache::insert()
{
  __assert_rtn("insert", "SandboxExtensionCache.cpp", 170, "url");
}

{
  __assert_rtn("insert", "SandboxExtensionCache.cpp", 171, "extension");
}

void SandboxExtensionCache::_insert()
{
  __assert_rtn("_insert", "SandboxExtensionCache.cpp", 368, "path");
}

{
  __assert_rtn("_insert", "SandboxExtensionCache.cpp", 369, "extension");
}

void SandboxExtensionCache::_insert(uint64_t a1, NSObject *a2)
{
  uint8_t v3[24];
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  CFDictionaryGetCount(*(CFDictionaryRef *)(a1 + 8));
  OUTLINED_FUNCTION_6();
  _os_log_debug_impl(&dword_1817A6000, a2, OS_LOG_TYPE_DEBUG, "sandbox extension cache path count: %ld", v3, 0xCu);
  OUTLINED_FUNCTION_4_0();
}

void SandboxExtensionCache::move()
{
  __assert_rtn("move", "SandboxExtensionCache.cpp", 187, "destination || (fsidp && file_id)");
}

void SandboxExtensionCache::move(NSObject *a1, uint64_t a2, uint64_t a3)
{
  int v3;
  const char *v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v3 = 136315138;
  v4 = "move";
  OUTLINED_FUNCTION_5_0(&dword_1817A6000, a1, a3, "%s: fatal error: no fsid and file id provided or fetched", (uint8_t *)&v3);
  OUTLINED_FUNCTION_2();
}

{
  int v3;
  const char *v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v3 = 136315138;
  v4 = "move";
  OUTLINED_FUNCTION_5_0(&dword_1817A6000, a1, a3, "%s: failed to get file system representation for the dst path.", (uint8_t *)&v3);
  OUTLINED_FUNCTION_2();
}

void SandboxExtensionCache::move(uint64_t a1, NSObject *a2)
{
  int v4;
  int v5;
  const char *v6;
  __int16 v7;
  uint64_t v8;
  __int16 v9;
  int v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v4 = *__error();
  v5 = 136315650;
  v6 = "move";
  v7 = 2082;
  v8 = a1;
  v9 = 1024;
  v10 = v4;
  _os_log_error_impl(&dword_1817A6000, a2, OS_LOG_TYPE_ERROR, "%s: get_fsid_and_file_id error for path=%{public}s: %{errno}d", (uint8_t *)&v5, 0x1Cu);
}

void SandboxExtensionCache::move(uint64_t a1, uint64_t *a2, os_log_t log)
{
  uint64_t v3;
  int v4;
  const char *v5;
  __int16 v6;
  uint64_t v7;
  __int16 v8;
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v3 = *a2;
  v4 = 136315650;
  v5 = "move";
  v6 = 2114;
  v7 = a1;
  v8 = 2114;
  v9 = v3;
  _os_log_error_impl(&dword_1817A6000, log, OS_LOG_TYPE_ERROR, "%s: error getting path for url=%{public}@: %{public}@", (uint8_t *)&v4, 0x20u);
}

void SandboxExtensionCache::consume()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_2_0(&dword_1817A6000, v0, v1, "<%p %@>: called <StartAccessing> on a URL that is not security-scoped", v2);
  OUTLINED_FUNCTION_2();
}

{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_7_0(&dword_1817A6000, v0, v1, "<%p %@>: internal sandbox error for <StartAccessing>", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

void SandboxExtensionCache::_consume()
{
  __assert_rtn("_consume", "SandboxExtensionCache.cpp", 434, "path");
}

{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  __error();
  OUTLINED_FUNCTION_6_0(&dword_1817A6000, v0, v1, "sandbox_extension_consume error=%{errno}d for path %@", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_4_0();
}

{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_5_0(&dword_1817A6000, v0, v1, "unexpected return value from sandbox_extension_consume: %lld", v2);
  OUTLINED_FUNCTION_2();
}

void SandboxExtensionCache::_consume(uint64_t a1, uint64_t a2, NSObject *a3)
{
  _BYTE v3[24];

  *(_DWORD *)v3 = 134218242;
  *(_QWORD *)&v3[4] = a2;
  *(_WORD *)&v3[12] = 2112;
  *(_QWORD *)&v3[14] = a1;
  OUTLINED_FUNCTION_9(&dword_1817A6000, a2, a3, "handle %lld: new handle for path %@", *(_QWORD *)v3, *(_QWORD *)&v3[8], *(_QWORD *)&v3[16]);
  OUTLINED_FUNCTION_2();
}

void SandboxExtensionCache::release()
{
  uint64_t v0;
  os_log_t v1;
  const void *v2;
  const char *v3;

  OUTLINED_FUNCTION_6();
  WORD2(v3) = 2080;
  HIWORD(v3) = v0;
  OUTLINED_FUNCTION_9(&dword_1817A6000, v0, v1, "%p: releasing extension by path for %s", v2, v3);
  OUTLINED_FUNCTION_2();
}

{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_2_0(&dword_1817A6000, v0, v1, "<%p %@>: called <StopAccessing> too many times or URL isn't security-scoped", v2);
  OUTLINED_FUNCTION_2();
}

{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_7_0(&dword_1817A6000, v0, v1, "<%p %@>: internal sandbox error for <StopAccessing>", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

void SandboxExtensionCache::_release(uint64_t a1, uint64_t a2, NSObject *a3)
{
  __int128 v3;

  LODWORD(v3) = 134218240;
  *(_QWORD *)((char *)&v3 + 4) = *(_QWORD *)(a1 + 8);
  WORD6(v3) = 2048;
  HIWORD(v3) = a2;
  OUTLINED_FUNCTION_9(&dword_1817A6000, a2, a3, "handle %lld: decrementing ref count to %lld", (_QWORD)v3, *((_QWORD *)&v3 + 1));
  OUTLINED_FUNCTION_2();
}

void SandboxExtensionCache::_release(_QWORD *a1, uint64_t a2, NSObject *a3)
{
  _BYTE v3[24];

  *(_DWORD *)v3 = 134218242;
  *(_QWORD *)&v3[4] = *a1;
  *(_WORD *)&v3[12] = 2112;
  *(_QWORD *)&v3[14] = a2;
  OUTLINED_FUNCTION_9(&dword_1817A6000, a2, a3, "handle %lld: released extension for path %@", *(_QWORD *)v3, *(_QWORD *)&v3[8], *(_QWORD *)&v3[16]);
  OUTLINED_FUNCTION_2();
}

void SandboxExtensionCache::_release()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  __error();
  OUTLINED_FUNCTION_6_0(&dword_1817A6000, v0, v1, "handle %lld: sandbox_extension_release error %{errno}d", v2, v3, v4, v5, 0);
  OUTLINED_FUNCTION_4_0();
}

void _URLReplaceObject_cold_1()
{
  uint8_t v0[16];

  *(_WORD *)v0 = 0;
  _os_log_error_impl(&dword_1817A6000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "_URLReplaceObject: false result with no real error", v0, 2u);
}

void _URLAttachSecurityScopeToFileURL_cold_1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  __int16 v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v2 = 134218242;
  v3 = a1;
  v4 = 2112;
  v5 = a1;
  _os_log_error_impl(&dword_1817A6000, a2, OS_LOG_TYPE_ERROR, "cannot attach security scope to a URL that is not a file URL: <%p %@>", (uint8_t *)&v2, 0x16u);
}

void _URLAttachSecurityScopeToFileURL_cold_2(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 134217984;
  v3 = a1;
  _os_log_debug_impl(&dword_1817A6000, a2, OS_LOG_TYPE_DEBUG, "%p: removing sandbox extension", (uint8_t *)&v2, 0xCu);
}

void _URLAttachSecurityScopeToFileURL_cold_3(uint64_t a1, CFDataRef theData, NSObject *a3)
{
  int v4;
  uint64_t v5;
  __int16 v6;
  const UInt8 *BytePtr;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v4 = 134218243;
  v5 = a1;
  v6 = 2081;
  BytePtr = CFDataGetBytePtr(theData);
  _os_log_debug_impl(&dword_1817A6000, a3, OS_LOG_TYPE_DEBUG, "%p: attaching sandbox extension %{private}s", (uint8_t *)&v4, 0x16u);
}

void _URLAttachSecurityScopeToFileURL_cold_4(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1817A6000, log, OS_LOG_TYPE_ERROR, "sandboxExtension to attach was not a CFData object", v1, 2u);
}

void CCHmac(CCHmacAlgorithm algorithm, const void *key, size_t keyLength, const void *data, size_t dataLength, void *macOut)
{
  MEMORY[0x1E0C801D8](*(_QWORD *)&algorithm, key, keyLength, data, dataLength, macOut);
}

CFAbsoluteTime CFAbsoluteTimeGetCurrent(void)
{
  CFAbsoluteTime result;

  MEMORY[0x1E0C97C58]();
  return result;
}

CFGregorianDate CFAbsoluteTimeGetGregorianDate(CFAbsoluteTime at, CFTimeZoneRef tz)
{
  uint64_t v2;
  double v3;
  CFGregorianDate result;

  v2 = MEMORY[0x1E0C97C88](tz, at);
  result.second = v3;
  result.year = v2;
  result.month = BYTE4(v2);
  result.day = BYTE5(v2);
  result.hour = BYTE6(v2);
  result.minute = HIBYTE(v2);
  return result;
}

void *__cdecl CFAllocatorAllocate(CFAllocatorRef allocator, CFIndex size, CFOptionFlags hint)
{
  return (void *)MEMORY[0x1E0C97C98](allocator, size, hint);
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

Boolean CFArrayContainsValue(CFArrayRef theArray, CFRange range, const void *value)
{
  return MEMORY[0x1E0C97D10](theArray, range.location, range.length, value);
}

CFArrayRef CFArrayCreate(CFAllocatorRef allocator, const void **values, CFIndex numValues, const CFArrayCallBacks *callBacks)
{
  return (CFArrayRef)MEMORY[0x1E0C97D20](allocator, values, numValues, callBacks);
}

CFArrayRef CFArrayCreateCopy(CFAllocatorRef allocator, CFArrayRef theArray)
{
  return (CFArrayRef)MEMORY[0x1E0C97D30](allocator, theArray);
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

CFIndex CFArrayGetLastIndexOfValue(CFArrayRef theArray, CFRange range, const void *value)
{
  return MEMORY[0x1E0C97D80](theArray, range.location, range.length, value);
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

void CFArraySetValueAtIndex(CFMutableArrayRef theArray, CFIndex idx, const void *value)
{
  MEMORY[0x1E0C97DD0](theArray, idx, value);
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

uint64_t CFCopyHomeDirectoryURLForUser()
{
  return MEMORY[0x1E0C98368]();
}

uint64_t CFCopyUserName()
{
  return MEMORY[0x1E0C98388]();
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

CFDateRef CFDateCreate(CFAllocatorRef allocator, CFAbsoluteTime at)
{
  return (CFDateRef)MEMORY[0x1E0C98448](allocator, at);
}

CFDateFormatterRef CFDateFormatterCreate(CFAllocatorRef allocator, CFLocaleRef locale, CFDateFormatterStyle dateStyle, CFDateFormatterStyle timeStyle)
{
  return (CFDateFormatterRef)MEMORY[0x1E0C98460](allocator, locale, dateStyle, timeStyle);
}

CFStringRef CFDateFormatterCreateStringWithAbsoluteTime(CFAllocatorRef allocator, CFDateFormatterRef formatter, CFAbsoluteTime at)
{
  return (CFStringRef)MEMORY[0x1E0C98488](allocator, formatter, at);
}

void CFDateFormatterSetFormat(CFDateFormatterRef formatter, CFStringRef formatString)
{
  MEMORY[0x1E0C984C0](formatter, formatString);
}

CFAbsoluteTime CFDateGetAbsoluteTime(CFDateRef theDate)
{
  CFAbsoluteTime result;

  MEMORY[0x1E0C984D8](theDate);
  return result;
}

CFTypeID CFDateGetTypeID(void)
{
  return MEMORY[0x1E0C984E8]();
}

void CFDictionaryAddValue(CFMutableDictionaryRef theDict, const void *key, const void *value)
{
  MEMORY[0x1E0C98500](theDict, key, value);
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

void CFDictionaryRemoveValue(CFMutableDictionaryRef theDict, const void *key)
{
  MEMORY[0x1E0C985E8](theDict, key);
}

void CFDictionarySetValue(CFMutableDictionaryRef theDict, const void *key, const void *value)
{
  MEMORY[0x1E0C98610](theDict, key, value);
}

Boolean CFEqual(CFTypeRef cf1, CFTypeRef cf2)
{
  return MEMORY[0x1E0C98620](cf1, cf2);
}

CFDictionaryRef CFErrorCopyUserInfo(CFErrorRef err)
{
  return (CFDictionaryRef)MEMORY[0x1E0C98648](err);
}

CFErrorRef CFErrorCreate(CFAllocatorRef allocator, CFErrorDomain domain, CFIndex code, CFDictionaryRef userInfo)
{
  return (CFErrorRef)MEMORY[0x1E0C98650](allocator, domain, code, userInfo);
}

CFErrorRef CFErrorCreateWithUserInfoKeysAndValues(CFAllocatorRef allocator, CFErrorDomain domain, CFIndex code, const void *const *userInfoKeys, const void *const *userInfoValues, CFIndex numUserInfoValues)
{
  return (CFErrorRef)MEMORY[0x1E0C98658](allocator, domain, code, userInfoKeys, userInfoValues, numUserInfoValues);
}

CFIndex CFErrorGetCode(CFErrorRef err)
{
  return MEMORY[0x1E0C98660](err);
}

CFErrorDomain CFErrorGetDomain(CFErrorRef err)
{
  return (CFErrorDomain)MEMORY[0x1E0C98670](err);
}

Boolean CFFileSecurityCopyAccessControlList(CFFileSecurityRef fileSec, acl_t *accessControlList)
{
  return MEMORY[0x1E0C986B8](fileSec, accessControlList);
}

Boolean CFFileSecurityCopyGroupUUID(CFFileSecurityRef fileSec, CFUUIDRef *groupUUID)
{
  return MEMORY[0x1E0C986C0](fileSec, groupUUID);
}

Boolean CFFileSecurityCopyOwnerUUID(CFFileSecurityRef fileSec, CFUUIDRef *ownerUUID)
{
  return MEMORY[0x1E0C986C8](fileSec, ownerUUID);
}

CFFileSecurityRef CFFileSecurityCreate(CFAllocatorRef allocator)
{
  return (CFFileSecurityRef)MEMORY[0x1E0C986D0](allocator);
}

CFFileSecurityRef CFFileSecurityCreateCopy(CFAllocatorRef allocator, CFFileSecurityRef fileSec)
{
  return (CFFileSecurityRef)MEMORY[0x1E0C986D8](allocator, fileSec);
}

Boolean CFFileSecurityGetGroup(CFFileSecurityRef fileSec, gid_t *group)
{
  return MEMORY[0x1E0C986E0](fileSec, group);
}

Boolean CFFileSecurityGetMode(CFFileSecurityRef fileSec, mode_t *mode)
{
  return MEMORY[0x1E0C986E8](fileSec, mode);
}

Boolean CFFileSecurityGetOwner(CFFileSecurityRef fileSec, uid_t *owner)
{
  return MEMORY[0x1E0C986F0](fileSec, owner);
}

Boolean CFFileSecuritySetAccessControlList(CFFileSecurityRef fileSec, acl_t accessControlList)
{
  return MEMORY[0x1E0C986F8](fileSec, accessControlList);
}

Boolean CFFileSecuritySetGroup(CFFileSecurityRef fileSec, gid_t group)
{
  return MEMORY[0x1E0C98700](fileSec, *(_QWORD *)&group);
}

Boolean CFFileSecuritySetMode(CFFileSecurityRef fileSec, mode_t mode)
{
  return MEMORY[0x1E0C98708](fileSec, mode);
}

CFAllocatorRef CFGetAllocator(CFTypeRef cf)
{
  return (CFAllocatorRef)MEMORY[0x1E0C98718](cf);
}

CFTypeID CFGetTypeID(CFTypeRef cf)
{
  return MEMORY[0x1E0C98738](cf);
}

CFHashCode CFHash(CFTypeRef cf)
{
  return MEMORY[0x1E0C98758](cf);
}

CFLocaleRef CFLocaleGetSystem(void)
{
  return (CFLocaleRef)MEMORY[0x1E0C987F0]();
}

CFTypeID CFNullGetTypeID(void)
{
  return MEMORY[0x1E0C98908]();
}

CFNumberRef CFNumberCreate(CFAllocatorRef allocator, CFNumberType theType, const void *valuePtr)
{
  return (CFNumberRef)MEMORY[0x1E0C98928](allocator, theType, valuePtr);
}

CFNumberType CFNumberGetType(CFNumberRef number)
{
  return MEMORY[0x1E0C989A8](number);
}

CFTypeID CFNumberGetTypeID(void)
{
  return MEMORY[0x1E0C989B8]();
}

Boolean CFNumberGetValue(CFNumberRef number, CFNumberType theType, void *valuePtr)
{
  return MEMORY[0x1E0C989C0](number, theType, valuePtr);
}

void CFReadStreamClose(CFReadStreamRef stream)
{
  MEMORY[0x1E0C98B10](stream);
}

CFErrorRef CFReadStreamCopyError(CFReadStreamRef stream)
{
  return (CFErrorRef)MEMORY[0x1E0C98B20](stream);
}

CFReadStreamRef CFReadStreamCreateWithFile(CFAllocatorRef alloc, CFURLRef fileURL)
{
  return (CFReadStreamRef)MEMORY[0x1E0C98B48](alloc, fileURL);
}

Boolean CFReadStreamOpen(CFReadStreamRef stream)
{
  return MEMORY[0x1E0C98B80](stream);
}

CFIndex CFReadStreamRead(CFReadStreamRef stream, UInt8 *buffer, CFIndex bufferLength)
{
  return MEMORY[0x1E0C98B88](stream, buffer, bufferLength);
}

Boolean CFReadStreamSetProperty(CFReadStreamRef stream, CFStreamPropertyKey propertyName, CFTypeRef propertyValue)
{
  return MEMORY[0x1E0C98BA8](stream, propertyName, propertyValue);
}

void CFRelease(CFTypeRef cf)
{
  MEMORY[0x1E0C98BC0](cf);
}

CFTypeRef CFRetain(CFTypeRef cf)
{
  return (CFTypeRef)MEMORY[0x1E0C98BD0](cf);
}

void CFRunLoopAddObserver(CFRunLoopRef rl, CFRunLoopObserverRef observer, CFRunLoopMode mode)
{
  MEMORY[0x1E0C98BE8](rl, observer, mode);
}

CFRunLoopRef CFRunLoopGetCurrent(void)
{
  return (CFRunLoopRef)MEMORY[0x1E0C98C30]();
}

CFRunLoopRef CFRunLoopGetMain(void)
{
  return (CFRunLoopRef)MEMORY[0x1E0C98C40]();
}

CFRunLoopObserverRef CFRunLoopObserverCreate(CFAllocatorRef allocator, CFOptionFlags activities, Boolean repeats, CFIndex order, CFRunLoopObserverCallBack callout, CFRunLoopObserverContext *context)
{
  return (CFRunLoopObserverRef)MEMORY[0x1E0C98C60](allocator, activities, repeats, order, callout, context);
}

void CFRunLoopRemoveObserver(CFRunLoopRef rl, CFRunLoopObserverRef observer, CFRunLoopMode mode)
{
  MEMORY[0x1E0C98C88](rl, observer, mode);
}

void CFSetAddValue(CFMutableSetRef theSet, const void *value)
{
  MEMORY[0x1E0C98D70](theSet, value);
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

void CFStringAppend(CFMutableStringRef theString, CFStringRef appendedString)
{
  MEMORY[0x1E0C98ED8](theString, appendedString);
}

void CFStringAppendCharacters(CFMutableStringRef theString, const UniChar *chars, CFIndex numChars)
{
  MEMORY[0x1E0C98EE8](theString, chars, numChars);
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

CFStringRef CFStringCreateCopy(CFAllocatorRef alloc, CFStringRef theString)
{
  return (CFStringRef)MEMORY[0x1E0C98F78](alloc, theString);
}

CFMutableStringRef CFStringCreateMutable(CFAllocatorRef alloc, CFIndex maxLength)
{
  return (CFMutableStringRef)MEMORY[0x1E0C98F90](alloc, maxLength);
}

CFStringRef CFStringCreateWithBytes(CFAllocatorRef alloc, const UInt8 *bytes, CFIndex numBytes, CFStringEncoding encoding, Boolean isExternalRepresentation)
{
  return (CFStringRef)MEMORY[0x1E0C98FB8](alloc, bytes, numBytes, *(_QWORD *)&encoding, isExternalRepresentation);
}

CFStringRef CFStringCreateWithCString(CFAllocatorRef alloc, const char *cStr, CFStringEncoding encoding)
{
  return (CFStringRef)MEMORY[0x1E0C98FD0](alloc, cStr, *(_QWORD *)&encoding);
}

CFStringRef CFStringCreateWithCharacters(CFAllocatorRef alloc, const UniChar *chars, CFIndex numChars)
{
  return (CFStringRef)MEMORY[0x1E0C98FE8](alloc, chars, numChars);
}

CFStringRef CFStringCreateWithFileSystemRepresentation(CFAllocatorRef alloc, const char *buffer)
{
  return (CFStringRef)MEMORY[0x1E0C99008](alloc, buffer);
}

CFStringRef CFStringCreateWithSubstring(CFAllocatorRef alloc, CFStringRef str, CFRange range)
{
  return (CFStringRef)MEMORY[0x1E0C99030](alloc, str, range.location, range.length);
}

CFRange CFStringFind(CFStringRef theString, CFStringRef stringToFind, CFStringCompareFlags compareOptions)
{
  CFIndex v3;
  CFIndex v4;
  CFRange result;

  v3 = MEMORY[0x1E0C99050](theString, stringToFind, compareOptions);
  result.length = v4;
  result.location = v3;
  return result;
}

CFIndex CFStringGetBytes(CFStringRef theString, CFRange range, CFStringEncoding encoding, UInt8 lossByte, Boolean isExternalRepresentation, UInt8 *buffer, CFIndex maxBufLen, CFIndex *usedBufLen)
{
  return MEMORY[0x1E0C99080](theString, range.location, range.length, *(_QWORD *)&encoding, lossByte, isExternalRepresentation, buffer, maxBufLen);
}

Boolean CFStringGetCString(CFStringRef theString, char *buffer, CFIndex bufferSize, CFStringEncoding encoding)
{
  return MEMORY[0x1E0C99098](theString, buffer, bufferSize, *(_QWORD *)&encoding);
}

const char *__cdecl CFStringGetCStringPtr(CFStringRef theString, CFStringEncoding encoding)
{
  return (const char *)MEMORY[0x1E0C990A0](theString, *(_QWORD *)&encoding);
}

UniChar CFStringGetCharacterAtIndex(CFStringRef theString, CFIndex idx)
{
  return MEMORY[0x1E0C990B0](theString, idx);
}

void CFStringGetCharacters(CFStringRef theString, CFRange range, UniChar *buffer)
{
  MEMORY[0x1E0C990C0](theString, range.location, range.length, buffer);
}

const UniChar *__cdecl CFStringGetCharactersPtr(CFStringRef theString)
{
  return (const UniChar *)MEMORY[0x1E0C990C8](theString);
}

Boolean CFStringGetFileSystemRepresentation(CFStringRef string, char *buffer, CFIndex maxBufLen)
{
  return MEMORY[0x1E0C990E0](string, buffer, maxBufLen);
}

CFIndex CFStringGetLength(CFStringRef theString)
{
  return MEMORY[0x1E0C99100](theString);
}

CFTypeID CFStringGetTypeID(void)
{
  return MEMORY[0x1E0C99170]();
}

Boolean CFStringHasSuffix(CFStringRef theString, CFStringRef suffix)
{
  return MEMORY[0x1E0C99190](theString, suffix);
}

void CFURLClearResourcePropertyCache(CFURLRef url)
{
  MEMORY[0x1E0C992B8](url);
}

CFURLRef CFURLCopyAbsoluteURL(CFURLRef relativeURL)
{
  return (CFURLRef)MEMORY[0x1E0C992C8](relativeURL);
}

CFStringRef CFURLCopyFileSystemPath(CFURLRef anURL, CFURLPathStyle pathStyle)
{
  return (CFStringRef)MEMORY[0x1E0C992D8](anURL, pathStyle);
}

CFStringRef CFURLCopyFragment(CFURLRef anURL, CFStringRef charactersToLeaveEscaped)
{
  return (CFStringRef)MEMORY[0x1E0C992E8](anURL, charactersToLeaveEscaped);
}

CFStringRef CFURLCopyLastPathComponent(CFURLRef url)
{
  return (CFStringRef)MEMORY[0x1E0C992F8](url);
}

CFStringRef CFURLCopyPath(CFURLRef anURL)
{
  return (CFStringRef)MEMORY[0x1E0C99318](anURL);
}

CFStringRef CFURLCopyQueryString(CFURLRef anURL, CFStringRef charactersToLeaveEscaped)
{
  return (CFStringRef)MEMORY[0x1E0C99328](anURL, charactersToLeaveEscaped);
}

Boolean CFURLCopyResourcePropertyForKey(CFURLRef url, CFStringRef key, void *propertyValueTypeRefPtr, CFErrorRef *error)
{
  return MEMORY[0x1E0C99338](url, key, propertyValueTypeRefPtr, error);
}

CFDataRef CFURLCreateBookmarkDataFromFile(CFAllocatorRef allocator, CFURLRef fileURL, CFErrorRef *errorRef)
{
  return (CFDataRef)MEMORY[0x1E0C99370](allocator, fileURL, errorRef);
}

CFURLRef CFURLCreateCopyAppendingPathComponent(CFAllocatorRef allocator, CFURLRef url, CFStringRef pathComponent, Boolean isDirectory)
{
  return (CFURLRef)MEMORY[0x1E0C99380](allocator, url, pathComponent, isDirectory);
}

CFURLRef CFURLCreateCopyDeletingLastPathComponent(CFAllocatorRef allocator, CFURLRef url)
{
  return (CFURLRef)MEMORY[0x1E0C99390](allocator, url);
}

CFURLRef CFURLCreateFilePathURL(CFAllocatorRef allocator, CFURLRef url, CFErrorRef *error)
{
  return (CFURLRef)MEMORY[0x1E0C993B8](allocator, url, error);
}

CFURLRef CFURLCreateFileReferenceURL(CFAllocatorRef allocator, CFURLRef url, CFErrorRef *error)
{
  return (CFURLRef)MEMORY[0x1E0C993C0](allocator, url, error);
}

CFURLRef CFURLCreateFromFileSystemRepresentation(CFAllocatorRef allocator, const UInt8 *buffer, CFIndex bufLen, Boolean isDirectory)
{
  return (CFURLRef)MEMORY[0x1E0C993C8](allocator, buffer, bufLen, isDirectory);
}

CFURLRef CFURLCreateFromFileSystemRepresentationRelativeToBase(CFAllocatorRef allocator, const UInt8 *buffer, CFIndex bufLen, Boolean isDirectory, CFURLRef baseURL)
{
  return (CFURLRef)MEMORY[0x1E0C993D8](allocator, buffer, bufLen, isDirectory, baseURL);
}

CFDictionaryRef CFURLCreateResourcePropertiesForKeysFromBookmarkData(CFAllocatorRef allocator, CFArrayRef resourcePropertiesToReturn, CFDataRef bookmark)
{
  return (CFDictionaryRef)MEMORY[0x1E0C993E8](allocator, resourcePropertiesToReturn, bookmark);
}

CFURLRef CFURLCreateWithFileSystemPath(CFAllocatorRef allocator, CFStringRef filePath, CFURLPathStyle pathStyle, Boolean isDirectory)
{
  return (CFURLRef)MEMORY[0x1E0C99420](allocator, filePath, pathStyle, isDirectory);
}

CFURLRef CFURLCreateWithFileSystemPathRelativeToBase(CFAllocatorRef allocator, CFStringRef filePath, CFURLPathStyle pathStyle, Boolean isDirectory, CFURLRef baseURL)
{
  return (CFURLRef)MEMORY[0x1E0C99438](allocator, filePath, pathStyle, isDirectory, baseURL);
}

CFURLRef CFURLCreateWithString(CFAllocatorRef allocator, CFStringRef URLString, CFURLRef baseURL)
{
  return (CFURLRef)MEMORY[0x1E0C99448](allocator, URLString, baseURL);
}

CFURLEnumeratorRef CFURLEnumeratorCreateForMountedVolumes(CFAllocatorRef alloc, CFURLEnumeratorOptions option, CFArrayRef propertyKeys)
{
  return (CFURLEnumeratorRef)MEMORY[0x1E0C99458](alloc, option, propertyKeys);
}

CFURLEnumeratorResult CFURLEnumeratorGetNextURL(CFURLEnumeratorRef enumerator, CFURLRef *url, CFErrorRef *error)
{
  return MEMORY[0x1E0C99468](enumerator, url, error);
}

CFURLRef CFURLGetBaseURL(CFURLRef anURL)
{
  return (CFURLRef)MEMORY[0x1E0C99478](anURL);
}

Boolean CFURLGetFileSystemRepresentation(CFURLRef url, Boolean resolveAgainstBase, UInt8 *buffer, CFIndex maxBufLen)
{
  return MEMORY[0x1E0C99490](url, resolveAgainstBase, buffer, maxBufLen);
}

CFStringRef CFURLGetString(CFURLRef anURL)
{
  return (CFStringRef)MEMORY[0x1E0C994A0](anURL);
}

CFTypeID CFURLGetTypeID(void)
{
  return MEMORY[0x1E0C994B8]();
}

Boolean CFURLHasDirectoryPath(CFURLRef anURL)
{
  return MEMORY[0x1E0C994C0](anURL);
}

Boolean CFURLIsFileReferenceURL(CFURLRef url)
{
  return MEMORY[0x1E0C994C8](url);
}

Boolean CFURLResourceIsReachable(CFURLRef url, CFErrorRef *error)
{
  return MEMORY[0x1E0C994D0](url, error);
}

Boolean CFURLSetResourcePropertiesForKeys(CFURLRef url, CFDictionaryRef keyedPropertyValues, CFErrorRef *error)
{
  return MEMORY[0x1E0C994D8](url, keyedPropertyValues, error);
}

Boolean CFURLSetResourcePropertyForKey(CFURLRef url, CFStringRef key, CFTypeRef propertyValue, CFErrorRef *error)
{
  return MEMORY[0x1E0C994E0](url, key, propertyValue, error);
}

void CFURLSetTemporaryResourcePropertyForKey(CFURLRef url, CFStringRef key, CFTypeRef propertyValue)
{
  MEMORY[0x1E0C994E8](url, key, propertyValue);
}

CFUUIDRef CFUUIDCreateWithBytes(CFAllocatorRef alloc, UInt8 byte0, UInt8 byte1, UInt8 byte2, UInt8 byte3, UInt8 byte4, UInt8 byte5, UInt8 byte6, UInt8 byte7, UInt8 byte8, UInt8 byte9, UInt8 byte10, UInt8 byte11, UInt8 byte12, UInt8 byte13, UInt8 byte14, UInt8 byte15)
{
  return (CFUUIDRef)MEMORY[0x1E0C99548](alloc, byte0, byte1, byte2, byte3, byte4, byte5, byte6);
}

CFTypeID CFUUIDGetTypeID(void)
{
  return MEMORY[0x1E0C99560]();
}

CFUUIDBytes CFUUIDGetUUIDBytes(CFUUIDRef uuid)
{
  uint64_t v1;
  uint64_t v2;
  CFUUIDBytes result;

  v1 = MEMORY[0x1E0C99568](uuid);
  result.byte8 = v2;
  result.byte9 = BYTE1(v2);
  result.byte10 = BYTE2(v2);
  result.byte11 = BYTE3(v2);
  result.byte12 = BYTE4(v2);
  result.byte13 = BYTE5(v2);
  result.byte14 = BYTE6(v2);
  result.byte15 = HIBYTE(v2);
  result.byte0 = v1;
  result.byte1 = BYTE1(v1);
  result.byte2 = BYTE2(v1);
  result.byte3 = BYTE3(v1);
  result.byte4 = BYTE4(v1);
  result.byte5 = BYTE5(v1);
  result.byte6 = BYTE6(v1);
  result.byte7 = HIBYTE(v1);
  return result;
}

void CFWriteStreamClose(CFWriteStreamRef stream)
{
  MEMORY[0x1E0C99600](stream);
}

CFErrorRef CFWriteStreamCopyError(CFWriteStreamRef stream)
{
  return (CFErrorRef)MEMORY[0x1E0C99608](stream);
}

CFWriteStreamRef CFWriteStreamCreateWithFile(CFAllocatorRef alloc, CFURLRef fileURL)
{
  return (CFWriteStreamRef)MEMORY[0x1E0C99630](alloc, fileURL);
}

Boolean CFWriteStreamOpen(CFWriteStreamRef stream)
{
  return MEMORY[0x1E0C99650](stream);
}

CFIndex CFWriteStreamWrite(CFWriteStreamRef stream, const UInt8 *buffer, CFIndex bufferLength)
{
  return MEMORY[0x1E0C99688](stream, buffer, bufferLength);
}

void _Block_object_dispose(const void *a1, const int a2)
{
  MEMORY[0x1E0C80948](a1, *(_QWORD *)&a2);
}

uint64_t _CFFileCoordinateReadingItemAtURL2()
{
  return MEMORY[0x1E0C9A190]();
}

uint64_t _CFFileSecurityCreateFromFilesec()
{
  return MEMORY[0x1E0C9A198]();
}

uint64_t _CFGetEUID()
{
  return MEMORY[0x1E0C9A1A0]();
}

uint64_t _CFGetPathExtensionRangesFromPathComponent()
{
  return MEMORY[0x1E0C9A1A8]();
}

uint64_t _CFRunLoopCurrentIsMain()
{
  return MEMORY[0x1E0C9A458]();
}

uint64_t _CFRuntimeCreateInstance()
{
  return MEMORY[0x1E0C9A498]();
}

uint64_t _CFRuntimeRegisterClass()
{
  return MEMORY[0x1E0C9A4B0]();
}

uint64_t _CFURLCopyPromiseURLOfLogicalURL()
{
  return MEMORY[0x1E0C9A640]();
}

uint64_t _CFURLCopyResourcePropertyValuesAndFlags()
{
  return MEMORY[0x1E0C9A670]();
}

uint64_t _CFURLCopySecurityScopeFromFileURL()
{
  return MEMORY[0x1E0C9A678]();
}

uint64_t _CFURLGetResourcePropertyFlags()
{
  return MEMORY[0x1E0C9A700]();
}

uint64_t _CFURLGetVolumePropertyFlags()
{
  return MEMORY[0x1E0C9A708]();
}

uint64_t _CFURLIsFileURL()
{
  return MEMORY[0x1E0C9A710]();
}

uint64_t _CFURLPromiseCopyPhysicalURL()
{
  return MEMORY[0x1E0C9A730]();
}

uint64_t _CFURLPromiseCopyResourcePropertyForKey()
{
  return MEMORY[0x1E0C9A738]();
}

uint64_t _CFURLPromiseSetPhysicalURL()
{
  return MEMORY[0x1E0C9A748]();
}

uint64_t _CFURLPromiseSetResourcePropertyForKey()
{
  return MEMORY[0x1E0C9A750]();
}

uint64_t _LSRegisterFilePropertyProvider()
{
  return MEMORY[0x1E0CA59E0]();
}

uint64_t std::stringbuf::str()
{
  return MEMORY[0x1E0DE41F0]();
}

const std::locale::facet *__cdecl std::locale::use_facet(const std::locale *this, std::locale::id *a2)
{
  return (const std::locale::facet *)MEMORY[0x1E0DE4248](this, a2);
}

std::locale std::ios_base::getloc(const std::ios_base *this)
{
  return (std::locale)MEMORY[0x1E0DE4258](this);
}

uint64_t std::ostream::sentry::sentry()
{
  return MEMORY[0x1E0DE46B0]();
}

uint64_t std::ostream::sentry::~sentry()
{
  return MEMORY[0x1E0DE46B8]();
}

uint64_t std::ostream::~ostream()
{
  return MEMORY[0x1E0DE46C8]();
}

uint64_t std::ostream::operator<<()
{
  return MEMORY[0x1E0DE4700]();
}

{
  return MEMORY[0x1E0DE4730]();
}

uint64_t std::streambuf::basic_streambuf()
{
  return MEMORY[0x1E0DE47E0]();
}

uint64_t std::streambuf::~streambuf()
{
  return MEMORY[0x1E0DE47E8]();
}

void std::locale::~locale(std::locale *this)
{
  MEMORY[0x1E0DE4B98](this);
}

void std::ios_base::init(std::ios_base *this, void *__sb)
{
  MEMORY[0x1E0DE4C68](this, __sb);
}

void std::ios_base::clear(std::ios_base *this, std::ios_base::iostate __state)
{
  MEMORY[0x1E0DE4C80](this, *(_QWORD *)&__state);
}

uint64_t std::ios::~ios()
{
  return MEMORY[0x1E0DE4D28]();
}

void operator delete(void *__p)
{
  off_1E0F0A218(__p);
}

uint64_t operator delete()
{
  return off_1E0F0A220();
}

void *__cdecl operator new(size_t __sz)
{
  return (void *)off_1E0F0A228(__sz);
}

uint64_t operator new()
{
  return off_1E0F0A230();
}

uint64_t __CFURLResourceInfoPtr()
{
  return MEMORY[0x1E0C9AA38]();
}

uint64_t __CFURLSetResourceInfoPtr()
{
  return MEMORY[0x1E0C9AA48]();
}

void __assert_rtn(const char *a1, const char *a2, int a3, const char *a4)
{
  MEMORY[0x1E0C80A58](a1, a2, *(_QWORD *)&a3, a4);
}

int *__error(void)
{
  return (int *)MEMORY[0x1E0C80AC0]();
}

int __maskrune(__darwin_ct_rune_t a1, unint64_t a2)
{
  return MEMORY[0x1E0C80B50](*(_QWORD *)&a1, a2);
}

uint64_t __memcpy_chk()
{
  return MEMORY[0x1E0C80B68]();
}

uint64_t __strlcpy_chk()
{
  return MEMORY[0x1E0C80C48]();
}

uint64_t _amkrtemp()
{
  return MEMORY[0x1E0C80CB8]();
}

os_activity_t _os_activity_create(void *dso, const char *description, os_activity_t activity, os_activity_flag_t flags)
{
  return (os_activity_t)MEMORY[0x1E0C80FC0](dso, description, activity, *(_QWORD *)&flags);
}

void _os_activity_initiate(void *dso, const char *description, os_activity_flag_t flags, os_block_t activity_block)
{
  MEMORY[0x1E0C80FD0](dso, description, *(_QWORD *)&flags, activity_block);
}

void _os_log_debug_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x1E0C81020](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x1E0C81038](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x1E0C81048](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_signpost_emit_with_name_impl(void *dso, os_log_t log, os_signpost_type_t type, os_signpost_id_t spid, const char *name, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x1E0C810D0](dso, log, type, spid, name, format, buf, *(_QWORD *)&size);
}

void abort(void)
{
  MEMORY[0x1E0C813A8]();
}

int access(const char *a1, int a2)
{
  return MEMORY[0x1E0C813D0](a1, *(_QWORD *)&a2);
}

int accessx_np(const accessx_descriptor *a1, size_t a2, int *a3, uid_t a4)
{
  return MEMORY[0x1E0C813D8](a1, a2, a3, *(_QWORD *)&a4);
}

int acl_add_perm(acl_permset_t permset_d, acl_perm_t perm)
{
  return MEMORY[0x1E0C813E8](permset_d, *(_QWORD *)&perm);
}

ssize_t acl_copy_ext(void *buf_p, acl_t acl, ssize_t size)
{
  return MEMORY[0x1E0C81400](buf_p, acl, size);
}

ssize_t acl_copy_ext_native(void *buf_p, acl_t acl, ssize_t size)
{
  return MEMORY[0x1E0C81408](buf_p, acl, size);
}

acl_t acl_copy_int_native(const void *buf_p)
{
  return (acl_t)MEMORY[0x1E0C81410](buf_p);
}

int acl_delete_perm(acl_permset_t permset_d, acl_perm_t perm)
{
  return MEMORY[0x1E0C81428](permset_d, *(_QWORD *)&perm);
}

int acl_free(void *obj_p)
{
  return MEMORY[0x1E0C81438](obj_p);
}

int acl_get_entry(acl_t acl, int entry_id, acl_entry_t *entry_p)
{
  return MEMORY[0x1E0C81448](acl, *(_QWORD *)&entry_id, entry_p);
}

int acl_get_permset(acl_entry_t entry_d, acl_permset_t *permset_p)
{
  return MEMORY[0x1E0C81488](entry_d, permset_p);
}

acl_t acl_init(int count)
{
  return (acl_t)MEMORY[0x1E0C814A0](*(_QWORD *)&count);
}

int acl_set_permset(acl_entry_t entry_d, acl_permset_t permset_d)
{
  return MEMORY[0x1E0C814D0](entry_d, permset_d);
}

ssize_t acl_size(acl_t acl)
{
  return MEMORY[0x1E0C814F0](acl);
}

void bzero(void *a1, size_t a2)
{
  MEMORY[0x1E0C81758](a1, a2);
}

int close(int a1)
{
  return MEMORY[0x1E0C82688](*(_QWORD *)&a1);
}

int closedir(DIR *a1)
{
  return MEMORY[0x1E0C82698](a1);
}

int dirfd(DIR *dirp)
{
  return MEMORY[0x1E0C82BA0](dirp);
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

dispatch_queue_attr_t dispatch_queue_attr_make_with_qos_class(dispatch_queue_attr_t attr, dispatch_qos_class_t qos_class, int relative_priority)
{
  return (dispatch_queue_attr_t)MEMORY[0x1E0C82E38](attr, *(_QWORD *)&qos_class, *(_QWORD *)&relative_priority);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x1E0C82E48](label, attr);
}

void dispatch_release(dispatch_object_t object)
{
  MEMORY[0x1E0C82E98](object);
}

void dispatch_resume(dispatch_object_t object)
{
  MEMORY[0x1E0C82EA0](object);
}

dispatch_source_t dispatch_source_create(dispatch_source_type_t type, uintptr_t handle, uintptr_t mask, dispatch_queue_t queue)
{
  return (dispatch_source_t)MEMORY[0x1E0C82F20](type, handle, mask, queue);
}

void dispatch_source_set_event_handler(dispatch_source_t source, dispatch_block_t handler)
{
  MEMORY[0x1E0C82F58](source, handler);
}

void *__cdecl dlopen(const char *__path, int __mode)
{
  return (void *)MEMORY[0x1E0C83040](__path, *(_QWORD *)&__mode);
}

int faccessat(int a1, const char *a2, int a3, int a4)
{
  return MEMORY[0x1E0C832B8](*(_QWORD *)&a1, a2, *(_QWORD *)&a3, *(_QWORD *)&a4);
}

int fcntl(int a1, int a2, ...)
{
  return MEMORY[0x1E0C83300](*(_QWORD *)&a1, *(_QWORD *)&a2);
}

void filesec_free(filesec_t a1)
{
  MEMORY[0x1E0C833D0](a1);
}

filesec_t filesec_init(void)
{
  return (filesec_t)MEMORY[0x1E0C833E0]();
}

int filesec_set_property(filesec_t a1, filesec_property_t a2, const void *a3)
{
  return MEMORY[0x1E0C833E8](a1, *(_QWORD *)&a2, a3);
}

int flsll(uint64_t a1)
{
  return MEMORY[0x1E0C83428](a1);
}

void free(void *a1)
{
  MEMORY[0x1E0C834A8](a1);
}

int fsctl(const char *a1, unint64_t a2, void *a3, unsigned int a4)
{
  return MEMORY[0x1E0C83528](a1, a2, a3, *(_QWORD *)&a4);
}

ssize_t fsgetpath(char *a1, size_t a2, fsid_t *a3, uint64_t a4)
{
  return MEMORY[0x1E0C83550](a1, a2, a3, a4);
}

int fstat(int a1, stat *a2)
{
  return MEMORY[0x1E0C83560](*(_QWORD *)&a1, a2);
}

int fstatfs(int a1, statfs *a2)
{
  return MEMORY[0x1E0C83570](*(_QWORD *)&a1, a2);
}

int getattrlist(const char *a1, void *a2, void *a3, size_t a4, unsigned int a5)
{
  return MEMORY[0x1E0C83610](a1, a2, a3, a4, *(_QWORD *)&a5);
}

int getattrlistbulk(int a1, void *a2, void *a3, size_t a4, uint64_t a5)
{
  return MEMORY[0x1E0C83620](*(_QWORD *)&a1, a2, a3, a4, a5);
}

int getmntinfo_r_np(statfs **a1, int a2)
{
  return MEMORY[0x1E0C83700](a1, *(_QWORD *)&a2);
}

pid_t getpid(void)
{
  return MEMORY[0x1E0C83760]();
}

ssize_t getxattr(const char *path, const char *name, void *value, size_t size, u_int32_t position, int options)
{
  return MEMORY[0x1E0C83840](path, name, value, size, *(_QWORD *)&position, *(_QWORD *)&options);
}

int link(const char *a1, const char *a2)
{
  return MEMORY[0x1E0C83B70](a1, a2);
}

ssize_t listxattr(const char *path, char *namebuff, size_t size, int options)
{
  return MEMORY[0x1E0C83B88](path, namebuff, size, *(_QWORD *)&options);
}

int lstat(const char *a1, stat *a2)
{
  return MEMORY[0x1E0C83C40](a1, a2);
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

int mbr_check_membership(const uuid_t user, const uuid_t group, int *ismember)
{
  return MEMORY[0x1E0C84000](user, group, ismember);
}

int mbr_gid_to_uuid(gid_t gid, uuid_t uu)
{
  return MEMORY[0x1E0C84008](*(_QWORD *)&gid, uu);
}

int mbr_uid_to_uuid(uid_t uid, uuid_t uu)
{
  return MEMORY[0x1E0C84020](*(_QWORD *)&uid, uu);
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

long double modf(long double __x, long double *__y)
{
  long double result;

  MEMORY[0x1E0C841E0](__y, __x);
  return result;
}

int open(const char *a1, int a2, ...)
{
  return MEMORY[0x1E0C84480](a1, *(_QWORD *)&a2);
}

DIR *__cdecl opendir(const char *a1)
{
  return (DIR *)MEMORY[0x1E0C844C0](a1);
}

void os_activity_scope_enter(os_activity_t activity, os_activity_scope_state_t state)
{
  MEMORY[0x1E0C84510](activity, state);
}

void os_activity_scope_leave(os_activity_scope_state_t state)
{
  MEMORY[0x1E0C84518](state);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x1E0C84728](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x1E0C84780](oslog, type);
}

void os_release(void *object)
{
  MEMORY[0x1E0C84910](object);
}

BOOL os_signpost_enabled(os_log_t log)
{
  return MEMORY[0x1E0C84920](log);
}

void os_unfair_lock_assert_not_owner(const os_unfair_lock *lock)
{
  MEMORY[0x1E0C84988](lock);
}

void os_unfair_lock_assert_owner(const os_unfair_lock *lock)
{
  MEMORY[0x1E0C84990](lock);
}

void os_unfair_lock_lock(os_unfair_lock_t lock)
{
  MEMORY[0x1E0C84998](lock);
}

void os_unfair_lock_unlock(os_unfair_lock_t lock)
{
  MEMORY[0x1E0C849B0](lock);
}

uint64_t os_unfair_recursive_lock_lock_with_options()
{
  return MEMORY[0x1E0C849B8]();
}

uint64_t os_unfair_recursive_lock_trylock()
{
  return MEMORY[0x1E0C849C0]();
}

uint64_t os_unfair_recursive_lock_unlock()
{
  return MEMORY[0x1E0C849D0]();
}

uint64_t pathconf(const char *a1, int a2)
{
  return MEMORY[0x1E0C84AD8](a1, *(_QWORD *)&a2);
}

int pthread_mutex_lock(pthread_mutex_t *a1)
{
  return MEMORY[0x1E0C84E28](a1);
}

int pthread_mutex_unlock(pthread_mutex_t *a1)
{
  return MEMORY[0x1E0C84E38](a1);
}

pthread_t pthread_self(void)
{
  return (pthread_t)MEMORY[0x1E0C84ED8]();
}

void qsort_b(void *__base, size_t __nel, size_t __width, void *__compar)
{
  MEMORY[0x1E0C84F90](__base, __nel, __width, __compar);
}

ssize_t readlink(const char *a1, char *a2, size_t a3)
{
  return MEMORY[0x1E0C85018](a1, a2, a3);
}

int removefile(const char *path, removefile_state_t state, removefile_flags_t flags)
{
  return MEMORY[0x1E0C850C0](path, state, *(_QWORD *)&flags);
}

int removexattr(const char *path, const char *name, int options)
{
  return MEMORY[0x1E0C850F0](path, name, *(_QWORD *)&options);
}

void rename(const std::__fs::filesystem::path *__from, const std::__fs::filesystem::path *__to, std::error_code *__ec)
{
  MEMORY[0x1E0C85100](__from, __to, __ec);
}

int renamex_np(const char *a1, const char *a2, unsigned int a3)
{
  return MEMORY[0x1E0C85118](a1, a2, *(_QWORD *)&a3);
}

uint64_t sandbox_check()
{
  return MEMORY[0x1E0C85178]();
}

uint64_t sandbox_extension_consume()
{
  return MEMORY[0x1E0C851A0]();
}

uint64_t sandbox_extension_issue_file()
{
  return MEMORY[0x1E0C851A8]();
}

uint64_t sandbox_extension_release()
{
  return MEMORY[0x1E0C851F8]();
}

uint64_t sandbox_extension_release_file()
{
  return MEMORY[0x1E0C85200]();
}

uint64_t sandbox_extension_update_file_by_fileid()
{
  return MEMORY[0x1E0C85208]();
}

int setattrlist(const char *a1, void *a2, void *a3, size_t a4, unsigned int a5)
{
  return MEMORY[0x1E0C85318](a1, a2, a3, a4, *(_QWORD *)&a5);
}

int setxattr(const char *path, const char *name, const void *value, size_t size, u_int32_t position, int options)
{
  return MEMORY[0x1E0C853A0](path, name, value, size, *(_QWORD *)&position, *(_QWORD *)&options);
}

int snprintf(char *__str, size_t __size, const char *__format, ...)
{
  return MEMORY[0x1E0C85440](__str, __size, __format);
}

int statfs(const char *a1, statfs *a2)
{
  return MEMORY[0x1E0C854E0](a1, a2);
}

char *__cdecl strchr(char *__s, int __c)
{
  return (char *)MEMORY[0x1E0C85518](__s, *(_QWORD *)&__c);
}

int strcmp(const char *__s1, const char *__s2)
{
  return MEMORY[0x1E0C85520](__s1, __s2);
}

size_t strlcpy(char *__dst, const char *__source, size_t __size)
{
  return MEMORY[0x1E0C85570](__dst, __source, __size);
}

size_t strlen(const char *__s)
{
  return MEMORY[0x1E0C85578](__s);
}

int strncmp(const char *__s1, const char *__s2, size_t __n)
{
  return MEMORY[0x1E0C855A8](__s1, __s2, __n);
}

char *__cdecl strncpy(char *__dst, const char *__src, size_t __n)
{
  return (char *)MEMORY[0x1E0C855B0](__dst, __src, __n);
}

char *__cdecl strrchr(char *__s, int __c)
{
  return (char *)MEMORY[0x1E0C855E8](__s, *(_QWORD *)&__c);
}

char *__cdecl strstr(char *__s1, const char *__s2)
{
  return (char *)MEMORY[0x1E0C85610](__s1, __s2);
}

uint64_t strtoll(const char *__str, char **__endptr, int __base)
{
  return MEMORY[0x1E0C85678](__str, __endptr, *(_QWORD *)&__base);
}

int sysctlbyname(const char *a1, void *a2, size_t *a3, void *a4, size_t a5)
{
  return MEMORY[0x1E0C857A0](a1, a2, a3, a4, a5);
}

void syslog(int a1, const char *a2, ...)
{
  MEMORY[0x1E0C857D0](*(_QWORD *)&a1, a2);
}

void uuid_copy(uuid_t dst, const uuid_t src)
{
  MEMORY[0x1E0C85A10](dst, src);
}

int uuid_is_null(const uuid_t uu)
{
  return MEMORY[0x1E0C85A30](uu);
}

void uuid_unparse_upper(const uuid_t uu, uuid_string_t out)
{
  MEMORY[0x1E0C85A50](uu, out);
}

int xattr_preserve_for_intent(const char *a1, xattr_operation_intent_t a2)
{
  return MEMORY[0x1E0C85D70](a1, *(_QWORD *)&a2);
}

uint64_t FPCreateBookmarkableStringFromDocumentURL_delayInitStub(double a1)
{
  if (!atomic_load(&dlopenHelperFlag_FileProvider))
    dlopenHelper_FileProvider(a1);
  return MEMORY[0x1E0CAA6F0]();
}

uint64_t FPCreateDocumentURLFromBookmarkableString_delayInitStub(double a1)
{
  if (!atomic_load(&dlopenHelperFlag_FileProvider))
    dlopenHelper_FileProvider(a1);
  return MEMORY[0x1E0CAA700]();
}

uint64_t GSLibraryResolveDocumentId2_delayInitStub(double a1)
{
  if (!atomic_load((unsigned int *)&dlopenHelperFlag_GenerationalStorage))
    dlopenHelper_GenerationalStorage(a1);
  return MEMORY[0x1E0D25D18]();
}

uint64_t CacheDeleteCopyAvailableSpaceForVolume_delayInitStub(double a1)
{
  if (!atomic_load((unsigned int *)&dlopenHelperFlag_CacheDelete))
    dlopenHelper_CacheDelete(a1);
  return MEMORY[0x1E0D09B48]();
}

uint64_t FPCFCopyAttributeValuesForItem_delayInitStub(double a1)
{
  if (!atomic_load(&dlopenHelperFlag_FileProvider))
    dlopenHelper_FileProvider(a1);
  return MEMORY[0x1E0CAA6C0]();
}

uint64_t FPCFSetAttributeValueForItem_delayInitStub(double a1)
{
  if (!atomic_load(&dlopenHelperFlag_FileProvider))
    dlopenHelper_FileProvider(a1);
  return MEMORY[0x1E0CAA6C8]();
}

uint64_t _QLCopyResourcePropertyForKey_delayInitStub(double a1)
{
  if (!atomic_load(&dlopenHelperFlag_QuickLookThumbnailing))
    dlopenHelper_QuickLookThumbnailing(a1);
  return MEMORY[0x1E0CD3380]();
}

uint64_t _QLSetResourcePropertyForKey_delayInitStub(double a1)
{
  if (!atomic_load(&dlopenHelperFlag_QuickLookThumbnailing))
    dlopenHelper_QuickLookThumbnailing(a1);
  return MEMORY[0x1E0CD3388]();
}

double __spoils<X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> dlopenHelper_QuickLookThumbnailing(double a1)
{
  dlopen("/System/Library/Frameworks/QuickLookThumbnailing.framework/QuickLookThumbnailing", 0);
  atomic_store(1u, &dlopenHelperFlag_QuickLookThumbnailing);
  return a1;
}

double __spoils<X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> dlopenHelper_CacheDelete(double a1)
{
  dlopen("/System/Library/PrivateFrameworks/CacheDelete.framework/CacheDelete", 0);
  atomic_store(1u, (unsigned int *)&dlopenHelperFlag_CacheDelete);
  return a1;
}

double __spoils<X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> dlopenHelper_GenerationalStorage(double a1)
{
  dlopen("/System/Library/PrivateFrameworks/GenerationalStorage.framework/GenerationalStorage", 0);
  atomic_store(1u, (unsigned int *)&dlopenHelperFlag_GenerationalStorage);
  return a1;
}

double __spoils<X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> dlopenHelper_FileProvider(double a1)
{
  dlopen("/System/Library/Frameworks/FileProvider.framework/FileProvider", 0);
  atomic_store(1u, &dlopenHelperFlag_FileProvider);
  return a1;
}

double gotLoadHelper_x8__FPCreateBookmarkableStringFromDocumentURL(double result)
{
  if (!atomic_load(&dlopenHelperFlag_FileProvider))
    return dlopenHelper_FileProvider(result);
  return result;
}

double gotLoadHelper_x8__FPCreateDocumentURLFromBookmarkableString(double result)
{
  if (!atomic_load(&dlopenHelperFlag_FileProvider))
    return dlopenHelper_FileProvider(result);
  return result;
}

double gotLoadHelper_x8__GSLibraryResolveDocumentId2(double result)
{
  if (!atomic_load((unsigned int *)&dlopenHelperFlag_GenerationalStorage))
    return dlopenHelper_GenerationalStorage(result);
  return result;
}

double gotLoadHelper_x8__CacheDeleteCopyAvailableSpaceForVolume(double result)
{
  if (!atomic_load((unsigned int *)&dlopenHelperFlag_CacheDelete))
    return dlopenHelper_CacheDelete(result);
  return result;
}

double gotLoadHelper_x8__FPCFCopyAttributeValuesForItem(double result)
{
  if (!atomic_load(&dlopenHelperFlag_FileProvider))
    return dlopenHelper_FileProvider(result);
  return result;
}

double gotLoadHelper_x8__FPCFSetAttributeValueForItem(double result)
{
  if (!atomic_load(&dlopenHelperFlag_FileProvider))
    return dlopenHelper_FileProvider(result);
  return result;
}

double gotLoadHelper_x8___QLCopyResourcePropertyForKey(double result)
{
  if (!atomic_load(&dlopenHelperFlag_QuickLookThumbnailing))
    return dlopenHelper_QuickLookThumbnailing(result);
  return result;
}

double gotLoadHelper_x8___QLSetResourcePropertyForKey(double result)
{
  if (!atomic_load(&dlopenHelperFlag_QuickLookThumbnailing))
    return dlopenHelper_QuickLookThumbnailing(result);
  return result;
}
