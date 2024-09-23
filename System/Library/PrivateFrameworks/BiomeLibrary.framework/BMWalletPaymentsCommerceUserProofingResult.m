@implementation BMWalletPaymentsCommerceUserProofingResult

- (BMWalletPaymentsCommerceUserProofingResult)initWithAbsoluteTimestamp:(id)a3 age:(id)a4 gender:(id)a5 skinTone:(id)a6 ethnicity:(id)a7 deviceLanguage:(id)a8 proofingDecision:(id)a9 issuer:(id)a10 livenessAssessment:(id)a11 gestureAssessment:(id)a12 axSettings:(id)a13 facVersion:(id)a14 facePoseVersion:(id)a15 padtoolVersion:(id)a16 prdVersion:(id)a17 didStepUp:(id)a18 passiveGestureAssessment:(id)a19 passiveLivenessAssessment:(id)a20 passiveLivenessFacVersion:(id)a21 passiveLivenessFacePoseVersion:(id)a22 passiveLivenessPadtoolVersion:(id)a23 passiveLivenessPrdVersion:(id)a24
{
  void *v29;
  id v30;
  id v31;
  id v32;
  id v33;
  id v34;
  id v35;
  id v36;
  BMWalletPaymentsCommerceUserProofingResult *v37;
  double v38;
  id obj;
  id v41;
  id v42;
  id v43;
  id v44;
  id v46;
  id v47;
  id v48;
  id v49;
  id v50;
  id v51;
  id v52;
  id v53;
  id v54;
  id v55;
  id v56;
  id v57;
  id v58;
  id v59;
  objc_super v60;

  v44 = a3;
  obj = a4;
  v59 = a4;
  v41 = a5;
  v58 = a5;
  v42 = a6;
  v57 = a6;
  v43 = a7;
  v56 = a7;
  v55 = a8;
  v54 = a9;
  v53 = a10;
  v52 = a11;
  v51 = a12;
  v50 = a13;
  v49 = a14;
  v29 = v44;
  v48 = a15;
  v47 = a16;
  v46 = a17;
  v30 = a18;
  v31 = a19;
  v32 = a20;
  v33 = a21;
  v34 = a22;
  v35 = a23;
  v36 = a24;
  v60.receiver = self;
  v60.super_class = (Class)BMWalletPaymentsCommerceUserProofingResult;
  v37 = -[BMEventBase init](&v60, sel_init);
  if (v37)
  {
    v37->_dataVersion = objc_msgSend((id)objc_opt_class(), "latestDataVersion");
    if (v44)
    {
      v37->_hasRaw_absoluteTimestamp = 1;
      objc_msgSend(v44, "timeIntervalSinceReferenceDate");
    }
    else
    {
      v29 = 0;
      v37->_hasRaw_absoluteTimestamp = 0;
      v38 = -1.0;
    }
    v37->_raw_absoluteTimestamp = v38;
    objc_storeStrong((id *)&v37->_age, obj);
    objc_storeStrong((id *)&v37->_gender, v41);
    objc_storeStrong((id *)&v37->_skinTone, v42);
    objc_storeStrong((id *)&v37->_ethnicity, v43);
    objc_storeStrong((id *)&v37->_deviceLanguage, a8);
    objc_storeStrong((id *)&v37->_proofingDecision, a9);
    objc_storeStrong((id *)&v37->_issuer, a10);
    objc_storeStrong((id *)&v37->_livenessAssessment, a11);
    objc_storeStrong((id *)&v37->_gestureAssessment, a12);
    objc_storeStrong((id *)&v37->_axSettings, a13);
    objc_storeStrong((id *)&v37->_facVersion, a14);
    objc_storeStrong((id *)&v37->_facePoseVersion, a15);
    objc_storeStrong((id *)&v37->_padtoolVersion, a16);
    objc_storeStrong((id *)&v37->_prdVersion, a17);
    if (v30)
    {
      v37->_hasDidStepUp = 1;
      v37->_didStepUp = objc_msgSend(v30, "BOOLValue");
    }
    else
    {
      v37->_hasDidStepUp = 0;
      v37->_didStepUp = 0;
    }
    objc_storeStrong((id *)&v37->_passiveGestureAssessment, a19);
    objc_storeStrong((id *)&v37->_passiveLivenessAssessment, a20);
    objc_storeStrong((id *)&v37->_passiveLivenessFacVersion, a21);
    objc_storeStrong((id *)&v37->_passiveLivenessFacePoseVersion, a22);
    objc_storeStrong((id *)&v37->_passiveLivenessPadtoolVersion, a23);
    objc_storeStrong((id *)&v37->_passiveLivenessPrdVersion, a24);
  }

  return v37;
}

- (NSString)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;

  v18 = objc_alloc(MEMORY[0x1E0CB3940]);
  -[BMWalletPaymentsCommerceUserProofingResult absoluteTimestamp](self, "absoluteTimestamp");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMWalletPaymentsCommerceUserProofingResult age](self, "age");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMWalletPaymentsCommerceUserProofingResult gender](self, "gender");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMWalletPaymentsCommerceUserProofingResult skinTone](self, "skinTone");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMWalletPaymentsCommerceUserProofingResult ethnicity](self, "ethnicity");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMWalletPaymentsCommerceUserProofingResult deviceLanguage](self, "deviceLanguage");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMWalletPaymentsCommerceUserProofingResult proofingDecision](self, "proofingDecision");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMWalletPaymentsCommerceUserProofingResult issuer](self, "issuer");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMWalletPaymentsCommerceUserProofingResult livenessAssessment](self, "livenessAssessment");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMWalletPaymentsCommerceUserProofingResult gestureAssessment](self, "gestureAssessment");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMWalletPaymentsCommerceUserProofingResult axSettings](self, "axSettings");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMWalletPaymentsCommerceUserProofingResult facVersion](self, "facVersion");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMWalletPaymentsCommerceUserProofingResult facePoseVersion](self, "facePoseVersion");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMWalletPaymentsCommerceUserProofingResult padtoolVersion](self, "padtoolVersion");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMWalletPaymentsCommerceUserProofingResult prdVersion](self, "prdVersion");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[BMWalletPaymentsCommerceUserProofingResult didStepUp](self, "didStepUp"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMWalletPaymentsCommerceUserProofingResult passiveGestureAssessment](self, "passiveGestureAssessment");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMWalletPaymentsCommerceUserProofingResult passiveLivenessAssessment](self, "passiveLivenessAssessment");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMWalletPaymentsCommerceUserProofingResult passiveLivenessFacVersion](self, "passiveLivenessFacVersion");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMWalletPaymentsCommerceUserProofingResult passiveLivenessFacePoseVersion](self, "passiveLivenessFacePoseVersion");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMWalletPaymentsCommerceUserProofingResult passiveLivenessPadtoolVersion](self, "passiveLivenessPadtoolVersion");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMWalletPaymentsCommerceUserProofingResult passiveLivenessPrdVersion](self, "passiveLivenessPrdVersion");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = (void *)objc_msgSend(v18, "initWithFormat:", CFSTR("BMWalletPaymentsCommerceUserProofingResult with absoluteTimestamp: %@, age: %@, gender: %@, skinTone: %@, ethnicity: %@, deviceLanguage: %@, proofingDecision: %@, issuer: %@, livenessAssessment: %@, gestureAssessment: %@, axSettings: %@, facVersion: %@, facePoseVersion: %@, padtoolVersion: %@, prdVersion: %@, didStepUp: %@, passiveGestureAssessment: %@, passiveLivenessAssessment: %@, passiveLivenessFacVersion: %@, passiveLivenessFacePoseVersion: %@, passiveLivenessPadtoolVersion: %@, passiveLivenessPrdVersion: %@"), v24, v27, v22, v26, v17, v25, v23, v21, v16, v20, v15, v13, v14, v12, v11, v10,
                  v3,
                  v4,
                  v5,
                  v6,
                  v7,
                  v8);

  return (NSString *)v19;
}

- (id)initByReadFrom:(id)a3
{
  _BYTE *v4;
  BMWalletPaymentsCommerceUserProofingResult *v5;
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
  uint64_t v21;
  unint64_t v22;
  double v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  char v28;
  unsigned int v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  unint64_t v33;
  char v34;
  void *v35;
  uint64_t v36;
  NSArray *axSettings;
  int v38;
  BMWalletPaymentsCommerceUserProofingResult *v39;
  objc_super v41;

  v4 = a3;
  v41.receiver = self;
  v41.super_class = (Class)BMWalletPaymentsCommerceUserProofingResult;
  v5 = -[BMEventBase init](&v41, sel_init);
  if (!v5)
    goto LABEL_64;
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
          v5->_hasRaw_absoluteTimestamp = 1;
          v21 = *v7;
          v22 = *(_QWORD *)&v4[v21];
          if (v22 <= 0xFFFFFFFFFFFFFFF7 && v22 + 8 <= *(_QWORD *)&v4[*v8])
          {
            v23 = *(double *)(*(_QWORD *)&v4[*v10] + v22);
            *(_QWORD *)&v4[v21] = v22 + 8;
          }
          else
          {
            v4[*v9] = 1;
            v23 = 0.0;
          }
          v5->_raw_absoluteTimestamp = v23;
          continue;
        case 2u:
          PBReaderReadString();
          v24 = objc_claimAutoreleasedReturnValue();
          v25 = 40;
          goto LABEL_53;
        case 3u:
          PBReaderReadString();
          v24 = objc_claimAutoreleasedReturnValue();
          v25 = 48;
          goto LABEL_53;
        case 4u:
          PBReaderReadString();
          v24 = objc_claimAutoreleasedReturnValue();
          v25 = 56;
          goto LABEL_53;
        case 5u:
          PBReaderReadString();
          v24 = objc_claimAutoreleasedReturnValue();
          v25 = 64;
          goto LABEL_53;
        case 6u:
          PBReaderReadString();
          v24 = objc_claimAutoreleasedReturnValue();
          v25 = 72;
          goto LABEL_53;
        case 7u:
          PBReaderReadString();
          v24 = objc_claimAutoreleasedReturnValue();
          v25 = 80;
          goto LABEL_53;
        case 8u:
          PBReaderReadString();
          v24 = objc_claimAutoreleasedReturnValue();
          v25 = 88;
          goto LABEL_53;
        case 9u:
          PBReaderReadString();
          v24 = objc_claimAutoreleasedReturnValue();
          v25 = 96;
          goto LABEL_53;
        case 0xAu:
          PBReaderReadString();
          v24 = objc_claimAutoreleasedReturnValue();
          v25 = 104;
          goto LABEL_53;
        case 0xBu:
          PBReaderReadString();
          v26 = objc_claimAutoreleasedReturnValue();
          if (!v26)
            goto LABEL_66;
          v27 = (void *)v26;
          objc_msgSend(v6, "addObject:", v26);

          continue;
        case 0xCu:
          PBReaderReadString();
          v24 = objc_claimAutoreleasedReturnValue();
          v25 = 120;
          goto LABEL_53;
        case 0xDu:
          PBReaderReadString();
          v24 = objc_claimAutoreleasedReturnValue();
          v25 = 128;
          goto LABEL_53;
        case 0xEu:
          PBReaderReadString();
          v24 = objc_claimAutoreleasedReturnValue();
          v25 = 136;
          goto LABEL_53;
        case 0xFu:
          PBReaderReadString();
          v24 = objc_claimAutoreleasedReturnValue();
          v25 = 144;
          goto LABEL_53;
        case 0x10u:
          v28 = 0;
          v29 = 0;
          v30 = 0;
          v5->_hasDidStepUp = 1;
          break;
        case 0x11u:
          PBReaderReadString();
          v24 = objc_claimAutoreleasedReturnValue();
          v25 = 152;
          goto LABEL_53;
        case 0x12u:
          PBReaderReadString();
          v24 = objc_claimAutoreleasedReturnValue();
          v25 = 160;
          goto LABEL_53;
        case 0x13u:
          PBReaderReadString();
          v24 = objc_claimAutoreleasedReturnValue();
          v25 = 168;
          goto LABEL_53;
        case 0x14u:
          PBReaderReadString();
          v24 = objc_claimAutoreleasedReturnValue();
          v25 = 176;
          goto LABEL_53;
        case 0x15u:
          PBReaderReadString();
          v24 = objc_claimAutoreleasedReturnValue();
          v25 = 184;
          goto LABEL_53;
        case 0x16u:
          PBReaderReadString();
          v24 = objc_claimAutoreleasedReturnValue();
          v25 = 192;
LABEL_53:
          v35 = *(Class *)((char *)&v5->super.super.isa + v25);
          *(Class *)((char *)&v5->super.super.isa + v25) = (Class)v24;

          continue;
        default:
          if (PBReaderSkipValueWithTag())
            continue;
LABEL_66:

          goto LABEL_63;
      }
      while (1)
      {
        v31 = *v7;
        v32 = *(_QWORD *)&v4[v31];
        v33 = v32 + 1;
        if (v32 == -1 || v33 > *(_QWORD *)&v4[*v8])
          break;
        v34 = *(_BYTE *)(*(_QWORD *)&v4[*v10] + v32);
        *(_QWORD *)&v4[v31] = v33;
        v30 |= (unint64_t)(v34 & 0x7F) << v28;
        if ((v34 & 0x80) == 0)
          goto LABEL_57;
        v28 += 7;
        v18 = v29++ >= 9;
        if (v18)
        {
          v30 = 0;
          goto LABEL_59;
        }
      }
      v4[*v9] = 1;
