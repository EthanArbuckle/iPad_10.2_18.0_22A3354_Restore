@implementation AAAccountUserNotificationContext

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (AAAccountUserNotificationContext)initWithCoder:(id)a3
{
  id v4;
  AAAccountUserNotificationContext *v5;
  uint64_t v6;
  NSString *title;
  uint64_t v8;
  NSString *message;
  uint64_t v10;
  NSString *altDSID;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)AAAccountUserNotificationContext;
  v5 = -[AAAccountUserNotificationContext init](&v13, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_title"));
    v6 = objc_claimAutoreleasedReturnValue();
    title = v5->_title;
    v5->_title = (NSString *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_message"));
    v8 = objc_claimAutoreleasedReturnValue();
    message = v5->_message;
    v5->_message = (NSString *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_altDSID"));
    v10 = objc_claimAutoreleasedReturnValue();
    altDSID = v5->_altDSID;
    v5->_altDSID = (NSString *)v10;

    v5->_action = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("_action"));
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *title;
  id v5;

  title = self->_title;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", title, CFSTR("_title"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_message, CFSTR("_message"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_altDSID, CFSTR("_altDSID"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_action, CFSTR("_action"));

}

- (id)copyWithZone:(_NSZone *)a3
{
  AAAccountUserNotificationContext *v4;
  uint64_t v5;
  NSString *title;
  uint64_t v7;
  NSString *message;
  uint64_t v9;
  NSString *altDSID;

  v4 = -[AAAccountUserNotificationContext init](+[AAAccountUserNotificationContext allocWithZone:](AAAccountUserNotificationContext, "allocWithZone:", a3), "init");
  v5 = -[NSString copy](self->_title, "copy");
  title = v4->_title;
  v4->_title = (NSString *)v5;

  v7 = -[NSString copy](self->_message, "copy");
  message = v4->_message;
  v4->_message = (NSString *)v7;

  v9 = -[NSString copy](self->_altDSID, "copy");
  altDSID = v4->_altDSID;
  v4->_altDSID = (NSString *)v9;

  v4->_action = self->_action;
  return v4;
}

- (id)description
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Notification Context with title: %@ \nmessage: %@ \naltDSID: %@ "), self->_title, self->_message, self->_altDSID);
}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSString)message
{
  return self->_message;
}

- (void)setMessage:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSString)altDSID
{
  return self->_altDSID;
}

- (void)setAltDSID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (int64_t)action
{
  return self->_action;
}

- (void)setAction:(int64_t)a3
{
  self->_action = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_altDSID, 0);
  objc_storeStrong((id *)&self->_message, 0);
  objc_storeStrong((id *)&self->_title, 0);
}

@end
