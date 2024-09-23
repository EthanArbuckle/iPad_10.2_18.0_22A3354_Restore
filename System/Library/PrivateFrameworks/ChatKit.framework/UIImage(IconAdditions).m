@implementation UIImage(IconAdditions)

- (uint64_t)isContentDiscarded
{
  return 0;
}

- (id)iconForInterfaceStyle:()IconAdditions
{
  void *v2;
  double v3;
  double v4;
  CGImage *v5;
  void *v6;
  double v8;

  objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "scale");
  v4 = v3;

  v8 = v4;
  objc_msgSend(MEMORY[0x1E0CEA638], "_iconVariantForUIApplicationIconFormat:scale:", 14, &v8);
  objc_msgSend(objc_retainAutorelease(a1), "CGImage");
  v5 = (CGImage *)LICreateIconForImage();
  objc_msgSend(MEMORY[0x1E0CEA638], "imageWithCGImage:scale:orientation:", v5, 0, v8);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  CGImageRelease(v5);
  return v6;
}

+ (id)badgeIconForImageNamed:()IconAdditions inBundle:
{
  void *v3;
  void *v4;

  if (a3)
  {
    objc_msgSend(MEMORY[0x1E0CEA638], "imageNamed:inBundle:");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "_applicationIconImageForFormat:precomposed:", 15, 1);
    v4 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v4 = 0;
  }
  return v4;
}

+ (id)placeholderExtensionIcon
{
  NSObject *v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  const void *v5;
  void *v6;
  uint64_t v8;
  uint8_t buf[16];

  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v0 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v0, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_18DFCD000, v0, OS_LOG_TYPE_INFO, "Generate placeholder image", buf, 2u);
    }

  }
  objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "scale");
  v3 = v2;

  v8 = v3;
  objc_msgSend(MEMORY[0x1E0CEA638], "_iconVariantForUIApplicationIconFormat:scale:", 14, &v8);
  v4 = LICreateDefaultIcon();
  if (v4)
  {
    v5 = (const void *)v4;
    objc_msgSend(MEMORY[0x1E0CEA638], "imageWithCGImage:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    CFRelease(v5);
  }
  else
  {
    v6 = 0;
  }
  return v6;
}

- (uint64_t)beginContentAccess
{
  return 1;
}

@end
