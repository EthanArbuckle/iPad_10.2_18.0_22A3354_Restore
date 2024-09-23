@implementation _UNNotificationCommunicationContext

- (BOOL)isGroup
{
  return -[_UNNotificationCommunicationContext _effectiveAllContactsCount](self, "_effectiveAllContactsCount") > 1;
}

- (BOOL)isDirect
{
  return !-[_UNNotificationCommunicationContext isGroup](self, "isGroup");
}

- (NSArray)allContacts
{
  id v3;
  void *v4;
  void *v5;

  if (self->_sender)
  {
    v3 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    -[_UNNotificationCommunicationContext sender](self, "sender");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObject:", v4);

    -[_UNNotificationCommunicationContext recipients](self, "recipients");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObjectsFromArray:", v5);

  }
  else
  {
    -[_UNNotificationCommunicationContext recipients](self, "recipients");
    v3 = (id)objc_claimAutoreleasedReturnValue();
  }
  return (NSArray *)v3;
}

- (NSString)preferredSenderSummary
{
  _UNNotificationContact *sender;
  void *v4;
  void *v5;

  sender = self->_sender;
  if (sender)
  {
    -[_UNNotificationContact preferredName](sender, "preferredName");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[_UNNotificationCommunicationContext recipients](self, "recipients");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UNNotificationCommunicationContext _summaryFromContacts:effectiveCount:includeMe:](self, "_summaryFromContacts:effectiveCount:includeMe:", v5, -[_UNNotificationCommunicationContext _effectiveRecipientCount](self, "_effectiveRecipientCount"), 0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return (NSString *)v4;
}

- (NSString)preferredRecipientsSummary
{
  __CFString *v3;
  void *v4;
  uint64_t v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  if (self->_sender && -[_UNNotificationCommunicationContext isGroup](self, "isGroup"))
  {
    if (self->_replyToCurrentUser)
    {
      v3 = CFSTR("COMMUNICATION_CONTEXT_CONTACT_REPLIED_TO_YOU");
    }
    else
    {
      if (!self->_mentionsCurrentUser)
        goto LABEL_11;
      v3 = CFSTR("COMMUNICATION_CONTEXT_CONTACT_MENTIONED_YOU");
    }
    UNLocalizedStringForKey(v3);
    v5 = objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      v6 = (id)v5;
      -[_UNNotificationCommunicationContext preferredDescription](self, "preferredDescription");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      if (v7)
      {
        UNLocalizedFormatStringForKey((uint64_t)CFSTR("%@%@"), CFSTR("COMMUNICATION_CONTEXT_CONTACT_SUMMARY_WITH_ACTION_AND_GROUP_NAME"));
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "localizedStringWithFormat:", v8, v6, v7);
        v4 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_16:
        goto LABEL_17;
      }
      v10 = v6;
LABEL_15:
      v4 = v10;
      goto LABEL_16;
    }
LABEL_11:
    -[_UNNotificationCommunicationContext displayName](self, "displayName");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v9;
    if (v9)
    {
      v6 = v9;
      v4 = v6;
LABEL_17:

      return (NSString *)v4;
    }
    -[_UNNotificationCommunicationContext recipients](self, "recipients");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UNNotificationCommunicationContext _summaryFromContacts:effectiveCount:includeMe:](self, "_summaryFromContacts:effectiveCount:includeMe:", v7, -[_UNNotificationCommunicationContext _effectiveRecipientCount](self, "_effectiveRecipientCount"), 1);
    v10 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_15;
  }
  v4 = 0;
  return (NSString *)v4;
}

- (NSString)preferredDescription
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  -[_UNNotificationCommunicationContext displayName](self, "displayName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "length"))
  {
    -[_UNNotificationCommunicationContext displayName](self, "displayName");
    v4 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[_UNNotificationCommunicationContext allContacts](self, "allContacts");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UNNotificationCommunicationContext _summaryFromContacts:effectiveCount:includeMe:](self, "_summaryFromContacts:effectiveCount:includeMe:", v5, -[_UNNotificationCommunicationContext _effectiveAllContactsCount](self, "_effectiveAllContactsCount"), 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v6;
    if (v6)
    {
      v4 = v6;
    }
    else
    {
      -[_UNNotificationCommunicationContext allContacts](self, "allContacts");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "firstObject");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "preferredName");
      v4 = (id)objc_claimAutoreleasedReturnValue();

    }
  }

  return (NSString *)v4;
}

