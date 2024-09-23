@implementation VCPTextTokenizerT5

- (VCPTextTokenizerT5)init
{
  VCPTextTokenizerT5 *v2;
  sentencepiece::SentencePieceProcessor *v3;
  double v4;
  SentencePieceProcessor *value;
  void *v6;
  void *v7;
  const __CFString *v8;
  void *v9;
  void *v10;
  SentencePieceProcessor *v11;
  id v12;
  const char *v13;
  size_t v14;
  uint64_t v15;
  VCPTextTokenizerT5 *v16;
  uint64_t v18;
  uint8_t buf[8];
  uint64_t v20;
  objc_super v21;

  v21.receiver = self;
  v21.super_class = (Class)VCPTextTokenizerT5;
  v2 = -[VCPTextTokenizer init](&v21, sel_init);
  if (!v2)
    goto LABEL_15;
  v3 = (sentencepiece::SentencePieceProcessor *)operator new();
  v4 = sentencepiece::SentencePieceProcessor::SentencePieceProcessor(v3);
  value = v2->_processor.__ptr_.__value_;
  v2->_processor.__ptr_.__value_ = (SentencePieceProcessor *)v3;
  if (value)
    (*(void (**)(SentencePieceProcessor *, double))(*(_QWORD *)value + 8))(value, v4);
  objc_msgSend(MEMORY[0x1E0CB34D0], "vcp_mediaAnalysisBundle", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "resourceURL");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (+[VCPVideoTransformerBackbone revision](VCPVideoTransformerBackbone, "revision") == 4
    || +[VCPVideoTransformerBackbone revision](VCPVideoTransformerBackbone, "revision") == 5)
  {
    v8 = CFSTR("omnie_t0_50k.model");
  }
  else
  {
    v8 = CFSTR("t5_base.model");
  }
  objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:relativeToURL:", v8, v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "path");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = v2->_processor.__ptr_.__value_;
  v12 = objc_retainAutorelease(v10);
  v13 = (const char *)objc_msgSend(v12, "UTF8String");
  v14 = strlen(v13);
  (*(void (**)(uint64_t *__return_ptr, SentencePieceProcessor *, const char *, size_t))(*(_QWORD *)v11 + 16))(&v20, v11, v13, v14);
  v15 = v20;
  if (v20)
  {
    if ((int)MediaAnalysisLogLevel() >= 3 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "SentencePiece error while loading tokenizer file", buf, 2u);
    }
  }
  else
  {
    (*(void (**)(uint64_t *__return_ptr, SentencePieceProcessor *, const char *, uint64_t))(*(_QWORD *)v2->_processor.__ptr_.__value_ + 96))(&v18, v2->_processor.__ptr_.__value_, "eos", 3);
    sentencepiece::util::Status::~Status((sentencepiece::util::Status *)&v18);
  }
  sentencepiece::util::Status::~Status((sentencepiece::util::Status *)&v20);

  if (v15)
    v16 = 0;
  else
LABEL_15:
    v16 = v2;

  return v16;
}

- (id)encode:(id)a3
{
  id v4;
  void *v5;
  SentencePieceProcessor *value;
  id v7;
  void **v8;
  unint64_t v9;
  void *v10;
  unsigned int *v11;
  unsigned int *i;
  void *v13;
  void *__p[2];
  unsigned __int8 v16;
  uint64_t v17;
  uint8_t buf[8];
  unsigned int *v19;
  uint64_t v20;

  v4 = a3;
  if (objc_msgSend(v4, "hasPrefix:", CFSTR("<s>"))
    && (int)MediaAnalysisLogLevel() >= 3
    && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Input text should not contain BOS token!", buf, 2u);
  }
  objc_msgSend(v4, "lowercaseString");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  *(_QWORD *)buf = 0;
  v19 = 0;
  v20 = 0;
  value = self->_processor.__ptr_.__value_;
  v7 = objc_retainAutorelease(v5);
  std::string::basic_string[abi:ne180100]<0>(__p, (char *)objc_msgSend(v7, "UTF8String"));
  if ((v16 & 0x80u) == 0)
    v8 = __p;
  else
    v8 = (void **)__p[0];
  if ((v16 & 0x80u) == 0)
    v9 = v16;
  else
    v9 = (unint64_t)__p[1];
  (*(void (**)(uint64_t *__return_ptr, SentencePieceProcessor *, void **, unint64_t, uint8_t *))(*(_QWORD *)value + 144))(&v17, value, v8, v9, buf);
  if ((char)v16 < 0)
    operator delete(__p[0]);
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v17)
  {
    v11 = *(unsigned int **)buf;
    for (i = v19; v11 != i; ++v11)
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", *v11);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "addObject:", v13);

    }
  }
  objc_msgSend(v10, "insertObject:atIndex:", &unk_1E6B72A88, 0);
  sentencepiece::util::Status::~Status((sentencepiece::util::Status *)&v17);
  if (*(_QWORD *)buf)
  {
    v19 = *(unsigned int **)buf;
    operator delete(*(void **)buf);
  }

  return v10;
}

- (void).cxx_destruct
{
  SentencePieceProcessor *value;

  value = self->_processor.__ptr_.__value_;
  self->_processor.__ptr_.__value_ = 0;
  if (value)
    (*(void (**)(SentencePieceProcessor *))(*(_QWORD *)value + 8))(value);
}

- (id).cxx_construct
{
  *((_QWORD *)self + 6) = 0;
  return self;
}

@end
