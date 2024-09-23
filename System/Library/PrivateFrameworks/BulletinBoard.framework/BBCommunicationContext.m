@implementation BBCommunicationContext

+ (id)communicationContextWithIdentifier:(id)a3 associatedObjectUri:(id)a4 displayName:(id)a5 sender:(id)a6 recipients:(id)a7 contentURL:(id)a8 imageName:(id)a9 systemImage:(BOOL)a10 mentionsCurrentUser:(BOOL)a11 notifyRecipientAnyway:(BOOL)a12 replyToCurrentUser:(BOOL)a13 recipientCount:(unint64_t)a14
{
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  id v25;
  id v26;
  void *v27;
  uint64_t v29;
  uint64_t v30;

  v20 = a9;
  v21 = a8;
  v22 = a7;
  v23 = a6;
  v24 = a5;
  v25 = a4;
  v26 = a3;
  LOBYTE(v30) = 0;
  WORD1(v29) = __PAIR16__(a13, a12);
  LOWORD(v29) = __PAIR16__(a11, a10);
  v27 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "_initWithIdentifier:bundleIdentifier:associatedObjectUri:displayName:sender:recipients:contentURL:imageName:systemImage:mentionsCurrentUser:notifyRecipientAnyway:replyToCurrentUser:recipientCount:capabilities:businessCorrespondence:", v26, 0, v25, v24, v23, v22, v21, v20, v29, a14, 0, v30);

  return v27;
}

