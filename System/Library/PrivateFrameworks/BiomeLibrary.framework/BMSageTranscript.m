@implementation BMSageTranscript

- (BMSageTranscript)initWithAbsoluteTimestamp:(id)a3 eventLabel:(id)a4 eventType:(id)a5 serializationFormat:(int)a6 eventPayload:(id)a7 monotonicTimestamp:(id)a8 identifiers:(id)a9
{
  id v14;
  id v15;
  id v16;
  id v17;
  BMSageTranscript *v18;
  double v19;
  id v22;
  id v23;
  objc_super v24;

  v14 = a3;
  v23 = a4;
  v22 = a5;
  v15 = a7;
  v16 = a8;
  v17 = a9;
  v24.receiver = self;
  v24.super_class = (Class)BMSageTranscript;
  v18 = -[BMEventBase init](&v24, sel_init);
  if (v18)
  {
    v18->_dataVersion = objc_msgSend((id)objc_opt_class(), "latestDataVersion");
    if (v14)
    {
      v18->_hasRaw_absoluteTimestamp = 1;
      objc_msgSend(v14, "timeIntervalSinceReferenceDate");
    }
    else
    {
      v18->_hasRaw_absoluteTimestamp = 0;
      v19 = -1.0;
    }
    v18->_raw_absoluteTimestamp = v19;
    objc_storeStrong((id *)&v18->_eventLabel, a4);
    objc_storeStrong((id *)&v18->_eventType, a5);
    v18->_serializationFormat = a6;
    objc_storeStrong((id *)&v18->_eventPayload, a7);
    objc_storeStrong((id *)&v18->_monotonicTimestamp, a8);
    objc_storeStrong((id *)&v18->_identifiers, a9);
  }

  return v18;
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
  id v15;
  id v16;
  void *v17;
  void *v18;

  v15 = objc_alloc(MEMORY[0x1E0CB3940]);
  -[BMSageTranscript absoluteTimestamp](self, "absoluteTimestamp");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)MEMORY[0x1E0CB37E8];
  -[BMSageTranscript _machAbsoluteTime](self, "_machAbsoluteTime");
  objc_msgSend(v3, "numberWithDouble:");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMSageTranscript _sessionID](self, "_sessionID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMSageTranscript _bootSessionID](self, "_bootSessionID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMSageTranscript _clientSessionID](self, "_clientSessionID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMSageTranscript eventLabel](self, "eventLabel");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMSageTranscript eventType](self, "eventType");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  BMSageTranscriptSerializationFormatAsString(-[BMSageTranscript serializationFormat](self, "serializationFormat"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMSageTranscript eventPayload](self, "eventPayload");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMSageTranscript _sageMetadata](self, "_sageMetadata");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMSageTranscript monotonicTimestamp](self, "monotonicTimestamp");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMSageTranscript identifiers](self, "identifiers");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = (id)objc_msgSend(v15, "initWithFormat:", CFSTR("BMSageTranscript with absoluteTimestamp: %@, _machAbsoluteTime: %@, _sessionID: %@, _bootSessionID: %@, _clientSessionID: %@, eventLabel: %@, eventType: %@, serializationFormat: %@, eventPayload: %@, _sageMetadata: %@, monotonicTimestamp: %@, identifiers: %@"), v18, v17, v4, v5, v6, v7, v8, v9, v10, v11, v12, v13);

  return (NSString *)v16;
}

- (id)initByReadFrom:(id)a3
{
  _BYTE *v4;
  BMSageTranscript *v5;
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
  uint64_t v20;
  unint64_t v21;
  objc_class *v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  char v27;
  unsigned int v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  unint64_t v32;
  char v33;
  void *v34;
  uint64_t v35;
  unint64_t v36;
  objc_class *v37;
  uint64_t v38;
  void *v39;
  uint64_t v40;
  BMSageTranscript *v41;
  objc_super v43;
  uint64_t v44;
  uint64_t v45;

  v4 = a3;
  v43.receiver = self;
  v43.super_class = (Class)BMSageTranscript;
  v5 = -[BMEventBase init](&v43, sel_init);
  if (!v5)
  {
LABEL_71:
    v41 = v5;
    goto LABEL_72;
  }
  v6 = (int *)MEMORY[0x1E0D82BF0];
  v7 = (int *)MEMORY[0x1E0D82BD8];
  v8 = (int *)MEMORY[0x1E0D82BC8];
  if (*(_QWORD *)&v4[*MEMORY[0x1E0D82BF0]] >= *(_QWORD *)&v4[*MEMORY[0x1E0D82BD8]])
  {
LABEL_69:
    if (v4[*v8])
      goto LABEL_70;
    goto LABEL_71;
  }
  v9 = (int *)MEMORY[0x1E0D82BB8];
  while (2)
  {
    if (v4[*v8])
      goto LABEL_69;
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
      goto LABEL_69;
    switch((v12 >> 3))
    {
      case 1u:
        v5->_hasRaw_absoluteTimestamp = 1;
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
        v40 = 24;
        goto LABEL_67;
      case 2u:
        PBReaderReadData();
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v23, "length") != 16)
          goto LABEL_73;
        v24 = 48;
        goto LABEL_42;
      case 3u:
        PBReaderReadString();
        v25 = objc_claimAutoreleasedReturnValue();
        v26 = 72;
        goto LABEL_37;
      case 4u:
        PBReaderReadString();
        v25 = objc_claimAutoreleasedReturnValue();
        v26 = 80;
        goto LABEL_37;
      case 5u:
        v27 = 0;
        v28 = 0;
        v29 = 0;
        while (2)
        {
          v30 = *v6;
          v31 = *(_QWORD *)&v4[v30];
          v32 = v31 + 1;
          if (v31 == -1 || v32 > *(_QWORD *)&v4[*v7])
          {
            v4[*v8] = 1;
          }
          else
          {
            v33 = *(_BYTE *)(*(_QWORD *)&v4[*v9] + v31);
            *(_QWORD *)&v4[v30] = v32;
            v29 |= (unint64_t)(v33 & 0x7F) << v27;
            if (v33 < 0)
            {
              v27 += 7;
              v17 = v28++ >= 9;
              if (v17)
              {
                LODWORD(v29) = 0;
                goto LABEL_60;
              }
              continue;
            }
          }
          break;
        }
        if (v4[*v8])
          LODWORD(v29) = 0;
LABEL_60:
        if (v29 >= 3)
          LODWORD(v29) = 0;
        v5->_serializationFormat = v29;
        goto LABEL_68;
      case 6u:
        PBReaderReadData();
        v25 = objc_claimAutoreleasedReturnValue();
        v26 = 88;
LABEL_37:
        v34 = *(Class *)((char *)&v5->super.super.isa + v26);
        *(Class *)((char *)&v5->super.super.isa + v26) = (Class)v25;
        goto LABEL_43;
      case 7u:
        PBReaderReadData();
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v23, "length") != 16)
          goto LABEL_73;
        v24 = 32;
        goto LABEL_42;
      case 8u:
        PBReaderReadData();
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v23, "length") == 16)
        {
          v24 = 40;
LABEL_42:
          v34 = *(Class *)((char *)&v5->super.super.isa + v24);
          *(Class *)((char *)&v5->super.super.isa + v24) = (Class)v23;
LABEL_43:

LABEL_68:
          if (*(_QWORD *)&v4[*v6] >= *(_QWORD *)&v4[*v7])
            goto LABEL_69;
          continue;
        }
LABEL_73:

LABEL_70:
        v41 = 0;
LABEL_72:

        return v41;
      case 9u:
        v5->_has_machAbsoluteTime = 1;
        v35 = *v6;
        v36 = *(_QWORD *)&v4[v35];
        if (v36 <= 0xFFFFFFFFFFFFFFF7 && v36 + 8 <= *(_QWORD *)&v4[*v7])
        {
          v22 = *(objc_class **)(*(_QWORD *)&v4[*v9] + v36);
          *(_QWORD *)&v4[v35] = v36 + 8;
        }
        else
        {
          v4[*v8] = 1;
          v22 = 0;
        }
        v40 = 112;
LABEL_67:
        *(Class *)((char *)&v5->super.super.isa + v40) = v22;
        goto LABEL_68;
      case 0xAu:
        v44 = 0;
        v45 = 0;
        if ((PBReaderPlaceMark() & 1) == 0)
          goto LABEL_70;
        v37 = -[BMSageMetadata initByReadFrom:]([BMSageMetadata alloc], "initByReadFrom:", v4);
        if (!v37)
          goto LABEL_70;
        v38 = 144;
        goto LABEL_56;
      case 0xBu:
        v44 = 0;
        v45 = 0;
        if ((PBReaderPlaceMark() & 1) == 0)
          goto LABEL_70;
        v37 = -[BMMonotonicTimestamp initByReadFrom:]([BMMonotonicTimestamp alloc], "initByReadFrom:", v4);
        if (!v37)
          goto LABEL_70;
        v38 = 96;
        goto LABEL_56;
      case 0xCu:
        v44 = 0;
        v45 = 0;
        if ((PBReaderPlaceMark() & 1) == 0)
          goto LABEL_70;
        v37 = -[BMIntelligenceFlowIdentifiers initByReadFrom:]([BMIntelligenceFlowIdentifiers alloc], "initByReadFrom:", v4);
        if (!v37)
          goto LABEL_70;
        v38 = 104;
