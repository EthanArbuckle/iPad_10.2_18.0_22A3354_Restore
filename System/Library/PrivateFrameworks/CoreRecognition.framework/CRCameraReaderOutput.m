@implementation CRCameraReaderOutput

- (CRCameraReaderOutput)init
{
  CRCameraReaderOutput *v2;
  CRCameraReaderOutputInternal *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)CRCameraReaderOutput;
  v2 = -[CRCameraReaderOutput init](&v5, sel_init);
  if (v2)
  {
    v3 = objc_alloc_init(CRCameraReaderOutputInternal);
    -[CRCameraReaderOutput setObjectInternal:](v2, "setObjectInternal:", v3);

  }
  return v2;
}

- (CRCameraReaderOutput)initWithImageReaderOutput:(id)a3
{
  id v4;
  CRCameraReaderOutput *v5;
  CRCameraReaderOutputInternal *v6;
  void *v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  void *v17;
  int v18;
  void *v19;
  double v20;
  objc_super v22;

  v4 = a3;
  v22.receiver = self;
  v22.super_class = (Class)CRCameraReaderOutput;
  v5 = -[CRCameraReaderOutput init](&v22, sel_init);
  if (v5)
  {
    v6 = objc_alloc_init(CRCameraReaderOutputInternal);
    -[CRCameraReaderOutput setObjectInternal:](v5, "setObjectInternal:", v6);

    objc_msgSend(v4, "stringValue");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[CRCameraReaderOutput objectInternal](v5, "objectInternal");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setStringValue:", v7);

    objc_msgSend(v4, "boundingBox");
    v10 = v9;
    v12 = v11;
    v14 = v13;
    v16 = v15;
    -[CRCameraReaderOutput objectInternal](v5, "objectInternal");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setBoundingBox:", v10, v12, v14, v16);

    objc_msgSend(v4, "baselineAngle");
    LODWORD(v10) = v18;
    -[CRCameraReaderOutput objectInternal](v5, "objectInternal");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v20) = LODWORD(v10);
    objc_msgSend(v19, "setRotation:", v20);

  }
  return v5;
}

- (void)dealloc
{
  objc_super v3;

  -[CRCameraReaderOutput setObjectInternal:](self, "setObjectInternal:", 0);
  v3.receiver = self;
  v3.super_class = (Class)CRCameraReaderOutput;
  -[CRCameraReaderOutput dealloc](&v3, sel_dealloc);
}

- (NSString)type
{
  void *v2;
  void *v3;

  -[CRCameraReaderOutput objectInternal](self, "objectInternal");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "type");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (NSString)stringValue
{
  void *v2;
  void *v3;

  -[CRCameraReaderOutput objectInternal](self, "objectInternal");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringValue");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (NSString)formattedStringValue
{
  void *v2;
  void *v3;

  -[CRCameraReaderOutput objectInternal](self, "objectInternal");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "formattedStringValue");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (CRCameraReaderOutputInternal)objectInternal
{
  return (CRCameraReaderOutputInternal *)objc_getProperty(self, a2, 8, 1);
}

- (void)setObjectInternal:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 8);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_objectInternal, 0);
}

@end
