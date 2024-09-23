@implementation KCPairingChannelContext

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  NSString *model;
  NSString *modelVersion;
  NSString *modelClass;
  NSString *osVersion;
  NSString *uniqueDeviceID;
  NSString *altDSID;
  NSString *uniqueClientID;
  NSString *intent;
  NSString *capability;
  NSString *flowID;
  char v15;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_24;
  model = self->_model;
  if ((unint64_t)model | v4[1])
  {
    if (!-[NSString isEqual:](model, "isEqual:"))
      goto LABEL_24;
  }
  modelVersion = self->_modelVersion;
  if ((unint64_t)modelVersion | v4[2] && !-[NSString isEqual:](modelVersion, "isEqual:"))
    goto LABEL_24;
  modelClass = self->_modelClass;
  if ((unint64_t)modelClass | v4[3] && !-[NSString isEqual:](modelClass, "isEqual:"))
    goto LABEL_24;
  if (((osVersion = self->_osVersion, !((unint64_t)osVersion | v4[4]))
     || -[NSString isEqual:](osVersion, "isEqual:"))
    && ((uniqueDeviceID = self->_uniqueDeviceID, !((unint64_t)uniqueDeviceID | v4[5]))
     || -[NSString isEqual:](uniqueDeviceID, "isEqual:"))
    && ((altDSID = self->_altDSID, !((unint64_t)altDSID | v4[7]))
     || -[NSString isEqual:](altDSID, "isEqual:"))
    && ((uniqueClientID = self->_uniqueClientID, !((unint64_t)uniqueClientID | v4[6]))
     || -[NSString isEqual:](uniqueClientID, "isEqual:"))
    && ((intent = self->_intent, !((unint64_t)intent | v4[10]))
     || -[NSString isEqual:](intent, "isEqual:"))
    && ((capability = self->_capability, !((unint64_t)capability | v4[11]))
     || -[NSString isEqual:](capability, "isEqual:"))
    && ((flowID = self->_flowID, !((unint64_t)flowID | v4[8]))
     || -[NSString isEqual:](flowID, "isEqual:")))
  {
    if ((uint64_t)self->_deviceSessionID | v4[9])
      v15 = -[NSString isEqual:](self->_flowID, "isEqual:");
    else
      v15 = 1;
  }
  else
  {
LABEL_24:
    v15 = 0;
  }

  return v15;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *model;
  id v5;

  model = self->_model;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", model, CFSTR("model"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_modelVersion, CFSTR("modelVersion"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_modelClass, CFSTR("modelClass"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_osVersion, CFSTR("osVersion"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_altDSID, CFSTR("altDSID"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_uniqueDeviceID, CFSTR("uniqueDeviceID"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_uniqueClientID, CFSTR("uniqueClientID"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_intent, CFSTR("intent"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_capability, CFSTR("capability"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_flowID, CFSTR("flowID"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_deviceSessionID, CFSTR("deviceSessionID"));

}

