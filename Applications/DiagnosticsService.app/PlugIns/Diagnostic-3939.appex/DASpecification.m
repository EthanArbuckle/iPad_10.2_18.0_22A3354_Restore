@implementation DASpecification

- (DASpecification)initWithDictionary:(id)a3
{
  id v4;
  DASpecification *v5;
  DASpecification *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)DASpecification;
  v5 = -[DASpecification init](&v8, "init");
  if (v5 && !objc_msgSend(v4, "count"))
    v6 = 0;
  else
    v6 = v5;

  return v6;
}

- (DASpecification)init
{
  return -[DASpecification initWithDictionary:](self, "initWithDictionary:", 0);
}

+ (id)specificationFromArray:(id)a3
{
  id v4;
  void *v5;
  id v6;
  id v7;
  id v8;
  uint64_t v9;
  void *i;
  uint64_t v11;
  id v12;
  id v13;
  void *v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", objc_msgSend(v4, "count")));
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v6 = v4;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v17;
    while (2)
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(_QWORD *)v17 != v9)
          objc_enumerationMutation(v6);
        v11 = *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * (_QWORD)i);
        v12 = objc_alloc((Class)a1);
        v13 = objc_msgSend(v12, "initWithDictionary:", v11, (_QWORD)v16);
        if (!v13)
        {

          v5 = 0;
          goto LABEL_11;
        }
        v14 = v13;
        objc_msgSend(v5, "addObject:", v13);

      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
      if (v8)
        continue;
      break;
    }
  }
LABEL_11:

  return v5;
}

@end
