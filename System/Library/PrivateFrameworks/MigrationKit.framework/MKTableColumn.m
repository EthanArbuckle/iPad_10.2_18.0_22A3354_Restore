@implementation MKTableColumn

- (void)adjustWidthToFit:(int)a3
{
  uint64_t v3;

  v3 = *(_QWORD *)&a3;
  if (-[MKTableColumn width](self, "width") < a3)
    -[MKTableColumn setWidth:](self, "setWidth:", v3);
}

- (int)width
{
  return self->_width;
}

- (void)setWidth:(int)a3
{
  self->_width = a3;
}

@end
