@implementation COCapabilityManagerClientInterfaceMediator

- (COCapabilityManagerClientInterfaceMediator)initWithCapabilityManager:(id)a3
{
  id v4;
  COCapabilityManagerClientInterfaceMediator *v5;
  COCapabilityManagerClientInterfaceMediator *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)COCapabilityManagerClientInterfaceMediator;
  v5 = -[COCapabilityManagerClientInterfaceMediator init](&v8, sel_init);
  v6 = v5;
  if (v5)
    objc_storeWeak((id *)&v5->_manager, v4);

  return v6;
}

- (void)availabilityChanged:(BOOL)a3 ofCapability:(id)a4 inCluster:(id)a5
{
  _BOOL8 v6;
  id v8;
  id WeakRetained;
  void *v10;
  id v11;

  v6 = a3;
  v11 = a4;
  v8 = a5;
  WeakRetained = objc_loadWeakRetained((id *)&self->_manager);
  v10 = WeakRetained;
  if (WeakRetained)
    objc_msgSend(WeakRetained, "availabilityChanged:ofCapability:inCluster:", v6, v11, v8);

}

- (COCapabilityManager)manager
{
  return (COCapabilityManager *)objc_loadWeakRetained((id *)&self->_manager);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_manager);
}

@end
