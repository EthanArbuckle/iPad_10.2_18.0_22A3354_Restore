@implementation IRMediaEvent

- (IRMediaEvent)initWithEventType:(int64_t)a3 eventSubType:(int64_t)a4
{
  IRMediaEvent *v6;
  IRMediaEvent *v7;
  IRMediaEvent *v8;
  objc_super v10;

  v6 = self;
  if (-[IRMediaEvent _isEventTypeValid:](self, "_isEventTypeValid:")
    && -[IRMediaEvent _isEventSubTypeValid:](v6, "_isEventSubTypeValid:", a4))
  {
    v10.receiver = v6;
    v10.super_class = (Class)IRMediaEvent;
    v7 = -[IREvent initWithName:](&v10, sel_initWithName_, CFSTR("kIREventNameMedia"));
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
  return (unint64_t)a3 < 0xC;
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
  IRMediaEvent *v10;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)IRMediaEvent;
  v5 = -[IREvent copyWithZone:](&v12, sel_copyWithZone_);
  v5[3] = -[IRMediaEvent eventType](self, "eventType");
  v5[4] = -[IRMediaEvent eventSubType](self, "eventSubType");
  v6 = -[NSString copyWithZone:](self->_contextIdentifier, "copyWithZone:", a3);
  v7 = (void *)v5[5];
  v5[5] = v6;

  v8 = -[NSString copyWithZone:](self->_bundleID, "copyWithZone:", a3);
  v9 = (void *)v5[6];
  v5[6] = v8;

  *((_BYTE *)v5 + 16) = -[IRMediaEvent isOutsideApp](self, "isOutsideApp");
  *((_BYTE *)v5 + 17) = -[IRMediaEvent isEligibleApp](self, "isEligibleApp");
  v10 = self;

  return v10;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)IRMediaEvent;
  v4 = a3;
  -[IREvent encodeWithCoder:](&v9, sel_encodeWithCoder_, v4);
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", self->_eventType, v9.receiver, v9.super_class);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("eventType"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", self->_eventSubType);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("eventSubType"));

  objc_msgSend(v4, "encodeObject:forKey:", self->_contextIdentifier, CFSTR("contextIdentifier"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_bundleID, CFSTR("bundleID"));
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_isOutsideApp);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("isOutsideApp"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_isEligibleApp);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v8, CFSTR("isEligibleApp"));

}

- (IRMediaEvent)initWithCoder:(id)a3
{
  id v4;
  IRMediaEvent *v5;
  IRMediaEvent *v6;
  IRMediaEvent *v7;
  int64_t v8;
  IRMediaEvent *v9;
  int64_t v10;
  void *v11;
  uint64_t v12;
  NSString *contextIdentifier;
  void *v14;
  uint64_t v15;
  NSString *bundleID;
  IRMediaEvent *v17;
  char v18;
  IRMediaEvent *v19;
  char v20;
  objc_super v22;

  v4 = a3;
  v22.receiver = self;
  v22.super_class = (Class)IRMediaEvent;
  v5 = -[IREvent initWithCoder:](&v22, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("eventType"));
    v6 = (IRMediaEvent *)objc_claimAutoreleasedReturnValue();
    v7 = v6;
    if (v6)
    {
      v8 = (int)-[IRMediaEvent intValue](v6, "intValue");

      v5->_eventType = v8;
      objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("eventSubType"));
      v9 = (IRMediaEvent *)objc_claimAutoreleasedReturnValue();
      v7 = v9;
      if (v9)
      {
        v10 = (int)-[IRMediaEvent intValue](v9, "intValue");

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

        objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("isOutsideApp"));
        v17 = (IRMediaEvent *)objc_claimAutoreleasedReturnValue();
        v7 = v17;
        if (v17)
        {
          v18 = -[IRMediaEvent BOOLValue](v17, "BOOLValue");

          v5->_isOutsideApp = v18;
          objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("isEligibleApp"));
          v19 = (IRMediaEvent *)objc_claimAutoreleasedReturnValue();
          v7 = v19;
          if (v19)
          {
            v20 = -[IRMediaEvent BOOLValue](v19, "BOOLValue");

            v5->_isEligibleApp = v20;
            v7 = v5;
          }
        }
      }
    }
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (IRMediaEvent)init
{
  __assert_rtn("-[IRMediaEvent init]", "IREvent.m", 252, "NO");
}

