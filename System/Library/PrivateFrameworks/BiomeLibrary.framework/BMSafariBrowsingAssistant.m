@implementation BMSafariBrowsingAssistant

- (BMSafariBrowsingAssistant)initWithWebpageViewStarted:(id)a3 dimensionContext:(id)a4 bloomFilterPassed:(id)a5 eligible:(id)a6 webpageUrlSent:(id)a7 serverRequestContext:(id)a8 visualComponentPresentationContext:(id)a9 userInteractionDetected:(id)a10
{
  id v17;
  BMSafariBrowsingAssistant *v18;
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  id v25;
  id v26;
  objc_super v27;

  v26 = a3;
  v25 = a4;
  v24 = a5;
  v23 = a6;
  v22 = a7;
  v21 = a8;
  v20 = a9;
  v17 = a10;
  v27.receiver = self;
  v27.super_class = (Class)BMSafariBrowsingAssistant;
  v18 = -[BMEventBase init](&v27, sel_init);
  if (v18)
  {
    v18->_dataVersion = objc_msgSend((id)objc_opt_class(), "latestDataVersion");
    objc_storeStrong((id *)&v18->_webpageViewStarted, a3);
    objc_storeStrong((id *)&v18->_dimensionContext, a4);
    objc_storeStrong((id *)&v18->_bloomFilterPassed, a5);
    objc_storeStrong((id *)&v18->_eligible, a6);
    objc_storeStrong((id *)&v18->_webpageUrlSent, a7);
    objc_storeStrong((id *)&v18->_serverRequestContext, a8);
    objc_storeStrong((id *)&v18->_visualComponentPresentationContext, a9);
    objc_storeStrong((id *)&v18->_userInteractionDetected, a10);
  }

  return v18;
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
  -[BMSafariBrowsingAssistant webpageViewStarted](self, "webpageViewStarted");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMSafariBrowsingAssistant dimensionContext](self, "dimensionContext");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMSafariBrowsingAssistant bloomFilterPassed](self, "bloomFilterPassed");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMSafariBrowsingAssistant eligible](self, "eligible");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMSafariBrowsingAssistant webpageUrlSent](self, "webpageUrlSent");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMSafariBrowsingAssistant serverRequestContext](self, "serverRequestContext");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMSafariBrowsingAssistant visualComponentPresentationContext](self, "visualComponentPresentationContext");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMSafariBrowsingAssistant userInteractionDetected](self, "userInteractionDetected");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("BMSafariBrowsingAssistant with webpageViewStarted: %@, dimensionContext: %@, bloomFilterPassed: %@, eligible: %@, webpageUrlSent: %@, serverRequestContext: %@, visualComponentPresentationContext: %@, userInteractionDetected: %@"), v4, v5, v6, v7, v8, v9, v10, v11);

  return (NSString *)v12;
}

- (id)initByReadFrom:(id)a3
{
  _BYTE *v4;
  BMSafariBrowsingAssistant *v5;
  int *v6;
  int *v7;
  int *v8;
  int *v9;
  char v10;
  unsigned int v11;
  unint64_t v12;
  uint64_t v13;
  unint64_t v14;
  char v15;
  int v17;
  objc_class *v19;
  uint64_t v20;
  void *v21;
  BMSafariBrowsingAssistant *v22;
  objc_super v24;
  uint64_t v25;
  uint64_t v26;

  v4 = a3;
  v24.receiver = self;
  v24.super_class = (Class)BMSafariBrowsingAssistant;
  v5 = -[BMEventBase init](&v24, sel_init);
  if (!v5)
    goto LABEL_50;
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
        if (v14 == -1 || v14 >= *(_QWORD *)&v4[*v7])
          break;
        v15 = *(_BYTE *)(*(_QWORD *)&v4[*v9] + v14);
        *(_QWORD *)&v4[v13] = v14 + 1;
        v12 |= (unint64_t)(v15 & 0x7F) << v10;
        if ((v15 & 0x80) == 0)
          goto LABEL_13;
        v10 += 7;
        if (v11++ >= 9)
        {
          v12 = 0;
          v17 = v4[*v8];
          goto LABEL_15;
        }
      }
      v4[*v8] = 1;
LABEL_13:
      v17 = v4[*v8];
      if (v4[*v8])
        v12 = 0;
