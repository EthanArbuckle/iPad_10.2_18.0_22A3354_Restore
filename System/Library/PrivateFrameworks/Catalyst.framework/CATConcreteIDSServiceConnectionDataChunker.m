@implementation CATConcreteIDSServiceConnectionDataChunker

- (CATConcreteIDSServiceConnectionDataChunker)initWithWorkQueue:(id)a3 maxDataLength:(int64_t)a4
{
  id v7;
  CATConcreteIDSServiceConnectionDataChunker *v8;
  CATConcreteIDSServiceConnectionDataChunker *v9;
  objc_super v11;

  v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)CATConcreteIDSServiceConnectionDataChunker;
  v8 = -[CATConcreteIDSServiceConnectionDataChunker init](&v11, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->mWorkQueue, a3);
    v9->mMaxDataLength = a4;
  }

  return v9;
}

- (id)chunkDataIntoMessageContent:(id)a3
{
  id v4;
  unint64_t v5;
  unint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  int64_t v10;
  uint64_t v11;
  int64_t mMaxDataLength;
  unint64_t mNextSequenceNumber;
  CATActiveIDSServiceConnectionContentSendData *v14;
  void *v15;
  CATActiveIDSServiceConnectionContentSendData *v16;
  void *v17;
  unint64_t mNextDataNumber;

  v4 = a3;
  CATAssertIsQueue((dispatch_queue_t)self->mWorkQueue);
  mNextDataNumber = self->mNextDataNumber;
  self->mNextDataNumber = mNextDataNumber + 1;
  v5 = (unint64_t)objc_msgSend(v4, "length") / self->mMaxDataLength;
  if ((unint64_t)objc_msgSend(v4, "length") % self->mMaxDataLength)
    v6 = v5 + 1;
  else
    v6 = v5;
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", v6);
  v8 = (void *)objc_msgSend(v4, "copy");
  if (v6)
  {
    v9 = 0;
    do
    {
      v10 = self->mMaxDataLength * v9;
      v11 = objc_msgSend(v4, "length");
      if (self->mMaxDataLength >= (unint64_t)(v11 - v10))
        mMaxDataLength = v11 - v10;
      else
        mMaxDataLength = self->mMaxDataLength;
      mNextSequenceNumber = self->mNextSequenceNumber;
      self->mNextSequenceNumber = mNextSequenceNumber + 1;
      v14 = [CATActiveIDSServiceConnectionContentSendData alloc];
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", mNextSequenceNumber);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = -[CATActiveIDSServiceConnectionContentSendData initWithSequenceNumber:dataNumber:dataSegment:segmentRange:segmentNumber:totalSegments:](v14, "initWithSequenceNumber:dataNumber:dataSegment:segmentRange:segmentNumber:totalSegments:", v15, mNextDataNumber, v8, v10, mMaxDataLength, ++v9, v6);

      objc_msgSend(v7, "addObject:", v16);
    }
    while (v6 != v9);
  }
  v17 = (void *)objc_msgSend(v7, "copy");

  return v17;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->mWorkQueue, 0);
}

@end
