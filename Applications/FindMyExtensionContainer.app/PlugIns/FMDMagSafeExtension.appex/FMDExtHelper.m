@implementation FMDExtHelper

+ (id)deviceIDFromAddress:(id)a3
{
  void *v3;
  void *v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("BT_%@"), a3));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[FMDExtHelper _computehash:](FMDExtHelper, "_computehash:", v3));

  return v4;
}

+ (id)deviceTypeFromVendorId:(unsigned int)a3 productId:(unsigned int)a4
{
  void *v5;
  void *v6;

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("BT_%u_%u"), *(_QWORD *)&a3, *(_QWORD *)&a4));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "_computehash:", v5));

  return v6;
}

+ (id)_computehash:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "dataUsingEncoding:", 4));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "fm_sha256Hash"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "fm_hexString"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "lowercaseString"));

  return v6;
}

+ (id)serialNumberFromVersionInfo:(id)a3
{
  id v3;
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  id v8;
  void *v9;
  uint64_t v10;
  void *v11;
  id v12;
  void *v13;
  uint64_t v14;
  void *v15;
  id v16;

  v3 = a3;
  v4 = objc_msgSend(objc_alloc((Class)NSMutableDictionary), "initWithCapacity:", 3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectAtIndexedSubscript:", 3));
  v6 = objc_opt_class(NSString);
  if ((objc_opt_isKindOfClass(v5, v6) & 1) != 0)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectAtIndexedSubscript:", 3));
    v8 = objc_msgSend(v7, "length");

    if (!v8)
      goto LABEL_5;
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectAtIndexedSubscript:", 3));
    objc_msgSend(v4, "setObject:forKey:", v5, CFSTR("systemSerialNumber"));
  }

LABEL_5:
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectAtIndexedSubscript:", 8));
  v10 = objc_opt_class(NSString);
  if ((objc_opt_isKindOfClass(v9, v10) & 1) != 0)
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectAtIndexedSubscript:", 8));
    v12 = objc_msgSend(v11, "length");

    if (!v12)
      goto LABEL_9;
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectAtIndexedSubscript:", 8));
    objc_msgSend(v4, "setObject:forKey:", v9, CFSTR("leftSerialNumber"));
  }

LABEL_9:
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectAtIndexedSubscript:", 9));
  v14 = objc_opt_class(NSString);
  if ((objc_opt_isKindOfClass(v13, v14) & 1) == 0)
  {
LABEL_12:

    goto LABEL_13;
  }
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectAtIndexedSubscript:", 9));
  v16 = objc_msgSend(v15, "length");

  if (v16)
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectAtIndexedSubscript:", 9));
    objc_msgSend(v4, "setObject:forKey:", v13, CFSTR("rightSerialNumber"));
    goto LABEL_12;
  }
LABEL_13:

  return v4;
}

+ (id)parseStyle:(unint64_t)a3 info:(id)a4
{
  id v5;
  id v6;
  NSObject *v7;
  uint64_t v8;
  id v9;
  uint64_t v10;
  NSObject *v11;
  uint64_t v12;
  id v13;
  id v14;
  uint64_t v15;
  void *i;
  uint64_t v17;
  void *v18;
  void *v19;
  unint64_t v20;
  unint64_t v21;
  BOOL v22;
  unint64_t v23;
  void *v24;
  uint64_t v25;
  void *v26;
  id v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  id v34;
  NSObject *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  id v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  uint8_t v48[128];
  uint8_t buf[4];
  unint64_t v50;
  __int16 v51;
  id v52;

  v5 = a4;
  v6 = sub_1000045AC();
  v7 = objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134218242;
    v50 = a3;
    v51 = 2112;
    v52 = v5;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "#PARSING style %llu with feature %@", buf, 0x16u);
  }

  if (v5)
  {
    v8 = objc_opt_class(NSDictionary);
    if ((objc_opt_isKindOfClass(v5, v8) & 1) != 0)
    {
      v9 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("pattern")));
      if (v9 && (v10 = objc_opt_class(NSString), (objc_opt_isKindOfClass(v9, v10) & 1) != 0))
      {
        v11 = objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("mask")));
        if (v11)
        {
          v12 = objc_opt_class(NSDictionary);
          if ((objc_opt_isKindOfClass(v11, v12) & 1) != 0)
          {
            v43 = v5;
            v46 = 0u;
            v47 = 0u;
            v44 = 0u;
            v45 = 0u;
            v11 = v11;
            v13 = -[NSObject countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v44, v48, 16);
            if (v13)
            {
              v14 = v13;
              v15 = *(_QWORD *)v45;
              do
              {
                for (i = 0; i != v14; i = (char *)i + 1)
                {
                  if (*(_QWORD *)v45 != v15)
                    objc_enumerationMutation(v11);
                  v17 = *(_QWORD *)(*((_QWORD *)&v44 + 1) + 8 * (_QWORD)i);
                  v18 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject objectForKeyedSubscript:](v11, "objectForKeyedSubscript:", v17));
                  v19 = v18;
                  if (v18)
                  {
                    v20 = strtouq((const char *)objc_msgSend(objc_retainAutorelease(v18), "UTF8String"), 0, 16);
                    v21 = a3;
                    if (v20)
                      v22 = (v20 & 1) == 0;
                    else
                      v22 = 0;
                    if (v22)
                    {
                      do
                      {
                        v23 = v20;
                        v20 >>= 1;
                        v21 >>= 1;
                      }
                      while (v23 >= 2 && (v23 & 2) == 0);
                    }
                    v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%llu"), v21 & v20));
                    v25 = objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "stringByReplacingOccurrencesOfString:withString:", v17, v24));

                    v9 = (id)v25;
                  }

                }
                v14 = -[NSObject countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v44, v48, 16);
              }
              while (v14);
            }

            v9 = v9;
            v26 = v9;
            v5 = v43;
            goto LABEL_33;
          }
        }
        v34 = sub_1000045AC();
        v35 = objc_claimAutoreleasedReturnValue(v34);
        if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
          sub_100016C48((uint64_t)v5, v35, v36, v37, v38, v39, v40, v41);

      }
      else
      {
        v27 = sub_1000045AC();
        v11 = objc_claimAutoreleasedReturnValue(v27);
        if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
          sub_100016BE0((uint64_t)v5, v11, v28, v29, v30, v31, v32, v33);
      }
      v26 = 0;
LABEL_33:

      goto LABEL_34;
    }
  }
  v26 = 0;
LABEL_34:

  return v26;
}

@end
