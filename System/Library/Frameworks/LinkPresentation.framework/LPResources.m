@implementation LPResources

+ (id)metadataExtractorJS
{
  if (metadataExtractorJS_onceToken != -1)
    dispatch_once(&metadataExtractorJS_onceToken, &__block_literal_global_25);
  return (id)metadataExtractorJS_metadataExtractorJS;
}

void __34__LPResources_metadataExtractorJS__block_invoke()
{
  id v0;
  id v1;
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  id v6;

  v0 = objc_alloc(MEMORY[0x1E0CB3940]);
  v1 = objc_alloc(MEMORY[0x1E0DC3388]);
  linkPresentationBundle();
  v6 = (id)objc_claimAutoreleasedReturnValue();
  v2 = (void *)objc_msgSend(v1, "initWithName:bundle:", CFSTR("MetadataExtractor"));
  objc_msgSend(v2, "data");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v0, "initWithData:encoding:", v3, 4);
  v5 = (void *)metadataExtractorJS_metadataExtractorJS;
  metadataExtractorJS_metadataExtractorJS = v4;

}

+ (id)chevron
{
  void *v2;

  +[LPImage _systemImageNamed:](LPImage, "_systemImageNamed:", CFSTR("chevron.forward"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "set_alternateHTMLImageGenerator:", &__block_literal_global_4);
  return v2;
}

id __22__LPResources_chevron__block_invoke()
{
  return +[LPImage _PNGImageNamed:template:properties:](LPImage, "_PNGImageNamed:template:properties:", CFSTR("Chevron"), 1, 0);
}

+ (id)safariIcon
{
  void *v2;

  +[LPImage _systemImageNamed:](LPImage, "_systemImageNamed:", CFSTR("safari"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "set_alternateHTMLImageGenerator:", &__block_literal_global_10);
  return v2;
}

id __25__LPResources_safariIcon__block_invoke()
{
  void *v0;
  void *v1;

  +[LPImage _PNGImageNamed:](LPImage, "_PNGImageNamed:", CFSTR("Safari"));
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "_asTemplate");
  v1 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v1, "set_fallbackIcon:", 1);
  return v1;
}

