@implementation GEORequestCounterInfo

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (GEORequestCounterInfo)initWithDictionary:(id)a3
{
  id v4;
  GEORequestCounterInfo *v5;
  uint64_t v6;
  NSDictionary *requestTypeStatistics;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)GEORequestCounterInfo;
  v5 = -[GEORequestCounterInfo init](&v9, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    requestTypeStatistics = v5->_requestTypeStatistics;
    v5->_requestTypeStatistics = (NSDictionary *)v6;

    -[GEORequestCounterInfo _generateAggregateStatistics](v5, "_generateAggregateStatistics");
  }

  return v5;
}

- (GEORequestCounterInfo)initWithCoder:(id)a3
{
  id v4;
  GEORequestCounterInfo *v5;
  uint64_t v6;
  uint64_t v7;
  NSDictionary *requestTypeStatistics;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)GEORequestCounterInfo;
  v5 = -[GEORequestCounterInfo init](&v10, sel_init);
  if (v5)
  {
    v6 = objc_opt_class();
    objc_msgSend(v4, "decodeDictionaryWithKeysOfClass:objectsOfClass:forKey:", v6, objc_opt_class(), CFSTR("dict"));
    v7 = objc_claimAutoreleasedReturnValue();
    requestTypeStatistics = v5->_requestTypeStatistics;
    v5->_requestTypeStatistics = (NSDictionary *)v7;

    -[GEORequestCounterInfo _generateAggregateStatistics](v5, "_generateAggregateStatistics");
  }

  return v5;
}

- (void)_generateAggregateStatistics
{
  NSDictionary *requestTypeStatistics;
  _QWORD v3[5];

  requestTypeStatistics = self->_requestTypeStatistics;
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __53__GEORequestCounterInfo__generateAggregateStatistics__block_invoke;
  v3[3] = &unk_1E1C02120;
  v3[4] = self;
  -[NSDictionary enumerateKeysAndObjectsUsingBlock:](requestTypeStatistics, "enumerateKeysAndObjectsUsingBlock:", v3);
}

void __53__GEORequestCounterInfo__generateAggregateStatistics__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  uint64_t v5;

  v4 = a3;
  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 16) += objc_msgSend(v4, "bytesTransmitted");
  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 24) += objc_msgSend(v4, "bytesReceived");
  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 32) += objc_msgSend(v4, "durationUSecondsTotal");
  *(_DWORD *)(*(_QWORD *)(a1 + 32) + 40) += objc_msgSend(v4, "durationCount");
  v5 = objc_msgSend(v4, "usedInterfaces");

  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 48) |= v5;
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  char v5;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v5 = -[NSDictionary isEqual:](self->_requestTypeStatistics, "isEqual:", v4[1]);
  else
    v5 = 0;

  return v5;
}

- (unint64_t)xmitBytes
{
  return self->_bytesTransmitted;
}

- (unint64_t)xmitBytesForType:(id)a3
{
  NSDictionary *requestTypeStatistics;
  void *v4;
  void *v5;
  unint64_t v6;

  requestTypeStatistics = self->_requestTypeStatistics;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", (a3.var1.var0 | a3.var0));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSDictionary objectForKeyedSubscript:](requestTypeStatistics, "objectForKeyedSubscript:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = objc_msgSend(v5, "bytesTransmitted");
  return v6;
}

- (unint64_t)recvBytes
{
  return self->_bytesReceived;
}

- (unint64_t)recvBytesForType:(id)a3
{
  NSDictionary *requestTypeStatistics;
  void *v4;
  void *v5;
  unint64_t v6;

  requestTypeStatistics = self->_requestTypeStatistics;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", (a3.var1.var0 | a3.var0));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSDictionary objectForKeyedSubscript:](requestTypeStatistics, "objectForKeyedSubscript:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = objc_msgSend(v5, "bytesReceived");
  return v6;
}

- (double)durationTotal
{
  return (double)self->_durationUSeconds / 1000000.0;
}

- (double)durationTotalForType:(id)a3
{
  NSDictionary *requestTypeStatistics;
  void *v4;
  void *v5;
  double v6;

  requestTypeStatistics = self->_requestTypeStatistics;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", (a3.var1.var0 | a3.var0));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSDictionary objectForKeyedSubscript:](requestTypeStatistics, "objectForKeyedSubscript:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = (double)objc_msgSend(v5, "durationUSecondsTotal") / 1000000.0;
  return v6;
}

