@implementation BMAutonamingInferences

- (BMAutonamingInferences)initWithPhotosPersonIdentifier:(id)a3 inferredName:(id)a4 inferredContactIdentifier:(id)a5 inferredRelationshipToDeviceOwner:(id)a6 confidence:(id)a7 imageMessageIdentifier:(id)a8 contextMessageIdentifiers:(id)a9
{
  id v16;
  id v17;
  id v18;
  BMAutonamingInferences *v19;
  float v20;
  double v21;
  id v23;
  id v24;
  id v25;
  id v26;
  objc_super v27;

  v26 = a3;
  v25 = a4;
  v24 = a5;
  v23 = a6;
  v16 = a7;
  v17 = a8;
  v18 = a9;
  v27.receiver = self;
  v27.super_class = (Class)BMAutonamingInferences;
  v19 = -[BMEventBase init](&v27, sel_init);
  if (v19)
  {
    v19->_dataVersion = objc_msgSend((id)objc_opt_class(), "latestDataVersion", v23, v24, v25, v26);
    objc_storeStrong((id *)&v19->_photosPersonIdentifier, a3);
    objc_storeStrong((id *)&v19->_inferredName, a4);
    objc_storeStrong((id *)&v19->_inferredContactIdentifier, a5);
    objc_storeStrong((id *)&v19->_inferredRelationshipToDeviceOwner, a6);
    if (v16)
    {
      v19->_hasConfidence = 1;
      objc_msgSend(v16, "floatValue");
      v21 = v20;
    }
    else
    {
      v19->_hasConfidence = 0;
      v21 = -1.0;
    }
    v19->_confidence = v21;
    objc_storeStrong((id *)&v19->_imageMessageIdentifier, a8);
    objc_storeStrong((id *)&v19->_contextMessageIdentifiers, a9);
  }

  return v19;
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
  void *v12;

  v3 = objc_alloc(MEMORY[0x1E0CB3940]);
  -[BMAutonamingInferences photosPersonIdentifier](self, "photosPersonIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMAutonamingInferences inferredName](self, "inferredName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMAutonamingInferences inferredContactIdentifier](self, "inferredContactIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMAutonamingInferences inferredRelationshipToDeviceOwner](self, "inferredRelationshipToDeviceOwner");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)MEMORY[0x1E0CB37E8];
  -[BMAutonamingInferences confidence](self, "confidence");
  objc_msgSend(v8, "numberWithDouble:");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMAutonamingInferences imageMessageIdentifier](self, "imageMessageIdentifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMAutonamingInferences contextMessageIdentifiers](self, "contextMessageIdentifiers");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("BMAutonamingInferences with photosPersonIdentifier: %@, inferredName: %@, inferredContactIdentifier: %@, inferredRelationshipToDeviceOwner: %@, confidence: %@, imageMessageIdentifier: %@, contextMessageIdentifiers: %@"), v4, v5, v6, v7, v9, v10, v11);

  return (NSString *)v12;
}

- (id)initByReadFrom:(id)a3
{
  _BYTE *v4;
  BMAutonamingInferences *v5;
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
  int v19;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  unint64_t v24;
  float v25;
  void *v26;
  uint64_t v27;
  void *v28;
  uint64_t v29;
  NSArray *contextMessageIdentifiers;
  int v31;
  BMAutonamingInferences *v32;
  objc_super v34;

  v4 = a3;
  v34.receiver = self;
  v34.super_class = (Class)BMAutonamingInferences;
  v5 = -[BMEventBase init](&v34, sel_init);
  if (!v5)
  {
LABEL_39:
    v32 = v5;
    goto LABEL_40;
  }
  v6 = (void *)objc_opt_new();
  v7 = (int *)MEMORY[0x1E0D82BF0];
  v8 = (int *)MEMORY[0x1E0D82BD8];
  v9 = (int *)MEMORY[0x1E0D82BC8];
  if (*(_QWORD *)&v4[*MEMORY[0x1E0D82BF0]] >= *(_QWORD *)&v4[*MEMORY[0x1E0D82BD8]])
  {
LABEL_37:
    v29 = objc_msgSend(v6, "copy");
    contextMessageIdentifiers = v5->_contextMessageIdentifiers;
    v5->_contextMessageIdentifiers = (NSArray *)v29;

    v31 = v4[*v9];
    if (v31)
      goto LABEL_38;
    goto LABEL_39;
  }
  v10 = (int *)MEMORY[0x1E0D82BB8];
  while (2)
  {
    if (v4[*v9])
      goto LABEL_37;
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
      if (v12++ >= 9)
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
      goto LABEL_37;
    switch((v13 >> 3))
    {
      case 1u:
        PBReaderReadString();
        v21 = objc_claimAutoreleasedReturnValue();
        v22 = 24;
        goto LABEL_30;
      case 2u:
        PBReaderReadString();
        v21 = objc_claimAutoreleasedReturnValue();
        v22 = 32;
        goto LABEL_30;
      case 3u:
        PBReaderReadString();
        v21 = objc_claimAutoreleasedReturnValue();
        v22 = 40;
        goto LABEL_30;
      case 4u:
        PBReaderReadString();
        v21 = objc_claimAutoreleasedReturnValue();
        v22 = 48;
        goto LABEL_30;
      case 5u:
        v5->_hasConfidence = 1;
        v23 = *v7;
        v24 = *(_QWORD *)&v4[v23];
        if (v24 <= 0xFFFFFFFFFFFFFFFBLL && v24 + 4 <= *(_QWORD *)&v4[*v8])
        {
          v25 = *(float *)(*(_QWORD *)&v4[*v10] + v24);
          *(_QWORD *)&v4[v23] = v24 + 4;
        }
        else
        {
          v4[*v9] = 1;
          v25 = 0.0;
        }
        v5->_confidence = v25;
        goto LABEL_31;
      case 6u:
        PBReaderReadString();
        v21 = objc_claimAutoreleasedReturnValue();
        v22 = 64;
LABEL_30:
        v26 = *(Class *)((char *)&v5->super.super.isa + v22);
        *(Class *)((char *)&v5->super.super.isa + v22) = (Class)v21;

        goto LABEL_31;
      case 7u:
        PBReaderReadString();
        v27 = objc_claimAutoreleasedReturnValue();
        if (!v27)
          goto LABEL_41;
        v28 = (void *)v27;
        objc_msgSend(v6, "addObject:", v27);

        goto LABEL_31;
      default:
        if (PBReaderSkipValueWithTag())
        {
LABEL_31:
          if (*(_QWORD *)&v4[*v7] >= *(_QWORD *)&v4[*v8])
            goto LABEL_37;
          continue;
        }
LABEL_41:

LABEL_38:
        v32 = 0;
LABEL_40:

        return v32;
    }
  }
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
  if (self->_photosPersonIdentifier)
    PBDataWriterWriteStringField();
  if (self->_inferredName)
    PBDataWriterWriteStringField();
  if (self->_inferredContactIdentifier)
    PBDataWriterWriteStringField();
  if (self->_inferredRelationshipToDeviceOwner)
    PBDataWriterWriteStringField();
  if (self->_hasConfidence)
    PBDataWriterWriteFloatField();
  if (self->_imageMessageIdentifier)
    PBDataWriterWriteStringField();
  v12 = 0u;
  v13 = 0u;
  v10 = 0u;
  v11 = 0u;
  v5 = self->_contextMessageIdentifiers;
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

- (id)serialize
{
  void *v3;
  void *v4;

  v3 = (void *)objc_opt_new();
  -[BMAutonamingInferences writeTo:](self, "writeTo:", v3);
  objc_msgSend(v3, "immutableData");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (BMAutonamingInferences)initWithJSONDictionary:(id)a3 error:(id *)p_isa
{
  id v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  id v16;
  void *v17;
  int v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t i;
  uint64_t v24;
  void *v25;
  void *v26;
  id v27;
  uint64_t v28;
  id v29;
  id *v30;
  id v31;
  id v32;
  uint64_t v33;
  id *v34;
  uint64_t v35;
  uint64_t v36;
  void *v37;
  uint64_t v38;
  id v39;
  id v40;
  uint64_t v41;
  id *v42;
  uint64_t v43;
  void *v44;
  uint64_t v45;
  void *v46;
  void *v47;
  void **v48;
  uint64_t *v49;
  id v50;
  id v51;
  uint64_t v52;
  id *v53;
  uint64_t v54;
  void *v55;
  uint64_t v56;
  void *v57;
  void *v58;
  id v59;
  id v60;
  uint64_t v61;
  void *v62;
  id v63;
  void *v64;
  uint64_t v65;
  void *v66;
  id v67;
  id *v68;
  id v69;
  uint64_t v70;
  id v71;
  id v72;
  BMAutonamingInferences *v73;
  uint64_t v74;
  void *v75;
  uint64_t v76;
  uint64_t v78;
  uint64_t v79;
  id v80;
  void *v81;
  void *v82;
  BMAutonamingInferences *v83;
  BMAutonamingInferences *v84;
  void *v85;
  id v86;
  void *v87;
  id *v88;
  id v89;
  void *v90;
  id v91;
  id v92;
  id v93;
  id v94;
  void *v95;
  __int128 v96;
  __int128 v97;
  __int128 v98;
  __int128 v99;
  uint64_t v100;
  void *v101;
  uint64_t v102;
  void *v103;
  _BYTE v104[128];
  uint64_t v105;
  void *v106;
  uint64_t v107;
  id v108;
  uint64_t v109;
  id v110;
  uint64_t v111;
  id v112;
  uint64_t v113;
  id v114;
  uint64_t v115;
  uint64_t v116;
  uint64_t v117;
  _QWORD v118[3];

  v118[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("photosPersonIdentifier"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      if (p_isa)
      {
        v27 = objc_alloc(MEMORY[0x1E0CB35C8]);
        v28 = *MEMORY[0x1E0D025B8];
        v117 = *MEMORY[0x1E0CB2D50];
        v25 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSString"), objc_opt_class(), CFSTR("photosPersonIdentifier"));
        v118[0] = v25;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v118, &v117, 1);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v29 = (id)objc_msgSend(v27, "initWithDomain:code:userInfo:", v28, 2, v9);
        v8 = 0;
        v30 = p_isa;
        p_isa = 0;
        *v30 = v29;
        goto LABEL_73;
      }
      v8 = 0;
      goto LABEL_74;
    }
    v8 = v7;
  }
  else
  {
    v8 = 0;
  }
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("inferredName"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      if (p_isa)
      {
        v31 = objc_alloc(MEMORY[0x1E0CB35C8]);
        v32 = v8;
        v33 = *MEMORY[0x1E0D025B8];
        v115 = *MEMORY[0x1E0CB2D50];
        v34 = p_isa;
        v35 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSString"), objc_opt_class(), CFSTR("inferredName"));
        v116 = v35;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v116, &v115, 1);
        v36 = objc_claimAutoreleasedReturnValue();
        v37 = v31;
        v10 = (void *)v36;
        v38 = v33;
        v8 = v32;
        v26 = (void *)v35;
        v25 = 0;
        p_isa = 0;
        *v34 = (id)objc_msgSend(v37, "initWithDomain:code:userInfo:", v38, 2, v36);
        goto LABEL_72;
      }
      v25 = 0;
      goto LABEL_73;
    }
    v93 = v9;
  }
  else
  {
    v93 = 0;
  }
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("inferredContactIdentifier"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v95 = v10;
  if (v10 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      if (p_isa)
      {
        v39 = objc_alloc(MEMORY[0x1E0CB35C8]);
        v40 = v8;
        v41 = *MEMORY[0x1E0D025B8];
        v113 = *MEMORY[0x1E0CB2D50];
        v42 = p_isa;
        v94 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSString"), objc_opt_class(), CFSTR("inferredContactIdentifier"));
        v114 = v94;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v114, &v113, 1);
        v43 = objc_claimAutoreleasedReturnValue();
        v44 = v39;
        v10 = v95;
        v45 = v41;
        v8 = v40;
        v26 = 0;
        p_isa = 0;
        *v42 = (id)objc_msgSend(v44, "initWithDomain:code:userInfo:", v45, 2, v43);
        v11 = (void *)v43;
        v25 = v93;
        goto LABEL_71;
      }
      v26 = 0;
      v25 = v93;
      goto LABEL_72;
    }
    v91 = v10;
  }
  else
  {
    v91 = 0;
  }
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("inferredRelationshipToDeviceOwner"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v83 = self;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      if (p_isa)
      {
        v50 = objc_alloc(MEMORY[0x1E0CB35C8]);
        v51 = v8;
        v52 = *MEMORY[0x1E0D025B8];
        v111 = *MEMORY[0x1E0CB2D50];
        v53 = p_isa;
        v92 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSString"), objc_opt_class(), CFSTR("inferredRelationshipToDeviceOwner"));
        v112 = v92;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v112, &v111, 1);
        v54 = objc_claimAutoreleasedReturnValue();
        v55 = v50;
        v10 = v95;
        v56 = v52;
        v8 = v51;
        v90 = (void *)v54;
        v94 = 0;
        p_isa = 0;
        *v53 = (id)objc_msgSend(v55, "initWithDomain:code:userInfo:", v56, 2);
        v25 = v93;
        v26 = v91;
        self = v83;
        goto LABEL_70;
      }
      v94 = 0;
      v25 = v93;
      v26 = v91;
      goto LABEL_71;
    }
    v94 = v11;
  }
  else
  {
    v94 = 0;
  }
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("confidence"));
  v12 = objc_claimAutoreleasedReturnValue();
  v88 = p_isa;
  v90 = (void *)v12;
  if (v12 && (v13 = (void *)v12, objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      if (!p_isa)
      {
        v92 = 0;
        v25 = v93;
        v26 = v91;
        goto LABEL_70;
      }
      v58 = v11;
      v59 = v8;
      v60 = objc_alloc(MEMORY[0x1E0CB35C8]);
      v61 = *MEMORY[0x1E0D025B8];
      v109 = *MEMORY[0x1E0CB2D50];
      v62 = v7;
      v63 = objc_alloc(MEMORY[0x1E0CB3940]);
      v78 = objc_opt_class();
      v64 = v63;
      v7 = v62;
      v89 = (id)objc_msgSend(v64, "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), v78, CFSTR("confidence"));
      v110 = v89;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v110, &v109, 1);
      v65 = objc_claimAutoreleasedReturnValue();
      v66 = v60;
      v8 = v59;
      v11 = v58;
      v87 = (void *)v65;
      v67 = (id)objc_msgSend(v66, "initWithDomain:code:userInfo:", v61, 2);
      v92 = 0;
      p_isa = 0;
      *v88 = v67;
      v25 = v93;
      goto LABEL_80;
    }
    v85 = v9;
    v86 = v8;
    v92 = v13;
  }
  else
  {
    v85 = v9;
    v86 = v8;
    v92 = 0;
  }
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("imageMessageIdentifier"));
  v14 = objc_claimAutoreleasedReturnValue();
  v82 = v7;
  v87 = (void *)v14;
  if (v14)
  {
    v15 = (void *)v14;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v89 = v15;
        goto LABEL_19;
      }
      if (p_isa)
      {
        v68 = p_isa;
        v69 = objc_alloc(MEMORY[0x1E0CB35C8]);
        v70 = *MEMORY[0x1E0D025B8];
        v107 = *MEMORY[0x1E0CB2D50];
        v16 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSString"), objc_opt_class(), CFSTR("imageMessageIdentifier"));
        v108 = v16;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v108, &v107, 1);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v71 = (id)objc_msgSend(v69, "initWithDomain:code:userInfo:", v70, 2, v19);
        v89 = 0;
        p_isa = 0;
        *v68 = v71;
        v10 = v95;
        v25 = v93;
        v26 = v91;
        v9 = v85;
        goto LABEL_67;
      }
      v89 = 0;
      v9 = v85;
      v8 = v86;
      v25 = v93;
