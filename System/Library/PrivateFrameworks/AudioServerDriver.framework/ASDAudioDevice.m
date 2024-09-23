@implementation ASDAudioDevice

- (BOOL)hasProperty:(const AudioObjectPropertyAddress *)a3
{
  signed int mSelector;
  int v4;
  unsigned __int16 v5;
  int v6;
  AudioObjectPropertyScope mScope;
  AudioObjectPropertyScope v8;
  NSObject *outputStreamQueue;
  _QWORD *v10;
  char v11;
  void *v13;
  unsigned __int8 v14;
  objc_super v15;
  _QWORD block[7];
  _QWORD v17[7];
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  char v21;

  v18 = 0;
  v19 = &v18;
  v20 = 0x2020000000;
  v21 = 0;
  if (!a3)
    goto LABEL_62;
  mSelector = a3->mSelector;
  if ((int)a3->mSelector <= 1818454125)
  {
    if (mSelector <= 1668575851)
    {
      if (mSelector > 1667658617)
      {
        if (mSelector > 1668050794)
        {
          if (mSelector == 1668050795)
            goto LABEL_61;
          v4 = 1668510818;
        }
        else
        {
          if (mSelector == 1667658618)
            goto LABEL_61;
          v4 = 1668049764;
        }
      }
      else
      {
        if (mSelector <= 1667330159)
        {
          if (mSelector != 1634429294)
          {
            v4 = 1635087471;
            goto LABEL_60;
          }
LABEL_61:
          v21 = 1;
          goto LABEL_62;
        }
        if (mSelector == 1667330160)
        {
          -[ASDAudioDevice configurationBundleID](self, "configurationBundleID");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          *((_BYTE *)v19 + 24) = v13 != 0;

          goto LABEL_62;
        }
        v4 = 1667523955;
      }
LABEL_60:
      if (mSelector == v4)
        goto LABEL_61;
LABEL_64:
      v15.receiver = self;
      v15.super_class = (Class)ASDAudioDevice;
      v14 = -[ASDObject hasProperty:](&v15, sel_hasProperty_);
      *((_BYTE *)v19 + 24) = v14;
      goto LABEL_62;
    }
    if (mSelector <= 1685222500)
    {
      if (mSelector > 1684301170)
      {
        if (mSelector == 1684301171)
          goto LABEL_61;
        v4 = 1684434036;
        goto LABEL_60;
      }
      if (mSelector == 1668575852)
        goto LABEL_61;
      v6 = 1684236338;
      goto LABEL_27;
    }
    if (mSelector <= 1751737453)
    {
      if (mSelector == 1685222501)
        goto LABEL_61;
      v4 = 1735354734;
      goto LABEL_60;
    }
    if (mSelector == 1751737454)
      goto LABEL_61;
    v5 = 25454;
    goto LABEL_53;
  }
  if (mSelector > 1853059699)
  {
    if (mSelector > 1936879203)
    {
      if (mSelector > 1953653101)
      {
        if (mSelector == 1969841184)
          goto LABEL_61;
        v4 = 1953653102;
        goto LABEL_60;
      }
      if (mSelector != 1936879204)
      {
        v4 = 1937009955;
        goto LABEL_60;
      }
    }
    else
    {
      if (mSelector <= 1935763059)
      {
        if (mSelector == 1853059700)
          goto LABEL_61;
        v4 = 1919512167;
        goto LABEL_60;
      }
      if (mSelector != 1935763060)
      {
        v4 = 1936092276;
        goto LABEL_60;
      }
    }
    goto LABEL_43;
  }
  if (mSelector > 1819173228)
  {
    if (mSelector > 1836411235)
    {
      if (mSelector == 1836411236)
        goto LABEL_61;
      v4 = 1853059619;
      goto LABEL_60;
    }
    if (mSelector == 1819173229)
      goto LABEL_61;
    v6 = 1819569763;
LABEL_27:
    if (mSelector != v6)
      goto LABEL_64;
LABEL_43:
    mScope = a3->mScope;
    if ((mScope == 1869968496 || mScope == 1768845428) && !a3->mElement)
      goto LABEL_61;
    goto LABEL_62;
  }
  if (mSelector > 1818850925)
  {
    if (mSelector == 1818850926)
      goto LABEL_61;
    v4 = 1819107691;
    goto LABEL_60;
  }
  if (mSelector != 1818454126)
  {
    v5 = 28270;
LABEL_53:
    if (mSelector != (v5 | 0x6C630000))
      goto LABEL_64;
  }
  if (a3->mElement)
  {
    v8 = a3->mScope;
    if (v8 == 1869968496)
    {
      outputStreamQueue = self->_outputStreamQueue;
      block[0] = MEMORY[0x24BDAC760];
      block[1] = 3221225472;
      block[2] = __30__ASDAudioDevice_hasProperty___block_invoke_2;
      block[3] = &unk_24DBCA578;
      block[4] = self;
      block[5] = &v18;
      block[6] = a3;
      v10 = block;
    }
    else
    {
      if (v8 != 1768845428)
        goto LABEL_62;
      outputStreamQueue = self->_inputStreamQueue;
      v17[0] = MEMORY[0x24BDAC760];
      v17[1] = 3221225472;
      v17[2] = __30__ASDAudioDevice_hasProperty___block_invoke;
      v17[3] = &unk_24DBCA578;
      v17[4] = self;
      v17[5] = &v18;
      v17[6] = a3;
      v10 = v17;
    }
    dispatch_sync(outputStreamQueue, v10);
  }
LABEL_62:
  v11 = *((_BYTE *)v19 + 24);
  _Block_object_dispose(&v18, 8);
  return v11;
}

- (BOOL)getProperty:(const AudioObjectPropertyAddress *)a3 withQualifierSize:(unsigned int)a4 qualifierData:(const void *)a5 dataSize:(unsigned int *)a6 andData:(void *)a7 forClient:(int)a8
{
  uint64_t v10;
  uint64_t v12;
  signed int mSelector;
  AudioObjectPropertyScope v16;
  NSObject *outputStreamQueue;
  _QWORD *v18;
  void *v19;
  const void *v20;
  unsigned int v21;
  void *v22;
  void *v23;
  char isKindOfClass;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  AudioObjectPropertyScope v29;
  BOOL v30;
  uint64_t v31;
  NSObject *v32;
  unsigned int v33;
  unsigned int v34;
  unsigned int v35;
  void *v36;
  AudioObjectPropertyScope v37;
  unsigned int v38;
  AudioObjectPropertyScope v39;
  unint64_t v40;
  AudioObjectPropertyScope v41;
  uint64_t v42;
  uint64_t v43;
  NSObject *inputStreamQueue;
  void *v45;
  char v46;
  AudioObjectPropertyScope mScope;
  unsigned __int8 v48;
  AudioObjectPropertyScope v49;
  unsigned int v50;
  unsigned int v51;
  void *v52;
  BOOL v53;
  void *v54;
  void *v55;
  void *v56;
  unint64_t v57;
  unint64_t v58;
  unsigned __int8 v59;
  AudioObjectPropertyScope v60;
  NSObject *v61;
  id v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t i;
  uint64_t v67;
  unsigned int v68;
  unsigned int v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  AudioObjectPropertyScope v73;
  NSObject *v74;
  AudioObjectPropertyScope v75;
  NSObject *v76;
  NSObject *v77;
  uint64_t v78;
  NSObject *controlQueue;
  char v80;
  objc_super v82;
  _QWORD v83[9];
  _QWORD v84[9];
  _QWORD v85[9];
  _QWORD v86[9];
  _QWORD v87[9];
  _QWORD v88[9];
  _QWORD v89[9];
  _QWORD v90[8];
  _QWORD v91[8];
  _QWORD v92[10];
  unsigned int v93;
  __int128 v94;
  __int128 v95;
  __int128 v96;
  __int128 v97;
  _QWORD block[9];
  _QWORD v99[8];
  _QWORD v100[8];
  uint64_t v101;
  uint64_t *v102;
  uint64_t v103;
  uint64_t v104;
  int v105;
  objc_super v106;
  uint64_t v107;
  uint64_t *v108;
  uint64_t v109;
  char v110;
  _BYTE v111[128];
  uint64_t v112;

  v112 = *MEMORY[0x24BDAC8D0];
  v107 = 0;
  v108 = &v107;
  v109 = 0x2020000000;
  v110 = 0;
  if (!a3 || !a6 || !a7)
    goto LABEL_214;
  v10 = *(_QWORD *)&a8;
  v12 = *(_QWORD *)&a4;
  mSelector = a3->mSelector;
  if ((int)a3->mSelector > 1818455661)
  {
    if (mSelector <= 1870098019)
    {
      if (mSelector <= 1819569762)
      {
        if (mSelector <= 1819107690)
        {
          if (mSelector == 1818455662)
          {
            if (*a6 >= 8 && a3->mElement)
            {
              mScope = a3->mScope;
              if (mScope == 1869968496)
              {
                outputStreamQueue = self->_outputStreamQueue;
                v83[0] = MEMORY[0x24BDAC760];
                v83[1] = 3221225472;
                v83[2] = __89__ASDAudioDevice_getProperty_withQualifierSize_qualifierData_dataSize_andData_forClient___block_invoke_15;
                v83[3] = &unk_24DBCA5C8;
                v83[6] = a3;
                v83[7] = a7;
                v83[8] = a6;
                v83[4] = self;
                v83[5] = &v107;
                v18 = v83;
                goto LABEL_208;
              }
              if (mScope == 1768845428)
              {
                outputStreamQueue = self->_inputStreamQueue;
                v84[0] = MEMORY[0x24BDAC760];
                v84[1] = 3221225472;
                v84[2] = __89__ASDAudioDevice_getProperty_withQualifierSize_qualifierData_dataSize_andData_forClient___block_invoke_14;
                v84[3] = &unk_24DBCA5C8;
                v84[6] = a3;
                v84[7] = a7;
                v84[8] = a6;
                v84[4] = self;
                v84[5] = &v107;
                v18 = v84;
                goto LABEL_208;
              }
            }
            goto LABEL_214;
          }
          if (mSelector == 1818850926)
          {
            if (*a6 >= 4)
            {
              *(_DWORD *)a7 = self->_isAlive;
              *a6 = 4;
              v110 = 1;
            }
            goto LABEL_214;
          }
          goto LABEL_158;
        }
        if (mSelector == 1819107691)
        {
          if (*a6 < 8)
            goto LABEL_214;
          -[ASDAudioDevice manufacturerName](self, "manufacturerName");
          v55 = (void *)objc_claimAutoreleasedReturnValue();
          *(_QWORD *)a7 = v55;

          v20 = *(const void **)a7;
          if (!*(_QWORD *)a7)
            goto LABEL_153;
        }
        else
        {
          if (mSelector != 1819173229)
            goto LABEL_158;
          if (*a6 < 8)
            goto LABEL_214;
          -[ASDAudioDevice deviceName](self, "deviceName");
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          *(_QWORD *)a7 = v28;

          v20 = *(const void **)a7;
          if (!*(_QWORD *)a7)
            goto LABEL_153;
        }
        goto LABEL_152;
      }
      if (mSelector > 1853059618)
      {
        if (mSelector == 1853059619)
        {
          -[ASDAudioDevice samplingRates](self, "samplingRates");
          v56 = (void *)objc_claimAutoreleasedReturnValue();
          v57 = *a6;
          if (objc_msgSend(v56, "count") <= v57 >> 4)
            v58 = objc_msgSend(v56, "count");
          else
            v58 = (unint64_t)*a6 >> 4;
          v96 = 0u;
          v97 = 0u;
          v94 = 0u;
          v95 = 0u;
          v62 = v56;
          v63 = 0;
          v64 = objc_msgSend(v62, "countByEnumeratingWithState:objects:count:", &v94, v111, 16);
          if (v64)
          {
            v65 = *(_QWORD *)v95;
            while (2)
            {
              for (i = 0; i != v64; ++i)
              {
                if (*(_QWORD *)v95 != v65)
                  objc_enumerationMutation(v62);
                if (v58 == v63)
                {
                  LODWORD(v63) = v58;
                  goto LABEL_174;
                }
                objc_msgSend(*(id *)(*((_QWORD *)&v94 + 1) + 8 * i), "doubleValue");
                *((int64x2_t *)a7 + v63++) = vdupq_lane_s64(v67, 0);
              }
              v64 = objc_msgSend(v62, "countByEnumeratingWithState:objects:count:", &v94, v111, 16);
              if (v64)
                continue;
              break;
            }
          }
LABEL_174:

          *a6 = 16 * v63;
          *((_BYTE *)v108 + 24) = 1;

          goto LABEL_214;
        }
        if (mSelector != 1853059700)
          goto LABEL_158;
        if (*a6 < 8)
          goto LABEL_214;
        -[ASDAudioDevice samplingRate](self, "samplingRate");
        *(_QWORD *)a7 = v31;
        goto LABEL_153;
      }
      if (mSelector != 1819569763)
      {
        if (mSelector != 1836411236)
          goto LABEL_158;
        if (*a6 < 8)
          goto LABEL_214;
        -[ASDAudioDevice modelUID](self, "modelUID");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        *(_QWORD *)a7 = v22;

        v20 = *(const void **)a7;
        if (!*(_QWORD *)a7)
          goto LABEL_153;
        goto LABEL_152;
      }
      if (*a6 < 4)
        goto LABEL_214;
      v49 = a3->mScope;
      if (v49 == 1869968496)
        goto LABEL_182;
      if (v49 == 1768845428)
        goto LABEL_140;
      if (v49 != 1735159650)
        goto LABEL_211;
      v50 = -[ASDAudioDevice inputLatency](self, "inputLatency");
      if (v50 <= -[ASDAudioDevice outputLatency](self, "outputLatency"))
LABEL_182:
        v21 = -[ASDAudioDevice outputLatency](self, "outputLatency");
      else
LABEL_140:
        v21 = -[ASDAudioDevice inputLatency](self, "inputLatency");
    }
    else
    {
      if (mSelector > 1936879203)
      {
        if (mSelector <= 1937009954)
        {
          if (mSelector != 1936879204)
          {
            if (mSelector != 1937007734)
              goto LABEL_158;
            if (*a6 < 4)
              goto LABEL_214;
            *a6 = 4;
            -[ASDObject owner](self, "owner");
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            objc_opt_class();
            isKindOfClass = objc_opt_isKindOfClass();

            if ((isKindOfClass & 1) != 0)
            {
              -[ASDObject owner](self, "owner");
              v25 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v25, "owner");
              v26 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)a7 = objc_msgSend(v26, "objectID");

            }
            else
            {
              -[ASDObject plugin](self, "plugin");
              v25 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)a7 = objc_msgSend(v25, "objectID");
            }

LABEL_213:
            *((_BYTE *)v108 + 24) = 1;
            goto LABEL_214;
          }
          if (-[ASDAudioDevice channelLayoutTagForScope:](self, "channelLayoutTagForScope:", a3->mScope))
          {
            if (*a6 < 0xC)
              goto LABEL_214;
            *(_DWORD *)a7 = -[ASDAudioDevice channelLayoutTagForScope:](self, "channelLayoutTagForScope:", a3->mScope);
            *(_QWORD *)((char *)a7 + 4) = -[ASDAudioDevice channelLayoutBitmapForScope:](self, "channelLayoutBitmapForScope:", a3->mScope);
            v51 = 12;
          }
          else
          {
            v70 = -[ASDAudioDevice numberOfChannelsInLayoutForScope:](self, "numberOfChannelsInLayoutForScope:", a3->mScope);
            if (20 * (unint64_t)v70 + 12 > *a6)
              goto LABEL_214;
            *(_QWORD *)a7 = 0;
            *((_DWORD *)a7 + 2) = -[ASDAudioDevice numberOfChannelsInLayoutForScope:](self, "numberOfChannelsInLayoutForScope:", a3->mScope);
            -[ASDAudioDevice preferredChannelDescriptions:numberOfChannels:forScope:](self, "preferredChannelDescriptions:numberOfChannels:forScope:", (char *)a7 + 12, v70, a3->mScope);
            v51 = 20 * *((_DWORD *)a7 + 2) + 12;
          }
LABEL_212:
          *a6 = v51;
          goto LABEL_213;
        }
        if (mSelector == 1937009955)
        {
          v101 = 0;
          v102 = &v101;
          v103 = 0x2020000000;
          v104 = 0;
          v40 = (unint64_t)*a6 >> 2;
          v41 = a3->mScope;
          v42 = MEMORY[0x24BDAC760];
          if (v41 == 1768845428 || (v43 = 0, v41 == 1735159650))
          {
            inputStreamQueue = self->_inputStreamQueue;
            v100[0] = MEMORY[0x24BDAC760];
            v100[1] = 3221225472;
            v100[2] = __89__ASDAudioDevice_getProperty_withQualifierSize_qualifierData_dataSize_andData_forClient___block_invoke;
            v100[3] = &unk_24DBCA3C0;
            v100[4] = self;
            v100[5] = &v101;
            v100[6] = v40;
            v100[7] = a7;
            dispatch_sync(inputStreamQueue, v100);
            v43 = v102[3];
          }
          if (v43 == v40)
          {
            LODWORD(v43) = v40;
          }
          else
          {
            v60 = a3->mScope;
            if (v60 == 1869968496 || v60 == 1735159650)
            {
              v61 = self->_outputStreamQueue;
              v99[0] = v42;
              v99[1] = 3221225472;
              v99[2] = __89__ASDAudioDevice_getProperty_withQualifierSize_qualifierData_dataSize_andData_forClient___block_invoke_2;
              v99[3] = &unk_24DBCA3C0;
              v99[4] = self;
              v99[5] = &v101;
              v99[6] = v40;
              v99[7] = a7;
              dispatch_sync(v61, v99);
              v43 = v102[3];
            }
          }
          v33 = 4 * v43;
          goto LABEL_204;
        }
        if (mSelector == 1953653102)
        {
          if (*a6 < 4)
            goto LABEL_214;
          v21 = -[ASDAudioDevice transportType](self, "transportType");
          goto LABEL_210;
        }
        if (mSelector != 1969841184)
          goto LABEL_158;
        if (*a6 < 8)
          goto LABEL_214;
        -[ASDAudioDevice deviceUID](self, "deviceUID");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        *(_QWORD *)a7 = v19;

        v20 = *(const void **)a7;
        if (!*(_QWORD *)a7)
          goto LABEL_153;
        goto LABEL_152;
      }
      if (mSelector <= 1935763059)
      {
        if (mSelector != 1870098020)
        {
          if (mSelector != 1919512167)
            goto LABEL_158;
          if (*a6 < 4)
            goto LABEL_214;
          v21 = -[ASDAudioDevice timestampPeriod](self, "timestampPeriod");
          goto LABEL_210;
        }
        if (a4)
        {
          if ((a4 & 3) != 0)
            goto LABEL_214;
          v101 = 0;
          v102 = &v101;
          v103 = 0x2020000000;
          v104 = 0;
          v34 = *a6;
          if (v34 >= -[ASDAudioDevice dataSizeForProperty:withQualifierSize:andQualifierData:](self, "dataSizeForProperty:withQualifierSize:andQualifierData:", a3, *(_QWORD *)&a4, a5))v35 = -[ASDAudioDevice dataSizeForProperty:withQualifierSize:andQualifierData:](self, "dataSizeForProperty:withQualifierSize:andQualifierData:", a3, v12, a5);
          else
            v35 = *a6;
          v78 = v35 >> 2;
          if (v102[3] != v78)
          {
            controlQueue = self->_controlQueue;
            v92[0] = MEMORY[0x24BDAC760];
            v92[1] = 3221225472;
            v92[2] = __89__ASDAudioDevice_getProperty_withQualifierSize_qualifierData_dataSize_andData_forClient___block_invoke_6;
            v92[3] = &unk_24DBCA5F0;
            v93 = v12 >> 2;
            v92[6] = a5;
            v92[7] = a3;
            v92[4] = self;
            v92[5] = &v101;
            v92[8] = v78;
            v92[9] = a7;
            dispatch_sync(controlQueue, v92);
            LODWORD(v78) = *((_DWORD *)v102 + 6);
          }
          v33 = 4 * v78;
        }
        else
        {
          v101 = 0;
          v102 = &v101;
          v103 = 0x2020000000;
          v104 = 0;
          v68 = *a6;
          if (v68 >= -[ASDAudioDevice dataSizeForProperty:withQualifierSize:andQualifierData:](self, "dataSizeForProperty:withQualifierSize:andQualifierData:", a3, 0, a5))v69 = -[ASDAudioDevice dataSizeForProperty:withQualifierSize:andQualifierData:](self, "dataSizeForProperty:withQualifierSize:andQualifierData:", a3, 0, a5);
          else
            v69 = *a6;
          v71 = v69 >> 2;
          v72 = v102[3];
          if (v72 != v71)
          {
            v73 = a3->mScope;
            if (v73 == 1768845428 || v73 == 1735159650)
            {
              v74 = self->_inputStreamQueue;
              v91[0] = MEMORY[0x24BDAC760];
              v91[1] = 3221225472;
              v91[2] = __89__ASDAudioDevice_getProperty_withQualifierSize_qualifierData_dataSize_andData_forClient___block_invoke_7;
              v91[3] = &unk_24DBCA3C0;
              v91[4] = self;
              v91[5] = &v101;
              v91[6] = v71;
              v91[7] = a7;
              dispatch_sync(v74, v91);
              v72 = v102[3];
            }
            if (v72 != v71)
            {
              v75 = a3->mScope;
              if (v75 == 1869968496 || v75 == 1735159650)
              {
                v76 = self->_outputStreamQueue;
                v90[0] = MEMORY[0x24BDAC760];
                v90[1] = 3221225472;
                v90[2] = __89__ASDAudioDevice_getProperty_withQualifierSize_qualifierData_dataSize_andData_forClient___block_invoke_8;
                v90[3] = &unk_24DBCA3C0;
                v90[4] = self;
                v90[5] = &v101;
                v90[6] = v71;
                v90[7] = a7;
                dispatch_sync(v76, v90);
                v72 = v102[3];
              }
              if (v72 != v71)
              {
                v77 = self->_controlQueue;
                v89[0] = MEMORY[0x24BDAC760];
                v89[1] = 3221225472;
                v89[2] = __89__ASDAudioDevice_getProperty_withQualifierSize_qualifierData_dataSize_andData_forClient___block_invoke_9;
                v89[3] = &unk_24DBCA5C8;
                v89[4] = self;
                v89[5] = &v101;
                v89[6] = a3;
                v89[7] = v71;
                v89[8] = a7;
                dispatch_sync(v77, v89);
                LODWORD(v71) = *((_DWORD *)v102 + 6);
              }
            }
          }
          v33 = 4 * v71;
        }
        goto LABEL_204;
      }
      if (mSelector != 1935763060)
      {
        if (mSelector != 1936092276)
          goto LABEL_158;
        if (*a6 < 4)
          goto LABEL_214;
        v21 = -[ASDAudioDevice canBeDefaultSystemDevice](self, "canBeDefaultSystemDevice");
        goto LABEL_210;
      }
      if (*a6 < 4)
        goto LABEL_214;
      v37 = a3->mScope;
      if (v37 == 1869968496)
        goto LABEL_181;
      if (v37 == 1768845428)
        goto LABEL_110;
      if (v37 != 1735159650)
        goto LABEL_211;
      v38 = -[ASDAudioDevice inputSafetyOffset](self, "inputSafetyOffset");
      if (v38 <= -[ASDAudioDevice outputSafetyOffset](self, "outputSafetyOffset"))
