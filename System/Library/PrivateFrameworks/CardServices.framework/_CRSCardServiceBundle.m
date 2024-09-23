@implementation _CRSCardServiceBundle

- (id)underlyingService
{
  void *v3;
  void *v4;

  v3 = (void *)-[_CRSCardServiceBundle principalClass](self, "principalClass");
  if (!self->_cardService)
  {
    v4 = v3;
    if (objc_msgSend(v3, "conformsToProtocol:", &unk_2550A1B30))
      -[_CRSCardServiceBundle _initializeCardServiceWithClass:](self, "_initializeCardServiceWithClass:", v4);
  }
  return self->_cardService;
}

- (void)_initializeCardServiceWithClass:(Class)a3
{
  void *v5;
  NSObject *v6;
  void *v7;
  CRSCardServing *v8;
  CRSCardServing *cardService;
  int v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v5 = (void *)*MEMORY[0x24BE15490];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE15490], OS_LOG_TYPE_INFO))
  {
    v6 = v5;
    NSStringFromClass(a3);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = 138412290;
    v11 = v7;
    _os_log_impl(&dword_219849000, v6, OS_LOG_TYPE_INFO, "Initializing a card service of class %@", (uint8_t *)&v10, 0xCu);

  }
  v8 = (CRSCardServing *)objc_alloc_init(a3);
  cardService = self->_cardService;
  self->_cardService = v8;

}

- (void)requestCard:(id)a3 reply:(id)a4
{
  id v6;
  id v7;
  id v8;

  v6 = a4;
  v7 = a3;
  -[_CRSCardServiceBundle underlyingService](self, "underlyingService");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "requestCard:reply:", v7, v6);

}

- (BOOL)canSatisfyCardRequest:(id)a3
{
  id v4;
  void *v5;
  char v6;

  v4 = a3;
  -[_CRSCardServiceBundle underlyingService](self, "underlyingService");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v6 = objc_msgSend(v5, "canSatisfyCardRequest:", v4);
  else
    v6 = 0;

  return v6;
}

- (unint64_t)servicePriorityForRequest:(id)a3
{
  id v4;
  void *v5;
  unint64_t v6;

  v4 = a3;
  -[_CRSCardServiceBundle underlyingService](self, "underlyingService");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v6 = objc_msgSend(v5, "servicePriorityForRequest:", v4);
  else
    v6 = 0;

  return v6;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cardService, 0);
}

@end
