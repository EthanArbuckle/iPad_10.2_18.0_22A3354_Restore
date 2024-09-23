@implementation WFConfiguredViewControllerForActionExtension

uint64_t __WFConfiguredViewControllerForActionExtension_block_invoke(uint64_t result)
{
  if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24))
    return (*(uint64_t (**)(void))(*(_QWORD *)(result + 32) + 16))();
  return result;
}

void __WFConfiguredViewControllerForActionExtension_block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  id v12;
  uint64_t v13;
  _QWORD v14[2];

  v14[1] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24))
  {
    v5 = *(_QWORD *)(a1 + 32);
    objc_msgSend(MEMORY[0x24BDD1540], "userCancelledError");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v6;
    if (v4)
    {
      v8 = (void *)MEMORY[0x24BDD1540];
      objc_msgSend(v6, "domain");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v7, "code");
      v13 = *MEMORY[0x24BDD1398];
      v14[0] = v4;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v14, &v13, 1);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "errorWithDomain:code:userInfo:", v9, v10, v11);
      v12 = (id)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v12 = v6;
    }

    (*(void (**)(uint64_t, _QWORD, id))(v5 + 16))(v5, 0, v12);
  }

}

void __WFConfiguredViewControllerForActionExtension_block_invoke_3(uint64_t a1)
{
  uint64_t v1;
  id v2;

  if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24))
  {
    v1 = *(_QWORD *)(a1 + 32);
    WFExtensionCommunicationError(0);
    v2 = (id)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, _QWORD, id))(v1 + 16))(v1, 0, v2);

  }
}

void __WFConfiguredViewControllerForActionExtension_block_invoke_4(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;

  v7 = a3;
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = 1;
  v16 = v7;
  if (a2 && v7)
  {
    objc_msgSend(*(id *)(a1 + 32), "infoDictionary");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("NSExtension"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("NSExtensionActionWantsFullScreenPresentation"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v10, "BOOLValue") & 1) != 0)
    {
      v11 = 0;
    }
    else
    {
      objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("NSExtensionAttributes"));
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("NSExtensionActionWantsFullScreenPresentation"));
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v14, "BOOLValue"))
        v11 = 0;
      else
        v11 = 2;

    }
    objc_msgSend(v16, "setModalPresentationStyle:", v11);
    objc_msgSend(v16, "view");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setTintAdjustmentMode:", 1);

    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  }
  else
  {
    v12 = *(_QWORD *)(a1 + 40);
    WFExtensionCommunicationError(a4);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, _QWORD, void *))(v12 + 16))(v12, 0, v9);
  }

}

@end
