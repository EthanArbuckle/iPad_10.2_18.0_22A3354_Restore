@implementation BMHomeKitClientMediaAccessoryControl

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
  _QWORD v14[11];

  v14[10] = *MEMORY[0x1E0C80C00];
  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02710]), "initWithName:dataType:requestOnly:extractBlock:", CFSTR("base_json"), 5, 1, &__block_literal_global_28970);
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("accessoryUniqueIdentifier"), 2, 0, 2, 13, 0);
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02710]), "initWithName:dataType:requestOnly:extractBlock:", CFSTR("accessoryState_json"), 5, 1, &__block_literal_global_51_28972);
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("accessoryMediaRouteIdentifier"), 2, 0, 4, 13, 0);
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02710]), "initWithName:dataType:requestOnly:extractBlock:", CFSTR("zoneUniqueIdentifiers_json"), 5, 1, &__block_literal_global_52_28973);
  v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("roomUniqueIdentifier"), 2, 0, 6, 13, 0);
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("accessoryName"), 2, 0, 7, 13, 0);
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("roomName"), 2, 0, 8, 13, 0);
  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02710]), "initWithName:dataType:requestOnly:extractBlock:", CFSTR("zoneNames_json"), 5, 1, &__block_literal_global_53);
  v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("homeName"), 2, 0, 10, 13, 0);
  v14[0] = v2;
  v14[1] = v3;
  v14[2] = v4;
  v14[3] = v5;
  v14[4] = v6;
  v14[5] = v13;
  v14[6] = v7;
  v14[7] = v8;
  v14[8] = v9;
  v14[9] = v10;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v14, 10);
  v12 = (id)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (BMHomeKitClientMediaAccessoryControl)initWithBase:(id)a3 accessoryUniqueIdentifier:(id)a4 accessoryState:(id)a5 accessoryMediaRouteIdentifier:(id)a6 zoneUniqueIdentifiers:(id)a7 roomUniqueIdentifier:(id)a8 accessoryName:(id)a9 roomName:(id)a10 zoneNames:(id)a11 homeName:(id)a12
{
  id v18;
  id v19;
  id v20;
  id v21;
  BMHomeKitClientMediaAccessoryControl *v22;
  id v25;
  id v26;
  id v27;
  id v28;
  id v29;
  id v30;
  id v31;
  id v32;
  id v33;
  objc_super v34;

  v33 = a3;
  v32 = a4;
  v25 = a5;
  v31 = a5;
  v26 = a6;
  v30 = a6;
  v29 = a7;
  v27 = a8;
  v28 = a8;
  v18 = a9;
  v19 = a10;
  v20 = a11;
  v21 = a12;
  v34.receiver = self;
  v34.super_class = (Class)BMHomeKitClientMediaAccessoryControl;
  v22 = -[BMEventBase init](&v34, sel_init);
  if (v22)
  {
    v22->_dataVersion = objc_msgSend((id)objc_opt_class(), "latestDataVersion");
    objc_storeStrong((id *)&v22->_base, a3);
    objc_storeStrong((id *)&v22->_accessoryUniqueIdentifier, a4);
    objc_storeStrong((id *)&v22->_accessoryState, v25);
    objc_storeStrong((id *)&v22->_accessoryMediaRouteIdentifier, v26);
    objc_storeStrong((id *)&v22->_zoneUniqueIdentifiers, a7);
    objc_storeStrong((id *)&v22->_roomUniqueIdentifier, v27);
    objc_storeStrong((id *)&v22->_accessoryName, a9);
    objc_storeStrong((id *)&v22->_roomName, a10);
    objc_storeStrong((id *)&v22->_zoneNames, a11);
    objc_storeStrong((id *)&v22->_homeName, a12);
  }

  return v22;
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
  void *v14;
  id v15;

  v15 = objc_alloc(MEMORY[0x1E0CB3940]);
  -[BMHomeKitClientMediaAccessoryControl base](self, "base");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMHomeKitClientMediaAccessoryControl accessoryUniqueIdentifier](self, "accessoryUniqueIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMHomeKitClientMediaAccessoryControl accessoryState](self, "accessoryState");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMHomeKitClientMediaAccessoryControl accessoryMediaRouteIdentifier](self, "accessoryMediaRouteIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMHomeKitClientMediaAccessoryControl zoneUniqueIdentifiers](self, "zoneUniqueIdentifiers");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMHomeKitClientMediaAccessoryControl roomUniqueIdentifier](self, "roomUniqueIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMHomeKitClientMediaAccessoryControl accessoryName](self, "accessoryName");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMHomeKitClientMediaAccessoryControl roomName](self, "roomName");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMHomeKitClientMediaAccessoryControl zoneNames](self, "zoneNames");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMHomeKitClientMediaAccessoryControl homeName](self, "homeName");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)objc_msgSend(v15, "initWithFormat:", CFSTR("BMHomeKitClientMediaAccessoryControl with base: %@, accessoryUniqueIdentifier: %@, accessoryState: %@, accessoryMediaRouteIdentifier: %@, zoneUniqueIdentifiers: %@, roomUniqueIdentifier: %@, accessoryName: %@, roomName: %@, zoneNames: %@, homeName: %@"), v14, v3, v4, v5, v6, v7, v8, v9, v10, v11);

  return (NSString *)v12;
}

