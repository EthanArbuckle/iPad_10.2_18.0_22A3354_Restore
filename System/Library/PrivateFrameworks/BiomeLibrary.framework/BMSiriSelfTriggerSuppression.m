@implementation BMSiriSelfTriggerSuppression

- (BMSiriSelfTriggerSuppression)initWithNumSelfTriggersDetectedDuringEvent:(id)a3 durationOfSelfTriggerEventInSec:(id)a4 audioSource:(int)a5 isBluetoothSpeakerActive:(id)a6 isBuiltInSpeakerActive:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  BMSiriSelfTriggerSuppression *v16;
  unsigned int v17;
  double v18;
  objc_super v20;

  v12 = a3;
  v13 = a4;
  v14 = a6;
  v15 = a7;
  v20.receiver = self;
  v20.super_class = (Class)BMSiriSelfTriggerSuppression;
  v16 = -[BMEventBase init](&v20, sel_init);
  if (v16)
  {
    v16->_dataVersion = objc_msgSend((id)objc_opt_class(), "latestDataVersion");
    if (v12)
    {
      v16->_hasNumSelfTriggersDetectedDuringEvent = 1;
      v17 = objc_msgSend(v12, "unsignedIntValue");
    }
    else
    {
      v17 = 0;
      v16->_hasNumSelfTriggersDetectedDuringEvent = 0;
    }
    v16->_numSelfTriggersDetectedDuringEvent = v17;
    if (v13)
    {
      v16->_hasDurationOfSelfTriggerEventInSec = 1;
      objc_msgSend(v13, "doubleValue");
    }
    else
    {
      v16->_hasDurationOfSelfTriggerEventInSec = 0;
      v18 = -1.0;
    }
    v16->_durationOfSelfTriggerEventInSec = v18;
    v16->_audioSource = a5;
    if (v14)
    {
      v16->_hasIsBluetoothSpeakerActive = 1;
      v16->_isBluetoothSpeakerActive = objc_msgSend(v14, "BOOLValue");
    }
    else
    {
      v16->_hasIsBluetoothSpeakerActive = 0;
      v16->_isBluetoothSpeakerActive = 0;
    }
    if (v15)
    {
      v16->_hasIsBuiltInSpeakerActive = 1;
      v16->_isBuiltInSpeakerActive = objc_msgSend(v15, "BOOLValue");
    }
    else
    {
      v16->_hasIsBuiltInSpeakerActive = 0;
      v16->_isBuiltInSpeakerActive = 0;
    }
  }

  return v16;
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

  v3 = objc_alloc(MEMORY[0x1E0CB3940]);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[BMSiriSelfTriggerSuppression numSelfTriggersDetectedDuringEvent](self, "numSelfTriggersDetectedDuringEvent"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)MEMORY[0x1E0CB37E8];
  -[BMSiriSelfTriggerSuppression durationOfSelfTriggerEventInSec](self, "durationOfSelfTriggerEventInSec");
  objc_msgSend(v5, "numberWithDouble:");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  BMSiriSelfTriggerSuppressionAudioSourceAsString(-[BMSiriSelfTriggerSuppression audioSource](self, "audioSource"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[BMSiriSelfTriggerSuppression isBluetoothSpeakerActive](self, "isBluetoothSpeakerActive"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[BMSiriSelfTriggerSuppression isBuiltInSpeakerActive](self, "isBuiltInSpeakerActive"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("BMSiriSelfTriggerSuppression with numSelfTriggersDetectedDuringEvent: %@, durationOfSelfTriggerEventInSec: %@, audioSource: %@, isBluetoothSpeakerActive: %@, isBuiltInSpeakerActive: %@"), v4, v6, v7, v8, v9);

  return (NSString *)v10;
}

- (id)initByReadFrom:(id)a3
{
  _BYTE *v4;
  BMSiriSelfTriggerSuppression *v5;
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
  BOOL v17;
  int v18;
  char v20;
  unsigned int v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  unint64_t v25;
  char v26;
  uint64_t v27;
  unint64_t v28;
  double v29;
  char v30;
  unsigned int v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  unint64_t v35;
  char v36;
  char v37;
  unsigned int v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  unint64_t v42;
  char v43;
  char v44;
  unsigned int v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  unint64_t v49;
  char v50;
  BOOL v51;
  uint64_t v52;
  BMSiriSelfTriggerSuppression *v53;
  objc_super v55;

  v4 = a3;
  v55.receiver = self;
  v55.super_class = (Class)BMSiriSelfTriggerSuppression;
  v5 = -[BMEventBase init](&v55, sel_init);
  if (!v5)
    goto LABEL_77;
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
        v17 = v11++ >= 9;
        if (v17)
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
          v20 = 0;
          v21 = 0;
          v22 = 0;
          v5->_hasNumSelfTriggersDetectedDuringEvent = 1;
          while (2)
          {
            v23 = *v6;
            v24 = *(_QWORD *)&v4[v23];
            v25 = v24 + 1;
            if (v24 == -1 || v25 > *(_QWORD *)&v4[*v7])
            {
              v4[*v8] = 1;
            }
            else
            {
              v26 = *(_BYTE *)(*(_QWORD *)&v4[*v9] + v24);
              *(_QWORD *)&v4[v23] = v25;
              v22 |= (unint64_t)(v26 & 0x7F) << v20;
              if (v26 < 0)
              {
                v20 += 7;
                v17 = v21++ >= 9;
                if (v17)
                {
                  LODWORD(v22) = 0;
                  goto LABEL_56;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v8])
            LODWORD(v22) = 0;
LABEL_56:
          v5->_numSelfTriggersDetectedDuringEvent = v22;
          continue;
        case 2u:
          v5->_hasDurationOfSelfTriggerEventInSec = 1;
          v27 = *v6;
          v28 = *(_QWORD *)&v4[v27];
          if (v28 <= 0xFFFFFFFFFFFFFFF7 && v28 + 8 <= *(_QWORD *)&v4[*v7])
          {
            v29 = *(double *)(*(_QWORD *)&v4[*v9] + v28);
            *(_QWORD *)&v4[v27] = v28 + 8;
          }
          else
          {
            v4[*v8] = 1;
            v29 = 0.0;
          }
          v5->_durationOfSelfTriggerEventInSec = v29;
          continue;
        case 3u:
          v30 = 0;
          v31 = 0;
          v32 = 0;
          while (2)
          {
            v33 = *v6;
            v34 = *(_QWORD *)&v4[v33];
            v35 = v34 + 1;
            if (v34 == -1 || v35 > *(_QWORD *)&v4[*v7])
            {
              v4[*v8] = 1;
            }
            else
            {
              v36 = *(_BYTE *)(*(_QWORD *)&v4[*v9] + v34);
              *(_QWORD *)&v4[v33] = v35;
              v32 |= (unint64_t)(v36 & 0x7F) << v30;
              if (v36 < 0)
              {
                v30 += 7;
                v17 = v31++ >= 9;
                if (v17)
                {
                  LODWORD(v32) = 0;
                  goto LABEL_60;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v8])
            LODWORD(v32) = 0;
LABEL_60:
          if (v32 >= 3)
            LODWORD(v32) = 0;
          v5->_audioSource = v32;
          continue;
        case 4u:
          v37 = 0;
          v38 = 0;
          v39 = 0;
          v5->_hasIsBluetoothSpeakerActive = 1;
          while (1)
          {
            v40 = *v6;
            v41 = *(_QWORD *)&v4[v40];
            v42 = v41 + 1;
            if (v41 == -1 || v42 > *(_QWORD *)&v4[*v7])
              break;
            v43 = *(_BYTE *)(*(_QWORD *)&v4[*v9] + v41);
            *(_QWORD *)&v4[v40] = v42;
            v39 |= (unint64_t)(v43 & 0x7F) << v37;
            if ((v43 & 0x80) == 0)
              goto LABEL_64;
            v37 += 7;
            v17 = v38++ >= 9;
            if (v17)
            {
              v39 = 0;
              goto LABEL_66;
            }
          }
          v4[*v8] = 1;
LABEL_64:
          if (v4[*v8])
            v39 = 0;
LABEL_66:
          v51 = v39 != 0;
          v52 = 18;
          goto LABEL_71;
        case 5u:
          v44 = 0;
          v45 = 0;
          v46 = 0;
          v5->_hasIsBuiltInSpeakerActive = 1;
          break;
        default:
          if (!PBReaderSkipValueWithTag())
            goto LABEL_76;
          continue;
      }
      while (1)
      {
        v47 = *v6;
        v48 = *(_QWORD *)&v4[v47];
        v49 = v48 + 1;
        if (v48 == -1 || v49 > *(_QWORD *)&v4[*v7])
          break;
        v50 = *(_BYTE *)(*(_QWORD *)&v4[*v9] + v48);
        *(_QWORD *)&v4[v47] = v49;
        v46 |= (unint64_t)(v50 & 0x7F) << v44;
        if ((v50 & 0x80) == 0)
          goto LABEL_68;
        v44 += 7;
        v17 = v45++ >= 9;
        if (v17)
        {
          v46 = 0;
          goto LABEL_70;
        }
      }
      v4[*v8] = 1;
LABEL_68:
      if (v4[*v8])
        v46 = 0;
LABEL_70:
      v51 = v46 != 0;
      v52 = 20;
LABEL_71:
      *((_BYTE *)&v5->super.super.isa + v52) = v51;
    }
    while (*(_QWORD *)&v4[*v6] < *(_QWORD *)&v4[*v7]);
  }
  if (v4[*v8])
LABEL_76:
    v53 = 0;
  else
LABEL_77:
    v53 = v5;

  return v53;
}

- (void)writeTo:(id)a3
{
  id v4;

  v4 = a3;
  if (self->_hasNumSelfTriggersDetectedDuringEvent)
    PBDataWriterWriteUint32Field();
  if (self->_hasDurationOfSelfTriggerEventInSec)
    PBDataWriterWriteDoubleField();
  PBDataWriterWriteUint32Field();
  if (self->_hasIsBluetoothSpeakerActive)
    PBDataWriterWriteBOOLField();
  if (self->_hasIsBuiltInSpeakerActive)
    PBDataWriterWriteBOOLField();

}

- (id)serialize
{
  void *v3;
  void *v4;

  v3 = (void *)objc_opt_new();
  -[BMSiriSelfTriggerSuppression writeTo:](self, "writeTo:", v3);
  objc_msgSend(v3, "immutableData");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (BMSiriSelfTriggerSuppression)initWithJSONDictionary:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  uint64_t v13;
  BMSiriSelfTriggerSuppression *v14;
  id v15;
  uint64_t v16;
  id *v17;
  void *v18;
  id v19;
  void *v20;
  id v21;
  uint64_t v23;
  id v24;
  void *v25;
  void *v26;
  uint64_t v27;
  id v28;
  uint64_t v29;
  id v30;
  id v31;
  id *v32;
  id v33;
  void *v34;
  id v35;
  id v36;
  uint64_t v37;
  void *v38;
  uint64_t v39;
  id v40;
  uint64_t v41;
  id v42;
  uint64_t v43;
  void *v44;
  uint64_t v45;
  _QWORD v46[3];

  v46[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("numSelfTriggersDetectedDuringEvent"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v8 = 0;
LABEL_4:
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("durationOfSelfTriggerEventInSec"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = a4;
    if (v9 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if (!a4)
        {
          v36 = 0;
          v14 = 0;
          goto LABEL_33;
        }
        v15 = objc_alloc(MEMORY[0x1E0CB35C8]);
        v16 = *MEMORY[0x1E0D025B8];
        v43 = *MEMORY[0x1E0CB2D50];
        v34 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), objc_opt_class(), CFSTR("durationOfSelfTriggerEventInSec"));
        v44 = v34;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v44, &v43, 1);
        v17 = a4;
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v36 = 0;
        v14 = 0;
        *v17 = (id)objc_msgSend(v15, "initWithDomain:code:userInfo:", v16, 2, v10);
        goto LABEL_32;
      }
      v36 = v9;
    }
    else
    {
      v36 = 0;
    }
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("audioSource"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v33 = v8;
    if (v10 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v11 = v10;
      }
      else
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          if (!v32)
          {
            v34 = 0;
            v14 = 0;
            goto LABEL_32;
          }
          v35 = objc_alloc(MEMORY[0x1E0CB35C8]);
          v27 = *MEMORY[0x1E0D025B8];
          v41 = *MEMORY[0x1E0CB2D50];
          v19 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber (corresponding to enum value), or NSString (string version of enum)"), objc_opt_class(), CFSTR("audioSource"));
          v42 = v19;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v42, &v41, 1);
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          v28 = (id)objc_msgSend(v35, "initWithDomain:code:userInfo:", v27, 2, v18);
          v34 = 0;
          v14 = 0;
          *v32 = v28;
LABEL_31:

          v8 = v33;
LABEL_32:

          goto LABEL_33;
        }
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", BMSiriSelfTriggerSuppressionAudioSourceFromString(v10));
        v11 = (id)objc_claimAutoreleasedReturnValue();
      }
      v34 = v11;
    }
    else
    {
      v34 = 0;
    }
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("isBluetoothSpeakerActive"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    if (v18 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if (!v32)
        {
          v19 = 0;
          v14 = 0;
          goto LABEL_31;
        }
        v30 = objc_alloc(MEMORY[0x1E0CB35C8]);
        v23 = *MEMORY[0x1E0D025B8];
        v39 = *MEMORY[0x1E0CB2D50];
        v21 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), objc_opt_class(), CFSTR("isBluetoothSpeakerActive"));
        v40 = v21;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v40, &v39, 1);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v24 = (id)objc_msgSend(v30, "initWithDomain:code:userInfo:", v23, 2, v20);
        v14 = 0;
        v19 = 0;
        *v32 = v24;
        goto LABEL_30;
      }
      v19 = v18;
    }
    else
    {
      v19 = 0;
    }
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("isBuiltInSpeakerActive"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    if (v20 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if (v32)
        {
          v31 = objc_alloc(MEMORY[0x1E0CB35C8]);
          v29 = *MEMORY[0x1E0D025B8];
          v37 = *MEMORY[0x1E0CB2D50];
          v25 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), objc_opt_class(), CFSTR("isBuiltInSpeakerActive"));
          v38 = v25;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v38, &v37, 1);
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          *v32 = (id)objc_msgSend(v31, "initWithDomain:code:userInfo:", v29, 2, v26);

        }
        v21 = 0;
        v14 = 0;
        goto LABEL_30;
      }
      v21 = v20;
    }
    else
    {
      v21 = 0;
    }
    v14 = -[BMSiriSelfTriggerSuppression initWithNumSelfTriggersDetectedDuringEvent:durationOfSelfTriggerEventInSec:audioSource:isBluetoothSpeakerActive:isBuiltInSpeakerActive:](self, "initWithNumSelfTriggersDetectedDuringEvent:durationOfSelfTriggerEventInSec:audioSource:isBluetoothSpeakerActive:isBuiltInSpeakerActive:", v33, v36, objc_msgSend(v34, "intValue"), v19, v21);
    self = v14;
