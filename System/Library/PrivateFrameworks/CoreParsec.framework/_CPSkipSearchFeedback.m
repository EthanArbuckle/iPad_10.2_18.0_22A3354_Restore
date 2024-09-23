@implementation _CPSkipSearchFeedback

- (_CPSkipSearchFeedback)init
{
  _CPSkipSearchFeedback *v2;
  _CPSkipSearchFeedback *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)_CPSkipSearchFeedback;
  v2 = -[_CPSkipSearchFeedback init](&v5, sel_init);
  if (v2)
  {
    -[_CPSkipSearchFeedback setTimestamp:](v2, "setTimestamp:", mach_absolute_time());
    v3 = v2;
  }

  return v2;
}

- (BOOL)readFrom:(id)a3
{
  return _CPSkipSearchFeedbackReadFrom(self, (uint64_t)a3);
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
  if (-[_CPSkipSearchFeedback timestamp](self, "timestamp"))
    PBDataWriterWriteUint64Field();
  -[_CPSkipSearchFeedback input](self, "input");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
    PBDataWriterWriteStringField();
  if (-[_CPSkipSearchFeedback triggerEvent](self, "triggerEvent"))
    PBDataWriterWriteInt32Field();
  -[_CPSkipSearchFeedback experimentId](self, "experimentId");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
    PBDataWriterWriteStringField();
  -[_CPSkipSearchFeedback treatmentId](self, "treatmentId");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
    PBDataWriterWriteStringField();
  -[_CPSkipSearchFeedback experimentNamespaceId](self, "experimentNamespaceId");
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
  int triggerEvent;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  int v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  int v23;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  char v28;
  BOOL v29;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_24;
  timestamp = self->_timestamp;
  if (timestamp != objc_msgSend(v4, "timestamp"))
    goto LABEL_24;
  -[_CPSkipSearchFeedback input](self, "input");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "input");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) == (v7 != 0))
    goto LABEL_23;
  -[_CPSkipSearchFeedback input](self, "input");
  v8 = objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    v9 = (void *)v8;
    -[_CPSkipSearchFeedback input](self, "input");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "input");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v10, "isEqual:", v11);

    if (!v12)
      goto LABEL_24;
  }
  else
  {

  }
  triggerEvent = self->_triggerEvent;
  if (triggerEvent != objc_msgSend(v4, "triggerEvent"))
    goto LABEL_24;
  -[_CPSkipSearchFeedback experimentId](self, "experimentId");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "experimentId");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) == (v7 != 0))
    goto LABEL_23;
  -[_CPSkipSearchFeedback experimentId](self, "experimentId");
  v14 = objc_claimAutoreleasedReturnValue();
  if (v14)
  {
    v15 = (void *)v14;
    -[_CPSkipSearchFeedback experimentId](self, "experimentId");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "experimentId");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v16, "isEqual:", v17);

    if (!v18)
      goto LABEL_24;
  }
  else
  {

  }
  -[_CPSkipSearchFeedback treatmentId](self, "treatmentId");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "treatmentId");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) == (v7 != 0))
    goto LABEL_23;
  -[_CPSkipSearchFeedback treatmentId](self, "treatmentId");
  v19 = objc_claimAutoreleasedReturnValue();
  if (v19)
  {
    v20 = (void *)v19;
    -[_CPSkipSearchFeedback treatmentId](self, "treatmentId");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "treatmentId");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = objc_msgSend(v21, "isEqual:", v22);

    if (!v23)
      goto LABEL_24;
  }
  else
  {

  }
  -[_CPSkipSearchFeedback experimentNamespaceId](self, "experimentNamespaceId");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "experimentNamespaceId");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) == (v7 != 0))
  {
LABEL_23:

    goto LABEL_24;
  }
  -[_CPSkipSearchFeedback experimentNamespaceId](self, "experimentNamespaceId");
  v24 = objc_claimAutoreleasedReturnValue();
  if (!v24)
  {

LABEL_27:
    v29 = 1;
    goto LABEL_25;
  }
  v25 = (void *)v24;
  -[_CPSkipSearchFeedback experimentNamespaceId](self, "experimentNamespaceId");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "experimentNamespaceId");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = objc_msgSend(v26, "isEqual:", v27);

  if ((v28 & 1) != 0)
    goto LABEL_27;
LABEL_24:
  v29 = 0;
LABEL_25:

  return v29;
}

- (unint64_t)hash
{
  unint64_t v3;
  NSUInteger v4;
  uint64_t v5;
  NSUInteger v6;
  NSUInteger v7;

  v3 = 2654435761u * self->_timestamp;
  v4 = -[NSString hash](self->_input, "hash") ^ v3;
  v5 = 2654435761 * self->_triggerEvent;
  v6 = v4 ^ v5 ^ -[NSString hash](self->_experimentId, "hash");
  v7 = -[NSString hash](self->_treatmentId, "hash");
  return v6 ^ v7 ^ -[NSString hash](self->_experimentNamespaceId, "hash");
}

- (unint64_t)timestamp
{
  return self->_timestamp;
}

- (void)setTimestamp:(unint64_t)a3
{
  self->_timestamp = a3;
}

- (NSString)input
{
  return self->_input;
}

- (void)setInput:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (int)triggerEvent
{
  return self->_triggerEvent;
}

- (void)setTriggerEvent:(int)a3
{
  self->_triggerEvent = a3;
}

- (NSString)experimentId
{
  return self->_experimentId;
}

- (void)setExperimentId:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (NSString)treatmentId
{
  return self->_treatmentId;
}

- (void)setTreatmentId:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (NSString)experimentNamespaceId
{
  return self->_experimentNamespaceId;
}

- (void)setExperimentNamespaceId:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_experimentNamespaceId, 0);
  objc_storeStrong((id *)&self->_treatmentId, 0);
  objc_storeStrong((id *)&self->_experimentId, 0);
  objc_storeStrong((id *)&self->_input, 0);
}

- (_CPSkipSearchFeedback)initWithTriggerEvent:(int)a3 input:(id)a4
{
  uint64_t v4;
  id v6;
  _CPSkipSearchFeedback *v7;
  _CPSkipSearchFeedback *v8;
  _CPSkipSearchFeedback *v9;

  v4 = *(_QWORD *)&a3;
  v6 = a4;
  v7 = -[_CPSkipSearchFeedback init](self, "init");
  v8 = v7;
  if (v7)
  {
    -[_CPSkipSearchFeedback setTriggerEvent:](v7, "setTriggerEvent:", v4);
    -[_CPSkipSearchFeedback setInput:](v8, "setInput:", v6);
    v9 = v8;
  }

  return v8;
}

- (_CPSkipSearchFeedback)initWithTriggerEvent:(int)a3 input:(id)a4 experimentId:(id)a5 treatmentId:(id)a6
{
  uint64_t v8;
  id v10;
  id v11;
  _CPSkipSearchFeedback *v12;
  _CPSkipSearchFeedback *v13;
  _CPSkipSearchFeedback *v14;

  v8 = *(_QWORD *)&a3;
  v10 = a5;
  v11 = a6;
  v12 = -[_CPSkipSearchFeedback initWithTriggerEvent:input:](self, "initWithTriggerEvent:input:", v8, a4);
  v13 = v12;
  if (v12)
  {
    -[_CPSkipSearchFeedback setExperimentId:](v12, "setExperimentId:", v10);
    -[_CPSkipSearchFeedback setTreatmentId:](v13, "setTreatmentId:", v11);
    v14 = v13;
  }

  return v13;
}

@end
