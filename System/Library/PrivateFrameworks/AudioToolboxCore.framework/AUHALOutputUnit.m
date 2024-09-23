@implementation AUHALOutputUnit

- (AUHALOutputUnit)initWithComponentDescription:(AudioComponentDescription *)a3 options:(unsigned int)a4 error:(id *)a5
{
  AUHALOutputUnit *v5;
  AUHALOutputUnit *v6;
  objc_super v8;
  AudioComponentDescription v9;

  v9 = *a3;
  v8.receiver = self;
  v8.super_class = (Class)AUHALOutputUnit;
  v5 = -[AUAudioUnitV2Bridge initWithComponentDescription:options:error:](&v8, sel_initWithComponentDescription_options_error_, &v9, *(_QWORD *)&a4, a5);
  v6 = v5;
  if (v5)
    -[AUHALOutputUnit initAUHALOutputUnit](v5, "initAUHALOutputUnit");
  return v6;
}

- (AUHALOutputUnit)initWithAudioUnit:(OpaqueAudioComponentInstance *)a3 description:(AudioComponentDescription *)a4
{
  AUHALOutputUnit *v4;
  AUHALOutputUnit *v5;
  objc_super v7;
  AudioComponentDescription v8;

  v8 = *a4;
  v7.receiver = self;
  v7.super_class = (Class)AUHALOutputUnit;
  v4 = -[AUAudioUnitV2Bridge initWithAudioUnit:description:](&v7, sel_initWithAudioUnit_description_, a3, &v8);
  v5 = v4;
  if (v4)
    -[AUHALOutputUnit initAUHALOutputUnit](v4, "initAUHALOutputUnit");
  return v5;
}

- (void)dealloc
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t i;
  objc_super v7;

  v3 = (void *)*((_QWORD *)self + 86);
  *((_QWORD *)self + 86) = 0;

  v4 = (void *)*((_QWORD *)self + 85);
  *((_QWORD *)self + 85) = 0;

  if (*((_QWORD *)self + 91))
  {
    std::__hash_table<std::__hash_value_type<long,void({block_pointer} {__strong})(unsigned int,AudioTimeStamp const*,unsigned int,long)>,std::__unordered_map_hasher<long,std::__hash_value_type<long,void({block_pointer} {__strong})(unsigned int,AudioTimeStamp const*,unsigned int,long)>,std::hash<long>,std::equal_to<long>,true>,std::__unordered_map_equal<long,std::__hash_value_type<long,void({block_pointer} {__strong})(unsigned int,AudioTimeStamp const*,unsigned int,long)>,std::equal_to<long>,std::hash<long>,true>,std::allocator<std::__hash_value_type<long,void({block_pointer} {__strong})(unsigned int,AudioTimeStamp const*,unsigned int,long)>>>::__deallocate_node(*((id **)self + 90));
    *((_QWORD *)self + 90) = 0;
    v5 = *((_QWORD *)self + 89);
    if (v5)
    {
      for (i = 0; i != v5; ++i)
        *(_QWORD *)(*((_QWORD *)self + 88) + 8 * i) = 0;
    }
    *((_QWORD *)self + 91) = 0;
  }
  v7.receiver = self;
  v7.super_class = (Class)AUHALOutputUnit;
  -[AUAudioUnitV2Bridge dealloc](&v7, sel_dealloc);
}

- (void)initAUHALOutputUnit
{
  *((_BYTE *)self + 696) = 0;
  *((_BYTE *)self + 697) = 1;
  *((_BYTE *)self + 698) = 0;
  *((_DWORD *)self + 175) = 2000;
}

