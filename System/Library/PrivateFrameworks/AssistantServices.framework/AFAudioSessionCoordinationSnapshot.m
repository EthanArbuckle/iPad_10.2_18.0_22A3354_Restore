@implementation AFAudioSessionCoordinationSnapshot

- (AFAudioSessionCoordinationSnapshot)initWithBuilder:(id)a3
{
  void (**v4)(id, _AFAudioSessionCoordinationSnapshotMutation *);
  AFAudioSessionCoordinationSnapshot *v5;
  AFAudioSessionCoordinationSnapshot *v6;
  _AFAudioSessionCoordinationSnapshotMutation *v7;
  void *v8;
  uint64_t v9;
  NSDateInterval *currentOrUpNextDateInterval;
  void *v11;
  uint64_t v12;
  NSArray *localActiveAssertionContexts;
  void *v14;
  uint64_t v15;
  NSArray *localPendingAssertionContexts;
  void *v17;
  uint64_t v18;
  NSArray *remoteActiveAssertionContexts;
  void *v20;
  uint64_t v21;
  NSArray *remotePendingAssertionContexts;
  void *v23;
  uint64_t v24;
  AFAudioSessionCoordinationDeviceInfo *localDevice;
  void *v26;
  uint64_t v27;
  NSArray *remoteQualifiedInRangeDevices;
  void *v29;
  uint64_t v30;
  NSArray *remoteQualifiedOutOfRangeDevices;
  void *v32;
  uint64_t v33;
  NSArray *remoteDisqualifiedDevices;
  objc_super v36;

  v4 = (void (**)(id, _AFAudioSessionCoordinationSnapshotMutation *))a3;
  v36.receiver = self;
  v36.super_class = (Class)AFAudioSessionCoordinationSnapshot;
  v5 = -[AFAudioSessionCoordinationSnapshot init](&v36, sel_init);
  v6 = v5;
  if (v4 && v5)
  {
    v7 = -[_AFAudioSessionCoordinationSnapshotMutation initWithBase:]([_AFAudioSessionCoordinationSnapshotMutation alloc], "initWithBase:", 0);
    v4[2](v4, v7);
    if (-[_AFAudioSessionCoordinationSnapshotMutation isDirty](v7, "isDirty"))
    {
      -[_AFAudioSessionCoordinationSnapshotMutation getCurrentOrUpNextDateInterval](v7, "getCurrentOrUpNextDateInterval");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v8, "copy");
      currentOrUpNextDateInterval = v6->_currentOrUpNextDateInterval;
      v6->_currentOrUpNextDateInterval = (NSDateInterval *)v9;

      v6->_isAudioSessionActive = -[_AFAudioSessionCoordinationSnapshotMutation getIsAudioSessionActive](v7, "getIsAudioSessionActive");
      -[_AFAudioSessionCoordinationSnapshotMutation getLocalActiveAssertionContexts](v7, "getLocalActiveAssertionContexts");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v11, "copy");
      localActiveAssertionContexts = v6->_localActiveAssertionContexts;
      v6->_localActiveAssertionContexts = (NSArray *)v12;

      -[_AFAudioSessionCoordinationSnapshotMutation getLocalPendingAssertionContexts](v7, "getLocalPendingAssertionContexts");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = objc_msgSend(v14, "copy");
      localPendingAssertionContexts = v6->_localPendingAssertionContexts;
      v6->_localPendingAssertionContexts = (NSArray *)v15;

      -[_AFAudioSessionCoordinationSnapshotMutation getRemoteActiveAssertionContexts](v7, "getRemoteActiveAssertionContexts");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = objc_msgSend(v17, "copy");
      remoteActiveAssertionContexts = v6->_remoteActiveAssertionContexts;
      v6->_remoteActiveAssertionContexts = (NSArray *)v18;

      -[_AFAudioSessionCoordinationSnapshotMutation getRemotePendingAssertionContexts](v7, "getRemotePendingAssertionContexts");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = objc_msgSend(v20, "copy");
      remotePendingAssertionContexts = v6->_remotePendingAssertionContexts;
      v6->_remotePendingAssertionContexts = (NSArray *)v21;

      -[_AFAudioSessionCoordinationSnapshotMutation getLocalDevice](v7, "getLocalDevice");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = objc_msgSend(v23, "copy");
      localDevice = v6->_localDevice;
      v6->_localDevice = (AFAudioSessionCoordinationDeviceInfo *)v24;

      -[_AFAudioSessionCoordinationSnapshotMutation getRemoteQualifiedInRangeDevices](v7, "getRemoteQualifiedInRangeDevices");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = objc_msgSend(v26, "copy");
      remoteQualifiedInRangeDevices = v6->_remoteQualifiedInRangeDevices;
      v6->_remoteQualifiedInRangeDevices = (NSArray *)v27;

      -[_AFAudioSessionCoordinationSnapshotMutation getRemoteQualifiedOutOfRangeDevices](v7, "getRemoteQualifiedOutOfRangeDevices");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      v30 = objc_msgSend(v29, "copy");
      remoteQualifiedOutOfRangeDevices = v6->_remoteQualifiedOutOfRangeDevices;
      v6->_remoteQualifiedOutOfRangeDevices = (NSArray *)v30;

      -[_AFAudioSessionCoordinationSnapshotMutation getRemoteDisqualifiedDevices](v7, "getRemoteDisqualifiedDevices");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      v33 = objc_msgSend(v32, "copy");
      remoteDisqualifiedDevices = v6->_remoteDisqualifiedDevices;
      v6->_remoteDisqualifiedDevices = (NSArray *)v33;

    }
  }

  return v6;
}

- (AFAudioSessionCoordinationSnapshot)init
{
  return -[AFAudioSessionCoordinationSnapshot initWithBuilder:](self, "initWithBuilder:", 0);
}

- (AFAudioSessionCoordinationSnapshot)initWithCurrentOrUpNextDateInterval:(id)a3 isAudioSessionActive:(BOOL)a4 localActiveAssertionContexts:(id)a5 localPendingAssertionContexts:(id)a6 remoteActiveAssertionContexts:(id)a7 remotePendingAssertionContexts:(id)a8 localDevice:(id)a9 remoteQualifiedInRangeDevices:(id)a10 remoteQualifiedOutOfRangeDevices:(id)a11 remoteDisqualifiedDevices:(id)a12
{
  id v16;
  id v17;
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
  AFAudioSessionCoordinationSnapshot *v33;
  id v35;
  _QWORD v38[4];
  id v39;
  id v40;
  id v41;
  id v42;
  id v43;
  id v44;
  id v45;
  id v46;
  id v47;
  BOOL v48;

  v35 = a3;
  v16 = a5;
  v17 = a6;
  v18 = a7;
  v19 = a8;
  v20 = a9;
  v21 = a10;
  v22 = a11;
  v23 = a12;
  v38[0] = MEMORY[0x1E0C809B0];
  v38[1] = 3221225472;
  v38[2] = __316__AFAudioSessionCoordinationSnapshot_initWithCurrentOrUpNextDateInterval_isAudioSessionActive_localActiveAssertionContexts_localPendingAssertionContexts_remoteActiveAssertionContexts_remotePendingAssertionContexts_localDevice_remoteQualifiedInRangeDevices_remoteQualifiedOutOfRangeDevices_remoteDisqualifiedDevices___block_invoke;
  v38[3] = &unk_1E3A34EA0;
  v48 = a4;
  v39 = v35;
  v40 = v16;
  v41 = v17;
  v42 = v18;
  v43 = v19;
  v44 = v20;
  v45 = v21;
  v46 = v22;
  v47 = v23;
  v24 = v23;
  v25 = v22;
  v26 = v21;
  v27 = v20;
  v28 = v19;
  v29 = v18;
  v30 = v17;
  v31 = v16;
  v32 = v35;
  v33 = -[AFAudioSessionCoordinationSnapshot initWithBuilder:](self, "initWithBuilder:", v38);

  return v33;
}