LABEL_56:
        v39 = *(Class *)((char *)&v5->super.super.isa + v38);
        *(Class *)((char *)&v5->super.super.isa + v38) = v37;

        PBReaderRecallMark();
        goto LABEL_68;
      default:
        if ((PBReaderSkipValueWithTag() & 1) == 0)
          goto LABEL_70;
        goto LABEL_68;
    }
  }
}

- (void)writeTo:(id)a3
{
  id v4;

  v4 = a3;
  if (self->_hasRaw_absoluteTimestamp)
    PBDataWriterWriteDoubleField();
  if (self->_has_machAbsoluteTime)
    PBDataWriterWriteDoubleField();
  if (self->_raw__sessionID)
    PBDataWriterWriteDataField();
  if (self->_raw__bootSessionID)
    PBDataWriterWriteDataField();
  if (self->_raw__clientSessionID)
    PBDataWriterWriteDataField();
  if (self->_eventLabel)
    PBDataWriterWriteStringField();
  if (self->_eventType)
    PBDataWriterWriteStringField();
  PBDataWriterWriteUint32Field();
  if (self->_eventPayload)
    PBDataWriterWriteDataField();
  if (self->__sageMetadata)
  {
    PBDataWriterPlaceMark();
    -[BMSageMetadata writeTo:](self->__sageMetadata, "writeTo:", v4);
    PBDataWriterRecallMark();
  }
  if (self->_monotonicTimestamp)
  {
    PBDataWriterPlaceMark();
    -[BMMonotonicTimestamp writeTo:](self->_monotonicTimestamp, "writeTo:", v4);
    PBDataWriterRecallMark();
  }
  if (self->_identifiers)
  {
    PBDataWriterPlaceMark();
    -[BMIntelligenceFlowIdentifiers writeTo:](self->_identifiers, "writeTo:", v4);
    PBDataWriterRecallMark();
  }

}

