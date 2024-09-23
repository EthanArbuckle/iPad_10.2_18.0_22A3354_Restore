@implementation WKExtrinsicButton

- (void)setExtrinsicContentSize:(CGSize)a3
{
  self->_extrinsicContentSize = a3;
  -[WKExtrinsicButton invalidateIntrinsicContentSize](self, "invalidateIntrinsicContentSize");
}

- (CGSize)intrinsicContentSize
{
  double width;
  double height;
  CGSize result;

  width = self->_extrinsicContentSize.width;
  height = self->_extrinsicContentSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (void)contextMenuInteraction:(id)a3 willDisplayMenuForConfiguration:(id)a4 animator:(id)a5
{
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)WKExtrinsicButton;
  -[WKExtrinsicButton contextMenuInteraction:willDisplayMenuForConfiguration:animator:](&v6, sel_contextMenuInteraction_willDisplayMenuForConfiguration_animator_, a3, a4, a5);
  objc_msgSend(objc_loadWeak((id *)&self->_delegate), "wkExtrinsicButtonWillDisplayMenu:", self);
}

- (void)contextMenuInteraction:(id)a3 willEndForConfiguration:(id)a4 animator:(id)a5
{
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)WKExtrinsicButton;
  -[WKExtrinsicButton contextMenuInteraction:willEndForConfiguration:animator:](&v6, sel_contextMenuInteraction_willEndForConfiguration_animator_, a3, a4, a5);
  objc_msgSend(objc_loadWeak((id *)&self->_delegate), "wkExtrinsicButtonWillDismissMenu:", self);
}

- (CGSize)extrinsicContentSize
{
  double width;
  double height;
  CGSize result;

  width = self->_extrinsicContentSize.width;
  height = self->_extrinsicContentSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (WKExtrinsicButtonDelegate)delegate
{
  return (WKExtrinsicButtonDelegate *)objc_loadWeak((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
}

@end
