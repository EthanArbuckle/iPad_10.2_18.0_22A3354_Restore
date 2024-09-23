@implementation GEOStructuredAddress

- (NSMutableArray)areaOfInterests
{
  return self->_areaOfInterests;
}

- (void)addDependentLocality:(id)a3
{
  id v4;
  NSMutableArray *dependentLocalitys;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  dependentLocalitys = self->_dependentLocalitys;
  v8 = v4;
  if (!dependentLocalitys)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v7 = self->_dependentLocalitys;
    self->_dependentLocalitys = v6;

    v4 = v8;
    dependentLocalitys = self->_dependentLocalitys;
  }
  -[NSMutableArray addObject:](dependentLocalitys, "addObject:", v4);

}

- (id)addressDictionary
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;

  _buildGEODictionaryFromStructuredAddress(self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "mutableCopy");

  if (-[GEOStructuredAddress hasPostCode](self, "hasPostCode")
    && (-[GEOStructuredAddress postCode](self, "postCode"),
        v5 = (void *)objc_claimAutoreleasedReturnValue(),
        v6 = objc_msgSend(v5, "length"),
        v5,
        v6))
  {
    -[GEOStructuredAddress postCode](self, "postCode");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v7, CFSTR("ZIP"));

  }
  else
  {
    objc_msgSend(v4, "removeObjectForKey:", CFSTR("ZIP"));
  }
  return v4;
}

- (NSString)postCode
{
  return self->_postCode;
}

- (NSString)thoroughfare
{
  return self->_thoroughfare;
}

- (NSString)country
{
  return self->_country;
}

- (NSString)subThoroughfare
{
  return self->_subThoroughfare;
}

- (NSString)subLocality
{
  return self->_subLocality;
}

- (NSString)subAdministrativeArea
{
  return self->_subAdministrativeArea;
}

- (NSString)premises
{
  return self->_premises;
}

- (NSString)postCodeFull
{
  return self->_postCodeFull;
}

- (NSString)ocean
{
  return self->_ocean;
}

- (NSString)locality
{
  return self->_locality;
}

- (NSString)inlandWater
{
  return self->_inlandWater;
}

- (BOOL)hasThoroughfare
{
  return self->_thoroughfare != 0;
}

- (BOOL)hasPostCode
{
  return self->_postCode != 0;
}

- (BOOL)hasPostCodeExtension
{
  return self->_postCodeExtension != 0;
}

- (NSString)fullThoroughfare
{
  return self->_fullThoroughfare;
}

- (NSString)countryCode
{
  return self->_countryCode;
}

- (NSString)administrativeAreaCode
{
  return self->_administrativeAreaCode;
}

- (void)addAreaOfInterest:(id)a3
{
  id v4;
  NSMutableArray *areaOfInterests;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  areaOfInterests = self->_areaOfInterests;
  v8 = v4;
  if (!areaOfInterests)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v7 = self->_areaOfInterests;
    self->_areaOfInterests = v6;

    v4 = v8;
    areaOfInterests = self->_areaOfInterests;
  }
  -[NSMutableArray addObject:](areaOfInterests, "addObject:", v4);

}

- (GEOStructuredAddress)initWithAddressDictionary:(id)a3
{
  GEOStructuredAddress *v4;

  _buildStructuredAddressFromAnyAddressDictionary(a3);
  v4 = (GEOStructuredAddress *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (BOOL)isEmpty
{
  void *v3;
  BOOL v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v15;
  void *v16;
  void *v17;

  -[GEOStructuredAddress country](self, "country");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = 0;
  }
  else
  {
    -[GEOStructuredAddress countryCode](self, "countryCode");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      v4 = 0;
    }
    else
    {
      -[GEOStructuredAddress administrativeArea](self, "administrativeArea");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      if (v6)
      {
        v4 = 0;
      }
      else
      {
        -[GEOStructuredAddress subAdministrativeArea](self, "subAdministrativeArea");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        if (v7)
        {
          v4 = 0;
        }
        else
        {
          -[GEOStructuredAddress locality](self, "locality");
          v8 = (void *)objc_claimAutoreleasedReturnValue();
          if (v8)
          {
            v4 = 0;
          }
          else
          {
            -[GEOStructuredAddress subLocality](self, "subLocality");
            v9 = (void *)objc_claimAutoreleasedReturnValue();
            if (v9)
            {
              v4 = 0;
            }
            else
            {
              -[GEOStructuredAddress premises](self, "premises");
              v10 = (void *)objc_claimAutoreleasedReturnValue();
              if (v10)
              {
                v4 = 0;
              }
              else
              {
                -[GEOStructuredAddress thoroughfare](self, "thoroughfare");
                v11 = (void *)objc_claimAutoreleasedReturnValue();
                if (v11)
                {
                  v4 = 0;
                }
                else
                {
                  -[GEOStructuredAddress subThoroughfare](self, "subThoroughfare");
                  v12 = (void *)objc_claimAutoreleasedReturnValue();
                  if (v12)
                  {
                    v4 = 0;
                  }
                  else
                  {
                    -[GEOStructuredAddress fullThoroughfare](self, "fullThoroughfare");
                    v13 = (void *)objc_claimAutoreleasedReturnValue();
                    if (v13)
                    {
                      v4 = 0;
                    }
                    else
                    {
                      -[GEOStructuredAddress postCode](self, "postCode");
                      v17 = (void *)objc_claimAutoreleasedReturnValue();
                      if (v17 || -[GEOStructuredAddress areaOfInterestsCount](self, "areaOfInterestsCount"))
                      {
                        v4 = 0;
                      }
                      else
                      {
                        -[GEOStructuredAddress inlandWater](self, "inlandWater");
                        v16 = (void *)objc_claimAutoreleasedReturnValue();
                        if (v16)
                        {
                          v4 = 0;
                        }
                        else
                        {
                          -[GEOStructuredAddress ocean](self, "ocean");
                          v15 = (void *)objc_claimAutoreleasedReturnValue();
                          v4 = v15 == 0;

                        }
                      }

                      v13 = 0;
                    }

                    v12 = 0;
                  }

                }
              }

            }
          }

        }
      }

    }
  }

  return v4;
}

- (void)setThoroughfare:(id)a3
{
  objc_storeStrong((id *)&self->_thoroughfare, a3);
}

- (void)setSubThoroughfare:(id)a3
{
  objc_storeStrong((id *)&self->_subThoroughfare, a3);
}

- (void)setSubLocality:(id)a3
{
  objc_storeStrong((id *)&self->_subLocality, a3);
}

- (void)setSubAdministrativeArea:(id)a3
{
  objc_storeStrong((id *)&self->_subAdministrativeArea, a3);
}

- (void)setPremises:(id)a3
{
  objc_storeStrong((id *)&self->_premises, a3);
}

- (void)setPostCode:(id)a3
{
  objc_storeStrong((id *)&self->_postCode, a3);
}

- (void)setOcean:(id)a3
{
  objc_storeStrong((id *)&self->_ocean, a3);
}

- (void)setLocality:(id)a3
{
  objc_storeStrong((id *)&self->_locality, a3);
}

- (void)setInlandWater:(id)a3
{
  objc_storeStrong((id *)&self->_inlandWater, a3);
}

- (void)setCountryCode:(id)a3
{
  objc_storeStrong((id *)&self->_countryCode, a3);
}

- (void)setCountry:(id)a3
{
  objc_storeStrong((id *)&self->_country, a3);
}

- (void)setAreaOfInterests:(id)a3
{
  objc_storeStrong((id *)&self->_areaOfInterests, a3);
}

- (void)setAdministrativeArea:(id)a3
{
  objc_storeStrong((id *)&self->_administrativeArea, a3);
}

