@implementation BMSiriExplicitRequestsLocation

- (BMSiriExplicitRequestsLocation)initWithLatitude:(id)a3 longitude:(id)a4 street:(id)a5 city:(id)a6 state:(id)a7 country:(id)a8 postalCode:(id)a9 countryCode:(id)a10 subAdministrativeArea:(id)a11 subLocality:(id)a12 postalAddress:(id)a13
{
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  BMSiriExplicitRequestsLocation *v24;
  id v25;
  double v26;
  double v27;
  id obj;
  id v30;
  id v31;
  id v32;
  id v33;
  id v34;
  id v35;
  id v36;
  id v38;
  id v39;
  id v40;
  id v41;
  id v42;
  objc_super v43;

  v18 = a3;
  v19 = a4;
  obj = a5;
  v42 = a5;
  v30 = a6;
  v41 = a6;
  v31 = a7;
  v40 = a7;
  v33 = a8;
  v39 = a8;
  v32 = a9;
  v38 = a9;
  v34 = a10;
  v20 = a10;
  v35 = a11;
  v21 = a11;
  v36 = a12;
  v22 = a12;
  v23 = a13;
  v43.receiver = self;
  v43.super_class = (Class)BMSiriExplicitRequestsLocation;
  v24 = -[BMEventBase init](&v43, sel_init);
  if (v24)
  {
    v24->_dataVersion = objc_msgSend((id)objc_opt_class(), "latestDataVersion");
    if (v18)
    {
      v24->_hasLatitude = 1;
      v25 = v18;
      objc_msgSend(v18, "doubleValue", obj, v30, a7, a9, v33, a10, a11, a12);
    }
    else
    {
      v25 = 0;
      v24->_hasLatitude = 0;
      v26 = -1.0;
    }
    v24->_latitude = v26;
    if (v19)
    {
      v24->_hasLongitude = 1;
      objc_msgSend(v19, "doubleValue");
    }
    else
    {
      v24->_hasLongitude = 0;
      v27 = -1.0;
    }
    v24->_longitude = v27;
    objc_storeStrong((id *)&v24->_street, obj);
    objc_storeStrong((id *)&v24->_city, v30);
    objc_storeStrong((id *)&v24->_state, v31);
    objc_storeStrong((id *)&v24->_country, v33);
    objc_storeStrong((id *)&v24->_postalCode, v32);
    objc_storeStrong((id *)&v24->_countryCode, v34);
    objc_storeStrong((id *)&v24->_subAdministrativeArea, v35);
    objc_storeStrong((id *)&v24->_subLocality, v36);
    objc_storeStrong((id *)&v24->_postalAddress, a13);
    v18 = v25;
  }

  return v24;
}

- (NSString)description
{
  void *v3;
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
  void *v15;
  void *v16;
  id v17;
  void *v18;

  v17 = objc_alloc(MEMORY[0x1E0CB3940]);
  v3 = (void *)MEMORY[0x1E0CB37E8];
  -[BMSiriExplicitRequestsLocation latitude](self, "latitude");
  objc_msgSend(v3, "numberWithDouble:");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)MEMORY[0x1E0CB37E8];
  -[BMSiriExplicitRequestsLocation longitude](self, "longitude");
  objc_msgSend(v4, "numberWithDouble:");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMSiriExplicitRequestsLocation street](self, "street");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMSiriExplicitRequestsLocation city](self, "city");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMSiriExplicitRequestsLocation state](self, "state");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMSiriExplicitRequestsLocation country](self, "country");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMSiriExplicitRequestsLocation postalCode](self, "postalCode");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMSiriExplicitRequestsLocation countryCode](self, "countryCode");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMSiriExplicitRequestsLocation subAdministrativeArea](self, "subAdministrativeArea");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMSiriExplicitRequestsLocation subLocality](self, "subLocality");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMSiriExplicitRequestsLocation postalAddress](self, "postalAddress");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = (void *)objc_msgSend(v17, "initWithFormat:", CFSTR("BMSiriExplicitRequestsLocation with latitude: %@, longitude: %@, street: %@, city: %@, state: %@, country: %@, postalCode: %@, countryCode: %@, subAdministrativeArea: %@, subLocality: %@, postalAddress: %@"), v16, v5, v15, v6, v7, v8, v9, v10, v11, v12, v13);

  return (NSString *)v18;
}

