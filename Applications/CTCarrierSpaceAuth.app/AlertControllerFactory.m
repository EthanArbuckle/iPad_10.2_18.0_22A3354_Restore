@implementation AlertControllerFactory

+ (id)_actionForErrorType:(int64_t)a3 completion:(id)a4
{
  id v5;
  NSBundle *v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v11[4];
  id v12;

  v5 = a4;
  if ((unint64_t)(a3 - 1) > 1)
  {
    v9 = 0;
  }
  else
  {
    v6 = +[NSBundle bundleForClass:](NSBundle, "bundleForClass:", objc_opt_class(AlertControllerFactory));
    v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "localizedStringForKey:value:table:", CFSTR("OK"), &stru_10000C9B8, CFSTR("Localizable")));

    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_100003044;
    v11[3] = &unk_10000C378;
    v12 = v5;
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[UIAlertAction actionWithTitle:style:handler:](UIAlertAction, "actionWithTitle:style:handler:", v8, 0, v11));

  }
  return v9;
}

+ (id)_messageForErrorType:(int64_t)a3
{
  NSBundle *v3;
  void *v4;
  void *v5;
  const __CFString *v6;
  NSBundle *v7;
  void *v8;

  if (a3 == 2)
  {
    v7 = +[NSBundle bundleForClass:](NSBundle, "bundleForClass:", objc_opt_class(AlertControllerFactory));
    v4 = (void *)objc_claimAutoreleasedReturnValue(v7);
    v5 = v4;
    v6 = CFSTR("USER_AUTHENTICATION_FAILURE_MESSAGE");
  }
  else
  {
    if (a3 != 1)
    {
      v8 = 0;
      return v8;
    }
    v3 = +[NSBundle bundleForClass:](NSBundle, "bundleForClass:", objc_opt_class(AlertControllerFactory));
    v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
    v5 = v4;
    v6 = CFSTR("CONNECTION_LOST_MESSAGE");
  }
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "localizedStringForKey:value:table:", v6, &stru_10000C9B8, CFSTR("Localizable")));

  return v8;
}

+ (id)_titleForErrorType:(int64_t)a3
{
  NSBundle *v3;
  void *v4;
  void *v5;
  const __CFString *v6;
  NSBundle *v7;
  void *v8;

  if (a3 == 2)
  {
    v7 = +[NSBundle bundleForClass:](NSBundle, "bundleForClass:", objc_opt_class(AlertControllerFactory));
    v4 = (void *)objc_claimAutoreleasedReturnValue(v7);
    v5 = v4;
    v6 = CFSTR("AUTHENTICATION_FAILURE_TITLE");
  }
  else
  {
    if (a3 != 1)
    {
      v8 = 0;
      return v8;
    }
    v3 = +[NSBundle bundleForClass:](NSBundle, "bundleForClass:", objc_opt_class(AlertControllerFactory));
    v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
    v5 = v4;
    v6 = CFSTR("CONNECTION_FAILURE_TITLE");
  }
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "localizedStringForKey:value:table:", v6, &stru_10000C9B8, CFSTR("Localizable")));

  return v8;
}

+ (id)alertControllerWithError:(int64_t)a3 completion:(id)a4
{
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "_actionForErrorType:completion:", a3, a4));
  if (v6)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "_messageForErrorType:", a3));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "_titleForErrorType:", a3));
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[UIAlertController alertControllerWithTitle:message:preferredStyle:](UIAlertController, "alertControllerWithTitle:message:preferredStyle:", v8, v7, 1));
    objc_msgSend(v9, "addAction:", v6);

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

