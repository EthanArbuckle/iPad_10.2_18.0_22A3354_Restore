@implementation HMMMRequestOptions

- (HMMMRequestOptions)init
{
  return -[HMMMRequestOptions initWithTimeout:transportRestriction:](self, "initWithTimeout:transportRestriction:", 0, 2);
}

- (HMMMRequestOptions)initWithTimeout:(id)a3 transportRestriction:(int64_t)a4
{
  id v7;
  HMMMRequestOptions *v8;
  HMMMRequestOptions *v9;
  objc_super v11;

  v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)HMMMRequestOptions;
  v8 = -[HMMMRequestOptions init](&v11, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_timeout, a3);
    v9->_transportRestriction = a4;
    v9->_oneWay = 1;
  }

  return v9;
}

- (id)attributeDescriptions
{
  id v3;
  unint64_t v4;
  const __CFString *v5;
  void *v6;
  void *v7;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc(MEMORY[0x1E0D28548]);
  v4 = -[HMMMRequestOptions transportRestriction](self, "transportRestriction");
  if (v4 > 2)
    v5 = CFSTR("Unknown");
  else
    v5 = off_1E3AB0108[v4];
  v6 = (void *)objc_msgSend(v3, "initWithName:value:", CFSTR("TransportRestriction"), v5);
  v9[0] = v6;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v9, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (int64_t)transportRestriction
{
  return self->_transportRestriction;
}

- (NSNumber)timeout
{
  return self->_timeout;
}

- (BOOL)oneWay
{
  return self->_oneWay;
}

- (void)setOneWay:(BOOL)a3
{
  self->_oneWay = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timeout, 0);
}

@end
