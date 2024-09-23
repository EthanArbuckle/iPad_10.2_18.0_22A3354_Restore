@implementation FKSuggestionsWalletOrderAttachment

- (FKSuggestionsWalletOrderAttachment)initWithURL:(id)a3 data:(id)a4 fqoid:(id)a5 state:(unint64_t)a6
{
  id v10;
  id v11;
  id v12;
  FKSuggestionsWalletOrderAttachment *v13;
  uint64_t v14;
  NSURL *url;
  uint64_t v16;
  NSData *data;
  uint64_t v18;
  NSString *fullyQualifiedOrderIdentifier;
  objc_super v21;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v21.receiver = self;
  v21.super_class = (Class)FKSuggestionsWalletOrderAttachment;
  v13 = -[FKSuggestionsWalletOrderAttachment init](&v21, sel_init);
  if (v13)
  {
    v14 = objc_msgSend(v10, "copy");
    url = v13->_url;
    v13->_url = (NSURL *)v14;

    v16 = objc_msgSend(v11, "copy");
    data = v13->_data;
    v13->_data = (NSData *)v16;

    v18 = objc_msgSend(v12, "copy");
    fullyQualifiedOrderIdentifier = v13->_fullyQualifiedOrderIdentifier;
    v13->_fullyQualifiedOrderIdentifier = (NSString *)v18;

    v13->_orderState = a6;
  }

  return v13;
}

+ (id)readContentsOfOrderAtURL:(id)a3 error:(id *)a4
{
  void *v4;
  FKSuggestionsWalletOrderAttachment *v5;
  void *v6;
  void *v7;
  void *v8;
  unint64_t v9;
  uint64_t v10;
  FKSuggestionsWalletOrderAttachment *v11;

  +[SuggestionsWalletOrderAttachment readContentsOfOrderAt:error:](_TtC10FinanceKit32SuggestionsWalletOrderAttachment, "readContentsOfOrderAt:error:", a3, a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = [FKSuggestionsWalletOrderAttachment alloc];
  objc_msgSend(v4, "url");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "data");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "fqoid");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v4, "state");
  if (v9 > 3)
    v10 = 0;
  else
    v10 = qword_233623D08[v9];
  v11 = -[FKSuggestionsWalletOrderAttachment initWithURL:data:fqoid:state:](v5, "initWithURL:data:fqoid:state:", v6, v7, v8, v10);

  return v11;
}

- (NSURL)url
{
  return self->_url;
}

- (NSData)data
{
  return self->_data;
}

- (NSString)fullyQualifiedOrderIdentifier
{
  return self->_fullyQualifiedOrderIdentifier;
}

- (unint64_t)orderState
{
  return self->_orderState;
}

- (void)setOrderState:(unint64_t)a3
{
  self->_orderState = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fullyQualifiedOrderIdentifier, 0);
  objc_storeStrong((id *)&self->_data, 0);
  objc_storeStrong((id *)&self->_url, 0);
}

@end
