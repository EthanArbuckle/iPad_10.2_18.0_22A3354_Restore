@implementation MOVStreamWriterStreamStats

- (MOVStreamWriterStreamStats)init
{
  MOVStreamWriterStreamStats *v2;
  MOVStreamWriterStreamStats *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)MOVStreamWriterStreamStats;
  v2 = -[MOVStreamWriterStreamStats init](&v5, sel_init);
  v3 = v2;
  if (v2)
  {
    -[MOVStreamWriterStreamStats setFifoItemCount:](v2, "setFifoItemCount:", 0);
    -[MOVStreamWriterStreamStats setVisitCount:](v3, "setVisitCount:", 0);
    -[MOVStreamWriterStreamStats setAttemptCount:](v3, "setAttemptCount:", 0);
    -[MOVStreamWriterStreamStats setWriteCount:](v3, "setWriteCount:", 0);
  }
  return v3;
}

- (unint64_t)fifoItemCount
{
  return self->_fifoItemCount;
}

- (void)setFifoItemCount:(unint64_t)a3
{
  self->_fifoItemCount = a3;
}

- (unint64_t)visitCount
{
  return self->_visitCount;
}

- (void)setVisitCount:(unint64_t)a3
{
  self->_visitCount = a3;
}

- (unint64_t)attemptCount
{
  return self->_attemptCount;
}

- (void)setAttemptCount:(unint64_t)a3
{
  self->_attemptCount = a3;
}

- (unint64_t)writeCount
{
  return self->_writeCount;
}

- (void)setWriteCount:(unint64_t)a3
{
  self->_writeCount = a3;
}

@end
