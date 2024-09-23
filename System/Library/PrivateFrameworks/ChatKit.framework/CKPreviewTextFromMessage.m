@implementation CKPreviewTextFromMessage

uint64_t __CKPreviewTextFromMessage_block_invoke(uint64_t a1, uint64_t a2)
{
  void *v2;
  uint64_t v3;

  objc_msgSend(*(id *)(a1 + 32), "transferForGUID:", a2);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isAdaptiveImageGlyph");

  return v3;
}

id __CKPreviewTextFromMessage_block_invoke_2(uint64_t a1, uint64_t a2)
{
  void *v2;
  void *v3;

  objc_msgSend(*(id *)(a1 + 32), "mediaObjectWithTransferGUID:imMessage:", a2, *(_QWORD *)(a1 + 40));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "adaptiveImageGlyph");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

@end
