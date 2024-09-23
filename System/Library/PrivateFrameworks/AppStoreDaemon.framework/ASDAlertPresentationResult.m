@implementation ASDAlertPresentationResult

- (ASDAlertPresentationResult)initWithError:(id)a3
{
  id v5;
  ASDAlertPresentationResult *v6;
  ASDAlertPresentationResult *v7;
  NSUUID *selectedActionIdentifier;
  objc_super v10;

  v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)ASDAlertPresentationResult;
  v6 = -[ASDAlertPresentationResult init](&v10, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_error, a3);
    selectedActionIdentifier = v7->_selectedActionIdentifier;
    v7->_selectedActionIdentifier = 0;

  }
  return v7;
}

- (ASDAlertPresentationResult)initWithSelectedActionIdentifier:(id)a3
{
  id v5;
  ASDAlertPresentationResult *v6;
  ASDAlertPresentationResult *v7;
  NSError *error;
  objc_super v10;

  v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)ASDAlertPresentationResult;
  v6 = -[ASDAlertPresentationResult init](&v10, sel_init);
  v7 = v6;
  if (v6)
  {
    error = v6->_error;
    v6->_error = 0;

    objc_storeStrong((id *)&v7->_selectedActionIdentifier, a3);
  }

  return v7;
}

- (BOOL)isSelectedAction:(id)a3
{
  NSUUID *selectedActionIdentifier;
  void *v5;

  if (self->_error)
    return 0;
  selectedActionIdentifier = self->_selectedActionIdentifier;
  objc_msgSend(a3, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(selectedActionIdentifier) = -[NSUUID isEqual:](selectedActionIdentifier, "isEqual:", v5);

  return (char)selectedActionIdentifier;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (ASDAlertPresentationResult)initWithCoder:(id)a3
{
  id v4;
  ASDAlertPresentationResult *v5;
  uint64_t v6;
  NSError *error;
  uint64_t v8;
  NSUUID *selectedActionIdentifier;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)ASDAlertPresentationResult;
  v5 = -[ASDAlertPresentationResult init](&v11, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("error"));
    v6 = objc_claimAutoreleasedReturnValue();
    error = v5->_error;
    v5->_error = (NSError *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("selectedActionIdentifier"));
    v8 = objc_claimAutoreleasedReturnValue();
    selectedActionIdentifier = v5->_selectedActionIdentifier;
    v5->_selectedActionIdentifier = (NSUUID *)v8;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  NSError *error;
  id v5;

  error = self->_error;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", error, CFSTR("error"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_selectedActionIdentifier, CFSTR("selectedActionIdentifier"));

}

- (NSError)error
{
  return self->_error;
}

- (NSUUID)selectedActionIdentifier
{
  return self->_selectedActionIdentifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_selectedActionIdentifier, 0);
  objc_storeStrong((id *)&self->_error, 0);
}

@end
