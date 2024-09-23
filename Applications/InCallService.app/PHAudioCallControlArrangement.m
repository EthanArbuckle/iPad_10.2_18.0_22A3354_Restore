@implementation PHAudioCallControlArrangement

+ (id)features
{
  return +[CNKFeatures sharedInstance](CNKFeatures, "sharedInstance");
}

+ (id)defaultControlTypes
{
  void *v2;
  unsigned int v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "features"));
  v3 = objc_msgSend(v2, "isButtonLayoutEnabled");

  if (v3)
    return &off_100296FC0;
  else
    return &off_100297008;
}

+ (id)simplifiedDefaultControlTypes
{
  return &off_100297038;
}

+ (id)defaultMultipleCallControlTypes
{
  void *v3;
  unsigned int v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v11[3];
  _QWORD v12[2];

  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "features"));
  v4 = objc_msgSend(v3, "isButtonLayoutEnabled");

  if (!v4)
    return &off_100297098;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "features", &off_100296790));
  if (objc_msgSend(v5, "callManagerEnabled"))
    v6 = 5;
  else
    v6 = 9;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", v6));
  v11[1] = v7;
  v11[2] = &off_1002967C0;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v11, 3));
  v12[0] = v8;
  v12[1] = &off_100297050;
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v12, 2));

  return v9;
}

+ (id)simplifiedDefaultMultipleCallControlTypes
{
  return &off_1002970C8;
}

+ (id)defaultAlertControlTypes
{
  return &off_100297110;
}

+ (id)simplifiedDefaultAlertControlTypes
{
  return &off_100297140;
}

- (PHAudioCallControlArrangement)initWithControlTypes:(id)a3
{
  id v4;
  PHAudioCallControlArrangement *v5;
  NSArray *v6;
  NSArray *controlTypes;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PHAudioCallControlArrangement;
  v5 = -[PHAudioCallControlArrangement init](&v9, "init");
  if (v5)
  {
    v6 = (NSArray *)objc_msgSend(v4, "copy");
    controlTypes = v5->_controlTypes;
    v5->_controlTypes = v6;

  }
  return v5;
}

- (unint64_t)rows
{
  void *v2;
  id v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallControlArrangement controlTypes](self, "controlTypes"));
  v3 = objc_msgSend(v2, "count");

  return (unint64_t)v3;
}

- (unint64_t)columns
{
  unint64_t result;
  void *v4;
  void *v5;
  id v6;

  result = -[PHAudioCallControlArrangement rows](self, "rows");
  if (result)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallControlArrangement controlTypes](self, "controlTypes"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectAtIndex:", 0));
    v6 = objc_msgSend(v5, "count");

    return (unint64_t)v6;
  }
  return result;
}

- (unint64_t)controlTypeAtRow:(unint64_t)a3 column:(unint64_t)a4
{
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallControlArrangement controlTypes](self, "controlTypes"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectAtIndexedSubscript:", a3));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectAtIndexedSubscript:", a4));
  v9 = objc_msgSend(v8, "unsignedIntegerValue");

  return (unint64_t)v9;
}

- (void)replaceControlsOfType:(unint64_t)a3 withControlOfType:(unint64_t)a4
{
  id v5;

  v5 = (id)objc_claimAutoreleasedReturnValue(-[PHAudioCallControlArrangement _replaceControlsOfType:withControlOfType:](self, "_replaceControlsOfType:withControlOfType:", a3, a4));
  -[PHAudioCallControlArrangement setControlTypes:](self, "setControlTypes:", v5);

}

- (id)_replaceControlsOfType:(unint64_t)a3 withControlOfType:(unint64_t)a4
{
  void *v7;
  void *i;
  void *v9;
  void *v10;
  id v11;
  id v12;
  id v13;
  uint64_t v14;
  void *j;
  void *v16;
  void *v17;
  id obj;
  uint64_t v20;
  id v21;
  id v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _BYTE v31[128];
  _BYTE v32[128];

  v21 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallControlArrangement controlTypes](self, "controlTypes"));

  if (v7)
  {
    v29 = 0u;
    v30 = 0u;
    v27 = 0u;
    v28 = 0u;
    obj = (id)objc_claimAutoreleasedReturnValue(-[PHAudioCallControlArrangement controlTypes](self, "controlTypes"));
    v22 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v27, v32, 16);
    if (v22)
    {
      v20 = *(_QWORD *)v28;
      do
      {
        for (i = 0; i != v22; i = (char *)i + 1)
        {
          if (*(_QWORD *)v28 != v20)
            objc_enumerationMutation(obj);
          v9 = *(void **)(*((_QWORD *)&v27 + 1) + 8 * (_QWORD)i);
          v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
          v23 = 0u;
          v24 = 0u;
          v25 = 0u;
          v26 = 0u;
          v11 = v9;
          v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v23, v31, 16);
          if (v12)
          {
            v13 = v12;
            v14 = *(_QWORD *)v24;
            do
            {
              for (j = 0; j != v13; j = (char *)j + 1)
              {
                if (*(_QWORD *)v24 != v14)
                  objc_enumerationMutation(v11);
                v16 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * (_QWORD)j);
                if (objc_msgSend(v16, "unsignedIntegerValue") == (id)a3)
                {
                  v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", a4));
                  objc_msgSend(v10, "addObject:", v17);

                }
                else
                {
                  objc_msgSend(v10, "addObject:", v16);
                }
              }
              v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v23, v31, 16);
            }
            while (v13);
          }

          objc_msgSend(v21, "addObject:", v10);
        }
        v22 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v27, v32, 16);
      }
      while (v22);
    }

  }
  return v21;
}

- (NSArray)controlTypes
{
  return (NSArray *)objc_getProperty(self, a2, 8, 1);
}

- (void)setControlTypes:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 8);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_controlTypes, 0);
}

@end