- (id)initByReadFrom:(id)a3
{
  _BYTE *v4;
  BMHomeKitClientMediaAccessoryControl *v5;
  void *v6;
  void *v7;
  void *v8;
  int *v9;
  int *v10;
  int *v11;
  int *v12;
  char v13;
  unsigned int v14;
  unint64_t v15;
  uint64_t v16;
  unint64_t v17;
  char v18;
  int v20;
  BMHomeKitBase *v22;
  BMHomeKitBase *base;
  uint64_t v24;
  uint64_t v25;
  id v26;
  void *v27;
  uint64_t v28;
  void *v29;
  uint64_t v30;
  void *v31;
  uint64_t v32;
  NSArray *accessoryState;
  uint64_t v34;
  NSArray *zoneUniqueIdentifiers;
  uint64_t v36;
  NSArray *zoneNames;
  int v38;
  BMHomeKitClientMediaAccessoryControl *v39;
  objc_super v41;
  uint64_t v42;
  uint64_t v43;

  v4 = a3;
  v41.receiver = self;
  v41.super_class = (Class)BMHomeKitClientMediaAccessoryControl;
  v5 = -[BMEventBase init](&v41, sel_init);
  if (!v5)
  {
LABEL_44:
    v39 = v5;
    goto LABEL_45;
  }
  v6 = (void *)objc_opt_new();
  v7 = (void *)objc_opt_new();
  v8 = (void *)objc_opt_new();
  v9 = (int *)MEMORY[0x1E0D82BF0];
  v10 = (int *)MEMORY[0x1E0D82BD8];
  v11 = (int *)MEMORY[0x1E0D82BC8];
  if (*(_QWORD *)&v4[*MEMORY[0x1E0D82BF0]] >= *(_QWORD *)&v4[*MEMORY[0x1E0D82BD8]])
  {
LABEL_42:
    v32 = objc_msgSend(v6, "copy");
    accessoryState = v5->_accessoryState;
    v5->_accessoryState = (NSArray *)v32;

    v34 = objc_msgSend(v7, "copy");
    zoneUniqueIdentifiers = v5->_zoneUniqueIdentifiers;
    v5->_zoneUniqueIdentifiers = (NSArray *)v34;

    v36 = objc_msgSend(v8, "copy");
    zoneNames = v5->_zoneNames;
    v5->_zoneNames = (NSArray *)v36;

    v38 = v4[*v11];
    if (v38)
      goto LABEL_43;
    goto LABEL_44;
  }
  v12 = (int *)MEMORY[0x1E0D82BB8];
  while (2)
  {
    if (v4[*v11])
      goto LABEL_42;
    v13 = 0;
    v14 = 0;
    v15 = 0;
    while (1)
    {
      v16 = *v9;
      v17 = *(_QWORD *)&v4[v16];
      if (v17 == -1 || v17 >= *(_QWORD *)&v4[*v10])
        break;
      v18 = *(_BYTE *)(*(_QWORD *)&v4[*v12] + v17);
      *(_QWORD *)&v4[v16] = v17 + 1;
      v15 |= (unint64_t)(v18 & 0x7F) << v13;
      if ((v18 & 0x80) == 0)
        goto LABEL_13;
      v13 += 7;
      if (v14++ >= 9)
      {
        v15 = 0;
        v20 = v4[*v11];
        goto LABEL_15;
      }
    }
    v4[*v11] = 1;
LABEL_13:
    v20 = v4[*v11];
    if (v4[*v11])
      v15 = 0;
LABEL_15:
    if (v20 || (v15 & 7) == 4)
      goto LABEL_42;
    switch((v15 >> 3))
    {
      case 1u:
        v42 = 0;
        v43 = 0;
        if ((PBReaderPlaceMark() & 1) == 0)
          goto LABEL_46;
        v22 = -[BMHomeKitBase initByReadFrom:]([BMHomeKitBase alloc], "initByReadFrom:", v4);
        if (!v22)
          goto LABEL_46;
        base = v5->_base;
        v5->_base = v22;

        PBReaderRecallMark();
        goto LABEL_41;
      case 2u:
        PBReaderReadString();
        v24 = objc_claimAutoreleasedReturnValue();
        v25 = 32;
        goto LABEL_40;
      case 3u:
        v42 = 0;
        v43 = 0;
        if ((PBReaderPlaceMark() & 1) == 0)
          goto LABEL_46;
        v26 = -[BMHomeKitAccessoryState initByReadFrom:]([BMHomeKitAccessoryState alloc], "initByReadFrom:", v4);
        if (!v26)
          goto LABEL_46;
        v27 = v26;
        objc_msgSend(v6, "addObject:", v26);
        PBReaderRecallMark();
        goto LABEL_38;
      case 4u:
        PBReaderReadString();
        v24 = objc_claimAutoreleasedReturnValue();
        v25 = 48;
        goto LABEL_40;
      case 5u:
        PBReaderReadString();
        v28 = objc_claimAutoreleasedReturnValue();
        if (!v28)
          goto LABEL_46;
        v27 = (void *)v28;
        v29 = v7;
        goto LABEL_37;
      case 6u:
        PBReaderReadString();
        v24 = objc_claimAutoreleasedReturnValue();
        v25 = 64;
        goto LABEL_40;
      case 7u:
        PBReaderReadString();
        v24 = objc_claimAutoreleasedReturnValue();
        v25 = 72;
        goto LABEL_40;
      case 8u:
        PBReaderReadString();
        v24 = objc_claimAutoreleasedReturnValue();
        v25 = 80;
        goto LABEL_40;
      case 9u:
        PBReaderReadString();
        v30 = objc_claimAutoreleasedReturnValue();
        if (!v30)
          goto LABEL_46;
        v27 = (void *)v30;
        v29 = v8;
LABEL_37:
        objc_msgSend(v29, "addObject:", v27);
LABEL_38:

        goto LABEL_41;
      case 0xAu:
        PBReaderReadString();
        v24 = objc_claimAutoreleasedReturnValue();
        v25 = 96;
LABEL_40:
        v31 = *(Class *)((char *)&v5->super.super.isa + v25);
        *(Class *)((char *)&v5->super.super.isa + v25) = (Class)v24;

        goto LABEL_41;
      default:
        if (PBReaderSkipValueWithTag())
        {
LABEL_41:
          if (*(_QWORD *)&v4[*v9] >= *(_QWORD *)&v4[*v10])
            goto LABEL_42;
          continue;
        }
LABEL_46:

LABEL_43:
        v39 = 0;
LABEL_45:

        return v39;
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
  void *v10;
  NSArray *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  NSArray *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
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
  uint64_t v33;
  _BYTE v34[128];
  _BYTE v35[128];
  _BYTE v36[128];
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (self->_base)
  {
    v33 = 0;
    PBDataWriterPlaceMark();
    -[BMHomeKitBase writeTo:](self->_base, "writeTo:", v4);
    PBDataWriterRecallMark();
  }
  if (self->_accessoryUniqueIdentifier)
    PBDataWriterWriteStringField();
  v31 = 0u;
  v32 = 0u;
  v29 = 0u;
  v30 = 0u;
  v5 = self->_accessoryState;
  v6 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v29, v36, 16);
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
        v10 = *(void **)(*((_QWORD *)&v29 + 1) + 8 * v9);
        v33 = 0;
        PBDataWriterPlaceMark();
        objc_msgSend(v10, "writeTo:", v4);
        PBDataWriterRecallMark();
        ++v9;
      }
      while (v7 != v9);
      v7 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v29, v36, 16);
    }
    while (v7);
  }

  if (self->_accessoryMediaRouteIdentifier)
    PBDataWriterWriteStringField();
  v27 = 0u;
  v28 = 0u;
  v25 = 0u;
  v26 = 0u;
  v11 = self->_zoneUniqueIdentifiers;
  v12 = -[NSArray countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v25, v35, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v26;
    do
    {
      v15 = 0;
      do
      {
        if (*(_QWORD *)v26 != v14)
          objc_enumerationMutation(v11);
        PBDataWriterWriteStringField();
        ++v15;
      }
      while (v13 != v15);
      v13 = -[NSArray countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v25, v35, 16);
    }
    while (v13);
  }

  if (self->_roomUniqueIdentifier)
    PBDataWriterWriteStringField();
  if (self->_accessoryName)
    PBDataWriterWriteStringField();
  if (self->_roomName)
    PBDataWriterWriteStringField();
  v23 = 0u;
  v24 = 0u;
  v21 = 0u;
  v22 = 0u;
  v16 = self->_zoneNames;
  v17 = -[NSArray countByEnumeratingWithState:objects:count:](v16, "countByEnumeratingWithState:objects:count:", &v21, v34, 16);
  if (v17)
  {
    v18 = v17;
    v19 = *(_QWORD *)v22;
    do
    {
      v20 = 0;
      do
      {
        if (*(_QWORD *)v22 != v19)
          objc_enumerationMutation(v16);
        PBDataWriterWriteStringField();
        ++v20;
      }
      while (v18 != v20);
      v18 = -[NSArray countByEnumeratingWithState:objects:count:](v16, "countByEnumeratingWithState:objects:count:", &v21, v34, 16);
    }
    while (v18);
  }

  if (self->_homeName)
    PBDataWriterWriteStringField();

}

