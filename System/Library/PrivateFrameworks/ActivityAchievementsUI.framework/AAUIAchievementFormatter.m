@implementation AAUIAchievementFormatter

- (AAUIAchievementFormatter)initWithStyle:(int64_t)a3 achievement:(id)a4 achLocalizationProvider:(id)a5
{
  id v9;
  id v10;
  AAUIAchievementFormatter *v11;
  AAUIAchievementFormatter *v12;
  objc_super v14;

  v9 = a4;
  v10 = a5;
  v14.receiver = self;
  v14.super_class = (Class)AAUIAchievementFormatter;
  v11 = -[AAUIAchievementFormatter init](&v14, sel_init);
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_achievement, a4);
    objc_storeStrong((id *)&v12->_achLocProvider, a5);
    v12->_style = a3;
  }

  return v12;
}

- (id)titleAttributes
{
  int64_t v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  double v9;
  double v10;
  int v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  _QWORD v21[3];
  _QWORD v22[3];
  uint64_t v23;
  void *v24;
  uint64_t v25;
  _QWORD v26[2];

  v26[1] = *MEMORY[0x24BDAC8D0];
  v2 = -[AAUIAchievementFormatter style](self, "style");
  if (v2 == 2)
  {
    objc_msgSend(MEMORY[0x24BEBD5E0], "systemFontOfSize:weight:", 16.0, *MEMORY[0x24BEBE270]);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BEBD4B8], "whiteColor");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BEBD358], "defaultParagraphStyle");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (void *)objc_msgSend(v6, "mutableCopy");

    objc_msgSend(v7, "setAlignment:", 1);
    v5 = (void *)objc_msgSend(v7, "copy");

  }
  else if (v2 == 1)
  {
    objc_msgSend(MEMORY[0x24BEBD5E8], "preferredFontDescriptorWithTextStyle:", *MEMORY[0x24BEBE1F0]);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "pointSize");
    v10 = v9;
    v11 = objc_msgSend(v8, "symbolicTraits");
    v25 = *MEMORY[0x24BEBE198];
    v23 = *MEMORY[0x24BEBE1C0];
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", v11 | 2u);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = v12;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v24, &v23, 1);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v26[0] = v13;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v26, &v25, 1);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "fontDescriptorByAddingAttributes:", v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x24BEBD5E0], "fontWithDescriptor:size:", v15, v10);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BEBD4B8], "whiteColor");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BEBD358], "defaultParagraphStyle");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = (void *)objc_msgSend(v16, "mutableCopy");

    objc_msgSend(v17, "setAlignment:", 1);
    v5 = (void *)objc_msgSend(v17, "copy");

  }
  else if (v2)
  {
    v5 = 0;
    v4 = 0;
    v3 = 0;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BEBD5E0], "preferredFontForTextStyle:", *MEMORY[0x24BEBE200]);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BEBD4B8], "whiteColor");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BEBD358], "defaultParagraphStyle");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v18 = *MEMORY[0x24BEBD278];
  v21[0] = *MEMORY[0x24BEBD270];
  v21[1] = v18;
  v22[0] = v3;
  v22[1] = v4;
  v21[2] = *MEMORY[0x24BEBD298];
  v22[2] = v5;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v22, v21, 3);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  return v19;
}

- (id)descriptionAttributes
{
  int64_t v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  double v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  _QWORD v14[3];
  _QWORD v15[4];

  v15[3] = *MEMORY[0x24BDAC8D0];
  v2 = -[AAUIAchievementFormatter style](self, "style");
  if (v2 == 2)
  {
    objc_msgSend(MEMORY[0x24BEBD5E0], "systemFontOfSize:", 16.0);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BEBD4B8], "whiteColor");
    v8 = objc_claimAutoreleasedReturnValue();
