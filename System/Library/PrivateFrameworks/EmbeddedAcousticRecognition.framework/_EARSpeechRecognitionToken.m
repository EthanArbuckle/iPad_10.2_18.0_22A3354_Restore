@implementation _EARSpeechRecognitionToken

- (unint64_t)hash
{
  void *v2;
  unint64_t v3;

  -[_EARSpeechRecognitionToken tokenName](self, "tokenName");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hash");

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  unsigned __int8 *v4;
  char v5;

  v4 = (unsigned __int8 *)a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v5 = quasar::Token::operator==((unsigned __int8 *)&self->_quasarToken, v4 + 8);
  else
    v5 = 0;

  return v5;
}

- (_EARSpeechRecognitionToken)initWithTokenName:(id)a3 start:(double)a4 end:(double)a5 silenceStart:(double)a6 confidence:(double)a7 hasSpaceAfter:(BOOL)a8 hasSpaceBefore:(BOOL)a9 phoneSequence:(id)a10 ipaPhoneSequence:(id)a11
{
  return -[_EARSpeechRecognitionToken initWithTokenName:start:end:silenceStart:confidence:hasSpaceAfter:hasSpaceBefore:phoneSequence:ipaPhoneSequence:appendedAutoPunctuation:](self, "initWithTokenName:start:end:silenceStart:confidence:hasSpaceAfter:hasSpaceBefore:phoneSequence:ipaPhoneSequence:appendedAutoPunctuation:", a3, a8, a9, a10, a11, 0, a4, a5, a6, a7);
}

- (_EARSpeechRecognitionToken)initWithTokenName:(id)a3 start:(double)a4 end:(double)a5 silenceStart:(double)a6 confidence:(double)a7 hasSpaceAfter:(BOOL)a8 hasSpaceBefore:(BOOL)a9 phoneSequence:(id)a10 ipaPhoneSequence:(id)a11 appendedAutoPunctuation:(BOOL)a12
{
  id v22;
  id v23;
  id v24;
  float v25;
  _EARSpeechRecognitionToken *v26;
  void *__p[2];
  char v29;
  __int128 *v30[3];
  __int128 v31;
  uint64_t v32;
  __int128 v33;
  uint64_t v34;
  __int128 v35;
  uint64_t v36;
  std::string v37[2];
  void *v38;
  char v39;
  uint64_t v40;
  void *v41;
  char v42;
  uint64_t v43;
  void *v44;
  char v45;
  void *v46;
  char v47;

  v22 = a3;
  v23 = a10;
  v24 = a11;
  if (v22)
  {
    objc_msgSend(v22, "ear_toString");
    if (v23)
      goto LABEL_3;
LABEL_6:
    v33 = 0uLL;
    v34 = 0;
    if (v24)
      goto LABEL_4;
    goto LABEL_7;
  }
  v35 = 0uLL;
  v36 = 0;
  if (!v23)
    goto LABEL_6;
LABEL_3:
  objc_msgSend(v23, "ear_toString");
  if (v24)
  {
LABEL_4:
    objc_msgSend(v24, "ear_toString");
    goto LABEL_8;
  }
LABEL_7:
  v31 = 0uLL;
  v32 = 0;
LABEL_8:
  memset(v30, 0, sizeof(v30));
  std::string::basic_string[abi:ne180100]<0>(__p, "");
  v25 = a7;
  quasar::Token::Token(v37, &v35, (a4 * 1000.0), (a5 * 1000.0), (a6 * 1000.0), a8, a9, &v33, v25, &v31, v30, a12, (__int128 *)__p, 0, 0);
  if (v29 < 0)
    operator delete(__p[0]);
  __p[0] = v30;
  std::vector<quasar::TextTokenizer::Token>::__destroy_vector::operator()[abi:ne180100]((void ***)__p);
  if (SHIBYTE(v32) < 0)
    operator delete((void *)v31);
  if (SHIBYTE(v34) < 0)
    operator delete((void *)v33);
  if (SHIBYTE(v36) < 0)
    operator delete((void *)v35);
  v26 = (_EARSpeechRecognitionToken *)-[_EARSpeechRecognitionToken _initWithQuasarToken:](self, "_initWithQuasarToken:", v37);
  if (v47 < 0)
    operator delete(v46);
  if (v45 < 0)
    operator delete(v44);
  *(_QWORD *)&v33 = &v43;
  std::vector<quasar::TextTokenizer::Token>::__destroy_vector::operator()[abi:ne180100]((void ***)&v33);
  if (v42 < 0)
    operator delete(v41);
  *(_QWORD *)&v33 = &v40;
  std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)&v33);
  if (v39 < 0)
    operator delete(v38);
  if (SHIBYTE(v37[0].__r_.__value_.__r.__words[2]) < 0)
    operator delete(v37[0].__r_.__value_.__l.__data_);

  return v26;
}