- (int64_t)tokenByAddingRenderObserver:(id)a3
{
  unint64_t v3;
  id v5;
  void *v6;
  unsigned int *v7;
  unsigned int v8;
  signed int v9;
  unint64_t v10;
  char *v11;
  unint64_t v12;
  uint8x8_t v13;
  _QWORD *v14;
  _QWORD *i;
  unint64_t v16;
  _QWORD *v17;
  _QWORD *v18;
  float v19;
  float v20;
  _BOOL8 v21;
  unint64_t v22;
  unint64_t v23;
  int8x8_t prime;
  void *v25;
  void *v26;
  uint64_t v27;
  _QWORD *v28;
  unint64_t v29;
  uint8x8_t v30;
  unint64_t v31;
  uint8x8_t v32;
  uint64_t v33;
  _QWORD *v34;
  unint64_t v35;
  uint64_t v36;
  _QWORD *v37;
  unint64_t v38;
  void *v40;

  v5 = a3;
  v6 = (void *)objc_msgSend(v5, "copy");
  AudioUnitAddRenderNotify(-[AUAudioUnitV2Bridge audioUnit](self, "audioUnit"), (AURenderCallback)AUHALOutputUnit_RenderNotifyCallback, v6);
  v7 = (unsigned int *)((char *)self + 700);
  do
  {
    v8 = __ldxr(v7);
    v9 = v8 + 1;
  }
  while (__stxr(v9, v7));
  v10 = v9;
  v11 = (char *)self + 704;
  v12 = *((_QWORD *)self + 89);
  if (v12)
  {
    v13 = (uint8x8_t)vcnt_s8((int8x8_t)v12);
    v13.i16[0] = vaddlv_u8(v13);
    if (v13.u32[0] > 1uLL)
    {
      v3 = v9;
      if (v12 <= v9)
        v3 = v9 % v12;
    }
    else
    {
      v3 = (v12 - 1) & v9;
    }
    v14 = *(_QWORD **)(*(_QWORD *)v11 + 8 * v3);
    if (v14)
    {
      for (i = (_QWORD *)*v14; i; i = (_QWORD *)*i)
      {
        v16 = i[1];
        if (v16 == v10)
        {
          if (i[2] == v10)
            goto LABEL_76;
        }
        else
        {
          if (v13.u32[0] > 1uLL)
          {
            if (v16 >= v12)
              v16 %= v12;
          }
          else
          {
            v16 &= v12 - 1;
          }
          if (v16 != v3)
            break;
        }
      }
    }
  }
  v17 = operator new(0x20uLL);
  v18 = v11 + 16;
  *v17 = 0;
  v17[1] = v10;
  v17[2] = v10;
  v17[3] = _Block_copy(v6);
  v19 = (float)(unint64_t)(*((_QWORD *)v11 + 3) + 1);
  v20 = *((float *)v11 + 8);
  if (!v12 || (float)(v20 * (float)v12) < v19)
  {
    v21 = 1;
    if (v12 >= 3)
      v21 = (v12 & (v12 - 1)) != 0;
    v22 = v21 | (2 * v12);
    v23 = vcvtps_u32_f32(v19 / v20);
    if (v22 <= v23)
      prime = (int8x8_t)v23;
    else
      prime = (int8x8_t)v22;
    if (*(_QWORD *)&prime == 1)
    {
      prime = (int8x8_t)2;
    }
    else if ((*(_QWORD *)&prime & (*(_QWORD *)&prime - 1)) != 0)
    {
      prime = (int8x8_t)std::__next_prime(*(_QWORD *)&prime);
    }
    v12 = *((_QWORD *)v11 + 1);
    if (*(_QWORD *)&prime > v12)
      goto LABEL_32;
    if (*(_QWORD *)&prime < v12)
    {
      v31 = vcvtps_u32_f32((float)*((unint64_t *)v11 + 3) / *((float *)v11 + 8));
      if (v12 < 3 || (v32 = (uint8x8_t)vcnt_s8((int8x8_t)v12), v32.i16[0] = vaddlv_u8(v32), v32.u32[0] > 1uLL))
      {
        v31 = std::__next_prime(v31);
      }
      else
      {
        v33 = 1 << -(char)__clz(v31 - 1);
        if (v31 >= 2)
          v31 = v33;
      }
      if (*(_QWORD *)&prime <= v31)
        prime = (int8x8_t)v31;
      if (*(_QWORD *)&prime >= v12)
      {
        v12 = *((_QWORD *)v11 + 1);
      }
      else
      {
        if (prime)
        {
LABEL_32:
          if (*(_QWORD *)&prime >> 61)
            std::__throw_bad_array_new_length[abi:ne180100]();
          v25 = operator new(8 * *(_QWORD *)&prime);
          v26 = *(void **)v11;
          *(_QWORD *)v11 = v25;
          if (v26)
            operator delete(v26);
          v27 = 0;
          *((int8x8_t *)v11 + 1) = prime;
          do
            *(_QWORD *)(*(_QWORD *)v11 + 8 * v27++) = 0;
          while (*(_QWORD *)&prime != v27);
          v28 = (_QWORD *)*v18;
          if (*v18)
          {
            v29 = v28[1];
            v30 = (uint8x8_t)vcnt_s8(prime);
            v30.i16[0] = vaddlv_u8(v30);
            if (v30.u32[0] > 1uLL)
            {
              if (v29 >= *(_QWORD *)&prime)
                v29 %= *(_QWORD *)&prime;
            }
            else
            {
              v29 &= *(_QWORD *)&prime - 1;
            }
            *(_QWORD *)(*(_QWORD *)v11 + 8 * v29) = v18;
            v34 = (_QWORD *)*v28;
            if (*v28)
            {
              do
              {
                v35 = v34[1];
                if (v30.u32[0] > 1uLL)
                {
                  if (v35 >= *(_QWORD *)&prime)
                    v35 %= *(_QWORD *)&prime;
                }
                else
                {
                  v35 &= *(_QWORD *)&prime - 1;
                }
                if (v35 != v29)
                {
                  if (!*(_QWORD *)(*(_QWORD *)v11 + 8 * v35))
                  {
                    *(_QWORD *)(*(_QWORD *)v11 + 8 * v35) = v28;
                    goto LABEL_57;
                  }
                  *v28 = *v34;
                  *v34 = **(_QWORD **)(*(_QWORD *)v11 + 8 * v35);
                  **(_QWORD **)(*(_QWORD *)v11 + 8 * v35) = v34;
                  v34 = v28;
                }
                v35 = v29;
LABEL_57:
                v28 = v34;
                v34 = (_QWORD *)*v34;
                v29 = v35;
              }
              while (v34);
            }
          }
          v12 = (unint64_t)prime;
          goto LABEL_61;
        }
        v40 = *(void **)v11;
        *(_QWORD *)v11 = 0;
        if (v40)
          operator delete(v40);
        v12 = 0;
        *((_QWORD *)v11 + 1) = 0;
      }
    }
LABEL_61:
    if ((v12 & (v12 - 1)) != 0)
    {
      if (v12 <= v10)
        v3 = v10 % v12;
      else
        v3 = v10;
    }
    else
    {
      v3 = (v12 - 1) & v10;
    }
  }
  v36 = *(_QWORD *)v11;
  v37 = *(_QWORD **)(*(_QWORD *)v11 + 8 * v3);
  if (v37)
  {
    *v17 = *v37;
LABEL_74:
    *v37 = v17;
    goto LABEL_75;
  }
  *v17 = *v18;
  *v18 = v17;
  *(_QWORD *)(v36 + 8 * v3) = v18;
  if (*v17)
  {
    v38 = *(_QWORD *)(*v17 + 8);
    if ((v12 & (v12 - 1)) != 0)
    {
      if (v38 >= v12)
        v38 %= v12;
    }
    else
    {
      v38 &= v12 - 1;
    }
    v37 = (_QWORD *)(*(_QWORD *)v11 + 8 * v38);
    goto LABEL_74;
  }
LABEL_75:
  ++*((_QWORD *)v11 + 3);
LABEL_76:

  return v10;
}