- (NSString)description
{
  return (NSString *)-[AFAudioSessionCoordinationSnapshot _descriptionWithIndent:](self, "_descriptionWithIndent:", 0);
}

- (id)_descriptionWithIndent:(unint64_t)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  const __CFString *v7;
  void *v8;
  objc_super v10;

  v4 = objc_alloc(MEMORY[0x1E0CB3940]);
  v10.receiver = self;
  v10.super_class = (Class)AFAudioSessionCoordinationSnapshot;
  -[AFAudioSessionCoordinationSnapshot description](&v10, sel_description);
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = (void *)v5;
  if (self->_isAudioSessionActive)
    v7 = CFSTR("YES");
  else
    v7 = CFSTR("NO");
  v8 = (void *)objc_msgSend(v4, "initWithFormat:", CFSTR("%@ {currentOrUpNextDateInterval = %@, isAudioSessionActive = %@, localActiveAssertionContexts = %@, localPendingAssertionContexts = %@, remoteActiveAssertionContexts = %@, remotePendingAssertionContexts = %@, localDevice = %@, remoteQualifiedInRangeDevices = %@, remoteQualifiedOutOfRangeDevices = %@, remoteDisqualifiedDevices = %@}"), v5, self->_currentOrUpNextDateInterval, v7, self->_localActiveAssertionContexts, self->_localPendingAssertionContexts, self->_remoteActiveAssertionContexts, self->_remotePendingAssertionContexts, self->_localDevice, self->_remoteQualifiedInRangeDevices, self->_remoteQualifiedOutOfRangeDevices, self->_remoteDisqualifiedDevices);

  return v8;
}

- (unint64_t)hash
{
  uint64_t v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;

  v3 = -[NSDateInterval hash](self->_currentOrUpNextDateInterval, "hash");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_isAudioSessionActive);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "hash");
  v6 = v3 ^ -[NSArray hash](self->_localActiveAssertionContexts, "hash");
  v7 = v5 ^ v6 ^ -[NSArray hash](self->_localPendingAssertionContexts, "hash");
  v8 = -[NSArray hash](self->_remoteActiveAssertionContexts, "hash");
  v9 = v8 ^ -[NSArray hash](self->_remotePendingAssertionContexts, "hash");
  v10 = v9 ^ -[AFAudioSessionCoordinationDeviceInfo hash](self->_localDevice, "hash");
  v11 = v7 ^ v10 ^ -[NSArray hash](self->_remoteQualifiedInRangeDevices, "hash");
  v12 = -[NSArray hash](self->_remoteQualifiedOutOfRangeDevices, "hash");
  v13 = v11 ^ v12 ^ -[NSArray hash](self->_remoteDisqualifiedDevices, "hash");

  return v13;
}

- (BOOL)isEqual:(id)a3
{
  AFAudioSessionCoordinationSnapshot *v4;
  AFAudioSessionCoordinationSnapshot *v5;
  _BOOL4 isAudioSessionActive;
  NSDateInterval *v7;
  NSDateInterval *currentOrUpNextDateInterval;
  NSArray *v9;
  NSArray *localActiveAssertionContexts;
  NSArray *v11;
  NSArray *localPendingAssertionContexts;
  NSArray *v13;
  NSArray *remoteActiveAssertionContexts;
  NSArray *v15;
  NSArray *remotePendingAssertionContexts;
  AFAudioSessionCoordinationDeviceInfo *v17;
  AFAudioSessionCoordinationDeviceInfo *localDevice;
  NSArray *v19;
  NSArray *remoteQualifiedInRangeDevices;
  NSArray *v21;
  NSArray *remoteQualifiedOutOfRangeDevices;
  NSArray *v23;
  int v24;
  NSArray *v25;
  NSArray *v26;
  NSArray *remoteDisqualifiedDevices;
  BOOL v28;
  NSArray *v30;
  AFAudioSessionCoordinationDeviceInfo *v31;

  v4 = (AFAudioSessionCoordinationSnapshot *)a3;
  if (self == v4)
  {
    v28 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      isAudioSessionActive = self->_isAudioSessionActive;
      if (isAudioSessionActive == -[AFAudioSessionCoordinationSnapshot isAudioSessionActive](v5, "isAudioSessionActive"))
      {
        -[AFAudioSessionCoordinationSnapshot currentOrUpNextDateInterval](v5, "currentOrUpNextDateInterval");
        v7 = (NSDateInterval *)objc_claimAutoreleasedReturnValue();
        currentOrUpNextDateInterval = self->_currentOrUpNextDateInterval;
        if (currentOrUpNextDateInterval == v7
          || -[NSDateInterval isEqual:](currentOrUpNextDateInterval, "isEqual:", v7))
        {
          -[AFAudioSessionCoordinationSnapshot localActiveAssertionContexts](v5, "localActiveAssertionContexts");
          v9 = (NSArray *)objc_claimAutoreleasedReturnValue();
          localActiveAssertionContexts = self->_localActiveAssertionContexts;
          if (localActiveAssertionContexts == v9
            || -[NSArray isEqual:](localActiveAssertionContexts, "isEqual:", v9))
          {
            -[AFAudioSessionCoordinationSnapshot localPendingAssertionContexts](v5, "localPendingAssertionContexts");
            v11 = (NSArray *)objc_claimAutoreleasedReturnValue();
            localPendingAssertionContexts = self->_localPendingAssertionContexts;
            if (localPendingAssertionContexts == v11
              || -[NSArray isEqual:](localPendingAssertionContexts, "isEqual:", v11))
            {
              -[AFAudioSessionCoordinationSnapshot remoteActiveAssertionContexts](v5, "remoteActiveAssertionContexts");
              v13 = (NSArray *)objc_claimAutoreleasedReturnValue();
              remoteActiveAssertionContexts = self->_remoteActiveAssertionContexts;
              if (remoteActiveAssertionContexts == v13
                || -[NSArray isEqual:](remoteActiveAssertionContexts, "isEqual:", v13))
              {
                -[AFAudioSessionCoordinationSnapshot remotePendingAssertionContexts](v5, "remotePendingAssertionContexts");
                v15 = (NSArray *)objc_claimAutoreleasedReturnValue();
                remotePendingAssertionContexts = self->_remotePendingAssertionContexts;
                if (remotePendingAssertionContexts == v15
                  || -[NSArray isEqual:](remotePendingAssertionContexts, "isEqual:", v15))
                {
                  -[AFAudioSessionCoordinationSnapshot localDevice](v5, "localDevice");
                  v17 = (AFAudioSessionCoordinationDeviceInfo *)objc_claimAutoreleasedReturnValue();
                  localDevice = self->_localDevice;
                  if (localDevice == v17
                    || -[AFAudioSessionCoordinationDeviceInfo isEqual:](localDevice, "isEqual:", v17))
                  {
                    -[AFAudioSessionCoordinationSnapshot remoteQualifiedInRangeDevices](v5, "remoteQualifiedInRangeDevices");
                    v19 = (NSArray *)objc_claimAutoreleasedReturnValue();
                    remoteQualifiedInRangeDevices = self->_remoteQualifiedInRangeDevices;
                    if (remoteQualifiedInRangeDevices == v19
                      || -[NSArray isEqual:](remoteQualifiedInRangeDevices, "isEqual:", v19))
                    {
                      v31 = v17;
                      -[AFAudioSessionCoordinationSnapshot remoteQualifiedOutOfRangeDevices](v5, "remoteQualifiedOutOfRangeDevices");
                      v21 = (NSArray *)objc_claimAutoreleasedReturnValue();
                      remoteQualifiedOutOfRangeDevices = self->_remoteQualifiedOutOfRangeDevices;
                      if (remoteQualifiedOutOfRangeDevices == v21
                        || (v23 = v21,
                            v24 = -[NSArray isEqual:](remoteQualifiedOutOfRangeDevices, "isEqual:", v21),
                            v21 = v23,
                            v24))
                      {
                        v25 = v21;
                        -[AFAudioSessionCoordinationSnapshot remoteDisqualifiedDevices](v5, "remoteDisqualifiedDevices", v19);
                        v26 = (NSArray *)objc_claimAutoreleasedReturnValue();
                        remoteDisqualifiedDevices = self->_remoteDisqualifiedDevices;
                        v28 = remoteDisqualifiedDevices == v26
                           || -[NSArray isEqual:](remoteDisqualifiedDevices, "isEqual:", v26);

                        v19 = v30;
                        v21 = v25;
                      }
                      else
                      {
                        v28 = 0;
                      }
                      v17 = v31;

                    }
                    else
                    {
                      v28 = 0;
                    }

                  }
                  else
                  {
                    v28 = 0;
                  }

                }
                else
                {
                  v28 = 0;
                }

              }
              else
              {
                v28 = 0;
              }

            }
            else
            {
              v28 = 0;
            }

          }
          else
          {
            v28 = 0;
          }

        }
        else
        {
          v28 = 0;
        }

      }
      else
      {
        v28 = 0;
      }

    }
    else
    {
      v28 = 0;
    }
  }

  return v28;
}

