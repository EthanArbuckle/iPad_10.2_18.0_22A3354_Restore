@implementation ServiceProductActivityViewController

+ (id)_exportedInterface
{
  return +[NSXPCInterface interfaceWithProtocol:](NSXPCInterface, "interfaceWithProtocol:", &OBJC_PROTOCOL___SKUIServiceProductActivityViewController);
}

+ (id)_remoteViewControllerInterface
{
  return +[NSXPCInterface interfaceWithProtocol:](NSXPCInterface, "interfaceWithProtocol:", &OBJC_PROTOCOL___SKUIClientProductActivityViewController);
}

- (ServiceProductActivityViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  ServiceProductActivityViewController *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  NSString *logKey;
  void *v10;
  unsigned int v11;
  uint64_t v12;
  NSObject *v13;
  void *v14;
  NSString *v15;
  id v16;
  void *v17;
  objc_super v19;
  int v20;
  void *v21;
  __int16 v22;
  NSString *v23;

  v19.receiver = self;
  v19.super_class = (Class)ServiceProductActivityViewController;
  v4 = -[ServiceProductActivityViewController initWithNibName:bundle:](&v19, "initWithNibName:bundle:", a3, a4);
  if (v4)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSUUID UUID](NSUUID, "UUID"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "UUIDString"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "componentsSeparatedByString:", CFSTR("-")));
    v8 = objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "firstObject"));
    logKey = v4->_logKey;
    v4->_logKey = (NSString *)v8;

    v10 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedConfig](SSLogConfig, "sharedConfig"));
    v11 = objc_msgSend(v10, "shouldLog");
    if (objc_msgSend(v10, "shouldLogToDisk"))
      LODWORD(v12) = v11 | 2;
    else
      LODWORD(v12) = v11;
    v13 = objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "OSLogObject"));
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      v12 = v12;
    else
      v12 &= 2u;
    if ((_DWORD)v12)
    {
      v14 = (void *)objc_opt_class(v4);
      v15 = v4->_logKey;
      v20 = 138543618;
      v21 = v14;
      v22 = 2114;
      v23 = v15;
      v16 = v14;
      v17 = (void *)_os_log_send_and_compose_impl(v12, 0, 0, 0, &_mh_execute_header, v13, 0, "[%{public}@][%{public}@]: Start.", &v20, 22);

      if (!v17)
      {
LABEL_12:

        return v4;
      }
      v13 = objc_claimAutoreleasedReturnValue(+[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v17, 4));
      free(v17);
      SSFileLog(v10, CFSTR("%@"));
    }

    goto LABEL_12;
  }
  return v4;
}

- (void)dealloc
{
  void *v3;
  unsigned int v4;
  uint64_t v5;
  NSObject *v6;
  void *v7;
  NSString *logKey;
  id v9;
  void *v10;
  objc_super v11;
  int v12;
  void *v13;
  __int16 v14;
  NSString *v15;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedConfig](SSLogConfig, "sharedConfig"));
  v4 = objc_msgSend(v3, "shouldLog");
  if (objc_msgSend(v3, "shouldLogToDisk"))
    LODWORD(v5) = v4 | 2;
  else
    LODWORD(v5) = v4;
  v6 = objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "OSLogObject"));
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    v5 = v5;
  else
    v5 &= 2u;
  if (!(_DWORD)v5)
    goto LABEL_10;
  v7 = (void *)objc_opt_class(self);
  logKey = self->_logKey;
  v12 = 138543618;
  v13 = v7;
  v14 = 2114;
  v15 = logKey;
  v9 = v7;
  v10 = (void *)_os_log_send_and_compose_impl(v5, 0, 0, 0, &_mh_execute_header, v6, 0, "[%{public}@][%{public}@]: Dealloc.", &v12, 22);

  if (v10)
  {
    v6 = objc_claimAutoreleasedReturnValue(+[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v10, 4));
    free(v10);
    SSFileLog(v3, CFSTR("%@"));
LABEL_10:

  }
  v11.receiver = self;
  v11.super_class = (Class)ServiceProductActivityViewController;
  -[ServiceProductActivityViewController dealloc](&v11, "dealloc");
}

- (void)viewDidAppear:(BOOL)a3
{
  void *v4;
  void *v5;
  void *v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)ServiceProductActivityViewController;
  -[ServiceProductActivityViewController viewDidAppear:](&v7, "viewDidAppear:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[ServiceProductActivityViewController view](self, "view"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "window"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "_rootSheetPresentationController"));
  objc_msgSend(v6, "_setShouldScaleDownBehindDescendantSheets:", 0);

}

