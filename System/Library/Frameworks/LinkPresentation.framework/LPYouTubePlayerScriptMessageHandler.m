@implementation LPYouTubePlayerScriptMessageHandler

- (LPYouTubePlayerScriptMessageHandler)initWithPlayerView:(id)a3
{
  id v4;
  LPYouTubePlayerScriptMessageHandler *v5;
  LPYouTubePlayerScriptMessageHandler *v6;
  LPYouTubePlayerScriptMessageHandler *v7;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)LPYouTubePlayerScriptMessageHandler;
  v5 = -[LPYouTubePlayerScriptMessageHandler init](&v9, sel_init);
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_playerView, v4);
    v7 = v6;
  }

  return v6;
}

- (void)userContentController:(id)a3 didReceiveScriptMessage:(id)a4
{
  LPYouTubePlayerView **p_playerView;
  id v5;
  id WeakRetained;

  p_playerView = &self->_playerView;
  v5 = a4;
  WeakRetained = objc_loadWeakRetained((id *)p_playerView);
  objc_msgSend(WeakRetained, "didReceiveScriptMessage:", v5);

}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_playerView);
}

@end
