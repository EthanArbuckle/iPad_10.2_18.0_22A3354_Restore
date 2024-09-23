@implementation _HFMediaValueManagerTransaction

- (_HFMediaValueManagerTransaction)init
{
  _HFMediaValueManagerTransaction *v2;
  uint64_t v3;
  NSNumber *transactionNumber;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)_HFMediaValueManagerTransaction;
  v2 = -[_HFMediaValueManagerTransaction init](&v6, sel_init);
  if (v2)
  {
    ++init_i;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:");
    v3 = objc_claimAutoreleasedReturnValue();
    transactionNumber = v2->_transactionNumber;
    v2->_transactionNumber = (NSNumber *)v3;

  }
  return v2;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)_HFMediaValueManagerTransaction;
  -[_HFMediaValueManagerTransaction description](&v9, sel_description);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[_HFMediaValueManagerTransaction transactionNumber](self, "transactionNumber");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromHMMediaPlaybackState(-[_HFMediaValueManagerTransaction playbackState](self, "playbackState"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[_HFMediaValueManagerTransaction writeFuture](self, "writeFuture");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringByAppendingFormat:", CFSTR("(Transaction ID %@) --> Transitioning to %@; %@"), v4, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (NAFuture)writeFuture
{
  return self->_writeFuture;
}

- (void)setWriteFuture:(id)a3
{
  objc_storeStrong((id *)&self->_writeFuture, a3);
}

- (int64_t)playbackState
{
  return self->_playbackState;
}

- (void)setPlaybackState:(int64_t)a3
{
  self->_playbackState = a3;
}

- (NSNumber)transactionNumber
{
  return self->_transactionNumber;
}

- (void)setTransactionNumber:(id)a3
{
  objc_storeStrong((id *)&self->_transactionNumber, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_transactionNumber, 0);
  objc_storeStrong((id *)&self->_writeFuture, 0);
}

@end
