@implementation STKStickerHelper

+ (id)ckAttributionInfoFromSticker:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v3 = a3;
  if ((objc_opt_respondsToSelector(v3, "attributionInfo") & 1) != 0)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "attributionInfo"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionaryWithCapacity:](NSMutableDictionary, "dictionaryWithCapacity:", 3));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "adamID"));

    if (v6)
    {
      v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "adamID"));
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v7, CFSTR("adam-id"));

    }
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "bundleIdentifier"));

    if (v8)
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "bundleIdentifier"));
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v9, CFSTR("bundle-id"));

    }
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "name"));

    if (v10)
    {
      v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "name"));
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v11, CFSTR("name"));

    }
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

@end
