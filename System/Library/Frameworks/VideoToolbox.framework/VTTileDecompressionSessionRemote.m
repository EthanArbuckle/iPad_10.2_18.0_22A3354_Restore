@implementation VTTileDecompressionSessionRemote

uint64_t __VTTileDecompressionSessionRemote_Create_block_invoke(_QWORD *a1, mach_port_t a2, int a3, _DWORD *a4, _QWORD *a5, _QWORD *a6)
{
  pid_t v12;
  uint64_t v13;
  uint64_t v14;
  const __CFData *v15;
  uint64_t v16;
  const UInt8 *BytePtr;
  const __CFData *v18;
  unsigned int Length;
  uint64_t result;
  unsigned int v21;
  _OWORD buffer[2];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v21 = 0;
  memset(buffer, 0, sizeof(buffer));
  v12 = getpid();
  proc_name(v12, buffer, 0x20u);
  v13 = a1[5];
  v14 = *(_QWORD *)(a1[4] + 240);
  v16 = a1[6];
  v15 = (const __CFData *)a1[7];
  if (v15)
  {
    BytePtr = CFDataGetBytePtr(v15);
    v18 = (const __CFData *)a1[7];
    if (v18)
    {
      Length = CFDataGetLength(v18);
      goto LABEL_6;
    }
  }
  else
  {
    BytePtr = 0;
  }
  Length = 0;
LABEL_6:
  LODWORD(result) = VTDecompressionSessionRemoteClient_TileCreate(a2, a3, v14, v13, v16, (uint64_t)BytePtr, Length, (char *)buffer, a4, a5, a6, (int *)&v21);
  if ((_DWORD)result)
    return result;
  else
    return v21;
}

@end
