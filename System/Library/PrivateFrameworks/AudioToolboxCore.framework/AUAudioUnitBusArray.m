@implementation AUAudioUnitBusArray

- (AUAudioUnitBusArray)init
{
  void *v3;
  void *v4;

  v3 = (void *)MEMORY[0x1E0C99DA0];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[AUAudioUnitBusArray init]");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "raise:format:", *MEMORY[0x1E0C99778], CFSTR("Don't call %@."), v4);

  return 0;
}

- (AUAudioUnitBusArray)initWithAudioUnit:(AUAudioUnit *)owner busType:(AUAudioUnitBusType)busType busses:(NSArray *)busArray
{
  AUAudioUnit *v8;
  NSArray *v9;
  AUAudioUnitBusArray *v10;
  AUAudioUnitBusArray *v11;
  uint64_t v12;
  NSMutableArray *busses;
  objc_super v15;

  v8 = owner;
  v9 = busArray;
  v15.receiver = self;
  v15.super_class = (Class)AUAudioUnitBusArray;
  v10 = -[AUAudioUnitBusArray init](&v15, sel_init);
  v11 = v10;
  if (v10)
  {
    v10->_ownerAudioUnit = v8;
    v10->_busType = busType;
    if (v9)
    {
      v12 = -[NSArray mutableCopy](v9, "mutableCopy");
      busses = v11->_busses;
      v11->_busses = (NSMutableArray *)v12;
    }
    else
    {
      busses = v10->_busses;
      v10->_busses = 0;
    }

    -[AUAudioUnitBusArray indexBusses](v11, "indexBusses");
  }

  return v11;
}

- (AUAudioUnitBusArray)initWithAudioUnit:(AUAudioUnit *)owner busType:(AUAudioUnitBusType)busType
{
  return -[AUAudioUnitBusArray initWithAudioUnit:busType:busses:](self, "initWithAudioUnit:busType:busses:", owner, busType, MEMORY[0x1E0C9AA60]);
}

- (void)dealloc
{
  NSMutableArray *busses;
  objc_super v4;

  busses = self->_busses;
  self->_busses = 0;

  v4.receiver = self;
  v4.super_class = (Class)AUAudioUnitBusArray;
  -[AUAudioUnitBusArray dealloc](&v4, sel_dealloc);
}

- (NSUInteger)count
{
  return -[NSMutableArray count](self->_busses, "count");
}

- (AUAudioUnitBus)objectAtIndexedSubscript:(NSUInteger)index
{
  return (AUAudioUnitBus *)-[NSMutableArray objectAtIndexedSubscript:](self->_busses, "objectAtIndexedSubscript:", index);
}

- (unint64_t)countByEnumeratingWithState:(id *)a3 objects:(id *)a4 count:(unint64_t)a5
{
  return -[NSMutableArray countByEnumeratingWithState:objects:count:](self->_busses, "countByEnumeratingWithState:objects:count:", a3, a4, a5);
}

- (BOOL)setBusCount:(NSUInteger)count error:(NSError *)outError
{
  return 0;
}

- (void)addObserverToAllBusses:(NSObject *)observer forKeyPath:(NSString *)keyPath options:(NSKeyValueObservingOptions)options context:(void *)context
{
  NSString *v10;
  NSString *v11;
  BusPropertyObserver *end;
  BusPropertyObserver *v13;
  NSMutableArray *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  id location;
  NSString *v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v10 = keyPath;
  objc_initWeak(&location, observer);
  v11 = v10;
  v23 = v11;
  *(_QWORD *)&v24 = options;
  *((_QWORD *)&v24 + 1) = context;
  end = self->_observers.__end_;
  if (end >= self->_observers.__end_cap_.__value_)
  {
    v13 = (BusPropertyObserver *)std::vector<BusPropertyObserver>::__push_back_slow_path<BusPropertyObserver const&>((unint64_t *)&self->_observers, (uint64_t)&location);
  }
  else
  {
    objc_copyWeak((id *)self->_observers.__end_, &location);
    *((_QWORD *)end + 1) = v23;
    *((_OWORD *)end + 1) = v24;
    v13 = (BusPropertyObserver *)((char *)end + 32);
  }
  self->_observers.__end_ = v13;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v14 = self->_busses;
  v15 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v14, "countByEnumeratingWithState:objects:count:", &v18, v25, 16);
  if (v15)
  {
    v16 = *(_QWORD *)v19;
    do
    {
      v17 = 0;
      do
      {
        if (*(_QWORD *)v19 != v16)
          objc_enumerationMutation(v14);
        BusPropertyObserver::add((BusPropertyObserver *)&location, *(AUAudioUnitBus **)(*((_QWORD *)&v18 + 1) + 8 * v17++));
      }
      while (v15 != v17);
      v15 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v14, "countByEnumeratingWithState:objects:count:", &v18, v25, 16);
    }
    while (v15);
  }

  objc_destroyWeak(&location);
}

