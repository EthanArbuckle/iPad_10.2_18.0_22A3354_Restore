@implementation BMHomeKitClientAccessoryControl

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
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  _QWORD v19[17];

  v19[15] = *MEMORY[0x1E0C80C00];
  v18 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02710]), "initWithName:dataType:requestOnly:extractBlock:", CFSTR("base_json"), 5, 1, &__block_literal_global_61106);
  v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("accessoryUniqueIdentifier"), 2, 0, 2, 13, 0);
  v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02710]), "initWithName:dataType:requestOnly:extractBlock:", CFSTR("accessoryState_json"), 5, 1, &__block_literal_global_61_61108);
  v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("serviceUniqueIdentifier"), 2, 0, 4, 13, 0);
  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("serviceType"), 2, 0, 5, 13, 0);
  v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("characteristicType"), 2, 0, 6, 13, 0);
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("serviceGroupUniqueIdentifier"), 2, 0, 7, 13, 0);
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02710]), "initWithName:dataType:requestOnly:extractBlock:", CFSTR("zoneUniqueIdentifiers_json"), 5, 1, &__block_literal_global_62_61109);
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("roomUniqueIdentifier"), 2, 0, 9, 13, 0);
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("accessoryName"), 2, 0, 10, 13, 0);
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("serviceName"), 2, 0, 11, 13, 0);
  v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("roomName"), 2, 0, 12, 13, 0);
  v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("serviceGroupName"), 2, 0, 13, 13, 0);
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02710]), "initWithName:dataType:requestOnly:extractBlock:", CFSTR("zoneNames_json"), 5, 1, &__block_literal_global_63_61110);
  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("homeName"), 2, 0, 15, 13, 0);
  v19[0] = v18;
  v19[1] = v17;
  v19[2] = v16;
  v19[3] = v15;
  v19[4] = v2;
  v19[5] = v13;
  v19[6] = v3;
  v19[7] = v4;
  v19[8] = v5;
  v19[9] = v6;
  v19[10] = v7;
  v19[11] = v14;
  v19[12] = v12;
  v19[13] = v8;
  v19[14] = v9;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v19, 15);
  v11 = (id)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (BMHomeKitClientAccessoryControl)initWithBase:(id)a3 accessoryUniqueIdentifier:(id)a4 accessoryState:(id)a5 serviceUniqueIdentifier:(id)a6 serviceType:(id)a7 characteristicType:(id)a8 serviceGroupUniqueIdentifier:(id)a9 zoneUniqueIdentifiers:(id)a10 roomUniqueIdentifier:(id)a11 accessoryName:(id)a12 serviceName:(id)a13 roomName:(id)a14 serviceGroupName:(id)a15 zoneNames:(id)a16 homeName:(id)a17
{
  id v22;
  id v23;
  id v24;
  id v25;
  id v26;
  BMHomeKitClientAccessoryControl *v27;
  id v30;
  id v31;
  id v33;
  id v34;
  id v35;
  id v36;
  id v37;
  id v38;
  id v39;
  id v40;
  id v41;
  id v42;
  objc_super v43;

  v42 = a3;
  v41 = a4;
  v40 = a5;
  v30 = a6;
  v39 = a6;
  v31 = a7;
  v38 = a7;
  v37 = a8;
  v36 = a9;
  v35 = a10;
  v34 = a11;
  v33 = a12;
  v22 = a13;
  v23 = a14;
  v24 = a15;
  v25 = a16;
  v26 = a17;
  v43.receiver = self;
  v43.super_class = (Class)BMHomeKitClientAccessoryControl;
  v27 = -[BMEventBase init](&v43, sel_init);
  if (v27)
  {
    v27->_dataVersion = objc_msgSend((id)objc_opt_class(), "latestDataVersion");
    objc_storeStrong((id *)&v27->_base, a3);
    objc_storeStrong((id *)&v27->_accessoryUniqueIdentifier, a4);
    objc_storeStrong((id *)&v27->_accessoryState, a5);
    objc_storeStrong((id *)&v27->_serviceUniqueIdentifier, v30);
    objc_storeStrong((id *)&v27->_serviceType, v31);
    objc_storeStrong((id *)&v27->_characteristicType, a8);
    objc_storeStrong((id *)&v27->_serviceGroupUniqueIdentifier, a9);
    objc_storeStrong((id *)&v27->_zoneUniqueIdentifiers, a10);
    objc_storeStrong((id *)&v27->_roomUniqueIdentifier, a11);
    objc_storeStrong((id *)&v27->_accessoryName, a12);
    objc_storeStrong((id *)&v27->_serviceName, a13);
    objc_storeStrong((id *)&v27->_roomName, a14);
    objc_storeStrong((id *)&v27->_serviceGroupName, a15);
    objc_storeStrong((id *)&v27->_zoneNames, a16);
    objc_storeStrong((id *)&v27->_homeName, a17);
  }

  return v27;
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
  void *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;

  v15 = objc_alloc(MEMORY[0x1E0CB3940]);
  -[BMHomeKitClientAccessoryControl base](self, "base");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMHomeKitClientAccessoryControl accessoryUniqueIdentifier](self, "accessoryUniqueIdentifier");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMHomeKitClientAccessoryControl accessoryState](self, "accessoryState");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMHomeKitClientAccessoryControl serviceUniqueIdentifier](self, "serviceUniqueIdentifier");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMHomeKitClientAccessoryControl serviceType](self, "serviceType");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMHomeKitClientAccessoryControl characteristicType](self, "characteristicType");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMHomeKitClientAccessoryControl serviceGroupUniqueIdentifier](self, "serviceGroupUniqueIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMHomeKitClientAccessoryControl zoneUniqueIdentifiers](self, "zoneUniqueIdentifiers");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMHomeKitClientAccessoryControl roomUniqueIdentifier](self, "roomUniqueIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMHomeKitClientAccessoryControl accessoryName](self, "accessoryName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMHomeKitClientAccessoryControl serviceName](self, "serviceName");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMHomeKitClientAccessoryControl roomName](self, "roomName");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMHomeKitClientAccessoryControl serviceGroupName](self, "serviceGroupName");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMHomeKitClientAccessoryControl zoneNames](self, "zoneNames");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMHomeKitClientAccessoryControl homeName](self, "homeName");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = (void *)objc_msgSend(v15, "initWithFormat:", CFSTR("BMHomeKitClientAccessoryControl with base: %@, accessoryUniqueIdentifier: %@, accessoryState: %@, serviceUniqueIdentifier: %@, serviceType: %@, characteristicType: %@, serviceGroupUniqueIdentifier: %@, zoneUniqueIdentifiers: %@, roomUniqueIdentifier: %@, accessoryName: %@, serviceName: %@, roomName: %@, serviceGroupName: %@, zoneNames: %@, homeName: %@"), v14, v13, v20, v19, v18, v17, v3, v4, v5, v6, v12, v7, v8, v9, v10);

  return (NSString *)v16;
}

