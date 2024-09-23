@implementation NTPBCoefficients

- (void)setAutofavoritedScoreCoefficient:(double)a3
{
  *(_WORD *)&self->_has |= 2u;
  self->_autofavoritedScoreCoefficient = a3;
}

- (void)setTabiScoreCoefficient:(double)a3
{
  *(_WORD *)&self->_has |= 0x100u;
  self->_tabiScoreCoefficient = a3;
}

- (void)setSubscribedTopicScoreCoefficient:(double)a3
{
  *(_WORD *)&self->_has |= 0x80u;
  self->_subscribedTopicScoreCoefficient = a3;
}

- (void)setSubscribedChannelScoreCoefficent:(double)a3
{
  *(_WORD *)&self->_has |= 0x40u;
  self->_subscribedChannelScoreCoefficent = a3;
}

- (void)setServerScoreCoefficient:(double)a3
{
  *(_WORD *)&self->_has |= 0x20u;
  self->_serverScoreCoefficient = a3;
}

- (void)setHalfLifeCoefficient:(double)a3
{
  *(_WORD *)&self->_has |= 0x10u;
  self->_halfLifeCoefficient = a3;
}

- (void)setConversionCoefficient:(double)a3
{
  *(_WORD *)&self->_has |= 8u;
  self->_conversionCoefficient = a3;
}

- (void)setClientScoreCoefficient:(double)a3
{
  *(_WORD *)&self->_has |= 4u;
  self->_clientScoreCoefficient = a3;
}

- (void)setArticleEmbeddingScoreCoefficient:(double)a3
{
  *(_WORD *)&self->_has |= 1u;
  self->_articleEmbeddingScoreCoefficient = a3;
}

- (void)setHasServerScoreCoefficient:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 32;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFDF | v3;
}

- (BOOL)hasServerScoreCoefficient
{
  return (*(_WORD *)&self->_has >> 5) & 1;
}

- (void)setHasClientScoreCoefficient:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFB | v3;
}

- (BOOL)hasClientScoreCoefficient
{
  return (*(_WORD *)&self->_has >> 2) & 1;
}

- (void)setHasSubscribedTopicScoreCoefficient:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 128;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFF7F | v3;
}

- (BOOL)hasSubscribedTopicScoreCoefficient
{
  return (*(_WORD *)&self->_has >> 7) & 1;
}

- (void)setHasSubscribedChannelScoreCoefficent:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 64;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFBF | v3;
}

- (BOOL)hasSubscribedChannelScoreCoefficent
{
  return (*(_WORD *)&self->_has >> 6) & 1;
}

- (void)setHasAutofavoritedScoreCoefficient:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFD | v3;
}

- (BOOL)hasAutofavoritedScoreCoefficient
{
  return (*(_WORD *)&self->_has >> 1) & 1;
}

- (void)setHasArticleEmbeddingScoreCoefficient:(BOOL)a3
{
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFE | a3;
}

- (BOOL)hasArticleEmbeddingScoreCoefficient
{
  return *(_WORD *)&self->_has & 1;
}

- (void)setHasTabiScoreCoefficient:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 256;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFEFF | v3;
}

- (BOOL)hasTabiScoreCoefficient
{
  return HIBYTE(*(_WORD *)&self->_has) & 1;
}

- (void)setHasConversionCoefficient:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFF7 | v3;
}

- (BOOL)hasConversionCoefficient
{
  return (*(_WORD *)&self->_has >> 3) & 1;
}

- (void)setHasHalfLifeCoefficient:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 16;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFEF | v3;
}

