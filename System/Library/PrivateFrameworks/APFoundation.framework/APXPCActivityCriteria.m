@implementation APXPCActivityCriteria

- (APXPCActivityCriteria)init
{
  APXPCActivityCriteria *result;
  const char *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)APXPCActivityCriteria;
  result = -[APXPCActivityCriteria init](&v4, sel_init);
  if (result)
  {
    result->_requiresNetworkConnectivity = 1;
    v3 = (const char *)*MEMORY[0x1E0C80880];
    result->_gracePeriod = *MEMORY[0x1E0C807C8];
    result->_priority = v3;
    *(_WORD *)&result->_requireClassCData = 257;
    result->_scheduledTime = NAN;
  }
  return result;
}

- (id)translateCriteria
{
  APXPCActivityCriteria *v2;
  xpc_object_t v3;
  const char *v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  char v8;
  const char *v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  char v13;
  const char *v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  char isRepeating;
  const char *v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  char isCPUIntensive;
  const char *v24;
  const char *v25;
  uint64_t v26;
  uint64_t v27;
  char isDiskIntensive;
  const char *v29;
  const char *v30;
  uint64_t v31;
  uint64_t v32;
  char v33;
  const char *v34;
  const char *v35;
  uint64_t v36;
  uint64_t v37;
  int64_t v38;
  const char *v39;
  uint64_t v40;
  uint64_t v41;
  const char *v42;
  uint64_t v43;
  uint64_t v44;
  const char *v45;
  const char *v46;
  const char *v47;
  const char *v48;
  uint64_t v49;
  uint64_t v50;
  int64_t v51;
  const char *v52;
  uint64_t v53;
  uint64_t v54;
  const char *v55;
  uint64_t v56;
  uint64_t v57;
  const char *v58;
  int64_t v59;
  const char *v60;
  char v61;
  const char *v62;
  const char *v63;
  uint64_t v64;
  uint64_t v65;
  char v66;
  const char *v67;
  uint64_t v68;
  uint64_t v69;
  const char *v70;
  uint64_t v71;
  uint64_t v72;
  double v73;

  v2 = self;
  v3 = xpc_dictionary_create(0, 0, 0);
  v4 = (const char *)*MEMORY[0x1E0C80738];
  v8 = objc_msgSend_allowBattery(v2, v5, v6, v7);
  xpc_dictionary_set_BOOL(v3, v4, v8);
  v9 = (const char *)*MEMORY[0x1E0C808D8];
  v13 = objc_msgSend_requireSleep(v2, v10, v11, v12);
  xpc_dictionary_set_BOOL(v3, v9, v13);
  v14 = (const char *)*MEMORY[0x1E0C80898];
  isRepeating = objc_msgSend_isRepeating(v2, v15, v16, v17);
  xpc_dictionary_set_BOOL(v3, v14, isRepeating);
  v19 = (const char *)*MEMORY[0x1E0C80758];
  isCPUIntensive = objc_msgSend_isCPUIntensive(v2, v20, v21, v22);
  xpc_dictionary_set_BOOL(v3, v19, isCPUIntensive);
  v24 = (const char *)*MEMORY[0x1E0C80770];
  isDiskIntensive = objc_msgSend_isDiskIntensive(v2, v25, v26, v27);
  xpc_dictionary_set_BOOL(v3, v24, isDiskIntensive);
  v29 = (const char *)*MEMORY[0x1E0C808D0];
  v33 = objc_msgSend_requiresNetworkConnectivity(v2, v30, v31, v32);
  xpc_dictionary_set_BOOL(v3, v29, v33);
  v34 = (const char *)*MEMORY[0x1E0C80790];
  v38 = objc_msgSend_gracePeriod(v2, v35, v36, v37);
  xpc_dictionary_set_int64(v3, v34, v38);
  if (!objc_msgSend_priority(v2, v39, v40, v41))
    objc_msgSend_setPriority_(v2, v42, *MEMORY[0x1E0C80880], v44);
  v45 = (const char *)*MEMORY[0x1E0C80878];
  v46 = (const char *)objc_msgSend_priority(v2, v42, v43, v44);
  xpc_dictionary_set_string(v3, v45, v46);
  v47 = (const char *)*MEMORY[0x1E0C80760];
  v51 = objc_msgSend_delay(v2, v48, v49, v50);
  xpc_dictionary_set_int64(v3, v47, v51);
  if (objc_msgSend_isRepeating(v2, v52, v53, v54))
  {
    v58 = (const char *)*MEMORY[0x1E0C807A8];
    v59 = objc_msgSend_interval(v2, v55, v56, v57);
    xpc_dictionary_set_int64(v3, v58, v59);
  }
  v60 = (const char *)*MEMORY[0x1E0C808A0];
  v61 = objc_msgSend_requireBuddyComplete(v2, v55, v56, v57);
  xpc_dictionary_set_BOOL(v3, v60, v61);
  v62 = (const char *)*MEMORY[0x1E0C808B8];
  v66 = objc_msgSend_requireClassCData(v2, v63, v64, v65);
  xpc_dictionary_set_BOOL(v3, v62, v66);
  objc_msgSend_scheduledTime(v2, v67, v68, v69);
  objc_msgSend_scheduledTime(v2, v70, v71, v72);
  xpc_dictionary_set_double(v3, "APScheduledTime", v73);

  return v3;
}

