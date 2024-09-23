@implementation BUBufferedReadChannel

- (BUBufferedReadChannel)initWithReadChannel:(id)a3 blockInfos:(id)a4 streamReadChannelBlock:(id)a5
{
  return (BUBufferedReadChannel *)MEMORY[0x24BEDD108](self, sel_initWithReadChannel_sourceReadBufferSize_blockInfos_streamReadChannelBlock_, a3);
}

- (BUBufferedReadChannel)initWithReadChannel:(id)a3 sourceReadBufferSize:(unint64_t)a4 blockInfos:(id)a5 streamReadChannelBlock:(id)a6
{
  id v11;
  id v12;
  id v13;
  BUBufferedReadChannel *v14;
  BUBufferedReadChannel *v15;
  dispatch_queue_t v16;
  OS_dispatch_queue *readQueue;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  NSArray *blockInfos;
  uint64_t v22;
  id streamReadChannelBlock;
  objc_super v25;

  v11 = a3;
  v12 = a5;
  v13 = a6;
  v25.receiver = self;
  v25.super_class = (Class)BUBufferedReadChannel;
  v14 = -[BUBufferedReadChannel init](&v25, sel_init);
  v15 = v14;
  if (v14)
  {
    if (a4 && v11 && v13)
    {
      v16 = dispatch_queue_create("BUBufferedReadChannel.Read", 0);
      readQueue = v15->_readQueue;
      v15->_readQueue = (OS_dispatch_queue *)v16;

      dispatch_queue_set_specific((dispatch_queue_t)v15->_readQueue, (const void *)qword_254B69E58, (void *)qword_254B69E58, 0);
      objc_storeStrong((id *)&v15->_sourceReadChannel, a3);
      v15->_sourceReadBufferSize = a4;
      v15->_sourceOffset = 0x7FFFFFFFFFFFFFFFLL;
      v20 = objc_msgSend_copy(v12, v18, v19);
      blockInfos = v15->_blockInfos;
      v15->_blockInfos = (NSArray *)v20;

      v22 = MEMORY[0x2199A7288](v13);
      streamReadChannelBlock = v15->_streamReadChannelBlock;
      v15->_streamReadChannelBlock = (id)v22;

      v15->_streamOutputOffset = 0x7FFFFFFFFFFFFFFFLL;
    }
    else
    {

      v15 = 0;
    }
  }

  return v15;
}

- (void)dealloc
{
  uint64_t v2;
  objc_super v4;

  objc_msgSend__close(self, a2, v2);
  v4.receiver = self;
  v4.super_class = (Class)BUBufferedReadChannel;
  -[BUBufferedReadChannel dealloc](&v4, sel_dealloc);
}

- (void)close
{
  void *v3;
  const char *v4;
  uint64_t v5;
  NSObject *readQueue;
  _QWORD block[5];

  v3 = (void *)qword_254B69E58;
  if (dispatch_get_specific((const void *)qword_254B69E58) == v3)
  {
    objc_msgSend__close(self, v4, v5);
  }
  else
  {
    readQueue = self->_readQueue;
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = sub_212E64F88;
    block[3] = &unk_24CED9E10;
    block[4] = self;
    dispatch_sync(readQueue, block);
  }
}

- (void)_close
{
  uint64_t v2;
  const char *v4;
  uint64_t v5;
  BUReadChannel *sourceReadChannel;
  id streamReadChannelSourceHandler;

  objc_msgSend__closeStreamReadChannel(self, a2, v2);
  objc_msgSend_close(self->_sourceReadChannel, v4, v5);
  sourceReadChannel = self->_sourceReadChannel;
  self->_sourceReadChannel = 0;

  streamReadChannelSourceHandler = self->_streamReadChannelSourceHandler;
  self->_streamReadChannelSourceHandler = 0;

}

- (void)_closeStreamReadChannel
{
  uint64_t v2;
  BUStreamReadChannel *streamReadChannel;

  objc_msgSend_close(self->_streamReadChannel, a2, v2);
  streamReadChannel = self->_streamReadChannel;
  self->_streamReadChannel = 0;

}