- (id)initByReadFrom:(id)a3
{
  _BYTE *v4;
  BMSiriExplicitRequestsLocation *v5;
  int *v6;
  int *v7;
  int *v8;
  int *v9;
  char v10;
  unsigned int v11;
  unint64_t v12;
  uint64_t v13;
  uint64_t v14;
  unint64_t v15;
  char v16;
  int v18;
  uint64_t v20;
  unint64_t v21;
  objc_class *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  unint64_t v26;
  void *v27;
  uint64_t v28;
  BMSiriExplicitRequestsLocation *v29;
  objc_super v31;

  v4 = a3;
  v31.receiver = self;
  v31.super_class = (Class)BMSiriExplicitRequestsLocation;
  v5 = -[BMEventBase init](&v31, sel_init);
  if (!v5)
    goto LABEL_47;
  v6 = (int *)MEMORY[0x1E0D82BF0];
  v7 = (int *)MEMORY[0x1E0D82BD8];
  v8 = (int *)MEMORY[0x1E0D82BC8];
  if (*(_QWORD *)&v4[*MEMORY[0x1E0D82BF0]] < *(_QWORD *)&v4[*MEMORY[0x1E0D82BD8]])
  {
    v9 = (int *)MEMORY[0x1E0D82BB8];
    do
    {
      if (v4[*v8])
        break;
      v10 = 0;
      v11 = 0;
      v12 = 0;
      while (1)
      {
        v13 = *v6;
        v14 = *(_QWORD *)&v4[v13];
        v15 = v14 + 1;
        if (v14 == -1 || v15 > *(_QWORD *)&v4[*v7])
          break;
        v16 = *(_BYTE *)(*(_QWORD *)&v4[*v9] + v14);
        *(_QWORD *)&v4[v13] = v15;
        v12 |= (unint64_t)(v16 & 0x7F) << v10;
        if ((v16 & 0x80) == 0)
          goto LABEL_13;
        v10 += 7;
        if (v11++ >= 9)
        {
          v12 = 0;
          v18 = v4[*v8];
          goto LABEL_15;
        }
      }
      v4[*v8] = 1;
LABEL_13:
      v18 = v4[*v8];
      if (v4[*v8])
        v12 = 0;
LABEL_15:
      if (v18 || (v12 & 7) == 4)
        break;
      switch((v12 >> 3))
      {
        case 1u:
          v5->_hasLatitude = 1;
          v20 = *v6;
          v21 = *(_QWORD *)&v4[v20];
          if (v21 <= 0xFFFFFFFFFFFFFFF7 && v21 + 8 <= *(_QWORD *)&v4[*v7])
          {
            v22 = *(objc_class **)(*(_QWORD *)&v4[*v9] + v21);
            *(_QWORD *)&v4[v20] = v21 + 8;
          }
          else
          {
            v4[*v8] = 1;
            v22 = 0;
          }
          v28 = 24;
          goto LABEL_44;
        case 2u:
          v5->_hasLongitude = 1;
          v25 = *v6;
          v26 = *(_QWORD *)&v4[v25];
          if (v26 <= 0xFFFFFFFFFFFFFFF7 && v26 + 8 <= *(_QWORD *)&v4[*v7])
          {
            v22 = *(objc_class **)(*(_QWORD *)&v4[*v9] + v26);
            *(_QWORD *)&v4[v25] = v26 + 8;
          }
          else
          {
            v4[*v8] = 1;
            v22 = 0;
          }
          v28 = 32;
LABEL_44:
          *(Class *)((char *)&v5->super.super.isa + v28) = v22;
          break;
        case 3u:
          PBReaderReadString();
          v23 = objc_claimAutoreleasedReturnValue();
          v24 = 40;
          goto LABEL_37;
        case 4u:
          PBReaderReadString();
          v23 = objc_claimAutoreleasedReturnValue();
          v24 = 48;
          goto LABEL_37;
        case 5u:
          PBReaderReadString();
          v23 = objc_claimAutoreleasedReturnValue();
          v24 = 56;
          goto LABEL_37;
        case 6u:
          PBReaderReadString();
          v23 = objc_claimAutoreleasedReturnValue();
          v24 = 64;
          goto LABEL_37;
        case 7u:
          PBReaderReadString();
          v23 = objc_claimAutoreleasedReturnValue();
          v24 = 72;
          goto LABEL_37;
        case 8u:
          PBReaderReadString();
          v23 = objc_claimAutoreleasedReturnValue();
          v24 = 80;
          goto LABEL_37;
        case 9u:
          PBReaderReadString();
          v23 = objc_claimAutoreleasedReturnValue();
          v24 = 88;
          goto LABEL_37;
        case 0xAu:
          PBReaderReadString();
          v23 = objc_claimAutoreleasedReturnValue();
          v24 = 96;
          goto LABEL_37;
        case 0xBu:
          PBReaderReadString();
          v23 = objc_claimAutoreleasedReturnValue();
          v24 = 104;
LABEL_37:
          v27 = *(Class *)((char *)&v5->super.super.isa + v24);
          *(Class *)((char *)&v5->super.super.isa + v24) = (Class)v23;

          break;
        default:
          if (!PBReaderSkipValueWithTag())
            goto LABEL_46;
          break;
      }
    }
    while (*(_QWORD *)&v4[*v6] < *(_QWORD *)&v4[*v7]);
  }
  if (v4[*v8])
LABEL_46:
    v29 = 0;
  else
LABEL_47:
    v29 = v5;

  return v29;
}

- (void)writeTo:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = v4;
  if (self->_hasLatitude)
  {
    PBDataWriterWriteDoubleField();
    v4 = v5;
  }
  if (self->_hasLongitude)
  {
    PBDataWriterWriteDoubleField();
    v4 = v5;
  }
  if (self->_street)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }
  if (self->_city)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }
  if (self->_state)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }
  if (self->_country)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }
  if (self->_postalCode)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }
  if (self->_countryCode)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }
  if (self->_subAdministrativeArea)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }
  if (self->_subLocality)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }
  if (self->_postalAddress)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }

}

