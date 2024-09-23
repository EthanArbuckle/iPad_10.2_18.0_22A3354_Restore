@implementation ENExposureConfiguration

- (ENExposureConfiguration)init
{
  char *v2;
  char *v3;
  int64x2_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  int64x2_t v9;
  void *v10;
  char *v11;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)ENExposureConfiguration;
  v2 = -[ENExposureConfiguration init](&v13, sel_init);
  v3 = v2;
  if (v2)
  {
    v4 = vdupq_n_s64(0x807060504030201uLL);
    *(int64x2_t *)(v2 + 8) = v4;
    *(int64x2_t *)(v2 + 24) = v4;
    v5 = (void *)*((_QWORD *)v2 + 18);
    *((_QWORD *)v2 + 18) = &unk_24C397088;

    v6 = (void *)*((_QWORD *)v3 + 21);
    *((_QWORD *)v3 + 21) = &unk_24C3970A0;

    v7 = (void *)*((_QWORD *)v3 + 23);
    *((_QWORD *)v3 + 22) = 0x3FF0000000000000;
    *((_QWORD *)v3 + 23) = &unk_24C3970B8;

    v8 = (void *)*((_QWORD *)v3 + 25);
    *((_QWORD *)v3 + 24) = 0x3FF0000000000000;
    *((_QWORD *)v3 + 25) = &unk_24C3970D0;

    v9 = vdupq_n_s64(0x4059000000000000uLL);
    *((_QWORD *)v3 + 26) = 0x3FF0000000000000;
    *(int64x2_t *)(v3 + 56) = v9;
    *(int64x2_t *)(v3 + 72) = v9;
    *((int64x2_t *)v3 + 7) = v9;
    *((int64x2_t *)v3 + 8) = v9;
    *((int64x2_t *)v3 + 6) = v9;
    *((_DWORD *)v3 + 11) = 1;
    v10 = (void *)*((_QWORD *)v3 + 28);
    *((_QWORD *)v3 + 28) = &unk_24C3970E8;

    *((_QWORD *)v3 + 29) = 0x3FF0000000000000;
    v11 = v3;
  }

  return (ENExposureConfiguration *)v3;
}

- (ENExposureConfiguration)initWithDictionary:(id)a3 error:(id *)a4
{
  id v5;
  ENExposureConfiguration *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  void *v11;
  ENExposureConfiguration *v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  unsigned int Int64Ranged;
  id v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t i;
  void *v24;
  double v25;
  id v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t j;
  void *v30;
  double attenuationWeight;
  id v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t k;
  void *v36;
  double daysSinceLastExposureWeight;
  void *v38;
  void *v39;
  id v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t m;
  void *v44;
  double durationWeight;
  unint64_t Int64;
  void *v47;
  void *v48;
  id v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  void *v53;
  double transmissionRiskWeight;
  id v56;
  id v57;
  id v58;
  id v59;
  id v60;
  id v62;
  id v63;
  id v64;
  id obj;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  __int128 v83;
  __int128 v84;
  __int128 v85;
  _QWORD v86[5];
  uint64_t v87;
  uint64_t *v88;
  uint64_t v89;
  uint64_t (*v90)(uint64_t, uint64_t);
  void (*v91)(uint64_t);
  id v92;
  _BYTE v93[128];
  _BYTE v94[128];
  _BYTE v95[128];
  _BYTE v96[128];
  _BYTE v97[128];
  uint64_t v98;

  v98 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = -[ENExposureConfiguration init](self, "init");
  if (!v6)
  {
    if (a4)
      goto LABEL_148;
    goto LABEL_149;
  }
  v6->_flags = CFDictionaryGetInt64Ranged();
  CFDictionaryGetDouble();
  v6->_immediateDurationWeight = v7;
  if (v7 < 0.0 || v7 > 250.0)
  {
    if (a4)
      goto LABEL_148;
    goto LABEL_149;
  }
  CFDictionaryGetDouble();
  v6->_nearDurationWeight = v8;
  if (v8 < 0.0 || v8 > 250.0)
  {
    if (a4)
      goto LABEL_148;
    goto LABEL_149;
  }
  CFDictionaryGetDouble();
  v6->_mediumDurationWeight = v9;
  if (v9 < 0.0 || v9 > 250.0)
  {
    if (a4)
      goto LABEL_148;
    goto LABEL_149;
  }
  CFDictionaryGetDouble();
  v6->_otherDurationWeight = v10;
  if (v10 < 0.0 || v10 > 250.0)
  {
    if (a4)
    {
LABEL_148:
      ENErrorF(2);
      v12 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_108;
    }
LABEL_149:
    v12 = 0;
    goto LABEL_108;
  }
  CFDictionaryGetTypeID();
  CFDictionaryGetTypedValue();
  obj = (id)objc_claimAutoreleasedReturnValue();
  if (obj)
  {
    v87 = 0;
    v88 = &v87;
    v89 = 0x3032000000;
    v90 = __Block_byref_object_copy_;
    v91 = __Block_byref_object_dispose_;
    v92 = 0;
    v86[0] = MEMORY[0x24BDAC760];
    v86[1] = 3221225472;
    v86[2] = __52__ENExposureConfiguration_initWithDictionary_error___block_invoke;
    v86[3] = &unk_24C38AF50;
    v86[4] = &v87;
    objc_msgSend(obj, "enumerateKeysAndObjectsUsingBlock:", v86);
    v11 = (void *)v88[5];
    if (v11)
    {
      if (a4)
        *a4 = objc_retainAutorelease(v11);
    }
    else
    {
      objc_storeStrong((id *)&v6->_infectiousnessForDaysSinceOnsetOfSymptoms, obj);
    }
    _Block_object_dispose(&v87, 8);

    if (v11)
      goto LABEL_14;
  }
  CFDictionaryGetDouble();
  v6->_infectiousnessStandardWeight = v13;
  if (v13 < 0.0 || v13 > 250.0)
  {
    if (a4)
      goto LABEL_165;
    goto LABEL_14;
  }
  CFDictionaryGetDouble();
  v6->_infectiousnessHighWeight = v14;
  if (v14 < 0.0 || v14 > 250.0)
  {
    if (a4)
      goto LABEL_165;
    goto LABEL_14;
  }
  CFDictionaryGetDouble();
  v6->_reportTypeConfirmedTestWeight = v15;
  if (v15 < 0.0 || v15 > 250.0)
  {
    if (a4)
      goto LABEL_165;
    goto LABEL_14;
  }
  CFDictionaryGetDouble();
  v6->_reportTypeConfirmedClinicalDiagnosisWeight = v16;
  if (v16 < 0.0 || v16 > 250.0)
  {
    if (a4)
      goto LABEL_165;
    goto LABEL_14;
  }
  CFDictionaryGetDouble();
  v6->_reportTypeSelfReportedWeight = v17;
  if (v17 < 0.0 || v17 > 250.0)
  {
    if (a4)
      goto LABEL_165;
    goto LABEL_14;
  }
  CFDictionaryGetDouble();
  v6->_reportTypeRecursiveWeight = v18;
  if (v18 < 0.0 || v18 > 250.0)
  {
    if (a4)
      goto LABEL_165;
    goto LABEL_14;
  }
  Int64Ranged = CFDictionaryGetInt64Ranged();
  v6->_reportTypeNoneMap = Int64Ranged;
  if (Int64Ranged >= 5)
  {
    if (a4)
    {
LABEL_165:
      ENErrorF(2);
      v12 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_107;
    }
LABEL_14:
    v12 = 0;
    goto LABEL_107;
  }
  CFArrayGetTypeID();
  CFDictionaryGetTypedValue();
  v64 = (id)objc_claimAutoreleasedReturnValue();
  if (v64)
  {
    if ((objc_msgSend(v64, "count") & 0xFFFFFFFFFFFFFFFELL) == 2)
    {
      v84 = 0u;
      v85 = 0u;
      v82 = 0u;
      v83 = 0u;
      v20 = v64;
      v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v82, v97, 16);
      if (!v21)
        goto LABEL_39;
      v22 = *(_QWORD *)v83;
      while (1)
      {
        for (i = 0; i != v21; ++i)
        {
          if (*(_QWORD *)v83 != v22)
            objc_enumerationMutation(v20);
          v24 = *(void **)(*((_QWORD *)&v82 + 1) + 8 * i);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {
            if (a4)
            {
LABEL_112:
              ENErrorF(2);
              *a4 = (id)objc_claimAutoreleasedReturnValue();
            }
LABEL_113:

LABEL_114:
            v12 = 0;
            goto LABEL_106;
          }
          if ((unint64_t)objc_msgSend(v24, "longLongValue") >= 0x100)
          {
            if (a4)
              goto LABEL_112;
            goto LABEL_113;
          }
        }
        v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v82, v97, 16);
        if (!v21)
        {
LABEL_39:

          objc_storeStrong((id *)&v6->_attenuationDurationThresholds, v64);
          goto LABEL_40;
        }
      }
    }
    if (!a4)
      goto LABEL_114;
    objc_msgSend(v64, "count");
    ENErrorF(2);
    v56 = (id)objc_claimAutoreleasedReturnValue();
