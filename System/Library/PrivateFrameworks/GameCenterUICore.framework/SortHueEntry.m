@implementation SortHueEntry

- (SortHueEntry)initWithHue:(unsigned int)a3 count:(unsigned int)a4
{
  SortHueEntry *v6;
  SortHueEntry *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)SortHueEntry;
  v6 = -[SortHueEntry init](&v9, sel_init);
  v7 = v6;
  if (v6)
  {
    -[SortHueEntry setHue:](v6, "setHue:", a3);
    -[SortHueEntry setCount:](v7, "setCount:", a4);
  }
  return v7;
}

- (id)description
{
  return (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Hue: %ld Count: %ld"), -[SortHueEntry hue](self, "hue"), -[SortHueEntry count](self, "count"));
}

- (int64_t)hue
{
  return self->_hue;
}

- (void)setHue:(int64_t)a3
{
  self->_hue = a3;
}

- (int64_t)count
{
  return self->_count;
}

- (void)setCount:(int64_t)a3
{
  self->_count = a3;
}

@end
