@implementation AVTAttributeCollectionViewCell

+ (id)cellIdentifier
{
  return CFSTR("AVTAttributeCollectionViewCell");
}

- (AVTAttributeValueView)valueView
{
  void *v3;
  char isKindOfClass;
  void *v5;

  -[AVTAttributeCollectionViewCell attributeView](self, "attributeView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
  {
    -[AVTAttributeCollectionViewCell attributeView](self, "attributeView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = 0;
  }
  return (AVTAttributeValueView *)v5;
}

- (void)setAttributeView:(id)a3
{
  id *p_attributeView;
  void *v6;
  id v7;

  p_attributeView = (id *)&self->_attributeView;
  v7 = a3;
  if (*p_attributeView != v7)
    objc_storeStrong((id *)&self->_attributeView, a3);
  -[AVTAttributeCollectionViewCell frameForAttributeView](self, "frameForAttributeView");
  objc_msgSend(*p_attributeView, "setFrame:");
  objc_msgSend(*p_attributeView, "setAutoresizingMask:", 18);
  -[AVTAttributeCollectionViewCell contentView](self, "contentView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addSubview:", *p_attributeView);

}

- (CGRect)frameForAttributeView
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

  -[AVTAttributeCollectionViewCell contentView](self, "contentView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "bounds");
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

- (void)prepareForReuse
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v7;

  -[AVTAttributeCollectionViewCell attributeView](self, "attributeView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "superview");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[AVTAttributeCollectionViewCell contentView](self, "contentView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4 == v5)
  {
    -[AVTAttributeCollectionViewCell attributeView](self, "attributeView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "removeFromSuperview");

  }
  v7.receiver = self;
  v7.super_class = (Class)AVTAttributeCollectionViewCell;
  -[AVTAttributeCollectionViewCell prepareForReuse](&v7, sel_prepareForReuse);
}

- (void)discardContent
{
  void *v3;
  void (**discardableContentHandler)(id, AVTAttributeCollectionViewCell *);

  -[AVTAttributeCollectionViewCell valueView](self, "valueView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "discardContent");

  discardableContentHandler = (void (**)(id, AVTAttributeCollectionViewCell *))self->discardableContentHandler;
  if (discardableContentHandler)
    discardableContentHandler[2](discardableContentHandler, self);
}

- (id)discardableContentHandler
{
  return self->discardableContentHandler;
}

- (void)setDiscardableContentHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 648);
}

- (UIView)attributeView
{
  return self->_attributeView;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_attributeView, 0);
  objc_storeStrong(&self->discardableContentHandler, 0);
}

@end
