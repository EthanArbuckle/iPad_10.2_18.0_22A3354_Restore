@implementation SKUIErrorHelper

+ (id)errorWithSafeUserInfo:(id)a3
{
  id v3;
  id v4;
  void *v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  id v10;
  void **v12;
  uint64_t v13;
  void (*v14)(uint64_t, void *, void *);
  void *v15;
  id v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  char v21;

  v3 = a3;
  if (v3)
  {
    v4 = objc_alloc((Class)NSMutableDictionary);
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "userInfo"));
    v6 = objc_msgSend(v4, "initWithCapacity:", objc_msgSend(v5, "count"));

    v18 = 0;
    v19 = &v18;
    v20 = 0x2020000000;
    v21 = 0;
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "userInfo"));
    v12 = _NSConcreteStackBlock;
    v13 = 3221225472;
    v14 = sub_1000077C4;
    v15 = &unk_100049020;
    v17 = &v18;
    v8 = v6;
    v16 = v8;
    objc_msgSend(v7, "enumerateKeysAndObjectsUsingBlock:", &v12);

    if (*((_BYTE *)v19 + 24))
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "domain", v12, v13, v14, v15));
      v10 = (id)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", v9, objc_msgSend(v3, "code"), v8));

    }
    else
    {
      v10 = v3;
    }

    _Block_object_dispose(&v18, 8);
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

@end
