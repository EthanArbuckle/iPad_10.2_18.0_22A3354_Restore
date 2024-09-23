@implementation CCSignificantLocationAddress

- (CCSignificantLocationAddress)initWithThoroughfare:(id)a3 subLocality:(id)a4 locality:(id)a5 country:(id)a6 error:(id *)a7
{
  return -[CCSignificantLocationAddress initWithThoroughfare:subLocality:locality:country:subPremises:subThoroughfare:subAministrativeArea:administrativeArea:administrativeAreaCode:postalCode:countryCode:inlandWater:ocean:areasOfInterest:isIsland:iso3166CountryCode:iso3166SubdivisionCode:mergedThoroughfare:error:](self, "initWithThoroughfare:subLocality:locality:country:subPremises:subThoroughfare:subAministrativeArea:administrativeArea:administrativeAreaCode:postalCode:countryCode:inlandWater:ocean:areasOfInterest:isIsland:iso3166CountryCode:iso3166SubdivisionCode:mergedThoroughfare:error:", a3, a4, a5, a6, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
           0,
           0,
           0,
           a7);
}

- (CCSignificantLocationAddress)initWithThoroughfare:(id)a3 subLocality:(id)a4 locality:(id)a5 country:(id)a6 subPremises:(id)a7 subThoroughfare:(id)a8 subAministrativeArea:(id)a9 administrativeArea:(id)a10 administrativeAreaCode:(id)a11 postalCode:(id)a12 countryCode:(id)a13 inlandWater:(id)a14 ocean:(id)a15 areasOfInterest:(id)a16 isIsland:(id)a17 iso3166CountryCode:(id)a18 iso3166SubdivisionCode:(id)a19 mergedThoroughfare:(id)a20 error:(id *)a21
{
  id v26;
  id v27;
  id v28;
  id v29;
  void *v30;
  int IsInstanceOfExpectedClass;
  id v32;
  void *v33;
  int v34;
  id v35;
  int v36;
  CCSignificantLocationAddress *v37;
  int v38;
  int v39;
  id v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t i;
  void *v45;
  int v46;
  id v47;
  int v48;
  void *v49;
  int v50;
  int v51;
  int v52;
  int v53;
  int v54;
  int v55;
  int v56;
  id v57;
  uint64_t v58;
  id v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t j;
  int v63;
  int v64;
  int v65;
  int v67;
  id v68;
  void *v69;
  CCSignificantLocationAddress *v70;
  id v71;
  void *v72;
  id v73;
  id v75;
  id v76;
  id v77;
  id v78;
  id v79;
  id v80;
  id v81;
  id v82;
  id v83;
  id v84;
  id v85;
  id v86;
  id v87;
  __int128 v88;
  __int128 v89;
  __int128 v90;
  __int128 v91;
  id v92;
  id v93;
  id v94;
  id v95;
  id v96;
  id v97;
  id v98;
  id v99;
  id v100;
  __int128 v101;
  __int128 v102;
  __int128 v103;
  __int128 v104;
  id v105;
  id v106;
  id v107;
  id v108;
  uint64_t v109;
  _BYTE v110[128];
  _BYTE v111[128];
  uint64_t v112;

  v112 = *MEMORY[0x24BDAC8D0];
  v26 = a3;
  v27 = a4;
  v28 = a5;
  v29 = a6;
  v85 = a7;
  v87 = a8;
  v86 = a9;
  v84 = a10;
  v83 = a11;
  v82 = a12;
  v81 = a13;
  v80 = a14;
  v79 = a15;
  v78 = a16;
  v77 = a17;
  v76 = a18;
  v75 = a19;
  v73 = a20;
  v30 = (void *)objc_opt_new();
  if (v26)
  {
    objc_opt_class();
    v109 = 0;
    IsInstanceOfExpectedClass = CCValidateIsInstanceOfExpectedClass();
    v32 = 0;
    if (!IsInstanceOfExpectedClass)
    {
      CCSetError();
      v37 = 0;
      v33 = v85;
LABEL_84:
      v49 = v87;
      goto LABEL_85;
    }
    CCPBDataWriterWriteStringField();
  }
  else
  {
    v32 = 0;
  }
  v33 = v85;
  if (v27)
  {
    objc_opt_class();
    v108 = v32;
    v34 = CCValidateIsInstanceOfExpectedClass();
    v35 = v32;

    if (!v34)
      goto LABEL_77;
    CCPBDataWriterWriteStringField();
    if (!v28)
    {
LABEL_8:
      v32 = v35;
      if (v29)
        goto LABEL_9;
      goto LABEL_16;
    }
  }
  else
  {
    v35 = v32;
    if (!v28)
      goto LABEL_8;
  }
  objc_opt_class();
  v107 = v35;
  v38 = CCValidateIsInstanceOfExpectedClass();
  v32 = v35;

  if (!v38)
    goto LABEL_83;
  CCPBDataWriterWriteStringField();
  if (v29)
  {
LABEL_9:
    objc_opt_class();
    v106 = v32;
    v36 = CCValidateIsInstanceOfExpectedClass();
    v35 = v32;

    if (!v36)
      goto LABEL_77;
    CCPBDataWriterWriteStringField();
    if (!v85)
      goto LABEL_11;
    goto LABEL_17;
  }
LABEL_16:
  v35 = v32;
  if (!v85)
  {
LABEL_11:
    v32 = v35;
    goto LABEL_26;
  }
LABEL_17:
  objc_opt_class();
  v105 = v35;
  v39 = CCValidateArrayValues();
  v32 = v35;

  if (!v39)
    goto LABEL_83;
  v71 = v26;
  v103 = 0u;
  v104 = 0u;
  v101 = 0u;
  v102 = 0u;
  v40 = v85;
  v41 = objc_msgSend(v40, "countByEnumeratingWithState:objects:count:", &v101, v111, 16);
  if (v41)
  {
    v42 = v41;
    v43 = *(_QWORD *)v102;
    do
    {
      for (i = 0; i != v42; ++i)
      {
        if (*(_QWORD *)v102 != v43)
          objc_enumerationMutation(v40);
        objc_msgSend(*(id *)(*((_QWORD *)&v101 + 1) + 8 * i), "data");
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        CCPBDataWriterWriteDataField();

      }
      v42 = objc_msgSend(v40, "countByEnumeratingWithState:objects:count:", &v101, v111, 16);
    }
    while (v42);
  }

  v26 = v71;
  v33 = v85;
LABEL_26:
  if (v87)
  {
    objc_opt_class();
    v100 = v32;
    v46 = CCValidateIsInstanceOfExpectedClass();
    v47 = v32;

    if (!v46)
    {
      CCSetError();
      v37 = 0;
      v32 = v47;
      v49 = v87;
      goto LABEL_85;
    }
    CCPBDataWriterWriteStringField();
  }
  else
  {
    v47 = v32;
  }
  if (v86)
  {
    objc_opt_class();
    v99 = v47;
    v48 = CCValidateIsInstanceOfExpectedClass();
    v32 = v47;

    if (!v48)
      goto LABEL_83;
    CCPBDataWriterWriteStringField();
  }
  else
  {
    v32 = v47;
  }
  if (v84)
  {
    objc_opt_class();
    v98 = v32;
    v50 = CCValidateIsInstanceOfExpectedClass();
    v35 = v32;

    if (!v50)
      goto LABEL_77;
    CCPBDataWriterWriteStringField();
  }
  else
  {
    v35 = v32;
  }
  if (v83)
  {
    objc_opt_class();
    v97 = v35;
    v51 = CCValidateIsInstanceOfExpectedClass();
    v32 = v35;

    if (!v51)
      goto LABEL_83;
    CCPBDataWriterWriteStringField();
  }
  else
  {
    v32 = v35;
  }
  if (v82)
  {
    objc_opt_class();
    v96 = v32;
    v52 = CCValidateIsInstanceOfExpectedClass();
    v35 = v32;

    if (!v52)
      goto LABEL_77;
    CCPBDataWriterWriteStringField();
  }
  else
  {
    v35 = v32;
  }
  if (v81)
  {
    objc_opt_class();
    v95 = v35;
    v53 = CCValidateIsInstanceOfExpectedClass();
    v32 = v35;

    if (!v53)
      goto LABEL_83;
    CCPBDataWriterWriteStringField();
  }
  else
  {
    v32 = v35;
  }
  if (v80)
  {
    objc_opt_class();
    v94 = v32;
    v54 = CCValidateIsInstanceOfExpectedClass();
    v35 = v32;

    if (!v54)
      goto LABEL_77;
    CCPBDataWriterWriteStringField();
  }
  else
  {
    v35 = v32;
  }
  if (v79)
  {
    objc_opt_class();
    v93 = v35;
    v55 = CCValidateIsInstanceOfExpectedClass();
    v32 = v35;

    if (v55)
    {
      CCPBDataWriterWriteStringField();
      goto LABEL_59;
    }
LABEL_83:
    CCSetError();
    v37 = 0;
    goto LABEL_84;
  }
  v32 = v35;
LABEL_59:
  if (!v78)
  {
    v72 = v32;
    v59 = v77;
    goto LABEL_70;
  }
  objc_opt_class();
  v92 = v32;
  v56 = CCValidateArrayValues();
  v35 = v32;

  if (!v56)
  {
LABEL_77:
    CCSetError();
    v37 = 0;
    v32 = v35;
    goto LABEL_84;
  }
  v72 = v35;
  v90 = 0u;
  v91 = 0u;
  v88 = 0u;
  v89 = 0u;
  v57 = v78;
  v58 = objc_msgSend(v57, "countByEnumeratingWithState:objects:count:", &v88, v110, 16);
  v59 = v77;
  if (v58)
  {
    v60 = v58;
    v61 = *(_QWORD *)v89;
    do
    {
      for (j = 0; j != v60; ++j)
      {
        if (*(_QWORD *)v89 != v61)
          objc_enumerationMutation(v57);
        CCPBDataWriterWriteStringField();
      }
      v60 = objc_msgSend(v57, "countByEnumeratingWithState:objects:count:", &v88, v110, 16);
    }
    while (v60);
  }

  v33 = v85;
LABEL_70:
  v49 = v87;
  if (v59)
  {
    objc_opt_class();
    v63 = CCValidateIsInstanceOfExpectedClass();
    v32 = v72;

    if (!v63)
    {
      CCSetError();
      v37 = 0;
      goto LABEL_85;
    }
    objc_msgSend(v77, "BOOLValue");
    CCPBDataWriterWriteBOOLField();
  }
  else
  {
    v32 = v72;
  }
  if (v76)
  {
    objc_opt_class();
    v64 = CCValidateIsInstanceOfExpectedClass();
    v35 = v32;

    if (v64)
    {
      CCPBDataWriterWriteStringField();
      goto LABEL_80;
    }
    goto LABEL_77;
  }
  v35 = v32;
LABEL_80:
  if (!v75)
  {
    v32 = v35;
    v49 = v87;
    goto LABEL_87;
  }
  objc_opt_class();
  v65 = CCValidateIsInstanceOfExpectedClass();
  v32 = v35;

  if (!v65)
    goto LABEL_83;
  CCPBDataWriterWriteStringField();
  v49 = v87;
LABEL_87:
  if (v73)
  {
    objc_opt_class();
    v67 = CCValidateIsInstanceOfExpectedClass();
    v68 = v32;

    if (!v67)
    {
      CCSetError();
      v37 = 0;
      v32 = v68;
      goto LABEL_85;
    }
    CCPBDataWriterWriteStringField();
    v32 = v68;
  }
  objc_msgSend(v30, "immutableData");
  v69 = (void *)objc_claimAutoreleasedReturnValue();
  v70 = -[CCItemMessage initWithData:error:](self, "initWithData:error:", v69, a21);

  self = v70;
  v37 = v70;
  v33 = v85;
LABEL_85:

  return v37;
}

