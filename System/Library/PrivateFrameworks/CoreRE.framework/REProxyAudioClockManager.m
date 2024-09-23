@implementation REProxyAudioClockManager

+ (id)sharedInstance
{
  if (qword_2541234C8 != -1)
    dispatch_once(&qword_2541234C8, &__block_literal_global_3_3);
  return (id)qword_2541234D0;
}

void __42__REProxyAudioClockManager_sharedInstance__block_invoke()
{
  REProxyAudioClockManager *v0;
  void *v1;

  v0 = objc_alloc_init(REProxyAudioClockManager);
  v1 = (void *)qword_2541234D0;
  qword_2541234D0 = (uint64_t)v0;

}

- (REProxyAudioClockManager)init
{
  char *v2;
  NSObject *v3;
  dispatch_queue_t v4;
  void *v5;
  NSObject *v6;
  dispatch_queue_t v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  __int128 v11;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)REProxyAudioClockManager;
  v2 = -[REProxyAudioClockManager init](&v13, sel_init);
  if (v2)
  {
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = dispatch_queue_create("REProxyAudioClockManager audio clock update", v3);
    v5 = (void *)*((_QWORD *)v2 + 9);
    *((_QWORD *)v2 + 9) = v4;

    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = dispatch_queue_create("REProxyAudioClockManager access", v6);
    v8 = (void *)*((_QWORD *)v2 + 11);
    *((_QWORD *)v2 + 11) = v7;

    *((_QWORD *)v2 + 1) = 0x3FF0000000000000;
    v9 = MEMORY[0x24BDC0D88];
    v10 = *(_QWORD *)(MEMORY[0x24BDC0D88] + 16);
    v11 = *MEMORY[0x24BDC0D88];
    *((_OWORD *)v2 + 1) = *MEMORY[0x24BDC0D88];
    *((_QWORD *)v2 + 4) = v10;
    *(_OWORD *)(v2 + 40) = v11;
    *((_QWORD *)v2 + 7) = *(_QWORD *)(v9 + 16);
  }
  return (REProxyAudioClockManager *)v2;
}

- (void)dealloc
{
  NSObject *queue;
  objc_super v4;
  _QWORD block[5];

  queue = self->_queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __35__REProxyAudioClockManager_dealloc__block_invoke;
  block[3] = &unk_24ED2D4C0;
  block[4] = self;
  dispatch_sync(queue, block);
  v4.receiver = self;
  v4.super_class = (Class)REProxyAudioClockManager;
  -[REProxyAudioClockManager dealloc](&v4, sel_dealloc);
}

uint64_t __35__REProxyAudioClockManager_dealloc__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_tearDown");
}

- (void)_setUp
{
  NSObject *audioClockUpdateQueue;
  uint64_t v4;
  OS_dispatch_source *v5;
  OS_dispatch_source *timer;
  NSObject *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void (*v12)(uint64_t);
  void *v13;
  id v14;
  _QWORD block[5];
  id v16;
  id location;

  if (!self->_initialized)
  {
    objc_initWeak(&location, self);
    audioClockUpdateQueue = self->_audioClockUpdateQueue;
    v4 = MEMORY[0x24BDAC760];
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __34__REProxyAudioClockManager__setUp__block_invoke;
    block[3] = &unk_24ED89448;
    objc_copyWeak(&v16, &location);
    block[4] = self;
    dispatch_async(audioClockUpdateQueue, block);
    v5 = (OS_dispatch_source *)dispatch_source_create(MEMORY[0x24BDACA18], 0, 0, (dispatch_queue_t)self->_audioClockUpdateQueue);
    timer = self->_timer;
    self->_timer = v5;

    dispatch_source_set_timer((dispatch_source_t)self->_timer, 0, 0x3B9ACA00uLL, 0xF4240uLL);
    v7 = self->_timer;
    v10 = v4;
    v11 = 3221225472;
    v12 = __34__REProxyAudioClockManager__setUp__block_invoke_8;
    v13 = &unk_24ED89470;
    objc_copyWeak(&v14, &location);
    dispatch_source_set_event_handler(v7, &v10);
    dispatch_resume((dispatch_object_t)self->_timer);
    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter", v10, v11, v12, v13);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "addObserver:selector:name:object:", self, sel_routeChangeOrMediaServicesReset_, *MEMORY[0x24BE0A610], 0);

    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "addObserver:selector:name:object:", self, sel_routeChangeOrMediaServicesReset_, *MEMORY[0x24BE0A618], 0);

    self->_initialized = 1;
    objc_destroyWeak(&v14);
    objc_destroyWeak(&v16);
    objc_destroyWeak(&location);
  }
}

