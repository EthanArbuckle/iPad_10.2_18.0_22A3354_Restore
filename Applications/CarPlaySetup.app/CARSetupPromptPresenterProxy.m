@implementation CARSetupPromptPresenterProxy

- (void)presentBluetoothConfirmationPromptForVehicleName:(id)a3 numericCode:(id)a4 responseHandler:(id)a5
{
  id v7;
  id v8;
  id v9;
  _QWORD block[5];
  id v11;
  id v12;
  id v13;

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100003AF8;
  block[3] = &unk_10000C3A8;
  block[4] = self;
  v11 = a3;
  v12 = a4;
  v13 = a5;
  v7 = v13;
  v8 = v12;
  v9 = v11;
  dispatch_sync((dispatch_queue_t)&_dispatch_main_q, block);

}

- (void)presentBluetoothContactsSyncPromptWithResponseHandler:(id)a3
{
  id v3;
  _QWORD block[5];
  id v5;

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100003D78;
  block[3] = &unk_10000C3D0;
  block[4] = self;
  v5 = a3;
  v3 = v5;
  dispatch_sync((dispatch_queue_t)&_dispatch_main_q, block);

}

- (void)presentBluetoothFailedPromptForVehicleName:(id)a3 isTimeout:(BOOL)a4 responseHandler:(id)a5
{
  id v7;
  id v8;
  _QWORD block[5];
  id v10;
  id v11;
  BOOL v12;

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100004018;
  block[3] = &unk_10000C3F8;
  block[4] = self;
  v10 = a3;
  v12 = a4;
  v11 = a5;
  v7 = v11;
  v8 = v10;
  dispatch_sync((dispatch_queue_t)&_dispatch_main_q, block);

}

- (void)presentWaitingPrompt
{
  _QWORD block[5];

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100004214;
  block[3] = &unk_10000C420;
  block[4] = self;
  dispatch_sync((dispatch_queue_t)&_dispatch_main_q, block);
}

- (void)presentAllowWhileLockedPromptForVehicleName:(id)a3 responseHandler:(id)a4
{
  id v5;
  id v6;
  _QWORD block[5];
  id v8;
  id v9;

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10000438C;
  block[3] = &unk_10000C448;
  block[4] = self;
  v8 = a3;
  v9 = a4;
  v5 = v9;
  v6 = v8;
  dispatch_sync((dispatch_queue_t)&_dispatch_main_q, block);

}

- (void)presentConnectPromptWithBluetoothOnlyOption:(BOOL)a3 wirelessEnablement:(unint64_t)a4 responseHandler:(id)a5
{
  id v7;
  _QWORD block[5];
  id v9;
  unint64_t v10;
  BOOL v11;

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100004614;
  block[3] = &unk_10000C470;
  v11 = a3;
  v9 = a5;
  v10 = a4;
  block[4] = self;
  v7 = v9;
  dispatch_sync((dispatch_queue_t)&_dispatch_main_q, block);

}

- (void)presentUseWirelessPromptWithWirelessEnablement:(unint64_t)a3 declineVariant:(unint64_t)a4 responseHandler:(id)a5
{
  id v5;
  _QWORD block[5];
  id v7;
  unint64_t v8;
  unint64_t v9;

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000048A8;
  block[3] = &unk_10000C498;
  v8 = a3;
  v9 = a4;
  block[4] = self;
  v7 = a5;
  v5 = v7;
  dispatch_sync((dispatch_queue_t)&_dispatch_main_q, block);

}

- (void)presentEnhancedIntegrationPromptForVehicleName:(id)a3 responseHandler:(id)a4
{
  id v6;
  id v7;
  _QWORD block[4];
  id v9;
  CARSetupPromptPresenterProxy *v10;
  id v11;

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100004B54;
  block[3] = &unk_10000C448;
  v9 = a3;
  v10 = self;
  v11 = a4;
  v6 = v11;
  v7 = v9;
  dispatch_sync((dispatch_queue_t)&_dispatch_main_q, block);

}

- (void)presentAssetSupportingConnectPromptWithBluetoothOnlyOption:(BOOL)a3 wirelessEnablement:(unint64_t)a4 responseHandler:(id)a5
{
  id v7;
  _QWORD block[5];
  id v9;
  unint64_t v10;
  BOOL v11;

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100004E1C;
  block[3] = &unk_10000C470;
  v11 = a3;
  v9 = a5;
  v10 = a4;
  block[4] = self;
  v7 = v9;
  dispatch_sync((dispatch_queue_t)&_dispatch_main_q, block);

}

- (void)presentAssetSupportingUseWirelessPromptWithWirelessEnablement:(unint64_t)a3 declineVariant:(unint64_t)a4 responseHandler:(id)a5
{
  id v5;
  _QWORD block[5];
  id v7;
  unint64_t v8;
  unint64_t v9;

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000050B0;
  block[3] = &unk_10000C498;
  v8 = a3;
  v9 = a4;
  block[4] = self;
  v7 = a5;
  v5 = v7;
  dispatch_sync((dispatch_queue_t)&_dispatch_main_q, block);

}

- (void)presentAssetProgressPromptForVehicleName:(id)a3 cancelHandler:(id)a4
{
  id v6;
  id v7;
  _QWORD block[4];
  id v9;
  CARSetupPromptPresenterProxy *v10;
  id v11;

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10000535C;
  block[3] = &unk_10000C448;
  v9 = a3;
  v10 = self;
  v11 = a4;
  v6 = v11;
  v7 = v9;
  dispatch_sync((dispatch_queue_t)&_dispatch_main_q, block);

}

- (void)presentAssetReadyPromptForVehicleName:(id)a3 confirmationHandler:(id)a4
{
  id v6;
  id v7;
  _QWORD block[4];
  id v9;
  CARSetupPromptPresenterProxy *v10;
  id v11;

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100005624;
  block[3] = &unk_10000C448;
  v9 = a3;
  v10 = self;
  v11 = a4;
  v6 = v11;
  v7 = v9;
  dispatch_sync((dispatch_queue_t)&_dispatch_main_q, block);

}

- (void)presentAssetReadySoonPromptForVehicleName:(id)a3 confirmationHandler:(id)a4
{
  id v6;
  id v7;
  _QWORD block[4];
  id v9;
  CARSetupPromptPresenterProxy *v10;
  id v11;

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000058AC;
  block[3] = &unk_10000C448;
  v9 = a3;
  v10 = self;
  v11 = a4;
  v6 = v11;
  v7 = v9;
  dispatch_sync((dispatch_queue_t)&_dispatch_main_q, block);

}

- (void)presentSetupCarKeysPromptForVehicleName:(id)a3 carKeyInfo:(id)a4 cancelHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  _QWORD block[4];
  id v12;
  CARSetupPromptPresenterProxy *v13;
  id v14;
  id v15;

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100005B48;
  block[3] = &unk_10000C3A8;
  v12 = a3;
  v13 = self;
  v14 = a4;
  v15 = a5;
  v8 = v15;
  v9 = v14;
  v10 = v12;
  dispatch_sync((dispatch_queue_t)&_dispatch_main_q, block);

}

- (CARSetupPromptDirector)director
{
  return (CARSetupPromptDirector *)objc_loadWeakRetained((id *)&self->_director);
}

- (void)setDirector:(id)a3
{
  objc_storeWeak((id *)&self->_director, a3);
}

- (NSProgress)progress
{
  return self->_progress;
}

- (void)setProgress:(id)a3
{
  objc_storeStrong((id *)&self->_progress, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_progress, 0);
  objc_destroyWeak((id *)&self->_director);
}

@end
