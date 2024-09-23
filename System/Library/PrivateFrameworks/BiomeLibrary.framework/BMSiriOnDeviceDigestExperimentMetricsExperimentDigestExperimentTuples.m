@implementation BMSiriOnDeviceDigestExperimentMetricsExperimentDigestExperimentTuples

- (BMSiriOnDeviceDigestExperimentMetricsExperimentDigestExperimentTuples)initWithLaunchTimeInMs:(id)a3 endpointDelayInMs:(id)a4 siriResponseTimeInMs:(id)a5 timeToUufrInMs:(id)a6 timeToFirstWordInMs:(id)a7
{
  id v13;
  id v14;
  id v15;
  id v16;
  BMSiriOnDeviceDigestExperimentMetricsExperimentDigestExperimentTuples *v17;
  id v19;
  objc_super v20;

  v19 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  v20.receiver = self;
  v20.super_class = (Class)BMSiriOnDeviceDigestExperimentMetricsExperimentDigestExperimentTuples;
  v17 = -[BMEventBase init](&v20, sel_init);
  if (v17)
  {
    v17->_dataVersion = objc_msgSend((id)objc_opt_class(), "latestDataVersion");
    objc_storeStrong((id *)&v17->_launchTimeInMs, a3);
    objc_storeStrong((id *)&v17->_endpointDelayInMs, a4);
    objc_storeStrong((id *)&v17->_siriResponseTimeInMs, a5);
    objc_storeStrong((id *)&v17->_timeToUufrInMs, a6);
    objc_storeStrong((id *)&v17->_timeToFirstWordInMs, a7);
  }

  return v17;
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

  v3 = objc_alloc(MEMORY[0x1E0CB3940]);
  -[BMSiriOnDeviceDigestExperimentMetricsExperimentDigestExperimentTuples launchTimeInMs](self, "launchTimeInMs");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMSiriOnDeviceDigestExperimentMetricsExperimentDigestExperimentTuples endpointDelayInMs](self, "endpointDelayInMs");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMSiriOnDeviceDigestExperimentMetricsExperimentDigestExperimentTuples siriResponseTimeInMs](self, "siriResponseTimeInMs");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMSiriOnDeviceDigestExperimentMetricsExperimentDigestExperimentTuples timeToUufrInMs](self, "timeToUufrInMs");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMSiriOnDeviceDigestExperimentMetricsExperimentDigestExperimentTuples timeToFirstWordInMs](self, "timeToFirstWordInMs");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("BMSiriOnDeviceDigestExperimentMetricsExperimentDigestExperimentTuples with launchTimeInMs: %@, endpointDelayInMs: %@, siriResponseTimeInMs: %@, timeToUufrInMs: %@, timeToFirstWordInMs: %@"), v4, v5, v6, v7, v8);

  return (NSString *)v9;
}

