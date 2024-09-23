@implementation AppleMusicServiceUtilities

- (void)serviceEnabled:(id)a3
{
  id v3;
  void *v4;
  id v5;
  _QWORD v6[4];
  id v7;

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[ICMusicSubscriptionStatusController sharedStatusController](ICMusicSubscriptionStatusController, "sharedStatusController"));
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_100008B6C;
  v6[3] = &unk_1000C16F8;
  v7 = v3;
  v5 = v3;
  objc_msgSend(v4, "getSubscriptionStatusWithCompletionHandler:", v6);

}

- (void)registerDevice:(id)a3 model:(id)a4 callback:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  id v15;
  id v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  _QWORD v23[4];
  id v24;
  id v25;
  id location;
  id v27;
  id v28;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[AppleMusicServiceUtilities amsDeviceRegistrationPromise](self, "amsDeviceRegistrationPromise"));
  if (!v8 || v11)
  {

  }
  else if (v9)
  {
    if (dword_1000D5418 <= 40
      && (dword_1000D5418 != -1 || _LogCategory_Initialize(&dword_1000D5418, 40)))
    {
      LogPrintF(&dword_1000D5418, "-[AppleMusicServiceUtilities registerDevice:model:callback:]", 40, "AMSDeviceOfferRegistrationTask: serial number %{private}%@ (%@)", v8, v9);
    }
    v22 = (void *)objc_claimAutoreleasedReturnValue(+[AMSDeviceOfferRegistrationTask createBagForSubProfile](AMSDeviceOfferRegistrationTask, "createBagForSubProfile"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[ACAccountStore ams_sharedAccountStore](ACAccountStore, "ams_sharedAccountStore"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "ams_activeiTunesAccount"));

    v14 = objc_msgSend(objc_alloc((Class)AMSDeviceOfferRegistrationTask), "initWithAccount:bag:", v13, v22);
    v15 = objc_msgSend(objc_alloc((Class)AMSDeviceOfferRegistrationItem), "initWithSerialNumber:model:validationData:", v8, v9, 0);
    v16 = objc_alloc((Class)AMSDeviceOfferRegistrationGroup);
    v28 = v15;
    v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v28, 1));
    v18 = objc_msgSend(v16, "initWithRegistrationItems:", v17);

    objc_msgSend(v18, "setValidationOptions:", 5);
    v27 = v18;
    v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v27, 1));
    objc_msgSend(v14, "setRegistrationGroups:", v19);

    v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "perform"));
    -[AppleMusicServiceUtilities setAmsDeviceRegistrationPromise:](self, "setAmsDeviceRegistrationPromise:", v20);

    objc_initWeak(&location, self);
    v21 = (void *)objc_claimAutoreleasedReturnValue(-[AppleMusicServiceUtilities amsDeviceRegistrationPromise](self, "amsDeviceRegistrationPromise"));
    v23[0] = _NSConcreteStackBlock;
    v23[1] = 3221225472;
    v23[2] = sub_100008F2C;
    v23[3] = &unk_1000C1720;
    v24 = v10;
    objc_copyWeak(&v25, &location);
    objc_msgSend(v21, "addFinishBlock:", v23);

    objc_destroyWeak(&v25);
    objc_destroyWeak(&location);

  }
}

- (AMSPromise)amsDeviceRegistrationPromise
{
  return self->_amsDeviceRegistrationPromise;
}

- (void)setAmsDeviceRegistrationPromise:(id)a3
{
  objc_storeStrong((id *)&self->_amsDeviceRegistrationPromise, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_amsDeviceRegistrationPromise, 0);
}

@end
