@implementation HKClinicalDocumentIndexingResult

- (HKClinicalDocumentIndexingResult)initWithAttachmentIdentifiers:(id)a3
{
  id v4;
  HKClinicalDocumentIndexingResult *v5;
  uint64_t v6;
  NSArray *attachmentIdentifiers;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)HKClinicalDocumentIndexingResult;
  v5 = -[HKClinicalDocumentIndexingResult init](&v9, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    attachmentIdentifiers = v5->_attachmentIdentifiers;
    v5->_attachmentIdentifiers = (NSArray *)v6;

  }
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  HKClinicalDocumentIndexingResult *v4;
  HKClinicalDocumentIndexingResult *v5;
  HKClinicalDocumentIndexingResult *v6;
  NSArray *attachmentIdentifiers;
  NSArray *v8;
  void *v9;
  NSArray *v10;
  void *v11;
  char v12;

  v4 = (HKClinicalDocumentIndexingResult *)a3;
  v5 = v4;
  if (self == v4)
  {
    v12 = 1;
  }
  else
  {
    v6 = v4;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      attachmentIdentifiers = self->_attachmentIdentifiers;
      -[HKClinicalDocumentIndexingResult attachmentIdentifiers](v6, "attachmentIdentifiers");
      v8 = (NSArray *)objc_claimAutoreleasedReturnValue();
      if (attachmentIdentifiers == v8)
      {
        v12 = 1;
      }
      else
      {
        -[HKClinicalDocumentIndexingResult attachmentIdentifiers](v6, "attachmentIdentifiers");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        if (v9)
        {
          v10 = self->_attachmentIdentifiers;
          -[HKClinicalDocumentIndexingResult attachmentIdentifiers](v6, "attachmentIdentifiers");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          v12 = -[NSArray isEqualToArray:](v10, "isEqualToArray:", v11);

        }
        else
        {
          v12 = 0;
        }

      }
    }
    else
    {
      v12 = 0;
    }

  }
  return v12;
}

- (unint64_t)hash
{
  return -[NSArray hash](self->_attachmentIdentifiers, "hash");
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  objc_msgSend(a3, "encodeObject:forKey:", self->_attachmentIdentifiers, CFSTR("AttachmentIdentifiers"));
}

- (HKClinicalDocumentIndexingResult)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  HKClinicalDocumentIndexingResult *v6;

  v4 = a3;
  objc_msgSend(v4, "decodeArrayOfObjectsOfClass:forKey:", objc_opt_class(), CFSTR("AttachmentIdentifiers"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    self = -[HKClinicalDocumentIndexingResult initWithAttachmentIdentifiers:](self, "initWithAttachmentIdentifiers:", v5);
    v6 = self;
  }
  else
  {
    objc_msgSend(v4, "hrs_failWithCocoaValueNotFoundError");
    v6 = 0;
  }

  return v6;
}

- (NSArray)attachmentIdentifiers
{
  return self->_attachmentIdentifiers;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_attachmentIdentifiers, 0);
}

@end
