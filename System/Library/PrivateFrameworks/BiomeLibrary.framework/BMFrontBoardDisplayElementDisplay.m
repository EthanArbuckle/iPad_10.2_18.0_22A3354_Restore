@implementation BMFrontBoardDisplayElementDisplay

- (BOOL)isEqual:(id)a3
{
  id v4;
  id v5;
  int v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  char v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  int v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  int v25;
  int v26;
  int v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    v6 = -[BMFrontBoardDisplayElementDisplay type](self, "type");
    if (v6 == objc_msgSend(v5, "type"))
    {
      -[BMFrontBoardDisplayElementDisplay name](self, "name");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "name");
      v8 = objc_claimAutoreleasedReturnValue();
      if (v7 == (void *)v8)
      {

      }
      else
      {
        v9 = (void *)v8;
        -[BMFrontBoardDisplayElementDisplay name](self, "name");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "name");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = objc_msgSend(v10, "isEqual:", v11);

        if (!v12)
          goto LABEL_20;
      }
      -[BMFrontBoardDisplayElementDisplay deviceName](self, "deviceName");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "deviceName");
      v15 = objc_claimAutoreleasedReturnValue();
      if (v14 == (void *)v15)
      {

      }
      else
      {
        v16 = (void *)v15;
        -[BMFrontBoardDisplayElementDisplay deviceName](self, "deviceName");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "deviceName");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = objc_msgSend(v17, "isEqual:", v18);

        if (!v19)
          goto LABEL_20;
      }
      -[BMFrontBoardDisplayElementDisplay hardwareIdentifier](self, "hardwareIdentifier");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "hardwareIdentifier");
      v21 = objc_claimAutoreleasedReturnValue();
      if (v20 == (void *)v21)
      {

      }
      else
      {
        v22 = (void *)v21;
        -[BMFrontBoardDisplayElementDisplay hardwareIdentifier](self, "hardwareIdentifier");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "hardwareIdentifier");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        v25 = objc_msgSend(v23, "isEqual:", v24);

        if (!v25)
          goto LABEL_20;
      }
      v26 = -[BMFrontBoardDisplayElementDisplay interfaceOrientation](self, "interfaceOrientation");
      if (v26 == objc_msgSend(v5, "interfaceOrientation"))
      {
        v27 = -[BMFrontBoardDisplayElementDisplay backlightStatus](self, "backlightStatus");
        if (v27 == objc_msgSend(v5, "backlightStatus"))
        {
          -[BMFrontBoardDisplayElementDisplay transitionReasons](self, "transitionReasons");
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "transitionReasons");
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          if (v28 == v29)
          {
            v13 = 1;
          }
          else
          {
            -[BMFrontBoardDisplayElementDisplay transitionReasons](self, "transitionReasons");
            v30 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v5, "transitionReasons");
            v31 = (void *)objc_claimAutoreleasedReturnValue();
            v13 = objc_msgSend(v30, "isEqual:", v31);

          }
          goto LABEL_21;
        }
      }
    }
LABEL_20:
    v13 = 0;
LABEL_21:

    goto LABEL_22;
  }
  v13 = 0;
LABEL_22:

  return v13;
}

- (int)type
{
  return self->_type;
}

- (NSArray)transitionReasons
{
  return self->_transitionReasons;
}

- (NSString)name
{
  return self->_name;
}

- (int)interfaceOrientation
{
  return self->_interfaceOrientation;
}

- (NSString)hardwareIdentifier
{
  return self->_hardwareIdentifier;
}

- (NSString)deviceName
{
  return self->_deviceName;
}

