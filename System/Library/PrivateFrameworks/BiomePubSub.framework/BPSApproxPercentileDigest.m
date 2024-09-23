@implementation BPSApproxPercentileDigest

- (BPSApproxPercentileDigest)initWithCapacity:(unint64_t)a3
{
  return -[BPSApproxPercentileDigest initWithCapacity:bufferMultiplier:](self, "initWithCapacity:bufferMultiplier:", a3, 10);
}

- (BPSApproxPercentileDigest)initWithCapacity:(unint64_t)a3 bufferMultiplier:(unint64_t)a4
{
  BPSApproxPercentileDigest *v6;
  BPSApproxPercentileDigest *v7;
  uint64_t v8;
  NSMutableArray *mergedCentroids;
  uint64_t v10;
  NSMutableArray *unmergedCentroids;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)BPSApproxPercentileDigest;
  v6 = -[BPSApproxPercentileDigest init](&v13, sel_init);
  v7 = v6;
  if (v6)
  {
    v6->_maxCentroidCount = a3;
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", a3);
    v8 = objc_claimAutoreleasedReturnValue();
    mergedCentroids = v7->_mergedCentroids;
    v7->_mergedCentroids = (NSMutableArray *)v8;

    v7->_unmergedBufferSize = a4 * a3;
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:");
    v10 = objc_claimAutoreleasedReturnValue();
    unmergedCentroids = v7->_unmergedCentroids;
    v7->_unmergedCentroids = (NSMutableArray *)v10;

    v7->_totalWeight = 0;
  }
  return v7;
}

- (void)addValue:(float)a3 weight:(unsigned int)a4
{
  uint64_t v4;
  double v7;
  double v8;
  void *v9;
  BPSApproxPercentileDigestCentroid *v10;
  double v11;
  BPSApproxPercentileDigestCentroid *v12;
  void *v13;
  unint64_t v14;
  unint64_t v15;

  v4 = *(_QWORD *)&a4;
  if (!-[BPSApproxPercentileDigest totalWeight](self, "totalWeight"))
  {
    *(float *)&v7 = a3;
    -[BPSApproxPercentileDigest setMin:](self, "setMin:", v7);
    *(float *)&v8 = a3;
    -[BPSApproxPercentileDigest setMax:](self, "setMax:", v8);
  }
  -[BPSApproxPercentileDigest unmergedCentroids](self, "unmergedCentroids");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = [BPSApproxPercentileDigestCentroid alloc];
  *(float *)&v11 = a3;
  v12 = -[BPSApproxPercentileDigestCentroid initWithMeanAndWeight:weight:](v10, "initWithMeanAndWeight:weight:", v4, v11);
  objc_msgSend(v9, "addObject:", v12);

  -[BPSApproxPercentileDigest setTotalWeight:](self, "setTotalWeight:", -[BPSApproxPercentileDigest totalWeight](self, "totalWeight") + v4);
  -[BPSApproxPercentileDigest unmergedCentroids](self, "unmergedCentroids");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "count");
  v15 = -[BPSApproxPercentileDigest unmergedBufferSize](self, "unmergedBufferSize");

  if (v14 >= v15)
    -[BPSApproxPercentileDigest mergeCentroids](self, "mergeCentroids");
}

- (void)addValue:(float)a3
{
  -[BPSApproxPercentileDigest addValue:weight:](self, "addValue:weight:", 1);
}

- (double)quantileLimitForClusterIndex:(unint64_t)a3 maxCentroidCount:(unint64_t)a4
{
  double v4;

  v4 = (double)a3 / (double)a4;
  if (v4 >= 0.5)
    return (1.0 - v4) * -2.0 * (1.0 - v4) + 1.0;
  else
    return v4 * (v4 + v4);
}

