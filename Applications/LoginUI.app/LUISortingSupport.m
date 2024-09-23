@implementation LUISortingSupport

+ (id)sharedInstance
{
  if (qword_100088E08 != -1)
    dispatch_once(&qword_100088E08, &stru_100069B70);
  return (id)qword_100088E00;
}

- (id)sortDescriptorWithKey:(id)a3 comparatorType:(unint64_t)a4
{
  id v6;
  uint64_t v7;
  void *v8;
  id v9;
  uint64_t v10;

  v6 = a3;
  switch(a4)
  {
    case 0uLL:
      v7 = objc_claimAutoreleasedReturnValue(+[CNContact comparatorForNameSortOrder:](CNContact, "comparatorForNameSortOrder:", -[LUISortingSupport _contactSortOrder](self, "_contactSortOrder")));
      goto LABEL_4;
    case 1uLL:
      v7 = objc_claimAutoreleasedReturnValue(-[LUISortingSupport _comparator](self, "_comparator"));
LABEL_4:
      v8 = (void *)v7;
      self = (LUISortingSupport *)objc_claimAutoreleasedReturnValue(+[NSSortDescriptor sortDescriptorWithKey:ascending:comparator:](NSSortDescriptor, "sortDescriptorWithKey:ascending:comparator:", v6, 1, v7));

      break;
    case 2uLL:
      v9 = v6;
      v10 = 1;
      goto LABEL_7;
    case 3uLL:
      v9 = v6;
      v10 = 0;
LABEL_7:
      self = (LUISortingSupport *)objc_claimAutoreleasedReturnValue(+[NSSortDescriptor sortDescriptorWithKey:ascending:](NSSortDescriptor, "sortDescriptorWithKey:ascending:", v9, v10));
      break;
    default:
      break;
  }

  return self;
}

- (int64_t)_contactSortOrder
{
  void *v2;
  void *v3;
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  NSObject *v8;
  const char *v9;
  int64_t v10;
  uint8_t *v11;
  NSObject *v12;
  __int16 v14;
  uint8_t buf[16];
  __int16 v16;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("SORT_ORDER_TYPE"), &stru_100069EB8, 0));

  v4 = objc_msgSend(v3, "rangeOfString:options:", CFSTR("<[a-z]+>"), 1024);
  v6 = 0;
  if (v4 == (id)0x7FFFFFFFFFFFFFFFLL)
    goto LABEL_10;
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "substringWithRange:", v4, v5));
  v6 = v7;
  if (!v7)
    goto LABEL_10;
  if (objc_msgSend(v7, "isEqualToString:", CFSTR("<bygivenname>")))
  {
    v8 = qword_100088F38;
    if (os_log_type_enabled((os_log_t)qword_100088F38, OS_LOG_TYPE_DEFAULT))
    {
      v16 = 0;
      v9 = "Sort order type is: CNContactSortOrderGivenName";
      v10 = 2;
      v11 = (uint8_t *)&v16;
LABEL_12:
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, v9, v11, 2u);
      goto LABEL_14;
    }
    goto LABEL_13;
  }
  if (!objc_msgSend(v6, "isEqualToString:", CFSTR("<byfamilyname>")))
  {
LABEL_10:
    v8 = qword_100088F38;
    if (os_log_type_enabled((os_log_t)qword_100088F38, OS_LOG_TYPE_DEFAULT))
    {
      v14 = 0;
      v9 = "Default sort order type is: CNContactSortOrderGivenName";
      v10 = 2;
      v11 = (uint8_t *)&v14;
      goto LABEL_12;
    }
LABEL_13:
    v10 = 2;
    goto LABEL_14;
  }
  v12 = qword_100088F38;
  if (os_log_type_enabled((os_log_t)qword_100088F38, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Sort order type is: CNContactSortOrderFamilyName", buf, 2u);
  }
  v10 = 3;
LABEL_14:

  return v10;
}

- (id)_comparator
{
  _QWORD v3[5];

  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_10002A2DC;
  v3[3] = &unk_100069B98;
  v3[4] = self;
  return objc_retainBlock(v3);
}

- (BOOL)isSpecialCharacter:(unsigned __int16)a3
{
  uint64_t v3;
  void *v4;

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSCharacterSet letterCharacterSet](NSCharacterSet, "letterCharacterSet"));
  LOBYTE(v3) = objc_msgSend(v4, "characterIsMember:", v3) ^ 1;

  return v3;
}

@end
