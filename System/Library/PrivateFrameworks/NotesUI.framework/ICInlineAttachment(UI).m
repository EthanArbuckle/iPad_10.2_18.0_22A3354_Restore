@implementation ICInlineAttachment(UI)

- (id)uiModel
{
  unsigned int v2;
  void *v3;

  v2 = objc_msgSend(a1, "attachmentType");
  if (v2 > 5)
    v3 = 0;
  else
    v3 = (void *)objc_msgSend(objc_alloc(*off_1E5C210D8[v2]), "initWithAttachment:", a1);
  return v3;
}

+ (id)createHashtagAttachmentIfApplicableWithHashtagText:()UI creatingHashtagIfNecessary:note:parentAttachment:
{
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;

  v10 = a3;
  v11 = a5;
  v12 = a6;
  if (objc_msgSend(a1, "canInsertInlineAttachmentType:intoNote:parentAttachment:", 1, v11, v12))
  {
    objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "UUIDString");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = (void *)objc_msgSend(a1, "newHashtagAttachmentWithIdentifier:hashtagText:creatingHashtagIfNecessary:note:parentAttachment:", v14, v10, a4, v11, v12);

  }
  else
  {
    v15 = 0;
  }

  return v15;
}

+ (id)createHashtagAttachmentIfApplicableWithHashtagText:()UI forHashtag:note:parentAttachment:
{
  id v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;

  v9 = a4;
  v10 = a5;
  v11 = a6;
  if (objc_msgSend(a1, "canInsertInlineAttachmentType:intoNote:parentAttachment:", 1, v10, v11))
  {
    objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "UUIDString");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = (void *)objc_msgSend(a1, "newHashtagAttachmentWithIdentifier:forHashtag:note:parentAttachment:", v13, v9, v10, v11);

  }
  else
  {
    v14 = 0;
  }

  return v14;
}

+ (id)createMentionAttachmentIfApplicableWithMentionText:()UI userRecordName:note:parentAttachment:
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  if (objc_msgSend(a1, "canInsertInlineAttachmentType:intoNote:parentAttachment:", 2, v12, v13))
  {
    objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "UUIDString");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = (void *)objc_msgSend(a1, "newMentionAttachmentWithIdentifier:mentionText:userRecordName:note:parentAttachment:", v15, v10, v11, v12, v13);

  }
  else
  {
    v16 = 0;
  }

  return v16;
}

+ (uint64_t)newLinkAttachmentToNote:()UI fromNote:parentAttachment:
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  uint64_t v13;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (objc_msgSend(a1, "canInsertInlineAttachmentType:intoNote:parentAttachment:", 3, v9, v10))
  {
    objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "UUIDString");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(a1, "newLinkAttachmentWithIdentifier:toNote:fromNote:parentAttachment:", v12, v8, v9, v10);

  }
  else
  {
    v13 = 0;
  }

  return v13;
}

+ (id)createInlineAttachmentIfApplicableWithTypeUTI:()UI altText:tokenContentIdentifier:note:parentAttachment:
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;

  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  if (objc_msgSend(a1, "canInsertInlineAttachmentType:intoNote:parentAttachment:", 0, v15, v16))
  {
    objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "UUIDString");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = (void *)objc_msgSend(a1, "newAttachmentWithIdentifier:typeUTI:altText:tokenContentIdentifier:note:parentAttachment:", v18, v12, v13, v14, v15, v16);

  }
  else
  {
    v19 = 0;
  }

  return v19;
}

