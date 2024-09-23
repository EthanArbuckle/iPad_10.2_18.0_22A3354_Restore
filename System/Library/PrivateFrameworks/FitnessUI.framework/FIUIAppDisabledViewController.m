@implementation FIUIAppDisabledViewController

- (FIUIAppDisabledViewController)initWithAppName:(id)a3 disabledReason:(unint64_t)a4
{
  id v6;
  FIUIAppDisabledViewController *v7;
  FIUIAppDisabledViewController *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  const __CFString *v12;
  void *v13;
  uint64_t active;
  int v15;
  void *v16;
  void *v17;
  const __CFString *v18;
  const __CFString *v19;
  void *v20;
  id v21;
  double v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  FIUITextView *v30;
  uint64_t v31;
  FIUITextView *textView;
  void *v33;
  void *v35;
  id v36;
  objc_super v37;
  _QWORD v38[3];
  _QWORD v39[4];

  v39[3] = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v37.receiver = self;
  v37.super_class = (Class)FIUIAppDisabledViewController;
  v7 = -[FIUIAppDisabledViewController init](&v37, sel_init);
  v8 = v7;
  if (v7)
  {
    v9 = -[FIUIAppDisabledViewController setTitle:](v7, "setTitle:", v6);
    if (a4 == 1)
    {
      FIUIBundle(v9);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = v10;
      v12 = CFSTR("HEART_RATE_DISABLED_TITLE");
    }
    else
    {
      if (a4)
      {
        v13 = 0;
LABEL_8:
        active = FIIsActivePairedDeviceSatellitePaired();
        v36 = v6;
        if (a4 == 1)
        {
          FIUIBundle(active);
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          v17 = v16;
          v18 = CFSTR("HEART_RATE_DISABLED_BODY");
          v19 = CFSTR("Localizable");
        }
        else
        {
          if (a4)
          {
            v20 = 0;
LABEL_16:
            objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@\n%@"), v13, v20);
            v35 = (void *)objc_claimAutoreleasedReturnValue();
            v21 = objc_alloc_init(MEMORY[0x24BEBB490]);
            objc_msgSend(v21, "setAlignment:", 1);
            LODWORD(v22) = 1057803469;
            objc_msgSend(v21, "setHyphenationFactor:", v22);
            v38[0] = *MEMORY[0x24BEBB368];
            v23 = v38[0];
            objc_msgSend(MEMORY[0x24BE01CA8], "systemGrayTextColor");
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            v39[0] = v24;
            v38[1] = *MEMORY[0x24BEBB360];
            objc_msgSend(MEMORY[0x24BEBB520], "systemFontOfSize:", 12.0);
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            v38[2] = *MEMORY[0x24BEBB3A8];
            v39[1] = v25;
            v39[2] = v21;
            objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v39, v38, 3);
            v26 = (void *)objc_claimAutoreleasedReturnValue();

            v27 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1688]), "initWithString:attributes:", v35, v26);
            objc_msgSend(MEMORY[0x24BDBCED8], "dictionaryWithDictionary:", v26);
            v28 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(MEMORY[0x24BEBD4B8], "whiteColor");
            v29 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v28, "setObject:forKey:", v29, v23);

            objc_msgSend(v27, "setAttributes:range:", v28, 0, objc_msgSend(v13, "length"));
            v30 = [FIUITextView alloc];
            v31 = -[FIUITextView initWithFrame:](v30, "initWithFrame:", *MEMORY[0x24BDBF090], *(double *)(MEMORY[0x24BDBF090] + 8), *(double *)(MEMORY[0x24BDBF090] + 16), *(double *)(MEMORY[0x24BDBF090] + 24));
            textView = v8->_textView;
            v8->_textView = (FIUITextView *)v31;

            -[FIUITextView setEditable:](v8->_textView, "setEditable:", 0);
            -[FIUITextView setSelectable:](v8->_textView, "setSelectable:", 0);
            objc_msgSend(MEMORY[0x24BEBD4B8], "blackColor");
            v33 = (void *)objc_claimAutoreleasedReturnValue();
            -[FIUITextView setBackgroundColor:](v8->_textView, "setBackgroundColor:", v33);

            -[FIUITextView setAttributedText:](v8->_textView, "setAttributedText:", v27);
            v6 = v36;
            goto LABEL_17;
          }
          v15 = active;
          FIUIBundle(active);
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          v17 = v16;
          if (v15)
          {
            v18 = CFSTR("FITNESS_TRACKING_DISABLED_BODY_TINKER");
            v19 = CFSTR("Localizable-tinker");
          }
          else
          {
            v18 = CFSTR("FITNESS_TRACKING_DISABLED_BODY");
            v19 = CFSTR("Localizable");
          }
        }
        objc_msgSend(v16, "localizedStringForKey:value:table:", v18, &stru_24CF339D8, v19);
        v20 = (void *)objc_claimAutoreleasedReturnValue();

        goto LABEL_16;
      }
      FIUIBundle(v9);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = v10;
      v12 = CFSTR("FITNESS_TRACKING_DISABLED_TITLE");
    }
    objc_msgSend(v10, "localizedStringForKey:value:table:", v12, &stru_24CF339D8, CFSTR("Localizable"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    goto LABEL_8;
  }
LABEL_17:

  return v8;
}

- (void)viewDidLoad
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)FIUIAppDisabledViewController;
  -[FIUIAppDisabledViewController viewDidLoad](&v4, sel_viewDidLoad);
  -[FIUIAppDisabledViewController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addSubview:", self->_textView);

}

- (void)viewWillLayoutSubviews
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  double v12;
  double v13;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)FIUIAppDisabledViewController;
  -[FIUIAppDisabledViewController viewWillLayoutSubviews](&v14, sel_viewWillLayoutSubviews);
  -[FIUIAppDisabledViewController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bounds");
  v5 = v4;
  v7 = v6;

  -[FIUIAppDisabledViewController view](self, "view");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "window");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "windowScene");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "statusBarManager");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "statusBarFrame");
  v13 = v12;

  -[FIUITextView setFrame:](self->_textView, "setFrame:", 0.0, v13, v5, v7 - v13);
  -[FIUITextView centerTextVerticallyWithTopOffset:](self->_textView, "centerTextVerticallyWithTopOffset:", v13 * 0.5);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_textView, 0);
}

@end