LABEL_80:
      v26 = v91;
      goto LABEL_69;
    }
  }
  v89 = 0;
LABEL_19:
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("contextMessageIdentifiers"));
  v16 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E38], "null");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v16, "isEqual:", v17);

  v9 = v85;
  v81 = v11;
  if (v18)
  {

    v16 = 0;
  }
  else if (v16)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      if (v88)
      {
        v72 = objc_alloc(MEMORY[0x1E0CB35C8]);
        v73 = self;
        v74 = *MEMORY[0x1E0D025B8];
        v105 = *MEMORY[0x1E0CB2D50];
        v19 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Expecting %@ as an array"), CFSTR("contextMessageIdentifiers"));
        v106 = v19;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v106, &v105, 1);
        v75 = (void *)objc_claimAutoreleasedReturnValue();
        v76 = v74;
        self = v73;
        *v88 = (id)objc_msgSend(v72, "initWithDomain:code:userInfo:", v76, 2, v75);

        p_isa = 0;
        v25 = v93;
        v26 = v91;
        goto LABEL_66;
      }
      p_isa = 0;
      v25 = v93;
      v26 = v91;
      goto LABEL_68;
    }
  }
  v19 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v16, "count"));
  v96 = 0u;
  v97 = 0u;
  v98 = 0u;
  v99 = 0u;
  v16 = v16;
  v20 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v96, v104, 16);
  if (!v20)
    goto LABEL_40;
  v21 = v20;
  v22 = *(_QWORD *)v97;
  v84 = self;
  while (2)
  {
    for (i = 0; i != v21; ++i)
    {
      if (*(_QWORD *)v97 != v22)
        objc_enumerationMutation(v16);
      v24 = *(_QWORD *)(*((_QWORD *)&v96 + 1) + 8 * i);
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v10 = v95;
        v26 = v91;
        v11 = v81;
        if (v88)
        {
          v80 = objc_alloc(MEMORY[0x1E0CB35C8]);
          v79 = *MEMORY[0x1E0D025B8];
          v102 = *MEMORY[0x1E0CB2D50];
          v46 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type null for element of %@, must not be null"), CFSTR("contextMessageIdentifiers"));
          v103 = v46;
          v47 = (void *)MEMORY[0x1E0C99D80];
          v48 = &v103;
          v49 = &v102;
LABEL_57:
          objc_msgSend(v47, "dictionaryWithObjects:forKeys:count:", v48, v49, 1);
          v57 = (void *)objc_claimAutoreleasedReturnValue();
          *v88 = (id)objc_msgSend(v80, "initWithDomain:code:userInfo:", v79, 2, v57);

        }
LABEL_58:

        p_isa = 0;
        self = v84;
        v25 = v93;
        goto LABEL_67;
      }
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        v10 = v95;
        v26 = v91;
        v11 = v81;
        if (v88)
        {
          v80 = objc_alloc(MEMORY[0x1E0CB35C8]);
          v79 = *MEMORY[0x1E0D025B8];
          v100 = *MEMORY[0x1E0CB2D50];
          v46 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSString"), objc_opt_class(), CFSTR("contextMessageIdentifiers"));
          v101 = v46;
          v47 = (void *)MEMORY[0x1E0C99D80];
          v48 = &v101;
          v49 = &v100;
          goto LABEL_57;
        }
        goto LABEL_58;
      }
      objc_msgSend(v19, "addObject:", v24);
    }
    v21 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v96, v104, 16);
    self = v84;
    if (v21)
      continue;
    break;
  }
