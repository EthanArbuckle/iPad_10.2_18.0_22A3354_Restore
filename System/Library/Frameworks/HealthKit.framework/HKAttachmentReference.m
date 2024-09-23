@implementation HKAttachmentReference

- (id)_initWithIdentifier:(id)a3 objectIdentifier:(id)a4 attachment:(id)a5 creationDate:(id)a6 metadata:(id)a7
{
  id v13;
  id v14;
  id v15;
  id v16;
  HKAttachmentReference *v17;
  id *p_isa;
  id v20;
  objc_super v21;

  v20 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  v21.receiver = self;
  v21.super_class = (Class)HKAttachmentReference;
  v17 = -[HKAttachmentReference init](&v21, sel_init);
  p_isa = (id *)&v17->super.isa;
  if (v17)
  {
    objc_storeStrong((id *)&v17->_identifier, a3);
    objc_storeStrong(p_isa + 2, a4);
    objc_storeStrong(p_isa + 3, a5);
    objc_storeStrong(p_isa + 4, a6);
    objc_storeStrong(p_isa + 5, a7);
  }

  return p_isa;
}

- (id)copyWithZone:(_NSZone *)a3
{
  return -[HKAttachmentReference _initWithIdentifier:objectIdentifier:attachment:creationDate:metadata:](+[HKAttachmentReference allocWithZone:](HKAttachmentReference, "allocWithZone:", a3), "_initWithIdentifier:objectIdentifier:attachment:creationDate:metadata:", self->_identifier, self->_objectIdentifier, self->_attachment, self->_creationDate, self->_metadata);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  NSUUID *identifier;
  id v5;

  identifier = self->_identifier;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", identifier, CFSTR("Identifier"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_objectIdentifier, CFSTR("ObjectIdentifier"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_attachment, CFSTR("Attachment"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_creationDate, CFSTR("CreationDate"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_metadata, CFSTR("Metadata"));

}

- (HKAttachmentReference)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  HKAttachmentReference *v11;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("Identifier"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("ObjectIdentifier"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("Attachment"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("CreationDate"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99D80], "hk_secureCodingClasses");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v9, CFSTR("Metadata"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = -[HKAttachmentReference _initWithIdentifier:objectIdentifier:attachment:creationDate:metadata:](self, "_initWithIdentifier:objectIdentifier:attachment:creationDate:metadata:", v5, v6, v7, v8, v10);
  return v11;
}

- (NSUUID)identifier
{
  return (NSUUID *)objc_getProperty(self, a2, 8, 1);
}

- (NSString)objectIdentifier
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (HKAttachment)attachment
{
  return (HKAttachment *)objc_getProperty(self, a2, 24, 1);
}

- (NSDate)creationDate
{
  return (NSDate *)objc_getProperty(self, a2, 32, 1);
}

- (NSDictionary)metadata
{
  return (NSDictionary *)objc_getProperty(self, a2, 40, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_metadata, 0);
  objc_storeStrong((id *)&self->_creationDate, 0);
  objc_storeStrong((id *)&self->_attachment, 0);
  objc_storeStrong((id *)&self->_objectIdentifier, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end
