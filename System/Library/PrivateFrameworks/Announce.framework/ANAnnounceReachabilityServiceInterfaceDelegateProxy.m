@implementation ANAnnounceReachabilityServiceInterfaceDelegateProxy

- (void)reachabilityLevel:(unint64_t)a3 didChangeForHomeName:(id)a4
{
  id v6;
  id v7;

  v6 = a4;
  -[ANAnnounceReachabilityServiceInterfaceDelegateProxy delegate](self, "delegate");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "reachabilityLevel:didChangeForHomeName:", a3, v6);

}

- (void)reachabilityLevel:(unint64_t)a3 didChangeForRoomName:(id)a4 inHomeName:(id)a5
{
  id v8;
  id v9;
  id v10;

  v8 = a5;
  v9 = a4;
  -[ANAnnounceReachabilityServiceInterfaceDelegateProxy delegate](self, "delegate");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "reachabilityLevel:didChangeForRoomName:inHomeName:", a3, v9, v8);

}

- (void)reachabilityLevel:(unint64_t)a3 didChangeForHomeUUID:(id)a4
{
  id v6;
  id v7;

  v6 = a4;
  -[ANAnnounceReachabilityServiceInterfaceDelegateProxy delegate](self, "delegate");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "reachabilityLevel:didChangeForHomeUUID:", a3, v6);

}

- (void)reachabilityLevel:(unint64_t)a3 didChangeForRoomUUID:(id)a4 inHomeUUID:(id)a5
{
  id v8;
  id v9;
  id v10;

  v8 = a5;
  v9 = a4;
  -[ANAnnounceReachabilityServiceInterfaceDelegateProxy delegate](self, "delegate");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "reachabilityLevel:didChangeForRoomUUID:inHomeUUID:", a3, v9, v8);

}

- (ANAnnounceReachabilityServiceInterfaceDelegate)delegate
{
  return (ANAnnounceReachabilityServiceInterfaceDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
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