- (BOOL)initializeFieldValuesFromData:(id)a3 error:(id *)a4
{
  id v5;
  char *v6;
  int *v7;
  int *v8;
  void *v9;
  void *v10;
  id v11;
  int *v12;
  int *v13;
  BOOL v14;
  char v15;
  unsigned int v16;
  unint64_t v17;
  uint64_t v18;
  unint64_t v19;
  char v20;
  BOOL v21;
  objc_class *v22;
  uint64_t v23;
  void *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  CCSignificantLocationSubPremise *v28;
  CCSignificantLocationSubPremise *v29;
  void *v30;
  char v31;
  unsigned int v32;
  uint64_t v33;
  uint64_t v34;
  unint64_t v35;
  char v36;
  void *v37;
  objc_class *v38;
  void *v39;
  NSArray *v40;
  NSArray *subPremises;
  NSArray *v42;
  NSArray *areasOfInterest;
  objc_class *v44;
  void *v45;
  void *v46;
  void *v47;
  BOOL v48;
  id v50;
  void *v51;
  id v52;

  v5 = a3;
  v6 = (char *)objc_msgSend(objc_alloc(MEMORY[0x24BE156A0]), "initWithData:", v5);
  v7 = (int *)MEMORY[0x24BE15728];
  v8 = (int *)MEMORY[0x24BE15720];
  if (*(_QWORD *)&v6[*MEMORY[0x24BE15728]] >= *(_QWORD *)&v6[*MEMORY[0x24BE15720]])
  {
    v10 = 0;
    v9 = 0;
LABEL_66:
    v11 = 0;
  }
  else
  {
    v9 = 0;
    v10 = 0;
    v11 = 0;
    v12 = (int *)MEMORY[0x24BE15718];
    v13 = (int *)MEMORY[0x24BE15710];
    do
    {
      if (*(_QWORD *)&v6[*v12])
        v14 = 0;
      else
        v14 = v11 == 0;
      if (!v14)
        break;
      v15 = 0;
      v16 = 0;
      v17 = 0;
      while (1)
      {
        v18 = *v7;
        v19 = *(_QWORD *)&v6[v18];
        if (v19 == -1 || v19 >= *(_QWORD *)&v6[*v8])
          break;
        v20 = *(_BYTE *)(*(_QWORD *)&v6[*v13] + v19);
        *(_QWORD *)&v6[v18] = v19 + 1;
        v17 |= (unint64_t)(v20 & 0x7F) << v15;
        if ((v20 & 0x80) == 0)
          goto LABEL_17;
        v15 += 7;
        v21 = v16++ >= 9;
        if (v21)
        {
          v17 = 0;
          if (*(_QWORD *)&v6[*v12])
            goto LABEL_66;
          goto LABEL_18;
        }
      }
      *(_QWORD *)&v6[*v12] = 1;
LABEL_17:
      if (*(_QWORD *)&v6[*v12])
        goto LABEL_66;
LABEL_18:
      switch((v17 >> 3))
      {
        case 1u:
          CCPBReaderReadStringNoCopy();
          v22 = (objc_class *)objc_claimAutoreleasedReturnValue();
          v23 = 24;
          goto LABEL_54;
        case 2u:
          CCPBReaderReadStringNoCopy();
          v22 = (objc_class *)objc_claimAutoreleasedReturnValue();
          v23 = 32;
          goto LABEL_54;
        case 3u:
          CCPBReaderReadStringNoCopy();
          v22 = (objc_class *)objc_claimAutoreleasedReturnValue();
          v23 = 40;
          goto LABEL_54;
        case 4u:
          CCPBReaderReadStringNoCopy();
          v22 = (objc_class *)objc_claimAutoreleasedReturnValue();
          v23 = 48;
          goto LABEL_54;
        case 5u:
          v50 = v5;
          v51 = v9;
          CCPBReaderReadDataNoCopy();
          v25 = objc_claimAutoreleasedReturnValue();
          v26 = v10;
          v27 = (void *)v25;
          v24 = v26;
          if (!v26)
            v24 = (void *)objc_opt_new();
          v28 = [CCSignificantLocationSubPremise alloc];
          v52 = 0;
          v29 = -[CCItemMessage initWithData:error:](v28, "initWithData:error:", v27, &v52);
          v11 = v52;
          if (!v11 && v29)
            objc_msgSend(v24, "addObject:", v29);

          goto LABEL_63;
        case 6u:
          CCPBReaderReadStringNoCopy();
          v22 = (objc_class *)objc_claimAutoreleasedReturnValue();
          v23 = 64;
          goto LABEL_54;
        case 7u:
          CCPBReaderReadStringNoCopy();
          v22 = (objc_class *)objc_claimAutoreleasedReturnValue();
          v23 = 72;
          goto LABEL_54;
        case 8u:
          CCPBReaderReadStringNoCopy();
          v22 = (objc_class *)objc_claimAutoreleasedReturnValue();
          v23 = 80;
          goto LABEL_54;
        case 9u:
          CCPBReaderReadStringNoCopy();
          v22 = (objc_class *)objc_claimAutoreleasedReturnValue();
          v23 = 88;
          goto LABEL_54;
        case 0xAu:
          CCPBReaderReadStringNoCopy();
          v22 = (objc_class *)objc_claimAutoreleasedReturnValue();
          v23 = 96;
          goto LABEL_54;
        case 0xBu:
          CCPBReaderReadStringNoCopy();
          v22 = (objc_class *)objc_claimAutoreleasedReturnValue();
          v23 = 104;
          goto LABEL_54;
        case 0xCu:
          CCPBReaderReadStringNoCopy();
          v22 = (objc_class *)objc_claimAutoreleasedReturnValue();
          v23 = 112;
          goto LABEL_54;
        case 0xDu:
          CCPBReaderReadStringNoCopy();
          v22 = (objc_class *)objc_claimAutoreleasedReturnValue();
          v23 = 120;
          goto LABEL_54;
        case 0xEu:
          CCPBReaderReadStringNoCopy();
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          if (!v9)
            v9 = (void *)objc_opt_new();
          if (v30)
            objc_msgSend(v9, "addObject:", v30);

          goto LABEL_55;
        case 0xFu:
          v31 = 0;
          v32 = 0;
          v33 = 0;
          break;
        case 0x10u:
          CCPBReaderReadStringNoCopy();
          v22 = (objc_class *)objc_claimAutoreleasedReturnValue();
          v23 = 136;
          goto LABEL_54;
        case 0x11u:
          CCPBReaderReadStringNoCopy();
          v22 = (objc_class *)objc_claimAutoreleasedReturnValue();
          v23 = 144;
          goto LABEL_54;
        case 0x12u:
          CCPBReaderReadStringNoCopy();
          v22 = (objc_class *)objc_claimAutoreleasedReturnValue();
          v23 = 152;
LABEL_54:
          v37 = *(Class *)((char *)&self->super.super.isa + v23);
          *(Class *)((char *)&self->super.super.isa + v23) = v22;

LABEL_55:
          v11 = 0;
          continue;
        default:
          v51 = v9;
          v24 = v10;
          if ((CCPBReaderSkipValueWithTag() & 1) != 0)
          {
            v11 = 0;
          }
          else
          {
            v38 = (objc_class *)objc_opt_class();
            NSStringFromClass(v38);
            v50 = v5;
            v39 = (void *)objc_claimAutoreleasedReturnValue();
            CCSkipFieldErrorForMessage();
            v11 = (id)objc_claimAutoreleasedReturnValue();

LABEL_63:
            v5 = v50;
          }
          v10 = v24;
          v9 = v51;
          continue;
      }
      while (1)
      {
        v34 = *v7;
        v35 = *(_QWORD *)&v6[v34];
        if (v35 == -1 || v35 >= *(_QWORD *)&v6[*v8])
          break;
        v36 = *(_BYTE *)(*(_QWORD *)&v6[*v13] + v35);
        *(_QWORD *)&v6[v34] = v35 + 1;
        v33 |= (unint64_t)(v36 & 0x7F) << v31;
        if ((v36 & 0x80) == 0)
          goto LABEL_59;
        v31 += 7;
        v21 = v32++ >= 9;
        if (v21)
        {
          v33 = 0;
          goto LABEL_61;
        }
      }
      *(_QWORD *)&v6[*v12] = 1;
LABEL_59:
      if (*(_QWORD *)&v6[*v12])
        v33 = 0;
LABEL_61:
      v11 = 0;
      self->_isIsland = v33 != 0;
      self->_hasIsIsland = 1;
    }
    while (*(_QWORD *)&v6[*v7] < *(_QWORD *)&v6[*v8]);
  }
  v40 = (NSArray *)objc_msgSend(v10, "copy", v50);
  subPremises = self->_subPremises;
  self->_subPremises = v40;

  v42 = (NSArray *)objc_msgSend(v9, "copy");
  areasOfInterest = self->_areasOfInterest;
  self->_areasOfInterest = v42;

  if (v11)
  {
    CCSetError();
  }
  else
  {
    if (!*(_QWORD *)&v6[*MEMORY[0x24BE15718]])
    {
      v48 = 1;
      goto LABEL_72;
    }
    v44 = (objc_class *)objc_opt_class();
    NSStringFromClass(v44);
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    CCInvalidBufferErrorForMessage();
    v46 = v10;
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    CCSetError();

    v10 = v46;
  }
  v48 = 0;
LABEL_72:

  return v48;
}

