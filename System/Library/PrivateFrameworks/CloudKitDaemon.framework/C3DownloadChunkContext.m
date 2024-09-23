@implementation C3DownloadChunkContext

- (C3DownloadChunkContext)initWithMMCS:(id)a3
{
  id v4;
  C3DownloadChunkContext *v5;
  C3DownloadChunkContext *v6;
  uint64_t v7;
  NSMutableDictionary *signatureToMutableData;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)C3DownloadChunkContext;
  v5 = -[C3DownloadChunkContext init](&v10, sel_init);
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_MMCS, v4);
    v7 = objc_opt_new();
    signatureToMutableData = v6->_signatureToMutableData;
    v6->_signatureToMutableData = (NSMutableDictionary *)v7;

  }
  return v6;
}

- (CKDMMCS)MMCS
{
  return (CKDMMCS *)objc_loadWeakRetained((id *)&self->_MMCS);
}

- (void)setMMCS:(id)a3
{
  objc_storeWeak((id *)&self->_MMCS, a3);
}

- (NSMutableDictionary)signatureToMutableData
{
  return self->_signatureToMutableData;
}

- (void)setSignatureToMutableData:(id)a3
{
  objc_storeStrong((id *)&self->_signatureToMutableData, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_signatureToMutableData, 0);
  objc_destroyWeak((id *)&self->_MMCS);
}

@end