LABEL_7:
    v4 = (void *)v8;
    objc_msgSend(MEMORY[0x24BEBD358], "defaultParagraphStyle");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (void *)objc_msgSend(v9, "mutableCopy");

    objc_msgSend(v6, "setAlignment:", 1);
    goto LABEL_8;
  }
  if (v2 == 1)
  {
    objc_msgSend(MEMORY[0x24BEBD5E0], "preferredFontForTextStyle:", *MEMORY[0x24BEBE1F0]);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BEBD4B8], "fu_systemTextGreyColor");
    v8 = objc_claimAutoreleasedReturnValue();
    goto LABEL_7;
  }
  if (v2)
  {
    v10 = 0;
    v4 = 0;
    v3 = 0;
    goto LABEL_10;
  }
  objc_msgSend(MEMORY[0x24BEBD5E0], "preferredFontForTextStyle:", *MEMORY[0x24BEBE1D0]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BEBD4B8], "_vibrantLightFillBurnColor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BEBD358], "defaultParagraphStyle");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "mutableCopy");

  LODWORD(v7) = 1057803469;
  objc_msgSend(v6, "setHyphenationFactor:", v7);
LABEL_8:
  v10 = (void *)objc_msgSend(v6, "copy");

LABEL_10:
  v11 = *MEMORY[0x24BEBD278];
  v14[0] = *MEMORY[0x24BEBD270];
  v14[1] = v11;
  v15[0] = v3;
  v15[1] = v4;
  v14[2] = *MEMORY[0x24BEBD298];
  v15[2] = v10;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v15, v14, 3);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (id)backsideAttributesWithSizeVariant:(int64_t)a3
{
  void *v4;
  void *v5;
  double v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  _QWORD v13[4];
  _QWORD v14[5];

  v14[4] = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BEBD358], "defaultParagraphStyle");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v4, "mutableCopy");

  objc_msgSend(v5, "setAlignment:", 1);
  objc_msgSend(v5, "setLineHeightMultiple:", 0.95);
  v6 = 0.0;
  objc_msgSend(MEMORY[0x24BEBD4B8], "colorWithWhite:alpha:", 0.0, 0.5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((unint64_t)a3 <= 2)
    v6 = dbl_21CC41ED0[a3];
  objc_msgSend(MEMORY[0x24BEBD5E0], "boldSystemFontOfSize:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = *MEMORY[0x24BEBD298];
  v13[0] = *MEMORY[0x24BEBD278];
  v13[1] = v9;
  v14[0] = v7;
  v14[1] = v5;
  v10 = *MEMORY[0x24BEBD280];
  v13[2] = *MEMORY[0x24BEBD270];
  v13[3] = v10;
  v14[2] = v8;
  v14[3] = &unk_24E0BAF18;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v14, v13, 4);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (id)achBacksideAttributesWithSizeVariant:(int64_t)a3
{
  void *v4;
  void *v5;
  double v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  _QWORD v13[4];
  _QWORD v14[5];

  v14[4] = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BEBD358], "defaultParagraphStyle");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v4, "mutableCopy");

  objc_msgSend(v5, "setAlignment:", 1);
  objc_msgSend(v5, "setLineHeightMultiple:", 0.95);
  v6 = 0.0;
  objc_msgSend(MEMORY[0x24BEBD4B8], "colorWithWhite:alpha:", 0.0, 0.5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((unint64_t)a3 <= 2)
    v6 = dbl_21CC41ED0[a3];
  objc_msgSend(MEMORY[0x24BEBD5E0], "boldSystemFontOfSize:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = *MEMORY[0x24BEBD298];
  v13[0] = *MEMORY[0x24BEBD278];
  v13[1] = v9;
  v14[0] = v7;
  v14[1] = v5;
  v10 = *MEMORY[0x24BEBD280];
  v13[2] = *MEMORY[0x24BEBD270];
  v13[3] = v10;
  v14[2] = v8;
  v14[3] = &unk_24E0BAF18;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v14, v13, 4);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (id)localizedAttributedCombinedString
{
  return -[AAUIAchievementFormatter localizedAttributedCombinedStringShowingProgress:](self, "localizedAttributedCombinedStringShowingProgress:", 1);
}

- (id)localizedAttributedCombinedStringWithoutProgress
{
  return -[AAUIAchievementFormatter localizedAttributedCombinedStringShowingProgress:](self, "localizedAttributedCombinedStringShowingProgress:", 0);
}

- (id)localizedAttributedCombinedStringShowingProgress:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  void *v6;
  char v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  uint64_t v13;
  BOOL v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  __CFString *v19;
  NSObject *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  id v24;
  void *v25;
  void *v26;
  id v27;
  void *v28;
  void *v29;
  void *v30;

  v3 = a3;
  if (-[AAUIAchievementFormatter formatsForFriend](self, "formatsForFriend"))
  {
    -[AAUIAchievementFormatter achLocProvider](self, "achLocProvider");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v5)
      goto LABEL_18;
    -[AAUIAchievementFormatter achievement](self, "achievement");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "unearned");
    -[AAUIAchievementFormatter achLocProvider](self, "achLocProvider");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[AAUIAchievementFormatter achievement](self, "achievement");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if ((v7 & 1) != 0)
      objc_msgSend(v8, "unachievedDescriptionForAchievement:", v9);
    else
      objc_msgSend(v8, "friendAchievedDescriptionForAchievement:", v9);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    goto LABEL_16;
  }
  -[AAUIAchievementFormatter achievement](self, "achievement");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "unearned");

  -[AAUIAchievementFormatter achLocProvider](self, "achLocProvider");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    if (v12)
    {
      -[AAUIAchievementFormatter achLocProvider](self, "achLocProvider");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[AAUIAchievementFormatter achievement](self, "achievement");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "unachievedDescriptionForAchievement:", v8);
      v13 = objc_claimAutoreleasedReturnValue();
