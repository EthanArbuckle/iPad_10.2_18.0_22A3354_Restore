@implementation MKFCKEventTrigger

- (id)_encodeEventSignificantTime:(uint64_t)a1 context:(void *)a2
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v11[2];
  _QWORD v12[2];
  _QWORD v13[3];
  _QWORD v14[4];

  v14[3] = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  v4 = v3;
  if (a1)
  {
    objc_msgSend(v3, "offsetSeconds");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    HMDTimeOffsetToDateComponents(objc_msgSend(v5, "integerValue"), 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      v14[0] = CFSTR("ST");
      v13[0] = CFSTR("TEt");
      v13[1] = CFSTR("TESs");
      objc_msgSend(v4, "significantEvent");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v14[1] = v7;
      v13[2] = CFSTR("TESo");
      objc_msgSend(MEMORY[0x24BDD1618], "archivedDataWithRootObject:requiringSecureCoding:error:", v6, 1, 0);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v14[2] = v8;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v14, v13, 3);
      v9 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v12[0] = CFSTR("ST");
      v11[0] = CFSTR("TEt");
      v11[1] = CFSTR("TESs");
      objc_msgSend(v4, "significantEvent");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v12[1] = v7;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v12, v11, 2);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
    }

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (_MKFSignificantTimeEvent)_decodeEventSignificantTime:(void *)a3 context:
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  NSObject *v15;
  void *v16;
  _MKFSignificantTimeEvent *v17;
  void *v18;
  void *v19;
  char v20;
  void *v21;
  char v22;
  char v24;
  uint8_t buf[4];
  void *v26;
  __int16 v27;
  void *v28;
  __int16 v29;
  id v30;
  uint64_t v31;

  v31 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  if (!a1)
  {
    v17 = 0;
    goto LABEL_19;
  }
  v24 = 1;
  -[MKFCKEventTrigger _decodeUUIDForKey:dictionary:success:](a1, CFSTR("TEm"), v5, &v24);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[MKFCKEventTrigger _decodeStringForKey:dictionary:success:](a1, CFSTR("TESs"), v5, &v24);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[MKFCKEventTrigger _decodeDataForKey:dictionary:optional:success:](a1, CFSTR("TESo"), v5, 1, &v24);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v24)
  {
    if ((HMIsValidSignificantEvent() & 1) != 0)
    {
      if (v9)
      {
        v10 = (void *)MEMORY[0x24BDD16E0];
        -[MKFCKEventTrigger _decodeDateComponentsData:](a1, v9);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "numberWithInteger:", HMDTimeOffsetFromDateComponents(v11, 0));
        v12 = (void *)objc_claimAutoreleasedReturnValue();

      }
      else
      {
        v12 = 0;
      }
      +[_MKFModel modelWithModelID:context:](_MKFSignificantTimeEvent, "modelWithModelID:context:", v7, v6);
      v17 = (_MKFSignificantTimeEvent *)objc_claimAutoreleasedReturnValue();
      if (!v17)
      {
        v17 = -[_MKFSignificantTimeEvent initWithContext:]([_MKFSignificantTimeEvent alloc], "initWithContext:", v6);
        -[_MKFSignificantTimeEvent setModelID:](v17, "setModelID:", v7);
        objc_msgSend(a1, "writerTimestamp");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        -[_MKFSignificantTimeEvent setWriterTimestamp:](v17, "setWriterTimestamp:", v18);

      }
      -[_MKFSignificantTimeEvent significantEvent](v17, "significantEvent");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = HMFEqualObjects();

      if ((v20 & 1) == 0)
        -[_MKFSignificantTimeEvent setSignificantEvent:](v17, "setSignificantEvent:", v8);
      -[_MKFSignificantTimeEvent offsetSeconds](v17, "offsetSeconds");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = HMFEqualObjects();

      if ((v22 & 1) == 0)
        -[_MKFSignificantTimeEvent setOffsetSeconds:](v17, "setOffsetSeconds:", v12);

      goto LABEL_18;
    }
    v13 = (void *)MEMORY[0x227676638]();
    v14 = a1;
    HMFGetOSLogHandle();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v26 = v16;
      v27 = 2112;
      v28 = v8;
      v29 = 2112;
      v30 = v5;
      _os_log_impl(&dword_2218F0000, v15, OS_LOG_TYPE_ERROR, "%{public}@Unknown value '%@' for significant event: %@", buf, 0x20u);

    }
    objc_autoreleasePoolPop(v13);
  }
  v17 = 0;
LABEL_18:

LABEL_19:
  return v17;
}

- (id)_encodeEventCharacteristic:(void *)a3 accessories:(void *)a4 context:
{
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  _QWORD v22[3];
  _QWORD v23[4];

  v23[3] = *MEMORY[0x24BDAC8D0];
  v7 = a4;
  v8 = a3;
  v9 = a2;
  objc_msgSend(v9, "service");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "accessory");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "modelID");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  -[MKFCKHomeObject _accessoryWithModelID:context:](a1, v12, v7);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "addObject:", v13);
  v14 = (void *)MEMORY[0x24BDBCED8];
  v22[0] = CFSTR("TEAm");
  objc_msgSend(v13, "modelID");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v23[0] = v15;
  v22[1] = CFSTR("TEAs");
  objc_msgSend(v9, "service");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "instanceID");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v23[1] = v17;
  v22[2] = CFSTR("TEAc");
  objc_msgSend(v9, "characteristicID");
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  v23[2] = v18;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v23, v22, 3);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "dictionaryWithDictionary:", v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  return v20;
}

- (_MKFCharacteristicRangeEvent)_decodeEventCharacteristicWithEntity:(void *)a3 eventDictionary:(void *)a4 trigger:(void *)a5 context:
{
  id v9;
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  int v20;
  void *v21;
  void *v22;
  int v23;
  uint64_t v24;
  uint64_t v25;
  _MKFCharacteristicRangeEvent *v26;
  void *v27;
  void *v28;
  char v29;
  void *v30;
  char v31;
  void *v32;
  void *v33;
  id v34;
  NSObject *v35;
  id v36;
  void *v37;
  void *v38;
  id v39;
  void *v40;
  id v41;
  void *v42;
  id v43;
  NSObject *v44;
  void *v45;
  void *v46;
  id v47;
  void *v48;
  id v49;
  void *v50;
  id v51;
  NSObject *v52;
  void *v53;
  void *v54;
  void *v55;
  int v56;
  void *v57;
  void *v58;
  void *v59;
  char v60;
  void *v61;
  char v62;
  void *v63;
  char v64;
  void *v65;
  id v66;
  void *v67;
  id v68;
  void *v69;
  id v70;
  NSObject *v71;
  void *v72;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  id v78;
  id v79;
  id v80;
  void *v81;
  void *v82;
  void *v83;
  id v84;
  void *v85;
  id v86;
  char v87;
  uint8_t buf[4];
  void *v89;
  __int16 v90;
  uint64_t v91;
  __int16 v92;
  id v93;
  __int16 v94;
  id v95;
  uint64_t v96;

  v96 = *MEMORY[0x24BDAC8D0];
  v9 = a2;
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v87 = 1;
  -[MKFCKEventTrigger _decodeUUIDForKey:dictionary:success:](a1, CFSTR("TEm"), v10, &v87);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[MKFCKEventTrigger _decodeUUIDForKey:dictionary:success:](a1, CFSTR("TEAm"), v10, &v87);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[MKFCKEventTrigger _decodeNumberForKey:dictionary:success:](a1, CFSTR("TEAs"), v10, &v87);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[MKFCKEventTrigger _decodeNumberForKey:dictionary:success:](a1, CFSTR("TEAc"), v10, &v87);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if (v87)
  {
    v86 = v16;
    objc_msgSend(v11, "home");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "accessoryWithModelID:context:", v14, v12);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    v85 = v18;
    if (!v18)
    {
      v33 = (void *)MEMORY[0x227676638]();
      v34 = a1;
      HMFGetOSLogHandle();
      v35 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v82 = v15;
        v36 = v9;
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138544130;
        v89 = v37;
        v90 = 2160;
        v91 = 1752392040;
        v92 = 2112;
        v93 = v14;
        v94 = 2112;
        v95 = v10;
        _os_log_impl(&dword_2218F0000, v35, OS_LOG_TYPE_ERROR, "%{public}@Could not find accessory '%{mask.hash}@' matching event: %@", buf, 0x2Au);

        v9 = v36;
        v15 = v82;
      }

      objc_autoreleasePoolPop(v33);
      v26 = 0;
      goto LABEL_47;
    }
    v19 = v18;
    objc_opt_class();
    v20 = objc_opt_isKindOfClass() & 1;
    if (v20)
      v21 = v19;
    else
      v21 = 0;
    v84 = v21;

    if (!v20)
    {
      v78 = v12;
      v38 = v14;
      v39 = v11;
      v40 = v13;
      v41 = v9;
      v42 = (void *)MEMORY[0x227676638]();
      v43 = a1;
      HMFGetOSLogHandle();
      v44 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v44, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v83 = v15;
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        v89 = v45;
        v90 = 2112;
        v91 = (uint64_t)v19;
        v92 = 2112;
        v93 = v10;
        _os_log_impl(&dword_2218F0000, v44, OS_LOG_TYPE_ERROR, "%{public}@Accessory %@ is not a HAP accessory in event: %@", buf, 0x20u);

        v15 = v83;
      }

      objc_autoreleasePoolPop(v42);
      v26 = 0;
      v9 = v41;
      v13 = v40;
      v11 = v39;
      v14 = v38;
      v12 = v78;
      goto LABEL_46;
    }
    objc_msgSend(v19, "serviceWithID:context:", v15, v12);
    v77 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v77)
    {
      v79 = v12;
      v46 = v14;
      v47 = v11;
      v48 = v13;
      v49 = v9;
      v50 = (void *)MEMORY[0x227676638]();
      v51 = a1;
      HMFGetOSLogHandle();
      v52 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v52, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v53 = v15;
        v54 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v89 = v54;
        v90 = 2112;
        v91 = (uint64_t)v10;
        _os_log_impl(&dword_2218F0000, v52, OS_LOG_TYPE_ERROR, "%{public}@Could not find service matching event: %@", buf, 0x16u);

        v15 = v53;
      }

      objc_autoreleasePoolPop(v50);
      v26 = 0;
      v9 = v49;
      v13 = v48;
      v11 = v47;
      v14 = v46;
      v12 = v79;
      goto LABEL_45;
    }
    v81 = v15;
    +[_MKFCharacteristicRangeEvent entity](_MKFCharacteristicRangeEvent, "entity");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = objc_msgSend(v9, "isEqual:", v22);

    if (v23)
    {
      -[MKFCKEventTrigger _decodeCharacteristicValueForKey:dictionary:optional:success:](a1, CFSTR("TEAn"), v10, 1, &v87);
      v24 = objc_claimAutoreleasedReturnValue();
      -[MKFCKEventTrigger _decodeCharacteristicValueForKey:dictionary:optional:success:](a1, CFSTR("TEAx"), v10, 1, &v87);
      v25 = objc_claimAutoreleasedReturnValue();
      if (v87)
      {
        v74 = (void *)v25;
        v75 = (void *)v24;
        if (v24 | v25)
        {
          +[_MKFModel modelWithModelID:context:](_MKFCharacteristicRangeEvent, "modelWithModelID:context:", v13, v12);
          v26 = (_MKFCharacteristicRangeEvent *)objc_claimAutoreleasedReturnValue();
          if (!v26)
          {
            v26 = -[_MKFCharacteristicRangeEvent initWithContext:]([_MKFCharacteristicRangeEvent alloc], "initWithContext:", v12);
            -[_MKFCharacteristicRangeEvent setModelID:](v26, "setModelID:", v13);
            objc_msgSend(a1, "writerTimestamp");
            v27 = (void *)objc_claimAutoreleasedReturnValue();
            -[_MKFCharacteristicRangeEvent setWriterTimestamp:](v26, "setWriterTimestamp:", v27);

          }
          -[_MKFCharacteristicRangeEvent min](v26, "min");
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          v29 = HMFEqualObjects();

          if ((v29 & 1) == 0)
            -[_MKFCharacteristicRangeEvent setMin:](v26, "setMin:", v75);
          -[_MKFCharacteristicRangeEvent max](v26, "max");
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          v31 = HMFEqualObjects();

          if ((v31 & 1) == 0)
            -[_MKFCharacteristicRangeEvent setMax:](v26, "setMax:", v74);

          v32 = v75;
LABEL_34:

          -[_MKFCharacteristicRangeEvent service](v26, "service");
          v61 = (void *)objc_claimAutoreleasedReturnValue();
          v62 = HMFEqualObjects();

          if ((v62 & 1) == 0)
            -[_MKFCharacteristicRangeEvent setService:](v26, "setService:", v77);
          -[_MKFCharacteristicRangeEvent characteristicID](v26, "characteristicID");
          v63 = (void *)objc_claimAutoreleasedReturnValue();
          v64 = HMFEqualObjects();

          if ((v64 & 1) == 0)
            -[_MKFCharacteristicRangeEvent setCharacteristicID:](v26, "setCharacteristicID:", v86);
          goto LABEL_44;
        }
        v80 = v12;
        v65 = v14;
        v66 = v11;
        v67 = v13;
        v68 = v9;
        v69 = (void *)MEMORY[0x227676638]();
        v70 = a1;
        HMFGetOSLogHandle();
        v71 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v71, OS_LOG_TYPE_ERROR))
        {
          HMFGetLogIdentifier();
          v72 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          v89 = v72;
          v90 = 2112;
          v91 = (uint64_t)v10;
          _os_log_impl(&dword_2218F0000, v71, OS_LOG_TYPE_ERROR, "%{public}@Failed to decode any range values in event: %@", buf, 0x16u);

        }
        objc_autoreleasePoolPop(v69);
        v9 = v68;
        v13 = v67;
        v11 = v66;
        v14 = v65;
        v12 = v80;
        v25 = (uint64_t)v74;
        v24 = (uint64_t)v75;
      }

    }
    else
    {
      +[_MKFCharacteristicValueEvent entity](_MKFCharacteristicValueEvent, "entity");
      v55 = (void *)objc_claimAutoreleasedReturnValue();
      v56 = objc_msgSend(v9, "isEqual:", v55);

      if (v56)
      {
        -[MKFCKEventTrigger _decodeCharacteristicValueForKey:dictionary:optional:success:](a1, CFSTR("TEAv"), v10, 0, &v87);
        v57 = (void *)objc_claimAutoreleasedReturnValue();
        if (v87)
        {
          v76 = v57;
          +[_MKFModel modelWithModelID:context:](_MKFCharacteristicValueEvent, "modelWithModelID:context:", v13, v12);
          v26 = (_MKFCharacteristicRangeEvent *)objc_claimAutoreleasedReturnValue();
          if (!v26)
          {
            v26 = -[_MKFCharacteristicValueEvent initWithContext:]([_MKFCharacteristicValueEvent alloc], "initWithContext:", v12);
            -[_MKFCharacteristicRangeEvent setModelID:](v26, "setModelID:", v13);
            objc_msgSend(a1, "writerTimestamp");
            v58 = (void *)objc_claimAutoreleasedReturnValue();
            -[_MKFCharacteristicRangeEvent setWriterTimestamp:](v26, "setWriterTimestamp:", v58);

          }
          -[_MKFCharacteristicRangeEvent eventValue](v26, "eventValue");
          v59 = (void *)objc_claimAutoreleasedReturnValue();
          v32 = v76;
          v60 = HMFEqualObjects();

          if ((v60 & 1) == 0)
            -[_MKFCharacteristicRangeEvent setEventValue:](v26, "setEventValue:", v76);
          goto LABEL_34;
        }

      }
    }
    v26 = 0;
