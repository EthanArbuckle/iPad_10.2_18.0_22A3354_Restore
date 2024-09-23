@implementation _BlastDoorLPStocksMetadata

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (_BlastDoorLPStocksMetadata)initWithCoder:(id)a3
{
  id v4;
  _BlastDoorLPStocksMetadata *v5;
  uint64_t v6;
  NSString *combinedTitle;
  uint64_t v8;
  NSString *title;
  uint64_t v10;
  NSString *subtitle;
  uint64_t v12;
  NSString *footnote;
  uint64_t v14;
  _BlastDoorLPImage *icon;
  _BlastDoorLPStocksMetadata *v16;
  objc_super v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v18.receiver = self;
  v18.super_class = (Class)_BlastDoorLPStocksMetadata;
  v5 = -[_BlastDoorLPStocksMetadata init](&v18, sel_init);
  if (v5)
  {
    decodeStringForKey(v4, (uint64_t)CFSTR("combinedTitle"));
    v6 = objc_claimAutoreleasedReturnValue();
    combinedTitle = v5->_combinedTitle;
    v5->_combinedTitle = (NSString *)v6;

    decodeStringForKey(v4, (uint64_t)CFSTR("title"));
    v8 = objc_claimAutoreleasedReturnValue();
    title = v5->_title;
    v5->_title = (NSString *)v8;

    decodeStringForKey(v4, (uint64_t)CFSTR("subtitle"));
    v10 = objc_claimAutoreleasedReturnValue();
    subtitle = v5->_subtitle;
    v5->_subtitle = (NSString *)v10;

    decodeStringForKey(v4, (uint64_t)CFSTR("footnote"));
    v12 = objc_claimAutoreleasedReturnValue();
    footnote = v5->_footnote;
    v5->_footnote = (NSString *)v12;

    objc_msgSend(v4, "_bd_lp_strictlyDecodeLPImageForKey:", CFSTR("icon"));
    v14 = objc_claimAutoreleasedReturnValue();
    icon = v5->_icon;
    v5->_icon = (_BlastDoorLPImage *)v14;

    v16 = v5;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *combinedTitle;
  id v5;

  combinedTitle = self->_combinedTitle;
  v5 = a3;
  objc_msgSend(v5, "_bd_lp_encodeObjectIfNotNil:forKey:", combinedTitle, CFSTR("combinedTitle"));
  objc_msgSend(v5, "_bd_lp_encodeObjectIfNotNil:forKey:", self->_title, CFSTR("title"));
  objc_msgSend(v5, "_bd_lp_encodeObjectIfNotNil:forKey:", self->_subtitle, CFSTR("subtitle"));
  objc_msgSend(v5, "_bd_lp_encodeObjectIfNotNil:forKey:", self->_footnote, CFSTR("footnote"));
  objc_msgSend(v5, "_bd_lp_encodeObjectIfNotNil:forKey:", self->_icon, CFSTR("icon"));

}

- (id)copyWithZone:(_NSZone *)a3
{
  _BlastDoorLPStocksMetadata *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  _BlastDoorLPStocksMetadata *v10;

  v4 = +[_BlastDoorLPStocksMetadata allocWithZone:](_BlastDoorLPStocksMetadata, "allocWithZone:", a3);
  if (v4)
  {
    -[_BlastDoorLPStocksMetadata combinedTitle](self, "combinedTitle");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[_BlastDoorLPStocksMetadata setCombinedTitle:](v4, "setCombinedTitle:", v5);

    -[_BlastDoorLPStocksMetadata title](self, "title");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[_BlastDoorLPStocksMetadata setTitle:](v4, "setTitle:", v6);

    -[_BlastDoorLPStocksMetadata subtitle](self, "subtitle");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[_BlastDoorLPStocksMetadata setSubtitle:](v4, "setSubtitle:", v7);

    -[_BlastDoorLPStocksMetadata footnote](self, "footnote");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[_BlastDoorLPStocksMetadata setFootnote:](v4, "setFootnote:", v8);

    -[_BlastDoorLPStocksMetadata icon](self, "icon");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[_BlastDoorLPStocksMetadata setIcon:](v4, "setIcon:", v9);

    v10 = v4;
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
  unint64_t v10;
  unint64_t v11;
  objc_super v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)_BlastDoorLPStocksMetadata;
  if (-[_BlastDoorLPStocksMetadata isEqual:](&v13, sel_isEqual_, v4))
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
      if (v7 | (unint64_t)self->_combinedTitle && !objc_msgSend((id)v7, "isEqual:")
        || (v8 = v6[3], v8 | (unint64_t)self->_title) && !objc_msgSend((id)v8, "isEqual:")
        || (v9 = v6[4], v9 | (unint64_t)self->_subtitle) && !objc_msgSend((id)v9, "isEqual:")
        || (v10 = v6[5], v10 | (unint64_t)self->_footnote) && !objc_msgSend((id)v10, "isEqual:"))
      {
        v5 = 0;
      }
      else
      {
        v11 = v6[6];
        if (v11 | (unint64_t)self->_icon)
          v5 = objc_msgSend((id)v11, "isEqual:");
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
  (*((void (**)(id, const __CFString *))a3 + 2))(a3, CFSTR("icon"));
}

+ (id)keyPathsForValuesAffecting_dummyPropertyForObservation
{
  return (id)objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", CFSTR("combinedTitle"), CFSTR("title"), CFSTR("subtitle"), CFSTR("footnote"), CFSTR("icon"), 0);
}

- (NSString)combinedTitle
{
  return self->_combinedTitle;
}

- (void)setCombinedTitle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSString)subtitle
{
  return self->_subtitle;
}

- (void)setSubtitle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (NSString)footnote
{
  return self->_footnote;
}

- (void)setFootnote:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (_BlastDoorLPImage)icon
{
  return self->_icon;
}

- (void)setIcon:(id)a3
{
  objc_storeStrong((id *)&self->_icon, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_icon, 0);
  objc_storeStrong((id *)&self->_footnote, 0);
  objc_storeStrong((id *)&self->_subtitle, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_combinedTitle, 0);
}

@end
