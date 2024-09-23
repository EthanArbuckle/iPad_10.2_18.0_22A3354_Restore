@implementation DTOBiometryAlertFactory

- (id)biometryRequiredAlertWithBiometryType:(int64_t)a3
{
  TouchIdAlertController *v6;
  void *v7;
  uint64_t v8;
  NSBundle *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  NSBundle *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  NSBundle *v18;
  void *v19;
  void *v20;
  void *v21;
  _QWORD v22[6];

  if (LACBiometryTypeFaceID != a3 && LACBiometryTypeTouchID != a3)
    return 0;
  v22[0] = _NSConcreteStackBlock;
  v22[1] = 3221225472;
  v22[2] = sub_1000072E8;
  v22[3] = &unk_100079A80;
  v22[4] = self;
  v22[5] = a3;
  v6 = sub_1000072E8((uint64_t)v22);
  v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  v9 = +[NSBundle bundleForClass:](NSBundle, "bundleForClass:", objc_opt_class(self, v8));
  v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "localizedStringForKey:value:table:", CFSTR("DTO_IS_ACTIVE"), &stru_10007CCD0, CFSTR("MobileUI-Ratchet")));
  objc_msgSend(v7, "setMessage:", v11);

  objc_msgSend(v7, "setPreferredStyle:", 1);
  v13 = +[NSBundle bundleForClass:](NSBundle, "bundleForClass:", objc_opt_class(self, v12));
  v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "localizedStringForKey:value:table:", CFSTR("OK"), &stru_10007CCD0, CFSTR("MobileUI")));
  v16 = (void *)objc_claimAutoreleasedReturnValue(+[UIAlertAction actionWithTitle:style:handler:](UIAlertAction, "actionWithTitle:style:handler:", v15, 0, &stru_100079AC0));
  objc_msgSend(v7, "addAction:", v16);

  v18 = +[NSBundle bundleForClass:](NSBundle, "bundleForClass:", objc_opt_class(self, v17));
  v19 = (void *)objc_claimAutoreleasedReturnValue(v18);
  v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "localizedStringForKey:value:table:", CFSTR("LEARN_MORE"), &stru_10007CCD0, CFSTR("MobileUI")));
  v21 = (void *)objc_claimAutoreleasedReturnValue(+[UIAlertAction actionWithTitle:style:handler:](UIAlertAction, "actionWithTitle:style:handler:", v20, 0, &stru_100079AE0));
  objc_msgSend(v7, "addAction:", v21);

  return v7;
}

@end
