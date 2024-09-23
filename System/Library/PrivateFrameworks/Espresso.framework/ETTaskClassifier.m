@implementation ETTaskClassifier

- (ETTaskClassifier)initWithModelDef:(id)a3 optimizerDef:(id)a4 extractor:(id)a5
{
  return -[ETTaskClassifier initWithModelDef:optimizerDef:extractor:needWeightsInitialization:](self, "initWithModelDef:optimizerDef:extractor:needWeightsInitialization:", a3, a4, a5, 1);
}

- (ETTaskClassifier)initWithModelDef:(id)a3 optimizerDef:(id)a4 extractor:(id)a5 needWeightsInitialization:(BOOL)a6
{
  _BOOL4 v6;
  id v10;
  id v11;
  id v12;
  void *v13;
  uint64_t v14;
  uint64_t *p_shared_owners;
  unint64_t v16;
  _QWORD *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t i;
  ETTaskClassifier *v24;
  objc_super v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  uint64_t v31;
  std::__shared_weak_count *v32;
  _BYTE v33[128];
  uint64_t v34;

  v6 = a6;
  v34 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  +[ETLossConfig softmaxCrossEntropyLoss](ETLossConfig, "softmaxCrossEntropyLoss");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setLabel_name:", CFSTR("label"));
  objc_msgSend(v13, "setLoss_name:", CFSTR("cross_entropy"));
  if (v10)
  {
    objc_msgSend(v10, "network");
    v14 = *(_QWORD *)(v31 + 256);
    if (v32)
    {
      p_shared_owners = &v32->__shared_owners_;
      do
        v16 = __ldaxr((unint64_t *)p_shared_owners);
      while (__stlxr(v16 - 1, (unint64_t *)p_shared_owners));
      if (!v16)
      {
        ((void (*)(std::__shared_weak_count *))v32->__on_zero_shared)(v32);
        std::__shared_weak_count::__release_weak(v32);
      }
    }
  }
  else
  {
    v14 = MEMORY[0x100];
  }
  v17 = (_QWORD *)(v14 + 32);
  if (*(char *)(v14 + 55) < 0)
    v17 = (_QWORD *)*v17;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setOutput_name:", v18);

  v29 = 0u;
  v30 = 0u;
  v27 = 0u;
  v28 = 0u;
  objc_msgSend(v10, "variables");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v27, v33, 16);
  if (v20)
  {
    v21 = *(_QWORD *)v28;
    if (v6)
      v22 = 1;
    else
      v22 = 2;
    do
    {
      for (i = 0; i != v20; ++i)
      {
        if (*(_QWORD *)v28 != v21)
          objc_enumerationMutation(v19);
        objc_msgSend(*(id *)(*((_QWORD *)&v27 + 1) + 8 * i), "setInitializationMode:", v22);
      }
      v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v27, v33, 16);
    }
    while (v20);
  }

  v26.receiver = self;
  v26.super_class = (Class)ETTaskClassifier;
  v24 = -[ETTask initWithModelDef:optimizerDef:lossConfig:extractor:](&v26, sel_initWithModelDef_optimizerDef_lossConfig_extractor_, v10, v11, v13, v12);

  return v24;
}

- (NSArray)class_names
{
  return self->_class_names;
}

- (void)setClass_names:(id)a3
{
  self->_class_names = (NSArray *)a3;
}

@end
