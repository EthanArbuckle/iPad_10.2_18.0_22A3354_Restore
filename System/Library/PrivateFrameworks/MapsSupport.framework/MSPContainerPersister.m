@implementation MSPContainerPersister

- (void)fetchStateSnapshotWithCompletion:(id)a3
{
  -[MSPContainerPersister doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);
}

- (void)commitEditWithNewContents:(id)a3 edits:(id)a4 appliedToOldContents:(id)a5 completion:(id)a6
{
  -[MSPContainerPersister doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2, a4, a5, a6);
}

- (void)commitByMergingWithStateSnapshot:(id)a3 mergeOptions:(id)a4 completion:(id)a5
{
  void *v6;
  id v7;
  id v8;

  if (a5)
  {
    v6 = (void *)MEMORY[0x1E0CB35C8];
    v7 = a5;
    objc_msgSend(v6, "errorWithDomain:code:userInfo:", CFSTR("com.apple.MapsSupport.MSPContainer"), 6, 0);
    v8 = (id)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, _QWORD, _QWORD, id))a5 + 2))(v7, 0, 0, v8);

  }
}

- (void)eraseWithCompletion:(id)a3
{
  void *v4;
  uint64_t v5;
  id v6;
  id v7;

  if (a3)
  {
    v4 = (void *)MEMORY[0x1E0CB35C8];
    v5 = *MEMORY[0x1E0CB28A8];
    v6 = a3;
    objc_msgSend(v4, "errorWithDomain:code:userInfo:", v5, 3072, 0);
    v7 = (id)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, id))a3 + 2))(v6, v7);

  }
}

- (MSPContainerPersisterDelegate)delegate
{
  return (MSPContainerPersisterDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (int64_t)duplicatesPolicy
{
  return self->_duplicatesPolicy;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
}

@end
