@implementation BLSHFlipbookFramesHistogram

+ (BLSHFlipbookFramesHistogram)histogramWithReferenceDate:(id)a3 flipbookFrames:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  unint64_t v8;
  double v9;
  float v10;
  float v11;
  float v12;
  float v13;
  float v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  double v21;
  double v22;
  double v23;
  void *v24;
  void *v25;
  unint64_t v26;
  unint64_t v27;
  unint64_t v28;
  uint64_t v29;
  void *v30;
  int v31;
  unint64_t v32;
  unint64_t v33;
  float v34;
  float v35;
  void *v36;
  float v37;
  float v38;
  void *v39;
  double v40;
  double v41;
  void *v42;
  double v43;
  double v44;
  void *v45;
  uint64_t v46;
  unint64_t v47;
  void *v48;
  double v49;
  float v50;
  float v51;
  uint64_t v52;
  unint64_t v53;
  void *v54;
  double v55;
  float v56;
  float v57;
  void *v58;
  unint64_t v59;
  void *v60;
  void *v61;
  unint64_t i;
  void *v63;
  BLSHFlipbookFramesHistogram *v64;
  uint64_t v65;
  void *v66;
  double v68;
  uint64_t v69;
  double v70;
  double v71;
  unint64_t v72;
  id obj;
  uint64_t v74;
  double v75;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  void *v80;
  id v81;
  uint64_t v82;
  float v83;
  unint64_t v84;
  unint64_t v85;
  __int128 v86;
  __int128 v87;
  __int128 v88;
  __int128 v89;
  _BYTE v90[128];
  _OWORD v91[8];
  _OWORD v92[8];
  uint64_t v93;

  v93 = *MEMORY[0x24BDAC8D0];
  v81 = a3;
  v5 = a4;
  v72 = objc_msgSend(v5, "count");
  objc_msgSend(MEMORY[0x24BDBCE60], "distantFuture");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCE60], "distantPast");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v80 = (void *)objc_claimAutoreleasedReturnValue();
  memset(v92, 0, sizeof(v92));
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v79 = (void *)objc_claimAutoreleasedReturnValue();
  memset(v91, 0, sizeof(v91));
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v78 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v77 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCE48], "autoupdatingCurrentCalendar");
  v76 = (void *)objc_claimAutoreleasedReturnValue();
  v86 = 0u;
  v87 = 0u;
  v88 = 0u;
  v89 = 0u;
  obj = v5;
  v82 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v86, v90, 16);
  if (v82)
  {
    v8 = 0;
    v74 = *(_QWORD *)v87;
    v9 = 0.0;
    v10 = 0.0;
    v84 = 6;
    v85 = 0;
    v11 = 3.4028e38;
    v83 = 0.0;
    v12 = 0.0;
    v13 = 3.4028e38;
    v14 = 0.0;
    do
    {
      v15 = 0;
      v16 = v7;
      v17 = v6;
      do
      {
        if (*(_QWORD *)v87 != v74)
          objc_enumerationMutation(obj);
        v18 = *(void **)(*((_QWORD *)&v86 + 1) + 8 * v15);
        objc_msgSend(v18, "bls_specifier");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "presentationDate");
        v20 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v17, "earlierDate:", v20);
        v6 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v16, "laterDate:", v20);
        v7 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v20, "timeIntervalSinceDate:", v81);
        v21 = 0.0;
        if (v22 > 0.0)
        {
          objc_msgSend(v20, "timeIntervalSinceDate:", v81);
          v21 = v23;
        }
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", v21);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v80, "addObject:", v24);

        objc_msgSend(v76, "components:fromDate:toDate:options:", 64, v81, v20, 0);
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v25, "minute") < 0 || objc_msgSend(v25, "minute") <= 14)
        {
          v26 = v84;
          if (objc_msgSend(v25, "minute") < 0)
            v27 = 0;
          else
            v27 = objc_msgSend(v25, "minute");
          v28 = 0x24BDD1000uLL;
        }
        else
        {
          v27 = 15;
          v28 = 0x24BDD1000;
          v26 = v84;
        }
        ++*((_QWORD *)v92 + v27);
        if (v27 > v26)
          v26 = v27;
        v84 = v26;
        v29 = objc_msgSend(v18, "memoryUsage");
        objc_msgSend(*(id *)(v28 + 1760), "numberWithUnsignedInteger:", v29);
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v79, "addObject:", v30);

        v31 = __clz(v29 | 1) ^ 0x3F;
        if (v31 <= 10)
          v31 = 10;
        if (v31 >= 0x19)
          v32 = 15;
        else
          v32 = (v31 - 10);
        ++*((_QWORD *)v91 + v32);
        v33 = v85;
        if (v85 <= v32)
          v33 = v32;
        v85 = v33;
        objc_msgSend(v18, "apl");
        v35 = v34;
        objc_msgSend(*(id *)(v28 + 1760), "numberWithFloat:");
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v78, "addObject:", v36);

        v14 = v14 + v35;
        if (v35 < v13)
          v13 = v35;
        if (v35 > v12)
          v12 = v35;
        objc_msgSend(v18, "aplDimming");
        v38 = v37;
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:");
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v77, "addObject:", v39);

        v83 = v83 + v38;
        if (v38 < v11)
          v11 = v38;
        if (v38 > v10)
          v10 = v38;
        v9 = v9 + v21;
        v8 += v29;

        ++v15;
        v16 = v7;
        v17 = v6;
      }
      while (v82 != v15);
      v82 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v86, v90, 16);
    }
    while (v82);
  }
  else
  {
    v8 = 0;
    v10 = 0.0;
    v84 = 6;
    v85 = 0;
    v11 = 3.4028e38;
    v83 = 0.0;
    v12 = 0.0;
    v13 = 3.4028e38;
    v14 = 0.0;
    v9 = 0.0;
  }

  objc_msgSend(v7, "timeIntervalSinceDate:", v6);
  v75 = v40;
  objc_msgSend(v6, "timeIntervalSinceDate:", v81);
  v71 = v41;
  objc_msgSend(v80, "sortedArrayUsingSelector:", sel_compare_);
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v42, "bls_doubleMedian");
  v70 = v43;
  v44 = v9 / (double)v72;
  if (!v72)
    v44 = 0.0;
  v68 = v44;
  objc_msgSend(v79, "sortedArrayUsingSelector:", sel_compare_);
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  v69 = objc_msgSend(v45, "bls_unsignedIntegerMedian");
  v46 = objc_msgSend(v78, "count");
  if (v46)
  {
    v47 = v46;
    objc_msgSend(v78, "sortedArrayUsingSelector:", sel_compare_);
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v48, "bls_doubleMedian");
    v50 = v49;
    v51 = v14 / (float)v47;

  }
  else
  {
    v12 = NAN;
    v13 = NAN;
    v51 = NAN;
    v50 = NAN;
  }
  v52 = objc_msgSend(v77, "count");
  if (v52)
  {
    v53 = v52;
    objc_msgSend(v77, "sortedArrayUsingSelector:", sel_compare_);
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v54, "bls_doubleMedian");
    v56 = v55;
    v57 = v83 / (float)v53;

  }
  else
  {
    v11 = NAN;
    v10 = NAN;
    v57 = NAN;
    v56 = NAN;
  }
  objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", v84);
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  v59 = 0;
  do
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", *((_QWORD *)v92 + v59));
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v58, "addObject:", v60);

    ++v59;
  }
  while (v59 <= v84);
  objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", v85);
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  for (i = 0; i <= v85; ++i)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", *((_QWORD *)v91 + i));
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v61, "addObject:", v63);

  }
  v64 = [BLSHFlipbookFramesHistogram alloc];
  v66 = (void *)-[BLSHFlipbookFramesHistogram initWithTotalCount:averagePresentationTimeFromNow:medianPresentationTimeFromNow:presentationTimeHistogram:intervalUntilFirstFrame:presentationDuration:memoryUsage:averageMemoryUsage:medianMemoryUsage:memoryUsageHistogram:lowestAPL:averageAPL:medianAPL:highestAPL:lowestAPLDimming:averageAPLDimming:medianAPLDimming:highestAPLDimming:]((uint64_t)v64, v72, v58, v8, v8 / v72, v69, v61, v68, v70, v71, v75, v13, v51, v50, v12, v65, SLODWORD(v11), SLODWORD(v57), SLODWORD(v56),
                  SLODWORD(v10));

  return (BLSHFlipbookFramesHistogram *)v66;
}

