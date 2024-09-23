@implementation LPProductMetadata

- (LPProductMetadata)init
{
  LPProductMetadata *v2;
  LPProductMetadata *v3;
  LPProductMetadata *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)LPProductMetadata;
  v2 = -[LPProductMetadata init](&v6, sel_init);
  v3 = v2;
  if (v2)
    v4 = v2;

  return v3;
}

- (id)_initWithDictionary:(id)a3
{
  id v4;
  LPProductMetadata *v5;
  uint64_t v6;
  NSString *pluralTitle;
  void *v8;
  NSArray *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  LPPriceMetadata *v15;
  id v16;
  NSArray *prices;
  LPProductMetadata *v18;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = -[LPProductMetadata init](self, "init");
  if (v5)
  {
    stringForKey(v4, CFSTR("LPMetadataProductPluralTitle"));
    v6 = objc_claimAutoreleasedReturnValue();
    pluralTitle = v5->_pluralTitle;
    v5->_pluralTitle = (NSString *)v6;

    arrayOfDictionariesForKey(v4, (uint64_t)CFSTR("LPMetadataProductPrices"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (NSArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v22 = 0u;
    v23 = 0u;
    v20 = 0u;
    v21 = 0u;
    v10 = v8;
    v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    if (v11)
    {
      v12 = *(_QWORD *)v21;
      do
      {
        v13 = 0;
        do
        {
          if (*(_QWORD *)v21 != v12)
            objc_enumerationMutation(v10);
          v14 = *(_QWORD *)(*((_QWORD *)&v20 + 1) + 8 * v13);
          v15 = [LPPriceMetadata alloc];
          v16 = -[LPPriceMetadata _initWithDictionary:](v15, "_initWithDictionary:", v14, (_QWORD)v20);
          if (v16)
            -[NSArray addObject:](v9, "addObject:", v16);

          ++v13;
        }
        while (v11 != v13);
        v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
      }
      while (v11);
    }

    prices = v5->_prices;
    v5->_prices = v9;

    v18 = v5;
  }

  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (LPProductMetadata)initWithCoder:(id)a3
{
  id v4;
  LPProductMetadata *v5;
  uint64_t v6;
  NSString *pluralTitle;
  uint64_t v8;
  NSArray *prices;
  LPProductMetadata *v10;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)LPProductMetadata;
  v5 = -[LPProductMetadata init](&v12, sel_init);
  if (v5)
  {
    decodeStringForKey(v4, (uint64_t)CFSTR("pluralTitle"));
    v6 = objc_claimAutoreleasedReturnValue();
    pluralTitle = v5->_pluralTitle;
    v5->_pluralTitle = (NSString *)v6;

    objc_msgSend(v4, "_lp_strictlyDecodeArrayOfObjectsOfClass:forKey:", objc_opt_class(), CFSTR("prices"));
    v8 = objc_claimAutoreleasedReturnValue();
    prices = v5->_prices;
    v5->_prices = (NSArray *)v8;

    v10 = v5;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;

  v4 = a3;
  objc_msgSend(v4, "_lp_encodeStringIfNotNil:forKey:", self->_pluralTitle, CFSTR("pluralTitle"));
  objc_msgSend(v4, "_lp_encodeArrayIfNotEmpty:forKey:", self->_prices, CFSTR("prices"));

}

- (BOOL)isEqual:(id)a3
{
  id v4;
  char v5;
  void **v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)LPProductMetadata;
  if (-[LPProductMetadata isEqual:](&v8, sel_isEqual_, v4))
  {
    v5 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v6 = (void **)v4;
      if ((objectsAreEqual_0(v6[2], self->_pluralTitle) & 1) != 0)
        v5 = objectsAreEqual_0(v6[1], self->_prices);
      else
        v5 = 0;

    }
    else
    {
      v5 = 0;
    }
  }

  return v5;
}

- (unint64_t)hash
{
  return -[NSArray hash](self->_prices, "hash");
}

- (id)copyWithZone:(_NSZone *)a3
{
  LPProductMetadata *v4;
  void *v5;
  void *v6;
  LPProductMetadata *v7;

  v4 = +[LPProductMetadata allocWithZone:](LPProductMetadata, "allocWithZone:", a3);
  if (v4)
  {
    -[LPProductMetadata pluralTitle](self, "pluralTitle");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[LPProductMetadata setPluralTitle:](v4, "setPluralTitle:", v5);

    -[LPProductMetadata prices](self, "prices");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[LPProductMetadata setPrices:](v4, "setPrices:", v6);

    v7 = v4;
  }

  return v4;
}

- (NSArray)prices
{
  return self->_prices;
}

- (void)setPrices:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSString)pluralTitle
{
  return self->_pluralTitle;
}

- (void)setPluralTitle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pluralTitle, 0);
  objc_storeStrong((id *)&self->_prices, 0);
}

@end
