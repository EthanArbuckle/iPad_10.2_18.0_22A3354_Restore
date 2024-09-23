@implementation SAUIImageResource

- (id)_convertedImageOfSize:(CGSize)a3
{
  double height;
  double width;
  void *v6;
  id v7;

  height = a3.height;
  width = a3.width;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[SAUIImageResource resourceUrl](self, "resourceUrl"));
  if (v6)
  {
    v7 = objc_alloc_init((Class)SFURLImage);
    objc_msgSend(v7, "setUrlValue:", v6);
  }
  else
  {
    v7 = 0;
  }
  objc_msgSend(v7, "setSize:", width, height);
  objc_msgSend(v7, "setCornerRoundingStyle:", 2);
  -[SAUIImageResource scaleFactor](self, "scaleFactor");
  objc_msgSend(v7, "setScale:");

  return v7;
}

@end