- (void)removeObserverFromAllBusses:(NSObject *)observer forKeyPath:(NSString *)keyPath context:(void *)context
{
  NSObject *v8;
  NSString *v9;
  BusPropertyObserver *i;
  BusPropertyObserver *begin;
  NSObject *WeakRetained;
  void *v13;
  NSMutableArray *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  id *v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v8 = observer;
  v9 = keyPath;
  begin = self->_observers.__begin_;
  for (i = self->_observers.__end_; begin != i; i = self->_observers.__end_)
  {
    WeakRetained = objc_loadWeakRetained((id *)begin);
    if (WeakRetained == v8 && objc_msgSend(*((id *)begin + 1), "isEqualToString:", v9))
    {
      v13 = (void *)*((_QWORD *)begin + 3);

      if (v13 == context)
      {
        v22 = 0u;
        v23 = 0u;
        v20 = 0u;
        v21 = 0u;
        v14 = self->_busses;
        v15 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v14, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
        v16 = v15;
        if (v15)
        {
          v17 = *(_QWORD *)v21;
          do
          {
            v18 = 0;
            do
            {
              if (*(_QWORD *)v21 != v17)
                objc_enumerationMutation(v14);
              BusPropertyObserver::remove(begin, *(AUAudioUnitBus **)(*((_QWORD *)&v20 + 1) + 8 * v18++));
            }
            while (v16 != v18);
            v16 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v14, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
          }
          while (v16);
        }

        v19 = (id *)std::__move_loop<std::_ClassicAlgPolicy>::operator()[abi:ne180100]<BusPropertyObserver *,BusPropertyObserver *,BusPropertyObserver *>((id *)begin + 4, (id *)self->_observers.__end_, (uint64_t)begin);
        std::vector<BusPropertyObserver>::__base_destruct_at_end[abi:ne180100]((uint64_t)&self->_observers, v19);
        break;
      }
    }
    else
    {

    }
    begin = (BusPropertyObserver *)((char *)begin + 32);
  }

}

- (void)indexBusses
{
  NSMutableArray *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v3 = self->_busses;
  v4 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v4)
  {
    v5 = 0;
    v6 = *(_QWORD *)v10;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v10 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v9 + 1) + 8 * i);
        objc_msgSend(v8, "setIndex:", v5 + i, (_QWORD)v9);
        objc_msgSend(v8, "setBusType:", self->_busType);
        objc_msgSend(v8, "setOwnerAudioUnit:", self->_ownerAudioUnit);
      }
      v4 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
      v5 += i;
    }
    while (v4);
  }

}

