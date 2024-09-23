@implementation _MFDAMessageFetchAttachmentConsumer

- (void)consumeData:(id)a3 ofContentType:(id)a4 forAttachmentNamed:(id)a5 ofMessageWithServerID:(id)a6
{
  void *v7;
  id v8;

  v8 = a3;
  -[_MFDAMessageFetchAttachmentConsumer progressFilter](self, "progressFilter");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "appendData:", v8);

  self->_accumulatedLength += objc_msgSend(v8, "length");
  if (-[_MFDAMessageFetchAttachmentConsumer expectedLength](self, "expectedLength") != 0x7FFFFFFFFFFFFFFFLL
    && -[_MFDAMessageFetchAttachmentConsumer expectedLength](self, "expectedLength"))
  {
    -[MFActivityMonitor setPercentDone:](self->_monitor, "setPercentDone:", (double)self->_accumulatedLength/ (double)-[_MFDAMessageFetchAttachmentConsumer expectedLength](self, "expectedLength"));
  }

}

- (void)attachmentFetchCompletedWithStatus:(int64_t)a3 forAttachmentNamed:(id)a4 ofMessageWithServerID:(id)a5 dataWasBase64:(BOOL)a6 sentBytesCount:(unint64_t)a7 receivedBytesCount:(unint64_t)a8
{
  -[MFActivityMonitor recordBytesWritten:](self->_monitor, "recordBytesWritten:", a7, a4, a5);
  -[MFActivityMonitor recordBytesRead:](self->_monitor, "recordBytesRead:", a8);
  self->_fetchSucceeded = a3 == 2;
  self->_dataWasBase64 = a6;
  -[MFDAMailAccountConsumer setDone:](self, "setDone:", 1);
}

- (_MFDAMessageFetchAttachmentConsumer)initWithActivityMonitor:(id)a3
{
  id v5;
  _MFDAMessageFetchAttachmentConsumer *v6;
  _MFDAMessageFetchAttachmentConsumer *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_MFDAMessageFetchAttachmentConsumer;
  v6 = -[MFDAMailAccountConsumer init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_monitor, a3);

  return v7;
}

- (MFProgressFilterDataConsumer)progressFilter
{
  return self->_progressFilter;
}

- (void)setProgressFilter:(id)a3
{
  objc_storeStrong((id *)&self->_progressFilter, a3);
}

- (unint64_t)expectedLength
{
  return self->_expectedLength;
}

- (void)setExpectedLength:(unint64_t)a3
{
  self->_expectedLength = a3;
}

- (BOOL)dataWasBase64
{
  return self->_dataWasBase64;
}

- (BOOL)fetchSucceeded
{
  return self->_fetchSucceeded;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_monitor, 0);
  objc_storeStrong((id *)&self->_progressFilter, 0);
}

@end