- (id)_initWithQuasarToken:(const void *)a3
{
  _EARSpeechRecognitionToken *v4;
  _EARSpeechRecognitionToken *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)_EARSpeechRecognitionToken;
  v4 = -[_EARSpeechRecognitionToken init](&v7, sel_init);
  v5 = v4;
  if (v4)
    quasar::Token::operator=((uint64_t)&v4->_quasarToken, (uint64_t)a3);
  return v5;
}

- (NSString)tokenName
{
  Token *data;
  unint64_t size;

  if (*((char *)&self->_quasarToken.tokenName.__r_.__value_.var0.var1 + 23) < 0)
  {
    data = (Token *)self->_quasarToken.tokenName.__r_.__value_.var0.var1.__data_;
    size = self->_quasarToken.tokenName.__r_.__value_.var0.var1.__size_;
  }
  else
  {
    data = &self->_quasarToken;
    size = *((unsigned __int8 *)&self->_quasarToken.tokenName.__r_.__value_.var0.var1 + 23);
  }
  return (NSString *)objc_msgSend(MEMORY[0x1E0CB3940], "ear_stringWithStringView:", data, size);
}

- (double)start
{
  unint64_t v2;

  LODWORD(v2) = *(_DWORD *)&self->_quasarToken.tokenName.__r_.var1;
  return (double)v2 * 0.001;
}

- (double)end
{
  unint64_t v2;

  LODWORD(v2) = self->_quasarToken.tokenName.var0;
  return (double)v2 * 0.001;
}

- (double)silenceStart
{
  unint64_t v2;

  LODWORD(v2) = HIDWORD(self->_quasarToken.tokenName.var0);
  return (double)v2 * 0.001;
}

- (double)confidence
{
  return *(float *)&self[1].super.isa;
}

- (BOOL)hasSpaceAfter
{
  return BYTE4(self[1].super.isa);
}

- (BOOL)hasSpaceBefore
{
  return BYTE5(self[1].super.isa);
}

- (NSString)phoneSequence
{
  char *data;
  unint64_t size;

  if (*((char *)&self[1]._quasarToken.tokenName.__r_.__value_.var0.var1 + 23) < 0)
  {
    data = self[1]._quasarToken.tokenName.__r_.__value_.var0.var1.__data_;
    size = self[1]._quasarToken.tokenName.__r_.__value_.var0.var1.__size_;
  }
  else
  {
    data = self[1]._quasarToken.tokenName.__r_.__value_.var0.var0.__data_;
    size = *((unsigned __int8 *)&self[1]._quasarToken.tokenName.__r_.__value_.var0.var1 + 23);
  }
  return (NSString *)objc_msgSend(MEMORY[0x1E0CB3940], "ear_stringWithStringView:", data, size);
}

