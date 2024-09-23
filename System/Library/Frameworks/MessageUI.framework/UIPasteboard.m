@implementation UIPasteboard

void __94__UIPasteboard_MFAttachmentsPasteboardSupport__mf_addPasteboardRepresentationsForAttachments___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  MFAttachmentPasteboardRepresentation *v6;
  id v7;

  v7 = a2;
  v5 = a3;
  v6 = -[MFAttachmentPasteboardRepresentation initWithMFAttachment:]([MFAttachmentPasteboardRepresentation alloc], "initWithMFAttachment:", v5);
  objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v6, v7);

}

@end
