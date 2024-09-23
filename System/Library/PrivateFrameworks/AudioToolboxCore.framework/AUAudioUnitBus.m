@implementation AUAudioUnitBus

- (AUAudioUnitBus)initWithFormat:(AVAudioFormat *)format error:(NSError *)outError
{
  AVAudioFormat *v6;
  AUAudioUnitBus *v7;
  AUAudioUnitBus *v8;
  AUAudioUnitBus *v9;
  objc_super v11;

  v6 = format;
  v11.receiver = self;
  v11.super_class = (Class)AUAudioUnitBus;
  v7 = -[AUAudioUnitBus init](&v11, sel_init);
  v8 = v7;
  if (v7
    && (v7->_maximumChannelCount = -1,
        v7->_shouldAllocateBuffer = 1,
        -[AUAudioUnitBus setFormat:error:](v7, "setFormat:error:", v6, outError)))
  {
    v9 = v8;
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (void)dealloc
{
  BusPropertyObserver *begin;
  BusPropertyObserver *end;
  NSString *name;
  AVAudioFormat *format;
  NSArray *supportedChannelLayoutTags;
  NSArray *supportedChannelCounts;
  objc_super v9;

  begin = self->_observers.__begin_;
  end = self->_observers.__end_;
  while (begin != end)
  {
    BusPropertyObserver::remove(begin, self);
    begin = (BusPropertyObserver *)((char *)begin + 32);
  }
  name = self->_name;
  self->_name = 0;

  format = self->_format;
  self->_format = 0;

  supportedChannelLayoutTags = self->_supportedChannelLayoutTags;
  self->_supportedChannelLayoutTags = 0;

  supportedChannelCounts = self->_supportedChannelCounts;
  self->_supportedChannelCounts = 0;

  v9.receiver = self;
  v9.super_class = (Class)AUAudioUnitBus;
  -[AUAudioUnitBus dealloc](&v9, sel_dealloc);
}

- (void)setIndex:(unint64_t)a3
{
  self->_index = a3;
}

- (void)setBusType:(int64_t)a3
{
  self->_busType = a3;
}

- (void)setOwnerAudioUnit:(id)a3
{
  self->_ownerAudioUnit = (AUAudioUnit *)a3;
}

- (void)setSupportedChannelCounts:(NSArray *)supportedChannelCounts
{
  NSArray *v5;
  NSArray *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  unsigned int v11;
  AVAudioFormat *format;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v5 = supportedChannelCounts;
  if (self->_supportedChannelCounts != v5)
  {
    -[AUAudioUnitBus willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("supportedChannelCounts"));
    objc_storeStrong((id *)&self->_supportedChannelCounts, supportedChannelCounts);

    -[AUAudioUnitBus didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("supportedChannelCounts"));
    v15 = 0u;
    v16 = 0u;
    v13 = 0u;
    v14 = 0u;
    v6 = self->_supportedChannelCounts;
    v7 = 0;
    v8 = -[NSArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    if (v8)
    {
      v9 = *(_QWORD *)v14;
      do
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v14 != v9)
            objc_enumerationMutation(v6);
          v11 = objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * i), "unsignedIntegerValue", (_QWORD)v13);
          if (v7 <= v11)
            v7 = v11;
          else
            v7 = v7;
        }
        v8 = -[NSArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      }
      while (v8);
    }

    -[AUAudioUnitBus setMaximumChannelCount:](self, "setMaximumChannelCount:", v7);
    if (!-[AUAudioUnitBus setFormat:error:](self, "setFormat:error:", self->_format, 0))
    {
      format = self->_format;
      self->_format = 0;

    }
  }

}

- (NSArray)supportedChannelCounts
{
  return self->_supportedChannelCounts;
}

- (AUAudioChannelCount)maximumChannelCount
{
  return self->_maximumChannelCount;
}

- (void)setMaximumChannelCount:(AUAudioChannelCount)maximumChannelCount
{
  if (self->_maximumChannelCount != maximumChannelCount)
  {
    -[AUAudioUnitBus willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("maximumChannelCount"));
    self->_maximumChannelCount = maximumChannelCount;
    -[AUAudioUnitBus didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("maximumChannelCount"));
  }
}

