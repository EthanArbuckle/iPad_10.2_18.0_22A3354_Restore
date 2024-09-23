@implementation MAAutoAssetInfoControl

- (id)initClearingAfter:(BOOL)a3
{
  return -[MAAutoAssetInfoControl initClearingAfter:forcingUnlock:limitedToAssetTypes:withVolumeToReclaim:withUrgency:targetingPurgeAmount:simulateOperation:simulateEnd:](self, "initClearingAfter:forcingUnlock:limitedToAssetTypes:withVolumeToReclaim:withUrgency:targetingPurgeAmount:simulateOperation:simulateEnd:", a3, 0, 0, 0, 0, 0, 0, 0);
}

- (id)initClearingAfter:(BOOL)a3 limitedToAssetTypes:(id)a4
{
  return -[MAAutoAssetInfoControl initClearingAfter:forcingUnlock:limitedToAssetTypes:withVolumeToReclaim:withUrgency:targetingPurgeAmount:simulateOperation:simulateEnd:](self, "initClearingAfter:forcingUnlock:limitedToAssetTypes:withVolumeToReclaim:withUrgency:targetingPurgeAmount:simulateOperation:simulateEnd:", a3, 0, a4, 0, 0, 0, 0, 0);
}

- (id)initForcingUnlock:(BOOL)a3
{
  return -[MAAutoAssetInfoControl initClearingAfter:forcingUnlock:limitedToAssetTypes:withVolumeToReclaim:withUrgency:targetingPurgeAmount:simulateOperation:simulateEnd:](self, "initClearingAfter:forcingUnlock:limitedToAssetTypes:withVolumeToReclaim:withUrgency:targetingPurgeAmount:simulateOperation:simulateEnd:", 0, a3, 0, 0, 0, 0, 0, 0);
}

- (MAAutoAssetInfoControl)initWithVolumeToReclaim:(id)a3 withUrgency:(int)a4 targetingPurgeAmount:(int64_t)a5
{
  return (MAAutoAssetInfoControl *)-[MAAutoAssetInfoControl initClearingAfter:forcingUnlock:limitedToAssetTypes:withVolumeToReclaim:withUrgency:targetingPurgeAmount:simulateOperation:simulateEnd:](self, "initClearingAfter:forcingUnlock:limitedToAssetTypes:withVolumeToReclaim:withUrgency:targetingPurgeAmount:simulateOperation:simulateEnd:", 0, 0, 0, a3, *(_QWORD *)&a4, a5, 0, 0);
}

- (id)initForSimulateOperation:(int64_t)a3 withSimulateEnd:(int64_t)a4
{
  return -[MAAutoAssetInfoControl initClearingAfter:forcingUnlock:limitedToAssetTypes:withVolumeToReclaim:withUrgency:targetingPurgeAmount:simulateOperation:simulateEnd:](self, "initClearingAfter:forcingUnlock:limitedToAssetTypes:withVolumeToReclaim:withUrgency:targetingPurgeAmount:simulateOperation:simulateEnd:", 0, 0, 0, 0, 0, 0, a3, a4);
}

- (id)initClearingAfter:(BOOL)a3 forcingUnlock:(BOOL)a4 limitedToAssetTypes:(id)a5 withVolumeToReclaim:(id)a6 withUrgency:(int)a7 targetingPurgeAmount:(int64_t)a8 simulateOperation:(int64_t)a9 simulateEnd:(int64_t)a10
{
  id v17;
  id v18;
  MAAutoAssetInfoControl *v19;
  MAAutoAssetInfoControl *v20;
  objc_super v22;

  v17 = a5;
  v18 = a6;
  v22.receiver = self;
  v22.super_class = (Class)MAAutoAssetInfoControl;
  v19 = -[MAAutoAssetInfoControl init](&v22, sel_init);
  v20 = v19;
  if (v19)
  {
    v19->_clearingAfter = a3;
    v19->_forceUnlock = a4;
    objc_storeStrong((id *)&v19->_limitedToAssetTypes, a5);
    objc_storeStrong((id *)&v20->_volumeToReclaim, a6);
    v20->_cacheDeleteUrgency = a7;
    v20->_targetingPurgeAmount = a8;
    v20->_simulateOperation = a9;
    v20->_simulateEnd = a10;
  }

  return v20;
}