LABEL_57:
      if (v4[*v9])
        v30 = 0;
LABEL_59:
      v5->_didStepUp = v30 != 0;
    }
    while (*(_QWORD *)&v4[*v7] < *(_QWORD *)&v4[*v8]);
  }
  v36 = objc_msgSend(v6, "copy");
  axSettings = v5->_axSettings;
  v5->_axSettings = (NSArray *)v36;

  v38 = v4[*v9];
  if (v38)
LABEL_63:
    v39 = 0;
  else
LABEL_64:
    v39 = v5;

  return v39;
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
  if (self->_hasRaw_absoluteTimestamp)
    PBDataWriterWriteDoubleField();
  if (self->_age)
    PBDataWriterWriteStringField();
  if (self->_gender)
    PBDataWriterWriteStringField();
  if (self->_skinTone)
    PBDataWriterWriteStringField();
  if (self->_ethnicity)
    PBDataWriterWriteStringField();
  if (self->_deviceLanguage)
    PBDataWriterWriteStringField();
  if (self->_proofingDecision)
    PBDataWriterWriteStringField();
  if (self->_issuer)
    PBDataWriterWriteStringField();
  if (self->_livenessAssessment)
    PBDataWriterWriteStringField();
  if (self->_gestureAssessment)
    PBDataWriterWriteStringField();
  v12 = 0u;
  v13 = 0u;
  v10 = 0u;
  v11 = 0u;
  v5 = self->_axSettings;
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

  if (self->_facVersion)
    PBDataWriterWriteStringField();
  if (self->_facePoseVersion)
    PBDataWriterWriteStringField();
  if (self->_padtoolVersion)
    PBDataWriterWriteStringField();
  if (self->_prdVersion)
    PBDataWriterWriteStringField();
  if (self->_hasDidStepUp)
    PBDataWriterWriteBOOLField();
  if (self->_passiveGestureAssessment)
    PBDataWriterWriteStringField();
  if (self->_passiveLivenessAssessment)
    PBDataWriterWriteStringField();
  if (self->_passiveLivenessFacVersion)
    PBDataWriterWriteStringField();
  if (self->_passiveLivenessFacePoseVersion)
    PBDataWriterWriteStringField();
  if (self->_passiveLivenessPadtoolVersion)
    PBDataWriterWriteStringField();
  if (self->_passiveLivenessPrdVersion)
    PBDataWriterWriteStringField();

}

- (id)serialize
{
  void *v3;
  void *v4;

  v3 = (void *)objc_opt_new();
  -[BMWalletPaymentsCommerceUserProofingResult writeTo:](self, "writeTo:", v3);
  objc_msgSend(v3, "immutableData");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (BMWalletPaymentsCommerceUserProofingResult)initWithJSONDictionary:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  BMWalletPaymentsCommerceUserProofingResult *v11;
  void *v12;
  void *v13;
  id *v14;
  id v15;
  void *v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id *v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  void *v27;
  void *v28;
  void *v29;
  int v30;
  _QWORD *v31;
  id v32;
  uint64_t v33;
  id *v34;
  id v35;
  BMWalletPaymentsCommerceUserProofingResult *v36;
  id v37;
  id v38;
  uint64_t v39;
  void *v40;
  id v41;
  void *v42;
  uint64_t v43;
  id v44;
  void *v45;
  id v46;
  id v47;
  uint64_t v48;
  void *v49;
  id v50;
  void *v51;
  uint64_t v52;
  void *v53;
  uint64_t v54;
  void *v55;
  id v56;
  id v57;
  uint64_t v58;
  void *v59;
  id v60;
  void *v61;
  uint64_t v62;
  id *v63;
  uint64_t v64;
  void *v65;
  uint64_t v66;
  BMWalletPaymentsCommerceUserProofingResult *v67;
  void *v68;
  void *v69;
  id *v70;
  void *v71;
  id v72;
  uint64_t v73;
  id v74;
  void *v75;
  uint64_t v76;
  void *v77;
  uint64_t v78;
  id v79;
  id v80;
  uint64_t v81;
  id v82;
  void *v83;
  uint64_t v84;
  uint64_t v85;
  id *v86;
  void *v87;
  id v88;
  id v89;
  uint64_t v90;
  void *v91;
  id v92;
  void *v93;
  uint64_t v94;
  void *v95;
  uint64_t v96;
  id v97;
  id v98;
  uint64_t v99;
  void *v100;
  id v101;
  void *v102;
  uint64_t v103;
  uint64_t v104;
  void *v105;
  uint64_t v106;
  id v107;
  uint64_t v108;
  uint64_t v109;
  uint64_t v110;
  uint64_t v111;
  uint64_t v112;
  uint64_t v113;
  uint64_t v114;
  void *v115;
  id v116;
  uint64_t v117;
  void *v118;
  id v119;
  uint64_t v120;
  uint64_t v121;
  void *v122;
  uint64_t v123;
  id v124;
  uint64_t v125;
  id v126;
  uint64_t v127;
  id v128;
  id v129;
  uint64_t v130;
  uint64_t v131;
  void *v132;
  uint64_t v133;
  void *v134;
  uint64_t v135;
  void *v136;
  uint64_t v137;
  void *v138;
  uint64_t v139;
  void *v140;
  uint64_t v141;
  void *v142;
  id v143;
  id v144;
  id v145;
  uint64_t v146;
  uint64_t v147;
  void *v148;
  id v149;
  uint64_t v150;
  uint64_t v151;
  void *v152;
  id v153;
  uint64_t v154;
  uint64_t v155;
  void *v156;
  uint64_t v157;
  void *v158;
  uint64_t v159;
  void *v160;
  id v161;
  void *v162;
  id v163;
  uint64_t v164;
  uint64_t v165;
  void *v166;
  id v167;
  uint64_t v168;
  uint64_t v169;
  void *v170;
  id v171;
  uint64_t v172;
  uint64_t v173;
  void *v174;
  id v175;
  uint64_t v176;
  uint64_t v177;
  void *v178;
  id v179;
  uint64_t v180;
  uint64_t v181;
  void *v182;
  id v183;
  uint64_t v184;
  uint64_t v185;
  void *v186;
  id v187;
  uint64_t v188;
  uint64_t v189;
  void *v190;
  id v191;
  uint64_t v192;
  void *v193;
  void *v194;
  void *v195;
  uint64_t v196;
  uint64_t v198;
  uint64_t v199;
  uint64_t v200;
  uint64_t v201;
  uint64_t v202;
  uint64_t v203;
  uint64_t v204;
  id v205;
  void *v206;
  void *v207;
  void *v208;
  void *v209;
  id v210;
  void *v211;
  void *v212;
  id v213;
  void *v214;
  void *v215;
  void *v216;
  id v217;
  void *v218;
  id v219;
  void *v220;
  void *v221;
  id v222;
  void *v223;
  void *v224;
  id v225;
  void *v226;
  void *v227;
  id v228;
  id v229;
  id *v230;
  id *v231;
  _QWORD *v232;
  void *v233;
  id v234;
  id v235;
  void *v236;
  void *v237;
  id v238;
  void *v239;
  id v240;
  void *v241;
  BMWalletPaymentsCommerceUserProofingResult *v242;
  id v243;
  id obj;
  id v245;
  void *v246;
  id v247;
  id v248;
  id *v249;
  void *v250;
  id v251;
  void *v252;
  id v253;
  void *v254;
  void *v255;
  void *v256;
  void *v257;
  __int128 v258;
  __int128 v259;
  __int128 v260;
  __int128 v261;
  uint64_t v262;
  void *v263;
  uint64_t v264;
  void *v265;
  uint64_t v266;
  id v267;
  uint64_t v268;
  id v269;
  uint64_t v270;
  void *v271;
  uint64_t v272;
  void *v273;
  uint64_t v274;
  id v275;
  uint64_t v276;
  id v277;
  uint64_t v278;
  id v279;
  uint64_t v280;
  id v281;
  uint64_t v282;
  id v283;
  uint64_t v284;
  void *v285;
  uint64_t v286;
  void *v287;
  _BYTE v288[128];
  uint64_t v289;
  void *v290;
  uint64_t v291;
  id v292;
  uint64_t v293;
  uint64_t v294;
  uint64_t v295;
  id v296;
  uint64_t v297;
  id v298;
  uint64_t v299;
  id v300;
  uint64_t v301;
  uint64_t v302;
  uint64_t v303;
  id v304;
  uint64_t v305;
  id v306;
  uint64_t v307;
  id *v308;
  uint64_t v309;
  _QWORD v310[3];

  v310[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("absoluteTimestamp"));
  v256 = (void *)objc_claimAutoreleasedReturnValue();
  v257 = v6;
  if (!v256 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v253 = 0;
    goto LABEL_4;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v17 = v256;
    v18 = objc_alloc(MEMORY[0x1E0C99D68]);
    objc_msgSend(v17, "doubleValue");
    v253 = (id)objc_msgSend(v18, "initWithTimeIntervalSinceReferenceDate:");

    goto LABEL_4;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v19 = objc_alloc_init(MEMORY[0x1E0CB36A8]);
    v20 = v256;
    objc_msgSend(v19, "dateFromString:", v20);
    v253 = (id)objc_claimAutoreleasedReturnValue();

    goto LABEL_4;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v253 = v256;
LABEL_4:
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("age"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      v8 = 0;
      goto LABEL_7;
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v8 = v7;
LABEL_7:
      objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("gender"));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v9 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
      {
        v249 = 0;
        goto LABEL_10;
      }
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v249 = v9;
LABEL_10:
        objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("skinTone"));
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v252 = v10;
        v11 = self;
        if (!v10 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
        {
          v251 = 0;
LABEL_13:
          objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("ethnicity"));
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          if (v12 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
          {
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) == 0)
            {
              if (!a4)
              {
                v248 = 0;
                v36 = 0;
                v55 = v12;
                self = v11;
                goto LABEL_227;
              }
              v237 = v9;
              v56 = objc_alloc(MEMORY[0x1E0CB35C8]);
              v57 = v8;
              v58 = *MEMORY[0x1E0D025B8];
              v301 = *MEMORY[0x1E0CB2D50];
              v59 = v7;
              v60 = objc_alloc(MEMORY[0x1E0CB3940]);
              v55 = v12;
              v200 = objc_opt_class();
              v61 = v60;
              v7 = v59;
              v62 = objc_msgSend(v61, "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSString"), v200, CFSTR("ethnicity"));
              v302 = v62;
              objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v302, &v301, 1);
              v63 = a4;
              v64 = objc_claimAutoreleasedReturnValue();
              v65 = v56;
              v9 = v237;
              v66 = v58;
              v8 = v57;
              v248 = 0;
              v36 = 0;
              *v63 = (id)objc_msgSend(v65, "initWithDomain:code:userInfo:", v66, 2, v64);
              v10 = v252;
              v67 = v11;
              v68 = (void *)v64;
              v69 = (void *)v62;
              self = v67;
              goto LABEL_110;
            }
            v13 = v7;
            v14 = a4;
            v246 = v12;
            v248 = v12;
          }
          else
          {
            v13 = v7;
            v14 = a4;
            v246 = v12;
            v248 = 0;
          }
          objc_msgSend(v257, "objectForKeyedSubscript:", CFSTR("deviceLanguage"));
          v15 = (id)objc_claimAutoreleasedReturnValue();
          self = v11;
          v247 = v15;
          if (!v15)
            goto LABEL_33;
          v16 = v15;
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v15 = 0;
            goto LABEL_33;
          }
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v15 = v16;
LABEL_33:
            v243 = v15;
            objc_msgSend(v257, "objectForKeyedSubscript:", CFSTR("proofingDecision"));
            v250 = (void *)objc_claimAutoreleasedReturnValue();
            v242 = v11;
            if (v250)
            {
              objc_opt_class();
              v21 = v14;
              if ((objc_opt_isKindOfClass() & 1) == 0)
              {
                objc_opt_class();
                v7 = v13;
                if ((objc_opt_isKindOfClass() & 1) == 0)
                {
                  if (!v21)
                  {
                    v245 = 0;
                    v36 = 0;
                    v55 = v246;
                    v68 = v247;
                    v6 = v257;
                    v69 = v243;
                    goto LABEL_225;
                  }
                  v79 = objc_alloc(MEMORY[0x1E0CB35C8]);
                  v80 = v8;
                  v81 = *MEMORY[0x1E0D025B8];
                  v297 = *MEMORY[0x1E0CB2D50];
                  v82 = objc_alloc(MEMORY[0x1E0CB3940]);
                  v202 = objc_opt_class();
                  v83 = v82;
                  v7 = v13;
                  v240 = (id)objc_msgSend(v83, "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSString"), v202, CFSTR("proofingDecision"));
                  v298 = v240;
                  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v298, &v297, 1);
                  v84 = objc_claimAutoreleasedReturnValue();
                  v85 = v81;
                  v8 = v80;
                  v241 = (void *)v84;
                  v245 = 0;
                  v36 = 0;
                  *v21 = (id)objc_msgSend(v79, "initWithDomain:code:userInfo:", v85, 2);
                  goto LABEL_120;
                }
                v245 = v250;
