@implementation ServiceRemoteEngagementViewController

+ (id)_exportedInterface
{
  return +[NSXPCInterface interfaceWithProtocol:](NSXPCInterface, "interfaceWithProtocol:", &OBJC_PROTOCOL___SKEngagementViewServiceProtocol);
}

+ (id)_remoteViewControllerInterface
{
  return +[NSXPCInterface interfaceWithProtocol:](NSXPCInterface, "interfaceWithProtocol:", &OBJC_PROTOCOL___SKEngagementPresenterProtocol);
}

- (void)setPreferredContentSize:(CGSize)a3
{
  double height;
  double width;
  void *v6;
  _QWORD v7[5];
  objc_super v8;

  height = a3.height;
  width = a3.width;
  v8.receiver = self;
  v8.super_class = (Class)ServiceRemoteEngagementViewController;
  -[ServiceRemoteEngagementViewController setPreferredContentSize:](&v8, "setPreferredContentSize:");
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100022A38;
  v7[3] = &unk_100048F38;
  v7[4] = self;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[ServiceRemoteEngagementViewController _clientViewControllerProxyWithErrorHandler:](self, "_clientViewControllerProxyWithErrorHandler:", v7));
  objc_msgSend(v6, "preferredContentSizeDidChange:", width, height);

}

- (void)presentEngagementRequestData:(id)a3 clientBundleID:(id)a4 completion:(id)a5
{
  id v8;
  void (**v9)(id, _QWORD);
  id v10;
  id v11;
  void *v12;
  id v13;
  void *v14;
  uint64_t v15;
  _UNKNOWN **v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  unsigned int v23;
  unsigned int v24;
  NSObject *v25;
  uint64_t v26;
  void *v27;
  uint64_t v28;
  void *v29;
  id v30;
  id v31;
  void *v32;
  uint64_t v33;
  id v34;
  _QWORD v35[5];
  __int16 v36;
  id v37;

  v8 = a4;
  v9 = (void (**)(id, _QWORD))a5;
  v10 = a3;
  -[ServiceRemoteEngagementViewController _dismissPresentedViewController](self, "_dismissPresentedViewController");
  v37 = 0;
  v11 = +[NSKeyedUnarchiver unarchivedObjectOfClass:fromData:error:](NSKeyedUnarchiver, "unarchivedObjectOfClass:fromData:error:", objc_opt_class(AMSEngagementRequest), v10, &v37);
  v12 = (void *)objc_claimAutoreleasedReturnValue(v11);

  v13 = v37;
  if (!v13)
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "URL"));
    v15 = objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "port"));
    v16 = &_s2os6LoggerV9logObjectSo03OS_a1_C0Cvg_ptr;
    if (v15)
    {
      v17 = (void *)v15;
      v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "URL"));
      v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "host"));
      if (objc_msgSend(v19, "isEqualToString:", CFSTR("localhost")))
      {
        v34 = v8;
        v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "URL"));
        v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "scheme"));
        HIDWORD(v33) = objc_msgSend(v21, "isEqualToString:", CFSTR("http"));

        v16 = &_s2os6LoggerV9logObjectSo03OS_a1_C0Cvg_ptr;
        v8 = v34;

        if (HIDWORD(v33))
        {
          v22 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedConfig](SSLogConfig, "sharedConfig"));
          v23 = objc_msgSend(v22, "shouldLog");
          if (objc_msgSend(v22, "shouldLogToDisk"))
            v24 = v23 | 2;
          else
            v24 = v23;
          v25 = objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "OSLogObject"));
          if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG))
            v26 = v24;
          else
            v26 = v24 & 2;
          if ((_DWORD)v26)
          {
            v36 = 0;
            LODWORD(v33) = 2;
            v27 = (void *)_os_log_send_and_compose_impl(v26, 0, 0, 0, &_mh_execute_header, v25, 2, "Using octane for engagement task", &v36, v33);

            v16 = &_s2os6LoggerV9logObjectSo03OS_a1_C0Cvg_ptr;
            if (!v27)
            {
LABEL_22:

              v28 = objc_claimAutoreleasedReturnValue(+[SKUIOctaneBag shared](SKUIOctaneBag, "shared"));
              goto LABEL_18;
            }
            v25 = objc_claimAutoreleasedReturnValue(+[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v27, 4));
            free(v27);
            SSFileLog(v22, CFSTR("%@"));
          }
          else
          {
            v16 = &_s2os6LoggerV9logObjectSo03OS_a1_C0Cvg_ptr;
          }

          goto LABEL_22;
        }
LABEL_17:
        v28 = objc_claimAutoreleasedReturnValue(objc_msgSend(v16[106], "createBagForSubProfile"));
LABEL_18:
        v29 = (void *)v28;
        v30 = objc_msgSend(objc_alloc((Class)v16[106]), "initWithRequest:bag:presentingViewController:", v12, v28, self);
        v31 = objc_msgSend(objc_alloc((Class)AMSProcessInfo), "initWithBundleIdentifier:", v8);
        objc_msgSend(v30, "setClientInfo:", v31);

        v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "presentEngagement"));
        v35[0] = _NSConcreteStackBlock;
        v35[1] = 3221225472;
        v35[2] = sub_100022EFC;
        v35[3] = &unk_100049E88;
        v35[4] = self;
        objc_msgSend(v32, "addFinishBlock:", v35);

        v9[2](v9, 0);
        goto LABEL_19;
      }

    }
    goto LABEL_17;
  }
  ((void (**)(id, id))v9)[2](v9, v13);
LABEL_19:

}

- (void)_dismissPresentedViewController
{
  void *v2;
  void *v3;
  id v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[ServiceRemoteEngagementViewController childViewControllers](self, "childViewControllers"));
  v4 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "firstObject"));

  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "view"));
  objc_msgSend(v3, "removeFromSuperview");

  objc_msgSend(v4, "removeFromParentViewController");
}

@end
