@implementation HREStandardAsyncRecommendationSource

- (HREStandardAsyncRecommendationSource)init
{
  HREStandardAsyncRecommendationSource *v2;
  uint64_t v3;
  Class generationProcessClass;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)HREStandardAsyncRecommendationSource;
  v2 = -[HREStandardAsyncRecommendationSource init](&v6, sel_init);
  if (v2)
  {
    objc_opt_class();
    v3 = objc_claimAutoreleasedReturnValue();
    generationProcessClass = v2->_generationProcessClass;
    v2->_generationProcessClass = (Class)v3;

  }
  return v2;
}

- (unint64_t)disablingOptions
{
  return 0;
}

- (id)recommendationsForHome:(id)a3 withServiceLikeItems:(id)a4 accessoryTypeGroup:(id)a5 options:(unint64_t)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;

  v10 = a5;
  v11 = a4;
  v12 = a3;
  v13 = objc_alloc_init(-[HREStandardAsyncRecommendationSource generationProcessClass](self, "generationProcessClass"));
  objc_msgSend(v13, "setHome:", v12);

  objc_msgSend(MEMORY[0x24BDBCF20], "setWithArray:", v11);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v13, "setSourceItems:", v14);
  objc_msgSend(v13, "setTypeGroup:", v10);

  objc_msgSend(v13, "setOptions:", a6);
  -[HREStandardAsyncRecommendationSource setupProcess:](self, "setupProcess:", v13);
  if ((objc_msgSend(v13, "shouldGenerateRecommendations") & 1) != 0)
  {
    -[HREStandardAsyncRecommendationSource dispatchProcess:options:actionBlock:](self, "dispatchProcess:options:actionBlock:", v13, a6, &__block_literal_global_8);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v16 = (void *)MEMORY[0x24BE6B608];
    v17 = (void *)objc_opt_new();
    objc_msgSend(v16, "futureWithResult:", v17);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v15;
}

uint64_t __111__HREStandardAsyncRecommendationSource_recommendationsForHome_withServiceLikeItems_accessoryTypeGroup_options___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "generateRecommendations");
}

- (id)dispatchProcess:(id)a3 options:(unint64_t)a4 actionBlock:(id)a5
{
  char v6;
  id v7;
  void (**v8)(id, id);
  int v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v15;
  id v16;
  void (**v17)(id, id);

  v6 = a4;
  v7 = a3;
  v8 = (void (**)(id, id))a5;
  if ((v6 & 0x20) != 0)
  {
    v10 = (void *)MEMORY[0x24BE6B608];
    goto LABEL_5;
  }
  v9 = objc_msgSend(MEMORY[0x24BE4D198], "isInternalTest");
  v10 = (void *)MEMORY[0x24BE6B608];
  if (v9)
  {
LABEL_5:
    v8[2](v8, v7);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "futureWithResult:", v13);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    goto LABEL_6;
  }
  v15 = MEMORY[0x24BDAC760];
  v17 = v8;
  v16 = v7;
  objc_msgSend(MEMORY[0x24BE6B628], "globalAsyncScheduler", v15, 3221225472, __76__HREStandardAsyncRecommendationSource_dispatchProcess_options_actionBlock___block_invoke, &unk_24F218098);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "lazyFutureWithBlock:scheduler:", &v15, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_6:
  return v12;
}

void __76__HREStandardAsyncRecommendationSource_dispatchProcess_options_actionBlock___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2;
  uint64_t v3;
  void (*v4)(uint64_t, uint64_t);
  id v5;
  id v6;

  v3 = *(_QWORD *)(a1 + 32);
  v2 = *(_QWORD *)(a1 + 40);
  v4 = *(void (**)(uint64_t, uint64_t))(v2 + 16);
  v5 = a2;
  v4(v2, v3);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "finishWithResult:", v6);

}

