@implementation FLAlertControllerHelper

+ (void)presentAlertWithTitle:(id)a3 message:(id)a4 actions:(id)a5 presentingController:(id)a6
{
  id v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  id v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t j;
  id v27;
  id v28;
  id v29;
  id obj;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  _QWORD v35[5];
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  _BYTE v40[128];
  _BYTE v41[128];
  uint64_t v42;

  v42 = *MEMORY[0x24BDAC8D0];
  v29 = a3;
  v28 = a4;
  v9 = a5;
  v27 = a6;
  v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", objc_msgSend(v9, "count"));
  v36 = 0u;
  v37 = 0u;
  v38 = 0u;
  v39 = 0u;
  obj = v9;
  v11 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v36, v41, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v37;
    v14 = MEMORY[0x24BDAC760];
    do
    {
      for (i = 0; i != v12; ++i)
      {
        if (*(_QWORD *)v37 != v13)
          objc_enumerationMutation(obj);
        v16 = *(void **)(*((_QWORD *)&v36 + 1) + 8 * i);
        v17 = (void *)MEMORY[0x24BDF67E8];
        objc_msgSend(v16, "title", v27);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = objc_msgSend(v16, "style");
        v35[0] = v14;
        v35[1] = 3221225472;
        v35[2] = __86__FLAlertControllerHelper_presentAlertWithTitle_message_actions_presentingController___block_invoke;
        v35[3] = &unk_24D55CDB8;
        v35[4] = v16;
        objc_msgSend(v17, "actionWithTitle:style:handler:", v18, v19, v35);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "addObject:", v20);

      }
      v12 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v36, v41, 16);
    }
    while (v12);
  }

  objc_msgSend(MEMORY[0x24BDF67F0], "alertControllerWithTitle:message:preferredStyle:", v29, v28, 1);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = 0u;
  v32 = 0u;
  v33 = 0u;
  v34 = 0u;
  v22 = v10;
  v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v31, v40, 16);
  if (v23)
  {
    v24 = v23;
    v25 = *(_QWORD *)v32;
    do
    {
      for (j = 0; j != v24; ++j)
      {
        if (*(_QWORD *)v32 != v25)
          objc_enumerationMutation(v22);
        objc_msgSend(v21, "addAction:", *(_QWORD *)(*((_QWORD *)&v31 + 1) + 8 * j), v27);
      }
      v24 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v31, v40, 16);
    }
    while (v24);
  }

  objc_msgSend(v27, "presentViewController:animated:completion:", v21, 1, 0);
}

void __86__FLAlertControllerHelper_presentAlertWithTitle_message_actions_presentingController___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void (**v4)(_QWORD, _QWORD);
  id v5;

  v5 = a2;
  objc_msgSend(*(id *)(a1 + 32), "handler");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    objc_msgSend(*(id *)(a1 + 32), "handler");
    v4 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, id))v4)[2](v4, v5);

  }
}

@end