- (id)initByReadFrom:(id)a3
{
  _BYTE *v4;
  BMSiriOnDeviceDigestExperimentMetricsExperimentDigestExperimentTuples *v5;
  void *v6;
  void *v7;
  void *v8;
  double v9;
  int *v10;
  int *v11;
  int *v12;
  int *v13;
  char v14;
  unsigned int v15;
  unint64_t v16;
  uint64_t v17;
  uint64_t v18;
  unint64_t v19;
  char v20;
  uint64_t v22;
  int v23;
  void *v25;
  uint64_t v26;
  unint64_t v27;
  void *v28;
  uint64_t v29;
  unint64_t v30;
  void *v31;
  uint64_t v32;
  unint64_t v33;
  void *v34;
  uint64_t v35;
  unint64_t v36;
  void *v37;
  uint64_t v38;
  unint64_t v39;
  uint64_t v40;
  void *v41;
  void *v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  NSArray *launchTimeInMs;
  uint64_t v49;
  NSArray *endpointDelayInMs;
  uint64_t v51;
  NSArray *siriResponseTimeInMs;
  uint64_t v53;
  NSArray *timeToUufrInMs;
  uint64_t v55;
  NSArray *timeToFirstWordInMs;
  int v57;
  BMSiriOnDeviceDigestExperimentMetricsExperimentDigestExperimentTuples *v58;
  void *v60;
  id v61;
  void *v62;
  objc_super v63;

  v4 = a3;
  v63.receiver = self;
  v63.super_class = (Class)BMSiriOnDeviceDigestExperimentMetricsExperimentDigestExperimentTuples;
  v5 = -[BMEventBase init](&v63, sel_init);
  if (!v5)
  {
LABEL_56:
    v58 = v5;
    goto LABEL_57;
  }
  v62 = (void *)objc_opt_new();
  v60 = (void *)objc_opt_new();
  v6 = (void *)objc_opt_new();
  v7 = (void *)objc_opt_new();
  v8 = (void *)objc_opt_new();
  v10 = (int *)MEMORY[0x1E0D82BF0];
  v11 = (int *)MEMORY[0x1E0D82BD8];
  v12 = (int *)MEMORY[0x1E0D82BC8];
  if (*(_QWORD *)&v4[*MEMORY[0x1E0D82BF0]] >= *(_QWORD *)&v4[*MEMORY[0x1E0D82BD8]])
  {
LABEL_54:
    v47 = objc_msgSend(v62, "copy", v60);
    launchTimeInMs = v5->_launchTimeInMs;
    v5->_launchTimeInMs = (NSArray *)v47;

    v49 = objc_msgSend(v61, "copy");
    endpointDelayInMs = v5->_endpointDelayInMs;
    v5->_endpointDelayInMs = (NSArray *)v49;

    v51 = objc_msgSend(v6, "copy");
    siriResponseTimeInMs = v5->_siriResponseTimeInMs;
    v5->_siriResponseTimeInMs = (NSArray *)v51;

    v53 = objc_msgSend(v7, "copy");
    timeToUufrInMs = v5->_timeToUufrInMs;
    v5->_timeToUufrInMs = (NSArray *)v53;

    v55 = objc_msgSend(v8, "copy");
    timeToFirstWordInMs = v5->_timeToFirstWordInMs;
    v5->_timeToFirstWordInMs = (NSArray *)v55;

    v57 = v4[*v12];
    if (v57)
      goto LABEL_55;
    goto LABEL_56;
  }
  v13 = (int *)MEMORY[0x1E0D82BB8];
  while (2)
  {
    if (v4[*v12])
      goto LABEL_54;
    v14 = 0;
    v15 = 0;
    v16 = 0;
    while (1)
    {
      v17 = *v10;
      v18 = *(_QWORD *)&v4[v17];
      v19 = v18 + 1;
      if (v18 == -1 || v19 > *(_QWORD *)&v4[*v11])
        break;
      v20 = *(_BYTE *)(*(_QWORD *)&v4[*v13] + v18);
      *(_QWORD *)&v4[v17] = v19;
      v16 |= (unint64_t)(v20 & 0x7F) << v14;
      if ((v20 & 0x80) == 0)
        goto LABEL_13;
      v14 += 7;
      if (v15++ >= 9)
      {
        v16 = 0;
        v22 = *v12;
        v23 = v4[v22];
        goto LABEL_15;
      }
    }
    v4[*v12] = 1;
LABEL_13:
    v22 = *v12;
    v23 = v4[v22];
    if (v4[v22])
      v16 = 0;
LABEL_15:
    if (v23 || (v16 & 7) == 4)
      goto LABEL_54;
    switch((v16 >> 3))
    {
      case 1u:
        v25 = (void *)MEMORY[0x1E0CB37E8];
        v26 = *v10;
        v27 = *(_QWORD *)&v4[v26];
        if (v27 <= 0xFFFFFFFFFFFFFFFBLL && v27 + 4 <= *(_QWORD *)&v4[*v11])
        {
          LODWORD(v9) = *(_DWORD *)(*(_QWORD *)&v4[*v13] + v27);
          *(_QWORD *)&v4[v26] = v27 + 4;
        }
        else
        {
          v4[v22] = 1;
          LODWORD(v9) = 0;
        }
        objc_msgSend(v25, "numberWithFloat:", v9, v60);
        v40 = objc_claimAutoreleasedReturnValue();
        if (!v40)
          goto LABEL_58;
        v41 = (void *)v40;
        v42 = v62;
        goto LABEL_52;
      case 2u:
        v28 = (void *)MEMORY[0x1E0CB37E8];
        v29 = *v10;
        v30 = *(_QWORD *)&v4[v29];
        if (v30 <= 0xFFFFFFFFFFFFFFFBLL && v30 + 4 <= *(_QWORD *)&v4[*v11])
        {
          LODWORD(v9) = *(_DWORD *)(*(_QWORD *)&v4[*v13] + v30);
          *(_QWORD *)&v4[v29] = v30 + 4;
        }
        else
        {
          v4[v22] = 1;
          LODWORD(v9) = 0;
        }
        objc_msgSend(v28, "numberWithFloat:", v9, v60);
        v43 = objc_claimAutoreleasedReturnValue();
        if (!v43)
          goto LABEL_58;
        v41 = (void *)v43;
        v42 = v60;
        goto LABEL_52;
      case 3u:
        v31 = (void *)MEMORY[0x1E0CB37E8];
        v32 = *v10;
        v33 = *(_QWORD *)&v4[v32];
        if (v33 <= 0xFFFFFFFFFFFFFFFBLL && v33 + 4 <= *(_QWORD *)&v4[*v11])
        {
          LODWORD(v9) = *(_DWORD *)(*(_QWORD *)&v4[*v13] + v33);
          *(_QWORD *)&v4[v32] = v33 + 4;
        }
        else
        {
          v4[v22] = 1;
          LODWORD(v9) = 0;
        }
        objc_msgSend(v31, "numberWithFloat:", v9, v60);
        v44 = objc_claimAutoreleasedReturnValue();
        if (!v44)
          goto LABEL_58;
        v41 = (void *)v44;
        v42 = v6;
        goto LABEL_52;
      case 4u:
        v34 = (void *)MEMORY[0x1E0CB37E8];
        v35 = *v10;
        v36 = *(_QWORD *)&v4[v35];
        if (v36 <= 0xFFFFFFFFFFFFFFFBLL && v36 + 4 <= *(_QWORD *)&v4[*v11])
        {
          LODWORD(v9) = *(_DWORD *)(*(_QWORD *)&v4[*v13] + v36);
          *(_QWORD *)&v4[v35] = v36 + 4;
        }
        else
        {
          v4[v22] = 1;
          LODWORD(v9) = 0;
        }
        objc_msgSend(v34, "numberWithFloat:", v9, v60);
        v45 = objc_claimAutoreleasedReturnValue();
        if (!v45)
          goto LABEL_58;
        v41 = (void *)v45;
        v42 = v7;
        goto LABEL_52;
      case 5u:
        v37 = (void *)MEMORY[0x1E0CB37E8];
        v38 = *v10;
        v39 = *(_QWORD *)&v4[v38];
        if (v39 <= 0xFFFFFFFFFFFFFFFBLL && v39 + 4 <= *(_QWORD *)&v4[*v11])
        {
          LODWORD(v9) = *(_DWORD *)(*(_QWORD *)&v4[*v13] + v39);
          *(_QWORD *)&v4[v38] = v39 + 4;
        }
        else
        {
          v4[v22] = 1;
          LODWORD(v9) = 0;
        }
        objc_msgSend(v37, "numberWithFloat:", v9, v60);
        v46 = objc_claimAutoreleasedReturnValue();
        if (!v46)
          goto LABEL_58;
        v41 = (void *)v46;
        v42 = v8;
LABEL_52:
        objc_msgSend(v42, "addObject:", v41);

        goto LABEL_53;
      default:
        if ((PBReaderSkipValueWithTag() & 1) != 0)
        {
LABEL_53:
          if (*(_QWORD *)&v4[*v10] >= *(_QWORD *)&v4[*v11])
            goto LABEL_54;
          continue;
        }
LABEL_58:

LABEL_55:
        v58 = 0;
LABEL_57:

        return v58;
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
  NSArray *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  NSArray *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  NSArray *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  _BYTE v50[128];
  _BYTE v51[128];
  _BYTE v52[128];
  _BYTE v53[128];
  _BYTE v54[128];
  uint64_t v55;

  v55 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v46 = 0u;
  v47 = 0u;
  v48 = 0u;
  v49 = 0u;
  v5 = self->_launchTimeInMs;
  v6 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v46, v54, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v47;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v47 != v8)
          objc_enumerationMutation(v5);
        objc_msgSend(*(id *)(*((_QWORD *)&v46 + 1) + 8 * v9), "floatValue");
        PBDataWriterWriteFloatField();
        ++v9;
      }
      while (v7 != v9);
      v7 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v46, v54, 16);
    }
    while (v7);
  }

  v44 = 0u;
  v45 = 0u;
  v42 = 0u;
  v43 = 0u;
  v10 = self->_endpointDelayInMs;
  v11 = -[NSArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v42, v53, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v43;
    do
    {
      v14 = 0;
      do
      {
        if (*(_QWORD *)v43 != v13)
          objc_enumerationMutation(v10);
        objc_msgSend(*(id *)(*((_QWORD *)&v42 + 1) + 8 * v14), "floatValue");
        PBDataWriterWriteFloatField();
        ++v14;
      }
      while (v12 != v14);
      v12 = -[NSArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v42, v53, 16);
    }
    while (v12);
  }

  v40 = 0u;
  v41 = 0u;
  v38 = 0u;
  v39 = 0u;
  v15 = self->_siriResponseTimeInMs;
  v16 = -[NSArray countByEnumeratingWithState:objects:count:](v15, "countByEnumeratingWithState:objects:count:", &v38, v52, 16);
  if (v16)
  {
    v17 = v16;
    v18 = *(_QWORD *)v39;
    do
    {
      v19 = 0;
      do
      {
        if (*(_QWORD *)v39 != v18)
          objc_enumerationMutation(v15);
        objc_msgSend(*(id *)(*((_QWORD *)&v38 + 1) + 8 * v19), "floatValue");
        PBDataWriterWriteFloatField();
        ++v19;
      }
      while (v17 != v19);
      v17 = -[NSArray countByEnumeratingWithState:objects:count:](v15, "countByEnumeratingWithState:objects:count:", &v38, v52, 16);
    }
    while (v17);
  }

  v36 = 0u;
  v37 = 0u;
  v34 = 0u;
  v35 = 0u;
  v20 = self->_timeToUufrInMs;
  v21 = -[NSArray countByEnumeratingWithState:objects:count:](v20, "countByEnumeratingWithState:objects:count:", &v34, v51, 16);
  if (v21)
  {
    v22 = v21;
    v23 = *(_QWORD *)v35;
    do
    {
      v24 = 0;
      do
      {
        if (*(_QWORD *)v35 != v23)
          objc_enumerationMutation(v20);
        objc_msgSend(*(id *)(*((_QWORD *)&v34 + 1) + 8 * v24), "floatValue");
        PBDataWriterWriteFloatField();
        ++v24;
      }
      while (v22 != v24);
      v22 = -[NSArray countByEnumeratingWithState:objects:count:](v20, "countByEnumeratingWithState:objects:count:", &v34, v51, 16);
    }
    while (v22);
  }

  v32 = 0u;
  v33 = 0u;
  v30 = 0u;
  v31 = 0u;
  v25 = self->_timeToFirstWordInMs;
  v26 = -[NSArray countByEnumeratingWithState:objects:count:](v25, "countByEnumeratingWithState:objects:count:", &v30, v50, 16);
  if (v26)
  {
    v27 = v26;
    v28 = *(_QWORD *)v31;
    do
    {
      v29 = 0;
      do
      {
        if (*(_QWORD *)v31 != v28)
          objc_enumerationMutation(v25);
        objc_msgSend(*(id *)(*((_QWORD *)&v30 + 1) + 8 * v29), "floatValue", (_QWORD)v30);
        PBDataWriterWriteFloatField();
        ++v29;
      }
      while (v27 != v29);
      v27 = -[NSArray countByEnumeratingWithState:objects:count:](v25, "countByEnumeratingWithState:objects:count:", &v30, v50, 16);
    }
    while (v27);
  }

}

