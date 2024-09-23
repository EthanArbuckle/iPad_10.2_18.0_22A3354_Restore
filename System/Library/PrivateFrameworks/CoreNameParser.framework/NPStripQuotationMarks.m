@implementation NPStripQuotationMarks

void ___NPStripQuotationMarks_block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB3500], "characterSetWithCharactersInString:", CFSTR("\"'«»‘’‚‛“”„‟‹›「」『』〝〞〟﹁﹂﹃﹄＂＇｢｣"));
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)_NPStripQuotationMarks_quotationMarksCharset;
  _NPStripQuotationMarks_quotationMarksCharset = v0;

}

@end
