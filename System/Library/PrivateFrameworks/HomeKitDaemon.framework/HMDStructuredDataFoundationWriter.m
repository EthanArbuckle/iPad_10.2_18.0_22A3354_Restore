@implementation HMDStructuredDataFoundationWriter

- (HMDStructuredDataFoundationWriter)init
{
  return -[HMDStructuredDataFoundationWriter initWithMutableContainers:](self, "initWithMutableContainers:", 0);
}

- (HMDStructuredDataFoundationWriter)initWithMutableContainers:(BOOL)a3
{
  HMDStructuredDataFoundationWriter *v4;
  NSMutableArray *v5;
  NSMutableArray *stack;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)HMDStructuredDataFoundationWriter;
  v4 = -[HMDStructuredDataFoundationWriter init](&v8, sel_init);
  if (v4)
  {
    v5 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    stack = v4->_stack;
    v4->_stack = v5;

    v4->_mutableContainers = a3;
  }
  return v4;
}

- (void)failWithError:(id)a3
{
  id container;
  NSString *currentKey;
  NSMutableArray *stack;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)HMDStructuredDataFoundationWriter;
  -[HMDStructuredWriter failWithError:](&v7, sel_failWithError_, a3);
  container = self->_container;
  self->_container = 0;

  currentKey = self->_currentKey;
  self->_currentKey = 0;

  stack = self->_stack;
  self->_stack = 0;

}

- (void)beginArrayOfSize:(unint64_t)a3
{
  id v5;
  id v6;

  if (self && self->_stack)
  {
    -[HMDStructuredDataFoundationWriter _push]((uint64_t)self);
    if (a3 == -1)
      v5 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
    else
      v5 = (id)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", a3);
    v6 = v5;
    objc_storeStrong(&self->_container, v5);

  }
}

- (void)endArray
{
  void *v3;
  uint64_t v4;
  id v5;
  id v6;

  v5 = self->_container;
  -[HMDStructuredDataFoundationWriter _pop]((uint64_t)self);
  if (self->_mutableContainers)
  {
    v3 = v5;
  }
  else
  {
    v4 = objc_msgSend(v5, "copy");

    v3 = (void *)v4;
  }
  v6 = v3;
  -[HMDStructuredDataFoundationWriter _emit:](self, v3);

}

- (void)beginDictionaryOfSize:(unint64_t)a3
{
  id v5;
  id v6;

  if (self && self->_stack)
  {
    -[HMDStructuredDataFoundationWriter _push]((uint64_t)self);
    if (a3 == -1)
      v5 = objc_alloc_init(MEMORY[0x24BDBCED8]);
    else
      v5 = (id)objc_msgSend(objc_alloc(MEMORY[0x24BDBCED8]), "initWithCapacity:", a3);
    v6 = v5;
    objc_storeStrong(&self->_container, v5);

  }
}

- (void)writeDictionaryKey:(id)a3
{
  objc_storeStrong((id *)&self->_currentKey, a3);
}

- (void)endDictionary
{
  void *v3;
  uint64_t v4;
  id v5;
  id v6;

  v5 = self->_container;
  -[HMDStructuredDataFoundationWriter _pop]((uint64_t)self);
  if (self->_mutableContainers)
  {
    v3 = v5;
  }
  else
  {
    v4 = objc_msgSend(v5, "copy");

    v3 = (void *)v4;
  }
  v6 = v3;
  -[HMDStructuredDataFoundationWriter _emit:](self, v3);

}

- (void)writeNull
{
  id v3;

  objc_msgSend(MEMORY[0x24BDBCEF8], "null");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  -[HMDStructuredDataFoundationWriter _emit:](self, v3);

}

- (void)writeBoolean:(BOOL)a3
{
  id v4;

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[HMDStructuredDataFoundationWriter _emit:](self, v4);

}

- (void)writeString:(id)a3
{
  -[HMDStructuredDataFoundationWriter _emit:](self, a3);
}

- (void)writeNumber:(id)a3
{
  -[HMDStructuredDataFoundationWriter _emit:](self, a3);
}

- (void)writeData:(id)a3
{
  -[HMDStructuredDataFoundationWriter _emit:](self, a3);
}

- (void)writeDate:(id)a3
{
  -[HMDStructuredDataFoundationWriter _emit:](self, a3);
}