- (NSString)thoroughfare
{
  return (NSString *)(id)-[NSString copy](self->_thoroughfare, "copy");
}

- (NSString)subLocality
{
  return (NSString *)(id)-[NSString copy](self->_subLocality, "copy");
}

- (NSString)locality
{
  return (NSString *)(id)-[NSString copy](self->_locality, "copy");
}

- (NSString)country
{
  return (NSString *)(id)-[NSString copy](self->_country, "copy");
}

- (NSArray)subPremises
{
  return (NSArray *)(id)objc_msgSend(objc_alloc(MEMORY[0x24BDBCE30]), "initWithArray:copyItems:", self->_subPremises, 1);
}

- (NSString)subThoroughfare
{
  return (NSString *)(id)-[NSString copy](self->_subThoroughfare, "copy");
}

- (NSString)subAministrativeArea
{
  return (NSString *)(id)-[NSString copy](self->_subAministrativeArea, "copy");
}

- (NSString)administrativeArea
{
  return (NSString *)(id)-[NSString copy](self->_administrativeArea, "copy");
}

- (NSString)administrativeAreaCode
{
  return (NSString *)(id)-[NSString copy](self->_administrativeAreaCode, "copy");
}

- (NSString)postalCode
{
  return (NSString *)(id)-[NSString copy](self->_postalCode, "copy");
}

