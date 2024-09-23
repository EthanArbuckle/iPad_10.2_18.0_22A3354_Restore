@implementation MSVLyricsAgent

- (id)description
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  -[MSVLyricsAgent type](self, "type");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[MSVLyricsAgent name](self, "name");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[MSVLyricsXMLElement identifier](self, "identifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[MSVLyricsAgent artistID](self, "artistID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@ %p> type: %@, name: %@, identifier: %@, artistID: %@"), v4, self, v5, v6, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (NSString)type
{
  return self->_type;
}

- (void)setType:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (NSString)artistID
{
  return self->_artistID;
}

- (void)setArtistID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_artistID, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_type, 0);
}

@end
