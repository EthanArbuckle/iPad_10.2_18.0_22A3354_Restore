@implementation MusicKit_RemotePlaybackQueue

- (MusicKit_RemotePlaybackQueue)initWithReplaceQueueIntent:(int64_t)a3
{
  MusicKit_RemotePlaybackQueue *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)MusicKit_RemotePlaybackQueue;
  result = -[MusicKit_RemotePlaybackQueue init](&v5, sel_init);
  if (result)
    result->_replaceQueueIntent = a3;
  return result;
}

- (int)convertReplaceQueueIntentToMRIntent:(int64_t)a3
{
  if ((unint64_t)(a3 - 1) < 3)
    return a3;
  else
    return 0;
}

+ (id)extractDialogFromCommandResult:(id)a3 error:(id *)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v5 = a3;
  objc_msgSend(v5, "resultStatuses");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "msv_firstWhere:", &__block_literal_global_5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    objc_msgSend(v7, "dialog");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(v5, "resultStatuses");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "msv_firstWhere:", &__block_literal_global_1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (a4 && v10)
    {
      objc_msgSend(v10, "commandError");
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }

    v8 = 0;
  }

  return v8;
}

- (int64_t)replaceQueueIntent
{
  return self->_replaceQueueIntent;
}

- (void)setReplaceQueueIntent:(int64_t)a3
{
  self->_replaceQueueIntent = a3;
}

@end
