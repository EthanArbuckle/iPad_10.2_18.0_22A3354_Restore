@implementation IMService(CKAdditions)

- (BOOL)__ck_isSMS
{
  void *v2;
  _BOOL8 v3;

  objc_msgSend(MEMORY[0x1E0D35918], "smsService");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 == a1;

  return v3;
}

- (BOOL)__ck_isiMessage
{
  void *v2;
  _BOOL8 v3;

  objc_msgSend(MEMORY[0x1E0D35918], "iMessageService");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 == a1;

  return v3;
}

- (uint64_t)__ck_isiMessageLite
{
  void *v2;
  int v3;
  void *v4;
  uint64_t v5;

  objc_msgSend(MEMORY[0x1E0D39840], "sharedFeatureFlags");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isCarrierPigeonEnabled");

  if (!v3)
    return 0;
  objc_msgSend(a1, "name");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isEqualToString:", *MEMORY[0x1E0D38F70]);

  return v5;
}

- (uint64_t)__ck_isSatelliteSMS
{
  void *v2;
  int v3;
  void *v4;
  uint64_t v5;

  objc_msgSend(MEMORY[0x1E0D39840], "sharedFeatureFlags");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isCarrierPigeonEnabled");

  if (!v3)
    return 0;
  objc_msgSend(a1, "name");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isEqualToString:", *MEMORY[0x1E0D38F60]);

  return v5;
}

- (uint64_t)__ck_isMadrid
{
  if ((objc_msgSend(a1, "__ck_isiMessage") & 1) != 0)
    return 1;
  else
    return objc_msgSend(a1, "__ck_isiMessageLite");
}

- (BOOL)__ck_isRCS
{
  void *v2;
  _BOOL8 v3;

  objc_msgSend(MEMORY[0x1E0D35918], "rcsService");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 == a1;

  return v3;
}

- (uint64_t)__ck_isCarrierBased
{
  if ((objc_msgSend(a1, "__ck_isSMS") & 1) != 0)
    return 1;
  else
    return objc_msgSend(a1, "__ck_isRCS");
}

- (id)__ck_displayName
{
  void *v2;
  void *v3;
  const __CFString *v4;
  const __CFString *v5;
  void *v6;
  int v7;
  int v8;
  void *v9;

  if (!objc_msgSend(a1, "__ck_isiMessageLite"))
  {
    if (objc_msgSend(a1, "__ck_isSatelliteSMS"))
    {
      CKFrameworkBundle();
      v2 = (void *)objc_claimAutoreleasedReturnValue();
      v3 = v2;
      v4 = CFSTR("PLACEHOLDER_TEXT_VIEW_SATELLITE_MESSAGE_SMS");
      goto LABEL_5;
    }
    objc_msgSend(MEMORY[0x1E0D39840], "sharedFeatureFlags");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "isLazuliEnabled");

    v8 = objc_msgSend(a1, "__ck_isSMS");
    if (v7)
    {
      if (v8)
      {
        CKFrameworkBundle();
        v2 = (void *)objc_claimAutoreleasedReturnValue();
        v3 = v2;
        v4 = CFSTR("TEXT_MESSAGE_SMS");
LABEL_18:
        v5 = CFSTR("ChatKit");
        goto LABEL_19;
      }
      if (!objc_msgSend(a1, "__ck_isiMessage"))
      {
        if (objc_msgSend(a1, "__ck_isRCS"))
        {
          if ((IMDeviceIsGreenTea() & 1) != 0
            || objc_msgSend(MEMORY[0x1E0D397F8], "IMDeviceIsChinaRegion"))
          {
            CKFrameworkBundle();
            v2 = (void *)objc_claimAutoreleasedReturnValue();
            v3 = v2;
            v4 = CFSTR("5G_MESSAGING");
          }
          else
          {
            CKFrameworkBundle();
            v2 = (void *)objc_claimAutoreleasedReturnValue();
            v3 = v2;
            v4 = CFSTR("TEXT_MESSAGE_RCS");
          }
          goto LABEL_18;
        }
        goto LABEL_21;
      }
    }
    else
    {
      if (v8)
      {
        CKFrameworkBundle();
        v2 = (void *)objc_claimAutoreleasedReturnValue();
        v3 = v2;
        v4 = CFSTR("TEXT_MESSAGE");
        goto LABEL_18;
      }
      if (!objc_msgSend(a1, "__ck_isiMessage"))
      {
LABEL_21:
        objc_msgSend(a1, "name");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        return v9;
      }
    }
    CKFrameworkBundle();
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = v2;
    v4 = CFSTR("MADRID");
    goto LABEL_18;
  }
  CKFrameworkBundle();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  v4 = CFSTR("PLACEHOLDER_TEXT_VIEW_SATELLITE_MESSAGE");
