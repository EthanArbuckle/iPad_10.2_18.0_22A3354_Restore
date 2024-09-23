@implementation HMIVideoEventBuffer

- (HMIVideoEventBuffer)initWithMaxCapacity:(int64_t)a3
{
  HMIVideoEventBuffer *v4;
  uint64_t v5;
  NSMutableArray *data;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)HMIVideoEventBuffer;
  v4 = -[HMIVideoEventBuffer init](&v8, sel_init);
  if (v4)
  {
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v5 = objc_claimAutoreleasedReturnValue();
    data = v4->_data;
    v4->_data = (NSMutableArray *)v5;

    v4->_lock._os_unfair_lock_opaque = 0;
    v4->_maxCapacity = a3;
  }
  return v4;
}

- (void)removeAllObjects
{
  os_unfair_lock_s *p_lock;

  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  -[NSMutableArray removeAllObjects](self->_data, "removeAllObjects");
  os_unfair_lock_unlock(p_lock);
}

- (void)addObject:(id)a3
{
  uint64_t v4;
  NSMutableArray *data;
  id v6;

  v6 = a3;
  os_unfair_lock_lock_with_options();
  if ((unint64_t)-[NSMutableArray count](self->_data, "count") >= self->_maxCapacity)
    -[NSMutableArray hmf_removeFirstObject](self->_data, "hmf_removeFirstObject");
  v4 = -[NSMutableArray indexOfObject:inSortedRange:options:usingComparator:](self->_data, "indexOfObject:inSortedRange:options:usingComparator:", v6, 0, -[NSMutableArray count](self->_data, "count"), 1024, &__block_literal_global_126);
  data = self->_data;
  if (v4 == 0x7FFFFFFFFFFFFFFFLL)
    -[NSMutableArray addObject:](data, "addObject:", v6);
  else
    -[NSMutableArray insertObject:atIndex:](data, "insertObject:atIndex:", v6);
  os_unfair_lock_unlock(&self->_lock);

}

uint64_t __33__HMIVideoEventBuffer_addObject___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  void *v6;
  uint64_t v7;
  CMTime v9;
  CMTime time1;

  v4 = a2;
  v5 = a3;
  v6 = v5;
  if (!v4)
  {
    memset(&time1, 0, sizeof(time1));
    if (v5)
      goto LABEL_3;
LABEL_5:
    memset(&v9, 0, sizeof(v9));
    goto LABEL_6;
  }
  objc_msgSend(v4, "time");
  if (!v6)
    goto LABEL_5;
LABEL_3:
  objc_msgSend(v6, "time");
LABEL_6:
  v7 = CMTimeCompare(&time1, &v9);

  return v7;
}

- (id)objectsInTimeRange:(id *)a3 includeEnd:(BOOL)a4
{
  os_unfair_lock_s *p_lock;
  NSMutableArray *data;
  __int128 v9;
  void *v10;
  _QWORD v12[4];
  __int128 v13;
  __int128 v14;
  __int128 v15;
  BOOL v16;

  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  data = self->_data;
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __53__HMIVideoEventBuffer_objectsInTimeRange_includeEnd___block_invoke;
  v12[3] = &__block_descriptor_81_e32_B32__0___HMIVideoEvent__8Q16_B24l;
  v16 = a4;
  v9 = *(_OWORD *)&a3->var0.var3;
  v13 = *(_OWORD *)&a3->var0.var0;
  v14 = v9;
  v15 = *(_OWORD *)&a3->var1.var1;
  -[NSMutableArray hmf_objectsPassingTest:](data, "hmf_objectsPassingTest:", v12);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  os_unfair_lock_unlock(p_lock);
  return v10;
}

BOOL __53__HMIVideoEventBuffer_objectsInTimeRange_includeEnd___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  __int128 v4;
  _OWORD *v5;
  __int128 v6;
  _BOOL8 v7;
  CMTime v9;
  CMTime time2;
  CMTimeRange range;
  CMTime time1;

  v3 = a2;
  if (!*(_BYTE *)(a1 + 80))
    goto LABEL_6;
  v4 = *(_OWORD *)(a1 + 48);
  *(_OWORD *)&range.start.value = *(_OWORD *)(a1 + 32);
  *(_OWORD *)&range.start.epoch = v4;
  *(_OWORD *)&range.duration.timescale = *(_OWORD *)(a1 + 64);
  CMTimeRangeGetEnd(&time1, &range);
  if (v3)
    objc_msgSend(v3, "time");
  else
    memset(&time2, 0, sizeof(time2));
  if (!CMTimeCompare(&time1, &time2))
  {
    v7 = 1;
  }
  else
  {
LABEL_6:
    v5 = (_OWORD *)(a1 + 32);
    if (v3)
      objc_msgSend(v3, "time");
    else
      memset(&v9, 0, sizeof(v9));
    v6 = v5[1];
    *(_OWORD *)&range.start.value = *v5;
    *(_OWORD *)&range.start.epoch = v6;
    *(_OWORD *)&range.duration.timescale = v5[2];
    v7 = CMTimeRangeContainsTime(&range, &v9) != 0;
  }

  return v7;
}