LABEL_44:
    v15 = v81;
LABEL_45:

LABEL_46:
LABEL_47:

    v16 = v86;
    goto LABEL_48;
  }
  v26 = 0;
LABEL_48:

  return v26;
}

- (id)_encodeEvent:(id)a3 encodedEventInCloud:(id)a4 accessories:(id)a5 users:(id)a6 guests:(id)a7 shouldRemoveEvent:(BOOL *)a8 context:(id)a9
{
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  id v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  MKFCKEventTrigger *v34;
  NSObject *v35;
  void *v36;
  void *v37;
  id v38;
  id v39;
  id v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  int v53;
  uint64_t v54;
  void *v55;
  void *v56;
  void *v57;
  MKFCKEventTrigger *v58;
  id v60;
  void *v61;
  MKFCKEventTrigger *v62;
  NSObject *v63;
  void *v64;
  void *v65;
  void *v66;
  MKFCKEventTrigger *v67;
  NSObject *v68;
  void *v69;
  void *v70;
  void *v71;
  id v72;
  id v73;
  id v74;
  id v75;
  id v76;
  id v77;
  id v78;
  id v79;
  id v80;
  id v81;
  _QWORD v82[2];
  _QWORD v83[2];
  const __CFString *v84;
  const __CFString *v85;
  const __CFString *v86;
  _BYTE buf[24];
  void *v88;
  uint64_t v89;

  v89 = *MEMORY[0x24BDAC8D0];
  v15 = a3;
  v16 = a4;
  v17 = a5;
  v80 = a6;
  v79 = a7;
  v18 = a9;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v75 = v17;
    v77 = v16;
    v19 = v15;
    v20 = v18;
    if (self)
    {
      v21 = (void *)MEMORY[0x24BDD1618];
      objc_msgSend(v19, "fireDateComponents");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v81 = 0;
      objc_msgSend(v21, "archivedDataWithRootObject:requiringSecureCoding:error:", v22, 1, &v81);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = v81;

      if (v23)
      {
        v84 = CFSTR("TEt");
        v85 = CFSTR("TECd");
        *(_QWORD *)buf = CFSTR("C");
        *(_QWORD *)&buf[8] = v23;
        objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", buf, &v84, 2);
        self = (MKFCKEventTrigger *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v33 = (void *)MEMORY[0x227676638]();
        v34 = self;
        HMFGetOSLogHandle();
        v35 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
        {
          HMFGetLogIdentifier();
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          *(_QWORD *)&buf[4] = v36;
          *(_WORD *)&buf[12] = 2114;
          *(_QWORD *)&buf[14] = v24;
          _os_log_impl(&dword_2218F0000, v35, OS_LOG_TYPE_ERROR, "%{public}@Failed to encode fireDateComponents: %{public}@", buf, 0x16u);

        }
        objc_autoreleasePoolPop(v33);
        self = 0;
      }

    }
    v17 = v75;
    v16 = v77;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v25 = v15;
      if (self)
      {
        -[MKFCKEventTrigger _encodeEventCharacteristic:accessories:context:](self, v25, v17, v18);
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        if (v26)
        {
          objc_msgSend(v25, "min");
          v27 = (void *)objc_claimAutoreleasedReturnValue();

          if (v27)
          {
            objc_msgSend(v25, "min");
            v28 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v26, "setObject:forKeyedSubscript:", v28, CFSTR("TEAn"));

          }
          objc_msgSend(v25, "max");
          v29 = (void *)objc_claimAutoreleasedReturnValue();

          if (v29)
          {
            objc_msgSend(v25, "max");
            v30 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v26, "setObject:forKeyedSubscript:", v30, CFSTR("TEAx"));

          }
          objc_msgSend(v26, "setObject:forKeyedSubscript:", CFSTR("CR"), CFSTR("TEt"));
          self = (MKFCKEventTrigger *)objc_msgSend(v26, "copy");
        }
        else
        {
          self = 0;
        }

      }
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          if (self)
          {
            *(_QWORD *)buf = CFSTR("D");
            v84 = CFSTR("TEt");
            v85 = CFSTR("TEDd");
            objc_msgSend(v15, "duration");
            v37 = (void *)objc_claimAutoreleasedReturnValue();
            *(_QWORD *)&buf[8] = v37;
            objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", buf, &v84, 2);
            self = (MKFCKEventTrigger *)objc_claimAutoreleasedReturnValue();

          }
        }
        else
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v76 = v17;
            v38 = v15;
            v39 = v80;
            v73 = v18;
            v40 = v18;
            if (self)
            {
              v41 = (void *)MEMORY[0x24BDD1618];
              objc_msgSend(v38, "region");
              v42 = (void *)objc_claimAutoreleasedReturnValue();
              v81 = 0;
              objc_msgSend(v41, "archivedDataWithRootObject:requiringSecureCoding:error:", v42, 1, &v81);
              v43 = (void *)objc_claimAutoreleasedReturnValue();
              v74 = v81;

              v78 = v16;
              if (v43)
              {
                v72 = v40;
                v44 = v39;
                objc_msgSend(v38, "user");
                v45 = (void *)objc_claimAutoreleasedReturnValue();

                if (v45)
                {
                  objc_msgSend(v38, "user");
                  v46 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v46, "modelID");
                  v47 = (void *)objc_claimAutoreleasedReturnValue();
                  -[MKFCKEventTrigger home](self, "home");
                  v48 = (void *)objc_claimAutoreleasedReturnValue();
                  +[MKFCKEventTrigger cloudUserWithModelID:home:]((uint64_t)MKFCKEventTrigger, v47, v48);
                  v49 = (void *)objc_claimAutoreleasedReturnValue();

                }
                else
                {
                  -[MKFCKEventTrigger home](self, "home");
                  v65 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v65, "owner");
                  v49 = (void *)objc_claimAutoreleasedReturnValue();

                  v66 = (void *)MEMORY[0x227676638]();
                  v67 = self;
                  HMFGetOSLogHandle();
                  v68 = objc_claimAutoreleasedReturnValue();
                  if (os_log_type_enabled(v68, OS_LOG_TYPE_INFO))
                  {
                    HMFGetLogIdentifier();
                    v69 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v49, "modelID");
                    v70 = (void *)objc_claimAutoreleasedReturnValue();
                    *(_DWORD *)buf = 138543874;
                    *(_QWORD *)&buf[4] = v69;
                    *(_WORD *)&buf[12] = 2160;
                    *(_QWORD *)&buf[14] = 1752392040;
                    *(_WORD *)&buf[22] = 2112;
                    v88 = v70;
                    _os_log_impl(&dword_2218F0000, v68, OS_LOG_TYPE_INFO, "%{public}@(Export) : FixUP: No user found for the MKFLocationEvent.user. Assigning owner of the home as owner of this location event: '%{mask.hash}@'", buf, 0x20u);

                  }
                  objc_autoreleasePoolPop(v66);
                }
                v39 = v44;
                objc_msgSend(v44, "addObject:", v49);
                v84 = CFSTR("TEt");
                v85 = CFSTR("TELl");
                *(_QWORD *)buf = CFSTR("L");
                *(_QWORD *)&buf[8] = v43;
                v86 = CFSTR("TELu");
                objc_msgSend(v49, "modelID");
                v71 = (void *)objc_claimAutoreleasedReturnValue();
                *(_QWORD *)&buf[16] = v71;
                objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", buf, &v84, 3);
                self = (MKFCKEventTrigger *)objc_claimAutoreleasedReturnValue();

                v40 = v72;
              }
              else
              {
                v60 = v39;
                v61 = (void *)MEMORY[0x227676638]();
                v62 = self;
                HMFGetOSLogHandle();
                v63 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v63, OS_LOG_TYPE_ERROR))
                {
                  HMFGetLogIdentifier();
                  v64 = (void *)objc_claimAutoreleasedReturnValue();
                  *(_DWORD *)buf = 138543618;
                  *(_QWORD *)&buf[4] = v64;
                  *(_WORD *)&buf[12] = 2114;
                  *(_QWORD *)&buf[14] = v74;
                  _os_log_impl(&dword_2218F0000, v63, OS_LOG_TYPE_ERROR, "%{public}@Failed to encode region: %{public}@", buf, 0x16u);

                }
                objc_autoreleasePoolPop(v61);
                self = 0;
                v39 = v60;
              }

              v16 = v78;
            }

            v17 = v76;
            v18 = v73;
          }
          else
          {
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              -[MKFCKEventTrigger _encodeEventPresence:users:guests:shouldRemoveEvent:context:](self, v15, v80, v79, a8, v18);
              v58 = (MKFCKEventTrigger *)objc_claimAutoreleasedReturnValue();
            }
            else
            {
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) == 0)
                goto LABEL_44;
              -[MKFCKEventTrigger _encodeEventSignificantTime:context:]((uint64_t)self, v15);
              v58 = (MKFCKEventTrigger *)objc_claimAutoreleasedReturnValue();
            }
            self = v58;
          }
        }
        goto LABEL_35;
      }
      v25 = v15;
      if (self)
      {
        -[MKFCKEventTrigger _encodeEventCharacteristic:accessories:context:](self, v25, v17, v18);
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        if (v31)
        {
          objc_msgSend(v25, "eventValue");
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v31, "setObject:forKeyedSubscript:", v32, CFSTR("TEAv"));

          objc_msgSend(v31, "setObject:forKeyedSubscript:", CFSTR("CV"), CFSTR("TEt"));
          self = (MKFCKEventTrigger *)objc_msgSend(v31, "copy");
        }
        else
        {
          self = 0;
        }

      }
    }

  }
