@implementation _BlastDoorLPLyricExcerptMetadata

- (id)copyWithZone:(_NSZone *)a3
{
  _BlastDoorLPLyricExcerptMetadata *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  _BlastDoorLPLyricExcerptMetadata *v9;

  v4 = +[_BlastDoorLPLyricExcerptMetadata allocWithZone:](_BlastDoorLPLyricExcerptMetadata, "allocWithZone:", a3);
  if (v4)
  {
    -[_BlastDoorLPLyricExcerptMetadata lyrics](self, "lyrics");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[_BlastDoorLPLyricExcerptMetadata setLyrics:](v4, "setLyrics:", v5);

    -[_BlastDoorLPLyricExcerptMetadata language](self, "language");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[_BlastDoorLPLyricExcerptMetadata setLanguage:](v4, "setLanguage:", v6);

    -[_BlastDoorLPLyricExcerptMetadata startTime](self, "startTime");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[_BlastDoorLPLyricExcerptMetadata setStartTime:](v4, "setStartTime:", v7);

    -[_BlastDoorLPLyricExcerptMetadata endTime](self, "endTime");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[_BlastDoorLPLyricExcerptMetadata setEndTime:](v4, "setEndTime:", v8);

    v9 = v4;
  }

  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (_BlastDoorLPLyricExcerptMetadata)initWithCoder:(id)a3
{
  id v4;
  _BlastDoorLPLyricExcerptMetadata *v5;
  uint64_t v6;
  NSString *lyrics;
  uint64_t v8;
  NSString *language;
  uint64_t v10;
  NSNumber *startTime;
  uint64_t v12;
  NSNumber *endTime;
  _BlastDoorLPLyricExcerptMetadata *v14;
  objc_super v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)_BlastDoorLPLyricExcerptMetadata;
  v5 = -[_BlastDoorLPLyricExcerptMetadata init](&v16, sel_init);
  if (v5)
  {
    decodeStringForKey(v4, (uint64_t)CFSTR("lyrics"));
    v6 = objc_claimAutoreleasedReturnValue();
    lyrics = v5->_lyrics;
    v5->_lyrics = (NSString *)v6;

    decodeStringForKey(v4, (uint64_t)CFSTR("language"));
    v8 = objc_claimAutoreleasedReturnValue();
    language = v5->_language;
    v5->_language = (NSString *)v8;

    decodeNumberForKey(v4, CFSTR("startTime"));
    v10 = objc_claimAutoreleasedReturnValue();
    startTime = v5->_startTime;
    v5->_startTime = (NSNumber *)v10;

    decodeNumberForKey(v4, CFSTR("endTime"));
    v12 = objc_claimAutoreleasedReturnValue();
    endTime = v5->_endTime;
    v5->_endTime = (NSNumber *)v12;

    v14 = v5;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *lyrics;
  id v5;

  lyrics = self->_lyrics;
  v5 = a3;
  objc_msgSend(v5, "_bd_lp_encodeObjectIfNotNil:forKey:", lyrics, CFSTR("lyrics"));
  objc_msgSend(v5, "_bd_lp_encodeObjectIfNotNil:forKey:", self->_language, CFSTR("language"));
  objc_msgSend(v5, "_bd_lp_encodeObjectIfNotNil:forKey:", self->_startTime, CFSTR("startTime"));
  objc_msgSend(v5, "_bd_lp_encodeObjectIfNotNil:forKey:", self->_endTime, CFSTR("endTime"));

}

- (BOOL)isEqual:(id)a3
{
  id v4;
  char v5;
  _QWORD *v6;
  unint64_t v7;
  unint64_t v8;
  unint64_t v9;
  unint64_t v10;
  objc_super v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)_BlastDoorLPLyricExcerptMetadata;
  if (-[_BlastDoorLPLyricExcerptMetadata isEqual:](&v12, sel_isEqual_, v4))
  {
    v5 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v6 = v4;
      v7 = v6[1];
      if (v7 | (unint64_t)self->_lyrics && !objc_msgSend((id)v7, "isEqual:")
        || (v8 = v6[2], v8 | (unint64_t)self->_language) && !objc_msgSend((id)v8, "isEqual:")
        || (v9 = v6[3], v9 | (unint64_t)self->_startTime) && !objc_msgSend((id)v9, "isEqual:"))
      {
        v5 = 0;
      }
      else
      {
        v10 = v6[4];
        if (v10 | (unint64_t)self->_endTime)
          v5 = objc_msgSend((id)v10, "isEqual:");
        else
          v5 = 1;
      }

    }
    else
    {
      v5 = 0;
    }
  }

  return v5;
}

- (unint64_t)hash
{
  return -[NSString hash](self->_lyrics, "hash");
}

- (NSString)lyrics
{
  return self->_lyrics;
}

- (void)setLyrics:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSString)language
{
  return self->_language;
}

- (void)setLanguage:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSNumber)startTime
{
  return self->_startTime;
}

- (void)setStartTime:(id)a3
{
  objc_storeStrong((id *)&self->_startTime, a3);
}

- (NSNumber)endTime
{
  return self->_endTime;
}

- (void)setEndTime:(id)a3
{
  objc_storeStrong((id *)&self->_endTime, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_endTime, 0);
  objc_storeStrong((id *)&self->_startTime, 0);
  objc_storeStrong((id *)&self->_language, 0);
  objc_storeStrong((id *)&self->_lyrics, 0);
}

@end
