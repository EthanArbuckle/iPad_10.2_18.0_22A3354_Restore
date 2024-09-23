@implementation WKPDFFoundTextPosition

+ (id)textPositionWithIndex:(unint64_t)a3
{
  WKPDFFoundTextPosition *v4;

  v4 = objc_alloc_init(WKPDFFoundTextPosition);
  -[WKPDFFoundTextPosition setIndex:](v4, "setIndex:", a3);
  return (id)(id)CFMakeCollectable(v4);
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