- (AFAudioSessionCoordinationSnapshot)initWithCoder:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  void *v28;
  uint64_t v29;
  void *v30;
  void *v31;
  AFAudioSessionCoordinationSnapshot *v32;
  void *v34;
  void *v35;
  unsigned int v36;
  void *v37;

  v3 = a3;
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("AFAudioSessionCoordinationSnapshot::currentOrUpNextDateInterval"));
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("AFAudioSessionCoordinationSnapshot::isAudioSessionActive"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v36 = objc_msgSend(v4, "BOOLValue");

  v5 = (void *)MEMORY[0x1E0C99E60];
  v6 = objc_opt_class();
  objc_msgSend(v5, "setWithObjects:", v6, objc_opt_class(), 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeObjectOfClasses:forKey:", v7, CFSTR("AFAudioSessionCoordinationSnapshot::localActiveAssertionContexts"));
  v35 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = (void *)MEMORY[0x1E0C99E60];
  v9 = objc_opt_class();
  objc_msgSend(v8, "setWithObjects:", v9, objc_opt_class(), 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeObjectOfClasses:forKey:", v10, CFSTR("AFAudioSessionCoordinationSnapshot::localPendingAssertionContexts"));
  v34 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = (void *)MEMORY[0x1E0C99E60];
  v12 = objc_opt_class();
  objc_msgSend(v11, "setWithObjects:", v12, objc_opt_class(), 0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeObjectOfClasses:forKey:", v13, CFSTR("AFAudioSessionCoordinationSnapshot::remoteActiveAssertionContexts"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  v15 = (void *)MEMORY[0x1E0C99E60];
  v16 = objc_opt_class();
  objc_msgSend(v15, "setWithObjects:", v16, objc_opt_class(), 0);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeObjectOfClasses:forKey:", v17, CFSTR("AFAudioSessionCoordinationSnapshot::remotePendingAssertionContexts"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("AFAudioSessionCoordinationSnapshot::localDevice"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = (void *)MEMORY[0x1E0C99E60];
  v21 = objc_opt_class();
  objc_msgSend(v20, "setWithObjects:", v21, objc_opt_class(), 0);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeObjectOfClasses:forKey:", v22, CFSTR("AFAudioSessionCoordinationSnapshot::remoteQualifiedInRangeDevices"));
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  v24 = (void *)MEMORY[0x1E0C99E60];
  v25 = objc_opt_class();
  objc_msgSend(v24, "setWithObjects:", v25, objc_opt_class(), 0);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeObjectOfClasses:forKey:", v26, CFSTR("AFAudioSessionCoordinationSnapshot::remoteQualifiedOutOfRangeDevices"));
  v27 = (void *)objc_claimAutoreleasedReturnValue();

  v28 = (void *)MEMORY[0x1E0C99E60];
  v29 = objc_opt_class();
  objc_msgSend(v28, "setWithObjects:", v29, objc_opt_class(), 0);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeObjectOfClasses:forKey:", v30, CFSTR("AFAudioSessionCoordinationSnapshot::remoteDisqualifiedDevices"));
  v31 = (void *)objc_claimAutoreleasedReturnValue();

  v32 = -[AFAudioSessionCoordinationSnapshot initWithCurrentOrUpNextDateInterval:isAudioSessionActive:localActiveAssertionContexts:localPendingAssertionContexts:remoteActiveAssertionContexts:remotePendingAssertionContexts:localDevice:remoteQualifiedInRangeDevices:remoteQualifiedOutOfRangeDevices:remoteDisqualifiedDevices:](self, "initWithCurrentOrUpNextDateInterval:isAudioSessionActive:localActiveAssertionContexts:localPendingAssertionContexts:remoteActiveAssertionContexts:remotePendingAssertionContexts:localDevice:remoteQualifiedInRangeDevices:remoteQualifiedOutOfRangeDevices:remoteDisqualifiedDevices:", v37, v36, v35, v34, v14, v18, v19, v23, v27, v31);
  return v32;
}

- (void)encodeWithCoder:(id)a3
{
  NSDateInterval *currentOrUpNextDateInterval;
  void *v5;
  id v6;

  currentOrUpNextDateInterval = self->_currentOrUpNextDateInterval;
  v6 = a3;
  objc_msgSend(v6, "encodeObject:forKey:", currentOrUpNextDateInterval, CFSTR("AFAudioSessionCoordinationSnapshot::currentOrUpNextDateInterval"));
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_isAudioSessionActive);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "encodeObject:forKey:", v5, CFSTR("AFAudioSessionCoordinationSnapshot::isAudioSessionActive"));

  objc_msgSend(v6, "encodeObject:forKey:", self->_localActiveAssertionContexts, CFSTR("AFAudioSessionCoordinationSnapshot::localActiveAssertionContexts"));
  objc_msgSend(v6, "encodeObject:forKey:", self->_localPendingAssertionContexts, CFSTR("AFAudioSessionCoordinationSnapshot::localPendingAssertionContexts"));
  objc_msgSend(v6, "encodeObject:forKey:", self->_remoteActiveAssertionContexts, CFSTR("AFAudioSessionCoordinationSnapshot::remoteActiveAssertionContexts"));
  objc_msgSend(v6, "encodeObject:forKey:", self->_remotePendingAssertionContexts, CFSTR("AFAudioSessionCoordinationSnapshot::remotePendingAssertionContexts"));
  objc_msgSend(v6, "encodeObject:forKey:", self->_localDevice, CFSTR("AFAudioSessionCoordinationSnapshot::localDevice"));
  objc_msgSend(v6, "encodeObject:forKey:", self->_remoteQualifiedInRangeDevices, CFSTR("AFAudioSessionCoordinationSnapshot::remoteQualifiedInRangeDevices"));
  objc_msgSend(v6, "encodeObject:forKey:", self->_remoteQualifiedOutOfRangeDevices, CFSTR("AFAudioSessionCoordinationSnapshot::remoteQualifiedOutOfRangeDevices"));
  objc_msgSend(v6, "encodeObject:forKey:", self->_remoteDisqualifiedDevices, CFSTR("AFAudioSessionCoordinationSnapshot::remoteDisqualifiedDevices"));

}

- (AFAudioSessionCoordinationSnapshot)initWithDictionaryRepresentation:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  AFAudioSessionCoordinationSnapshot *v7;
  void *v8;
  id v9;
  void *v10;
  unint64_t v11;
  void *v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  id v18;
  AFAssertionContext *v19;
  void *v20;
  void *v21;
  id v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t j;
  id v27;
  AFAssertionContext *v28;
  void *v29;
  void *v30;
  id v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t k;
  id v36;
  AFAssertionContext *v37;
  void *v38;
  void *v39;
  id v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t m;
  id v45;
  AFAssertionContext *v46;
  void *v47;
  void *v48;
  void *v49;
  id v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t n;
  id v55;
  AFAudioSessionCoordinationDeviceInfo *v56;
  void *v57;
  void *v58;
  id v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t ii;
  id v64;
  AFAudioSessionCoordinationDeviceInfo *v65;
  void *v66;
  void *v67;
  id v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t jj;
  id v73;
  AFAudioSessionCoordinationDeviceInfo *v74;
  void *v75;
  void *v77;
  void *v78;
  AFAudioSessionCoordinationDeviceInfo *v79;
  void *v80;
  void *v81;
  void *v82;
  void *v83;
  unsigned int v84;
  AFAudioSessionCoordinationSnapshot *v85;
  id v86;
  void *v87;
  __int128 v88;
  __int128 v89;
  __int128 v90;
  __int128 v91;
  __int128 v92;
  __int128 v93;
  __int128 v94;
  __int128 v95;
  __int128 v96;
  __int128 v97;
  __int128 v98;
  __int128 v99;
  __int128 v100;
  __int128 v101;
  __int128 v102;
  __int128 v103;
  __int128 v104;
  __int128 v105;
  __int128 v106;
  __int128 v107;
  __int128 v108;
  __int128 v109;
  __int128 v110;
  __int128 v111;
  __int128 v112;
  __int128 v113;
  __int128 v114;
  __int128 v115;
  _BYTE v116[128];
  _BYTE v117[128];
  _BYTE v118[128];
  _BYTE v119[128];
  _BYTE v120[128];
  _BYTE v121[128];
  _BYTE v122[128];
  uint64_t v123;

  v123 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = v4;
  if (v4)
  {
    objc_msgSend(v4, "objectForKey:", CFSTR("currentOrUpNextDateInterval"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v86 = v6;
    else
      v86 = 0;
    v85 = self;

    objc_msgSend(v5, "objectForKey:", CFSTR("isAudioSessionActive"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v9 = v8;
    else
      v9 = 0;

    v84 = objc_msgSend(v9, "BOOLValue");
    objc_msgSend(v5, "objectForKey:", CFSTR("localActiveAssertionContexts"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v11 = 0x1E0C99000uLL;
    v87 = v5;
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v10, "count"));
      v112 = 0u;
      v113 = 0u;
      v114 = 0u;
      v115 = 0u;
      v13 = v10;
      v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v112, v122, 16);
      if (v14)
      {
        v15 = v14;
        v16 = *(_QWORD *)v113;
        do
        {
          for (i = 0; i != v15; ++i)
          {
            if (*(_QWORD *)v113 != v16)
              objc_enumerationMutation(v13);
            v18 = *(id *)(*((_QWORD *)&v112 + 1) + 8 * i);
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              v19 = -[AFAssertionContext initWithDictionaryRepresentation:]([AFAssertionContext alloc], "initWithDictionaryRepresentation:", v18);

              if (v19)
                objc_msgSend(v12, "addObject:", v19);
            }
            else
            {

              v19 = 0;
            }

          }
          v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v112, v122, 16);
        }
        while (v15);
      }

      v83 = (void *)objc_msgSend(v12, "copy");
      v5 = v87;
      v11 = 0x1E0C99000;
    }
    else
    {
      v83 = 0;
    }

    objc_msgSend(v5, "objectForKey:", CFSTR("localPendingAssertionContexts"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v21 = (void *)objc_msgSend(objc_alloc(*(Class *)(v11 + 3560)), "initWithCapacity:", objc_msgSend(v20, "count"));
      v108 = 0u;
      v109 = 0u;
      v110 = 0u;
      v111 = 0u;
      v22 = v20;
      v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v108, v121, 16);
      if (v23)
      {
        v24 = v23;
        v25 = *(_QWORD *)v109;
        do
        {
          for (j = 0; j != v24; ++j)
          {
            if (*(_QWORD *)v109 != v25)
              objc_enumerationMutation(v22);
            v27 = *(id *)(*((_QWORD *)&v108 + 1) + 8 * j);
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              v28 = -[AFAssertionContext initWithDictionaryRepresentation:]([AFAssertionContext alloc], "initWithDictionaryRepresentation:", v27);

              if (v28)
                objc_msgSend(v21, "addObject:", v28);
            }
            else
            {

              v28 = 0;
            }

          }
          v24 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v108, v121, 16);
        }
        while (v24);
      }

      v82 = (void *)objc_msgSend(v21, "copy");
      v5 = v87;
      v11 = 0x1E0C99000;
    }
    else
    {
      v82 = 0;
    }

    objc_msgSend(v5, "objectForKey:", CFSTR("remoteActiveAssertionContexts"));
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v30 = (void *)objc_msgSend(objc_alloc(*(Class *)(v11 + 3560)), "initWithCapacity:", objc_msgSend(v29, "count"));
      v104 = 0u;
      v105 = 0u;
      v106 = 0u;
      v107 = 0u;
      v31 = v29;
      v32 = objc_msgSend(v31, "countByEnumeratingWithState:objects:count:", &v104, v120, 16);
      if (v32)
      {
        v33 = v32;
        v34 = *(_QWORD *)v105;
        do
        {
          for (k = 0; k != v33; ++k)
          {
            if (*(_QWORD *)v105 != v34)
              objc_enumerationMutation(v31);
            v36 = *(id *)(*((_QWORD *)&v104 + 1) + 8 * k);
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              v37 = -[AFAssertionContext initWithDictionaryRepresentation:]([AFAssertionContext alloc], "initWithDictionaryRepresentation:", v36);

              if (v37)
                objc_msgSend(v30, "addObject:", v37);
            }
            else
            {

              v37 = 0;
            }

          }
          v33 = objc_msgSend(v31, "countByEnumeratingWithState:objects:count:", &v104, v120, 16);
        }
        while (v33);
      }

      v81 = (void *)objc_msgSend(v30, "copy");
      v5 = v87;
      v11 = 0x1E0C99000;
    }
    else
    {
      v81 = 0;
    }

    objc_msgSend(v5, "objectForKey:", CFSTR("remotePendingAssertionContexts"));
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v39 = (void *)objc_msgSend(objc_alloc(*(Class *)(v11 + 3560)), "initWithCapacity:", objc_msgSend(v38, "count"));
      v100 = 0u;
      v101 = 0u;
      v102 = 0u;
      v103 = 0u;
      v40 = v38;
      v41 = objc_msgSend(v40, "countByEnumeratingWithState:objects:count:", &v100, v119, 16);
      if (v41)
      {
        v42 = v41;
        v43 = *(_QWORD *)v101;
        do
        {
          for (m = 0; m != v42; ++m)
          {
            if (*(_QWORD *)v101 != v43)
              objc_enumerationMutation(v40);
            v45 = *(id *)(*((_QWORD *)&v100 + 1) + 8 * m);
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              v46 = -[AFAssertionContext initWithDictionaryRepresentation:]([AFAssertionContext alloc], "initWithDictionaryRepresentation:", v45);

              if (v46)
                objc_msgSend(v39, "addObject:", v46);
            }
            else
            {

              v46 = 0;
            }

          }
          v42 = objc_msgSend(v40, "countByEnumeratingWithState:objects:count:", &v100, v119, 16);
        }
        while (v42);
      }

      v80 = (void *)objc_msgSend(v39, "copy");
      v5 = v87;
      v11 = 0x1E0C99000;
    }
    else
    {
      v80 = 0;
    }

    objc_msgSend(v5, "objectForKey:", CFSTR("localDevice"));
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v79 = -[AFAudioSessionCoordinationDeviceInfo initWithDictionaryRepresentation:]([AFAudioSessionCoordinationDeviceInfo alloc], "initWithDictionaryRepresentation:", v47);
    else
      v79 = 0;

    objc_msgSend(v5, "objectForKey:", CFSTR("remoteQualifiedInRangeDevices"));
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v49 = (void *)objc_msgSend(objc_alloc(*(Class *)(v11 + 3560)), "initWithCapacity:", objc_msgSend(v48, "count"));
      v96 = 0u;
      v97 = 0u;
      v98 = 0u;
      v99 = 0u;
      v50 = v48;
      v51 = objc_msgSend(v50, "countByEnumeratingWithState:objects:count:", &v96, v118, 16);
      if (v51)
      {
        v52 = v51;
        v53 = *(_QWORD *)v97;
        do
        {
          for (n = 0; n != v52; ++n)
          {
            if (*(_QWORD *)v97 != v53)
              objc_enumerationMutation(v50);
            v55 = *(id *)(*((_QWORD *)&v96 + 1) + 8 * n);
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              v56 = -[AFAudioSessionCoordinationDeviceInfo initWithDictionaryRepresentation:]([AFAudioSessionCoordinationDeviceInfo alloc], "initWithDictionaryRepresentation:", v55);

              if (v56)
                objc_msgSend(v49, "addObject:", v56);
            }
            else
            {

              v56 = 0;
            }

          }
          v52 = objc_msgSend(v50, "countByEnumeratingWithState:objects:count:", &v96, v118, 16);
        }
        while (v52);
      }

      v78 = (void *)objc_msgSend(v49, "copy");
      v5 = v87;
      v11 = 0x1E0C99000;
    }
    else
    {
      v78 = 0;
    }

    objc_msgSend(v5, "objectForKey:", CFSTR("remoteQualifiedOutOfRangeDevices"));
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v58 = (void *)objc_msgSend(objc_alloc(*(Class *)(v11 + 3560)), "initWithCapacity:", objc_msgSend(v57, "count"));
      v92 = 0u;
      v93 = 0u;
      v94 = 0u;
      v95 = 0u;
      v59 = v57;
      v60 = objc_msgSend(v59, "countByEnumeratingWithState:objects:count:", &v92, v117, 16);
      if (v60)
      {
        v61 = v60;
        v62 = *(_QWORD *)v93;
        do
        {
          for (ii = 0; ii != v61; ++ii)
          {
            if (*(_QWORD *)v93 != v62)
              objc_enumerationMutation(v59);
            v64 = *(id *)(*((_QWORD *)&v92 + 1) + 8 * ii);
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              v65 = -[AFAudioSessionCoordinationDeviceInfo initWithDictionaryRepresentation:]([AFAudioSessionCoordinationDeviceInfo alloc], "initWithDictionaryRepresentation:", v64);

              if (v65)
                objc_msgSend(v58, "addObject:", v65);
            }
            else
            {

              v65 = 0;
            }

          }
          v61 = objc_msgSend(v59, "countByEnumeratingWithState:objects:count:", &v92, v117, 16);
        }
        while (v61);
      }

      v77 = (void *)objc_msgSend(v58, "copy");
      v5 = v87;
      v11 = 0x1E0C99000;
    }
    else
    {
      v77 = 0;
    }

    objc_msgSend(v5, "objectForKey:", CFSTR("remoteDisqualifiedDevices"));
    v66 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v67 = (void *)objc_msgSend(objc_alloc(*(Class *)(v11 + 3560)), "initWithCapacity:", objc_msgSend(v66, "count"));
      v88 = 0u;
      v89 = 0u;
      v90 = 0u;
      v91 = 0u;
      v68 = v66;
      v69 = objc_msgSend(v68, "countByEnumeratingWithState:objects:count:", &v88, v116, 16);
      if (v69)
      {
        v70 = v69;
        v71 = *(_QWORD *)v89;
        do
        {
          for (jj = 0; jj != v70; ++jj)
          {
            if (*(_QWORD *)v89 != v71)
              objc_enumerationMutation(v68);
            v73 = *(id *)(*((_QWORD *)&v88 + 1) + 8 * jj);
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              v74 = -[AFAudioSessionCoordinationDeviceInfo initWithDictionaryRepresentation:]([AFAudioSessionCoordinationDeviceInfo alloc], "initWithDictionaryRepresentation:", v73);

              if (v74)
                objc_msgSend(v67, "addObject:", v74);
            }
            else
            {

              v74 = 0;
            }

          }
          v70 = objc_msgSend(v68, "countByEnumeratingWithState:objects:count:", &v88, v116, 16);
        }
        while (v70);
      }

      v75 = (void *)objc_msgSend(v67, "copy");
      v5 = v87;
    }
    else
    {
      v75 = 0;
    }

    self = -[AFAudioSessionCoordinationSnapshot initWithCurrentOrUpNextDateInterval:isAudioSessionActive:localActiveAssertionContexts:localPendingAssertionContexts:remoteActiveAssertionContexts:remotePendingAssertionContexts:localDevice:remoteQualifiedInRangeDevices:remoteQualifiedOutOfRangeDevices:remoteDisqualifiedDevices:](v85, "initWithCurrentOrUpNextDateInterval:isAudioSessionActive:localActiveAssertionContexts:localPendingAssertionContexts:remoteActiveAssertionContexts:remotePendingAssertionContexts:localDevice:remoteQualifiedInRangeDevices:remoteQualifiedOutOfRangeDevices:remoteDisqualifiedDevices:", v86, v84, v83, v82, v81, v80, v79, v78, v77, v75);
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
  NSDateInterval *currentOrUpNextDateInterval;
  void *v6;
  void *v7;
  NSArray *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  NSArray *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  NSArray *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  void *v30;
  void *v31;
  NSArray *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  void *v37;
  void *v38;
  AFAudioSessionCoordinationDeviceInfo *localDevice;
  void *v40;
  void *v41;
  NSArray *v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  void *v47;
  void *v48;
  void *v49;
  NSArray *v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  void *v55;
  void *v56;
  void *v57;
  NSArray *v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  void *v63;
  void *v64;
  void *v65;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  __int128 v83;
  __int128 v84;
  __int128 v85;
  __int128 v86;
  __int128 v87;
  __int128 v88;
  __int128 v89;
  __int128 v90;
  __int128 v91;
  __int128 v92;
  __int128 v93;
  __int128 v94;
  _BYTE v95[128];
  _BYTE v96[128];
  _BYTE v97[128];
  _BYTE v98[128];
  _BYTE v99[128];
  _BYTE v100[128];
  _BYTE v101[128];
  uint64_t v102;

  v102 = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v4 = v3;
  currentOrUpNextDateInterval = self->_currentOrUpNextDateInterval;
  if (currentOrUpNextDateInterval)
    objc_msgSend(v3, "setObject:forKey:", currentOrUpNextDateInterval, CFSTR("currentOrUpNextDateInterval"));
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_isAudioSessionActive);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v6, CFSTR("isAudioSessionActive"));

  if (self->_localActiveAssertionContexts)
  {
    v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", -[NSArray count](self->_localActiveAssertionContexts, "count"));
    v91 = 0u;
    v92 = 0u;
    v93 = 0u;
    v94 = 0u;
    v8 = self->_localActiveAssertionContexts;
    v9 = -[NSArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v91, v101, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v92;
      do
      {
        v12 = 0;
        do
        {
          if (*(_QWORD *)v92 != v11)
            objc_enumerationMutation(v8);
          objc_msgSend(*(id *)(*((_QWORD *)&v91 + 1) + 8 * v12), "buildDictionaryRepresentation");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v7, "addObject:", v13);

          ++v12;
        }
        while (v10 != v12);
        v10 = -[NSArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v91, v101, 16);
      }
      while (v10);
    }

    v14 = (void *)objc_msgSend(v7, "copy");
    objc_msgSend(v4, "setObject:forKey:", v14, CFSTR("localActiveAssertionContexts"));

  }
  if (self->_localPendingAssertionContexts)
  {
    v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", -[NSArray count](self->_localPendingAssertionContexts, "count"));
    v87 = 0u;
    v88 = 0u;
    v89 = 0u;
    v90 = 0u;
    v16 = self->_localPendingAssertionContexts;
    v17 = -[NSArray countByEnumeratingWithState:objects:count:](v16, "countByEnumeratingWithState:objects:count:", &v87, v100, 16);
    if (v17)
    {
      v18 = v17;
      v19 = *(_QWORD *)v88;
      do
      {
        v20 = 0;
        do
        {
          if (*(_QWORD *)v88 != v19)
            objc_enumerationMutation(v16);
          objc_msgSend(*(id *)(*((_QWORD *)&v87 + 1) + 8 * v20), "buildDictionaryRepresentation");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "addObject:", v21);

          ++v20;
        }
        while (v18 != v20);
        v18 = -[NSArray countByEnumeratingWithState:objects:count:](v16, "countByEnumeratingWithState:objects:count:", &v87, v100, 16);
      }
      while (v18);
    }

    v22 = (void *)objc_msgSend(v15, "copy");
    objc_msgSend(v4, "setObject:forKey:", v22, CFSTR("localPendingAssertionContexts"));

  }
  if (self->_remoteActiveAssertionContexts)
  {
    v23 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", -[NSArray count](self->_remoteActiveAssertionContexts, "count"));
    v83 = 0u;
    v84 = 0u;
    v85 = 0u;
    v86 = 0u;
    v24 = self->_remoteActiveAssertionContexts;
    v25 = -[NSArray countByEnumeratingWithState:objects:count:](v24, "countByEnumeratingWithState:objects:count:", &v83, v99, 16);
    if (v25)
    {
      v26 = v25;
      v27 = *(_QWORD *)v84;
      do
      {
        v28 = 0;
        do
        {
          if (*(_QWORD *)v84 != v27)
            objc_enumerationMutation(v24);
          objc_msgSend(*(id *)(*((_QWORD *)&v83 + 1) + 8 * v28), "buildDictionaryRepresentation");
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v23, "addObject:", v29);

          ++v28;
        }
        while (v26 != v28);
        v26 = -[NSArray countByEnumeratingWithState:objects:count:](v24, "countByEnumeratingWithState:objects:count:", &v83, v99, 16);
      }
      while (v26);
    }

    v30 = (void *)objc_msgSend(v23, "copy");
    objc_msgSend(v4, "setObject:forKey:", v30, CFSTR("remoteActiveAssertionContexts"));

  }
  if (self->_remotePendingAssertionContexts)
  {
    v31 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", -[NSArray count](self->_remotePendingAssertionContexts, "count"));
    v79 = 0u;
    v80 = 0u;
    v81 = 0u;
    v82 = 0u;
    v32 = self->_remotePendingAssertionContexts;
    v33 = -[NSArray countByEnumeratingWithState:objects:count:](v32, "countByEnumeratingWithState:objects:count:", &v79, v98, 16);
    if (v33)
    {
      v34 = v33;
      v35 = *(_QWORD *)v80;
      do
      {
        v36 = 0;
        do
        {
          if (*(_QWORD *)v80 != v35)
            objc_enumerationMutation(v32);
          objc_msgSend(*(id *)(*((_QWORD *)&v79 + 1) + 8 * v36), "buildDictionaryRepresentation");
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v31, "addObject:", v37);

          ++v36;
        }
        while (v34 != v36);
        v34 = -[NSArray countByEnumeratingWithState:objects:count:](v32, "countByEnumeratingWithState:objects:count:", &v79, v98, 16);
      }
      while (v34);
    }

    v38 = (void *)objc_msgSend(v31, "copy");
    objc_msgSend(v4, "setObject:forKey:", v38, CFSTR("remotePendingAssertionContexts"));

  }
  localDevice = self->_localDevice;
  if (localDevice)
  {
    -[AFAudioSessionCoordinationDeviceInfo buildDictionaryRepresentation](localDevice, "buildDictionaryRepresentation");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v40, CFSTR("localDevice"));

  }
  if (self->_remoteQualifiedInRangeDevices)
  {
    v41 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", -[NSArray count](self->_remoteQualifiedInRangeDevices, "count"));
    v75 = 0u;
    v76 = 0u;
    v77 = 0u;
    v78 = 0u;
    v42 = self->_remoteQualifiedInRangeDevices;
    v43 = -[NSArray countByEnumeratingWithState:objects:count:](v42, "countByEnumeratingWithState:objects:count:", &v75, v97, 16);
    if (v43)
    {
      v44 = v43;
      v45 = *(_QWORD *)v76;
      do
      {
        v46 = 0;
        do
        {
          if (*(_QWORD *)v76 != v45)
            objc_enumerationMutation(v42);
          objc_msgSend(*(id *)(*((_QWORD *)&v75 + 1) + 8 * v46), "buildDictionaryRepresentation");
          v47 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v41, "addObject:", v47);

          ++v46;
        }
        while (v44 != v46);
        v44 = -[NSArray countByEnumeratingWithState:objects:count:](v42, "countByEnumeratingWithState:objects:count:", &v75, v97, 16);
      }
      while (v44);
    }

    v48 = (void *)objc_msgSend(v41, "copy");
    objc_msgSend(v4, "setObject:forKey:", v48, CFSTR("remoteQualifiedInRangeDevices"));

  }
  if (self->_remoteQualifiedOutOfRangeDevices)
  {
    v49 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", -[NSArray count](self->_remoteQualifiedOutOfRangeDevices, "count"));
    v71 = 0u;
    v72 = 0u;
    v73 = 0u;
    v74 = 0u;
    v50 = self->_remoteQualifiedOutOfRangeDevices;
    v51 = -[NSArray countByEnumeratingWithState:objects:count:](v50, "countByEnumeratingWithState:objects:count:", &v71, v96, 16);
    if (v51)
    {
      v52 = v51;
      v53 = *(_QWORD *)v72;
      do
      {
        v54 = 0;
        do
        {
          if (*(_QWORD *)v72 != v53)
            objc_enumerationMutation(v50);
          objc_msgSend(*(id *)(*((_QWORD *)&v71 + 1) + 8 * v54), "buildDictionaryRepresentation");
          v55 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v49, "addObject:", v55);

          ++v54;
        }
        while (v52 != v54);
        v52 = -[NSArray countByEnumeratingWithState:objects:count:](v50, "countByEnumeratingWithState:objects:count:", &v71, v96, 16);
      }
      while (v52);
    }

    v56 = (void *)objc_msgSend(v49, "copy");
    objc_msgSend(v4, "setObject:forKey:", v56, CFSTR("remoteQualifiedOutOfRangeDevices"));

  }
  if (self->_remoteDisqualifiedDevices)
  {
    v57 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", -[NSArray count](self->_remoteDisqualifiedDevices, "count"));
    v67 = 0u;
    v68 = 0u;
    v69 = 0u;
    v70 = 0u;
    v58 = self->_remoteDisqualifiedDevices;
    v59 = -[NSArray countByEnumeratingWithState:objects:count:](v58, "countByEnumeratingWithState:objects:count:", &v67, v95, 16);
    if (v59)
    {
      v60 = v59;
      v61 = *(_QWORD *)v68;
      do
      {
        v62 = 0;
        do
        {
          if (*(_QWORD *)v68 != v61)
            objc_enumerationMutation(v58);
          objc_msgSend(*(id *)(*((_QWORD *)&v67 + 1) + 8 * v62), "buildDictionaryRepresentation", (_QWORD)v67);
          v63 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v57, "addObject:", v63);

          ++v62;
        }
        while (v60 != v62);
        v60 = -[NSArray countByEnumeratingWithState:objects:count:](v58, "countByEnumeratingWithState:objects:count:", &v67, v95, 16);
      }
      while (v60);
    }

    v64 = (void *)objc_msgSend(v57, "copy");
    objc_msgSend(v4, "setObject:forKey:", v64, CFSTR("remoteDisqualifiedDevices"));

  }
  v65 = (void *)objc_msgSend(v4, "copy", (_QWORD)v67);

  return v65;
}

