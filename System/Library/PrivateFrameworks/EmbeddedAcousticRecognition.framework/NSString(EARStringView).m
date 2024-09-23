@implementation NSString(EARStringView)

+ (id)ear_stringWithStringView:()EARStringView
{
  return (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithBytes:length:encoding:", a3, a4, 4);
}

- (uint64_t)ear_toString
{
  char *CStringPtr;
  uint64_t result;
  std::string::size_type v6;
  uint64_t *v7;

  CStringPtr = (char *)CFStringGetCStringPtr(a1, 0x8000100u);
  if (CStringPtr)
    return (uint64_t)std::string::basic_string[abi:ne180100]<0>(a2, CStringPtr);
  a2->__r_.__value_.__r.__words[0] = 0;
  a2->__r_.__value_.__l.__size_ = 0;
  a2->__r_.__value_.__r.__words[2] = 0;
  v6 = -[__CFString lengthOfBytesUsingEncoding:](a1, "lengthOfBytesUsingEncoding:", 4);
  std::string::resize(a2, v6, 0);
  if ((a2->__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
    v7 = (uint64_t *)a2;
  else
    v7 = (uint64_t *)a2->__r_.__value_.__r.__words[0];
  result = -[__CFString getCString:maxLength:encoding:](a1, "getCString:maxLength:encoding:", v7, v6 + 1, 4);
  if ((result & 1) == 0)
    return objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99768], CFSTR("Invalid string: %@"), a1);
  return result;
}

- (void)ear_toStringOrNothing
{
  char *CStringPtr;
  std::string::size_type v5;
  std::string::size_type v6;
  std::string *v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  std::string v25;

  CStringPtr = (char *)CFStringGetCStringPtr(a1, 0x8000100u);
  if (CStringPtr)
  {
    std::string::basic_string[abi:ne180100]<0>(&v8, CStringPtr);
    *(_OWORD *)a2 = v8;
    v5 = v9;
LABEL_8:
    *(_QWORD *)(a2 + 16) = v5;
    *(_BYTE *)(a2 + 24) = 1;
    return;
  }
  memset(&v25, 0, sizeof(v25));
  v6 = -[__CFString lengthOfBytesUsingEncoding:](a1, "lengthOfBytesUsingEncoding:", 4);
  std::string::resize(&v25, v6, 0);
  if ((v25.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
    v7 = &v25;
  else
    v7 = (std::string *)v25.__r_.__value_.__r.__words[0];
  if ((-[__CFString getCString:maxLength:encoding:](a1, "getCString:maxLength:encoding:", v7, v6 + 1, 4) & 1) != 0)
  {
    *(_OWORD *)a2 = *(_OWORD *)&v25.__r_.__value_.__l.__data_;
    v5 = v25.__r_.__value_.__r.__words[2];
    goto LABEL_8;
  }
  if (quasar::gLogLevel >= 4)
  {
    v23 = 0u;
    v24 = 0u;
    v21 = 0u;
    v22 = 0u;
    v19 = 0u;
    v20 = 0u;
    v17 = 0u;
    v18 = 0u;
    v15 = 0u;
    v16 = 0u;
    v13 = 0u;
    v14 = 0u;
    v11 = 0u;
    v12 = 0u;
    v9 = 0u;
    v10 = 0u;
    v8 = 0u;
    kaldi::KaldiWarnMessage::KaldiWarnMessage((kaldi::KaldiWarnMessage *)&v8);
    std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(&v8, (uint64_t)"Failed to perform UTF-8 encoding on string: ", 44);
    std::ostream::operator<<();
    quasar::QuasarInfoMessage::~QuasarInfoMessage((quasar::QuasarInfoMessage *)&v8);
  }
  *(_BYTE *)a2 = 0;
  *(_BYTE *)(a2 + 24) = 0;
  if (SHIBYTE(v25.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v25.__r_.__value_.__l.__data_);
}

@end