- (id)serialize
{
  void *v3;
  void *v4;

  v3 = (void *)objc_opt_new();
  -[BMSageTranscript writeTo:](self, "writeTo:", v3);
  objc_msgSend(v3, "immutableData");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (BMSageTranscript)initWithJSONDictionary:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  id v14;
  id v15;
  objc_class *v16;
  id v17;
  uint64_t v18;
  objc_class *v19;
  id v20;
  id v21;
  double v22;
  double v23;
  objc_class *v24;
  uint64_t v25;
  id *v26;
  id v27;
  void *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  id v32;
  BMSageTranscript *v33;
  id v34;
  id v35;
  id *v36;
  uint64_t v37;
  void *v38;
  void *v39;
  id v40;
  id v41;
  id *v42;
  uint64_t v43;
  id *v44;
  uint64_t v45;
  void *v46;
  uint64_t v47;
  id *v48;
  objc_class *v49;
  uint64_t v50;
  id v51;
  id v52;
  void *v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  id v57;
  id *v58;
  id v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  id *v63;
  id v64;
  uint64_t v65;
  id v66;
  uint64_t v67;
  void *v68;
  uint64_t v69;
  void *v70;
  uint64_t v71;
  void *v72;
  uint64_t v73;
  void *v74;
  id v75;
  uint64_t v76;
  void *v77;
  uint64_t v78;
  void *v79;
  id v80;
  void *v81;
  id v82;
  void *v83;
  void *v84;
  BMIntelligenceFlowIdentifiers *v85;
  id v86;
  void *v87;
  id v88;
  uint64_t v89;
  void *v90;
  id v91;
  void *v92;
  id v93;
  id *v94;
  uint64_t v95;
  id v96;
  id *v97;
  id v98;
  id v99;
  void *v100;
  void *v101;
  uint64_t v102;
  void *v103;
  id v104;
  void *v105;
  uint64_t v106;
  uint64_t v107;
  uint64_t v108;
  id v109;
  void *v110;
  void *v111;
  void *v112;
  void *v113;
  uint64_t v114;
  id v115;
  void *v116;
  uint64_t v117;
  uint64_t v118;
  uint64_t v119;
  id v120;
  id v121;
  void *v122;
  void *v123;
  id v124;
  void *v125;
  uint64_t v126;
  void *v127;
  id *v128;
  void *v129;
  uint64_t v130;
  id v131;
  id v132;
  void *v133;
  id v134;
  id v135;
  void *v136;
  void *v137;
  id v138;
  void *v139;
  uint64_t v140;
  uint64_t v141;
  id *v142;
  uint64_t v143;
  void *v144;
  uint64_t v145;
  void *v146;
  uint64_t v148;
  uint64_t v149;
  uint64_t v150;
  uint64_t v151;
  void *v152;
  uint64_t v153;
  id *v154;
  void *v155;
  void *v156;
  BMSageMetadata *v157;
  id v158;
  void *v159;
  BMMonotonicTimestamp *v160;
  id v161;
  void *v162;
  void *v163;
  id v164;
  id *v165;
  id *v166;
  id *v167;
  void *v168;
  id v169;
  id v170;
  id v171;
  id v172;
  id v173;
  id v174;
  uint64_t v175;
  id v176;
  id v177;
  id v178;
  id v179;
  void *v180;
  id v181;
  id *v182;
  void *v183;
  void *v184;
  void *v185;
  void *v186;
  void *v187;
  void *v188;
  id v189;
  void *v190;
  void *v191;
  id v192;
  BMSageTranscript *v193;
  id v194;
  id v195;
  id v196;
  id v197;
  uint64_t v198;
  BMIntelligenceFlowIdentifiers *v199;
  uint64_t v200;
  BMMonotonicTimestamp *v201;
  uint64_t v202;
  void *v203;
  uint64_t v204;
  BMSageMetadata *v205;
  uint64_t v206;
  id *v207;
  uint64_t v208;
  id v209;
  uint64_t v210;
  id v211;
  uint64_t v212;
  id v213;
  uint64_t v214;
  id v215;
  uint64_t v216;
  void *v217;
  uint64_t v218;
  void *v219;
  uint64_t v220;
  id *v221;
  uint64_t v222;
  id *v223;
  uint64_t v224;
  void *v225;
  uint64_t v226;
  _QWORD v227[3];

  v227[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("absoluteTimestamp"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v8 = 0;
LABEL_4:
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("_machAbsoluteTime"));
    v9 = (id)objc_claimAutoreleasedReturnValue();
    if (!v9
      && (objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("machAbsoluteTime")),
          (v9 = (id)objc_claimAutoreleasedReturnValue()) == 0)
      || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      v194 = 0;
LABEL_10:
      objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("_sessionID"));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v10
        && (objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("sessionID")),
            (v10 = (void *)objc_claimAutoreleasedReturnValue()) == 0)
        || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
      {
        v193 = self;
        v11 = 0;
        goto LABEL_14;
      }
      v183 = v7;
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v158 = v9;
        v15 = v8;
        v16 = (objc_class *)MEMORY[0x1E0CB3A28];
        v17 = v10;
        v18 = objc_msgSend([v16 alloc], "initWithUUIDString:", v17);
        v10 = v17;

        if (v18)
        {
          v11 = (void *)v18;
          v193 = self;
          v8 = v15;
          v9 = v158;
LABEL_14:
          objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("_bootSessionID"));
          v12 = (id)objc_claimAutoreleasedReturnValue();
          v192 = v8;
          if (!v12
            && (objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("bootSessionID")),
                (v12 = (id)objc_claimAutoreleasedReturnValue()) == 0)
            || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
          {
            v182 = 0;
            goto LABEL_18;
          }
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v24 = (objc_class *)MEMORY[0x1E0CB3A28];
            v12 = v12;
            v25 = objc_msgSend([v24 alloc], "initWithUUIDString:", v12);

            v182 = (id *)v25;
            if (v25)
            {
LABEL_18:
              objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("_clientSessionID"));
              v13 = (void *)objc_claimAutoreleasedReturnValue();
              if (!v13)
              {
                objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("clientSessionID"));
                v13 = (void *)objc_claimAutoreleasedReturnValue();
                if (!v13)
                {
                  v170 = v12;
                  v14 = 0;
                  goto LABEL_53;
                }
              }
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0)
              {
                v170 = v12;
                v14 = v13;
LABEL_53:
                v191 = 0;
LABEL_54:
                objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("eventLabel"));
                v67 = objc_claimAutoreleasedReturnValue();
                v180 = (void *)v67;
                v190 = v14;
                if (!v67 || (v68 = (void *)v67, objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
                {
                  v181 = 0;
                  goto LABEL_57;
                }
                objc_opt_class();
                if ((objc_opt_isKindOfClass() & 1) != 0)
                {
                  v181 = v68;
LABEL_57:
                  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("eventType"));
                  v69 = objc_claimAutoreleasedReturnValue();
                  v168 = (void *)v69;
                  if (!v69 || (v70 = (void *)v69, objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
                  {
                    v169 = 0;
                    v12 = v170;
                    goto LABEL_60;
                  }
                  objc_opt_class();
                  v12 = v170;
                  if ((objc_opt_isKindOfClass() & 1) != 0)
                  {
                    v169 = v70;
LABEL_60:
                    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("serializationFormat"));
                    v71 = objc_claimAutoreleasedReturnValue();
                    v163 = (void *)v71;
                    if (!v71 || (v72 = (void *)v71, objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
                    {
                      v164 = 0;
LABEL_63:
                      objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("eventPayload"));
                      v73 = objc_claimAutoreleasedReturnValue();
                      v166 = a4;
                      v156 = (void *)v73;
                      if (v73 && (v74 = (void *)v73, objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
                      {
                        objc_opt_class();
                        if ((objc_opt_isKindOfClass() & 1) == 0)
                        {
                          if (!a4)
                          {
                            v33 = 0;
                            v39 = v194;
                            goto LABEL_140;
                          }
                          v172 = v12;
                          v123 = v11;
                          v124 = objc_alloc(MEMORY[0x1E0CB35C8]);
                          v125 = v7;
                          v126 = *MEMORY[0x1E0D025B8];
                          v204 = *MEMORY[0x1E0CB2D50];
                          v161 = v9;
                          v127 = v10;
                          v128 = a4;
                          v157 = (BMSageMetadata *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSData"), objc_opt_class(), CFSTR("eventPayload"));
                          v205 = v157;
                          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v205, &v204, 1);
                          v75 = (id)objc_claimAutoreleasedReturnValue();
                          v129 = v124;
                          v11 = v123;
                          v12 = v172;
                          v130 = v126;
                          v7 = v125;
                          v33 = 0;
                          a4 = 0;
                          *v128 = (id)objc_msgSend(v129, "initWithDomain:code:userInfo:", v130, 2, v75);
                          v10 = v127;
                          v9 = v161;
                          goto LABEL_113;
                        }
                        a4 = v74;
                      }
                      else
                      {
                        a4 = 0;
                      }
                      objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("_sageMetadata"));
                      v75 = (id)objc_claimAutoreleasedReturnValue();
                      if (!v75
                        && (objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("sageMetadata")),
                            (v75 = (id)objc_claimAutoreleasedReturnValue()) == 0)
                        || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
                      {
                        v154 = a4;
                        v157 = 0;
LABEL_70:
                        objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("monotonicTimestamp"));
                        v76 = objc_claimAutoreleasedReturnValue();
                        v155 = (void *)v76;
                        if (!v76 || (v77 = (void *)v76, objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
                        {
                          v160 = 0;
LABEL_73:
                          objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("identifiers"));
                          v78 = objc_claimAutoreleasedReturnValue();
                          a4 = v154;
                          v177 = v6;
                          v152 = (void *)v78;
                          if (!v78 || (v79 = (void *)v78, objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
                          {
                            v80 = v9;
                            v81 = v10;
                            v82 = v12;
                            v83 = v11;
                            v84 = v7;
                            v85 = 0;
LABEL_76:
                            LODWORD(v151) = objc_msgSend(v164, "intValue");
                            v33 = -[BMSageTranscript initWithAbsoluteTimestamp:_machAbsoluteTime:_sessionID:_bootSessionID:_clientSessionID:eventLabel:eventType:serializationFormat:eventPayload:_sageMetadata:monotonicTimestamp:identifiers:](v193, "initWithAbsoluteTimestamp:_machAbsoluteTime:_sessionID:_bootSessionID:_clientSessionID:eventLabel:eventType:serializationFormat:eventPayload:_sageMetadata:monotonicTimestamp:identifiers:", v192, v194, v83, v182, v191, v181, v169, v151, v154, v157, v160, v85);
                            v193 = v33;
LABEL_136:

                            v7 = v84;
                            v39 = v194;
                            v11 = v83;
                            v12 = v82;
                            v10 = v81;
                            v9 = v80;
                            v6 = v177;
                            goto LABEL_137;
                          }
                          objc_opt_class();
                          if ((objc_opt_isKindOfClass() & 1) != 0)
                          {
                            v80 = v9;
                            v81 = v10;
                            v82 = v12;
                            v83 = v11;
                            v84 = v7;
                            v131 = v79;
                            v195 = 0;
                            v85 = -[BMIntelligenceFlowIdentifiers initWithJSONDictionary:error:]([BMIntelligenceFlowIdentifiers alloc], "initWithJSONDictionary:error:", v131, &v195);
                            v132 = v195;
                            if (!v132)
                            {

                              goto LABEL_76;
                            }
                            v133 = v132;
                            if (v166)
                              *v166 = objc_retainAutorelease(v132);

                          }
                          else
                          {
                            if (!v166)
                            {
                              v33 = 0;
                              v39 = v194;
                              goto LABEL_137;
                            }
                            v80 = v9;
                            v81 = v10;
                            v82 = v12;
                            v83 = v11;
                            v84 = v7;
                            v189 = objc_alloc(MEMORY[0x1E0CB35C8]);
                            v175 = *MEMORY[0x1E0D025B8];
                            v198 = *MEMORY[0x1E0CB2D50];
                            v85 = (BMIntelligenceFlowIdentifiers *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSDictionary"), objc_opt_class(), CFSTR("identifiers"));
                            v199 = v85;
                            objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v199, &v198, 1);
                            v146 = (void *)objc_claimAutoreleasedReturnValue();
                            *v166 = (id)objc_msgSend(v189, "initWithDomain:code:userInfo:", v175, 2, v146);

                          }
                          v33 = 0;
                          goto LABEL_136;
                        }
                        v188 = v7;
                        objc_opt_class();
                        if ((objc_opt_isKindOfClass() & 1) != 0)
                        {
                          v120 = v77;
                          v196 = 0;
                          v160 = -[BMMonotonicTimestamp initWithJSONDictionary:error:]([BMMonotonicTimestamp alloc], "initWithJSONDictionary:error:", v120, &v196);
                          v121 = v196;
                          if (!v121)
                          {

                            goto LABEL_73;
                          }
                          v122 = v121;
                          v152 = v120;
                          v39 = v194;
                          if (v166)
                            *v166 = objc_retainAutorelease(v121);

                          v33 = 0;
                        }
                        else
                        {
                          if (!v166)
                          {
                            v33 = 0;
                            v39 = v194;
                            a4 = v154;
                            goto LABEL_138;
                          }
                          v173 = objc_alloc(MEMORY[0x1E0CB35C8]);
                          v153 = *MEMORY[0x1E0D025B8];
                          v200 = *MEMORY[0x1E0CB2D50];
                          v134 = v6;
                          v135 = v9;
                          v136 = v10;
                          v137 = v11;
                          v138 = objc_alloc(MEMORY[0x1E0CB3940]);
                          v150 = objc_opt_class();
                          v139 = v138;
                          v11 = v137;
                          v10 = v136;
                          v9 = v135;
                          v6 = v134;
                          v160 = (BMMonotonicTimestamp *)objc_msgSend(v139, "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSDictionary"), v150, CFSTR("monotonicTimestamp"));
                          v201 = v160;
                          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v201, &v200, 1);
                          v140 = objc_claimAutoreleasedReturnValue();
                          v141 = v153;
                          v152 = (void *)v140;
                          v33 = 0;
                          *v166 = (id)objc_msgSend(v173, "initWithDomain:code:userInfo:", v141, 2);
                          v7 = v188;
                          v39 = v194;
                        }
                        a4 = v154;
LABEL_137:

LABEL_138:
                        goto LABEL_139;
                      }
                      objc_opt_class();
                      if ((objc_opt_isKindOfClass() & 1) != 0)
                      {
                        v75 = v75;
                        v197 = 0;
                        v157 = -[BMSageMetadata initWithJSONDictionary:error:]([BMSageMetadata alloc], "initWithJSONDictionary:error:", v75, &v197);

                        v86 = v197;
                        if (!v86)
                        {
                          v154 = a4;
                          goto LABEL_70;
                        }
                        v87 = v86;
                        if (v166)
                          *v166 = objc_retainAutorelease(v86);

                      }
                      else
                      {
                        if (v166)
                        {
                          v171 = objc_alloc(MEMORY[0x1E0CB35C8]);
                          v187 = v7;
                          v108 = *MEMORY[0x1E0D025B8];
                          v202 = *MEMORY[0x1E0CB2D50];
                          v179 = v6;
                          v109 = v9;
                          v110 = v10;
                          v111 = v11;
                          v112 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSDictionary"), objc_opt_class(), CFSTR("_sageMetadata"));
                          v203 = v112;
                          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v203, &v202, 1);
                          v113 = (void *)objc_claimAutoreleasedReturnValue();
                          v114 = v108;
                          v7 = v187;
                          *v166 = (id)objc_msgSend(v171, "initWithDomain:code:userInfo:", v114, 2, v113);

                          v11 = v111;
                          v10 = v110;
                          v9 = v109;
                          v6 = v179;

                        }
                        v157 = 0;
                      }
                      v33 = 0;
LABEL_113:
                      v39 = v194;
LABEL_139:

LABEL_140:
                      v144 = v156;
                      goto LABEL_141;
                    }
                    objc_opt_class();
                    if ((objc_opt_isKindOfClass() & 1) != 0)
                    {
                      v164 = v72;
                      goto LABEL_63;
                    }
                    objc_opt_class();
                    if ((objc_opt_isKindOfClass() & 1) != 0)
                    {
                      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", BMSageTranscriptSerializationFormatFromString(v72));
                      v164 = (id)objc_claimAutoreleasedReturnValue();
                      goto LABEL_63;
                    }
                    if (a4)
                    {
                      v142 = a4;
                      v174 = objc_alloc(MEMORY[0x1E0CB35C8]);
                      v162 = v11;
                      v143 = *MEMORY[0x1E0D025B8];
                      v206 = *MEMORY[0x1E0CB2D50];
                      a4 = (id *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber (corresponding to enum value), or NSString (string version of enum)"), objc_opt_class(), CFSTR("serializationFormat"));
                      v207 = a4;
                      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v207, &v206, 1);
                      v144 = (void *)objc_claimAutoreleasedReturnValue();
                      v145 = v143;
                      v11 = v162;
                      v164 = 0;
                      v33 = 0;
                      *v142 = (id)objc_msgSend(v174, "initWithDomain:code:userInfo:", v145, 2, v144);
                      v39 = v194;
LABEL_141:

LABEL_142:
                      a4 = v182;

                      goto LABEL_143;
                    }
                    v164 = 0;
                    v33 = 0;
LABEL_154:
                    v39 = v194;
                    goto LABEL_142;
                  }
                  if (a4)
                  {
                    v97 = a4;
                    v98 = objc_alloc(MEMORY[0x1E0CB35C8]);
                    v178 = v6;
                    v99 = v9;
                    v100 = v10;
                    v101 = v11;
                    v102 = *MEMORY[0x1E0D025B8];
                    v208 = *MEMORY[0x1E0CB2D50];
                    v103 = v7;
                    v104 = objc_alloc(MEMORY[0x1E0CB3940]);
                    v149 = objc_opt_class();
                    v105 = v104;
                    v7 = v103;
                    v164 = (id)objc_msgSend(v105, "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSString"), v149, CFSTR("eventType"));
                    v209 = v164;
                    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v209, &v208, 1);
                    v106 = objc_claimAutoreleasedReturnValue();
                    v107 = v102;
                    v11 = v101;
                    v10 = v100;
                    v9 = v99;
                    v6 = v178;
                    v163 = (void *)v106;
                    v169 = 0;
                    v33 = 0;
                    *v97 = (id)objc_msgSend(v98, "initWithDomain:code:userInfo:", v107, 2);
                    goto LABEL_154;
                  }
                  v169 = 0;
                  v33 = 0;
                  v39 = v194;
                  a4 = v182;
LABEL_143:

                  goto LABEL_144;
                }
                if (a4)
                {
                  v167 = a4;
                  v88 = objc_alloc(MEMORY[0x1E0CB35C8]);
                  v89 = *MEMORY[0x1E0D025B8];
                  v210 = *MEMORY[0x1E0CB2D50];
                  v90 = v7;
                  v91 = objc_alloc(MEMORY[0x1E0CB3940]);
                  v148 = objc_opt_class();
                  v92 = v91;
                  v7 = v90;
                  v169 = (id)objc_msgSend(v92, "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSString"), v148, CFSTR("eventLabel"));
                  v211 = v169;
                  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v211, &v210, 1);
                  v168 = (void *)objc_claimAutoreleasedReturnValue();
                  v181 = 0;
                  v33 = 0;
                  *v167 = (id)objc_msgSend(v88, "initWithDomain:code:userInfo:", v89, 2);
                  v39 = v194;
                  a4 = v182;
                  v12 = v170;
                  goto LABEL_143;
                }
                v181 = 0;
                v33 = 0;
                v39 = v194;
                a4 = v182;
                goto LABEL_123;
              }
              v159 = v11;
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0)
              {
                v170 = v12;
                v185 = v10;
                v48 = a4;
                v49 = (objc_class *)MEMORY[0x1E0CB3A28];
                v14 = v13;
                v50 = objc_msgSend([v49 alloc], "initWithUUIDString:", v14);

                v191 = (void *)v50;
                if (v50)
                {
                  a4 = v48;
                  v10 = v185;
                  goto LABEL_54;
                }
                v190 = v14;
                if (v48)
                {
                  v115 = objc_alloc(MEMORY[0x1E0CB35C8]);
                  v116 = v7;
                  v117 = *MEMORY[0x1E0D025B8];
                  v214 = *MEMORY[0x1E0CB2D50];
                  v181 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("-initWithUUIDString: for %@ returned nil"), CFSTR("_clientSessionID"));
                  v215 = v181;
                  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v215, &v214, 1);
                  v118 = objc_claimAutoreleasedReturnValue();
                  v119 = v117;
                  v7 = v116;
                  v11 = v159;
                  v180 = (void *)v118;
                  v191 = 0;
                  v33 = 0;
                  *v48 = (id)objc_msgSend(v115, "initWithDomain:code:userInfo:", v119, 2);
                  v39 = v194;
                  a4 = v182;
                  v10 = v185;
