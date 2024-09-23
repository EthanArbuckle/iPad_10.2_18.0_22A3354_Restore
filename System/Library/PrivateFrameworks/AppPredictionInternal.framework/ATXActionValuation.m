@implementation ATXActionValuation

- (ATXActionValuation)init
{
  void *v3;
  ATXActionValuation *v4;

  +[ATXIntentMetadataCache sharedInstance](ATXIntentMetadataCache, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[ATXActionValuation initWithIntentCache:](self, "initWithIntentCache:", v3);

  return v4;
}

- (ATXActionValuation)initWithIntentCache:(id)a3
{
  id v5;
  ATXActionValuation *v6;
  ATXActionValuation *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)ATXActionValuation;
  v6 = -[ATXActionValuation init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_intentCache, a3);

  return v7;
}

- (BOOL)shouldPredictSendMessageIntent:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  char v9;
  BOOL v10;

  v3 = a3;
  +[_ATXActionUtils recipientFromMessageIntent:](_ATXActionUtils, "recipientFromMessageIntent:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    objc_msgSend(v3, "content");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v5)
    {
      v10 = 1;
LABEL_11:

      goto LABEL_12;
    }
    +[_ATXDataStore sharedInstance](_ATXDataStore, "sharedInstance");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "lastMessageToRecipient:", v4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    v8 = (void *)objc_opt_new();
    if (+[_ATXActionUtils shouldPredictRecipient:withDate:andRecipientDate:](_ATXActionUtils, "shouldPredictRecipient:withDate:andRecipientDate:", v4, v8, v7))
    {
      v9 = objc_msgSend(v5, "isEqualToString:", &stru_1E82FDC98);

      if ((v9 & 1) == 0)
      {
        v10 = 1;
LABEL_10:

        goto LABEL_11;
      }
    }
    else
    {

    }
    v10 = 0;
    goto LABEL_10;
  }
  v10 = 0;
LABEL_12:

  return v10;
}

- (BOOL)shouldPredictCreateEventIntent:(id)a3
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  BOOL v6;

  objc_msgSend(a3, "atx_nonNilParametersByName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKey:", CFSTR("startDate"));
  v4 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKey:", CFSTR("endDate"));
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = (v4 | v5) == 0;

  return v6;
}

- (id)getCurrentLocation
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0D80DC8], "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "getCurrentLocation");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (BOOL)shouldPredictRequestRideIntent:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  double v8;
  double v9;
  void *v10;
  BOOL v11;

  objc_msgSend(a3, "dropOffLocation");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "location");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[ATXActionValuation getCurrentLocation](self, "getCurrentLocation");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v6;
    if (v6)
    {
      objc_msgSend(v6, "distanceFromLocation:", v5);
      v9 = v8;
      +[_ATXGlobals sharedInstance](_ATXGlobals, "sharedInstance");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = v9 >= (double)(int)objc_msgSend(v10, "minDistanceToDropOffLocationInMetersForRequestRideIntent")
         && v9 <= (double)(int)objc_msgSend(v10, "maxDistanceToDropOffLocationInMetersForRequestRideIntent");

    }
    else
    {
      v11 = 0;
    }
  }
  else
  {
    v11 = 1;
  }

  return v11;
}

- (BOOL)shouldPredictIntent:(id)a3
{
  id v4;
  BOOL v5;
  BOOL v6;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = -[ATXActionValuation shouldPredictSendMessageIntent:](self, "shouldPredictSendMessageIntent:", v4);
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = -[ATXActionValuation shouldPredictRequestRideIntent:](self, "shouldPredictRequestRideIntent:", v4);
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        v6 = 1;
        goto LABEL_8;
      }
      v5 = -[ATXActionValuation shouldPredictCreateEventIntent:](self, "shouldPredictCreateEventIntent:", v4);
    }
  }
  v6 = v5;
LABEL_8:

  return v6;
}

