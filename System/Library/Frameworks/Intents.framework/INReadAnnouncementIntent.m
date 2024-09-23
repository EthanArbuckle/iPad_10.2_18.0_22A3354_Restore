@implementation INReadAnnouncementIntent

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

  -[INReadAnnouncementIntent _typedBackingStore](self, "_typedBackingStore");
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
  -[INReadAnnouncementIntent _typedBackingStore](self, "_typedBackingStore");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setIntentMetadata:", v4);

}

- (int64_t)_intentCategory
{
  return 2;
}

- (id)_categoryVerb
{
  return CFSTR("Play");
}

- (INReadAnnouncementIntent)initWithReadType:(int64_t)a3 startAnnouncementIdentifier:(id)a4 userNotificationType:(int64_t)a5
{
  id v8;
  INReadAnnouncementIntent *v9;
  INReadAnnouncementIntent *v10;
  objc_super v12;

  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)INReadAnnouncementIntent;
  v9 = -[INIntent init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    -[INReadAnnouncementIntent setReadType:](v9, "setReadType:", a3);
    -[INReadAnnouncementIntent setStartAnnouncementIdentifier:](v10, "setStartAnnouncementIdentifier:", v8);
    -[INReadAnnouncementIntent setUserNotificationType:](v10, "setUserNotificationType:", a5);
  }

  return v10;
}

- (int64_t)readType
{
  void *v3;
  int v4;
  void *v5;
  int v6;
  uint64_t v7;
  int64_t v8;

  -[INReadAnnouncementIntent _typedBackingStore](self, "_typedBackingStore");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hasReadType");
  -[INReadAnnouncementIntent _typedBackingStore](self, "_typedBackingStore");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "readType");
  v7 = 2 * (v6 == 2);
  if (v6 == 1)
    v7 = 1;
  if (v4)
    v8 = v7;
  else
    v8 = 0;

  return v8;
}

- (void)setReadType:(int64_t)a3
{
  unsigned int v3;
  uint64_t v4;
  void *v5;
  id v6;

  if (a3 == 1)
    v3 = 1;
  else
    v3 = 0x7FFFFFFF;
  if (a3 == 2)
    v4 = 2;
  else
    v4 = v3;
  -[INReadAnnouncementIntent _typedBackingStore](self, "_typedBackingStore");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if ((_DWORD)v4 == 0x7FFFFFFF)
    objc_msgSend(v5, "setHasReadType:", 0);
  else
    objc_msgSend(v5, "setReadType:", v4);

}

- (NSString)startAnnouncementIdentifier
{
  void *v2;
  void *v3;
  void *v4;

  -[INReadAnnouncementIntent _typedBackingStore](self, "_typedBackingStore");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "startAnnouncementIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "copy");

  return (NSString *)v4;
}

- (void)setStartAnnouncementIdentifier:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[INReadAnnouncementIntent _typedBackingStore](self, "_typedBackingStore");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setStartAnnouncementIdentifier:", v4);

}

- (int64_t)userNotificationType
{
  void *v3;
  int v4;
  void *v5;
  int v6;
  uint64_t v7;
  int64_t v8;

  -[INReadAnnouncementIntent _typedBackingStore](self, "_typedBackingStore");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hasUserNotificationType");
  -[INReadAnnouncementIntent _typedBackingStore](self, "_typedBackingStore");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "userNotificationType");
  v7 = 2 * (v6 == 2);
  if (v6 == 1)
    v7 = 1;
  if (v4)
    v8 = v7;
  else
    v8 = 0;

  return v8;
}

- (void)setUserNotificationType:(int64_t)a3
{
  unsigned int v3;
  uint64_t v4;
  void *v5;
  id v6;

  if (a3 == 1)
    v3 = 1;
  else
    v3 = 0x7FFFFFFF;
  if (a3 == 2)
    v4 = 2;
  else
    v4 = v3;
  -[INReadAnnouncementIntent _typedBackingStore](self, "_typedBackingStore");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if ((_DWORD)v4 == 0x7FFFFFFF)
    objc_msgSend(v5, "setHasUserNotificationType:", 0);
  else
    objc_msgSend(v5, "setUserNotificationType:", v4);

}

- (id)_dictionaryRepresentation
{
  int64_t v3;
  __CFString *v4;
  __CFString *v5;
  void *v6;
  void *v7;
  int64_t v8;
  __CFString *v9;
  __CFString *v10;
  void *v11;
  _QWORD v13[3];
  _QWORD v14[4];

  v14[3] = *MEMORY[0x1E0C80C00];
  v13[0] = CFSTR("readType");
  v3 = -[INReadAnnouncementIntent readType](self, "readType");
  v4 = CFSTR("unknown");
  if (v3 == 2)
    v4 = CFSTR("repeat");
  if (v3 == 1)
    v4 = CFSTR("read");
  v5 = v4;
  v14[0] = v5;
  v13[1] = CFSTR("startAnnouncementIdentifier");
  -[INReadAnnouncementIntent startAnnouncementIdentifier](self, "startAnnouncementIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (!v6)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v14[1] = v7;
  v13[2] = CFSTR("userNotificationType");
  v8 = -[INReadAnnouncementIntent userNotificationType](self, "userNotificationType");
  v9 = CFSTR("unknown");
  if (v8 == 2)
    v9 = CFSTR("deliveryFailure");
  if (v8 == 1)
    v9 = CFSTR("announcement");
  v10 = v9;
  v14[2] = v10;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v14, v13, 3);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
  return v11;
}

- (void)_redactForMissingPrivacyEntitlementOptions:(unint64_t)a3 containingAppBundleId:(id)a4
{
  void *v5;
  id v6;

  -[INReadAnnouncementIntent _typedBackingStore](self, "_typedBackingStore", a3, a4);
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
  return CFSTR("ReadAnnouncement");
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