LABEL_172:
    v12 = 0;
    *a4 = v56;
    goto LABEL_106;
  }
LABEL_40:
  v6->_daysSinceLastExposureThreshold = (int)CFDictionaryGetInt64Ranged();
  CFDictionaryGetDouble();
  v6->_minimumRiskScoreFullRange = v25;
  if (v25 < 0.0 || v25 > 4096.0)
  {
    if (!a4)
      goto LABEL_114;
    ENErrorF(2);
    v56 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_172;
  }
  CFArrayGetTypeID();
  CFDictionaryGetTypedValue();
  v63 = (id)objc_claimAutoreleasedReturnValue();
  if (v63)
  {
    if (objc_msgSend(v63, "count") == 8)
    {
      v80 = 0u;
      v81 = 0u;
      v78 = 0u;
      v79 = 0u;
      v26 = v63;
      v27 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v78, v96, 16);
      if (!v27)
        goto LABEL_53;
      v28 = *(_QWORD *)v79;
      while (1)
      {
        for (j = 0; j != v27; ++j)
        {
          if (*(_QWORD *)v79 != v28)
            objc_enumerationMutation(v26);
          v30 = *(void **)(*((_QWORD *)&v78 + 1) + 8 * j);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {
            if (a4)
            {
LABEL_118:
              ENErrorF(2);
              *a4 = (id)objc_claimAutoreleasedReturnValue();
            }
LABEL_119:

LABEL_120:
            v12 = 0;
            goto LABEL_105;
          }
          if ((unint64_t)objc_msgSend(v30, "longLongValue") >= 9)
          {
            if (a4)
              goto LABEL_118;
            goto LABEL_119;
          }
        }
        v27 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v78, v96, 16);
        if (!v27)
        {
LABEL_53:

          objc_storeStrong((id *)&v6->_attenuationLevelValues, v63);
          goto LABEL_54;
        }
      }
    }
    if (!a4)
      goto LABEL_120;
    objc_msgSend(v63, "count");
    ENErrorF(2);
    v57 = (id)objc_claimAutoreleasedReturnValue();
LABEL_177:
    v12 = 0;
    *a4 = v57;
    goto LABEL_105;
  }
LABEL_54:
  attenuationWeight = v6->_attenuationWeight;
  if (attenuationWeight < 0.0 || attenuationWeight > 100.0)
  {
    if (!a4)
      goto LABEL_120;
    ENErrorF(2);
    v57 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_177;
  }
  CFArrayGetTypeID();
  CFDictionaryGetTypedValue();
  v62 = (id)objc_claimAutoreleasedReturnValue();
  if (v62)
  {
    if (objc_msgSend(v62, "count") == 8)
    {
      v76 = 0u;
      v77 = 0u;
      v74 = 0u;
      v75 = 0u;
      v32 = v62;
      v33 = objc_msgSend(v32, "countByEnumeratingWithState:objects:count:", &v74, v95, 16);
      if (!v33)
        goto LABEL_67;
      v34 = *(_QWORD *)v75;
      while (1)
      {
        for (k = 0; k != v33; ++k)
        {
          if (*(_QWORD *)v75 != v34)
            objc_enumerationMutation(v32);
          v36 = *(void **)(*((_QWORD *)&v74 + 1) + 8 * k);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {
            if (a4)
            {
LABEL_124:
              ENErrorF(2);
              *a4 = (id)objc_claimAutoreleasedReturnValue();
            }
LABEL_125:

LABEL_126:
            v12 = 0;
            goto LABEL_104;
          }
          if ((unint64_t)objc_msgSend(v36, "longLongValue") >= 9)
          {
            if (a4)
              goto LABEL_124;
            goto LABEL_125;
          }
        }
        v33 = objc_msgSend(v32, "countByEnumeratingWithState:objects:count:", &v74, v95, 16);
        if (!v33)
        {
LABEL_67:

          objc_storeStrong((id *)&v6->_daysSinceLastExposureLevelValues, v62);
          goto LABEL_68;
        }
      }
    }
    if (!a4)
      goto LABEL_126;
    objc_msgSend(v62, "count");
    ENErrorF(2);
    v58 = (id)objc_claimAutoreleasedReturnValue();
LABEL_182:
    v12 = 0;
    *a4 = v58;
    goto LABEL_104;
  }