- (void)_resetStreamReadChannelIfNeededForOffset:(int64_t)a3 length:(unint64_t)a4
{
  int64_t v5;
  int64_t streamOutputOffset;
  unint64_t streamOutputOutstandingLength;
  unint64_t v9;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  const char *v15;
  uint64_t v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  int64_t v20;
  unint64_t v21;
  void *v22;
  uint64_t v23;
  void *v24;
  const char *v25;
  uint64_t v26;
  const char *v27;
  uint64_t v28;
  const char *v29;
  uint64_t v30;
  const char *v31;
  uint64_t v32;
  unint64_t v33;
  id v34;
  const char *v35;
  uint64_t v36;
  void *v37;
  int64_t v38;
  unint64_t v39;
  void *v40;
  const char *v41;
  const char *v42;
  uint64_t v43;
  const char *v44;
  uint64_t v45;
  const char *v46;
  uint64_t v47;
  void *v48;
  const char *v49;
  uint64_t v50;
  uint64_t v51;
  OS_dispatch_data *currentStreamOutputData;
  id streamReadChannelSourceHandler;
  void (**streamReadChannelBlock)(id, void *, void *);
  BUBufferedReadChannelHelper *v55;
  const char *v56;
  void *Channel;
  BUStreamReadChannel *v58;
  BUStreamReadChannel *streamReadChannel;
  BUStreamReadChannel *v60;
  const char *v61;
  NSArray *obj;
  uint64_t v63;
  _QWORD v64[5];
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  _BYTE v69[128];
  uint64_t v70;

  v5 = a3;
  v70 = *MEMORY[0x24BDAC8D0];
  streamOutputOffset = self->_streamOutputOffset;
  if (streamOutputOffset <= a3)
  {
    streamOutputOutstandingLength = self->_streamOutputOutstandingLength;
    v9 = streamOutputOutstandingLength + streamOutputOffset;
    if (streamOutputOutstandingLength == -1 || v9 > a3)
      return;
  }
  objc_msgSend__closeStreamReadChannel(self, a2, a3);
  *(_OWORD *)&self->_sourceOffset = xmmword_212E71CB0;
  *(_OWORD *)&self->_streamOutputOffset = xmmword_212E71CB0;
  self->_streamOutputLength = 0;
  v13 = objc_msgSend_count(self->_blockInfos, v11, v12);
  if (!v13)
  {
    v22 = 0;
    goto LABEL_27;
  }
  v14 = v13;
  v67 = 0u;
  v68 = 0u;
  v65 = 0u;
  v66 = 0u;
  obj = self->_blockInfos;
  v16 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v15, (uint64_t)&v65, v69, 16);
  if (!v16)
  {
    v22 = 0;
    goto LABEL_26;
  }
  v19 = v16;
  v20 = 0;
  v21 = 0;
  v22 = 0;
  v63 = *(_QWORD *)v66;
  do
  {
    v23 = 0;
    do
    {
      if (*(_QWORD *)v66 != v63)
        objc_enumerationMutation(obj);
      v24 = *(void **)(*((_QWORD *)&v65 + 1) + 8 * v23);
      v20 += objc_msgSend_decodedLength(v24, v17, v18);
      if (v21)
      {
        objc_msgSend_addObject_(v22, v25, (uint64_t)v24);
        self->_sourceLength += objc_msgSend_encodedLength(v24, v27, v28);
        v21 += objc_msgSend_decodedLength(v24, v29, v30);
        v33 = self->_streamOutputOutstandingLength + objc_msgSend_decodedLength(v24, v31, v32);
      }
      else
      {
        if (v20 <= v5)
        {
          self->_sourceOffset += objc_msgSend_encodedLength(v24, v25, v26);
          v21 = 0;
          self->_streamOutputOffset += objc_msgSend_decodedLength(v24, v49, v50);
          goto LABEL_17;
        }
        v34 = objc_alloc(MEMORY[0x24BDBCEB8]);
        v36 = objc_msgSend_initWithCapacity_(v34, v35, v14);
        v37 = v22;
        v38 = v5;
        v39 = a4;
        v40 = (void *)v36;

        objc_msgSend_addObject_(v40, v41, (uint64_t)v24);
        self->_sourceLength = objc_msgSend_encodedLength(v24, v42, v43);
        v21 = objc_msgSend_decodedLength(v24, v44, v45);
        v33 = objc_msgSend_decodedLength(v24, v46, v47);
        v48 = v40;
        a4 = v39;
        v5 = v38;
        v22 = v48;
      }
      self->_streamOutputOutstandingLength = v33;
      if (v21 > a4)
        goto LABEL_26;
LABEL_17:
      if (!--v14)
      {
        self->_sourceLength = -1;
        self->_streamOutputOutstandingLength = -1;
      }
      ++v23;
    }
    while (v19 != v23);
    v51 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v17, (uint64_t)&v65, v69, 16);
    v19 = v51;
  }
  while (v51);
