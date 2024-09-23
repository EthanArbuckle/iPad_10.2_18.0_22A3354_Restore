@implementation APUIActionCardUtils

+ (id)cardSectionForATXAction:(id)a3 withConfig:(id)a4
{
  id v6;
  id v7;
  _APUIActionCardInfo *v8;
  void *v9;

  v6 = a4;
  v7 = a3;
  v8 = objc_alloc_init(_APUIActionCardInfo);
  objc_msgSend(a1, "_configureCardInfo:forATXAction:withConfig:", v8, v7, v6);

  objc_msgSend(a1, "_generateCardSectionWithInfo:config:", v8, v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

+ (id)cardSectionForNSUserActivity:(id)a3 withConfig:(id)a4
{
  id v6;
  id v7;
  _APUIActionCardInfo *v8;
  void *v9;

  v6 = a4;
  v7 = a3;
  v8 = objc_alloc_init(_APUIActionCardInfo);
  objc_msgSend(a1, "_configureCardInfo:forNSUserActivity:withConfig:", v8, v7, v6);

  objc_msgSend(a1, "_generateCardSectionWithInfo:config:", v8, v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

+ (id)cardSectionForUAUserActivityProxy:(id)a3 withConfig:(id)a4
{
  id v6;
  id v7;
  _APUIActionCardInfo *v8;
  void *v9;

  v6 = a4;
  v7 = a3;
  v8 = objc_alloc_init(_APUIActionCardInfo);
  objc_msgSend(a1, "_configureCardInfo:forUAUserActivityProxy:withConfig:", v8, v7, v6);

  objc_msgSend(a1, "_generateCardSectionWithInfo:config:", v8, v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

+ (id)cardSectionForNSString:(id)a3 withConfig:(id)a4
{
  id v6;
  id v7;
  _APUIActionCardInfo *v8;
  void *v9;

  v6 = a4;
  v7 = a3;
  v8 = objc_alloc_init(_APUIActionCardInfo);
  objc_msgSend(a1, "_configureCardInfo:forNSString:withConfig:", v8, v7, v6);

  objc_msgSend(a1, "_generateCardSectionWithInfo:config:", v8, v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

+ (id)cardSectionForINInteraction:(id)a3 withConfig:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  int v10;
  void *v11;
  void *v12;
  _APUIActionCardInfo *v13;
  _APUIActionCardInfo *v14;
  void *v15;
  void *v16;

  v6 = a3;
  v7 = a4;
  objc_msgSend(v6, "intentResponse");
  v8 = objc_claimAutoreleasedReturnValue();
  if (!v8)
    goto LABEL_6;
  v9 = (void *)v8;
  v10 = objc_msgSend(v7, "fallbackToCustomResponseString");

  if (!v10)
    goto LABEL_6;
  objc_msgSend(v6, "intentResponse");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)objc_opt_new();
  objc_msgSend(v11, "_renderedResponseWithLocalizer:requiresSiriCompatibility:", v12, 0);
  v13 = (_APUIActionCardInfo *)objc_claimAutoreleasedReturnValue();

  if (!-[_APUIActionCardInfo length](v13, "length"))
  {

LABEL_6:
    v13 = objc_alloc_init(_APUIActionCardInfo);
    objc_msgSend(v6, "intent");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "_configureCardInfo:forINIntent:withConfig:", v13, v16, v7);

    objc_msgSend(a1, "_generateCardSectionWithInfo:config:", v13, v7);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_7;
  }
  v14 = objc_alloc_init(_APUIActionCardInfo);
  objc_msgSend(a1, "_configureCardInfo:forNSString:withConfig:", v14, v13, v7);
  objc_msgSend(a1, "_generateCardSectionWithInfo:config:", v14, v7);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_7:
  return v15;
}

+ (id)cardSectionForINIntent:(id)a3 withConfig:(id)a4
{
  id v6;
  id v7;
  _APUIActionCardInfo *v8;
  void *v9;

  v6 = a4;
  v7 = a3;
  v8 = objc_alloc_init(_APUIActionCardInfo);
  objc_msgSend(a1, "_configureCardInfo:forINIntent:withConfig:", v8, v7, v6);

  objc_msgSend(a1, "_generateCardSectionWithInfo:config:", v8, v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

+ (id)cardSectionForVoiceShortcutWithPhrase:(id)a3 name:(id)a4 description:(id)a5 applicationBundleIdentifier:(id)a6 config:(id)a7
{
  return (id)objc_msgSend(a1, "cardSectionForVoiceShortcutWithPhrase:name:description:keyImage:applicationBundleIdentifier:config:", a3, a4, a5, 0, a6, a7);
}

+ (id)cardSectionForVoiceShortcutWithPhrase:(id)a3 name:(id)a4 description:(id)a5 keyImage:(id)a6 applicationBundleIdentifier:(id)a7 config:(id)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  _APUIActionCardInfo *v20;
  void *v21;

  v14 = a8;
  v15 = a7;
  v16 = a6;
  v17 = a5;
  v18 = a4;
  v19 = a3;
  v20 = objc_alloc_init(_APUIActionCardInfo);
  objc_msgSend(a1, "_configureCardInfo:forVoiceShortcutWithPhrase:name:description:keyImage:applicationBundleIdentifier:config:", v20, v19, v18, v17, v16, v15, v14);

  objc_msgSend(a1, "_generateCardSectionWithInfo:config:", v20, v14);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  return v21;
}

+ (id)cardSectionForHeroApp:(id)a3 withConfig:(id)a4
{
  id v6;
  id v7;
  _APUIActionCardInfo *v8;
  void *v9;

  v6 = a4;
  v7 = a3;
  v8 = objc_alloc_init(_APUIActionCardInfo);
  objc_msgSend(a1, "_configureCardInfo:forHeroApp:withConfig:", v8, v7, v6);

  objc_msgSend(a1, "_generateCardSectionWithInfo:config:", v8, v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

+ (id)cardForCardSection:(id)a3
{
  objc_class *v3;
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x24BDAC8D0];
  v3 = (objc_class *)MEMORY[0x24BE84D80];
  v4 = a3;
  v5 = objc_alloc_init(v3);
  objc_msgSend(MEMORY[0x24BDD1880], "UUID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "UUIDString");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setCardId:", v7);

  v10[0] = v4;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v10, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "setCardSections:", v8);
  return v5;
}

+ (id)cardViewForATXAction:(id)a3 withConfig:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  void *v10;

  v6 = a3;
  v7 = a4;
  if (objc_msgSend(v6, "actionType") == 1)
  {
    objc_msgSend(v6, "userActivity");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "cardViewForNSUserActivity:withConfig:", v8, v7);
    v9 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (objc_msgSend(v6, "actionType") == 5)
    {
      objc_msgSend(v6, "userActivityProxy");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(a1, "cardViewForUAUserActivityProxy:withConfig:", v8, v7);
    }
    else
    {
      objc_msgSend(v6, "intent");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(a1, "cardViewForINIntent:withConfig:", v8, v7);
    }
    v9 = objc_claimAutoreleasedReturnValue();
  }
  v10 = (void *)v9;

  return v10;
}

+ (id)cardViewForNSUserActivity:(id)a3 withConfig:(id)a4
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a1, "cardSectionForNSUserActivity:withConfig:", a3, a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)MEMORY[0x24BE85210];
  v10[0] = v4;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v10, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "viewsForCardSections:feedbackListener:", v6, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v7, "count"))
  {
    objc_msgSend(v7, "objectAtIndexedSubscript:", 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

+ (id)cardViewForUAUserActivityProxy:(id)a3 withConfig:(id)a4
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a1, "cardSectionForUAUserActivityProxy:withConfig:", a3, a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)MEMORY[0x24BE85210];
  v10[0] = v4;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v10, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "viewsForCardSections:feedbackListener:", v6, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v7, "count"))
  {
    objc_msgSend(v7, "objectAtIndexedSubscript:", 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

+ (id)cardViewForINInteraction:(id)a3 withConfig:(id)a4
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a1, "cardSectionForINInteraction:withConfig:", a3, a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)MEMORY[0x24BE85210];
  v10[0] = v4;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v10, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "viewsForCardSections:feedbackListener:", v6, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v7, "count"))
  {
    objc_msgSend(v7, "objectAtIndexedSubscript:", 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

+ (id)cardViewForINIntent:(id)a3 withConfig:(id)a4
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a1, "cardSectionForINIntent:withConfig:", a3, a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)MEMORY[0x24BE85210];
  v10[0] = v4;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v10, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "viewsForCardSections:feedbackListener:", v6, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v7, "count"))
  {
    objc_msgSend(v7, "objectAtIndexedSubscript:", 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

+ (id)cardViewForVoiceShortcutWithPhrase:(id)a3 name:(id)a4 description:(id)a5 applicationBundleIdentifier:(id)a6 config:(id)a7
{
  return (id)objc_msgSend(a1, "cardViewForVoiceShortcutWithPhrase:name:description:keyImage:applicationBundleIdentifier:config:", a3, a4, a5, 0, a6, a7);
}

+ (id)cardViewForVoiceShortcutWithPhrase:(id)a3 name:(id)a4 description:(id)a5 keyImage:(id)a6 applicationBundleIdentifier:(id)a7 config:(id)a8
{
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  _QWORD v14[2];

  v14[1] = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a1, "cardSectionForVoiceShortcutWithPhrase:name:description:keyImage:applicationBundleIdentifier:config:", a3, a4, a5, a6, a7, a8);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)MEMORY[0x24BE85210];
  v14[0] = v8;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v14, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "viewsForCardSections:feedbackListener:", v10, 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v11, "count"))
  {
    objc_msgSend(v11, "objectAtIndexedSubscript:", 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v12 = 0;
  }

  return v12;
}

