@implementation HMRemoteLoginHandler(HFDebugging)

- (id)hf_stateDumpBuilderWithContext:()HFDebugging
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;

  v4 = a3;
  +[HFStateDumpBuilder builderWithObject:context:](HFStateDumpBuilder, "builderWithObject:context:", a1, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "appendBool:withName:ifEqualTo:", objc_msgSend(a1, "isControllable"), CFSTR("controllable"), 0);
  objc_msgSend(v5, "appendBool:withName:ifEqualTo:", objc_msgSend(a1, "isSessionInProgress"), CFSTR("sessionInProgress"), 1);
  v6 = objc_msgSend(v4, "detailLevel");

  if (v6 == 2)
  {
    objc_msgSend(a1, "loggedInAccount");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v7, CFSTR("loggedInAccount"));

    objc_msgSend(a1, "anisetteDataProvider");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v8, CFSTR("anisetteDataProvider"));

  }
  return v5;
}

@end