void __34__REProxyAudioClockManager__setUp__block_invoke(uint64_t a1)
{
  id WeakRetained;
  OSStatus v3;
  OSStatus v4;
  NSObject *v5;
  CMClockRef HostTimeClock;
  OpaqueCMClock *v7;
  CMClockRef clockOut;
  uint8_t buf[4];
  OSStatus v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    clockOut = 0;
    v3 = CMAudioClockCreate((CFAllocatorRef)*MEMORY[0x24BDBD240], &clockOut);
    if (v3)
    {
      v4 = v3;
      ManualClockLog();
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 67109120;
        v10 = v4;
        _os_log_error_impl(&dword_224FE9000, v5, OS_LOG_TYPE_ERROR, "Failed to create audio clock: %d. Falling back to host clock.", buf, 8u);
      }

      HostTimeClock = CMClockGetHostTimeClock();
      v7 = (OpaqueCMClock *)CFRetain(HostTimeClock);
      clockOut = v7;
    }
    else
    {
      v7 = clockOut;
    }
    objc_msgSend(*(id *)(a1 + 32), "_setAudioClock:", v7);
    CFRelease(clockOut);
  }

}

void __34__REProxyAudioClockManager__setUp__block_invoke_8(uint64_t a1)
{
  id WeakRetained;
  id v2;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = WeakRetained;
    objc_msgSend(WeakRetained, "_updateClocks");
    WeakRetained = v2;
  }

}

- (void)_tearDown
{
  NSObject *timer;
  OS_dispatch_source *v4;
  NSObject *audioClockUpdateQueue;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void (*v10)(uint64_t);
  void *v11;
  id v12;
  id location;

  if (self->_initialized)
  {
    timer = self->_timer;
    if (timer)
    {
      dispatch_source_cancel(timer);
      v4 = self->_timer;
      self->_timer = 0;

    }
    objc_initWeak(&location, self);
    audioClockUpdateQueue = self->_audioClockUpdateQueue;
    v8 = MEMORY[0x24BDAC760];
    v9 = 3221225472;
    v10 = __37__REProxyAudioClockManager__tearDown__block_invoke;
    v11 = &unk_24ED89470;
    objc_copyWeak(&v12, &location);
    dispatch_async(audioClockUpdateQueue, &v8);
    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter", v8, v9, v10, v11);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "removeObserver:name:object:", self, *MEMORY[0x24BE0A610], 0);

    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "removeObserver:name:object:", self, *MEMORY[0x24BE0A618], 0);

    self->_initialized = 0;
    objc_destroyWeak(&v12);
    objc_destroyWeak(&location);
  }
}

void __37__REProxyAudioClockManager__tearDown__block_invoke(uint64_t a1)
{
  id WeakRetained;
  id v2;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = WeakRetained;
    objc_msgSend(WeakRetained, "_setAudioClock:", 0);
    WeakRetained = v2;
  }

}

- (void)_routeChangeOrMediaServicesReset:(id)a3
{
  if (self->_initialized)
  {
    -[REProxyAudioClockManager _tearDown](self, "_tearDown", a3);
    -[REProxyAudioClockManager _setUp](self, "_setUp");
  }
}

