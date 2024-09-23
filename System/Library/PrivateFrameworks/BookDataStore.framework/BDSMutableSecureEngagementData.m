@implementation BDSMutableSecureEngagementData

- (BDSMutableSecureEngagementData)initWithStartTimestampString:(id)a3 durationInterval:(double)a4
{
  id v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  BDSMutableSecureEngagementData *v11;
  uint64_t v12;
  NSString *startTimestampString;
  NSObject *v14;
  objc_super v16;

  v6 = a3;
  if (v6)
  {
    v16.receiver = self;
    v16.super_class = (Class)BDSMutableSecureEngagementData;
    v11 = -[BCMutableCloudData init](&v16, sel_init);
    if (v11)
    {
      v12 = objc_msgSend_copy(v6, v7, v8, v9, v10);
      startTimestampString = v11->_startTimestampString;
      v11->_startTimestampString = (NSString *)v12;

      v11->_durationInterval = a4;
    }
  }
  else
  {
    BDSCloudKitLog();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      sub_227E5ACF8();

    v11 = 0;
  }

  return v11;
}

- (BDSMutableSecureEngagementData)initWithCloudData:(id)a3
{
  id v4;
  BDSMutableSecureEngagementData *v5;
  void *v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  NSString *startTimestampString;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  double v23;
  const char *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  const char *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  NSObject *p_super;
  objc_super v36;

  v4 = a3;
  v36.receiver = self;
  v36.super_class = (Class)BDSMutableSecureEngagementData;
  v5 = -[BCMutableCloudData initWithCloudData:](&v36, sel_initWithCloudData_, v4);
  if (v5)
  {
    BUProtocolCast();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v6;
    if (v6)
    {
      objc_msgSend_startTimestampString(v6, v7, v8, v9, v10);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = objc_msgSend_copy(v12, v13, v14, v15, v16);
      startTimestampString = v5->_startTimestampString;
      v5->_startTimestampString = (NSString *)v17;

      objc_msgSend_durationInterval(v11, v19, v20, v21, v22);
      v5->_durationInterval = v23;
      objc_msgSend_value(v11, v24, v25, v26, v27);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v33 = objc_msgSend_copy(v28, v29, v30, v31, v32);
      p_super = &v5->_value->super;
      v5->_value = (NSData *)v33;
    }
    else
    {
      BDSCloudKitLog();
      p_super = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(p_super, OS_LOG_TYPE_ERROR))
        sub_227E5AB8C();
      v28 = v5;
      v5 = 0;
    }

  }
  return v5;
}

- (BDSMutableSecureEngagementData)initWithRecord:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  BDSMutableSecureEngagementData *v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  NSObject *v15;
  NSObject *p_super;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  NSString *startTimestampString;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  const char *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  double v31;
  const char *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  NSData *value;
  objc_super v39;

  v4 = a3;
  if (!v4)
  {
    BDSCloudKitLog();
    p_super = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(p_super, OS_LOG_TYPE_ERROR))
      sub_227E5AD24();
    goto LABEL_9;
  }
  v39.receiver = self;
  v39.super_class = (Class)BDSMutableSecureEngagementData;
  v8 = -[BCMutableCloudData initWithRecord:](&v39, sel_initWithRecord_, v4);
  if (v8)
  {
    objc_msgSend_objectForKey_(v4, v5, (uint64_t)CFSTR("value"), v6, v7);
    self = (BDSMutableSecureEngagementData *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend_isEngagementTimeSliceDataEmpty_(BDSSecureEngagementDataHelper, v9, (uint64_t)self, v10, v11) & 1) == 0)
    {
      objc_msgSend_localIdentifierFromRecord_(BCCloudData, v12, (uint64_t)v4, v13, v14);
      p_super = objc_claimAutoreleasedReturnValue();
      v21 = objc_msgSend_copy(p_super, v17, v18, v19, v20);
      startTimestampString = v8->_startTimestampString;
      v8->_startTimestampString = (NSString *)v21;

      objc_msgSend_objectForKey_(v4, v23, (uint64_t)CFSTR("durationInterval"), v24, v25);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_doubleValue(v26, v27, v28, v29, v30);
      v8->_durationInterval = v31;

      v36 = objc_msgSend_copy(self, v32, v33, v34, v35);
      value = v8->_value;
      v8->_value = (NSData *)v36;

      goto LABEL_11;
    }
    BDSCloudKitLog();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      sub_227E5AD50();

    p_super = &v8->super.super;
