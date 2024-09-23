@implementation NSURLComponents

+ (NSURLComponents)allocWithZone:(_NSZone *)a3
{
  objc_super v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  if (NSURLComponents == a1)
    return (NSURLComponents *)&___immutablePlaceholderURLComponents;
  v4.receiver = a1;
  v4.super_class = (Class)&OBJC_METACLASS___NSURLComponents;
  return (NSURLComponents *)objc_msgSendSuper2(&v4, sel_allocWithZone_, a3);
}

- (NSURLComponents)init
{
  objc_super v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v3.receiver = self;
  v3.super_class = (Class)NSURLComponents;
  return -[NSURLComponents init](&v3, sel_init);
}

+ (NSURLComponents)componentsWithString:(NSString *)URLString
{
  return (NSURLComponents *)(id)objc_msgSend(objc_allocWithZone((Class)a1), "initWithString:", URLString);
}

+ (NSURLComponents)componentsWithURL:(NSURL *)url resolvingAgainstBaseURL:(BOOL)resolve
{
  return (NSURLComponents *)(id)objc_msgSend(objc_allocWithZone((Class)a1), "initWithURL:resolvingAgainstBaseURL:", url, resolve);
}

+ (id)_components
{
  objc_class *v2;
  char *v3;
  uint64_t v4;
  objc_super v6;
  char v7;

  v7 = 1;
  v2 = (objc_class *)type metadata accessor for _NSSwiftURLComponents();
  v3 = (char *)objc_allocWithZone(v2);
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for ManagedBuffer<URLComponents, os_unfair_lock_s>);
  v4 = swift_allocObject();
  *(_DWORD *)(v4 + 172) = 0;
  *(_QWORD *)(v4 + 16) = 0;
  *(_QWORD *)(v4 + 24) = 0;
  *(_BYTE *)(v4 + 32) = 0;
  *(_OWORD *)(v4 + 40) = 0u;
  *(_OWORD *)(v4 + 56) = 0u;
  *(_OWORD *)(v4 + 72) = 0u;
  *(_OWORD *)(v4 + 88) = 0u;
  *(_QWORD *)(v4 + 104) = 0;
  *(_BYTE *)(v4 + 112) = 1;
  *(_OWORD *)(v4 + 120) = 0u;
  *(_OWORD *)(v4 + 136) = 0u;
  *(_OWORD *)(v4 + 152) = 0u;
  *(_WORD *)(v4 + 168) = 0;
  *(_QWORD *)&v3[OBJC_IVAR____NSSwiftURLComponents_lock] = v4;
  v6.receiver = v3;
  v6.super_class = v2;
  return objc_msgSendSuper2(&v6, sel_init);
}

+ (id)_componentsWithUrl:(id)a3 resolvingAgainstBaseURL:(BOOL)a4
{
  void *v5;
  id v6;
  void *v8;

  URL.init(reference:)(a3, &v8);
  v5 = v8;
  v6 = specialized static NSURLComponents._componentsWith(url:resolvingAgainstBaseURL:)((uint64_t)&v8, a4);

  swift_release();
  swift_release();
  return v6;
}

