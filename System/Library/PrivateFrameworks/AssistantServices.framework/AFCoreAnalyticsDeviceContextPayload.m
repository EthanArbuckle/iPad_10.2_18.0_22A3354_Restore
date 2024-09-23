@implementation AFCoreAnalyticsDeviceContextPayload

- (AFCoreAnalyticsDeviceContextPayload)initWithBuilder:(id)a3
{
  void (**v4)(id, _AFCoreAnalyticsDeviceContextPayloadMutation *);
  AFCoreAnalyticsDeviceContextPayload *v5;
  AFCoreAnalyticsDeviceContextPayload *v6;
  _AFCoreAnalyticsDeviceContextPayloadMutation *v7;
  void *v8;
  uint64_t v9;
  NSString *nearbyProductType;
  void *v11;
  uint64_t v12;
  NSString *proximity;
  void *v14;
  uint64_t v15;
  NSNumber *alarmFiring;
  void *v17;
  uint64_t v18;
  NSNumber *timerFiring;
  void *v20;
  uint64_t v21;
  NSString *playbackState;
  void *v23;
  uint64_t v24;
  NSNumber *playbackRecency;
  void *v26;
  uint64_t v27;
  NSString *homeAnnouncementState;
  void *v29;
  uint64_t v30;
  NSNumber *homeAnnouncementRecency;
  void *v32;
  uint64_t v33;
  NSString *nearbyDevicesRequestIdentifier;
  void *v35;
  uint64_t v36;
  NSString *targetedResult;
  void *v38;
  uint64_t v39;
  NSString *contextIdentifier;
  objc_super v42;

  v4 = (void (**)(id, _AFCoreAnalyticsDeviceContextPayloadMutation *))a3;
  v42.receiver = self;
  v42.super_class = (Class)AFCoreAnalyticsDeviceContextPayload;
  v5 = -[AFCoreAnalyticsDeviceContextPayload init](&v42, sel_init);
  v6 = v5;
  if (v4 && v5)
  {
    v7 = -[_AFCoreAnalyticsDeviceContextPayloadMutation initWithBase:]([_AFCoreAnalyticsDeviceContextPayloadMutation alloc], "initWithBase:", 0);
    v4[2](v4, v7);
    if (-[_AFCoreAnalyticsDeviceContextPayloadMutation isDirty](v7, "isDirty"))
    {
      -[_AFCoreAnalyticsDeviceContextPayloadMutation getNearbyProductType](v7, "getNearbyProductType");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v8, "copy");
      nearbyProductType = v6->_nearbyProductType;
      v6->_nearbyProductType = (NSString *)v9;

      -[_AFCoreAnalyticsDeviceContextPayloadMutation getProximity](v7, "getProximity");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v11, "copy");
      proximity = v6->_proximity;
      v6->_proximity = (NSString *)v12;

      -[_AFCoreAnalyticsDeviceContextPayloadMutation getAlarmFiring](v7, "getAlarmFiring");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = objc_msgSend(v14, "copy");
      alarmFiring = v6->_alarmFiring;
      v6->_alarmFiring = (NSNumber *)v15;

      -[_AFCoreAnalyticsDeviceContextPayloadMutation getTimerFiring](v7, "getTimerFiring");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = objc_msgSend(v17, "copy");
      timerFiring = v6->_timerFiring;
      v6->_timerFiring = (NSNumber *)v18;

      -[_AFCoreAnalyticsDeviceContextPayloadMutation getPlaybackState](v7, "getPlaybackState");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = objc_msgSend(v20, "copy");
      playbackState = v6->_playbackState;
      v6->_playbackState = (NSString *)v21;

      -[_AFCoreAnalyticsDeviceContextPayloadMutation getPlaybackRecency](v7, "getPlaybackRecency");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = objc_msgSend(v23, "copy");
      playbackRecency = v6->_playbackRecency;
      v6->_playbackRecency = (NSNumber *)v24;

      -[_AFCoreAnalyticsDeviceContextPayloadMutation getHomeAnnouncementState](v7, "getHomeAnnouncementState");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = objc_msgSend(v26, "copy");
      homeAnnouncementState = v6->_homeAnnouncementState;
      v6->_homeAnnouncementState = (NSString *)v27;

      -[_AFCoreAnalyticsDeviceContextPayloadMutation getHomeAnnouncementRecency](v7, "getHomeAnnouncementRecency");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      v30 = objc_msgSend(v29, "copy");
      homeAnnouncementRecency = v6->_homeAnnouncementRecency;
      v6->_homeAnnouncementRecency = (NSNumber *)v30;

      -[_AFCoreAnalyticsDeviceContextPayloadMutation getNearbyDevicesRequestIdentifier](v7, "getNearbyDevicesRequestIdentifier");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      v33 = objc_msgSend(v32, "copy");
      nearbyDevicesRequestIdentifier = v6->_nearbyDevicesRequestIdentifier;
      v6->_nearbyDevicesRequestIdentifier = (NSString *)v33;

      -[_AFCoreAnalyticsDeviceContextPayloadMutation getTargetedResult](v7, "getTargetedResult");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      v36 = objc_msgSend(v35, "copy");
      targetedResult = v6->_targetedResult;
      v6->_targetedResult = (NSString *)v36;

      -[_AFCoreAnalyticsDeviceContextPayloadMutation getContextIdentifier](v7, "getContextIdentifier");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      v39 = objc_msgSend(v38, "copy");
      contextIdentifier = v6->_contextIdentifier;
      v6->_contextIdentifier = (NSString *)v39;

    }
  }

  return v6;
}

