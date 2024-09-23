@implementation GEORequestCounterStatistics

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (GEORequestCounterStatistics)initWithCoder:(id)a3
{
  id v4;
  GEORequestCounterStatistics *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  NSMutableDictionary *resultCounts;
  GEORequestCounterStatistics *v10;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)GEORequestCounterStatistics;
  v5 = -[GEORequestCounterStatistics init](&v12, sel_init);
  if (v5)
  {
    v5->_bytesTransmitted = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("bytesTransmitted"));
    v5->_bytesReceived = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("bytesReceived"));
    v5->_durationUSeconds = objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("duration"));
    v5->_durationCount = objc_msgSend(v4, "decodeInt32ForKey:", CFSTR("durationCount"));
    v6 = objc_opt_class();
    objc_msgSend(v4, "decodeDictionaryWithKeysOfClass:objectsOfClass:forKey:", v6, objc_opt_class(), CFSTR("resultCounts"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "mutableCopy");
    resultCounts = v5->_resultCounts;
    v5->_resultCounts = (NSMutableDictionary *)v8;

    v5->_usedInterfaces = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("interfaces"));
    v10 = v5;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  unint64_t bytesTransmitted;
  id v5;

  bytesTransmitted = self->_bytesTransmitted;
  v5 = a3;
  objc_msgSend(v5, "encodeInteger:forKey:", bytesTransmitted, CFSTR("bytesTransmitted"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_bytesReceived, CFSTR("bytesReceived"));
  objc_msgSend(v5, "encodeInt64:forKey:", self->_durationUSeconds, CFSTR("duration"));
  objc_msgSend(v5, "encodeInt32:forKey:", self->_durationCount, CFSTR("durationCount"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_resultCounts, CFSTR("resultCounts"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_usedInterfaces, CFSTR("interfaces"));

}

- (unint64_t)hash
{
  unint64_t v2;

  v2 = self->_bytesReceived ^ self->_bytesTransmitted;
  return v2 ^ -[NSMutableDictionary hash](self->_resultCounts, "hash") ^ self->_durationUSeconds ^ self->_durationCount;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  _QWORD *v5;
  _QWORD *v6;
  int64_t v7;
  NSMutableDictionary *resultCounts;
  NSMutableDictionary *v9;
  char v10;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    v6 = v5;
    if (self->_bytesTransmitted != v5[1] || self->_bytesReceived != v5[2])
      goto LABEL_14;
    v7 = self->_durationUSeconds - v5[3];
    if (v7 < 0)
      v7 = v5[3] - self->_durationUSeconds;
    if ((unint64_t)v7 <= 9 && self->_durationCount == *((_DWORD *)v5 + 8) && self->_usedInterfaces == v5[6])
    {
      resultCounts = self->_resultCounts;
      v9 = (NSMutableDictionary *)v6[5];
      if (resultCounts == v9)
      {
        v10 = 1;
      }
      else
      {
        v10 = 0;
        if (resultCounts && v9)
          v10 = -[NSMutableDictionary isEqualToDictionary:](resultCounts, "isEqualToDictionary:");
      }
    }
    else
    {
LABEL_14:
      v10 = 0;
    }

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (void)incrementBytesTransmitted:(unint64_t)a3
{
  self->_bytesTransmitted += a3;
}

- (void)incrementBytesReceived:(unint64_t)a3
{
  self->_bytesReceived += a3;
}

- (void)incrementDuration:(double)a3
{
  ++self->_durationCount;
  self->_durationUSeconds += (unint64_t)(a3 * 1000000.0);
}

- (void)incrementCountForResult:(unsigned __int8)a3
{
  uint64_t v3;
  NSMutableDictionary *resultCounts;
  NSMutableDictionary *v6;
  NSMutableDictionary *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  NSMutableDictionary *v11;
  void *v12;
  id v13;

  v3 = a3;
  resultCounts = self->_resultCounts;
  if (!resultCounts)
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v6 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue();
    v7 = self->_resultCounts;
    self->_resultCounts = v6;

    resultCounts = self->_resultCounts;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedChar:", v3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKeyedSubscript:](resultCounts, "objectForKeyedSubscript:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "unsignedIntegerValue");

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v10 + 1);
  v13 = (id)objc_claimAutoreleasedReturnValue();
  v11 = self->_resultCounts;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedChar:", v3);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary setObject:forKeyedSubscript:](v11, "setObject:forKeyedSubscript:", v13, v12);

}

- (void)addUsedInterfaces:(unint64_t)a3
{
  self->_usedInterfaces |= a3;
}

- (unint64_t)countForResult:(unsigned __int8)a3
{
  NSMutableDictionary *resultCounts;
  void *v4;
  void *v5;
  unint64_t v6;

  resultCounts = self->_resultCounts;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedChar:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKeyedSubscript:](resultCounts, "objectForKeyedSubscript:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "unsignedIntegerValue");

  return v6;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  objc_super v7;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v7.receiver = self;
  v7.super_class = (Class)GEORequestCounterStatistics;
  -[GEORequestCounterStatistics description](&v7, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ {xmit: %llu recv: %llu duration: %lld duration count: %d result counts: %@}"), v4, self->_bytesTransmitted, self->_bytesReceived, self->_durationUSeconds, self->_durationCount, self->_resultCounts);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (unint64_t)bytesTransmitted
{
  return self->_bytesTransmitted;
}

- (unint64_t)bytesReceived
{
  return self->_bytesReceived;
}

- (int64_t)durationUSecondsTotal
{
  return self->_durationUSeconds;
}

- (int)durationCount
{
  return self->_durationCount;
}

- (unint64_t)usedInterfaces
{
  return self->_usedInterfaces;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_resultCounts, 0);
}

@end
