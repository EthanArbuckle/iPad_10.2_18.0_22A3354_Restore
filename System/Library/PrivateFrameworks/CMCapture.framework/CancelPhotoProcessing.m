@implementation CancelPhotoProcessing

uint64_t __captureDeferredPhotoProcessor_CancelPhotoProcessing_block_invoke(_QWORD *a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t result;
  _QWORD v8[5];

  v2 = a1[6];
  v3 = *(void **)(a1[5] + 40);
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __captureDeferredPhotoProcessor_CancelPhotoProcessing_block_invoke_2;
  v8[3] = &__block_descriptor_40_e56_B32__0__FigCaptureDeferredPhotoProcessorRequest_8Q16_B24l;
  v8[4] = v2;
  v4 = (void *)objc_msgSend(v3, "indexesOfObjectsPassingTest:", v8);
  v5 = objc_msgSend(v4, "count");
  v6 = a1[5];
  if (v5)
    return objc_msgSend(*(id *)(v6 + 40), "removeObjectsAtIndexes:", v4);
  result = objc_msgSend((id)objc_msgSend(*(id *)(v6 + 48), "photoIdentifier"), "isEqualToString:", a1[6]);
  if ((_DWORD)result)
    *(_DWORD *)(*(_QWORD *)(a1[4] + 8) + 24) = -16829;
  return result;
}

BOOL __captureDeferredPhotoProcessor_CancelPhotoProcessing_block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend((id)objc_msgSend(a2, "photoIdentifier"), "isEqualToString:", *(_QWORD *)(a1 + 32))
      && !objc_msgSend(a2, "parent")
      || objc_msgSend(a2, "parent")
      && (objc_msgSend((id)objc_msgSend((id)objc_msgSend(a2, "parent"), "photoIdentifier"), "isEqualToString:", *(_QWORD *)(a1 + 32)) & 1) != 0;
}

@end