- (double)valueAtQuantile:(double)a3
{
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  float v11;
  double v12;
  double v13;
  void *v14;
  float v15;
  double v16;
  double v17;
  float v18;
  float v19;
  float v20;
  void *v21;
  float v22;
  double v23;
  float v24;
  double v25;
  double v26;
  double v27;
  float v28;
  float v29;
  float v30;
  float v31;
  void *v32;
  void *v33;
  unsigned int v34;
  void *v35;
  uint64_t v36;
  unint64_t v37;
  double v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  double v43;
  void *v44;
  unint64_t v45;
  void *v46;
  double v47;
  double v48;
  float v49;
  double v50;
  float v51;
  float v52;
  double v53;
  float v54;
  double v55;
  double v56;
  double v57;
  double v58;
  double v59;
  void *v60;
  int v61;
  double v62;
  double v63;
  double v64;
  float v65;
  float v66;
  double v67;
  float v68;
  double v69;
  double v70;
  double v71;
  double v72;
  float v73;

  -[BPSApproxPercentileDigest mergeCentroids](self, "mergeCentroids");
  -[BPSApproxPercentileDigest mergedCentroids](self, "mergedCentroids");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "count");

  if (v6)
  {
    -[BPSApproxPercentileDigest mergedCentroids](self, "mergedCentroids");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "count");

    if (v8 == 2)
    {
      -[BPSApproxPercentileDigest mergedCentroids](self, "mergedCentroids");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "firstObject");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "mean");
      v12 = v11;
