@implementation CAMediaTimingFunction(MKAdditions)

+ (id)sigmoidFunction
{
  void *v0;
  id v1;
  double v2;
  double v3;
  double v4;
  double v5;
  uint64_t v6;
  void *v7;

  v0 = (void *)sigmoidFunction__sigmoidFunction;
  if (!sigmoidFunction__sigmoidFunction)
  {
    v1 = objc_alloc(MEMORY[0x1E0CD27D0]);
    LODWORD(v2) = 0.5;
    LODWORD(v3) = 0.5;
    LODWORD(v4) = 0.5;
    LODWORD(v5) = 1.0;
    v6 = objc_msgSend(v1, "initWithControlPoints::::", v2, v3, v4, v5);
    v7 = (void *)sigmoidFunction__sigmoidFunction;
    sigmoidFunction__sigmoidFunction = v6;

    v0 = (void *)sigmoidFunction__sigmoidFunction;
  }
  return v0;
}

@end