- (id)_initWithIdentifier:(id)a3 bundleIdentifier:(id)a4 associatedObjectUri:(id)a5 displayName:(id)a6 sender:(id)a7 recipients:(id)a8 contentURL:(id)a9 imageName:(id)a10 systemImage:(BOOL)a11 mentionsCurrentUser:(BOOL)a12 notifyRecipientAnyway:(BOOL)a13 replyToCurrentUser:(BOOL)a14 recipientCount:(unint64_t)a15 capabilities:(int64_t)a16 businessCorrespondence:(BOOL)a17
{
  id v23;
  id v24;
  id v25;
  id v26;
  id v27;
  id v28;
  id v29;
  id v30;
  BBCommunicationContext *v31;
  uint64_t v32;
  NSString *identifier;
  uint64_t v34;
  NSString *bundleIdentifier;
  uint64_t v36;
  NSString *associatedObjectUri;
  uint64_t v38;
  NSString *displayName;
  uint64_t v40;
  NSArray *recipients;
  uint64_t v42;
  BBContact *sender;
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
  v49.super_class = (Class)BBCommunicationContext;
  v31 = -[BBCommunicationContext init](&v49, sel_init);
  if (v31)
  {
    v32 = objc_msgSend(v23, "copy");
    identifier = v31->_identifier;
    v31->_identifier = (NSString *)v32;

    v34 = objc_msgSend(v24, "copy");
    bundleIdentifier = v31->_bundleIdentifier;
    v31->_bundleIdentifier = (NSString *)v34;

    v36 = objc_msgSend(v25, "copy");
    associatedObjectUri = v31->_associatedObjectUri;
    v31->_associatedObjectUri = (NSString *)v36;

    v38 = objc_msgSend(v26, "copy");
    displayName = v31->_displayName;
    v31->_displayName = (NSString *)v38;

    v40 = objc_msgSend(v28, "copy");
    recipients = v31->_recipients;
    v31->_recipients = (NSArray *)v40;

    v42 = objc_msgSend(v27, "copy");
    sender = v31->_sender;
    v31->_sender = (BBContact *)v42;

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
  int v10;
  void *v11;
  int v12;
  void *v13;
  int v14;
  void *v15;
  int v16;
  void *v17;
  int v18;
  void *v19;
  int v20;
  void *v21;
  int v22;
  int systemImage;
  int mentionsCurrentUser;
  int notifyRecipientAnyway;
  int replyToCurrentUser;
  unint64_t recipientCount;
  int64_t capabilities;
  int businessCorrespondence;
  BOOL v30;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v6 = 0;
LABEL_20:
      v30 = 0;
      goto LABEL_21;
    }
  }
  v5 = v4;
  v6 = v5;
  if (!v5)
    goto LABEL_20;
  objc_msgSend(v5, "identifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = BSEqualStrings();

  if (!v8)
    goto LABEL_20;
  objc_msgSend(v6, "bundleIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = BSEqualStrings();

  if (!v10)
    goto LABEL_20;
  objc_msgSend(v6, "associatedObjectUri");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = BSEqualStrings();

  if (!v12)
    goto LABEL_20;
  objc_msgSend(v6, "displayName");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = BSEqualStrings();

  if (!v14)
    goto LABEL_20;
  objc_msgSend(v6, "sender");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = BSEqualObjects();

  if (!v16)
    goto LABEL_20;
  objc_msgSend(v6, "recipients");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = BSEqualArrays();

  if (!v18)
    goto LABEL_20;
  objc_msgSend(v6, "contentURL");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = BSEqualObjects();

  if (!v20)
    goto LABEL_20;
  objc_msgSend(v6, "imageName");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = BSEqualStrings();

  if (!v22)
    goto LABEL_20;
  systemImage = self->_systemImage;
  if (systemImage != objc_msgSend(v6, "systemImage"))
    goto LABEL_20;
  mentionsCurrentUser = self->_mentionsCurrentUser;
  if (mentionsCurrentUser != objc_msgSend(v6, "mentionsCurrentUser"))
    goto LABEL_20;
  notifyRecipientAnyway = self->_notifyRecipientAnyway;
  if (notifyRecipientAnyway != objc_msgSend(v6, "notifyRecipientAnyway"))
    goto LABEL_20;
  replyToCurrentUser = self->_replyToCurrentUser;
  if (replyToCurrentUser != objc_msgSend(v6, "isReplyToCurrentUser"))
    goto LABEL_20;
  recipientCount = self->_recipientCount;
  if (recipientCount != objc_msgSend(v6, "recipientCount"))
    goto LABEL_20;
  capabilities = self->_capabilities;
  if (capabilities != objc_msgSend(v6, "capabilities"))
    goto LABEL_20;
  businessCorrespondence = self->_businessCorrespondence;
  v30 = businessCorrespondence == objc_msgSend(v6, "isBusinessCorrespondence");
LABEL_21:

  return v30;
}

- (unint64_t)hash
{
  NSUInteger v3;
  NSUInteger v4;
  NSUInteger v5;
  NSUInteger v6;
  uint64_t v7;
  unint64_t v8;
  uint64_t v9;

  v3 = -[NSString hash](self->_identifier, "hash");
  v4 = -[NSString hash](self->_bundleIdentifier, "hash") ^ v3;
  v5 = -[NSString hash](self->_associatedObjectUri, "hash");
  v6 = v4 ^ v5 ^ -[NSString hash](self->_displayName, "hash");
  v7 = -[NSArray hash](self->_recipients, "hash");
  v8 = v7 ^ -[BBContact hash](self->_sender, "hash");
  v9 = v6 ^ v8 ^ -[NSURL hash](self->_contentURL, "hash");
  return v9 ^ -[NSString hash](self->_imageName, "hash") ^ self->_systemImage ^ self->_mentionsCurrentUser ^ self->_notifyRecipientAnyway ^ self->_replyToCurrentUser ^ self->_recipientCount ^ self->_capabilities ^ self->_businessCorrespondence;
}

- (id)description
{
  return (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("<%@: %p; identifier: %@, bundleIdentifier: %@, associatedObjectUri: %@, displayName: %@, sender: %@, recipients: %@, contentURL: %@, imageName: %@, systemImage: %d, mentionsCurrentUser: %d, notifyRecipientAnyway: %d, replyToCurrentUser: %d, recipientCount: %lu>, capabilities: %lu, businessCorrespondence: %d"),
               objc_opt_class(),
               self,
               self->_identifier,
               self->_bundleIdentifier,
               self->_associatedObjectUri,
               self->_displayName,
               self->_sender,
               self->_recipients,
               self->_contentURL,
               self->_imageName,
               self->_systemImage,
               self->_mentionsCurrentUser,
               self->_notifyRecipientAnyway,
               self->_replyToCurrentUser,
               self->_recipientCount,
               self->_capabilities,
               self->_businessCorrespondence);
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
  BBMutableCommunicationContext *v22;

  v22 = +[BBMutableCommunicationContext allocWithZone:](BBMutableCommunicationContext, "allocWithZone:", a3);
  -[BBCommunicationContext identifier](self, "identifier");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  -[BBCommunicationContext bundleIdentifier](self, "bundleIdentifier");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[BBCommunicationContext associatedObjectUri](self, "associatedObjectUri");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[BBCommunicationContext displayName](self, "displayName");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[BBCommunicationContext sender](self, "sender");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[BBCommunicationContext recipients](self, "recipients");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[BBCommunicationContext contentURL](self, "contentURL");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[BBCommunicationContext imageName](self, "imageName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[BBCommunicationContext systemImage](self, "systemImage");
  v8 = -[BBCommunicationContext mentionsCurrentUser](self, "mentionsCurrentUser");
  v9 = -[BBCommunicationContext notifyRecipientAnyway](self, "notifyRecipientAnyway");
  v10 = -[BBCommunicationContext isReplyToCurrentUser](self, "isReplyToCurrentUser");
  v11 = -[BBCommunicationContext recipientCount](self, "recipientCount");
  v12 = -[BBCommunicationContext capabilities](self, "capabilities");
  LOBYTE(v16) = -[BBCommunicationContext isBusinessCorrespondence](self, "isBusinessCorrespondence");
  BYTE3(v15) = v10;
  BYTE2(v15) = v9;
  BYTE1(v15) = v8;
  LOBYTE(v15) = v7;
  v13 = -[BBCommunicationContext _initWithIdentifier:bundleIdentifier:associatedObjectUri:displayName:sender:recipients:contentURL:imageName:systemImage:mentionsCurrentUser:notifyRecipientAnyway:replyToCurrentUser:recipientCount:capabilities:businessCorrespondence:](v22, "_initWithIdentifier:bundleIdentifier:associatedObjectUri:displayName:sender:recipients:contentURL:imageName:systemImage:mentionsCurrentUser:notifyRecipientAnyway:replyToCurrentUser:recipientCount:capabilities:businessCorrespondence:", v21, v20, v19, v18, v17, v4, v5, v6, v15, v11, v12, v16);

  return v13;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *identifier;
  id v5;

  identifier = self->_identifier;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", identifier, CFSTR("identifier"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_bundleIdentifier, CFSTR("bundleIdentifier"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_associatedObjectUri, CFSTR("associatedObjectUri"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_displayName, CFSTR("displayName"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_sender, CFSTR("sender"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_recipients, CFSTR("recipients"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_contentURL, CFSTR("contentURL"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_imageName, CFSTR("imageName"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_systemImage, CFSTR("systemImage"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_mentionsCurrentUser, CFSTR("mentionsCurrentUser"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_notifyRecipientAnyway, CFSTR("notifyRecipientAnyway"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_replyToCurrentUser, CFSTR("replyToCurrentUser"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_recipientCount, CFSTR("recipientCount"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_capabilities, CFSTR("capabilities"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_businessCorrespondence, CFSTR("businessCorrespondence"));

}

- (BBCommunicationContext)initWithCoder:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  char v7;
  char v8;
  char v9;
  char v10;
  uint64_t v11;
  uint64_t v12;
  char v13;
  BBCommunicationContext *v14;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;

  v3 = a3;
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("identifier"));
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("bundleIdentifier"));
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("associatedObjectUri"));
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("displayName"));
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("sender"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  BBAllowedClasses();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeObjectOfClasses:forKey:", v4, CFSTR("recipients"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("contentURL"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("imageName"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v3, "decodeBoolForKey:", CFSTR("systemImage"));
  v8 = objc_msgSend(v3, "decodeBoolForKey:", CFSTR("mentionsCurrentUser"));
  v9 = objc_msgSend(v3, "decodeBoolForKey:", CFSTR("notifyRecipientAnyway"));
  v10 = objc_msgSend(v3, "decodeBoolForKey:", CFSTR("replyToCurrentUser"));
  v11 = objc_msgSend(v3, "decodeIntegerForKey:", CFSTR("recipientCount"));
  v12 = objc_msgSend(v3, "decodeIntegerForKey:", CFSTR("capabilities"));
  v13 = objc_msgSend(v3, "decodeBoolForKey:", CFSTR("businessCorrespondence"));

  LOBYTE(v17) = v13;
  BYTE3(v16) = v10;
  BYTE2(v16) = v9;
  BYTE1(v16) = v8;
  LOBYTE(v16) = v7;
  v14 = -[BBCommunicationContext _initWithIdentifier:bundleIdentifier:associatedObjectUri:displayName:sender:recipients:contentURL:imageName:systemImage:mentionsCurrentUser:notifyRecipientAnyway:replyToCurrentUser:recipientCount:capabilities:businessCorrespondence:](self, "_initWithIdentifier:bundleIdentifier:associatedObjectUri:displayName:sender:recipients:contentURL:imageName:systemImage:mentionsCurrentUser:notifyRecipientAnyway:replyToCurrentUser:recipientCount:capabilities:businessCorrespondence:", v23, v22, v21, v20, v19, v18, v5, v6, v16, v11, v12, v17);

  return v14;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (NSString)bundleIdentifier
{
  return self->_bundleIdentifier;
}

- (NSString)associatedObjectUri
{
  return self->_associatedObjectUri;
}

- (NSString)displayName
{
  return self->_displayName;
}

- (BBContact)sender
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

- (BOOL)systemImage
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
  objc_storeStrong((id *)&self->_bundleIdentifier, 0);
  objc_storeStrong((id *)&self->_imageName, 0);
  objc_storeStrong((id *)&self->_contentURL, 0);
  objc_storeStrong((id *)&self->_sender, 0);
  objc_storeStrong((id *)&self->_recipients, 0);
  objc_storeStrong((id *)&self->_displayName, 0);
  objc_storeStrong((id *)&self->_associatedObjectUri, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

+ (id)communicationContextWithIdentifier:(id)a3 bundleIdentifier:(id)a4 associatedObjectUri:(id)a5 displayName:(id)a6 sender:(id)a7 recipients:(id)a8 contentURL:(id)a9
{
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  void *v22;
  uint64_t v24;
  uint64_t v25;

  v15 = a9;
  v16 = a8;
  v17 = a7;
  v18 = a6;
  v19 = a5;
  v20 = a4;
  v21 = a3;
  LOBYTE(v25) = 0;
  LODWORD(v24) = 0;
  v22 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "_initWithIdentifier:bundleIdentifier:associatedObjectUri:displayName:sender:recipients:contentURL:imageName:systemImage:mentionsCurrentUser:notifyRecipientAnyway:replyToCurrentUser:recipientCount:capabilities:businessCorrespondence:", v21, v20, v19, v18, v17, v16, v15, 0, v24, 0, 0, v25);

  return v22;
}

+ (id)communicationContextWithIdentifier:(id)a3 bundleIdentifier:(id)a4 associatedObjectUri:(id)a5 displayName:(id)a6 sender:(id)a7 recipients:(id)a8 contentURL:(id)a9 mentionsCurrentUser:(BOOL)a10 notifyRecipientAnyway:(BOOL)a11 replyToCurrentUser:(BOOL)a12 recipientCount:(unint64_t)a13
{
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  id v25;
  void *v26;
  uint64_t v28;
  uint64_t v29;

  v19 = a9;
  v20 = a8;
  v21 = a7;
  v22 = a6;
  v23 = a5;
  v24 = a4;
  v25 = a3;
  LOBYTE(v29) = 0;
  WORD1(v28) = __PAIR16__(a12, a11);
  BYTE1(v28) = a10;
  LOBYTE(v28) = 0;
  v26 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "_initWithIdentifier:bundleIdentifier:associatedObjectUri:displayName:sender:recipients:contentURL:imageName:systemImage:mentionsCurrentUser:notifyRecipientAnyway:replyToCurrentUser:recipientCount:capabilities:businessCorrespondence:", v25, v24, v23, v22, v21, v20, v19, 0, v28, a13, 0, v29);

  return v26;
}

