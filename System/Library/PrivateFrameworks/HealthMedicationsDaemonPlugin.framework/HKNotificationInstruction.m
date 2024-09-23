@implementation HKNotificationInstruction

id __89__HKNotificationInstruction_Medications__scheduleItemIdentifiersFromCategoryIdentifiers___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;

  v3 = a2;
  if (objc_msgSend(v3, "hasPrefix:", CFSTR("MSIID-")))
  {
    objc_msgSend(*(id *)(a1 + 32), "scheduleItemIdentifierFromCategoryIdentifier:", v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

@end
