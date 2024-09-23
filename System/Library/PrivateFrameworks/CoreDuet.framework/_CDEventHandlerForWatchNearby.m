@implementation _CDEventHandlerForWatchNearby

- (_CDEventHandlerForWatchNearby)init
{
  _CDEventHandlerForWatchNearby *v2;
  void *v3;
  id *v4;
  _CDDataCollectionAnonymizer *anonymizer;
  id *v6;
  _CDFileUtility *v7;
  _CDFileUtility *utility;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)_CDEventHandlerForWatchNearby;
  v2 = -[_CDEventHandlerForWatchNearby init](&v10, sel_init);
  if (v2)
  {
    +[_CDDataCollectionUtilities randomDataWithLength:](_CDDataCollectionUtilities, "randomDataWithLength:", 32);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = -[_CDDataCollectionAnonymizer initWithSalt:]((id *)[_CDDataCollectionAnonymizer alloc], v3);
    anonymizer = v2->_anonymizer;
    v2->_anonymizer = (_CDDataCollectionAnonymizer *)v4;
    v6 = v4;

    v7 = objc_alloc_init(_CDFileUtility);
    utility = v2->_utility;
    v2->_utility = v7;

  }
  return v2;
}

- (void)eventHandler:(id)a3 withFileHandle:(id)a4
{
  id v6;
  id v7;
  void *v8;
  _QWORD *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;

  v6 = a4;
  v7 = a3;
  objc_msgSend(v7, "metadata");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (id)objc_msgSend(v8, "copy");

  -[_CDEventHandlerForWatchNearby anonymizer](self, "anonymizer");
  v9 = (_QWORD *)objc_claimAutoreleasedReturnValue();
  -[_CDDataCollectionAnonymizer anonymizeDictionary:](v9, v14);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  -[_CDEventHandlerForWatchNearby utility](self, "utility");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[_CDFileUtility fileHandlerUtiity:withBundleId:withMetaData:]((uint64_t)v11, v7, 0, v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  -[_CDEventHandlerForWatchNearby utility](self, "utility");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[_CDFileUtility writeJSON:withFileHandle:]((uint64_t)v13, v12, v6);

}

- (_CDDataCollectionAnonymizer)anonymizer
{
  return self->_anonymizer;
}

- (void)setAnonymizer:(id)a3
{
  objc_storeStrong((id *)&self->_anonymizer, a3);
}

- (_CDFileUtility)utility
{
  return self->_utility;
}

- (void)setUtility:(id)a3
{
  objc_storeStrong((id *)&self->_utility, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_utility, 0);
  objc_storeStrong((id *)&self->_anonymizer, 0);
}

@end
