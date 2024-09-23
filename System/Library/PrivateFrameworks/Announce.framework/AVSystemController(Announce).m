@implementation AVSystemController(Announce)

- (uint64_t)an_isCarPlayConnected
{
  void *v1;
  uint64_t v2;

  objc_msgSend(a1, "attributeForKey:", *MEMORY[0x24BE64808]);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "BOOLValue");

  return v2;
}

@end
