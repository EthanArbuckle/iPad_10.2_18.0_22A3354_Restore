@implementation BRPerformWithPersonaAndError

void __BRPerformWithPersonaAndError_block_invoke()
{
  uint64_t v0;
  void *v1;
  id v2;

  objc_msgSend(MEMORY[0x1E0DC5F00], "personaAttributesForPersonaType:", 0);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "userPersonaUniqueString");
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)BRPerformWithPersonaAndError___personalPersona;
  BRPerformWithPersonaAndError___personalPersona = v0;

}

@end
