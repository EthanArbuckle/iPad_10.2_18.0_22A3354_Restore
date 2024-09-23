@implementation HMMTRAttributeReportDistributor

- (HMMTRAttributeReportDistributor)init
{
  HMMTRAttributeReportDistributor *v2;
  uint64_t v3;
  NSMutableDictionary *receivers;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)HMMTRAttributeReportDistributor;
  v2 = -[HMMTRAttributeReportDistributor init](&v6, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v3 = objc_claimAutoreleasedReturnValue();
    receivers = v2->_receivers;
    v2->_receivers = (NSMutableDictionary *)v3;

  }
  return v2;
}

- (id)registerHandlerForAttributePath:(id)a3 queue:(id)a4 handler:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  HMMTRAttributeReportDistributorRegistry *v15;
  void *v16;
  void *v17;

  v8 = a3;
  v9 = a5;
  v10 = a4;
  -[HMMTRAttributeReportDistributor receivers](self, "receivers");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "objectForKeyedSubscript:", v8);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v12)
  {
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMMTRAttributeReportDistributor receivers](self, "receivers");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setObject:forKeyedSubscript:", v13, v8);

  }
  v15 = -[HMMTRAttributeReportDistributorRegistry initWithQueue:receiver:]([HMMTRAttributeReportDistributorRegistry alloc], "initWithQueue:receiver:", v10, v9);

  -[HMMTRAttributeReportDistributor receivers](self, "receivers");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "objectForKeyedSubscript:", v8);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "addObject:", v15);

  if (-[HMMTRAttributeReportDistributor allAttributesReported](self, "allAttributesReported"))
    -[HMMTRAttributeReportDistributor allAttributesReady](self, "allAttributesReady");

  return v15;
}

- (void)deregisterHandlerForAttributePath:(id)a3 registry:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a4;
  v6 = a3;
  -[HMMTRAttributeReportDistributor receivers](self, "receivers");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKeyedSubscript:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
    objc_msgSend(v8, "removeObject:", v9);

}

- (void)distributeAttributeReport:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  void *v17;
  NSObject *v18;
  void *v19;
  id v20;
  _QWORD block[5];
  id v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x24BDDB460]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v6 = v5;
  else
    v6 = 0;
  v7 = v6;

  if (v7)
  {
    -[HMMTRAttributeReportDistributor receivers](self, "receivers");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "objectForKeyedSubscript:", v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (void *)objc_msgSend(v9, "copy");

    if (v10)
    {
      v19 = v10;
      v20 = v7;
      v25 = 0u;
      v26 = 0u;
      v23 = 0u;
      v24 = 0u;
      v11 = v10;
      v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
      if (v12)
      {
        v13 = v12;
        v14 = *(_QWORD *)v24;
        v15 = MEMORY[0x24BDAC760];
        do
        {
          for (i = 0; i != v13; ++i)
          {
            if (*(_QWORD *)v24 != v14)
              objc_enumerationMutation(v11);
            v17 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * i);
            objc_msgSend(v17, "queue", v19, v20);
            v18 = objc_claimAutoreleasedReturnValue();
            block[0] = v15;
            block[1] = 3221225472;
            block[2] = __61__HMMTRAttributeReportDistributor_distributeAttributeReport___block_invoke;
            block[3] = &unk_250F22458;
            block[4] = v17;
            v22 = v4;
            dispatch_async(v18, block);

          }
          v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
        }
        while (v13);
      }

      v10 = v19;
      v7 = v20;
    }

  }
}

- (void)allAttributesReady
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t i;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t j;
  void *v14;
  NSObject *v15;
  uint64_t v16;
  uint64_t v17;
  id obj;
  _QWORD block[5];
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x24BDAC8D0];
  -[HMMTRAttributeReportDistributor setAllAttributesReported:](self, "setAllAttributesReported:", 1);
  -[HMMTRAttributeReportDistributor receivers](self, "receivers");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "copy");

  v26 = 0u;
  v27 = 0u;
  v24 = 0u;
  v25 = 0u;
  obj = v4;
  v17 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v24, v29, 16);
  if (v17)
  {
    v16 = *(_QWORD *)v25;
    v5 = MEMORY[0x24BDAC760];
    do
    {
      for (i = 0; i != v17; ++i)
      {
        if (*(_QWORD *)v25 != v16)
          objc_enumerationMutation(obj);
        objc_msgSend(obj, "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v24 + 1) + 8 * i), v16);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        v8 = (void *)objc_msgSend(v7, "copy");

        v22 = 0u;
        v23 = 0u;
        v20 = 0u;
        v21 = 0u;
        v9 = v8;
        v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v20, v28, 16);
        if (v10)
        {
          v11 = v10;
          v12 = *(_QWORD *)v21;
          do
          {
            for (j = 0; j != v11; ++j)
            {
              if (*(_QWORD *)v21 != v12)
                objc_enumerationMutation(v9);
              v14 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * j);
              objc_msgSend(v14, "queue");
              v15 = objc_claimAutoreleasedReturnValue();
              block[0] = v5;
              block[1] = 3221225472;
              block[2] = __53__HMMTRAttributeReportDistributor_allAttributesReady__block_invoke;
              block[3] = &unk_250F23DF0;
              block[4] = v14;
              dispatch_async(v15, block);

            }
            v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v20, v28, 16);
          }
          while (v11);
        }

      }
      v17 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v24, v29, 16);
    }
    while (v17);
  }

}

- (void)allAttributesNotReady
{
  -[HMMTRAttributeReportDistributor setAllAttributesReported:](self, "setAllAttributesReported:", 0);
}

- (NSMutableDictionary)receivers
{
  return self->_receivers;
}

- (BOOL)allAttributesReported
{
  return self->_allAttributesReported;
}

- (void)setAllAttributesReported:(BOOL)a3
{
  self->_allAttributesReported = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_receivers, 0);
}

void __53__HMMTRAttributeReportDistributor_allAttributesReady__block_invoke(uint64_t a1)
{
  void (**v1)(id, _QWORD);

  objc_msgSend(*(id *)(a1 + 32), "receiver");
  v1 = (void (**)(id, _QWORD))objc_claimAutoreleasedReturnValue();
  v1[2](v1, 0);

}

void __61__HMMTRAttributeReportDistributor_distributeAttributeReport___block_invoke(uint64_t a1)
{
  void (**v2)(id, _QWORD);

  objc_msgSend(*(id *)(a1 + 32), "receiver");
  v2 = (void (**)(id, _QWORD))objc_claimAutoreleasedReturnValue();
  v2[2](v2, *(_QWORD *)(a1 + 40));

}

@end
