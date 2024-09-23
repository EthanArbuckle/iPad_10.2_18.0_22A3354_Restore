@implementation CLVisionNotification

- (CLVisionNotification)initWithARSessionState:(unint64_t)a3
{
  CLVisionNotification *v4;
  CLVisionNotification *v5;
  CLVisionNotification *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)CLVisionNotification;
  v4 = -[CLVisionNotification init](&v8, sel_init);
  v5 = v4;
  if (v4)
  {
    v4->_arSessionState = a3;
    v4->_notificationType = 0;
    v6 = v4;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  const char *v4;
  uint64_t v5;
  const char *v6;
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  void *v10;
  const char *v11;
  uint64_t v12;
  const char *v13;
  uint64_t v14;
  void *v15;
  const char *v16;
  uint64_t v17;
  id v18;

  v18 = a3;
  objc_msgSend_encodeInt_forKey_(v18, v4, LODWORD(self->_arSessionState), (uint64_t)CFSTR("arSessionState"), v5);
  objc_msgSend_encodeInt_forKey_(v18, v6, self->_notificationType, (uint64_t)CFSTR("notificationType"), v7);
  if (*((char *)&self->_serializedVIOEstimation.__r_.__value_.var0.var1 + 23) < 0)
    objc_msgSend_dataWithBytes_length_(MEMORY[0x24BDBCE50], v8, (uint64_t)self->_serializedVIOEstimation.__r_.__value_.var0.var1.__data_, self->_serializedVIOEstimation.__r_.__value_.var0.var1.__size_, v9);
  else
    objc_msgSend_dataWithBytes_length_(MEMORY[0x24BDBCE50], v8, (uint64_t)&self->_serializedVIOEstimation, *((unsigned __int8 *)&self->_serializedVIOEstimation.__r_.__value_.var0.var1 + 23), v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v18, v11, (uint64_t)v10, (uint64_t)CFSTR("vioEstimation"), v12);

  if (self->_serializedVLLocalizationResult.__r_.__value_.var0.var0.__data_[7] < 0)
    objc_msgSend_dataWithBytes_length_(MEMORY[0x24BDBCE50], v13, *(_QWORD *)&self->_serializedVIOEstimation.__r_.var0, self->_serializedVIOEstimation.var0, v14);
  else
    objc_msgSend_dataWithBytes_length_(MEMORY[0x24BDBCE50], v13, (uint64_t)&self->_serializedVIOEstimation.__r_.var0, self->_serializedVLLocalizationResult.__r_.__value_.var0.var0.__data_[7], v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v18, v16, (uint64_t)v15, (uint64_t)CFSTR("vlLocalizationResult"), v17);

}

- (void).cxx_destruct
{
  if ((self->_serializedVLLocalizationResult.__r_.__value_.var0.var0.__data_[7] & 0x80000000) == 0)
  {
    if ((*((char *)&self->_serializedVIOEstimation.__r_.__value_.var0.var1 + 23) & 0x80000000) == 0)
      return;
LABEL_5:
    operator delete(self->_serializedVIOEstimation.__r_.__value_.var0.var1.__data_);
    return;
  }
  operator delete(*(void **)&self->_serializedVIOEstimation.__r_.var0);
  if (*((char *)&self->_serializedVIOEstimation.__r_.__value_.var0.var1 + 23) < 0)
    goto LABEL_5;
}

- (id).cxx_construct
{
  *(_OWORD *)((char *)self + 56) = 0u;
  *(_OWORD *)((char *)self + 40) = 0u;
  *(_OWORD *)((char *)self + 24) = 0u;
  return self;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CLVisionNotification)init
{
  uint64_t v2;
  uint64_t v3;

  objc_msgSend_doesNotRecognizeSelector_(self, a2, (uint64_t)a2, v2, v3);

  return 0;
}

