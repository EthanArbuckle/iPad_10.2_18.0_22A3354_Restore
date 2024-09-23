@implementation HMCameraRecordingReachabilityEvent(HFDebugging)

- (id)hf_stateDumpBuilderWithContext:()HFDebugging
{
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
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

  +[HFStateDumpBuilder builderWithObject:context:](HFStateDumpBuilder, "builderWithObject:context:", a1, a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "uniqueIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "appendObject:withName:options:", v5, CFSTR("UUID"), 2);

  v6 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(a1, "duration");
  objc_msgSend(v6, "stringWithFormat:", CFSTR("%.2f"), v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v8, CFSTR("duration"));

  objc_msgSend(v4, "appendBool:withName:", objc_msgSend(a1, "isReachable"), CFSTR("reachable"));
  objc_msgSend(a1, "dateOfOccurrence");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  +[HFCameraUtilities dayStringFromDate:](HFCameraUtilities, "dayStringFromDate:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(a1, "dateOfOccurrence");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  +[HFCameraUtilities fullTimeStringFromDate:](HFCameraUtilities, "fullTimeStringFromDate:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(a1, "dateOfOccurrence");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "duration");
  objc_msgSend(v13, "dateByAddingTimeInterval:");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  +[HFCameraUtilities dayStringFromDate:](HFCameraUtilities, "dayStringFromDate:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  +[HFCameraUtilities fullTimeStringFromDate:](HFCameraUtilities, "fullTimeStringFromDate:", v14);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@ %@ - %@ %@"), v10, v12, v15, v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v17, CFSTR("dateRange"));

  return v4;
}

@end
