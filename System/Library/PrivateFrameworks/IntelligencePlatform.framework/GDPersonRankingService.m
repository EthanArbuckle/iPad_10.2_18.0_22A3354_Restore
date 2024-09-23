@implementation GDPersonRankingService

- (GDPersonRankingService)initWithConfig:(id)a3
{
  id v4;
  GDPersonRankingService *v5;
  _TtC20IntelligencePlatform20PersonRankingService *v6;
  const char *v7;
  uint64_t v8;
  _TtC20IntelligencePlatform20PersonRankingService *innerService;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)GDPersonRankingService;
  v5 = -[GDPersonRankingService init](&v11, sel_init);
  if (v5)
  {
    v6 = [_TtC20IntelligencePlatform20PersonRankingService alloc];
    v8 = objc_msgSend_initWithConfig_(v6, v7, (uint64_t)v4);
    innerService = v5->_innerService;
    v5->_innerService = (_TtC20IntelligencePlatform20PersonRankingService *)v8;

  }
  return v5;
}

- (id)rankedPersonsWithMaxCount:(int64_t)a3 error:(id *)a4
{
  void *v5;
  NSObject *v6;
  id v8;
  int v9;
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  objc_msgSend_rankedPersonsForObjCWithMaxCount_error_(self->_innerService, a2, a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
    GDLifeEventLog();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      v8 = *a4;
      v9 = 138412290;
      v10 = v8;
      _os_log_error_impl(&dword_1AE4F2000, v6, OS_LOG_TYPE_ERROR, "Failed to retrieve ranked persons with error: %@", (uint8_t *)&v9, 0xCu);
    }

  }
  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_innerService, 0);
}

@end