- (double)durationAverage
{
  return (double)self->_durationUSeconds / (double)self->_durationCount / 1000000.0;
}

- (double)durationAverageForType:(id)a3
{
  NSDictionary *requestTypeStatistics;
  void *v4;
  void *v5;
  double v6;
  double v7;

  requestTypeStatistics = self->_requestTypeStatistics;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", (a3.var1.var0 | a3.var0));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSDictionary objectForKeyedSubscript:](requestTypeStatistics, "objectForKeyedSubscript:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = (double)objc_msgSend(v5, "durationUSecondsTotal");
  v7 = v6 / (double)(int)objc_msgSend(v5, "durationCount") / 1000000.0;

  return v7;
}

- (unint64_t)usedInterfaces
{
  return self->_usedInterfaces;
}

- (unint64_t)usedInterfacesForType:(id)a3
{
  NSDictionary *requestTypeStatistics;
  void *v4;
  void *v5;
  unint64_t v6;

  requestTypeStatistics = self->_requestTypeStatistics;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", (a3.var1.var0 | a3.var0));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSDictionary objectForKeyedSubscript:](requestTypeStatistics, "objectForKeyedSubscript:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = objc_msgSend(v5, "usedInterfaces");
  return v6;
}

- (NSArray)requestTypes
{
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithBlock:", &__block_literal_global_184);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSDictionary allKeys](self->_requestTypeStatistics, "allKeys");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "filteredArrayUsingPredicate:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v5;
}

uint64_t __37__GEORequestCounterInfo_requestTypes__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  char isKindOfClass;

  v2 = a2;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

- (void)enumerateRequestTypes:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v7[4];
  id v8;

  v4 = a3;
  -[GEORequestCounterInfo requestTypes](self, "requestTypes");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __47__GEORequestCounterInfo_enumerateRequestTypes___block_invoke;
  v7[3] = &unk_1E1C02168;
  v8 = v4;
  v6 = v4;
  objc_msgSend(v5, "enumerateObjectsUsingBlock:", v7);

}

uint64_t __47__GEORequestCounterInfo_enumerateRequestTypes___block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v5;
  unsigned int v6;
  uint64_t v7;
  unsigned int v8;
  int v9;
  unsigned int v10;
  unint64_t v11;
  unint64_t v12;

  v5 = *(_QWORD *)(a1 + 32);
  v6 = objc_msgSend(a2, "intValue");
  LODWORD(v7) = v6 & 0x7F00;
  v8 = (v6 >> 8) & 0x7F;
  v9 = 1 << (BYTE1(v6) & 0x7F);
  if ((v9 & 0xC05) != 0)
    v10 = v6;
  else
    v10 = 0;
  if ((v9 & 0xAA) != 0)
  {
    v11 = (unint64_t)v6 << 32;
  }
  else
  {
    LODWORD(v7) = v10;
    v11 = 0;
  }
  if (v8 <= 0xB)
    v7 = v7;
  else
    v7 = 0;
  if (v8 <= 0xB)
    v12 = v11;
  else
    v12 = 0;
  return (*(uint64_t (**)(uint64_t, unint64_t, uint64_t))(v5 + 16))(v5, v12 | v7, a4);
}

- (unint64_t)numberOfRequestsForType:(id)a3 result:(unsigned __int8)a4
{
  uint64_t v4;
  NSDictionary *requestTypeStatistics;
  void *v6;
  void *v7;
  unint64_t v8;

  v4 = a4;
  requestTypeStatistics = self->_requestTypeStatistics;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", (a3.var1.var0 | a3.var0));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSDictionary objectForKeyedSubscript:](requestTypeStatistics, "objectForKeyedSubscript:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = objc_msgSend(v7, "countForResult:", v4);
  return v8;
}