- (void)setFeatureValuesAndFilterPredictableActions:(id)a3 actionStatistics:(id)a4
{
  void *v4;
  void *v5;
  _QWORD *v6;
  id v7;
  id v8;
  void *v9;
  unint64_t v10;
  __int128 v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  ATXMinimalSlotResolutionParameters *v16;
  void *v17;
  double *v18;
  double v19;
  NSObject *v20;
  NSObject *v21;
  void *v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;
  double v40;
  double v41;
  double v42;
  double v43;
  double v44;
  double v45;
  double v46;
  double v47;
  double v48;
  double v49;
  double v50;
  double v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  uint64_t v56;
  void *v57;
  unsigned int v58;
  id v59;
  __int128 v60;
  _QWORD *v61;
  ATXMinimalSlotResolutionParameters *v62;
  void *v63;
  id v64;
  id v65;
  _BYTE v66[3282];
  uint8_t v67;
  _BYTE v68[15];
  uint8_t v69;
  _BYTE v70[15];
  id buf[414];

  MEMORY[0x1E0C80A78](self, a2);
  v5 = v4;
  v61 = v6;
  buf[412] = *(id *)MEMORY[0x1E0C80C00];
  v64 = v7;
  v8 = v5;
  v9 = (void *)objc_opt_new();
  v10 = 0;
  *(_QWORD *)&v11 = 138412290;
  v60 = v11;
  while (v10 < objc_msgSend(v64, "count", v60))
  {
    v12 = (void *)MEMORY[0x1CAA48B6C]();
    objc_msgSend(v64, "objectAtIndexedSubscript:", v10);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "scoredAction");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "predictedItem");
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v15)
    {
      __atxlog_handle_default();
      v20 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
        -[ATXActionValuation setFeatureValuesAndFilterPredictableActions:actionStatistics:].cold.1(&v69, v70, v20);
      goto LABEL_14;
    }
    if ((objc_msgSend(v15, "hasActionTitle") & 1) == 0)
    {
      __atxlog_handle_default();
      v20 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
        -[ATXActionValuation setFeatureValuesAndFilterPredictableActions:actionStatistics:].cold.2(&v67, v68, v20);
LABEL_14:

      objc_msgSend(v9, "addIndex:", v10);
      goto LABEL_36;
    }
    objc_msgSend(v15, "intent");
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    if (v63 && (objc_msgSend(v61, "shouldPredictIntent:", v63) & 1) == 0)
    {
      __atxlog_handle_default();
      v21 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
      {
        objc_msgSend(v63, "_className");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        LODWORD(buf[0]) = v60;
        *(id *)((char *)buf + 4) = v22;
        _os_log_impl(&dword_1C9A3B000, v21, OS_LOG_TYPE_INFO, "Removed intent of class %@ because of special logic for the intent class", (uint8_t *)buf, 0xCu);

      }
      objc_msgSend(v9, "addIndex:", v10);
      goto LABEL_35;
    }
    v16 = [ATXMinimalSlotResolutionParameters alloc];
    objc_msgSend(v13, "slotSet");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v62 = -[ATXMinimalSlotResolutionParameters initWithAction:slots:](v16, "initWithAction:slots:", v15, v17);

    objc_msgSend(*((id *)v8 + 1), "objectForKeyedSubscript:", v62);
    v18 = (double *)objc_claimAutoreleasedReturnValue();
    if (v13)
    {
      objc_msgSend(v13, "predictionItem");
      if (!v18)
        goto LABEL_20;
LABEL_19:
      ATXProbability(v18[29], *((double *)v8 + 2));
      ATXSetInput((uint64_t)buf, 0x13CuLL, v23);
      ATXProbability(v18[46], *((double *)v8 + 3));
      ATXSetInput((uint64_t)buf, 0x13DuLL, v24);
      ATXProbability(v18[47], *((double *)v8 + 4));
      ATXSetInput((uint64_t)buf, 0x13EuLL, v25);
      ATXProbability(v18[48], *((double *)v8 + 5));
      ATXSetInput((uint64_t)buf, 0x13FuLL, v26);
      ATXProbability(v18[49], *((double *)v8 + 6));
      ATXSetInput((uint64_t)buf, 0x140uLL, v27);
      ATXProbability(v18[50], *((double *)v8 + 7));
      ATXSetInput((uint64_t)buf, 0x141uLL, v28);
      ATXProbability(v18[51], *((double *)v8 + 8));
      ATXSetInput((uint64_t)buf, 0x142uLL, v29);
      ATXProbability(v18[52], *((double *)v8 + 9));
      ATXSetInput((uint64_t)buf, 0x143uLL, v30);
      ATXProbability(v18[53], *((double *)v8 + 21));
      ATXSetInput((uint64_t)buf, 0x144uLL, v31);
      ATXProbability(v18[54], *((double *)v8 + 10));
      ATXSetInput((uint64_t)buf, 0x145uLL, v32);
      ATXProbability(v18[55], *((double *)v8 + 11));
      ATXSetInput((uint64_t)buf, 0x146uLL, v33);
      ATXProbability(v18[56], *((double *)v8 + 12));
      ATXSetInput((uint64_t)buf, 0x147uLL, v34);
      ATXProbability(v18[61], *((double *)v8 + 17));
      ATXSetInput((uint64_t)buf, 0x148uLL, v35);
      ATXProbability(v18[62], *((double *)v8 + 18));
      ATXSetInput((uint64_t)buf, 0x149uLL, v36);
      ATXProbability(v18[63], *((double *)v8 + 19));
      ATXSetInput((uint64_t)buf, 0x14AuLL, v37);
      ATXProbability(v18[64], *((double *)v8 + 20));
      ATXSetInput((uint64_t)buf, 0x14BuLL, v38);
      ATXProbability(v18[58], *((double *)v8 + 14));
      ATXSetInput((uint64_t)buf, 0x14CuLL, v39);
      ATXProbability(v18[57], *((double *)v8 + 13));
      ATXSetInput((uint64_t)buf, 0x14DuLL, v40);
      ATXProbability(v18[59], *((double *)v8 + 15));
      ATXSetInput((uint64_t)buf, 0x14EuLL, v41);
      ATXProbability(v18[60], *((double *)v8 + 16));
      ATXSetInput((uint64_t)buf, 0x14FuLL, v42);
      ATXProbability(v18[65], *((double *)v8 + 22));
      ATXSetInput((uint64_t)buf, 0x150uLL, v43);
      ATXSetInput((uint64_t)buf, 0x151uLL, *((double *)v8 + 23));
      ATXSetInput((uint64_t)buf, 0x152uLL, *((double *)v8 + 24));
      ATXSetInput((uint64_t)buf, 0x153uLL, *((double *)v8 + 25));
      ATXSetInput((uint64_t)buf, 0x154uLL, *((double *)v8 + 26));
      ATXSetInput((uint64_t)buf, 0x155uLL, *((double *)v8 + 27));
      ATXSetInput((uint64_t)buf, 0x156uLL, *((double *)v8 + 28));
      ATXSetInput((uint64_t)buf, 0x15BuLL, *((double *)v8 + 29));
      ATXSetInput((uint64_t)buf, 0x15CuLL, *((double *)v8 + 30));
      ATXSetInput((uint64_t)buf, 0x15DuLL, *((double *)v8 + 31));
      ATXSetInput((uint64_t)buf, 0x15EuLL, *((double *)v8 + 32));
      ATXSetInput((uint64_t)buf, 0x158uLL, *((double *)v8 + 33));
      ATXSetInput((uint64_t)buf, 0x157uLL, *((double *)v8 + 34));
      ATXSetInput((uint64_t)buf, 0x159uLL, *((double *)v8 + 35));
      ATXSetInput((uint64_t)buf, 0x15AuLL, *((double *)v8 + 36));
      ATXSetInput((uint64_t)buf, 0x15FuLL, *((double *)v8 + 37));
      ATXSetInput((uint64_t)buf, 0x160uLL, *((double *)v8 + 38));
      ATXSetInput((uint64_t)buf, 0x163uLL, *((double *)v8 + 39));
      ATXSetInput((uint64_t)buf, 0x164uLL, *((double *)v8 + 40));
      ATXSetInput((uint64_t)buf, 0x165uLL, *((double *)v8 + 41));
      ATXSetInput((uint64_t)buf, 0x134uLL, *((double *)v8 + 42));
      ATXSetInput((uint64_t)buf, 0x135uLL, *((double *)v8 + 43));
      ATXSetInput((uint64_t)buf, 0x136uLL, *((double *)v8 + 47));
      ATXSetInput((uint64_t)buf, 0x137uLL, *((double *)v8 + 48));
      ATXSetInput((uint64_t)buf, 0x138uLL, *((double *)v8 + 49));
      *(float *)&v44 = ATXSetInput((uint64_t)buf, 0x139uLL, *((double *)v8 + 50));
      v45 = ATXRatio(*((double *)v8 + 45) + *((double *)v8 + 44), (double)(unint64_t)objc_msgSend(*((id *)v8 + 46), "count", v44));
      *(float *)&v46 = ATXSetInput((uint64_t)buf, 0x13AuLL, v45);
      v47 = ATXRatio(*((double *)v8 + 44), (double)(unint64_t)objc_msgSend(*((id *)v8 + 46), "count", v46));
      ATXSetInput((uint64_t)buf, 0x13BuLL, v47);
      ATXSetInput((uint64_t)buf, 0x1A6uLL, *((double *)v8 + 51));
      ATXSetInput((uint64_t)buf, 0x1A8uLL, *((double *)v8 + 52));
      ATXSetInput((uint64_t)buf, 0x1AAuLL, *((double *)v8 + 53));
      ATXSetInput((uint64_t)buf, 0x1ACuLL, *((double *)v8 + 54));
      ATXSetInput((uint64_t)buf, 0x1AEuLL, *((double *)v8 + 55));
      ATXSetInput((uint64_t)buf, 0x1B0uLL, *((double *)v8 + 56));
      ATXSetInput((uint64_t)buf, 0x1B2uLL, *((double *)v8 + 57));
      ATXSetInput((uint64_t)buf, 0x1B4uLL, *((double *)v8 + 58));
      ATXSetInput((uint64_t)buf, 0x1B6uLL, *((double *)v8 + 59));
      ATXSetInput((uint64_t)buf, 0x1B8uLL, *((double *)v8 + 60));
      ATXSetInput((uint64_t)buf, 0x1BAuLL, *((double *)v8 + 61));
      ATXSetInput((uint64_t)buf, 0x1BCuLL, *((double *)v8 + 62));
      ATXSetInput((uint64_t)buf, 0x22AuLL, *((double *)v8 + 63));
      ATXSetInput((uint64_t)buf, 0x22DuLL, *((double *)v8 + 64));
      ATXSetInput((uint64_t)buf, 0x230uLL, *((double *)v8 + 65));
      ATXSetInput((uint64_t)buf, 0x233uLL, *((double *)v8 + 66));
      ATXSetInput((uint64_t)buf, 0x236uLL, *((double *)v8 + 67));
      ATXSetInput((uint64_t)buf, 0x239uLL, *((double *)v8 + 68));
      ATXSetInput((uint64_t)buf, 0x23CuLL, *((double *)v8 + 69));
      ATXSetInput((uint64_t)buf, 0x23FuLL, *((double *)v8 + 70));
      ATXSetInput((uint64_t)buf, 0x242uLL, *((double *)v8 + 71));
      ATXSetInput((uint64_t)buf, 0x245uLL, *((double *)v8 + 72));
      ATXSetInput((uint64_t)buf, 0x248uLL, *((double *)v8 + 73));
      ATXSetInput((uint64_t)buf, 0x24BuLL, *((double *)v8 + 74));
      ATXSetInput((uint64_t)buf, 0x303uLL, *((double *)v8 + 75));
      ATXSetInput((uint64_t)buf, 0x306uLL, *((double *)v8 + 77));
      ATXSetInput((uint64_t)buf, 0x309uLL, *((double *)v8 + 79));
      ATXSetInput((uint64_t)buf, 0x30CuLL, *((double *)v8 + 81));
      ATXSetInput((uint64_t)buf, 0x30FuLL, *((double *)v8 + 83));
      ATXSetInput((uint64_t)buf, 0x312uLL, *((double *)v8 + 85));
      ATXSetInput((uint64_t)buf, 0x315uLL, *((double *)v8 + 76));
      ATXSetInput((uint64_t)buf, 0x318uLL, *((double *)v8 + 78));
      ATXSetInput((uint64_t)buf, 0x31BuLL, *((double *)v8 + 80));
      ATXSetInput((uint64_t)buf, 0x31EuLL, *((double *)v8 + 82));
      ATXSetInput((uint64_t)buf, 0x321uLL, *((double *)v8 + 84));
      *(float *)&v19 = ATXSetInput((uint64_t)buf, 0x324uLL, *((double *)v8 + 86));
      goto LABEL_20;
    }
    bzero(buf, 0xCE0uLL);
    if (v18)
      goto LABEL_19;