- (id)initByReadFrom:(id)a3
{
  _BYTE *v4;
  BMHomeKitClientAccessoryControl *v5;
  void *v6;
  void *v7;
  int *v8;
  int *v9;
  int *v10;
  int *v11;
  char v12;
  unsigned int v13;
  unint64_t v14;
  uint64_t v15;
  unint64_t v16;
  char v17;
  int v19;
  objc_class *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  void *v27;
  void *v28;
  uint64_t v29;
  void *v30;
  uint64_t v31;
  NSArray *zoneUniqueIdentifiers;
  uint64_t v33;
  NSArray *zoneNames;
  int v35;
  BMHomeKitClientAccessoryControl *v36;
  objc_super v38;
  uint64_t v39;
  uint64_t v40;

  v4 = a3;
  v38.receiver = self;
  v38.super_class = (Class)BMHomeKitClientAccessoryControl;
  v5 = -[BMEventBase init](&v38, sel_init);
  if (!v5)
  {
LABEL_49:
    v36 = v5;
    goto LABEL_50;
  }
  v6 = (void *)objc_opt_new();
  v7 = (void *)objc_opt_new();
  v8 = (int *)MEMORY[0x1E0D82BF0];
  v9 = (int *)MEMORY[0x1E0D82BD8];
  v10 = (int *)MEMORY[0x1E0D82BC8];
  if (*(_QWORD *)&v4[*MEMORY[0x1E0D82BF0]] >= *(_QWORD *)&v4[*MEMORY[0x1E0D82BD8]])
  {
LABEL_47:
    v31 = objc_msgSend(v6, "copy");
    zoneUniqueIdentifiers = v5->_zoneUniqueIdentifiers;
    v5->_zoneUniqueIdentifiers = (NSArray *)v31;

    v33 = objc_msgSend(v7, "copy");
    zoneNames = v5->_zoneNames;
    v5->_zoneNames = (NSArray *)v33;

    v35 = v4[*v10];
    if (v35)
      goto LABEL_48;
    goto LABEL_49;
  }
  v11 = (int *)MEMORY[0x1E0D82BB8];
  while (2)
  {
    if (v4[*v10])
      goto LABEL_47;
    v12 = 0;
    v13 = 0;
    v14 = 0;
    while (1)
    {
      v15 = *v8;
      v16 = *(_QWORD *)&v4[v15];
      if (v16 == -1 || v16 >= *(_QWORD *)&v4[*v9])
        break;
      v17 = *(_BYTE *)(*(_QWORD *)&v4[*v11] + v16);
      *(_QWORD *)&v4[v15] = v16 + 1;
      v14 |= (unint64_t)(v17 & 0x7F) << v12;
      if ((v17 & 0x80) == 0)
        goto LABEL_13;
      v12 += 7;
      if (v13++ >= 9)
      {
        v14 = 0;
        v19 = v4[*v10];
        goto LABEL_15;
      }
    }
    v4[*v10] = 1;
LABEL_13:
    v19 = v4[*v10];
    if (v4[*v10])
      v14 = 0;
LABEL_15:
    if (v19 || (v14 & 7) == 4)
      goto LABEL_47;
    switch((v14 >> 3))
    {
      case 1u:
        v39 = 0;
        v40 = 0;
        if ((PBReaderPlaceMark() & 1) == 0)
          goto LABEL_51;
        v21 = -[BMHomeKitBase initByReadFrom:]([BMHomeKitBase alloc], "initByReadFrom:", v4);
        if (!v21)
          goto LABEL_51;
        v22 = 24;
        goto LABEL_29;
      case 2u:
        PBReaderReadString();
        v23 = objc_claimAutoreleasedReturnValue();
        v24 = 32;
        goto LABEL_45;
      case 3u:
        v39 = 0;
        v40 = 0;
        if ((PBReaderPlaceMark() & 1) == 0)
          goto LABEL_51;
        v21 = -[BMHomeKitAccessoryState initByReadFrom:]([BMHomeKitAccessoryState alloc], "initByReadFrom:", v4);
        if (!v21)
          goto LABEL_51;
        v22 = 40;
LABEL_29:
        v25 = *(Class *)((char *)&v5->super.super.isa + v22);
        *(Class *)((char *)&v5->super.super.isa + v22) = v21;

        PBReaderRecallMark();
        goto LABEL_46;
      case 4u:
        PBReaderReadString();
        v23 = objc_claimAutoreleasedReturnValue();
        v24 = 48;
        goto LABEL_45;
      case 5u:
        PBReaderReadString();
        v23 = objc_claimAutoreleasedReturnValue();
        v24 = 56;
        goto LABEL_45;
      case 6u:
        PBReaderReadString();
        v23 = objc_claimAutoreleasedReturnValue();
        v24 = 64;
        goto LABEL_45;
      case 7u:
        PBReaderReadString();
        v23 = objc_claimAutoreleasedReturnValue();
        v24 = 72;
        goto LABEL_45;
      case 8u:
        PBReaderReadString();
        v26 = objc_claimAutoreleasedReturnValue();
        if (!v26)
          goto LABEL_51;
        v27 = (void *)v26;
        v28 = v6;
        goto LABEL_43;
      case 9u:
        PBReaderReadString();
        v23 = objc_claimAutoreleasedReturnValue();
        v24 = 88;
        goto LABEL_45;
      case 0xAu:
        PBReaderReadString();
        v23 = objc_claimAutoreleasedReturnValue();
        v24 = 96;
        goto LABEL_45;
      case 0xBu:
        PBReaderReadString();
        v23 = objc_claimAutoreleasedReturnValue();
        v24 = 104;
        goto LABEL_45;
      case 0xCu:
        PBReaderReadString();
        v23 = objc_claimAutoreleasedReturnValue();
        v24 = 112;
        goto LABEL_45;
      case 0xDu:
        PBReaderReadString();
        v23 = objc_claimAutoreleasedReturnValue();
        v24 = 120;
        goto LABEL_45;
      case 0xEu:
        PBReaderReadString();
        v29 = objc_claimAutoreleasedReturnValue();
        if (!v29)
          goto LABEL_51;
        v27 = (void *)v29;
        v28 = v7;
LABEL_43:
        objc_msgSend(v28, "addObject:", v27);

        goto LABEL_46;
      case 0xFu:
        PBReaderReadString();
        v23 = objc_claimAutoreleasedReturnValue();
        v24 = 136;
LABEL_45:
        v30 = *(Class *)((char *)&v5->super.super.isa + v24);
        *(Class *)((char *)&v5->super.super.isa + v24) = (Class)v23;

        goto LABEL_46;
      default:
        if (PBReaderSkipValueWithTag())
        {
LABEL_46:
          if (*(_QWORD *)&v4[*v8] >= *(_QWORD *)&v4[*v9])
            goto LABEL_47;
          continue;
        }
LABEL_51:

LABEL_48:
        v36 = 0;
LABEL_50:

        return v36;
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
  NSArray *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  uint64_t v23;
  _BYTE v24[128];
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (self->_base)
  {
    v23 = 0;
    PBDataWriterPlaceMark();
    -[BMHomeKitBase writeTo:](self->_base, "writeTo:", v4);
    PBDataWriterRecallMark();
  }
  if (self->_accessoryUniqueIdentifier)
    PBDataWriterWriteStringField();
  if (self->_accessoryState)
  {
    v23 = 0;
    PBDataWriterPlaceMark();
    -[BMHomeKitAccessoryState writeTo:](self->_accessoryState, "writeTo:", v4);
    PBDataWriterRecallMark();
  }
  if (self->_serviceUniqueIdentifier)
    PBDataWriterWriteStringField();
  if (self->_serviceType)
    PBDataWriterWriteStringField();
  if (self->_characteristicType)
    PBDataWriterWriteStringField();
  if (self->_serviceGroupUniqueIdentifier)
    PBDataWriterWriteStringField();
  v21 = 0u;
  v22 = 0u;
  v19 = 0u;
  v20 = 0u;
  v5 = self->_zoneUniqueIdentifiers;
  v6 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v19, v25, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v20;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v20 != v8)
          objc_enumerationMutation(v5);
        PBDataWriterWriteStringField();
        ++v9;
      }
      while (v7 != v9);
      v7 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v19, v25, 16);
    }
    while (v7);
  }

  if (self->_roomUniqueIdentifier)
    PBDataWriterWriteStringField();
  if (self->_accessoryName)
    PBDataWriterWriteStringField();
  if (self->_serviceName)
    PBDataWriterWriteStringField();
  if (self->_roomName)
    PBDataWriterWriteStringField();
  if (self->_serviceGroupName)
    PBDataWriterWriteStringField();
  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  v10 = self->_zoneNames;
  v11 = -[NSArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v15, v24, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v16;
    do
    {
      v14 = 0;
      do
      {
        if (*(_QWORD *)v16 != v13)
          objc_enumerationMutation(v10);
        PBDataWriterWriteStringField();
        ++v14;
      }
      while (v12 != v14);
      v12 = -[NSArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v15, v24, 16);
    }
    while (v12);
  }

  if (self->_homeName)
    PBDataWriterWriteStringField();

}