- (int)backlightStatus
{
  return self->_backlightStatus;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_transitionReasons, 0);
  objc_storeStrong((id *)&self->_hardwareIdentifier, 0);
  objc_storeStrong((id *)&self->_deviceName, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

- (BMFrontBoardDisplayElementDisplay)initWithType:(int)a3 name:(id)a4 deviceName:(id)a5 hardwareIdentifier:(id)a6 interfaceOrientation:(int)a7 backlightStatus:(int)a8 transitionReasons:(id)a9
{
  id v14;
  id v15;
  id v16;
  id v17;
  BMFrontBoardDisplayElementDisplay *v18;
  objc_super v22;

  v14 = a4;
  v15 = a5;
  v16 = a6;
  v17 = a9;
  v22.receiver = self;
  v22.super_class = (Class)BMFrontBoardDisplayElementDisplay;
  v18 = -[BMEventBase init](&v22, sel_init);
  if (v18)
  {
    v18->_dataVersion = objc_msgSend((id)objc_opt_class(), "latestDataVersion");
    v18->_type = a3;
    objc_storeStrong((id *)&v18->_name, a4);
    objc_storeStrong((id *)&v18->_deviceName, a5);
    objc_storeStrong((id *)&v18->_hardwareIdentifier, a6);
    v18->_interfaceOrientation = a7;
    v18->_backlightStatus = a8;
    objc_storeStrong((id *)&v18->_transitionReasons, a9);
  }

  return v18;
}

+ (unsigned)latestDataVersion
{
  return 0;
}

- (void)writeTo:(id)a3
{
  id v4;
  NSArray *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  PBDataWriterWriteUint32Field();
  if (self->_name)
    PBDataWriterWriteStringField();
  if (self->_deviceName)
    PBDataWriterWriteStringField();
  if (self->_hardwareIdentifier)
    PBDataWriterWriteStringField();
  PBDataWriterWriteUint32Field();
  PBDataWriterWriteUint32Field();
  v12 = 0u;
  v13 = 0u;
  v10 = 0u;
  v11 = 0u;
  v5 = self->_transitionReasons;
  v6 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v11;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v11 != v8)
          objc_enumerationMutation(v5);
        PBDataWriterWriteStringField();
        ++v9;
      }
      while (v7 != v9);
      v7 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v7);
  }

}

