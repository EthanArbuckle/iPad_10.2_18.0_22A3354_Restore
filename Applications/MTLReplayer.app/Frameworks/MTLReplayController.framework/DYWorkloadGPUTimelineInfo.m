@implementation DYWorkloadGPUTimelineInfo

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  id v10;
  void *v11;
  id v12;

  v4 = objc_msgSend(objc_msgSend((id)objc_opt_class(self, a2), "allocWithZone:", a3), "init");
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[DYWorkloadGPUTimelineInfo mGPUTimelineInfos](self, "mGPUTimelineInfos"));
  v6 = objc_msgSend(v5, "copy");
  objc_msgSend(v4, "setMGPUTimelineInfos:", v6);

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[DYWorkloadGPUTimelineInfo aggregatedGPUTimelineInfo](self, "aggregatedGPUTimelineInfo"));
  v8 = objc_msgSend(v7, "copy");
  objc_msgSend(v4, "setAggregatedGPUTimelineInfo:", v8);

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[DYWorkloadGPUTimelineInfo perRingSampledDerivedCounters](self, "perRingSampledDerivedCounters"));
  v10 = objc_msgSend(v9, "copy");
  objc_msgSend(v4, "setPerRingSampledDerivedCounters:", v10);

  v11 = (void *)objc_claimAutoreleasedReturnValue(-[DYWorkloadGPUTimelineInfo coreCounts](self, "coreCounts"));
  v12 = objc_msgSend(v11, "copy");
  objc_msgSend(v4, "setCoreCounts:", v12);

  return v4;
}

