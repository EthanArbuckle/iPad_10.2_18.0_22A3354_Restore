@implementation CVNLPTextDecodingResult

- (CVNLPTextDecodingResult)initWithCandidates:(id)a3
{
  id v5;
  CVNLPTextDecodingResult *v6;
  CVNLPTextDecodingResult *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CVNLPTextDecodingResult;
  v6 = -[CVNLPTextDecodingResult init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_candidates, a3);

  return v7;
}

- (int64_t)count
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  int64_t v8;

  objc_msgSend_candidates(self, a2, v2, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend_count(v4, v5, v6, v7);

  return v8;
}

- (NSArray)candidates
{
  return self->_candidates;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_candidates, 0);
}

@end
