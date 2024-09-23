@implementation FCProductLookup

- (id)initWithOfferName:(void *)a3 appAdamID:(void *)a4 storeExternalVersionID:(void *)a5 bundleID:
{
  id v10;
  id v11;
  id v12;
  id v13;
  id *v14;
  dispatch_group_t v15;
  id v16;
  void *v17;
  objc_class *v18;
  id v19;
  void *v20;
  uint64_t v21;
  id v22;
  void *v23;
  objc_class *v24;
  id v25;
  objc_super v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  void *v31;
  uint64_t *v32;
  uint64_t v33;
  uint64_t *v34;
  uint64_t v35;
  uint64_t v36;

  v10 = a2;
  v11 = a3;
  v12 = a4;
  v13 = a5;
  if (a1)
  {
    v27.receiver = a1;
    v27.super_class = (Class)FCProductLookup;
    v14 = (id *)objc_msgSendSuper2(&v27, sel_init);
    a1 = v14;
    if (v14)
    {
      objc_storeStrong(v14 + 1, a2);
      objc_storeStrong(a1 + 2, a3);
      objc_storeStrong(a1 + 3, a4);
      v15 = dispatch_group_create();
      v16 = a1[5];
      a1[5] = v15;

      v33 = 0;
      v34 = &v33;
      v35 = 0x2050000000;
      v17 = (void *)_MergedGlobals_215;
      v36 = _MergedGlobals_215;
      if (!_MergedGlobals_215)
      {
        v28 = MEMORY[0x1E0C809B0];
        v29 = 3221225472;
        v30 = __getSKProductsRequestClass_block_invoke;
        v31 = &unk_1E46406D0;
        v32 = &v33;
        __getSKProductsRequestClass_block_invoke((uint64_t)&v28);
        v17 = (void *)v34[3];
      }
      v18 = objc_retainAutorelease(v17);
      _Block_object_dispose(&v33, 8);
      v19 = [v18 alloc];
      objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", v10, 0);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = objc_msgSend(v19, "initWithProductIdentifiers:", v20);
      v22 = a1[6];
      a1[6] = (id)v21;

      v33 = 0;
      v34 = &v33;
      v35 = 0x2050000000;
      v23 = (void *)qword_1ED0F8850;
      v36 = qword_1ED0F8850;
      if (!qword_1ED0F8850)
      {
        v28 = MEMORY[0x1E0C809B0];
        v29 = 3221225472;
        v30 = __getSKPaymentQueueClientClass_block_invoke_1;
        v31 = &unk_1E46406D0;
        v32 = &v33;
        __getSKPaymentQueueClientClass_block_invoke_1((uint64_t)&v28);
        v23 = (void *)v34[3];
      }
      v24 = objc_retainAutorelease(v23);
      _Block_object_dispose(&v33, 8);
      v25 = objc_alloc_init(v24);
      objc_msgSend(v25, "setBundleIdentifier:", CFSTR("com.apple.news"));
      objc_msgSend(v25, "setProductsRequestBundleIdentifier:", v13);
      objc_msgSend(v25, "setBundleVersion:", CFSTR("1.0"));
      objc_msgSend(v25, "setStoreExternalVersion:", v12);
      objc_msgSend(v25, "setStoreItemIdentifier:", v11);
      objc_msgSend(a1[6], "setPaymentQueueClient:", v25);
      objc_msgSend(a1[6], "setDelegate:", a1);

    }
  }

  return a1;
}

- (_QWORD)lookup
{
  _QWORD *v1;
  uint64_t v3;
  id v4;
  _QWORD v5[5];

  if (a1)
  {
    v1 = a1;
    if (a1[7])
      return (id)objc_msgSend(objc_alloc(MEMORY[0x1E0D60AF0]), "initWithValue:", a1[7]);
    v3 = a1[8];
    v4 = objc_alloc(MEMORY[0x1E0D60AF0]);
    if (v3)
      return (id)objc_msgSend(v4, "initWithError:", v1[8]);
    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = __25__FCProductLookup_lookup__block_invoke;
    v5[3] = &unk_1E463DAD0;
    v5[4] = v1;
    a1 = (_QWORD *)objc_msgSend(v4, "initWithResolver:", v5);
  }
  return a1;
}

