@implementation NTKFaceDebugAPLSnapshotWithBaseImage

uint64_t ___NTKFaceDebugAPLSnapshotWithBaseImage_block_invoke(uint64_t a1, void *a2)
{
  CGContext *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  id v8;
  const CGPath *v9;

  v3 = (CGContext *)objc_msgSend(a2, "CGContext");
  v4 = *MEMORY[0x1E0C9D648];
  v5 = *(double *)(MEMORY[0x1E0C9D648] + 8);
  v6 = *(double *)(a1 + 48);
  v7 = *(double *)(a1 + 56);
  objc_msgSend(*(id *)(a1 + 32), "drawInRect:", *MEMORY[0x1E0C9D648], v5, v6, v7);
  CGContextSetRGBFillColor(v3, 0.0, 0.0, 0.0, 0.5);
  objc_msgSend(MEMORY[0x1E0DC3508], "bezierPathWithRect:", v4, v5, v6, v7);
  v8 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v9 = (const CGPath *)objc_msgSend(v8, "CGPath");

  CGContextAddPath(v3, v9);
  CGContextDrawPath(v3, kCGPathFill);
  return objc_msgSend(*(id *)(a1 + 40), "drawAtPoint:", 0.0, (*(double *)(a1 + 56) - *(double *)(a1 + 64)) * 0.5);
}

@end
