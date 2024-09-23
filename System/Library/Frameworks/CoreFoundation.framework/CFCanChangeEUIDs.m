@implementation CFCanChangeEUIDs

uint64_t ___CFCanChangeEUIDs_block_invoke()
{
  uid_t v0;
  uid_t v1;
  uint64_t result;
  int v3;
  BOOL v4;
  char v6;
  size_t v7;
  int v8[2];
  int v9;
  pid_t v10;
  _OWORD v11[24];
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v0 = geteuid();
  v1 = getuid();
  v18 = 0u;
  v19 = 0u;
  v16 = 0u;
  v17 = 0u;
  v14 = 0u;
  v15 = 0u;
  v12 = 0u;
  v13 = 0u;
  memset(v11, 0, sizeof(v11));
  *(_QWORD *)v8 = 0xE00000001;
  v9 = 1;
  v10 = getpid();
  v7 = 648;
  result = sysctl(v8, 4u, v11, &v7, 0, 0);
  v3 = HIDWORD(v12);
  if ((_DWORD)result)
    v3 = -1;
  if (v1)
    v4 = v1 == v0;
  else
    v4 = 0;
  v6 = !v4 || v3 != v0;
  if ((_DWORD)result)
    v6 = 1;
  _CFCanChangeEUIDs_canChangeEUIDs = v6;
  return result;
}

@end
