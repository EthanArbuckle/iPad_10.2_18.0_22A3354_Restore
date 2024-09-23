@implementation BBMutableCommunicationContext

- (void)setIdentifier:(id)a3
{
  NSString *v4;
  NSString *identifier;

  v4 = (NSString *)objc_msgSend(a3, "copy");
  identifier = self->super._identifier;
  self->super._identifier = v4;

}

- (void)setAssociatedObjectUri:(id)a3
{
  NSString *v4;
  NSString *associatedObjectUri;

  v4 = (NSString *)objc_msgSend(a3, "copy");
  associatedObjectUri = self->super._associatedObjectUri;
  self->super._associatedObjectUri = v4;

}

- (void)setDisplayName:(id)a3
{
  NSString *v4;
  NSString *displayName;

  v4 = (NSString *)objc_msgSend(a3, "copy");
  displayName = self->super._displayName;
  self->super._displayName = v4;

}

- (void)setSender:(id)a3
{
  BBContact *v4;
  BBContact *sender;

  v4 = (BBContact *)objc_msgSend(a3, "copy");
  sender = self->super._sender;
  self->super._sender = v4;

}

- (void)setRecipients:(id)a3
{
  NSArray *v4;
  NSArray *recipients;

  v4 = (NSArray *)objc_msgSend(a3, "copy");
  recipients = self->super._recipients;
  self->super._recipients = v4;

}

- (void)setContentURL:(id)a3
{
  NSURL *v4;
  NSURL *contentURL;

  v4 = (NSURL *)objc_msgSend(a3, "copy");
  contentURL = self->super._contentURL;
  self->super._contentURL = v4;

}

- (void)setImageName:(id)a3
{
  NSString *v4;
  NSString *imageName;

  v4 = (NSString *)objc_msgSend(a3, "copy");
  imageName = self->super._imageName;
  self->super._imageName = v4;

}

- (void)setSystemImage:(BOOL)a3
{
  self->super._systemImage = a3;
}

- (void)setMentionsCurrentUser:(BOOL)a3
{
  self->super._mentionsCurrentUser = a3;
}

- (void)setNotifyRecipientAnyway:(BOOL)a3
{
  self->super._notifyRecipientAnyway = a3;
}

- (void)setReplyToCurrentUser:(BOOL)a3
{
  self->super._replyToCurrentUser = a3;
}

- (void)setRecipientCount:(unint64_t)a3
{
  self->super._recipientCount = a3;
}

- (void)setCapabilities:(int64_t)a3
{
  self->super._capabilities = a3;
}

- (void)setBusinessCorrespondence:(BOOL)a3
{
  self->super._businessCorrespondence = a3;
}

- (id)copyWithZone:(_NSZone *)a3
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
  BBCommunicationContext *v22;

  v22 = +[BBCommunicationContext allocWithZone:](BBCommunicationContext, "allocWithZone:", a3);
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

@end
