@implementation SGRealtimeWalletOrder

- (id)initRealtimeWalletOrderForState:(int)a3 identifier:(id)a4 walletOrderDictionary:(id)a5 walletOrderData:(id)a6
{
  id v12;
  id v13;
  id v14;
  void *v15;
  id v16;
  NSObject *v17;
  SGRealtimeWalletOrder *v18;
  SGRealtimeWalletOrder *v19;
  id *p_isa;
  objc_class *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  objc_super v27;
  id v28;
  uint8_t buf[4];
  void *v30;
  __int16 v31;
  id v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v12 = a4;
  v13 = a5;
  v14 = a6;
  if (v12)
  {
    if (v13)
      goto LABEL_3;
LABEL_13:
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SGRealtimeWalletOrder.m"), 27, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("walletOrderDictionary"));

    if (v14)
      goto LABEL_4;
    goto LABEL_14;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SGRealtimeWalletOrder.m"), 26, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("identifier"));

  if (!v13)
    goto LABEL_13;
LABEL_3:
  if (v14)
    goto LABEL_4;
LABEL_14:
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SGRealtimeWalletOrder.m"), 28, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("walletOrderData"));

LABEL_4:
  v28 = 0;
  objc_msgSend(MEMORY[0x1E0CB36D8], "dataWithJSONObject:options:error:", v13, 0, &v28);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = v28;
  if (v16)
  {
    sgLogHandle();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      v22 = (objc_class *)objc_opt_class();
      NSStringFromClass(v22);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v30 = v23;
      v31 = 2112;
      v32 = v16;
      _os_log_error_impl(&dword_1A2267000, v17, OS_LOG_TYPE_ERROR, "%@: Error encountered while retrieving NSData from dictionary: %@", buf, 0x16u);

    }
    v18 = 0;
  }
  else
  {
    v27.receiver = self;
    v27.super_class = (Class)SGRealtimeWalletOrder;
    v19 = -[SGRealtimeWalletOrder init](&v27, sel_init);
    p_isa = (id *)&v19->super.isa;
    if (v19)
    {
      v19->_state = a3;
      objc_storeStrong((id *)&v19->_identifier, a4);
      objc_storeStrong(p_isa + 3, v15);
      objc_storeStrong(p_isa + 4, a6);
    }
    self = p_isa;
    v18 = self;
  }

  return v18;
}