LABEL_68:
  daysSinceLastExposureWeight = v6->_daysSinceLastExposureWeight;
  if (daysSinceLastExposureWeight < 0.0 || daysSinceLastExposureWeight > 100.0)
  {
    if (!a4)
      goto LABEL_126;
    ENErrorF(2);
    v58 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_182;
  }
  CFArrayGetTypeID();
  CFDictionaryGetTypedValue();
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  v39 = v38;
  if (!v38)
    goto LABEL_82;
  if (objc_msgSend(v38, "count") != 8)
  {
    if (a4)
    {
      objc_msgSend(v39, "count");
      ENErrorF(2);
      v60 = (id)objc_claimAutoreleasedReturnValue();
LABEL_192:
      v12 = 0;
      *a4 = v60;
      goto LABEL_103;
    }
    goto LABEL_132;
  }
  v72 = 0u;
  v73 = 0u;
  v70 = 0u;
  v71 = 0u;
  v40 = v39;
  v41 = objc_msgSend(v40, "countByEnumeratingWithState:objects:count:", &v70, v94, 16);
  if (!v41)
    goto LABEL_81;
  v42 = *(_QWORD *)v71;
  while (2)
  {
    for (m = 0; m != v41; ++m)
    {
      if (*(_QWORD *)v71 != v42)
        objc_enumerationMutation(v40);
      v44 = *(void **)(*((_QWORD *)&v70 + 1) + 8 * m);
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if (a4)
          goto LABEL_130;
        goto LABEL_131;
      }
      if ((unint64_t)objc_msgSend(v44, "longLongValue") >= 9)
      {
        if (a4)
        {
LABEL_130:
          ENErrorF(2);
          *a4 = (id)objc_claimAutoreleasedReturnValue();
        }
LABEL_131:

        goto LABEL_132;
      }
    }
    v41 = objc_msgSend(v40, "countByEnumeratingWithState:objects:count:", &v70, v94, 16);
    if (v41)
      continue;
    break;
  }
LABEL_81:

  objc_storeStrong((id *)&v6->_durationLevelValues, v39);
LABEL_82:
  durationWeight = v6->_durationWeight;
  if (durationWeight < 0.0 || durationWeight > 100.0)
  {
    if (a4)
      goto LABEL_191;
    goto LABEL_132;
  }
  LODWORD(v87) = 0;
  Int64 = CFDictionaryGetInt64();
  if ((_DWORD)v87)
    goto LABEL_87;
  if (Int64 >= 0x100)
  {
    if (a4)
    {
LABEL_191:
      ENErrorF(2);
      v60 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_192;
    }
LABEL_132:
    v12 = 0;
    goto LABEL_103;
  }
  v6->_minimumRiskScore = Int64;
LABEL_87:
  CFArrayGetTypeID();
  CFDictionaryGetTypedValue();
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  v48 = v47;
  if (!v47)
    goto LABEL_99;
  if (objc_msgSend(v47, "count") == 8)
  {
    v68 = 0u;
    v69 = 0u;
    v66 = 0u;
    v67 = 0u;
    v49 = v48;
    v50 = objc_msgSend(v49, "countByEnumeratingWithState:objects:count:", &v66, v93, 16);
    if (!v50)
      goto LABEL_98;
    v51 = *(_QWORD *)v67;
LABEL_91:
    v52 = 0;
    while (1)
    {
      if (*(_QWORD *)v67 != v51)
        objc_enumerationMutation(v49);
      v53 = *(void **)(*((_QWORD *)&v66 + 1) + 8 * v52);
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
        break;
      if ((unint64_t)objc_msgSend(v53, "longLongValue") >= 9)
      {
        if (a4)
          goto LABEL_136;
        goto LABEL_137;
      }
      if (v50 == ++v52)
      {
        v50 = objc_msgSend(v49, "countByEnumeratingWithState:objects:count:", &v66, v93, 16);
        if (v50)
          goto LABEL_91;
LABEL_98:

        objc_storeStrong((id *)&v6->_transmissionRiskLevelValues, v48);
LABEL_99:
        transmissionRiskWeight = v6->_transmissionRiskWeight;
        if (transmissionRiskWeight >= 0.0 && transmissionRiskWeight <= 100.0)
        {
          v12 = v6;
          goto LABEL_102;
        }
        if (a4)
        {
          ENErrorF(2);
          v59 = (id)objc_claimAutoreleasedReturnValue();
          goto LABEL_189;
        }
LABEL_138:
        v12 = 0;
        goto LABEL_102;
      }
    }
    if (a4)
    {
LABEL_136:
      ENErrorF(2);
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }
LABEL_137:

    goto LABEL_138;
  }
  if (!a4)
    goto LABEL_138;
  objc_msgSend(v48, "count");
  ENErrorF(2);
  v59 = (id)objc_claimAutoreleasedReturnValue();
LABEL_189:
  v12 = 0;
  *a4 = v59;
LABEL_102:

LABEL_103:
LABEL_104:

LABEL_105:
LABEL_106:

LABEL_107:
LABEL_108:

  return v12;
}

