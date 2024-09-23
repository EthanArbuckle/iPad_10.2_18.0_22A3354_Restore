@implementation ICCloudSyncingObject(UI)

+ (uint64_t)isInlineAttachment:()UI
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;

  v3 = a3;
  if (objc_msgSend(v3, "conformsToProtocol:", &unk_1EECADDB0))
  {
    v4 = (void *)MEMORY[0x1E0D63C60];
    objc_msgSend(v3, "attachmentUTI");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v4, "typeUTIIsInlineAttachment:", v5);

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (id)shareViaICloudManageActionTitle
{
  char v2;
  void *v3;
  const __CFString *v4;
  char v5;
  void *v6;

  if ((objc_msgSend(a1, "canBeSharedViaICloud") & 1) != 0 || objc_msgSend(a1, "isSharedViaICloud"))
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v2 = objc_msgSend(a1, "isSharedViaICloud");
      v3 = (void *)MEMORY[0x1E0D64218];
      if ((v2 & 1) != 0)
        v4 = CFSTR("Manage Shared Note");
      else
        v4 = CFSTR("Share Note");
LABEL_12:
      objc_msgSend(v3, "localizedFrameworkStringForKey:value:table:allowSiri:", v4, v4, 0, 1);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      return v6;
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = objc_msgSend(a1, "isSharedViaICloud");
      v3 = (void *)MEMORY[0x1E0D64218];
      if ((v5 & 1) != 0)
        v4 = CFSTR("Manage Shared Folder");
      else
        v4 = CFSTR("Share Folder");
      goto LABEL_12;
    }
  }
  v6 = 0;
  return v6;
}

- (id)shareViaICloudAddPeopleActionTitle
{
  void *v1;
  const __CFString *v2;
  void *v3;

  if (!objc_msgSend(a1, "canBeSharedViaICloud"))
    goto LABEL_7;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v1 = (void *)MEMORY[0x1E0D64218];
      v2 = CFSTR("Share Folder");
      goto LABEL_6;
    }
LABEL_7:
    v3 = 0;
    return v3;
  }
  v1 = (void *)MEMORY[0x1E0D64218];
  v2 = CFSTR("Share Note");
LABEL_6:
  objc_msgSend(v1, "localizedFrameworkStringForKey:value:table:allowSiri:", v2, v2, 0, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  return v3;
}

- (__CFString)shareViaICloudSystemImageName
{
  int v2;
  __CFString *v3;

  if ((objc_msgSend(a1, "canBeSharedViaICloud") & 1) == 0 && !objc_msgSend(a1, "isSharedViaICloud"))
    return (__CFString *)0;
  v2 = objc_msgSend(a1, "isSharedViaICloud");
  v3 = CFSTR("person.crop.circle.badge.plus");
  if (v2)
    v3 = CFSTR("person.crop.circle.badge.checkmark");
  return v3;
}

- (id)participantsInfoDescription
{
  void *v1;
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v14;

  objc_msgSend(a1, "serverShareCheckingParent");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "ic_nonCurrentUserAcceptedParticipants");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v2, "ic_compactMap:", &__block_literal_global_43);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "count"))
  {
    if (objc_msgSend(v3, "count") == 1)
    {
      v4 = objc_msgSend(v2, "count");
      v5 = (void *)MEMORY[0x1E0CB3940];
      v6 = (void *)MEMORY[0x1E0D64218];
      if (v4 == 1)
      {
        objc_msgSend(MEMORY[0x1E0D64218], "localizedFrameworkStringForKey:value:table:allowSiri:", CFSTR("With %@"), CFSTR("With %@"), 0, 1);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "objectAtIndexedSubscript:", 0);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "localizedStringWithFormat:", v7, v8, v14);
LABEL_10:
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        goto LABEL_11;
      }
    }
    else
    {
      v11 = objc_msgSend(v3, "count");
      v5 = (void *)MEMORY[0x1E0CB3940];
      v6 = (void *)MEMORY[0x1E0D64218];
      if (v11 == 2)
      {
        objc_msgSend(MEMORY[0x1E0D64218], "localizedFrameworkStringForKey:value:table:allowSiri:", CFSTR("With %@ and %@"), CFSTR("With %@ and %@"), 0, 1);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "objectAtIndexedSubscript:", 0);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "objectAtIndexedSubscript:", 1);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "localizedStringWithFormat:", v7, v8, v12);
        v10 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_11:
        goto LABEL_12;
      }
    }
    objc_msgSend(v6, "localizedFrameworkStringForKey:value:table:allowSiri:", CFSTR("With %@ and %lu others"), CFSTR("With %@ and %lu others"), 0, 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "objectAtIndexedSubscript:", 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "localizedStringWithFormat:", v7, v8, objc_msgSend(v2, "count") - 1);
    goto LABEL_10;
  }
  if (!objc_msgSend(v2, "count"))
  {
    objc_msgSend(MEMORY[0x1E0D64218], "localizedFrameworkStringForKey:value:table:allowSiri:", CFSTR("Shared"), CFSTR("Shared"), 0, 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_13;
  }
  v9 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(MEMORY[0x1E0D64218], "localizedFrameworkStringForKey:value:table:allowSiri:", CFSTR("With %lu people"), CFSTR("With %lu people"), 0, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "localizedStringWithFormat:", v7, objc_msgSend(v2, "count"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_12:

LABEL_13:
  return v10;
}

@end
