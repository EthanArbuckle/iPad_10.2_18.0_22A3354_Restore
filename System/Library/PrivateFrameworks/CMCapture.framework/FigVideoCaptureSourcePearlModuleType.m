@implementation FigVideoCaptureSourcePearlModuleType

uint64_t __FigVideoCaptureSourcePearlModuleType_block_invoke(uint64_t a1, uint64_t a2)
{
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = objc_msgSend((id)objc_msgSend(*(id *)(a2 + 104), "objectForKeyedSubscript:", CFSTR("PearlModuleType")), "intValue");
  return 0;
}

@end