LABEL_35:
  if (!self)
  {
LABEL_44:
    v57 = 0;
    goto LABEL_45;
  }
  v50 = (void *)MEMORY[0x24BDBCED8];
  v82[0] = CFSTR("TEm");
  objc_msgSend(v15, "modelID");
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  v82[1] = CFSTR("TEd");
  v83[0] = v51;
  objc_msgSend(v15, "endEvent");
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  v53 = objc_msgSend(v52, "BOOLValue");
  v54 = MEMORY[0x24BDBD1C0];
  if (v53)
    v54 = MEMORY[0x24BDBD1C8];
  v83[1] = v54;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v83, v82, 2);
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v50, "dictionaryWithDictionary:", v55);
  v56 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v56, "addEntriesFromDictionary:", self);
  +[MKFCKModel mergedDictionaryFromCloud:localModifications:](MKFCKModel, "mergedDictionaryFromCloud:localModifications:", v16, v56);
  v57 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_45:
  return v57;
}

- (id)_decodeEventDictionary:(id)a3 localModel:(id)a4 context:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  int v13;
  void *v14;
  id v15;
  id v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  _MKFCalendarEvent *v21;
  void *v22;
  void *v23;
  char v24;
  __objc2_class *v25;
  id v26;
  id v27;
  id v28;
  void *v29;
  id v30;
  void *v31;
  void *v32;
  char v33;
  uint64_t v35;
  void *v36;
  MKFCKEventTrigger *v37;
  NSObject *v38;
  void *v39;
  id v40;
  id v41;
  char v42;
  uint8_t buf[4];
  void *v44;
  __int16 v45;
  void *v46;
  __int16 v47;
  id v48;
  uint64_t v49;

  v49 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  v42 = 1;
  -[MKFCKEventTrigger _decodeNumberForKey:dictionary:success:](self, CFSTR("TEd"), v8, &v42);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[MKFCKEventTrigger _decodeStringForKey:dictionary:success:](self, CFSTR("TEt"), v8, &v42);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (v42)
  {
    v13 = objc_msgSend(v11, "BOOLValue");
    v14 = (void *)MEMORY[0x24BDBD1C0];
    if (v13)
      v14 = (void *)MEMORY[0x24BDBD1C8];
    v15 = v14;

    v41 = v10;
    if (objc_msgSend(v12, "isEqualToString:", CFSTR("C")))
    {
      v40 = v9;
      v16 = v10;
      if (self)
      {
        buf[0] = 1;
        v17 = v8;
        -[MKFCKEventTrigger _decodeUUIDForKey:dictionary:success:](self, CFSTR("TEm"), v17, buf);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        -[MKFCKEventTrigger _decodeDataForKey:dictionary:success:](self, CFSTR("TECd"), v17, buf);
        v19 = (void *)objc_claimAutoreleasedReturnValue();

        if (buf[0])
        {
          -[MKFCKEventTrigger _decodeDateComponentsData:](self, v19);
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          if (v20)
          {
            +[_MKFModel modelWithModelID:context:](_MKFCalendarEvent, "modelWithModelID:context:", v18, v16);
            v21 = (_MKFCalendarEvent *)objc_claimAutoreleasedReturnValue();
            if (!v21)
            {
              v21 = -[_MKFCalendarEvent initWithContext:]([_MKFCalendarEvent alloc], "initWithContext:", v16);
              -[_MKFCalendarEvent setModelID:](v21, "setModelID:", v18);
              -[MKFCKEventTrigger writerTimestamp](self, "writerTimestamp");
              v22 = (void *)objc_claimAutoreleasedReturnValue();
              -[_MKFCalendarEvent setWriterTimestamp:](v21, "setWriterTimestamp:", v22);

            }
            -[_MKFCalendarEvent fireDateComponents](v21, "fireDateComponents");
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            v24 = HMFEqualObjects();

            if ((v24 & 1) == 0)
              -[_MKFCalendarEvent setFireDateComponents:](v21, "setFireDateComponents:", v20);
          }
          else
          {
            v21 = 0;
          }

          goto LABEL_33;
        }
LABEL_30:
        v21 = 0;
LABEL_33:

        goto LABEL_34;
      }
      goto LABEL_50;
    }
    if (objc_msgSend(v12, "isEqualToString:", CFSTR("CR")))
    {
      if (self)
      {
        v25 = _MKFCharacteristicRangeEvent;
        goto LABEL_20;
      }
    }
    else
    {
      if (!objc_msgSend(v12, "isEqualToString:", CFSTR("CV")))
      {
        if (objc_msgSend(v12, "isEqualToString:", CFSTR("D")))
        {
          v40 = v9;
          v16 = v10;
          if (self)
          {
            buf[0] = 1;
            v30 = v8;
            -[MKFCKEventTrigger _decodeUUIDForKey:dictionary:success:](self, CFSTR("TEm"), v30, buf);
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            -[MKFCKEventTrigger _decodeNumberForKey:dictionary:success:](self, CFSTR("TEDd"), v30, buf);
            v19 = (void *)objc_claimAutoreleasedReturnValue();

            if (buf[0])
            {
              +[_MKFModel modelWithModelID:context:](_MKFDurationEvent, "modelWithModelID:context:", v18, v16);
              v21 = (_MKFCalendarEvent *)objc_claimAutoreleasedReturnValue();
              if (!v21)
              {
                v21 = -[_MKFDurationEvent initWithContext:]([_MKFDurationEvent alloc], "initWithContext:", v16);
                -[_MKFCalendarEvent setModelID:](v21, "setModelID:", v18);
                -[MKFCKEventTrigger writerTimestamp](self, "writerTimestamp");
                v31 = (void *)objc_claimAutoreleasedReturnValue();
                -[_MKFCalendarEvent setWriterTimestamp:](v21, "setWriterTimestamp:", v31);

              }
              -[_MKFCalendarEvent duration](v21, "duration");
              v32 = (void *)objc_claimAutoreleasedReturnValue();
              v33 = HMFEqualObjects();

              if ((v33 & 1) == 0)
                -[_MKFCalendarEvent setDuration:](v21, "setDuration:", v19);
              goto LABEL_33;
            }
            goto LABEL_30;
          }
LABEL_50:
          v21 = 0;
LABEL_34:

          v9 = v40;
          if (!v21)
          {
LABEL_36:
            v10 = v41;
            goto LABEL_37;
          }
LABEL_35:
          -[_MKFCalendarEvent setEndEvent:](v21, "setEndEvent:", v15);
          goto LABEL_36;
        }
        if (objc_msgSend(v12, "isEqualToString:", CFSTR("L")))
        {
          -[MKFCKEventTrigger _decodeEventLocation:trigger:context:](self, v8, v9, v10);
          v35 = objc_claimAutoreleasedReturnValue();
        }
        else if (objc_msgSend(v12, "isEqualToString:", CFSTR("P")))
        {
          -[MKFCKEventTrigger _decodeEventPresence:trigger:context:](self, v8, v9, v10);
          v35 = objc_claimAutoreleasedReturnValue();
        }
        else
        {
          if (!objc_msgSend(v12, "isEqualToString:", CFSTR("ST")))
          {
            v36 = (void *)MEMORY[0x227676638]();
            v37 = self;
            HMFGetOSLogHandle();
            v38 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
            {
              HMFGetLogIdentifier();
              v39 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138543874;
              v44 = v39;
              v45 = 2114;
              v46 = v12;
              v47 = 2112;
              v48 = v8;
              _os_log_impl(&dword_2218F0000, v38, OS_LOG_TYPE_ERROR, "%{public}@Unknown event type '%{public}@', ignoring: %@", buf, 0x20u);

            }
            objc_autoreleasePoolPop(v36);
            goto LABEL_49;
          }
          -[MKFCKEventTrigger _decodeEventSignificantTime:context:](self, v8, v10);
          v35 = objc_claimAutoreleasedReturnValue();
        }
        v21 = (_MKFCalendarEvent *)v35;
        if (!v35)
          goto LABEL_36;
        goto LABEL_35;
      }
      if (self)
      {
        v25 = _MKFCharacteristicValueEvent;
LABEL_20:
        v26 = v10;
        v27 = v9;
        v28 = v8;
        -[__objc2_class entity](v25, "entity");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        -[MKFCKEventTrigger _decodeEventCharacteristicWithEntity:eventDictionary:trigger:context:](self, v29, v28, v27, v26);
        v21 = (_MKFCalendarEvent *)objc_claimAutoreleasedReturnValue();

        if (!v21)
          goto LABEL_36;
        goto LABEL_35;
      }
    }
LABEL_49:
    v21 = 0;
    goto LABEL_37;
  }
  v21 = 0;
  v15 = v11;