LABEL_38:
                v6 = v257;
                objc_msgSend(v257, "objectForKeyedSubscript:", CFSTR("issuer"));
                v22 = objc_claimAutoreleasedReturnValue();
                v241 = (void *)v22;
                if (!v22 || (v23 = (void *)v22, objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
                {
                  v240 = 0;
                  goto LABEL_41;
                }
                objc_opt_class();
                if ((objc_opt_isKindOfClass() & 1) != 0)
                {
                  v240 = v23;
                  v6 = v257;
LABEL_41:
                  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("livenessAssessment"));
                  v24 = objc_claimAutoreleasedReturnValue();
                  v239 = (void *)v24;
                  if (!v24 || (v25 = (void *)v24, objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
                  {
                    v238 = 0;
                    goto LABEL_44;
                  }
                  objc_opt_class();
                  if ((objc_opt_isKindOfClass() & 1) != 0)
                  {
                    v238 = v25;
                    v6 = v257;
LABEL_44:
                    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("gestureAssessment"));
                    v26 = objc_claimAutoreleasedReturnValue();
                    v234 = v8;
                    v236 = v9;
                    v233 = (void *)v26;
                    if (!v26 || (v27 = (void *)v26, objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
                    {
                      v227 = v7;
                      v229 = 0;
                      goto LABEL_47;
                    }
                    objc_opt_class();
                    if ((objc_opt_isKindOfClass() & 1) != 0)
                    {
                      v227 = v7;
                      v229 = v27;
                      v6 = v257;
LABEL_47:
                      objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("axSettings"));
                      v28 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(MEMORY[0x1E0C99E38], "null");
                      v29 = (void *)objc_claimAutoreleasedReturnValue();
                      v30 = objc_msgSend(v28, "isEqual:", v29);

                      if (v30)
                      {
                        v31 = v21;

                        v28 = 0;
                      }
                      else if (v28)
                      {
                        objc_opt_class();
                        obj = v28;
                        if ((objc_opt_isKindOfClass() & 1) == 0)
                        {
                          if (!v21)
                          {
                            v36 = 0;
                            v7 = v227;
                            v105 = v229;
                            v55 = v246;
                            v69 = v243;
                            goto LABEL_221;
                          }
                          v129 = objc_alloc(MEMORY[0x1E0CB35C8]);
                          v130 = *MEMORY[0x1E0D025B8];
                          v289 = *MEMORY[0x1E0CB2D50];
                          v254 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Expecting %@ as an array"), CFSTR("axSettings"));
                          v290 = v254;
                          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v290, &v289, 1);
                          v31 = (_QWORD *)objc_claimAutoreleasedReturnValue();
                          v36 = 0;
                          *v21 = (id)objc_msgSend(v129, "initWithDomain:code:userInfo:", v130, 2, v31);
                          v7 = v227;
                          v9 = v236;
                          v55 = v246;
                          goto LABEL_108;
                        }
                        v31 = v21;
                      }
                      else
                      {
                        v31 = v21;
                      }
                      v254 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v28, "count"));
                      v258 = 0u;
                      v259 = 0u;
                      v260 = 0u;
                      v261 = 0u;
                      obj = v28;
                      v111 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v258, v288, 16);
                      if (!v111)
                        goto LABEL_94;
                      v112 = v111;
                      v113 = *(_QWORD *)v259;
LABEL_87:
                      v114 = 0;
                      while (1)
                      {
                        if (*(_QWORD *)v259 != v113)
                          objc_enumerationMutation(obj);
                        v115 = *(void **)(*((_QWORD *)&v258 + 1) + 8 * v114);
                        objc_opt_class();
                        if ((objc_opt_isKindOfClass() & 1) != 0)
                          break;
                        objc_opt_class();
                        if ((objc_opt_isKindOfClass() & 1) == 0)
                        {
                          if (v31)
                          {
                            v124 = objc_alloc(MEMORY[0x1E0CB35C8]);
                            v125 = *MEMORY[0x1E0D025B8];
                            v284 = *MEMORY[0x1E0CB2D50];
                            v226 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSString"), objc_opt_class(), CFSTR("axSettings"));
                            v285 = v226;
                            objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v285, &v284, 1);
                            v121 = objc_claimAutoreleasedReturnValue();
                            v122 = v124;
                            v123 = v125;
                            goto LABEL_101;
                          }
                          goto LABEL_102;
                        }
                        v116 = v115;
                        objc_msgSend(v254, "addObject:", v116);

                        if (v112 == ++v114)
                        {
                          v112 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v258, v288, 16);
                          v10 = v252;
                          v6 = v257;
                          if (v112)
                            goto LABEL_87;
LABEL_94:

                          objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("facVersion"));
                          v117 = objc_claimAutoreleasedReturnValue();
                          v226 = (void *)v117;
                          if (!v117)
                          {
                            v9 = v236;
                            v232 = v31;
                            v31 = 0;
                            v105 = v229;
                            goto LABEL_115;
                          }
                          v118 = (void *)v117;
                          objc_opt_class();
                          v9 = v236;
                          v105 = v229;
                          if ((objc_opt_isKindOfClass() & 1) != 0)
                          {
                            v232 = v31;
                            v31 = 0;
                            goto LABEL_115;
                          }
                          objc_opt_class();
                          if ((objc_opt_isKindOfClass() & 1) != 0)
                          {
                            v232 = v31;
                            v31 = v118;
                            v10 = v252;
                            v6 = v257;
LABEL_115:
                            objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("facePoseVersion"));
                            v131 = objc_claimAutoreleasedReturnValue();
                            v223 = (void *)v131;
                            if (!v131)
                            {
                              v225 = 0;
                              v7 = v227;
                              goto LABEL_123;
                            }
                            v132 = (void *)v131;
                            objc_opt_class();
                            v7 = v227;
                            if ((objc_opt_isKindOfClass() & 1) != 0)
                            {
                              v225 = 0;
LABEL_123:
                              objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("padtoolVersion"));
                              v133 = objc_claimAutoreleasedReturnValue();
                              v221 = (void *)v133;
                              if (!v133 || (v134 = (void *)v133, objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
                              {
                                v222 = 0;
LABEL_126:
                                objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("prdVersion"));
                                v135 = objc_claimAutoreleasedReturnValue();
                                v220 = (void *)v135;
                                if (!v135
                                  || (v136 = (void *)v135, objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
                                {
                                  v228 = 0;
LABEL_129:
                                  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("didStepUp"));
                                  v137 = objc_claimAutoreleasedReturnValue();
                                  v218 = (void *)v137;
                                  if (!v137
                                    || (v138 = (void *)v137, objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
                                  {
                                    v219 = 0;
LABEL_132:
                                    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("passiveGestureAssessment"));
                                    v139 = objc_claimAutoreleasedReturnValue();
                                    v216 = (void *)v139;
                                    if (!v139
                                      || (v140 = (void *)v139, objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
                                    {
                                      v217 = 0;
LABEL_135:
                                      objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("passiveLivenessAssessment"));
                                      v141 = objc_claimAutoreleasedReturnValue();
                                      v215 = (void *)v141;
                                      if (!v141
                                        || (v142 = (void *)v141, objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
                                      {
                                        v143 = 0;
                                        goto LABEL_138;
                                      }
                                      objc_opt_class();
                                      if ((objc_opt_isKindOfClass() & 1) != 0)
                                      {
                                        v143 = v142;
                                        v10 = v252;
                                        v6 = v257;
LABEL_138:
                                        objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("passiveLivenessFacVersion"));
                                        v144 = (id)objc_claimAutoreleasedReturnValue();
                                        v214 = v143;
                                        v212 = v144;
                                        if (v144)
                                        {
                                          objc_opt_class();
                                          if ((objc_opt_isKindOfClass() & 1) != 0)
                                          {
                                            v144 = 0;
                                            goto LABEL_165;
                                          }
                                          objc_opt_class();
                                          if ((objc_opt_isKindOfClass() & 1) != 0)
                                          {
                                            v144 = v144;
                                            v10 = v252;
                                            v6 = v257;
                                            goto LABEL_165;
                                          }
                                          if (v232)
                                          {
                                            v179 = objc_alloc(MEMORY[0x1E0CB35C8]);
                                            v180 = *MEMORY[0x1E0D025B8];
                                            v268 = *MEMORY[0x1E0CB2D50];
                                            v213 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSString"), objc_opt_class(), CFSTR("passiveLivenessFacVersion"));
                                            v269 = v213;
                                            objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v269, &v268, 1);
                                            v181 = objc_claimAutoreleasedReturnValue();
                                            v182 = v179;
                                            v105 = v229;
                                            v209 = (void *)v181;
                                            v36 = 0;
                                            v211 = 0;
                                            *v232 = (id)objc_msgSend(v182, "initWithDomain:code:userInfo:", v180, 2);
                                            goto LABEL_240;
                                          }
                                          v211 = 0;
                                          v36 = 0;
LABEL_238:
                                          v10 = v252;
                                          v55 = v246;
                                          v6 = v257;
                                          v69 = v243;
LABEL_212:

LABEL_213:
LABEL_214:

LABEL_215:
LABEL_216:

LABEL_217:
LABEL_218:

LABEL_219:
LABEL_220:

LABEL_221:
                                          v8 = v234;
LABEL_222:

                                          v68 = v247;
LABEL_223:

LABEL_224:
                                          self = v242;
LABEL_225:

LABEL_226:
LABEL_227:
                                          a4 = v249;
LABEL_228:

                                          goto LABEL_229;
                                        }
LABEL_165:
                                        objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("passiveLivenessFacePoseVersion"));
                                        v157 = objc_claimAutoreleasedReturnValue();
                                        v211 = v144;
                                        v209 = (void *)v157;
                                        if (v157
                                          && (v158 = (void *)v157, objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
                                        {
                                          objc_opt_class();
                                          if ((objc_opt_isKindOfClass() & 1) != 0)
                                          {
                                            v213 = v158;
                                            v10 = v252;
                                            v6 = v257;
                                            goto LABEL_168;
                                          }
                                          if (!v232)
                                          {
                                            v213 = 0;
                                            v36 = 0;
LABEL_240:
                                            v10 = v252;
                                            v55 = v246;
                                            v6 = v257;
                                            v69 = v243;
                                            goto LABEL_211;
                                          }
                                          v183 = objc_alloc(MEMORY[0x1E0CB35C8]);
                                          v184 = *MEMORY[0x1E0D025B8];
                                          v266 = *MEMORY[0x1E0CB2D50];
                                          v210 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSString"), objc_opt_class(), CFSTR("passiveLivenessFacePoseVersion"));
                                          v267 = v210;
                                          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v267, &v266, 1);
                                          v185 = objc_claimAutoreleasedReturnValue();
                                          v186 = v183;
                                          v105 = v229;
                                          v208 = (void *)v185;
                                          v36 = 0;
                                          v213 = 0;
                                          *v232 = (id)objc_msgSend(v186, "initWithDomain:code:userInfo:", v184, 2);
                                        }
                                        else
                                        {
                                          v213 = 0;
LABEL_168:
                                          objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("passiveLivenessPadtoolVersion"));
                                          v159 = objc_claimAutoreleasedReturnValue();
                                          v208 = (void *)v159;
                                          if (!v159
                                            || (v160 = (void *)v159,
                                                objc_opt_class(),
                                                (objc_opt_isKindOfClass() & 1) != 0))
                                          {
                                            v210 = 0;
                                            goto LABEL_171;
                                          }
                                          objc_opt_class();
                                          if ((objc_opt_isKindOfClass() & 1) != 0)
                                          {
                                            v210 = v160;
                                            v10 = v252;
                                            v6 = v257;
LABEL_171:
                                            objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("passiveLivenessPrdVersion"));
                                            v161 = (id)objc_claimAutoreleasedReturnValue();
                                            v207 = v161;
                                            if (!v161)
                                            {
LABEL_174:
                                              v55 = v246;
                                              goto LABEL_175;
                                            }
                                            v162 = v161;
                                            objc_opt_class();
                                            if ((objc_opt_isKindOfClass() & 1) != 0)
                                            {
                                              v161 = 0;
                                              goto LABEL_174;
                                            }
                                            objc_opt_class();
                                            v55 = v246;
                                            if ((objc_opt_isKindOfClass() & 1) != 0)
                                            {
                                              v161 = v162;
                                              v10 = v252;
                                              v6 = v257;
LABEL_175:
                                              v206 = v161;
                                              v205 = v144;
                                              v69 = v243;
                                              v36 = objc_retain(-[BMWalletPaymentsCommerceUserProofingResult initWithAbsoluteTimestamp:age:gender:skinTone:ethnicity:deviceLanguage:proofingDecision:issuer:livenessAssessment:gestureAssessment:axSettings:facVersion:facePoseVersion:padtoolVersion:prdVersion:didStepUp:passiveGestureAssessment:passiveLivenessAssessment:passiveLivenessFacVersion:passiveLivenessFacePoseVersion:passiveLivenessPadtoolVersion:passiveLivenessPrdVersion:](v242, "initWithAbsoluteTimestamp:age:gender:skinTone:ethnicity:deviceLanguage:proofingDecision:issuer:livenessAssessment:gestureAssessment:axSettings:facVersion:facePoseVersion:padtoolVersion:prdVersion:didStepUp:passiveGestureAssessment:passiveLivenessAssessment:passiveLivenessFacVersion:passiveLivenessFacePoseVersion:passiveLivenessPadtoolVersion:passiveLivenessPrdVersion:", v253, v234, v249, v251, v248, v243, v245, v240, v238, v105, v254,
                                                        v31,
                                                        v225,
                                                        v222,
                                                        v228,
                                                        v219,
                                                        v217,
                                                        v143,
                                                        v205,
                                                        v213,
                                                        v210,
                                                        v161));
                                              v242 = v36;
LABEL_209:

LABEL_210:
LABEL_211:

                                              goto LABEL_212;
                                            }
                                            if (v232)
                                            {
                                              v191 = objc_alloc(MEMORY[0x1E0CB35C8]);
                                              v192 = *MEMORY[0x1E0D025B8];
                                              v262 = *MEMORY[0x1E0CB2D50];
                                              v193 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSString"), objc_opt_class(), CFSTR("passiveLivenessPrdVersion"));
                                              v263 = v193;
                                              objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v263, &v262, 1);
                                              v194 = (void *)objc_claimAutoreleasedReturnValue();
                                              v195 = v191;
                                              v105 = v229;
                                              v196 = v192;
                                              v55 = v246;
                                              *v232 = (id)objc_msgSend(v195, "initWithDomain:code:userInfo:", v196, 2, v194);

                                            }
                                            v206 = 0;
                                            v36 = 0;
                                            v10 = v252;
LABEL_208:
                                            v6 = v257;
                                            v69 = v243;
                                            goto LABEL_209;
                                          }
                                          if (v232)
                                          {
                                            v187 = objc_alloc(MEMORY[0x1E0CB35C8]);
                                            v188 = *MEMORY[0x1E0D025B8];
                                            v264 = *MEMORY[0x1E0CB2D50];
                                            v206 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSString"), objc_opt_class(), CFSTR("passiveLivenessPadtoolVersion"));
                                            v265 = v206;
                                            objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v265, &v264, 1);
                                            v189 = objc_claimAutoreleasedReturnValue();
                                            v190 = v187;
                                            v105 = v229;
                                            v207 = (void *)v189;
                                            v36 = 0;
                                            v210 = 0;
                                            *v232 = (id)objc_msgSend(v190, "initWithDomain:code:userInfo:", v188, 2);
                                            v10 = v252;
                                            v55 = v246;
                                            goto LABEL_208;
                                          }
                                          v210 = 0;
                                          v36 = 0;
                                        }
                                        v10 = v252;
                                        v55 = v246;
                                        v6 = v257;
                                        v69 = v243;
                                        goto LABEL_210;
                                      }
                                      if (v232)
                                      {
                                        v175 = objc_alloc(MEMORY[0x1E0CB35C8]);
                                        v176 = *MEMORY[0x1E0D025B8];
                                        v270 = *MEMORY[0x1E0CB2D50];
                                        v211 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSString"), objc_opt_class(), CFSTR("passiveLivenessAssessment"));
                                        v271 = v211;
                                        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v271, &v270, 1);
                                        v177 = objc_claimAutoreleasedReturnValue();
                                        v178 = v175;
                                        v105 = v229;
                                        v212 = (void *)v177;
                                        v36 = 0;
                                        v214 = 0;
                                        *v232 = (id)objc_msgSend(v178, "initWithDomain:code:userInfo:", v176, 2);
                                        goto LABEL_238;
                                      }
                                      v214 = 0;
                                      v36 = 0;
LABEL_236:
                                      v10 = v252;
                                      v55 = v246;
                                      v6 = v257;
                                      v69 = v243;
                                      goto LABEL_213;
                                    }
                                    objc_opt_class();
                                    if ((objc_opt_isKindOfClass() & 1) != 0)
                                    {
                                      v217 = v140;
                                      v10 = v252;
                                      v6 = v257;
                                      goto LABEL_135;
                                    }
                                    if (v232)
                                    {
                                      v171 = objc_alloc(MEMORY[0x1E0CB35C8]);
                                      v172 = *MEMORY[0x1E0D025B8];
                                      v272 = *MEMORY[0x1E0CB2D50];
                                      v214 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSString"), objc_opt_class(), CFSTR("passiveGestureAssessment"));
                                      v273 = v214;
                                      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v273, &v272, 1);
                                      v173 = objc_claimAutoreleasedReturnValue();
                                      v174 = v171;
                                      v105 = v229;
                                      v215 = (void *)v173;
                                      v36 = 0;
                                      v217 = 0;
                                      *v232 = (id)objc_msgSend(v174, "initWithDomain:code:userInfo:", v172, 2);
                                      goto LABEL_236;
                                    }
                                    v217 = 0;
                                    v36 = 0;
                                    v10 = v252;
                                    v55 = v246;
                                    v6 = v257;
LABEL_234:
                                    v69 = v243;
                                    goto LABEL_214;
                                  }
                                  objc_opt_class();
                                  if ((objc_opt_isKindOfClass() & 1) != 0)
                                  {
                                    v219 = v138;
                                    goto LABEL_132;
                                  }
                                  if (v232)
                                  {
                                    v167 = objc_alloc(MEMORY[0x1E0CB35C8]);
                                    v168 = *MEMORY[0x1E0D025B8];
                                    v274 = *MEMORY[0x1E0CB2D50];
                                    v10 = v252;
                                    v217 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), objc_opt_class(), CFSTR("didStepUp"));
                                    v275 = v217;
                                    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v275, &v274, 1);
                                    v169 = objc_claimAutoreleasedReturnValue();
                                    v170 = v167;
                                    v105 = v229;
                                    v9 = v236;
                                    v216 = (void *)v169;
                                    v36 = 0;
                                    v219 = 0;
                                    *v232 = (id)objc_msgSend(v170, "initWithDomain:code:userInfo:", v168, 2);
                                    v55 = v246;
                                    goto LABEL_234;
                                  }
                                  v219 = 0;
                                  v36 = 0;
                                  v55 = v246;