- (KCPairingChannelContext)initWithCoder:(id)a3
{
  id v4;
  KCPairingChannelContext *v5;
  uint64_t v6;
  NSString *model;
  uint64_t v8;
  NSString *modelVersion;
  uint64_t v10;
  NSString *modelClass;
  uint64_t v12;
  NSString *osVersion;
  uint64_t v14;
  NSString *altDSID;
  uint64_t v16;
  NSString *uniqueDeviceID;
  uint64_t v18;
  NSString *uniqueClientID;
  uint64_t v20;
  NSString *intent;
  uint64_t v22;
  NSString *capability;
  uint64_t v24;
  NSString *flowID;
  uint64_t v26;
  NSString *deviceSessionID;
  NSString *v28;
  NSString *v29;
  KCPairingChannelContext *v30;
  objc_super v32;

  v4 = a3;
  v32.receiver = self;
  v32.super_class = (Class)KCPairingChannelContext;
  v5 = -[KCPairingChannelContext init](&v32, sel_init);
  if (!v5)
    goto LABEL_9;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("model"));
  v6 = objc_claimAutoreleasedReturnValue();
  model = v5->_model;
  v5->_model = (NSString *)v6;

  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("modelVersion"));
  v8 = objc_claimAutoreleasedReturnValue();
  modelVersion = v5->_modelVersion;
  v5->_modelVersion = (NSString *)v8;

  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("modelClass"));
  v10 = objc_claimAutoreleasedReturnValue();
  modelClass = v5->_modelClass;
  v5->_modelClass = (NSString *)v10;

  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("osVersion"));
  v12 = objc_claimAutoreleasedReturnValue();
  osVersion = v5->_osVersion;
  v5->_osVersion = (NSString *)v12;

  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("altDSID"));
  v14 = objc_claimAutoreleasedReturnValue();
  altDSID = v5->_altDSID;
  v5->_altDSID = (NSString *)v14;

  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("uniqueDeviceID"));
  v16 = objc_claimAutoreleasedReturnValue();
  uniqueDeviceID = v5->_uniqueDeviceID;
  v5->_uniqueDeviceID = (NSString *)v16;

  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("uniqueClientID"));
  v18 = objc_claimAutoreleasedReturnValue();
  uniqueClientID = v5->_uniqueClientID;
  v5->_uniqueClientID = (NSString *)v18;

  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("intent"));
  v20 = objc_claimAutoreleasedReturnValue();
  intent = v5->_intent;
  v5->_intent = (NSString *)v20;

  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("capability"));
  v22 = objc_claimAutoreleasedReturnValue();
  capability = v5->_capability;
  v5->_capability = (NSString *)v22;

  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("flowID"));
  v24 = objc_claimAutoreleasedReturnValue();
  flowID = v5->_flowID;
  v5->_flowID = (NSString *)v24;

  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("deviceSessionID"));
  v26 = objc_claimAutoreleasedReturnValue();
  deviceSessionID = v5->_deviceSessionID;
  v5->_deviceSessionID = (NSString *)v26;

  v28 = v5->_intent;
  if (v28)
  {
    if (!-[NSString isEqualToString:](v28, "isEqualToString:", CFSTR("none"))
      && !-[NSString isEqualToString:](v5->_intent, "isEqualToString:", CFSTR("repair"))
      && !-[NSString isEqualToString:](v5->_intent, "isEqualToString:", CFSTR("userdriven")))
    {
      goto LABEL_11;
    }
  }
  v29 = v5->_capability;
  if (!v29
    || -[NSString isEqualToString:](v29, "isEqualToString:", CFSTR("full"))
    || -[NSString isEqualToString:](v5->_capability, "isEqualToString:", CFSTR("limited")))
  {
LABEL_9:
    v30 = v5;
  }
  else
  {
LABEL_11:
    v30 = 0;
  }

  return v30;
}

- (NSString)model
{
  return self->_model;
}

- (void)setModel:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSString)modelVersion
{
  return self->_modelVersion;
}

- (void)setModelVersion:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSString)modelClass
{
  return self->_modelClass;
}

- (void)setModelClass:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSString)osVersion
{
  return self->_osVersion;
}

- (void)setOsVersion:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (NSString)uniqueDeviceID
{
  return self->_uniqueDeviceID;
}

- (void)setUniqueDeviceID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (NSString)uniqueClientID
{
  return self->_uniqueClientID;
}

- (void)setUniqueClientID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (NSString)altDSID
{
  return self->_altDSID;
}

- (void)setAltDSID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (NSString)flowID
{
  return self->_flowID;
}

- (void)setFlowID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (NSString)deviceSessionID
{
  return self->_deviceSessionID;
}

- (void)setDeviceSessionID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (NSString)intent
{
  return self->_intent;
}

- (void)setIntent:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 80);
}

- (NSString)capability
{
  return self->_capability;
}

- (void)setCapability:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 88);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_capability, 0);
  objc_storeStrong((id *)&self->_intent, 0);
  objc_storeStrong((id *)&self->_deviceSessionID, 0);
  objc_storeStrong((id *)&self->_flowID, 0);
  objc_storeStrong((id *)&self->_altDSID, 0);
  objc_storeStrong((id *)&self->_uniqueClientID, 0);
  objc_storeStrong((id *)&self->_uniqueDeviceID, 0);
  objc_storeStrong((id *)&self->_osVersion, 0);
  objc_storeStrong((id *)&self->_modelClass, 0);
  objc_storeStrong((id *)&self->_modelVersion, 0);
  objc_storeStrong((id *)&self->_model, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
