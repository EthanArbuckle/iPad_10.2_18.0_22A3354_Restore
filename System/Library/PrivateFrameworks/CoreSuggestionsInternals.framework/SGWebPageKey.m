@implementation SGWebPageKey

+ (BOOL)isSupportedEntityType:(int64_t)a3
{
  return a3 == 18;
}

- (id)description
{
  id v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = objc_alloc(MEMORY[0x1E0CB3940]);
  -[SGMessageKey source](self, "source");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SGMessageKey uniqueIdentifier](self, "uniqueIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("<SGWebPageKey source=%@ uniqueIdentifier=%@"), v4, v5);

  return v6;
}

@end
