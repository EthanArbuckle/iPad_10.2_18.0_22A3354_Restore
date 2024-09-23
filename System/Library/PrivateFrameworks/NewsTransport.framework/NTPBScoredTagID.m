@implementation NTPBScoredTagID

- (NSString)tagId
{
  return self->_tagId;
}

- (float)score
{
  return self->_score;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tagId, 0);
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
  v8.super_class = (Class)NTPBScoredTagID;
  -[NTPBScoredTagID description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NTPBScoredTagID dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  double v4;
  void *v5;
  NSString *tagId;
  void *v7;

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v3;
  tagId = self->_tagId;
  if (tagId)
    objc_msgSend(v3, "setObject:forKey:", tagId, CFSTR("tag_id"));
  *(float *)&v4 = self->_score;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKey:", v7, CFSTR("score"));

  return v5;
}

- (BOOL)readFrom:(id)a3
{
  return NTPBScoredTagIDReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v3;

  v3 = a3;
  PBDataWriterWriteStringField();
  PBDataWriterWriteFloatField();

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  uint64_t v6;
  void *v7;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[NSString copyWithZone:](self->_tagId, "copyWithZone:", a3);
  v7 = *(void **)(v5 + 16);
  *(_QWORD *)(v5 + 16) = v6;

  *(float *)(v5 + 8) = self->_score;
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NSString *tagId;
  BOOL v6;

  v4 = a3;
  v6 = objc_msgSend(v4, "isMemberOfClass:", objc_opt_class())
    && ((tagId = self->_tagId, !((unint64_t)tagId | *((_QWORD *)v4 + 2)))
     || -[NSString isEqual:](tagId, "isEqual:"))
    && self->_score == *((float *)v4 + 2);

  return v6;
}

- (unint64_t)hash
{
  NSUInteger v3;
  float score;
  float v5;
  float v6;
  float v7;
  unint64_t v8;
  unint64_t v9;
  float v10;
  unint64_t v11;

  v3 = -[NSString hash](self->_tagId, "hash");
  score = self->_score;
  v5 = -score;
  if (score >= 0.0)
    v5 = self->_score;
  v6 = floorf(v5 + 0.5);
  v7 = (float)(v5 - v6) * 1.8447e19;
  v8 = 2654435761u * (unint64_t)fmodf(v6, 1.8447e19);
  v9 = v8 + (unint64_t)v7;
  v10 = fabsf(v7);
  if (v7 <= 0.0)
    v9 = v8;
  v11 = v8 - (unint64_t)v10;
  if (v7 >= 0.0)
    v11 = v9;
  return v11 ^ v3;
}

- (void)mergeFrom:(id)a3
{
  float *v4;
  float *v5;

  v4 = (float *)a3;
  if (*((_QWORD *)v4 + 2))
  {
    v5 = v4;
    -[NTPBScoredTagID setTagId:](self, "setTagId:");
    v4 = v5;
  }
  self->_score = v4[2];

}

- (void)setTagId:(id)a3
{
  objc_storeStrong((id *)&self->_tagId, a3);
}

- (void)setScore:(float)a3
{
  self->_score = a3;
}

@end