- (void)removeRenderObserver:(int64_t)a3
{
  _QWORD *v3;
  unint64_t v4;
  uint8x8_t v5;
  unint64_t v6;
  _QWORD **v7;
  _QWORD *i;
  unint64_t v9;
  int8x8_t v10;
  unint64_t v11;
  uint8x8_t v12;
  _QWORD *v13;
  _QWORD *v14;
  unint64_t v15;
  unint64_t v16;
  uint64_t v17;
  unint64_t v18;

  v3 = (_QWORD *)((char *)self + 704);
  v4 = *((_QWORD *)self + 89);
  if (v4)
  {
    v5 = (uint8x8_t)vcnt_s8((int8x8_t)v4);
    v5.i16[0] = vaddlv_u8(v5);
    if (v5.u32[0] > 1uLL)
    {
      v6 = a3;
      if (v4 <= a3)
        v6 = a3 % v4;
    }
    else
    {
      v6 = (v4 - 1) & a3;
    }
    v7 = *(_QWORD ***)(*v3 + 8 * v6);
    if (v7)
    {
      for (i = *v7; i; i = (_QWORD *)*i)
      {
        v9 = i[1];
        if (v9 == a3)
        {
          if (i[2] == a3)
          {
            AudioUnitRemoveRenderNotify(-[AUAudioUnitV2Bridge audioUnit](self, "audioUnit"), (AURenderCallback)AUHALOutputUnit_RenderNotifyCallback, (void *)i[3]);
            v10 = (int8x8_t)v3[1];
            v11 = i[1];
            v12 = (uint8x8_t)vcnt_s8(v10);
            v12.i16[0] = vaddlv_u8(v12);
            if (v12.u32[0] > 1uLL)
            {
              if (v11 >= *(_QWORD *)&v10)
                v11 %= *(_QWORD *)&v10;
            }
            else
            {
              v11 &= *(_QWORD *)&v10 - 1;
            }
            v13 = *(_QWORD **)(*v3 + 8 * v11);
            do
            {
              v14 = v13;
              v13 = (_QWORD *)*v13;
            }
            while (v13 != i);
            if (v14 == v3 + 2)
              goto LABEL_35;
            v15 = v14[1];
            if (v12.u32[0] > 1uLL)
            {
              if (v15 >= *(_QWORD *)&v10)
                v15 %= *(_QWORD *)&v10;
            }
            else
            {
              v15 &= *(_QWORD *)&v10 - 1;
            }
            if (v15 != v11)
            {
LABEL_35:
              if (!*i)
                goto LABEL_36;
              v16 = *(_QWORD *)(*i + 8);
              if (v12.u32[0] > 1uLL)
              {
                if (v16 >= *(_QWORD *)&v10)
                  v16 %= *(_QWORD *)&v10;
              }
              else
              {
                v16 &= *(_QWORD *)&v10 - 1;
              }
              if (v16 != v11)
LABEL_36:
                *(_QWORD *)(*v3 + 8 * v11) = 0;
            }
            v17 = *i;
            if (*i)
            {
              v18 = *(_QWORD *)(v17 + 8);
              if (v12.u32[0] > 1uLL)
              {
                if (v18 >= *(_QWORD *)&v10)
                  v18 %= *(_QWORD *)&v10;
              }
              else
              {
                v18 &= *(_QWORD *)&v10 - 1;
              }
              if (v18 != v11)
              {
                *(_QWORD *)(*v3 + 8 * v18) = v14;
                v17 = *i;
              }
            }
            *v14 = v17;
            *i = 0;
            --v3[3];

            operator delete(i);
            return;
          }
        }
        else
        {
          if (v5.u32[0] > 1uLL)
          {
            if (v9 >= v4)
              v9 %= v4;
          }
          else
          {
            v9 &= v4 - 1;
          }
          if (v9 != v6)
            return;
        }
      }
    }
  }
}

