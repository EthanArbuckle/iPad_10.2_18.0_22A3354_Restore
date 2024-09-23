@implementation LUIRandomImageAssignment

+ (id)sharedInstance
{
  if (qword_100088E90 != -1)
    dispatch_once(&qword_100088E90, &stru_100069D10);
  return (id)qword_100088E88;
}

- (LUIRandomImageAssignment)init
{
  LUIRandomImageAssignment *v2;
  void *v3;
  void *v4;
  id v5;
  NSObject *v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  uint64_t v11;
  void *i;
  void *v13;
  NSArray *v14;
  NSArray *imageURLs;
  void *v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  id v22;
  objc_super v23;
  _BYTE v24[128];

  v23.receiver = self;
  v23.super_class = (Class)LUIRandomImageAssignment;
  v2 = -[LUIRandomImageAssignment init](&v23, "init");
  if (v2)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL fileURLWithPath:](NSURL, "fileURLWithPath:", CFSTR("/AppleInternal/Library/LoginUI/LUIRandomImages.plist")));
    v22 = 0;
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithContentsOfURL:error:](NSDictionary, "dictionaryWithContentsOfURL:error:", v3, &v22));
    v5 = v22;
    if (v5)
    {
      v6 = qword_100088F08;
      if (os_log_type_enabled((os_log_t)qword_100088F08, OS_LOG_TYPE_ERROR))
        sub_10003C9D4((uint64_t)v5, v6);
    }
    else if (v4)
    {
      v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
      v18 = 0u;
      v19 = 0u;
      v20 = 0u;
      v21 = 0u;
      v17 = v4;
      v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("Images")));
      v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v18, v24, 16);
      if (v9)
      {
        v10 = v9;
        v11 = *(_QWORD *)v19;
        do
        {
          for (i = 0; i != v10; i = (char *)i + 1)
          {
            if (*(_QWORD *)v19 != v11)
              objc_enumerationMutation(v8);
            v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL URLWithString:](NSURL, "URLWithString:", *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * (_QWORD)i)));
            objc_msgSend(v7, "addObject:", v13);

          }
          v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v18, v24, 16);
        }
        while (v10);
      }

      v14 = (NSArray *)objc_msgSend(v7, "copy");
      imageURLs = v2->_imageURLs;
      v2->_imageURLs = v14;

      v4 = v17;
    }

  }
  return v2;
}

- (void)downloadURL:(id)a3 completionHandler:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  _QWORD v11[4];
  id v12;

  v5 = a4;
  v6 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSURLSession sharedSession](NSURLSession, "sharedSession"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSURLRequest requestWithURL:](NSURLRequest, "requestWithURL:", v6));

  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_10002E794;
  v11[3] = &unk_100069D38;
  v12 = v5;
  v9 = v5;
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "downloadTaskWithRequest:completionHandler:", v8, v11));
  objc_msgSend(v10, "resume");

}

- (void)assignImagesRandomlyToUsers:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  uint32_t v8;
  id v9;
  id v10;
  uint64_t v11;
  void *i;
  uint64_t v13;
  id v14;
  void *v15;
  id obj;
  _QWORD v17[5];
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];

  v4 = a3;
  if (objc_msgSend(v4, "count"))
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[LUIRandomImageAssignment imageURLs](self, "imageURLs"));
    v6 = objc_msgSend(v5, "count");

    if (v6)
    {
      v7 = (void *)objc_claimAutoreleasedReturnValue(-[LUIRandomImageAssignment imageURLs](self, "imageURLs"));
      v8 = objc_msgSend(v7, "count");
      v18 = 0u;
      v19 = 0u;
      v20 = 0u;
      v21 = 0u;
      obj = v4;
      v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
      if (v9)
      {
        v10 = v9;
        v11 = *(_QWORD *)v19;
        do
        {
          for (i = 0; i != v10; i = (char *)i + 1)
          {
            if (*(_QWORD *)v19 != v11)
              objc_enumerationMutation(obj);
            v13 = *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * (_QWORD)i);
            v14 = objc_msgSend(v7, "objectAtIndexedSubscript:", arc4random_uniform(v8));
            v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
            v17[0] = _NSConcreteStackBlock;
            v17[1] = 3221225472;
            v17[2] = sub_10002EAB0;
            v17[3] = &unk_100069D60;
            v17[4] = v13;
            -[LUIRandomImageAssignment downloadURL:completionHandler:](self, "downloadURL:completionHandler:", v15, v17);

          }
          v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
        }
        while (v10);
      }

    }
  }

}

- (NSArray)imageURLs
{
  return self->_imageURLs;
}

- (void)setImageURLs:(id)a3
{
  objc_storeStrong((id *)&self->_imageURLs, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_imageURLs, 0);
}

@end
