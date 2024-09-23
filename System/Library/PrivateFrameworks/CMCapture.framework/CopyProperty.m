@implementation CopyProperty

uint64_t __captureDeferredPhotoProcessor_CopyProperty_block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24) = *(_BYTE *)(*(_QWORD *)(result + 40) + 56);
  return result;
}

uint64_t __captureDeferredPhotoProcessor_CopyProperty_block_invoke_2(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(+[FigCaptureDeferredProcessingEngine sharedProcessingEngine](FigCaptureDeferredProcessingEngine, "sharedProcessingEngine"), "lastJobReusedGraph");
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  return result;
}

@end
