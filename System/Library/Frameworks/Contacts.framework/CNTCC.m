@implementation CNTCC

+ (id)sharedInstance
{
  if (sharedInstance_cn_once_token_0 != -1)
    dispatch_once(&sharedInstance_cn_once_token_0, &__block_literal_global_9);
  return (id)sharedInstance_cn_once_object_0;
}

void __23__CNTCC_sharedInstance__block_invoke()
{
  CNTCC *v0;
  void *v1;

  v0 = objc_alloc_init(CNTCC);
  v1 = (void *)sharedInstance_cn_once_object_0;
  sharedInstance_cn_once_object_0 = (uint64_t)v0;

}

- (CNTCC)tccServices
{
  id v3;

  v3 = (id)cn_objectResultWithObjectLock();
  return self->_tccServices;
}

id __20__CNTCC_tccServices__block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;

  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 8);
  if (!v2)
  {
    objc_msgSend(MEMORY[0x1E0D13BA8], "defaultTCC");
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = *(_QWORD *)(a1 + 32);
    v5 = *(void **)(v4 + 8);
    *(_QWORD *)(v4 + 8) = v3;

    v2 = *(void **)(*(_QWORD *)(a1 + 32) + 8);
  }
  return v2;
}

- (int)accessPreflight
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;

  if (accessPreflight_cn_once_token_1 != -1)
    dispatch_once(&accessPreflight_cn_once_token_1, &__block_literal_global_3_0);
  v3 = (id)accessPreflight_cn_once_object_1;
  -[CNTCC tccServices](self, "tccServices");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "checkAuthorizationStatusOfCurrentProcess");

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  LODWORD(v3) = objc_msgSend(v7, "integerValue");
  return (int)v3;
}

void __24__CNTCC_accessPreflight__block_invoke()
{
  void *v0;
  uint64_t v1;
  void *v2;
  _QWORD v3[4];
  _QWORD v4[5];

  v4[4] = *MEMORY[0x1E0C80C00];
  v3[0] = &unk_1E2A3FED0;
  v3[1] = &unk_1E2A3FF00;
  v4[0] = &unk_1E2A3FEE8;
  v4[1] = &unk_1E2A3FF18;
  v3[2] = &unk_1E2A3FF30;
  v3[3] = &unk_1E2A3FF60;
  v4[2] = &unk_1E2A3FF48;
  v4[3] = &unk_1E2A3FF48;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v4, v3, 4);
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = objc_msgSend(v0, "copy");
  v2 = (void *)accessPreflight_cn_once_object_1;
  accessPreflight_cn_once_object_1 = v1;

}

- (void)setTccServices:(id)a3
{
  objc_storeStrong((id *)&self->_tccServices, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tccServices, 0);
}

@end