- (void)_addClock:(OpaqueCMClock *)a3
{
  unint64_t v3;
  unint64_t v6;
  unint64_t v7;
  unint64_t v8;
  unint64_t value;
  uint8x8_t v10;
  uint64_t ***v11;
  uint64_t **i;
  unint64_t v13;
  _QWORD *v14;
  float v15;
  float v16;
  _BOOL8 v17;
  unint64_t v18;
  unint64_t v19;
  int8x8_t prime;
  void **v21;
  void **v22;
  uint64_t v23;
  _QWORD *next;
  unint64_t v25;
  uint8x8_t v26;
  unint64_t v27;
  uint8x8_t v28;
  uint64_t v29;
  _QWORD *v30;
  unint64_t v31;
  void **v32;
  void **v33;
  void **v34;
  _QWORD *v35;
  unint64_t v36;
  void **v37;

  if (!self->_clocks.__table_.__p2_.__value_)
    -[REProxyAudioClockManager _setUp](self, "_setUp");
  -[REProxyAudioClockManager _updateClock:](self, "_updateClock:", a3);
  v6 = 0x9DDFEA08EB382D69 * (((8 * (_DWORD)a3) + 8) ^ ((unint64_t)a3 >> 32));
  v7 = 0x9DDFEA08EB382D69 * (((unint64_t)a3 >> 32) ^ (v6 >> 47) ^ v6);
  v8 = 0x9DDFEA08EB382D69 * (v7 ^ (v7 >> 47));
  value = self->_clocks.__table_.__bucket_list_.__ptr_.__value__2.__data_.__value_;
  if (value)
  {
    v10 = (uint8x8_t)vcnt_s8((int8x8_t)value);
    v10.i16[0] = vaddlv_u8(v10);
    if (v10.u32[0] > 1uLL)
    {
      v3 = 0x9DDFEA08EB382D69 * (v7 ^ (v7 >> 47));
      if (v8 >= value)
        v3 = v8 % value;
    }
    else
    {
      v3 = (value - 1) & v8;
    }
    v11 = (uint64_t ***)self->_clocks.__table_.__bucket_list_.__ptr_.__value_[v3];
    if (v11)
    {
      for (i = *v11; i; i = (uint64_t **)*i)
      {
        v13 = (unint64_t)i[1];
        if (v13 == v8)
        {
          if (i[2] == (uint64_t *)a3)
            return;
        }
        else
        {
          if (v10.u32[0] > 1uLL)
          {
            if (v13 >= value)
              v13 %= value;
          }
          else
          {
            v13 &= value - 1;
          }
          if (v13 != v3)
            break;
        }
      }
    }
  }
  v14 = operator new(0x18uLL);
  *v14 = 0;
  v14[1] = v8;
  v14[2] = a3;
  v15 = (float)(self->_clocks.__table_.__p2_.__value_ + 1);
  v16 = self->_clocks.__table_.__p3_.__value_;
  if (!value || (float)(v16 * (float)value) < v15)
  {
    v17 = 1;
    if (value >= 3)
      v17 = (value & (value - 1)) != 0;
    v18 = v17 | (2 * value);
    v19 = vcvtps_u32_f32(v15 / v16);
    if (v18 <= v19)
      prime = (int8x8_t)v19;
    else
      prime = (int8x8_t)v18;
    if (*(_QWORD *)&prime == 1)
    {
      prime = (int8x8_t)2;
    }
    else if ((*(_QWORD *)&prime & (*(_QWORD *)&prime - 1)) != 0)
    {
      prime = (int8x8_t)std::__next_prime(*(_QWORD *)&prime);
      value = self->_clocks.__table_.__bucket_list_.__ptr_.__value__2.__data_.__value_;
    }
    if (*(_QWORD *)&prime > value)
      goto LABEL_32;
    if (*(_QWORD *)&prime < value)
    {
      v27 = vcvtps_u32_f32((float)self->_clocks.__table_.__p2_.__value_ / self->_clocks.__table_.__p3_.__value_);
      if (value < 3 || (v28 = (uint8x8_t)vcnt_s8((int8x8_t)value), v28.i16[0] = vaddlv_u8(v28), v28.u32[0] > 1uLL))
      {
        v27 = std::__next_prime(v27);
      }
      else
      {
        v29 = 1 << -(char)__clz(v27 - 1);
        if (v27 >= 2)
          v27 = v29;
      }
      if (*(_QWORD *)&prime <= v27)
        prime = (int8x8_t)v27;
      if (*(_QWORD *)&prime >= value)
      {
        value = self->_clocks.__table_.__bucket_list_.__ptr_.__value__2.__data_.__value_;
      }
      else
      {
        if (prime)
        {
LABEL_32:
          if (*(_QWORD *)&prime >> 61)
            std::__throw_bad_array_new_length[abi:nn180100]();
          v21 = (void **)operator new(8 * *(_QWORD *)&prime);
          v22 = self->_clocks.__table_.__bucket_list_.__ptr_.__value_;
          self->_clocks.__table_.__bucket_list_.__ptr_.__value_ = v21;
          if (v22)
            operator delete(v22);
          v23 = 0;
          self->_clocks.__table_.__bucket_list_.__ptr_.__value__2.__data_.__value_ = (unint64_t)prime;
          do
            self->_clocks.__table_.__bucket_list_.__ptr_.__value_[v23++] = 0;
          while (*(_QWORD *)&prime != v23);
          next = self->_clocks.__table_.__p1_.__value_.__next_;
          if (next)
          {
            v25 = next[1];
            v26 = (uint8x8_t)vcnt_s8(prime);
            v26.i16[0] = vaddlv_u8(v26);
            if (v26.u32[0] > 1uLL)
            {
              if (v25 >= *(_QWORD *)&prime)
                v25 %= *(_QWORD *)&prime;
            }
            else
            {
              v25 &= *(_QWORD *)&prime - 1;
            }
            self->_clocks.__table_.__bucket_list_.__ptr_.__value_[v25] = &self->_clocks.__table_.__p1_;
            v30 = (_QWORD *)*next;
            if (*next)
            {
              do
              {
                v31 = v30[1];
                if (v26.u32[0] > 1uLL)
                {
                  if (v31 >= *(_QWORD *)&prime)
                    v31 %= *(_QWORD *)&prime;
                }
                else
                {
                  v31 &= *(_QWORD *)&prime - 1;
                }
                if (v31 != v25)
                {
                  v32 = self->_clocks.__table_.__bucket_list_.__ptr_.__value_;
                  if (!v32[v31])
                  {
                    v32[v31] = next;
                    goto LABEL_57;
                  }
                  *next = *v30;
                  *v30 = *(_QWORD *)self->_clocks.__table_.__bucket_list_.__ptr_.__value_[v31];
                  *(_QWORD *)self->_clocks.__table_.__bucket_list_.__ptr_.__value_[v31] = v30;
                  v30 = next;
                }
                v31 = v25;
LABEL_57:
                next = v30;
                v30 = (_QWORD *)*v30;
                v25 = v31;
              }
              while (v30);
            }
          }
          value = (unint64_t)prime;
          goto LABEL_61;
        }
        v37 = self->_clocks.__table_.__bucket_list_.__ptr_.__value_;
        self->_clocks.__table_.__bucket_list_.__ptr_.__value_ = 0;
        if (v37)
          operator delete(v37);
        value = 0;
        self->_clocks.__table_.__bucket_list_.__ptr_.__value__2.__data_.__value_ = 0;
      }
    }
LABEL_61:
    if ((value & (value - 1)) != 0)
    {
      if (v8 >= value)
        v3 = v8 % value;
      else
        v3 = v8;
    }
    else
    {
      v3 = (value - 1) & v8;
    }
  }
  v33 = self->_clocks.__table_.__bucket_list_.__ptr_.__value_;
  v34 = (void **)v33[v3];
  if (v34)
  {
    *v14 = *v34;
LABEL_74:
    *v34 = v14;
    goto LABEL_75;
  }
  v35 = self->_clocks.__table_.__p1_.__value_.__next_;
  *v14 = v35;
  self->_clocks.__table_.__p1_.__value_.__next_ = v14;
  v33[v3] = &self->_clocks.__table_.__p1_;
  if (v35)
  {
    v36 = v35[1];
    if ((value & (value - 1)) != 0)
    {
      if (v36 >= value)
        v36 %= value;
    }
    else
    {
      v36 &= value - 1;
    }
    v34 = &self->_clocks.__table_.__bucket_list_.__ptr_.__value_[v36];
    goto LABEL_74;
  }
LABEL_75:
  ++self->_clocks.__table_.__p2_.__value_;
}

