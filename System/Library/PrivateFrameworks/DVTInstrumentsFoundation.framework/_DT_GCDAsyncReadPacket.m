@implementation _DT_GCDAsyncReadPacket

- (_DT_GCDAsyncReadPacket)initWithData:(id)a3 startOffset:(unint64_t)a4 maxLength:(unint64_t)a5 timeout:(double)a6 readLength:(unint64_t)a7 terminator:(id)a8 tag:(int64_t)a9
{
  id v17;
  id v18;
  _DT_GCDAsyncReadPacket *v19;
  _DT_GCDAsyncReadPacket *v20;
  uint64_t v21;
  NSData *term;
  uint64_t v23;
  unint64_t readLength;
  id v25;
  unint64_t v26;
  uint64_t v27;
  NSMutableData *buffer;
  objc_super v30;

  v17 = a3;
  v18 = a8;
  v30.receiver = self;
  v30.super_class = (Class)_DT_GCDAsyncReadPacket;
  v19 = -[_DT_GCDAsyncReadPacket init](&v30, sel_init);
  v20 = v19;
  if (v19)
  {
    v19->bytesDone = 0;
    v19->maxLength = a5;
    v19->timeout = a6;
    v19->readLength = a7;
    v21 = objc_msgSend(v18, "copy");
    term = v20->term;
    v20->term = (NSData *)v21;

    v20->tag = a9;
    if (v17)
    {
      objc_storeStrong((id *)&v20->buffer, a3);
      v20->startOffset = a4;
      v20->bufferOwner = 0;
      v23 = objc_msgSend(v17, "length");
    }
    else
    {
      readLength = v20->readLength;
      v25 = objc_alloc(MEMORY[0x24BDBCEC8]);
      if (readLength)
        v26 = v20->readLength;
      else
        v26 = 0;
      v27 = objc_msgSend(v25, "initWithLength:", v26);
      buffer = v20->buffer;
      v20->buffer = (NSMutableData *)v27;

      v23 = 0;
      v20->startOffset = 0;
      v20->bufferOwner = 1;
    }
    v20->originalBufferLength = v23;
  }

  return v20;
}

- (void)ensureCapacityForAdditionalDataOfLength:(unint64_t)a3
{
  if (a3 > -[NSMutableData length](self->buffer, "length") - (self->startOffset + self->bytesDone))
    MEMORY[0x24BEDD108](self->buffer, sel_increaseLengthBy_);
}

- (unint64_t)optimalReadLengthWithDefault:(unint64_t)a3 shouldPreBuffer:(BOOL *)a4
{
  NSUInteger v5;
  unint64_t readLength;
  unint64_t v7;
  BOOL v8;
  unint64_t maxLength;
  unint64_t v10;

  v5 = a3;
  readLength = self->readLength;
  if (readLength)
  {
    v7 = readLength - self->bytesDone;
    if (v7 < a3)
      v5 = v7;
    if (a4)
    {
      v8 = 0;
LABEL_11:
      *a4 = v8;
    }
  }
  else
  {
    maxLength = self->maxLength;
    if (maxLength)
    {
      v10 = maxLength - self->bytesDone;
      if (v10 < a3)
        v5 = v10;
    }
    if (a4)
    {
      v8 = -[NSMutableData length](self->buffer, "length") - (self->startOffset + self->bytesDone) < v5;
      goto LABEL_11;
    }
  }
  return v5;
}

- (unint64_t)readLengthForNonTermWithHint:(unint64_t)a3
{
  unint64_t readLength;
  unint64_t v7;
  void *v9;
  void *v10;

  if (self->term)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("GCDAsyncSocket.m"), 505, CFSTR("This method does not apply to term reads"));

    if (a3)
      goto LABEL_3;
LABEL_10:
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("GCDAsyncSocket.m"), 506, CFSTR("Invalid parameter: bytesAvailable"));

    goto LABEL_3;
  }
  if (!a3)
    goto LABEL_10;
LABEL_3:
  readLength = self->readLength;
  if (!readLength)
  {
    readLength = self->maxLength;
    if (!readLength)
      return a3;
  }
  v7 = readLength - self->bytesDone;
  if (v7 >= a3)
    return a3;
  else
    return v7;
}

- (unint64_t)readLengthForTermWithHint:(unint64_t)a3 shouldPreBuffer:(BOOL *)a4
{
  NSUInteger v5;
  unint64_t maxLength;
  unint64_t v9;
  void *v11;
  void *v12;

  v5 = a3;
  if (!self->term)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("GCDAsyncSocket.m"), 558, CFSTR("This method does not apply to non-term reads"));

    if (v5)
      goto LABEL_3;
LABEL_10:
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("GCDAsyncSocket.m"), 559, CFSTR("Invalid parameter: bytesAvailable"));

    goto LABEL_3;
  }
  if (!a3)
    goto LABEL_10;
