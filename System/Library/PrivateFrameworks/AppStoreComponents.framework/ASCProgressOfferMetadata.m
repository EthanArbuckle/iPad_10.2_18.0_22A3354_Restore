@implementation ASCProgressOfferMetadata

- (ASCProgressOfferMetadata)initWithPercent:(double)a3
{
  ASCProgressOfferMetadata *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)ASCProgressOfferMetadata;
  result = -[ASCOfferMetadata _init](&v5, sel__init);
  if (result)
    result->_percent = a3;
  return result;
}

- (id)initIndeterminate
{
  id result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)ASCProgressOfferMetadata;
  result = -[ASCOfferMetadata _init](&v3, sel__init);
  if (result)
    *((_QWORD *)result + 2) = 0x7FF0000000000000;
  return result;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (ASCProgressOfferMetadata)initWithCoder:(id)a3
{
  id v4;
  ASCProgressOfferMetadata *v5;
  double v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)ASCProgressOfferMetadata;
  v5 = -[ASCOfferMetadata initWithCoder:](&v8, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("percent"));
    v5->_percent = v6;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)ASCProgressOfferMetadata;
  v4 = a3;
  -[ASCOfferMetadata encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  -[ASCProgressOfferMetadata percent](self, "percent", v5.receiver, v5.super_class);
  objc_msgSend(v4, "encodeDouble:forKey:", CFSTR("percent"));

}

- (unint64_t)hash
{
  ASCHasher *v3;
  double v4;
  unint64_t v5;

  v3 = objc_alloc_init(ASCHasher);
  -[ASCProgressOfferMetadata percent](self, "percent");
  -[ASCHasher combineInteger:](v3, "combineInteger:", (uint64_t)v4);
  v5 = -[ASCHasher finalizeHash](v3, "finalizeHash");

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  id v5;
  void *v6;
  id v7;
  double v8;
  double v9;
  double v10;
  BOOL v11;

  v4 = a3;
  objc_opt_class();
  v5 = v4;
  if (v5)
  {
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v6 = v5;
    else
      v6 = 0;
  }
  else
  {
    v6 = 0;
  }
  v7 = v6;

  if (v7)
  {
    -[ASCProgressOfferMetadata percent](self, "percent");
    v9 = v8;
    objc_msgSend(v7, "percent");
    v11 = v9 == v10;
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (id)description
{
  ASCDescriber *v3;
  void *v4;

  v3 = -[ASCDescriber initWithObject:]([ASCDescriber alloc], "initWithObject:", self);
  -[ASCProgressOfferMetadata percent](self, "percent");
  -[ASCDescriber addDouble:withName:](v3, "addDouble:withName:", CFSTR("percent"));
  -[ASCDescriber finalizeDescription](v3, "finalizeDescription");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (BOOL)isProgress
{
  return 1;
}

- (BOOL)isIndeterminate
{
  double v2;

  -[ASCProgressOfferMetadata percent](self, "percent");
  return fabs(v2) == INFINITY;
}

- (double)percent
{
  return self->_percent;
}

- (void)setIndeterminate:(BOOL)a3
{
  self->_indeterminate = a3;
}

@end