- (void)setupProductWithParameters:(id)a3
{
  id v4;
  void *v5;
  NSString *v6;
  id v7;
  void *v8;
  unsigned int v9;
  uint64_t v10;
  NSObject *v11;
  void *v12;
  NSString *logKey;
  id v14;
  void *v15;
  void *v16;
  _QWORD v17[5];
  id v18;
  id v19;
  _QWORD v20[4];
  id v21;
  id v22;
  _BYTE location[12];
  __int16 v24;
  NSString *v25;
  CGRect v26;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[ServiceProductActivityViewController _productIDFromParameters:](self, "_productIDFromParameters:", v4));
  if (v5)
  {
    v6 = (NSString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "valueForKey:", SKStoreProductParameterPopoverSourceRect));
    v26 = CGRectFromString(v6);
    -[ServiceProductActivityViewController setPopoverSourceRect:](self, "setPopoverSourceRect:", v26.origin.x, v26.origin.y, v26.size.width, v26.size.height);

    objc_initWeak((id *)location, self);
    v20[0] = _NSConcreteStackBlock;
    v20[1] = 3221225472;
    v20[2] = sub_1000243AC;
    v20[3] = &unk_100049ED8;
    objc_copyWeak(&v22, (id *)location);
    v7 = v5;
    v21 = v7;
    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3221225472;
    v17[2] = sub_100024424;
    v17[3] = &unk_100049F00;
    objc_copyWeak(&v19, (id *)location);
    v17[4] = self;
    v18 = v7;
    -[ServiceProductActivityViewController _lookupItemWithIdentifier:success:failure:](self, "_lookupItemWithIdentifier:success:failure:", v18, v20, v17);

    objc_destroyWeak(&v19);
    objc_destroyWeak(&v22);
    objc_destroyWeak((id *)location);
  }
  else
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedConfig](SSLogConfig, "sharedConfig"));
    v9 = objc_msgSend(v8, "shouldLog");
    if (objc_msgSend(v8, "shouldLogToDisk"))
      LODWORD(v10) = v9 | 2;
    else
      LODWORD(v10) = v9;
    v11 = objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "OSLogObject"));
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      v10 = v10;
    else
      v10 &= 2u;
    if ((_DWORD)v10)
    {
      v12 = (void *)objc_opt_class(self);
      logKey = self->_logKey;
      *(_DWORD *)location = 138543618;
      *(_QWORD *)&location[4] = v12;
      v24 = 2114;
      v25 = logKey;
      v14 = v12;
      v15 = (void *)_os_log_send_and_compose_impl(v10, 0, 0, 0, &_mh_execute_header, v11, 16, "[%{public}@][%{public}@]: Activity request without an ID.", location, 22);

      if (v15)
      {
        v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v15, 4));
        free(v15);
        SSFileLog(v8, CFSTR("%@"));

      }
    }
    else
    {

    }
    -[ServiceProductActivityViewController _loadDidFailWithError:](self, "_loadDidFailWithError:", 0);
  }

}

- (void)finishImmediately:(id)a3
{
  id v4;
  void *v5;
  id v6;
  id v7;
  id v8;
  _QWORD v9[5];
  id v10;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[ServiceProductActivityViewController presentedViewController](self, "presentedViewController"));

  if (v5)
  {
    v6 = -[NSString copy](self->_logKey, "copy");
    v7 = objc_msgSend(v4, "BOOLValue");
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_100024764;
    v9[3] = &unk_100049590;
    v9[4] = self;
    v10 = v6;
    v8 = v6;
    -[ServiceProductActivityViewController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", v7, v9);

  }
}

- (void)_loadClientContextWithCompletionBlock:(id)a3
{
  void (**v3)(id, void *);
  void *v4;
  id v5;
  id v6;
  _QWORD v7[4];
  void (**v8)(id, void *);

  v3 = (void (**)(id, void *))a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[SKUIClientContext defaultContext](SKUIClientContext, "defaultContext"));
  if (v4)
  {
    v3[2](v3, v4);
  }
  else
  {
    v5 = objc_alloc_init((Class)SKUIReloadConfigurationOperation);
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_1000249D8;
    v7[3] = &unk_100049F28;
    v8 = v3;
    objc_msgSend(v5, "setOutputBlock:", v7);
    v6 = objc_alloc_init((Class)NSOperationQueue);
    objc_msgSend(v6, "addOperation:", v5);

  }
}

- (void)_presentActivityViewControllerWithItem:(id)a3
{
  id v4;
  _QWORD v5[4];
  id v6;
  ServiceProductActivityViewController *v7;

  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_100024B34;
  v5[3] = &unk_100049F78;
  v6 = a3;
  v7 = self;
  v4 = v6;
  -[ServiceProductActivityViewController _loadClientContextWithCompletionBlock:](self, "_loadClientContextWithCompletionBlock:", v5);

}

