@implementation CNPropertyGroupEmailAddressItem

- (id)defaultActionURL
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v2 = (void *)MEMORY[0x1E0CB3940];
  -[CNPropertyGroupItem labeledValue](self, "labeledValue");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "value");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3500], "URLPathAllowedCharacterSet");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringByAddingPercentEncodingWithAllowedCharacters:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringWithFormat:", CFSTR("mailto:%@"), v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

@end