- (BOOL)hasHalfLifeCoefficient
{
  return (*(_WORD *)&self->_has >> 4) & 1;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v8.receiver = self;
  v8.super_class = (Class)NTPBCoefficients;
  -[NTPBCoefficients description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NTPBCoefficients dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  __int16 has;
  void *v5;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  has = (__int16)self->_has;
  if ((has & 0x20) != 0)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", self->_serverScoreCoefficient);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v7, CFSTR("server_score_coefficient"));

    has = (__int16)self->_has;
    if ((has & 4) == 0)
    {
LABEL_3:
      if ((has & 0x80) == 0)
        goto LABEL_4;
      goto LABEL_14;
    }
  }
  else if ((has & 4) == 0)
  {
    goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", self->_clientScoreCoefficient);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v8, CFSTR("client_score_coefficient"));

  has = (__int16)self->_has;
  if ((has & 0x80) == 0)
  {
LABEL_4:
    if ((has & 0x40) == 0)
      goto LABEL_5;
    goto LABEL_15;
  }
LABEL_14:
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", self->_subscribedTopicScoreCoefficient);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v9, CFSTR("subscribed_topic_score_coefficient"));

  has = (__int16)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_5:
    if ((has & 2) == 0)
      goto LABEL_6;
    goto LABEL_16;
  }
LABEL_15:
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", self->_subscribedChannelScoreCoefficent);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v10, CFSTR("subscribed_channel_score_coefficent"));

  has = (__int16)self->_has;
  if ((has & 2) == 0)
  {
LABEL_6:
    if ((has & 1) == 0)
      goto LABEL_7;
    goto LABEL_17;
  }
LABEL_16:
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", self->_autofavoritedScoreCoefficient);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v11, CFSTR("autofavorited_score_coefficient"));

  has = (__int16)self->_has;
  if ((has & 1) == 0)
  {
LABEL_7:
    if ((has & 0x100) == 0)
      goto LABEL_8;
    goto LABEL_18;
  }
LABEL_17:
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", self->_articleEmbeddingScoreCoefficient);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v12, CFSTR("article_embedding_score_coefficient"));

  has = (__int16)self->_has;
  if ((has & 0x100) == 0)
  {
LABEL_8:
    if ((has & 8) == 0)
      goto LABEL_9;
LABEL_19:
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", self->_conversionCoefficient);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v14, CFSTR("conversion_coefficient"));

    if ((*(_WORD *)&self->_has & 0x10) == 0)
      return v3;
    goto LABEL_10;
  }
LABEL_18:
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", self->_tabiScoreCoefficient);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v13, CFSTR("tabi_score_coefficient"));

  has = (__int16)self->_has;
  if ((has & 8) != 0)
    goto LABEL_19;
LABEL_9:
  if ((has & 0x10) != 0)
  {
LABEL_10:
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", self->_halfLifeCoefficient);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("half_life_coefficient"));

  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return NTPBCoefficientsReadFrom(self, a3);
}

- (void)writeTo:(id)a3
{
  __int16 has;
  id v5;

  v5 = a3;
  has = (__int16)self->_has;
  if ((has & 0x20) != 0)
  {
    PBDataWriterWriteDoubleField();
    has = (__int16)self->_has;
    if ((has & 4) == 0)
    {
LABEL_3:
      if ((has & 0x80) == 0)
        goto LABEL_4;
      goto LABEL_14;
    }
  }
  else if ((has & 4) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteDoubleField();
  has = (__int16)self->_has;
  if ((has & 0x80) == 0)
  {
LABEL_4:
    if ((has & 0x40) == 0)
      goto LABEL_5;
    goto LABEL_15;
  }
LABEL_14:
  PBDataWriterWriteDoubleField();
  has = (__int16)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_5:
    if ((has & 2) == 0)
      goto LABEL_6;
    goto LABEL_16;
  }
LABEL_15:
  PBDataWriterWriteDoubleField();
  has = (__int16)self->_has;
  if ((has & 2) == 0)
  {
LABEL_6:
    if ((has & 1) == 0)
      goto LABEL_7;
    goto LABEL_17;
  }
LABEL_16:
  PBDataWriterWriteDoubleField();
  has = (__int16)self->_has;
  if ((has & 1) == 0)
  {
LABEL_7:
    if ((has & 0x100) == 0)
      goto LABEL_8;
    goto LABEL_18;
  }
LABEL_17:
  PBDataWriterWriteDoubleField();
  has = (__int16)self->_has;
  if ((has & 0x100) == 0)
  {
LABEL_8:
    if ((has & 8) == 0)
      goto LABEL_9;
LABEL_19:
    PBDataWriterWriteDoubleField();
    if ((*(_WORD *)&self->_has & 0x10) == 0)
      goto LABEL_11;
    goto LABEL_10;
  }
LABEL_18:
  PBDataWriterWriteDoubleField();
  has = (__int16)self->_has;
  if ((has & 8) != 0)
    goto LABEL_19;
LABEL_9:
  if ((has & 0x10) != 0)
LABEL_10:
    PBDataWriterWriteDoubleField();
LABEL_11:

}

- (id)copyWithZone:(_NSZone *)a3
{
  id result;
  __int16 has;

  result = (id)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  has = (__int16)self->_has;
  if ((has & 0x20) != 0)
  {
    *((_QWORD *)result + 6) = *(_QWORD *)&self->_serverScoreCoefficient;
    *((_WORD *)result + 40) |= 0x20u;
    has = (__int16)self->_has;
    if ((has & 4) == 0)
    {
LABEL_3:
      if ((has & 0x80) == 0)
        goto LABEL_4;
      goto LABEL_14;
    }
  }
  else if ((has & 4) == 0)
  {
    goto LABEL_3;
  }
  *((_QWORD *)result + 3) = *(_QWORD *)&self->_clientScoreCoefficient;
  *((_WORD *)result + 40) |= 4u;
  has = (__int16)self->_has;
  if ((has & 0x80) == 0)
  {
LABEL_4:
    if ((has & 0x40) == 0)
      goto LABEL_5;
    goto LABEL_15;
  }
LABEL_14:
  *((_QWORD *)result + 8) = *(_QWORD *)&self->_subscribedTopicScoreCoefficient;
  *((_WORD *)result + 40) |= 0x80u;
  has = (__int16)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_5:
    if ((has & 2) == 0)
      goto LABEL_6;
    goto LABEL_16;
  }
LABEL_15:
  *((_QWORD *)result + 7) = *(_QWORD *)&self->_subscribedChannelScoreCoefficent;
  *((_WORD *)result + 40) |= 0x40u;
  has = (__int16)self->_has;
  if ((has & 2) == 0)
  {
LABEL_6:
    if ((has & 1) == 0)
      goto LABEL_7;
    goto LABEL_17;
  }
LABEL_16:
  *((_QWORD *)result + 2) = *(_QWORD *)&self->_autofavoritedScoreCoefficient;
  *((_WORD *)result + 40) |= 2u;
  has = (__int16)self->_has;
  if ((has & 1) == 0)
  {
LABEL_7:
    if ((has & 0x100) == 0)
      goto LABEL_8;
    goto LABEL_18;
  }
LABEL_17:
  *((_QWORD *)result + 1) = *(_QWORD *)&self->_articleEmbeddingScoreCoefficient;
  *((_WORD *)result + 40) |= 1u;
  has = (__int16)self->_has;
  if ((has & 0x100) == 0)
  {
LABEL_8:
    if ((has & 8) == 0)
      goto LABEL_9;
    goto LABEL_19;
  }
LABEL_18:
  *((_QWORD *)result + 9) = *(_QWORD *)&self->_tabiScoreCoefficient;
  *((_WORD *)result + 40) |= 0x100u;
  has = (__int16)self->_has;
  if ((has & 8) == 0)
  {
LABEL_9:
    if ((has & 0x10) == 0)
      return result;
    goto LABEL_10;
  }
LABEL_19:
  *((_QWORD *)result + 4) = *(_QWORD *)&self->_conversionCoefficient;
  *((_WORD *)result + 40) |= 8u;
  if ((*(_WORD *)&self->_has & 0x10) == 0)
    return result;
LABEL_10:
  *((_QWORD *)result + 5) = *(_QWORD *)&self->_halfLifeCoefficient;
  *((_WORD *)result + 40) |= 0x10u;
  return result;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  __int16 has;
  __int16 v6;
  BOOL v7;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_46;
  has = (__int16)self->_has;
  v6 = *((_WORD *)v4 + 40);
  if ((has & 0x20) != 0)
  {
    if ((v6 & 0x20) == 0 || self->_serverScoreCoefficient != *((double *)v4 + 6))
      goto LABEL_46;
  }
  else if ((v6 & 0x20) != 0)
  {
LABEL_46:
    v7 = 0;
    goto LABEL_47;
  }
  if ((has & 4) != 0)
  {
    if ((v6 & 4) == 0 || self->_clientScoreCoefficient != *((double *)v4 + 3))
      goto LABEL_46;
  }
  else if ((v6 & 4) != 0)
  {
    goto LABEL_46;
  }
  if ((has & 0x80) != 0)
  {
    if ((v6 & 0x80) == 0 || self->_subscribedTopicScoreCoefficient != *((double *)v4 + 8))
      goto LABEL_46;
  }
  else if ((v6 & 0x80) != 0)
  {
    goto LABEL_46;
  }
  if ((has & 0x40) != 0)
  {
    if ((v6 & 0x40) == 0 || self->_subscribedChannelScoreCoefficent != *((double *)v4 + 7))
      goto LABEL_46;
  }
  else if ((v6 & 0x40) != 0)
  {
    goto LABEL_46;
  }
  if ((has & 2) != 0)
  {
    if ((v6 & 2) == 0 || self->_autofavoritedScoreCoefficient != *((double *)v4 + 2))
      goto LABEL_46;
  }
  else if ((v6 & 2) != 0)
  {
    goto LABEL_46;
  }
  if ((has & 1) != 0)
  {
    if ((v6 & 1) == 0 || self->_articleEmbeddingScoreCoefficient != *((double *)v4 + 1))
      goto LABEL_46;
  }
  else if ((v6 & 1) != 0)
  {
    goto LABEL_46;
  }
  if ((*(_WORD *)&self->_has & 0x100) != 0)
  {
    if ((*((_WORD *)v4 + 40) & 0x100) == 0 || self->_tabiScoreCoefficient != *((double *)v4 + 9))
      goto LABEL_46;
  }
  else if ((*((_WORD *)v4 + 40) & 0x100) != 0)
  {
    goto LABEL_46;
  }
  if ((has & 8) != 0)
  {
    if ((v6 & 8) == 0 || self->_conversionCoefficient != *((double *)v4 + 4))
      goto LABEL_46;
  }
  else if ((v6 & 8) != 0)
  {
    goto LABEL_46;
  }
  v7 = (v6 & 0x10) == 0;
  if ((has & 0x10) != 0)
  {
    if ((v6 & 0x10) == 0 || self->_halfLifeCoefficient != *((double *)v4 + 5))
      goto LABEL_46;
    v7 = 1;
  }
LABEL_47:

  return v7;
}

