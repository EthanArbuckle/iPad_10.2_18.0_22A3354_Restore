@implementation CNFixedDetectionTrack

- (CNFixedDetectionTrack)initWithFocusDisparity:(float)focusDisparity
{
  id v5;
  double v6;
  void *v7;
  CNFixedDetectionTrack *v8;
  objc_super v10;

  v5 = objc_alloc(MEMORY[0x24BE74B60]);
  *(float *)&v6 = focusDisparity;
  v7 = (void *)objc_msgSend(v5, "initWithFocusDistance:", v6);
  v10.receiver = self;
  v10.super_class = (Class)CNFixedDetectionTrack;
  v8 = -[CNDetectionTrack _initWithInternal:](&v10, sel__initWithInternal_, v7);

  return v8;
}

- (CNFixedDetectionTrack)initWithOriginalDetection:(CNDetection *)originalDetection
{
  objc_class *v4;
  CNDetection *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  CNFixedDetectionTrack *v10;
  objc_super v12;

  v4 = (objc_class *)MEMORY[0x24BE74B60];
  v5 = originalDetection;
  v6 = [v4 alloc];
  -[CNDetection internalDetection](v5, "internalDetection");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = (void *)objc_msgSend(v7, "copy");
  v9 = (void *)objc_msgSend(v6, "initWithDetection:", v8);
  v12.receiver = self;
  v12.super_class = (Class)CNFixedDetectionTrack;
  v10 = -[CNDetectionTrack _initWithInternal:](&v12, sel__initWithInternal_, v9);

  return v10;
}

- (float)focusDisparity
{
  void *v2;
  float v3;
  float v4;

  -[CNFixedDetectionTrack _internalFixedTrack](self, "_internalFixedTrack");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "focusDistance");
  v4 = v3;

  return v4;
}

- (CNDetection)originalDetection
{
  void *v2;
  void *v3;
  id v4;
  char v6;
  char v7;

  -[CNFixedDetectionTrack _internalFixedTrack](self, "_internalFixedTrack");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "detection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3 && (objc_msgSend(v3, "time"), (v7 & 1) != 0) && (objc_msgSend(v3, "time"), (v6 & 0x10) != 0))
    v4 = 0;
  else
    v4 = +[CNDetection _copyDetectionFromInternal:](CNDetection, "_copyDetectionFromInternal:", v3);

  return (CNDetection *)v4;
}

@end