- (uint64_t)initWithTotalCount:(void *)a3 averagePresentationTimeFromNow:(uint64_t)a4 medianPresentationTimeFromNow:(uint64_t)a5 presentationTimeHistogram:(uint64_t)a6 intervalUntilFirstFrame:(void *)a7 presentationDuration:(double)a8 memoryUsage:(double)a9 averageMemoryUsage:(double)a10 medianMemoryUsage:(double)a11 memoryUsageHistogram:(float)a12 lowestAPL:(float)a13 averageAPL:(float)a14 medianAPL:(float)a15 highestAPL:(uint64_t)a16 lowestAPLDimming:(int)a17 averageAPLDimming:(int)a18 medianAPLDimming:(int)a19 highestAPLDimming:(int)a20
{
  id v35;
  id v36;
  id v37;
  uint64_t result;
  void *v39;
  objc_super v40;

  v35 = a3;
  v36 = a7;
  if (!a1)
    goto LABEL_5;
  if ((unint64_t)objc_msgSend(v35, "count") > 6)
  {
    v40.receiver = (id)a1;
    v40.super_class = (Class)BLSHFlipbookFramesHistogram;
    v37 = objc_msgSendSuper2(&v40, sel_init);
    a1 = (uint64_t)v37;
    if (v37)
    {
      *((_QWORD *)v37 + 5) = a2;
      *((double *)v37 + 6) = a8;
      *((double *)v37 + 7) = a9;
      objc_storeStrong((id *)v37 + 8, a3);
      *(double *)(a1 + 72) = a10;
      *(double *)(a1 + 80) = a11;
      *(_QWORD *)(a1 + 88) = a4;
      *(_QWORD *)(a1 + 96) = a5;
      *(_QWORD *)(a1 + 104) = a6;
      objc_storeStrong((id *)(a1 + 112), a7);
      *(float *)(a1 + 8) = a12;
      *(float *)(a1 + 12) = a13;
      *(float *)(a1 + 16) = a14;
      *(float *)(a1 + 20) = a15;
      *(_DWORD *)(a1 + 24) = a17;
      *(_DWORD *)(a1 + 28) = a18;
      *(_DWORD *)(a1 + 32) = a19;
      *(_DWORD *)(a1 + 36) = a20;
    }
LABEL_5:

    return a1;
  }
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("[presentationTimeHistogram count] > 6"));
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    -[BLSHFlipbookFramesHistogram initWithTotalCount:averagePresentationTimeFromNow:medianPresentationTimeFromNow:presentationTimeHistogram:intervalUntilFirstFrame:presentationDuration:memoryUsage:averageMemoryUsage:medianMemoryUsage:memoryUsageHistogram:lowestAPL:averageAPL:medianAPL:highestAPL:lowestAPLDimming:averageAPLDimming:medianAPLDimming:highestAPLDimming:].cold.1(sel_initWithTotalCount_averagePresentationTimeFromNow_medianPresentationTimeFromNow_presentationTimeHistogram_intervalUntilFirstFrame_presentationDuration_memoryUsage_averageMemoryUsage_medianMemoryUsage_memoryUsageHistogram_lowestAPL_averageAPL_medianAPL_highestAPL_lowestAPLDimming_averageAPLDimming_medianAPLDimming_highestAPLDimming_, a1, (uint64_t)v39);
  objc_msgSend(objc_retainAutorelease(v39), "UTF8String");
  result = _bs_set_crash_log_message();
  __break(0);
  return result;
}

