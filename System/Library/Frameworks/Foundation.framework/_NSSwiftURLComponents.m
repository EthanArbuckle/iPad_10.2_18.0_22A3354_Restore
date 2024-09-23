@implementation _NSSwiftURLComponents

- (_NSSwiftURLComponents)init
{
  uint64_t v3;
  objc_super v5;
  char v6;

  v6 = 1;
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for ManagedBuffer<URLComponents, os_unfair_lock_s>);
  v3 = swift_allocObject();
  *(_DWORD *)(v3 + 172) = 0;
  *(_QWORD *)(v3 + 16) = 0;
  *(_QWORD *)(v3 + 24) = 0;
  *(_BYTE *)(v3 + 32) = 0;
  *(_OWORD *)(v3 + 40) = 0u;
  *(_OWORD *)(v3 + 56) = 0u;
  *(_OWORD *)(v3 + 72) = 0u;
  *(_OWORD *)(v3 + 88) = 0u;
  *(_QWORD *)(v3 + 104) = 0;
  *(_BYTE *)(v3 + 112) = 1;
  *(_OWORD *)(v3 + 120) = 0u;
  *(_OWORD *)(v3 + 136) = 0u;
  *(_OWORD *)(v3 + 152) = 0u;
  *(_WORD *)(v3 + 168) = 0;
  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____NSSwiftURLComponents_lock) = (Class)v3;
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for _NSSwiftURLComponents();
  return -[NSURLComponents init](&v5, sel_init);
}

- (_NSSwiftURLComponents)initWithString:(id)a3
{
  id v3;
  unint64_t v4;

  v3 = static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
  return (_NSSwiftURLComponents *)_NSSwiftURLComponents.init(string:)((uint64_t)v3, v4);
}

- (_NSSwiftURLComponents)initWithURL:(id)a3 resolvingAgainstBaseURL:(BOOL)a4
{
  uint64_t v6;

  URL.init(reference:)(a3, &v6);
  return (_NSSwiftURLComponents *)_NSSwiftURLComponents.init(url:resolvingAgainstBaseURL:)((uint64_t)&v6, a4);
}

- (BOOL)isEqual:(id)a3
{
  return @objc _NSSwiftURLComponents.isEqual(_:)(self, (uint64_t)a2, (uint64_t)a3, (uint64_t (*)(_OWORD *))_NSSwiftURLComponents.isEqual(_:));
}

- (id)copyWithZone:(void *)a3
{
  return (id)@objc _NSSwiftURLComponents.copy(with:)(self, (uint64_t)a2, (uint64_t)a3, (void (*)(_QWORD *__return_ptr))_NSSwiftURLComponents.copy(with:));
}

- (int64_t)hash
{
  uint64_t v2;
  _OWORD *v3;
  os_unfair_lock_s *v4;
  _NSSwiftURLComponents *v5;
  Swift::Int v6;
  _OWORD v8[8];
  _OWORD v9[3];
  _OWORD v10[8];
  _OWORD v11[2];

  v2 = *(uint64_t *)((char *)&self->super.super.super.isa + OBJC_IVAR____NSSwiftURLComponents_lock);
  v3 = (_OWORD *)(v2 + 16);
  v4 = (os_unfair_lock_s *)(v2 + 172);
  v5 = self;
  os_unfair_lock_lock(v4);
  closure #1 in _NSSwiftURLComponents.components.getter(v3, v10);
  os_unfair_lock_unlock(v4);
  v8[6] = v10[6];
  v8[7] = v10[7];
  v9[0] = v11[0];
  *(_OWORD *)((char *)v9 + 10) = *(_OWORD *)((char *)v11 + 10);
  v8[2] = v10[2];
  v8[3] = v10[3];
  v8[4] = v10[4];
  v8[5] = v10[5];
  v8[0] = v10[0];
  v8[1] = v10[1];
  v6 = URLComponents.hashValue.getter();
  outlined release of URLComponents((uint64_t)v8);

  return v6;
}