LABEL_15:
      v5 = (void *)v13;
LABEL_16:

      goto LABEL_18;
    }
  }
  else if (v3)
  {
    if (v12)
    {
      -[AAUIAchievementFormatter achLocProvider](self, "achLocProvider");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[AAUIAchievementFormatter achievement](self, "achievement");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "achievedDescriptionForAchievement:", v8);
      v13 = objc_claimAutoreleasedReturnValue();
      goto LABEL_15;
    }
  }
  else if (v12)
  {
    -[AAUIAchievementFormatter achLocProvider](self, "achLocProvider");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[AAUIAchievementFormatter achievement](self, "achievement");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "achievedAlertDescriptionForAchievement:fitnessExperienceType:", v8, 1);
    v13 = objc_claimAutoreleasedReturnValue();
    goto LABEL_15;
  }
  v5 = 0;
LABEL_18:
  v14 = -[AAUIAchievementFormatter formatsForFriend](self, "formatsForFriend");
  -[AAUIAchievementFormatter achLocProvider](self, "achLocProvider");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (v14)
  {
    if (v15)
    {
      -[AAUIAchievementFormatter achLocProvider](self, "achLocProvider");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      -[AAUIAchievementFormatter achievement](self, "achievement");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "friendAchievedTitleForAchievement:", v17);
      v18 = objc_claimAutoreleasedReturnValue();
      goto LABEL_23;
    }
  }
  else if (v15)
  {
    -[AAUIAchievementFormatter achLocProvider](self, "achLocProvider");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[AAUIAchievementFormatter achievement](self, "achievement");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "titleForAchievement:", v17);
    v18 = objc_claimAutoreleasedReturnValue();
LABEL_23:
    v19 = (__CFString *)v18;

    if (v19)
      goto LABEL_27;
  }
  ACHLogDefault();
  v20 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    -[AAUIAchievementFormatter localizedAttributedCombinedStringShowingProgress:].cold.1(self, v20);

  v19 = &stru_24E0B4958;
LABEL_27:
  if (-[AAUIAchievementFormatter style](self, "style") == 1)
  {
    -[__CFString stringByReplacingOccurrencesOfString:withString:](v19, "stringByReplacingOccurrencesOfString:withString:", CFSTR("\n"), CFSTR(" "));
    v21 = objc_claimAutoreleasedReturnValue();

    objc_msgSend(v5, "stringByReplacingOccurrencesOfString:withString:", CFSTR("\n"), CFSTR(" "));
    v22 = objc_claimAutoreleasedReturnValue();

    v19 = (__CFString *)v21;
    v5 = (void *)v22;
  }
  if (v5)
  {
    -[__CFString stringByAppendingString:](v19, "stringByAppendingString:", CFSTR("\n"));
    v23 = objc_claimAutoreleasedReturnValue();

    v19 = (__CFString *)v23;
  }
  v24 = objc_alloc(MEMORY[0x24BDD1688]);
  -[AAUIAchievementFormatter titleAttributes](self, "titleAttributes");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = (void *)objc_msgSend(v24, "initWithString:attributes:", v19, v25);

  if (v5)
  {
    v27 = objc_alloc(MEMORY[0x24BDD1458]);
    -[AAUIAchievementFormatter descriptionAttributes](self, "descriptionAttributes");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = (void *)objc_msgSend(v27, "initWithString:attributes:", v5, v28);
    objc_msgSend(v26, "appendAttributedString:", v29);

  }
  v30 = (void *)objc_msgSend(v26, "copy");

  return v30;
}