+ (id)_componentsWithString:(id)a3 encodingInvalidCharacters:(BOOL)a4
{
  id v5;
  unint64_t v6;
  unint64_t v7;
  objc_class *v9;
  char *v10;
  uint64_t v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  id v16;
  objc_super v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _OWORD v26[2];
  _BYTE v27[160];
  _OWORD v28[8];
  _OWORD v29[2];

  v5 = static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
  v7 = v6;
  swift_bridgeObjectRetain();
  specialized URLComponents._URLComponents.init(string:encodingInvalidCharacters:)((uint64_t)v5, v7, a4, (uint64_t)v27);
  outlined init with take of LocalePreferences?((uint64_t)v27, (uint64_t)v28, &demangling cache variable for type metadata for URLComponents._URLComponents?);
  if (_s10Foundation13URLComponentsV01_B0VSgWOg((uint64_t *)v28) == 1)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else
  {
    v24 = v28[6];
    v25 = v28[7];
    v26[0] = v29[0];
    *(_OWORD *)((char *)v26 + 10) = *(_OWORD *)((char *)v29 + 10);
    v20 = v28[2];
    v21 = v28[3];
    v22 = v28[4];
    v23 = v28[5];
    v18 = v28[0];
    v19 = v28[1];
    v9 = (objc_class *)type metadata accessor for _NSSwiftURLComponents();
    v10 = (char *)objc_allocWithZone(v9);
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for ManagedBuffer<URLComponents, os_unfair_lock_s>);
    v11 = swift_allocObject();
    *(_DWORD *)(v11 + 172) = 0;
    v12 = v25;
    *(_OWORD *)(v11 + 112) = v24;
    *(_OWORD *)(v11 + 128) = v12;
    *(_OWORD *)(v11 + 144) = v26[0];
    *(_OWORD *)(v11 + 154) = *(_OWORD *)((char *)v26 + 10);
    v13 = v21;
    *(_OWORD *)(v11 + 48) = v20;
    *(_OWORD *)(v11 + 64) = v13;
    v14 = v23;
    *(_OWORD *)(v11 + 80) = v22;
    *(_OWORD *)(v11 + 96) = v14;
    v15 = v19;
    *(_OWORD *)(v11 + 16) = v18;
    *(_OWORD *)(v11 + 32) = v15;
    *(_QWORD *)&v10[OBJC_IVAR____NSSwiftURLComponents_lock] = v11;
    v17.receiver = v10;
    v17.super_class = v9;
    v16 = objc_msgSendSuper2(&v17, sel_init);
    swift_bridgeObjectRelease();
    return v16;
  }
}

+ (_NSRange)_matchWithString:(id)a3 requiredComponents:(unint64_t)a4 defaultValues:(id)a5 urlPtr:(id *)a6
{
  id v9;
  unint64_t v10;
  unint64_t v11;
  unint64_t v12;
  uint64_t v13;
  NSUInteger v14;
  NSUInteger v15;
  NSUInteger v16;
  NSUInteger v17;
  _NSRange result;

  v9 = static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
  v11 = v10;
  v12 = specialized static Dictionary._unconditionallyBridgeFromObjectiveC(_:)(a5);
  v13 = specialized static NSURLComponents._matchWith(string:requiredComponents:defaultValues:urlPtr:)((uint64_t)v9, v11, a4, v12, a6);
  v15 = v14;
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v16 = v13;
  v17 = v15;
  result.length = v17;
  result.location = v16;
  return result;
}

+ (NSURLComponents)componentsWithString:(NSString *)URLString encodingInvalidCharacters:(BOOL)encodingInvalidCharacters
{
  return (NSURLComponents *)(id)objc_msgSend(objc_allocWithZone((Class)a1), "initWithString:encodingInvalidCharacters:", URLString, encodingInvalidCharacters);
}

- (id)copyWithZone:(_NSZone *)a3
{
  return 0;
}

- (NSURLComponents)initWithURL:(NSURL *)url resolvingAgainstBaseURL:(BOOL)resolve
{
  objc_class *v6;

  v6 = objc_lookUpClass("NSURLComponents");
  NSRequestConcreteImplementation((uint64_t)self, a2, v6);
}

- (NSURLComponents)initWithString:(NSString *)URLString
{
  objc_class *v5;

  v5 = objc_lookUpClass("NSURLComponents");
  NSRequestConcreteImplementation((uint64_t)self, a2, v5);
}

- (NSURLComponents)initWithString:(NSString *)URLString encodingInvalidCharacters:(BOOL)encodingInvalidCharacters
{
  objc_class *v6;

  v6 = objc_lookUpClass("NSURLComponents");
  NSRequestConcreteImplementation((uint64_t)self, a2, v6);
}

- (NSURL)URL
{
  objc_class *v4;

  v4 = objc_lookUpClass("NSURLComponents");
  NSRequestConcreteImplementation((uint64_t)self, a2, v4);
}

- (NSURL)URLRelativeToURL:(NSURL *)baseURL
{
  objc_class *v5;

  v5 = objc_lookUpClass("NSURLComponents");
  NSRequestConcreteImplementation((uint64_t)self, a2, v5);
}

- (NSString)string
{
  objc_class *v4;

  v4 = objc_lookUpClass("NSURLComponents");
  NSRequestConcreteImplementation((uint64_t)self, a2, v4);
}

- (NSString)scheme
{
  objc_class *v4;

  v4 = objc_lookUpClass("NSURLComponents");
  NSRequestConcreteImplementation((uint64_t)self, a2, v4);
}

