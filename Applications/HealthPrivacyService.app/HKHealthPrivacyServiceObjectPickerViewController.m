@implementation HKHealthPrivacyServiceObjectPickerViewController

- (HKHealthPrivacyServiceObjectPickerViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  HKHealthPrivacyServiceObjectPickerViewController *v4;
  HKHealthStore *v5;
  HKHealthStore *healthStore;
  HKAuthorizationStore *v7;
  HKAuthorizationStore *authorizationStore;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)HKHealthPrivacyServiceObjectPickerViewController;
  v4 = -[HKHealthPrivacyServiceObjectPickerViewController initWithNibName:bundle:](&v10, "initWithNibName:bundle:", a3, a4);
  if (v4)
  {
    v5 = (HKHealthStore *)objc_alloc_init((Class)HKHealthStore);
    healthStore = v4->_healthStore;
    v4->_healthStore = v5;

    v7 = (HKAuthorizationStore *)objc_msgSend(objc_alloc((Class)HKAuthorizationStore), "initWithHealthStore:", v4->_healthStore);
    authorizationStore = v4->_authorizationStore;
    v4->_authorizationStore = v7;

  }
  return v4;
}

- (void)setPromptSession:(id)a3
{
  id v5;
  HKAuthorizationStore *authorizationStore;
  void *v7;
  id v8;
  uint64_t v9;
  void *v10;
  NSDictionary *v11;
  NSDictionary *samplesRequiringAuthorization;
  HKObjectAuthorizationPromptSessionMetadata *v13;
  HKObjectAuthorizationPromptSessionMetadata *metadata;
  void *v15;
  void *v16;
  id v17;

  v5 = a3;
  objc_storeStrong((id *)&self->_promptSession, a3);
  authorizationStore = self->_authorizationStore;
  v17 = 0;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[HKAuthorizationStore fetchAuthorizationContextForPromptSession:error:](authorizationStore, "fetchAuthorizationContextForPromptSession:error:", v5, &v17));
  v8 = v17;
  v10 = v8;
  if (v7)
  {
    v11 = (NSDictionary *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "samplesRequiringAuthorization"));
    samplesRequiringAuthorization = self->_samplesRequiringAuthorization;
    self->_samplesRequiringAuthorization = v11;

    v13 = (HKObjectAuthorizationPromptSessionMetadata *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "metadata"));
    metadata = self->_metadata;
    self->_metadata = v13;

    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "sessionIdentifier"));
    -[HKHealthPrivacyServiceObjectPickerViewController _beginAuthorizationSessionWithIdentifier:](self, "_beginAuthorizationSessionWithIdentifier:", v15);

  }
  else
  {
    _HKInitializeLogging(v8, v9);
    v16 = (void *)HKLogAuthorization;
    if (os_log_type_enabled(HKLogAuthorization, OS_LOG_TYPE_ERROR))
      sub_100007688(v16, v5, (uint64_t)v10);
    -[HKHealthPrivacyServiceObjectPickerViewController _finishWithError:](self, "_finishWithError:", v10);
  }

}

- (id)_pickerControllerForObjectType:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  unsigned int v13;
  void *v14;

  v4 = a3;
  v5 = objc_opt_class(HKDocumentType);
  if ((objc_opt_isKindOfClass(v4, v5) & 1) == 0)
  {
    v7 = objc_opt_class(HKVerifiableClinicalRecordType);
    if ((objc_opt_isKindOfClass(v4, v7) & 1) != 0)
    {
      v6 = objc_claimAutoreleasedReturnValue(-[HKHealthPrivacyServiceObjectPickerViewController _pickerControllerForSignedClinicalData](self, "_pickerControllerForSignedClinicalData"));
      goto LABEL_11;
    }
    v8 = objc_claimAutoreleasedReturnValue(+[HKPrescriptionType visionPrescriptionType](HKPrescriptionType, "visionPrescriptionType"));
    if ((id)v8 == v4)
    {

    }
    else
    {
      v9 = (void *)v8;
      v10 = objc_claimAutoreleasedReturnValue(+[HKPrescriptionType visionPrescriptionType](HKPrescriptionType, "visionPrescriptionType"));
      if (!v10)
      {

LABEL_14:
        v14 = 0;
        goto LABEL_12;
      }
      v11 = (void *)v10;
      v12 = (void *)objc_claimAutoreleasedReturnValue(+[HKPrescriptionType visionPrescriptionType](HKPrescriptionType, "visionPrescriptionType"));
      v13 = objc_msgSend(v4, "isEqual:", v12);

      if (!v13)
        goto LABEL_14;
    }
    v6 = objc_claimAutoreleasedReturnValue(-[HKHealthPrivacyServiceObjectPickerViewController _pickerControllerForVisionPrescriptions](self, "_pickerControllerForVisionPrescriptions"));
    goto LABEL_11;
  }
  v6 = objc_claimAutoreleasedReturnValue(-[HKHealthPrivacyServiceObjectPickerViewController _pickerControllerForDocuments](self, "_pickerControllerForDocuments"));
