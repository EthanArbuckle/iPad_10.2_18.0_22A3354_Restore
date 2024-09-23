@implementation WFContentCollection

void __94__WFContentCollection_ShareableObjects__getShareableObjectsOfTypes_options_completionHandler___block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v6;
  id v7;
  void *v8;
  _QWORD v9[4];
  id v10;
  id v11;
  _QWORD v12[4];
  __int128 v13;

  v6 = a2;
  v7 = a4;
  if (objc_msgSend(v6, "numberOfItems"))
  {
    objc_msgSend(v6, "items");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v12[0] = MEMORY[0x24BDAC760];
    v12[1] = 3221225472;
    v12[2] = __94__WFContentCollection_ShareableObjects__getShareableObjectsOfTypes_options_completionHandler___block_invoke_2;
    v12[3] = &__block_descriptor_48_e73_v32__0__WFContentItem_8Q16___v_____WFSystemShareableObject____NSError__24l;
    v13 = *(_OWORD *)(a1 + 40);
    v9[0] = MEMORY[0x24BDAC760];
    v9[1] = 3221225472;
    v9[2] = __94__WFContentCollection_ShareableObjects__getShareableObjectsOfTypes_options_completionHandler___block_invoke_3;
    v9[3] = &unk_24F8BABC0;
    v11 = *(id *)(a1 + 32);
    v10 = v6;
    objc_msgSend(v8, "if_mapAsynchronously:completionHandler:", v12, v9);

  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }

}

uint64_t __94__WFContentCollection_ShareableObjects__getShareableObjectsOfTypes_options_completionHandler___block_invoke_2(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  return objc_msgSend(a2, "getShareableObjectOfTypes:options:completionHandler:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), a4);
}

void __94__WFContentCollection_ShareableObjects__getShareableObjectsOfTypes_options_completionHandler___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  uint64_t v4;
  void *v5;
  id v6;
  id v7;
  id v8;

  v5 = *(void **)(a1 + 32);
  v4 = *(_QWORD *)(a1 + 40);
  v6 = a3;
  v7 = a2;
  objc_msgSend(v5, "attributionSet");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id, id, id))(v4 + 16))(v4, v7, v8, v6);

}

@end