- (void)_loadDidFailWithError:(id)a3
{
  id v4;
  NSBundle *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  unsigned int v10;
  uint64_t v11;
  NSObject *v12;
  void *v13;
  NSString *logKey;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  _QWORD v20[5];
  id v21;
  int v22;
  void *v23;
  __int16 v24;
  NSString *v25;
  __int16 v26;
  id v27;
  NSErrorUserInfoKey v28;
  void *v29;

  v4 = a3;
  if (!v4)
  {
    v28 = NSLocalizedDescriptionKey;
    v5 = +[NSBundle bundleForClass:](NSBundle, "bundleForClass:", objc_opt_class(SSLookupRequest));
    v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "localizedStringForKey:value:table:", CFSTR("DEFAULT_ERROR_TITLE"), &stru_10004A1F0, 0));
    v29 = v7;
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v29, &v28, 1));
    v4 = (id)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", SKErrorDomain, 5, v8));

  }
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedConfig](SSLogConfig, "sharedConfig"));
  v10 = objc_msgSend(v9, "shouldLog");
  if (objc_msgSend(v9, "shouldLogToDisk"))
    LODWORD(v11) = v10 | 2;
  else
    LODWORD(v11) = v10;
  v12 = objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "OSLogObject"));
  if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    v11 = v11;
  else
    v11 &= 2u;
  if ((_DWORD)v11)
  {
    v13 = (void *)objc_opt_class(self);
    logKey = self->_logKey;
    v22 = 138543874;
    v23 = v13;
    v24 = 2114;
    v25 = logKey;
    v26 = 2114;
    v27 = v4;
    v15 = v13;
    v16 = (void *)_os_log_send_and_compose_impl(v11, 0, 0, 0, &_mh_execute_header, v12, 16, "[%{public}@][%{public}@]: Load failed with error: %{public}@.", &v22, 32);

    if (!v16)
      goto LABEL_13;
    v12 = objc_claimAutoreleasedReturnValue(+[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v16, 4));
    free(v16);
    SSFileLog(v9, CFSTR("%@"));
  }

LABEL_13:
  v17 = (void *)objc_claimAutoreleasedReturnValue(+[SKUIErrorHelper errorWithSafeUserInfo:](SKUIErrorHelper, "errorWithSafeUserInfo:", v4));
  v18 = (void *)objc_claimAutoreleasedReturnValue(-[ServiceProductActivityViewController presentedViewController](self, "presentedViewController"));

  if (v18)
  {
    v20[0] = _NSConcreteStackBlock;
    v20[1] = 3221225472;
    v20[2] = sub_100025308;
    v20[3] = &unk_100049590;
    v20[4] = self;
    v21 = v17;
    -[ServiceProductActivityViewController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 1, v20);

  }
  else
  {
    v19 = (void *)objc_claimAutoreleasedReturnValue(-[ServiceProductActivityViewController _clientViewControllerProxy](self, "_clientViewControllerProxy"));
    objc_msgSend(v19, "didFinishWithResult:error:", &off_10004CEC8, v17);

  }
}

- (id)_productIDFromParameters:(id)a3
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  id v7;
  uint64_t v9;

  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "objectForKeyedSubscript:", SKStoreProductParameterITunesItemIdentifier));
  if (!v3
    || (v4 = objc_opt_class(NSString), (objc_opt_isKindOfClass(v3, v4) & 1) != 0)
    && !objc_msgSend(v3, "length")
    || (v5 = objc_opt_class(NSNumber), (objc_opt_isKindOfClass(v3, v5) & 1) != 0)
    && !objc_msgSend(v3, "integerValue"))
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
      sub_10002A06C();
    goto LABEL_10;
  }
  v6 = objc_opt_class(NSString);
  if ((objc_opt_isKindOfClass(v3, v6) & 1) != 0)
  {
    v7 = v3;
    goto LABEL_11;
  }
  v9 = objc_opt_class(NSNumber);
  if ((objc_opt_isKindOfClass(v3, v9) & 1) == 0
    || (v7 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "stringValue"))) == 0)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
      sub_10002A0E4();
LABEL_10:
    v7 = 0;
  }
LABEL_11:

  return v7;
}