LABEL_15:
      if (v17 || (v12 & 7) == 4)
        break;
      switch((v12 >> 3))
      {
        case 1u:
          v25 = 0;
          v26 = 0;
          if ((PBReaderPlaceMark() & 1) == 0)
            goto LABEL_49;
          v19 = -[BMSafariBrowsingAssistantWebpageViewStarted initByReadFrom:]([BMSafariBrowsingAssistantWebpageViewStarted alloc], "initByReadFrom:", v4);
          if (!v19)
            goto LABEL_49;
          v20 = 24;
          goto LABEL_46;
        case 2u:
          v25 = 0;
          v26 = 0;
          if ((PBReaderPlaceMark() & 1) == 0)
            goto LABEL_49;
          v19 = -[BMSafariBrowsingAssistantDimensionContext initByReadFrom:]([BMSafariBrowsingAssistantDimensionContext alloc], "initByReadFrom:", v4);
          if (!v19)
            goto LABEL_49;
          v20 = 32;
          goto LABEL_46;
        case 3u:
          v25 = 0;
          v26 = 0;
          if ((PBReaderPlaceMark() & 1) == 0)
            goto LABEL_49;
          v19 = -[BMSafariBrowsingAssistantBloomFilterPassed initByReadFrom:]([BMSafariBrowsingAssistantBloomFilterPassed alloc], "initByReadFrom:", v4);
          if (!v19)
            goto LABEL_49;
          v20 = 40;
          goto LABEL_46;
        case 4u:
          v25 = 0;
          v26 = 0;
          if ((PBReaderPlaceMark() & 1) == 0)
            goto LABEL_49;
          v19 = -[BMSafariBrowsingAssistantEligible initByReadFrom:]([BMSafariBrowsingAssistantEligible alloc], "initByReadFrom:", v4);
          if (!v19)
            goto LABEL_49;
          v20 = 48;
          goto LABEL_46;
        case 5u:
          v25 = 0;
          v26 = 0;
          if ((PBReaderPlaceMark() & 1) == 0)
            goto LABEL_49;
          v19 = -[BMSafariBrowsingAssistantWebpageUrlSent initByReadFrom:]([BMSafariBrowsingAssistantWebpageUrlSent alloc], "initByReadFrom:", v4);
          if (!v19)
            goto LABEL_49;
          v20 = 56;
          goto LABEL_46;
        case 6u:
          v25 = 0;
          v26 = 0;
          if ((PBReaderPlaceMark() & 1) == 0)
            goto LABEL_49;
          v19 = -[BMSafariBrowsingAssistantServerRequestContext initByReadFrom:]([BMSafariBrowsingAssistantServerRequestContext alloc], "initByReadFrom:", v4);
          if (!v19)
            goto LABEL_49;
          v20 = 64;
          goto LABEL_46;
        case 7u:
          v25 = 0;
          v26 = 0;
          if ((PBReaderPlaceMark() & 1) == 0)
            goto LABEL_49;
          v19 = -[BMSafariBrowsingAssistantVisualComponentPresentationContext initByReadFrom:]([BMSafariBrowsingAssistantVisualComponentPresentationContext alloc], "initByReadFrom:", v4);
          if (!v19)
            goto LABEL_49;
          v20 = 72;
          goto LABEL_46;
        case 8u:
          v25 = 0;
          v26 = 0;
          if ((PBReaderPlaceMark() & 1) == 0)
            goto LABEL_49;
          v19 = -[BMSafariBrowsingAssistantUserInteractionDetected initByReadFrom:]([BMSafariBrowsingAssistantUserInteractionDetected alloc], "initByReadFrom:", v4);
          if (!v19)
            goto LABEL_49;
          v20 = 80;
LABEL_46:
          v21 = *(Class *)((char *)&v5->super.super.isa + v20);
          *(Class *)((char *)&v5->super.super.isa + v20) = v19;

          PBReaderRecallMark();
          break;
        default:
          if (!PBReaderSkipValueWithTag())
            goto LABEL_49;
          break;
      }
    }
    while (*(_QWORD *)&v4[*v6] < *(_QWORD *)&v4[*v7]);
  }
  if (v4[*v8])
LABEL_49:
    v22 = 0;
  else
LABEL_50:
    v22 = v5;

  return v22;
}

- (void)writeTo:(id)a3
{
  id v4;

  v4 = a3;
  if (self->_webpageViewStarted)
  {
    PBDataWriterPlaceMark();
    -[BMSafariBrowsingAssistantWebpageViewStarted writeTo:](self->_webpageViewStarted, "writeTo:", v4);
    PBDataWriterRecallMark();
  }
  if (self->_dimensionContext)
  {
    PBDataWriterPlaceMark();
    -[BMSafariBrowsingAssistantDimensionContext writeTo:](self->_dimensionContext, "writeTo:", v4);
    PBDataWriterRecallMark();
  }
  if (self->_bloomFilterPassed)
  {
    PBDataWriterPlaceMark();
    -[BMSafariBrowsingAssistantBloomFilterPassed writeTo:](self->_bloomFilterPassed, "writeTo:", v4);
    PBDataWriterRecallMark();
  }
  if (self->_eligible)
  {
    PBDataWriterPlaceMark();
    -[BMSafariBrowsingAssistantEligible writeTo:](self->_eligible, "writeTo:", v4);
    PBDataWriterRecallMark();
  }
  if (self->_webpageUrlSent)
  {
    PBDataWriterPlaceMark();
    -[BMSafariBrowsingAssistantWebpageUrlSent writeTo:](self->_webpageUrlSent, "writeTo:", v4);
    PBDataWriterRecallMark();
  }
  if (self->_serverRequestContext)
  {
    PBDataWriterPlaceMark();
    -[BMSafariBrowsingAssistantServerRequestContext writeTo:](self->_serverRequestContext, "writeTo:", v4);
    PBDataWriterRecallMark();
  }
  if (self->_visualComponentPresentationContext)
  {
    PBDataWriterPlaceMark();
    -[BMSafariBrowsingAssistantVisualComponentPresentationContext writeTo:](self->_visualComponentPresentationContext, "writeTo:", v4);
    PBDataWriterRecallMark();
  }
  if (self->_userInteractionDetected)
  {
    PBDataWriterPlaceMark();
    -[BMSafariBrowsingAssistantUserInteractionDetected writeTo:](self->_userInteractionDetected, "writeTo:", v4);
    PBDataWriterRecallMark();
  }

}

