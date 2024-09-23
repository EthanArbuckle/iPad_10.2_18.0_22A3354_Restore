@implementation NSTextCheckingKeyEvent

- (NSTextCheckingKeyEvent)initWithKeyboardLayoutType:(int64_t)a3 keyboardType:(unint64_t)a4 identifier:(id)a5 primaryLanguage:(id)a6 flags:(unint64_t)a7 timestamp:(double)a8 characters:(id)a9 charactersIgnoringModifiers:(id)a10
{
  NSTextCheckingKeyEvent *v17;
  NSTextCheckingKeyEvent *v18;
  objc_super v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v20.receiver = self;
  v20.super_class = (Class)NSTextCheckingKeyEvent;
  v17 = -[NSTextCheckingKeyEvent init](&v20, sel_init);
  v18 = v17;
  if (v17)
  {
    v17->_layoutType = a3;
    v17->_keyboardType = a4;
    v17->_identifier = (NSString *)objc_msgSend(a5, "copy");
    v18->_primaryLanguage = (NSString *)objc_msgSend(a6, "copy");
    v18->_flags = a7;
    v18->_time = a8;
    v18->_keys = (NSString *)objc_msgSend(a9, "copy");
    v18->_ukeys = (NSString *)objc_msgSend(a10, "copy");
  }
  return v18;
}

- (void)dealloc
{
  objc_super v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];

  v3.receiver = self;
  v3.super_class = (Class)NSTextCheckingKeyEvent;
  -[NSTextCheckingKeyEvent dealloc](&v3, sel_dealloc);
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  NSString *identifier;
  _BOOL4 v14;
  NSString *primaryLanguage;
  NSString *keys;
  NSString *ukeys;
  int64_t layoutType;
  unint64_t flags;
  double time;
  double v21;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;

  if (self == a3)
  {
    LOBYTE(v14) = 1;
    return v14;
  }
  v23 = v5;
  v24 = v4;
  v25 = v3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    goto LABEL_15;
  identifier = self->_identifier;
  if (identifier == (NSString *)objc_msgSend(a3, "keyboardLayoutIdentifier")
    || (v14 = -[NSString isEqual:](self->_identifier, "isEqual:", objc_msgSend(a3, "keyboardLayoutIdentifier"))))
  {
    primaryLanguage = self->_primaryLanguage;
    if (primaryLanguage == (NSString *)objc_msgSend(a3, "primaryLanguage", v10, v9, v6, v23, v24, v25, v7, v8)
      || (v14 = -[NSString isEqual:](self->_primaryLanguage, "isEqual:", objc_msgSend(a3, "primaryLanguage"))))
    {
      keys = self->_keys;
      if (keys == (NSString *)objc_msgSend(a3, "characters")
        || (v14 = -[NSString isEqual:](self->_keys, "isEqual:", objc_msgSend(a3, "characters"))))
      {
        ukeys = self->_ukeys;
        if (ukeys == (NSString *)objc_msgSend(a3, "charactersIgnoringModifiers")
          || (v14 = -[NSString isEqual:](self->_ukeys, "isEqual:", objc_msgSend(a3, "charactersIgnoringModifiers"))))
        {
          layoutType = self->_layoutType;
          if (layoutType == objc_msgSend(a3, "keyboardLayoutType"))
          {
            flags = self->_flags;
            if (flags == objc_msgSend(a3, "flags"))
            {
              time = self->_time;
              objc_msgSend(a3, "timestamp");
              LOBYTE(v14) = time == v21;
              return v14;
            }
          }
LABEL_15:
          LOBYTE(v14) = 0;
        }
      }
    }
  }
  return v14;
}

- (unint64_t)hash
{
  unint64_t v3;
  NSUInteger v4;
  NSUInteger v5;

  v3 = (unint64_t)((self->_time / 100000.0 - floor(self->_time / 100000.0)) * 1000000000.0);
  v4 = -[NSString hash](self->_identifier, "hash");
  v5 = -[NSString hash](self->_primaryLanguage, "hash") ^ v4;
  return v5 ^ -[NSString hash](self->_keys, "hash") ^ self->_layoutType ^ self->_flags ^ v3;
}

- (id)description
{
  const __CFString *v3;
  NSString *v4;
  NSString *v5;
  unint64_t v6;
  unint64_t v7;
  uint64_t v8;

  if (-[NSTextCheckingKeyEvent keyboardLayoutType](self, "keyboardLayoutType"))
  {
    if (-[NSTextCheckingKeyEvent keyboardLayoutType](self, "keyboardLayoutType") == 1)
    {
      v3 = CFSTR("ISO");
    }
    else if (-[NSTextCheckingKeyEvent keyboardLayoutType](self, "keyboardLayoutType") == 2)
    {
      v3 = CFSTR("JIS");
    }
    else
    {
      v3 = CFSTR("?");
    }
  }
  else
  {
    v3 = CFSTR("ANSI");
  }
  v4 = -[NSTextCheckingKeyEvent keyboardLayoutIdentifier](self, "keyboardLayoutIdentifier");
  v5 = -[NSTextCheckingKeyEvent primaryLanguage](self, "primaryLanguage");
  v6 = -[NSTextCheckingKeyEvent keyboardType](self, "keyboardType");
  v7 = -[NSTextCheckingKeyEvent flags](self, "flags");
  -[NSTextCheckingKeyEvent timestamp](self, "timestamp");
  return +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("keyboard %@/%@/%@/%llu flags 0x%llx time %g <%@> <%@>"), v4, v5, v3, v6, v7, v8, -[NSTextCheckingKeyEvent characters](self, "characters"), -[NSTextCheckingKeyEvent charactersIgnoringModifiers](self, "charactersIgnoringModifiers"));
}