LABEL_37:

  return v21;
}

- (BOOL)importIntoLocalModel:(id)a3 updatedProperties:(id)a4 context:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  BOOL v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  id v18;
  id v19;
  id v20;
  void *v21;
  id v22;
  objc_super v24;
  _QWORD v25[4];
  id v26;
  id v27;
  _QWORD v28[5];
  id v29;
  id v30;
  id v31;

  v8 = a3;
  v9 = a5;
  v24.receiver = self;
  v24.super_class = (Class)MKFCKEventTrigger;
  if (-[MKFCKTrigger importIntoLocalModel:updatedProperties:context:](&v24, sel_importIntoLocalModel_updatedProperties_context_, v8, a4, v9))
  {
    v10 = v8;
    v11 = v9;
    v12 = self != 0;
    if (self)
    {
      v13 = (void *)MEMORY[0x24BDBCEF0];
      -[MKFCKEventTrigger events](self, "events");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "setWithCapacity:", objc_msgSend(v14, "count"));
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      -[MKFCKEventTrigger events](self, "events");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = MEMORY[0x24BDAC760];
      v28[0] = MEMORY[0x24BDAC760];
      v28[1] = 3221225472;
      v28[2] = __57__MKFCKEventTrigger__importEventsIntoLocalModel_context___block_invoke;
      v28[3] = &unk_24E79B828;
      v28[4] = self;
      v18 = v10;
      v29 = v18;
      v19 = v11;
      v30 = v19;
      v20 = v15;
      v31 = v20;
      objc_msgSend(v16, "hmf_enumerateWithAutoreleasePoolUsingBlock:", v28);

      objc_msgSend(v18, "events");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v25[0] = v17;
      v25[1] = 3221225472;
      v25[2] = __57__MKFCKEventTrigger__importEventsIntoLocalModel_context___block_invoke_2;
      v25[3] = &unk_24E78CDD8;
      v26 = v20;
      v27 = v19;
      v22 = v20;
      objc_msgSend(v21, "hmf_enumerateWithAutoreleasePoolUsingBlock:", v25);

    }
  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (BOOL)exportFromLocalModel:(id)a3 updatedProperties:(id)a4 context:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  id v23;
  void *v24;
  uint64_t v25;
  void *v26;
  id v27;
  id v28;
  id v29;
  BOOL v30;
  id v31;
  id v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  char v37;
  void *v38;
  void *v39;
  char v40;
  void *v41;
  void *v42;
  int v43;
  void *v44;
  char v45;
  void *v46;
  id v48;
  id v49;
  id v50;
  void *context;
  void *v52;
  void *v53;
  void *v54;
  id v55;
  void *v56;
  id v57;
  void *v58;
  objc_super v59;
  _QWORD v60[4];
  id v61;
  MKFCKEventTrigger *v62;
  _QWORD v63[4];
  id v64;
  MKFCKEventTrigger *v65;
  id v66;
  id v67;
  id v68;
  id v69;
  id v70;
  uint64_t *v71;
  uint64_t v72;
  uint64_t *v73;
  uint64_t v74;
  char v75;
  _QWORD v76[4];
  id v77;
  id v78;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = (void *)MEMORY[0x227676638]();
  v59.receiver = self;
  v59.super_class = (Class)MKFCKEventTrigger;
  if (-[MKFCKTrigger exportFromLocalModel:updatedProperties:context:](&v59, sel_exportFromLocalModel_updatedProperties_context_, v8, v9, v10))
  {
    if (-[MKFCKModel shouldExportUpdatedPropertyInSet:name:](self, "shouldExportUpdatedPropertyInSet:name:", v9, CFSTR("events_")))
    {
      context = v11;
      v12 = v8;
      v13 = v10;
      if (self)
      {
        v14 = (void *)MEMORY[0x24BDBCEF0];
        objc_msgSend(v12, "events");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "setWithCapacity:", objc_msgSend(v15, "count"));
        v52 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(MEMORY[0x24BDBCEF0], "set");
        v56 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x24BDBCEF0], "set");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x24BDBCEF0], "set");
        v54 = (void *)objc_claimAutoreleasedReturnValue();
        v58 = v13;
        objc_msgSend(v13, "hmd_currentChangeSet");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = (void *)MEMORY[0x24BDBCED8];
        -[MKFCKEventTrigger events](self, "events");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "dictionaryWithCapacity:", objc_msgSend(v19, "count"));
        v20 = (void *)objc_claimAutoreleasedReturnValue();

        -[MKFCKEventTrigger events](self, "events");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v22 = MEMORY[0x24BDAC760];
        v76[0] = MEMORY[0x24BDAC760];
        v76[1] = 3221225472;
        v76[2] = __57__MKFCKEventTrigger__exportEventsFromLocalModel_context___block_invoke;
        v76[3] = &unk_24E79B878;
        v49 = v17;
        v77 = v49;
        v23 = v20;
        v78 = v23;
        objc_msgSend(v21, "hmf_enumerateWithAutoreleasePoolUsingBlock:", v76);

        v72 = 0;
        v73 = &v72;
        v74 = 0x2020000000;
        v75 = 1;
        v50 = v12;
        v24 = v12;
        v25 = v22;
        objc_msgSend(v24, "events");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        v63[0] = v22;
        v63[1] = 3221225472;
        v63[2] = __57__MKFCKEventTrigger__exportEventsFromLocalModel_context___block_invoke_2;
        v63[3] = &unk_24E78CDB0;
        v27 = v23;
        v64 = v27;
        v65 = self;
        v57 = v56;
        v66 = v57;
        v28 = v16;
        v67 = v28;
        v55 = v54;
        v68 = v55;
        v69 = v58;
        v71 = &v72;
        v29 = v52;
        v70 = v29;
        objc_msgSend(v26, "hmf_enumerateWithAutoreleasePoolUsingBlock:", v63);

        v30 = *((_BYTE *)v73 + 24) != 0;
        if (*((_BYTE *)v73 + 24))
        {
          v60[0] = v25;
          v60[1] = 3221225472;
          v60[2] = __57__MKFCKEventTrigger__exportEventsFromLocalModel_context___block_invoke_3;
          v60[3] = &unk_24E79B8C8;
          v31 = v29;
          v61 = v31;
          v62 = self;
          objc_msgSend(v27, "enumerateKeysAndObjectsUsingBlock:", v60);
          v48 = v29;
          v32 = v27;
          v33 = (void *)MEMORY[0x24BDBCF20];
          -[MKFCKEventTrigger events](self, "events");
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v33, "setWithArray:", v34);
          v53 = (void *)objc_claimAutoreleasedReturnValue();

          if ((HMFEqualObjects() & 1) == 0)
          {
            objc_msgSend(v31, "allObjects");
            v35 = (void *)objc_claimAutoreleasedReturnValue();
            -[MKFCKEventTrigger setEvents:](self, "setEvents:", v35);

          }
          -[MKFCKEventTrigger accessories](self, "accessories");
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          v37 = HMFEqualObjects();

          if ((v37 & 1) == 0)
          {
            v38 = (void *)objc_msgSend(v57, "copy");
            -[MKFCKEventTrigger setAccessories:](self, "setAccessories:", v38);

          }
          -[MKFCKEventTrigger users](self, "users");
          v39 = (void *)objc_claimAutoreleasedReturnValue();
          v40 = HMFEqualObjects();

          if ((v40 & 1) == 0)
          {
            v41 = (void *)objc_msgSend(v28, "copy");
            -[MKFCKEventTrigger setUsers:](self, "setUsers:", v41);

          }
          +[HMDCoreData featuresDataSource](HMDCoreData, "featuresDataSource");
          v42 = (void *)objc_claimAutoreleasedReturnValue();
          v43 = objc_msgSend(v42, "isRestrictedGuestEnabled");

          if (v43)
          {
            -[MKFCKEventTrigger guests](self, "guests");
            v44 = (void *)objc_claimAutoreleasedReturnValue();
            v45 = HMFEqualObjects();

            if ((v45 & 1) == 0)
            {
              v46 = (void *)objc_msgSend(v55, "copy");
              -[MKFCKEventTrigger setGuests:](self, "setGuests:", v46);

            }
          }

          v27 = v32;
          v29 = v48;
        }

        _Block_object_dispose(&v72, 8);
        v12 = v50;
        v13 = v58;
      }
      else
      {
        v30 = 0;
      }

      v11 = context;
    }
    else
    {
      v30 = 1;
    }
  }
  else
  {
    v30 = 0;
  }
  objc_autoreleasePoolPop(v11);

  return v30;
}

void __57__MKFCKEventTrigger__exportEventsFromLocalModel_context___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  char v7;
  id v8;

  v8 = a2;
  objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("TEm"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v4 = v3;
  else
    v4 = 0;
  v5 = v4;

  objc_msgSend(*(id *)(a1 + 32), "deletedModelIDs");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "containsObject:", v5);

  if ((v7 & 1) == 0)
    objc_msgSend(*(id *)(a1 + 40), "setObject:forKeyedSubscript:", v8, v5);

}

