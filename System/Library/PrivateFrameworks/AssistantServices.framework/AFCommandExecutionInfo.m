@implementation AFCommandExecutionInfo

- (AFCommandExecutionInfo)initWithBuilder:(id)a3
{
  void (**v4)(id, _AFCommandExecutionInfoMutation *);
  AFCommandExecutionInfo *v5;
  AFCommandExecutionInfo *v6;
  _AFCommandExecutionInfoMutation *v7;
  void *v8;
  uint64_t v9;
  NSString *executionID;
  void *v11;
  uint64_t v12;
  NSString *requestID;
  void *v14;
  uint64_t v15;
  NSUUID *turnId;
  void *v17;
  uint64_t v18;
  AFPeerInfo *originPeerInfo;
  void *v20;
  uint64_t v21;
  AFHomeInfo *currentHomeInfo;
  void *v23;
  uint64_t v24;
  AFEndpointInfo *endpointInfo;
  void *v26;
  uint64_t v27;
  AFInstanceInfo *instanceInfo;
  void *v29;
  uint64_t v30;
  AFSpeechInfo *speechInfo;
  void *v32;
  uint64_t v33;
  AFRequestHandlingContext *requestHandlingContextSnapshot;
  void *v35;
  uint64_t v36;
  NSArray *deviceRestrictions;
  void *v38;
  uint64_t v39;
  NSDictionary *userInfo;
  objc_super v42;

  v4 = (void (**)(id, _AFCommandExecutionInfoMutation *))a3;
  v42.receiver = self;
  v42.super_class = (Class)AFCommandExecutionInfo;
  v5 = -[AFCommandExecutionInfo init](&v42, sel_init);
  v6 = v5;
  if (v4 && v5)
  {
    v7 = -[_AFCommandExecutionInfoMutation initWithBase:]([_AFCommandExecutionInfoMutation alloc], "initWithBase:", 0);
    v4[2](v4, v7);
    if (-[_AFCommandExecutionInfoMutation isDirty](v7, "isDirty"))
    {
      -[_AFCommandExecutionInfoMutation getExecutionID](v7, "getExecutionID");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v8, "copy");
      executionID = v6->_executionID;
      v6->_executionID = (NSString *)v9;

      -[_AFCommandExecutionInfoMutation getRequestID](v7, "getRequestID");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v11, "copy");
      requestID = v6->_requestID;
      v6->_requestID = (NSString *)v12;

      -[_AFCommandExecutionInfoMutation getTurnId](v7, "getTurnId");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = objc_msgSend(v14, "copy");
      turnId = v6->_turnId;
      v6->_turnId = (NSUUID *)v15;

      -[_AFCommandExecutionInfoMutation getOriginPeerInfo](v7, "getOriginPeerInfo");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = objc_msgSend(v17, "copy");
      originPeerInfo = v6->_originPeerInfo;
      v6->_originPeerInfo = (AFPeerInfo *)v18;

      -[_AFCommandExecutionInfoMutation getCurrentHomeInfo](v7, "getCurrentHomeInfo");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = objc_msgSend(v20, "copy");
      currentHomeInfo = v6->_currentHomeInfo;
      v6->_currentHomeInfo = (AFHomeInfo *)v21;

      -[_AFCommandExecutionInfoMutation getEndpointInfo](v7, "getEndpointInfo");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = objc_msgSend(v23, "copy");
      endpointInfo = v6->_endpointInfo;
      v6->_endpointInfo = (AFEndpointInfo *)v24;

      -[_AFCommandExecutionInfoMutation getInstanceInfo](v7, "getInstanceInfo");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = objc_msgSend(v26, "copy");
      instanceInfo = v6->_instanceInfo;
      v6->_instanceInfo = (AFInstanceInfo *)v27;

      -[_AFCommandExecutionInfoMutation getSpeechInfo](v7, "getSpeechInfo");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      v30 = objc_msgSend(v29, "copy");
      speechInfo = v6->_speechInfo;
      v6->_speechInfo = (AFSpeechInfo *)v30;

      -[_AFCommandExecutionInfoMutation getRequestHandlingContextSnapshot](v7, "getRequestHandlingContextSnapshot");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      v33 = objc_msgSend(v32, "copy");
      requestHandlingContextSnapshot = v6->_requestHandlingContextSnapshot;
      v6->_requestHandlingContextSnapshot = (AFRequestHandlingContext *)v33;

      -[_AFCommandExecutionInfoMutation getDeviceRestrictions](v7, "getDeviceRestrictions");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      v36 = objc_msgSend(v35, "copy");
      deviceRestrictions = v6->_deviceRestrictions;
      v6->_deviceRestrictions = (NSArray *)v36;

      -[_AFCommandExecutionInfoMutation getUserInfo](v7, "getUserInfo");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      v39 = objc_msgSend(v38, "copy");
      userInfo = v6->_userInfo;
      v6->_userInfo = (NSDictionary *)v39;

    }
  }

  return v6;
}

