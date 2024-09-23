@implementation SUUIPropertyPredicateViewElement

- (SUUIPropertyPredicateViewElement)initWithDOMElement:(id)a3 parent:(id)a4 elementFactory:(id)a5
{
  id v8;
  SUUIPropertyPredicateViewElement *v9;
  void *v10;
  uint64_t v11;
  NSString *property;
  void *v13;
  uint64_t v14;
  NSString *value;
  void *v16;
  id v17;
  uint64_t v18;
  objc_super v20;

  v8 = a3;
  v20.receiver = self;
  v20.super_class = (Class)SUUIPropertyPredicateViewElement;
  v9 = -[SUUIViewElement initWithDOMElement:parent:elementFactory:](&v20, sel_initWithDOMElement_parent_elementFactory_, v8, a4, a5);
  if (v9)
  {
    objc_msgSend(v8, "getAttribute:", CFSTR("property"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v10, "length"))
    {
      v11 = objc_msgSend(v10, "copy");
      property = v9->_property;
      v9->_property = (NSString *)v11;

    }
    objc_msgSend(v8, "getAttribute:", CFSTR("value"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v13, "length"))
    {
      v14 = objc_msgSend(v13, "copy");
      value = v9->_value;
      v9->_value = (NSString *)v14;

    }
    objc_msgSend(v8, "getAttribute:", CFSTR("comparisonType"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v16, "length"))
    {
      v17 = v16;
      if ((objc_msgSend(v17, "isEqualToString:", CFSTR("not-equal")) & 1) != 0)
      {
        v18 = 1;
      }
      else if ((objc_msgSend(v17, "isEqualToString:", CFSTR("greater-than")) & 1) != 0)
      {
        v18 = 2;
      }
      else if ((objc_msgSend(v17, "isEqualToString:", CFSTR("greater-than-or-equal")) & 1) != 0)
      {
        v18 = 3;
      }
      else if ((objc_msgSend(v17, "isEqualToString:", CFSTR("less-than")) & 1) != 0)
      {
        v18 = 4;
      }
      else if (objc_msgSend(v17, "isEqualToString:", CFSTR("less-than-or-equal")))
      {
        v18 = 5;
      }
      else
      {
        v18 = 0;
      }

      v9->_comparisonType = v18;
    }

  }
  return v9;
}

+ (BOOL)shouldParseChildDOMElements
{
  return 0;
}

- (id)applyUpdatesWithElement:(id)a3
{
  SUUIPropertyPredicateViewElement *v4;
  SUUIPropertyPredicateViewElement *v5;
  SUUIPropertyPredicateViewElement *v6;
  void *v7;
  NSString *v8;
  NSString *property;
  void *v10;
  NSString *v11;
  NSString *value;
  objc_super v14;

  v4 = (SUUIPropertyPredicateViewElement *)a3;
  v14.receiver = self;
  v14.super_class = (Class)SUUIPropertyPredicateViewElement;
  -[SUUIViewElement applyUpdatesWithElement:](&v14, sel_applyUpdatesWithElement_, v4);
  v5 = (SUUIPropertyPredicateViewElement *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v4 != self && v5 == self)
  {
    self->_comparisonType = -[SUUIPropertyPredicateViewElement comparisonType](v4, "comparisonType");
    -[SUUIPropertyPredicateViewElement property](v4, "property");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (NSString *)objc_msgSend(v7, "copy");
    property = self->_property;
    self->_property = v8;

    -[SUUIPropertyPredicateViewElement value](v4, "value");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (NSString *)objc_msgSend(v10, "copy");
    value = self->_value;
    self->_value = v11;

  }
  return v6;
}

- (id)entityValuePredicate
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __56__SUUIPropertyPredicateViewElement_entityValuePredicate__block_invoke;
  v3[3] = &unk_2511F9E28;
  v3[4] = self;
  objc_msgSend(MEMORY[0x24BDD1758], "predicateWithBlock:", v3);
  return (id)objc_claimAutoreleasedReturnValue();
}

uint64_t __56__SUUIPropertyPredicateViewElement_entityValuePredicate__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  unint64_t v15;
  BOOL v16;

  v5 = a2;
  v6 = a3;
  if (objc_msgSend(v5, "conformsToProtocol:", &unk_25723F188))
  {
    v7 = v5;
    objc_msgSend(*(id *)(a1 + 32), "property");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "valueForEntityProperty:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(*(id *)(a1 + 32), "value");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      objc_msgSend(*(id *)(a1 + 32), "property");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "nativeValueForStringValue:forProperty:", v10, v11);
      v12 = objc_claimAutoreleasedReturnValue();

      v10 = (void *)v12;
    }
    v13 = objc_msgSend(*(id *)(a1 + 32), "comparisonType");
    if (v13 == 1)
    {
      if (v9 == v10)
        v14 = 0;
      else
        v14 = objc_msgSend(v9, "isEqual:", v10) ^ 1;
    }
    else if (v13)
    {
      v14 = 0;
      if (v9 && v10)
      {
        v15 = objc_msgSend(v9, "compare:", v10);
        switch(objc_msgSend(*(id *)(a1 + 32), "comparisonType"))
        {
          case 2:
            v14 = v15 == 1;
            break;
          case 3:
            v16 = v15 >= 2;
            goto LABEL_19;
          case 4:
          case 5:
            v16 = v15 + 1 >= 2;
LABEL_19:
            v14 = !v16;
            break;
          default:
            __56__SUUIPropertyPredicateViewElement_entityValuePredicate__block_invoke_cold_1();
        }
      }
    }
    else if (v9 == v10)
    {
      v14 = 1;
    }
    else
    {
      v14 = objc_msgSend(v9, "isEqual:", v10);
    }

  }
  else
  {
    v14 = 0;
  }

  return v14;
}

- (int64_t)comparisonType
{
  return self->_comparisonType;
}

- (NSString)property
{
  return self->_property;
}

- (NSString)value
{
  return self->_value;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_value, 0);
  objc_storeStrong((id *)&self->_property, 0);
}

void __56__SUUIPropertyPredicateViewElement_entityValuePredicate__block_invoke_cold_1()
{
  __assert_rtn("-[SUUIPropertyPredicateViewElement entityValuePredicate]_block_invoke", "SUUIPropertyPredicateViewElement.m", 87, "0");
}

@end