LABEL_26:

LABEL_27:
  currentStreamOutputData = self->_currentStreamOutputData;
  self->_currentStreamOutputData = 0;

  self->_streamOutputDone = 0;
  streamReadChannelSourceHandler = self->_streamReadChannelSourceHandler;
  self->_streamReadChannelSourceHandler = 0;

  streamReadChannelBlock = (void (**)(id, void *, void *))self->_streamReadChannelBlock;
  v55 = [BUBufferedReadChannelHelper alloc];
  Channel = (void *)objc_msgSend_initWithBufferedReadChannel_(v55, v56, (uint64_t)self);
  streamReadChannelBlock[2](streamReadChannelBlock, Channel, v22);
  v58 = (BUStreamReadChannel *)objc_claimAutoreleasedReturnValue();
  streamReadChannel = self->_streamReadChannel;
  self->_streamReadChannel = v58;

  v60 = self->_streamReadChannel;
  v64[0] = MEMORY[0x24BDAC760];
  v64[1] = 3221225472;
  v64[2] = sub_212E6531C;
  v64[3] = &unk_24CEDAC10;
  v64[4] = self;
  objc_msgSend_readWithHandler_(v60, v61, (uint64_t)v64);

}

- (void)setStreamReadChannelSourceHandler:(id)a3
{
  void *v4;
  id streamReadChannelSourceHandler;

  v4 = (void *)MEMORY[0x2199A7288](a3, a2);
  streamReadChannelSourceHandler = self->_streamReadChannelSourceHandler;
  self->_streamReadChannelSourceHandler = v4;

}

- (void)readFromOffset:(int64_t)a3 length:(unint64_t)a4 handler:(id)a5
{
  id v8;
  NSObject *readQueue;
  id v10;
  _QWORD v11[5];
  id v12;
  int64_t v13;
  unint64_t v14;

  v8 = a5;
  readQueue = self->_readQueue;
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = sub_212E654FC;
  v11[3] = &unk_24CEDAC38;
  v13 = a3;
  v14 = a4;
  v11[4] = self;
  v12 = v8;
  v10 = v8;
  dispatch_async(readQueue, v11);

}

- (void)readWithHandler:(id)a3
{
  objc_msgSend_readFromOffset_length_handler_(self, a2, 0, -1, a3);
}

