@implementation UICellConfigurationState(MailExtensions)

- (void)setIsParent:()MailExtensions
{
  id v2;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "setObject:forKeyedSubscript:", v2, CFSTR("kMessageListCellConfigurationStateThreadParentKey"));

}

- (void)setIsFocusingOnMessageListCell:()MailExtensions
{
  id v2;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "setObject:forKeyedSubscript:", v2, CFSTR("kMessageListCellConfigurationStateFocusingOnMessageListCellKey"));

}

- (void)setIsFocusSystemActive:()MailExtensions
{
  id v2;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "setObject:forKeyedSubscript:", v2, CFSTR("kMessageListCellConfigurationStateFocusSystemActiveKey"));

}

- (void)setIsChild:()MailExtensions
{
  id v2;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "setObject:forKeyedSubscript:", v2, CFSTR("kMessageListCellConfigurationStateThreadChildKey"));

}

- (uint64_t)isParent
{
  void *v1;
  uint64_t v2;

  objc_msgSend(a1, "objectForKeyedSubscript:", CFSTR("kMessageListCellConfigurationStateThreadParentKey"));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "BOOLValue");

  return v2;
}

- (uint64_t)isChild
{
  void *v1;
  uint64_t v2;

  objc_msgSend(a1, "objectForKeyedSubscript:", CFSTR("kMessageListCellConfigurationStateThreadChildKey"));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "BOOLValue");

  return v2;
}

- (uint64_t)isFocusSystemActive
{
  void *v1;
  uint64_t v2;

  objc_msgSend(a1, "objectForKeyedSubscript:", CFSTR("kMessageListCellConfigurationStateFocusSystemActiveKey"));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "BOOLValue");

  return v2;
}

- (uint64_t)isFocusingOnMessageListCell
{
  void *v1;
  uint64_t v2;

  objc_msgSend(a1, "objectForKeyedSubscript:", CFSTR("kMessageListCellConfigurationStateFocusingOnMessageListCellKey"));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "BOOLValue");

  return v2;
}

@end
