@implementation DSReadOnlyResourceSharingDetailController

+ (void)initialize
{
  os_log_t v2;
  void *v3;

  if ((id)objc_opt_class() == a1)
  {
    v2 = os_log_create("com.apple.DigitalSeparation", "DSReadOnlyResourceSharingDetail");
    v3 = (void *)DSLogReadOnlySharingDetail;
    DSLogReadOnlySharingDetail = (uint64_t)v2;

  }
}

+ (id)initWithSharingTypes:(id)a3 startingViewController:(id)a4 delegate:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  DSReadOnlyResourceSharingDetailController *v12;
  void *v13;
  void *v14;
  void *v15;
  DSReadOnlyResourceSharingDetailController *v16;
  void *v17;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  objc_msgSend(v10, "firstObject");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = [DSReadOnlyResourceSharingDetailController alloc];
  objc_msgSend(v11, "displayName");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "localizedDetailText");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "iconForDetail");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = -[DSTableWelcomeController initWithTitle:detailText:icon:shouldShowSearchBar:](v12, "initWithTitle:detailText:icon:shouldShowSearchBar:", v13, v14, v15, 0);

  objc_msgSend(a1, "_removeDisplayedFromArray:", v10);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  -[DSReadOnlyResourceSharingDetailController setRemainingSharingTypes:](v16, "setRemainingSharingTypes:", v17);
  -[DSReadOnlyResourceSharingDetailController setSharingType:](v16, "setSharingType:", v11);
  -[DSReadOnlyResourceSharingDetailController setStartingViewController:](v16, "setStartingViewController:", v9);

  -[DSReadOnlyResourceSharingDetailController setDetailDelegate:](v16, "setDetailDelegate:", v8);
  return v16;
}