+ (id)cardViewForHeroApp:(id)a3 withConfig:(id)a4
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a1, "cardSectionForHeroApp:withConfig:", a3, a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)MEMORY[0x24BE85210];
  v10[0] = v4;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v10, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "viewsForCardSections:feedbackListener:", v6, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v7, "count"))
  {
    objc_msgSend(v7, "objectAtIndexedSubscript:", 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

+ (BOOL)updateCardView:(id)a3 forINIntent:(id)a4 withConfig:(id)a5
{
  id v8;
  void *v9;

  v8 = a3;
  objc_msgSend(a1, "cardSectionForINIntent:withConfig:", a4, a5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(a4) = objc_msgSend(MEMORY[0x24BE85210], "updateCardSectionView:withCardSection:", v8, v9);

  return (char)a4;
}

+ (BOOL)updateCardView:(id)a3 forINInteraction:(id)a4 withConfig:(id)a5
{
  id v8;
  void *v9;

  v8 = a3;
  objc_msgSend(a1, "cardSectionForINInteraction:withConfig:", a4, a5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(a4) = objc_msgSend(MEMORY[0x24BE85210], "updateCardSectionView:withCardSection:", v8, v9);

  return (char)a4;
}

+ (BOOL)updateCardView:(id)a3 forNSUserActivity:(id)a4 withConfig:(id)a5
{
  id v8;
  void *v9;

  v8 = a3;
  objc_msgSend(a1, "cardSectionForNSUserActivity:withConfig:", a4, a5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(a4) = objc_msgSend(MEMORY[0x24BE85210], "updateCardSectionView:withCardSection:", v8, v9);

  return (char)a4;
}

+ (BOOL)updateCardView:(id)a3 forUAUserActivityProxy:(id)a4 withConfig:(id)a5
{
  id v8;
  void *v9;

  v8 = a3;
  objc_msgSend(a1, "cardSectionForUAUserActivityProxy:withConfig:", a4, a5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(a4) = objc_msgSend(MEMORY[0x24BE85210], "updateCardSectionView:withCardSection:", v8, v9);

  return (char)a4;
}

+ (id)cardViewReuseIdentifier
{
  if (cardViewReuseIdentifier_onceToken != -1)
    dispatch_once(&cardViewReuseIdentifier_onceToken, &__block_literal_global_1);
  return (id)cardViewReuseIdentifier_reuseIdentifier;
}

void __46__APUIActionCardUtils_cardViewReuseIdentifier__block_invoke()
{
  uint64_t v0;
  void *v1;
  id v2;

  v2 = objc_alloc_init(MEMORY[0x24BE84E08]);
  objc_msgSend(MEMORY[0x24BE85210], "reuseIdentifierForCardSection:", v2);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)cardViewReuseIdentifier_reuseIdentifier;
  cardViewReuseIdentifier_reuseIdentifier = v0;

}

+ (unint64_t)_searchUIStyleForAPUIStyle:(unint64_t)a3
{
  return 2 * (a3 == 2);
}

+ (id)_generateCardSectionWithInfo:(id)a3 config:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  int v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  int v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  uint64_t v43;
  void *v44;
  void *v45;
  uint64_t v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  uint64_t v52;
  void *v53;
  id v54;
  void *v55;
  void *v56;
  void *v57;
  int v58;
  uint64_t v59;
  void *v60;
  void *v61;
  void *v62;
  uint64_t v63;
  void *v64;
  void *v65;
  void *v66;
  uint64_t v67;
  void *v68;
  int v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  void *v75;
  _QWORD v76[2];

  v76[1] = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = a4;
  objc_msgSend(v6, "bundleId");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  ATXBundleIdReplacementForBundleId();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setBundleId:", v8);

  objc_msgSend(v5, "bundleId");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "length");

  if (!v10)
  {
    objc_msgSend(v6, "bundleId");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setBundleId:", v11);

  }
  objc_msgSend(v5, "bundleId");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    objc_msgSend(v5, "appTitle");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "length");

    if (v14)
    {
      v12 = 0;
    }
    else
    {
      v15 = objc_alloc(MEMORY[0x24BDC1540]);
      objc_msgSend(v5, "bundleId");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = (void *)objc_msgSend(v15, "initWithBundleIdentifier:allowPlaceholder:error:", v16, 1, 0);

      objc_msgSend(v12, "localizedName");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setAppTitle:", v17);

    }
  }
  objc_msgSend(v5, "bundleId");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_msgSend(v18, "isEqualToString:", CFSTR("com.apple.mobilenotes"));

  if (v19)
    objc_msgSend(v5, "setSubtitle:", 0);
  v20 = objc_alloc_init(MEMORY[0x24BE84E08]);
  objc_msgSend(MEMORY[0x24BDD1880], "UUID");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "UUIDString");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "setCardSectionId:", v22);

  v23 = (void *)MEMORY[0x24BE84F78];
  objc_msgSend(v5, "title");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "textWithString:", v24);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "setTitle:", v25);

  v26 = objc_msgSend(v6, "maxLinesForTitle");
  objc_msgSend(v20, "title");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "setMaxLines:", v26);

  if ((objc_msgSend(v6, "maxLinesForSubtitle") & 0x8000000000000000) == 0)
  {
    v28 = (void *)MEMORY[0x24BE84F78];
    objc_msgSend(v5, "subtitle");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "textWithString:", v29);
    v30 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v30, "setMaxLines:", objc_msgSend(v6, "maxLinesForSubtitle"));
    v76[0] = v30;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v76, 1);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "setDescriptions:", v31);

  }
  objc_msgSend(v5, "appTitle");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v32, "length"))
  {
    v33 = objc_msgSend(v6, "showAppFootnote");

    if (v33)
    {
      v34 = (void *)MEMORY[0x24BE84F78];
      objc_msgSend(v5, "appTitle");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v34, "textWithString:", v35);
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "setFootnote:", v36);

      if (!objc_msgSend(v6, "showAppFootnoteIcon"))
        goto LABEL_19;
      v37 = (void *)MEMORY[0x24BE85218];
      objc_msgSend(v5, "bundleId");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v37, "appIconForBundleIdentifier:variant:", v38, 0);
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      v75 = v39;
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v75, 1);
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "footnote");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v41, "setIcons:", v40);

      goto LABEL_18;
    }
  }
  else
  {

  }
  objc_msgSend(v5, "footnote");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  v43 = objc_msgSend(v42, "length");

  if (!v43)
    goto LABEL_19;
  v44 = (void *)MEMORY[0x24BE84F78];
  objc_msgSend(v5, "footnote");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v44, "textWithString:", v38);
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "setFootnote:", v39);
LABEL_18:

