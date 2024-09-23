@implementation WKPDFFoundTextRange

+ (id)foundTextRangeWithIndex:(unint64_t)a3
{
  WKPDFFoundTextRange *v4;

  v4 = objc_alloc_init(WKPDFFoundTextRange);
  -[WKPDFFoundTextRange setIndex:](v4, "setIndex:", a3);
  return (id)(id)CFMakeCollectable(v4);
}

- (id)start
{
  return +[WKPDFFoundTextPosition textPositionWithIndex:](WKPDFFoundTextPosition, "textPositionWithIndex:", -[WKPDFFoundTextRange index](self, "index"));
}

- (BOOL)isEmpty
{
  return 0;
}

- (unint64_t)index
{
  return self->_index;
}

- (void)setIndex:(unint64_t)a3
{
  self->_index = a3;
}

@end
