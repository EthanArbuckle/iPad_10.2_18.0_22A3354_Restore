@implementation A11

void __71__gan_model_pre_A11_loadContentsOfURL_configuration_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  gan_model_pre_A11 *v3;
  id v4;

  v4 = a2;
  if (v4)
  {
    v3 = -[gan_model_pre_A11 initWithMLModel:]([gan_model_pre_A11 alloc], "initWithMLModel:", v4);
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }

}

void __62__gan_model_pre_A11_predictionFromFeatures_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  gan_model_pre_A11Output *v6;
  void *v7;
  void *v8;
  gan_model_pre_A11Output *v9;
  uint64_t v10;
  void (*v11)(uint64_t, _QWORD, gan_model_pre_A11Output *);
  id v12;

  v12 = a2;
  if (v12)
  {
    v5 = a3;
    v6 = [gan_model_pre_A11Output alloc];
    objc_msgSend(v12, "featureValueForName:", CFSTR("output"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "multiArrayValue");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = -[gan_model_pre_A11Output initWithOutput:](v6, "initWithOutput:", v8);

    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }
  else
  {
    v10 = *(_QWORD *)(a1 + 32);
    v11 = *(void (**)(uint64_t, _QWORD, gan_model_pre_A11Output *))(v10 + 16);
    v9 = a3;
    v11(v10, 0, v9);
  }

}

void __70__gan_model_pre_A11_predictionFromFeatures_options_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  gan_model_pre_A11Output *v6;
  void *v7;
  void *v8;
  gan_model_pre_A11Output *v9;
  uint64_t v10;
  void (*v11)(uint64_t, _QWORD, gan_model_pre_A11Output *);
  id v12;

  v12 = a2;
  if (v12)
  {
    v5 = a3;
    v6 = [gan_model_pre_A11Output alloc];
    objc_msgSend(v12, "featureValueForName:", CFSTR("output"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "multiArrayValue");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = -[gan_model_pre_A11Output initWithOutput:](v6, "initWithOutput:", v8);

    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }
  else
  {
    v10 = *(_QWORD *)(a1 + 32);
    v11 = *(void (**)(uint64_t, _QWORD, gan_model_pre_A11Output *))(v10 + 16);
    v9 = a3;
    v11(v10, 0, v9);
  }

}

@end
