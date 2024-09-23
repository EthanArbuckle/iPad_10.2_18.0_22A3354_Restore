@implementation HMDStructuredDataFoundationReader

- (void)failWithError:(id)a3
{
  NSEnumerator *enumerator;
  NSDictionary *dictionary;
  NSMutableArray *stack;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)HMDStructuredDataFoundationReader;
  -[HMDTokenBasedStructuredReader failWithError:](&v7, sel_failWithError_, a3);
  enumerator = self->_enumerator;
  self->_enumerator = 0;

  dictionary = self->_dictionary;
  self->_dictionary = 0;

  stack = self->_stack;
  self->_stack = 0;

}

- (_HMDStructuredDataToken)nextTokenAfterToken:(const _HMDStructuredDataToken *)a3
{
  void *v4;
  char v5;
  NSDictionary *dictionary;
  NSEnumerator *v7;
  NSEnumerator *enumerator;
  id v9;
  void *v10;
  void *v11;
  NSDictionary *v12;
  NSDictionary *v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  NSEnumerator *v18;
  NSEnumerator *v19;
  CFTypeID v20;
  objc_class *v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  NSEnumerator *v31;
  NSMutableArray *stack;
  NSEnumerator *v33;
  NSEnumerator *v34;
  int64_t v35;
  void *v36;
  _HMDStructuredDataToken result;

  if (a3 && a3->type == 5)
  {
    -[NSDictionary objectForKeyedSubscript:](self->_dictionary, "objectForKeyedSubscript:", a3->value);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = 1;
    if (!v4)
      goto LABEL_4;
  }
  else
  {
    -[NSEnumerator nextObject](self->_enumerator, "nextObject");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = 0;
    if (!v4)
    {
LABEL_4:
      if (-[NSMutableArray count](self->_stack, "count"))
      {
        dictionary = self->_dictionary;
        -[NSMutableArray lastObject](self->_stack, "lastObject");
        v7 = (NSEnumerator *)objc_claimAutoreleasedReturnValue();
        enumerator = self->_enumerator;
        self->_enumerator = v7;

        -[NSMutableArray removeLastObject](self->_stack, "removeLastObject");
        -[NSMutableArray lastObject](self->_stack, "lastObject");
        v9 = (id)objc_claimAutoreleasedReturnValue();
        v10 = v9;
        if ((id)*MEMORY[0x24BDBD430] == v9)
          v11 = 0;
        else
          v11 = v9;
        v12 = v11;

        v13 = self->_dictionary;
        self->_dictionary = v12;

        -[NSMutableArray removeLastObject](self->_stack, "removeLastObject");
        v14 = 0;
        if (dictionary)
          v15 = 4;
        else
          v15 = 2;
      }
      else
      {
        v31 = self->_enumerator;
        self->_enumerator = 0;

        stack = self->_stack;
        self->_stack = 0;

        v14 = 0;
        v15 = -1;
      }
      goto LABEL_23;
    }
  }
  if (!self->_dictionary)
    v5 = 1;
  if ((v5 & 1) != 0)
  {
    v16 = +[HMDStructuredDataFoundationReader tokenForValue:]((uint64_t)HMDStructuredDataFoundationReader, v4);
    v14 = v17;
    if (v16 == 3)
    {
      -[HMDStructuredDataFoundationReader _push]((uint64_t)self);
      objc_storeStrong((id *)&self->_dictionary, v4);
      -[NSDictionary keyEnumerator](self->_dictionary, "keyEnumerator");
      v33 = (NSEnumerator *)objc_claimAutoreleasedReturnValue();
      v34 = self->_enumerator;
      self->_enumerator = v33;

      v15 = 3;
    }
    else
    {
      v15 = v16;
      if (v16 == 1)
      {
        -[HMDStructuredDataFoundationReader _push]((uint64_t)self);
        objc_msgSend(v4, "objectEnumerator");
        v18 = (NSEnumerator *)objc_claimAutoreleasedReturnValue();
        v19 = self->_enumerator;
        self->_enumerator = v18;

        v15 = 1;
      }
    }
  }
  else
  {
    v20 = CFGetTypeID(v4);
    if (v20 == CFStringGetTypeID())
    {
      v14 = v4;
      v15 = 5;
    }
    else
    {
      v21 = (objc_class *)objc_opt_class();
      NSStringFromClass(v21);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = HMDStructuredDataErrorWithReason(CFSTR("Invalid (non-string) key type in structured data: %@"), v23, v24, v25, v26, v27, v28, v29, (uint64_t)v22);
      v14 = v30;

    }
  }
LABEL_23:

  v35 = v15;
  v36 = v14;
  result.value = v36;
  result.type = v35;
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_stack, 0);
  objc_storeStrong((id *)&self->_dictionary, 0);
  objc_storeStrong((id *)&self->_enumerator, 0);
}

