@implementation _SYMessageTimerContext

- (unint64_t)seqno
{
  return self->_seqno;
}

- (void)setSeqno:(unint64_t)a3
{
  self->_seqno = a3;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end
