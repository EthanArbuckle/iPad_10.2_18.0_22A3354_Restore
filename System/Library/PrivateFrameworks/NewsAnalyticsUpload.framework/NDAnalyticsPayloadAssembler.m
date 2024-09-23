@implementation NDAnalyticsPayloadAssembler

- (NDAnalyticsPayloadAssembler)init
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  id v6;
  uint8_t buf[4];
  const char *v8;
  __int16 v9;
  char *v10;
  __int16 v11;
  int v12;
  __int16 v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
  {
    v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithFormat:", CFSTR("Do not call method"));
    *(_DWORD *)buf = 136315906;
    v8 = "-[NDAnalyticsPayloadAssembler init]";
    v9 = 2080;
    v10 = "NDAnalyticsPayloadAssembler.m";
    v11 = 1024;
    v12 = 38;
    v13 = 2114;
    v14 = v2;
    _os_log_error_impl(&dword_214674000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

  }
  v3 = (void *)MEMORY[0x24BDBCE88];
  v4 = *MEMORY[0x24BDBCAB0];
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@: %s"), CFSTR("Do not call method"), "-[NDAnalyticsPayloadAssembler init]");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "exceptionWithName:reason:userInfo:", v4, v5, 0);
  v6 = (id)objc_claimAutoreleasedReturnValue();

  objc_exception_throw(v6);
}

- (NDAnalyticsPayloadAssembler)initWithConfigProvider:(id)a3 maxPayloadSize:(unint64_t)a4
{
  id v7;
  NDAnalyticsPayloadAssembler *v8;
  NDAnalyticsPayloadAssembler *v9;
  objc_super v11;

  v7 = a3;
  if (!v7 && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    -[NDAnalyticsPayloadAssembler initWithConfigProvider:maxPayloadSize:].cold.1();
  v11.receiver = self;
  v11.super_class = (Class)NDAnalyticsPayloadAssembler;
  v8 = -[NDAnalyticsPayloadAssembler init](&v11, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_configProvider, a3);
    v9->_maxPayloadSize = a4;
  }

  return v9;
}

- (void)determinePayloadDeliveryWindowForEntries:(id)a3 withLastUploadDatesByContentType:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  _QWORD v14[4];
  id v15;
  id v16;
  id v17;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (!v8 && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
  {
    -[NDAnalyticsPayloadAssembler determinePayloadDeliveryWindowForEntries:withLastUploadDatesByContentType:completion:].cold.3();
    if (v9)
      goto LABEL_6;
  }
  else if (v9)
  {
    goto LABEL_6;
  }
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    -[NDAnalyticsPayloadAssembler determinePayloadDeliveryWindowForEntries:withLastUploadDatesByContentType:completion:].cold.2();
LABEL_6:
  if (!v10 && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    -[NDAnalyticsPayloadAssembler determinePayloadDeliveryWindowForEntries:withLastUploadDatesByContentType:completion:].cold.1();
  v14[0] = MEMORY[0x24BDAC760];
  v14[1] = 3221225472;
  v14[2] = __116__NDAnalyticsPayloadAssembler_determinePayloadDeliveryWindowForEntries_withLastUploadDatesByContentType_completion___block_invoke;
  v14[3] = &unk_24D1DEED8;
  v16 = v9;
  v17 = v10;
  v15 = v8;
  v11 = v9;
  v12 = v8;
  v13 = v10;
  -[NDAnalyticsPayloadAssembler _fetchAnalyticsEnvelopeContentTypeConfigsWithCompletion:](self, "_fetchAnalyticsEnvelopeContentTypeConfigsWithCompletion:", v14);

}

void __116__NDAnalyticsPayloadAssembler_determinePayloadDeliveryWindowForEntries_withLastUploadDatesByContentType_completion___block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  uint64_t v19;
  void *v20;
  id v21;
  _QWORD v22[4];
  id v23;
  id v24;
  uint64_t *v25;
  uint64_t *v26;
  uint64_t v27;
  uint64_t *v28;
  uint64_t v29;
  uint64_t (*v30)(uint64_t, uint64_t);
  void (*v31)(uint64_t);
  id v32;
  uint64_t v33;
  uint64_t *v34;
  uint64_t v35;
  uint64_t (*v36)(uint64_t, uint64_t);
  void (*v37)(uint64_t);
  id v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  _BYTE v43[128];
  uint64_t v44;

  v44 = *MEMORY[0x24BDAC8D0];
  v21 = a2;
  v6 = a4;
  if (v6)
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  }
  else
  {
    v7 = (void *)objc_opt_new();
    v39 = 0u;
    v40 = 0u;
    v41 = 0u;
    v42 = 0u;
    v8 = *(id *)(a1 + 32);
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v39, v43, 16);
    if (v9)
    {
      v10 = *(_QWORD *)v40;
      do
      {
        for (i = 0; i != v9; ++i)
        {
          if (*(_QWORD *)v40 != v10)
            objc_enumerationMutation(v8);
          v12 = *(void **)(*((_QWORD *)&v39 + 1) + 8 * i);
          objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", objc_msgSend(v12, "envelopeContentType"));
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v7, "objectForKeyedSubscript:", v13);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "envelopeSubmissionDate");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          v16 = v15;
          if (v14)
          {
            objc_msgSend(v14, "earlierDate:", v15);
            v17 = (id)objc_claimAutoreleasedReturnValue();
          }
          else
          {
            v17 = v15;
          }
          v18 = v17;
          objc_msgSend(v7, "setObject:forKeyedSubscript:", v17, v13);

        }
        v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v39, v43, 16);
      }
      while (v9);
    }

    v33 = 0;
    v34 = &v33;
    v35 = 0x3032000000;
    v36 = __Block_byref_object_copy__1;
    v37 = __Block_byref_object_dispose__1;
    v38 = 0;
    v27 = 0;
    v28 = &v27;
    v29 = 0x3032000000;
    v30 = __Block_byref_object_copy__1;
    v31 = __Block_byref_object_dispose__1;
    v32 = 0;
    v22[0] = MEMORY[0x24BDAC760];
    v22[1] = 3221225472;
    v22[2] = __116__NDAnalyticsPayloadAssembler_determinePayloadDeliveryWindowForEntries_withLastUploadDatesByContentType_completion___block_invoke_15;
    v22[3] = &unk_24D1DEEB0;
    v23 = v21;
    v24 = *(id *)(a1 + 40);
    v25 = &v33;
    v26 = &v27;
    objc_msgSend(v7, "enumerateKeysAndObjectsUsingBlock:", v22);
    v19 = v34[5];
    if (v19)
    {
      objc_msgSend(MEMORY[0x24BE6CB38], "dateRangeWithEarlierDate:laterDate:", v19, v28[5]);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v20 = 0;
    }
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();

    _Block_object_dispose(&v27, 8);
    _Block_object_dispose(&v33, 8);

    v6 = 0;
  }

}