LABEL_11:
  v14 = (void *)v6;
LABEL_12:

  return v14;
}

- (id)_pickerControllerForDocuments
{
  id v3;
  void *v4;
  id v5;

  v3 = objc_alloc((Class)HKDocumentPickerViewController);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[NSDictionary allKeys](self->_samplesRequiringAuthorization, "allKeys"));
  v5 = objc_msgSend(v3, "initWithDocuments:presentationStyle:", v4, 1);

  objc_msgSend(v5, "setDelegate:", self);
  objc_msgSend(v5, "setSource:", self->_currentSource);
  return v5;
}

- (id)_pickerControllerForSignedClinicalData
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  id v8;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[NSDictionary allKeys](self->_samplesRequiringAuthorization, "allKeys"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "sortedArrayUsingComparator:", &stru_10000C448));

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[HKHealthPrivacyServiceObjectPickerViewController signedRecordsForClinicalRecords:](self, "signedRecordsForClinicalRecords:", v4));
  v6 = objc_alloc((Class)HKVerifiableClinicalRecordPickerViewController);
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[HKObjectAuthorizationPromptSessionMetadata recordTypes](self->_metadata, "recordTypes"));
  v8 = objc_msgSend(v6, "initWithClinicalRecords:signedRecords:recordTypes:", v4, v5, v7);

  objc_msgSend(v8, "setDelegate:", self);
  objc_msgSend(v8, "setSource:", self->_currentSource);
  objc_msgSend(v8, "setSessionIdentifier:", self->_sessionIdentifier);

  return v8;
}

- (id)_pickerControllerForVisionPrescriptions
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[NSDictionary allKeys](self->_samplesRequiringAuthorization, "allKeys"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "sortedArrayUsingComparator:", &stru_10000C488));

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[NSDictionary hk_filter:](self->_samplesRequiringAuthorization, "hk_filter:", &stru_10000C4C8));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "allKeys"));

  v7 = objc_msgSend(objc_alloc((Class)HKPrescriptionPickerViewController), "initWithHealthStore:samples:enabledSamples:source:", self->_healthStore, v4, v6, self->_currentSource);
  objc_msgSend(v7, "setDelegate:", self);

  return v7;
}

- (void)_configureNavigationController
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  HKObjectType **p_objectType;
  HKHealthPrivacyServicePickerController *v8;
  HKHealthPrivacyServicePickerController *pickerController;
  void *v10;
  id v11;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[NSDictionary allKeys](self->_samplesRequiringAuthorization, "allKeys"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "firstObject"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "sampleType"));
  v6 = v5;
  if (!v5)
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[HKObjectAuthorizationPromptSessionMetadata expectedObjectType](self->_metadata, "expectedObjectType"));
  p_objectType = &self->_objectType;
  objc_storeStrong((id *)&self->_objectType, v6);
  if (!v5)

  v8 = (HKHealthPrivacyServicePickerController *)objc_claimAutoreleasedReturnValue(-[HKHealthPrivacyServiceObjectPickerViewController _pickerControllerForObjectType:](self, "_pickerControllerForObjectType:", *p_objectType));
  pickerController = self->_pickerController;
  self->_pickerController = v8;

  if (self->_pickerController)
  {
    v11 = objc_msgSend(objc_alloc((Class)HKNavigationController), "initWithRootViewController:", self->_pickerController);
    objc_msgSend(v11, "setModalInPresentation:", 1);
    objc_msgSend(v11, "setModalPresentationStyle:", 5);
    -[HKHealthPrivacyServiceObjectPickerViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v11, 0, 0);
  }
  else
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[HKObjectType identifier](*p_objectType, "identifier"));
    v11 = (id)objc_claimAutoreleasedReturnValue(+[NSError hk_error:format:](NSError, "hk_error:format:", 303, CFSTR("No picker view controller for object type: %@"), v10));

    -[HKHealthPrivacyServiceObjectPickerViewController _finishWithError:](self, "_finishWithError:", v11);
  }

}

