@implementation CDDCloudKitScheduleActivityMessage

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CDDCloudKitScheduleActivityMessage;
  -[CDDCloudKitMessage dealloc](&v3, sel_dealloc);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CDDCloudKitScheduleActivityMessage)initWithCoder:(id)a3
{
  CDDCloudKitScheduleActivityMessage *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)CDDCloudKitScheduleActivityMessage;
  v4 = -[CDDCloudKitMessage initWithCoder:](&v6, sel_initWithCoder_);
  if (v4)
  {
    v4->_activityType = objc_msgSend((id)objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("activityType")), "unsignedIntegerValue");
    v4->_storePath = (NSString *)(id)objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("storePath"));
  }
  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)CDDCloudKitScheduleActivityMessage;
  -[CDDCloudKitMessage encodeWithCoder:](&v5, sel_encodeWithCoder_);
  objc_msgSend(a3, "encodeObject:forKey:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", self->_activityType), CFSTR("activityType"));
  objc_msgSend(a3, "encodeObject:forKey:", self->_storePath, CFSTR("storePath"));
}

@end
