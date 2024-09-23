@implementation SLImageAttachment

- (SLImageAttachment)initWithJPEGData:(id)a3 preview:(id)a4
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)SLImageAttachment;
  return -[SLAttachment initWithPayload:type:previewImage:](&v5, sel_initWithPayload_type_previewImage_, a3, 0, a4);
}

- (SLImageAttachment)initWithImage:(id)a3 preview:(id)a4
{
  id v6;
  void *v7;
  SLImageAttachment *v8;
  objc_super v10;

  v6 = a4;
  UIImageJPEGRepresentation((UIImage *)a3, 0.8);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v10.receiver = self;
  v10.super_class = (Class)SLImageAttachment;
  v8 = -[SLAttachment initWithPayload:type:previewImage:](&v10, sel_initWithPayload_type_previewImage_, v7, 0, v6);

  return v8;
}

- (SLImageAttachment)initWithAsset:(id)a3 preview:(id)a4
{
  id v6;
  void *v7;
  SLImageAttachment *v8;
  objc_super v10;

  v6 = a4;
  _SLAttachmentURLForAsset(a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v10.receiver = self;
    v10.super_class = (Class)SLImageAttachment;
    self = -[SLAttachment initWithPayload:type:previewImage:](&v10, sel_initWithPayload_type_previewImage_, v7, 2, v6);
    v8 = self;
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

@end
