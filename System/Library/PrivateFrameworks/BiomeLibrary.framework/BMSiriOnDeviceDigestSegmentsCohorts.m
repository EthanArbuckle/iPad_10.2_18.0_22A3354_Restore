@implementation BMSiriOnDeviceDigestSegmentsCohorts

- (BMSiriOnDeviceDigestSegmentsCohorts)initWithEventMetadata:(id)a3 deviceSegmentsReported:(id)a4 deviceCohortsReported:(id)a5
{
  id v9;
  id v10;
  id v11;
  BMSiriOnDeviceDigestSegmentsCohorts *v12;
  objc_super v14;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v14.receiver = self;
  v14.super_class = (Class)BMSiriOnDeviceDigestSegmentsCohorts;
  v12 = -[BMEventBase init](&v14, sel_init);
  if (v12)
  {
    v12->_dataVersion = objc_msgSend((id)objc_opt_class(), "latestDataVersion");
    objc_storeStrong((id *)&v12->_eventMetadata, a3);
    objc_storeStrong((id *)&v12->_deviceSegmentsReported, a4);
    objc_storeStrong((id *)&v12->_deviceCohortsReported, a5);
  }

  return v12;
}

- (NSString)description
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = objc_alloc(MEMORY[0x1E0CB3940]);
  -[BMSiriOnDeviceDigestSegmentsCohorts eventMetadata](self, "eventMetadata");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMSiriOnDeviceDigestSegmentsCohorts deviceSegmentsReported](self, "deviceSegmentsReported");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMSiriOnDeviceDigestSegmentsCohorts deviceCohortsReported](self, "deviceCohortsReported");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("BMSiriOnDeviceDigestSegmentsCohorts with eventMetadata: %@, deviceSegmentsReported: %@, deviceCohortsReported: %@"), v4, v5, v6);

  return (NSString *)v7;
}

