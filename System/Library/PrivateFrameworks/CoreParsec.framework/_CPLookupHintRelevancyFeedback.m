@implementation _CPLookupHintRelevancyFeedback

- (_CPLookupHintRelevancyFeedback)init
{
  _CPLookupHintRelevancyFeedback *v2;
  _CPLookupHintRelevancyFeedback *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)_CPLookupHintRelevancyFeedback;
  v2 = -[_CPLookupHintRelevancyFeedback init](&v5, sel_init);
  if (v2)
  {
    -[_CPLookupHintRelevancyFeedback setTimestamp:](v2, "setTimestamp:", mach_absolute_time());
    v3 = v2;
  }

  return v2;
}

- (BOOL)readFrom:(id)a3
{
  return _CPLookupHintRelevancyFeedbackReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a3;
  if (-[_CPLookupHintRelevancyFeedback timestamp](self, "timestamp"))
    PBDataWriterWriteUint64Field();
  -[_CPLookupHintRelevancyFeedback hintRange](self, "hintRange");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[_CPLookupHintRelevancyFeedback hintRange](self, "hintRange");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[_CPLookupHintRelevancyFeedback domain](self, "domain");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
    PBDataWriterWriteStringField();
  if (-[_CPLookupHintRelevancyFeedback discarded](self, "discarded"))
    PBDataWriterWriteBOOLField();
  if (-[_CPLookupHintRelevancyFeedback grade](self, "grade"))
    PBDataWriterWriteInt32Field();
  -[_CPLookupHintRelevancyFeedback context](self, "context");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = v9;
  if (v7)
  {
    PBDataWriterWriteStringField();
    v8 = v9;
  }

}

- (BOOL)isEqual:(id)a3
{
  id v4;
  unint64_t timestamp;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  int v17;
  int discarded;
  int grade;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  char v24;
  BOOL v25;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_20;
  timestamp = self->_timestamp;
  if (timestamp != objc_msgSend(v4, "timestamp"))
    goto LABEL_20;
  -[_CPLookupHintRelevancyFeedback hintRange](self, "hintRange");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "hintRange");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) == (v7 != 0))
    goto LABEL_19;
  -[_CPLookupHintRelevancyFeedback hintRange](self, "hintRange");
  v8 = objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    v9 = (void *)v8;
    -[_CPLookupHintRelevancyFeedback hintRange](self, "hintRange");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "hintRange");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v10, "isEqual:", v11);

    if (!v12)
      goto LABEL_20;
  }
  else
  {

  }
  -[_CPLookupHintRelevancyFeedback domain](self, "domain");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "domain");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) == (v7 != 0))
    goto LABEL_19;
  -[_CPLookupHintRelevancyFeedback domain](self, "domain");
  v13 = objc_claimAutoreleasedReturnValue();
  if (v13)
  {
    v14 = (void *)v13;
    -[_CPLookupHintRelevancyFeedback domain](self, "domain");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "domain");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v15, "isEqual:", v16);

    if (!v17)
      goto LABEL_20;
  }
  else
  {

  }
  discarded = self->_discarded;
  if (discarded != objc_msgSend(v4, "discarded"))
    goto LABEL_20;
  grade = self->_grade;
  if (grade != objc_msgSend(v4, "grade"))
    goto LABEL_20;
  -[_CPLookupHintRelevancyFeedback context](self, "context");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "context");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) != (v7 != 0))
  {
    -[_CPLookupHintRelevancyFeedback context](self, "context");
    v20 = objc_claimAutoreleasedReturnValue();
    if (!v20)
    {

LABEL_23:
      v25 = 1;
      goto LABEL_21;
    }
    v21 = (void *)v20;
    -[_CPLookupHintRelevancyFeedback context](self, "context");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "context");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = objc_msgSend(v22, "isEqual:", v23);

    if ((v24 & 1) != 0)
      goto LABEL_23;
  }
  else
  {
LABEL_19:

  }
LABEL_20:
  v25 = 0;
LABEL_21:

  return v25;
}

- (unint64_t)hash
{
  unint64_t v3;
  unint64_t v4;
  NSUInteger v5;
  uint64_t v6;

  v3 = 2654435761u * self->_timestamp;
  v4 = -[_CPRange hash](self->_hintRange, "hash");
  v5 = v4 ^ -[NSString hash](self->_domain, "hash") ^ (2654435761 * self->_discarded) ^ v3;
  v6 = 2654435761 * self->_grade;
  return v5 ^ v6 ^ -[NSString hash](self->_context, "hash");
}

- (unint64_t)timestamp
{
  return self->_timestamp;
}

- (void)setTimestamp:(unint64_t)a3
{
  self->_timestamp = a3;
}

- (_CPRange)hintRange
{
  return self->_hintRange;
}

- (void)setHintRange:(id)a3
{
  objc_storeStrong((id *)&self->_hintRange, a3);
}

- (NSString)domain
{
  return self->_domain;
}

- (void)setDomain:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (BOOL)discarded
{
  return self->_discarded;
}

- (void)setDiscarded:(BOOL)a3
{
  self->_discarded = a3;
}

- (int)grade
{
  return self->_grade;
}

- (void)setGrade:(int)a3
{
  self->_grade = a3;
}

- (NSString)context
{
  return self->_context;
}

- (void)setContext:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_context, 0);
  objc_storeStrong((id *)&self->_domain, 0);
  objc_storeStrong((id *)&self->_hintRange, 0);
}

- (_CPLookupHintRelevancyFeedback)initWithFacade:(id)a3
{
  id v4;
  _CPLookupHintRelevancyFeedback *v5;
  _CPRange *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  _CPLookupHintRelevancyFeedback *v16;
  objc_super v18;

  v4 = a3;
  v18.receiver = self;
  v18.super_class = (Class)_CPLookupHintRelevancyFeedback;
  v5 = -[_CPLookupHintRelevancyFeedback init](&v18, sel_init);
  if (v5)
  {
    -[_CPLookupHintRelevancyFeedback setTimestamp:](v5, "setTimestamp:", objc_msgSend(v4, "timestamp"));
    v6 = objc_alloc_init(_CPRange);
    -[_CPLookupHintRelevancyFeedback setHintRange:](v5, "setHintRange:", v6);

    v7 = objc_msgSend(v4, "hintRange");
    -[_CPLookupHintRelevancyFeedback hintRange](v5, "hintRange");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setLocation:", v7);

    objc_msgSend(v4, "hintRange");
    v10 = v9;
    -[_CPLookupHintRelevancyFeedback hintRange](v5, "hintRange");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setLength:", v10);

    objc_msgSend(v4, "domain");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (v12)
    {
      objc_msgSend(v4, "domain");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[_CPLookupHintRelevancyFeedback setDomain:](v5, "setDomain:", v13);

    }
    -[_CPLookupHintRelevancyFeedback setDiscarded:](v5, "setDiscarded:", objc_msgSend(v4, "discarded"));
    -[_CPLookupHintRelevancyFeedback setGrade:](v5, "setGrade:", objc_msgSend(v4, "grade"));
    objc_msgSend(v4, "context");
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    if (v14)
    {
      objc_msgSend(v4, "context");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      -[_CPLookupHintRelevancyFeedback setContext:](v5, "setContext:", v15);

    }
    v16 = v5;
  }

  return v5;
}

@end