- (void)dealloc
{
  objc_super v3;

  PBRepeatedInt64Clear();
  v3.receiver = self;
  v3.super_class = (Class)GEOStructuredAddress;
  -[GEOStructuredAddress dealloc](&v3, sel_dealloc);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_thoroughfare, 0);
  objc_storeStrong((id *)&self->_subThoroughfare, 0);
  objc_storeStrong((id *)&self->_subPremises, 0);
  objc_storeStrong((id *)&self->_subLocality, 0);
  objc_storeStrong((id *)&self->_subAdministrativeArea, 0);
  objc_storeStrong((id *)&self->_premise, 0);
  objc_storeStrong((id *)&self->_premises, 0);
  objc_storeStrong((id *)&self->_postCode, 0);
  objc_storeStrong((id *)&self->_postCodeFull, 0);
  objc_storeStrong((id *)&self->_postCodeExtension, 0);
  objc_storeStrong((id *)&self->_ocean, 0);
  objc_storeStrong((id *)&self->_locality, 0);
  objc_storeStrong((id *)&self->_inlandWater, 0);
  objc_storeStrong((id *)&self->_fullThoroughfare, 0);
  objc_storeStrong((id *)&self->_dependentLocalitys, 0);
  objc_storeStrong((id *)&self->_country, 0);
  objc_storeStrong((id *)&self->_countryCode, 0);
  objc_storeStrong((id *)&self->_areaOfInterests, 0);
  objc_storeStrong((id *)&self->_administrativeArea, 0);
  objc_storeStrong((id *)&self->_administrativeAreaCode, 0);
  objc_storeStrong((id *)&self->_unknownFields, 0);
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  void *v27;
  uint64_t v28;
  void *v29;
  uint64_t v30;
  void *v31;
  NSMutableArray *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  void *v37;
  uint64_t v38;
  void *v39;
  uint64_t v40;
  void *v41;
  NSMutableArray *v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  void *v47;
  uint64_t v48;
  void *v49;
  NSMutableArray *v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  void *v55;
  uint64_t v56;
  void *v57;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  _BYTE v71[128];
  _BYTE v72[128];
  _BYTE v73[128];
  uint64_t v74;

  v74 = *MEMORY[0x1E0C80C00];
  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[NSString copyWithZone:](self->_country, "copyWithZone:", a3);
  v7 = *(void **)(v5 + 72);
  *(_QWORD *)(v5 + 72) = v6;

  v8 = -[NSString copyWithZone:](self->_countryCode, "copyWithZone:", a3);
  v9 = *(void **)(v5 + 64);
  *(_QWORD *)(v5 + 64) = v8;

  v10 = -[NSString copyWithZone:](self->_administrativeArea, "copyWithZone:", a3);
  v11 = *(void **)(v5 + 48);
  *(_QWORD *)(v5 + 48) = v10;

  v12 = -[NSString copyWithZone:](self->_administrativeAreaCode, "copyWithZone:", a3);
  v13 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v12;

  v14 = -[NSString copyWithZone:](self->_subAdministrativeArea, "copyWithZone:", a3);
  v15 = *(void **)(v5 + 160);
  *(_QWORD *)(v5 + 160) = v14;

  v16 = -[NSString copyWithZone:](self->_locality, "copyWithZone:", a3);
  v17 = *(void **)(v5 + 104);
  *(_QWORD *)(v5 + 104) = v16;

  v18 = -[NSString copyWithZone:](self->_postCode, "copyWithZone:", a3);
  v19 = *(void **)(v5 + 136);
  *(_QWORD *)(v5 + 136) = v18;

  v20 = -[NSString copyWithZone:](self->_subLocality, "copyWithZone:", a3);
  v21 = *(void **)(v5 + 168);
  *(_QWORD *)(v5 + 168) = v20;

  v22 = -[NSString copyWithZone:](self->_premises, "copyWithZone:", a3);
  v23 = *(void **)(v5 + 144);
  *(_QWORD *)(v5 + 144) = v22;

  v24 = -[NSString copyWithZone:](self->_thoroughfare, "copyWithZone:", a3);
  v25 = *(void **)(v5 + 192);
  *(_QWORD *)(v5 + 192) = v24;

  v26 = -[NSString copyWithZone:](self->_subThoroughfare, "copyWithZone:", a3);
  v27 = *(void **)(v5 + 184);
  *(_QWORD *)(v5 + 184) = v26;

  v28 = -[NSString copyWithZone:](self->_fullThoroughfare, "copyWithZone:", a3);
  v29 = *(void **)(v5 + 88);
  *(_QWORD *)(v5 + 88) = v28;

  v30 = -[NSString copyWithZone:](self->_postCodeExtension, "copyWithZone:", a3);
  v31 = *(void **)(v5 + 120);
  *(_QWORD *)(v5 + 120) = v30;

  v69 = 0u;
  v70 = 0u;
  v67 = 0u;
  v68 = 0u;
  v32 = self->_areaOfInterests;
  v33 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v32, "countByEnumeratingWithState:objects:count:", &v67, v73, 16);
  if (v33)
  {
    v34 = v33;
    v35 = *(_QWORD *)v68;
    do
    {
      v36 = 0;
      do
      {
        if (*(_QWORD *)v68 != v35)
          objc_enumerationMutation(v32);
        v37 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v67 + 1) + 8 * v36), "copyWithZone:", a3);
        objc_msgSend((id)v5, "addAreaOfInterest:", v37);

        ++v36;
      }
      while (v34 != v36);
      v34 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v32, "countByEnumeratingWithState:objects:count:", &v67, v73, 16);
    }
    while (v34);
  }

  v38 = -[NSString copyWithZone:](self->_inlandWater, "copyWithZone:", a3);
  v39 = *(void **)(v5 + 96);
  *(_QWORD *)(v5 + 96) = v38;

  v40 = -[NSString copyWithZone:](self->_ocean, "copyWithZone:", a3);
  v41 = *(void **)(v5 + 112);
  *(_QWORD *)(v5 + 112) = v40;

  v65 = 0u;
  v66 = 0u;
  v63 = 0u;
  v64 = 0u;
  v42 = self->_dependentLocalitys;
  v43 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v42, "countByEnumeratingWithState:objects:count:", &v63, v72, 16);
  if (v43)
  {
    v44 = v43;
    v45 = *(_QWORD *)v64;
    do
    {
      v46 = 0;
      do
      {
        if (*(_QWORD *)v64 != v45)
          objc_enumerationMutation(v42);
        v47 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v63 + 1) + 8 * v46), "copyWithZone:", a3);
        objc_msgSend((id)v5, "addDependentLocality:", v47);

        ++v46;
      }
      while (v44 != v46);
      v44 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v42, "countByEnumeratingWithState:objects:count:", &v63, v72, 16);
    }
    while (v44);
  }

  v48 = -[NSString copyWithZone:](self->_premise, "copyWithZone:", a3);
  v49 = *(void **)(v5 + 152);
  *(_QWORD *)(v5 + 152) = v48;

  v61 = 0u;
  v62 = 0u;
  v59 = 0u;
  v60 = 0u;
  v50 = self->_subPremises;
  v51 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v50, "countByEnumeratingWithState:objects:count:", &v59, v71, 16);
  if (v51)
  {
    v52 = v51;
    v53 = *(_QWORD *)v60;
    do
    {
      v54 = 0;
      do
      {
        if (*(_QWORD *)v60 != v53)
          objc_enumerationMutation(v50);
        v55 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v59 + 1) + 8 * v54), "copyWithZone:", a3, (_QWORD)v59);
        objc_msgSend((id)v5, "addSubPremise:", v55);

        ++v54;
      }
      while (v52 != v54);
      v52 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v50, "countByEnumeratingWithState:objects:count:", &v59, v71, 16);
    }
    while (v52);
  }

  v56 = -[NSString copyWithZone:](self->_postCodeFull, "copyWithZone:", a3);
  v57 = *(void **)(v5 + 128);
  *(_QWORD *)(v5 + 128) = v56;

  PBRepeatedInt64Copy();
  objc_storeStrong((id *)(v5 + 8), self->_unknownFields);
  return (id)v5;
}

