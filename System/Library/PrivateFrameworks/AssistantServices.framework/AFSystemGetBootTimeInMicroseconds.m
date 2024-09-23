@implementation AFSystemGetBootTimeInMicroseconds

void __AFSystemGetBootTimeInMicroseconds_block_invoke()
{
  int v0;
  int v1;
  void *v2;
  int v3;
  int v4;
  void *v5;
  NSObject *v6;
  char *v7;
  const char *v8;
  int v9;
  int v10;
  void *v11;
  char *v12;
  uint64_t v13;
  NSObject *v14;
  char *v15;
  size_t v16;
  uint64_t v17;
  uint64_t v18;
  size_t v19;
  uint8_t buf[4];
  const char *v21;
  __int16 v22;
  char *v23;
  int v24[4];
  __int128 v25;
  __int128 v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v19 = 48;
  *(_OWORD *)v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v0 = sysctlnametomib("kern.boottime", v24, &v19);
  if (v0)
  {
    v1 = v0;
    v2 = (void *)AFSiriLogContextUtility;
    if (os_log_type_enabled((os_log_t)AFSiriLogContextUtility, OS_LOG_TYPE_ERROR))
    {
      v14 = v2;
      v15 = strerror(v1);
      *(_DWORD *)buf = 136315394;
      v21 = "AFSystemGetBootTimeInMicroseconds_block_invoke";
      v22 = 2080;
      v23 = v15;
      _os_log_error_impl(&dword_19AF50000, v14, OS_LOG_TYPE_ERROR, "%s Failed getting kern.boottime MIB with sysctlnametomib() %s", buf, 0x16u);

    }
    v18 = 0;
    v19 = 0;
    v16 = 16;
    v17 = 0;
LABEL_5:
    v3 = sysctlbyname("kern.boottime", &v17, &v16, 0, 0);
    if (v3)
    {
      v4 = v3;
      v5 = (void *)AFSiriLogContextUtility;
      if (os_log_type_enabled((os_log_t)AFSiriLogContextUtility, OS_LOG_TYPE_ERROR))
      {
        v6 = v5;
        v7 = strerror(v4);
        *(_DWORD *)buf = 136315394;
        v21 = "AFSystemGetBootTimeInMicroseconds_block_invoke";
        v22 = 2080;
        v23 = v7;
        v8 = "%s Failed getting kern.boottime with sysctlbyname() %s";
LABEL_12:
        _os_log_error_impl(&dword_19AF50000, v6, OS_LOG_TYPE_ERROR, v8, buf, 0x16u);

        goto LABEL_13;
      }
      goto LABEL_13;
    }
LABEL_14:
    v13 = (int)v18 + 1000000 * v17;
    goto LABEL_15;
  }
  v16 = 16;
  v17 = 0;
  v18 = 0;
  if (!v19)
    goto LABEL_5;
  v9 = sysctl(v24, v19, &v17, &v16, 0, 0);
  if (!v9)
    goto LABEL_14;
  v10 = v9;
  v11 = (void *)AFSiriLogContextUtility;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextUtility, OS_LOG_TYPE_ERROR))
  {
    v6 = v11;
    v12 = strerror(v10);
    *(_DWORD *)buf = 136315394;
    v21 = "AFSystemGetBootTimeInMicroseconds_block_invoke";
    v22 = 2080;
    v23 = v12;
    v8 = "%s Failed getting kern.boottime with sysctl() %s";
    goto LABEL_12;
  }
LABEL_13:
  v13 = 0;
LABEL_15:
  AFSystemGetBootTimeInMicroseconds_bootTime = v13;
}

@end