- (id)localizedAttributedTitleString
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;

  -[AAUIAchievementFormatter achLocProvider](self, "achLocProvider");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[AAUIAchievementFormatter achLocProvider](self, "achLocProvider");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[AAUIAchievementFormatter achievement](self, "achievement");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "titleForAchievement:", v5);
    v3 = (void *)objc_claimAutoreleasedReturnValue();

  }
  v6 = objc_alloc(MEMORY[0x24BDD1458]);
  -[AAUIAchievementFormatter titleAttributes](self, "titleAttributes");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v6, "initWithString:attributes:", v3, v7);

  return v8;
}

- (id)localizedAttributedDescriptionString
{
  BOOL v3;
  void *v4;
  void *v5;
  char v6;
  void *v7;
  void *v8;
  uint64_t v9;
  char v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;

  v3 = -[AAUIAchievementFormatter formatsForFriend](self, "formatsForFriend");
  -[AAUIAchievementFormatter achLocProvider](self, "achLocProvider");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    if (v4)
    {
      -[AAUIAchievementFormatter achievement](self, "achievement");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = objc_msgSend(v5, "unearned");
      -[AAUIAchievementFormatter achLocProvider](self, "achLocProvider");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[AAUIAchievementFormatter achievement](self, "achievement");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      if ((v6 & 1) == 0)
      {
        objc_msgSend(v7, "friendAchievedDescriptionForAchievement:", v8);
        v9 = objc_claimAutoreleasedReturnValue();
LABEL_10:
        v11 = (void *)v9;

        goto LABEL_11;
      }
LABEL_7:
      objc_msgSend(v7, "unachievedDescriptionForAchievement:", v8);
      v9 = objc_claimAutoreleasedReturnValue();
      goto LABEL_10;
    }
  }
  else if (v4)
  {
    -[AAUIAchievementFormatter achievement](self, "achievement");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v5, "unearned");
    -[AAUIAchievementFormatter achLocProvider](self, "achLocProvider");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[AAUIAchievementFormatter achievement](self, "achievement");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if ((v10 & 1) == 0)
    {
      objc_msgSend(v7, "achievedDescriptionForAchievement:", v8);
      v9 = objc_claimAutoreleasedReturnValue();
      goto LABEL_10;
    }
    goto LABEL_7;
  }
  v11 = 0;
LABEL_11:
  v12 = objc_alloc(MEMORY[0x24BDD1458]);
  -[AAUIAchievementFormatter descriptionAttributes](self, "descriptionAttributes");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (void *)objc_msgSend(v12, "initWithString:attributes:", v11, v13);

  return v14;
}

- (BOOL)shouldShowEarnedShortDescription
{
  void *v2;
  void *v3;
  void *v4;
  int v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  char v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v16;

  -[AAUIAchievementFormatter achievement](self, "achievement");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if ((ACHShouldUseNewAwardsSystem() & 1) != 0)
  {
    objc_msgSend(v2, "relevantEarnedInstance");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if (v3)
      goto LABEL_3;
LABEL_12:
    LOBYTE(v5) = 0;
    goto LABEL_13;
  }
  objc_msgSend(v2, "earnedInstances");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "lastObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
    goto LABEL_12;
LABEL_3:
  objc_msgSend(v2, "template");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "earnLimit");

  if (v5 != 1)
  {
    objc_msgSend(MEMORY[0x24BDBCE48], "currentCalendar");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "earnedDateComponents");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "dateFromComponents:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x24BDBCE48], "currentCalendar");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "isDateInToday:", v8);

    objc_msgSend(v2, "progress");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v2, "progress");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "goal");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v12, "compare:", v13);

    if (v14 != -1 || v11 == 0)
      LOBYTE(v5) = 1;
    else
      LOBYTE(v5) = v10;

  }
LABEL_13:

  return v5;
}