+ (BLSHFlipbookFramesHistogram)histogramWithReferenceDate:(id)a3 iteratePresentationDatesBlock:(id)a4
{
  BLSHFlipbookFramesHistogram *v4;
  uint64_t v5;

  v4 = [BLSHFlipbookFramesHistogram alloc];
  return (BLSHFlipbookFramesHistogram *)objc_autoreleaseReturnValue((id)-[BLSHFlipbookFramesHistogram initWithTotalCount:averagePresentationTimeFromNow:medianPresentationTimeFromNow:presentationTimeHistogram:intervalUntilFirstFrame:presentationDuration:memoryUsage:averageMemoryUsage:medianMemoryUsage:memoryUsageHistogram:lowestAPL:averageAPL:medianAPL:highestAPL:lowestAPLDimming:averageAPLDimming:medianAPLDimming:highestAPLDimming:]((uint64_t)v4, 0, &unk_24D1DD460, 0, 0, 0, MEMORY[0x24BDBD1A8], 0.0, 0.0, 0.0, 0.0, NAN, NAN, NAN, NAN, v5, 2143289344, 2143289344, 2143289344,
                                                                          2143289344));
}

- (unsigned)countLessThan1Min
{
  void *v2;
  unsigned int v3;

  -[NSArray objectAtIndex:](self->_presentationTimeHistogram, "objectAtIndex:", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "unsignedIntValue");

  return v3;
}