LABEL_19:
  objc_msgSend(v20, "footnote");
  v45 = (void *)objc_claimAutoreleasedReturnValue();

  if (v45)
  {
    v46 = objc_msgSend(v6, "maxLinesForFootnote");
    objc_msgSend(v20, "footnote");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v47, "setMaxLines:", v46);

  }
  if (objc_msgSend(v6, "showThumbnailImage"))
  {
    if ((objc_msgSend(v6, "useAppIconAsThumbnail") & 1) != 0
      || (objc_msgSend(v5, "image"), v48 = (void *)objc_claimAutoreleasedReturnValue(), v48, !v48))
    {
      objc_msgSend(v5, "bundleId");
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      v52 = objc_msgSend(v51, "length");

      if (!v52)
        goto LABEL_35;
      objc_msgSend(v12, "applicationState");
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v53, "isInstalled"))
      {

      }
      else
      {
        v54 = objc_alloc(MEMORY[0x24BDC1540]);
        objc_msgSend(v5, "bundleId");
        v55 = (void *)objc_claimAutoreleasedReturnValue();
        v56 = (void *)objc_msgSend(v54, "initWithBundleIdentifierOfSystemPlaceholder:error:", v55, 0);
        objc_msgSend(v56, "applicationState");
        v57 = (void *)objc_claimAutoreleasedReturnValue();
        v58 = objc_msgSend(v57, "isPlaceholder");

        if (!v58)
          goto LABEL_35;
      }
      if (objc_msgSend(v6, "useTinyIconVariant"))
        v59 = 2;
      else
        v59 = 4;
      v60 = (void *)MEMORY[0x24BE85218];
      objc_msgSend(v5, "bundleId");
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v60, "appIconForBundleIdentifier:variant:", v50, v59);
      v61 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "setThumbnail:", v61);

    }
    else
    {
      objc_msgSend(v5, "image");
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "setThumbnail:", v49);

      if (!objc_msgSend(v6, "useTinyIconVariant"))
        goto LABEL_35;
      objc_msgSend(v20, "thumbnail");
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v50, "setSize:", 29.0, 29.0);
    }

