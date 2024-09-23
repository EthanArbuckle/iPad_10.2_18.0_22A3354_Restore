@implementation MPCustomDataPlaybackQueue

- (MPCustomDataPlaybackQueue)initWithIdentifier:(id)a3 data:(id)a4
{
  return -[MPCustomDataPlaybackQueue initWithIdentifier:data:options:](self, "initWithIdentifier:data:options:", a3, a4, 0);
}

- (MPCustomDataPlaybackQueue)initWithIdentifier:(id)a3 data:(id)a4 options:(id)a5
{
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  MPCustomDataPlaybackQueue *v12;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  v11 = MRSystemAppPlaybackQueueCreate();
  MRSystemAppPlaybackQueueSetCustomDataIdentifier();

  MRSystemAppPlaybackQueueSetCustomData();
  v12 = -[MPRemotePlaybackQueue initWithMediaRemotePlaybackQueue:options:](self, "initWithMediaRemotePlaybackQueue:options:", v11, v8);

  return v12;
}

- (id)description
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  -[MPCustomDataPlaybackQueue identifier](self, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[MPCustomDataPlaybackQueue data](self, "data");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@:%p identifier=%@ dataLength=%lu>"), v4, self, v5, objc_msgSend(v6, "length"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (NSString)identifier
{
  -[MPRemotePlaybackQueue _mediaRemotePlaybackQueue](objc_retainAutorelease(self), "_mediaRemotePlaybackQueue");
  return (NSString *)(id)MRSystemAppPlaybackQueueCopyCustomDataIdentifier();
}

- (NSData)data
{
  -[MPRemotePlaybackQueue _mediaRemotePlaybackQueue](objc_retainAutorelease(self), "_mediaRemotePlaybackQueue");
  return (NSData *)(id)MRSystemAppPlaybackQueueCopyCustomData();
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