- (id)serialize
{
  void *v3;
  void *v4;

  v3 = (void *)objc_opt_new();
  -[BMSiriExplicitRequestsLocation writeTo:](self, "writeTo:", v3);
  objc_msgSend(v3, "immutableData");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (BMSiriExplicitRequestsLocation)initWithJSONDictionary:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  id v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  void *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  id v28;
  void *v29;
  id v30;
  BMSiriExplicitRequestsLocation *v31;
  id v32;
  BMSiriExplicitRequestsLocation *v33;
  uint64_t v34;
  uint64_t v35;
  void *v36;
  uint64_t v37;
  id v38;
  BMSiriExplicitRequestsLocation *v39;
  uint64_t v40;
  void *v41;
  uint64_t v42;
  id v43;
  id v44;
  uint64_t v45;
  uint64_t v46;
  void *v47;
  uint64_t v48;
  id v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  void *v53;
  void *v54;
  id v55;
  uint64_t v56;
  uint64_t v57;
  void *v58;
  id v59;
  uint64_t v60;
  uint64_t v61;
  void *v62;
  uint64_t v63;
  id v64;
  BMSiriExplicitRequestsLocation *v65;
  uint64_t v66;
  uint64_t v67;
  void *v68;
  uint64_t v69;
  id v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  id v74;
  uint64_t v75;
  id v76;
  uint64_t v77;
  id v78;
  void *v79;
  void *v80;
  uint64_t v82;
  id v83;
  id v84;
  void *v85;
  void *v86;
  id v87;
  id v88;
  void *v89;
  id v90;
  void *v91;
  void *v92;
  id v93;
  id *v94;
  id v95;
  void *v96;
  id v97;
  void *v98;
  id v99;
  id *v100;
  id v101;
  BMSiriExplicitRequestsLocation *v102;
  uint64_t v103;
  void *v104;
  uint64_t v105;
  id v106;
  uint64_t v107;
  id v108;
  uint64_t v109;
  id v110;
  uint64_t v111;
  id v112;
  uint64_t v113;
  id v114;
  uint64_t v115;
  id v116;
  uint64_t v117;
  uint64_t v118;
  uint64_t v119;
  id *v120;
  uint64_t v121;
  void *v122;
  uint64_t v123;
  _QWORD v124[3];

  v124[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("latitude"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v8 = 0;
    goto LABEL_4;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v8 = v7;
LABEL_4:
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("longitude"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v100 = a4;
    v101 = v8;
    if (!v9 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      v10 = 0;
      goto LABEL_7;
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v10 = v9;
LABEL_7:
      objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("street"));
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v102 = self;
      v99 = v10;
      if (!v11 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
      {
        v12 = v7;
        v13 = v9;
        v14 = v11;
        v97 = 0;
        goto LABEL_10;
      }
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v12 = v7;
        v13 = v9;
        v14 = v11;
        v97 = v11;
LABEL_10:
        objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("city"));
        v15 = objc_claimAutoreleasedReturnValue();
        v98 = (void *)v15;
        if (!v15 || (v16 = (void *)v15, objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
        {
          v94 = 0;
          goto LABEL_13;
        }
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v94 = v16;
LABEL_13:
          objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("state"));
          v17 = objc_claimAutoreleasedReturnValue();
          v96 = (void *)v17;
          if (!v17 || (v18 = (void *)v17, objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
          {
            v93 = 0;
            v11 = v14;
            v9 = v13;
            goto LABEL_16;
          }
          objc_opt_class();
          v91 = v13;
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v93 = v18;
            v11 = v14;
            v9 = v13;
LABEL_16:
            objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("country"));
            v19 = objc_claimAutoreleasedReturnValue();
            v92 = (void *)v19;
            if (v19)
            {
              v20 = (void *)v19;
              objc_opt_class();
              v7 = v12;
              if ((objc_opt_isKindOfClass() & 1) == 0)
              {
                objc_opt_class();
                self = v102;
                if ((objc_opt_isKindOfClass() & 1) == 0)
                {
                  if (!a4)
                  {
                    v95 = 0;
                    v31 = 0;
                    v41 = v97;
                    v54 = v93;
                    a4 = v94;
                    goto LABEL_93;
                  }
                  v59 = objc_alloc(MEMORY[0x1E0CB35C8]);
                  v60 = *MEMORY[0x1E0D025B8];
                  v113 = *MEMORY[0x1E0CB2D50];
                  v90 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSString"), objc_opt_class(), CFSTR("country"));
                  v114 = v90;
                  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v114, &v113, 1);
                  v61 = objc_claimAutoreleasedReturnValue();
                  v62 = v59;
                  v10 = v99;
                  v63 = v60;
                  self = v102;
                  v89 = (void *)v61;
                  v31 = 0;
                  v95 = 0;
                  *a4 = (id)objc_msgSend(v62, "initWithDomain:code:userInfo:", v63, 2);
                  goto LABEL_101;
                }
                v95 = v20;
LABEL_29:
                objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("postalCode"));
                v21 = objc_claimAutoreleasedReturnValue();
                v89 = (void *)v21;
                if (!v21 || (v22 = (void *)v21, objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
                {
                  v90 = 0;
                  goto LABEL_32;
                }
                objc_opt_class();
                if ((objc_opt_isKindOfClass() & 1) != 0)
                {
                  v90 = v22;
LABEL_32:
                  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("countryCode"));
                  v23 = objc_claimAutoreleasedReturnValue();
                  v86 = (void *)v23;
                  if (!v23 || (v24 = (void *)v23, objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
                  {
                    v88 = 0;
                    goto LABEL_35;
                  }
                  objc_opt_class();
                  if ((objc_opt_isKindOfClass() & 1) != 0)
                  {
                    v88 = v24;
LABEL_35:
                    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("subAdministrativeArea"));
                    v25 = objc_claimAutoreleasedReturnValue();
                    v85 = (void *)v25;
                    if (!v25 || (v26 = (void *)v25, objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
                    {
                      v87 = 0;
                      goto LABEL_38;
                    }
                    objc_opt_class();
                    if ((objc_opt_isKindOfClass() & 1) != 0)
                    {
                      v87 = v26;
LABEL_38:
                      objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("subLocality"));
                      v27 = (void *)objc_claimAutoreleasedReturnValue();
                      if (!v27 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
                      {
                        v28 = 0;
                        goto LABEL_41;
                      }
                      objc_opt_class();
                      if ((objc_opt_isKindOfClass() & 1) != 0)
                      {
                        v28 = v27;
LABEL_41:
                        objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("postalAddress"));
                        v29 = (void *)objc_claimAutoreleasedReturnValue();
                        if (!v29 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
                        {
                          v30 = 0;
LABEL_44:
                          a4 = v94;
                          v31 = -[BMSiriExplicitRequestsLocation initWithLatitude:longitude:street:city:state:country:postalCode:countryCode:subAdministrativeArea:subLocality:postalAddress:](v102, "initWithLatitude:longitude:street:city:state:country:postalCode:countryCode:subAdministrativeArea:subLocality:postalAddress:", v101, v99, v97, v94, v93, v95, v90, v88, v87, v28, v30);
                          v102 = v31;
LABEL_88:

LABEL_89:
                          v41 = v97;
                          v54 = v93;
                          v26 = v85;
LABEL_90:

                          self = v102;
                          v10 = v99;
LABEL_91:

LABEL_92:
                          goto LABEL_93;
                        }
                        objc_opt_class();
                        if ((objc_opt_isKindOfClass() & 1) != 0)
                        {
                          v30 = v29;
                          goto LABEL_44;
                        }
                        if (v100)
                        {
                          v84 = objc_alloc(MEMORY[0x1E0CB35C8]);
                          v82 = *MEMORY[0x1E0D025B8];
                          v103 = *MEMORY[0x1E0CB2D50];
                          v79 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSString"), objc_opt_class(), CFSTR("postalAddress"));
                          v104 = v79;
                          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v104, &v103, 1);
                          v80 = (void *)objc_claimAutoreleasedReturnValue();
                          *v100 = (id)objc_msgSend(v84, "initWithDomain:code:userInfo:", v82, 2, v80);

                        }
                        v30 = 0;
                        v31 = 0;
LABEL_87:
                        a4 = v94;
                        goto LABEL_88;
                      }
                      if (v100)
                      {
                        v83 = objc_alloc(MEMORY[0x1E0CB35C8]);
                        v77 = *MEMORY[0x1E0D025B8];
                        v105 = *MEMORY[0x1E0CB2D50];
                        v30 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSString"), objc_opt_class(), CFSTR("subLocality"));
                        v106 = v30;
                        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v106, &v105, 1);
                        v29 = (void *)objc_claimAutoreleasedReturnValue();
                        v78 = (id)objc_msgSend(v83, "initWithDomain:code:userInfo:", v77, 2, v29);
                        v31 = 0;
                        v28 = 0;
                        *v100 = v78;
                        goto LABEL_87;
                      }
                      v28 = 0;
                      v31 = 0;
LABEL_107:
                      a4 = v94;
                      goto LABEL_89;
                    }
                    if (v100)
                    {
                      v74 = objc_alloc(MEMORY[0x1E0CB35C8]);
                      v75 = *MEMORY[0x1E0D025B8];
                      v107 = *MEMORY[0x1E0CB2D50];
                      v28 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSString"), objc_opt_class(), CFSTR("subAdministrativeArea"));
                      v108 = v28;
                      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v108, &v107, 1);
                      v27 = (void *)objc_claimAutoreleasedReturnValue();
                      v76 = (id)objc_msgSend(v74, "initWithDomain:code:userInfo:", v75, 2, v27);
                      v31 = 0;
                      v87 = 0;
                      *v100 = v76;
                      goto LABEL_107;
                    }
                    v87 = 0;
                    v31 = 0;
LABEL_105:
                    v41 = v97;
                    v54 = v93;
                    a4 = v94;
                    goto LABEL_90;
                  }
                  if (v100)
                  {
                    v70 = objc_alloc(MEMORY[0x1E0CB35C8]);
                    v71 = *MEMORY[0x1E0D025B8];
                    v109 = *MEMORY[0x1E0CB2D50];
                    v87 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSString"), objc_opt_class(), CFSTR("countryCode"));
                    v110 = v87;
                    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v110, &v109, 1);
                    v72 = objc_claimAutoreleasedReturnValue();
                    v73 = v71;
                    v26 = (void *)v72;
                    v31 = 0;
                    v88 = 0;
                    *v100 = (id)objc_msgSend(v70, "initWithDomain:code:userInfo:", v73, 2, v72);
                    goto LABEL_105;
                  }
                  v88 = 0;
                  v31 = 0;
LABEL_103:
                  v41 = v97;
                  v54 = v93;
                  a4 = v94;
                  goto LABEL_91;
                }
                if (v100)
                {
                  v64 = objc_alloc(MEMORY[0x1E0CB35C8]);
                  v65 = self;
                  v66 = *MEMORY[0x1E0D025B8];
                  v111 = *MEMORY[0x1E0CB2D50];
                  v88 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSString"), objc_opt_class(), CFSTR("postalCode"));
                  v112 = v88;
                  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v112, &v111, 1);
                  v67 = objc_claimAutoreleasedReturnValue();
                  v68 = v64;
                  v10 = v99;
                  v69 = v66;
                  self = v65;
                  v86 = (void *)v67;
                  v31 = 0;
                  v90 = 0;
                  *v100 = (id)objc_msgSend(v68, "initWithDomain:code:userInfo:", v69, 2);
                  goto LABEL_103;
                }
                v90 = 0;
                v31 = 0;
LABEL_101:
                v41 = v97;
                v54 = v93;
                a4 = v94;
                goto LABEL_92;
              }
              v95 = 0;
            }
            else
            {
              v95 = 0;
              v7 = v12;
            }
            self = v102;
            goto LABEL_29;
          }
          v7 = v12;
          if (a4)
          {
            v55 = objc_alloc(MEMORY[0x1E0CB35C8]);
            v56 = *MEMORY[0x1E0D025B8];
            v115 = *MEMORY[0x1E0CB2D50];
            v95 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSString"), objc_opt_class(), CFSTR("state"));
            v116 = v95;
            objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v116, &v115, 1);
            v57 = objc_claimAutoreleasedReturnValue();
            v58 = v55;
            v10 = v99;
            v92 = (void *)v57;
            v31 = 0;
            v54 = 0;
            *a4 = (id)objc_msgSend(v58, "initWithDomain:code:userInfo:", v56, 2);
            v41 = v97;
            a4 = v94;
            self = v102;
            v11 = v14;
            v9 = v91;
LABEL_93:

            goto LABEL_94;
          }
          v54 = 0;
          v31 = 0;
          v41 = v97;
          a4 = v94;
          self = v102;
          v11 = v14;
          v9 = v91;
LABEL_94:

          goto LABEL_95;
        }
        if (a4)
        {
          v49 = objc_alloc(MEMORY[0x1E0CB35C8]);
          v50 = *MEMORY[0x1E0D025B8];
          v117 = *MEMORY[0x1E0CB2D50];
          v51 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSString"), objc_opt_class(), CFSTR("city"));
          v118 = v51;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v118, &v117, 1);
          v52 = objc_claimAutoreleasedReturnValue();
          v53 = v49;
          v10 = v99;
          v54 = (void *)v51;
          v96 = (void *)v52;
          v31 = 0;
          *a4 = (id)objc_msgSend(v53, "initWithDomain:code:userInfo:", v50, 2);
          a4 = 0;
          v41 = v97;
          v11 = v14;
          v9 = v13;
          v7 = v12;
          self = v102;
          goto LABEL_94;
        }
        v31 = 0;
        v41 = v97;
        v11 = v14;
        v9 = v13;
        v7 = v12;
        self = v102;
