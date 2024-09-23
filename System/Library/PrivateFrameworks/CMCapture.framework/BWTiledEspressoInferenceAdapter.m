@implementation BWTiledEspressoInferenceAdapter

- (id)inferenceProviderForType:(int)a3 version:(id)a4 configuration:(id)a5 resourceProvider:(id)a6 status:(int *)a7
{
  __objc2_class **v10;
  void *v11;

  if ((a3 - 159) < 2)
  {
    v10 = off_1E49149F0;
  }
  else if ((a3 - 170) >= 2)
  {
    if (a3 != 107)
    {
      v11 = 0;
      if (!a7)
        return v11;
      goto LABEL_10;
    }
    v10 = off_1E4914C90;
  }
  else
  {
    v10 = off_1E4914CA0;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    a5 = 0;
  v11 = (void *)objc_msgSend(objc_alloc(*v10), "initWithConfiguration:resourceProvider:", a5, a6);
  if (a7)
LABEL_10:
    *a7 = 0;
  return v11;
}

+ (void)initialize
{
  objc_opt_class();
}

@end
