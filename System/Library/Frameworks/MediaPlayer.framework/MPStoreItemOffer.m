@implementation MPStoreItemOffer

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lookupDictionary, 0);
}

- (MPStoreItemOffer)initWithLookupDictionary:(id)a3
{
  id v4;
  MPStoreItemOffer *v5;
  uint64_t v6;
  NSDictionary *lookupDictionary;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)MPStoreItemOffer;
  v5 = -[MPStoreItemOffer init](&v9, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    lookupDictionary = v5->_lookupDictionary;
    v5->_lookupDictionary = (NSDictionary *)v6;

  }
  return v5;
}

- (NSString)offerType
{
  void *v2;

  -[NSDictionary objectForKey:](self->_lookupDictionary, "objectForKey:", CFSTR("type"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if ((_NSIsNSString() & 1) == 0)
  {

    v2 = 0;
  }
  return (NSString *)v2;
}

- (NSArray)assets
{
  void *v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  uint64_t i;
  uint64_t v9;
  MPStoreItemOfferAsset *v10;
  MPStoreItemOfferAsset *v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  -[NSDictionary objectForKey:](self->_lookupDictionary, "objectForKey:", CFSTR("assets"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (_NSIsNSArray())
  {
    v15 = 0u;
    v16 = 0u;
    v13 = 0u;
    v14 = 0u;
    v3 = v2;
    v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    if (v4)
    {
      v5 = v4;
      v6 = 0;
      v7 = *(_QWORD *)v14;
      do
      {
        for (i = 0; i != v5; ++i)
        {
          if (*(_QWORD *)v14 != v7)
            objc_enumerationMutation(v3);
          v9 = *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * i);
          if (_NSIsNSDictionary())
          {
            v10 = [MPStoreItemOfferAsset alloc];
            v11 = -[MPStoreItemOfferAsset initWithLookupDictionary:](v10, "initWithLookupDictionary:", v9, (_QWORD)v13);
            if (v11)
            {
              if (!v6)
                v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v3, "count"));
              objc_msgSend(v6, "addObject:", v11);
            }

          }
        }
        v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      }
      while (v5);
    }
    else
    {
      v6 = 0;
    }

  }
  else
  {
    v6 = 0;
  }

  return (NSArray *)v6;
}

- (unint64_t)hash
{
  return ~-[NSDictionary hash](self->_lookupDictionary, "hash");
}

- (BOOL)isEqual:(id)a3
{
  MPStoreItemOffer *v4;
  NSDictionary *lookupDictionary;
  char v6;

  v4 = (MPStoreItemOffer *)a3;
  if (v4 == self)
    goto LABEL_5;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v6 = 0;
    goto LABEL_7;
  }
  lookupDictionary = self->_lookupDictionary;
  if (lookupDictionary == v4->_lookupDictionary)
LABEL_5:
    v6 = 1;
  else
    v6 = -[NSDictionary isEqualToDictionary:](lookupDictionary, "isEqualToDictionary:");
LABEL_7:

  return v6;
}

- (MPStoreItemOffer)initWithCoder:(id)a3
{
  id v4;
  MPStoreItemOffer *v5;
  void *v6;
  uint64_t v7;
  NSDictionary *lookupDictionary;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)MPStoreItemOffer;
  v5 = -[MPStoreItemOffer init](&v10, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodePropertyListForKey:", CFSTR("MPStoreItemOfferLookupDictionary"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (_NSIsNSDictionary())
    {
      v7 = objc_msgSend(v6, "copy");
      lookupDictionary = v5->_lookupDictionary;
      v5->_lookupDictionary = (NSDictionary *)v7;

    }
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;

  v4 = a3;
  if (objc_msgSend(v4, "allowsKeyedCoding"))
    objc_msgSend(v4, "encodeObject:forKey:", self->_lookupDictionary, CFSTR("MPStoreItemOfferLookupDictionary"));
  else
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0CB2C78], CFSTR("Only keyed archiving is supported."));

}

- (NSString)buyParameters
{
  void *v3;
  void *v4;

  -[NSDictionary objectForKey:](self->_lookupDictionary, "objectForKey:", CFSTR("buyParams"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((_NSIsNSString() & 1) == 0)
  {
    -[NSDictionary objectForKey:](self->_lookupDictionary, "objectForKey:", CFSTR("action-params"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    if ((_NSIsNSString() & 1) != 0)
    {
      v3 = v4;
    }
    else
    {

      v3 = 0;
    }
  }
  return (NSString *)v3;
}

- (NSString)formattedPrice
{
  void *v2;

  -[NSDictionary objectForKey:](self->_lookupDictionary, "objectForKey:", CFSTR("priceFormatted"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if ((_NSIsNSString() & 1) == 0)
  {

    v2 = 0;
  }
  return (NSString *)v2;
}

- (NSNumber)price
{
  void *v2;

  -[NSDictionary objectForKey:](self->_lookupDictionary, "objectForKey:", CFSTR("price"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if ((_NSIsNSNumber() & 1) == 0)
  {

    v2 = 0;
  }
  return (NSNumber *)v2;
}

- (id)actionTextForType:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  if (!v4)
  {
    v6 = 0;
    goto LABEL_8;
  }
  -[NSDictionary objectForKey:](self->_lookupDictionary, "objectForKey:", CFSTR("actionText"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!_NSIsNSDictionary())
    goto LABEL_5;
  objc_msgSend(v5, "objectForKey:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((_NSIsNSString() & 1) == 0)
  {

LABEL_5:
    v6 = 0;
  }

LABEL_8:
  return v6;
}

- (NSDictionary)lookupDictionary
{
  return self->_lookupDictionary;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
