@implementation IKCSSParseStylesheet

- (id)description
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v2 = (void *)MEMORY[0x1E0CB3940];
  -[IKCSSParseStylesheet cssValue](self, "cssValue");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "toNSArray");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[IKCSSParseObject stringifyList:](IKCSSParseObject, "stringifyList:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringWithFormat:", CFSTR("\"IKCascasingStyleSheet\": {\"value\":%@}"), v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (IKArray)cssValue
{
  return self->_cssValue;
}

- (void)setCssValue:(id)a3
{
  objc_storeStrong((id *)&self->_cssValue, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cssValue, 0);
}

@end