void __52__ENExposureConfiguration_initWithDictionary_error___block_invoke(uint64_t a1, void *a2, void *a3, _BYTE *a4)
{
  id v7;
  char isKindOfClass;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  id v12;

  v12 = a3;
  v7 = a2;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) == 0
    || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0)
    || objc_msgSend(v12, "unsignedIntValue") >= 3)
  {
    ENErrorF(2);
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
    v11 = *(void **)(v10 + 40);
    *(_QWORD *)(v10 + 40) = v9;

    *a4 = 1;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  ENExposureConfiguration *v4;
  void *v5;
  ENExposureConfiguration *v6;
  uint64_t v7;
  ENExposureConfiguration *v8;
  uint64_t v10;

  v4 = [ENExposureConfiguration alloc];
  -[ENExposureConfiguration dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = 0;
  v6 = -[ENExposureConfiguration initWithDictionary:error:](v4, "initWithDictionary:error:", v5, &v10);
  v7 = v10;

  v8 = 0;
  if (!v7)
    v8 = v6;

  return v8;
}

- (id)dictionaryRepresentation
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

  v3 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_flags);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v4, CFSTR("exposureFlags"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", self->_immediateDurationWeight);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("immediateDurationWeight"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", self->_nearDurationWeight);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("nearDurationWeight"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", self->_mediumDurationWeight);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("mediumDurationWeight"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", self->_otherDurationWeight);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v8, CFSTR("otherDurationWeight"));

  objc_msgSend(v3, "setObject:forKeyedSubscript:", self->_infectiousnessForDaysSinceOnsetOfSymptoms, CFSTR("infectiousnessForDaysSinceOnsetOfSymptoms"));
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", self->_infectiousnessStandardWeight);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, CFSTR("infectiousnessStandardWeight"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", self->_infectiousnessHighWeight);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v10, CFSTR("infectiousnessHighWeight"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", self->_reportTypeConfirmedTestWeight);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v11, CFSTR("reportTypeConfirmedTestWeight"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", self->_reportTypeConfirmedClinicalDiagnosisWeight);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v12, CFSTR("reportTypeConfirmedClinicalDiagnosisWeight"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", self->_reportTypeSelfReportedWeight);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v13, CFSTR("reportTypeSelfReportedWeight"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", self->_reportTypeRecursiveWeight);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v14, CFSTR("reportTypeRecursiveWeight"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_reportTypeNoneMap);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v15, CFSTR("reportTypeNoneMap"));

  objc_msgSend(v3, "setObject:forKeyedSubscript:", self->_attenuationDurationThresholds, CFSTR("attenuationDurationThresholds"));
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", self->_daysSinceLastExposureThreshold);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v16, CFSTR("daysSinceLastExposureThreshold"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedChar:", self->_minimumRiskScore);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v17, CFSTR("minimumRiskScore"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", self->_minimumRiskScoreFullRange);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v18, CFSTR("minimumRiskScoreFullRange"));

  objc_msgSend(v3, "setObject:forKeyedSubscript:", self->_attenuationLevelValues, CFSTR("attenuationLevelValues"));
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", self->_attenuationWeight);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v19, CFSTR("attenuationWeight"));

  objc_msgSend(v3, "setObject:forKeyedSubscript:", self->_daysSinceLastExposureLevelValues, CFSTR("daysSinceLastExposureLevelValues"));
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", self->_daysSinceLastExposureWeight);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v20, CFSTR("daysSinceLastExposureWeight"));

  objc_msgSend(v3, "setObject:forKeyedSubscript:", self->_durationLevelValues, CFSTR("durationLevelValues"));
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", self->_durationWeight);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v21, CFSTR("durationWeight"));

  objc_msgSend(v3, "setObject:forKeyedSubscript:", self->_transmissionRiskLevelValues, CFSTR("transmissionRiskLevelValues"));
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", self->_transmissionRiskWeight);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v22, CFSTR("transmissionRiskWeight"));

  v23 = (void *)objc_msgSend(v3, "copy");
  return v23;
}

