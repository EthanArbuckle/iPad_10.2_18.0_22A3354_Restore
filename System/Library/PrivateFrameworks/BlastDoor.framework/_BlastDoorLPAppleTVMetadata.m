@implementation _BlastDoorLPAppleTVMetadata

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (_BlastDoorLPAppleTVMetadata)initWithCoder:(id)a3
{
  id v4;
  _BlastDoorLPAppleTVMetadata *v5;
  uint64_t v6;
  NSString *title;
  uint64_t v8;
  NSString *subtitle;
  uint64_t v10;
  _BlastDoorLPImage *artwork;
  _BlastDoorLPAppleTVMetadata *v12;
  objc_super v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)_BlastDoorLPAppleTVMetadata;
  v5 = -[_BlastDoorLPAppleTVMetadata init](&v14, sel_init);
  if (v5)
  {
    decodeStringForKey(v4, (uint64_t)CFSTR("title"));
    v6 = objc_claimAutoreleasedReturnValue();
    title = v5->_title;
    v5->_title = (NSString *)v6;

    decodeStringForKey(v4, (uint64_t)CFSTR("subtitle"));
    v8 = objc_claimAutoreleasedReturnValue();
    subtitle = v5->_subtitle;
    v5->_subtitle = (NSString *)v8;

    objc_msgSend(v4, "_bd_lp_strictlyDecodeLPImageForKey:", CFSTR("artwork"));
    v10 = objc_claimAutoreleasedReturnValue();
    artwork = v5->_artwork;
    v5->_artwork = (_BlastDoorLPImage *)v10;

    v12 = v5;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *title;
  id v5;

  title = self->_title;
  v5 = a3;
  objc_msgSend(v5, "_bd_lp_encodeObjectIfNotNil:forKey:", title, CFSTR("title"));
  objc_msgSend(v5, "_bd_lp_encodeObjectIfNotNil:forKey:", self->_subtitle, CFSTR("subtitle"));
  objc_msgSend(v5, "_bd_lp_encodeObjectIfNotNil:forKey:", self->_artwork, CFSTR("artwork"));

}

- (id)copyWithZone:(_NSZone *)a3
{
  _BlastDoorLPAppleTVMetadata *v4;
  void *v5;
  void *v6;
  void *v7;
  _BlastDoorLPAppleTVMetadata *v8;

  v4 = +[_BlastDoorLPAppleTVMetadata allocWithZone:](_BlastDoorLPAppleTVMetadata, "allocWithZone:", a3);
  if (v4)
  {
    -[_BlastDoorLPAppleTVMetadata title](self, "title");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[_BlastDoorLPAppleTVMetadata setTitle:](v4, "setTitle:", v5);

    -[_BlastDoorLPAppleTVMetadata subtitle](self, "subtitle");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[_BlastDoorLPAppleTVMetadata setSubtitle:](v4, "setSubtitle:", v6);

    -[_BlastDoorLPAppleTVMetadata artwork](self, "artwork");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[_BlastDoorLPAppleTVMetadata setArtwork:](v4, "setArtwork:", v7);

    v8 = v4;
  }

  return v4;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  char v5;
  _QWORD *v6;
  unint64_t v7;
  unint64_t v8;
  unint64_t v9;
  objc_super v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)_BlastDoorLPAppleTVMetadata;
  if (-[_BlastDoorLPAppleTVMetadata isEqual:](&v11, sel_isEqual_, v4))
  {
    v5 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v6 = v4;
      v7 = v6[2];
      if (v7 | (unint64_t)self->_title && !objc_msgSend((id)v7, "isEqual:")
        || (v8 = v6[3], v8 | (unint64_t)self->_subtitle) && !objc_msgSend((id)v8, "isEqual:"))
      {
        v5 = 0;
      }
      else
      {
        v9 = v6[4];
        if (v9 | (unint64_t)self->_artwork)
          v5 = objc_msgSend((id)v9, "isEqual:");
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
  return -[NSString hash](self->_title, "hash");
}

- (void)_enumerateAsynchronousFields:(id)a3
{
  (*((void (**)(id, const __CFString *))a3 + 2))(a3, CFSTR("artwork"));
}

+ (id)keyPathsForValuesAffecting_dummyPropertyForObservation
{
  return (id)objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", CFSTR("title"), CFSTR("subtitle"), CFSTR("artwork"), 0);
}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSString)subtitle
{
  return self->_subtitle;
}

- (void)setSubtitle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (_BlastDoorLPImage)artwork
{
  return self->_artwork;
}

- (void)setArtwork:(id)a3
{
  objc_storeStrong((id *)&self->_artwork, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_artwork, 0);
  objc_storeStrong((id *)&self->_subtitle, 0);
  objc_storeStrong((id *)&self->_title, 0);
}

@end
