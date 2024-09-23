@implementation _INPBSpeakerIDInfo

- (void)setSharedUserID:(id)a3
{
  objc_storeStrong((id *)&self->_sharedUserID, a3);
}

- (BOOL)hasSharedUserID
{
  return self->_sharedUserID != 0;
}

- (void)setSpeakerIDConfidence:(int)a3
{
  char has;

  has = (char)self->_has;
  if (a3 == 0x7FFFFFFF)
  {
    *(_BYTE *)&self->_has = has & 0xFE;
  }
  else
  {
    *(_BYTE *)&self->_has = has | 1;
    self->_speakerIDConfidence = a3;
  }
}

- (BOOL)hasSpeakerIDConfidence
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)setHasSpeakerIDConfidence:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (id)speakerIDConfidenceAsString:(int)a3
{
  if (a3 < 6)
    return *(&off_1E22944E0 + a3);
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsSpeakerIDConfidence:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("UNKNOWN_CONFIDENCE")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("FULL_CONFIDENCE")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("HIGH_CONFIDENCE")) & 1) != 0)
  {
    v4 = 2;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("MEDIUM_CONFIDENCE")) & 1) != 0)
  {
    v4 = 3;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("AMBIGUOUS_CONFIDENCE")) & 1) != 0)
  {
    v4 = 4;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("NO_CONFIDENCE")))
  {
    v4 = 5;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return _INPBSpeakerIDInfoReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  v6 = a3;
  -[_INPBSpeakerIDInfo sharedUserID](self, "sharedUserID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[_INPBSpeakerIDInfo sharedUserID](self, "sharedUserID");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  if (-[_INPBSpeakerIDInfo hasSpeakerIDConfidence](self, "hasSpeakerIDConfidence"))
    PBDataWriterWriteInt32Field();

}

- (_INPBSpeakerIDInfo)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  _INPBSpeakerIDInfo *v6;
  uint64_t v7;
  void *v8;

  v4 = a3;
  NSStringFromSelector(sel_bytes);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "if_decodeBytesNoCopyForKey:", v5);
  v6 = (_INPBSpeakerIDInfo *)objc_claimAutoreleasedReturnValue();

  if (v6
    || (v7 = objc_opt_class(),
        NSStringFromSelector(sel_data),
        v8 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v4, "decodeObjectOfClass:forKey:", v7, v8),
        v6 = (_INPBSpeakerIDInfo *)objc_claimAutoreleasedReturnValue(),
        v8,
        v6))
  {
    self = -[_INPBSpeakerIDInfo initWithData:](self, "initWithData:", v6);

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
  -[_INPBSpeakerIDInfo data](self, "data");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_bytes);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "if_encodeBytesNoCopy:forKey:", v6, v5);

}

- (id)copyWithZone:(_NSZone *)a3
{
  _INPBSpeakerIDInfo *v5;
  id v6;

  v5 = -[_INPBSpeakerIDInfo init](+[_INPBSpeakerIDInfo allocWithZone:](_INPBSpeakerIDInfo, "allocWithZone:"), "init");
  v6 = -[_INPBString copyWithZone:](self->_sharedUserID, "copyWithZone:", a3);
  -[_INPBSpeakerIDInfo setSharedUserID:](v5, "setSharedUserID:", v6);

  if (-[_INPBSpeakerIDInfo hasSpeakerIDConfidence](self, "hasSpeakerIDConfidence"))
    -[_INPBSpeakerIDInfo setSpeakerIDConfidence:](v5, "setSpeakerIDConfidence:", -[_INPBSpeakerIDInfo speakerIDConfidence](self, "speakerIDConfidence"));
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  int v13;
  BOOL v14;
  int speakerIDConfidence;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_9;
  -[_INPBSpeakerIDInfo sharedUserID](self, "sharedUserID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "sharedUserID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if ((v5 == 0) != (v6 != 0))
  {
    -[_INPBSpeakerIDInfo sharedUserID](self, "sharedUserID");
    v8 = objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      v9 = (void *)v8;
      -[_INPBSpeakerIDInfo sharedUserID](self, "sharedUserID");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "sharedUserID");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v10, "isEqual:", v11);

      if (!v12)
        goto LABEL_9;
    }
    else
    {

    }
    v13 = -[_INPBSpeakerIDInfo hasSpeakerIDConfidence](self, "hasSpeakerIDConfidence");
    if (v13 == objc_msgSend(v4, "hasSpeakerIDConfidence"))
    {
      if (!-[_INPBSpeakerIDInfo hasSpeakerIDConfidence](self, "hasSpeakerIDConfidence")
        || !objc_msgSend(v4, "hasSpeakerIDConfidence")
        || (speakerIDConfidence = self->_speakerIDConfidence,
            speakerIDConfidence == objc_msgSend(v4, "speakerIDConfidence")))
      {
        v14 = 1;
        goto LABEL_10;
      }
    }
  }
  else
  {

  }
LABEL_9:
  v14 = 0;
LABEL_10:

  return v14;
}

- (unint64_t)hash
{
  unint64_t v3;
  uint64_t v4;

  v3 = -[_INPBString hash](self->_sharedUserID, "hash");
  if (-[_INPBSpeakerIDInfo hasSpeakerIDConfidence](self, "hasSpeakerIDConfidence"))
    v4 = 2654435761 * self->_speakerIDConfidence;
  else
    v4 = 0;
  return v4 ^ v3;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[_INPBSpeakerIDInfo sharedUserID](self, "sharedUserID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("sharedUserID"));

  if (-[_INPBSpeakerIDInfo hasSpeakerIDConfidence](self, "hasSpeakerIDConfidence"))
  {
    v6 = -[_INPBSpeakerIDInfo speakerIDConfidence](self, "speakerIDConfidence");
    if (v6 >= 6)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), v6);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v7 = *(&off_1E22944E0 + v6);
    }
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("speakerIDConfidence"));

  }
  return v3;
}

- (_INPBString)sharedUserID
{
  return self->_sharedUserID;
}

- (int)speakerIDConfidence
{
  return self->_speakerIDConfidence;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sharedUserID, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
