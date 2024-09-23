@implementation IRAppleTVControlEvent

- (IRAppleTVControlEvent)initWithEventType:(int64_t)a3 eventSubType:(int64_t)a4
{
  IRAppleTVControlEvent *v6;
  IRAppleTVControlEvent *v7;
  IRAppleTVControlEvent *v8;
  objc_super v10;

  v6 = self;
  if (-[IRAppleTVControlEvent _isEventTypeValid:](self, "_isEventTypeValid:")
    && -[IRAppleTVControlEvent _isEventSubTypeValid:](v6, "_isEventSubTypeValid:", a4))
  {
    v10.receiver = v6;
    v10.super_class = (Class)IRAppleTVControlEvent;
    v7 = -[IREvent initWithName:](&v10, sel_initWithName_, CFSTR("kIREventNameAppleTVControl"));
    if (v7)
    {
      v7->_eventType = a3;
      v7->_eventSubType = a4;
    }
    v6 = v7;
    v8 = v6;
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (BOOL)_isEventTypeValid:(int64_t)a3
{
  return (unint64_t)a3 < 6;
}

- (BOOL)_isEventSubTypeValid:(int64_t)a3
{
  return a3 == 0;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  IRAppleTVControlEvent *v10;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)IRAppleTVControlEvent;
  v5 = -[IREvent copyWithZone:](&v12, sel_copyWithZone_);
  v5[2] = -[IRAppleTVControlEvent eventType](self, "eventType");
  v5[3] = -[IRAppleTVControlEvent eventSubType](self, "eventSubType");
  v6 = -[NSString copyWithZone:](self->_contextIdentifier, "copyWithZone:", a3);
  v7 = (void *)v5[4];
  v5[4] = v6;

  v8 = -[NSString copyWithZone:](self->_bundleID, "copyWithZone:", a3);
  v9 = (void *)v5[5];
  v5[5] = v8;

  v10 = self;
  return v10;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)IRAppleTVControlEvent;
  v4 = a3;
  -[IREvent encodeWithCoder:](&v7, sel_encodeWithCoder_, v4);
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", self->_eventType, v7.receiver, v7.super_class);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("eventType"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", self->_eventSubType);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("eventSubType"));

  objc_msgSend(v4, "encodeObject:forKey:", self->_contextIdentifier, CFSTR("contextIdentifier"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_bundleID, CFSTR("bundleID"));

}

- (IRAppleTVControlEvent)initWithCoder:(id)a3
{
  id v4;
  IRAppleTVControlEvent *v5;
  IRAppleTVControlEvent *v6;
  IRAppleTVControlEvent *v7;
  int64_t v8;
  IRAppleTVControlEvent *v9;
  int64_t v10;
  void *v11;
  uint64_t v12;
  NSString *contextIdentifier;
  void *v14;
  uint64_t v15;
  NSString *bundleID;
  objc_super v18;

  v4 = a3;
  v18.receiver = self;
  v18.super_class = (Class)IRAppleTVControlEvent;
  v5 = -[IREvent initWithCoder:](&v18, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("eventType"));
    v6 = (IRAppleTVControlEvent *)objc_claimAutoreleasedReturnValue();
    v7 = v6;
    if (v6)
    {
      v8 = (int)-[IRAppleTVControlEvent intValue](v6, "intValue");

      v5->_eventType = v8;
      objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("eventSubType"));
      v9 = (IRAppleTVControlEvent *)objc_claimAutoreleasedReturnValue();
      v7 = v9;
      if (v9)
      {
        v10 = (int)-[IRAppleTVControlEvent intValue](v9, "intValue");

        v5->_eventSubType = v10;
        objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("contextIdentifier"));
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_self();
        v12 = objc_claimAutoreleasedReturnValue();

        contextIdentifier = v5->_contextIdentifier;
        v5->_contextIdentifier = (NSString *)v12;

        objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("bundleID"));
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_self();
        v15 = objc_claimAutoreleasedReturnValue();

        bundleID = v5->_bundleID;
        v5->_bundleID = (NSString *)v15;

        v7 = v5;
      }
    }
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (IRAppleTVControlEvent)init
{
  __assert_rtn("-[IRAppleTVControlEvent init]", "IREvent.m", 414, "NO");
}

