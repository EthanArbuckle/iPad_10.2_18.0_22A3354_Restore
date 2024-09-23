@implementation NUVideoAttributesRequest

- (id)newRenderJob
{
  return -[NURenderJob initWithRequest:]([NUVideoAttributesJob alloc], "initWithRequest:", self);
}

- (int64_t)mediaComponentType
{
  void *v2;
  uint64_t v3;

  -[NURenderRequest composition](self, "composition");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "mediaType");

  if ((unint64_t)(v3 - 1) > 2)
    return 0;
  else
    return qword_1A6718968[v3 - 1];
}

@end
