@implementation DTTapHeartbeatMessage

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (DTTapHeartbeatMessage)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)DTTapHeartbeatMessage;
  return (DTTapHeartbeatMessage *)-[DTTapMessage initAsKind:](&v3, sel_initAsKind_, 8);
}

- (unint64_t)heartbeatTime
{
  void *v2;
  void *v3;
  unint64_t v4;

  -[DTTapMessage plist](self, "plist");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", CFSTR("heart"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "unsignedLongLongValue");

  return v4;
}

- (void)setHeartbeatTime:(unint64_t)a3
{
  void *v4;
  id v5;

  -[DTTapMessage plist](self, "plist");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKey:", v4, CFSTR("heart"));

}

@end