- (NSString)description
{
  uint64_t v2;
  _OWORD *v3;
  os_unfair_lock_s *v4;
  _NSSwiftURLComponents *v5;
  void *v6;
  _OWORD v8[8];
  _OWORD v9[3];
  _OWORD v10[8];
  _OWORD v11[2];

  v2 = *(uint64_t *)((char *)&self->super.super.super.isa + OBJC_IVAR____NSSwiftURLComponents_lock);
  v3 = (_OWORD *)(v2 + 16);
  v4 = (os_unfair_lock_s *)(v2 + 172);
  v5 = self;
  os_unfair_lock_lock(v4);
  closure #1 in _NSSwiftURLComponents.components.getter(v3, v10);
  os_unfair_lock_unlock(v4);
  v8[6] = v10[6];
  v8[7] = v10[7];
  v9[0] = v11[0];
  *(_OWORD *)((char *)v9 + 10) = *(_OWORD *)((char *)v11 + 10);
  v8[2] = v10[2];
  v8[3] = v10[3];
  v8[4] = v10[4];
  v8[5] = v10[5];
  v8[0] = v10[0];
  v8[1] = v10[1];
  URLComponents.description.getter();
  outlined release of URLComponents((uint64_t)v8);

  v6 = (void *)String._bridgeToObjectiveCImpl()();
  swift_bridgeObjectRelease();
  return (NSString *)v6;
}

- (NSURL)URL
{
  _NSSwiftURLComponents *v2;
  id v3;
  id v4;
  id v6;

  v2 = self;
  _NSSwiftURLComponents.url.getter((uint64_t)&v6);

  v3 = v6;
  if (!v6)
    return (NSURL *)0;
  v4 = v6;
  outlined consume of URL?(v3);
  return (NSURL *)v4;
}

- (id)URLRelativeToURL:(id)a3
{
  id v4;
  id v5;
  id v6;
  _NSSwiftURLComponents *v7;
  id v8;
  id v9;
  _QWORD v11[3];
  id v12[3];

  if (a3)
  {
    URL.init(reference:)(a3, v12);
    v4 = v12[0];
    v5 = v12[1];
    v6 = v12[2];
  }
  else
  {
    v4 = 0;
    v5 = 0;
    v6 = 0;
  }
  v11[0] = v4;
  v11[1] = v5;
  v11[2] = v6;
  v7 = self;
  _NSSwiftURLComponents.url(relativeTo:)((uint64_t)v11, (uint64_t)v12);

  outlined consume of URL?(v4);
  v8 = v12[0];
  if (!v12[0])
    return 0;
  v9 = v12[0];
  outlined consume of URL?(v8);
  return v9;
}

- (NSString)string
{
  return (NSString *)@objc _NSSwiftURLComponents.string.getter(self, (uint64_t)a2, (void (*)(void))_NSSwiftURLComponents.string.getter);
}

- (NSString)_scheme
{
  return (NSString *)@objc _NSSwiftURLComponents.string.getter(self, (uint64_t)a2, (void (*)(void))_NSSwiftURLComponents._scheme.getter);
}

- (BOOL)_setScheme:(id)a3
{
  return @objc _NSSwiftURLComponents._setScheme(_:)(self, (uint64_t)a2, a3, (uint64_t (*)(_QWORD, _QWORD))URLComponents._URLComponents.setScheme(_:));
}

- (NSString)user
{
  return (NSString *)@objc _NSSwiftURLComponents.user.getter((char *)self, (uint64_t)a2, (void (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))URLComponents._URLComponents.user.getter);
}