LABEL_20:
    switch(objc_msgSend(v15, "actionType", v19))
    {
      case 0:
        v50 = 0.0;
        ATXSetInput((uint64_t)buf, 0x17AuLL, 1.0);
        goto LABEL_24;
      case 1:
      case 5:
        ATXSetInput((uint64_t)buf, 0x17AuLL, 0.0);
        v49 = 1.0;
        ATXSetInput((uint64_t)buf, 0x17BuLL, 0.0);
        goto LABEL_25;
      case 2:
        v50 = 1.0;
        ATXSetInput((uint64_t)buf, 0x17AuLL, 0.0);
LABEL_24:
        v49 = 0.0;
        ATXSetInput((uint64_t)buf, 0x17BuLL, v50);
LABEL_25:
        *(float *)&v48 = ATXSetInput((uint64_t)buf, 0x17CuLL, v49);
        break;
      default:
        break;
    }
    *(float *)&v51 = ATXSetInput((uint64_t)buf, 0x176uLL, (double)objc_msgSend(v15, "isFutureMedia", v48));
    objc_msgSend(v15, "intent", v51);
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    ATXSetInput((uint64_t)buf, 0x87uLL, (double)objc_msgSend(v52, "_intentCategory"));

    v53 = (void *)MEMORY[0x1CAA48B6C]();
    objc_msgSend(v15, "intent");
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    if (v54)
    {
      v55 = (void *)v61[1];
      objc_msgSend(v15, "intent");
      v56 = objc_claimAutoreleasedReturnValue();
      v57 = v55;
      v5 = (void *)v56;
      v58 = objc_msgSend(v57, "supportsBackgroundExecutionForIntent:");
    }
    else
    {
      v58 = 0;
    }
    ATXSetInput((uint64_t)buf, 0x177uLL, (double)v58);
    if (v54)

    objc_autoreleasePoolPop(v53);
    v59 = buf[0];
    v65 = v59;
    memcpy(v66, &buf[1], sizeof(v66));
    if (v13)
      objc_msgSend(v13, "setPredictionItem:", &v65);
    else