LABEL_40:

  v25 = v93;
  v26 = v91;
  self = -[BMAutonamingInferences initWithPhotosPersonIdentifier:inferredName:inferredContactIdentifier:inferredRelationshipToDeviceOwner:confidence:imageMessageIdentifier:contextMessageIdentifiers:](self, "initWithPhotosPersonIdentifier:inferredName:inferredContactIdentifier:inferredRelationshipToDeviceOwner:confidence:imageMessageIdentifier:contextMessageIdentifiers:", v86, v93, v91, v94, v92, v89, v19);
  p_isa = (id *)&self->super.super.isa;
  v10 = v95;
LABEL_66:
  v11 = v81;
LABEL_67:

LABEL_68:
  v7 = v82;
  v8 = v86;
LABEL_69:

LABEL_70:
LABEL_71:

LABEL_72:
LABEL_73:

LABEL_74:
  return (BMAutonamingInferences *)p_isa;
}

- (id)_contextMessageIdentifiersJSONArray
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
  -[BMAutonamingInferences contextMessageIdentifiers](self, "contextMessageIdentifiers", 0);
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
  double v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  _QWORD v25[7];
  _QWORD v26[9];

  v26[7] = *MEMORY[0x1E0C80C00];
  -[BMAutonamingInferences photosPersonIdentifier](self, "photosPersonIdentifier");
  v3 = objc_claimAutoreleasedReturnValue();
  -[BMAutonamingInferences inferredName](self, "inferredName");
  v4 = objc_claimAutoreleasedReturnValue();
  -[BMAutonamingInferences inferredContactIdentifier](self, "inferredContactIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMAutonamingInferences inferredRelationshipToDeviceOwner](self, "inferredRelationshipToDeviceOwner");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  if (!-[BMAutonamingInferences hasConfidence](self, "hasConfidence")
    || (-[BMAutonamingInferences confidence](self, "confidence"), fabs(v6) == INFINITY))
  {
    v8 = 0;
  }
  else
  {
    -[BMAutonamingInferences confidence](self, "confidence");
    v7 = (void *)MEMORY[0x1E0CB37E8];
    -[BMAutonamingInferences confidence](self, "confidence");
    objc_msgSend(v7, "numberWithDouble:");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  -[BMAutonamingInferences imageMessageIdentifier](self, "imageMessageIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMAutonamingInferences _contextMessageIdentifiersJSONArray](self, "_contextMessageIdentifiersJSONArray");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v25[0] = CFSTR("photosPersonIdentifier");
  v11 = v3;
  if (!v3)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v11 = objc_claimAutoreleasedReturnValue();
  }
  v21 = (void *)v11;
  v26[0] = v11;
  v25[1] = CFSTR("inferredName");
  v12 = v4;
  if (!v4)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v12 = objc_claimAutoreleasedReturnValue();
  }
  v20 = (void *)v12;
  v26[1] = v12;
  v25[2] = CFSTR("inferredContactIdentifier");
  v13 = v5;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v23 = (void *)v3;
  v26[2] = v13;
  v25[3] = CFSTR("inferredRelationshipToDeviceOwner");
  v14 = v24;
  if (!v24)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v22 = (void *)v4;
  v26[3] = v14;
  v25[4] = CFSTR("confidence");
  v15 = v8;
  if (!v8)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v26[4] = v15;
  v25[5] = CFSTR("imageMessageIdentifier");
  v16 = v9;
  if (!v9)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v26[5] = v16;
  v25[6] = CFSTR("contextMessageIdentifiers");
  v17 = v10;
  if (!v10)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v26[6] = v17;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v26, v25, 7);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    if (v9)
      goto LABEL_21;
  }
  else
  {

    if (v9)
      goto LABEL_21;
  }