- (id)initByReadFrom:(id)a3
{
  _BYTE *v4;
  BMSiriOnDeviceDigestSegmentsCohorts *v5;
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
  unint64_t v21;
  BMSiriOnDeviceDigestSegmentsCohortsEventMetadata *v22;
  BMSiriOnDeviceDigestSegmentsCohortsEventMetadata *eventMetadata;
  id v24;
  void *v25;
  void *v26;
  id v27;
  uint64_t v28;
  NSArray *deviceSegmentsReported;
  uint64_t v30;
  NSArray *deviceCohortsReported;
  int v32;
  BMSiriOnDeviceDigestSegmentsCohorts *v33;
  objc_super v35;
  uint64_t v36;
  uint64_t v37;

  v4 = a3;
  v35.receiver = self;
  v35.super_class = (Class)BMSiriOnDeviceDigestSegmentsCohorts;
  v5 = -[BMEventBase init](&v35, sel_init);
  if (!v5)
    goto LABEL_35;
  v6 = (void *)objc_opt_new();
  v7 = (void *)objc_opt_new();
  v8 = (int *)MEMORY[0x1E0D82BF0];
  v9 = (int *)MEMORY[0x1E0D82BD8];
  v10 = (int *)MEMORY[0x1E0D82BC8];
  if (*(_QWORD *)&v4[*MEMORY[0x1E0D82BF0]] < *(_QWORD *)&v4[*MEMORY[0x1E0D82BD8]])
  {
    v11 = (int *)MEMORY[0x1E0D82BB8];
    while (1)
    {
      if (v4[*v10])
        goto LABEL_34;
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
        goto LABEL_34;
      v21 = v14 >> 3;
      if ((v14 >> 3) == 3)
        break;
      if ((_DWORD)v21 == 2)
      {
        v36 = 0;
        v37 = 0;
        if ((PBReaderPlaceMark() & 1) == 0)
          goto LABEL_36;
        v27 = -[BMSiriOnDeviceDigestSegmentsCohortsDeviceSegments initByReadFrom:]([BMSiriOnDeviceDigestSegmentsCohortsDeviceSegments alloc], "initByReadFrom:", v4);
        if (!v27)
          goto LABEL_36;
        v25 = v27;
        v26 = v6;
LABEL_31:
        objc_msgSend(v26, "addObject:", v25);
        PBReaderRecallMark();

        goto LABEL_33;
      }
      if ((_DWORD)v21 == 1)
      {
        v36 = 0;
        v37 = 0;
        if ((PBReaderPlaceMark() & 1) == 0)
          goto LABEL_36;
        v22 = -[BMSiriOnDeviceDigestSegmentsCohortsEventMetadata initByReadFrom:]([BMSiriOnDeviceDigestSegmentsCohortsEventMetadata alloc], "initByReadFrom:", v4);
        if (!v22)
          goto LABEL_36;
        eventMetadata = v5->_eventMetadata;
        v5->_eventMetadata = v22;

        PBReaderRecallMark();
      }
      else if (!PBReaderSkipValueWithTag())
      {
        goto LABEL_36;
      }
LABEL_33:
      if (*(_QWORD *)&v4[*v8] >= *(_QWORD *)&v4[*v9])
        goto LABEL_34;
    }
    v36 = 0;
    v37 = 0;
    if ((PBReaderPlaceMark() & 1) == 0
      || (v24 = -[BMSiriOnDeviceDigestSegmentsCohortsDeviceCohorts initByReadFrom:]([BMSiriOnDeviceDigestSegmentsCohortsDeviceCohorts alloc], "initByReadFrom:", v4)) == 0)
    {
LABEL_36:

      goto LABEL_37;
    }
    v25 = v24;
    v26 = v7;
    goto LABEL_31;
  }
LABEL_34:
  v28 = objc_msgSend(v6, "copy");
  deviceSegmentsReported = v5->_deviceSegmentsReported;
  v5->_deviceSegmentsReported = (NSArray *)v28;

  v30 = objc_msgSend(v7, "copy");
  deviceCohortsReported = v5->_deviceCohortsReported;
  v5->_deviceCohortsReported = (NSArray *)v30;

  v32 = v4[*v10];
  if (v32)
LABEL_37:
    v33 = 0;
  else
LABEL_35:
    v33 = v5;

  return v33;
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
  void *v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  uint64_t v25;
  _BYTE v26[128];
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (self->_eventMetadata)
  {
    v25 = 0;
    PBDataWriterPlaceMark();
    -[BMSiriOnDeviceDigestSegmentsCohortsEventMetadata writeTo:](self->_eventMetadata, "writeTo:", v4);
    PBDataWriterRecallMark();
  }
  v23 = 0u;
  v24 = 0u;
  v21 = 0u;
  v22 = 0u;
  v5 = self->_deviceSegmentsReported;
  v6 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v21, v27, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v22;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v22 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * v9);
        v25 = 0;
        PBDataWriterPlaceMark();
        objc_msgSend(v10, "writeTo:", v4);
        PBDataWriterRecallMark();
        ++v9;
      }
      while (v7 != v9);
      v7 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v21, v27, 16);
    }
    while (v7);
  }

  v19 = 0u;
  v20 = 0u;
  v17 = 0u;
  v18 = 0u;
  v11 = self->_deviceCohortsReported;
  v12 = -[NSArray countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v17, v26, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v18;
    do
    {
      v15 = 0;
      do
      {
        if (*(_QWORD *)v18 != v14)
          objc_enumerationMutation(v11);
        v16 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * v15);
        v25 = 0;
        PBDataWriterPlaceMark();
        objc_msgSend(v16, "writeTo:", v4, (_QWORD)v17);
        PBDataWriterRecallMark();
        ++v15;
      }
      while (v13 != v15);
      v13 = -[NSArray countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v17, v26, 16);
    }
    while (v13);
  }

}