- (void)_hostApplicationStateDidChange:(unsigned int)a3
{
  uint64_t v3;
  uint64_t v4;
  NSObject *v7;
  _QWORD block[11];

  if (a3 <= 3)
  {
    block[9] = v3;
    block[10] = v4;
    _HKInitializeLogging(self, a2);
    v7 = HKLogAuthorization;
    if (os_log_type_enabled(HKLogAuthorization, OS_LOG_TYPE_DEBUG))
      sub_100007740(a3, v7);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10000452C;
    block[3] = &unk_10000C340;
    block[4] = self;
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
  }
}

- (void)_configureApplicationStateMonitor
{
  HKHealthPrivacyServiceObjectPickerViewController *v2;
  id v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  _QWORD v9[4];
  id v10;
  id location;
  void *v12;

  v2 = self;
  objc_initWeak(&location, self);
  v3 = objc_alloc((Class)BKSApplicationStateMonitor);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[HKHealthPrivacyServiceObjectPickerViewController _hostApplicationBundleIdentifier](v2, "_hostApplicationBundleIdentifier"));
  v12 = v4;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v12, 1));
  v6 = objc_msgSend(v3, "initWithBundleIDs:states:", v5, BKSApplicationStateAll);
  v2 = (HKHealthPrivacyServiceObjectPickerViewController *)((char *)v2 + 88);
  v7 = *(void **)v2->HKViewController_opaque;
  *(_QWORD *)v2->HKViewController_opaque = v6;

  v8 = *(void **)v2->HKViewController_opaque;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_10000469C;
  v9[3] = &unk_10000C368;
  objc_copyWeak(&v10, &location);
  objc_msgSend(v8, "setHandler:", v9);
  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);
}

- (void)_beginAuthorizationSessionWithIdentifier:(id)a3
{
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  id v10;
  _QWORD *v11;
  _QWORD *v12;
  void *v13;
  void *v14;
  _QWORD v15[5];
  _QWORD v16[5];
  id v17;

  v6 = a3;
  v8 = v6;
  if (!v6)
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
    objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HKHealthPrivacyServiceObjectPickerViewController.m"), 183, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("sessionIdentifier != nil"));

  }
  if (self->_sessionIdentifier)
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
    objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HKHealthPrivacyServiceObjectPickerViewController.m"), 184, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("_sessionIdentifier == nil"));

  }
  _HKInitializeLogging(v6, v7);
  v9 = (void *)HKLogAuthorization;
  if (os_log_type_enabled(HKLogAuthorization, OS_LOG_TYPE_DEBUG))
    sub_1000077B4(v9);
  objc_storeStrong((id *)&self->_sessionIdentifier, a3);
  -[HKHealthPrivacyServiceObjectPickerViewController _configureApplicationStateMonitor](self, "_configureApplicationStateMonitor");
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_1000048E8;
  v16[3] = &unk_10000C518;
  v16[4] = self;
  v17 = v8;
  v10 = v8;
  v11 = objc_retainBlock(v16);
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_1000049E0;
  v15[3] = &unk_10000C540;
  v15[4] = self;
  v12 = objc_retainBlock(v15);
  -[HKHealthStore beginAuthorizationDelegateTransactionWithSessionIdentifier:sourceHandler:errorHandler:](self->_healthStore, "beginAuthorizationDelegateTransactionWithSessionIdentifier:sourceHandler:errorHandler:", v10, v12, v11);

}

