@implementation BKSTouchAnnotation

- (id)succinctDescription
{
  void *v2;
  void *v3;

  -[BKSTouchAnnotation succinctDescriptionBuilder](self, "succinctDescriptionBuilder");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "build");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)succinctDescriptionBuilder
{
  return (id)objc_msgSend(MEMORY[0x1E0D01748], "builderWithObject:", self);
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  void *v3;
  void *v4;

  -[BKSTouchAnnotation descriptionBuilderWithMultilinePrefix:](self, "descriptionBuilderWithMultilinePrefix:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "build");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  void *v4;
  id v5;
  id v6;
  NSString *uniqueIdentifier;
  id v8;

  -[BKSTouchAnnotation succinctDescriptionBuilder](self, "succinctDescriptionBuilder", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (id)objc_msgSend(v4, "appendUnsignedInt:withName:", self->_touchIdentifier, CFSTR("touchIdentifier"));
  v6 = (id)objc_msgSend(v4, "appendObject:withName:", self->_text, CFSTR("text"));
  uniqueIdentifier = self->_uniqueIdentifier;
  if (uniqueIdentifier)
    v8 = (id)objc_msgSend(v4, "appendObject:withName:", uniqueIdentifier, CFSTR("uniqueIdentifier"));
  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  uint64_t touchIdentifier;
  id v5;

  touchIdentifier = self->_touchIdentifier;
  v5 = a3;
  objc_msgSend(v5, "encodeInt32:forKey:", touchIdentifier, CFSTR("touchIdentifier"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_text, CFSTR("text"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_uniqueIdentifier, CFSTR("uniqueIdentifier"));

}

- (BKSTouchAnnotation)initWithCoder:(id)a3
{
  id v4;
  BKSTouchAnnotation *v5;
  uint64_t v6;
  NSString *text;
  uint64_t v8;
  NSString *uniqueIdentifier;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)BKSTouchAnnotation;
  v5 = -[BKSTouchAnnotation init](&v11, sel_init);
  if (v5)
  {
    v5->_touchIdentifier = objc_msgSend(v4, "decodeInt32ForKey:", CFSTR("touchIdentifier"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("text"));
    v6 = objc_claimAutoreleasedReturnValue();
    text = v5->_text;
    v5->_text = (NSString *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("uniqueIdentifier"));
    v8 = objc_claimAutoreleasedReturnValue();
    uniqueIdentifier = v5->_uniqueIdentifier;
    v5->_uniqueIdentifier = (NSString *)v8;

  }
  return v5;
}

- (unsigned)touchIdentifier
{
  return self->_touchIdentifier;
}

- (void)setTouchIdentifier:(unsigned int)a3
{
  self->_touchIdentifier = a3;
}

- (NSString)text
{
  return self->_text;
}

- (void)setText:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSString)uniqueIdentifier
{
  return self->_uniqueIdentifier;
}

- (void)setUniqueIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_uniqueIdentifier, 0);
  objc_storeStrong((id *)&self->_text, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
