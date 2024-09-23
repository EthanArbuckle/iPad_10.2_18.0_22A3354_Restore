@implementation MTMediaActivityEventHandler

- (void)didCreateMetricsData:(id)a3
{
  id v4;
  objc_super v5;

  v4 = a3;
  objc_msgSend(v4, "addPostProcessingBlock:", &__block_literal_global_4);
  v5.receiver = self;
  v5.super_class = (Class)MTMediaActivityEventHandler;
  -[MTEventHandler didCreateMetricsData:](&v5, sel_didCreateMetricsData_, v4);

}

void __52__MTMediaActivityEventHandler_didCreateMetricsData___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v2 = a2;
  if (_block_invoke_onceToken != -1)
    dispatch_once(&_block_invoke_onceToken, &__block_literal_global_2);
  v14 = 0u;
  v15 = 0u;
  v12 = 0u;
  v13 = 0u;
  v3 = (id)_block_invoke_mediaTimeFieldNames;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v13;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v13 != v6)
          objc_enumerationMutation(v3);
        v8 = *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * i);
        objc_msgSend(v2, "objectForKeyedSubscript:", v8, (_QWORD)v12);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", objc_msgSend(v9, "unsignedLongLongValue"));
          v10 = objc_claimAutoreleasedReturnValue();
        }
        else
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
            goto LABEL_13;
          objc_msgSend((id)_block_invoke_numberFormatter, "numberFromString:", v9);
          v10 = objc_claimAutoreleasedReturnValue();
        }
        v11 = (void *)v10;
        objc_msgSend(v2, "setObject:forKeyedSubscript:", v10, v8);

LABEL_13:
      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v5);
  }

}

void __52__MTMediaActivityEventHandler_didCreateMetricsData___block_invoke_2()
{
  uint64_t v0;
  void *v1;
  id v2;
  void *v3;
  _QWORD v4[9];

  v4[8] = *MEMORY[0x24BDAC8D0];
  v4[0] = CFSTR("startTime");
  v4[1] = CFSTR("length");
  v4[4] = CFSTR("startPosition");
  v4[5] = CFSTR("startOverallPosition");
  v4[2] = CFSTR("position");
  v4[3] = CFSTR("overallPosition");
  v4[6] = CFSTR("duration");
  v4[7] = CFSTR("overallPosition");
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v4, 8);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)_block_invoke_mediaTimeFieldNames;
  _block_invoke_mediaTimeFieldNames = v0;

  v2 = objc_alloc_init(MEMORY[0x24BDD16F0]);
  v3 = (void *)_block_invoke_numberFormatter;
  _block_invoke_numberFormatter = (uint64_t)v2;

}

- (id)metricsDataForStartActionWithPosition:(unint64_t)a3 overallPosition:(unint64_t)a4 type:(id)a5 reason:(id)a6 eventData:(id)a7
{
  id v12;
  id v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  objc_super v23;
  _QWORD v24[4];
  _QWORD v25[5];

  v25[4] = *MEMORY[0x24BDAC8D0];
  v12 = a5;
  v13 = a6;
  v24[0] = CFSTR("position");
  v14 = (void *)MEMORY[0x24BDD16E0];
  v15 = a7;
  objc_msgSend(v14, "numberWithLongLong:", a3);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v25[0] = v16;
  v24[1] = CFSTR("overallPosition");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", a4);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v25[1] = v17;
  v24[2] = CFSTR("startType");
  v18 = v12;
  if (!v12)
  {
    objc_msgSend(MEMORY[0x24BDBCEF8], "null");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v25[2] = v18;
  v24[3] = CFSTR("startReason");
  v19 = v13;
  if (!v13)
  {
    objc_msgSend(MEMORY[0x24BDBCEF8], "null");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v25[3] = v19;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v25, v24, 4);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v13)
  {

    if (v12)
      goto LABEL_7;
LABEL_9:

    goto LABEL_7;
  }
  if (!v12)
    goto LABEL_9;
LABEL_7:

  v23.receiver = self;
  v23.super_class = (Class)MTMediaActivityEventHandler;
  -[MTEventHandler metricsDataWithFields:](&v23, sel_metricsDataWithFields_, v20, v15, 0);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  return v21;
}

