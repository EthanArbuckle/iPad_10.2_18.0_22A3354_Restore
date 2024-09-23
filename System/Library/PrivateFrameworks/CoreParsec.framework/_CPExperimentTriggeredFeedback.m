@implementation _CPExperimentTriggeredFeedback

- (_CPExperimentTriggeredFeedback)init
{
  _CPExperimentTriggeredFeedback *v2;
  _CPExperimentTriggeredFeedback *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)_CPExperimentTriggeredFeedback;
  v2 = -[_CPExperimentTriggeredFeedback init](&v5, sel_init);
  if (v2)
  {
    -[_CPExperimentTriggeredFeedback setTimestamp:](v2, "setTimestamp:", mach_absolute_time());
    v3 = v2;
  }

  return v2;
}

- (BOOL)readFrom:(id)a3
{
  return _CPExperimentTriggeredFeedbackReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a3;
  if (-[_CPExperimentTriggeredFeedback queryID](self, "queryID"))
    PBDataWriterWriteUint64Field();
  if (-[_CPExperimentTriggeredFeedback timestamp](self, "timestamp"))
    PBDataWriterWriteUint64Field();
  -[_CPExperimentTriggeredFeedback counterfactual](self, "counterfactual");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[_CPExperimentTriggeredFeedback counterfactual](self, "counterfactual");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[_CPExperimentTriggeredFeedback codepathId](self, "codepathId");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = v8;
  if (v6)
  {
    PBDataWriterWriteStringField();
    v7 = v8;
  }

}

- (BOOL)isEqual:(id)a3
{
  id v4;
  unint64_t queryID;
  unint64_t timestamp;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  char v18;
  BOOL v19;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_14;
  queryID = self->_queryID;
  if (queryID != objc_msgSend(v4, "queryID"))
    goto LABEL_14;
  timestamp = self->_timestamp;
  if (timestamp != objc_msgSend(v4, "timestamp"))
    goto LABEL_14;
  -[_CPExperimentTriggeredFeedback counterfactual](self, "counterfactual");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "counterfactual");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v7 == 0) == (v8 != 0))
    goto LABEL_13;
  -[_CPExperimentTriggeredFeedback counterfactual](self, "counterfactual");
  v9 = objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    v10 = (void *)v9;
    -[_CPExperimentTriggeredFeedback counterfactual](self, "counterfactual");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "counterfactual");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v11, "isEqual:", v12);

    if (!v13)
      goto LABEL_14;
  }
  else
  {

  }
  -[_CPExperimentTriggeredFeedback codepathId](self, "codepathId");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "codepathId");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v7 == 0) != (v8 != 0))
  {
    -[_CPExperimentTriggeredFeedback codepathId](self, "codepathId");
    v14 = objc_claimAutoreleasedReturnValue();
    if (!v14)
    {

LABEL_17:
      v19 = 1;
      goto LABEL_15;
    }
    v15 = (void *)v14;
    -[_CPExperimentTriggeredFeedback codepathId](self, "codepathId");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "codepathId");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v16, "isEqual:", v17);

    if ((v18 & 1) != 0)
      goto LABEL_17;
  }
  else
  {
LABEL_13:

  }
LABEL_14:
  v19 = 0;
LABEL_15:

  return v19;
}

- (unint64_t)hash
{
  unint64_t v3;
  unint64_t v4;

  v3 = (2654435761u * self->_timestamp) ^ (2654435761u * self->_queryID);
  v4 = -[_CPCounterfactualInfo hash](self->_counterfactual, "hash");
  return v3 ^ v4 ^ -[NSString hash](self->_codepathId, "hash");
}

- (unint64_t)queryID
{
  return self->_queryID;
}

- (void)setQueryID:(unint64_t)a3
{
  self->_queryID = a3;
}

- (unint64_t)timestamp
{
  return self->_timestamp;
}

- (void)setTimestamp:(unint64_t)a3
{
  self->_timestamp = a3;
}

- (_CPCounterfactualInfo)counterfactual
{
  return self->_counterfactual;
}

- (void)setCounterfactual:(id)a3
{
  objc_storeStrong((id *)&self->_counterfactual, a3);
}

- (NSString)codepathId
{
  return self->_codepathId;
}

- (void)setCodepathId:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_codepathId, 0);
  objc_storeStrong((id *)&self->_counterfactual, 0);
}

- (_CPExperimentTriggeredFeedback)initWithFacade:(id)a3
{
  id v4;
  _CPExperimentTriggeredFeedback *v5;
  void *v6;
  _CPCounterfactualInfo *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  _CPExperimentTriggeredFeedback *v13;

  v4 = a3;
  v5 = -[_CPExperimentTriggeredFeedback init](self, "init");
  if (v5)
  {
    -[_CPExperimentTriggeredFeedback setTimestamp:](v5, "setTimestamp:", objc_msgSend(v4, "timestamp"));
    objc_msgSend(v4, "counterfactual");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      v7 = objc_alloc_init(_CPCounterfactualInfo);
      objc_msgSend(v4, "counterfactual");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[_CPCounterfactualInfo setCfDiffered:](v7, "setCfDiffered:", objc_msgSend(v8, "cfDiffered"));

      objc_msgSend(v4, "counterfactual");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[_CPCounterfactualInfo setCfUsed:](v7, "setCfUsed:", objc_msgSend(v9, "cfUsed"));

      objc_msgSend(v4, "counterfactual");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[_CPCounterfactualInfo setCfError:](v7, "setCfError:", objc_msgSend(v10, "cfError"));

      -[_CPExperimentTriggeredFeedback setCounterfactual:](v5, "setCounterfactual:", v7);
    }
    objc_msgSend(v4, "codepathId");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "UUIDString");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[_CPExperimentTriggeredFeedback setCodepathId:](v5, "setCodepathId:", v12);

    v13 = v5;
  }

  return v5;
}

@end
