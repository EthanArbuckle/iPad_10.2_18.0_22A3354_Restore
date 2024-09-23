@implementation SGModel

- (SGModel)initWithModel:(id)a3 locale:(id)a4 featurizer:(id)a5 modelSource:(id)a6
{
  id v12;
  id v13;
  id v14;
  id v15;
  SGModel *v16;
  SGModel *v17;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  objc_super v23;

  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  if (v12)
  {
    if (v13)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SGModels.m"), 53, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("model"));

    if (v13)
    {
LABEL_3:
      if (v14)
        goto LABEL_4;
LABEL_10:
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SGModels.m"), 55, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("featurizer"));

      if (v15)
        goto LABEL_5;
      goto LABEL_11;
    }
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SGModels.m"), 54, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("locale"));

  if (!v14)
    goto LABEL_10;
LABEL_4:
  if (v15)
    goto LABEL_5;
LABEL_11:
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SGModels.m"), 56, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("modelSource"));

LABEL_5:
  v23.receiver = self;
  v23.super_class = (Class)SGModel;
  v16 = -[SGModel init](&v23, sel_init);
  v17 = v16;
  if (v16)
  {
    objc_storeStrong((id *)&v16->_model, a3);
    objc_storeStrong((id *)&v17->_locale, a4);
    objc_storeStrong((id *)&v17->_featurizer, a5);
    objc_storeStrong((id *)&v17->_modelSource, a6);
  }

  return v17;
}

- (id)predictForInput:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  PMLMultiLabelClassifierProtocol *model;
  void *v11;
  void *v12;
  id i;
  uint64_t v14;
  void *v16;

  v5 = a3;
  -[PMLTransformerProtocol transform:](self->_featurizer, "transform:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SGModels.m"), 81, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("[vector isKindOfClass:PMLSparseVector.class]"));

  }
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D19ED0]), "initWithSource:vector:", self->_modelSource, v6);
  v8 = (void *)objc_opt_class();
  objc_msgSend(v7, "source");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v8, "isEqual:", objc_msgSend(v9, "modelClass")) & 1) == 0)
    __assert_rtn("-[SGModel predictForInput:]", "SGModels.m", 83, "[[self class] isEqual:features.source.modelClass]");

  model = self->_model;
  objc_msgSend(v7, "vector");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[PMLMultiLabelClassifierProtocol predict:](model, "predict:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    i = v12;
  }
  else
  {
    v14 = -[PMLMultiLabelClassifierProtocol outputDimension](self->_model, "outputDimension");
    for (i = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", v14); v14; --v14)
      objc_msgSend(i, "addObject:", &unk_1E7E0BD38);
  }

  return i;
}

- (id)trainingFeaturesOf:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
  }
  else
  {
    v6 = (void *)objc_opt_class();
    -[SGModel locale](self, "locale");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "trainingFeaturesOf:inLanguage:", v4, v7);
    v5 = (id)objc_claimAutoreleasedReturnValue();

  }
  return v5;
}

- (PMLMultiLabelClassifierProtocol)model
{
  return (PMLMultiLabelClassifierProtocol *)objc_getProperty(self, a2, 8, 1);
}

- (PMLTransformerProtocol)featurizer
{
  return (PMLTransformerProtocol *)objc_getProperty(self, a2, 16, 1);
}

- (SGModelSource)modelSource
{
  return (SGModelSource *)objc_getProperty(self, a2, 24, 1);
}

- (NSString)locale
{
  return (NSString *)objc_getProperty(self, a2, 32, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_locale, 0);
  objc_storeStrong((id *)&self->_modelSource, 0);
  objc_storeStrong((id *)&self->_featurizer, 0);
  objc_storeStrong((id *)&self->_model, 0);
}

