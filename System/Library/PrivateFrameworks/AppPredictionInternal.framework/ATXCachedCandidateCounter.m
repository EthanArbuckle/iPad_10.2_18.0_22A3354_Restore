@implementation ATXCachedCandidateCounter

- (ATXCachedCandidateCounter)initWithCandidateIdPublisher:(id)a3
{
  id v5;
  ATXCachedCandidateCounter *v6;
  ATXCachedCandidateCounter *v7;
  uint64_t v8;
  NSMutableDictionary *cache;
  objc_super v11;

  v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)ATXCachedCandidateCounter;
  v6 = -[ATXCachedCandidateCounter init](&v11, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_publisher, a3);
    v8 = objc_opt_new();
    cache = v7->_cache;
    v7->_cache = (NSMutableDictionary *)v8;

  }
  return v7;
}

- (void)populateCache
{
  BPSPublisher *publisher;
  id v3;
  _QWORD v4[5];

  publisher = self->_publisher;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __42__ATXCachedCandidateCounter_populateCache__block_invoke_2;
  v4[3] = &unk_1E82E3180;
  v4[4] = self;
  v3 = (id)-[BPSPublisher sinkWithCompletion:receiveInput:](publisher, "sinkWithCompletion:receiveInput:", &__block_literal_global_241, v4);
}

void __42__ATXCachedCandidateCounter_populateCache__block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  v6 = a2;
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "objectForKeyedSubscript:");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v3, "integerValue") + 1);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "setObject:forKeyedSubscript:", v5, v6);

  }
  else
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "setObject:forKeyedSubscript:", &unk_1E83CE590, v6);
  }

}

- (int64_t)countForCandidate:(id)a3
{
  void *v3;
  int64_t v4;

  -[NSMutableDictionary objectForKeyedSubscript:](self->_cache, "objectForKeyedSubscript:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "integerValue");

  return v4;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cache, 0);
  objc_storeStrong((id *)&self->_publisher, 0);
}

@end