- (void)_hostDidTerminate
{
  BKSApplicationStateMonitor *applicationStateMonitor;
  NSUUID *sessionIdentifier;
  id v5;

  applicationStateMonitor = self->_applicationStateMonitor;
  self->_applicationStateMonitor = 0;

  if (self->_sessionIdentifier)
  {
    v5 = (id)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", HKErrorDomain, 5, 0));
    -[HKHealthPrivacyServiceObjectPickerViewController _finishWithError:](self, "_finishWithError:", v5);
    -[HKHealthStore endAuthorizationDelegateTransactionWithSessionIdentifier:error:](self->_healthStore, "endAuthorizationDelegateTransactionWithSessionIdentifier:error:", self->_sessionIdentifier, v5);
    sessionIdentifier = self->_sessionIdentifier;
    self->_sessionIdentifier = 0;

  }
}

- (void)viewDidDisappear:(BOOL)a3
{
  NSError *v4;
  NSError *transactionError;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  NSUUID *sessionIdentifier;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)HKHealthPrivacyServiceObjectPickerViewController;
  -[HKHealthPrivacyServiceObjectPickerViewController viewDidDisappear:](&v10, "viewDidDisappear:", a3);
  if (self->_sessionIdentifier)
  {
    v4 = self->_transactionError;
    transactionError = self->_transactionError;
    self->_transactionError = 0;

    _HKInitializeLogging(v6, v7);
    v8 = (void *)HKLogAuthorization;
    if (os_log_type_enabled(HKLogAuthorization, OS_LOG_TYPE_DEBUG))
      sub_10000782C(v8);
    -[HKHealthStore endAuthorizationDelegateTransactionWithSessionIdentifier:error:](self->_healthStore, "endAuthorizationDelegateTransactionWithSessionIdentifier:error:", self->_sessionIdentifier, v4);
    sessionIdentifier = self->_sessionIdentifier;
    self->_sessionIdentifier = 0;

  }
}

- (id)signedRecordsForClinicalRecords:(id)a3
{
  id v4;
  id v5;
  id v6;
  id v7;
  id v8;
  uint64_t v9;
  void *i;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];

  v4 = a3;
  v5 = objc_alloc_init((Class)NSMutableDictionary);
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v6 = v4;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v17;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(_QWORD *)v17 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * (_QWORD)i);
        v12 = (void *)objc_claimAutoreleasedReturnValue(-[HKHealthPrivacyServiceObjectPickerViewController signedClinicalDataRecordForVerifiableClinicalRecord:](self, "signedClinicalDataRecordForVerifiableClinicalRecord:", v11, (_QWORD)v16));
        v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "originIdentifier"));
        objc_msgSend(v5, "setObject:forKeyedSubscript:", v12, v13);

      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v8);
  }

  v14 = objc_msgSend(v5, "copy");
  return v14;
}

