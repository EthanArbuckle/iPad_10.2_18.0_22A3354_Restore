@implementation MFServerMessagesIndexQuery

- (void).cxx_destruct
{
  swift_getObjectType();

  sub_1A5139FD8();
  sub_1A5110C34();
}

- (CSSuggestion)suggestion
{
  MFServerMessagesIndexQuery *v3;
  id v6;

  swift_getObjectType();
  v3 = self;
  v6 = sub_1A536AD2C();

  return (CSSuggestion *)v6;
}

- (NSString)accountID
{
  MFServerMessagesIndexQuery *v3;
  id v6;

  swift_getObjectType();
  v3 = self;
  sub_1A536ADD8();

  v6 = (id)sub_1A594B3F4();
  swift_bridgeObjectRelease();
  return (NSString *)v6;
}

- (NSArray)mailboxURLs
{
  MFServerMessagesIndexQuery *v3;
  id v6;

  swift_getObjectType();
  v3 = self;
  sub_1A536AE94();

  sub_1A5949EF4();
  v6 = (id)sub_1A594B94C();
  swift_bridgeObjectRelease();
  return (NSArray *)v6;
}

- (int64_t)limit
{
  MFServerMessagesIndexQuery *v3;
  int64_t v6;

  swift_getObjectType();
  v3 = self;
  v6 = sub_1A536AF20();

  return v6;
}

- (MFServerMessagesIndexQuery)initWithSuggestion:(id)a3 accountID:(id)a4 mailboxes:(id)a5 limit:(int64_t)a6
{
  id v6;
  id v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v12;
  uint64_t v13;
  MFServerMessagesIndexQuery *v18;

  swift_getObjectType();
  v6 = a3;
  v7 = a4;
  v8 = a5;
  v12 = sub_1A594B40C();
  v13 = v9;
  sub_1A5949EF4();
  v10 = sub_1A594B958();
  v18 = (MFServerMessagesIndexQuery *)sub_1A536B000(a3, v12, v13, v10, a6);

  return v18;
}

- (MFServerMessagesIndexQuery)init
{
  swift_getObjectType();
  return (MFServerMessagesIndexQuery *)MFServerMessagesIndexQuery.init()();
}

@end
