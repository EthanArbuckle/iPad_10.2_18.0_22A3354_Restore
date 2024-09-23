@implementation ATVModel

- (ATVModel)init
{
  ATVModel *v2;
  ATVModel *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
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
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  id v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  NSDictionary *atvLUT;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  ATVModel *v51;
  void *v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  objc_super v57;
  _BYTE v58[128];
  void *v59;
  _QWORD v60[6];
  _QWORD v61[2];
  _QWORD v62[7];
  _QWORD v63[12];
  _QWORD v64[6];

  v64[4] = *MEMORY[0x1E0C80C00];
  v57.receiver = self;
  v57.super_class = (Class)ATVModel;
  v2 = -[ATVModel init](&v57, sel_init);
  v3 = v2;
  if (v2)
  {
    v51 = v2;
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", 20);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", 0);
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    +[HAPBTLETuple makeTupleWithATVState:MaxHAPConnections:](HAPBTLETuple, "makeTupleWithATVState:MaxHAPConnections:", 2, 3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v64[0] = v5;
    +[HAPBTLETuple makeTupleWithATVState:MaxHAPConnections:](HAPBTLETuple, "makeTupleWithATVState:MaxHAPConnections:", 66, 2);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v64[1] = v6;
    +[HAPBTLETuple makeTupleWithATVState:MaxHAPConnections:](HAPBTLETuple, "makeTupleWithATVState:MaxHAPConnections:", 4, 2);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v64[2] = v7;
    +[HAPBTLETuple makeTupleWithATVState:MaxHAPConnections:](HAPBTLETuple, "makeTupleWithATVState:MaxHAPConnections:", 68, 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v64[3] = v8;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v64, 4);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v52, "addObjectsFromArray:", v9);

    +[HAPBTLETuple makeTupleWithATVState:MaxHAPConnections:](HAPBTLETuple, "makeTupleWithATVState:MaxHAPConnections:", 258, 2);
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    v63[0] = v49;
    +[HAPBTLETuple makeTupleWithATVState:MaxHAPConnections:](HAPBTLETuple, "makeTupleWithATVState:MaxHAPConnections:", 514, 1);
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    v63[1] = v48;
    +[HAPBTLETuple makeTupleWithATVState:MaxHAPConnections:](HAPBTLETuple, "makeTupleWithATVState:MaxHAPConnections:", 1026, 1);
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    v63[2] = v47;
    +[HAPBTLETuple makeTupleWithATVState:MaxHAPConnections:](HAPBTLETuple, "makeTupleWithATVState:MaxHAPConnections:", 2050, 1);
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    v63[3] = v46;
    +[HAPBTLETuple makeTupleWithATVState:MaxHAPConnections:](HAPBTLETuple, "makeTupleWithATVState:MaxHAPConnections:", 322, 1);
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    v63[4] = v45;
    +[HAPBTLETuple makeTupleWithATVState:MaxHAPConnections:](HAPBTLETuple, "makeTupleWithATVState:MaxHAPConnections:", 578, 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v63[5] = v10;
    +[HAPBTLETuple makeTupleWithATVState:MaxHAPConnections:](HAPBTLETuple, "makeTupleWithATVState:MaxHAPConnections:", 1090, 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v63[6] = v11;
    +[HAPBTLETuple makeTupleWithATVState:MaxHAPConnections:](HAPBTLETuple, "makeTupleWithATVState:MaxHAPConnections:", 386, 1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v63[7] = v12;
    +[HAPBTLETuple makeTupleWithATVState:MaxHAPConnections:](HAPBTLETuple, "makeTupleWithATVState:MaxHAPConnections:", 450, 1);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v63[8] = v13;
    +[HAPBTLETuple makeTupleWithATVState:MaxHAPConnections:](HAPBTLETuple, "makeTupleWithATVState:MaxHAPConnections:", 260, 1);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v63[9] = v14;
    +[HAPBTLETuple makeTupleWithATVState:MaxHAPConnections:](HAPBTLETuple, "makeTupleWithATVState:MaxHAPConnections:", 516, 1);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v63[10] = v15;
    +[HAPBTLETuple makeTupleWithATVState:MaxHAPConnections:](HAPBTLETuple, "makeTupleWithATVState:MaxHAPConnections:", 324, 1);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v63[11] = v16;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v63, 12);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v52, "addObjectsFromArray:", v17);

    +[HAPBTLETuple makeTupleWithATVState:MaxHAPConnections:](HAPBTLETuple, "makeTupleWithATVState:MaxHAPConnections:", 10, 2);
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    v62[0] = v50;
    +[HAPBTLETuple makeTupleWithATVState:MaxHAPConnections:](HAPBTLETuple, "makeTupleWithATVState:MaxHAPConnections:", 18, 1);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v62[1] = v18;
    +[HAPBTLETuple makeTupleWithATVState:MaxHAPConnections:](HAPBTLETuple, "makeTupleWithATVState:MaxHAPConnections:", 74, 1);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v62[2] = v19;
    +[HAPBTLETuple makeTupleWithATVState:MaxHAPConnections:](HAPBTLETuple, "makeTupleWithATVState:MaxHAPConnections:", 82, 1);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v62[3] = v20;
    +[HAPBTLETuple makeTupleWithATVState:MaxHAPConnections:](HAPBTLETuple, "makeTupleWithATVState:MaxHAPConnections:", 138, 1);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v62[4] = v21;
    +[HAPBTLETuple makeTupleWithATVState:MaxHAPConnections:](HAPBTLETuple, "makeTupleWithATVState:MaxHAPConnections:", 146, 1);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v62[5] = v22;
    +[HAPBTLETuple makeTupleWithATVState:MaxHAPConnections:](HAPBTLETuple, "makeTupleWithATVState:MaxHAPConnections:", 202, 1);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v62[6] = v23;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v62, 7);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v52, "addObjectsFromArray:", v24);

    +[HAPBTLETuple makeTupleWithATVState:MaxHAPConnections:](HAPBTLETuple, "makeTupleWithATVState:MaxHAPConnections:", 130, 1);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v61[0] = v25;
    +[HAPBTLETuple makeTupleWithATVState:MaxHAPConnections:](HAPBTLETuple, "makeTupleWithATVState:MaxHAPConnections:", 194, 1);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v61[1] = v26;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v61, 2);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v52, "addObjectsFromArray:", v27);

    +[HAPBTLETuple makeTupleWithATVState:MaxHAPConnections:](HAPBTLETuple, "makeTupleWithATVState:MaxHAPConnections:", 4098, 1);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v60[0] = v28;
    +[HAPBTLETuple makeTupleWithATVState:MaxHAPConnections:](HAPBTLETuple, "makeTupleWithATVState:MaxHAPConnections:", 8194, 1);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v60[1] = v29;
    +[HAPBTLETuple makeTupleWithATVState:MaxHAPConnections:](HAPBTLETuple, "makeTupleWithATVState:MaxHAPConnections:", 16386, 1);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v60[2] = v30;
    +[HAPBTLETuple makeTupleWithATVState:MaxHAPConnections:](HAPBTLETuple, "makeTupleWithATVState:MaxHAPConnections:", 4162, 1);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v60[3] = v31;
    +[HAPBTLETuple makeTupleWithATVState:MaxHAPConnections:](HAPBTLETuple, "makeTupleWithATVState:MaxHAPConnections:", 8258, 1);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v60[4] = v32;
    +[HAPBTLETuple makeTupleWithATVState:MaxHAPConnections:](HAPBTLETuple, "makeTupleWithATVState:MaxHAPConnections:", 4100, 1);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v60[5] = v33;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v60, 6);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v52, "addObjectsFromArray:", v34);

    +[HAPBTLETuple makeTupleWithATVState:MaxHAPConnections:](HAPBTLETuple, "makeTupleWithATVState:MaxHAPConnections:", 1, 5);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    v59 = v35;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v59, 1);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v52, "addObjectsFromArray:", v36);

    v55 = 0u;
    v56 = 0u;
    v53 = 0u;
    v54 = 0u;
    v37 = v52;
    v38 = objc_msgSend(v37, "countByEnumeratingWithState:objects:count:", &v53, v58, 16);
    if (v38)
    {
      v39 = v38;
      v40 = *(_QWORD *)v54;
      do
      {
        v41 = 0;
        do
        {
          if (*(_QWORD *)v54 != v40)
            objc_enumerationMutation(v37);
          +[ATVModel addTuple:ToLUT:](ATVModel, "addTuple:ToLUT:", *(_QWORD *)(*((_QWORD *)&v53 + 1) + 8 * v41++), v4);
        }
        while (v39 != v41);
        v39 = objc_msgSend(v37, "countByEnumeratingWithState:objects:count:", &v53, v58, 16);
      }
      while (v39);
    }

    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithDictionary:", v4);
    v42 = objc_claimAutoreleasedReturnValue();
    v3 = v51;
    atvLUT = v51->_atvLUT;
    v51->_atvLUT = (NSDictionary *)v42;

  }
  return v3;
}

