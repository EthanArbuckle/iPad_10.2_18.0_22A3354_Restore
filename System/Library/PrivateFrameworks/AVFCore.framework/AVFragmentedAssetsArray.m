@implementation AVFragmentedAssetsArray

- (AVFragmentedAssetsArray)init
{
  void *v4;
  uint64_t v5;
  NSString *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;

  v4 = (void *)MEMORY[0x1E0C99DA0];
  v5 = *MEMORY[0x1E0C99778];
  v6 = NSStringFromSelector(sel_initWithCount_firstSequenceNumber_);
  v12 = (void *)objc_msgSend(v4, "exceptionWithName:reason:userInfo:", v5, AVMethodExceptionReasonWithObjectAndSelector((objc_class *)self, a2, (uint64_t)CFSTR("Use %@ instead."), v7, v8, v9, v10, v11, (uint64_t)v6), 0);
  objc_exception_throw(v12);
}

- (AVFragmentedAssetsArray)initWithCount:(unint64_t)a3 firstSequenceNumber:(unint64_t)a4
{
  AVFragmentedAssetsArray *v6;
  AVFragmentedAssetsArray *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)AVFragmentedAssetsArray;
  v6 = -[AVFragmentedAssetsArray init](&v9, sel_init);
  v7 = v6;
  if (v6)
  {
    v6->_count = a3;
    v6->_firstSequenceNumber = a4;
    v6->_cachedFragments = (NSMutableDictionary *)(id)objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  }
  return v7;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)AVFragmentedAssetsArray;
  -[AVFragmentedAssetsArray dealloc](&v3, sel_dealloc);
}

- (unint64_t)count
{
  return self->_count;
}

- (id)objectAtIndex:(unint64_t)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v10;
  AVAssetFragment *v11;
  void *v13;

  if (self->_count <= a3)
  {
    v13 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99858], AVMethodExceptionReasonWithObjectAndSelector((objc_class *)self, a2, (uint64_t)CFSTR("index %d out of bounds."), v3, v4, v5, v6, v7, a3), 0);
    objc_exception_throw(v13);
  }
  v10 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
  v11 = (AVAssetFragment *)-[NSMutableDictionary objectForKey:](self->_cachedFragments, "objectForKey:", v10);
  if (!v11)
  {
    v11 = +[AVAssetFragment fragmentWithSequenceNumber:](AVAssetFragment, "fragmentWithSequenceNumber:", self->_firstSequenceNumber + a3);
    -[NSMutableDictionary setObject:forKey:](self->_cachedFragments, "setObject:forKey:", v11, v10);
  }
  return v11;
}

@end
