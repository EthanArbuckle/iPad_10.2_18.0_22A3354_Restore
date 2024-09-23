@implementation COMeshAddOn

- (COMeshAddOn)init
{
  COMeshAddOn *v2;
  COMeshAddOn *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)COMeshAddOn;
  v2 = -[COMeshAddOn init](&v5, sel_init);
  v3 = v2;
  if (v2)
    objc_storeStrong((id *)&v2->_meshControllerQueue, MEMORY[0x24BDAC9B8]);
  return v3;
}

- (void)didAddToMeshController:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[COMeshAddOn setMeshController:](self, "setMeshController:", v4);
  objc_msgSend(v4, "dispatchQueue");
  v5 = (id)objc_claimAutoreleasedReturnValue();

  -[COMeshAddOn setMeshControllerQueue:](self, "setMeshControllerQueue:", v5);
}

- (void)didRemoveFromMeshController:(id)a3
{
  -[COMeshAddOn setMeshController:](self, "setMeshController:", 0);
}

- (void)willStartMeshController:(id)a3
{
  NSObject *v3;

  objc_msgSend(a3, "dispatchQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

}

- (void)didStartMeshController:(id)a3
{
  NSObject *v3;

  objc_msgSend(a3, "dispatchQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

}

- (void)willStopMeshController:(id)a3
{
  NSObject *v3;

  objc_msgSend(a3, "dispatchQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

}

- (void)didStopMeshController:(id)a3
{
  NSObject *v3;

  objc_msgSend(a3, "dispatchQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

}

- (void)meshController:(id)a3 willTransitionToState:(unint64_t)a4
{
  NSObject *v4;

  objc_msgSend(a3, "dispatchQueue");
  v4 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v4);

}

- (void)meshController:(id)a3 didTransitionToState:(unint64_t)a4
{
  NSObject *v4;

  objc_msgSend(a3, "dispatchQueue");
  v4 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v4);

}

- (void)didChangeNodesForMeshController:(id)a3
{
  NSObject *v3;

  objc_msgSend(a3, "dispatchQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

}

- (COMeshController)meshController
{
  return (COMeshController *)objc_loadWeakRetained((id *)&self->_meshController);
}

- (void)setMeshController:(id)a3
{
  objc_storeWeak((id *)&self->_meshController, a3);
}

- (OS_dispatch_queue)meshControllerQueue
{
  return self->_meshControllerQueue;
}

- (void)setMeshControllerQueue:(id)a3
{
  objc_storeStrong((id *)&self->_meshControllerQueue, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_meshControllerQueue, 0);
  objc_destroyWeak((id *)&self->_meshController);
}

@end