- (CLVisionNotification)initWithSerializedVIOEstimation:()basic_string<char
{
  id v4;
  CLVisionNotification *v5;
  CLVisionNotification *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)CLVisionNotification;
  v4 = -[CLVisionNotification init](&v8, sel_init);
  v5 = (CLVisionNotification *)v4;
  if (v4)
  {
    std::string::operator=((std::string *)v4 + 1, (const std::string *)a3);
    v5->_notificationType = 1;
    v6 = v5;
  }

  return v5;
}

- (CLVisionNotification)initWithSerializedVLLocalizationResult:()basic_string<char
{
  id v4;
  CLVisionNotification *v5;
  CLVisionNotification *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)CLVisionNotification;
  v4 = -[CLVisionNotification init](&v8, sel_init);
  v5 = (CLVisionNotification *)v4;
  if (v4)
  {
    std::string::operator=((std::string *)v4 + 2, (const std::string *)a3);
    v5->_notificationType = 2;
    v6 = v5;
  }

  return v5;
}

- (CLVisionNotification)initWithCoder:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  CLVisionNotification *v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  const char *v13;
  uint64_t v14;
  id v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  const void *v20;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  unint64_t v25;
  size_t v26;
  __int128 *p_dst;
  basic_string<char, std::char_traits<char>, std::allocator<char>> *p_serializedVIOEstimation;
  uint64_t v29;
  const char *v30;
  uint64_t v31;
  void *v32;
  id v33;
  const char *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  const void *v38;
  const char *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  unint64_t v43;
  size_t v44;
  __int128 *v45;
  int *p_var0;
  CLVisionNotification *v47;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  __int128 __dst;
  unint64_t v54;
  objc_super v55;

  v4 = a3;
  v55.receiver = self;
  v55.super_class = (Class)CLVisionNotification;
  v8 = -[CLVisionNotification init](&v55, sel_init);
  if (v8)
  {
    v8->_arSessionState = (int)objc_msgSend_decodeIntForKey_(v4, v5, (uint64_t)CFSTR("arSessionState"), v6, v7);
    v8->_notificationType = objc_msgSend_decodeIntForKey_(v4, v9, (uint64_t)CFSTR("notificationType"), v10, v11);
    v12 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v13, v12, (uint64_t)CFSTR("vioEstimation"), v14);
    v15 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v20 = (const void *)objc_msgSend_bytes(v15, v16, v17, v18, v19);
    v25 = objc_msgSend_length(v15, v21, v22, v23, v24);
    v26 = v25;
    if (v25 > 0x7FFFFFFFFFFFFFF7)
      sub_21646B134();
    if (v25 >= 0x17)
    {
      v49 = (v25 & 0xFFFFFFFFFFFFFFF8) + 8;
      if ((v25 | 7) != 0x17)
        v49 = v25 | 7;
      v50 = v49 + 1;
      p_dst = (__int128 *)operator new(v49 + 1);
      *((_QWORD *)&__dst + 1) = v26;
      v54 = v50 | 0x8000000000000000;
      *(_QWORD *)&__dst = p_dst;
    }
    else
    {
      HIBYTE(v54) = v25;
      p_dst = &__dst;
      if (!v25)
      {
        LOBYTE(__dst) = 0;
        p_serializedVIOEstimation = &v8->_serializedVIOEstimation;
        if ((*((char *)&v8->_serializedVIOEstimation.__r_.__value_.var0.var1 + 23) & 0x80000000) == 0)
          goto LABEL_6;
LABEL_16:
        operator delete(p_serializedVIOEstimation->__r_.__value_.var0.var1.__data_);
LABEL_6:
        *(_OWORD *)p_serializedVIOEstimation->__r_.__value_.var0.var0.__data_ = __dst;
        *((_QWORD *)&p_serializedVIOEstimation->__r_.__value_.var0.var1 + 2) = v54;
        v29 = objc_opt_class();
        objc_msgSend_decodeObjectOfClass_forKey_(v4, v30, v29, (uint64_t)CFSTR("vlLocalizationResult"), v31);
        v32 = (void *)objc_claimAutoreleasedReturnValue();

        v33 = objc_retainAutorelease(v32);
        v38 = (const void *)objc_msgSend_bytes(v33, v34, v35, v36, v37);
        v43 = objc_msgSend_length(v33, v39, v40, v41, v42);
        v44 = v43;
        if (v43 > 0x7FFFFFFFFFFFFFF7)
          sub_21646B134();
        if (v43 >= 0x17)
        {
          v51 = (v43 & 0xFFFFFFFFFFFFFFF8) + 8;
          if ((v43 | 7) != 0x17)
            v51 = v43 | 7;
          v52 = v51 + 1;
          v45 = (__int128 *)operator new(v51 + 1);
          *((_QWORD *)&__dst + 1) = v44;
          v54 = v52 | 0x8000000000000000;
          *(_QWORD *)&__dst = v45;
        }
        else
        {
          HIBYTE(v54) = v43;
          v45 = &__dst;
          if (!v43)
          {
            LOBYTE(__dst) = 0;
            p_var0 = &v8->_serializedVIOEstimation.__r_.var0;
            if ((v8->_serializedVLLocalizationResult.__r_.__value_.var0.var0.__data_[7] & 0x80000000) == 0)
            {
LABEL_10:
              *(_OWORD *)p_var0 = __dst;
              *((_QWORD *)p_var0 + 2) = v54;
              v47 = v8;

              goto LABEL_11;
            }
LABEL_21:
            operator delete(*(void **)p_var0);
            goto LABEL_10;
          }
        }
        memmove(v45, v38, v44);
        *((_BYTE *)v45 + v44) = 0;
        p_var0 = &v8->_serializedVIOEstimation.__r_.var0;
        if ((v8->_serializedVLLocalizationResult.__r_.__value_.var0.var0.__data_[7] & 0x80000000) == 0)
          goto LABEL_10;
        goto LABEL_21;
      }
    }
    memmove(p_dst, v20, v26);
    *((_BYTE *)p_dst + v26) = 0;
    p_serializedVIOEstimation = &v8->_serializedVIOEstimation;
    if ((*((char *)&v8->_serializedVIOEstimation.__r_.__value_.var0.var1 + 23) & 0x80000000) == 0)
      goto LABEL_6;
    goto LABEL_16;
  }
