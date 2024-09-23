@implementation MPMoviePlayerViewController

- (MPMoviePlayerViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  return -[MPMoviePlayerViewController initWithContentURL:](self, "initWithContentURL:", 0, a4);
}

- (MPMoviePlayerViewController)initWithCoder:(id)a3
{
  return -[MPMoviePlayerViewController initWithContentURL:](self, "initWithContentURL:", 0);
}

- (MPMoviePlayerViewController)initWithContentURL:(NSURL *)contentURL
{
  NSURL *v4;
  MPMoviePlayerViewController *v5;
  MPMoviePlayerController *v6;
  MPMoviePlayerController *moviePlayer;
  objc_super v9;

  v4 = contentURL;
  v9.receiver = self;
  v9.super_class = (Class)MPMoviePlayerViewController;
  v5 = -[MPMoviePlayerViewController initWithNibName:bundle:](&v9, sel_initWithNibName_bundle_, 0, 0);
  if (v5)
  {
    v6 = -[MPMoviePlayerController initWithContentURL:]([MPMoviePlayerController alloc], "initWithContentURL:", v4);
    moviePlayer = v5->_moviePlayer;
    v5->_moviePlayer = v6;

    -[MPMoviePlayerController setHostingViewController:](v5->_moviePlayer, "setHostingViewController:", v5);
  }

  return v5;
}

- (void)loadView
{
  id v3;

  -[MPMoviePlayerController view](self->_moviePlayer, "view");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  -[MPMoviePlayerViewController setView:](self, "setView:", v3);

}

- (MPMoviePlayerController)moviePlayer
{
  return self->_moviePlayer;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_moviePlayer, 0);
}

@end
