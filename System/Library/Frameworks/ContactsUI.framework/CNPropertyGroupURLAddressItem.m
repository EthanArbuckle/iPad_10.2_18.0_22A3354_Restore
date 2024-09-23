@implementation CNPropertyGroupURLAddressItem

- (id)displayStringForValue:(id)a3
{
  void *v3;
  void *v4;

  -[CNPropertyGroupURLAddressItem _urlWithUserString:](self, "_urlWithUserString:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_web_userVisibleString");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)defaultActionURL
{
  void *v3;
  void *v4;
  void *v5;

  -[CNPropertyGroupItem labeledValue](self, "labeledValue");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "value");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNPropertyGroupURLAddressItem _urlWithUserString:](self, "_urlWithUserString:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)_urlWithUserString:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;

  v3 = a3;
  if (objc_msgSend(v3, "length"))
  {
    v4 = (void *)MEMORY[0x18D7771C4]();
    objc_msgSend(MEMORY[0x1E0C99E98], "_web_URLWithUserTypedString:", v3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "scheme");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v6)
    {
      v7 = (void *)MEMORY[0x1E0C99E98];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("http://%@"), v3);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "_web_URLWithUserTypedString:", v8);
      v9 = objc_claimAutoreleasedReturnValue();

      v5 = (void *)v9;
    }
    objc_autoreleasePoolPop(v4);
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

@end
