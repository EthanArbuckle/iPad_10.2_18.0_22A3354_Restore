@implementation DiagonalPatternInvertedAndScaled

CGPatternRef __DiagonalPatternInvertedAndScaled_block_invoke()
{
  __int128 v0;
  void *v1;
  double v2;
  CGFloat v3;
  CGPatternRef result;
  CGAffineTransform v5;
  CGAffineTransform matrix;
  CGAffineTransform v7;
  CGRect v8;

  v0 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
  *(_OWORD *)&v7.a = *MEMORY[0x1E0C9BAA8];
  *(_OWORD *)&v7.c = v0;
  *(_OWORD *)&v7.tx = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 32);
  *(_OWORD *)&matrix.a = *(_OWORD *)&v7.a;
  *(_OWORD *)&matrix.c = v0;
  *(_OWORD *)&matrix.tx = *(_OWORD *)&v7.tx;
  CGAffineTransformTranslate(&v7, &matrix, 0.0, 4.0);
  v5 = v7;
  CGAffineTransformScale(&matrix, &v5, 1.0, -1.0);
  v7 = matrix;
  objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "scale");
  v3 = v2;

  v5 = v7;
  CGAffineTransformScale(&matrix, &v5, v3, v3);
  v7 = matrix;
  v8.origin.x = 0.0;
  v8.origin.y = 0.0;
  v8.size.width = 4.0;
  v8.size.height = 4.0;
  result = CGPatternCreate(0, v8, &matrix, 4.0, 4.0, kCGPatternTilingConstantSpacing, 0, &DiagonalSlashPatternCallbacks);
  DiagonalPatternInvertedAndScaled_diagonalPattern = (uint64_t)result;
  return result;
}

@end
