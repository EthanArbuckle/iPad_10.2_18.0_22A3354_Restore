@implementation NSAffineTransform(NUImaging)

- (double)nu_CGAffineTransform
{
  double result;

  objc_msgSend(a1, "transformStruct");
  *a2 = 0u;
  a2[1] = 0u;
  result = 0.0;
  a2[2] = 0u;
  return result;
}

- (id)description
{
  __int128 v2;
  __int128 v3;
  __int128 v4;

  v3 = 0u;
  v4 = 0u;
  v2 = 0u;
  objc_msgSend(a1, "nu_CGAffineTransform");
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("[%g %g %g %g %g %g]"), v2, v3, v4);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)nu_transformWithCGAffineTransform:()NUImaging
{
  void *v4;
  __int128 v5;
  _OWORD v7[3];

  objc_msgSend(MEMORY[0x1E0CB3478], "transform");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = a3[1];
  v7[0] = *a3;
  v7[1] = v5;
  v7[2] = a3[2];
  objc_msgSend(v4, "setTransformStruct:", v7);
  return v4;
}

@end