- (id)findTupleForATVState:(unint64_t)a3
{
  void *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  int v13;
  void *v14;
  __int16 v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v5 = (void *)MEMORY[0x1D17B7244](self, a2);
  HMFGetOSLogHandle();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    HMFGetLogIdentifier();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    +[HAPBTLETuple atvState2String:](HAPBTLETuple, "atvState2String:", a3);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = 138543618;
    v14 = v7;
    v15 = 2112;
    v16 = v8;
    _os_log_impl(&dword_1CCE01000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@[ATVModel] findTupleForState state %@\n", (uint8_t *)&v13, 0x16u);

  }
  objc_autoreleasePoolPop(v5);
  -[ATVModel atvLUT](self, "atvLUT");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a3);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "objectForKey:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (NSDictionary)atvLUT
{
  return (NSDictionary *)objc_getProperty(self, a2, 8, 1);
}

- (void)setAtvLUT:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 8);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_atvLUT, 0);
}

+ (void)addTuple:(id)a3 ToLUT:(id)a4
{
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a3;
  v5 = a4;
  if (v10)
  {
    if (objc_msgSend(v10, "atvState"))
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v10, "atvState"));
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setObject:forKey:", v10, v6);

      if ((int)objc_msgSend(v10, "maxHAPConnections") >= 1)
      {
        v7 = 0;
        do
        {
          +[HAPBTLETuple makeTupleWithATVState:MaxHAPConnections:](HAPBTLETuple, "makeTupleWithATVState:MaxHAPConnections:", hkConfig_20093[v7] | objc_msgSend(v10, "atvState"), objc_msgSend(v10, "maxHAPConnections"));
          v8 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v8, "atvState"));
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "setObject:forKey:", v8, v9);

          ++v7;
        }
        while (v7 < (int)objc_msgSend(v10, "maxHAPConnections"));
      }
    }
  }

}

