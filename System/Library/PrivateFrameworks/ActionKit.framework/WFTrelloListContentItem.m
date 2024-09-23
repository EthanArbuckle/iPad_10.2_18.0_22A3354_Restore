@implementation WFTrelloListContentItem

+ (id)typeDescription
{
  return WFDeferrableLocalizedStringWithKey(CFSTR("Trello list"), CFSTR("Trello list"));
}

+ (id)pluralTypeDescription
{
  return WFDeferrableLocalizedStringWithKey(CFSTR("Trello lists"), CFSTR("Trello lists"));
}

+ (id)countDescription
{
  return WFLocalizedPluralString(CFSTR("%d Trello lists"));
}

+ (id)ownedTypes
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x24BDBCF00];
  objc_msgSend(MEMORY[0x24BE19598], "typeWithClass:", objc_opt_class());
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "orderedSetWithObject:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

@end
