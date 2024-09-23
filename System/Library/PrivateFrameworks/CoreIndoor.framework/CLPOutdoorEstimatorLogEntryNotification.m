@implementation CLPOutdoorEstimatorLogEntryNotification

- (CLPOutdoorEstimatorLogEntryNotification)initWithSerializedOutdoorEstimatorLogEntry:()basic_string<char
{
  char *v4;
  CLPOutdoorEstimatorLogEntryNotification *v5;
  CLPOutdoorEstimatorLogEntryNotification *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)CLPOutdoorEstimatorLogEntryNotification;
  v4 = -[CLPOutdoorEstimatorLogEntryNotification init](&v8, sel_init);
  v5 = (CLPOutdoorEstimatorLogEntryNotification *)v4;
  if (v4)
  {
    std::string::operator=((std::string *)(v4 + 8), (const std::string *)a3);
    v6 = v5;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  const char *v4;
  uint64_t v5;
  void *v6;
  const char *v7;
  uint64_t v8;
  id v9;

  v9 = a3;
  if (*((char *)&self->_serializedOutdoorEstimatorLogEntry.__r_.__value_.var0.var1 + 23) < 0)
    objc_msgSend_dataWithBytes_length_(MEMORY[0x24BDBCE50], v4, (uint64_t)self->_serializedOutdoorEstimatorLogEntry.__r_.__value_.var0.var1.__data_, self->_serializedOutdoorEstimatorLogEntry.__r_.__value_.var0.var1.__size_, v5);
  else
    objc_msgSend_dataWithBytes_length_(MEMORY[0x24BDBCE50], v4, (uint64_t)&self->_serializedOutdoorEstimatorLogEntry, *((unsigned __int8 *)&self->_serializedOutdoorEstimatorLogEntry.__r_.__value_.var0.var1 + 23), v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v9, v7, (uint64_t)v6, (uint64_t)CFSTR("outdoorEstimatorLogEntry"), v8);

}

- (void).cxx_destruct
{
  if (*((char *)&self->_serializedOutdoorEstimatorLogEntry.__r_.__value_.var0.var1 + 23) < 0)
    operator delete(self->_serializedOutdoorEstimatorLogEntry.__r_.__value_.var0.var1.__data_);
}

- (id).cxx_construct
{
  *(_OWORD *)((char *)self + 8) = 0uLL;
  *((_QWORD *)self + 3) = 0;
  return self;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CLPOutdoorEstimatorLogEntryNotification)init
{
  uint64_t v2;
  uint64_t v3;

  objc_msgSend_doesNotRecognizeSelector_(self, a2, (uint64_t)a2, v2, v3);

  return 0;
}

- (CLPOutdoorEstimatorLogEntryNotification)initWithCoder:(id)a3
{
  id v4;
  CLPOutdoorEstimatorLogEntryNotification *v5;
  uint64_t v6;
  const char *v7;
  uint64_t v8;
  id v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  const void *v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  unint64_t v19;
  size_t v20;
  __int128 *p_dst;
  basic_string<char, std::char_traits<char>, std::allocator<char>> *p_serializedOutdoorEstimatorLogEntry;
  __int128 v23;
  CLPOutdoorEstimatorLogEntryNotification *v24;
  uint64_t v26;
  uint64_t v27;
  __int128 __dst;
  unint64_t v29;
  objc_super v30;

  v4 = a3;
  v30.receiver = self;
  v30.super_class = (Class)CLPOutdoorEstimatorLogEntryNotification;
  v5 = -[CLPOutdoorEstimatorLogEntryNotification init](&v30, sel_init);
  if (v5)
  {
    v6 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v7, v6, (uint64_t)CFSTR("outdoorEstimatorLogEntry"), v8);
    v9 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v14 = (const void *)objc_msgSend_bytes(v9, v10, v11, v12, v13);
    v19 = objc_msgSend_length(v9, v15, v16, v17, v18);
    v20 = v19;
    if (v19 >= 0x7FFFFFFFFFFFFFF8)
      sub_21646B134();
    if (v19 >= 0x17)
    {
      v26 = (v19 & 0xFFFFFFFFFFFFFFF8) + 8;
      if ((v19 | 7) != 0x17)
        v26 = v19 | 7;
      v27 = v26 + 1;
      p_dst = (__int128 *)operator new(v26 + 1);
      *((_QWORD *)&__dst + 1) = v20;
      v29 = v27 | 0x8000000000000000;
      *(_QWORD *)&__dst = p_dst;
    }
    else
    {
      HIBYTE(v29) = v19;
      p_dst = &__dst;
      if (!v19)
      {
        LOBYTE(__dst) = 0;
        p_serializedOutdoorEstimatorLogEntry = &v5->_serializedOutdoorEstimatorLogEntry;
        if ((*((char *)&v5->_serializedOutdoorEstimatorLogEntry.__r_.__value_.var0.var1 + 23) & 0x80000000) == 0)
        {
LABEL_6:
          v23 = __dst;
          *((_QWORD *)&p_serializedOutdoorEstimatorLogEntry->__r_.__value_.var0.var1 + 2) = v29;
          *(_OWORD *)p_serializedOutdoorEstimatorLogEntry->__r_.__value_.var0.var0.__data_ = v23;
          v24 = v5;

          goto LABEL_7;
        }
LABEL_12:
        operator delete(p_serializedOutdoorEstimatorLogEntry->__r_.__value_.var0.var1.__data_);
        goto LABEL_6;
      }
    }
    memmove(p_dst, v14, v20);
    *((_BYTE *)p_dst + v20) = 0;
    p_serializedOutdoorEstimatorLogEntry = &v5->_serializedOutdoorEstimatorLogEntry;
    if ((*((char *)&v5->_serializedOutdoorEstimatorLogEntry.__r_.__value_.var0.var1 + 23) & 0x80000000) == 0)
      goto LABEL_6;
    goto LABEL_12;
  }
LABEL_7:

  return v5;
}

- (basic_string<char,)serializedOutdoorEstimatorLogEntry
{
  basic_string<char, std::char_traits<char>, std::allocator<char>> *result;

  if (*((char *)&result->__r_.var1 + 3) < 0)
    return (basic_string<char, std::char_traits<char>, std::allocator<char>> *)sub_21646B1E4(retstr, (void *)result->__r_.__value_.var0.var1.__size_, *((_QWORD *)&result->__r_.__value_.var0.var1+ 2));
  *(_OWORD *)retstr->__r_.__value_.var0.var0.__data_ = *(_OWORD *)&result->__r_.__value_.var0.var1.__size_;
  *((_QWORD *)&retstr->__r_.__value_.var0.var1 + 2) = *(_QWORD *)&result->__r_.var0;
  return result;
}

@end
