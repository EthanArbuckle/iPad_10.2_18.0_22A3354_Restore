@implementation CUIKORTextDrawInfo

- (CUIKORTextDrawInfo)initWithContentSize:(CGSize)a3 renderingBlock:(id)a4
{
  CGFloat height;
  CGFloat width;
  id v7;
  CUIKORTextDrawInfo *v8;
  void *v9;
  id renderingBlock;
  objc_super v12;

  height = a3.height;
  width = a3.width;
  v7 = a4;
  v12.receiver = self;
  v12.super_class = (Class)CUIKORTextDrawInfo;
  v8 = -[CUIKORTextDrawInfo init](&v12, sel_init);
  if (v8)
  {
    v9 = _Block_copy(v7);
    renderingBlock = v8->_renderingBlock;
    v8->_renderingBlock = v9;

    v8->_contentSize.width = width;
    v8->_contentSize.height = height;
  }

  return v8;
}

- (CGSize)contentSize
{
  double width;
  double height;
  CGSize result;

  width = self->_contentSize.width;
  height = self->_contentSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (id)renderingBlock
{
  return self->_renderingBlock;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_renderingBlock, 0);
}

@end
