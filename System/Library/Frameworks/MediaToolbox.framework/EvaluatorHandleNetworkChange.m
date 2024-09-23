@implementation EvaluatorHandleNetworkChange

uint64_t __fnpe_EvaluatorHandleNetworkChange_block_invoke(_QWORD *a1)
{
  uint64_t result;

  result = FigCFWeakReferenceHolderCopyReferencedObject();
  *(_QWORD *)(*(_QWORD *)(a1[4] + 8) + 24) = result;
  *(_QWORD *)(*(_QWORD *)(a1[5] + 8) + 24) = *(_QWORD *)(a1[6] + 24);
  return result;
}

@end
