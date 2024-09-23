@implementation IRMiloLslSingleScoreDO

- (IRMiloLslSingleScoreDO)initWithScore:(double)a3 eventID:(id)a4
{
  id v7;
  IRMiloLslSingleScoreDO *v8;
  IRMiloLslSingleScoreDO *v9;
  objc_super v11;

  v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)IRMiloLslSingleScoreDO;
  v8 = -[IRMiloLslSingleScoreDO init](&v11, sel_init);
  v9 = v8;
  if (v8)
  {
    v8->_score = a3;
    objc_storeStrong((id *)&v8->_eventID, a4);
  }

  return v9;
}

+ (id)miloLslSingleScoreDOWithScore:(double)a3 eventID:(id)a4
{
  id v6;
  void *v7;

  v6 = a4;
  v7 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithScore:eventID:", v6, a3);

  return v7;
}

- (id)copyWithReplacementScore:(double)a3
{
  return (id)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithScore:eventID:", self->_eventID, a3);
}

- (id)copyWithReplacementEventID:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithScore:eventID:", v4, self->_score);

  return v5;
}

- (BOOL)isEqualToMiloLslSingleScoreDO:(id)a3
{
  id v4;
  void *v5;
  double score;
  double v7;
  int v8;
  void *v9;
  int v10;
  NSString *eventID;
  void *v12;
  char v13;

  v4 = a3;
  v5 = v4;
  if (v4
    && (score = self->_score, objc_msgSend(v4, "score"), score == v7)
    && (v8 = self->_eventID != 0,
        objc_msgSend(v5, "eventID"),
        v9 = (void *)objc_claimAutoreleasedReturnValue(),
        v10 = v9 == 0,
        v9,
        v8 != v10))
  {
    eventID = self->_eventID;
    if (eventID)
    {
      objc_msgSend(v5, "eventID");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = -[NSString isEqual:](eventID, "isEqual:", v12);

    }
    else
    {
      v13 = 1;
    }
  }
  else
  {
    v13 = 0;
  }

  return v13;
}

- (BOOL)isEqual:(id)a3
{
  IRMiloLslSingleScoreDO *v4;
  IRMiloLslSingleScoreDO *v5;
  BOOL v6;

  v4 = (IRMiloLslSingleScoreDO *)a3;
  v5 = v4;
  if (v4 == self)
    v6 = 1;
  else
    v6 = v4
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && -[IRMiloLslSingleScoreDO isEqualToMiloLslSingleScoreDO:](self, "isEqualToMiloLslSingleScoreDO:", v5);

  return v6;
}

- (unint64_t)hash
{
  unint64_t score;

  score = (unint64_t)self->_score;
  return -[NSString hash](self->_eventID, "hash") - score + 32 * score;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (IRMiloLslSingleScoreDO)initWithCoder:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  objc_class *v7;
  void *v8;
  objc_class *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  IRMiloLslSingleScoreDO *v15;
  void *v16;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  _QWORD v21[2];

  v21[1] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("score"));
  if (v5)
    goto LABEL_2;
  objc_msgSend(v4, "error");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v14)
  {
    if ((objc_msgSend(v4, "containsValueForKey:", CFSTR("score")) & 1) == 0)
    {
      v20 = *MEMORY[0x24BDD0FC8];
      v21[0] = CFSTR("Missing serialized value for IRMiloLslSingleScoreDO.score");
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v21, &v20, 1);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1540]), "initWithDomain:code:userInfo:", CFSTR("IRMiloLslSingleScoreDOOCNTErrorDomain"), 1, v6);
      objc_msgSend(v4, "failWithError:", v8);
      goto LABEL_11;
    }
LABEL_2:
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("eventID"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        v7 = (objc_class *)objc_opt_class();
        NSStringFromClass(v7);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = (objc_class *)objc_opt_class();
        NSStringFromClass(v9);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithFormat:", CFSTR("Unarchived unexpected class for IRMiloLslSingleScoreDO key \"eventID\" (expected %@, decoded %@)"), v8, v10, 0);
        v18 = *MEMORY[0x24BDD0FC8];
        v19 = v11;
        objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v19, &v18, 1);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1540]), "initWithDomain:code:userInfo:", CFSTR("IRMiloLslSingleScoreDOOCNTErrorDomain"), 3, v12);
        objc_msgSend(v4, "failWithError:", v13);

LABEL_11:
        goto LABEL_12;
      }
    }
    else
    {
      objc_msgSend(v4, "error");
      v16 = (void *)objc_claimAutoreleasedReturnValue();

      if (v16)
      {
LABEL_12:
        v15 = 0;
        goto LABEL_13;
      }
    }
    self = -[IRMiloLslSingleScoreDO initWithScore:eventID:](self, "initWithScore:eventID:", v6, (double)v5);
    v15 = self;
LABEL_13:

    goto LABEL_14;
  }
  v15 = 0;
LABEL_14:

  return v15;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *eventID;
  id v5;

  v5 = a3;
  objc_msgSend(v5, "encodeInt64:forKey:", (uint64_t)self->_score, CFSTR("score"));
  eventID = self->_eventID;
  if (eventID)
    objc_msgSend(v5, "encodeObject:forKey:", eventID, CFSTR("eventID"));

}

- (id)description
{
  id v3;
  void *v4;
  void *v5;

  v3 = objc_alloc(MEMORY[0x24BDD17C8]);
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", self->_score);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("<IRMiloLslSingleScoreDO | score:%@ eventID:%@>"), v4, self->_eventID);

  return v5;
}

- (double)score
{
  return self->_score;
}

- (NSString)eventID
{
  return self->_eventID;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_eventID, 0);
}

@end