- (id)serialize
{
  void *v3;
  void *v4;

  v3 = (void *)objc_opt_new();
  -[BMSafariBrowsingAssistant writeTo:](self, "writeTo:", v3);
  objc_msgSend(v3, "immutableData");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (BMSafariBrowsingAssistant)initWithJSONDictionary:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  BMSafariBrowsingAssistantWebpageViewStarted *v8;
  id v9;
  id v10;
  BMSafariBrowsingAssistantBloomFilterPassed *v11;
  id v12;
  id v13;
  BMSafariBrowsingAssistantBloomFilterPassed *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  void *v18;
  id v19;
  BMSafariBrowsingAssistantUserInteractionDetected *v20;
  BMSafariBrowsingAssistant *v21;
  id v22;
  void *v23;
  id *v24;
  BMSafariBrowsingAssistantDimensionContext *v25;
  id v26;
  void *v27;
  id v28;
  void *v29;
  id v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  id v34;
  id v35;
  void *v36;
  id v37;
  uint64_t v38;
  uint64_t v39;
  void *v40;
  id v41;
  void *v42;
  id v43;
  id v44;
  void *v45;
  void *v46;
  id v47;
  uint64_t v48;
  id *v49;
  uint64_t v50;
  void *v51;
  id v52;
  id v53;
  id v54;
  void *v55;
  id v56;
  void *v57;
  uint64_t v58;
  id *v59;
  id v60;
  id v61;
  void *v62;
  BMSafariBrowsingAssistantBloomFilterPassed *v63;
  BMSafariBrowsingAssistantWebpageViewStarted *v64;
  id v65;
  void *v66;
  id v67;
  void *v68;
  BMSafariBrowsingAssistantWebpageViewStarted *v69;
  id v70;
  void *v71;
  id v72;
  uint64_t v73;
  id v74;
  void *v75;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  id v80;
  id v81;
  BMSafariBrowsingAssistantBloomFilterPassed *v82;
  BMSafariBrowsingAssistantBloomFilterPassed *v83;
  void *v84;
  uint64_t v85;
  id v86;
  BMSafariBrowsingAssistantVisualComponentPresentationContext *v87;
  id v88;
  void *v89;
  id v90;
  uint64_t v91;
  BMSafariBrowsingAssistantServerRequestContext *v92;
  id v93;
  BMSafariBrowsingAssistantWebpageUrlSent *v94;
  id v95;
  id *v96;
  BMSafariBrowsingAssistantEligible *v97;
  BMSafariBrowsingAssistantWebpageViewStarted *v98;
  BMSafariBrowsingAssistantWebpageViewStarted *v99;
  BMSafariBrowsingAssistantWebpageViewStarted *v100;
  BMSafariBrowsingAssistantDimensionContext *v101;
  BMSafariBrowsingAssistant *v102;
  id v103;
  id v104;
  id v105;
  id v106;
  id v107;
  id v108;
  id v109;
  id v110;
  uint64_t v111;
  BMSafariBrowsingAssistantUserInteractionDetected *v112;
  uint64_t v113;
  BMSafariBrowsingAssistantVisualComponentPresentationContext *v114;
  uint64_t v115;
  BMSafariBrowsingAssistantServerRequestContext *v116;
  uint64_t v117;
  BMSafariBrowsingAssistantWebpageUrlSent *v118;
  uint64_t v119;
  BMSafariBrowsingAssistantEligible *v120;
  uint64_t v121;
  uint64_t v122;
  uint64_t v123;
  uint64_t v124;
  uint64_t v125;
  _QWORD v126[3];

  v126[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("webpageViewStarted"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v8 = 0;
    goto LABEL_4;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v9 = v7;
    v110 = 0;
    v8 = -[BMSafariBrowsingAssistantWebpageViewStarted initWithJSONDictionary:error:]([BMSafariBrowsingAssistantWebpageViewStarted alloc], "initWithJSONDictionary:error:", v9, &v110);
    v22 = v110;
    if (v22)
    {
      v23 = v22;
      if (a4)
        *a4 = objc_retainAutorelease(v22);

LABEL_50:
      v21 = 0;
      goto LABEL_100;
    }

LABEL_4:
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("dimensionContext"));
    v9 = (id)objc_claimAutoreleasedReturnValue();
    if (!v9 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      v101 = 0;
LABEL_7:
      objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("bloomFilterPassed"));
      v10 = (id)objc_claimAutoreleasedReturnValue();
      v102 = self;
      if (!v10 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
      {
        v11 = 0;
        goto LABEL_10;
      }
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v12 = v10;
        v108 = 0;
        v11 = -[BMSafariBrowsingAssistantBloomFilterPassed initWithJSONDictionary:error:]([BMSafariBrowsingAssistantBloomFilterPassed alloc], "initWithJSONDictionary:error:", v12, &v108);
        v28 = v108;
        if (v28)
        {
          v29 = v28;
          if (a4)
            *a4 = objc_retainAutorelease(v28);

          v21 = 0;
          goto LABEL_97;
        }

LABEL_10:
        objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("eligible"));
        v12 = (id)objc_claimAutoreleasedReturnValue();
        v96 = a4;
        if (v12 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {
            if (!a4)
            {
              v21 = 0;
LABEL_97:
              v25 = v101;
              goto LABEL_98;
            }
            v95 = objc_alloc(MEMORY[0x1E0CB35C8]);
            v58 = *MEMORY[0x1E0D025B8];
            v119 = *MEMORY[0x1E0CB2D50];
            v82 = v11;
            v59 = a4;
            v97 = (BMSafariBrowsingAssistantEligible *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSDictionary"), objc_opt_class(), CFSTR("eligible"));
            v120 = v97;
            objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v120, &v119, 1);
            v13 = (id)objc_claimAutoreleasedReturnValue();
            v60 = (id)objc_msgSend(v95, "initWithDomain:code:userInfo:", v58, 2, v13);
            v21 = 0;
            *v59 = v60;
            v11 = v82;
LABEL_96:

            goto LABEL_97;
          }
          v13 = v12;
          v107 = 0;
          v97 = -[BMSafariBrowsingAssistantEligible initWithJSONDictionary:error:]([BMSafariBrowsingAssistantEligible alloc], "initWithJSONDictionary:error:", v13, &v107);
          v35 = v107;
          if (v35)
          {
            v36 = v35;
            if (v96)
              *v96 = objc_retainAutorelease(v35);

LABEL_74:
            v21 = 0;
            goto LABEL_96;
          }

        }
        else
        {
          v97 = 0;
        }
        objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("webpageUrlSent"));
        v13 = (id)objc_claimAutoreleasedReturnValue();
        if (!v13 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
        {
          v90 = v13;
          v14 = v11;
          v94 = 0;
          goto LABEL_16;
        }
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v42 = v13;
          v14 = v11;
          v90 = v42;
          v43 = v42;
          v106 = 0;
          v94 = -[BMSafariBrowsingAssistantWebpageUrlSent initWithJSONDictionary:error:]([BMSafariBrowsingAssistantWebpageUrlSent alloc], "initWithJSONDictionary:error:", v43, &v106);
          v44 = v106;
          if (v44)
          {
            v45 = v44;
            if (v96)
              *v96 = objc_retainAutorelease(v44);

            v21 = 0;
            v46 = v43;
            goto LABEL_105;
          }

LABEL_16:
          objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("serverRequestContext"));
          v15 = objc_claimAutoreleasedReturnValue();
          v89 = (void *)v15;
          if (!v15 || (v16 = (void *)v15, objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
          {
            v86 = v12;
            v92 = 0;
            goto LABEL_19;
          }
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v53 = v16;
            v105 = 0;
            v92 = -[BMSafariBrowsingAssistantServerRequestContext initWithJSONDictionary:error:]([BMSafariBrowsingAssistantServerRequestContext alloc], "initWithJSONDictionary:error:", v53, &v105);
            v54 = v105;
            v86 = v12;
            if (v54)
            {
              v55 = v54;
              v56 = v53;
              v11 = v14;
              if (v96)
                *v96 = objc_retainAutorelease(v54);

              v21 = 0;
              v13 = v90;
              v57 = v56;
              goto LABEL_108;
            }

LABEL_19:
            v11 = v14;
            objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("visualComponentPresentationContext"));
            v17 = objc_claimAutoreleasedReturnValue();
            v13 = v90;
            v98 = v8;
            v84 = (void *)v17;
            if (!v17 || (v18 = (void *)v17, objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
            {
              v87 = 0;
              goto LABEL_22;
            }
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              v19 = v18;
              v104 = 0;
              v87 = -[BMSafariBrowsingAssistantVisualComponentPresentationContext initWithJSONDictionary:error:]([BMSafariBrowsingAssistantVisualComponentPresentationContext alloc], "initWithJSONDictionary:error:", v19, &v104);
              v61 = v104;
              if (v61)
              {
                v62 = v61;
                v12 = v86;
                if (v96)
                  *v96 = objc_retainAutorelease(v61);

                v21 = 0;
                goto LABEL_93;
              }

LABEL_22:
              v12 = v86;
              objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("userInteractionDetected"));
              v19 = (id)objc_claimAutoreleasedReturnValue();
              if (!v19 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
              {
                v20 = 0;
LABEL_25:
                v21 = -[BMSafariBrowsingAssistant initWithWebpageViewStarted:dimensionContext:bloomFilterPassed:eligible:webpageUrlSent:serverRequestContext:visualComponentPresentationContext:userInteractionDetected:](v102, "initWithWebpageViewStarted:dimensionContext:bloomFilterPassed:eligible:webpageUrlSent:serverRequestContext:visualComponentPresentationContext:userInteractionDetected:", v98, v101, v11, v97, v94, v92, v87, v20);
                v102 = v21;
LABEL_92:

                goto LABEL_93;
              }
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0)
              {
                v103 = 0;
                v80 = v19;
                v20 = -[BMSafariBrowsingAssistantUserInteractionDetected initWithJSONDictionary:error:]([BMSafariBrowsingAssistantUserInteractionDetected alloc], "initWithJSONDictionary:error:", v80, &v103);
                v67 = v103;
                if (!v67)
                {

                  goto LABEL_25;
                }
                v68 = v67;
                v83 = v11;
                if (v96)
                  *v96 = objc_retainAutorelease(v67);

              }
              else
              {
                v83 = v11;
                if (!v96)
                {
                  v21 = 0;
                  goto LABEL_93;
                }
                v81 = objc_alloc(MEMORY[0x1E0CB35C8]);
                v79 = *MEMORY[0x1E0D025B8];
                v111 = *MEMORY[0x1E0CB2D50];
                v20 = (BMSafariBrowsingAssistantUserInteractionDetected *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSDictionary"), objc_opt_class(), CFSTR("userInteractionDetected"));
                v112 = v20;
                objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v112, &v111, 1);
                v75 = (void *)objc_claimAutoreleasedReturnValue();
                *v96 = (id)objc_msgSend(v81, "initWithDomain:code:userInfo:", v79, 2, v75);

              }
              v21 = 0;
              v11 = v83;
              goto LABEL_92;
            }
            if (v96)
            {
              v72 = objc_alloc(MEMORY[0x1E0CB35C8]);
              v73 = *MEMORY[0x1E0D025B8];
              v113 = *MEMORY[0x1E0CB2D50];
              v87 = (BMSafariBrowsingAssistantVisualComponentPresentationContext *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSDictionary"), objc_opt_class(), CFSTR("visualComponentPresentationContext"));
              v114 = v87;
              objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v114, &v113, 1);
              v19 = (id)objc_claimAutoreleasedReturnValue();
              v74 = (id)objc_msgSend(v72, "initWithDomain:code:userInfo:", v73, 2, v19);
              v21 = 0;
              *v96 = v74;
              v12 = v86;
LABEL_93:

              v8 = v98;
              v57 = v84;
              goto LABEL_94;
            }
            v21 = 0;
            v57 = v84;
LABEL_108:
            v12 = v86;
            goto LABEL_94;
          }
          if (v96)
          {
            v88 = objc_alloc(MEMORY[0x1E0CB35C8]);
            v85 = *MEMORY[0x1E0D025B8];
            v115 = *MEMORY[0x1E0CB2D50];
            v69 = v8;
            v70 = objc_alloc(MEMORY[0x1E0CB3940]);
            v78 = objc_opt_class();
            v71 = v70;
            v8 = v69;
            v11 = v14;
            v92 = (BMSafariBrowsingAssistantServerRequestContext *)objc_msgSend(v71, "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSDictionary"), v78, CFSTR("serverRequestContext"));
            v116 = v92;
            objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v116, &v115, 1);
            v57 = (void *)objc_claimAutoreleasedReturnValue();
            v21 = 0;
            *v96 = (id)objc_msgSend(v88, "initWithDomain:code:userInfo:", v85, 2, v57);
            v13 = v90;
