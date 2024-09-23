@implementation FCShallowCopyPair

- (id)copyWithZone:(_NSZone *)a3
{
  FCShallowCopyPair *v4;
  void *v5;
  void *v6;
  FCShallowCopyPair *v7;

  v4 = +[FCShallowCopyPair allocWithZone:](FCShallowCopyPair, "allocWithZone:", a3);
  -[FCPair first](self, "first");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[FCPair second](self, "second");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[FCPair initWithFirst:second:](v4, "initWithFirst:second:", v5, v6);

  return v7;
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  FCMutableShallowCopyPair *v4;
  void *v5;
  void *v6;
  FCMutableShallowCopyPair *v7;

  v4 = +[FCMutableShallowCopyPair allocWithZone:](FCMutableShallowCopyPair, "allocWithZone:", a3);
  -[FCPair first](self, "first");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[FCPair second](self, "second");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[FCPair initWithFirst:second:](v4, "initWithFirst:second:", v5, v6);

  return v7;
}

@end