- (id)serialize
{
  void *v3;
  void *v4;

  v3 = (void *)objc_opt_new();
  -[BMHomeKitClientAccessoryControl writeTo:](self, "writeTo:", v3);
  objc_msgSend(v3, "immutableData");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (BMHomeKitClientAccessoryControl)initWithJSONDictionary:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  BMHomeKitBase *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  id v14;
  id v15;
  void *v16;
  void *v17;
  id v18;
  BMHomeKitAccessoryState *v19;
  id v20;
  void *v21;
  id v22;
  BMHomeKitClientAccessoryControl *v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  id v28;
  id *v29;
  void *v30;
  id v31;
  id *v32;
  BMHomeKitBase *v33;
  uint64_t v34;
  BMHomeKitClientAccessoryControl *v35;
  id v36;
  void *v37;
  void *v38;
  void *v39;
  uint64_t v40;
  id v41;
  uint64_t v42;
  BMHomeKitClientAccessoryControl *v43;
  uint64_t v44;
  void *v45;
  void *v46;
  uint64_t v47;
  id v48;
  void *v49;
  int v50;
  void *v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t i;
  uint64_t v56;
  uint64_t v57;
  void *v58;
  id v59;
  BMHomeKitBase *v60;
  uint64_t v61;
  id *v62;
  uint64_t v63;
  uint64_t v64;
  void *v65;
  uint64_t v66;
  void *v67;
  void *v68;
  id v69;
  uint64_t v70;
  uint64_t v71;
  void *v72;
  uint64_t v73;
  id v74;
  BMHomeKitBase *v75;
  uint64_t v76;
  id *v77;
  uint64_t v78;
  void *v79;
  uint64_t v80;
  id v81;
  uint64_t v82;
  id v83;
  BMHomeKitBase *v84;
  uint64_t v85;
  id *v86;
  uint64_t v87;
  void *v88;
  uint64_t v89;
  void *v90;
  BMHomeKitBase *v91;
  id v92;
  uint64_t v93;
  void *v94;
  id v95;
  id v96;
  uint64_t v97;
  uint64_t v98;
  uint64_t v99;
  id v100;
  id *v101;
  uint64_t v102;
  void *v103;
  uint64_t v104;
  void *v105;
  uint64_t v106;
  void *v107;
  uint64_t v108;
  void *v109;
  void *v110;
  void *v111;
  int v112;
  void *v113;
  uint64_t v114;
  uint64_t v115;
  uint64_t v116;
  uint64_t v117;
  uint64_t v118;
  uint64_t v119;
  void *v120;
  id v121;
  uint64_t v122;
  uint64_t v123;
  uint64_t v124;
  id v125;
  id v126;
  uint64_t v127;
  uint64_t v128;
  uint64_t v129;
  id *v130;
  id v131;
  uint64_t v132;
  void *v133;
  void **v134;
  uint64_t *v135;
  id v136;
  uint64_t v137;
  uint64_t v138;
  uint64_t v139;
  void *v140;
  id v141;
  uint64_t v142;
  uint64_t v143;
  uint64_t v144;
  void *v145;
  id v146;
  uint64_t v147;
  uint64_t v148;
  void *v149;
  uint64_t v150;
  id v151;
  uint64_t v152;
  uint64_t v153;
  id v154;
  BMHomeKitClientAccessoryControl *v155;
  id v157;
  uint64_t v158;
  void *v159;
  void *v160;
  void *v161;
  uint64_t v162;
  uint64_t v163;
  void *v164;
  void *v165;
  id v166;
  void *v167;
  id v168;
  void *v169;
  id v170;
  void *v171;
  void *v172;
  id v173;
  id obj;
  void *v175;
  id v176;
  void *v177;
  id v178;
  id v179;
  void *v180;
  BMHomeKitBase *v181;
  BMHomeKitBase *v182;
  void *v183;
  id v184;
  id *v185;
  id v186;
  id v187;
  void *v188;
  id v189;
  void *v190;
  BMHomeKitClientAccessoryControl *v191;
  void *v192;
  void *v193;
  uint64_t v194;
  void *v195;
  id v196;
  __int128 v197;
  __int128 v198;
  __int128 v199;
  __int128 v200;
  __int128 v201;
  __int128 v202;
  __int128 v203;
  __int128 v204;
  id v205;
  id v206;
  uint64_t v207;
  void *v208;
  uint64_t v209;
  void *v210;
  uint64_t v211;
  void *v212;
  _BYTE v213[128];
  uint64_t v214;
  void *v215;
  uint64_t v216;
  id v217;
  uint64_t v218;
  id v219;
  uint64_t v220;
  id v221;
  uint64_t v222;
  id v223;
  uint64_t v224;
  id v225;
  uint64_t v226;
  void *v227;
  uint64_t v228;
  void *v229;
  _BYTE v230[128];
  uint64_t v231;
  void *v232;
  uint64_t v233;
  id v234;
  uint64_t v235;
  id v236;
  uint64_t v237;
  id v238;
  uint64_t v239;
  uint64_t v240;
  uint64_t v241;
  uint64_t v242;
  uint64_t v243;
  id v244;
  uint64_t v245;
  _QWORD v246[3];

  v246[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("base"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v8 = 0;
    goto LABEL_4;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v206 = 0;
    v196 = v7;
    v8 = -[BMHomeKitBase initWithJSONDictionary:error:]([BMHomeKitBase alloc], "initWithJSONDictionary:error:", v196, &v206);
    v15 = v206;
    if (v15)
    {
      v16 = v15;
      if (a4)
        *a4 = objc_retainAutorelease(v15);

      a4 = 0;
      goto LABEL_178;
    }

LABEL_4:
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("accessoryUniqueIdentifier"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if (a4)
        {
          v30 = v9;
          v31 = objc_alloc(MEMORY[0x1E0CB35C8]);
          v32 = a4;
          v33 = v8;
          v34 = *MEMORY[0x1E0D025B8];
          v243 = *MEMORY[0x1E0CB2D50];
          v35 = self;
          v36 = objc_alloc(MEMORY[0x1E0CB3940]);
          v163 = objc_opt_class();
          v37 = v36;
          self = v35;
          v18 = (id)objc_msgSend(v37, "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSString"), v163, CFSTR("accessoryUniqueIdentifier"));
          v244 = v18;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v244, &v243, 1);
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          v39 = v31;
          v9 = v30;
          v40 = v34;
          v8 = v33;
          v196 = 0;
          a4 = 0;
          *v32 = (id)objc_msgSend(v39, "initWithDomain:code:userInfo:", v40, 2, v38);
          goto LABEL_175;
        }
        v196 = 0;
LABEL_177:

        goto LABEL_178;
      }
      v196 = v9;
    }
    else
    {
      v196 = 0;
    }
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("accessoryState"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v10 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      v194 = 0;
      goto LABEL_10;
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v17 = v9;
      v18 = v10;
      v19 = [BMHomeKitAccessoryState alloc];
      v205 = 0;
      v194 = -[BMHomeKitAccessoryState initWithJSONDictionary:error:](v19, "initWithJSONDictionary:error:", v18, &v205);
      v20 = v205;
      if (v20)
      {
        v21 = v20;
        if (a4)
          *a4 = objc_retainAutorelease(v20);

        a4 = 0;
        v9 = v17;
        goto LABEL_174;
      }

LABEL_10:
      objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("serviceUniqueIdentifier"));
      v195 = (void *)objc_claimAutoreleasedReturnValue();
      v191 = self;
      v192 = v9;
      if (v195 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          if (a4)
          {
            v59 = objc_alloc(MEMORY[0x1E0CB35C8]);
            v60 = v8;
            v61 = *MEMORY[0x1E0D025B8];
            v239 = *MEMORY[0x1E0CB2D50];
            v62 = a4;
            v63 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSString"), objc_opt_class(), CFSTR("serviceUniqueIdentifier"));
            v240 = v63;
            objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v240, &v239, 1);
            v64 = objc_claimAutoreleasedReturnValue();
            v65 = v59;
            v9 = v192;
            v66 = v61;
            v8 = v60;
            v67 = 0;
            a4 = 0;
            *v62 = (id)objc_msgSend(v65, "initWithDomain:code:userInfo:", v66, 2, v64);
            v11 = (void *)v64;
            v68 = (void *)v63;
            goto LABEL_172;
          }
          v67 = 0;
          goto LABEL_173;
        }
        v189 = v195;
      }
      else
      {
        v189 = 0;
      }
      objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("serviceType"));
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v190 = v11;
      if (v11 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          if (a4)
          {
            v74 = objc_alloc(MEMORY[0x1E0CB35C8]);
            v75 = v8;
            v76 = *MEMORY[0x1E0D025B8];
            v237 = *MEMORY[0x1E0CB2D50];
            v77 = a4;
            v187 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSString"), objc_opt_class(), CFSTR("serviceType"));
            v238 = v187;
            objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v238, &v237, 1);
            v78 = objc_claimAutoreleasedReturnValue();
            v79 = v74;
            v9 = v192;
            v80 = v76;
            v8 = v75;
            v188 = (void *)v78;
            v68 = 0;
            a4 = 0;
            *v77 = (id)objc_msgSend(v79, "initWithDomain:code:userInfo:", v80, 2);
            v67 = v189;
            goto LABEL_171;
          }
          v68 = 0;
          v67 = v189;
          goto LABEL_172;
        }
        v184 = v11;
      }
      else
      {
        v184 = 0;
      }
      objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("characteristicType"));
      v12 = objc_claimAutoreleasedReturnValue();
      v188 = (void *)v12;
      if (v12 && (v13 = (void *)v12, objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          if (!a4)
          {
            v187 = 0;
            v67 = v189;
            v68 = v184;
            goto LABEL_171;
          }
          v83 = objc_alloc(MEMORY[0x1E0CB35C8]);
          v84 = v8;
          v85 = *MEMORY[0x1E0D025B8];
          v235 = *MEMORY[0x1E0CB2D50];
          v86 = a4;
          v14 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSString"), objc_opt_class(), CFSTR("characteristicType"));
          v236 = v14;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v236, &v235, 1);
          v87 = objc_claimAutoreleasedReturnValue();
          v88 = v83;
          v9 = v192;
          v89 = v85;
          v8 = v84;
          v183 = (void *)v87;
          v187 = 0;
          a4 = 0;
          *v86 = (id)objc_msgSend(v88, "initWithDomain:code:userInfo:", v89, 2);
          goto LABEL_110;
        }
        v187 = v13;
      }
      else
      {
        v187 = 0;
      }
      objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("serviceGroupUniqueIdentifier"));
      v14 = (id)objc_claimAutoreleasedReturnValue();
      v185 = a4;
      v183 = v14;
      if (!v14)
      {
        v181 = v8;
        goto LABEL_49;
      }
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v181 = v8;
        v14 = 0;