- (NSString)ipaPhoneSequence
{
  char *data;
  unint64_t size;

  if (*((char *)&self[2]._quasarToken.tokenName.__r_.__value_.var0.var1 + 23) < 0)
  {
    data = self[2]._quasarToken.tokenName.__r_.__value_.var0.var1.__data_;
    size = self[2]._quasarToken.tokenName.__r_.__value_.var0.var1.__size_;
  }
  else
  {
    data = self[2]._quasarToken.tokenName.__r_.__value_.var0.var0.__data_;
    size = *((unsigned __int8 *)&self[2]._quasarToken.tokenName.__r_.__value_.var0.var1 + 23);
  }
  return (NSString *)objc_msgSend(MEMORY[0x1E0CB3940], "ear_stringWithStringView:", data, size);
}

- (BOOL)appendedAutoPunctuation
{
  return self[3]._quasarToken.tokenName.__r_.var1;
}

- (BOOL)prependedAutoPunctuation
{
  return HIBYTE(self[3]._quasarToken.tokenName.__r_.var1);
}

- (BOOL)isModifiedByAutoPunctuation
{
  return self[4]._quasarToken.tokenName.__r_.__value_.var0.var0.__data_[8];
}

- (double)graphCost
{
  return *((float *)&self[4]._quasarToken.tokenName.__r_.__value_.var0.var1.__size_ + 1);
}

- (double)acousticCost
{
  return *((float *)&self[4]._quasarToken.tokenName.__r_.__value_.var0.var1 + 4);
}

- (id)description
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  _BOOL8 v13;
  _BOOL8 v14;
  void *v15;
  void *v16;
  _BOOL8 v17;
  _BOOL8 v18;
  _BOOL8 v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  objc_super v25;

  v25.receiver = self;
  v25.super_class = (Class)_EARSpeechRecognitionToken;
  -[_EARSpeechRecognitionToken description](&v25, sel_description);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[_EARSpeechRecognitionToken tokenName](self, "tokenName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[_EARSpeechRecognitionToken start](self, "start");
  v6 = v5;
  -[_EARSpeechRecognitionToken silenceStart](self, "silenceStart");
  v8 = v7;
  -[_EARSpeechRecognitionToken end](self, "end");
  v10 = v9;
  -[_EARSpeechRecognitionToken confidence](self, "confidence");
  v12 = v11;
  v13 = -[_EARSpeechRecognitionToken hasSpaceAfter](self, "hasSpaceAfter");
  v14 = -[_EARSpeechRecognitionToken hasSpaceBefore](self, "hasSpaceBefore");
  -[_EARSpeechRecognitionToken phoneSequence](self, "phoneSequence");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[_EARSpeechRecognitionToken ipaPhoneSequence](self, "ipaPhoneSequence");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = -[_EARSpeechRecognitionToken appendedAutoPunctuation](self, "appendedAutoPunctuation");
  v18 = -[_EARSpeechRecognitionToken prependedAutoPunctuation](self, "prependedAutoPunctuation");
  v19 = -[_EARSpeechRecognitionToken isModifiedByAutoPunctuation](self, "isModifiedByAutoPunctuation");
  -[_EARSpeechRecognitionToken graphCost](self, "graphCost");
  v21 = v20;
  -[_EARSpeechRecognitionToken acousticCost](self, "acousticCost");
  objc_msgSend(v3, "stringByAppendingFormat:", CFSTR(" tokenName=%@, start=%f, silenceStart=%f, end=%f, confidence=%f, hasSpaceAfter=%d, hasSpaceBefore=%d, phoneSeq=%@, ipaPhoneSeq=%@, appendedAutoPunctuation=%d, prependedAutoPunctuation=%d, isModifiedByAutoPunctuation=%d, graphCost=%f, acousticCost=%f"), v4, v6, v8, v10, v12, v13, v14, v15, v16, v17, v18, v19, v21, v22);
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  return v23;
}

- (Token)quasarToken
{
  uint64_t v1;

  return (Token *)quasar::Token::Token((std::string *)retstr, (const quasar::Token *)(v1 + 8));
}

- (void).cxx_destruct
{
  quasar::Token::~Token((void **)&self->_quasarToken);
}

- (id).cxx_construct
{
  quasar::Token::Token((quasar::Token *)&self->_quasarToken);
  return self;
}

@end
