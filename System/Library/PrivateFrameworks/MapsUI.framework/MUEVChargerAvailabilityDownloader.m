@implementation MUEVChargerAvailabilityDownloader

- (MUEVChargerAvailabilityDownloader)initWithMapItemIdentifier:(id)a3
{
  id v4;
  MUEVChargerAvailabilityDownloader *v5;
  _TtC6MapsUI31EVChargerAvailabilityDownloader *v6;
  void *v7;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)MUEVChargerAvailabilityDownloader;
  v5 = -[MUEVChargerAvailabilityDownloader init](&v9, sel_init);
  if (v5)
  {
    v6 = -[EVChargerAvailabilityDownloader initWithMapItemIdentifier:]([_TtC6MapsUI31EVChargerAvailabilityDownloader alloc], "initWithMapItemIdentifier:", v4);
    -[MUEVChargerAvailabilityDownloader setDownloader:](v5, "setDownloader:", v6);

    -[MUEVChargerAvailabilityDownloader downloader](v5, "downloader");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setDelegate:", v5);

  }
  return v5;
}

- (void)setIsActive:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  -[MUEVChargerAvailabilityDownloader downloader](self, "downloader");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setIsActive:", v3);

}

- (void)didDownloadEVChargerAvailabilityWithEvCharger:(id)a3
{
  void *v4;
  char v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a3;
  -[MUEVChargerAvailabilityDownloader delegate](self, "delegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_opt_respondsToSelector();

  if ((v5 & 1) != 0)
  {
    -[MUEVChargerAvailabilityDownloader delegate](self, "delegate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "plugs");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "evChargerAvailabilityDownloader:didDownloadAvailabilityWithPlugs:", self, v7);

  }
}

- (MUEVChargerAvailabilityDownloaderDelegate)delegate
{
  return (MUEVChargerAvailabilityDownloaderDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (BOOL)isActive
{
  return self->_isActive;
}

- (_TtC6MapsUI31EVChargerAvailabilityDownloader)downloader
{
  return self->_downloader;
}

- (void)setDownloader:(id)a3
{
  objc_storeStrong((id *)&self->_downloader, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_downloader, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