LABEL_49:
        objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("zoneUniqueIdentifiers"));
        v48 = (id)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0C99E38], "null");
        v49 = (void *)objc_claimAutoreleasedReturnValue();
        v50 = objc_msgSend(v48, "isEqual:", v49);

        v180 = v10;
        if (v50)
        {

          v48 = 0;
        }
        else if (v48)
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {
            if (a4)
            {
              v96 = objc_alloc(MEMORY[0x1E0CB35C8]);
              v97 = *MEMORY[0x1E0D025B8];
              v231 = *MEMORY[0x1E0CB2D50];
              v51 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Expecting %@ as an array"), CFSTR("zoneUniqueIdentifiers"));
              v232 = v51;
              objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v232, &v231, 1);
              v98 = objc_claimAutoreleasedReturnValue();
              v99 = v97;
              v10 = v180;
              v100 = (id)objc_msgSend(v96, "initWithDomain:code:userInfo:", v99, 2, v98);
              v101 = a4;
              a4 = 0;
              *v101 = v100;
              v90 = (void *)v98;
              v8 = v181;
              v67 = v189;
              goto LABEL_167;
            }
            v8 = v181;
            v67 = v189;
            goto LABEL_169;
          }
        }
        v51 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v48, "count"));
        v201 = 0u;
        v202 = 0u;
        v203 = 0u;
        v204 = 0u;
        v48 = v48;
        v52 = objc_msgSend(v48, "countByEnumeratingWithState:objects:count:", &v201, v230, 16);
        if (!v52)
          goto LABEL_62;
        v53 = v52;
        v54 = *(_QWORD *)v202;
        while (1)
        {
          for (i = 0; i != v53; ++i)
          {
            if (*(_QWORD *)v202 != v54)
              objc_enumerationMutation(v48);
            v56 = *(_QWORD *)(*((_QWORD *)&v201 + 1) + 8 * i);
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              if (v185)
              {
                v69 = objc_alloc(MEMORY[0x1E0CB35C8]);
                v70 = *MEMORY[0x1E0D025B8];
                v228 = *MEMORY[0x1E0CB2D50];
                v177 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type null for element of %@, must not be null"), CFSTR("zoneUniqueIdentifiers"));
                v229 = v177;
                objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v229, &v228, 1);
                v71 = objc_claimAutoreleasedReturnValue();
                v72 = v69;
                v73 = v70;
LABEL_73:
                v175 = (void *)v71;
                v67 = v189;
                v11 = v190;
                a4 = 0;
                *v185 = (id)objc_msgSend(v72, "initWithDomain:code:userInfo:", v73, 2);
                v178 = v48;
                v10 = v180;
                v8 = v181;

                goto LABEL_166;
              }
LABEL_77:
              a4 = 0;
              v90 = v48;
              v10 = v180;
              v8 = v181;
              v67 = v189;
              v11 = v190;
              goto LABEL_167;
            }
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) == 0)
            {
              if (v185)
              {
                v81 = objc_alloc(MEMORY[0x1E0CB35C8]);
                v82 = *MEMORY[0x1E0D025B8];
                v226 = *MEMORY[0x1E0CB2D50];
                v177 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSString"), objc_opt_class(), CFSTR("zoneUniqueIdentifiers"));
                v227 = v177;
                objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v227, &v226, 1);
                v71 = objc_claimAutoreleasedReturnValue();
                v72 = v81;
                v73 = v82;
                goto LABEL_73;
              }
              goto LABEL_77;
            }
            objc_msgSend(v51, "addObject:", v56);
          }
          v53 = objc_msgSend(v48, "countByEnumeratingWithState:objects:count:", &v201, v230, 16);
          if (!v53)
          {
LABEL_62:

            objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("roomUniqueIdentifier"));
            v57 = objc_claimAutoreleasedReturnValue();
            v177 = (void *)v57;
            v173 = v14;
            if (!v57)
            {
              v178 = 0;
              v10 = v180;
              goto LABEL_88;
            }
            v58 = (void *)v57;
            objc_opt_class();
            v10 = v180;
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              v178 = 0;
              goto LABEL_88;
            }
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              v178 = v58;
LABEL_88:
              objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("accessoryName"));
              v102 = objc_claimAutoreleasedReturnValue();
              v171 = (void *)v102;
              if (v102)
              {
                v103 = (void *)v102;
                objc_opt_class();
                if ((objc_opt_isKindOfClass() & 1) != 0)
                {
                  v176 = 0;
                }
                else
                {
                  objc_opt_class();
                  if ((objc_opt_isKindOfClass() & 1) == 0)
                  {
                    if (v185)
                    {
                      v126 = objc_alloc(MEMORY[0x1E0CB35C8]);
                      v127 = *MEMORY[0x1E0D025B8];
                      v222 = *MEMORY[0x1E0CB2D50];
                      v170 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSString"), objc_opt_class(), CFSTR("accessoryName"));
                      v223 = v170;
                      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v223, &v222, 1);
                      v128 = objc_claimAutoreleasedReturnValue();
                      v129 = v127;
                      v10 = v180;
                      v169 = (void *)v128;
                      v176 = 0;
                      a4 = 0;
                      *v185 = (id)objc_msgSend(v126, "initWithDomain:code:userInfo:", v129, 2);
                      v8 = v181;
                      v67 = v189;
                      v11 = v190;
                      v14 = v173;
                      goto LABEL_163;
                    }
                    v176 = 0;
                    a4 = 0;
                    v8 = v181;
                    v67 = v189;
                    v11 = v190;
                    v14 = v173;
                    goto LABEL_164;
                  }
                  v176 = v103;
                }
              }
              else
              {
                v176 = 0;
              }
              objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("serviceName"));
              v104 = objc_claimAutoreleasedReturnValue();
              v14 = v173;
              v169 = (void *)v104;
              if (v104 && (v105 = (void *)v104, objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
              {
                objc_opt_class();
                if ((objc_opt_isKindOfClass() & 1) == 0)
                {
                  if (v185)
                  {
                    v136 = objc_alloc(MEMORY[0x1E0CB35C8]);
                    v137 = *MEMORY[0x1E0D025B8];
                    v220 = *MEMORY[0x1E0CB2D50];
                    v168 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSString"), objc_opt_class(), CFSTR("serviceName"));
                    v221 = v168;
                    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v221, &v220, 1);
                    v138 = objc_claimAutoreleasedReturnValue();
                    v139 = v137;
                    v10 = v180;
                    v167 = (void *)v138;
                    v170 = 0;
                    a4 = 0;
                    *v185 = (id)objc_msgSend(v136, "initWithDomain:code:userInfo:", v139, 2);
                    v8 = v181;
                    v67 = v189;
                    v11 = v190;
                    goto LABEL_162;
                  }
                  v170 = 0;
                  a4 = 0;
                  v8 = v181;
                  v67 = v189;
                  v11 = v190;
                  goto LABEL_163;
                }
                v170 = v105;
              }
              else
              {
                v170 = 0;
              }
              objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("roomName"));
              v106 = objc_claimAutoreleasedReturnValue();
              v167 = (void *)v106;
              if (v106 && (v107 = (void *)v106, objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
              {
                objc_opt_class();
                if ((objc_opt_isKindOfClass() & 1) == 0)
                {
                  if (v185)
                  {
                    v141 = objc_alloc(MEMORY[0x1E0CB35C8]);
                    v142 = *MEMORY[0x1E0D025B8];
                    v218 = *MEMORY[0x1E0CB2D50];
                    v166 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSString"), objc_opt_class(), CFSTR("roomName"));
                    v219 = v166;
                    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v219, &v218, 1);
                    v143 = objc_claimAutoreleasedReturnValue();
                    v144 = v142;
                    v10 = v180;
                    v165 = (void *)v143;
                    v168 = 0;
                    a4 = 0;
                    *v185 = (id)objc_msgSend(v141, "initWithDomain:code:userInfo:", v144, 2);
                    v8 = v181;
                    v67 = v189;
                    v11 = v190;
                    v14 = v173;
                    goto LABEL_161;
                  }
                  v168 = 0;
                  a4 = 0;
                  v8 = v181;
                  v67 = v189;
                  v11 = v190;
                  v14 = v173;
                  goto LABEL_162;
                }
                v168 = v107;
              }
              else
              {
                v168 = 0;
              }
              objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("serviceGroupName"));
              v108 = objc_claimAutoreleasedReturnValue();
              v14 = v173;
              v165 = (void *)v108;
              if (v108 && (v109 = (void *)v108, objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
              {
                objc_opt_class();
                if ((objc_opt_isKindOfClass() & 1) == 0)
                {
                  if (v185)
                  {
                    v146 = objc_alloc(MEMORY[0x1E0CB35C8]);
                    v147 = *MEMORY[0x1E0D025B8];
                    v216 = *MEMORY[0x1E0CB2D50];
                    obj = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSString"), objc_opt_class(), CFSTR("serviceGroupName"));
                    v217 = obj;
                    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v217, &v216, 1);
                    v148 = objc_claimAutoreleasedReturnValue();
                    v149 = v146;
                    v150 = v147;
                    v10 = v180;
                    v113 = (void *)v148;
                    v166 = 0;
                    a4 = 0;
                    *v185 = (id)objc_msgSend(v149, "initWithDomain:code:userInfo:", v150, 2);
                    v8 = v181;
                    v67 = v189;
                    v11 = v190;
                    goto LABEL_159;
                  }
                  v166 = 0;
                  a4 = 0;
                  v8 = v181;
                  v67 = v189;
                  v11 = v190;
                  goto LABEL_161;
                }
                v166 = v109;
              }
              else
              {
                v166 = 0;
              }
              objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("zoneNames"));
              v110 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(MEMORY[0x1E0C99E38], "null");
              v111 = (void *)objc_claimAutoreleasedReturnValue();
              v112 = objc_msgSend(v110, "isEqual:", v111);

              if (v112)
              {

                v110 = 0;
LABEL_113:
                v113 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v110, "count"));
                v197 = 0u;
                v198 = 0u;
                v199 = 0u;
                v200 = 0u;
                obj = v110;
                v114 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v197, v213, 16);
                if (!v114)
                  goto LABEL_122;
                v115 = v114;
                v116 = *(_QWORD *)v198;
