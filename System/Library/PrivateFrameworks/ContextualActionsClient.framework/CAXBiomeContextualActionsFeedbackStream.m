@implementation CAXBiomeContextualActionsFeedbackStream

- (CAXBiomeContextualActionsFeedbackStream)init
{
  return -[CAXBiomeContextualActionsFeedbackStream initWithStoreConfig:](self, "initWithStoreConfig:", 0);
}

- (NSString)identifier
{
  return (NSString *)CFSTR("ContextualActionsFeedback");
}

- (CAXBiomeContextualActionsFeedbackStream)initWithStoreConfig:(id)a3
{
  id v4;
  CAXBiomeContextualActionsFeedbackStream *v5;
  id v6;
  void *v7;
  uint64_t v8;
  BMStoreStream *inner;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)CAXBiomeContextualActionsFeedbackStream;
  v5 = -[CAXBiomeContextualActionsFeedbackStream init](&v11, sel_init);
  if (v5)
  {
    if (v4)
    {
      v6 = v4;
    }
    else
    {
      objc_msgSend(MEMORY[0x24BE0C9C0], "atx_storeConfig");
      v6 = (id)objc_claimAutoreleasedReturnValue();
    }
    v7 = v6;
    v8 = objc_msgSend(objc_alloc(MEMORY[0x24BE0CD88]), "initWithPrivateStreamIdentifier:storeConfig:eventDataClass:", CFSTR("ContextualActionsFeedback"), v6, objc_opt_class());
    inner = v5->_inner;
    v5->_inner = (BMStoreStream *)v8;

  }
  return v5;
}

- (id)publisherFromStartTime:(double)a3
{
  return (id)-[BMStoreStream publisherFromStartTime:](self->_inner, "publisherFromStartTime:", a3);
}

- (id)source
{
  return (id)-[BMStoreStream source](self->_inner, "source");
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_inner, 0);
}

@end