+ (id)new
{
  __assert_rtn("+[IRMediaEvent new]", "IREvent.m", 257, "NO");
}

- (id)description
{
  id v3;
  objc_class *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  const __CFString *v9;
  void *v10;
  void *v11;

  v3 = objc_alloc(MEMORY[0x24BDD16A8]);
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("<%@: "), v5);

  -[IREvent name](self, "name");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "appendFormat:", CFSTR(", name: %@"), v7);

  IRMediaEventTypeToString(self->_eventType);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "appendFormat:", CFSTR(", eventType: %@"), v8);

  if (self->_eventSubType)
    v9 = CFSTR("Invalid");
  else
    v9 = CFSTR("Default");
  objc_msgSend(v6, "appendFormat:", CFSTR(", eventSubType: %@"), v9);
  objc_msgSend(v6, "appendFormat:", CFSTR(", contextIdentifier: %@"), self->_contextIdentifier);
  objc_msgSend(v6, "appendFormat:", CFSTR(", bundleID: %@"), self->_bundleID);
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_isOutsideApp);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "appendFormat:", CFSTR(", isOutsideApp: %@"), v10);

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_isEligibleApp);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "appendFormat:", CFSTR(", isEligibleApp: %@"), v11);

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
  int v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  int v17;
  _BOOL4 v19;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    v6 = -[IRMediaEvent eventType](self, "eventType");
    if (v6 != objc_msgSend(v5, "eventType"))
      goto LABEL_12;
    v7 = -[IRMediaEvent eventSubType](self, "eventSubType");
    if (v7 != objc_msgSend(v5, "eventSubType"))
      goto LABEL_12;
    -[IRMediaEvent contextIdentifier](self, "contextIdentifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "contextIdentifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v8, "isEqual:", v9))
    {

    }
    else
    {
      -[IRMediaEvent contextIdentifier](self, "contextIdentifier");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "contextIdentifier");
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      if (v11 != v12)
        goto LABEL_12;
    }
    -[IRMediaEvent bundleID](self, "bundleID");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "bundleID");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v13, "isEqual:", v14))
    {

    }
    else
    {
      -[IRMediaEvent bundleID](self, "bundleID");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "bundleID");
      v16 = (void *)objc_claimAutoreleasedReturnValue();

      if (v15 != v16)
        goto LABEL_12;
    }
    v17 = -[IRMediaEvent isOutsideApp](self, "isOutsideApp");
    if (v17 == objc_msgSend(v5, "isOutsideApp"))
    {
      v19 = -[IRMediaEvent isEligibleApp](self, "isEligibleApp");
      v10 = v19 ^ objc_msgSend(v5, "isEligibleApp") ^ 1;
      goto LABEL_13;
    }
LABEL_12:
    LOBYTE(v10) = 0;
LABEL_13:

    goto LABEL_14;
  }
  LOBYTE(v10) = 0;
LABEL_14:

  return v10;
}

- (unint64_t)hash
{
  unint64_t v3;
  NSUInteger v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)IRMediaEvent;
  v3 = -[IREvent hash](&v6, sel_hash);
  v4 = -[NSString hash](self->_contextIdentifier, "hash");
  return v3 ^ v4 ^ -[NSString hash](self->_bundleID, "hash") ^ self->_eventSubType ^ self->_eventType ^ self->_isOutsideApp ^ self->_isEligibleApp ^ 0x1F;
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

- (BOOL)isOutsideApp
{
  return self->_isOutsideApp;
}

- (void)setIsOutsideApp:(BOOL)a3
{
  self->_isOutsideApp = a3;
}

- (BOOL)isEligibleApp
{
  return self->_isEligibleApp;
}

- (void)setIsEligibleApp:(BOOL)a3
{
  self->_isEligibleApp = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bundleID, 0);
  objc_storeStrong((id *)&self->_contextIdentifier, 0);
}

@end