- (void)setupProcess:(id)a3
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  id v47;
  void *v48;
  void *v49;
  char v50;
  id v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  id v61;
  _QWORD v62[4];
  id v63;
  char v64;
  _QWORD v65[4];
  id v66;

  v61 = a3;
  objc_msgSend(v61, "sourceItems");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    objc_msgSend(v61, "sourceItems");
    v4 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = objc_opt_new();
  }
  v60 = (void *)v4;

  objc_msgSend(v60, "na_map:", &__block_literal_global_7);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v60, "copy");
  objc_msgSend(v60, "na_map:", &__block_literal_global_60);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v59 = v6;
  objc_msgSend(v6, "na_flatMap:", &__block_literal_global_263);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v56 = v5;
  objc_msgSend(v5, "na_flatMap:", &__block_literal_global_265);
  v9 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v60, "na_map:", &__block_literal_global_266);
  v10 = objc_claimAutoreleasedReturnValue();
  v58 = v7;
  objc_msgSend(v7, "na_flatMap:", &__block_literal_global_268);
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = (void *)MEMORY[0x24BDBCF20];
  objc_msgSend(v61, "home");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "serviceGroups");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setWithArray:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v65[0] = MEMORY[0x24BDAC760];
  v65[1] = 3221225472;
  v65[2] = __53__HREStandardAsyncRecommendationSource_setupProcess___block_invoke_7;
  v65[3] = &unk_24F218200;
  v66 = v8;
  v16 = v8;
  objc_msgSend(v15, "na_filter:", v65);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v17, "na_flatMap:", &__block_literal_global_271);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "na_setByRemovingObjectsFromSet:", v18);
  v19 = objc_claimAutoreleasedReturnValue();

  v20 = (void *)objc_opt_new();
  v53 = (void *)v19;
  +[HRERecommendableObjectUtilities recommendableObjectsFromHomeKitObjects:](HRERecommendableObjectUtilities, "recommendableObjectsFromHomeKitObjects:", v19);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "unionSet:", v21);

  +[HRERecommendableObjectUtilities recommendableObjectsFromHomeKitObjects:](HRERecommendableObjectUtilities, "recommendableObjectsFromHomeKitObjects:", v17);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "unionSet:", v22);

  v57 = (void *)v9;
  +[HRERecommendableObjectUtilities recommendableObjectsFromHomeKitObjects:](HRERecommendableObjectUtilities, "recommendableObjectsFromHomeKitObjects:", v9);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "unionSet:", v23);

  v55 = (void *)v10;
  +[HRERecommendableObjectUtilities recommendableObjectsFromHomeKitObjects:](HRERecommendableObjectUtilities, "recommendableObjectsFromHomeKitObjects:", v10);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "unionSet:", v24);

  v54 = (void *)v11;
  +[HRERecommendableObjectUtilities recommendableObjectsFromHomeKitObjects:](HRERecommendableObjectUtilities, "recommendableObjectsFromHomeKitObjects:", v11);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "unionSet:", v25);

  v26 = (void *)objc_msgSend(v20, "copy");
  objc_msgSend(v61, "setSourceRecommendableObjects:", v26);

  v27 = (void *)MEMORY[0x24BDBCF20];
  objc_msgSend(v61, "home");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "hf_allServices");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "setWithArray:", v29);
  v30 = (void *)objc_claimAutoreleasedReturnValue();

  v31 = (void *)MEMORY[0x24BDBCF20];
  objc_msgSend(v61, "home");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "hf_allAccessoryProfiles");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "setWithArray:", v33);
  v34 = (void *)objc_claimAutoreleasedReturnValue();

  v35 = (void *)MEMORY[0x24BDBCF20];
  objc_msgSend(v61, "home");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "serviceGroups");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "setWithArray:", v37);
  v38 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v38, "na_flatMap:", &__block_literal_global_274);
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "na_setByRemovingObjectsFromSet:", v39);
  v40 = (void *)objc_claimAutoreleasedReturnValue();

  v41 = (void *)objc_opt_new();
  +[HRERecommendableObjectUtilities recommendableObjectsFromHomeKitObjects:](HRERecommendableObjectUtilities, "recommendableObjectsFromHomeKitObjects:", v40);
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v41, "unionSet:", v42);

  +[HRERecommendableObjectUtilities recommendableObjectsFromHomeKitObjects:](HRERecommendableObjectUtilities, "recommendableObjectsFromHomeKitObjects:", v38);
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v41, "unionSet:", v43);

  +[HRERecommendableObjectUtilities recommendableObjectsFromHomeKitObjects:](HRERecommendableObjectUtilities, "recommendableObjectsFromHomeKitObjects:", v34);
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v41, "unionSet:", v44);

  objc_msgSend(v61, "setHomeRecommendableObjects:", v41);
  objc_msgSend(v61, "typeGroup");
  v45 = (void *)objc_claimAutoreleasedReturnValue();

  if (v45)
  {
    if (objc_msgSend(v20, "count"))
      v46 = v20;
    else
      v46 = v41;
    v47 = v46;
    objc_msgSend(v61, "typeGroup");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BE4D000], "mediaAccessoryTypeGroup");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    v50 = objc_msgSend(v48, "intersectsGroup:", v49);

    v62[0] = MEMORY[0x24BDAC760];
    v62[1] = 3221225472;
    v62[2] = __53__HREStandardAsyncRecommendationSource_setupProcess___block_invoke_10;
    v62[3] = &unk_24F218288;
    v64 = v50;
    v51 = v61;
    v63 = v51;
    objc_msgSend(v47, "na_filter:", v62);
    v52 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v51, "setSourceRecommendableObjects:", v52);
  }

}