- (NSString)description
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v3 = objc_alloc(MEMORY[0x1E0CB3940]);
  BMFrontBoardDisplayElementDisplayTypeAsString(-[BMFrontBoardDisplayElementDisplay type](self, "type"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMFrontBoardDisplayElementDisplay name](self, "name");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMFrontBoardDisplayElementDisplay deviceName](self, "deviceName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMFrontBoardDisplayElementDisplay hardwareIdentifier](self, "hardwareIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  BMFrontBoardDisplayElementDisplayInterfaceOrientationAsString(-[BMFrontBoardDisplayElementDisplay interfaceOrientation](self, "interfaceOrientation"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  BMFrontBoardDisplayElementDisplayBacklightStatusAsString(-[BMFrontBoardDisplayElementDisplay backlightStatus](self, "backlightStatus"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMFrontBoardDisplayElementDisplay transitionReasons](self, "transitionReasons");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("BMFrontBoardDisplayElementDisplay with type: %@, name: %@, deviceName: %@, hardwareIdentifier: %@, interfaceOrientation: %@, backlightStatus: %@, transitionReasons: %@"), v4, v5, v6, v7, v8, v9, v10);

  return (NSString *)v11;
}

- (id)initByReadFrom:(id)a3
{
  _BYTE *v4;
  BMFrontBoardDisplayElementDisplay *v5;
  void *v6;
  int *v7;
  int *v8;
  int *v9;
  int *v10;
  char v11;
  unsigned int v12;
  unint64_t v13;
  uint64_t v14;
  uint64_t v15;
  unint64_t v16;
  char v17;
  BOOL v18;
  int v19;
  char v21;
  unsigned int v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  unint64_t v26;
  char v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  char v31;
  unsigned int v32;
  uint64_t v33;
  uint64_t v34;
  unint64_t v35;
  char v36;
  char v37;
  unsigned int v38;
  uint64_t v39;
  uint64_t v40;
  unint64_t v41;
  char v42;
  uint64_t v43;
  void *v44;
  uint64_t v45;
  uint64_t v46;
  NSArray *transitionReasons;
  int v48;
  BMFrontBoardDisplayElementDisplay *v49;
  objc_super v51;

  v4 = a3;
  v51.receiver = self;
  v51.super_class = (Class)BMFrontBoardDisplayElementDisplay;
  v5 = -[BMEventBase init](&v51, sel_init);
  if (!v5)
    goto LABEL_71;
  v6 = (void *)objc_opt_new();
  v7 = (int *)MEMORY[0x1E0D82BF0];
  v8 = (int *)MEMORY[0x1E0D82BD8];
  v9 = (int *)MEMORY[0x1E0D82BC8];
  if (*(_QWORD *)&v4[*MEMORY[0x1E0D82BF0]] < *(_QWORD *)&v4[*MEMORY[0x1E0D82BD8]])
  {
    v10 = (int *)MEMORY[0x1E0D82BB8];
    do
    {
      if (v4[*v9])
        break;
      v11 = 0;
      v12 = 0;
      v13 = 0;
      while (1)
      {
        v14 = *v7;
        v15 = *(_QWORD *)&v4[v14];
        v16 = v15 + 1;
        if (v15 == -1 || v16 > *(_QWORD *)&v4[*v8])
          break;
        v17 = *(_BYTE *)(*(_QWORD *)&v4[*v10] + v15);
        *(_QWORD *)&v4[v14] = v16;
        v13 |= (unint64_t)(v17 & 0x7F) << v11;
        if ((v17 & 0x80) == 0)
          goto LABEL_13;
        v11 += 7;
        v18 = v12++ >= 9;
        if (v18)
        {
          v13 = 0;
          v19 = v4[*v9];
          goto LABEL_15;
        }
      }
      v4[*v9] = 1;
LABEL_13:
      v19 = v4[*v9];
      if (v4[*v9])
        v13 = 0;
LABEL_15:
      if (v19 || (v13 & 7) == 4)
        break;
      switch((v13 >> 3))
      {
        case 1u:
          v21 = 0;
          v22 = 0;
          v23 = 0;
          while (1)
          {
            v24 = *v7;
            v25 = *(_QWORD *)&v4[v24];
            v26 = v25 + 1;
            if (v25 == -1 || v26 > *(_QWORD *)&v4[*v8])
              break;
            v27 = *(_BYTE *)(*(_QWORD *)&v4[*v10] + v25);
            *(_QWORD *)&v4[v24] = v26;
            v23 |= (unint64_t)(v27 & 0x7F) << v21;
            if ((v27 & 0x80) == 0)
              goto LABEL_50;
            v21 += 7;
            v18 = v22++ >= 9;
            if (v18)
            {
              LODWORD(v23) = 0;
              goto LABEL_52;
            }
          }
          v4[*v9] = 1;
LABEL_50:
          if (v4[*v9])
            LODWORD(v23) = 0;
LABEL_52:
          if (v23 >= 2)
            LODWORD(v23) = 0;
          v45 = 20;
          goto LABEL_67;
        case 2u:
          PBReaderReadString();
          v28 = objc_claimAutoreleasedReturnValue();
          v29 = 32;
          goto LABEL_32;
        case 3u:
          PBReaderReadString();
          v28 = objc_claimAutoreleasedReturnValue();
          v29 = 40;
          goto LABEL_32;
        case 4u:
          PBReaderReadString();
          v28 = objc_claimAutoreleasedReturnValue();
          v29 = 48;
LABEL_32:
          v30 = *(Class *)((char *)&v5->super.super.isa + v29);
          *(Class *)((char *)&v5->super.super.isa + v29) = (Class)v28;

          continue;
        case 5u:
          v31 = 0;
          v32 = 0;
          v23 = 0;
          while (2)
          {
            v33 = *v7;
            v34 = *(_QWORD *)&v4[v33];
            v35 = v34 + 1;
            if (v34 == -1 || v35 > *(_QWORD *)&v4[*v8])
            {
              v4[*v9] = 1;
            }
            else
            {
              v36 = *(_BYTE *)(*(_QWORD *)&v4[*v10] + v34);
              *(_QWORD *)&v4[v33] = v35;
              v23 |= (unint64_t)(v36 & 0x7F) << v31;
              if (v36 < 0)
              {
                v31 += 7;
                v18 = v32++ >= 9;
                if (v18)
                {
                  LODWORD(v23) = 0;
                  goto LABEL_58;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v9])
            LODWORD(v23) = 0;
LABEL_58:
          if (v23 >= 5)
            LODWORD(v23) = 0;
          v45 = 24;
          goto LABEL_67;
        case 6u:
          v37 = 0;
          v38 = 0;
          v23 = 0;
          break;
        case 7u:
          PBReaderReadString();
          v43 = objc_claimAutoreleasedReturnValue();
          if (!v43)
            goto LABEL_73;
          v44 = (void *)v43;
          objc_msgSend(v6, "addObject:", v43);

          continue;
        default:
          if (PBReaderSkipValueWithTag())
            continue;
LABEL_73:

          goto LABEL_70;
      }
      while (1)
      {
        v39 = *v7;
        v40 = *(_QWORD *)&v4[v39];
        v41 = v40 + 1;
        if (v40 == -1 || v41 > *(_QWORD *)&v4[*v8])
          break;
        v42 = *(_BYTE *)(*(_QWORD *)&v4[*v10] + v40);
        *(_QWORD *)&v4[v39] = v41;
        v23 |= (unint64_t)(v42 & 0x7F) << v37;
        if ((v42 & 0x80) == 0)
          goto LABEL_62;
        v37 += 7;
        v18 = v38++ >= 9;
        if (v18)
        {
          LODWORD(v23) = 0;
          goto LABEL_64;
        }
      }
      v4[*v9] = 1;
LABEL_62:
      if (v4[*v9])
        LODWORD(v23) = 0;
LABEL_64:
      if (v23 >= 3)
        LODWORD(v23) = 0;
      v45 = 28;
LABEL_67:
      *(_DWORD *)((char *)&v5->super.super.isa + v45) = v23;
    }
    while (*(_QWORD *)&v4[*v7] < *(_QWORD *)&v4[*v8]);
  }
  v46 = objc_msgSend(v6, "copy");
  transitionReasons = v5->_transitionReasons;
  v5->_transitionReasons = (NSArray *)v46;

  v48 = v4[*v9];
  if (v48)
LABEL_70:
    v49 = 0;
  else
LABEL_71:
    v49 = v5;

  return v49;
}

- (id)serialize
{
  void *v3;
  void *v4;

  v3 = (void *)objc_opt_new();
  -[BMFrontBoardDisplayElementDisplay writeTo:](self, "writeTo:", v3);
  objc_msgSend(v3, "immutableData");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (BMFrontBoardDisplayElementDisplay)initWithJSONDictionary:(id)a3 error:(id *)p_isa
{
  id v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  id v15;
  id v16;
  void *v17;
  uint64_t v18;
  void *v19;
  id v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  uint64_t v25;
  void *v26;
  id v27;
  void *v28;
  id *v29;
  void *v30;
  uint64_t v31;
  void *v32;
  id v33;
  void *v34;
  uint64_t v35;
  id v36;
  id *v37;
  id v38;
  uint64_t v39;
  void *v40;
  id v41;
  void *v42;
  uint64_t v43;
  uint64_t v44;
  id v45;
  id *v46;
  void *v47;
  id v48;
  id v49;
  void *v50;
  int v51;
  void *v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t i;
  uint64_t v57;
  void *v58;
  void *v59;
  void **v60;
  uint64_t *v61;
  void *v62;
  id v63;
  uint64_t v64;
  id v65;
  id *v66;
  id v67;
  uint64_t v68;
  void *v69;
  id v70;
  void *v71;
  uint64_t v72;
  id *v73;
  uint64_t v74;
  id *v75;
  id v76;
  uint64_t v77;
  id v78;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  id v84;
  void *v85;
  void *v86;
  void *v87;
  id *v88;
  void *v89;
  void *v90;
  void *v91;
  id v92;
  void *v93;
  id v94;
  void *v95;
  id v96;
  id v97;
  __int128 v98;
  __int128 v99;
  __int128 v100;
  __int128 v101;
  uint64_t v102;
  void *v103;
  uint64_t v104;
  void *v105;
  _BYTE v106[128];
  uint64_t v107;
  void *v108;
  uint64_t v109;
  id v110;
  uint64_t v111;
  void *v112;
  uint64_t v113;
  void *v114;
  uint64_t v115;
  id v116;
  uint64_t v117;
  uint64_t v118;
  uint64_t v119;
  _QWORD v120[3];

  v120[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("type"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v9 = v7;
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if (p_isa)
        {
          v63 = objc_alloc(MEMORY[0x1E0CB35C8]);
          v64 = *MEMORY[0x1E0D025B8];
          v119 = *MEMORY[0x1E0CB2D50];
          v28 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber (corresponding to enum value), or NSString (string version of enum)"), objc_opt_class(), CFSTR("type"));
          v120[0] = v28;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v120, &v119, 1);
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          v65 = (id)objc_msgSend(v63, "initWithDomain:code:userInfo:", v64, 2, v10);
          v8 = 0;
          v66 = p_isa;
          p_isa = 0;
          *v66 = v65;
          goto LABEL_84;
        }
        v8 = 0;
        goto LABEL_85;
      }
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", bsearch_b(v7, &BMFrontBoardDisplayElementDisplayTypeFromString_sortedStrings, 1uLL, 8uLL, &__block_literal_global_52309) != 0);
      v9 = (id)objc_claimAutoreleasedReturnValue();
    }
    v8 = v9;
  }
  else
  {
    v8 = 0;
  }
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("name"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      if (p_isa)
      {
        v16 = objc_alloc(MEMORY[0x1E0CB35C8]);
        v17 = v8;
        v18 = *MEMORY[0x1E0D025B8];
        v117 = *MEMORY[0x1E0CB2D50];
        v19 = v10;
        v20 = objc_alloc(MEMORY[0x1E0CB3940]);
        v80 = objc_opt_class();
        v21 = v20;
        v10 = v19;
        v22 = objc_msgSend(v21, "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSString"), v80, CFSTR("name"));
        v118 = v22;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v118, &v117, 1);
        v23 = objc_claimAutoreleasedReturnValue();
        v24 = v16;
        v11 = (void *)v23;
        v25 = v18;
        v8 = v17;
        v26 = (void *)v22;
        v27 = (id)objc_msgSend(v24, "initWithDomain:code:userInfo:", v25, 2, v23);
        v28 = 0;
        v29 = p_isa;
        p_isa = 0;
        *v29 = v27;
        goto LABEL_83;
      }
      v28 = 0;
      goto LABEL_84;
    }
    v96 = v10;
  }
  else
  {
    v96 = 0;
  }
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("deviceName"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      if (p_isa)
      {
        v94 = objc_alloc(MEMORY[0x1E0CB35C8]);
        v30 = v8;
        v31 = *MEMORY[0x1E0D025B8];
        v115 = *MEMORY[0x1E0CB2D50];
        v32 = v10;
        v33 = objc_alloc(MEMORY[0x1E0CB3940]);
        v81 = objc_opt_class();
        v34 = v33;
        v10 = v32;
        v97 = (id)objc_msgSend(v34, "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSString"), v81, CFSTR("deviceName"));
        v116 = v97;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v116, &v115, 1);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v35 = v31;
        v8 = v30;
        v36 = (id)objc_msgSend(v94, "initWithDomain:code:userInfo:", v35, 2, v12);
        v26 = 0;
        v37 = p_isa;
        p_isa = 0;
        *v37 = v36;
        v28 = v96;
        goto LABEL_82;
      }
      v26 = 0;
      v28 = v96;
      goto LABEL_83;
    }
    v92 = v11;
  }
  else
  {
    v92 = 0;
  }
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("hardwareIdentifier"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v95 = v8;
  v91 = v11;
  if (v12 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      if (p_isa)
      {
        v38 = objc_alloc(MEMORY[0x1E0CB35C8]);
        v39 = *MEMORY[0x1E0D025B8];
        v113 = *MEMORY[0x1E0CB2D50];
        v40 = v10;
        v41 = objc_alloc(MEMORY[0x1E0CB3940]);
        v82 = objc_opt_class();
        v42 = v41;
        v10 = v40;
        v93 = (void *)objc_msgSend(v42, "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSString"), v82, CFSTR("hardwareIdentifier"));
        v114 = v93;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v114, &v113, 1);
        v43 = objc_claimAutoreleasedReturnValue();
        v44 = v39;
        v8 = v95;
        v90 = (void *)v43;
        v45 = (id)objc_msgSend(v38, "initWithDomain:code:userInfo:", v44, 2);
        v97 = 0;
        v46 = p_isa;
        p_isa = 0;
        *v46 = v45;
        v28 = v96;
        v26 = v92;
        goto LABEL_81;
      }
      v97 = 0;
      v28 = v96;
      v26 = v92;
      goto LABEL_82;
    }
    v97 = v12;
  }
  else
  {
    v97 = 0;
  }
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("interfaceOrientation"));
  v13 = objc_claimAutoreleasedReturnValue();
  v87 = v12;
  v90 = (void *)v13;
  if (v13 && (v14 = (void *)v13, objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v15 = v14;
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if (!p_isa)
        {
          v93 = 0;
          v28 = v96;
          v26 = v92;
          goto LABEL_81;
        }
        v70 = objc_alloc(MEMORY[0x1E0CB35C8]);
        v71 = v10;
        v72 = *MEMORY[0x1E0D025B8];
        v111 = *MEMORY[0x1E0CB2D50];
        v73 = p_isa;
        v89 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber (corresponding to enum value), or NSString (string version of enum)"), objc_opt_class(), CFSTR("interfaceOrientation"));
        v112 = v89;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v112, &v111, 1);
        v47 = (void *)objc_claimAutoreleasedReturnValue();
        v74 = v72;
        v10 = v71;
        v93 = 0;
        p_isa = 0;
        *v73 = (id)objc_msgSend(v70, "initWithDomain:code:userInfo:", v74, 2, v47);
        v28 = v96;
        goto LABEL_91;
      }
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", BMFrontBoardDisplayElementDisplayInterfaceOrientationFromString(v14));
      v15 = (id)objc_claimAutoreleasedReturnValue();
    }
    v93 = v15;
  }
  else
  {
    v93 = 0;
  }
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("backlightStatus"));
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  v88 = p_isa;
  v85 = v7;
  v86 = v10;
  if (!v47 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v89 = 0;
    goto LABEL_46;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", BMFrontBoardDisplayElementDisplayBacklightStatusFromString(v47));
      v48 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_45;
    }
    if (p_isa)
    {
      v75 = p_isa;
      v76 = objc_alloc(MEMORY[0x1E0CB35C8]);
      v77 = *MEMORY[0x1E0D025B8];
      v109 = *MEMORY[0x1E0CB2D50];
      v49 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber (corresponding to enum value), or NSString (string version of enum)"), objc_opt_class(), CFSTR("backlightStatus"));
      v110 = v49;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v110, &v109, 1);
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      v78 = (id)objc_msgSend(v76, "initWithDomain:code:userInfo:", v77, 2, v52);
      v89 = 0;
      p_isa = 0;
      *v75 = v78;
      v28 = v96;
      goto LABEL_76;
    }
    v89 = 0;
    v28 = v96;