- (void)addRenderObserver:(void *)a3 userData:(void *)a4
{
  AudioUnitAddRenderNotify(-[AUAudioUnitV2Bridge audioUnit](self, "audioUnit"), (AURenderCallback)a3, a4);
}

- (void)removeRenderObserver:(void *)a3 userData:(void *)a4
{
  AudioUnitRemoveRenderNotify(-[AUAudioUnitV2Bridge audioUnit](self, "audioUnit"), (AURenderCallback)a3, a4);
}

- (id)outputProvider
{
  return _Block_copy(*((const void **)self + 85));
}

- (id)_inputHandler
{
  return _Block_copy(*((const void **)self + 86));
}

- (int)enableBus:(unsigned int)a3 scope:(unsigned int)a4 enable:(BOOL)a5
{
  uint64_t v5;
  objc_super v7;
  objc_super v8;
  _QWORD inData[2];

  if (a3 || a4 != 1)
    return -[AUAudioUnitV2Bridge enableBus:scope:enable:](&v7, sel_enableBus_scope_enable_, *(_QWORD *)&a3, *(_QWORD *)&a4, a5, self, AUHALOutputUnit, v8.receiver, v8.super_class);
  *((_BYTE *)self + 698) = a5;
  if (!a5)
    return -[AUAudioUnitV2Bridge enableBus:scope:enable:](&v8, sel_enableBus_scope_enable_, 0, 1, a5, v7.receiver, v7.super_class, self, AUHALOutputUnit);
  v5 = *((_QWORD *)self + 85);
  if (!v5)
    return -[AUAudioUnitV2Bridge enableBus:scope:enable:](&v8, sel_enableBus_scope_enable_, 0, 1, a5, v7.receiver, v7.super_class, self, AUHALOutputUnit);
  inData[0] = AUHALOutputUnit_ProvideOutputCallback;
  inData[1] = v5;
  return AudioUnitSetProperty(-[AUAudioUnitV2Bridge audioUnit](self, "audioUnit"), 0x17u, 1u, 0, inData, 0x10u);
}