void __116__NDAnalyticsPayloadAssembler_determinePayloadDeliveryWindowForEntries_withLastUploadDatesByContentType_completion___block_invoke_15(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  id v17;

  v17 = a2;
  v5 = a3;
  objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", v17);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    objc_msgSend(*(id *)(a1 + 40), "objectForKeyedSubscript:", v17);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    NDAnalyticsEntryDeliveryWindow(v5, v7, v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
    objc_msgSend(v8, "earlierDate");
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = (void *)v10;
    if (v9)
    {
      objc_msgSend(v9, "earlierDate:", v10);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v12 = (void *)v10;
    }
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), v12);
    if (v9)

    v13 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40);
    objc_msgSend(v8, "laterDate");
    v14 = objc_claimAutoreleasedReturnValue();
    v15 = (void *)v14;
    if (v13)
    {
      objc_msgSend(v13, "earlierDate:", v14);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v16 = (void *)v14;
    }
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), v16);
    if (v13)

  }
}

- (void)assemblePayloadsWithEntries:(id)a3 lastUploadDatesByContentType:(id)a4 droppedEnvelopeReasonsToUpload:(id)a5 envelopeSizeByEntry:(id)a6 completion:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  _QWORD v22[4];
  id v23;
  id v24;
  id v25;
  NDAnalyticsPayloadAssembler *v26;
  id v27;
  id v28;

  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  if (!v12 && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
  {
    -[NDAnalyticsPayloadAssembler assemblePayloadsWithEntries:lastUploadDatesByContentType:droppedEnvelopeReasonsToUpload:envelopeSizeByEntry:completion:].cold.6();
    if (v13)
      goto LABEL_6;
  }
  else if (v13)
  {
    goto LABEL_6;
  }
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    -[NDAnalyticsPayloadAssembler assemblePayloadsWithEntries:lastUploadDatesByContentType:droppedEnvelopeReasonsToUpload:envelopeSizeByEntry:completion:].cold.5();
LABEL_6:
  if (!v14 && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    -[NDAnalyticsPayloadAssembler assemblePayloadsWithEntries:lastUploadDatesByContentType:droppedEnvelopeReasonsToUpload:envelopeSizeByEntry:completion:].cold.4();
  if (objc_msgSend(v14, "containsObject:", &unk_24D1E3580)
    && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
  {
    -[NDAnalyticsPayloadAssembler assemblePayloadsWithEntries:lastUploadDatesByContentType:droppedEnvelopeReasonsToUpload:envelopeSizeByEntry:completion:].cold.3();
    if (v15)
      goto LABEL_14;
  }
  else if (v15)
  {
    goto LABEL_14;
  }
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    -[NDAnalyticsPayloadAssembler assemblePayloadsWithEntries:lastUploadDatesByContentType:droppedEnvelopeReasonsToUpload:envelopeSizeByEntry:completion:].cold.2();
LABEL_14:
  if (!v16 && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    -[NDAnalyticsPayloadAssembler assemblePayloadsWithEntries:lastUploadDatesByContentType:droppedEnvelopeReasonsToUpload:envelopeSizeByEntry:completion:].cold.1();
  v22[0] = MEMORY[0x24BDAC760];
  v22[1] = 3221225472;
  v22[2] = __150__NDAnalyticsPayloadAssembler_assemblePayloadsWithEntries_lastUploadDatesByContentType_droppedEnvelopeReasonsToUpload_envelopeSizeByEntry_completion___block_invoke;
  v22[3] = &unk_24D1DF0B8;
  v23 = v14;
  v24 = v12;
  v25 = v13;
  v26 = self;
  v27 = v15;
  v28 = v16;
  v17 = v15;
  v18 = v13;
  v19 = v16;
  v20 = v12;
  v21 = v14;
  -[NDAnalyticsPayloadAssembler _fetchAnalyticsEnvelopeContentTypeConfigsWithCompletion:](self, "_fetchAnalyticsEnvelopeContentTypeConfigsWithCompletion:", v22);

}

void __150__NDAnalyticsPayloadAssembler_assemblePayloadsWithEntries_lastUploadDatesByContentType_droppedEnvelopeReasonsToUpload_envelopeSizeByEntry_completion___block_invoke(uint64_t a1, void *a2, unint64_t a3, void *a4)
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  id v27;
  void *v28;
  unint64_t v29;
  unint64_t v30;
  void *v31;
  unint64_t v32;
  id v33;
  id v34;
  id v35;
  uint64_t v36;
  id v37;
  void *v38;
  id v39;
  id v40;
  void *v41;
  void *v42;
  id v43;
  _QWORD v44[4];
  id v45;
  id v46;
  id v47;
  id v48;
  id v49;
  id v50;
  unint64_t v51;
  unint64_t v52;
  _QWORD v53[4];
  id v54;
  id v55;
  id v56;
  _QWORD v57[4];
  id v58;
  _QWORD v59[4];
  id v60;
  _QWORD v61[4];
  id v62;
  id v63;
  id v64;
  void *v65;
  _QWORD v66[3];

  v66[1] = *MEMORY[0x24BDAC8D0];
  v7 = a2;
  v8 = a4;
  if (v8)
  {
    if ((objc_msgSend(*(id *)(a1 + 32), "containsObject:", &unk_24D1E3580) & 1) != 0)
    {
      v9 = (void *)MEMORY[0x24BDBD1B8];
    }
    else
    {
      v36 = *(_QWORD *)(a1 + 40);
      v65 = &unk_24D1E3580;
      v66[0] = v36;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v66, &v65, 1);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
    }
    (*(void (**)(void))(*(_QWORD *)(a1 + 72) + 16))();
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDBCE60], "date");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = *(void **)(a1 + 40);
    v12 = MEMORY[0x24BDAC760];
    v61[0] = MEMORY[0x24BDAC760];
    v61[1] = 3221225472;
    v61[2] = __150__NDAnalyticsPayloadAssembler_assemblePayloadsWithEntries_lastUploadDatesByContentType_droppedEnvelopeReasonsToUpload_envelopeSizeByEntry_completion___block_invoke_2;
    v61[3] = &unk_24D1DEF00;
    v43 = v7;
    v13 = v7;
    v62 = v13;
    v40 = v10;
    v63 = v40;
    v64 = *(id *)(a1 + 48);
    objc_msgSend(v11, "fc_arrayOfObjectsPassingTest:", v61);
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "fc_dictionaryOfSortedObjectsWithKeyBlock:", &__block_literal_global_3);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = (void *)objc_opt_new();
    objc_msgSend(v14, "allKeys");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v59[0] = v12;
    v59[1] = 3221225472;
    v59[2] = __150__NDAnalyticsPayloadAssembler_assemblePayloadsWithEntries_lastUploadDatesByContentType_droppedEnvelopeReasonsToUpload_envelopeSizeByEntry_completion___block_invoke_4;
    v59[3] = &unk_24D1DEF28;
    v17 = v13;
    v60 = v17;
    objc_msgSend(v16, "fc_setOfObjectsPassingTest:", v59);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    v57[0] = v12;
    v57[1] = 3221225472;
    v57[2] = __150__NDAnalyticsPayloadAssembler_assemblePayloadsWithEntries_lastUploadDatesByContentType_droppedEnvelopeReasonsToUpload_envelopeSizeByEntry_completion___block_invoke_5;
    v57[3] = &unk_24D1DEF50;
    v19 = v14;
    v58 = v19;
    v41 = v18;
    objc_msgSend(v18, "fc_arrayByTransformingWithBlock:", v57);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "fc_arrayByFlattening");
    v21 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v21, "count"))
    {
      v22 = (void *)objc_msgSend(v21, "mutableCopy");
      objc_msgSend(v15, "setObject:forKeyedSubscript:", v22, &unk_24D1E3580);

    }
    v23 = (void *)objc_opt_new();
    v24 = (void *)objc_opt_new();
    v25 = v15;
    v26 = MEMORY[0x24BDAC760];
    v53[0] = MEMORY[0x24BDAC760];
    v53[1] = 3221225472;
    v53[2] = __150__NDAnalyticsPayloadAssembler_assemblePayloadsWithEntries_lastUploadDatesByContentType_droppedEnvelopeReasonsToUpload_envelopeSizeByEntry_completion___block_invoke_6;
    v53[3] = &unk_24D1DEF78;
    v54 = v19;
    v55 = v23;
    v27 = v24;
    v56 = v27;
    v37 = v23;
    v39 = v19;
    objc_msgSend(v17, "enumerateKeysAndObjectsUsingBlock:", v53);
    v28 = (void *)objc_opt_new();
    v29 = objc_msgSend(*(id *)(a1 + 56), "maxPayloadSize");
    v38 = v21;
    if (v29 >= a3)
      v30 = a3;
    else
      v30 = v29;
    FCDeviceIdentifierForVendor();
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = objc_msgSend(v31, "hash") % 0x64uLL;

    v44[0] = v26;
    v44[1] = 3221225472;
    v44[2] = __150__NDAnalyticsPayloadAssembler_assemblePayloadsWithEntries_lastUploadDatesByContentType_droppedEnvelopeReasonsToUpload_envelopeSizeByEntry_completion___block_invoke_7;
    v44[3] = &unk_24D1DF090;
    v45 = v27;
    v46 = *(id *)(a1 + 32);
    v47 = v25;
    v48 = v17;
    v51 = v32;
    v52 = v30;
    v49 = *(id *)(a1 + 64);
    v50 = v28;
    v33 = v28;
    v34 = v25;
    v35 = v27;
    objc_msgSend(v37, "enumerateKeysAndObjectsUsingBlock:", v44);
    (*(void (**)(void))(*(_QWORD *)(a1 + 72) + 16))();

    v7 = v43;
    v9 = v40;
  }

}

