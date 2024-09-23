@implementation MADGenerativePlaygroundsMD1TextEncoderResource

- (int64_t)revision
{
  return 7;
}

- (id)additionalLayerNames
{
  return &unk_1E6B76860;
}

- (int64_t)tokenEmbeddingType
{
  return 6;
}

- (unint64_t)version
{
  return 1;
}

- (id)tokensForAgeType:(unsigned __int16)a3
{
  void *v3;

  v3 = &unk_1E6B76890;
  if (a3 != 2)
    v3 = 0;
  if (a3 == 1)
    return &unk_1E6B76878;
  else
    return v3;
}

@end
