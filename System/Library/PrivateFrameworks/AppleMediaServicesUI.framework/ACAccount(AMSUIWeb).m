@implementation ACAccount(AMSUIWeb)

- (uint64_t)web_matchAccount:()AMSUIWeb
{
  void *v3;
  void *v4;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;

  v6 = a3;
  objc_msgSend(a1, "ams_DSID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "ams_altDSID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "username");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    objc_msgSend(v6, "ams_DSID");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v3, "isEqualToNumber:", v7) & 1) != 0)
    {
      v10 = 1;
LABEL_15:

      goto LABEL_16;
    }
  }
  if (v8)
  {
    objc_msgSend(v6, "ams_altDSID");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v4, "isEqualToString:", v8))
    {

      v10 = 1;
      goto LABEL_14;
    }
    if (!v9)
    {
      v10 = 0;
      goto LABEL_13;
    }
  }
  else if (!v9)
  {
    v10 = 0;
    goto LABEL_14;
  }
  objc_msgSend(v6, "username");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v11, "isEqualToString:", v9);

  if (v8)
LABEL_13:

LABEL_14:
  if (v7)
    goto LABEL_15;
LABEL_16:

  return v10;
}

@end