- (id)serialize
{
  void *v3;
  void *v4;

  v3 = (void *)objc_opt_new();
  -[BMSiriOnDeviceDigestExperimentMetricsExperimentDigestExperimentTuples writeTo:](self, "writeTo:", v3);
  objc_msgSend(v3, "immutableData");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (BMSiriOnDeviceDigestExperimentMetricsExperimentDigestExperimentTuples)initWithJSONDictionary:(id)a3 error:(id *)a4
{
  id v5;
  id v6;
  void *v7;
  int v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  uint64_t v14;
  id v15;
  void *v16;
  int v17;
  id *v18;
  id v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void **v23;
  uint64_t *v24;
  id v25;
  id v26;
  BMSiriOnDeviceDigestExperimentMetricsExperimentDigestExperimentTuples *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t j;
  uint64_t v32;
  void *v33;
  int v34;
  id v35;
  uint64_t v36;
  id v37;
  id *v38;
  id v39;
  uint64_t v40;
  void *v41;
  void **v42;
  uint64_t *v43;
  void *v44;
  id v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  void *v49;
  uint64_t k;
  uint64_t v51;
  void *v52;
  int v53;
  id v54;
  uint64_t v55;
  id v56;
  id *v57;
  id v58;
  uint64_t v59;
  uint64_t v60;
  void *v61;
  id v62;
  void *v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  id v67;
  uint64_t m;
  uint64_t v69;
  void *v70;
  void *v71;
  id v72;
  uint64_t v73;
  id v74;
  id *v75;
  id v76;
  uint64_t v77;
  void *v78;
  void *v79;
  uint64_t v80;
  id v81;
  uint64_t v82;
  void *v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  id v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
  id v92;
  id *v93;
  uint64_t v94;
  void *v95;
  void *v96;
  void **v97;
  uint64_t *v98;
  void *v99;
  id v101;
  uint64_t v102;
  id v103;
  void *v104;
  id v105;
  id v106;
  id v107;
  void *v108;
  void *v109;
  void *v110;
  id obj;
  id obja;
  void *v113;
  id v114;
  void *v115;
  BMSiriOnDeviceDigestExperimentMetricsExperimentDigestExperimentTuples *v116;
  __int128 v118;
  __int128 v119;
  __int128 v120;
  __int128 v121;
  __int128 v122;
  __int128 v123;
  __int128 v124;
  __int128 v125;
  __int128 v126;
  __int128 v127;
  __int128 v128;
  __int128 v129;
  __int128 v130;
  __int128 v131;
  __int128 v132;
  __int128 v133;
  __int128 v134;
  __int128 v135;
  __int128 v136;
  __int128 v137;
  uint64_t v138;
  void *v139;
  uint64_t v140;
  void *v141;
  _BYTE v142[128];
  uint64_t v143;
  void *v144;
  uint64_t v145;
  void *v146;
  uint64_t v147;
  void *v148;
  _BYTE v149[128];
  uint64_t v150;
  void *v151;
  uint64_t v152;
  void *v153;
  uint64_t v154;
  void *v155;
  _BYTE v156[128];
  uint64_t v157;
  void *v158;
  uint64_t v159;
  void *v160;
  uint64_t v161;
  void *v162;
  _BYTE v163[128];
  uint64_t v164;
  void *v165;
  uint64_t v166;
  void *v167;
  uint64_t v168;
  void *v169;
  _BYTE v170[128];
  uint64_t v171;
  _QWORD v172[3];

  v172[1] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("launchTimeInMs"));
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E38], "null");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v6, "isEqual:", v7);

  if (v8)
  {
    v116 = self;

    v6 = 0;
  }
  else
  {
    if (v6)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if (a4)
        {
          v35 = objc_alloc(MEMORY[0x1E0CB35C8]);
          v36 = *MEMORY[0x1E0D025B8];
          v171 = *MEMORY[0x1E0CB2D50];
          v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Expecting %@ as an array"), CFSTR("launchTimeInMs"));
          v172[0] = v9;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v172, &v171, 1);
          v15 = (id)objc_claimAutoreleasedReturnValue();
          v37 = (id)objc_msgSend(v35, "initWithDomain:code:userInfo:", v36, 2, v15);
          v27 = 0;
          *a4 = v37;
          goto LABEL_118;
        }
        v27 = 0;
        goto LABEL_119;
      }
    }
    v116 = self;
  }
  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v6, "count"));
  v134 = 0u;
  v135 = 0u;
  v136 = 0u;
  v137 = 0u;
  v6 = v6;
  v10 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v134, v170, 16);
  if (!v10)
    goto LABEL_15;
  v11 = v10;
  v12 = *(_QWORD *)v135;
  do
  {
    for (i = 0; i != v11; ++i)
    {
      if (*(_QWORD *)v135 != v12)
        objc_enumerationMutation(v6);
      v14 = *(_QWORD *)(*((_QWORD *)&v134 + 1) + 8 * i);
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v18 = a4;
        if (a4)
        {
          v19 = objc_alloc(MEMORY[0x1E0CB35C8]);
          v20 = *MEMORY[0x1E0D025B8];
          v168 = *MEMORY[0x1E0CB2D50];
          v21 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type null for element of %@, must not be null"), CFSTR("launchTimeInMs"));
          v169 = v21;
          v22 = (void *)MEMORY[0x1E0C99D80];
          v23 = &v169;
          v24 = &v168;
LABEL_21:
          objc_msgSend(v22, "dictionaryWithObjects:forKeys:count:", v23, v24, 1);
          v25 = (id)objc_claimAutoreleasedReturnValue();
          self = v116;
          v26 = (id)objc_msgSend(v19, "initWithDomain:code:userInfo:", v20, 2, v25);
          v27 = 0;
          *v18 = v26;
          v15 = v6;
          goto LABEL_117;
        }
LABEL_22:
        v27 = 0;
        v15 = v6;
        self = v116;
        goto LABEL_118;
      }
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        v18 = a4;
        if (a4)
        {
          v19 = objc_alloc(MEMORY[0x1E0CB35C8]);
          v20 = *MEMORY[0x1E0D025B8];
          v166 = *MEMORY[0x1E0CB2D50];
          v21 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), objc_opt_class(), CFSTR("launchTimeInMs"));
          v167 = v21;
          v22 = (void *)MEMORY[0x1E0C99D80];
          v23 = &v167;
          v24 = &v166;
          goto LABEL_21;
        }
        goto LABEL_22;
      }
      objc_msgSend(v9, "addObject:", v14);
    }
    v11 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v134, v170, 16);
  }
  while (v11);
