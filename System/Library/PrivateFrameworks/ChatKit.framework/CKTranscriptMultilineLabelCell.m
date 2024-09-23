@implementation CKTranscriptMultilineLabelCell

+ (id)createStampLabelView
{
  void *v2;
  objc_super v4;

  v4.receiver = a1;
  v4.super_class = (Class)&OBJC_METACLASS___CKTranscriptMultilineLabelCell;
  objc_msgSendSuper2(&v4, sel_createStampLabelView);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setNumberOfLines:", 0);
  return v2;
}

+ (id)reuseIdentifier
{
  return CFSTR("TMS");
}

@end
