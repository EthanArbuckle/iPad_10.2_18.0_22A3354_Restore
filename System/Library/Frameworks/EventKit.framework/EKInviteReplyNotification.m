@implementation EKInviteReplyNotification

+ (Class)frozenClass
{
  return (Class)objc_opt_class();
}

+ (id)knownRelationshipSingleValueKeys
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __61__EKInviteReplyNotification_knownRelationshipSingleValueKeys__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (knownRelationshipSingleValueKeys_onceToken_0 != -1)
    dispatch_once(&knownRelationshipSingleValueKeys_onceToken_0, block);
  return (id)knownRelationshipSingleValueKeys_keys_0;
}

void __61__EKInviteReplyNotification_knownRelationshipSingleValueKeys__block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  objc_super v8;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x1E0C80C00];
  v9[0] = *MEMORY[0x1E0D0B7D8];
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v9, 1);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)knownRelationshipSingleValueKeys_keys_0;
  knownRelationshipSingleValueKeys_keys_0 = v2;

  v4 = (void *)knownRelationshipSingleValueKeys_keys_0;
  v8.receiver = *(id *)(a1 + 32);
  v8.super_class = (Class)&OBJC_METACLASS___EKInviteReplyNotification;
  objc_msgSendSuper2(&v8, sel_knownRelationshipSingleValueKeys);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "arrayByAddingObjectsFromArray:", v5);
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = (void *)knownRelationshipSingleValueKeys_keys_0;
  knownRelationshipSingleValueKeys_keys_0 = v6;

}

+ (id)sourceForInviteReplyNotification:(id)a3
{
  void *v3;
  void *v4;

  objc_msgSend(a3, "calendar");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "source");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (EKInviteReplyNotification)initWithInviteReplyCalendar:(id)a3
{
  id v4;
  EKInviteReplyNotification *v5;
  EKInviteReplyNotification *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)EKInviteReplyNotification;
  v5 = -[EKObject init](&v8, sel_init);
  v6 = v5;
  if (v5)
    -[EKInviteReplyNotification _setInviteReplyCalendar:](v5, "_setInviteReplyCalendar:", v4);

  return v6;
}

- (EKCalendar)inviteReplyCalendar
{
  return (EKCalendar *)-[EKObject meltedAndCachedSingleRelationObjectForKey:](self, "meltedAndCachedSingleRelationObjectForKey:", *MEMORY[0x1E0D0B7D8]);
}

- (void)_setInviteReplyCalendar:(id)a3
{
  uint64_t v4;
  id v5;

  v4 = *MEMORY[0x1E0D0B7D8];
  v5 = a3;
  -[EKObject updateMeltedAndCachedSingleRelationObject:forKey:frozenClass:](self, "updateMeltedAndCachedSingleRelationObject:forKey:frozenClass:", v5, v4, +[EKCalendar frozenClass](EKCalendar, "frozenClass"));

}

- (NSString)inReplyTo
{
  return (NSString *)-[EKObject singleChangedValueForKey:](self, "singleChangedValueForKey:", *MEMORY[0x1E0D0B7D0]);
}

- (void)setInReplyTo:(id)a3
{
  -[EKObject setSingleChangedValue:forKey:](self, "setSingleChangedValue:forKey:", a3, *MEMORY[0x1E0D0B7D0]);
}