- (void)_readFromOffset:(int64_t)a3 length:(unint64_t)a4 handler:(id)a5
{
  void (**v8)(id, _BOOL8, void *, _QWORD);
  unint64_t v9;
  int64_t v10;
  const char *v11;
  const char *v12;
  NSObject *v13;
  const char *v14;
  NSObject *v15;
  size_t size;
  _BOOL8 v17;
  OS_dispatch_data *currentStreamOutputData;
  unint64_t streamOutputLength;
  unint64_t streamOutputOutstandingLength;
  BUReadChannel *sourceReadChannel;
  int64_t sourceOffset;
  unint64_t sourceReadBufferSize;
  const char *v24;
  _QWORD v25[5];
  void (**v26)(id, _BOOL8, void *, _QWORD);
  _QWORD *v27;
  unint64_t v28;
  int64_t v29;
  unint64_t v30;
  _QWORD v31[4];
  char v32;

  v8 = (void (**)(id, _BOOL8, void *, _QWORD))a5;
  v9 = (a3 & (a3 >> 63)) + a4;
  v10 = a3 & ~(a3 >> 63);
  objc_msgSend__resetStreamReadChannelIfNeededForOffset_length_(self, v11, v10, v9);
  v32 = 0;
  objc_msgSend__currentDataIntersectionWithOffset_length_isReadDone_(self, v12, v10, v9, &v32);
  v13 = objc_claimAutoreleasedReturnValue();
  v15 = v13;
  if (v13)
  {
    size = dispatch_data_get_size(v13);
    v10 += size;
    v9 -= size;
    v17 = v32 != 0;
  }
  else
  {
    if (!v32)
      goto LABEL_7;
    v17 = 1;
  }
  v8[2](v8, v17, v15, 0);
  if (v32)
  {
    dispatch_resume((dispatch_object_t)self->_readQueue);
    goto LABEL_13;
  }
LABEL_7:
  objc_msgSend__resetStreamReadChannelIfNeededForOffset_length_(self, v14, v10, v9);
  currentStreamOutputData = self->_currentStreamOutputData;
  self->_currentStreamOutputData = 0;

  streamOutputOutstandingLength = self->_streamOutputOutstandingLength;
  streamOutputLength = self->_streamOutputLength;
  self->_streamOutputOffset += streamOutputLength;
  if (streamOutputOutstandingLength != -1)
    self->_streamOutputOutstandingLength = streamOutputOutstandingLength - streamOutputLength;
  self->_streamOutputLength = 0;
  sourceReadChannel = self->_sourceReadChannel;
  sourceOffset = self->_sourceOffset;
  if (self->_sourceLength >= self->_sourceReadBufferSize)
    sourceReadBufferSize = self->_sourceReadBufferSize;
  else
    sourceReadBufferSize = self->_sourceLength;
  v31[0] = 0;
  v31[1] = v31;
  v31[2] = 0x2020000000;
  v31[3] = 0;
  v25[0] = MEMORY[0x24BDAC760];
  v25[1] = 3221225472;
  v25[2] = sub_212E6577C;
  v25[3] = &unk_24CEDAC60;
  v25[4] = self;
  v26 = v8;
  v27 = v31;
  v28 = sourceReadBufferSize;
  v29 = v10;
  v30 = v9;
  objc_msgSend_readFromOffset_length_handler_(sourceReadChannel, v24, sourceOffset, sourceReadBufferSize, v25);

  _Block_object_dispose(v31, 8);
LABEL_13:

}

- (id)_currentDataIntersectionWithOffset:(int64_t)a3 length:(unint64_t)a4 isReadDone:(BOOL *)a5
{
  unint64_t v7;
  int64_t streamOutputOffset;
  unint64_t v9;
  unint64_t streamOutputLength;
  unint64_t v11;
  unint64_t v12;
  size_t v13;
  dispatch_data_t subrange;
  char isStreamOutputDone;
  BOOL v16;

  if (__CFADD__(a3, a4))
    v7 = -1;
  else
    v7 = a3 + a4;
  streamOutputOffset = self->_streamOutputOffset;
  if (streamOutputOffset <= a3)
    v9 = a3;
  else
    v9 = self->_streamOutputOffset;
  streamOutputLength = self->_streamOutputLength;
  v11 = streamOutputLength + streamOutputOffset;
  if (v7 >= streamOutputLength + streamOutputOffset)
    v12 = streamOutputLength + streamOutputOffset;
  else
    v12 = v7;
  v13 = v12 - v9;
  if (v12 <= v9)
  {
    subrange = 0;
    if (!a5)
      return subrange;
  }
  else
  {
    subrange = dispatch_data_create_subrange((dispatch_data_t)self->_currentStreamOutputData, v9 - streamOutputOffset, v13);
    if (!a5)
      return subrange;
  }
  isStreamOutputDone = objc_msgSend_isStreamOutputDone(self, a2, v13);
  if (v7 <= v11)
    v16 = 1;
  else
    v16 = isStreamOutputDone;
  *a5 = v16;
  return subrange;
}