- (id)signedClinicalDataRecordForVerifiableClinicalRecord:(id)a3
{
  id v4;
  dispatch_semaphore_t v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  NSObject *v11;
  dispatch_time_t v12;
  intptr_t v13;
  uint64_t v14;
  NSObject *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  NSObject *v23;
  id v24;
  void *v26;
  uint64_t v27;
  _QWORD v28[4];
  NSObject *v29;
  uint64_t *v30;
  uint64_t *v31;
  uint64_t v32;
  uint64_t *v33;
  uint64_t v34;
  uint64_t (*v35)(uint64_t, uint64_t);
  void (*v36)(uint64_t);
  id v37;
  uint64_t v38;
  uint64_t *v39;
  uint64_t v40;
  uint64_t (*v41)(uint64_t, uint64_t);
  void (*v42)(uint64_t);
  id v43;
  uint8_t buf[4];
  HKHealthPrivacyServiceObjectPickerViewController *v45;
  __int16 v46;
  void *v47;
  __int16 v48;
  uint64_t v49;
  id v50;

  v4 = a3;
  v38 = 0;
  v39 = &v38;
  v40 = 0x3032000000;
  v41 = sub_100005094;
  v42 = sub_1000050A4;
  v43 = 0;
  v32 = 0;
  v33 = &v32;
  v34 = 0x3032000000;
  v35 = sub_100005094;
  v36 = sub_1000050A4;
  v37 = 0;
  v5 = dispatch_semaphore_create(0);
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[HKSignedClinicalDataRecordType signedClinicalDataRecordType](HKSignedClinicalDataRecordType, "signedClinicalDataRecordType"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "originIdentifier"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[HKQuery predicateForMedicalRecordsWithSignedClinicalDataOriginIdentifier:](HKQuery, "predicateForMedicalRecordsWithSignedClinicalDataOriginIdentifier:", v7));

  v9 = objc_msgSend(objc_alloc((Class)HKQueryDescriptor), "initWithSampleType:predicate:", v6, v8);
  v50 = v9;
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v50, 1));
  v28[0] = _NSConcreteStackBlock;
  v28[1] = 3221225472;
  v28[2] = sub_1000050AC;
  v28[3] = &unk_10000C568;
  v30 = &v38;
  v31 = &v32;
  v11 = v5;
  v29 = v11;
  -[HKHealthPrivacyServiceObjectPickerViewController _queryMedicalRecordsWithQueryDescriptors:completion:](self, "_queryMedicalRecordsWithQueryDescriptors:completion:", v10, v28);

  v12 = dispatch_time(0, 10000000000);
  v13 = dispatch_semaphore_wait(v11, v12);
  if (v13)
  {
    _HKInitializeLogging(v13, v14);
    v15 = HKLogAuthorization;
    v13 = os_log_type_enabled(HKLogAuthorization, OS_LOG_TYPE_ERROR);
    if ((_DWORD)v13)
      sub_1000078A4((uint64_t)self, v15, v16, v17, v18, v19, v20, v21);
  }
  v22 = (void *)v39[5];
  if (!v22)
  {
    _HKInitializeLogging(v13, v14);
    v23 = HKLogAuthorization;
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    {
      v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "originIdentifier"));
      v27 = v33[5];
      *(_DWORD *)buf = 138543874;
      v45 = self;
      v46 = 2112;
      v47 = v26;
      v48 = 2112;
      v49 = v27;
      _os_log_error_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_ERROR, "%{public}@: Unable to find HKSignedClinicalDataRecord associated with sync identifier %@, error: %@", buf, 0x20u);

    }
    v22 = (void *)v39[5];
  }
  v24 = v22;

  _Block_object_dispose(&v32, 8);
  _Block_object_dispose(&v38, 8);

  return v24;
}

- (void)_queryMedicalRecordsWithQueryDescriptors:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  id v10;
  void *v11;
  _QWORD v12[4];
  id v13;

  v6 = a4;
  v7 = a3;
  v8 = objc_alloc((Class)HKSampleQuery);
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_100005200;
  v12[3] = &unk_10000C590;
  v13 = v6;
  v9 = v6;
  v10 = objc_msgSend(v8, "initWithQueryDescriptors:limit:resultsHandler:", v7, 0, v12);

  v11 = (void *)objc_claimAutoreleasedReturnValue(-[HKHealthPrivacyServiceObjectPickerViewController healthStore](self, "healthStore"));
  objc_msgSend(v11, "executeQuery:", v10);

}