- (id)serialize
{
  void *v3;
  void *v4;

  v3 = (void *)objc_opt_new();
  -[BMSiriOnDeviceDigestSegmentsCohorts writeTo:](self, "writeTo:", v3);
  objc_msgSend(v3, "immutableData");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (BMSiriOnDeviceDigestSegmentsCohorts)initWithJSONDictionary:(id)a3 error:(id *)a4
{
  id v5;
  uint64_t v6;
  void *v7;
  BMSiriOnDeviceDigestSegmentsCohortsEventMetadata *v8;
  id v9;
  void *v10;
  int v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  id v17;
  BMSiriOnDeviceDigestSegmentsCohortsDeviceSegments *v18;
  BMSiriOnDeviceDigestSegmentsCohortsDeviceSegments *v19;
  id v20;
  id v21;
  void *v22;
  int v23;
  id v24;
  void *v25;
  id v26;
  uint64_t v27;
  BMSiriOnDeviceDigestSegmentsCohorts *v28;
  id v29;
  uint64_t v30;
  void *v31;
  id v32;
  uint64_t v33;
  void *v34;
  void *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  void *v40;
  id v41;
  BMSiriOnDeviceDigestSegmentsCohortsDeviceCohorts *v42;
  BMSiriOnDeviceDigestSegmentsCohortsDeviceCohorts *v43;
  id v44;
  id v45;
  uint64_t v46;
  id *v47;
  id v48;
  uint64_t v49;
  void *v50;
  id *v51;
  uint64_t *v52;
  void *v53;
  id v55;
  uint64_t v56;
  void *v57;
  BMSiriOnDeviceDigestSegmentsCohorts *v58;
  BMSiriOnDeviceDigestSegmentsCohorts *v59;
  BMSiriOnDeviceDigestSegmentsCohortsEventMetadata *v60;
  void *v61;
  void *v63;
  void *v64;
  id v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  id v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  id v75;
  uint64_t v76;
  id v77;
  uint64_t v78;
  id v79;
  _BYTE v80[128];
  uint64_t v81;
  id v82;
  uint64_t v83;
  id v84;
  uint64_t v85;
  id v86;
  _BYTE v87[128];
  uint64_t v88;
  void *v89;
  uint64_t v90;
  _QWORD v91[3];

  v91[1] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("eventMetadata"));
  v6 = objc_claimAutoreleasedReturnValue();
  v63 = (void *)v6;
  if (v6 && (v7 = (void *)v6, objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      if (a4)
      {
        v26 = objc_alloc(MEMORY[0x1E0CB35C8]);
        v27 = *MEMORY[0x1E0D025B8];
        v90 = *MEMORY[0x1E0CB2D50];
        v91[0] = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSDictionary"), objc_opt_class(), CFSTR("eventMetadata"));
        v8 = (BMSiriOnDeviceDigestSegmentsCohortsEventMetadata *)v91[0];
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v91, &v90, 1);
        v9 = (id)objc_claimAutoreleasedReturnValue();
        v28 = 0;
        *a4 = (id)objc_msgSend(v26, "initWithDomain:code:userInfo:", v27, 2, v9);
        goto LABEL_68;
      }
      v28 = 0;
      goto LABEL_69;
    }
    v9 = v7;
    v75 = 0;
    v8 = -[BMSiriOnDeviceDigestSegmentsCohortsEventMetadata initWithJSONDictionary:error:]([BMSiriOnDeviceDigestSegmentsCohortsEventMetadata alloc], "initWithJSONDictionary:error:", v9, &v75);
    v24 = v75;
    if (v24)
    {
      v25 = v24;
      if (a4)
        *a4 = objc_retainAutorelease(v24);

      goto LABEL_51;
    }

  }
  else
  {
    v8 = 0;
  }
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("deviceSegmentsReported"));
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E38], "null");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v9, "isEqual:", v10);

  v61 = v5;
  if (!v11)
  {
    if (!v9 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      v60 = v8;
      goto LABEL_9;
    }
    if (a4)
    {
      v45 = objc_alloc(MEMORY[0x1E0CB35C8]);
      v46 = *MEMORY[0x1E0D025B8];
      v88 = *MEMORY[0x1E0CB2D50];
      v64 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Expecting %@ as an array"), CFSTR("deviceSegmentsReported"));
      v89 = v64;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v89, &v88, 1);
      v21 = (id)objc_claimAutoreleasedReturnValue();
      v28 = 0;
      *a4 = (id)objc_msgSend(v45, "initWithDomain:code:userInfo:", v46, 2, v21);
      goto LABEL_67;
    }
LABEL_51:
    v28 = 0;
    goto LABEL_68;
  }
  v60 = v8;

  v9 = 0;
