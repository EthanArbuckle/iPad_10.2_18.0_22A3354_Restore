@implementation CSUCLIPV3Embedding

- (CSUCLIPV3Embedding)initWithBuffer:(id)a3 type:(int64_t)a4 revision:(int64_t)a5
{
  id v9;
  CSUCLIPV3Embedding *v10;
  CSUCLIPV3Embedding *v11;
  CSUCLIPV3Embedding *v12;
  objc_super v14;

  v9 = a3;
  v14.receiver = self;
  v14.super_class = (Class)CSUCLIPV3Embedding;
  v10 = -[CSUCLIPV3Embedding init](&v14, sel_init);
  v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_buffer, a3);
    v11->_type = a4;
    v11->_revision = a5;
    v12 = v11;
  }

  return v11;
}

+ (id)embeddingWithBuffer:(id)a3 type:(int64_t)a4 revision:(int64_t)a5
{
  id v7;
  CSUCLIPV3Embedding *v8;
  const char *v9;
  void *v10;

  v7 = a3;
  v8 = [CSUCLIPV3Embedding alloc];
  v10 = (void *)objc_msgSend_initWithBuffer_type_revision_(v8, v9, (uint64_t)v7, a4, a5);

  return v10;
}

- (BOOL)isCompatibleWith:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;

  v4 = a3;
  v9 = objc_msgSend_revision(v4, v5, v6, v7, v8);
  LOBYTE(self) = v9 == objc_msgSend_revision(self, v10, v11, v12, v13);

  return (char)self;
}

- (CSUBuffer)buffer
{
  return (CSUBuffer *)objc_getProperty(self, a2, 8, 1);
}

- (int64_t)type
{
  return self->_type;
}

- (int64_t)revision
{
  return self->_revision;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_buffer, 0);
}

@end
