@implementation SRPlayContentViewController

- (SRPlayContentViewController)initWithPlayContent:(id)a3
{
  id v5;
  SRPlayContentViewController *v6;
  SRPlayContentViewController *v7;
  id *p_playContent;
  void *v9;
  void *v10;
  id v11;
  NSObject *v12;
  void *v13;
  objc_super v15;
  uint8_t buf[4];
  const char *v17;
  __int16 v18;
  void *v19;
  __int16 v20;
  void *v21;

  v5 = a3;
  v15.receiver = self;
  v15.super_class = (Class)SRPlayContentViewController;
  v6 = -[SRPlayContentViewController initWithNibName:bundle:](&v15, "initWithNibName:bundle:", 0, 0);
  v7 = v6;
  if (v6)
  {
    p_playContent = (id *)&v6->_playContent;
    objc_storeStrong((id *)&v6->_playContent, a3);
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*p_playContent, "_sr_playerForHighResolutionPlayback:", -[SRPlayContentViewController shouldPlayHighResolutionContent](v7, "shouldPlayHighResolutionContent")));
    v10 = (void *)AFSiriLogContextConnection;
    if (v9)
    {
      if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_DEFAULT))
      {
        v11 = *p_playContent;
        v12 = v10;
        v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "dictionary"));
        *(_DWORD *)buf = 136315650;
        v17 = "-[SRPlayContentViewController initWithPlayContent:]";
        v18 = 2112;
        v19 = v9;
        v20 = 2112;
        v21 = v13;
        _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "%s Received player from SAVCSPlayContent; beginning playback\n    Player: %@\n    Play content command: %@",
          buf,
          0x20u);

      }
      -[SRPlayContentViewController setPlayer:](v7, "setPlayer:", v9);
    }
    else if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_ERROR))
    {
      sub_1000A08D8((void **)&v7->_playContent, v10);
    }
    -[SRPlayContentViewController setAllowsPictureInPicturePlayback:](v7, "setAllowsPictureInPicturePlayback:", 0);

  }
  return v7;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_playContent, 0);
}

@end