LABEL_181:
        v21 = -[ASDAudioDevice outputSafetyOffset](self, "outputSafetyOffset");
      else
LABEL_110:
        v21 = -[ASDAudioDevice inputSafetyOffset](self, "inputSafetyOffset");
    }
LABEL_210:
    *(_DWORD *)a7 = v21;
    goto LABEL_211;
  }
  if (mSelector <= 1668575851)
  {
    if (mSelector > 1667658617)
    {
      if (mSelector > 1668050794)
      {
        if (mSelector == 1668050795)
        {
          if (*a6 < 4)
            goto LABEL_214;
          v21 = -[ASDAudioDevice clockAlgorithm](self, "clockAlgorithm");
        }
        else
        {
          if (mSelector != 1668510818)
            goto LABEL_158;
          if (*a6 < 4)
            goto LABEL_214;
          v21 = -[ASDAudioDevice clockIsStable](self, "clockIsStable");
        }
      }
      else if (mSelector == 1667658618)
      {
        if (a4 < 4)
          goto LABEL_214;
        if (*a6 < 4)
          goto LABEL_214;
        v106.receiver = self;
        v106.super_class = (Class)ASDAudioDevice;
        v48 = -[ASDObject getProperty:withQualifierSize:qualifierData:dataSize:andData:forClient:](&v106, sel_getProperty_withQualifierSize_qualifierData_dataSize_andData_forClient_, a3, *(_QWORD *)&a4, a5, a6, a7, *(_QWORD *)&a8);
        *((_BYTE *)v108 + 24) = v48;
        if ((v48 & 1) != 0)
          goto LABEL_214;
        v21 = -[ASDAudioDevice calculateIOBufferFrameSize:](self, "calculateIOBufferFrameSize:", *(unsigned int *)a5);
      }
      else
      {
        if (mSelector != 1668049764)
          goto LABEL_158;
        if (*a6 < 4)
          goto LABEL_214;
        v21 = -[ASDAudioDevice clockDomain](self, "clockDomain");
      }
      goto LABEL_210;
    }
    if (mSelector <= 1667330159)
    {
      if (mSelector == 1634429294)
      {
        v105 = 1633969526;
        v101 = *(_QWORD *)&a3->mSelector;
        LODWORD(v102) = a3->mElement;
        LODWORD(v101) = 1870098020;
        -[ASDObject owner](self, "owner");
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        v46 = objc_msgSend(v45, "getProperty:withQualifierSize:qualifierData:dataSize:andData:forClient:", &v101, 4, &v105, a6, a7, v10);
        *((_BYTE *)v108 + 24) = v46;

        goto LABEL_214;
      }
      if (mSelector != 1635087471)
        goto LABEL_158;
      if (*a6 < 4)
        goto LABEL_214;
      v21 = -[ASDAudioDevice allowAutoRoute](self, "allowAutoRoute");
      goto LABEL_210;
    }
    if (mSelector == 1667330160)
    {
      if (*a6 < 8)
        goto LABEL_214;
      -[ASDAudioDevice configurationBundleID](self, "configurationBundleID");
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      v53 = v52 == 0;

      if (v53)
        goto LABEL_214;
      -[ASDAudioDevice configurationBundleID](self, "configurationBundleID");
      v54 = (void *)objc_claimAutoreleasedReturnValue();
      *(_QWORD *)a7 = v54;

      v20 = *(const void **)a7;
      if (!*(_QWORD *)a7)
        goto LABEL_153;
    }
    else
    {
      if (mSelector != 1667523955)
        goto LABEL_158;
      if (*a6 < 8)
        goto LABEL_214;
      -[ASDAudioDevice clientDescription](self, "clientDescription");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      *(_QWORD *)a7 = v27;

      v20 = *(const void **)a7;
      if (!*(_QWORD *)a7)
        goto LABEL_153;
    }
    goto LABEL_152;
  }
  if (mSelector <= 1685222500)
  {
    if (mSelector <= 1684301170)
    {
      if (mSelector != 1668575852)
      {
        if (mSelector != 1684236338)
          goto LABEL_158;
        if (*a6 < 8)
          goto LABEL_214;
        -[ASDAudioDevice preferredChannelsForLeft:andRight:](self, "preferredChannelsForLeft:andRight:", a7, (char *)a7 + 4);
        goto LABEL_153;
      }
      v101 = 0;
      v102 = &v101;
      v103 = 0x2020000000;
      v32 = self->_controlQueue;
      v104 = 0;
      block[0] = MEMORY[0x24BDAC760];
      block[1] = 3221225472;
      block[2] = __89__ASDAudioDevice_getProperty_withQualifierSize_qualifierData_dataSize_andData_forClient___block_invoke_3;
      block[3] = &unk_24DBCA5C8;
      block[6] = a6;
      block[7] = a3;
      block[4] = self;
      block[5] = &v101;
      block[8] = a7;
      dispatch_sync(v32, block);
      v33 = 4 * *((_DWORD *)v102 + 6);
LABEL_204:
      *a6 = v33;
      *((_BYTE *)v108 + 24) = 1;
      _Block_object_dispose(&v101, 8);
      goto LABEL_214;
    }
    if (mSelector != 1684301171)
    {
      if (mSelector != 1684434036)
        goto LABEL_158;
      if (*a6 < 4)
        goto LABEL_214;
      v29 = a3->mScope;
      switch(v29)
      {
        case 0x6F757470u:
          v30 = -[ASDAudioDevice canBeDefaultDevice](self, "canBeDefaultDevice");
          goto LABEL_196;
        case 0x696E7074u:
          if (!-[ASDAudioDevice canBeDefaultDevice](self, "canBeDefaultDevice"))
          {
            v21 = -[ASDAudioDevice canBeDefaultInputDevice](self, "canBeDefaultInputDevice");
            goto LABEL_210;
          }
          goto LABEL_199;
        case 0x676C6F62u:
          if (-[ASDAudioDevice canBeDefaultDevice](self, "canBeDefaultDevice"))
            goto LABEL_199;
          v30 = -[ASDAudioDevice canBeDefaultInputDevice](self, "canBeDefaultInputDevice");
LABEL_196:
          if (!v30)
          {
            v21 = -[ASDAudioDevice canBeDefaultOutputDevice](self, "canBeDefaultOutputDevice");
            goto LABEL_210;
          }
LABEL_199:
          v21 = 1;
          goto LABEL_210;
      }
LABEL_211:
      v51 = 4;
      goto LABEL_212;
    }
    if (*a6 < 8)
      goto LABEL_214;
    -[ASDAudioDevice deviceDescription](self, "deviceDescription");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    *(_QWORD *)a7 = v36;

    v20 = *(const void **)a7;
    if (!*(_QWORD *)a7)
    {
LABEL_153:
      v51 = 8;
      goto LABEL_212;
    }
LABEL_152:
    CFRetain(v20);
    goto LABEL_153;
  }
  if (mSelector <= 1751737453)
  {
    if (mSelector == 1685222501)
    {
      if (*a6 < 4)
        goto LABEL_214;
      v21 = -[ASDAudioDevice wantsDisplayRouting](self, "wantsDisplayRouting");
    }
    else
    {
      if (mSelector != 1735354734)
        goto LABEL_158;
      if (*a6 < 4)
        goto LABEL_214;
      v21 = -[ASDAudioDevice isRunning](self, "isRunning");
    }
    goto LABEL_210;
  }
  if (mSelector == 1751737454)
  {
    if (*a6 < 4)
      goto LABEL_214;
    v21 = -[ASDAudioDevice isHidden](self, "isHidden");
    goto LABEL_210;
  }
  if (mSelector != 1818452846)
  {
    if (mSelector == 1818454126)
    {
      if (*a6 >= 8 && a3->mElement)
      {
        v16 = a3->mScope;
        if (v16 == 1869968496)
        {
          outputStreamQueue = self->_outputStreamQueue;
          v87[0] = MEMORY[0x24BDAC760];
          v87[1] = 3221225472;
          v87[2] = __89__ASDAudioDevice_getProperty_withQualifierSize_qualifierData_dataSize_andData_forClient___block_invoke_11;
          v87[3] = &unk_24DBCA5C8;
          v87[6] = a3;
          v87[7] = a7;
          v87[8] = a6;
          v87[4] = self;
          v87[5] = &v107;
          v18 = v87;
          goto LABEL_208;
        }
        if (v16 == 1768845428)
        {
          outputStreamQueue = self->_inputStreamQueue;
          v88[0] = MEMORY[0x24BDAC760];
          v88[1] = 3221225472;
          v88[2] = __89__ASDAudioDevice_getProperty_withQualifierSize_qualifierData_dataSize_andData_forClient___block_invoke_10;
          v88[3] = &unk_24DBCA5C8;
          v88[6] = a3;
          v88[7] = a7;
          v88[8] = a6;
          v88[4] = self;
          v88[5] = &v107;
          v18 = v88;
LABEL_208:
          dispatch_sync(outputStreamQueue, v18);
          goto LABEL_214;
        }
      }
      goto LABEL_214;
    }
LABEL_158:
    v82.receiver = self;
    v82.super_class = (Class)ASDAudioDevice;
    v59 = -[ASDObject getProperty:withQualifierSize:qualifierData:dataSize:andData:forClient:](&v82, sel_getProperty_withQualifierSize_qualifierData_dataSize_andData_forClient_, a3, *(_QWORD *)&a4, a5, a6, a7, *(_QWORD *)&a8);
    *((_BYTE *)v108 + 24) = v59;
    goto LABEL_214;
  }
  if (*a6 >= 8 && a3->mElement)
  {
    v39 = a3->mScope;
    if (v39 == 1869968496)
    {
      outputStreamQueue = self->_outputStreamQueue;
      v85[0] = MEMORY[0x24BDAC760];
      v85[1] = 3221225472;
      v85[2] = __89__ASDAudioDevice_getProperty_withQualifierSize_qualifierData_dataSize_andData_forClient___block_invoke_13;
      v85[3] = &unk_24DBCA5C8;
      v85[6] = a3;
      v85[7] = a7;
      v85[8] = a6;
      v85[4] = self;
      v85[5] = &v107;
      v18 = v85;
      goto LABEL_208;
    }
    if (v39 == 1768845428)
    {
      outputStreamQueue = self->_inputStreamQueue;
      v86[0] = MEMORY[0x24BDAC760];
      v86[1] = 3221225472;
      v86[2] = __89__ASDAudioDevice_getProperty_withQualifierSize_qualifierData_dataSize_andData_forClient___block_invoke_12;
      v86[3] = &unk_24DBCA5C8;
      v86[6] = a3;
      v86[7] = a7;
      v86[8] = a6;
      v86[4] = self;
      v86[5] = &v107;
      v18 = v86;
      goto LABEL_208;
    }
  }
LABEL_214:
  v80 = *((_BYTE *)v108 + 24);
  _Block_object_dispose(&v107, 8);
  return v80;
}

- (BOOL)isHidden
{
  return self->_hidden;
}

- (ASDAudioDevice)initWithPlugin:(id)a3
{
  void *v4;
  uint64_t v5;
  void *v6;

  v4 = (void *)MEMORY[0x24BDBCE88];
  v5 = *MEMORY[0x24BDBCAB8];
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[ASDAudioDevice initWithPlugin:]");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "raise:format:", v5, CFSTR("Do not call %@"), v6);

  return 0;
}

- (ASDAudioDevice)initWithDeviceUID:(id)a3 withPlugin:(id)a4
{
  id v7;
  id v8;
  ASDAudioDevice *v9;
  ASDAudioDevice *v10;
  NSString **p_deviceUID;
  void *v12;
  void *v13;
  NSMutableArray *v14;
  NSMutableArray *inputStreams;
  id v16;
  dispatch_queue_t v17;
  OS_dispatch_queue *inputStreamQueue;
  NSMutableArray *v19;
  NSMutableArray *outputStreams;
  id v21;
  dispatch_queue_t v22;
  OS_dispatch_queue *outputStreamQueue;
  NSMutableArray *v24;
  NSMutableArray *controls;
  id v26;
  dispatch_queue_t v27;
  OS_dispatch_queue *controlQueue;
  NSArray *v29;
  NSArray *samplingRates;
  id v31;
  dispatch_queue_t v32;
  OS_dispatch_queue *sampleRateQueue;
  id v34;
  dispatch_queue_t v35;
  OS_dispatch_queue *ioReferenceQueue;
  NSDictionary *clientDescription;
  NSDictionary *v38;
  NSDictionary *deviceDescription;
  objc_super v41;

  v7 = a3;
  v8 = a4;
  v41.receiver = self;
  v41.super_class = (Class)ASDAudioDevice;
  v9 = -[ASDObject initWithPlugin:](&v41, sel_initWithPlugin_, v8);
  v10 = v9;
  if (v9)
  {
    v9->_isAlive = 1;
    v9->_transportType = 0;
    v9->_clockAlgorithm = 1768518246;
    v9->_clockIsStable = 1;
    v9->_allowAutoRoute = 1;
    v9->_wantsDisplayRouting = 0;
    p_deviceUID = &v9->_deviceUID;
    objc_storeStrong((id *)&v9->_deviceUID, a3);
    objc_storeWeak((id *)&v10->_configurationChangeDelegate, v8);
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "bundleIdentifier");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    inputStreams = v10->_inputStreams;
    v10->_inputStreams = v14;

    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@.device.%@.inputStreams"), v13, *p_deviceUID);
    v16 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v17 = dispatch_queue_create((const char *)objc_msgSend(v16, "UTF8String"), 0);
    inputStreamQueue = v10->_inputStreamQueue;
    v10->_inputStreamQueue = (OS_dispatch_queue *)v17;

    v19 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    outputStreams = v10->_outputStreams;
    v10->_outputStreams = v19;

    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@.device.%@.outputStreams"), v13, *p_deviceUID);
    v21 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v22 = dispatch_queue_create((const char *)objc_msgSend(v21, "UTF8String"), 0);
    outputStreamQueue = v10->_outputStreamQueue;
    v10->_outputStreamQueue = (OS_dispatch_queue *)v22;

    v24 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    controls = v10->_controls;
    v10->_controls = v24;

    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@.device.%@.controls"), v13, *p_deviceUID);
    v26 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v27 = dispatch_queue_create((const char *)objc_msgSend(v26, "UTF8String"), 0);
    controlQueue = v10->_controlQueue;
    v10->_controlQueue = (OS_dispatch_queue *)v27;

    v29 = (NSArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    samplingRates = v10->_samplingRates;
    v10->_samplingRates = v29;

    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@.device.%@.sampleRate"), v13, *p_deviceUID);
    v31 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v32 = dispatch_queue_create((const char *)objc_msgSend(v31, "UTF8String"), 0);
    sampleRateQueue = v10->_sampleRateQueue;
    v10->_sampleRateQueue = (OS_dispatch_queue *)v32;

    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@.device.%@.ioReference"), v13, *p_deviceUID);
    v34 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v35 = dispatch_queue_create((const char *)objc_msgSend(v34, "UTF8String"), 0);
    ioReferenceQueue = v10->_ioReferenceQueue;
    v10->_ioReferenceQueue = (OS_dispatch_queue *)v35;

    clientDescription = v10->_clientDescription;
    v10->_clientDescription = (NSDictionary *)&unk_24DBD4728;

    v38 = (NSDictionary *)objc_alloc_init(MEMORY[0x24BDBCE70]);
    deviceDescription = v10->_deviceDescription;
    v10->_deviceDescription = v38;

    -[ASDObject setupDiagnosticStateDumpHandlerWithTreeWalk:](v10, "setupDiagnosticStateDumpHandlerWithTreeWalk:", 1);
  }

  return v10;
}

- (unsigned)objectClass
{
  return 1633969526;
}

void __30__ASDAudioDevice_hasProperty___block_invoke(_QWORD *a1)
{
  void *v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  unsigned int v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v2 = (void *)MEMORY[0x22073330C]();
  if (objc_msgSend(*(id *)(a1[4] + 64), "count"))
  {
    v12 = 0u;
    v13 = 0u;
    v10 = 0u;
    v11 = 0u;
    v3 = *(id *)(a1[4] + 64);
    v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    if (v4)
    {
      v5 = v4;
      v6 = 0;
      v7 = *(_QWORD *)v11;
      do
      {
        for (i = 0; i != v5; ++i)
        {
          if (*(_QWORD *)v11 != v7)
            objc_enumerationMutation(v3);
          objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * i), "physicalFormat", (_QWORD)v10);
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          v6 += objc_msgSend(v9, "channelsPerFrame");

        }
        v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
      }
      while (v5);
    }
    else
    {
      v6 = 0;
    }

    if (*(_DWORD *)(a1[6] + 8) <= v6)
      *(_BYTE *)(*(_QWORD *)(a1[5] + 8) + 24) = 1;
  }
  objc_autoreleasePoolPop(v2);
}

void __30__ASDAudioDevice_hasProperty___block_invoke_2(_QWORD *a1)
{
  void *v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  unsigned int v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v2 = (void *)MEMORY[0x22073330C]();
  if (objc_msgSend(*(id *)(a1[4] + 80), "count"))
  {
    v12 = 0u;
    v13 = 0u;
    v10 = 0u;
    v11 = 0u;
    v3 = *(id *)(a1[4] + 80);
    v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    if (v4)
    {
      v5 = v4;
      v6 = 0;
      v7 = *(_QWORD *)v11;
      do
      {
        for (i = 0; i != v5; ++i)
        {
          if (*(_QWORD *)v11 != v7)
            objc_enumerationMutation(v3);
          objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * i), "physicalFormat", (_QWORD)v10);
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          v6 += objc_msgSend(v9, "channelsPerFrame");

        }
        v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
      }
      while (v5);
    }
    else
    {
      v6 = 0;
    }

    if (*(_DWORD *)(a1[6] + 8) <= v6)
      *(_BYTE *)(*(_QWORD *)(a1[5] + 8) + 24) = 1;
  }
  objc_autoreleasePoolPop(v2);
}