LABEL_95:

        goto LABEL_96;
      }
      if (a4)
      {
        v44 = objc_alloc(MEMORY[0x1E0CB35C8]);
        v45 = *MEMORY[0x1E0D025B8];
        v119 = *MEMORY[0x1E0CB2D50];
        a4 = (id *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSString"), objc_opt_class(), CFSTR("street"));
        v120 = a4;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v120, &v119, 1);
        v46 = objc_claimAutoreleasedReturnValue();
        v47 = v44;
        v10 = v99;
        v48 = v45;
        self = v102;
        v98 = (void *)v46;
        v31 = 0;
        v41 = 0;
        *v100 = (id)objc_msgSend(v47, "initWithDomain:code:userInfo:", v48, 2);
        goto LABEL_95;
      }
      v41 = 0;
      v31 = 0;
LABEL_96:

      v8 = v101;
      goto LABEL_97;
    }
    if (a4)
    {
      v38 = objc_alloc(MEMORY[0x1E0CB35C8]);
      v39 = self;
      v40 = *MEMORY[0x1E0D025B8];
      v121 = *MEMORY[0x1E0CB2D50];
      v41 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), objc_opt_class(), CFSTR("longitude"));
      v122 = v41;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v122, &v121, 1);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v42 = v40;
      self = v39;
      v43 = (id)objc_msgSend(v38, "initWithDomain:code:userInfo:", v42, 2, v11);
      v31 = 0;
      v10 = 0;
      *a4 = v43;
      goto LABEL_96;
    }
    v10 = 0;
    v31 = 0;
