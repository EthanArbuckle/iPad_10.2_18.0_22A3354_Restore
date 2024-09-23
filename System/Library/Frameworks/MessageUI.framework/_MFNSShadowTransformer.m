@implementation _MFNSShadowTransformer

- (id)transformValue:(id)a3 inverse:(BOOL)a4
{
  _BOOL4 v4;
  id v5;
  _MFNSShadow *v6;
  _MFNSShadow *v7;

  v4 = a4;
  v5 = a3;
  if (!v5)
    goto LABEL_8;
  if (!v4)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v6 = -[_MFNSShadow initWithShadow:]([_MFNSShadow alloc], "initWithShadow:", v5);
      goto LABEL_7;
    }
LABEL_8:
    v7 = 0;
    goto LABEL_9;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    goto LABEL_8;
  objc_msgSend(v5, "shadow");
  v6 = (_MFNSShadow *)objc_claimAutoreleasedReturnValue();
LABEL_7:
  v7 = v6;
LABEL_9:

  return v7;
}

@end