LABEL_35:
    objc_msgSend(v20, "thumbnail");
    v62 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v62)
    {
      if (objc_msgSend(v6, "useTinyIconVariant"))
        v63 = 2;
      else
        v63 = 4;
      v64 = (void *)MEMORY[0x24BE85218];
      objc_msgSend(v5, "bundleId");
      v65 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v64, "appIconForBundleIdentifier:variant:", v65, v63);
      v66 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "setThumbnail:", v66);

    }
  }
  objc_msgSend(v5, "actionItem");
  v67 = objc_claimAutoreleasedReturnValue();
  if (v67)
  {
    v68 = (void *)v67;
    v69 = objc_msgSend(v6, "showActionButton");

    if (v69)
    {
      objc_msgSend(v5, "actionItem");
      v70 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "setAction:", v70);

      objc_msgSend(v5, "actionPunchout");
      v71 = (void *)objc_claimAutoreleasedReturnValue();

      if (v71)
      {
        objc_msgSend(v5, "actionPunchout");
        v72 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "action");
        v73 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v73, "setPunchout:", v72);

      }
    }
  }

  return v20;
}

+ (void)_configureCardInfo:(id)a3 forINInteraction:(id)a4 withConfig:(id)a5
{
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  int v28;
  void *v29;
  uint64_t v30;
  void *v31;
  void *v32;
  int v33;
  id v34;
  void *v35;
  uint64_t v36;
  uint64_t v37;
  void *v38;
  uint64_t v39;
  uint64_t i;
  void *v41;
  void *v42;
  id v43;
  void *v44;
  void *v45;
  const __CFString *v46;
  void *v47;
  __CFString *v48;
  __CFString *v49;
  void *v50;
  void *v51;
  id v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  _BYTE v57[128];
  uint64_t v58;

  v58 = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  v8 = a4;
  v9 = a5;
  objc_msgSend(v8, "intent");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "title");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11)
  {
    objc_msgSend(v7, "setTitle:", v11);
  }
  else
  {
    objc_msgSend(v10, "_title");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setTitle:", v12);

  }
  objc_msgSend(v7, "subtitle");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (v13)
  {
    objc_msgSend(v7, "setSubtitle:", v13);
  }
  else
  {
    objc_msgSend(v10, "_subtitle");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setSubtitle:", v14);

  }
  objc_msgSend(v8, "intent");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "_intents_bundleIdForDisplay");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setBundleId:", v16);

  if ((objc_msgSend(v9, "useAppIconAsThumbnail") & 1) == 0)
  {
    objc_msgSend(v8, "_keyImage");
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    if (v17)
    {
      v18 = objc_alloc(MEMORY[0x24BDDA518]);
      objc_msgSend(v8, "_keyImage");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = (void *)objc_msgSend(v18, "initWithIntentsImage:", v19);
      objc_msgSend(v7, "setImage:", v20);

      objc_msgSend(v7, "image");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "setCornerRoundingStyle:", 2);

      objc_msgSend(v10, "_className");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(v19) = objc_msgSend(v22, "isEqualToString:", CFSTR("DNDToggleDoNotDisturbIntent"));

      if ((_DWORD)v19)
      {
        objc_msgSend(v7, "image");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "setCornerRoundingStyle:", 3);

      }
    }
  }
  if ((objc_msgSend(v9, "useAppIconAsThumbnail") & 1) == 0)
  {
    objc_msgSend(v10, "apui_keyPeople");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend(v24, "count"))
    {
LABEL_21:

      goto LABEL_48;
    }
    objc_msgSend(v7, "image");
    v25 = objc_claimAutoreleasedReturnValue();
    if (v25)
    {
      v26 = (void *)v25;
      objc_msgSend(v8, "intent");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v28 = APUIIsIntentFromSystemApp(v27);

      if (!v28)
        goto LABEL_48;
    }
    else
    {

    }
    objc_msgSend(v8, "intent");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0
      && (objc_msgSend(v7, "image"), (v30 = objc_claimAutoreleasedReturnValue()) != 0))
    {
      v31 = (void *)v30;
      objc_msgSend(v8, "intent");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      v33 = APUIIsIntentFromSystemApp(v32);

      if (v33)
      {
        objc_msgSend(v7, "image");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "setCornerRoundingStyle:", 4);
        goto LABEL_21;
      }
    }
    else
    {

    }
    v52 = v9;
    v34 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
    v51 = v10;
    objc_msgSend(v10, "apui_keyPeople");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    v53 = 0u;
    v54 = 0u;
    v55 = 0u;
    v56 = 0u;
    v36 = objc_msgSend(v35, "countByEnumeratingWithState:objects:count:", &v53, v57, 16);
    if (v36)
    {
      v37 = v36;
      v38 = 0;
      v39 = *(_QWORD *)v54;
      do
      {
        for (i = 0; i != v37; ++i)
        {
          if (*(_QWORD *)v54 != v39)
            objc_enumerationMutation(v35);
          v41 = *(void **)(*((_QWORD *)&v53 + 1) + 8 * i);
          objc_msgSend(v41, "contactIdentifier");
          v42 = (void *)objc_claimAutoreleasedReturnValue();
          if (v42)
            objc_msgSend(v34, "addObject:", v42);
          if (!v38)
          {
            objc_msgSend(v41, "nameComponents");
            v38 = (void *)objc_claimAutoreleasedReturnValue();
          }

        }
        v37 = objc_msgSend(v35, "countByEnumeratingWithState:objects:count:", &v53, v57, 16);
      }
      while (v37);
    }
    else
    {
      v38 = 0;
    }
    if (objc_msgSend(v34, "count"))
    {
      v43 = objc_alloc_init(MEMORY[0x24BE84DF0]);
      objc_msgSend(v43, "setContactIdentifiers:", v34);
      objc_msgSend(v7, "setImage:", v43);
      v10 = v51;
      v9 = v52;
    }
    else
    {
      v10 = v51;
      v9 = v52;
      if (!v38)
      {
LABEL_47:

        goto LABEL_48;
      }
      v43 = objc_alloc_init(MEMORY[0x24BE84F00]);
      objc_msgSend(v38, "givenName");
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v44, "length"))
      {
        objc_msgSend(v44, "substringToIndex:", 1);
        v49 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v49 = &stru_24EDBF760;
      }
      objc_msgSend(v38, "familyName");
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      v50 = v44;
      if (objc_msgSend(v45, "length"))
      {
        objc_msgSend(v45, "substringToIndex:", 1);
        v46 = (const __CFString *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v46 = &stru_24EDBF760;
      }
      v48 = (__CFString *)v46;
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@%@"), v49, v46);
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v43, "setMonogramLetters:", v47);

      objc_msgSend(v7, "setImage:", v43);
    }

    goto LABEL_47;
  }
