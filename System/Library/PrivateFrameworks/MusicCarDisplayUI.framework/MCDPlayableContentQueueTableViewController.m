@implementation MCDPlayableContentQueueTableViewController

- (MCDPlayableContentQueueTableViewController)initWithContentManager:(id)a3
{
  id v5;
  MCDPlayableContentQueueTableViewController *v6;
  MCDPlayableContentQueueTableViewController *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)MCDPlayableContentQueueTableViewController;
  v6 = -[MCDPlayableContentQueueTableViewController init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_contentManager, a3);

  return v7;
}

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)MCDPlayableContentQueueTableViewController;
  -[MCDPlayableContentQueueTableViewController viewDidLoad](&v6, sel_viewDidLoad);
  MCDCarDisplayBundle();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "localizedStringForKey:value:table:", CFSTR("PLAYBACK_QUEUE_TITLE"), &stru_24FD78C58, CFSTR("MusicCarDisplayUI"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[MCDPlayableContentQueueTableViewController setTitle:](self, "setTitle:", v4);

  -[MCDPlayableContentQueueTableViewController tableView](self, "tableView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[_MCDNowPlayingContentManager setTableView:](self->_contentManager, "setTableView:", v5);

}

- (MCDPlayableContentPlaybackManager)contentManager
{
  return self->_contentManager;
}

- (void)setContentManager:(id)a3
{
  objc_storeStrong((id *)&self->_contentManager, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contentManager, 0);
}

@end