- (AFCommandExecutionInfo)init
{
  return -[AFCommandExecutionInfo initWithBuilder:](self, "initWithBuilder:", 0);
}

- (AFCommandExecutionInfo)initWithExecutionID:(id)a3 requestID:(id)a4 turnId:(id)a5 originPeerInfo:(id)a6 currentHomeInfo:(id)a7 endpointInfo:(id)a8 instanceInfo:(id)a9 speechInfo:(id)a10 requestHandlingContextSnapshot:(id)a11 deviceRestrictions:(id)a12 userInfo:(id)a13
{
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  id v25;
  id v26;
  id v27;
  id v28;
  id v29;
  id v30;
  id v31;
  id v32;
  id v33;
  id v34;
  id v35;
  id v36;
  AFCommandExecutionInfo *v37;
  id v39;
  id v40;
  id v41;
  _QWORD v43[4];
  id v44;
  id v45;
  id v46;
  id v47;
  id v48;
  id v49;
  id v50;
  id v51;
  id v52;
  id v53;
  id v54;

  v39 = a3;
  v18 = a4;
  v19 = a5;
  v20 = a6;
  v21 = a7;
  v22 = a8;
  v23 = a9;
  v24 = a10;
  v25 = a11;
  v26 = a12;
  v27 = a13;
  v43[0] = MEMORY[0x1E0C809B0];
  v43[1] = 3221225472;
  v43[2] = __190__AFCommandExecutionInfo_initWithExecutionID_requestID_turnId_originPeerInfo_currentHomeInfo_endpointInfo_instanceInfo_speechInfo_requestHandlingContextSnapshot_deviceRestrictions_userInfo___block_invoke;
  v43[3] = &unk_1E3A35EE8;
  v44 = v39;
  v45 = v18;
  v46 = v19;
  v47 = v20;
  v48 = v21;
  v49 = v22;
  v50 = v23;
  v51 = v24;
  v52 = v25;
  v53 = v26;
  v54 = v27;
  v41 = v27;
  v40 = v26;
  v28 = v25;
  v29 = v24;
  v30 = v23;
  v31 = v22;
  v32 = v21;
  v33 = v20;
  v34 = v19;
  v35 = v18;
  v36 = v39;
  v37 = -[AFCommandExecutionInfo initWithBuilder:](self, "initWithBuilder:", v43);

  return v37;
}

- (NSString)description
{
  return (NSString *)-[AFCommandExecutionInfo _descriptionWithIndent:](self, "_descriptionWithIndent:", 0);
}

- (id)_descriptionWithIndent:(unint64_t)a3
{
  id v4;
  void *v5;
  void *v6;
  objc_super v8;

  v4 = objc_alloc(MEMORY[0x1E0CB3940]);
  v8.receiver = self;
  v8.super_class = (Class)AFCommandExecutionInfo;
  -[AFCommandExecutionInfo description](&v8, sel_description);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v4, "initWithFormat:", CFSTR("%@ {executionID = %@, requestID = %@, turnId = %@, originPeerInfo = %@, currentHomeInfo = %@, endpointInfo = %@, instanceInfo = %@, speechInfo = %@, requestHandlingContextSnapshot = %@, deviceRestrictions = %@, userInfo = %@}"), v5, self->_executionID, self->_requestID, self->_turnId, self->_originPeerInfo, self->_currentHomeInfo, self->_endpointInfo, self->_instanceInfo, self->_speechInfo, self->_requestHandlingContextSnapshot, self->_deviceRestrictions, self->_userInfo);

  return v6;
}