LABEL_9:
  v64 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v9, "count"));
  v71 = 0u;
  v72 = 0u;
  v73 = 0u;
  v74 = 0u;
  v9 = v9;
  v12 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v71, v87, 16);
  if (!v12)
    goto LABEL_19;
  v13 = v12;
  v14 = *(_QWORD *)v72;
  v58 = self;
  do
  {
    for (i = 0; i != v13; ++i)
    {
      if (*(_QWORD *)v72 != v14)
        objc_enumerationMutation(v9);
      v16 = *(void **)(*((_QWORD *)&v71 + 1) + 8 * i);
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        if (a4)
        {
          v29 = objc_alloc(MEMORY[0x1E0CB35C8]);
          v30 = *MEMORY[0x1E0D025B8];
          v85 = *MEMORY[0x1E0CB2D50];
          v17 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type null for element of %@, must not be null"), CFSTR("deviceSegmentsReported"));
          v86 = v17;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v86, &v85, 1);
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          *a4 = (id)objc_msgSend(v29, "initWithDomain:code:userInfo:", v30, 2, v31);

LABEL_35:
          v28 = 0;
          v21 = v9;
          self = v58;
          v8 = v60;
          goto LABEL_66;
        }
LABEL_52:
        v28 = 0;
        v21 = v9;
        self = v58;
        v8 = v60;
        goto LABEL_67;
      }
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if (a4)
        {
          v32 = objc_alloc(MEMORY[0x1E0CB35C8]);
          v33 = *MEMORY[0x1E0D025B8];
          v83 = *MEMORY[0x1E0CB2D50];
          v17 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSDictionary"), objc_opt_class(), CFSTR("deviceSegmentsReported"));
          v84 = v17;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v84, &v83, 1);
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          *a4 = (id)objc_msgSend(v32, "initWithDomain:code:userInfo:", v33, 2, v34);

          goto LABEL_35;
        }
        goto LABEL_52;
      }
      v17 = v16;
      v18 = [BMSiriOnDeviceDigestSegmentsCohortsDeviceSegments alloc];
      v70 = 0;
      v19 = -[BMSiriOnDeviceDigestSegmentsCohortsDeviceSegments initWithJSONDictionary:error:](v18, "initWithJSONDictionary:error:", v17, &v70);
      v20 = v70;
      if (v20)
      {
        v35 = v20;
        if (a4)
          *a4 = objc_retainAutorelease(v20);

        goto LABEL_35;
      }
      objc_msgSend(v64, "addObject:", v19);

    }
    v13 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v71, v87, 16);
    self = v58;
  }
  while (v13);
LABEL_19:

  objc_msgSend(v61, "objectForKeyedSubscript:", CFSTR("deviceCohortsReported"));
  v21 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E38], "null");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = objc_msgSend(v21, "isEqual:", v22);

  if (v23)
  {

    v21 = 0;
LABEL_38:
    v17 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v21, "count"));
    v66 = 0u;
    v67 = 0u;
    v68 = 0u;
    v69 = 0u;
    v21 = v21;
    v36 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v66, v80, 16);
    if (!v36)
      goto LABEL_48;
    v37 = v36;
    v38 = *(_QWORD *)v67;
    v59 = self;
LABEL_40:
    v39 = 0;
    while (1)
    {
      if (*(_QWORD *)v67 != v38)
        objc_enumerationMutation(v21);
      v40 = *(void **)(*((_QWORD *)&v66 + 1) + 8 * v39);
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        break;
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        self = v59;
        v8 = v60;
        v47 = a4;
        if (!a4)
          goto LABEL_64;
        v48 = objc_alloc(MEMORY[0x1E0CB35C8]);
        v49 = *MEMORY[0x1E0D025B8];
        v76 = *MEMORY[0x1E0CB2D50];
        v41 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSDictionary"), objc_opt_class(), CFSTR("deviceCohortsReported"));
        v77 = v41;
        v50 = (void *)MEMORY[0x1E0C99D80];
        v51 = &v77;
        v52 = &v76;
        goto LABEL_59;
      }
      v41 = v40;
      v42 = [BMSiriOnDeviceDigestSegmentsCohortsDeviceCohorts alloc];
      v65 = 0;
      v43 = -[BMSiriOnDeviceDigestSegmentsCohortsDeviceCohorts initWithJSONDictionary:error:](v42, "initWithJSONDictionary:error:", v41, &v65);
      v44 = v65;
      if (v44)
      {
        v53 = v44;
        if (a4)
          *a4 = objc_retainAutorelease(v44);

        self = v59;
        v8 = v60;
LABEL_63:

LABEL_64:
        goto LABEL_65;
      }
      objc_msgSend(v17, "addObject:", v43);

      if (v37 == ++v39)
      {
        v37 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v66, v80, 16);
        self = v59;
        if (v37)
          goto LABEL_40;
