@implementation FKOrderMessagesPreviewMetadataText

- (id)_initWithText:(id)a3
{
  id v4;
  FKOrderMessagesPreviewMetadataText *v5;
  uint64_t v6;
  NSString *text;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)FKOrderMessagesPreviewMetadataText;
  v5 = -[FKOrderMessagesPreviewMetadataText init](&v9, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "text");
    v6 = objc_claimAutoreleasedReturnValue();
    text = v5->_text;
    v5->_text = (NSString *)v6;

    v5->_overrideColor = CGColorRetain((CGColorRef)objc_msgSend(v4, "overrideColor"));
  }

  return v5;
}

- (void)dealloc
{
  objc_super v3;

  CGColorRelease(self->_overrideColor);
  v3.receiver = self;
  v3.super_class = (Class)FKOrderMessagesPreviewMetadataText;
  -[FKOrderMessagesPreviewMetadataText dealloc](&v3, sel_dealloc);
}

- (NSString)text
{
  return self->_text;
}

- (CGColor)overrideColor
{
  return self->_overrideColor;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_text, 0);
}

@end
