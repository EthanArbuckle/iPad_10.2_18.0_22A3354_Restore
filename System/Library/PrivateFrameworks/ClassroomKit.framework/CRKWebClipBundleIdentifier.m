@implementation CRKWebClipBundleIdentifier

+ (id)bundleIdentifierByLocatingWebClipBundleIdentifierInString:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;

  v4 = a3;
  v5 = objc_alloc((Class)a1);
  objc_msgSend(a1, "webClipBundleIdentifierInString:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = (void *)objc_msgSend(v5, "initWithString:", v6);
  return v7;
}

+ (id)webClipBundleIdentifierInString:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;

  v4 = a3;
  objc_msgSend(a1, "webClipHostApplicationBundleIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "rangeOfString:", v5);

  if (v6 == 0x7FFFFFFFFFFFFFFFLL)
  {
    v7 = 0;
  }
  else
  {
    objc_msgSend(v4, "substringFromIndex:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v7;
}

- (CRKWebClipBundleIdentifier)init
{
  return -[CRKWebClipBundleIdentifier initWithString:](self, "initWithString:", 0);
}

- (CRKWebClipBundleIdentifier)initWithString:(id)a3
{
  id v4;
  CRKWebClipBundleIdentifier *v5;
  uint64_t v6;
  NSString *stringValue;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CRKWebClipBundleIdentifier;
  v5 = -[CRKWebClipBundleIdentifier init](&v9, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    stringValue = v5->_stringValue;
    v5->_stringValue = (NSString *)v6;

  }
  return v5;
}

- (BOOL)isWebClipHostApplication
{
  void *v2;
  void *v3;
  char v4;

  -[CRKWebClipBundleIdentifier stringValue](self, "stringValue");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "webClipHostApplicationBundleIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v2, "isEqualToString:", v3);

  return v4;
}

- (BOOL)isSpecificWebClip
{
  void *v2;
  void *v3;
  char v4;

  -[CRKWebClipBundleIdentifier stringValue](self, "stringValue");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "specificWebClipPrefix");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v2, "hasPrefix:", v3);

  return v4;
}

+ (id)webClipHostApplicationBundleIdentifier
{
  return CFSTR("com.apple.webapp");
}

+ (id)specificWebClipPrefix
{
  void *v2;
  void *v3;

  objc_msgSend(a1, "webClipHostApplicationBundleIdentifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringByAppendingString:", CFSTR("-"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (NSString)stringValue
{
  return self->_stringValue;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_stringValue, 0);
}

@end
