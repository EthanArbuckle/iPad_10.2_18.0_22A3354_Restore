@implementation INSendAnnouncementIntent

- (id)_typedBackingStore
{
  void *v2;
  void *v3;
  id v4;

  -[INIntent backingStore](self, "backingStore");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v3 = v2;
  else
    v3 = 0;
  v4 = v3;

  return v4;
}

- (id)_metadata
{
  void *v2;
  void *v3;

  -[INSendAnnouncementIntent _typedBackingStore](self, "_typedBackingStore");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "intentMetadata");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)_setMetadata:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[INSendAnnouncementIntent _typedBackingStore](self, "_typedBackingStore");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setIntentMetadata:", v4);

}

- (int64_t)_intentCategory
{
  return 7;
}

- (id)_categoryVerb
{
  return CFSTR("Send");
}

- (int64_t)_preferredInteractionDirection
{
  return 1;
}

- (INSendAnnouncementIntent)initWithAnnouncement:(id)a3 recipients:(id)a4 isReply:(id)a5 sharedUserID:(id)a6
{
  id v9;
  id v10;
  id v11;
  INSendAnnouncementIntent *v12;
  INSendAnnouncementIntent *v13;
  objc_super v15;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)INSendAnnouncementIntent;
  v12 = -[INIntent init](&v15, sel_init);
  v13 = v12;
  if (v12)
  {
    -[INSendAnnouncementIntent setAnnouncement:](v12, "setAnnouncement:", v9);
    -[INSendAnnouncementIntent setRecipients:](v13, "setRecipients:", v10);
    -[INSendAnnouncementIntent setIsReply:](v13, "setIsReply:", v11);
  }

  return v13;
}

- (INAnnouncement)announcement
{
  void *v2;
  void *v3;
  void *v4;

  -[INSendAnnouncementIntent _typedBackingStore](self, "_typedBackingStore");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "announcement");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  INIntentSlotValueTransformFromAnnouncement(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (INAnnouncement *)v4;
}

- (void)setAnnouncement:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[INSendAnnouncementIntent _typedBackingStore](self, "_typedBackingStore");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  INIntentSlotValueTransformToAnnouncement(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "setAnnouncement:", v5);
}

- (NSArray)recipients
{
  void *v2;
  void *v3;
  void *v4;

  -[INSendAnnouncementIntent _typedBackingStore](self, "_typedBackingStore");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "recipients");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  INIntentSlotValueTransformFromHomeFilters(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v4;
}

- (void)setRecipients:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[INSendAnnouncementIntent _typedBackingStore](self, "_typedBackingStore");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  INIntentSlotValueTransformToHomeFilters(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "setRecipients:", v5);
}

- (NSNumber)isReply
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  -[INSendAnnouncementIntent _typedBackingStore](self, "_typedBackingStore");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "hasIsReply"))
  {
    v4 = (void *)MEMORY[0x1E0CB37E8];
    -[INSendAnnouncementIntent _typedBackingStore](self, "_typedBackingStore");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "numberWithBool:", objc_msgSend(v5, "isReply"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = 0;
  }

  return (NSNumber *)v6;
}

- (void)setIsReply:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  -[INSendAnnouncementIntent _typedBackingStore](self, "_typedBackingStore");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
    objc_msgSend(v4, "setIsReply:", objc_msgSend(v5, "BOOLValue"));
  else
    objc_msgSend(v4, "setHasIsReply:", 0);

}

- (NSString)sharedUserID
{
  void *v2;
  void *v3;
  void *v4;

  -[INSendAnnouncementIntent _typedBackingStore](self, "_typedBackingStore");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "sharedUserID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "copy");

  return (NSString *)v4;
}

- (void)setSharedUserID:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[INSendAnnouncementIntent _typedBackingStore](self, "_typedBackingStore");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setSharedUserID:", v4);

}

- (id)_dictionaryRepresentation
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v11[3];
  _QWORD v12[4];

  v12[3] = *MEMORY[0x1E0C80C00];
  v11[0] = CFSTR("announcement");
  -[INSendAnnouncementIntent announcement](self, "announcement");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (!v3)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v12[0] = v4;
  v11[1] = CFSTR("recipients");
  -[INSendAnnouncementIntent recipients](self, "recipients");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v12[1] = v6;
  v11[2] = CFSTR("isReply");
  -[INSendAnnouncementIntent isReply](self, "isReply");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v12[2] = v8;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v12, v11, 3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v7)

  if (!v5)
  if (!v3)

  return v9;
}

- (void)_redactForMissingPrivacyEntitlementOptions:(unint64_t)a3 containingAppBundleId:(id)a4
{
  void *v5;
  id v6;

  -[INSendAnnouncementIntent _typedBackingStore](self, "_typedBackingStore", a3, a4);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v6, "copy");
  -[INIntent setBackingStore:](self, "setBackingStore:", v5);

}

- (id)domain
{
  return CFSTR("HomeCommunication");
}

- (id)verb
{
  return CFSTR("SendAnnouncement");
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
