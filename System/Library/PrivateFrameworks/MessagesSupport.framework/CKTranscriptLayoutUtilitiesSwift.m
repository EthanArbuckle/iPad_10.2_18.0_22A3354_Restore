@implementation CKTranscriptLayoutUtilitiesSwift

+ (id)layoutSizeWithSize:(CGSize)a3
{
  double height;
  double width;
  void *v5;
  id v6;
  id v7;
  id v8;

  height = a3.height;
  width = a3.width;
  v5 = (void *)objc_opt_self();
  v6 = objc_msgSend(v5, sel_absoluteDimension_, width);
  v7 = objc_msgSend(v5, sel_absoluteDimension_, height);
  v8 = objc_msgSend((id)objc_opt_self(), sel_sizeWithWidthDimension_heightDimension_, v6, v7);

  return v8;
}

+ (id)dynamicWidthLayoutSizeWithHeight:(double)a3
{
  void *v4;
  id v5;
  id v6;
  id v7;

  v4 = (void *)objc_opt_self();
  v5 = objc_msgSend(v4, sel_fractionalWidthDimension_, 1.0);
  v6 = objc_msgSend(v4, sel_absoluteDimension_, a3);
  v7 = objc_msgSend((id)objc_opt_self(), sel_sizeWithWidthDimension_heightDimension_, v5, v6);

  return v7;
}

+ (id)dynamicWidthLayoutGroupWithLayoutItem:(id)a3
{
  id v3;
  id v4;

  v3 = a3;
  v4 = _s15MessagesSupport25TranscriptLayoutUtilitiesC012dynamicWidthD5Group10layoutItemSo012NSCollectiondH0CSo0kdJ0C_tFZ_0(v3);

  return v4;
}

- (CKTranscriptLayoutUtilitiesSwift)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)swift_getObjectType();
  return -[CKTranscriptLayoutUtilitiesSwift init](&v3, sel_init);
}

@end