- (void)writeUUID:(id)a3
{
  -[HMDStructuredDataFoundationWriter _emit:](self, a3);
}

- (void)writeLogicalValue:(id)a3 validateAndCopy:(BOOL)a4
{
  id v6;
  void *v7;
  HMDStructuredDataFoundationWriter *v8;
  SEL v9;
  id v10;
  objc_super v11;

  v6 = a3;
  v7 = v6;
  if (a4)
  {
    v11.receiver = self;
    v11.super_class = (Class)HMDStructuredDataFoundationWriter;
    -[HMDStructuredWriter writeLogicalValue:validateAndCopy:](&v11, sel_writeLogicalValue_validateAndCopy_, v6, 1);
  }
  else
  {
    if (!v6)
    {
      v8 = (HMDStructuredDataFoundationWriter *)_HMFPreconditionFailure();
      -[HMDStructuredDataFoundationWriter emitRootValue:](v8, v9, v10);
    }
    -[HMDStructuredDataFoundationWriter _emit:](self, v6);
  }

}

- (void)emitRootValue:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v4 = a3;
  v5 = (void *)MEMORY[0x24BDBCE88];
  v6 = *MEMORY[0x24BDBCAB0];
  v7 = (void *)MEMORY[0x24BDD17C8];
  NSStringFromSelector(a2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "stringWithFormat:", CFSTR("You must override %@ in a subclass"), v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "exceptionWithName:reason:userInfo:", v6, v9, 0);
  v10 = (id)objc_claimAutoreleasedReturnValue();

  objc_exception_throw(v10);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_stack, 0);
  objc_storeStrong((id *)&self->_currentKey, 0);
  objc_storeStrong(&self->_container, 0);
}

- (void)_emit:(_QWORD *)a1
{
  id v3;
  void *v4;
  void *v5;
  id v6;

  v3 = a2;
  if (a1)
  {
    v4 = (void *)a1[2];
    v6 = v3;
    if (v4)
    {
      if (a1[3])
      {
        objc_msgSend(v4, "setValue:forKey:", v3);
        v5 = (void *)a1[3];
        a1[3] = 0;

      }
      else
      {
        objc_msgSend(v4, "addObject:", v3);
      }
      goto LABEL_8;
    }
    if (a1[4])
    {
      objc_msgSend(a1, "emitRootValue:", v3);
LABEL_8:
      v3 = v6;
    }
  }

}

- (void)_pop
{
  id v2;
  void *v3;
  void *v4;
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;

  if (a1)
  {
    if (objc_msgSend(*(id *)(a1 + 32), "count"))
    {
      objc_msgSend(*(id *)(a1 + 32), "lastObject");
      v2 = (id)objc_claimAutoreleasedReturnValue();
      v3 = v2;
      if ((id)*MEMORY[0x24BDBD430] == v2)
        v4 = 0;
      else
        v4 = v2;
      v5 = v4;

      v6 = *(void **)(a1 + 24);
      *(_QWORD *)(a1 + 24) = v5;

      objc_msgSend(*(id *)(a1 + 32), "removeLastObject");
      objc_msgSend(*(id *)(a1 + 32), "lastObject");
      v7 = objc_claimAutoreleasedReturnValue();
      v8 = *(void **)(a1 + 16);
      *(_QWORD *)(a1 + 16) = v7;

      objc_msgSend(*(id *)(a1 + 32), "removeLastObject");
    }
    else
    {
      v9 = *(void **)(a1 + 24);
      *(_QWORD *)(a1 + 24) = 0;

      v10 = *(void **)(a1 + 16);
      *(_QWORD *)(a1 + 16) = 0;

    }
  }
}

- (void)_push
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  void *v6;

  if (*(_QWORD *)(a1 + 16))
  {
    objc_msgSend(*(id *)(a1 + 32), "addObject:");
    v2 = *(void **)(a1 + 16);
    *(_QWORD *)(a1 + 16) = 0;

    v3 = *(void **)(a1 + 32);
    v4 = *(void **)(a1 + 24);
    if (!v4)
      v4 = (void *)*MEMORY[0x24BDBD430];
    v5 = v4;
    objc_msgSend(v3, "addObject:", v5);

    v6 = *(void **)(a1 + 24);
    *(_QWORD *)(a1 + 24) = 0;

  }
}

@end
