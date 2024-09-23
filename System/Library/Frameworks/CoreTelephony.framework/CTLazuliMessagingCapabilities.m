@implementation CTLazuliMessagingCapabilities

- (id)description
{
  void *v3;
  int64_t v4;
  int64_t v6;

  objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithFormat:", CFSTR("<%@"), objc_opt_class());
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[CTLazuliMessagingCapabilities notificationDisplay](self, "notificationDisplay");
  v6 = -[CTLazuliMessagingCapabilities notificationDisplay](self, "notificationDisplay");
  objc_msgSend(v3, "appendFormat:", CFSTR(", notificationDisplay = [%ld - %s]"), v4, print_CTLazuliDisplayNotificationType(&v6));
  objc_msgSend(v3, "appendFormat:", CFSTR(", supportsComposingIndicator = %d"), -[CTLazuliMessagingCapabilities supportsComposingIndicator](self, "supportsComposingIndicator"));
  objc_msgSend(v3, "appendString:", CFSTR(">"));
  return v3;
}

- (BOOL)isEqualToCTLazuliMessagingCapabilities:(id)a3
{
  id v4;
  int64_t v5;
  _BOOL4 v6;
  int v7;

  v4 = a3;
  v5 = -[CTLazuliMessagingCapabilities notificationDisplay](self, "notificationDisplay");
  if (v5 == objc_msgSend(v4, "notificationDisplay"))
  {
    v6 = -[CTLazuliMessagingCapabilities supportsComposingIndicator](self, "supportsComposingIndicator");
    v7 = v6 ^ objc_msgSend(v4, "supportsComposingIndicator") ^ 1;
  }
  else
  {
    LOBYTE(v7) = 0;
  }

  return v7;
}

- (BOOL)isEqual:(id)a3
{
  CTLazuliMessagingCapabilities *v4;
  CTLazuliMessagingCapabilities *v5;
  BOOL v6;

  v4 = (CTLazuliMessagingCapabilities *)a3;
  v5 = v4;
  if (v4 == self)
    v6 = 1;
  else
    v6 = v4
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && -[CTLazuliMessagingCapabilities isEqualToCTLazuliMessagingCapabilities:](self, "isEqualToCTLazuliMessagingCapabilities:", v5);

  return v6;
}

- (id)copyWithZone:(_NSZone *)a3
{
  CTLazuliMessagingCapabilities *v4;

  v4 = +[CTLazuliMessagingCapabilities allocWithZone:](CTLazuliMessagingCapabilities, "allocWithZone:", a3);
  -[CTLazuliMessagingCapabilities setNotificationDisplay:](v4, "setNotificationDisplay:", self->_notificationDisplay);
  -[CTLazuliMessagingCapabilities setSupportsComposingIndicator:](v4, "setSupportsComposingIndicator:", self->_supportsComposingIndicator);
  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLong:", self->_notificationDisplay);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", v4, CFSTR("kNotificationDisplayKey"));

  objc_msgSend(v5, "encodeBool:forKey:", self->_supportsComposingIndicator, CFSTR("kSupportsComposingIndicatorKey"));
}

- (CTLazuliMessagingCapabilities)initWithCoder:(id)a3
{
  id v4;
  CTLazuliMessagingCapabilities *v5;
  void *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)CTLazuliMessagingCapabilities;
  v5 = -[CTLazuliMessagingCapabilities init](&v8, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("kNotificationDisplayKey"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_notificationDisplay = objc_msgSend(v6, "longValue");

    v5->_supportsComposingIndicator = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("kSupportsComposingIndicatorKey"));
  }

  return v5;
}

- (CTLazuliMessagingCapabilities)initWithReflection:(const MessagingCapabilities *)a3
{
  CTLazuliMessagingCapabilities *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)CTLazuliMessagingCapabilities;
  v4 = -[CTLazuliMessagingCapabilities init](&v6, sel_init);
  if (v4)
  {
    v4->_notificationDisplay = encode_CTLazuliGroupChatParticipantRoleType(a3);
    v4->_supportsComposingIndicator = a3->var1;
  }
  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (int64_t)notificationDisplay
{
  return self->_notificationDisplay;
}

- (void)setNotificationDisplay:(int64_t)a3
{
  self->_notificationDisplay = a3;
}

- (BOOL)supportsComposingIndicator
{
  return self->_supportsComposingIndicator;
}

- (void)setSupportsComposingIndicator:(BOOL)a3
{
  self->_supportsComposingIndicator = a3;
}

@end