- (unsigned)count1to2Min
{
  void *v2;
  unsigned int v3;

  -[NSArray objectAtIndex:](self->_presentationTimeHistogram, "objectAtIndex:", 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "unsignedIntValue");

  return v3;
}

- (unsigned)count2to3Min
{
  void *v2;
  unsigned int v3;

  -[NSArray objectAtIndex:](self->_presentationTimeHistogram, "objectAtIndex:", 2);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "unsignedIntValue");

  return v3;
}

- (unsigned)count3to4Min
{
  void *v2;
  unsigned int v3;

  -[NSArray objectAtIndex:](self->_presentationTimeHistogram, "objectAtIndex:", 3);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "unsignedIntValue");

  return v3;
}

- (unsigned)count4to5Min
{
  void *v2;
  unsigned int v3;

  -[NSArray objectAtIndex:](self->_presentationTimeHistogram, "objectAtIndex:", 4);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "unsignedIntValue");

  return v3;
}

- (unsigned)count5to6Min
{
  void *v2;
  unsigned int v3;

  -[NSArray objectAtIndex:](self->_presentationTimeHistogram, "objectAtIndex:", 5);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "unsignedIntValue");

  return v3;
}

- (unsigned)countMoreThan6Min
{
  void *v2;
  unsigned int v3;

  -[NSArray objectAtIndex:](self->_presentationTimeHistogram, "objectAtIndex:", 6);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "unsignedIntValue");

  return v3;
}