LABEL_5:
  v5 = CFSTR("ChatKit-CarrierPigeon");
LABEL_19:
  objc_msgSend(v2, "localizedStringForKey:value:table:", v4, &stru_1E276D870, v5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)__ck_attributedEntryViewDisplayName
{
  void *v2;
  int v3;
  void *v4;
  void *v5;
  const __CFString *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  id v14;

  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "messageEntryViewUsesAbbreviatedServiceNames");

  if (!v3)
    goto LABEL_8;
  if (objc_msgSend(a1, "__ck_isiMessageLite"))
  {
    CKFrameworkBundle();
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v4;
    v6 = CFSTR("MADRID");
  }
  else
  {
    if (!objc_msgSend(a1, "__ck_isSatelliteSMS"))
    {
LABEL_8:
      v14 = objc_alloc(MEMORY[0x1E0CB3498]);
      objc_msgSend(a1, "__ck_entryViewDisplayName");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = (void *)objc_msgSend(v14, "initWithString:", v7);
      goto LABEL_9;
    }
    CKFrameworkBundle();
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v4;
    v6 = CFSTR("TEXT_MESSAGE_WATCH");
  }
  objc_msgSend(v4, "localizedStringForKey:value:table:", v6, &stru_1E276D870, CFSTR("ChatKit"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v7)
    goto LABEL_8;
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3778]), "initWithString:attributes:", v7, 0);
  objc_msgSend(v8, "replaceCharactersInRange:withString:", 0, 0, CFSTR(" "));
  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "satelliteServiceIcon");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = objc_alloc_init(MEMORY[0x1E0DC12B0]);
  objc_msgSend(v11, "setImage:", v10);
  objc_msgSend(MEMORY[0x1E0CB3498], "attributedStringWithAttachment:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "insertAttributedString:atIndex:", v12, 0);

  v13 = (void *)objc_msgSend(v8, "copy");
LABEL_9:

  return v13;
}

- (id)__ck_entryViewDisplayName
{
  void *v2;
  int v3;
  void *v4;
  void *v5;
  const __CFString *v6;
  void *v7;

  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "messageEntryViewUsesAbbreviatedServiceNames");

  if (v3)
  {
    if (objc_msgSend(a1, "__ck_isSMS"))
    {
      CKFrameworkBundle();
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = v4;
      v6 = CFSTR("TEXT_MESSAGE_WATCH");
LABEL_10:
      objc_msgSend(v4, "localizedStringForKey:value:table:", v6, &stru_1E276D870, CFSTR("ChatKit"));
      v7 = (void *)objc_claimAutoreleasedReturnValue();

      return v7;
    }
    if (objc_msgSend(a1, "__ck_isRCS"))
    {
      if ((IMDeviceIsGreenTea() & 1) != 0 || objc_msgSend(MEMORY[0x1E0D397F8], "IMDeviceIsChinaRegion"))
      {
        CKFrameworkBundle();
        v4 = (void *)objc_claimAutoreleasedReturnValue();
        v5 = v4;
        v6 = CFSTR("5G_MESSAGING_WATCH");
      }
      else
      {
        CKFrameworkBundle();
        v4 = (void *)objc_claimAutoreleasedReturnValue();
        v5 = v4;
        v6 = CFSTR("RCS_WATCH");
      }
      goto LABEL_10;
    }
  }
  objc_msgSend(a1, "__ck_displayName");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  return v7;
}

- (uint64_t)__ck_maxRecipientCountForHandle:()CKAdditions simID:
{
  id v6;
  id v7;
  uint64_t v8;

  v6 = a3;
  v7 = a4;
  if (objc_msgSend(a1, "__ck_isSMS"))
  {
    v8 = (int)objc_msgSend(MEMORY[0x1E0D39730], "IMMMSMaxRecipientsForPhoneNumber:simID:", v6, v7);
  }
  else if (objc_msgSend(MEMORY[0x1E0D35918], "iMessageEnabled"))
  {
    v8 = objc_msgSend(a1, "maxChatParticipantsForHandle:simID:", v6, v7);
  }
  else
  {
    v8 = 0x7FFFFFFFFFFFFFFFLL;
  }

  return v8;
}

- (uint64_t)__ck_displayColor
{
  return objc_msgSend(a1, "__ck_isMadrid");
}

- (uint64_t)__ck_displayReplyColor
{
  if (objc_msgSend(a1, "__ck_isMadrid"))
    return 10;
  else
    return 11;
}

- (uint64_t)__ck_serviceType
{
  if ((objc_msgSend(a1, "__ck_isSMS") & 1) != 0)
  {
    return 3;
  }
  else if (objc_msgSend(a1, "__ck_isiMessage"))
  {
    return 2;
  }
  else
  {
    return 1;
  }
}

@end