LABEL_97:

    goto LABEL_98;
  }
  if (a4)
  {
    v32 = objc_alloc(MEMORY[0x1E0CB35C8]);
    v33 = self;
    v34 = *MEMORY[0x1E0D025B8];
    v123 = *MEMORY[0x1E0CB2D50];
    v35 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), objc_opt_class(), CFSTR("latitude"));
    v124[0] = v35;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v124, &v123, 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v36 = v32;
    v10 = (id)v35;
    v37 = v34;
    self = v33;
    v31 = 0;
    v8 = 0;
    *a4 = (id)objc_msgSend(v36, "initWithDomain:code:userInfo:", v37, 2, v9);
    goto LABEL_97;
  }
  v31 = 0;
  v8 = 0;
LABEL_98:

  return v31;
}

- (id)jsonDictionary
{
  double v3;
  void *v4;
  uint64_t v5;
  double v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  id v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  _QWORD v40[11];
  _QWORD v41[13];

  v41[11] = *MEMORY[0x1E0C80C00];
  if (!-[BMSiriExplicitRequestsLocation hasLatitude](self, "hasLatitude")
    || (-[BMSiriExplicitRequestsLocation latitude](self, "latitude"), fabs(v3) == INFINITY))
  {
    v5 = 0;
  }
  else
  {
    -[BMSiriExplicitRequestsLocation latitude](self, "latitude");
    v4 = (void *)MEMORY[0x1E0CB37E8];
    -[BMSiriExplicitRequestsLocation latitude](self, "latitude");
    objc_msgSend(v4, "numberWithDouble:");
    v5 = objc_claimAutoreleasedReturnValue();
  }
  if (!-[BMSiriExplicitRequestsLocation hasLongitude](self, "hasLongitude")
    || (-[BMSiriExplicitRequestsLocation longitude](self, "longitude"), fabs(v6) == INFINITY))
  {
    v8 = 0;
  }
  else
  {
    -[BMSiriExplicitRequestsLocation longitude](self, "longitude");
    v7 = (void *)MEMORY[0x1E0CB37E8];
    -[BMSiriExplicitRequestsLocation longitude](self, "longitude");
    objc_msgSend(v7, "numberWithDouble:");
    v8 = objc_claimAutoreleasedReturnValue();
  }
  -[BMSiriExplicitRequestsLocation street](self, "street");
  v9 = objc_claimAutoreleasedReturnValue();
  -[BMSiriExplicitRequestsLocation city](self, "city");
  v10 = objc_claimAutoreleasedReturnValue();
  -[BMSiriExplicitRequestsLocation state](self, "state");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMSiriExplicitRequestsLocation country](self, "country");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMSiriExplicitRequestsLocation postalCode](self, "postalCode");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMSiriExplicitRequestsLocation countryCode](self, "countryCode");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMSiriExplicitRequestsLocation subAdministrativeArea](self, "subAdministrativeArea");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMSiriExplicitRequestsLocation subLocality](self, "subLocality");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMSiriExplicitRequestsLocation postalAddress](self, "postalAddress");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v40[0] = CFSTR("latitude");
  v15 = v5;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v15 = objc_claimAutoreleasedReturnValue();
  }
  v31 = (void *)v15;
  v41[0] = v15;
  v40[1] = CFSTR("longitude");
  v16 = v8;
  if (!v8)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v16 = objc_claimAutoreleasedReturnValue();
  }
  v30 = (void *)v16;
  v41[1] = v16;
  v40[2] = CFSTR("street");
  v17 = v9;
  if (!v9)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v17 = objc_claimAutoreleasedReturnValue();
  }
  v29 = (void *)v17;
  v41[2] = v17;
  v40[3] = CFSTR("city");
  v18 = v10;
  if (!v10)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v18 = objc_claimAutoreleasedReturnValue();
  }
  v36 = (void *)v5;
  v28 = (void *)v18;
  v41[3] = v18;
  v40[4] = CFSTR("state");
  v19 = (uint64_t)v11;
  if (!v11)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v19 = objc_claimAutoreleasedReturnValue();
  }
  v35 = (void *)v8;
  v27 = (void *)v19;
  v41[4] = v19;
  v40[5] = CFSTR("country");
  v20 = v39;
  if (!v39)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v34 = (void *)v9;
  v41[5] = v20;
  v40[6] = CFSTR("postalCode");
  v21 = v38;
  if (!v38)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v33 = (void *)v10;
  v41[6] = v21;
  v40[7] = CFSTR("countryCode");
  v22 = v37;
  if (!v37)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v41[7] = v22;
  v40[8] = CFSTR("subAdministrativeArea");
  v23 = v12;
  if (!v12)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v41[8] = v23;
  v40[9] = CFSTR("subLocality");
  v24 = v13;
  if (!v13)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v41[9] = v24;
  v40[10] = CFSTR("postalAddress");
  v25 = v14;
  if (!v14)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v41[10] = v25;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v41, v40, 11);
  v32 = (id)objc_claimAutoreleasedReturnValue();
  if (v14)
  {
    if (v13)
      goto LABEL_33;
LABEL_48:

    if (v12)
      goto LABEL_34;
    goto LABEL_49;
  }

  if (!v13)
    goto LABEL_48;
