@implementation SGMultiHeadEspressoModelWrapper

- (NSString)espressoModelFile
{
  return self->_espressoModelFile;
}

- (void)setEspressoModelFile:(id)a3
{
  objc_storeStrong((id *)&self->_espressoModelFile, a3);
}

- (NSString)inputName
{
  return self->_inputName;
}

- (void)setInputName:(id)a3
{
  objc_storeStrong((id *)&self->_inputName, a3);
}

- (NSDictionary)headDimensionality
{
  return self->_headDimensionality;
}

- (void)setHeadDimensionality:(id)a3
{
  objc_storeStrong((id *)&self->_headDimensionality, a3);
}

- (_PASLazyPurgeableResult)model
{
  return self->_model;
}

- (void)setModel:(id)a3
{
  objc_storeStrong((id *)&self->_model, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_model, 0);
  objc_storeStrong((id *)&self->_headDimensionality, 0);
  objc_storeStrong((id *)&self->_inputName, 0);
  objc_storeStrong((id *)&self->_espressoModelFile, 0);
}

@end
