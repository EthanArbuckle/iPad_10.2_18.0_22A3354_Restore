@implementation IDSBlastDoorMessageContext

- (IDSBlastDoorMessageContext)initWithService:(id)a3 command:(id)a4
{
  id v6;
  id v7;
  const char *v8;
  uint64_t v9;
  IDSBlastDoorMessageContext *v10;
  double v11;
  uint64_t v12;
  NSString *topic;
  const char *v14;
  uint64_t v15;
  double v16;
  objc_super v18;

  v6 = a3;
  v7 = a4;
  v18.receiver = self;
  v18.super_class = (Class)IDSBlastDoorMessageContext;
  v10 = -[IDSBlastDoorMessageContext init](&v18, sel_init);
  if (v10)
  {
    objc_msgSend_pushTopic(v6, v8, v9, v11);
    v12 = objc_claimAutoreleasedReturnValue();
    topic = v10->_topic;
    v10->_topic = (NSString *)v12;

    v10->_isInvitationService = objc_msgSend_isInvitationService(v6, v14, v15, v16);
    objc_storeStrong((id *)&v10->_command, a4);
  }

  return v10;
}

- (id)dictionaryRepresentation
{
  __CFDictionary *v3;
  NSString *v4;
  const char *v5;
  double v6;
  void *v7;
  NSNumber *v8;
  const char *v9;
  double v10;
  void *v11;

  v3 = (__CFDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
  v4 = self->_topic;
  if (v4)
  {
    CFDictionarySetValue(v3, CFSTR("topic"), v4);
  }
  else if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    sub_19BAEEEFC();
  }

  objc_msgSend_numberWithBool_(MEMORY[0x1E0CB37E8], v5, self->_isInvitationService, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    CFDictionarySetValue(v3, CFSTR("is-invitation-service"), v7);
  }
  else if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    sub_19BAEEE7C();
  }

  v8 = self->_command;
  if (v8)
  {
    CFDictionarySetValue(v3, CFSTR("command"), v8);
  }
  else if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    sub_19BAEEDFC();
  }

  objc_msgSend_numberWithUnsignedInt_(MEMORY[0x1E0CB37E8], v9, self->_payloadType, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11)
    CFDictionarySetValue(v3, CFSTR("payload-type"), v11);

  return v3;
}

- (id)description
{
  uint64_t v2;
  double v3;
  void *v5;
  void *v6;
  const char *v7;
  uint64_t v8;
  double v9;
  void *v10;
  const char *v11;
  uint64_t v12;
  double v13;
  const char *v14;
  uint64_t v15;
  double v16;
  const __CFString *v17;
  unsigned int v18;
  const char *v19;
  double v20;
  void *v21;

  v5 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend_topic(self, a2, v2, v3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_command(self, v7, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend_isInvitationService(self, v11, v12, v13))
    v17 = CFSTR("YES");
  else
    v17 = CFSTR("NO");
  v18 = objc_msgSend_payloadType(self, v14, v15, v16);
  objc_msgSend_stringWithFormat_(v5, v19, (uint64_t)CFSTR("<IDSBlastDoorMessageContext %p>: topic %@ command %@ isInviationService %@ payloadType %ld"), v20, self, v6, v10, v17, v18);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  return v21;
}

- (NSString)topic
{
  return self->_topic;
}

- (BOOL)isInvitationService
{
  return self->_isInvitationService;
}

- (NSNumber)command
{
  return self->_command;
}

- (unsigned)payloadType
{
  return self->_payloadType;
}

- (void)setPayloadType:(unsigned int)a3
{
  self->_payloadType = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_command, 0);
  objc_storeStrong((id *)&self->_topic, 0);
}

@end
