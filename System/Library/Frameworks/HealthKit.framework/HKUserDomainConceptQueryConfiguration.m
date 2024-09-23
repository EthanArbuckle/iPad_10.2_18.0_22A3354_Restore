@implementation HKUserDomainConceptQueryConfiguration

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;
  void *v5;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)HKUserDomainConceptQueryConfiguration;
  v4 = -[HKQueryServerConfiguration copyWithZone:](&v8, sel_copyWithZone_, a3);
  v5 = (void *)-[HKQueryAnchor copy](self->_anchor, "copy");
  objc_msgSend(v4, "setAnchor:", v5);

  v6 = (void *)-[NSArray copy](self->_sortDescriptors, "copy");
  objc_msgSend(v4, "setSortDescriptors:", v6);

  objc_msgSend(v4, "setLimit:", self->_limit);
  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (HKUserDomainConceptQueryConfiguration)initWithCoder:(id)a3
{
  id v4;
  HKUserDomainConceptQueryConfiguration *v5;
  uint64_t v6;
  HKQueryAnchor *anchor;
  void *v8;
  uint64_t v9;
  NSArray *sortDescriptors;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)HKUserDomainConceptQueryConfiguration;
  v5 = -[HKQueryServerConfiguration initWithCoder:](&v12, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("anchor"));
    v6 = objc_claimAutoreleasedReturnValue();
    anchor = v5->_anchor;
    v5->_anchor = (HKQueryAnchor *)v6;

    v5->_limit = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("limit"));
    objc_msgSend(MEMORY[0x1E0C99E60], "hk_typesForArrayOf:", objc_opt_class());
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v8, CFSTR("sortDescriptors"));
    v9 = objc_claimAutoreleasedReturnValue();
    sortDescriptors = v5->_sortDescriptors;
    v5->_sortDescriptors = (NSArray *)v9;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)HKUserDomainConceptQueryConfiguration;
  v4 = a3;
  -[HKQueryServerConfiguration encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeObject:forKey:", self->_anchor, CFSTR("anchor"), v5.receiver, v5.super_class);
  objc_msgSend(v4, "encodeObject:forKey:", self->_sortDescriptors, CFSTR("sortDescriptors"));
  objc_msgSend(v4, "encodeInteger:forKey:", self->_limit, CFSTR("limit"));

}

- (NSArray)sortDescriptors
{
  return self->_sortDescriptors;
}

- (void)setSortDescriptors:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (HKQueryAnchor)anchor
{
  return self->_anchor;
}

- (void)setAnchor:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (unint64_t)limit
{
  return self->_limit;
}

- (void)setLimit:(unint64_t)a3
{
  self->_limit = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_anchor, 0);
  objc_storeStrong((id *)&self->_sortDescriptors, 0);
}

@end
