@implementation LUIClassUserGridViewController

- (LUIClassUserGridViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  LUIClassUserGridViewController *v4;
  LUIClassUserGridViewController *v5;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)LUIClassUserGridViewController;
  v4 = -[LUIUserGridViewController initWithNibName:bundle:](&v8, "initWithNibName:bundle:", a3, a4);
  v5 = v4;
  if (v4)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[LUIClassUserGridViewController view](v4, "view"));
    objc_msgSend(v6, "setAccessibilityIdentifier:", CFSTR("LUIClassUserGridView"));

  }
  return v5;
}

- (int64_t)imageTypeForBottomLeftVibrantButton
{
  return 1;
}

- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)LUIClassUserGridViewController;
  v5 = -[LUIUserGridViewController collectionView:cellForItemAtIndexPath:](&v9, "collectionView:cellForItemAtIndexPath:", a3, a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[LUIClassUserGridViewController classID](self, "classID"));
  objc_msgSend(v6, "setClassID:", v7);

  objc_msgSend(v6, "setEnableEnglishLocaleNaming:", -[LUIClassUserGridViewController enableEnglishLocaleNaming](self, "enableEnglishLocaleNaming"));
  return v6;
}

- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  unsigned __int8 v12;
  objc_super v13;

  v6 = a3;
  v7 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "cellForItemAtIndexPath:", v7));
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[UMUserManager sharedManager](UMUserManager, "sharedManager"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "userInfo"));
  if (objc_msgSend(v9, "userExists:", v10))
  {

LABEL_4:
    v13.receiver = self;
    v13.super_class = (Class)LUIClassUserGridViewController;
    -[LUIUserGridViewController collectionView:didSelectItemAtIndexPath:](&v13, "collectionView:didSelectItemAtIndexPath:", v6, v7);
    goto LABEL_5;
  }
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[LUIUIUpdateSupport sharedInstance](LUIUIUpdateSupport, "sharedInstance"));
  v12 = objc_msgSend(v11, "presentUserLimitIsReachedAlertIfNeeded");

  if ((v12 & 1) == 0)
    goto LABEL_4;
LABEL_5:

}

- (NSNumber)classID
{
  return self->_classID;
}

- (void)setClassID:(id)a3
{
  objc_storeStrong((id *)&self->_classID, a3);
}

- (BOOL)enableEnglishLocaleNaming
{
  return self->_enableEnglishLocaleNaming;
}

- (void)setEnableEnglishLocaleNaming:(BOOL)a3
{
  self->_enableEnglishLocaleNaming = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_classID, 0);
}

@end
