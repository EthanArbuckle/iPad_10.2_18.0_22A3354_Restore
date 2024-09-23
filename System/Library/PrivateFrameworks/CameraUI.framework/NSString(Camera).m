@implementation NSString(Camera)

- (id)cam_uppercaseStringWithPreferredLocale
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "preferredLocalizations");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "firstObject");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DC8], "localeWithLocaleIdentifier:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "uppercaseStringWithLocale:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)cam_capitalizedStringWithPreferredLocale
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "preferredLocalizations");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "firstObject");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DC8], "localeWithLocaleIdentifier:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "capitalizedStringWithLocale:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (id)cam_localizedTitleForMode:()Camera wantsCompactTitle:
{
  __CFString *v4;
  __CFString *v5;
  void *v6;

  switch(a3)
  {
    case 0:
      v4 = CFSTR("PHOTO");
      v5 = CFSTR("Title in Camera's mode switch for still photo mode.");
      goto LABEL_18;
    case 1:
      v4 = CFSTR("VIDEO");
      v5 = CFSTR("Title in Camera's mode switcher for video mode.");
      goto LABEL_18;
    case 2:
      v4 = CFSTR("SLALOM");
      v5 = CFSTR("Title in Camera's mode switcher for high frame rate video mode.");
      goto LABEL_18;
    case 3:
      v4 = CFSTR("PANO");
      v5 = CFSTR("Title in Camera's mode switcher for panorama mode.");
      goto LABEL_18;
    case 4:
      v4 = CFSTR("SQUARE");
      v5 = CFSTR("Title in Camera's mode switcher for square still photo mode.");
      goto LABEL_18;
    case 5:
      if (a4)
        v4 = CFSTR("TIMELAPSE_IPAD");
      else
        v4 = CFSTR("TIMELAPSE");
      v5 = CFSTR("Title in Camera's mode switcher for time-lapse mode.");
      goto LABEL_18;
    case 6:
      v4 = CFSTR("PORTRAIT");
      v5 = CFSTR("Title in Camera's mode switch for portrait mode.");
      goto LABEL_18;
    case 7:
      v4 = CFSTR("CINEMATIC");
      goto LABEL_17;
    case 8:
      v4 = CFSTR("SPATIAL_VIDEO_MODE_TITLE");
      goto LABEL_17;
    case 9:
      v4 = CFSTR("SPATIAL_PHOTO_MODE_TITLE");
LABEL_17:
      v5 = 0;
LABEL_18:
      CAMLocalizedFrameworkString(v4, v5);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    default:
      v6 = 0;
      break;
  }
  return v6;
}

@end
