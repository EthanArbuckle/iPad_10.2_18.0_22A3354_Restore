@implementation CKTranscriptTextSizeForFont

uint64_t __CKTranscriptTextSizeForFont_block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = objc_msgSend(objc_alloc(MEMORY[0x1E0CEA700]), "initWithFrame:", 0.0, 0.0, 100.0, 100.0);
  v1 = (void *)CKTranscriptTextSizeForFont_sSizingLabel;
  CKTranscriptTextSizeForFont_sSizingLabel = v0;

  return objc_msgSend((id)CKTranscriptTextSizeForFont_sSizingLabel, "setText:", CFSTR("X"));
}

@end
