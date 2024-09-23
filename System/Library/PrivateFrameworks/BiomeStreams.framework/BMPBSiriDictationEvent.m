@implementation BMPBSiriDictationEvent

- (void)setAbsoluteTimestamp:(double)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_absoluteTimestamp = a3;
}

- (void)setHasAbsoluteTimestamp:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasAbsoluteTimestamp
{
  return *(_BYTE *)&self->_has & 1;
}

- (BOOL)hasRecognizedText
{
  return self->_recognizedText != 0;
}

- (BOOL)hasCorrectedText
{
  return self->_correctedText != 0;
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
  v8.super_class = (Class)BMPBSiriDictationEvent;
  -[BMPBSiriDictationEvent description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMPBSiriDictationEvent dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  NSString *recognizedText;
  NSString *correctedText;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_absoluteTimestamp);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v4, CFSTR("absoluteTimestamp"));

  }
  recognizedText = self->_recognizedText;
  if (recognizedText)
    objc_msgSend(v3, "setObject:forKey:", recognizedText, CFSTR("recognizedText"));
  correctedText = self->_correctedText;
  if (correctedText)
    objc_msgSend(v3, "setObject:forKey:", correctedText, CFSTR("correctedText"));
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return BMPBSiriDictationEventReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = v4;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    PBDataWriterWriteDoubleField();
    v4 = v5;
  }
  if (self->_recognizedText)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }
  if (self->_correctedText)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }

}

- (void)copyTo:(id)a3
{
  _QWORD *v4;
  _QWORD *v5;

  v4 = a3;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    v4[1] = *(_QWORD *)&self->_absoluteTimestamp;
    *((_BYTE *)v4 + 32) |= 1u;
  }
  v5 = v4;
  if (self->_recognizedText)
  {
    objc_msgSend(v4, "setRecognizedText:");
    v4 = v5;
  }
  if (self->_correctedText)
  {
    objc_msgSend(v5, "setCorrectedText:");
    v4 = v5;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  _QWORD *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = (_QWORD *)v5;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *(double *)(v5 + 8) = self->_absoluteTimestamp;
    *(_BYTE *)(v5 + 32) |= 1u;
  }
  v7 = -[NSString copyWithZone:](self->_recognizedText, "copyWithZone:", a3);
  v8 = (void *)v6[3];
  v6[3] = v7;

  v9 = -[NSString copyWithZone:](self->_correctedText, "copyWithZone:", a3);
  v10 = (void *)v6[2];
  v6[2] = v9;

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NSString *recognizedText;
  NSString *correctedText;
  char v7;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_11;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 32) & 1) == 0 || self->_absoluteTimestamp != *((double *)v4 + 1))
      goto LABEL_11;
  }
  else if ((*((_BYTE *)v4 + 32) & 1) != 0)
  {
LABEL_11:
    v7 = 0;
    goto LABEL_12;
  }
  recognizedText = self->_recognizedText;
  if ((unint64_t)recognizedText | *((_QWORD *)v4 + 3)
    && !-[NSString isEqual:](recognizedText, "isEqual:"))
  {
    goto LABEL_11;
  }
  correctedText = self->_correctedText;
  if ((unint64_t)correctedText | *((_QWORD *)v4 + 2))
    v7 = -[NSString isEqual:](correctedText, "isEqual:");
  else
    v7 = 1;
LABEL_12:

  return v7;
}

- (unint64_t)hash
{
  unint64_t v3;
  double absoluteTimestamp;
  double v5;
  long double v6;
  double v7;
  NSUInteger v8;

  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    absoluteTimestamp = self->_absoluteTimestamp;
    v5 = -absoluteTimestamp;
    if (absoluteTimestamp >= 0.0)
      v5 = self->_absoluteTimestamp;
    v6 = floor(v5 + 0.5);
    v7 = (v5 - v6) * 1.84467441e19;
    v3 = 2654435761u * (unint64_t)fmod(v6, 1.84467441e19);
    if (v7 >= 0.0)
    {
      if (v7 > 0.0)
        v3 += (unint64_t)v7;
    }
    else
    {
      v3 -= (unint64_t)fabs(v7);
    }
  }
  else
  {
    v3 = 0;
  }
  v8 = -[NSString hash](self->_recognizedText, "hash") ^ v3;
  return v8 ^ -[NSString hash](self->_correctedText, "hash");
}

- (void)mergeFrom:(id)a3
{
  double *v4;
  double *v5;

  v4 = (double *)a3;
  if (((_BYTE)v4[4] & 1) != 0)
  {
    self->_absoluteTimestamp = v4[1];
    *(_BYTE *)&self->_has |= 1u;
  }
  v5 = v4;
  if (*((_QWORD *)v4 + 3))
  {
    -[BMPBSiriDictationEvent setRecognizedText:](self, "setRecognizedText:");
    v4 = v5;
  }
  if (*((_QWORD *)v4 + 2))
  {
    -[BMPBSiriDictationEvent setCorrectedText:](self, "setCorrectedText:");
    v4 = v5;
  }

}

- (double)absoluteTimestamp
{
  return self->_absoluteTimestamp;
}

- (NSString)recognizedText
{
  return self->_recognizedText;
}

- (void)setRecognizedText:(id)a3
{
  objc_storeStrong((id *)&self->_recognizedText, a3);
}

- (NSString)correctedText
{
  return self->_correctedText;
}

- (void)setCorrectedText:(id)a3
{
  objc_storeStrong((id *)&self->_correctedText, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_recognizedText, 0);
  objc_storeStrong((id *)&self->_correctedText, 0);
}

@end