- (NSDateInterval)currentOrUpNextDateInterval
{
  return self->_currentOrUpNextDateInterval;
}

- (BOOL)isAudioSessionActive
{
  return self->_isAudioSessionActive;
}

- (NSArray)localActiveAssertionContexts
{
  return self->_localActiveAssertionContexts;
}

- (NSArray)localPendingAssertionContexts
{
  return self->_localPendingAssertionContexts;
}

- (NSArray)remoteActiveAssertionContexts
{
  return self->_remoteActiveAssertionContexts;
}

- (NSArray)remotePendingAssertionContexts
{
  return self->_remotePendingAssertionContexts;
}

- (AFAudioSessionCoordinationDeviceInfo)localDevice
{
  return self->_localDevice;
}

- (NSArray)remoteQualifiedInRangeDevices
{
  return self->_remoteQualifiedInRangeDevices;
}

- (NSArray)remoteQualifiedOutOfRangeDevices
{
  return self->_remoteQualifiedOutOfRangeDevices;
}

- (NSArray)remoteDisqualifiedDevices
{
  return self->_remoteDisqualifiedDevices;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_remoteDisqualifiedDevices, 0);
  objc_storeStrong((id *)&self->_remoteQualifiedOutOfRangeDevices, 0);
  objc_storeStrong((id *)&self->_remoteQualifiedInRangeDevices, 0);
  objc_storeStrong((id *)&self->_localDevice, 0);
  objc_storeStrong((id *)&self->_remotePendingAssertionContexts, 0);
  objc_storeStrong((id *)&self->_remoteActiveAssertionContexts, 0);
  objc_storeStrong((id *)&self->_localPendingAssertionContexts, 0);
  objc_storeStrong((id *)&self->_localActiveAssertionContexts, 0);
  objc_storeStrong((id *)&self->_currentOrUpNextDateInterval, 0);
}