LABEL_48:

      goto LABEL_49;
    }
    v13 = (double)-[BPSApproxPercentileDigest totalWeight](self, "totalWeight") * a3;
    -[BPSApproxPercentileDigest mergedCentroids](self, "mergedCentroids");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "firstObject");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v9, "weight") >= 2 && v13 < (double)objc_msgSend(v9, "weight") * 0.5)
    {
      -[BPSApproxPercentileDigest min](self, "min");
      v16 = v15;
      v17 = (v13 + -1.0) / ((double)objc_msgSend(v9, "weight") * 0.5 + -1.0);
      objc_msgSend(v9, "mean");
      v19 = v18;
      -[BPSApproxPercentileDigest min](self, "min");
      v12 = v16 + v17 * (float)(v19 - v20);
LABEL_49:

      return v12;
    }
    if (v13 >= (double)(-[BPSApproxPercentileDigest totalWeight](self, "totalWeight") - 1))
    {
      -[BPSApproxPercentileDigest max](self, "max");
      v12 = v31;
      goto LABEL_49;
    }
    -[BPSApproxPercentileDigest mergedCentroids](self, "mergedCentroids");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "lastObject");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v10, "mean");
    if (v22 > 1.0)
    {
      v23 = (double)-[BPSApproxPercentileDigest totalWeight](self, "totalWeight") - v13;
      if (v23 < (double)objc_msgSend(v10, "weight") * 0.5)
      {
        -[BPSApproxPercentileDigest max](self, "max");
        v25 = v24;
        v26 = (double)-[BPSApproxPercentileDigest totalWeight](self, "totalWeight") - v13 + -1.0;
        v27 = v26 / ((double)objc_msgSend(v10, "weight") * 0.5 + -1.0);
        -[BPSApproxPercentileDigest max](self, "max");
        v29 = v28;
        objc_msgSend(v10, "mean");
        v12 = v25 + v27 * (float)(v29 - v30);
        goto LABEL_48;
      }
    }
    -[BPSApproxPercentileDigest mergedCentroids](self, "mergedCentroids");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "firstObject");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v34 = objc_msgSend(v33, "weight");

    -[BPSApproxPercentileDigest mergedCentroids](self, "mergedCentroids");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    v36 = objc_msgSend(v35, "count");

    if (v36 == 1)
    {
LABEL_17:
      -[BPSApproxPercentileDigest mergedCentroids](self, "mergedCentroids");
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v46, "lastObject");
      v40 = (void *)objc_claimAutoreleasedReturnValue();

      v47 = v13 - (double)-[BPSApproxPercentileDigest totalWeight](self, "totalWeight");
      v48 = v47 - (double)objc_msgSend(v40, "weight") * 0.5;
      objc_msgSend(v40, "mean");
      v50 = v49 * 0.5 - v48;
      objc_msgSend(v40, "mean");
      v52 = v51;
      v53 = v51;
      -[BPSApproxPercentileDigest max](self, "max");
      v55 = v54;
      v56 = (v48 * v53 + v54 * v50) / (v48 + v50);
      if (v56 >= v53)
        v56 = v53;
      if (v56 <= v55)
        v56 = v54;
      if ((v50 * v55 + v53 * v48) / (v48 + v50) < v55)
        v55 = (v50 * v55 + v53 * v48) / (v48 + v50);
      if (v55 <= v53)
        v55 = v53;
      if (v52 <= v54)
        v12 = v55;
      else
        v12 = v56;
      goto LABEL_47;
    }
    v37 = 0;
    v38 = (double)v34 * 0.5;
    while (1)
    {
      -[BPSApproxPercentileDigest mergedCentroids](self, "mergedCentroids");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v39, "objectAtIndex:", v37);
      v40 = (void *)objc_claimAutoreleasedReturnValue();

      -[BPSApproxPercentileDigest mergedCentroids](self, "mergedCentroids");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v41, "objectAtIndex:", ++v37);
      v42 = (void *)objc_claimAutoreleasedReturnValue();

      LODWORD(v41) = objc_msgSend(v40, "weight");
      v43 = v38 + (double)(objc_msgSend(v42, "weight") + v41) * 0.5;
      if (v43 > v13)
        break;

      -[BPSApproxPercentileDigest mergedCentroids](self, "mergedCentroids");
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      v45 = objc_msgSend(v44, "count") - 1;

      v38 = v43;
      if (v37 >= v45)
        goto LABEL_17;
    }
    v57 = 0.0;
    v58 = v13 - v38;
    v59 = 0.0;
    if (objc_msgSend(v40, "weight") == 1 && (v59 = 0.5, v58 < 0.5))
    {
      v60 = v40;
    }
    else
    {
      v61 = objc_msgSend(v42, "weight");
      v62 = v43 - v13;
      if (v61 != 1 || (v57 = 0.5, v62 > 0.5))
      {
        v63 = v58 - v59;
        v64 = v62 - v57;
        objc_msgSend(v40, "mean");
        v66 = v65;
        v67 = v65;
        objc_msgSend(v42, "mean");
        v69 = v68;
        v70 = v63 + v64;
        if (v66 <= v68)
        {
          v72 = (v63 * v69 + v67 * v64) / v70;
          if (v72 >= v69)
            v72 = v69;
          if (v72 <= v67)
            v12 = v67;
          else
            v12 = v72;
        }
        else
        {
          v71 = (v64 * v67 + v69 * v63) / v70;
          if (v71 >= v67)
            v71 = v67;
          if (v71 <= v69)
            v12 = v69;
          else
            v12 = v71;
        }
        goto LABEL_46;
      }
      v60 = v42;
    }
    objc_msgSend(v60, "mean");
    v12 = v73;
LABEL_46:

LABEL_47:
    goto LABEL_48;
  }
  return 0.0;
}