LABEL_115:
                v117 = 0;
                while (1)
                {
                  if (*(_QWORD *)v198 != v116)
                    objc_enumerationMutation(obj);
                  v118 = *(_QWORD *)(*((_QWORD *)&v197 + 1) + 8 * v117);
                  objc_opt_class();
                  if ((objc_opt_isKindOfClass() & 1) != 0)
                    break;
                  objc_opt_class();
                  if ((objc_opt_isKindOfClass() & 1) == 0)
                  {
                    if (v185)
                    {
                      v131 = objc_alloc(MEMORY[0x1E0CB35C8]);
                      v132 = *MEMORY[0x1E0D025B8];
                      v209 = *MEMORY[0x1E0CB2D50];
                      v130 = v185;
                      v164 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSString"), objc_opt_class(), CFSTR("zoneNames"));
                      v210 = v164;
                      v133 = (void *)MEMORY[0x1E0C99D80];
                      v134 = &v210;
                      v135 = &v209;
                      goto LABEL_140;
                    }
                    goto LABEL_144;
                  }
                  objc_msgSend(v113, "addObject:", v118);
                  if (v115 == ++v117)
                  {
                    v115 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v197, v213, 16);
                    if (v115)
                      goto LABEL_115;
LABEL_122:

                    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("homeName"));
                    v119 = objc_claimAutoreleasedReturnValue();
                    v164 = (void *)v119;
                    if (!v119)
                    {
                      v121 = 0;
                      v11 = v190;
                      v155 = v191;
                      v10 = v180;
                      v8 = v181;
                      v67 = v189;
                      goto LABEL_156;
                    }
                    v120 = (void *)v119;
                    objc_opt_class();
                    v10 = v180;
                    v8 = v181;
                    if ((objc_opt_isKindOfClass() & 1) != 0)
                    {
                      v121 = 0;
                      v67 = v189;
                      goto LABEL_155;
                    }
                    objc_opt_class();
                    v67 = v189;
                    if ((objc_opt_isKindOfClass() & 1) != 0)
                    {
                      v121 = v120;
LABEL_155:
                      v11 = v190;
                      v155 = v191;
LABEL_156:
                      v186 = v121;
                      a4 = objc_retain(-[BMHomeKitClientAccessoryControl initWithBase:accessoryUniqueIdentifier:accessoryState:serviceUniqueIdentifier:serviceType:characteristicType:serviceGroupUniqueIdentifier:zoneUniqueIdentifiers:roomUniqueIdentifier:accessoryName:serviceName:roomName:serviceGroupName:zoneNames:homeName:](v155, "initWithBase:accessoryUniqueIdentifier:accessoryState:serviceUniqueIdentifier:serviceType:characteristicType:serviceGroupUniqueIdentifier:zoneUniqueIdentifiers:roomUniqueIdentifier:accessoryName:serviceName:roomName:serviceGroupName:zoneNames:homeName:", v8, v196, v194, v67, v184, v187, v173, v51, v178, v176, v170, v168, v166, v113,
                               v121));
                      v191 = (BMHomeKitClientAccessoryControl *)a4;
                    }
                    else
                    {
                      if (v185)
                      {
                        v157 = objc_alloc(MEMORY[0x1E0CB35C8]);
                        v158 = *MEMORY[0x1E0D025B8];
                        v207 = *MEMORY[0x1E0CB2D50];
                        v159 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSString"), objc_opt_class(), CFSTR("homeName"));
                        v208 = v159;
                        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v208, &v207, 1);
                        v160 = (void *)objc_claimAutoreleasedReturnValue();
                        v161 = v157;
                        v162 = v158;
                        v10 = v180;
                        v8 = v181;
                        *v185 = (id)objc_msgSend(v161, "initWithDomain:code:userInfo:", v162, 2, v160);

                        v67 = v189;
                      }
                      v186 = 0;
                      a4 = 0;
LABEL_141:
                      v11 = v190;
                    }

                    v145 = v186;
LABEL_158:

LABEL_159:
                    v14 = v173;
LABEL_160:

LABEL_161:
LABEL_162:

LABEL_163:
LABEL_164:

LABEL_165:
                    goto LABEL_166;
                  }
                }
                v130 = v185;
                if (v185)
                {
                  v131 = objc_alloc(MEMORY[0x1E0CB35C8]);
                  v132 = *MEMORY[0x1E0D025B8];
                  v211 = *MEMORY[0x1E0CB2D50];
                  v164 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type null for element of %@, must not be null"), CFSTR("zoneNames"));
                  v212 = v164;
                  v133 = (void *)MEMORY[0x1E0C99D80];
                  v134 = &v212;
                  v135 = &v211;
LABEL_140:
                  objc_msgSend(v133, "dictionaryWithObjects:forKeys:count:", v134, v135, 1);
                  v140 = (void *)objc_claimAutoreleasedReturnValue();
                  *v130 = (id)objc_msgSend(v131, "initWithDomain:code:userInfo:", v132, 2, v140);

                  a4 = 0;
                  v186 = obj;
                  v10 = v180;
                  v8 = v181;
                  v67 = v189;
                  goto LABEL_141;
                }
