@implementation PKHandwritingEducationPaneSettings

+ (id)sharedInstance
{
  objc_opt_self();
  if (_MergedGlobals_157 != -1)
    dispatch_once(&_MergedGlobals_157, &__block_literal_global_87);
  return (id)qword_1ECEE65C0;
}

void __52__PKHandwritingEducationPaneSettings_sharedInstance__block_invoke()
{
  PKHandwritingEducationPaneSettings *v0;
  void *v1;

  v0 = objc_alloc_init(PKHandwritingEducationPaneSettings);
  v1 = (void *)qword_1ECEE65C0;
  qword_1ECEE65C0 = (uint64_t)v0;

}

- (BOOL)isCurrentSystemVersionEqualToLastUserDrawn
{
  void *v1;
  void *v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  _BOOL8 v19;
  NSObject *v20;
  uint8_t buf[4];
  _BOOL4 v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  if (!a1)
    return 0;
  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "objectForKey:", CFSTR("internalSettings.drawing.hasDrawnInNotes"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  v3 = objc_opt_class();
  PKDynamicCast(v3, v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "count") == 3)
  {
    v5 = objc_opt_class();
    objc_msgSend(v4, "objectAtIndexedSubscript:", 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    PKDynamicCast(v5, v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "integerValue");

    v9 = objc_opt_class();
    objc_msgSend(v4, "objectAtIndexedSubscript:", 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    PKDynamicCast(v9, v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "integerValue");

    v13 = objc_opt_class();
    objc_msgSend(v4, "objectAtIndexedSubscript:", 2);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    PKDynamicCast(v13, v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v15, "integerValue");

  }
  else
  {
    v8 = 0;
    v12 = 0;
    v16 = 0;
  }

  objc_msgSend(MEMORY[0x1E0CB3898], "processInfo");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = v17;
  if (v17)
    objc_msgSend(v17, "operatingSystemVersion");

  v19 = 0;
  if (!v8 && !v12)
    v19 = v16 == 0;
  v20 = os_log_create("com.apple.pencilkit", "PKHandwritingEducationPaneSettings");
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109120;
    v23 = v19;
    _os_log_impl(&dword_1BE213000, v20, OS_LOG_TYPE_DEFAULT, "isCurrentSystemVersionNewerThanLastDrawnIn=%d", buf, 8u);
  }

  return v19;
}

- (void)userHasDrawn
{
  void *v2;
  void *v3;
  char v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  _QWORD v12[4];

  v12[3] = *MEMORY[0x1E0C80C00];
  if (a1)
  {
    if ((objc_msgSend(a1, "hasSetUserHasDrawn") & 1) != 0
      || (objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle"),
          v2 = (void *)objc_claimAutoreleasedReturnValue(),
          objc_msgSend(v2, "bundleIdentifier"),
          v3 = (void *)objc_claimAutoreleasedReturnValue(),
          v4 = objc_msgSend(v3, "isEqualToString:", CFSTR("com.apple.mobilenotes")),
          v3,
          v2,
          (v4 & 1) == 0))
    {
      objc_msgSend(a1, "setHasSetUserHasDrawn:", 1);
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB3898], "processInfo");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = v5;
      if (v5)
        objc_msgSend(v5, "operatingSystemVersion");

      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", 0);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v12[0] = v7;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", 0);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v12[1] = v8;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", 0);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v12[2] = v9;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v12, 3);
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "setObject:forKey:", v10, CFSTR("internalSettings.drawing.hasDrawnInNotes"));

      objc_msgSend(a1, "setHasSetUserHasDrawn:", 1);
    }
  }
}

- (void)setHasSeenPane:(uint64_t)a1
{
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  _DWORD v9[2];
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  if (a1)
  {
    v4 = os_log_create("com.apple.pencilkit", "PKHandwritingEducationPaneSettings");
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      v9[0] = 67109120;
      v9[1] = a2;
      _os_log_impl(&dword_1BE213000, v4, OS_LOG_TYPE_DEFAULT, "set has seen handwriting education pane: %{BOOL}d", (uint8_t *)v9, 8u);
    }

    objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setBool:forKey:", a2, CFSTR("internalSettings.drawing.hasSeenHandwritingEducationPane"));

    objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "synchronize");

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "postNotificationName:object:userInfo:", CFSTR("PKHandwritingEducationPaneSettingsDidChangeNotification"), a1, 0);

    if ((a2 & 1) == 0)
    {
      objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "removeObjectForKey:", CFSTR("internalSettings.drawing.hasDrawnInNotes"));

    }
  }
}

- (uint64_t)hasSeenPane
{
  void *v1;
  uint64_t v2;

  if (result)
  {
    objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
    v1 = (void *)objc_claimAutoreleasedReturnValue();
    v2 = objc_msgSend(v1, "BOOLForKey:", CFSTR("internalSettings.drawing.hasSeenHandwritingEducationPane"));

    return v2;
  }
  return result;
}

- (uint64_t)canShowResetPaneInPalette
{
  void *v3;
  int v4;

  if (a1
    && os_variant_has_internal_diagnostics()
    && (objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults"),
        v3 = (void *)objc_claimAutoreleasedReturnValue(),
        v4 = objc_msgSend(v3, "BOOLForKey:", CFSTR("internalSettings.drawing.showResetHandwritingEducationPaneInPalette")), v3, v4))
  {
    return -[PKHandwritingEducationPaneSettings hasSeenPane](a1);
  }
  else
  {
    return 0;
  }
}

- (BOOL)hasSetUserHasDrawn
{
  return self->_hasSetUserHasDrawn;
}

- (void)setHasSetUserHasDrawn:(BOOL)a3
{
  self->_hasSetUserHasDrawn = a3;
}

@end
