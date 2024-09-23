@implementation ASDTPMSequencer

+ (ASDTPMSequencer)pmSequencerWithPMDeviceConfig:(id)a3 withParent:(id)a4
{
  id v5;
  id v6;
  ASDTPMSequencer *v7;

  v5 = a3;
  v6 = a4;
  v7 = -[ASDTPMSequencer initWithPMDeviceConfig:withParent:]([ASDTPMSequencer alloc], "initWithPMDeviceConfig:withParent:", v5, v6);

  return v7;
}

- (ASDTPMSequencer)initWithPMDeviceConfig:(id)a3 withParent:(id)a4
{
  id v6;
  id v7;
  ASDTPMSequencer *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  dispatch_queue_t v15;
  NSObject *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  dispatch_queue_t v22;
  void *v23;
  void *v24;
  _BOOL4 v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  _BOOL4 v33;
  int v34;
  void *v35;
  void *v36;
  void *v37;
  uint64_t v38;
  ASDTPMSequencer *v39;
  NSObject *attr;
  objc_super v42;
  _BYTE v43[24];
  uint64_t v44;

  v44 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  if (!v7)
    goto LABEL_20;
  v42.receiver = self;
  v42.super_class = (Class)ASDTPMSequencer;
  v8 = -[ASDTPMSequencer init](&v42, sel_init);
  self = v8;
  if (!v8)
  {
LABEL_21:
    self = self;
    v39 = self;
    goto LABEL_22;
  }
  -[ASDTPMSequencer setParent:](v8, "setParent:", v7);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    -[ASDTPMSequencer setParentDevice:](self, "setParentDevice:", v7);
  dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v9 = objc_claimAutoreleasedReturnValue();
  dispatch_queue_attr_make_with_qos_class(v9, QOS_CLASS_USER_INTERACTIVE, 0);
  attr = objc_claimAutoreleasedReturnValue();

  v10 = (void *)MEMORY[0x24BDD17C8];
  -[ASDTPMSequencer parent](self, "parent");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "name");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "stringWithFormat:", CFSTR("%s.%@.serial"), "com.apple.AudioServerDriverTransports", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = objc_retainAutorelease(v13);
  v15 = dispatch_queue_create((const char *)objc_msgSend(v14, "UTF8String"), attr);
  -[ASDTPMSequencer setPmSerialQueue:](self, "setPmSerialQueue:", v15);

  dispatch_queue_attr_make_with_qos_class(MEMORY[0x24BDAC9C0], QOS_CLASS_USER_INTERACTIVE, 0);
  v16 = objc_claimAutoreleasedReturnValue();
  v17 = (void *)MEMORY[0x24BDD17C8];
  -[ASDTPMSequencer parent](self, "parent");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "name");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "stringWithFormat:", CFSTR("%s.%@.concurrent"), "com.apple.AudioServerDriverTransports", v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  v21 = objc_retainAutorelease(v20);
  v22 = dispatch_queue_create((const char *)objc_msgSend(v21, "UTF8String"), v16);
  -[ASDTPMSequencer setPmConcurrentQueue:](self, "setPmConcurrentQueue:", v22);

  -[ASDTPMSequencer pmSerialQueue](self, "pmSerialQueue");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  if (v23)
  {
    -[ASDTPMSequencer pmConcurrentQueue](self, "pmConcurrentQueue");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = v24 == 0;

    if (!v25)
    {
      objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", objc_msgSend(v6, "count") + 1);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      -[ASDTPMSequencer setMutablePMDevicesPowerUp:](self, "setMutablePMDevicesPowerUp:", v26);

      objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", objc_msgSend(v6, "count") + 1);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      -[ASDTPMSequencer setMutablePMDevicesPowerDown:](self, "setMutablePMDevicesPowerDown:", v27);

      +[ASDTPMDeviceProxy forPMDevice:](ASDTPMDeviceProxy, "forPMDevice:", v7);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      -[ASDTPMSequencer mutablePMDevicesPowerUp](self, "mutablePMDevicesPowerUp");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "addObject:", v28);

      -[ASDTPMSequencer mutablePMDevicesPowerDown](self, "mutablePMDevicesPowerDown");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "addObject:", v28);

      if (-[ASDTPMSequencer addPMDevicesWithConfig:](self, "addPMDevicesWithConfig:", v6))
      {
        -[ASDTPMSequencer pmDevicesPowerUp](self, "pmDevicesPowerUp");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v31, "count"))
        {
          -[ASDTPMSequencer pmDevicesPowerDown](self, "pmDevicesPowerDown");
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          v33 = objc_msgSend(v32, "count") == 0;

          if (!v33)
          {
            v34 = 0;
LABEL_18:

            goto LABEL_19;
          }
        }
        else
        {

        }
        if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        {
          objc_msgSend(v7, "name");
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          -[ASDTPMSequencer initWithPMDeviceConfig:withParent:].cold.2(v37, (uint64_t)v43, v38);
        }
      }
      v34 = 1;
      goto LABEL_18;
    }
  }
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
  {
    -[ASDTPMSequencer parent](self, "parent");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "name");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    -[ASDTPMSequencer initWithPMDeviceConfig:withParent:].cold.1(v36, (uint64_t)v43, v35);
  }
  v34 = 1;
