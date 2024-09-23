@implementation HKPairedFeatureAttributes

- (HKPairedFeatureAttributes)initWithLocalAttributes:(id)a3 pairedAttributes:(id)a4
{
  id v6;
  id v7;
  HKPairedFeatureAttributes *v8;
  uint64_t v9;
  HKFeatureAttributes *localAttributes;
  uint64_t v11;
  HKFeatureAttributes *pairedAttributes;
  objc_super v14;

  v6 = a3;
  v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)HKPairedFeatureAttributes;
  v8 = -[HKPairedFeatureAttributes init](&v14, sel_init);
  if (v8)
  {
    v9 = objc_msgSend(v6, "copy");
    localAttributes = v8->_localAttributes;
    v8->_localAttributes = (HKFeatureAttributes *)v9;

    v11 = objc_msgSend(v7, "copy");
    pairedAttributes = v8->_pairedAttributes;
    v8->_pairedAttributes = (HKFeatureAttributes *)v11;

  }
  return v8;
}

- (HKFeatureAttributes)companionAttributes
{
  void *v3;
  int v4;
  uint64_t v5;
  HKFeatureAttributes *v6;

  +[_HKBehavior sharedBehavior](_HKBehavior, "sharedBehavior");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isAppleWatch");
  v5 = 8;
  if (v4)
    v5 = 16;
  v6 = (HKFeatureAttributes *)*(id *)((char *)&self->super.isa + v5);

  return v6;
}

- (HKFeatureAttributes)watchAttributes
{
  void *v3;
  int v4;
  uint64_t v5;
  HKFeatureAttributes *v6;

  +[_HKBehavior sharedBehavior](_HKBehavior, "sharedBehavior");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isAppleWatch");
  v5 = 16;
  if (v4)
    v5 = 8;
  v6 = (HKFeatureAttributes *)*(id *)((char *)&self->super.isa + v5);

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  char v5;
  _QWORD *v6;
  HKFeatureAttributes *localAttributes;
  HKFeatureAttributes *v8;
  HKFeatureAttributes *pairedAttributes;
  HKFeatureAttributes *v10;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)HKPairedFeatureAttributes;
  if (!-[HKPairedFeatureAttributes isEqual:](&v12, sel_isEqual_, v4))
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v5 = 0;
      goto LABEL_14;
    }
    v6 = v4;
    localAttributes = self->_localAttributes;
    v8 = (HKFeatureAttributes *)v6[1];
    if (localAttributes != v8 && (!v8 || !-[HKFeatureAttributes isEqual:](localAttributes, "isEqual:")))
      goto LABEL_11;
    pairedAttributes = self->_pairedAttributes;
    v10 = (HKFeatureAttributes *)v6[2];
    if (pairedAttributes == v10)
    {
      v5 = 1;
      goto LABEL_13;
    }
    if (v10)
      v5 = -[HKFeatureAttributes isEqual:](pairedAttributes, "isEqual:");
    else
LABEL_11:
      v5 = 0;
LABEL_13:

    goto LABEL_14;
  }
  v5 = 1;
LABEL_14:

  return v5;
}

- (unint64_t)hash
{
  unint64_t v3;

  v3 = -[HKFeatureAttributes hash](self->_localAttributes, "hash");
  return -[HKFeatureAttributes hash](self->_pairedAttributes, "hash") ^ v3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (HKPairedFeatureAttributes)initWithCoder:(id)a3
{
  id v4;
  HKPairedFeatureAttributes *v5;
  uint64_t v6;
  HKFeatureAttributes *localAttributes;
  uint64_t v8;
  HKFeatureAttributes *pairedAttributes;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)HKPairedFeatureAttributes;
  v5 = -[HKPairedFeatureAttributes init](&v11, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("localAttributes"));
    v6 = objc_claimAutoreleasedReturnValue();
    localAttributes = v5->_localAttributes;
    v5->_localAttributes = (HKFeatureAttributes *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("pairedAttributes"));
    v8 = objc_claimAutoreleasedReturnValue();
    pairedAttributes = v5->_pairedAttributes;
    v5->_pairedAttributes = (HKFeatureAttributes *)v8;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  HKFeatureAttributes *localAttributes;
  id v5;

  localAttributes = self->_localAttributes;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", localAttributes, CFSTR("localAttributes"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_pairedAttributes, CFSTR("pairedAttributes"));

}

- (HKFeatureAttributes)localAttributes
{
  return self->_localAttributes;
}

- (HKFeatureAttributes)pairedAttributes
{
  return self->_pairedAttributes;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pairedAttributes, 0);
  objc_storeStrong((id *)&self->_localAttributes, 0);
}

@end
