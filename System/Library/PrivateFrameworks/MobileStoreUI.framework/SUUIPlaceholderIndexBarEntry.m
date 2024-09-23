@implementation SUUIPlaceholderIndexBarEntry

- (SUUIPlaceholderIndexBarEntry)initWithPlaceholderSize:(CGSize)a3
{
  CGFloat height;
  CGFloat width;
  SUUIPlaceholderIndexBarEntry *v5;
  SUUIPlaceholderIndexBarEntry *v6;
  objc_super v8;

  height = a3.height;
  width = a3.width;
  v8.receiver = self;
  v8.super_class = (Class)SUUIPlaceholderIndexBarEntry;
  v5 = -[SUUIPlaceholderIndexBarEntry init](&v8, sel_init);
  v6 = v5;
  if (v5)
  {
    v5->_placeholderSize.width = width;
    v5->_placeholderSize.height = height;
    -[SUUIIndexBarEntry setEntryType:](v5, "setEntryType:", 4);
  }
  return v6;
}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromCGSize(self->_placeholderSize);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@ %p placeholderSize:%@>"), v5, self, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (unint64_t)hash
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SUUIPlaceholderIndexBarEntry;
  return -[SUUIIndexBarEntry hash](&v3, sel_hash) ^ (unint64_t)(self->_placeholderSize.width * 1000.0) ^ (unint64_t)(self->_placeholderSize.height * 10000.0);
}

- (BOOL)isEqual:(id)a3
{
  SUUIPlaceholderIndexBarEntry *v4;
  BOOL v5;
  objc_super v7;

  v4 = (SUUIPlaceholderIndexBarEntry *)a3;
  if (v4 == self)
  {
    v5 = 1;
  }
  else
  {
    objc_opt_class();
    v5 = (objc_opt_isKindOfClass() & 1) != 0
      && (v7.receiver = self,
          v7.super_class = (Class)SUUIPlaceholderIndexBarEntry,
          -[SUUIIndexBarEntry isEqual:](&v7, sel_isEqual_, v4))
      && v4->_placeholderSize.height == self->_placeholderSize.height
      && v4->_placeholderSize.width == self->_placeholderSize.width;
  }

  return v5;
}

- (CGSize)_calculatedContentSize
{
  double width;
  double height;
  CGSize result;

  width = self->_placeholderSize.width;
  height = self->_placeholderSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (CGSize)placeholderSize
{
  double width;
  double height;
  CGSize result;

  width = self->_placeholderSize.width;
  height = self->_placeholderSize.height;
  result.height = height;
  result.width = width;
  return result;
}

@end
