@implementation _NTKKeylineImageView

- (void)setColor:(id)a3
{
  id v4;
  void (**colorizationBlock)(id, id);
  objc_super v6;

  v4 = a3;
  v6.receiver = self;
  v6.super_class = (Class)_NTKKeylineImageView;
  -[CLKUIColoringImageView setColor:](&v6, sel_setColor_, v4);
  colorizationBlock = (void (**)(id, id))self->_colorizationBlock;
  if (colorizationBlock)
    colorizationBlock[2](colorizationBlock, v4);

}

- (NTKKeylineTouchable)touchable
{
  return self->touchable;
}

- (void)setTouchable:(id)a3
{
  objc_storeStrong((id *)&self->touchable, a3);
}

- (id)colorizationBlock
{
  return self->_colorizationBlock;
}

- (void)setColorizationBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 560);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_colorizationBlock, 0);
  objc_storeStrong((id *)&self->touchable, 0);
}

@end
