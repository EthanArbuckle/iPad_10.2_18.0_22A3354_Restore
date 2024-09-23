@implementation IRMiLoPredictionEventDO

- (IRMiLoPredictionEventDO)initWithLabel:(id)a3 predictionId:(id)a4
{
  id v7;
  id v8;
  IRMiLoPredictionEventDO *v9;
  IRMiLoPredictionEventDO *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)IRMiLoPredictionEventDO;
  v9 = -[IRMiLoPredictionEventDO init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_label, a3);
    objc_storeStrong((id *)&v10->_predictionId, a4);
  }

  return v10;
}

+ (IRMiLoPredictionEventDO)miLoPredictionEventDOWithLabel:(id)a3 predictionId:(id)a4
{
  id v6;
  id v7;
  void *v8;

  v6 = a4;
  v7 = a3;
  v8 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithLabel:predictionId:", v7, v6);

  return (IRMiLoPredictionEventDO *)v8;
}

- (id)copyWithReplacementLabel:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithLabel:predictionId:", v4, self->_predictionId);

  return v5;
}

- (id)copyWithReplacementPredictionId:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithLabel:predictionId:", self->_label, v4);

  return v5;
}

- (BOOL)isEqualToMiLoPredictionEventDO:(id)a3
{
  id v4;
  void *v5;
  int v6;
  void *v7;
  int v8;
  NSString *label;
  void *v10;
  int v11;
  int v12;
  void *v13;
  int v14;
  NSString *predictionId;
  void *v16;
  char v17;

  v4 = a3;
  v5 = v4;
  if (!v4)
    goto LABEL_8;
  v6 = self->_label != 0;
  objc_msgSend(v4, "label");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7 == 0;

  if (v6 == v8)
    goto LABEL_8;
  label = self->_label;
  if (label)
  {
    objc_msgSend(v5, "label");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = -[NSString isEqual:](label, "isEqual:", v10);

    if (!v11)
      goto LABEL_8;
  }
  v12 = self->_predictionId != 0;
  objc_msgSend(v5, "predictionId");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v13 == 0;

  if (v12 == v14)
  {
LABEL_8:
    v17 = 0;
  }
  else
  {
    predictionId = self->_predictionId;
    if (predictionId)
    {
      objc_msgSend(v5, "predictionId");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = -[NSString isEqual:](predictionId, "isEqual:", v16);

    }
    else
    {
      v17 = 1;
    }
  }

  return v17;
}

- (BOOL)isEqual:(id)a3
{
  IRMiLoPredictionEventDO *v4;
  IRMiLoPredictionEventDO *v5;
  BOOL v6;

  v4 = (IRMiLoPredictionEventDO *)a3;
  v5 = v4;
  if (v4 == self)
    v6 = 1;
  else
    v6 = v4
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && -[IRMiLoPredictionEventDO isEqualToMiLoPredictionEventDO:](self, "isEqualToMiLoPredictionEventDO:", v5);

  return v6;
}

- (unint64_t)hash
{
  NSUInteger v3;

  v3 = -[NSString hash](self->_label, "hash");
  return -[NSString hash](self->_predictionId, "hash") - v3 + 32 * v3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (IRMiLoPredictionEventDO)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  objc_class *v6;
  void *v7;
  objc_class *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  IRMiLoPredictionEventDO *v14;
  objc_class *v15;
  objc_class *v16;
  void *v17;
  void *v18;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  _QWORD v23[2];

  v23[1] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("label"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v6 = (objc_class *)objc_opt_class();
      NSStringFromClass(v6);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = (objc_class *)objc_opt_class();
      NSStringFromClass(v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithFormat:", CFSTR("Unarchived unexpected class for IRMiLoPredictionEventDO key \"label\" (expected %@, decoded %@)"), v7, v9, 0);
      v22 = *MEMORY[0x24BDD0FC8];
      v23[0] = v10;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v23, &v22, 1);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1540]), "initWithDomain:code:userInfo:", CFSTR("IRMiLoPredictionEventDOOCNTErrorDomain"), 3, v11);
      objc_msgSend(v4, "failWithError:", v12);
LABEL_9:

LABEL_10:
      v14 = 0;
LABEL_13:

      goto LABEL_14;
    }
LABEL_6:
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("predictionId"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        v15 = (objc_class *)objc_opt_class();
        NSStringFromClass(v15);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = (objc_class *)objc_opt_class();
        NSStringFromClass(v16);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithFormat:", CFSTR("Unarchived unexpected class for IRMiLoPredictionEventDO key \"predictionId\" (expected %@, decoded %@)"), v9, v10, 0);
        v20 = *MEMORY[0x24BDD0FC8];
        v21 = v11;
        objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v21, &v20, 1);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1540]), "initWithDomain:code:userInfo:", CFSTR("IRMiLoPredictionEventDOOCNTErrorDomain"), 3, v12);
        objc_msgSend(v4, "failWithError:", v17);

        goto LABEL_9;
      }
    }
    else
    {
      objc_msgSend(v4, "error");
      v18 = (void *)objc_claimAutoreleasedReturnValue();

      if (v18)
        goto LABEL_10;
    }
    self = -[IRMiLoPredictionEventDO initWithLabel:predictionId:](self, "initWithLabel:predictionId:", v5, v7);
    v14 = self;
    goto LABEL_13;
  }
  objc_msgSend(v4, "error");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v13)
    goto LABEL_6;
  v14 = 0;
LABEL_14:

  return v14;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  NSString *label;
  NSString *predictionId;
  id v7;

  v4 = a3;
  label = self->_label;
  v7 = v4;
  if (label)
  {
    objc_msgSend(v4, "encodeObject:forKey:", label, CFSTR("label"));
    v4 = v7;
  }
  predictionId = self->_predictionId;
  if (predictionId)
  {
    objc_msgSend(v7, "encodeObject:forKey:", predictionId, CFSTR("predictionId"));
    v4 = v7;
  }

}

- (id)description
{
  return (id)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithFormat:", CFSTR("<IRMiLoPredictionEventDO | label:%@ predictionId:%@>"), self->_label, self->_predictionId);
}

- (NSString)label
{
  return self->_label;
}

- (NSString)predictionId
{
  return self->_predictionId;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_predictionId, 0);
  objc_storeStrong((id *)&self->_label, 0);
}

@end
