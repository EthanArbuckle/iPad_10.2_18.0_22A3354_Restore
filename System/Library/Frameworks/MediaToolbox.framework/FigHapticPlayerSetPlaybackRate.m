@implementation FigHapticPlayerSetPlaybackRate

uint64_t __FigHapticPlayerSetPlaybackRate_block_invoke(uint64_t a1)
{
  double v1;

  v1 = *(double *)(a1 + 40);
  *(float *)&v1 = v1;
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 88), "setPlaybackRate:", v1);
}

@end