- (void)encodeWithCoder:(id)a3
{
  void *v5;

  if ((objc_msgSend(a3, "allowsKeyedCoding") & 1) == 0)
  {
    v5 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ requires keyed coding"), objc_opt_class()), 0);
    objc_exception_throw(v5);
  }
  objc_msgSend(a3, "encodeInteger:forKey:", -[NSTextCheckingKeyEvent keyboardLayoutType](self, "keyboardLayoutType"), CFSTR("NSKeyboardLayoutType"));
  objc_msgSend(a3, "encodeInteger:forKey:", -[NSTextCheckingKeyEvent keyboardType](self, "keyboardType"), CFSTR("NSKeyboardType"));
  objc_msgSend(a3, "encodeObject:forKey:", -[NSTextCheckingKeyEvent keyboardLayoutIdentifier](self, "keyboardLayoutIdentifier"), CFSTR("NSKeyboardLayoutIdentifier"));
  objc_msgSend(a3, "encodeObject:forKey:", -[NSTextCheckingKeyEvent primaryLanguage](self, "primaryLanguage"), CFSTR("NSPrimaryLanguage"));
  objc_msgSend(a3, "encodeInteger:forKey:", -[NSTextCheckingKeyEvent flags](self, "flags"), CFSTR("NSFlags"));
  -[NSTextCheckingKeyEvent timestamp](self, "timestamp");
  objc_msgSend(a3, "encodeDouble:forKey:", CFSTR("NSTimestamp"));
  objc_msgSend(a3, "encodeObject:forKey:", -[NSTextCheckingKeyEvent characters](self, "characters"), CFSTR("NSCharacters"));
  objc_msgSend(a3, "encodeObject:forKey:", -[NSTextCheckingKeyEvent charactersIgnoringModifiers](self, "charactersIgnoringModifiers"), CFSTR("NSCharactersIgnoringModifiers"));
}

- (NSTextCheckingKeyEvent)initWithCoder:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  double v10;
  double v11;
  uint64_t v12;
  uint64_t v13;
  const __CFString *v15;
  void *v16;

  if ((objc_msgSend(a3, "allowsKeyedCoding") & 1) == 0)
  {
    v16 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ requires keyed coding"), objc_opt_class()), 0);
    objc_exception_throw(v16);
  }
  v5 = objc_msgSend(a3, "decodeIntegerForKey:", CFSTR("NSKeyboardLayoutType"));
  v6 = objc_msgSend(a3, "decodeIntegerForKey:", CFSTR("NSKeyboardType"));
  v7 = objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("NSKeyboardLayoutIdentifier"));
  v8 = objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("NSPrimaryLanguage"));
  v9 = objc_msgSend(a3, "decodeIntegerForKey:", CFSTR("NSFlags"));
  objc_msgSend(a3, "decodeDoubleForKey:", CFSTR("NSTimestamp"));
  v11 = v10;
  v12 = objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("NSCharacters"));
  v13 = objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("NSCharactersIgnoringModifiers"));
  if (v7 && (_NSIsNSString() & 1) == 0)
  {

    v15 = CFSTR("Identifier is not a string");
  }
  else if (v8 && (_NSIsNSString() & 1) == 0)
  {

    v15 = CFSTR("Primary language is not a string");
  }
  else if (v12 && (_NSIsNSString() & 1) == 0)
  {

    v15 = CFSTR("Characters is not a string");
  }
  else
  {
    if (!v13 || (_NSIsNSString() & 1) != 0)
      return -[NSTextCheckingKeyEvent initWithKeyboardLayoutType:keyboardType:identifier:primaryLanguage:flags:timestamp:characters:charactersIgnoringModifiers:](self, "initWithKeyboardLayoutType:keyboardType:identifier:primaryLanguage:flags:timestamp:characters:charactersIgnoringModifiers:", v5, v6, v7, v8, v9, v12, v11, v13);

    v15 = CFSTR("Characters ignoring modifiers is not a string");
  }
  objc_msgSend(a3, "failWithError:", +[NSError _readCorruptErrorWithFormat:](NSError, "_readCorruptErrorWithFormat:", v15));
  return 0;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (int64_t)keyboardLayoutType
{
  return self->_layoutType;
}

- (unint64_t)keyboardType
{
  return self->_keyboardType;
}

- (NSString)keyboardLayoutIdentifier
{
  return self->_identifier;
}

- (NSString)primaryLanguage
{
  return self->_primaryLanguage;
}

- (unint64_t)flags
{
  return self->_flags;
}

- (double)timestamp
{
  return self->_time;
}

- (NSString)characters
{
  return self->_keys;
}

- (NSString)charactersIgnoringModifiers
{
  return self->_ukeys;
}

@end
