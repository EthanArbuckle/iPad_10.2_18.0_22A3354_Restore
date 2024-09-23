@implementation _INPBConfidenceScoreComponent

- (void)setScore:(float)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_score = a3;
}

- (BOOL)hasScore
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)setHasScore:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (void)setSource:(id)a3
{
  NSString *v4;
  NSString *source;

  v4 = (NSString *)objc_msgSend(a3, "copy");
  source = self->_source;
  self->_source = v4;

}

- (BOOL)hasSource
{
  return self->_source != 0;
}

- (BOOL)readFrom:(id)a3
{
  double v3;

  return _INPBConfidenceScoreComponentReadFrom(self, (uint64_t)a3, v3);
}

- (void)writeTo:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  v6 = a3;
  if (-[_INPBConfidenceScoreComponent hasScore](self, "hasScore"))
    PBDataWriterWriteFloatField();
  -[_INPBConfidenceScoreComponent source](self, "source");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = v6;
  if (v4)
  {
    PBDataWriterWriteStringField();
    v5 = v6;
  }

}

- (_INPBConfidenceScoreComponent)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  _INPBConfidenceScoreComponent *v6;
  uint64_t v7;
  void *v8;

  v4 = a3;
  NSStringFromSelector(sel_bytes);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "if_decodeBytesNoCopyForKey:", v5);
  v6 = (_INPBConfidenceScoreComponent *)objc_claimAutoreleasedReturnValue();

  if (v6
    || (v7 = objc_opt_class(),
        NSStringFromSelector(sel_data),
        v8 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v4, "decodeObjectOfClass:forKey:", v7, v8),
        v6 = (_INPBConfidenceScoreComponent *)objc_claimAutoreleasedReturnValue(),
        v8,
        v6))
  {
    self = -[_INPBConfidenceScoreComponent initWithData:](self, "initWithData:", v6);

    v6 = self;
  }

  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[_INPBConfidenceScoreComponent data](self, "data");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_bytes);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "if_encodeBytesNoCopy:forKey:", v6, v5);

}

- (id)copyWithZone:(_NSZone *)a3
{
  _INPBConfidenceScoreComponent *v5;
  void *v6;

  v5 = -[_INPBConfidenceScoreComponent init](+[_INPBConfidenceScoreComponent allocWithZone:](_INPBConfidenceScoreComponent, "allocWithZone:"), "init");
  if (-[_INPBConfidenceScoreComponent hasScore](self, "hasScore"))
  {
    -[_INPBConfidenceScoreComponent score](self, "score");
    -[_INPBConfidenceScoreComponent setScore:](v5, "setScore:");
  }
  v6 = (void *)-[NSString copyWithZone:](self->_source, "copyWithZone:", a3);
  -[_INPBConfidenceScoreComponent setSource:](v5, "setSource:", v6);

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  int v5;
  float score;
  float v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  char v15;
  BOOL v16;

  v4 = a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
  {
    v5 = -[_INPBConfidenceScoreComponent hasScore](self, "hasScore");
    if (v5 == objc_msgSend(v4, "hasScore"))
    {
      if (!-[_INPBConfidenceScoreComponent hasScore](self, "hasScore")
        || !objc_msgSend(v4, "hasScore")
        || (score = self->_score, objc_msgSend(v4, "score"), score == v7))
      {
        -[_INPBConfidenceScoreComponent source](self, "source");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "source");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = v9;
        if ((v8 == 0) != (v9 != 0))
        {
          -[_INPBConfidenceScoreComponent source](self, "source");
          v11 = objc_claimAutoreleasedReturnValue();
          if (!v11)
          {

LABEL_14:
            v16 = 1;
            goto LABEL_12;
          }
          v12 = (void *)v11;
          -[_INPBConfidenceScoreComponent source](self, "source");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "source");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          v15 = objc_msgSend(v13, "isEqual:", v14);

          if ((v15 & 1) != 0)
            goto LABEL_14;
        }
        else
        {

        }
      }
    }
  }
  v16 = 0;
LABEL_12:

  return v16;
}

- (unint64_t)hash
{
  float score;
  double v4;
  long double v5;
  double v6;
  unint64_t v7;

  if (-[_INPBConfidenceScoreComponent hasScore](self, "hasScore"))
  {
    score = self->_score;
    v4 = score;
    if (score < 0.0)
      v4 = -score;
    v5 = floor(v4 + 0.5);
    v6 = (v4 - v5) * 1.84467441e19;
    v7 = 2654435761u * (unint64_t)fmod(v5, 1.84467441e19);
    if (v6 >= 0.0)
    {
      if (v6 > 0.0)
        v7 += (unint64_t)v6;
    }
    else
    {
      v7 -= (unint64_t)fabs(v6);
    }
  }
  else
  {
    v7 = 0;
  }
  return -[NSString hash](self->_source, "hash") ^ v7;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[_INPBConfidenceScoreComponent hasScore](self, "hasScore"))
  {
    v4 = (void *)MEMORY[0x1E0CB37E8];
    -[_INPBConfidenceScoreComponent score](self, "score");
    objc_msgSend(v4, "numberWithFloat:");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("score"));

  }
  if (self->_source)
  {
    -[_INPBConfidenceScoreComponent source](self, "source");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (void *)objc_msgSend(v6, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("source"));

  }
  return v3;
}

- (float)score
{
  return self->_score;
}

- (NSString)source
{
  return self->_source;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_source, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
