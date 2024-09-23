@implementation OSLogCreateArchiveWithDictionary

uint64_t __OSLogCreateArchiveWithDictionary_block_invoke(uint64_t a1, int a2, const char *a3)
{
  uint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  int v14;
  void *v15;
  int *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  const char *v23;
  void *v24;
  int *v25;
  char v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  int v33;
  int v34;
  int *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  int v42;
  uint64_t v43;
  int v44;
  int *v45;
  void *v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  int v53;
  uint64_t result;
  int *v55;
  int v56;
  uint64_t v57;
  int v58;
  char v59;
  stat v60;
  _BYTE v61[1024];
  uint64_t v62;

  v62 = *MEMORY[0x1E0C80C00];
  memset(&v60, 0, sizeof(v60));
  if (fstat(a2, &v60))
  {
    v6 = *__error();
    if (fcntl(a2, 50, v61) == -1)
    {
      __error();
      _os_assumes_log();
    }
    v7 = *(void **)(a1 + 32);
    strerror(v6);
    _OSLogWarningMessage(v7, "unable to stat temp fd: %s: %s (%d)", v8, v9, v10, v11, v12, v13, (char)v61);
    return v6;
  }
  if (!strcmp(a3, "."))
  {
    if (fcopyfile(a2, *(_DWORD *)(a1 + 40), 0, 4u))
    {
      v24 = *(void **)(a1 + 32);
      v25 = __error();
      v26 = strerror(*v25);
      __error();
      _OSLogWarningMessage(v24, "failed to copyfile on root node: %s (%d)", v27, v28, v29, v30, v31, v32, v26);
      return *__error();
    }
    goto LABEL_16;
  }
  v14 = *(_DWORD *)(a1 + 40);
  if ((v60.st_mode & 0xF000) != 0x4000)
  {
    v33 = openat(v14, a3, 2562, 420);
    if (v33 == -1)
      goto LABEL_24;
    v34 = v33;
    if (!fcopyfile(a2, v33, 0, 0xEu))
    {
      if (*(_QWORD *)(a1 + 44) && fchown(v34, *(_DWORD *)(a1 + 44), *(_DWORD *)(a1 + 48)) == -1)
      {
        __error();
        _os_assumes_log();
      }
      if (close(v34) != -1)
        return 0;
      v56 = *__error();
      v57 = *__error();
      if (v56 == 9)
      {
        qword_1EE52EA58 = (uint64_t)"BUG IN CLIENT OF LIBTRACE: don't close random fds";
        qword_1EE52EA88 = v57;
        __break(1u);
LABEL_33:
        if (*(_QWORD *)(a1 + 44) && fchown(v34, *(_DWORD *)(a1 + 44), *(_DWORD *)(a1 + 48)) == -1)
        {
          __error();
          _os_assumes_log();
        }
        if (close(v34) != -1)
          return 0;
        v58 = *__error();
        result = *__error();
        if (v58 == 9)
          goto LABEL_42;
      }
LABEL_38:
      _os_assumes_log();
      return 0;
    }
    v35 = __error();
    v6 = *v35;
    a1 = *(_QWORD *)(a1 + 32);
    strerror(*v35);
    _OSLogWarningMessage((void *)a1, "failed to copyfile: %s: %s (%d)", v36, v37, v38, v39, v40, v41, (char)a3);
    if (close(v34) != -1)
      return v6;
    v42 = *__error();
    v43 = *__error();
    if (v42 != 9)
    {
LABEL_23:
      _os_assumes_log();
      return v6;
    }
    qword_1EE52EA58 = (uint64_t)"BUG IN CLIENT OF LIBTRACE: don't close random fds";
    qword_1EE52EA88 = v43;
    __break(1u);
LABEL_16:
    if (!*(_QWORD *)(a1 + 44) || fchown(*(_DWORD *)(a1 + 40), *(_DWORD *)(a1 + 44), *(_DWORD *)(a1 + 48)) != -1)
      return 0;
    __error();
    goto LABEL_38;
  }
  if (mkdirat(v14, a3, 0x1FFu))
  {
    v15 = *(void **)(a1 + 32);
    v16 = __error();
    strerror(*v16);
    __error();
    v59 = (char)a3;
    v23 = "failed to mkdir: %s: %s (%d)";
LABEL_25:
    _OSLogWarningMessage(v15, v23, v17, v18, v19, v20, v21, v22, v59);
    return *__error();
  }
  v44 = openat(*(_DWORD *)(a1 + 40), a3, 0);
  if (v44 == -1)
  {
LABEL_24:
    v15 = *(void **)(a1 + 32);
    v55 = __error();
    strerror(*v55);
    __error();
    v59 = (char)a3;
    v23 = "failed to open: %s: %s (%d)";
    goto LABEL_25;
  }
  v34 = v44;
  if (!fcopyfile(a2, v44, 0, 4u))
    goto LABEL_33;
  v45 = __error();
  v6 = *v45;
  v46 = *(void **)(a1 + 32);
  strerror(*v45);
  _OSLogWarningMessage(v46, "failed to copyfile: %s: %s (%d)", v47, v48, v49, v50, v51, v52, (char)a3);
  if (close(v34) != -1)
    return v6;
  v53 = *__error();
  result = *__error();
  if (v53 != 9)
    goto LABEL_23;
  qword_1EE52EA58 = (uint64_t)"BUG IN CLIENT OF LIBTRACE: don't close random fds";
  qword_1EE52EA88 = result;
  __break(1u);
LABEL_42:
  qword_1EE52EA58 = (uint64_t)"BUG IN CLIENT OF LIBTRACE: don't close random fds";
  qword_1EE52EA88 = result;
  __break(1u);
  return result;
}

@end
