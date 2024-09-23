@implementation ICASPalettePosition

- (ICASPalettePosition)initWithPalettePosition:(int64_t)a3
{
  ICASPalettePosition *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)ICASPalettePosition;
  result = -[ICASPalettePosition init](&v5, sel_init);
  if (result)
    result->_palettePosition = a3;
  return result;
}

- (id)toJsonValueAndReturnError:(id *)a3
{
  int64_t v3;

  v3 = -[ICASPalettePosition palettePosition](self, "palettePosition", a3);
  if ((unint64_t)(v3 - 1) > 8)
    return CFSTR("unknown");
  else
    return off_1E771BF28[v3 - 1];
}

- (int64_t)palettePosition
{
  return self->_palettePosition;
}

@end