LABEL_48:

}

+ (void)_configureCardInfo:(id)a3 forINIntent:(id)a4 withConfig:(id)a5
{
  objc_class *v8;
  id v9;
  id v10;
  id v11;
  id v12;

  v8 = (objc_class *)MEMORY[0x24BDD9DF0];
  v9 = a5;
  v10 = a4;
  v11 = a3;
  v12 = (id)objc_msgSend([v8 alloc], "initWithIntent:response:", v10, 0);

  objc_msgSend(a1, "_configureCardInfo:forINInteraction:withConfig:", v11, v12, v9);
}

+ (void)_configureCardInfo:(id)a3 forNSUserActivity:(id)a4 withConfig:(id)a5
{
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  const __CFString *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  NSObject *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;

  v7 = a3;
  v8 = a4;
  v9 = a5;
  objc_msgSend(v7, "title");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    objc_msgSend(v7, "setTitle:", v10);
  }
  else
  {
    objc_msgSend(v8, "title");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setTitle:", v11);

  }
  objc_msgSend(v7, "subtitle");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    objc_msgSend(v7, "setSubtitle:", v12);
  }
  else
  {
    objc_msgSend(v8, "contentAttributeSet");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "contentDescription");
    v14 = objc_claimAutoreleasedReturnValue();
    v15 = (void *)v14;
    if (v14)
      v16 = (const __CFString *)v14;
    else
      v16 = &stru_24EDBF760;
    objc_msgSend(v7, "setSubtitle:", v16);

  }
  objc_msgSend(v9, "bundleId");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  INDisplayableOrLaunchableBundleIdForBundleIdFromUserActivity();
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "webpageURL");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  ATXBundleIdReplacementForBundleIdWithWebpageURLHint();
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setBundleId:", v20);

  LODWORD(v17) = objc_msgSend(v9, "showThumbnailImage");
  if ((_DWORD)v17)
  {
    objc_msgSend(v8, "contentAttributeSet");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "thumbnailURL");
    v22 = (void *)objc_claimAutoreleasedReturnValue();

    if (v22)
    {
      v23 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE85030]), "initWithURL:", v22);
      objc_msgSend(v7, "setImage:", v23);

      objc_msgSend(v7, "image");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "setCornerRoundingStyle:", 2);

    }
  }
  __atxlog_handle_ui();
  v25 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG))
    +[APUIActionCardUtils _configureCardInfo:forNSUserActivity:withConfig:].cold.1(v25, v26, v27, v28, v29, v30, v31, v32);

}

