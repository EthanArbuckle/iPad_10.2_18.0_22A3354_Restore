@implementation CALNNotificationRecord

- (CALNNotificationRecord)initWithSourceIdentifier:(id)a3 sourceClientIdentifier:(id)a4 content:(id)a5
{
  return -[CALNNotificationRecord initWithSourceIdentifier:sourceClientIdentifier:content:date:shouldPresentAlert:shouldPlaySound:](self, "initWithSourceIdentifier:sourceClientIdentifier:content:date:shouldPresentAlert:shouldPlaySound:", a3, a4, a5, 0, 1, 1);
}

- (CALNNotificationRecord)initWithSourceIdentifier:(id)a3 sourceClientIdentifier:(id)a4 content:(id)a5 date:(id)a6 shouldPresentAlert:(BOOL)a7 shouldPlaySound:(BOOL)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  CALNNotificationRecord *v18;
  uint64_t v19;
  NSString *sourceIdentifier;
  uint64_t v21;
  NSString *sourceClientIdentifier;
  uint64_t v23;
  CALNNotificationContent *content;
  uint64_t v25;
  NSDate *date;
  objc_super v28;

  v14 = a3;
  v15 = a4;
  v16 = a5;
  v17 = a6;
  v28.receiver = self;
  v28.super_class = (Class)CALNNotificationRecord;
  v18 = -[CALNNotificationRecord init](&v28, sel_init);
  if (v18)
  {
    v19 = objc_msgSend(v14, "copy");
    sourceIdentifier = v18->_sourceIdentifier;
    v18->_sourceIdentifier = (NSString *)v19;

    v21 = objc_msgSend(v15, "copy");
    sourceClientIdentifier = v18->_sourceClientIdentifier;
    v18->_sourceClientIdentifier = (NSString *)v21;

    v23 = objc_msgSend(v16, "copy");
    content = v18->_content;
    v18->_content = (CALNNotificationContent *)v23;

    v25 = objc_msgSend(v17, "copy");
    date = v18->_date;
    v18->_date = (NSDate *)v25;

    v18->_shouldPresentAlert = a7;
    v18->_shouldPlaySound = a8;
  }

  return v18;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CALNNotificationRecord)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  CALNNotificationRecord *v11;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("sourceIdentifier"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("sourceClientIdentifier"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("content"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("date"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("shouldPresentAlert"));
  v10 = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("shouldPlaySound"));

  v11 = -[CALNNotificationRecord initWithSourceIdentifier:sourceClientIdentifier:content:date:shouldPresentAlert:shouldPlaySound:](self, "initWithSourceIdentifier:sourceClientIdentifier:content:date:shouldPresentAlert:shouldPlaySound:", v5, v6, v7, v8, v9, v10);
  return v11;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a3;
  -[CALNNotificationRecord sourceIdentifier](self, "sourceIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "encodeObject:forKey:", v4, CFSTR("sourceIdentifier"));

  -[CALNNotificationRecord sourceClientIdentifier](self, "sourceClientIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "encodeObject:forKey:", v5, CFSTR("sourceClientIdentifier"));

  -[CALNNotificationRecord content](self, "content");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "encodeObject:forKey:", v6, CFSTR("content"));

  -[CALNNotificationRecord date](self, "date");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "encodeObject:forKey:", v7, CFSTR("date"));

  objc_msgSend(v8, "encodeBool:forKey:", -[CALNNotificationRecord shouldPresentAlert](self, "shouldPresentAlert"), CFSTR("shouldPresentAlert"));
  objc_msgSend(v8, "encodeBool:forKey:", -[CALNNotificationRecord shouldPlaySound](self, "shouldPlaySound"), CFSTR("shouldPlaySound"));

}

- (BOOL)isEqual:(id)a3
{
  id v4;
  BOOL v5;

  v4 = a3;
  v5 = v4
    && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
    && -[CALNNotificationRecord isEqualToRecord:](self, "isEqualToRecord:", v4);

  return v5;
}

- (BOOL)isEqualToRecord:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  void *v12;
  int v13;
  void *v14;
  void *v15;
  int v16;
  int v17;
  int v18;
  _BOOL4 v20;

  v4 = a3;
  -[CALNNotificationRecord sourceIdentifier](self, "sourceIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "sourceIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = CalEqualStrings();

  if (!v7)
    goto LABEL_6;
  -[CALNNotificationRecord sourceClientIdentifier](self, "sourceClientIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "sourceClientIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = CalEqualStrings();

  if (!v10)
    goto LABEL_6;
  -[CALNNotificationRecord content](self, "content");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "content");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = CalEqualObjects();

  if (!v13)
    goto LABEL_6;
  -[CALNNotificationRecord date](self, "date");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "date");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = CalEqualObjects();

  if (!v16)
    goto LABEL_6;
  v17 = -[CALNNotificationRecord shouldPresentAlert](self, "shouldPresentAlert");
  if (v17 == objc_msgSend(v4, "shouldPresentAlert"))
  {
    v20 = -[CALNNotificationRecord shouldPlaySound](self, "shouldPlaySound");
    v18 = v20 ^ objc_msgSend(v4, "shouldPlaySound") ^ 1;
  }
  else
  {
LABEL_6:
    LOBYTE(v18) = 0;
  }

  return v18;
}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  _BOOL4 v12;
  uint64_t v13;

  -[CALNNotificationRecord sourceIdentifier](self, "sourceIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");

  -[CALNNotificationRecord sourceClientIdentifier](self, "sourceClientIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hash") ^ v4;

  -[CALNNotificationRecord content](self, "content");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "hash");

  -[CALNNotificationRecord date](self, "date");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v6 ^ v8 ^ objc_msgSend(v9, "hash");

  v11 = -[CALNNotificationRecord shouldPresentAlert](self, "shouldPresentAlert");
  v12 = -[CALNNotificationRecord shouldPlaySound](self, "shouldPlaySound");
  v13 = 2;
  if (!v12)
    v13 = 0;
  return v10 ^ v11 ^ v13;
}

