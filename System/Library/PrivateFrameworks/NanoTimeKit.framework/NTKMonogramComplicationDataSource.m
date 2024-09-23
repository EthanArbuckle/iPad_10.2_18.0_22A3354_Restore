@implementation NTKMonogramComplicationDataSource

- (NTKMonogramComplicationDataSource)initWithComplication:(id)a3 family:(int64_t)a4 forDevice:(id)a5
{
  NTKMonogramComplicationDataSource *v5;
  NTKMonogramComplicationDataSource *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)NTKMonogramComplicationDataSource;
  v5 = -[CLKCComplicationDataSource initWithComplication:family:forDevice:](&v8, sel_initWithComplication_family_forDevice_, a3, a4, a5);
  v6 = v5;
  if (v5)
    -[NTKMonogramComplicationDataSource startListeningForMonogramNotifications](v5, "startListeningForMonogramNotifications");
  return v6;
}

- (void)resume
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)NTKMonogramComplicationDataSource;
  -[CLKCComplicationDataSource resume](&v3, sel_resume);
  -[NTKMonogramComplicationDataSource startListeningForMonogramNotifications](self, "startListeningForMonogramNotifications");
}

- (void)pause
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)NTKMonogramComplicationDataSource;
  -[CLKCComplicationDataSource pause](&v3, sel_pause);
  -[NTKMonogramComplicationDataSource stopListeningForMonogramNotifications](self, "stopListeningForMonogramNotifications");
}

- (BOOL)supportsTapAction
{
  return 0;
}

- (void)startListeningForMonogramNotifications
{
  void *v3;

  if (!self->_listeningForMonogramNotifications)
  {
    self->_listeningForMonogramNotifications = 1;
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObserver:selector:name:object:", self, sel__handleMonogramTextReload, CFSTR("NTKCustomMonogramChangedNotification"), 0);
    objc_msgSend(v3, "addObserver:selector:name:object:", self, sel__handleMonogramTextReload, CFSTR("NTKFaceDefaultsChangedNotification"), 0);
    objc_msgSend(v3, "addObserver:selector:name:object:", self, sel__handleMonogramTextReload, *MEMORY[0x1E0C99720], 0);
    objc_msgSend(v3, "addObserver:selector:name:object:", self, sel__handleMonogramTextReload, *MEMORY[0x1E0C93EE0], 0);

  }
  -[NTKMonogramComplicationDataSource _reloadMonogramText](self, "_reloadMonogramText");
}

- (void)stopListeningForMonogramNotifications
{
  id v3;

  self->_listeningForMonogramNotifications = 0;
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:name:object:", self, CFSTR("NTKCustomMonogramChangedNotification"), 0);
  objc_msgSend(v3, "removeObserver:name:object:", self, CFSTR("NTKFaceDefaultsChangedNotification"), 0);
  objc_msgSend(v3, "removeObserver:name:object:", self, *MEMORY[0x1E0C99720], 0);
  objc_msgSend(v3, "removeObserver:name:object:", self, *MEMORY[0x1E0C93EE0], 0);

}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  v4.receiver = self;
  v4.super_class = (Class)NTKMonogramComplicationDataSource;
  -[NTKMonogramComplicationDataSource dealloc](&v4, sel_dealloc);
}

+ (BOOL)acceptsComplicationType:(unint64_t)a3 forDevice:(id)a4
{
  return a3 == 14;
}

+ (BOOL)acceptsComplicationFamily:(int64_t)a3 forDevice:(id)a4
{
  return (unint64_t)(a3 - 9) < 2 || *MEMORY[0x1E0C93EA8] == a3;
}

- (id)currentSwitcherTemplate
{
  void *v3;
  void *v4;

  if (!self->_monogramText)
    -[NTKMonogramComplicationDataSource _reloadMonogramText](self, "_reloadMonogramText");
  -[NTKMonogramComplicationDataSource _currentTimelineEntry](self, "_currentTimelineEntry");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "complicationTemplate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)_currentTimelineEntry
{
  NTKMonogramTimelineEntryModel *v3;
  NTKMonogramTimelineEntryModel *currentEntry;
  void *v5;

  if (!self->_currentEntry)
  {
    v3 = (NTKMonogramTimelineEntryModel *)objc_opt_new();
    currentEntry = self->_currentEntry;
    self->_currentEntry = v3;

  }
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[NTKTimelineEntryModel setEntryDate:](self->_currentEntry, "setEntryDate:", v5);

  -[NTKMonogramTimelineEntryModel setMonogram:](self->_currentEntry, "setMonogram:", self->_monogramText);
  return -[NTKTimelineEntryModel entryForComplicationFamily:](self->_currentEntry, "entryForComplicationFamily:", -[CLKCComplicationDataSource family](self, "family"));
}

- (void)getCurrentTimelineEntryWithHandler:(id)a3
{
  id v5;
  id v6;

  v5 = a3;
  -[NTKMonogramComplicationDataSource _currentTimelineEntry](self, "_currentTimelineEntry");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  (*((void (**)(id, id))a3 + 2))(v5, v6);

}

- (Class)richComplicationDisplayViewClassForDevice:(id)a3
{
  int64_t v3;
  void *v4;

  v3 = -[CLKCComplicationDataSource family](self, "family", a3);
  if (v3 == 10 || v3 == 9)
    v4 = (void *)objc_opt_class();
  else
    v4 = 0;
  return (Class)v4;
}

- (void)_handleMonogramTextReload
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __62__NTKMonogramComplicationDataSource__handleMonogramTextReload__block_invoke;
  block[3] = &unk_1E6BCD5F0;
  block[4] = self;
  dispatch_async(MEMORY[0x1E0C80D38], block);
}

uint64_t __62__NTKMonogramComplicationDataSource__handleMonogramTextReload__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_reloadMonogramText");
}

- (void)_reloadMonogramText
{
  uint64_t v3;
  void *v4;
  __CFString *v5;
  void *v6;
  __CFString *v7;

  +[NTKMonogram monogram](NTKMonogram, "monogram");
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = (void *)v3;
  if (v3)
    v5 = (__CFString *)v3;
  else
    v5 = &stru_1E6BDC918;
  v7 = v5;

  if (!-[NSString isEqualToString:](self->_monogramText, "isEqualToString:", v7))
  {
    objc_storeStrong((id *)&self->_monogramText, v5);
    -[CLKCComplicationDataSource delegate](self, "delegate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "invalidateEntries");

  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_monogramText, 0);
  objc_storeStrong((id *)&self->_currentEntry, 0);
}

@end
