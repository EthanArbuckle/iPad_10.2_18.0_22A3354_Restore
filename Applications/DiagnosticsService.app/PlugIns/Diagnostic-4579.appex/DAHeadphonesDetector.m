@implementation DAHeadphonesDetector

- (void)start
{
  id v3;

  -[DAHeadphonesDetector audioRouteChanged](self, "audioRouteChanged");
  v3 = (id)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v3, "addObserver:selector:name:object:", self, "audioRouteChanged", AVAudioSessionRouteChangeNotification, 0);

}

- (void)audioRouteChanged
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  id v6;
  uint64_t v7;
  void *i;
  void *v9;
  void *v10;
  void *v11;
  unsigned int v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[AVAudioSession sharedInstance](AVAudioSession, "sharedInstance"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "currentRoute"));

  v15 = 0u;
  v16 = 0u;
  v13 = 0u;
  v14 = 0u;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "outputs", 0));
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v14;
    while (2)
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(_QWORD *)v14 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * (_QWORD)i);
        v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "portType"));
        if (objc_msgSend(v10, "isEqualToString:", AVAudioSessionPortBuiltInReceiver))
        {

        }
        else
        {
          v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "portType"));
          v12 = objc_msgSend(v11, "isEqualToString:", AVAudioSessionPortBuiltInSpeaker);

          if (!v12)
          {

            v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
            objc_msgSend(v4, "postNotificationName:object:", CFSTR("HeadphonesConnectedNotification"), 0);
            goto LABEL_13;
          }
        }
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      if (v6)
        continue;
      break;
    }
  }
LABEL_13:

}

- (void)stop
{
  id v3;

  v3 = (id)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v3, "removeObserver:name:object:", self, AVAudioSessionRouteChangeNotification, 0);

}

@end
