@implementation SUUIImagePlaceholder

- (SUUIImagePlaceholder)initWithBackgroundColor:(id)a3 borderColor:(id)a4 borderWidth:(double)a5 cornerRadius:(double)a6
{
  id v10;
  id v11;
  void *v12;
  SUUIImagePlaceholder *v13;
  _QWORD aBlock[5];

  v10 = a3;
  v11 = a4;
  if (a6 >= 0.00000011920929)
  {
    aBlock[0] = MEMORY[0x24BDAC760];
    aBlock[1] = 3221225472;
    aBlock[2] = __SUUIImagePlaceholderCornerPathBlockCreate_block_invoke_2;
    aBlock[3] = &__block_descriptor_40_e53___UIBezierPath_40__0_CGRect__CGPoint_dd__CGSize_dd__8l;
    *(double *)&aBlock[4] = a6;
    v12 = _Block_copy(aBlock);
  }
  else if (a5 >= 0.00000011920929)
  {
    v12 = &__block_literal_global_54;
  }
  else
  {
    v12 = 0;
  }
  v13 = -[SUUIImagePlaceholder initWithBackgroundColor:borderColor:borderWidth:cornerPathBlock:](self, "initWithBackgroundColor:borderColor:borderWidth:cornerPathBlock:", v10, v11, v12, a5);

  return v13;
}

- (SUUIImagePlaceholder)initWithBackgroundColor:(id)a3 borderColor:(id)a4 borderWidth:(double)a5 cornerPathBlock:(id)a6
{
  id v11;
  id v12;
  id v13;
  SUUIImagePlaceholder *v14;
  SUUIImagePlaceholder *v15;
  uint64_t v16;
  id cornerPathBlock;
  objc_super v19;

  v11 = a3;
  v12 = a4;
  v13 = a6;
  v19.receiver = self;
  v19.super_class = (Class)SUUIImagePlaceholder;
  v14 = -[SUUIImagePlaceholder init](&v19, sel_init);
  v15 = v14;
  if (v14)
  {
    objc_storeStrong((id *)&v14->_backgroundColor, a3);
    objc_storeStrong((id *)&v15->_borderColor, a4);
    v15->_borderWidth = a5;
    v16 = objc_msgSend(v13, "copy");
    cornerPathBlock = v15->_cornerPathBlock;
    v15->_cornerPathBlock = (id)v16;

  }
  return v15;
}

- (UIColor)backgroundColor
{
  return self->_backgroundColor;
}

- (UIColor)borderColor
{
  return self->_borderColor;
}

- (double)borderWidth
{
  return self->_borderWidth;
}

- (id)cornerPathBlock
{
  return self->_cornerPathBlock;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_cornerPathBlock, 0);
  objc_storeStrong((id *)&self->_borderColor, 0);
  objc_storeStrong((id *)&self->_backgroundColor, 0);
}

@end
