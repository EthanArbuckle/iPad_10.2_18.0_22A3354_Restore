@implementation FCHLSGroup

- (id)description
{
  void *v2;
  NSString *v4;
  NSArray *media;
  NSArray *v6;
  void *v7;
  void *v8;

  v2 = (void *)MEMORY[0x1E0CB3940];
  if (self)
  {
    v4 = self->_groupID;
    media = self->_media;
  }
  else
  {
    v4 = 0;
    media = 0;
  }
  v6 = media;
  -[NSArray description](v6, "description");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringWithFormat:", CFSTR("GroupID: %@ %@"), v4, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_media, 0);
  objc_storeStrong((id *)&self->_groupID, 0);
}

@end
