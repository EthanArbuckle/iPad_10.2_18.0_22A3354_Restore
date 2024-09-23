@implementation BPSAboutDetailViewController

- (BPSAboutDetailViewController)init
{
  BPSAboutDetailViewController *v2;
  void *v3;
  void *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)BPSAboutDetailViewController;
  v2 = -[OBTextWelcomeController initWithTitle:](&v6, sel_initWithTitle_, &stru_24CBE59D0);
  if (v2)
  {
    v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDF6860]), "initWithBarButtonSystemItem:target:action:", 0, v2, sel_donePressed);
    -[OBBaseWelcomeController navigationItem](v2, "navigationItem");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setLeftBarButtonItem:", v3);

  }
  return v2;
}

- (BOOL)contentViewIsInAdjustedScrollView
{
  return 1;
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
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t j;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  objc_super v35;
  _BYTE v36[128];
  _BYTE v37[128];
  uint64_t v38;

  v38 = *MEMORY[0x24BDAC8D0];
  v35.receiver = self;
  v35.super_class = (Class)BPSAboutDetailViewController;
  -[OBBaseWelcomeController viewDidLoad](&v35, sel_viewDidLoad);
  -[BPSAboutDetailViewController headerView](self, "headerView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[BPSAboutDetailViewController titleString](self, "titleString");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setTitle:", v4);

  -[BPSAboutDetailViewController headerGlyph](self, "headerGlyph");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[BPSAboutDetailViewController headerView](self, "headerView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[BPSAboutDetailViewController headerGlyph](self, "headerGlyph");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setIcon:accessibilityLabel:", v7, 0);

  }
  -[BPSAboutDetailViewController headerString](self, "headerString");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    -[BPSAboutDetailViewController headerString](self, "headerString");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[OBTextWelcomeController addSectionWithHeader:content:](self, "addSectionWithHeader:content:", 0, v9);

  }
  -[BPSAboutDetailViewController bullets](self, "bullets");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    v33 = 0u;
    v34 = 0u;
    v31 = 0u;
    v32 = 0u;
    -[BPSAboutDetailViewController bullets](self, "bullets");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v31, v37, 16);
    if (v12)
    {
      v13 = v12;
      v14 = *(_QWORD *)v32;
      do
      {
        for (i = 0; i != v13; ++i)
        {
          if (*(_QWORD *)v32 != v14)
            objc_enumerationMutation(v11);
          -[OBTextWelcomeController addBulletedListItemWithTitle:description:](self, "addBulletedListItemWithTitle:description:", *(_QWORD *)(*((_QWORD *)&v31 + 1) + 8 * i), 0);
        }
        v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v31, v37, 16);
      }
      while (v13);
    }

  }
  -[BPSAboutDetailViewController paragraphs](self, "paragraphs");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (v16)
  {
    v29 = 0u;
    v30 = 0u;
    v27 = 0u;
    v28 = 0u;
    -[BPSAboutDetailViewController paragraphs](self, "paragraphs", 0);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v27, v36, 16);
    if (v18)
    {
      v19 = v18;
      v20 = *(_QWORD *)v28;
      do
      {
        for (j = 0; j != v19; ++j)
        {
          if (*(_QWORD *)v28 != v20)
            objc_enumerationMutation(v17);
          v22 = *(void **)(*((_QWORD *)&v27 + 1) + 8 * j);
          objc_msgSend(v22, "objectForKeyedSubscript:", CFSTR("heading"));
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v22, "objectForKeyedSubscript:", CFSTR("text"));
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          if (v24)
            -[OBTextWelcomeController addSectionWithHeader:content:](self, "addSectionWithHeader:content:", v23, v24);

        }
        v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v27, v36, 16);
      }
      while (v19);
    }

  }
  -[BPSAboutDetailViewController footerString](self, "footerString");
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  if (v25)
  {
    -[BPSAboutDetailViewController footerString](self, "footerString");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    -[OBTextWelcomeController addSectionWithHeader:content:](self, "addSectionWithHeader:content:", 0, v26);

  }
}

- (void)donePressed
{
  void *v3;
  id onDismiss;

  -[BPSAboutDetailViewController parentViewController](self, "parentViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "dismissViewControllerAnimated:completion:", 1, self->_onDismiss);

  onDismiss = self->_onDismiss;
  self->_onDismiss = 0;

}

- (void)presentWithController:(id)a3
{
  -[BPSAboutDetailViewController presentWithController:onDismiss:](self, "presentWithController:onDismiss:", a3, 0);
}

- (void)presentWithController:(id)a3 onDismiss:(id)a4
{
  id v6;
  void *v7;
  id onDismiss;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;

  v6 = a3;
  v7 = (void *)MEMORY[0x212BDABD0](a4);
  onDismiss = self->_onDismiss;
  self->_onDismiss = v7;

  v14 = (id)objc_msgSend(objc_alloc(MEMORY[0x24BDF6BF8]), "initWithRootViewController:", self);
  objc_msgSend(v6, "presentViewController:animated:completion:", v14, 1, 0);

  objc_msgSend(v14, "view");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDF6950], "clearColor");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setBackgroundColor:", v10);

  objc_msgSend(v14, "navigationBar");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setBarStyle:", 1);
  objc_msgSend(v11, "setTranslucent:", 1);
  BPSNavBarBackgroundPointImage();
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setBackgroundImage:forBarMetrics:", v12, 0);

  BPSSetupTintColor();
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setTintColor:", v13);

}

- (NSString)headerString
{
  return self->_headerString;
}

- (void)setHeaderString:(id)a3
{
  objc_storeStrong((id *)&self->_headerString, a3);
}

- (NSString)footerString
{
  return self->_footerString;
}

- (void)setFooterString:(id)a3
{
  objc_storeStrong((id *)&self->_footerString, a3);
}

- (NSArray)bullets
{
  return self->_bullets;
}

- (void)setBullets:(id)a3
{
  objc_storeStrong((id *)&self->_bullets, a3);
}

- (NSArray)paragraphs
{
  return self->_paragraphs;
}

- (void)setParagraphs:(id)a3
{
  objc_storeStrong((id *)&self->_paragraphs, a3);
}

- (NSString)titleString
{
  return self->_titleString;
}

- (void)setTitleString:(id)a3
{
  objc_storeStrong((id *)&self->_titleString, a3);
}

- (UIImage)headerGlyph
{
  return self->_headerGlyph;
}

- (void)setHeaderGlyph:(id)a3
{
  objc_storeStrong((id *)&self->_headerGlyph, a3);
}

- (id)onDismiss
{
  return self->_onDismiss;
}

- (void)setOnDismiss:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 1240);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_onDismiss, 0);
  objc_storeStrong((id *)&self->_headerGlyph, 0);
  objc_storeStrong((id *)&self->_titleString, 0);
  objc_storeStrong((id *)&self->_paragraphs, 0);
  objc_storeStrong((id *)&self->_bullets, 0);
  objc_storeStrong((id *)&self->_footerString, 0);
  objc_storeStrong((id *)&self->_headerString, 0);
}

@end
