@implementation _SFNavigationIntent

+ (id)safari_navigationIntentForUserActivityContainingInteraction:(uint64_t)a1
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  _QWORD v11[4];
  id v12;

  v2 = a2;
  objc_opt_self();
  objc_msgSend(v2, "interaction");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "intent");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v4, "urls");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0D4EF70], "builder");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setPrefersOpenInNewTab:", 1);
    objc_msgSend(v6, "setPreferredTabOrder:", 1);
    objc_msgSend(v6, "setPrefersRelationToSourceTab:", 0);
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __97___SFNavigationIntent_SafariExtras__safari_navigationIntentForUserActivityContainingInteraction___block_invoke;
    v11[3] = &unk_1E9CF55B8;
    v12 = v6;
    v7 = v6;
    objc_msgSend(v5, "safari_mapAndFilterObjectsUsingBlock:", v11);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "navigationIntentWithMultipleIntents:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

@end
