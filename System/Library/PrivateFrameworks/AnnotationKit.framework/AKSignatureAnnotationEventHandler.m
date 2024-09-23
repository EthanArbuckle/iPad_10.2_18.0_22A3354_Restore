@implementation AKSignatureAnnotationEventHandler

- (BOOL)alwaysLockAspectRatio
{
  return 1;
}

- (CGSize)naturalSizeForAnnotation
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  void *v8;
  uint64_t v9;
  void *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  objc_super v15;
  CGSize result;

  -[AKAnnotationEventHandler annotation](self, "annotation");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v15.receiver = self;
  v15.super_class = (Class)AKSignatureAnnotationEventHandler;
  -[AKAnnotationEventHandler naturalSizeForAnnotation](&v15, sel_naturalSizeForAnnotation);
  v5 = v4;
  v7 = v6;
  objc_msgSend(v3, "signature");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "path");

  if (v9)
  {
    objc_msgSend(v3, "signature");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "pathBounds");
    v5 = v11;
    v7 = v12;

  }
  v13 = v5;
  v14 = v7;
  result.height = v14;
  result.width = v13;
  return result;
}

@end
