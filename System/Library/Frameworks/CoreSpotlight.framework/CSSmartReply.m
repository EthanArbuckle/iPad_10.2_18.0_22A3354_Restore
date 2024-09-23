@implementation CSSmartReply

- (CSSmartReply)initWithResponseText:(id)a3 isRichSmartReply:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  CSSmartReply *v7;
  CSSmartReply *v8;
  objc_super v10;

  v4 = a4;
  v6 = a3;
  v10.receiver = self;
  v10.super_class = (Class)CSSmartReply;
  v7 = -[CSSmartReply init](&v10, sel_init);
  v8 = v7;
  if (v7)
  {
    -[CSSmartReply setResponseText:](v7, "setResponseText:", v6);
    -[CSSmartReply setIsRichSmartReply:](v8, "setIsRichSmartReply:", v4);
  }

  return v8;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  -[CSSmartReply responseText](self, "responseText");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", v4, CFSTR("responseText"));

  objc_msgSend(v5, "encodeBool:forKey:", -[CSSmartReply isRichSmartReply](self, "isRichSmartReply"), CFSTR("isRichSmartReply"));
}

- (CSSmartReply)initWithCoder:(id)a3
{
  id v4;
  CSSmartReply *v5;
  void *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)CSSmartReply;
  v5 = -[CSSmartReply init](&v8, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("responseText"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[CSSmartReply setResponseText:](v5, "setResponseText:", v6);

    -[CSSmartReply setIsRichSmartReply:](v5, "setIsRichSmartReply:", objc_msgSend(v4, "decodeBoolForKey:", CFSTR("isRichSmartReply")));
  }

  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  CSSmartReply *v4;
  void *v5;
  CSSmartReply *v6;

  v4 = [CSSmartReply alloc];
  -[CSSmartReply responseText](self, "responseText");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[CSSmartReply initWithResponseText:isRichSmartReply:](v4, "initWithResponseText:isRichSmartReply:", v5, -[CSSmartReply isRichSmartReply](self, "isRichSmartReply"));

  return v6;
}

- (NSAttributedString)responseText
{
  return self->_responseText;
}

- (void)setResponseText:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (BOOL)isRichSmartReply
{
  return self->_isRichSmartReply;
}

- (void)setIsRichSmartReply:(BOOL)a3
{
  self->_isRichSmartReply = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_responseText, 0);
}

@end
