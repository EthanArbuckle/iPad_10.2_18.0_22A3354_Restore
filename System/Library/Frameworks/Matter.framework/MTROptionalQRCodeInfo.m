@implementation MTROptionalQRCodeInfo

- (MTROptionalQRCodeInfo)initWithTag:(id)a3 int32Value:(int)a4
{
  id v6;
  MTROptionalQRCodeInfo *v7;
  objc_super v9;

  v6 = a3;
  v9.receiver = self;
  v9.super_class = (Class)MTROptionalQRCodeInfo;
  v7 = -[MTROptionalQRCodeInfo init](&v9, sel_init);
  v7->_info.type = 2;
  v7->_info.tag = sub_23404319C(v6);
  v7->_info.data.__r_.var0 = a4;

  return v7;
}

- (MTROptionalQRCodeInfo)initWithTag:(id)a3 stringValue:(id)a4
{
  id v6;
  id v7;
  MTROptionalQRCodeInfo *v8;
  id v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  objc_super v14;

  v6 = a3;
  v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)MTROptionalQRCodeInfo;
  v8 = -[MTROptionalQRCodeInfo init](&v14, sel_init);
  v8->_info.type = 1;
  v8->_info.tag = sub_23404319C(v6);
  if (!v7)
    sub_234002A9C(CFSTR("value"));
  v9 = objc_retainAutorelease(v7);
  v12 = objc_msgSend_UTF8String(v9, v10, v11);
  MEMORY[0x23493E5F0](&v8->_info.data, v12);

  return v8;
}

- (MTROptionalQRCodeInfoType)type
{
  int type;

  type = self->_info.type;
  if (type == 1)
    return 1;
  else
    return 2 * (type == 2);
}

- (NSNumber)tag
{
  return (NSNumber *)objc_msgSend_numberWithUnsignedChar_(MEMORY[0x24BDD16E0], a2, self->_info.tag);
}

- (NSNumber)integerValue
{
  void *v2;

  if (self->_info.type == 2)
  {
    objc_msgSend_numberWithInt_(MEMORY[0x24BDD16E0], a2, self->_info.data.__r_.var0);
    v2 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v2 = 0;
  }
  return (NSNumber *)v2;
}

- (NSString)stringValue
{
  basic_string<char, std::char_traits<char>, std::allocator<char>> *p_data;
  void *v3;

  if (self->_info.type == 1)
  {
    p_data = &self->_info.data;
    if (*((char *)&self->_info.data.__r_.__value_.var0.__l + 23) < 0)
      p_data = (basic_string<char, std::char_traits<char>, std::allocator<char>> *)p_data->__r_.__value_.var0.__l.__data_;
    objc_msgSend_stringWithUTF8String_(MEMORY[0x24BDD17C8], a2, (uint64_t)p_data);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }
  return (NSString *)v3;
}

- (unint64_t)hash
{
  return (self->_info.type << 8) | (unint64_t)self->_info.tag;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  uint64_t v5;
  BOOL v6;
  unsigned __int8 *v7;
  unsigned __int8 *v8;
  int type;
  uint64_t v10;
  unint64_t size;
  uint64_t v12;
  int v13;
  basic_string<char, std::char_traits<char>, std::allocator<char>> *p_data;
  unsigned __int8 *v15;
  uint64_t v16;
  int v17;
  int v18;
  int v19;
  int v20;
  BOOL v22;
  BOOL v24;

  v4 = a3;
  v5 = objc_opt_class();
  if (v5 == objc_opt_class())
  {
    v7 = (unsigned __int8 *)v4;
    v8 = v7;
    if (self->_info.tag == v7[8])
    {
      type = self->_info.type;
      if (type == *((_DWORD *)v7 + 3))
      {
        if (type == 2)
        {
          v24 = self->_info.data.__r_.var0 == *((_DWORD *)v7 + 10);
LABEL_29:
          v6 = v24;
          goto LABEL_26;
        }
        if (type == 1)
        {
          v10 = *((unsigned __int8 *)&self->_info.data.__r_.__value_.var0.__l + 23);
          if ((v10 & 0x80u) == 0)
            size = *((unsigned __int8 *)&self->_info.data.__r_.__value_.var0.__l + 23);
          else
            size = self->_info.data.__r_.__value_.var0.__l.__size_;
          v12 = v7[39];
          v13 = (char)v12;
          if ((v12 & 0x80u) != 0)
            v12 = *((_QWORD *)v7 + 3);
          if (size == v12)
          {
            p_data = &self->_info.data;
            if (v13 >= 0)
              v15 = v7 + 16;
            else
              v15 = (unsigned __int8 *)*((_QWORD *)v7 + 2);
            if ((v10 & 0x80) == 0)
            {
              if (*((_BYTE *)&self->_info.data.__r_.__value_.var0.__l + 23))
              {
                v16 = v10 - 1;
                do
                {
                  v18 = p_data->__r_.__value_.var0.__s.__data_[0];
                  p_data = (basic_string<char, std::char_traits<char>, std::allocator<char>> *)((char *)p_data + 1);
                  v17 = v18;
                  v20 = *v15++;
                  v19 = v20;
                  v22 = v16-- != 0;
                  v6 = v17 == v19;
                }
                while (v17 == v19 && v22);
              }
              else
              {
                v6 = 1;
              }
              goto LABEL_26;
            }
            v24 = memcmp(p_data->__r_.__value_.var0.__l.__data_, v15, self->_info.data.__r_.__value_.var0.__l.__size_) == 0;
            goto LABEL_29;
          }
        }
      }
    }
    v6 = 0;
LABEL_26:

    goto LABEL_27;
  }
  v6 = 0;
LABEL_27:

  return v6;
}

- (id)description
{
  uint64_t v2;
  void *v4;
  void *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  const char *v9;
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;

  v4 = (void *)MEMORY[0x24BDD17C8];
  objc_msgSend_tag(self, a2, v2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend_unsignedCharValue(v5, v6, v7);
  objc_msgSend_integerValue(self, v9, v10);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v13;
  if (!v13)
  {
    objc_msgSend_stringValue(self, v11, v12);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend_stringWithFormat_(v4, v11, (uint64_t)CFSTR("0x%02x=%@"), v8, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v13)

  return v15;
}

- (void).cxx_destruct
{
  if (*((char *)&self->_info.data.__r_.__value_.var0.__l + 23) < 0)
    operator delete(self->_info.data.__r_.__value_.var0.__l.__data_);
}

- (id).cxx_construct
{
  *((_OWORD *)self + 1) = 0uLL;
  *((_DWORD *)self + 10) = 0;
  *((_QWORD *)self + 4) = 0;
  return self;
}

- (MTROptionalQRCodeInfo)init
{
  return (MTROptionalQRCodeInfo *)MEMORY[0x24BEDD108](self, sel_initWithTag_stringValue_, &unk_2505944B8);
}

- (NSNumber)infoType
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  const char *v5;

  v3 = (void *)MEMORY[0x24BDD16E0];
  v4 = objc_msgSend_type(self, a2, v2);
  return (NSNumber *)objc_msgSend_numberWithUnsignedInteger_(v3, v5, v4);
}

@end