uint64_t __150__NDAnalyticsPayloadAssembler_assemblePayloadsWithEntries_lastUploadDatesByContentType_droppedEnvelopeReasonsToUpload_envelopeSizeByEntry_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t CanBeUploaded;

  v3 = a2;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", objc_msgSend(v3, "envelopeContentType"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    objc_msgSend(v3, "envelopeSubmissionDate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = *(void **)(a1 + 40);
    objc_msgSend(*(id *)(a1 + 48), "objectForKeyedSubscript:", v4);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    CanBeUploaded = NDAnalyticsEntryCanBeUploaded(v6, v7, v8, v5);

  }
  else
  {
    CanBeUploaded = 1;
  }

  return CanBeUploaded;
}

uint64_t __150__NDAnalyticsPayloadAssembler_assemblePayloadsWithEntries_lastUploadDatesByContentType_droppedEnvelopeReasonsToUpload_envelopeSizeByEntry_completion___block_invoke_3(uint64_t a1, void *a2)
{
  return objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", objc_msgSend(a2, "envelopeContentType"));
}

BOOL __150__NDAnalyticsPayloadAssembler_assemblePayloadsWithEntries_lastUploadDatesByContentType_droppedEnvelopeReasonsToUpload_envelopeSizeByEntry_completion___block_invoke_4(uint64_t a1, uint64_t a2)
{
  void *v2;
  _BOOL8 v3;

  objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", a2);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 == 0;

  return v3;
}