- (void)setScheme:(NSString *)scheme
{
  objc_class *v5;

  v5 = objc_lookUpClass("NSURLComponents");
  NSRequestConcreteImplementation((uint64_t)self, a2, v5);
}

- (NSString)user
{
  objc_class *v4;

  v4 = objc_lookUpClass("NSURLComponents");
  NSRequestConcreteImplementation((uint64_t)self, a2, v4);
}

- (void)setUser:(NSString *)user
{
  objc_class *v5;

  v5 = objc_lookUpClass("NSURLComponents");
  NSRequestConcreteImplementation((uint64_t)self, a2, v5);
}

- (NSString)password
{
  objc_class *v4;

  v4 = objc_lookUpClass("NSURLComponents");
  NSRequestConcreteImplementation((uint64_t)self, a2, v4);
}

- (void)setPassword:(NSString *)password
{
  objc_class *v5;

  v5 = objc_lookUpClass("NSURLComponents");
  NSRequestConcreteImplementation((uint64_t)self, a2, v5);
}

- (NSString)host
{
  objc_class *v4;

  v4 = objc_lookUpClass("NSURLComponents");
  NSRequestConcreteImplementation((uint64_t)self, a2, v4);
}

- (void)setHost:(NSString *)host
{
  objc_class *v5;

  v5 = objc_lookUpClass("NSURLComponents");
  NSRequestConcreteImplementation((uint64_t)self, a2, v5);
}

- (NSNumber)port
{
  objc_class *v4;

  v4 = objc_lookUpClass("NSURLComponents");
  NSRequestConcreteImplementation((uint64_t)self, a2, v4);
}

- (void)setPort:(NSNumber *)port
{
  objc_class *v5;

  v5 = objc_lookUpClass("NSURLComponents");
  NSRequestConcreteImplementation((uint64_t)self, a2, v5);
}

- (NSString)path
{
  objc_class *v4;

  v4 = objc_lookUpClass("NSURLComponents");
  NSRequestConcreteImplementation((uint64_t)self, a2, v4);
}

- (void)setPath:(NSString *)path
{
  objc_class *v5;

  v5 = objc_lookUpClass("NSURLComponents");
  NSRequestConcreteImplementation((uint64_t)self, a2, v5);
}

- (NSString)query
{
  objc_class *v4;

  v4 = objc_lookUpClass("NSURLComponents");
  NSRequestConcreteImplementation((uint64_t)self, a2, v4);
}

- (void)setQuery:(NSString *)query
{
  objc_class *v5;

  v5 = objc_lookUpClass("NSURLComponents");
  NSRequestConcreteImplementation((uint64_t)self, a2, v5);
}

- (NSString)fragment
{
  objc_class *v4;

  v4 = objc_lookUpClass("NSURLComponents");
  NSRequestConcreteImplementation((uint64_t)self, a2, v4);
}

- (void)setFragment:(NSString *)fragment
{
  objc_class *v5;

  v5 = objc_lookUpClass("NSURLComponents");
  NSRequestConcreteImplementation((uint64_t)self, a2, v5);
}

- (NSString)percentEncodedUser
{
  objc_class *v4;

  v4 = objc_lookUpClass("NSURLComponents");
  NSRequestConcreteImplementation((uint64_t)self, a2, v4);
}

- (void)setPercentEncodedUser:(NSString *)percentEncodedUser
{
  objc_class *v5;

  v5 = objc_lookUpClass("NSURLComponents");
  NSRequestConcreteImplementation((uint64_t)self, a2, v5);
}

- (NSString)percentEncodedPassword
{
  objc_class *v4;

  v4 = objc_lookUpClass("NSURLComponents");
  NSRequestConcreteImplementation((uint64_t)self, a2, v4);
}

- (void)setPercentEncodedPassword:(NSString *)percentEncodedPassword
{
  objc_class *v5;

  v5 = objc_lookUpClass("NSURLComponents");
  NSRequestConcreteImplementation((uint64_t)self, a2, v5);
}

- (NSString)percentEncodedHost
{
  objc_class *v4;

  v4 = objc_lookUpClass("NSURLComponents");
  NSRequestConcreteImplementation((uint64_t)self, a2, v4);
}

- (void)setPercentEncodedHost:(NSString *)percentEncodedHost
{
  objc_class *v5;

  v5 = objc_lookUpClass("NSURLComponents");
  NSRequestConcreteImplementation((uint64_t)self, a2, v5);
}

