@implementation IKPlayerTimeBoundaryDidCrossEventUserInfo

- (IKPlayerTimeBoundaryDidCrossEventUserInfo)initWithBoundary:(double)a3
{
  IKPlayerTimeBoundaryDidCrossEventUserInfo *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)IKPlayerTimeBoundaryDidCrossEventUserInfo;
  result = -[IKPlayerTimeBoundaryDidCrossEventUserInfo init](&v5, sel_init);
  if (result)
    result->_boundary = a3;
  return result;
}

- (NSDictionary)properties
{
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_boundary);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v4, CFSTR("boundary"));

  v5 = (void *)objc_msgSend(v3, "copy");
  return (NSDictionary *)v5;
}

- (double)boundary
{
  return self->_boundary;
}

@end
