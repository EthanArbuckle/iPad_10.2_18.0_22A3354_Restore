@implementation MUDownloadOfflineActionRowItemViewModel

- (MUDownloadOfflineActionRowItemViewModel)initWithOfflineMapProvider:(id)a3
{
  id v4;
  MUDownloadOfflineActionRowItemViewModel *v5;
  MUDownloadOfflineActionRowItemViewModel *v6;
  id v7;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)MUDownloadOfflineActionRowItemViewModel;
  v5 = -[MUActionRowItemViewModel init](&v9, sel_init);
  v6 = v5;
  if (v5)
  {
    v7 = objc_storeWeak((id *)&v5->_offlineMapProvider, v4);
    objc_msgSend(v4, "addObserver:", v6);

  }
  return v6;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  -[MUDownloadOfflineActionRowItemViewModel offlineMapProvider](self, "offlineMapProvider");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  v4.receiver = self;
  v4.super_class = (Class)MUDownloadOfflineActionRowItemViewModel;
  -[MUDownloadOfflineActionRowItemViewModel dealloc](&v4, sel_dealloc);
}

- (BOOL)isEnabled
{
  return 1;
}

- (id)symbolName
{
  id WeakRetained;
  unint64_t v3;

  WeakRetained = objc_loadWeakRetained((id *)&self->_offlineMapProvider);
  v3 = objc_msgSend(WeakRetained, "downloadState");

  if (v3 > 5)
    return 0;
  else
    return off_1E2E03250[v3];
}

- (id)accessoryView
{
  id WeakRetained;
  uint64_t v4;
  void *v5;

  WeakRetained = objc_loadWeakRetained((id *)&self->_offlineMapProvider);
  v4 = objc_msgSend(WeakRetained, "downloadState");

  if (v4 == 4)
  {
    -[MUDownloadOfflineActionRowItemViewModel progressView](self, "progressView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = 0;
  }
  return v5;
}

- (id)titleText
{
  void *v2;
  id WeakRetained;
  uint64_t v4;
  __CFString *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v2 = self;
  WeakRetained = objc_loadWeakRetained((id *)&self->_offlineMapProvider);
  v4 = objc_msgSend(WeakRetained, "downloadState");

  switch(v4)
  {
    case 0:
      v5 = CFSTR("Download Map [Placecard]");
      goto LABEL_8;
    case 1:
      v5 = CFSTR("Download Map - Waiting [Placecard]");
      goto LABEL_8;
    case 2:
      v5 = CFSTR("Download Map - Paused [Placecard]");
      goto LABEL_8;
    case 3:
      v5 = CFSTR("Download Map - Failed [Placecard]");
      goto LABEL_8;
    case 4:
      objc_msgSend(v2, "byteCountFormatter");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v2, "offlineMapProvider");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "downloadProgress");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "byteCompletedCount");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "stringFromByteCount:", objc_msgSend(v9, "longLongValue"));
      v2 = (void *)objc_claimAutoreleasedReturnValue();

      return v2;
    case 5:
      v5 = CFSTR("Offline [Placecard]");
LABEL_8:
      _MULocalizedStringFromThisBundle(v5);
      v2 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    default:
      return v2;
  }
  return v2;
}

- (id)accessibilityIdentifier
{
  return (id)objc_msgSend(CFSTR("ActionRowItemType"), "stringByAppendingString:", CFSTR("DownloadOffline"));
}

- (id)byteCountFormatter
{
  NSByteCountFormatter *byteCountFormatter;
  NSByteCountFormatter *v4;
  NSByteCountFormatter *v5;

  byteCountFormatter = self->_byteCountFormatter;
  if (!byteCountFormatter)
  {
    v4 = (NSByteCountFormatter *)objc_alloc_init(MEMORY[0x1E0CB34E8]);
    v5 = self->_byteCountFormatter;
    self->_byteCountFormatter = v4;

    byteCountFormatter = self->_byteCountFormatter;
  }
  return byteCountFormatter;
}

- (id)progressView
{
  MUCircleProgressObservingView *v3;
  MUCircleProgressObservingView *progressView;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  if (!self->_progressView)
  {
    v3 = objc_alloc_init(MUCircleProgressObservingView);
    progressView = self->_progressView;
    self->_progressView = v3;

    v5 = (void *)MEMORY[0x1E0DC3870];
    objc_msgSend(MEMORY[0x1E0DC3888], "configurationWithPointSize:", 10.0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "systemImageNamed:withConfiguration:", CFSTR("stop.fill"), v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[MUCircleProgressObservingView setImage:](self->_progressView, "setImage:", v7);

  }
  -[MUDownloadOfflineActionRowItemViewModel offlineMapProvider](self, "offlineMapProvider");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "downloadProgress");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[MUCircleProgressObservingView setProgress:](self->_progressView, "setProgress:", v9);

  return self->_progressView;
}

- (unint64_t)actionItemType
{
  id WeakRetained;
  uint64_t v3;

  WeakRetained = objc_loadWeakRetained((id *)&self->_offlineMapProvider);
  v3 = objc_msgSend(WeakRetained, "downloadState");

  if ((unint64_t)(v3 - 1) > 4)
    return 34;
  else
    return qword_191F06758[v3 - 1];
}

- (MUOfflineMapProvider)offlineMapProvider
{
  return (MUOfflineMapProvider *)objc_loadWeakRetained((id *)&self->_offlineMapProvider);
}

- (void)setOfflineMapProvider:(id)a3
{
  objc_storeWeak((id *)&self->_offlineMapProvider, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_offlineMapProvider);
  objc_storeStrong((id *)&self->_progressView, 0);
  objc_storeStrong((id *)&self->_byteCountFormatter, 0);
}

@end