- (void)_removeClock:(OpaqueCMClock *)a3
{
  unint64_t value;
  unint64_t v5;
  unint64_t v6;
  unint64_t v7;
  uint8x8_t v8;
  unint64_t v9;
  void **v10;
  void **v11;
  __compressed_pair<std::__hash_node_base<std::__hash_node<OpaqueCMClock *, void *> *>, std::allocator<std::__hash_node<OpaqueCMClock *, void *>>> *v12;
  unint64_t v13;
  unint64_t next;
  __compressed_pair<std::__hash_node_base<std::__hash_node<OpaqueCMClock *, void *> *>, std::allocator<std::__hash_node<OpaqueCMClock *, void *>>> *v15;
  __compressed_pair<std::__hash_node_base<std::__hash_node<OpaqueCMClock *, void *> *>, std::allocator<std::__hash_node<OpaqueCMClock *, void *>>> *v16;
  __compressed_pair<std::__hash_node_base<std::__hash_node<OpaqueCMClock *, void *> *>, std::allocator<std::__hash_node<OpaqueCMClock *, void *>>> *v17;
  unint64_t v18;
  unint64_t v19;
  unint64_t v20;

  value = self->_clocks.__table_.__bucket_list_.__ptr_.__value__2.__data_.__value_;
  if (!value)
    goto LABEL_47;
  v5 = 0x9DDFEA08EB382D69 * (((8 * (_DWORD)a3) + 8) ^ ((unint64_t)a3 >> 32));
  v6 = 0x9DDFEA08EB382D69 * (((unint64_t)a3 >> 32) ^ (v5 >> 47) ^ v5);
  v7 = 0x9DDFEA08EB382D69 * (v6 ^ (v6 >> 47));
  v8 = (uint8x8_t)vcnt_s8((int8x8_t)value);
  v8.i16[0] = vaddlv_u8(v8);
  if (v8.u32[0] > 1uLL)
  {
    v9 = v7;
    if (v7 >= value)
      v9 = v7 % value;
  }
  else
  {
    v9 = (value - 1) & v7;
  }
  v10 = self->_clocks.__table_.__bucket_list_.__ptr_.__value_;
  v11 = (void **)v10[v9];
  if (!v11)
    goto LABEL_47;
  v12 = (__compressed_pair<std::__hash_node_base<std::__hash_node<OpaqueCMClock *, void *> *>, std::allocator<std::__hash_node<OpaqueCMClock *, void *>>> *)*v11;
  if (!*v11)
    goto LABEL_47;
  v13 = value - 1;
  while (1)
  {
    next = (unint64_t)v12[1].__value_.__next_;
    if (next == v7)
      break;
    if (v8.u32[0] > 1uLL)
    {
      if (next >= value)
        next %= value;
    }
    else
    {
      next &= v13;
    }
    if (next != v9)
      goto LABEL_47;
LABEL_17:
    v12 = (__compressed_pair<std::__hash_node_base<std::__hash_node<OpaqueCMClock *, void *> *>, std::allocator<std::__hash_node<OpaqueCMClock *, void *>>> *)v12->__value_.__next_;
    if (!v12)
      goto LABEL_47;
  }
  if (v12[2].__value_.__next_ != a3)
    goto LABEL_17;
  v15 = (__compressed_pair<std::__hash_node_base<std::__hash_node<OpaqueCMClock *, void *> *>, std::allocator<std::__hash_node<OpaqueCMClock *, void *>>> *)v12->__value_.__next_;
  if (v8.u32[0] > 1uLL)
  {
    if (v7 >= value)
      v7 %= value;
  }
  else
  {
    v7 &= v13;
  }
  v16 = (__compressed_pair<std::__hash_node_base<std::__hash_node<OpaqueCMClock *, void *> *>, std::allocator<std::__hash_node<OpaqueCMClock *, void *>>> *)v10[v7];
  do
  {
    v17 = v16;
    v16 = (__compressed_pair<std::__hash_node_base<std::__hash_node<OpaqueCMClock *, void *> *>, std::allocator<std::__hash_node<OpaqueCMClock *, void *>>> *)v16->__value_.__next_;
  }
  while (v16 != v12);
  if (v17 == &self->_clocks.__table_.__p1_)
    goto LABEL_36;
  v18 = (unint64_t)v17[1].__value_.__next_;
  if (v8.u32[0] > 1uLL)
  {
    if (v18 >= value)
      v18 %= value;
  }
  else
  {
    v18 &= v13;
  }
  if (v18 == v7)
  {
LABEL_38:
    if (v15)
    {
      v19 = (unint64_t)v15[1].__value_.__next_;
      goto LABEL_40;
    }
  }
  else
  {
LABEL_36:
    if (!v15)
      goto LABEL_37;
    v19 = (unint64_t)v15[1].__value_.__next_;
    if (v8.u32[0] > 1uLL)
    {
      v20 = (unint64_t)v15[1].__value_.__next_;
      if (v19 >= value)
        v20 = v19 % value;
    }
    else
    {
      v20 = v19 & v13;
    }
    if (v20 != v7)
    {
LABEL_37:
      v10[v7] = 0;
      v15 = (__compressed_pair<std::__hash_node_base<std::__hash_node<OpaqueCMClock *, void *> *>, std::allocator<std::__hash_node<OpaqueCMClock *, void *>>> *)v12->__value_.__next_;
      goto LABEL_38;
    }
LABEL_40:
    if (v8.u32[0] > 1uLL)
    {
      if (v19 >= value)
        v19 %= value;
    }
    else
    {
      v19 &= v13;
    }
    if (v19 != v7)
    {
      self->_clocks.__table_.__bucket_list_.__ptr_.__value_[v19] = v17;
      v15 = (__compressed_pair<std::__hash_node_base<std::__hash_node<OpaqueCMClock *, void *> *>, std::allocator<std::__hash_node<OpaqueCMClock *, void *>>> *)v12->__value_.__next_;
    }
  }
  v17->__value_.__next_ = v15;
  v12->__value_.__next_ = 0;
  --self->_clocks.__table_.__p2_.__value_;
  operator delete(v12);
LABEL_47:
  if (!self->_clocks.__table_.__p2_.__value_)
    -[REProxyAudioClockManager _tearDown](self, "_tearDown", a3);
}