+ (id)initWithSharingPeople:(id)a3 startingViewController:(id)a4 delegate:(id)a5
{
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  DSReadOnlyResourceSharingDetailController *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  DSReadOnlyResourceSharingDetailController *v19;
  void *v20;

  v7 = a5;
  v8 = a4;
  v9 = a3;
  objc_msgSend(v9, "firstObject");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  DSUILocStringForKey(CFSTR("READ_ONLY_SHARING_BY_PERSON_DETAIL_FORMAT"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  +[DSUIUtilities valueForUnfinalizedString:](DSUIUtilities, "valueForUnfinalizedString:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = [DSReadOnlyResourceSharingDetailController alloc];
  objc_msgSend(v10, "displayName");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = (void *)MEMORY[0x24BDD17C8];
  objc_msgSend(v10, "displayGivenName");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "stringWithFormat:", v12, v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "iconForDetail");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = -[DSTableWelcomeController initWithTitle:detailText:icon:shouldShowSearchBar:](v13, "initWithTitle:detailText:icon:shouldShowSearchBar:", v14, v17, v18, 0);

  objc_msgSend(a1, "_removeDisplayedFromArray:", v9);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  -[DSReadOnlyResourceSharingDetailController setRemainingSharingPeople:](v19, "setRemainingSharingPeople:", v20);
  -[DSReadOnlyResourceSharingDetailController setSharingPerson:](v19, "setSharingPerson:", v10);
  -[DSReadOnlyResourceSharingDetailController setStartingViewController:](v19, "setStartingViewController:", v8);

  -[DSReadOnlyResourceSharingDetailController setDetailDelegate:](v19, "setDetailDelegate:", v7);
  return v19;
}

+ (id)_removeDisplayedFromArray:(id)a3
{
  id v3;
  void *v4;

  v3 = a3;
  if (objc_msgSend(v3, "count") == 1)
  {
    v4 = 0;
  }
  else
  {
    objc_msgSend(v3, "subarrayWithRange:", 1, objc_msgSend(v3, "count") - 1);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v4;
}

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  char *v12;
  void *v13;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)DSReadOnlyResourceSharingDetailController;
  -[DSTableWelcomeController viewDidLoad](&v14, sel_viewDidLoad);
  -[DSReadOnlyResourceSharingDetailController remainingSharingTypes](self, "remainingSharingTypes");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {

    goto LABEL_4;
  }
  -[DSReadOnlyResourceSharingDetailController remainingSharingPeople](self, "remainingSharingPeople");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
LABEL_4:
    DSUILocStringForKey(CFSTR("CONTINUE"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    +[DSUIUtilities setUpBoldButtonForController:title:target:selector:](DSUIUtilities, "setUpBoldButtonForController:title:target:selector:", self, v5, self, sel__pushNextPane);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[DSTableWelcomeController setBoldButton:](self, "setBoldButton:", v6);

    DSUILocStringForKey(CFSTR("SKIP"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    +[DSUIUtilities setUpLinkButtonForController:title:target:selector:](DSUIUtilities, "setUpLinkButtonForController:title:target:selector:", self, v7, self, sel__finishReviewingReadOnlySharing);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[DSTableWelcomeController setLinkButton:](self, "setLinkButton:", v8);

    -[DSReadOnlyResourceSharingDetailController sharingType](self, "sharingType");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9)
      v10 = +[DSUIUtilities setUpLearnMoreButtonForController:selector:](DSUIUtilities, "setUpLearnMoreButtonForController:selector:", self, sel__learnMorePressed);
    return;
  }
  if (-[DSReadOnlyResourceSharingDetailController isFinishedReviewing](self, "isFinishedReviewing"))
  {
    DSUILocStringForKey(CFSTR("CONTINUE"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = sel__pushNextPane;
  }
  else
  {
    DSUILocStringForKey(CFSTR("SKIP"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = sel__removeFromView;
  }
  +[DSUIUtilities setUpBoldButtonForController:title:target:selector:](DSUIUtilities, "setUpBoldButtonForController:title:target:selector:", self, v11, self, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[DSTableWelcomeController setBoldButton:](self, "setBoldButton:", v13);

}

- (void)_pushNextPane
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  id v15;
  uint8_t buf[16];

  -[DSReadOnlyResourceSharingDetailController remainingSharingTypes](self, "remainingSharingTypes");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[DSReadOnlyResourceSharingDetailController remainingSharingTypes](self, "remainingSharingTypes");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[DSReadOnlyResourceSharingDetailController startingViewController](self, "startingViewController");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[DSReadOnlyResourceSharingDetailController detailDelegate](self, "detailDelegate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    +[DSReadOnlyResourceSharingDetailController initWithSharingTypes:startingViewController:delegate:](DSReadOnlyResourceSharingDetailController, "initWithSharingTypes:startingViewController:delegate:", v4, v5, v6);
    v15 = (id)objc_claimAutoreleasedReturnValue();

    -[DSReadOnlyResourceSharingDetailController remainingSharingTypes](self, "remainingSharingTypes");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_5:
    v12 = v7;
    objc_msgSend(v15, "setIsFinishedReviewing:", objc_msgSend(v7, "count") == 1);

    -[DSReadOnlyResourceSharingDetailController navigationController](self, "navigationController");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "pushViewController:animated:", v15, 1);

    return;
  }
  -[DSReadOnlyResourceSharingDetailController remainingSharingPeople](self, "remainingSharingPeople");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    -[DSReadOnlyResourceSharingDetailController remainingSharingPeople](self, "remainingSharingPeople");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[DSReadOnlyResourceSharingDetailController startingViewController](self, "startingViewController");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[DSReadOnlyResourceSharingDetailController detailDelegate](self, "detailDelegate");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    +[DSReadOnlyResourceSharingDetailController initWithSharingPeople:startingViewController:delegate:](DSReadOnlyResourceSharingDetailController, "initWithSharingPeople:startingViewController:delegate:", v9, v10, v11);
    v15 = (id)objc_claimAutoreleasedReturnValue();

    -[DSReadOnlyResourceSharingDetailController remainingSharingPeople](self, "remainingSharingPeople");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_5;
  }
  v14 = DSLogReadOnlySharingDetail;
  if (os_log_type_enabled((os_log_t)DSLogReadOnlySharingDetail, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_2278DF000, v14, OS_LOG_TYPE_INFO, "No more read only sharing types to display, returning", buf, 2u);
  }
  -[DSReadOnlyResourceSharingDetailController _finishReviewingReadOnlySharing](self, "_finishReviewingReadOnlySharing");
}

- (void)_removeFromView
{
  id v2;
  id v3;

  -[DSReadOnlyResourceSharingDetailController navigationController](self, "navigationController");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  v2 = (id)objc_msgSend(v3, "popViewControllerAnimated:", 1);

}

- (void)_finishReviewingReadOnlySharing
{
  id v2;

  -[DSReadOnlyResourceSharingDetailController detailDelegate](self, "detailDelegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "reviewReadOnlySharingCompleted");

}

- (void)_learnMorePressed
{
  void *v3;
  void *v4;
  id v5;

  -[DSReadOnlyResourceSharingDetailController sharingType](self, "sharingType");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[DSReadOnlyResourceSharingDetailController detailDelegate](self, "detailDelegate");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    -[DSReadOnlyResourceSharingDetailController sharingType](self, "sharingType");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "learnMorePressedForSharingType:", v4);

  }
}

- (int64_t)tableView:(id)a3 editingStyleForRowAtIndexPath:(id)a4
{
  return 0;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  NSObject *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;

  v5 = a4;
  -[DSReadOnlyResourceSharingDetailController sharingType](self, "sharingType");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {

LABEL_4:
    -[DSReadOnlyResourceSharingDetailController sharingType](self, "sharingType");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
    {
      -[DSReadOnlyResourceSharingDetailController sharingType](self, "sharingType");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "allPeople");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "objectAtIndex:", objc_msgSend(v5, "row"));
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      v12 = (void *)MEMORY[0x24BE2CC80];
      -[DSReadOnlyResourceSharingDetailController sharingType](self, "sharingType");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "source");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "name");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "sourceDescriptorForSource:", v15);
      v16 = (void *)objc_claimAutoreleasedReturnValue();

      -[OBTableWelcomeController tableView](self, "tableView");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "displayName");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "localizedStopByPerson:", v11);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "iconForTable");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      +[DSIconTableViewCell iconTableViewCellFromTableView:withText:detail:icon:](DSIconTableViewCell, "iconTableViewCellFromTableView:withText:detail:icon:", v17, v18, v19, v20);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      -[DSReadOnlyResourceSharingDetailController sharingPerson](self, "sharingPerson");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "allSources");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "objectAtIndex:", objc_msgSend(v5, "row"));
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      v24 = (void *)MEMORY[0x24BE2CC80];
      objc_msgSend(v11, "name");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "sourceDescriptorForSource:", v25);
      v16 = (void *)objc_claimAutoreleasedReturnValue();

      -[OBTableWelcomeController tableView](self, "tableView");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "localizedName");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      -[DSReadOnlyResourceSharingDetailController sharingPerson](self, "sharingPerson");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "localizedStopByPerson:", v19);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "iconForTable");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      +[DSIconTableViewCell iconTableViewCellFromTableView:withText:detail:icon:](DSIconTableViewCell, "iconTableViewCellFromTableView:withText:detail:icon:", v17, v18, v20, v26);
      v21 = (void *)objc_claimAutoreleasedReturnValue();

    }
    objc_msgSend(v21, "setAccessoryType:", 0);
    objc_msgSend(v21, "setSelectionStyle:", 0);
    goto LABEL_8;
  }
  -[DSReadOnlyResourceSharingDetailController sharingPerson](self, "sharingPerson");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
    goto LABEL_4;
  v28 = DSLogReadOnlySharingDetail;
  if (os_log_type_enabled((os_log_t)DSLogReadOnlySharingDetail, OS_LOG_TYPE_FAULT))
    -[DSReadOnlyResourceSharingDetailController tableView:cellForRowAtIndexPath:].cold.1(v28, v29, v30, v31, v32, v33, v34, v35);
  v21 = 0;