LABEL_144:
                a4 = 0;
                v145 = obj;
              }
              else
              {
                if (!v110)
                  goto LABEL_113;
                objc_opt_class();
                if ((objc_opt_isKindOfClass() & 1) != 0)
                  goto LABEL_113;
                obj = v110;
                if (!v185)
                {
                  a4 = 0;
                  v10 = v180;
                  v8 = v181;
                  v67 = v189;
                  v11 = v190;
                  goto LABEL_160;
                }
                v151 = objc_alloc(MEMORY[0x1E0CB35C8]);
                v152 = *MEMORY[0x1E0D025B8];
                v214 = *MEMORY[0x1E0CB2D50];
                v113 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Expecting %@ as an array"), CFSTR("zoneNames"));
                v215 = v113;
                objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v215, &v214, 1);
                v153 = objc_claimAutoreleasedReturnValue();
                v154 = (id)objc_msgSend(v151, "initWithDomain:code:userInfo:", v152, 2, v153);
                v145 = (void *)v153;
                a4 = 0;
                *v185 = v154;
              }
              v10 = v180;
              v8 = v181;
              v67 = v189;
              v11 = v190;
              goto LABEL_158;
            }
            if (v185)
            {
              v179 = objc_alloc(MEMORY[0x1E0CB35C8]);
              v122 = *MEMORY[0x1E0D025B8];
              v224 = *MEMORY[0x1E0CB2D50];
              v176 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSString"), objc_opt_class(), CFSTR("roomUniqueIdentifier"));
              v225 = v176;
              objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v225, &v224, 1);
              v123 = objc_claimAutoreleasedReturnValue();
              v124 = v122;
              v10 = v180;
              v172 = (void *)v123;
              v125 = (id)objc_msgSend(v179, "initWithDomain:code:userInfo:", v124, 2);
              v178 = 0;
              a4 = 0;
              *v185 = v125;
              v8 = v181;
              v67 = v189;
              v11 = v190;

              goto LABEL_165;
            }
            v178 = 0;
            a4 = 0;
            v8 = v181;
            v67 = v189;
            v11 = v190;
LABEL_166:

            v90 = v178;
LABEL_167:

LABEL_168:
LABEL_169:

            v9 = v192;
LABEL_170:
            v68 = v184;

LABEL_171:
LABEL_172:
            self = v191;

LABEL_173:
            v18 = v10;
LABEL_174:
            v38 = (void *)v194;
LABEL_175:

            v10 = v18;
            goto LABEL_176;
          }
        }
      }
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v181 = v8;
        v14 = v14;
        goto LABEL_49;
      }
      if (a4)
      {
        v91 = v8;
        v92 = objc_alloc(MEMORY[0x1E0CB35C8]);
        v93 = *MEMORY[0x1E0D025B8];
        v233 = *MEMORY[0x1E0CB2D50];
        v48 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSString"), objc_opt_class(), CFSTR("serviceGroupUniqueIdentifier"));
        v234 = v48;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v234, &v233, 1);
        v51 = (void *)objc_claimAutoreleasedReturnValue();
        v94 = v92;
        v8 = v91;
        v95 = (id)objc_msgSend(v94, "initWithDomain:code:userInfo:", v93, 2, v51);
        v14 = 0;
        a4 = 0;
        *v185 = v95;
        v67 = v189;
        goto LABEL_168;
      }
      v14 = 0;
LABEL_110:
      v67 = v189;
      v11 = v190;
      goto LABEL_170;
    }
    if (a4)
    {
      v193 = v9;
      v41 = objc_alloc(MEMORY[0x1E0CB35C8]);
      v182 = v8;
      v42 = *MEMORY[0x1E0D025B8];
      v241 = *MEMORY[0x1E0CB2D50];
      v43 = self;
      v44 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSDictionary"), objc_opt_class(), CFSTR("accessoryState"));
      v242 = v44;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v242, &v241, 1);
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      v46 = v41;
      v9 = v193;
      v47 = v42;
      v8 = v182;
      *a4 = (id)objc_msgSend(v46, "initWithDomain:code:userInfo:", v47, 2, v45);

      a4 = 0;
      v18 = v10;
      v38 = (void *)v44;
      self = v43;
      goto LABEL_175;
    }
LABEL_176:

    goto LABEL_177;
  }
  if (a4)
  {
    v22 = objc_alloc(MEMORY[0x1E0CB35C8]);
    v23 = self;
    v24 = v7;
    v25 = *MEMORY[0x1E0D025B8];
    v245 = *MEMORY[0x1E0CB2D50];
    v8 = (BMHomeKitBase *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSDictionary"), objc_opt_class(), CFSTR("base"));
    v246[0] = v8;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v246, &v245, 1);
    v26 = objc_claimAutoreleasedReturnValue();
    v27 = v25;
    v7 = v24;
    self = v23;
    v196 = (id)v26;
    v28 = (id)objc_msgSend(v22, "initWithDomain:code:userInfo:", v27, 2, v26);
    v29 = a4;
    a4 = 0;
    *v29 = v28;
LABEL_178:

  }
  return (BMHomeKitClientAccessoryControl *)a4;
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
  -[BMHomeKitClientAccessoryControl zoneUniqueIdentifiers](self, "zoneUniqueIdentifiers", 0);
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
  -[BMHomeKitClientAccessoryControl zoneNames](self, "zoneNames", 0);
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
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  uint64_t v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  id v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  _QWORD v54[15];
  _QWORD v55[17];

  v55[15] = *MEMORY[0x1E0C80C00];
  -[BMHomeKitClientAccessoryControl base](self, "base");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "jsonDictionary");
  v4 = objc_claimAutoreleasedReturnValue();

  -[BMHomeKitClientAccessoryControl accessoryUniqueIdentifier](self, "accessoryUniqueIdentifier");
  v5 = objc_claimAutoreleasedReturnValue();
  -[BMHomeKitClientAccessoryControl accessoryState](self, "accessoryState");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "jsonDictionary");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  -[BMHomeKitClientAccessoryControl serviceUniqueIdentifier](self, "serviceUniqueIdentifier");
  v8 = objc_claimAutoreleasedReturnValue();
  -[BMHomeKitClientAccessoryControl serviceType](self, "serviceType");
  v9 = objc_claimAutoreleasedReturnValue();
  -[BMHomeKitClientAccessoryControl characteristicType](self, "characteristicType");
  v10 = objc_claimAutoreleasedReturnValue();
  -[BMHomeKitClientAccessoryControl serviceGroupUniqueIdentifier](self, "serviceGroupUniqueIdentifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMHomeKitClientAccessoryControl _zoneUniqueIdentifiersJSONArray](self, "_zoneUniqueIdentifiersJSONArray");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMHomeKitClientAccessoryControl roomUniqueIdentifier](self, "roomUniqueIdentifier");
  v13 = objc_claimAutoreleasedReturnValue();
  -[BMHomeKitClientAccessoryControl accessoryName](self, "accessoryName");
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMHomeKitClientAccessoryControl serviceName](self, "serviceName");
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMHomeKitClientAccessoryControl roomName](self, "roomName");
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMHomeKitClientAccessoryControl serviceGroupName](self, "serviceGroupName");
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMHomeKitClientAccessoryControl _zoneNamesJSONArray](self, "_zoneNamesJSONArray");
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMHomeKitClientAccessoryControl homeName](self, "homeName");
  v14 = objc_claimAutoreleasedReturnValue();
  v54[0] = CFSTR("base");
  v15 = v4;
  if (!v4)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v15 = objc_claimAutoreleasedReturnValue();
  }
  v41 = (void *)v15;
  v55[0] = v15;
  v54[1] = CFSTR("accessoryUniqueIdentifier");
  v16 = v5;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v16 = objc_claimAutoreleasedReturnValue();
  }
  v40 = (void *)v16;
  v55[1] = v16;
  v54[2] = CFSTR("accessoryState");
  v17 = (uint64_t)v7;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v17 = objc_claimAutoreleasedReturnValue();
  }
  v39 = (void *)v17;
  v55[2] = v17;
  v54[3] = CFSTR("serviceUniqueIdentifier");
  v18 = v8;
  if (!v8)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v18 = objc_claimAutoreleasedReturnValue();
  }
  v38 = (void *)v18;
  v55[3] = v18;
  v54[4] = CFSTR("serviceType");
  v19 = v9;
  if (!v9)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v19 = objc_claimAutoreleasedReturnValue();
  }
  v37 = (void *)v19;
  v55[4] = v19;
  v54[5] = CFSTR("characteristicType");
  v20 = v10;
  if (!v10)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v20 = objc_claimAutoreleasedReturnValue();
  }
  v36 = (void *)v20;
  v55[5] = v20;
  v54[6] = CFSTR("serviceGroupUniqueIdentifier");
  v21 = (uint64_t)v11;
  if (!v11)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v21 = objc_claimAutoreleasedReturnValue();
  }
  v35 = (void *)v21;
  v55[6] = v21;
  v54[7] = CFSTR("zoneUniqueIdentifiers");
  v22 = (uint64_t)v12;
  if (!v12)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v22 = objc_claimAutoreleasedReturnValue();
  }
  v44 = (void *)v13;
  v34 = (void *)v22;
  v55[7] = v22;
  v54[8] = CFSTR("roomUniqueIdentifier");
  v23 = v13;
  if (!v13)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v23 = objc_claimAutoreleasedReturnValue();
  }
  v48 = (void *)v14;
  v32 = v23;
  v55[8] = v23;
  v54[9] = CFSTR("accessoryName");
  v24 = v53;
  if (!v53)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null", v23, v34, v35, v36, v37, v38, v39, v40, v41);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v46 = (void *)v9;
  v47 = (void *)v8;
  v55[9] = v24;
  v54[10] = CFSTR("serviceName");
  v25 = v52;
  if (!v52)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v45 = (void *)v10;
  v43 = (void *)v4;
  v55[10] = v25;
  v54[11] = CFSTR("roomName");
  v26 = v51;
  if (!v51)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v27 = (void *)v5;
  v55[11] = v26;
  v54[12] = CFSTR("serviceGroupName");
  v28 = v50;
  if (!v50)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v55[12] = v28;
  v54[13] = CFSTR("zoneNames");
  v29 = v49;
  if (!v49)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v55[13] = v29;
  v54[14] = CFSTR("homeName");
  v30 = v48;
  if (!v48)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v55[14] = v30;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v55, v54, 15, v32);
  v42 = (id)objc_claimAutoreleasedReturnValue();
  if (!v48)

  if (!v49)
  if (!v50)

  if (!v51)
  if (!v52)

  if (!v53)
  if (!v44)

  if (v12)
  {
    if (v11)
      goto LABEL_47;
  }
  else
  {

    if (v11)
    {
LABEL_47:
      if (v45)
        goto LABEL_48;
      goto LABEL_56;
    }
  }

  if (v45)
  {
LABEL_48:
    if (v46)
      goto LABEL_49;
    goto LABEL_57;
  }
