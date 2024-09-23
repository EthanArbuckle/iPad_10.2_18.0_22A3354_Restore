@implementation AVTUINSURL

- (unint64_t)hash
{
  void *v2;
  void *v3;
  unint64_t v4;

  -[AVTUINSURL path](self, "path");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "lastPathComponent");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");

  return v4;
}

@end