LABEL_123:
                  v12 = v170;
                  goto LABEL_144;
                }
                v191 = 0;
                v33 = 0;
                v39 = v194;
                a4 = v182;
                v10 = v185;
                v12 = v170;
              }
              else
              {
                v190 = v13;
                if (a4)
                {
                  v58 = a4;
                  v59 = objc_alloc(MEMORY[0x1E0CB35C8]);
                  v186 = v7;
                  v60 = *MEMORY[0x1E0D025B8];
                  v212 = *MEMORY[0x1E0CB2D50];
                  v181 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSString"), objc_opt_class(), CFSTR("_clientSessionID"));
                  v213 = v181;
                  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v213, &v212, 1);
                  v61 = objc_claimAutoreleasedReturnValue();
                  v62 = v60;
                  v7 = v186;
                  v180 = (void *)v61;
                  v191 = 0;
                  v33 = 0;
                  *v58 = (id)objc_msgSend(v59, "initWithDomain:code:userInfo:", v62, 2);
                  v39 = v194;
                  a4 = v182;
LABEL_144:

                  goto LABEL_145;
                }
                v191 = 0;
                v33 = 0;
                v39 = v194;
                a4 = v182;
              }
LABEL_145:

              v8 = v192;
              goto LABEL_146;
            }
            if (a4)
            {
              v184 = v10;
              v26 = a4;
              v27 = objc_alloc(MEMORY[0x1E0CB35C8]);
              v28 = v7;
              v29 = *MEMORY[0x1E0D025B8];
              v218 = *MEMORY[0x1E0CB2D50];
              v191 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("-initWithUUIDString: for %@ returned nil"), CFSTR("_bootSessionID"));
              v219 = v191;
              objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v219, &v218, 1);
              v30 = objc_claimAutoreleasedReturnValue();
              v31 = v29;
              v7 = v28;
              v190 = (void *)v30;
              v32 = (id)objc_msgSend(v27, "initWithDomain:code:userInfo:", v31, 2);
              a4 = 0;
              v33 = 0;
              *v26 = v32;
              v10 = v184;
