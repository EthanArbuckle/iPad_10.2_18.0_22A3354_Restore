@implementation NSString(RecipientUtilities)

- (id)cnaui_copyDisplayableAddressComment
{
  void *v2;
  void *v3;
  id v4;
  id v5;
  id v6;

  objc_msgSend(a1, "mf_addressCommentPersonNameComponents");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
  {
    objc_msgSend(v2, "setNamePrefix:", 0);
    objc_msgSend(v3, "setNameSuffix:", 0);
    v4 = objc_alloc_init(MEMORY[0x1E0CB3858]);
    objc_msgSend(v4, "setStyle:", 3);
    objc_msgSend(v4, "stringFromPersonNameComponents:", v3);
    v5 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = (id)objc_msgSend(a1, "mf_copyAddressComment");
    if (!objc_msgSend(v4, "length"))
    {
      v6 = 0;
      goto LABEL_6;
    }
    v5 = v4;
    v4 = v5;
  }
  v6 = v5;
LABEL_6:

  return v6;
}

@end