+ (id)transformerInstanceForLanguage:(id)a3
{
  __CFString *v4;
  id v5;
  void *v6;
  __CFString *v7;
  void *v8;
  void *v9;
  id v10;
  __CFString *v11;
  void *v12;
  uint64_t v14;
  uint64_t v15;
  void (*v16)(uint64_t, void *);
  void *v17;
  id v18;
  __CFString *v19;
  uint64_t *v20;
  id v21;
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t (*v25)(uint64_t, uint64_t);
  void (*v26)(uint64_t);
  id v27;

  v4 = (__CFString *)a3;
  if (transformerInstanceForLanguage___pasOnceToken378 != -1)
    dispatch_once(&transformerInstanceForLanguage___pasOnceToken378, &__block_literal_global_691);
  v5 = (id)transformerInstanceForLanguage___pasExprOnceResult;
  v6 = (void *)MEMORY[0x1C3BD4F6C]();
  if (v4)
    v7 = v4;
  else
    v7 = &stru_1E7DB83A8;
  NSStringFromClass((Class)a1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[__CFString stringByAppendingString:](v7, "stringByAppendingString:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_autoreleasePoolPop(v6);
  v22 = 0;
  v23 = &v22;
  v24 = 0x3032000000;
  v25 = __Block_byref_object_copy_;
  v26 = __Block_byref_object_dispose_;
  v27 = 0;
  v14 = MEMORY[0x1E0C809B0];
  v15 = 3221225472;
  v16 = __42__SGModel_transformerInstanceForLanguage___block_invoke_27;
  v17 = &unk_1E7DA7E48;
  v20 = &v22;
  v10 = v9;
  v18 = v10;
  v21 = a1;
  v11 = v4;
  v19 = v11;
  objc_msgSend(v5, "runWithLockAcquired:", &v14);
  objc_msgSend((id)v23[5], "result", v14, v15, v16, v17);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  _Block_object_dispose(&v22, 8);
  return v12;
}

+ (id)transformerInstanceForLanguage:(id)a3 withObjective:(unint64_t)a4
{
  id v6;
  void *v7;

  v6 = a3;
  objc_msgSend((id)objc_msgSend(a1, "modelClassForObjective:", a4), "transformerInstanceForLanguage:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

+ (Class)modelClassForObjective:(unint64_t)a3
{
  void *v6;
  void *v7;

  switch(a3)
  {
    case 0uLL:
    case 1uLL:
    case 2uLL:
    case 3uLL:
    case 4uLL:
    case 5uLL:
    case 6uLL:
    case 7uLL:
      objc_opt_class();
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    default:
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("SGModels.m"), 178, CFSTR("Undefined class for model objective %lu"), a3);

      break;
  }
  return (Class)v7;
}

+ (id)trainingFeaturesOf:(id)a3 inLanguage:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;

  v6 = a3;
  objc_msgSend(a1, "transformerInstanceForLanguage:", a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v7)
  {
    objc_msgSend(v7, "trainingFeaturesOf:", v6);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

+ (id)trainingFeaturesOf:(id)a3 inLanguage:(id)a4 withObjective:(unint64_t)a5
{
  id v8;
  id v9;
  void *v10;

  v8 = a4;
  v9 = a3;
  objc_msgSend((id)objc_msgSend(a1, "modelClassForObjective:", a5), "trainingFeaturesOf:inLanguage:", v9, v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

+ (id)newTransformerInstanceForLanguage:(id)a3
{
  void *v5;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("SGModels.m"), 202, CFSTR("%@ must implement +newTransformerInstanceForLanguage:"), objc_opt_class());

  return 0;
}

+ (id)featurize:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  SGDataDetectorMatch *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  SGDataDetectorMatch *v16;
  _QWORD v17[3];
  _QWORD v18[4];

  v18[3] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = objc_msgSend(v4, "rangeOfString:", CFSTR("%PHONE%"));
  v7 = -[SGDataDetectorMatch initWithMatchType:range:labelRange:labelString:valueRange:valueString:]([SGDataDetectorMatch alloc], "initWithMatchType:range:labelRange:labelString:valueRange:valueString:", 0, 0, 0, 0, 0, &stru_1E7DB83A8, v5, v6, CFSTR("%PHONE%"));
  v17[0] = CFSTR("INPUT_TEXT");
  v17[1] = CFSTR("TARGET_MATCH");
  v18[0] = v4;
  v18[1] = v7;
  v17[2] = CFSTR("DD_MATCHES");
  v16 = v7;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v16, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v18[2] = v8;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v18, v17, 3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(a1, "transformerInstanceForLanguage:", CFSTR("en"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "transformer");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "transformers");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "transform:stopAfterTransformerWithIndex:", v9, objc_msgSend(v12, "count") - 2);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v13, "_pas_componentsJoinedByString:", CFSTR(" "));
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

void __42__SGModel_transformerInstanceForLanguage___block_invoke_27(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  id (*v13)(uint64_t);
  void *v14;
  id v15;
  uint64_t v16;

  v3 = a2;
  objc_msgSend(v3, "objectForKeyedSubscript:", *(_QWORD *)(a1 + 32));
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v6 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v4;

  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40))
  {
    v7 = objc_alloc(MEMORY[0x1E0D815E0]);
    v11 = MEMORY[0x1E0C809B0];
    v12 = 3221225472;
    v13 = __42__SGModel_transformerInstanceForLanguage___block_invoke_2_29;
    v14 = &unk_1E7DA7E20;
    v16 = *(_QWORD *)(a1 + 56);
    v15 = *(id *)(a1 + 40);
    v8 = objc_msgSend(v7, "initWithBlock:", &v11);
    v9 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    v10 = *(void **)(v9 + 40);
    *(_QWORD *)(v9 + 40) = v8;

    objc_msgSend(v3, "setObject:forKeyedSubscript:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), *(_QWORD *)(a1 + 32), v11, v12, v13, v14);
  }

}

id __42__SGModel_transformerInstanceForLanguage___block_invoke_2_29(uint64_t a1)
{
  return (id)objc_msgSend(*(id *)(a1 + 40), "newTransformerInstanceForLanguage:", *(_QWORD *)(a1 + 32));
}

void __42__SGModel_transformerInstanceForLanguage___block_invoke()
{
  void *v0;
  id v1;
  void *v2;
  void *v3;
  void *v4;
  id v5;
  void *v6;
  _QWORD v7[4];
  id v8;

  v0 = (void *)MEMORY[0x1C3BD4F6C]();
  v1 = objc_alloc(MEMORY[0x1E0D815F0]);
  v2 = (void *)objc_opt_new();
  v3 = (void *)objc_msgSend(v1, "initWithGuardedData:", v2);

  v4 = (void *)MEMORY[0x1E0D19EC8];
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __42__SGModel_transformerInstanceForLanguage___block_invoke_2;
  v7[3] = &unk_1E7DB56F0;
  v5 = v3;
  v8 = v5;
  objc_msgSend(v4, "registerOnUpdateBlock:", v7);

  v6 = (void *)transformerInstanceForLanguage___pasExprOnceResult;
  transformerInstanceForLanguage___pasExprOnceResult = (uint64_t)v5;

  objc_autoreleasePoolPop(v0);
}

uint64_t __42__SGModel_transformerInstanceForLanguage___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "runWithLockAcquired:", &__block_literal_global_24);
}

uint64_t __42__SGModel_transformerInstanceForLanguage___block_invoke_3(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "removeAllObjects");
}

@end
