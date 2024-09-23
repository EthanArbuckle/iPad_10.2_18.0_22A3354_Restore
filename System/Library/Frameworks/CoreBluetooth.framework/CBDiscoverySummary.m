@implementation CBDiscoverySummary

- (CBDiscoverySummary)initWithXPCObject:(id)a3 error:(id *)a4
{
  id v6;
  CBDiscoverySummary *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  CBDiscoverySummary *v14;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  objc_super v24;

  v6 = a3;
  v24.receiver = self;
  v24.super_class = (Class)CBDiscoverySummary;
  v7 = -[CBDiscoverySummary init](&v24, sel_init);
  if (!v7)
  {
    if (a4)
    {
      objc_msgSend((id)objc_opt_class(), "description");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      CBErrorF(-6756, (uint64_t)"%@ super init failed", v17, v18, v19, v20, v21, v22, (uint64_t)v16);
      *a4 = (id)objc_claimAutoreleasedReturnValue();

      v14 = 0;
      goto LABEL_5;
    }
LABEL_10:
    v14 = 0;
    goto LABEL_5;
  }
  if (MEMORY[0x1A85D2194](v6) != MEMORY[0x1E0C812F8])
  {
    if (a4)
    {
      CBErrorF(-6756, (uint64_t)"XPC non-dict", v8, v9, v10, v11, v12, v13, v23);
      v14 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_5;
    }
    goto LABEL_10;
  }
  if (!CUXPCDecodeDouble())
    goto LABEL_10;
  v14 = v7;
LABEL_5:

  return v14;
}

- (void)encodeWithXPCObject:(id)a3
{
  double scanTime;

  scanTime = self->_scanTime;
  if (scanTime != 0.0)
    xpc_dictionary_set_double(a3, "scTm", scanTime);
}

- (id)description
{
  return -[CBDiscoverySummary descriptionWithLevel:](self, "descriptionWithLevel:", 50);
}

- (id)descriptionWithLevel:(int)a3
{
  id v3;
  id v4;
  void *v6;
  void *v7;

  if ((a3 & 0x8000000) != 0)
  {
    v3 = 0;
  }
  else
  {
    objc_msgSend((id)objc_opt_class(), "description");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    CUAppendF();
    v3 = 0;

  }
  CUPrintDurationDouble();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  CUAppendF();
  v4 = v3;

  return v4;
}

- (double)scanTime
{
  return self->_scanTime;
}

- (void)setScanTime:(double)a3
{
  self->_scanTime = a3;
}

@end
