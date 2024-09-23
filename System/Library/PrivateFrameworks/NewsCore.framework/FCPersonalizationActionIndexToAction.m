@implementation FCPersonalizationActionIndexToAction

void __FCPersonalizationActionIndexToAction_block_invoke()
{
  uint64_t v0;
  void *v1;
  id v2;

  FCPersonalizationActionToIndex();
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "fc_dictionaryBySwappingValuesAndKeys");
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)qword_1ED0F7A98;
  qword_1ED0F7A98 = v0;

}

@end