LABEL_21:
  if (!v8)

  if (!v24)
  if (v5)
  {
    if (v22)
      goto LABEL_27;
LABEL_32:

    if (v23)
      goto LABEL_28;
LABEL_33:

    goto LABEL_28;
  }

  if (!v22)
    goto LABEL_32;
LABEL_27:
  if (!v23)
    goto LABEL_33;
LABEL_28:

  return v18;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  char v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  int v18;
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
  double v31;
  double v32;
  double v33;
  void *v34;
  uint64_t v35;
  void *v36;
  void *v37;
  void *v38;
  int v39;
  void *v41;
  void *v42;
  void *v43;
  void *v44;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    -[BMAutonamingInferences photosPersonIdentifier](self, "photosPersonIdentifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "photosPersonIdentifier");
    v7 = objc_claimAutoreleasedReturnValue();
    if (v6 == (void *)v7)
    {

    }
    else
    {
      v8 = (void *)v7;
      -[BMAutonamingInferences photosPersonIdentifier](self, "photosPersonIdentifier");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "photosPersonIdentifier");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v9, "isEqual:", v10);

      if (!v11)
        goto LABEL_26;
    }
    -[BMAutonamingInferences inferredName](self, "inferredName");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "inferredName");
    v14 = objc_claimAutoreleasedReturnValue();
    if (v13 == (void *)v14)
    {

    }
    else
    {
      v15 = (void *)v14;
      -[BMAutonamingInferences inferredName](self, "inferredName");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "inferredName");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = objc_msgSend(v16, "isEqual:", v17);

      if (!v18)
        goto LABEL_26;
    }
    -[BMAutonamingInferences inferredContactIdentifier](self, "inferredContactIdentifier");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "inferredContactIdentifier");
    v20 = objc_claimAutoreleasedReturnValue();
    if (v19 == (void *)v20)
    {

    }
    else
    {
      v21 = (void *)v20;
      -[BMAutonamingInferences inferredContactIdentifier](self, "inferredContactIdentifier");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "inferredContactIdentifier");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = objc_msgSend(v22, "isEqual:", v23);

      if (!v24)
        goto LABEL_26;
    }
    -[BMAutonamingInferences inferredRelationshipToDeviceOwner](self, "inferredRelationshipToDeviceOwner");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "inferredRelationshipToDeviceOwner");
    v26 = objc_claimAutoreleasedReturnValue();
    if (v25 == (void *)v26)
    {

    }
    else
    {
      v27 = (void *)v26;
      -[BMAutonamingInferences inferredRelationshipToDeviceOwner](self, "inferredRelationshipToDeviceOwner");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "inferredRelationshipToDeviceOwner");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      v30 = objc_msgSend(v28, "isEqual:", v29);

      if (!v30)
        goto LABEL_26;
    }
    if (-[BMAutonamingInferences hasConfidence](self, "hasConfidence")
      || objc_msgSend(v5, "hasConfidence"))
    {
      if (!-[BMAutonamingInferences hasConfidence](self, "hasConfidence"))
        goto LABEL_26;
      if (!objc_msgSend(v5, "hasConfidence"))
        goto LABEL_26;
      -[BMAutonamingInferences confidence](self, "confidence");
      v32 = v31;
      objc_msgSend(v5, "confidence");
      if (v32 != v33)
        goto LABEL_26;
    }
    -[BMAutonamingInferences imageMessageIdentifier](self, "imageMessageIdentifier");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "imageMessageIdentifier");
    v35 = objc_claimAutoreleasedReturnValue();
    if (v34 == (void *)v35)
    {

    }
    else
    {
      v36 = (void *)v35;
      -[BMAutonamingInferences imageMessageIdentifier](self, "imageMessageIdentifier");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "imageMessageIdentifier");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      v39 = objc_msgSend(v37, "isEqual:", v38);

      if (!v39)
      {
LABEL_26:
        v12 = 0;
LABEL_27:

        goto LABEL_28;
      }
    }
    -[BMAutonamingInferences contextMessageIdentifiers](self, "contextMessageIdentifiers");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "contextMessageIdentifiers");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    if (v41 == v42)
    {
      v12 = 1;
    }
    else
    {
      -[BMAutonamingInferences contextMessageIdentifiers](self, "contextMessageIdentifiers");
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "contextMessageIdentifiers");
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v43, "isEqual:", v44);

    }
    goto LABEL_27;
  }
  v12 = 0;
