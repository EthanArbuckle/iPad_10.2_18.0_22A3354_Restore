@implementation _MFDAMessageStoreSearchResultBodyConsumer

- (_MFDAMessageStoreSearchResultBodyConsumer)init
{
  _MFDAMessageStoreSearchResultBodyConsumer *v2;
  uint64_t v3;
  MFConditionLock *doneCondition;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)_MFDAMessageStoreSearchResultBodyConsumer;
  v2 = -[_MFDAMessageStoreSearchResultBodyConsumer init](&v6, sel_init);
  if (v2)
  {
    v3 = objc_msgSend(objc_alloc(MEMORY[0x1E0D46070]), "initWithName:condition:andDelegate:", CFSTR("done"), 0, v2);
    doneCondition = v2->_doneCondition;
    v2->_doneCondition = (MFConditionLock *)v3;

  }
  return v2;
}

- (BOOL)waitUntilDoneBeforeDate:(id)a3
{
  id v4;
  int v5;

  v4 = a3;
  v5 = -[MFConditionLock lockWhenCondition:beforeDate:](self->_doneCondition, "lockWhenCondition:beforeDate:", 1, v4);
  if (v5)
    -[MFConditionLock unlock](self->_doneCondition, "unlock");

  return v5;
}

- (void)waitUntilDone
{
  -[MFConditionLock lockWhenCondition:](self->_doneCondition, "lockWhenCondition:", 1);
  -[MFConditionLock unlock](self->_doneCondition, "unlock");
}

- (void)actionFailed:(int64_t)a3 forTask:(id)a4 error:(id)a5
{
  id v6;
  id v7;
  char v8;
  uint64_t v9;
  void *v10;
  id v11;
  int64_t v12;

  v12 = a3;
  v6 = a5;
  v11 = v6;
  MFWalkUpDAErrorChain(&v11, &v12);
  v7 = v11;

  v8 = v12 + 1;
  if ((unint64_t)(v12 + 1) <= 0xD)
  {
    if (((1 << v8) & 0x2C0) != 0)
    {
      v9 = 1040;
      goto LABEL_12;
    }
    if (((1 << v8) & 0x2400) != 0)
    {
      v9 = 1033;
      goto LABEL_12;
    }
    if (v12 == -1)
    {
      v9 = 1028;
      goto LABEL_12;
    }
  }
  if (v12 == 63 || v12 == 79)
    v9 = 1032;
  else
    v9 = 1045;
LABEL_12:
  +[MFError errorWithDomain:code:localizedDescription:](MFError, "errorWithDomain:code:localizedDescription:", CFSTR("MFMessageErrorDomain"), v9, 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[_MFDAMessageStoreSearchResultBodyConsumer setError:](self, "setError:", v10);
  -[MFConditionLock lock](self->_doneCondition, "lock");
  -[MFConditionLock unlockWithCondition:](self->_doneCondition, "unlockWithCondition:", 1);

}

- (void)searchResultFetchedWithResponses:(id)a3
{
  -[MFConditionLock lock](self->_doneCondition, "lock", a3);
  -[MFConditionLock unlockWithCondition:](self->_doneCondition, "unlockWithCondition:", 1);
}

- (BOOL)shouldBeginStreamingForMailMessage:(id)a3 format:(int)a4
{
  uint64_t v4;
  id v6;
  void *v7;

  v4 = *(_QWORD *)&a4;
  v6 = a3;
  -[_MFDAMessageStoreSearchResultBodyConsumer streamConsumer](self, "streamConsumer");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v4) = objc_msgSend(v7, "shouldBeginStreamingForMailMessage:format:", v6, v4);

  return v4;
}

- (void)consumeData:(char *)a3 length:(int)a4 format:(int)a5 mailMessage:(id)a6
{
  uint64_t v6;
  uint64_t v7;
  void *v10;
  id v11;

  v6 = *(_QWORD *)&a5;
  v7 = *(_QWORD *)&a4;
  v11 = a6;
  -[_MFDAMessageStoreSearchResultBodyConsumer streamConsumer](self, "streamConsumer");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "consumeData:length:format:mailMessage:", a3, v7, v6, v11);

}

- (void)didEndStreamingForMailMessage:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  -[_MFDAMessageStoreSearchResultBodyConsumer streamConsumer](self, "streamConsumer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "didEndStreamingForMailMessage:", v5);

}

- (MFError)error
{
  return self->_error;
}

- (void)setError:(id)a3
{
  objc_storeStrong((id *)&self->_error, a3);
}

- (MFDAStreamingContentConsumer)streamConsumer
{
  return self->_streamConsumer;
}

- (void)setStreamConsumer:(id)a3
{
  objc_storeStrong((id *)&self->_streamConsumer, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_streamConsumer, 0);
  objc_storeStrong((id *)&self->_doneCondition, 0);
}

@end