- (void)mergeCentroids
{
  NSMutableArray *unmergedCentroids;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  float min;
  void *v9;
  void *v10;
  float max;
  unint64_t totalWeight;
  double v13;
  double v14;
  float v15;
  double v16;
  uint64_t v17;
  NSMutableArray *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  id v22;
  double v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  uint64_t v28;
  void *v29;
  BPSApproxPercentileDigestCentroid *v30;
  double v31;
  BPSApproxPercentileDigestCentroid *v32;
  float v33;
  double v34;
  double v35;
  float v36;
  void *v37;
  BPSApproxPercentileDigestCentroid *v38;
  double v39;
  BPSApproxPercentileDigestCentroid *v40;
  void *v41;
  void *v42;
  uint64_t v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  _BYTE v48[128];
  _QWORD v49[3];

  v49[1] = *MEMORY[0x1E0C80C00];
  if (-[NSMutableArray count](self->_unmergedCentroids, "count"))
  {
    -[NSMutableArray addObjectsFromArray:](self->_unmergedCentroids, "addObjectsFromArray:", self->_mergedCentroids);
    unmergedCentroids = self->_unmergedCentroids;
    objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("mean"), 1);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v49[0] = v4;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v49, 1);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableArray sortUsingDescriptors:](unmergedCentroids, "sortUsingDescriptors:", v5);

    -[NSMutableArray firstObject](self->_unmergedCentroids, "firstObject");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v6;
    if (v6 && objc_msgSend(v6, "weight") == 1)
    {
      objc_msgSend(v7, "mean");
      if (min >= self->_min)
        min = self->_min;
      self->_min = min;
    }
    -[NSMutableArray lastObject](self->_unmergedCentroids, "lastObject");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v9;
    if (v9 && objc_msgSend(v9, "weight") == 1)
    {
      objc_msgSend(v10, "mean");
      if (max < self->_max)
        max = self->_max;
      self->_max = max;
    }
    -[NSMutableArray removeAllObjects](self->_mergedCentroids, "removeAllObjects");
    totalWeight = self->_totalWeight;
    -[BPSApproxPercentileDigest quantileLimitForClusterIndex:maxCentroidCount:](self, "quantileLimitForClusterIndex:maxCentroidCount:", 1, -[BPSApproxPercentileDigest maxCentroidCount](self, "maxCentroidCount"));
    v14 = v13;
    objc_msgSend(v7, "mean");
    v16 = v15;
    v17 = objc_msgSend(v7, "weight");
    -[NSMutableArray removeObjectAtIndex:](self->_unmergedCentroids, "removeObjectAtIndex:", 0);
    v46 = 0u;
    v47 = 0u;
    v44 = 0u;
    v45 = 0u;
    v18 = self->_unmergedCentroids;
    v19 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v18, "countByEnumeratingWithState:objects:count:", &v44, v48, 16);
    if (v19)
    {
      v20 = v19;
      v41 = v10;
      v42 = v7;
      v43 = 24;
      v21 = 0;
      v22 = 0;
      v23 = v14 * (double)totalWeight;
      v24 = *(_QWORD *)v45;
      v25 = 1;
      do
      {
        v26 = 0;
        v27 = v22;
        do
        {
          if (*(_QWORD *)v45 != v24)
            objc_enumerationMutation(v18);
          v22 = *(id *)(*((_QWORD *)&v44 + 1) + 8 * v26);

          v28 = v21 + v17;
          if (v23 >= (double)(v28 + (unint64_t)objc_msgSend(v22, "weight")))
          {
            v17 = objc_msgSend(v22, "weight") + v17;
            objc_msgSend(v22, "mean");
            v16 = v16 + (float)(v36 * (float)objc_msgSend(v22, "weight"));
          }
          else
          {
            -[BPSApproxPercentileDigest mergedCentroids](self, "mergedCentroids");
            v29 = (void *)objc_claimAutoreleasedReturnValue();
            v30 = [BPSApproxPercentileDigestCentroid alloc];
            *(float *)&v31 = v16 / (double)v17;
            v32 = -[BPSApproxPercentileDigestCentroid initWithMeanAndWeight:weight:](v30, "initWithMeanAndWeight:weight:", v17, v31);
            objc_msgSend(v29, "addObject:", v32);

            v17 = objc_msgSend(v22, "weight");
            objc_msgSend(v22, "mean");
            v16 = (float)(v33 * (float)objc_msgSend(v22, "weight"));
            ++v25;
            v34 = (double)self->_totalWeight;
            -[BPSApproxPercentileDigest quantileLimitForClusterIndex:maxCentroidCount:](self, "quantileLimitForClusterIndex:maxCentroidCount:", v25, -[BPSApproxPercentileDigest maxCentroidCount](self, "maxCentroidCount"));
            v23 = v35 * v34;
            v21 = v28;
          }
          ++v26;
          v27 = v22;
        }
        while (v20 != v26);
        v20 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v18, "countByEnumeratingWithState:objects:count:", &v44, v48, 16);
      }
      while (v20);

      v7 = v42;
      v10 = v41;
    }

    if ((_DWORD)v17)
    {
      -[BPSApproxPercentileDigest mergedCentroids](self, "mergedCentroids");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      v38 = [BPSApproxPercentileDigestCentroid alloc];
      *(float *)&v39 = v16 / (double)v17;
      v40 = -[BPSApproxPercentileDigestCentroid initWithMeanAndWeight:weight:](v38, "initWithMeanAndWeight:weight:", v17, v39);
      objc_msgSend(v37, "addObject:", v40);

    }
    -[NSMutableArray removeAllObjects](self->_unmergedCentroids, "removeAllObjects", v41, v42, v43);

  }
}