LABEL_33:
  if (v12)
    goto LABEL_34;
LABEL_49:

LABEL_34:
  if (!v37)

  if (!v38)
  if (!v39)

  if (!v11)
  if (v33)
  {
    if (v34)
      goto LABEL_44;
  }
  else
  {

    if (v34)
    {
LABEL_44:
      if (v35)
        goto LABEL_45;
LABEL_52:

      if (v36)
        goto LABEL_46;
LABEL_53:

      goto LABEL_46;
    }
  }

  if (!v35)
    goto LABEL_52;
LABEL_45:
  if (!v36)
    goto LABEL_53;
LABEL_46:

  return v32;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  id v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  int v17;
  char v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  int v24;
  void *v25;
  uint64_t v26;
  void *v27;
  void *v28;
  void *v29;
  int v30;
  void *v31;
  uint64_t v32;
  void *v33;
  void *v34;
  void *v35;
  int v36;
  void *v37;
  uint64_t v38;
  void *v39;
  void *v40;
  void *v41;
  int v42;
  void *v43;
  uint64_t v44;
  void *v45;
  void *v46;
  void *v47;
  int v48;
  void *v49;
  uint64_t v50;
  void *v51;
  void *v52;
  void *v53;
  int v54;
  void *v55;
  uint64_t v56;
  void *v57;
  void *v58;
  void *v59;
  int v60;
  void *v62;
  void *v63;
  void *v64;
  void *v65;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    if (-[BMSiriExplicitRequestsLocation hasLatitude](self, "hasLatitude")
      || objc_msgSend(v5, "hasLatitude"))
    {
      if (!-[BMSiriExplicitRequestsLocation hasLatitude](self, "hasLatitude"))
        goto LABEL_43;
      if (!objc_msgSend(v5, "hasLatitude"))
        goto LABEL_43;
      -[BMSiriExplicitRequestsLocation latitude](self, "latitude");
      v7 = v6;
      objc_msgSend(v5, "latitude");
      if (v7 != v8)
        goto LABEL_43;
    }
    if (-[BMSiriExplicitRequestsLocation hasLongitude](self, "hasLongitude")
      || objc_msgSend(v5, "hasLongitude"))
    {
      if (!-[BMSiriExplicitRequestsLocation hasLongitude](self, "hasLongitude"))
        goto LABEL_43;
      if (!objc_msgSend(v5, "hasLongitude"))
        goto LABEL_43;
      -[BMSiriExplicitRequestsLocation longitude](self, "longitude");
      v10 = v9;
      objc_msgSend(v5, "longitude");
      if (v10 != v11)
        goto LABEL_43;
    }
    -[BMSiriExplicitRequestsLocation street](self, "street");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "street");
    v13 = objc_claimAutoreleasedReturnValue();
    if (v12 == (void *)v13)
    {

    }
    else
    {
      v14 = (void *)v13;
      -[BMSiriExplicitRequestsLocation street](self, "street");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "street");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = objc_msgSend(v15, "isEqual:", v16);

      if (!v17)
        goto LABEL_43;
    }
    -[BMSiriExplicitRequestsLocation city](self, "city");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "city");
    v20 = objc_claimAutoreleasedReturnValue();
    if (v19 == (void *)v20)
    {

    }
    else
    {
      v21 = (void *)v20;
      -[BMSiriExplicitRequestsLocation city](self, "city");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "city");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = objc_msgSend(v22, "isEqual:", v23);

      if (!v24)
        goto LABEL_43;
    }
    -[BMSiriExplicitRequestsLocation state](self, "state");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "state");
    v26 = objc_claimAutoreleasedReturnValue();
    if (v25 == (void *)v26)
    {

    }
    else
    {
      v27 = (void *)v26;
      -[BMSiriExplicitRequestsLocation state](self, "state");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "state");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      v30 = objc_msgSend(v28, "isEqual:", v29);

      if (!v30)
        goto LABEL_43;
    }
    -[BMSiriExplicitRequestsLocation country](self, "country");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "country");
    v32 = objc_claimAutoreleasedReturnValue();
    if (v31 == (void *)v32)
    {

    }
    else
    {
      v33 = (void *)v32;
      -[BMSiriExplicitRequestsLocation country](self, "country");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "country");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      v36 = objc_msgSend(v34, "isEqual:", v35);

      if (!v36)
        goto LABEL_43;
    }
    -[BMSiriExplicitRequestsLocation postalCode](self, "postalCode");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "postalCode");
    v38 = objc_claimAutoreleasedReturnValue();
    if (v37 == (void *)v38)
    {

    }
    else
    {
      v39 = (void *)v38;
      -[BMSiriExplicitRequestsLocation postalCode](self, "postalCode");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "postalCode");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      v42 = objc_msgSend(v40, "isEqual:", v41);

      if (!v42)
        goto LABEL_43;
    }
    -[BMSiriExplicitRequestsLocation countryCode](self, "countryCode");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "countryCode");
    v44 = objc_claimAutoreleasedReturnValue();
    if (v43 == (void *)v44)
    {

    }
    else
    {
      v45 = (void *)v44;
      -[BMSiriExplicitRequestsLocation countryCode](self, "countryCode");
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "countryCode");
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      v48 = objc_msgSend(v46, "isEqual:", v47);

      if (!v48)
        goto LABEL_43;
    }
    -[BMSiriExplicitRequestsLocation subAdministrativeArea](self, "subAdministrativeArea");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "subAdministrativeArea");
    v50 = objc_claimAutoreleasedReturnValue();
    if (v49 == (void *)v50)
    {

    }
    else
    {
      v51 = (void *)v50;
      -[BMSiriExplicitRequestsLocation subAdministrativeArea](self, "subAdministrativeArea");
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "subAdministrativeArea");
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      v54 = objc_msgSend(v52, "isEqual:", v53);

      if (!v54)
        goto LABEL_43;
    }
    -[BMSiriExplicitRequestsLocation subLocality](self, "subLocality");
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "subLocality");
    v56 = objc_claimAutoreleasedReturnValue();
    if (v55 == (void *)v56)
    {

    }
    else
    {
      v57 = (void *)v56;
      -[BMSiriExplicitRequestsLocation subLocality](self, "subLocality");
      v58 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "subLocality");
      v59 = (void *)objc_claimAutoreleasedReturnValue();
      v60 = objc_msgSend(v58, "isEqual:", v59);

      if (!v60)
      {
LABEL_43:
        v18 = 0;
LABEL_44:

        goto LABEL_45;
      }
    }
    -[BMSiriExplicitRequestsLocation postalAddress](self, "postalAddress");
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "postalAddress");
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    if (v62 == v63)
    {
      v18 = 1;
    }
    else
    {
      -[BMSiriExplicitRequestsLocation postalAddress](self, "postalAddress");
      v64 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "postalAddress");
      v65 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = objc_msgSend(v64, "isEqual:", v65);

    }
    goto LABEL_44;
  }
  v18 = 0;