- (void)writeTo:(id)a3
{
  id v4;
  NSMutableArray *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  NSMutableArray *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  NSMutableArray *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  unint64_t v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  _BYTE v33[128];
  _BYTE v34[128];
  _BYTE v35[128];
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (self->_country)
    PBDataWriterWriteStringField();
  if (self->_countryCode)
    PBDataWriterWriteStringField();
  if (self->_administrativeArea)
    PBDataWriterWriteStringField();
  if (self->_administrativeAreaCode)
    PBDataWriterWriteStringField();
  if (self->_subAdministrativeArea)
    PBDataWriterWriteStringField();
  if (self->_locality)
    PBDataWriterWriteStringField();
  if (self->_postCode)
    PBDataWriterWriteStringField();
  if (self->_subLocality)
    PBDataWriterWriteStringField();
  if (self->_premises)
    PBDataWriterWriteStringField();
  if (self->_thoroughfare)
    PBDataWriterWriteStringField();
  if (self->_subThoroughfare)
    PBDataWriterWriteStringField();
  if (self->_fullThoroughfare)
    PBDataWriterWriteStringField();
  if (self->_postCodeExtension)
    PBDataWriterWriteStringField();
  v31 = 0u;
  v32 = 0u;
  v29 = 0u;
  v30 = 0u;
  v5 = self->_areaOfInterests;
  v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v29, v35, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v30;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v30 != v8)
          objc_enumerationMutation(v5);
        PBDataWriterWriteStringField();
        ++v9;
      }
      while (v7 != v9);
      v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v29, v35, 16);
    }
    while (v7);
  }

  if (self->_inlandWater)
    PBDataWriterWriteStringField();
  if (self->_ocean)
    PBDataWriterWriteStringField();
  v27 = 0u;
  v28 = 0u;
  v25 = 0u;
  v26 = 0u;
  v10 = self->_dependentLocalitys;
  v11 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v25, v34, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v26;
    do
    {
      v14 = 0;
      do
      {
        if (*(_QWORD *)v26 != v13)
          objc_enumerationMutation(v10);
        PBDataWriterWriteStringField();
        ++v14;
      }
      while (v12 != v14);
      v12 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v25, v34, 16);
    }
    while (v12);
  }

  if (self->_premise)
    PBDataWriterWriteStringField();
  v23 = 0u;
  v24 = 0u;
  v21 = 0u;
  v22 = 0u;
  v15 = self->_subPremises;
  v16 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v15, "countByEnumeratingWithState:objects:count:", &v21, v33, 16);
  if (v16)
  {
    v17 = v16;
    v18 = *(_QWORD *)v22;
    do
    {
      v19 = 0;
      do
      {
        if (*(_QWORD *)v22 != v18)
          objc_enumerationMutation(v15);
        PBDataWriterWriteSubmessage();
        ++v19;
      }
      while (v17 != v19);
      v17 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v15, "countByEnumeratingWithState:objects:count:", &v21, v33, 16);
    }
    while (v17);
  }

  if (self->_postCodeFull)
    PBDataWriterWriteStringField();
  if (self->_geoIds.count)
  {
    v20 = 0;
    do
    {
      PBDataWriterWriteInt64Field();
      ++v20;
    }
    while (v20 < self->_geoIds.count);
  }
  -[PBUnknownFields writeTo:](self->_unknownFields, "writeTo:", v4, v21);

}

- (NSString)administrativeArea
{
  return self->_administrativeArea;
}

- (GEOStructuredAddress)initWithUrlRepresentation:(id)a3
{
  id v4;
  GEOStructuredAddress *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  GEOStructuredAddress *v11;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)GEOStructuredAddress;
  v5 = -[GEOStructuredAddress init](&v13, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKey:", CFSTR("country"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v6, "length"))
      -[GEOStructuredAddress setCountryCode:](v5, "setCountryCode:", v6);
    objc_msgSend(v4, "objectForKey:", CFSTR("state"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v7, "length"))
      -[GEOStructuredAddress setAdministrativeArea:](v5, "setAdministrativeArea:", v7);
    objc_msgSend(v4, "objectForKey:", CFSTR("city"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v8, "length"))
      -[GEOStructuredAddress setLocality:](v5, "setLocality:", v8);
    objc_msgSend(v4, "objectForKey:", CFSTR("zip"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v9, "length"))
      -[GEOStructuredAddress setPostCode:](v5, "setPostCode:", v9);
    objc_msgSend(v4, "objectForKey:", CFSTR("street"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v10, "length"))
      -[GEOStructuredAddress setFullThoroughfare:](v5, "setFullThoroughfare:", v10);
    v11 = v5;

  }
  return v5;
}

- (id)urlRepresentation
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[GEOStructuredAddress hasCountryCode](self, "hasCountryCode"))
  {
    -[GEOStructuredAddress countryCode](self, "countryCode");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "length");

    if (v5)
    {
      -[GEOStructuredAddress countryCode](self, "countryCode");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKey:", v6, CFSTR("country"));

    }
  }
  if (-[GEOStructuredAddress hasAdministrativeAreaCode](self, "hasAdministrativeAreaCode"))
  {
    -[GEOStructuredAddress administrativeAreaCode](self, "administrativeAreaCode");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "length");

    if (v8)
    {
      -[GEOStructuredAddress administrativeAreaCode](self, "administrativeAreaCode");
      v9 = objc_claimAutoreleasedReturnValue();
LABEL_10:
      v12 = (void *)v9;
      objc_msgSend(v3, "setObject:forKey:", v9, CFSTR("state"));

      goto LABEL_11;
    }
  }
  if (-[GEOStructuredAddress hasAdministrativeArea](self, "hasAdministrativeArea"))
  {
    -[GEOStructuredAddress administrativeArea](self, "administrativeArea");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "length");

    if (v11)
    {
      -[GEOStructuredAddress administrativeArea](self, "administrativeArea");
      v9 = objc_claimAutoreleasedReturnValue();
      goto LABEL_10;
    }
  }
LABEL_11:
  if (-[GEOStructuredAddress hasLocality](self, "hasLocality"))
  {
    -[GEOStructuredAddress locality](self, "locality");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "length");

    if (v14)
    {
      -[GEOStructuredAddress locality](self, "locality");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKey:", v15, CFSTR("city"));

    }
  }
  if (-[GEOStructuredAddress hasPostCode](self, "hasPostCode"))
  {
    -[GEOStructuredAddress postCode](self, "postCode");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v16, "length");

    if (v17)
    {
      -[GEOStructuredAddress postCode](self, "postCode");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKey:", v18, CFSTR("zip"));

    }
  }
  if (-[GEOStructuredAddress hasFullThoroughfare](self, "hasFullThoroughfare"))
  {
    -[GEOStructuredAddress fullThoroughfare](self, "fullThoroughfare");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = objc_msgSend(v19, "length");

    if (v20)
    {
      -[GEOStructuredAddress fullThoroughfare](self, "fullThoroughfare");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKey:", v21, CFSTR("street"));

    }
  }
  return v3;
}