- (void)addDigest:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  objc_msgSend(v4, "mergeCentroids");
  -[BPSApproxPercentileDigest setTotalWeight:](self, "setTotalWeight:", -[BPSApproxPercentileDigest totalWeight](self, "totalWeight") + objc_msgSend(v4, "totalWeight"));
  -[BPSApproxPercentileDigest unmergedCentroids](self, "unmergedCentroids");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "mergedCentroids");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "addObjectsFromArray:", v6);
  -[BPSApproxPercentileDigest mergeCentroids](self, "mergeCentroids");
}

- (id)encodeAsProto
{
  void *v2;
  void *v3;

  -[BPSApproxPercentileDigest proto](self, "proto");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "data");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (BPSApproxPercentileDigest)initWithProto:(id)a3
{
  id v4;
  id v5;
  int v6;
  BPSApproxPercentileDigest *v7;
  uint64_t v8;
  uint64_t v9;
  NSObject *v10;
  BPSApproxPercentileDigest *v11;
  unint64_t v12;
  int v13;
  int v14;
  uint64_t v15;
  void *v16;
  BPSApproxPercentileDigestCentroid *v17;
  double v18;
  BPSApproxPercentileDigestCentroid *v19;

  v4 = a3;
  if (!v4)
  {
LABEL_8:
    v11 = 0;
    goto LABEL_14;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    __biome_log_for_category();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT))
      -[BPSApproxPercentileDigest initWithProto:].cold.1((uint64_t)self, v10);

    goto LABEL_8;
  }
  v5 = v4;
  v6 = objc_msgSend(v5, "hasBufferMultiplier");
  v7 = [BPSApproxPercentileDigest alloc];
  v8 = objc_msgSend(v5, "centroidCount");
  if (v6)
    v9 = -[BPSApproxPercentileDigest initWithCapacity:bufferMultiplier:](v7, "initWithCapacity:bufferMultiplier:", v8, objc_msgSend(v5, "bufferMultiplier"));
  else
    v9 = -[BPSApproxPercentileDigest initWithCapacity:](v7, "initWithCapacity:", v8);
  v11 = (BPSApproxPercentileDigest *)v9;
  objc_msgSend(v5, "min");
  -[BPSApproxPercentileDigest setMin:](v11, "setMin:");
  objc_msgSend(v5, "max");
  -[BPSApproxPercentileDigest setMax:](v11, "setMax:");
  if (objc_msgSend(v5, "centroidWeightsCount"))
  {
    v12 = 0;
    do
    {
      objc_msgSend(v5, "centroidMeansAtIndex:", v12);
      v14 = v13;
      v15 = objc_msgSend(v5, "centroidWeightsAtIndex:", v12);
      -[BPSApproxPercentileDigest mergedCentroids](v11, "mergedCentroids");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = [BPSApproxPercentileDigestCentroid alloc];
      LODWORD(v18) = v14;
      v19 = -[BPSApproxPercentileDigestCentroid initWithMeanAndWeight:weight:](v17, "initWithMeanAndWeight:weight:", v15, v18);
      objc_msgSend(v16, "addObject:", v19);

      -[BPSApproxPercentileDigest setTotalWeight:](v11, "setTotalWeight:", -[BPSApproxPercentileDigest totalWeight](v11, "totalWeight") + v15);
      ++v12;
    }
    while (objc_msgSend(v5, "centroidWeightsCount") > v12);
  }

