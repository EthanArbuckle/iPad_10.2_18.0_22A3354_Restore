@implementation NUImagePropertiesRequest

- (id)newRenderJob
{
  return -[NURenderJob initWithRequest:]([NUImagePropertiesJob alloc], "initWithRequest:", self);
}

- (int64_t)mediaComponentType
{
  void *v2;
  uint64_t v3;

  -[NURenderRequest internalComposition](self, "internalComposition");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "mediaType");

  if (v3 == 2)
    return 2;
  else
    return 1;
}

@end