LABEL_42:
              v39 = v194;
              goto LABEL_145;
            }
            v33 = 0;
            v8 = v192;
          }
          else
          {
            if (a4)
            {
              v165 = a4;
              v52 = objc_alloc(MEMORY[0x1E0CB35C8]);
              v53 = v7;
              v54 = *MEMORY[0x1E0D025B8];
              v216 = *MEMORY[0x1E0CB2D50];
              v191 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSString"), objc_opt_class(), CFSTR("_bootSessionID"));
              v217 = v191;
              objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v217, &v216, 1);
              v55 = objc_claimAutoreleasedReturnValue();
              v56 = v54;
              v7 = v53;
              v190 = (void *)v55;
              v57 = (id)objc_msgSend(v52, "initWithDomain:code:userInfo:", v56, 2);
              a4 = 0;
              v33 = 0;
              *v165 = v57;
              goto LABEL_42;
            }
            v33 = 0;
          }
          goto LABEL_121;
        }
        if (a4)
        {
          v63 = a4;
          v193 = self;
          v64 = objc_alloc(MEMORY[0x1E0CB35C8]);
          v65 = *MEMORY[0x1E0D025B8];
          v222 = *MEMORY[0x1E0CB2D50];
          a4 = (id *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("-initWithUUIDString: for %@ returned nil"), CFSTR("_sessionID"));
          v223 = a4;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v223, &v222, 1);
          v12 = (id)objc_claimAutoreleasedReturnValue();
          v66 = (id)objc_msgSend(v64, "initWithDomain:code:userInfo:", v65, 2, v12);
          v11 = 0;
          v33 = 0;
          *v63 = v66;
          v8 = v15;
          v39 = v194;
          v9 = v158;
LABEL_146:

          self = v193;
          goto LABEL_147;
        }
        v11 = 0;
        v33 = 0;
        v8 = v15;
        v39 = v194;
        v9 = v158;
      }
      else
      {
        if (a4)
        {
          v193 = self;
          v40 = v8;
          v41 = objc_alloc(MEMORY[0x1E0CB35C8]);
          v42 = a4;
          v43 = *MEMORY[0x1E0D025B8];
          v220 = *MEMORY[0x1E0CB2D50];
          v44 = (id *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSString"), objc_opt_class(), CFSTR("_sessionID"));
          v221 = v44;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v221, &v220, 1);
          v45 = objc_claimAutoreleasedReturnValue();
          v46 = v41;
          v8 = v40;
          v47 = v43;
          a4 = v44;
          v11 = 0;
          v33 = 0;
          *v42 = (id)objc_msgSend(v46, "initWithDomain:code:userInfo:", v47, 2, v45);
          v12 = (id)v45;
          v7 = v183;
LABEL_121:
          v39 = v194;
          goto LABEL_146;
        }
        v11 = 0;
        v33 = 0;
        v39 = v194;
      }
LABEL_147:

      goto LABEL_148;
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v9 = v9;
      v194 = v9;
      goto LABEL_10;
    }
    if (a4)
    {
      v34 = v8;
      v35 = objc_alloc(MEMORY[0x1E0CB35C8]);
      v176 = v6;
      v36 = a4;
      v37 = *MEMORY[0x1E0D025B8];
      v224 = *MEMORY[0x1E0CB2D50];
      v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), objc_opt_class(), CFSTR("_machAbsoluteTime"));
      v225 = v11;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v225, &v224, 1);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v38 = v35;
      v8 = v34;
      v39 = 0;
      v33 = 0;
      *v36 = (id)objc_msgSend(v38, "initWithDomain:code:userInfo:", v37, 2, v10);
      v6 = v176;
      goto LABEL_147;
    }
    v39 = 0;
    v33 = 0;
LABEL_148:

    goto LABEL_149;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v19 = (objc_class *)MEMORY[0x1E0C99D68];
    v20 = v7;
    v21 = [v19 alloc];
    objc_msgSend(v20, "doubleValue");
    v23 = v22;

    v8 = (id)objc_msgSend(v21, "initWithTimeIntervalSinceReferenceDate:", v23);
    goto LABEL_4;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v51 = objc_alloc_init(MEMORY[0x1E0CB36A8]);
    objc_msgSend(v51, "dateFromString:", v7);
    v8 = (id)objc_claimAutoreleasedReturnValue();

    goto LABEL_4;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v8 = v7;
    goto LABEL_4;
  }
  if (a4)
  {
    v93 = objc_alloc(MEMORY[0x1E0CB35C8]);
    v94 = a4;
    v95 = *MEMORY[0x1E0D025B8];
    v226 = *MEMORY[0x1E0CB2D50];
    v39 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber (as time internal since 2001 (CFAbsoluteTime)), NSString (ISO8601 format), or NSDate"), objc_opt_class(), CFSTR("absoluteTimestamp"));
    v227[0] = v39;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v227, &v226, 1);
    v9 = (id)objc_claimAutoreleasedReturnValue();
    v96 = (id)objc_msgSend(v93, "initWithDomain:code:userInfo:", v95, 2, v9);
    v8 = 0;
    v33 = 0;
    *v94 = v96;
    goto LABEL_148;
  }
  v8 = 0;
  v33 = 0;
LABEL_149:

  return v33;
}

- (id)jsonDictionary
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  double v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
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
  void *v54;
  void *v55;
  _QWORD v56[2];
  const __CFString *v57;
  const __CFString *v58;
  const __CFString *v59;
  const __CFString *v60;
  const __CFString *v61;
  const __CFString *v62;
  const __CFString *v63;
  const __CFString *v64;
  const __CFString *v65;
  const __CFString *v66;
  const __CFString *v67;
  const __CFString *v68;
  const __CFString *v69;
  const __CFString *v70;
  const __CFString *v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  void *v81;
  void *v82;
  void *v83;
  void *v84;
  void *v85;
  void *v86;
  void *v87;
  void *v88;
  uint64_t v89;

  v89 = *MEMORY[0x1E0C80C00];
  -[BMSageTranscript absoluteTimestamp](self, "absoluteTimestamp");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = (void *)MEMORY[0x1E0CB37E8];
    -[BMSageTranscript absoluteTimestamp](self, "absoluteTimestamp");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "timeIntervalSinceReferenceDate");
    objc_msgSend(v4, "numberWithDouble:");
    v6 = objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = 0;
  }

  if (!-[BMSageTranscript has_machAbsoluteTime](self, "has_machAbsoluteTime")
    || (-[BMSageTranscript _machAbsoluteTime](self, "_machAbsoluteTime"), fabs(v7) == INFINITY))
  {
    v9 = 0;
  }
  else
  {
    -[BMSageTranscript _machAbsoluteTime](self, "_machAbsoluteTime");
    v8 = (void *)MEMORY[0x1E0CB37E8];
    -[BMSageTranscript _machAbsoluteTime](self, "_machAbsoluteTime");
    objc_msgSend(v8, "numberWithDouble:");
    v9 = objc_claimAutoreleasedReturnValue();
  }
  -[BMSageTranscript _sessionID](self, "_sessionID");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "UUIDString");
  v11 = objc_claimAutoreleasedReturnValue();

  -[BMSageTranscript _bootSessionID](self, "_bootSessionID");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "UUIDString");
  v13 = objc_claimAutoreleasedReturnValue();

  -[BMSageTranscript _clientSessionID](self, "_clientSessionID");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "UUIDString");
  v15 = objc_claimAutoreleasedReturnValue();

  -[BMSageTranscript eventLabel](self, "eventLabel");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMSageTranscript eventType](self, "eventType");
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[BMSageTranscript serializationFormat](self, "serializationFormat"));
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMSageTranscript eventPayload](self, "eventPayload");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "base64EncodedStringWithOptions:", 0);
  v53 = (void *)objc_claimAutoreleasedReturnValue();

  -[BMSageTranscript _sageMetadata](self, "_sageMetadata");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "jsonDictionary");
  v52 = (void *)objc_claimAutoreleasedReturnValue();

  -[BMSageTranscript monotonicTimestamp](self, "monotonicTimestamp");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "jsonDictionary");
  v51 = (void *)objc_claimAutoreleasedReturnValue();

  -[BMSageTranscript identifiers](self, "identifiers");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "jsonDictionary");
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  v56[0] = CFSTR("absoluteTimestamp");
  v22 = v6;
  if (!v6)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v22 = objc_claimAutoreleasedReturnValue();
  }
  v45 = (void *)v22;
  v72 = v22;
  v56[1] = CFSTR("_machAbsoluteTime");
  if (v9)
  {
    v73 = v9;
    v57 = CFSTR("machAbsoluteTime");
    v23 = v9;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    v73 = (uint64_t)v40;
    v57 = CFSTR("machAbsoluteTime");
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v23 = objc_claimAutoreleasedReturnValue();
  }
  v44 = (void *)v23;
  v74 = v23;
  v58 = CFSTR("_sessionID");
  if (v11)
  {
    v75 = v11;
    v59 = CFSTR("sessionID");
    v24 = v11;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    v75 = (uint64_t)v39;
    v59 = CFSTR("sessionID");
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v24 = objc_claimAutoreleasedReturnValue();
  }
  v43 = (void *)v24;
  v76 = v24;
  v60 = CFSTR("_bootSessionID");
  if (v13)
  {
    v77 = v13;
    v61 = CFSTR("bootSessionID");
    v25 = v13;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    v77 = (uint64_t)v38;
    v61 = CFSTR("bootSessionID");
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v25 = objc_claimAutoreleasedReturnValue();
  }
  v42 = (void *)v25;
  v78 = v25;
  v62 = CFSTR("_clientSessionID");
  v49 = (void *)v9;
  v50 = (void *)v6;
  if (v15)
  {
    v79 = v15;
    v63 = CFSTR("clientSessionID");
    v26 = v15;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    v79 = (uint64_t)v37;
    v63 = CFSTR("clientSessionID");
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v26 = objc_claimAutoreleasedReturnValue();
  }
  v48 = (void *)v11;
  v41 = (void *)v26;
  v80 = v26;
  v64 = CFSTR("eventLabel");
  v27 = v16;
  if (!v16)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v47 = (void *)v13;
  v81 = v27;
  v65 = CFSTR("eventType");
  v28 = v55;
  if (!v55)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v46 = (void *)v15;
  v82 = v28;
  v66 = CFSTR("serializationFormat");
  v29 = v54;
  if (!v54)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v83 = v29;
  v67 = CFSTR("eventPayload");
  v30 = v53;
  if (!v53)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v84 = v30;
  v68 = CFSTR("_sageMetadata");
  v31 = v52;
  if (v52)
  {
    v85 = v52;
    v69 = CFSTR("sageMetadata");
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    v85 = v36;
    v69 = CFSTR("sageMetadata");
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v86 = v31;
  v70 = CFSTR("monotonicTimestamp");
  v32 = v51;
  if (!v51)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v87 = v32;
  v71 = CFSTR("identifiers");
  v33 = v21;
  if (!v21)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v88 = v33;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v72, v56, 17);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v21)

  if (!v51)
  if (!v52)
  {

  }
  if (!v53)

  if (!v54)
  if (!v55)

  if (!v16)
  if (!v46)
  {

  }
  if (v47)
  {
    if (v48)
      goto LABEL_55;
  }
  else
  {

    if (v48)
    {
LABEL_55:
      if (v49)
        goto LABEL_56;
LABEL_60:

      if (v50)
        goto LABEL_57;
LABEL_61:

      goto LABEL_57;
    }
  }

  if (!v49)
    goto LABEL_60;
