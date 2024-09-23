@implementation MXMSampleTagFilter

- (MXMSampleTagFilter)initWithTag:(id)a3 allowDescendents:(BOOL)a4
{
  void *v6;
  MXMSampleTagFilter *v7;
  objc_super v9;

  objc_msgSend(a3, "domainNameString");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v9.receiver = self;
  v9.super_class = (Class)MXMSampleTagFilter;
  v7 = -[MXMSampleTag initWithDNString:](&v9, sel_initWithDNString_, v6);

  if (v7)
    v7->_allowDescendents = a4;
  return v7;
}

- (BOOL)matchesSampleWithTag:(id)a3
{
  id v4;
  BOOL v5;

  v4 = a3;
  if (-[MXMSampleTag isEqualToTag:](self, "isEqualToTag:", v4))
    v5 = 1;
  else
    v5 = self->_allowDescendents && -[MXMSampleTag containsTag:](self, "containsTag:", v4);

  return v5;
}

- (BOOL)finite
{
  return 1;
}

- (id)copy
{
  return -[MXMSampleTagFilter copyWithZone:](self, "copyWithZone:", 0);
}

- (id)copyWithZone:(_NSZone *)a3
{
  return -[MXMSampleTagFilter initWithTag:allowDescendents:]([MXMSampleTagFilter alloc], "initWithTag:allowDescendents:", self, self->_allowDescendents);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)MXMSampleTagFilter;
  v4 = a3;
  -[MXMSampleTag encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeBool:forKey:", self->_allowDescendents, CFSTR("_allowDescendents"), v5.receiver, v5.super_class);

}

- (MXMSampleTagFilter)initWithCoder:(id)a3
{
  id v4;
  MXMSampleTagFilter *v5;
  objc_super v7;

  v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)MXMSampleTagFilter;
  v5 = -[MXMSampleTag initWithCoder:](&v7, sel_initWithCoder_, v4);
  if (v5)
    v5->_allowDescendents = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("_allowDescendents"));

  return v5;
}

- (NSSet)tagPermutations
{
  return self->_tagPermutations;
}

- (void)setTagPermutations:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tagPermutations, 0);
}

@end
