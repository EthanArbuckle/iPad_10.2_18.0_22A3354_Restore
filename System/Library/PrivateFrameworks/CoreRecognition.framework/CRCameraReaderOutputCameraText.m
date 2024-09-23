@implementation CRCameraReaderOutputCameraText

- (void)setOverlayString:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[CRCameraReaderOutput objectInternal](self, "objectInternal");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setOverlayString:", v4);

}

- (NSAttributedString)overlayString
{
  void *v2;
  void *v3;

  -[CRCameraReaderOutput objectInternal](self, "objectInternal");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "overlayString");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSAttributedString *)v3;
}

- (void)setRotation:(float)a3
{
  double v4;
  id v5;

  -[CRCameraReaderOutput objectInternal](self, "objectInternal");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  *(float *)&v4 = a3;
  objc_msgSend(v5, "setRotation:", v4);

}

- (float)rotation
{
  void *v2;
  float v3;
  float v4;

  -[CRCameraReaderOutput objectInternal](self, "objectInternal");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "rotation");
  v4 = v3;

  return v4;
}

- (void)setBoundingBox:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  id v7;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  -[CRCameraReaderOutput objectInternal](self, "objectInternal");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setBoundingBox:", x, y, width, height);

}

- (CGRect)boundingBox
{
  void *v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  CGRect result;

  -[CRCameraReaderOutput objectInternal](self, "objectInternal");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "boundingBox");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;

  v11 = v4;
  v12 = v6;
  v13 = v8;
  v14 = v10;
  result.size.height = v14;
  result.size.width = v13;
  result.origin.y = v12;
  result.origin.x = v11;
  return result;
}

@end