- (void)setLowWater:(unint64_t)a3
{
  objc_msgSend_setLowWater_(self->_sourceReadChannel, a2, a3);
}

- (void)addBarrier:(id)a3
{
  objc_msgSend_addBarrier_(self->_sourceReadChannel, a2, (uint64_t)a3);
}

- (BOOL)isValid
{
  return ((uint64_t (*)(BUReadChannel *, char *))MEMORY[0x24BEDD108])(self->_sourceReadChannel, sel_isValid);
}

- (id)streamReadChannelSourceHandler
{
  return self->_streamReadChannelSourceHandler;
}

- (OS_dispatch_queue)readQueue
{
  return self->_readQueue;
}

- (void)setReadQueue:(id)a3
{
  objc_storeStrong((id *)&self->_readQueue, a3);
}

- (BUReadChannel)sourceReadChannel
{
  return self->_sourceReadChannel;
}

- (void)setSourceReadChannel:(id)a3
{
  objc_storeStrong((id *)&self->_sourceReadChannel, a3);
}

- (unint64_t)sourceReadBufferSize
{
  return self->_sourceReadBufferSize;
}

- (void)setSourceReadBufferSize:(unint64_t)a3
{
  self->_sourceReadBufferSize = a3;
}

- (int64_t)sourceOffset
{
  return self->_sourceOffset;
}

- (void)setSourceOffset:(int64_t)a3
{
  self->_sourceOffset = a3;
}

- (unint64_t)sourceLength
{
  return self->_sourceLength;
}

- (void)setSourceLength:(unint64_t)a3
{
  self->_sourceLength = a3;
}

- (NSError)sourceReadChannelError
{
  return self->_sourceReadChannelError;
}

- (void)setSourceReadChannelError:(id)a3
{
  objc_storeStrong((id *)&self->_sourceReadChannelError, a3);
}

- (NSArray)blockInfos
{
  return self->_blockInfos;
}

- (void)setBlockInfos:(id)a3
{
  objc_storeStrong((id *)&self->_blockInfos, a3);
}

- (id)streamReadChannelBlock
{
  return self->_streamReadChannelBlock;
}

- (void)setStreamReadChannelBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 80);
}

- (BUStreamReadChannel)streamReadChannel
{
  return self->_streamReadChannel;
}

- (void)setStreamReadChannel:(id)a3
{
  objc_storeStrong((id *)&self->_streamReadChannel, a3);
}

- (BOOL)isStreamOutputDone
{
  return self->_streamOutputDone;
}

- (void)setStreamOutputDone:(BOOL)a3
{
  self->_streamOutputDone = a3;
}

- (int64_t)streamOutputOffset
{
  return self->_streamOutputOffset;
}

- (void)setStreamOutputOffset:(int64_t)a3
{
  self->_streamOutputOffset = a3;
}

- (unint64_t)streamOutputOutstandingLength
{
  return self->_streamOutputOutstandingLength;
}

- (void)setStreamOutputOutstandingLength:(unint64_t)a3
{
  self->_streamOutputOutstandingLength = a3;
}

- (unint64_t)streamOutputLength
{
  return self->_streamOutputLength;
}

- (void)setStreamOutputLength:(unint64_t)a3
{
  self->_streamOutputLength = a3;
}

- (OS_dispatch_data)currentStreamOutputData
{
  return self->_currentStreamOutputData;
}

- (void)setCurrentStreamOutputData:(id)a3
{
  objc_storeStrong((id *)&self->_currentStreamOutputData, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentStreamOutputData, 0);
  objc_storeStrong((id *)&self->_streamReadChannel, 0);
  objc_storeStrong(&self->_streamReadChannelBlock, 0);
  objc_storeStrong((id *)&self->_blockInfos, 0);
  objc_storeStrong((id *)&self->_sourceReadChannelError, 0);
  objc_storeStrong((id *)&self->_sourceReadChannel, 0);
  objc_storeStrong((id *)&self->_readQueue, 0);
  objc_storeStrong(&self->_streamReadChannelSourceHandler, 0);
}

@end
