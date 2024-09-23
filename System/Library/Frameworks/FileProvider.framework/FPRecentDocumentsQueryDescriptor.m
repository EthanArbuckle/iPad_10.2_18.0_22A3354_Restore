@implementation FPRecentDocumentsQueryDescriptor

- (unint64_t)desiredCount
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  id v6;
  unint64_t v7;

  -[FPSpotlightQueryDescriptor settings](self, "settings");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "desiredNumberOfItems");
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = (void *)v3;
  v5 = &unk_1E448E938;
  if (v3)
    v5 = (void *)v3;
  v6 = v5;

  v7 = objc_msgSend(v6, "unsignedIntegerValue");
  return v7;
}

- (id)queryStringForMountPoint:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  char v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;

  -[FPSpotlightQueryDescriptor settings](self, "settings", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "allowedFileTypes");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  -[FPSpotlightQueryDescriptor settings](self, "settings");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "excludedFileTypes");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  -[FPSpotlightQueryDescriptor settings](self, "settings");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "excludedParentOIDs");

  v9 = (void *)*MEMORY[0x1E0CEC4F0];
  objc_msgSend((id)*MEMORY[0x1E0CEC4F0], "identifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v7, "containsObject:", v10);

  if ((v11 & 1) == 0)
  {
    objc_msgSend(v9, "identifier");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "arrayByAddingObject:", v12);
    v13 = objc_claimAutoreleasedReturnValue();

    v7 = (void *)v13;
  }
  v14 = (void *)MEMORY[0x1E0CB3940];
  -[FPSpotlightQueryDescriptor settings](self, "settings");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "allowedProviders");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  FPRecentDocumentsQueryStringForTypes(v16, v5, v7);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  FPExcludedCollaborationInvitationsQueryStringFragment();
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[FPSpotlightQueryDescriptor settings](self, "settings");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "excludedParentOIDs");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  FPExcludedOIDParentsQueryStringFragment(v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "stringWithFormat:", CFSTR("(%@) && (%@) && (%@)"), v17, v18, v21);
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  return v22;
}

- (id)name
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "RCNT");
}

@end