- (BOOL)isAvatarImagePossibleForBundleIdentifier:(id)a3
{
  void *v4;
  uint64_t v5;
  BOOL result;

  result = objc_msgSend(a3, "un_isFirstPartyIdentifier")
        && (-[_UNNotificationCommunicationContext allContacts](self, "allContacts"),
            v4 = (void *)objc_claimAutoreleasedReturnValue(),
            v5 = objc_msgSend(v4, "count"),
            v4,
            v5)
        || *(_OWORD *)&self->_contentURL != 0;
  return result;
}

- (id)_initWithIdentifier:(id)a3 associatedObjectUri:(id)a4 bundleIdentifier:(id)a5 displayName:(id)a6 sender:(id)a7 recipients:(id)a8 contentURL:(id)a9 imageName:(id)a10 systemImage:(BOOL)a11 mentionsCurrentUser:(BOOL)a12 notifyRecipientAnyway:(BOOL)a13 replyToCurrentUser:(BOOL)a14 recipientCount:(unint64_t)a15 capabilities:(int64_t)a16 businessCorrespondence:(BOOL)a17
{
  id v23;
  id v24;
  id v25;
  id v26;
  id v27;
  id v28;
  id v29;
  id v30;
  _UNNotificationCommunicationContext *v31;
  uint64_t v32;
  NSString *identifier;
  uint64_t v34;
  NSString *associatedObjectUri;
  uint64_t v36;
  NSString *bundleIdentifier;
  uint64_t v38;
  NSString *displayName;
  uint64_t v40;
  _UNNotificationContact *sender;
  uint64_t v42;
  NSArray *recipients;
  uint64_t v44;
  NSURL *contentURL;
  uint64_t v46;
  NSString *imageName;
  objc_super v49;

  v23 = a3;
  v24 = a4;
  v25 = a5;
  v26 = a6;
  v27 = a7;
  v28 = a8;
  v29 = a9;
  v30 = a10;
  v49.receiver = self;
  v49.super_class = (Class)_UNNotificationCommunicationContext;
  v31 = -[_UNNotificationCommunicationContext init](&v49, sel_init);
  if (v31)
  {
    v32 = objc_msgSend(v23, "copy");
    identifier = v31->_identifier;
    v31->_identifier = (NSString *)v32;

    v34 = objc_msgSend(v24, "copy");
    associatedObjectUri = v31->_associatedObjectUri;
    v31->_associatedObjectUri = (NSString *)v34;

    v36 = objc_msgSend(v25, "copy");
    bundleIdentifier = v31->_bundleIdentifier;
    v31->_bundleIdentifier = (NSString *)v36;

    v38 = objc_msgSend(v26, "copy");
    displayName = v31->_displayName;
    v31->_displayName = (NSString *)v38;

    v40 = objc_msgSend(v27, "copy");
    sender = v31->_sender;
    v31->_sender = (_UNNotificationContact *)v40;

    v42 = objc_msgSend(v28, "copy");
    recipients = v31->_recipients;
    v31->_recipients = (NSArray *)v42;

    v44 = objc_msgSend(v29, "copy");
    contentURL = v31->_contentURL;
    v31->_contentURL = (NSURL *)v44;

    v46 = objc_msgSend(v30, "copy");
    imageName = v31->_imageName;
    v31->_imageName = (NSString *)v46;

    v31->_systemImage = a11;
    v31->_mentionsCurrentUser = a12;
    v31->_notifyRecipientAnyway = a13;
    v31->_replyToCurrentUser = a14;
    v31->_recipientCount = a15;
    v31->_capabilities = a16;
    v31->_businessCorrespondence = a17;
  }

  return v31;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  void *v13;
  int v14;
  void *v15;
  void *v16;
  int v17;
  void *v18;
  void *v19;
  int v20;
  void *v21;
  void *v22;
  int v23;
  void *v24;
  void *v25;
  int v26;
  void *v27;
  void *v28;
  int v29;
  int v30;
  int v31;
  int v32;
  int v33;
  unint64_t v34;
  int64_t v35;
  _BOOL4 v36;
  int v37;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v5 = 0;
LABEL_20:
      LOBYTE(v37) = 0;
      goto LABEL_21;
    }
  }
  v5 = v4;
  if (!v5)
    goto LABEL_20;
  -[_UNNotificationCommunicationContext identifier](self, "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "identifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = UNEqualStrings(v6, v7);

  if (!v8)
    goto LABEL_20;
  -[_UNNotificationCommunicationContext associatedObjectUri](self, "associatedObjectUri");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "associatedObjectUri");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = UNEqualStrings(v9, v10);

  if (!v11)
    goto LABEL_20;
  -[_UNNotificationCommunicationContext bundleIdentifier](self, "bundleIdentifier");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "bundleIdentifier");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = UNEqualStrings(v12, v13);

  if (!v14)
    goto LABEL_20;
  -[_UNNotificationCommunicationContext displayName](self, "displayName");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "displayName");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = UNEqualStrings(v15, v16);

  if (!v17)
    goto LABEL_20;
  -[_UNNotificationCommunicationContext sender](self, "sender");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "sender");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = UNEqualObjects(v18, v19);

  if (!v20)
    goto LABEL_20;
  -[_UNNotificationCommunicationContext recipients](self, "recipients");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "recipients");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = UNEqualObjects(v21, v22);

  if (!v23)
    goto LABEL_20;
  -[_UNNotificationCommunicationContext contentURL](self, "contentURL");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "contentURL");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = UNEqualObjects(v24, v25);

  if (!v26)
    goto LABEL_20;
  -[_UNNotificationCommunicationContext imageName](self, "imageName");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "imageName");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = UNEqualObjects(v27, v28);

  if (!v29)
    goto LABEL_20;
  v30 = -[_UNNotificationCommunicationContext isSystemImage](self, "isSystemImage");
  if (v30 != objc_msgSend(v5, "isSystemImage"))
    goto LABEL_20;
  v31 = -[_UNNotificationCommunicationContext mentionsCurrentUser](self, "mentionsCurrentUser");
  if (v31 != objc_msgSend(v5, "mentionsCurrentUser"))
    goto LABEL_20;
  v32 = -[_UNNotificationCommunicationContext notifyRecipientAnyway](self, "notifyRecipientAnyway");
  if (v32 != objc_msgSend(v5, "notifyRecipientAnyway"))
    goto LABEL_20;
  v33 = -[_UNNotificationCommunicationContext isReplyToCurrentUser](self, "isReplyToCurrentUser");
  if (v33 != objc_msgSend(v5, "isReplyToCurrentUser"))
    goto LABEL_20;
  v34 = -[_UNNotificationCommunicationContext recipientCount](self, "recipientCount");
  if (v34 != objc_msgSend(v5, "recipientCount"))
    goto LABEL_20;
  v35 = -[_UNNotificationCommunicationContext capabilities](self, "capabilities");
  if (v35 != objc_msgSend(v5, "capabilities"))
    goto LABEL_20;
  v36 = -[_UNNotificationCommunicationContext isBusinessCorrespondence](self, "isBusinessCorrespondence");
  v37 = v36 ^ objc_msgSend(v5, "isBusinessCorrespondence") ^ 1;
