@implementation BCSInvalidParsedData

- (BCSInvalidParsedData)initWithInvalidDataType:(int64_t)a3 invalidContents:(id)a4
{
  id v6;
  BCSInvalidParsedData *v7;
  BCSInvalidParsedData *v8;
  uint64_t v9;
  NSString *invalidContents;
  BCSInvalidParsedData *v11;
  objc_super v13;

  v6 = a4;
  v13.receiver = self;
  v13.super_class = (Class)BCSInvalidParsedData;
  v7 = -[BCSInvalidParsedData init](&v13, sel_init);
  v8 = v7;
  if (v7)
  {
    v7->_invalidDataType = a3;
    v9 = objc_msgSend(v6, "copy");
    invalidContents = v8->_invalidContents;
    v8->_invalidContents = (NSString *)v9;

    v11 = v8;
  }

  return v8;
}

- (int64_t)type
{
  return 0;
}

- (NSString)extraPreviewText
{
  return 0;
}

- (BCSInvalidParsedData)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  BCSInvalidParsedData *v7;
  void *v8;

  v4 = a3;
  objc_msgSend(v4, "_bcs_strictlyDecodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("invalidDataType"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "_bcs_strictlyDecodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("invalidContents"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[BCSInvalidParsedData initWithInvalidDataType:invalidContents:](self, "initWithInvalidDataType:invalidContents:", objc_msgSend(v5, "integerValue"), v6);
  objc_msgSend(v4, "_bcs_strictlyDecodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("invalidURLScheme"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v8, "length"))
    -[BCSInvalidParsedData setInvalidURLScheme:](v7, "setInvalidURLScheme:", v8);

  return v7;
}

- (void)encodeWithCoder:(id)a3
{
  int64_t invalidDataType;
  id v5;

  invalidDataType = self->_invalidDataType;
  v5 = a3;
  objc_msgSend(v5, "encodeInteger:forKey:", invalidDataType, CFSTR("invalidDataType"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_invalidContents, CFSTR("invalidContents"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_invalidURLScheme, CFSTR("invalidURLScheme"));

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (int64_t)invalidDataType
{
  return self->_invalidDataType;
}

- (NSString)invalidContents
{
  return self->_invalidContents;
}

- (void)setInvalidContents:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSString)invalidURLScheme
{
  return self->_invalidURLScheme;
}

- (void)setInvalidURLScheme:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_invalidURLScheme, 0);
  objc_storeStrong((id *)&self->_invalidContents, 0);
}

@end
