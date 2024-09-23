@implementation ATFileBuffer

- (ATFileBuffer)init
{
  ATFileBuffer *v2;
  id v3;
  FILE *v4;
  uint64_t v5;
  NSFileHandle *bufferFileHandle;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)ATFileBuffer;
  v2 = -[ATFileBuffer init](&v8, sel_init);
  if (v2)
  {
    v3 = objc_alloc(MEMORY[0x24BDD1578]);
    v4 = tmpfile();
    v5 = objc_msgSend(v3, "initWithFileDescriptor:closeOnDealloc:", fileno(v4), 1);
    bufferFileHandle = v2->_bufferFileHandle;
    v2->_bufferFileHandle = (NSFileHandle *)v5;

  }
  return v2;
}

- (void)appendData:(id)a3
{
  NSFileHandle *bufferFileHandle;
  id v5;
  uint64_t v6;

  bufferFileHandle = self->_bufferFileHandle;
  v5 = a3;
  -[NSFileHandle writeData:](bufferFileHandle, "writeData:", v5);
  v6 = objc_msgSend(v5, "length");

  self->_length += v6;
}

- (void)rewindData:(id)a3
{
  if (self->_currentReadLocation)
    self->_currentReadLocation -= objc_msgSend(a3, "length");
  else
    -[ATFileBuffer appendData:](self, "appendData:", a3);
}

- (id)readDataOfLength:(unint64_t)a3
{
  void *v5;
  unint64_t v6;

  -[NSFileHandle seekToFileOffset:](self->_bufferFileHandle, "seekToFileOffset:", self->_currentReadLocation);
  -[NSFileHandle readDataOfLength:](self->_bufferFileHandle, "readDataOfLength:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  self->_currentReadLocation += objc_msgSend(v5, "length");
  v6 = self->_length - objc_msgSend(v5, "length");
  self->_length = v6;
  if (!v6)
  {
    -[NSFileHandle truncateFileAtOffset:](self->_bufferFileHandle, "truncateFileAtOffset:", 0);
    self->_currentReadLocation = 0;
  }
  -[NSFileHandle seekToEndOfFile](self->_bufferFileHandle, "seekToEndOfFile");
  return v5;
}

- (void)rewind:(unint64_t)a3
{
  unint64_t currentReadLocation;
  BOOL v4;
  unint64_t v5;

  currentReadLocation = self->_currentReadLocation;
  v4 = currentReadLocation >= a3;
  v5 = currentReadLocation - a3;
  if (!v4)
    v5 = 0;
  self->_currentReadLocation = v5;
}

- (unint64_t)length
{
  return self->_length;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bufferFileHandle, 0);
}

@end
