@implementation MOLogWriteV

_QWORD *__MOLogWriteV_block_invoke(_QWORD *result)
{
  _QWORD *v1;
  char *v2;
  uint64_t v3;
  int v4;
  std::__fs::filesystem::path *v5;
  int v6;
  int v7;
  unsigned __int8 *v8;
  std::__fs::filesystem::path *v9;
  int v10;
  __int16 v11;
  size_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  int v16;
  int v17;
  std::error_code *v18;
  int v19;
  stat v20;
  time_t v21;
  iovec v22;
  uint64_t v23;
  uint64_t v24;
  const char *v25;
  uint64_t v26;
  std::__fs::filesystem::path __to;
  std::__fs::filesystem::path __s;
  char __str[1024];
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  if (*(_QWORD *)(result[4] + 8))
  {
    v1 = result;
    v21 = 0;
    time(&v21);
    v2 = ctime(&v21);
    v2[strlen(v2) - 1] = 0;
    v3 = v1[5];
    getpid();
    pthread_self();
    if (v3)
      snprintf(__str, 0x400uLL, "%s [%d] <%s> (%p) %s: ");
    else
      snprintf(__str, 0x400uLL, "%s [%d] <%s> (%p) ");
    v4 = *(_DWORD *)(v1[4] + 36);
    if (v4 != -1)
      goto LABEL_23;
    __strlcpy_chk();
    if (__s.__pn_.__r_.__value_.__s.__data_[0])
    {
      v5 = (std::__fs::filesystem::path *)((char *)&__s + strlen((const char *)&__s) - 1);
      while (v5 > &__s)
      {
        v6 = v5->__pn_.__r_.__value_.__s.__data_[0];
        v5 = (std::__fs::filesystem::path *)((char *)v5 - 1);
        if (v6 != 47)
        {
          while (v5 > &__s)
          {
            v7 = v5->__pn_.__r_.__value_.__s.__data_[0];
            v5 = (std::__fs::filesystem::path *)((char *)v5 - 1);
            if (v7 == 47)
            {
              v5 = (std::__fs::filesystem::path *)((char *)v5 + 1);
              goto LABEL_13;
            }
          }
          goto LABEL_18;
        }
      }
LABEL_13:
      if (v5 != &__s)
      {
        v8 = (unsigned __int8 *)&v5[-1].__pn_.__r_.__value_.__r.__words[2] + 7;
        do
        {
          v9 = v5;
          if (v8 <= (unsigned __int8 *)&__s)
            break;
          v10 = *v8--;
          v5 = (std::__fs::filesystem::path *)((char *)v5 - 1);
        }
        while (v10 == 47);
        v9->__pn_.__r_.__value_.__s.__data_[0] = 0;
        goto LABEL_22;
      }
LABEL_18:
      if (__s.__pn_.__r_.__value_.__s.__data_[0] == 47)
        v11 = 47;
      else
        v11 = 46;
      LOWORD(__s.__pn_.__r_.__value_.__l.__data_) = v11;
    }
LABEL_22:
    mkpath_np((const char *)&__s, 0x1EDu);
    snprintf((char *)&__s, 0x400uLL, "%s.0", *(const char **)(v1[4] + 8));
    result = (_QWORD *)open((const char *)&__s, 521, 420);
    v4 = (int)result;
    *(_DWORD *)(v1[4] + 36) = (_DWORD)result;
    if ((_DWORD)result != -1)
    {
LABEL_23:
      v12 = strlen(__str);
      memset(&v20, 0, sizeof(v20));
      v22.iov_base = __str;
      v22.iov_len = v12;
      v13 = v1[7];
      v23 = v1[6];
      v24 = v13;
      v25 = "\n";
      v26 = 1;
      writev(v4, &v22, 3);
      result = (_QWORD *)fstat(*(_DWORD *)(v1[4] + 36), &v20);
      if (!(_DWORD)result)
      {
        v14 = v1[4];
        if (v20.st_size >= *(_QWORD *)(v14 + 24))
        {
          close(*(_DWORD *)(v14 + 36));
          v15 = v1[4];
          *(_DWORD *)(v15 + 36) = -1;
          snprintf((char *)&__s, 0x400uLL, "%s.%d", *(const char **)(v15 + 8), *(_DWORD *)(v15 + 32));
          result = (_QWORD *)unlink((const char *)&__s);
          v16 = *(_DWORD *)(v1[4] + 32) - 1;
          if (v16 >= 0)
          {
            do
            {
              snprintf((char *)&__s, 0x400uLL, "%s.%d", *(const char **)(v1[4] + 8), v16);
              v17 = v16 + 1;
              snprintf((char *)&__to, 0x400uLL, "%s.%d", *(const char **)(v1[4] + 8), v16 + 1);
              rename(&__s, &__to, v18);
              result = (_QWORD *)open((const char *)&__to, 265);
              if ((_DWORD)result != -1)
              {
                v19 = (int)result;
                fcntl((int)result, 64, 3);
                result = (_QWORD *)close(v19);
              }
              v16 = v17 - 2;
            }
            while (v17 - 1 > 0);
          }
        }
      }
    }
  }
  return result;
}

@end