+ (id)new
{
  __assert_rtn("+[IRAppleTVControlEvent new]", "IREvent.m", 419, "NO");
}

- (id)description
{
  id v3;
  objc_class *v4;
  void *v5;
  void *v6;
  void *v7;
  unint64_t eventType;
  const __CFString *v9;
  const __CFString *v10;

  v3 = objc_alloc(MEMORY[0x24BDD16A8]);
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("<%@: "), v5);

  -[IREvent name](self, "name");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "appendFormat:", CFSTR(", name: %@"), v7);

  eventType = self->_eventType;
  v9 = CFSTR("Invalid");
  if (eventType <= 5)
    v9 = off_25103FA10[eventType];
  objc_msgSend(v6, "appendFormat:", CFSTR(", eventType: %@"), v9);
  if (self->_eventSubType)
    v10 = CFSTR("Invalid");
  else
    v10 = CFSTR("Default");
  objc_msgSend(v6, "appendFormat:", CFSTR(", eventSubType: %@"), v10);
  objc_msgSend(v6, "appendFormat:", CFSTR(", contextIdentifier: %@"), self->_contextIdentifier);
  objc_msgSend(v6, "appendFormat:", CFSTR(", bundleID: %@"), self->_bundleID);
  objc_msgSend(v6, "appendString:", CFSTR(">"));
  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  id v5;
  int64_t v6;
  int64_t v7;
  void *v8;
  void *v9;
  char v10;
  void *v11;
  void *v12;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  BOOL v18;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    v6 = -[IRAppleTVControlEvent eventType](self, "eventType");
    if (v6 == objc_msgSend(v5, "eventType"))
    {
      v7 = -[IRAppleTVControlEvent eventSubType](self, "eventSubType");
      if (v7 == objc_msgSend(v5, "eventSubType"))
      {
        -[IRAppleTVControlEvent contextIdentifier](self, "contextIdentifier");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "contextIdentifier");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v8, "isEqual:", v9))
        {

          goto LABEL_11;
        }
        -[IRAppleTVControlEvent contextIdentifier](self, "contextIdentifier");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "contextIdentifier");
        v12 = (void *)objc_claimAutoreleasedReturnValue();

        if (v11 == v12)
        {
LABEL_11:
          -[IRAppleTVControlEvent bundleID](self, "bundleID");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "bundleID");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v14, "isEqual:", v15))
          {

            v10 = 1;
          }
          else
          {
            -[IRAppleTVControlEvent bundleID](self, "bundleID");
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v5, "bundleID");
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            v18 = v16 != v17;

            v10 = !v18;
          }
          goto LABEL_9;
        }
      }
    }
    v10 = 0;
LABEL_9:

    goto LABEL_10;
  }
  v10 = 0;
LABEL_10:

  return v10 & 1;
}

- (unint64_t)hash
{
  unint64_t v3;
  NSUInteger v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)IRAppleTVControlEvent;
  v3 = -[IREvent hash](&v6, sel_hash);
  v4 = -[NSString hash](self->_contextIdentifier, "hash");
  return v3 ^ v4 ^ -[NSString hash](self->_bundleID, "hash") ^ self->_eventSubType ^ self->_eventType ^ 0x1F;
}

- (int64_t)eventType
{
  return self->_eventType;
}

- (int64_t)eventSubType
{
  return self->_eventSubType;
}

- (NSString)contextIdentifier
{
  return self->_contextIdentifier;
}

- (void)setContextIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_contextIdentifier, a3);
}

- (NSString)bundleID
{
  return self->_bundleID;
}

- (void)setBundleID:(id)a3
{
  objc_storeStrong((id *)&self->_bundleID, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bundleID, 0);
  objc_storeStrong((id *)&self->_contextIdentifier, 0);
}

@end