+ (void)_configureCardInfo:(id)a3 forUAUserActivityProxy:(id)a4 withConfig:(id)a5
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;

  v17 = a3;
  v7 = a4;
  v8 = a5;
  objc_msgSend(v17, "title");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    objc_msgSend(v17, "setTitle:", v9);
  }
  else
  {
    objc_msgSend(v7, "activityTitle");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setTitle:", v10);

  }
  objc_msgSend(v17, "subtitle");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11)
  {
    objc_msgSend(v17, "setSubtitle:", v11);
  }
  else
  {
    objc_msgSend(v7, "activitySubTitle");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setSubtitle:", v12);

  }
  objc_msgSend(v8, "bundleId");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  INDisplayableOrLaunchableBundleIdForBundleIdFromUserActivity();
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setBundleId:", v14);

  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "localizedStringForKey:value:table:", CFSTR("Handoff"), &stru_24EDBF760, 0);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setAppTitle:", v16);

  objc_msgSend(v8, "setShowAppFootnote:", 1);
  objc_msgSend(v8, "setShowThumbnailImage:", 1);
  objc_msgSend(v8, "setUseAppIconAsThumbnail:", 1);

}

+ (void)_configureCardInfo:(id)a3 forNSString:(id)a4 withConfig:(id)a5
{
  id v7;
  id v8;
  id v9;

  v9 = a5;
  v7 = a4;
  v8 = a3;
  objc_msgSend(v8, "setTitle:", 0);
  objc_msgSend(v8, "setSubtitle:", v7);

  objc_msgSend(v8, "setImage:", 0);
  objc_msgSend(v8, "setBundleId:", 0);

  objc_msgSend(v9, "setMaxLinesForSubtitle:", 0);
  objc_msgSend(v9, "setShowThumbnailImage:", 0);
  objc_msgSend(v9, "setShowAppFootnote:", 0);

}

