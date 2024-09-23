@implementation VCIDRSchedulerPeriodGroup

- (VCIDRSchedulerPeriodGroup)initWithPeriodCount:(unsigned int)a3 framesPerBasePeriod:(unsigned int)a4
{
  VCIDRSchedulerPeriodGroup *v6;
  VCIDRSchedulerPeriodGroup *v7;
  objc_super v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v9.receiver = self;
  v9.super_class = (Class)VCIDRSchedulerPeriodGroup;
  v6 = -[VCIDRSchedulerPeriodGroup init](&v9, sel_init);
  v7 = v6;
  if (v6)
  {
    v6->_basePeriodCount = a3;
    v6->_framesPerBasePeriod = a4;
    v6->_streams = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
  }
  return v7;
}

- (void)dealloc
{
  objc_super v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];

  v3.receiver = self;
  v3.super_class = (Class)VCIDRSchedulerPeriodGroup;
  -[VCIDRSchedulerPeriodGroup dealloc](&v3, sel_dealloc);
}

- (void)addStream:(id)a3
{
  -[NSMutableArray addObject:](self->_streams, "addObject:", a3);
}

- (id)computeScheduleItemList
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  VCIDRSchedulerItem *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _BYTE v11[128];
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v3 = (void *)-[NSMutableArray sortedArrayUsingSelector:](self->_streams, "sortedArrayUsingSelector:", sel_compareWeightFactor_);

  self->_schedulerItems = (NSMutableArray *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", (objc_msgSend(v3, "count") + (unint64_t)self->_basePeriodCount - 1)/ self->_basePeriodCount);
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v12, v11, 16);
  if (v4)
  {
    v5 = v4;
    v6 = 0;
    v7 = *(_QWORD *)v13;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v13 != v7)
          objc_enumerationMutation(v3);
        v9 = *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * v8);
        if (!v6)
        {
          v6 = objc_alloc_init(VCIDRSchedulerItem);
          -[NSMutableArray addObject:](self->_schedulerItems, "addObject:", v6);

        }
        -[VCIDRSchedulerItem addStream:](v6, "addStream:", v9);
        if (-[NSArray count](-[VCIDRSchedulerItem streams](v6, "streams"), "count") == self->_basePeriodCount)
          v6 = 0;
        ++v8;
      }
      while (v5 != v8);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v12, v11, 16);
    }
    while (v5);
  }
  return self->_schedulerItems;
}

- (void)computeStreamsIDRPosition
{
  int v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  NSObject *v7;
  NSObject *v8;
  unsigned int v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  int v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  NSObject *v17;
  NSObject *v18;
  NSMutableArray *obj;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  int v23;
  id v24;
  _BYTE v25[128];
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  uint8_t buf[4];
  uint64_t v31;
  __int16 v32;
  const char *v33;
  __int16 v34;
  int v35;
  __int16 v36;
  void *v37;
  _BYTE v38[128];
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  uint64_t v43;

  v43 = *MEMORY[0x1E0C80C00];
  v39 = 0u;
  v40 = 0u;
  v41 = 0u;
  v42 = 0u;
  obj = self->_schedulerItems;
  v21 = -[NSMutableArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v39, v38, 16);
  if (v21)
  {
    v20 = *(_QWORD *)v40;
    v3 = 1;
    do
    {
      v4 = 0;
      do
      {
        if (*(_QWORD *)v40 != v20)
          objc_enumerationMutation(obj);
        v5 = *(void **)(*((_QWORD *)&v39 + 1) + 8 * v4);
        if ((int)VRTraceGetErrorLogLevelForModule() >= 8)
        {
          v6 = VRTraceErrorLogLevelToCSTR();
          v7 = *MEMORY[0x1E0CF2758];
          v8 = *MEMORY[0x1E0CF2758];
          if (*MEMORY[0x1E0CF2748])
          {
            if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 136315906;
              v31 = v6;
              v32 = 2080;
              v33 = "-[VCIDRSchedulerPeriodGroup computeStreamsIDRPosition]";
              v34 = 1024;
              v35 = 62;
              v36 = 2112;
              v37 = v5;
              _os_log_impl(&dword_1D8A54000, v7, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Assign IDR slot for streams in item: %@", buf, 0x26u);
            }
          }
          else if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 136315906;
            v31 = v6;
            v32 = 2080;
            v33 = "-[VCIDRSchedulerPeriodGroup computeStreamsIDRPosition]";
            v34 = 1024;
            v35 = 62;
            v36 = 2112;
            v37 = v5;
            _os_log_debug_impl(&dword_1D8A54000, v7, OS_LOG_TYPE_DEBUG, " [%s] %s:%d Assign IDR slot for streams in item: %@", buf, 0x26u);
          }
        }
        v23 = v3;
        v22 = v4;
        if ((v3 & 1) != 0)
          v9 = 0;
        else
          v9 = self->_basePeriodCount - 1;
        v28 = 0u;
        v29 = 0u;
        v26 = 0u;
        v27 = 0u;
        v24 = (id)objc_msgSend(v5, "streams");
        v10 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v26, v25, 16);
        if (v10)
        {
          v11 = v10;
          v12 = *(_QWORD *)v27;
          if ((v3 & 1) != 0)
            v13 = 1;
          else
            v13 = -1;
          do
          {
            v14 = 0;
            do
            {
              if (*(_QWORD *)v27 != v12)
                objc_enumerationMutation(v24);
              v15 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * v14);
              objc_msgSend(v15, "setFramePosition:", objc_msgSend(v5, "framePosition") + self->_framesPerBasePeriod * v9);
              objc_msgSend(v15, "setFramesPerIdrPeriod:", self->_basePeriodCount * self->_framesPerBasePeriod);
              if ((int)VRTraceGetErrorLogLevelForModule() >= 8)
              {
                v16 = VRTraceErrorLogLevelToCSTR();
                v17 = *MEMORY[0x1E0CF2758];
                v18 = *MEMORY[0x1E0CF2758];
                if (*MEMORY[0x1E0CF2748])
                {
                  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
                  {
                    *(_DWORD *)buf = 136315906;
                    v31 = v16;
                    v32 = 2080;
                    v33 = "-[VCIDRSchedulerPeriodGroup computeStreamsIDRPosition]";
                    v34 = 1024;
                    v35 = 67;
                    v36 = 2112;
                    v37 = v15;
                    _os_log_impl(&dword_1D8A54000, v17, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Setting position and period: %@", buf, 0x26u);
                  }
                }
                else if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
                {
                  *(_DWORD *)buf = 136315906;
                  v31 = v16;
                  v32 = 2080;
                  v33 = "-[VCIDRSchedulerPeriodGroup computeStreamsIDRPosition]";
                  v34 = 1024;
                  v35 = 67;
                  v36 = 2112;
                  v37 = v15;
                  _os_log_debug_impl(&dword_1D8A54000, v17, OS_LOG_TYPE_DEBUG, " [%s] %s:%d Setting position and period: %@", buf, 0x26u);
                }
              }
              v9 += v13;
              ++v14;
            }
            while (v11 != v14);
            v11 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v26, v25, 16);
          }
          while (v11);
        }
        v3 = v23 ^ 1;
        v4 = v22 + 1;
      }
      while (v22 + 1 != v21);
      v21 = -[NSMutableArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v39, v38, 16);
    }
    while (v21);
  }
}

- (id)description
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("IDR Period Group: BasePeriodCount=%d frames:%d streams:%@"), self->_basePeriodCount, self->_framesPerBasePeriod * self->_basePeriodCount, self->_streams);
}

- (unsigned)basePeriodCount
{
  return self->_basePeriodCount;
}

@end
