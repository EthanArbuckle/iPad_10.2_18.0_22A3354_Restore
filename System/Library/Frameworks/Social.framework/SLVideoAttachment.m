@implementation SLVideoAttachment

- (SLVideoAttachment)initWithAsset:(id)a3 preview:(id)a4
{
  id v6;
  void *v7;
  SLVideoAttachment *v8;
  objc_super v10;

  v6 = a4;
  _SLAttachmentURLForAsset(a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v10.receiver = self;
    v10.super_class = (Class)SLVideoAttachment;
    self = -[SLAttachment initWithPayload:type:previewImage:](&v10, sel_initWithPayload_type_previewImage_, v7, 9, v6);
    v8 = self;
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (SLVideoAttachment)initWithVideoData:(id)a3 preview:(id)a4
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)SLVideoAttachment;
  return -[SLAttachment initWithPayload:type:previewImage:](&v5, sel_initWithPayload_type_previewImage_, a3, 8, a4);
}

@end