- (id)serialize
{
  void *v3;
  void *v4;

  v3 = (void *)objc_opt_new();
  -[BMHomeKitClientMediaAccessoryControl writeTo:](self, "writeTo:", v3);
  objc_msgSend(v3, "immutableData");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (BMHomeKitClientMediaAccessoryControl)initWithJSONDictionary:(id)a3 error:(id *)a4
{
  id v5;
  void *v6;
  BMHomeKitBase *v7;
  uint64_t v8;
  void *v9;
  id v10;
  id v11;
  void *v12;
  int v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  id v19;
  BMHomeKitAccessoryState *v20;
  BMHomeKitAccessoryState *v21;
  id v22;
  id v23;
  id v24;
  void *v25;
  int v26;
  id v27;
  void *v28;
  BMHomeKitClientMediaAccessoryControl *v29;
  id v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  BMHomeKitBase *v34;
  id v35;
  uint64_t v36;
  uint64_t v37;
  void *v38;
  id v39;
  id *v40;
  id v41;
  uint64_t v42;
  void *v43;
  id *v44;
  uint64_t *v45;
  id v46;
  id v47;
  uint64_t v48;
  id v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  id v53;
  uint64_t i;
  uint64_t v55;
  uint64_t v56;
  void *v57;
  id *v58;
  id v59;
  uint64_t v60;
  uint64_t v61;
  void *v62;
  uint64_t v63;
  id v64;
  uint64_t v65;
  void *v66;
  BMHomeKitBase *v67;
  id v68;
  uint64_t v69;
  uint64_t v70;
  void *v71;
  id v72;
  id v73;
  uint64_t v74;
  id v75;
  uint64_t v76;
  void *v77;
  uint64_t v78;
  void *v79;
  void *v80;
  void *v81;
  int v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  id v86;
  uint64_t v87;
  uint64_t v88;
  id v89;
  void *v90;
  id *v91;
  id v92;
  uint64_t v93;
  void *v94;
  void *v95;
  uint64_t v96;
  uint64_t v97;
  uint64_t v98;
  id v99;
  id v100;
  uint64_t v101;
  uint64_t v102;
  uint64_t v103;
  void *v104;
  id v105;
  uint64_t v106;
  uint64_t v107;
  uint64_t v108;
  id v109;
  uint64_t v110;
  uint64_t v111;
  id v112;
  uint64_t v114;
  void *v115;
  void *v116;
  uint64_t v117;
  id v118;
  void *v119;
  void *v120;
  id v121;
  id v122;
  void *v123;
  void *v124;
  void *v125;
  id v126;
  void *v127;
  id obj;
  id v129;
  void *v130;
  void *v131;
  id v132;
  void *v133;
  BMHomeKitClientMediaAccessoryControl *v134;
  BMHomeKitClientMediaAccessoryControl *v135;
  id v136;
  id v137;
  BMHomeKitBase *v138;
  void *v139;
  void *v140;
  void *v141;
  void *v142;
  id v144;
  void *v145;
  void *v146;
  __int128 v147;
  __int128 v148;
  __int128 v149;
  __int128 v150;
  __int128 v151;
  __int128 v152;
  __int128 v153;
  __int128 v154;
  id v155;
  __int128 v156;
  __int128 v157;
  __int128 v158;
  __int128 v159;
  id v160;
  uint64_t v161;
  void *v162;
  uint64_t v163;
  void *v164;
  uint64_t v165;
  void *v166;
  _BYTE v167[128];
  uint64_t v168;
  void *v169;
  uint64_t v170;
  id v171;
  uint64_t v172;
  id v173;
  uint64_t v174;
  id v175;
  uint64_t v176;
  void *v177;
  uint64_t v178;
  void *v179;
  _BYTE v180[128];
  uint64_t v181;
  void *v182;
  uint64_t v183;
  id v184;
  uint64_t v185;
  id v186;
  uint64_t v187;
  id v188;
  _BYTE v189[128];
  uint64_t v190;
  void *v191;
  uint64_t v192;
  id v193;
  uint64_t v194;
  _QWORD v195[3];

  v195[1] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("base"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v6 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v7 = 0;
    goto LABEL_4;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v10 = v6;
    v160 = 0;
    v7 = -[BMHomeKitBase initWithJSONDictionary:error:]([BMHomeKitBase alloc], "initWithJSONDictionary:error:", v10, &v160);
    v27 = v160;
    if (v27)
    {
      v28 = v27;
      if (a4)
        *a4 = objc_retainAutorelease(v27);

      v29 = 0;
      goto LABEL_149;
    }

LABEL_4:
    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("accessoryUniqueIdentifier"));
    v8 = objc_claimAutoreleasedReturnValue();
    v139 = v6;
    v140 = (void *)v8;
    if (v8 && (v9 = (void *)v8, objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if (a4)
        {
          v34 = v7;
          v35 = objc_alloc(MEMORY[0x1E0CB35C8]);
          v36 = *MEMORY[0x1E0D025B8];
          v192 = *MEMORY[0x1E0CB2D50];
          v11 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSString"), objc_opt_class(), CFSTR("accessoryUniqueIdentifier"));
          v193 = v11;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v193, &v192, 1);
          v37 = objc_claimAutoreleasedReturnValue();
          v38 = v35;
          v7 = v34;
          v146 = (void *)v37;
          v39 = (id)objc_msgSend(v38, "initWithDomain:code:userInfo:", v36, 2);
          v10 = 0;
          v29 = 0;
          *a4 = v39;

          goto LABEL_147;
        }
        v10 = 0;
        v29 = 0;
LABEL_148:

        goto LABEL_149;
      }
      v10 = v9;
    }
    else
    {
      v10 = 0;
    }
    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("accessoryState"));
    v11 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v11, "isEqual:", v12);

    if (v13)
    {
      v134 = self;
      v137 = v10;
      v130 = v5;

      v11 = 0;
      goto LABEL_12;
    }
    if (!v11 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      v134 = self;
      v137 = v10;
      v130 = v5;
LABEL_12:
      v145 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v11, "count"));
      v156 = 0u;
      v157 = 0u;
      v158 = 0u;
      v159 = 0u;
      v11 = v11;
      v14 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v156, v189, 16);
      v138 = v7;
      if (!v14)
        goto LABEL_22;
      v15 = v14;
      v16 = *(_QWORD *)v157;