LABEL_94:

            v46 = v89;
            goto LABEL_95;
          }
          v21 = 0;
          v46 = v89;
LABEL_105:
          v11 = v14;
          v13 = v90;
          goto LABEL_95;
        }
        if (v96)
        {
          v93 = objc_alloc(MEMORY[0x1E0CB35C8]);
          v91 = *MEMORY[0x1E0D025B8];
          v117 = *MEMORY[0x1E0CB2D50];
          v63 = v11;
          v64 = v8;
          v65 = objc_alloc(MEMORY[0x1E0CB3940]);
          v77 = objc_opt_class();
          v66 = v65;
          v8 = v64;
          v11 = v63;
          v94 = (BMSafariBrowsingAssistantWebpageUrlSent *)objc_msgSend(v66, "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSDictionary"), v77, CFSTR("webpageUrlSent"));
          v118 = v94;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v118, &v117, 1);
          v46 = (void *)objc_claimAutoreleasedReturnValue();
          v21 = 0;
          *v96 = (id)objc_msgSend(v93, "initWithDomain:code:userInfo:", v91, 2, v46);
LABEL_95:

          goto LABEL_96;
        }
        goto LABEL_74;
      }
      if (a4)
      {
        v100 = v8;
        v47 = objc_alloc(MEMORY[0x1E0CB35C8]);
        v48 = *MEMORY[0x1E0D025B8];
        v121 = *MEMORY[0x1E0CB2D50];
        v49 = a4;
        v50 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSDictionary"), objc_opt_class(), CFSTR("bloomFilterPassed"));
        v122 = v50;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v122, &v121, 1);
        v12 = (id)objc_claimAutoreleasedReturnValue();
        v51 = v47;
        v8 = v100;
        v25 = v101;
        v52 = (id)objc_msgSend(v51, "initWithDomain:code:userInfo:", v48, 2, v12);
        v21 = 0;
        *v49 = v52;
        v11 = (BMSafariBrowsingAssistantBloomFilterPassed *)v50;
