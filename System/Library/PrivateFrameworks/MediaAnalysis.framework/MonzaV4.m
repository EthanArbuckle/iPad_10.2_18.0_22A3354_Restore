@implementation MonzaV4

void __63__MonzaV4_1_loadContentsOfURL_configuration_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  MonzaV4_1 *v3;
  id v4;

  v4 = a2;
  if (v4)
  {
    v3 = -[MonzaV4_1 initWithMLModel:]([MonzaV4_1 alloc], "initWithMLModel:", v4);
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }

}

void __54__MonzaV4_1_predictionFromFeatures_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  MonzaV4_1Output *v6;
  void *v7;
  void *v8;
  MonzaV4_1Output *v9;
  uint64_t v10;
  void (*v11)(uint64_t, _QWORD, MonzaV4_1Output *);
  id v12;

  v12 = a2;
  if (v12)
  {
    v5 = a3;
    v6 = [MonzaV4_1Output alloc];
    objc_msgSend(v12, "featureValueForName:", CFSTR("angle"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "multiArrayValue");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = -[MonzaV4_1Output initWithAngle:](v6, "initWithAngle:", v8);

    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }
  else
  {
    v10 = *(_QWORD *)(a1 + 32);
    v11 = *(void (**)(uint64_t, _QWORD, MonzaV4_1Output *))(v10 + 16);
    v9 = a3;
    v11(v10, 0, v9);
  }

}

void __62__MonzaV4_1_predictionFromFeatures_options_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  MonzaV4_1Output *v6;
  void *v7;
  void *v8;
  MonzaV4_1Output *v9;
  uint64_t v10;
  void (*v11)(uint64_t, _QWORD, MonzaV4_1Output *);
  id v12;

  v12 = a2;
  if (v12)
  {
    v5 = a3;
    v6 = [MonzaV4_1Output alloc];
    objc_msgSend(v12, "featureValueForName:", CFSTR("angle"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "multiArrayValue");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = -[MonzaV4_1Output initWithAngle:](v6, "initWithAngle:", v8);

    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }
  else
  {
    v10 = *(_QWORD *)(a1 + 32);
    v11 = *(void (**)(uint64_t, _QWORD, MonzaV4_1Output *))(v10 + 16);
    v9 = a3;
    v11(v10, 0, v9);
  }

}

@end