- (MAAutoAssetInfoControl)initWithCoder:(id)a3
{
  id v4;
  MAAutoAssetInfoControl *v5;
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  NSArray *limitedToAssetTypes;
  uint64_t v11;
  NSString *volumeToReclaim;
  objc_super v14;
  _QWORD v15[3];

  v15[2] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)MAAutoAssetInfoControl;
  v5 = -[MAAutoAssetInfoControl init](&v14, sel_init);
  if (v5)
  {
    v5->_clearingAfter = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("clearingAfter"));
    v5->_forceUnlock = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("forceUnlock"));
    v6 = objc_alloc(MEMORY[0x1E0C99E60]);
    v15[0] = objc_opt_class();
    v15[1] = objc_opt_class();
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v15, 2);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (void *)objc_msgSend(v6, "initWithArray:", v7);
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v8, CFSTR("limitedToAssetTypes"));
    v9 = objc_claimAutoreleasedReturnValue();
    limitedToAssetTypes = v5->_limitedToAssetTypes;
    v5->_limitedToAssetTypes = (NSArray *)v9;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("volumeToReclaim"));
    v11 = objc_claimAutoreleasedReturnValue();
    volumeToReclaim = v5->_volumeToReclaim;
    v5->_volumeToReclaim = (NSString *)v11;

    v5->_cacheDeleteUrgency = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("cacheDeleteUrgency"));
    v5->_targetingPurgeAmount = objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("targetingPurgeAmount"));
    v5->_simulateOperation = (int)objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("simulateOperation"));
    v5->_simulateEnd = (int)objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("simulateEnd"));
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  v6 = a3;
  objc_msgSend(v6, "encodeBool:forKey:", -[MAAutoAssetInfoControl clearingAfter](self, "clearingAfter"), CFSTR("clearingAfter"));
  objc_msgSend(v6, "encodeBool:forKey:", -[MAAutoAssetInfoControl forceUnlock](self, "forceUnlock"), CFSTR("forceUnlock"));
  -[MAAutoAssetInfoControl limitedToAssetTypes](self, "limitedToAssetTypes");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "encodeObject:forKey:", v4, CFSTR("limitedToAssetTypes"));

  -[MAAutoAssetInfoControl volumeToReclaim](self, "volumeToReclaim");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "encodeObject:forKey:", v5, CFSTR("volumeToReclaim"));

  objc_msgSend(v6, "encodeInteger:forKey:", -[MAAutoAssetInfoControl cacheDeleteUrgency](self, "cacheDeleteUrgency"), CFSTR("cacheDeleteUrgency"));
  objc_msgSend(v6, "encodeInt64:forKey:", -[MAAutoAssetInfoControl targetingPurgeAmount](self, "targetingPurgeAmount"), CFSTR("targetingPurgeAmount"));
  objc_msgSend(v6, "encodeInteger:forKey:", -[MAAutoAssetInfoControl simulateOperation](self, "simulateOperation"), CFSTR("simulateOperation"));
  objc_msgSend(v6, "encodeInteger:forKey:", -[MAAutoAssetInfoControl simulateEnd](self, "simulateEnd"), CFSTR("simulateEnd"));

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)summary
{
  void *v3;
  __CFString *v4;
  __CFString *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  const __CFString *v10;
  uint64_t v11;
  const __CFString *v12;
  const __CFString *v13;
  void *v14;
  uint64_t v15;
  int64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  -[MAAutoAssetInfoControl limitedToAssetTypes](self, "limitedToAssetTypes");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v4 = CFSTR("N");
  if (v3)
  {
    v5 = (__CFString *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37A0]), "initWithCapacity:", 0);
    -[__CFString appendString:](v5, "appendString:", CFSTR("["));
    v24 = 0u;
    v25 = 0u;
    v22 = 0u;
    v23 = 0u;
    -[MAAutoAssetInfoControl limitedToAssetTypes](self, "limitedToAssetTypes");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v23;
      v10 = &stru_1E5D5F930;
      do
      {
        v11 = 0;
        do
        {
          if (*(_QWORD *)v23 != v9)
            objc_enumerationMutation(v6);
          -[__CFString appendFormat:](v5, "appendFormat:", CFSTR("%@%@"), v10, *(_QWORD *)(*((_QWORD *)&v22 + 1) + 8 * v11++));
          v10 = CFSTR(",");
        }
        while (v8 != v11);
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
        v10 = CFSTR(",");
      }
      while (v8);
    }

    -[__CFString appendString:](v5, "appendString:", CFSTR("]"));
  }
  else
  {
    v5 = CFSTR("N");
  }
  v21 = (void *)MEMORY[0x1E0CB3940];
  if (-[MAAutoAssetInfoControl clearingAfter](self, "clearingAfter"))
    v12 = CFSTR("Y");
  else
    v12 = CFSTR("N");
  if (-[MAAutoAssetInfoControl forceUnlock](self, "forceUnlock"))
    v13 = CFSTR("Y");
  else
    v13 = CFSTR("N");
  -[MAAutoAssetInfoControl volumeToReclaim](self, "volumeToReclaim");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (v14)
  {
    -[MAAutoAssetInfoControl volumeToReclaim](self, "volumeToReclaim");
    v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  v15 = -[MAAutoAssetInfoControl cacheDeleteUrgency](self, "cacheDeleteUrgency");
  v16 = -[MAAutoAssetInfoControl targetingPurgeAmount](self, "targetingPurgeAmount");
  +[MAAutoAssetInfoControl nameOfSimulateOperation:](MAAutoAssetInfoControl, "nameOfSimulateOperation:", -[MAAutoAssetInfoControl simulateOperation](self, "simulateOperation"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  +[MAAutoAssetInfoControl nameOfSimulateEnd:](MAAutoAssetInfoControl, "nameOfSimulateEnd:", -[MAAutoAssetInfoControl simulateEnd](self, "simulateEnd"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "stringWithFormat:", CFSTR("clearingAfter:%@, forceUnlock:%@, limitedToAssetTypes:%@, volumeToReclaim:%@, cacheDeleteUrgency:%d, targetingPurgeAmount:%lld, simulateOperation:%@, simulateEnd:%@"), v12, v13, v5, v4, v15, v16, v17, v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  if (v14)
  return v19;
}

+ (id)nameOfSimulateOperation:(int64_t)a3
{
  if ((unint64_t)a3 > 9)
    return CFSTR("UNKNOWN");
  else
    return off_1E5D5DF48[a3];
}

+ (id)nameOfSimulateEnd:(int64_t)a3
{
  const __CFString *v3;

  v3 = CFSTR("UNKNOWN");
  if (a3 == 1)
    v3 = CFSTR("CLIENT_REQUEST");
  if (a3)
    return (id)v3;
  else
    return CFSTR("NONE");
}

- (BOOL)clearingAfter
{
  return self->_clearingAfter;
}

- (BOOL)forceUnlock
{
  return self->_forceUnlock;
}

- (NSArray)limitedToAssetTypes
{
  return self->_limitedToAssetTypes;
}

- (NSString)volumeToReclaim
{
  return self->_volumeToReclaim;
}

- (int)cacheDeleteUrgency
{
  return self->_cacheDeleteUrgency;
}

- (int64_t)targetingPurgeAmount
{
  return self->_targetingPurgeAmount;
}

- (int64_t)simulateOperation
{
  return self->_simulateOperation;
}

- (int64_t)simulateEnd
{
  return self->_simulateEnd;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_volumeToReclaim, 0);
  objc_storeStrong((id *)&self->_limitedToAssetTypes, 0);
}

@end
