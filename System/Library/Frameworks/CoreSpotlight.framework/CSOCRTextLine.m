@implementation CSOCRTextLine

- (id)description
{
  __CFString *v3;
  void *v4;

  if (self->_count)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR(" score: %f string: %@"), *(_QWORD *)&self->_scores[0], self->_strings[0]);
    v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = &stru_1E2406B38;
  }
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("<%@:%p; t: %d (x: %f y: %f w: %f, h: %f)%@>"),
    objc_opt_class(),
    self,
    self->_isTitle,
    *(_QWORD *)&self->_textBounds.origin.x,
    *(_QWORD *)&self->_textBounds.origin.y,
    *(_QWORD *)&self->_textBounds.size.width,
    *(_QWORD *)&self->_textBounds.size.height,
    v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (CSOCRTextLine)initWithTextBounds:(CGRect)a3 isTitle:(BOOL)a4
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  CSOCRTextLine *result;
  objc_super v10;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v10.receiver = self;
  v10.super_class = (Class)CSOCRTextLine;
  result = -[CSOCRTextLine init](&v10, sel_init);
  if (result)
  {
    result->_textBounds.origin.x = x;
    result->_textBounds.origin.y = y;
    result->_textBounds.size.width = width;
    result->_textBounds.size.height = height;
    result->_isTitle = a4;
  }
  return result;
}

- (void)addCandidate:(id)a3 confidence:(double)a4
{
  int64_t count;
  uint64_t v7;
  Class *v8;
  Class v9;

  count = self->_count;
  if (count <= 2)
  {
    v7 = objc_msgSend(a3, "copy");
    v8 = &self->super.isa + count;
    v9 = v8[1];
    v8[1] = (Class)v7;

    *((double *)v8 + 4) = a4;
    ++self->_count;
  }
}

- (void)appendToString:(id)a3
{
  int64_t v4;
  void *v5;
  id v6;

  v6 = a3;
  if (self->_count >= 1)
  {
    v4 = 0;
    do
    {
      v5 = v6;
      if (v4)
      {
        objc_msgSend(v6, "appendString:", CFSTR("\n"));
        v5 = v6;
      }
      objc_msgSend(v5, "appendString:", self->_strings[v4++]);
    }
    while (v4 < self->_count);
  }

}

- (void).cxx_destruct
{
  uint64_t v3;

  v3 = 24;
  do
  {
    objc_storeStrong((id *)((char *)&self->super.isa + v3), 0);
    v3 -= 8;
  }
  while (v3);
}

@end
