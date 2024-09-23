@implementation _MFFontToFontDescriptorTransformer

- (id)transformValue:(id)a3 inverse:(BOOL)a4
{
  _BOOL4 v4;
  id v5;
  uint64_t v6;
  void *v7;

  v4 = a4;
  v5 = a3;
  if (!v5)
    goto LABEL_8;
  if (!v4)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v5, "fontDescriptor");
      v6 = objc_claimAutoreleasedReturnValue();
      goto LABEL_7;
    }
LABEL_8:
    v7 = 0;
    goto LABEL_9;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    goto LABEL_8;
  objc_msgSend(MEMORY[0x1E0DC1350], "fontWithDescriptor:size:", v5, 0.0);
  v6 = objc_claimAutoreleasedReturnValue();
LABEL_7:
  v7 = (void *)v6;
LABEL_9:

  return v7;
}

@end
