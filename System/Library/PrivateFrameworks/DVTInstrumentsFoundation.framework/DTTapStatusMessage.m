@implementation DTTapStatusMessage

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (DTTapStatusMessage)initWithStatus:(unsigned int)a3 timestamp:(unint64_t)a4 notice:(id)a5 info:(id)a6
{
  uint64_t v8;
  id v10;
  id v11;
  DTTapStatusMessage *v12;
  DTTapStatusMessage *v13;
  objc_super v15;

  v8 = *(_QWORD *)&a3;
  v10 = a5;
  v11 = a6;
  v15.receiver = self;
  v15.super_class = (Class)DTTapStatusMessage;
  v12 = -[DTTapMessage initAsKind:](&v15, sel_initAsKind_, 8);
  v13 = v12;
  if (v12)
  {
    -[DTTapStatusMessage setStatus:](v12, "setStatus:", v8);
    -[DTTapStatusMessage setTimestamp:](v13, "setTimestamp:", a4);
    -[DTTapStatusMessage setNotice:](v13, "setNotice:", v10);
    if (v11)
      -[DTTapStatusMessage setInfo:](v13, "setInfo:", v11);
  }

  return v13;
}

- (unsigned)status
{
  void *v2;
  void *v3;
  unsigned int v4;

  -[DTTapMessage plist](self, "plist");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", CFSTR("status"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "unsignedIntegerValue");

  return v4;
}

- (void)setStatus:(unsigned int)a3
{
  void *v4;
  id v5;

  -[DTTapMessage plist](self, "plist");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKey:", v4, CFSTR("status"));

}

- (unint64_t)timestamp
{
  void *v2;
  void *v3;
  unint64_t v4;

  -[DTTapMessage plist](self, "plist");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", CFSTR("ts"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "unsignedLongLongValue");

  return v4;
}

- (void)setTimestamp:(unint64_t)a3
{
  void *v4;
  id v5;

  -[DTTapMessage plist](self, "plist");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKey:", v4, CFSTR("ts"));

}

- (NSString)notice
{
  void *v2;
  void *v3;

  -[DTTapMessage plist](self, "plist");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", CFSTR("notice"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (void)setNotice:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[DTTapMessage plist](self, "plist");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v4, "copy");

  objc_msgSend(v6, "setObject:forKey:", v5, CFSTR("notice"));
}

- (NSDictionary)info
{
  void *v2;
  void *v3;

  -[DTTapMessage plist](self, "plist");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", CFSTR("info"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDictionary *)v3;
}

- (void)setInfo:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[DTTapMessage plist](self, "plist");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v4, "copy");

  objc_msgSend(v6, "setObject:forKey:", v5, CFSTR("info"));
}

@end