- (DYWorkloadGPUTimelineInfo)initWithCoder:(id)a3
{
  id v4;
  DYWorkloadGPUTimelineInfo *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  NSSet *v11;
  void *v12;
  uint64_t v13;
  NSMutableArray *mGPUTimelineInfos;
  uint64_t v15;
  NSSet *v16;
  void *v17;
  uint64_t v18;
  DYGPUTimelineInfo *aggregatedGPUTimelineInfo;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  NSSet *v27;
  void *v28;
  uint64_t v29;
  NSArray *perRingSampledDerivedCounters;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  NSSet *v36;
  void *v37;
  uint64_t v38;
  NSArray *coreCounts;
  uint64_t v40;
  NSSet *v41;
  void *v42;
  uint64_t v43;
  DYGPUDerivedEncoderCounterInfo *derivedEncoderCounterInfo;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  NSSet *v50;
  void *v51;
  uint64_t v52;
  NSArray *restoreTimestamps;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  NSSet *v63;
  void *v64;
  uint64_t v65;
  NSDictionary *coalescedEncoderInfo;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  NSSet *v74;
  void *v75;
  uint64_t v76;
  NSMutableArray *counterGroups;
  DYWorkloadGPUTimelineInfo *v78;
  objc_super v80;

  v4 = a3;
  v80.receiver = self;
  v80.super_class = (Class)DYWorkloadGPUTimelineInfo;
  v5 = -[DYWorkloadGPUTimelineInfo init](&v80, "init");
  if (v5)
  {
    v5->_version = objc_msgSend(v4, "decodeIntForKey:", CFSTR("version"));
    v7 = objc_opt_class(NSMutableArray, v6);
    v9 = objc_opt_class(NSArray, v8);
    v11 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v7, v9, objc_opt_class(DYGPUTimelineInfo, v10), 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
    v13 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v12, CFSTR("mGPUTimelineInfos")));
    mGPUTimelineInfos = v5->_mGPUTimelineInfos;
    v5->_mGPUTimelineInfos = (NSMutableArray *)v13;

    v16 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", objc_opt_class(DYGPUTimelineInfo, v15), 0);
    v17 = (void *)objc_claimAutoreleasedReturnValue(v16);
    v18 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v17, CFSTR("aggregatedGPUTimelineInfo")));
    aggregatedGPUTimelineInfo = v5->_aggregatedGPUTimelineInfo;
    v5->_aggregatedGPUTimelineInfo = (DYGPUTimelineInfo *)v18;

    v21 = objc_opt_class(NSData, v20);
    v23 = objc_opt_class(NSMutableData, v22);
    v25 = objc_opt_class(NSArray, v24);
    v27 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v21, v23, v25, objc_opt_class(NSMutableArray, v26), 0);
    v28 = (void *)objc_claimAutoreleasedReturnValue(v27);
    v29 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v28, CFSTR("perRingSampledDerivedCounters")));
    perRingSampledDerivedCounters = v5->_perRingSampledDerivedCounters;
    v5->_perRingSampledDerivedCounters = (NSArray *)v29;

    v32 = objc_opt_class(NSArray, v31);
    v34 = objc_opt_class(NSMutableArray, v33);
    v36 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v32, v34, objc_opt_class(NSNumber, v35), 0);
    v37 = (void *)objc_claimAutoreleasedReturnValue(v36);
    v38 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v37, CFSTR("coreCounts")));
    coreCounts = v5->_coreCounts;
    v5->_coreCounts = (NSArray *)v38;

    if (v5->_version < 2)
    {
      *(_QWORD *)&v5->_timeBaseNumerator = 0x30000007DLL;
    }
    else
    {
      v5->_timeBaseNumerator = objc_msgSend(v4, "decodeIntForKey:", CFSTR("timeBaseNumerator"));
      v5->_timeBaseDenominator = objc_msgSend(v4, "decodeIntForKey:", CFSTR("timeBaseDenominator"));
      v41 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", objc_opt_class(DYGPUDerivedEncoderCounterInfo, v40), 0);
      v42 = (void *)objc_claimAutoreleasedReturnValue(v41);
      v43 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v42, CFSTR("derivedEncoderCounterInfo")));
      derivedEncoderCounterInfo = v5->_derivedEncoderCounterInfo;
      v5->_derivedEncoderCounterInfo = (DYGPUDerivedEncoderCounterInfo *)v43;

      if (v5->_version >= 3)
      {
        v5->_profiledState = objc_msgSend(v4, "decodeIntForKey:", CFSTR("profiledState"));
        v5->_consistentStateAchieved = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("consistentStateAchieved"));
        if (v5->_version >= 4)
        {
          v46 = objc_opt_class(NSArray, v45);
          v48 = objc_opt_class(NSMutableArray, v47);
          v50 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v46, v48, objc_opt_class(NSNumber, v49), 0);
          v51 = (void *)objc_claimAutoreleasedReturnValue(v50);
          v52 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v51, CFSTR("restoreTimestamps")));
          restoreTimestamps = v5->_restoreTimestamps;
          v5->_restoreTimestamps = (NSArray *)v52;

          if (v5->_version >= 6)
          {
            v55 = objc_opt_class(NSArray, v54);
            v57 = objc_opt_class(NSMutableArray, v56);
            v59 = objc_opt_class(NSNumber, v58);
            v61 = objc_opt_class(NSMutableDictionary, v60);
            v63 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v55, v57, v59, v61, objc_opt_class(NSDictionary, v62), 0);
            v64 = (void *)objc_claimAutoreleasedReturnValue(v63);
            v65 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v64, CFSTR("coalescedEncoderInfo")));
            coalescedEncoderInfo = v5->_coalescedEncoderInfo;
            v5->_coalescedEncoderInfo = (NSDictionary *)v65;

            if (v5->_version >= 7)
            {
              v68 = objc_opt_class(DYTimelineCounterGroup, v67);
              v70 = objc_opt_class(NSArray, v69);
              v72 = objc_opt_class(NSMutableArray, v71);
              v74 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v68, v70, v72, objc_opt_class(NSNull, v73), 0);
              v75 = (void *)objc_claimAutoreleasedReturnValue(v74);
              v76 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v75, CFSTR("counterGroups")));
              counterGroups = v5->_counterGroups;
              v5->_counterGroups = (NSMutableArray *)v76;

            }
          }
        }
      }
    }
    v78 = v5;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  self->_version = 8;
  v5 = v4;
  objc_msgSend(v4, "encodeInt:forKey:", 8, CFSTR("version"));
  objc_msgSend(v5, "encodeInt:forKey:", self->_timeBaseNumerator, CFSTR("timeBaseNumerator"));
  objc_msgSend(v5, "encodeInt:forKey:", self->_timeBaseDenominator, CFSTR("timeBaseDenominator"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_mGPUTimelineInfos, CFSTR("mGPUTimelineInfos"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_aggregatedGPUTimelineInfo, CFSTR("aggregatedGPUTimelineInfo"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_perRingSampledDerivedCounters, CFSTR("perRingSampledDerivedCounters"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_coreCounts, CFSTR("coreCounts"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_derivedEncoderCounterInfo, CFSTR("derivedEncoderCounterInfo"));
  objc_msgSend(v5, "encodeInt:forKey:", self->_profiledState, CFSTR("profiledState"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_consistentStateAchieved, CFSTR("consistentStateAchieved"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_restoreTimestamps, CFSTR("restoreTimestamps"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_coalescedEncoderInfo, CFSTR("coalescedEncoderInfo"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_counterGroups, CFSTR("counterGroups"));

}

- (DYWorkloadGPUTimelineInfo)init
{
  DYWorkloadGPUTimelineInfo *v2;
  DYWorkloadGPUTimelineInfo *v3;
  uint64_t v4;
  NSMutableArray *mGPUTimelineInfos;
  uint64_t v6;
  NSMutableArray *counterGroups;
  uint64_t v8;
  uint64_t v9;
  DYGPUTimelineInfo *aggregatedGPUTimelineInfo;
  DYWorkloadGPUTimelineInfo *v11;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)DYWorkloadGPUTimelineInfo;
  v2 = -[DYWorkloadGPUTimelineInfo init](&v13, "init");
  v3 = v2;
  if (v2)
  {
    v2->_version = 8;
    v4 = objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", 16));
    mGPUTimelineInfos = v3->_mGPUTimelineInfos;
    v3->_mGPUTimelineInfos = (NSMutableArray *)v4;

    v6 = objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", 2));
    counterGroups = v3->_counterGroups;
    v3->_counterGroups = (NSMutableArray *)v6;

    v9 = objc_opt_new(DYGPUTimelineInfo, v8);
    aggregatedGPUTimelineInfo = v3->_aggregatedGPUTimelineInfo;
    v3->_aggregatedGPUTimelineInfo = (DYGPUTimelineInfo *)v9;

    v11 = v3;
  }

  return v3;
}

- (id)mGPUTimelineInfoAtIndex:(unint64_t)a3
{
  uint64_t v5;
  NSMutableArray *mGPUTimelineInfos;
  void *v7;

  while ((unint64_t)-[NSMutableArray count](self->_mGPUTimelineInfos, "count") <= a3)
  {
    mGPUTimelineInfos = self->_mGPUTimelineInfos;
    v7 = (void *)objc_opt_new(DYGPUTimelineInfo, v5);
    -[NSMutableArray addObject:](mGPUTimelineInfos, "addObject:", v7);

  }
  return -[NSMutableArray objectAtIndexedSubscript:](self->_mGPUTimelineInfos, "objectAtIndexedSubscript:", a3);
}

- (id)createCounterGroup
{
  void *v3;

  v3 = (void *)objc_opt_new(DYTimelineCounterGroup, a2);
  -[NSMutableArray addObject:](self->_counterGroups, "addObject:", v3);
  return v3;
}

- (void)enumerateEncoderDerivedData:(id)a3
{
  -[DYGPUDerivedEncoderCounterInfo _enumerateEncoderDerivedData:](self->_derivedEncoderCounterInfo, "_enumerateEncoderDerivedData:", a3);
}

- (void)enumerateEncoderDerivedDataAtIndex:(unsigned int)a3 withBlock:(id)a4
{
  -[DYGPUDerivedEncoderCounterInfo _enumerateEncoderDerivedDataAtIndex:withBlock:](self->_derivedEncoderCounterInfo, "_enumerateEncoderDerivedDataAtIndex:withBlock:", *(_QWORD *)&a3, a4);
}

- (unint64_t)metalFXCallDuration:(unint64_t)a3
{
  void *v5;
  id v6;
  uint64_t *v7;
  void *v8;
  unint64_t v9;
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[DYGPUTimelineInfo metalFXTimelineInfo](self->_aggregatedGPUTimelineInfo, "metalFXTimelineInfo"));

  if (!v5)
    return 0;
  v6 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(-[DYGPUTimelineInfo metalFXTimelineInfo](self->_aggregatedGPUTimelineInfo, "metalFXTimelineInfo")));
  v7 = (uint64_t *)objc_msgSend(v6, "bytes");

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[DYGPUTimelineInfo metalFXTimelineInfo](self->_aggregatedGPUTimelineInfo, "metalFXTimelineInfo"));
  v9 = (unint64_t)objc_msgSend(v8, "length");

  if (v9 < 0x10)
    return 0;
  v10 = 0;
  v11 = v7;
  while (1)
  {
    v12 = *v11;
    v11 += 2;
    if (v12 == a3)
      break;
    if (v9 >> 4 == ++v10)
      return 0;
  }
  return (unint64_t)*(double *)&v7[2 * v10 + 1];
}

- (BOOL)isMio
{
  return 0;
}

- (unsigned)version
{
  return self->_version;
}

- (void)setVersion:(unsigned int)a3
{
  self->_version = a3;
}

- (unsigned)timeBaseNumerator
{
  return self->_timeBaseNumerator;
}

- (void)setTimeBaseNumerator:(unsigned int)a3
{
  self->_timeBaseNumerator = a3;
}

- (unsigned)timeBaseDenominator
{
  return self->_timeBaseDenominator;
}

- (void)setTimeBaseDenominator:(unsigned int)a3
{
  self->_timeBaseDenominator = a3;
}

- (NSMutableArray)mGPUTimelineInfos
{
  return self->_mGPUTimelineInfos;
}

- (void)setMGPUTimelineInfos:(id)a3
{
  objc_storeStrong((id *)&self->_mGPUTimelineInfos, a3);
}

- (DYGPUTimelineInfo)aggregatedGPUTimelineInfo
{
  return self->_aggregatedGPUTimelineInfo;
}

- (void)setAggregatedGPUTimelineInfo:(id)a3
{
  objc_storeStrong((id *)&self->_aggregatedGPUTimelineInfo, a3);
}

- (NSArray)perRingSampledDerivedCounters
{
  return self->_perRingSampledDerivedCounters;
}

- (void)setPerRingSampledDerivedCounters:(id)a3
{
  objc_storeStrong((id *)&self->_perRingSampledDerivedCounters, a3);
}

- (NSArray)coreCounts
{
  return self->_coreCounts;
}

- (void)setCoreCounts:(id)a3
{
  objc_storeStrong((id *)&self->_coreCounts, a3);
}

- (DYGPUDerivedEncoderCounterInfo)derivedEncoderCounterInfo
{
  return self->_derivedEncoderCounterInfo;
}

- (void)setDerivedEncoderCounterInfo:(id)a3
{
  objc_storeStrong((id *)&self->_derivedEncoderCounterInfo, a3);
}

- (unsigned)profiledState
{
  return self->_profiledState;
}

- (void)setProfiledState:(unsigned int)a3
{
  self->_profiledState = a3;
}

- (BOOL)consistentStateAchieved
{
  return self->_consistentStateAchieved;
}

- (void)setConsistentStateAchieved:(BOOL)a3
{
  self->_consistentStateAchieved = a3;
}

- (NSArray)restoreTimestamps
{
  return self->_restoreTimestamps;
}

- (void)setRestoreTimestamps:(id)a3
{
  objc_storeStrong((id *)&self->_restoreTimestamps, a3);
}

- (NSDictionary)coalescedEncoderInfo
{
  return self->_coalescedEncoderInfo;
}

- (void)setCoalescedEncoderInfo:(id)a3
{
  objc_storeStrong((id *)&self->_coalescedEncoderInfo, a3);
}

- (NSMutableArray)counterGroups
{
  return self->_counterGroups;
}

- (void)setCounterGroups:(id)a3
{
  objc_storeStrong((id *)&self->_counterGroups, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_counterGroups, 0);
  objc_storeStrong((id *)&self->_coalescedEncoderInfo, 0);
  objc_storeStrong((id *)&self->_restoreTimestamps, 0);
  objc_storeStrong((id *)&self->_derivedEncoderCounterInfo, 0);
  objc_storeStrong((id *)&self->_coreCounts, 0);
  objc_storeStrong((id *)&self->_perRingSampledDerivedCounters, 0);
  objc_storeStrong((id *)&self->_aggregatedGPUTimelineInfo, 0);
  objc_storeStrong((id *)&self->_mGPUTimelineInfos, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