LABEL_30:

    goto LABEL_31;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v8 = v7;
    goto LABEL_4;
  }
  if (!a4)
  {
    v8 = 0;
    v14 = 0;
    goto LABEL_34;
  }
  v12 = objc_alloc(MEMORY[0x1E0CB35C8]);
  v13 = *MEMORY[0x1E0D025B8];
  v45 = *MEMORY[0x1E0CB2D50];
  v36 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), objc_opt_class(), CFSTR("numSelfTriggersDetectedDuringEvent"));
  v46[0] = v36;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v46, &v45, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = 0;
  v14 = 0;
  *a4 = (id)objc_msgSend(v12, "initWithDomain:code:userInfo:", v13, 2, v9);
LABEL_33:

LABEL_34:
  return v14;
}

- (id)jsonDictionary
{
  uint64_t v3;
  double v4;
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
  uint64_t v17;
  void *v18;
  _QWORD v19[5];
  _QWORD v20[6];

  v20[5] = *MEMORY[0x1E0C80C00];
  if (-[BMSiriSelfTriggerSuppression hasNumSelfTriggersDetectedDuringEvent](self, "hasNumSelfTriggersDetectedDuringEvent"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[BMSiriSelfTriggerSuppression numSelfTriggersDetectedDuringEvent](self, "numSelfTriggersDetectedDuringEvent"));
    v3 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }
  if (!-[BMSiriSelfTriggerSuppression hasDurationOfSelfTriggerEventInSec](self, "hasDurationOfSelfTriggerEventInSec")
    || (-[BMSiriSelfTriggerSuppression durationOfSelfTriggerEventInSec](self, "durationOfSelfTriggerEventInSec"),
        fabs(v4) == INFINITY))
  {
    v6 = 0;
  }
  else
  {
    -[BMSiriSelfTriggerSuppression durationOfSelfTriggerEventInSec](self, "durationOfSelfTriggerEventInSec");
    v5 = (void *)MEMORY[0x1E0CB37E8];
    -[BMSiriSelfTriggerSuppression durationOfSelfTriggerEventInSec](self, "durationOfSelfTriggerEventInSec");
    objc_msgSend(v5, "numberWithDouble:");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[BMSiriSelfTriggerSuppression audioSource](self, "audioSource"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[BMSiriSelfTriggerSuppression hasIsBluetoothSpeakerActive](self, "hasIsBluetoothSpeakerActive"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[BMSiriSelfTriggerSuppression isBluetoothSpeakerActive](self, "isBluetoothSpeakerActive"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v8 = 0;
  }
  if (-[BMSiriSelfTriggerSuppression hasIsBuiltInSpeakerActive](self, "hasIsBuiltInSpeakerActive"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[BMSiriSelfTriggerSuppression isBuiltInSpeakerActive](self, "isBuiltInSpeakerActive"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v9 = 0;
  }
  v17 = v3;
  v19[0] = CFSTR("numSelfTriggersDetectedDuringEvent");
  v10 = (void *)v3;
  if (!v3)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v20[0] = v10;
  v19[1] = CFSTR("durationOfSelfTriggerEventInSec");
  v11 = v6;
  if (!v6)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v20[1] = v11;
  v19[2] = CFSTR("audioSource");
  v12 = v7;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v20[2] = v12;
  v19[3] = CFSTR("isBluetoothSpeakerActive");
  v13 = v8;
  if (!v8)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v20[3] = v13;
  v19[4] = CFSTR("isBuiltInSpeakerActive");
  v14 = v9;
  if (!v9)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v20[4] = v14;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v20, v19, 5, v17);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    if (v8)
      goto LABEL_26;
  }
  else
  {

    if (v8)
    {
LABEL_26:
      if (v7)
        goto LABEL_27;
LABEL_33:

      if (v6)
        goto LABEL_28;
      goto LABEL_34;
    }
  }

  if (!v7)
    goto LABEL_33;
LABEL_27:
  if (v6)
    goto LABEL_28;
LABEL_34:

LABEL_28:
  if (!v18)

  return v15;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  id v5;
  unsigned int v6;
  double v7;
  double v8;
  double v9;
  int v10;
  int v11;
  _BOOL4 v12;
  int v13;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    if (-[BMSiriSelfTriggerSuppression hasNumSelfTriggersDetectedDuringEvent](self, "hasNumSelfTriggersDetectedDuringEvent")|| objc_msgSend(v5, "hasNumSelfTriggersDetectedDuringEvent"))
    {
      if (!-[BMSiriSelfTriggerSuppression hasNumSelfTriggersDetectedDuringEvent](self, "hasNumSelfTriggersDetectedDuringEvent"))goto LABEL_24;
      if (!objc_msgSend(v5, "hasNumSelfTriggersDetectedDuringEvent"))
        goto LABEL_24;
      v6 = -[BMSiriSelfTriggerSuppression numSelfTriggersDetectedDuringEvent](self, "numSelfTriggersDetectedDuringEvent");
      if (v6 != objc_msgSend(v5, "numSelfTriggersDetectedDuringEvent"))
        goto LABEL_24;
    }
    if (-[BMSiriSelfTriggerSuppression hasDurationOfSelfTriggerEventInSec](self, "hasDurationOfSelfTriggerEventInSec")
      || objc_msgSend(v5, "hasDurationOfSelfTriggerEventInSec"))
    {
      if (!-[BMSiriSelfTriggerSuppression hasDurationOfSelfTriggerEventInSec](self, "hasDurationOfSelfTriggerEventInSec"))goto LABEL_24;
      if (!objc_msgSend(v5, "hasDurationOfSelfTriggerEventInSec"))
        goto LABEL_24;
      -[BMSiriSelfTriggerSuppression durationOfSelfTriggerEventInSec](self, "durationOfSelfTriggerEventInSec");
      v8 = v7;
      objc_msgSend(v5, "durationOfSelfTriggerEventInSec");
      if (v8 != v9)
        goto LABEL_24;
    }
    v10 = -[BMSiriSelfTriggerSuppression audioSource](self, "audioSource");
    if (v10 != objc_msgSend(v5, "audioSource"))
      goto LABEL_24;
    if (-[BMSiriSelfTriggerSuppression hasIsBluetoothSpeakerActive](self, "hasIsBluetoothSpeakerActive")
      || objc_msgSend(v5, "hasIsBluetoothSpeakerActive"))
    {
      if (!-[BMSiriSelfTriggerSuppression hasIsBluetoothSpeakerActive](self, "hasIsBluetoothSpeakerActive"))
        goto LABEL_24;
      if (!objc_msgSend(v5, "hasIsBluetoothSpeakerActive"))
        goto LABEL_24;
      v11 = -[BMSiriSelfTriggerSuppression isBluetoothSpeakerActive](self, "isBluetoothSpeakerActive");
      if (v11 != objc_msgSend(v5, "isBluetoothSpeakerActive"))
        goto LABEL_24;
    }
    if (!-[BMSiriSelfTriggerSuppression hasIsBuiltInSpeakerActive](self, "hasIsBuiltInSpeakerActive")
      && !objc_msgSend(v5, "hasIsBuiltInSpeakerActive"))
    {
      LOBYTE(v13) = 1;
      goto LABEL_25;
    }
    if (-[BMSiriSelfTriggerSuppression hasIsBuiltInSpeakerActive](self, "hasIsBuiltInSpeakerActive")
      && objc_msgSend(v5, "hasIsBuiltInSpeakerActive"))
    {
      v12 = -[BMSiriSelfTriggerSuppression isBuiltInSpeakerActive](self, "isBuiltInSpeakerActive");
      v13 = v12 ^ objc_msgSend(v5, "isBuiltInSpeakerActive") ^ 1;
    }
    else
    {
LABEL_24:
      LOBYTE(v13) = 0;
    }
LABEL_25:

    goto LABEL_26;
  }
  LOBYTE(v13) = 0;
LABEL_26:

  return v13;
}

- (unsigned)dataVersion
{
  return self->_dataVersion;
}

- (unsigned)numSelfTriggersDetectedDuringEvent
{
  return self->_numSelfTriggersDetectedDuringEvent;
}

- (BOOL)hasNumSelfTriggersDetectedDuringEvent
{
  return self->_hasNumSelfTriggersDetectedDuringEvent;
}

- (void)setHasNumSelfTriggersDetectedDuringEvent:(BOOL)a3
{
  self->_hasNumSelfTriggersDetectedDuringEvent = a3;
}

- (double)durationOfSelfTriggerEventInSec
{
  return self->_durationOfSelfTriggerEventInSec;
}

- (BOOL)hasDurationOfSelfTriggerEventInSec
{
  return self->_hasDurationOfSelfTriggerEventInSec;
}

- (void)setHasDurationOfSelfTriggerEventInSec:(BOOL)a3
{
  self->_hasDurationOfSelfTriggerEventInSec = a3;
}

- (int)audioSource
{
  return self->_audioSource;
}

- (BOOL)isBluetoothSpeakerActive
{
  return self->_isBluetoothSpeakerActive;
}

- (BOOL)hasIsBluetoothSpeakerActive
{
  return self->_hasIsBluetoothSpeakerActive;
}

- (void)setHasIsBluetoothSpeakerActive:(BOOL)a3
{
  self->_hasIsBluetoothSpeakerActive = a3;
}

- (BOOL)isBuiltInSpeakerActive
{
  return self->_isBuiltInSpeakerActive;
}

- (BOOL)hasIsBuiltInSpeakerActive
{
  return self->_hasIsBuiltInSpeakerActive;
}

- (void)setHasIsBuiltInSpeakerActive:(BOOL)a3
{
  self->_hasIsBuiltInSpeakerActive = a3;
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

    v4 = -[BMSiriSelfTriggerSuppression initByReadFrom:]([BMSiriSelfTriggerSuppression alloc], "initByReadFrom:", v7);
    v4[6] = 0;

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
  _QWORD v9[6];

  v9[5] = *MEMORY[0x1E0C80C00];
  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("numSelfTriggersDetectedDuringEvent"), 0, 0, 1, 4, 0);
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("durationOfSelfTriggerEventInSec"), 1, 0, 2, 0, 0);
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("audioSource"), 0, 0, 3, 4, 0);
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("isBluetoothSpeakerActive"), 0, 0, 4, 12, 0);
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("isBuiltInSpeakerActive"), 0, 0, 5, 12, 0);
  v9[0] = v2;
  v9[1] = v3;
  v9[2] = v4;
  v9[3] = v5;
  v9[4] = v6;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v9, 5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

+ (id)validKeyPaths
{
  return &unk_1E5F1F5A0;
}

+ (id)protoFields
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v9[6];

  v9[5] = *MEMORY[0x1E0C80C00];
  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("numSelfTriggersDetectedDuringEvent"), 1, 4, 0);
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("durationOfSelfTriggerEventInSec"), 2, 0, 0, v2);
  v9[1] = v3;
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("audioSource"), 3, 4, 0);
  v9[2] = v4;
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("isBluetoothSpeakerActive"), 4, 12, 0);
  v9[3] = v5;
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("isBuiltInSpeakerActive"), 5, 12, 0);
  v9[4] = v6;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v9, 5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

@end
