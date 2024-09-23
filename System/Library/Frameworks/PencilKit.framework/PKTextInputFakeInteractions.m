@implementation PKTextInputFakeInteractions

+ (id)sharedInstance
{
  if (qword_1ECEE6570 != -1)
    dispatch_once(&qword_1ECEE6570, &__block_literal_global_85);
  return (id)_MergedGlobals_155;
}

void __45__PKTextInputFakeInteractions_sharedInstance__block_invoke()
{
  PKTextInputFakeInteractions *v0;
  void *v1;

  v0 = objc_alloc_init(PKTextInputFakeInteractions);
  v1 = (void *)_MergedGlobals_155;
  _MergedGlobals_155 = (uint64_t)v0;

}

+ (void)attachFakeInteractionToViewIfNecessary:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  objc_msgSend(a1, "sharedInstance");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_attachToView:", v4);

}

- (void)_attachToView:(id)a3
{
  void *v3;
  void *v4;
  int v5;
  id v6;
  PKFakeNotesDelegate *v7;
  PKFakeVoiceMemosDelegate *v8;
  id v9;
  void *v10;
  void *v11;
  char v12;
  PKFakeCalendarLocationDelegate *v13;
  void *v14;
  PKFakeCalendarLocationDelegate *v15;
  PKFakeNotesDelegate *v16;
  PKScribbleInteraction *v17;
  void *v18;
  id v19;

  v19 = a3;
  objc_msgSend(v19, "fakeScribbleInteractionDelegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3 && (PKHasScribbleInteractionInView(v19) & 1) == 0)
  {
    +[PKTextInputSettings sharedSettings](PKTextInputSettings, "sharedSettings");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "enableTargetedAppWorkarounds");

    if (v5)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v6 = v19;
        if ((objc_msgSend(v6, "isStylusDrawingEnabled") & 1) != 0)
        {
          v7 = -[PKFakeNotesDelegate initWithTextView:]([PKFakeNotesDelegate alloc], "initWithTextView:", v6);

          if (v7)
          {
LABEL_21:
            v16 = 0;
            goto LABEL_24;
          }
        }
        else
        {

        }
      }
      if (NSClassFromString(CFSTR("RCTextField")))
      {
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v8 = -[PKFakeVoiceMemosDelegate initWithView:]([PKFakeVoiceMemosDelegate alloc], "initWithView:", v19);
          if (v8)
          {
LABEL_20:
            v7 = (PKFakeNotesDelegate *)v8;
            goto LABEL_21;
          }
        }
      }
      if (NSClassFromString(CFSTR("EKUITableViewCell")) && (objc_opt_isKindOfClass() & 1) != 0)
      {
        v9 = v19;
        objc_msgSend(v9, "textLabel");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "text");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = objc_msgSend(v11, "isEqualToString:", CFSTR("Location"));

        if ((v12 & 1) != 0)
        {
          v13 = [PKFakeCalendarLocationDelegate alloc];
          objc_msgSend(v9, "window");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          v15 = -[PKFakeCalendarLocationDelegate initWithCell:window:](v13, "initWithCell:window:", v9, v14);

          v7 = v15;
          v16 = v7;
          if (v7)
          {
LABEL_24:
            objc_msgSend(v19, "setFakeScribbleInteractionDelegate:", v7);
            v17 = objc_alloc_init(PKScribbleInteraction);
            objc_msgSend(v19, "fakeScribbleInteractionDelegate");
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            -[PKScribbleInteraction setDelegate:](v17, "setDelegate:", v18);

            -[PKScribbleInteraction setElementSource:](v17, "setElementSource:", v16);
            objc_msgSend(v19, "addInteraction:", v17);

            goto LABEL_25;
          }
        }
        else
        {

        }
      }
    }
    if (+[PKFakeDisableDelegate _shouldAttachForView:](PKFakeDisableDelegate, "_shouldAttachForView:", v19))
    {
      v8 = objc_alloc_init(PKFakeDisableDelegate);
      if (v8)
        goto LABEL_20;
    }
    if (+[PKFakeTapToFocusDelegate _shouldAttachForView:](PKFakeTapToFocusDelegate, "_shouldAttachForView:", v19))
    {
      v7 = -[PKFakeTapToFocusDelegate initWithView:]([PKFakeTapToFocusDelegate alloc], "initWithView:", v19);
      v16 = v7;
      if (v7)
        goto LABEL_24;
    }
  }
LABEL_25:

}

@end
