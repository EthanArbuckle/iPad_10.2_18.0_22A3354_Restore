@implementation _IMTranscriptBubbleSizeCacheEntry

- (_IMTranscriptBubbleSizeCacheEntry)initWithSize:(CGSize)a3 maximumWidth:(double)a4
{
  CGFloat height;
  CGFloat width;
  _IMTranscriptBubbleSizeCacheEntry *result;
  objc_super v8;

  height = a3.height;
  width = a3.width;
  v8.receiver = self;
  v8.super_class = (Class)_IMTranscriptBubbleSizeCacheEntry;
  result = -[_IMTranscriptBubbleSizeCacheEntry init](&v8, sel_init);
  if (result)
  {
    result->_size.width = width;
    result->_size.height = height;
    result->_maximumWidth = a4;
  }
  return result;
}

- (id)copyWithZone:(_NSZone *)a3
{
  _IMTranscriptBubbleSizeCacheEntry *v4;
  const char *v5;
  uint64_t v6;

  v4 = [_IMTranscriptBubbleSizeCacheEntry alloc];
  return (id)objc_msgSend_initWithSize_maximumWidth_(v4, v5, v6, self->_size.width, self->_size.height, self->_maximumWidth);
}

- (double)minimumWidth
{
  return self->_size.width;
}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  const char *v14;
  uint64_t v15;
  const char *v16;
  uint64_t v17;
  void *v18;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_minimumWidth(self, v6, v7);
  v9 = v8;
  objc_msgSend_maximumWidth(self, v10, v11);
  v13 = v12;
  objc_msgSend_size(self, v14, v15);
  objc_msgSend_stringWithFormat_(v3, v16, (uint64_t)CFSTR("<%@ (%p)> MINWIDTH: %f, MAXWIDTH: %f, HEIGHT: %f"), v5, self, v9, v13, v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  return v18;
}

- (CGSize)size
{
  double width;
  double height;
  CGSize result;

  width = self->_size.width;
  height = self->_size.height;
  result.height = height;
  result.width = width;
  return result;
}

- (void)setSize:(CGSize)a3
{
  self->_size = a3;
}

- (double)maximumWidth
{
  return self->_maximumWidth;
}

- (void)setMaximumWidth:(double)a3
{
  self->_maximumWidth = a3;
}

@end
