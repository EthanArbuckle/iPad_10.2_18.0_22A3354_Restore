@implementation NSURL(ProfileIdentifier)

- (id)_hk_appendProfileIdentifier:()ProfileIdentifier
{
  id v4;
  id v5;
  void *v6;

  v4 = a3;
  if (objc_msgSend(v4, "type") == 1)
  {
    v5 = a1;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99E98], "_hk_appendQueryParameterToURL:forHKProfileIdentifier:", a1, v4);
    v5 = (id)objc_claimAutoreleasedReturnValue();
  }
  v6 = v5;

  return v6;
}

@end