+ (id)pagesIcon
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v2 = (void *)pagesIcon;
  if (!pagesIcon)
  {
    imagePropertiesForLocalApplicationIcon();
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    +[LPImage _PNGImageNamed:template:properties:](LPImage, "_PNGImageNamed:template:properties:", CFSTR("Pages"), 0, v3);
    v4 = objc_claimAutoreleasedReturnValue();
    v5 = (void *)pagesIcon;
    pagesIcon = v4;

    remoteURL(1, CFSTR("https://www.icloud.com/mail_resources/app_icons/pages.png"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v6;
    remoteURL(2, CFSTR("https://www.icloud.com/mail_resources/app_icons/pages@2x.png"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v7;
    remoteURL(3, CFSTR("https://www.icloud.com/mail_resources/app_icons/pages@3x.png"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = v8;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v11, 3);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)pagesIcon, "set_remoteURLsForEmailCompatibleOutput:", v9, v11, v12);

    v2 = (void *)pagesIcon;
  }
  return v2;
}

+ (id)notesIcon
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v2 = (void *)notesIcon;
  if (!notesIcon)
  {
    +[LPImage _PNGImageNamed:template:properties:](LPImage, "_PNGImageNamed:template:properties:", CFSTR("Notes"), 0, 0);
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = (void *)notesIcon;
    notesIcon = v3;

    objc_msgSend((id)notesIcon, "set_precomposedAppIcon:", 1);
    remoteURL(1, CFSTR("https://www.icloud.com/mail_resources/app_icons/notes.png"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v5;
    remoteURL(2, CFSTR("https://www.icloud.com/mail_resources/app_icons/notes@2x.png"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v6;
    remoteURL(3, CFSTR("https://www.icloud.com/mail_resources/app_icons/notes@3x.png"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v7;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v10, 3);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)notesIcon, "set_remoteURLsForEmailCompatibleOutput:", v8, v10, v11);

    v2 = (void *)notesIcon;
  }
  return v2;
}

+ (id)numbersIcon
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v2 = (void *)numbersIcon;
  if (!numbersIcon)
  {
    imagePropertiesForLocalApplicationIcon();
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    +[LPImage _PNGImageNamed:template:properties:](LPImage, "_PNGImageNamed:template:properties:", CFSTR("Numbers"), 0, v3);
    v4 = objc_claimAutoreleasedReturnValue();
    v5 = (void *)numbersIcon;
    numbersIcon = v4;

    remoteURL(1, CFSTR("https://www.icloud.com/mail_resources/app_icons/numbers.png"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v6;
    remoteURL(2, CFSTR("https://www.icloud.com/mail_resources/app_icons/numbers@2x.png"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v7;
    remoteURL(3, CFSTR("https://www.icloud.com/mail_resources/app_icons/numbers@3x.png"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = v8;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v11, 3);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)numbersIcon, "set_remoteURLsForEmailCompatibleOutput:", v9, v11, v12);

    v2 = (void *)numbersIcon;
  }
  return v2;
}

+ (id)keynoteIcon
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v2 = (void *)keynoteIcon;
  if (!keynoteIcon)
  {
    imagePropertiesForLocalApplicationIcon();
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    +[LPImage _PNGImageNamed:template:properties:](LPImage, "_PNGImageNamed:template:properties:", CFSTR("Keynote"), 0, v3);
    v4 = objc_claimAutoreleasedReturnValue();
    v5 = (void *)keynoteIcon;
    keynoteIcon = v4;

    remoteURL(1, CFSTR("https://www.icloud.com/mail_resources/app_icons/keynote.png"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v6;
    remoteURL(2, CFSTR("https://www.icloud.com/mail_resources/app_icons/keynote@2x.png"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v7;
    remoteURL(3, CFSTR("https://www.icloud.com/mail_resources/app_icons/keynote@3x.png"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = v8;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v11, 3);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)keynoteIcon, "set_remoteURLsForEmailCompatibleOutput:", v9, v11, v12);

    v2 = (void *)keynoteIcon;
  }
  return v2;
}

+ (id)iCloudDriveIcon
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v2 = (void *)iCloudDriveIcon;
  if (!iCloudDriveIcon)
  {
    +[LPImage _PNGImageNamed:template:properties:](LPImage, "_PNGImageNamed:template:properties:", CFSTR("iCloudDrive"), 0, 0);
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = (void *)iCloudDriveIcon;
    iCloudDriveIcon = v3;

    objc_msgSend((id)iCloudDriveIcon, "set_precomposedAppIcon:", 1);
    remoteURL(1, CFSTR("https://www.icloud.com/mail_resources/app_icons/icloud.png"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v5;
    remoteURL(2, CFSTR("https://www.icloud.com/mail_resources/app_icons/icloud@2x.png"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v6;
    remoteURL(3, CFSTR("https://www.icloud.com/mail_resources/app_icons/icloud@3x.png"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v7;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v10, 3);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)iCloudDriveIcon, "set_remoteURLsForEmailCompatibleOutput:", v8, v10, v11);

    v2 = (void *)iCloudDriveIcon;
  }
  return v2;
}

+ (id)remindersIcon
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v2 = (void *)remindersIcon;
  if (!remindersIcon)
  {
    +[LPImage _PNGImageNamed:template:properties:](LPImage, "_PNGImageNamed:template:properties:", CFSTR("Reminders"), 0, 0);
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = (void *)remindersIcon;
    remindersIcon = v3;

    objc_msgSend((id)remindersIcon, "set_precomposedAppIcon:", 1);
    remoteURL(1, CFSTR("https://www.icloud.com/mail_resources/app_icons/reminders.png"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v5;
    remoteURL(2, CFSTR("https://www.icloud.com/mail_resources/app_icons/reminders@2x.png"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v6;
    remoteURL(3, CFSTR("https://www.icloud.com/mail_resources/app_icons/reminders@3x.png"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v7;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v10, 3);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)remindersIcon, "set_remoteURLsForEmailCompatibleOutput:", v8, v10, v11);

    v2 = (void *)remindersIcon;
  }
  return v2;
}

+ (id)searchGlyph
{
  void *v2;

  +[LPImage _systemImageNamed:](LPImage, "_systemImageNamed:", CFSTR("magnifyingglass"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "set_alternateHTMLImageGenerator:", &__block_literal_global_64);
  return v2;
}

id __26__LPResources_searchGlyph__block_invoke()
{
  return +[LPImage _PNGImageNamed:template:properties:](LPImage, "_PNGImageNamed:template:properties:", CFSTR("Search"), 1, 0);
}

+ (id)playButton
{
  void *v2;

  +[LPImage _systemImageNamed:](LPImage, "_systemImageNamed:", CFSTR("play.fill"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "set_alternateHTMLImageGenerator:", &__block_literal_global_69);
  return v2;
}

id __25__LPResources_playButton__block_invoke()
{
  return +[LPImage _PNGImageNamed:](LPImage, "_PNGImageNamed:", CFSTR("Play"));
}

+ (id)pauseButton
{
  void *v2;

  +[LPImage _systemImageNamed:](LPImage, "_systemImageNamed:", CFSTR("pause.fill"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "set_alternateHTMLImageGenerator:", &__block_literal_global_74);
  return v2;
}

id __26__LPResources_pauseButton__block_invoke()
{
  return +[LPImage _PNGImageNamed:](LPImage, "_PNGImageNamed:", CFSTR("Pause"));
}

+ (id)muteButton
{
  void *v2;

  +[LPImage _systemImageNamed:](LPImage, "_systemImageNamed:", CFSTR("speaker.slash.fill"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "set_alternateHTMLImageGenerator:", &__block_literal_global_79);
  return v2;
}

id __25__LPResources_muteButton__block_invoke()
{
  return +[LPImage _PNGImageNamed:](LPImage, "_PNGImageNamed:", CFSTR("Mute"));
}

+ (id)unmuteButton
{
  void *v2;

  +[LPImage _systemImageNamed:](LPImage, "_systemImageNamed:", CFSTR("speaker.wave.2.fill"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "set_alternateHTMLImageGenerator:", &__block_literal_global_84);
  return v2;
}

id __27__LPResources_unmuteButton__block_invoke()
{
  return +[LPImage _PNGImageNamed:](LPImage, "_PNGImageNamed:", CFSTR("Unmute"));
}

+ (id)arKitButton
{
  return +[LPImage _systemImageNamed:](LPImage, "_systemImageNamed:", CFSTR("arkit"));
}

+ (id)faceTimeIcon
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v2 = (void *)faceTimeIcon;
  if (!faceTimeIcon)
  {
    +[LPImage _systemImageNamed:](LPImage, "_systemImageNamed:", CFSTR("video.fill"));
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = (void *)faceTimeIcon;
    faceTimeIcon = v3;

    remoteURL(1, CFSTR("https://www.icloud.com/mail_resources/app_icons/FaceTime_icon_white_1x.png"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v5;
    remoteURL(2, CFSTR("https://www.icloud.com/mail_resources/app_icons/FaceTime_icon_white_2x.png"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v6;
    remoteURL(3, CFSTR("https://www.icloud.com/mail_resources/app_icons/FaceTime_icon_white_3x.png"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v7;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v10, 3);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)faceTimeIcon, "set_remoteURLsForEmailCompatibleOutput:", v8, v10, v11);

    v2 = (void *)faceTimeIcon;
  }
  return v2;
}

+ (id)freeformIcon
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v2 = (void *)freeformIcon;
  if (!freeformIcon)
  {
    imagePropertiesForLocalApplicationIcon();
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    +[LPImage _PNGImageNamed:template:properties:](LPImage, "_PNGImageNamed:template:properties:", CFSTR("Freeform"), 0, v3);
    v4 = objc_claimAutoreleasedReturnValue();
    v5 = (void *)freeformIcon;
    freeformIcon = v4;

    remoteURL(1, CFSTR("https://www.icloud.com/mail_resources/app_icons/freeform.png"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v6;
    remoteURL(2, CFSTR("https://www.icloud.com/mail_resources/app_icons/freeform@2x.png"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v7;
    remoteURL(3, CFSTR("https://www.icloud.com/mail_resources/app_icons/freeform@3x.png"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = v8;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v11, 3);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)freeformIcon, "set_remoteURLsForEmailCompatibleOutput:", v9, v11, v12);

    v2 = (void *)freeformIcon;
  }
  return v2;
}

+ (id)_safariAppIconForSize:(double)a3
{
  void *v4;
  id v5;
  double v6;
  void *v7;
  void *v8;
  uint64_t v9;
  LPImage *v10;
  void *v11;
  id v12;

  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D3A820]), "initWithBundleIdentifier:", CFSTR("com.apple.mobilesafari"));
  v5 = objc_alloc(MEMORY[0x1E0D3A830]);
  objc_msgSend(MEMORY[0x1E0DC3BF8], "_lp_mainScreenScale");
  v7 = (void *)objc_msgSend(v5, "initWithSize:scale:", a3, a3, v6);
  objc_msgSend(v7, "setShouldApplyMask:", 0);
  objc_msgSend(v4, "prepareImageForDescriptor:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "CGImage");
  v10 = [LPImage alloc];
  imagePropertiesForLocalApplicationIcon();
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = -[LPImage _initWithCGImage:properties:](v10, "_initWithCGImage:properties:", v9, v11);

  return v12;
}

+ (id)safariAppIconBadge
{
  void *v3;
  uint64_t v4;
  void *v5;

  v3 = (void *)safariAppIconBadge;
  if (!safariAppIconBadge)
  {
    +[LPTheme badgeIconSizeInPoints](LPTheme, "badgeIconSizeInPoints");
    objc_msgSend(a1, "_safariAppIconForSize:");
    v4 = objc_claimAutoreleasedReturnValue();
    v5 = (void *)safariAppIconBadge;
    safariAppIconBadge = v4;

    v3 = (void *)safariAppIconBadge;
  }
  return v3;
}

+ (id)safariAppIcon
{
  void *v3;
  uint64_t v4;
  void *v5;

  v3 = (void *)safariAppIcon;
  if (!safariAppIcon)
  {
    +[LPTheme largestIconSizeInPoints](LPTheme, "largestIconSizeInPoints");
    objc_msgSend(a1, "_safariAppIconForSize:");
    v4 = objc_claimAutoreleasedReturnValue();
    v5 = (void *)safariAppIcon;
    safariAppIcon = v4;

    v3 = (void *)safariAppIcon;
  }
  return v3;
}

+ (id)fileIcon
{
  return +[LPImage _systemImageNamed:](LPImage, "_systemImageNamed:", CFSTR("doc"));
}

+ (id)textIcon
{
  return +[LPImage _systemImageNamed:](LPImage, "_systemImageNamed:", CFSTR("text.cursor"));
}

+ (id)iCloudIcon
{
  return +[LPImage _systemImageNamed:](LPImage, "_systemImageNamed:", CFSTR("icloud"));
}

+ (id)mapIcon
{
  return +[LPImage _systemImageNamed:](LPImage, "_systemImageNamed:", CFSTR("map"));
}

+ (id)linkIcon
{
  return +[LPImage _systemImageNamed:](LPImage, "_systemImageNamed:", CFSTR("link"));
}

+ (id)telephoneIcon
{
  return +[LPImage _systemImageNamed:](LPImage, "_systemImageNamed:", CFSTR("phone"));
}

+ (id)transportDriveIcon
{
  return +[LPImage _systemImageNamed:](LPImage, "_systemImageNamed:", CFSTR("car.fill"));
}

+ (id)transportTransitIcon
{
  return +[LPImage _systemImageNamed:](LPImage, "_systemImageNamed:", CFSTR("tram.fill"));
}

+ (id)transportBicycleIcon
{
  return +[LPImage _systemImageNamed:](LPImage, "_systemImageNamed:", CFSTR("bicycle"));
}

+ (id)transportWalkIcon
{
  return +[LPImage _systemImageNamed:](LPImage, "_systemImageNamed:", CFSTR("figure.walk"));
}

+ (id)openQuote
{
  return +[LPImage _PDFImageNamed:template:](LPImage, "_PDFImageNamed:template:", CFSTR("OpenQuote"), 1);
}

+ (id)closeQuote
{
  return +[LPImage _PDFImageNamed:template:](LPImage, "_PDFImageNamed:template:", CFSTR("CloseQuote"), 1);
}

+ (id)appClipIcon
{
  return +[LPImage _systemImageNamed:](LPImage, "_systemImageNamed:", CFSTR("bolt.fill"));
}

+ (id)passwordsInviteIcon
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  objc_msgSend(MEMORY[0x1E0DC3658], "tintColor");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3888], "configurationWithPointSize:weight:", (uint64_t)*MEMORY[0x1E0DC4B90], 60.0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3888], "configurationWithHierarchicalColor:", v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "configurationByApplyingConfiguration:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  +[LPImage _systemImageNamed:withSymbolConfiguration:](LPImage, "_systemImageNamed:withSymbolConfiguration:", CFSTR("person.2.badge.key.fill"), v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "set_isNonFallbackSymbolImage:", 1);

  return v6;
}

+ (id)linkBackgroundColor
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  id v7;

  objc_msgSend(MEMORY[0x1E0DC3658], "colorWithRed:green:blue:alpha:", 0.898, 0.901, 0.914, 1.0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3658], "colorWithRed:green:blue:alpha:", 0.361, 0.333, 0.325, 1.0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)linkBackgroundColor_color;
  if (!linkBackgroundColor_color)
  {
    dynamicColorWithVariants((uint64_t)CFSTR("LPLinkBackgroundColor"), v2, 0, v3, 0);
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = (void *)linkBackgroundColor_color;
    linkBackgroundColor_color = v5;

    v4 = (void *)linkBackgroundColor_color;
  }
  v7 = v4;

  return v7;
}

+ (id)linkMediaBackgroundColor
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  id v7;

  objc_msgSend(MEMORY[0x1E0DC3658], "colorWithWhite:alpha:", 0.965, 1.0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3658], "colorWithRed:green:blue:alpha:", 0.255, 0.235, 0.227, 1.0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)linkMediaBackgroundColor_color;
  if (!linkMediaBackgroundColor_color)
  {
    dynamicColorWithVariants((uint64_t)CFSTR("LPLinkMediaBackgroundColor"), v2, 0, v3, 0);
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = (void *)linkMediaBackgroundColor_color;
    linkMediaBackgroundColor_color = v5;

    v4 = (void *)linkMediaBackgroundColor_color;
  }
  v7 = v4;

  return v7;
}

+ (id)tapToLoadHighlightColor
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  id v7;

  objc_msgSend(MEMORY[0x1E0DC3658], "colorWithWhite:alpha:", 1.0, 0.7);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3658], "colorWithWhite:alpha:", 1.0, 0.2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)tapToLoadHighlightColor_color;
  if (!tapToLoadHighlightColor_color)
  {
    dynamicColorWithVariants((uint64_t)CFSTR("LPTapToLoadHighlightColor"), v2, 0, v3, 0);
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = (void *)tapToLoadHighlightColor_color;
    tapToLoadHighlightColor_color = v5;

    v4 = (void *)tapToLoadHighlightColor_color;
  }
  v7 = v4;

  return v7;
}

+ (id)tweetBackgroundColor
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  id v9;

  objc_msgSend(MEMORY[0x1E0DC3658], "colorWithRed:green:blue:alpha:", 0.92, 0.97, 1.0, 1.0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3658], "colorWithRed:green:blue:alpha:", 0.878, 0.929, 0.961, 1.0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3658], "colorWithRed:green:blue:alpha:", 0.012, 0.153, 0.247, 1.0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3658], "colorWithRed:green:blue:alpha:", 0.051, 0.192, 0.282, 1.0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)tweetBackgroundColor_color;
  if (!tweetBackgroundColor_color)
  {
    dynamicColorWithVariants((uint64_t)CFSTR("LPTweetBackgroundColor"), v2, v3, v4, v5);
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = (void *)tweetBackgroundColor_color;
    tweetBackgroundColor_color = v7;

    v6 = (void *)tweetBackgroundColor_color;
  }
  v9 = v6;

  return v9;
}

+ (id)weiboBackgroundColor
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  id v9;

  objc_msgSend(MEMORY[0x1E0DC3658], "colorWithRed:green:blue:alpha:", 1.0, 0.929, 0.878, 1.0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3658], "colorWithRed:green:blue:alpha:", 0.961, 0.89, 0.839, 1.0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3658], "colorWithRed:green:blue:alpha:", 0.259, 0.196, 0.196, 1.0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3658], "colorWithRed:green:blue:alpha:", 0.298, 0.231, 0.231, 1.0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)weiboBackgroundColor_color;
  if (!weiboBackgroundColor_color)
  {
    dynamicColorWithVariants((uint64_t)CFSTR("LPWeiboBackgroundColor"), v2, v3, v4, v5);
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = (void *)weiboBackgroundColor_color;
    weiboBackgroundColor_color = v7;

    v6 = (void *)weiboBackgroundColor_color;
  }
  v9 = v6;

  return v9;
}

+ (id)appleMusicKeyColor
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  id v9;

  objc_msgSend(MEMORY[0x1E0DC3658], "colorWithRed:green:blue:alpha:", 0.98, 0.137, 0.231, 1.0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3658], "colorWithRed:green:blue:alpha:", 0.839, 0.0, 0.09, 1.0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3658], "colorWithRed:green:blue:alpha:", 0.98, 0.176, 0.282, 1.0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3658], "colorWithRed:green:blue:alpha:", 0.98, 0.345, 0.416, 1.0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)appleMusicKeyColor_color;
  if (!appleMusicKeyColor_color)
  {
    dynamicColorWithVariants((uint64_t)CFSTR("LPAppleMusicKeyColor"), v2, v3, v4, v5);
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = (void *)appleMusicKeyColor_color;
    appleMusicKeyColor_color = v7;

    v6 = (void *)appleMusicKeyColor_color;
  }
  v9 = v6;

  return v9;
}

+ (void)clearCachedResources
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v2 = (void *)pagesIcon;
  pagesIcon = 0;

  v3 = (void *)notesIcon;
  notesIcon = 0;

  v4 = (void *)numbersIcon;
  numbersIcon = 0;

  v5 = (void *)keynoteIcon;
  keynoteIcon = 0;

  v6 = (void *)iCloudDriveIcon;
  iCloudDriveIcon = 0;

  v7 = (void *)remindersIcon;
  remindersIcon = 0;

  v8 = (void *)freeformIcon;
  freeformIcon = 0;

}

+ (id)faceTimeBackgroundColor
{
  return objc_msgSend((id)objc_opt_self(), sel_systemGreenColor);
}

@end
