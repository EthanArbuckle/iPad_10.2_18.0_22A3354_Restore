@implementation _MKMultiPartStringComponent

- (_MKMultiPartStringComponent)initWithAttributedString:(id)a3 range:(_NSRange)a4
{
  NSUInteger length;
  NSUInteger location;
  id v7;
  _MKMultiPartStringComponent *v8;
  _MKMultiPartStringComponent *v9;
  uint64_t v10;
  NSAttributedString *attributedString;
  objc_super v13;

  length = a4.length;
  location = a4.location;
  v7 = a3;
  v13.receiver = self;
  v13.super_class = (Class)_MKMultiPartStringComponent;
  v8 = -[_MKMultiPartStringComponent init](&v13, sel_init);
  v9 = v8;
  if (v8)
  {
    v8->_originalRange.location = location;
    v8->_originalRange.length = length;
    v8->_range = v8->_originalRange;
    v10 = objc_msgSend(v7, "copy");
    attributedString = v9->_attributedString;
    v9->_attributedString = (NSAttributedString *)v10;

  }
  return v9;
}

- (id)description
{
  void *v3;
  uint64_t v4;
  NSAttributedString *attributedString;
  void *v6;
  void *v7;
  void *v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  attributedString = self->_attributedString;
  NSStringFromRange(self->_originalRange);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromRange(self->_range);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<_%@: %p \n%@\noriginalRange = %@\ncurrentRange = %@\n>"), v4, self, attributedString, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (NSAttributedString)attributedString
{
  return self->_attributedString;
}

- (_NSRange)originalRange
{
  NSUInteger length;
  NSUInteger location;
  _NSRange result;

  length = self->_originalRange.length;
  location = self->_originalRange.location;
  result.length = length;
  result.location = location;
  return result;
}

- (_NSRange)range
{
  NSUInteger length;
  NSUInteger location;
  _NSRange result;

  length = self->_range.length;
  location = self->_range.location;
  result.length = length;
  result.location = location;
  return result;
}

- (void)setRange:(_NSRange)a3
{
  self->_range = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_attributedString, 0);
}

@end
