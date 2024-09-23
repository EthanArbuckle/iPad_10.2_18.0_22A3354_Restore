@implementation BBDismissalDictionaryAndFeeds

- (BBDismissalDictionaryAndFeeds)initWithDismissalDictionary:(id)a3 andFeeds:(unint64_t)a4
{
  id v6;
  BBDismissalDictionaryAndFeeds *v7;
  void *v8;
  double v9;
  void *v10;
  uint64_t v11;
  NSString *dismissalHash;
  objc_super v14;

  v6 = a3;
  v14.receiver = self;
  v14.super_class = (Class)BBDismissalDictionaryAndFeeds;
  v7 = -[BBDismissalItem initWithFeeds:](&v14, sel_initWithFeeds_, a4);
  if (v7)
  {
    objc_msgSend(v6, "objectForKey:", CFSTR("d"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      objc_msgSend(v8, "timeIntervalSince1970");
    else
      objc_msgSend(v8, "doubleValue");
    v7->_dismissalTimeInterval = v9;
    objc_msgSend(v6, "objectForKey:", CFSTR("h"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "copy");
    dismissalHash = v7->_dismissalHash;
    v7->_dismissalHash = (NSString *)v11;

  }
  return v7;
}

- (BOOL)matchDismissalDictionary:(id)a3
{
  return _BBDismissalSyncDictionaryMatches(a3, self->_dismissalHash, self->_dismissalTimeInterval);
}

- (id)description
{
  void *v3;
  void *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)BBDismissalDictionaryAndFeeds;
  -[BBDismissalItem description](&v6, sel_description);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringByAppendingFormat:", CFSTR(" {dismissalTimeInterval %f dismissalHash %@}"), *(_QWORD *)&self->_dismissalTimeInterval, self->_dismissalHash);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (double)dismissalTimeInterval
{
  return self->_dismissalTimeInterval;
}

- (NSString)dismissalHash
{
  return self->_dismissalHash;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dismissalHash, 0);
}

@end
