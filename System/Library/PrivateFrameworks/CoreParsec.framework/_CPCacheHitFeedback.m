@implementation _CPCacheHitFeedback

- (_CPCacheHitFeedback)init
{
  _CPCacheHitFeedback *v2;
  _CPCacheHitFeedback *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)_CPCacheHitFeedback;
  v2 = -[_CPCacheHitFeedback init](&v5, sel_init);
  if (v2)
  {
    -[_CPCacheHitFeedback setTimestamp:](v2, "setTimestamp:", mach_absolute_time());
    v3 = v2;
  }

  return v2;
}

- (BOOL)readFrom:(id)a3
{
  return _CPCacheHitFeedbackReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v7 = a3;
  if (-[_CPCacheHitFeedback timestamp](self, "timestamp"))
    PBDataWriterWriteUint64Field();
  -[_CPCacheHitFeedback input](self, "input");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
    PBDataWriterWriteStringField();
  if (-[_CPCacheHitFeedback triggerEvent](self, "triggerEvent"))
    PBDataWriterWriteInt32Field();
  -[_CPCacheHitFeedback uuid](self, "uuid");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = v7;
  if (v5)
  {
    PBDataWriterWriteStringField();
    v6 = v7;
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
  char v18;
  BOOL v19;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_14;
  timestamp = self->_timestamp;
  if (timestamp != objc_msgSend(v4, "timestamp"))
    goto LABEL_14;
  -[_CPCacheHitFeedback input](self, "input");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "input");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) == (v7 != 0))
    goto LABEL_13;
  -[_CPCacheHitFeedback input](self, "input");
  v8 = objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    v9 = (void *)v8;
    -[_CPCacheHitFeedback input](self, "input");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "input");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v10, "isEqual:", v11);

    if (!v12)
      goto LABEL_14;
  }
  else
  {

  }
  triggerEvent = self->_triggerEvent;
  if (triggerEvent != objc_msgSend(v4, "triggerEvent"))
    goto LABEL_14;
  -[_CPCacheHitFeedback uuid](self, "uuid");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "uuid");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) == (v7 != 0))
  {
LABEL_13:

    goto LABEL_14;
  }
  -[_CPCacheHitFeedback uuid](self, "uuid");
  v14 = objc_claimAutoreleasedReturnValue();
  if (!v14)
  {

LABEL_17:
    v19 = 1;
    goto LABEL_15;
  }
  v15 = (void *)v14;
  -[_CPCacheHitFeedback uuid](self, "uuid");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "uuid");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v16, "isEqual:", v17);

  if ((v18 & 1) != 0)
    goto LABEL_17;
LABEL_14:
  v19 = 0;
LABEL_15:

  return v19;
}

- (unint64_t)hash
{
  unint64_t v3;
  NSUInteger v4;
  uint64_t v5;

  v3 = 2654435761u * self->_timestamp;
  v4 = -[NSString hash](self->_input, "hash") ^ v3;
  v5 = 2654435761 * self->_triggerEvent;
  return v4 ^ v5 ^ -[NSString hash](self->_uuid, "hash");
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

- (NSString)uuid
{
  return self->_uuid;
}

- (void)setUuid:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_uuid, 0);
  objc_storeStrong((id *)&self->_input, 0);
}

@end
