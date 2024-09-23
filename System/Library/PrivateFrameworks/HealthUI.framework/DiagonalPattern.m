@implementation DiagonalPattern

CGPatternRef __DiagonalPattern_block_invoke()
{
  __int128 v0;
  uint64_t v1;
  double v2;
  double v3;
  CGPatternRef result;
  CGAffineTransform v5;

  v0 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
  *(_OWORD *)&v5.a = *MEMORY[0x1E0C9BAA8];
  *(_OWORD *)&v5.c = v0;
  *(_OWORD *)&v5.tx = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 32);
  v1 = 0;
  *(_QWORD *)&v0 = 0;
  v2 = 4.0;
  v3 = 4.0;
  result = CGPatternCreate(0, *(CGRect *)((char *)&v0 - 8), &v5, 4.0, 4.0, kCGPatternTilingConstantSpacing, 0, &DiagonalSlashPatternCallbacks);
  DiagonalPattern_diagonalPattern = (uint64_t)result;
  return result;
}

@end