void __25__FCProductLookup_lookup__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  NSObject *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  NSObject *v12;
  NSObject *v13;
  id v14;
  id v15;
  _QWORD block[5];
  id v17;
  id v18;

  v5 = a2;
  v6 = a3;
  v7 = *(_QWORD *)(a1 + 32);
  if (v7)
    v8 = *(NSObject **)(v7 + 40);
  else
    v8 = 0;
  dispatch_group_enter(v8);
  v9 = *(_QWORD *)(a1 + 32);
  if (v9)
    v10 = *(void **)(v9 + 48);
  else
    v10 = 0;
  objc_msgSend(v10, "start");
  v11 = *(_QWORD *)(a1 + 32);
  if (v11)
    v12 = *(NSObject **)(v11 + 40);
  else
    v12 = 0;
  dispatch_get_global_queue(0, 0);
  v13 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __25__FCProductLookup_lookup__block_invoke_2;
  block[3] = &unk_1E463CD80;
  block[4] = v11;
  v17 = v5;
  v18 = v6;
  v14 = v6;
  v15 = v5;
  dispatch_group_notify(v12, v13, block);

}

uint64_t __25__FCProductLookup_lookup__block_invoke_2(uint64_t *a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;

  v2 = a1[4];
  if (!v2)
    goto LABEL_6;
  v3 = *(_QWORD *)(v2 + 56);
  if (!v3)
  {
    if (*(_QWORD *)(v2 + 64))
    {
      v4 = a1[6];
LABEL_7:
      v3 = *(_QWORD *)(v2 + 64);
      return (*(uint64_t (**)(uint64_t, uint64_t))(v4 + 16))(v4, v3);
    }
LABEL_6:
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("com.apple.news.productlookup"), 1001, 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[FCProductLookup setProductLookupError:](a1[4], v5);

    v2 = a1[4];
    v4 = a1[6];
    if (!v2)
    {
      v3 = 0;
      return (*(uint64_t (**)(uint64_t, uint64_t))(v4 + 16))(v4, v3);
    }
    goto LABEL_7;
  }
  v4 = a1[5];
  return (*(uint64_t (**)(uint64_t, uint64_t))(v4 + 16))(v4, v3);
}

- (void)setProductLookupError:(uint64_t)a1
{
  if (a1)
    objc_storeStrong((id *)(a1 + 64), a2);
}

- (void)productsRequest:(id)a3 didReceiveResponse:(id)a4
{
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;

  objc_msgSend(a4, "products", a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v8, "count");
  v6 = v8;
  if (v5)
  {
    objc_msgSend(v8, "firstObject");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (self)
      objc_storeStrong((id *)&self->_product, v7);

    v6 = v8;
  }

}

- (void)requestDidFinish:(id)a3
{
  if (self)
    self = (FCProductLookup *)self->_productRequestGroup;
  dispatch_group_leave(&self->super);
}

- (void)request:(id)a3 didFailWithError:(id)a4
{
  NSObject *productRequestGroup;

  -[FCProductLookup setProductLookupError:]((uint64_t)self, a4);
  if (self)
    productRequestGroup = self->_productRequestGroup;
  else
    productRequestGroup = 0;
  dispatch_group_leave(productRequestGroup);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_productLookupError, 0);
  objc_storeStrong((id *)&self->_product, 0);
  objc_storeStrong((id *)&self->_request, 0);
  objc_storeStrong((id *)&self->_productRequestGroup, 0);
  objc_storeStrong((id *)&self->_bundleID, 0);
  objc_storeStrong((id *)&self->_storeExternalVersionID, 0);
  objc_storeStrong((id *)&self->_appAdamID, 0);
  objc_storeStrong((id *)&self->_offerName, 0);
}

@end
