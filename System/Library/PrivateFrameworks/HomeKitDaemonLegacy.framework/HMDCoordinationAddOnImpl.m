@implementation HMDCoordinationAddOnImpl

- (void)meshController:(id)a3 didTransitionToState:(unint64_t)a4
{
  id WeakRetained;
  void *v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)HMDCoordinationAddOnImpl;
  -[COMeshAddOn meshController:didTransitionToState:](&v8, sel_meshController_didTransitionToState_, a3);
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v7 = WeakRetained;
  if (a4 == 2)
  {
    objc_msgSend(WeakRetained, "meshControllerDidStartElection");
  }
  else if (a4 == 3)
  {
    objc_msgSend(WeakRetained, "meshControllerDidElectLeader");
  }

}

- (void)didChangeNodesForMeshController:(id)a3
{
  id WeakRetained;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)HMDCoordinationAddOnImpl;
  -[COMeshAddOn didChangeNodesForMeshController:](&v5, sel_didChangeNodesForMeshController_, a3);
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "meshControllerDidUpdatesNodes");

}

- (HMDCoordinationAddOnImplDelegate)delegate
{
  return (HMDCoordinationAddOnImplDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
}

@end