LABEL_15:

  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("endpointDelayInMs"));
  v15 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E38], "null");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v15, "isEqual:", v16);

  v114 = v5;
  if (v17)
  {

    v15 = 0;
LABEL_25:
    v21 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v15, "count"));
    v130 = 0u;
    v131 = 0u;
    v132 = 0u;
    v133 = 0u;
    v15 = v15;
    v28 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v130, v163, 16);
    if (!v28)
      goto LABEL_34;
    v29 = v28;
    v30 = *(_QWORD *)v131;
    while (1)
    {
      for (j = 0; j != v29; ++j)
      {
        if (*(_QWORD *)v131 != v30)
          objc_enumerationMutation(v15);
        v32 = *(_QWORD *)(*((_QWORD *)&v130 + 1) + 8 * j);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v38 = a4;
          if (a4)
          {
            v39 = objc_alloc(MEMORY[0x1E0CB35C8]);
            v40 = *MEMORY[0x1E0D025B8];
            v161 = *MEMORY[0x1E0CB2D50];
            v115 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type null for element of %@, must not be null"), CFSTR("endpointDelayInMs"));
            v162 = v115;
            v41 = (void *)MEMORY[0x1E0C99D80];
            v42 = &v162;
            v43 = &v161;
LABEL_42:
            objc_msgSend(v41, "dictionaryWithObjects:forKeys:count:", v42, v43, 1);
            v44 = (void *)objc_claimAutoreleasedReturnValue();
            self = v116;
            v45 = (id)objc_msgSend(v39, "initWithDomain:code:userInfo:", v40, 2, v44);
            v27 = 0;
            *v38 = v45;
            v25 = v15;
            v5 = v114;
            goto LABEL_116;
          }
LABEL_43:
          v27 = 0;
          v25 = v15;
          goto LABEL_44;
        }
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          v38 = a4;
          if (a4)
          {
            v39 = objc_alloc(MEMORY[0x1E0CB35C8]);
            v40 = *MEMORY[0x1E0D025B8];
            v159 = *MEMORY[0x1E0CB2D50];
            v115 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), objc_opt_class(), CFSTR("endpointDelayInMs"));
            v160 = v115;
            v41 = (void *)MEMORY[0x1E0C99D80];
            v42 = &v160;
            v43 = &v159;
            goto LABEL_42;
          }
          goto LABEL_43;
        }
        objc_msgSend(v21, "addObject:", v32);
      }
      v29 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v130, v163, 16);
      if (!v29)
      {
LABEL_34:

        objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("siriResponseTimeInMs"));
        v25 = (id)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0C99E38], "null");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        v34 = objc_msgSend(v25, "isEqual:", v33);

        if (v34)
        {

          v25 = 0;
LABEL_48:
          v115 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v25, "count"));
          v126 = 0u;
          v127 = 0u;
          v128 = 0u;
          v129 = 0u;
          v25 = v25;
          v46 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v126, v156, 16);
          v110 = v21;
          if (!v46)
            goto LABEL_57;
          v47 = v46;
          v48 = *(_QWORD *)v127;
          while (1)
          {
            v49 = v25;
            for (k = 0; k != v47; ++k)
            {
              if (*(_QWORD *)v127 != v48)
                objc_enumerationMutation(v49);
              v51 = *(_QWORD *)(*((_QWORD *)&v126 + 1) + 8 * k);
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0)
              {
                v57 = a4;
                if (a4)
                {
                  v58 = objc_alloc(MEMORY[0x1E0CB35C8]);
                  v59 = *MEMORY[0x1E0D025B8];
                  v154 = *MEMORY[0x1E0CB2D50];
                  v113 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type null for element of %@, must not be null"), CFSTR("siriResponseTimeInMs"));
                  v155 = v113;
                  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v155, &v154, 1);
                  v60 = objc_claimAutoreleasedReturnValue();
                  v61 = v58;
LABEL_65:
                  v63 = (void *)v60;
                  v25 = v49;
                  v27 = 0;
                  *v57 = (id)objc_msgSend(v61, "initWithDomain:code:userInfo:", v59, 2);
                  v44 = v49;
                  v5 = v114;
                  self = v116;
                  goto LABEL_66;
                }
LABEL_67:
                v27 = 0;
                v25 = v49;
                v44 = v49;
                v5 = v114;
                self = v116;
                v21 = v110;
                goto LABEL_116;
              }
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) == 0)
              {
                v57 = a4;
                if (a4)
                {
                  v62 = objc_alloc(MEMORY[0x1E0CB35C8]);
                  v59 = *MEMORY[0x1E0D025B8];
                  v152 = *MEMORY[0x1E0CB2D50];
                  v113 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), objc_opt_class(), CFSTR("siriResponseTimeInMs"));
                  v153 = v113;
                  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v153, &v152, 1);
                  v60 = objc_claimAutoreleasedReturnValue();
                  v61 = v62;
                  goto LABEL_65;
                }
                goto LABEL_67;
              }
              objc_msgSend(v115, "addObject:", v51);
            }
            v25 = v49;
            v47 = objc_msgSend(v49, "countByEnumeratingWithState:objects:count:", &v126, v156, 16);
            v5 = v114;
            v21 = v110;
            if (!v47)
            {
LABEL_57:

              objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("timeToUufrInMs"));
              v44 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(MEMORY[0x1E0C99E38], "null");
              v52 = (void *)objc_claimAutoreleasedReturnValue();
              v53 = objc_msgSend(v44, "isEqual:", v52);

              if (v53)
              {

                v44 = 0;
LABEL_71:
                v113 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v44, "count"));
                v122 = 0u;
                v123 = 0u;
                v124 = 0u;
                v125 = 0u;
                obj = v44;
                v64 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v122, v149, 16);
                if (!v64)
                  goto LABEL_80;
                v65 = v64;
                v66 = *(_QWORD *)v123;
                while (1)
                {
                  v67 = v25;
                  for (m = 0; m != v65; ++m)
                  {
                    if (*(_QWORD *)v123 != v66)
                      objc_enumerationMutation(obj);
                    v69 = *(_QWORD *)(*((_QWORD *)&v122 + 1) + 8 * m);
                    objc_opt_class();
                    if ((objc_opt_isKindOfClass() & 1) != 0)
                    {
                      v75 = a4;
                      if (a4)
                      {
                        v76 = objc_alloc(MEMORY[0x1E0CB35C8]);
                        v77 = *MEMORY[0x1E0D025B8];
                        v147 = *MEMORY[0x1E0CB2D50];
                        v108 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type null for element of %@, must not be null"), CFSTR("timeToUufrInMs"));
                        v148 = v108;
                        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v148, &v147, 1);
                        v78 = (void *)objc_claimAutoreleasedReturnValue();
                        v79 = v76;
                        v80 = v77;
LABEL_89:
                        v25 = v67;
                        v44 = obj;
                        *v75 = (id)objc_msgSend(v79, "initWithDomain:code:userInfo:", v80, 2, v78);

                        v27 = 0;
                        v63 = obj;
                        v5 = v114;
                        self = v116;
                        v21 = v110;
                        goto LABEL_114;
                      }
LABEL_90:
                      v27 = 0;
                      v44 = obj;
                      v63 = obj;
                      v5 = v114;
                      self = v116;
                      v25 = v67;
LABEL_66:
                      v21 = v110;
                      goto LABEL_115;
                    }
                    objc_opt_class();
                    if ((objc_opt_isKindOfClass() & 1) == 0)
                    {
                      v75 = a4;
                      if (a4)
                      {
                        v81 = objc_alloc(MEMORY[0x1E0CB35C8]);
                        v82 = *MEMORY[0x1E0D025B8];
                        v145 = *MEMORY[0x1E0CB2D50];
                        v108 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), objc_opt_class(), CFSTR("timeToUufrInMs"));
                        v146 = v108;
                        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v146, &v145, 1);
                        v78 = (void *)objc_claimAutoreleasedReturnValue();
                        v79 = v81;
                        v80 = v82;
                        goto LABEL_89;
                      }
                      goto LABEL_90;
                    }
                    objc_msgSend(v113, "addObject:", v69);
                  }
                  v65 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v122, v149, 16);
                  v5 = v114;
                  v25 = v67;
                  v21 = v110;
                  if (!v65)
                  {
LABEL_80:
                    v44 = obj;

                    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("timeToFirstWordInMs"));
                    v70 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(MEMORY[0x1E0C99E38], "null");
                    v71 = (void *)objc_claimAutoreleasedReturnValue();
                    v106 = v70;
                    LODWORD(v70) = objc_msgSend(v70, "isEqual:", v71);

                    if ((_DWORD)v70)
                    {

                      goto LABEL_95;
                    }
                    if (v106)
                    {
                      objc_opt_class();
                      if ((objc_opt_isKindOfClass() & 1) == 0)
                      {
                        if (a4)
                        {
                          v101 = objc_alloc(MEMORY[0x1E0CB35C8]);
                          v102 = *MEMORY[0x1E0D025B8];
                          v143 = *MEMORY[0x1E0CB2D50];
                          v109 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Expecting %@ as an array"), CFSTR("timeToFirstWordInMs"));
                          v144 = v109;
                          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v144, &v143, 1);
                          v103 = v5;
                          v104 = (void *)objc_claimAutoreleasedReturnValue();
                          *a4 = (id)objc_msgSend(v101, "initWithDomain:code:userInfo:", v102, 2, v104);
                          v21 = v110;

                          v5 = v103;
                          v27 = 0;
                          self = v116;
                          v63 = v106;

                        }
                        else
                        {
                          v27 = 0;
                          self = v116;
                          v63 = v106;
                        }
                        goto LABEL_115;
                      }
                      v83 = v106;
                    }
                    else
                    {
LABEL_95:
                      v83 = 0;
                    }
                    v108 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v83, "count"));
                    v118 = 0u;
                    v119 = 0u;
                    v120 = 0u;
                    v121 = 0u;
                    v107 = v83;
                    v84 = objc_msgSend(v107, "countByEnumeratingWithState:objects:count:", &v118, v142, 16);
                    if (!v84)
                      goto LABEL_105;
                    v85 = v84;
                    v86 = *(_QWORD *)v119;
