@implementation _MFDAMessageStoreFetchHeadersRequest

- (unint64_t)generationNumber
{
  unint64_t v4;
  void *v6;

  v4 = -[MFMessage generationNumber](self->message, "generationNumber");
  if (!v4)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MFDAMessageStore.m"), 1251, CFSTR("fetchable messages should have non-zero generationNumer"));

  }
  return v4;
}

- (BOOL)shouldSend
{
  return 1;
}

- (BOOL)isUserRequested
{
  return 1;
}

- (unint64_t)hash
{
  void *v2;
  unint64_t v3;

  -[MFMessage remoteID](self->message, "remoteID");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hash");

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  id *v4;
  void *v5;
  void *v6;
  char v7;

  v4 = (id *)a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[MFMessage remoteID](self->message, "remoteID");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4[6], "remoteID");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v5, "isEqualToString:", v6);

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->message, 0);
  objc_storeStrong((id *)&self->store, 0);
  objc_storeStrong((id *)&self->consumer, 0);
}

@end