LABEL_19:

  if (!v34)
    goto LABEL_21;
LABEL_20:
  v39 = 0;
LABEL_22:

  return v39;
}

- (BOOL)doAddPMDeviceWithConfig:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint8_t v11[24];
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  +[ASDTPMDevice pmDeviceWithConfig:forSequencer:](ASDTPMDevice, "pmDeviceWithConfig:forSequencer:", v4, self);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    -[ASDTPMSequencer mutablePMDevicesPowerUp](self, "mutablePMDevicesPowerUp");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addObject:", v5);

    -[ASDTPMSequencer mutablePMDevicesPowerDown](self, "mutablePMDevicesPowerDown");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addObject:", v5);

  }
  else if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
  {
    -[ASDTPMSequencer parent](self, "parent");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "name");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[ASDTPMSequencer doAddPMDeviceWithConfig:].cold.1(v9, (uint64_t)v4, v11, v8);
  }

  return v5 != 0;
}

- (void)sortPMDevices
{
  void *v3;
  void *v4;
  id v5;
  id v6;
  id v7;
  id v8;

  -[ASDTPMSequencer mutablePMDevicesPowerUp](self, "mutablePMDevicesPowerUp");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "sortUsingComparator:", &__block_literal_global_2);

  -[ASDTPMSequencer mutablePMDevicesPowerDown](self, "mutablePMDevicesPowerDown");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "sortUsingComparator:", &__block_literal_global_10);

  -[ASDTPMSequencer mutablePMDevicesPowerUp](self, "mutablePMDevicesPowerUp");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_msgSend(v7, "copy");
  -[ASDTPMSequencer setPmDevicesPowerUp:](self, "setPmDevicesPowerUp:", v3);

  -[ASDTPMSequencer mutablePMDevicesPowerDown](self, "mutablePMDevicesPowerDown");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v8, "copy");
  -[ASDTPMSequencer setPmDevicesPowerDown:](self, "setPmDevicesPowerDown:", v4);

}

int64_t __32__ASDTPMSequencer_sortPMDevices__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return +[ASDTPMSequencer compare:with:forPowerUp:](ASDTPMSequencer, "compare:with:forPowerUp:", a2, a3, 1);
}

int64_t __32__ASDTPMSequencer_sortPMDevices__block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return +[ASDTPMSequencer compare:with:forPowerUp:](ASDTPMSequencer, "compare:with:forPowerUp:", a2, a3, 0);
}

- (BOOL)addPMDevicesWithConfig:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  BOOL v8;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v4 = a3;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v5)
  {
    v6 = *(_QWORD *)v11;
    while (2)
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v11 != v6)
          objc_enumerationMutation(v4);
        if (!-[ASDTPMSequencer doAddPMDeviceWithConfig:](self, "doAddPMDeviceWithConfig:", *(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * i), (_QWORD)v10))
        {

          v8 = 0;
          goto LABEL_11;
        }
      }
      v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
      if (v5)
        continue;
      break;
    }
  }

  -[ASDTPMSequencer sortPMDevices](self, "sortPMDevices");
  v8 = 1;
LABEL_11:

  return v8;
}

