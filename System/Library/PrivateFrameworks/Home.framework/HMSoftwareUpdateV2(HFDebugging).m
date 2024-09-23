@implementation HMSoftwareUpdateV2(HFDebugging)

- (id)hf_stateDumpBuilderWithContext:()HFDebugging
{
  id v4;
  void *v5;
  unint64_t updated;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;

  v4 = a3;
  +[HFStateDumpBuilder builderWithObject:context:](HFStateDumpBuilder, "builderWithObject:context:", a1, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  updated = HMSoftwareUpdateStateFromHMSoftwareUpdateStatusV2(objc_msgSend(a1, "status"));
  v7 = (void *)MEMORY[0x1E0CB3940];
  NSStringFromHMSoftwareUpdateStatusV2(objc_msgSend(a1, "status"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromHMSoftwareUpdateState(updated);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "stringWithFormat:", CFSTR("%@ -> %@"), v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v10, CFSTR("status"));

  objc_msgSend(a1, "error");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "appendObject:withName:options:", v11, CFSTR("error"), 1);

  objc_msgSend(a1, "documentationMetadata");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "appendBool:withName:", v12 != 0, CFSTR("documentationMetadata"));

  objc_msgSend(a1, "version");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v13, CFSTR("version"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(a1, "downloadSize"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v14, CFSTR("downloadSize"));

  v15 = objc_msgSend(v4, "detailLevel");
  if (v15 == 2)
  {
    objc_msgSend(a1, "documentationMetadata");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v16, CFSTR("documentationMetadata"));

    objc_msgSend(a1, "humanReadableUpdateName");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v17, CFSTR("humanReadableUpdateName"));

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(a1, "rampFeatureEnabledOnServer"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v18, CFSTR("rampFeatureEnabledOnServer"));

  }
  return v5;
}

@end
