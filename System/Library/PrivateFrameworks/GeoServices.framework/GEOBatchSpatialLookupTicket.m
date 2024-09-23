@implementation GEOBatchSpatialLookupTicket

void __77___GEOBatchSpatialLookupTicket_submitWithHandler_auditToken_networkActivity___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v6;
  id v7;
  uint64_t v8;
  unint64_t i;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  _QWORD v17[5];
  id v18;
  id v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t v24;

  v6 = a2;
  v7 = a3;
  if (objc_msgSend(*(id *)(a1 + 32), "isCancelled") || v7)
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }
  else
  {
    objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 48), a2);
    v8 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 48), "responsesCount");
    if (v8 == objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 56), "count"))
    {
      v21 = 0;
      v22 = &v21;
      v23 = 0x2020000000;
      v24 = 0;
      v24 = objc_msgSend(v6, "responsesCount");
      if (v22[3])
      {
        for (i = 0; i < objc_msgSend(v6, "responsesCount"); ++i)
        {
          objc_msgSend(v6, "responseAtIndex:", i);
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 56), "objectAtIndex:", i);
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v10, "statusCode") || !objc_msgSend(v10, "placesCount"))
          {
            v12 = v22[3] - 1;
            v22[3] = v12;
            if (!v12)
              (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
          }
          else
          {
            objc_msgSend(v10, "places");
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            v17[0] = MEMORY[0x1E0C809B0];
            v17[1] = 3221225472;
            v17[2] = __77___GEOBatchSpatialLookupTicket_submitWithHandler_auditToken_networkActivity___block_invoke_2;
            v17[3] = &unk_1E1C066C0;
            v14 = *(void **)(a1 + 40);
            v17[4] = *(_QWORD *)(a1 + 32);
            v19 = v14;
            v18 = v11;
            v20 = &v21;
            _attributedGeoMapItemsForPlaceDatasWithHandler(0, v13, 0, 0, 0, 0, v17);

          }
        }
      }
      else
      {
        (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
      }
      _Block_object_dispose(&v21, 8);
    }
    else
    {
      v15 = *(_QWORD *)(a1 + 40);
      objc_msgSend(MEMORY[0x1E0CB35C8], "GEOErrorWithCode:reason:", -11, CFSTR("Incorrect number of responses"));
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      (*(void (**)(uint64_t, void *))(v15 + 16))(v15, v16);

    }
  }

}

void __77___GEOBatchSpatialLookupTicket_submitWithHandler_auditToken_networkActivity___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void (*v6)(void);
  id v7;
  id v8;

  v8 = a2;
  v5 = a3;
  if ((objc_msgSend(*(id *)(a1 + 32), "isCancelled") & 1) == 0)
  {
    if (v5)
    {
      objc_msgSend(*(id *)(a1 + 32), "cancel");
      v6 = *(void (**)(void))(*(_QWORD *)(a1 + 48) + 16);
LABEL_4:
      v6();
      goto LABEL_8;
    }
    v7 = v8;
    if (!v8)
      v7 = (id)MEMORY[0x1E0C9AA60];
    v8 = v7;
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 64), "setObject:forKey:");
    if (!--*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24))
    {
      v6 = *(void (**)(void))(*(_QWORD *)(a1 + 48) + 16);
      goto LABEL_4;
    }
  }
LABEL_8:

}

void __83___GEOBatchSpatialLookupTicket_submitWithHandler_auditToken_networkActivity_queue___block_invoke(_QWORD *a1, void *a2)
{
  id v3;
  void *v4;
  NSObject *v5;
  _QWORD block[5];
  id v7;
  id v8;

  v3 = a2;
  v4 = (void *)a1[6];
  if (v4)
  {
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __83___GEOBatchSpatialLookupTicket_submitWithHandler_auditToken_networkActivity_queue___block_invoke_2;
    block[3] = &unk_1E1C00BB8;
    v5 = a1[4];
    block[4] = a1[5];
    v8 = v4;
    v7 = v3;
    dispatch_async(v5, block);

  }
}

uint64_t __83___GEOBatchSpatialLookupTicket_submitWithHandler_auditToken_networkActivity_queue___block_invoke_2(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "isCancelled");
  if ((result & 1) == 0)
    return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  return result;
}

void __83___GEOBatchSpatialLookupTicket_submitWithHandler_auditToken_networkActivity_queue___block_invoke_3(_QWORD *a1, char a2)
{
  void *v2;
  NSObject *v4;
  _QWORD block[5];
  id v6;
  char v7;

  v2 = (void *)a1[6];
  if (v2)
  {
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __83___GEOBatchSpatialLookupTicket_submitWithHandler_auditToken_networkActivity_queue___block_invoke_4;
    block[3] = &unk_1E1C06508;
    v4 = a1[4];
    block[4] = a1[5];
    v6 = v2;
    v7 = a2;
    dispatch_async(v4, block);

  }
}

uint64_t __83___GEOBatchSpatialLookupTicket_submitWithHandler_auditToken_networkActivity_queue___block_invoke_4(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "isCancelled");
  if ((result & 1) == 0)
    return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  return result;
}

@end
