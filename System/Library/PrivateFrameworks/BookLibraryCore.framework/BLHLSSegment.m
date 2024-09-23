@implementation BLHLSSegment

- (BLHLSSegment)initWithURL:(id)a3 duration:(double)a4 map:(id)a5 key:(id)a6
{
  id v11;
  id v12;
  id v13;
  BLHLSSegment *v14;
  BLHLSSegment *v15;
  objc_super v17;

  v11 = a3;
  v12 = a5;
  v13 = a6;
  v17.receiver = self;
  v17.super_class = (Class)BLHLSSegment;
  v14 = -[BLHLSSegment init](&v17, sel_init);
  v15 = v14;
  if (v14)
  {
    objc_storeStrong((id *)&v14->_url, a3);
    v15->_duration = a4;
    objc_storeStrong((id *)&v15->_map, a5);
    objc_storeStrong((id *)&v15->_key, a6);
  }

  return v15;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  const __CFString *v8;
  uint64_t v9;
  void *v10;
  const __CFString *v11;
  void *v12;

  v3 = (void *)MEMORY[0x24BDD17C8];
  -[BLHLSSegment url](self, "url");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)MEMORY[0x24BDD16E0];
  -[BLHLSSegment duration](self, "duration");
  objc_msgSend(v5, "numberWithDouble:");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[BLHLSSegment map](self, "map");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
    v8 = CFSTR(" Map: ");
  else
    v8 = &stru_24CE8D258;
  -[BLHLSSegment map](self, "map");
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = (void *)v9;
  if (v9)
    v11 = (const __CFString *)v9;
  else
    v11 = &stru_24CE8D258;
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ (%@s)%@%@"), v4, v6, v8, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (BLHLSMap)map
{
  return self->_map;
}

- (NSURL)url
{
  return self->_url;
}

- (double)duration
{
  return self->_duration;
}

- (BLHLSKey)key
{
  return self->_key;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_key, 0);
  objc_storeStrong((id *)&self->_url, 0);
  objc_storeStrong((id *)&self->_map, 0);
}

@end