- (BOOL)_isEquivalentURLRepresentationTo:(id)a3
{
  void *v3;
  void *v4;
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  int v14;
  void *v15;
  int v16;
  int v17;
  void *v19;
  int v20;
  uint64_t v21;
  uint64_t v22;
  int v23;
  void *v24;
  void *v25;
  void *v26;
  int v27;

  v6 = a3;
  if (-[GEOStructuredAddress hasAdministrativeArea](self, "hasAdministrativeArea")
    || objc_msgSend(v6, "hasAdministrativeArea"))
  {
    -[GEOStructuredAddress administrativeArea](self, "administrativeArea");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "administrativeArea");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v3, "isEqual:", v4) & 1) == 0
      && (-[GEOStructuredAddress hasAdministrativeAreaCode](self, "hasAdministrativeAreaCode")
       || objc_msgSend(v6, "hasAdministrativeAreaCode")))
    {
      -[GEOStructuredAddress administrativeAreaCode](self, "administrativeAreaCode");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "administrativeAreaCode");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = objc_msgSend(v8, "isEqual:", v9);

    }
    else
    {
      v7 = 1;
    }

  }
  else
  {
    v7 = 1;
  }
  if (-[GEOStructuredAddress hasAdministrativeArea](self, "hasAdministrativeArea")
    && objc_msgSend(v6, "hasAdministrativeAreaCode"))
  {
    -[GEOStructuredAddress administrativeArea](self, "administrativeArea");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "administrativeAreaCode");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = 1;
    v11 = 1;
    if ((objc_msgSend(v3, "isEqual:", v4) & 1) != 0)
      goto LABEL_20;
  }
  else
  {
    v10 = 0;
  }
  if (-[GEOStructuredAddress hasAdministrativeAreaCode](self, "hasAdministrativeAreaCode")
    && (objc_msgSend(v6, "hasAdministrativeArea") & 1) != 0)
  {
    -[GEOStructuredAddress administrativeAreaCode](self, "administrativeAreaCode");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "administrativeArea");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v12, "isEqual:", v13);

    v14 = v11;
    if (!(_DWORD)v10)
      goto LABEL_21;
    goto LABEL_20;
  }
  v11 = 0;
  v14 = 0;
  if ((v10 & 1) != 0)
  {
LABEL_20:

    v14 = v11;
  }
LABEL_21:
  if (-[GEOStructuredAddress hasCountryCode](self, "hasCountryCode")
    || objc_msgSend(v6, "hasCountryCode"))
  {
    -[GEOStructuredAddress countryCode](self, "countryCode");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "countryCode");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = 0;
    if (!objc_msgSend(v3, "isEqual:", v4) || ((v7 | v14) & 1) == 0)
      goto LABEL_39;
    v16 = 1;
  }
  else
  {
    v16 = 0;
    v15 = 0;
    if ((v7 | v14) != 1)
      goto LABEL_40;
  }
  if (-[GEOStructuredAddress hasLocality](self, "hasLocality") || objc_msgSend(v6, "hasLocality"))
  {
    -[GEOStructuredAddress locality](self, "locality");
    v7 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "locality");
    v11 = objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend((id)v7, "isEqual:", v11))
    {
      LOBYTE(v15) = 0;
      goto LABEL_38;
    }
    v17 = 1;
  }
  else
  {
    v17 = 0;
  }
  if (-[GEOStructuredAddress hasPostCode](self, "hasPostCode") || objc_msgSend(v6, "hasPostCode"))
  {
    -[GEOStructuredAddress postCode](self, "postCode");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "postCode");
    v10 = objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v15, "isEqual:", v10) & 1) == 0)
    {

      LOBYTE(v15) = 0;
      if ((v17 & 1) == 0)
        goto LABEL_49;
      goto LABEL_38;
    }
    v27 = 1;
  }
  else
  {
    v27 = 0;
  }
  v25 = (void *)v10;
  v26 = v15;
  if (-[GEOStructuredAddress hasFullThoroughfare](self, "hasFullThoroughfare")
    || (objc_msgSend(v6, "hasFullThoroughfare") & 1) != 0)
  {
    -[GEOStructuredAddress fullThoroughfare](self, "fullThoroughfare");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "fullThoroughfare");
    v20 = v17;
    v21 = v11;
    v22 = v7;
    v23 = v16;
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    LOBYTE(v15) = objc_msgSend(v19, "isEqual:", v24);

    v16 = v23;
    v7 = v22;
    v11 = v21;
    v17 = v20;

    if (v27)
      goto LABEL_45;
LABEL_48:
    if (!v17)
      goto LABEL_49;
    goto LABEL_38;
  }
  LOBYTE(v15) = 1;
  if ((v27 & 1) == 0)
    goto LABEL_48;
LABEL_45:

  if ((v17 & 1) == 0)
  {
LABEL_49:
    if (!v16)
      goto LABEL_40;
    goto LABEL_39;
  }
LABEL_38:

  if ((v16 & 1) != 0)
  {
LABEL_39:

  }
LABEL_40:

  return (char)v15;
}

- (GEOStructuredAddress)initWithPostalAddress:(id)a3
{
  GEOStructuredAddress *v4;

  _buildStructuredAddressFromCNPostalAddress(a3);
  v4 = (GEOStructuredAddress *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (BOOL)hasCountry
{
  return self->_country != 0;
}

- (BOOL)hasCountryCode
{
  return self->_countryCode != 0;
}

- (BOOL)hasAdministrativeArea
{
  return self->_administrativeArea != 0;
}

- (BOOL)hasAdministrativeAreaCode
{
  return self->_administrativeAreaCode != 0;
}

- (void)setAdministrativeAreaCode:(id)a3
{
  objc_storeStrong((id *)&self->_administrativeAreaCode, a3);
}

- (BOOL)hasSubAdministrativeArea
{
  return self->_subAdministrativeArea != 0;
}

- (BOOL)hasLocality
{
  return self->_locality != 0;
}

- (BOOL)hasSubLocality
{
  return self->_subLocality != 0;
}

- (BOOL)hasPremises
{
  return self->_premises != 0;
}

- (BOOL)hasSubThoroughfare
{
  return self->_subThoroughfare != 0;
}

- (BOOL)hasFullThoroughfare
{
  return self->_fullThoroughfare != 0;
}

- (void)setFullThoroughfare:(id)a3
{
  objc_storeStrong((id *)&self->_fullThoroughfare, a3);
}

- (NSString)postCodeExtension
{
  return self->_postCodeExtension;
}

- (void)setPostCodeExtension:(id)a3
{
  objc_storeStrong((id *)&self->_postCodeExtension, a3);
}

- (void)clearAreaOfInterests
{
  -[NSMutableArray removeAllObjects](self->_areaOfInterests, "removeAllObjects");
}

- (unint64_t)areaOfInterestsCount
{
  return -[NSMutableArray count](self->_areaOfInterests, "count");
}

- (id)areaOfInterestAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_areaOfInterests, "objectAtIndex:", a3);
}

+ (Class)areaOfInterestType
{
  return (Class)objc_opt_class();
}

- (BOOL)hasInlandWater
{
  return self->_inlandWater != 0;
}

- (BOOL)hasOcean
{
  return self->_ocean != 0;
}

- (NSMutableArray)dependentLocalitys
{
  return self->_dependentLocalitys;
}

- (void)setDependentLocalitys:(id)a3
{
  objc_storeStrong((id *)&self->_dependentLocalitys, a3);
}

- (void)clearDependentLocalitys
{
  -[NSMutableArray removeAllObjects](self->_dependentLocalitys, "removeAllObjects");
}

- (unint64_t)dependentLocalitysCount
{
  return -[NSMutableArray count](self->_dependentLocalitys, "count");
}

- (id)dependentLocalityAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_dependentLocalitys, "objectAtIndex:", a3);
}

+ (Class)dependentLocalityType
{
  return (Class)objc_opt_class();
}

- (BOOL)hasPremise
{
  return self->_premise != 0;
}

- (NSString)premise
{
  return self->_premise;
}

- (void)setPremise:(id)a3
{
  objc_storeStrong((id *)&self->_premise, a3);
}

- (NSMutableArray)subPremises
{
  return self->_subPremises;
}

- (void)setSubPremises:(id)a3
{
  objc_storeStrong((id *)&self->_subPremises, a3);
}

- (void)clearSubPremises
{
  -[NSMutableArray removeAllObjects](self->_subPremises, "removeAllObjects");
}

- (void)addSubPremise:(id)a3
{
  id v4;
  NSMutableArray *subPremises;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  subPremises = self->_subPremises;
  v8 = v4;
  if (!subPremises)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v7 = self->_subPremises;
    self->_subPremises = v6;

    v4 = v8;
    subPremises = self->_subPremises;
  }
  -[NSMutableArray addObject:](subPremises, "addObject:", v4);

}

- (unint64_t)subPremisesCount
{
  return -[NSMutableArray count](self->_subPremises, "count");
}

- (id)subPremiseAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_subPremises, "objectAtIndex:", a3);
}

+ (Class)subPremiseType
{
  return (Class)objc_opt_class();
}