LABEL_14:
      v17 = 0;
      while (1)
      {
        if (*(_QWORD *)v157 != v16)
          objc_enumerationMutation(v11);
        v18 = *(void **)(*((_QWORD *)&v156 + 1) + 8 * v17);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
          break;
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          v40 = a4;
          if (a4)
          {
            v41 = objc_alloc(MEMORY[0x1E0CB35C8]);
            v42 = *MEMORY[0x1E0D025B8];
            v185 = *MEMORY[0x1E0CB2D50];
            v19 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSDictionary"), objc_opt_class(), CFSTR("accessoryState"));
            v186 = v19;
            v43 = (void *)MEMORY[0x1E0C99D80];
            v44 = &v186;
            v45 = &v185;
            goto LABEL_42;
          }
          goto LABEL_63;
        }
        v19 = v18;
        v20 = [BMHomeKitAccessoryState alloc];
        v155 = 0;
        v21 = -[BMHomeKitAccessoryState initWithJSONDictionary:error:](v20, "initWithJSONDictionary:error:", v19, &v155);
        v22 = v155;
        if (v22)
        {
          v24 = v22;
          if (a4)
            *a4 = objc_retainAutorelease(v22);

          v29 = 0;
          goto LABEL_46;
        }
        objc_msgSend(v145, "addObject:", v21);

        if (v15 == ++v17)
        {
          v15 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v156, v189, 16);
          v7 = v138;
          if (!v15)
          {
LABEL_22:

            v5 = v130;
            objc_msgSend(v130, "objectForKeyedSubscript:", CFSTR("accessoryMediaRouteIdentifier"));
            v19 = (id)objc_claimAutoreleasedReturnValue();
            if (v19 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
            {
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) == 0)
              {
                if (a4)
                {
                  v67 = v7;
                  v68 = objc_alloc(MEMORY[0x1E0CB35C8]);
                  v69 = *MEMORY[0x1E0D025B8];
                  v183 = *MEMORY[0x1E0CB2D50];
                  v24 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSString"), objc_opt_class(), CFSTR("accessoryMediaRouteIdentifier"));
                  v184 = v24;
                  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v184, &v183, 1);
                  v70 = objc_claimAutoreleasedReturnValue();
                  v71 = v68;
                  v7 = v67;
                  v142 = (void *)v70;
                  v72 = (id)objc_msgSend(v71, "initWithDomain:code:userInfo:", v69, 2);
                  v23 = 0;
                  v29 = 0;
                  *a4 = v72;
                  self = v134;
                  v10 = v137;

                  goto LABEL_143;
                }
                v23 = 0;
                v29 = 0;
                self = v134;
                v10 = v137;
                goto LABEL_144;
              }
              v23 = v19;
            }
            else
            {
              v23 = 0;
            }
            objc_msgSend(v130, "objectForKeyedSubscript:", CFSTR("zoneUniqueIdentifiers"));
            v24 = (id)objc_claimAutoreleasedReturnValue();
            objc_msgSend(MEMORY[0x1E0C99E38], "null");
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            v26 = objc_msgSend(v24, "isEqual:", v25);

            if (v26)
            {

              v24 = 0;
            }
            else
            {
              v10 = v137;
              if (v24)
              {
                objc_opt_class();
                if ((objc_opt_isKindOfClass() & 1) == 0)
                {
                  if (a4)
                  {
                    v73 = objc_alloc(MEMORY[0x1E0CB35C8]);
                    v74 = *MEMORY[0x1E0D025B8];
                    v181 = *MEMORY[0x1E0CB2D50];
                    v141 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Expecting %@ as an array"), CFSTR("zoneUniqueIdentifiers"));
                    v182 = v141;
                    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v182, &v181, 1);
                    v66 = (void *)objc_claimAutoreleasedReturnValue();
                    v75 = (id)objc_msgSend(v73, "initWithDomain:code:userInfo:", v74, 2, v66);
                    v29 = 0;
                    *a4 = v75;
                    self = v134;
                    v7 = v138;
                    goto LABEL_141;
                  }
                  v29 = 0;
                  self = v134;
                  v7 = v138;
                  goto LABEL_143;
                }
              }
            }
            v141 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v24, "count"));
            v151 = 0u;
            v152 = 0u;
            v153 = 0u;
            v154 = 0u;
            v24 = v24;
            v50 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v151, v180, 16);
            v129 = v23;
            if (!v50)
              goto LABEL_60;
            v51 = v50;
            v52 = *(_QWORD *)v152;
            while (1)
            {
              v53 = v5;
              for (i = 0; i != v51; ++i)
              {
                if (*(_QWORD *)v152 != v52)
                  objc_enumerationMutation(v24);
                v55 = *(_QWORD *)(*((_QWORD *)&v151 + 1) + 8 * i);
                objc_opt_class();
                if ((objc_opt_isKindOfClass() & 1) != 0)
                {
                  v58 = a4;
                  if (a4)
                  {
                    v59 = objc_alloc(MEMORY[0x1E0CB35C8]);
                    v60 = *MEMORY[0x1E0D025B8];
                    v178 = *MEMORY[0x1E0CB2D50];
                    v127 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type null for element of %@, must not be null"), CFSTR("zoneUniqueIdentifiers"));
                    v179 = v127;
                    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v179, &v178, 1);
                    v61 = objc_claimAutoreleasedReturnValue();
                    v62 = v59;
                    v63 = v60;
LABEL_73:
                    v125 = (void *)v61;
                    v5 = v53;
                    self = v134;
                    v29 = 0;
                    *v58 = (id)objc_msgSend(v62, "initWithDomain:code:userInfo:", v63, 2);
                    v66 = v24;
                    v10 = v137;
                    v7 = v138;
                    v23 = v129;

                    goto LABEL_140;
                  }
LABEL_75:
                  v29 = 0;
                  v66 = v24;
                  v5 = v53;
                  self = v134;
                  v10 = v137;
                  v7 = v138;
                  v23 = v129;
                  goto LABEL_141;
                }
                objc_opt_class();
                if ((objc_opt_isKindOfClass() & 1) == 0)
                {
                  v58 = a4;
                  if (a4)
                  {
                    v64 = objc_alloc(MEMORY[0x1E0CB35C8]);
                    v65 = *MEMORY[0x1E0D025B8];
                    v176 = *MEMORY[0x1E0CB2D50];
                    v127 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSString"), objc_opt_class(), CFSTR("zoneUniqueIdentifiers"));
                    v177 = v127;
                    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v177, &v176, 1);
                    v61 = objc_claimAutoreleasedReturnValue();
                    v62 = v64;
                    v63 = v65;
                    goto LABEL_73;
                  }
                  goto LABEL_75;
                }
                objc_msgSend(v141, "addObject:", v55);
              }
              v51 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v151, v180, 16);
              v5 = v53;
              v23 = v129;
              if (!v51)
              {
LABEL_60:

                objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("roomUniqueIdentifier"));
                v56 = objc_claimAutoreleasedReturnValue();
                v127 = (void *)v56;
                if (!v56)
                {
                  v121 = 0;
                  self = v134;
                  goto LABEL_83;
                }
                v57 = (void *)v56;
                objc_opt_class();
                self = v134;
                if ((objc_opt_isKindOfClass() & 1) != 0)
                {
                  v121 = 0;
LABEL_83:
                  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("accessoryName"));
                  v76 = objc_claimAutoreleasedReturnValue();
                  v123 = (void *)v76;
                  if (v76 && (v77 = (void *)v76, objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
                  {
                    objc_opt_class();
                    if ((objc_opt_isKindOfClass() & 1) != 0)
                    {
                      v126 = v77;
                      goto LABEL_86;
                    }
                    if (!a4)
                    {
                      v126 = 0;
                      v29 = 0;
                      v10 = v137;
                      v7 = v138;
                      v66 = v121;
                      goto LABEL_138;
                    }
                    v100 = objc_alloc(MEMORY[0x1E0CB35C8]);
                    v101 = *MEMORY[0x1E0D025B8];
                    v172 = *MEMORY[0x1E0CB2D50];
                    v122 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSString"), objc_opt_class(), CFSTR("accessoryName"));
                    v173 = v122;
                    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v173, &v172, 1);
                    v102 = objc_claimAutoreleasedReturnValue();
                    v103 = v101;
                    v23 = v129;
                    v120 = (void *)v102;
                    v126 = 0;
                    v29 = 0;
                    *a4 = (id)objc_msgSend(v100, "initWithDomain:code:userInfo:", v103, 2);
                  }
                  else
                  {
                    v126 = 0;
LABEL_86:
                    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("roomName"));
                    v78 = objc_claimAutoreleasedReturnValue();
                    v120 = (void *)v78;
                    if (!v78 || (v79 = (void *)v78, objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
                    {
                      v122 = 0;
                      goto LABEL_89;
                    }
                    objc_opt_class();
                    if ((objc_opt_isKindOfClass() & 1) != 0)
                    {
                      v122 = v79;
LABEL_89:
                      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("zoneNames"));
                      v80 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(MEMORY[0x1E0C99E38], "null");
                      v81 = (void *)objc_claimAutoreleasedReturnValue();
                      v82 = objc_msgSend(v80, "isEqual:", v81);

                      if (v82)
                      {
                        v135 = self;

                        v80 = 0;
LABEL_94:
                        v131 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v80, "count"));
                        v147 = 0u;
                        v148 = 0u;
                        v149 = 0u;
                        v150 = 0u;
                        obj = v80;
                        v83 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v147, v167, 16);
                        if (!v83)
                          goto LABEL_103;
                        v84 = v83;
                        v85 = *(_QWORD *)v148;
LABEL_96:
                        v86 = v5;
                        v87 = 0;
                        while (1)
                        {
                          if (*(_QWORD *)v148 != v85)
                            objc_enumerationMutation(obj);
                          v88 = *(_QWORD *)(*((_QWORD *)&v147 + 1) + 8 * v87);
                          objc_opt_class();
                          if ((objc_opt_isKindOfClass() & 1) != 0)
                            break;
                          objc_opt_class();
                          if ((objc_opt_isKindOfClass() & 1) == 0)
                          {
                            v91 = a4;
                            if (a4)
                            {
                              v99 = objc_alloc(MEMORY[0x1E0CB35C8]);
                              v93 = *MEMORY[0x1E0D025B8];
                              v163 = *MEMORY[0x1E0CB2D50];
                              v119 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSString"), objc_opt_class(), CFSTR("zoneNames"));
                              v164 = v119;
                              objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v164, &v163, 1);
                              v94 = (void *)objc_claimAutoreleasedReturnValue();
                              v95 = v99;
                              goto LABEL_118;
                            }
                            goto LABEL_122;
                          }
                          objc_msgSend(v131, "addObject:", v88);
                          if (v84 == ++v87)
                          {
                            v84 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v147, v167, 16);
                            v5 = v86;
                            if (v84)
                              goto LABEL_96;
LABEL_103:

                            objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("homeName"));
                            v89 = (id)objc_claimAutoreleasedReturnValue();
                            v119 = v89;
                            if (!v89)
                            {
                              self = v135;
                              v10 = v137;
                              v7 = v138;
                              v23 = v129;
                              goto LABEL_132;
                            }
                            v90 = v89;
                            objc_opt_class();
                            self = v135;
                            v7 = v138;
                            v23 = v129;
                            if ((objc_opt_isKindOfClass() & 1) != 0)
                            {
                              v89 = 0;
                              goto LABEL_131;
                            }
                            objc_opt_class();
                            if ((objc_opt_isKindOfClass() & 1) != 0)
                            {
                              v89 = v90;
LABEL_131:
                              v10 = v137;
LABEL_132:
                              v144 = v89;
                              v66 = v121;
                              self = -[BMHomeKitClientMediaAccessoryControl initWithBase:accessoryUniqueIdentifier:accessoryState:accessoryMediaRouteIdentifier:zoneUniqueIdentifiers:roomUniqueIdentifier:accessoryName:roomName:zoneNames:homeName:](self, "initWithBase:accessoryUniqueIdentifier:accessoryState:accessoryMediaRouteIdentifier:zoneUniqueIdentifiers:roomUniqueIdentifier:accessoryName:roomName:zoneNames:homeName:", v7, v10, v145, v23, v141, v121, v126, v122, v131, v89);
                              v29 = self;
                            }
                            else
                            {
                              if (a4)
                              {
                                v118 = objc_alloc(MEMORY[0x1E0CB35C8]);
                                v114 = *MEMORY[0x1E0D025B8];
                                v161 = *MEMORY[0x1E0CB2D50];
                                v115 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSString"), objc_opt_class(), CFSTR("homeName"));
                                v162 = v115;
                                objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v162, &v161, 1);
                                v116 = (void *)objc_claimAutoreleasedReturnValue();
                                v117 = v114;
                                v23 = v129;
                                *a4 = (id)objc_msgSend(v118, "initWithDomain:code:userInfo:", v117, 2, v116);

                                v7 = v138;
                              }
                              v144 = 0;
                              v29 = 0;
                              v10 = v137;