+ (unint64_t)atvStateFromState:(BTStatus *)a3
{
  unint64_t leRemote;
  unint64_t v4;
  unint64_t a2dp;
  unint64_t btKB;

  leRemote = a3->leRemote;
  if (a3->leRemote)
  {
    if (leRemote == 2)
    {
      v4 = 4;
      goto LABEL_11;
    }
    if (leRemote != 1)
      return 0;
  }
  else
  {
    if (!a3->connectedDevices && a3->lowEnergyConnections == a3->hk)
    {
      v4 = 0;
      goto LABEL_11;
    }
    a3->leRemote = 1;
  }
  v4 = 2;
LABEL_11:
  a2dp = a3->a2dp;
  if (a2dp)
  {
    if (a2dp != 1)
      return 0;
    v4 |= 0x80uLL;
  }
  switch(a3->btGC)
  {
    case 0uLL:
      break;
    case 1uLL:
      v4 |= 0x100uLL;
      break;
    case 2uLL:
      v4 |= 0x200uLL;
      break;
    case 3uLL:
      v4 |= 0x400uLL;
      break;
    case 4uLL:
      v4 |= 0x800uLL;
      break;
    default:
      return 0;
  }
  btKB = a3->btKB;
  if (!btKB)
    goto LABEL_22;
  if (btKB != 1)
    return 0;
  v4 |= 0x40uLL;
LABEL_22:
  switch(a3->hk)
  {
    case 0uLL:
      break;
    case 1uLL:
      v4 |= 0x8000uLL;
      break;
    case 2uLL:
      v4 |= 0x10000uLL;
      break;
    case 3uLL:
      v4 |= 0x20000uLL;
      break;
    case 4uLL:
      v4 |= 0x40000uLL;
      break;
    case 5uLL:
      v4 |= 0x80000uLL;
      break;
    default:
      return 0;
  }
  switch(a3->leAcc)
  {
    case 0uLL:
      break;
    case 1uLL:
      v4 |= 8uLL;
      break;
    case 2uLL:
      v4 |= 0x10uLL;
      break;
    case 3uLL:
      v4 |= 0x20uLL;
      break;
    default:
      return 0;
  }
  switch(a3->eAcc)
  {
    case 0uLL:
      break;
    case 1uLL:
      v4 |= 0x1000uLL;
      break;
    case 2uLL:
      v4 |= 0x2000uLL;
      break;
    case 3uLL:
      v4 |= 0x4000uLL;
      break;
    default:
      return 0;
  }
  if (v4 <= 1)
    return 1;
  else
    return v4;
}

@end
