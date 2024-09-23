@implementation NSURLQueryItem

- (NSString)value
{
  return self->_value;
}

- (NSString)name
{
  return self->_name;
}

+ (NSURLQueryItem)queryItemWithName:(NSString *)name value:(NSString *)value
{
  return (NSURLQueryItem *)(id)objc_msgSend(objc_allocWithZone((Class)a1), "initWithName:value:", name, value);
}

- (NSURLQueryItem)initWithName:(NSString *)name value:(NSString *)value
{
  NSURLQueryItem *v6;
  NSString *v7;
  objc_super v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v9.receiver = self;
  v9.super_class = (Class)NSURLQueryItem;
  v6 = -[NSURLQueryItem init](&v9, sel_init);
  if (v6)
  {
    if (name)
      v7 = name;
    else
      v7 = (NSString *)&stru_1E0F56070;
    v6->_name = (NSString *)-[NSString copy](v7, "copy");
    v6->_value = (NSString *)-[NSString copy](value, "copy");
  }
  return v6;
}

+ (id)_queryItem
{
  objc_class *v2;
  char *v3;
  char *v4;
  uint64_t v5;
  id v6;
  objc_super v8;

  v2 = (objc_class *)type metadata accessor for _NSSwiftURLQueryItem();
  v3 = (char *)objc_allocWithZone(v2);
  v4 = &v3[OBJC_IVAR____NSSwiftURLQueryItem_queryItem];
  *(_QWORD *)v4 = 0;
  *((_QWORD *)v4 + 1) = 0xE000000000000000;
  *((_QWORD *)v4 + 2) = 0;
  *((_QWORD *)v4 + 3) = 0;
  v5 = String._bridgeToObjectiveCImpl()();
  v8.receiver = v3;
  v8.super_class = v2;
  v6 = objc_msgSendSuper2(&v8, sel_initWithName_value_, v5, 0);
  swift_unknownObjectRelease();
  return v6;
}

+ (id)_queryItemWithName:(id)a3 value:(id)a4
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  id v8;
  void *v9;
  objc_class *v10;
  char *v11;
  char *v12;
  uint64_t v13;
  void *v14;
  id v15;
  objc_super v17;

  v5 = static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
  v7 = v6;
  if (a4)
  {
    v8 = static String._unconditionallyBridgeFromObjectiveC(_:)(a4);
    a4 = v9;
  }
  else
  {
    v8 = 0;
  }
  v10 = (objc_class *)type metadata accessor for _NSSwiftURLQueryItem();
  v11 = (char *)objc_allocWithZone(v10);
  v12 = &v11[OBJC_IVAR____NSSwiftURLQueryItem_queryItem];
  *(_QWORD *)v12 = v5;
  *((_QWORD *)v12 + 1) = v7;
  *((_QWORD *)v12 + 2) = v8;
  *((_QWORD *)v12 + 3) = a4;
  v13 = String._bridgeToObjectiveCImpl()();
  if (a4)
    v14 = (void *)String._bridgeToObjectiveCImpl()();
  else
    v14 = 0;
  v17.receiver = v11;
  v17.super_class = v10;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  v15 = objc_msgSendSuper2(&v17, sel_initWithName_value_, v13, v14);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_unknownObjectRelease();

  return v15;
}

+ (NSURLQueryItem)allocWithZone:(_NSZone *)a3
{
  objc_super v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  if (NSURLQueryItem == a1)
    return (NSURLQueryItem *)&___immutablePlaceholderURLQueryItem;
  v4.receiver = a1;
  v4.super_class = (Class)&OBJC_METACLASS___NSURLQueryItem;
  return (NSURLQueryItem *)objc_msgSendSuper2(&v4, sel_allocWithZone_, a3);
}

- (BOOL)isEqual:(id)a3
{
  NSString *v5;
  uint64_t v6;
  _BOOL4 v7;
  NSString *v8;
  uint64_t v9;

  if (self == a3)
    goto LABEL_9;
  if (!a3 || (objc_opt_isKindOfClass() & 1) == 0)
  {
    LOBYTE(v7) = 0;
    return v7;
  }
  v5 = -[NSURLQueryItem name](self, "name");
  v6 = objc_msgSend(a3, "name");
  if (v5 == (NSString *)v6 || (v7 = -[NSString isEqual:](v5, "isEqual:", v6)))
  {
    v8 = -[NSURLQueryItem value](self, "value");
    v9 = objc_msgSend(a3, "value");
    if (v8 != (NSString *)v9)
    {
      LOBYTE(v7) = -[NSString isEqual:](v8, "isEqual:", v9);
      return v7;
    }
LABEL_9:
    LOBYTE(v7) = 1;
  }
  return v7;
}

- (unint64_t)hash
{
  NSUInteger v3;

  v3 = -[NSString hash](-[NSURLQueryItem name](self, "name"), "hash");
  return -[NSString hash](-[NSURLQueryItem value](self, "value"), "hash") + v3;
}

- (NSURLQueryItem)init
{
  return -[NSURLQueryItem initWithName:value:](self, "initWithName:value:", &stru_1E0F56070, 0);
}

+ (BOOL)automaticallyNotifiesObserversForKey:(id)a3
{
  return 0;
}

- (id)description
{
  return +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("<%@ %p> {name = %@, value = %@}"), objc_opt_class(), self, -[NSURLQueryItem name](self, "name"), -[NSURLQueryItem value](self, "value"));
}

- (void)encodeWithCoder:(id)a3
{
  void *v5;

  if ((objc_msgSend(a3, "allowsKeyedCoding") & 1) == 0)
  {
    v5 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ cannot be encoded by non-keyed archivers"), objc_opt_class()), 0);
    objc_exception_throw(v5);
  }
  objc_msgSend(a3, "encodeObject:forKey:", -[NSURLQueryItem name](self, "name"), CFSTR("NS.name"));
  objc_msgSend(a3, "encodeObject:forKey:", -[NSURLQueryItem value](self, "value"), CFSTR("NS.value"));
}

- (NSURLQueryItem)initWithCoder:(id)a3
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  id v11;
  NSString *v12;

  if ((objc_msgSend(a3, "allowsKeyedCoding") & 1) == 0)
  {
    v12 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ cannot be decoded by non-keyed archivers"), objc_opt_class());

    objc_exception_throw((id)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], v12, 0));
  }
  v6 = objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("NS.name"));
  v7 = objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("NS.value"));
  if (v6 && (v8 = v7, _NSIsNSString()) && (!v8 || _NSIsNSString()))
  {
    v9 = objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("NS.name"));
    return -[NSURLQueryItem initWithName:value:](self, "initWithName:value:", v9, objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("NS.value")));
  }
  else
  {
    v11 = +[NSError _readCorruptErrorWithFormat:](NSError, "_readCorruptErrorWithFormat:", CFSTR("%@: invalid archived object"), _NSMethodExceptionProem((objc_class *)self, a2));

    objc_msgSend(a3, "failWithError:", v11);
    return 0;
  }
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
