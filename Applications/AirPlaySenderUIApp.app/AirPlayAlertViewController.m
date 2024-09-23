@implementation AirPlayAlertViewController

+ (id)alertWithTitle:(id)a3 withMessage:(id)a4 actions:(id)a5 withCompletion:(id)a6
{
  id v9;
  id v10;
  void *v11;
  id v12;
  id v13;
  char v14;
  uint64_t v15;
  void *i;
  uint64_t v17;
  id v18;
  void *v19;
  id obj;
  _QWORD v22[5];
  id v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];

  v9 = a5;
  v10 = a6;
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[UIAlertController alertControllerWithTitle:message:preferredStyle:](UIAlertController, "alertControllerWithTitle:message:preferredStyle:", a3, a4, 1));
  if (v11)
  {
    v26 = 0u;
    v27 = 0u;
    v24 = 0u;
    v25 = 0u;
    obj = v9;
    v12 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
    if (v12)
    {
      v13 = v12;
      v14 = 0;
      v15 = *(_QWORD *)v25;
      do
      {
        for (i = 0; i != v13; i = (char *)i + 1)
        {
          if (*(_QWORD *)v25 != v15)
            objc_enumerationMutation(obj);
          v17 = *(_QWORD *)(*((_QWORD *)&v24 + 1) + 8 * (_QWORD)i);
          v22[0] = _NSConcreteStackBlock;
          v22[1] = 3221225472;
          v22[2] = sub_100006F6C;
          v22[3] = &unk_100018770;
          v18 = v10;
          v22[4] = v17;
          v23 = v18;
          v19 = (void *)objc_claimAutoreleasedReturnValue(+[UIAlertAction actionWithTitle:style:handler:](UIAlertAction, "actionWithTitle:style:handler:", v17, 0, v22));
          objc_msgSend(v11, "addAction:", v19);
          if ((v14 & 1) == 0)
            objc_msgSend(v11, "setPreferredAction:", v19);

          v14 = 1;
        }
        v13 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
      }
      while (v13);
    }

  }
  return v11;
}

@end