LABEL_56:

  if (v46)
  {
LABEL_49:
    if (v47)
      goto LABEL_50;
    goto LABEL_58;
  }
LABEL_57:

  if (v47)
  {
LABEL_50:
    if (v7)
      goto LABEL_51;
    goto LABEL_59;
  }
LABEL_58:

  if (v7)
  {
LABEL_51:
    if (v27)
      goto LABEL_52;
LABEL_60:

    if (v43)
      goto LABEL_53;
LABEL_61:

    goto LABEL_53;
  }
LABEL_59:

  if (!v27)
    goto LABEL_60;
LABEL_52:
  if (!v43)
    goto LABEL_61;
LABEL_53:

  return v42;
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
  void *v61;
  uint64_t v62;
  void *v63;
  void *v64;
  void *v65;
  int v66;
  void *v67;
  uint64_t v68;
  void *v69;
  void *v70;
  void *v71;
  int v72;
  void *v73;
  uint64_t v74;
  void *v75;
  void *v76;
  void *v77;
  int v78;
  void *v79;
  uint64_t v80;
  void *v81;
  void *v82;
  void *v83;
  int v84;
  void *v85;
  uint64_t v86;
  void *v87;
  void *v88;
  void *v89;
  int v90;
  void *v92;
  void *v93;
  void *v94;
  void *v95;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    -[BMHomeKitClientAccessoryControl base](self, "base");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "base");
    v7 = objc_claimAutoreleasedReturnValue();
    if (v6 == (void *)v7)
    {

    }
    else
    {
      v8 = (void *)v7;
      -[BMHomeKitClientAccessoryControl base](self, "base");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "base");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v9, "isEqual:", v10);

      if (!v11)
        goto LABEL_57;
    }
    -[BMHomeKitClientAccessoryControl accessoryUniqueIdentifier](self, "accessoryUniqueIdentifier");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "accessoryUniqueIdentifier");
    v14 = objc_claimAutoreleasedReturnValue();
    if (v13 == (void *)v14)
    {

    }
    else
    {
      v15 = (void *)v14;
      -[BMHomeKitClientAccessoryControl accessoryUniqueIdentifier](self, "accessoryUniqueIdentifier");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "accessoryUniqueIdentifier");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = objc_msgSend(v16, "isEqual:", v17);

      if (!v18)
        goto LABEL_57;
    }
    -[BMHomeKitClientAccessoryControl accessoryState](self, "accessoryState");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "accessoryState");
    v20 = objc_claimAutoreleasedReturnValue();
    if (v19 == (void *)v20)
    {

    }
    else
    {
      v21 = (void *)v20;
      -[BMHomeKitClientAccessoryControl accessoryState](self, "accessoryState");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "accessoryState");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = objc_msgSend(v22, "isEqual:", v23);

      if (!v24)
        goto LABEL_57;
    }
    -[BMHomeKitClientAccessoryControl serviceUniqueIdentifier](self, "serviceUniqueIdentifier");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "serviceUniqueIdentifier");
    v26 = objc_claimAutoreleasedReturnValue();
    if (v25 == (void *)v26)
    {

    }
    else
    {
      v27 = (void *)v26;
      -[BMHomeKitClientAccessoryControl serviceUniqueIdentifier](self, "serviceUniqueIdentifier");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "serviceUniqueIdentifier");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      v30 = objc_msgSend(v28, "isEqual:", v29);

      if (!v30)
        goto LABEL_57;
    }
    -[BMHomeKitClientAccessoryControl serviceType](self, "serviceType");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "serviceType");
    v32 = objc_claimAutoreleasedReturnValue();
    if (v31 == (void *)v32)
    {

    }
    else
    {
      v33 = (void *)v32;
      -[BMHomeKitClientAccessoryControl serviceType](self, "serviceType");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "serviceType");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      v36 = objc_msgSend(v34, "isEqual:", v35);

      if (!v36)
        goto LABEL_57;
    }
    -[BMHomeKitClientAccessoryControl characteristicType](self, "characteristicType");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "characteristicType");
    v38 = objc_claimAutoreleasedReturnValue();
    if (v37 == (void *)v38)
    {

    }
    else
    {
      v39 = (void *)v38;
      -[BMHomeKitClientAccessoryControl characteristicType](self, "characteristicType");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "characteristicType");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      v42 = objc_msgSend(v40, "isEqual:", v41);

      if (!v42)
        goto LABEL_57;
    }
    -[BMHomeKitClientAccessoryControl serviceGroupUniqueIdentifier](self, "serviceGroupUniqueIdentifier");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "serviceGroupUniqueIdentifier");
    v44 = objc_claimAutoreleasedReturnValue();
    if (v43 == (void *)v44)
    {

    }
    else
    {
      v45 = (void *)v44;
      -[BMHomeKitClientAccessoryControl serviceGroupUniqueIdentifier](self, "serviceGroupUniqueIdentifier");
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "serviceGroupUniqueIdentifier");
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      v48 = objc_msgSend(v46, "isEqual:", v47);

      if (!v48)
        goto LABEL_57;
    }
    -[BMHomeKitClientAccessoryControl zoneUniqueIdentifiers](self, "zoneUniqueIdentifiers");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "zoneUniqueIdentifiers");
    v50 = objc_claimAutoreleasedReturnValue();
    if (v49 == (void *)v50)
    {

    }
    else
    {
      v51 = (void *)v50;
      -[BMHomeKitClientAccessoryControl zoneUniqueIdentifiers](self, "zoneUniqueIdentifiers");
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "zoneUniqueIdentifiers");
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      v54 = objc_msgSend(v52, "isEqual:", v53);

      if (!v54)
        goto LABEL_57;
    }
    -[BMHomeKitClientAccessoryControl roomUniqueIdentifier](self, "roomUniqueIdentifier");
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "roomUniqueIdentifier");
    v56 = objc_claimAutoreleasedReturnValue();
    if (v55 == (void *)v56)
    {

    }
    else
    {
      v57 = (void *)v56;
      -[BMHomeKitClientAccessoryControl roomUniqueIdentifier](self, "roomUniqueIdentifier");
      v58 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "roomUniqueIdentifier");
      v59 = (void *)objc_claimAutoreleasedReturnValue();
      v60 = objc_msgSend(v58, "isEqual:", v59);

      if (!v60)
        goto LABEL_57;
    }
    -[BMHomeKitClientAccessoryControl accessoryName](self, "accessoryName");
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "accessoryName");
    v62 = objc_claimAutoreleasedReturnValue();
    if (v61 == (void *)v62)
    {

    }
    else
    {
      v63 = (void *)v62;
      -[BMHomeKitClientAccessoryControl accessoryName](self, "accessoryName");
      v64 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "accessoryName");
      v65 = (void *)objc_claimAutoreleasedReturnValue();
      v66 = objc_msgSend(v64, "isEqual:", v65);

      if (!v66)
        goto LABEL_57;
    }
    -[BMHomeKitClientAccessoryControl serviceName](self, "serviceName");
    v67 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "serviceName");
    v68 = objc_claimAutoreleasedReturnValue();
    if (v67 == (void *)v68)
    {

    }
    else
    {
      v69 = (void *)v68;
      -[BMHomeKitClientAccessoryControl serviceName](self, "serviceName");
      v70 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "serviceName");
      v71 = (void *)objc_claimAutoreleasedReturnValue();
      v72 = objc_msgSend(v70, "isEqual:", v71);

      if (!v72)
        goto LABEL_57;
    }
    -[BMHomeKitClientAccessoryControl roomName](self, "roomName");
    v73 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "roomName");
    v74 = objc_claimAutoreleasedReturnValue();
    if (v73 == (void *)v74)
    {

    }
    else
    {
      v75 = (void *)v74;
      -[BMHomeKitClientAccessoryControl roomName](self, "roomName");
      v76 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "roomName");
      v77 = (void *)objc_claimAutoreleasedReturnValue();
      v78 = objc_msgSend(v76, "isEqual:", v77);

      if (!v78)
        goto LABEL_57;
    }
    -[BMHomeKitClientAccessoryControl serviceGroupName](self, "serviceGroupName");
    v79 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "serviceGroupName");
    v80 = objc_claimAutoreleasedReturnValue();
    if (v79 == (void *)v80)
    {

    }
    else
    {
      v81 = (void *)v80;
      -[BMHomeKitClientAccessoryControl serviceGroupName](self, "serviceGroupName");
      v82 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "serviceGroupName");
      v83 = (void *)objc_claimAutoreleasedReturnValue();
      v84 = objc_msgSend(v82, "isEqual:", v83);

      if (!v84)
        goto LABEL_57;
    }
    -[BMHomeKitClientAccessoryControl zoneNames](self, "zoneNames");
    v85 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "zoneNames");
    v86 = objc_claimAutoreleasedReturnValue();
    if (v85 == (void *)v86)
    {

    }
    else
    {
      v87 = (void *)v86;
      -[BMHomeKitClientAccessoryControl zoneNames](self, "zoneNames");
      v88 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "zoneNames");
      v89 = (void *)objc_claimAutoreleasedReturnValue();
      v90 = objc_msgSend(v88, "isEqual:", v89);

      if (!v90)
      {
LABEL_57:
        v12 = 0;
LABEL_58:

        goto LABEL_59;
      }
    }
    -[BMHomeKitClientAccessoryControl homeName](self, "homeName");
    v92 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "homeName");
    v93 = (void *)objc_claimAutoreleasedReturnValue();
    if (v92 == v93)
    {
      v12 = 1;
    }
    else
    {
      -[BMHomeKitClientAccessoryControl homeName](self, "homeName");
      v94 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "homeName");
      v95 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v94, "isEqual:", v95);

    }
    goto LABEL_58;
  }
  v12 = 0;
