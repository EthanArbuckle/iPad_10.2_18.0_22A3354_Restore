@implementation LUIMonogrammerSupport

+ (id)monogramWithStyle:(int64_t)a3 diameter:(double)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  id v12;
  void *v13;
  uint64_t v14;
  void *i;
  void *v16;
  float v17;
  uint64_t v18;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _QWORD block[4];
  id v25;
  _BYTE v26[128];

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10001A910;
  block[3] = &unk_100068C58;
  v6 = (id)objc_claimAutoreleasedReturnValue(+[LUIMonogrammerSupport supportedMonogramDiametersSortedInDescendingOrder](LUIMonogrammerSupport, "supportedMonogramDiametersSortedInDescendingOrder"));
  v25 = v6;
  if (qword_100088D98 != -1)
    dispatch_once(&qword_100088D98, block);
  v7 = (void *)qword_100088D90;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", a3));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKeyedSubscript:", v8));

  v22 = 0u;
  v23 = 0u;
  v20 = 0u;
  v21 = 0u;
  v10 = v6;
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v20, v26, 16);
  if (v11)
  {
    v12 = v11;
    v13 = 0;
    v14 = *(_QWORD *)v21;
    do
    {
      for (i = 0; i != v12; i = (char *)i + 1)
      {
        if (*(_QWORD *)v21 != v14)
          objc_enumerationMutation(v10);
        v16 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * (_QWORD)i);
        objc_msgSend(v16, "floatValue", (_QWORD)v20);
        if (v17 >= a4)
        {
          v18 = objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectForKeyedSubscript:", v16));

          v13 = (void *)v18;
        }
      }
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v20, v26, 16);
    }
    while (v12);
  }
  else
  {
    v13 = 0;
  }

  return v13;
}

+ (id)supportedMonogramDiametersSortedInDescendingOrder
{
  if (qword_100088DA8 != -1)
    dispatch_once(&qword_100088DA8, &stru_100069568);
  return (id)qword_100088DA0;
}

@end