+ (void)_configureCardInfo:(id)a3 forHeroApp:(id)a4 withConfig:(id)a5
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  uint64_t v23;
  void *v24;
  id v25;
  void *v26;
  void *v27;
  void *v28;
  id v29;

  v29 = a3;
  v7 = a4;
  v8 = a5;
  objc_msgSend(v7, "clipMetadata");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    objc_msgSend(v7, "clipMetadata");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "clipName");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "setTitle:", v11);

    objc_msgSend(v10, "localizedTitleForClipSuggestion");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "setAppTitle:", v12);

    objc_msgSend(v10, "localizedSubtitleForClipSuggestion");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "setSubtitle:", v13);

    objc_msgSend(v10, "clipBundleID");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "setBundleId:", v14);

    objc_msgSend(v10, "fullAppCachedIconFilePath");
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    if (v15)
    {
      v16 = objc_alloc(MEMORY[0x24BE85030]);
      v17 = (void *)MEMORY[0x24BDBCF48];
      objc_msgSend(v10, "fullAppCachedIconFilePath");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "fileURLWithPath:", v18);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = (void *)objc_msgSend(v16, "initWithURL:", v19);
      objc_msgSend(v29, "setImage:", v20);

    }
    else
    {
      objc_msgSend(v10, "clipBusinessIconURL");
      v21 = (void *)objc_claimAutoreleasedReturnValue();

      if (v21)
      {
        v22 = objc_alloc(MEMORY[0x24BE85030]);
        objc_msgSend(v10, "clipBusinessIconURL");
        v23 = objc_claimAutoreleasedReturnValue();
      }
      else
      {
        objc_msgSend(v10, "fullAppIconURL");
        v24 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v24)
        {
LABEL_10:
          v25 = objc_alloc_init(MEMORY[0x24BE84D40]);
          objc_msgSend(v29, "setActionItem:", v25);

          objc_msgSend(v10, "clipOpenButtonTitle");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v26, "uppercaseString");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v29, "actionItem");
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v28, "setLabel:", v27);

          objc_msgSend(v8, "setShowActionButton:", 1);
          objc_msgSend(v8, "setShowThumbnailImage:", 1);
          objc_msgSend(v8, "setUseAppIconAsThumbnail:", 0);
          objc_msgSend(v8, "setShowAppFootnote:", 0);
          objc_msgSend(v8, "setMaxLinesForSubtitle:", 2);

          goto LABEL_11;
        }
        v22 = objc_alloc(MEMORY[0x24BE85030]);
        objc_msgSend(v10, "fullAppIconURL");
        v23 = objc_claimAutoreleasedReturnValue();
      }
      v18 = (void *)v23;
      v19 = (void *)objc_msgSend(v22, "initWithURL:", v23);
      objc_msgSend(v29, "setImage:", v19);
    }

    goto LABEL_10;
  }
LABEL_11:

}

+ (void)_configureCardInfo:(id)a3 forATXAction:(id)a4 withConfig:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  int v25;
  void *v26;
  void *v27;
  void *v28;
  uint64_t v29;
  void *v30;
  void *v31;
  int v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  uint64_t v39;
  void *v40;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  __atxlog_handle_ui();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    +[APUIActionCardUtils _configureCardInfo:forATXAction:withConfig:].cold.1(v11, v12, v13, v14, v15, v16, v17, v18);

  objc_msgSend(v8, "title");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  if (v19)
  {
    objc_msgSend(v8, "setTitle:", v19);
  }
  else
  {
    objc_msgSend(v9, "actionTitle");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setTitle:", v20);

  }
  objc_msgSend(v8, "subtitle");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_subtitleForAction:default:", v9, v21);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setSubtitle:", v22);

  if (objc_msgSend(v9, "actionType") == 1)
  {
    objc_msgSend(v9, "userActivity");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "_configureCardInfo:forNSUserActivity:withConfig:", v8, v23, v10);
LABEL_14:

    goto LABEL_15;
  }
  if (objc_msgSend(v9, "actionType") == 5)
  {
    objc_msgSend(v9, "userActivityProxy");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "_configureCardInfo:forUAUserActivityProxy:withConfig:", v8, v23, v10);
    goto LABEL_14;
  }
  if (!objc_msgSend(v9, "actionType") || objc_msgSend(v9, "actionType") == 2)
  {
    objc_msgSend(v9, "intent");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "_configureCardInfo:forINIntent:withConfig:", v8, v23, v10);
    objc_msgSend(v23, "_className");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = objc_msgSend(v24, "isEqualToString:", CFSTR("DNDToggleDoNotDisturbIntent"));

    if (v25)
    {
      objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "localizedStringForKey:value:table:", CFSTR("Do Not Disturb"), &stru_24EDBF760, 0);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "setAppTitle:", v27);

    }
    goto LABEL_14;
  }
