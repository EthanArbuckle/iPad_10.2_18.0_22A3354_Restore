@implementation WFContactFieldEntry

- (WFContactFieldEntry)initWithContact:(id)a3
{
  id v6;
  WFContactFieldEntry *v7;
  WFContactFieldEntry *v8;
  WFContactFieldEntry *v9;
  void *v11;
  objc_super v12;

  v6 = a3;
  if (!v6)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("WFContactFieldEntry.m"), 20, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("contact"));

  }
  v12.receiver = self;
  v12.super_class = (Class)WFContactFieldEntry;
  v7 = -[WFContactFieldEntry init](&v12, sel_init);
  v8 = v7;
  if (v7)
  {
    objc_storeStrong((id *)&v7->_contact, a3);
    v8->_type = 0;
    v9 = v8;
  }

  return v8;
}

- (WFContactFieldEntry)initWithPhoneNumber:(id)a3
{
  id v6;
  WFContactFieldEntry *v7;
  WFContactFieldEntry *v8;
  WFContactFieldEntry *v9;
  void *v11;
  objc_super v12;

  v6 = a3;
  if (!v6)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("WFContactFieldEntry.m"), 32, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("phoneNumber"));

  }
  v12.receiver = self;
  v12.super_class = (Class)WFContactFieldEntry;
  v7 = -[WFContactFieldEntry init](&v12, sel_init);
  v8 = v7;
  if (v7)
  {
    objc_storeStrong((id *)&v7->_phoneNumber, a3);
    v8->_type = 1;
    v9 = v8;
  }

  return v8;
}

- (WFContactFieldEntry)initWithEmailAddress:(id)a3
{
  id v6;
  WFContactFieldEntry *v7;
  WFContactFieldEntry *v8;
  WFContactFieldEntry *v9;
  void *v11;
  objc_super v12;

  v6 = a3;
  if (!v6)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("WFContactFieldEntry.m"), 44, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("emailAddress"));

  }
  v12.receiver = self;
  v12.super_class = (Class)WFContactFieldEntry;
  v7 = -[WFContactFieldEntry init](&v12, sel_init);
  v8 = v7;
  if (v7)
  {
    objc_storeStrong((id *)&v7->_emailAddress, a3);
    v8->_type = 2;
    v9 = v8;
  }

  return v8;
}

- (WFContactFieldEntry)initWithCustomHandle:(id)a3
{
  id v5;
  WFContactFieldEntry *v6;
  uint64_t v7;
  NSString *customHandle;
  WFContactFieldEntry *v9;
  void *v11;
  objc_super v12;

  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("WFContactFieldEntry.m"), 56, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("customHandle"));

  }
  v12.receiver = self;
  v12.super_class = (Class)WFContactFieldEntry;
  v6 = -[WFContactFieldEntry init](&v12, sel_init);
  if (v6)
  {
    v7 = objc_msgSend(v5, "copy");
    customHandle = v6->_customHandle;
    v6->_customHandle = (NSString *)v7;

    v6->_type = 3;
    v9 = v6;
  }

  return v6;
}

- (WFContactFieldEntry)initWithMessageGroup:(id)a3
{
  id v6;
  WFContactFieldEntry *v7;
  WFContactFieldEntry *v8;
  WFContactFieldEntry *v9;
  void *v11;
  objc_super v12;

  v6 = a3;
  if (!v6)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("WFContactFieldEntry.m"), 68, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("messageGroup"));

  }
  v12.receiver = self;
  v12.super_class = (Class)WFContactFieldEntry;
  v7 = -[WFContactFieldEntry init](&v12, sel_init);
  v8 = v7;
  if (v7)
  {
    objc_storeStrong((id *)&v7->_messageGroup, a3);
    v8->_type = 4;
    v9 = v8;
  }

  return v8;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)WFContactFieldEntry;
  -[WFContactFieldEntry description](&v7, sel_description);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFContactFieldEntry underlyingObject](self, "underlyingObject");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringByAppendingFormat:", CFSTR(": %@"), v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)underlyingObject
{
  switch(self->_type)
  {
    case 0:
      -[WFContactFieldEntry contact](self, "contact");
      self = (WFContactFieldEntry *)objc_claimAutoreleasedReturnValue();
      break;
    case 1:
      -[WFContactFieldEntry phoneNumber](self, "phoneNumber");
      self = (WFContactFieldEntry *)objc_claimAutoreleasedReturnValue();
      break;
    case 2:
      -[WFContactFieldEntry emailAddress](self, "emailAddress");
      self = (WFContactFieldEntry *)objc_claimAutoreleasedReturnValue();
      break;
    case 3:
      -[WFContactFieldEntry customHandle](self, "customHandle");
      self = (WFContactFieldEntry *)objc_claimAutoreleasedReturnValue();
      break;
    case 4:
      -[WFContactFieldEntry messageGroup](self, "messageGroup");
      self = (WFContactFieldEntry *)objc_claimAutoreleasedReturnValue();
      break;
    default:
      return self;
  }
  return self;
}

