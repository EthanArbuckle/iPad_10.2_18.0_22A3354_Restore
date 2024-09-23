@implementation BSDescriptionStream

uint64_t __102__BSDescriptionStream_BacklightServices__bls_appendBoundedCollection_withName_maximumItems_itemBlock___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "appendFormat:", CFSTR("(%u)"), *(_QWORD *)(a1 + 32));
}

void __102__BSDescriptionStream_BacklightServices__bls_appendBoundedCollection_withName_maximumItems_itemBlock___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v3;
  id v4;

  v3 = *(_QWORD *)(a1 + 32);
  v4 = a2;
  if (objc_msgSend(v4, "isEqual:", v3))
    objc_msgSend(*(id *)(a1 + 40), "appendString:withName:", v4, 0);
  else
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();

}

uint64_t __89__BSDescriptionStream_BacklightServices__bls_appendTimeInterval_withName_decomposeUnits___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "appendFormat:", CFSTR("%.0lfms"), *(double *)(a1 + 32) * 1000.0);
}

@end