- (id)metricsDataForStopActionWithPosition:(unint64_t)a3 overallPosition:(unint64_t)a4 type:(id)a5 reason:(id)a6 startMetricsData:(id)a7 eventData:(id)a8
{
  id v14;
  id v15;
  void *v16;
  id v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  _QWORD v28[5];
  _QWORD v29[4];
  _QWORD v30[5];

  v30[4] = *MEMORY[0x24BDAC8D0];
  v14 = a5;
  v15 = a6;
  v29[0] = CFSTR("position");
  v16 = (void *)MEMORY[0x24BDD16E0];
  v17 = a8;
  v18 = a7;
  objc_msgSend(v16, "numberWithLongLong:", a3);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v30[0] = v19;
  v29[1] = CFSTR("overallPosition");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", a4);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v30[1] = v20;
  v29[2] = CFSTR("stopType");
  v21 = v14;
  if (!v14)
  {
    objc_msgSend(MEMORY[0x24BDBCEF8], "null");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v30[2] = v21;
  v29[3] = CFSTR("stopReason");
  v22 = v15;
  if (!v15)
  {
    objc_msgSend(MEMORY[0x24BDBCEF8], "null");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v30[3] = v22;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v30, v29, 4);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v15)
  {

    if (v14)
      goto LABEL_7;
LABEL_9:

    goto LABEL_7;
  }
  if (!v14)
    goto LABEL_9;
LABEL_7:

  objc_msgSend(v18, "toDictionary");
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  v28[0] = MEMORY[0x24BDAC760];
  v28[1] = 3221225472;
  v28[2] = __123__MTMediaActivityEventHandler_metricsDataForStopActionWithPosition_overallPosition_type_reason_startMetricsData_eventData___block_invoke;
  v28[3] = &unk_24C7A03D0;
  v28[4] = self;
  objc_msgSend(v24, "thenWithBlock:", v28);
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  -[MTEventHandler metricsDataWithFields:](self, "metricsDataWithFields:", v25, v23, v17, 0);
  v26 = (void *)objc_claimAutoreleasedReturnValue();

  return v26;
}

id __123__MTMediaActivityEventHandler_metricsDataForStopActionWithPosition_overallPosition_type_reason_startMetricsData_eventData___block_invoke(uint64_t a1, void *a2)
{
  id v3;
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
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  int v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;

  v3 = a2;
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("startType"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("startType"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v6, CFSTR("startType"));

  }
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("startReason"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("startReason"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v8, CFSTR("startReason"));

  }
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("startReasonType"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("startReasonType"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v10, CFSTR("startReasonType"));

  }
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("eventTime"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("eventTime"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v12, CFSTR("startTime"));

  }
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("position"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13)
  {
    objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("position"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v14, CFSTR("startPosition"));

  }
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("overallPosition"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (v15)
  {
    objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("overallPosition"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v16, CFSTR("startOverallPosition"));

  }
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("assetId"));
  v17 = objc_claimAutoreleasedReturnValue();
  if (v17)
  {
    v18 = (void *)v17;
    objc_msgSend(*(id *)(a1 + 32), "registeredName");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = objc_msgSend(v19, "isEqualToString:", CFSTR("seekStop"));

    if (v20)
    {
      objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("assetId"));
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKeyedSubscript:", v21, CFSTR("startAssetId"));

    }
  }
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("dsId"));
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  if (v22)
  {
    objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("dsId"));
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v23, CFSTR("dsId"));

  }
  v24 = (void *)objc_msgSend(v4, "copy");
  +[MTPromise promiseWithResult:](MTPromise, "promiseWithResult:", v24);
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  return v25;
}

- (id)knownFields
{
  void *v3;
  char v4;
  void *v5;
  void *v6;
  void *v7;
  objc_super v9;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x24BDAC8D0];
  -[MTEventDataProvider delegate](self, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_opt_respondsToSelector();

  if ((v4 & 1) != 0)
  {
    -[MTEventDataProvider delegate](self, "delegate");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "knownFields");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v9.receiver = self;
    v9.super_class = (Class)MTMediaActivityEventHandler;
    -[MTEventHandler knownFields](&v9, sel_knownFields);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v10[0] = CFSTR("actionType");
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v10, 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "arrayByAddingObjectsFromArray:", v7);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v6;
}

- (id)eventVersion:(id)a3
{
  void *v3;
  void *v4;
  id v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)MTMediaActivityEventHandler;
  -[MTEventHandler eventVersion:](&v7, sel_eventVersion_, a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (!v3)
    v3 = &unk_24C7B8250;
  v5 = v3;

  return v5;
}

@end
