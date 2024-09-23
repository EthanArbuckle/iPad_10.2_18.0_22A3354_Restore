@implementation HKHealthChartPoint

- (NSString)description
{
  void *v3;
  void *v4;
  NSNumber *sum;
  NSNumber *min;
  NSNumber *max;
  NSNumber *avg;
  NSNumber *mostRecent;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  NSDate *date;
  void *v21;
  objc_super v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  sum = self->_sum;
  if (sum)
    objc_msgSend(v3, "setObject:forKeyedSubscript:", sum, CFSTR("sum"));
  min = self->_min;
  if (min)
    objc_msgSend(v4, "setObject:forKeyedSubscript:", min, CFSTR("min"));
  max = self->_max;
  if (max)
    objc_msgSend(v4, "setObject:forKeyedSubscript:", max, CFSTR("max"));
  avg = self->_avg;
  if (avg)
    objc_msgSend(v4, "setObject:forKeyedSubscript:", avg, CFSTR("avg"));
  mostRecent = self->_mostRecent;
  if (mostRecent)
    objc_msgSend(v4, "setObject:forKeyedSubscript:", mostRecent, CFSTR("mostRecent"));
  objc_msgSend(MEMORY[0x1E0CB37A0], "string");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  objc_msgSend(v4, "allKeys");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v25;
    do
    {
      for (i = 0; i != v13; ++i)
      {
        if (*(_QWORD *)v25 != v14)
          objc_enumerationMutation(v11);
        v16 = *(_QWORD *)(*((_QWORD *)&v24 + 1) + 8 * i);
        objc_msgSend(v4, "objectForKeyedSubscript:", v16);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "appendFormat:", CFSTR("%@=%@ "), v16, v17);

      }
      v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
    }
    while (v13);
  }

  v23.receiver = self;
  v23.super_class = (Class)HKHealthChartPoint;
  -[HKHealthChartPoint description](&v23, sel_description);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = v18;
  date = self->_date;
  if (!date)
    date = (NSDate *)&stru_1E9C4C428;
  objc_msgSend(v18, "stringByAppendingFormat:", CFSTR(";%@;%@"), date, v10);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v21;
}

- (HKHealthChartPoint)initWithStatistics:(id)a3 options:(unint64_t)a4 unit:(id)a5 displayType:(id)a6 sourceTimeZone:(id)a7
{
  char v10;
  id v12;
  id v13;
  id v14;
  id v15;
  HKHealthChartPoint *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  NSDate *date;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  NSNumber *sum;
  void *v27;
  uint64_t v28;
  NSNumber *v29;
  void *v30;
  void *v31;
  void *v32;
  uint64_t v33;
  NSNumber *avg;
  void *v35;
  uint64_t v36;
  NSNumber *v37;
  void *v38;
  void *v39;
  void *v40;
  uint64_t v41;
  NSNumber *min;
  void *v43;
  uint64_t v44;
  NSNumber *v45;
  void *v46;
  void *v47;
  void *v48;
  uint64_t v49;
  NSNumber *max;
  void *v51;
  uint64_t v52;
  NSNumber *v53;
  void *v54;
  void *v55;
  void *v56;
  uint64_t v57;
  NSNumber *mostRecent;
  void *v59;
  uint64_t v60;
  NSNumber *v61;
  objc_super v63;

  v10 = a4;
  v12 = a3;
  v13 = a5;
  v14 = a6;
  v15 = a7;
  v63.receiver = self;
  v63.super_class = (Class)HKHealthChartPoint;
  v16 = -[HKHealthChartPoint init](&v63, sel_init);
  if (!v16)
    goto LABEL_23;
  objc_msgSend(v12, "startDate");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "endDate");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  HKUIMidDate(v17, v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "hk_dateFromSourceTimeZone:", v15);
  v20 = objc_claimAutoreleasedReturnValue();
  date = v16->_date;
  v16->_date = (NSDate *)v20;

  if ((v10 & 0x10) != 0)
  {
    objc_msgSend(v12, "sumQuantity");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = v22;
    if (v22)
    {
      v24 = (void *)MEMORY[0x1E0CB37E8];
      objc_msgSend(v22, "doubleValueForUnit:", v13);
      objc_msgSend(v24, "numberWithDouble:");
      v25 = objc_claimAutoreleasedReturnValue();
      sum = v16->_sum;
      v16->_sum = (NSNumber *)v25;

      objc_msgSend(v14, "presentation");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "adjustedValueForDaemonValue:", v16->_sum);
      v28 = objc_claimAutoreleasedReturnValue();
      v29 = v16->_sum;
      v16->_sum = (NSNumber *)v28;

    }
    if ((v10 & 2) == 0)
    {
LABEL_4:
      if ((v10 & 4) == 0)
        goto LABEL_5;
      goto LABEL_14;
    }
  }
  else if ((v10 & 2) == 0)
  {
    goto LABEL_4;
  }
  objc_msgSend(v12, "averageQuantity");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = v30;
  if (v30)
  {
    v32 = (void *)MEMORY[0x1E0CB37E8];
    objc_msgSend(v30, "doubleValueForUnit:", v13);
    objc_msgSend(v32, "numberWithDouble:");
    v33 = objc_claimAutoreleasedReturnValue();
    avg = v16->_avg;
    v16->_avg = (NSNumber *)v33;

    objc_msgSend(v14, "presentation");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "adjustedValueForDaemonValue:", v16->_avg);
    v36 = objc_claimAutoreleasedReturnValue();
    v37 = v16->_avg;
    v16->_avg = (NSNumber *)v36;

  }
  if ((v10 & 4) == 0)
  {
LABEL_5:
    if ((v10 & 8) == 0)
      goto LABEL_6;
    goto LABEL_17;
  }
