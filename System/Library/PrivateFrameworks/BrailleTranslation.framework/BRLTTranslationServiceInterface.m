@implementation BRLTTranslationServiceInterface

void __BRLTTranslationServiceInterface_block_invoke()
{
  void *v0;
  void *v1;
  id v2;

  objc_msgSend(MEMORY[0x24BDD1990], "interfaceWithProtocol:", &unk_254AB46F0);
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCF20], "setWithObject:", objc_opt_class());
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setClasses:forSelector:argumentIndex:ofReply:", v2, sel_brailleForText_parameters_withReply_, 1, 0);
  objc_msgSend(v0, "setClasses:forSelector:argumentIndex:ofReply:", v2, sel_textForBraille_parameters_withReply_, 1, 0);
  v1 = (void *)BRLTTranslationServiceInterface__Interface;
  BRLTTranslationServiceInterface__Interface = (uint64_t)v0;

}

@end