- (AFCoreAnalyticsDeviceContextPayload)init
{
  return -[AFCoreAnalyticsDeviceContextPayload initWithBuilder:](self, "initWithBuilder:", 0);
}

- (AFCoreAnalyticsDeviceContextPayload)initWithNearbyProductType:(id)a3 proximity:(id)a4 alarmFiring:(id)a5 timerFiring:(id)a6 playbackState:(id)a7 playbackRecency:(id)a8 homeAnnouncementState:(id)a9 homeAnnouncementRecency:(id)a10 nearbyDevicesRequestIdentifier:(id)a11 targetedResult:(id)a12 contextIdentifier:(id)a13
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
  AFCoreAnalyticsDeviceContextPayload *v37;
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
  v43[2] = __239__AFCoreAnalyticsDeviceContextPayload_initWithNearbyProductType_proximity_alarmFiring_timerFiring_playbackState_playbackRecency_homeAnnouncementState_homeAnnouncementRecency_nearbyDevicesRequestIdentifier_targetedResult_contextIdentifier___block_invoke;
  v43[3] = &unk_1E3A2C678;
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
  v37 = -[AFCoreAnalyticsDeviceContextPayload initWithBuilder:](self, "initWithBuilder:", v43);

  return v37;
}

- (NSString)description
{
  return (NSString *)-[AFCoreAnalyticsDeviceContextPayload _descriptionWithIndent:](self, "_descriptionWithIndent:", 0);
}

- (id)_descriptionWithIndent:(unint64_t)a3
{
  id v4;
  void *v5;
  void *v6;
  objc_super v8;

  v4 = objc_alloc(MEMORY[0x1E0CB3940]);
  v8.receiver = self;
  v8.super_class = (Class)AFCoreAnalyticsDeviceContextPayload;
  -[AFCoreAnalyticsDeviceContextPayload description](&v8, sel_description);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v4, "initWithFormat:", CFSTR("%@ {nearbyProductType = %@, proximity = %@, alarmFiring = %@, timerFiring = %@, playbackState = %@, playbackRecency = %@, homeAnnouncementState = %@, homeAnnouncementRecency = %@, nearbyDevicesRequestIdentifier = %@, targetedResult = %@, contextIdentifier = %@}"), v5, self->_nearbyProductType, self->_proximity, self->_alarmFiring, self->_timerFiring, self->_playbackState, self->_playbackRecency, self->_homeAnnouncementState, self->_homeAnnouncementRecency, self->_nearbyDevicesRequestIdentifier, self->_targetedResult, self->_contextIdentifier);

  return v6;
}