LABEL_98:
                    v87 = v25;
                    v88 = 0;
                    while (1)
                    {
                      if (*(_QWORD *)v119 != v86)
                        objc_enumerationMutation(v107);
                      v89 = *(_QWORD *)(*((_QWORD *)&v118 + 1) + 8 * v88);
                      objc_opt_class();
                      if ((objc_opt_isKindOfClass() & 1) != 0)
                        break;
                      objc_opt_class();
                      if ((objc_opt_isKindOfClass() & 1) == 0)
                      {
                        v93 = a4;
                        v25 = v87;
                        v21 = v110;
                        v44 = obj;
                        if (a4)
                        {
                          v105 = objc_alloc(MEMORY[0x1E0CB35C8]);
                          v94 = *MEMORY[0x1E0D025B8];
                          v138 = *MEMORY[0x1E0CB2D50];
                          v95 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), objc_opt_class(), CFSTR("timeToFirstWordInMs"));
                          v139 = v95;
                          v96 = (void *)MEMORY[0x1E0C99D80];
                          v97 = &v139;
                          v98 = &v138;
LABEL_112:
                          objc_msgSend(v96, "dictionaryWithObjects:forKeys:count:", v97, v98, 1);
                          v99 = (void *)objc_claimAutoreleasedReturnValue();
                          *v93 = (id)objc_msgSend(v105, "initWithDomain:code:userInfo:", v94, 2, v99);

                        }
                        goto LABEL_113;
                      }
                      objc_msgSend(v108, "addObject:", v89);
                      if (v85 == ++v88)
                      {
                        v85 = objc_msgSend(v107, "countByEnumeratingWithState:objects:count:", &v118, v142, 16);
                        v5 = v114;
                        v25 = v87;
                        v21 = v110;
                        if (v85)
                          goto LABEL_98;
LABEL_105:
                        v63 = v107;

                        self = -[BMSiriOnDeviceDigestExperimentMetricsExperimentDigestExperimentTuples initWithLaunchTimeInMs:endpointDelayInMs:siriResponseTimeInMs:timeToUufrInMs:timeToFirstWordInMs:](v116, "initWithLaunchTimeInMs:endpointDelayInMs:siriResponseTimeInMs:timeToUufrInMs:timeToFirstWordInMs:", v9, v21, v115, v113, v108);
                        v27 = self;
                        v44 = obj;
LABEL_114:

LABEL_115:
LABEL_116:

LABEL_117:
                        goto LABEL_118;
                      }
                    }
                    v93 = a4;
                    v25 = v87;
                    v21 = v110;
                    v44 = obj;
                    if (a4)
                    {
                      v105 = objc_alloc(MEMORY[0x1E0CB35C8]);
                      v94 = *MEMORY[0x1E0D025B8];
                      v140 = *MEMORY[0x1E0CB2D50];
                      v95 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type null for element of %@, must not be null"), CFSTR("timeToFirstWordInMs"));
                      v141 = v95;
                      v96 = (void *)MEMORY[0x1E0C99D80];
                      v97 = &v141;
                      v98 = &v140;
                      goto LABEL_112;
                    }
