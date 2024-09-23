@implementation DTGPURawCounter_GPURawCounter

- (DTGPURawCounter_GPURawCounter)initWithName:(id)a3 width:(unsigned int)a4
{
  id v6;
  DTGPURawCounter_GPURawCounter *v7;
  DTGPURawCounter_GPURawCounter *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  GPURawCounterSelect *rawCounterSelect;
  objc_super v16;
  const __CFString *v17;
  _QWORD v18[2];

  v18[1] = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v16.receiver = self;
  v16.super_class = (Class)DTGPURawCounter_GPURawCounter;
  v7 = -[DTGPURawCounter initWithName:](&v16, sel_initWithName_, v6);
  v8 = v7;
  if (v7)
  {
    v7->_width = a4;
    v9 = (void *)MEMORY[0x24BE38F60];
    -[DTGPURawCounter name](v7, "name");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = CFSTR("Width");
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", v8->_width);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v18[0] = v11;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v18, &v17, 1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "selectWithName:options:", v10, v12);
    v13 = objc_claimAutoreleasedReturnValue();
    rawCounterSelect = v8->_rawCounterSelect;
    v8->_rawCounterSelect = (GPURawCounterSelect *)v13;

  }
  return v8;
}

- (DTGPURawCounter_GPURawCounter)initWithName:(id)a3
{
  id v4;
  DTGPURawCounter_GPURawCounter *v5;
  DTGPURawCounter_GPURawCounter *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  GPURawCounterSelect *rawCounterSelect;
  objc_super v14;
  const __CFString *v15;
  _QWORD v16[2];

  v16[1] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)DTGPURawCounter_GPURawCounter;
  v5 = -[DTGPURawCounter initWithName:](&v14, sel_initWithName_, v4);
  v6 = v5;
  if (v5)
  {
    v5->_width = 32;
    v7 = (void *)MEMORY[0x24BE38F60];
    -[DTGPURawCounter name](v5, "name");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = CFSTR("Width");
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", v6->_width);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v16[0] = v9;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v16, &v15, 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "selectWithName:options:", v8, v10);
    v11 = objc_claimAutoreleasedReturnValue();
    rawCounterSelect = v6->_rawCounterSelect;
    v6->_rawCounterSelect = (GPURawCounterSelect *)v11;

  }
  return v6;
}

- (unint64_t)sourceIdx
{
  return self->_sourceIdx;
}

- (void)setSourceIdx:(unint64_t)a3
{
  self->_sourceIdx = a3;
}

- (unint64_t)counterIdx
{
  return self->_counterIdx;
}

- (void)setCounterIdx:(unint64_t)a3
{
  self->_counterIdx = a3;
}

- (unsigned)width
{
  return self->_width;
}

- (void)setWidth:(unsigned int)a3
{
  self->_width = a3;
}

- (unint64_t)valueType
{
  return self->_valueType;
}

- (void)setValueType:(unint64_t)a3
{
  self->_valueType = a3;
}

- (GPURawCounterSelect)rawCounterSelect
{
  return self->_rawCounterSelect;
}

- (void)setRawCounterSelect:(id)a3
{
  objc_storeStrong((id *)&self->_rawCounterSelect, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rawCounterSelect, 0);
}

@end
