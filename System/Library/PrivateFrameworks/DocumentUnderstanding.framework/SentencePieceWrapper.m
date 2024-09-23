@implementation SentencePieceWrapper

- (SentencePieceWrapper)init
{
  sentencepiece::SentencePieceProcessor *v3;

  v3 = (sentencepiece::SentencePieceProcessor *)operator new();
  sentencepiece::SentencePieceProcessor::SentencePieceProcessor(v3);
  self->sp = v3;
  return self;
}

- (BOOL)load:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  uint64_t v8;
  void *__p;
  char v10;
  uint8_t buf[24];
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v4 = objc_retainAutorelease(a3);
  std::string::basic_string[abi:ne180100]<0>(&__p, (char *)objc_msgSend(v4, "cStringUsingEncoding:", 4));
  (*(void (**)(uint64_t *__return_ptr))(*(_QWORD *)self->sp + 16))(&v8);
  if (sentencepiece::util::Status::error_message((sentencepiece::util::Status *)&v8)
    && *sentencepiece::util::Status::error_message((sentencepiece::util::Status *)&v8)
    && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
  {
    v5 = sentencepiece::util::Status::error_message((sentencepiece::util::Status *)&v8);
    -[SentencePieceWrapper load:].cold.1((uint64_t)v4, (uint64_t)v5, buf);
  }
  v6 = v8;
  sentencepiece::util::Status::~Status((sentencepiece::util::Status *)&v8);
  if (v10 < 0)
    operator delete(__p);

  return v6 == 0;
}

- (id)encode:(id)a3
{
  id v4;
  const char *v5;
  const char *v6;
  size_t v7;
  void *v8;
  unsigned int *v9;
  unsigned int *v10;
  void *v11;
  uint64_t v13;
  void *__p;
  unsigned int *v15;
  uint64_t v16;

  __p = 0;
  v15 = 0;
  v16 = 0;
  v4 = objc_retainAutorelease(a3);
  v5 = (const char *)objc_msgSend(v4, "cStringUsingEncoding:", 4);
  v6 = v5;
  if (v5)
  {
    v7 = strlen(v5);
    (*(void (**)(uint64_t *__return_ptr, void *, const char *, size_t, void **))(*(_QWORD *)self->sp + 144))(&v13, self->sp, v6, v7, &__p);
    sentencepiece::util::Status::~Status((sentencepiece::util::Status *)&v13);
    v8 = (void *)objc_opt_new();
    v9 = (unsigned int *)__p;
    v10 = v15;
    if (__p != v15)
    {
      do
      {
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", *v9);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "addObject:", v11);

        ++v9;
      }
      while (v9 != v10);
    }
    if (__p)
    {
      v15 = (unsigned int *)__p;
      operator delete(__p);
    }
  }
  else
  {
    v8 = (void *)MEMORY[0x24BDBD1A8];
  }

  return v8;
}

- (id)encodingAndUTF8Spans:(const char *)a3
{
  void *sp;
  size_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t i;
  void *v12;
  void *v13;
  unsigned int v14;
  int v15;
  void *v16;
  void *v17;
  id v19;
  void *__p[3];
  uint64_t v21;
  _BYTE v22[32];

  if (a3)
  {
    sentencepiece::ImmutableSentencePieceText::ImmutableSentencePieceText((sentencepiece::ImmutableSentencePieceText *)v22);
    sp = self->sp;
    v6 = strlen(a3);
    v7 = sentencepiece::ImmutableSentencePieceText::mutable_proto((sentencepiece::ImmutableSentencePieceText *)v22);
    (*(void (**)(void **__return_ptr, void *, const char *, size_t, uint64_t))(*(_QWORD *)sp + 232))(__p, sp, a3, v6, v7);
    DocumentUnderstanding_ClientInterface_StructuredEntity.unknownFields.modify(__p);
    sentencepiece::util::Status::~Status((sentencepiece::util::Status *)__p);
    v8 = sentencepiece::ImmutableSentencePieceText::pieces_size((sentencepiece::ImmutableSentencePieceText *)v22);
    v9 = (void *)objc_opt_new();
    v10 = (void *)objc_opt_new();
    if (v8)
    {
      for (i = 0; i != v8; ++i)
      {
        sentencepiece::ImmutableSentencePieceText::pieces((sentencepiece::ImmutableSentencePieceText *)v22, __p);
        v21 = *((_QWORD *)__p[0] + i);
        __p[1] = __p[0];
        operator delete(__p[0]);
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", sentencepiece::ImmutableSentencePieceText_ImmutableSentencePiece::id((sentencepiece::ImmutableSentencePieceText_ImmutableSentencePiece *)&v21));
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "addObject:", v12);

        v13 = (void *)MEMORY[0x24BDD1968];
        v14 = sentencepiece::ImmutableSentencePieceText_ImmutableSentencePiece::begin((sentencepiece::ImmutableSentencePieceText_ImmutableSentencePiece *)&v21);
        v15 = sentencepiece::ImmutableSentencePieceText_ImmutableSentencePiece::end((sentencepiece::ImmutableSentencePieceText_ImmutableSentencePiece *)&v21);
        objc_msgSend(v13, "valueWithRange:", v14, v15- sentencepiece::ImmutableSentencePieceText_ImmutableSentencePiece::begin((sentencepiece::ImmutableSentencePieceText_ImmutableSentencePiece *)&v21));
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "addObject:", v16);

      }
    }
    v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE7A648]), "initWithFirst:second:", v9, v10);

    sentencepiece::ImmutableSentencePieceText::~ImmutableSentencePieceText((sentencepiece::ImmutableSentencePieceText *)v22);
    return v17;
  }
  else
  {
    v19 = objc_alloc(MEMORY[0x24BE7A648]);
    return (id)objc_msgSend(v19, "initWithFirst:second:", MEMORY[0x24BDBD1A8], MEMORY[0x24BDBD1A8]);
  }
}

