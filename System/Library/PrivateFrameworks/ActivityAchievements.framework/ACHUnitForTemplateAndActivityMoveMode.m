@implementation ACHUnitForTemplateAndActivityMoveMode

void __ACHUnitForTemplateAndActivityMoveMode_block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x24BDBCF20], "setWithArray:", &unk_24D138F88);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)ACHUnitForTemplateAndActivityMoveMode_moveModeOverridenTemplates;
  ACHUnitForTemplateAndActivityMoveMode_moveModeOverridenTemplates = v0;

}

@end