LABEL_204:
                                  v69 = v243;
                                  goto LABEL_215;
                                }
                                objc_opt_class();
                                if ((objc_opt_isKindOfClass() & 1) != 0)
                                {
                                  v228 = v136;
                                  v10 = v252;
                                  v6 = v257;
                                  goto LABEL_129;
                                }
                                if (v232)
                                {
                                  v163 = objc_alloc(MEMORY[0x1E0CB35C8]);
                                  v164 = *MEMORY[0x1E0D025B8];
                                  v276 = *MEMORY[0x1E0CB2D50];
                                  v219 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSString"), objc_opt_class(), CFSTR("prdVersion"));
                                  v277 = v219;
                                  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v277, &v276, 1);
                                  v165 = objc_claimAutoreleasedReturnValue();
                                  v166 = v163;
                                  v105 = v229;
                                  v218 = (void *)v165;
                                  v36 = 0;
                                  v228 = 0;
                                  *v232 = (id)objc_msgSend(v166, "initWithDomain:code:userInfo:", v164, 2);
                                  v10 = v252;
                                  v55 = v246;
                                  v6 = v257;
                                  goto LABEL_204;
                                }
                                v228 = 0;
                                v36 = 0;
LABEL_200:
                                v10 = v252;
                                v55 = v246;
                                v6 = v257;
                                v69 = v243;
                                goto LABEL_216;
                              }
                              objc_opt_class();
                              if ((objc_opt_isKindOfClass() & 1) != 0)
                              {
                                v222 = v134;
                                v10 = v252;
                                v6 = v257;
                                goto LABEL_126;
                              }
                              if (v232)
                              {
                                v153 = objc_alloc(MEMORY[0x1E0CB35C8]);
                                v154 = *MEMORY[0x1E0D025B8];
                                v278 = *MEMORY[0x1E0CB2D50];
                                v228 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSString"), objc_opt_class(), CFSTR("padtoolVersion"));
                                v279 = v228;
                                objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v279, &v278, 1);
                                v155 = objc_claimAutoreleasedReturnValue();
                                v156 = v153;
                                v105 = v229;
                                v220 = (void *)v155;
                                v36 = 0;
                                v222 = 0;
                                *v232 = (id)objc_msgSend(v156, "initWithDomain:code:userInfo:", v154, 2);
                                goto LABEL_200;
                              }
                              v222 = 0;
                              v36 = 0;
