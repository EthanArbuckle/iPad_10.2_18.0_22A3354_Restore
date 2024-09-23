@implementation ARFrameTimingData

- (ARFrameTimingData)init
{
  ARFrameTimingData *v2;
  uint64_t v3;
  NSMutableDictionary *timestampsByDataClassKey;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)ARFrameTimingData;
  v2 = -[ARFrameTimingData init](&v6, sel_init);
  if (v2)
  {
    v3 = objc_opt_new();
    timestampsByDataClassKey = v2->_timestampsByDataClassKey;
    v2->_timestampsByDataClassKey = (NSMutableDictionary *)v3;

  }
  return v2;
}

- (NSDictionary)timestamps
{
  return (NSDictionary *)self->_timestampsByDataClassKey;
}

- (void)addTimestamp:(double)a3 forDataOfClass:(Class)a4
{
  int v6;
  int v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  id v13;

  NSStringFromClass(a4);
  v13 = (id)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v13, "hasPrefix:", CFSTR("AR"));
  v7 = objc_msgSend(v13, "hasSuffix:", CFSTR("Data"));
  v8 = objc_msgSend(v13, "length");
  v9 = v8 - 4;
  if (!v7)
    v9 = v8;
  if (v6)
    v10 = 2;
  else
    v10 = 0;
  objc_msgSend(v13, "substringWithRange:", v10, v9 - v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a3);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_timestampsByDataClassKey, "setObject:forKeyedSubscript:", v12, v11);

}

- (double)videoLatency
{
  return self->_videoLatency;
}

- (void)setVideoLatency:(double)a3
{
  self->_videoLatency = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timestampsByDataClassKey, 0);
}

@end
