@implementation AIAudiogramCropResult

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  objc_super v9;
  CGRect v10;
  CGRect v11;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v9.receiver = self;
  v9.super_class = (Class)AIAudiogramCropResult;
  -[AIAudiogramCropResult description](&v9, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[AIAudiogramCropResult graphRect](self, "graphRect");
  NSStringFromCGRect(v10);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[AIAudiogramCropResult symbolsRect](self, "symbolsRect");
  NSStringFromCGRect(v11);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@\nGraph: %@\nSymbols: %@"), v4, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (CGRect)graphRect
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_graphRect.origin.x;
  y = self->_graphRect.origin.y;
  width = self->_graphRect.size.width;
  height = self->_graphRect.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (void)setGraphRect:(CGRect)a3
{
  self->_graphRect = a3;
}

- (CGRect)symbolsRect
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_symbolsRect.origin.x;
  y = self->_symbolsRect.origin.y;
  width = self->_symbolsRect.size.width;
  height = self->_symbolsRect.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (void)setSymbolsRect:(CGRect)a3
{
  self->_symbolsRect = a3;
}

@end