- (id)nonZeroResultTypesForType:(id)a3
{
  void *v5;
  unsigned __int8 v6;
  unsigned int v7;
  void *v8;
  void *v9;

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = 0;
  do
  {
    v7 = v6;
    if (-[GEORequestCounterInfo numberOfRequestsForType:result:](self, "numberOfRequestsForType:result:", a3, v6))
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedChar:", v6);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "addObject:", v8);

    }
    ++v6;
  }
  while (v7 < 4);
  v9 = (void *)objc_msgSend(v5, "copy");

  return v9;
}

- (void)encodeWithCoder:(id)a3
{
  objc_msgSend(a3, "encodeObject:forKey:", self->_requestTypeStatistics, CFSTR("dict"));
}

- (NSDictionary)dictionaryRepresentation
{
  void *v3;
  unint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  unsigned int v18;
  unint64_t v19;
  unsigned int v20;
  unsigned int v21;
  int v22;
  uint64_t v23;
  void *v24;
  unint64_t v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  uint64_t v31;
  void *v32;
  uint64_t v33;
  void *v34;
  unsigned __int8 v35;
  const __CFString *v36;
  unsigned int v37;
  void *v38;
  NSDictionary *obj;
  uint64_t v41;
  id v42;
  uint64_t v43;
  void *v44;
  uint64_t v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  _QWORD v50[5];
  _QWORD v51[5];
  _BYTE v52[128];
  _QWORD v53[5];
  _QWORD v54[7];

  v54[5] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v53[0] = CFSTR("xmit");
  v4 = 0x1E0CB3000uLL;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[GEORequestCounterInfo xmitBytes](self, "xmitBytes"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v54[0] = v5;
  v53[1] = CFSTR("recv");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[GEORequestCounterInfo recvBytes](self, "recvBytes"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v54[1] = v6;
  v53[2] = CFSTR("durationTotal");
  v7 = (void *)MEMORY[0x1E0CB37E8];
  -[GEORequestCounterInfo durationTotal](self, "durationTotal");
  objc_msgSend(v7, "numberWithDouble:");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v54[2] = v8;
  v53[3] = CFSTR("durationAverage");
  v9 = (void *)MEMORY[0x1E0CB37E8];
  -[GEORequestCounterInfo durationAverage](self, "durationAverage");
  objc_msgSend(v9, "numberWithDouble:");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v54[3] = v10;
  v53[4] = CFSTR("usedInterfaces");
  GEORequestCounterInterfaceTypesToStrings(-[GEORequestCounterInfo usedInterfaces](self, "usedInterfaces"));
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = (void *)v11;
  v13 = MEMORY[0x1E0C9AA60];
  if (v11)
    v13 = v11;
  v54[4] = v13;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v54, v53, 5);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v42 = v3;
  objc_msgSend(v3, "addEntriesFromDictionary:", v14);

  v48 = 0u;
  v49 = 0u;
  v46 = 0u;
  v47 = 0u;
  obj = self->_requestTypeStatistics;
  v43 = -[NSDictionary countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v46, v52, 16);
  if (v43)
  {
    v41 = *(_QWORD *)v47;
    do
    {
      v15 = 0;
      do
      {
        if (*(_QWORD *)v47 != v41)
          objc_enumerationMutation(obj);
        v16 = *(void **)(*((_QWORD *)&v46 + 1) + 8 * v15);
        objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = objc_msgSend(v16, "intValue");
        v19 = 0;
        v20 = 0;
        v21 = (v18 >> 8) & 0x7F;
        v45 = v15;
        if (v21 <= 0xB)
        {
          v22 = 1 << v21;
          if ((v22 & 0xAA) != 0)
          {
            v20 = v18 & 0x7F00;
            v19 = (unint64_t)v18 << 32;
          }
          else if ((v22 & 0xC05) != 0)
          {
            v19 = 0;
            v20 = v18;
          }
        }
        v23 = v19 | v20;
        GEODataRequestKindAsString(v23);
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        v50[0] = CFSTR("xmit");
        objc_msgSend(*(id *)(v4 + 2024), "numberWithUnsignedInteger:", -[GEORequestCounterInfo xmitBytesForType:](self, "xmitBytesForType:", v23));
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        v51[0] = v24;
        v50[1] = CFSTR("recv");
        v25 = v4;
        objc_msgSend(*(id *)(v4 + 2024), "numberWithUnsignedInteger:", -[GEORequestCounterInfo recvBytesForType:](self, "recvBytesForType:", v23));
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        v51[1] = v26;
        v50[2] = CFSTR("durationTotal");
        v27 = *(void **)(v25 + 2024);
        -[GEORequestCounterInfo durationTotalForType:](self, "durationTotalForType:", v23);
        objc_msgSend(v27, "numberWithDouble:");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        v51[2] = v28;
        v50[3] = CFSTR("durationAverage");
        v29 = *(void **)(v25 + 2024);
        -[GEORequestCounterInfo durationAverageForType:](self, "durationAverageForType:", v23);
        objc_msgSend(v29, "numberWithDouble:");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        v51[3] = v30;
        v50[4] = CFSTR("usedInterfaces");
        GEORequestCounterInterfaceTypesToStrings(-[GEORequestCounterInfo usedInterfacesForType:](self, "usedInterfacesForType:", v23));
        v31 = objc_claimAutoreleasedReturnValue();
        v32 = (void *)v31;
        v33 = MEMORY[0x1E0C9AA60];
        if (v31)
          v33 = v31;
        v51[4] = v33;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v51, v50, 5);
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "addEntriesFromDictionary:", v34);

        v4 = v25;
        v35 = 0;
        do
        {
          v36 = CFSTR("Success");
          if ((v35 - 1) <= 3u)
            v36 = off_1E1C02218[(char)v35 - 1];
          v37 = v35;
          objc_msgSend(*(id *)(v25 + 2024), "numberWithUnsignedInteger:", -[GEORequestCounterInfo numberOfRequestsForType:result:](self, "numberOfRequestsForType:result:", v23, v35));
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "setObject:forKeyedSubscript:", v38, v36);

          ++v35;
        }
        while (v37 < 4);
        objc_msgSend(v42, "setObject:forKeyedSubscript:", v17, v44);

        v15 = v45 + 1;
      }
      while (v45 + 1 != v43);
      v43 = -[NSDictionary countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v46, v52, 16);
    }
    while (v43);
  }

  return (NSDictionary *)v42;
}

