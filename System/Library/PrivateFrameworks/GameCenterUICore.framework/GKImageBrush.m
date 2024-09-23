@implementation GKImageBrush

- (CGSize)sizeForInput:(id)a3
{
  id v4;
  void (**inputTransform)(id, id);
  uint64_t v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  objc_super v15;
  CGSize result;

  v4 = a3;
  inputTransform = (void (**)(id, id))self->_inputTransform;
  if (inputTransform)
  {
    inputTransform[2](inputTransform, v4);
    v6 = objc_claimAutoreleasedReturnValue();

    v4 = (id)v6;
  }
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v4, "size");
LABEL_8:
    v10 = v7;
    v12 = v8;
    goto LABEL_9;
  }
  if ((objc_opt_respondsToSelector() & 1) == 0)
  {
    v15.receiver = self;
    v15.super_class = (Class)GKImageBrush;
    -[GKBrush sizeForInput:](&v15, sel_sizeForInput_, v4);
    goto LABEL_8;
  }
  objc_msgSend(v4, "bounds");
  v10 = v9;
  v12 = v11;
LABEL_9:

  v13 = v10;
  v14 = v12;
  result.height = v14;
  result.width = v13;
  return result;
}

- (double)scaleForInput:(id)a3
{
  id v4;
  void (**inputTransform)(id, id);
  uint64_t v6;
  double v7;
  double v8;
  objc_super v10;

  v4 = a3;
  inputTransform = (void (**)(id, id))self->_inputTransform;
  if (inputTransform)
  {
    inputTransform[2](inputTransform, v4);
    v6 = objc_claimAutoreleasedReturnValue();

    v4 = (id)v6;
  }
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v4, "scale");
  }
  else if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v4, "contentScaleFactor");
  }
  else
  {
    v10.receiver = self;
    v10.super_class = (Class)GKImageBrush;
    -[GKBrush scaleForInput:](&v10, sel_scaleForInput_, v4);
  }
  v8 = v7;

  return v8;
}

- (void)drawInRect:(CGRect)a3 withContext:(CGContext *)a4 input:(id)a5
{
  double height;
  double width;
  double y;
  double x;
  id v11;
  void (**inputTransform)(id, id);
  void *v13;
  objc_class *v14;
  const char *Name;
  id v16;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v11 = a5;
  inputTransform = (void (**)(id, id))self->_inputTransform;
  v13 = v11;
  v16 = v11;
  if (inputTransform)
  {
    inputTransform[2](inputTransform, v11);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    UIGraphicsPushContext(a4);
    objc_msgSend(v13, "drawInRect:", x, y, width, height);
    UIGraphicsPopContext();
    if (annotateOnceToken != -1)
      dispatch_once(&annotateOnceToken, &__block_literal_global_74);
    if (shouldAnnotateImageUsage)
    {
      v14 = (objc_class *)objc_opt_class();
      Name = class_getName(v14);
      _annotateDrawInRectWithContextAndInput((uint64_t)Name, 0, v13, x, y, width, height);
    }
  }

}

void __45__GKImageBrush_drawInRect_withContext_input___block_invoke()
{
  id v0;

  objc_msgSend(MEMORY[0x24BE3A260], "shared");
  v0 = (id)objc_claimAutoreleasedReturnValue();
  shouldAnnotateImageUsage = objc_msgSend(v0, "shouldAnnotateImageUsage");

}

- (id)inputTransform
{
  return self->_inputTransform;
}

- (void)setInputTransform:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_inputTransform, 0);
}

@end
