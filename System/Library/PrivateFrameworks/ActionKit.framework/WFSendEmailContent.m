@implementation WFSendEmailContent

- (WFSendEmailContent)initWithCoder:(id)a3
{
  id v4;
  WFSendEmailContent *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  NSArray *toRecipients;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  NSArray *ccRecipients;
  void *v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  NSArray *bccRecipients;
  uint64_t v21;
  NSString *subject;
  uint64_t v23;
  NSString *body;
  void *v25;
  uint64_t v26;
  void *v27;
  uint64_t v28;
  NSArray *attachments;
  WFSendEmailContent *v30;
  objc_super v32;

  v4 = a3;
  v32.receiver = self;
  v32.super_class = (Class)WFSendEmailContent;
  v5 = -[WFSendEmailContent init](&v32, sel_init);
  if (v5)
  {
    v6 = (void *)MEMORY[0x24BDBCF20];
    v7 = objc_opt_class();
    objc_msgSend(v6, "setWithObjects:", v7, objc_opt_class(), 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v8, CFSTR("toRecipients"));
    v9 = objc_claimAutoreleasedReturnValue();
    toRecipients = v5->_toRecipients;
    v5->_toRecipients = (NSArray *)v9;

    v11 = (void *)MEMORY[0x24BDBCF20];
    v12 = objc_opt_class();
    objc_msgSend(v11, "setWithObjects:", v12, objc_opt_class(), 0);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v13, CFSTR("ccRecipients"));
    v14 = objc_claimAutoreleasedReturnValue();
    ccRecipients = v5->_ccRecipients;
    v5->_ccRecipients = (NSArray *)v14;

    v16 = (void *)MEMORY[0x24BDBCF20];
    v17 = objc_opt_class();
    objc_msgSend(v16, "setWithObjects:", v17, objc_opt_class(), 0);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v18, CFSTR("bccRecipients"));
    v19 = objc_claimAutoreleasedReturnValue();
    bccRecipients = v5->_bccRecipients;
    v5->_bccRecipients = (NSArray *)v19;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("subject"));
    v21 = objc_claimAutoreleasedReturnValue();
    subject = v5->_subject;
    v5->_subject = (NSString *)v21;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("body"));
    v23 = objc_claimAutoreleasedReturnValue();
    body = v5->_body;
    v5->_body = (NSString *)v23;

    v5->_isHTML = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("isHTML"));
    v25 = (void *)MEMORY[0x24BDBCF20];
    v26 = objc_opt_class();
    objc_msgSend(v25, "setWithObjects:", v26, objc_opt_class(), 0);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v27, CFSTR("attachments"));
    v28 = objc_claimAutoreleasedReturnValue();
    attachments = v5->_attachments;
    v5->_attachments = (NSArray *)v28;

    v30 = v5;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v4 = a3;
  -[WFSendEmailContent toRecipients](self, "toRecipients");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("toRecipients"));

  -[WFSendEmailContent ccRecipients](self, "ccRecipients");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("ccRecipients"));

  -[WFSendEmailContent bccRecipients](self, "bccRecipients");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("bccRecipients"));

  -[WFSendEmailContent subject](self, "subject");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v8, CFSTR("subject"));

  -[WFSendEmailContent body](self, "body");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v9, CFSTR("body"));

  objc_msgSend(v4, "encodeBool:forKey:", -[WFSendEmailContent isHTML](self, "isHTML"), CFSTR("isHTML"));
  -[WFSendEmailContent attachments](self, "attachments");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v10, CFSTR("attachments"));

}

- (NSArray)toRecipients
{
  return self->_toRecipients;
}

- (void)setToRecipients:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSArray)ccRecipients
{
  return self->_ccRecipients;
}

- (void)setCcRecipients:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSArray)bccRecipients
{
  return self->_bccRecipients;
}

- (void)setBccRecipients:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (NSString)subject
{
  return self->_subject;
}

- (void)setSubject:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (NSString)body
{
  return self->_body;
}

- (void)setBody:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (BOOL)isHTML
{
  return self->_isHTML;
}

- (void)setIsHTML:(BOOL)a3
{
  self->_isHTML = a3;
}

- (NSArray)attachments
{
  return self->_attachments;
}

- (void)setAttachments:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_attachments, 0);
  objc_storeStrong((id *)&self->_body, 0);
  objc_storeStrong((id *)&self->_subject, 0);
  objc_storeStrong((id *)&self->_bccRecipients, 0);
  objc_storeStrong((id *)&self->_ccRecipients, 0);
  objc_storeStrong((id *)&self->_toRecipients, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