- (void)_appendFormattedStringTo:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  id v15;
  id v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  id v25;
  id v26;
  id v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  void *v34;
  id v35;
  id v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  void *v43;
  void *v44;
  void *v45;
  uint64_t v46;
  unsigned int v47;
  unint64_t v48;
  unsigned int v49;
  unsigned int v50;
  int v51;
  uint64_t v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  uint64_t v59;
  void *v60;
  void *v61;
  uint64_t v62;
  void *v63;
  id v64;
  id v65;
  id v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  void *v73;
  id v74;
  id v75;
  id v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  void *v83;
  id v84;
  id v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
  void *v92;
  unsigned __int8 v93;
  unsigned int v94;
  uint64_t v95;
  __CFString *v96;
  void *v97;
  id v98;
  uint64_t v99;
  uint64_t v100;
  uint64_t v101;
  uint64_t v102;
  uint64_t v103;
  uint64_t v104;
  void *v105;
  id obj;
  uint64_t v107;
  void *v108;
  uint64_t v109;
  void *v110;
  void *v111;
  void *v112;
  void *v113;
  void *v114;
  void *v115;
  void *v116;
  void *v117;
  void *v118;
  uint64_t v119;
  void *v120;
  GEORequestCounterInfo *v121;
  __int128 v122;
  __int128 v123;
  __int128 v124;
  __int128 v125;
  _BYTE v126[128];
  uint64_t v127;

  v127 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  _byteFormatter();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringFromByteCount:", -[GEORequestCounterInfo xmitBytes](self, "xmitBytes"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  _byteFormatter();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "stringFromByteCount:", -[GEORequestCounterInfo recvBytes](self, "recvBytes"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = (void *)MEMORY[0x1E0CB3940];
  -[GEORequestCounterInfo durationTotal](self, "durationTotal");
  objc_msgSend(v9, "stringWithFormat:", CFSTR("%.03fs"), v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)MEMORY[0x1E0CB3940];
  -[GEORequestCounterInfo durationAverage](self, "durationAverage");
  objc_msgSend(v12, "stringWithFormat:", CFSTR("%.03fs"), v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  GEORequestCounterInterfaceTypesToStrings(-[GEORequestCounterInfo usedInterfaces](self, "usedInterfaces"));
  v120 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v120, "componentsJoinedByString:", CFSTR(", "));
  v118 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = v11;
  v16 = v6;
  v17 = v4;
  objc_msgSend(v17, "appendString:", CFSTR("  "));
  objc_msgSend(v17, "appendString:", CFSTR("Xmit: "));
  objc_msgSend(v17, "appendString:", v16);
  v18 = objc_msgSend(CFSTR("  "), "length");
  v19 = objc_msgSend(CFSTR("Xmit: "), "length") + v18;
  v20 = objc_msgSend(v16, "length");

  v21 = v19 + v20 + objc_msgSend(CFSTR(" Total: "), "length");
  v22 = objc_msgSend(v15, "length");
  if ((unint64_t)(v21 + v22) <= 0x3C)
    v23 = 60 - (v21 + v22);
  else
    v23 = 0;
  objc_msgSend(&stru_1E1C241D0, "stringByPaddingToLength:withString:startingAtIndex:", v23, CFSTR(" "), 0);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "appendString:", v24);

  objc_msgSend(v17, "appendString:", CFSTR(" Total: "));
  objc_msgSend(v17, "appendString:", v15);

  objc_msgSend(v17, "appendString:", CFSTR("\n"));
  v25 = v14;
  v26 = v8;
  v27 = v17;
  objc_msgSend(v27, "appendString:", CFSTR("  "));
  objc_msgSend(v27, "appendString:", CFSTR("Recv: "));
  objc_msgSend(v27, "appendString:", v26);
  v28 = objc_msgSend(CFSTR("  "), "length");
  v29 = objc_msgSend(CFSTR("Recv: "), "length") + v28;
  v30 = objc_msgSend(v26, "length");

  v31 = v29 + v30 + objc_msgSend(CFSTR(" Average: "), "length");
  v32 = objc_msgSend(v25, "length");
  if ((unint64_t)(v31 + v32) <= 0x3C)
    v33 = 60 - (v31 + v32);
  else
    v33 = 0;
  objc_msgSend(&stru_1E1C241D0, "stringByPaddingToLength:withString:startingAtIndex:", v33, CFSTR(" "), 0);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "appendString:", v34);

  objc_msgSend(v27, "appendString:", CFSTR(" Average: "));
  objc_msgSend(v27, "appendString:", v25);

  objc_msgSend(v27, "appendString:", CFSTR("\n"));
  v35 = v118;
  v36 = v27;
  objc_msgSend(v36, "appendString:", CFSTR("  "));
  objc_msgSend(v36, "appendString:", CFSTR("Used Interfaces: "));
  objc_msgSend(v36, "appendString:", &stru_1E1C241D0);
  v37 = objc_msgSend(CFSTR("  "), "length");
  v38 = objc_msgSend(CFSTR("Used Interfaces: "), "length") + v37;
  v39 = objc_msgSend(&stru_1E1C241D0, "length");
  v40 = v38 + v39 + objc_msgSend(&stru_1E1C241D0, "length");
  v41 = objc_msgSend(v35, "length");
  if ((unint64_t)(v40 + v41) <= 0x3C)
    v42 = 60 - (v40 + v41);
  else
    v42 = 0;
  objc_msgSend(&stru_1E1C241D0, "stringByPaddingToLength:withString:startingAtIndex:", v42, CFSTR(" "), 0);
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "appendString:", v43);

  objc_msgSend(v36, "appendString:", &stru_1E1C241D0);
  objc_msgSend(v36, "appendString:", v35);

  objc_msgSend(v36, "appendString:", CFSTR("\n"));
  v108 = v36;

  v121 = self;
  -[NSDictionary allKeys](self->_requestTypeStatistics, "allKeys");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v44, "sortedArrayUsingSelector:", sel_compare_);
  v45 = (void *)objc_claimAutoreleasedReturnValue();

  v124 = 0u;
  v125 = 0u;
  v122 = 0u;
  v123 = 0u;
  obj = v45;
  v109 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v122, v126, 16);
  if (v109)
  {
    v107 = *(_QWORD *)v123;
    do
    {
      v46 = 0;
      do
      {
        if (*(_QWORD *)v123 != v107)
          objc_enumerationMutation(obj);
        v47 = objc_msgSend(*(id *)(*((_QWORD *)&v122 + 1) + 8 * v46), "intValue");
        v48 = 0;
        v49 = 0;
        v50 = (v47 >> 8) & 0x7F;
        v119 = v46;
        if (v50 <= 0xB)
        {
          v51 = 1 << v50;
          if ((v51 & 0xAA) != 0)
          {
            v49 = v47 & 0x7F00;
            v48 = (unint64_t)v47 << 32;
          }
          else if ((v51 & 0xC05) != 0)
          {
            v48 = 0;
            v49 = v47;
          }
        }
        v52 = v48 | v49;
        GEODataRequestKindAsString(v52);
        v53 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v108, "appendString:", CFSTR("\n"));
        objc_msgSend(v108, "appendString:", CFSTR("  "));
        objc_msgSend(v108, "appendString:", v53);
        objc_msgSend(v108, "appendString:", CFSTR("\n"));
        objc_msgSend(v108, "appendString:", CFSTR("  "));
        v117 = v53;
        objc_msgSend(&stru_1E1C241D0, "stringByPaddingToLength:withString:startingAtIndex:", objc_msgSend(v53, "length") + 1, CFSTR("-"), 0);
        v54 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v108, "appendString:", v54);

        objc_msgSend(v108, "appendString:", CFSTR("\n"));
        _byteFormatter();
        v55 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v55, "stringFromByteCount:", -[GEORequestCounterInfo xmitBytesForType:](v121, "xmitBytesForType:", v52));
        v56 = (void *)objc_claimAutoreleasedReturnValue();

        _byteFormatter();
        v57 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v57, "stringFromByteCount:", -[GEORequestCounterInfo recvBytesForType:](v121, "recvBytesForType:", v52));
        v113 = (void *)objc_claimAutoreleasedReturnValue();

        v58 = (void *)MEMORY[0x1E0CB3940];
        -[GEORequestCounterInfo durationTotalForType:](v121, "durationTotalForType:", v52);
        objc_msgSend(v58, "stringWithFormat:", CFSTR("%.03fs"), v59);
        v60 = (void *)objc_claimAutoreleasedReturnValue();
        v61 = (void *)MEMORY[0x1E0CB3940];
        -[GEORequestCounterInfo durationAverageForType:](v121, "durationAverageForType:", v52);
        objc_msgSend(v61, "stringWithFormat:", CFSTR("%.03fs"), v62);
        v63 = (void *)objc_claimAutoreleasedReturnValue();
        GEORequestCounterInterfaceTypesToStrings(-[GEORequestCounterInfo usedInterfacesForType:](v121, "usedInterfacesForType:", v52));
        v116 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v116, "componentsJoinedByString:", CFSTR(", "));
        v110 = (void *)objc_claimAutoreleasedReturnValue();
        v64 = v60;
        v65 = v56;
        v66 = v108;
        objc_msgSend(v66, "appendString:", CFSTR("  "));
        objc_msgSend(v66, "appendString:", CFSTR("Xmit: "));
        objc_msgSend(v66, "appendString:", v65);
        v67 = objc_msgSend(CFSTR("  "), "length");
        v68 = objc_msgSend(CFSTR("Xmit: "), "length") + v67;
        v69 = objc_msgSend(v65, "length");

        v70 = v68 + objc_msgSend(CFSTR(" Total: "), "length") + v69;
        v71 = objc_msgSend(v64, "length");
        if ((unint64_t)(v70 + v71) <= 0x3C)
          v72 = 60 - (v70 + v71);
        else
          v72 = 0;
        objc_msgSend(&stru_1E1C241D0, "stringByPaddingToLength:withString:startingAtIndex:", v72, CFSTR(" "), 0);
        v73 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v66, "appendString:", v73);

        objc_msgSend(v66, "appendString:", CFSTR(" Total: "));
        objc_msgSend(v66, "appendString:", v64);
        v115 = v64;

        objc_msgSend(v66, "appendString:", CFSTR("\n"));
        v74 = v63;
        v75 = v113;
        v76 = v66;
        objc_msgSend(v76, "appendString:", CFSTR("  "));
        objc_msgSend(v76, "appendString:", CFSTR("Recv: "));
        objc_msgSend(v76, "appendString:", v75);
        v77 = objc_msgSend(CFSTR("  "), "length");
        v78 = objc_msgSend(CFSTR("Recv: "), "length") + v77;
        v79 = objc_msgSend(v75, "length");
        v114 = v75;

        v80 = v78 + objc_msgSend(CFSTR(" Average: "), "length") + v79;
        v81 = objc_msgSend(v74, "length");
        if ((unint64_t)(v80 + v81) <= 0x3C)
          v82 = 60 - (v80 + v81);
        else
          v82 = 0;
        objc_msgSend(&stru_1E1C241D0, "stringByPaddingToLength:withString:startingAtIndex:", v82, CFSTR(" "), 0);
        v83 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v76, "appendString:", v83);

        objc_msgSend(v76, "appendString:", CFSTR(" Average: "));
        objc_msgSend(v76, "appendString:", v74);
        v112 = v74;

        objc_msgSend(v76, "appendString:", CFSTR("\n"));
        v84 = v110;
        v85 = v76;
        objc_msgSend(v85, "appendString:", CFSTR("  "));
        objc_msgSend(v85, "appendString:", CFSTR("Used Interfaces: "));
        objc_msgSend(v85, "appendString:", &stru_1E1C241D0);
        v86 = objc_msgSend(CFSTR("  "), "length");
        v87 = objc_msgSend(CFSTR("Used Interfaces: "), "length") + v86;
        v88 = objc_msgSend(&stru_1E1C241D0, "length");
        v89 = v87 + v88 + objc_msgSend(&stru_1E1C241D0, "length");
        v90 = objc_msgSend(v84, "length");
        if ((unint64_t)(v89 + v90) <= 0x3C)
          v91 = 60 - (v89 + v90);
        else
          v91 = 0;
        objc_msgSend(&stru_1E1C241D0, "stringByPaddingToLength:withString:startingAtIndex:", v91, CFSTR(" "), 0);
        v92 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v85, "appendString:", v92);

        objc_msgSend(v85, "appendString:", &stru_1E1C241D0);
        objc_msgSend(v85, "appendString:", v84);
        v111 = v84;

        objc_msgSend(v85, "appendString:", CFSTR("\n"));
        v93 = 0;
        do
        {
          v94 = v93;
          v95 = -[GEORequestCounterInfo numberOfRequestsForType:result:](v121, "numberOfRequestsForType:result:", v52, v93);
          if (v95)
          {
            v96 = CFSTR("Success");
            if ((v93 - 1) <= 3u)
              v96 = off_1E1C02218[(char)v93 - 1];
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%llu"), v95);
            v97 = (void *)objc_claimAutoreleasedReturnValue();
            v98 = v85;
            objc_msgSend(v98, "appendString:", CFSTR("    "));
            objc_msgSend(v98, "appendString:", CFSTR("- "));
            objc_msgSend(v98, "appendString:", v96);
            v99 = objc_msgSend(CFSTR("    "), "length");
            v100 = objc_msgSend(CFSTR("- "), "length") + v99;
            v101 = -[__CFString length](v96, "length");
            v102 = v100 + v101 + objc_msgSend(CFSTR(". "), "length");
            v103 = objc_msgSend(v97, "length");
            if ((unint64_t)(v102 + v103) <= 0x3C)
              v104 = 60 - (v102 + v103);
            else
              v104 = 0;
            objc_msgSend(&stru_1E1C241D0, "stringByPaddingToLength:withString:startingAtIndex:", v104, CFSTR("."), 0);
            v105 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v98, "appendString:", v105);

            objc_msgSend(v98, "appendString:", CFSTR(". "));
            objc_msgSend(v98, "appendString:", v97);
            objc_msgSend(v98, "appendString:", CFSTR("\n"));

          }
          ++v93;
        }
        while (v94 < 4);

        v46 = v119 + 1;
      }
      while (v119 + 1 != v109);
      v109 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v122, v126, 16);
    }
    while (v109);
  }

}

