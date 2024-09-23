@implementation NSNotification

+ (NSNotification)notificationWithName:(NSNotificationName)aName object:(id)anObject
{
  return (NSNotification *)(id)objc_msgSend(objc_alloc((Class)a1), "initWithName:object:userInfo:", aName, anObject, 0);
}

+ (NSNotification)notificationWithName:(NSNotificationName)aName object:(id)anObject userInfo:(NSDictionary *)aUserInfo
{
  return (NSNotification *)(id)objc_msgSend(objc_alloc((Class)a1), "initWithName:object:userInfo:", aName, anObject, aUserInfo);
}

+ (NSNotification)allocWithZone:(_NSZone *)a3
{
  if (NSNotification == a1)
    a1 = (id)objc_opt_self();
  return (NSNotification *)NSAllocateObject((Class)a1, 0, a3);
}

- (id)description
{
  unint64_t v3;
  NSDictionary *v4;
  NSMutableString *v5;
  uint64_t v6;
  NSString *v7;
  uint64_t v9;
  uint64_t v10;

  v3 = -[NSNotification object](self, "object");
  v4 = -[NSNotification userInfo](self, "userInfo");
  v5 = -[NSMutableString initWithCapacity:]([NSMutableString alloc], "initWithCapacity:", 256);
  v6 = objc_opt_class();
  v7 = -[NSNotification name](self, "name");
  if (v3 | (unint64_t)v4)
  {
    if (v3)
    {
      if (v4)
        -[NSMutableString appendFormat:](v5, "appendFormat:", CFSTR("%@ %p {name = %@; object = %@; userInfo = %@}"),
          v6,
          self,
          v7,
          v3,
          v4);
      else
        -[NSMutableString appendFormat:](v5, "appendFormat:", CFSTR("%@ %p {name = %@; object = %@}"),
          v6,
          self,
          v7,
          v3,
          v10);
    }
    else
    {
      -[NSMutableString appendFormat:](v5, "appendFormat:", CFSTR("%@ %p {name = %@; userInfo = %@}"),
        v6,
        self,
        v7,
        v4,
        v10);
    }
  }
  else
  {
    -[NSMutableString appendFormat:](v5, "appendFormat:", CFSTR("%@ %p {name = %@}"), v6, self, v7, v9, v10);
  }
  return v5;
}

- (NSNotificationName)name
{
  objc_class *v4;

  v4 = NSClassFromString((NSString *)CFSTR("NSNotification"));
  NSRequestConcreteImplementation((uint64_t)self, a2, v4);
}

- (id)object
{
  objc_class *v4;

  v4 = NSClassFromString((NSString *)CFSTR("NSNotification"));
  NSRequestConcreteImplementation((uint64_t)self, a2, v4);
}

- (NSDictionary)userInfo
{
  objc_class *v4;

  v4 = NSClassFromString((NSString *)CFSTR("NSNotification"));
  NSRequestConcreteImplementation((uint64_t)self, a2, v4);
}

- (unint64_t)hash
{
  return -[NSString hash](-[NSNotification name](self, "name"), "hash");
}

- (BOOL)isEqual:(id)a3
{
  _BOOL4 v5;
  id v6;

  if (a3 == self)
  {
    LOBYTE(v5) = 1;
    return v5;
  }
  if (!a3 || (objc_opt_isKindOfClass() & 1) == 0)
    goto LABEL_6;
  v5 = -[NSString isEqual:](-[NSNotification name](self, "name"), "isEqual:", objc_msgSend(a3, "name"));
  if (!v5)
    return v5;
  v6 = -[NSNotification object](self, "object");
  if (v6 == (id)objc_msgSend(a3, "object"))
    LOBYTE(v5) = -[NSDictionary isEqualToDictionary:](-[NSNotification userInfo](self, "userInfo"), "isEqualToDictionary:", objc_msgSend(a3, "userInfo"));
  else
LABEL_6:
    LOBYTE(v5) = 0;
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  char v5;
  NSString *v6;

  v5 = objc_msgSend(a3, "allowsKeyedCoding");
  v6 = -[NSNotification name](self, "name");
  if ((v5 & 1) != 0)
  {
    objc_msgSend(a3, "encodeObject:forKey:", v6, CFSTR("NS.name"));
    objc_msgSend(a3, "encodeObject:forKey:", -[NSNotification object](self, "object"), CFSTR("NS.object"));
    objc_msgSend(a3, "encodeObject:forKey:", -[NSNotification userInfo](self, "userInfo"), CFSTR("NS.userinfo"));
  }
  else
  {
    objc_msgSend(a3, "encodeObject:", v6);
    objc_msgSend(a3, "encodeObject:", -[NSNotification object](self, "object"));
    objc_msgSend(a3, "encodeObject:", -[NSNotification userInfo](self, "userInfo"));
  }
}

- (NSNotification)initWithCoder:(NSCoder *)coder
{
  id v5;
  id v6;
  id v7;

  if (-[NSCoder allowsKeyedCoding](coder, "allowsKeyedCoding"))
  {
    v5 = -[NSCoder decodeObjectForKey:](coder, "decodeObjectForKey:", CFSTR("NS.name"));
    v6 = -[NSCoder decodeObjectForKey:](coder, "decodeObjectForKey:", CFSTR("NS.object"));
    v7 = -[NSCoder decodeObjectForKey:](coder, "decodeObjectForKey:", CFSTR("NS.userinfo"));
  }
  else
  {
    v5 = -[NSCoder decodeObject](coder, "decodeObject");
    v6 = -[NSCoder decodeObject](coder, "decodeObject");
    v7 = -[NSCoder decodeObject](coder, "decodeObject");
  }
  return -[NSNotification initWithName:object:userInfo:](self, "initWithName:object:userInfo:", v5, v6, v7);
}

- (Class)classForCoder
{
  return (Class)objc_opt_self();
}

- (NSNotification)init
{
  NSString *v3;

  v3 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@: should never be used"), _NSMethodExceptionProem((objc_class *)self, a2));

  objc_exception_throw((id)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99750], v3, 0));
}

- (NSNotification)initWithName:(NSNotificationName)name object:(id)object userInfo:(NSDictionary *)userInfo
{
  _NSRequestConcreteObject((int)self, a2);
}

@end
