@implementation _NTKKeylinePathView

- (_NTKKeylinePathView)initWithPath:(id)a3 secondPath:(id)a4 scale:(double)a5
{
  id v9;
  id v10;
  _NTKKeylinePathView *v11;
  void *v12;
  _QWORD v14[4];
  id v15;
  CGAffineTransform location;
  CGAffineTransform v17;
  objc_super v18;

  v9 = a3;
  v10 = a4;
  v18.receiver = self;
  v18.super_class = (Class)_NTKKeylinePathView;
  v11 = -[CLKUIColoringView initWithFrame:](&v18, sel_initWithFrame_, *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  if (v11)
  {
    memset(&v17, 0, sizeof(v17));
    CGAffineTransformMakeScale(&v17, a5, a5);
    location = v17;
    objc_msgSend(v9, "applyTransform:", &location);
    location = v17;
    objc_msgSend(v10, "applyTransform:", &location);
    objc_storeStrong((id *)&v11->_path, a3);
    objc_storeStrong((id *)&v11->_secondPath, a4);
    objc_initWeak((id *)&location, v11);
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __53___NTKKeylinePathView_initWithPath_secondPath_scale___block_invoke;
    v14[3] = &unk_1E6BD0F70;
    objc_copyWeak(&v15, (id *)&location);
    +[NTKKeylineTouchable touchableWithHandler:](NTKKeylineTouchable, "touchableWithHandler:", v14);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[_NTKKeylinePathView setTouchable:](v11, "setTouchable:", v12);

    objc_destroyWeak(&v15);
    objc_destroyWeak((id *)&location);
  }

  return v11;
}

- (void)drawRect:(CGRect)a3
{
  void *v4;
  CGRect v5;

  -[_NTKKeylinePathView bounds](self, "bounds", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (!CGRectIsEmpty(v5))
  {
    -[_NTKKeylinePathView contentColor](self, "contentColor");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "set");

    -[UIBezierPath setLineWidth:](self->_path, "setLineWidth:", 1.5);
    -[UIBezierPath stroke](self->_path, "stroke");
    -[UIBezierPath setLineWidth:](self->_secondPath, "setLineWidth:", 1.5);
    -[UIBezierPath stroke](self->_secondPath, "stroke");
  }
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double v3;
  double v4;
  double v5;
  double v6;
  CGSize result;

  -[UIBezierPath bounds](self->_path, "bounds", a3.width, a3.height);
  v4 = v3 + 1.5;
  v6 = v5 + 1.5;
  result.height = v6;
  result.width = v4;
  return result;
}

- (NTKKeylineTouchable)touchable
{
  return self->touchable;
}

- (void)setTouchable:(id)a3
{
  objc_storeStrong((id *)&self->touchable, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->touchable, 0);
  objc_storeStrong((id *)&self->_secondPath, 0);
  objc_storeStrong((id *)&self->_path, 0);
}

@end