LABEL_21:

  return v37;
}

- (unint64_t)hash
{
  NSUInteger v3;
  NSUInteger v4;
  NSUInteger v5;
  NSUInteger v6;
  unint64_t v7;
  unint64_t v8;
  NSUInteger v9;

  v3 = -[NSString hash](self->_identifier, "hash");
  v4 = -[NSString hash](self->_associatedObjectUri, "hash") + v3;
  v5 = -[NSString hash](self->_bundleIdentifier, "hash");
  v6 = v4 + v5 + -[NSString hash](self->_displayName, "hash");
  v7 = -[_UNNotificationContact hash](self->_sender, "hash");
  v8 = v7 + -[NSArray hash](self->_recipients, "hash");
  v9 = v6 + v8 + -[NSURL hash](self->_contentURL, "hash");
  return v9
       + -[NSString hash](self->_imageName, "hash")
       + self->_systemImage
       + self->_mentionsCurrentUser
       + self->_notifyRecipientAnyway
       + self->_replyToCurrentUser
       + self->_recipientCount
       + self->_capabilities
       + self->_businessCorrespondence;
}

- (NSString)debugDescription
{
  return (NSString *)-[_UNNotificationCommunicationContext descriptionWithMultilinePrefix:](self, "descriptionWithMultilinePrefix:", 0);
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  void *v4;
  void *v5;
  void *v6;
  BOOL v7;
  BOOL v8;
  BOOL v9;
  BOOL v10;
  unint64_t v11;
  int64_t v12;
  id v13;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  _UNMutableNotificationCommunicationContext *v22;

  v22 = +[_UNMutableNotificationCommunicationContext allocWithZone:](_UNMutableNotificationCommunicationContext, "allocWithZone:", a3);
  -[_UNNotificationCommunicationContext identifier](self, "identifier");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UNNotificationCommunicationContext associatedObjectUri](self, "associatedObjectUri");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UNNotificationCommunicationContext bundleIdentifier](self, "bundleIdentifier");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UNNotificationCommunicationContext displayName](self, "displayName");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UNNotificationCommunicationContext sender](self, "sender");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UNNotificationCommunicationContext recipients](self, "recipients");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UNNotificationCommunicationContext contentURL](self, "contentURL");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UNNotificationCommunicationContext imageName](self, "imageName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[_UNNotificationCommunicationContext isSystemImage](self, "isSystemImage");
  v8 = -[_UNNotificationCommunicationContext mentionsCurrentUser](self, "mentionsCurrentUser");
  v9 = -[_UNNotificationCommunicationContext notifyRecipientAnyway](self, "notifyRecipientAnyway");
  v10 = -[_UNNotificationCommunicationContext isReplyToCurrentUser](self, "isReplyToCurrentUser");
  v11 = -[_UNNotificationCommunicationContext recipientCount](self, "recipientCount");
  v12 = -[_UNNotificationCommunicationContext capabilities](self, "capabilities");
  LOBYTE(v16) = -[_UNNotificationCommunicationContext isBusinessCorrespondence](self, "isBusinessCorrespondence");
  BYTE3(v15) = v10;
  BYTE2(v15) = v9;
  BYTE1(v15) = v8;
  LOBYTE(v15) = v7;
  v13 = -[_UNNotificationCommunicationContext _initWithIdentifier:associatedObjectUri:bundleIdentifier:displayName:sender:recipients:contentURL:imageName:systemImage:mentionsCurrentUser:notifyRecipientAnyway:replyToCurrentUser:recipientCount:capabilities:businessCorrespondence:](v22, "_initWithIdentifier:associatedObjectUri:bundleIdentifier:displayName:sender:recipients:contentURL:imageName:systemImage:mentionsCurrentUser:notifyRecipientAnyway:replyToCurrentUser:recipientCount:capabilities:businessCorrespondence:", v21, v20, v19, v18, v17, v4, v5, v6, v15, v11, v12, v16);

  return v13;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  v12 = a3;
  -[_UNNotificationCommunicationContext identifier](self, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "encodeObject:forKey:", v4, CFSTR("identifier"));

  -[_UNNotificationCommunicationContext associatedObjectUri](self, "associatedObjectUri");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "encodeObject:forKey:", v5, CFSTR("associatedObjectUri"));

  -[_UNNotificationCommunicationContext bundleIdentifier](self, "bundleIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "encodeObject:forKey:", v6, CFSTR("bundleIdentifier"));

  -[_UNNotificationCommunicationContext displayName](self, "displayName");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "encodeObject:forKey:", v7, CFSTR("displayName"));

  -[_UNNotificationCommunicationContext recipients](self, "recipients");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "encodeObject:forKey:", v8, CFSTR("recipients"));

  -[_UNNotificationCommunicationContext sender](self, "sender");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "encodeObject:forKey:", v9, CFSTR("sender"));

  -[_UNNotificationCommunicationContext contentURL](self, "contentURL");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "encodeObject:forKey:", v10, CFSTR("contentURL"));

  -[_UNNotificationCommunicationContext imageName](self, "imageName");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "encodeObject:forKey:", v11, CFSTR("imageName"));

  objc_msgSend(v12, "encodeBool:forKey:", -[_UNNotificationCommunicationContext isSystemImage](self, "isSystemImage"), CFSTR("systemImage"));
  objc_msgSend(v12, "encodeBool:forKey:", -[_UNNotificationCommunicationContext mentionsCurrentUser](self, "mentionsCurrentUser"), CFSTR("mentionsCurrentUser"));
  objc_msgSend(v12, "encodeBool:forKey:", -[_UNNotificationCommunicationContext notifyRecipientAnyway](self, "notifyRecipientAnyway"), CFSTR("notifyRecipientAnyway"));
  objc_msgSend(v12, "encodeBool:forKey:", -[_UNNotificationCommunicationContext isReplyToCurrentUser](self, "isReplyToCurrentUser"), CFSTR("replyToCurrentUser"));
  objc_msgSend(v12, "encodeInteger:forKey:", -[_UNNotificationCommunicationContext recipientCount](self, "recipientCount"), CFSTR("recipientCount"));
  objc_msgSend(v12, "encodeInteger:forKey:", -[_UNNotificationCommunicationContext capabilities](self, "capabilities"), CFSTR("capabilities"));
  objc_msgSend(v12, "encodeBool:forKey:", -[_UNNotificationCommunicationContext isBusinessCorrespondence](self, "isBusinessCorrespondence"), CFSTR("businessCorrespondence"));

}

