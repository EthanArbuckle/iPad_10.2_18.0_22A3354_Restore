@implementation MADGenerativePlaygroundsMD4TextEncoderResource

- (int64_t)revision
{
  return 8;
}

- (id)additionalLayerNames
{
  return &unk_1E6B768A8;
}

- (int64_t)tokenEmbeddingType
{
  return 6;
}

- (unint64_t)version
{
  return 4;
}

- (id)tokensForAgeType:(unsigned __int16)a3
{
  void *v3;

  v3 = &unk_1E6B768D8;
  if (a3 != 2)
    v3 = 0;
  if (a3 == 1)
    return &unk_1E6B768C0;
  else
    return v3;
}

@end
