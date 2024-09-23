@implementation PADAlgorithmFACFaceprintResult

- (NSArray)faceprint
{
  return self->_faceprint;
}

- (void)setFaceprint:(id)a3
{
  objc_storeStrong((id *)&self->_faceprint, a3);
}

- (unint64_t)index
{
  return self->_index;
}

- (void)setIndex:(unint64_t)a3
{
  self->_index = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_faceprint, 0);
}

@end