- (_UNNotificationCommunicationContext)initWithCoder:(id)a3
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  char v9;
  char v10;
  char v11;
  char v12;
  uint64_t v13;
  uint64_t v14;
  _UNNotificationCommunicationContext *v15;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;

  v3 = a3;
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("identifier"));
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("associatedObjectUri"));
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("bundleIdentifier"));
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("displayName"));
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("sender"));
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)MEMORY[0x1E0C99E60];
  v5 = objc_opt_class();
  objc_msgSend(v4, "setWithObjects:", v5, objc_opt_class(), 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeObjectOfClasses:forKey:", v6, CFSTR("recipients"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("contentURL"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("imageName"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v3, "decodeBoolForKey:", CFSTR("systemImage"));
  v10 = objc_msgSend(v3, "decodeBoolForKey:", CFSTR("mentionsCurrentUser"));
  v11 = objc_msgSend(v3, "decodeBoolForKey:", CFSTR("notifyRecipientAnyway"));
  v12 = objc_msgSend(v3, "decodeBoolForKey:", CFSTR("replyToCurrentUser"));
  v13 = objc_msgSend(v3, "decodeIntegerForKey:", CFSTR("recipientCount"));
  v14 = objc_msgSend(v3, "decodeIntegerForKey:", CFSTR("capabilities"));
  LOBYTE(v4) = objc_msgSend(v3, "decodeBoolForKey:", CFSTR("businessCorrespondence"));

  LOBYTE(v18) = (_BYTE)v4;
  BYTE3(v17) = v12;
  BYTE2(v17) = v11;
  BYTE1(v17) = v10;
  LOBYTE(v17) = v9;
  v15 = -[_UNNotificationCommunicationContext _initWithIdentifier:associatedObjectUri:bundleIdentifier:displayName:sender:recipients:contentURL:imageName:systemImage:mentionsCurrentUser:notifyRecipientAnyway:replyToCurrentUser:recipientCount:capabilities:businessCorrespondence:](self, "_initWithIdentifier:associatedObjectUri:bundleIdentifier:displayName:sender:recipients:contentURL:imageName:systemImage:mentionsCurrentUser:notifyRecipientAnyway:replyToCurrentUser:recipientCount:capabilities:businessCorrespondence:", v24, v23, v22, v21, v20, v19, v7, v8, v17, v13, v14, v18);

  return v15;
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  void *v3;
  void *v4;

  -[_UNNotificationCommunicationContext descriptionBuilderWithMultilinePrefix:](self, "descriptionBuilderWithMultilinePrefix:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "build");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  id v7;
  id v8;
  _QWORD v10[4];
  id v11;
  _UNNotificationCommunicationContext *v12;

  v4 = (void *)MEMORY[0x1E0D01748];
  v5 = a3;
  objc_msgSend(v4, "builderWithObject:", self);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __77___UNNotificationCommunicationContext_descriptionBuilderWithMultilinePrefix___block_invoke;
  v10[3] = &unk_1E57EFBA8;
  v7 = v6;
  v11 = v7;
  v12 = self;
  objc_msgSend(v7, "appendBodySectionWithName:multilinePrefix:block:", 0, v5, v10);

  v8 = v7;
  return v8;
}

- (id)succinctDescription
{
  void *v2;
  void *v3;

  -[_UNNotificationCommunicationContext succinctDescriptionBuilder](self, "succinctDescriptionBuilder");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "build");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)succinctDescriptionBuilder
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  id v13;
  void *v14;
  id v15;
  void *v16;
  id v17;
  void *v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  int64_t v25;
  const __CFString *v26;
  const __CFString *v27;
  id v28;

  objc_msgSend(MEMORY[0x1E0D01748], "builderWithObject:", self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UNNotificationCommunicationContext identifier](self, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "un_logDigest");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (id)objc_msgSend(v3, "appendObject:withName:", v5, CFSTR("identifier"));

  -[_UNNotificationCommunicationContext bundleIdentifier](self, "bundleIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (id)objc_msgSend(v3, "appendObject:withName:", v7, CFSTR("bundleIdentifier"));

  -[_UNNotificationCommunicationContext displayName](self, "displayName");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "un_logDigest");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (id)objc_msgSend(v3, "appendObject:withName:", v10, CFSTR("displayName"));

  -[_UNNotificationCommunicationContext recipients](self, "recipients");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (id)objc_msgSend(v3, "appendInteger:withName:", objc_msgSend(v12, "count"), CFSTR("recipientsArrayCount"));

  -[_UNNotificationCommunicationContext sender](self, "sender");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = (id)objc_msgSend(v3, "appendBool:withName:", v14 != 0, CFSTR("hasSender"));

  -[_UNNotificationCommunicationContext contentURL](self, "contentURL");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = (id)objc_msgSend(v3, "appendObject:withName:", v16, CFSTR("contentURL"));

  -[_UNNotificationCommunicationContext imageName](self, "imageName");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = (id)objc_msgSend(v3, "appendObject:withName:", v18, CFSTR("imageName"));

  v20 = (id)objc_msgSend(v3, "appendBool:withName:", -[_UNNotificationCommunicationContext isSystemImage](self, "isSystemImage"), CFSTR("isSystemImage"));
  v21 = (id)objc_msgSend(v3, "appendBool:withName:", -[_UNNotificationCommunicationContext mentionsCurrentUser](self, "mentionsCurrentUser"), CFSTR("mentionsCurrentUser"));
  v22 = (id)objc_msgSend(v3, "appendBool:withName:", -[_UNNotificationCommunicationContext notifyRecipientAnyway](self, "notifyRecipientAnyway"), CFSTR("notifyRecipientAnyway"));
  v23 = (id)objc_msgSend(v3, "appendBool:withName:", -[_UNNotificationCommunicationContext isReplyToCurrentUser](self, "isReplyToCurrentUser"), CFSTR("isReplyToCurrentUser"));
  v24 = (id)objc_msgSend(v3, "appendInteger:withName:", -[_UNNotificationCommunicationContext recipientCount](self, "recipientCount"), CFSTR("recipientCount"));
  v25 = -[_UNNotificationCommunicationContext capabilities](self, "capabilities");
  v26 = &stru_1E57F06A0;
  if (!v25)
    v26 = CFSTR("Unspecified");
  if ((v25 & 1) != 0)
    v27 = CFSTR("Video");
  else
    v27 = v26;
  objc_msgSend(v3, "appendString:withName:", v27, CFSTR("capabilities"));
  v28 = (id)objc_msgSend(v3, "appendBool:withName:", -[_UNNotificationCommunicationContext isBusinessCorrespondence](self, "isBusinessCorrespondence"), CFSTR("isBusinessCorrespondence"));
  return v3;
}