- (id)extractObjectsInTimeRange:(id *)a3
{
  os_unfair_lock_s *p_lock;
  NSMutableArray *data;
  __int128 v7;
  void *v8;
  void *v9;
  _QWORD v11[4];
  __int128 v12;
  __int128 v13;
  __int128 v14;

  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  data = self->_data;
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __49__HMIVideoEventBuffer_extractObjectsInTimeRange___block_invoke;
  v11[3] = &__block_descriptor_80_e32_B32__0___HMIVideoEvent__8Q16_B24l;
  v7 = *(_OWORD *)&a3->var0.var3;
  v12 = *(_OWORD *)&a3->var0.var0;
  v13 = v7;
  v14 = *(_OWORD *)&a3->var1.var1;
  -[NSMutableArray indexesOfObjectsPassingTest:](data, "indexesOfObjectsPassingTest:", v11);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableArray objectsAtIndexes:](self->_data, "objectsAtIndexes:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableArray removeObjectsAtIndexes:](self->_data, "removeObjectsAtIndexes:", v8);

  os_unfair_lock_unlock(p_lock);
  return v9;
}

BOOL __49__HMIVideoEventBuffer_extractObjectsInTimeRange___block_invoke(_OWORD *a1, void *a2)
{
  __int128 v3;
  CMTimeRange v5;
  CMTime time;

  if (a2)
    objc_msgSend(a2, "time");
  else
    memset(&time, 0, sizeof(time));
  v3 = a1[3];
  *(_OWORD *)&v5.start.value = a1[2];
  *(_OWORD *)&v5.start.epoch = v3;
  *(_OWORD *)&v5.duration.timescale = a1[4];
  return CMTimeRangeContainsTime(&v5, &time) != 0;
}

- (id)neighborsOfObject:(id)a3
{
  id v4;
  os_unfair_lock_s *p_lock;
  unint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v11;
  _QWORD v12[3];

  v12[2] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  v6 = -[NSMutableArray indexOfObject:inSortedRange:options:usingComparator:](self->_data, "indexOfObject:inSortedRange:options:usingComparator:", v4, 0, -[NSMutableArray count](self->_data, "count"), 1024, &__block_literal_global_130);
  if (v6 && v6 < -[NSMutableArray count](self->_data, "count"))
  {
    -[NSMutableArray objectAtIndex:](self->_data, "objectAtIndex:", v6 - 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v12[0] = v7;
    -[NSMutableArray objectAtIndex:](self->_data, "objectAtIndex:", v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v12[1] = v8;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v12, 2);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    if (v6 >= -[NSMutableArray count](self->_data, "count"))
    {
      v9 = (void *)MEMORY[0x24BDBD1A8];
      goto LABEL_8;
    }
    -[NSMutableArray objectAtIndex:](self->_data, "objectAtIndex:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v7;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v11, 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }

LABEL_8:
  os_unfair_lock_unlock(p_lock);

  return v9;
}

uint64_t __41__HMIVideoEventBuffer_neighborsOfObject___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  void *v6;
  uint64_t v7;
  CMTime v9;
  CMTime time1;

  v4 = a2;
  v5 = a3;
  v6 = v5;
  if (!v4)
  {
    memset(&time1, 0, sizeof(time1));
    if (v5)
      goto LABEL_3;
LABEL_5:
    memset(&v9, 0, sizeof(v9));
    goto LABEL_6;
  }
  objc_msgSend(v4, "time");
  if (!v6)
    goto LABEL_5;
LABEL_3:
  objc_msgSend(v6, "time");
LABEL_6:
  v7 = CMTimeCompare(&time1, &v9);

  return v7;
}

- (unint64_t)count
{
  return -[NSMutableArray count](self->_data, "count");
}

- (id)firstObject
{
  return (id)-[NSMutableArray firstObject](self->_data, "firstObject");
}

- (id)description
{
  void *v2;
  void *v3;

  -[NSMutableArray na_map:](self->_data, "na_map:", &__block_literal_global_133);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "componentsJoinedByString:", CFSTR(", "));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

id __34__HMIVideoEventBuffer_description__block_invoke(uint64_t a1, void *a2)
{
  CMTime v3;

  if (a2)
    objc_msgSend(a2, "time");
  else
    memset(&v3, 0, sizeof(v3));
  HMICMTimeDescription(&v3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_data, 0);
}

@end
