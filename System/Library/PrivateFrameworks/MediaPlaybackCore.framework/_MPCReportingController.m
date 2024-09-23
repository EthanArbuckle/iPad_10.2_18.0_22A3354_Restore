@implementation _MPCReportingController

- (_MPCReportingController)initWithPlaybackEngine:(id)a3
{
  id v4;
  _MPCReportingController *v5;
  _MPCReportingController *v6;
  MPCLyricsReportingController *v7;
  MPCLyricsReportingController *lyricsReportingController;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)_MPCReportingController;
  v5 = -[_MPCReportingController init](&v10, sel_init);
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_playbackEngine, v4);
    v7 = objc_alloc_init(MPCLyricsReportingController);
    lyricsReportingController = v6->_lyricsReportingController;
    v6->_lyricsReportingController = v7;

  }
  return v6;
}

- (void)recordLyricsViewEvent:(id)a3
{
  -[MPCLyricsReportingController recordLyricsViewEvent:](self->_lyricsReportingController, "recordLyricsViewEvent:", a3);
}

- (MPCPlaybackEngine)playbackEngine
{
  return (MPCPlaybackEngine *)objc_loadWeakRetained((id *)&self->_playbackEngine);
}

- (MPCLyricsReportingController)lyricsReportingController
{
  return self->_lyricsReportingController;
}

- (void)setLyricsReportingController:(id)a3
{
  objc_storeStrong((id *)&self->_lyricsReportingController, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lyricsReportingController, 0);
  objc_destroyWeak((id *)&self->_playbackEngine);
}

@end
