@implementation ObjectGroupManager

+ (id)storageGroupsForObjects:(id)a3
{
  ou_object_group::groupStorage(a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)tableChairGroupsForObjects:(id)a3
{
  ou_object_group::groupTableChair(a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

@end
