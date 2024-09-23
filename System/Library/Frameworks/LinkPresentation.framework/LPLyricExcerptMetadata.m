@implementation LPLyricExcerptMetadata

- (id)copyWithZone:(_NSZone *)a3
{
  LPLyricExcerptMetadata *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  LPLyricExcerptMetadata *v9;

  v4 = +[LPLyricExcerptMetadata allocWithZone:](LPLyricExcerptMetadata, "allocWithZone:", a3);
  if (v4)
  {
    -[LPLyricExcerptMetadata lyrics](self, "lyrics");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[LPLyricExcerptMetadata setLyrics:](v4, "setLyrics:", v5);

    -[LPLyricExcerptMetadata language](self, "language");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[LPLyricExcerptMetadata setLanguage:](v4, "setLanguage:", v6);

    -[LPLyricExcerptMetadata startTime](self, "startTime");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[LPLyricExcerptMetadata setStartTime:](v4, "setStartTime:", v7);

    -[LPLyricExcerptMetadata endTime](self, "endTime");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[LPLyricExcerptMetadata setEndTime:](v4, "setEndTime:", v8);

    v9 = v4;
  }

  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (LPLyricExcerptMetadata)initWithCoder:(id)a3
{
  id v4;
  LPLyricExcerptMetadata *v5;
  uint64_t v6;
  NSString *lyrics;
  uint64_t v8;
  NSString *language;
  uint64_t v10;
  NSNumber *startTime;
  uint64_t v12;
  NSNumber *endTime;
  LPLyricExcerptMetadata *v14;
  objc_super v16;

  v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)LPLyricExcerptMetadata;
  v5 = -[LPLyricExcerptMetadata init](&v16, sel_init);
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
  id v4;

  v4 = a3;
  objc_msgSend(v4, "_lp_encodeStringIfNotNil:forKey:", self->_lyrics, CFSTR("lyrics"));
  objc_msgSend(v4, "_lp_encodeStringIfNotNil:forKey:", self->_language, CFSTR("language"));
  objc_msgSend(v4, "_lp_encodeObjectIfNotNil:forKey:", self->_startTime, CFSTR("startTime"));
  objc_msgSend(v4, "_lp_encodeObjectIfNotNil:forKey:", self->_endTime, CFSTR("endTime"));

}

- (BOOL)isEqual:(id)a3
{
  id v4;
  char v5;
  void **v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)LPLyricExcerptMetadata;
  if (-[LPLyricExcerptMetadata isEqual:](&v8, sel_isEqual_, v4))
  {
    v5 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v6 = (void **)v4;
      if ((objectsAreEqual_0(v6[1], self->_lyrics) & 1) != 0
        && objectsAreEqual_0(v6[2], self->_language)
        && objectsAreEqual_0(v6[3], self->_startTime))
      {
        v5 = objectsAreEqual_0(v6[4], self->_endTime);
      }
      else
      {
        v5 = 0;
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
