@implementation StringByTrimming

void __StringByTrimming_block_invoke()
{
  void *v0;
  void *v1;
  void *v2;

  objc_msgSend(MEMORY[0x24BDD1690], "characterSetWithCharactersInString:", 0x24C39F228);
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD14A8], "whitespaceAndNewlineCharacterSet");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "formUnionWithCharacterSet:", v1);

  v2 = (void *)qword_253EC0A18;
  qword_253EC0A18 = (uint64_t)v0;

}

@end
