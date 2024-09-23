@implementation CPLTransferSpeedFormatter

- (CPLTransferSpeedFormatter)init
{
  CPLTransferSpeedFormatter *v2;
  NSByteCountFormatter *v3;
  NSByteCountFormatter *byteCountFormatter;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)CPLTransferSpeedFormatter;
  v2 = -[CPLTransferSpeedFormatter init](&v6, sel_init);
  if (v2)
  {
    v3 = (NSByteCountFormatter *)objc_alloc_init(MEMORY[0x1E0CB34E8]);
    byteCountFormatter = v2->_byteCountFormatter;
    v2->_byteCountFormatter = v3;

    -[NSByteCountFormatter setCountStyle:](v2->_byteCountFormatter, "setCountStyle:", 3);
  }
  return v2;
}

- (id)stringForObjectValue:(id)a3
{
  objc_class *v4;
  id v5;
  id v6;
  void *v7;
  void *v8;

  v4 = (objc_class *)MEMORY[0x1E0CB3940];
  v5 = a3;
  v6 = [v4 alloc];
  -[NSByteCountFormatter stringForObjectValue:](self->_byteCountFormatter, "stringForObjectValue:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = (void *)objc_msgSend(v6, "initWithFormat:", CFSTR("%@/s"), v7);
  return v8;
}

- (NSByteCountFormatter)byteCountFormatter
{
  return self->_byteCountFormatter;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_byteCountFormatter, 0);
}

@end
