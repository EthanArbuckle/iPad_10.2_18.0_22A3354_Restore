@implementation MTLBinaryArchiveDescriptor

- (void)setUrl:(NSURL *)url
{
  objc_setProperty_nonatomic_copy(self, a2, url, 8);
}

- (void)setOptions:(unint64_t)a3
{
  self->_options = a3;
}

- (unint64_t)options
{
  return self->_options;
}

- (NSURL)url
{
  return self->_url;
}

- (MTLBinaryArchiveDescriptor)init
{
  MTLBinaryArchiveDescriptor *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)MTLBinaryArchiveDescriptor;
  result = -[MTLBinaryArchiveDescriptor init](&v3, sel_init);
  if (result)
    result->_options = 2;
  return result;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)MTLBinaryArchiveDescriptor;
  -[MTLBinaryArchiveDescriptor dealloc](&v3, sel_dealloc);
}

- (unint64_t)writingOptions
{
  return self->_options;
}

- (void)setWritingOptions:(unint64_t)a3
{
  self->_options = a3;
}

- (unint64_t)hash
{
  return self->_options ^ -[NSURL hash](self->_url, "hash");
}

- (BOOL)isEqual:(id)a3
{
  NSURL *url;
  int v6;

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    url = self->_url;
    if (url == *((NSURL **)a3 + 1) || (v6 = -[NSURL isEqual:](url, "isEqual:")) != 0)
      LOBYTE(v6) = self->_options == *((_QWORD *)a3 + 2);
  }
  else
  {
    LOBYTE(v6) = 0;
  }
  return v6;
}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v5;

  v5 = (_QWORD *)objc_opt_new();
  if (v5)
  {
    v5[1] = -[NSURL copyWithZone:](self->_url, "copyWithZone:", a3);
    v5[2] = self->_options;
  }
  return v5;
}

@end
