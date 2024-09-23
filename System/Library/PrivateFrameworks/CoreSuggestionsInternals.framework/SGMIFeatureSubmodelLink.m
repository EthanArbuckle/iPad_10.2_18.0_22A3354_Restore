@implementation SGMIFeatureSubmodelLink

- (id)initFor:(int64_t)a3 fromUnigram:(int64_t)a4 andBigram:(int64_t)a5
{
  id result;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)SGMIFeatureSubmodelLink;
  result = -[SGMIFeatureSubmodelLink init](&v9, sel_init);
  if (result)
  {
    *((_QWORD *)result + 1) = a3;
    *((_QWORD *)result + 2) = a4;
    *((_QWORD *)result + 3) = a5;
  }
  return result;
}

- (int64_t)submodeledFeature
{
  return self->_submodeledFeature;
}

- (int64_t)unigramFeature
{
  return self->_unigramFeature;
}

- (int64_t)bigramFeature
{
  return self->_bigramFeature;
}

@end