- (void)setOutputProvider:(id)a3
{
  id v4;
  id v5;
  uint64_t v6;
  void *v7;
  id v8;

  v4 = a3;
  v5 = (id)*((_QWORD *)self + 85);
  v8 = v4;
  if (v5 != v4)
  {
    *((_QWORD *)self + 85) = 0;

    if (v8)
    {
      v6 = objc_msgSend(v8, "copy");
      v7 = (void *)*((_QWORD *)self + 85);
      *((_QWORD *)self + 85) = v6;

    }
    -[AUHALOutputUnit enableBus:scope:enable:](self, "enableBus:scope:enable:", 0, 1, *((_QWORD *)self + 85) != 0);
  }

}

- (void)setInputHandler:(id)a3
{
  id v4;
  id v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t (*v9)(void (**)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD), unsigned int *, const AudioTimeStamp *, unsigned int, uint64_t, AudioBufferList *);
  uint64_t v10;

  v4 = a3;
  v5 = (id)*((_QWORD *)self + 86);
  if (v5 != v4)
  {
    *((_QWORD *)self + 86) = 0;

    if (v4)
    {
      v6 = objc_msgSend(v4, "copy");
      v7 = (void *)*((_QWORD *)self + 86);
      *((_QWORD *)self + 86) = v6;

      v8 = *((_QWORD *)self + 86);
      v9 = AUHALOutputUnit_InputAvailableCallback;
      v10 = v8;
    }
    else
    {
      v9 = 0;
      v10 = 0;
    }
    AudioUnitSetProperty(-[AUAudioUnitV2Bridge audioUnit](self, "audioUnit", v9, v10), 0x7D5u, 0, 0, &v9, 0x10u);
  }

}

- (BOOL)canPerformInput
{
  OSStatus Property;
  UInt32 ioDataSize;
  int outData;

  outData = 0;
  ioDataSize = 4;
  Property = AudioUnitGetProperty(-[AUAudioUnitV2Bridge audioUnit](self, "audioUnit"), 0x7D6u, 1u, 1u, &outData, &ioDataSize);
  if (Property)
    return Property == -10879;
  else
    return outData != 0;
}

- (BOOL)canPerformOutput
{
  OSStatus Property;
  UInt32 ioDataSize;
  int outData;

  outData = 0;
  ioDataSize = 4;
  Property = AudioUnitGetProperty(-[AUAudioUnitV2Bridge audioUnit](self, "audioUnit"), 0x7D6u, 2u, 0, &outData, &ioDataSize);
  if (Property)
    return Property == -10879;
  else
    return outData != 0;
}

