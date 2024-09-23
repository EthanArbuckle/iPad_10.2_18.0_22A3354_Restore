@implementation UIView(PDFKitUIViewExtensions)

- (id)_PDFViewParentViewController
{
  void *v1;
  id v2;
  void *v3;

  objc_msgSend(a1, "nextResponder");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v2 = v1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v3 = 0;
      goto LABEL_7;
    }
    objc_msgSend(v1, "_PDFViewParentViewController");
    v2 = (id)objc_claimAutoreleasedReturnValue();
  }
  v3 = v2;
LABEL_7:

  return v3;
}

@end
