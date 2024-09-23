@implementation WFGetMapItemFromContentCollection

void __WFGetMapItemFromContentCollection_block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  uint64_t v13;
  void *v14;
  id v15;
  uint64_t v16;
  void *v17;
  _QWORD v18[4];
  id v19;
  _QWORD v20[4];
  id v21;
  id v22;
  _QWORD v23[5];
  uint64_t v24;
  uint64_t *v25;
  uint64_t v26;
  uint64_t v27;

  v7 = a2;
  v8 = a3;
  v9 = a4;
  objc_msgSend(v7, "items");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "firstObject");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v12 = v11;
    v13 = MEMORY[0x24BDAC760];
    v20[0] = MEMORY[0x24BDAC760];
    v20[1] = 3221225472;
    v20[2] = __WFGetMapItemFromContentCollection_block_invoke_2;
    v20[3] = &unk_24F8B72B8;
    v21 = *(id *)(a1 + 32);
    v22 = *(id *)(a1 + 48);
    v24 = 0;
    v25 = &v24;
    v26 = 0x2050000000;
    v14 = (void *)getCLPlacemarkClass_softClass_35890;
    v27 = getCLPlacemarkClass_softClass_35890;
    if (!getCLPlacemarkClass_softClass_35890)
    {
      v23[0] = v13;
      v23[1] = 3221225472;
      v23[2] = __getCLPlacemarkClass_block_invoke_35891;
      v23[3] = &unk_24F8BB430;
      v23[4] = &v24;
      __getCLPlacemarkClass_block_invoke_35891((uint64_t)v23);
      v14 = (void *)v25[3];
    }
    v15 = objc_retainAutorelease(v14);
    _Block_object_dispose(&v24, 8);
    objc_msgSend(v12, "getObjectRepresentation:forClass:", v20, v15);

  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v18[0] = MEMORY[0x24BDAC760];
      v18[1] = 3221225472;
      v18[2] = __WFGetMapItemFromContentCollection_block_invoke_3;
      v18[3] = &unk_24F8B72E0;
      v17 = *(void **)(a1 + 40);
      v19 = *(id *)(a1 + 48);
      objc_msgSend(v17, "getStringRepresentation:", v18);

      goto LABEL_9;
    }
    v16 = *(_QWORD *)(a1 + 48);
    objc_msgSend(v11, "mapItem");
    v12 = (id)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, id, _QWORD))(v16 + 16))(v16, v12, 0);
  }

LABEL_9:
}

void __WFGetMapItemFromContentCollection_block_invoke_2(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  _QWORD *v15;
  void *v16;
  int v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  uint64_t v30;
  uint64_t *v31;
  uint64_t v32;
  uint64_t v33;
  _QWORD v34[2];
  _QWORD v35[2];
  _QWORD v36[2];
  _QWORD v37[3];

  v37[2] = *MEMORY[0x24BDAC8D0];
  v7 = a2;
  v8 = a3;
  v9 = a4;
  v10 = v9;
  if (!v7)
  {
    objc_msgSend(v9, "domain");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = 0;
    v31 = &v30;
    v32 = 0x2020000000;
    v15 = (_QWORD *)getkCLErrorDomainSymbolLoc_ptr_35917;
    v33 = getkCLErrorDomainSymbolLoc_ptr_35917;
    if (!getkCLErrorDomainSymbolLoc_ptr_35917)
    {
      v16 = CoreLocationLibrary_35908();
      v15 = dlsym(v16, "kCLErrorDomain");
      v31[3] = (uint64_t)v15;
      getkCLErrorDomainSymbolLoc_ptr_35917 = (uint64_t)v15;
    }
    _Block_object_dispose(&v30, 8);
    if (!v15)
    {
      objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "NSString *getkCLErrorDomain(void)");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "handleFailureInFunction:file:lineNumber:description:", v29, CFSTR("WFGetTravelTimeAction.m"), 32, CFSTR("%s"), dlerror(), v30);

      __break(1u);
    }
    v17 = objc_msgSend(v14, "isEqualToString:", *v15);

    if (v17)
    {
      v18 = objc_msgSend(v10, "code");
      if (v18 == 2)
      {
        v26 = (void *)MEMORY[0x24BDD1540];
        v34[0] = *MEMORY[0x24BDD0FD8];
        WFLocalizedString(CFSTR("Unable to Determine Location"));
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v35[0] = v20;
        v34[1] = *MEMORY[0x24BDD0FC8];
        v27 = (void *)MEMORY[0x24BDD17C8];
        WFLocalizedString(CFSTR("The location specified in the %@ action could not be determined due to a network error."));
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v27, "localizedStringWithFormat:", v22, *(_QWORD *)(a1 + 32), v30);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        v35[1] = v23;
        objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v35, v34, 2);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "errorWithDomain:code:userInfo:", *MEMORY[0x24BEC4270], 6, v24);
        v25 = objc_claimAutoreleasedReturnValue();
        goto LABEL_12;
      }
      if (v18 == 8)
      {
        v19 = (void *)MEMORY[0x24BDD1540];
        v36[0] = *MEMORY[0x24BDD0FD8];
        WFLocalizedString(CFSTR("Invalid Location"));
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v37[0] = v20;
        v36[1] = *MEMORY[0x24BDD0FC8];
        v21 = (void *)MEMORY[0x24BDD17C8];
        WFLocalizedString(CFSTR("The location specified in the %@ action could not be found."));
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "localizedStringWithFormat:", v22, *(_QWORD *)(a1 + 32), v30);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        v37[1] = v23;
        objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v37, v36, 2);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "errorWithDomain:code:userInfo:", *MEMORY[0x24BEC4270], 6, v24);
        v25 = objc_claimAutoreleasedReturnValue();
LABEL_12:
        v13 = (void *)v25;

        goto LABEL_13;
      }
    }
    v13 = v10;
LABEL_13:
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
    goto LABEL_14;
  }
  v11 = (void *)objc_msgSend(objc_alloc((Class)getMKPlacemarkClass()), "initWithPlacemark:", v7);
  v12 = (void *)objc_msgSend(objc_alloc((Class)getMKMapItemClass_35886()), "initWithPlacemark:", v11);
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

  v13 = v10;
LABEL_14:

}

void __WFGetMapItemFromContentCollection_block_invoke_3(uint64_t a1, void *a2)
{
  WFGetMapItemFromString(a2, *(void **)(a1 + 32));
}

@end
