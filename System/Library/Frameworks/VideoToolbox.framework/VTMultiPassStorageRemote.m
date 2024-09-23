@implementation VTMultiPassStorageRemote

uint64_t __VTMultiPassStorageRemote_Create_block_invoke(uint64_t a1, mach_port_name_t a2, int a3, _DWORD *a4, _QWORD *a5, _QWORD *a6)
{
  pid_t v12;
  uint64_t v13;
  uint64_t v14;
  int v15;
  const __CFData *v16;
  const UInt8 *BytePtr;
  const __CFData *v18;
  int Length;
  __int128 v20;
  uint64_t result;
  unsigned int v22;
  _OWORD v23[3];
  _OWORD buffer[2];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v22 = 0;
  memset(buffer, 0, sizeof(buffer));
  v12 = getpid();
  proc_name(v12, buffer, 0x20u);
  v13 = *(_QWORD *)(a1 + 40);
  v14 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 224);
  if (v13)
    v15 = strlen(*(const char **)(a1 + 40)) + 1;
  else
    v15 = 0;
  v16 = *(const __CFData **)(a1 + 48);
  if (v16)
  {
    BytePtr = CFDataGetBytePtr(v16);
    v18 = *(const __CFData **)(a1 + 48);
    if (v18)
    {
      Length = CFDataGetLength(v18);
      goto LABEL_9;
    }
  }
  else
  {
    BytePtr = 0;
  }
  Length = 0;
LABEL_9:
  v20 = *(_OWORD *)(a1 + 72);
  v23[0] = *(_OWORD *)(a1 + 56);
  v23[1] = v20;
  v23[2] = *(_OWORD *)(a1 + 88);
  LODWORD(result) = VTCompressionSessionRemoteClient_MultiPassStorageCreate(a2, a3, v14, v13, v15, v23, (uint64_t)BytePtr, Length, (char *)buffer, a4, a5, a6, &v22);
  if ((_DWORD)result)
    return result;
  else
    return v22;
}

@end
