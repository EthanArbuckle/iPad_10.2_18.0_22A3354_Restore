@implementation CNFMLFindMyLocateSession

- (CNFMLFindMyLocateSession)init
{
  CNFMLFindMyLocateSession *v2;
  _TtC10ContactsUI19FindMyLocateSession *v3;
  _TtC10ContactsUI19FindMyLocateSession *session;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)CNFMLFindMyLocateSession;
  v2 = -[CNFMLFindMyLocateSession init](&v6, sel_init);
  if (v2)
  {
    v3 = objc_alloc_init(_TtC10ContactsUI19FindMyLocateSession);
    session = v2->_session;
    v2->_session = v3;

  }
  return v2;
}

- (void)sendFriendshipOfferTo:(id)a3 end:(int64_t)a4 isFromGroup:(BOOL)a5 completion:(id)a6
{
  _BOOL8 v6;
  id v10;
  id v11;
  id v12;

  v6 = a5;
  v10 = a6;
  v11 = a3;
  -[CNFMLFindMyLocateSession session](self, "session");
  v12 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "sendFriendshipOfferTo:end:isFromGroup:completion:", v11, a4, v6, v10);

}

- (_TtC10ContactsUI19FindMyLocateSession)session
{
  return self->_session;
}

- (void)setSession:(id)a3
{
  objc_storeStrong((id *)&self->_session, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_session, 0);
}

@end
