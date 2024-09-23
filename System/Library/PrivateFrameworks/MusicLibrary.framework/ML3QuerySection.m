@implementation ML3QuerySection

- (ML3QuerySection)initWithRange:(_NSRange)a3 sectionIndex:(unint64_t)a4
{
  NSUInteger length;
  NSUInteger location;
  ML3QuerySection *result;
  objc_super v8;

  length = a3.length;
  location = a3.location;
  v8.receiver = self;
  v8.super_class = (Class)ML3QuerySection;
  result = -[ML3QuerySection init](&v8, sel_init);
  if (result)
  {
    result->_range.location = location;
    result->_range.length = length;
    result->_sectionIndex = a4;
  }
  return result;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v8.receiver = self;
  v8.super_class = (Class)ML3QuerySection;
  -[ML3QuerySection description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromRange(self->_range);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@, _range = %@, _sectionIndex = %lu"), v4, v5, self->_sectionIndex);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (unint64_t)hash
{
  return self->_range.location ^ self->_range.length ^ self->_sectionIndex;
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  BOOL v5;

  v4 = a3;
  objc_opt_class();
  v5 = (objc_opt_isKindOfClass() & 1) != 0
    && self->_sectionIndex == v4[1]
    && self->_range.length == v4[3]
    && self->_range.location == v4[2];

  return v5;
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

- (unint64_t)sectionIndex
{
  return self->_sectionIndex;
}

- (void)setSectionIndex:(unint64_t)a3
{
  self->_sectionIndex = a3;
}

@end
