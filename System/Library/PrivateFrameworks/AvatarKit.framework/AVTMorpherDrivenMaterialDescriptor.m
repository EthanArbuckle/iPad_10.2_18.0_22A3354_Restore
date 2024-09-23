@implementation AVTMorpherDrivenMaterialDescriptor

- (uint64_t)setMorphTargetIndex:(uint64_t)result
{
  if (result)
    *(_QWORD *)(result + 16) = a2;
  return result;
}

- (void)setPropertyName:(void *)a1
{
  if (a1)
    objc_setProperty_nonatomic_copy(a1, newValue, newValue, 32);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_propertyName, 0);
  objc_storeStrong((id *)&self->_material, 0);
  objc_storeStrong((id *)&self->_readMorpherNode, 0);
}

@end