LABEL_14:
  objc_msgSend(v12, "minimumQuantity");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  v39 = v38;
  if (v38)
  {
    v40 = (void *)MEMORY[0x1E0CB37E8];
    objc_msgSend(v38, "doubleValueForUnit:", v13);
    objc_msgSend(v40, "numberWithDouble:");
    v41 = objc_claimAutoreleasedReturnValue();
    min = v16->_min;
    v16->_min = (NSNumber *)v41;

    objc_msgSend(v14, "presentation");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v43, "adjustedValueForDaemonValue:", v16->_min);
    v44 = objc_claimAutoreleasedReturnValue();
    v45 = v16->_min;
    v16->_min = (NSNumber *)v44;

  }
  if ((v10 & 8) == 0)
  {
LABEL_6:
    if ((v10 & 0x20) == 0)
      goto LABEL_23;
    goto LABEL_20;
  }
LABEL_17:
  objc_msgSend(v12, "maximumQuantity");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  v47 = v46;
  if (v46)
  {
    v48 = (void *)MEMORY[0x1E0CB37E8];
    objc_msgSend(v46, "doubleValueForUnit:", v13);
    objc_msgSend(v48, "numberWithDouble:");
    v49 = objc_claimAutoreleasedReturnValue();
    max = v16->_max;
    v16->_max = (NSNumber *)v49;

    objc_msgSend(v14, "presentation");
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v51, "adjustedValueForDaemonValue:", v16->_max);
    v52 = objc_claimAutoreleasedReturnValue();
    v53 = v16->_max;
    v16->_max = (NSNumber *)v52;

  }
  if ((v10 & 0x20) != 0)
  {
LABEL_20:
    objc_msgSend(v12, "mostRecentQuantity");
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    v55 = v54;
    if (v54)
    {
      v56 = (void *)MEMORY[0x1E0CB37E8];
      objc_msgSend(v54, "doubleValueForUnit:", v13);
      objc_msgSend(v56, "numberWithDouble:");
      v57 = objc_claimAutoreleasedReturnValue();
      mostRecent = v16->_mostRecent;
      v16->_mostRecent = (NSNumber *)v57;

      objc_msgSend(v14, "presentation");
      v59 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v59, "adjustedValueForDaemonValue:", v16->_mostRecent);
      v60 = objc_claimAutoreleasedReturnValue();
      v61 = v16->_mostRecent;
      v16->_mostRecent = (NSNumber *)v60;

    }
  }
LABEL_23:

  return v16;
}