- (unsigned)dataSizeForProperty:(const AudioObjectPropertyAddress *)a3 withQualifierSize:(unsigned int)a4 andQualifierData:(const void *)a5
{
  signed int mSelector;
  unsigned int v8;
  int v9;
  unsigned __int16 v10;
  int v11;
  void *v12;
  int v13;
  AudioObjectPropertyScope v14;
  uint64_t v15;
  NSObject *v16;
  NSObject *controlQueue;
  _QWORD *v18;
  void *v19;
  AudioObjectPropertyScope mScope;
  NSObject *inputStreamQueue;
  NSObject *outputStreamQueue;
  objc_super v24;
  _QWORD v25[7];
  _QWORD v26[6];
  _QWORD v27[6];
  _QWORD v28[8];
  unsigned int v29;
  _QWORD v30[7];
  _QWORD v31[6];
  _QWORD block[6];
  uint64_t v33;
  uint64_t *v34;
  uint64_t v35;
  uint64_t v36;
  int v37;

  if (!a3)
    return 0;
  mSelector = a3->mSelector;
  v8 = 8;
  if ((int)a3->mSelector <= 1818454125)
  {
    if (mSelector > 1668575851)
    {
      if (mSelector > 1685222500)
      {
        if (mSelector <= 1751737453)
        {
          if (mSelector == 1685222501)
            return 4;
          v9 = 1735354734;
          goto LABEL_51;
        }
        if (mSelector == 1751737454)
          return 4;
        v10 = 25454;
        goto LABEL_58;
      }
      if (mSelector > 1684301170)
      {
        if (mSelector == 1684301171)
          return v8;
        v9 = 1684434036;
        goto LABEL_51;
      }
      if (mSelector == 1668575852)
      {
        v33 = 0;
        v34 = &v33;
        v35 = 0x2020000000;
        v36 = 0;
        controlQueue = self->_controlQueue;
        v30[0] = MEMORY[0x24BDAC760];
        v30[1] = 3221225472;
        v30[2] = __73__ASDAudioDevice_dataSizeForProperty_withQualifierSize_andQualifierData___block_invoke_3;
        v30[3] = &unk_24DBCA578;
        v30[5] = &v33;
        v30[6] = a3;
        v30[4] = self;
        v18 = v30;
        goto LABEL_78;
      }
      v11 = 1684236338;
    }
    else
    {
      if (mSelector > 1667658617)
      {
        if (mSelector > 1668050794)
        {
          if (mSelector == 1668050795)
            return 4;
          v9 = 1668510818;
        }
        else
        {
          if (mSelector == 1667658618)
            return 4;
          v9 = 1668049764;
        }
        goto LABEL_51;
      }
      if (mSelector <= 1667330159)
      {
        if (mSelector == 1634429294)
        {
          v37 = 1633969526;
          v33 = *(_QWORD *)&a3->mSelector;
          LODWORD(v34) = a3->mElement;
          LODWORD(v33) = 1870098020;
          -[ASDObject owner](self, "owner");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          v8 = objc_msgSend(v19, "dataSizeForProperty:withQualifierSize:andQualifierData:", &v33, 4, &v37);

          return v8;
        }
        v9 = 1635087471;
        goto LABEL_51;
      }
      if (mSelector == 1667330160)
        return v8;
      v11 = 1667523955;
    }
LABEL_59:
    if (mSelector == v11)
      return v8;
    goto LABEL_60;
  }
  if (mSelector <= 1853059699)
  {
    if (mSelector > 1819173228)
    {
      if (mSelector > 1836411235)
      {
        if (mSelector == 1836411236)
          return v8;
        if (mSelector == 1853059619)
        {
          -[ASDAudioDevice samplingRates](self, "samplingRates");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          v13 = objc_msgSend(v12, "count");

          return 16 * v13;
        }
        goto LABEL_60;
      }
      if (mSelector == 1819173229)
        return v8;
      v9 = 1819569763;
      goto LABEL_51;
    }
    if (mSelector <= 1818850925)
    {
      if (mSelector == 1818454126)
        return v8;
      v10 = 28270;
LABEL_58:
      v11 = v10 | 0x6C630000;
      goto LABEL_59;
    }
    if (mSelector == 1818850926)
      return 4;
    v11 = 1819107691;
    goto LABEL_59;
  }
  if (mSelector <= 1936092275)
  {
    if (mSelector <= 1919512166)
    {
      if (mSelector == 1853059700)
        return v8;
      if (mSelector != 1870098020)
        goto LABEL_60;
      if (!a4)
      {
        v33 = 0;
        v34 = &v33;
        v35 = 0x2020000000;
        v36 = 0;
        mScope = a3->mScope;
        if (mScope == 1768845428 || mScope == 1735159650)
        {
          inputStreamQueue = self->_inputStreamQueue;
          v27[0] = MEMORY[0x24BDAC760];
          v27[1] = 3221225472;
          v27[2] = __73__ASDAudioDevice_dataSizeForProperty_withQualifierSize_andQualifierData___block_invoke_7;
          v27[3] = &unk_24DBCA398;
          v27[4] = self;
          v27[5] = &v33;
          dispatch_sync(inputStreamQueue, v27);
          mScope = a3->mScope;
        }
        if (mScope == 1869968496 || mScope == 1735159650)
        {
          outputStreamQueue = self->_outputStreamQueue;
          v26[0] = MEMORY[0x24BDAC760];
          v26[1] = 3221225472;
          v26[2] = __73__ASDAudioDevice_dataSizeForProperty_withQualifierSize_andQualifierData___block_invoke_8;
          v26[3] = &unk_24DBCA398;
          v26[4] = self;
          v26[5] = &v33;
          dispatch_sync(outputStreamQueue, v26);
        }
        controlQueue = self->_controlQueue;
        v25[0] = MEMORY[0x24BDAC760];
        v25[1] = 3221225472;
        v25[2] = __73__ASDAudioDevice_dataSizeForProperty_withQualifierSize_andQualifierData___block_invoke_9;
        v25[3] = &unk_24DBCA578;
        v25[4] = self;
        v25[5] = &v33;
        v25[6] = a3;
        v18 = v25;
        goto LABEL_78;
      }
      if ((a4 & 3) == 0)
      {
        v33 = 0;
        v34 = &v33;
        v35 = 0x2020000000;
        controlQueue = self->_controlQueue;
        v36 = 0;
        v28[0] = MEMORY[0x24BDAC760];
        v28[1] = 3221225472;
        v28[2] = __73__ASDAudioDevice_dataSizeForProperty_withQualifierSize_andQualifierData___block_invoke_6;
        v28[3] = &unk_24DBCA5A0;
        v29 = a4 >> 2;
        v28[6] = a5;
        v28[7] = a3;
        v28[4] = self;
        v28[5] = &v33;
        v18 = v28;
        goto LABEL_78;
      }
      return 0;
    }
    if (mSelector == 1919512167)
      return 4;
    v9 = 1935763060;
LABEL_51:
    if (mSelector == v9)
      return 4;
LABEL_60:
    v24.receiver = self;
    v24.super_class = (Class)ASDAudioDevice;
    return -[ASDObject dataSizeForProperty:withQualifierSize:andQualifierData:](&v24, sel_dataSizeForProperty_withQualifierSize_andQualifierData_, a3, *(_QWORD *)&a4, a5);
  }
  if (mSelector <= 1937009954)
  {
    if (mSelector != 1936092276)
    {
      if (mSelector != 1936879204)
        goto LABEL_60;
      if (-[ASDAudioDevice channelLayoutTagForScope:](self, "channelLayoutTagForScope:", a3->mScope, *(_QWORD *)&a4, a5))
      {
        return 12;
      }
      else
      {
        return 20
             * -[ASDAudioDevice numberOfChannelsInLayoutForScope:](self, "numberOfChannelsInLayoutForScope:", a3->mScope)+ 12;
      }
    }
    return 4;
  }
  if (mSelector == 1937009955)
  {
    v33 = 0;
    v34 = &v33;
    v35 = 0x2020000000;
    v36 = 0;
    v14 = a3->mScope;
    v15 = MEMORY[0x24BDAC760];
    if (v14 == 1768845428 || v14 == 1735159650)
    {
      v16 = self->_inputStreamQueue;
      block[0] = MEMORY[0x24BDAC760];
      block[1] = 3221225472;
      block[2] = __73__ASDAudioDevice_dataSizeForProperty_withQualifierSize_andQualifierData___block_invoke;
      block[3] = &unk_24DBCA398;
      block[4] = self;
      block[5] = &v33;
      dispatch_sync(v16, block);
      v14 = a3->mScope;
    }
    if (v14 != 1869968496 && v14 != 1735159650)
      goto LABEL_79;
    controlQueue = self->_outputStreamQueue;
    v31[0] = v15;
    v31[1] = 3221225472;
    v31[2] = __73__ASDAudioDevice_dataSizeForProperty_withQualifierSize_andQualifierData___block_invoke_2;
    v31[3] = &unk_24DBCA398;
    v31[4] = self;
    v31[5] = &v33;
    v18 = v31;
LABEL_78:
    dispatch_sync(controlQueue, v18);
LABEL_79:
    v8 = 4 * *((_DWORD *)v34 + 6);
    _Block_object_dispose(&v33, 8);
    return v8;
  }
  if (mSelector != 1969841184)
  {
    v9 = 1953653102;
    goto LABEL_51;
  }
  return v8;
}

uint64_t __73__ASDAudioDevice_dataSizeForProperty_withQualifierSize_andQualifierData___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 64), "count");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) += result;
  return result;
}

uint64_t __73__ASDAudioDevice_dataSizeForProperty_withQualifierSize_andQualifierData___block_invoke_2(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 80), "count");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) += result;
  return result;
}

void __73__ASDAudioDevice_dataSizeForProperty_withQualifierSize_andQualifierData___block_invoke_3(_QWORD *a1)
{
  void *v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v2 = (void *)MEMORY[0x22073330C]();
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v3 = *(id *)(a1[4] + 96);
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v9;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v9 != v6)
          objc_enumerationMutation(v3);
        if (*(_DWORD *)(a1[6] + 4) == 1735159650
          || objc_msgSend(*(id *)(*((_QWORD *)&v8 + 1) + 8 * v7), "controlScope", (_QWORD)v8) == *(_DWORD *)(a1[6] + 4))
        {
          ++*(_QWORD *)(*(_QWORD *)(a1[5] + 8) + 24);
        }
        ++v7;
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    }
    while (v5);
  }

  objc_autoreleasePoolPop(v2);
}

void __73__ASDAudioDevice_dataSizeForProperty_withQualifierSize_andQualifierData___block_invoke_6(uint64_t a1)
{
  void *v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  _BYTE v11[128];
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v2 = (void *)MEMORY[0x22073330C]();
  v7 = 0u;
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v3 = *(id *)(*(_QWORD *)(a1 + 32) + 96);
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v8;
    while (1)
    {
      if (*(_QWORD *)v8 != v6)
        objc_enumerationMutation(v3);
      if (!--v5)
      {
        v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
        if (!v5)
          break;
      }
    }
  }

  objc_autoreleasePoolPop(v2);
}

uint64_t __73__ASDAudioDevice_dataSizeForProperty_withQualifierSize_andQualifierData___block_invoke_7(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 64), "count");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) += result;
  return result;
}

uint64_t __73__ASDAudioDevice_dataSizeForProperty_withQualifierSize_andQualifierData___block_invoke_8(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 80), "count");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) += result;
  return result;
}

void __73__ASDAudioDevice_dataSizeForProperty_withQualifierSize_andQualifierData___block_invoke_9(_QWORD *a1)
{
  void *v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v2 = (void *)MEMORY[0x22073330C]();
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v3 = *(id *)(a1[4] + 96);
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v9;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v9 != v6)
          objc_enumerationMutation(v3);
        if (*(_DWORD *)(a1[6] + 4) == 1735159650
          || objc_msgSend(*(id *)(*((_QWORD *)&v8 + 1) + 8 * v7), "controlScope", (_QWORD)v8) == *(_DWORD *)(a1[6] + 4))
        {
          ++*(_QWORD *)(*(_QWORD *)(a1[5] + 8) + 24);
        }
        ++v7;
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    }
    while (v5);
  }

  objc_autoreleasePoolPop(v2);
}

void __89__ASDAudioDevice_getProperty_withQualifierSize_qualifierData_dataSize_andData_forClient___block_invoke(_QWORD *a1)
{
  void *v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v2 = (void *)MEMORY[0x22073330C]();
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v3 = *(id *)(a1[4] + 64);
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v9;
LABEL_3:
    v7 = 0;
    while (1)
    {
      if (*(_QWORD *)v9 != v6)
        objc_enumerationMutation(v3);
      if (*(_QWORD *)(*(_QWORD *)(a1[5] + 8) + 24) == a1[6])
        break;
      *(_DWORD *)(a1[7] + 4 * (*(_QWORD *)(*(_QWORD *)(a1[5] + 8) + 24))++) = objc_msgSend(*(id *)(*((_QWORD *)&v8 + 1)+ 8 * v7), "objectID", (_QWORD)v8);
      if (v5 == ++v7)
      {
        v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
        if (v5)
          goto LABEL_3;
        break;
      }
    }
  }

  objc_autoreleasePoolPop(v2);
}

void __89__ASDAudioDevice_getProperty_withQualifierSize_qualifierData_dataSize_andData_forClient___block_invoke_2(_QWORD *a1)
{
  void *v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v2 = (void *)MEMORY[0x22073330C]();
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v3 = *(id *)(a1[4] + 80);
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v9;
LABEL_3:
    v7 = 0;
    while (1)
    {
      if (*(_QWORD *)v9 != v6)
        objc_enumerationMutation(v3);
      if (*(_QWORD *)(*(_QWORD *)(a1[5] + 8) + 24) == a1[6])
        break;
      *(_DWORD *)(a1[7] + 4 * (*(_QWORD *)(*(_QWORD *)(a1[5] + 8) + 24))++) = objc_msgSend(*(id *)(*((_QWORD *)&v8 + 1)+ 8 * v7), "objectID", (_QWORD)v8);
      if (v5 == ++v7)
      {
        v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
        if (v5)
          goto LABEL_3;
        break;
      }
    }
  }

  objc_autoreleasePoolPop(v2);
}

void __89__ASDAudioDevice_getProperty_withQualifierSize_qualifierData_dataSize_andData_forClient___block_invoke_3(uint64_t a1)
{
  void *v2;
  unint64_t v3;
  unint64_t v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v2 = (void *)MEMORY[0x22073330C]();
  v3 = **(unsigned int **)(a1 + 48);
  if (objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 96), "count") <= v3 >> 2)
    v4 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 96), "count");
  else
    v4 = (unint64_t)**(unsigned int **)(a1 + 48) >> 2;
  v13 = 0u;
  v14 = 0u;
  v11 = 0u;
  v12 = 0u;
  v5 = *(id *)(*(_QWORD *)(a1 + 32) + 96);
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v12;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v12 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * v9);
        if (*(_DWORD *)(*(_QWORD *)(a1 + 56) + 4) == 1735159650
          || objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * v9), "controlScope", (_QWORD)v11) == *(_DWORD *)(*(_QWORD *)(a1 + 56) + 4))
        {
          if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) == v4)
            goto LABEL_15;
          *(_DWORD *)(*(_QWORD *)(a1 + 64) + 4 * (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24))++) = objc_msgSend(v10, "objectID");
        }
        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v7);
  }
LABEL_15:

  objc_autoreleasePoolPop(v2);
}

void __89__ASDAudioDevice_getProperty_withQualifierSize_qualifierData_dataSize_andData_forClient___block_invoke_6(uint64_t a1)
{
  void *v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  _BYTE v11[128];
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v2 = (void *)MEMORY[0x22073330C]();
  v7 = 0u;
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v3 = *(id *)(*(_QWORD *)(a1 + 32) + 96);
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v8;
    while (1)
    {
      if (*(_QWORD *)v8 != v6)
        objc_enumerationMutation(v3);
      if (!--v5)
      {
        v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
        if (!v5)
          break;
      }
    }
  }

  objc_autoreleasePoolPop(v2);
}

void __89__ASDAudioDevice_getProperty_withQualifierSize_qualifierData_dataSize_andData_forClient___block_invoke_7(_QWORD *a1)
{
  void *v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v2 = (void *)MEMORY[0x22073330C]();
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v3 = *(id *)(a1[4] + 64);
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v9;
LABEL_3:
    v7 = 0;
    while (1)
    {
      if (*(_QWORD *)v9 != v6)
        objc_enumerationMutation(v3);
      if (*(_QWORD *)(*(_QWORD *)(a1[5] + 8) + 24) == a1[6])
        break;
      *(_DWORD *)(a1[7] + 4 * (*(_QWORD *)(*(_QWORD *)(a1[5] + 8) + 24))++) = objc_msgSend(*(id *)(*((_QWORD *)&v8 + 1)+ 8 * v7), "objectID", (_QWORD)v8);
      if (v5 == ++v7)
      {
        v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
        if (v5)
          goto LABEL_3;
        break;
      }
    }
  }

  objc_autoreleasePoolPop(v2);
}

void __89__ASDAudioDevice_getProperty_withQualifierSize_qualifierData_dataSize_andData_forClient___block_invoke_8(_QWORD *a1)
{
  void *v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v2 = (void *)MEMORY[0x22073330C]();
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v3 = *(id *)(a1[4] + 80);
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v9;
LABEL_3:
    v7 = 0;
    while (1)
    {
      if (*(_QWORD *)v9 != v6)
        objc_enumerationMutation(v3);
      if (*(_QWORD *)(*(_QWORD *)(a1[5] + 8) + 24) == a1[6])
        break;
      *(_DWORD *)(a1[7] + 4 * (*(_QWORD *)(*(_QWORD *)(a1[5] + 8) + 24))++) = objc_msgSend(*(id *)(*((_QWORD *)&v8 + 1)+ 8 * v7), "objectID", (_QWORD)v8);
      if (v5 == ++v7)
      {
        v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
        if (v5)
          goto LABEL_3;
        break;
      }
    }
  }

  objc_autoreleasePoolPop(v2);
}

void __89__ASDAudioDevice_getProperty_withQualifierSize_qualifierData_dataSize_andData_forClient___block_invoke_9(_QWORD *a1)
{
  void *v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v2 = (void *)MEMORY[0x22073330C]();
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v3 = *(id *)(a1[4] + 96);
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v10;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v10 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v9 + 1) + 8 * v7);
        if (*(_DWORD *)(a1[6] + 4) == 1735159650
          || objc_msgSend(*(id *)(*((_QWORD *)&v9 + 1) + 8 * v7), "controlScope", (_QWORD)v9) == *(_DWORD *)(a1[6] + 4))
        {
          if (*(_QWORD *)(*(_QWORD *)(a1[5] + 8) + 24) == a1[7])
            goto LABEL_12;
          *(_DWORD *)(a1[8] + 4 * (*(_QWORD *)(*(_QWORD *)(a1[5] + 8) + 24))++) = objc_msgSend(v8, "objectID");
        }
        ++v7;
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v5);
  }
LABEL_12:

  objc_autoreleasePoolPop(v2);
}

void __89__ASDAudioDevice_getProperty_withQualifierSize_qualifierData_dataSize_andData_forClient___block_invoke_10(uint64_t a1)
{
  void *v2;
  unsigned int v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  unsigned int v10;
  void *v11;
  int v12;
  const void *v14;
  void *v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v2 = (void *)MEMORY[0x22073330C]();
  if (objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 64), "count"))
  {
    v15 = v2;
    v3 = *(_DWORD *)(*(_QWORD *)(a1 + 48) + 8);
    v16 = 0u;
    v17 = 0u;
    v18 = 0u;
    v19 = 0u;
    v4 = *(id *)(*(_QWORD *)(a1 + 32) + 64);
    v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    if (v5)
    {
      v6 = v5;
      v7 = *(_QWORD *)v17;
      while (2)
      {
        for (i = 0; i != v6; ++i)
        {
          if (*(_QWORD *)v17 != v7)
            objc_enumerationMutation(v4);
          v9 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * i);
          v10 = objc_msgSend(v9, "startingChannel");
          objc_msgSend(v9, "physicalFormat");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          v12 = objc_msgSend(v11, "channelsPerFrame");

          if (v3 >= v10 && v3 < v12 + v10)
          {
            **(_QWORD **)(a1 + 56) = objc_msgSend(v9, "channelNameForChannelIndex:", v3 - v10);
            v14 = **(const void ***)(a1 + 56);
            if (v14)
              CFRetain(v14);
            **(_DWORD **)(a1 + 64) = 8;
            *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
            goto LABEL_18;
          }
        }
        v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
        if (v6)
          continue;
        break;
      }
    }
LABEL_18:

    v2 = v15;
  }
  objc_autoreleasePoolPop(v2);
}

void __89__ASDAudioDevice_getProperty_withQualifierSize_qualifierData_dataSize_andData_forClient___block_invoke_11(uint64_t a1)
{
  void *v2;
  unsigned int v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  unsigned int v10;
  void *v11;
  int v12;
  const void *v14;
  void *v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v2 = (void *)MEMORY[0x22073330C]();
  if (objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 80), "count"))
  {
    v15 = v2;
    v3 = *(_DWORD *)(*(_QWORD *)(a1 + 48) + 8);
    v16 = 0u;
    v17 = 0u;
    v18 = 0u;
    v19 = 0u;
    v4 = *(id *)(*(_QWORD *)(a1 + 32) + 80);
    v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    if (v5)
    {
      v6 = v5;
      v7 = *(_QWORD *)v17;
      while (2)
      {
        for (i = 0; i != v6; ++i)
        {
          if (*(_QWORD *)v17 != v7)
            objc_enumerationMutation(v4);
          v9 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * i);
          v10 = objc_msgSend(v9, "startingChannel");
          objc_msgSend(v9, "physicalFormat");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          v12 = objc_msgSend(v11, "channelsPerFrame");

          if (v3 >= v10 && v3 < v12 + v10)
          {
            **(_QWORD **)(a1 + 56) = objc_msgSend(v9, "channelNameForChannelIndex:", v3 - v10);
            v14 = **(const void ***)(a1 + 56);
            if (v14)
              CFRetain(v14);
            **(_DWORD **)(a1 + 64) = 8;
            *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
            goto LABEL_18;
          }
        }
        v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
        if (v6)
          continue;
        break;
      }
    }