LABEL_56:
  if (!v50)
    goto LABEL_61;
LABEL_57:

  return v34;
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
  double v13;
  double v14;
  double v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  int v21;
  void *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  int v27;
  void *v28;
  uint64_t v29;
  void *v30;
  void *v31;
  void *v32;
  int v33;
  void *v34;
  uint64_t v35;
  void *v36;
  void *v37;
  void *v38;
  int v39;
  void *v40;
  uint64_t v41;
  void *v42;
  void *v43;
  void *v44;
  int v45;
  int v46;
  void *v47;
  uint64_t v48;
  void *v49;
  void *v50;
  void *v51;
  int v52;
  void *v53;
  uint64_t v54;
  void *v55;
  void *v56;
  void *v57;
  int v58;
  void *v59;
  uint64_t v60;
  void *v61;
  void *v62;
  void *v63;
  int v64;
  void *v66;
  void *v67;
  void *v68;
  void *v69;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    -[BMSageTranscript absoluteTimestamp](self, "absoluteTimestamp");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "absoluteTimestamp");
    v7 = objc_claimAutoreleasedReturnValue();
    if (v6 == (void *)v7)
    {

    }
    else
    {
      v8 = (void *)v7;
      -[BMSageTranscript absoluteTimestamp](self, "absoluteTimestamp");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "absoluteTimestamp");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v9, "isEqual:", v10);

      if (!v11)
        goto LABEL_43;
    }
    if (-[BMSageTranscript has_machAbsoluteTime](self, "has_machAbsoluteTime")
      || objc_msgSend(v5, "has_machAbsoluteTime"))
    {
      if (!-[BMSageTranscript has_machAbsoluteTime](self, "has_machAbsoluteTime"))
        goto LABEL_43;
      if (!objc_msgSend(v5, "has_machAbsoluteTime"))
        goto LABEL_43;
      -[BMSageTranscript _machAbsoluteTime](self, "_machAbsoluteTime");
      v14 = v13;
      objc_msgSend(v5, "_machAbsoluteTime");
      if (v14 != v15)
        goto LABEL_43;
    }
    -[BMSageTranscript _sessionID](self, "_sessionID");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "_sessionID");
    v17 = objc_claimAutoreleasedReturnValue();
    if (v16 == (void *)v17)
    {

    }
    else
    {
      v18 = (void *)v17;
      -[BMSageTranscript _sessionID](self, "_sessionID");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "_sessionID");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = objc_msgSend(v19, "isEqual:", v20);

      if (!v21)
        goto LABEL_43;
    }
    -[BMSageTranscript _bootSessionID](self, "_bootSessionID");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "_bootSessionID");
    v23 = objc_claimAutoreleasedReturnValue();
    if (v22 == (void *)v23)
    {

    }
    else
    {
      v24 = (void *)v23;
      -[BMSageTranscript _bootSessionID](self, "_bootSessionID");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "_bootSessionID");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = objc_msgSend(v25, "isEqual:", v26);

      if (!v27)
        goto LABEL_43;
    }
    -[BMSageTranscript _clientSessionID](self, "_clientSessionID");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "_clientSessionID");
    v29 = objc_claimAutoreleasedReturnValue();
    if (v28 == (void *)v29)
    {

    }
    else
    {
      v30 = (void *)v29;
      -[BMSageTranscript _clientSessionID](self, "_clientSessionID");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "_clientSessionID");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      v33 = objc_msgSend(v31, "isEqual:", v32);

      if (!v33)
        goto LABEL_43;
    }
    -[BMSageTranscript eventLabel](self, "eventLabel");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "eventLabel");
    v35 = objc_claimAutoreleasedReturnValue();
    if (v34 == (void *)v35)
    {

    }
    else
    {
      v36 = (void *)v35;
      -[BMSageTranscript eventLabel](self, "eventLabel");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "eventLabel");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      v39 = objc_msgSend(v37, "isEqual:", v38);

      if (!v39)
        goto LABEL_43;
    }
    -[BMSageTranscript eventType](self, "eventType");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "eventType");
    v41 = objc_claimAutoreleasedReturnValue();
    if (v40 == (void *)v41)
    {

    }
    else
    {
      v42 = (void *)v41;
      -[BMSageTranscript eventType](self, "eventType");
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "eventType");
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      v45 = objc_msgSend(v43, "isEqual:", v44);

      if (!v45)
        goto LABEL_43;
    }
    v46 = -[BMSageTranscript serializationFormat](self, "serializationFormat");
    if (v46 == objc_msgSend(v5, "serializationFormat"))
    {
      -[BMSageTranscript eventPayload](self, "eventPayload");
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "eventPayload");
      v48 = objc_claimAutoreleasedReturnValue();
      if (v47 == (void *)v48)
      {

      }
      else
      {
        v49 = (void *)v48;
        -[BMSageTranscript eventPayload](self, "eventPayload");
        v50 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "eventPayload");
        v51 = (void *)objc_claimAutoreleasedReturnValue();
        v52 = objc_msgSend(v50, "isEqual:", v51);

        if (!v52)
          goto LABEL_43;
      }
      -[BMSageTranscript _sageMetadata](self, "_sageMetadata");
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "_sageMetadata");
      v54 = objc_claimAutoreleasedReturnValue();
      if (v53 == (void *)v54)
      {

      }
      else
      {
        v55 = (void *)v54;
        -[BMSageTranscript _sageMetadata](self, "_sageMetadata");
        v56 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "_sageMetadata");
        v57 = (void *)objc_claimAutoreleasedReturnValue();
        v58 = objc_msgSend(v56, "isEqual:", v57);

        if (!v58)
          goto LABEL_43;
      }
      -[BMSageTranscript monotonicTimestamp](self, "monotonicTimestamp");
      v59 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "monotonicTimestamp");
      v60 = objc_claimAutoreleasedReturnValue();
      if (v59 == (void *)v60)
      {

      }
      else
      {
        v61 = (void *)v60;
        -[BMSageTranscript monotonicTimestamp](self, "monotonicTimestamp");
        v62 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "monotonicTimestamp");
        v63 = (void *)objc_claimAutoreleasedReturnValue();
        v64 = objc_msgSend(v62, "isEqual:", v63);

        if (!v64)
          goto LABEL_43;
      }
      -[BMSageTranscript identifiers](self, "identifiers");
      v66 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "identifiers");
      v67 = (void *)objc_claimAutoreleasedReturnValue();
      if (v66 == v67)
      {
        v12 = 1;
      }
      else
      {
        -[BMSageTranscript identifiers](self, "identifiers");
        v68 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "identifiers");
        v69 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = objc_msgSend(v68, "isEqual:", v69);

      }
      goto LABEL_44;
    }
