@implementation HMSoftwareUpdate(HFDebugging)

- (id)hf_stateDumpBuilderWithContext:()HFDebugging
{
  id v4;
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

  v4 = a3;
  +[HFStateDumpBuilder builderWithObject:context:](HFStateDumpBuilder, "builderWithObject:context:", a1, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromHMSoftwareUpdateState(objc_msgSend(a1, "state"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v6, CFSTR("state"));

  objc_msgSend(a1, "version");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v7, CFSTR("version"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", objc_msgSend(a1, "downloadSize"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v8, CFSTR("downloadSize"));

  if (objc_msgSend(v4, "detailLevel"))
  {
    objc_msgSend(a1, "documentation");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v9, CFSTR("documentation"));

  }
  else
  {
    objc_msgSend(v5, "appendBool:withName:", objc_msgSend(a1, "isDocumentationAvailable"), CFSTR("documentationAvailable"));
  }
  objc_msgSend(a1, "releaseDate");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "appendObject:withName:options:", v10, CFSTR("releaseDate"), 1);

  if (objc_msgSend(v4, "detailLevel") == 2)
  {
    objc_msgSend(a1, "updateType");
    HMSoftwareUpdateUpdateTypeToString();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v11, CFSTR("updateType"));

    v12 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(a1, "delegate");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "stringWithFormat:", CFSTR("%p"), v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v14, CFSTR("delegate"));

  }
  return v5;
}

@end
