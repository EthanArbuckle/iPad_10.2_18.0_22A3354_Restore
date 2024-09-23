@implementation PADAlgorithmFACInput

- (NSArray)facePoseValues
{
  return self->_facePoseValues;
}

- (void)setFacePoseValues:(id)a3
{
  objc_storeStrong((id *)&self->_facePoseValues, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_facePoseValues, 0);
}

@end