- (BOOL)hasPostCodeFull
{
  return self->_postCodeFull != 0;
}

- (void)setPostCodeFull:(id)a3
{
  objc_storeStrong((id *)&self->_postCodeFull, a3);
}

- (unint64_t)geoIdsCount
{
  return self->_geoIds.count;
}

- (int64_t)geoIds
{
  return self->_geoIds.list;
}

- (void)clearGeoIds
{
  PBRepeatedInt64Clear();
}

- (void)addGeoId:(int64_t)a3
{
  PBRepeatedInt64Add();
}

- (int64_t)geoIdAtIndex:(unint64_t)a3
{
  $A58966F474337DCABE012981F76706F5 *p_geoIds;
  unint64_t count;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;

  p_geoIds = &self->_geoIds;
  count = self->_geoIds.count;
  if (count <= a3)
  {
    v6 = (void *)MEMORY[0x1E0C99DA0];
    v7 = *MEMORY[0x1E0C99858];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("idx (%tu) is out of range (%tu)"), a3, count);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "exceptionWithName:reason:userInfo:", v7, v8, 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "raise");

  }
  return p_geoIds->list[a3];
}

- (void)setGeoIds:(int64_t *)a3 count:(unint64_t)a4
{
  PBRepeatedInt64Set();
}

- (NSString)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v8.receiver = self;
  v8.super_class = (Class)GEOStructuredAddress;
  -[GEOStructuredAddress description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEOStructuredAddress dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOStructuredAddress _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t i;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  id v37;
  id v38;
  _QWORD v40[4];
  id v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  _BYTE v46[128];
  uint64_t v47;

  v47 = *MEMORY[0x1E0C80C00];
  if (!a1)
    return 0;
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)a1, "country");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
    objc_msgSend(v4, "setObject:forKey:", v5, CFSTR("country"));

  objc_msgSend((id)a1, "countryCode");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
    objc_msgSend(v4, "setObject:forKey:", v6, CFSTR("countryCode"));

  objc_msgSend((id)a1, "administrativeArea");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
    objc_msgSend(v4, "setObject:forKey:", v7, CFSTR("administrativeArea"));

  objc_msgSend((id)a1, "administrativeAreaCode");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
    objc_msgSend(v4, "setObject:forKey:", v8, CFSTR("administrativeAreaCode"));

  objc_msgSend((id)a1, "subAdministrativeArea");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
    objc_msgSend(v4, "setObject:forKey:", v9, CFSTR("subAdministrativeArea"));

  objc_msgSend((id)a1, "locality");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
    objc_msgSend(v4, "setObject:forKey:", v10, CFSTR("locality"));

  objc_msgSend((id)a1, "postCode");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11)
    objc_msgSend(v4, "setObject:forKey:", v11, CFSTR("postCode"));

  objc_msgSend((id)a1, "subLocality");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (v12)
    objc_msgSend(v4, "setObject:forKey:", v12, CFSTR("subLocality"));

  objc_msgSend((id)a1, "premises");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (v13)
    objc_msgSend(v4, "setObject:forKey:", v13, CFSTR("premises"));

  objc_msgSend((id)a1, "thoroughfare");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (v14)
    objc_msgSend(v4, "setObject:forKey:", v14, CFSTR("thoroughfare"));

  objc_msgSend((id)a1, "subThoroughfare");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (v15)
    objc_msgSend(v4, "setObject:forKey:", v15, CFSTR("subThoroughfare"));

  objc_msgSend((id)a1, "fullThoroughfare");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if (v16)
    objc_msgSend(v4, "setObject:forKey:", v16, CFSTR("fullThoroughfare"));

  objc_msgSend((id)a1, "postCodeExtension");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  if (v17)
    objc_msgSend(v4, "setObject:forKey:", v17, CFSTR("postCodeExtension"));

  if (*(_QWORD *)(a1 + 56))
  {
    objc_msgSend((id)a1, "areaOfInterests");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v18, CFSTR("areaOfInterest"));

  }
  objc_msgSend((id)a1, "inlandWater");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  if (v19)
    objc_msgSend(v4, "setObject:forKey:", v19, CFSTR("inlandWater"));

  objc_msgSend((id)a1, "ocean");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  if (v20)
    objc_msgSend(v4, "setObject:forKey:", v20, CFSTR("ocean"));

  if (*(_QWORD *)(a1 + 80))
  {
    objc_msgSend((id)a1, "dependentLocalitys");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v21, CFSTR("dependentLocality"));

  }
  objc_msgSend((id)a1, "premise");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  if (v22)
    objc_msgSend(v4, "setObject:forKey:", v22, CFSTR("premise"));

  if (objc_msgSend(*(id *)(a1 + 176), "count"))
  {
    v23 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 176), "count"));
    v42 = 0u;
    v43 = 0u;
    v44 = 0u;
    v45 = 0u;
    v24 = *(id *)(a1 + 176);
    v25 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v42, v46, 16);
    if (v25)
    {
      v26 = v25;
      v27 = *(_QWORD *)v43;
      do
      {
        for (i = 0; i != v26; ++i)
        {
          if (*(_QWORD *)v43 != v27)
            objc_enumerationMutation(v24);
          v29 = *(void **)(*((_QWORD *)&v42 + 1) + 8 * i);
          if ((a2 & 1) != 0)
            objc_msgSend(v29, "jsonRepresentation");
          else
            objc_msgSend(v29, "dictionaryRepresentation");
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v23, "addObject:", v30);

        }
        v26 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v42, v46, 16);
      }
      while (v26);
    }

    objc_msgSend(v4, "setObject:forKey:", v23, CFSTR("subPremise"));
  }
  objc_msgSend((id)a1, "postCodeFull");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  if (v31)
    objc_msgSend(v4, "setObject:forKey:", v31, CFSTR("postCodeFull"));

  if (*(_QWORD *)(a1 + 24))
  {
    PBRepeatedInt64NSArray();
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v32, CFSTR("geoId"));

  }
  v33 = *(void **)(a1 + 8);
  if (v33)
  {
    objc_msgSend(v33, "dictionaryRepresentation");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v35 = v34;
    if (a2)
    {
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", objc_msgSend(v34, "count"));
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      v40[0] = MEMORY[0x1E0C809B0];
      v40[1] = 3221225472;
      v40[2] = __50__GEOStructuredAddress__dictionaryRepresentation___block_invoke;
      v40[3] = &unk_1E1C00600;
      v37 = v36;
      v41 = v37;
      objc_msgSend(v35, "enumerateKeysAndObjectsUsingBlock:", v40);
      v38 = v37;

      v35 = v38;
    }
    objc_msgSend(v4, "setObject:forKey:", v35, CFSTR("Unknown Fields"));

  }
  return v4;
}

- (id)jsonRepresentation
{
  return -[GEOStructuredAddress _dictionaryRepresentation:]((uint64_t)self, 1);
}

void __50__GEOStructuredAddress__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  char isKindOfClass;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a2;
  v5 = a3;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();
  v7 = *(void **)(a1 + 32);
  if ((isKindOfClass & 1) != 0)
  {
    objc_msgSend(v5, "base64EncodedStringWithOptions:", 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "description");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setObject:forKey:", v8, v9);

  }
  else
  {
    objc_msgSend(v10, "description");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setObject:forKey:", v5, v8);
  }

}

- (GEOStructuredAddress)initWithDictionary:(id)a3
{
  return (GEOStructuredAddress *)-[GEOStructuredAddress _initWithDictionary:isJSON:](self, a3, 0);
}