LABEL_113:
                    v63 = v107;

                    v27 = 0;
                    v5 = v114;
                    self = v116;
                    goto LABEL_114;
                  }
                }
              }
              if (!v44)
                goto LABEL_71;
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0)
                goto LABEL_71;
              if (a4)
              {
                obja = objc_alloc(MEMORY[0x1E0CB35C8]);
                v90 = *MEMORY[0x1E0D025B8];
                v150 = *MEMORY[0x1E0CB2D50];
                v113 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Expecting %@ as an array"), CFSTR("timeToUufrInMs"));
                v151 = v113;
                objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v151, &v150, 1);
                v91 = objc_claimAutoreleasedReturnValue();
                v92 = (id)objc_msgSend(obja, "initWithDomain:code:userInfo:", v90, 2, v91);
                v27 = 0;
                *a4 = v92;
                v63 = (void *)v91;
                self = v116;
                goto LABEL_115;
              }
              v27 = 0;
LABEL_84:
              self = v116;
              goto LABEL_116;
            }
          }
        }
        if (!v25)
          goto LABEL_48;
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
          goto LABEL_48;
        if (a4)
        {
          v72 = objc_alloc(MEMORY[0x1E0CB35C8]);
          v73 = *MEMORY[0x1E0D025B8];
          v157 = *MEMORY[0x1E0CB2D50];
          v115 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Expecting %@ as an array"), CFSTR("siriResponseTimeInMs"));
          v158 = v115;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v158, &v157, 1);
          v44 = (void *)objc_claimAutoreleasedReturnValue();
          v74 = (id)objc_msgSend(v72, "initWithDomain:code:userInfo:", v73, 2, v44);
          v27 = 0;
          *a4 = v74;
          goto LABEL_84;
        }
        v27 = 0;
LABEL_44:
        self = v116;
        goto LABEL_117;
      }
    }
  }
  if (!v15)
    goto LABEL_25;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    goto LABEL_25;
  self = v116;
  if (a4)
  {
    v54 = objc_alloc(MEMORY[0x1E0CB35C8]);
    v55 = *MEMORY[0x1E0D025B8];
    v164 = *MEMORY[0x1E0CB2D50];
    v21 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Expecting %@ as an array"), CFSTR("endpointDelayInMs"));
    v165 = v21;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v165, &v164, 1);
    v25 = (id)objc_claimAutoreleasedReturnValue();
    v56 = (id)objc_msgSend(v54, "initWithDomain:code:userInfo:", v55, 2, v25);
    v27 = 0;
    *a4 = v56;
    goto LABEL_117;
  }
  v27 = 0;
LABEL_118:

LABEL_119:
  return v27;
}