LABEL_59:

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

- (BMHomeKitAccessoryState)accessoryState
{
  return self->_accessoryState;
}

- (NSString)serviceUniqueIdentifier
{
  return self->_serviceUniqueIdentifier;
}

- (NSString)serviceType
{
  return self->_serviceType;
}

- (NSString)characteristicType
{
  return self->_characteristicType;
}

- (NSString)serviceGroupUniqueIdentifier
{
  return self->_serviceGroupUniqueIdentifier;
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

- (NSString)serviceName
{
  return self->_serviceName;
}

- (NSString)roomName
{
  return self->_roomName;
}

- (NSString)serviceGroupName
{
  return self->_serviceGroupName;
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
  objc_storeStrong((id *)&self->_serviceGroupName, 0);
  objc_storeStrong((id *)&self->_roomName, 0);
  objc_storeStrong((id *)&self->_serviceName, 0);
  objc_storeStrong((id *)&self->_accessoryName, 0);
  objc_storeStrong((id *)&self->_roomUniqueIdentifier, 0);
  objc_storeStrong((id *)&self->_zoneUniqueIdentifiers, 0);
  objc_storeStrong((id *)&self->_serviceGroupUniqueIdentifier, 0);
  objc_storeStrong((id *)&self->_characteristicType, 0);
  objc_storeStrong((id *)&self->_serviceType, 0);
  objc_storeStrong((id *)&self->_serviceUniqueIdentifier, 0);
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
    v6 = off_1E5E4AB30;
  }
  else
  {
    if (a4)
    {
      v8 = 0;
      goto LABEL_7;
    }
    v6 = off_1E5E4AB38;
  }
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D82B90]), "initWithData:", v5);
  v8 = (_DWORD *)objc_msgSend(objc_alloc(*v6), "initByReadFrom:", v7);
  v8[4] = a4;

LABEL_7:
  return v8;
}

+ (id)validKeyPaths
{
  return &unk_1E5F1EBC8;
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
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  _QWORD v19[17];

  v19[15] = *MEMORY[0x1E0C80C00];
  v18 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("base"), 1, 14, objc_opt_class());
  v19[0] = v18;
  v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("accessoryUniqueIdentifier"), 2, 13, 0);
  v19[1] = v17;
  v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("accessoryState"), 3, 14, objc_opt_class());
  v19[2] = v16;
  v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("serviceUniqueIdentifier"), 4, 13, 0);
  v19[3] = v15;
  v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("serviceType"), 5, 13, 0);
  v19[4] = v14;
  v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("characteristicType"), 6, 13, 0);
  v19[5] = v13;
  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("serviceGroupUniqueIdentifier"), 7, 13, 0);
  v19[6] = v2;
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("zoneUniqueIdentifiers"), 8, 13, 0);
  v19[7] = v3;
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("roomUniqueIdentifier"), 9, 13, 0);
  v19[8] = v4;
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("accessoryName"), 10, 13, 0);
  v19[9] = v5;
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("serviceName"), 11, 13, 0);
  v19[10] = v6;
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("roomName"), 12, 13, 0);
  v19[11] = v7;
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("serviceGroupName"), 13, 13, 0);
  v19[12] = v8;
  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("zoneNames"), 14, 13, 0);
  v19[13] = v9;
  v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("homeName"), 15, 13, 0);
  v19[14] = v10;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v19, 15);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

id __42__BMHomeKitClientAccessoryControl_columns__block_invoke_4(uint64_t a1, void *a2)
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

id __42__BMHomeKitClientAccessoryControl_columns__block_invoke_3(uint64_t a1, void *a2)
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

id __42__BMHomeKitClientAccessoryControl_columns__block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(a2, "eventBodyKeepingBackingData:", 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "accessoryState");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "jsonDictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  BMConvertObjectToJSONString();
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

id __42__BMHomeKitClientAccessoryControl_columns__block_invoke(uint64_t a1, void *a2)
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
