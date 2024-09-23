@implementation GEOBusinessInfoModuleConfiguration

- (GEOBusinessInfoModuleConfiguration)initWithBusinessInfoModuleConfiguration:(id)a3
{
  id v5;
  GEOBusinessInfoModuleConfiguration *v6;
  GEOBusinessInfoModuleConfiguration *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)GEOBusinessInfoModuleConfiguration;
  v6 = -[GEOBusinessInfoModuleConfiguration init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_businessInfosModuleConfig, a3);

  return v7;
}

- (NSArray)factoidItemIndexes
{
  id v3;
  unint64_t i;
  GEOPDBusinessInfosModuleConfiguration *businessInfosModuleConfig;
  unint64_t v6;
  void *v7;
  void *v8;

  v3 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  for (i = 0; ; ++i)
  {
    businessInfosModuleConfig = self->_businessInfosModuleConfig;
    v6 = businessInfosModuleConfig ? businessInfosModuleConfig->_factoidItemIndexs.count : 0;
    if (i >= v6)
      break;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[GEOPDBusinessInfosModuleConfiguration factoidItemIndexAtIndex:]((uint64_t)businessInfosModuleConfig, i));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObject:", v7);

  }
  v8 = (void *)objc_msgSend(v3, "copy");

  return (NSArray *)v8;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_businessInfosModuleConfig, 0);
}

@end
