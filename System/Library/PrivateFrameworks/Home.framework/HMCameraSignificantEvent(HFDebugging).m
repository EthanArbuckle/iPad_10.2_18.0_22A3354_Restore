@implementation HMCameraSignificantEvent(HFDebugging)

- (id)hf_stateDumpBuilderWithContext:()HFDebugging
{
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

  +[HFStateDumpBuilder builderWithObject:context:](HFStateDumpBuilder, "builderWithObject:context:", a1, a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "uniqueIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "appendObject:withName:options:", v5, CFSTR("UUID"), 2);

  objc_msgSend(a1, "hf_reasonKey");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "appendObject:withName:", v6, CFSTR("reason"));

  objc_msgSend(a1, "hf_faceClassificationName");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "appendObject:withName:options:", v7, CFSTR("faceName"), 1);

  objc_msgSend(a1, "dateOfOccurrence");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  +[HFCameraUtilities dayStringFromDate:](HFCameraUtilities, "dayStringFromDate:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(a1, "dateOfOccurrence");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  +[HFCameraUtilities fullTimeStringFromDate:](HFCameraUtilities, "fullTimeStringFromDate:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(a1, "dateOfOccurrence");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "stringWithFormat:", CFSTR("%@ %@ (%@)"), v9, v11, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v14, CFSTR("date"));

  return v4;
}

@end