- (BOOL)setFormat:(AVAudioFormat *)format error:(NSError *)outError
{
  AVAudioFormat *v7;
  NSError *v8;
  NSArray *supportedChannelCounts;
  NSArray *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  uint64_t v15;
  NSError *v16;
  AUAudioUnit *ownerAudioUnit;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v7 = format;
  if (-[AVAudioFormat commonFormat](v7, "commonFormat") == AVAudioPCMFormatFloat32
    && (!-[AVAudioFormat isInterleaved](v7, "isInterleaved") || -[AVAudioFormat channelCount](v7, "channelCount") <= 1)
    && -[AVAudioFormat channelCount](v7, "channelCount")
    && (!self->_maximumChannelCount || -[AVAudioFormat channelCount](v7, "channelCount") <= self->_maximumChannelCount))
  {
    supportedChannelCounts = self->_supportedChannelCounts;
    if (supportedChannelCounts)
    {
      v20 = 0u;
      v21 = 0u;
      v18 = 0u;
      v19 = 0u;
      v11 = supportedChannelCounts;
      v12 = -[NSArray countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
      if (v12)
      {
        v13 = *(_QWORD *)v19;
        while (2)
        {
          for (i = 0; i != v12; ++i)
          {
            if (*(_QWORD *)v19 != v13)
              objc_enumerationMutation(v11);
            v15 = objc_msgSend(*(id *)(*((_QWORD *)&v18 + 1) + 8 * i), "unsignedIntegerValue", (_QWORD)v18);
            if (v15 == -[AVAudioFormat channelCount](v7, "channelCount"))
            {

              goto LABEL_23;
            }
          }
          v12 = -[NSArray countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
          if (v12)
            continue;
          break;
        }
      }

      if (!outError)
        goto LABEL_10;
LABEL_21:
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2F90], -10868, 0);
      v16 = (NSError *)objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      *outError = v16;

      goto LABEL_9;
    }
LABEL_23:
    if (self->_format != v7)
    {
      ownerAudioUnit = self->_ownerAudioUnit;
      if (ownerAudioUnit
        && !-[AUAudioUnit shouldChangeToFormat:forBus:](ownerAudioUnit, "shouldChangeToFormat:forBus:", v7, self))
      {
        if (!outError)
          goto LABEL_10;
        goto LABEL_21;
      }
      -[AUAudioUnitBus willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("format"));
      objc_storeStrong((id *)&self->_format, format);
      -[AUAudioUnitBus didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("format"));
    }
    LOBYTE(outError) = 1;
    goto LABEL_10;
  }
  if (outError)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2F90], -10868, 0);
    v8 = (NSError *)objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    *outError = v8;

LABEL_9:
    LOBYTE(outError) = 0;
  }
LABEL_10:

  return (char)outError;
}

- (BOOL)isEnabled
{
  return self->_enabled;
}

- (void)setEnabled:(BOOL)enabled
{
  if (self->_enabled != enabled)
  {
    -[AUAudioUnitBus willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("enabled"));
    self->_enabled = enabled;
    -[AUAudioUnitBus didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("enabled"));
  }
}

- (AVAudioFormat)format
{
  return self->_format;
}

- (void)addObserver:(id)a3 forKeyPath:(id)a4 options:(unint64_t)a5 context:(void *)a6
{
  id v10;
  id v11;
  id v12;
  BusPropertyObserver *end;
  BusPropertyObserver *v14;
  objc_super v15;
  id location;
  id v17;
  __int128 v18;

  v10 = a3;
  v11 = a4;
  objc_initWeak(&location, v10);
  v12 = v11;
  v17 = v12;
  *(_QWORD *)&v18 = a5;
  *((_QWORD *)&v18 + 1) = a6;
  end = self->_observers.__end_;
  if (end >= self->_observers.__end_cap_.__value_)
  {
    v14 = (BusPropertyObserver *)std::vector<BusPropertyObserver>::__push_back_slow_path<BusPropertyObserver const&>((unint64_t *)&self->_observers, (uint64_t)&location);
  }
  else
  {
    objc_copyWeak((id *)self->_observers.__end_, &location);
    *((_QWORD *)end + 1) = v17;
    *((_OWORD *)end + 1) = v18;
    v14 = (BusPropertyObserver *)((char *)end + 32);
  }
  self->_observers.__end_ = v14;
  v15.receiver = self;
  v15.super_class = (Class)AUAudioUnitBus;
  -[AUAudioUnitBus addObserver:forKeyPath:options:context:](&v15, sel_addObserver_forKeyPath_options_context_, v10, v12, a5, a6);

  objc_destroyWeak(&location);
}