- (ENExposureConfiguration)initWithXPCObject:(id)a3 error:(id *)a4
{
  id v6;
  ENExposureConfiguration *v7;
  int v8;
  double *p_immediateDurationWeight;
  double *p_nearDurationWeight;
  double *p_mediumDurationWeight;
  double *p_otherDurationWeight;
  void *v13;
  id v14;
  void *v15;
  ENExposureConfiguration *v16;
  double *p_infectiousnessStandardWeight;
  double *p_infectiousnessHighWeight;
  double *p_reportTypeConfirmedTestWeight;
  double *p_reportTypeConfirmedClinicalDiagnosisWeight;
  double *p_reportTypeSelfReportedWeight;
  double *p_reportTypeRecursiveWeight;
  int v23;
  unsigned int reportTypeNoneMap;
  int v25;
  int v26;
  id *p_attenuationLevelValues;
  uint64_t i;
  void *v29;
  double attenuationWeight;
  id *p_durationLevelValues;
  uint64_t j;
  void *v34;
  id *p_daysSinceLastExposureLevelValues;
  uint64_t k;
  void *v37;
  double daysSinceLastExposureWeight;
  double durationWeight;
  id *p_transmissionRiskLevelValues;
  uint64_t m;
  void *v44;
  double transmissionRiskWeight;
  _QWORD applier[6];
  int64_t v49;
  int64_t *v50;
  uint64_t v51;
  uint64_t (*v52)(uint64_t, uint64_t);
  void (*v53)(uint64_t);
  id v54;

  v6 = a3;
  v7 = -[ENExposureConfiguration init](self, "init");
  if (!v7)
  {
    if (a4)
      goto LABEL_107;
    goto LABEL_108;
  }
  if (MEMORY[0x20BD2F7B8](v6) != MEMORY[0x24BDACFA0])
  {
    if (a4)
      goto LABEL_107;
    goto LABEL_108;
  }
  v49 = 0;
  v8 = CUXPCDecodeUInt64RangedEx();
  if (v8 == 6)
  {
    v7->_flags = v49;
  }
  else if (v8 == 5)
  {
    goto LABEL_108;
  }
  if (!CUXPCDecodeNSArrayOfInteger())
    goto LABEL_108;
  if ((-[NSArray count](v7->_attenuationDurationThresholds, "count") & 0xFFFFFFFFFFFFFFFELL) != 2)
  {
    if (a4)
      goto LABEL_107;
    goto LABEL_108;
  }
  p_immediateDurationWeight = &v7->_immediateDurationWeight;
  if (!CUXPCDecodeDouble())
    goto LABEL_108;
  if (*p_immediateDurationWeight < 0.0 || *p_immediateDurationWeight > 250.0)
  {
    if (a4)
      goto LABEL_107;
    goto LABEL_108;
  }
  p_nearDurationWeight = &v7->_nearDurationWeight;
  if (!CUXPCDecodeDouble())
    goto LABEL_108;
  if (*p_nearDurationWeight < 0.0 || *p_nearDurationWeight > 250.0)
  {
    if (a4)
      goto LABEL_107;
    goto LABEL_108;
  }
  p_mediumDurationWeight = &v7->_mediumDurationWeight;
  if (!CUXPCDecodeDouble())
    goto LABEL_108;
  if (*p_mediumDurationWeight < 0.0 || *p_mediumDurationWeight > 250.0)
  {
    if (a4)
      goto LABEL_107;
    goto LABEL_108;
  }
  p_otherDurationWeight = &v7->_otherDurationWeight;
  if (!CUXPCDecodeDouble())
    goto LABEL_108;
  if (*p_otherDurationWeight < 0.0 || *p_otherDurationWeight > 250.0)
  {
    if (a4)
    {
LABEL_107:
      ENErrorF(2);
      v16 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_93;
    }
LABEL_108:
    v16 = 0;
    goto LABEL_93;
  }
  xpc_dictionary_get_dictionary(v6, "infectLV");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (v13)
  {
    v14 = objc_alloc_init(MEMORY[0x24BDBCED8]);
    v49 = 0;
    v50 = &v49;
    v51 = 0x3032000000;
    v52 = __Block_byref_object_copy_;
    v53 = __Block_byref_object_dispose_;
    v54 = 0;
    applier[0] = MEMORY[0x24BDAC760];
    applier[1] = 3221225472;
    applier[2] = __51__ENExposureConfiguration_initWithXPCObject_error___block_invoke;
    applier[3] = &unk_24C38AF78;
    applier[4] = v14;
    applier[5] = &v49;
    xpc_dictionary_apply(v13, applier);
    v15 = (void *)v50[5];
    if (v15)
    {
      if (a4)
        *a4 = objc_retainAutorelease(v15);
    }
    else
    {
      objc_storeStrong((id *)&v7->_infectiousnessForDaysSinceOnsetOfSymptoms, v14);
    }
    _Block_object_dispose(&v49, 8);

    if (v15)
      goto LABEL_24;
  }
  p_infectiousnessStandardWeight = &v7->_infectiousnessStandardWeight;
  if (!CUXPCDecodeDouble())
    goto LABEL_24;
  if (*p_infectiousnessStandardWeight < 0.0 || *p_infectiousnessStandardWeight > 250.0)
  {
    if (a4)
      goto LABEL_140;
    goto LABEL_24;
  }
  p_infectiousnessHighWeight = &v7->_infectiousnessHighWeight;
  if (!CUXPCDecodeDouble())
    goto LABEL_24;
  if (*p_infectiousnessHighWeight < 0.0 || *p_infectiousnessHighWeight > 250.0)
  {
    if (a4)
      goto LABEL_140;
    goto LABEL_24;
  }
  p_reportTypeConfirmedTestWeight = &v7->_reportTypeConfirmedTestWeight;
  if (!CUXPCDecodeDouble())
    goto LABEL_24;
  if (*p_reportTypeConfirmedTestWeight < 0.0 || *p_reportTypeConfirmedTestWeight > 250.0)
  {
    if (a4)
      goto LABEL_140;
    goto LABEL_24;
  }
  p_reportTypeConfirmedClinicalDiagnosisWeight = &v7->_reportTypeConfirmedClinicalDiagnosisWeight;
  if (!CUXPCDecodeDouble())
    goto LABEL_24;
  if (*p_reportTypeConfirmedClinicalDiagnosisWeight < 0.0 || *p_reportTypeConfirmedClinicalDiagnosisWeight > 250.0)
  {
    if (a4)
      goto LABEL_140;
    goto LABEL_24;
  }
  p_reportTypeSelfReportedWeight = &v7->_reportTypeSelfReportedWeight;
  if (!CUXPCDecodeDouble())
    goto LABEL_24;
  if (*p_reportTypeSelfReportedWeight < 0.0 || *p_reportTypeSelfReportedWeight > 250.0)
  {
    if (a4)
      goto LABEL_140;
    goto LABEL_24;
  }
  p_reportTypeRecursiveWeight = &v7->_reportTypeRecursiveWeight;
  if (!CUXPCDecodeDouble())
    goto LABEL_24;
  if (*p_reportTypeRecursiveWeight < 0.0 || *p_reportTypeRecursiveWeight > 250.0)
  {
    if (a4)
      goto LABEL_140;
    goto LABEL_24;
  }
  v49 = 0;
  v23 = CUXPCDecodeUInt64RangedEx();
  if (v23 == 6)
  {
    reportTypeNoneMap = v49;
    v7->_reportTypeNoneMap = v49;
  }
  else
  {
    if (v23 == 5)
      goto LABEL_24;
    reportTypeNoneMap = v7->_reportTypeNoneMap;
  }
  if (reportTypeNoneMap >= 5)
  {
    if (a4)
      goto LABEL_140;
    goto LABEL_24;
  }
  v49 = 0;
  v25 = CUXPCDecodeUInt64RangedEx();
  if (v25 == 6)
  {
    v7->_minimumRiskScore = v49;
  }
  else if (v25 == 5)
  {
    goto LABEL_24;
  }
  if (!CUXPCDecodeDouble())
    goto LABEL_24;
  v49 = 0;
  v26 = CUXPCDecodeSInt64RangedEx();
  if (v26 == 6)
  {
    v7->_daysSinceLastExposureThreshold = v49;
  }
  else if (v26 == 5)
  {
    goto LABEL_24;
  }
  p_attenuationLevelValues = (id *)&v7->_attenuationLevelValues;
  if (!CUXPCDecodeNSArrayOfInteger())
    goto LABEL_24;
  if (*p_attenuationLevelValues)
  {
    if (objc_msgSend(*p_attenuationLevelValues, "count") != 8)
    {
      if (a4)
        goto LABEL_140;
      goto LABEL_24;
    }
    for (i = 0; i != 8; ++i)
    {
      objc_msgSend(*p_attenuationLevelValues, "objectAtIndexedSubscript:", i);
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      v7->_attenuationLevelValuesMap[i] = objc_msgSend(v29, "unsignedIntValue");

    }
  }
  attenuationWeight = v7->_attenuationWeight;
  if (attenuationWeight < 0.0 || attenuationWeight > 100.0)
  {
    if (a4)
      goto LABEL_140;
    goto LABEL_24;
  }
  p_durationLevelValues = (id *)&v7->_durationLevelValues;
  if (!CUXPCDecodeNSArrayOfInteger())
    goto LABEL_24;
  if (*p_durationLevelValues)
  {
    if (objc_msgSend(*p_durationLevelValues, "count") != 8)
    {
      if (a4)
        goto LABEL_140;
      goto LABEL_24;
    }
    for (j = 0; j != 8; ++j)
    {
      objc_msgSend(*p_durationLevelValues, "objectAtIndexedSubscript:", j);
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      v7->_durationLevelValuesMap[j] = objc_msgSend(v34, "unsignedIntValue");

    }
  }
  p_daysSinceLastExposureLevelValues = (id *)&v7->_daysSinceLastExposureLevelValues;
  if (!CUXPCDecodeNSArrayOfInteger())
    goto LABEL_24;
  if (*p_daysSinceLastExposureLevelValues)
  {
    if (objc_msgSend(*p_daysSinceLastExposureLevelValues, "count") != 8)
    {
      if (a4)
        goto LABEL_140;
      goto LABEL_24;
    }
    for (k = 0; k != 8; ++k)
    {
      objc_msgSend(*p_daysSinceLastExposureLevelValues, "objectAtIndexedSubscript:", k);
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      v7->_daysSinceLastExposureLevelValuesMap[k] = objc_msgSend(v37, "unsignedIntValue");

    }
  }
  daysSinceLastExposureWeight = v7->_daysSinceLastExposureWeight;
  if (daysSinceLastExposureWeight < 0.0 || daysSinceLastExposureWeight > 100.0)
  {
    if (a4)
      goto LABEL_140;
    goto LABEL_24;
  }
  durationWeight = v7->_durationWeight;
  if (durationWeight < 0.0 || durationWeight > 100.0)
  {
    if (a4)
      goto LABEL_140;
    goto LABEL_24;
  }
  p_transmissionRiskLevelValues = (id *)&v7->_transmissionRiskLevelValues;
  if (!CUXPCDecodeNSArrayOfInteger())
    goto LABEL_24;
  if (*p_transmissionRiskLevelValues)
  {
    if (objc_msgSend(*p_transmissionRiskLevelValues, "count") != 8)
    {
      if (a4)
        goto LABEL_140;
      goto LABEL_24;
    }
    for (m = 0; m != 8; ++m)
    {
      objc_msgSend(*p_transmissionRiskLevelValues, "objectAtIndexedSubscript:", m);
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      v7->_transmissionRiskLevelValuesMap[m] = objc_msgSend(v44, "unsignedIntValue");

    }
  }
  transmissionRiskWeight = v7->_transmissionRiskWeight;
  if (transmissionRiskWeight >= 0.0 && transmissionRiskWeight <= 100.0)
  {
    v16 = v7;
    goto LABEL_92;
  }
  if (a4)
  {
LABEL_140:
    ENErrorF(2);
    v16 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_92;
  }
LABEL_24:
  v16 = 0;
LABEL_92:

LABEL_93:
  return v16;
}

