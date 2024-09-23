@implementation IMCoreInterface

+ (id)logHandle
{
  if (qword_100022B88[0] != -1)
    dispatch_once(qword_100022B88, &stru_10001CC08);
  return (id)qword_100022B80;
}

+ (void)checkAndClear:(id)a3 service:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  dispatch_queue_attr_t v9;
  NSObject *v10;
  dispatch_queue_t v11;
  id v12;
  id v13;

  v13 = a4;
  v5 = a4;
  v6 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v13, 1));
  v12 = v6;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v12, 1));

  v9 = dispatch_queue_attr_make_with_autorelease_frequency((dispatch_queue_attr_t)&_dispatch_queue_attr_concurrent, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v10 = objc_claimAutoreleasedReturnValue(v9);
  v11 = dispatch_queue_create("com.apple.people.checkAndClear", v10);
  IMSPIQueryMessagesWithIDsWithOnlyUnreadAndQOS(v7, v8, 0, 1, 50, 25, v11, &stru_10001CC48);

}

+ (void)clearUnreadFor:(id)a3 andPhone:(id)a4
{
  id v5;
  id v6;

  v6 = a3;
  v5 = a4;
  if (v6 && objc_msgSend(v6, "length"))
    +[IMCoreInterface checkAndClear:service:](IMCoreInterface, "checkAndClear:service:", v6, IMSPIiMessageService);
  if (v5 && objc_msgSend(v5, "length"))
  {
    +[IMCoreInterface checkAndClear:service:](IMCoreInterface, "checkAndClear:service:", v5, IMSPIiMessageService);
    +[IMCoreInterface checkAndClear:service:](IMCoreInterface, "checkAndClear:service:", v5, IMSPISMSService);
  }

}

+ (id)checkWithWait:(id)a3 service:(id)a4
{
  id v5;
  id v6;
  id v7;
  id v8;
  id v9;
  id v10;
  _QWORD v12[4];
  id v13;
  id v14;

  v5 = a3;
  v6 = a4;
  v7 = objc_alloc((Class)AAFPromise);
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_100004E2C;
  v12[3] = &unk_10001CC98;
  v13 = v6;
  v14 = v5;
  v8 = v5;
  v9 = v6;
  v10 = objc_msgSend(v7, "initWithBlock:", v12);

  return v10;
}

- (IMCoreInterface)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)IMCoreInterface;
  return -[IMCoreInterface init](&v3, "init");
}

- (void)grabUnreadFor:(id)a3 completionHandler:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t (**v11)(_QWORD, _QWORD);
  uint64_t v12;
  uint64_t (**v13)(_QWORD, _QWORD);
  uint64_t v14;
  void *v15;
  uint64_t (**v16)(_QWORD, _QWORD);
  uint64_t v17;
  void *v18;
  uint64_t (**v19)(_QWORD, _QWORD);
  uint64_t v20;
  uint64_t (**v21)(_QWORD, _QWORD);
  uint64_t v22;
  void *v23;
  id v24;
  id v25;
  id obj;
  uint64_t v27;
  id v28;
  void *v29;
  void *v30;
  uint64_t (**v31)(_QWORD, _QWORD);
  _QWORD v32[4];
  id v33;
  _QWORD v34[5];
  _QWORD v35[5];
  _QWORD v36[5];
  _QWORD v37[5];
  _QWORD v38[5];
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  _BYTE v43[128];

  v5 = a3;
  v25 = a4;
  v6 = objc_msgSend(objc_alloc((Class)AAFPromise), "initWithValue:", &__NSArray0__struct);
  v39 = 0u;
  v40 = 0u;
  v41 = 0u;
  v42 = 0u;
  obj = v5;
  v28 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v39, v43, 16);
  if (v28)
  {
    v27 = *(_QWORD *)v40;
    do
    {
      v7 = 0;
      v8 = v6;
      do
      {
        if (*(_QWORD *)v40 != v27)
          objc_enumerationMutation(obj);
        v9 = *(_QWORD *)(*((_QWORD *)&v39 + 1) + 8 * (_QWORD)v7);
        v31 = (uint64_t (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "then"));
        v38[0] = _NSConcreteStackBlock;
        v38[1] = 3221225472;
        v38[2] = sub_100005414;
        v38[3] = &unk_10001CCC0;
        v38[4] = v9;
        v10 = ((uint64_t (**)(_QWORD, _QWORD *))v31)[2](v31, v38);
        v30 = (void *)objc_claimAutoreleasedReturnValue(v10);
        v11 = (uint64_t (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "then"));
        v37[0] = _NSConcreteStackBlock;
        v37[1] = 3221225472;
        v37[2] = sub_1000054EC;
        v37[3] = &unk_10001CCC0;
        v37[4] = v9;
        v12 = ((uint64_t (**)(_QWORD, _QWORD *))v11)[2](v11, v37);
        v29 = (void *)objc_claimAutoreleasedReturnValue(v12);
        v13 = (uint64_t (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "then"));
        v36[0] = _NSConcreteStackBlock;
        v36[1] = 3221225472;
        v36[2] = sub_1000055C4;
        v36[3] = &unk_10001CCC0;
        v36[4] = v9;
        v14 = ((uint64_t (**)(_QWORD, _QWORD *))v13)[2](v13, v36);
        v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
        v16 = (uint64_t (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "then"));
        v35[0] = _NSConcreteStackBlock;
        v35[1] = 3221225472;
        v35[2] = sub_100005698;
        v35[3] = &unk_10001CCC0;
        v35[4] = v9;
        v17 = ((uint64_t (**)(_QWORD, _QWORD *))v16)[2](v16, v35);
        v18 = (void *)objc_claimAutoreleasedReturnValue(v17);
        v19 = (uint64_t (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "then"));
        v34[0] = _NSConcreteStackBlock;
        v34[1] = 3221225472;
        v34[2] = sub_10000576C;
        v34[3] = &unk_10001CCC0;
        v34[4] = v9;
        v20 = ((uint64_t (**)(_QWORD, _QWORD *))v19)[2](v19, v34);
        v6 = (id)objc_claimAutoreleasedReturnValue(v20);

        v7 = (char *)v7 + 1;
        v8 = v6;
      }
      while (v28 != v7);
      v28 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v39, v43, 16);
    }
    while (v28);
  }

  v21 = (uint64_t (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "then"));
  v22 = ((uint64_t (**)(_QWORD, Block_layout *))v21)[2](v21, &stru_10001CD00);
  v23 = (void *)objc_claimAutoreleasedReturnValue(v22);

  v32[0] = _NSConcreteStackBlock;
  v32[1] = 3221225472;
  v32[2] = sub_100005A20;
  v32[3] = &unk_10001CD50;
  v33 = v25;
  v24 = v25;
  objc_msgSend(v23, "onComplete:", v32);

}

@end
