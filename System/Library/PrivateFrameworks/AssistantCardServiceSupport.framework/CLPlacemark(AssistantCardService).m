@implementation CLPlacemark(AssistantCardService)

- (id)acs_formattedNameOrStreetAddress
{
  void *v2;
  void *v3;
  void *v4;
  __CFString *v5;
  void *v6;
  __CFString *v7;

  objc_msgSend(a1, "name");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v2, "length"))
  {
    objc_msgSend(a1, "name");
    v3 = (void *)objc_claimAutoreleasedReturnValue();

    if (v3)
      return v3;
  }
  else
  {

  }
  objc_msgSend(a1, "subThoroughfare");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "length"))
  {
    objc_msgSend(a1, "subThoroughfare");
    v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = &stru_24D478830;
  }

  objc_msgSend(a1, "thoroughfare");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "length"))
  {
    objc_msgSend(a1, "thoroughfare");
    v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = &stru_24D478830;
  }

  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@ %@"), v5, v7);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

@end