LABEL_119:
                              v66 = v121;
                            }

                            v104 = v144;
LABEL_134:

LABEL_136:
LABEL_137:

LABEL_138:
LABEL_139:

                            goto LABEL_140;
                          }
                        }
                        v91 = a4;
                        if (a4)
                        {
                          v92 = objc_alloc(MEMORY[0x1E0CB35C8]);
                          v93 = *MEMORY[0x1E0D025B8];
                          v165 = *MEMORY[0x1E0CB2D50];
                          v119 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type null for element of %@, must not be null"), CFSTR("zoneNames"));
                          v166 = v119;
                          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v166, &v165, 1);
                          v94 = (void *)objc_claimAutoreleasedReturnValue();
                          v95 = v92;
LABEL_118:
                          v5 = v86;
                          *v91 = (id)objc_msgSend(v95, "initWithDomain:code:userInfo:", v93, 2, v94);

                          v29 = 0;
                          v23 = v129;
                          v144 = obj;
                          self = v135;
                          v10 = v137;
                          v7 = v138;
                          goto LABEL_119;
                        }
LABEL_122:
                        v29 = 0;
                        v5 = v86;
                        self = v135;
                        v10 = v137;
                        v7 = v138;
                        v104 = obj;
                        v23 = v129;
                      }
                      else
                      {
                        if (!v80 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
                        {
                          v135 = self;
                          goto LABEL_94;
                        }
                        obj = v80;
                        v10 = v137;
                        if (!a4)
                        {
                          v29 = 0;
                          v7 = v138;
                          v66 = v121;
                          goto LABEL_136;
                        }
                        v136 = objc_alloc(MEMORY[0x1E0CB35C8]);
                        v110 = *MEMORY[0x1E0D025B8];
                        v168 = *MEMORY[0x1E0CB2D50];
                        v131 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Expecting %@ as an array"), CFSTR("zoneNames"));
                        v169 = v131;
                        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v169, &v168, 1);
                        v111 = objc_claimAutoreleasedReturnValue();
                        v112 = (id)objc_msgSend(v136, "initWithDomain:code:userInfo:", v110, 2, v111);
                        v29 = 0;
                        *a4 = v112;
                        v104 = (void *)v111;
                        v7 = v138;
                      }
                      v66 = v121;
                      goto LABEL_134;
                    }
                    if (a4)
                    {
                      v105 = objc_alloc(MEMORY[0x1E0CB35C8]);
                      v106 = *MEMORY[0x1E0D025B8];
                      v170 = *MEMORY[0x1E0CB2D50];
                      obj = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSString"), objc_opt_class(), CFSTR("roomName"));
                      v171 = obj;
                      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v171, &v170, 1);
                      v107 = objc_claimAutoreleasedReturnValue();
                      v108 = v106;
                      v23 = v129;
                      v133 = (void *)v107;
                      v109 = (id)objc_msgSend(v105, "initWithDomain:code:userInfo:", v108, 2);
                      v122 = 0;
                      v29 = 0;
                      *a4 = v109;
                      v10 = v137;
                      v7 = v138;
                      v66 = v121;

                      goto LABEL_136;
                    }
                    v122 = 0;
                    v29 = 0;
                  }
                  v10 = v137;
                  v7 = v138;
                  v66 = v121;
                  goto LABEL_137;
                }
                objc_opt_class();
                if ((objc_opt_isKindOfClass() & 1) != 0)
                {
                  v121 = v57;
                  goto LABEL_83;
                }
                v66 = a4;
                if (a4)
                {
                  v132 = objc_alloc(MEMORY[0x1E0CB35C8]);
                  v96 = *MEMORY[0x1E0D025B8];
                  v174 = *MEMORY[0x1E0CB2D50];
                  v126 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSString"), objc_opt_class(), CFSTR("roomUniqueIdentifier"));
                  v175 = v126;
                  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v175, &v174, 1);
                  v97 = objc_claimAutoreleasedReturnValue();
                  v98 = v96;
                  v23 = v129;
                  v124 = (void *)v97;
                  v29 = 0;
                  *a4 = (id)objc_msgSend(v132, "initWithDomain:code:userInfo:", v98, 2);
                  v66 = 0;
                  v10 = v137;
                  v7 = v138;

                  goto LABEL_139;
                }
                v29 = 0;
                v10 = v137;
                v7 = v138;
