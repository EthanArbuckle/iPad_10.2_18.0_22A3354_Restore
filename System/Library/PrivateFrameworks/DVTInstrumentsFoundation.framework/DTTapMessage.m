@implementation DTTapMessage

+ (void)initialize
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;

  if ((id)objc_opt_class() == a1)
  {
    v2 = (void *)MEMORY[0x24BDBCF20];
    v3 = objc_opt_class();
    v4 = objc_opt_class();
    v5 = objc_opt_class();
    v6 = objc_opt_class();
    objc_msgSend(v2, "setWithObjects:", v3, v4, v5, v6, objc_opt_class(), 0);
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = (void *)qword_25576FAA0;
    qword_25576FAA0 = v7;

  }
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (DTTapMessage)init
{
  DTTapMessage *v2;
  uint64_t v3;
  NSMutableDictionary *plist;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)DTTapMessage;
  v2 = -[DTTapMessage init](&v6, sel_init);
  if (v2)
  {
    v3 = objc_opt_new();
    plist = v2->_plist;
    v2->_plist = (NSMutableDictionary *)v3;

    -[DTTapMessage setKind:](v2, "setKind:", 0xFFFFFFFFLL);
  }
  return v2;
}

- (id)initAsKind:(int)a3
{
  uint64_t v3;
  DTTapMessage *v4;
  uint64_t v5;
  NSMutableDictionary *plist;
  objc_super v8;

  v3 = *(_QWORD *)&a3;
  v8.receiver = self;
  v8.super_class = (Class)DTTapMessage;
  v4 = -[DTTapMessage init](&v8, sel_init);
  if (v4)
  {
    v5 = objc_opt_new();
    plist = v4->_plist;
    v4->_plist = (NSMutableDictionary *)v5;

    -[DTTapMessage setKind:](v4, "setKind:", v3);
  }
  return v4;
}

- (DTTapMessage)initWithCoder:(id)a3
{
  id v4;
  DTTapMessage *v5;
  void *v6;
  uint64_t v7;
  NSMutableDictionary *plist;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)DTTapMessage;
  v5 = -[DTTapMessage init](&v10, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", qword_25576FAA0, CFSTR("DTTapMessagePlist"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v6)
    {
      objc_msgSend(v4, "decodeObjectOfClasses:forKey:", qword_25576FAA0, CFSTR("$$0"));
      v6 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v7 = objc_msgSend(v6, "mutableCopy");
    plist = v5->_plist;
    v5->_plist = (NSMutableDictionary *)v7;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  objc_msgSend(a3, "encodeObject:forKey:", self->_plist, CFSTR("DTTapMessagePlist"));
}

- (id)plist
{
  return self->_plist;
}

- (int)kind
{
  void *v2;
  void *v3;
  int v4;

  -[DTTapMessage plist](self, "plist");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", CFSTR("k"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "intValue");

  return v4;
}

- (void)setKind:(int)a3
{
  uint64_t v3;
  void *v4;
  id v5;

  v3 = *(_QWORD *)&a3;
  -[DTTapMessage plist](self, "plist");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKey:", v4, CFSTR("k"));

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_plist, 0);
}

@end
