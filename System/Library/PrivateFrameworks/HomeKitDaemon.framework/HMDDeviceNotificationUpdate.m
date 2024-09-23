@implementation HMDDeviceNotificationUpdate

- (HMDDeviceNotificationUpdate)initWithRequestID:(id)a3
{
  id v5;
  HMDDeviceNotificationUpdate *v6;
  HMDDeviceNotificationUpdate *v7;
  uint64_t v8;
  NSMutableArray *notificationsCompletions;
  uint64_t v10;
  NSMapTable *characteristicUpdateTuples;
  uint64_t v12;
  NSMutableDictionary *updatedMediaPropertiesByMediaProfile;
  uint64_t v14;
  NSMutableDictionary *updatedActionSetResponsesByActionSetUUID;
  objc_super v17;

  v5 = a3;
  v17.receiver = self;
  v17.super_class = (Class)HMDDeviceNotificationUpdate;
  v6 = -[HMDDeviceNotificationUpdate init](&v17, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_requestID, a3);
    v7->_lock._os_unfair_lock_opaque = 0;
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v8 = objc_claimAutoreleasedReturnValue();
    notificationsCompletions = v7->_notificationsCompletions;
    v7->_notificationsCompletions = (NSMutableArray *)v8;

    objc_msgSend(MEMORY[0x24BDD1650], "strongToStrongObjectsMapTable");
    v10 = objc_claimAutoreleasedReturnValue();
    characteristicUpdateTuples = v7->_characteristicUpdateTuples;
    v7->_characteristicUpdateTuples = (NSMapTable *)v10;

    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v12 = objc_claimAutoreleasedReturnValue();
    updatedMediaPropertiesByMediaProfile = v7->_updatedMediaPropertiesByMediaProfile;
    v7->_updatedMediaPropertiesByMediaProfile = (NSMutableDictionary *)v12;

    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v14 = objc_claimAutoreleasedReturnValue();
    updatedActionSetResponsesByActionSetUUID = v7->_updatedActionSetResponsesByActionSetUUID;
    v7->_updatedActionSetResponsesByActionSetUUID = (NSMutableDictionary *)v14;

  }
  return v7;
}

- (void)_updateWithNotificationUpdateID:(id)a3 completion:(id)a4
{
  id v7;
  NSMutableArray *notificationsCompletions;
  void *v9;
  id v10;

  v10 = a3;
  v7 = a4;
  os_unfair_lock_assert_owner(&self->_lock);
  if (v10)
    objc_storeStrong((id *)&self->_notificationUpdateID, a3);
  if (v7)
  {
    notificationsCompletions = self->_notificationsCompletions;
    v9 = _Block_copy(v7);
    -[NSMutableArray addObject:](notificationsCompletions, "addObject:", v9);

  }
}

- (HMDDeviceNotificationUpdate)updateWithUpdatedMediaPropertiesByMediaResponses:(id)a3 notificationUpdateID:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  NSMutableDictionary *updatedMediaPropertiesByMediaProfile;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  NSMutableDictionary *v22;
  void *v23;
  void *v24;
  void *v25;
  HMDDeviceNotificationUpdate *result;
  void *v27;
  void *v28;
  id obj;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  _BYTE v34[128];
  uint64_t v35;

  v35 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  os_unfair_lock_lock_with_options();
  v27 = v9;
  v28 = v10;
  -[HMDDeviceNotificationUpdate _updateWithNotificationUpdateID:completion:](self, "_updateWithNotificationUpdateID:completion:", v9, v10);
  v32 = 0u;
  v33 = 0u;
  v30 = 0u;
  v31 = 0u;
  obj = v8;
  v11 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v30, v34, 16);
  if (v11)
  {
    v12 = *(_QWORD *)v31;
    do
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v31 != v12)
          objc_enumerationMutation(obj);
        v14 = *(void **)(*((_QWORD *)&v30 + 1) + 8 * i);
        updatedMediaPropertiesByMediaProfile = self->_updatedMediaPropertiesByMediaProfile;
        objc_msgSend(v14, "request");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "mediaProfile");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "uniqueIdentifier");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSMutableDictionary objectForKeyedSubscript:](updatedMediaPropertiesByMediaProfile, "objectForKeyedSubscript:", v18);
        v19 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v19)
        {
          objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
        }
        objc_msgSend(v14, "request");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "property");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "setObject:forKeyedSubscript:", v14, v21);

        v22 = self->_updatedMediaPropertiesByMediaProfile;
        objc_msgSend(v14, "request");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "mediaProfile");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "uniqueIdentifier");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSMutableDictionary setObject:forKeyedSubscript:](v22, "setObject:forKeyedSubscript:", v19, v25);

      }
      v11 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v30, v34, 16);
    }
    while (v11);
  }

  os_unfair_lock_unlock(&self->_lock);
  return result;
}

