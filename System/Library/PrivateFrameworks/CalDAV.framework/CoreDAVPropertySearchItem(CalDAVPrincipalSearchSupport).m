@implementation CoreDAVPropertySearchItem(CalDAVPrincipalSearchSupport)

- (uint64_t)wellKnownPrincipalSearchType
{
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  char v7;

  LODWORD(v2) = 8;
  do
  {
    v2 = (v2 - 1);
    +[CalDAVPrincipalSearchSupport namespaceForWellKnownType:](CalDAVPrincipalSearchSupport, "namespaceForWellKnownType:", v2);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "nameSpace");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v3, "isEqualToString:", v4) & 1) != 0)
    {
      +[CalDAVPrincipalSearchSupport nameForWellKnownType:](CalDAVPrincipalSearchSupport, "nameForWellKnownType:", v2);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(a1, "name");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = objc_msgSend(v5, "isEqualToString:", v6);

      if ((v7 & 1) != 0)
        return v2;
    }
    else
    {

    }
  }
  while (v2 >= 2);
  return 0;
}

@end