- (HKHealthChartPoint)initWithDataSourceValue:(id)a3 options:(unint64_t)a4 unit:(id)a5 displayType:(id)a6
{
  char v8;
  id v10;
  id v11;
  id v12;
  HKHealthChartPoint *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  NSDate *date;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  NSNumber *sum;
  void *v23;
  uint64_t v24;
  NSNumber *v25;
  void *v26;
  void *v27;
  void *v28;
  uint64_t v29;
  NSNumber *avg;
  void *v31;
  uint64_t v32;
  NSNumber *v33;
  void *v34;
  void *v35;
  void *v36;
  uint64_t v37;
  NSNumber *min;
  void *v39;
  uint64_t v40;
  NSNumber *v41;
  void *v42;
  void *v43;
  void *v44;
  uint64_t v45;
  NSNumber *max;
  void *v47;
  uint64_t v48;
  NSNumber *v49;
  void *v50;
  void *v51;
  void *v52;
  uint64_t v53;
  NSNumber *mostRecent;
  void *v55;
  uint64_t v56;
  NSNumber *v57;
  objc_super v59;

  v8 = a4;
  v10 = a3;
  v11 = a5;
  v12 = a6;
  v59.receiver = self;
  v59.super_class = (Class)HKHealthChartPoint;
  v13 = -[HKHealthChartPoint init](&v59, sel_init);
  if (!v13)
    goto LABEL_23;
  objc_msgSend(v10, "startDate");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "endDate");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  HKUIMidDate(v14, v15);
  v16 = objc_claimAutoreleasedReturnValue();
  date = v13->_date;
  v13->_date = (NSDate *)v16;

  if ((v8 & 0x10) != 0)
  {
    objc_msgSend(v10, "sumQuantity");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = v18;
    if (v18)
    {
      v20 = (void *)MEMORY[0x1E0CB37E8];
      objc_msgSend(v18, "doubleValueForUnit:", v11);
      objc_msgSend(v20, "numberWithDouble:");
      v21 = objc_claimAutoreleasedReturnValue();
      sum = v13->_sum;
      v13->_sum = (NSNumber *)v21;

      objc_msgSend(v12, "presentation");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "adjustedValueForDaemonValue:", v13->_sum);
      v24 = objc_claimAutoreleasedReturnValue();
      v25 = v13->_sum;
      v13->_sum = (NSNumber *)v24;

    }
    if ((v8 & 2) == 0)
    {
LABEL_4:
      if ((v8 & 4) == 0)
        goto LABEL_5;
      goto LABEL_14;
    }
  }
  else if ((v8 & 2) == 0)
  {
    goto LABEL_4;
  }
  objc_msgSend(v10, "averageQuantity");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = v26;
  if (v26)
  {
    v28 = (void *)MEMORY[0x1E0CB37E8];
    objc_msgSend(v26, "doubleValueForUnit:", v11);
    objc_msgSend(v28, "numberWithDouble:");
    v29 = objc_claimAutoreleasedReturnValue();
    avg = v13->_avg;
    v13->_avg = (NSNumber *)v29;

    objc_msgSend(v12, "presentation");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "adjustedValueForDaemonValue:", v13->_avg);
    v32 = objc_claimAutoreleasedReturnValue();
    v33 = v13->_avg;
    v13->_avg = (NSNumber *)v32;

  }
  if ((v8 & 4) == 0)
  {
LABEL_5:
    if ((v8 & 8) == 0)
      goto LABEL_6;
    goto LABEL_17;
  }
LABEL_14:
  objc_msgSend(v10, "minQuantity");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v35 = v34;
  if (v34)
  {
    v36 = (void *)MEMORY[0x1E0CB37E8];
    objc_msgSend(v34, "doubleValueForUnit:", v11);
    objc_msgSend(v36, "numberWithDouble:");
    v37 = objc_claimAutoreleasedReturnValue();
    min = v13->_min;
    v13->_min = (NSNumber *)v37;

    objc_msgSend(v12, "presentation");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "adjustedValueForDaemonValue:", v13->_min);
    v40 = objc_claimAutoreleasedReturnValue();
    v41 = v13->_min;
    v13->_min = (NSNumber *)v40;

  }
  if ((v8 & 8) == 0)
  {
LABEL_6:
    if ((v8 & 0x20) == 0)
      goto LABEL_23;
    goto LABEL_20;
  }
LABEL_17:
  objc_msgSend(v10, "maxQuantity");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  v43 = v42;
  if (v42)
  {
    v44 = (void *)MEMORY[0x1E0CB37E8];
    objc_msgSend(v42, "doubleValueForUnit:", v11);
    objc_msgSend(v44, "numberWithDouble:");
    v45 = objc_claimAutoreleasedReturnValue();
    max = v13->_max;
    v13->_max = (NSNumber *)v45;

    objc_msgSend(v12, "presentation");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v47, "adjustedValueForDaemonValue:", v13->_max);
    v48 = objc_claimAutoreleasedReturnValue();
    v49 = v13->_max;
    v13->_max = (NSNumber *)v48;

  }
  if ((v8 & 0x20) != 0)
  {
LABEL_20:
    objc_msgSend(v10, "mostRecentQuantity");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    v51 = v50;
    if (v50)
    {
      v52 = (void *)MEMORY[0x1E0CB37E8];
      objc_msgSend(v50, "doubleValueForUnit:", v11);
      objc_msgSend(v52, "numberWithDouble:");
      v53 = objc_claimAutoreleasedReturnValue();
      mostRecent = v13->_mostRecent;
      v13->_mostRecent = (NSNumber *)v53;

      objc_msgSend(v12, "presentation");
      v55 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v55, "adjustedValueForDaemonValue:", v13->_mostRecent);
      v56 = objc_claimAutoreleasedReturnValue();
      v57 = v13->_mostRecent;
      v13->_mostRecent = (NSNumber *)v56;

    }
  }
