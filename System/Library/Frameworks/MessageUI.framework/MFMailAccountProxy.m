@implementation MFMailAccountProxy

+ (id)log
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __25__MFMailAccountProxy_log__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (log_onceToken_1 != -1)
    dispatch_once(&log_onceToken_1, block);
  return (id)log_log_1;
}

void __25__MFMailAccountProxy_log__block_invoke(uint64_t a1)
{
  os_log_t v1;
  void *v2;
  id v3;

  NSStringFromClass(*(Class *)(a1 + 32));
  v3 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v1 = os_log_create("com.apple.email", (const char *)objc_msgSend(v3, "UTF8String"));
  v2 = (void *)log_log_1;
  log_log_1 = (uint64_t)v1;

}

- (id)_initWithProperties:(id)a3
{
  id v4;
  MFMailAccountProxy *v5;
  uint64_t v6;
  NSDictionary *properties;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)MFMailAccountProxy;
  v5 = -[MFMailAccountProxy init](&v9, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    properties = v5->_properties;
    v5->_properties = (NSDictionary *)v6;

  }
  return v5;
}

- (BOOL)isDefaultDeliveryAccount
{
  void *v2;
  char v3;

  -[NSDictionary objectForKeyedSubscript:](self->_properties, "objectForKeyedSubscript:", *MEMORY[0x1E0D46A58]);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "BOOLValue");

  return v3;
}

- (NSString)fullUserName
{
  return (NSString *)-[NSDictionary objectForKeyedSubscript:](self->_properties, "objectForKeyedSubscript:", *MEMORY[0x1E0D46A48]);
}

- (NSString)username
{
  return (NSString *)-[NSDictionary objectForKeyedSubscript:](self->_properties, "objectForKeyedSubscript:", *MEMORY[0x1E0D46A88]);
}

- (NSString)firstEmailAddress
{
  void *v3;
  void *v4;
  id v5;
  void *v6;

  -[NSDictionary objectForKeyedSubscript:](self->_properties, "objectForKeyedSubscript:", *MEMORY[0x1E0D46A20]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    v5 = v3;
  }
  else
  {
    -[MFMailAccountProxy emailAddresses](self, "emailAddresses");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "firstObject");
    v5 = (id)objc_claimAutoreleasedReturnValue();

  }
  return (NSString *)v5;
}

- (NSArray)emailAddresses
{
  return (NSArray *)-[NSDictionary objectForKeyedSubscript:](self->_properties, "objectForKeyedSubscript:", *MEMORY[0x1E0D46A28]);
}

- (NSArray)fromEmailAddresses
{
  return (NSArray *)-[NSDictionary objectForKeyedSubscript:](self->_properties, "objectForKeyedSubscript:", *MEMORY[0x1E0D46A38]);
}

- (NSArray)fromEmailAddressesIncludingDisabled
{
  return (NSArray *)-[NSDictionary objectForKeyedSubscript:](self->_properties, "objectForKeyedSubscript:", *MEMORY[0x1E0D46A40]);
}

- (id)_emailAddressesAndAliases
{
  return -[NSDictionary objectForKeyedSubscript:](self->_properties, "objectForKeyedSubscript:", *MEMORY[0x1E0D46A30]);
}

- (NSString)uniqueID
{
  return (NSString *)-[NSDictionary objectForKeyedSubscript:](self->_properties, "objectForKeyedSubscript:", *MEMORY[0x1E0D46A18]);
}

- (BOOL)supportsThreadOperations
{
  void *v2;
  char v3;

  -[NSDictionary objectForKeyedSubscript:](self->_properties, "objectForKeyedSubscript:", *MEMORY[0x1E0D46A80]);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "BOOLValue");

  return v3;
}

- (BOOL)restrictsRepliesAndForwards
{
  void *v2;
  char v3;

  -[NSDictionary objectForKeyedSubscript:](self->_properties, "objectForKeyedSubscript:", *MEMORY[0x1E0D46A70]);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "BOOLValue");

  return v3;
}

- (BOOL)supportsMailDrop
{
  void *v2;
  char v3;

  -[NSDictionary objectForKeyedSubscript:](self->_properties, "objectForKeyedSubscript:", *MEMORY[0x1E0D46A78]);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "BOOLValue");

  return v3;
}

- (BOOL)isManaged
{
  void *v2;
  char v3;

  -[NSDictionary objectForKeyedSubscript:](self->_properties, "objectForKeyedSubscript:", *MEMORY[0x1E0D46A60]);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "BOOLValue");

  return v3;
}

- (BOOL)_isActive
{
  void *v2;
  char v3;

  -[NSDictionary objectForKeyedSubscript:](self->_properties, "objectForKeyedSubscript:", *MEMORY[0x1E0D46A50]);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "BOOLValue");

  return v3;
}

- (BOOL)_isRestricted
{
  void *v2;
  char v3;

  -[NSDictionary objectForKeyedSubscript:](self->_properties, "objectForKeyedSubscript:", *MEMORY[0x1E0D46A68]);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "BOOLValue");

  return v3;
}

- (id)mailAccount
{
  void *v3;
  void *v4;
  void *v5;

  if (MFIsMobileMail())
  {
    v3 = (void *)MEMORY[0x1E0D4D620];
    -[MFMailAccountProxy firstEmailAddress](self, "firstEmailAddress");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "accountContainingEmailAddress:includingInactive:", v4, 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v5 = 0;
  }
  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_properties, 0);
}

@end