- (unint64_t)hash
{
  __int16 has;
  unint64_t v4;
  double serverScoreCoefficient;
  double v6;
  long double v7;
  double v8;
  unint64_t v9;
  double clientScoreCoefficient;
  double v11;
  long double v12;
  double v13;
  unint64_t v14;
  double subscribedTopicScoreCoefficient;
  double v16;
  long double v17;
  double v18;
  unint64_t v19;
  double subscribedChannelScoreCoefficent;
  double v21;
  long double v22;
  double v23;
  unint64_t v24;
  double autofavoritedScoreCoefficient;
  double v26;
  long double v27;
  double v28;
  unint64_t v29;
  double articleEmbeddingScoreCoefficient;
  double v31;
  long double v32;
  double v33;
  unint64_t v34;
  unint64_t v35;
  unint64_t v36;
  double tabiScoreCoefficient;
  double v38;
  long double v39;
  double v40;
  unint64_t v41;
  double conversionCoefficient;
  double v43;
  long double v44;
  double v45;
  unint64_t v46;
  double halfLifeCoefficient;
  double v48;
  long double v49;
  double v50;
  unint64_t v52;

  has = (__int16)self->_has;
  if ((has & 0x20) != 0)
  {
    serverScoreCoefficient = self->_serverScoreCoefficient;
    v6 = -serverScoreCoefficient;
    if (serverScoreCoefficient >= 0.0)
      v6 = self->_serverScoreCoefficient;
    v7 = floor(v6 + 0.5);
    v8 = (v6 - v7) * 1.84467441e19;
    v4 = 2654435761u * (unint64_t)fmod(v7, 1.84467441e19);
    if (v8 >= 0.0)
    {
      if (v8 > 0.0)
        v4 += (unint64_t)v8;
    }
    else
    {
      v4 -= (unint64_t)fabs(v8);
    }
  }
  else
  {
    v4 = 0;
  }
  if ((has & 4) != 0)
  {
    clientScoreCoefficient = self->_clientScoreCoefficient;
    v11 = -clientScoreCoefficient;
    if (clientScoreCoefficient >= 0.0)
      v11 = self->_clientScoreCoefficient;
    v12 = floor(v11 + 0.5);
    v13 = (v11 - v12) * 1.84467441e19;
    v9 = 2654435761u * (unint64_t)fmod(v12, 1.84467441e19);
    if (v13 >= 0.0)
    {
      if (v13 > 0.0)
        v9 += (unint64_t)v13;
    }
    else
    {
      v9 -= (unint64_t)fabs(v13);
    }
  }
  else
  {
    v9 = 0;
  }
  if ((has & 0x80) != 0)
  {
    subscribedTopicScoreCoefficient = self->_subscribedTopicScoreCoefficient;
    v16 = -subscribedTopicScoreCoefficient;
    if (subscribedTopicScoreCoefficient >= 0.0)
      v16 = self->_subscribedTopicScoreCoefficient;
    v17 = floor(v16 + 0.5);
    v18 = (v16 - v17) * 1.84467441e19;
    v14 = 2654435761u * (unint64_t)fmod(v17, 1.84467441e19);
    if (v18 >= 0.0)
    {
      if (v18 > 0.0)
        v14 += (unint64_t)v18;
    }
    else
    {
      v14 -= (unint64_t)fabs(v18);
    }
  }
  else
  {
    v14 = 0;
  }
  if ((has & 0x40) != 0)
  {
    subscribedChannelScoreCoefficent = self->_subscribedChannelScoreCoefficent;
    v21 = -subscribedChannelScoreCoefficent;
    if (subscribedChannelScoreCoefficent >= 0.0)
      v21 = self->_subscribedChannelScoreCoefficent;
    v22 = floor(v21 + 0.5);
    v23 = (v21 - v22) * 1.84467441e19;
    v19 = 2654435761u * (unint64_t)fmod(v22, 1.84467441e19);
    if (v23 >= 0.0)
    {
      if (v23 > 0.0)
        v19 += (unint64_t)v23;
    }
    else
    {
      v19 -= (unint64_t)fabs(v23);
    }
  }
  else
  {
    v19 = 0;
  }
  if ((has & 2) != 0)
  {
    autofavoritedScoreCoefficient = self->_autofavoritedScoreCoefficient;
    v26 = -autofavoritedScoreCoefficient;
    if (autofavoritedScoreCoefficient >= 0.0)
      v26 = self->_autofavoritedScoreCoefficient;
    v27 = floor(v26 + 0.5);
    v28 = (v26 - v27) * 1.84467441e19;
    v24 = 2654435761u * (unint64_t)fmod(v27, 1.84467441e19);
    if (v28 >= 0.0)
    {
      if (v28 > 0.0)
        v24 += (unint64_t)v28;
    }
    else
    {
      v24 -= (unint64_t)fabs(v28);
    }
  }
  else
  {
    v24 = 0;
  }
  if ((has & 1) != 0)
  {
    articleEmbeddingScoreCoefficient = self->_articleEmbeddingScoreCoefficient;
    v31 = -articleEmbeddingScoreCoefficient;
    if (articleEmbeddingScoreCoefficient >= 0.0)
      v31 = self->_articleEmbeddingScoreCoefficient;
    v32 = floor(v31 + 0.5);
    v33 = (v31 - v32) * 1.84467441e19;
    v29 = 2654435761u * (unint64_t)fmod(v32, 1.84467441e19);
    if (v33 >= 0.0)
    {
      if (v33 > 0.0)
        v29 += (unint64_t)v33;
    }
    else
    {
      v29 -= (unint64_t)fabs(v33);
    }
  }
  else
  {
    v29 = 0;
  }
  v52 = v24;
  v34 = v14;
  if ((has & 0x100) != 0)
  {
    tabiScoreCoefficient = self->_tabiScoreCoefficient;
    v38 = -tabiScoreCoefficient;
    if (tabiScoreCoefficient >= 0.0)
      v38 = self->_tabiScoreCoefficient;
    v39 = floor(v38 + 0.5);
    v40 = (v38 - v39) * 1.84467441e19;
    v36 = 2654435761u * (unint64_t)fmod(v39, 1.84467441e19);
    v35 = v9;
    if (v40 >= 0.0)
    {
      if (v40 > 0.0)
        v36 += (unint64_t)v40;
    }
    else
    {
      v36 -= (unint64_t)fabs(v40);
    }
  }
  else
  {
    v35 = v9;
    v36 = 0;
  }
  if ((has & 8) != 0)
  {
    conversionCoefficient = self->_conversionCoefficient;
    v43 = -conversionCoefficient;
    if (conversionCoefficient >= 0.0)
      v43 = self->_conversionCoefficient;
    v44 = floor(v43 + 0.5);
    v45 = (v43 - v44) * 1.84467441e19;
    v41 = 2654435761u * (unint64_t)fmod(v44, 1.84467441e19);
    if (v45 >= 0.0)
    {
      if (v45 > 0.0)
        v41 += (unint64_t)v45;
    }
    else
    {
      v41 -= (unint64_t)fabs(v45);
    }
  }
  else
  {
    v41 = 0;
  }
  if ((has & 0x10) != 0)
  {
    halfLifeCoefficient = self->_halfLifeCoefficient;
    v48 = -halfLifeCoefficient;
    if (halfLifeCoefficient >= 0.0)
      v48 = self->_halfLifeCoefficient;
    v49 = floor(v48 + 0.5);
    v50 = (v48 - v49) * 1.84467441e19;
    v46 = 2654435761u * (unint64_t)fmod(v49, 1.84467441e19);
    if (v50 >= 0.0)
    {
      if (v50 > 0.0)
        v46 += (unint64_t)v50;
    }
    else
    {
      v46 -= (unint64_t)fabs(v50);
    }
  }
  else
  {
    v46 = 0;
  }
  return v35 ^ v4 ^ v34 ^ v19 ^ v52 ^ v29 ^ v36 ^ v41 ^ v46;
}