- (unint64_t)_effectiveAllContactsCount
{
  unint64_t v3;
  void *v4;
  unint64_t v5;

  v3 = -[_UNNotificationCommunicationContext _effectiveRecipientCount](self, "_effectiveRecipientCount");
  -[_UNNotificationCommunicationContext sender](self, "sender");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
    v5 = v3 + 1;
  else
    v5 = v3;

  return v5;
}

- (unint64_t)_effectiveRecipientCount
{
  unint64_t v3;
  void *v4;
  unint64_t v5;

  v3 = -[_UNNotificationCommunicationContext recipientCount](self, "recipientCount");
  -[_UNNotificationCommunicationContext recipients](self, "recipients");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "count");

  if (v3 <= v5)
    return v5;
  else
    return v3;
}

- (id)_summaryFromContacts:(id)a3 effectiveCount:(unint64_t)a4 includeMe:(BOOL)a5
{
  _BOOL4 v5;
  id v7;
  unint64_t v8;
  id v9;
  id v10;
  void *v11;
  unint64_t v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  unint64_t v21;
  unint64_t v22;
  unint64_t v23;
  unint64_t i;
  void *v25;
  unint64_t v26;
  unint64_t v27;
  uint64_t v28;
  unint64_t v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  _BYTE v44[128];
  uint64_t v45;

  v5 = a5;
  v45 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4 + v5;
  v9 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v10 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  if (v5)
  {
    UNLocalizedStringForKey(CFSTR("COMMUNICATION_CONTEXT_CONTACT_SUMMARY_TO_YOU"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "addObject:", v11);

  }
  v42 = 0u;
  v43 = 0u;
  if (v8 > 3)
    v12 = 2;
  else
    v12 = 3;
  v40 = 0uLL;
  v41 = 0uLL;
  v13 = v7;
  v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v40, v44, 16);
  if (v14)
  {
    v15 = v14;
    v16 = *(_QWORD *)v41;
LABEL_8:
    v17 = 0;
    while (1)
    {
      if (*(_QWORD *)v41 != v16)
        objc_enumerationMutation(v13);
      v18 = *(void **)(*((_QWORD *)&v40 + 1) + 8 * v17);
      if (objc_msgSend(v9, "count") >= v12)
        break;
      objc_msgSend(v18, "preferredName");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      if (v19)
      {
        if (objc_msgSend(v18, "isPreferredNameReal"))
          v20 = v9;
        else
          v20 = v10;
        objc_msgSend(v20, "addObject:", v19);
      }

      if (v15 == ++v17)
      {
        v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v40, v44, 16);
        if (v15)
          goto LABEL_8;
        break;
      }
    }
  }

  v21 = v12 - objc_msgSend(v9, "count");
  v22 = objc_msgSend(v10, "count");
  if (v22 >= v21)
    v23 = v21;
  else
    v23 = v22;
  if (v23)
  {
    for (i = 0; i < v27; ++i)
    {
      objc_msgSend(v10, "objectAtIndex:", i);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "addObject:", v25);

      v26 = objc_msgSend(v10, "count");
      if (v26 >= v21)
        v27 = v21;
      else
        v27 = v26;
    }
  }
  v28 = objc_msgSend(v9, "count");
  v29 = v8 - v28;
  if (v8 != v28)
  {
    if (v29 >> 4 < 0x271)
    {
      UNLocalizedFormatStringForKey((uint64_t)CFSTR("%lu"), CFSTR("COMMUNICATION_CONTEXT_CONTACT_SUMMARY_OTHERS_FORMAT"));
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "localizedStringWithFormat:", v31, v29, 0);
      v30 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      UNLocalizedStringForKey(CFSTR("COMMUNICATION_CONTEXT_CONTACT_SUMMARY_MANY_OTHERS"));
      v30 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v9, "addObject:", v30);

  }
  if (objc_msgSend(v9, "count") == 1)
  {
    objc_msgSend(v9, "objectAtIndex:", 0);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (objc_msgSend(v9, "count") == 2)
    {
      UNLocalizedFormatStringForKey((uint64_t)CFSTR("%@%@"), CFSTR("COMMUNICATION_CONTEXT_CONTACT_SUMMARY_TWO_NAMES_FORMAT"));
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      v34 = (void *)MEMORY[0x1E0CB3940];
      objc_msgSend(v9, "objectAtIndex:", 0);
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "objectAtIndex:", 1);
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v34, "localizedStringWithFormat:", v33, v35, v36, 0);
      v32 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      if (objc_msgSend(v9, "count") != 3)
      {
        v32 = 0;
        goto LABEL_41;
      }
      UNLocalizedFormatStringForKey((uint64_t)CFSTR("%@%@%@"), CFSTR("COMMUNICATION_CONTEXT_CONTACT_SUMMARY_THREE_NAMES_FORMAT"));
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      v37 = (void *)MEMORY[0x1E0CB3940];
      objc_msgSend(v9, "objectAtIndex:", 0);
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "objectAtIndex:", 1);
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "objectAtIndex:", 2);
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v37, "localizedStringWithFormat:", v33, v35, v36, v38, 0, (_QWORD)v40);
      v32 = (void *)objc_claimAutoreleasedReturnValue();

    }
  }