- (id)description
{
  void *v3;
  uint64_t v4;
  id v5;
  id v6;
  void *v7;
  uint64_t v9;
  uint64_t v10;
  void (*v11)(uint64_t);
  void *v12;
  BLSHFlipbookFramesHistogram *v13;
  id v14;
  _QWORD v15[4];
  id v16;
  BLSHFlipbookFramesHistogram *v17;

  v3 = (void *)objc_opt_new();
  v4 = MEMORY[0x24BDAC760];
  v15[0] = MEMORY[0x24BDAC760];
  v15[1] = 3221225472;
  v15[2] = __42__BLSHFlipbookFramesHistogram_description__block_invoke;
  v15[3] = &unk_24D1BBE80;
  v5 = v3;
  v16 = v5;
  v17 = self;
  objc_msgSend(v5, "appendProem:block:", self, v15);
  v9 = v4;
  v10 = 3221225472;
  v11 = __42__BLSHFlipbookFramesHistogram_description__block_invoke_2;
  v12 = &unk_24D1BBE80;
  v13 = self;
  v14 = v5;
  v6 = v5;
  objc_msgSend(v6, "appendBodySectionWithName:openDelimiter:closeDelimiter:block:", 0, &stru_24D1BE888, &stru_24D1BE888, &v9);
  objc_msgSend(v6, "description", v9, v10, v11, v12, v13);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

id __42__BLSHFlipbookFramesHistogram_description__block_invoke(uint64_t a1)
{
  id v2;
  id v3;
  id v4;
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;

  v2 = (id)objc_msgSend(*(id *)(a1 + 32), "appendUnsignedInteger:withName:", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 40), CFSTR("count"));
  v3 = (id)objc_msgSend(*(id *)(a1 + 32), "bls_appendTimeInterval:withName:decomposeUnits:", CFSTR("avg∆now"), 0, *(double *)(*(_QWORD *)(a1 + 40) + 48));
  v4 = (id)objc_msgSend(*(id *)(a1 + 32), "bls_appendTimeInterval:withName:decomposeUnits:", CFSTR("median∆now"), 0, *(double *)(*(_QWORD *)(a1 + 40) + 56));
  v5 = (id)objc_msgSend(*(id *)(a1 + 32), "bls_appendTimeInterval:withName:decomposeUnits:", CFSTR("time∆1st"), 0, *(double *)(*(_QWORD *)(a1 + 40) + 72));
  v6 = (id)objc_msgSend(*(id *)(a1 + 32), "bls_appendTimeInterval:withName:decomposeUnits:", CFSTR("interval"), 1, *(double *)(*(_QWORD *)(a1 + 40) + 80));
  v7 = *(void **)(a1 + 32);
  objc_msgSend(MEMORY[0x24BE0B948], "sharedFormatter");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "stringFromByteCount:", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 88));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (id)objc_msgSend(v7, "appendObject:withName:", v9, CFSTR("totalMem"));

  v11 = *(void **)(a1 + 32);
  objc_msgSend(MEMORY[0x24BE0B948], "sharedFormatter");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "stringFromByteCount:", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 96));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (id)objc_msgSend(v11, "appendObject:withName:", v13, CFSTR("avgMem"));

  v15 = *(void **)(a1 + 32);
  objc_msgSend(MEMORY[0x24BE0B948], "sharedFormatter");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "stringFromByteCount:", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 104));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = (id)objc_msgSend(v15, "appendObject:withName:", v17, CFSTR("medianMem"));

  v19 = (id)objc_msgSend(*(id *)(a1 + 32), "appendFloat:withName:decimalPrecision:", CFSTR("maxAPL"), 3, *(float *)(*(_QWORD *)(a1 + 40) + 20));
  v20 = (id)objc_msgSend(*(id *)(a1 + 32), "appendFloat:withName:decimalPrecision:", CFSTR("avgAPL"), 3, *(float *)(*(_QWORD *)(a1 + 40) + 12));
  v21 = (id)objc_msgSend(*(id *)(a1 + 32), "appendFloat:withName:decimalPrecision:", CFSTR("medianAPL"), 3, *(float *)(*(_QWORD *)(a1 + 40) + 16));
  v22 = (id)objc_msgSend(*(id *)(a1 + 32), "appendFloat:withName:decimalPrecision:", CFSTR("maxDim"), 3, *(float *)(*(_QWORD *)(a1 + 40) + 36));
  v23 = (id)objc_msgSend(*(id *)(a1 + 32), "appendFloat:withName:decimalPrecision:", CFSTR("avgDim"), 3, *(float *)(*(_QWORD *)(a1 + 40) + 28));
  return (id)objc_msgSend(*(id *)(a1 + 32), "appendFloat:withName:decimalPrecision:", CFSTR("medianDim"), 3, *(float *)(*(_QWORD *)(a1 + 40) + 32));
}

