@implementation FigCaptureSourceGetCaptureDeviceID

uint64_t __FigCaptureSourceGetCaptureDeviceID_block_invoke(uint64_t a1, uint64_t a2)
{
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40) = (id)objc_msgSend(*(id *)(a2 + 104), "objectForKeyedSubscript:", CFSTR("CaptureDeviceID"));
  return 0;
}

@end