- (NSString)countryCode
{
  return (NSString *)(id)-[NSString copy](self->_countryCode, "copy");
}

- (NSString)inlandWater
{
  return (NSString *)(id)-[NSString copy](self->_inlandWater, "copy");
}

- (NSString)ocean
{
  return (NSString *)(id)-[NSString copy](self->_ocean, "copy");
}

- (NSArray)areasOfInterest
{
  return (NSArray *)(id)objc_msgSend(objc_alloc(MEMORY[0x24BDBCE30]), "initWithArray:copyItems:", self->_areasOfInterest, 1);
}

- (NSString)iso3166CountryCode
{
  return (NSString *)(id)-[NSString copy](self->_iso3166CountryCode, "copy");
}

- (NSString)iso3166SubdivisionCode
{
  return (NSString *)(id)-[NSString copy](self->_iso3166SubdivisionCode, "copy");
}

- (NSString)mergedThoroughfare
{
  return (NSString *)(id)-[NSString copy](self->_mergedThoroughfare, "copy");
}

- (void)enumerateFieldsUsingBlock:(id)a3 parentFieldType:(unsigned __int16)a4
{
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
  void (**v23)(id, void *);

  v23 = (void (**)(id, void *))a3;
  if (self->_thoroughfare)
  {
    v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE15670]), "initWithFieldType:stringValue:", 15770, self->_thoroughfare);
    v23[2](v23, v5);

  }
  if (self->_subLocality)
  {
    v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE15670]), "initWithFieldType:stringValue:", 15771, self->_subLocality);
    v23[2](v23, v6);

  }
  if (self->_locality)
  {
    v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE15670]), "initWithFieldType:stringValue:", 15772, self->_locality);
    v23[2](v23, v7);

  }
  if (self->_country)
  {
    v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE15670]), "initWithFieldType:stringValue:", 15773, self->_country);
    v23[2](v23, v8);

  }
  if (self->_subPremises)
  {
    v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE15670]), "initWithFieldType:repeatedSubMessageValue:", 15774, self->_subPremises);
    v23[2](v23, v9);

  }
  if (self->_subThoroughfare)
  {
    v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE15670]), "initWithFieldType:stringValue:", 15777, self->_subThoroughfare);
    v23[2](v23, v10);

  }
  if (self->_subAministrativeArea)
  {
    v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE15670]), "initWithFieldType:stringValue:", 15778, self->_subAministrativeArea);
    v23[2](v23, v11);

  }
  if (self->_administrativeArea)
  {
    v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE15670]), "initWithFieldType:stringValue:", 15779, self->_administrativeArea);
    v23[2](v23, v12);

  }
  if (self->_administrativeAreaCode)
  {
    v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE15670]), "initWithFieldType:stringValue:", 15780, self->_administrativeAreaCode);
    v23[2](v23, v13);

  }
  if (self->_postalCode)
  {
    v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE15670]), "initWithFieldType:stringValue:", 15781, self->_postalCode);
    v23[2](v23, v14);

  }
  if (self->_countryCode)
  {
    v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE15670]), "initWithFieldType:stringValue:", 15782, self->_countryCode);
    v23[2](v23, v15);

  }
  if (self->_inlandWater)
  {
    v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE15670]), "initWithFieldType:stringValue:", 15783, self->_inlandWater);
    v23[2](v23, v16);

  }
  if (self->_ocean)
  {
    v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE15670]), "initWithFieldType:stringValue:", 15784, self->_ocean);
    v23[2](v23, v17);

  }
  if (self->_areasOfInterest)
  {
    v18 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE15670]), "initWithFieldType:repeatedStringValue:", 15785, self->_areasOfInterest);
    v23[2](v23, v18);

  }
  if (self->_hasIsIsland)
  {
    v19 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE15670]), "initWithFieldType:BOOLValue:", 15786, self->_isIsland);
    v23[2](v23, v19);

  }
  if (self->_iso3166CountryCode)
  {
    v20 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE15670]), "initWithFieldType:stringValue:", 15787, self->_iso3166CountryCode);
    v23[2](v23, v20);

  }
  if (self->_iso3166SubdivisionCode)
  {
    v21 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE15670]), "initWithFieldType:stringValue:", 15788, self->_iso3166SubdivisionCode);
    v23[2](v23, v21);

  }
  if (self->_mergedThoroughfare)
  {
    v22 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE15670]), "initWithFieldType:stringValue:", 15789, self->_mergedThoroughfare);
    v23[2](v23, v22);

  }
}