LABEL_8:

  return v21;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  int64_t v10;
  NSObject *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;

  -[DSReadOnlyResourceSharingDetailController sharingType](self, "sharingType", a3, a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[DSReadOnlyResourceSharingDetailController sharingType](self, "sharingType");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "allPeople");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_5:
    v9 = v7;
    v10 = objc_msgSend(v7, "count");

    return v10;
  }
  -[DSReadOnlyResourceSharingDetailController sharingPerson](self, "sharingPerson");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    -[DSReadOnlyResourceSharingDetailController sharingPerson](self, "sharingPerson");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "allSources");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_5;
  }
  v12 = DSLogReadOnlySharingDetail;
  if (os_log_type_enabled((os_log_t)DSLogReadOnlySharingDetail, OS_LOG_TYPE_FAULT))
    -[DSReadOnlyResourceSharingDetailController tableView:cellForRowAtIndexPath:].cold.1(v12, v13, v14, v15, v16, v17, v18, v19);
  return 0;
}

- (DSNavigationDelegate)delegate
{
  return (DSNavigationDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (DSSharingType)sharingType
{
  return self->_sharingType;
}

- (void)setSharingType:(id)a3
{
  objc_storeStrong((id *)&self->_sharingType, a3);
}

- (DSSharingPerson)sharingPerson
{
  return self->_sharingPerson;
}

- (void)setSharingPerson:(id)a3
{
  objc_storeStrong((id *)&self->_sharingPerson, a3);
}

- (DSReadOnlyResourceSharingDetailDelegate)detailDelegate
{
  return self->_detailDelegate;
}

- (void)setDetailDelegate:(id)a3
{
  objc_storeStrong((id *)&self->_detailDelegate, a3);
}

- (NSArray)remainingSharingTypes
{
  return self->_remainingSharingTypes;
}

- (void)setRemainingSharingTypes:(id)a3
{
  objc_storeStrong((id *)&self->_remainingSharingTypes, a3);
}

- (NSArray)remainingSharingPeople
{
  return self->_remainingSharingPeople;
}

- (void)setRemainingSharingPeople:(id)a3
{
  objc_storeStrong((id *)&self->_remainingSharingPeople, a3);
}

- (UIViewController)startingViewController
{
  return self->_startingViewController;
}

- (void)setStartingViewController:(id)a3
{
  objc_storeStrong((id *)&self->_startingViewController, a3);
}

- (BOOL)isFinishedReviewing
{
  return self->_isFinishedReviewing;
}

- (void)setIsFinishedReviewing:(BOOL)a3
{
  self->_isFinishedReviewing = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_startingViewController, 0);
  objc_storeStrong((id *)&self->_remainingSharingPeople, 0);
  objc_storeStrong((id *)&self->_remainingSharingTypes, 0);
  objc_storeStrong((id *)&self->_detailDelegate, 0);
  objc_storeStrong((id *)&self->_sharingPerson, 0);
  objc_storeStrong((id *)&self->_sharingType, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

- (void)tableView:(uint64_t)a3 cellForRowAtIndexPath:(uint64_t)a4 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_3(&dword_2278DF000, a1, a3, "Detail controller had neither a sharing type nor a sharing person - this should never happen", a5, a6, a7, a8, 0);
}

@end
