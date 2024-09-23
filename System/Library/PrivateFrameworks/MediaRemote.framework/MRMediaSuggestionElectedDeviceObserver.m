@implementation MRMediaSuggestionElectedDeviceObserver

- (MRMediaSuggestionElectedDeviceObserver)initWithDelegate:(id)a3
{
  id v4;
  MRMediaSuggestionElectedDeviceObserver *v5;
  MRMediaSuggestionElectedDeviceObserver *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)MRMediaSuggestionElectedDeviceObserver;
  v5 = -[MRMediaSuggestionElectedDeviceObserver init](&v8, sel_init);
  v6 = v5;
  if (v5)
    objc_storeWeak((id *)&v5->_delegate, v4);

  return v6;
}

- (void)start
{
  void *v3;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObserver:selector:name:object:", self, sel_deviceAvailableForMediaSuggestionsNotification_, CFSTR("_MRMediaRemoteDeviceAvailableForMediaSuggestionsNotification"), 0);

  MRMediaRemoteSetWantsRouteChangeNotifications(1);
}

- (void)stop
{
  id v3;

  MRMediaRemoteSetWantsRouteChangeNotifications(0);
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:name:object:", self, CFSTR("_MRMediaRemoteDeviceAvailableForMediaSuggestionsNotification"), 0);

}

- (void)deviceAvailableForMediaSuggestionsNotification:(id)a3
{
  void *v4;
  NSString *v5;
  void *v6;
  NSString *v7;
  char v8;
  NSString *v9;
  NSString *electedDeviceIdentifier;
  void *v11;
  char v12;
  NSString *v13;

  objc_msgSend(a3, "userInfo");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("kMRAVEndpointOutputDeviceIdentifierUserInfoKey"));
  v13 = (NSString *)objc_claimAutoreleasedReturnValue();

  v5 = self->_electedDeviceIdentifier;
  v6 = v13;
  if (v5 == v13)
    goto LABEL_5;
  v7 = v5;
  v8 = -[NSString isEqual:](v5, "isEqual:", v13);

  if ((v8 & 1) == 0)
  {
    v9 = (NSString *)-[NSString copy](v13, "copy");
    electedDeviceIdentifier = self->_electedDeviceIdentifier;
    self->_electedDeviceIdentifier = v9;

    -[MRMediaSuggestionElectedDeviceObserver delegate](self, "delegate");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_opt_respondsToSelector();

    if ((v12 & 1) != 0)
    {
      -[MRMediaSuggestionElectedDeviceObserver delegate](self, "delegate");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "mediaSuggestionElectedDeviceObserverDeviceDidChange:", self);
LABEL_5:

    }
  }

}

- (MRMediaSuggestionElectedDeviceObserverDelegate)delegate
{
  return (MRMediaSuggestionElectedDeviceObserverDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (NSString)electedDeviceIdentifier
{
  return self->_electedDeviceIdentifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_electedDeviceIdentifier, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