- (BOOL)isInputEnabled
{
  BOOL v2;
  UInt32 ioDataSize;
  int outData;

  outData = 0;
  ioDataSize = 4;
  if (AudioUnitGetProperty(-[AUAudioUnitV2Bridge audioUnit](self, "audioUnit"), 0x7D3u, 1u, 1u, &outData, &ioDataSize))
    v2 = 1;
  else
    v2 = outData == 0;
  return !v2;
}

- (BOOL)isOutputEnabled
{
  BOOL v2;
  UInt32 ioDataSize;
  int outData;

  outData = 0;
  ioDataSize = 4;
  if (AudioUnitGetProperty(-[AUAudioUnitV2Bridge audioUnit](self, "audioUnit"), 0x7D3u, 2u, 0, &outData, &ioDataSize))
    v2 = 1;
  else
    v2 = outData == 0;
  return !v2;
}

- (void)setInputEnabled:(BOOL)a3
{
  _BOOL4 inData;

  inData = a3;
  *((_BYTE *)self + 696) = a3;
  AudioUnitSetProperty(-[AUAudioUnitV2Bridge audioUnit](self, "audioUnit"), 0x7D3u, 1u, 1u, &inData, 4u);
}

- (void)setOutputEnabled:(BOOL)a3
{
  _BOOL4 inData;

  inData = a3;
  *((_BYTE *)self + 697) = a3;
  AudioUnitSetProperty(-[AUAudioUnitV2Bridge audioUnit](self, "audioUnit"), 0x7D3u, 2u, 0, &inData, 4u);
}

- (BOOL)isRunning
{
  BOOL v2;
  UInt32 ioDataSize;
  int outData;

  outData = 0;
  ioDataSize = 4;
  if (AudioUnitGetProperty(-[AUAudioUnitV2Bridge audioUnit](self, "audioUnit"), 0x7D1u, 0, 0, &outData, &ioDataSize))
    v2 = 1;
  else
    v2 = outData == 0;
  return !v2;
}

- (BOOL)startHardwareAndReturnError:(id *)a3
{
  OSStatus v4;
  OSStatus v5;
  id v6;

  v4 = AudioOutputUnitStart(-[AUAudioUnitV2Bridge audioUnit](self, "audioUnit"));
  v5 = v4;
  if (a3)
  {
    if (v4)
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2F90], v4, 0);
      v6 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      *a3 = v6;

    }
    else
    {
      *a3 = 0;
    }
  }
  return v5 == 0;
}

- (void)stopHardware
{
  AudioOutputUnitStop(-[AUAudioUnitV2Bridge audioUnit](self, "audioUnit"));
}

- (void).cxx_destruct
{
  void **v3;
  void *v4;

  v3 = (void **)((char *)self + 704);
  std::__hash_table<std::__hash_value_type<long,void({block_pointer} {__strong})(unsigned int,AudioTimeStamp const*,unsigned int,long)>,std::__unordered_map_hasher<long,std::__hash_value_type<long,void({block_pointer} {__strong})(unsigned int,AudioTimeStamp const*,unsigned int,long)>,std::hash<long>,std::equal_to<long>,true>,std::__unordered_map_equal<long,std::__hash_value_type<long,void({block_pointer} {__strong})(unsigned int,AudioTimeStamp const*,unsigned int,long)>,std::equal_to<long>,std::hash<long>,true>,std::allocator<std::__hash_value_type<long,void({block_pointer} {__strong})(unsigned int,AudioTimeStamp const*,unsigned int,long)>>>::__deallocate_node(*((id **)self + 90));
  v4 = *v3;
  *v3 = 0;
  if (v4)
    operator delete(v4);
  objc_storeStrong((id *)self + 86, 0);
  objc_storeStrong((id *)self + 85, 0);
}

- (id).cxx_construct
{
  *((_OWORD *)self + 44) = 0u;
  *((_OWORD *)self + 45) = 0u;
  *((_DWORD *)self + 184) = 1065353216;
  return self;
}

@end