LABEL_140:

LABEL_141:
LABEL_143:

LABEL_144:
LABEL_145:

                goto LABEL_147;
              }
            }
          }
          goto LABEL_14;
        }
      }
      v40 = a4;
      if (a4)
      {
        v41 = objc_alloc(MEMORY[0x1E0CB35C8]);
        v42 = *MEMORY[0x1E0D025B8];
        v187 = *MEMORY[0x1E0CB2D50];
        v19 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type null for element of %@, must not be null"), CFSTR("accessoryState"));
        v188 = v19;
        v43 = (void *)MEMORY[0x1E0C99D80];
        v44 = &v188;
        v45 = &v187;
LABEL_42:
        objc_msgSend(v43, "dictionaryWithObjects:forKeys:count:", v44, v45, 1);
        v24 = (id)objc_claimAutoreleasedReturnValue();
        v46 = (id)objc_msgSend(v41, "initWithDomain:code:userInfo:", v42, 2, v24);
        v29 = 0;
        *v40 = v46;
LABEL_46:
        v23 = v11;
        v5 = v130;
        self = v134;
        v10 = v137;
        v7 = v138;
        goto LABEL_143;
      }
LABEL_63:
      v29 = 0;
      v23 = v11;
      v5 = v130;
      self = v134;
      v10 = v137;
      v7 = v138;
      goto LABEL_145;
    }
    if (a4)
    {
      v47 = objc_alloc(MEMORY[0x1E0CB35C8]);
      v48 = *MEMORY[0x1E0D025B8];
      v190 = *MEMORY[0x1E0CB2D50];
      v145 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Expecting %@ as an array"), CFSTR("accessoryState"));
      v191 = v145;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v191, &v190, 1);
      v23 = (id)objc_claimAutoreleasedReturnValue();
      v49 = (id)objc_msgSend(v47, "initWithDomain:code:userInfo:", v48, 2, v23);
      v29 = 0;
      *a4 = v49;
      goto LABEL_145;
    }
    v29 = 0;
LABEL_147:

    v6 = v139;
    goto LABEL_148;
  }
  if (a4)
  {
    v30 = objc_alloc(MEMORY[0x1E0CB35C8]);
    v31 = *MEMORY[0x1E0D025B8];
    v194 = *MEMORY[0x1E0CB2D50];
    v32 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSDictionary"), objc_opt_class(), CFSTR("base"));
    v195[0] = v32;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v195, &v194, 1);
    v10 = (id)objc_claimAutoreleasedReturnValue();
    v33 = v30;
    v7 = (BMHomeKitBase *)v32;
    v29 = 0;
    *a4 = (id)objc_msgSend(v33, "initWithDomain:code:userInfo:", v31, 2, v10);
LABEL_149:

    goto LABEL_150;
  }
  v29 = 0;
LABEL_150:

  return v29;
}

- (id)_accessoryStateJSONArray
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v3 = (void *)objc_opt_new();
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  -[BMHomeKitClientMediaAccessoryControl accessoryState](self, "accessoryState", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v12;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v12 != v7)
          objc_enumerationMutation(v4);
        objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * v8), "jsonDictionary");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "addObject:", v9);

        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v6);
  }

  return v3;
}

- (id)_zoneUniqueIdentifiersJSONArray
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
  -[BMHomeKitClientMediaAccessoryControl zoneUniqueIdentifiers](self, "zoneUniqueIdentifiers", 0);
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