- (unint64_t)hash
{
  int64_t v3;
  void *v4;
  unint64_t v5;

  v3 = -[WFContactFieldEntry type](self, "type");
  -[WFContactFieldEntry underlyingObject](self, "underlyingObject");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v3 ^ 0xA700 ^ objc_msgSend(v4, "hash");

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  WFContactFieldEntry *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  char v8;

  v4 = (WFContactFieldEntry *)a3;
  if (v4 == self)
  {
    v8 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0
      && (v5 = -[WFContactFieldEntry type](v4, "type"), v5 == -[WFContactFieldEntry type](self, "type")))
    {
      -[WFContactFieldEntry underlyingObject](v4, "underlyingObject");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[WFContactFieldEntry underlyingObject](self, "underlyingObject");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v6, "isEqual:", v7);

    }
    else
    {
      v8 = 0;
    }
  }

  return v8;
}

- (NSString)wfName
{
  void *v2;
  uint64_t v3;
  void *v4;

  switch(self->_type)
  {
    case 0:
      -[WFContactFieldEntry contact](self, "contact");
      v2 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v2, "wfName");
      v3 = objc_claimAutoreleasedReturnValue();
      goto LABEL_8;
    case 1:
      -[WFContactFieldEntry phoneNumber](self, "phoneNumber");
      v2 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v2, "formattedPhoneNumber");
      v3 = objc_claimAutoreleasedReturnValue();
      goto LABEL_8;
    case 2:
      -[WFContactFieldEntry emailAddress](self, "emailAddress");
      v2 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v2, "address");
      v3 = objc_claimAutoreleasedReturnValue();
      goto LABEL_8;
    case 3:
      -[WFContactFieldEntry customHandle](self, "customHandle");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      return (NSString *)v4;
    case 4:
      -[WFContactFieldEntry messageGroup](self, "messageGroup");
      v2 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v2, "name");
      v3 = objc_claimAutoreleasedReturnValue();
LABEL_8:
      v4 = (void *)v3;

      break;
    default:
      v4 = 0;
      break;
  }
  return (NSString *)v4;
}

- (WFContactFieldEntry)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  WFContactFieldEntry *v6;
  WFContactFieldEntry *v7;

  v4 = a3;
  switch(objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("type")))
  {
    case 0:
      objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("contact"));
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = -[WFContactFieldEntry initWithContact:](self, "initWithContact:", v5);
      goto LABEL_8;
    case 1:
      objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("phoneNumber"));
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = -[WFContactFieldEntry initWithPhoneNumber:](self, "initWithPhoneNumber:", v5);
      goto LABEL_8;
    case 2:
      objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("emailAddress"));
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = -[WFContactFieldEntry initWithEmailAddress:](self, "initWithEmailAddress:", v5);
      goto LABEL_8;
    case 3:
      objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("customHandle"));
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = -[WFContactFieldEntry initWithCustomHandle:](self, "initWithCustomHandle:", v5);
      goto LABEL_8;
    case 4:
      objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("messageGroup"));
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = -[WFContactFieldEntry initWithMessageGroup:](self, "initWithMessageGroup:", v5);
LABEL_8:
      self = v6;

      v7 = self;
      break;
    default:
      v7 = 0;
      break;
  }

  return v7;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  const __CFString *v5;
  id v6;

  v6 = a3;
  objc_msgSend(v6, "encodeInteger:forKey:", -[WFContactFieldEntry type](self, "type"), CFSTR("type"));
  switch(-[WFContactFieldEntry type](self, "type"))
  {
    case 0:
      -[WFContactFieldEntry contact](self, "contact");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = CFSTR("contact");
      goto LABEL_7;
    case 1:
      -[WFContactFieldEntry phoneNumber](self, "phoneNumber");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = CFSTR("phoneNumber");
      goto LABEL_7;
    case 2:
      -[WFContactFieldEntry emailAddress](self, "emailAddress");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = CFSTR("emailAddress");
      goto LABEL_7;
    case 3:
      -[WFContactFieldEntry customHandle](self, "customHandle");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = CFSTR("customHandle");
      goto LABEL_7;
    case 4:
      -[WFContactFieldEntry messageGroup](self, "messageGroup");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = CFSTR("messageGroup");
LABEL_7:
      objc_msgSend(v6, "encodeObject:forKey:", v4, v5);

      break;
    default:
      break;
  }

}