LABEL_43:
    v12 = 0;
LABEL_44:

    goto LABEL_45;
  }
  v12 = 0;
LABEL_45:

  return v12;
}

- (unsigned)dataVersion
{
  return self->_dataVersion;
}

- (NSString)eventLabel
{
  return self->_eventLabel;
}

- (NSString)eventType
{
  return self->_eventType;
}

- (int)serializationFormat
{
  return self->_serializationFormat;
}

- (NSData)eventPayload
{
  return self->_eventPayload;
}

- (BMMonotonicTimestamp)monotonicTimestamp
{
  return self->_monotonicTimestamp;
}

- (BMIntelligenceFlowIdentifiers)identifiers
{
  return self->_identifiers;
}

- (double)_machAbsoluteTime
{
  return self->__machAbsoluteTime;
}

- (BOOL)has_machAbsoluteTime
{
  return self->_has_machAbsoluteTime;
}

- (void)setHas_machAbsoluteTime:(BOOL)a3
{
  self->_has_machAbsoluteTime = a3;
}

- (NSUUID)_sessionID
{
  return self->__sessionID;
}

- (NSUUID)_bootSessionID
{
  return self->__bootSessionID;
}

- (NSUUID)_clientSessionID
{
  return self->__clientSessionID;
}

- (BMSageMetadata)_sageMetadata
{
  return self->__sageMetadata;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__sageMetadata, 0);
  objc_storeStrong((id *)&self->__clientSessionID, 0);
  objc_storeStrong((id *)&self->__bootSessionID, 0);
  objc_storeStrong((id *)&self->__sessionID, 0);
  objc_storeStrong((id *)&self->_identifiers, 0);
  objc_storeStrong((id *)&self->_monotonicTimestamp, 0);
  objc_storeStrong((id *)&self->_eventPayload, 0);
  objc_storeStrong((id *)&self->_eventType, 0);
  objc_storeStrong((id *)&self->_eventLabel, 0);
  objc_storeStrong((id *)&self->_raw__clientSessionID, 0);
  objc_storeStrong((id *)&self->_raw__bootSessionID, 0);
  objc_storeStrong((id *)&self->_raw__sessionID, 0);
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

    v4 = -[BMSageTranscript initByReadFrom:]([BMSageTranscript alloc], "initByReadFrom:", v7);
    v4[15] = 0;

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
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  _QWORD v16[14];

  v16[12] = *MEMORY[0x1E0C80C00];
  v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("absoluteTimestamp"), 3, 0, 1, 0, 1);
  v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("machAbsoluteTime"), 1, 0, 9, 0, 0);
  v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("sessionID"), 6, 0, 7, 14, 3);
  v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("bootSessionID"), 6, 0, 8, 14, 3);
  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("clientSessionID"), 6, 0, 2, 14, 3);
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("eventLabel"), 2, 0, 3, 13, 0);
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("eventType"), 2, 0, 4, 13, 0);
  v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("serializationFormat"), 0, 0, 5, 4, 0);
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("eventPayload"), 4, 0, 6, 14, 0);
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02710]), "initWithName:dataType:requestOnly:extractBlock:", CFSTR("sageMetadata_json"), 5, 1, &__block_literal_global_80);
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02710]), "initWithName:dataType:requestOnly:extractBlock:", CFSTR("monotonicTimestamp_json"), 5, 1, &__block_literal_global_81);
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02710]), "initWithName:dataType:requestOnly:extractBlock:", CFSTR("identifiers_json"), 5, 1, &__block_literal_global_82);
  v16[0] = v15;
  v16[1] = v2;
  v16[2] = v3;
  v16[3] = v4;
  v16[4] = v11;
  v16[5] = v5;
  v16[6] = v13;
  v16[7] = v12;
  v16[8] = v14;
  v16[9] = v6;
  v16[10] = v7;
  v16[11] = v8;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v16, 12);
  v10 = (id)objc_claimAutoreleasedReturnValue();

  return v10;
}

+ (id)validKeyPaths
{
  return &unk_1E5F1AB48;
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
  _QWORD v16[13];

  v16[12] = *MEMORY[0x1E0C80C00];
  v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("absoluteTimestamp"), 1, 0, 0);
  v16[0] = v15;
  v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("_machAbsoluteTime"), 9, 0, 0);
  v16[1] = v14;
  v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("_sessionID"), 7, 14, 0);
  v16[2] = v13;
  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("_bootSessionID"), 8, 14, 0);
  v16[3] = v2;
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("_clientSessionID"), 2, 14, 0);
  v16[4] = v3;
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("eventLabel"), 3, 13, 0);
  v16[5] = v4;
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("eventType"), 4, 13, 0);
  v16[6] = v5;
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("serializationFormat"), 5, 4, 0);
  v16[7] = v6;
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("eventPayload"), 6, 14, 0);
  v16[8] = v7;
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("_sageMetadata"), 10, 14, objc_opt_class());
  v16[9] = v8;
  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("monotonicTimestamp"), 11, 14, objc_opt_class());
  v16[10] = v9;
  v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("identifiers"), 12, 14, objc_opt_class());
  v16[11] = v10;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v16, 12);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

id __27__BMSageTranscript_columns__block_invoke_3(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(a2, "eventBodyKeepingBackingData:", 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "identifiers");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "jsonDictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  BMConvertObjectToJSONString();
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

id __27__BMSageTranscript_columns__block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(a2, "eventBodyKeepingBackingData:", 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "monotonicTimestamp");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "jsonDictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  BMConvertObjectToJSONString();
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

id __27__BMSageTranscript_columns__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(a2, "eventBodyKeepingBackingData:", 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "sageMetadata");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "jsonDictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  BMConvertObjectToJSONString();
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (BMSageTranscript)initWithAbsoluteTimestamp:(id)a3 clientSessionID:(id)a4 eventLabel:(id)a5 eventType:(id)a6 serializationFormat:(int)a7 eventPayload:(id)a8
{
  uint64_t v9;

  LODWORD(v9) = a7;
  return -[BMSageTranscript initWithAbsoluteTimestamp:machAbsoluteTime:sessionID:bootSessionID:clientSessionID:eventLabel:eventType:serializationFormat:eventPayload:](self, "initWithAbsoluteTimestamp:machAbsoluteTime:sessionID:bootSessionID:clientSessionID:eventLabel:eventType:serializationFormat:eventPayload:", a3, 0, 0, 0, a4, a5, a6, v9, a8);
}

- (BMSageTranscript)initWithAbsoluteTimestamp:(id)a3 eventLabel:(id)a4 eventType:(id)a5 serializationFormat:(int)a6 eventPayload:(id)a7 sageMetadata:(id)a8 monotonicTimestamp:(id)a9
{
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  BMIntelligenceFlowIdentifiers *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  BMIntelligenceFlowIdentifiers *v24;
  BMSageTranscript *v25;
  id v27;

  v27 = a9;
  v14 = a8;
  v15 = a7;
  v16 = a5;
  v17 = a4;
  v18 = a3;
  v19 = [BMIntelligenceFlowIdentifiers alloc];
  objc_msgSend(v14, "rawSessionId");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "clientRequestId");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "clientSessionId");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "clientId");
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  v24 = -[BMIntelligenceFlowIdentifiers initWithSessionId:spanId:clientRequestId:clientSessionId:clientApplicationId:clientGroupIdentifier:](v19, "initWithSessionId:spanId:clientRequestId:clientSessionId:clientApplicationId:clientGroupIdentifier:", v20, 0, v21, v22, 0, v23);
  v25 = -[BMSageTranscript initWithAbsoluteTimestamp:eventLabel:eventType:serializationFormat:eventPayload:monotonicTimestamp:identifiers:](self, "initWithAbsoluteTimestamp:eventLabel:eventType:serializationFormat:eventPayload:monotonicTimestamp:identifiers:", v18, v17, v16, a6, v15, v27, v24);

  return v25;
}