LABEL_98:

        self = v102;
        goto LABEL_99;
      }
      v21 = 0;
      v25 = v101;
LABEL_99:

      goto LABEL_100;
    }
    v24 = a4;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v10 = v9;
      v109 = 0;
      v25 = -[BMSafariBrowsingAssistantDimensionContext initWithJSONDictionary:error:]([BMSafariBrowsingAssistantDimensionContext alloc], "initWithJSONDictionary:error:", v10, &v109);
      v26 = v109;
      if (v26)
      {
        v27 = v26;
        if (v24)
          *v24 = objc_retainAutorelease(v26);

        v21 = 0;
        goto LABEL_99;
      }
      v101 = v25;

      a4 = v24;
      goto LABEL_7;
    }
    if (a4)
    {
      v99 = v8;
      v37 = objc_alloc(MEMORY[0x1E0CB35C8]);
      v38 = *MEMORY[0x1E0D025B8];
      v123 = *MEMORY[0x1E0CB2D50];
      v39 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSDictionary"), objc_opt_class(), CFSTR("dimensionContext"));
      v124 = v39;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v124, &v123, 1);
      v10 = (id)objc_claimAutoreleasedReturnValue();
      v40 = v37;
      v8 = v99;
      v25 = (BMSafariBrowsingAssistantDimensionContext *)v39;
      v41 = (id)objc_msgSend(v40, "initWithDomain:code:userInfo:", v38, 2, v10);
      v21 = 0;
      *v24 = v41;
      goto LABEL_99;
    }
    goto LABEL_50;
  }
  if (a4)
  {
    v30 = objc_alloc(MEMORY[0x1E0CB35C8]);
    v31 = *MEMORY[0x1E0D025B8];
    v125 = *MEMORY[0x1E0CB2D50];
    v32 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSDictionary"), objc_opt_class(), CFSTR("webpageViewStarted"));
    v126[0] = v32;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v126, &v125, 1);
    v9 = (id)objc_claimAutoreleasedReturnValue();
    v33 = v30;
    v8 = (BMSafariBrowsingAssistantWebpageViewStarted *)v32;
    v34 = (id)objc_msgSend(v33, "initWithDomain:code:userInfo:", v31, 2, v9);
    v21 = 0;
    *a4 = v34;
