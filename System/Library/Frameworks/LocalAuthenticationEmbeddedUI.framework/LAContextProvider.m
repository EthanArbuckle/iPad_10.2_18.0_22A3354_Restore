@implementation LAContextProvider

- (id)createContext
{
  return objc_msgSend((id)objc_opt_self(), sel_createContext);
}

- (_TtC29LocalAuthenticationEmbeddedUI17LAContextProvider)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for LAContextProvider();
  return -[LAContextProvider init](&v3, sel_init);
}

@end
