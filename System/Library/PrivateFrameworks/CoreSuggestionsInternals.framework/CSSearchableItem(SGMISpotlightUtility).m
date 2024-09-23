@implementation CSSearchableItem(SGMISpotlightUtility)

- (void)standardizeCSPersons
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  objc_msgSend(a1, "attributeSet");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "authors");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
  {
    v4 = (void *)objc_msgSend(a1, "copyReconstructedAuthors");
    objc_msgSend(a1, "attributeSet");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setAuthors:", v4);

  }
  objc_msgSend(a1, "attributeSet");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "primaryRecipients");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v7)
  {
    v8 = (void *)objc_msgSend(a1, "copyReconstructedPrimaryRecipients");
    objc_msgSend(a1, "attributeSet");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setPrimaryRecipients:", v8);

  }
  objc_msgSend(a1, "attributeSet");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "additionalRecipients");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v11)
  {
    v13 = (id)objc_msgSend(a1, "copyReconstructedAdditionalRecipients");
    objc_msgSend(a1, "attributeSet");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setAdditionalRecipients:", v13);

  }
}

@end