- (NSString)encodedHost
{
  objc_class *v4;

  v4 = objc_lookUpClass("NSURLComponents");
  NSRequestConcreteImplementation((uint64_t)self, a2, v4);
}

- (void)setEncodedHost:(NSString *)encodedHost
{
  objc_class *v5;

  v5 = objc_lookUpClass("NSURLComponents");
  NSRequestConcreteImplementation((uint64_t)self, a2, v5);
}

- (NSString)percentEncodedPath
{
  objc_class *v4;

  v4 = objc_lookUpClass("NSURLComponents");
  NSRequestConcreteImplementation((uint64_t)self, a2, v4);
}

- (void)setPercentEncodedPath:(NSString *)percentEncodedPath
{
  objc_class *v5;

  v5 = objc_lookUpClass("NSURLComponents");
  NSRequestConcreteImplementation((uint64_t)self, a2, v5);
}

- (NSString)percentEncodedQuery
{
  objc_class *v4;

  v4 = objc_lookUpClass("NSURLComponents");
  NSRequestConcreteImplementation((uint64_t)self, a2, v4);
}

- (void)setPercentEncodedQuery:(NSString *)percentEncodedQuery
{
  objc_class *v5;

  v5 = objc_lookUpClass("NSURLComponents");
  NSRequestConcreteImplementation((uint64_t)self, a2, v5);
}

- (NSString)percentEncodedFragment
{
  objc_class *v4;

  v4 = objc_lookUpClass("NSURLComponents");
  NSRequestConcreteImplementation((uint64_t)self, a2, v4);
}

- (void)setPercentEncodedFragment:(NSString *)percentEncodedFragment
{
  objc_class *v5;

  v5 = objc_lookUpClass("NSURLComponents");
  NSRequestConcreteImplementation((uint64_t)self, a2, v5);
}

- (NSRange)rangeOfScheme
{
  objc_class *v4;

  v4 = objc_lookUpClass("NSURLComponents");
  NSRequestConcreteImplementation((uint64_t)self, a2, v4);
}

- (NSRange)rangeOfUser
{
  objc_class *v4;

  v4 = objc_lookUpClass("NSURLComponents");
  NSRequestConcreteImplementation((uint64_t)self, a2, v4);
}

- (NSRange)rangeOfPassword
{
  objc_class *v4;

  v4 = objc_lookUpClass("NSURLComponents");
  NSRequestConcreteImplementation((uint64_t)self, a2, v4);
}

- (NSRange)rangeOfHost
{
  objc_class *v4;

  v4 = objc_lookUpClass("NSURLComponents");
  NSRequestConcreteImplementation((uint64_t)self, a2, v4);
}

- (NSRange)rangeOfPort
{
  objc_class *v4;

  v4 = objc_lookUpClass("NSURLComponents");
  NSRequestConcreteImplementation((uint64_t)self, a2, v4);
}

- (NSRange)rangeOfPath
{
  objc_class *v4;

  v4 = objc_lookUpClass("NSURLComponents");
  NSRequestConcreteImplementation((uint64_t)self, a2, v4);
}

- (NSRange)rangeOfQuery
{
  objc_class *v4;

  v4 = objc_lookUpClass("NSURLComponents");
  NSRequestConcreteImplementation((uint64_t)self, a2, v4);
}

- (NSRange)rangeOfFragment
{
  objc_class *v4;

  v4 = objc_lookUpClass("NSURLComponents");
  NSRequestConcreteImplementation((uint64_t)self, a2, v4);
}

- (NSArray)queryItems
{
  objc_class *v4;

  v4 = objc_lookUpClass("NSURLComponents");
  NSRequestConcreteImplementation((uint64_t)self, a2, v4);
}

- (void)setQueryItems:(NSArray *)queryItems
{
  objc_class *v5;

  v5 = objc_lookUpClass("NSURLComponents");
  NSRequestConcreteImplementation((uint64_t)self, a2, v5);
}

- (NSArray)percentEncodedQueryItems
{
  objc_class *v4;

  v4 = objc_lookUpClass("NSURLComponents");
  NSRequestConcreteImplementation((uint64_t)self, a2, v4);
}

- (void)setPercentEncodedQueryItems:(NSArray *)percentEncodedQueryItems
{
  objc_class *v5;

  v5 = objc_lookUpClass("NSURLComponents");
  NSRequestConcreteImplementation((uint64_t)self, a2, v5);
}

@end
