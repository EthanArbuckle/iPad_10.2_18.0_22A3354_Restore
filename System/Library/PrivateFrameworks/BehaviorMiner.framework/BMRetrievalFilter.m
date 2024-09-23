@implementation BMRetrievalFilter

+ (id)filterWithOperand:(int64_t)a3 inclusionOperator:(int64_t)a4 items:(id)a5
{
  id v7;
  BMRetrievalFilter *v8;

  v7 = a5;
  v8 = objc_alloc_init(BMRetrievalFilter);
  -[BMRetrievalFilter setOperand:](v8, "setOperand:", a3);
  -[BMRetrievalFilter setInclusionOperator:](v8, "setInclusionOperator:", a4);
  -[BMRetrievalFilter setItems:](v8, "setItems:", v7);

  return v8;
}

+ (id)filterWithOperand:(int64_t)a3 inclusionOperator:(int64_t)a4 types:(id)a5
{
  id v7;
  BMRetrievalFilter *v8;

  v7 = a5;
  v8 = objc_alloc_init(BMRetrievalFilter);
  -[BMRetrievalFilter setOperand:](v8, "setOperand:", a3);
  -[BMRetrievalFilter setInclusionOperator:](v8, "setInclusionOperator:", a4);
  -[BMRetrievalFilter setTypes:](v8, "setTypes:", v7);

  return v8;
}

- (id)rulePredicate
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  const __CFString *v7;
  int64_t v8;
  int64_t v9;
  id v10;
  const __CFString *v11;
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
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  void *v29;
  uint64_t v31;
  uint64_t v32;
  _QWORD v33[2];
  _QWORD v34[2];
  const __CFString *v35;
  const __CFString *v36;
  uint64_t v37;

  v37 = *MEMORY[0x24BDAC8D0];
  -[BMRetrievalFilter types](self, "types");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[BMRetrievalFilter types](self, "types");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(sel_identifier);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "valueForKey:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = CFSTR("typeIdentifier");
  }
  else
  {
    -[BMRetrievalFilter items](self, "items");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(sel_uniformIdentifier);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "valueForKey:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = CFSTR("uniformIdentifier");
  }

  v8 = -[BMRetrievalFilter operand](self, "operand");
  v9 = -[BMRetrievalFilter inclusionOperator](self, "inclusionOperator");
  v10 = v6;
  if (v8 == 2)
  {
    v11 = CFSTR("consequent");
LABEL_10:
    v35 = v11;
    v36 = v7;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v35, 2);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "componentsJoinedByString:", CFSTR("."));
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    switch(v9)
    {
      case 0:
        objc_msgSend(MEMORY[0x24BDD1758], "predicateWithFormat:", CFSTR("ANY %K IN %@"), v13, v10);
        goto LABEL_18;
      case 1:
        v23 = (void *)MEMORY[0x24BDD1758];
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", objc_msgSend(v10, "count"));
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "predicateWithFormat:", CFSTR("SUBQUERY(%K, $identifier, $identifier IN %@).@count == %@"), v13, v10, v24, v31, v32);
        goto LABEL_16;
      case 2:
        v25 = (void *)MEMORY[0x24BDD1758];
        v26 = objc_msgSend(v10, "count");
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", objc_msgSend(v10, "count"));
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "predicateWithFormat:", CFSTR("%K.@count == %lu AND SUBQUERY(%K, $identifier, $identifier IN %@).@count == %@"), v13, v26, v13, v10, v24);
LABEL_16:
        v20 = (void *)objc_claimAutoreleasedReturnValue();

        goto LABEL_28;
      case 3:
        objc_msgSend(MEMORY[0x24BDD1758], "predicateWithFormat:", CFSTR("SUBQUERY(%K, $identifier, $identifier IN %@).@count == 0"), v13, v10);
LABEL_18:
        v22 = objc_claimAutoreleasedReturnValue();
        goto LABEL_19;
      default:
        objc_msgSend(MEMORY[0x24BDD1758], "predicateWithValue:", 0);
        v22 = objc_claimAutoreleasedReturnValue();
LABEL_19:
        v20 = (void *)v22;
        break;
    }
    goto LABEL_28;
  }
  v11 = CFSTR("antecedent");
  if (v8 == 1)
    goto LABEL_10;
  if (!v8)
  {
    v35 = CFSTR("antecedent");
    v36 = v7;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v35, 2);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "componentsJoinedByString:", CFSTR("."));
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    v34[0] = CFSTR("consequent");
    v34[1] = v7;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v34, 2);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "componentsJoinedByString:", CFSTR("."));
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    switch(v9)
    {
      case 0:
        objc_msgSend(MEMORY[0x24BDD1758], "predicateWithFormat:", CFSTR("ANY %K IN %@"), v13, v10);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x24BDD1758], "predicateWithFormat:", CFSTR("ANY %K IN %@"), v15, v10);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = (void *)MEMORY[0x24BDD14C0];
        v33[0] = v16;
        v33[1] = v17;
        objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v33, 2);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "orPredicateWithSubpredicates:", v19);
        v20 = (void *)objc_claimAutoreleasedReturnValue();

        goto LABEL_23;
      case 1:
        v28 = (void *)MEMORY[0x24BDD1758];
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", objc_msgSend(v10, "count"));
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v28, "predicateWithFormat:", CFSTR("SUBQUERY(%K, $identifier, $identifier IN %@).@count + SUBQUERY(%K, $identifier, $identifier IN %@).@count == %@"), v13, v10, v15, v10, v16);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        goto LABEL_24;
      case 2:
        v29 = (void *)MEMORY[0x24BDD1758];
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", objc_msgSend(v10, "count"));
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", objc_msgSend(v10, "count"));
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v29, "predicateWithFormat:", CFSTR("SUBQUERY(%K, $identifier, TRUEPREDICATE).@count + SUBQUERY(%K, $identifier, TRUEPREDICATE).@count == %@ AND SUBQUERY(%K, $identifier, $identifier IN %@).@count + SUBQUERY(%K, $identifier, $identifier IN %@).@count == %@"), v13, v15, v16, v13, v10, v15, v10, v17);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_23:

LABEL_24:
        goto LABEL_27;
      case 3:
        objc_msgSend(MEMORY[0x24BDD1758], "predicateWithFormat:", CFSTR("SUBQUERY(%K, $identifier, $identifier IN %@).@count + SUBQUERY(%K, $identifier, $identifier IN %@).@count == 0"), v13, v10, v15, v10);
        v27 = objc_claimAutoreleasedReturnValue();
        goto LABEL_26;
      default:
        objc_msgSend(MEMORY[0x24BDD1758], "predicateWithValue:", 0);
        v27 = objc_claimAutoreleasedReturnValue();
LABEL_26:
        v20 = (void *)v27;
LABEL_27:

        break;
    }
LABEL_28:

    goto LABEL_29;
  }
  v20 = 0;
LABEL_29:

  return v20;
}

- (int64_t)operand
{
  return self->_operand;
}

- (void)setOperand:(int64_t)a3
{
  self->_operand = a3;
}

- (int64_t)inclusionOperator
{
  return self->_inclusionOperator;
}

- (void)setInclusionOperator:(int64_t)a3
{
  self->_inclusionOperator = a3;
}

- (NSSet)items
{
  return self->_items;
}

- (void)setItems:(id)a3
{
  objc_storeStrong((id *)&self->_items, a3);
}

- (NSSet)types
{
  return self->_types;
}

- (void)setTypes:(id)a3
{
  objc_storeStrong((id *)&self->_types, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_types, 0);
  objc_storeStrong((id *)&self->_items, 0);
}

@end