uint64_t __51__ENExposureConfiguration_initWithXPCObject_error___block_invoke(uint64_t a1, const char *a2, void *a3)
{
  id v5;
  uint64_t v6;
  unint64_t value;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;

  v5 = a3;
  v6 = atoll(a2);
  if (MEMORY[0x20BD2F7B8](v5) == MEMORY[0x24BDACFD0] && (value = xpc_int64_get_value(v5), value < 3))
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", value);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = *(void **)(a1 + 32);
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", v6);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setObject:forKeyedSubscript:", v8, v10);

    v11 = 1;
  }
  else
  {
    ENErrorF(2);
    v12 = objc_claimAutoreleasedReturnValue();
    v11 = 0;
    v13 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v8 = *(void **)(v13 + 40);
    *(_QWORD *)(v13 + 40) = v12;
  }

  return v11;
}

- (void)encodeWithXPCObject:(id)a3
{
  id v4;
  uint64_t flags;
  NSDictionary *v6;
  xpc_object_t v7;
  void *v8;
  int64_t daysSinceLastExposureThreshold;
  double minimumRiskScoreFullRange;
  xpc_object_t xdict;
  _QWORD v12[5];

  v4 = a3;
  flags = self->_flags;
  xdict = v4;
  if ((_DWORD)flags)
  {
    xpc_dictionary_set_uint64(v4, "expF", flags);
    v4 = xdict;
  }
  xpc_dictionary_set_double(v4, "immediateDurW", self->_immediateDurationWeight);
  xpc_dictionary_set_double(xdict, "nearDurW", self->_nearDurationWeight);
  xpc_dictionary_set_double(xdict, "medDurW", self->_mediumDurationWeight);
  xpc_dictionary_set_double(xdict, "otherDurW", self->_otherDurationWeight);
  v6 = self->_infectiousnessForDaysSinceOnsetOfSymptoms;
  if (v6)
  {
    v7 = xpc_dictionary_create(0, 0, 0);
    v12[0] = MEMORY[0x24BDAC760];
    v12[1] = 3221225472;
    v12[2] = __47__ENExposureConfiguration_encodeWithXPCObject___block_invoke;
    v12[3] = &unk_24C38AFA0;
    v12[4] = v7;
    -[NSDictionary enumerateKeysAndObjectsUsingBlock:](v6, "enumerateKeysAndObjectsUsingBlock:", v12);
    xpc_dictionary_set_value(xdict, "infectLV", v7);

  }
  xpc_dictionary_set_double(xdict, "infWStd", self->_infectiousnessStandardWeight);
  xpc_dictionary_set_double(xdict, "infWHigh", self->_infectiousnessHighWeight);
  xpc_dictionary_set_double(xdict, "rtWCTest", self->_reportTypeConfirmedTestWeight);
  xpc_dictionary_set_double(xdict, "rtWCClin", self->_reportTypeConfirmedClinicalDiagnosisWeight);
  xpc_dictionary_set_double(xdict, "rtWSelfR", self->_reportTypeSelfReportedWeight);
  xpc_dictionary_set_double(xdict, "rtWRecurs", self->_reportTypeRecursiveWeight);
  xpc_dictionary_set_uint64(xdict, "rtNM", self->_reportTypeNoneMap);
  CFArrayGetTypeID();
  CFDictionaryGetTypedValue();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  CUXPCEncodeNSArrayOfNSNumber();
  daysSinceLastExposureThreshold = self->_daysSinceLastExposureThreshold;
  if (daysSinceLastExposureThreshold)
    xpc_dictionary_set_int64(xdict, "dsleTh", daysSinceLastExposureThreshold);
  minimumRiskScoreFullRange = self->_minimumRiskScoreFullRange;
  if (minimumRiskScoreFullRange == 0.0)
    CFDictionaryGetDouble();
  if (minimumRiskScoreFullRange != 0.0)
    xpc_dictionary_set_double(xdict, "mnRSFR", minimumRiskScoreFullRange);
  if (self->_minimumRiskScore)
    xpc_dictionary_set_uint64(xdict, "mnRS", self->_minimumRiskScore);
  CUXPCEncodeNSArrayOfNSNumber();
  xpc_dictionary_set_double(xdict, "attW", self->_attenuationWeight);
  CUXPCEncodeNSArrayOfNSNumber();
  xpc_dictionary_set_double(xdict, "durW", self->_durationWeight);
  CUXPCEncodeNSArrayOfNSNumber();
  xpc_dictionary_set_double(xdict, "dleW", self->_daysSinceLastExposureWeight);
  CUXPCEncodeNSArrayOfNSNumber();
  xpc_dictionary_set_double(xdict, "trRW", self->_transmissionRiskWeight);

}

void __47__ENExposureConfiguration_encodeWithXPCObject___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  int64_t v7;
  char __str[16];
  __int128 v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  *(_OWORD *)__str = 0u;
  v9 = 0u;
  v5 = a3;
  snprintf(__str, 0x20uLL, "%lld", objc_msgSend(a2, "longLongValue"));
  v6 = *(void **)(a1 + 32);
  v7 = objc_msgSend(v5, "longLongValue");

  xpc_dictionary_set_int64(v6, __str, v7);
}