+ (uint64_t)tokenForValue:(uint64_t)a1
{
  id v2;
  CFTypeID v3;
  uint64_t v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  objc_class *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;

  v2 = a2;
  objc_opt_self();
  if (tokenForValue__once != -1)
    dispatch_once(&tokenForValue__once, &__block_literal_global_66539);
  v3 = CFGetTypeID(v2);
  if (v3 == tokenForValue__arrayTypeID)
  {
    v4 = objc_msgSend(v2, "count");
    if (v4 == -1)
    {
      v6 = 1;
      goto LABEL_27;
    }
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", v4);
    v5 = (id)objc_claimAutoreleasedReturnValue();
    v6 = 1;
    goto LABEL_9;
  }
  if (v3 == tokenForValue__dictionaryTypeID)
  {
    v7 = objc_msgSend(v2, "count");
    if (v7 == -1)
    {
      v6 = 3;
      goto LABEL_27;
    }
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", v7);
    v5 = (id)objc_claimAutoreleasedReturnValue();
    v6 = 3;
LABEL_9:

    goto LABEL_27;
  }
  if (v3 == tokenForValue__nullTypeID)
  {
    v6 = 6;
  }
  else if (v3 == tokenForValue__BOOLeanTypeID)
  {
    v8 = objc_msgSend(v2, "BOOLValue");
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v8);
    objc_claimAutoreleasedReturnValue();
    v6 = 7;
  }
  else if (v3 == tokenForValue__stringTypeID)
  {
    v2;
    v6 = 8;
  }
  else if (v3 == tokenForValue__numberTypeID)
  {
    v2;
    v6 = 9;
  }
  else if (v3 == tokenForValue__dataTypeID)
  {
    v2;
    v6 = 10;
  }
  else if (v3 == tokenForValue__dateTypeID)
  {
    v2;
    v6 = 11;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v2;
      v6 = 12;
    }
    else
    {
      v9 = (objc_class *)objc_opt_class();
      NSStringFromClass(v9);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = HMDStructuredDataErrorWithReason(CFSTR("Invalid type in structured data: %@"), v11, v12, v13, v14, v15, v16, v17, (uint64_t)v10);

    }
  }
LABEL_27:

  return v6;
}

- (void)_push
{
  void *v2;
  void *v3;
  id v4;
  void *v5;
  void *v6;

  if (a1)
  {
    v2 = *(void **)(a1 + 40);
    v3 = *(void **)(a1 + 32);
    if (!v3)
      v3 = (void *)*MEMORY[0x24BDBD430];
    v4 = v3;
    objc_msgSend(v2, "addObject:", v4);

    v5 = *(void **)(a1 + 32);
    *(_QWORD *)(a1 + 32) = 0;

    objc_msgSend(*(id *)(a1 + 40), "addObject:", *(_QWORD *)(a1 + 24));
    v6 = *(void **)(a1 + 24);
    *(_QWORD *)(a1 + 24) = 0;

  }
}

CFTypeID __51__HMDStructuredDataFoundationReader_tokenForValue___block_invoke()
{
  CFTypeID result;

  tokenForValue__arrayTypeID = CFArrayGetTypeID();
  tokenForValue__dictionaryTypeID = CFDictionaryGetTypeID();
  tokenForValue__nullTypeID = CFNullGetTypeID();
  tokenForValue__BOOLeanTypeID = CFBooleanGetTypeID();
  tokenForValue__stringTypeID = CFStringGetTypeID();
  tokenForValue__numberTypeID = CFNumberGetTypeID();
  tokenForValue__dataTypeID = CFDataGetTypeID();
  result = CFDateGetTypeID();
  tokenForValue__dateTypeID = result;
  return result;
}

- (_QWORD)initWithInput:(_QWORD *)a1
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  id v7;
  void *v8;
  objc_super v10;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  if (a1)
  {
    v10.receiver = a1;
    v10.super_class = (Class)HMDStructuredDataFoundationReader;
    a1 = objc_msgSendSuper2(&v10, sel_init);
    if (a1)
    {
      v11[0] = v3;
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v11, 1);
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "objectEnumerator");
      v5 = objc_claimAutoreleasedReturnValue();
      v6 = (void *)a1[3];
      a1[3] = v5;

      v7 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
      v8 = (void *)a1[5];
      a1[5] = v7;

    }
  }

  return a1;
}

@end