+ (id)alertControllerWithBiometryType:(int64_t)a3 forCarrier:(id)a4 completion:(id)a5
{
  id v7;
  NSBundle *v8;
  void *v9;
  void *v10;
  NSBundle *v11;
  void *v12;
  void *v13;
  NSBundle *v14;
  void *v15;
  void *v16;
  NSBundle *v17;
  void *v18;
  uint64_t v19;
  NSBundle *v20;
  void *v21;
  uint64_t v22;
  NSBundle *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  void *v28;
  id v29;
  void *v30;
  NSBundle *v31;
  void *v32;
  void *v33;
  id v34;
  void *v35;
  void *v36;
  id v38;
  void *v39;
  id v40;
  _QWORD v41[4];
  id v42;
  _QWORD v43[4];
  id v44;

  v40 = a5;
  v7 = a4;
  v8 = +[NSBundle bundleForClass:](NSBundle, "bundleForClass:", objc_opt_class(AlertControllerFactory));
  v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "localizedStringForKey:value:table:", CFSTR("USE_TOUCH_ID"), &stru_10000C9B8, CFSTR("Localizable")));

  v11 = +[NSBundle bundleForClass:](NSBundle, "bundleForClass:", objc_opt_class(AlertControllerFactory));
  v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "localizedStringForKey:value:table:", CFSTR("ENABLE_TOUCH_ID"), &stru_10000C9B8, CFSTR("Localizable")));

  v14 = +[NSBundle bundleForClass:](NSBundle, "bundleForClass:", objc_opt_class(AlertControllerFactory));
  v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "localizedStringForKey:value:table:", CFSTR("TOUCH_ID_LOGIN_ENABLE_MESSAGE"), &stru_10000C9B8, CFSTR("Localizable")));

  if (a3 == 2)
  {
    v17 = +[NSBundle bundleForClass:](NSBundle, "bundleForClass:", objc_opt_class(AlertControllerFactory));
    v18 = (void *)objc_claimAutoreleasedReturnValue(v17);
    v19 = objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "localizedStringForKey:value:table:", CFSTR("USE_FACE_ID"), &stru_10000C9B8, CFSTR("Localizable")));

    v20 = +[NSBundle bundleForClass:](NSBundle, "bundleForClass:", objc_opt_class(AlertControllerFactory));
    v21 = (void *)objc_claimAutoreleasedReturnValue(v20);
    v22 = objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "localizedStringForKey:value:table:", CFSTR("ENABLE_FACE_ID"), &stru_10000C9B8, CFSTR("Localizable")));

    v23 = +[NSBundle bundleForClass:](NSBundle, "bundleForClass:", objc_opt_class(AlertControllerFactory));
    v24 = (void *)objc_claimAutoreleasedReturnValue(v23);
    v25 = objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "localizedStringForKey:value:table:", CFSTR("FACE_ID_LOGIN_ENABLE_MESSAGE"), &stru_10000C9B8, CFSTR("Localizable")));

    v16 = (void *)v25;
    v13 = (void *)v22;
    v26 = (void *)v19;
  }
  else
  {
    v26 = v10;
  }
  v39 = v16;
  v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "stringByReplacingOccurrencesOfString:withString:", CFSTR("%@"), v7, v26));
  v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "stringByReplacingOccurrencesOfString:withString:", CFSTR("%@"), v7));

  v43[0] = _NSConcreteStackBlock;
  v43[1] = 3221225472;
  v43[2] = sub_100003634;
  v43[3] = &unk_10000C378;
  v29 = v40;
  v44 = v29;
  v30 = (void *)objc_claimAutoreleasedReturnValue(+[UIAlertAction actionWithTitle:style:handler:](UIAlertAction, "actionWithTitle:style:handler:", v26, 0, v43));
  v31 = +[NSBundle bundleForClass:](NSBundle, "bundleForClass:", objc_opt_class(AlertControllerFactory));
  v32 = (void *)objc_claimAutoreleasedReturnValue(v31);
  v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "localizedStringForKey:value:table:", CFSTR("NOT_NOW"), &stru_10000C9B8, CFSTR("Localizable")));
  v41[0] = _NSConcreteStackBlock;
  v41[1] = 3221225472;
  v41[2] = sub_100003644;
  v41[3] = &unk_10000C378;
  v42 = v29;
  v34 = v29;
  v35 = (void *)objc_claimAutoreleasedReturnValue(+[UIAlertAction actionWithTitle:style:handler:](UIAlertAction, "actionWithTitle:style:handler:", v33, 0, v41));

  v36 = (void *)objc_claimAutoreleasedReturnValue(+[UIAlertController alertControllerWithTitle:message:preferredStyle:](UIAlertController, "alertControllerWithTitle:message:preferredStyle:", v27, v28, 1));
  objc_msgSend(v36, "addAction:", v35);
  objc_msgSend(v36, "addAction:", v30);

  return v36;
}

@end
