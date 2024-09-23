@implementation AXSSSwitchControlSettings

- (AXSSSwitchControlSettings)init
{
  AXSSSwitchControlSettings *v2;
  AXSSSwitchControlSettings *v3;
  NSArray *scanningStyles;
  NSArray *v5;
  NSArray *tapBehaviors;
  NSArray *cursorSizes;
  NSArray *postActivationScanLocations;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)AXSSSwitchControlSettings;
  v2 = -[AXSSSwitchControlSettings init](&v10, sel_init);
  v3 = v2;
  if (v2)
  {
    scanningStyles = v2->_scanningStyles;
    v5 = (NSArray *)MEMORY[0x1E0C9AA60];
    v2->_scanningStyles = (NSArray *)MEMORY[0x1E0C9AA60];

    tapBehaviors = v3->_tapBehaviors;
    v3->_tapBehaviors = v5;

    cursorSizes = v3->_cursorSizes;
    v3->_cursorSizes = v5;

    postActivationScanLocations = v3->_postActivationScanLocations;
    v3->_postActivationScanLocations = v5;

  }
  return v3;
}

- (AXSSSwitchControlSettings)initWithDictionaryRepresentation:(id)a3
{
  id v4;
  AXSSSwitchControlSettings *v5;
  uint64_t v6;
  NSArray *scanningStyles;
  uint64_t v8;
  NSArray *tapBehaviors;
  uint64_t v10;
  NSArray *cursorSizes;
  uint64_t v12;
  NSArray *postActivationScanLocations;
  void *v14;
  double v15;
  void *v16;
  double v17;
  void *v18;
  double v19;
  void *v20;
  void *v21;
  double v22;
  void *v23;
  double v24;
  void *v25;
  double v26;
  void *v27;
  double v28;
  void *v29;
  void *v30;
  void *v31;
  double v32;
  void *v33;
  double v34;
  objc_super v36;

  v4 = a3;
  v36.receiver = self;
  v36.super_class = (Class)AXSSSwitchControlSettings;
  v5 = -[AXSSSwitchControlSettings init](&v36, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("ScanningStyles"));
    v6 = objc_claimAutoreleasedReturnValue();
    scanningStyles = v5->_scanningStyles;
    v5->_scanningStyles = (NSArray *)v6;

    if (!v5->_scanningStyles)
    {
      v5->_scanningStyles = (NSArray *)MEMORY[0x1E0C9AA60];

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("TapBehaviors"));
    v8 = objc_claimAutoreleasedReturnValue();
    tapBehaviors = v5->_tapBehaviors;
    v5->_tapBehaviors = (NSArray *)v8;

    if (!v5->_tapBehaviors)
    {
      v5->_tapBehaviors = (NSArray *)MEMORY[0x1E0C9AA60];

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("CursorSizes"));
    v10 = objc_claimAutoreleasedReturnValue();
    cursorSizes = v5->_cursorSizes;
    v5->_cursorSizes = (NSArray *)v10;

    if (!v5->_cursorSizes)
    {
      v5->_cursorSizes = (NSArray *)MEMORY[0x1E0C9AA60];

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("PostActivationScanLocations"));
    v12 = objc_claimAutoreleasedReturnValue();
    postActivationScanLocations = v5->_postActivationScanLocations;
    v5->_postActivationScanLocations = (NSArray *)v12;

    if (!v5->_postActivationScanLocations)
    {
      v5->_postActivationScanLocations = (NSArray *)MEMORY[0x1E0C9AA60];

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("AutoScanningInterval"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "doubleValue");
    v5->_autoScanningInterval = v15;

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("AutoHideTimeout"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "doubleValue");
    v5->_autoHideTimeout = v17;

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("PauseOnFirstItemInterval"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "doubleValue");
    v5->_pauseOnFirstItemInterval = v19;

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("NumberOfScanLoops"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_numberOfScanLoops = objc_msgSend(v20, "unsignedIntegerValue");

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("DwellDuration"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "doubleValue");
    v5->_dwellDuration = v22;

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("RepeatActionInterval"));
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "doubleValue");
    v5->_repeatActionInterval = v24;

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("HoldDuration"));
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "doubleValue");
    v5->_holdDuration = v26;

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("IgnoreRepeatDuration"));
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "doubleValue");
    v5->_ignoreRepeatDuration = v28;

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("SoundEffectsEnabled"));
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_soundEffectsEnabled = objc_msgSend(v29, "BOOLValue");

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("SpeechEnabled"));
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_speechEnabled = objc_msgSend(v30, "BOOLValue");

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("LongPressDuration"));
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "doubleValue");
    v5->_longPressDuration = v32;

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("AutoTapTimeout"));
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "doubleValue");
    v5->_autoTapTimeout = v34;

  }
  return v5;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[AXSSSwitchControlSettings scanningStyles](self, "scanningStyles");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v4, CFSTR("ScanningStyles"));

  -[AXSSSwitchControlSettings tapBehaviors](self, "tapBehaviors");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("TapBehaviors"));

  -[AXSSSwitchControlSettings cursorSizes](self, "cursorSizes");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("CursorSizes"));

  -[AXSSSwitchControlSettings postActivationScanLocations](self, "postActivationScanLocations");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("PostActivationScanLocations"));

  v8 = (void *)MEMORY[0x1E0CB37E8];
  -[AXSSSwitchControlSettings autoScanningInterval](self, "autoScanningInterval");
  objc_msgSend(v8, "numberWithDouble:");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, CFSTR("AutoScanningInterval"));

  v10 = (void *)MEMORY[0x1E0CB37E8];
  -[AXSSSwitchControlSettings autoHideTimeout](self, "autoHideTimeout");
  objc_msgSend(v10, "numberWithDouble:");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v11, CFSTR("AutoHideTimeout"));

  v12 = (void *)MEMORY[0x1E0CB37E8];
  -[AXSSSwitchControlSettings pauseOnFirstItemInterval](self, "pauseOnFirstItemInterval");
  objc_msgSend(v12, "numberWithDouble:");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v13, CFSTR("PauseOnFirstItemInterval"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[AXSSSwitchControlSettings numberOfScanLoops](self, "numberOfScanLoops"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v14, CFSTR("NumberOfScanLoops"));

  v15 = (void *)MEMORY[0x1E0CB37E8];
  -[AXSSSwitchControlSettings dwellDuration](self, "dwellDuration");
  objc_msgSend(v15, "numberWithDouble:");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v16, CFSTR("DwellDuration"));

  v17 = (void *)MEMORY[0x1E0CB37E8];
  -[AXSSSwitchControlSettings repeatActionInterval](self, "repeatActionInterval");
  objc_msgSend(v17, "numberWithDouble:");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v18, CFSTR("RepeatActionInterval"));

  v19 = (void *)MEMORY[0x1E0CB37E8];
  -[AXSSSwitchControlSettings holdDuration](self, "holdDuration");
  objc_msgSend(v19, "numberWithDouble:");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v20, CFSTR("HoldDuration"));

  v21 = (void *)MEMORY[0x1E0CB37E8];
  -[AXSSSwitchControlSettings ignoreRepeatDuration](self, "ignoreRepeatDuration");
  objc_msgSend(v21, "numberWithDouble:");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v22, CFSTR("IgnoreRepeatDuration"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[AXSSSwitchControlSettings soundEffectsEnabled](self, "soundEffectsEnabled"));
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v23, CFSTR("SoundEffectsEnabled"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[AXSSSwitchControlSettings speechEnabled](self, "speechEnabled"));
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v24, CFSTR("SpeechEnabled"));

  v25 = (void *)MEMORY[0x1E0CB37E8];
  -[AXSSSwitchControlSettings longPressDuration](self, "longPressDuration");
  objc_msgSend(v25, "numberWithDouble:");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v26, CFSTR("LongPressDuration"));

  v27 = (void *)MEMORY[0x1E0CB37E8];
  -[AXSSSwitchControlSettings autoTapTimeout](self, "autoTapTimeout");
  objc_msgSend(v27, "numberWithDouble:");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v28, CFSTR("AutoTapTimeout"));

  return v3;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)AXSSSwitchControlSettings;
  -[AXSSSwitchControlSettings description](&v7, sel_description);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[AXSSSwitchControlSettings dictionaryRepresentation](self, "dictionaryRepresentation");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringByAppendingFormat:", CFSTR("- %@"), v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (NSArray)scanningStyles
{
  return self->_scanningStyles;
}

