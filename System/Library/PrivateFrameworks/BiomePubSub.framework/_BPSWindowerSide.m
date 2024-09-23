@implementation _BPSWindowerSide

- (_BPSWindowerSide)initWithKey:(id)a3 identifier:(id)a4 windowerInner:(id)a5
{
  id v9;
  id v10;
  id v11;
  _BPSWindowerSide *v12;
  _BPSWindowerSide *v13;
  objc_super v15;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)_BPSWindowerSide;
  v12 = -[_BPSWindowerSide init](&v15, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_key, a3);
    objc_storeStrong((id *)&v13->_windowerInner, a5);
    objc_storeStrong((id *)&v13->_identifier, a4);
  }

  return v13;
}

- (void)receiveCompletion:(id)a3
{
  _BPSWindowerInner *windowerInner;
  NSCopying *key;
  NSString *identifier;
  _BPSWindowerSide *v7;

  windowerInner = self->_windowerInner;
  key = self->_key;
  identifier = self->_identifier;
  v7 = self;
  -[_BPSWindowerInner receiveCompletion:key:identifier:](windowerInner, "receiveCompletion:key:identifier:", a3, key, identifier);

}

- (int64_t)receiveInput:(id)a3
{
  _BPSWindowerInner *windowerInner;
  NSCopying *key;
  NSString *identifier;
  _BPSWindowerSide *v7;
  int64_t v8;

  windowerInner = self->_windowerInner;
  key = self->_key;
  identifier = self->_identifier;
  v7 = self;
  v8 = -[_BPSWindowerInner receiveInput:key:identifier:](windowerInner, "receiveInput:key:identifier:", a3, key, identifier);

  return v8;
}

- (void)receiveSubscription:(id)a3
{
  -[_BPSWindowerInner receiveSubscription:key:identifier:](self->_windowerInner, "receiveSubscription:key:identifier:", a3, self->_key, self->_identifier);
}

- (void)cancel
{
  _BPSWindowerInner *windowerInner;
  NSCopying *key;
  NSString *identifier;
  _BPSWindowerSide *v5;

  windowerInner = self->_windowerInner;
  key = self->_key;
  identifier = self->_identifier;
  v5 = self;
  -[_BPSWindowerInner cancelWithKey:identifier:](windowerInner, "cancelWithKey:identifier:", key, identifier);

}

- (void)requestDemand:(int64_t)a3
{
  _BPSWindowerInner *windowerInner;
  NSCopying *key;
  NSString *identifier;
  _BPSWindowerSide *v7;

  windowerInner = self->_windowerInner;
  key = self->_key;
  identifier = self->_identifier;
  v7 = self;
  -[_BPSWindowerInner requestDemand:key:identifier:](windowerInner, "requestDemand:key:identifier:", a3, key, identifier);

}

- (_BPSWindowerInner)windowerInner
{
  return self->_windowerInner;
}

- (NSCopying)key
{
  return self->_key;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_identifier, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_key, 0);
  objc_storeStrong((id *)&self->_windowerInner, 0);
}

@end
