@implementation CDDCloudKitMessage

- (CDDCloudKitMessage)init
{
  CDDCloudKitMessage *v2;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)CDDCloudKitMessage;
  v2 = -[CDDCloudKitMessage init](&v4, sel_init);
  if (v2)
    v2->_identifier = (NSUUID *)objc_alloc_init(MEMORY[0x1E0CB3A28]);
  return v2;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CDDCloudKitMessage;
  -[CDDCloudKitMessage dealloc](&v3, sel_dealloc);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CDDCloudKitMessage)initWithCoder:(id)a3
{
  CDDCloudKitMessage *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)CDDCloudKitMessage;
  v4 = -[CDDCloudKitMessage init](&v6, sel_init);
  if (v4)
    v4->_identifier = (NSUUID *)(id)objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("identifier"));
  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  objc_msgSend(a3, "encodeObject:forKey:", self->_identifier, CFSTR("identifier"));
}

@end