void __316__AFAudioSessionCoordinationSnapshot_initWithCurrentOrUpNextDateInterval_isAudioSessionActive_localActiveAssertionContexts_localPendingAssertionContexts_remoteActiveAssertionContexts_remotePendingAssertionContexts_localDevice_remoteQualifiedInRangeDevices_remoteQualifiedOutOfRangeDevices_remoteDisqualifiedDevices___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  id v4;

  v3 = *(_QWORD *)(a1 + 32);
  v4 = a2;
  objc_msgSend(v4, "setCurrentOrUpNextDateInterval:", v3);
  objc_msgSend(v4, "setIsAudioSessionActive:", *(unsigned __int8 *)(a1 + 104));
  objc_msgSend(v4, "setLocalActiveAssertionContexts:", *(_QWORD *)(a1 + 40));
  objc_msgSend(v4, "setLocalPendingAssertionContexts:", *(_QWORD *)(a1 + 48));
  objc_msgSend(v4, "setRemoteActiveAssertionContexts:", *(_QWORD *)(a1 + 56));
  objc_msgSend(v4, "setRemotePendingAssertionContexts:", *(_QWORD *)(a1 + 64));
  objc_msgSend(v4, "setLocalDevice:", *(_QWORD *)(a1 + 72));
  objc_msgSend(v4, "setRemoteQualifiedInRangeDevices:", *(_QWORD *)(a1 + 80));
  objc_msgSend(v4, "setRemoteQualifiedOutOfRangeDevices:", *(_QWORD *)(a1 + 88));
  objc_msgSend(v4, "setRemoteDisqualifiedDevices:", *(_QWORD *)(a1 + 96));

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
  void (**v4)(id, _AFAudioSessionCoordinationSnapshotMutation *);
  _AFAudioSessionCoordinationSnapshotMutation *v5;
  AFAudioSessionCoordinationSnapshot *v6;
  void *v7;
  uint64_t v8;
  NSDateInterval *currentOrUpNextDateInterval;
  void *v10;
  uint64_t v11;
  NSArray *localActiveAssertionContexts;
  void *v13;
  uint64_t v14;
  NSArray *localPendingAssertionContexts;
  void *v16;
  uint64_t v17;
  NSArray *remoteActiveAssertionContexts;
  void *v19;
  uint64_t v20;
  NSArray *remotePendingAssertionContexts;
  void *v22;
  uint64_t v23;
  AFAudioSessionCoordinationDeviceInfo *localDevice;
  void *v25;
  uint64_t v26;
  NSArray *remoteQualifiedInRangeDevices;
  void *v28;
  uint64_t v29;
  NSArray *remoteQualifiedOutOfRangeDevices;
  void *v31;
  uint64_t v32;
  NSArray *remoteDisqualifiedDevices;

  v4 = (void (**)(id, _AFAudioSessionCoordinationSnapshotMutation *))a3;
  if (v4)
  {
    v5 = -[_AFAudioSessionCoordinationSnapshotMutation initWithBase:]([_AFAudioSessionCoordinationSnapshotMutation alloc], "initWithBase:", self);
    v4[2](v4, v5);
    if (-[_AFAudioSessionCoordinationSnapshotMutation isDirty](v5, "isDirty"))
    {
      v6 = objc_alloc_init(AFAudioSessionCoordinationSnapshot);
      -[_AFAudioSessionCoordinationSnapshotMutation getCurrentOrUpNextDateInterval](v5, "getCurrentOrUpNextDateInterval");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v7, "copy");
      currentOrUpNextDateInterval = v6->_currentOrUpNextDateInterval;
      v6->_currentOrUpNextDateInterval = (NSDateInterval *)v8;

      v6->_isAudioSessionActive = -[_AFAudioSessionCoordinationSnapshotMutation getIsAudioSessionActive](v5, "getIsAudioSessionActive");
      -[_AFAudioSessionCoordinationSnapshotMutation getLocalActiveAssertionContexts](v5, "getLocalActiveAssertionContexts");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v10, "copy");
      localActiveAssertionContexts = v6->_localActiveAssertionContexts;
      v6->_localActiveAssertionContexts = (NSArray *)v11;

      -[_AFAudioSessionCoordinationSnapshotMutation getLocalPendingAssertionContexts](v5, "getLocalPendingAssertionContexts");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_msgSend(v13, "copy");
      localPendingAssertionContexts = v6->_localPendingAssertionContexts;
      v6->_localPendingAssertionContexts = (NSArray *)v14;

      -[_AFAudioSessionCoordinationSnapshotMutation getRemoteActiveAssertionContexts](v5, "getRemoteActiveAssertionContexts");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = objc_msgSend(v16, "copy");
      remoteActiveAssertionContexts = v6->_remoteActiveAssertionContexts;
      v6->_remoteActiveAssertionContexts = (NSArray *)v17;

      -[_AFAudioSessionCoordinationSnapshotMutation getRemotePendingAssertionContexts](v5, "getRemotePendingAssertionContexts");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = objc_msgSend(v19, "copy");
      remotePendingAssertionContexts = v6->_remotePendingAssertionContexts;
      v6->_remotePendingAssertionContexts = (NSArray *)v20;

      -[_AFAudioSessionCoordinationSnapshotMutation getLocalDevice](v5, "getLocalDevice");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = objc_msgSend(v22, "copy");
      localDevice = v6->_localDevice;
      v6->_localDevice = (AFAudioSessionCoordinationDeviceInfo *)v23;

      -[_AFAudioSessionCoordinationSnapshotMutation getRemoteQualifiedInRangeDevices](v5, "getRemoteQualifiedInRangeDevices");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = objc_msgSend(v25, "copy");
      remoteQualifiedInRangeDevices = v6->_remoteQualifiedInRangeDevices;
      v6->_remoteQualifiedInRangeDevices = (NSArray *)v26;

      -[_AFAudioSessionCoordinationSnapshotMutation getRemoteQualifiedOutOfRangeDevices](v5, "getRemoteQualifiedOutOfRangeDevices");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v29 = objc_msgSend(v28, "copy");
      remoteQualifiedOutOfRangeDevices = v6->_remoteQualifiedOutOfRangeDevices;
      v6->_remoteQualifiedOutOfRangeDevices = (NSArray *)v29;

      -[_AFAudioSessionCoordinationSnapshotMutation getRemoteDisqualifiedDevices](v5, "getRemoteDisqualifiedDevices");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      v32 = objc_msgSend(v31, "copy");
      remoteDisqualifiedDevices = v6->_remoteDisqualifiedDevices;
      v6->_remoteDisqualifiedDevices = (NSArray *)v32;

    }
    else
    {
      v6 = (AFAudioSessionCoordinationSnapshot *)-[AFAudioSessionCoordinationSnapshot copy](self, "copy");
    }

  }
  else
  {
    v6 = (AFAudioSessionCoordinationSnapshot *)-[AFAudioSessionCoordinationSnapshot copy](self, "copy");
  }

  return v6;
}

@end
