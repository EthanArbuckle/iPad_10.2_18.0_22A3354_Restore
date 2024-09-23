@implementation GEOColor

- (GEOColor)initWithSystemColor:(int)a3
{
  GEOColor *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)GEOColor;
  result = -[GEOColor init](&v5, sel_init);
  if (result)
    result->_systemColor = a3;
  return result;
}

- (GEOColor)initWithColor:(id)a3
{
  unsigned int v3;

  if (a3)
  {
    if ((*((_BYTE *)a3 + 20) & 1) != 0)
    {
      v3 = *((_DWORD *)a3 + 4);
      if (v3 - 1 >= 5)
        a3 = 0;
      else
        a3 = (id)v3;
    }
    else
    {
      a3 = 0;
    }
  }
  return -[GEOColor initWithSystemColor:](self, "initWithSystemColor:", a3);
}

- (int)systemColor
{
  return self->_systemColor;
}

@end