uint64_t __150__NDAnalyticsPayloadAssembler_assemblePayloadsWithEntries_lastUploadDatesByContentType_droppedEnvelopeReasonsToUpload_envelopeSizeByEntry_completion___block_invoke_5(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", a2);
}

void __150__NDAnalyticsPayloadAssembler_assemblePayloadsWithEntries_lastUploadDatesByContentType_droppedEnvelopeReasonsToUpload_envelopeSizeByEntry_completion___block_invoke_6(id *a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;

  v15 = a2;
  v5 = a3;
  objc_msgSend(a1[4], "objectForKeyedSubscript:", v15);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", objc_msgSend(v5, "groupingTag"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1[5], "objectForKeyedSubscript:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v8;
    if (v8)
    {
      v10 = v8;
    }
    else
    {
      v10 = (id)objc_opt_new();
      objc_msgSend(a1[5], "setObject:forKeyedSubscript:", v10, v7);
    }

    objc_msgSend(a1[4], "objectForKeyedSubscript:", v15);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "addObjectsFromArray:", v11);

    v12 = (void *)MEMORY[0x24BDBCF48];
    objc_msgSend(v5, "endpointURLString");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "URLWithString:", v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(a1[6], "setObject:forKeyedSubscript:", v14, v7);
  }

}