void __42__BLSHFlipbookFramesHistogram_description__block_invoke_2(uint64_t a1)
{
  -[BLSHFlipbookFramesHistogram stream:appendRawHistogram:withLabel:headingBlock:](*(_QWORD *)(a1 + 32), *(void **)(a1 + 40), *(void **)(*(_QWORD *)(a1 + 32) + 64), CFSTR("minutes"), &__block_literal_global_12);
  -[BLSHFlipbookFramesHistogram stream:appendRawHistogram:withLabel:headingBlock:](*(_QWORD *)(a1 + 32), *(void **)(a1 + 40), *(void **)(*(_QWORD *)(a1 + 32) + 112), CFSTR("memory"), &__block_literal_global_55);
}

uint64_t __42__BLSHFlipbookFramesHistogram_description__block_invoke_3(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%u"), a3);
}

- (void)stream:(void *)a3 appendRawHistogram:(void *)a4 withLabel:(void *)a5 headingBlock:
{
  id v9;
  id v10;
  uint64_t v11;
  unint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  id v16;
  id v17;
  void *v18;
  id v19;
  id v20;
  _QWORD v21[4];
  id v22;
  id v23;
  id v24;
  _QWORD *v25;
  _QWORD *v26;
  _QWORD v27[4];
  id v28;
  id v29;
  id v30;
  _QWORD *v31;
  _QWORD *v32;
  _QWORD v33[5];
  _QWORD v34[3];
  uint64_t v35;
  _QWORD v36[5];
  _QWORD v37[5];

  v20 = a2;
  v9 = a3;
  v10 = a4;
  v19 = a5;
  if (a1)
  {
    v37[0] = 0;
    v37[1] = v37;
    v37[2] = 0x2020000000;
    v11 = MEMORY[0x24BDAC760];
    v37[3] = 0;
    v36[0] = MEMORY[0x24BDAC760];
    v36[1] = 3221225472;
    v36[2] = __80__BLSHFlipbookFramesHistogram_stream_appendRawHistogram_withLabel_headingBlock___block_invoke;
    v36[3] = &unk_24D1BD690;
    v36[4] = v37;
    objc_msgSend(v9, "enumerateObjectsUsingBlock:", v36);
    v34[0] = 0;
    v34[1] = v34;
    v34[2] = 0x2020000000;
    v35 = 0;
    v35 = objc_msgSend(v9, "count") - 1;
    v33[0] = v11;
    v33[1] = 3221225472;
    v33[2] = __80__BLSHFlipbookFramesHistogram_stream_appendRawHistogram_withLabel_headingBlock___block_invoke_2;
    v33[3] = &unk_24D1BD690;
    v33[4] = v34;
    objc_msgSend(v9, "enumerateObjectsWithOptions:usingBlock:", 2, v33);
    v12 = objc_msgSend(v10, "length");
    if (v12 <= objc_msgSend(CFSTR("count"), "length"))
      v13 = objc_msgSend(CFSTR("count"), "length");
    else
      v13 = objc_msgSend(v10, "length");
    v14 = v13;
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%*s"), v13, objc_msgSend(objc_retainAutorelease(v10), "UTF8String"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v27[0] = v11;
    v27[1] = 3221225472;
    v27[2] = __80__BLSHFlipbookFramesHistogram_stream_appendRawHistogram_withLabel_headingBlock___block_invoke_4;
    v27[3] = &unk_24D1BD720;
    v16 = v9;
    v28 = v16;
    v31 = v37;
    v32 = v34;
    v17 = v19;
    v29 = v17;
    v30 = &__block_literal_global_63;
    objc_msgSend(v20, "appendCustomFormatWithName:block:", v15, v27);

    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%*s"), v14, objc_msgSend(CFSTR("count"), "UTF8String"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v21[0] = v11;
    v21[1] = 3221225472;
    v21[2] = __80__BLSHFlipbookFramesHistogram_stream_appendRawHistogram_withLabel_headingBlock___block_invoke_6;
    v21[3] = &unk_24D1BD720;
    v25 = v37;
    v26 = v34;
    v22 = v16;
    v23 = &__block_literal_global_63;
    v24 = v17;
    objc_msgSend(v20, "appendCustomFormatWithName:block:", v18, v21);

    _Block_object_dispose(v34, 8);
    _Block_object_dispose(v37, 8);
  }

}

