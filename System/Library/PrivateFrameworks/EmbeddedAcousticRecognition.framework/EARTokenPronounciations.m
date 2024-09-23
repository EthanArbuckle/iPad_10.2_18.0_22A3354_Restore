@implementation EARTokenPronounciations

- (EARTokenPronounciations)initWithToken:(id)a3 pronunciations:(id)a4
{
  id v6;
  id v7;
  EARTokenPronounciations *v8;
  uint64_t v9;
  NSString *token;
  uint64_t v11;
  NSArray *pronunciations;
  objc_super v14;

  v6 = a3;
  v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)EARTokenPronounciations;
  v8 = -[EARTokenPronounciations init](&v14, sel_init);
  if (v8)
  {
    v9 = objc_msgSend(v6, "copy");
    token = v8->_token;
    v8->_token = (NSString *)v9;

    v11 = objc_msgSend(v7, "copy");
    pronunciations = v8->_pronunciations;
    v8->_pronunciations = (NSArray *)v11;

  }
  return v8;
}

- (TokenProns)_quasarProns
{
  uint64_t v1;
  uint64_t v2;
  id v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  id v8;
  void *v9;
  int *v10;
  std::string *v11;
  __int128 v12;
  int *v13;
  void *v14;
  TokenProns *result;
  TokenProns *v16;
  uint64_t v17[3];
  uint64_t v18[3];
  std::string v19;
  uint64_t v20;
  int *v21;
  unint64_t v22;
  int v23;
  std::string v24;
  int v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  std::string __p;
  void **v31[19];

  v2 = v1;
  v16 = retstr;
  v31[16] = *(void ***)MEMORY[0x1E0C80C00];
  v3 = *(id *)(v1 + 16);
  v21 = 0;
  v22 = 0;
  v20 = 0;
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  v4 = v3;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v26, v31, 16);
  if (!v5)
    goto LABEL_22;
  v6 = *(_QWORD *)v27;
  do
  {
    for (i = 0; i != v5; ++i)
    {
      if (*(_QWORD *)v27 != v6)
        objc_enumerationMutation(v4);
      v8 = *(id *)(*((_QWORD *)&v26 + 1) + 8 * i);
      v9 = v8;
      if (!v8)
      {
        memset(&__p, 0, sizeof(__p));
        v23 = 1;
LABEL_11:
        v24 = __p;
        v25 = 0;
        goto LABEL_12;
      }
      objc_msgSend(v8, "ear_toString", v16);
      v23 = 1;
      if ((SHIBYTE(__p.__r_.__value_.__r.__words[2]) & 0x80000000) == 0)
        goto LABEL_11;
      std::string::__init_copy_ctor_external(&v24, __p.__r_.__value_.__l.__data_, __p.__r_.__value_.__l.__size_);
      v25 = 0;
      if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
        operator delete(__p.__r_.__value_.__l.__data_);
LABEL_12:

      v10 = v21;
      if ((unint64_t)v21 >= v22)
      {
        v13 = (int *)std::vector<quasar::PronChoice>::__push_back_slow_path<quasar::PronChoice>(&v20, (uint64_t)&v23);
      }
      else
      {
        *v21 = v23;
        v11 = (std::string *)(v10 + 2);
        if (SHIBYTE(v24.__r_.__value_.__r.__words[2]) < 0)
        {
          std::string::__init_copy_ctor_external(v11, v24.__r_.__value_.__l.__data_, v24.__r_.__value_.__l.__size_);
        }
        else
        {
          v12 = *(_OWORD *)&v24.__r_.__value_.__l.__data_;
          *((_QWORD *)v10 + 3) = *((_QWORD *)&v24.__r_.__value_.__l + 2);
          *(_OWORD *)&v11->__r_.__value_.__l.__data_ = v12;
        }
        v10[8] = v25;
        v13 = v10 + 10;
      }
      v21 = v13;
      if (SHIBYTE(v24.__r_.__value_.__r.__words[2]) < 0)
        operator delete(v24.__r_.__value_.__l.__data_);

    }
    v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v26, v31, 16);
  }
  while (v5);
LABEL_22:

  v14 = *(void **)(v2 + 8);
  if (v14)
    objc_msgSend(v14, "ear_toString");
  else
    memset(&v19, 0, sizeof(v19));
  memset(v18, 0, sizeof(v18));
  std::vector<quasar::PronChoice>::__init_with_size[abi:ne180100]<quasar::PronChoice*,quasar::PronChoice*>(v18, v20, (uint64_t)v21, 0xCCCCCCCCCCCCCCCDLL * (((uint64_t)v21 - v20) >> 3));
  memset(v17, 0, sizeof(v17));
  quasar::G2P::TokenProns::TokenProns((uint64_t)v16, &v19, v18, v17);
  v31[0] = (void **)v17;
  std::vector<quasar::PronChoice>::__destroy_vector::operator()[abi:ne180100](v31);
  v31[0] = (void **)v18;
  std::vector<quasar::PronChoice>::__destroy_vector::operator()[abi:ne180100](v31);
  if (SHIBYTE(v19.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v19.__r_.__value_.__l.__data_);
  v31[0] = (void **)&v20;
  std::vector<quasar::PronChoice>::__destroy_vector::operator()[abi:ne180100](v31);
  return result;
}

- (NSString)token
{
  return self->_token;
}

- (void)setToken:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSArray)pronunciations
{
  return self->_pronunciations;
}

- (void)setPronunciations:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pronunciations, 0);
  objc_storeStrong((id *)&self->_token, 0);
}

@end