- (void)_updateClock:(OpaqueCMClock *)a3
{
  os_unfair_lock_s *DerivedStorage;
  os_unfair_lock_s *v5;
  __int128 v6;
  __int128 v7;

  DerivedStorage = (os_unfair_lock_s *)FigDerivedClockGetDerivedStorage();
  if (DerivedStorage)
  {
    v5 = DerivedStorage;
    os_unfair_lock_lock(DerivedStorage);
    *(double *)&v5[4]._os_unfair_lock_opaque = self->_rateRelativeToHost;
    v6 = *(_OWORD *)&self->_ownTimelineAnchor.value;
    *(_QWORD *)&v5[10]._os_unfair_lock_opaque = self->_ownTimelineAnchor.epoch;
    *(_OWORD *)&v5[6]._os_unfair_lock_opaque = v6;
    v7 = *(_OWORD *)&self->_referenceTimelineAnchor.value;
    *(_QWORD *)&v5[16]._os_unfair_lock_opaque = self->_referenceTimelineAnchor.epoch;
    *(_OWORD *)&v5[12]._os_unfair_lock_opaque = v7;
    os_unfair_lock_unlock(v5);
  }
}

- (void)_updateClocksWithRate:(double)a3 ownTime:(id *)a4 referenceTime:(id *)a5
{
  __int128 v5;
  __int128 v6;
  _QWORD *i;

  self->_rateRelativeToHost = a3;
  v5 = *(_OWORD *)&a4->var0;
  self->_ownTimelineAnchor.epoch = a4->var3;
  *(_OWORD *)&self->_ownTimelineAnchor.value = v5;
  v6 = *(_OWORD *)&a5->var0;
  self->_referenceTimelineAnchor.epoch = a5->var3;
  *(_OWORD *)&self->_referenceTimelineAnchor.value = v6;
  for (i = self->_clocks.__table_.__p1_.__value_.__next_; i; i = (_QWORD *)*i)
    -[REProxyAudioClockManager _updateClock:](self, "_updateClock:", i[2]);
}

