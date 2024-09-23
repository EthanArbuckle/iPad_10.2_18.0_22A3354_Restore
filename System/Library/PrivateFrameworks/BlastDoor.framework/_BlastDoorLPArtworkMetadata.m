@implementation _BlastDoorLPArtworkMetadata

- (_BlastDoorLPArtworkMetadata)init
{
  _BlastDoorLPArtworkMetadata *v2;
  _BlastDoorLPArtworkMetadata *v3;
  _BlastDoorLPArtworkMetadata *v4;
  objc_super v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v6.receiver = self;
  v6.super_class = (Class)_BlastDoorLPArtworkMetadata;
  v2 = -[_BlastDoorLPArtworkMetadata init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_version = 1;
    v4 = v2;
  }

  return v3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (_BlastDoorLPArtworkMetadata)initWithCoder:(id)a3
{
  id v4;
  _BlastDoorLPArtworkMetadata *v5;
  uint64_t v6;
  NSURL *URL;
  uint64_t v8;
  uint64_t v9;
  NSDictionary *colors;
  _BlastDoorLPArtworkMetadata *v11;
  objc_super v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)_BlastDoorLPArtworkMetadata;
  v5 = -[_BlastDoorLPArtworkMetadata init](&v13, sel_init);
  if (v5)
  {
    v5->_version = objc_msgSend(v4, "decodeInt32ForKey:", CFSTR("version"));
    decodeURLForKey(v4, CFSTR("URL"));
    v6 = objc_claimAutoreleasedReturnValue();
    URL = v5->_URL;
    v5->_URL = (NSURL *)v6;

    v8 = objc_opt_class();
    objc_msgSend(v4, "_bd_lp_strictlyDecodeDictionaryOfObjectsWithKeysOfClass:andObjectsOfClass:forKey:", v8, objc_opt_class(), CFSTR("colors"));
    v9 = objc_claimAutoreleasedReturnValue();
    colors = v5->_colors;
    v5->_colors = (NSDictionary *)v9;

    v11 = v5;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  uint64_t version;
  id v5;

  version = self->_version;
  v5 = a3;
  objc_msgSend(v5, "encodeInt32:forKey:", version, CFSTR("version"));
  objc_msgSend(v5, "_bd_lp_encodeURLIfNotNilOrLocalFile:forKey:", self->_URL, CFSTR("URL"));
  objc_msgSend(v5, "_bd_lp_encodeObjectIfNotNil:forKey:", self->_colors, CFSTR("colors"));

}

- (id)copyWithZone:(_NSZone *)a3
{
  _BlastDoorLPArtworkMetadata *v4;
  void *v5;
  void *v6;
  _BlastDoorLPArtworkMetadata *v7;

  v4 = +[_BlastDoorLPArtworkMetadata allocWithZone:](_BlastDoorLPArtworkMetadata, "allocWithZone:", a3);
  if (v4)
  {
    v4->_version = -[_BlastDoorLPArtworkMetadata version](self, "version");
    -[_BlastDoorLPArtworkMetadata URL](self, "URL");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[_BlastDoorLPArtworkMetadata setURL:](v4, "setURL:", v5);

    -[_BlastDoorLPArtworkMetadata colors](self, "colors");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[_BlastDoorLPArtworkMetadata setColors:](v4, "setColors:", v6);

    v7 = v4;
  }

  return v4;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  char v5;
  _QWORD *v6;
  _QWORD *v7;
  unint64_t v8;
  unint64_t v9;
  objc_super v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)_BlastDoorLPArtworkMetadata;
  if (-[_BlastDoorLPArtworkMetadata isEqual:](&v11, sel_isEqual_, v4))
  {
    v5 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v6 = v4;
      v7 = v6;
      if (*((_DWORD *)v6 + 2) == self->_version
        && ((v8 = v6[2], !(v8 | (unint64_t)self->_URL)) || objc_msgSend((id)v8, "isEqual:")))
      {
        v9 = v7[3];
        if (v9 | (unint64_t)self->_colors)
          v5 = objc_msgSend((id)v9, "isEqual:");
        else
          v5 = 1;
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
  return -[NSURL hash](self->_URL, "hash");
}

- (unsigned)version
{
  return self->_version;
}

- (NSURL)URL
{
  return self->_URL;
}

- (void)setURL:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSDictionary)colors
{
  return self->_colors;
}

- (void)setColors:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_colors, 0);
  objc_storeStrong((id *)&self->_URL, 0);
}

@end