void __150__NDAnalyticsPayloadAssembler_assemblePayloadsWithEntries_lastUploadDatesByContentType_droppedEnvelopeReasonsToUpload_envelopeSizeByEntry_completion___block_invoke_7(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  id v9;
  void (**v10)(void *, uint64_t, void *);
  id v11;
  uint64_t v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t i;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  id v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  id v45;
  void *v46;
  void (**v47)(void *, uint64_t, void *);
  uint64_t v48;
  void *v49;
  void *v50;
  id v51;
  void *v52;
  void *v53;
  void *v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  _QWORD v59[4];
  id v60;
  id v61;
  _QWORD v62[4];
  id v63;
  uint64_t v64;
  _QWORD aBlock[4];
  id v66;
  id v67;
  id v68;
  _BYTE v69[128];
  uint64_t v70;

  v70 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", a2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_opt_new();
  v8 = MEMORY[0x24BDAC760];
  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 3221225472;
  aBlock[2] = __150__NDAnalyticsPayloadAssembler_assemblePayloadsWithEntries_lastUploadDatesByContentType_droppedEnvelopeReasonsToUpload_envelopeSizeByEntry_completion___block_invoke_8;
  aBlock[3] = &unk_24D1DEFA0;
  v66 = *(id *)(a1 + 40);
  v9 = v7;
  v67 = v9;
  v68 = *(id *)(a1 + 48);
  v10 = (void (**)(void *, uint64_t, void *))_Block_copy(aBlock);
  v62[0] = v8;
  v62[1] = 3221225472;
  v62[2] = __150__NDAnalyticsPayloadAssembler_assemblePayloadsWithEntries_lastUploadDatesByContentType_droppedEnvelopeReasonsToUpload_envelopeSizeByEntry_completion___block_invoke_9;
  v62[3] = &unk_24D1DEFC8;
  v11 = *(id *)(a1 + 56);
  v12 = *(_QWORD *)(a1 + 80);
  v63 = v11;
  v64 = v12;
  objc_msgSend(v5, "fc_dictionaryOfSortedObjectsWithKeyBlock:", v62);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "objectForKeyedSubscript:", MEMORY[0x24BDBD1C0]);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v10[2](v10, 2, v14);

  objc_msgSend(v13, "objectForKeyedSubscript:", MEMORY[0x24BDBD1C8]);
  v15 = objc_claimAutoreleasedReturnValue();
  v16 = (void *)v15;
  v17 = (void *)MEMORY[0x24BDBD1A8];
  if (v15)
    v17 = (void *)v15;
  v18 = v17;

  v54 = v18;
  objc_msgSend(v18, "sortedArrayUsingComparator:", &__block_literal_global_34);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", *(_QWORD *)(a1 + 88));
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v61 = 0;
  v59[0] = v8;
  v59[1] = 3221225472;
  v59[2] = __150__NDAnalyticsPayloadAssembler_assemblePayloadsWithEntries_lastUploadDatesByContentType_droppedEnvelopeReasonsToUpload_envelopeSizeByEntry_completion___block_invoke_11;
  v59[3] = &unk_24D1DED78;
  v60 = *(id *)(a1 + 64);
  objc_msgSend(v19, "fc_arraysByPartitioningWithBudget:indicesOfOverBudgetObjects:appraiser:accumulator:comparator:", v20, &v61, v59, &__block_literal_global_36, &__block_literal_global_38);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = v61;

  v53 = v19;
  objc_msgSend(v19, "objectsAtIndexes:", v22);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v10[2](v10, 1, v23);

  v52 = v21;
  objc_msgSend(v21, "firstObject");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v24, "count"))
  {
    v45 = v22;
    v46 = v13;
    v47 = v10;
    v49 = v9;
    v50 = v6;
    v51 = v5;
    v25 = (void *)MEMORY[0x24BDBCF20];
    v44 = v24;
    NDAnalyticsEnvelopeContentTypesFromEntries(v24);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "setWithArray:", v26);
    v27 = (void *)objc_claimAutoreleasedReturnValue();

    v28 = (void *)objc_opt_new();
    v55 = 0u;
    v56 = 0u;
    v57 = 0u;
    v58 = 0u;
    v48 = a1;
    v29 = *(void **)(a1 + 56);
    v43 = v27;
    objc_msgSend(v27, "allObjects");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "nf_objectsForKeysWithoutMarker:", v30);
    v31 = (void *)objc_claimAutoreleasedReturnValue();

    v32 = objc_msgSend(v31, "countByEnumeratingWithState:objects:count:", &v55, v69, 16);
    if (v32)
    {
      v33 = v32;
      v34 = *(_QWORD *)v56;
      do
      {
        for (i = 0; i != v33; ++i)
        {
          if (*(_QWORD *)v56 != v34)
            objc_enumerationMutation(v31);
          v36 = *(void **)(*((_QWORD *)&v55 + 1) + 8 * i);
          objc_msgSend(v36, "contentHeaderName");
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          if (v37)
          {
            objc_msgSend(v28, "objectForKeyedSubscript:", v37);
            v38 = (void *)objc_claimAutoreleasedReturnValue();
            v39 = v38;
            if (v38)
            {
              v40 = v38;
            }
            else
            {
              v40 = (id)objc_opt_new();
              objc_msgSend(v28, "setObject:forKeyedSubscript:", v40, v37);
            }

            objc_msgSend(v36, "contentHeaderValue");
            v41 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v40, "addObject:", v41);

          }
        }
        v33 = objc_msgSend(v31, "countByEnumeratingWithState:objects:count:", &v55, v69, 16);
      }
      while (v33);
    }

    v42 = (void *)objc_opt_new();
    v6 = v50;
    objc_msgSend(v42, "setEndpointURL:", v50);
    objc_msgSend(v42, "setValuesByHTTPHeaderField:", v28);
    v24 = v44;
    objc_msgSend(v42, "setEntriesToUpload:", v44);

    v9 = v49;
    v5 = v51;
    v22 = v45;
    if (!objc_msgSend(v49, "count"))
    {
      v10 = v47;
      a1 = v48;
      v13 = v46;
      if (!v42)
        goto LABEL_22;
      goto LABEL_21;
    }
    v10 = v47;
    a1 = v48;
    v13 = v46;
    if (v42)
    {
      objc_msgSend(v42, "setDroppedEntriesByReason:", v49);
LABEL_21:
      objc_msgSend(*(id *)(a1 + 72), "addObject:", v42);

      goto LABEL_22;
    }
  }
  else if (!objc_msgSend(v9, "count"))
  {
    goto LABEL_22;
  }
  v42 = (void *)objc_opt_new();
  objc_msgSend(v42, "setEndpointURL:", v6);
  objc_msgSend(v42, "setEntriesToUpload:", MEMORY[0x24BDBD1A8]);
  objc_msgSend(v42, "setDroppedEntriesByReason:", v9);
  if (v42)
    goto LABEL_21;