LABEL_18:

    v2 = v15;
  }
  objc_autoreleasePoolPop(v2);
}

void __89__ASDAudioDevice_getProperty_withQualifierSize_qualifierData_dataSize_andData_forClient___block_invoke_12(uint64_t a1)
{
  void *v2;
  unsigned int v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  unsigned int v10;
  void *v11;
  int v12;
  const void *v14;
  void *v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v2 = (void *)MEMORY[0x22073330C]();
  if (objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 64), "count"))
  {
    v15 = v2;
    v3 = *(_DWORD *)(*(_QWORD *)(a1 + 48) + 8);
    v16 = 0u;
    v17 = 0u;
    v18 = 0u;
    v19 = 0u;
    v4 = *(id *)(*(_QWORD *)(a1 + 32) + 64);
    v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    if (v5)
    {
      v6 = v5;
      v7 = *(_QWORD *)v17;
      while (2)
      {
        for (i = 0; i != v6; ++i)
        {
          if (*(_QWORD *)v17 != v7)
            objc_enumerationMutation(v4);
          v9 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * i);
          v10 = objc_msgSend(v9, "startingChannel");
          objc_msgSend(v9, "physicalFormat");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          v12 = objc_msgSend(v11, "channelsPerFrame");

          if (v3 >= v10 && v3 < v12 + v10)
          {
            **(_QWORD **)(a1 + 56) = objc_msgSend(v9, "channelCategoryForChannelIndex:", v3 - v10);
            v14 = **(const void ***)(a1 + 56);
            if (v14)
              CFRetain(v14);
            **(_DWORD **)(a1 + 64) = 8;
            *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
            goto LABEL_18;
          }
        }
        v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
        if (v6)
          continue;
        break;
      }
    }
LABEL_18:

    v2 = v15;
  }
  objc_autoreleasePoolPop(v2);
}

void __89__ASDAudioDevice_getProperty_withQualifierSize_qualifierData_dataSize_andData_forClient___block_invoke_13(uint64_t a1)
{
  void *v2;
  unsigned int v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  unsigned int v10;
  void *v11;
  int v12;
  const void *v14;
  void *v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v2 = (void *)MEMORY[0x22073330C]();
  if (objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 80), "count"))
  {
    v15 = v2;
    v3 = *(_DWORD *)(*(_QWORD *)(a1 + 48) + 8);
    v16 = 0u;
    v17 = 0u;
    v18 = 0u;
    v19 = 0u;
    v4 = *(id *)(*(_QWORD *)(a1 + 32) + 80);
    v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    if (v5)
    {
      v6 = v5;
      v7 = *(_QWORD *)v17;
      while (2)
      {
        for (i = 0; i != v6; ++i)
        {
          if (*(_QWORD *)v17 != v7)
            objc_enumerationMutation(v4);
          v9 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * i);
          v10 = objc_msgSend(v9, "startingChannel");
          objc_msgSend(v9, "physicalFormat");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          v12 = objc_msgSend(v11, "channelsPerFrame");

          if (v3 >= v10 && v3 < v12 + v10)
          {
            **(_QWORD **)(a1 + 56) = objc_msgSend(v9, "channelCategoryForChannelIndex:", v3 - v10);
            v14 = **(const void ***)(a1 + 56);
            if (v14)
              CFRetain(v14);
            **(_DWORD **)(a1 + 64) = 8;
            *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
            goto LABEL_18;
          }
        }
        v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
        if (v6)
          continue;
        break;
      }
    }
LABEL_18:

    v2 = v15;
  }
  objc_autoreleasePoolPop(v2);
}

void __89__ASDAudioDevice_getProperty_withQualifierSize_qualifierData_dataSize_andData_forClient___block_invoke_14(uint64_t a1)
{
  void *v2;
  unsigned int v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  unsigned int v10;
  void *v11;
  int v12;
  const void *v14;
  void *v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v2 = (void *)MEMORY[0x22073330C]();
  if (objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 64), "count"))
  {
    v15 = v2;
    v3 = *(_DWORD *)(*(_QWORD *)(a1 + 48) + 8);
    v16 = 0u;
    v17 = 0u;
    v18 = 0u;
    v19 = 0u;
    v4 = *(id *)(*(_QWORD *)(a1 + 32) + 64);
    v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    if (v5)
    {
      v6 = v5;
      v7 = *(_QWORD *)v17;
      while (2)
      {
        for (i = 0; i != v6; ++i)
        {
          if (*(_QWORD *)v17 != v7)
            objc_enumerationMutation(v4);
          v9 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * i);
          v10 = objc_msgSend(v9, "startingChannel");
          objc_msgSend(v9, "physicalFormat");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          v12 = objc_msgSend(v11, "channelsPerFrame");

          if (v3 >= v10 && v3 < v12 + v10)
          {
            **(_QWORD **)(a1 + 56) = objc_msgSend(v9, "channelNumberForChannelIndex:", v3 - v10);
            v14 = **(const void ***)(a1 + 56);
            if (v14)
              CFRetain(v14);
            **(_DWORD **)(a1 + 64) = 8;
            *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
            goto LABEL_18;
          }
        }
        v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
        if (v6)
          continue;
        break;
      }
    }
LABEL_18:

    v2 = v15;
  }
  objc_autoreleasePoolPop(v2);
}

void __89__ASDAudioDevice_getProperty_withQualifierSize_qualifierData_dataSize_andData_forClient___block_invoke_15(uint64_t a1)
{
  void *v2;
  unsigned int v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  unsigned int v10;
  void *v11;
  int v12;
  const void *v14;
  void *v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v2 = (void *)MEMORY[0x22073330C]();
  if (objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 80), "count"))
  {
    v15 = v2;
    v3 = *(_DWORD *)(*(_QWORD *)(a1 + 48) + 8);
    v16 = 0u;
    v17 = 0u;
    v18 = 0u;
    v19 = 0u;
    v4 = *(id *)(*(_QWORD *)(a1 + 32) + 80);
    v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    if (v5)
    {
      v6 = v5;
      v7 = *(_QWORD *)v17;
      while (2)
      {
        for (i = 0; i != v6; ++i)
        {
          if (*(_QWORD *)v17 != v7)
            objc_enumerationMutation(v4);
          v9 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * i);
          v10 = objc_msgSend(v9, "startingChannel");
          objc_msgSend(v9, "physicalFormat");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          v12 = objc_msgSend(v11, "channelsPerFrame");

          if (v3 >= v10 && v3 < v12 + v10)
          {
            **(_QWORD **)(a1 + 56) = objc_msgSend(v9, "channelNumberForChannelIndex:", v3 - v10);
            v14 = **(const void ***)(a1 + 56);
            if (v14)
              CFRetain(v14);
            **(_DWORD **)(a1 + 64) = 8;
            *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
            goto LABEL_18;
          }
        }
        v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
        if (v6)
          continue;
        break;
      }
    }
LABEL_18:

    v2 = v15;
  }
  objc_autoreleasePoolPop(v2);
}

- (BOOL)isPropertySettable:(const AudioObjectPropertyAddress *)a3
{
  AudioObjectPropertySelector mSelector;
  objc_super v6;

  if (!a3)
    return 0;
  mSelector = a3->mSelector;
  if (a3->mSelector == 1667523955 || mSelector == 1853059700)
    return 1;
  if (mSelector == 1819173229)
    return -[ASDAudioDevice canChangeDeviceName](self, "canChangeDeviceName");
  v6.receiver = self;
  v6.super_class = (Class)ASDAudioDevice;
  return -[ASDObject isPropertySettable:](&v6, sel_isPropertySettable_);
}

- (BOOL)setProperty:(const AudioObjectPropertyAddress *)a3 withQualifierSize:(unsigned int)a4 qualifierData:(const void *)a5 dataSize:(unsigned int)a6 andData:(const void *)a7 forClient:(int)a8
{
  uint64_t v8;
  uint64_t v10;
  uint64_t v12;
  AudioObjectPropertySelector mSelector;
  BOOL v16;
  double v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t i;
  double v24;
  objc_super v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x24BDAC8D0];
  if (!a3)
    return 0;
  v8 = *(_QWORD *)&a8;
  v10 = *(_QWORD *)&a6;
  v12 = *(_QWORD *)&a4;
  if (!-[ASDAudioDevice hasProperty:](self, "hasProperty:")
    || !-[ASDAudioDevice isPropertySettable:](self, "isPropertySettable:", a3))
  {
    return 0;
  }
  mSelector = a3->mSelector;
  if ((int)a3->mSelector > 1819173228)
  {
    if (mSelector == 1853059700)
    {
      if ((_DWORD)v10 == 8)
      {
        v18 = *(double *)a7;
        -[ASDAudioDevice samplingRates](self, "samplingRates");
        v26 = 0u;
        v27 = 0u;
        v28 = 0u;
        v29 = 0u;
        v19 = (id)objc_claimAutoreleasedReturnValue();
        v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
        if (v20)
        {
          v21 = v20;
          v22 = *(_QWORD *)v27;
          while (2)
          {
            for (i = 0; i != v21; ++i)
            {
              if (*(_QWORD *)v27 != v22)
                objc_enumerationMutation(v19);
              objc_msgSend(*(id *)(*((_QWORD *)&v26 + 1) + 8 * i), "doubleValue");
              if (vabdd_f64(v18, v24) < 0.001)
              {

                v16 = -[ASDAudioDevice changeSamplingRate:](self, "changeSamplingRate:", v18);
                goto LABEL_29;
              }
            }
            v21 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
            if (v21)
              continue;
            break;
          }
        }

        v16 = 0;
LABEL_29:

        return v16;
      }
      return 0;
    }
    if (mSelector == 1819173229)
    {
      if ((_DWORD)v10 == 8)
        return -[ASDAudioDevice changeDeviceName:](self, "changeDeviceName:", *(_QWORD *)a7);
      return 0;
    }
LABEL_13:
    v25.receiver = self;
    v25.super_class = (Class)ASDAudioDevice;
    return -[ASDObject setProperty:withQualifierSize:qualifierData:dataSize:andData:forClient:](&v25, sel_setProperty_withQualifierSize_qualifierData_dataSize_andData_forClient_, a3, v12, a5, v10, a7, v8);
  }
  if (mSelector == 1667523955)
  {
    if ((_DWORD)v10 == 8)
      return -[ASDAudioDevice changeClientDescription:](self, "changeClientDescription:", *(_QWORD *)a7);
    return 0;
  }
  if (mSelector != 1818850926)
    goto LABEL_13;
  if ((_DWORD)v10 != 4)
    return 0;
  self->_isAlive = *(_DWORD *)a7 != 0;
  return 1;
}

- (void)addInputStream:(id)a3
{
  id v5;
  void *v6;
  NSObject *inputStreamQueue;
  id v8;
  objc_class *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  void *v20;
  uint64_t v21;
  int v22;
  _QWORD block[5];
  id v24;
  SEL v25;

  v5 = a3;
  v6 = v5;
  if (v5)
  {
    inputStreamQueue = self->_inputStreamQueue;
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __33__ASDAudioDevice_addInputStream___block_invoke;
    block[3] = &unk_24DBCA3E8;
    block[4] = self;
    v8 = v5;
    v24 = v8;
    v25 = a2;
    dispatch_sync(inputStreamQueue, block);
    objc_msgSend(v8, "setOwner:", self);
    if (!objc_msgSend(v8, "startingChannel"))
    {
      v9 = (objc_class *)objc_opt_class();
      NSStringFromClass(v9);
      v10 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      v11 = objc_msgSend(v10, "cStringUsingEncoding:", 4);

      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_FAULT))
        -[ASDAudioDevice addInputStream:].cold.1(v11, v12, v13, v14, v15, v16, v17, v18);
    }
    v22 = 0;
    v21 = 0x696E707473746D23;
    -[ASDObject propertyChangedDelegate](self, "propertyChangedDelegate");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "changedProperty:forObject:", &v21, self);

    v21 = 0x676C6F626F776E64;
    -[ASDObject propertyChangedDelegate](self, "propertyChangedDelegate");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "changedProperty:forObject:", &v21, self);

  }
}

void __33__ASDAudioDevice_addInputStream___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;

  if (objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 64), "containsObject:", *(_QWORD *)(a1 + 40)))
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "handleFailureInMethod:object:file:lineNumber:description:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 32), CFSTR("ASDAudioDevice.m"), 1432, CFSTR("Stream already exists"));

  }
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 64), "addObject:", *(_QWORD *)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 32), "plugin");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addStreamRealTimeOperations:", *(_QWORD *)(a1 + 40));

}

- (void)removeInputStream:(id)a3
{
  id v5;
  void *v6;
  NSObject *inputStreamQueue;
  void *v8;
  void *v9;
  uint64_t v10;
  int v11;
  _QWORD block[5];
  id v13;
  SEL v14;

  v5 = a3;
  v6 = v5;
  if (v5)
  {
    inputStreamQueue = self->_inputStreamQueue;
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __36__ASDAudioDevice_removeInputStream___block_invoke;
    block[3] = &unk_24DBCA3E8;
    block[4] = self;
    v13 = v5;
    v14 = a2;
    dispatch_sync(inputStreamQueue, block);
    v11 = 0;
    v10 = 0x696E707473746D23;
    -[ASDObject propertyChangedDelegate](self, "propertyChangedDelegate");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "changedProperty:forObject:", &v10, self);

    v10 = 0x676C6F626F776E64;
    -[ASDObject propertyChangedDelegate](self, "propertyChangedDelegate");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "changedProperty:forObject:", &v10, self);

  }
}

uint64_t __36__ASDAudioDevice_removeInputStream___block_invoke(uint64_t a1)
{
  void *v2;
  void *v4;

  if ((objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 64), "containsObject:", *(_QWORD *)(a1 + 40)) & 1) == 0)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 32), CFSTR("ASDAudioDevice.m"), 1462, CFSTR("Stream doesn't exist"));

  }
  objc_msgSend(*(id *)(a1 + 32), "plugin");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "removeStreamRealTimeOperations:", *(_QWORD *)(a1 + 40));

  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 64), "removeObject:", *(_QWORD *)(a1 + 40));
}

- (id)inputStreams
{
  NSObject *inputStreamQueue;
  id v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  id v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3032000000;
  v9 = __Block_byref_object_copy__3;
  v10 = __Block_byref_object_dispose__3;
  v11 = 0;
  inputStreamQueue = self->_inputStreamQueue;
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __30__ASDAudioDevice_inputStreams__block_invoke;
  v5[3] = &unk_24DBCA398;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(inputStreamQueue, v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

void __30__ASDAudioDevice_inputStreams__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithArray:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 64));
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (void)addOutputStream:(id)a3
{
  id v5;
  void *v6;
  NSObject *outputStreamQueue;
  id v8;
  objc_class *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  void *v20;
  uint64_t v21;
  int v22;
  _QWORD block[5];
  id v24;
  SEL v25;

  v5 = a3;
  v6 = v5;
  if (v5)
  {
    outputStreamQueue = self->_outputStreamQueue;
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __34__ASDAudioDevice_addOutputStream___block_invoke;
    block[3] = &unk_24DBCA3E8;
    block[4] = self;
    v8 = v5;
    v24 = v8;
    v25 = a2;
    dispatch_sync(outputStreamQueue, block);
    objc_msgSend(v8, "setOwner:", self);
    if (!objc_msgSend(v8, "startingChannel"))
    {
      v9 = (objc_class *)objc_opt_class();
      NSStringFromClass(v9);
      v10 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      v11 = objc_msgSend(v10, "cStringUsingEncoding:", 4);

      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_FAULT))
        -[ASDAudioDevice addInputStream:].cold.1(v11, v12, v13, v14, v15, v16, v17, v18);
    }
    v22 = 0;
    v21 = 0x6F75747073746D23;
    -[ASDObject propertyChangedDelegate](self, "propertyChangedDelegate");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "changedProperty:forObject:", &v21, self);

    v21 = 0x676C6F626F776E64;
    -[ASDObject propertyChangedDelegate](self, "propertyChangedDelegate");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "changedProperty:forObject:", &v21, self);

  }
}

void __34__ASDAudioDevice_addOutputStream___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;

  if (objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 80), "containsObject:", *(_QWORD *)(a1 + 40)))
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "handleFailureInMethod:object:file:lineNumber:description:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 32), CFSTR("ASDAudioDevice.m"), 1497, CFSTR("Stream already exists"));

  }
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 80), "addObject:", *(_QWORD *)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 32), "plugin");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addStreamRealTimeOperations:", *(_QWORD *)(a1 + 40));

}

- (void)removeOutputStream:(id)a3
{
  id v5;
  void *v6;
  NSObject *outputStreamQueue;
  void *v8;
  void *v9;
  uint64_t v10;
  int v11;
  _QWORD block[5];
  id v13;
  SEL v14;

  v5 = a3;
  v6 = v5;
  if (v5)
  {
    outputStreamQueue = self->_outputStreamQueue;
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __37__ASDAudioDevice_removeOutputStream___block_invoke;
    block[3] = &unk_24DBCA3E8;
    block[4] = self;
    v13 = v5;
    v14 = a2;
    dispatch_sync(outputStreamQueue, block);
    v11 = 0;
    v10 = 0x6F75747073746D23;
    -[ASDObject propertyChangedDelegate](self, "propertyChangedDelegate");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "changedProperty:forObject:", &v10, self);

    v10 = 0x676C6F626F776E64;
    -[ASDObject propertyChangedDelegate](self, "propertyChangedDelegate");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "changedProperty:forObject:", &v10, self);

  }
}

uint64_t __37__ASDAudioDevice_removeOutputStream___block_invoke(uint64_t a1)
{
  void *v2;
  void *v4;

  if ((objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 80), "containsObject:", *(_QWORD *)(a1 + 40)) & 1) == 0)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 32), CFSTR("ASDAudioDevice.m"), 1527, CFSTR("Stream doesn't exist"));

  }
  objc_msgSend(*(id *)(a1 + 32), "plugin");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "removeStreamRealTimeOperations:", *(_QWORD *)(a1 + 40));

  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 80), "removeObject:", *(_QWORD *)(a1 + 40));
}

- (id)outputStreams
{
  NSObject *outputStreamQueue;
  id v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  id v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3032000000;
  v9 = __Block_byref_object_copy__3;
  v10 = __Block_byref_object_dispose__3;
  v11 = 0;
  outputStreamQueue = self->_outputStreamQueue;
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __31__ASDAudioDevice_outputStreams__block_invoke;
  v5[3] = &unk_24DBCA398;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(outputStreamQueue, v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

void __31__ASDAudioDevice_outputStreams__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithArray:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 80));
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (void)addControl:(id)a3
{
  id v4;
  void *v5;
  NSObject *controlQueue;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t block;
  uint64_t v13;
  uint64_t (*v14)(uint64_t);
  void *v15;
  ASDAudioDevice *v16;
  id v17;

  v4 = a3;
  v5 = v4;
  if (v4)
  {
    controlQueue = self->_controlQueue;
    block = MEMORY[0x24BDAC760];
    v13 = 3221225472;
    v14 = __29__ASDAudioDevice_addControl___block_invoke;
    v15 = &unk_24DBCA438;
    v16 = self;
    v7 = v4;
    v17 = v7;
    dispatch_sync(controlQueue, &block);
    objc_msgSend(v7, "setOwner:", self);
    LODWORD(v11) = 0;
    -[ASDObject propertyChangedDelegate](self, "propertyChangedDelegate", 0x676C6F626374726CLL, v11, block, v13, v14, v15, v16);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "changedProperty:forObject:", &v10, self);

    -[ASDObject propertyChangedDelegate](self, "propertyChangedDelegate", 0x676C6F626F776E64);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "changedProperty:forObject:", &v10, self);

  }
}

uint64_t __29__ASDAudioDevice_addControl___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 96), "addObject:", *(_QWORD *)(a1 + 40));
}

- (void)removeControl:(id)a3
{
  id v4;
  void *v5;
  NSObject *controlQueue;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t block;
  uint64_t v12;
  uint64_t (*v13)(uint64_t);
  void *v14;
  ASDAudioDevice *v15;
  id v16;

  v4 = a3;
  v5 = v4;
  if (v4)
  {
    controlQueue = self->_controlQueue;
    block = MEMORY[0x24BDAC760];
    v12 = 3221225472;
    v13 = __32__ASDAudioDevice_removeControl___block_invoke;
    v14 = &unk_24DBCA438;
    v15 = self;
    v16 = v4;
    dispatch_sync(controlQueue, &block);
    LODWORD(v10) = 0;
    -[ASDObject propertyChangedDelegate](self, "propertyChangedDelegate", 0x676C6F626374726CLL, v10, block, v12, v13, v14, v15);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "changedProperty:forObject:", &v9, self);

    -[ASDObject propertyChangedDelegate](self, "propertyChangedDelegate", 0x676C6F626F776E64);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "changedProperty:forObject:", &v9, self);

  }
}

uint64_t __32__ASDAudioDevice_removeControl___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 96), "removeObject:", *(_QWORD *)(a1 + 40));
}

