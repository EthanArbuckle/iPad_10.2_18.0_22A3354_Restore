@implementation WFContentItemPrivacyConfiguration

- (WFContentItemPrivacyConfiguration)initWithOrigin:(id)a3 disclosureLevel:(unint64_t)a4 disclosureWarnings:(id)a5
{
  id v9;
  id v10;
  WFContentItemPrivacyConfiguration *v11;
  WFContentItemPrivacyConfiguration *v12;
  uint64_t v13;
  NSOrderedSet *disclosureWarnings;
  WFContentItemPrivacyConfiguration *v15;
  objc_super v17;

  v9 = a3;
  v10 = a5;
  v17.receiver = self;
  v17.super_class = (Class)WFContentItemPrivacyConfiguration;
  v11 = -[WFContentItemPrivacyConfiguration init](&v17, sel_init);
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_origin, a3);
    v12->_disclosureLevel = a4;
    objc_msgSend(MEMORY[0x24BDBCF00], "orderedSetWithArray:", v10);
    v13 = objc_claimAutoreleasedReturnValue();
    disclosureWarnings = v12->_disclosureWarnings;
    v12->_disclosureWarnings = (NSOrderedSet *)v13;

    v15 = v12;
  }

  return v12;
}

- (WFContentLocation)origin
{
  return self->_origin;
}

- (unint64_t)disclosureLevel
{
  return self->_disclosureLevel;
}

- (void)setDisclosureLevel:(unint64_t)a3
{
  self->_disclosureLevel = a3;
}

- (NSOrderedSet)disclosureWarnings
{
  return self->_disclosureWarnings;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_disclosureWarnings, 0);
  objc_storeStrong((id *)&self->_origin, 0);
}

+ (id)configurationWithOrigin:(id)a3 disclosureLevel:(unint64_t)a4
{
  id v6;
  id v7;
  void *v8;

  v6 = a3;
  v7 = objc_alloc((Class)a1);
  v8 = (void *)objc_msgSend(v7, "initWithOrigin:disclosureLevel:disclosureWarnings:", v6, a4, MEMORY[0x24BDBD1A8]);

  return v8;
}

+ (id)configurationWithOrigin:(id)a3 disclosureLevel:(unint64_t)a4 disclosureWarnings:(id)a5
{
  id v8;
  id v9;
  void *v10;

  v8 = a5;
  v9 = a3;
  v10 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithOrigin:disclosureLevel:disclosureWarnings:", v9, a4, v8);

  return v10;
}

@end
