@implementation VCPProtoMovieLoudnessResult

+ (id)resultFromLegacyDictionary:(id)a3
{
  const __CFDictionary *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  VCPProtoMovieLoudnessResult *v8;
  BOOL v9;
  void *v10;
  CMTimeRange v12;
  CMTimeRange v13;

  v3 = (const __CFDictionary *)a3;
  memset(&v13, 0, sizeof(v13));
  CMTimeRangeMakeFromDictionary(&v13, v3);
  -[__CFDictionary objectForKeyedSubscript:](v3, "objectForKeyedSubscript:", CFSTR("attributes"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("energyValues"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("peakValues"));
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = (void *)v6;
  if ((v13.start.flags & 1) != 0)
  {
    v8 = 0;
    if ((v13.duration.flags & 1) != 0 && !v13.duration.epoch)
    {
      v8 = 0;
      if ((v13.duration.value & 0x8000000000000000) == 0)
      {
        if (v5)
          v9 = v6 == 0;
        else
          v9 = 1;
        if (!v9)
        {
          v8 = objc_alloc_init(VCPProtoMovieLoudnessResult);
          v12 = v13;
          +[VCPProtoTimeRange timeRangeWithCMTimeRange:](VCPProtoTimeRange, "timeRangeWithCMTimeRange:", &v12);
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          -[VCPProtoMovieLoudnessResult setTimeRange:](v8, "setTimeRange:", v10);

          objc_msgSend(v5, "doubleValue");
          -[VCPProtoMovieLoudnessResult setEnergy:](v8, "setEnergy:");
          objc_msgSend(v7, "doubleValue");
          -[VCPProtoMovieLoudnessResult setPeak:](v8, "setPeak:");
        }
      }
    }
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (id)exportToLegacyDictionary
{
  void *v3;
  void *v4;
  CFDictionaryRef v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  CMTimeRange v13;
  CMTimeRange range;
  _QWORD v15[2];
  _QWORD v16[3];

  v16[2] = *MEMORY[0x1E0C80C00];
  -[VCPProtoMovieLoudnessResult timeRange](self, "timeRange");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
    objc_msgSend(v3, "timeRangeValue");
  else
    memset(&v13, 0, sizeof(v13));
  range = v13;
  v5 = CMTimeRangeCopyAsDictionary(&range, 0);
  v6 = (void *)-[__CFDictionary mutableCopy](v5, "mutableCopy");

  v15[0] = CFSTR("energyValues");
  v7 = (void *)MEMORY[0x1E0CB37E8];
  -[VCPProtoMovieLoudnessResult energy](self, "energy");
  objc_msgSend(v7, "numberWithDouble:");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = v8;
  v15[1] = CFSTR("peakValues");
  v9 = (void *)MEMORY[0x1E0CB37E8];
  -[VCPProtoMovieLoudnessResult peak](self, "peak");
  objc_msgSend(v9, "numberWithDouble:");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v16[1] = v10;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v16, v15, 2);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v11, CFSTR("attributes"));

  return v6;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v8.receiver = self;
  v8.super_class = (Class)VCPProtoMovieLoudnessResult;
  -[VCPProtoMovieLoudnessResult description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[VCPProtoMovieLoudnessResult dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  VCPProtoTimeRange *timeRange;
  void *v5;
  void *v6;
  void *v7;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  timeRange = self->_timeRange;
  if (timeRange)
  {
    -[VCPProtoTimeRange dictionaryRepresentation](timeRange, "dictionaryRepresentation");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("timeRange"));

  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_energy);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v6, CFSTR("energy"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_peak);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v7, CFSTR("peak"));

  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return VCPProtoMovieLoudnessResultReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v3;

  v3 = a3;
  PBDataWriterWriteSubmessage();
  PBDataWriterWriteDoubleField();
  PBDataWriterWriteDoubleField();

}

- (void)copyTo:(id)a3
{
  VCPProtoTimeRange *timeRange;
  double *v5;

  timeRange = self->_timeRange;
  v5 = (double *)a3;
  objc_msgSend(v5, "setTimeRange:", timeRange);
  v5[1] = self->_energy;
  v5[2] = self->_peak;

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  id v6;
  void *v7;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[VCPProtoTimeRange copyWithZone:](self->_timeRange, "copyWithZone:", a3);
  v7 = *(void **)(v5 + 24);
  *(_QWORD *)(v5 + 24) = v6;

  *(double *)(v5 + 8) = self->_energy;
  *(double *)(v5 + 16) = self->_peak;
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  VCPProtoTimeRange *timeRange;
  BOOL v6;

  v4 = a3;
  v6 = objc_msgSend(v4, "isMemberOfClass:", objc_opt_class())
    && ((timeRange = self->_timeRange, !((unint64_t)timeRange | *((_QWORD *)v4 + 3)))
     || -[VCPProtoTimeRange isEqual:](timeRange, "isEqual:"))
    && self->_energy == *((double *)v4 + 1)
    && self->_peak == *((double *)v4 + 2);

  return v6;
}

- (unint64_t)hash
{
  unint64_t v3;
  double energy;
  double v5;
  long double v6;
  double v7;
  double v8;
  unint64_t v9;
  unint64_t v10;
  unint64_t v11;
  unint64_t v12;
  double peak;
  double v14;
  long double v15;
  double v16;
  double v17;
  unint64_t v18;
  unint64_t v19;
  unint64_t v20;

  v3 = -[VCPProtoTimeRange hash](self->_timeRange, "hash");
  energy = self->_energy;
  v5 = -energy;
  if (energy >= 0.0)
    v5 = self->_energy;
  v6 = floor(v5 + 0.5);
  v7 = (v5 - v6) * 1.84467441e19;
  v8 = fmod(v6, 1.84467441e19);
  v9 = 2654435761u * (unint64_t)v8;
  v10 = v9 + (unint64_t)v7;
  if (v7 <= 0.0)
    v10 = 2654435761u * (unint64_t)v8;
  v11 = v9 - (unint64_t)fabs(v7);
  if (v7 < 0.0)
    v12 = v11;
  else
    v12 = v10;
  peak = self->_peak;
  v14 = -peak;
  if (peak >= 0.0)
    v14 = self->_peak;
  v15 = floor(v14 + 0.5);
  v16 = (v14 - v15) * 1.84467441e19;
  v17 = fmod(v15, 1.84467441e19);
  v18 = 2654435761u * (unint64_t)v17;
  v19 = v18 + (unint64_t)v16;
  if (v16 <= 0.0)
    v19 = 2654435761u * (unint64_t)v17;
  v20 = v18 - (unint64_t)fabs(v16);
  if (v16 >= 0.0)
    v20 = v19;
  return v12 ^ v3 ^ v20;
}

- (void)mergeFrom:(id)a3
{
  id v4;
  VCPProtoTimeRange *timeRange;
  uint64_t v6;
  id v7;

  v4 = a3;
  timeRange = self->_timeRange;
  v6 = *((_QWORD *)v4 + 3);
  if (timeRange)
  {
    if (v6)
    {
      v7 = v4;
      -[VCPProtoTimeRange mergeFrom:](timeRange, "mergeFrom:");
LABEL_6:
      v4 = v7;
    }
  }
  else if (v6)
  {
    v7 = v4;
    -[VCPProtoMovieLoudnessResult setTimeRange:](self, "setTimeRange:");
    goto LABEL_6;
  }
  self->_energy = *((double *)v4 + 1);
  self->_peak = *((double *)v4 + 2);

}

- (VCPProtoTimeRange)timeRange
{
  return self->_timeRange;
}

- (void)setTimeRange:(id)a3
{
  objc_storeStrong((id *)&self->_timeRange, a3);
}

- (double)energy
{
  return self->_energy;
}

- (void)setEnergy:(double)a3
{
  self->_energy = a3;
}

- (double)peak
{
  return self->_peak;
}

- (void)setPeak:(double)a3
{
  self->_peak = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timeRange, 0);
}

@end