- (id)medicalRecordsForVerifiableClinicalRecord:(id)a3
{
  id v4;
  dispatch_semaphore_t v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  id v11;
  uint64_t v12;
  void *v13;
  id v14;
  NSObject *v15;
  dispatch_time_t v16;
  intptr_t v17;
  uint64_t v18;
  NSObject *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  NSObject *v27;
  id v28;
  void *v30;
  uint64_t v31;
  void *v32;
  _QWORD v33[4];
  NSObject *v34;
  uint64_t *v35;
  uint64_t *v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  uint64_t v41;
  uint64_t *v42;
  uint64_t v43;
  uint64_t (*v44)(uint64_t, uint64_t);
  void (*v45)(uint64_t);
  id v46;
  uint64_t v47;
  uint64_t *v48;
  uint64_t v49;
  uint64_t (*v50)(uint64_t, uint64_t);
  void (*v51)(uint64_t);
  id v52;
  uint8_t buf[4];
  HKHealthPrivacyServiceObjectPickerViewController *v54;
  __int16 v55;
  void *v56;
  __int16 v57;
  uint64_t v58;
  _BYTE v59[128];

  v4 = a3;
  v47 = 0;
  v48 = &v47;
  v49 = 0x3032000000;
  v50 = sub_100005094;
  v51 = sub_1000050A4;
  v52 = 0;
  v41 = 0;
  v42 = &v41;
  v43 = 0x3032000000;
  v44 = sub_100005094;
  v45 = sub_1000050A4;
  v46 = 0;
  v5 = dispatch_semaphore_create(0);
  v32 = v4;
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "originIdentifier"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[HKQuery predicateForMedicalRecordsWithSignedClinicalDataOriginIdentifier:](HKQuery, "predicateForMedicalRecordsWithSignedClinicalDataOriginIdentifier:", v6));

  v8 = (void *)objc_claimAutoreleasedReturnValue(+[HKSampleType medicalRecordTypesWithOptions:](HKSampleType, "medicalRecordTypesWithOptions:", 1));
  v9 = objc_alloc_init((Class)NSMutableArray);
  v39 = 0u;
  v40 = 0u;
  v37 = 0u;
  v38 = 0u;
  v10 = v8;
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v37, v59, 16);
  if (v11)
  {
    v12 = *(_QWORD *)v38;
    do
    {
      v13 = 0;
      do
      {
        if (*(_QWORD *)v38 != v12)
          objc_enumerationMutation(v10);
        v14 = objc_msgSend(objc_alloc((Class)HKQueryDescriptor), "initWithSampleType:predicate:", *(_QWORD *)(*((_QWORD *)&v37 + 1) + 8 * (_QWORD)v13), v7);
        objc_msgSend(v9, "addObject:", v14);

        v13 = (char *)v13 + 1;
      }
      while (v11 != v13);
      v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v37, v59, 16);
    }
    while (v11);
  }

  v33[0] = _NSConcreteStackBlock;
  v33[1] = 3221225472;
  v33[2] = sub_1000055C8;
  v33[3] = &unk_10000C568;
  v35 = &v47;
  v36 = &v41;
  v15 = v5;
  v34 = v15;
  -[HKHealthPrivacyServiceObjectPickerViewController _queryMedicalRecordsWithQueryDescriptors:completion:](self, "_queryMedicalRecordsWithQueryDescriptors:completion:", v9, v33);
  v16 = dispatch_time(0, 10000000000);
  v17 = dispatch_semaphore_wait(v15, v16);
  if (v17)
  {
    _HKInitializeLogging(v17, v18);
    v19 = HKLogAuthorization;
    v17 = os_log_type_enabled(HKLogAuthorization, OS_LOG_TYPE_ERROR);
    if ((_DWORD)v17)
      sub_100007908((uint64_t)self, v19, v20, v21, v22, v23, v24, v25);
  }
  v26 = (void *)v48[5];
  if (!v26)
  {
    _HKInitializeLogging(v17, v18);
    v27 = HKLogAuthorization;
    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
    {
      v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "originIdentifier"));
      v31 = v42[5];
      *(_DWORD *)buf = 138543874;
      v54 = self;
      v55 = 2112;
      v56 = v30;
      v57 = 2112;
      v58 = v31;
      _os_log_error_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_ERROR, "%{public}@: Unable to find HKMedicalRecords associated with sync identifier %@, error: %@", buf, 0x20u);

    }
    v26 = (void *)v48[5];
  }
  v28 = v26;

  _Block_object_dispose(&v41, 8);
  _Block_object_dispose(&v47, 8);

  return v28;
}

- (void)pickerControllerDidFinish:(id)a3 error:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;
  id v13;
  HKHealthPrivacyServiceObjectPickerViewController *v14;

  v6 = a3;
  v7 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[HKHealthPrivacyServiceObjectPickerViewController presentedViewController](self, "presentedViewController"));
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_100005710;
  v11[3] = &unk_10000C4F0;
  v12 = v7;
  v13 = v6;
  v14 = self;
  v9 = v6;
  v10 = v7;
  objc_msgSend(v8, "dismissViewControllerAnimated:completion:", 1, v11);

}