- (SGRealtimeWalletOrder)initWithCoder:(id)a3
{
  id v4;
  SGRealtimeWalletOrder *v5;
  void *v6;
  uint64_t v7;
  NSString *identifier;
  void *v9;
  uint64_t v10;
  NSData *walletOrderDictData;
  void *v12;
  uint64_t v13;
  NSData *walletOrderData;
  objc_super v16;

  v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)SGRealtimeWalletOrder;
  v5 = -[SGRealtimeWalletOrder init](&v16, sel_init);
  if (v5)
  {
    v5->_state = objc_msgSend(v4, "decodeInt32ForKey:", CFSTR("state"));
    v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithObjects:", objc_opt_class(), 0);
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v6, CFSTR("identifier"));
    v7 = objc_claimAutoreleasedReturnValue();
    identifier = v5->_identifier;
    v5->_identifier = (NSString *)v7;

    v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithObjects:", objc_opt_class(), 0);
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v9, CFSTR("walletOrderDictData"));
    v10 = objc_claimAutoreleasedReturnValue();
    walletOrderDictData = v5->_walletOrderDictData;
    v5->_walletOrderDictData = (NSData *)v10;

    v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithObjects:", objc_opt_class(), 0);
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v12, CFSTR("walletOrderData"));
    v13 = objc_claimAutoreleasedReturnValue();
    walletOrderData = v5->_walletOrderData;
    v5->_walletOrderData = (NSData *)v13;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  uint64_t state;
  id v5;

  state = self->_state;
  v5 = a3;
  objc_msgSend(v5, "encodeInt32:forKey:", state, CFSTR("state"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_identifier, CFSTR("identifier"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_walletOrderDictData, CFSTR("walletOrderDictData"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_walletOrderData, CFSTR("walletOrderData"));

}

- (unint64_t)hash
{
  return -[NSString hash](self->_identifier, "hash");
}

- (BOOL)isEqual:(id)a3
{
  SGRealtimeWalletOrder *v4;
  SGRealtimeWalletOrder *v5;
  BOOL v6;

  v4 = (SGRealtimeWalletOrder *)a3;
  v5 = v4;
  if (v4 == self)
    v6 = 1;
  else
    v6 = v4
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && -[SGRealtimeWalletOrder isEqualToRealtimeWalletOrder:](self, "isEqualToRealtimeWalletOrder:", v5);

  return v6;
}

- (BOOL)isEqualToRealtimeWalletOrder:(id)a3
{
  id *v4;
  int state;
  NSString *identifier;
  NSString *v7;
  NSString *v8;
  NSString *v9;
  char v10;
  NSData *walletOrderDictData;
  NSData *v12;
  NSData *v13;
  NSData *v14;
  char v15;
  char v16;
  NSData *v17;
  NSData *v18;

  v4 = (id *)a3;
  state = self->_state;
  if (state != objc_msgSend(v4, "state"))
    goto LABEL_8;
  identifier = self->_identifier;
  v7 = (NSString *)v4[2];
  if (identifier == v7)
  {

  }
  else
  {
    v8 = v7;
    v9 = identifier;
    v10 = -[NSString isEqual:](v9, "isEqual:", v8);

    if ((v10 & 1) == 0)
      goto LABEL_8;
  }
  walletOrderDictData = self->_walletOrderDictData;
  v12 = (NSData *)v4[3];
  if (walletOrderDictData == v12)
  {

  }
  else
  {
    v13 = v12;
    v14 = walletOrderDictData;
    v15 = -[NSData isEqual:](v14, "isEqual:", v13);

    if ((v15 & 1) == 0)
    {
LABEL_8:
      v16 = 0;
      goto LABEL_14;
    }
  }
  v17 = self->_walletOrderData;
  v18 = v17;
  if (v17 == v4[4])
    v16 = 1;
  else
    v16 = -[NSData isEqual:](v17, "isEqual:");

LABEL_14:
  return v16;
}

- (id)walletOrderDictionary
{
  NSData *walletOrderDictData;
  void *v3;
  id v4;
  void *v5;
  NSObject *v6;
  objc_class *v8;
  void *v9;
  id v10;
  uint8_t buf[4];
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  walletOrderDictData = self->_walletOrderDictData;
  if (!walletOrderDictData)
  {
LABEL_6:
    v3 = 0;
    return v3;
  }
  v10 = 0;
  objc_msgSend(MEMORY[0x1E0CB36D8], "JSONObjectWithData:options:error:", walletOrderDictData, 0, &v10);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v10;
  if (v4)
  {
    v5 = v4;
    sgLogHandle();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      v8 = (objc_class *)objc_opt_class();
      NSStringFromClass(v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v12 = v9;
      _os_log_error_impl(&dword_1A2267000, v6, OS_LOG_TYPE_ERROR, "%@: Error encountered while retrieving string from NSData", buf, 0xCu);

    }
    goto LABEL_6;
  }
  return v3;
}

- (NSString)description
{
  id v3;
  NSString *identifier;
  uint64_t state;
  void *v6;
  void *v7;

  v3 = objc_alloc(MEMORY[0x1E0CB3940]);
  identifier = self->_identifier;
  state = self->_state;
  -[SGRealtimeWalletOrder walletOrderDictionary](self, "walletOrderDictionary");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v7;
}

- (int)state
{
  return self->_state;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (NSData)walletOrderDictData
{
  return self->_walletOrderDictData;
}

- (NSData)walletOrderData
{
  return self->_walletOrderData;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_walletOrderData, 0);
  objc_storeStrong((id *)&self->_walletOrderDictData, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
