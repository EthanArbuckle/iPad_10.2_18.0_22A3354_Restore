@implementation DAAudioSessionInterruptDetector

- (void)start
{
  id v3;

  v3 = (id)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v3, "addObserver:selector:name:object:", self, "audioSystemInterrupt:", AVAudioSessionInterruptionNotification, 0);

}

- (void)audioSystemInterrupt:(id)a3
{
  void *v3;
  void *v4;
  unsigned int v5;
  id v6;

  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "userInfo"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKeyedSubscript:", AVAudioSessionInterruptionTypeKey));
  v5 = objc_msgSend(v4, "isEqualToNumber:", &off_100010840);

  if (v5)
  {
    v6 = (id)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    objc_msgSend(v6, "postNotificationName:object:", CFSTR("AudioSessionInterruptNotification"), 0);

  }
}

- (void)stop
{
  id v3;

  v3 = (id)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v3, "removeObserver:name:object:", self, AVAudioSessionRouteChangeNotification, 0);

}

@end