LABEL_91:
    v26 = v92;
    goto LABEL_80;
  }
  v48 = v47;
LABEL_45:
  v89 = v48;
LABEL_46:
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("transitionReasons"));
  v49 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E38], "null");
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  v51 = objc_msgSend(v49, "isEqual:", v50);

  if (!v51)
  {
    if (!v49)
      goto LABEL_50;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      goto LABEL_50;
    v28 = v96;
    if (!v88)
    {
      p_isa = 0;
      v26 = v92;
      goto LABEL_79;
    }
    v67 = objc_alloc(MEMORY[0x1E0CB35C8]);
    v68 = *MEMORY[0x1E0D025B8];
    v107 = *MEMORY[0x1E0CB2D50];
    v52 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Expecting %@ as an array"), CFSTR("transitionReasons"));
    v108 = v52;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v108, &v107, 1);
    v69 = (void *)objc_claimAutoreleasedReturnValue();
    *v88 = (id)objc_msgSend(v67, "initWithDomain:code:userInfo:", v68, 2, v69);

    p_isa = 0;
LABEL_76:
    v26 = v92;
    goto LABEL_77;
  }

  v49 = 0;
LABEL_50:
  v52 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v49, "count"));
  v98 = 0u;
  v99 = 0u;
  v100 = 0u;
  v101 = 0u;
  v49 = v49;
  v53 = objc_msgSend(v49, "countByEnumeratingWithState:objects:count:", &v98, v106, 16);
  if (!v53)
    goto LABEL_59;
  v54 = v53;
  v55 = *(_QWORD *)v99;
  while (2)
  {
    for (i = 0; i != v54; ++i)
    {
      if (*(_QWORD *)v99 != v55)
        objc_enumerationMutation(v49);
      v57 = *(_QWORD *)(*((_QWORD *)&v98 + 1) + 8 * i);
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v28 = v96;
        v12 = v87;
        v26 = v92;
        if (v88)
        {
          v84 = objc_alloc(MEMORY[0x1E0CB35C8]);
          v83 = *MEMORY[0x1E0D025B8];
          v104 = *MEMORY[0x1E0CB2D50];
          v58 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type null for element of %@, must not be null"), CFSTR("transitionReasons"));
          v105 = v58;
          v59 = (void *)MEMORY[0x1E0C99D80];
          v60 = &v105;
          v61 = &v104;
LABEL_64:
          objc_msgSend(v59, "dictionaryWithObjects:forKeys:count:", v60, v61, 1);
          v62 = (void *)objc_claimAutoreleasedReturnValue();
          *v88 = (id)objc_msgSend(v84, "initWithDomain:code:userInfo:", v83, 2, v62);

        }
LABEL_65:

        p_isa = 0;
        goto LABEL_78;
      }
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        v28 = v96;
        v12 = v87;
        v26 = v92;
        if (v88)
        {
          v84 = objc_alloc(MEMORY[0x1E0CB35C8]);
          v83 = *MEMORY[0x1E0D025B8];
          v102 = *MEMORY[0x1E0CB2D50];
          v58 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSString"), objc_opt_class(), CFSTR("transitionReasons"));
          v103 = v58;
          v59 = (void *)MEMORY[0x1E0C99D80];
          v60 = &v103;
          v61 = &v102;
          goto LABEL_64;
        }
        goto LABEL_65;
      }
      objc_msgSend(v52, "addObject:", v57);
    }
    v54 = objc_msgSend(v49, "countByEnumeratingWithState:objects:count:", &v98, v106, 16);
    if (v54)
      continue;
    break;
  }
