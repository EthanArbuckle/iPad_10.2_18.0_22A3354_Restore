@implementation _GEOMapItemHandleCacheData

- (_GEOMapItemHandleCacheData)initWithTimestamp:(id)a3 data:(id)a4
{
  id v7;
  id v8;
  _GEOMapItemHandleCacheData *v9;
  _GEOMapItemHandleCacheData *v10;
  _GEOMapItemHandleCacheData *v11;
  objc_super v13;

  v7 = a3;
  v8 = a4;
  v13.receiver = self;
  v13.super_class = (Class)_GEOMapItemHandleCacheData;
  v9 = -[_GEOMapItemHandleCacheData init](&v13, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_timestamp, a3);
    objc_storeStrong((id *)&v10->_data, a4);
    v11 = v10;
  }

  return v10;
}

- (unint64_t)cost
{
  return -[NSData length](self->_data, "length");
}

- (NSDate)timestamp
{
  return self->_timestamp;
}

- (NSData)data
{
  return self->_data;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_data, 0);
  objc_storeStrong((id *)&self->_timestamp, 0);
}

@end