- (void)_lookupItemWithIdentifier:(id)a3 success:(id)a4 failure:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  unsigned int v13;
  unsigned int v14;
  NSObject *v15;
  uint64_t v16;
  void *v17;
  NSString *logKey;
  id v19;
  void *v20;
  id v21;
  id v22;
  void *v23;
  id v24;
  void *v25;
  unsigned int v26;
  unsigned int v27;
  NSObject *v28;
  uint64_t v29;
  void *v30;
  NSString *v31;
  id v32;
  void *v33;
  void *v34;
  id v35;
  id v36;
  _QWORD v37[4];
  id v38;
  id v39;
  id v40;
  id v41;
  _BYTE location[12];
  __int16 v43;
  NSString *v44;
  __int16 v45;
  id v46;
  id v47;

  v8 = a3;
  v36 = a4;
  v9 = a5;
  if (v8)
  {
    v10 = (id)objc_claimAutoreleasedReturnValue(+[AMSBag bagForProfile:profileVersion:](AMSBag, "bagForProfile:profileVersion:", CFSTR("appstored"), CFSTR("1")));
    v35 = objc_msgSend(objc_alloc((Class)AMSProcessInfo), "initWithBundleIdentifier:", CFSTR("com.apple.storekitd"));
    v47 = v8;
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v47, 1));
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedConfig](SSLogConfig, "sharedConfig"));
    v13 = objc_msgSend(v12, "shouldLog");
    if (objc_msgSend(v12, "shouldLogToDisk"))
      v14 = v13 | 2;
    else
      v14 = v13;
    v15 = objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "OSLogObject"));
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      v16 = v14;
    else
      v16 = v14 & 2;
    if ((_DWORD)v16)
    {
      v17 = (void *)objc_opt_class(self);
      logKey = self->_logKey;
      *(_DWORD *)location = 138543874;
      *(_QWORD *)&location[4] = v17;
      v43 = 2114;
      v44 = logKey;
      v45 = 2114;
      v46 = v8;
      v19 = v17;
      v20 = (void *)_os_log_send_and_compose_impl(v16, 0, 0, 0, &_mh_execute_header, v15, 0, "[%{public}@][%{public}@]: Performing share activity lookup for %{public}@", location, 32);

      if (!v20)
      {
LABEL_12:

        v21 = objc_msgSend(objc_alloc((Class)AMSMediaTask), "initWithType:clientIdentifier:clientVersion:bag:", 0, CFSTR("com.storekit.shareactivity"), CFSTR("1"), v10);
        objc_msgSend(v21, "setClientInfo:", v35);
        objc_msgSend(v21, "setLogKey:", self->_logKey);
        objc_msgSend(v21, "setItemIdentifiers:", v11);
        v22 = -[NSString copy](self->_logKey, "copy");
        objc_initWeak((id *)location, self);
        v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "perform"));
        v37[0] = _NSConcreteStackBlock;
        v37[1] = 3221225472;
        v37[2] = sub_100025964;
        v37[3] = &unk_100049FA0;
        objc_copyWeak(&v41, (id *)location);
        v24 = v22;
        v38 = v24;
        v39 = v36;
        v40 = v9;
        objc_msgSend(v23, "addFinishBlock:", v37);

        objc_destroyWeak(&v41);
        objc_destroyWeak((id *)location);

        goto LABEL_24;
      }
      v15 = objc_claimAutoreleasedReturnValue(+[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v20, 4));
      free(v20);
      SSFileLog(v12, CFSTR("%@"));
    }

    goto LABEL_12;
  }
  v25 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedConfig](SSLogConfig, "sharedConfig"));
  v26 = objc_msgSend(v25, "shouldLog");
  if (objc_msgSend(v25, "shouldLogToDisk"))
    v27 = v26 | 2;
  else
    v27 = v26;
  v28 = objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "OSLogObject"));
  if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
    v29 = v27;
  else
    v29 = v27 & 2;
  if ((_DWORD)v29)
  {
    v30 = (void *)objc_opt_class(self);
    v31 = self->_logKey;
    *(_DWORD *)location = 138543618;
    *(_QWORD *)&location[4] = v30;
    v43 = 2114;
    v44 = v31;
    v32 = v30;
    v33 = (void *)_os_log_send_and_compose_impl(v29, 0, 0, 0, &_mh_execute_header, v28, 16, "[%{public}@][%{public}@]: Received lookup request without an identifier.", location, 22);

    if (v33)
    {
      v34 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v33, 4));
      free(v33);
      SSFileLog(v25, CFSTR("%@"));

    }
  }
  else
  {

  }
  v10 = objc_msgSend(objc_alloc((Class)NSError), "initWithDomain:code:userInfo:", SKErrorDomain, 5, 0);
  (*((void (**)(id, id))v9 + 2))(v9, v10);
LABEL_24:

}

- (CGRect)popoverSourceRect
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_popoverSourceRect.origin.x;
  y = self->_popoverSourceRect.origin.y;
  width = self->_popoverSourceRect.size.width;
  height = self->_popoverSourceRect.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (void)setPopoverSourceRect:(CGRect)a3
{
  self->_popoverSourceRect = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_logKey, 0);
}

@end
