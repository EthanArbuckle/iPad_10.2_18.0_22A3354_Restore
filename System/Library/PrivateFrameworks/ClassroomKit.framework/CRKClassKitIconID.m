@implementation CRKClassKitIconID

- (CRKClassKitIconID)initWithClass:(id)a3
{
  void *v4;
  CRKClassKitIconID *v5;

  objc_msgSend(a3, "iconID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[CRKClassKitIconID initWithIconID:](self, "initWithIconID:", v4);

  return v5;
}

- (CRKClassKitIconID)initWithIconID:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  CRKClassKitIconID *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;

  v4 = a3;
  v5 = v4;
  if (v4)
  {
    v6 = objc_msgSend(v4, "rangeOfString:options:", CFSTR("*"), 4);
    if (v6 == 0x7FFFFFFFFFFFFFFFLL)
    {
      objc_msgSend((id)objc_opt_class(), "stringBySanitizingString:", v5);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = -[CRKClassKitIconID initWithMascotIdentifier:colorIdentifier:](self, "initWithMascotIdentifier:colorIdentifier:", v8, 0);

    }
    else
    {
      v10 = v6;
      v11 = v7;
      objc_msgSend(v5, "substringToIndex:", v6);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "substringFromIndex:", v10 + v11);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend((id)objc_opt_class(), "stringBySanitizingString:", v12);
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend((id)objc_opt_class(), "stringBySanitizingString:", v13);
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      v9 = -[CRKClassKitIconID initWithMascotIdentifier:colorIdentifier:](self, "initWithMascotIdentifier:colorIdentifier:", v14, v15);
    }
  }
  else
  {
    v9 = -[CRKClassKitIconID initWithMascotIdentifier:colorIdentifier:](self, "initWithMascotIdentifier:colorIdentifier:", 0, 0);
  }

  return v9;
}

+ (id)stringBySanitizingString:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  id v7;

  v3 = (void *)MEMORY[0x24BDD14A8];
  v4 = a3;
  objc_msgSend(v3, "whitespaceCharacterSet");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringByTrimmingCharactersInSet:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v6, "length") && (objc_msgSend(v6, "isEqualToString:", CFSTR("(null)")) & 1) == 0)
    v7 = v6;
  else
    v7 = 0;

  return v7;
}

- (CRKClassKitIconID)init
{
  return -[CRKClassKitIconID initWithMascotIdentifier:colorIdentifier:](self, "initWithMascotIdentifier:colorIdentifier:", 0, 0);
}

- (CRKClassKitIconID)initWithMascotIdentifier:(id)a3 colorIdentifier:(id)a4
{
  id v6;
  id v7;
  CRKClassKitIconID *v8;
  uint64_t v9;
  NSString *mascotIdentifier;
  uint64_t v11;
  NSString *colorIdentifier;
  objc_super v14;

  v6 = a3;
  v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)CRKClassKitIconID;
  v8 = -[CRKClassKitIconID init](&v14, sel_init);
  if (v8)
  {
    v9 = objc_msgSend(v6, "copy");
    mascotIdentifier = v8->_mascotIdentifier;
    v8->_mascotIdentifier = (NSString *)v9;

    v11 = objc_msgSend(v7, "copy");
    colorIdentifier = v8->_colorIdentifier;
    v8->_colorIdentifier = (NSString *)v11;

  }
  return v8;
}

- (NSString)stringValue
{
  uint64_t v3;
  void *v4;
  __CFString *v5;
  __CFString *v6;
  uint64_t v7;
  void *v8;
  __CFString *v9;
  __CFString *v10;
  void *v11;

  -[CRKClassKitIconID mascotIdentifier](self, "mascotIdentifier");
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = (void *)v3;
  if (v3)
    v5 = (__CFString *)v3;
  else
    v5 = &stru_24D9CB490;
  v6 = v5;

  -[CRKClassKitIconID colorIdentifier](self, "colorIdentifier");
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = (void *)v7;
  if (v7)
    v9 = (__CFString *)v7;
  else
    v9 = &stru_24D9CB490;
  v10 = v9;

  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@*%@"), v6, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v11;
}

- (NSString)mascotIdentifier
{
  return self->_mascotIdentifier;
}

- (void)setMascotIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSString)colorIdentifier
{
  return self->_colorIdentifier;
}

- (void)setColorIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_colorIdentifier, 0);
  objc_storeStrong((id *)&self->_mascotIdentifier, 0);
}

@end
