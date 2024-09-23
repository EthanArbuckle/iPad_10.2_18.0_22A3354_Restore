@implementation _SFSiriReaderPlaybackRateController

- (NSArray)values
{
  return (NSArray *)&unk_1E4B27370;
}

- (BOOL)isSelectedValue:(id)a3
{
  float v3;
  float v4;
  void *v5;
  float v6;
  BOOL v7;

  objc_msgSend(a3, "floatValue");
  v4 = v3;
  objc_msgSend(MEMORY[0x1E0D4ED50], "sharedPlaybackController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "currentPlaybackRate");
  v7 = v4 == v6;

  return v7;
}

- (void)setSelectedValue:(id)a3
{
  float v4;
  id v5;

  objc_msgSend(a3, "floatValue");
  self->_playbackRate = v4;
  objc_msgSend(MEMORY[0x1E0D4ED50], "sharedPlaybackController");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setPlaybackRate:", self->_playbackRate);

}

- (BOOL)shouldSelectValue:(id)a3 forItem:(id)a4 groupItem:(id)a5
{
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v12;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x1E0C80C00];
  v6 = (void *)MEMORY[0x1E0CB3940];
  v7 = a5;
  objc_msgSend(v6, "stringWithFormat:", CFSTR("%@x"), a3, CFSTR("currentSpeakingRate"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = v8;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v13, &v12, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  WBSMakeAccessibilityIdentifier();
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setAccessibilityIdentifier:", v10);

  return 1;
}

- (id)attributedStringForValue:(id)a3
{
  id v4;
  id v5;
  double v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  v4 = a3;
  v5 = objc_alloc(MEMORY[0x1E0CB3498]);
  v7 = (void *)MEMORY[0x1E0CB3940];
  v8 = (void *)MEMORY[0x1E0CB37F0];
  if (v4)
  {
    objc_msgSend(MEMORY[0x1E0CB37F0], "localizedStringFromNumber:numberStyle:", v4, 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "stringWithFormat:", CFSTR("%@x"), v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (void *)objc_msgSend(v5, "initWithString:", v10);
  }
  else
  {
    *(float *)&v6 = self->_playbackRate;
    if (*(float *)&v6 == 0.0)
      *(float *)&v6 = 1.0;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v6);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "localizedStringFromNumber:numberStyle:", v9, 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "stringWithFormat:", CFSTR("%@x"), v10);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (void *)objc_msgSend(v5, "initWithString:", v12);

  }
  return v11;
}

- (id)textStyleForValue:(id)a3
{
  return (id)*MEMORY[0x1E0DC4A88];
}

- (id)accessibilityIdentifierForValue:(id)a3
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@x"), a3);
}

@end