- (id)_zoneNamesJSONArray
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
  -[BMHomeKitClientMediaAccessoryControl zoneNames](self, "zoneNames", 0);
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
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  id v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  _QWORD v37[10];
  _QWORD v38[12];

  v38[10] = *MEMORY[0x1E0C80C00];
  -[BMHomeKitClientMediaAccessoryControl base](self, "base");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "jsonDictionary");
  v4 = objc_claimAutoreleasedReturnValue();

  -[BMHomeKitClientMediaAccessoryControl accessoryUniqueIdentifier](self, "accessoryUniqueIdentifier");
  v5 = objc_claimAutoreleasedReturnValue();
  -[BMHomeKitClientMediaAccessoryControl _accessoryStateJSONArray](self, "_accessoryStateJSONArray");
  v6 = objc_claimAutoreleasedReturnValue();
  -[BMHomeKitClientMediaAccessoryControl accessoryMediaRouteIdentifier](self, "accessoryMediaRouteIdentifier");
  v7 = objc_claimAutoreleasedReturnValue();
  -[BMHomeKitClientMediaAccessoryControl _zoneUniqueIdentifiersJSONArray](self, "_zoneUniqueIdentifiersJSONArray");
  v8 = objc_claimAutoreleasedReturnValue();
  -[BMHomeKitClientMediaAccessoryControl roomUniqueIdentifier](self, "roomUniqueIdentifier");
  v9 = objc_claimAutoreleasedReturnValue();
  -[BMHomeKitClientMediaAccessoryControl accessoryName](self, "accessoryName");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMHomeKitClientMediaAccessoryControl roomName](self, "roomName");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMHomeKitClientMediaAccessoryControl _zoneNamesJSONArray](self, "_zoneNamesJSONArray");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMHomeKitClientMediaAccessoryControl homeName](self, "homeName");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v37[0] = CFSTR("base");
  v13 = v4;
  if (!v4)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v13 = objc_claimAutoreleasedReturnValue();
  }
  v30 = (void *)v13;
  v38[0] = v13;
  v37[1] = CFSTR("accessoryUniqueIdentifier");
  v14 = v5;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v14 = objc_claimAutoreleasedReturnValue();
  }
  v29 = (void *)v14;
  v38[1] = v14;
  v37[2] = CFSTR("accessoryState");
  v15 = v6;
  if (!v6)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v15 = objc_claimAutoreleasedReturnValue();
  }
  v35 = (void *)v4;
  v28 = (void *)v15;
  v38[2] = v15;
  v37[3] = CFSTR("accessoryMediaRouteIdentifier");
  v16 = v7;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v16 = objc_claimAutoreleasedReturnValue();
  }
  v34 = (void *)v5;
  v27 = (void *)v16;
  v38[3] = v16;
  v37[4] = CFSTR("zoneUniqueIdentifiers");
  v17 = v8;
  if (!v8)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v17 = objc_claimAutoreleasedReturnValue();
  }
  v33 = (void *)v6;
  v26 = (void *)v17;
  v38[4] = v17;
  v37[5] = CFSTR("roomUniqueIdentifier");
  v18 = (void *)v9;
  if (!v9)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v32 = (void *)v7;
  v38[5] = v18;
  v37[6] = CFSTR("accessoryName");
  v19 = v10;
  if (!v10)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v20 = (void *)v8;
  v38[6] = v19;
  v37[7] = CFSTR("roomName");
  v21 = v36;
  if (!v36)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v22 = (void *)v9;
  v38[7] = v21;
  v37[8] = CFSTR("zoneNames");
  v23 = v11;
  if (!v11)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v38[8] = v23;
  v37[9] = CFSTR("homeName");
  v24 = v12;
  if (!v12)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v38[9] = v24;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v38, v37, 10);
  v31 = (id)objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    if (v11)
      goto LABEL_23;
  }
  else
  {

    if (v11)
      goto LABEL_23;
  }

LABEL_23:
  if (!v36)

  if (!v10)
  if (!v22)

  if (!v20)
  if (!v32)

  if (v33)
  {
    if (v34)
      goto LABEL_35;
LABEL_40:

    if (v35)
      goto LABEL_36;
LABEL_41:

    goto LABEL_36;
  }

  if (!v34)
    goto LABEL_40;
LABEL_35:
  if (!v35)
    goto LABEL_41;
LABEL_36:

  return v31;
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
    -[BMHomeKitClientMediaAccessoryControl base](self, "base");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "base");
    v7 = objc_claimAutoreleasedReturnValue();
    if (v6 == (void *)v7)
    {

    }
    else
    {
      v8 = (void *)v7;
      -[BMHomeKitClientMediaAccessoryControl base](self, "base");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "base");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v9, "isEqual:", v10);

      if (!v11)
        goto LABEL_37;
    }
    -[BMHomeKitClientMediaAccessoryControl accessoryUniqueIdentifier](self, "accessoryUniqueIdentifier");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "accessoryUniqueIdentifier");
    v14 = objc_claimAutoreleasedReturnValue();
    if (v13 == (void *)v14)
    {

    }
    else
    {
      v15 = (void *)v14;
      -[BMHomeKitClientMediaAccessoryControl accessoryUniqueIdentifier](self, "accessoryUniqueIdentifier");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "accessoryUniqueIdentifier");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = objc_msgSend(v16, "isEqual:", v17);

      if (!v18)
        goto LABEL_37;
    }
    -[BMHomeKitClientMediaAccessoryControl accessoryState](self, "accessoryState");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "accessoryState");
    v20 = objc_claimAutoreleasedReturnValue();
    if (v19 == (void *)v20)
    {

    }
    else
    {
      v21 = (void *)v20;
      -[BMHomeKitClientMediaAccessoryControl accessoryState](self, "accessoryState");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "accessoryState");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = objc_msgSend(v22, "isEqual:", v23);

      if (!v24)
        goto LABEL_37;
    }
    -[BMHomeKitClientMediaAccessoryControl accessoryMediaRouteIdentifier](self, "accessoryMediaRouteIdentifier");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "accessoryMediaRouteIdentifier");
    v26 = objc_claimAutoreleasedReturnValue();
    if (v25 == (void *)v26)
    {

    }
    else
    {
      v27 = (void *)v26;
      -[BMHomeKitClientMediaAccessoryControl accessoryMediaRouteIdentifier](self, "accessoryMediaRouteIdentifier");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "accessoryMediaRouteIdentifier");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      v30 = objc_msgSend(v28, "isEqual:", v29);

      if (!v30)
        goto LABEL_37;
    }
    -[BMHomeKitClientMediaAccessoryControl zoneUniqueIdentifiers](self, "zoneUniqueIdentifiers");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "zoneUniqueIdentifiers");
    v32 = objc_claimAutoreleasedReturnValue();
    if (v31 == (void *)v32)
    {

    }
    else
    {
      v33 = (void *)v32;
      -[BMHomeKitClientMediaAccessoryControl zoneUniqueIdentifiers](self, "zoneUniqueIdentifiers");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "zoneUniqueIdentifiers");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      v36 = objc_msgSend(v34, "isEqual:", v35);

      if (!v36)
        goto LABEL_37;
    }
    -[BMHomeKitClientMediaAccessoryControl roomUniqueIdentifier](self, "roomUniqueIdentifier");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "roomUniqueIdentifier");
    v38 = objc_claimAutoreleasedReturnValue();
    if (v37 == (void *)v38)
    {

    }
    else
    {
      v39 = (void *)v38;
      -[BMHomeKitClientMediaAccessoryControl roomUniqueIdentifier](self, "roomUniqueIdentifier");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "roomUniqueIdentifier");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      v42 = objc_msgSend(v40, "isEqual:", v41);

      if (!v42)
        goto LABEL_37;
    }
    -[BMHomeKitClientMediaAccessoryControl accessoryName](self, "accessoryName");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "accessoryName");
    v44 = objc_claimAutoreleasedReturnValue();
    if (v43 == (void *)v44)
    {

    }
    else
    {
      v45 = (void *)v44;
      -[BMHomeKitClientMediaAccessoryControl accessoryName](self, "accessoryName");
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "accessoryName");
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      v48 = objc_msgSend(v46, "isEqual:", v47);

      if (!v48)
        goto LABEL_37;
    }
    -[BMHomeKitClientMediaAccessoryControl roomName](self, "roomName");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "roomName");
    v50 = objc_claimAutoreleasedReturnValue();
    if (v49 == (void *)v50)
    {

    }
    else
    {
      v51 = (void *)v50;
      -[BMHomeKitClientMediaAccessoryControl roomName](self, "roomName");
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "roomName");
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      v54 = objc_msgSend(v52, "isEqual:", v53);

      if (!v54)
        goto LABEL_37;
    }
    -[BMHomeKitClientMediaAccessoryControl zoneNames](self, "zoneNames");
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "zoneNames");
    v56 = objc_claimAutoreleasedReturnValue();
    if (v55 == (void *)v56)
    {

    }
    else
    {
      v57 = (void *)v56;
      -[BMHomeKitClientMediaAccessoryControl zoneNames](self, "zoneNames");
      v58 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "zoneNames");
      v59 = (void *)objc_claimAutoreleasedReturnValue();
      v60 = objc_msgSend(v58, "isEqual:", v59);

      if (!v60)
      {
LABEL_37:
        v12 = 0;
LABEL_38:

        goto LABEL_39;
      }
    }
    -[BMHomeKitClientMediaAccessoryControl homeName](self, "homeName");
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "homeName");
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    if (v62 == v63)
    {
      v12 = 1;
    }
    else
    {
      -[BMHomeKitClientMediaAccessoryControl homeName](self, "homeName");
      v64 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "homeName");
      v65 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v64, "isEqual:", v65);

    }
    goto LABEL_38;
  }
  v12 = 0;
