@implementation AccessoryPresenceController

- (void)setupWithInputs:(id)a3 responder:(id)a4
{
  -[AccessoryPresenceController setInputs:](self, "setInputs:", a3, a4);
}

- (void)start
{
  _QWORD *v3;
  _QWORD *v4;
  void *v5;
  uint64_t v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  _UNKNOWN **v12;
  void *v13;
  void *v14;
  unsigned int (**v15)(_QWORD);
  unint64_t v16;
  void *v17;
  id v18;
  uint64_t v19;
  NSObject *v20;
  void *v21;
  _QWORD v22[5];
  _QWORD v23[5];
  uint8_t buf[4];
  void *v25;
  __int16 v26;
  id v27;
  _QWORD v28[2];
  _QWORD v29[2];

  v28[0] = CFSTR("USB");
  v23[0] = _NSConcreteStackBlock;
  v23[1] = 3221225472;
  v23[2] = sub_100002C60;
  v23[3] = &unk_100004150;
  v23[4] = self;
  v3 = objc_retainBlock(v23);
  v29[0] = v3;
  v28[1] = CFSTR("MiniJack");
  v22[0] = _NSConcreteStackBlock;
  v22[1] = 3221225472;
  v22[2] = sub_100002C68;
  v22[3] = &unk_100004150;
  v22[4] = self;
  v4 = objc_retainBlock(v22);
  v29[1] = v4;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v29, v28, 2));

  v6 = DiagnosticLogHandleForCategory(3);
  v7 = objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[AccessoryPresenceController inputs](self, "inputs"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "identifier"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[AccessoryPresenceController inputs](self, "inputs"));
    v11 = objc_msgSend(v10, "timeout");
    *(_DWORD *)buf = 138412546;
    v25 = v9;
    v26 = 2048;
    v27 = v11;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Check accessory %@ with time out of %lu seconds", buf, 0x16u);

  }
  if ((-[AccessoryPresenceController isCancelled](self, "isCancelled") & 1) != 0)
  {
    v12 = &off_100004288;
  }
  else
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[AccessoryPresenceController inputs](self, "inputs"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "identifier"));
    v15 = (unsigned int (**)(_QWORD))objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKeyedSubscript:", v14));

    if (v15)
    {
      v16 = 0;
      v12 = &off_100004288;
      do
      {
        if ((-[AccessoryPresenceController isCancelled](self, "isCancelled") & 1) != 0)
          break;
        if (v15[2](v15))
          v12 = &off_1000042A0;
        if (objc_msgSend(v12, "isEqualToNumber:", &off_100004288))
        {
          +[NSThread sleepForTimeInterval:](NSThread, "sleepForTimeInterval:", 1.0);
          ++v16;
        }
        if (!objc_msgSend(v12, "isEqualToNumber:", &off_100004288))
          break;
        v17 = (void *)objc_claimAutoreleasedReturnValue(-[AccessoryPresenceController inputs](self, "inputs"));
        v18 = objc_msgSend(v17, "timeout");

      }
      while (v16 < (unint64_t)v18);
    }
    else
    {
      v19 = DiagnosticLogHandleForCategory(3);
      v20 = objc_claimAutoreleasedReturnValue(v19);
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
        sub_100003074(self, v20);

      v12 = &off_1000042B8;
    }

  }
  if ((-[AccessoryPresenceController isCancelled](self, "isCancelled") & 1) == 0)
  {
    v21 = (void *)objc_claimAutoreleasedReturnValue(-[AccessoryPresenceController result](self, "result"));
    objc_msgSend(v21, "setStatusCode:", v12);

  }
  -[AccessoryPresenceController setFinished:](self, "setFinished:", 1);

}

- (BOOL)isHeadsetPluggedIn
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  id v6;
  int v7;
  uint64_t v8;
  void *i;
  void *v10;
  uint64_t v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  uint8_t v21[4];
  uint64_t v22;
  _BYTE v23[128];

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[AVAudioSession sharedInstance](AVAudioSession, "sharedInstance"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "currentRoute"));

  v19 = 0u;
  v20 = 0u;
  v17 = 0u;
  v18 = 0u;
  v16 = v3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "outputs"));
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v17, v23, 16);
  if (v5)
  {
    v6 = v5;
    v7 = 0;
    v8 = *(_QWORD *)v18;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(_QWORD *)v18 != v8)
          objc_enumerationMutation(v4);
        v10 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * (_QWORD)i);
        v11 = DiagnosticLogHandleForCategory(3);
        v12 = objc_claimAutoreleasedReturnValue(v11);
        if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
          sub_100003120(v21, v10, &v22, v12);

        v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "portType"));
        if ((objc_msgSend(v13, "isEqualToString:", AVAudioSessionPortHeadphones) & 1) != 0)
        {
          v7 = 1;
        }
        else
        {
          v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "portType"));
          v7 |= objc_msgSend(v14, "isEqualToString:", AVAudioSessionPortLineOut);

        }
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v17, v23, 16);
    }
    while (v6);
  }
  else
  {
    LOBYTE(v7) = 0;
  }

  return v7 & 1;
}

- (BOOL)isDeviceDocked
{
  void *v3;
  void *v4;
  id v5;
  id v6;
  char v7;
  uint64_t v8;
  void *i;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  unsigned int v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  id obj;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  const __CFString *v26;
  void *v27;
  _BYTE v28[128];

  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[EAAccessoryManager sharedAccessoryManager](EAAccessoryManager, "sharedAccessoryManager"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "connectedAccessories"));

  obj = v4;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v22, v28, 16);
  if (v5)
  {
    v6 = v5;
    v7 = 0;
    v8 = *(_QWORD *)v23;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(_QWORD *)v23 != v8)
          objc_enumerationMutation(obj);
        v10 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * (_QWORD)i);
        v11 = (void *)objc_claimAutoreleasedReturnValue(-[AccessoryPresenceController inputs](self, "inputs"));
        v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "modelNumbers"));
        v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "modelNumber"));
        v14 = objc_msgSend(v12, "containsObject:", v13);

        if (v14)
        {
          v26 = CFSTR("dockModel");
          v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "modelNumber"));
          v16 = stringOrNull(v15);
          v17 = (void *)objc_claimAutoreleasedReturnValue(v16);
          v27 = v17;
          v7 = 1;
          v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v27, &v26, 1));
          v19 = (void *)objc_claimAutoreleasedReturnValue(-[AccessoryPresenceController result](self, "result"));
          objc_msgSend(v19, "setData:", v18);

        }
      }
      v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v22, v28, 16);
    }
    while (v6);
  }
  else
  {
    v7 = 0;
  }

  return v7 & 1;
}

- (AccessoryPresenceInputs)inputs
{
  return self->_inputs;
}

- (void)setInputs:(id)a3
{
  objc_storeStrong((id *)&self->_inputs, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_inputs, 0);
}

@end
