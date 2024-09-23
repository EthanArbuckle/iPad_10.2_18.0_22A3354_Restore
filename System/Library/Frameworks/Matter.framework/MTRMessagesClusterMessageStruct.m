@implementation MTRMessagesClusterMessageStruct

- (MTRMessagesClusterMessageStruct)init
{
  const char *v2;
  uint64_t v3;
  MTRMessagesClusterMessageStruct *v4;
  uint64_t v5;
  NSData *messageID;
  NSNumber *priority;
  NSNumber *messageControl;
  NSNumber *startTime;
  NSNumber *duration;
  NSString *messageText;
  NSArray *responses;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)MTRMessagesClusterMessageStruct;
  v4 = -[MTRMessagesClusterMessageStruct init](&v14, sel_init);
  if (v4)
  {
    objc_msgSend_data(MEMORY[0x24BDBCE50], v2, v3);
    v5 = objc_claimAutoreleasedReturnValue();
    messageID = v4->_messageID;
    v4->_messageID = (NSData *)v5;

    priority = v4->_priority;
    v4->_priority = (NSNumber *)&unk_250591B18;

    messageControl = v4->_messageControl;
    v4->_messageControl = (NSNumber *)&unk_250591B18;

    startTime = v4->_startTime;
    v4->_startTime = 0;

    duration = v4->_duration;
    v4->_duration = 0;

    messageText = v4->_messageText;
    v4->_messageText = (NSString *)&stru_2505249E8;

    responses = v4->_responses;
    v4->_responses = 0;

  }
  return v4;
}

- (id)copyWithZone:(_NSZone *)a3
{
  MTRMessagesClusterMessageStruct *v4;
  const char *v5;
  uint64_t v6;
  void *v7;
  const char *v8;
  const char *v9;
  uint64_t v10;
  void *v11;
  const char *v12;
  const char *v13;
  uint64_t v14;
  void *v15;
  const char *v16;
  const char *v17;
  uint64_t v18;
  void *v19;
  const char *v20;
  const char *v21;
  uint64_t v22;
  void *v23;
  const char *v24;
  const char *v25;
  uint64_t v26;
  void *v27;
  const char *v28;
  const char *v29;
  uint64_t v30;
  void *v31;
  const char *v32;

  v4 = objc_alloc_init(MTRMessagesClusterMessageStruct);
  objc_msgSend_messageID(self, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setMessageID_(v4, v8, (uint64_t)v7);

  objc_msgSend_priority(self, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setPriority_(v4, v12, (uint64_t)v11);

  objc_msgSend_messageControl(self, v13, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setMessageControl_(v4, v16, (uint64_t)v15);

  objc_msgSend_startTime(self, v17, v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setStartTime_(v4, v20, (uint64_t)v19);

  objc_msgSend_duration(self, v21, v22);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setDuration_(v4, v24, (uint64_t)v23);

  objc_msgSend_messageText(self, v25, v26);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setMessageText_(v4, v28, (uint64_t)v27);

  objc_msgSend_responses(self, v29, v30);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setResponses_(v4, v32, (uint64_t)v31);

  return v4;
}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  const char *v6;
  void *v7;
  const char *v8;
  void *v9;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_base64EncodedStringWithOptions_(self->_messageID, v6, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_stringWithFormat_(v3, v8, (uint64_t)CFSTR("<%@: messageID:%@; priority:%@; messageControl:%@; startTime:%@; duration:%@; messageText:%@; responses:%@; >"),
    v5,
    v7,
    self->_priority,
    self->_messageControl,
    self->_startTime,
    self->_duration,
    self->_messageText,
    self->_responses);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (NSData)messageID
{
  return self->_messageID;
}

- (void)setMessageID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSNumber)priority
{
  return self->_priority;
}

- (void)setPriority:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSNumber)messageControl
{
  return self->_messageControl;
}

- (void)setMessageControl:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSNumber)startTime
{
  return self->_startTime;
}

- (void)setStartTime:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (NSNumber)duration
{
  return self->_duration;
}

- (void)setDuration:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (NSString)messageText
{
  return self->_messageText;
}

- (void)setMessageText:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (NSArray)responses
{
  return self->_responses;
}

- (void)setResponses:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_responses, 0);
  objc_storeStrong((id *)&self->_messageText, 0);
  objc_storeStrong((id *)&self->_duration, 0);
  objc_storeStrong((id *)&self->_startTime, 0);
  objc_storeStrong((id *)&self->_messageControl, 0);
  objc_storeStrong((id *)&self->_priority, 0);
  objc_storeStrong((id *)&self->_messageID, 0);
}

@end