- (void)setUser:(id)a3
{
  @objc _NSSwiftURLComponents.user.setter(self, (uint64_t)a2, a3, (void (*)(os_unfair_lock_s *))partial apply for closure #1 in _NSSwiftURLComponents.user.setter);
}

- (NSString)password
{
  return (NSString *)@objc _NSSwiftURLComponents.user.getter((char *)self, (uint64_t)a2, (void (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))URLComponents._URLComponents.password.getter);
}

- (void)setPassword:(id)a3
{
  @objc _NSSwiftURLComponents.user.setter(self, (uint64_t)a2, a3, (void (*)(os_unfair_lock_s *))partial apply for closure #1 in _NSSwiftURLComponents.password.setter);
}

- (NSString)host
{
  return (NSString *)@objc _NSSwiftURLComponents.string.getter(self, (uint64_t)a2, (void (*)(void))_NSSwiftURLComponents.host.getter);
}

- (void)setHost:(id)a3
{
  id v4;
  os_unfair_lock_s *v5;
  os_unfair_lock_s *v6;
  _NSSwiftURLComponents *v7;

  if (a3)
    v4 = static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
  else
    v4 = 0;
  MEMORY[0x1E0C80A78](v4);
  v6 = v5 + 43;
  v7 = self;
  os_unfair_lock_lock(v6);
  partial apply for closure #1 in _NSSwiftURLComponents.host.setter();
  os_unfair_lock_unlock(v6);

  swift_bridgeObjectRelease();
}

- (NSNumber)_port
{
  _NSSwiftURLComponents *v2;
  id v3;

  v2 = self;
  v3 = _NSSwiftURLComponents._port.getter();

  return (NSNumber *)v3;
}

- (BOOL)_setPort:(id)a3
{
  os_unfair_lock_s *v4;
  uint64_t v5;
  os_unfair_lock_s *v6;
  id v7;
  _NSSwiftURLComponents *v8;

  v4 = *(os_unfair_lock_s **)((char *)&self->super.super.super.isa + OBJC_IVAR____NSSwiftURLComponents_lock);
  v5 = (uint64_t)&v4[4];
  v6 = v4 + 43;
  v7 = a3;
  v8 = self;
  os_unfair_lock_lock(v6);
  partial apply for closure #1 in _NSSwiftURLComponents._setPort(_:)(v5);
  os_unfair_lock_unlock(v6);

  return 1;
}

- (NSString)path
{
  uint64_t v2;
  _OWORD *v3;
  os_unfair_lock_s *v4;
  _NSSwiftURLComponents *v5;
  void *v6;
  _OWORD v8[8];
  _OWORD v9[3];
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _OWORD v18[10];
  _OWORD v19[2];

  v2 = *(uint64_t *)((char *)&self->super.super.super.isa + OBJC_IVAR____NSSwiftURLComponents_lock);
  v3 = (_OWORD *)(v2 + 16);
  v4 = (os_unfair_lock_s *)(v2 + 172);
  v5 = self;
  os_unfair_lock_lock(v4);
  closure #1 in _NSSwiftURLComponents.components.getter(v3, &v10);
  os_unfair_lock_unlock(v4);
  v8[6] = v16;
  v8[7] = v17;
  v9[0] = v18[0];
  *(_OWORD *)((char *)v9 + 10) = *(_OWORD *)((char *)v18 + 10);
  v8[2] = v12;
  v8[3] = v13;
  v8[4] = v14;
  v8[5] = v15;
  v8[0] = v10;
  v8[1] = v11;
  v18[8] = v16;
  v18[9] = v17;
  v19[0] = v18[0];
  *(_OWORD *)((char *)v19 + 10) = *(_OWORD *)((char *)v18 + 10);
  v18[4] = v12;
  v18[5] = v13;
  v18[6] = v14;
  v18[7] = v15;
  v18[2] = v10;
  v18[3] = v11;
  URLComponents._URLComponents.path.getter();
  outlined release of URLComponents((uint64_t)v8);

  v6 = (void *)String._bridgeToObjectiveCImpl()();
  swift_bridgeObjectRelease();
  return (NSString *)v6;
}

- (void)setPath:(id)a3
{
  @objc _NSSwiftURLComponents.user.setter(self, (uint64_t)a2, a3, (void (*)(os_unfair_lock_s *))partial apply for closure #1 in _NSSwiftURLComponents.path.setter);
}

- (NSString)query
{
  return (NSString *)@objc _NSSwiftURLComponents.user.getter((char *)self, (uint64_t)a2, (void (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))URLComponents._URLComponents.query.getter);
}

- (void)setQuery:(id)a3
{
  @objc _NSSwiftURLComponents.user.setter(self, (uint64_t)a2, a3, (void (*)(os_unfair_lock_s *))partial apply for closure #1 in _NSSwiftURLComponents.query.setter);
}

- (NSString)fragment
{
  return (NSString *)@objc _NSSwiftURLComponents.user.getter((char *)self, (uint64_t)a2, (void (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))URLComponents._URLComponents.fragment.getter);
}

- (void)setFragment:(id)a3
{
  @objc _NSSwiftURLComponents.user.setter(self, (uint64_t)a2, a3, (void (*)(os_unfair_lock_s *))partial apply for closure #1 in _NSSwiftURLComponents.fragment.setter);
}

- (NSString)_percentEncodedUser
{
  uint64_t v2;
  _OWORD *v3;
  os_unfair_lock_s *v4;
  _NSSwiftURLComponents *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  _OWORD v10[8];
  _OWORD v11[3];
  _OWORD v12[8];
  _OWORD v13[2];

  v2 = *(uint64_t *)((char *)&self->super.super.super.isa + OBJC_IVAR____NSSwiftURLComponents_lock);
  v3 = (_OWORD *)(v2 + 16);
  v4 = (os_unfair_lock_s *)(v2 + 172);
  v5 = self;
  os_unfair_lock_lock(v4);
  closure #1 in _NSSwiftURLComponents.components.getter(v3, v12);
  os_unfair_lock_unlock(v4);
  v10[6] = v12[6];
  v10[7] = v12[7];
  v11[0] = v13[0];
  *(_OWORD *)((char *)v11 + 10) = *(_OWORD *)((char *)v13 + 10);
  v10[2] = v12[2];
  v10[3] = v12[3];
  v10[4] = v12[4];
  v10[5] = v12[5];
  v10[0] = v12[0];
  v10[1] = v12[1];
  URLComponents.percentEncodedUser.getter();
  v7 = v6;
  outlined release of URLComponents((uint64_t)v10);

  if (!v7)
    return (NSString *)0;
  v8 = (void *)String._bridgeToObjectiveCImpl()();
  swift_bridgeObjectRelease();
  return (NSString *)v8;
}

- (BOOL)_setPercentEncodedUser:(id)a3
{
  return @objc _NSSwiftURLComponents._setPercentEncodedFragment(_:)(self, (uint64_t)a2, a3, (void (*)(os_unfair_lock_s *))partial apply for closure #1 in _NSSwiftURLComponents._setPercentEncodedUser(_:));
}

- (NSString)_percentEncodedPassword
{
  return (NSString *)@objc _NSSwiftURLComponents.string.getter(self, (uint64_t)a2, (void (*)(void))_NSSwiftURLComponents._percentEncodedPassword.getter);
}

- (BOOL)_setPercentEncodedPassword:(id)a3
{
  return @objc _NSSwiftURLComponents._setPercentEncodedFragment(_:)(self, (uint64_t)a2, a3, (void (*)(os_unfair_lock_s *))partial apply for closure #1 in _NSSwiftURLComponents._setPercentEncodedPassword(_:));
}

- (NSString)_percentEncodedHost
{
  return (NSString *)@objc _NSSwiftURLComponents.user.getter((char *)self, (uint64_t)a2, (void (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))URLComponents._URLComponents.percentEncodedHost.getter);
}

- (BOOL)_setPercentEncodedHost:(id)a3
{
  return @objc _NSSwiftURLComponents._setScheme(_:)(self, (uint64_t)a2, a3, (uint64_t (*)(_QWORD, _QWORD))URLComponents._URLComponents.setPercentEncodedHost(_:));
}

- (NSString)_encodedHost
{
  return (NSString *)@objc _NSSwiftURLComponents.user.getter((char *)self, (uint64_t)a2, (void (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))URLComponents._URLComponents.encodedHost.getter);
}

- (BOOL)_setEncodedHost:(id)a3
{
  return @objc _NSSwiftURLComponents._setPercentEncodedFragment(_:)(self, (uint64_t)a2, a3, (void (*)(os_unfair_lock_s *))partial apply for closure #1 in _NSSwiftURLComponents._setEncodedHost(_:));
}

- (NSString)_percentEncodedPath
{
  _NSSwiftURLComponents *v2;
  void *v3;

  v2 = self;
  _NSSwiftURLComponents._percentEncodedPath.getter();

  v3 = (void *)String._bridgeToObjectiveCImpl()();
  swift_bridgeObjectRelease();
  return (NSString *)v3;
}

- (BOOL)_setPercentEncodedPath:(id)a3
{
  return @objc _NSSwiftURLComponents._setPercentEncodedFragment(_:)(self, (uint64_t)a2, a3, (void (*)(os_unfair_lock_s *))partial apply for closure #1 in _NSSwiftURLComponents._setPercentEncodedPath(_:));
}

- (NSString)_percentEncodedQuery
{
  return (NSString *)@objc _NSSwiftURLComponents.string.getter(self, (uint64_t)a2, (void (*)(void))_NSSwiftURLComponents._percentEncodedQuery.getter);
}

- (BOOL)_setPercentEncodedQuery:(id)a3
{
  return @objc _NSSwiftURLComponents._setPercentEncodedFragment(_:)(self, (uint64_t)a2, a3, (void (*)(os_unfair_lock_s *))partial apply for closure #1 in _NSSwiftURLComponents._setPercentEncodedQuery(_:));
}

- (NSString)_percentEncodedFragment
{
  return (NSString *)@objc _NSSwiftURLComponents.string.getter(self, (uint64_t)a2, (void (*)(void))_NSSwiftURLComponents._percentEncodedFragment.getter);
}

- (BOOL)_setPercentEncodedFragment:(id)a3
{
  return @objc _NSSwiftURLComponents._setPercentEncodedFragment(_:)(self, (uint64_t)a2, a3, (void (*)(os_unfair_lock_s *))partial apply for closure #1 in _NSSwiftURLComponents._setPercentEncodedFragment(_:));
}

- (NSArray)queryItems
{
  return (NSArray *)@objc _NSSwiftURLComponents.queryItems.getter((char *)self, (uint64_t)a2, 0);
}

- (void)setQueryItems:(id)a3
{
  _NSSwiftURLComponents *v3;
  os_unfair_lock_s *v4;
  os_unfair_lock_s *v5;
  _NSSwiftURLComponents *v6;

  v3 = self;
  if (a3)
    self = (_NSSwiftURLComponents *)specialized static Array._unconditionallyBridgeFromObjectiveC(_:)(a3);
  MEMORY[0x1E0C80A78](self);
  v5 = v4 + 43;
  v6 = v3;
  os_unfair_lock_lock(v5);
  partial apply for closure #1 in _NSSwiftURLComponents.queryItems.setter();
  os_unfair_lock_unlock(v5);

  swift_bridgeObjectRelease();
}

- (NSArray)_percentEncodedQueryItems
{
  return (NSArray *)@objc _NSSwiftURLComponents.queryItems.getter((char *)self, (uint64_t)a2, 1);
}

- (BOOL)_setPercentEncodedQueryItems:(id)a3
{
  _NSSwiftURLComponents *v3;
  os_unfair_lock_s *v4;
  uint64_t v5;
  os_unfair_lock_s *v6;
  _NSSwiftURLComponents *v7;

  v3 = self;
  if (a3)
    self = (_NSSwiftURLComponents *)specialized static Array._unconditionallyBridgeFromObjectiveC(_:)(a3);
  MEMORY[0x1E0C80A78](self);
  v5 = (uint64_t)&v4[4];
  v6 = v4 + 43;
  v7 = v3;
  os_unfair_lock_lock(v6);
  partial apply for closure #1 in _NSSwiftURLComponents._setPercentEncodedQueryItems(_:)(v5);
  os_unfair_lock_unlock(v6);

  swift_bridgeObjectRelease();
  return 1;
}

- (_NSRange)rangeOfScheme
{
  _NSSwiftURLComponents *v2;
  uint64_t v3;
  NSUInteger v4;
  NSUInteger v5;
  NSUInteger v6;
  NSUInteger v7;
  _NSRange result;

  v2 = self;
  v3 = _NSSwiftURLComponents.rangeOfScheme.getter();
  v5 = v4;

  v6 = v3;
  v7 = v5;
  result.length = v7;
  result.location = v6;
  return result;
}

- (_NSRange)rangeOfUser
{
  _NSSwiftURLComponents *v2;
  uint64_t v3;
  NSUInteger v4;
  NSUInteger v5;
  NSUInteger v6;
  NSUInteger v7;
  _NSRange result;

  v2 = self;
  v3 = _NSSwiftURLComponents.rangeOfUser.getter();
  v5 = v4;

  v6 = v3;
  v7 = v5;
  result.length = v7;
  result.location = v6;
  return result;
}

- (_NSRange)rangeOfPassword
{
  _NSSwiftURLComponents *v2;
  uint64_t v3;
  NSUInteger v4;
  NSUInteger v5;
  NSUInteger v6;
  NSUInteger v7;
  _NSRange result;

  v2 = self;
  v3 = _NSSwiftURLComponents.rangeOfPassword.getter();
  v5 = v4;

  v6 = v3;
  v7 = v5;
  result.length = v7;
  result.location = v6;
  return result;
}

- (_NSRange)rangeOfHost
{
  _NSSwiftURLComponents *v2;
  uint64_t v3;
  NSUInteger v4;
  NSUInteger v5;
  NSUInteger v6;
  NSUInteger v7;
  _NSRange result;

  v2 = self;
  v3 = _NSSwiftURLComponents.rangeOfHost.getter();
  v5 = v4;

  v6 = v3;
  v7 = v5;
  result.length = v7;
  result.location = v6;
  return result;
}

- (_NSRange)rangeOfPort
{
  _NSSwiftURLComponents *v2;
  uint64_t v3;
  NSUInteger v4;
  NSUInteger v5;
  NSUInteger v6;
  NSUInteger v7;
  _NSRange result;

  v2 = self;
  v3 = _NSSwiftURLComponents.rangeOfPort.getter();
  v5 = v4;

  v6 = v3;
  v7 = v5;
  result.length = v7;
  result.location = v6;
  return result;
}

- (_NSRange)rangeOfPath
{
  _NSSwiftURLComponents *v2;
  uint64_t v3;
  NSUInteger v4;
  NSUInteger v5;
  NSUInteger v6;
  NSUInteger v7;
  _NSRange result;

  v2 = self;
  v3 = _NSSwiftURLComponents.rangeOfPath.getter();
  v5 = v4;

  v6 = v3;
  v7 = v5;
  result.length = v7;
  result.location = v6;
  return result;
}

- (_NSRange)rangeOfQuery
{
  _NSSwiftURLComponents *v2;
  uint64_t v3;
  NSUInteger v4;
  NSUInteger v5;
  NSUInteger v6;
  NSUInteger v7;
  _NSRange result;

  v2 = self;
  v3 = _NSSwiftURLComponents.rangeOfQuery.getter();
  v5 = v4;

  v6 = v3;
  v7 = v5;
  result.length = v7;
  result.location = v6;
  return result;
}

- (_NSRange)rangeOfFragment
{
  _NSSwiftURLComponents *v2;
  uint64_t v3;
  NSUInteger v4;
  NSUInteger v5;
  NSUInteger v6;
  NSUInteger v7;
  _NSRange result;

  v2 = self;
  v3 = _NSSwiftURLComponents.rangeOfFragment.getter();
  v5 = v4;

  v6 = v3;
  v7 = v5;
  result.length = v7;
  result.location = v6;
  return result;
}

- (_NSSwiftURLComponents)initWithString:(id)a3 encodingInvalidCharacters:(BOOL)a4
{
  _NSSwiftURLComponents *result;

  result = (_NSSwiftURLComponents *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release();
}

@end