LABEL_15:
  objc_msgSend(v8, "bundleId");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = objc_msgSend(v28, "length");

  if (!v29)
  {
    objc_msgSend(v9, "_bundleIdForDisplay");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setBundleId:", v30);

  }
  objc_msgSend(v8, "bundleId");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = objc_msgSend(v31, "isEqualToString:", CFSTR("com.apple.mobilecal"));

  if (v32)
  {
    objc_msgSend(v9, "dateForAction");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    if (v33)
    {
      v34 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE85230]), "initWithDate:variant:", v33, 4);
      objc_msgSend(v8, "setImage:", v34);

    }
    else
    {
      if (!_configureCardInfo_forATXAction_withConfig__sCalendarSearchUIImage)
      {
        v35 = (void *)MEMORY[0x24BDF6AC8];
        objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v35, "imageNamed:inBundle:", CFSTR("calendar-fallback-icon"), v36);
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v37, "_applicationIconImageForFormat:precomposed:", 2, 0);
        v38 = (void *)objc_claimAutoreleasedReturnValue();

        v39 = objc_msgSend(objc_alloc(MEMORY[0x24BE85258]), "initWithImage:", v38);
        v40 = (void *)_configureCardInfo_forATXAction_withConfig__sCalendarSearchUIImage;
        _configureCardInfo_forATXAction_withConfig__sCalendarSearchUIImage = v39;

        objc_msgSend((id)_configureCardInfo_forATXAction_withConfig__sCalendarSearchUIImage, "setCornerRoundingStyle:", 3);
      }
      objc_msgSend(v8, "setImage:");
    }

  }
}

+ (id)_subtitleForAction:(id)a3 default:(id)a4
{
  id v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  char v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  id v21;

  v5 = a3;
  v6 = a4;
  v7 = v6;
  if (v6)
  {
    v8 = v6;
  }
  else
  {
    objc_msgSend(v5, "actionSubtitle");
    v8 = (id)objc_claimAutoreleasedReturnValue();
  }
  v9 = v8;
  objc_msgSend(v5, "routeInfo");
  v10 = objc_claimAutoreleasedReturnValue();
  if (v10
    && (v11 = (void *)v10,
        objc_msgSend(v5, "routeInfo"),
        v12 = (void *)objc_claimAutoreleasedReturnValue(),
        v13 = objc_msgSend(v12, "isExternalRoute"),
        v12,
        v11,
        (v13 & 1) != 0))
  {
    v14 = objc_alloc(MEMORY[0x24BDD17C8]);
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "localizedStringForKey:value:table:", CFSTR("AirPlay to %@"), &stru_24EDBF760, 0);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "routeInfo");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "deviceName");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = (void *)objc_msgSend(v14, "initWithFormat:", v16, v18);

    if (objc_msgSend(v9, "length"))
      v20 = (id)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithFormat:", CFSTR("%@\n%@"), v9, v19);
    else
      v20 = v19;
    v21 = v20;

  }
  else
  {
    v21 = v9;
  }

  return v21;
}

+ (void)_configureCardInfo:(id)a3 forVoiceShortcutWithPhrase:(id)a4 name:(id)a5 description:(id)a6 keyImage:(id)a7 applicationBundleIdentifier:(id)a8 config:(id)a9
{
  id v14;
  void *v15;
  void *v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  void *v22;
  void *v23;
  void *v24;
  char v25;
  void *v26;
  void *v27;
  id v28;

  v28 = a3;
  v14 = a7;
  v15 = (void *)MEMORY[0x24BDD17C8];
  v16 = (void *)MEMORY[0x24BDD1488];
  v17 = a9;
  v18 = a8;
  v19 = a6;
  v20 = a5;
  v21 = a4;
  objc_msgSend(v16, "mainBundle");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "localizedStringForKey:value:table:", CFSTR("“%@”"), &stru_24EDBF760, 0);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "localizedStringWithFormat:", v23, v21);
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v28, "setTitle:", v24);
  objc_msgSend(v28, "setSubtitle:", v20);

  objc_msgSend(v28, "setFootnote:", v19);
  objc_msgSend(v28, "setBundleId:", v18);

  v25 = objc_msgSend(v17, "useAppIconAsThumbnail");
  if (v14 && (v25 & 1) == 0)
  {
    v26 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDDA518]), "initWithIntentsImage:", v14);
    objc_msgSend(v28, "setImage:", v26);

    objc_msgSend(v28, "image");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "setCornerRoundingStyle:", 2);

  }
}

+ (void)_configureCardInfo:(uint64_t)a3 forNSUserActivity:(uint64_t)a4 withConfig:(uint64_t)a5 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_226339000, a1, a3, "returning from _configureCardInfo:forNSUserActivity:...", a5, a6, a7, a8, 0);
}

+ (void)_configureCardInfo:(uint64_t)a3 forATXAction:(uint64_t)a4 withConfig:(uint64_t)a5 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_226339000, a1, a3, "Eager loading action title", a5, a6, a7, a8, 0);
}

@end
