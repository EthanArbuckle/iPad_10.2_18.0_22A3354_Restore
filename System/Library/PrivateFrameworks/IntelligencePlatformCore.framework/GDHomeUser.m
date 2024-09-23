@implementation GDHomeUser

- (GDHomeUser)initWithHMUser:(id)a3
{
  id v5;
  GDHomeUser *v6;
  GDHomeUser *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)GDHomeUser;
  v6 = -[GDHomeUser init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_inner, a3);

  return v7;
}

- (BOOL)isAdministratorForHome:(id)a3
{
  uint64_t v3;
  void *v5;
  const char *v6;
  uint64_t v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;

  objc_msgSend_hmHome(a3, a2, (uint64_t)a3, v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_homeAccessControlForUser_(v5, v6, (uint64_t)self->_inner, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(v5) = objc_msgSend_isAdministrator(v8, v9, v10, v11);
  return (char)v5;
}

- (NSString)name
{
  uint64_t v2;
  uint64_t v3;

  return (NSString *)objc_msgSend_name(self->_inner, a2, v2, v3);
}

- (NSUUID)uniqueIdentifier
{
  uint64_t v2;
  uint64_t v3;

  return (NSUUID *)objc_msgSend_uniqueIdentifier(self->_inner, a2, v2, v3);
}

- (NSString)userID
{
  return (NSString *)((uint64_t (*)(HMUser *, char *))MEMORY[0x1E0DE7D20])(self->_inner, sel_userID);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_inner, 0);
}

@end
