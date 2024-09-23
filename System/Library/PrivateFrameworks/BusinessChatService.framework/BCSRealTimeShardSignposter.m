@implementation BCSRealTimeShardSignposter

- (id)_initWithShardType:(int64_t)a3 signpostIdentifier:(unint64_t)a4
{
  uint64_t v5;
  id result;
  objc_super v7;

  if ((unint64_t)(a3 - 2) > 3)
    v5 = 1;
  else
    v5 = qword_20AD1B468[a3 - 2];
  v7.receiver = self;
  v7.super_class = (Class)BCSRealTimeShardSignposter;
  result = -[BCSRealTimeSignposter _initWithType:signpostIdentifier:](&v7, sel__initWithType_signpostIdentifier_, v5, a4);
  if (result)
    *((_QWORD *)result + 3) = a3;
  return result;
}

- (int64_t)shardType
{
  return self->_shardType;
}

@end