- (void)_initWithDictionary:(char)a3 isJSON:
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  id v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t i;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  id v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t j;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  id v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t k;
  uint64_t v60;
  GEOSubPremise *v61;
  uint64_t v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  id v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t m;
  void *v72;
  void *v74;
  id v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  __int128 v83;
  __int128 v84;
  __int128 v85;
  __int128 v86;
  __int128 v87;
  __int128 v88;
  __int128 v89;
  __int128 v90;
  __int128 v91;
  _BYTE v92[128];
  _BYTE v93[128];
  _BYTE v94[128];
  _BYTE v95[128];
  uint64_t v96;

  v96 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  if (a1)
  {
    a1 = (void *)objc_msgSend(a1, "init");
    if (a1)
    {
      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("country"));
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v7 = (void *)objc_msgSend(v6, "copy");
        objc_msgSend(a1, "setCountry:", v7);

      }
      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("countryCode"));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v9 = (void *)objc_msgSend(v8, "copy");
        objc_msgSend(a1, "setCountryCode:", v9);

      }
      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("administrativeArea"));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v11 = (void *)objc_msgSend(v10, "copy");
        objc_msgSend(a1, "setAdministrativeArea:", v11);

      }
      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("administrativeAreaCode"));
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v13 = (void *)objc_msgSend(v12, "copy");
        objc_msgSend(a1, "setAdministrativeAreaCode:", v13);

      }
      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("subAdministrativeArea"));
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v15 = (void *)objc_msgSend(v14, "copy");
        objc_msgSend(a1, "setSubAdministrativeArea:", v15);

      }
      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("locality"));
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v17 = (void *)objc_msgSend(v16, "copy");
        objc_msgSend(a1, "setLocality:", v17);

      }
      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("postCode"));
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v19 = (void *)objc_msgSend(v18, "copy");
        objc_msgSend(a1, "setPostCode:", v19);

      }
      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("subLocality"));
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v21 = (void *)objc_msgSend(v20, "copy");
        objc_msgSend(a1, "setSubLocality:", v21);

      }
      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("premises"));
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v23 = (void *)objc_msgSend(v22, "copy");
        objc_msgSend(a1, "setPremises:", v23);

      }
      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("thoroughfare"));
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v25 = (void *)objc_msgSend(v24, "copy");
        objc_msgSend(a1, "setThoroughfare:", v25);

      }
      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("subThoroughfare"));
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v27 = (void *)objc_msgSend(v26, "copy");
        objc_msgSend(a1, "setSubThoroughfare:", v27);

      }
      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("fullThoroughfare"));
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v29 = (void *)objc_msgSend(v28, "copy");
        objc_msgSend(a1, "setFullThoroughfare:", v29);

      }
      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("postCodeExtension"));
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v31 = (void *)objc_msgSend(v30, "copy");
        objc_msgSend(a1, "setPostCodeExtension:", v31);

      }
      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("areaOfInterest"));
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v90 = 0u;
        v91 = 0u;
        v88 = 0u;
        v89 = 0u;
        v33 = v32;
        v34 = objc_msgSend(v33, "countByEnumeratingWithState:objects:count:", &v88, v95, 16);
        if (v34)
        {
          v35 = v34;
          v36 = *(_QWORD *)v89;
          do
          {
            for (i = 0; i != v35; ++i)
            {
              if (*(_QWORD *)v89 != v36)
                objc_enumerationMutation(v33);
              v38 = *(void **)(*((_QWORD *)&v88 + 1) + 8 * i);
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0)
              {
                v39 = (void *)objc_msgSend(v38, "copy");
                objc_msgSend(a1, "addAreaOfInterest:", v39);

              }
            }
            v35 = objc_msgSend(v33, "countByEnumeratingWithState:objects:count:", &v88, v95, 16);
          }
          while (v35);
        }

      }
      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("inlandWater"));
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v41 = (void *)objc_msgSend(v40, "copy");
        objc_msgSend(a1, "setInlandWater:", v41);

      }
      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("ocean"));
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v43 = (void *)objc_msgSend(v42, "copy");
        objc_msgSend(a1, "setOcean:", v43);

      }
      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("dependentLocality"));
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v86 = 0u;
        v87 = 0u;
        v84 = 0u;
        v85 = 0u;
        v45 = v44;
        v46 = objc_msgSend(v45, "countByEnumeratingWithState:objects:count:", &v84, v94, 16);
        if (v46)
        {
          v47 = v46;
          v48 = *(_QWORD *)v85;
          do
          {
            for (j = 0; j != v47; ++j)
            {
              if (*(_QWORD *)v85 != v48)
                objc_enumerationMutation(v45);
              v50 = *(void **)(*((_QWORD *)&v84 + 1) + 8 * j);
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0)
              {
                v51 = (void *)objc_msgSend(v50, "copy");
                objc_msgSend(a1, "addDependentLocality:", v51);

              }
            }
            v47 = objc_msgSend(v45, "countByEnumeratingWithState:objects:count:", &v84, v94, 16);
          }
          while (v47);
        }

      }
      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("premise"));
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v53 = (void *)objc_msgSend(v52, "copy");
        objc_msgSend(a1, "setPremise:", v53);

      }
      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("subPremise"));
      v54 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v74 = v54;
        v75 = v5;
        v82 = 0u;
        v83 = 0u;
        v80 = 0u;
        v81 = 0u;
        v55 = v54;
        v56 = objc_msgSend(v55, "countByEnumeratingWithState:objects:count:", &v80, v93, 16);
        if (v56)
        {
          v57 = v56;
          v58 = *(_QWORD *)v81;
          do
          {
            for (k = 0; k != v57; ++k)
            {
              if (*(_QWORD *)v81 != v58)
                objc_enumerationMutation(v55);
              v60 = *(_QWORD *)(*((_QWORD *)&v80 + 1) + 8 * k);
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0)
              {
                v61 = [GEOSubPremise alloc];
                if ((a3 & 1) != 0)
                  v62 = -[GEOSubPremise initWithJSON:](v61, "initWithJSON:", v60);
                else
                  v62 = -[GEOSubPremise initWithDictionary:](v61, "initWithDictionary:", v60);
                v63 = (void *)v62;
                objc_msgSend(a1, "addSubPremise:", v62, v74, v75);

              }
            }
            v57 = objc_msgSend(v55, "countByEnumeratingWithState:objects:count:", &v80, v93, 16);
          }
          while (v57);
        }

        v54 = v74;
        v5 = v75;
      }

      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("postCodeFull"));
      v64 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v65 = (void *)objc_msgSend(v64, "copy");
        objc_msgSend(a1, "setPostCodeFull:", v65);

      }
      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("geoId"));
      v66 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v78 = 0u;
        v79 = 0u;
        v76 = 0u;
        v77 = 0u;
        v67 = v66;
        v68 = objc_msgSend(v67, "countByEnumeratingWithState:objects:count:", &v76, v92, 16);
        if (v68)
        {
          v69 = v68;
          v70 = *(_QWORD *)v77;
          do
          {
            for (m = 0; m != v69; ++m)
            {
              if (*(_QWORD *)v77 != v70)
                objc_enumerationMutation(v67);
              v72 = *(void **)(*((_QWORD *)&v76 + 1) + 8 * m);
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0)
                objc_msgSend(a1, "addGeoId:", objc_msgSend(v72, "longLongValue"));
            }
            v69 = objc_msgSend(v67, "countByEnumeratingWithState:objects:count:", &v76, v92, 16);
          }
          while (v69);
        }

      }
    }
  }

  return a1;
}

- (GEOStructuredAddress)initWithJSON:(id)a3
{
  return (GEOStructuredAddress *)-[GEOStructuredAddress _initWithDictionary:isJSON:](self, a3, 1);
}

+ (BOOL)isValid:(id)a3
{
  return GEOStructuredAddressIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEOStructuredAddressReadAllFrom(self, a3);
}