- (NSString)shareeDisplayName
{
  void *v3;
  void *v4;
  void *v5;

  -[EKObject singleChangedValueForKey:](self, "singleChangedValueForKey:", *MEMORY[0x1E0D0B7F0]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    -[EKInviteReplyNotification shareeFirstName](self, "shareeFirstName");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[EKInviteReplyNotification shareeLastName](self, "shareeLastName");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    DisplayNameStringForIdentityWithProperties();
    v3 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return (NSString *)v3;
}

- (void)setShareeDisplayName:(id)a3
{
  -[EKObject setSingleChangedValue:forKey:](self, "setSingleChangedValue:forKey:", a3, *MEMORY[0x1E0D0B7F0]);
}

- (NSString)shareeFirstName
{
  return (NSString *)-[EKObject singleChangedValueForKey:](self, "singleChangedValueForKey:", *MEMORY[0x1E0D0B7F8]);
}

- (void)setShareeFirstName:(id)a3
{
  -[EKObject setSingleChangedValue:forKey:](self, "setSingleChangedValue:forKey:", a3, *MEMORY[0x1E0D0B7F8]);
}

- (NSString)shareeLastName
{
  return (NSString *)-[EKObject singleChangedValueForKey:](self, "singleChangedValueForKey:", *MEMORY[0x1E0D0B800]);
}

- (void)setShareeLastName:(id)a3
{
  -[EKObject setSingleChangedValue:forKey:](self, "setSingleChangedValue:forKey:", a3, *MEMORY[0x1E0D0B800]);
}

- (id)shareeURLString
{
  return -[EKObject singleChangedValueForKey:](self, "singleChangedValueForKey:", *MEMORY[0x1E0D0B810]);
}

- (void)setShareeURLString:(id)a3
{
  -[EKObject setSingleChangedValue:forKey:](self, "setSingleChangedValue:forKey:", a3, *MEMORY[0x1E0D0B810]);
}

- (NSURL)shareeURL
{
  void *v2;
  void *v3;

  -[EKInviteReplyNotification shareeURLString](self, "shareeURLString");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", v2);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }

  return (NSURL *)v3;
}

- (void)setShareeURL:(id)a3
{
  id v4;

  objc_msgSend(a3, "absoluteString");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[EKInviteReplyNotification setShareeURLString:](self, "setShareeURLString:", v4);

}

- (unint64_t)shareeStatus
{
  void *v2;
  unint64_t v3;

  -[EKObject singleChangedValueForKey:](self, "singleChangedValueForKey:", *MEMORY[0x1E0D0B808]);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "unsignedIntegerValue");

  return v3;
}

- (void)setShareeStatus:(unint64_t)a3
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[EKObject setSingleChangedValue:forKey:](self, "setSingleChangedValue:forKey:", v4, *MEMORY[0x1E0D0B808]);

}

- (NSDate)creationDate
{
  return (NSDate *)-[EKObject singleChangedValueForKey:](self, "singleChangedValueForKey:", *MEMORY[0x1E0D0B7B8]);
}

- (void)setCreationDate:(id)a3
{
  -[EKObject setSingleChangedValue:forKey:](self, "setSingleChangedValue:forKey:", a3, *MEMORY[0x1E0D0B7B8]);
}

- (NSString)summary
{
  return (NSString *)-[EKObject singleChangedValueForKey:](self, "singleChangedValueForKey:", *MEMORY[0x1E0D0B818]);
}

- (void)setSummary:(id)a3
{
  -[EKObject setSingleChangedValue:forKey:](self, "setSingleChangedValue:forKey:", a3, *MEMORY[0x1E0D0B818]);
}

- (NSString)shareeEmailAddress
{
  void *v2;
  void *v3;

  -[EKInviteReplyNotification shareeURL](self, "shareeURL");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "cal_emailAddressString");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (NSString)shareePhoneNumber
{
  void *v2;
  void *v3;

  -[EKInviteReplyNotification shareeURL](self, "shareeURL");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "cal_phoneNumberString");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (BOOL)alerted
{
  void *v2;
  char v3;

  -[EKObject singleChangedValueForKey:](self, "singleChangedValueForKey:", *MEMORY[0x1E0D0B7A8]);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "BOOLValue");

  return v3;
}

- (void)clearAlertedStatus
{
  id v2;

  -[EKObject persistentObject](self, "persistentObject");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "unloadPropertyForKey:", *MEMORY[0x1E0D0B7A8]);

}

- (BOOL)validate:(id *)a3
{
  _BOOL4 v5;
  void *v6;
  id v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)EKInviteReplyNotification;
  v5 = -[EKObject validate:](&v9, sel_validate_);
  if (v5)
  {
    -[EKInviteReplyNotification inviteReplyCalendar](self, "inviteReplyCalendar");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      LOBYTE(v5) = 1;
    }
    else if (a3)
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithEKErrorCode:", 31);
      v7 = (id)objc_claimAutoreleasedReturnValue();
      LOBYTE(v5) = 0;
      *a3 = v7;
    }
    else
    {
      LOBYTE(v5) = 0;
    }
  }
  return v5;
}

@end
