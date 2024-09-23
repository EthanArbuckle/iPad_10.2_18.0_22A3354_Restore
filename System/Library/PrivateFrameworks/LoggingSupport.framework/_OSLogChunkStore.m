@implementation _OSLogChunkStore

- (NSString)fileName
{
  return self->fileName;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->fileName, 0);
}

- (_OSLogChunkStore)initWithBytes:(const void *)a3 size:(unint64_t)a4
{
  _OSLogChunkStore *v6;
  _OSLogChunkStore *v7;
  NSString *fileName;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)_OSLogChunkStore;
  v6 = -[_OSLogChunkStore init](&v10, sel_init);
  v7 = v6;
  if (v6)
  {
    v6->_ptr = a3;
    v6->_sz = a4;
    fileName = v6->fileName;
    v6->fileName = 0;

  }
  return v7;
}

- (void)setFileName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (void)enumerateChunksInRange:(_NSRange)a3 usingBlock:(id)a4
{
  NSUInteger length;
  NSUInteger location;
  id v7;
  char *v8;
  id v9;
  _QWORD *v10;
  unint64_t v11;
  unint64_t v12;
  _QWORD v13[2];
  BOOL (*v14)(uint64_t, uint64_t);
  void *v15;
  _OSLogChunkStore *v16;
  id v17;

  length = a3.length;
  location = a3.location;
  v7 = a4;
  if (location + length > self->_sz)
  {
    qword_1EE52EA58 = (uint64_t)"BUG IN LIBTRACE: enumerateChunksInRange:options:usingBlock: called with range larger than mapped file";
    qword_1EE52EA88 = location + length;
    __break(1u);
  }
  else
  {
    v8 = (char *)self->_ptr + location;
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v14 = __54___OSLogChunkStore_enumerateChunksInRange_usingBlock___block_invoke;
    v15 = &unk_1E4156A70;
    v16 = self;
    v9 = v7;
    v17 = v9;
    v10 = v13;
    v11 = 0;
    do
    {
      if (length - v11 < 0x10)
        break;
      v12 = *(_QWORD *)&v8[v11 + 8];
      if (length - v11 - 16 < v12)
        break;
      if (!((unsigned int (*)(_QWORD *))v14)(v10))
        break;
      v11 = (v11 + v12 + 23) & 0xFFFFFFFFFFFFFFF8;
    }
    while (v11 - 1 < length);

  }
}

- (void)enumerateChunksUsingBlock:(id)a3
{
  -[_OSLogChunkStore enumerateChunksInRange:usingBlock:](self, "enumerateChunksInRange:usingBlock:", 0, self->_sz, a3);
}

@end