- (void)replaceBusses:(NSArray *)busArray
{
  NSArray *v4;
  NSUInteger v5;
  uint64_t v6;
  __CFString *v7;
  BusPropertyObserver *begin;
  BusPropertyObserver *end;
  NSMutableArray *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  NSMutableArray *v14;
  NSMutableArray *busses;
  BusPropertyObserver *v16;
  BusPropertyObserver *v17;
  NSMutableArray *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  __CFString *v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _BYTE v31[128];
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v4 = busArray;
  v5 = -[AUAudioUnitBusArray count](self, "count");
  v6 = -[NSArray count](v4, "count");
  if (self->_busType == 1)
    v7 = CFSTR("inputBusses");
  else
    v7 = CFSTR("outputBusses");
  v22 = v7;
  if (v5 != v6)
    -[AUAudioUnit willChangeValueForKey:](self->_ownerAudioUnit, "willChangeValueForKey:", v22);
  begin = self->_observers.__begin_;
  end = self->_observers.__end_;
  while (begin != end)
  {
    v29 = 0u;
    v30 = 0u;
    v27 = 0u;
    v28 = 0u;
    v10 = self->_busses;
    v11 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v27, v32, 16);
    if (v11)
    {
      v12 = *(_QWORD *)v28;
      do
      {
        v13 = 0;
        do
        {
          if (*(_QWORD *)v28 != v12)
            objc_enumerationMutation(v10);
          BusPropertyObserver::remove(begin, *(AUAudioUnitBus **)(*((_QWORD *)&v27 + 1) + 8 * v13++));
        }
        while (v11 != v13);
        v11 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v27, v32, 16);
      }
      while (v11);
    }

    begin = (BusPropertyObserver *)((char *)begin + 32);
  }
  v14 = (NSMutableArray *)-[NSArray mutableCopy](v4, "mutableCopy");
  busses = self->_busses;
  self->_busses = v14;

  v16 = self->_observers.__begin_;
  v17 = self->_observers.__end_;
  while (v16 != v17)
  {
    v25 = 0u;
    v26 = 0u;
    v23 = 0u;
    v24 = 0u;
    v18 = self->_busses;
    v19 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v18, "countByEnumeratingWithState:objects:count:", &v23, v31, 16);
    if (v19)
    {
      v20 = *(_QWORD *)v24;
      do
      {
        v21 = 0;
        do
        {
          if (*(_QWORD *)v24 != v20)
            objc_enumerationMutation(v18);
          BusPropertyObserver::add(v16, *(AUAudioUnitBus **)(*((_QWORD *)&v23 + 1) + 8 * v21++));
        }
        while (v19 != v21);
        v19 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v18, "countByEnumeratingWithState:objects:count:", &v23, v31, 16);
      }
      while (v19);
    }

    v16 = (BusPropertyObserver *)((char *)v16 + 32);
  }
  -[AUAudioUnitBusArray indexBusses](self, "indexBusses");
  if (v5 != v6)
    -[AUAudioUnit didChangeValueForKey:](self->_ownerAudioUnit, "didChangeValueForKey:", v22);

}

- (BOOL)isCountChangeable
{
  return self->_countChangeable;
}

- (AUAudioUnit)ownerAudioUnit
{
  return self->_ownerAudioUnit;
}

- (AUAudioUnitBusType)busType
{
  return self->_busType;
}

- (vector<BusPropertyObserver,)observers
{
  retstr->__begin_ = 0;
  retstr->__end_ = 0;
  retstr->__end_cap_.__value_ = 0;
  return (vector<BusPropertyObserver, std::allocator<BusPropertyObserver>> *)std::vector<BusPropertyObserver>::__init_with_size[abi:ne180100]<BusPropertyObserver*,BusPropertyObserver*>((id *)&retstr->__begin_, (id *)self->_observers.__begin_, (id *)self->_observers.__end_, (self->_observers.__end_- self->_observers.__begin_) >> 5);
}

- (void)setObservers:()vector<BusPropertyObserver
{
  vector<BusPropertyObserver, std::allocator<BusPropertyObserver>> *p_observers;

  p_observers = &self->_observers;
  if (p_observers != a3)
    std::vector<BusPropertyObserver>::__assign_with_size[abi:ne180100]<BusPropertyObserver*,BusPropertyObserver*>((uint64_t)p_observers, (id *)a3->__begin_, (id *)a3->__end_, (a3->__end_ - a3->__begin_) >> 5);
}

- (void).cxx_destruct
{
  vector<BusPropertyObserver, std::allocator<BusPropertyObserver>> *p_observers;

  p_observers = &self->_observers;
  std::vector<BusPropertyObserver>::__destroy_vector::operator()[abi:ne180100]((void ***)&p_observers);
  objc_storeStrong((id *)&self->_busses, 0);
}

- (id).cxx_construct
{
  *((_QWORD *)self + 5) = 0;
  *((_QWORD *)self + 6) = 0;
  *((_QWORD *)self + 7) = 0;
  return self;
}

@end
