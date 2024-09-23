@implementation VCPProtoImageCompositionResult

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v8.receiver = self;
  v8.super_class = (Class)VCPProtoImageCompositionResult;
  -[VCPProtoImageCompositionResult description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[VCPProtoImageCompositionResult dictionaryRepresentation](self, "dictionaryRepresentation");
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
  VCPProtoPoint *vanishingPoint;
  void *v7;
  VCPProtoLine *dominantLine;
  void *v9;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  *(float *)&v4 = self->_confidence;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("confidence"));

  vanishingPoint = self->_vanishingPoint;
  if (vanishingPoint)
  {
    -[VCPProtoPoint dictionaryRepresentation](vanishingPoint, "dictionaryRepresentation");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v7, CFSTR("vanishingPoint"));

  }
  dominantLine = self->_dominantLine;
  if (dominantLine)
  {
    -[VCPProtoLine dictionaryRepresentation](dominantLine, "dictionaryRepresentation");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v9, CFSTR("dominantLine"));

  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return VCPProtoImageCompositionResultReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v3;

  v3 = a3;
  PBDataWriterWriteFloatField();
  PBDataWriterWriteSubmessage();
  PBDataWriterWriteSubmessage();

}

- (void)copyTo:(id)a3
{
  VCPProtoPoint *vanishingPoint;
  id v5;

  *((_DWORD *)a3 + 2) = LODWORD(self->_confidence);
  vanishingPoint = self->_vanishingPoint;
  v5 = a3;
  objc_msgSend(v5, "setVanishingPoint:", vanishingPoint);
  objc_msgSend(v5, "setDominantLine:", self->_dominantLine);

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  id v6;
  void *v7;
  id v8;
  void *v9;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  *(float *)(v5 + 8) = self->_confidence;
  v6 = -[VCPProtoPoint copyWithZone:](self->_vanishingPoint, "copyWithZone:", a3);
  v7 = *(void **)(v5 + 24);
  *(_QWORD *)(v5 + 24) = v6;

  v8 = -[VCPProtoLine copyWithZone:](self->_dominantLine, "copyWithZone:", a3);
  v9 = *(void **)(v5 + 16);
  *(_QWORD *)(v5 + 16) = v8;

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  VCPProtoPoint *vanishingPoint;
  VCPProtoLine *dominantLine;
  char v7;

  v4 = a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class())
    && self->_confidence == *((float *)v4 + 2)
    && ((vanishingPoint = self->_vanishingPoint, !((unint64_t)vanishingPoint | v4[3]))
     || -[VCPProtoPoint isEqual:](vanishingPoint, "isEqual:")))
  {
    dominantLine = self->_dominantLine;
    if ((unint64_t)dominantLine | v4[2])
      v7 = -[VCPProtoLine isEqual:](dominantLine, "isEqual:");
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
  float confidence;
  float v4;
  float v5;
  float v6;
  float v7;
  unint64_t v8;
  unint64_t v9;
  unint64_t v10;
  unint64_t v11;
  unint64_t v12;

  confidence = self->_confidence;
  v4 = -confidence;
  if (confidence >= 0.0)
    v4 = self->_confidence;
  v5 = floorf(v4 + 0.5);
  v6 = (float)(v4 - v5) * 1.8447e19;
  v7 = fmodf(v5, 1.8447e19);
  v8 = 2654435761u * (unint64_t)v7;
  v9 = v8 + (unint64_t)v6;
  if (v6 <= 0.0)
    v9 = 2654435761u * (unint64_t)v7;
  v10 = v8 - (unint64_t)fabsf(v6);
  if (v6 < 0.0)
    v11 = v10;
  else
    v11 = v9;
  v12 = -[VCPProtoPoint hash](self->_vanishingPoint, "hash");
  return v12 ^ v11 ^ -[VCPProtoLine hash](self->_dominantLine, "hash");
}

- (void)mergeFrom:(id)a3
{
  float *v4;
  VCPProtoPoint *vanishingPoint;
  uint64_t v6;
  VCPProtoLine *dominantLine;
  uint64_t v8;
  float *v9;

  v4 = (float *)a3;
  self->_confidence = v4[2];
  vanishingPoint = self->_vanishingPoint;
  v6 = *((_QWORD *)v4 + 3);
  v9 = v4;
  if (vanishingPoint)
  {
    if (!v6)
      goto LABEL_7;
    -[VCPProtoPoint mergeFrom:](vanishingPoint, "mergeFrom:");
  }
  else
  {
    if (!v6)
      goto LABEL_7;
    -[VCPProtoImageCompositionResult setVanishingPoint:](self, "setVanishingPoint:");
  }
  v4 = v9;
LABEL_7:
  dominantLine = self->_dominantLine;
  v8 = *((_QWORD *)v4 + 2);
  if (dominantLine)
  {
    if (v8)
    {
      -[VCPProtoLine mergeFrom:](dominantLine, "mergeFrom:");
LABEL_12:
      v4 = v9;
    }
  }
  else if (v8)
  {
    -[VCPProtoImageCompositionResult setDominantLine:](self, "setDominantLine:");
    goto LABEL_12;
  }

}

