@implementation HFPlaceholder

- (HFPlaceholder)init
{
  HFPlaceholder *v2;
  uint64_t v3;
  NSUUID *uniqueIdentifier;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)HFPlaceholder;
  v2 = -[HFPlaceholder init](&v6, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
    v3 = objc_claimAutoreleasedReturnValue();
    uniqueIdentifier = v2->_uniqueIdentifier;
    v2->_uniqueIdentifier = (NSUUID *)v3;

  }
  return v2;
}

- (NSUUID)uniqueIdentifier
{
  return self->_uniqueIdentifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_uniqueIdentifier, 0);
}

@end
