@implementation NTPBWeightedTagID

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v8.receiver = self;
  v8.super_class = (Class)NTPBWeightedTagID;
  -[NTPBWeightedTagID description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NTPBWeightedTagID dictionaryRepresentation](self, "dictionaryRepresentation");
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
  *(float *)&v4 = self->_weight;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKey:", v7, CFSTR("weight"));

  return v5;
}

- (BOOL)readFrom:(id)a3
{
  return NTPBWeightedTagIDReadFrom((uint64_t)self, (uint64_t)a3);
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
  v7 = *(void **)(v5 + 8);
  *(_QWORD *)(v5 + 8) = v6;

  *(float *)(v5 + 16) = self->_weight;
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NSString *tagId;
  BOOL v6;

  v4 = a3;
  v6 = objc_msgSend(v4, "isMemberOfClass:", objc_opt_class())
    && ((tagId = self->_tagId, !((unint64_t)tagId | *((_QWORD *)v4 + 1)))
     || -[NSString isEqual:](tagId, "isEqual:"))
    && self->_weight == *((float *)v4 + 4);

  return v6;
}

- (unint64_t)hash
{
  NSUInteger v3;
  float weight;
  float v5;
  float v6;
  float v7;
  unint64_t v8;
  unint64_t v9;
  float v10;
  unint64_t v11;

  v3 = -[NSString hash](self->_tagId, "hash");
  weight = self->_weight;
  v5 = -weight;
  if (weight >= 0.0)
    v5 = self->_weight;
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
  if (*((_QWORD *)v4 + 1))
  {
    v5 = v4;
    -[NTPBWeightedTagID setTagId:](self, "setTagId:");
    v4 = v5;
  }
  self->_weight = v4[4];

}

- (NSString)tagId
{
  return self->_tagId;
}

- (void)setTagId:(id)a3
{
  objc_storeStrong((id *)&self->_tagId, a3);
}

- (float)weight
{
  return self->_weight;
}

- (void)setWeight:(float)a3
{
  self->_weight = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tagId, 0);
}

@end
