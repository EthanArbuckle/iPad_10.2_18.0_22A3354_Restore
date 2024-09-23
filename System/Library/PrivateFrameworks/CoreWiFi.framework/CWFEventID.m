@implementation CWFEventID

- (void)encodeWithCoder:(id)a3
{
  int64_t type;
  const char *v5;
  uint64_t v6;
  const char *v7;
  uint64_t v8;
  id v9;

  type = self->_type;
  v9 = a3;
  objc_msgSend_encodeInteger_forKey_(v9, v5, type, (uint64_t)CFSTR("_type"), v6);
  objc_msgSend_encodeObject_forKey_(v9, v7, (uint64_t)self->_interfaceName, (uint64_t)CFSTR("_interfaceName"), v8);

}

- (id)description
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *v6;
  void *v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;

  v6 = (void *)MEMORY[0x1E0CB3940];
  sub_1B062BEE0(self->_type, a2, v2, v3, v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_stringWithFormat_(v6, v8, (uint64_t)CFSTR("type=%@, intf=%@"), v9, v10, v7, self->_interfaceName);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (CWFEventID)initWithCoder:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  CWFEventID *v8;
  uint64_t v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  NSString *interfaceName;
  objc_super v15;

  v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)CWFEventID;
  v8 = -[CWFEventID init](&v15, sel_init);
  if (v8)
  {
    v8->_type = objc_msgSend_decodeIntegerForKey_(v4, v5, (uint64_t)CFSTR("_type"), v6, v7);
    v9 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v10, v9, (uint64_t)CFSTR("_interfaceName"), v11);
    v12 = objc_claimAutoreleasedReturnValue();
    interfaceName = v8->_interfaceName;
    v8->_interfaceName = (NSString *)v12;

  }
  return v8;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v3;
  uint64_t v4;
  void *v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;

  v6 = (void *)objc_msgSend_allocWithZone_(CWFEventID, a2, (uint64_t)a3, v3, v4);
  v11 = (void *)objc_msgSend_init(v6, v7, v8, v9, v10);
  objc_msgSend_setType_(v11, v12, self->_type, v13, v14);
  objc_msgSend_setInterfaceName_(v11, v15, (uint64_t)self->_interfaceName, v16, v17);
  return v11;
}

- (BOOL)isEqual:(id)a3
{
  CWFEventID *v4;
  CWFEventID *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  char isEqualToEventID;

  v4 = (CWFEventID *)a3;
  v5 = v4;
  if (v4 == self)
  {
    isEqualToEventID = 1;
  }
  else if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    isEqualToEventID = objc_msgSend_isEqualToEventID_(self, v6, (uint64_t)v5, v7, v8);
  }
  else
  {
    isEqualToEventID = 0;
  }

  return isEqualToEventID;
}

- (BOOL)isEqualToEventID:(id)a3
{
  id v4;
  int64_t type;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  NSString *interfaceName;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  NSString *v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  NSString *v25;
  void *v26;
  const char *v27;
  uint64_t v28;
  uint64_t v29;
  char isEqual;

  v4 = a3;
  type = self->_type;
  if (type == objc_msgSend_type(v4, v6, v7, v8, v9))
  {
    interfaceName = self->_interfaceName;
    objc_msgSend_interfaceName(v4, v10, v11, v12, v13);
    v19 = (NSString *)objc_claimAutoreleasedReturnValue();
    if (interfaceName == v19)
    {
      isEqual = 1;
    }
    else if (self->_interfaceName)
    {
      objc_msgSend_interfaceName(v4, v15, v16, v17, v18);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      if (v24)
      {
        v25 = self->_interfaceName;
        objc_msgSend_interfaceName(v4, v20, v21, v22, v23);
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        isEqual = objc_msgSend_isEqual_(v25, v27, (uint64_t)v26, v28, v29);

      }
      else
      {
        isEqual = 0;
      }

    }
    else
    {
      isEqual = 0;
    }

  }
  else
  {
    isEqual = 0;
  }

  return isEqual;
}

- (int64_t)type
{
  return self->_type;
}

- (NSString)interfaceName
{
  return self->_interfaceName;
}

+ (id)eventIDWithType:(int64_t)a3 interfaceName:(id)a4
{
  id v5;
  CWFEventID *v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;

  v5 = a4;
  v6 = objc_alloc_init(CWFEventID);
  objc_msgSend_setType_(v6, v7, a3, v8, v9);
  objc_msgSend_setInterfaceName_(v6, v10, (uint64_t)v5, v11, v12);

  return v6;
}

- (void)setType:(int64_t)a3
{
  self->_type = a3;
}

- (void)setInterfaceName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (unint64_t)hash
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  int64_t type;

  type = self->_type;
  return objc_msgSend_hash(self->_interfaceName, a2, v2, v3, v4) ^ type;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_interfaceName, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