+ (id)communicationContextWithIdentifier:(id)a3 bundleIdentifier:(id)a4 associatedObjectUri:(id)a5 displayName:(id)a6 sender:(id)a7 recipients:(id)a8 contentURL:(id)a9 imageName:(id)a10 systemImage:(BOOL)a11 mentionsCurrentUser:(BOOL)a12 notifyRecipientAnyway:(BOOL)a13 replyToCurrentUser:(BOOL)a14 recipientCount:(unint64_t)a15
{
  id v21;
  id v22;
  id v23;
  id v24;
  id v25;
  id v26;
  id v27;
  id v28;
  void *v29;
  uint64_t v31;
  uint64_t v32;

  v21 = a10;
  v22 = a9;
  v23 = a8;
  v24 = a7;
  v25 = a6;
  v26 = a5;
  v27 = a4;
  v28 = a3;
  LOBYTE(v32) = 0;
  WORD1(v31) = __PAIR16__(a14, a13);
  LOWORD(v31) = __PAIR16__(a12, a11);
  v29 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "_initWithIdentifier:bundleIdentifier:associatedObjectUri:displayName:sender:recipients:contentURL:imageName:systemImage:mentionsCurrentUser:notifyRecipientAnyway:replyToCurrentUser:recipientCount:capabilities:businessCorrespondence:", v28, v27, v26, v25, v24, v23, v22, v21, v31, a15, 0, v32);

  return v29;
}

@end