- (void)mergeFrom:(id)a3
{
  id v4;
  __int16 v5;

  v4 = a3;
  v5 = *((_WORD *)v4 + 40);
  if ((v5 & 0x20) != 0)
  {
    self->_serverScoreCoefficient = *((double *)v4 + 6);
    *(_WORD *)&self->_has |= 0x20u;
    v5 = *((_WORD *)v4 + 40);
    if ((v5 & 4) == 0)
    {
LABEL_3:
      if ((v5 & 0x80) == 0)
        goto LABEL_4;
      goto LABEL_14;
    }
  }
  else if ((v5 & 4) == 0)
  {
    goto LABEL_3;
  }
  self->_clientScoreCoefficient = *((double *)v4 + 3);
  *(_WORD *)&self->_has |= 4u;
  v5 = *((_WORD *)v4 + 40);
  if ((v5 & 0x80) == 0)
  {
LABEL_4:
    if ((v5 & 0x40) == 0)
      goto LABEL_5;
    goto LABEL_15;
  }
LABEL_14:
  self->_subscribedTopicScoreCoefficient = *((double *)v4 + 8);
  *(_WORD *)&self->_has |= 0x80u;
  v5 = *((_WORD *)v4 + 40);
  if ((v5 & 0x40) == 0)
  {
LABEL_5:
    if ((v5 & 2) == 0)
      goto LABEL_6;
    goto LABEL_16;
  }
LABEL_15:
  self->_subscribedChannelScoreCoefficent = *((double *)v4 + 7);
  *(_WORD *)&self->_has |= 0x40u;
  v5 = *((_WORD *)v4 + 40);
  if ((v5 & 2) == 0)
  {
LABEL_6:
    if ((v5 & 1) == 0)
      goto LABEL_7;
    goto LABEL_17;
  }
LABEL_16:
  self->_autofavoritedScoreCoefficient = *((double *)v4 + 2);
  *(_WORD *)&self->_has |= 2u;
  v5 = *((_WORD *)v4 + 40);
  if ((v5 & 1) == 0)
  {
LABEL_7:
    if ((v5 & 0x100) == 0)
      goto LABEL_8;
    goto LABEL_18;
  }
LABEL_17:
  self->_articleEmbeddingScoreCoefficient = *((double *)v4 + 1);
  *(_WORD *)&self->_has |= 1u;
  v5 = *((_WORD *)v4 + 40);
  if ((v5 & 0x100) == 0)
  {
LABEL_8:
    if ((v5 & 8) == 0)
      goto LABEL_9;
LABEL_19:
    self->_conversionCoefficient = *((double *)v4 + 4);
    *(_WORD *)&self->_has |= 8u;
    if ((*((_WORD *)v4 + 40) & 0x10) == 0)
      goto LABEL_11;
    goto LABEL_10;
  }
LABEL_18:
  self->_tabiScoreCoefficient = *((double *)v4 + 9);
  *(_WORD *)&self->_has |= 0x100u;
  v5 = *((_WORD *)v4 + 40);
  if ((v5 & 8) != 0)
    goto LABEL_19;
LABEL_9:
  if ((v5 & 0x10) != 0)
  {
LABEL_10:
    self->_halfLifeCoefficient = *((double *)v4 + 5);
    *(_WORD *)&self->_has |= 0x10u;
  }
LABEL_11:

}

- (double)serverScoreCoefficient
{
  return self->_serverScoreCoefficient;
}

- (double)clientScoreCoefficient
{
  return self->_clientScoreCoefficient;
}

- (double)subscribedTopicScoreCoefficient
{
  return self->_subscribedTopicScoreCoefficient;
}

- (double)subscribedChannelScoreCoefficent
{
  return self->_subscribedChannelScoreCoefficent;
}

- (double)autofavoritedScoreCoefficient
{
  return self->_autofavoritedScoreCoefficient;
}

- (double)articleEmbeddingScoreCoefficient
{
  return self->_articleEmbeddingScoreCoefficient;
}

- (double)tabiScoreCoefficient
{
  return self->_tabiScoreCoefficient;
}

- (double)conversionCoefficient
{
  return self->_conversionCoefficient;
}

- (double)halfLifeCoefficient
{
  return self->_halfLifeCoefficient;
}

@end