- (void)copyTo:(id)a3
{
  unint64_t v4;
  unint64_t v5;
  uint64_t i;
  void *v7;
  unint64_t v8;
  unint64_t v9;
  uint64_t j;
  void *v11;
  unint64_t v12;
  unint64_t v13;
  uint64_t k;
  void *v15;
  unint64_t v16;
  unint64_t v17;
  uint64_t m;
  id v19;

  v19 = a3;
  if (self->_country)
    objc_msgSend(v19, "setCountry:");
  if (self->_countryCode)
    objc_msgSend(v19, "setCountryCode:");
  if (self->_administrativeArea)
    objc_msgSend(v19, "setAdministrativeArea:");
  if (self->_administrativeAreaCode)
    objc_msgSend(v19, "setAdministrativeAreaCode:");
  if (self->_subAdministrativeArea)
    objc_msgSend(v19, "setSubAdministrativeArea:");
  if (self->_locality)
    objc_msgSend(v19, "setLocality:");
  if (self->_postCode)
    objc_msgSend(v19, "setPostCode:");
  if (self->_subLocality)
    objc_msgSend(v19, "setSubLocality:");
  if (self->_premises)
    objc_msgSend(v19, "setPremises:");
  if (self->_thoroughfare)
    objc_msgSend(v19, "setThoroughfare:");
  if (self->_subThoroughfare)
    objc_msgSend(v19, "setSubThoroughfare:");
  if (self->_fullThoroughfare)
    objc_msgSend(v19, "setFullThoroughfare:");
  if (self->_postCodeExtension)
    objc_msgSend(v19, "setPostCodeExtension:");
  if (-[GEOStructuredAddress areaOfInterestsCount](self, "areaOfInterestsCount"))
  {
    objc_msgSend(v19, "clearAreaOfInterests");
    v4 = -[GEOStructuredAddress areaOfInterestsCount](self, "areaOfInterestsCount");
    if (v4)
    {
      v5 = v4;
      for (i = 0; i != v5; ++i)
      {
        -[GEOStructuredAddress areaOfInterestAtIndex:](self, "areaOfInterestAtIndex:", i);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "addAreaOfInterest:", v7);

      }
    }
  }
  if (self->_inlandWater)
    objc_msgSend(v19, "setInlandWater:");
  if (self->_ocean)
    objc_msgSend(v19, "setOcean:");
  if (-[GEOStructuredAddress dependentLocalitysCount](self, "dependentLocalitysCount"))
  {
    objc_msgSend(v19, "clearDependentLocalitys");
    v8 = -[GEOStructuredAddress dependentLocalitysCount](self, "dependentLocalitysCount");
    if (v8)
    {
      v9 = v8;
      for (j = 0; j != v9; ++j)
      {
        -[GEOStructuredAddress dependentLocalityAtIndex:](self, "dependentLocalityAtIndex:", j);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "addDependentLocality:", v11);

      }
    }
  }
  if (self->_premise)
    objc_msgSend(v19, "setPremise:");
  if (-[GEOStructuredAddress subPremisesCount](self, "subPremisesCount"))
  {
    objc_msgSend(v19, "clearSubPremises");
    v12 = -[GEOStructuredAddress subPremisesCount](self, "subPremisesCount");
    if (v12)
    {
      v13 = v12;
      for (k = 0; k != v13; ++k)
      {
        -[GEOStructuredAddress subPremiseAtIndex:](self, "subPremiseAtIndex:", k);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "addSubPremise:", v15);

      }
    }
  }
  if (self->_postCodeFull)
    objc_msgSend(v19, "setPostCodeFull:");
  if (-[GEOStructuredAddress geoIdsCount](self, "geoIdsCount"))
  {
    objc_msgSend(v19, "clearGeoIds");
    v16 = -[GEOStructuredAddress geoIdsCount](self, "geoIdsCount");
    if (v16)
    {
      v17 = v16;
      for (m = 0; m != v17; ++m)
        objc_msgSend(v19, "addGeoId:", -[GEOStructuredAddress geoIdAtIndex:](self, "geoIdAtIndex:", m));
    }
  }

}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  NSString *country;
  NSString *countryCode;
  NSString *administrativeArea;
  NSString *administrativeAreaCode;
  NSString *subAdministrativeArea;
  NSString *locality;
  NSString *postCode;
  NSString *subLocality;
  NSString *premises;
  NSString *thoroughfare;
  NSString *subThoroughfare;
  NSString *fullThoroughfare;
  NSString *postCodeExtension;
  NSMutableArray *areaOfInterests;
  NSString *inlandWater;
  NSString *ocean;
  NSMutableArray *dependentLocalitys;
  NSString *premise;
  NSMutableArray *subPremises;
  NSString *postCodeFull;
  char IsEqual;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_43;
  country = self->_country;
  if ((unint64_t)country | v4[9])
  {
    if (!-[NSString isEqual:](country, "isEqual:"))
      goto LABEL_43;
  }
  countryCode = self->_countryCode;
  if ((unint64_t)countryCode | v4[8] && !-[NSString isEqual:](countryCode, "isEqual:"))
    goto LABEL_43;
  administrativeArea = self->_administrativeArea;
  if ((unint64_t)administrativeArea | v4[6]
    && !-[NSString isEqual:](administrativeArea, "isEqual:"))
  {
    goto LABEL_43;
  }
  administrativeAreaCode = self->_administrativeAreaCode;
  if ((unint64_t)administrativeAreaCode | v4[5]
    && !-[NSString isEqual:](administrativeAreaCode, "isEqual:"))
  {
    goto LABEL_43;
  }
  subAdministrativeArea = self->_subAdministrativeArea;
  if ((unint64_t)subAdministrativeArea | v4[20]
    && !-[NSString isEqual:](subAdministrativeArea, "isEqual:"))
  {
    goto LABEL_43;
  }
  locality = self->_locality;
  if ((unint64_t)locality | v4[13] && !-[NSString isEqual:](locality, "isEqual:"))
    goto LABEL_43;
  postCode = self->_postCode;
  if ((unint64_t)postCode | v4[17] && !-[NSString isEqual:](postCode, "isEqual:"))
    goto LABEL_43;
  subLocality = self->_subLocality;
  if ((unint64_t)subLocality | v4[21] && !-[NSString isEqual:](subLocality, "isEqual:"))
    goto LABEL_43;
  premises = self->_premises;
  if ((unint64_t)premises | v4[18] && !-[NSString isEqual:](premises, "isEqual:"))
    goto LABEL_43;
  thoroughfare = self->_thoroughfare;
  if ((unint64_t)thoroughfare | v4[24] && !-[NSString isEqual:](thoroughfare, "isEqual:"))
    goto LABEL_43;
  subThoroughfare = self->_subThoroughfare;
  if ((unint64_t)subThoroughfare | v4[23] && !-[NSString isEqual:](subThoroughfare, "isEqual:"))
    goto LABEL_43;
  fullThoroughfare = self->_fullThoroughfare;
  if ((unint64_t)fullThoroughfare | v4[11] && !-[NSString isEqual:](fullThoroughfare, "isEqual:"))
    goto LABEL_43;
  postCodeExtension = self->_postCodeExtension;
  if ((unint64_t)postCodeExtension | v4[15]
    && !-[NSString isEqual:](postCodeExtension, "isEqual:"))
  {
    goto LABEL_43;
  }
  if (((areaOfInterests = self->_areaOfInterests, !((unint64_t)areaOfInterests | v4[7]))
     || -[NSMutableArray isEqual:](areaOfInterests, "isEqual:"))
    && ((inlandWater = self->_inlandWater, !((unint64_t)inlandWater | v4[12]))
     || -[NSString isEqual:](inlandWater, "isEqual:"))
    && ((ocean = self->_ocean, !((unint64_t)ocean | v4[14]))
     || -[NSString isEqual:](ocean, "isEqual:"))
    && ((dependentLocalitys = self->_dependentLocalitys, !((unint64_t)dependentLocalitys | v4[10]))
     || -[NSMutableArray isEqual:](dependentLocalitys, "isEqual:"))
    && ((premise = self->_premise, !((unint64_t)premise | v4[19]))
     || -[NSString isEqual:](premise, "isEqual:"))
    && ((subPremises = self->_subPremises, !((unint64_t)subPremises | v4[22]))
     || -[NSMutableArray isEqual:](subPremises, "isEqual:"))
    && ((postCodeFull = self->_postCodeFull, !((unint64_t)postCodeFull | v4[16]))
     || -[NSString isEqual:](postCodeFull, "isEqual:")))
  {
    IsEqual = PBRepeatedInt64IsEqual();
  }
  else
  {
LABEL_43:
    IsEqual = 0;
  }

  return IsEqual;
}