LABEL_28:

  return v12;
}

- (unsigned)dataVersion
{
  return self->_dataVersion;
}

- (NSString)photosPersonIdentifier
{
  return self->_photosPersonIdentifier;
}

- (NSString)inferredName
{
  return self->_inferredName;
}

- (NSString)inferredContactIdentifier
{
  return self->_inferredContactIdentifier;
}

- (NSString)inferredRelationshipToDeviceOwner
{
  return self->_inferredRelationshipToDeviceOwner;
}

- (double)confidence
{
  return self->_confidence;
}

- (BOOL)hasConfidence
{
  return self->_hasConfidence;
}

- (void)setHasConfidence:(BOOL)a3
{
  self->_hasConfidence = a3;
}

- (NSString)imageMessageIdentifier
{
  return self->_imageMessageIdentifier;
}

- (NSArray)contextMessageIdentifiers
{
  return self->_contextMessageIdentifiers;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contextMessageIdentifiers, 0);
  objc_storeStrong((id *)&self->_imageMessageIdentifier, 0);
  objc_storeStrong((id *)&self->_inferredRelationshipToDeviceOwner, 0);
  objc_storeStrong((id *)&self->_inferredContactIdentifier, 0);
  objc_storeStrong((id *)&self->_inferredName, 0);
  objc_storeStrong((id *)&self->_photosPersonIdentifier, 0);
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

    v4 = -[BMAutonamingInferences initByReadFrom:]([BMAutonamingInferences alloc], "initByReadFrom:", v7);
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
  _QWORD v11[8];

  v11[7] = *MEMORY[0x1E0C80C00];
  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("photosPersonIdentifier"), 2, 0, 1, 13, 0);
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("inferredName"), 2, 0, 2, 13, 0);
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("inferredContactIdentifier"), 2, 0, 3, 13, 0);
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("inferredRelationshipToDeviceOwner"), 2, 0, 4, 13, 0);
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("confidence"), 1, 0, 5, 1, 0);
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("imageMessageIdentifier"), 2, 0, 6, 13, 0);
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02710]), "initWithName:dataType:requestOnly:extractBlock:", CFSTR("contextMessageIdentifiers_json"), 5, 1, &__block_literal_global_36000);
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
  return &unk_1E5F1C9F0;
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
  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("photosPersonIdentifier"), 1, 13, 0);
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("inferredName"), 2, 13, 0, v2);
  v11[1] = v3;
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("inferredContactIdentifier"), 3, 13, 0);
  v11[2] = v4;
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("inferredRelationshipToDeviceOwner"), 4, 13, 0);
  v11[3] = v5;
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("confidence"), 5, 1, 0);
  v11[4] = v6;
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("imageMessageIdentifier"), 6, 13, 0);
  v11[5] = v7;
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("contextMessageIdentifiers"), 7, 13, 0);
  v11[6] = v8;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v11, 7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

id __33__BMAutonamingInferences_columns__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  void *v4;

  objc_msgSend(a2, "eventBodyKeepingBackingData:", 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_contextMessageIdentifiersJSONArray");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  BMConvertObjectToJSONString();
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (BMAutonamingInferences)initWithPhotosPersonIdentifier:(id)a3 inferredName:(id)a4 inferredContactIdentifier:(id)a5 inferredRelationshipToDeviceOwner:(id)a6 confidence:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  void *v17;
  BMAutonamingInferences *v18;

  v12 = a7;
  v13 = a6;
  v14 = a5;
  v15 = a4;
  v16 = a3;
  v17 = (void *)objc_opt_new();
  v18 = -[BMAutonamingInferences initWithPhotosPersonIdentifier:inferredName:inferredContactIdentifier:inferredRelationshipToDeviceOwner:confidence:imageMessageIdentifier:contextMessageIdentifiers:](self, "initWithPhotosPersonIdentifier:inferredName:inferredContactIdentifier:inferredRelationshipToDeviceOwner:confidence:imageMessageIdentifier:contextMessageIdentifiers:", v16, v15, v14, v13, v12, 0, v17);

  return v18;
}

@end
