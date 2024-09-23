@implementation IMBroadcastingKeyValueCollection

- (void)_notifyListeners
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v7;
  const __CFString *v8;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x1E0C80C00];
  v7.receiver = self;
  v7.super_class = (Class)IMBroadcastingKeyValueCollection;
  -[IMKeyValueCollection _notifyListeners](&v7, sel__notifyListeners);
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = CFSTR("IMKeyValueCollectionChangedValuesKey");
  -[IMKeyValueCollection recordedChanges](self, "recordedChanges");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v4, "copy");
  v9[0] = v5;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v9, &v8, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "postNotificationName:object:userInfo:", CFSTR("IMKeyValueCollectionChangedNotification"), self, v6);

}

@end