LABEL_100:

    goto LABEL_101;
  }
  v21 = 0;
LABEL_101:

  return v21;
}

- (id)jsonDictionary
{
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  _QWORD v36[8];
  _QWORD v37[10];

  v37[8] = *MEMORY[0x1E0C80C00];
  -[BMSafariBrowsingAssistant webpageViewStarted](self, "webpageViewStarted");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "jsonDictionary");
  v4 = objc_claimAutoreleasedReturnValue();

  -[BMSafariBrowsingAssistant dimensionContext](self, "dimensionContext");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "jsonDictionary");
  v6 = objc_claimAutoreleasedReturnValue();

  -[BMSafariBrowsingAssistant bloomFilterPassed](self, "bloomFilterPassed");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "jsonDictionary");
  v8 = objc_claimAutoreleasedReturnValue();

  -[BMSafariBrowsingAssistant eligible](self, "eligible");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "jsonDictionary");
  v10 = objc_claimAutoreleasedReturnValue();

  -[BMSafariBrowsingAssistant webpageUrlSent](self, "webpageUrlSent");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "jsonDictionary");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  -[BMSafariBrowsingAssistant serverRequestContext](self, "serverRequestContext");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "jsonDictionary");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  -[BMSafariBrowsingAssistant visualComponentPresentationContext](self, "visualComponentPresentationContext");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "jsonDictionary");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  -[BMSafariBrowsingAssistant userInteractionDetected](self, "userInteractionDetected");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "jsonDictionary");
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  v36[0] = CFSTR("webpageViewStarted");
  v19 = v4;
  if (!v4)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v19 = objc_claimAutoreleasedReturnValue();
  }
  v31 = (void *)v19;
  v37[0] = v19;
  v36[1] = CFSTR("dimensionContext");
  v20 = v6;
  if (!v6)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v20 = objc_claimAutoreleasedReturnValue();
  }
  v35 = (void *)v4;
  v30 = (void *)v20;
  v37[1] = v20;
  v36[2] = CFSTR("bloomFilterPassed");
  v21 = v8;
  if (!v8)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v21 = objc_claimAutoreleasedReturnValue();
  }
  v34 = (void *)v6;
  v29 = (void *)v21;
  v37[2] = v21;
  v36[3] = CFSTR("eligible");
  v22 = (void *)v10;
  if (!v10)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v33 = (void *)v8;
  v37[3] = v22;
  v36[4] = CFSTR("webpageUrlSent");
  v23 = v12;
  if (!v12)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v32 = (void *)v10;
  v37[4] = v23;
  v36[5] = CFSTR("serverRequestContext");
  v24 = v14;
  if (!v14)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v37[5] = v24;
  v36[6] = CFSTR("visualComponentPresentationContext");
  v25 = v16;
  if (!v16)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v37[6] = v25;
  v36[7] = CFSTR("userInteractionDetected");
  v26 = v18;
  if (!v18)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v37[7] = v26;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v37, v36, 8);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  if (v18)
  {
    if (v16)
      goto LABEL_19;
  }
  else
  {

    if (v16)
      goto LABEL_19;
  }

LABEL_19:
  if (!v14)

  if (!v12)
  if (!v32)

  if (!v33)
  if (!v34)
  {

    if (v35)
      goto LABEL_29;
LABEL_33:

    goto LABEL_29;
  }
  if (!v35)
    goto LABEL_33;
