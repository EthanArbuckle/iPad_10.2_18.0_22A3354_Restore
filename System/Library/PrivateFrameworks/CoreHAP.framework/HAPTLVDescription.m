@implementation HAPTLVDescription

- (HAPTLVDescription)descriptionWithIndent:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v4 = a3;
  objc_msgSend(v4, "indentationByLevels:", 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37A0], "string");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("\n%@{"), v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "appendString:", v7);

  -[HAPTLVDescription description:indent:](self, "description:indent:", v6, v5);
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("\n%@}"), v4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "appendString:", v8);
  return (HAPTLVDescription *)v6;
}

- (id)description
{
  void *v3;
  void *v4;

  objc_msgSend(MEMORY[0x1E0D286B0], "indentation");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[HAPTLVDescription descriptionWithIndent:](self, "descriptionWithIndent:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

@end
