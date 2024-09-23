@implementation NWURLSessionDataTask

- (BOOL)isKindOfClass:(Class)a3
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)NWURLSessionDataTask;
  if (-[NWURLSessionTask isKindOfClass:](&v5, sel_isKindOfClass_))
    return 1;
  else
    return -[objc_class isEqual:](a3, "isEqual:", objc_opt_class());
}

- (void)joiningContext
{
  if (self)
    return (void *)*((_QWORD *)self + 49);
  return self;
}

@end