void __57__MKFCKEventTrigger__exportEventsFromLocalModel_context___block_invoke_2(uint64_t a1, void *a2, _BYTE *a3)
{
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  char v14;

  v14 = 0;
  v5 = *(void **)(a1 + 32);
  v6 = a2;
  objc_msgSend(v6, "modelID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 40), "_encodeEvent:encodedEventInCloud:accessories:users:guests:shouldRemoveEvent:context:", v6, v8, *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64), &v14, *(_QWORD *)(a1 + 72));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = *(void **)(a1 + 32);
  objc_msgSend(v6, "modelID");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "removeObjectForKey:", v11);
  if (v9)
  {
    v12 = *(void **)(a1 + 80);
    v13 = (void *)objc_msgSend(v9, "copy");
    objc_msgSend(v12, "addObject:", v13);

  }
  else if (!v14)
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8) + 24) = 0;
    *a3 = 1;
  }

}

void __57__MKFCKEventTrigger__exportEventsFromLocalModel_context___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  id v8;
  NSObject *v9;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  __int16 v14;
  void *v15;
  __int16 v16;
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  v7 = (void *)MEMORY[0x227676638](objc_msgSend(*(id *)(a1 + 32), "addObject:", v6));
  v8 = *(id *)(a1 + 40);
  HMFGetOSLogHandle();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("TEt"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = 138543874;
    v13 = v10;
    v14 = 2114;
    v15 = v11;
    v16 = 2112;
    v17 = v6;
    _os_log_impl(&dword_2218F0000, v9, OS_LOG_TYPE_INFO, "%{public}@Found new event type [%{public}@] not supported by this software. Adding it back to cloud: %@", (uint8_t *)&v12, 0x20u);

  }
  objc_autoreleasePoolPop(v7);

}

void __57__MKFCKEventTrigger__importEventsIntoLocalModel_context___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v3;
  id v4;

  objc_msgSend(*(id *)(a1 + 32), "_decodeEventDictionary:localModel:context:", a2, *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = v3;
    objc_msgSend(v3, "setTrigger:", *(_QWORD *)(a1 + 40));
    objc_msgSend(*(id *)(a1 + 56), "addObject:", v4);
    v3 = v4;
  }

}

void __57__MKFCKEventTrigger__importEventsIntoLocalModel_context___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if ((objc_msgSend(*(id *)(a1 + 32), "containsObject:") & 1) == 0)
    objc_msgSend(*(id *)(a1 + 40), "deleteObject:", v3);

}

- (id)_decodeNumberForKey:(void *)a3 dictionary:(_BYTE *)a4 success:
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  id v11;
  int v12;
  void *v13;
  id v14;
  void *v15;
  id v16;
  NSObject *v17;
  void *v18;
  int v20;
  void *v21;
  __int16 v22;
  id v23;
  __int16 v24;
  id v25;
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  v7 = a2;
  v8 = a3;
  if (a1)
  {
    -[MKFCKEventTrigger _decodeValueForKey:dictionary:optional:success:](a1, v7, v8, 0, a4);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v9;
    if (v9)
    {
      v11 = v9;
      objc_opt_class();
      v12 = objc_opt_isKindOfClass() & 1;
      if (v12)
        v13 = v11;
      else
        v13 = 0;
      v14 = v13;

      if (v12)
      {
        a1 = v11;
      }
      else
      {
        v15 = (void *)MEMORY[0x227676638]();
        v16 = a1;
        HMFGetOSLogHandle();
        v17 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
        {
          HMFGetLogIdentifier();
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          v20 = 138543874;
          v21 = v18;
          v22 = 2114;
          v23 = v7;
          v24 = 2112;
          v25 = v8;
          _os_log_impl(&dword_2218F0000, v17, OS_LOG_TYPE_ERROR, "%{public}@Unexpected type for '%{public}@' in event: %@", (uint8_t *)&v20, 0x20u);

        }
        objc_autoreleasePoolPop(v15);
        a1 = 0;
        *a4 = 0;
      }

    }
    else
    {
      a1 = 0;
    }

  }
  return a1;
}

- (id)_decodeStringForKey:(void *)a3 dictionary:(_BYTE *)a4 success:
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  id v11;
  int v12;
  void *v13;
  id v14;
  void *v15;
  id v16;
  NSObject *v17;
  void *v18;
  int v20;
  void *v21;
  __int16 v22;
  id v23;
  __int16 v24;
  id v25;
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  v7 = a2;
  v8 = a3;
  if (a1)
  {
    -[MKFCKEventTrigger _decodeValueForKey:dictionary:optional:success:](a1, v7, v8, 0, a4);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v9;
    if (v9)
    {
      v11 = v9;
      objc_opt_class();
      v12 = objc_opt_isKindOfClass() & 1;
      if (v12)
        v13 = v11;
      else
        v13 = 0;
      v14 = v13;

      if (v12)
      {
        a1 = v11;
      }
      else
      {
        v15 = (void *)MEMORY[0x227676638]();
        v16 = a1;
        HMFGetOSLogHandle();
        v17 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
        {
          HMFGetLogIdentifier();
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          v20 = 138543874;
          v21 = v18;
          v22 = 2114;
          v23 = v7;
          v24 = 2112;
          v25 = v8;
          _os_log_impl(&dword_2218F0000, v17, OS_LOG_TYPE_ERROR, "%{public}@Unexpected type for '%{public}@' in event: %@", (uint8_t *)&v20, 0x20u);

        }
        objc_autoreleasePoolPop(v15);
        a1 = 0;
        *a4 = 0;
      }

    }
    else
    {
      a1 = 0;
    }

  }
  return a1;
}

- (id)_decodeValueForKey:(void *)a3 dictionary:(char)a4 optional:(_BYTE *)a5 success:
{
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  NSObject *v15;
  void *v16;
  int v18;
  void *v19;
  __int16 v20;
  id v21;
  __int16 v22;
  void *v23;
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v9 = a2;
  v10 = a3;
  v11 = v10;
  if (*a5)
  {
    objc_msgSend(v10, "objectForKeyedSubscript:", v9);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v12 && (a4 & 1) == 0)
    {
      v13 = (void *)MEMORY[0x227676638]();
      v14 = a1;
      HMFGetOSLogHandle();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = 138543874;
        v19 = v16;
        v20 = 2114;
        v21 = v9;
        v22 = 2112;
        v23 = v11;
        _os_log_impl(&dword_2218F0000, v15, OS_LOG_TYPE_ERROR, "%{public}@Missing value for '%{public}@' in event: %@", (uint8_t *)&v18, 0x20u);

      }
      objc_autoreleasePoolPop(v13);
      v12 = 0;
      *a5 = 0;
    }
  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (id)_decodeDateComponentsData:(void *)a1
{
  id v3;
  void *v4;
  id v5;
  id v6;
  void *v7;
  id v8;
  NSObject *v9;
  void *v10;
  id v12;
  uint8_t buf[4];
  void *v14;
  __int16 v15;
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  v12 = 0;
  objc_msgSend(MEMORY[0x24BDD1620], "unarchivedObjectOfClass:fromData:error:", objc_opt_class(), v3, &v12);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v12;
  if (v4)
  {
    v6 = v4;
  }
  else
  {
    v7 = (void *)MEMORY[0x227676638]();
    v8 = a1;
    HMFGetOSLogHandle();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v14 = v10;
      v15 = 2114;
      v16 = v5;
      _os_log_impl(&dword_2218F0000, v9, OS_LOG_TYPE_ERROR, "%{public}@Failed to decode date components: %{public}@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v7);
  }

  return v4;
}

- (id)_decodeUUIDForKey:(void *)a3 dictionary:(_BYTE *)a4 success:
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  id v11;
  int v12;
  void *v13;
  id v14;
  id v15;
  void *v16;
  id v17;
  NSObject *v18;
  void *v19;
  int v21;
  void *v22;
  __int16 v23;
  id v24;
  __int16 v25;
  id v26;
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  v7 = a2;
  v8 = a3;
  -[MKFCKEventTrigger _decodeValueForKey:dictionary:optional:success:](a1, v7, v8, 0, a4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v9)
  {
    v11 = v9;
    objc_opt_class();
    v12 = objc_opt_isKindOfClass() & 1;
    if (v12)
      v13 = v11;
    else
      v13 = 0;
    v14 = v13;

    if (v12)
    {
      v15 = v11;
    }
    else
    {
      v16 = (void *)MEMORY[0x227676638]();
      v17 = a1;
      HMFGetOSLogHandle();
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v21 = 138543874;
        v22 = v19;
        v23 = 2114;
        v24 = v7;
        v25 = 2112;
        v26 = v8;
        _os_log_impl(&dword_2218F0000, v18, OS_LOG_TYPE_ERROR, "%{public}@Unexpected type for '%{public}@' in event: %@", (uint8_t *)&v21, 0x20u);

      }
      objc_autoreleasePoolPop(v16);
      v15 = 0;
      *a4 = 0;
    }

  }
  else
  {
    v15 = 0;
  }

  return v15;
}

- (id)_decodeDataForKey:(void *)a3 dictionary:(_BYTE *)a4 success:
{
  -[MKFCKEventTrigger _decodeDataForKey:dictionary:optional:success:](a1, a2, a3, 0, a4);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)_decodeDataForKey:(void *)a3 dictionary:(char)a4 optional:(_BYTE *)a5 success:
{
  id v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  int v14;
  void *v15;
  id v16;
  id v17;
  void *v18;
  id v19;
  NSObject *v20;
  void *v21;
  int v23;
  void *v24;
  __int16 v25;
  id v26;
  __int16 v27;
  id v28;
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  v9 = a2;
  v10 = a3;
  -[MKFCKEventTrigger _decodeValueForKey:dictionary:optional:success:](a1, v9, v10, a4, a5);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v11;
  if (v11)
  {
    v13 = v11;
    objc_opt_class();
    v14 = objc_opt_isKindOfClass() & 1;
    if (v14)
      v15 = v13;
    else
      v15 = 0;
    v16 = v15;

    if (v14)
    {
      v17 = v13;
    }
    else
    {
      v18 = (void *)MEMORY[0x227676638]();
      v19 = a1;
      HMFGetOSLogHandle();
      v20 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v23 = 138543874;
        v24 = v21;
        v25 = 2114;
        v26 = v9;
        v27 = 2112;
        v28 = v10;
        _os_log_impl(&dword_2218F0000, v20, OS_LOG_TYPE_ERROR, "%{public}@Unexpected type for '%{public}@' in event: %@", (uint8_t *)&v23, 0x20u);

      }
      objc_autoreleasePoolPop(v18);
      v17 = 0;
      *a5 = 0;
    }

  }
  else
  {
    v17 = 0;
  }

  return v17;
}