- (id)controls
{
  NSObject *controlQueue;
  id v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  id v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3032000000;
  v9 = __Block_byref_object_copy__3;
  v10 = __Block_byref_object_dispose__3;
  v11 = 0;
  controlQueue = self->_controlQueue;
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __26__ASDAudioDevice_controls__block_invoke;
  v5[3] = &unk_24DBCA398;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(controlQueue, v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

void __26__ASDAudioDevice_controls__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithArray:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 96));
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (void)requestConfigurationChange:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[ASDAudioDevice configurationChangeDelegate](self, "configurationChangeDelegate");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "requestConfigurationChangeForDevice:withBlock:", self, v4);

}

- (void)performConfigurationChange:(void *)a3
{
  (*((void (**)(void *, SEL))a3 + 2))(a3, a2);

}

- (void)preferredChannelsForLeft:(unsigned int *)a3 andRight:(unsigned int *)a4
{
  if (a3)
    *a3 = 1;
  if (a4)
    *a4 = 2;
}

- (unsigned)numberOfChannelsInLayoutForScope:(unsigned int)a3
{
  NSObject *outputStreamQueue;
  _QWORD *v4;
  unsigned int v5;
  _QWORD v7[6];
  _QWORD v8[6];
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  int v12;

  v9 = 0;
  v10 = &v9;
  v11 = 0x2020000000;
  v12 = 0;
  if (a3 == 1869968496)
  {
    outputStreamQueue = self->_outputStreamQueue;
    v7[0] = MEMORY[0x24BDAC760];
    v7[1] = 3221225472;
    v7[2] = __51__ASDAudioDevice_numberOfChannelsInLayoutForScope___block_invoke_2;
    v7[3] = &unk_24DBCA618;
    v7[4] = self;
    v7[5] = &v9;
    v4 = v7;
    goto LABEL_5;
  }
  if (a3 == 1768845428)
  {
    outputStreamQueue = self->_inputStreamQueue;
    v8[0] = MEMORY[0x24BDAC760];
    v8[1] = 3221225472;
    v8[2] = __51__ASDAudioDevice_numberOfChannelsInLayoutForScope___block_invoke;
    v8[3] = &unk_24DBCA618;
    v8[4] = self;
    v8[5] = &v9;
    v4 = v8;
LABEL_5:
    dispatch_sync(outputStreamQueue, v4);
  }
  v5 = *((_DWORD *)v10 + 6);
  _Block_object_dispose(&v9, 8);
  return v5;
}

void __51__ASDAudioDevice_numberOfChannelsInLayoutForScope___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v2 = (void *)MEMORY[0x22073330C]();
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v3 = *(id *)(*(_QWORD *)(a1 + 32) + 64);
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v10;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v10 != v6)
          objc_enumerationMutation(v3);
        objc_msgSend(*(id *)(*((_QWORD *)&v9 + 1) + 8 * v7), "physicalFormat", (_QWORD)v9);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) += objc_msgSend(v8, "channelsPerFrame");

        ++v7;
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v5);
  }

  objc_autoreleasePoolPop(v2);
}

void __51__ASDAudioDevice_numberOfChannelsInLayoutForScope___block_invoke_2(uint64_t a1)
{
  void *v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v2 = (void *)MEMORY[0x22073330C]();
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v3 = *(id *)(*(_QWORD *)(a1 + 32) + 80);
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v10;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v10 != v6)
          objc_enumerationMutation(v3);
        objc_msgSend(*(id *)(*((_QWORD *)&v9 + 1) + 8 * v7), "physicalFormat", (_QWORD)v9);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) += objc_msgSend(v8, "channelsPerFrame");

        ++v7;
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v5);
  }

  objc_autoreleasePoolPop(v2);
}

- (unsigned)channelLayoutTagForScope:(unsigned int)a3
{
  return 0;
}

- (unsigned)channelLayoutBitmapForScope:(unsigned int)a3
{
  return 0;
}

- (void)preferredChannelDescriptions:(AudioChannelDescription *)a3 numberOfChannels:(unsigned int)a4 forScope:(unsigned int)a5
{
  NSObject *outputStreamQueue;
  _QWORD *v6;
  _QWORD v7[6];
  unsigned int v8;
  _QWORD v9[6];
  unsigned int v10;

  if (a5 == 1869968496)
  {
    outputStreamQueue = self->_outputStreamQueue;
    v7[0] = MEMORY[0x24BDAC760];
    v7[1] = 3221225472;
    v7[2] = __73__ASDAudioDevice_preferredChannelDescriptions_numberOfChannels_forScope___block_invoke_39;
    v7[3] = &unk_24DBCA640;
    v8 = a4;
    v7[4] = self;
    v7[5] = a3;
    v6 = v7;
  }
  else
  {
    if (a5 != 1768845428)
      return;
    outputStreamQueue = self->_inputStreamQueue;
    v9[0] = MEMORY[0x24BDAC760];
    v9[1] = 3221225472;
    v9[2] = __73__ASDAudioDevice_preferredChannelDescriptions_numberOfChannels_forScope___block_invoke;
    v9[3] = &unk_24DBCA640;
    v10 = a4;
    v9[4] = self;
    v9[5] = a3;
    v6 = v9;
  }
  dispatch_sync(outputStreamQueue, v6);
}

void __73__ASDAudioDevice_preferredChannelDescriptions_numberOfChannels_forScope___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  NSObject *v4;
  uint64_t i;
  void *v6;
  int v7;
  objc_class *v8;
  id v9;
  uint64_t v10;
  void *v11;
  int v12;
  unint64_t v13;
  int v14;
  objc_class *v15;
  id v16;
  uint64_t v17;
  void *v18;
  unsigned int v19;
  void *context;
  id obj;
  uint64_t v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  float v27;
  uint64_t v28;
  float v29;
  uint64_t v30;
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x24BDAC8D0];
  context = (void *)MEMORY[0x22073330C]();
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  obj = *(id *)(*(_QWORD *)(a1 + 32) + 64);
  v2 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v23, v31, 16);
  if (v2)
  {
    v3 = v2;
    v22 = *(_QWORD *)v24;
    v4 = MEMORY[0x24BDACB70];
    do
    {
      for (i = 0; i != v3; ++i)
      {
        if (*(_QWORD *)v24 != v22)
          objc_enumerationMutation(obj);
        v6 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * i);
        v7 = objc_msgSend(v6, "startingChannel");
        if (!v7)
        {
          v8 = (objc_class *)objc_opt_class();
          NSStringFromClass(v8);
          v9 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
          v10 = objc_msgSend(v9, "cStringUsingEncoding:", 4);

          if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
            __73__ASDAudioDevice_preferredChannelDescriptions_numberOfChannels_forScope___block_invoke_cold_2(&v29, v10, &v30);
          v7 = 1;
        }
        objc_msgSend(v6, "physicalFormat");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = objc_msgSend(v11, "channelsPerFrame");

        if (v12)
        {
          v13 = 0;
          v14 = v7 - 1;
          do
          {
            if ((v14 + v13) >= *(_DWORD *)(a1 + 48))
            {
              v15 = (objc_class *)objc_opt_class();
              NSStringFromClass(v15);
              v16 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
              v17 = objc_msgSend(v16, "cStringUsingEncoding:", 4);

              if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
                __73__ASDAudioDevice_preferredChannelDescriptions_numberOfChannels_forScope___block_invoke_cold_1(&v27, v17, &v28);
            }
            else
            {
              objc_msgSend(v6, "preferredChannelDescription:forChannelIndex:", *(_QWORD *)(a1 + 40) + 20 * (v14 + v13), v13);
            }
            ++v13;
            objc_msgSend(v6, "physicalFormat");
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            v19 = objc_msgSend(v18, "channelsPerFrame");

          }
          while (v13 < v19);
        }
      }
      v3 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v23, v31, 16);
    }
    while (v3);
  }

  objc_autoreleasePoolPop(context);
}

void __73__ASDAudioDevice_preferredChannelDescriptions_numberOfChannels_forScope___block_invoke_39(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  NSObject *v4;
  uint64_t i;
  void *v6;
  int v7;
  objc_class *v8;
  id v9;
  uint64_t v10;
  void *v11;
  int v12;
  unint64_t v13;
  int v14;
  objc_class *v15;
  id v16;
  uint64_t v17;
  void *v18;
  unsigned int v19;
  void *context;
  id obj;
  uint64_t v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  float v27;
  uint64_t v28;
  float v29;
  uint64_t v30;
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x24BDAC8D0];
  context = (void *)MEMORY[0x22073330C]();
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  obj = *(id *)(*(_QWORD *)(a1 + 32) + 80);
  v2 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v23, v31, 16);
  if (v2)
  {
    v3 = v2;
    v22 = *(_QWORD *)v24;
    v4 = MEMORY[0x24BDACB70];
    do
    {
      for (i = 0; i != v3; ++i)
      {
        if (*(_QWORD *)v24 != v22)
          objc_enumerationMutation(obj);
        v6 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * i);
        v7 = objc_msgSend(v6, "startingChannel");
        if (!v7)
        {
          v8 = (objc_class *)objc_opt_class();
          NSStringFromClass(v8);
          v9 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
          v10 = objc_msgSend(v9, "cStringUsingEncoding:", 4);

          if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
            __73__ASDAudioDevice_preferredChannelDescriptions_numberOfChannels_forScope___block_invoke_cold_2(&v29, v10, &v30);
          v7 = 1;
        }
        objc_msgSend(v6, "physicalFormat");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = objc_msgSend(v11, "channelsPerFrame");

        if (v12)
        {
          v13 = 0;
          v14 = v7 - 1;
          do
          {
            if ((v14 + v13) >= *(_DWORD *)(a1 + 48))
            {
              v15 = (objc_class *)objc_opt_class();
              NSStringFromClass(v15);
              v16 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
              v17 = objc_msgSend(v16, "cStringUsingEncoding:", 4);

              if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
                __73__ASDAudioDevice_preferredChannelDescriptions_numberOfChannels_forScope___block_invoke_cold_1(&v27, v17, &v28);
            }
            else
            {
              objc_msgSend(v6, "preferredChannelDescription:forChannelIndex:", *(_QWORD *)(a1 + 40) + 20 * (v14 + v13), v13);
            }
            ++v13;
            objc_msgSend(v6, "physicalFormat");
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            v19 = objc_msgSend(v18, "channelsPerFrame");

          }
          while (v13 < v19);
        }
      }
      v3 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v23, v31, 16);
    }
    while (v3);
  }

  objc_autoreleasePoolPop(context);
}

- (unsigned)calculateIOBufferFrameSize:(unsigned int)a3
{
  return a3;
}

- (int)addClient:(const AudioServerPlugInClientInfo *)a3
{
  return 0;
}

- (int)removeClient:(const AudioServerPlugInClientInfo *)a3
{
  return 0;
}

- (int)startIOForClient:(unsigned int)a3
{
  NSObject *ioReferenceQueue;
  int v4;
  _QWORD v6[6];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  int v10;

  v7 = 0;
  v8 = &v7;
  v9 = 0x2020000000;
  v10 = 0;
  ioReferenceQueue = self->_ioReferenceQueue;
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __35__ASDAudioDevice_startIOForClient___block_invoke;
  v6[3] = &unk_24DBCA618;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(ioReferenceQueue, v6);
  v4 = *((_DWORD *)v8 + 6);
  _Block_object_dispose(&v7, 8);
  return v4;
}

void __35__ASDAudioDevice_startIOForClient___block_invoke(uint64_t a1)
{
  void *v2;

  if (!*(_QWORD *)(*(_QWORD *)(a1 + 32) + 136))
  {
    v2 = (void *)MEMORY[0x22073330C]();
    *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = objc_msgSend(*(id *)(a1 + 32), "performStartIO");
    objc_autoreleasePoolPop(v2);
  }
  if (!*(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24))
    ++*(_QWORD *)(*(_QWORD *)(a1 + 32) + 136);
}

- (int)stopIOForClient:(unsigned int)a3
{
  NSObject *ioReferenceQueue;
  int v4;
  _QWORD v6[6];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  int v10;

  v7 = 0;
  v8 = &v7;
  v9 = 0x2020000000;
  v10 = 0;
  ioReferenceQueue = self->_ioReferenceQueue;
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __34__ASDAudioDevice_stopIOForClient___block_invoke;
  v6[3] = &unk_24DBCA618;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(ioReferenceQueue, v6);
  v4 = *((_DWORD *)v8 + 6);
  _Block_object_dispose(&v7, 8);
  return v4;
}

void __34__ASDAudioDevice_stopIOForClient___block_invoke(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  BOOL v3;
  uint64_t v4;
  void *v6;

  v1 = *(_QWORD *)(a1 + 32);
  v2 = *(_QWORD *)(v1 + 136);
  v3 = v2 < 1;
  v4 = v2 - 1;
  if (!v3)
  {
    *(_QWORD *)(v1 + 136) = v4;
    if (!*(_QWORD *)(*(_QWORD *)(a1 + 32) + 136))
    {
      v6 = (void *)MEMORY[0x22073330C]();
      *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = objc_msgSend(*(id *)(a1 + 32), "performStopIO");
      objc_autoreleasePoolPop(v6);
    }
  }
}

- (int)performStartIO
{
  void *v4;
  void *v5;
  id getZeroTimestampBlock;
  void *v7;
  void *v8;
  id willDoReadInputBlock;
  void *v10;
  void *v11;
  id willDoConvertInputBlock;
  void *v13;
  void *v14;
  id willDoProcessInputBlock;
  void *v16;
  void *v17;
  id willDoProcessOutputBlock;
  void *v19;
  void *v20;
  id willDoMixOutputBlock;
  void *v22;
  void *v23;
  id willDoProcessMixBlock;
  void *v25;
  void *v26;
  id willDoConvertMixBlock;
  void *v28;
  void *v29;
  id willDoWriteMixBlock;
  void *v31;
  void *v32;
  id beginIOOperationBlock;
  void *v34;
  void *v35;
  id endIOOperationBlock;
  NSObject *inputStreamQueue;
  uint64_t v38;
  NSObject *outputStreamQueue;
  void *v40;
  void *v42;
  uint64_t v43;
  uint64_t v44;
  _QWORD v45[6];
  _QWORD block[6];
  _QWORD v47[3];
  char v48;
  _QWORD v49[3];
  char v50;

  if (-[ASDAudioDevice isRunning](self, "isRunning"))
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("ASDAudioDevice.m"), 1817, CFSTR("performStartIO should only be called when IO is not running"));

  }
  -[ASDAudioDevice getZeroTimestampBlock](self, "getZeroTimestampBlock");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v4, "copy");
  getZeroTimestampBlock = self->_getZeroTimestampBlock;
  self->_getZeroTimestampBlock = v5;

  self->_getZeroTimestampBlockUnretained = self->_getZeroTimestampBlock;
  -[ASDAudioDevice willDoReadInputBlock](self, "willDoReadInputBlock");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v7, "copy");
  willDoReadInputBlock = self->_willDoReadInputBlock;
  self->_willDoReadInputBlock = v8;

  self->_willDoReadInputBlockUnretained = self->_willDoReadInputBlock;
  -[ASDAudioDevice willDoConvertInputBlock](self, "willDoConvertInputBlock");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend(v10, "copy");
  willDoConvertInputBlock = self->_willDoConvertInputBlock;
  self->_willDoConvertInputBlock = v11;

  self->_willDoConvertInputBlockUnretained = self->_willDoConvertInputBlock;
  -[ASDAudioDevice willDoProcessInputBlock](self, "willDoProcessInputBlock");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (void *)objc_msgSend(v13, "copy");
  willDoProcessInputBlock = self->_willDoProcessInputBlock;
  self->_willDoProcessInputBlock = v14;

  self->_willDoProcessInputBlockUnretained = self->_willDoProcessInputBlock;
  -[ASDAudioDevice willDoProcessOutputBlock](self, "willDoProcessOutputBlock");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = (void *)objc_msgSend(v16, "copy");
  willDoProcessOutputBlock = self->_willDoProcessOutputBlock;
  self->_willDoProcessOutputBlock = v17;

  self->_willDoProcessOutputBlockUnretained = self->_willDoProcessOutputBlock;
  -[ASDAudioDevice willDoMixOutputBlock](self, "willDoMixOutputBlock");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = (void *)objc_msgSend(v19, "copy");
  willDoMixOutputBlock = self->_willDoMixOutputBlock;
  self->_willDoMixOutputBlock = v20;

  self->_willDoMixOutputBlockUnretained = self->_willDoMixOutputBlock;
  -[ASDAudioDevice willDoProcessMixBlock](self, "willDoProcessMixBlock");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = (void *)objc_msgSend(v22, "copy");
  willDoProcessMixBlock = self->_willDoProcessMixBlock;
  self->_willDoProcessMixBlock = v23;

  self->_willDoProcessMixBlockUnretained = self->_willDoProcessMixBlock;
  -[ASDAudioDevice willDoConvertMixBlock](self, "willDoConvertMixBlock");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = (void *)objc_msgSend(v25, "copy");
  willDoConvertMixBlock = self->_willDoConvertMixBlock;
  self->_willDoConvertMixBlock = v26;

  self->_willDoConvertMixBlockUnretained = self->_willDoConvertMixBlock;
  -[ASDAudioDevice willDoWriteMixBlock](self, "willDoWriteMixBlock");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = (void *)objc_msgSend(v28, "copy");
  willDoWriteMixBlock = self->_willDoWriteMixBlock;
  self->_willDoWriteMixBlock = v29;

  self->_willDoWriteMixBlockUnretained = self->_willDoWriteMixBlock;
  -[ASDAudioDevice beginIOOperationBlock](self, "beginIOOperationBlock");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = (void *)objc_msgSend(v31, "copy");
  beginIOOperationBlock = self->_beginIOOperationBlock;
  self->_beginIOOperationBlock = v32;

  self->_beginIOOperationBlockUnretained = self->_beginIOOperationBlock;
  -[ASDAudioDevice endIOOperationBlock](self, "endIOOperationBlock");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v35 = (void *)objc_msgSend(v34, "copy");
  endIOOperationBlock = self->_endIOOperationBlock;
  self->_endIOOperationBlock = v35;

  self->_endIOOperationBlockUnretained = self->_endIOOperationBlock;
  v49[0] = 0;
  v49[1] = v49;
  v49[2] = 0x2020000000;
  v50 = 0;
  v47[0] = 0;
  v47[1] = v47;
  v47[2] = 0x2020000000;
  v48 = 0;
  inputStreamQueue = self->_inputStreamQueue;
  v38 = MEMORY[0x24BDAC760];
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __32__ASDAudioDevice_performStartIO__block_invoke;
  block[3] = &unk_24DBCA618;
  block[4] = self;
  block[5] = v49;
  dispatch_sync(inputStreamQueue, block);
  outputStreamQueue = self->_outputStreamQueue;
  v45[0] = v38;
  v45[1] = 3221225472;
  v45[2] = __32__ASDAudioDevice_performStartIO__block_invoke_2;
  v45[3] = &unk_24DBCA618;
  v45[4] = self;
  v45[5] = v47;
  dispatch_sync(outputStreamQueue, v45);
  self->_isRunning = 1;
  LODWORD(v44) = 0;
  -[ASDObject propertyChangedDelegate](self, "propertyChangedDelegate", 0x676C6F62676F696ELL, v44);
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v40, "changedProperty:forObject:", &v43, self);

  _Block_object_dispose(v47, 8);
  _Block_object_dispose(v49, 8);
  return 0;
}

void __32__ASDAudioDevice_performStartIO__block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v2 = (void *)MEMORY[0x22073330C]();
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v3 = *(id *)(*(_QWORD *)(a1 + 32) + 64);
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v9;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v9 != v6)
          objc_enumerationMutation(v3);
        objc_msgSend(*(id *)(*((_QWORD *)&v8 + 1) + 8 * v7), "startStream", (_QWORD)v8);
        *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
        ++v7;
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    }
    while (v5);
  }

  objc_autoreleasePoolPop(v2);
}

void __32__ASDAudioDevice_performStartIO__block_invoke_2(uint64_t a1)
{
  void *v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v2 = (void *)MEMORY[0x22073330C]();
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v3 = *(id *)(*(_QWORD *)(a1 + 32) + 80);
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v9;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v9 != v6)
          objc_enumerationMutation(v3);
        objc_msgSend(*(id *)(*((_QWORD *)&v8 + 1) + 8 * v7), "startStream", (_QWORD)v8);
        *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
        ++v7;
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    }
    while (v5);
  }

  objc_autoreleasePoolPop(v2);
}