- (unint64_t)hash
{
  NSUInteger v3;
  NSUInteger v4;
  uint64_t v5;
  unint64_t v6;
  unint64_t v7;
  unint64_t v8;
  unint64_t v9;
  unint64_t v10;
  unint64_t v11;
  uint64_t v12;

  v3 = -[NSString hash](self->_executionID, "hash");
  v4 = -[NSString hash](self->_requestID, "hash") ^ v3;
  v5 = -[NSUUID hash](self->_turnId, "hash");
  v6 = v4 ^ v5 ^ -[AFPeerInfo hash](self->_originPeerInfo, "hash");
  v7 = -[AFHomeInfo hash](self->_currentHomeInfo, "hash");
  v8 = v7 ^ -[AFEndpointInfo hash](self->_endpointInfo, "hash");
  v9 = v6 ^ v8 ^ -[AFInstanceInfo hash](self->_instanceInfo, "hash");
  v10 = -[AFSpeechInfo hash](self->_speechInfo, "hash");
  v11 = v10 ^ -[AFRequestHandlingContext hash](self->_requestHandlingContextSnapshot, "hash");
  v12 = v11 ^ -[NSArray hash](self->_deviceRestrictions, "hash");
  return v9 ^ v12 ^ -[NSDictionary hash](self->_userInfo, "hash");
}

- (BOOL)isEqual:(id)a3
{
  AFCommandExecutionInfo *v4;
  AFCommandExecutionInfo *v5;
  NSString *v6;
  NSString *executionID;
  NSString *v8;
  NSString *requestID;
  NSUUID *v10;
  NSUUID *turnId;
  AFPeerInfo *v12;
  AFPeerInfo *originPeerInfo;
  AFHomeInfo *v14;
  AFHomeInfo *currentHomeInfo;
  AFEndpointInfo *v16;
  AFEndpointInfo *endpointInfo;
  AFInstanceInfo *v18;
  AFInstanceInfo *instanceInfo;
  AFSpeechInfo *v20;
  AFSpeechInfo *speechInfo;
  AFRequestHandlingContext *v22;
  AFRequestHandlingContext *requestHandlingContextSnapshot;
  NSArray *v24;
  NSArray *deviceRestrictions;
  NSDictionary *v26;
  NSDictionary *userInfo;
  NSDictionary *v28;
  int v29;
  BOOL v30;
  AFRequestHandlingContext *v32;
  AFSpeechInfo *v33;
  AFInstanceInfo *v34;

  v4 = (AFCommandExecutionInfo *)a3;
  if (self == v4)
  {
    v30 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      -[AFCommandExecutionInfo executionID](v5, "executionID");
      v6 = (NSString *)objc_claimAutoreleasedReturnValue();
      executionID = self->_executionID;
      if (executionID == v6 || -[NSString isEqual:](executionID, "isEqual:", v6))
      {
        -[AFCommandExecutionInfo requestID](v5, "requestID");
        v8 = (NSString *)objc_claimAutoreleasedReturnValue();
        requestID = self->_requestID;
        if (requestID == v8 || -[NSString isEqual:](requestID, "isEqual:", v8))
        {
          -[AFCommandExecutionInfo turnId](v5, "turnId");
          v10 = (NSUUID *)objc_claimAutoreleasedReturnValue();
          turnId = self->_turnId;
          if (turnId == v10 || -[NSUUID isEqual:](turnId, "isEqual:", v10))
          {
            -[AFCommandExecutionInfo originPeerInfo](v5, "originPeerInfo");
            v12 = (AFPeerInfo *)objc_claimAutoreleasedReturnValue();
            originPeerInfo = self->_originPeerInfo;
            if (originPeerInfo == v12 || -[AFPeerInfo isEqual:](originPeerInfo, "isEqual:", v12))
            {
              -[AFCommandExecutionInfo currentHomeInfo](v5, "currentHomeInfo");
              v14 = (AFHomeInfo *)objc_claimAutoreleasedReturnValue();
              currentHomeInfo = self->_currentHomeInfo;
              if (currentHomeInfo == v14 || -[AFHomeInfo isEqual:](currentHomeInfo, "isEqual:", v14))
              {
                -[AFCommandExecutionInfo endpointInfo](v5, "endpointInfo");
                v16 = (AFEndpointInfo *)objc_claimAutoreleasedReturnValue();
                endpointInfo = self->_endpointInfo;
                if (endpointInfo == v16 || -[AFEndpointInfo isEqual:](endpointInfo, "isEqual:", v16))
                {
                  -[AFCommandExecutionInfo instanceInfo](v5, "instanceInfo");
                  v18 = (AFInstanceInfo *)objc_claimAutoreleasedReturnValue();
                  instanceInfo = self->_instanceInfo;
                  if (instanceInfo == v18 || -[AFInstanceInfo isEqual:](instanceInfo, "isEqual:", v18))
                  {
                    v34 = v18;
                    -[AFCommandExecutionInfo speechInfo](v5, "speechInfo");
                    v20 = (AFSpeechInfo *)objc_claimAutoreleasedReturnValue();
                    speechInfo = self->_speechInfo;
                    if (speechInfo == v20 || -[AFSpeechInfo isEqual:](speechInfo, "isEqual:", v20))
                    {
                      v33 = v20;
                      -[AFCommandExecutionInfo requestHandlingContextSnapshot](v5, "requestHandlingContextSnapshot");
                      v22 = (AFRequestHandlingContext *)objc_claimAutoreleasedReturnValue();
                      requestHandlingContextSnapshot = self->_requestHandlingContextSnapshot;
                      if (requestHandlingContextSnapshot == v22
                        || -[AFRequestHandlingContext isEqual:](requestHandlingContextSnapshot, "isEqual:", v22))
                      {
                        v32 = v22;
                        -[AFCommandExecutionInfo deviceRestrictions](v5, "deviceRestrictions");
                        v24 = (NSArray *)objc_claimAutoreleasedReturnValue();
                        deviceRestrictions = self->_deviceRestrictions;
                        if (deviceRestrictions == v24
                          || -[NSArray isEqual:](deviceRestrictions, "isEqual:", v24))
                        {
                          -[AFCommandExecutionInfo userInfo](v5, "userInfo");
                          v26 = (NSDictionary *)objc_claimAutoreleasedReturnValue();
                          userInfo = self->_userInfo;
                          v30 = 1;
                          if (userInfo != v26)
                          {
                            v28 = v26;
                            v29 = -[NSDictionary isEqual:](userInfo, "isEqual:", v26);
                            v26 = v28;
                            if (!v29)
                              v30 = 0;
                          }

                        }
                        else
                        {
                          v30 = 0;
                        }

                        v22 = v32;
                      }
                      else
                      {
                        v30 = 0;
                      }

                      v20 = v33;
                    }
                    else
                    {
                      v30 = 0;
                    }

                    v18 = v34;
                  }
                  else
                  {
                    v30 = 0;
                  }

                }
                else
                {
                  v30 = 0;
                }

              }
              else
              {
                v30 = 0;
              }

            }
            else
            {
              v30 = 0;
            }

          }
          else
          {
            v30 = 0;
          }

        }
        else
        {
          v30 = 0;
        }

      }
      else
      {
        v30 = 0;
      }

    }
    else
    {
      v30 = 0;
    }
  }

  return v30;
}