LABEL_41:

  return v32;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (NSString)associatedObjectUri
{
  return self->_associatedObjectUri;
}

- (NSString)bundleIdentifier
{
  return self->_bundleIdentifier;
}

- (NSString)displayName
{
  return self->_displayName;
}

- (_UNNotificationContact)sender
{
  return self->_sender;
}

- (NSArray)recipients
{
  return self->_recipients;
}

- (NSURL)contentURL
{
  return self->_contentURL;
}

- (NSString)imageName
{
  return self->_imageName;
}

- (BOOL)isSystemImage
{
  return self->_systemImage;
}

- (BOOL)mentionsCurrentUser
{
  return self->_mentionsCurrentUser;
}

- (BOOL)notifyRecipientAnyway
{
  return self->_notifyRecipientAnyway;
}

- (BOOL)isReplyToCurrentUser
{
  return self->_replyToCurrentUser;
}

- (unint64_t)recipientCount
{
  return self->_recipientCount;
}

- (int64_t)capabilities
{
  return self->_capabilities;
}

- (BOOL)isBusinessCorrespondence
{
  return self->_businessCorrespondence;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_imageName, 0);
  objc_storeStrong((id *)&self->_contentURL, 0);
  objc_storeStrong((id *)&self->_sender, 0);
  objc_storeStrong((id *)&self->_recipients, 0);
  objc_storeStrong((id *)&self->_displayName, 0);
  objc_storeStrong((id *)&self->_bundleIdentifier, 0);
  objc_storeStrong((id *)&self->_associatedObjectUri, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

- (BOOL)isAvatarImagePossible
{
  _UNNotificationCommunicationContext *v2;
  void *v3;

  v2 = self;
  -[_UNNotificationCommunicationContext bundleIdentifier](self, "bundleIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v2) = -[_UNNotificationCommunicationContext isAvatarImagePossibleForBundleIdentifier:](v2, "isAvatarImagePossibleForBundleIdentifier:", v3);

  return (char)v2;
}

@end
