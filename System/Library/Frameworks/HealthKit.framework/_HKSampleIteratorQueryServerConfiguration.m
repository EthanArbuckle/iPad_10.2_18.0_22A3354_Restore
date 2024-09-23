@implementation _HKSampleIteratorQueryServerConfiguration

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)_HKSampleIteratorQueryServerConfiguration;
  v4 = -[HKQueryServerConfiguration copyWithZone:](&v6, sel_copyWithZone_, a3);
  objc_msgSend(v4, "setQueryCursor:", self->_queryCursor);
  objc_msgSend(v4, "setLimit:", self->_limit);
  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (_HKSampleIteratorQueryServerConfiguration)initWithCoder:(id)a3
{
  id v4;
  _HKSampleIteratorQueryServerConfiguration *v5;
  uint64_t v6;
  HKSampleIteratorQueryCursor *queryCursor;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_HKSampleIteratorQueryServerConfiguration;
  v5 = -[HKQueryServerConfiguration initWithCoder:](&v9, sel_initWithCoder_, v4);
  if (v5)
  {
    v5->_limit = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("limit"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("queryCursor"));
    v6 = objc_claimAutoreleasedReturnValue();
    queryCursor = v5->_queryCursor;
    v5->_queryCursor = (HKSampleIteratorQueryCursor *)v6;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)_HKSampleIteratorQueryServerConfiguration;
  v4 = a3;
  -[HKQueryServerConfiguration encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeInteger:forKey:", self->_limit, CFSTR("limit"), v5.receiver, v5.super_class);
  objc_msgSend(v4, "encodeObject:forKey:", self->_queryCursor, CFSTR("queryCursor"));

}

- (HKSampleIteratorQueryCursor)queryCursor
{
  return self->_queryCursor;
}

- (void)setQueryCursor:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
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
  objc_storeStrong((id *)&self->_queryCursor, 0);
}

@end