- (unint64_t)hash
{
  NSUInteger v3;
  NSUInteger v4;
  NSUInteger v5;
  NSUInteger v6;
  NSUInteger v7;
  NSUInteger v8;
  NSUInteger v9;
  NSUInteger v10;
  NSUInteger v11;
  NSUInteger v12;
  NSUInteger v13;
  NSUInteger v14;
  NSUInteger v15;
  uint64_t v16;
  NSUInteger v17;
  NSUInteger v18;
  uint64_t v19;
  NSUInteger v20;
  uint64_t v21;
  NSUInteger v22;

  v3 = -[NSString hash](self->_country, "hash");
  v4 = -[NSString hash](self->_countryCode, "hash") ^ v3;
  v5 = -[NSString hash](self->_administrativeArea, "hash");
  v6 = v4 ^ v5 ^ -[NSString hash](self->_administrativeAreaCode, "hash");
  v7 = -[NSString hash](self->_subAdministrativeArea, "hash");
  v8 = v7 ^ -[NSString hash](self->_locality, "hash");
  v9 = v6 ^ v8 ^ -[NSString hash](self->_postCode, "hash");
  v10 = -[NSString hash](self->_subLocality, "hash");
  v11 = v10 ^ -[NSString hash](self->_premises, "hash");
  v12 = v11 ^ -[NSString hash](self->_thoroughfare, "hash");
  v13 = v9 ^ v12 ^ -[NSString hash](self->_subThoroughfare, "hash");
  v14 = -[NSString hash](self->_fullThoroughfare, "hash");
  v15 = v14 ^ -[NSString hash](self->_postCodeExtension, "hash");
  v16 = v15 ^ -[NSMutableArray hash](self->_areaOfInterests, "hash");
  v17 = v16 ^ -[NSString hash](self->_inlandWater, "hash");
  v18 = v13 ^ v17 ^ -[NSString hash](self->_ocean, "hash");
  v19 = -[NSMutableArray hash](self->_dependentLocalitys, "hash");
  v20 = v19 ^ -[NSString hash](self->_premise, "hash");
  v21 = v20 ^ -[NSMutableArray hash](self->_subPremises, "hash");
  v22 = v21 ^ -[NSString hash](self->_postCodeFull, "hash");
  return v18 ^ v22 ^ PBRepeatedInt64Hash();
}

- (void)mergeFrom:(id)a3
{
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t j;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t k;
  uint64_t v20;
  uint64_t v21;
  uint64_t m;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  _BYTE v35[128];
  _BYTE v36[128];
  _BYTE v37[128];
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (*((_QWORD *)v4 + 9))
    -[GEOStructuredAddress setCountry:](self, "setCountry:");
  if (*((_QWORD *)v4 + 8))
    -[GEOStructuredAddress setCountryCode:](self, "setCountryCode:");
  if (*((_QWORD *)v4 + 6))
    -[GEOStructuredAddress setAdministrativeArea:](self, "setAdministrativeArea:");
  if (*((_QWORD *)v4 + 5))
    -[GEOStructuredAddress setAdministrativeAreaCode:](self, "setAdministrativeAreaCode:");
  if (*((_QWORD *)v4 + 20))
    -[GEOStructuredAddress setSubAdministrativeArea:](self, "setSubAdministrativeArea:");
  if (*((_QWORD *)v4 + 13))
    -[GEOStructuredAddress setLocality:](self, "setLocality:");
  if (*((_QWORD *)v4 + 17))
    -[GEOStructuredAddress setPostCode:](self, "setPostCode:");
  if (*((_QWORD *)v4 + 21))
    -[GEOStructuredAddress setSubLocality:](self, "setSubLocality:");
  if (*((_QWORD *)v4 + 18))
    -[GEOStructuredAddress setPremises:](self, "setPremises:");
  if (*((_QWORD *)v4 + 24))
    -[GEOStructuredAddress setThoroughfare:](self, "setThoroughfare:");
  if (*((_QWORD *)v4 + 23))
    -[GEOStructuredAddress setSubThoroughfare:](self, "setSubThoroughfare:");
  if (*((_QWORD *)v4 + 11))
    -[GEOStructuredAddress setFullThoroughfare:](self, "setFullThoroughfare:");
  if (*((_QWORD *)v4 + 15))
    -[GEOStructuredAddress setPostCodeExtension:](self, "setPostCodeExtension:");
  v33 = 0u;
  v34 = 0u;
  v31 = 0u;
  v32 = 0u;
  v5 = *((id *)v4 + 7);
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v31, v37, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v32;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v32 != v8)
          objc_enumerationMutation(v5);
        -[GEOStructuredAddress addAreaOfInterest:](self, "addAreaOfInterest:", *(_QWORD *)(*((_QWORD *)&v31 + 1) + 8 * i));
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v31, v37, 16);
    }
    while (v7);
  }

  if (*((_QWORD *)v4 + 12))
    -[GEOStructuredAddress setInlandWater:](self, "setInlandWater:");
  if (*((_QWORD *)v4 + 14))
    -[GEOStructuredAddress setOcean:](self, "setOcean:");
  v29 = 0u;
  v30 = 0u;
  v27 = 0u;
  v28 = 0u;
  v10 = *((id *)v4 + 10);
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v27, v36, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v28;
    do
    {
      for (j = 0; j != v12; ++j)
      {
        if (*(_QWORD *)v28 != v13)
          objc_enumerationMutation(v10);
        -[GEOStructuredAddress addDependentLocality:](self, "addDependentLocality:", *(_QWORD *)(*((_QWORD *)&v27 + 1) + 8 * j));
      }
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v27, v36, 16);
    }
    while (v12);
  }

  if (*((_QWORD *)v4 + 19))
    -[GEOStructuredAddress setPremise:](self, "setPremise:");
  v25 = 0u;
  v26 = 0u;
  v23 = 0u;
  v24 = 0u;
  v15 = *((id *)v4 + 22);
  v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v23, v35, 16);
  if (v16)
  {
    v17 = v16;
    v18 = *(_QWORD *)v24;
    do
    {
      for (k = 0; k != v17; ++k)
      {
        if (*(_QWORD *)v24 != v18)
          objc_enumerationMutation(v15);
        -[GEOStructuredAddress addSubPremise:](self, "addSubPremise:", *(_QWORD *)(*((_QWORD *)&v23 + 1) + 8 * k), (_QWORD)v23);
      }
      v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v23, v35, 16);
    }
    while (v17);
  }

  if (*((_QWORD *)v4 + 16))
    -[GEOStructuredAddress setPostCodeFull:](self, "setPostCodeFull:");
  v20 = objc_msgSend(v4, "geoIdsCount", (_QWORD)v23);
  if (v20)
  {
    v21 = v20;
    for (m = 0; m != v21; ++m)
      -[GEOStructuredAddress addGeoId:](self, "addGeoId:", objc_msgSend(v4, "geoIdAtIndex:", m));
  }

}

- (PBUnknownFields)unknownFields
{
  return self->_unknownFields;
}

- (void)clearUnknownFields:(BOOL)a3
{
  _BOOL4 v3;
  PBUnknownFields *unknownFields;
  NSMutableArray *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v3 = a3;
  v16 = *MEMORY[0x1E0C80C00];
  unknownFields = self->_unknownFields;
  self->_unknownFields = 0;

  if (v3)
  {
    v13 = 0u;
    v14 = 0u;
    v11 = 0u;
    v12 = 0u;
    v6 = self->_subPremises;
    v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v12;
      do
      {
        v10 = 0;
        do
        {
          if (*(_QWORD *)v12 != v9)
            objc_enumerationMutation(v6);
          objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * v10++), "clearUnknownFields:", 1, (_QWORD)v11);
        }
        while (v8 != v10);
        v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      }
      while (v8);
    }

  }
}

@end