- (id)_decodeCharacteristicValueForKey:(void *)a3 dictionary:(char)a4 optional:(_BYTE *)a5 success:
{
  id v9;
  id v10;
  uint64_t v11;
  void *v12;
  id v13;
  void *v14;
  id v15;
  NSObject *v16;
  void *v17;
  int v19;
  void *v20;
  __int16 v21;
  id v22;
  __int16 v23;
  id v24;
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v9 = a2;
  v10 = a3;
  -[MKFCKEventTrigger _decodeValueForKey:dictionary:optional:success:](a1, v9, v10, a4, a5);
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = (void *)v11;
  v13 = 0;
  if (v11 && *MEMORY[0x24BDBD430] != v11)
  {
    if ((isAllowedCharType() & 1) != 0)
    {
      v13 = v12;
    }
    else
    {
      v14 = (void *)MEMORY[0x227676638]();
      v15 = a1;
      HMFGetOSLogHandle();
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = 138543874;
        v20 = v17;
        v21 = 2114;
        v22 = v9;
        v23 = 2112;
        v24 = v10;
        _os_log_impl(&dword_2218F0000, v16, OS_LOG_TYPE_ERROR, "%{public}@Unexpected type for '%{public}@' in event: %@", (uint8_t *)&v19, 0x20u);

      }
      objc_autoreleasePoolPop(v14);
      v13 = 0;
      *a5 = 0;
    }
  }

  return v13;
}

+ (id)localUserWithModelID:(void *)a3 home:
{
  id v4;
  id v5;
  void *v6;
  id v7;
  id v8;
  _QWORD v10[4];
  id v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t (*v16)(uint64_t, uint64_t);
  void (*v17)(uint64_t);
  id v18;

  v4 = a2;
  v5 = a3;
  objc_opt_self();
  v13 = 0;
  v14 = &v13;
  v15 = 0x3032000000;
  v16 = __Block_byref_object_copy__175811;
  v17 = __Block_byref_object_dispose__175812;
  v18 = 0;
  objc_msgSend(v5, "users");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __56__MKFCKEventTrigger_Helpers__localUserWithModelID_home___block_invoke;
  v10[3] = &unk_24E78CE00;
  v7 = v4;
  v11 = v7;
  v12 = &v13;
  objc_msgSend(v6, "hmf_enumerateWithAutoreleasePoolUsingBlock:", v10);

  v8 = (id)v14[5];
  _Block_object_dispose(&v13, 8);

  return v8;
}

void __56__MKFCKEventTrigger_Helpers__localUserWithModelID_home___block_invoke(uint64_t a1, void *a2, _BYTE *a3)
{
  void *v6;
  int v7;
  id v8;

  v8 = a2;
  objc_msgSend(v8, "modelID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "isEqual:", *(_QWORD *)(a1 + 32));

  if (v7)
  {
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
    *a3 = 1;
  }

}

+ (id)cloudUserWithModelID:(void *)a3 home:
{
  id v4;
  id v5;
  void *v6;
  id v7;
  id v8;
  _QWORD v10[4];
  id v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t (*v16)(uint64_t, uint64_t);
  void (*v17)(uint64_t);
  id v18;

  v4 = a2;
  v5 = a3;
  objc_opt_self();
  v13 = 0;
  v14 = &v13;
  v15 = 0x3032000000;
  v16 = __Block_byref_object_copy__175811;
  v17 = __Block_byref_object_dispose__175812;
  v18 = 0;
  objc_msgSend(v5, "users");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __56__MKFCKEventTrigger_Helpers__cloudUserWithModelID_home___block_invoke;
  v10[3] = &unk_24E78E1F8;
  v7 = v4;
  v11 = v7;
  v12 = &v13;
  objc_msgSend(v6, "hmf_enumerateWithAutoreleasePoolUsingBlock:", v10);

  v8 = (id)v14[5];
  _Block_object_dispose(&v13, 8);

  return v8;
}

void __56__MKFCKEventTrigger_Helpers__cloudUserWithModelID_home___block_invoke(uint64_t a1, void *a2, _BYTE *a3)
{
  void *v6;
  int v7;
  id v8;

  v8 = a2;
  objc_msgSend(v8, "modelID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "isEqual:", *(_QWORD *)(a1 + 32));

  if (v7)
  {
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
    *a3 = 1;
  }

}

void __57__MKFCKEventTrigger_Helpers__localGuestWithModelID_home___block_invoke(uint64_t a1, void *a2, _BYTE *a3)
{
  void *v6;
  int v7;
  id v8;

  v8 = a2;
  objc_msgSend(v8, "modelID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "isEqual:", *(_QWORD *)(a1 + 32));

  if (v7)
  {
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
    *a3 = 1;
  }

}

void __57__MKFCKEventTrigger_Helpers__cloudGuestWithModelID_home___block_invoke(uint64_t a1, void *a2, _BYTE *a3)
{
  void *v6;
  int v7;
  id v8;

  v8 = a2;
  objc_msgSend(v8, "modelID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "isEqual:", *(_QWORD *)(a1 + 32));

  if (v7)
  {
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
    *a3 = 1;
  }

}

- (id)_encodeEventPresence:(void *)a3 users:(void *)a4 guests:(_BYTE *)a5 shouldRemoveEvent:(void *)a6 context:
{
  id v11;
  id v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  id v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  uint64_t v32;
  void *v33;
  uint64_t v34;
  void *v35;
  id v36;
  NSObject *v37;
  id v38;
  void *v39;
  void *v40;
  id v41;
  NSObject *v42;
  void *v43;
  void *v45;
  void *v46;
  _QWORD v47[5];
  id v48;
  id v49;
  _QWORD v50[5];
  id v51;
  id v52;
  _QWORD v53[4];
  _QWORD v54[4];
  uint8_t buf[4];
  void *v56;
  __int16 v57;
  id v58;
  uint64_t v59;

  v59 = *MEMORY[0x24BDAC8D0];
  v11 = a2;
  v12 = a3;
  v13 = a4;
  v14 = a6;
  if (a1)
  {
    objc_msgSend(v11, "activation");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = v15;
    if (!v15)
    {
      v35 = (void *)MEMORY[0x227676638]();
      v36 = a1;
      HMFGetOSLogHandle();
      v37 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v38 = v13;
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v56 = v39;
        v57 = 2112;
        v58 = v11;
        _os_log_impl(&dword_2218F0000, v37, OS_LOG_TYPE_ERROR, "%{public}@No activation for event: %@", buf, 0x16u);

        v13 = v38;
      }

      objc_autoreleasePoolPop(v35);
      a1 = 0;
      *a5 = 1;
      goto LABEL_19;
    }
    v46 = v13;
    objc_msgSend(v15, "unsignedIntegerValue");
    objc_msgSend(v11, "presenceType");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v17)
    {
      v40 = (void *)MEMORY[0x227676638]();
      v41 = a1;
      HMFGetOSLogHandle();
      v42 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v56 = v43;
        v57 = 2112;
        v58 = v11;
        _os_log_impl(&dword_2218F0000, v42, OS_LOG_TYPE_ERROR, "%{public}@No presenceType for event: %@", buf, 0x16u);

      }
      objc_autoreleasePoolPop(v40);
      a1 = 0;
      *a5 = 1;
      goto LABEL_18;
    }
    v18 = (void *)MEMORY[0x24BDBCEB8];
    objc_msgSend(v11, "users");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "arrayWithCapacity:", objc_msgSend(v19, "count"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v11, "users");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = v12;
    v23 = MEMORY[0x24BDAC760];
    v50[0] = MEMORY[0x24BDAC760];
    v50[1] = 3221225472;
    v50[2] = __91__MKFCKEventTrigger_Presence___encodeEventPresence_users_guests_shouldRemoveEvent_context___block_invoke;
    v50[3] = &unk_24E78D948;
    v50[4] = a1;
    v24 = v20;
    v51 = v24;
    v45 = v22;
    v52 = v22;
    objc_msgSend(v21, "hmf_enumerateWithAutoreleasePoolUsingBlock:", v50);

    v25 = (void *)MEMORY[0x24BDBCEB8];
    objc_msgSend(v11, "guests");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "arrayWithCapacity:", objc_msgSend(v26, "count"));
    v27 = (void *)objc_claimAutoreleasedReturnValue();

    +[HMDCoreData featuresDataSource](HMDCoreData, "featuresDataSource");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v26) = objc_msgSend(v28, "isRestrictedGuestEnabled");

    if ((_DWORD)v26)
    {
      objc_msgSend(v11, "guests");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      v47[0] = v23;
      v47[1] = 3221225472;
      v47[2] = __91__MKFCKEventTrigger_Presence___encodeEventPresence_users_guests_shouldRemoveEvent_context___block_invoke_2;
      v47[3] = &unk_24E78D970;
      v47[4] = a1;
      v48 = v27;
      v49 = v46;
      objc_msgSend(v29, "hmf_enumerateWithAutoreleasePoolUsingBlock:", v47);

    }
    v53[0] = CFSTR("TEt");
    v53[1] = CFSTR("TEPa");
    v54[0] = CFSTR("P");
    v54[1] = v16;
    v54[2] = v17;
    v53[2] = CFSTR("TEPt");
    v53[3] = CFSTR("TEPu");
    v30 = (void *)objc_msgSend(v24, "copy");
    v54[3] = v30;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v54, v53, 4);
    a1 = (void *)objc_claimAutoreleasedReturnValue();

    +[HMDCoreData featuresDataSource](HMDCoreData, "featuresDataSource");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v31, "isRestrictedGuestEnabled"))
    {
      v32 = objc_msgSend(v27, "count");

      v12 = v45;
      if (!v32)
        goto LABEL_17;
      v31 = (void *)objc_msgSend(a1, "mutableCopy");
      v33 = (void *)objc_msgSend(v27, "copy");
      objc_msgSend(v31, "setObject:forKeyedSubscript:", v33, CFSTR("TEPg"));

      v34 = objc_msgSend(v31, "copy");
      a1 = (void *)v34;
    }
    else
    {
      v12 = v45;
    }

LABEL_17:
LABEL_18:
    v13 = v46;

LABEL_19:
  }

  return a1;
}

void __91__MKFCKEventTrigger_Presence___encodeEventPresence_users_guests_shouldRemoveEvent_context___block_invoke(id *a1, void *a2)
{
  void *v3;
  void *v4;
  id v5;

  objc_msgSend(a2, "modelID");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1[4], "home");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[MKFCKEventTrigger cloudUserWithModelID:home:]((uint64_t)MKFCKEventTrigger, v5, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(a1[5], "addObject:", v5);
  objc_msgSend(a1[6], "addObject:", v4);

}