id __53__HREStandardAsyncRecommendationSource_setupProcess___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  id v4;

  v2 = a2;
  if (objc_msgSend(v2, "conformsToProtocol:", &unk_255A5FA48))
    v3 = v2;
  else
    v3 = 0;
  v4 = v3;

  return v4;
}

id __53__HREStandardAsyncRecommendationSource_setupProcess___block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  id v4;

  objc_msgSend(a2, "homeKitObject");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v2, "conformsToProtocol:", &unk_255A60378))
    v3 = v2;
  else
    v3 = 0;
  v4 = v3;

  return v4;
}

uint64_t __53__HREStandardAsyncRecommendationSource_setupProcess___block_invoke_3(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "services");
}

uint64_t __53__HREStandardAsyncRecommendationSource_setupProcess___block_invoke_4(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "profiles");
}

uint64_t __53__HREStandardAsyncRecommendationSource_setupProcess___block_invoke_5(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "homeKitObject");
}

uint64_t __53__HREStandardAsyncRecommendationSource_setupProcess___block_invoke_6(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "mediaProfiles");
}

BOOL __53__HREStandardAsyncRecommendationSource_setupProcess___block_invoke_7(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  _BOOL8 v7;

  v3 = a2;
  objc_msgSend(v3, "hf_containedServices");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "count"))
  {
    v5 = objc_msgSend(*(id *)(a1 + 32), "count");

    if (!v5)
    {
      v7 = 0;
      goto LABEL_7;
    }
    objc_msgSend(v3, "hf_containedServices");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "na_setByRemovingObjectsFromSet:", *(_QWORD *)(a1 + 32));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "count") == 0;

  }
  else
  {
    v7 = 0;
  }

LABEL_7:
  return v7;
}

uint64_t __53__HREStandardAsyncRecommendationSource_setupProcess___block_invoke_8(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "hf_containedServices");
}

uint64_t __53__HREStandardAsyncRecommendationSource_setupProcess___block_invoke_9(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "hf_containedServices");
}

uint64_t __53__HREStandardAsyncRecommendationSource_setupProcess___block_invoke_10(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;

  v3 = a2;
  if (objc_msgSend(v3, "hre_isMediaObject") && !*(_BYTE *)(a1 + 40))
  {
    v6 = 0;
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "typeGroup");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "hf_accessoryType");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v4, "containsType:", v5);

  }
  return v6;
}

- (Class)generationProcessClass
{
  return self->_generationProcessClass;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_generationProcessClass, 0);
}

@end
