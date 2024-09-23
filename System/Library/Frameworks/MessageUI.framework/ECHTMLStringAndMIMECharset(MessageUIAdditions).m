@implementation ECHTMLStringAndMIMECharset(MessageUIAdditions)

+ (uint64_t)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:()MessageUIAdditions
{
  void *v4;
  void *v5;
  id v6;

  v6 = a3;
  objc_msgSend(a1, "string");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "encodeObject:forKey:", v4, CFSTR("String"));

  objc_msgSend(a1, "charset");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "encodeObject:forKey:", v5, CFSTR("Charset"));

}

- (uint64_t)initWithCoder:()MessageUIAdditions
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("String"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("Charset"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(a1, "initWithString:charset:", v5, v6);

  return v7;
}

@end
