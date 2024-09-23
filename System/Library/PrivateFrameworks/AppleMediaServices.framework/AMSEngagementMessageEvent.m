@implementation AMSEngagementMessageEvent

uint64_t __43__AMSEngagementMessageEvent_engagementData__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "makeRawDictionary");
}

- (NSDictionary)engagementData
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  _QWORD v8[4];
  _QWORD v9[5];

  v9[4] = *MEMORY[0x1E0C80C00];
  v8[0] = CFSTR("source");
  v8[1] = CFSTR("eventType");
  v9[0] = CFSTR("AMS");
  v9[1] = CFSTR("MessageRequest");
  v8[2] = CFSTR("serviceType");
  -[AMSEngagementMessageEvent serviceType](self, "serviceType");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v9[2] = v3;
  v8[3] = CFSTR("placements");
  -[AMSEngagementMessageEvent placementInfo](self, "placementInfo");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "ams_mapWithTransform:", &__block_literal_global_47);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[3] = v5;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v9, v8, 4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDictionary *)v6;
}

- (NSString)serviceType
{
  return self->_serviceType;
}

- (NSArray)placementInfo
{
  return self->_placementInfo;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serviceType, 0);
  objc_storeStrong((id *)&self->_placementInfo, 0);
}

- (AMSEngagementMessageEvent)initWithServiceType:(id)a3 placements:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  AMSEngagementPlacementInfo *v15;
  AMSEngagementPlacementInfo *v16;
  void *v17;
  AMSEngagementMessageEvent *v18;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v9 = v7;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v21;
    do
    {
      v13 = 0;
      do
      {
        if (*(_QWORD *)v21 != v12)
          objc_enumerationMutation(v9);
        v14 = *(_QWORD *)(*((_QWORD *)&v20 + 1) + 8 * v13);
        v15 = [AMSEngagementPlacementInfo alloc];
        v16 = -[AMSEngagementPlacementInfo initWithPlacement:context:](v15, "initWithPlacement:context:", v14, 0, (_QWORD)v20);
        objc_msgSend(v8, "addObject:", v16);

        ++v13;
      }
      while (v11 != v13);
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    }
    while (v11);
  }

  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithArray:", v8);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = -[AMSEngagementMessageEvent initWithServiceType:placementInfo:](self, "initWithServiceType:placementInfo:", v6, v17);

  return v18;
}

- (AMSEngagementMessageEvent)initWithServiceType:(id)a3 placementInfo:(id)a4
{
  id v7;
  id v8;
  AMSEngagementMessageEvent *v9;
  AMSEngagementMessageEvent *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)AMSEngagementMessageEvent;
  v9 = -[AMSEngagementMessageEvent init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_serviceType, a3);
    objc_storeStrong((id *)&v10->_placementInfo, a4);
  }

  return v10;
}

- (void)setPlacementInfo:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (void)setServiceType:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

@end
