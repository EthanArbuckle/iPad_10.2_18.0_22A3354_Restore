@implementation CATSharingCloseMessage

- (CATSharingCloseMessage)initWithError:(id)a3
{
  id v5;
  CATSharingCloseMessage *v6;
  CATSharingCloseMessage *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CATSharingCloseMessage;
  v6 = -[CATSharingCloseMessage init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_closeError, a3);

  return v7;
}

- (int64_t)messageType
{
  return 2;
}

- (NSDictionary)dictionaryValue
{
  void *v3;
  void *v4;
  void *v5;

  v3 = (void *)objc_opt_new();
  -[CATSharingCloseMessage closeError](self, "closeError");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v4, CFSTR("SharingCloseMessageError"));

  v5 = (void *)objc_msgSend(v3, "copy");
  return (NSDictionary *)v5;
}

+ (id)instanceWithDictionary:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;

  v4 = a3;
  v5 = objc_alloc((Class)a1);
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("SharingCloseMessageError"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v7 = v6;
  else
    v7 = 0;
  v8 = v7;

  v9 = (void *)objc_msgSend(v5, "initWithError:", v8);
  return v9;
}

- (NSError)closeError
{
  return self->_closeError;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_closeError, 0);
}

@end