LABEL_39:

  return v12;
}

- (unsigned)dataVersion
{
  return self->_dataVersion;
}

- (BMHomeKitBase)base
{
  return self->_base;
}

- (NSString)accessoryUniqueIdentifier
{
  return self->_accessoryUniqueIdentifier;
}

- (NSArray)accessoryState
{
  return self->_accessoryState;
}

- (NSString)accessoryMediaRouteIdentifier
{
  return self->_accessoryMediaRouteIdentifier;
}

- (NSArray)zoneUniqueIdentifiers
{
  return self->_zoneUniqueIdentifiers;
}

- (NSString)roomUniqueIdentifier
{
  return self->_roomUniqueIdentifier;
}

- (NSString)accessoryName
{
  return self->_accessoryName;
}

- (NSString)roomName
{
  return self->_roomName;
}

- (NSArray)zoneNames
{
  return self->_zoneNames;
}

- (NSString)homeName
{
  return self->_homeName;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_homeName, 0);
  objc_storeStrong((id *)&self->_zoneNames, 0);
  objc_storeStrong((id *)&self->_roomName, 0);
  objc_storeStrong((id *)&self->_accessoryName, 0);
  objc_storeStrong((id *)&self->_roomUniqueIdentifier, 0);
  objc_storeStrong((id *)&self->_zoneUniqueIdentifiers, 0);
  objc_storeStrong((id *)&self->_accessoryMediaRouteIdentifier, 0);
  objc_storeStrong((id *)&self->_accessoryState, 0);
  objc_storeStrong((id *)&self->_accessoryUniqueIdentifier, 0);
  objc_storeStrong((id *)&self->_base, 0);
}

+ (unsigned)latestDataVersion
{
  return 1;
}

+ (id)eventWithData:(id)a3 dataVersion:(unsigned int)a4
{
  id v5;
  __objc2_class **v6;
  void *v7;
  _DWORD *v8;

  v5 = a3;
  if (a4 == 1)
  {
    v6 = off_1E5E4AB48;
  }
  else
  {
    if (a4)
    {
      v8 = 0;
      goto LABEL_7;
    }
    v6 = off_1E5E4AB50;
  }
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D82B90]), "initWithData:", v5);
  v8 = (_DWORD *)objc_msgSend(objc_alloc(*v6), "initByReadFrom:", v7);
  v8[4] = a4;

LABEL_7:
  return v8;
}

+ (id)validKeyPaths
{
  return &unk_1E5F1C270;
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
  _QWORD v14[11];

  v14[10] = *MEMORY[0x1E0C80C00];
  v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("base"), 1, 14, objc_opt_class());
  v14[0] = v13;
  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("accessoryUniqueIdentifier"), 2, 13, 0);
  v14[1] = v2;
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("accessoryState"), 3, 14, objc_opt_class());
  v14[2] = v3;
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("accessoryMediaRouteIdentifier"), 4, 13, 0);
  v14[3] = v4;
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("zoneUniqueIdentifiers"), 5, 13, 0);
  v14[4] = v5;
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("roomUniqueIdentifier"), 6, 13, 0);
  v14[5] = v6;
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("accessoryName"), 7, 13, 0);
  v14[6] = v7;
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("roomName"), 8, 13, 0);
  v14[7] = v8;
  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("zoneNames"), 9, 13, 0);
  v14[8] = v9;
  v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("homeName"), 10, 13, 0);
  v14[9] = v10;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v14, 10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

id __47__BMHomeKitClientMediaAccessoryControl_columns__block_invoke_4(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  void *v4;

  objc_msgSend(a2, "eventBodyKeepingBackingData:", 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_zoneNamesJSONArray");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  BMConvertObjectToJSONString();
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

id __47__BMHomeKitClientMediaAccessoryControl_columns__block_invoke_3(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  void *v4;

  objc_msgSend(a2, "eventBodyKeepingBackingData:", 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_zoneUniqueIdentifiersJSONArray");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  BMConvertObjectToJSONString();
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

id __47__BMHomeKitClientMediaAccessoryControl_columns__block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  void *v4;

  objc_msgSend(a2, "eventBodyKeepingBackingData:", 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_accessoryStateJSONArray");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  BMConvertObjectToJSONString();
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

id __47__BMHomeKitClientMediaAccessoryControl_columns__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(a2, "eventBodyKeepingBackingData:", 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "base");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "jsonDictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  BMConvertObjectToJSONString();
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

@end