void __91__MKFCKEventTrigger_Presence___encodeEventPresence_users_guests_shouldRemoveEvent_context___block_invoke_2(id *a1, void *a2)
{
  void *v3;
  void *v4;
  id v5;
  id v6;
  void *v7;
  id v8;
  id v9;
  _QWORD v10[4];
  id v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t (*v16)(uint64_t, uint64_t);
  void (*v17)(uint64_t);
  id v18;

  objc_msgSend(a2, "modelID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1[4], "home");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v3;
  v6 = v4;
  objc_opt_self();
  v13 = 0;
  v14 = &v13;
  v15 = 0x3032000000;
  v16 = __Block_byref_object_copy__175811;
  v17 = __Block_byref_object_dispose__175812;
  v18 = 0;
  objc_msgSend(v6, "guests");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __57__MKFCKEventTrigger_Helpers__cloudGuestWithModelID_home___block_invoke;
  v10[3] = &unk_24E78CE50;
  v9 = v5;
  v11 = v9;
  v12 = &v13;
  objc_msgSend(v7, "hmf_enumerateWithAutoreleasePoolUsingBlock:", v10);

  v8 = (id)v14[5];
  _Block_object_dispose(&v13, 8);

  objc_msgSend(a1[5], "addObject:", v9);
  objc_msgSend(a1[6], "addObject:", v8);

}

- (_MKFPresenceEvent)_decodeEventPresence:(void *)a3 trigger:(void *)a4 context:
{
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  id v16;
  _MKFPresenceEvent *v17;
  void *v18;
  void *v19;
  char v20;
  void *v21;
  char v22;
  void *v23;
  char v24;
  void *v25;
  int v26;
  id v27;
  void *v28;
  id v29;
  char isKindOfClass;
  void *v31;
  uint64_t v32;
  void *v33;
  id v34;
  void *v35;
  void *v36;
  id v37;
  NSObject *v38;
  void *v39;
  void *v40;
  id v41;
  NSObject *v42;
  void *v43;
  void *v44;
  char v45;
  id v47;
  id v48;
  void *v49;
  void *v50;
  void *v51;
  id v52;
  id v53;
  id v54;
  id v55;
  _QWORD v56[5];
  id v57;
  id v58;
  id v59;
  uint64_t *v60;
  uint64_t v61;
  uint64_t *v62;
  uint64_t v63;
  char v64[8];
  uint64_t v65;
  uint64_t *v66;
  uint64_t v67;
  char v68;
  _BYTE buf[24];
  void *v70;
  void *v71;
  id v72;
  id v73;
  id v74;
  uint64_t *v75;
  uint64_t v76;

  v76 = *MEMORY[0x24BDAC8D0];
  v7 = a2;
  v55 = a3;
  v54 = a4;
  if (!a1)
  {
    v17 = 0;
    goto LABEL_46;
  }
  v61 = 0;
  v62 = &v61;
  v63 = 0x2020000000;
  v64[0] = 1;
  -[MKFCKEventTrigger _decodeUUIDForKey:dictionary:success:](a1, CFSTR("TEm"), v7, v64);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[MKFCKEventTrigger _decodeNumberForKey:dictionary:success:](a1, CFSTR("TEPa"), v7, (_BYTE *)v62 + 24);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[MKFCKEventTrigger _decodeStringForKey:dictionary:success:](a1, CFSTR("TEPt"), v7, (_BYTE *)v62 + 24);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (*((_BYTE *)v62 + 24))
  {
    objc_msgSend(v9, "unsignedIntegerValue");
    objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("TEPu"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v12 = v11;
    else
      v12 = 0;
    v13 = v12;

    if (!v13)
    {
      v36 = (void *)MEMORY[0x227676638]();
      v37 = a1;
      HMFGetOSLogHandle();
      v38 = (id)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        *(_QWORD *)&buf[4] = v39;
        *(_WORD *)&buf[12] = 2114;
        *(_QWORD *)&buf[14] = CFSTR("TEPu");
        *(_WORD *)&buf[22] = 2112;
        v70 = v7;
        _os_log_impl(&dword_2218F0000, v38, OS_LOG_TYPE_ERROR, "%{public}@Failed to decode '%{public}@' in event: %@", buf, 0x20u);

      }
      objc_autoreleasePoolPop(v36);
      v17 = 0;
      goto LABEL_44;
    }
    objc_msgSend(v55, "home");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDBCEF0], "setWithCapacity:", objc_msgSend(v13, "count"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v56[0] = MEMORY[0x24BDAC760];
    v56[1] = 3221225472;
    v56[2] = __68__MKFCKEventTrigger_Presence___decodeEventPresence_trigger_context___block_invoke;
    v56[3] = &unk_24E78D998;
    v56[4] = a1;
    v16 = v7;
    v57 = v16;
    v60 = &v61;
    v52 = v14;
    v58 = v52;
    v53 = v15;
    v59 = v53;
    objc_msgSend(v13, "hmf_enumerateWithAutoreleasePoolUsingBlock:", v56);
    if (!*((_BYTE *)v62 + 24))
    {
      v17 = 0;
LABEL_43:

LABEL_44:
      goto LABEL_45;
    }
    +[_MKFModel modelWithModelID:context:](_MKFPresenceEvent, "modelWithModelID:context:", v8, v54);
    v17 = (_MKFPresenceEvent *)objc_claimAutoreleasedReturnValue();
    if (!v17)
    {
      v17 = -[_MKFPresenceEvent initWithContext:]([_MKFPresenceEvent alloc], "initWithContext:", v54);
      -[_MKFPresenceEvent setModelID:](v17, "setModelID:", v8);
      objc_msgSend(a1, "writerTimestamp");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      -[_MKFPresenceEvent setWriterTimestamp:](v17, "setWriterTimestamp:", v18);

    }
    -[_MKFPresenceEvent activation](v17, "activation");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = HMFEqualObjects();

    if ((v20 & 1) == 0)
      -[_MKFPresenceEvent setActivation:](v17, "setActivation:", v9);
    -[_MKFPresenceEvent presenceType](v17, "presenceType");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = HMFEqualObjects();

    if ((v22 & 1) == 0)
      -[_MKFPresenceEvent setPresenceType:](v17, "setPresenceType:", v10);
    v51 = (void *)objc_msgSend(v53, "copy");
    -[_MKFPresenceEvent users](v17, "users");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = HMFEqualObjects();

    if ((v24 & 1) == 0)
      -[_MKFPresenceEvent setUsers_:](v17, "setUsers_:", v51);
    +[HMDCoreData featuresDataSource](HMDCoreData, "featuresDataSource");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = objc_msgSend(v25, "isRestrictedGuestEnabled");

    if (!v26)
    {
LABEL_42:

      goto LABEL_43;
    }
    v27 = v16;
    v48 = v52;
    v49 = v27;
    objc_msgSend(v27, "objectForKeyedSubscript:", CFSTR("TEPg"));
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v50 = v28;
    if (!v28)
    {
      v35 = 0;
      goto LABEL_38;
    }
    v29 = v28;
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();
    if ((isKindOfClass & 1) != 0)
      v31 = v29;
    else
      v31 = 0;
    v47 = v31;

    if ((isKindOfClass & 1) != 0)
    {
      if (objc_msgSend(v29, "count", v47))
      {
        objc_msgSend(MEMORY[0x24BDBCEF0], "setWithCapacity:", objc_msgSend(v29, "count"));
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        v65 = 0;
        v66 = &v65;
        v67 = 0x2020000000;
        v68 = 1;
        *(_QWORD *)buf = MEMORY[0x24BDAC760];
        *(_QWORD *)&buf[8] = 3221225472;
        *(_QWORD *)&buf[16] = __77__MKFCKEventTrigger_Presence___decodeGuestsFromPresenceEventDictionary_home___block_invoke;
        v70 = &unk_24E78D998;
        v71 = a1;
        v72 = v49;
        v75 = &v65;
        v73 = v48;
        v34 = v33;
        v74 = v34;
        objc_msgSend(v29, "hmf_enumerateWithAutoreleasePoolUsingBlock:", buf);
        if (*((_BYTE *)v66 + 24))
          v35 = (void *)objc_msgSend(v34, "copy");
        else
          v35 = 0;

        _Block_object_dispose(&v65, 8);
        goto LABEL_37;
      }
    }
    else
    {
      v40 = (void *)MEMORY[0x227676638](v32);
      v41 = a1;
      HMFGetOSLogHandle();
      v42 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        *(_QWORD *)&buf[4] = v43;
        *(_WORD *)&buf[12] = 2114;
        *(_QWORD *)&buf[14] = CFSTR("TEPg");
        *(_WORD *)&buf[22] = 2112;
        v70 = v49;
        _os_log_impl(&dword_2218F0000, v42, OS_LOG_TYPE_ERROR, "%{public}@Failed to decode '%{public}@' in event: %@", buf, 0x20u);

      }
      objc_autoreleasePoolPop(v40);
    }
    v35 = 0;
LABEL_37:

LABEL_38:
    if (v35)
    {
      -[_MKFPresenceEvent guests](v17, "guests");
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      v45 = HMFEqualObjects();

      if ((v45 & 1) == 0)
        -[_MKFPresenceEvent setGuests_:](v17, "setGuests_:", v35);
    }

    goto LABEL_42;
  }
  v17 = 0;
LABEL_45:

  _Block_object_dispose(&v61, 8);
LABEL_46:

  return v17;
}

void __68__MKFCKEventTrigger_Presence___decodeEventPresence_trigger_context___block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  id v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  id v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  NSObject *v17;
  void *v18;
  uint64_t v19;
  int v20;
  void *v21;
  __int16 v22;
  uint64_t v23;
  __int16 v24;
  id v25;
  __int16 v26;
  uint64_t v27;
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  v6 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v7 = v6;
  else
    v7 = 0;
  v8 = v7;

  if (v8)
  {
    +[MKFCKEventTrigger localUserWithModelID:home:]((uint64_t)MKFCKEventTrigger, v8, *(void **)(a1 + 48));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9)
    {
      objc_msgSend(*(id *)(a1 + 56), "addObject:", v9);
    }
    else
    {
      v15 = (void *)MEMORY[0x227676638]();
      v16 = *(id *)(a1 + 32);
      HMFGetOSLogHandle();
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = *(_QWORD *)(a1 + 40);
        v20 = 138544130;
        v21 = v18;
        v22 = 2160;
        v23 = 1752392040;
        v24 = 2112;
        v25 = v8;
        v26 = 2112;
        v27 = v19;
        _os_log_impl(&dword_2218F0000, v17, OS_LOG_TYPE_ERROR, "%{public}@Could not find user '%{mask.hash}@' matching event: %@", (uint8_t *)&v20, 0x2Au);

      }
      objc_autoreleasePoolPop(v15);
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = 0;
      *a4 = 1;
    }

  }
  else
  {
    v10 = (void *)MEMORY[0x227676638]();
    v11 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = *(void **)(a1 + 40);
      v20 = 138543874;
      v21 = v13;
      v22 = 2114;
      v23 = (uint64_t)CFSTR("TEPu");
      v24 = 2112;
      v25 = v14;
      _os_log_impl(&dword_2218F0000, v12, OS_LOG_TYPE_ERROR, "%{public}@Failed to decode '%{public}@' in event: %@", (uint8_t *)&v20, 0x20u);

    }
    objc_autoreleasePoolPop(v10);
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = 0;
    *a4 = 1;
  }

}