- (id)_launchTimeInMsJSONArray
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  double v10;
  void *v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v3 = (void *)objc_opt_new();
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  -[BMSiriOnDeviceDigestExperimentMetricsExperimentDigestExperimentTuples launchTimeInMs](self, "launchTimeInMs", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v14;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v14 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * i);
        objc_msgSend(v9, "doubleValue");
        if (fabs(v10) == INFINITY)
        {
          objc_msgSend(MEMORY[0x1E0C99E38], "null");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v3, "addObject:", v11);

        }
        else
        {
          objc_msgSend(v9, "doubleValue");
          objc_msgSend(v3, "addObject:", v9);
        }
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v6);
  }

  return v3;
}

- (id)_endpointDelayInMsJSONArray
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  double v10;
  void *v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v3 = (void *)objc_opt_new();
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  -[BMSiriOnDeviceDigestExperimentMetricsExperimentDigestExperimentTuples endpointDelayInMs](self, "endpointDelayInMs", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v14;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v14 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * i);
        objc_msgSend(v9, "doubleValue");
        if (fabs(v10) == INFINITY)
        {
          objc_msgSend(MEMORY[0x1E0C99E38], "null");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v3, "addObject:", v11);

        }
        else
        {
          objc_msgSend(v9, "doubleValue");
          objc_msgSend(v3, "addObject:", v9);
        }
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v6);
  }

  return v3;
}

- (id)_siriResponseTimeInMsJSONArray
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  double v10;
  void *v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v3 = (void *)objc_opt_new();
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  -[BMSiriOnDeviceDigestExperimentMetricsExperimentDigestExperimentTuples siriResponseTimeInMs](self, "siriResponseTimeInMs", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v14;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v14 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * i);
        objc_msgSend(v9, "doubleValue");
        if (fabs(v10) == INFINITY)
        {
          objc_msgSend(MEMORY[0x1E0C99E38], "null");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v3, "addObject:", v11);

        }
        else
        {
          objc_msgSend(v9, "doubleValue");
          objc_msgSend(v3, "addObject:", v9);
        }
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v6);
  }

  return v3;
}

- (id)_timeToUufrInMsJSONArray
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  double v10;
  void *v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v3 = (void *)objc_opt_new();
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  -[BMSiriOnDeviceDigestExperimentMetricsExperimentDigestExperimentTuples timeToUufrInMs](self, "timeToUufrInMs", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v14;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v14 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * i);
        objc_msgSend(v9, "doubleValue");
        if (fabs(v10) == INFINITY)
        {
          objc_msgSend(MEMORY[0x1E0C99E38], "null");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v3, "addObject:", v11);

        }
        else
        {
          objc_msgSend(v9, "doubleValue");
          objc_msgSend(v3, "addObject:", v9);
        }
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v6);
  }

  return v3;
}

- (id)_timeToFirstWordInMsJSONArray
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  double v10;
  void *v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v3 = (void *)objc_opt_new();
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  -[BMSiriOnDeviceDigestExperimentMetricsExperimentDigestExperimentTuples timeToFirstWordInMs](self, "timeToFirstWordInMs", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v14;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v14 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * i);
        objc_msgSend(v9, "doubleValue");
        if (fabs(v10) == INFINITY)
        {
          objc_msgSend(MEMORY[0x1E0C99E38], "null");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v3, "addObject:", v11);

        }
        else
        {
          objc_msgSend(v9, "doubleValue");
          objc_msgSend(v3, "addObject:", v9);
        }
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
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
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v15;
  void *v16;
  const __CFString *v17;
  const __CFString *v18;
  const __CFString *v19;
  const __CFString *v20;
  const __CFString *v21;
  _QWORD v22[6];

  v22[5] = *MEMORY[0x1E0C80C00];
  -[BMSiriOnDeviceDigestExperimentMetricsExperimentDigestExperimentTuples _launchTimeInMsJSONArray](self, "_launchTimeInMsJSONArray");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMSiriOnDeviceDigestExperimentMetricsExperimentDigestExperimentTuples _endpointDelayInMsJSONArray](self, "_endpointDelayInMsJSONArray");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMSiriOnDeviceDigestExperimentMetricsExperimentDigestExperimentTuples _siriResponseTimeInMsJSONArray](self, "_siriResponseTimeInMsJSONArray");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMSiriOnDeviceDigestExperimentMetricsExperimentDigestExperimentTuples _timeToUufrInMsJSONArray](self, "_timeToUufrInMsJSONArray");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMSiriOnDeviceDigestExperimentMetricsExperimentDigestExperimentTuples _timeToFirstWordInMsJSONArray](self, "_timeToFirstWordInMsJSONArray");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = CFSTR("launchTimeInMs");
  v8 = (uint64_t)v3;
  if (!v3)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v8 = objc_claimAutoreleasedReturnValue();
  }
  v15 = v8;
  v22[0] = v8;
  v18 = CFSTR("endpointDelayInMs");
  v9 = v4;
  if (!v4)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null", v8, v17, v18);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v22[1] = v9;
  v19 = CFSTR("siriResponseTimeInMs");
  v10 = v5;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v22[2] = v10;
  v20 = CFSTR("timeToUufrInMs");
  v11 = v6;
  if (!v6)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v22[3] = v11;
  v21 = CFSTR("timeToFirstWordInMs");
  v12 = v7;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v22[4] = v12;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v22, &v17, 5, v15);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    if (v6)
      goto LABEL_13;
  }
  else
  {

    if (v6)
    {
LABEL_13:
      if (v5)
        goto LABEL_14;
      goto LABEL_19;
    }
  }

  if (v5)
  {
LABEL_14:
    if (v4)
      goto LABEL_15;
LABEL_20:

    if (v3)
      goto LABEL_16;
LABEL_21:

    goto LABEL_16;
  }
LABEL_19:

  if (!v4)
    goto LABEL_20;
LABEL_15:
  if (!v3)
    goto LABEL_21;