- (int)performStopIO
{
  NSObject *outputStreamQueue;
  uint64_t v5;
  NSObject *inputStreamQueue;
  id getZeroTimestampBlock;
  id willDoReadInputBlock;
  id willDoConvertInputBlock;
  id willDoProcessInputBlock;
  id willDoProcessOutputBlock;
  id willDoMixOutputBlock;
  id willDoProcessMixBlock;
  id willDoConvertMixBlock;
  id willDoWriteMixBlock;
  id beginIOOperationBlock;
  id endIOOperationBlock;
  void *v18;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  _QWORD v23[5];
  _QWORD block[5];

  if (!-[ASDAudioDevice isRunning](self, "isRunning"))
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("ASDAudioDevice.m"), 1893, CFSTR("performStopIO should only be called when IO is running"));

  }
  outputStreamQueue = self->_outputStreamQueue;
  v5 = MEMORY[0x24BDAC760];
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __31__ASDAudioDevice_performStopIO__block_invoke;
  block[3] = &unk_24DBCA460;
  block[4] = self;
  dispatch_sync(outputStreamQueue, block);
  inputStreamQueue = self->_inputStreamQueue;
  v23[0] = v5;
  v23[1] = 3221225472;
  v23[2] = __31__ASDAudioDevice_performStopIO__block_invoke_2;
  v23[3] = &unk_24DBCA460;
  v23[4] = self;
  dispatch_sync(inputStreamQueue, v23);
  self->_isRunning = 0;
  getZeroTimestampBlock = self->_getZeroTimestampBlock;
  self->_getZeroTimestampBlock = 0;

  self->_getZeroTimestampBlockUnretained = 0;
  willDoReadInputBlock = self->_willDoReadInputBlock;
  self->_willDoReadInputBlock = 0;

  self->_willDoReadInputBlockUnretained = 0;
  willDoConvertInputBlock = self->_willDoConvertInputBlock;
  self->_willDoConvertInputBlock = 0;

  self->_willDoConvertInputBlockUnretained = 0;
  willDoProcessInputBlock = self->_willDoProcessInputBlock;
  self->_willDoProcessInputBlock = 0;

  self->_willDoProcessInputBlockUnretained = 0;
  willDoProcessOutputBlock = self->_willDoProcessOutputBlock;
  self->_willDoProcessOutputBlock = 0;

  self->_willDoProcessOutputBlockUnretained = 0;
  willDoMixOutputBlock = self->_willDoMixOutputBlock;
  self->_willDoMixOutputBlock = 0;

  self->_willDoMixOutputBlockUnretained = 0;
  willDoProcessMixBlock = self->_willDoProcessMixBlock;
  self->_willDoProcessMixBlock = 0;

  self->_willDoProcessMixBlockUnretained = 0;
  willDoConvertMixBlock = self->_willDoConvertMixBlock;
  self->_willDoConvertMixBlock = 0;

  self->_willDoConvertMixBlockUnretained = 0;
  willDoWriteMixBlock = self->_willDoWriteMixBlock;
  self->_willDoWriteMixBlock = 0;

  self->_willDoWriteMixBlockUnretained = 0;
  beginIOOperationBlock = self->_beginIOOperationBlock;
  self->_beginIOOperationBlock = 0;

  self->_beginIOOperationBlockUnretained = 0;
  endIOOperationBlock = self->_endIOOperationBlock;
  self->_endIOOperationBlock = 0;

  self->_endIOOperationBlockUnretained = 0;
  LODWORD(v22) = 0;
  -[ASDObject propertyChangedDelegate](self, "propertyChangedDelegate", 0x676C6F62676F696ELL, v22);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "changedProperty:forObject:", &v21, self);

  return 0;
}

void __31__ASDAudioDevice_performStopIO__block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v2 = (void *)MEMORY[0x22073330C]();
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v3 = *(id *)(*(_QWORD *)(a1 + 32) + 80);
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v9;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v9 != v6)
          objc_enumerationMutation(v3);
        objc_msgSend(*(id *)(*((_QWORD *)&v8 + 1) + 8 * v7++), "stopStream", (_QWORD)v8);
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    }
    while (v5);
  }

  objc_autoreleasePoolPop(v2);
}

void __31__ASDAudioDevice_performStopIO__block_invoke_2(uint64_t a1)
{
  void *v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v2 = (void *)MEMORY[0x22073330C]();
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v3 = *(id *)(*(_QWORD *)(a1 + 32) + 64);
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v9;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v9 != v6)
          objc_enumerationMutation(v3);
        objc_msgSend(*(id *)(*((_QWORD *)&v8 + 1) + 8 * v7++), "stopStream", (_QWORD)v8);
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    }
    while (v5);
  }

  objc_autoreleasePoolPop(v2);
}

- (void)setSamplingRate:(double)a3
{
  NSObject *sampleRateQueue;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  _QWORD block[6];

  sampleRateQueue = self->_sampleRateQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __34__ASDAudioDevice_setSamplingRate___block_invoke;
  block[3] = &unk_24DBCA528;
  block[4] = self;
  *(double *)&block[5] = a3;
  dispatch_sync(sampleRateQueue, block);
  LODWORD(v7) = 0;
  -[ASDObject propertyChangedDelegate](self, "propertyChangedDelegate", 0x676C6F626E737274, v7);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "changedProperty:forObject:", &v6, self);

}

void __34__ASDAudioDevice_setSamplingRate___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  NSObject *v7;
  _QWORD v8[6];
  _QWORD block[6];

  v2 = (void *)MEMORY[0x22073330C]();
  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 112) = *(_QWORD *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "_updateTimestampPeriod:", *(double *)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 32), "_updateSafetyOffsets:", *(double *)(a1 + 40));
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(NSObject **)(v3 + 72);
  v5 = MEMORY[0x24BDAC760];
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __34__ASDAudioDevice_setSamplingRate___block_invoke_2;
  block[3] = &unk_24DBCA528;
  block[4] = v3;
  block[5] = *(_QWORD *)(a1 + 40);
  dispatch_sync(v4, block);
  v6 = *(_QWORD *)(a1 + 32);
  v7 = *(NSObject **)(v6 + 88);
  v8[0] = v5;
  v8[1] = 3221225472;
  v8[2] = __34__ASDAudioDevice_setSamplingRate___block_invoke_3;
  v8[3] = &unk_24DBCA528;
  v8[4] = v6;
  v8[5] = *(_QWORD *)(a1 + 40);
  dispatch_sync(v7, v8);
  objc_autoreleasePoolPop(v2);
}

void __34__ASDAudioDevice_setSamplingRate___block_invoke_2(uint64_t a1)
{
  void *v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v2 = (void *)MEMORY[0x22073330C]();
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v3 = *(id *)(*(_QWORD *)(a1 + 32) + 64);
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v9;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v9 != v6)
          objc_enumerationMutation(v3);
        objc_msgSend(*(id *)(*((_QWORD *)&v8 + 1) + 8 * v7++), "deviceChangedToSamplingRate:", *(double *)(a1 + 40), (_QWORD)v8);
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    }
    while (v5);
  }

  objc_autoreleasePoolPop(v2);
}

void __34__ASDAudioDevice_setSamplingRate___block_invoke_3(uint64_t a1)
{
  void *v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v2 = (void *)MEMORY[0x22073330C]();
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v3 = *(id *)(*(_QWORD *)(a1 + 32) + 80);
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v9;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v9 != v6)
          objc_enumerationMutation(v3);
        objc_msgSend(*(id *)(*((_QWORD *)&v8 + 1) + 8 * v7++), "deviceChangedToSamplingRate:", *(double *)(a1 + 40), (_QWORD)v8);
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    }
    while (v5);
  }

  objc_autoreleasePoolPop(v2);
}

- (double)samplingRate
{
  NSObject *sampleRateQueue;
  double v3;
  _QWORD v5[6];
  uint64_t v6;
  double *v7;
  uint64_t v8;
  uint64_t v9;

  v6 = 0;
  v7 = (double *)&v6;
  v8 = 0x2020000000;
  v9 = 0;
  sampleRateQueue = self->_sampleRateQueue;
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __30__ASDAudioDevice_samplingRate__block_invoke;
  v5[3] = &unk_24DBCA398;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(sampleRateQueue, v5);
  v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

double __30__ASDAudioDevice_samplingRate__block_invoke(uint64_t a1)
{
  double result;

  result = *(double *)(*(_QWORD *)(a1 + 32) + 112);
  *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (BOOL)changeSamplingRate:(double)a3
{
  return 0;
}

- (void)setSamplingRates:(id)a3
{
  id v4;
  NSObject *sampleRateQueue;
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t block;
  uint64_t v11;
  void (*v12)(uint64_t);
  void *v13;
  ASDAudioDevice *v14;
  id v15;

  v4 = a3;
  sampleRateQueue = self->_sampleRateQueue;
  block = MEMORY[0x24BDAC760];
  v11 = 3221225472;
  v12 = __35__ASDAudioDevice_setSamplingRates___block_invoke;
  v13 = &unk_24DBCA438;
  v14 = self;
  v15 = v4;
  v6 = v4;
  dispatch_sync(sampleRateQueue, &block);
  LODWORD(v9) = 0;
  -[ASDObject propertyChangedDelegate](self, "propertyChangedDelegate", 0x676C6F626E737223, v9, block, v11, v12, v13, v14);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "changedProperty:forObject:", &v8, self);

}

void __35__ASDAudioDevice_setSamplingRates___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;

  v2 = (void *)MEMORY[0x22073330C]();
  v3 = objc_msgSend(*(id *)(a1 + 40), "copy");
  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(void **)(v4 + 120);
  *(_QWORD *)(v4 + 120) = v3;

  objc_autoreleasePoolPop(v2);
}

- (NSArray)samplingRates
{
  NSObject *sampleRateQueue;
  id v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  id v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3032000000;
  v9 = __Block_byref_object_copy__3;
  v10 = __Block_byref_object_dispose__3;
  v11 = 0;
  sampleRateQueue = self->_sampleRateQueue;
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __31__ASDAudioDevice_samplingRates__block_invoke;
  v5[3] = &unk_24DBCA398;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(sampleRateQueue, v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (NSArray *)v3;
}

void __31__ASDAudioDevice_samplingRates__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  v2 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 120), "copy");
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (void)setDeviceName:(id)a3
{
  NSString *v4;
  NSString *deviceName;
  void *v6;
  uint64_t v7;
  uint64_t v8;

  v4 = (NSString *)objc_msgSend(a3, "copy");
  deviceName = self->_deviceName;
  self->_deviceName = v4;

  LODWORD(v8) = 0;
  -[ASDObject propertyChangedDelegate](self, "propertyChangedDelegate", 0x676C6F626C6E616DLL, v8);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "changedProperty:forObject:", &v7, self);

}

- (NSString)deviceName
{
  return self->_deviceName;
}

- (BOOL)changeDeviceName:(id)a3
{
  return 0;
}

- (void)setClientDescription:(id)a3
{
  NSDictionary *v4;
  NSDictionary *clientDescription;
  void *v6;
  uint64_t v7;
  uint64_t v8;

  v4 = (NSDictionary *)objc_msgSend(a3, "copy");
  clientDescription = self->_clientDescription;
  self->_clientDescription = v4;

  LODWORD(v8) = 0;
  -[ASDObject propertyChangedDelegate](self, "propertyChangedDelegate", 0x676C6F6263646573, v8);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "changedProperty:forObject:", &v7, self);

}

- (NSDictionary)clientDescription
{
  return self->_clientDescription;
}

- (BOOL)changeClientDescription:(id)a3
{
  return 0;
}

- (void)setDeviceDescription:(id)a3
{
  NSDictionary *v4;
  NSDictionary *deviceDescription;
  void *v6;
  uint64_t v7;
  uint64_t v8;

  v4 = (NSDictionary *)objc_msgSend(a3, "copy");
  deviceDescription = self->_deviceDescription;
  self->_deviceDescription = v4;

  LODWORD(v8) = 0;
  -[ASDObject propertyChangedDelegate](self, "propertyChangedDelegate", 0x676C6F6264646573, v8);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "changedProperty:forObject:", &v7, self);

}

- (NSDictionary)deviceDescription
{
  return self->_deviceDescription;
}

- (void)setTimestampPeriod:(unsigned int)a3
{
  void *v4;
  uint64_t v5;
  uint64_t v6;

  if (self->_timestampPeriod != a3)
  {
    self->_timestampPeriod = a3;
    LODWORD(v6) = 0;
    -[ASDObject propertyChangedDelegate](self, "propertyChangedDelegate", 0x676C6F6272696E67, v6);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "changedProperty:forObject:", &v5, self);

  }
}

- (unsigned)timestampPeriod
{
  return self->_timestampPeriod;
}

- (void)updateTimestampPeriod
{
  NSObject *sampleRateQueue;
  _QWORD block[5];

  sampleRateQueue = self->_sampleRateQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __39__ASDAudioDevice_updateTimestampPeriod__block_invoke;
  block[3] = &unk_24DBCA460;
  block[4] = self;
  dispatch_sync(sampleRateQueue, block);
}

void __39__ASDAudioDevice_updateTimestampPeriod__block_invoke(uint64_t a1)
{
  void *v2;

  v2 = (void *)MEMORY[0x22073330C]();
  objc_msgSend(*(id *)(a1 + 32), "_updateTimestampPeriod:", *(double *)(*(_QWORD *)(a1 + 32) + 112));
  objc_autoreleasePoolPop(v2);
}

- (BOOL)hasInput
{
  NSObject *inputStreamQueue;
  char v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  char v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  inputStreamQueue = self->_inputStreamQueue;
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __26__ASDAudioDevice_hasInput__block_invoke;
  v5[3] = &unk_24DBCA618;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(inputStreamQueue, v5);
  v3 = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __26__ASDAudioDevice_hasInput__block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 64), "count");
  if (result)
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
  return result;
}

- (BOOL)hasOutput
{
  NSObject *outputStreamQueue;
  char v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  char v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  outputStreamQueue = self->_outputStreamQueue;
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __27__ASDAudioDevice_hasOutput__block_invoke;
  v5[3] = &unk_24DBCA618;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(outputStreamQueue, v5);
  v3 = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __27__ASDAudioDevice_hasOutput__block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 80), "count");
  if (result)
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
  return result;
}

- (BOOL)isRunning
{
  return self->_isRunning;
}

- (OS_dispatch_queue)ioReferenceQueue
{
  return self->_ioReferenceQueue;
}

- (void)setInputLatency:(unsigned int)a3
{
  void *v4;
  uint64_t v5;
  uint64_t v6;

  self->_inputLatency = a3;
  LODWORD(v6) = 0;
  -[ASDObject propertyChangedDelegate](self, "propertyChangedDelegate", 0x696E70746C746E63, v6);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "changedProperty:forObject:", &v5, self);

}

- (unsigned)inputLatency
{
  return self->_inputLatency;
}

- (void)setOutputLatency:(unsigned int)a3
{
  void *v4;
  uint64_t v5;
  uint64_t v6;

  self->_outputLatency = a3;
  LODWORD(v6) = 0;
  -[ASDObject propertyChangedDelegate](self, "propertyChangedDelegate", 0x6F7574706C746E63, v6);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "changedProperty:forObject:", &v5, self);

}

- (unsigned)outputLatency
{
  return self->_outputLatency;
}

- (void)setInputSafetyOffset:(unsigned int)a3
{
  void *v4;
  uint64_t v5;
  uint64_t v6;

  self->_inputSafetyOffset = a3;
  LODWORD(v6) = 0;
  -[ASDObject propertyChangedDelegate](self, "propertyChangedDelegate", 0x696E707473616674, v6);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "changedProperty:forObject:", &v5, self);

}

- (unsigned)inputSafetyOffset
{
  return self->_inputSafetyOffset;
}

- (void)setOutputSafetyOffset:(unsigned int)a3
{
  void *v4;
  uint64_t v5;
  uint64_t v6;

  self->_outputSafetyOffset = a3;
  LODWORD(v6) = 0;
  -[ASDObject propertyChangedDelegate](self, "propertyChangedDelegate", 0x6F75747073616674, v6);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "changedProperty:forObject:", &v5, self);

}

- (unsigned)outputSafetyOffset
{
  return self->_outputSafetyOffset;
}

- (void)setClockDomain:(unsigned int)a3
{
  void *v4;
  uint64_t v5;
  uint64_t v6;

  self->_clockDomain = a3;
  LODWORD(v6) = 0;
  -[ASDObject propertyChangedDelegate](self, "propertyChangedDelegate", 0x676C6F62636C6B64, v6);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "changedProperty:forObject:", &v5, self);

}

- (unsigned)clockDomain
{
  return self->_clockDomain;
}

- (void)setClockAlgorithm:(unsigned int)a3
{
  void *v4;
  uint64_t v5;
  uint64_t v6;

  self->_clockAlgorithm = a3;
  LODWORD(v6) = 0;
  -[ASDObject propertyChangedDelegate](self, "propertyChangedDelegate", 0x676C6F62636C6F6BLL, v6);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "changedProperty:forObject:", &v5, self);

}

- (unsigned)clockAlgorithm
{
  return self->_clockAlgorithm;
}

- (void)setClockIsStable:(BOOL)a3
{
  void *v4;
  uint64_t v5;
  uint64_t v6;

  self->_clockIsStable = a3;
  LODWORD(v6) = 0;
  -[ASDObject propertyChangedDelegate](self, "propertyChangedDelegate", 0x676C6F6263737462, v6);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "changedProperty:forObject:", &v5, self);

}

- (BOOL)clockIsStable
{
  return self->_clockIsStable;
}

- (void)setTransportType:(unsigned int)a3
{
  void *v4;
  uint64_t v5;
  uint64_t v6;

  self->_transportType = a3;
  LODWORD(v6) = 0;
  -[ASDObject propertyChangedDelegate](self, "propertyChangedDelegate", 0x676C6F627472616ELL, v6);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "changedProperty:forObject:", &v5, self);

}

- (unsigned)transportType
{
  return self->_transportType;
}

- (void)setGetZeroTimestampBlock:(id)a3
{
  void *v5;
  id getZeroTimestampBlock;
  void *v7;
  id v8;

  v8 = a3;
  if (-[ASDAudioDevice isRunning](self, "isRunning"))
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("ASDAudioDevice.m"), 2321, CFSTR("Can't set block when IO is running"));

  }
  v5 = (void *)objc_msgSend(v8, "copy");
  getZeroTimestampBlock = self->_getZeroTimestampBlock;
  self->_getZeroTimestampBlock = v5;

  self->_getZeroTimestampBlockUnretained = self->_getZeroTimestampBlock;
}

- (void)setWillDoReadInputBlock:(id)a3
{
  void *v5;
  id willDoReadInputBlock;
  void *v7;
  id v8;

  v8 = a3;
  if (-[ASDAudioDevice isRunning](self, "isRunning"))
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("ASDAudioDevice.m"), 2328, CFSTR("Can't set block when IO is running"));

  }
  v5 = (void *)objc_msgSend(v8, "copy");
  willDoReadInputBlock = self->_willDoReadInputBlock;
  self->_willDoReadInputBlock = v5;

  self->_willDoReadInputBlockUnretained = self->_willDoReadInputBlock;
}

- (void)setWillDoConvertInputBlock:(id)a3
{
  void *v5;
  id willDoConvertInputBlock;
  void *v7;
  id v8;

  v8 = a3;
  if (-[ASDAudioDevice isRunning](self, "isRunning"))
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("ASDAudioDevice.m"), 2335, CFSTR("Can't set block when IO is running"));

  }
  v5 = (void *)objc_msgSend(v8, "copy");
  willDoConvertInputBlock = self->_willDoConvertInputBlock;
  self->_willDoConvertInputBlock = v5;

  self->_willDoConvertInputBlockUnretained = self->_willDoConvertInputBlock;
}

- (void)setWillDoProcessInputBlock:(id)a3
{
  void *v5;
  id willDoProcessInputBlock;
  void *v7;
  id v8;

  v8 = a3;
  if (-[ASDAudioDevice isRunning](self, "isRunning"))
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("ASDAudioDevice.m"), 2342, CFSTR("Can't set block when IO is running"));

  }
  v5 = (void *)objc_msgSend(v8, "copy");
  willDoProcessInputBlock = self->_willDoProcessInputBlock;
  self->_willDoProcessInputBlock = v5;

  self->_willDoProcessInputBlockUnretained = self->_willDoProcessInputBlock;
}

- (void)setWillDoProcessOutputBlock:(id)a3
{
  void *v5;
  id willDoProcessOutputBlock;
  void *v7;
  id v8;

  v8 = a3;
  if (-[ASDAudioDevice isRunning](self, "isRunning"))
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("ASDAudioDevice.m"), 2349, CFSTR("Can't set block when IO is running"));

  }
  v5 = (void *)objc_msgSend(v8, "copy");
  willDoProcessOutputBlock = self->_willDoProcessOutputBlock;
  self->_willDoProcessOutputBlock = v5;

  self->_willDoProcessOutputBlockUnretained = self->_willDoProcessOutputBlock;
}

- (void)setWillDoMixOutputBlock:(id)a3
{
  void *v5;
  id willDoMixOutputBlock;
  void *v7;
  id v8;

  v8 = a3;
  if (-[ASDAudioDevice isRunning](self, "isRunning"))
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("ASDAudioDevice.m"), 2356, CFSTR("Can't set block when IO is running"));

  }
  v5 = (void *)objc_msgSend(v8, "copy");
  willDoMixOutputBlock = self->_willDoMixOutputBlock;
  self->_willDoMixOutputBlock = v5;

  self->_willDoMixOutputBlockUnretained = self->_willDoMixOutputBlock;
}

- (void)setWillDoProcessMixBlock:(id)a3
{
  void *v5;
  id willDoProcessMixBlock;
  void *v7;
  id v8;

  v8 = a3;
  if (-[ASDAudioDevice isRunning](self, "isRunning"))
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("ASDAudioDevice.m"), 2363, CFSTR("Can't set block when IO is running"));

  }
  v5 = (void *)objc_msgSend(v8, "copy");
  willDoProcessMixBlock = self->_willDoProcessMixBlock;
  self->_willDoProcessMixBlock = v5;

  self->_willDoProcessMixBlockUnretained = self->_willDoProcessMixBlock;
}

