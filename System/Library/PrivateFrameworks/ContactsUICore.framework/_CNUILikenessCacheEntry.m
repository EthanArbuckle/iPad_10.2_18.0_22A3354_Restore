@implementation _CNUILikenessCacheEntry

- (_CNUILikenessCacheEntry)initWithProvider:(id)a3 cancelationToken:(id)a4
{
  id v7;
  id v8;
  _CNUILikenessCacheEntry *v9;
  _CNUILikenessCacheEntry *v10;
  _CNUILikenessCacheEntry *v11;

  v7 = a3;
  v8 = a4;
  v9 = -[_CNUILikenessCacheEntry init](self, "init");
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_provider, a3);
    objc_storeStrong((id *)&v10->_cancelationToken, a4);
    v11 = v10;
  }

  return v10;
}

- (void)dealloc
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)_CNUILikenessCacheEntry;
  -[_CNUILikenessCacheEntry dealloc](&v2, sel_dealloc);
}

- (CNObservable)provider
{
  return self->_provider;
}

- (CNCancelable)cancelationToken
{
  return self->_cancelationToken;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cancelationToken, 0);
  objc_storeStrong((id *)&self->_provider, 0);
}

@end
