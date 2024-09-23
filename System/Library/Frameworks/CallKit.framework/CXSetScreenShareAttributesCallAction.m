@implementation CXSetScreenShareAttributesCallAction

- (CXSetScreenShareAttributesCallAction)initWithCallUUID:(id)a3 attributes:(id)a4
{
  id v7;
  CXSetScreenShareAttributesCallAction *v8;
  CXSetScreenShareAttributesCallAction *v9;
  objc_super v11;

  v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)CXSetScreenShareAttributesCallAction;
  v8 = -[CXCallAction initWithCallUUID:](&v11, sel_initWithCallUUID_, a3);
  v9 = v8;
  if (v8)
    objc_storeStrong((id *)&v8->_attributes, a4);

  return v9;
}

- (id)customDescription
{
  id v3;
  void *v4;
  void *v5;

  v3 = objc_alloc_init(MEMORY[0x1E0CB37A0]);
  -[CXSetScreenShareAttributesCallAction attributes](self, "attributes");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR(" attributes=%@"), v4);

  v5 = (void *)objc_msgSend(v3, "copy");
  return v5;
}

- (id)sanitizedCopyWithZone:(_NSZone *)a3
{
  return 0;
}

- (void)updateCopy:(id)a3 withZone:(_NSZone *)a4
{
  id v6;
  void *v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)CXSetScreenShareAttributesCallAction;
  v6 = a3;
  -[CXAction updateCopy:withZone:](&v8, sel_updateCopy_withZone_, v6, a4);
  -[CXSetScreenShareAttributesCallAction attributes](self, "attributes", v8.receiver, v8.super_class);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setAttributes:", v7);

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CXSetScreenShareAttributesCallAction)initWithCoder:(id)a3
{
  id v4;
  CXSetScreenShareAttributesCallAction *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  CXScreenShareAttributes *attributes;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)CXSetScreenShareAttributesCallAction;
  v5 = -[CXCallAction initWithCoder:](&v11, sel_initWithCoder_, v4);
  if (v5)
  {
    v6 = objc_opt_class();
    NSStringFromSelector(sel_attributes);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", v6, v7);
    v8 = objc_claimAutoreleasedReturnValue();
    attributes = v5->_attributes;
    v5->_attributes = (CXScreenShareAttributes *)v8;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)CXSetScreenShareAttributesCallAction;
  v4 = a3;
  -[CXCallAction encodeWithCoder:](&v7, sel_encodeWithCoder_, v4);
  -[CXSetScreenShareAttributesCallAction attributes](self, "attributes", v7.receiver, v7.super_class);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_attributes);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, v6);

}

- (CXScreenShareAttributes)attributes
{
  return self->_attributes;
}

- (void)setAttributes:(id)a3
{
  objc_storeStrong((id *)&self->_attributes, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_attributes, 0);
}

@end
