@implementation UIViewControllerAccessibility__Music__UIKit

+ (id)safeCategoryTargetClassName
{
  return CFSTR("UIViewController");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:", CFSTR("Music.LibraryAlbumsViewController"));
  objc_msgSend(v3, "validateClass:", CFSTR("Music.LibraryArtistsListViewController"));
  objc_msgSend(v3, "validateClass:", CFSTR("Music.LibraryArtistDetailViewController"));
  objc_msgSend(v3, "validateClass:", CFSTR("Music.LibraryGenresViewController"));
  objc_msgSend(v3, "validateClass:", CFSTR("Music.LibraryComposersViewController"));
  objc_msgSend(v3, "validateClass:", CFSTR("Music.LibraryPlaylistsViewController"));
  objc_msgSend(v3, "validateClass:", CFSTR("Music.LibraryMusicVideosViewController"));
  objc_msgSend(v3, "validateClass:", CFSTR("Music.LibraryMainViewController"));
  objc_msgSend(v3, "validateClass:", CFSTR("Music.LibraryRecentlyAddedViewController"));
  objc_msgSend(v3, "validateClass:", CFSTR("Music.LibrarySongsViewController"));
  objc_msgSend(v3, "validateClass:", CFSTR("Music.LibraryTVShowsMoviesViewController"));
  objc_msgSend(v3, "validateClass:", CFSTR("Music.LibraryTVEpisodesViewController"));
  objc_msgSend(v3, "validateClass:", CFSTR("Music.LibraryDownloadingViewController"));
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("UIViewController"), CFSTR("navigationItem"), "@", 0);

}

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)UIViewControllerAccessibility__Music__UIKit;
  -[UIViewControllerAccessibility__Music__UIKit viewDidLoad](&v5, sel_viewDidLoad);
  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObserver:selector:name:object:", self, sel_didChangeVoiceOverOrSwitchControlStatus_, *MEMORY[0x24BDF7458], 0);

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addObserver:selector:name:object:", self, sel_didChangeVoiceOverOrSwitchControlStatus_, *MEMORY[0x24BDF7380], 0);

  -[UIViewControllerAccessibility__Music__UIKit didChangeVoiceOverOrSwitchControlStatus:](self, "didChangeVoiceOverOrSwitchControlStatus:", 0);
  if (-[UIViewControllerAccessibility__Music__UIKit _axIsViewControllerInLibrary](self, "_axIsViewControllerInLibrary"))
    UIAccessibilityPostNotification(*MEMORY[0x24BDF7328], 0);
}

- (void)didChangeVoiceOverOrSwitchControlStatus:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  _BOOL8 v7;

  v4 = a3;
  objc_opt_class();
  -[UIViewControllerAccessibility__Music__UIKit safeValueForKey:](self, "safeValueForKey:", CFSTR("navigationItem"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilityCastAsClass();
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = !UIAccessibilityIsVoiceOverRunning() && !UIAccessibilityIsSwitchControlRunning();
  objc_msgSend(v6, "setHidesSearchBarWhenScrolling:", v7);

}

- (BOOL)_axIsViewControllerInLibrary
{
  char isKindOfClass;

  MEMORY[0x234917228](CFSTR("Music.LibraryAlbumsViewController"), a2);
  if ((objc_opt_isKindOfClass() & 1) != 0)
    goto LABEL_13;
  MEMORY[0x234917228](CFSTR("Music.LibraryArtistsListViewController"));
  if ((objc_opt_isKindOfClass() & 1) != 0)
    goto LABEL_13;
  MEMORY[0x234917228](CFSTR("Music.LibraryArtistDetailViewController"));
  if ((objc_opt_isKindOfClass() & 1) != 0)
    goto LABEL_13;
  MEMORY[0x234917228](CFSTR("Music.LibraryGenresViewController"));
  if ((objc_opt_isKindOfClass() & 1) != 0)
    goto LABEL_13;
  MEMORY[0x234917228](CFSTR("Music.LibraryComposersViewController"));
  if ((objc_opt_isKindOfClass() & 1) != 0
    || (MEMORY[0x234917228](CFSTR("Music.LibraryPlaylistsViewController")), (objc_opt_isKindOfClass() & 1) != 0)
    || (MEMORY[0x234917228](CFSTR("Music.LibraryMusicVideosViewController")), (objc_opt_isKindOfClass() & 1) != 0)
    || (MEMORY[0x234917228](CFSTR("Music.LibraryMainViewController")), (objc_opt_isKindOfClass() & 1) != 0)
    || (MEMORY[0x234917228](CFSTR("Music.LibraryRecentlyAddedViewController")), (objc_opt_isKindOfClass() & 1) != 0)
    || (MEMORY[0x234917228](CFSTR("Music.LibrarySongsViewController")), (objc_opt_isKindOfClass() & 1) != 0)
    || (MEMORY[0x234917228](CFSTR("Music.LibraryTVShowsMoviesViewController")), (objc_opt_isKindOfClass() & 1) != 0)
    || (MEMORY[0x234917228](CFSTR("Music.LibraryTVEpisodesViewController")), (objc_opt_isKindOfClass() & 1) != 0))
  {
LABEL_13:
    isKindOfClass = 1;
  }
  else
  {
    MEMORY[0x234917228](CFSTR("Music.LibraryDownloadingViewController"));
    isKindOfClass = objc_opt_isKindOfClass();
  }
  return isKindOfClass & 1;
}

@end
