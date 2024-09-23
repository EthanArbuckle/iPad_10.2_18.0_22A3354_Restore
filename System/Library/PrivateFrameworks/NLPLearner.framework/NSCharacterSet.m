@implementation NSCharacterSet

uint64_t __73__NSCharacterSet_LanguageIdentificationAdditions__vietnameseCharacterSet__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x24BDD1690], "characterSetWithRange:", 7840, 95);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)vietnameseCharacterSet___vietnameseCharset;
  vietnameseCharacterSet___vietnameseCharset = v0;

  return objc_msgSend((id)vietnameseCharacterSet___vietnameseCharset, "addCharactersInString:", CFSTR("àÀãÃáÁăĂâÂđĐèÈéÉêÊìÌĩĨíÍòÒõÕóÓôÔơƠùÙũŨúÚưýÝ"));
}

@end
