@implementation SIUserCopyUserFSCriteriaForQuery

uint64_t ___SIUserCopyUserFSCriteriaForQuery_block_invoke(_QWORD *a1, uint64_t a2)
{
  uint64_t v3;
  int v4;
  uint64_t v5;
  int v6;
  const char *v7;
  const char *v9;
  size_t v10;
  CFIndex v11;
  const __CFAllocator *v12;
  __CFString *v13;
  void *v14;
  uint64_t v15;
  int v16;
  int v17;
  __CFString *MutableCopy;
  const __CFString *v20;
  void *values;

  v3 = *(_QWORD *)(a1[4] + 8);
  if (!*(_BYTE *)(v3 + 24))
    return a2;
  v4 = *(unsigned __int16 *)(a2 + 40);
  if (v4 == 2 || v4 == 32)
    return a2;
  if (v4 != 4)
    goto LABEL_29;
  v5 = *(_QWORD *)(a2 + 16);
  v6 = *(_DWORD *)(v5 + 24);
  if ((v6 | 4) != 5)
    goto LABEL_29;
  v7 = *(const char **)(v5 + 72);
  if (!v7)
    goto LABEL_29;
  v9 = *(const char **)v5;
  if (strncmp(*(const char **)v5, "kMDItemIsTrashed", 0x10uLL))
  {
    if (!strncmp(v9, "_kMDItemBundleID", 0x10uLL) || !strncmp(v9, "kMDItemFileProviderID", 0x15uLL))
    {
      if (!strcmp(v7, "*") || !strncmp(v7, "com.apple.filesystems.UserFS.FileProvider", 0x29uLL))
      {
        if (v6 == 1)
          return a2;
      }
      else if (v6 != 1)
      {
        return a2;
      }
    }
    else if (!*(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 24) && !strncmp(v9, "kMDItemDisplayName", 0x12uLL))
    {
      v10 = strlen(v7);
      if (v10)
      {
        v11 = v7[v10 - 1] == 42 ? v10 - 1 : v10;
        if (v11)
        {
          v12 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
          v13 = (__CFString *)CFStringCreateWithBytes((CFAllocatorRef)*MEMORY[0x1E0C9AE00], (const UInt8 *)v7, v11, 0x8000100u, 0);
          values = v13;
          if (v13)
          {
            if ((*(_BYTE *)(*(_QWORD *)(a2 + 16) + 32) & 0x40) != 0)
            {
              v14 = v13;
              MutableCopy = CFStringCreateMutableCopy(v12, 0, v13);
              if (MutableCopy)
              {
                v20 = MutableCopy;
                CFStringTrimWhitespace(MutableCopy);
                *(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 24) = CFStringCreateArrayBySeparatingStrings(v12, v20, CFSTR(" "));
                CFRelease(v20);
              }
            }
            else
            {
              *(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 24) = CFArrayCreate(v12, (const void **)&values, 1, MEMORY[0x1E0C9B378]);
              v14 = values;
            }
            CFRelease(v14);
          }
        }
      }
      return a2;
    }
LABEL_29:
    *(_BYTE *)(v3 + 24) = 0;
    return a2;
  }
  if ((v6 | 4) == 5)
  {
    *(_QWORD *)(*(_QWORD *)(a1[5] + 8) + 24) = *MEMORY[0x1E0C9AE40];
    v15 = *(_QWORD *)(a2 + 16);
    v16 = atoi(*(const char **)(v15 + 72));
    v17 = *(_DWORD *)(v15 + 24);
    if (v16)
    {
      if (v17 != 1)
        return a2;
    }
    else if (v17 != 5)
    {
      return a2;
    }
    *(_QWORD *)(*(_QWORD *)(a1[5] + 8) + 24) = *MEMORY[0x1E0C9AE50];
  }
  return a2;
}

@end
