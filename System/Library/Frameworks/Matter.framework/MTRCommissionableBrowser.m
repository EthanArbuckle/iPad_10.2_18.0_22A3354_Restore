@implementation MTRCommissionableBrowser

- (MTRCommissionableBrowser)initWithDelegate:(id)a3 controller:(id)a4 queue:(id)a5
{
  id v9;
  id v10;
  id v11;
  MTRCommissionableBrowser *v12;
  MTRCommissionableBrowser *v13;
  objc_super v15;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)MTRCommissionableBrowser;
  v12 = -[MTRCommissionableBrowser init](&v15, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_delegate, a3);
    objc_storeStrong((id *)&v13->_controller, a4);
    objc_storeStrong((id *)&v13->_queue, a5);
  }

  return v13;
}

- (BOOL)start
{
  __n128 v3;

  sub_2340D81EC((uint64_t)&self->_browser, self->_delegate, self->_controller, self->_queue, &v3);
  return v3.n128_u32[0] == 0;
}

- (BOOL)stop
{
  unsigned __int32 v3;
  MTRCommissionableBrowserDelegate *delegate;
  MTRDeviceController *controller;
  OS_dispatch_queue *queue;
  __n128 v8;

  sub_2340D84C8((uint64_t)&self->_browser, self, &v8);
  v3 = v8.n128_u32[0];
  if (!v8.n128_u32[0])
  {
    delegate = self->_delegate;
    self->_delegate = 0;

    controller = self->_controller;
    self->_controller = 0;

    queue = self->_queue;
    self->_queue = 0;

  }
  return v3 == 0;
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
  objc_storeStrong((id *)&self->_queue, a3);
}

- (MTRCommissionableBrowserDelegate)delegate
{
  return self->_delegate;
}

- (MTRDeviceController)controller
{
  return self->_controller;
}

- (CommissionableBrowserInternal)browser
{
  CommissionableBrowserInternal *result;

  retstr->_vptr$DiscoverNodeDelegate = (void **)&off_2505020F0;
  retstr->_vptr$DnssdBrowseDelegate = (void **)&unk_250502148;
  retstr->_vptr$BleScannerDelegate = (void **)&unk_250502180;
  retstr->mBleScannerDelegateOwner = self->_browser.mBleScannerDelegateOwner;
  retstr->var0 = self->_browser.var0;
  retstr->mDelegate = self->_browser.mDelegate;
  retstr->mController = self->_browser.mController;
  result = self->_browser.mDiscoveredResults;
  retstr->mDiscoveredResults = (NSMutableDictionary *)result;
  *(_OWORD *)&retstr->mOnNetworkDevicesAdded = *(_OWORD *)&self->_browser.mOnNetworkDevicesAdded;
  return result;
}

- (void)setBrowser:(CommissionableBrowserInternal *)a3
{
  objc_storeStrong((id *)&self->_browser.mBleScannerDelegateOwner, a3->mBleScannerDelegateOwner);
  objc_storeStrong((id *)&self->_browser.var0, a3->var0);
  objc_storeStrong((id *)&self->_browser.mDelegate, a3->mDelegate);
  objc_storeStrong((id *)&self->_browser.mController, a3->mController);
  objc_storeStrong((id *)&self->_browser.mDiscoveredResults, a3->mDiscoveredResults);
  *(_OWORD *)&self->_browser.mOnNetworkDevicesAdded = *(_OWORD *)&a3->mOnNetworkDevicesAdded;
}

- (void).cxx_destruct
{

  objc_storeStrong((id *)&self->_controller, 0);
  objc_storeStrong((id *)&self->_delegate, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

- (id).cxx_construct
{
  *((_QWORD *)self + 4) = &off_2505020F0;
  *((_QWORD *)self + 5) = &unk_250502148;
  *((_QWORD *)self + 6) = &unk_250502180;
  *(_OWORD *)((char *)self + 56) = 0u;
  *(_OWORD *)((char *)self + 72) = 0u;
  *((_QWORD *)self + 11) = 0;
  return self;
}

@end