- (id)description
{
  id v3;
  id v4;
  NSDictionary *v5;
  id v6;
  id v7;
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  id v18;

  NSAppendPrintF_safe();
  v18 = 0;
  NSAppendPrintF();
  v3 = v18;

  NSAppendPrintF_safe();
  v4 = v3;

  v5 = self->_infectiousnessForDaysSinceOnsetOfSymptoms;
  if (v5)
  {
    NSAppendPrintF();
    v6 = v4;

    v4 = v6;
  }
  NSAppendPrintF_safe();
  v7 = v4;

  NSAppendPrintF_safe();
  v8 = v7;

  NSAppendPrintF_safe();
  v9 = v8;

  NSAppendPrintF();
  v10 = v9;

  NSAppendPrintF_safe();
  v11 = v10;

  NSAppendPrintF_safe();
  v12 = v11;

  NSAppendPrintF();
  v13 = v12;

  NSAppendPrintF();
  v14 = v13;

  NSAppendPrintF();
  v15 = v14;

  NSAppendPrintF();
  v16 = v15;

  return v16;
}

- (double)attenuationLevelValueWithAttenuation:(unsigned __int8)a3
{
  return self->_attenuationWeight * (double)a3;
}

- (double)daysSinceLastExposureLevelValueWithDays:(int64_t)a3
{
  unint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v4 = 16;
  v5 = 17;
  v6 = 18;
  v7 = 19;
  v8 = 20;
  v9 = 21;
  v10 = 22;
  if (a3 <= 1)
    v10 = 23;
  if (a3 <= 3)
    v9 = v10;
  if (a3 <= 5)
    v8 = v9;
  if (a3 <= 7)
    v7 = v8;
  if (a3 <= 9)
    v6 = v7;
  if (a3 <= 11)
    v5 = v6;
  if (a3 <= 13)
    v4 = v5;
  LOBYTE(v3) = *((_BYTE *)&self->super.isa + v4);
  return self->_daysSinceLastExposureWeight * (double)v3;
}

- (double)durationLevelValueWithDuration:(double)a3
{
  double v3;
  uint64_t v4;

  v3 = a3 / 60.0;
  if (v3 <= 0.0)
  {
    v4 = 24;
  }
  else if (v3 <= 5.0)
  {
    v4 = 25;
  }
  else if (v3 <= 10.0)
  {
    v4 = 26;
  }
  else if (v3 <= 15.0)
  {
    v4 = 27;
  }
  else if (v3 <= 20.0)
  {
    v4 = 28;
  }
  else if (v3 <= 25.0)
  {
    v4 = 29;
  }
  else
  {
    v4 = 30;
    if (v3 > 30.0)
      v4 = 31;
  }
  LOBYTE(v3) = *((_BYTE *)&self->super.isa + v4);
  return self->_durationWeight * (double)*(unint64_t *)&v3;
}

- (unsigned)infectiousnessWithDaysSinceOnsetOfSymptoms:(int64_t)a3
{
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", a3);
  return CFDictionaryGetInt64Ranged();
}

- (double)infectiousnessWeightWithDaysSinceOnsetOfSymptoms:(int64_t)a3 skip:(BOOL *)a4
{
  unsigned int v6;

  v6 = -[ENExposureConfiguration infectiousnessWithDaysSinceOnsetOfSymptoms:](self, "infectiousnessWithDaysSinceOnsetOfSymptoms:", a3);
  if (v6 == 2)
    return self->_infectiousnessHighWeight;
  if (v6 == 1)
    return self->_infectiousnessStandardWeight;
  *a4 = 1;
  return 0.0;
}

- (unsigned)mappedDiagnosisReportType:(unsigned int)a3
{
  if (a3 - 5 <= 0xFFFFFFFB)
    return self->_reportTypeNoneMap;
  return a3;
}

- (double)reportTypeWeightWithReportType:(unsigned int)a3 skip:(BOOL *)a4
{
  unsigned int v6;
  double result;

  v6 = -[ENExposureConfiguration mappedDiagnosisReportType:](self, "mappedDiagnosisReportType:", *(_QWORD *)&a3);
  *a4 = v6 == 0;
  result = 0.0;
  switch(v6)
  {
    case 0u:
      return result;
    case 1u:
    case 4u:
      result = self->_reportTypeConfirmedTestWeight;
      break;
    case 2u:
      result = self->_reportTypeConfirmedClinicalDiagnosisWeight;
      break;
    case 3u:
      result = self->_reportTypeSelfReportedWeight;
      break;
    default:
      result = 100.0;
      break;
  }
  return result;
}

- (double)transmissionLevelValueWithTransmissionRiskLevel:(unsigned __int8)a3
{
  unint64_t v3;
  uint64_t v4;

  if (a3 >= 7u)
    v4 = 7;
  else
    v4 = a3;
  LOBYTE(v3) = self->_transmissionRiskLevelValuesMap[v4];
  return self->_transmissionRiskWeight * (double)v3;
}

- (double)weightedDurationWithExposureInfo:(id)a3
{
  void *v4;
  uint64_t v5;
  unint64_t v6;
  void *v7;
  double v8;
  double v9;
  void *v10;
  double v11;
  void *v12;
  double v13;
  void *v14;
  double v15;

  objc_msgSend(a3, "attenuationDurations");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "count");
  if (v5)
  {
    v6 = v5;
    objc_msgSend(v4, "objectAtIndexedSubscript:", 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "doubleValue");
    v9 = v8 * (self->_immediateDurationWeight / 100.0) + 0.0;

    if (v6 != 1)
    {
      objc_msgSend(v4, "objectAtIndexedSubscript:", 1);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "doubleValue");
      v9 = v9 + v11 * (self->_nearDurationWeight / 100.0);

      if (v6 >= 3)
      {
        objc_msgSend(v4, "objectAtIndexedSubscript:", 2);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "doubleValue");
        v9 = v9 + v13 * (self->_mediumDurationWeight / 100.0);

        if (v6 != 3)
        {
          objc_msgSend(v4, "objectAtIndexedSubscript:", 3);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "doubleValue");
          v9 = v9 + v15 * (self->_otherDurationWeight / 100.0);

        }
      }
    }
  }
  else
  {
    v9 = 0.0;
  }

  return v9;
}

- (double)immediateDurationWeight
{
  return self->_immediateDurationWeight;
}

- (void)setImmediateDurationWeight:(double)immediateDurationWeight
{
  self->_immediateDurationWeight = immediateDurationWeight;
}

- (double)nearDurationWeight
{
  return self->_nearDurationWeight;
}

- (void)setNearDurationWeight:(double)nearDurationWeight
{
  self->_nearDurationWeight = nearDurationWeight;
}

- (double)mediumDurationWeight
{
  return self->_mediumDurationWeight;
}

- (void)setMediumDurationWeight:(double)mediumDurationWeight
{
  self->_mediumDurationWeight = mediumDurationWeight;
}

- (double)otherDurationWeight
{
  return self->_otherDurationWeight;
}

- (void)setOtherDurationWeight:(double)otherDurationWeight
{
  self->_otherDurationWeight = otherDurationWeight;
}