- (void)_updateClocks
{
  OpaqueCMClock *v3;
  OpaqueCMClock *v4;
  CMClockRef HostTimeClock;
  OSStatus RelativeRateAndAnchorTime;
  NSObject *v7;
  NSObject *queue;
  _QWORD block[6];
  CMTime v10;
  CMTime v11;
  CMTime outRelativeToClockOrTimebaseAnchorTime;
  CMTime outOfClockOrTimebaseAnchorTime;
  Float64 outRelativeRate;
  uint8_t buf[4];
  OSStatus v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v3 = -[REProxyAudioClockManager _copyAudioClock](self, "_copyAudioClock");
  if (v3)
  {
    v4 = v3;
    outRelativeRate = 0.0;
    HostTimeClock = CMClockGetHostTimeClock();
    RelativeRateAndAnchorTime = CMSyncGetRelativeRateAndAnchorTime(v4, HostTimeClock, &outRelativeRate, &outOfClockOrTimebaseAnchorTime, &outRelativeToClockOrTimebaseAnchorTime);
    CFRelease(v4);
    if (RelativeRateAndAnchorTime)
    {
      ManualClockLog();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 67109120;
        v16 = RelativeRateAndAnchorTime;
        _os_log_error_impl(&dword_224FE9000, v7, OS_LOG_TYPE_ERROR, "Failed to update proxy audio clock: %d", buf, 8u);
      }

    }
    else
    {
      queue = self->_queue;
      block[0] = MEMORY[0x24BDAC760];
      block[1] = 3221225472;
      block[2] = __41__REProxyAudioClockManager__updateClocks__block_invoke;
      block[3] = &unk_24ED89498;
      block[4] = self;
      *(Float64 *)&block[5] = outRelativeRate;
      v10 = outOfClockOrTimebaseAnchorTime;
      v11 = outRelativeToClockOrTimebaseAnchorTime;
      dispatch_sync(queue, block);
    }
  }
}

