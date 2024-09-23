@implementation MTLResourceAddressRangeArray

- (MTLResourceAddressRangeArray)initWithCount:(unint64_t)a3
{
  MTLResourceAddressRangeArray *v4;
  MTLResourceAddressRangeArray *v5;
  MTLAddressRange *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)MTLResourceAddressRangeArray;
  v4 = -[MTLResourceAddressRangeArray init](&v8, sel_init);
  v5 = v4;
  if (v4)
  {
    v4->_count = a3;
    v6 = (MTLAddressRange *)malloc_type_calloc(0x10uLL, a3, 0x7174F589uLL);
    v5->_ranges = v6;
    if (!v6)
    {

      return 0;
    }
  }
  return v5;
}

- (MTLResourceAddressRangeArray)initWithRanges:(MTLAddressRange *)a3 count:(unint64_t)a4
{
  MTLResourceAddressRangeArray *v6;
  MTLResourceAddressRangeArray *v7;

  v6 = -[MTLResourceAddressRangeArray initWithCount:](self, "initWithCount:", a4);
  v7 = v6;
  if (v6)
    memcpy(v6->_ranges, a3, 16 * a4);
  return v7;
}

- (void)dealloc
{
  objc_super v3;

  free(self->_ranges);
  self->_ranges = 0;
  v3.receiver = self;
  v3.super_class = (Class)MTLResourceAddressRangeArray;
  -[MTLResourceAddressRangeArray dealloc](&v3, sel_dealloc);
}

- (BOOL)isEqual:(id)a3
{
  objc_class *Class;
  unint64_t count;

  if (a3 == self)
    return 1;
  if (a3)
  {
    Class = object_getClass(self);
    if (Class == object_getClass(a3))
    {
      count = self->_count;
      if (count == objc_msgSend(a3, "count"))
        return memcmp(self->_ranges, (const void *)objc_msgSend(a3, "ranges"), 16 * self->_count) == 0;
    }
  }
  return 0;
}

- (unint64_t)hash
{
  return _MTLHashState((int *)self->_ranges, 16 * self->_count);
}

- (id)copyWithZone:(_NSZone *)a3
{
  return -[MTLResourceAddressRangeArray initWithRanges:count:](+[MTLResourceAddressRangeArray allocWithZone:](MTLResourceAddressRangeArray, "allocWithZone:", a3), "initWithRanges:count:", self->_ranges, self->_count);
}

- (id)description
{
  return -[MTLResourceAddressRangeArray formattedDescription:](self, "formattedDescription:", 0);
}

- (id)formattedDescription:(unint64_t)a3
{
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  unint64_t v9;
  uint64_t v10;
  void *v11;
  id v12;
  objc_super v14;
  _QWORD v15[10];

  v15[9] = *MEMORY[0x1E0C80C00];
  v5 = objc_msgSend(CFSTR("\n"), "stringByPaddingToLength:withString:startingAtIndex:", a3 + 4, CFSTR(" "), 0);
  v6 = objc_msgSend(CFSTR("\n"), "stringByPaddingToLength:withString:startingAtIndex:", a3 + 8, CFSTR(" "), 0);
  v7 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", self->_count);
  if (self->_count)
  {
    v8 = 0;
    v9 = 0;
    do
    {
      objc_msgSend(v7, "addObject:", objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("{ address = %p, length: %llu }"), self->_ranges[v8].var0, self->_ranges[v8].var1));
      ++v9;
      ++v8;
    }
    while (v9 < self->_count);
  }
  v10 = objc_msgSend(v7, "componentsJoinedByString:", v6);
  v11 = (void *)MEMORY[0x1E0CB3940];
  v14.receiver = self;
  v14.super_class = (Class)MTLResourceAddressRangeArray;
  v12 = -[MTLResourceAddressRangeArray description](&v14, sel_description);
  v15[0] = v5;
  v15[1] = CFSTR("count =");
  v15[2] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", self->_count);
  v15[3] = v5;
  v15[4] = CFSTR("ranges = {");
  v15[5] = v6;
  v15[6] = v10;
  v15[7] = v5;
  v15[8] = CFSTR("}");
  return (id)objc_msgSend(v11, "stringWithFormat:", CFSTR("%@%@"), v12, objc_msgSend((id)objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v15, 9), "componentsJoinedByString:", CFSTR(" ")));
}

- (MTLAddressRange)ranges
{
  return self->_ranges;
}

- (unint64_t)count
{
  return self->_count;
}

@end
