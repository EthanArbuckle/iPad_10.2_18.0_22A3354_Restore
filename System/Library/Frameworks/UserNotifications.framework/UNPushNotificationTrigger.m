@implementation UNPushNotificationTrigger

+ (UNPushNotificationTrigger)triggerWithContentAvailable:(BOOL)a3 mutableContent:(BOOL)a4
{
  return (UNPushNotificationTrigger *)(id)objc_msgSend(objc_alloc((Class)a1), "_initWithContentAvailable:mutableContent:", a3, a4);
}

- (id)_initWithContentAvailable:(BOOL)a3 mutableContent:(BOOL)a4
{
  id result;

  result = -[UNNotificationTrigger _initWithRepeats:](self, "_initWithRepeats:", 0);
  if (result)
  {
    *((_BYTE *)result + 9) = a3;
    *((_BYTE *)result + 10) = a4;
  }
  return result;
}

- (unint64_t)hash
{
  unint64_t v3;
  uint64_t v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)UNPushNotificationTrigger;
  v3 = -[UNNotificationTrigger hash](&v6, sel_hash);
  v4 = -[UNPushNotificationTrigger isContentAvailable](self, "isContentAvailable");
  return v3 ^ v4 ^ -[UNPushNotificationTrigger isMutableContent](self, "isMutableContent");
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  int v5;
  int v6;
  _BOOL4 v8;
  objc_super v9;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    && (v9.receiver = self,
        v9.super_class = (Class)UNPushNotificationTrigger,
        -[UNNotificationTrigger isEqual:](&v9, sel_isEqual_, v4))
    && (v5 = -[UNPushNotificationTrigger isContentAvailable](self, "isContentAvailable"),
        v5 == objc_msgSend(v4, "isContentAvailable")))
  {
    v8 = -[UNPushNotificationTrigger isMutableContent](self, "isMutableContent");
    v6 = v8 ^ objc_msgSend(v4, "isMutableContent") ^ 1;
  }
  else
  {
    LOBYTE(v6) = 0;
  }

  return v6;
}

- (id)description
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  -[UNPushNotificationTrigger isContentAvailable](self, "isContentAvailable");
  NSStringFromBOOL();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[UNPushNotificationTrigger isMutableContent](self, "isMutableContent");
  NSStringFromBOOL();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p; contentAvailable: %@, mutableContent: %@>"), v4, self, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)UNPushNotificationTrigger;
  v4 = a3;
  -[UNNotificationTrigger encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeBool:forKey:", -[UNPushNotificationTrigger isContentAvailable](self, "isContentAvailable", v5.receiver, v5.super_class), CFSTR("contentAvailable"));
  objc_msgSend(v4, "encodeBool:forKey:", -[UNPushNotificationTrigger isMutableContent](self, "isMutableContent"), CFSTR("mutableContent"));

}

- (UNPushNotificationTrigger)initWithCoder:(id)a3
{
  id v4;
  UNPushNotificationTrigger *v5;
  objc_super v7;

  v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)UNPushNotificationTrigger;
  v5 = -[UNNotificationTrigger initWithCoder:](&v7, sel_initWithCoder_, v4);
  if (v5)
  {
    *(&v5->super._repeats + 1) = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("contentAvailable"));
    *(&v5->super._repeats + 2) = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("mutableContent"));
  }

  return v5;
}

- (BOOL)isContentAvailable
{
  return *(&self->super._repeats + 1);
}

- (BOOL)isMutableContent
{
  return *(&self->super._repeats + 2);
}

@end