LABEL_9:
    v8 = 0;
LABEL_11:

  }
  return v8;
}

- (NSString)description
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *v6;
  void *v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;

  v6 = (void *)MEMORY[0x24BDD17C8];
  objc_msgSend_startTimestampString(self, a2, v2, v3, v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_durationInterval(self, v8, v9, v10, v11);
  objc_msgSend_stringWithFormat_(v6, v12, (uint64_t)CFSTR("start timestamp: %@, duration interval: %.1lf"), v13, v14, v7, v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v16;
}

- (id)recordType
{
  return CFSTR("SecureEngagement");
}

- (id)zoneName
{
  return CFSTR("SecureUserDataZone");
}

- (id)configuredRecordFromAttributes
{
  void *v3;
  void *v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  const char *v14;
  uint64_t v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  const char *v21;
  uint64_t v22;
  objc_super v24;

  v24.receiver = self;
  v24.super_class = (Class)BDSMutableSecureEngagementData;
  -[BCMutableCloudData configuredRecordFromAttributes](&v24, sel_configuredRecordFromAttributes);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)MEMORY[0x24BDD16E0];
  objc_msgSend_durationInterval(self, v5, v6, v7, v8);
  objc_msgSend_numberWithDouble_(v4, v9, v10, v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKey_(v3, v14, (uint64_t)v13, (uint64_t)CFSTR("durationInterval"), v15);

  objc_msgSend_value(self, v16, v17, v18, v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKey_(v3, v21, (uint64_t)v20, (uint64_t)CFSTR("value"), v22);

  return v3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  const char *v17;
  uint64_t v18;
  objc_super v19;

  v19.receiver = self;
  v19.super_class = (Class)BDSMutableSecureEngagementData;
  v4 = a3;
  -[BCMutableCloudData encodeWithCoder:](&v19, sel_encodeWithCoder_, v4);
  objc_msgSend_durationInterval(self, v5, v6, v7, v8, v19.receiver, v19.super_class);
  objc_msgSend_encodeDouble_forKey_(v4, v9, (uint64_t)CFSTR("durationInterval"), v10, v11);
  objc_msgSend_value(self, v12, v13, v14, v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v4, v17, (uint64_t)v16, (uint64_t)CFSTR("value"), v18);

}

- (BDSMutableSecureEngagementData)initWithCoder:(id)a3
{
  id v4;
  BDSMutableSecureEngagementData *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  BDSMutableSecureEngagementData *v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  NSString *startTimestampString;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  double v21;
  uint64_t v22;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  NSData *value;
  objc_super v28;

  v4 = a3;
  v28.receiver = self;
  v28.super_class = (Class)BDSMutableSecureEngagementData;
  v5 = -[BCMutableCloudData initWithCoder:](&v28, sel_initWithCoder_, v4);
  v10 = v5;
  if (v5)
  {
    objc_msgSend_localRecordID(v5, v6, v7, v8, v9);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend_copy(v11, v12, v13, v14, v15);
    startTimestampString = v10->_startTimestampString;
    v10->_startTimestampString = (NSString *)v16;

    objc_msgSend_decodeDoubleForKey_(v4, v18, (uint64_t)CFSTR("durationInterval"), v19, v20);
    v10->_durationInterval = v21;
    v22 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v23, v22, (uint64_t)CFSTR("value"), v24);
    v25 = objc_claimAutoreleasedReturnValue();
    value = v10->_value;
    v10->_value = (NSData *)v25;

  }
  return v10;
}

- (NSString)startTimestampString
{
  return self->_startTimestampString;
}

- (void)setStartTimestampString:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (double)durationInterval
{
  return self->_durationInterval;
}

- (void)setDurationInterval:(double)a3
{
  self->_durationInterval = a3;
}

- (NSData)value
{
  return self->_value;
}

- (void)setValue:(id)a3
{
  objc_storeStrong((id *)&self->_value, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_value, 0);
  objc_storeStrong((id *)&self->_startTimestampString, 0);
}

@end