LABEL_22:

}

void __150__NDAnalyticsPayloadAssembler_assemblePayloadsWithEntries_lastUploadDatesByContentType_droppedEnvelopeReasonsToUpload_envelopeSizeByEntry_completion___block_invoke_8(uint64_t a1, uint64_t a2, void *a3)
{
  void *v5;
  int v6;
  uint64_t v7;
  id v8;
  void *v9;
  void *v10;
  id v11;
  id v12;

  v12 = a3;
  if (objc_msgSend(v12, "count"))
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", a2);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(*(id *)(a1 + 32), "containsObject:", v5);
    v7 = 48;
    if (v6)
      v7 = 40;
    v8 = *(id *)(a1 + v7);
    objc_msgSend(v8, "objectForKeyedSubscript:", v5);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v9;
    if (v9)
    {
      v11 = v9;
    }
    else
    {
      v11 = (id)objc_opt_new();
      objc_msgSend(v8, "setObject:forKeyedSubscript:", v11, v5);
    }

    objc_msgSend(v11, "addObjectsFromArray:", v12);
  }

}

id __150__NDAnalyticsPayloadAssembler_assemblePayloadsWithEntries_lastUploadDatesByContentType_droppedEnvelopeReasonsToUpload_envelopeSizeByEntry_completion___block_invoke_9(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  unint64_t v7;
  _BOOL8 v8;
  unint64_t v9;
  void *v10;

  v3 = *(void **)(a1 + 32);
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", objc_msgSend(a2, "envelopeContentType"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = (void *)MEMORY[0x24BDD16E0];
  v7 = *(_QWORD *)(a1 + 40);
  if (v7 >= objc_msgSend(v5, "samplingFloor"))
  {
    v9 = *(_QWORD *)(a1 + 40);
    v8 = v9 < objc_msgSend(v5, "samplingCeiling");
  }
  else
  {
    v8 = 0;
  }
  objc_msgSend(v6, "numberWithInt:", v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

uint64_t __150__NDAnalyticsPayloadAssembler_assemblePayloadsWithEntries_lastUploadDatesByContentType_droppedEnvelopeReasonsToUpload_envelopeSizeByEntry_completion___block_invoke_10(uint64_t a1, void *a2, void *a3)
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;

  v4 = a2;
  objc_msgSend(a3, "envelopeSubmissionDate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "envelopeSubmissionDate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v5, "compare:", v6);
  return v7;
}

uint64_t __150__NDAnalyticsPayloadAssembler_assemblePayloadsWithEntries_lastUploadDatesByContentType_droppedEnvelopeReasonsToUpload_envelopeSizeByEntry_completion___block_invoke_11(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", a2);
}

uint64_t __150__NDAnalyticsPayloadAssembler_assemblePayloadsWithEntries_lastUploadDatesByContentType_droppedEnvelopeReasonsToUpload_envelopeSizeByEntry_completion___block_invoke_12(uint64_t a1, void *a2, void *a3)
{
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;

  v4 = (void *)MEMORY[0x24BDD16E0];
  v5 = a3;
  v6 = objc_msgSend(a2, "unsignedIntegerValue");
  v7 = objc_msgSend(v5, "unsignedIntegerValue");

  return objc_msgSend(v4, "numberWithUnsignedInteger:", v7 + v6);
}

uint64_t __150__NDAnalyticsPayloadAssembler_assemblePayloadsWithEntries_lastUploadDatesByContentType_droppedEnvelopeReasonsToUpload_envelopeSizeByEntry_completion___block_invoke_13(uint64_t a1, void *a2, void *a3)
{
  id v4;
  unint64_t v5;
  unint64_t v6;

  v4 = a3;
  v5 = objc_msgSend(a2, "unsignedIntegerValue");
  v6 = objc_msgSend(v4, "unsignedIntegerValue");

  if (v5 < v6)
    return -1;
  else
    return v5 > v6;
}

- (void)_fetchAnalyticsEnvelopeContentTypeConfigsWithCompletion:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  if (!v4 && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    -[NDAnalyticsPayloadAssembler _fetchAnalyticsEnvelopeContentTypeConfigsWithCompletion:].cold.1();
  -[NDAnalyticsPayloadAssembler configProvider](self, "configProvider");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "fetchConfigWithCompletion:", v4);

}