- (void)setWillDoConvertMixBlock:(id)a3
{
  void *v5;
  id willDoConvertMixBlock;
  void *v7;
  id v8;

  v8 = a3;
  if (-[ASDAudioDevice isRunning](self, "isRunning"))
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("ASDAudioDevice.m"), 2369, CFSTR("Can't set block when IO is running"));

  }
  v5 = (void *)objc_msgSend(v8, "copy");
  willDoConvertMixBlock = self->_willDoConvertMixBlock;
  self->_willDoConvertMixBlock = v5;

  self->_willDoConvertMixBlockUnretained = self->_willDoConvertMixBlock;
}

- (void)setWillDoWriteMixBlock:(id)a3
{
  void *v5;
  id willDoWriteMixBlock;
  void *v7;
  id v8;

  v8 = a3;
  if (-[ASDAudioDevice isRunning](self, "isRunning"))
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("ASDAudioDevice.m"), 2376, CFSTR("Can't set block when IO is running"));

  }
  v5 = (void *)objc_msgSend(v8, "copy");
  willDoWriteMixBlock = self->_willDoWriteMixBlock;
  self->_willDoWriteMixBlock = v5;

  self->_willDoWriteMixBlockUnretained = self->_willDoWriteMixBlock;
}

- (void)setBeginIOOperationBlock:(id)a3
{
  void *v5;
  id beginIOOperationBlock;
  void *v7;
  id v8;

  v8 = a3;
  if (-[ASDAudioDevice isRunning](self, "isRunning"))
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("ASDAudioDevice.m"), 2383, CFSTR("Can't set block when IO is running"));

  }
  v5 = (void *)objc_msgSend(v8, "copy");
  beginIOOperationBlock = self->_beginIOOperationBlock;
  self->_beginIOOperationBlock = v5;

  self->_beginIOOperationBlockUnretained = self->_beginIOOperationBlock;
}

- (void)setEndIOOperationBlock:(id)a3
{
  void *v5;
  id endIOOperationBlock;
  void *v7;
  id v8;

  v8 = a3;
  if (-[ASDAudioDevice isRunning](self, "isRunning"))
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("ASDAudioDevice.m"), 2390, CFSTR("Can't set block when IO is running"));

  }
  v5 = (void *)objc_msgSend(v8, "copy");
  endIOOperationBlock = self->_endIOOperationBlock;
  self->_endIOOperationBlock = v5;

  self->_endIOOperationBlockUnretained = self->_endIOOperationBlock;
}

- (id)getZeroTimestampBlockUnretainedPtr
{
  return &self->_getZeroTimestampBlockUnretained;
}

- (id)willDoReadInputBlockUnretainedPtr
{
  return &self->_willDoReadInputBlockUnretained;
}

- (id)willDoConvertInputBlockUnretainedPtr
{
  return &self->_willDoConvertInputBlockUnretained;
}

- (id)willDoProcessInputBlockUnretainedPtr
{
  return &self->_willDoProcessInputBlockUnretained;
}

- (id)willDoProcessOutputBlockUnretainedPtr
{
  return &self->_willDoProcessOutputBlockUnretained;
}

- (id)willDoMixOutputBlockUnretainedPtr
{
  return &self->_willDoMixOutputBlockUnretained;
}

- (id)willDoProcessMixBlockUnretainedPtr
{
  return &self->_willDoProcessMixBlockUnretained;
}

- (id)willDoConvertMixBlockUnretainedPtr
{
  return &self->_willDoConvertMixBlockUnretained;
}

- (id)willDoWriteMixBlockUnretainedPtr
{
  return &self->_willDoWriteMixBlockUnretained;
}

- (id)beginIOOperationBlockUnretainedPtr
{
  return &self->_beginIOOperationBlockUnretained;
}

- (id)endIOOperationBlockUnretainedPtr
{
  return &self->_endIOOperationBlockUnretained;
}

- (void)systemWillSleep
{
  dispatch_semaphore_t v3;
  dispatch_semaphore_t v4;
  NSObject *v5;
  NSObject *v6;
  _QWORD v7[4];
  dispatch_semaphore_t v8;
  dispatch_semaphore_t v9;

  v3 = dispatch_semaphore_create(0);
  v4 = dispatch_semaphore_create(0);
  objc_storeStrong((id *)&self->_wakeSemaphore, v4);
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __33__ASDAudioDevice_systemWillSleep__block_invoke;
  v7[3] = &unk_24DBCA438;
  v8 = v3;
  v9 = v4;
  v5 = v4;
  v6 = v3;
  -[ASDAudioDevice requestConfigurationChange:](self, "requestConfigurationChange:", v7);
  dispatch_semaphore_wait(v6, 0xFFFFFFFFFFFFFFFFLL);

}

intptr_t __33__ASDAudioDevice_systemWillSleep__block_invoke(uint64_t a1)
{
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
  return dispatch_semaphore_wait(*(dispatch_semaphore_t *)(a1 + 40), 0xFFFFFFFFFFFFFFFFLL);
}

- (void)systemHasPoweredOn
{
  OS_dispatch_semaphore *wakeSemaphore;
  OS_dispatch_semaphore *v4;
  NSObject *v5;

  wakeSemaphore = self->_wakeSemaphore;
  if (wakeSemaphore)
  {
    v5 = wakeSemaphore;
    dispatch_semaphore_signal(v5);
    v4 = self->_wakeSemaphore;
    self->_wakeSemaphore = 0;

  }
}

- (int)setupIsolatedIOForStream:(id)a3 frameSize:(unsigned int)a4 useCase:(unint64_t)a5
{
  return 1852797029;
}

- (int)teardownIsolatedIOForStream:(id)a3 useCase:(unint64_t)a4
{
  return 1852797029;
}

- (void)dealloc
{
  NSObject *wakeSemaphore;
  OS_dispatch_semaphore *v4;
  NSMutableArray *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  NSMutableArray *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  objc_super v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x24BDAC8D0];
  wakeSemaphore = self->_wakeSemaphore;
  if (wakeSemaphore)
  {
    dispatch_semaphore_signal(wakeSemaphore);
    v4 = self->_wakeSemaphore;
    self->_wakeSemaphore = 0;

  }
  v26 = 0u;
  v27 = 0u;
  v24 = 0u;
  v25 = 0u;
  v5 = self->_inputStreams;
  v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v24, v29, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v25;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v25 != v8)
          objc_enumerationMutation(v5);
        v10 = *(_QWORD *)(*((_QWORD *)&v24 + 1) + 8 * v9);
        -[ASDObject plugin](self, "plugin");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "removeStreamRealTimeOperations:", v10);

        ++v9;
      }
      while (v7 != v9);
      v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v24, v29, 16);
    }
    while (v7);
  }

  v22 = 0u;
  v23 = 0u;
  v20 = 0u;
  v21 = 0u;
  v12 = self->_outputStreams;
  v13 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v12, "countByEnumeratingWithState:objects:count:", &v20, v28, 16);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v21;
    do
    {
      v16 = 0;
      do
      {
        if (*(_QWORD *)v21 != v15)
          objc_enumerationMutation(v12);
        v17 = *(_QWORD *)(*((_QWORD *)&v20 + 1) + 8 * v16);
        -[ASDObject plugin](self, "plugin");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "removeStreamRealTimeOperations:", v17);

        ++v16;
      }
      while (v14 != v16);
      v14 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v12, "countByEnumeratingWithState:objects:count:", &v20, v28, 16);
    }
    while (v14);
  }

  v19.receiver = self;
  v19.super_class = (Class)ASDAudioDevice;
  -[ASDObject dealloc](&v19, sel_dealloc);
}

- (id)diagnosticDescriptionWithIndent:(id)a3 walkTree:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  int v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v19;
  unsigned int v20;
  __CFString *v21;
  const __CFString *v22;
  const __CFString *v23;
  const __CFString *v24;
  const __CFString *v25;
  const __CFString *v26;
  const __CFString *v27;
  const __CFString *v28;
  const __CFString *v29;
  uint64_t v30;
  void *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t i;
  uint64_t v37;
  ASDAudioDevice *v38;
  _BOOL4 v39;
  const __CFString *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  uint64_t v48;
  void *v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t j;
  void *v55;
  void *v56;
  void *v57;
  uint64_t v58;
  void *v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t k;
  void *v65;
  void *v66;
  void *v67;
  uint64_t v68;
  void *v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t m;
  void *v75;
  void *v76;
  id v78;
  id v79;
  __CFString *v80;
  ASDAudioDevice *v81;
  void *v82;
  __int128 v83;
  __int128 v84;
  __int128 v85;
  __int128 v86;
  __int128 v87;
  __int128 v88;
  __int128 v89;
  __int128 v90;
  __int128 v91;
  __int128 v92;
  __int128 v93;
  __int128 v94;
  __int128 v95;
  __int128 v96;
  __int128 v97;
  __int128 v98;
  objc_super v99;
  _BYTE v100[128];
  _BYTE v101[128];
  _BYTE v102[128];
  _BYTE v103[128];
  uint64_t v104;

  v4 = a4;
  v104 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v99.receiver = self;
  v99.super_class = (Class)ASDAudioDevice;
  -[ASDObject diagnosticDescriptionWithIndent:walkTree:](&v99, sel_diagnosticDescriptionWithIndent_walkTree_, v6, v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "stringByAppendingString:", CFSTR("|        "));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[ASDAudioDevice deviceName](self, "deviceName");
  v9 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  objc_msgSend(v7, "appendFormat:", CFSTR("%@|    Name: %s\n"), v6, objc_msgSend(v9, "UTF8String"));

  -[ASDAudioDevice manufacturerName](self, "manufacturerName");
  v10 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  objc_msgSend(v7, "appendFormat:", CFSTR("%@|    Manufacturer: %s\n"), v6, objc_msgSend(v10, "UTF8String"));

  -[ASDAudioDevice modelName](self, "modelName");
  v11 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  objc_msgSend(v7, "appendFormat:", CFSTR("%@|    Model Name: %s\n"), v6, objc_msgSend(v11, "UTF8String"));

  -[ASDAudioDevice deviceUID](self, "deviceUID");
  v12 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  objc_msgSend(v7, "appendFormat:", CFSTR("%@|    Device UID: %s\n"), v6, objc_msgSend(v12, "UTF8String"));

  -[ASDAudioDevice modelUID](self, "modelUID");
  v13 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  objc_msgSend(v7, "appendFormat:", CFSTR("%@|    Model UID: %s\n"), v6, objc_msgSend(v13, "UTF8String"));

  v14 = -[ASDAudioDevice transportType](self, "transportType");
  LODWORD(v15) = v14 >> 24;
  if ((v14 - 0x20000000) >> 24 >= 0x5F)
    v15 = 32;
  else
    v15 = v15;
  LODWORD(v16) = v14 << 8 >> 24;
  if (((v14 << 8) - 0x20000000) >> 24 >= 0x5F)
    v16 = 32;
  else
    v16 = v16;
  if (((v14 << 16) - 0x20000000) >> 24 >= 0x5F)
    v17 = 32;
  else
    v17 = ((__int16)v14 >> 8);
  if (v14 << 24 == 2130706432 || v14 << 24 < 520093697)
    v19 = 32;
  else
    v19 = (char)v14;
  objc_msgSend(v7, "appendFormat:", CFSTR("%@|    Transport Type: %c%c%c%c\n"), v6, v15, v16, v17, v19);
  v82 = v6;
  objc_msgSend(v7, "appendFormat:", CFSTR("%@|    Clock Domain: 0x%08x\n"), v6, -[ASDAudioDevice clockDomain](self, "clockDomain"));
  v20 = -[ASDAudioDevice clockAlgorithm](self, "clockAlgorithm");
  switch(v20)
  {
    case 0x72617777u:
      v21 = CFSTR("Raw");
      break;
    case 0x6D617667u:
      v21 = CFSTR("12Pt Moving Window Average");
      break;
    case 0x69697266u:
      v21 = CFSTR("Simple IIR");
      break;
    default:
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Unknown (%x)"), -[ASDAudioDevice clockAlgorithm](self, "clockAlgorithm"));
      v21 = (__CFString *)objc_claimAutoreleasedReturnValue();
      break;
  }
  v80 = objc_retainAutorelease(v21);
  objc_msgSend(v7, "appendFormat:", CFSTR("%@|    Clock Algorithm: %s\n"), v6, -[__CFString UTF8String](v80, "UTF8String"));
  if (-[ASDAudioDevice clockIsStable](self, "clockIsStable"))
    v22 = CFSTR("YES");
  else
    v22 = CFSTR("NO");
  objc_msgSend(v7, "appendFormat:", CFSTR("%@|    Clock Is Stable: %@\n"), v6, v22);
  if (self->_isAlive)
    v23 = CFSTR("YES");
  else
    v23 = CFSTR("NO");
  objc_msgSend(v7, "appendFormat:", CFSTR("%@|    Is Active: %@\n"), v6, v23);
  if (-[ASDAudioDevice isRunning](self, "isRunning"))
    v24 = CFSTR("YES");
  else
    v24 = CFSTR("NO");
  objc_msgSend(v7, "appendFormat:", CFSTR("%@|    Is Running: %@\n"), v6, v24);
  if (-[ASDAudioDevice canBeDefaultDevice](self, "canBeDefaultDevice"))
    v25 = CFSTR("YES");
  else
    v25 = CFSTR("NO");
  objc_msgSend(v7, "appendFormat:", CFSTR("%@|    Can Be Default Device: %@\n"), v6, v25);
  if (-[ASDAudioDevice canBeDefaultInputDevice](self, "canBeDefaultInputDevice"))
    v26 = CFSTR("YES");
  else
    v26 = CFSTR("NO");
  objc_msgSend(v7, "appendFormat:", CFSTR("%@|    Can Be Default Input Device: %@\n"), v6, v26);
  if (-[ASDAudioDevice canBeDefaultOutputDevice](self, "canBeDefaultOutputDevice"))
    v27 = CFSTR("YES");
  else
    v27 = CFSTR("NO");
  objc_msgSend(v7, "appendFormat:", CFSTR("%@|    Can Be Default Output Device: %@\n"), v6, v27);
  if (-[ASDAudioDevice canBeDefaultSystemDevice](self, "canBeDefaultSystemDevice"))
    v28 = CFSTR("YES");
  else
    v28 = CFSTR("NO");
  objc_msgSend(v7, "appendFormat:", CFSTR("%@|    Can Be Default System Device: %@\n"), v6, v28);
  if (-[ASDAudioDevice canChangeDeviceName](self, "canChangeDeviceName"))
    v29 = CFSTR("YES");
  else
    v29 = CFSTR("NO");
  objc_msgSend(v7, "appendFormat:", CFSTR("%@|    Can Change Device Name: %@\n"), v6, v29);
  -[ASDAudioDevice samplingRate](self, "samplingRate");
  objc_msgSend(v7, "appendFormat:", CFSTR("%@|    Nominal Sample Rate: %f\n"), v6, v30);
  objc_msgSend(v7, "appendFormat:", CFSTR("%@|    Available Nominal Sample Rates:\n"), v6);
  v97 = 0u;
  v98 = 0u;
  v95 = 0u;
  v96 = 0u;
  v81 = self;
  -[ASDAudioDevice samplingRates](self, "samplingRates");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = objc_msgSend(v31, "countByEnumeratingWithState:objects:count:", &v95, v103, 16);
  if (v32)
  {
    v33 = v32;
    v34 = 0;
    v35 = *(_QWORD *)v96;
    do
    {
      for (i = 0; i != v33; ++i)
      {
        if (*(_QWORD *)v96 != v35)
          objc_enumerationMutation(v31);
        objc_msgSend(*(id *)(*((_QWORD *)&v95 + 1) + 8 * i), "doubleValue");
        objc_msgSend(v7, "appendFormat:", CFSTR("%@Rate[%u]: %f\n"), v8, v34 + i, v37);
      }
      v33 = objc_msgSend(v31, "countByEnumeratingWithState:objects:count:", &v95, v103, 16);
      v34 = (v34 + i);
    }
    while (v33);
  }

  v38 = v81;
  v39 = -[ASDAudioDevice isHidden](v81, "isHidden");
  v40 = CFSTR("NO");
  if (v39)
    v40 = CFSTR("YES");
  objc_msgSend(v7, "appendFormat:", CFSTR("%@|    Is Hidden: %@\n"), v82, v40);
  objc_msgSend(v7, "appendFormat:", CFSTR("%@|    Input Latency: %u\n"), v82, -[ASDAudioDevice inputLatency](v81, "inputLatency"));
  objc_msgSend(v7, "appendFormat:", CFSTR("%@|    Output Latency: %u\n"), v82, -[ASDAudioDevice outputLatency](v81, "outputLatency"));
  objc_msgSend(v7, "appendFormat:", CFSTR("%@|    Input Safety Offset: %u\n"), v82, -[ASDAudioDevice inputSafetyOffset](v81, "inputSafetyOffset"));
  objc_msgSend(v7, "appendFormat:", CFSTR("%@|    Output Safety Offset: %u\n"), v82, -[ASDAudioDevice outputSafetyOffset](v81, "outputSafetyOffset"));
  objc_msgSend(v7, "appendFormat:", CFSTR("%@|    Zero Timestamp Period: %u\n"), v82, -[ASDAudioDevice timestampPeriod](v81, "timestampPeriod"));
  -[ASDAudioDevice clientDescription](v81, "clientDescription");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v41, "description");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v42, "stringByReplacingOccurrencesOfString:withString:", CFSTR("\n"), &stru_24DBCB510);
  v43 = (void *)objc_claimAutoreleasedReturnValue();

  v79 = objc_retainAutorelease(v43);
  objc_msgSend(v7, "appendFormat:", CFSTR("%@|    Client Description: %s\n"), v82, objc_msgSend(v79, "UTF8String"));
  -[ASDAudioDevice deviceDescription](v81, "deviceDescription");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v44, "description");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v45, "stringByReplacingOccurrencesOfString:withString:", CFSTR("\n"), &stru_24DBCB510);
  v46 = (void *)objc_claimAutoreleasedReturnValue();

  v78 = objc_retainAutorelease(v46);
  objc_msgSend(v7, "appendFormat:", CFSTR("%@|    Device Description: %s\n"), v82, objc_msgSend(v78, "UTF8String"));
  objc_msgSend(v7, "appendFormat:", CFSTR("%@|    Input Streams:\n"), v82);
  -[ASDAudioDevice inputStreams](v81, "inputStreams");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  v48 = objc_msgSend(v47, "count");

  if (v48)
  {
    v93 = 0u;
    v94 = 0u;
    v91 = 0u;
    v92 = 0u;
    -[ASDAudioDevice inputStreams](v81, "inputStreams");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    v50 = objc_msgSend(v49, "countByEnumeratingWithState:objects:count:", &v91, v102, 16);
    if (v50)
    {
      v51 = v50;
      v52 = 0;
      v53 = *(_QWORD *)v92;
      do
      {
        for (j = 0; j != v51; ++j)
        {
          if (*(_QWORD *)v92 != v53)
            objc_enumerationMutation(v49);
          v55 = *(void **)(*((_QWORD *)&v91 + 1) + 8 * j);
          if (v4)
          {
            objc_msgSend(v55, "diagnosticDescriptionWithIndent:walkTree:", v8, 1);
            v56 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v7, "appendString:", v56);

          }
          else
          {
            objc_msgSend(v7, "appendFormat:", CFSTR("%@|        %u: %u\n"), v82, v52 + j, objc_msgSend(v55, "objectID"));
          }
        }
        v51 = objc_msgSend(v49, "countByEnumeratingWithState:objects:count:", &v91, v102, 16);
        v52 = (v52 + j);
      }
      while (v51);
    }

    v38 = v81;
  }
  objc_msgSend(v7, "appendFormat:", CFSTR("%@|    Output Streams:\n"), v82);
  -[ASDAudioDevice outputStreams](v38, "outputStreams");
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  v58 = objc_msgSend(v57, "count");

  if (v58)
  {
    v89 = 0u;
    v90 = 0u;
    v87 = 0u;
    v88 = 0u;
    -[ASDAudioDevice outputStreams](v38, "outputStreams");
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    v60 = objc_msgSend(v59, "countByEnumeratingWithState:objects:count:", &v87, v101, 16);
    if (v60)
    {
      v61 = v60;
      v62 = 0;
      v63 = *(_QWORD *)v88;
      do
      {
        for (k = 0; k != v61; ++k)
        {
          if (*(_QWORD *)v88 != v63)
            objc_enumerationMutation(v59);
          v65 = *(void **)(*((_QWORD *)&v87 + 1) + 8 * k);
          if (v4)
          {
            objc_msgSend(v65, "diagnosticDescriptionWithIndent:walkTree:", v8, 1);
            v66 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v7, "appendString:", v66);

          }
          else
          {
            objc_msgSend(v7, "appendFormat:", CFSTR("%@|        %u: %u\n"), v82, v62 + k, objc_msgSend(v65, "objectID"));
          }
        }
        v61 = objc_msgSend(v59, "countByEnumeratingWithState:objects:count:", &v87, v101, 16);
        v62 = (v62 + k);
      }
      while (v61);
    }

    v38 = v81;
  }
  objc_msgSend(v7, "appendFormat:", CFSTR("%@|    Controls:\n"), v82);
  -[ASDAudioDevice controls](v38, "controls");
  v67 = (void *)objc_claimAutoreleasedReturnValue();
  v68 = objc_msgSend(v67, "count");

  if (v68)
  {
    v85 = 0u;
    v86 = 0u;
    v83 = 0u;
    v84 = 0u;
    -[ASDAudioDevice controls](v38, "controls");
    v69 = (void *)objc_claimAutoreleasedReturnValue();
    v70 = objc_msgSend(v69, "countByEnumeratingWithState:objects:count:", &v83, v100, 16);
    if (v70)
    {
      v71 = v70;
      v72 = 0;
      v73 = *(_QWORD *)v84;
      do
      {
        for (m = 0; m != v71; ++m)
        {
          if (*(_QWORD *)v84 != v73)
            objc_enumerationMutation(v69);
          v75 = *(void **)(*((_QWORD *)&v83 + 1) + 8 * m);
          if (v4)
          {
            objc_msgSend(v75, "diagnosticDescriptionWithIndent:walkTree:", v8, 1);
            v76 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v7, "appendString:", v76);

          }
          else
          {
            objc_msgSend(v7, "appendFormat:", CFSTR("%@|        %u: %u\n"), v82, v72 + m, objc_msgSend(v75, "objectID"));
          }
        }
        v71 = objc_msgSend(v69, "countByEnumeratingWithState:objects:count:", &v83, v100, 16);
        v72 = (v72 + m);
      }
      while (v71);
    }

  }
  return v7;
}

