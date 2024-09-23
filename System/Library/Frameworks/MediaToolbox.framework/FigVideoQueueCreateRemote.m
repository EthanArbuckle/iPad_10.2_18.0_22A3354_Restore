@implementation FigVideoQueueCreateRemote

uint64_t __FigVideoQueueCreateRemote_block_invoke(uint64_t a1, mach_port_t a2, int a3, _DWORD *a4, _QWORD *a5, _QWORD *a6)
{
  pid_t v12;
  uint64_t v13;
  int v14;
  uint64_t result;
  unsigned int v16;
  _OWORD buffer[2];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v16 = 0;
  memset(buffer, 0, sizeof(buffer));
  v12 = getpid();
  proc_name(v12, buffer, 0x20u);
  v13 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 208);
  v14 = dyld_program_sdk_at_least();
  LODWORD(result) = FigVideoQueueRemoteClient_Create(a2, a3, v13, v14, (char *)buffer, a4, a5, a6, &v16);
  if ((_DWORD)result)
    return result;
  else
    return v16;
}

@end