+ (BOOL)canInsertInlineAttachmentType:()UI intoNote:parentAttachment:
{
  id v7;
  id v8;
  __CFString *v9;
  _BOOL8 v10;
  NSObject *v11;
  NSObject *v12;
  void *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  int v18;
  __CFString *v19;
  __int16 v20;
  void *v21;
  __int16 v22;
  void *v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v7 = a4;
  v8 = a5;
  if (a3 > 5)
    v9 = 0;
  else
    v9 = off_1E5C21108[a3];
  v10 = v7 != 0;
  if (!v7)
  {
    v11 = os_log_create("com.apple.notes", "Crypto");
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      v18 = 138412290;
      v19 = v9;
      _os_log_impl(&dword_1AC7A1000, v11, OS_LOG_TYPE_INFO, "Rejected an attempt to insert %@ into a nil note", (uint8_t *)&v18, 0xCu);
    }

  }
  if (objc_msgSend(v7, "needsInitialFetchFromCloud"))
  {
    v12 = os_log_create("com.apple.notes", "Crypto");
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      objc_msgSend(v7, "shortLoggingDescription");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = 138412546;
      v19 = v9;
      v20 = 2112;
      v21 = v13;
      _os_log_impl(&dword_1AC7A1000, v12, OS_LOG_TYPE_INFO, "Rejected an attempt to insert %@ into a placeholder note: %@", (uint8_t *)&v18, 0x16u);

    }
    v10 = 0;
  }
  if (v8 && objc_msgSend(v8, "needsInitialFetchFromCloud"))
  {
    v14 = os_log_create("com.apple.notes", "Crypto");
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      objc_msgSend(v8, "shortLoggingDescription");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "shortLoggingDescription");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = 138412802;
      v19 = v9;
      v20 = 2112;
      v21 = v15;
      v22 = 2112;
      v23 = v16;
      _os_log_impl(&dword_1AC7A1000, v14, OS_LOG_TYPE_INFO, "Rejected an attempt to insert %@ into a placeholder attachment %@ in note: %@", (uint8_t *)&v18, 0x20u);

    }
    v10 = 0;
  }

  return v10;
}

- (void)accessibilityAnnounceCreationWithVoiceOver
{
  void *v2;
  const __CFString *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  if (objc_msgSend(a1, "_checkIsVoiceOverRunning"))
  {
    if ((objc_msgSend(a1, "isHashtagAttachment") & 1) != 0)
    {
      v2 = (void *)MEMORY[0x1E0D64218];
      v3 = CFSTR("Inserted %@");
    }
    else
    {
      if (!objc_msgSend(a1, "isMentionAttachment"))
      {
        v4 = 0;
LABEL_12:

        return;
      }
      v2 = (void *)MEMORY[0x1E0D64218];
      v3 = CFSTR("Inserted mention %@");
    }
    objc_msgSend(v2, "localizedFrameworkStringForKey:value:table:allowSiri:", v3, v3, 0, 1);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (v4)
    {
      v9 = v4;
      objc_msgSend(a1, "displayText");
      v5 = (void *)objc_claimAutoreleasedReturnValue();

      if (v5)
      {
        v6 = (void *)MEMORY[0x1E0CB3940];
        objc_msgSend(a1, "displayText");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "localizedStringWithFormat:", v9, v7);
        v8 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(a1, "_announceAttachmentChangeWithString:", v8);
      }
      v4 = v9;
    }
    goto LABEL_12;
  }
}

- (void)accessibilityAnnounceDeletionWithVoiceOver
{
  void *v2;
  const __CFString *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  if (objc_msgSend(a1, "_checkIsVoiceOverRunning"))
  {
    if ((objc_msgSend(a1, "isHashtagAttachment") & 1) != 0)
    {
      v2 = (void *)MEMORY[0x1E0D64218];
      v3 = CFSTR("Deleted %@");
    }
    else
    {
      if (!objc_msgSend(a1, "isMentionAttachment"))
      {
        v4 = 0;
LABEL_12:

        return;
      }
      v2 = (void *)MEMORY[0x1E0D64218];
      v3 = CFSTR("Deleted mention %@");
    }
    objc_msgSend(v2, "localizedFrameworkStringForKey:value:table:allowSiri:", v3, v3, 0, 1);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (v4)
    {
      v9 = v4;
      objc_msgSend(a1, "displayText");
      v5 = (void *)objc_claimAutoreleasedReturnValue();

      if (v5)
      {
        v6 = (void *)MEMORY[0x1E0CB3940];
        objc_msgSend(a1, "displayText");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "localizedStringWithFormat:", v9, v7);
        v8 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(a1, "_announceAttachmentChangeWithString:", v8);
      }
      v4 = v9;
    }
    goto LABEL_12;
  }
}

- (void)_announceAttachmentChangeWithString:()UI
{
  id v3;
  id v4;

  v4 = a3;
  v3 = v4;
  dispatchMainAfterDelay();

}

@end
