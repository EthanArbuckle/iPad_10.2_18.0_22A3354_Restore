@implementation INSpeakerIDInfo

- (INSpeakerIDInfo)initWithSharedUserID:(id)a3 speakerIDConfidence:(int64_t)a4
{
  id v6;
  INSpeakerIDInfo *v7;
  uint64_t v8;
  NSString *sharedUserID;
  objc_super v11;

  v6 = a3;
  v11.receiver = self;
  v11.super_class = (Class)INSpeakerIDInfo;
  v7 = -[INSpeakerIDInfo init](&v11, sel_init);
  if (v7)
  {
    v8 = objc_msgSend(v6, "copy");
    sharedUserID = v7->_sharedUserID;
    v7->_sharedUserID = (NSString *)v8;

    v7->_speakerIDConfidence = a4;
  }

  return v7;
}

- (unint64_t)hash
{
  NSUInteger v3;
  void *v4;
  unint64_t v5;

  v3 = -[NSString hash](self->_sharedUserID, "hash");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", self->_speakerIDConfidence);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "hash") ^ v3;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  INSpeakerIDInfo *v4;
  INSpeakerIDInfo *v5;
  NSString *sharedUserID;
  BOOL v7;

  v4 = (INSpeakerIDInfo *)a3;
  if (v4 == self)
  {
    v7 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      sharedUserID = self->_sharedUserID;
      v7 = (sharedUserID == v5->_sharedUserID || -[NSString isEqual:](sharedUserID, "isEqual:"))
        && self->_speakerIDConfidence == v5->_speakerIDConfidence;

    }
    else
    {
      v7 = 0;
    }
  }

  return v7;
}

- (INSpeakerIDInfo)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  INSpeakerIDInfo *v7;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("sharedUserID"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("speakerIDConfidence"));

  v7 = -[INSpeakerIDInfo initWithSharedUserID:speakerIDConfidence:](self, "initWithSharedUserID:speakerIDConfidence:", v5, v6);
  return v7;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *sharedUserID;
  id v5;

  sharedUserID = self->_sharedUserID;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", sharedUserID, CFSTR("sharedUserID"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_speakerIDConfidence, CFSTR("speakerIDConfidence"));

}

- (id)_intents_encodeWithJSONEncoder:(id)a3 codableDescription:(id)a4
{
  void *v5;
  id v6;
  void *v7;
  void *v8;
  unint64_t v9;
  __CFString *v10;
  __CFString *v11;

  v5 = (void *)MEMORY[0x1E0C99E08];
  v6 = a3;
  objc_msgSend(v5, "dictionary");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "encodeObject:", self->_sharedUserID);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "if_setObjectIfNonNil:forKey:", v8, CFSTR("sharedUserID"));
  v9 = self->_speakerIDConfidence - 1;
  if (v9 > 4)
    v10 = CFSTR("unknown");
  else
    v10 = *(&off_1E2294510 + v9);
  v11 = v10;
  objc_msgSend(v7, "if_setObjectIfNonNil:forKey:", v11, CFSTR("speakerIDConfidence"));

  return v7;
}

- (NSString)description
{
  return (NSString *)-[INSpeakerIDInfo descriptionAtIndent:](self, "descriptionAtIndent:", 0);
}

- (id)descriptionAtIndent:(unint64_t)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  objc_super v11;

  v5 = (void *)MEMORY[0x1E0CB3940];
  v11.receiver = self;
  v11.super_class = (Class)INSpeakerIDInfo;
  -[INSpeakerIDInfo description](&v11, sel_description);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[INSpeakerIDInfo _dictionaryRepresentation](self, "_dictionaryRepresentation");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "descriptionAtIndent:", a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringWithFormat:", CFSTR("%@ %@"), v6, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)_dictionaryRepresentation
{
  NSString *sharedUserID;
  void *v4;
  void *v5;
  void *v6;
  _QWORD v8[2];
  _QWORD v9[3];

  v9[2] = *MEMORY[0x1E0C80C00];
  v8[0] = CFSTR("sharedUserID");
  sharedUserID = self->_sharedUserID;
  v4 = sharedUserID;
  if (!sharedUserID)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v8[1] = CFSTR("speakerIDConfidence");
  v9[0] = v4;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", self->_speakerIDConfidence);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[1] = v5;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v9, v8, 2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!sharedUserID)
  return v6;
}

- (NSString)sharedUserID
{
  return self->_sharedUserID;
}

- (int64_t)speakerIDConfidence
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

+ (id)_intents_decodeWithJSONDecoder:(id)a3 codableDescription:(id)a4 from:(id)a5
{
  id v7;
  id v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;

  v7 = a3;
  v8 = a5;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v9 = objc_opt_class();
    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("sharedUserID"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "decodeObjectOfClass:from:", v9, v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("speakerIDConfidence"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = INSpeakerIDConfidenceWithString(v12);

    v14 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithSharedUserID:speakerIDConfidence:", v11, v13);
  }
  else
  {
    v14 = 0;
  }

  return v14;
}

@end