LABEL_16:

  return v13;
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
  void *v32;
  void *v33;
  void *v34;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    -[BMSiriOnDeviceDigestExperimentMetricsExperimentDigestExperimentTuples launchTimeInMs](self, "launchTimeInMs");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "launchTimeInMs");
    v7 = objc_claimAutoreleasedReturnValue();
    if (v6 == (void *)v7)
    {

    }
    else
    {
      v8 = (void *)v7;
      -[BMSiriOnDeviceDigestExperimentMetricsExperimentDigestExperimentTuples launchTimeInMs](self, "launchTimeInMs");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "launchTimeInMs");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v9, "isEqual:", v10);

      if (!v11)
        goto LABEL_17;
    }
    -[BMSiriOnDeviceDigestExperimentMetricsExperimentDigestExperimentTuples endpointDelayInMs](self, "endpointDelayInMs");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "endpointDelayInMs");
    v14 = objc_claimAutoreleasedReturnValue();
    if (v13 == (void *)v14)
    {

    }
    else
    {
      v15 = (void *)v14;
      -[BMSiriOnDeviceDigestExperimentMetricsExperimentDigestExperimentTuples endpointDelayInMs](self, "endpointDelayInMs");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "endpointDelayInMs");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = objc_msgSend(v16, "isEqual:", v17);

      if (!v18)
        goto LABEL_17;
    }
    -[BMSiriOnDeviceDigestExperimentMetricsExperimentDigestExperimentTuples siriResponseTimeInMs](self, "siriResponseTimeInMs");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "siriResponseTimeInMs");
    v20 = objc_claimAutoreleasedReturnValue();
    if (v19 == (void *)v20)
    {

    }
    else
    {
      v21 = (void *)v20;
      -[BMSiriOnDeviceDigestExperimentMetricsExperimentDigestExperimentTuples siriResponseTimeInMs](self, "siriResponseTimeInMs");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "siriResponseTimeInMs");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = objc_msgSend(v22, "isEqual:", v23);

      if (!v24)
        goto LABEL_17;
    }
    -[BMSiriOnDeviceDigestExperimentMetricsExperimentDigestExperimentTuples timeToUufrInMs](self, "timeToUufrInMs");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "timeToUufrInMs");
    v26 = objc_claimAutoreleasedReturnValue();
    if (v25 == (void *)v26)
    {

    }
    else
    {
      v27 = (void *)v26;
      -[BMSiriOnDeviceDigestExperimentMetricsExperimentDigestExperimentTuples timeToUufrInMs](self, "timeToUufrInMs");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "timeToUufrInMs");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      v30 = objc_msgSend(v28, "isEqual:", v29);

      if (!v30)
      {
LABEL_17:
        v12 = 0;
LABEL_23:

        goto LABEL_24;
      }
    }
    -[BMSiriOnDeviceDigestExperimentMetricsExperimentDigestExperimentTuples timeToFirstWordInMs](self, "timeToFirstWordInMs");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "timeToFirstWordInMs");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    if (v31 == v32)
    {
      v12 = 1;
    }
    else
    {
      -[BMSiriOnDeviceDigestExperimentMetricsExperimentDigestExperimentTuples timeToFirstWordInMs](self, "timeToFirstWordInMs");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "timeToFirstWordInMs");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v33, "isEqual:", v34);

    }
    goto LABEL_23;
  }
  v12 = 0;
LABEL_24:

  return v12;
}

- (unsigned)dataVersion
{
  return self->_dataVersion;
}

- (NSArray)launchTimeInMs
{
  return self->_launchTimeInMs;
}

- (NSArray)endpointDelayInMs
{
  return self->_endpointDelayInMs;
}

- (NSArray)siriResponseTimeInMs
{
  return self->_siriResponseTimeInMs;
}

- (NSArray)timeToUufrInMs
{
  return self->_timeToUufrInMs;
}

- (NSArray)timeToFirstWordInMs
{
  return self->_timeToFirstWordInMs;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timeToFirstWordInMs, 0);
  objc_storeStrong((id *)&self->_timeToUufrInMs, 0);
  objc_storeStrong((id *)&self->_siriResponseTimeInMs, 0);
  objc_storeStrong((id *)&self->_endpointDelayInMs, 0);
  objc_storeStrong((id *)&self->_launchTimeInMs, 0);
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

    v4 = -[BMSiriOnDeviceDigestExperimentMetricsExperimentDigestExperimentTuples initByReadFrom:]([BMSiriOnDeviceDigestExperimentMetricsExperimentDigestExperimentTuples alloc], "initByReadFrom:", v7);
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
  _QWORD v9[6];

  v9[5] = *MEMORY[0x1E0C80C00];
  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02710]), "initWithName:dataType:requestOnly:extractBlock:", CFSTR("launchTimeInMs_json"), 5, 1, &__block_literal_global_250);
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02710]), "initWithName:dataType:requestOnly:extractBlock:", CFSTR("endpointDelayInMs_json"), 5, 1, &__block_literal_global_251);
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02710]), "initWithName:dataType:requestOnly:extractBlock:", CFSTR("siriResponseTimeInMs_json"), 5, 1, &__block_literal_global_252_47823);
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02710]), "initWithName:dataType:requestOnly:extractBlock:", CFSTR("timeToUufrInMs_json"), 5, 1, &__block_literal_global_253_47824);
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02710]), "initWithName:dataType:requestOnly:extractBlock:", CFSTR("timeToFirstWordInMs_json"), 5, 1, &__block_literal_global_254_47825);
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
  return &unk_1E5F1D8A8;
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
  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("launchTimeInMs"), 1, 1, 0);
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("endpointDelayInMs"), 2, 1, 0, v2);
  v9[1] = v3;
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("siriResponseTimeInMs"), 3, 1, 0);
  v9[2] = v4;
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("timeToUufrInMs"), 4, 1, 0);
  v9[3] = v5;
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("timeToFirstWordInMs"), 5, 1, 0);
  v9[4] = v6;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v9, 5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

id __80__BMSiriOnDeviceDigestExperimentMetricsExperimentDigestExperimentTuples_columns__block_invoke_5(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  void *v4;

  objc_msgSend(a2, "eventBodyKeepingBackingData:", 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_timeToFirstWordInMsJSONArray");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  BMConvertObjectToJSONString();
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

id __80__BMSiriOnDeviceDigestExperimentMetricsExperimentDigestExperimentTuples_columns__block_invoke_4(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  void *v4;

  objc_msgSend(a2, "eventBodyKeepingBackingData:", 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_timeToUufrInMsJSONArray");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  BMConvertObjectToJSONString();
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

id __80__BMSiriOnDeviceDigestExperimentMetricsExperimentDigestExperimentTuples_columns__block_invoke_3(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  void *v4;

  objc_msgSend(a2, "eventBodyKeepingBackingData:", 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_siriResponseTimeInMsJSONArray");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  BMConvertObjectToJSONString();
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

id __80__BMSiriOnDeviceDigestExperimentMetricsExperimentDigestExperimentTuples_columns__block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  void *v4;

  objc_msgSend(a2, "eventBodyKeepingBackingData:", 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_endpointDelayInMsJSONArray");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  BMConvertObjectToJSONString();
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

id __80__BMSiriOnDeviceDigestExperimentMetricsExperimentDigestExperimentTuples_columns__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  void *v4;

  objc_msgSend(a2, "eventBodyKeepingBackingData:", 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_launchTimeInMsJSONArray");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  BMConvertObjectToJSONString();
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

@end
