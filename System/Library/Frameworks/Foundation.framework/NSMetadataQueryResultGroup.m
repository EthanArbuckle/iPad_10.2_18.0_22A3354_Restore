@implementation NSMetadataQueryResultGroup

- (id)_init:(id)a3 attributes:(id)a4 index:(unint64_t)a5 value:(id)a6
{
  NSMetadataQueryResultGroup *v10;
  objc_super v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v12.receiver = self;
  v12.super_class = (Class)NSMetadataQueryResultGroup;
  v10 = -[NSMetadataQueryResultGroup init](&v12, sel_init);
  v10->_private[0] = a3;
  v10->_private[1] = a4;
  v10->_private2[0] = a5;
  v10->_private[2] = a6;
  v10->_private[3] = 0;
  v10->_private[4] = objc_alloc_init(NSMutableIndexSet);
  v10->_private[5] = 0;
  return v10;
}

- (void)dealloc
{
  objc_super v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];

  self->_private[5] = 0;
  v3.receiver = self;
  v3.super_class = (Class)NSMetadataQueryResultGroup;
  -[NSMetadataQueryResultGroup dealloc](&v3, sel_dealloc);
}

- (void)_addResult:(unint64_t)a3
{
  unint64_t v5;
  uint64_t v6;
  id v7;
  id v8;

  objc_msgSend(self->_private[4], "addIndex:");
  v5 = self->_private2[0] + 1;
  if (v5 < objc_msgSend(self->_private[1], "count"))
  {
    v6 = objc_msgSend(self->_private[0], "valueOfAttribute:forResultAtIndex:", objc_msgSend(self->_private[1], "objectAtIndex:", self->_private2[0] + 1), a3);
    if (!v6)
      v6 = objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v7 = (id)objc_msgSend(self->_private[3], "objectForKey:", v6);
    if (!v7)
    {
      v7 = -[NSMetadataQueryResultGroup _init:attributes:index:value:]([NSMetadataQueryResultGroup alloc], "_init:attributes:index:value:", self->_private[0], self->_private[1], self->_private2[0] + 1, v6);
      v8 = self->_private[3];
      if (!v8)
      {
        v8 = objc_alloc_init(MEMORY[0x1E0C99E08]);
        self->_private[3] = v8;
      }
      objc_msgSend(v8, "setObject:forKey:", v7, v6);

    }
    objc_msgSend(v7, "_addResult:", a3);
  }
}

- (NSString)attribute
{
  return (NSString *)objc_msgSend(self->_private[1], "objectAtIndex:", self->_private2[0]);
}

- (id)value
{
  return self->_private[2];
}

- (NSArray)subgroups
{
  return (NSArray *)objc_msgSend(self->_private[3], "allValues");
}

- (NSUInteger)resultCount
{
  return objc_msgSend(self->_private[4], "count");
}

- (id)resultAtIndex:(NSUInteger)idx
{
  void *v7;

  if (objc_msgSend(self->_private[4], "count") <= idx)
  {
    v7 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@: index (%ld) out of bounds (%ld)"), _NSMethodExceptionProem((objc_class *)self, a2), idx, -[NSMetadataQueryResultGroup resultCount](self, "resultCount")), 0);
    objc_exception_throw(v7);
  }
  return (id)objc_msgSend(self->_private[0], "resultAtIndex:", objc_msgSend(self->_private[4], "_indexAtIndex:", idx));
}

- (void)_zapResultArray
{
  self->_private[5] = 0;
  objc_msgSend(self->_private[0], "enableUpdates");
}

- (NSArray)results
{
  NSArray *result;
  _NSMetadataQueryResultGroupArray *v4;

  result = (NSArray *)self->_private[5];
  if (!result)
  {
    objc_msgSend(self->_private[0], "disableUpdates");
    v4 = [_NSMetadataQueryResultGroupArray alloc];
    if (v4)
      v4->_group = self;
    result = v4;
    self->_private[5] = result;
  }
  return result;
}

@end