LABEL_29:

  return v27;
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
  void *v50;
  void *v51;
  void *v52;
  void *v53;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    -[BMSafariBrowsingAssistant webpageViewStarted](self, "webpageViewStarted");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "webpageViewStarted");
    v7 = objc_claimAutoreleasedReturnValue();
    if (v6 == (void *)v7)
    {

    }
    else
    {
      v8 = (void *)v7;
      -[BMSafariBrowsingAssistant webpageViewStarted](self, "webpageViewStarted");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "webpageViewStarted");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v9, "isEqual:", v10);

      if (!v11)
        goto LABEL_29;
    }
    -[BMSafariBrowsingAssistant dimensionContext](self, "dimensionContext");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "dimensionContext");
    v14 = objc_claimAutoreleasedReturnValue();
    if (v13 == (void *)v14)
    {

    }
    else
    {
      v15 = (void *)v14;
      -[BMSafariBrowsingAssistant dimensionContext](self, "dimensionContext");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "dimensionContext");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = objc_msgSend(v16, "isEqual:", v17);

      if (!v18)
        goto LABEL_29;
    }
    -[BMSafariBrowsingAssistant bloomFilterPassed](self, "bloomFilterPassed");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "bloomFilterPassed");
    v20 = objc_claimAutoreleasedReturnValue();
    if (v19 == (void *)v20)
    {

    }
    else
    {
      v21 = (void *)v20;
      -[BMSafariBrowsingAssistant bloomFilterPassed](self, "bloomFilterPassed");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "bloomFilterPassed");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = objc_msgSend(v22, "isEqual:", v23);

      if (!v24)
        goto LABEL_29;
    }
    -[BMSafariBrowsingAssistant eligible](self, "eligible");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "eligible");
    v26 = objc_claimAutoreleasedReturnValue();
    if (v25 == (void *)v26)
    {

    }
    else
    {
      v27 = (void *)v26;
      -[BMSafariBrowsingAssistant eligible](self, "eligible");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "eligible");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      v30 = objc_msgSend(v28, "isEqual:", v29);

      if (!v30)
        goto LABEL_29;
    }
    -[BMSafariBrowsingAssistant webpageUrlSent](self, "webpageUrlSent");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "webpageUrlSent");
    v32 = objc_claimAutoreleasedReturnValue();
    if (v31 == (void *)v32)
    {

    }
    else
    {
      v33 = (void *)v32;
      -[BMSafariBrowsingAssistant webpageUrlSent](self, "webpageUrlSent");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "webpageUrlSent");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      v36 = objc_msgSend(v34, "isEqual:", v35);

      if (!v36)
        goto LABEL_29;
    }
    -[BMSafariBrowsingAssistant serverRequestContext](self, "serverRequestContext");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "serverRequestContext");
    v38 = objc_claimAutoreleasedReturnValue();
    if (v37 == (void *)v38)
    {

    }
    else
    {
      v39 = (void *)v38;
      -[BMSafariBrowsingAssistant serverRequestContext](self, "serverRequestContext");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "serverRequestContext");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      v42 = objc_msgSend(v40, "isEqual:", v41);

      if (!v42)
        goto LABEL_29;
    }
    -[BMSafariBrowsingAssistant visualComponentPresentationContext](self, "visualComponentPresentationContext");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "visualComponentPresentationContext");
    v44 = objc_claimAutoreleasedReturnValue();
    if (v43 == (void *)v44)
    {

    }
    else
    {
      v45 = (void *)v44;
      -[BMSafariBrowsingAssistant visualComponentPresentationContext](self, "visualComponentPresentationContext");
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "visualComponentPresentationContext");
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      v48 = objc_msgSend(v46, "isEqual:", v47);

      if (!v48)
      {
LABEL_29:
        v12 = 0;
LABEL_30:

        goto LABEL_31;
      }
    }
    -[BMSafariBrowsingAssistant userInteractionDetected](self, "userInteractionDetected");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "userInteractionDetected");
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    if (v50 == v51)
    {
      v12 = 1;
    }
    else
    {
      -[BMSafariBrowsingAssistant userInteractionDetected](self, "userInteractionDetected");
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "userInteractionDetected");
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v52, "isEqual:", v53);

    }
    goto LABEL_30;
  }
  v12 = 0;
LABEL_31:

  return v12;
}

- (unsigned)dataVersion
{
  return self->_dataVersion;
}

- (BMSafariBrowsingAssistantWebpageViewStarted)webpageViewStarted
{
  return self->_webpageViewStarted;
}

- (BMSafariBrowsingAssistantDimensionContext)dimensionContext
{
  return self->_dimensionContext;
}

- (BMSafariBrowsingAssistantBloomFilterPassed)bloomFilterPassed
{
  return self->_bloomFilterPassed;
}

- (BMSafariBrowsingAssistantEligible)eligible
{
  return self->_eligible;
}

- (BMSafariBrowsingAssistantWebpageUrlSent)webpageUrlSent
{
  return self->_webpageUrlSent;
}

- (BMSafariBrowsingAssistantServerRequestContext)serverRequestContext
{
  return self->_serverRequestContext;
}

- (BMSafariBrowsingAssistantVisualComponentPresentationContext)visualComponentPresentationContext
{
  return self->_visualComponentPresentationContext;
}