- (float)confidence
{
  return self->_confidence;
}

- (void)setConfidence:(float)a3
{
  self->_confidence = a3;
}

- (VCPProtoPoint)vanishingPoint
{
  return self->_vanishingPoint;
}

- (void)setVanishingPoint:(id)a3
{
  objc_storeStrong((id *)&self->_vanishingPoint, a3);
}

- (VCPProtoLine)dominantLine
{
  return self->_dominantLine;
}

- (void)setDominantLine:(id)a3
{
  objc_storeStrong((id *)&self->_dominantLine, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_vanishingPoint, 0);
  objc_storeStrong((id *)&self->_dominantLine, 0);
}

+ (id)resultFromLegacyDictionary:(id)a3
{
  void *v3;
  void *v4;
  NSString *v5;
  void *v6;
  void *v7;
  BOOL v8;
  VCPProtoImageCompositionResult *v9;
  NSPoint v10;
  void *v11;
  NSString *v12;
  NSPoint v13;
  NSString *v14;
  NSPoint v15;
  void *v16;

  objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("attributes"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("vanishingPointConfidence"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("vanishingPoint"));
  v5 = (NSString *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("dominantLine"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v4)
    v8 = v5 == 0;
  else
    v8 = 1;
  if (v8 || objc_msgSend(v6, "count") != 2)
  {
    v9 = 0;
  }
  else
  {
    v9 = objc_alloc_init(VCPProtoImageCompositionResult);
    objc_msgSend(v4, "floatValue");
    -[VCPProtoImageCompositionResult setConfidence:](v9, "setConfidence:");
    v10 = NSPointFromString(v5);
    +[VCPProtoPoint pointWithPoint:](VCPProtoPoint, "pointWithPoint:", v10.x, v10.y);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[VCPProtoImageCompositionResult setVanishingPoint:](v9, "setVanishingPoint:", v11);

    objc_msgSend(v7, "objectAtIndexedSubscript:", 0);
    v12 = (NSString *)objc_claimAutoreleasedReturnValue();
    v13 = NSPointFromString(v12);
    objc_msgSend(v7, "objectAtIndexedSubscript:", 1);
    v14 = (NSString *)objc_claimAutoreleasedReturnValue();
    v15 = NSPointFromString(v14);
    +[VCPProtoLine lineFromPoint:toPoint:](VCPProtoLine, "lineFromPoint:toPoint:", v13.x, v13.y, v15.x, v15.y);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[VCPProtoImageCompositionResult setDominantLine:](v9, "setDominantLine:", v16);

  }
  return v9;
}

- (id)exportToLegacyDictionary
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  _QWORD v15[2];
  _QWORD v16[3];
  _QWORD v17[3];
  const __CFString *v18;
  _QWORD v19[2];
  NSPoint v20;
  NSPoint v21;
  NSPoint v22;

  v19[1] = *MEMORY[0x1E0C80C00];
  v18 = CFSTR("attributes");
  v16[0] = CFSTR("vanishingPointConfidence");
  v3 = (void *)MEMORY[0x1E0CB37E8];
  -[VCPProtoImageCompositionResult confidence](self, "confidence");
  objc_msgSend(v3, "numberWithFloat:");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = v4;
  v16[1] = CFSTR("vanishingPoint");
  -[VCPProtoImageCompositionResult vanishingPoint](self, "vanishingPoint");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "pointValue");
  NSStringFromPoint(v20);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v17[1] = v6;
  v16[2] = CFSTR("dominantLine");
  -[VCPProtoImageCompositionResult dominantLine](self, "dominantLine");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "startPointValue");
  NSStringFromPoint(v21);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = v8;
  -[VCPProtoImageCompositionResult dominantLine](self, "dominantLine");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "endPointValue");
  NSStringFromPoint(v22);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v15[1] = v10;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v15, 2);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v17[2] = v11;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v17, v16, 3);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v19[0] = v12;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v19, &v18, 1);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

@end