void __77__MKFCKEventTrigger_Presence___decodeGuestsFromPresenceEventDictionary_home___block_invoke(uint64_t a1, void *a2, uint64_t (*a3)(uint64_t result, uint64_t a2), _BYTE *a4)
{
  id v7;
  void *v8;
  id v9;
  void *v10;
  id v11;
  id v12;
  void *v13;
  id v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  id v21;
  NSObject *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  id v26;
  NSObject *v27;
  void *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  void (*v32)(uint64_t, void *, _BYTE *);
  void *v33;
  id v34;
  _BYTE *v35;
  _BYTE buf[24];
  uint64_t (*v37)(uint64_t, uint64_t);
  __int128 v38;
  uint64_t v39;

  v39 = *MEMORY[0x24BDAC8D0];
  v7 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v8 = v7;
  else
    v8 = 0;
  v9 = v8;

  if (v9)
  {
    v10 = *(void **)(a1 + 48);
    v11 = v9;
    v12 = v10;
    objc_opt_self();
    *(_QWORD *)buf = 0;
    *(_QWORD *)&buf[8] = buf;
    *(_QWORD *)&buf[16] = 0x3032000000;
    v37 = __Block_byref_object_copy__175811;
    *(_QWORD *)&v38 = __Block_byref_object_dispose__175812;
    *((_QWORD *)&v38 + 1) = 0;
    objc_msgSend(v12, "guests");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = MEMORY[0x24BDAC760];
    v31 = 3221225472;
    v32 = __57__MKFCKEventTrigger_Helpers__localGuestWithModelID_home___block_invoke;
    v33 = &unk_24E78CE28;
    v14 = v11;
    v34 = v14;
    v35 = buf;
    objc_msgSend(v13, "hmf_enumerateWithAutoreleasePoolUsingBlock:", &v30);

    v15 = *(id *)(*(_QWORD *)&buf[8] + 40);
    _Block_object_dispose(buf, 8);

    if (v15)
    {
      objc_msgSend(*(id *)(a1 + 56), "addObject:", v15, v30, v31, v32, v33);
    }
    else
    {
      v25 = (void *)MEMORY[0x227676638](v16, v17, v18, v19);
      v26 = *(id *)(a1 + 32);
      HMFGetOSLogHandle();
      v27 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        v29 = *(_QWORD *)(a1 + 40);
        *(_DWORD *)buf = 138544130;
        *(_QWORD *)&buf[4] = v28;
        *(_WORD *)&buf[12] = 2160;
        *(_QWORD *)&buf[14] = 1752392040;
        *(_WORD *)&buf[22] = 2112;
        v37 = (uint64_t (*)(uint64_t, uint64_t))v14;
        LOWORD(v38) = 2112;
        *(_QWORD *)((char *)&v38 + 2) = v29;
        _os_log_impl(&dword_2218F0000, v27, OS_LOG_TYPE_ERROR, "%{public}@Could not find guest '%{mask.hash}@' matching event: %@", buf, 0x2Au);

      }
      objc_autoreleasePoolPop(v25);
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = 0;
      *a4 = 1;
    }

  }
  else
  {
    v20 = (void *)MEMORY[0x227676638]();
    v21 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = *(_QWORD *)(a1 + 40);
      *(_DWORD *)buf = 138544130;
      *(_QWORD *)&buf[4] = v23;
      *(_WORD *)&buf[12] = 2114;
      *(_QWORD *)&buf[14] = CFSTR("TEPg");
      *(_WORD *)&buf[22] = 2048;
      v37 = a3;
      LOWORD(v38) = 2112;
      *(_QWORD *)((char *)&v38 + 2) = v24;
      _os_log_impl(&dword_2218F0000, v22, OS_LOG_TYPE_ERROR, "%{public}@Failed to decode '%{public}@'[%tu] in event: %@", buf, 0x2Au);

    }
    objc_autoreleasePoolPop(v20);
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = 0;
    *a4 = 1;
  }

}

- (_MKFLocationEvent)_decodeEventLocation:(void *)a3 trigger:(void *)a4 context:
{
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  _MKFLocationEvent *v17;
  void *v18;
  void *v19;
  char v20;
  void *v21;
  char v22;
  void *v23;
  void *v24;
  id v25;
  NSObject *v26;
  void *v27;
  void *v28;
  id v29;
  NSObject *v30;
  void *v31;
  void *v32;
  void *v33;
  id v34;
  NSObject *v35;
  void *v36;
  void *v37;
  void *v38;
  id v39;
  NSObject *v40;
  id v41;
  void *v42;
  void *v44;
  id v45;
  id v46;
  id v47;
  void *v48;
  id v49;
  char v50;
  uint8_t buf[4];
  void *v52;
  __int16 v53;
  uint64_t v54;
  __int16 v55;
  id v56;
  __int16 v57;
  id v58;
  uint64_t v59;

  v59 = *MEMORY[0x24BDAC8D0];
  v7 = a2;
  v8 = a3;
  v9 = a4;
  if (!a1)
  {
    v17 = 0;
    goto LABEL_27;
  }
  v50 = 1;
  -[MKFCKEventTrigger _decodeUUIDForKey:dictionary:success:](a1, CFSTR("TEm"), v7, &v50);
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  -[MKFCKEventTrigger _decodeDataForKey:dictionary:success:](a1, CFSTR("TELl"), v7, &v50);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v49 = 0;
  objc_msgSend(MEMORY[0x24BDD1620], "unarchivedObjectOfClass:fromData:error:", objc_opt_class(), v10, &v49);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v47 = v49;
  if (!v11)
  {
    v24 = (void *)MEMORY[0x227676638]();
    v25 = a1;
    HMFGetOSLogHandle();
    v26 = objc_claimAutoreleasedReturnValue();
    v23 = v47;
    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v52 = v27;
      v53 = 2114;
      v54 = (uint64_t)v47;
      _os_log_impl(&dword_2218F0000, v26, OS_LOG_TYPE_ERROR, "%{public}@Failed to decode region: %{public}@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v24);
    v17 = 0;
    goto LABEL_26;
  }
  v46 = v9;
  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("TELu"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v13 = v12;
  else
    v13 = 0;
  v14 = v13;

  if (!v14)
  {
    v28 = (void *)MEMORY[0x227676638]();
    v29 = a1;
    HMFGetOSLogHandle();
    v30 = objc_claimAutoreleasedReturnValue();
    v45 = v8;
    if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v52 = v31;
      v53 = 2114;
      v54 = (uint64_t)CFSTR("TELu");
      v55 = 2112;
      v56 = v7;
      _os_log_impl(&dword_2218F0000, v30, OS_LOG_TYPE_ERROR, "%{public}@Failed to decode '%{public}@' in event: %@", buf, 0x20u);

      v8 = v45;
    }

    objc_autoreleasePoolPop(v28);
    objc_msgSend(v8, "home");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "owner");
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    v33 = (void *)MEMORY[0x227676638]();
    v34 = v29;
    HMFGetOSLogHandle();
    v35 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v35, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "modelID");
      v44 = v33;
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v52 = v36;
      v53 = 2160;
      v54 = 1752392040;
      v55 = 2112;
      v56 = v37;
      _os_log_impl(&dword_2218F0000, v35, OS_LOG_TYPE_INFO, "%{public}@(Import) : FixUP: No user found for the MKFLocationEvent.user. Assigning owner of the home as owner of this location event: '%{mask.hash}@'", buf, 0x20u);

      v33 = v44;
      v8 = v45;
    }

    objc_autoreleasePoolPop(v33);
    if (v16)
      goto LABEL_8;
LABEL_22:
    v38 = (void *)MEMORY[0x227676638]();
    v39 = a1;
    HMFGetOSLogHandle();
    v40 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v41 = v8;
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544130;
      v52 = v42;
      v53 = 2160;
      v54 = 1752392040;
      v55 = 2112;
      v56 = v14;
      v57 = 2112;
      v58 = v7;
      _os_log_impl(&dword_2218F0000, v40, OS_LOG_TYPE_ERROR, "%{public}@Could not find user '%{mask.hash}@' matching event: %@", buf, 0x2Au);

      v8 = v41;
    }

    objc_autoreleasePoolPop(v38);
    v17 = 0;
    v23 = v47;
    goto LABEL_25;
  }
  objc_msgSend(v8, "home");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  +[MKFCKEventTrigger localUserWithModelID:home:]((uint64_t)MKFCKEventTrigger, v14, v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v16)
    goto LABEL_22;
LABEL_8:
  +[_MKFModel modelWithModelID:context:](_MKFLocationEvent, "modelWithModelID:context:", v48, v46);
  v17 = (_MKFLocationEvent *)objc_claimAutoreleasedReturnValue();
  if (!v17)
  {
    v17 = -[_MKFLocationEvent initWithContext:]([_MKFLocationEvent alloc], "initWithContext:", v46);
    -[_MKFLocationEvent setModelID:](v17, "setModelID:", v48);
    objc_msgSend(a1, "writerTimestamp");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[_MKFLocationEvent setWriterTimestamp:](v17, "setWriterTimestamp:", v18);

    -[_MKFLocationEvent setUser:](v17, "setUser:", v16);
  }
  -[_MKFLocationEvent region](v17, "region");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = HMFEqualObjects();

  if ((v20 & 1) == 0)
    -[_MKFLocationEvent setRegion:](v17, "setRegion:", v11);
  -[_MKFLocationEvent user](v17, "user");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = HMFEqualObjects();

  v23 = v47;
  if ((v22 & 1) == 0)
    -[_MKFLocationEvent setUser:](v17, "setUser:", v16);
LABEL_25:

  v9 = v46;
LABEL_26:

LABEL_27:
  return v17;
}

+ (id)fetchRequest
{
  return (id)objc_msgSend(MEMORY[0x24BDBB678], "fetchRequestWithEntityName:", CFSTR("MKFCKEventTrigger"));
}

@end
