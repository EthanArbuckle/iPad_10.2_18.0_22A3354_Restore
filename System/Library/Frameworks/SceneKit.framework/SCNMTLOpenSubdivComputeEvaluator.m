@implementation SCNMTLOpenSubdivComputeEvaluator

- (uint64_t)computeEvaluator
{
  if (result)
    return *(_QWORD *)(result + 8);
  return result;
}

- (void)dealloc
{
  MTLComputeEvaluator *computeEvaluator;
  objc_super v4;

  computeEvaluator = self->_computeEvaluator;
  if (computeEvaluator)
  {
    OpenSubdiv::v3_1_1::Osd::MTLLegacyGregoryPatchTable::~MTLLegacyGregoryPatchTable((OpenSubdiv::v3_1_1::Osd::MTLLegacyGregoryPatchTable *)computeEvaluator);
    MEMORY[0x1DF0D41C0]();
  }
  v4.receiver = self;
  v4.super_class = (Class)SCNMTLOpenSubdivComputeEvaluator;
  -[SCNMTLOpenSubdivComputeEvaluator dealloc](&v4, sel_dealloc);
}

@end
