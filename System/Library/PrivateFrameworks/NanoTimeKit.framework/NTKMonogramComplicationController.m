@implementation NTKMonogramComplicationController

+ (BOOL)_acceptsComplicationType:(unint64_t)a3 forDevice:(id)a4
{
  return a3 == 14;
}

- (void)_activate
{
  id v3;

  -[NTKMonogramComplicationController _reloadMonogramText](self, "_reloadMonogramText");
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObserver:selector:name:object:", self, sel__handleMonogramTextReload, CFSTR("NTKCustomMonogramChangedNotification"), 0);
  objc_msgSend(v3, "addObserver:selector:name:object:", self, sel__handleMonogramTextReload, CFSTR("NTKFaceDefaultsChangedNotification"), 0);
  objc_msgSend(v3, "addObserver:selector:name:object:", self, sel__handleMonogramTextReload, *MEMORY[0x1E0C99720], 0);
  objc_msgSend(v3, "addObserver:selector:name:object:", self, sel__handleMonogramTextReload, *MEMORY[0x1E0C93EE0], 0);

}

- (void)_deactivate
{
  id v3;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:name:object:", self, CFSTR("NTKCustomMonogramChangedNotification"), 0);
  objc_msgSend(v3, "removeObserver:name:object:", self, CFSTR("NTKFaceDefaultsChangedNotification"), 0);
  objc_msgSend(v3, "removeObserver:name:object:", self, *MEMORY[0x1E0C99720], 0);
  objc_msgSend(v3, "removeObserver:name:object:", self, *MEMORY[0x1E0C93EE0], 0);

}

- (BOOL)hasTapAction
{
  return 0;
}

- (void)_updateDisplay
{
  id v3;

  -[NTKComplicationController legacyDisplay](self, "legacyDisplay");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setMonogramText:", self->_monogramText);

}

- (void)_reloadMonogramText
{
  uint64_t v3;
  const __CFString *v4;
  __CFString *obj;

  +[NTKMonogram monogram](NTKMonogram, "monogram");
  v3 = objc_claimAutoreleasedReturnValue();
  if (v3)
    v4 = (const __CFString *)v3;
  else
    v4 = &stru_1E6BDC918;
  obj = (__CFString *)v4;
  if (!-[NSString isEqualToString:](self->_monogramText, "isEqualToString:"))
  {
    objc_storeStrong((id *)&self->_monogramText, obj);
    -[NTKMonogramComplicationController _updateDisplay](self, "_updateDisplay");
  }

}

- (void)_handleMonogramTextReload
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __62__NTKMonogramComplicationController__handleMonogramTextReload__block_invoke;
  block[3] = &unk_1E6BCD5F0;
  block[4] = self;
  dispatch_async(MEMORY[0x1E0C80D38], block);
}

uint64_t __62__NTKMonogramComplicationController__handleMonogramTextReload__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_reloadMonogramText");
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_monogramText, 0);
}

@end