- (void)removeObserver:(id)a3 forKeyPath:(id)a4
{
  id v6;
  id v7;
  BusPropertyObserver *i;
  BusPropertyObserver *begin;
  id WeakRetained;
  int v11;
  id *v12;
  objc_super v13;
  objc_super v14;

  v6 = a3;
  v7 = a4;
  if (self->_removingObserverWithContext)
  {
    v14.receiver = self;
    v14.super_class = (Class)AUAudioUnitBus;
    -[AUAudioUnitBus removeObserver:forKeyPath:](&v14, sel_removeObserver_forKeyPath_, v6, v7);
  }
  else
  {
    begin = self->_observers.__begin_;
    for (i = self->_observers.__end_; begin != i; i = self->_observers.__end_)
    {
      WeakRetained = objc_loadWeakRetained((id *)begin);
      if (WeakRetained == v6)
      {
        v11 = objc_msgSend(*((id *)begin + 1), "isEqualToString:", v7);

        if (v11)
        {
          v12 = (id *)std::__move_loop<std::_ClassicAlgPolicy>::operator()[abi:ne180100]<BusPropertyObserver *,BusPropertyObserver *,BusPropertyObserver *>((id *)begin + 4, (id *)self->_observers.__end_, (uint64_t)begin);
          std::vector<BusPropertyObserver>::__base_destruct_at_end[abi:ne180100]((uint64_t)&self->_observers, v12);
          v13.receiver = self;
          v13.super_class = (Class)AUAudioUnitBus;
          -[AUAudioUnitBus removeObserver:forKeyPath:](&v13, sel_removeObserver_forKeyPath_, v6, v7);
          break;
        }
      }
      else
      {

      }
      begin = (BusPropertyObserver *)((char *)begin + 32);
    }
  }

}

- (void)removeObserver:(id)a3 forKeyPath:(id)a4 context:(void *)a5
{
  id v8;
  id v9;
  BusPropertyObserver *begin;
  BusPropertyObserver *i;
  id WeakRetained;
  void *v13;
  id *v14;
  objc_super v15;

  v8 = a3;
  v9 = a4;
  begin = self->_observers.__begin_;
  self->_removingObserverWithContext = 1;
  for (i = self->_observers.__end_; begin != i; i = self->_observers.__end_)
  {
    WeakRetained = objc_loadWeakRetained((id *)begin);
    if (WeakRetained == v8 && objc_msgSend(*((id *)begin + 1), "isEqualToString:", v9))
    {
      v13 = (void *)*((_QWORD *)begin + 3);

      if (v13 == a5)
      {
        v14 = (id *)std::__move_loop<std::_ClassicAlgPolicy>::operator()[abi:ne180100]<BusPropertyObserver *,BusPropertyObserver *,BusPropertyObserver *>((id *)begin + 4, (id *)self->_observers.__end_, (uint64_t)begin);
        std::vector<BusPropertyObserver>::__base_destruct_at_end[abi:ne180100]((uint64_t)&self->_observers, v14);
        v15.receiver = self;
        v15.super_class = (Class)AUAudioUnitBus;
        -[AUAudioUnitBus removeObserver:forKeyPath:context:](&v15, sel_removeObserver_forKeyPath_context_, v8, v9, a5);
        break;
      }
    }
    else
    {

    }
    begin = (BusPropertyObserver *)((char *)begin + 32);
  }
  self->_removingObserverWithContext = 0;

}

- (BOOL)shouldAllocateBuffer
{
  return self->_shouldAllocateBuffer;
}

- (void)setShouldAllocateBuffer:(BOOL)shouldAllocateBuffer
{
  self->_shouldAllocateBuffer = shouldAllocateBuffer;
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(NSString *)name
{
  objc_setProperty_nonatomic_copy(self, a2, name, 40);
}

- (NSUInteger)index
{
  return self->_index;
}

- (AUAudioUnitBusType)busType
{
  return self->_busType;
}

- (AUAudioUnit)ownerAudioUnit
{
  return self->_ownerAudioUnit;
}

- (NSArray)supportedChannelLayoutTags
{
  return self->_supportedChannelLayoutTags;
}

- (NSTimeInterval)contextPresentationLatency
{
  return self->_contextPresentationLatency;
}

- (void)setContextPresentationLatency:(NSTimeInterval)contextPresentationLatency
{
  self->_contextPresentationLatency = contextPresentationLatency;
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
  objc_storeStrong((id *)&self->_supportedChannelLayoutTags, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_supportedChannelCounts, 0);
  objc_storeStrong((id *)&self->_format, 0);
}

- (id).cxx_construct
{
  *((_QWORD *)self + 11) = 0;
  *((_QWORD *)self + 12) = 0;
  *((_QWORD *)self + 13) = 0;
  return self;
}

@end