- (AFCommandExecutionInfo)initWithCoder:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v18;
  void *v19;
  void *v20;
  AFCommandExecutionInfo *v22;
  void *v23;

  v3 = a3;
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("AFCommandExecutionInfo::executionID"));
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("AFCommandExecutionInfo::requestID"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("AFCommandExecutionInfo::turnId"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("AFCommandExecutionInfo::originPeerInfo"));
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("AFCommandExecutionInfo::currentHomeInfo"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("AFCommandExecutionInfo::endpointInfo"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("AFCommandExecutionInfo::instanceInfo"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("AFCommandExecutionInfo::speechInfo"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("AFCommandExecutionInfo::requestHandlingContextSnapshot"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)MEMORY[0x1E0C99E60];
  v10 = objc_opt_class();
  objc_msgSend(v9, "setWithObjects:", v10, objc_opt_class(), 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeObjectOfClasses:forKey:", v11, CFSTR("AFCommandExecutionInfo::deviceRestrictions"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = (void *)MEMORY[0x1E0C99E60];
  v14 = objc_opt_class();
  objc_msgSend(v13, "setWithObjects:", v14, objc_opt_class(), 0);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeObjectOfClasses:forKey:", v15, CFSTR("AFCommandExecutionInfo::userInfo"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  v22 = -[AFCommandExecutionInfo initWithExecutionID:requestID:turnId:originPeerInfo:currentHomeInfo:endpointInfo:instanceInfo:speechInfo:requestHandlingContextSnapshot:deviceRestrictions:userInfo:](self, "initWithExecutionID:requestID:turnId:originPeerInfo:currentHomeInfo:endpointInfo:instanceInfo:speechInfo:requestHandlingContextSnapshot:deviceRestrictions:userInfo:", v23, v18, v4, v20, v5, v19, v6, v7, v8, v12, v16);
  return v22;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *executionID;
  id v5;

  executionID = self->_executionID;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", executionID, CFSTR("AFCommandExecutionInfo::executionID"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_requestID, CFSTR("AFCommandExecutionInfo::requestID"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_turnId, CFSTR("AFCommandExecutionInfo::turnId"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_originPeerInfo, CFSTR("AFCommandExecutionInfo::originPeerInfo"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_currentHomeInfo, CFSTR("AFCommandExecutionInfo::currentHomeInfo"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_endpointInfo, CFSTR("AFCommandExecutionInfo::endpointInfo"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_instanceInfo, CFSTR("AFCommandExecutionInfo::instanceInfo"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_speechInfo, CFSTR("AFCommandExecutionInfo::speechInfo"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_requestHandlingContextSnapshot, CFSTR("AFCommandExecutionInfo::requestHandlingContextSnapshot"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_deviceRestrictions, CFSTR("AFCommandExecutionInfo::deviceRestrictions"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_userInfo, CFSTR("AFCommandExecutionInfo::userInfo"));

}

- (AFCommandExecutionInfo)initWithDictionaryRepresentation:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  AFCommandExecutionInfo *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t i;
  id v23;
  id v24;
  void *v25;
  void *v26;
  id v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t j;
  uint64_t v32;
  void *v33;
  void *v34;
  void *v36;
  AFRequestHandlingContext *v37;
  AFSpeechInfo *v38;
  AFInstanceInfo *v39;
  AFEndpointInfo *v40;
  AFHomeInfo *v41;
  AFPeerInfo *v42;
  id v43;
  id v44;
  id v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  _BYTE v54[128];
  _BYTE v55[128];
  uint64_t v56;

  v56 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = v4;
  if (v4)
  {
    objc_msgSend(v4, "objectForKey:", CFSTR("executionID"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v45 = v6;
    else
      v45 = 0;

    objc_msgSend(v5, "objectForKey:", CFSTR("requestID"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v44 = v8;
    else
      v44 = 0;

    objc_msgSend(v5, "objectForKey:", CFSTR("turnId"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v43 = v9;
    else
      v43 = 0;

    objc_msgSend(v5, "objectForKey:", CFSTR("originPeerInfo"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v42 = -[AFPeerInfo initWithDictionaryRepresentation:]([AFPeerInfo alloc], "initWithDictionaryRepresentation:", v10);
    else
      v42 = 0;

    objc_msgSend(v5, "objectForKey:", CFSTR("currentHomeInfo"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v41 = -[AFHomeInfo initWithDictionaryRepresentation:]([AFHomeInfo alloc], "initWithDictionaryRepresentation:", v11);
    else
      v41 = 0;

    objc_msgSend(v5, "objectForKey:", CFSTR("endpointInfo"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v40 = -[AFEndpointInfo initWithDictionaryRepresentation:]([AFEndpointInfo alloc], "initWithDictionaryRepresentation:", v12);
    else
      v40 = 0;

    objc_msgSend(v5, "objectForKey:", CFSTR("instanceInfo"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v39 = -[AFInstanceInfo initWithDictionaryRepresentation:]([AFInstanceInfo alloc], "initWithDictionaryRepresentation:", v13);
    else
      v39 = 0;

    objc_msgSend(v5, "objectForKey:", CFSTR("speechInfo"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v38 = -[AFSpeechInfo initWithDictionaryRepresentation:]([AFSpeechInfo alloc], "initWithDictionaryRepresentation:", v14);
    else
      v38 = 0;

    objc_msgSend(v5, "objectForKey:", CFSTR("requestHandlingContextSnapshot"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v37 = -[AFRequestHandlingContext initWithDictionaryRepresentation:]([AFRequestHandlingContext alloc], "initWithDictionaryRepresentation:", v15);
    else
      v37 = 0;

    objc_msgSend(v5, "objectForKey:", CFSTR("deviceRestrictions"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v16, "count"));
      v50 = 0u;
      v51 = 0u;
      v52 = 0u;
      v53 = 0u;
      v18 = v16;
      v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v50, v55, 16);
      if (v19)
      {
        v20 = v19;
        v21 = *(_QWORD *)v51;
        do
        {
          for (i = 0; i != v20; ++i)
          {
            if (*(_QWORD *)v51 != v21)
              objc_enumerationMutation(v18);
            v23 = *(id *)(*((_QWORD *)&v50 + 1) + 8 * i);
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              v24 = v23;

              if (v24)
                objc_msgSend(v17, "addObject:", v24);
            }
            else
            {

              v24 = 0;
            }

          }
          v20 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v50, v55, 16);
        }
        while (v20);
      }

      v36 = (void *)objc_msgSend(v17, "copy");
    }
    else
    {
      v36 = 0;
    }

    objc_msgSend(v5, "objectForKey:", CFSTR("userInfo"));
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v26 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", objc_msgSend(v25, "count"));
      v46 = 0u;
      v47 = 0u;
      v48 = 0u;
      v49 = 0u;
      v27 = v25;
      v28 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v46, v54, 16);
      if (v28)
      {
        v29 = v28;
        v30 = *(_QWORD *)v47;
        do
        {
          for (j = 0; j != v29; ++j)
          {
            if (*(_QWORD *)v47 != v30)
              objc_enumerationMutation(v27);
            v32 = *(_QWORD *)(*((_QWORD *)&v46 + 1) + 8 * j);
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              objc_msgSend(v27, "objectForKey:", v32);
              v33 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v26, "setObject:forKey:", v33, v32);

            }
          }
          v29 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v46, v54, 16);
        }
        while (v29);
      }

      v34 = (void *)objc_msgSend(v26, "copy");
    }
    else
    {
      v34 = 0;
    }

    self = -[AFCommandExecutionInfo initWithExecutionID:requestID:turnId:originPeerInfo:currentHomeInfo:endpointInfo:instanceInfo:speechInfo:requestHandlingContextSnapshot:deviceRestrictions:userInfo:](self, "initWithExecutionID:requestID:turnId:originPeerInfo:currentHomeInfo:endpointInfo:instanceInfo:speechInfo:requestHandlingContextSnapshot:deviceRestrictions:userInfo:", v45, v44, v43, v42, v41, v40, v39, v38, v37, v36, v34);
    v7 = self;
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (id)buildDictionaryRepresentation
{
  id v3;
  void *v4;
  NSString *executionID;
  NSString *requestID;
  NSUUID *turnId;
  AFPeerInfo *originPeerInfo;
  void *v9;
  AFHomeInfo *currentHomeInfo;
  void *v11;
  AFEndpointInfo *endpointInfo;
  void *v13;
  AFInstanceInfo *instanceInfo;
  void *v15;
  AFSpeechInfo *speechInfo;
  void *v17;
  AFRequestHandlingContext *requestHandlingContextSnapshot;
  void *v19;
  void *v20;
  NSArray *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  NSDictionary *userInfo;
  void *v28;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  _BYTE v34[128];
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v4 = v3;
  executionID = self->_executionID;
  if (executionID)
    objc_msgSend(v3, "setObject:forKey:", executionID, CFSTR("executionID"));
  requestID = self->_requestID;
  if (requestID)
    objc_msgSend(v4, "setObject:forKey:", requestID, CFSTR("requestID"));
  turnId = self->_turnId;
  if (turnId)
    objc_msgSend(v4, "setObject:forKey:", turnId, CFSTR("turnId"));
  originPeerInfo = self->_originPeerInfo;
  if (originPeerInfo)
  {
    -[AFPeerInfo buildDictionaryRepresentation](originPeerInfo, "buildDictionaryRepresentation");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v9, CFSTR("originPeerInfo"));

  }
  currentHomeInfo = self->_currentHomeInfo;
  if (currentHomeInfo)
  {
    -[AFHomeInfo buildDictionaryRepresentation](currentHomeInfo, "buildDictionaryRepresentation");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v11, CFSTR("currentHomeInfo"));

  }
  endpointInfo = self->_endpointInfo;
  if (endpointInfo)
  {
    -[AFEndpointInfo buildDictionaryRepresentation](endpointInfo, "buildDictionaryRepresentation");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v13, CFSTR("endpointInfo"));

  }
  instanceInfo = self->_instanceInfo;
  if (instanceInfo)
  {
    -[AFInstanceInfo buildDictionaryRepresentation](instanceInfo, "buildDictionaryRepresentation");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v15, CFSTR("instanceInfo"));

  }
  speechInfo = self->_speechInfo;
  if (speechInfo)
  {
    -[AFSpeechInfo buildDictionaryRepresentation](speechInfo, "buildDictionaryRepresentation");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v17, CFSTR("speechInfo"));

  }
  requestHandlingContextSnapshot = self->_requestHandlingContextSnapshot;
  if (requestHandlingContextSnapshot)
  {
    -[AFRequestHandlingContext buildDictionaryRepresentation](requestHandlingContextSnapshot, "buildDictionaryRepresentation");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v19, CFSTR("requestHandlingContextSnapshot"));

  }
  if (self->_deviceRestrictions)
  {
    v20 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", -[NSArray count](self->_deviceRestrictions, "count"));
    v30 = 0u;
    v31 = 0u;
    v32 = 0u;
    v33 = 0u;
    v21 = self->_deviceRestrictions;
    v22 = -[NSArray countByEnumeratingWithState:objects:count:](v21, "countByEnumeratingWithState:objects:count:", &v30, v34, 16);
    if (v22)
    {
      v23 = v22;
      v24 = *(_QWORD *)v31;
      do
      {
        v25 = 0;
        do
        {
          if (*(_QWORD *)v31 != v24)
            objc_enumerationMutation(v21);
          objc_msgSend(v20, "addObject:", *(_QWORD *)(*((_QWORD *)&v30 + 1) + 8 * v25++), (_QWORD)v30);
        }
        while (v23 != v25);
        v23 = -[NSArray countByEnumeratingWithState:objects:count:](v21, "countByEnumeratingWithState:objects:count:", &v30, v34, 16);
      }
      while (v23);
    }

    v26 = (void *)objc_msgSend(v20, "copy");
    objc_msgSend(v4, "setObject:forKey:", v26, CFSTR("deviceRestrictions"));

  }
  userInfo = self->_userInfo;
  if (userInfo)
    objc_msgSend(v4, "setObject:forKey:", userInfo, CFSTR("userInfo"));
  v28 = (void *)objc_msgSend(v4, "copy", (_QWORD)v30);

  return v28;
}

- (NSString)executionID
{
  return self->_executionID;
}

- (NSString)requestID
{
  return self->_requestID;
}

- (NSUUID)turnId
{
  return self->_turnId;
}

- (AFPeerInfo)originPeerInfo
{
  return self->_originPeerInfo;
}

- (AFHomeInfo)currentHomeInfo
{
  return self->_currentHomeInfo;
}

- (AFEndpointInfo)endpointInfo
{
  return self->_endpointInfo;
}

- (AFInstanceInfo)instanceInfo
{
  return self->_instanceInfo;
}

- (AFSpeechInfo)speechInfo
{
  return self->_speechInfo;
}

- (AFRequestHandlingContext)requestHandlingContextSnapshot
{
  return self->_requestHandlingContextSnapshot;
}

- (NSArray)deviceRestrictions
{
  return self->_deviceRestrictions;
}

- (NSDictionary)userInfo
{
  return self->_userInfo;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userInfo, 0);
  objc_storeStrong((id *)&self->_deviceRestrictions, 0);
  objc_storeStrong((id *)&self->_requestHandlingContextSnapshot, 0);
  objc_storeStrong((id *)&self->_speechInfo, 0);
  objc_storeStrong((id *)&self->_instanceInfo, 0);
  objc_storeStrong((id *)&self->_endpointInfo, 0);
  objc_storeStrong((id *)&self->_currentHomeInfo, 0);
  objc_storeStrong((id *)&self->_originPeerInfo, 0);
  objc_storeStrong((id *)&self->_turnId, 0);
  objc_storeStrong((id *)&self->_requestID, 0);
  objc_storeStrong((id *)&self->_executionID, 0);
}

void __190__AFCommandExecutionInfo_initWithExecutionID_requestID_turnId_originPeerInfo_currentHomeInfo_endpointInfo_instanceInfo_speechInfo_requestHandlingContextSnapshot_deviceRestrictions_userInfo___block_invoke(_QWORD *a1, void *a2)
{
  uint64_t v3;
  id v4;

  v3 = a1[4];
  v4 = a2;
  objc_msgSend(v4, "setExecutionID:", v3);
  objc_msgSend(v4, "setRequestID:", a1[5]);
  objc_msgSend(v4, "setTurnId:", a1[6]);
  objc_msgSend(v4, "setOriginPeerInfo:", a1[7]);
  objc_msgSend(v4, "setCurrentHomeInfo:", a1[8]);
  objc_msgSend(v4, "setEndpointInfo:", a1[9]);
  objc_msgSend(v4, "setInstanceInfo:", a1[10]);
  objc_msgSend(v4, "setSpeechInfo:", a1[11]);
  objc_msgSend(v4, "setRequestHandlingContextSnapshot:", a1[12]);
  objc_msgSend(v4, "setDeviceRestrictions:", a1[13]);
  objc_msgSend(v4, "setUserInfo:", a1[14]);

}

+ (id)newWithBuilder:(id)a3
{
  id v3;
  void *v4;

  v3 = a3;
  v4 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithBuilder:", v3);

  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)mutatedCopyWithMutator:(id)a3
{
  void (**v4)(id, _AFCommandExecutionInfoMutation *);
  _AFCommandExecutionInfoMutation *v5;
  AFCommandExecutionInfo *v6;
  void *v7;
  uint64_t v8;
  NSString *executionID;
  void *v10;
  uint64_t v11;
  NSString *requestID;
  void *v13;
  uint64_t v14;
  NSUUID *turnId;
  void *v16;
  uint64_t v17;
  AFPeerInfo *originPeerInfo;
  void *v19;
  uint64_t v20;
  AFHomeInfo *currentHomeInfo;
  void *v22;
  uint64_t v23;
  AFEndpointInfo *endpointInfo;
  void *v25;
  uint64_t v26;
  AFInstanceInfo *instanceInfo;
  void *v28;
  uint64_t v29;
  AFSpeechInfo *speechInfo;
  void *v31;
  uint64_t v32;
  AFRequestHandlingContext *requestHandlingContextSnapshot;
  void *v34;
  uint64_t v35;
  NSArray *deviceRestrictions;
  void *v37;
  uint64_t v38;
  NSDictionary *userInfo;

  v4 = (void (**)(id, _AFCommandExecutionInfoMutation *))a3;
  if (v4)
  {
    v5 = -[_AFCommandExecutionInfoMutation initWithBase:]([_AFCommandExecutionInfoMutation alloc], "initWithBase:", self);
    v4[2](v4, v5);
    if (-[_AFCommandExecutionInfoMutation isDirty](v5, "isDirty"))
    {
      v6 = objc_alloc_init(AFCommandExecutionInfo);
      -[_AFCommandExecutionInfoMutation getExecutionID](v5, "getExecutionID");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v7, "copy");
      executionID = v6->_executionID;
      v6->_executionID = (NSString *)v8;

      -[_AFCommandExecutionInfoMutation getRequestID](v5, "getRequestID");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v10, "copy");
      requestID = v6->_requestID;
      v6->_requestID = (NSString *)v11;

      -[_AFCommandExecutionInfoMutation getTurnId](v5, "getTurnId");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_msgSend(v13, "copy");
      turnId = v6->_turnId;
      v6->_turnId = (NSUUID *)v14;

      -[_AFCommandExecutionInfoMutation getOriginPeerInfo](v5, "getOriginPeerInfo");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = objc_msgSend(v16, "copy");
      originPeerInfo = v6->_originPeerInfo;
      v6->_originPeerInfo = (AFPeerInfo *)v17;

      -[_AFCommandExecutionInfoMutation getCurrentHomeInfo](v5, "getCurrentHomeInfo");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = objc_msgSend(v19, "copy");
      currentHomeInfo = v6->_currentHomeInfo;
      v6->_currentHomeInfo = (AFHomeInfo *)v20;

      -[_AFCommandExecutionInfoMutation getEndpointInfo](v5, "getEndpointInfo");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = objc_msgSend(v22, "copy");
      endpointInfo = v6->_endpointInfo;
      v6->_endpointInfo = (AFEndpointInfo *)v23;

      -[_AFCommandExecutionInfoMutation getInstanceInfo](v5, "getInstanceInfo");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = objc_msgSend(v25, "copy");
      instanceInfo = v6->_instanceInfo;
      v6->_instanceInfo = (AFInstanceInfo *)v26;

      -[_AFCommandExecutionInfoMutation getSpeechInfo](v5, "getSpeechInfo");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v29 = objc_msgSend(v28, "copy");
      speechInfo = v6->_speechInfo;
      v6->_speechInfo = (AFSpeechInfo *)v29;

      -[_AFCommandExecutionInfoMutation getRequestHandlingContextSnapshot](v5, "getRequestHandlingContextSnapshot");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      v32 = objc_msgSend(v31, "copy");
      requestHandlingContextSnapshot = v6->_requestHandlingContextSnapshot;
      v6->_requestHandlingContextSnapshot = (AFRequestHandlingContext *)v32;

      -[_AFCommandExecutionInfoMutation getDeviceRestrictions](v5, "getDeviceRestrictions");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      v35 = objc_msgSend(v34, "copy");
      deviceRestrictions = v6->_deviceRestrictions;
      v6->_deviceRestrictions = (NSArray *)v35;

      -[_AFCommandExecutionInfoMutation getUserInfo](v5, "getUserInfo");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      v38 = objc_msgSend(v37, "copy");
      userInfo = v6->_userInfo;
      v6->_userInfo = (NSDictionary *)v38;

    }
    else
    {
      v6 = (AFCommandExecutionInfo *)-[AFCommandExecutionInfo copy](self, "copy");
    }

  }
  else
  {
    v6 = (AFCommandExecutionInfo *)-[AFCommandExecutionInfo copy](self, "copy");
  }

  return v6;
}

@end
