@implementation NSMutableDictionary

uint64_t __52__NSMutableDictionary_Utilities__mt_removeNaNValues__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  void *v3;
  id v4;
  void *v5;
  uint64_t v6;

  v3 = (void *)MEMORY[0x24BDD1518];
  v4 = a3;
  objc_msgSend(v3, "notANumber");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "isEqual:", v5);

  return v6;
}

@end