- (unint64_t)hash
{
  NSUInteger v3;
  NSUInteger v4;
  uint64_t v5;
  uint64_t v6;
  NSUInteger v7;
  uint64_t v8;
  NSUInteger v9;
  uint64_t v10;
  NSUInteger v11;
  NSUInteger v12;

  v3 = -[NSString hash](self->_nearbyProductType, "hash");
  v4 = -[NSString hash](self->_proximity, "hash") ^ v3;
  v5 = -[NSNumber hash](self->_alarmFiring, "hash");
  v6 = v4 ^ v5 ^ -[NSNumber hash](self->_timerFiring, "hash");
  v7 = -[NSString hash](self->_playbackState, "hash");
  v8 = v7 ^ -[NSNumber hash](self->_playbackRecency, "hash");
  v9 = v6 ^ v8 ^ -[NSString hash](self->_homeAnnouncementState, "hash");
  v10 = -[NSNumber hash](self->_homeAnnouncementRecency, "hash");
  v11 = v10 ^ -[NSString hash](self->_nearbyDevicesRequestIdentifier, "hash");
  v12 = v11 ^ -[NSString hash](self->_targetedResult, "hash");
  return v9 ^ v12 ^ -[NSString hash](self->_contextIdentifier, "hash");
}

- (BOOL)isEqual:(id)a3
{
  AFCoreAnalyticsDeviceContextPayload *v4;
  AFCoreAnalyticsDeviceContextPayload *v5;
  NSString *v6;
  NSString *nearbyProductType;
  NSString *v8;
  NSString *proximity;
  NSNumber *v10;
  NSNumber *alarmFiring;
  NSNumber *v12;
  NSNumber *timerFiring;
  NSString *v14;
  NSString *playbackState;
  NSNumber *v16;
  NSNumber *playbackRecency;
  NSString *v18;
  NSString *homeAnnouncementState;
  NSNumber *v20;
  NSNumber *homeAnnouncementRecency;
  NSString *v22;
  NSString *nearbyDevicesRequestIdentifier;
  NSString *v24;
  NSString *targetedResult;
  NSString *v26;
  NSString *contextIdentifier;
  NSString *v28;
  int v29;
  BOOL v30;
  NSString *v32;
  NSNumber *v33;
  NSString *v34;

  v4 = (AFCoreAnalyticsDeviceContextPayload *)a3;
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
      -[AFCoreAnalyticsDeviceContextPayload nearbyProductType](v5, "nearbyProductType");
      v6 = (NSString *)objc_claimAutoreleasedReturnValue();
      nearbyProductType = self->_nearbyProductType;
      if (nearbyProductType == v6 || -[NSString isEqual:](nearbyProductType, "isEqual:", v6))
      {
        -[AFCoreAnalyticsDeviceContextPayload proximity](v5, "proximity");
        v8 = (NSString *)objc_claimAutoreleasedReturnValue();
        proximity = self->_proximity;
        if (proximity == v8 || -[NSString isEqual:](proximity, "isEqual:", v8))
        {
          -[AFCoreAnalyticsDeviceContextPayload alarmFiring](v5, "alarmFiring");
          v10 = (NSNumber *)objc_claimAutoreleasedReturnValue();
          alarmFiring = self->_alarmFiring;
          if (alarmFiring == v10 || -[NSNumber isEqual:](alarmFiring, "isEqual:", v10))
          {
            -[AFCoreAnalyticsDeviceContextPayload timerFiring](v5, "timerFiring");
            v12 = (NSNumber *)objc_claimAutoreleasedReturnValue();
            timerFiring = self->_timerFiring;
            if (timerFiring == v12 || -[NSNumber isEqual:](timerFiring, "isEqual:", v12))
            {
              -[AFCoreAnalyticsDeviceContextPayload playbackState](v5, "playbackState");
              v14 = (NSString *)objc_claimAutoreleasedReturnValue();
              playbackState = self->_playbackState;
              if (playbackState == v14 || -[NSString isEqual:](playbackState, "isEqual:", v14))
              {
                -[AFCoreAnalyticsDeviceContextPayload playbackRecency](v5, "playbackRecency");
                v16 = (NSNumber *)objc_claimAutoreleasedReturnValue();
                playbackRecency = self->_playbackRecency;
                if (playbackRecency == v16 || -[NSNumber isEqual:](playbackRecency, "isEqual:", v16))
                {
                  -[AFCoreAnalyticsDeviceContextPayload homeAnnouncementState](v5, "homeAnnouncementState");
                  v18 = (NSString *)objc_claimAutoreleasedReturnValue();
                  homeAnnouncementState = self->_homeAnnouncementState;
                  if (homeAnnouncementState == v18
                    || -[NSString isEqual:](homeAnnouncementState, "isEqual:", v18))
                  {
                    v34 = v18;
                    -[AFCoreAnalyticsDeviceContextPayload homeAnnouncementRecency](v5, "homeAnnouncementRecency");
                    v20 = (NSNumber *)objc_claimAutoreleasedReturnValue();
                    homeAnnouncementRecency = self->_homeAnnouncementRecency;
                    if (homeAnnouncementRecency == v20
                      || -[NSNumber isEqual:](homeAnnouncementRecency, "isEqual:", v20))
                    {
                      v33 = v20;
                      -[AFCoreAnalyticsDeviceContextPayload nearbyDevicesRequestIdentifier](v5, "nearbyDevicesRequestIdentifier");
                      v22 = (NSString *)objc_claimAutoreleasedReturnValue();
                      nearbyDevicesRequestIdentifier = self->_nearbyDevicesRequestIdentifier;
                      if (nearbyDevicesRequestIdentifier == v22
                        || -[NSString isEqual:](nearbyDevicesRequestIdentifier, "isEqual:", v22))
                      {
                        v32 = v22;
                        -[AFCoreAnalyticsDeviceContextPayload targetedResult](v5, "targetedResult");
                        v24 = (NSString *)objc_claimAutoreleasedReturnValue();
                        targetedResult = self->_targetedResult;
                        if (targetedResult == v24
                          || -[NSString isEqual:](targetedResult, "isEqual:", v24))
                        {
                          -[AFCoreAnalyticsDeviceContextPayload contextIdentifier](v5, "contextIdentifier");
                          v26 = (NSString *)objc_claimAutoreleasedReturnValue();
                          contextIdentifier = self->_contextIdentifier;
                          v30 = 1;
                          if (contextIdentifier != v26)
                          {
                            v28 = v26;
                            v29 = -[NSString isEqual:](contextIdentifier, "isEqual:", v26);
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

- (AFCoreAnalyticsDeviceContextPayload)initWithCoder:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v13;
  void *v14;
  AFCoreAnalyticsDeviceContextPayload *v16;
  void *v17;

  v3 = a3;
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("AFCoreAnalyticsDeviceContextPayload::nearbyProductType"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("AFCoreAnalyticsDeviceContextPayload::proximity"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("AFCoreAnalyticsDeviceContextPayload::alarmFiring"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("AFCoreAnalyticsDeviceContextPayload::timerFiring"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("AFCoreAnalyticsDeviceContextPayload::playbackState"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("AFCoreAnalyticsDeviceContextPayload::playbackRecency"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("AFCoreAnalyticsDeviceContextPayload::homeAnnouncementState"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("AFCoreAnalyticsDeviceContextPayload::homeAnnouncementRecency"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("AFCoreAnalyticsDeviceContextPayload::nearbyDevicesRequestIdentifier"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("AFCoreAnalyticsDeviceContextPayload::targetedResult"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("AFCoreAnalyticsDeviceContextPayload::contextIdentifier"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v16 = -[AFCoreAnalyticsDeviceContextPayload initWithNearbyProductType:proximity:alarmFiring:timerFiring:playbackState:playbackRecency:homeAnnouncementState:homeAnnouncementRecency:nearbyDevicesRequestIdentifier:targetedResult:contextIdentifier:](self, "initWithNearbyProductType:proximity:alarmFiring:timerFiring:playbackState:playbackRecency:homeAnnouncementState:homeAnnouncementRecency:nearbyDevicesRequestIdentifier:targetedResult:contextIdentifier:", v4, v5, v6, v7, v17, v14, v13, v8, v9, v10, v11);
  return v16;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *nearbyProductType;
  id v5;

  nearbyProductType = self->_nearbyProductType;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", nearbyProductType, CFSTR("AFCoreAnalyticsDeviceContextPayload::nearbyProductType"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_proximity, CFSTR("AFCoreAnalyticsDeviceContextPayload::proximity"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_alarmFiring, CFSTR("AFCoreAnalyticsDeviceContextPayload::alarmFiring"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_timerFiring, CFSTR("AFCoreAnalyticsDeviceContextPayload::timerFiring"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_playbackState, CFSTR("AFCoreAnalyticsDeviceContextPayload::playbackState"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_playbackRecency, CFSTR("AFCoreAnalyticsDeviceContextPayload::playbackRecency"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_homeAnnouncementState, CFSTR("AFCoreAnalyticsDeviceContextPayload::homeAnnouncementState"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_homeAnnouncementRecency, CFSTR("AFCoreAnalyticsDeviceContextPayload::homeAnnouncementRecency"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_nearbyDevicesRequestIdentifier, CFSTR("AFCoreAnalyticsDeviceContextPayload::nearbyDevicesRequestIdentifier"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_targetedResult, CFSTR("AFCoreAnalyticsDeviceContextPayload::targetedResult"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_contextIdentifier, CFSTR("AFCoreAnalyticsDeviceContextPayload::contextIdentifier"));

}

- (AFCoreAnalyticsDeviceContextPayload)initWithDictionaryRepresentation:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  AFCoreAnalyticsDeviceContextPayload *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  id v15;
  void *v16;
  id v17;
  void *v18;
  id v19;
  void *v20;
  id v21;
  void *v22;
  id v23;
  AFCoreAnalyticsDeviceContextPayload *v25;
  id v26;
  id v27;
  id v28;
  id v29;
  id v30;

  v4 = a3;
  v5 = v4;
  if (v4)
  {
    objc_msgSend(v4, "objectForKey:", CFSTR("nearbyProductType"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v30 = v6;
    else
      v30 = 0;

    objc_msgSend(v5, "objectForKey:", CFSTR("proximity"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v29 = v8;
    else
      v29 = 0;

    objc_msgSend(v5, "objectForKey:", CFSTR("alarmFiring"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v28 = v9;
    else
      v28 = 0;

    objc_msgSend(v5, "objectForKey:", CFSTR("timerFiring"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v27 = v10;
    else
      v27 = 0;

    objc_msgSend(v5, "objectForKey:", CFSTR("playbackState"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v26 = v11;
    else
      v26 = 0;

    objc_msgSend(v5, "objectForKey:", CFSTR("playbackRecency"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v13 = v12;
    else
      v13 = 0;

    objc_msgSend(v5, "objectForKey:", CFSTR("homeAnnouncementState"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v15 = v14;
    else
      v15 = 0;

    objc_msgSend(v5, "objectForKey:", CFSTR("homeAnnouncementRecency"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v17 = v16;
    else
      v17 = 0;

    objc_msgSend(v5, "objectForKey:", CFSTR("nearbyDevicesRequestIdentifier"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v19 = v18;
    else
      v19 = 0;

    objc_msgSend(v5, "objectForKey:", CFSTR("targetedResult"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v21 = v20;
    else
      v21 = 0;

    objc_msgSend(v5, "objectForKey:", CFSTR("contextIdentifier"));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v23 = v22;
    else
      v23 = 0;

    v25 = -[AFCoreAnalyticsDeviceContextPayload initWithNearbyProductType:proximity:alarmFiring:timerFiring:playbackState:playbackRecency:homeAnnouncementState:homeAnnouncementRecency:nearbyDevicesRequestIdentifier:targetedResult:contextIdentifier:](self, "initWithNearbyProductType:proximity:alarmFiring:timerFiring:playbackState:playbackRecency:homeAnnouncementState:homeAnnouncementRecency:nearbyDevicesRequestIdentifier:targetedResult:contextIdentifier:", v30, v29, v28, v27, v26, v13, v15, v17, v19, v21, v23);
    self = v25;

    v7 = v25;
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
  NSString *nearbyProductType;
  NSString *proximity;
  NSNumber *alarmFiring;
  NSNumber *timerFiring;
  NSString *playbackState;
  NSNumber *playbackRecency;
  NSString *homeAnnouncementState;
  NSNumber *homeAnnouncementRecency;
  NSString *nearbyDevicesRequestIdentifier;
  NSString *targetedResult;
  NSString *contextIdentifier;
  void *v16;

  v3 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v4 = v3;
  nearbyProductType = self->_nearbyProductType;
  if (nearbyProductType)
    objc_msgSend(v3, "setObject:forKey:", nearbyProductType, CFSTR("nearbyProductType"));
  proximity = self->_proximity;
  if (proximity)
    objc_msgSend(v4, "setObject:forKey:", proximity, CFSTR("proximity"));
  alarmFiring = self->_alarmFiring;
  if (alarmFiring)
    objc_msgSend(v4, "setObject:forKey:", alarmFiring, CFSTR("alarmFiring"));
  timerFiring = self->_timerFiring;
  if (timerFiring)
    objc_msgSend(v4, "setObject:forKey:", timerFiring, CFSTR("timerFiring"));
  playbackState = self->_playbackState;
  if (playbackState)
    objc_msgSend(v4, "setObject:forKey:", playbackState, CFSTR("playbackState"));
  playbackRecency = self->_playbackRecency;
  if (playbackRecency)
    objc_msgSend(v4, "setObject:forKey:", playbackRecency, CFSTR("playbackRecency"));
  homeAnnouncementState = self->_homeAnnouncementState;
  if (homeAnnouncementState)
    objc_msgSend(v4, "setObject:forKey:", homeAnnouncementState, CFSTR("homeAnnouncementState"));
  homeAnnouncementRecency = self->_homeAnnouncementRecency;
  if (homeAnnouncementRecency)
    objc_msgSend(v4, "setObject:forKey:", homeAnnouncementRecency, CFSTR("homeAnnouncementRecency"));
  nearbyDevicesRequestIdentifier = self->_nearbyDevicesRequestIdentifier;
  if (nearbyDevicesRequestIdentifier)
    objc_msgSend(v4, "setObject:forKey:", nearbyDevicesRequestIdentifier, CFSTR("nearbyDevicesRequestIdentifier"));
  targetedResult = self->_targetedResult;
  if (targetedResult)
    objc_msgSend(v4, "setObject:forKey:", targetedResult, CFSTR("targetedResult"));
  contextIdentifier = self->_contextIdentifier;
  if (contextIdentifier)
    objc_msgSend(v4, "setObject:forKey:", contextIdentifier, CFSTR("contextIdentifier"));
  v16 = (void *)objc_msgSend(v4, "copy");

  return v16;
}

- (NSString)nearbyProductType
{
  return self->_nearbyProductType;
}

- (NSString)proximity
{
  return self->_proximity;
}

- (NSNumber)alarmFiring
{
  return self->_alarmFiring;
}

- (NSNumber)timerFiring
{
  return self->_timerFiring;
}

- (NSString)playbackState
{
  return self->_playbackState;
}

- (NSNumber)playbackRecency
{
  return self->_playbackRecency;
}

- (NSString)homeAnnouncementState
{
  return self->_homeAnnouncementState;
}

- (NSNumber)homeAnnouncementRecency
{
  return self->_homeAnnouncementRecency;
}

- (NSString)nearbyDevicesRequestIdentifier
{
  return self->_nearbyDevicesRequestIdentifier;
}

- (NSString)targetedResult
{
  return self->_targetedResult;
}

- (NSString)contextIdentifier
{
  return self->_contextIdentifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contextIdentifier, 0);
  objc_storeStrong((id *)&self->_targetedResult, 0);
  objc_storeStrong((id *)&self->_nearbyDevicesRequestIdentifier, 0);
  objc_storeStrong((id *)&self->_homeAnnouncementRecency, 0);
  objc_storeStrong((id *)&self->_homeAnnouncementState, 0);
  objc_storeStrong((id *)&self->_playbackRecency, 0);
  objc_storeStrong((id *)&self->_playbackState, 0);
  objc_storeStrong((id *)&self->_timerFiring, 0);
  objc_storeStrong((id *)&self->_alarmFiring, 0);
  objc_storeStrong((id *)&self->_proximity, 0);
  objc_storeStrong((id *)&self->_nearbyProductType, 0);
}

void __239__AFCoreAnalyticsDeviceContextPayload_initWithNearbyProductType_proximity_alarmFiring_timerFiring_playbackState_playbackRecency_homeAnnouncementState_homeAnnouncementRecency_nearbyDevicesRequestIdentifier_targetedResult_contextIdentifier___block_invoke(_QWORD *a1, void *a2)
{
  uint64_t v3;
  id v4;

  v3 = a1[4];
  v4 = a2;
  objc_msgSend(v4, "setNearbyProductType:", v3);
  objc_msgSend(v4, "setProximity:", a1[5]);
  objc_msgSend(v4, "setAlarmFiring:", a1[6]);
  objc_msgSend(v4, "setTimerFiring:", a1[7]);
  objc_msgSend(v4, "setPlaybackState:", a1[8]);
  objc_msgSend(v4, "setPlaybackRecency:", a1[9]);
  objc_msgSend(v4, "setHomeAnnouncementState:", a1[10]);
  objc_msgSend(v4, "setHomeAnnouncementRecency:", a1[11]);
  objc_msgSend(v4, "setNearbyDevicesRequestIdentifier:", a1[12]);
  objc_msgSend(v4, "setTargetedResult:", a1[13]);
  objc_msgSend(v4, "setContextIdentifier:", a1[14]);

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
  void (**v4)(id, _AFCoreAnalyticsDeviceContextPayloadMutation *);
  _AFCoreAnalyticsDeviceContextPayloadMutation *v5;
  AFCoreAnalyticsDeviceContextPayload *v6;
  void *v7;
  uint64_t v8;
  NSString *nearbyProductType;
  void *v10;
  uint64_t v11;
  NSString *proximity;
  void *v13;
  uint64_t v14;
  NSNumber *alarmFiring;
  void *v16;
  uint64_t v17;
  NSNumber *timerFiring;
  void *v19;
  uint64_t v20;
  NSString *playbackState;
  void *v22;
  uint64_t v23;
  NSNumber *playbackRecency;
  void *v25;
  uint64_t v26;
  NSString *homeAnnouncementState;
  void *v28;
  uint64_t v29;
  NSNumber *homeAnnouncementRecency;
  void *v31;
  uint64_t v32;
  NSString *nearbyDevicesRequestIdentifier;
  void *v34;
  uint64_t v35;
  NSString *targetedResult;
  void *v37;
  uint64_t v38;
  NSString *contextIdentifier;

  v4 = (void (**)(id, _AFCoreAnalyticsDeviceContextPayloadMutation *))a3;
  if (v4)
  {
    v5 = -[_AFCoreAnalyticsDeviceContextPayloadMutation initWithBase:]([_AFCoreAnalyticsDeviceContextPayloadMutation alloc], "initWithBase:", self);
    v4[2](v4, v5);
    if (-[_AFCoreAnalyticsDeviceContextPayloadMutation isDirty](v5, "isDirty"))
    {
      v6 = objc_alloc_init(AFCoreAnalyticsDeviceContextPayload);
      -[_AFCoreAnalyticsDeviceContextPayloadMutation getNearbyProductType](v5, "getNearbyProductType");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v7, "copy");
      nearbyProductType = v6->_nearbyProductType;
      v6->_nearbyProductType = (NSString *)v8;

      -[_AFCoreAnalyticsDeviceContextPayloadMutation getProximity](v5, "getProximity");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v10, "copy");
      proximity = v6->_proximity;
      v6->_proximity = (NSString *)v11;

      -[_AFCoreAnalyticsDeviceContextPayloadMutation getAlarmFiring](v5, "getAlarmFiring");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_msgSend(v13, "copy");
      alarmFiring = v6->_alarmFiring;
      v6->_alarmFiring = (NSNumber *)v14;

      -[_AFCoreAnalyticsDeviceContextPayloadMutation getTimerFiring](v5, "getTimerFiring");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = objc_msgSend(v16, "copy");
      timerFiring = v6->_timerFiring;
      v6->_timerFiring = (NSNumber *)v17;

      -[_AFCoreAnalyticsDeviceContextPayloadMutation getPlaybackState](v5, "getPlaybackState");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = objc_msgSend(v19, "copy");
      playbackState = v6->_playbackState;
      v6->_playbackState = (NSString *)v20;

      -[_AFCoreAnalyticsDeviceContextPayloadMutation getPlaybackRecency](v5, "getPlaybackRecency");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = objc_msgSend(v22, "copy");
      playbackRecency = v6->_playbackRecency;
      v6->_playbackRecency = (NSNumber *)v23;

      -[_AFCoreAnalyticsDeviceContextPayloadMutation getHomeAnnouncementState](v5, "getHomeAnnouncementState");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = objc_msgSend(v25, "copy");
      homeAnnouncementState = v6->_homeAnnouncementState;
      v6->_homeAnnouncementState = (NSString *)v26;

      -[_AFCoreAnalyticsDeviceContextPayloadMutation getHomeAnnouncementRecency](v5, "getHomeAnnouncementRecency");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v29 = objc_msgSend(v28, "copy");
      homeAnnouncementRecency = v6->_homeAnnouncementRecency;
      v6->_homeAnnouncementRecency = (NSNumber *)v29;

      -[_AFCoreAnalyticsDeviceContextPayloadMutation getNearbyDevicesRequestIdentifier](v5, "getNearbyDevicesRequestIdentifier");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      v32 = objc_msgSend(v31, "copy");
      nearbyDevicesRequestIdentifier = v6->_nearbyDevicesRequestIdentifier;
      v6->_nearbyDevicesRequestIdentifier = (NSString *)v32;

      -[_AFCoreAnalyticsDeviceContextPayloadMutation getTargetedResult](v5, "getTargetedResult");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      v35 = objc_msgSend(v34, "copy");
      targetedResult = v6->_targetedResult;
      v6->_targetedResult = (NSString *)v35;

      -[_AFCoreAnalyticsDeviceContextPayloadMutation getContextIdentifier](v5, "getContextIdentifier");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      v38 = objc_msgSend(v37, "copy");
      contextIdentifier = v6->_contextIdentifier;
      v6->_contextIdentifier = (NSString *)v38;

    }
    else
    {
      v6 = (AFCoreAnalyticsDeviceContextPayload *)-[AFCoreAnalyticsDeviceContextPayload copy](self, "copy");
    }

  }
  else
  {
    v6 = (AFCoreAnalyticsDeviceContextPayload *)-[AFCoreAnalyticsDeviceContextPayload copy](self, "copy");
  }

  return v6;
}

@end