LABEL_196:
                              v10 = v252;
                              v55 = v246;
                              v6 = v257;
                              v69 = v243;
                              goto LABEL_217;
                            }
                            objc_opt_class();
                            if ((objc_opt_isKindOfClass() & 1) != 0)
                            {
                              v225 = v132;
                              v10 = v252;
                              v6 = v257;
                              goto LABEL_123;
                            }
                            if (v232)
                            {
                              v149 = objc_alloc(MEMORY[0x1E0CB35C8]);
                              v150 = *MEMORY[0x1E0D025B8];
                              v280 = *MEMORY[0x1E0CB2D50];
                              v222 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSString"), objc_opt_class(), CFSTR("facePoseVersion"));
                              v281 = v222;
                              objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v281, &v280, 1);
                              v151 = objc_claimAutoreleasedReturnValue();
                              v152 = v149;
                              v105 = v229;
                              v221 = (void *)v151;
                              v36 = 0;
                              v225 = 0;
                              *v232 = (id)objc_msgSend(v152, "initWithDomain:code:userInfo:", v150, 2);
                              goto LABEL_196;
                            }
                            v225 = 0;
                            v36 = 0;
                          }
                          else
                          {
                            v7 = v227;
                            if (!v31)
                            {
                              v36 = 0;
                              v10 = v252;
                              v55 = v246;
                              v6 = v257;
                              v69 = v243;
                              goto LABEL_219;
                            }
                            v145 = objc_alloc(MEMORY[0x1E0CB35C8]);
                            v146 = *MEMORY[0x1E0D025B8];
                            v282 = *MEMORY[0x1E0CB2D50];
                            v225 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSString"), objc_opt_class(), CFSTR("facVersion"));
                            v283 = v225;
                            objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v283, &v282, 1);
                            v147 = objc_claimAutoreleasedReturnValue();
                            v148 = v145;
                            v105 = v229;
                            v223 = (void *)v147;
                            v36 = 0;
                            *v31 = (id)objc_msgSend(v148, "initWithDomain:code:userInfo:", v146, 2);
                            v31 = 0;
                          }
                          v10 = v252;
                          v55 = v246;
                          v6 = v257;
                          v69 = v243;
                          goto LABEL_218;
                        }
                      }
                      if (v31)
                      {
                        v119 = objc_alloc(MEMORY[0x1E0CB35C8]);
                        v120 = *MEMORY[0x1E0D025B8];
                        v286 = *MEMORY[0x1E0CB2D50];
                        v226 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type null for element of %@, must not be null"), CFSTR("axSettings"));
                        v287 = v226;
                        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v287, &v286, 1);
                        v121 = objc_claimAutoreleasedReturnValue();
                        v122 = v119;
                        v123 = v120;
LABEL_101:
                        v224 = (void *)v121;
                        v10 = v252;
                        v55 = v246;
                        v6 = v257;
                        v69 = v243;
                        v36 = 0;
                        *v31 = (id)objc_msgSend(v122, "initWithDomain:code:userInfo:", v123, 2);
                        v31 = obj;
                        v7 = v227;
                        v105 = v229;
                        v9 = v236;

                        goto LABEL_219;
                      }
LABEL_102:
                      v36 = 0;
                      v31 = obj;
                      v7 = v227;
                      v9 = v236;
                      v10 = v252;
                      v55 = v246;
                      v6 = v257;
LABEL_108:
                      v69 = v243;
                      v105 = v229;
                      goto LABEL_220;
                    }
                    if (v21)
                    {
                      v126 = objc_alloc(MEMORY[0x1E0CB35C8]);
                      v127 = *MEMORY[0x1E0D025B8];
                      v291 = *MEMORY[0x1E0CB2D50];
                      obj = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSString"), objc_opt_class(), CFSTR("gestureAssessment"));
                      v292 = obj;
                      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v292, &v291, 1);
                      v255 = (void *)objc_claimAutoreleasedReturnValue();
                      v128 = (id)objc_msgSend(v126, "initWithDomain:code:userInfo:", v127, 2);
                      v105 = 0;
                      v36 = 0;
                      *v21 = v128;
                      v9 = v236;
                      v55 = v246;
                      v6 = v257;
                      v69 = v243;

                      goto LABEL_221;
                    }
                    v105 = 0;
                    v36 = 0;
LABEL_147:
                    v10 = v252;
                    v55 = v246;
                    v6 = v257;
                    v69 = v243;
                    goto LABEL_222;
                  }
                  if (v21)
                  {
                    v97 = objc_alloc(MEMORY[0x1E0CB35C8]);
                    v98 = v8;
                    v99 = *MEMORY[0x1E0D025B8];
                    v293 = *MEMORY[0x1E0CB2D50];
                    v100 = v7;
                    v101 = objc_alloc(MEMORY[0x1E0CB3940]);
                    v204 = objc_opt_class();
                    v102 = v101;
                    v7 = v100;
                    v103 = objc_msgSend(v102, "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSString"), v204, CFSTR("livenessAssessment"));
                    v294 = v103;
                    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v294, &v293, 1);
                    v104 = objc_claimAutoreleasedReturnValue();
                    v105 = (void *)v103;
                    v106 = v99;
                    v8 = v98;
                    v233 = (void *)v104;
                    v238 = 0;
                    v36 = 0;
                    *v21 = (id)objc_msgSend(v97, "initWithDomain:code:userInfo:", v106, 2);
                    goto LABEL_147;
                  }
                  v238 = 0;
                  v36 = 0;
LABEL_142:
                  v10 = v252;
                  v55 = v246;
                  v68 = v247;
                  v6 = v257;
                  v69 = v243;
                  goto LABEL_223;
                }
                if (v21)
                {
                  v86 = v21;
                  v87 = v9;
                  v88 = objc_alloc(MEMORY[0x1E0CB35C8]);
                  v89 = v8;
                  v90 = *MEMORY[0x1E0D025B8];
                  v295 = *MEMORY[0x1E0CB2D50];
                  v91 = v7;
                  v92 = objc_alloc(MEMORY[0x1E0CB3940]);
                  v203 = objc_opt_class();
                  v93 = v92;
                  v7 = v91;
                  v238 = (id)objc_msgSend(v93, "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSString"), v203, CFSTR("issuer"));
                  v296 = v238;
                  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v296, &v295, 1);
                  v94 = objc_claimAutoreleasedReturnValue();
                  v95 = v88;
                  v9 = v87;
                  v96 = v90;
                  v8 = v89;
                  v239 = (void *)v94;
                  v240 = 0;
                  v36 = 0;
                  *v86 = (id)objc_msgSend(v95, "initWithDomain:code:userInfo:", v96, 2);
                  goto LABEL_142;
                }
                v240 = 0;
                v36 = 0;
LABEL_120:
                v55 = v246;
                v68 = v247;
                v6 = v257;
                v69 = v243;
                goto LABEL_224;
              }
              v245 = 0;
            }
            else
            {
              v245 = 0;
              v21 = v14;
            }
            v7 = v13;
            goto LABEL_38;
          }
          if (v14)
          {
            v70 = v14;
            v71 = v9;
            v72 = objc_alloc(MEMORY[0x1E0CB35C8]);
            v235 = v8;
            v73 = *MEMORY[0x1E0D025B8];
            v299 = *MEMORY[0x1E0CB2D50];
            v74 = objc_alloc(MEMORY[0x1E0CB3940]);
            v201 = objc_opt_class();
            v75 = v74;
            v7 = v13;
            v245 = (id)objc_msgSend(v75, "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSString"), v201, CFSTR("deviceLanguage"));
            v300 = v245;
            objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v300, &v299, 1);
            v76 = objc_claimAutoreleasedReturnValue();
            v77 = v72;
            v9 = v71;
            self = v11;
            v68 = v247;
            v78 = v73;
            v8 = v235;
            v250 = (void *)v76;
            v69 = 0;
            v36 = 0;
            *v70 = (id)objc_msgSend(v77, "initWithDomain:code:userInfo:", v78, 2, v76);
            v55 = v246;
            v6 = v257;
            goto LABEL_225;
          }
          v69 = 0;
          v36 = 0;
          v55 = v246;
          v68 = v247;
          v7 = v13;
LABEL_110:
          v6 = v257;
          goto LABEL_226;
        }
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v251 = v10;
          goto LABEL_13;
        }
        if (a4)
        {
          v231 = a4;
          v45 = v9;
          v46 = objc_alloc(MEMORY[0x1E0CB35C8]);
          v47 = v8;
          v48 = *MEMORY[0x1E0D025B8];
          v303 = *MEMORY[0x1E0CB2D50];
          v49 = v7;
          v50 = objc_alloc(MEMORY[0x1E0CB3940]);
          v199 = objc_opt_class();
          v51 = v50;
          v7 = v49;
          v248 = (id)objc_msgSend(v51, "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSString"), v199, CFSTR("skinTone"));
          v304 = v248;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v304, &v303, 1);
          v52 = objc_claimAutoreleasedReturnValue();
          v53 = v46;
          v9 = v45;
          a4 = v249;
          v54 = v48;
          v8 = v47;
          v55 = (void *)v52;
          v251 = 0;
          v36 = 0;
          *v231 = (id)objc_msgSend(v53, "initWithDomain:code:userInfo:", v54, 2, v52);
          self = v11;
          goto LABEL_228;
        }
        v251 = 0;
        v36 = 0;
        a4 = v249;
LABEL_229:

        goto LABEL_230;
      }
      if (a4)
      {
        v230 = a4;
        v37 = objc_alloc(MEMORY[0x1E0CB35C8]);
        v38 = v8;
        v39 = *MEMORY[0x1E0D025B8];
        v305 = *MEMORY[0x1E0CB2D50];
        v40 = v7;
        v41 = objc_alloc(MEMORY[0x1E0CB3940]);
        v198 = objc_opt_class();
        v42 = v41;
        v7 = v40;
        v251 = (id)objc_msgSend(v42, "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSString"), v198, CFSTR("gender"));
        v306 = v251;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v306, &v305, 1);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v43 = v39;
        v8 = v38;
        v44 = (id)objc_msgSend(v37, "initWithDomain:code:userInfo:", v43, 2, v10);
        a4 = 0;
        v36 = 0;
        *v230 = v44;
        v6 = v257;
        goto LABEL_229;
      }
      v36 = 0;
LABEL_78:
      v6 = v257;
LABEL_230:

      goto LABEL_231;
    }
    if (a4)
    {
      v32 = objc_alloc(MEMORY[0x1E0CB35C8]);
      v33 = *MEMORY[0x1E0D025B8];
      v307 = *MEMORY[0x1E0CB2D50];
      v34 = a4;
      a4 = (id *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSString"), objc_opt_class(), CFSTR("age"));
      v308 = a4;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v308, &v307, 1);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v35 = (id)objc_msgSend(v32, "initWithDomain:code:userInfo:", v33, 2, v9);
      v8 = 0;
      v36 = 0;
      *v34 = v35;
      goto LABEL_78;
    }
    v8 = 0;
    v36 = 0;
LABEL_231:

    goto LABEL_232;
  }
  if (a4)
  {
    v107 = objc_alloc(MEMORY[0x1E0CB35C8]);
    v108 = *MEMORY[0x1E0D025B8];
    v309 = *MEMORY[0x1E0CB2D50];
    v109 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber (as time internal since 2001 (CFAbsoluteTime)), NSString (ISO8601 format), or NSDate"), objc_opt_class(), CFSTR("absoluteTimestamp"));
    v310[0] = v109;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v310, &v309, 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v110 = v108;
    v8 = (id)v109;
    v253 = 0;
    v36 = 0;
    *a4 = (id)objc_msgSend(v107, "initWithDomain:code:userInfo:", v110, 2, v7);
    goto LABEL_231;
  }
  v253 = 0;
  v36 = 0;