- (int64_t)type
{
  return self->_type;
}

- (WFContact)contact
{
  return self->_contact;
}

- (WFPhoneNumber)phoneNumber
{
  return self->_phoneNumber;
}

- (WFEmailAddress)emailAddress
{
  return self->_emailAddress;
}

- (NSString)customHandle
{
  return self->_customHandle;
}

- (WFMessageGroup)messageGroup
{
  return self->_messageGroup;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_messageGroup, 0);
  objc_storeStrong((id *)&self->_customHandle, 0);
  objc_storeStrong((id *)&self->_emailAddress, 0);
  objc_storeStrong((id *)&self->_phoneNumber, 0);
  objc_storeStrong((id *)&self->_contact, 0);
}

+ (id)processingValueClasses
{
  _QWORD v3[4];

  v3[3] = *MEMORY[0x24BDAC8D0];
  v3[0] = objc_opt_class();
  v3[1] = objc_opt_class();
  v3[2] = objc_opt_class();
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v3, 3);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (WFContactFieldEntry)initWithHandleString:(id)a3
{
  return -[WFContactFieldEntry initWithHandleString:allowsCustomHandles:](self, "initWithHandleString:allowsCustomHandles:", a3, 0);
}

- (WFContactFieldEntry)initWithHandleString:(id)a3 allowsCustomHandles:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  int64_t v7;
  void *v8;
  WFContactFieldEntry *v9;

  v4 = a4;
  v6 = a3;
  v7 = +[WFContact predictedTypeForHandleValue:allowsCustomHandles:](WFContact, "predictedTypeForHandleValue:allowsCustomHandles:", v6, v4);
  switch(v7)
  {
    case 2:
      self = -[WFContactFieldEntry initWithCustomHandle:](self, "initWithCustomHandle:", v6);
      break;
    case 1:
      +[WFEmailAddress addressWithEmailAddress:](WFEmailAddress, "addressWithEmailAddress:", v6);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = -[WFContactFieldEntry initWithEmailAddress:](self, "initWithEmailAddress:", v8);
      goto LABEL_7;
    case 0:
      +[WFPhoneNumber phoneNumberWithPhoneNumberString:](WFPhoneNumber, "phoneNumberWithPhoneNumberString:", v6);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = -[WFContactFieldEntry initWithPhoneNumber:](self, "initWithPhoneNumber:", v8);
LABEL_7:
      self = v9;

      break;
  }

  return self;
}

- (id)contentItem
{
  void *v2;
  unint64_t v4;
  void *v5;
  void *v6;

  v4 = -[WFContactFieldEntry type](self, "type");
  if (v4 < 4)
  {
    -[WFContactFieldEntry underlyingObject](self, "underlyingObject");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    +[WFContentItem itemWithObject:](WFContentItem, "itemWithObject:", v5);
    v2 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_5:

    return v2;
  }
  if (v4 == 4)
  {
    -[WFContactFieldEntry messageGroup](self, "messageGroup");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "name");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    +[WFContentItem itemWithObject:](WFContentItem, "itemWithObject:", v6);
    v2 = (void *)objc_claimAutoreleasedReturnValue();

    goto LABEL_5;
  }
  return v2;
}

@end
