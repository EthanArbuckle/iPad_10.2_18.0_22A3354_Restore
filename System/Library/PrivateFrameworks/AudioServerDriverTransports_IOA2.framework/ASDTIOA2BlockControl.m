@implementation ASDTIOA2BlockControl

- (ASDTIOA2BlockControl)initWithIOA2Device:(id)a3 userClientID:(unsigned int)a4 isSettable:(BOOL)a5 forElement:(unsigned int)a6 inScope:(unsigned int)a7 objectClassID:(unsigned int)a8
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  _BOOL8 v11;
  uint64_t v12;
  id v14;
  void *v15;
  ASDTIOA2BlockControl *v16;
  objc_super v18;

  v8 = *(_QWORD *)&a8;
  v9 = *(_QWORD *)&a7;
  v10 = *(_QWORD *)&a6;
  v11 = a5;
  v12 = *(_QWORD *)&a4;
  v14 = a3;
  objc_msgSend(v14, "plugin");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v18.receiver = self;
  v18.super_class = (Class)ASDTIOA2BlockControl;
  v16 = -[ASDTIOA2BlockControl initWithElement:inScope:withPlugin:andObjectClassID:](&v18, sel_initWithElement_inScope_withPlugin_andObjectClassID_, v10, v9, v15, v8);

  if (v16)
  {
    -[ASDTIOA2BlockControl setSettable:](v16, "setSettable:", v11);
    -[ASDTIOA2BlockControl setIoa2Device:](v16, "setIoa2Device:", v14);
    -[ASDTIOA2BlockControl setUserClientID:](v16, "setUserClientID:", v12);
  }

  return v16;
}

- (void)dealloc
{
  void *v3;
  ASDT::IOUserClient *v4;
  objc_super v5;

  -[ASDControl asdtRemoveControlProperties](self, "asdtRemoveControlProperties");
  -[ASDTIOA2BlockControl ioa2Device](self, "ioa2Device");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (ASDT::IOUserClient *)objc_msgSend(v3, "ioa2UserClient");

  if (-[ASDTIOA2BlockControl blockMap](self, "blockMap") && v4)
    ASDT::IOUserClient::ReleaseMemory(v4, -[ASDTIOA2BlockControl blockMap](self, "blockMap"));
  v5.receiver = self;
  v5.super_class = (Class)ASDTIOA2BlockControl;
  -[ASDTIOA2BlockControl dealloc](&v5, sel_dealloc);
}

- (NSArray)propertySelectorInfo
{
  void *v2;
  void *v3;
  void *v4;
  _QWORD v6[2];
  _QWORD v7[2];
  _QWORD v8[2];
  _QWORD v9[2];
  _QWORD v10[3];

  v10[2] = *MEMORY[0x24BDAC8D0];
  v8[0] = CFSTR("selector");
  v8[1] = CFSTR("dataType");
  v9[0] = &unk_2508501E8;
  v9[1] = &unk_250850200;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v9, v8, 2);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = v2;
  v6[0] = CFSTR("selector");
  v6[1] = CFSTR("dataType");
  v7[0] = &unk_250850218;
  v7[1] = &unk_250850230;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v7, v6, 2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v10[1] = v3;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v10, 2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v4;
}

