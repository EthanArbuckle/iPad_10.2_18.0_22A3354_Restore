@implementation AXRequest

- (AXRequest)initWithTechnology:(id)a3
{
  id v3;
  AXRequest *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)AXRequest;
  v3 = a3;
  v4 = -[AXRequest init](&v6, sel_init);
  -[AXRequest setTechnology:](v4, "setTechnology:", v3, v6.receiver, v6.super_class);

  return v4;
}

- (id)copyWithZone:(_NSZone *)a3
{
  AXRequest *v3;
  AXRequest *v4;
  void *v5;
  objc_super v7;

  v3 = self;
  v7.receiver = v3;
  v7.super_class = (Class)AXRequest;
  v4 = -[AXRequest init](&v7, sel_init);
  -[AXRequest technology](v3, "technology");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[AXRequest setTechnology:](v4, "setTechnology:", v5);

  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[AXRequest technology](self, "technology");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("technology"));

}

- (AXRequest)initWithCoder:(id)a3
{
  id v4;
  AXRequest *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = -[AXRequest init](self, "init");
  v6 = (void *)MEMORY[0x24BDBCF20];
  v11[0] = objc_opt_class();
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v11, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setWithArray:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v8, CFSTR("technology"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  -[AXRequest setTechnology:](v5, "setTechnology:", v9);
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  unsigned __int8 v7;
  objc_super v9;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v4, "technology");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    -[AXRequest technology](self, "technology");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v5, "isEqualToString:", v6);

  }
  else
  {
    v9.receiver = self;
    v9.super_class = (Class)AXRequest;
    v7 = -[AXRequest isEqual:](&v9, sel_isEqual_, v4);

  }
  return v7;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (AXRequest)currentRequest
{
  uint64_t (*v2)(void);
  unint64_t v3;
  _Unwind_Exception *v5;
  _QWORD v6[5];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  void *v10;

  v7 = 0;
  v8 = &v7;
  v9 = 0x2020000000;
  v2 = (uint64_t (*)(void))getAXRequestingClientSymbolLoc_ptr;
  v10 = getAXRequestingClientSymbolLoc_ptr;
  if (!getAXRequestingClientSymbolLoc_ptr)
  {
    v6[0] = MEMORY[0x24BDAC760];
    v6[1] = 3221225472;
    v6[2] = __getAXRequestingClientSymbolLoc_block_invoke;
    v6[3] = &unk_24C1B8518;
    v6[4] = &v7;
    __getAXRequestingClientSymbolLoc_block_invoke((uint64_t)v6);
    v2 = (uint64_t (*)(void))v8[3];
  }
  _Block_object_dispose(&v7, 8);
  if (!v2)
  {
    v5 = (_Unwind_Exception *)AXAnimatedImagesEnabled_cold_1();
    _Block_object_dispose(&v7, 8);
    _Unwind_Resume(v5);
  }
  v3 = v2() - 1;
  if (v3 <= 0x11 && ((0x2461Fu >> v3) & 1) != 0)
    return -[AXRequest initWithTechnology:]([AXRequest alloc], "initWithTechnology:", *off_24C1B8580[v3]);
  else
    return (AXRequest *)0;
}

- (NSString)technology
{
  return self->_technology;
}

- (void)setTechnology:(id)a3
{
  objc_storeStrong((id *)&self->_technology, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_technology, 0);
}

@end