- (void)_appendFormattedCSVStringTo:(id)a3 forAppId:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  unsigned int v10;
  unint64_t v11;
  unsigned int v12;
  unsigned int v13;
  int v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  void *v24;
  int v25;
  unsigned int v26;
  unint64_t v27;
  uint64_t i;
  const __CFString *v29;
  id obj;
  uint64_t v31;
  id v32;
  uint64_t v33;
  void *v34;
  void *v35;
  void *v36;
  uint64_t v37;
  void *v38;
  void *v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  _QWORD v44[6];
  _BYTE v45[128];
  uint64_t v46;

  v46 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v32 = a4;
  -[NSDictionary allKeys](self->_requestTypeStatistics, "allKeys");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "sortedArrayUsingSelector:", sel_compare_);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v42 = 0u;
  v43 = 0u;
  v40 = 0u;
  v41 = 0u;
  obj = v8;
  v33 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v40, v45, 16);
  if (v33)
  {
    v31 = *(_QWORD *)v41;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v41 != v31)
          objc_enumerationMutation(obj);
        v10 = objc_msgSend(*(id *)(*((_QWORD *)&v40 + 1) + 8 * v9), "intValue");
        v11 = 0;
        v12 = 0;
        v13 = (v10 >> 8) & 0x7F;
        v37 = v9;
        if (v13 <= 0xB)
        {
          v14 = 1 << v13;
          if ((v14 & 0xAA) != 0)
          {
            v12 = v10 & 0x7F00;
            v11 = (unint64_t)v10 << 32;
          }
          else if ((v14 & 0xC05) != 0)
          {
            v11 = 0;
            v12 = v10;
          }
        }
        v15 = v11 | v12;
        GEODataRequestKindAsString(v15);
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%lld"), -[GEORequestCounterInfo xmitBytesForType:](self, "xmitBytesForType:", v15));
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%lld"), -[GEORequestCounterInfo recvBytesForType:](self, "recvBytesForType:", v15));
        v16 = objc_claimAutoreleasedReturnValue();
        v17 = (void *)MEMORY[0x1E0CB3940];
        -[GEORequestCounterInfo durationTotalForType:](self, "durationTotalForType:", v15);
        objc_msgSend(v17, "stringWithFormat:", CFSTR("%.06f"), v18);
        v19 = objc_claimAutoreleasedReturnValue();
        v20 = (void *)MEMORY[0x1E0CB3940];
        -[GEORequestCounterInfo durationAverageForType:](self, "durationAverageForType:", v15);
        objc_msgSend(v20, "stringWithFormat:", CFSTR("%.06f"), v21);
        v22 = objc_claimAutoreleasedReturnValue();
        v44[0] = v32;
        v44[1] = v39;
        v44[2] = v38;
        v44[3] = v16;
        v35 = (void *)v19;
        v36 = (void *)v16;
        v44[4] = v19;
        v44[5] = v22;
        v34 = (void *)v22;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v44, 6);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "componentsJoinedByString:", CFSTR(", "));
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "appendString:", v24);

        v25 = 0;
        do
        {
          v26 = v25;
          objc_msgSend(v6, "appendFormat:", CFSTR(", %llu"), -[GEORequestCounterInfo numberOfRequestsForType:result:](self, "numberOfRequestsForType:result:", v15, v25++));
        }
        while (v26 < 4);
        v27 = -[GEORequestCounterInfo usedInterfacesForType:](self, "usedInterfacesForType:", v15);
        for (i = 0; i != 6; ++i)
        {
          if ((GEOAllRequestCounterInterfaceTypes[i] & v27) != 0)
            v29 = CFSTR(", Y");
          else
            v29 = CFSTR(", N");
          objc_msgSend(v6, "appendString:", v29);
        }
        objc_msgSend(v6, "appendString:", CFSTR("\n"));

        v9 = v37 + 1;
      }
      while (v37 + 1 != v33);
      v33 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v40, v45, 16);
    }
    while (v33);
  }

}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  objc_super v7;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v7.receiver = self;
  v7.super_class = (Class)GEORequestCounterInfo;
  -[GEORequestCounterInfo description](&v7, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@: %@"), v4, self->_requestTypeStatistics);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_requestTypeStatistics, 0);
}

@end
