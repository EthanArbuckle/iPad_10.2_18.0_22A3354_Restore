@implementation MRUHardwareVolumeAssertion

- (MRUHardwareVolumeAssertion)initWithHardwareVolumeController:(id)a3 volumeDataSource:(id)a4 reason:(id)a5
{
  id v8;
  id v9;
  id v10;
  MRUHardwareVolumeAssertion *v11;
  MRUHardwareVolumeAssertion *v12;
  objc_super v14;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v14.receiver = self;
  v14.super_class = (Class)MRUHardwareVolumeAssertion;
  v11 = -[MRUHardwareVolumeAssertion init](&v14, sel_init);
  v12 = v11;
  if (v11)
  {
    objc_storeWeak((id *)&v11->_hardwareVolumeController, v8);
    objc_storeWeak((id *)&v12->_volumeDataSource, v9);
    objc_storeStrong((id *)&v12->_reason, a5);
  }

  return v12;
}

- (NSString)description
{
  void *v3;
  uint64_t v4;
  id WeakRetained;
  void *v6;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  WeakRetained = objc_loadWeakRetained((id *)&self->_volumeDataSource);
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ dataSource: %@ | reason: %@>"), v4, WeakRetained, self->_reason);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v6;
}

- (void)dealloc
{
  objc_super v3;

  -[MRUHardwareVolumeAssertion invalidate](self, "invalidate");
  v3.receiver = self;
  v3.super_class = (Class)MRUHardwareVolumeAssertion;
  -[MRUHardwareVolumeAssertion dealloc](&v3, sel_dealloc);
}

- (void)invalidate
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_hardwareVolumeController);
  objc_msgSend(WeakRetained, "unregisterAssertion:", self);

}

- (MRUHardwareVolumeController)hardwareVolumeController
{
  return (MRUHardwareVolumeController *)objc_loadWeakRetained((id *)&self->_hardwareVolumeController);
}

- (void)setHardwareVolumeController:(id)a3
{
  objc_storeWeak((id *)&self->_hardwareVolumeController, a3);
}

- (MPVolumeControllerDataSource)volumeDataSource
{
  return (MPVolumeControllerDataSource *)objc_loadWeakRetained((id *)&self->_volumeDataSource);
}

- (void)setVolumeDataSource:(id)a3
{
  objc_storeWeak((id *)&self->_volumeDataSource, a3);
}

- (NSString)reason
{
  return self->_reason;
}

- (void)setReason:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_reason, 0);
  objc_destroyWeak((id *)&self->_volumeDataSource);
  objc_destroyWeak((id *)&self->_hardwareVolumeController);
}

@end
