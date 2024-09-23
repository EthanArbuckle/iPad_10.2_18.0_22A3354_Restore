@implementation FigVideoCaptureSourceShouldEnableMaximumGeometricDistortionCorrection

uint64_t __FigVideoCaptureSourceShouldEnableMaximumGeometricDistortionCorrection_block_invoke(uint64_t a1, uint64_t a2)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = objc_msgSend((id)objc_msgSend(*(id *)(a2 + 104), "objectForKeyedSubscript:", 0x1E4952B98), "BOOLValue");
  return 0;
}

@end
