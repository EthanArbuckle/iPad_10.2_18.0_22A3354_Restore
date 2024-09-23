@implementation HMCameraClip(HFDebugging)

- (id)hf_stateDumpBuilderWithContext:()HFDebugging
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
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

  v4 = a3;
  +[HFStateDumpBuilder builderWithObject:context:](HFStateDumpBuilder, "builderWithObject:context:", a1, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "uniqueIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "appendObject:withName:options:", v6, CFSTR("UUID"), 2);

  v7 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(a1, "duration");
  objc_msgSend(v7, "stringWithFormat:", CFSTR("%.2f"), v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v9, CFSTR("duration"));

  objc_msgSend(v5, "appendBool:withName:ifEqualTo:", objc_msgSend(a1, "isComplete"), CFSTR("isComplete"), 0);
  objc_msgSend(a1, "quality");
  HMStringFromCameraClipQuality();
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "appendObject:withName:", v10, CFSTR("quality"));

  objc_msgSend(a1, "startDate");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  +[HFCameraUtilities dayStringFromDate:](HFCameraUtilities, "dayStringFromDate:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(a1, "startDate");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  +[HFCameraUtilities fullTimeStringFromDate:](HFCameraUtilities, "fullTimeStringFromDate:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(a1, "startDate");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "duration");
  objc_msgSend(v15, "dateByAddingTimeInterval:");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  +[HFCameraUtilities dayStringFromDate:](HFCameraUtilities, "dayStringFromDate:", v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  +[HFCameraUtilities fullTimeStringFromDate:](HFCameraUtilities, "fullTimeStringFromDate:", v16);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@ %@ - %@ %@"), v12, v14, v17, v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v19, CFSTR("dateRange"));

  objc_msgSend(a1, "significantEvents");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "na_map:", &__block_literal_global_487);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v21, "allObjects");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "componentsJoinedByString:", CFSTR(","));
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "appendObject:withName:context:options:", v23, CFSTR("significantEvents"), v4, 1);

  return v5;
}

@end