- (NDAnalyticsPayloadAssemblerConfigProvider)configProvider
{
  return self->_configProvider;
}

- (void)setConfigProvider:(id)a3
{
  objc_storeStrong((id *)&self->_configProvider, a3);
}

- (unint64_t)maxPayloadSize
{
  return self->_maxPayloadSize;
}

- (void)setMaxPayloadSize:(unint64_t)a3
{
  self->_maxPayloadSize = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_configProvider, 0);
}

- (void)initWithConfigProvider:maxPayloadSize:.cold.1()
{
  void *v0;
  int v1;
  int v2;
  int v3;
  int v4;
  int v5;
  uint64_t v6;

  v0 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithFormat:", CFSTR("Invalid parameter not satisfying %s"));
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_214674000, MEMORY[0x24BDACB70], v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"configProvider", v6, 2u);

  OUTLINED_FUNCTION_3();
}

- (void)determinePayloadDeliveryWindowForEntries:withLastUploadDatesByContentType:completion:.cold.1()
{
  void *v0;
  int v1;
  int v2;
  int v3;
  int v4;
  int v5;
  uint64_t v6;

  v0 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithFormat:", CFSTR("Invalid parameter not satisfying %s"));
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_214674000, MEMORY[0x24BDACB70], v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"completion", v6, 2u);

  OUTLINED_FUNCTION_3();
}

