@implementation WFPocketGetAction

- (void)runAsynchronouslyWithInput:(id)a3
{
  void *v4;
  unint64_t v5;
  void *v6;
  __CFString *v7;
  __CFString *v8;
  const __CFString *v9;
  int v10;
  uint64_t v11;
  void *v12;
  const __CFString *v13;
  const __CFString *v14;
  void *v15;
  void *v16;
  _QWORD v17[5];
  _QWORD v18[6];

  v18[5] = *MEMORY[0x24BDAC8D0];
  -[WFPocketGetAction parameterValueForKey:ofClass:](self, "parameterValueForKey:ofClass:", CFSTR("WFPocketItemCount"), objc_opt_class());
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "integerValue");

  -[WFPocketGetAction parameterValueForKey:ofClass:](self, "parameterValueForKey:ofClass:", CFSTR("WFPocketItemState"), objc_opt_class());
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFPocketGetAction parameterValueForKey:ofClass:](self, "parameterValueForKey:ofClass:", CFSTR("WFPocketItemSearchTerm"), objc_opt_class());
  v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
  -[WFPocketGetAction parameterValueForKey:ofClass:](self, "parameterValueForKey:ofClass:", CFSTR("WFPocketItemSearchTags"), objc_opt_class());
  v8 = (__CFString *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "isEqualToString:", CFSTR("Unread")))
  {

    v9 = CFSTR("unread");
  }
  else
  {
    v10 = objc_msgSend(v6, "isEqualToString:", CFSTR("Archived"));

    if (v10)
      v9 = CFSTR("archive");
    else
      v9 = CFSTR("all");
  }
  if (v5 <= 1)
    v11 = 1;
  else
    v11 = v5;
  v17[0] = CFSTR("count");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v18[0] = v12;
  v18[1] = v9;
  v13 = &stru_24F8BBA48;
  v17[1] = CFSTR("state");
  v17[2] = CFSTR("search");
  if (v7)
    v14 = v7;
  else
    v14 = &stru_24F8BBA48;
  if (v8)
    v13 = v8;
  v18[2] = v14;
  v18[3] = v13;
  v17[3] = CFSTR("tag");
  v17[4] = CFSTR("detailType");
  v18[4] = CFSTR("simple");
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v18, v17, 5);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  +[PocketAPI sharedAPI](PocketAPI, "sharedAPI");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "callAPIMethod:withHTTPMethod:arguments:delegate:", CFSTR("get"), 1, v15, self);

}

- (void)pocketAPI:(id)a3 receivedResponse:(id)a4 forAPIMethod:(id)a5 error:(id)a6
{
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _BYTE v30[128];
  uint64_t v31;
  _QWORD v32[3];

  v32[1] = *MEMORY[0x24BDAC8D0];
  if (a6)
  {
    -[WFPocketGetAction finishRunningWithError:](self, "finishRunningWithError:", a6, a4, a5);
  }
  else
  {
    objc_msgSend(a4, "objectForKey:", CFSTR("list"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v6, "count"))
    {
      v28 = 0u;
      v29 = 0u;
      v26 = 0u;
      v27 = 0u;
      v24 = v6;
      objc_msgSend(v6, "allValues");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
      if (v8)
      {
        v9 = v8;
        v10 = *(_QWORD *)v27;
        do
        {
          for (i = 0; i != v9; ++i)
          {
            if (*(_QWORD *)v27 != v10)
              objc_enumerationMutation(v7);
            v12 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * i);
            v13 = (void *)MEMORY[0x24BDBCF48];
            objc_msgSend(v12, "objectForKey:", CFSTR("resolved_url"));
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v13, "URLWithString:", v14);
            v15 = (void *)objc_claimAutoreleasedReturnValue();

            if (v15)
            {
              -[WFPocketGetAction output](self, "output");
              v16 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v12, "objectForKey:", CFSTR("resolved_title"));
              v17 = (void *)objc_claimAutoreleasedReturnValue();
              if (v17)
              {
                objc_msgSend(v16, "addObject:named:", v15, v17);
              }
              else
              {
                objc_msgSend(v12, "objectForKey:", CFSTR("given_title"));
                v18 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v16, "addObject:named:", v15, v18);

              }
            }

          }
          v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
        }
        while (v9);
      }

      -[WFPocketGetAction finishRunningWithError:](self, "finishRunningWithError:", 0);
      v6 = v24;
    }
    else
    {
      v19 = (void *)MEMORY[0x24BDD1540];
      v20 = *MEMORY[0x24BDD1308];
      v31 = *MEMORY[0x24BDD0FC8];
      WFLocalizedString(CFSTR("No items matching the specified criteria were found in Pocket."));
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v32[0] = v21;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v32, &v31, 1);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "errorWithDomain:code:userInfo:", v20, -1100, v22);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      -[WFPocketGetAction finishRunningWithError:](self, "finishRunningWithError:", v23);

    }
  }
}

@end
