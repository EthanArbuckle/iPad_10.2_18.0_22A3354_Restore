@implementation MTEpisodeLockupAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("MTEpisodeLockup");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("MTEpisodeLockup"), CFSTR("episode"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("MTEpisodeLockup"), CFSTR("actionButton"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("MTEpisodeLockup"), CFSTR("metadataLabel"), "@", 0);
  objc_msgSend(v3, "validateClass:hasProperty:withType:", CFSTR("MTEpisode"), CFSTR("title"), "@");
  objc_msgSend(v3, "validateClass:hasProperty:withType:", CFSTR("MTEpisode"), CFSTR("pubDate"), "d");
  objc_msgSend(v3, "validateClass:hasProperty:withType:", CFSTR("MTEpisode"), CFSTR("duration"), "d");
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("MTEpisode"), CFSTR("timeRemaining"), "d", 0);
  objc_msgSend(v3, "validateClass:hasProperty:withType:", CFSTR("MTEpisode"), CFSTR("video"), "B");
  objc_msgSend(v3, "validateClass:hasProperty:withType:", CFSTR("MTEpisode"), CFSTR("audio"), "B");
  objc_msgSend(v3, "validateClass:hasProperty:withType:", CFSTR("MTEpisode"), CFSTR("explicit"), "B");
  objc_msgSend(v3, "validateClass:hasProperty:withType:", CFSTR("MTEpisode"), CFSTR("saved"), "B");
  objc_msgSend(v3, "validateClass:hasProperty:withType:", CFSTR("MTEpisode"), CFSTR("byteSize"), "q");
  objc_msgSend(v3, "validateClass:hasProperty:customGetter:customSetter:withType:", CFSTR("MTEpisodeLockup"), CFSTR("currentPlayerItem"), CFSTR("isCurrentPlayerItem"), 0, "B");
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("MTEpisode"), CFSTR("isUnplayed"), "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("MTEpisode"), CFSTR("isPartiallyPlayed"), "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("MTEpisode"), CFSTR("isPlayed"), "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("MTEpisodeLockup"), CFSTR("iconView"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("MTEpisodeStateView"), CFSTR("_streaming"), "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("MTEpisodeStateView"), CFSTR("_document"), "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("MTEpisodeStateView"), CFSTR("_error"), "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("MTEpisodeStateView"), CFSTR("_airplaneMode"), "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("MTEpisodeLockup"), CFSTR("updateIsCurrentPlayerItemState"), "B", 0);

}

