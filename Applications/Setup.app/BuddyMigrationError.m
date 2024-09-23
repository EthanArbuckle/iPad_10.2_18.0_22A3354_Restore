@implementation BuddyMigrationError

+ (id)titleForError:(id)a3
{
  id v3;
  unsigned __int8 v4;
  NSBundle *v5;
  NSBundle *v6;
  NSBundle *v7;
  id location[3];
  NSString *v10;

  location[2] = a1;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v3 = objc_msgSend(location[0], "domain");
  v4 = objc_msgSend(v3, "isEqualToString:", CFSTR("MBErrorDomain"));

  if ((v4 & 1) == 0)
    goto LABEL_6;
  if (objc_msgSend(location[0], "code") != (id)202)
  {
    if (objc_msgSend(location[0], "code") == (id)106)
    {
      v6 = +[NSBundle mainBundle](NSBundle, "mainBundle");
      v10 = -[NSBundle localizedStringForKey:value:table:](v6, "localizedStringForKey:value:table:", CFSTR("MIGRATION_ERROR_TITLE_OUT_OF_SPACE"), &stru_100284738, CFSTR("Migration"));

      goto LABEL_7;
    }
LABEL_6:
    v7 = +[NSBundle mainBundle](NSBundle, "mainBundle");
    v10 = -[NSBundle localizedStringForKey:value:table:](v7, "localizedStringForKey:value:table:", CFSTR("MIGRATION_ERROR_TITLE_GENERIC"), &stru_100284738, CFSTR("Migration"));

    goto LABEL_7;
  }
  v5 = +[NSBundle mainBundle](NSBundle, "mainBundle");
  v10 = -[NSBundle localizedStringForKey:value:table:](v5, "localizedStringForKey:value:table:", CFSTR("MIGRATION_ERROR_TITLE_CANCELLED"), &stru_100284738, CFSTR("Migration"));

LABEL_7:
  objc_storeStrong(location, 0);
  return v10;
}

+ (id)detailTextForErrorOnSource:(id)a3
{
  id v3;
  unsigned __int8 v4;
  NSBundle *v5;
  id v6;
  NSString *v7;
  id v8;
  NSBundle *v9;
  id v10;
  NSString *v11;
  id v12;
  NSBundle *v13;
  NSString *v14;
  id v15;
  id v16;
  id v18;
  id location[3];

  location[2] = a1;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v18 = 0;
  v3 = objc_msgSend(location[0], "domain");
  v4 = objc_msgSend(v3, "isEqualToString:", CFSTR("MBErrorDomain"));

  if ((v4 & 1) != 0)
  {
    if (objc_msgSend(location[0], "code") == (id)15)
    {
      v5 = +[NSBundle mainBundle](NSBundle, "mainBundle");
      v6 = +[UIDevice modelSpecificLocalizedStringKeyForKey:](UIDevice, "modelSpecificLocalizedStringKeyForKey:", CFSTR("MIGRATION_ERROR_DETAIL_DISCONNECTED"));
      v7 = -[NSBundle localizedStringForKey:value:table:](v5, "localizedStringForKey:value:table:", v6, &stru_100284738, CFSTR("Migration"));
      v8 = v18;
      v18 = v7;

    }
    else if (objc_msgSend(location[0], "code") == (id)106)
    {
      v9 = +[NSBundle mainBundle](NSBundle, "mainBundle");
      v10 = +[UIDevice modelSpecificLocalizedStringKeyForKey:](UIDevice, "modelSpecificLocalizedStringKeyForKey:", CFSTR("MIGRATION_ERROR_DETAIL_SOURCE_OUT_OF_SPACE"));
      v11 = -[NSBundle localizedStringForKey:value:table:](v9, "localizedStringForKey:value:table:", v10, &stru_100284738, CFSTR("Migration"));
      v12 = v18;
      v18 = v11;

    }
  }
  else
  {
    v13 = +[NSBundle mainBundle](NSBundle, "mainBundle");
    v14 = -[NSBundle localizedStringForKey:value:table:](v13, "localizedStringForKey:value:table:", CFSTR("MIGRATION_ERROR_DETAIL_GENERIC"), &stru_100284738, CFSTR("Migration"));
    v15 = v18;
    v18 = v14;

  }
  v16 = +[BuddyMigrationError _appendErrorInformationForInternal:error:](BuddyMigrationError, "_appendErrorInformationForInternal:error:", v18, location[0], v18);
  objc_storeStrong(&v18, 0);
  objc_storeStrong(location, 0);
  return v16;
}

