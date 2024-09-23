@implementation CFXActionLogging

+ (NSNumber)remainingMemory
{
  return (NSNumber *)objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", MEMORY[0x2276A20D4](a1, a2));
}

+ (id)actionLogAsStringForEvent:(id)a3 atLocation:(id)a4 withEffectStack:(id)a5
{
  void *v5;
  void *v6;
  void *v7;

  v5 = (void *)MEMORY[0x24BDD17C8];
  objc_msgSend(a1, "CFX_actionLogDictionaryWithEvent:atLocation:withEffectStack:", a3, a4, a5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringWithFormat:", CFSTR("%@"), v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

+ (id)actionLogAsJSONForEvent:(id)a3 atLocation:(id)a4 withEffectStack:(id)a5
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v10;

  v5 = (void *)MEMORY[0x24BDD1608];
  objc_msgSend(a1, "CFX_actionLogDictionaryWithEvent:atLocation:withEffectStack:", a3, a4, a5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = 0;
  objc_msgSend(v5, "dataWithJSONObject:options:error:", v6, 1, &v10);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
    v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithData:encoding:", v7, 4);
  else
    v8 = 0;

  return v8;
}

+ (id)CFX_actionLogDictionaryWithEvent:(id)a3 atLocation:(id)a4 withEffectStack:(id)a5
{
  id v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  id v24;
  id v25;
  id v26;
  id obj;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _QWORD v32[4];
  _QWORD v33[4];
  _QWORD v34[3];
  _QWORD v35[3];
  _QWORD v36[4];
  _QWORD v37[4];
  _BYTE v38[128];
  uint64_t v39;

  v24 = a1;
  v39 = *MEMORY[0x24BDAC8D0];
  v26 = a3;
  v25 = a4;
  v7 = a5;
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  obj = v7;
  v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v28, v38, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v29;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v29 != v11)
          objc_enumerationMutation(obj);
        v13 = *(void **)(*((_QWORD *)&v28 + 1) + 8 * i);
        NSStringFromJFXEffectType(objc_msgSend(v13, "type", v24));
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "displayName");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "effectID");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v13, "type") == 2)
        {
          v17 = v13;
          objc_msgSend(v17, "trackingProps");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          NSStringFromJFXTrackingType(objc_msgSend(v18, "trackingType"));
          v19 = (void *)objc_claimAutoreleasedReturnValue();

          v36[0] = CFSTR("effectType");
          v36[1] = CFSTR("name");
          v37[0] = v14;
          v37[1] = v15;
          v36[2] = CFSTR("ID");
          v36[3] = CFSTR("track-type");
          v37[2] = v16;
          v37[3] = v19;
          objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v37, v36, 4);
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "addObject:", v20);

        }
        else
        {
          v34[0] = CFSTR("effectType");
          v34[1] = CFSTR("name");
          v35[0] = v14;
          v35[1] = v15;
          v34[2] = CFSTR("ID");
          v35[2] = v16;
          objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v35, v34, 3);
          v17 = (id)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "addObject:", v17);
        }

      }
      v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v28, v38, 16);
    }
    while (v10);
  }

  v33[0] = v26;
  v32[0] = CFSTR("event");
  v32[1] = CFSTR("memoryRemaining");
  objc_msgSend(v24, "remainingMemory");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v33[1] = v21;
  v33[2] = v25;
  v32[2] = CFSTR("view");
  v32[3] = CFSTR("effectsApplied");
  v33[3] = v8;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v33, v32, 4);
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  return v22;
}

@end
