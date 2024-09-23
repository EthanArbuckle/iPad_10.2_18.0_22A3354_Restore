@implementation ARQuickLookPreviewItem

- (ARQuickLookPreviewItem)initWithFileAtURL:(NSURL *)url
{
  NSURL *v5;
  ARQuickLookPreviewItem *v6;
  ARQuickLookPreviewItem *v7;
  NSURL *canonicalWebPageURL;
  objc_super v10;

  v5 = url;
  v10.receiver = self;
  v10.super_class = (Class)ARQuickLookPreviewItem;
  v6 = -[ARQuickLookPreviewItem init](&v10, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_fileURL, url);
    canonicalWebPageURL = v7->_canonicalWebPageURL;
    v7->_canonicalWebPageURL = 0;

    *(_WORD *)&v7->_allowsContentScaling = 1;
    v7->_forceIgnoreMuteSwitch = 0;
  }

  return v7;
}

- (NSDictionary)previewOptions
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v10[4];
  _QWORD v11[5];

  v11[4] = *MEMORY[0x1E0C80C00];
  v10[0] = CFSTR("ARQLCanonicalWebPageURL");
  -[ARQuickLookPreviewItem canonicalWebPageURL](self, "canonicalWebPageURL");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (!v3)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v11[0] = v4;
  v10[1] = CFSTR("allowObjectScaling");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[ARQuickLookPreviewItem allowsContentScaling](self, "allowsContentScaling"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v11[1] = v5;
  v10[2] = CFSTR("ARQLWantsStatusPillHiddenKey");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[ARQuickLookPreviewItem wantsStatusPillHidden](self, "wantsStatusPillHidden"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v11[2] = v6;
  v10[3] = CFSTR("ARQLForceIgnoreMuteSwitchKey");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[ARQuickLookPreviewItem forceIgnoreMuteSwitch](self, "forceIgnoreMuteSwitch"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v11[3] = v7;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v11, v10, 4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
  return (NSDictionary *)v8;
}

- (NSURL)canonicalWebPageURL
{
  return self->_canonicalWebPageURL;
}

- (void)setCanonicalWebPageURL:(NSURL *)canonicalWebPageURL
{
  objc_storeStrong((id *)&self->_canonicalWebPageURL, canonicalWebPageURL);
}

- (BOOL)allowsContentScaling
{
  return self->_allowsContentScaling;
}

- (void)setAllowsContentScaling:(BOOL)allowsContentScaling
{
  self->_allowsContentScaling = allowsContentScaling;
}

- (NSURL)fileURL
{
  return self->_fileURL;
}

- (void)setFileURL:(id)a3
{
  objc_storeStrong((id *)&self->_fileURL, a3);
}

- (BOOL)wantsStatusPillHidden
{
  return self->_wantsStatusPillHidden;
}

- (void)setWantsStatusPillHidden:(BOOL)a3
{
  self->_wantsStatusPillHidden = a3;
}

- (BOOL)forceIgnoreMuteSwitch
{
  return self->_forceIgnoreMuteSwitch;
}

- (void)setForceIgnoreMuteSwitch:(BOOL)a3
{
  self->_forceIgnoreMuteSwitch = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fileURL, 0);
  objc_storeStrong((id *)&self->_canonicalWebPageURL, 0);
}

@end
