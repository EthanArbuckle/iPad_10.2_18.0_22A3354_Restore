@implementation BCSStringData

- (BCSStringData)initWithString:(id)a3
{
  id v4;
  BCSStringData *v5;
  uint64_t v6;
  NSString *extraPreviewText;
  BCSStringData *v8;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)BCSStringData;
  v5 = -[BCSStringData init](&v10, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    extraPreviewText = v5->_extraPreviewText;
    v5->_extraPreviewText = (NSString *)v6;

    v8 = v5;
  }

  return v5;
}

- (int64_t)type
{
  return 10;
}

- (BCSStringData)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  BCSStringData *v6;

  v4 = a3;
  objc_msgSend(v4, "_bcs_strictlyDecodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("extraPreviewText"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = -[BCSStringData initWithString:](self, "initWithString:", v5);
  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  objc_msgSend(a3, "encodeObject:forKey:", self->_extraPreviewText, CFSTR("extraPreviewText"));
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSString)extraPreviewText
{
  return self->_extraPreviewText;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_extraPreviewText, 0);
}

@end
