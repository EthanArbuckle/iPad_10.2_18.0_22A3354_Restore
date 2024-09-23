@implementation BCSContactData

- (BCSContactData)initWithContact:(id)a3
{
  id v4;
  BCSContactData *v5;
  uint64_t v6;
  CNContact *contact;
  BCSContactData *v8;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)BCSContactData;
  v5 = -[BCSContactData init](&v10, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    contact = v5->_contact;
    v5->_contact = (CNContact *)v6;

    v8 = v5;
  }

  return v5;
}

- (int64_t)type
{
  return 2;
}

- (NSString)extraPreviewText
{
  return 0;
}

- (BCSContactData)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  BCSContactData *v6;

  v4 = a3;
  objc_msgSend(v4, "_bcs_strictlyDecodeObjectOfClass:forKey:", getCNContactClass(), CFSTR("contact"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = -[BCSContactData initWithContact:](self, "initWithContact:", v5);
  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  objc_msgSend(a3, "encodeObject:forKey:", self->_contact, CFSTR("contact"));
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CNContact)contact
{
  return self->_contact;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contact, 0);
}

@end
