@implementation CAMApplyAnimationSensitiveGeometryToView

uint64_t __CAMApplyAnimationSensitiveGeometryToView_block_invoke(uint64_t a1)
{
  __int128 v2;
  _OWORD v4[3];

  objc_msgSend(*(id *)(a1 + 32), "setBounds:", *(double *)(a1 + 40), *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64));
  v2 = *(_OWORD *)(a1 + 104);
  v4[0] = *(_OWORD *)(a1 + 88);
  v4[1] = v2;
  v4[2] = *(_OWORD *)(a1 + 120);
  return objc_msgSend(*(id *)(a1 + 32), "setTransform:", v4);
}

@end
