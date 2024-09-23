@implementation DCPresentmentRequestedElement

- (DCPresentmentRequestedElement)initWithElementIdentifier:(id)a3 intentToRetain:(unint64_t)a4
{
  id v5;
  DCPresentmentRequestedElement *v6;
  uint64_t v7;
  NSString *elementIdentifier;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)DCPresentmentRequestedElement;
  v5 = a3;
  v6 = -[DCPresentmentRequestedElement init](&v10, sel_init);
  v7 = objc_msgSend(v5, "copy", v10.receiver, v10.super_class);

  elementIdentifier = v6->_elementIdentifier;
  v6->_elementIdentifier = (NSString *)v7;

  v6->_intentToRetain = a4;
  return v6;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *elementIdentifier;
  id v5;

  elementIdentifier = self->_elementIdentifier;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", elementIdentifier, 0x24C307888);
  objc_msgSend(v5, "encodeInteger:forKey:", self->_intentToRetain, 0x24C3078A8);

}

- (DCPresentmentRequestedElement)initWithCoder:(id)a3
{
  id v3;
  DCPresentmentRequestedElement *v4;
  uint64_t v5;
  NSString *elementIdentifier;
  uint64_t v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)DCPresentmentRequestedElement;
  v3 = a3;
  v4 = -[DCPresentmentRequestedElement init](&v9, sel_init);
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), 0x24C307888, v9.receiver, v9.super_class);
  v5 = objc_claimAutoreleasedReturnValue();
  elementIdentifier = v4->_elementIdentifier;
  v4->_elementIdentifier = (NSString *)v5;

  v7 = objc_msgSend(v3, "decodeIntegerForKey:", 0x24C3078A8);
  v4->_intentToRetain = v7;
  return v4;
}

- (id)description
{
  void *v2;
  NSString *elementIdentifier;
  void *v4;
  void *v5;

  v2 = (void *)MEMORY[0x24BDD17C8];
  elementIdentifier = self->_elementIdentifier;
  DCPresentmentElementRetentionIntentToString(self->_intentToRetain);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringWithFormat:", CFSTR("DCPresentmentRequestedElement elementIdentifier = %@, intentToRetain = %@"), elementIdentifier, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (NSString)elementIdentifier
{
  return self->_elementIdentifier;
}

- (unint64_t)intentToRetain
{
  return self->_intentToRetain;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_elementIdentifier, 0);
}

@end