LABEL_59:

  v28 = v96;
  v26 = v92;
  self = -[BMFrontBoardDisplayElementDisplay initWithType:name:deviceName:hardwareIdentifier:interfaceOrientation:backlightStatus:transitionReasons:](self, "initWithType:name:deviceName:hardwareIdentifier:interfaceOrientation:backlightStatus:transitionReasons:", objc_msgSend(v95, "intValue"), v96, v92, v97, objc_msgSend(v93, "intValue"), objc_msgSend(v89, "intValue"), v52);
  p_isa = (id *)&self->super.super.isa;
LABEL_77:
  v12 = v87;
LABEL_78:

  v7 = v85;
LABEL_79:

  v10 = v86;
LABEL_80:

  v8 = v95;
LABEL_81:

  v11 = v91;
LABEL_82:

LABEL_83:
LABEL_84:

LABEL_85:
  return (BMFrontBoardDisplayElementDisplay *)p_isa;
}

- (id)_transitionReasonsJSONArray
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v3 = (void *)objc_opt_new();
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  -[BMFrontBoardDisplayElementDisplay transitionReasons](self, "transitionReasons", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v11;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v11 != v7)
          objc_enumerationMutation(v4);
        objc_msgSend(v3, "addObject:", *(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * v8++));
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v6);
  }

  return v3;
}