LABEL_232:

  return v36;
}

- (id)_axSettingsJSONArray
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
  -[BMWalletPaymentsCommerceUserProofingResult axSettings](self, "axSettings", 0);
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
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
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
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  uint64_t v41;
  void *v42;
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
  id v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  id v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  _QWORD v77[22];
  _QWORD v78[24];

  v78[22] = *MEMORY[0x1E0C80C00];
  -[BMWalletPaymentsCommerceUserProofingResult absoluteTimestamp](self, "absoluteTimestamp");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = (void *)MEMORY[0x1E0CB37E8];
    -[BMWalletPaymentsCommerceUserProofingResult absoluteTimestamp](self, "absoluteTimestamp");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "timeIntervalSinceReferenceDate");
    objc_msgSend(v4, "numberWithDouble:");
    v6 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = 0;
  }

  -[BMWalletPaymentsCommerceUserProofingResult age](self, "age");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMWalletPaymentsCommerceUserProofingResult gender](self, "gender");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMWalletPaymentsCommerceUserProofingResult skinTone](self, "skinTone");
  v9 = objc_claimAutoreleasedReturnValue();
  -[BMWalletPaymentsCommerceUserProofingResult ethnicity](self, "ethnicity");
  v10 = objc_claimAutoreleasedReturnValue();
  -[BMWalletPaymentsCommerceUserProofingResult deviceLanguage](self, "deviceLanguage");
  v11 = objc_claimAutoreleasedReturnValue();
  -[BMWalletPaymentsCommerceUserProofingResult proofingDecision](self, "proofingDecision");
  v12 = objc_claimAutoreleasedReturnValue();
  -[BMWalletPaymentsCommerceUserProofingResult issuer](self, "issuer");
  v76 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMWalletPaymentsCommerceUserProofingResult livenessAssessment](self, "livenessAssessment");
  v75 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMWalletPaymentsCommerceUserProofingResult gestureAssessment](self, "gestureAssessment");
  v74 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMWalletPaymentsCommerceUserProofingResult _axSettingsJSONArray](self, "_axSettingsJSONArray");
  v73 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMWalletPaymentsCommerceUserProofingResult facVersion](self, "facVersion");
  v72 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMWalletPaymentsCommerceUserProofingResult facePoseVersion](self, "facePoseVersion");
  v71 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMWalletPaymentsCommerceUserProofingResult padtoolVersion](self, "padtoolVersion");
  v70 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMWalletPaymentsCommerceUserProofingResult prdVersion](self, "prdVersion");
  v69 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[BMWalletPaymentsCommerceUserProofingResult hasDidStepUp](self, "hasDidStepUp"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[BMWalletPaymentsCommerceUserProofingResult didStepUp](self, "didStepUp"));
    v68 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v68 = 0;
  }
  -[BMWalletPaymentsCommerceUserProofingResult passiveGestureAssessment](self, "passiveGestureAssessment");
  v67 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMWalletPaymentsCommerceUserProofingResult passiveLivenessAssessment](self, "passiveLivenessAssessment");
  v66 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMWalletPaymentsCommerceUserProofingResult passiveLivenessFacVersion](self, "passiveLivenessFacVersion");
  v65 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMWalletPaymentsCommerceUserProofingResult passiveLivenessFacePoseVersion](self, "passiveLivenessFacePoseVersion");
  v64 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMWalletPaymentsCommerceUserProofingResult passiveLivenessPadtoolVersion](self, "passiveLivenessPadtoolVersion");
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMWalletPaymentsCommerceUserProofingResult passiveLivenessPrdVersion](self, "passiveLivenessPrdVersion");
  v13 = objc_claimAutoreleasedReturnValue();
  v77[0] = CFSTR("absoluteTimestamp");
  v14 = (uint64_t)v6;
  if (!v6)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v14 = objc_claimAutoreleasedReturnValue();
  }
  v53 = (void *)v14;
  v78[0] = v14;
  v77[1] = CFSTR("age");
  v15 = (uint64_t)v7;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v15 = objc_claimAutoreleasedReturnValue();
  }
  v52 = (void *)v15;
  v78[1] = v15;
  v77[2] = CFSTR("gender");
  v16 = (uint64_t)v8;
  if (!v8)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v16 = objc_claimAutoreleasedReturnValue();
  }
  v51 = (void *)v16;
  v78[2] = v16;
  v77[3] = CFSTR("skinTone");
  v17 = v9;
  if (!v9)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v17 = objc_claimAutoreleasedReturnValue();
  }
  v50 = (void *)v17;
  v78[3] = v17;
  v77[4] = CFSTR("ethnicity");
  v18 = v10;
  if (!v10)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v18 = objc_claimAutoreleasedReturnValue();
  }
  v49 = (void *)v18;
  v78[4] = v18;
  v77[5] = CFSTR("deviceLanguage");
  v19 = v11;
  if (!v11)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v19 = objc_claimAutoreleasedReturnValue();
  }
  v48 = (void *)v19;
  v78[5] = v19;
  v77[6] = CFSTR("proofingDecision");
  v20 = v12;
  if (!v12)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v20 = objc_claimAutoreleasedReturnValue();
  }
  v47 = (void *)v20;
  v78[6] = v20;
  v77[7] = CFSTR("issuer");
  v21 = (uint64_t)v76;
  if (!v76)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v21 = objc_claimAutoreleasedReturnValue();
  }
  v78[7] = v21;
  v77[8] = CFSTR("livenessAssessment");
  v22 = (uint64_t)v75;
  if (!v75)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v22 = objc_claimAutoreleasedReturnValue();
  }
  v78[8] = v22;
  v77[9] = CFSTR("gestureAssessment");
  v23 = (uint64_t)v74;
  if (!v74)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v23 = objc_claimAutoreleasedReturnValue();
  }
  v57 = (void *)v23;
  v78[9] = v23;
  v77[10] = CFSTR("axSettings");
  v24 = (uint64_t)v73;
  if (!v73)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v24 = objc_claimAutoreleasedReturnValue();
  }
  v56 = (void *)v24;
  v78[10] = v24;
  v77[11] = CFSTR("facVersion");
  v25 = (uint64_t)v72;
  if (!v72)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v25 = objc_claimAutoreleasedReturnValue();
  }
  v59 = (void *)v10;
  v78[11] = v25;
  v77[12] = CFSTR("facePoseVersion");
  v26 = (uint64_t)v71;
  v27 = (void *)v25;
  if (!v71)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v26 = objc_claimAutoreleasedReturnValue();
  }
  v58 = (void *)v11;
  v55 = (void *)v26;
  v78[12] = v26;
  v77[13] = CFSTR("padtoolVersion");
  v28 = (uint64_t)v70;
  if (!v70)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v28 = objc_claimAutoreleasedReturnValue();
  }
  v60 = (void *)v9;
  v78[13] = v28;
  v77[14] = CFSTR("prdVersion");
  v29 = (uint64_t)v69;
  if (!v69)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v29 = objc_claimAutoreleasedReturnValue();
  }
  v62 = (void *)v13;
  v78[14] = v29;
  v77[15] = CFSTR("didStepUp");
  v30 = (uint64_t)v68;
  if (!v68)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v30 = objc_claimAutoreleasedReturnValue();
  }
  v61 = v6;
  v78[15] = v30;
  v77[16] = CFSTR("passiveGestureAssessment");
  v31 = (uint64_t)v67;
  if (!v67)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v31 = objc_claimAutoreleasedReturnValue();
  }
  v46 = (void *)v21;
  v41 = v31;
  v78[16] = v31;
  v77[17] = CFSTR("passiveLivenessAssessment");
  v32 = v66;
  if (!v66)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null", v31);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v43 = (void *)v30;
  v44 = v27;
  v45 = (void *)v22;
  v78[17] = v32;
  v77[18] = CFSTR("passiveLivenessFacVersion");
  v33 = v65;
  if (!v65)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v34 = (void *)v29;
  v35 = (void *)v12;
  v78[18] = v33;
  v77[19] = CFSTR("passiveLivenessFacePoseVersion");
  v36 = v64;
  if (!v64)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v37 = (void *)v28;
  v78[19] = v36;
  v77[20] = CFSTR("passiveLivenessPadtoolVersion");
  v38 = v63;
  if (!v63)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v78[20] = v38;
  v77[21] = CFSTR("passiveLivenessPrdVersion");
  v39 = v62;
  if (!v62)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v78[21] = v39;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v78, v77, 22, v41);
  v54 = (id)objc_claimAutoreleasedReturnValue();
  if (!v62)

  if (!v63)
  if (!v64)

  if (!v65)
  if (!v66)

  if (!v67)
  if (!v68)

  if (!v69)
  if (!v70)

  if (!v71)
  if (!v72)

  if (!v73)
  if (!v74)

  if (!v75)
  if (v76)
  {
    if (v35)
      goto LABEL_81;
  }
  else
  {

    if (v35)
    {
LABEL_81:
      if (v58)
        goto LABEL_82;
      goto LABEL_90;
    }
  }

  if (v58)
  {
LABEL_82:
    if (v59)
      goto LABEL_83;
    goto LABEL_91;
  }
LABEL_90:

  if (v59)
  {
LABEL_83:
    if (v60)
      goto LABEL_84;
    goto LABEL_92;
  }
LABEL_91:

  if (v60)
  {
LABEL_84:
    if (v8)
      goto LABEL_85;
    goto LABEL_93;
  }
LABEL_92:

  if (v8)
  {
LABEL_85:
    if (v7)
      goto LABEL_86;
LABEL_94:

    if (v61)
      goto LABEL_87;
LABEL_95:

    goto LABEL_87;
  }
LABEL_93:

  if (!v7)
    goto LABEL_94;
LABEL_86:
  if (!v61)
    goto LABEL_95;
LABEL_87:

  return v54;
}

