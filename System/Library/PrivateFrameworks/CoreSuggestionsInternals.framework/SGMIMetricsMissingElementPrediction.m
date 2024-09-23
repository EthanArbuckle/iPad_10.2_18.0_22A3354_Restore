@implementation SGMIMetricsMissingElementPrediction

- (void)setPredictedMissingElementScore:(float)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_predictedMissingElementScore = a3;
}

- (void)setHasPredictedMissingElementScore:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasPredictedMissingElementScore
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)setFoundMatchingElement:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_foundMatchingElement = a3;
}

- (void)setHasFoundMatchingElement:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (BOOL)hasFoundMatchingElement
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
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
  v8.super_class = (Class)SGMIMetricsMissingElementPrediction;
  -[SGMIMetricsMissingElementPrediction description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SGMIMetricsMissingElementPrediction dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  double v4;
  char has;
  void *v6;
  void *v7;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    *(float *)&v4 = self->_predictedMissingElementScore;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v6, CFSTR("predictedMissingElementScore"));

    has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_foundMatchingElement);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v7, CFSTR("foundMatchingElement"));

  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return SGMIMetricsMissingElementPredictionReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  char has;
  id v6;

  v4 = a3;
  has = (char)self->_has;
  v6 = v4;
  if ((has & 1) != 0)
  {
    PBDataWriterWriteFloatField();
    v4 = v6;
    has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    PBDataWriterWriteBOOLField();
    v4 = v6;
  }

}

- (void)copyTo:(id)a3
{
  _DWORD *v4;
  char has;

  v4 = a3;
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    v4[2] = LODWORD(self->_predictedMissingElementScore);
    *((_BYTE *)v4 + 16) |= 1u;
    has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    *((_BYTE *)v4 + 12) = self->_foundMatchingElement;
    *((_BYTE *)v4 + 16) |= 2u;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  id result;
  char has;

  result = (id)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    *((_DWORD *)result + 2) = LODWORD(self->_predictedMissingElementScore);
    *((_BYTE *)result + 16) |= 1u;
    has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    *((_BYTE *)result + 12) = self->_foundMatchingElement;
    *((_BYTE *)result + 16) |= 2u;
  }
  return result;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  BOOL v5;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_9;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 16) & 1) == 0 || self->_predictedMissingElementScore != *((float *)v4 + 2))
      goto LABEL_9;
  }
  else if ((*((_BYTE *)v4 + 16) & 1) != 0)
  {
    goto LABEL_9;
  }
  v5 = (*((_BYTE *)v4 + 16) & 2) == 0;
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 16) & 2) == 0)
    {
LABEL_9:
      v5 = 0;
      goto LABEL_10;
    }
    if (self->_foundMatchingElement)
    {
      if (!*((_BYTE *)v4 + 12))
        goto LABEL_9;
    }
    else if (*((_BYTE *)v4 + 12))
    {
      goto LABEL_9;
    }
    v5 = 1;
  }
LABEL_10:

  return v5;
}

- (unint64_t)hash
{
  char has;
  unint64_t v4;
  float predictedMissingElementScore;
  float v6;
  float v7;
  float v8;
  uint64_t v9;

  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    predictedMissingElementScore = self->_predictedMissingElementScore;
    v6 = -predictedMissingElementScore;
    if (predictedMissingElementScore >= 0.0)
      v6 = self->_predictedMissingElementScore;
    v7 = floorf(v6 + 0.5);
    v8 = (float)(v6 - v7) * 1.8447e19;
    v4 = 2654435761u * (unint64_t)fmodf(v7, 1.8447e19);
    if (v8 >= 0.0)
    {
      if (v8 > 0.0)
        v4 += (unint64_t)v8;
    }
    else
    {
      v4 -= (unint64_t)fabsf(v8);
    }
  }
  else
  {
    v4 = 0;
  }
  if ((has & 2) != 0)
    v9 = 2654435761 * self->_foundMatchingElement;
  else
    v9 = 0;
  return v9 ^ v4;
}

- (void)mergeFrom:(id)a3
{
  id v4;
  char v5;

  v4 = a3;
  v5 = *((_BYTE *)v4 + 16);
  if ((v5 & 1) != 0)
  {
    self->_predictedMissingElementScore = *((float *)v4 + 2);
    *(_BYTE *)&self->_has |= 1u;
    v5 = *((_BYTE *)v4 + 16);
  }
  if ((v5 & 2) != 0)
  {
    self->_foundMatchingElement = *((_BYTE *)v4 + 12);
    *(_BYTE *)&self->_has |= 2u;
  }

}

- (float)predictedMissingElementScore
{
  return self->_predictedMissingElementScore;
}

- (BOOL)foundMatchingElement
{
  return self->_foundMatchingElement;
}

@end