- (id)jsonDictionary
{
  uint64_t v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  _QWORD v24[7];
  _QWORD v25[9];

  v25[7] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[BMFrontBoardDisplayElementDisplay type](self, "type"));
  v3 = objc_claimAutoreleasedReturnValue();
  -[BMFrontBoardDisplayElementDisplay name](self, "name");
  v4 = objc_claimAutoreleasedReturnValue();
  -[BMFrontBoardDisplayElementDisplay deviceName](self, "deviceName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMFrontBoardDisplayElementDisplay hardwareIdentifier](self, "hardwareIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[BMFrontBoardDisplayElementDisplay interfaceOrientation](self, "interfaceOrientation"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[BMFrontBoardDisplayElementDisplay backlightStatus](self, "backlightStatus"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMFrontBoardDisplayElementDisplay _transitionReasonsJSONArray](self, "_transitionReasonsJSONArray");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v24[0] = CFSTR("type");
  v10 = v3;
  if (!v3)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v10 = objc_claimAutoreleasedReturnValue();
  }
  v21 = (void *)v10;
  v25[0] = v10;
  v24[1] = CFSTR("name");
  v11 = v4;
  if (!v4)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v11 = objc_claimAutoreleasedReturnValue();
  }
  v20 = (void *)v11;
  v25[1] = v11;
  v24[2] = CFSTR("deviceName");
  v12 = (uint64_t)v5;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v12 = objc_claimAutoreleasedReturnValue();
  }
  v23 = (void *)v3;
  v19 = (void *)v12;
  v25[2] = v12;
  v24[3] = CFSTR("hardwareIdentifier");
  v13 = v6;
  if (!v6)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v22 = (void *)v4;
  v25[3] = v13;
  v24[4] = CFSTR("interfaceOrientation");
  v14 = v7;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v25[4] = v14;
  v24[5] = CFSTR("backlightStatus");
  v15 = v8;
  if (!v8)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v25[5] = v15;
  v24[6] = CFSTR("transitionReasons");
  v16 = v9;
  if (!v9)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v25[6] = v16;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v25, v24, 7);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    if (v8)
      goto LABEL_17;
