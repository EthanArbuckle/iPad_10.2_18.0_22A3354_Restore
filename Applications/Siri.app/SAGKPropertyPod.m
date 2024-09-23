@implementation SAGKPropertyPod

- (id)_convertedCardSections
{
  id v3;
  id v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  id obj;
  uint64_t v18;
  id v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];

  v19 = objc_alloc_init((Class)NSMutableArray);
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  obj = (id)objc_claimAutoreleasedReturnValue(-[SAGKPropertyPod propertyList](self, "propertyList"));
  v3 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
  if (v3)
  {
    v4 = v3;
    v18 = *(_QWORD *)v21;
    do
    {
      v5 = 0;
      do
      {
        if (*(_QWORD *)v21 != v18)
          objc_enumerationMutation(obj);
        v6 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * (_QWORD)v5);
        v7 = objc_alloc_init((Class)SFRowCardSection);
        v8 = objc_alloc_init((Class)SFRichText);
        v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "name"));
        objc_msgSend(v8, "setText:", v9);

        objc_msgSend(v7, "setLeadingText:", v8);
        v10 = objc_alloc_init((Class)SFRichText);
        v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "valueAnnotation"));

        if (v11)
        {
          v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "value"));
          v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "valueAnnotation"));
          v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ %@"), v12, v13));

        }
        else
        {
          v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "value"));
        }
        objc_msgSend(v10, "setText:", v14);
        objc_msgSend(v7, "setTrailingText:", v10);
        objc_msgSend(v19, "addObject:", v7);

        v5 = (char *)v5 + 1;
      }
      while (v4 != v5);
      v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    }
    while (v4);
  }

  v15 = objc_msgSend(v19, "copy");
  return v15;
}

@end