LABEL_45:

  return v18;
}

- (unsigned)dataVersion
{
  return self->_dataVersion;
}

- (double)latitude
{
  return self->_latitude;
}

- (BOOL)hasLatitude
{
  return self->_hasLatitude;
}

- (void)setHasLatitude:(BOOL)a3
{
  self->_hasLatitude = a3;
}

- (double)longitude
{
  return self->_longitude;
}

- (BOOL)hasLongitude
{
  return self->_hasLongitude;
}

- (void)setHasLongitude:(BOOL)a3
{
  self->_hasLongitude = a3;
}

- (NSString)street
{
  return self->_street;
}

- (NSString)city
{
  return self->_city;
}

- (NSString)state
{
  return self->_state;
}

- (NSString)country
{
  return self->_country;
}

- (NSString)postalCode
{
  return self->_postalCode;
}

- (NSString)countryCode
{
  return self->_countryCode;
}

- (NSString)subAdministrativeArea
{
  return self->_subAdministrativeArea;
}

- (NSString)subLocality
{
  return self->_subLocality;
}

- (NSString)postalAddress
{
  return self->_postalAddress;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_postalAddress, 0);
  objc_storeStrong((id *)&self->_subLocality, 0);
  objc_storeStrong((id *)&self->_subAdministrativeArea, 0);
  objc_storeStrong((id *)&self->_countryCode, 0);
  objc_storeStrong((id *)&self->_postalCode, 0);
  objc_storeStrong((id *)&self->_country, 0);
  objc_storeStrong((id *)&self->_state, 0);
  objc_storeStrong((id *)&self->_city, 0);
  objc_storeStrong((id *)&self->_street, 0);
}