LABEL_14:
  return v11;
}

- (BPSApproxPercentileDigest)initWithProtoData:(id)a3
{
  id v4;
  BPSPBApproxPercentileDigest *v5;
  BPSApproxPercentileDigest *v6;

  if (a3)
  {
    v4 = a3;
    v5 = -[BPSPBApproxPercentileDigest initWithData:]([BPSPBApproxPercentileDigest alloc], "initWithData:", v4);

    self = -[BPSApproxPercentileDigest initWithProto:](self, "initWithProto:", v5);
    v6 = self;
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (id)proto
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  -[BPSApproxPercentileDigest mergeCentroids](self, "mergeCentroids");
  v3 = (void *)objc_opt_new();
  -[BPSApproxPercentileDigest min](self, "min");
  objc_msgSend(v3, "setMin:");
  -[BPSApproxPercentileDigest max](self, "max");
  objc_msgSend(v3, "setMax:");
  -[BPSApproxPercentileDigest mergedCentroids](self, "mergedCentroids");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setCentroidCount:", objc_msgSend(v4, "count"));

  v14 = 0u;
  v15 = 0u;
  v12 = 0u;
  v13 = 0u;
  -[BPSApproxPercentileDigest mergedCentroids](self, "mergedCentroids", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v13;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v13 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * i);
        objc_msgSend(v10, "mean");
        objc_msgSend(v3, "addCentroidMeans:");
        objc_msgSend(v3, "addCentroidWeights:", objc_msgSend(v10, "weight"));
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v7);
  }

  return v3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[BPSApproxPercentileDigest encodeAsProto](self, "encodeAsProto");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("data"));

}

- (BPSApproxPercentileDigest)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  BPSApproxPercentileDigest *v6;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("data"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    self = -[BPSApproxPercentileDigest initWithProtoData:](self, "initWithProtoData:", v5);
    v6 = self;
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (NSMutableArray)mergedCentroids
{
  return self->_mergedCentroids;
}

- (void)setMergedCentroids:(id)a3
{
  objc_storeStrong((id *)&self->_mergedCentroids, a3);
}

- (NSMutableArray)unmergedCentroids
{
  return self->_unmergedCentroids;
}

- (void)setUnmergedCentroids:(id)a3
{
  objc_storeStrong((id *)&self->_unmergedCentroids, a3);
}

- (float)min
{
  return self->_min;
}

- (void)setMin:(float)a3
{
  self->_min = a3;
}

- (float)max
{
  return self->_max;
}

- (void)setMax:(float)a3
{
  self->_max = a3;
}

- (unint64_t)maxCentroidCount
{
  return self->_maxCentroidCount;
}

- (void)setMaxCentroidCount:(unint64_t)a3
{
  self->_maxCentroidCount = a3;
}

- (unint64_t)totalWeight
{
  return self->_totalWeight;
}

- (void)setTotalWeight:(unint64_t)a3
{
  self->_totalWeight = a3;
}

- (unint64_t)unmergedBufferSize
{
  return self->_unmergedBufferSize;
}

- (void)setUnmergedBufferSize:(unint64_t)a3
{
  self->_unmergedBufferSize = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_unmergedCentroids, 0);
  objc_storeStrong((id *)&self->_mergedCentroids, 0);
}

- (void)initWithProto:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  int v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v3 = 138412290;
  v4 = objc_opt_class();
  _os_log_fault_impl(&dword_1A956A000, a2, OS_LOG_TYPE_FAULT, "%@: tried to initialize with a non-BPSPBTDigest proto", (uint8_t *)&v3, 0xCu);
}

@end
