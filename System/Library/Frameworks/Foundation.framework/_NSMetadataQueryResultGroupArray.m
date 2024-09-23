@implementation _NSMetadataQueryResultGroupArray

- (void)dealloc
{
  objc_super v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  objc_msgSend(self->_group, "_zapResultArray");

  v3.receiver = self;
  v3.super_class = (Class)_NSMetadataQueryResultGroupArray;
  -[_NSMetadataQueryResultGroupArray dealloc](&v3, sel_dealloc);
}

- (unint64_t)count
{
  return objc_msgSend(self->_group, "resultCount");
}

- (id)objectAtIndex:(unint64_t)a3
{
  void *v7;

  if (objc_msgSend(self->_group, "resultCount") <= a3)
  {
    v7 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@: index (%ld) out of bounds (%ld)"), _NSMethodExceptionProem((objc_class *)self, a2), a3, objc_msgSend(self->_group, "resultCount")), 0);
    objc_exception_throw(v7);
  }
  return (id)objc_msgSend(self->_group, "resultAtIndex:", a3);
}

@end
