@implementation INPerson(AssistantCardService)

- (id)acs_formattedPersonName
{
  void *v2;
  void *v3;

  objc_msgSend(a1, "displayName");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v2, "length"))
  {
    objc_msgSend(a1, "displayName");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }

  return v3;
}

@end
