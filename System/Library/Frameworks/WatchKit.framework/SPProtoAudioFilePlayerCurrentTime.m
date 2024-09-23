@implementation SPProtoAudioFilePlayerCurrentTime

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v8.receiver = self;
  v8.super_class = (Class)SPProtoAudioFilePlayerCurrentTime;
  -[SPProtoAudioFilePlayerCurrentTime description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SPProtoAudioFilePlayerCurrentTime dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", self->_currentTime);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v4, CFSTR("currentTime"));

  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return SPProtoAudioFilePlayerCurrentTimeReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  PBDataWriterWriteDoubleField();
}

- (void)copyTo:(id)a3
{
  *((_QWORD *)a3 + 1) = *(_QWORD *)&self->_currentTime;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result;

  result = (id)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  *((_QWORD *)result + 1) = *(_QWORD *)&self->_currentTime;
  return result;
}

- (BOOL)isEqual:(id)a3
{
  double *v4;
  BOOL v5;

  v4 = (double *)a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    v5 = self->_currentTime == v4[1];
  else
    v5 = 0;

  return v5;
}

- (unint64_t)hash
{
  double currentTime;
  double v3;
  long double v4;
  double v5;
  double v6;
  unint64_t v7;
  unint64_t v8;
  unint64_t v9;

  currentTime = self->_currentTime;
  v3 = -currentTime;
  if (currentTime >= 0.0)
    v3 = self->_currentTime;
  v4 = floor(v3 + 0.5);
  v5 = (v3 - v4) * 1.84467441e19;
  v6 = fmod(v4, 1.84467441e19);
  v7 = 2654435761u * (unint64_t)v6;
  v8 = v7 + (unint64_t)v5;
  if (v5 <= 0.0)
    v8 = 2654435761u * (unint64_t)v6;
  v9 = v7 - (unint64_t)fabs(v5);
  if (v5 < 0.0)
    return v9;
  else
    return v8;
}

- (void)mergeFrom:(id)a3
{
  self->_currentTime = *((double *)a3 + 1);
}

- (double)currentTime
{
  return self->_currentTime;
}

- (void)setCurrentTime:(double)a3
{
  self->_currentTime = a3;
}

@end