LABEL_3:
  maxLength = self->maxLength;
  if (maxLength)
  {
    v9 = maxLength - self->bytesDone;
    if (v9 < v5)
      v5 = v9;
  }
  if (a4)
    *a4 = -[NSMutableData length](self->buffer, "length") - (self->startOffset + self->bytesDone) < v5;
  return v5;
}

- (unint64_t)readLengthForTermWithPreBuffer:(id)a3 found:(BOOL *)a4
{
  id v7;
  size_t v8;
  unint64_t v9;
  unint64_t v10;
  unint64_t bytesDone;
  unint64_t maxLength;
  unint64_t v13;
  size_t v14;
  char *v15;
  unint64_t startOffset;
  unint64_t v17;
  uint64_t v18;
  unint64_t v19;
  unint64_t v20;
  unint64_t v21;
  char *v22;
  size_t v23;
  char *v24;
  size_t v25;
  BOOL v26;
  uint64_t v27;
  void *v29;
  void *v30;
  unint64_t v31;
  id v32;
  BOOL *v33;
  unint64_t *v34;
  const void *v35;
  uint64_t v36;

  v36 = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  if (!self->term)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("GCDAsyncSocket.m"), 632, CFSTR("This method does not apply to non-term reads"));

  }
  if (!objc_msgSend(v7, "availableBytes"))
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("GCDAsyncSocket.m"), 633, CFSTR("Invoked with empty pre buffer!"));

  }
  v8 = -[NSData length](self->term, "length");
  v9 = objc_msgSend(v7, "availableBytes");
  v10 = v9;
  bytesDone = self->bytesDone;
  if (bytesDone + v9 < v8)
    goto LABEL_27;
  v34 = &v31;
  maxLength = self->maxLength;
  v13 = maxLength - bytesDone;
  if (v9 < v13)
    v13 = v9;
  if (maxLength)
    v10 = v13;
  v35 = -[NSData bytes](self->term, "bytes");
  if (self->bytesDone >= v8 - 1)
    v14 = v8 - 1;
  else
    v14 = self->bytesDone;
  v15 = -[NSMutableData mutableBytes](self->buffer, "mutableBytes");
  startOffset = self->startOffset;
  v17 = self->bytesDone;
  v18 = objc_msgSend(v7, "readBuffer");
  v19 = v10 - v8 + v14;
  v20 = v10;
  v21 = v19 + 1;
  if (v19 != -1)
  {
    v22 = (char *)v18;
    v32 = v7;
    v33 = a4;
    v23 = v8 - v14;
    v24 = &v15[startOffset + v17 - v14];
    v31 = v20;
    v25 = v20 + v14 - v8;
    v26 = 1;
    v27 = -1;
    while (1)
    {
      if (v14)
      {
        memcpy((char *)&v31 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0), v24, v14);
        memcpy((char *)&v31 + v14 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0), v22, v23);
        if (!memcmp((char *)&v31 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0), v35, v8))
        {
          v10 = v23;
          v7 = v32;
          a4 = v33;
          if (!v33)
            goto LABEL_27;
          goto LABEL_26;
        }
        ++v24;
        --v14;
        ++v23;
      }
      else
      {
        if (!memcmp(v22, v35, v8))
        {
          v7 = v32;
          v10 = (unint64_t)&v22[v8 - objc_msgSend(v32, "readBuffer")];
          a4 = v33;
          if (v33)
            goto LABEL_26;
          goto LABEL_27;
        }
        v14 = 0;
        ++v22;
      }
      v26 = v27 + 2 < v21;
      if (v25 == ++v27)
      {
        v7 = v32;
        a4 = v33;
        v10 = v31;
        if (v33)
          goto LABEL_26;
        goto LABEL_27;
      }
    }
  }
  v26 = 0;
  v10 = v20;
  if (a4)
LABEL_26:
    *a4 = v26;
LABEL_27:

  return v10;
}

- (int64_t)searchForTermAfterPreBuffering:(int64_t)a3
{
  char *v5;
  unint64_t bytesDone;
  const void *v7;
  NSUInteger v8;
  size_t v9;
  uint64_t v10;
  char *v11;
  unint64_t v12;
  int v13;
  void *v16;

  if (!self->term)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("GCDAsyncSocket.m"), 763, CFSTR("This method does not apply to non-term reads"));

  }
  v5 = -[NSMutableData mutableBytes](self->buffer, "mutableBytes");
  bytesDone = self->bytesDone;
  v7 = -[NSData bytes](self->term, "bytes");
  v8 = -[NSData length](self->term, "length");
  v9 = v8;
  if (bytesDone >= v8)
    v10 = bytesDone - v8 + 1;
  else
    v10 = 0;
  v11 = &v5[v10];
  v12 = v10 + v8;
  while (v12 <= bytesDone + a3)
  {
    v13 = memcmp(&v11[self->startOffset], v7, v9);
    ++v11;
    ++v12;
    if (!v13)
      return bytesDone + a3 - v12 + 1;
  }
  return -1;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->term, 0);
  objc_storeStrong((id *)&self->buffer, 0);
}

@end
