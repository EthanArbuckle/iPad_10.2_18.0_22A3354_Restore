@implementation BKUIPearlCrossHairsManager

- (BKUIPearlCrossHairsManager)init
{
  BKUIPearlCrossHairsManager *v2;
  NSMutableArray *v3;
  NSMutableArray *springInstances;
  InstanceInfo *begin;
  vector<InstanceInfo, std::allocator<InstanceInfo>> *p_instanceVector;
  int v7;
  uint64_t v13;
  BKUIPearlSpringInstance *v14;
  int v15;
  BKUIPearlSpringInstance *v16;
  double v18;
  objc_super v19;

  v19.receiver = self;
  v19.super_class = (Class)BKUIPearlCrossHairsManager;
  v2 = -[BKUIPearlCrossHairsManager init](&v19, sel_init);
  if (v2)
  {
    v3 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    springInstances = v2->_springInstances;
    v2->_springInstances = v3;

    p_instanceVector = &v2->_instanceVector;
    begin = v2->_instanceVector.__begin_;
    if (begin)
    {
      v2->_instanceVector.__end_ = begin;
      operator delete(begin);
      p_instanceVector->__begin_ = 0;
      v2->_instanceVector.__end_ = 0;
      v2->_instanceVector.__end_cap_.__value_ = 0;
    }
    p_instanceVector->__begin_ = 0;
    v2->_instanceVector.__end_ = 0;
    v2->_instanceVector.__end_cap_.__value_ = 0;
    if (kinstancePerAxisCount >= 1)
    {
      v7 = 0;
      __asm { FMOV            V0.4S, #1.0 }
      v18 = *(double *)&_Q0;
      v13 = MEMORY[0x1E0D02850];
      do
      {
        v14 = -[BKUIPearlSpringInstance initWithInitialRotation:color:]([BKUIPearlSpringInstance alloc], "initWithInitialRotation:color:", 0.0078125, v18);
        -[BKUIPearlSpringInstance setAxisOrientation:](v14, "setAxisOrientation:", 1);
        -[BKUIPearlSpringInstance setParameters:](v14, "setParameters:", *(double *)&kinitialDamping + *(double *)&kdampingOffset * (double)v7, *(double *)(v13 + 8), *(double *)&kinitialResponse + *(double *)&kresponseOffset * (double)v7, *(double *)(v13 + 24));
        -[BKUIPearlCrossHairsManager addInstance:](v2, "addInstance:", v14);

        ++v7;
      }
      while (v7 < kinstancePerAxisCount);
      if (kinstancePerAxisCount >= 1)
      {
        v15 = 0;
        do
        {
          v16 = -[BKUIPearlSpringInstance initWithInitialRotation:color:]([BKUIPearlSpringInstance alloc], "initWithInitialRotation:color:", 0.0078125, v18);
          -[BKUIPearlSpringInstance setAxisOrientation:](v16, "setAxisOrientation:", 2);
          -[BKUIPearlSpringInstance setParameters:](v16, "setParameters:", *(double *)&kinitialDamping + *(double *)&kdampingOffset * (double)v15, *(double *)(v13 + 8), *(double *)&kinitialResponse + *(double *)&kresponseOffset * (double)v15, *(double *)(v13 + 24));
          -[BKUIPearlCrossHairsManager addInstance:](v2, "addInstance:", v16);

          ++v15;
        }
        while (v15 < kinstancePerAxisCount);
      }
    }
  }
  return v2;
}

- (void)setGrayscale:(BOOL)a3
{
  _BOOL8 v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v3 = a3;
  v13 = *MEMORY[0x1E0C80C00];
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  -[BKUIPearlCrossHairsManager springInstances](self, "springInstances", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v5)
  {
    v6 = *(_QWORD *)v9;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v9 != v6)
          objc_enumerationMutation(v4);
        objc_msgSend(*(id *)(*((_QWORD *)&v8 + 1) + 8 * v7++), "setGrayscale:", v3);
      }
      while (v5 != v7);
      v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    }
    while (v5);
  }

}

- (BOOL)grayscale
{
  void *v2;
  void *v3;
  char v4;

  -[BKUIPearlCrossHairsManager springInstances](self, "springInstances");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "firstObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "grayscale");

  return v4;
}

