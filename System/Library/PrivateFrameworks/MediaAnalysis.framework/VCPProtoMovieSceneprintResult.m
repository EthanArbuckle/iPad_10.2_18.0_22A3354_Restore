@implementation VCPProtoMovieSceneprintResult

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v8.receiver = self;
  v8.super_class = (Class)VCPProtoMovieSceneprintResult;
  -[VCPProtoMovieSceneprintResult description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[VCPProtoMovieSceneprintResult dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  VCPProtoTime *timestamp;
  void *v5;
  NSData *sceneprintBlob;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  timestamp = self->_timestamp;
  if (timestamp)
  {
    -[VCPProtoTime dictionaryRepresentation](timestamp, "dictionaryRepresentation");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("timestamp"));

  }
  sceneprintBlob = self->_sceneprintBlob;
  if (sceneprintBlob)
    objc_msgSend(v3, "setObject:forKey:", sceneprintBlob, CFSTR("sceneprintBlob"));
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return VCPProtoMovieSceneprintResultReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v3;

  v3 = a3;
  PBDataWriterWriteSubmessage();
  PBDataWriterWriteDataField();

}

- (void)copyTo:(id)a3
{
  VCPProtoTime *timestamp;
  id v5;

  timestamp = self->_timestamp;
  v5 = a3;
  objc_msgSend(v5, "setTimestamp:", timestamp);
  objc_msgSend(v5, "setSceneprintBlob:", self->_sceneprintBlob);

}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v5;
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;

  v5 = (_QWORD *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[VCPProtoTime copyWithZone:](self->_timestamp, "copyWithZone:", a3);
  v7 = (void *)v5[2];
  v5[2] = v6;

  v8 = -[NSData copyWithZone:](self->_sceneprintBlob, "copyWithZone:", a3);
  v9 = (void *)v5[1];
  v5[1] = v8;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  VCPProtoTime *timestamp;
  NSData *sceneprintBlob;
  char v7;

  v4 = a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class())
    && ((timestamp = self->_timestamp, !((unint64_t)timestamp | v4[2]))
     || -[VCPProtoTime isEqual:](timestamp, "isEqual:")))
  {
    sceneprintBlob = self->_sceneprintBlob;
    if ((unint64_t)sceneprintBlob | v4[1])
      v7 = -[NSData isEqual:](sceneprintBlob, "isEqual:");
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

  v3 = -[VCPProtoTime hash](self->_timestamp, "hash");
  return -[NSData hash](self->_sceneprintBlob, "hash") ^ v3;
}

- (void)mergeFrom:(id)a3
{
  _QWORD *v4;
  VCPProtoTime *timestamp;
  uint64_t v6;
  _QWORD *v7;

  v4 = a3;
  timestamp = self->_timestamp;
  v6 = v4[2];
  v7 = v4;
  if (timestamp)
  {
    if (!v6)
      goto LABEL_7;
    -[VCPProtoTime mergeFrom:](timestamp, "mergeFrom:");
  }
  else
  {
    if (!v6)
      goto LABEL_7;
    -[VCPProtoMovieSceneprintResult setTimestamp:](self, "setTimestamp:");
  }
  v4 = v7;
LABEL_7:
  if (v4[1])
  {
    -[VCPProtoMovieSceneprintResult setSceneprintBlob:](self, "setSceneprintBlob:");
    v4 = v7;
  }

}

- (VCPProtoTime)timestamp
{
  return self->_timestamp;
}

- (void)setTimestamp:(id)a3
{
  objc_storeStrong((id *)&self->_timestamp, a3);
}

- (NSData)sceneprintBlob
{
  return self->_sceneprintBlob;
}

- (void)setSceneprintBlob:(id)a3
{
  objc_storeStrong((id *)&self->_sceneprintBlob, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timestamp, 0);
  objc_storeStrong((id *)&self->_sceneprintBlob, 0);
}

+ (id)resultFromLegacyDictionary:(id)a3
{
  id v3;
  const __CFDictionary *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  VCPProtoMovieSceneprintResult *v8;
  void *v9;
  CMTime v11;
  CMTime v12;

  v3 = a3;
  memset(&v12, 0, sizeof(v12));
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("start"));
  v4 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();
  CMTimeMakeFromDictionary(&v12, v4);

  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("attributes"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("sceneprint"));
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = (void *)v6;
  v8 = 0;
  if ((v12.flags & 1) != 0 && v6)
  {
    v8 = objc_alloc_init(VCPProtoMovieSceneprintResult);
    v11 = v12;
    +[VCPProtoTime timeWithCMTime:](VCPProtoTime, "timeWithCMTime:", &v11);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[VCPProtoMovieSceneprintResult setTimestamp:](v8, "setTimestamp:", v9);

    -[VCPProtoMovieSceneprintResult setSceneprintBlob:](v8, "setSceneprintBlob:", v7);
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
  CMTime v10;
  CMTime time;
  const __CFString *v12;
  void *v13;
  _QWORD v14[2];
  _QWORD v15[3];

  v15[2] = *MEMORY[0x1E0C80C00];
  v14[0] = CFSTR("start");
  -[VCPProtoMovieSceneprintResult timestamp](self, "timestamp");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
    objc_msgSend(v3, "timeValue");
  else
    memset(&v10, 0, sizeof(v10));
  time = v10;
  v5 = CMTimeCopyAsDictionary(&time, 0);
  v15[0] = v5;
  v14[1] = CFSTR("attributes");
  v12 = CFSTR("sceneprint");
  -[VCPProtoMovieSceneprintResult sceneprintBlob](self, "sceneprintBlob");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v6;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v13, &v12, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v15[1] = v7;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v15, v14, 2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

@end
