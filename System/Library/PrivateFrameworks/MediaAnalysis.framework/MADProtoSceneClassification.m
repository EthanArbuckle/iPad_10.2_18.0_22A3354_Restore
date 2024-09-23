@implementation MADProtoSceneClassification

+ (id)protoFromPhotosSceneClassification:(id)a3
{
  id v3;
  MADProtoSceneClassification *v4;
  void *v5;
  CGRect v7;

  v3 = a3;
  v4 = objc_alloc_init(MADProtoSceneClassification);
  -[MADProtoSceneClassification setExtendedSceneIdentifier:](v4, "setExtendedSceneIdentifier:", objc_msgSend(v3, "extendedSceneIdentifier"));
  objc_msgSend(v3, "confidence");
  -[MADProtoSceneClassification setConfidence:](v4, "setConfidence:");
  objc_msgSend(v3, "boundingBox");
  if (!CGRectIsEmpty(v7))
  {
    objc_msgSend(v3, "boundingBox");
    +[VCPProtoBounds boundsWithCGRect:](VCPProtoBounds, "boundsWithCGRect:");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[MADProtoSceneClassification setBoundingBox:](v4, "setBoundingBox:", v5);

  }
  return v4;
}

- (id)photosSceneClassification
{
  _BOOL4 v3;
  id v4;
  unint64_t v5;
  double v6;
  double v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  void *v13;

  v3 = -[MADProtoSceneClassification hasBoundingBox](self, "hasBoundingBox");
  v4 = objc_alloc(MEMORY[0x1E0CD1758]);
  v5 = -[MADProtoSceneClassification extendedSceneIdentifier](self, "extendedSceneIdentifier");
  -[MADProtoSceneClassification confidence](self, "confidence");
  v7 = v6;
  if (v3)
  {
    -[MADProtoSceneClassification boundingBox](self, "boundingBox");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "rectValue");
    v13 = (void *)objc_msgSend(v4, "initWithExtendedSceneIdentifier:confidence:boundingBox:startTime:duration:classificationType:", v5, 0, v7, v9, v10, v11, v12, 0.0, 0.0);

  }
  else
  {
    v13 = (void *)objc_msgSend(v4, "initWithExtendedSceneIdentifier:confidence:boundingBox:startTime:duration:classificationType:", v5, 0, v6, *MEMORY[0x1E0C9D628], *(double *)(MEMORY[0x1E0C9D628] + 8), *(double *)(MEMORY[0x1E0C9D628] + 16), *(double *)(MEMORY[0x1E0C9D628] + 24), 0.0, 0.0);
  }
  return v13;
}

- (BOOL)hasBoundingBox
{
  return self->_boundingBox != 0;
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
  v8.super_class = (Class)MADProtoSceneClassification;
  -[MADProtoSceneClassification description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[MADProtoSceneClassification dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  void *v5;
  VCPProtoBounds *boundingBox;
  void *v7;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", self->_extendedSceneIdentifier);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v4, CFSTR("extendedSceneIdentifier"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_confidence);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("confidence"));

  boundingBox = self->_boundingBox;
  if (boundingBox)
  {
    -[VCPProtoBounds dictionaryRepresentation](boundingBox, "dictionaryRepresentation");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v7, CFSTR("boundingBox"));

  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return MADProtoSceneClassificationReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;

  v4 = a3;
  PBDataWriterWriteUint64Field();
  PBDataWriterWriteDoubleField();
  if (self->_boundingBox)
    PBDataWriterWriteSubmessage();

}

- (void)copyTo:(id)a3
{
  VCPProtoBounds *boundingBox;

  *((_QWORD *)a3 + 2) = self->_extendedSceneIdentifier;
  *((_QWORD *)a3 + 1) = *(_QWORD *)&self->_confidence;
  boundingBox = self->_boundingBox;
  if (boundingBox)
    objc_msgSend(a3, "setBoundingBox:", boundingBox);
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  id v6;
  void *v7;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  *(_QWORD *)(v5 + 16) = self->_extendedSceneIdentifier;
  *(double *)(v5 + 8) = self->_confidence;
  v6 = -[VCPProtoBounds copyWithZone:](self->_boundingBox, "copyWithZone:", a3);
  v7 = *(void **)(v5 + 24);
  *(_QWORD *)(v5 + 24) = v6;

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  VCPProtoBounds *boundingBox;
  char v6;

  v4 = a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class())
    && self->_extendedSceneIdentifier == v4[2]
    && self->_confidence == *((double *)v4 + 1))
  {
    boundingBox = self->_boundingBox;
    if ((unint64_t)boundingBox | v4[3])
      v6 = -[VCPProtoBounds isEqual:](boundingBox, "isEqual:");
    else
      v6 = 1;
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (unint64_t)hash
{
  unint64_t extendedSceneIdentifier;
  double confidence;
  double v5;
  long double v6;
  double v7;
  double v8;
  unint64_t v9;
  unint64_t v10;
  unint64_t v11;
  unint64_t v12;

  extendedSceneIdentifier = self->_extendedSceneIdentifier;
  confidence = self->_confidence;
  v5 = -confidence;
  if (confidence >= 0.0)
    v5 = self->_confidence;
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
  return v12 ^ (2654435761u * extendedSceneIdentifier) ^ -[VCPProtoBounds hash](self->_boundingBox, "hash");
}

- (void)mergeFrom:(id)a3
{
  id v4;
  VCPProtoBounds *boundingBox;
  uint64_t v6;
  id v7;

  v4 = a3;
  self->_extendedSceneIdentifier = *((_QWORD *)v4 + 2);
  self->_confidence = *((double *)v4 + 1);
  boundingBox = self->_boundingBox;
  v6 = *((_QWORD *)v4 + 3);
  if (boundingBox)
  {
    if (v6)
    {
      v7 = v4;
      -[VCPProtoBounds mergeFrom:](boundingBox, "mergeFrom:");
LABEL_6:
      v4 = v7;
    }
  }
  else if (v6)
  {
    v7 = v4;
    -[MADProtoSceneClassification setBoundingBox:](self, "setBoundingBox:");
    goto LABEL_6;
  }

}

- (unint64_t)extendedSceneIdentifier
{
  return self->_extendedSceneIdentifier;
}

- (void)setExtendedSceneIdentifier:(unint64_t)a3
{
  self->_extendedSceneIdentifier = a3;
}

- (double)confidence
{
  return self->_confidence;
}

- (void)setConfidence:(double)a3
{
  self->_confidence = a3;
}

- (VCPProtoBounds)boundingBox
{
  return self->_boundingBox;
}

- (void)setBoundingBox:(id)a3
{
  objc_storeStrong((id *)&self->_boundingBox, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_boundingBox, 0);
}

@end
