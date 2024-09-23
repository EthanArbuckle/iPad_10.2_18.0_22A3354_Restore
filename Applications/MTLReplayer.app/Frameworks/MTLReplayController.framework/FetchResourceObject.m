@implementation FetchResourceObject

id __FetchResourceObject_block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 272), "addObject:", *(_QWORD *)(a1 + 32));
}

void __FetchResourceObject_block_invoke_2(uint64_t a1)
{
  NSObject *v1;
  _QWORD v2[4];
  id v3[2];

  v1 = *(NSObject **)(a1 + 32);
  v2[0] = _NSConcreteStackBlock;
  v2[1] = 3221225472;
  v2[2] = __FetchResourceObject_block_invoke_3;
  v2[3] = &unk_7263A0;
  v3[1] = *(id *)(a1 + 48);
  objc_copyWeak(v3, (id *)(a1 + 40));
  dispatch_async(v1, v2);
  objc_destroyWeak(v3);
}

void __FetchResourceObject_block_invoke_4(uint64_t a1)
{
  id WeakRetained;
  unsigned __int8 v3;
  uint64_t v4;
  id Attributes;
  id v6;
  id v7;
  uint64_t v8;
  id *v9;
  unsigned __int8 v10;
  void *v11;
  void *v12;
  id v13;
  unsigned __int8 v14;
  void *v15;
  int v16;
  void *v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  void *v24;
  id v25;
  void *v26;
  id v27;
  id val;
  id v29;
  void *v30;
  _QWORD v31[4];
  id v32;
  uint64_t v33;
  void *v34;
  _QWORD v35[2];
  id v36;
  unsigned int **v37;
  uint64_t v38;
  void (*v39)(uint64_t);
  void *v40;
  id v41;
  id v42;
  id v43;
  id v44[2];
  int v45;
  id location;
  char v47;

  v30 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionaryWithCapacity:](NSMutableDictionary, "dictionaryWithCapacity:", 1));
  v35[0] = &v47;
  v35[1] = 1024;
  v29 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableData dataWithCapacity:](NSMutableData, "dataWithCapacity:", 4096));
  v36 = v29;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  v3 = objc_msgSend(WeakRetained, "isCancelled");

  if ((v3 & 1) == 0)
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 56) + 288), "waitUntilDownloadCapacity");
    v4 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
    objc_msgSend(*(id *)(v4 + 24), "releaseBuffer");
    objc_msgSend(*(id *)(v4 + 16), "waitUntilCapacity");
    Attributes = GetAttributes(*(_QWORD *)(a1 + 56), *(void **)(a1 + 32));
    v6 = (id)objc_claimAutoreleasedReturnValue(Attributes);
    v37 = (unsigned int **)v35;
    v7 = v30;
    v38 = (uint64_t)v7;
    v39 = 0;
    v8 = *(_QWORD *)(a1 + 56);
    v9 = *(id **)(v8 + 8);
    v34 = 0;
    v10 = HarvestResourceObject(v9, (apr_pool_t *)(v8 + 96), v6, &v37, &v34);
    v11 = v34;
    v12 = v11;
    if ((v10 & 1) == 0)
    {
      (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

      goto LABEL_8;
    }

  }
  v6 = *(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24);
  v13 = objc_loadWeakRetained((id *)(a1 + 48));
  v14 = objc_msgSend(v13, "isCancelled");

  if ((v14 & 1) != 0)
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
    objc_msgSend(v6, "clearCommandBuffer");
  }
  else
  {
    val = objc_loadWeakRetained((id *)(a1 + 48));
    v15 = *(void **)(a1 + 64);
    v16 = *(_DWORD *)(a1 + 72);
    v17 = *(void **)(a1 + 40);
    objc_initWeak(&location, val);
    v18 = v30;
    v19 = v29;
    v20 = v17;
    v37 = (unsigned int **)_NSConcreteStackBlock;
    v38 = 3221225472;
    v39 = __FetchResourceObjectReplyOperation_block_invoke;
    v40 = &unk_726488;
    objc_copyWeak(v44, &location);
    v21 = v18;
    v41 = v21;
    v44[1] = v15;
    v45 = v16;
    v22 = v19;
    v42 = v22;
    v23 = v20;
    v43 = v23;
    v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSBlockOperation blockOperationWithBlock:](NSBlockOperation, "blockOperationWithBlock:", &v37));

    objc_destroyWeak(v44);
    objc_destroyWeak(&location);

    v25 = objc_loadWeakRetained((id *)(a1 + 48));
    objc_msgSend(v25, "addDependency:", v24);

    v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "commandBuffer"));
    v31[0] = _NSConcreteStackBlock;
    v31[1] = 3221225472;
    v31[2] = __FetchResourceObject_block_invoke_21;
    v31[3] = &unk_726840;
    v33 = *(_QWORD *)(a1 + 56);
    v27 = v24;
    v32 = v27;
    objc_msgSend(v26, "addCompletedHandler:", v31);

    objc_msgSend(v6, "commitCommandBuffer");
  }
LABEL_8:

}

id __FetchResourceObject_block_invoke_21(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 264), "addOperation:", *(_QWORD *)(a1 + 32));
}

void __FetchResourceObject_block_invoke_3(uint64_t a1)
{
  void *v1;
  id WeakRetained;

  v1 = *(void **)(*(_QWORD *)(a1 + 40) + 272);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(v1, "removeObject:", WeakRetained);

}

@end
