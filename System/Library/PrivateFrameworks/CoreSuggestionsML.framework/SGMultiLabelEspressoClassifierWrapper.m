@implementation SGMultiLabelEspressoClassifierWrapper

- (NSString)espressoModelFile
{
  return self->_espressoModelFile;
}

- (void)setEspressoModelFile:(id)a3
{
  objc_storeStrong((id *)&self->_espressoModelFile, a3);
}

- (_PASLazyPurgeableResult)classifier
{
  return self->_classifier;
}

- (void)setClassifier:(id)a3
{
  objc_storeStrong((id *)&self->_classifier, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_classifier, 0);
  objc_storeStrong((id *)&self->_espressoModelFile, 0);
}

@end