- (BOOL)hasAlertContent
{
  void *v3;
  void *v4;
  void *v5;
  BOOL v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  -[CALNNotificationRecord content](self, "content");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    -[CALNNotificationRecord content](self, "content");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "body");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v5, "length"))
    {
      v6 = 1;
    }
    else
    {
      -[CALNNotificationRecord content](self, "content");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "subtitle");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v8, "length"))
      {
        v6 = 1;
      }
      else
      {
        -[CALNNotificationRecord content](self, "content");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "title");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v6 = objc_msgSend(v10, "length") != 0;

      }
    }

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (BOOL)hasSound
{
  void *v2;
  void *v3;
  BOOL v4;

  -[CALNNotificationRecord content](self, "content");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "sound");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "alertType") != 0;

  return v4;
}

- (id)description
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v4 = objc_opt_class();
  -[CALNNotificationRecord sourceIdentifier](self, "sourceIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[CALNNotificationRecord sourceClientIdentifier](self, "sourceClientIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[CALNNotificationRecord content](self, "content");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", -[CALNNotificationRecord shouldPresentAlert](self, "shouldPresentAlert"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", -[CALNNotificationRecord shouldPlaySound](self, "shouldPlaySound"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", -[CALNNotificationRecord hasAlertContent](self, "hasAlertContent"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p>(sourceIdentifier = %@, sourceClientIdentifier = %@, content = %@, shouldPresentAlert = %@, shouldPlaySound = %@, hasAlertContent = %@)"), v4, self, v5, v6, v7, v8, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  CALNMutableNotificationRecord *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  CALNMutableNotificationRecord *v9;

  v4 = +[CALNMutableNotificationRecord allocWithZone:](CALNMutableNotificationRecord, "allocWithZone:", a3);
  -[CALNNotificationRecord sourceIdentifier](self, "sourceIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[CALNNotificationRecord sourceClientIdentifier](self, "sourceClientIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[CALNNotificationRecord content](self, "content");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[CALNNotificationRecord date](self, "date");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[CALNNotificationRecord initWithSourceIdentifier:sourceClientIdentifier:content:date:shouldPresentAlert:shouldPlaySound:](v4, "initWithSourceIdentifier:sourceClientIdentifier:content:date:shouldPresentAlert:shouldPlaySound:", v5, v6, v7, v8, -[CALNNotificationRecord shouldPresentAlert](self, "shouldPresentAlert"), -[CALNNotificationRecord shouldPlaySound](self, "shouldPlaySound"));

  return v9;
}

- (NSString)sourceIdentifier
{
  return self->_sourceIdentifier;
}

- (NSString)sourceClientIdentifier
{
  return self->_sourceClientIdentifier;
}

- (CALNNotificationContent)content
{
  return self->_content;
}

- (NSDate)date
{
  return self->_date;
}

- (BOOL)shouldPresentAlert
{
  return self->_shouldPresentAlert;
}

- (BOOL)shouldPlaySound
{
  return self->_shouldPlaySound;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_date, 0);
  objc_storeStrong((id *)&self->_content, 0);
  objc_storeStrong((id *)&self->_sourceClientIdentifier, 0);
  objc_storeStrong((id *)&self->_sourceIdentifier, 0);
}

@end
