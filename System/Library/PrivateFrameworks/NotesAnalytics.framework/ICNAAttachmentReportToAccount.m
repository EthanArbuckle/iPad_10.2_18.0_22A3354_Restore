@implementation ICNAAttachmentReportToAccount

void __54___ICNAAttachmentReportToAccount_attachmentUTISummary__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  ICASAttachmentUTIItemData *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  ICASAttachmentUTIItemData *v11;

  v5 = a3;
  v6 = a2;
  v7 = [ICASAttachmentUTIItemData alloc];
  v8 = (void *)MEMORY[0x1E0CB37E8];
  v9 = objc_msgSend(v5, "integerValue");

  objc_msgSend(v8, "numberWithInteger:", ICNARoundTo2SigFigsInt(v9));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = -[ICASAttachmentUTIItemData initWithUti:countOfAttachments:](v7, "initWithUti:countOfAttachments:", v6, v10);

  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "addObject:", v11);
}

@end
