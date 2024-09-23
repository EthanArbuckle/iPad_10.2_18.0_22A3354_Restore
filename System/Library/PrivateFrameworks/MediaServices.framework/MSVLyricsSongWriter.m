@implementation MSVLyricsSongWriter

- (MSVLyricsSongWriter)init
{
  MSVLyricsSongWriter *v2;
  void *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)MSVLyricsSongWriter;
  v2 = -[MSVLyricsSongWriter init](&v5, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0CB37A0], "string");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    -[MSVLyricsXMLElement setMutableText:](v2, "setMutableText:", v3);

  }
  return v2;
}

- (id)description
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  -[MSVLyricsSongWriter name](self, "name");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[MSVLyricsSongWriter artistID](self, "artistID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@ %p> name: %@, artistID: %@"), v4, self, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (NSString)artistID
{
  return self->_artistID;
}

- (void)setArtistID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_artistID, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

@end
