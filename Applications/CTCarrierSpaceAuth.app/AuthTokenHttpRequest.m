@implementation AuthTokenHttpRequest

+ (id)_urlRequestForBaseURL:(id)a3 params:(id)a4
{
  id v5;
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD v12[4];
  id v13;

  v5 = a4;
  v6 = a3;
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_1000020F8;
  v12[3] = &unk_10000C348;
  v13 = objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", objc_msgSend(v5, "count"));
  v7 = v13;
  objc_msgSend(v5, "enumerateKeysAndObjectsUsingBlock:", v12);

  objc_msgSend(v7, "sortUsingSelector:", "caseInsensitiveCompare:");
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "componentsJoinedByString:", CFSTR("&")));
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableURLRequest requestWithURL:](NSMutableURLRequest, "requestWithURL:", v6));

  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "dataUsingEncoding:", 4));
  objc_msgSend(v9, "setHTTPBody:", v10);

  objc_msgSend(v9, "setCachePolicy:", 1);
  objc_msgSend(v9, "setHTTPMethod:", CFSTR("POST"));
  objc_msgSend(v9, "setValue:forHTTPHeaderField:", CFSTR("application/x-www-form-urlencoded"), CFSTR("Content-Type"));

  return v9;
}

+ (id)urlRequestForBaseURL:(id)a3 clientID:(id)a4 secret:(id)a5 redirectURI:(id)a6 authCode:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  void *v18;

  v12 = a3;
  v13 = a5;
  v14 = a7;
  v15 = a6;
  v16 = a4;
  v17 = objc_alloc_init((Class)NSMutableDictionary);
  objc_msgSend(v17, "setObject:forKeyedSubscript:", v14, CFSTR("code"));

  objc_msgSend(v17, "setObject:forKeyedSubscript:", CFSTR("authorization_code"), CFSTR("grant_type"));
  objc_msgSend(v17, "setObject:forKeyedSubscript:", v15, CFSTR("redirect_uri"));

  objc_msgSend(v17, "setObject:forKeyedSubscript:", v16, CFSTR("client_id"));
  if (v13)
    objc_msgSend(v17, "setObject:forKeyedSubscript:", v13, CFSTR("client_secret"));
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "_urlRequestForBaseURL:params:", v12, v17));

  return v18;
}

+ (id)urlRequestForBaseURL:(id)a3 clientID:(id)a4 authCode:(id)a5
{
  return objc_msgSend(a1, "urlRequestForBaseURL:clientID:secret:redirectURI:authCode:", a3, a4, 0, CFSTR("carrierspaceauth://"), a5);
}

@end
