@implementation VettingHandler

- (VettingHandler)initWithCloudKitURL:(id)a3
{
  id v4;
  VettingHandler *v5;
  NSURL *v6;
  NSURL *url;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)VettingHandler;
  v5 = -[VettingHandler init](&v9, "init");
  if (v5)
  {
    v6 = (NSURL *)objc_msgSend(v4, "copy");
    url = v5->_url;
    v5->_url = v6;

  }
  return v5;
}

- (void)fetchVettingRecordWithVettingToken:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  id v14;
  id v15;
  void *v16;
  id v17;
  void *v18;
  id v19;
  id v20;
  id v21;
  id v22;
  void *v23;
  _QWORD v24[4];
  id v25;
  id v26;
  _QWORD *v27;
  _QWORD *v28;
  _QWORD v29[4];
  id v30;
  id v31;
  _QWORD *v32;
  _QWORD *v33;
  _QWORD v34[5];
  id v35;
  _QWORD v36[5];
  id v37;
  id v38;

  v6 = a3;
  v7 = a4;
  v8 = objc_alloc((Class)CKContainerID);
  v9 = objc_msgSend(v8, "initWithContainerIdentifier:environment:", kCKCompleteParticipantVettingVettingRecordContainerName, 1);
  if (__sTestOverridesAvailable
    && (v10 = (void *)objc_claimAutoreleasedReturnValue(-[VettingHandler testDevice](self, "testDevice")),
        v10,
        v10))
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[VettingHandler testDevice](self, "testDevice"));
    v12 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "containerWithContainerID:", v9));

  }
  else
  {
    v12 = objc_msgSend(objc_alloc((Class)CKContainer), "initWithContainerID:", v9);
  }
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("V:%@"), v6));
  v14 = objc_msgSend(objc_alloc((Class)CKRecordID), "initWithRecordName:", v13);
  v36[0] = 0;
  v36[1] = v36;
  v36[2] = 0x3032000000;
  v36[3] = sub_1000132DC;
  v36[4] = sub_1000132EC;
  v37 = 0;
  v34[0] = 0;
  v34[1] = v34;
  v34[2] = 0x3032000000;
  v34[3] = sub_1000132DC;
  v34[4] = sub_1000132EC;
  v35 = 0;
  v15 = objc_alloc((Class)CKFetchRecordsOperation);
  v38 = v14;
  v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v38, 1));
  v17 = objc_msgSend(v15, "initWithRecordIDs:", v16);

  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "resolvedConfiguration"));
  objc_msgSend(v18, "setRequestOriginator:", 2);

  v29[0] = _NSConcreteStackBlock;
  v29[1] = 3221225472;
  v29[2] = sub_1000132F4;
  v29[3] = &unk_100024AF8;
  v19 = v14;
  v30 = v19;
  v32 = v34;
  v20 = v6;
  v31 = v20;
  v33 = v36;
  objc_msgSend(v17, "setPerRecordCompletionBlock:", v29);
  v24[0] = _NSConcreteStackBlock;
  v24[1] = 3221225472;
  v24[2] = sub_100013544;
  v24[3] = &unk_100024B20;
  v27 = v34;
  v21 = v20;
  v25 = v21;
  v22 = v7;
  v26 = v22;
  v28 = v36;
  objc_msgSend(v17, "setFetchRecordsCompletionBlock:", v24);
  v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "publicCloudDatabase"));
  objc_msgSend(v23, "addOperation:", v17);

  _Block_object_dispose(v34, 8);
  _Block_object_dispose(v36, 8);

}

- (void)completeVettingWithCompletionHandler:(id)a3 willIssueCompletionOperationHandler:(id)a4
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  _QWORD v15[5];
  id v16;
  id v17;
  id v18;

  v7 = a3;
  v8 = a4;
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[VettingHandler url](self, "url"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "pathComponents"));

  if ((unint64_t)objc_msgSend(v10, "count") <= 2)
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
    objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("VettingHandler.m"), 89, CFSTR("Too short vetting URL (should have already been checked): %@"), v10);

  }
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_100013758;
  v15[3] = &unk_100024B70;
  v15[4] = self;
  v16 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "objectAtIndexedSubscript:", 2));
  v17 = v7;
  v18 = v8;
  v11 = v8;
  v12 = v16;
  v13 = v7;
  -[VettingHandler fetchVettingRecordWithVettingToken:completionHandler:](self, "fetchVettingRecordWithVettingToken:completionHandler:", v12, v15);

}

- (CKTestDevice)testDevice
{
  return self->_testDevice;
}

- (void)setTestDevice:(id)a3
{
  objc_storeStrong((id *)&self->_testDevice, a3);
}

- (NSURL)url
{
  return self->_url;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_url, 0);
  objc_storeStrong((id *)&self->_testDevice, 0);
}

@end
