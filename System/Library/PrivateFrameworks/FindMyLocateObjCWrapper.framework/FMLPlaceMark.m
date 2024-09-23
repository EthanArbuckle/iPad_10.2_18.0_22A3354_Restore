@implementation FMLPlaceMark

- (FMLPlaceMark)initWithLocality:(id)a3 administrativeArea:(id)a4 country:(id)a5 stateCode:(id)a6 streetAddress:(id)a7 streetName:(id)a8 formattedAddressLines:(id)a9
{
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  FMLPlaceMark *v22;
  FMLPlaceMark *v23;
  void *v24;
  objc_super v26;

  v15 = a3;
  v16 = a4;
  v17 = a5;
  v18 = a6;
  v19 = a7;
  v20 = a8;
  v21 = a9;
  v26.receiver = self;
  v26.super_class = (Class)FMLPlaceMark;
  v22 = -[FMLPlaceMark init](&v26, sel_init);
  v23 = v22;
  if (v22)
  {
    -[FMLPlaceMark setLocality:](v22, "setLocality:", v15);
    -[FMLPlaceMark setAdministrativeArea:](v23, "setAdministrativeArea:", v16);
    -[FMLPlaceMark setCountry:](v23, "setCountry:", v17);
    -[FMLPlaceMark setStateCode:](v23, "setStateCode:", v18);
    -[FMLPlaceMark setStreetAddress:](v23, "setStreetAddress:", v19);
    -[FMLPlaceMark setStreetName:](v23, "setStreetName:", v20);
    v24 = (void *)objc_msgSend(v21, "copy");
    -[FMLPlaceMark setFormattedAddressLines:](v23, "setFormattedAddressLines:", v24);

  }
  return v23;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  char v8;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    -[FMLPlaceMark comparisonIdentifier](self, "comparisonIdentifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "comparisonIdentifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    v8 = objc_msgSend(v6, "isEqualToString:", v7);
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (id)comparisonIdentifier
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v3 = (void *)MEMORY[0x24BDD17C8];
  -[FMLPlaceMark locality](self, "locality");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[FMLPlaceMark country](self, "country");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[FMLPlaceMark stateCode](self, "stateCode");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[FMLPlaceMark streetAddress](self, "streetAddress");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[FMLPlaceMark streetName](self, "streetName");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("locality: %@, country: %@, stateCode: %@, streetAddress: %@, streetName: %@."), v4, v5, v6, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (unint64_t)hash
{
  void *v2;
  unint64_t v3;

  -[FMLPlaceMark comparisonIdentifier](self, "comparisonIdentifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hash");

  return v3;
}

- (id)debugDescription
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v4 = objc_opt_class();
  -[FMLPlaceMark comparisonIdentifier](self, "comparisonIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@ %p [%@]>"), v4, self, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (NSString)locality
{
  return self->_locality;
}

- (void)setLocality:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSString)administrativeArea
{
  return self->_administrativeArea;
}

- (void)setAdministrativeArea:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSString)country
{
  return self->_country;
}

- (void)setCountry:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSString)stateCode
{
  return self->_stateCode;
}

- (void)setStateCode:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (NSString)streetAddress
{
  return self->_streetAddress;
}

- (void)setStreetAddress:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (NSString)streetName
{
  return self->_streetName;
}

- (void)setStreetName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (NSArray)formattedAddressLines
{
  return self->_formattedAddressLines;
}

- (void)setFormattedAddressLines:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_formattedAddressLines, 0);
  objc_storeStrong((id *)&self->_streetName, 0);
  objc_storeStrong((id *)&self->_streetAddress, 0);
  objc_storeStrong((id *)&self->_stateCode, 0);
  objc_storeStrong((id *)&self->_country, 0);
  objc_storeStrong((id *)&self->_administrativeArea, 0);
  objc_storeStrong((id *)&self->_locality, 0);
}

@end
