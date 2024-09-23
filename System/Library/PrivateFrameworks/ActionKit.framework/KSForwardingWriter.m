@implementation KSForwardingWriter

- (KSForwardingWriter)initWithOutputWriter:(id)a3
{
  id v5;
  KSForwardingWriter *v6;
  KSForwardingWriter *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)KSForwardingWriter;
  v6 = -[KSForwardingWriter init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_writer, a3);

  return v7;
}

- (KSForwardingWriter)init
{
  return -[KSForwardingWriter initWithOutputWriter:](self, "initWithOutputWriter:", 0);
}

- (void)dealloc
{
  void *v4;
  objc_super v5;

  -[KSForwardingWriter close](self, "close");
  if (self->_writer)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("KSForwardingWriter.m"), 52, CFSTR("-close failed to dispose of output writer"));

  }
  v5.receiver = self;
  v5.super_class = (Class)KSForwardingWriter;
  -[KSForwardingWriter dealloc](&v5, sel_dealloc);
}

- (void)close
{
  KSWriter *writer;

  writer = self->_writer;
  self->_writer = 0;

}

- (void)writeString:(id)a3
{
  -[KSWriter writeString:](self->_writer, "writeString:", a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_writer, 0);
}

@end