- (id)accessibilityLabel
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  double v13;
  double v14;
  double v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  __CFString *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;

  -[MTEpisodeLockupAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("episode"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  objc_msgSend(v3, "safeValueForKey:", CFSTR("title"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilityCastAsClass();
  v35 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  objc_msgSend(v3, "safeValueForKey:", CFSTR("author"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilityCastAsClass();
  v6 = objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  objc_msgSend(v3, "safeValueForKey:", CFSTR("bestDescription"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilityCastAsClass();
  v8 = objc_claimAutoreleasedReturnValue();

  v9 = (void *)MEMORY[0x24BDD1500];
  objc_opt_class();
  objc_msgSend(v3, "valueForKey:", CFSTR("pubDate"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilityCastAsClass();
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "localizedStringFromDate:dateStyle:timeStyle:", v11, 2, 1);
  v12 = objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "safeDoubleForKey:", CFSTR("duration"));
  v14 = v13;
  objc_msgSend(v3, "safeDoubleForKey:", CFSTR("timeRemaining"));
  v38 = (void *)v12;
  if (vabdd_f64(v14, v15) >= 0.001)
  {
    v17 = (void *)MEMORY[0x24BDD17C8];
    accessibilityLocalizedString(CFSTR("episode.time.remaining"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    AXDurationStringForDuration();
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "stringWithFormat:", v18, v19);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v16 = 0;
  }
  if (objc_msgSend(v3, "safeBoolForKey:", CFSTR("video")))
  {
    accessibilityLocalizedString(CFSTR("is.video"));
    v37 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v37 = 0;
  }
  if (objc_msgSend(v3, "safeBoolForKey:", CFSTR("audio")))
  {
    accessibilityLocalizedString(CFSTR("is.audio"));
    v32 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v32 = 0;
  }
  if (objc_msgSend(v3, "safeBoolForKey:", CFSTR("explicit")))
  {
    accessibilityLocalizedString(CFSTR("explicit"));
    v33 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v33 = 0;
  }
  if (objc_msgSend(v3, "safeBoolForKey:", CFSTR("saved")))
  {
    accessibilityLocalizedString(CFSTR("saved"));
    v31 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v31 = 0;
  }
  if (objc_msgSend(v3, "safeIntegerForKey:", CFSTR("byteSize")) <= 0)
    accessibilityLocalizedString(CFSTR("unknown.size"));
  else
    AXFormatByteSize();
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  if ((-[MTEpisodeLockupAccessibility safeBoolForKey:](self, "safeBoolForKey:", CFSTR("isCurrentPlayerItem")) & 1) != 0)
  {
    v21 = CFSTR("now.playing");
LABEL_27:
    accessibilityLocalizedString(v21);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_28;
  }
  if ((objc_msgSend(v3, "safeBoolForKey:", CFSTR("isUnplayed")) & 1) != 0)
  {
    v21 = CFSTR("unplayed");
    goto LABEL_27;
  }
  if ((objc_msgSend(v3, "safeBoolForKey:", CFSTR("isPartiallyPlayed")) & 1) != 0)
  {
    v21 = CFSTR("partial.play");
    goto LABEL_27;
  }
  if (objc_msgSend(v3, "safeBoolForKey:", CFSTR("isPlayed")))
  {
    v21 = CFSTR("played");
    goto LABEL_27;
  }
  v22 = 0;
LABEL_28:
  -[MTEpisodeLockupAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("iconView"));
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v23, "safeBoolForKey:", CFSTR("_streaming")))
  {
    accessibilityLocalizedString(CFSTR("streaming"));
    v24 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v24 = 0;
  }
  v36 = (void *)v6;
  if (objc_msgSend(v23, "safeBoolForKey:", CFSTR("_document")))
  {
    accessibilityLocalizedString(CFSTR("document"));
    v25 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v25 = 0;
  }
  v26 = (void *)v8;
  if (objc_msgSend(v23, "safeBoolForKey:", CFSTR("_error")))
  {
    accessibilityLocalizedString(CFSTR("error"));
    v27 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v27 = 0;
  }
  if (objc_msgSend(v23, "safeBoolForKey:", CFSTR("_airplaneMode")))
  {
    accessibilityLocalizedString(CFSTR("airplane.mode"));
    v28 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v28 = 0;
  }
  AXDurationStringForDuration();
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAXStringForVariables();
  v34 = (void *)objc_claimAutoreleasedReturnValue();

  return v34;
}

- (BOOL)accessibilityPerformMoreActions:(id)a3
{
  void *v3;

  -[MTEpisodeLockupAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("actionButton"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "accessibilityActivate");

  return 1;
}

- (id)_privateAccessibilityCustomActions
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;

  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[MTEpisodeLockupAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("actionButton"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4 && (objc_msgSend(v4, "isHidden") & 1) == 0)
  {
    v6 = objc_alloc(MEMORY[0x24BDF6788]);
    accessibilityLocalizedString(CFSTR("more.actions"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (void *)objc_msgSend(v6, "initWithName:target:selector:", v7, self, sel_accessibilityPerformMoreActions_);

    objc_msgSend(v3, "addObject:", v8);
  }

  return v3;
}

- (id)automationElements
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)MTEpisodeLockupAccessibility;
  -[MTEpisodeLockupAccessibility automationElements](&v11, sel_automationElements);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "mutableCopy");
  v5 = v4;
  if (v4)
  {
    v6 = v4;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v6 = (id)objc_claimAutoreleasedReturnValue();
  }
  v7 = v6;

  objc_opt_class();
  -[MTEpisodeLockupAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("metadataLabel"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilityCastAsClass();
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9 && (objc_msgSend(v7, "containsObject:", v9) & 1) == 0)
    objc_msgSend(v7, "addObject:", v9);

  return v7;
}

- (BOOL)updateIsCurrentPlayerItemState
{
  BOOL v2;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)MTEpisodeLockupAccessibility;
  v2 = -[MTEpisodeLockupAccessibility updateIsCurrentPlayerItemState](&v4, sel_updateIsCurrentPlayerItemState);
  UIAccessibilityPostNotification(*MEMORY[0x24BDF72C8], 0);
  return v2;
}

@end
