@implementation AssistantVoiceDownloadingCell

- (AssistantVoiceDownloadingCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4 specifier:(id)a5
{
  AssistantVoiceDownloadingCell *v5;
  AssistantVoiceDownloadingView *v6;
  AssistantVoiceDownloadingView *downloadingView;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)AssistantVoiceDownloadingCell;
  v5 = -[PSTableCell initWithStyle:reuseIdentifier:specifier:](&v9, sel_initWithStyle_reuseIdentifier_specifier_, a3, a4, a5);
  if (v5)
  {
    v6 = -[AssistantVoiceDownloadingView initWithActivityIndicatorStyle:]([AssistantVoiceDownloadingView alloc], "initWithActivityIndicatorStyle:", 100);
    downloadingView = v5->_downloadingView;
    v5->_downloadingView = v6;

    -[AssistantVoiceDownloadingView sizeToFit](v5->_downloadingView, "sizeToFit");
  }
  return v5;
}

- (void)refreshCellContentsWithSpecifier:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)AssistantVoiceDownloadingCell;
  v4 = a3;
  -[PSTableCell refreshCellContentsWithSpecifier:](&v7, sel_refreshCellContentsWithSpecifier_, v4);
  objc_msgSend(v4, "propertyForKey:", CFSTR("IS_VOICE_DOWNLOADING"), v7.receiver, v7.super_class);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = objc_msgSend(v5, "BOOLValue");
  -[AssistantVoiceDownloadingCell setDownloading:](self, "setDownloading:", v6);
}

- (void)setDownloading:(BOOL)a3
{
  AssistantVoiceDownloadingView *v5;
  AssistantVoiceDownloadingView *downloadingView;
  AssistantVoiceDownloadingView *v7;

  if (self->_downloading != a3)
  {
    if (a3)
    {
      v5 = -[AssistantVoiceDownloadingView initWithActivityIndicatorStyle:]([AssistantVoiceDownloadingView alloc], "initWithActivityIndicatorStyle:", 100);
      downloadingView = self->_downloadingView;
      self->_downloadingView = v5;

      -[AssistantVoiceDownloadingView sizeToFit](self->_downloadingView, "sizeToFit");
      -[AssistantVoiceDownloadingCell setAccessoryView:](self, "setAccessoryView:", self->_downloadingView);
      -[AssistantVoiceDownloadingCell setNeedsLayout](self, "setNeedsLayout");
    }
    else
    {
      -[AssistantVoiceDownloadingCell setAccessoryView:](self, "setAccessoryView:", 0);
      v7 = self->_downloadingView;
      self->_downloadingView = 0;

    }
    self->_downloading = a3;
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_downloadingView, 0);
}

@end