+ (id)detailTextForErrorOnTarget:(id)a3 requiresErase:(BOOL)a4
{
  id v5;
  unsigned __int8 v6;
  NSBundle *v7;
  id v8;
  NSString *v9;
  id v10;
  NSBundle *v11;
  id v12;
  NSString *v13;
  id v14;
  NSBundle *v15;
  NSString *v16;
  id v17;
  id v18;
  NSBundle *v19;
  id v20;
  NSString *v21;
  NSString *v22;
  id v23;
  id v24;
  NSString *v25;
  id v26;
  BOOL v27;
  NSBundle *v28;
  NSString *v29;
  id v30;
  id v31;
  char v33;
  id v34;
  id v35;
  BOOL v36;
  id location[3];

  location[2] = a1;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v36 = a4;
  v35 = 0;
  v5 = objc_msgSend(location[0], "domain");
  v6 = objc_msgSend(v5, "isEqualToString:", CFSTR("MBErrorDomain"));

  if ((v6 & 1) != 0)
  {
    if (objc_msgSend(location[0], "code") == (id)202)
    {
      objc_storeStrong(&v35, 0);
    }
    else if (objc_msgSend(location[0], "code") == (id)15)
    {
      v7 = +[NSBundle mainBundle](NSBundle, "mainBundle");
      v8 = +[UIDevice modelSpecificLocalizedStringKeyForKey:](UIDevice, "modelSpecificLocalizedStringKeyForKey:", CFSTR("MIGRATION_ERROR_DETAIL_DISCONNECTED"));
      v9 = -[NSBundle localizedStringForKey:value:table:](v7, "localizedStringForKey:value:table:", v8, &stru_100284738, CFSTR("Migration"));
      v10 = v35;
      v35 = v9;

    }
    else if (objc_msgSend(location[0], "code") == (id)106)
    {
      v11 = +[NSBundle mainBundle](NSBundle, "mainBundle");
      v12 = +[UIDevice modelSpecificLocalizedStringKeyForKey:](UIDevice, "modelSpecificLocalizedStringKeyForKey:", CFSTR("MIGRATION_ERROR_DETAIL_TARGET_OUT_OF_SPACE"));
      v13 = -[NSBundle localizedStringForKey:value:table:](v11, "localizedStringForKey:value:table:", v12, &stru_100284738, CFSTR("Migration"));
      v14 = v35;
      v35 = v13;

    }
  }
  else
  {
    v15 = +[NSBundle mainBundle](NSBundle, "mainBundle");
    v16 = -[NSBundle localizedStringForKey:value:table:](v15, "localizedStringForKey:value:table:", CFSTR("MIGRATION_ERROR_DETAIL_GENERIC"), &stru_100284738, CFSTR("Migration"));
    v17 = v35;
    v35 = v16;

  }
  if (v36)
  {
    if (v35)
    {
      v18 = v35;
      v19 = +[NSBundle mainBundle](NSBundle, "mainBundle");
      v20 = +[UIDevice modelSpecificLocalizedStringKeyForKey:](UIDevice, "modelSpecificLocalizedStringKeyForKey:", CFSTR("MIGRATION_ERROR_DETAIL_TARGET_SUFFIX_RESET"));
      v21 = -[NSBundle localizedStringForKey:value:table:](v19, "localizedStringForKey:value:table:", v20, &stru_100284738, CFSTR("Migration"));
      v22 = +[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", CFSTR("%@ %@"), v18, v21);
      v23 = v35;
      v35 = v22;

    }
    else
    {
      v19 = +[NSBundle mainBundle](NSBundle, "mainBundle");
      v24 = +[UIDevice modelSpecificLocalizedStringKeyForKey:](UIDevice, "modelSpecificLocalizedStringKeyForKey:", CFSTR("MIGRATION_ERROR_DETAIL_TARGET_SUFFIX_RESET"));
      v25 = -[NSBundle localizedStringForKey:value:table:](v19, "localizedStringForKey:value:table:", v24, &stru_100284738, CFSTR("Migration"));
      v26 = v35;
      v35 = v25;

    }
  }
  else
  {
    v33 = 0;
    v27 = 0;
    if (!v35)
    {
      v34 = objc_msgSend(location[0], "domain");
      v33 = 1;
      v27 = 0;
      if ((objc_msgSend(v34, "isEqualToString:", CFSTR("MBErrorDomain")) & 1) != 0)
        v27 = objc_msgSend(location[0], "code") == (id)202;
    }
    if ((v33 & 1) != 0)

    if (v27)
    {
      v28 = +[NSBundle mainBundle](NSBundle, "mainBundle");
      v29 = -[NSBundle localizedStringForKey:value:table:](v28, "localizedStringForKey:value:table:", CFSTR("MIGRATION_ERROR_DETAIL_GENERIC"), &stru_100284738, CFSTR("Migration"));
      v30 = v35;
      v35 = v29;

    }
  }
  v31 = +[BuddyMigrationError _appendErrorInformationForInternal:error:](BuddyMigrationError, "_appendErrorInformationForInternal:error:", v35, location[0]);
  objc_storeStrong(&v35, 0);
  objc_storeStrong(location, 0);
  return v31;
}

+ (id)_appendErrorInformationForInternal:(id)a3 error:(id)a4
{
  uint64_t v5;
  id v7;
  id location[3];
  NSString *v9;

  location[2] = a1;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v7 = 0;
  objc_storeStrong(&v7, a4);
  if ((os_variant_has_internal_ui("com.apple.purplebuddy", v5) & 1) != 0 && v7)
    v9 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@\n\nInternal: %@"), location[0], v7);
  else
    v9 = (NSString *)location[0];
  objc_storeStrong(&v7, 0);
  objc_storeStrong(location, 0);
  return v9;
}

@end