id __42__BLSHFlipbookFramesHistogram_description__block_invoke_4(uint64_t a1, uint64_t a2, char a3)
{
  void *v4;
  void *v5;

  objc_msgSend(MEMORY[0x24BE0B948], "sharedFormatter");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringFromByteCount:", 1 << (a3 + 10));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

uint64_t __80__BLSHFlipbookFramesHistogram_stream_appendRawHistogram_withLabel_headingBlock___block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  uint64_t result;

  result = objc_msgSend(a2, "unsignedIntegerValue");
  if (result)
    *a4 = 1;
  else
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = a3;
  return result;
}

uint64_t __80__BLSHFlipbookFramesHistogram_stream_appendRawHistogram_withLabel_headingBlock___block_invoke_2(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  uint64_t result;

  result = objc_msgSend(a2, "unsignedIntegerValue");
  if (result)
    *a4 = 1;
  else
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = a3;
  return result;
}

unint64_t __80__BLSHFlipbookFramesHistogram_stream_appendRawHistogram_withLabel_headingBlock___block_invoke_3(uint64_t a1, void *a2, unint64_t a3)
{
  id v4;
  unint64_t v5;

  v4 = a2;
  v5 = (unint64_t)(log10((double)a3) + 1.0);
  if (objc_msgSend(v4, "length") >= v5)
    v5 = objc_msgSend(v4, "length");

  return v5;
}

void __80__BLSHFlipbookFramesHistogram_stream_appendRawHistogram_withLabel_headingBlock___block_invoke_4(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  id v6;
  _QWORD v7[4];
  id v8;
  id v9;
  id v10;
  __int128 v11;

  v3 = a2;
  objc_msgSend(v3, "appendFormat:", CFSTR("|"));
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __80__BLSHFlipbookFramesHistogram_stream_appendRawHistogram_withLabel_headingBlock___block_invoke_5;
  v7[3] = &unk_24D1BD6F8;
  v11 = *(_OWORD *)(a1 + 56);
  v4 = *(void **)(a1 + 32);
  v5 = *(id *)(a1 + 40);
  v8 = v3;
  v9 = v5;
  v10 = *(id *)(a1 + 48);
  v6 = v3;
  objc_msgSend(v4, "enumerateObjectsUsingBlock:", v7);

}

void __80__BLSHFlipbookFramesHistogram_stream_appendRawHistogram_withLabel_headingBlock___block_invoke_5(_QWORD *a1, void *a2, unint64_t a3)
{
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  id v9;
  void *v10;

  v5 = a2;
  if (*(_QWORD *)(*(_QWORD *)(a1[7] + 8) + 24) <= a3 && *(_QWORD *)(*(_QWORD *)(a1[8] + 8) + 24) >= a3)
  {
    v10 = v5;
    (*(void (**)(void))(a1[5] + 16))();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (void *)a1[4];
    v8 = (*(uint64_t (**)(_QWORD, void *, uint64_t))(a1[6] + 16))(a1[6], v6, objc_msgSend(v10, "unsignedIntegerValue"));
    v9 = objc_retainAutorelease(v6);
    objc_msgSend(v7, "appendFormat:", CFSTR(" %*s |"), v8, objc_msgSend(v9, "UTF8String"));

    v5 = v10;
  }

}

void __80__BLSHFlipbookFramesHistogram_stream_appendRawHistogram_withLabel_headingBlock___block_invoke_6(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  _QWORD v6[4];
  id v7;
  id v8;
  id v9;
  __int128 v10;

  v3 = a2;
  objc_msgSend(v3, "appendFormat:", CFSTR("|"));
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __80__BLSHFlipbookFramesHistogram_stream_appendRawHistogram_withLabel_headingBlock___block_invoke_7;
  v6[3] = &unk_24D1BD748;
  v10 = *(_OWORD *)(a1 + 56);
  v7 = v3;
  v4 = *(void **)(a1 + 32);
  v8 = *(id *)(a1 + 40);
  v9 = *(id *)(a1 + 48);
  v5 = v3;
  objc_msgSend(v4, "enumerateObjectsUsingBlock:", v6);

}