+ (int64_t)compare:(id)a3 with:(id)a4 forPowerUp:(BOOL)a5
{
  _BOOL4 v5;
  id v7;
  id v8;
  unsigned int v9;
  unsigned int v10;
  uint64_t v11;
  int64_t v12;

  v5 = a5;
  v7 = a3;
  v8 = a4;
  if (v5)
  {
    v9 = objc_msgSend(v7, "pmOrderPowerUp");
    v10 = objc_msgSend(v8, "pmOrderPowerUp");
  }
  else
  {
    v10 = objc_msgSend(v7, "pmOrderPowerDown");
    v9 = objc_msgSend(v8, "pmOrderPowerDown");
  }
  if (v9 >= v10)
    v11 = 0;
  else
    v11 = -1;
  if (v9 > v10)
    v12 = 1;
  else
    v12 = v11;

  return v12;
}

- (int)executeSequenceFromState:(int)a3 toState:(int)a4
{
  uint64_t v6;
  uint64_t v7;
  void *v8;
  ASDTTime *v9;
  void *v10;
  ASDTTime *v11;
  __int128 v12;
  void *v13;
  int v14;
  int v15;
  int v16;
  unsigned int v17;
  int v18;
  int v19;
  int v20;
  unsigned int v21;
  int v22;
  int v23;
  int v24;
  unsigned int v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  int v30;
  uint64_t v31;
  unsigned __int16 *v32;
  int v33;
  void *v34;
  void *v35;
  uint64_t v36;
  void *v37;
  unsigned int v38;
  int v39;
  int v40;
  int v41;
  __int128 v43;
  int v44;
  unsigned int v45;
  int v46;
  int v47;
  int v48;
  unsigned int v49;
  int v50;
  int v51;
  int v52;
  unsigned int v53;
  int v54;
  int v55;
  int v56;
  int v57;
  __int128 v59;
  uint64_t v60;
  __int128 v61;
  uint64_t v62;
  __int128 v63;
  uint64_t v64;
  _BYTE buf[24];
  int v66;
  __int16 v67;
  unsigned int v68;
  __int16 v69;
  int v70;
  __int16 v71;
  int v72;
  __int16 v73;
  int v74;
  __int16 v75;
  unsigned int v76;
  __int16 v77;
  int v78;
  __int16 v79;
  int v80;
  __int16 v81;
  int v82;
  __int16 v83;
  unsigned int v84;
  __int16 v85;
  int v86;
  __int16 v87;
  int v88;
  __int16 v89;
  int v90;
  __int16 v91;
  uint64_t v92;
  __int16 v93;
  uint64_t v94;
  __int16 v95;
  uint64_t v96;
  __int16 v97;
  int v98;
  uint64_t v99;

  v99 = *MEMORY[0x24BDAC8D0];
  v6 = asdtPowerTransitionForStateChange(a3, a4);
  if ((_DWORD)v6)
  {
    v7 = v6;
    v57 = asdtPowerTransitionUpwards(v6);
    if (v57)
      -[ASDTPMSequencer pmDevicesPowerUp](self, "pmDevicesPowerUp");
    else
      -[ASDTPMSequencer pmDevicesPowerDown](self, "pmDevicesPowerDown");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "objectEnumerator");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    v63 = 0uLL;
    v64 = 0x10000;
    ASDTTime::machAbsoluteTime(v11, (uint64_t)&v61);
    LODWORD(v9) = 0;
    v13 = 0;
    if (v7 - 32 >= 0x5F)
      v14 = 32;
    else
      v14 = v7;
    v15 = BYTE1(v7);
    if (BYTE1(v7) - 32 >= 0x5F)
      v15 = 32;
    v55 = v15;
    v56 = v14;
    v16 = BYTE2(v7);
    if (BYTE2(v7) - 32 >= 0x5F)
      v16 = 32;
    v54 = v16;
    if ((v7 - 0x20000000) >> 24 >= 0x5F)
      v17 = 32;
    else
      v17 = BYTE3(v7);
    v53 = v17;
    v18 = a4;
    if (a4 - 32 >= 0x5F)
      v18 = 32;
    v52 = v18;
    v19 = BYTE1(a4);
    if (BYTE1(a4) - 32 >= 0x5F)
      v19 = 32;
    v51 = v19;
    v20 = BYTE2(a4);
    if (BYTE2(a4) - 32 >= 0x5F)
      v20 = 32;
    v50 = v20;
    if ((a4 - 0x20000000) >> 24 >= 0x5F)
      v21 = 32;
    else
      v21 = HIBYTE(a4);
    v49 = v21;
    v22 = a3;
    if (a3 - 32 >= 0x5F)
      v22 = 32;
    v48 = v22;
    v23 = BYTE1(a3);
    if (BYTE1(a3) - 32 >= 0x5F)
      v23 = 32;
    v47 = v23;
    v24 = BYTE2(a3);
    if (BYTE2(a3) - 32 >= 0x5F)
      v24 = 32;
    v46 = v24;
    if ((a3 - 0x20000000) >> 24 >= 0x5F)
      v25 = 32;
    else
      v25 = HIBYTE(a3);
    v45 = v25;
    *(_QWORD *)&v12 = 138413826;
    v43 = v12;
    do
    {
      v44 = (int)v9;
      while (1)
      {
        objc_msgSend(v10, "nextObject", v43);
        v26 = (void *)objc_claimAutoreleasedReturnValue();

        v13 = v26;
        if (!v26)
        {
          LODWORD(v9) = v44;
          goto LABEL_60;
        }
        v63 = v61;
        v64 = v62;
        v9 = (ASDTTime *)objc_msgSend(v26, "asdtPowerStateChange:", v7);
        ASDTTime::machAbsoluteTime(v9, (uint64_t)buf);
        v61 = *(_OWORD *)buf;
        v62 = *(_QWORD *)&buf[16];
        if ((_DWORD)v9 || (objc_msgSend(v26, "asdtHandlesPowerTransition:", v7) & 1) != 0)
        {
          if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
          {
            -[ASDTPMSequencer parent](self, "parent");
            v27 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v27, "name");
            v28 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v26, "name");
            v29 = (void *)objc_claimAutoreleasedReturnValue();
            if (v57)
              v30 = objc_msgSend(v26, "pmOrderPowerUp");
            else
              v30 = objc_msgSend(v26, "pmOrderPowerDown");
            v33 = v30;
            v59 = v61;
            v60 = v62;
            ASDTTime::operator-=((_anonymous_namespace_ **)&v59, (uint64_t *)&v63, v31, v32);
            *(_DWORD *)buf = 138416898;
            *(_QWORD *)&buf[4] = v28;
            *(_WORD *)&buf[12] = 2112;
            *(_QWORD *)&buf[14] = v29;
            *(_WORD *)&buf[22] = 1024;
            v66 = v33;
            v67 = 1024;
            v68 = v45;
            v69 = 1024;
            v70 = v46;
            v71 = 1024;
            v72 = v47;
            v73 = 1024;
            v74 = v48;
            v75 = 1024;
            v76 = v49;
            v77 = 1024;
            v78 = v50;
            v79 = 1024;
            v80 = v51;
            v81 = 1024;
            v82 = v52;
            v83 = 1024;
            v84 = v53;
            v85 = 1024;
            v86 = v54;
            v87 = 1024;
            v88 = v55;
            v89 = 1024;
            v90 = v56;
            v91 = 2048;
            v92 = v59;
            v93 = 2048;
            v94 = v61;
            v95 = 2048;
            v96 = *((_QWORD *)&v61 + 1);
            v97 = 1024;
            v98 = (unsigned __int16)v62;
            _os_log_impl(&dword_236CEE000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "%@: %@: Order: %u, State change '%c%c%c%c' to '%c%c%c%c' (transition '%c%c%c%c'): took %lluns, finished at %llu (%llu.%hu)", buf, 0x88u);

          }
          if ((_DWORD)v9)
            break;
        }
      }
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      {
        -[ASDTPMSequencer parent](self, "parent");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v34, "name");
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "name");
        v36 = objc_claimAutoreleasedReturnValue();
        v37 = (void *)v36;
        if (((_DWORD)v9 - 0x20000000) >> 24 >= 0x5F)
          v38 = 32;
        else
          v38 = v9 >> 24;
        *(_DWORD *)buf = v43;
        *(_QWORD *)&buf[4] = v35;
        v39 = BYTE2(v9);
        if (BYTE2(v9) - 32 >= 0x5F)
          v39 = 32;
        *(_WORD *)&buf[12] = 2112;
        *(_QWORD *)&buf[14] = v36;
        v40 = BYTE1(v9);
        if (BYTE1(v9) - 32 >= 0x5F)
          v40 = 32;
        *(_WORD *)&buf[22] = 1024;
        v66 = (int)v9;
        v67 = 1024;
        v68 = v38;
        if (v9 - 32 >= 0x5F)
          v41 = 32;
        else
          v41 = v9;
        v69 = 1024;
        v70 = v39;
        v71 = 1024;
        v72 = v40;
        v73 = 1024;
        v74 = v41;
        _os_log_error_impl(&dword_236CEE000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "%@: PM state change failed for %@: %x '%c%c%c%c'", buf, 0x34u);

      }
    }
    while (!v57);