- (NSDate)absoluteTimestamp
{
  void *v2;
  void *v3;
  void *v4;

  if (self->_hasRaw_absoluteTimestamp)
  {
    v2 = (void *)MEMORY[0x1E0D02620];
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_raw_absoluteTimestamp);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "convertValue:toType:", v3, 1);
    v4 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v4 = 0;
  }
  return (NSDate *)v4;
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
  void *v91;
  uint64_t v92;
  void *v93;
  void *v94;
  void *v95;
  int v96;
  int v97;
  void *v98;
  uint64_t v99;
  void *v100;
  void *v101;
  void *v102;
  int v103;
  void *v104;
  uint64_t v105;
  void *v106;
  void *v107;
  void *v108;
  int v109;
  void *v110;
  uint64_t v111;
  void *v112;
  void *v113;
  void *v114;
  int v115;
  void *v116;
  uint64_t v117;
  void *v118;
  void *v119;
  void *v120;
  int v121;
  void *v122;
  uint64_t v123;
  void *v124;
  void *v125;
  void *v126;
  int v127;
  void *v129;
  void *v130;
  void *v131;
  void *v132;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    -[BMWalletPaymentsCommerceUserProofingResult absoluteTimestamp](self, "absoluteTimestamp");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "absoluteTimestamp");
    v7 = objc_claimAutoreleasedReturnValue();
    if (v6 == (void *)v7)
    {

    }
    else
    {
      v8 = (void *)v7;
      -[BMWalletPaymentsCommerceUserProofingResult absoluteTimestamp](self, "absoluteTimestamp");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "absoluteTimestamp");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v9, "isEqual:", v10);

      if (!v11)
        goto LABEL_86;
    }
    -[BMWalletPaymentsCommerceUserProofingResult age](self, "age");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "age");
    v14 = objc_claimAutoreleasedReturnValue();
    if (v13 == (void *)v14)
    {

    }
    else
    {
      v15 = (void *)v14;
      -[BMWalletPaymentsCommerceUserProofingResult age](self, "age");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "age");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = objc_msgSend(v16, "isEqual:", v17);

      if (!v18)
        goto LABEL_86;
    }
    -[BMWalletPaymentsCommerceUserProofingResult gender](self, "gender");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "gender");
    v20 = objc_claimAutoreleasedReturnValue();
    if (v19 == (void *)v20)
    {

    }
    else
    {
      v21 = (void *)v20;
      -[BMWalletPaymentsCommerceUserProofingResult gender](self, "gender");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "gender");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = objc_msgSend(v22, "isEqual:", v23);

      if (!v24)
        goto LABEL_86;
    }
    -[BMWalletPaymentsCommerceUserProofingResult skinTone](self, "skinTone");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "skinTone");
    v26 = objc_claimAutoreleasedReturnValue();
    if (v25 == (void *)v26)
    {

    }
    else
    {
      v27 = (void *)v26;
      -[BMWalletPaymentsCommerceUserProofingResult skinTone](self, "skinTone");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "skinTone");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      v30 = objc_msgSend(v28, "isEqual:", v29);

      if (!v30)
        goto LABEL_86;
    }
    -[BMWalletPaymentsCommerceUserProofingResult ethnicity](self, "ethnicity");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "ethnicity");
    v32 = objc_claimAutoreleasedReturnValue();
    if (v31 == (void *)v32)
    {

    }
    else
    {
      v33 = (void *)v32;
      -[BMWalletPaymentsCommerceUserProofingResult ethnicity](self, "ethnicity");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "ethnicity");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      v36 = objc_msgSend(v34, "isEqual:", v35);

      if (!v36)
        goto LABEL_86;
    }
    -[BMWalletPaymentsCommerceUserProofingResult deviceLanguage](self, "deviceLanguage");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "deviceLanguage");
    v38 = objc_claimAutoreleasedReturnValue();
    if (v37 == (void *)v38)
    {

    }
    else
    {
      v39 = (void *)v38;
      -[BMWalletPaymentsCommerceUserProofingResult deviceLanguage](self, "deviceLanguage");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "deviceLanguage");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      v42 = objc_msgSend(v40, "isEqual:", v41);

      if (!v42)
        goto LABEL_86;
    }
    -[BMWalletPaymentsCommerceUserProofingResult proofingDecision](self, "proofingDecision");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "proofingDecision");
    v44 = objc_claimAutoreleasedReturnValue();
    if (v43 == (void *)v44)
    {

    }
    else
    {
      v45 = (void *)v44;
      -[BMWalletPaymentsCommerceUserProofingResult proofingDecision](self, "proofingDecision");
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "proofingDecision");
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      v48 = objc_msgSend(v46, "isEqual:", v47);

      if (!v48)
        goto LABEL_86;
    }
    -[BMWalletPaymentsCommerceUserProofingResult issuer](self, "issuer");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "issuer");
    v50 = objc_claimAutoreleasedReturnValue();
    if (v49 == (void *)v50)
    {

    }
    else
    {
      v51 = (void *)v50;
      -[BMWalletPaymentsCommerceUserProofingResult issuer](self, "issuer");
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "issuer");
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      v54 = objc_msgSend(v52, "isEqual:", v53);

      if (!v54)
        goto LABEL_86;
    }
    -[BMWalletPaymentsCommerceUserProofingResult livenessAssessment](self, "livenessAssessment");
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "livenessAssessment");
    v56 = objc_claimAutoreleasedReturnValue();
    if (v55 == (void *)v56)
    {

    }
    else
    {
      v57 = (void *)v56;
      -[BMWalletPaymentsCommerceUserProofingResult livenessAssessment](self, "livenessAssessment");
      v58 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "livenessAssessment");
      v59 = (void *)objc_claimAutoreleasedReturnValue();
      v60 = objc_msgSend(v58, "isEqual:", v59);

      if (!v60)
        goto LABEL_86;
    }
    -[BMWalletPaymentsCommerceUserProofingResult gestureAssessment](self, "gestureAssessment");
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "gestureAssessment");
    v62 = objc_claimAutoreleasedReturnValue();
    if (v61 == (void *)v62)
    {

    }
    else
    {
      v63 = (void *)v62;
      -[BMWalletPaymentsCommerceUserProofingResult gestureAssessment](self, "gestureAssessment");
      v64 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "gestureAssessment");
      v65 = (void *)objc_claimAutoreleasedReturnValue();
      v66 = objc_msgSend(v64, "isEqual:", v65);

      if (!v66)
        goto LABEL_86;
    }
    -[BMWalletPaymentsCommerceUserProofingResult axSettings](self, "axSettings");
    v67 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "axSettings");
    v68 = objc_claimAutoreleasedReturnValue();
    if (v67 == (void *)v68)
    {

    }
    else
    {
      v69 = (void *)v68;
      -[BMWalletPaymentsCommerceUserProofingResult axSettings](self, "axSettings");
      v70 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "axSettings");
      v71 = (void *)objc_claimAutoreleasedReturnValue();
      v72 = objc_msgSend(v70, "isEqual:", v71);

      if (!v72)
        goto LABEL_86;
    }
    -[BMWalletPaymentsCommerceUserProofingResult facVersion](self, "facVersion");
    v73 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "facVersion");
    v74 = objc_claimAutoreleasedReturnValue();
    if (v73 == (void *)v74)
    {

    }
    else
    {
      v75 = (void *)v74;
      -[BMWalletPaymentsCommerceUserProofingResult facVersion](self, "facVersion");
      v76 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "facVersion");
      v77 = (void *)objc_claimAutoreleasedReturnValue();
      v78 = objc_msgSend(v76, "isEqual:", v77);

      if (!v78)
        goto LABEL_86;
    }
    -[BMWalletPaymentsCommerceUserProofingResult facePoseVersion](self, "facePoseVersion");
    v79 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "facePoseVersion");
    v80 = objc_claimAutoreleasedReturnValue();
    if (v79 == (void *)v80)
    {

    }
    else
    {
      v81 = (void *)v80;
      -[BMWalletPaymentsCommerceUserProofingResult facePoseVersion](self, "facePoseVersion");
      v82 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "facePoseVersion");
      v83 = (void *)objc_claimAutoreleasedReturnValue();
      v84 = objc_msgSend(v82, "isEqual:", v83);

      if (!v84)
        goto LABEL_86;
    }
    -[BMWalletPaymentsCommerceUserProofingResult padtoolVersion](self, "padtoolVersion");
    v85 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "padtoolVersion");
    v86 = objc_claimAutoreleasedReturnValue();
    if (v85 == (void *)v86)
    {

    }
    else
    {
      v87 = (void *)v86;
      -[BMWalletPaymentsCommerceUserProofingResult padtoolVersion](self, "padtoolVersion");
      v88 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "padtoolVersion");
      v89 = (void *)objc_claimAutoreleasedReturnValue();
      v90 = objc_msgSend(v88, "isEqual:", v89);

      if (!v90)
        goto LABEL_86;
    }
    -[BMWalletPaymentsCommerceUserProofingResult prdVersion](self, "prdVersion");
    v91 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "prdVersion");
    v92 = objc_claimAutoreleasedReturnValue();
    if (v91 == (void *)v92)
    {

    }
    else
    {
      v93 = (void *)v92;
      -[BMWalletPaymentsCommerceUserProofingResult prdVersion](self, "prdVersion");
      v94 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "prdVersion");
      v95 = (void *)objc_claimAutoreleasedReturnValue();
      v96 = objc_msgSend(v94, "isEqual:", v95);

      if (!v96)
        goto LABEL_86;
    }
    if (-[BMWalletPaymentsCommerceUserProofingResult hasDidStepUp](self, "hasDidStepUp")
      || objc_msgSend(v5, "hasDidStepUp"))
    {
      if (!-[BMWalletPaymentsCommerceUserProofingResult hasDidStepUp](self, "hasDidStepUp"))
        goto LABEL_86;
      if (!objc_msgSend(v5, "hasDidStepUp"))
        goto LABEL_86;
      v97 = -[BMWalletPaymentsCommerceUserProofingResult didStepUp](self, "didStepUp");
      if (v97 != objc_msgSend(v5, "didStepUp"))
        goto LABEL_86;
    }
    -[BMWalletPaymentsCommerceUserProofingResult passiveGestureAssessment](self, "passiveGestureAssessment");
    v98 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "passiveGestureAssessment");
    v99 = objc_claimAutoreleasedReturnValue();
    if (v98 == (void *)v99)
    {

    }
    else
    {
      v100 = (void *)v99;
      -[BMWalletPaymentsCommerceUserProofingResult passiveGestureAssessment](self, "passiveGestureAssessment");
      v101 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "passiveGestureAssessment");
      v102 = (void *)objc_claimAutoreleasedReturnValue();
      v103 = objc_msgSend(v101, "isEqual:", v102);

      if (!v103)
        goto LABEL_86;
    }
    -[BMWalletPaymentsCommerceUserProofingResult passiveLivenessAssessment](self, "passiveLivenessAssessment");
    v104 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "passiveLivenessAssessment");
    v105 = objc_claimAutoreleasedReturnValue();
    if (v104 == (void *)v105)
    {

    }
    else
    {
      v106 = (void *)v105;
      -[BMWalletPaymentsCommerceUserProofingResult passiveLivenessAssessment](self, "passiveLivenessAssessment");
      v107 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "passiveLivenessAssessment");
      v108 = (void *)objc_claimAutoreleasedReturnValue();
      v109 = objc_msgSend(v107, "isEqual:", v108);

      if (!v109)
        goto LABEL_86;
    }
    -[BMWalletPaymentsCommerceUserProofingResult passiveLivenessFacVersion](self, "passiveLivenessFacVersion");
    v110 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "passiveLivenessFacVersion");
    v111 = objc_claimAutoreleasedReturnValue();
    if (v110 == (void *)v111)
    {

    }
    else
    {
      v112 = (void *)v111;
      -[BMWalletPaymentsCommerceUserProofingResult passiveLivenessFacVersion](self, "passiveLivenessFacVersion");
      v113 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "passiveLivenessFacVersion");
      v114 = (void *)objc_claimAutoreleasedReturnValue();
      v115 = objc_msgSend(v113, "isEqual:", v114);

      if (!v115)
        goto LABEL_86;
    }
    -[BMWalletPaymentsCommerceUserProofingResult passiveLivenessFacePoseVersion](self, "passiveLivenessFacePoseVersion");
    v116 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "passiveLivenessFacePoseVersion");
    v117 = objc_claimAutoreleasedReturnValue();
    if (v116 == (void *)v117)
    {

    }
    else
    {
      v118 = (void *)v117;
      -[BMWalletPaymentsCommerceUserProofingResult passiveLivenessFacePoseVersion](self, "passiveLivenessFacePoseVersion");
      v119 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "passiveLivenessFacePoseVersion");
      v120 = (void *)objc_claimAutoreleasedReturnValue();
      v121 = objc_msgSend(v119, "isEqual:", v120);

      if (!v121)
        goto LABEL_86;
    }
    -[BMWalletPaymentsCommerceUserProofingResult passiveLivenessPadtoolVersion](self, "passiveLivenessPadtoolVersion");
    v122 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "passiveLivenessPadtoolVersion");
    v123 = objc_claimAutoreleasedReturnValue();
    if (v122 == (void *)v123)
    {

    }
    else
    {
      v124 = (void *)v123;
      -[BMWalletPaymentsCommerceUserProofingResult passiveLivenessPadtoolVersion](self, "passiveLivenessPadtoolVersion");
      v125 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "passiveLivenessPadtoolVersion");
      v126 = (void *)objc_claimAutoreleasedReturnValue();
      v127 = objc_msgSend(v125, "isEqual:", v126);

      if (!v127)
      {
LABEL_86:
        v12 = 0;
LABEL_87:

        goto LABEL_88;
      }
    }
    -[BMWalletPaymentsCommerceUserProofingResult passiveLivenessPrdVersion](self, "passiveLivenessPrdVersion");
    v129 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "passiveLivenessPrdVersion");
    v130 = (void *)objc_claimAutoreleasedReturnValue();
    if (v129 == v130)
    {
      v12 = 1;
    }
    else
    {
      -[BMWalletPaymentsCommerceUserProofingResult passiveLivenessPrdVersion](self, "passiveLivenessPrdVersion");
      v131 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "passiveLivenessPrdVersion");
      v132 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v131, "isEqual:", v132);

    }
    goto LABEL_87;
  }
  v12 = 0;
