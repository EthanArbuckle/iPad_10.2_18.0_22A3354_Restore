@implementation ARCollaborationData

- (ARCollaborationData)initWithVIOData:(id)a3 type:(int64_t)a4 sessionID:(unint64_t)a5
{
  id v9;
  ARCollaborationData *v10;
  ARCollaborationData *v11;
  objc_super v13;

  v9 = a3;
  v13.receiver = self;
  v13.super_class = (Class)ARCollaborationData;
  v10 = -[ARCollaborationData init](&v13, sel_init);
  v11 = v10;
  if (v10)
  {
    v10->_priority = (_DWORD)a4 == 7;
    v10->_version = 2;
    v10->_timestamp = CACurrentMediaTime();
    objc_storeStrong((id *)&v11->_vioData, a3);
    v11->_vioDataType = a4;
    v11->_vioSessionID = a5;
  }

  return v11;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  NSData *vioData;
  NSSet *anchors;
  id v6;

  v6 = a3;
  objc_msgSend(v6, "encodeInteger:forKey:", self->_priority, CFSTR("priority"));
  objc_msgSend(v6, "encodeInteger:forKey:", self->_version, CFSTR("version"));
  objc_msgSend(v6, "encodeDouble:forKey:", CFSTR("timestamp"), self->_timestamp);
  vioData = self->_vioData;
  if (vioData)
    objc_msgSend(v6, "encodeObject:forKey:", vioData, CFSTR("vioData"));
  objc_msgSend(v6, "encodeInteger:forKey:", self->_vioDataType, CFSTR("vioDataType"));
  objc_msgSend(v6, "encodeInt64:forKey:", self->_vioSessionID, CFSTR("vioSessionID"));
  anchors = self->_anchors;
  if (anchors)
    objc_msgSend(v6, "encodeObject:forKey:", anchors, CFSTR("anchors"));

}

- (ARCollaborationData)initWithCoder:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  NSObject *v8;
  objc_class *v9;
  void *v10;
  ARCollaborationData *v11;
  ARCollaborationData *v12;
  double v13;
  uint64_t v14;
  NSData *vioData;
  void *v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  NSSet *anchors;
  objc_super v22;
  uint8_t buf[4];
  void *v24;
  __int16 v25;
  ARCollaborationData *v26;
  __int16 v27;
  uint64_t v28;
  __int16 v29;
  int v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("version"));
  if (v5 < 3)
  {
    v22.receiver = self;
    v22.super_class = (Class)ARCollaborationData;
    v12 = -[ARCollaborationData init](&v22, sel_init);
    if (v12)
    {
      v12->_priority = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("priority"));
      v12->_version = v5;
      objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("timestamp"));
      v12->_timestamp = v13;
      objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("vioData"));
      v14 = objc_claimAutoreleasedReturnValue();
      vioData = v12->_vioData;
      v12->_vioData = (NSData *)v14;

      v12->_vioDataType = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("vioDataType"));
      v12->_vioSessionID = objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("vioSessionID"));
      v16 = (void *)MEMORY[0x1E0C99E60];
      v17 = objc_opt_class();
      objc_msgSend(v16, "setWithObjects:", v17, objc_opt_class(), 0);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v18, CFSTR("anchors"));
      v19 = objc_claimAutoreleasedReturnValue();
      anchors = v12->_anchors;
      v12->_anchors = (NSSet *)v19;

    }
    self = v12;
    v11 = self;
  }
  else
  {
    ARErrorWithCodeAndUserInfo(304, 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "failWithError:", v6);

    if (_ARLogGeneral_onceToken_50 != -1)
      dispatch_once(&_ARLogGeneral_onceToken_50, &__block_literal_global_116);
    v7 = (void *)_ARLogGeneral_logObj_50;
    if (os_log_type_enabled((os_log_t)_ARLogGeneral_logObj_50, OS_LOG_TYPE_ERROR))
    {
      v8 = v7;
      v9 = (objc_class *)objc_opt_class();
      NSStringFromClass(v9);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544130;
      v24 = v10;
      v25 = 2048;
      v26 = self;
      v27 = 2048;
      v28 = v5;
      v29 = 1024;
      v30 = 2;
      _os_log_impl(&dword_1B3A68000, v8, OS_LOG_TYPE_ERROR, "%{public}@ <%p>: Error decoding collaboration data, unsupported version (%ti), current version %i", buf, 0x26u);

    }
    v11 = 0;
  }

  return v11;
}

- (ARCollaborationDataPriority)priority
{
  return self->_priority;
}

- (int64_t)version
{
  return self->_version;
}

- (double)timestamp
{
  return self->_timestamp;
}

- (NSData)vioData
{
  return self->_vioData;
}

- (int64_t)vioDataType
{
  return self->_vioDataType;
}

- (unint64_t)vioSessionID
{
  return self->_vioSessionID;
}

- (NSUUID)anchorIdentifier
{
  return self->_anchorIdentifier;
}

- (void)setAnchorIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_anchorIdentifier, a3);
}

- (NSSet)anchors
{
  return self->_anchors;
}

- (void)setAnchors:(id)a3
{
  objc_storeStrong((id *)&self->_anchors, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_anchors, 0);
  objc_storeStrong((id *)&self->_anchorIdentifier, 0);
  objc_storeStrong((id *)&self->_vioData, 0);
}

@end