LABEL_48:

        v8 = v60;
        self = -[BMSiriOnDeviceDigestSegmentsCohorts initWithEventMetadata:deviceSegmentsReported:deviceCohortsReported:](self, "initWithEventMetadata:deviceSegmentsReported:deviceCohortsReported:", v60, v64, v17);
        v28 = self;
LABEL_66:

        goto LABEL_67;
      }
    }
    self = v59;
    v8 = v60;
    v47 = a4;
    if (!a4)
      goto LABEL_64;
    v48 = objc_alloc(MEMORY[0x1E0CB35C8]);
    v49 = *MEMORY[0x1E0D025B8];
    v78 = *MEMORY[0x1E0CB2D50];
    v41 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type null for element of %@, must not be null"), CFSTR("deviceCohortsReported"));
    v79 = v41;
    v50 = (void *)MEMORY[0x1E0C99D80];
    v51 = &v79;
    v52 = &v78;
LABEL_59:
    objc_msgSend(v50, "dictionaryWithObjects:forKeys:count:", v51, v52, 1);
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    *v47 = (id)objc_msgSend(v48, "initWithDomain:code:userInfo:", v49, 2, v53);
    goto LABEL_63;
  }
  if (!v21)
    goto LABEL_38;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    goto LABEL_38;
  v8 = v60;
  if (a4)
  {
    v55 = objc_alloc(MEMORY[0x1E0CB35C8]);
    v56 = *MEMORY[0x1E0D025B8];
    v81 = *MEMORY[0x1E0CB2D50];
    v17 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Expecting %@ as an array"), CFSTR("deviceCohortsReported"));
    v82 = v17;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v82, &v81, 1);
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    *a4 = (id)objc_msgSend(v55, "initWithDomain:code:userInfo:", v56, 2, v57);

LABEL_65:
    v28 = 0;
    goto LABEL_66;
  }
  v28 = 0;
LABEL_67:

  v5 = v61;
LABEL_68:

LABEL_69:
  return v28;
}

- (id)_deviceSegmentsReportedJSONArray
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
  -[BMSiriOnDeviceDigestSegmentsCohorts deviceSegmentsReported](self, "deviceSegmentsReported", 0);
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

- (id)_deviceCohortsReportedJSONArray
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
  -[BMSiriOnDeviceDigestSegmentsCohorts deviceCohortsReported](self, "deviceCohortsReported", 0);
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

- (id)jsonDictionary
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD v12[3];
  _QWORD v13[4];

  v13[3] = *MEMORY[0x1E0C80C00];
  -[BMSiriOnDeviceDigestSegmentsCohorts eventMetadata](self, "eventMetadata");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "jsonDictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  -[BMSiriOnDeviceDigestSegmentsCohorts _deviceSegmentsReportedJSONArray](self, "_deviceSegmentsReportedJSONArray");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMSiriOnDeviceDigestSegmentsCohorts _deviceCohortsReportedJSONArray](self, "_deviceCohortsReportedJSONArray");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = CFSTR("eventMetadata");
  v7 = v4;
  if (!v4)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v13[0] = v7;
  v12[1] = CFSTR("deviceSegmentsReported");
  v8 = v5;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v13[1] = v8;
  v12[2] = CFSTR("deviceCohortsReported");
  v9 = v6;
  if (!v6)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v13[2] = v9;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v13, v12, 3);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    if (v5)
      goto LABEL_9;
LABEL_12:

    if (v4)
      goto LABEL_10;
LABEL_13:

    goto LABEL_10;
  }

  if (!v5)
    goto LABEL_12;
LABEL_9:
  if (!v4)
    goto LABEL_13;