- (id)localizedAttributedShortDescriptionString
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  _BOOL4 v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v16;
  uint64_t v17;
  void *v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  void *v23;
  id v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  _QWORD v29[2];
  _QWORD v30[2];
  _QWORD v31[2];
  _QWORD v32[3];

  v32[2] = *MEMORY[0x24BDAC8D0];
  if (!-[AAUIAchievementFormatter style](self, "style"))
    return 0;
  -[AAUIAchievementFormatter achievement](self, "achievement");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BEBD4B8], "whiteColor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BEBD4B8], "fu_systemTextGreyColor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[AAUIAchievementFormatter achLocProvider](self, "achLocProvider");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
    goto LABEL_4;
  -[AAUIAchievementFormatter achLocProvider](self, "achLocProvider");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "titleForAchievement:", v3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "stringByReplacingOccurrencesOfString:withString:", CFSTR("\n"), CFSTR(" "));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v9)
  {
LABEL_4:
    objc_msgSend(v3, "template");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "uniqueName");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
  v11 = -[AAUIAchievementFormatter shouldShowEarnedShortDescription](self, "shouldShowEarnedShortDescription");
  -[AAUIAchievementFormatter achLocProvider](self, "achLocProvider");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v11)
  {
    if (v12)
    {
      -[AAUIAchievementFormatter achLocProvider](self, "achLocProvider");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "unachievedShortDescriptionForAchievement:", v3);
      v14 = objc_claimAutoreleasedReturnValue();
      goto LABEL_11;
    }
LABEL_12:
    v16 = 0;
    goto LABEL_13;
  }
  if (!v12)
    goto LABEL_12;
  -[AAUIAchievementFormatter achLocProvider](self, "achLocProvider");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "achievedShortDescriptionForAchievement:", v3);
  v14 = objc_claimAutoreleasedReturnValue();
LABEL_11:
  v16 = (void *)v14;

LABEL_13:
  v27 = v3;
  if (objc_msgSend(v16, "length"))
  {
    objc_msgSend(v9, "stringByAppendingString:", CFSTR("\n"), v3);
    v17 = objc_claimAutoreleasedReturnValue();

    v9 = (void *)v17;
  }
  objc_msgSend(MEMORY[0x24BEBD5E0], "preferredFontForTextStyle:", *MEMORY[0x24BEBE1E8], v27);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_alloc(MEMORY[0x24BDD1688]);
  v20 = *MEMORY[0x24BEBD270];
  v21 = *MEMORY[0x24BEBD278];
  v31[0] = *MEMORY[0x24BEBD270];
  v31[1] = v21;
  v32[0] = v18;
  v32[1] = v4;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v32, v31, 2);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = (void *)objc_msgSend(v19, "initWithString:attributes:", v9, v22);

  if (objc_msgSend(v16, "length"))
  {
    v24 = objc_alloc(MEMORY[0x24BDD1458]);
    v29[0] = v20;
    v29[1] = v21;
    v30[0] = v18;
    v30[1] = v5;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v30, v29, 2);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = (void *)objc_msgSend(v24, "initWithString:attributes:", v16, v25);
    objc_msgSend(v23, "appendAttributedString:", v26);

  }
  return v23;
}

- (id)achLocalizedAttributedBacksideStringWithDateSizeVariant:(int64_t)a3
{
  int64_t v5;
  uint64_t v6;
  void *v7;
  int v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;

  v5 = -[AAUIAchievementFormatter style](self, "style");
  if (v5 == 2)
    v6 = 1;
  else
    v6 = 2 * (v5 != 1);
  -[AAUIAchievementFormatter achievement](self, "achievement");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "unearned");

  -[AAUIAchievementFormatter achLocProvider](self, "achLocProvider");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    if (v9)
    {
      -[AAUIAchievementFormatter achLocProvider](self, "achLocProvider");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[AAUIAchievementFormatter achievement](self, "achievement");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "unachievedAlertBackDescriptionForAchievement:", v11);
      v12 = objc_claimAutoreleasedReturnValue();
      goto LABEL_9;
    }
LABEL_11:
    v17 = 0;
    return v17;
  }
  if (!v9)
    goto LABEL_11;
  -[AAUIAchievementFormatter achLocProvider](self, "achLocProvider");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[AAUIAchievementFormatter achievement](self, "achievement");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "achievedAlertBackDescriptionForAchievement:sizeVariant:dateSizeVariant:", v11, v6, a3);
  v12 = objc_claimAutoreleasedReturnValue();
