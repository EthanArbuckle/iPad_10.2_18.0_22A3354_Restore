@implementation FCCKSubscriptionKeys

id __FCCKSubscriptionKeys_block_invoke()
{
  if (qword_1ED0F8000 != -1)
    dispatch_once(&qword_1ED0F8000, &__block_literal_global_1255);
  return (id)qword_1ED0F7FF8;
}

void __FCCKSubscriptionKeys_block_invoke_2()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:", CFSTR("subscriptionType"), CFSTR("subscriptionOrder"), CFSTR("subscriptionOrigin"), CFSTR("dateAdded"), CFSTR("tagID"), CFSTR("notificationsEnabled"), CFSTR("groupID"), 0);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)qword_1ED0F7FF8;
  qword_1ED0F7FF8 = v0;

}

@end
