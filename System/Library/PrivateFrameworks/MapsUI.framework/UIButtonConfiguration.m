@implementation UIButtonConfiguration

id __59__UIButtonConfiguration_MapsUI___setupButtonConfiguration___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;

  v3 = (void *)objc_msgSend(a2, "mutableCopy");
  objc_msgSend(v3, "setObject:forKeyedSubscript:", *(_QWORD *)(a1 + 32), *MEMORY[0x1E0DC1138]);
  v4 = (void *)objc_msgSend(v3, "copy");

  return v4;
}

uint64_t __83__UIButtonConfiguration_MapsUI___mapsui_textButtonConfigurationWithFont_textColor___block_invoke()
{
  return objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
}

id __83__UIButtonConfiguration_MapsUI___mapsui_textButtonConfigurationWithFont_textColor___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;

  v3 = (void *)objc_msgSend(a2, "mutableCopy");
  objc_msgSend(v3, "setObject:forKeyedSubscript:", *(_QWORD *)(a1 + 32), *MEMORY[0x1E0DC1138]);
  objc_msgSend(v3, "setObject:forKeyedSubscript:", *(_QWORD *)(a1 + 40), *MEMORY[0x1E0DC1140]);
  if (UIAccessibilityButtonShapesEnabled())
    objc_msgSend(v3, "setObject:forKeyedSubscript:", &unk_1E2E554D0, *MEMORY[0x1E0DC1248]);
  v4 = (void *)objc_msgSend(v3, "copy");

  return v4;
}

id __88__UIButtonConfiguration_MUPlaceHeaderButtonExtras___setupDirectionsButtonConfiguration___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)objc_msgSend(a2, "mutableCopy");
  objc_msgSend(MEMORY[0x1E0DC1350], "preferredFontForTextStyle:", *MEMORY[0x1E0DC4AD0]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setObject:forKeyedSubscript:", v3, *MEMORY[0x1E0DC1138]);

  v4 = (void *)objc_msgSend(v2, "copy");
  return v4;
}

@end
