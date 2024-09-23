@implementation CKLTrafficLogMessageFragment

- (CKLTrafficLogMessageFragment)initWithMessage:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  const char *v7;
  uint64_t v8;
  CKLTrafficLogMessageFragment *v9;
  uint64_t v10;
  const char *v11;
  CKLTrafficLogMessageFragment *v12;
  void *v13;
  const char *v14;
  uint64_t v15;
  const char *v16;
  uint64_t v17;
  NSString *uuid;
  const char *v19;
  void *v20;
  const char *v21;
  uint64_t v22;
  const char *v23;
  uint64_t v24;
  NSString *dataString;
  objc_super v27;

  v4 = a3;
  if ((unint64_t)objc_msgSend_length(v4, v5, v6) < 0x26
    || (v8 = objc_msgSend_rangeOfString_(v4, v7, (uint64_t)CFSTR(":")), v8 == 0x7FFFFFFFFFFFFFFFLL))
  {
    v9 = 0;
  }
  else
  {
    v10 = v8;
    v27.receiver = self;
    v27.super_class = (Class)CKLTrafficLogMessageFragment;
    v12 = -[CKLTrafficLogMessageFragment init](&v27, sel_init);
    if (v12)
    {
      objc_msgSend_substringWithRange_(v4, v11, 0, 1);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v12->_type = objc_msgSend_integerValue(v13, v14, v15);

      objc_msgSend_substringWithRange_(v4, v16, 1, 36);
      v17 = objc_claimAutoreleasedReturnValue();
      uuid = v12->_uuid;
      v12->_uuid = (NSString *)v17;

      objc_msgSend_substringWithRange_(v4, v19, 37, v10 - 37);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v12->_seqNum = objc_msgSend_integerValue(v20, v21, v22);

      objc_msgSend_substringFromIndex_(v4, v23, v10 + 1);
      v24 = objc_claimAutoreleasedReturnValue();
      dataString = v12->_dataString;
      v12->_dataString = (NSString *)v24;

    }
    self = v12;
    v9 = self;
  }

  return v9;
}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  const char *v6;
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  unint64_t v10;
  const __CFString *v11;
  uint64_t v12;
  const char *v13;
  uint64_t v14;
  void *v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  const char *v19;
  uint64_t v20;
  void *v21;
  const char *v22;
  void *v23;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend_type(self, v6, v7) - 1;
  if (v10 > 6)
    v11 = CFSTR("Unknown type");
  else
    v11 = off_1E78337F8[v10];
  v12 = objc_msgSend_seqNum(self, v8, v9);
  objc_msgSend_dataString(self, v13, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend_length(v15, v16, v17);
  objc_msgSend_uuid(self, v19, v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_stringWithFormat_(v3, v22, (uint64_t)CFSTR("<%@ %p> [Type: %@, Seq: %ld, Len: %lu, UUID: %@]"), v5, self, v11, v12, v18, v21);
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  return v23;
}

- (unint64_t)type
{
  return self->_type;
}

- (NSString)uuid
{
  return self->_uuid;
}

- (int64_t)seqNum
{
  return self->_seqNum;
}

- (NSString)dataString
{
  return self->_dataString;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dataString, 0);
  objc_storeStrong((id *)&self->_uuid, 0);
}

@end