- (void)setScanningStyles:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSArray)tapBehaviors
{
  return self->_tapBehaviors;
}

- (void)setTapBehaviors:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSArray)cursorSizes
{
  return self->_cursorSizes;
}

- (void)setCursorSizes:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (NSArray)postActivationScanLocations
{
  return self->_postActivationScanLocations;
}

- (void)setPostActivationScanLocations:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (double)autoScanningInterval
{
  return self->_autoScanningInterval;
}

- (void)setAutoScanningInterval:(double)a3
{
  self->_autoScanningInterval = a3;
}

- (double)autoHideTimeout
{
  return self->_autoHideTimeout;
}

- (void)setAutoHideTimeout:(double)a3
{
  self->_autoHideTimeout = a3;
}

- (double)pauseOnFirstItemInterval
{
  return self->_pauseOnFirstItemInterval;
}

- (void)setPauseOnFirstItemInterval:(double)a3
{
  self->_pauseOnFirstItemInterval = a3;
}

- (unint64_t)numberOfScanLoops
{
  return self->_numberOfScanLoops;
}

- (void)setNumberOfScanLoops:(unint64_t)a3
{
  self->_numberOfScanLoops = a3;
}

- (double)dwellDuration
{
  return self->_dwellDuration;
}

- (void)setDwellDuration:(double)a3
{
  self->_dwellDuration = a3;
}

- (double)repeatActionInterval
{
  return self->_repeatActionInterval;
}

- (void)setRepeatActionInterval:(double)a3
{
  self->_repeatActionInterval = a3;
}

- (double)holdDuration
{
  return self->_holdDuration;
}

- (void)setHoldDuration:(double)a3
{
  self->_holdDuration = a3;
}

- (double)ignoreRepeatDuration
{
  return self->_ignoreRepeatDuration;
}

- (void)setIgnoreRepeatDuration:(double)a3
{
  self->_ignoreRepeatDuration = a3;
}

- (BOOL)soundEffectsEnabled
{
  return self->_soundEffectsEnabled;
}

- (void)setSoundEffectsEnabled:(BOOL)a3
{
  self->_soundEffectsEnabled = a3;
}

- (BOOL)speechEnabled
{
  return self->_speechEnabled;
}

- (void)setSpeechEnabled:(BOOL)a3
{
  self->_speechEnabled = a3;
}

- (double)longPressDuration
{
  return self->_longPressDuration;
}

- (void)setLongPressDuration:(double)a3
{
  self->_longPressDuration = a3;
}

- (double)autoTapTimeout
{
  return self->_autoTapTimeout;
}

- (void)setAutoTapTimeout:(double)a3
{
  self->_autoTapTimeout = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_postActivationScanLocations, 0);
  objc_storeStrong((id *)&self->_cursorSizes, 0);
  objc_storeStrong((id *)&self->_tapBehaviors, 0);
  objc_storeStrong((id *)&self->_scanningStyles, 0);
}

@end
