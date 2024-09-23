@implementation MPRadioStationRemotePlaybackQueue

- (MPRadioStationRemotePlaybackQueue)initWithMediaRemotePlaybackQueue:(_MRSystemAppPlaybackQueue *)a3 options:(id)a4
{
  MPRadioStationRemotePlaybackQueue *v4;
  int RadioStationIDType;
  uint64_t v6;
  NSString *stationStringID;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)MPRadioStationRemotePlaybackQueue;
  v4 = -[MPRemotePlaybackQueue initWithMediaRemotePlaybackQueue:options:](&v9, sel_initWithMediaRemotePlaybackQueue_options_);
  if (v4)
  {
    RadioStationIDType = MRSystemAppPlaybackQueueGetRadioStationIDType();
    if (RadioStationIDType == 2)
    {
      v6 = MRSystemAppPlaybackQueueCopyRadioStationStringIdentifier();
      stationStringID = v4->_stationStringID;
      v4->_stationStringID = (NSString *)v6;

    }
    else if (RadioStationIDType == 1)
    {
      v4->_stationID = MRSystemAppPlaybackQueueGetRadioStationIntegerPID();
    }
  }
  return v4;
}

- (id)description
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", self->_stationID);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@ %p, stationID = %@, stationStringID = %@>"), v4, self, v5, self->_stationStringID);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (BOOL)verifyWithError:(id *)a3
{
  void *v5;
  id v6;
  uint64_t v7;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x1E0C80C00];
  if (self->_stationID || self->_stationStringID)
    return 1;
  if (a3)
  {
    v7 = *MEMORY[0x1E0CB2D50];
    v8[0] = CFSTR("Radio station is invalid or not found.");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v8, &v7, 1);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_retainAutorelease((id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB35C8]), "initWithDomain:code:userInfo:", CFSTR("MPErrorDomain"), 100, v5));
    *a3 = v6;

  }
  return 0;
}

- (int64_t)stationID
{
  return self->_stationID;
}

- (NSString)stationStringID
{
  return self->_stationStringID;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_stationStringID, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