- (id)driverClassName
{
  return CFSTR("AudioDevice");
}

- (NSString)deviceUID
{
  return self->_deviceUID;
}

- (NSString)modelUID
{
  return self->_modelUID;
}

- (void)setModelUID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 336);
}

- (NSString)manufacturerName
{
  return self->_manufacturerName;
}

- (void)setManufacturerName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 344);
}

- (NSString)modelName
{
  return self->_modelName;
}

- (void)setModelName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 352);
}

- (NSString)configurationBundleID
{
  return self->_configurationBundleID;
}

- (void)setConfigurationBundleID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 360);
}

- (BOOL)canBeDefaultDevice
{
  return self->_canBeDefaultDevice;
}

- (void)setCanBeDefaultDevice:(BOOL)a3
{
  self->_canBeDefaultDevice = a3;
}

- (BOOL)canBeDefaultInputDevice
{
  return self->_canBeDefaultInputDevice;
}

- (void)setCanBeDefaultInputDevice:(BOOL)a3
{
  self->_canBeDefaultInputDevice = a3;
}

- (BOOL)canBeDefaultOutputDevice
{
  return self->_canBeDefaultOutputDevice;
}

- (void)setCanBeDefaultOutputDevice:(BOOL)a3
{
  self->_canBeDefaultOutputDevice = a3;
}

- (BOOL)canBeDefaultSystemDevice
{
  return self->_canBeDefaultSystemDevice;
}

- (void)setCanBeDefaultSystemDevice:(BOOL)a3
{
  self->_canBeDefaultSystemDevice = a3;
}

- (BOOL)allowAutoRoute
{
  return self->_allowAutoRoute;
}

- (void)setAllowAutoRoute:(BOOL)a3
{
  self->_allowAutoRoute = a3;
}

- (BOOL)wantsDisplayRouting
{
  return self->_wantsDisplayRouting;
}

- (void)setWantsDisplayRouting:(BOOL)a3
{
  self->_wantsDisplayRouting = a3;
}

- (void)setHidden:(BOOL)a3
{
  self->_hidden = a3;
}

- (BOOL)canChangeDeviceName
{
  return self->_canChangeDeviceName;
}

- (void)setCanChangeDeviceName:(BOOL)a3
{
  self->_canChangeDeviceName = a3;
}

- (id)getZeroTimestampBlock
{
  return self->_getZeroTimestampBlock;
}

- (id)willDoReadInputBlock
{
  return self->_willDoReadInputBlock;
}

- (id)willDoConvertInputBlock
{
  return self->_willDoConvertInputBlock;
}

- (id)willDoProcessInputBlock
{
  return self->_willDoProcessInputBlock;
}

- (id)willDoProcessOutputBlock
{
  return self->_willDoProcessOutputBlock;
}

- (id)willDoMixOutputBlock
{
  return self->_willDoMixOutputBlock;
}

- (id)willDoProcessMixBlock
{
  return self->_willDoProcessMixBlock;
}

- (id)willDoConvertMixBlock
{
  return self->_willDoConvertMixBlock;
}

- (id)willDoWriteMixBlock
{
  return self->_willDoWriteMixBlock;
}

- (id)beginIOOperationBlock
{
  return self->_beginIOOperationBlock;
}

- (id)endIOOperationBlock
{
  return self->_endIOOperationBlock;
}

- (ASDDeviceConfigurationChangeDelegate)configurationChangeDelegate
{
  return (ASDDeviceConfigurationChangeDelegate *)objc_loadWeakRetained((id *)&self->_configurationChangeDelegate);
}

- (void)setConfigurationChangeDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_configurationChangeDelegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_configurationChangeDelegate);
  objc_storeStrong(&self->_endIOOperationBlock, 0);
  objc_storeStrong(&self->_beginIOOperationBlock, 0);
  objc_storeStrong(&self->_willDoWriteMixBlock, 0);
  objc_storeStrong(&self->_willDoConvertMixBlock, 0);
  objc_storeStrong(&self->_willDoProcessMixBlock, 0);
  objc_storeStrong(&self->_willDoMixOutputBlock, 0);
  objc_storeStrong(&self->_willDoProcessOutputBlock, 0);
  objc_storeStrong(&self->_willDoProcessInputBlock, 0);
  objc_storeStrong(&self->_willDoConvertInputBlock, 0);
  objc_storeStrong(&self->_willDoReadInputBlock, 0);
  objc_storeStrong(&self->_getZeroTimestampBlock, 0);
  objc_storeStrong((id *)&self->_configurationBundleID, 0);
  objc_storeStrong((id *)&self->_modelName, 0);
  objc_storeStrong((id *)&self->_manufacturerName, 0);
  objc_storeStrong((id *)&self->_modelUID, 0);
  objc_storeStrong((id *)&self->_deviceUID, 0);
  objc_storeStrong((id *)&self->_deviceDescription, 0);
  objc_storeStrong((id *)&self->_clientDescription, 0);
  objc_storeStrong((id *)&self->_wakeSemaphore, 0);
  objc_storeStrong((id *)&self->_deviceName, 0);
  objc_storeStrong((id *)&self->_ioReferenceQueue, 0);
  objc_storeStrong((id *)&self->_sampleRateQueue, 0);
  objc_storeStrong((id *)&self->_samplingRates, 0);
  objc_storeStrong((id *)&self->_controlQueue, 0);
  objc_storeStrong((id *)&self->_controls, 0);
  objc_storeStrong((id *)&self->_outputStreamQueue, 0);
  objc_storeStrong((id *)&self->_outputStreams, 0);
  objc_storeStrong((id *)&self->_inputStreamQueue, 0);
  objc_storeStrong((id *)&self->_inputStreams, 0);
}

- (id)getProperty:(id)a3
{
  id v5;
  int v6;
  id v7;
  uint64_t v8;
  id v9;
  _BOOL8 v10;
  uint64_t v11;
  int v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  int v21;
  _BOOL8 v22;
  _BOOL8 v23;
  id v24;
  id v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  void *v32;
  char v33;
  int v34;
  _BOOL8 v36;
  unsigned int v37;
  unsigned int v38;
  int v39;
  int v40;
  int v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  uint8_t buf[4];
  int v47;
  __int16 v48;
  int v49;
  __int16 v50;
  int v51;
  __int16 v52;
  int v53;
  _BYTE v54[128];
  uint64_t v55;

  v55 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = objc_msgSend(v5, "selector");
  if (v6 <= 1819107690)
  {
    if (v6 <= 1684434035)
    {
      if (v6 <= 1668050794)
      {
        if (v6 == 1634429294)
          goto LABEL_52;
        if (v6 != 1667523955)
        {
          if (v6 == 1668049764)
          {
            v7 = objc_alloc(MEMORY[0x24BDD16E0]);
            v8 = -[ASDAudioDevice clockDomain](self, "clockDomain");
            goto LABEL_110;
          }
          goto LABEL_90;
        }
        -[ASDAudioDevice clientDescription](self, "clientDescription");
        v11 = objc_claimAutoreleasedReturnValue();
        goto LABEL_111;
      }
      if (v6 > 1684236337)
      {
        if (v6 == 1684236338)
          goto LABEL_52;
        if (v6 != 1684301171)
          goto LABEL_90;
        -[ASDAudioDevice deviceDescription](self, "deviceDescription");
        v11 = objc_claimAutoreleasedReturnValue();
        goto LABEL_111;
      }
      if (v6 == 1668050795)
      {
        v7 = objc_alloc(MEMORY[0x24BDD16E0]);
        v8 = -[ASDAudioDevice clockAlgorithm](self, "clockAlgorithm");
        goto LABEL_110;
      }
      if (v6 != 1668510818)
        goto LABEL_90;
      v9 = objc_alloc(MEMORY[0x24BDD16E0]);
      v10 = -[ASDAudioDevice clockIsStable](self, "clockIsStable");
LABEL_86:
      v23 = v10;
      v24 = v9;
LABEL_87:
      v11 = objc_msgSend(v24, "initWithBool:", v23);
      goto LABEL_111;
    }
    if (v6 > 1818452845)
    {
      if (v6 > 1818455661)
      {
        if (v6 == 1818455662)
          goto LABEL_52;
        v12 = 1818850926;
      }
      else
      {
        if (v6 == 1818452846)
          goto LABEL_52;
        v12 = 1818454126;
      }
      goto LABEL_51;
    }
    if (v6 != 1684434036)
    {
      if (v6 == 1735354734)
      {
        v9 = objc_alloc(MEMORY[0x24BDD16E0]);
        v10 = -[ASDAudioDevice isRunning](self, "isRunning");
      }
      else
      {
        if (v6 != 1751737454)
          goto LABEL_90;
        v9 = objc_alloc(MEMORY[0x24BDD16E0]);
        v10 = -[ASDAudioDevice isHidden](self, "isHidden");
      }
      goto LABEL_86;
    }
    v21 = objc_msgSend(v5, "scope");
    switch(v21)
    {
      case 1869968496:
        v22 = -[ASDAudioDevice canBeDefaultOutputDevice](self, "canBeDefaultOutputDevice");
        break;
      case 1768845428:
        v22 = -[ASDAudioDevice canBeDefaultInputDevice](self, "canBeDefaultInputDevice");
        break;
      case 1735159650:
        v22 = -[ASDAudioDevice canBeDefaultDevice](self, "canBeDefaultDevice");
        break;
      default:
        v36 = 0;
        goto LABEL_117;
    }
    v36 = v22;
LABEL_117:
    v24 = objc_alloc(MEMORY[0x24BDD16E0]);
    v23 = v36;
    goto LABEL_87;
  }
  if (v6 <= 1919512166)
  {
    if (v6 > 1836411235)
    {
      if (v6 <= 1853059699)
      {
        if (v6 == 1836411236)
        {
          -[ASDAudioDevice modelUID](self, "modelUID");
          v11 = objc_claimAutoreleasedReturnValue();
        }
        else
        {
          if (v6 != 1853059619)
            goto LABEL_90;
          -[ASDAudioDevice samplingRates](self, "samplingRates");
          v11 = objc_claimAutoreleasedReturnValue();
        }
        goto LABEL_111;
      }
      if (v6 == 1853059700)
      {
        v25 = objc_alloc(MEMORY[0x24BDD16E0]);
        -[ASDAudioDevice samplingRate](self, "samplingRate");
        v11 = objc_msgSend(v25, "initWithDouble:");
        goto LABEL_111;
      }
      v12 = 1870098020;
LABEL_51:
      if (v6 == v12)
      {
LABEL_52:
        v13 = (void *)MEMORY[0x24BDD17C8];
        if ((int)objc_msgSend(v5, "selector") < 0x20000000 || (int)objc_msgSend(v5, "selector") > 2130706431)
          v14 = 32;
        else
          v14 = ((int)objc_msgSend(v5, "selector") >> 24);
        if ((int)(objc_msgSend(v5, "selector") << 8) < 0x20000000
          || (int)(objc_msgSend(v5, "selector") << 8) > 2130706431)
        {
          v15 = 32;
        }
        else
        {
          v15 = ((int)(objc_msgSend(v5, "selector") << 8) >> 24);
        }
        if ((int)(objc_msgSend(v5, "selector") << 16) < 0x20000000
          || (int)(objc_msgSend(v5, "selector") << 16) > 2130706431)
        {
          v16 = 32;
        }
        else
        {
          v16 = ((__int16)objc_msgSend(v5, "selector") >> 8);
        }
        if ((int)(objc_msgSend(v5, "selector") << 24) < 520093697
          || objc_msgSend(v5, "selector") == 127)
        {
          v17 = 32;
        }
        else
        {
          v17 = (char)objc_msgSend(v5, "selector");
        }
        objc_msgSend(v13, "stringWithFormat:", CFSTR("Property %c%c%c%c not supported yet"), v14, v15, v16, v17);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("ASDAudioDevice+ASDProperties.m"), 167, v18);

        goto LABEL_69;
      }
LABEL_90:
      v44 = 0u;
      v45 = 0u;
      v42 = 0u;
      v43 = 0u;
      -[ASDObject customProperties](self, "customProperties");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v42, v54, 16);
      if (v27)
      {
        v28 = v27;
        v29 = *(_QWORD *)v43;
LABEL_92:
        v30 = 0;
        while (1)
        {
          if (*(_QWORD *)v43 != v29)
            objc_enumerationMutation(v26);
          v31 = *(void **)(*((_QWORD *)&v42 + 1) + 8 * v30);
          objc_msgSend(v31, "address");
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          v33 = objc_msgSend(v32, "isEqual:", v5);

          if ((v33 & 1) != 0)
            break;
          if (v28 == ++v30)
          {
            v28 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v42, v54, 16);
            if (v28)
              goto LABEL_92;
            goto LABEL_98;
          }
        }
        objc_msgSend(v31, "value");
        v20 = (void *)objc_claimAutoreleasedReturnValue();

        if (v20)
          goto LABEL_112;
      }
      else
      {
LABEL_98:

      }
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
      {
        if ((int)objc_msgSend(v5, "selector") < 0x20000000 || (int)objc_msgSend(v5, "selector") > 2130706431)
          v34 = 32;
        else
          v34 = (int)objc_msgSend(v5, "selector") >> 24;
        if ((int)(objc_msgSend(v5, "selector") << 8) < 0x20000000
          || (int)(objc_msgSend(v5, "selector") << 8) > 2130706431)
        {
          v39 = 32;
        }
        else
        {
          v39 = (int)(objc_msgSend(v5, "selector") << 8) >> 24;
        }
        if ((int)(objc_msgSend(v5, "selector") << 16) < 0x20000000
          || (int)(objc_msgSend(v5, "selector") << 16) > 2130706431)
        {
          v40 = 32;
        }
        else
        {
          v40 = (__int16)objc_msgSend(v5, "selector") >> 8;
        }
        if ((int)(objc_msgSend(v5, "selector") << 24) < 520093697
          || objc_msgSend(v5, "selector") == 127)
        {
          v41 = 32;
        }
        else
        {
          v41 = (char)objc_msgSend(v5, "selector");
        }
        *(_DWORD *)buf = 67109888;
        v47 = v34;
        v48 = 1024;
        v49 = v39;
        v50 = 1024;
        v51 = v40;
        v52 = 1024;
        v53 = v41;
        _os_log_impl(&dword_219C60000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "Property %c%c%c%c not found", buf, 0x1Au);
      }
      goto LABEL_69;
    }
    if (v6 == 1819107691)
    {
      -[ASDAudioDevice manufacturerName](self, "manufacturerName");
      v11 = objc_claimAutoreleasedReturnValue();
      goto LABEL_111;
    }
    if (v6 == 1819173229)
    {
      -[ASDAudioDevice deviceName](self, "deviceName");
      v11 = objc_claimAutoreleasedReturnValue();
      goto LABEL_111;
    }
    if (v6 != 1819569763)
      goto LABEL_90;
    if (objc_msgSend(v5, "scope") == 1768845428)
    {
      v7 = objc_alloc(MEMORY[0x24BDD16E0]);
      goto LABEL_37;
    }
    if (objc_msgSend(v5, "scope") == 1869968496)
    {
      v7 = objc_alloc(MEMORY[0x24BDD16E0]);
    }
    else
    {
      if (objc_msgSend(v5, "scope") != 1735159650)
        goto LABEL_69;
      v7 = objc_alloc(MEMORY[0x24BDD16E0]);
      v38 = -[ASDAudioDevice inputLatency](self, "inputLatency");
      if (v38 > -[ASDAudioDevice outputLatency](self, "outputLatency"))
      {
LABEL_37:
        v8 = -[ASDAudioDevice inputLatency](self, "inputLatency");
        goto LABEL_110;
      }
    }
    v8 = -[ASDAudioDevice outputLatency](self, "outputLatency");
    goto LABEL_110;
  }
  if (v6 > 1937007733)
  {
    if (v6 > 1953653101)
    {
      if (v6 == 1953653102)
      {
        v7 = objc_alloc(MEMORY[0x24BDD16E0]);
        v8 = -[ASDAudioDevice transportType](self, "transportType");
        goto LABEL_110;
      }
      if (v6 != 1969841184)
        goto LABEL_90;
      -[ASDAudioDevice deviceUID](self, "deviceUID");
      v11 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      if (v6 != 1937007734)
      {
        v12 = 1937009955;
        goto LABEL_51;
      }
      -[ASDObject owner](self, "owner");
      v11 = objc_claimAutoreleasedReturnValue();
    }
LABEL_111:
    v20 = (void *)v11;
    goto LABEL_112;
  }
  if (v6 > 1936092275)
  {
    if (v6 != 1936092276)
    {
      v12 = 1936879204;
      goto LABEL_51;
    }
    v9 = objc_alloc(MEMORY[0x24BDD16E0]);
    v10 = -[ASDAudioDevice canBeDefaultSystemDevice](self, "canBeDefaultSystemDevice");
    goto LABEL_86;
  }
  if (v6 == 1919512167)
  {
    v7 = objc_alloc(MEMORY[0x24BDD16E0]);
    v8 = -[ASDAudioDevice timestampPeriod](self, "timestampPeriod");
    goto LABEL_110;
  }
  if (v6 != 1935763060)
    goto LABEL_90;
  if (objc_msgSend(v5, "scope") == 1768845428)
  {
    v7 = objc_alloc(MEMORY[0x24BDD16E0]);
LABEL_9:
    v8 = -[ASDAudioDevice inputSafetyOffset](self, "inputSafetyOffset");
LABEL_110:
    v11 = objc_msgSend(v7, "initWithUnsignedInt:", v8);
    goto LABEL_111;
  }
  if (objc_msgSend(v5, "scope") == 1869968496)
  {
    v7 = objc_alloc(MEMORY[0x24BDD16E0]);
    goto LABEL_106;
  }
  if (objc_msgSend(v5, "scope") == 1735159650)
  {
    v7 = objc_alloc(MEMORY[0x24BDD16E0]);
    v37 = -[ASDAudioDevice inputSafetyOffset](self, "inputSafetyOffset");
    if (v37 > -[ASDAudioDevice outputSafetyOffset](self, "outputSafetyOffset"))
      goto LABEL_9;
LABEL_106:
    v8 = -[ASDAudioDevice outputSafetyOffset](self, "outputSafetyOffset");
    goto LABEL_110;
  }
LABEL_69:
  v20 = 0;
LABEL_112:

  return v20;
}

- (void)addInputStream:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1_1(&dword_219C60000, MEMORY[0x24BDACB70], a3, "Stream %s: starting channel should not be zero!", a5, a6, a7, a8, 2u);
}

void __73__ASDAudioDevice_preferredChannelDescriptions_numberOfChannels_forScope___block_invoke_cold_1(float *a1, uint64_t a2, _QWORD *a3)
{
  uint64_t v3;
  uint8_t *v4;

  OUTLINED_FUNCTION_2_2(a1, a2, a3, 4.8149e-34);
  OUTLINED_FUNCTION_6_1(&dword_219C60000, MEMORY[0x24BDACB70], v3, "Stream %s indexing past the numberOfChannels", v4);
}

void __73__ASDAudioDevice_preferredChannelDescriptions_numberOfChannels_forScope___block_invoke_cold_2(float *a1, uint64_t a2, _QWORD *a3)
{
  uint64_t v3;
  uint8_t *v4;

  OUTLINED_FUNCTION_2_2(a1, a2, a3, 4.8149e-34);
  OUTLINED_FUNCTION_6_1(&dword_219C60000, MEMORY[0x24BDACB70], v3, "Stream %s starting channel number should not be zero!", v4);
}

@end
