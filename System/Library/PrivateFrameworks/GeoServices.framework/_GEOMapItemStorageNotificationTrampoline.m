@implementation _GEOMapItemStorageNotificationTrampoline

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_storeWeak((id *)&self->_storage, 0);
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self->_notificationToken);

  v4.receiver = self;
  v4.super_class = (Class)_GEOMapItemStorageNotificationTrampoline;
  -[_GEOMapItemStorageNotificationTrampoline dealloc](&v4, sel_dealloc);
}

- (_GEOMapItemStorageNotificationTrampoline)initWithMapItem:(id)a3 mapItemStorage:(id)a4
{
  id v7;
  id v8;
  _GEOMapItemStorageNotificationTrampoline *v9;
  _GEOMapItemStorageNotificationTrampoline *v10;
  _GEOMapItemStorageNotificationTrampoline *v11;
  void *v12;
  uint64_t v13;
  NSObject *notificationToken;
  _QWORD v16[4];
  id v17;
  id location;
  objc_super v19;

  v7 = a3;
  v8 = a4;
  v19.receiver = self;
  v19.super_class = (Class)_GEOMapItemStorageNotificationTrampoline;
  v9 = -[_GEOMapItemStorageNotificationTrampoline init](&v19, sel_init);
  v10 = v9;
  v11 = 0;
  if (v9 && v7 && v8)
  {
    objc_storeStrong((id *)&v9->_mapItem, a3);
    objc_storeWeak((id *)&v10->_storage, v8);
    objc_initWeak(&location, v10);
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __75___GEOMapItemStorageNotificationTrampoline_initWithMapItem_mapItemStorage___block_invoke;
    v16[3] = &unk_1E1C0B150;
    objc_copyWeak(&v17, &location);
    objc_msgSend(v12, "addObserverForName:object:queue:usingBlock:", CFSTR("GEOMapItemDidResolveAttribution"), v7, 0, v16);
    v13 = objc_claimAutoreleasedReturnValue();
    notificationToken = v10->_notificationToken;
    v10->_notificationToken = v13;

    v11 = v10;
    objc_destroyWeak(&v17);
    objc_destroyWeak(&location);
  }

  return v11;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_notificationToken, 0);
  objc_destroyWeak((id *)&self->_storage);
  objc_storeStrong((id *)&self->_mapItem, 0);
}

@end