- (int64_t)firstRunInterval
{
  return self->_firstRunInterval;
}

- (void)setFirstRunInterval:(int64_t)a3
{
  self->_firstRunInterval = a3;
}

- (int64_t)delay
{
  return self->_delay;
}

- (void)setDelay:(int64_t)a3
{
  self->_delay = a3;
}

- (int64_t)interval
{
  return self->_interval;
}

- (void)setInterval:(int64_t)a3
{
  self->_interval = a3;
}

- (BOOL)requiresNetworkConnectivity
{
  return self->_requiresNetworkConnectivity;
}

- (void)setRequiresNetworkConnectivity:(BOOL)a3
{
  self->_requiresNetworkConnectivity = a3;
}

- (BOOL)requireBuddyComplete
{
  return self->_requireBuddyComplete;
}

- (void)setRequireBuddyComplete:(BOOL)a3
{
  self->_requireBuddyComplete = a3;
}

- (BOOL)requireClassCData
{
  return self->_requireClassCData;
}

- (void)setRequireClassCData:(BOOL)a3
{
  self->_requireClassCData = a3;
}

- (BOOL)allowBattery
{
  return self->_allowBattery;
}

- (void)setAllowBattery:(BOOL)a3
{
  self->_allowBattery = a3;
}

- (BOOL)requireSleep
{
  return self->_requireSleep;
}

- (void)setRequireSleep:(BOOL)a3
{
  self->_requireSleep = a3;
}

- (BOOL)isRepeating
{
  return self->_isRepeating;
}

- (void)setIsRepeating:(BOOL)a3
{
  self->_isRepeating = a3;
}

- (int64_t)gracePeriod
{
  return self->_gracePeriod;
}

- (void)setGracePeriod:(int64_t)a3
{
  self->_gracePeriod = a3;
}

- (const)priority
{
  return self->_priority;
}

- (void)setPriority:(const char *)a3
{
  self->_priority = a3;
}

- (BOOL)isCPUIntensive
{
  return self->_isCPUIntensive;
}

- (void)setIsCPUIntensive:(BOOL)a3
{
  self->_isCPUIntensive = a3;
}

- (BOOL)isDiskIntensive
{
  return self->_isDiskIntensive;
}

- (void)setIsDiskIntensive:(BOOL)a3
{
  self->_isDiskIntensive = a3;
}

- (NSDictionary)customProperties
{
  return self->_customProperties;
}

- (void)setCustomProperties:(id)a3
{
  self->_customProperties = (NSDictionary *)a3;
}

- (double)scheduledTime
{
  return self->_scheduledTime;
}

- (void)setScheduledTime:(double)a3
{
  self->_scheduledTime = a3;
}

@end
