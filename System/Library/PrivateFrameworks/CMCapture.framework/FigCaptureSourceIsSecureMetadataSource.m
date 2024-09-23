@implementation FigCaptureSourceIsSecureMetadataSource

uint64_t __FigCaptureSourceIsSecureMetadataSource_block_invoke(uint64_t a1, uint64_t a2)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = objc_msgSend((id)objc_msgSend(*(id *)(a2 + 104), "objectForKeyedSubscript:", 0x1E49525B8), "BOOLValue");
  return 0;
}

@end
