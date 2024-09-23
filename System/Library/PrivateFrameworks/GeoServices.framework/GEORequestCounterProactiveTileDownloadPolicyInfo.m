@implementation GEORequestCounterProactiveTileDownloadPolicyInfo

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (GEORequestCounterProactiveTileDownloadPolicyInfo)initWithPolicy:(unsigned __int8)a3 startTimestamp:(id)a4 endTimestamp:(id)a5 tilesConsidered:(unint64_t)a6 successCount:(unint64_t)a7 failureCount:(unint64_t)a8 bytesDownloaded:(unint64_t)a9
{
  id v16;
  id v17;
  GEORequestCounterProactiveTileDownloadPolicyInfo *v18;
  GEORequestCounterProactiveTileDownloadPolicyInfo *v19;
  GEORequestCounterProactiveTileDownloadPolicyInfo *v20;
  objc_super v22;

  v16 = a4;
  v17 = a5;
  v22.receiver = self;
  v22.super_class = (Class)GEORequestCounterProactiveTileDownloadPolicyInfo;
  v18 = -[GEORequestCounterProactiveTileDownloadPolicyInfo init](&v22, sel_init);
  v19 = v18;
  if (v18)
  {
    v18->_policy = a3;
    objc_storeStrong((id *)&v18->_startTimestamp, a4);
    objc_storeStrong((id *)&v19->_endTimestamp, a5);
    v19->_tilesConsidered = a6;
    v19->_successCount = a7;
    v19->_failureCount = a8;
    v19->_bytesDownloaded = a9;
    v20 = v19;
  }

  return v19;
}

- (GEORequestCounterProactiveTileDownloadPolicyInfo)initWithCoder:(id)a3
{
  id v4;
  GEORequestCounterProactiveTileDownloadPolicyInfo *v5;
  uint64_t v6;
  NSDate *startTimestamp;
  uint64_t v8;
  NSDate *endTimestamp;
  GEORequestCounterProactiveTileDownloadPolicyInfo *v10;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)GEORequestCounterProactiveTileDownloadPolicyInfo;
  v5 = -[GEORequestCounterProactiveTileDownloadPolicyInfo init](&v12, sel_init);
  if (v5
    && (v5->_policy = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("policy")),
        objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("startDate")),
        v6 = objc_claimAutoreleasedReturnValue(),
        startTimestamp = v5->_startTimestamp,
        v5->_startTimestamp = (NSDate *)v6,
        startTimestamp,
        v5->_startTimestamp))
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("endDate"));
    v8 = objc_claimAutoreleasedReturnValue();
    endTimestamp = v5->_endTimestamp;
    v5->_endTimestamp = (NSDate *)v8;

    v5->_tilesConsidered = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("tilesConsidered"));
    v5->_successCount = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("successCount"));
    v5->_failureCount = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("failureCount"));
    v5->_bytesDownloaded = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("bytesDownloaded"));
    v10 = v5;
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (void)encodeWithCoder:(id)a3
{
  uint64_t policy;
  id v5;

  policy = self->_policy;
  v5 = a3;
  objc_msgSend(v5, "encodeInteger:forKey:", policy, CFSTR("policy"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_startTimestamp, CFSTR("startDate"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_endTimestamp, CFSTR("endDate"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_tilesConsidered, CFSTR("tilesConsidered"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_successCount, CFSTR("successCount"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_failureCount, CFSTR("failureCount"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_bytesDownloaded, CFSTR("bytesDownloaded"));

}

- (unsigned)policy
{
  return self->_policy;
}

- (NSDate)startTimestamp
{
  return self->_startTimestamp;
}

- (NSDate)endTimestamp
{
  return self->_endTimestamp;
}

- (unint64_t)tilesConsidered
{
  return self->_tilesConsidered;
}

- (unint64_t)successCount
{
  return self->_successCount;
}

- (unint64_t)failureCount
{
  return self->_failureCount;
}

- (unint64_t)bytesDownloaded
{
  return self->_bytesDownloaded;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_endTimestamp, 0);
  objc_storeStrong((id *)&self->_startTimestamp, 0);
}

@end