- (id)jsonDictionary
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
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
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  _BYTE v34[128];
  uint64_t v35;

  v35 = *MEMORY[0x24BDAC8D0];
  v3 = (void *)objc_opt_new();
  if (self->_thoroughfare)
  {
    -[CCSignificantLocationAddress thoroughfare](self, "thoroughfare");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v4, CFSTR("thoroughfare"));

  }
  if (self->_subLocality)
  {
    -[CCSignificantLocationAddress subLocality](self, "subLocality");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("subLocality"));

  }
  if (self->_locality)
  {
    -[CCSignificantLocationAddress locality](self, "locality");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("locality"));

  }
  if (self->_country)
  {
    -[CCSignificantLocationAddress country](self, "country");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("country"));

  }
  v8 = (void *)objc_opt_new();
  v30 = 0u;
  v31 = 0u;
  v32 = 0u;
  v33 = 0u;
  -[CCSignificantLocationAddress subPremises](self, "subPremises", 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v30, v34, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v31;
    do
    {
      v13 = 0;
      do
      {
        if (*(_QWORD *)v31 != v12)
          objc_enumerationMutation(v9);
        objc_msgSend(*(id *)(*((_QWORD *)&v30 + 1) + 8 * v13), "jsonDictionary");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "addObject:", v14);

        ++v13;
      }
      while (v11 != v13);
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v30, v34, 16);
    }
    while (v11);
  }

  objc_msgSend(v3, "setObject:forKeyedSubscript:", v8, CFSTR("subPremises"));
  if (self->_subThoroughfare)
  {
    -[CCSignificantLocationAddress subThoroughfare](self, "subThoroughfare");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v15, CFSTR("subThoroughfare"));

  }
  if (self->_subAministrativeArea)
  {
    -[CCSignificantLocationAddress subAministrativeArea](self, "subAministrativeArea");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v16, CFSTR("subAministrativeArea"));

  }
  if (self->_administrativeArea)
  {
    -[CCSignificantLocationAddress administrativeArea](self, "administrativeArea");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v17, CFSTR("administrativeArea"));

  }
  if (self->_administrativeAreaCode)
  {
    -[CCSignificantLocationAddress administrativeAreaCode](self, "administrativeAreaCode");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v18, CFSTR("administrativeAreaCode"));

  }
  if (self->_postalCode)
  {
    -[CCSignificantLocationAddress postalCode](self, "postalCode");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v19, CFSTR("postalCode"));

  }
  if (self->_countryCode)
  {
    -[CCSignificantLocationAddress countryCode](self, "countryCode");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v20, CFSTR("countryCode"));

  }
  if (self->_inlandWater)
  {
    -[CCSignificantLocationAddress inlandWater](self, "inlandWater");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v21, CFSTR("inlandWater"));

  }
  if (self->_ocean)
  {
    -[CCSignificantLocationAddress ocean](self, "ocean");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v22, CFSTR("ocean"));

  }
  if (self->_areasOfInterest)
  {
    -[CCSignificantLocationAddress areasOfInterest](self, "areasOfInterest");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v23, CFSTR("areasOfInterest"));

  }
  if (self->_hasIsIsland)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", -[CCSignificantLocationAddress isIsland](self, "isIsland"));
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v24, CFSTR("isIsland"));

  }
  if (self->_iso3166CountryCode)
  {
    -[CCSignificantLocationAddress iso3166CountryCode](self, "iso3166CountryCode");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v25, CFSTR("iso3166CountryCode"));

  }
  if (self->_iso3166SubdivisionCode)
  {
    -[CCSignificantLocationAddress iso3166SubdivisionCode](self, "iso3166SubdivisionCode");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v26, CFSTR("iso3166SubdivisionCode"));

  }
  if (self->_mergedThoroughfare)
  {
    -[CCSignificantLocationAddress mergedThoroughfare](self, "mergedThoroughfare");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v27, CFSTR("mergedThoroughfare"));

  }
  v28 = (void *)objc_msgSend(v3, "copy");

  return v28;
}

