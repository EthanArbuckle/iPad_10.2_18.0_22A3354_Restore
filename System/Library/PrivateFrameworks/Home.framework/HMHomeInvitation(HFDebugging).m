@implementation HMHomeInvitation(HFDebugging)

- (id)hf_stateDumpBuilderWithContext:()HFDebugging
{
  void *v4;
  void *v5;
  void *v6;

  +[HFStateDumpBuilder builderWithObject:context:](HFStateDumpBuilder, "builderWithObject:context:", a1, a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "appendObject:withName:options:", v5, CFSTR("UUID"), 2);

  NSStringFromHMHomeInvitationState(objc_msgSend(a1, "invitationState"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v6, CFSTR("state"));

  return v4;
}

@end