uint64_t __41__REProxyAudioClockManager__updateClocks__block_invoke(uint64_t a1)
{
  void *v1;
  double v2;
  __int128 v4;
  uint64_t v5;
  __int128 v6;
  uint64_t v7;

  v1 = *(void **)(a1 + 32);
  v2 = *(double *)(a1 + 40);
  v6 = *(_OWORD *)(a1 + 48);
  v7 = *(_QWORD *)(a1 + 64);
  v4 = *(_OWORD *)(a1 + 72);
  v5 = *(_QWORD *)(a1 + 88);
  return objc_msgSend(v1, "_updateClocksWithRate:ownTime:referenceTime:", &v6, &v4, v2);
}

- (OpaqueCMClock)_copyAudioClock
{
  OpaqueCMClock *result;

  result = self->_audioClock;
  if (result)
    return (OpaqueCMClock *)CFRetain(result);
  return result;
}

- (OpaqueCMClock)copyAudioClock
{
  NSObject *audioClockUpdateQueue;
  OpaqueCMClock *v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  audioClockUpdateQueue = self->_audioClockUpdateQueue;
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __42__REProxyAudioClockManager_copyAudioClock__block_invoke;
  v5[3] = &unk_24ED894C0;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(audioClockUpdateQueue, v5);
  v3 = (OpaqueCMClock *)v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __42__REProxyAudioClockManager_copyAudioClock__block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "_copyAudioClock");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (void)_setAudioClock:(OpaqueCMClock *)a3
{
  OpaqueCMClock *audioClock;

  if (a3)
    CFRetain(a3);
  audioClock = self->_audioClock;
  self->_audioClock = a3;
  if (audioClock)
    CFRelease(audioClock);
}

