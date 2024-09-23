@implementation GDGraphLocationAddressRelationship

- (GDGraphLocationAddressRelationship)initWithStreetField:(id)a3 subLocalityField:(id)a4 cityField:(id)a5 subAdministrativeAreaField:(id)a6 stateField:(id)a7 postalCodeField:(id)a8 countryField:(id)a9 isoCountryCodeField:(id)a10 inferredSemanticLabelField:(id)a11 allStreetField:(id)a12 allSubLocalityField:(id)a13 allCityField:(id)a14 allSubAdministrativeAreaField:(id)a15 allStateField:(id)a16 allPostalCodeField:(id)a17 allCountryField:(id)a18 allIsoCountryCodeField:(id)a19 allInferredSemanticLabelField:(id)a20
{
  id v25;
  id v26;
  id v27;
  id v28;
  id v29;
  id v30;
  id v31;
  GDGraphLocationAddressRelationship *v32;
  GDGraphLocationAddressRelationship *v33;
  id v36;
  id v37;
  id v38;
  id v39;
  id v41;
  id v42;
  id v43;
  id v44;
  id v45;
  id v46;
  id v47;
  id v48;
  id v49;
  id v50;
  id v51;
  objc_super v52;

  v51 = a3;
  v36 = a4;
  v50 = a4;
  v37 = a5;
  v49 = a5;
  v38 = a6;
  v48 = a6;
  v39 = a7;
  v47 = a7;
  v46 = a8;
  v45 = a9;
  v44 = a10;
  v43 = a11;
  v42 = a12;
  v41 = a13;
  v25 = a14;
  v26 = a15;
  v27 = a16;
  v28 = a17;
  v29 = a18;
  v30 = a19;
  v31 = a20;
  v52.receiver = self;
  v52.super_class = (Class)GDGraphLocationAddressRelationship;
  v32 = -[GDGraphLocationAddressRelationship init](&v52, sel_init);
  v33 = v32;
  if (v32)
  {
    objc_storeStrong((id *)&v32->_street, a3);
    objc_storeStrong((id *)&v33->_subLocality, v36);
    objc_storeStrong((id *)&v33->_city, v37);
    objc_storeStrong((id *)&v33->_subAdministrativeArea, v38);
    objc_storeStrong((id *)&v33->_state, v39);
    objc_storeStrong((id *)&v33->_postalCode, a8);
    objc_storeStrong((id *)&v33->_country, a9);
    objc_storeStrong((id *)&v33->_isoCountryCode, a10);
    objc_storeStrong((id *)&v33->_inferredSemanticLabel, a11);
    objc_storeStrong((id *)&v33->_allStreet, a12);
    objc_storeStrong((id *)&v33->_allSubLocality, a13);
    objc_storeStrong((id *)&v33->_allCity, a14);
    objc_storeStrong((id *)&v33->_allSubAdministrativeArea, a15);
    objc_storeStrong((id *)&v33->_allState, a16);
    objc_storeStrong((id *)&v33->_allPostalCode, a17);
    objc_storeStrong((id *)&v33->_allCountry, a18);
    objc_storeStrong((id *)&v33->_allIsoCountryCode, a19);
    objc_storeStrong((id *)&v33->_allInferredSemanticLabel, a20);
  }

  return v33;
}

- (NSString)street
{
  return self->_street;
}

- (NSString)subLocality
{
  return self->_subLocality;
}

- (NSString)city
{
  return self->_city;
}

- (NSString)subAdministrativeArea
{
  return self->_subAdministrativeArea;
}

- (NSString)state
{
  return self->_state;
}

- (NSString)postalCode
{
  return self->_postalCode;
}

- (NSString)country
{
  return self->_country;
}

- (NSString)isoCountryCode
{
  return self->_isoCountryCode;
}

- (NSString)inferredSemanticLabel
{
  return self->_inferredSemanticLabel;
}

- (NSArray)allStreet
{
  return self->_allStreet;
}

- (NSArray)allSubLocality
{
  return self->_allSubLocality;
}

- (NSArray)allCity
{
  return self->_allCity;
}

- (NSArray)allSubAdministrativeArea
{
  return self->_allSubAdministrativeArea;
}

- (NSArray)allState
{
  return self->_allState;
}

- (NSArray)allPostalCode
{
  return self->_allPostalCode;
}

- (NSArray)allCountry
{
  return self->_allCountry;
}

- (NSArray)allIsoCountryCode
{
  return self->_allIsoCountryCode;
}

- (NSArray)allInferredSemanticLabel
{
  return self->_allInferredSemanticLabel;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_allInferredSemanticLabel, 0);
  objc_storeStrong((id *)&self->_allIsoCountryCode, 0);
  objc_storeStrong((id *)&self->_allCountry, 0);
  objc_storeStrong((id *)&self->_allPostalCode, 0);
  objc_storeStrong((id *)&self->_allState, 0);
  objc_storeStrong((id *)&self->_allSubAdministrativeArea, 0);
  objc_storeStrong((id *)&self->_allCity, 0);
  objc_storeStrong((id *)&self->_allSubLocality, 0);
  objc_storeStrong((id *)&self->_allStreet, 0);
  objc_storeStrong((id *)&self->_inferredSemanticLabel, 0);
  objc_storeStrong((id *)&self->_isoCountryCode, 0);
  objc_storeStrong((id *)&self->_country, 0);
  objc_storeStrong((id *)&self->_postalCode, 0);
  objc_storeStrong((id *)&self->_state, 0);
  objc_storeStrong((id *)&self->_subAdministrativeArea, 0);
  objc_storeStrong((id *)&self->_city, 0);
  objc_storeStrong((id *)&self->_subLocality, 0);
  objc_storeStrong((id *)&self->_street, 0);
}

@end