- (CCSignificantLocationAddress)initWithJSONDictionary:(id)a3 error:(id *)a4
{
  id v6;
  char IsInstanceOfExpectedClass;
  id v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  id v14;
  char v15;
  id v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t i;
  uint64_t v22;
  CCSignificantLocationSubPremise *v23;
  CCSignificantLocationSubPremise *v24;
  id v25;
  BOOL v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  CCSignificantLocationAddress *v31;
  void *v32;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  id *v40;
  id v41;
  void *v42;
  void *v43;
  CCSignificantLocationAddress *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  id v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  id v56;
  uint64_t v57;
  _BYTE v58[128];
  uint64_t v59;

  v59 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  objc_opt_class();
  v57 = 0;
  IsInstanceOfExpectedClass = CCValidateIsInstanceOfExpectedClass();
  v8 = 0;
  if ((IsInstanceOfExpectedClass & 1) != 0)
  {
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("thoroughfare"));
    v9 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("subLocality"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("locality"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("country"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("subPremises"));
    v13 = objc_claimAutoreleasedReturnValue();
    v50 = (void *)v9;
    if (v13)
    {
      v14 = (id)v13;
      objc_opt_class();
      v56 = v8;
      v15 = CCValidateIsInstanceOfExpectedClass();
      v16 = v8;

      if ((v15 & 1) == 0)
      {
        CCSetError();
        v31 = 0;
        v8 = v16;
        v32 = v50;
LABEL_22:

        goto LABEL_23;
      }
      v41 = v16;
      v42 = v11;
      v49 = v12;
      v43 = v10;
      v44 = self;
      v17 = (void *)objc_opt_new();
      v52 = 0u;
      v53 = 0u;
      v54 = 0u;
      v55 = 0u;
      v14 = v14;
      v18 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v52, v58, 16);
      if (v18)
      {
        v19 = v18;
        v20 = *(_QWORD *)v53;
        do
        {
          for (i = 0; i != v19; ++i)
          {
            if (*(_QWORD *)v53 != v20)
              objc_enumerationMutation(v14);
            v22 = *(_QWORD *)(*((_QWORD *)&v52 + 1) + 8 * i);
            v23 = [CCSignificantLocationSubPremise alloc];
            v51 = 0;
            v24 = -[CCSignificantLocationSubPremise initWithJSONDictionary:error:](v23, "initWithJSONDictionary:error:", v22, &v51);
            v25 = v51;
            if (v24)
              v26 = v25 == 0;
            else
              v26 = 0;
            if (!v26)
            {
              v30 = v25;
              CCSetError();

              v31 = 0;
              self = v44;
              v12 = v49;
              v32 = v50;
              v11 = v42;
              goto LABEL_21;
            }
            objc_msgSend(v17, "addObject:", v24);

          }
          v19 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v52, v58, 16);
        }
        while (v19);
      }
      v40 = a4;

    }
    else
    {
      v40 = a4;
      v41 = v8;
      v49 = v12;
      v42 = v11;
      v43 = v10;
      v44 = self;
      v17 = 0;
    }
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("subThoroughfare"));
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("subAministrativeArea"));
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("administrativeArea"));
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("administrativeAreaCode"));
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("postalCode"));
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("countryCode"));
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("inlandWater"));
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("ocean"));
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("areasOfInterest"));
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("isIsland"));
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("iso3166CountryCode"));
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("iso3166SubdivisionCode"));
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("mergedThoroughfare"));
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = v50;
    v11 = v42;
    v10 = v43;
    v31 = -[CCSignificantLocationAddress initWithThoroughfare:subLocality:locality:country:subPremises:subThoroughfare:subAministrativeArea:administrativeArea:administrativeAreaCode:postalCode:countryCode:inlandWater:ocean:areasOfInterest:isIsland:iso3166CountryCode:iso3166SubdivisionCode:mergedThoroughfare:error:]([CCSignificantLocationAddress alloc], "initWithThoroughfare:subLocality:locality:country:subPremises:subThoroughfare:subAministrativeArea:administrativeArea:administrativeAreaCode:postalCode:countryCode:inlandWater:ocean:areasOfInterest:isIsland:iso3166CountryCode:iso3166SubdivisionCode:mergedThoroughfare:error:", v50, v43, v42, v49, v17, v39, v48, v47, v46, v45, v38, v37, v36, v35, v34,
            v27,
            v28,
            v29,
            v40);

    v14 = v17;
    v12 = v49;
    self = v44;