LABEL_10:

  return v10;
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
  void *v20;
  void *v21;
  void *v22;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    -[BMSiriOnDeviceDigestSegmentsCohorts eventMetadata](self, "eventMetadata");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "eventMetadata");
    v7 = objc_claimAutoreleasedReturnValue();
    if (v6 == (void *)v7)
    {

    }
    else
    {
      v8 = (void *)v7;
      -[BMSiriOnDeviceDigestSegmentsCohorts eventMetadata](self, "eventMetadata");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "eventMetadata");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v9, "isEqual:", v10);

      if (!v11)
        goto LABEL_9;
    }
    -[BMSiriOnDeviceDigestSegmentsCohorts deviceSegmentsReported](self, "deviceSegmentsReported");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "deviceSegmentsReported");
    v14 = objc_claimAutoreleasedReturnValue();
    if (v13 == (void *)v14)
    {

    }
    else
    {
      v15 = (void *)v14;
      -[BMSiriOnDeviceDigestSegmentsCohorts deviceSegmentsReported](self, "deviceSegmentsReported");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "deviceSegmentsReported");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = objc_msgSend(v16, "isEqual:", v17);

      if (!v18)
      {
LABEL_9:
        v12 = 0;
LABEL_15:

        goto LABEL_16;
      }
    }
    -[BMSiriOnDeviceDigestSegmentsCohorts deviceCohortsReported](self, "deviceCohortsReported");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "deviceCohortsReported");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    if (v19 == v20)
    {
      v12 = 1;
    }
    else
    {
      -[BMSiriOnDeviceDigestSegmentsCohorts deviceCohortsReported](self, "deviceCohortsReported");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "deviceCohortsReported");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v21, "isEqual:", v22);

    }
    goto LABEL_15;
  }
  v12 = 0;
LABEL_16:

  return v12;
}

- (unsigned)dataVersion
{
  return self->_dataVersion;
}

- (BMSiriOnDeviceDigestSegmentsCohortsEventMetadata)eventMetadata
{
  return self->_eventMetadata;
}

- (NSArray)deviceSegmentsReported
{
  return self->_deviceSegmentsReported;
}

- (NSArray)deviceCohortsReported
{
  return self->_deviceCohortsReported;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_deviceCohortsReported, 0);
  objc_storeStrong((id *)&self->_deviceSegmentsReported, 0);
  objc_storeStrong((id *)&self->_eventMetadata, 0);
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

    v4 = -[BMSiriOnDeviceDigestSegmentsCohorts initByReadFrom:]([BMSiriOnDeviceDigestSegmentsCohorts alloc], "initByReadFrom:", v7);
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
  _QWORD v7[4];

  v7[3] = *MEMORY[0x1E0C80C00];
  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02710]), "initWithName:dataType:requestOnly:extractBlock:", CFSTR("eventMetadata_json"), 5, 1, &__block_literal_global_298);
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02710]), "initWithName:dataType:requestOnly:extractBlock:", CFSTR("deviceSegmentsReported_json"), 5, 1, &__block_literal_global_299);
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02710]), "initWithName:dataType:requestOnly:extractBlock:", CFSTR("deviceCohortsReported_json"), 5, 1, &__block_literal_global_300_32740);
  v7[0] = v2;
  v7[1] = v3;
  v7[2] = v4;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v7, 3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (id)validKeyPaths
{
  return &unk_1E5F1C600;
}

+ (id)protoFields
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  _QWORD v7[4];

  v7[3] = *MEMORY[0x1E0C80C00];
  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("eventMetadata"), 1, 14, objc_opt_class());
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("deviceSegmentsReported"), 2, 14, objc_opt_class(), v2);
  v7[1] = v3;
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("deviceCohortsReported"), 3, 14, objc_opt_class());
  v7[2] = v4;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v7, 3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

id __46__BMSiriOnDeviceDigestSegmentsCohorts_columns__block_invoke_3(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  void *v4;

  objc_msgSend(a2, "eventBodyKeepingBackingData:", 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_deviceCohortsReportedJSONArray");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  BMConvertObjectToJSONString();
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

id __46__BMSiriOnDeviceDigestSegmentsCohorts_columns__block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  void *v4;

  objc_msgSend(a2, "eventBodyKeepingBackingData:", 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_deviceSegmentsReportedJSONArray");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  BMConvertObjectToJSONString();
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

id __46__BMSiriOnDeviceDigestSegmentsCohorts_columns__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(a2, "eventBodyKeepingBackingData:", 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "eventMetadata");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "jsonDictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  BMConvertObjectToJSONString();
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

@end