LABEL_25:

    if (v7)
      goto LABEL_18;
    goto LABEL_26;
  }

  if (!v8)
    goto LABEL_25;
LABEL_17:
  if (v7)
    goto LABEL_18;
LABEL_26:

LABEL_18:
  if (!v6)

  if (v5)
  {
    if (v22)
      goto LABEL_22;
LABEL_28:

    if (v23)
      goto LABEL_23;
LABEL_29:

    goto LABEL_23;
  }

  if (!v22)
    goto LABEL_28;
LABEL_22:
  if (!v23)
    goto LABEL_29;
LABEL_23:

  return v17;
}

- (unsigned)dataVersion
{
  return self->_dataVersion;
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

    v4 = -[BMFrontBoardDisplayElementDisplay initByReadFrom:]([BMFrontBoardDisplayElementDisplay alloc], "initByReadFrom:", v7);
    v4[4] = 0;

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
  _QWORD v11[8];

  v11[7] = *MEMORY[0x1E0C80C00];
  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("type"), 0, 0, 1, 4, 0);
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("name"), 2, 0, 2, 13, 0);
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("deviceName"), 2, 0, 3, 13, 0);
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("hardwareIdentifier"), 2, 0, 4, 13, 0);
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("interfaceOrientation"), 0, 0, 5, 4, 0);
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("backlightStatus"), 0, 0, 6, 4, 0);
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02710]), "initWithName:dataType:requestOnly:extractBlock:", CFSTR("transitionReasons_json"), 5, 1, &__block_literal_global_74_52359);
  v11[0] = v2;
  v11[1] = v3;
  v11[2] = v4;
  v11[3] = v5;
  v11[4] = v6;
  v11[5] = v7;
  v11[6] = v8;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v11, 7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

+ (id)validKeyPaths
{
  return &unk_1E5F1DF38;
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
  _QWORD v11[8];

  v11[7] = *MEMORY[0x1E0C80C00];
  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("type"), 1, 4, 0);
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("name"), 2, 13, 0, v2);
  v11[1] = v3;
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("deviceName"), 3, 13, 0);
  v11[2] = v4;
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("hardwareIdentifier"), 4, 13, 0);
  v11[3] = v5;
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("interfaceOrientation"), 5, 4, 0);
  v11[4] = v6;
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("backlightStatus"), 6, 4, 0);
  v11[5] = v7;
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("transitionReasons"), 7, 13, 0);
  v11[6] = v8;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v11, 7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

id __44__BMFrontBoardDisplayElementDisplay_columns__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  void *v4;

  objc_msgSend(a2, "eventBodyKeepingBackingData:", 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_transitionReasonsJSONArray");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  BMConvertObjectToJSONString();
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

@end
