@implementation HDLocalFeatureAttributesProvider

- (HDLocalFeatureAttributesProvider)initWithLocalFeatureAttributes:(id)a3
{
  id v4;
  HDLocalFeatureAttributesProvider *v5;
  uint64_t v6;
  HKFeatureAttributes *localFeatureAttributes;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)HDLocalFeatureAttributesProvider;
  v5 = -[HDLocalFeatureAttributesProvider init](&v9, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    localFeatureAttributes = v5->_localFeatureAttributes;
    v5->_localFeatureAttributes = (HKFeatureAttributes *)v6;

  }
  return v5;
}

- (HKPairedFeatureAttributes)currentPairedFeatureAttributes
{
  return (HKPairedFeatureAttributes *)(id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB69D0]), "initWithLocalAttributes:pairedAttributes:", self->_localFeatureAttributes, 0);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_localFeatureAttributes, 0);
}

@end
