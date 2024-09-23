@implementation HKConceptQueryConfiguration

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;
  void *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)HKConceptQueryConfiguration;
  v4 = -[HKQueryServerConfiguration copyWithZone:](&v7, sel_copyWithZone_, a3);
  v5 = (void *)-[HKConceptSelection copy](self->_selection, "copy");
  objc_msgSend(v4, "setSelection:", v5);

  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (HKConceptQueryConfiguration)initWithCoder:(id)a3
{
  id v4;
  HKConceptQueryConfiguration *v5;
  uint64_t v6;
  HKConceptSelection *selection;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)HKConceptQueryConfiguration;
  v5 = -[HKQueryServerConfiguration initWithCoder:](&v9, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("Selection"));
    v6 = objc_claimAutoreleasedReturnValue();
    selection = v5->_selection;
    v5->_selection = (HKConceptSelection *)v6;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)HKConceptQueryConfiguration;
  v4 = a3;
  -[HKQueryServerConfiguration encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeObject:forKey:", self->_selection, CFSTR("Selection"), v5.receiver, v5.super_class);

}

- (HKConceptSelection)selection
{
  return self->_selection;
}

- (void)setSelection:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_selection, 0);
}

@end
