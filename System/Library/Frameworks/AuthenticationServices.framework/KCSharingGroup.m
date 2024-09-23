@implementation KCSharingGroup

id __86__KCSharingGroup_AuthenticationServicesExtras__as_groupMemberTableViewCellDescription__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;

  v2 = a2;
  if ((objc_msgSend(v2, "isMeParticipant") & 1) != 0)
  {
    v3 = 0;
  }
  else
  {
    objc_msgSend(v2, "shortContactDisplayName");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v3;
}

@end