LABEL_21:
    v8 = v41;
    goto LABEL_22;
  }
  CCSetError();
  v31 = 0;
LABEL_23:

  return v31;
}

- (BOOL)isIsland
{
  return self->_isIsland;
}

- (BOOL)hasIsIsland
{
  return self->_hasIsIsland;
}

- (void)setHasIsIsland:(BOOL)a3
{
  self->_hasIsIsland = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mergedThoroughfare, 0);
  objc_storeStrong((id *)&self->_iso3166SubdivisionCode, 0);
  objc_storeStrong((id *)&self->_iso3166CountryCode, 0);
  objc_storeStrong((id *)&self->_areasOfInterest, 0);
  objc_storeStrong((id *)&self->_ocean, 0);
  objc_storeStrong((id *)&self->_inlandWater, 0);
  objc_storeStrong((id *)&self->_countryCode, 0);
  objc_storeStrong((id *)&self->_postalCode, 0);
  objc_storeStrong((id *)&self->_administrativeAreaCode, 0);
  objc_storeStrong((id *)&self->_administrativeArea, 0);
  objc_storeStrong((id *)&self->_subAministrativeArea, 0);
  objc_storeStrong((id *)&self->_subThoroughfare, 0);
  objc_storeStrong((id *)&self->_subPremises, 0);
  objc_storeStrong((id *)&self->_country, 0);
  objc_storeStrong((id *)&self->_locality, 0);
  objc_storeStrong((id *)&self->_subLocality, 0);
  objc_storeStrong((id *)&self->_thoroughfare, 0);
}

+ (unsigned)itemType
{
  return 15757;
}

+ (id)descriptionForTypeIdentifier:(unsigned __int16)a3
{
  return 0;
}

+ (Class)metaContentMessageClass
{
  return (Class)objc_opt_class();
}

+ (Class)contentMessageClass
{
  return (Class)objc_opt_class();
}

@end