LABEL_60:

  }
  else
  {
    LODWORD(v9) = 0;
  }
  return (int)v9;
}

- (int)doExecuteSequenceToState:(int)a3
{
  uint64_t v3;
  void *v5;
  uint64_t v6;
  uint64_t PowerState;
  void *v8;
  id v9;
  char v10;
  uint64_t v11;
  int v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  int v16;
  void *v17;
  _QWORD v19[2];

  v3 = *(_QWORD *)&a3;
  -[ASDTPMSequencer parent](self, "parent");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "powerState");

  PowerState = asdtNextPowerState(v6, v3);
  -[ASDTPMSequencer parent](self, "parent");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "name");
  v9 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v19[0] = 0;
  strlcpy((char *)v19, (const char *)objc_msgSend(v9, "UTF8String"), 9uLL);
  v19[1] = 0;

  kdebug_trace();
  v10 = 3;
  v11 = v6;
  while (v10)
  {
    if ((_DWORD)v11 == (_DWORD)v3)
    {
      v11 = PowerState;
      v12 = 1920234105;
      PowerState = v3;
      if ((_DWORD)v6)
        goto LABEL_5;
    }
    else
    {
      while (1)
      {
        v15 = v11;
        v11 = PowerState;
        v16 = -[ASDTPMSequencer executeSequenceFromState:toState:](self, "executeSequenceFromState:toState:", v15, PowerState);
        if (v16)
          break;
        PowerState = asdtNextPowerState(PowerState, v3);
        if ((_DWORD)v11 == (_DWORD)v3)
        {
          v12 = 0;
          goto LABEL_14;
        }
      }
      v12 = v16;
      if ((_DWORD)v6)
      {
LABEL_5:
        v13 = 1768189029;
        if ((_DWORD)PowerState != 1768189029)
        {
          do
          {
            v14 = asdtNextPowerState(PowerState, 1768189029);
            -[ASDTPMSequencer executeSequenceFromState:toState:](self, "executeSequenceFromState:toState:", PowerState, v14);
            PowerState = v14;
          }
          while ((_DWORD)v14 != 1768189029);
          v13 = 1768189029;
          v11 = 1768189029;
        }
        goto LABEL_13;
      }
    }
    v13 = PowerState;
LABEL_13:
    --v10;
    PowerState = v11;
    v11 = v13;
    if (v12 != 1920234105)
      goto LABEL_14;
  }
  v12 = 1920234105;