- (void)addInstance:(id)a3
{
  __int128 v4;
  __int128 v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  InstanceInfo *value;
  InstanceInfo *end;
  InstanceInfo *v11;
  InstanceInfo *begin;
  unint64_t v13;
  unint64_t v14;
  unint64_t v15;
  unint64_t v16;
  char *v17;
  char *v18;
  InstanceInfo *v19;
  InstanceInfo *v20;
  InstanceInfo *v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  id v30;

  v30 = a3;
  -[NSMutableArray addObject:](self->_springInstances, "addObject:");
  objc_msgSend(v30, "matrix");
  v26 = v4;
  v27 = v5;
  v28 = v6;
  v29 = v7;
  objc_msgSend(v30, "color");
  v25 = v8;
  value = self->_instanceVector.__end_cap_.__value_;
  end = self->_instanceVector.__end_;
  if (end >= value)
  {
    begin = self->_instanceVector.__begin_;
    v13 = 0xCCCCCCCCCCCCCCCDLL * ((end - begin) >> 4);
    v14 = v13 + 1;
    if (v13 + 1 > 0x333333333333333)
      std::vector<InstanceInfo>::__throw_length_error[abi:ne180100]();
    v15 = 0xCCCCCCCCCCCCCCCDLL * ((value - begin) >> 4);
    if (2 * v15 > v14)
      v14 = 2 * v15;
    if (v15 >= 0x199999999999999)
      v16 = 0x333333333333333;
    else
      v16 = v14;
    if (v16)
      v17 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<InstanceInfo>>((uint64_t)&self->_instanceVector.__end_cap_, v16);
    else
      v17 = 0;
    v18 = &v17[80 * v13];
    v19 = (InstanceInfo *)&v17[80 * v16];
    *(_OWORD *)v18 = v26;
    *((_OWORD *)v18 + 1) = v27;
    *((_OWORD *)v18 + 2) = v28;
    *((_OWORD *)v18 + 3) = v29;
    *((_OWORD *)v18 + 4) = v25;
    v11 = (InstanceInfo *)(v18 + 80);
    v21 = self->_instanceVector.__begin_;
    v20 = self->_instanceVector.__end_;
    if (v20 != v21)
    {
      do
      {
        *((_OWORD *)v18 - 5) = *((_OWORD *)v20 - 5);
        v22 = *((_OWORD *)v20 - 4);
        v23 = *((_OWORD *)v20 - 3);
        v24 = *((_OWORD *)v20 - 1);
        *((_OWORD *)v18 - 2) = *((_OWORD *)v20 - 2);
        *((_OWORD *)v18 - 1) = v24;
        *((_OWORD *)v18 - 4) = v22;
        *((_OWORD *)v18 - 3) = v23;
        v18 -= 80;
        v20 = (InstanceInfo *)((char *)v20 - 80);
      }
      while (v20 != v21);
      v20 = self->_instanceVector.__begin_;
    }
    self->_instanceVector.__begin_ = (InstanceInfo *)v18;
    self->_instanceVector.__end_ = v11;
    self->_instanceVector.__end_cap_.__value_ = v19;
    if (v20)
      operator delete(v20);
  }
  else
  {
    *(_OWORD *)end = v26;
    *((_OWORD *)end + 1) = v27;
    *((_OWORD *)end + 2) = v28;
    *((_OWORD *)end + 3) = v29;
    v11 = (InstanceInfo *)((char *)end + 80);
    *((_OWORD *)end + 4) = v8;
  }
  self->_instanceVector.__end_ = v11;

}

- (void)setTarget:(BKUIPearlCrossHairsManager *)self
{
  __int128 v2;
  NSMutableArray *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v7 = v2;
  v13 = *MEMORY[0x1E0C80C00];
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v3 = self->_springInstances;
  v4 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v4)
  {
    v5 = *(_QWORD *)v9;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v9 != v5)
          objc_enumerationMutation(v3);
        objc_msgSend(*(id *)(*((_QWORD *)&v8 + 1) + 8 * v6++), "setTarget:", *(double *)&v7, v7, (_QWORD)v8);
      }
      while (v4 != v6);
      v4 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    }
    while (v4);
  }

}

- (void)setValue:(BKUIPearlCrossHairsManager *)self
{
  __int128 v2;
  NSMutableArray *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v7 = v2;
  v13 = *MEMORY[0x1E0C80C00];
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v3 = self->_springInstances;
  v4 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v4)
  {
    v5 = *(_QWORD *)v9;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v9 != v5)
          objc_enumerationMutation(v3);
        objc_msgSend(*(id *)(*((_QWORD *)&v8 + 1) + 8 * v6++), "setValue:", *(double *)&v7, v7, (_QWORD)v8);
      }
      while (v4 != v6);
      v4 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    }
    while (v4);
  }

}

- (void)setSpringsStates:(unint64_t)a3
{
  NSMutableArray *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v4 = self->_springInstances;
  v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v5)
  {
    v6 = *(_QWORD *)v9;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v9 != v6)
          objc_enumerationMutation(v4);
        objc_msgSend(*(id *)(*((_QWORD *)&v8 + 1) + 8 * v7++), "setSpringState:", a3, (_QWORD)v8);
      }
      while (v5 != v7);
      v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    }
    while (v5);
  }

}

- (void)update:(double)a3
{
  uint64_t v5;
  unint64_t i;
  void *v7;
  unint64_t v8;
  void *v9;
  void *v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _OWORD *v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;

  v5 = 0;
  for (i = 0; ; ++i)
  {
    -[BKUIPearlCrossHairsManager springInstances](self, "springInstances");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "count");

    if (v8 <= i)
      break;
    -[BKUIPearlCrossHairsManager springInstances](self, "springInstances");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "objectAtIndexedSubscript:", i);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v10, "step:", a3);
    objc_msgSend(v10, "matrix");
    v19 = v12;
    v20 = v11;
    v17 = v14;
    v18 = v13;
    objc_msgSend(v10, "color");
    v15 = (_OWORD *)((char *)self->_instanceVector.__begin_ + v5);
    *v15 = v20;
    v15[1] = v19;
    v15[2] = v18;
    v15[3] = v17;
    v15[4] = v16;

    v5 += 80;
  }
}

- (InstanceInfo)instanceData
{
  return self->_instanceVector.__begin_;
}

- (NSMutableArray)springInstances
{
  return (NSMutableArray *)objc_getProperty(self, a2, 32, 1);
}

- (void).cxx_destruct
{
  InstanceInfo *begin;

  objc_storeStrong((id *)&self->_springInstances, 0);
  begin = self->_instanceVector.__begin_;
  if (begin)
  {
    self->_instanceVector.__end_ = begin;
    operator delete(begin);
  }
}

- (id).cxx_construct
{
  *((_QWORD *)self + 1) = 0;
  *((_QWORD *)self + 2) = 0;
  *((_QWORD *)self + 3) = 0;
  return self;
}

@end