- (void)routeChangeOrMediaServicesReset:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  _QWORD block[5];
  id v8;

  v4 = a3;
  queue = self->_queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __60__REProxyAudioClockManager_routeChangeOrMediaServicesReset___block_invoke;
  block[3] = &unk_24ED894E8;
  block[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_sync(queue, block);

}

uint64_t __60__REProxyAudioClockManager_routeChangeOrMediaServicesReset___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_routeChangeOrMediaServicesReset:", *(_QWORD *)(a1 + 40));
}

- (void)addClock:(OpaqueCMClock *)a3
{
  NSObject *queue;
  _QWORD v4[6];

  queue = self->_queue;
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __37__REProxyAudioClockManager_addClock___block_invoke;
  v4[3] = &unk_24ED30188;
  v4[4] = self;
  v4[5] = a3;
  dispatch_sync(queue, v4);
}

uint64_t __37__REProxyAudioClockManager_addClock___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_addClock:", *(_QWORD *)(a1 + 40));
}

- (void)removeClock:(OpaqueCMClock *)a3
{
  NSObject *queue;
  _QWORD v4[6];

  queue = self->_queue;
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __40__REProxyAudioClockManager_removeClock___block_invoke;
  v4[3] = &unk_24ED30188;
  v4[4] = self;
  v4[5] = a3;
  dispatch_sync(queue, v4);
}

uint64_t __40__REProxyAudioClockManager_removeClock___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_removeClock:", *(_QWORD *)(a1 + 40));
}

- (void)simulateStall
{
  dispatch_async((dispatch_queue_t)self->_audioClockUpdateQueue, &__block_literal_global_12_1);
}

uint64_t __41__REProxyAudioClockManager_simulateStall__block_invoke()
{
  return usleep(0x2FAF080u);
}

- (void).cxx_destruct
{
  _QWORD *next;
  _QWORD *v4;
  void **value;

  next = self->_clocks.__table_.__p1_.__value_.__next_;
  if (next)
  {
    do
    {
      v4 = (_QWORD *)*next;
      operator delete(next);
      next = v4;
    }
    while (v4);
  }
  value = self->_clocks.__table_.__bucket_list_.__ptr_.__value_;
  self->_clocks.__table_.__bucket_list_.__ptr_.__value_ = 0;
  if (value)
    operator delete(value);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_timer, 0);
  objc_storeStrong((id *)&self->_audioClockUpdateQueue, 0);
}

- (id).cxx_construct
{
  *((_OWORD *)self + 6) = 0u;
  *((_OWORD *)self + 7) = 0u;
  *((_DWORD *)self + 32) = 1065353216;
  return self;
}

@end