LABEL_9:
  v13 = (void *)v12;

  if (!v13)
    goto LABEL_11;
  objc_msgSend(v13, "localizedUppercaseString");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  v15 = objc_alloc(MEMORY[0x24BDD1458]);
  -[AAUIAchievementFormatter achBacksideAttributesWithSizeVariant:](self, "achBacksideAttributesWithSizeVariant:", v6);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = (void *)objc_msgSend(v15, "initWithString:attributes:", v14, v16);

  return v17;
}

- (id)localizedAttributedBacksideStringWithDateSizeVariant:(int64_t)a3
{
  int64_t v5;
  uint64_t v6;
  void *v7;
  int v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;

  v5 = -[AAUIAchievementFormatter style](self, "style");
  if (v5 == 2)
    v6 = 1;
  else
    v6 = 2 * (v5 != 1);
  -[AAUIAchievementFormatter achievement](self, "achievement");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "unearned");

  -[AAUIAchievementFormatter achLocProvider](self, "achLocProvider");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    if (v9)
    {
      -[AAUIAchievementFormatter achLocProvider](self, "achLocProvider");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[AAUIAchievementFormatter achievement](self, "achievement");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "unachievedAlertBackDescriptionForAchievement:", v11);
      v12 = objc_claimAutoreleasedReturnValue();
      goto LABEL_9;
    }
LABEL_11:
    v17 = 0;
    return v17;
  }
  if (!v9)
    goto LABEL_11;
  -[AAUIAchievementFormatter achLocProvider](self, "achLocProvider");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[AAUIAchievementFormatter achievement](self, "achievement");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "achievedAlertBackDescriptionForAchievement:sizeVariant:dateSizeVariant:", v11, v6, a3);
  v12 = objc_claimAutoreleasedReturnValue();
LABEL_9:
  v13 = (void *)v12;

  if (!v13)
    goto LABEL_11;
  objc_msgSend(v13, "localizedUppercaseString");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  v15 = objc_alloc(MEMORY[0x24BDD1458]);
  -[AAUIAchievementFormatter backsideAttributesWithSizeVariant:](self, "backsideAttributesWithSizeVariant:", v6);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = (void *)objc_msgSend(v15, "initWithString:attributes:", v14, v16);

  return v17;
}

- (id)localizedAttributedBacksideString
{
  void *v3;
  void *v4;

  -[AAUIAchievementFormatter achLocProvider](self, "achLocProvider");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[AAUIAchievementFormatter achLocalizedAttributedBacksideStringWithDateSizeVariant:](self, "achLocalizedAttributedBacksideStringWithDateSizeVariant:", 0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = 0;
  }
  return v4;
}

- (id)localizedAttributedShortenedBacksideString
{
  void *v3;
  void *v4;

  -[AAUIAchievementFormatter achLocProvider](self, "achLocProvider");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[AAUIAchievementFormatter achLocalizedAttributedBacksideStringWithDateSizeVariant:](self, "achLocalizedAttributedBacksideStringWithDateSizeVariant:", 2);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = 0;
  }
  return v4;
}

- (BOOL)formatsForFriend
{
  return self->_formatsForFriend;
}

- (void)setFormatsForFriend:(BOOL)a3
{
  self->_formatsForFriend = a3;
}

- (ACHAchievement)achievement
{
  return self->_achievement;
}

- (void)setAchievement:(id)a3
{
  objc_storeStrong((id *)&self->_achievement, a3);
}

- (ACHAchievementLocalizationProvider)achLocProvider
{
  return self->_achLocProvider;
}

- (void)setAchLocProvider:(id)a3
{
  objc_storeStrong((id *)&self->_achLocProvider, a3);
}

- (int64_t)style
{
  return self->_style;
}

- (void)setStyle:(int64_t)a3
{
  self->_style = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_achLocProvider, 0);
  objc_storeStrong((id *)&self->_achievement, 0);
}

- (void)localizedAttributedCombinedStringShowingProgress:(void *)a1 .cold.1(void *a1, NSObject *a2)
{
  void *v3;
  void *v4;
  int v5;
  void *v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a1, "achievement");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "template");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = 138412290;
  v6 = v4;
  _os_log_error_impl(&dword_21CC08000, a2, OS_LOG_TYPE_ERROR, "Unexpectedly found nil title string; falling back to empty string for achievement:\n%@",
    (uint8_t *)&v5,
    0xCu);

}

@end