LABEL_14:
  -[ASDTPMSequencer parent](self, "parent");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "powerState");
  kdebug_trace();

  return v12;
}

- (int)executeSequenceToState:(int)a3
{
  NSObject *v5;
  int v6;
  _QWORD block[6];
  int v9;
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  int v13;

  v10 = 0;
  v11 = &v10;
  v12 = 0x2020000000;
  v13 = 0;
  -[ASDTPMSequencer pmSerialQueue](self, "pmSerialQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __42__ASDTPMSequencer_executeSequenceToState___block_invoke;
  block[3] = &unk_250842360;
  block[4] = self;
  block[5] = &v10;
  v9 = a3;
  dispatch_sync(v5, block);

  v6 = *((_DWORD *)v11 + 6);
  _Block_object_dispose(&v10, 8);
  return v6;
}

uint64_t __42__ASDTPMSequencer_executeSequenceToState___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "doExecuteSequenceToState:", *(unsigned int *)(a1 + 48));
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (id)pmDeviceWithName:(id)a3
{
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  void *i;
  void *v9;
  void *v10;
  char v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  -[ASDTPMSequencer pmDevicesPowerUp](self, "pmDevicesPowerUp", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (id)objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v14;
    while (2)
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(_QWORD *)v14 != v7)
          objc_enumerationMutation(v5);
        v9 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * (_QWORD)i);
        objc_msgSend(v9, "name");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = objc_msgSend(v10, "isEqualToString:", v4);

        if ((v11 & 1) != 0)
        {
          v6 = v9;
          goto LABEL_11;
        }
      }
      v6 = (id)objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      if (v6)
        continue;
      break;
    }
  }