- (BMSafariBrowsingAssistantUserInteractionDetected)userInteractionDetected
{
  return self->_userInteractionDetected;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userInteractionDetected, 0);
  objc_storeStrong((id *)&self->_visualComponentPresentationContext, 0);
  objc_storeStrong((id *)&self->_serverRequestContext, 0);
  objc_storeStrong((id *)&self->_webpageUrlSent, 0);
  objc_storeStrong((id *)&self->_eligible, 0);
  objc_storeStrong((id *)&self->_bloomFilterPassed, 0);
  objc_storeStrong((id *)&self->_dimensionContext, 0);
  objc_storeStrong((id *)&self->_webpageViewStarted, 0);
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

    v4 = -[BMSafariBrowsingAssistant initByReadFrom:]([BMSafariBrowsingAssistant alloc], "initByReadFrom:", v7);
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
  void *v10;
  _QWORD v12[9];

  v12[8] = *MEMORY[0x1E0C80C00];
  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02710]), "initWithName:dataType:requestOnly:extractBlock:", CFSTR("webpageViewStarted_json"), 5, 1, &__block_literal_global_728);
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02710]), "initWithName:dataType:requestOnly:extractBlock:", CFSTR("dimensionContext_json"), 5, 1, &__block_literal_global_729);
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02710]), "initWithName:dataType:requestOnly:extractBlock:", CFSTR("bloomFilterPassed_json"), 5, 1, &__block_literal_global_730);
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02710]), "initWithName:dataType:requestOnly:extractBlock:", CFSTR("eligible_json"), 5, 1, &__block_literal_global_731);
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02710]), "initWithName:dataType:requestOnly:extractBlock:", CFSTR("webpageUrlSent_json"), 5, 1, &__block_literal_global_732);
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02710]), "initWithName:dataType:requestOnly:extractBlock:", CFSTR("serverRequestContext_json"), 5, 1, &__block_literal_global_733);
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02710]), "initWithName:dataType:requestOnly:extractBlock:", CFSTR("visualComponentPresentationContext_json"), 5, 1, &__block_literal_global_734);
  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02710]), "initWithName:dataType:requestOnly:extractBlock:", CFSTR("userInteractionDetected_json"), 5, 1, &__block_literal_global_735);
  v12[0] = v2;
  v12[1] = v3;
  v12[2] = v4;
  v12[3] = v5;
  v12[4] = v6;
  v12[5] = v7;
  v12[6] = v8;
  v12[7] = v9;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v12, 8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

+ (id)validKeyPaths
{
  return &unk_1E5F1D3E0;
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
  _QWORD v12[9];

  v12[8] = *MEMORY[0x1E0C80C00];
  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("webpageViewStarted"), 1, 14, objc_opt_class());
  v12[0] = v2;
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("dimensionContext"), 2, 14, objc_opt_class());
  v12[1] = v3;
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("bloomFilterPassed"), 3, 14, objc_opt_class());
  v12[2] = v4;
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("eligible"), 4, 14, objc_opt_class());
  v12[3] = v5;
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("webpageUrlSent"), 5, 14, objc_opt_class());
  v12[4] = v6;
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("serverRequestContext"), 6, 14, objc_opt_class());
  v12[5] = v7;
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("visualComponentPresentationContext"), 7, 14, objc_opt_class());
  v12[6] = v8;
  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("userInteractionDetected"), 8, 14, objc_opt_class());
  v12[7] = v9;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v12, 8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

id __36__BMSafariBrowsingAssistant_columns__block_invoke_8(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(a2, "eventBodyKeepingBackingData:", 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "userInteractionDetected");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "jsonDictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  BMConvertObjectToJSONString();
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

id __36__BMSafariBrowsingAssistant_columns__block_invoke_7(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(a2, "eventBodyKeepingBackingData:", 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "visualComponentPresentationContext");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "jsonDictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  BMConvertObjectToJSONString();
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

id __36__BMSafariBrowsingAssistant_columns__block_invoke_6(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(a2, "eventBodyKeepingBackingData:", 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "serverRequestContext");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "jsonDictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  BMConvertObjectToJSONString();
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

id __36__BMSafariBrowsingAssistant_columns__block_invoke_5(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(a2, "eventBodyKeepingBackingData:", 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "webpageUrlSent");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "jsonDictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  BMConvertObjectToJSONString();
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

id __36__BMSafariBrowsingAssistant_columns__block_invoke_4(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(a2, "eventBodyKeepingBackingData:", 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "eligible");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "jsonDictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  BMConvertObjectToJSONString();
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

id __36__BMSafariBrowsingAssistant_columns__block_invoke_3(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(a2, "eventBodyKeepingBackingData:", 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "bloomFilterPassed");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "jsonDictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  BMConvertObjectToJSONString();
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

id __36__BMSafariBrowsingAssistant_columns__block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(a2, "eventBodyKeepingBackingData:", 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "dimensionContext");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "jsonDictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  BMConvertObjectToJSONString();
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

id __36__BMSafariBrowsingAssistant_columns__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(a2, "eventBodyKeepingBackingData:", 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "webpageViewStarted");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "jsonDictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  BMConvertObjectToJSONString();
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

@end
