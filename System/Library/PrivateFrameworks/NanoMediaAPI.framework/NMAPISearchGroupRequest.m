@implementation NMAPISearchGroupRequest

- (id)urlComponentsWithStoreURLBag:(id)a3 error:(id *)a4
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  objc_super v23;
  _QWORD v24[2];

  v24[1] = *MEMORY[0x24BDAC8D0];
  v23.receiver = self;
  v23.super_class = (Class)NMAPISearchGroupRequest;
  -[NMAPIURLRequest urlComponentsWithStoreURLBag:error:](&v23, sel_urlComponentsWithStoreURLBag_error_, a3, a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (self->_resultsPerSection)
  {
    objc_msgSend(v5, "queryItems");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD1758], "predicateWithBlock:", &__block_literal_global_0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "filteredArrayUsingPredicate:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setQueryItems:", v9);

    v10 = (void *)MEMORY[0x24BDD1838];
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", self->_resultsPerSection);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "stringValue");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "queryItemWithName:value:", CFSTR("limit"), v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v6, "queryItems");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "arrayByAddingObject:", v13);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setQueryItems:", v15);

  }
  objc_msgSend(v6, "queryItems");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = (void *)MEMORY[0x24BDD1838];
  objc_msgSend(&unk_24DD2C740, "componentsJoinedByString:", CFSTR(","));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "queryItemWithName:value:", CFSTR("with"), v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v24[0] = v19;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v24, 1);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "arrayByAddingObjectsFromArray:", v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setQueryItems:", v21);

  return v6;
}

uint64_t __62__NMAPISearchGroupRequest_urlComponentsWithStoreURLBag_error___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  uint64_t v3;

  objc_msgSend(a2, "name");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isEqualToString:", CFSTR("limit")) ^ 1;

  return v3;
}

- (Class)responseParserClass
{
  return (Class)objc_opt_class();
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)NMAPISearchGroupRequest;
  result = -[NMAPIURLRequest copyWithZone:](&v5, sel_copyWithZone_, a3);
  if (result)
    *((_QWORD *)result + 17) = self->_resultsPerSection;
  return result;
}

- (unint64_t)resultsPerSection
{
  return self->_resultsPerSection;
}

- (void)setResultsPerSection:(unint64_t)a3
{
  self->_resultsPerSection = a3;
}

@end