LABEL_11:

  return v6;
}

- (ASDTAudioDevice)parentDevice
{
  return (ASDTAudioDevice *)objc_loadWeakRetained((id *)&self->_parentDevice);
}

- (void)setParentDevice:(id)a3
{
  objc_storeWeak((id *)&self->_parentDevice, a3);
}

- (NSArray)pmDevicesPowerUp
{
  return self->_pmDevicesPowerUp;
}

- (void)setPmDevicesPowerUp:(id)a3
{
  objc_storeStrong((id *)&self->_pmDevicesPowerUp, a3);
}

- (NSArray)pmDevicesPowerDown
{
  return self->_pmDevicesPowerDown;
}

- (void)setPmDevicesPowerDown:(id)a3
{
  objc_storeStrong((id *)&self->_pmDevicesPowerDown, a3);
}

- (OS_dispatch_queue)pmSerialQueue
{
  return self->_pmSerialQueue;
}

- (void)setPmSerialQueue:(id)a3
{
  objc_storeStrong((id *)&self->_pmSerialQueue, a3);
}

- (OS_dispatch_queue)pmConcurrentQueue
{
  return self->_pmConcurrentQueue;
}

- (void)setPmConcurrentQueue:(id)a3
{
  objc_storeStrong((id *)&self->_pmConcurrentQueue, a3);
}

- (ASDTPMProtocol)parent
{
  return (ASDTPMProtocol *)objc_loadWeakRetained((id *)&self->_parent);
}

- (void)setParent:(id)a3
{
  objc_storeWeak((id *)&self->_parent, a3);
}

- (NSMutableArray)mutablePMDevicesPowerUp
{
  return self->_mutablePMDevicesPowerUp;
}

- (void)setMutablePMDevicesPowerUp:(id)a3
{
  objc_storeStrong((id *)&self->_mutablePMDevicesPowerUp, a3);
}

- (NSMutableArray)mutablePMDevicesPowerDown
{
  return self->_mutablePMDevicesPowerDown;
}

- (void)setMutablePMDevicesPowerDown:(id)a3
{
  objc_storeStrong((id *)&self->_mutablePMDevicesPowerDown, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mutablePMDevicesPowerDown, 0);
  objc_storeStrong((id *)&self->_mutablePMDevicesPowerUp, 0);
  objc_destroyWeak((id *)&self->_parent);
  objc_storeStrong((id *)&self->_pmConcurrentQueue, 0);
  objc_storeStrong((id *)&self->_pmSerialQueue, 0);
  objc_storeStrong((id *)&self->_pmDevicesPowerDown, 0);
  objc_storeStrong((id *)&self->_pmDevicesPowerUp, 0);
  objc_destroyWeak((id *)&self->_parentDevice);
}

- (void)initWithPMDeviceConfig:(void *)a3 withParent:.cold.1(void *a1, uint64_t a2, void *a3)
{
  *(_DWORD *)a2 = 138412290;
  *(_QWORD *)(a2 + 4) = a1;
  OUTLINED_FUNCTION_0_3(&dword_236CEE000, MEMORY[0x24BDACB70], (uint64_t)a3, "%@: Failed creating dispatch queue.", (uint8_t *)a2);

  OUTLINED_FUNCTION_1_5();
}

- (void)initWithPMDeviceConfig:(uint64_t)a3 withParent:.cold.2(void *a1, uint64_t a2, uint64_t a3)
{
  *(_DWORD *)a2 = 138412290;
  *(_QWORD *)(a2 + 4) = a1;
  OUTLINED_FUNCTION_0_3(&dword_236CEE000, MEMORY[0x24BDACB70], a3, "%@: PM sequencer memory allocation error.", (uint8_t *)a2);

  OUTLINED_FUNCTION_1_5();
}

- (void)doAddPMDeviceWithConfig:(uint8_t *)buf .cold.1(void *a1, uint64_t a2, uint8_t *buf, void *a4)
{
  *(_DWORD *)buf = 138412546;
  *(_QWORD *)(buf + 4) = a1;
  *((_WORD *)buf + 6) = 2112;
  *(_QWORD *)(buf + 14) = a2;
  _os_log_error_impl(&dword_236CEE000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "%@: Error creating PM device for dictionary: %@", buf, 0x16u);

  OUTLINED_FUNCTION_1_5();
}

@end