- (NSDictionary)infectiousnessForDaysSinceOnsetOfSymptoms
{
  return self->_infectiousnessForDaysSinceOnsetOfSymptoms;
}

- (void)setInfectiousnessForDaysSinceOnsetOfSymptoms:(NSDictionary *)infectiousnessForDaysSinceOnsetOfSymptoms
{
  objc_setProperty_nonatomic_copy(self, a2, infectiousnessForDaysSinceOnsetOfSymptoms, 88);
}

- (double)infectiousnessStandardWeight
{
  return self->_infectiousnessStandardWeight;
}

- (void)setInfectiousnessStandardWeight:(double)infectiousnessStandardWeight
{
  self->_infectiousnessStandardWeight = infectiousnessStandardWeight;
}

- (double)infectiousnessHighWeight
{
  return self->_infectiousnessHighWeight;
}

- (void)setInfectiousnessHighWeight:(double)infectiousnessHighWeight
{
  self->_infectiousnessHighWeight = infectiousnessHighWeight;
}

- (double)reportTypeConfirmedTestWeight
{
  return self->_reportTypeConfirmedTestWeight;
}

- (void)setReportTypeConfirmedTestWeight:(double)reportTypeConfirmedTestWeight
{
  self->_reportTypeConfirmedTestWeight = reportTypeConfirmedTestWeight;
}

- (double)reportTypeConfirmedClinicalDiagnosisWeight
{
  return self->_reportTypeConfirmedClinicalDiagnosisWeight;
}

- (void)setReportTypeConfirmedClinicalDiagnosisWeight:(double)reportTypeConfirmedClinicalDiagnosisWeight
{
  self->_reportTypeConfirmedClinicalDiagnosisWeight = reportTypeConfirmedClinicalDiagnosisWeight;
}

- (double)reportTypeSelfReportedWeight
{
  return self->_reportTypeSelfReportedWeight;
}

- (void)setReportTypeSelfReportedWeight:(double)reportTypeSelfReportedWeight
{
  self->_reportTypeSelfReportedWeight = reportTypeSelfReportedWeight;
}

- (double)reportTypeRecursiveWeight
{
  return self->_reportTypeRecursiveWeight;
}

- (void)setReportTypeRecursiveWeight:(double)reportTypeRecursiveWeight
{
  self->_reportTypeRecursiveWeight = reportTypeRecursiveWeight;
}

- (ENDiagnosisReportType)reportTypeNoneMap
{
  return self->_reportTypeNoneMap;
}

- (void)setReportTypeNoneMap:(ENDiagnosisReportType)reportTypeNoneMap
{
  self->_reportTypeNoneMap = reportTypeNoneMap;
}

- (NSArray)attenuationDurationThresholds
{
  return self->_attenuationDurationThresholds;
}

- (void)setAttenuationDurationThresholds:(NSArray *)attenuationDurationThresholds
{
  objc_setProperty_nonatomic_copy(self, a2, attenuationDurationThresholds, 144);
}

- (NSInteger)daysSinceLastExposureThreshold
{
  return self->_daysSinceLastExposureThreshold;
}

- (void)setDaysSinceLastExposureThreshold:(NSInteger)daysSinceLastExposureThreshold
{
  self->_daysSinceLastExposureThreshold = daysSinceLastExposureThreshold;
}

- (double)minimumRiskScoreFullRange
{
  return self->_minimumRiskScoreFullRange;
}

- (void)setMinimumRiskScoreFullRange:(double)minimumRiskScoreFullRange
{
  self->_minimumRiskScoreFullRange = minimumRiskScoreFullRange;
}

- (NSArray)attenuationLevelValues
{
  return self->_attenuationLevelValues;
}

- (void)setAttenuationLevelValues:(NSArray *)attenuationLevelValues
{
  objc_setProperty_nonatomic_copy(self, a2, attenuationLevelValues, 168);
}

- (double)attenuationWeight
{
  return self->_attenuationWeight;
}

- (void)setAttenuationWeight:(double)attenuationWeight
{
  self->_attenuationWeight = attenuationWeight;
}

- (NSArray)daysSinceLastExposureLevelValues
{
  return self->_daysSinceLastExposureLevelValues;
}

- (void)setDaysSinceLastExposureLevelValues:(NSArray *)daysSinceLastExposureLevelValues
{
  objc_setProperty_nonatomic_copy(self, a2, daysSinceLastExposureLevelValues, 184);
}

- (double)daysSinceLastExposureWeight
{
  return self->_daysSinceLastExposureWeight;
}

- (void)setDaysSinceLastExposureWeight:(double)daysSinceLastExposureWeight
{
  self->_daysSinceLastExposureWeight = daysSinceLastExposureWeight;
}

- (NSArray)durationLevelValues
{
  return self->_durationLevelValues;
}

- (void)setDurationLevelValues:(NSArray *)durationLevelValues
{
  objc_setProperty_nonatomic_copy(self, a2, durationLevelValues, 200);
}

- (double)durationWeight
{
  return self->_durationWeight;
}

- (void)setDurationWeight:(double)durationWeight
{
  self->_durationWeight = durationWeight;
}

- (NSDictionary)metadata
{
  return self->_metadata;
}

- (void)setMetadata:(NSDictionary *)metadata
{
  objc_setProperty_nonatomic_copy(self, a2, metadata, 216);
}

- (ENRiskScore)minimumRiskScore
{
  return self->_minimumRiskScore;
}

- (void)setMinimumRiskScore:(ENRiskScore)minimumRiskScore
{
  self->_minimumRiskScore = minimumRiskScore;
}

- (NSArray)transmissionRiskLevelValues
{
  return self->_transmissionRiskLevelValues;
}

- (void)setTransmissionRiskLevelValues:(NSArray *)transmissionRiskLevelValues
{
  objc_setProperty_nonatomic_copy(self, a2, transmissionRiskLevelValues, 224);
}

- (double)transmissionRiskWeight
{
  return self->_transmissionRiskWeight;
}

- (void)setTransmissionRiskWeight:(double)transmissionRiskWeight
{
  self->_transmissionRiskWeight = transmissionRiskWeight;
}

- (unsigned)flags
{
  return self->_flags;
}

- (void)setFlags:(unsigned int)a3
{
  self->_flags = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_transmissionRiskLevelValues, 0);
  objc_storeStrong((id *)&self->_metadata, 0);
  objc_storeStrong((id *)&self->_durationLevelValues, 0);
  objc_storeStrong((id *)&self->_daysSinceLastExposureLevelValues, 0);
  objc_storeStrong((id *)&self->_attenuationLevelValues, 0);
  objc_storeStrong((id *)&self->_attenuationDurationThresholds, 0);
  objc_storeStrong((id *)&self->_infectiousnessForDaysSinceOnsetOfSymptoms, 0);
}

@end