LABEL_11:

  return v8;
}

- (unint64_t)arSessionState
{
  return self->_arSessionState;
}

- (int)notificationType
{
  return self->_notificationType;
}

- (basic_string<char,)serializedVIOEstimation
{
  basic_string<char, std::char_traits<char>, std::allocator<char>> *result;

  if (result[1].__r_.__value_.var0.var0.__data_[7] < 0)
    return (basic_string<char, std::char_traits<char>, std::allocator<char>> *)sub_21646B1E4(retstr, *(void **)&result->__r_.var0, result->var0);
  *(_OWORD *)retstr->__r_.__value_.var0.var0.__data_ = *(_OWORD *)&result->__r_.var0;
  *((_QWORD *)&retstr->__r_.__value_.var0.var1 + 2) = result[1].__r_.__value_.var0.var1.__data_;
  return result;
}

- (basic_string<char,)serializedVLLocalizationResult
{
  basic_string<char, std::char_traits<char>, std::allocator<char>> *result;

  if (*((char *)&result[1].__r_.var1 + 3) < 0)
    return (basic_string<char, std::char_traits<char>, std::allocator<char>> *)sub_21646B1E4(retstr, (void *)result[1].__r_.__value_.var0.var1.__size_, *((_QWORD *)&result[1].__r_.__value_.var0.var1+ 2));
  *(_OWORD *)retstr->__r_.__value_.var0.var0.__data_ = *(_OWORD *)&result[1].__r_.__value_.var0.var1.__size_;
  *((_QWORD *)&retstr->__r_.__value_.var0.var1 + 2) = *(_QWORD *)&result[1].__r_.var0;
  return result;
}

@end
