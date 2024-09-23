@implementation MSCriterion

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (MSCriterion)init
{

  return 0;
}

- (id)_initWithType:(id)a3 qualifier:(id)a4 criteria:(id)a5
{
  id v9;
  id v10;
  id v11;
  MSCriterion *v12;
  MSCriterion *v13;
  id *p_isa;
  id *p_type;
  id *p_criteria;
  void *v17;
  uint64_t v18;
  const __CFString *v19;
  const __CFString *v20;
  objc_super v22;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v22.receiver = self;
  v22.super_class = (Class)MSCriterion;
  v12 = -[MSCriterion init](&v22, sel_init);
  v13 = v12;
  p_isa = (id *)&v12->super.isa;
  if (v12)
  {
    p_type = (id *)&v12->_type;
    objc_storeStrong((id *)&v12->_type, a3);
    objc_storeStrong((id *)&v13->_qualifier, a4);
    p_criteria = (id *)&v13->_criteria;
    objc_storeStrong((id *)&v13->_criteria, a5);
    if (objc_msgSend(p_isa[1], "isEqual:", CFSTR("_MSCriterionTypeComplex")))
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        v17 = (void *)MEMORY[0x24BDBCE88];
        v18 = objc_opt_class();
        v19 = CFSTR("Expected array for complex type, but received %@");
LABEL_8:
        objc_msgSend(v17, "raise:format:", CFSTR("InvalidCriterionType"), v19, v18);
      }
    }
    else
    {
      if (!objc_msgSend(*p_type, "isEqual:", CFSTR("MSCriterionTypeReceivedDate")))
      {
        if (objc_msgSend(*p_type, "isEqual:", CFSTR("MSCriterionTypeReadStatus")))
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0
            && ((objc_msgSend(*p_criteria, "isEqualToString:", CFSTR("MSCriterionExpressionRead")) & 1) != 0
             || (objc_msgSend(*p_criteria, "isEqualToString:", CFSTR("MSCriterionExpressionUnread")) & 1) != 0))
          {
            goto LABEL_19;
          }
          v20 = CFSTR("Expected either MSCriterionExpressionRead or MSCriterionExpressionUnread for read status criteria type.");
        }
        else
        {
          if ((objc_msgSend(*p_type, "isEqual:", CFSTR("MSCriterionTypeMessageReference")) & 1) == 0
            && !objc_msgSend(*p_type, "isEqual:", CFSTR("MSCriterionTypeConversationReference")))
          {
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
              goto LABEL_19;
            v17 = (void *)MEMORY[0x24BDBCE88];
            v18 = objc_opt_class();
            v19 = CFSTR("Expected string for criteria, but received %@");
            goto LABEL_8;
          }
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
            goto LABEL_19;
          v20 = CFSTR("Expected a valid reference for reference criterion type");
        }
        objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", CFSTR("InvalidCriterionType"), v20);
        goto LABEL_19;
      }
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        v17 = (void *)MEMORY[0x24BDBCE88];
        v18 = objc_opt_class();
        v19 = CFSTR("Expected date for date criteria type, but received %@");
        goto LABEL_8;
      }
    }
  }
LABEL_19:

  return p_isa;
}

- (id)description
{
  return (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("<%s:%p> { type:%@ qualifier:%@ criteria:%@ }"), object_getClassName(self), self, self->_type, self->_qualifier, self->_criteria);
}

- (MSCriterion)initWithType:(id)a3 qualifier:(id)a4 expression:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  MSCriterion *v12;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = (void *)objc_msgSend(v10, "copy");

  v12 = -[MSCriterion _initWithType:qualifier:criteria:](self, "_initWithType:qualifier:criteria:", v8, v9, v11);
  return v12;
}

- (MSCriterion)initWithCriteria:(id)a3 allRequired:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  void *v7;
  const __CFString *v8;
  MSCriterion *v9;

  v4 = a4;
  v6 = a3;
  v7 = (void *)objc_msgSend(v6, "copy");

  if (v4)
    v8 = CFSTR("_MSCriterionQualifierAllRequired");
  else
    v8 = CFSTR("_MSCriterionQualifierNotAllRequired");
  v9 = -[MSCriterion _initWithType:qualifier:criteria:](self, "_initWithType:qualifier:criteria:", CFSTR("_MSCriterionTypeComplex"), v8, v7);

  return v9;
}

