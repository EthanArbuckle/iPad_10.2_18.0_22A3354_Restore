@implementation SSHBHIDSampleBuffer

- (SSHBHIDSampleBuffer)init
{
  SSHBHIDSampleBuffer *v2;
  NSMutableArray *v3;
  NSMutableArray *buffer;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)SSHBHIDSampleBuffer;
  v2 = -[SSHBHIDSampleBuffer init](&v6, "init");
  if (v2)
  {
    v3 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    buffer = v2->_buffer;
    v2->_buffer = v3;

    v2->_isFull = 0;
    v2->_bufferSize = 0xFFFFFFFFLL;
  }
  return v2;
}

- (SSHBHIDSampleBuffer)initWithSize:(unint64_t)a3
{
  SSHBHIDSampleBuffer *result;
  unint64_t v5;

  result = -[SSHBHIDSampleBuffer init](self, "init");
  if (result)
  {
    v5 = 0xFFFFFFFFLL;
    if (a3)
      v5 = a3;
    result->_bufferSize = v5;
  }
  return result;
}

- (id)sampleBuffer
{
  void *v2;
  id v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[SSHBHIDSampleBuffer buffer](self, "buffer"));
  v3 = objc_msgSend(v2, "copy");

  return v3;
}

- (void)addSample:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  unint64_t v8;
  id v9;
  id v10;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[SSHBHIDSampleBuffer buffer](self, "buffer"));
  objc_msgSend(v5, "addObject:", v4);

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[SSHBHIDSampleBuffer buffer](self, "buffer"));
  v7 = objc_msgSend(v6, "count");
  v8 = -[SSHBHIDSampleBuffer bufferSize](self, "bufferSize");

  if ((unint64_t)v7 > v8)
    v9 = -[SSHBHIDSampleBuffer removeSample](self, "removeSample");
  v10 = (id)objc_claimAutoreleasedReturnValue(-[SSHBHIDSampleBuffer buffer](self, "buffer"));
  -[SSHBHIDSampleBuffer setIsFull:](self, "setIsFull:", objc_msgSend(v10, "count") >= (id)-[SSHBHIDSampleBuffer bufferSize](self, "bufferSize"));

}

- (id)removeSample
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[SSHBHIDSampleBuffer buffer](self, "buffer"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectAtIndex:", 0));

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[SSHBHIDSampleBuffer buffer](self, "buffer"));
  objc_msgSend(v5, "removeObjectAtIndex:", 0);

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[SSHBHIDSampleBuffer buffer](self, "buffer"));
  -[SSHBHIDSampleBuffer setIsFull:](self, "setIsFull:", objc_msgSend(v6, "count") >= (id)-[SSHBHIDSampleBuffer bufferSize](self, "bufferSize"));

  return v4;
}

- (id)csv
{
  id v3;
  void *v4;
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];

  v3 = objc_alloc_init((Class)NSMutableString);
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[SSHBHIDSampleBuffer buffer](self, "buffer"));
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v12;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v12 != v7)
          objc_enumerationMutation(v4);
        v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * (_QWORD)v8), "csv"));
        objc_msgSend(v3, "appendFormat:", CFSTR("%@\n"), v9);

        v8 = (char *)v8 + 1;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v6);
  }

  return v3;
}

- (void)writeSamplesWithFilePath:(id)a3
{
  void *v4;
  void *v5;
  unsigned int v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  id v13;

  v13 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[SSHBHIDSampleBuffer csv](self, "csv"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
  v6 = objc_msgSend(v5, "fileExistsAtPath:", v13);

  v7 = v13;
  if (v6)
  {
    v8 = 1;
    v9 = v13;
    do
    {
      v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "stringByDeletingPathExtension"));
      v11 = objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "pathExtension"));
      v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@-%u.%@"), v10, v8, v11));

      v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
      LOBYTE(v11) = objc_msgSend(v12, "fileExistsAtPath:", v7);

      v8 = (v8 + 1);
      v9 = v7;
    }
    while ((v11 & 1) != 0);
  }
  objc_msgSend(v4, "writeToFile:atomically:encoding:error:", v7, 1, 4, 0);

}

- (BOOL)isFull
{
  return self->_isFull;
}

- (void)setIsFull:(BOOL)a3
{
  self->_isFull = a3;
}

- (NSMutableArray)buffer
{
  return self->_buffer;
}

- (void)setBuffer:(id)a3
{
  objc_storeStrong((id *)&self->_buffer, a3);
}

- (unint64_t)bufferSize
{
  return self->_bufferSize;
}

- (void)setBufferSize:(unint64_t)a3
{
  self->_bufferSize = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_buffer, 0);
}

@end