LABEL_35:
LABEL_36:

    objc_autoreleasePoolPop(v12);
    ++v10;
  }
  objc_msgSend(v64, "removeObjectsAtIndexes:", v9);

}

- (void)scoreActions:(id)a3 scoreLogger:(id)a4 consumerSubType:(unsigned __int8)a5
{
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  void *v11;
  unint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  ATXMinimalSlotResolutionParameters *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  void *v28;
  double v29;
  double v30;
  id v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  Class v36;
  id v37;
  void *v38;
  id v39;
  double v40;
  float v41;
  void *v42;
  double v43;
  id v44;
  uint64_t v45;
  id v46;
  void *v47;
  void *context;
  ATXMinimalSlotResolutionParameters *v49;
  id v50;
  id v51;
  _BYTE v52[3282];
  id location;
  _QWORD v54[412];

  MEMORY[0x1E0C80A78](self, a2);
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v50 = v8;
  +[ATXScoreInterpreterCache sharedInstance](ATXScoreInterpreterCache, "sharedInstance");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "scoreInterpreterForConsumerSubType:", v6);
  v47 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = 0;
  v45 = *MEMORY[0x1E0CF9510];
  v46 = v10;
  while (v12 < objc_msgSend(v10, "count"))
  {
    v13 = MEMORY[0x1CAA48B6C]();
    objc_msgSend(v10, "objectAtIndexedSubscript:", v12);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "scoredAction");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "predictedItem");
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    v17 = [ATXMinimalSlotResolutionParameters alloc];
    objc_msgSend(v14, "slotSet");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    context = (void *)v13;
    v49 = -[ATXMinimalSlotResolutionParameters initWithAction:slots:](v17, "initWithAction:slots:", v16, v18);

    objc_msgSend(v16, "actionKey");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v50)
      goto LABEL_9;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v20 = (void *)MEMORY[0x1E0CB3940];
      objc_msgSend(v16, "actionKey");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "slotSet");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "description");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "description");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "stringWithFormat:", CFSTR("ActionKey: %@\nSlotSet: %@\n%@"), v21, v23, v24);
      v25 = objc_claimAutoreleasedReturnValue();

      v19 = (void *)v25;
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
        goto LABEL_9;
      v26 = (void *)MEMORY[0x1E0CB3940];
      objc_msgSend(v16, "actionKey");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "stringWithFormat:", CFSTR("%@:%tu"), v21, -[ATXMinimalSlotResolutionParameters hash](v49, "hash"));
      v22 = v19;
      v19 = (void *)objc_claimAutoreleasedReturnValue();
    }

