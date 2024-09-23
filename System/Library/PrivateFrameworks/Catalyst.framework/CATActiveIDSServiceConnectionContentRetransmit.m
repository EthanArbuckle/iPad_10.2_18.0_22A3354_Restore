@implementation CATActiveIDSServiceConnectionContentRetransmit

- (CATActiveIDSServiceConnectionContentRetransmit)initWithSequenceNumbers:(id)a3
{
  id v4;
  CATActiveIDSServiceConnectionContentRetransmit *v5;
  uint64_t v6;
  NSArray *sequenceNumbers;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CATActiveIDSServiceConnectionContentRetransmit;
  v5 = -[CATActiveIDSServiceConnectionContentRetransmit init](&v9, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    sequenceNumbers = v5->_sequenceNumbers;
    v5->_sequenceNumbers = (NSArray *)v6;

  }
  return v5;
}

- (int64_t)contentType
{
  return 6;
}

- (NSDictionary)dictionaryValue
{
  void *v2;
  void *v3;
  const __CFString *v5;
  _QWORD v6[2];

  v6[1] = *MEMORY[0x24BDAC8D0];
  v5 = CFSTR("SequenceNumbers");
  -[CATActiveIDSServiceConnectionContentRetransmit sequenceNumbers](self, "sequenceNumbers");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = v2;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v6, &v5, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDictionary *)v3;
}

+ (id)instanceWithDictionary:(id)a3
{
  void *v4;
  void *v5;
  id v6;
  void *v7;

  objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("SequenceNumbers"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v5 = v4;
  else
    v5 = 0;
  v6 = v5;

  if (v6)
    v7 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithSequenceNumbers:", v6);
  else
    v7 = 0;

  return v7;
}

- (NSArray)sequenceNumbers
{
  return self->_sequenceNumbers;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sequenceNumbers, 0);
}

@end
