@implementation VTMotionEstimationSessionRemote

uint64_t __VTMotionEstimationSessionRemote_Create_block_invoke(uint64_t a1, mach_port_t a2, int a3, _DWORD *a4, _QWORD *a5, _QWORD *a6)
{
  pid_t v12;
  const __CFData *v13;
  uint64_t v14;
  unsigned int v15;
  unsigned int v16;
  const UInt8 *BytePtr;
  const __CFData *v18;
  int Length;
  uint64_t result;
  unsigned int v21;
  _OWORD buffer[2];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v21 = 0;
  memset(buffer, 0, sizeof(buffer));
  v12 = getpid();
  proc_name(v12, buffer, 0x20u);
  v13 = *(const __CFData **)(a1 + 40);
  v14 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 224);
  v15 = *(_DWORD *)(a1 + 48);
  v16 = *(_DWORD *)(a1 + 52);
  if (v13)
  {
    BytePtr = CFDataGetBytePtr(v13);
    v18 = *(const __CFData **)(a1 + 40);
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
  LODWORD(result) = VTCompressionSessionRemoteClient_MotionEstimationCreate(a2, a3, v14, v15, v16, (uint64_t)BytePtr, Length, (char *)buffer, a4, a5, a6, &v21);
  if ((_DWORD)result)
    return result;
  else
    return v21;
}

@end
