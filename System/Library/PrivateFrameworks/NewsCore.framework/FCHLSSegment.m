@implementation FCHLSSegment

- (id)description
{
  void *v2;
  NSURL *v4;
  void *v5;
  FCHLSMap *v6;
  const __CFString *v7;
  FCHLSMap *map;
  void *v9;

  v2 = (void *)MEMORY[0x1E0CB3940];
  if (self)
  {
    v4 = self->_url;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_duration);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = self->_map;
    v7 = CFSTR(" Map: ");
    if (!v6)
      v7 = &stru_1E464BC40;
    map = self->_map;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", 0.0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = 0;
    v4 = 0;
    map = 0;
    v7 = &stru_1E464BC40;
  }
  if (!map)
    map = (FCHLSMap *)&stru_1E464BC40;
  objc_msgSend(v2, "stringWithFormat:", CFSTR("%@ (%@s)%@%@"), v4, v5, v7, map);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_key, 0);
  objc_storeStrong((id *)&self->_url, 0);
  objc_storeStrong((id *)&self->_map, 0);
}

@end
