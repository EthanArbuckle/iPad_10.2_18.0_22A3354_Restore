@implementation BDSDistributedPriceTrackingConfig

+ (BDSDistributedPriceTrackingConfig)disabledConfig
{
  id v2;
  const char *v3;

  v2 = objc_alloc((Class)a1);
  return (BDSDistributedPriceTrackingConfig *)(id)objc_msgSend_initWithItemIDs_updateScheduleSteps_dealAbsoluteThreshold_dealRelativeThreshold_notification_cardLimit_(v2, v3, MEMORY[0x24BDBD1A8], MEMORY[0x24BDBD1A8], (uint64_t)&unk_24F0A95A0, &unk_24F0A95A0, 0, &unk_24F0A95A0);
}

- (BDSDistributedPriceTrackingConfig)initWithItemIDs:(id)a3 updateScheduleSteps:(id)a4 dealAbsoluteThreshold:(id)a5 dealRelativeThreshold:(id)a6 notification:(id)a7 cardLimit:(id)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  BDSDistributedPriceTrackingConfig *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  void *v28;
  const char *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  void *v34;
  void *v35;
  const char *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  void *v41;
  void *v42;
  const char *v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  void *v48;
  void *v49;
  const char *v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  void *v55;
  void *v56;
  objc_super v58;

  v14 = a3;
  v15 = a4;
  v16 = a5;
  v17 = a6;
  v18 = a7;
  v19 = a8;
  v58.receiver = self;
  v58.super_class = (Class)BDSDistributedPriceTrackingConfig;
  v24 = -[BDSDistributedPriceTrackingConfig init](&v58, sel_init);
  if (v24)
  {
    v25 = objc_msgSend_copy(v14, v20, v21, v22, v23);
    v26 = (void *)v25;
    v27 = (void *)MEMORY[0x24BDBD1A8];
    if (v25)
      v28 = (void *)v25;
    else
      v28 = (void *)MEMORY[0x24BDBD1A8];
    objc_storeStrong((id *)&v24->_itemIDs, v28);

    v33 = objc_msgSend_copy(v15, v29, v30, v31, v32);
    v34 = (void *)v33;
    if (v33)
      v35 = (void *)v33;
    else
      v35 = v27;
    objc_storeStrong((id *)&v24->_updateScheduleSteps, v35);

    v40 = objc_msgSend_copy(v16, v36, v37, v38, v39);
    v41 = (void *)v40;
    if (v40)
      v42 = (void *)v40;
    else
      v42 = &unk_24F0A95A0;
    objc_storeStrong((id *)&v24->_dealAbsoluteThreshold, v42);

    v47 = objc_msgSend_copy(v17, v43, v44, v45, v46);
    v48 = (void *)v47;
    if (v47)
      v49 = (void *)v47;
    else
      v49 = &unk_24F0A95A0;
    objc_storeStrong((id *)&v24->_dealRelativeThreshold, v49);

    objc_storeStrong((id *)&v24->_notification, a7);
    v54 = objc_msgSend_copy(v19, v50, v51, v52, v53);
    v55 = (void *)v54;
    if (v54)
      v56 = (void *)v54;
    else
      v56 = &unk_24F0A95A0;
    objc_storeStrong((id *)&v24->_cardLimit, v56);

  }
  return v24;
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
  void *v9;
  const char *v10;
  uint64_t v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  const char *v17;
  uint64_t v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  const char *v24;
  uint64_t v25;
  const char *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  const char *v31;
  uint64_t v32;
  const char *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  void *v37;
  const char *v38;
  uint64_t v39;
  const char *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  const char *v44;
  uint64_t v45;
  id v46;

  v4 = a3;
  objc_msgSend_itemIDs(self, v5, v6, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v4, v10, (uint64_t)v9, (uint64_t)CFSTR("itemIDs"), v11);

  objc_msgSend_updateScheduleSteps(self, v12, v13, v14, v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v4, v17, (uint64_t)v16, (uint64_t)CFSTR("updateScheduleSteps"), v18);

  objc_msgSend_dealAbsoluteThreshold(self, v19, v20, v21, v22);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v4, v24, (uint64_t)v23, (uint64_t)CFSTR("dealAbsoluteThreshold"), v25);

  objc_msgSend_dealRelativeThreshold(self, v26, v27, v28, v29);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v4, v31, (uint64_t)v30, (uint64_t)CFSTR("dealRelativeThreshold"), v32);

  objc_msgSend_notification(self, v33, v34, v35, v36);
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v4, v38, (uint64_t)v37, (uint64_t)CFSTR("notification"), v39);

  objc_msgSend_cardLimit(self, v40, v41, v42, v43);
  v46 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v4, v44, (uint64_t)v46, (uint64_t)CFSTR("cardLimit"), v45);

}

- (BDSDistributedPriceTrackingConfig)initWithCoder:(id)a3
{
  id v4;
  uint64_t v5;
  const char *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  const char *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  const char *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  const char *v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  const char *v22;
  uint64_t v23;
  void *v24;
  uint64_t v25;
  const char *v26;
  uint64_t v27;
  void *v28;
  const char *v29;
  BDSDistributedPriceTrackingConfig *updated;

  v4 = a3;
  v5 = objc_opt_class();
  objc_msgSend_bds_decodeArrayOfObjectsOfClass_forKey_(v4, v6, v5, (uint64_t)CFSTR("itemIDs"), v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_opt_class();
  objc_msgSend_bds_decodeArrayOfObjectsOfClass_forKey_(v4, v10, v9, (uint64_t)CFSTR("updateScheduleSteps"), v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_opt_class();
  objc_msgSend_decodeObjectOfClass_forKey_(v4, v14, v13, (uint64_t)CFSTR("dealAbsoluteThreshold"), v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_opt_class();
  objc_msgSend_decodeObjectOfClass_forKey_(v4, v18, v17, (uint64_t)CFSTR("dealRelativeThreshold"), v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = objc_opt_class();
  objc_msgSend_decodeObjectOfClass_forKey_(v4, v22, v21, (uint64_t)CFSTR("notification"), v23);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = objc_opt_class();
  objc_msgSend_decodeObjectOfClass_forKey_(v4, v26, v25, (uint64_t)CFSTR("cardLimit"), v27);
  v28 = (void *)objc_claimAutoreleasedReturnValue();

  updated = (BDSDistributedPriceTrackingConfig *)objc_msgSend_initWithItemIDs_updateScheduleSteps_dealAbsoluteThreshold_dealRelativeThreshold_notification_cardLimit_(self, v29, (uint64_t)v8, (uint64_t)v12, (uint64_t)v16, v20, v24, v28);
  return updated;
}

- (NSArray)itemIDs
{
  return self->_itemIDs;
}

- (NSArray)updateScheduleSteps
{
  return self->_updateScheduleSteps;
}

- (NSNumber)dealAbsoluteThreshold
{
  return self->_dealAbsoluteThreshold;
}

- (NSNumber)dealRelativeThreshold
{
  return self->_dealRelativeThreshold;
}

- (BDSDistributedPriceTrackingConfigNotification)notification
{
  return self->_notification;
}

- (NSNumber)cardLimit
{
  return self->_cardLimit;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cardLimit, 0);
  objc_storeStrong((id *)&self->_notification, 0);
  objc_storeStrong((id *)&self->_dealRelativeThreshold, 0);
  objc_storeStrong((id *)&self->_dealAbsoluteThreshold, 0);
  objc_storeStrong((id *)&self->_updateScheduleSteps, 0);
  objc_storeStrong((id *)&self->_itemIDs, 0);
}

@end
