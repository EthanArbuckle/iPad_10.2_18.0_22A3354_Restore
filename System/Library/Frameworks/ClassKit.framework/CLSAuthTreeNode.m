@implementation CLSAuthTreeNode

- (CLSAuthTreeNode)initWithStatusID:(id)a3 identifier:(id)a4 status:(int64_t)a5
{
  id v9;
  id v10;
  CLSAuthTreeNode *v11;
  CLSAuthTreeNode *v12;
  objc_super v14;

  v9 = a3;
  v10 = a4;
  v14.receiver = self;
  v14.super_class = (Class)CLSAuthTreeNode;
  v11 = -[CLSAuthTreeNode init](&v14, sel_init);
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_statusID, a3);
    objc_storeStrong((id *)&v12->_identifier, a4);
    v12->_status = a5;
  }

  return v12;
}

- (CLSAuthTreeNode)initWithCoder:(id)a3
{
  id v4;
  CLSAuthTreeNode *v5;
  uint64_t v6;
  const char *v7;
  uint64_t v8;
  NSString *statusID;
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  NSString *identifier;
  uint64_t v14;
  const char *v15;
  void *v16;
  const char *v17;
  uint64_t v18;
  objc_super v20;

  v4 = a3;
  v20.receiver = self;
  v20.super_class = (Class)CLSAuthTreeNode;
  v5 = -[CLSAuthTreeNode init](&v20, sel_init);
  if (v5)
  {
    v6 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v7, v6, CFSTR("statusID"));
    v8 = objc_claimAutoreleasedReturnValue();
    statusID = v5->_statusID;
    v5->_statusID = (NSString *)v8;

    v10 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v11, v10, CFSTR("identifier"));
    v12 = objc_claimAutoreleasedReturnValue();
    identifier = v5->_identifier;
    v5->_identifier = (NSString *)v12;

    v14 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v15, v14, CFSTR("status"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_status = objc_msgSend_integerValue(v16, v17, v18);

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *statusID;
  id v5;
  const char *v6;
  const char *v7;
  const char *v8;
  const char *v9;
  id v10;

  statusID = self->_statusID;
  v5 = a3;
  objc_msgSend_encodeObject_forKey_(v5, v6, (uint64_t)statusID, CFSTR("statusID"));
  objc_msgSend_encodeObject_forKey_(v5, v7, (uint64_t)self->_identifier, CFSTR("identifier"));
  objc_msgSend_numberWithInteger_(MEMORY[0x1E0CB37E8], v8, self->_status);
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v5, v9, (uint64_t)v10, CFSTR("status"));

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSString)statusID
{
  return self->_statusID;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (int64_t)status
{
  return self->_status;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_statusID, 0);
}

@end