- (void)_finishWithError:(id)a3
{
  id v4;
  void *v5;
  unsigned __int8 v6;
  uint64_t v7;
  uint64_t v8;
  id v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  NSObject *v14;
  id v15;
  void *v16;
  uint8_t v17[24];

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[_HKBehavior sharedBehavior](_HKBehavior, "sharedBehavior"));
  if (objc_msgSend(v5, "isiPad"))
  {
    v6 = +[HKiPadHealthSyncEnablement isSyncPromptedForHealthKit:](HKiPadHealthSyncEnablement, "isSyncPromptedForHealthKit:", self->_healthStore);

    if ((v6 & 1) == 0)
    {
      v9 = objc_msgSend(objc_alloc((Class)HKHealthSyncDisplayController), "initWithHealthStore:source:", self->_healthStore, self->_currentSource);
      v10 = (void *)objc_claimAutoreleasedReturnValue(-[HKHealthPrivacyServiceObjectPickerViewController _healthPrivacyHostViewController](self, "_healthPrivacyHostViewController"));
      objc_msgSend(v9, "setObjectPickerDelegate:", v10);

      _HKInitializeLogging(v11, v12);
      v13 = (void *)HKLogAuthorization;
      if (os_log_type_enabled(HKLogAuthorization, OS_LOG_TYPE_DEFAULT))
      {
        v14 = v13;
        *(_DWORD *)v17 = 138412290;
        *(_QWORD *)&v17[4] = objc_opt_class(self);
        v15 = *(id *)&v17[4];
        _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "%@: Prompting health sync view controller", v17, 0xCu);

      }
      -[HKHealthPrivacyServiceObjectPickerViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v9, 1, 0, *(_OWORD *)v17);
      goto LABEL_10;
    }
  }
  else
  {

  }
  _HKInitializeLogging(v7, v8);
  v16 = (void *)HKLogAuthorization;
  if (os_log_type_enabled(HKLogAuthorization, OS_LOG_TYPE_DEBUG))
    sub_10000796C(v16);
  v9 = (id)objc_claimAutoreleasedReturnValue(-[HKHealthPrivacyServiceObjectPickerViewController _healthPrivacyHostViewController](self, "_healthPrivacyHostViewController"));
  objc_msgSend(v9, "didFinishWithError:", v4);
LABEL_10:

}

- (id)_healthPrivacyHostViewController
{
  return -[HKHealthPrivacyServiceObjectPickerViewController _remoteViewControllerProxy](self, "_remoteViewControllerProxy");
}

- (HKHealthStore)healthStore
{
  return self->_healthStore;
}

- (void)setHealthStore:(id)a3
{
  objc_storeStrong((id *)&self->_healthStore, a3);
}

- (HKAuthorizationStore)authorizationStore
{
  return self->_authorizationStore;
}

- (void)setAuthorizationStore:(id)a3
{
  objc_storeStrong((id *)&self->_authorizationStore, a3);
}

- (HKHealthPrivacyServicePickerController)pickerController
{
  return self->_pickerController;
}

- (void)setPickerController:(id)a3
{
  objc_storeStrong((id *)&self->_pickerController, a3);
}

- (NSError)transactionError
{
  return self->_transactionError;
}

- (void)setTransactionError:(id)a3
{
  objc_storeStrong((id *)&self->_transactionError, a3);
}

- (HKObjectAuthorizationPromptSession)promptSession
{
  return self->_promptSession;
}

- (NSUUID)sessionIdentifier
{
  return self->_sessionIdentifier;
}

- (void)setSessionIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (HKSource)currentSource
{
  return self->_currentSource;
}

- (void)setCurrentSource:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (NSDictionary)samplesRequiringAuthorization
{
  return self->_samplesRequiringAuthorization;
}

- (void)setSamplesRequiringAuthorization:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (HKObjectAuthorizationPromptSessionMetadata)metadata
{
  return self->_metadata;
}

- (void)setMetadata:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (HKObjectType)objectType
{
  return self->_objectType;
}

- (BKSApplicationStateMonitor)applicationStateMonitor
{
  return self->_applicationStateMonitor;
}

- (void)setApplicationStateMonitor:(id)a3
{
  objc_storeStrong((id *)&self->_applicationStateMonitor, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_applicationStateMonitor, 0);
  objc_storeStrong((id *)&self->_objectType, 0);
  objc_storeStrong((id *)&self->_metadata, 0);
  objc_storeStrong((id *)&self->_samplesRequiringAuthorization, 0);
  objc_storeStrong((id *)&self->_currentSource, 0);
  objc_storeStrong((id *)&self->_sessionIdentifier, 0);
  objc_storeStrong((id *)&self->_promptSession, 0);
  objc_storeStrong((id *)&self->_transactionError, 0);
  objc_storeStrong((id *)&self->_pickerController, 0);
  objc_storeStrong((id *)&self->_authorizationStore, 0);
  objc_storeStrong((id *)&self->_healthStore, 0);
}

@end