+ (unsigned)latestDataVersion
{
  return 0;
}

+ (id)eventWithData:(id)a3 dataVersion:(unsigned int)a4
{
  _DWORD *v4;
  objc_class *v5;
  id v6;
  void *v7;

  if (a4)
  {
    v4 = 0;
  }
  else
  {
    v5 = (objc_class *)MEMORY[0x1E0D82B90];
    v6 = a3;
    v7 = (void *)objc_msgSend([v5 alloc], "initWithData:", v6);

    v4 = -[BMSiriExplicitRequestsLocation initByReadFrom:]([BMSiriExplicitRequestsLocation alloc], "initByReadFrom:", v7);
    v4[5] = 0;

  }
  return v4;
}

+ (id)columns
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v12;
  void *v13;
  void *v14;
  _QWORD v15[12];

  v15[11] = *MEMORY[0x1E0C80C00];
  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("latitude"), 1, 0, 1, 0, 0);
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("longitude"), 1, 0, 2, 0, 0);
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("street"), 2, 0, 3, 13, 0);
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("city"), 2, 0, 4, 13, 0);
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("state"), 2, 0, 5, 13, 0);
  v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("country"), 2, 0, 6, 13, 0);
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("postalCode"), 2, 0, 7, 13, 0);
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("countryCode"), 2, 0, 8, 13, 0);
  v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("subAdministrativeArea"), 2, 0, 9, 13, 0);
  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("subLocality"), 2, 0, 10, 13, 0);
  v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("postalAddress"), 2, 0, 11, 13, 0);
  v15[0] = v2;
  v15[1] = v3;
  v15[2] = v4;
  v15[3] = v5;
  v15[4] = v6;
  v15[5] = v13;
  v15[6] = v7;
  v15[7] = v8;
  v15[8] = v14;
  v15[9] = v9;
  v15[10] = v10;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v15, 11);
  v12 = (id)objc_claimAutoreleasedReturnValue();

  return v12;
}

+ (id)validKeyPaths
{
  return &unk_1E5F1D4A0;
}

+ (id)protoFields
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v13;
  void *v14;
  _QWORD v15[12];

  v15[11] = *MEMORY[0x1E0C80C00];
  v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("latitude"), 1, 0, 0);
  v15[0] = v14;
  v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("longitude"), 2, 0, 0);
  v15[1] = v13;
  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("street"), 3, 13, 0);
  v15[2] = v2;
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("city"), 4, 13, 0);
  v15[3] = v3;
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("state"), 5, 13, 0);
  v15[4] = v4;
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("country"), 6, 13, 0);
  v15[5] = v5;
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("postalCode"), 7, 13, 0);
  v15[6] = v6;
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("countryCode"), 8, 13, 0);
  v15[7] = v7;
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("subAdministrativeArea"), 9, 13, 0);
  v15[8] = v8;
  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("subLocality"), 10, 13, 0);
  v15[9] = v9;
  v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("postalAddress"), 11, 13, 0);
  v15[10] = v10;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v15, 11);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

@end
