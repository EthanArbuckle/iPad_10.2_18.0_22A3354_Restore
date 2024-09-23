@implementation NSError

uint64_t __78__NSError_FPFSAdditions__fp_nonEvictableChildrenErrorWithFD_trashIno_busyIno___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  int v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  stat v12;

  if (*(_QWORD *)a2 == *(_QWORD *)(a1 + 48))
    return 0;
  memset(&v12, 0, sizeof(v12));
  v4 = a2 + 21;
  if (fstatat(*(_DWORD *)(a1 + 72), (const char *)(a2 + 21), &v12, 32) < 0)
    goto LABEL_12;
  if ((v12.st_flags & 0x40000000) != 0)
  {
    if (*(_QWORD *)a2 != *(_QWORD *)(a1 + 56))
      return 0;
    v6 = 3;
    goto LABEL_13;
  }
  v5 = v12.st_mode & 0xF000;
  if (v5 == 40960)
    return 0;
  if (v5 != 0x8000)
    goto LABEL_11;
  if (v12.st_nlink > 1u)
  {
    v6 = 4;
    goto LABEL_13;
  }
  if ((fpfs_is_finder_alias_at() & 0x80000000) != 0)
LABEL_12:
    v6 = 1;
  else
LABEL_11:
    v6 = 5;
LABEL_13:
  v7 = *(void **)(a1 + 32);
  objc_msgSend(MEMORY[0x24BDD17C8], "fp_pathWithFileSystemRepresentation:", v4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "URLByAppendingPathComponent:isDirectory:", v8, *(unsigned __int8 *)(a2 + 20) == 4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 64), "purgeabilityErrorForReason:atURL:", v6, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    objc_msgSend(*(id *)(a1 + 40), "addObject:", v10);
    if ((unint64_t)objc_msgSend(*(id *)(a1 + 40), "count") > 0x63)
    {

      return 0xFFFFFFFFLL;
    }
  }

  return 0;
}

@end