- (BOOL)synchronizeWithRegistryDictionary:(id)a3
{
  id v4;
  void *v5;
  ASDT::IOUserClient *v6;
  id v7;
  void *v8;
  void *v9;
  BOOL v10;
  objc_class *v11;
  void *v12;
  objc_class *v13;
  void *v14;
  CFTypeRef cf;
  uint8_t buf[4];
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[ASDTIOA2BlockControl ioa2Device](self, "ioa2Device");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (ASDT::IOUserClient *)objc_msgSend(v5, "ioa2UserClient");

  if (v6)
  {
    v7 = v4;
    v8 = v7;
    if (v7)
      CFRetain(v7);
    applesauce::CF::DictionaryRef::DictionaryRef((applesauce::CF::DictionaryRef *)&cf, v8);

    if (cf)
    {
      std::mutex::lock((std::mutex *)((char *)self + 80));
      if (-[ASDTIOA2BlockControl blockMap](self, "blockMap"))
      {
        ASDT::IOUserClient::ReleaseMemory(v6, -[ASDTIOA2BlockControl blockMap](self, "blockMap"));
        -[ASDTIOA2BlockControl setBlockMap:](self, "setBlockMap:", 0);
        -[ASDTIOA2BlockControl setBlockSize:](self, "setBlockSize:", 0);
      }
      if (ASDT::IOA2UserClient::MapBlockControlBuffer(v6, (const applesauce::CF::DictionaryRef *)&cf, (unsigned int *)self + 38, (unsigned __int8 **)self + 22))
      {
        objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("property selectors"));
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = -[ASDControl asdtAddControlProperties:](self, "asdtAddControlProperties:", v9);

      }
      else
      {
        if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        {
          v13 = (objc_class *)objc_opt_class();
          NSStringFromClass(v13);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          -[ASDTIOA2BlockControl synchronizeWithRegistryDictionary:].cold.1(v14, buf);
        }
        v10 = 0;
      }
      std::mutex::unlock((std::mutex *)((char *)self + 80));
    }
    else
    {
      v10 = 0;
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
      {
        v11 = (objc_class *)objc_opt_class();
        NSStringFromClass(v11);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v18 = v12;
        _os_log_impl(&dword_236D43000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "%@: Couldn't synchronize with registry", buf, 0xCu);

        v10 = 0;
      }
    }
    if (cf)
      CFRelease(cf);
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (BOOL)hasProperty:(const AudioObjectPropertyAddress *)a3
{
  objc_super v5;

  if (!a3)
    return 0;
  if (a3->mSelector == 1651272546 || a3->mSelector == 1651272548)
    return 1;
  v5.receiver = self;
  v5.super_class = (Class)ASDTIOA2BlockControl;
  return -[ASDTIOA2BlockControl hasProperty:](&v5, sel_hasProperty_);
}

- (BOOL)isPropertySettable:(const AudioObjectPropertyAddress *)a3
{
  objc_super v4;

  if (!a3)
    return 0;
  if (a3->mSelector == 1651272546)
    return -[ASDTIOA2BlockControl settable](self, "settable");
  v4.receiver = self;
  v4.super_class = (Class)ASDTIOA2BlockControl;
  return -[ASDTIOA2BlockControl isPropertySettable:](&v4, sel_isPropertySettable_);
}

- (unsigned)dataSizeForProperty:(const AudioObjectPropertyAddress *)a3 withQualifierSize:(unsigned int)a4 andQualifierData:(const void *)a5
{
  std::mutex *v6;
  unsigned int v7;
  objc_super v9;

  if (!a3)
    return 0;
  if (a3->mSelector == 1651272548)
    return 8;
  if (a3->mSelector == 1651272546)
  {
    v6 = (std::mutex *)((char *)self + 80);
    std::mutex::lock((std::mutex *)((char *)self + 80));
    v7 = -[ASDTIOA2BlockControl blockSize](self, "blockSize");
    std::mutex::unlock(v6);
  }
  else
  {
    v9.receiver = self;
    v9.super_class = (Class)ASDTIOA2BlockControl;
    return -[ASDTIOA2BlockControl dataSizeForProperty:withQualifierSize:andQualifierData:](&v9, sel_dataSizeForProperty_withQualifierSize_andQualifierData_);
  }
  return v7;
}

- (BOOL)getProperty:(const AudioObjectPropertyAddress *)a3 withQualifierSize:(unsigned int)a4 qualifierData:(const void *)a5 dataSize:(unsigned int *)a6 andData:(void *)a7 forClient:(int)a8
{
  ASDT::IOA2UserClient *v8;
  void *v12;
  std::mutex *v13;
  unsigned int v14;
  unsigned int v15;
  void *v16;
  ASDT::IOA2UserClient *v17;
  const __CFDictionary *v18;
  objc_super v20;
  uint64_t v21;
  const __CFDictionary *v22;

  LOBYTE(v8) = 0;
  if (a6 && a3 && a7)
  {
    if (a3->mSelector == 1651272548)
    {
      -[ASDTIOA2BlockControl ioa2Device](self, "ioa2Device");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = (ASDT::IOA2UserClient *)objc_msgSend(v16, "ioa2UserClient");

      if (!v17)
      {
        LOBYTE(v8) = 0;
        return (char)v8;
      }
      v13 = (std::mutex *)((char *)self + 80);
      std::mutex::lock((std::mutex *)((char *)self + 80));
      LOBYTE(v8) = *a6 > 7;
      if (*a6 >= 8)
      {
        *a6 = 8;
        ASDT::IOA2UserClient::CopyControlDictionaryByID(v17, (const applesauce::CF::ArrayRef *)-[ASDTIOA2BlockControl userClientID](self, "userClientID"), (applesauce::CF::DictionaryRef *)&v22);
        ASDT::IOA2UserClient::CopyBlockControlInfo_Descriptor(&v22, &v21);
        v18 = v22;
        *(_QWORD *)a7 = v21;
        if (v18)
          CFRelease(v18);
      }
      goto LABEL_18;
    }
    if (a3->mSelector == 1651272546)
    {
      -[ASDTIOA2BlockControl ioa2Device](self, "ioa2Device");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = (ASDT::IOA2UserClient *)objc_msgSend(v12, "ioa2UserClient");

      if (v8)
      {
        v13 = (std::mutex *)((char *)self + 80);
        std::mutex::lock((std::mutex *)((char *)self + 80));
        if (!-[ASDTIOA2BlockControl blockMap](self, "blockMap"))
          goto LABEL_17;
        v14 = -[ASDTIOA2BlockControl blockSize](self, "blockSize");
        v15 = *a6;
        if (v14 < *a6)
          v15 = v14;
        *a6 = v15;
        if (ASDT::IOA2UserClient::MoveBlockControlData(v8, -[ASDTIOA2BlockControl userClientID](self, "userClientID"), 0, *a6))
        {
          memcpy(a7, -[ASDTIOA2BlockControl blockMap](self, "blockMap"), *a6);
          LOBYTE(v8) = 1;
        }
        else
        {
LABEL_17:
          LOBYTE(v8) = 0;
        }
LABEL_18:
        std::mutex::unlock(v13);
      }
    }
    else
    {
      v20.receiver = self;
      v20.super_class = (Class)ASDTIOA2BlockControl;
      LOBYTE(v8) = -[ASDTIOA2BlockControl getProperty:withQualifierSize:qualifierData:dataSize:andData:forClient:](&v20, sel_getProperty_withQualifierSize_qualifierData_dataSize_andData_forClient_);
    }
  }
  return (char)v8;
}

- (BOOL)setProperty:(const AudioObjectPropertyAddress *)a3 withQualifierSize:(unsigned int)a4 qualifierData:(const void *)a5 dataSize:(unsigned int)a6 andData:(const void *)a7 forClient:(int)a8
{
  BOOL result;
  uint64_t v11;
  size_t v12;
  uint64_t v14;
  void *v16;
  ASDT::IOA2UserClient *v17;
  unsigned int v18;
  BOOL v19;
  objc_super v20;

  result = 0;
  if (a3 && a7)
  {
    v11 = *(_QWORD *)&a8;
    v12 = *(_QWORD *)&a6;
    v14 = *(_QWORD *)&a4;
    if (a3->mSelector == 1651272546)
    {
      -[ASDTIOA2BlockControl ioa2Device](self, "ioa2Device");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = (ASDT::IOA2UserClient *)objc_msgSend(v16, "ioa2UserClient");

      if (!v17)
        return 0;
      std::mutex::lock((std::mutex *)((char *)self + 80));
      if (-[ASDTIOA2BlockControl blockMap](self, "blockMap"))
      {
        v18 = -[ASDTIOA2BlockControl blockSize](self, "blockSize");
        if (v18 >= v12)
          v12 = v12;
        else
          v12 = v18;
        memcpy(-[ASDTIOA2BlockControl blockMap](self, "blockMap"), a7, v12);
        v19 = ASDT::IOA2UserClient::MoveBlockControlData(v17, -[ASDTIOA2BlockControl userClientID](self, "userClientID"), 1u, v12);
        std::mutex::unlock((std::mutex *)((char *)self + 80));
        if (v19)
          return 1;
      }
      else
      {
        std::mutex::unlock((std::mutex *)((char *)self + 80));
      }
    }
    v20.receiver = self;
    v20.super_class = (Class)ASDTIOA2BlockControl;
    return -[ASDTIOA2BlockControl setProperty:withQualifierSize:qualifierData:dataSize:andData:forClient:](&v20, sel_setProperty_withQualifierSize_qualifierData_dataSize_andData_forClient_, a3, v14, a5, v12, a7, v11);
  }
  return result;
}

- (BOOL)marked
{
  return *((_BYTE *)self + 144);
}

- (void)setMarked:(BOOL)a3
{
  *((_BYTE *)self + 144) = a3;
}

- (NSArray)properties
{
  return (NSArray *)*((_QWORD *)self + 20);
}

- (void)setProperties:(id)a3
{
  objc_storeStrong((id *)self + 20, a3);
}

- (ASDTIOA2Device)ioa2Device
{
  return (ASDTIOA2Device *)objc_loadWeakRetained((id *)self + 21);
}

- (void)setIoa2Device:(id)a3
{
  objc_storeWeak((id *)self + 21, a3);
}

- (BOOL)settable
{
  return *((_BYTE *)self + 145);
}

- (void)setSettable:(BOOL)a3
{
  *((_BYTE *)self + 145) = a3;
}

- (unsigned)userClientID
{
  return *((_DWORD *)self + 37);
}

- (void)setUserClientID:(unsigned int)a3
{
  *((_DWORD *)self + 37) = a3;
}

- (char)blockMap
{
  return (char *)*((_QWORD *)self + 22);
}

- (void)setBlockMap:(char *)a3
{
  *((_QWORD *)self + 22) = a3;
}

- (unsigned)blockSize
{
  return *((_DWORD *)self + 38);
}

- (void)setBlockSize:(unsigned int)a3
{
  *((_DWORD *)self + 38) = a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)self + 21);
  objc_storeStrong((id *)self + 20, 0);
  std::mutex::~mutex((std::mutex *)((char *)self + 80));
}

- (id).cxx_construct
{
  *((_QWORD *)self + 10) = 850045863;
  *(_OWORD *)((char *)self + 88) = 0u;
  *(_OWORD *)((char *)self + 104) = 0u;
  *(_OWORD *)((char *)self + 120) = 0u;
  *((_QWORD *)self + 17) = 0;
  return self;
}

- (void)synchronizeWithRegistryDictionary:(void *)a1 .cold.1(void *a1, uint8_t *buf)
{
  *(_DWORD *)buf = 138412290;
  *(_QWORD *)(buf + 4) = a1;
  _os_log_error_impl(&dword_236D43000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "%@: Failed to map block memory.", buf, 0xCu);

}

@end
