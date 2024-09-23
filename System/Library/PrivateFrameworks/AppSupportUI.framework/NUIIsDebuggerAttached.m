@implementation NUIIsDebuggerAttached

uint64_t ___NUIIsDebuggerAttached_block_invoke()
{
  uint64_t result;
  size_t v1;
  _BYTE v2[32];
  int v3;
  int v4[2];
  int v5;
  pid_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v3 = 0;
  *(_QWORD *)v4 = 0xE00000001;
  v5 = 1;
  v6 = getpid();
  v1 = 648;
  result = sysctl(v4, 4u, v2, &v1, 0, 0);
  if (!(_DWORD)result)
    _NUIIsDebuggerAttached::isDebugged = (v3 & 0x800) != 0;
  return result;
}

@end
