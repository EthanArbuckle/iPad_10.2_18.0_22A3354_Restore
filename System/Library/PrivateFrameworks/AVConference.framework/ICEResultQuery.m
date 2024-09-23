@implementation ICEResultQuery

- (ICEResultQuery)initWithResult:(tagCONNRESULT *)a3
{
  ICEResultQuery *v4;
  ICEResultQuery *v5;
  tagCONNRESULT *v6;
  objc_super v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v8.receiver = self;
  v8.super_class = (Class)ICEResultQuery;
  v4 = -[ICEResultQuery init](&v8, sel_init);
  v5 = v4;
  if (a3)
  {
    v4->callID = a3->dwCallID;
    v6 = (tagCONNRESULT *)malloc_type_calloc(1uLL, 0x140uLL, 0x1020040A6FBA1A4uLL);
    v5->result = v6;
    memcpy(v6, a3, sizeof(tagCONNRESULT));
  }
  v5->isQueryAnswered = 1;
  return v5;
}

- (ICEResultQuery)initWithCallID:(unsigned int)a3
{
  ICEResultQuery *result;
  objc_super v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v5.receiver = self;
  v5.super_class = (Class)ICEResultQuery;
  result = -[ICEResultQuery init](&v5, sel_init);
  result->result = 0;
  result->callID = a3;
  result->isQueryAnswered = 0;
  return result;
}

- (void)setResult:(tagCONNRESULT *)a3
{
  tagCONNRESULT *result;
  tagCONNRESULT *v6;

  if (a3)
  {
    result = self->result;
    if (result)
      free(result);
    v6 = (tagCONNRESULT *)malloc_type_calloc(1uLL, 0x140uLL, 0x1020040A6FBA1A4uLL);
    self->result = v6;
    memcpy(v6, a3, sizeof(tagCONNRESULT));
  }
  self->isQueryAnswered = 1;
}

- (tagCONNRESULT)result
{
  return self->result;
}

- (void)dealloc
{
  objc_super v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  free(self->result);
  v3.receiver = self;
  v3.super_class = (Class)ICEResultQuery;
  -[ICEResultQuery dealloc](&v3, sel_dealloc);
}

- (unsigned)callID
{
  return self->callID;
}

- (void)setCallID:(unsigned int)a3
{
  self->callID = a3;
}

- (BOOL)isQueryAnswered
{
  return self->isQueryAnswered;
}

- (void)setIsQueryAnswered:(BOOL)a3
{
  self->isQueryAnswered = a3;
}

@end