- (id)decode:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  int v8;
  int v9;
  char *v10;
  char *v11;
  char *v12;
  uint64_t v13;
  unint64_t v14;
  uint64_t v15;
  unint64_t v16;
  char *v17;
  char *v18;
  int v19;
  void **v20;
  void *v21;
  uint64_t v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  void *v28[2];
  uint64_t v29;
  void *__p;
  char *v31;
  char *v32;
  _BYTE v33[128];
  uint64_t v34;

  v34 = *MEMORY[0x24BDAC8D0];
  __p = 0;
  v31 = 0;
  v32 = 0;
  v28[0] = 0;
  v28[1] = 0;
  v29 = 0;
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v4 = a3;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v24, v33, 16);
  if (v5)
  {
    v6 = *(_QWORD *)v25;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v25 != v6)
          objc_enumerationMutation(v4);
        v8 = objc_msgSend(*(id *)(*((_QWORD *)&v24 + 1) + 8 * i), "intValue");
        v9 = v8;
        v10 = v31;
        if (v31 >= v32)
        {
          v12 = (char *)__p;
          v13 = (v31 - (_BYTE *)__p) >> 2;
          v14 = v13 + 1;
          if ((unint64_t)(v13 + 1) >> 62)
            std::vector<int>::__throw_length_error[abi:ne180100]();
          v15 = v32 - (_BYTE *)__p;
          if ((v32 - (_BYTE *)__p) >> 1 > v14)
            v14 = v15 >> 1;
          if ((unint64_t)v15 >= 0x7FFFFFFFFFFFFFFCLL)
            v16 = 0x3FFFFFFFFFFFFFFFLL;
          else
            v16 = v14;
          if (v16)
          {
            v17 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<int>>((uint64_t)&v32, v16);
            v12 = (char *)__p;
            v10 = v31;
          }
          else
          {
            v17 = 0;
          }
          v18 = &v17[4 * v13];
          *(_DWORD *)v18 = v9;
          v11 = v18 + 4;
          while (v10 != v12)
          {
            v19 = *((_DWORD *)v10 - 1);
            v10 -= 4;
            *((_DWORD *)v18 - 1) = v19;
            v18 -= 4;
          }
          __p = v18;
          v31 = v11;
          v32 = &v17[4 * v16];
          if (v12)
            operator delete(v12);
        }
        else
        {
          *(_DWORD *)v31 = v8;
          v11 = v10 + 4;
        }
        v31 = v11;
      }
      v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v24, v33, 16);
    }
    while (v5);
  }

  (*(void (**)(uint64_t *__return_ptr, void *, void **, void **))(*(_QWORD *)self->sp + 168))(&v23, self->sp, &__p, v28);
  sentencepiece::util::Status::~Status((sentencepiece::util::Status *)&v23);
  if (v29 >= 0)
    v20 = v28;
  else
    v20 = (void **)v28[0];
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  if (SHIBYTE(v29) < 0)
    operator delete(v28[0]);
  if (__p)
  {
    v31 = (char *)__p;
    operator delete(__p);
  }

  return v21;
}

- (void)load:(uint8_t *)buf .cold.1(uint64_t a1, uint64_t a2, uint8_t *buf)
{
  *(_DWORD *)buf = 138412546;
  *(_QWORD *)(buf + 4) = a1;
  *((_WORD *)buf + 6) = 2080;
  *(_QWORD *)(buf + 14) = a2;
  _os_log_error_impl(&dword_2282CC000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "SentencePieceWrapper: error loading %@ file: %s", buf, 0x16u);
}

@end
