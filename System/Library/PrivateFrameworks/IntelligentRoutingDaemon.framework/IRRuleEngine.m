@implementation IRRuleEngine

- (IRRuleEngine)init
{
  __assert_rtn("-[IRRuleEngine init]", "IRRuleEngine.m", 16, "NO");
}

+ (id)new
{
  __assert_rtn("+[IRRuleEngine new]", "IRRuleEngine.m", 21, "NO");
}

+ (id)executeRules:(id)a3 withCandiatesContainer:(id)a4 systemStatus:(id)a5 historyEventsContainer:(id)a6 miloPrediction:(id)a7 nearbyDeviceContainer:(id)a8 date:(id)a9
{
  id v14;
  id v15;
  id v16;
  id v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t i;
  uint64_t v23;
  void *v24;
  void *v25;
  id obj;
  id v28;
  id v29;
  id v30;
  id v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  _BYTE v36[128];
  uint64_t v37;

  v37 = *MEMORY[0x24BDAC8D0];
  v14 = a3;
  v31 = a4;
  v30 = a5;
  v29 = a6;
  v15 = a7;
  v16 = a8;
  v17 = a9;
  v28 = (id)objc_opt_new();
  v32 = 0u;
  v33 = 0u;
  v34 = 0u;
  v35 = 0u;
  v18 = v14;
  objc_msgSend(v14, "allKeys");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v19 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v32, v36, 16);
  if (v19)
  {
    v20 = v19;
    v21 = *(_QWORD *)v33;
    do
    {
      for (i = 0; i != v20; ++i)
      {
        if (*(_QWORD *)v33 != v21)
          objc_enumerationMutation(obj);
        v23 = *(_QWORD *)(*((_QWORD *)&v32 + 1) + 8 * i);
        objc_msgSend(v18, "objectForKey:", v23);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "executeRuleWithCandiatesContainer:systemStatus:historyContainer:miloPrediction:nearbyDeviceContainer:date:", v31, v30, v29, v15, v16, v17);
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v28, "setObject:forKey:", v25, v23);

      }
      v20 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v32, v36, 16);
    }
    while (v20);
  }

  return v28;
}

@end