LABEL_23:

  return v13;
}

- (id)xValueAsGenericType
{
  return self->_date;
}

- (id)yValue
{
  NSNumber *avg;

  avg = self->_avg;
  if (!avg)
  {
    avg = self->_sum;
    if (!avg)
    {
      avg = self->_max;
      if (!avg)
      {
        avg = self->_min;
        if (!avg)
          avg = self->_mostRecent;
      }
    }
  }
  return avg;
}

- (id)yValueForKey:(id)a3
{
  id v4;
  uint64_t v5;
  id v6;

  v4 = a3;
  if ((objc_msgSend(v4, "isEqualToString:", CFSTR("min")) & 1) != 0)
  {
    v5 = 24;
  }
  else if ((objc_msgSend(v4, "isEqualToString:", CFSTR("max")) & 1) != 0)
  {
    v5 = 32;
  }
  else if ((objc_msgSend(v4, "isEqualToString:", CFSTR("avg")) & 1) != 0)
  {
    v5 = 40;
  }
  else if ((objc_msgSend(v4, "isEqualToString:", CFSTR("sum")) & 1) != 0)
  {
    v5 = 16;
  }
  else
  {
    if (!objc_msgSend(v4, "isEqualToString:", CFSTR("mostRecent")))
    {
      v6 = 0;
      goto LABEL_12;
    }
    v5 = 48;
  }
  v6 = *(id *)((char *)&self->super.isa + v5);
LABEL_12:

  return v6;
}

- (id)allYValues
{
  void *v3;
  void *v4;

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (self->_avg)
    objc_msgSend(v3, "addObject:");
  if (self->_sum)
    objc_msgSend(v4, "addObject:");
  if (self->_max)
    objc_msgSend(v4, "addObject:");
  if (self->_min)
    objc_msgSend(v4, "addObject:");
  if (self->_mostRecent)
    objc_msgSend(v4, "addObject:");
  return v4;
}

- (id)minYValue
{
  NSNumber *min;
  NSNumber **p_min;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  id v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  p_min = &self->_min;
  min = self->_min;
  if (min)
    return min;
  v15 = 0u;
  v16 = 0u;
  v13 = 0u;
  v14 = 0u;
  -[HKHealthChartPoint allYValues](self, "allYValues", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v6)
  {
    v7 = v6;
    v8 = 0;
    v9 = *(_QWORD *)v14;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v14 != v9)
          objc_enumerationMutation(v5);
        v11 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * i);
        if (!v8 || objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * i), "compare:", v8) == -1)
        {
          v12 = v11;

          v8 = v12;
        }
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v7);
  }
  else
  {
    v8 = 0;
  }

  objc_storeStrong((id *)p_min, v8);
  return v8;
}

- (id)maxYValue
{
  NSNumber *max;
  NSNumber **p_max;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  id v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  p_max = &self->_max;
  max = self->_max;
  if (max)
    return max;
  v15 = 0u;
  v16 = 0u;
  v13 = 0u;
  v14 = 0u;
  -[HKHealthChartPoint allYValues](self, "allYValues", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v6)
  {
    v7 = v6;
    v8 = 0;
    v9 = *(_QWORD *)v14;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v14 != v9)
          objc_enumerationMutation(v5);
        v11 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * i);
        if (!v8 || objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * i), "compare:", v8) == 1)
        {
          v12 = v11;

          v8 = v12;
        }
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v7);
  }
  else
  {
    v8 = 0;
  }

  objc_storeStrong((id *)p_max, v8);
  return v8;
}

- (HKGraphSeriesBlockCoordinateInfo)userInfo
{
  return self->_userInfo;
}

- (void)setUserInfo:(id)a3
{
  objc_storeStrong((id *)&self->_userInfo, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userInfo, 0);
  objc_storeStrong((id *)&self->_mostRecent, 0);
  objc_storeStrong((id *)&self->_avg, 0);
  objc_storeStrong((id *)&self->_max, 0);
  objc_storeStrong((id *)&self->_min, 0);
  objc_storeStrong((id *)&self->_sum, 0);
  objc_storeStrong((id *)&self->_date, 0);
}

@end