LABEL_9:
    if (v14)
      objc_msgSend(v14, "predictionItem");
    else
      bzero(&location, 0xCE0uLL);
    objc_storeStrong(&location, v19);
    v54[0] = -[ATXMinimalSlotResolutionParameters hash](v49, "hash");
    +[_ATXAppPredictor sharedInstance](_ATXAppPredictor, "sharedInstance");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "setupScoreLogger:forConsumerSubType:", v50, v6);

    +[_ATXAppPredictor sharedInstance](_ATXAppPredictor, "sharedInstance");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "_predictionScoreAndUpdateConfidenceForItem:interpreter:consumerSubType:scoreLogger:intentType:", &location, v47, v6, v50, 0);
    v30 = v29;

    if (objc_msgSend(MEMORY[0x1E0D81588], "isInternalBuild"))
    {
      v31 = objc_alloc(MEMORY[0x1E0CB3940]);
      objc_msgSend(v16, "bundleId");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      v33 = (void *)objc_msgSend(v31, "initWithFormat:", CFSTR("ActionValuationScoreOverride-%@"), v32);

      v34 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99EA0]), "initWithSuiteName:", v45);
      objc_msgSend(v34, "objectForKey:", v33);
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      v36 = NSClassFromString(CFSTR("NSNumber"));
      v37 = v35;
      if (v36)
      {
        if ((objc_opt_isKindOfClass() & 1) != 0)
          v38 = v37;
        else
          v38 = 0;
      }
      else
      {
        v38 = 0;
      }
      v39 = v38;

      if (v39)
      {
        objc_msgSend(v39, "doubleValue");
        v30 = v40;
      }

    }
    v41 = v30;
    *((float *)&v54[409] + 1) = v41;
    objc_msgSend(v14, "scoredAction");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    *(float *)&v43 = v41;
    objc_msgSend(v42, "setScore:", v43);

    v44 = location;
    v51 = v44;
    memcpy(v52, v54, sizeof(v52));
    if (v14)
      objc_msgSend(v14, "setPredictionItem:", &v51);
    else

    if (v50)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        objc_msgSend(v50, "storeMetaDataFromActionContainerForKey:actionContainer:", v19, v14);
    }

    v10 = v46;
    objc_autoreleasePoolPop(context);
    ++v12;
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_intentCache, 0);
}

- (void)setFeatureValuesAndFilterPredictableActions:(NSObject *)a3 actionStatistics:.cold.1(uint8_t *a1, _BYTE *a2, NSObject *a3)
{
  *a1 = 0;
  *a2 = 0;
  OUTLINED_FUNCTION_0_14(&dword_1C9A3B000, (int)a2, a3, "Action not found during Action Valuation", a1);
}

- (void)setFeatureValuesAndFilterPredictableActions:(NSObject *)a3 actionStatistics:.cold.2(uint8_t *a1, _BYTE *a2, NSObject *a3)
{
  *a1 = 0;
  *a2 = 0;
  OUTLINED_FUNCTION_0_14(&dword_1C9A3B000, (int)a2, a3, "Action without title found during Action Valuation", a1);
}

@end