- (HMDDeviceNotificationUpdate)updateWithUpdatedActionSetResponses:(id)a3 notificationUpdateID:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  NSMutableDictionary *updatedActionSetResponsesByActionSetUUID;
  void *v17;
  HMDDeviceNotificationUpdate *result;
  void *v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  os_unfair_lock_lock_with_options();
  v19 = v9;
  -[HMDDeviceNotificationUpdate _updateWithNotificationUpdateID:completion:](self, "_updateWithNotificationUpdateID:completion:", v9, v10);
  v22 = 0u;
  v23 = 0u;
  v20 = 0u;
  v21 = 0u;
  v11 = v8;
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
  if (v12)
  {
    v13 = *(_QWORD *)v21;
    do
    {
      for (i = 0; i != v12; ++i)
      {
        if (*(_QWORD *)v21 != v13)
          objc_enumerationMutation(v11);
        v15 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * i);
        updatedActionSetResponsesByActionSetUUID = self->_updatedActionSetResponsesByActionSetUUID;
        objc_msgSend(v15, "actionSetUUID");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSMutableDictionary setObject:forKeyedSubscript:](updatedActionSetResponsesByActionSetUUID, "setObject:forKeyedSubscript:", v15, v17);

      }
      v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    }
    while (v12);
  }

  os_unfair_lock_unlock(&self->_lock);
  return result;
}

- (HMDDeviceNotificationUpdate)updateWithCharacteristicUpdates:(id)a3 notificationUpdateID:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  HMDDeviceNotificationUpdate *result;
  id v11;
  _QWORD v12[5];

  v11 = a3;
  v8 = a4;
  v9 = a5;
  os_unfair_lock_lock_with_options();
  -[HMDDeviceNotificationUpdate _updateWithNotificationUpdateID:completion:](self, "_updateWithNotificationUpdateID:completion:", v8, v9);
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __95__HMDDeviceNotificationUpdate_updateWithCharacteristicUpdates_notificationUpdateID_completion___block_invoke;
  v12[3] = &unk_24E777E88;
  v12[4] = self;
  objc_msgSend(v11, "na_each:", v12);
  os_unfair_lock_unlock(&self->_lock);

  return result;
}

- (NSArray)mediaProperties
{
  os_unfair_lock_s *p_lock;
  void *v4;

  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  -[NSMutableDictionary na_flatMap:](self->_updatedMediaPropertiesByMediaProfile, "na_flatMap:", &__block_literal_global_218);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  os_unfair_lock_unlock(p_lock);
  return (NSArray *)v4;
}

- (NSArray)actionSetResponses
{
  os_unfair_lock_s *p_lock;
  void *v4;

  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  -[NSMutableDictionary na_flatMap:](self->_updatedActionSetResponsesByActionSetUUID, "na_flatMap:", &__block_literal_global_220);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  os_unfair_lock_unlock(p_lock);
  return (NSArray *)v4;
}

- (NSArray)characteristicUpdateTuples
{
  os_unfair_lock_s *p_lock;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  id v8;

  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  -[NSMapTable objectEnumerator](self->_characteristicUpdateTuples, "objectEnumerator");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "allObjects");
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = (void *)v5;
  v7 = (void *)MEMORY[0x24BDBD1A8];
  if (v5)
    v7 = (void *)v5;
  v8 = v7;

  os_unfair_lock_unlock(p_lock);
  return (NSArray *)v8;
}

- (NSArray)completions
{
  os_unfair_lock_s *p_lock;
  NSMutableArray *notificationsCompletions;
  NSMutableArray *v5;

  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  notificationsCompletions = self->_notificationsCompletions;
  if (!notificationsCompletions)
    notificationsCompletions = (NSMutableArray *)MEMORY[0x24BDBD1A8];
  v5 = notificationsCompletions;
  os_unfair_lock_unlock(p_lock);
  return (NSArray *)v5;
}

- (NSString)requestID
{
  return self->_requestID;
}

- (NSString)notificationUpdateID
{
  return self->_notificationUpdateID;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_notificationUpdateID, 0);
  objc_storeStrong((id *)&self->_requestID, 0);
  objc_storeStrong((id *)&self->_updatedActionSetResponsesByActionSetUUID, 0);
  objc_storeStrong((id *)&self->_updatedMediaPropertiesByMediaProfile, 0);
  objc_storeStrong((id *)&self->_characteristicUpdateTuples, 0);
  objc_storeStrong((id *)&self->_notificationsCompletions, 0);
}

id __49__HMDDeviceNotificationUpdate_actionSetResponses__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  void *v3;
  id v4;
  void *v5;
  _QWORD v7[2];

  v7[1] = *MEMORY[0x24BDAC8D0];
  v7[0] = a3;
  v3 = (void *)MEMORY[0x24BDBCE30];
  v4 = a3;
  objc_msgSend(v3, "arrayWithObjects:count:", v7, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

uint64_t __46__HMDDeviceNotificationUpdate_mediaProperties__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  return objc_msgSend(a3, "allValues");
}

void __95__HMDDeviceNotificationUpdate_updateWithCharacteristicUpdates_notificationUpdateID_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  NSObject *v7;
  void *v8;
  int v9;
  void *v10;
  __int16 v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  objc_msgSend(v3, "characteristic");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "objectForKey:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    v6 = (void *)MEMORY[0x227676638]();
    HMFGetOSLogHandle();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    {
      HMFGetLogIdentifier();
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = 138543618;
      v10 = v8;
      v11 = 2112;
      v12 = v4;
      _os_log_impl(&dword_2218F0000, v7, OS_LOG_TYPE_DEBUG, "%{public}@Overriding the existing changed characteristic: %@ to send notifications", (uint8_t *)&v9, 0x16u);

    }
    objc_autoreleasePoolPop(v6);
  }
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "setObject:forKey:", v3, v4);

}

@end
