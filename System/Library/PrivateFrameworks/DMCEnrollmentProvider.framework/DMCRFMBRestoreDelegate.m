@implementation DMCRFMBRestoreDelegate

- (DMCRFMBRestoreDelegate)initWithDelegate:(id)a3 source:(id)a4
{
  id v6;
  id v7;
  DMCRFMBRestoreDelegate *v8;
  DMCRFMBRestoreDelegate *v9;
  objc_super v11;

  v6 = a3;
  v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)DMCRFMBRestoreDelegate;
  v8 = -[DMCRFMBRestoreDelegate init](&v11, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeWeak((id *)&v8->_delegate, v6);
    objc_storeWeak((id *)&v9->_snapshotSource, v7);
  }

  return v9;
}

- (void)managerDidFinishRestore:(id)a3
{
  NSObject *v4;
  void *v5;
  void *v6;
  uint8_t v7[16];

  v4 = *(NSObject **)(DMCLogObjects() + 32);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v7 = 0;
    _os_log_impl(&dword_216358000, v4, OS_LOG_TYPE_DEFAULT, "managed restore, DMCRFMBRestoreDelegate calling linked delegate", v7, 2u);
  }
  -[DMCRFMBRestoreDelegate delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[DMCRFMBRestoreDelegate snapshotSource](self, "snapshotSource");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "snapshotSourceDidFinishRestore:", v6);

}

- (DMCRFSnapshotSourceDelegate)delegate
{
  return (DMCRFSnapshotSourceDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (DMCRFSnapshotSource)snapshotSource
{
  return (DMCRFSnapshotSource *)objc_loadWeakRetained((id *)&self->_snapshotSource);
}

- (void)setSnapshotSource:(id)a3
{
  objc_storeWeak((id *)&self->_snapshotSource, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_snapshotSource);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