- (BMSageTranscript)initWithAbsoluteTimestamp:(id)a3 _machAbsoluteTime:(id)a4 _sessionID:(id)a5 _bootSessionID:(id)a6 _clientSessionID:(id)a7 eventLabel:(id)a8 eventType:(id)a9 serializationFormat:(int)a10 eventPayload:(id)a11 _sageMetadata:(id)a12 monotonicTimestamp:(id)a13 identifiers:(id)a14
{
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  id v25;
  id v26;
  void *v27;
  void *v28;
  BMSageTranscript *v29;
  BMIntelligenceFlowIdentifiers *v30;
  BMIntelligenceFlowIdentifiers *v31;
  BMIntelligenceFlowIdentifiers *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  uint64_t v38;
  id v39;
  id v40;
  void *v41;
  id v43;
  id v44;
  id v45;

  v44 = a3;
  v43 = a4;
  v45 = a5;
  v19 = a6;
  v20 = a7;
  v21 = a8;
  v22 = a9;
  v23 = a11;
  v24 = a12;
  v25 = a13;
  v26 = a14;
  v41 = v26;
  if (v24 || v25 || v26)
  {
    v39 = v20;
    v40 = v19;
    v30 = (BMIntelligenceFlowIdentifiers *)v26;
    v31 = v30;
    if (v24)
    {
      v27 = v44;
      if (!v30)
      {
        v32 = [BMIntelligenceFlowIdentifiers alloc];
        objc_msgSend(v24, "rawSessionId");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "clientRequestId");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "clientSessionId");
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "clientId");
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        v31 = -[BMIntelligenceFlowIdentifiers initWithSessionId:spanId:clientRequestId:clientSessionId:clientApplicationId:clientGroupIdentifier:](v32, "initWithSessionId:spanId:clientRequestId:clientSessionId:clientApplicationId:clientGroupIdentifier:", v33, 0, v34, v35, 0, v36);

        v27 = v44;
      }
    }
    else
    {
      v27 = v44;
    }
    v29 = -[BMSageTranscript initWithAbsoluteTimestamp:eventLabel:eventType:serializationFormat:eventPayload:monotonicTimestamp:identifiers:](self, "initWithAbsoluteTimestamp:eventLabel:eventType:serializationFormat:eventPayload:monotonicTimestamp:identifiers:", v27, v21, v22, a10, v23, v25, v31);

    v28 = v43;
    v20 = v39;
    v19 = v40;
  }
  else
  {
    LODWORD(v38) = a10;
    v28 = v43;
    v27 = v44;
    v29 = -[BMSageTranscript initWithAbsoluteTimestamp:machAbsoluteTime:sessionID:bootSessionID:clientSessionID:eventLabel:eventType:serializationFormat:eventPayload:](self, "initWithAbsoluteTimestamp:machAbsoluteTime:sessionID:bootSessionID:clientSessionID:eventLabel:eventType:serializationFormat:eventPayload:", v44, v43, v45, v19, v20, v21, v22, v38, v23);
  }

  return v29;
}

- (BMSageTranscript)initWithAbsoluteTimestamp:(id)a3 machAbsoluteTime:(id)a4 sessionID:(id)a5 bootSessionID:(id)a6 clientSessionID:(id)a7 eventLabel:(id)a8 eventType:(id)a9 serializationFormat:(int)a10 eventPayload:(id)a11
{
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  BMMonotonicTimestamp *v24;
  BMMonotonicTimestamp *v25;
  void *v26;
  BMIntelligenceFlowIdentifiers *v27;
  void *v28;
  BMIntelligenceFlowIdentifiers *v29;
  BMSageTranscript *v30;
  void *v32;

  v16 = a4;
  v17 = a6;
  v18 = a11;
  v19 = a9;
  v20 = a8;
  v21 = a7;
  v22 = a5;
  v23 = a3;
  v32 = v16;
  if (v16 && v17)
  {
    v24 = -[BMMonotonicTimestamp initWithBootSessionUUID:machAbsoluteTime:machContinuousTime:]([BMMonotonicTimestamp alloc], "initWithBootSessionUUID:machAbsoluteTime:machContinuousTime:", v17, v16, 0);
  }
  else
  {
    +[BMMonotonicTimestamp nowFromSuspendingClock](BMMonotonicTimestamp, "nowFromSuspendingClock");
    v24 = (BMMonotonicTimestamp *)objc_claimAutoreleasedReturnValue();
  }
  v25 = v24;
  v26 = v17;
  v27 = [BMIntelligenceFlowIdentifiers alloc];
  objc_msgSend(v21, "UUIDString");
  v28 = (void *)objc_claimAutoreleasedReturnValue();

  v29 = -[BMIntelligenceFlowIdentifiers initWithSessionId:spanId:clientRequestId:clientSessionId:clientApplicationId:clientGroupIdentifier:](v27, "initWithSessionId:spanId:clientRequestId:clientSessionId:clientApplicationId:clientGroupIdentifier:", v22, 0, 0, v28, 0, 0);
  v30 = -[BMSageTranscript initWithAbsoluteTimestamp:eventLabel:eventType:serializationFormat:eventPayload:monotonicTimestamp:identifiers:](self, "initWithAbsoluteTimestamp:eventLabel:eventType:serializationFormat:eventPayload:monotonicTimestamp:identifiers:", v23, v20, v19, a10, v18, v25, v29);

  return v30;
}

- (BOOL)hasMachAbsoluteTime
{
  void *v3;
  void *v4;
  void *v5;
  char v6;

  -[BMSageTranscript monotonicTimestamp](self, "monotonicTimestamp");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
    return -[BMSageTranscript has_machAbsoluteTime](self, "has_machAbsoluteTime");
  -[BMSageTranscript monotonicTimestamp](self, "monotonicTimestamp");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "value");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hasSuspendingNanosecondsSinceBoot");

  return v6;
}

- (double)machAbsoluteTime
{
  void *v3;
  void *v4;
  void *v5;
  double v6;
  double result;

  -[BMSageTranscript monotonicTimestamp](self, "monotonicTimestamp");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[BMSageTranscript monotonicTimestamp](self, "monotonicTimestamp");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "value");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (double)(unint64_t)objc_msgSend(v5, "suspendingNanosecondsSinceBoot");

    return v6;
  }
  else
  {
    -[BMSageTranscript _machAbsoluteTime](self, "_machAbsoluteTime");
  }
  return result;
}

- (id)bootSessionID
{
  void *v3;
  void *v4;
  void *v5;

  -[BMSageTranscript monotonicTimestamp](self, "monotonicTimestamp");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[BMSageTranscript monotonicTimestamp](self, "monotonicTimestamp");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "bootSessionUUID");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    -[BMSageTranscript _bootSessionID](self, "_bootSessionID");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v5;
}

- (id)sessionID
{
  void *v3;
  void *v4;
  void *v5;

  -[BMSageTranscript identifiers](self, "identifiers");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[BMSageTranscript identifiers](self, "identifiers");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "sessionId");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    -[BMSageTranscript _sessionID](self, "_sessionID");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v5;
}

- (id)clientSessionID
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;

  -[BMSageTranscript identifiers](self, "identifiers");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[BMSageTranscript identifiers](self, "identifiers");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "clientSessionId");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5)
    {
      v6 = objc_alloc(MEMORY[0x1E0CB3A28]);
      -[BMSageTranscript identifiers](self, "identifiers");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "clientSessionId");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = (void *)objc_msgSend(v6, "initWithUUIDString:", v8);

    }
    else
    {
      v9 = 0;
    }
  }
  else
  {
    -[BMSageTranscript _clientSessionID](self, "_clientSessionID");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v9;
}

- (id)sageMetadata
{
  BMSageMetadata *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  BMSageMetadata *v12;

  v3 = [BMSageMetadata alloc];
  -[BMSageTranscript identifiers](self, "identifiers");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "sessionId");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMSageTranscript identifiers](self, "identifiers");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "clientGroupIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMSageTranscript identifiers](self, "identifiers");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "clientRequestId");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMSageTranscript identifiers](self, "identifiers");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "clientSessionId");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = -[BMSageMetadata initWithRawSessionId:clientId:clientRequestId:clientSessionId:](v3, "initWithRawSessionId:clientId:clientRequestId:clientSessionId:", v5, v7, v9, v11);

  return v12;
}

- (NSUUID)sessionId
{
  void *v2;
  void *v3;

  -[BMSageTranscript identifiers](self, "identifiers");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "sessionId");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSUUID *)v3;
}

- (NSNumber)spanId
{
  void *v3;
  int v4;
  void *v5;
  void *v6;
  void *v7;

  -[BMSageTranscript identifiers](self, "identifiers");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hasSpanId");

  if (v4)
  {
    v5 = (void *)MEMORY[0x1E0CB37E8];
    -[BMSageTranscript identifiers](self, "identifiers");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "numberWithUnsignedLongLong:", objc_msgSend(v6, "spanId"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v7 = 0;
  }
  return (NSNumber *)v7;
}

- (NSString)clientSessionId
{
  void *v2;
  void *v3;

  -[BMSageTranscript identifiers](self, "identifiers");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "clientSessionId");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (NSString)clientRequestId
{
  void *v2;
  void *v3;

  -[BMSageTranscript identifiers](self, "identifiers");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "clientRequestId");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

@end