LABEL_88:

  return v12;
}

- (unsigned)dataVersion
{
  return self->_dataVersion;
}

- (NSString)age
{
  return self->_age;
}

- (NSString)gender
{
  return self->_gender;
}

- (NSString)skinTone
{
  return self->_skinTone;
}

- (NSString)ethnicity
{
  return self->_ethnicity;
}

- (NSString)deviceLanguage
{
  return self->_deviceLanguage;
}

- (NSString)proofingDecision
{
  return self->_proofingDecision;
}

- (NSString)issuer
{
  return self->_issuer;
}

- (NSString)livenessAssessment
{
  return self->_livenessAssessment;
}

- (NSString)gestureAssessment
{
  return self->_gestureAssessment;
}

- (NSArray)axSettings
{
  return self->_axSettings;
}

- (NSString)facVersion
{
  return self->_facVersion;
}

- (NSString)facePoseVersion
{
  return self->_facePoseVersion;
}

- (NSString)padtoolVersion
{
  return self->_padtoolVersion;
}

- (NSString)prdVersion
{
  return self->_prdVersion;
}

- (BOOL)didStepUp
{
  return self->_didStepUp;
}

- (BOOL)hasDidStepUp
{
  return self->_hasDidStepUp;
}

- (void)setHasDidStepUp:(BOOL)a3
{
  self->_hasDidStepUp = a3;
}

- (NSString)passiveGestureAssessment
{
  return self->_passiveGestureAssessment;
}

- (NSString)passiveLivenessAssessment
{
  return self->_passiveLivenessAssessment;
}

- (NSString)passiveLivenessFacVersion
{
  return self->_passiveLivenessFacVersion;
}

- (NSString)passiveLivenessFacePoseVersion
{
  return self->_passiveLivenessFacePoseVersion;
}

- (NSString)passiveLivenessPadtoolVersion
{
  return self->_passiveLivenessPadtoolVersion;
}

- (NSString)passiveLivenessPrdVersion
{
  return self->_passiveLivenessPrdVersion;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_passiveLivenessPrdVersion, 0);
  objc_storeStrong((id *)&self->_passiveLivenessPadtoolVersion, 0);
  objc_storeStrong((id *)&self->_passiveLivenessFacePoseVersion, 0);
  objc_storeStrong((id *)&self->_passiveLivenessFacVersion, 0);
  objc_storeStrong((id *)&self->_passiveLivenessAssessment, 0);
  objc_storeStrong((id *)&self->_passiveGestureAssessment, 0);
  objc_storeStrong((id *)&self->_prdVersion, 0);
  objc_storeStrong((id *)&self->_padtoolVersion, 0);
  objc_storeStrong((id *)&self->_facePoseVersion, 0);
  objc_storeStrong((id *)&self->_facVersion, 0);
  objc_storeStrong((id *)&self->_axSettings, 0);
  objc_storeStrong((id *)&self->_gestureAssessment, 0);
  objc_storeStrong((id *)&self->_livenessAssessment, 0);
  objc_storeStrong((id *)&self->_issuer, 0);
  objc_storeStrong((id *)&self->_proofingDecision, 0);
  objc_storeStrong((id *)&self->_deviceLanguage, 0);
  objc_storeStrong((id *)&self->_ethnicity, 0);
  objc_storeStrong((id *)&self->_skinTone, 0);
  objc_storeStrong((id *)&self->_gender, 0);
  objc_storeStrong((id *)&self->_age, 0);
}

+ (unsigned)latestDataVersion
{
  return 1;
}

+ (id)eventWithData:(id)a3 dataVersion:(unsigned int)a4
{
  objc_class *v4;
  id v5;
  void *v6;
  _DWORD *v7;

  if (a4 == 1)
  {
    v4 = (objc_class *)MEMORY[0x1E0D82B90];
    v5 = a3;
    v6 = (void *)objc_msgSend([v4 alloc], "initWithData:", v5);

    v7 = -[BMWalletPaymentsCommerceUserProofingResult initByReadFrom:]([BMWalletPaymentsCommerceUserProofingResult alloc], "initByReadFrom:", v6);
    v7[9] = 1;

  }
  else
  {
    v7 = 0;
  }
  return v7;
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
  id v10;
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
  _QWORD v26[24];

  v26[22] = *MEMORY[0x1E0C80C00];
  v25 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("absoluteTimestamp"), 3, 0, 1, 0, 1);
  v24 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("age"), 2, 0, 2, 13, 0);
  v23 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("gender"), 2, 0, 3, 13, 0);
  v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("skinTone"), 2, 0, 4, 13, 0);
  v22 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("ethnicity"), 2, 0, 5, 13, 0);
  v21 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("deviceLanguage"), 2, 0, 6, 13, 0);
  v20 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("proofingDecision"), 2, 0, 7, 13, 0);
  v19 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("issuer"), 2, 0, 8, 13, 0);
  v18 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("livenessAssessment"), 2, 0, 9, 13, 0);
  v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("gestureAssessment"), 2, 0, 10, 13, 0);
  v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02710]), "initWithName:dataType:requestOnly:extractBlock:", CFSTR("axSettings_json"), 5, 1, &__block_literal_global_2671);
  v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("facVersion"), 2, 0, 12, 13, 0);
  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("facePoseVersion"), 2, 0, 13, 13, 0);
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("padtoolVersion"), 2, 0, 14, 13, 0);
  v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("prdVersion"), 2, 0, 15, 13, 0);
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("didStepUp"), 0, 0, 16, 12, 0);
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("passiveGestureAssessment"), 2, 0, 17, 13, 0);
  v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("passiveLivenessAssessment"), 2, 0, 18, 13, 0);
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("passiveLivenessFacVersion"), 2, 0, 19, 13, 0);
  v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("passiveLivenessFacePoseVersion"), 2, 0, 20, 13, 0);
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("passiveLivenessPadtoolVersion"), 2, 0, 21, 13, 0);
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("passiveLivenessPrdVersion"), 2, 0, 22, 13, 0);
  v26[0] = v25;
  v26[1] = v24;
  v26[2] = v23;
  v26[3] = v13;
  v26[4] = v22;
  v26[5] = v21;
  v26[6] = v20;
  v26[7] = v19;
  v26[8] = v18;
  v26[9] = v17;
  v26[10] = v16;
  v26[11] = v15;
  v26[12] = v2;
  v26[13] = v3;
  v26[14] = v14;
  v26[15] = v4;
  v26[16] = v5;
  v26[17] = v12;
  v26[18] = v6;
  v26[19] = v11;
  v26[20] = v7;
  v26[21] = v8;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v26, 22);
  v10 = (id)objc_claimAutoreleasedReturnValue();

  return v10;
}

+ (id)validKeyPaths
{
  return &unk_1E5F1A9B0;
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
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  _QWORD v26[24];

  v26[22] = *MEMORY[0x1E0C80C00];
  v25 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("absoluteTimestamp"), 1, 0, 0);
  v26[0] = v25;
  v24 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("age"), 2, 13, 0);
  v26[1] = v24;
  v23 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("gender"), 3, 13, 0);
  v26[2] = v23;
  v22 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("skinTone"), 4, 13, 0);
  v26[3] = v22;
  v21 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("ethnicity"), 5, 13, 0);
  v26[4] = v21;
  v20 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("deviceLanguage"), 6, 13, 0);
  v26[5] = v20;
  v19 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("proofingDecision"), 7, 13, 0);
  v26[6] = v19;
  v18 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("issuer"), 8, 13, 0);
  v26[7] = v18;
  v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("livenessAssessment"), 9, 13, 0);
  v26[8] = v17;
  v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("gestureAssessment"), 10, 13, 0);
  v26[9] = v16;
  v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("axSettings"), 11, 13, 0);
  v26[10] = v15;
  v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("facVersion"), 12, 13, 0);
  v26[11] = v14;
  v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("facePoseVersion"), 13, 13, 0);
  v26[12] = v13;
  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("padtoolVersion"), 14, 13, 0);
  v26[13] = v2;
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("prdVersion"), 15, 13, 0);
  v26[14] = v3;
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("didStepUp"), 16, 12, 0);
  v26[15] = v4;
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("passiveGestureAssessment"), 17, 13, 0);
  v26[16] = v5;
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("passiveLivenessAssessment"), 18, 13, 0);
  v26[17] = v6;
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("passiveLivenessFacVersion"), 19, 13, 0);
  v26[18] = v7;
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("passiveLivenessFacePoseVersion"), 20, 13, 0);
  v26[19] = v8;
  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("passiveLivenessPadtoolVersion"), 21, 13, 0);
  v26[20] = v9;
  v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("passiveLivenessPrdVersion"), 22, 13, 0);
  v26[21] = v10;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v26, 22);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

id __53__BMWalletPaymentsCommerceUserProofingResult_columns__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  void *v4;

  objc_msgSend(a2, "eventBodyKeepingBackingData:", 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_axSettingsJSONArray");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  BMConvertObjectToJSONString();
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (BMWalletPaymentsCommerceUserProofingResult)initWithAbsoluteTimestamp:(id)a3 age:(id)a4 gender:(id)a5 skinTone:(id)a6 ethnicity:(id)a7 deviceLanguage:(id)a8 proofingDecision:(id)a9 issuer:(id)a10 livenessAssessment:(id)a11 gestureAssessment:(id)a12 axSettings:(id)a13
{
  return -[BMWalletPaymentsCommerceUserProofingResult initWithAbsoluteTimestamp:age:gender:skinTone:ethnicity:deviceLanguage:proofingDecision:issuer:livenessAssessment:gestureAssessment:axSettings:facVersion:facePoseVersion:padtoolVersion:prdVersion:](self, "initWithAbsoluteTimestamp:age:gender:skinTone:ethnicity:deviceLanguage:proofingDecision:issuer:livenessAssessment:gestureAssessment:axSettings:facVersion:facePoseVersion:padtoolVersion:prdVersion:", a3, a4, a5, a6, a7, a8, a9, a10, a11, a12, a13, 0, 0, 0, 0);
}

- (BMWalletPaymentsCommerceUserProofingResult)initWithAbsoluteTimestamp:(id)a3 age:(id)a4 gender:(id)a5 skinTone:(id)a6 ethnicity:(id)a7 deviceLanguage:(id)a8 proofingDecision:(id)a9 issuer:(id)a10 livenessAssessment:(id)a11 gestureAssessment:(id)a12 axSettings:(id)a13 facVersion:(id)a14 facePoseVersion:(id)a15 padtoolVersion:(id)a16 prdVersion:(id)a17
{
  return -[BMWalletPaymentsCommerceUserProofingResult initWithAbsoluteTimestamp:age:gender:skinTone:ethnicity:deviceLanguage:proofingDecision:issuer:livenessAssessment:gestureAssessment:axSettings:facVersion:facePoseVersion:padtoolVersion:prdVersion:didStepUp:passiveGestureAssessment:passiveLivenessAssessment:passiveLivenessFacVersion:passiveLivenessFacePoseVersion:passiveLivenessPadtoolVersion:passiveLivenessPrdVersion:](self, "initWithAbsoluteTimestamp:age:gender:skinTone:ethnicity:deviceLanguage:proofingDecision:issuer:livenessAssessment:gestureAssessment:axSettings:facVersion:facePoseVersion:padtoolVersion:prdVersion:didStepUp:passiveGestureAssessment:passiveLivenessAssessment:passiveLivenessFacVersion:passiveLivenessFacePoseVersion:passiveLivenessPadtoolVersion:passiveLivenessPrdVersion:", a3, a4, a5, a6, a7, a8, a9, a10, a11, a12, a13, a14, a15, a16,
           a17,
           0,
           0,
           0,
           0,
           0,
           0,
           0);
}

@end