- (MSCriterion)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  id v12;
  uint64_t v13;
  id v14;
  MSCriterion *v15;
  uint64_t i;
  uint64_t j;
  _OWORD v19[3];
  _OWORD v20[5];
  _QWORD v21[7];

  v21[5] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (objc_msgSend(v4, "allowsKeyedCoding")
    && objc_msgSend(v4, "containsValueForKey:", CFSTR("_MSCodingKeyVersion"))
    && objc_msgSend(v4, "decodeInt32ForKey:", CFSTR("_MSCodingKeyVersion")) == 1)
  {
    v5 = (void *)MEMORY[0x24BDBCF20];
    v21[0] = objc_opt_class();
    v21[1] = objc_opt_class();
    v21[2] = objc_opt_class();
    v21[3] = objc_opt_class();
    v21[4] = objc_opt_class();
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v21, 5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setWithArray:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v7, CFSTR("_MSCodingKeyCriteria"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v8)
      objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", *MEMORY[0x24BDBCAB8], CFSTR("MSCriterion requires the criterion criteria not be nil."));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_MSCodingKeyType"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v9)
      objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", *MEMORY[0x24BDBCAB8], CFSTR("MSCriterion requires the criterion type be a NSString."));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_MSCodingKeyQualifier"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v10)
      objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", *MEMORY[0x24BDBCAB8], CFSTR("MSCriterion requires the criterion qualifier be a NSString."));
    v11 = 0;
    v20[2] = xmmword_24C3856B0;
    v20[3] = *(_OWORD *)&off_24C3856C0;
    v20[4] = xmmword_24C3856D0;
    v20[0] = xmmword_24C385690;
    v20[1] = *(_OWORD *)&off_24C3856A0;
    v19[0] = xmmword_24C3856E0;
    v19[1] = *(_OWORD *)&off_24C3856F0;
    v19[2] = xmmword_24C385700;
    while (1)
    {
      v12 = *(id *)((char *)v20 + v11);
      if ((objc_msgSend(v12, "isEqualToString:", v9) & 1) != 0)
        break;

      v11 += 8;
      if (v11 == 80)
      {
        v12 = 0;
        break;
      }
    }
    v13 = 0;
    while (1)
    {
      v14 = *(id *)((char *)v19 + v13);
      if ((objc_msgSend(v14, "isEqualToString:", v10) & 1) != 0)
        break;

      v13 += 8;
      if (v13 == 48)
      {
        v14 = 0;
        goto LABEL_23;
      }
    }
    if (v12 && v14)
    {
      v15 = -[MSCriterion _initWithType:qualifier:criteria:](self, "_initWithType:qualifier:criteria:", v12, v14, v8);
      goto LABEL_24;
    }
LABEL_23:

    v15 = 0;
LABEL_24:
    for (i = 40; i != -8; i -= 8)

    for (j = 72; j != -8; j -= 8)
  }
  else
  {

    v15 = 0;
  }

  return v15;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;

  v4 = a3;
  if ((objc_msgSend(v4, "allowsKeyedCoding") & 1) == 0)
    objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", *MEMORY[0x24BDBCAB8], CFSTR("A Keyed archiver is required for encoding MSCriterion."));
  objc_msgSend(v4, "encodeInt32:forKey:", 1, CFSTR("_MSCodingKeyVersion"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_type, CFSTR("_MSCodingKeyType"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_qualifier, CFSTR("_MSCodingKeyQualifier"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_criteria, CFSTR("_MSCodingKeyCriteria"));

}

- (id)type
{
  return self->_type;
}

- (id)qualifier
{
  return self->_qualifier;
}

- (id)criteria
{
  return self->_criteria;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_criteria, 0);
  objc_storeStrong((id *)&self->_qualifier, 0);
  objc_storeStrong((id *)&self->_type, 0);
}

@end
