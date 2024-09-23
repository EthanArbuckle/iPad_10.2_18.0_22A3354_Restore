@implementation VCPProtoTimeRange

+ (VCPProtoTimeRange)timeRangeWithCMTimeRange:(id *)a3
{
  VCPProtoTimeRange *v4;
  void *v5;
  void *v6;
  $3CC8671D27C23BF42ADDB32F2B5E48AE var0;

  v4 = objc_alloc_init(VCPProtoTimeRange);
  var0 = a3->var0;
  +[VCPProtoTime timeWithCMTime:](VCPProtoTime, "timeWithCMTime:", &var0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[VCPProtoTimeRange setStart:](v4, "setStart:", v5);

  var0 = a3->var1;
  +[VCPProtoTime timeWithCMTime:](VCPProtoTime, "timeWithCMTime:", &var0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[VCPProtoTimeRange setDuration:](v4, "setDuration:", v6);

  return v4;
}

- ($C7CBA4C8288BA02ADCCB8E56B4665FF4)timeRangeValue
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  $C7CBA4C8288BA02ADCCB8E56B4665FF4 *result;
  CMTime v10;
  CMTime start;

  -[VCPProtoTimeRange start](self, "start");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
    objc_msgSend(v5, "timeValue");
  else
    memset(&start, 0, sizeof(start));
  -[VCPProtoTimeRange duration](self, "duration");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v7)
    objc_msgSend(v7, "timeValue");
  else
    memset(&v10, 0, sizeof(v10));
  CMTimeRangeMake((CMTimeRange *)retstr, &start, &v10);

  return result;
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
  v8.super_class = (Class)VCPProtoTimeRange;
  -[VCPProtoTimeRange description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[VCPProtoTimeRange dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  VCPProtoTime *start;
  void *v5;
  VCPProtoTime *duration;
  void *v7;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  start = self->_start;
  if (start)
  {
    -[VCPProtoTime dictionaryRepresentation](start, "dictionaryRepresentation");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("start"));

  }
  duration = self->_duration;
  if (duration)
  {
    -[VCPProtoTime dictionaryRepresentation](duration, "dictionaryRepresentation");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v7, CFSTR("duration"));

  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return VCPProtoTimeRangeReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v3;

  v3 = a3;
  PBDataWriterWriteSubmessage();
  PBDataWriterWriteSubmessage();

}

- (void)copyTo:(id)a3
{
  VCPProtoTime *start;
  id v5;

  start = self->_start;
  v5 = a3;
  objc_msgSend(v5, "setStart:", start);
  objc_msgSend(v5, "setDuration:", self->_duration);

}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v5;
  id v6;
  void *v7;
  id v8;
  void *v9;

  v5 = (_QWORD *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[VCPProtoTime copyWithZone:](self->_start, "copyWithZone:", a3);
  v7 = (void *)v5[2];
  v5[2] = v6;

  v8 = -[VCPProtoTime copyWithZone:](self->_duration, "copyWithZone:", a3);
  v9 = (void *)v5[1];
  v5[1] = v8;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  VCPProtoTime *start;
  VCPProtoTime *duration;
  char v7;

  v4 = a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class())
    && ((start = self->_start, !((unint64_t)start | v4[2])) || -[VCPProtoTime isEqual:](start, "isEqual:")))
  {
    duration = self->_duration;
    if ((unint64_t)duration | v4[1])
      v7 = -[VCPProtoTime isEqual:](duration, "isEqual:");
    else
      v7 = 1;
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (unint64_t)hash
{
  unint64_t v3;

  v3 = -[VCPProtoTime hash](self->_start, "hash");
  return -[VCPProtoTime hash](self->_duration, "hash") ^ v3;
}

- (void)mergeFrom:(id)a3
{
  _QWORD *v4;
  VCPProtoTime *start;
  uint64_t v6;
  VCPProtoTime *duration;
  uint64_t v8;
  _QWORD *v9;

  v4 = a3;
  start = self->_start;
  v6 = v4[2];
  v9 = v4;
  if (start)
  {
    if (!v6)
      goto LABEL_7;
    -[VCPProtoTime mergeFrom:](start, "mergeFrom:");
  }
  else
  {
    if (!v6)
      goto LABEL_7;
    -[VCPProtoTimeRange setStart:](self, "setStart:");
  }
  v4 = v9;
LABEL_7:
  duration = self->_duration;
  v8 = v4[1];
  if (duration)
  {
    if (v8)
    {
      -[VCPProtoTime mergeFrom:](duration, "mergeFrom:");
LABEL_12:
      v4 = v9;
    }
  }
  else if (v8)
  {
    -[VCPProtoTimeRange setDuration:](self, "setDuration:");
    goto LABEL_12;
  }

}

- (VCPProtoTime)start
{
  return self->_start;
}

- (void)setStart:(id)a3
{
  objc_storeStrong((id *)&self->_start, a3);
}

- (VCPProtoTime)duration
{
  return self->_duration;
}

- (void)setDuration:(id)a3
{
  objc_storeStrong((id *)&self->_duration, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_start, 0);
  objc_storeStrong((id *)&self->_duration, 0);
}

@end
