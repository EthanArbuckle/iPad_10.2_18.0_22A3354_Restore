@implementation BuddyRestoreHelpers

+ (id)alertForBackupError:(id)a3 okButtonAction:(id)a4
{
  void *v5;
  id v6;
  id v8;
  id location[2];
  id v10;

  v10 = a1;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v8 = 0;
  objc_storeStrong(&v8, a4);
  v5 = (void *)objc_opt_class(v10);
  v6 = objc_msgSend(v5, "alertForBackupError:forBackup:okButtonAction:", location[0], 0, v8);
  objc_storeStrong(&v8, 0);
  objc_storeStrong(location, 0);
  return v6;
}

+ (id)alertForBackupError:(id)a3 forBackup:(BOOL)a4 okButtonAction:(id)a5
{
  NSBundle *v7;
  NSString *v8;
  id v9;
  id v10;
  unsigned __int8 v11;
  id v12;
  id v13;
  id v14;
  NSBundle *v15;
  id v16;
  NSString *v17;
  id v18;
  NSBundle *v19;
  NSString *v20;
  id v21;
  id v22;
  unsigned __int8 v23;
  id v24;
  NSBundle *v25;
  NSString *v26;
  id v27;
  NSBundle *v28;
  id v29;
  NSString *v30;
  id v31;
  uint64_t v32;
  NSString *v33;
  id v34;
  id v35;
  NSBundle *v36;
  NSString *v37;
  UIAlertAction *v38;
  id v39;
  void **v41;
  int v42;
  int v43;
  void (*v44)(_QWORD *, void *);
  void *v45;
  id v46;
  id v47;
  id v48;
  id v49;
  id v50;
  id v51;
  BOOL v52;
  id location[3];

  location[2] = a1;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v52 = a4;
  v51 = 0;
  objc_storeStrong(&v51, a5);
  v50 = 0;
  v49 = 0;
  v48 = 0;
  if (v52)
  {
    v19 = +[NSBundle mainBundle](NSBundle, "mainBundle");
    v20 = -[NSBundle localizedStringForKey:value:table:](v19, "localizedStringForKey:value:table:", CFSTR("ERROR_TITLE_CANNOT_BACK_UP"), &stru_100284738, CFSTR("RestoreFromBackup"));
    v21 = v48;
    v48 = v20;

    v22 = objc_msgSend(location[0], "domain");
    v23 = objc_msgSend(v22, "isEqualToString:", CFSTR("MBErrorDomain"));

    if ((v23 & 1) == 0)
      goto LABEL_27;
    v24 = objc_msgSend(location[0], "code");
    if (v24 == (id)13)
    {
      objc_storeStrong(&v50, CFSTR("ERROR_BACKING_UP_BACKUPS_BUSY"));
      goto LABEL_27;
    }
    if (v24 == (id)300)
      goto LABEL_22;
    if (v24 == (id)302)
    {
      objc_storeStrong(&v50, CFSTR("ERROR_BACKING_UP_SERVER_ERROR"));
      goto LABEL_27;
    }
    if (v24 == (id)304)
    {
      objc_storeStrong(&v50, CFSTR("ERROR_BACKING_UP_SERVER_UNAVAILABLE"));
      goto LABEL_27;
    }
    if (v24 == (id)308)
    {
LABEL_22:
      objc_storeStrong(&v50, CFSTR("ERROR_BACKING_UP_LOST_NETWORK"));
      v25 = +[NSBundle mainBundle](NSBundle, "mainBundle");
      v26 = -[NSBundle localizedStringForKey:value:table:](v25, "localizedStringForKey:value:table:", CFSTR("ERROR_TITLE_LOST_NETWORK"), &stru_100284738, CFSTR("RestoreFromBackup"));
      v27 = v48;
      v48 = v26;

      goto LABEL_27;
    }
    objc_storeStrong(&v49, &stru_100284738);
  }
  else
  {
    v7 = +[NSBundle mainBundle](NSBundle, "mainBundle");
    v8 = -[NSBundle localizedStringForKey:value:table:](v7, "localizedStringForKey:value:table:", CFSTR("ERROR_TITLE_CANNOT_RESTORE"), &stru_100284738, CFSTR("RestoreFromBackup"));
    v9 = v48;
    v48 = v8;

    v10 = objc_msgSend(location[0], "domain");
    v11 = objc_msgSend(v10, "isEqualToString:", CFSTR("MBErrorDomain"));

    if ((v11 & 1) != 0)
    {
      v12 = objc_msgSend(location[0], "code");
      if (v12 == (id)13)
      {
        objc_storeStrong(&v50, CFSTR("ERROR_RESTORING_BACKUPS_BUSY"));
      }
      else if (v12 == (id)205)
      {
        objc_storeStrong(&v50, CFSTR("ERROR_RESTORING_BAD_BACKUP_DATA"));
      }
      else
      {
        if (v12 == (id)300)
        {
LABEL_9:
          v13 = (id)SFLocalizableWAPIStringKeyForKey(CFSTR("ERROR_RESTORING_LOST_NETWORK_WIFI"));
          v14 = v50;
          v50 = v13;

          v15 = +[NSBundle mainBundle](NSBundle, "mainBundle");
          v16 = (id)SFLocalizableWAPIStringKeyForKey(CFSTR("ERROR_RESTORING_TITLE_LOST_NETWORK_WIFI"));
          v17 = -[NSBundle localizedStringForKey:value:table:](v15, "localizedStringForKey:value:table:", v16, &stru_100284738, CFSTR("RestoreFromBackup"));
          v18 = v48;
          v48 = v17;

          goto LABEL_27;
        }
        if (v12 == (id)302)
        {
          objc_storeStrong(&v50, CFSTR("ERROR_RESTORING_SERVER_ERROR"));
        }
        else if (v12 == (id)304)
        {
          objc_storeStrong(&v50, CFSTR("ERROR_RESTORING_SERVER_UNAVAILABLE"));
        }
        else
        {
          if (v12 == (id)308)
            goto LABEL_9;
          objc_storeStrong(&v49, &stru_100284738);
        }
      }
    }
  }
LABEL_27:
  if (v50)
  {
    v28 = +[NSBundle mainBundle](NSBundle, "mainBundle");
    v29 = +[UIDevice modelSpecificLocalizedStringKeyForKey:](UIDevice, "modelSpecificLocalizedStringKeyForKey:", v50);
    v30 = -[NSBundle localizedStringForKey:value:table:](v28, "localizedStringForKey:value:table:", v29, &stru_100284738, CFSTR("RestoreFromBackup"));
    v31 = v49;
    v49 = v30;

  }
  if (!objc_msgSend(v49, "length") && (os_variant_has_internal_ui("com.apple.purplebuddy", v32) & 1) != 0)
  {
    v33 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Internal: %@"), location[0]);
    v34 = v49;
    v49 = v33;

  }
  v47 = +[UIAlertController alertControllerWithTitle:message:preferredStyle:](UIAlertController, "alertControllerWithTitle:message:preferredStyle:", v48, v49, 1);
  v35 = v47;
  v36 = +[NSBundle mainBundle](NSBundle, "mainBundle");
  v37 = -[NSBundle localizedStringForKey:value:table:](v36, "localizedStringForKey:value:table:", CFSTR("OK"), &stru_100284738, CFSTR("RestoreFromBackup"));
  v41 = _NSConcreteStackBlock;
  v42 = -1073741824;
  v43 = 0;
  v44 = sub_1001A06B8;
  v45 = &unk_100281AA8;
  v46 = v51;
  v38 = +[UIAlertAction actionWithTitle:style:handler:](UIAlertAction, "actionWithTitle:style:handler:", v37, 0, &v41);
  objc_msgSend(v35, "addAction:", v38);

  v39 = v47;
  objc_storeStrong(&v46, 0);
  objc_storeStrong(&v47, 0);
  objc_storeStrong(&v48, 0);
  objc_storeStrong(&v49, 0);
  objc_storeStrong(&v50, 0);
  objc_storeStrong(&v51, 0);
  objc_storeStrong(location, 0);
  return v39;
}

@end