void __80__BLSHFlipbookFramesHistogram_stream_appendRawHistogram_withLabel_headingBlock___block_invoke_7(_QWORD *a1, void *a2, unint64_t a3)
{
  id v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  id v10;

  v5 = a2;
  if (*(_QWORD *)(*(_QWORD *)(a1[7] + 8) + 24) <= a3 && *(_QWORD *)(*(_QWORD *)(a1[8] + 8) + 24) >= a3)
  {
    v10 = v5;
    v6 = objc_msgSend(v5, "unsignedIntegerValue");
    v7 = (void *)a1[4];
    v8 = a1[5];
    (*(void (**)(void))(a1[6] + 16))();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "appendFormat:", CFSTR(" %*u |"), (*(uint64_t (**)(uint64_t, void *, uint64_t))(v8 + 16))(v8, v9, v6), v6);

    v5 = v10;
  }

}

- (unint64_t)totalCount
{
  return self->_totalCount;
}

- (double)averagePresentationTimeFromNow
{
  return self->_averagePresentationTimeFromNow;
}

- (double)medianPresentationTimeFromNow
{
  return self->_medianPresentationTimeFromNow;
}

- (NSArray)presentationTimeHistogram
{
  return self->_presentationTimeHistogram;
}

- (double)intervalUntilFirstFrame
{
  return self->_intervalUntilFirstFrame;
}

- (double)presentationDuration
{
  return self->_presentationDuration;
}

- (unint64_t)memoryUsage
{
  return self->_memoryUsage;
}

- (unint64_t)averageMemoryUsage
{
  return self->_averageMemoryUsage;
}

- (unint64_t)medianMemoryUsage
{
  return self->_medianMemoryUsage;
}

- (NSArray)memoryUsageHistogram
{
  return self->_memoryUsageHistogram;
}

- (float)lowestAPL
{
  return self->_lowestAPL;
}

- (float)averageAPL
{
  return self->_averageAPL;
}

- (float)medianAPL
{
  return self->_medianAPL;
}

- (float)highestAPL
{
  return self->_highestAPL;
}

- (float)lowestAPLDimming
{
  return self->_lowestAPLDimming;
}

- (float)averageAPLDimming
{
  return self->_averageAPLDimming;
}

- (float)medianAPLDimming
{
  return self->_medianAPLDimming;
}

- (float)highestAPLDimming
{
  return self->_highestAPLDimming;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_memoryUsageHistogram, 0);
  objc_storeStrong((id *)&self->_presentationTimeHistogram, 0);
}

- (void)initWithTotalCount:(uint64_t)a3 averagePresentationTimeFromNow:medianPresentationTimeFromNow:presentationTimeHistogram:intervalUntilFirstFrame:presentationDuration:memoryUsage:averageMemoryUsage:medianMemoryUsage:memoryUsageHistogram:lowestAPL:averageAPL:medianAPL:highestAPL:lowestAPLDimming:averageAPLDimming:medianAPLDimming:highestAPLDimming:.cold.1(const char *a1, uint64_t a2, uint64_t a3)
{
  void *v5;
  objc_class *v6;
  void *v7;
  int v8;
  void *v9;
  __int16 v10;
  void *v11;
  __int16 v12;
  uint64_t v13;
  __int16 v14;
  const __CFString *v15;
  __int16 v16;
  int v17;
  __int16 v18;
  uint64_t v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  NSStringFromSelector(a1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (objc_class *)objc_opt_class();
  NSStringFromClass(v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = 138544642;
  v9 = v5;
  v10 = 2114;
  v11 = v7;
  v12 = 2048;
  v13 = a2;
  v14 = 2114;
  v15 = CFSTR("BLSHFlipbookFramesHistogram.m");
  v16 = 1024;
  v17 = 178;
  v18 = 2114;
  v19 = a3;
  _os_log_error_impl(&dword_2145AC000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", (uint8_t *)&v8, 0x3Au);

}

@end
