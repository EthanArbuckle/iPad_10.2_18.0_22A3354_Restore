@implementation _MPCNullPlaybackContext

- (Class)queueFeederClass
{
  return (Class)objc_opt_class();
}

- (_MPCNullPlaybackContext)initWithCoder:(id)a3
{
  id v4;
  _MPCNullPlaybackContext *v5;
  uint64_t v6;
  NSString *label;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_MPCNullPlaybackContext;
  v5 = -[_MPCNullPlaybackContext initWithCoder:](&v9, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("MPCNullPlaybackContextCodingKeyLabel"));
    v6 = objc_claimAutoreleasedReturnValue();
    label = v5->_label;
    v5->_label = (NSString *)v6;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)_MPCNullPlaybackContext;
  v4 = a3;
  -[_MPCNullPlaybackContext encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeObject:forKey:", self->_label, CFSTR("MPCNullPlaybackContextCodingKeyLabel"), v5.receiver, v5.super_class);

}

- (id)descriptionComponents
{
  void *v3;
  void *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)_MPCNullPlaybackContext;
  -[_MPCNullPlaybackContext descriptionComponents](&v6, sel_descriptionComponents);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "mutableCopy");

  objc_msgSend(v4, "setObject:forKeyedSubscript:", 0, CFSTR("actionAfterQueueLoad"));
  objc_msgSend(v4, "setObject:forKeyedSubscript:", 0, CFSTR("queueEndAction"));
  objc_msgSend(v4, "setObject:forKeyedSubscript:", 0, CFSTR("repeat/shuffle"));
  objc_msgSend(v4, "setObject:forKeyedSubscript:", self->_label, CFSTR("label"));
  objc_msgSend(v4, "setObject:forKeyedSubscript:", 0, CFSTR("featureName"));
  return v4;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;
  void *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)_MPCNullPlaybackContext;
  v4 = -[_MPCNullPlaybackContext copyWithZone:](&v7, sel_copyWithZone_, a3);
  -[_MPCNullPlaybackContext label](self, "label");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setLabel:", v5);

  return v4;
}

- (NSString)label
{
  return self->_label;
}

- (void)setLabel:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 144);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_label, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
