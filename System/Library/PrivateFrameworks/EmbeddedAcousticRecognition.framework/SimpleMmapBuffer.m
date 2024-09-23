@implementation SimpleMmapBuffer

- (SimpleMmapBuffer)initWithData:(const void *)a3 ofSize:(unint64_t)a4
{
  SimpleMmapBuffer *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  _BYTE *v11;
  uint64_t v12;
  void **v13;
  int v14;
  const char *v15;
  SimpleMmapBuffer *v16;
  void *__p[2];
  char v19;
  _BYTE v20[16];
  uint64_t v21;
  _BYTE v22[408];
  _BYTE v23[152];
  _QWORD v24[17];
  _BYTE v25[128];
  unint64_t v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v6 = -[SimpleMmapBuffer init](self, "init");
  if (!v6)
  {
LABEL_20:
    v16 = v6;
    goto LABEL_24;
  }
  NSTemporaryDirectory();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "UUIDString");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "stringByAppendingPathComponent:", v9);
  v10 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  std::string::basic_string[abi:ne180100]<0>(__p, (char *)objc_msgSend(v10, "UTF8String"));

  std::ofstream::basic_ofstream(&v21);
  if (a3)
  {
    std::ostream::write();
  }
  else
  {
    MEMORY[0x1AF44CB90](v20, &v21);
    v11 = &v22[*(_QWORD *)(v21 - 24) - 8];
    if ((v11[32] & 5) == 0)
    {
      v12 = *((_QWORD *)v11 + 5);
      memset(v25, 0, sizeof(v25));
      v26 = a4;
      (*(void (**)(_QWORD *__return_ptr, uint64_t, _BYTE *, uint64_t))(*(_QWORD *)v12 + 40))(v24, v12, v25, 16);
      if (v24[16] == -1)
        std::ios_base::clear((std::ios_base *)&v22[*(_QWORD *)(v21 - 24) - 8], *(_DWORD *)&v22[*(_QWORD *)(v21 - 24) + 24] | 4);
    }
    MEMORY[0x1AF44CB9C](v20);
    v25[0] = 0;
    std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(&v21, (uint64_t)v25, 1);
  }
  if (!std::filebuf::close())
    std::ios_base::clear((std::ios_base *)&v22[*(_QWORD *)(v21 - 24) - 8], *(_DWORD *)&v22[*(_QWORD *)(v21 - 24) + 24] | 4);
  if (v19 >= 0)
    v13 = __p;
  else
    v13 = (void **)__p[0];
  v14 = open((const char *)v13, 514, 384);
  if ((v14 & 0x80000000) == 0)
  {
    -[SimpleMmapBuffer setDataPointer:](v6, "setDataPointer:", mmap(0, a4, 3, 1, v14, 0));
    close(v14);
    v15 = v19 >= 0 ? (const char *)__p : (const char *)__p[0];
    unlink(v15);
    if (-[SimpleMmapBuffer dataPointer](v6, "dataPointer") != (void *)-1)
    {
      -[SimpleMmapBuffer setSize:](v6, "setSize:", a4);
      v21 = *MEMORY[0x1E0DE4F48];
      *(_QWORD *)&v22[*(_QWORD *)(v21 - 24) - 8] = *(_QWORD *)(MEMORY[0x1E0DE4F48] + 24);
      MEMORY[0x1AF44CA70](v22);
      std::ostream::~ostream();
      MEMORY[0x1AF44D094](v23);
      if (v19 < 0)
        operator delete(__p[0]);
      goto LABEL_20;
    }
  }
  v21 = *MEMORY[0x1E0DE4F48];
  *(_QWORD *)&v22[*(_QWORD *)(v21 - 24) - 8] = *(_QWORD *)(MEMORY[0x1E0DE4F48] + 24);
  MEMORY[0x1AF44CA70](v22);
  std::ostream::~ostream();
  MEMORY[0x1AF44D094](v23);
  if (v19 < 0)
    operator delete(__p[0]);
  v16 = 0;
LABEL_24:

  return v16;
}

- (void)dealloc
{
  objc_super v3;

  if (-[SimpleMmapBuffer dataPointer](self, "dataPointer")
    && -[SimpleMmapBuffer dataPointer](self, "dataPointer") != (void *)-1)
  {
    munmap(-[SimpleMmapBuffer dataPointer](self, "dataPointer"), -[SimpleMmapBuffer size](self, "size"));
  }
  v3.receiver = self;
  v3.super_class = (Class)SimpleMmapBuffer;
  -[SimpleMmapBuffer dealloc](&v3, sel_dealloc);
}

- (unint64_t)size
{
  return self->_size;
}

- (void)setSize:(unint64_t)a3
{
  self->_size = a3;
}

- (void)dataPointer
{
  return self->_dataPointer;
}

- (void)setDataPointer:(void *)a3
{
  self->_dataPointer = a3;
}

@end