- (void)determinePayloadDeliveryWindowForEntries:withLastUploadDatesByContentType:completion:.cold.2()
{
  void *v0;
  int v1;
  int v2;
  int v3;
  int v4;
  int v5;
  uint64_t v6;

  v0 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithFormat:", CFSTR("Invalid parameter not satisfying %s"));
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_214674000, MEMORY[0x24BDACB70], v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"lastUploadDatesByContentType", v6, 2u);

  OUTLINED_FUNCTION_3();
}

- (void)determinePayloadDeliveryWindowForEntries:withLastUploadDatesByContentType:completion:.cold.3()
{
  void *v0;
  int v1;
  int v2;
  int v3;
  int v4;
  int v5;
  uint64_t v6;

  v0 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithFormat:", CFSTR("Invalid parameter not satisfying %s"));
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_214674000, MEMORY[0x24BDACB70], v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"entries", v6, 2u);

  OUTLINED_FUNCTION_3();
}

- (void)assemblePayloadsWithEntries:lastUploadDatesByContentType:droppedEnvelopeReasonsToUpload:envelopeSizeByEntry:completion:.cold.1()
{
  void *v0;
  int v1;
  int v2;
  int v3;
  int v4;
  int v5;
  uint64_t v6;

  v0 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithFormat:", CFSTR("Invalid parameter not satisfying %s"));
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_214674000, MEMORY[0x24BDACB70], v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"completion", v6, 2u);

  OUTLINED_FUNCTION_3();
}

- (void)assemblePayloadsWithEntries:lastUploadDatesByContentType:droppedEnvelopeReasonsToUpload:envelopeSizeByEntry:completion:.cold.2()
{
  void *v0;
  int v1;
  int v2;
  int v3;
  int v4;
  int v5;
  uint64_t v6;

  v0 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithFormat:", CFSTR("Invalid parameter not satisfying %s"));
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_214674000, MEMORY[0x24BDACB70], v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"envelopeSizeByEntry", v6, 2u);

  OUTLINED_FUNCTION_3();
}

- (void)assemblePayloadsWithEntries:lastUploadDatesByContentType:droppedEnvelopeReasonsToUpload:envelopeSizeByEntry:completion:.cold.3()
{
  void *v0;
  int v1;
  int v2;
  int v3;
  int v4;
  int v5;
  uint64_t v6;

  v0 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithFormat:", CFSTR("Invalid parameter not satisfying %s"));
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_214674000, MEMORY[0x24BDACB70], v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"![droppedEnvelopeReasonsToUpload containsObject:@(NDAnalyticsPayloadAssemblerDroppedEnvelopeReasonMissingConfigForContentType)]", v6, 2u);

  OUTLINED_FUNCTION_3();
}

- (void)assemblePayloadsWithEntries:lastUploadDatesByContentType:droppedEnvelopeReasonsToUpload:envelopeSizeByEntry:completion:.cold.4()
{
  void *v0;
  int v1;
  int v2;
  int v3;
  int v4;
  int v5;
  uint64_t v6;

  v0 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithFormat:", CFSTR("Invalid parameter not satisfying %s"));
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_214674000, MEMORY[0x24BDACB70], v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"droppedEnvelopeReasonsToUpload", v6, 2u);

  OUTLINED_FUNCTION_3();
}

- (void)assemblePayloadsWithEntries:lastUploadDatesByContentType:droppedEnvelopeReasonsToUpload:envelopeSizeByEntry:completion:.cold.5()
{
  void *v0;
  int v1;
  int v2;
  int v3;
  int v4;
  int v5;
  uint64_t v6;

  v0 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithFormat:", CFSTR("Invalid parameter not satisfying %s"));
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_214674000, MEMORY[0x24BDACB70], v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"lastUploadDatesByContentType", v6, 2u);

  OUTLINED_FUNCTION_3();
}

- (void)assemblePayloadsWithEntries:lastUploadDatesByContentType:droppedEnvelopeReasonsToUpload:envelopeSizeByEntry:completion:.cold.6()
{
  void *v0;
  int v1;
  int v2;
  int v3;
  int v4;
  int v5;
  uint64_t v6;

  v0 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithFormat:", CFSTR("Invalid parameter not satisfying %s"));
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_214674000, MEMORY[0x24BDACB70], v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"entries", v6, 2u);

  OUTLINED_FUNCTION_3();
}

- (void)_fetchAnalyticsEnvelopeContentTypeConfigsWithCompletion:.cold.1()
{
  void *v0;
  int v1;
  int v2;
  int v3;
  int v4;
  int v5;
  uint64_t v6;

  v0 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithFormat:", CFSTR("Invalid parameter not satisfying %s"));
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_214674000, MEMORY[0x24BDACB70], v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"completion", v6, 2u);

  OUTLINED_FUNCTION_3();
}

@end
