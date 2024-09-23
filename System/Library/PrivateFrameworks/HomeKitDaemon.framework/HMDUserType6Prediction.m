@implementation HMDUserType6Prediction

- (HMDUserType6Prediction)initWithAction:(unint64_t)a3 visitExit:(id)a4 predictedLocationOfInterest:(id)a5 predictedLocations:(id)a6
{
  id v11;
  id v12;
  id v13;
  HMDUserType6Prediction *v14;
  HMDUserType6Prediction *v15;
  objc_super v17;

  v11 = a4;
  v12 = a5;
  v13 = a6;
  v17.receiver = self;
  v17.super_class = (Class)HMDUserType6Prediction;
  v14 = -[HMDUserType6Prediction init](&v17, sel_init);
  v15 = v14;
  if (v14)
  {
    v14->_action = a3;
    objc_storeStrong((id *)&v14->_visitExit, a4);
    objc_storeStrong((id *)&v15->_predictedLocationOfInterest, a5);
    objc_storeStrong((id *)&v15->_predictedLocations, a6);
  }

  return v15;
}

- (CLLocation)visitExitLocation
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  int v6;
  uint64_t v7;
  id v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  void *v14;

  -[HMDUserType6Prediction visitExit](self, "visitExit");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
  {
    objc_msgSend(v2, "departureDate");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDBCE60], "distantFuture");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v4, "isEqualToDate:", v5);

    if (v6)
    {
      objc_msgSend(MEMORY[0x24BDBCE60], "now");
      v7 = objc_claimAutoreleasedReturnValue();

      v4 = (void *)v7;
    }
    v8 = objc_alloc(MEMORY[0x24BDBFA80]);
    objc_msgSend(v3, "coordinate");
    v10 = v9;
    v12 = v11;
    objc_msgSend(v3, "horizontalAccuracy");
    v14 = (void *)objc_msgSend(v8, "initWithCoordinate:altitude:horizontalAccuracy:verticalAccuracy:timestamp:", v4, v10, v12, 0.0, v13, 0.0);

  }
  else
  {
    v14 = 0;
  }

  return (CLLocation *)v14;
}

- (BOOL)isValidWithNewLocation:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  BOOL v10;

  v4 = a3;
  if (v4
    && (-[HMDUserType6Prediction predictedLocationOfInterest](self, "predictedLocationOfInterest"),
        v5 = (void *)objc_claimAutoreleasedReturnValue(),
        v5,
        v5))
  {
    -[HMDUserType6Prediction predictedLocationOfInterest](self, "predictedLocationOfInterest");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "locationOfInterest");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "location");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    deriveCLLocationFromHMDRTLocation(v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    v10 = isNearLocation(v4, v9);
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (unint64_t)action
{
  return self->_action;
}

- (void)setAction:(unint64_t)a3
{
  self->_action = a3;
}

- (HMDRTPredictedLocationOfInterest)predictedLocationOfInterest
{
  return self->_predictedLocationOfInterest;
}

- (void)setPredictedLocationOfInterest:(id)a3
{
  objc_storeStrong((id *)&self->_predictedLocationOfInterest, a3);
}

- (CLVisit)visitExit
{
  return self->_visitExit;
}

- (CLLocation)homeLocation
{
  return self->_homeLocation;
}

- (void)setHomeLocation:(id)a3
{
  objc_storeStrong((id *)&self->_homeLocation, a3);
}

- (NSArray)predictedLocations
{
  return self->_predictedLocations;
}

- (void)setPredictedLocations:(id)a3
{
  objc_storeStrong((id *)&self->_predictedLocations, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_predictedLocations, 0);
  objc_storeStrong((id *)&self->_homeLocation, 0);
  objc_storeStrong((id *)&self->_visitExit, 0);
  objc_storeStrong((id *)&self->_predictedLocationOfInterest, 0);
}

+ (id)predictionToHomeLocation:(id)a3 visitExit:(id)a4 predictedLocations:(id)a5
{
  id v7;
  id v8;
  void *v9;
  id v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
  id v19;
  void *v20;
  id v21;
  void *v22;
  uint64_t v23;
  void *v24;
  char v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  uint64_t v32;
  id v33;
  id v34;
  double v35;
  double v36;
  void *v37;
  void *v38;
  _BOOL4 v39;
  id v40;
  id v41;
  uint64_t v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  id v47;
  id v48;
  id v49;
  uint64_t v50;
  HMDUserType6Prediction *v51;
  void *v52;
  id v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v59;
  id v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  id v65;
  id obj;
  id v67;
  uint64_t v68;
  uint64_t v69;
  void *v70;
  void *v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  _BYTE v80[128];
  _BYTE v81[128];
  uint64_t v82;

  v82 = *MEMORY[0x24BDAC8D0];
  v65 = a3;
  v7 = a4;
  v8 = a5;
  v9 = v8;
  if (!v8 || !objc_msgSend(v8, "count"))
  {
    v51 = 0;
    goto LABEL_52;
  }
  objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", objc_msgSend(v9, "count"));
  v64 = (void *)objc_claimAutoreleasedReturnValue();
  v76 = 0u;
  v77 = 0u;
  v78 = 0u;
  v79 = 0u;
  v10 = v9;
  v69 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v76, v81, 16);
  if (!v69)
  {

    v46 = 0;
    v52 = 0;
    v48 = 0;
    v53 = 0;
    v47 = 0;
    goto LABEL_43;
  }
  v59 = v9;
  v60 = v7;
  v61 = 0;
  v62 = 0;
  v63 = 0;
  v70 = 0;
  v67 = 0;
  v68 = *(_QWORD *)v77;
  obj = v10;
  do
  {
    v11 = 0;
    do
    {
      if (*(_QWORD *)v77 != v68)
        objc_enumerationMutation(obj);
      v12 = *(void **)(*((_QWORD *)&v76 + 1) + 8 * v11);
      objc_msgSend(MEMORY[0x24BDBCE60], "distantPast");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v72 = 0u;
      v73 = 0u;
      v74 = 0u;
      v75 = 0u;
      v71 = v12;
      objc_msgSend(v12, "sources");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v72, v80, 16);
      if (v15)
      {
        v16 = v15;
        v17 = *(_QWORD *)v73;
        do
        {
          for (i = 0; i != v16; ++i)
          {
            if (*(_QWORD *)v73 != v17)
              objc_enumerationMutation(v14);
            v19 = *(id *)(*((_QWORD *)&v72 + 1) + 8 * i);
            if (objc_msgSend(v19, "conformsToProtocol:", &unk_2558EB5F0))
              v20 = v19;
            else
              v20 = 0;
            v21 = v20;

            if (v21)
            {
              objc_msgSend(v21, "usageDate");
              v22 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v13, "laterDate:", v22);
              v23 = objc_claimAutoreleasedReturnValue();

              v13 = (void *)v23;
            }

          }
          v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v72, v80, 16);
        }
        while (v16);
      }

      objc_msgSend(MEMORY[0x24BDBCE60], "distantPast");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = objc_msgSend(v13, "isEqualToDate:", v24);

      if ((v25 & 1) != 0)
      {
        objc_msgSend(v71, "nextEntryTime");
        v26 = (void *)objc_claimAutoreleasedReturnValue();

        if (v26)
        {
          objc_msgSend(v64, "addObject:", v71);
          objc_msgSend(v71, "locationOfInterest");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v27, "location");
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          deriveCLLocationFromHMDRTLocation(v28);
          v29 = (void *)objc_claimAutoreleasedReturnValue();

          if (isNearLocation(v65, v29))
          {
            if (!v63
              || (objc_msgSend(v63, "nextEntryTime"),
                  v30 = (void *)objc_claimAutoreleasedReturnValue(),
                  objc_msgSend(v71, "nextEntryTime"),
                  v31 = (void *)objc_claimAutoreleasedReturnValue(),
                  v32 = objc_msgSend(v30, "compare:", v31),
                  v31,
                  v30,
                  v32 == 1))
            {
              v33 = v71;

              v63 = v33;
            }
          }
        }
        else
        {
          objc_msgSend(v71, "confidence");
          v36 = fabs(v35 + -1.0);
          objc_msgSend(v71, "locationOfInterest");
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v37, "location");
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          deriveCLLocationFromHMDRTLocation(v38);
          v29 = (void *)objc_claimAutoreleasedReturnValue();

          v39 = isNearLocation(v65, v29);
          if (v36 >= 2.22044605e-16)
          {
            if (v39)
            {
              v41 = v71;

              v62 = v41;
            }
          }
          else if (v39)
          {
            v40 = v71;

            v61 = v40;
          }
        }
        goto LABEL_29;
      }
      if (!v70 || objc_msgSend(v67, "compare:", v13) == -1)
      {
        v34 = v71;

        v29 = v67;
        v70 = v34;
        v67 = v13;
LABEL_29:

      }
      ++v11;
    }
    while (v11 != v69);
    v10 = obj;
    v42 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v76, v81, 16);
    v69 = v42;
  }
  while (v42);

  if (v70)
  {
    objc_msgSend(v70, "locationOfInterest");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v43, "location");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    deriveCLLocationFromHMDRTLocation(v44);
    v45 = (void *)objc_claimAutoreleasedReturnValue();

    v9 = v59;
    v46 = v67;
    v47 = v62;
    v48 = v63;
    if (isNearLocation(v65, v45))
    {
      v49 = v70;
      v50 = 3;
    }
    else
    {
      v49 = 0;
      v50 = 0;
    }
    v7 = v60;

    v53 = v61;
    v52 = v70;
    goto LABEL_51;
  }
  v9 = v59;
  v46 = v67;
  v47 = v62;
  if (!v63)
  {
    if (v61)
    {
      v53 = v61;
      v52 = 0;
      v48 = 0;
      v50 = 2;
      v49 = v53;
      v7 = v60;
      goto LABEL_51;
    }
    v7 = v60;
    if (v62)
    {
      v47 = v62;
      v52 = 0;
      v48 = 0;
      v53 = 0;
      v50 = 1;
      v49 = v47;
      goto LABEL_51;
    }
    v52 = 0;
    v48 = 0;
    v53 = 0;
LABEL_43:
    v49 = 0;
    v50 = 0;
    goto LABEL_51;
  }
  v48 = v63;
  objc_msgSend(v64, "sortedArrayUsingComparator:", &__block_literal_global_221457);
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v48, "nextEntryTime");
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v54, "firstObject");
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v56, "nextEntryTime");
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v55, "isEqualToDate:", v57))
    v50 = 3;
  else
    v50 = 0;

  v52 = 0;
  v49 = v48;
  v7 = v60;
  v53 = v61;
LABEL_51:
  v51 = -[HMDUserType6Prediction initWithAction:visitExit:predictedLocationOfInterest:predictedLocations:]([HMDUserType6Prediction alloc], "initWithAction:visitExit:predictedLocationOfInterest:predictedLocations:", v50, v7, v49, v10);

LABEL_52:
  return v51;
}

uint64_t __80__HMDUserType6Prediction_predictionToHomeLocation_visitExit_predictedLocations___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;

  v4 = a3;
  objc_msgSend(a2, "nextEntryTime");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "nextEntryTime");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v5, "compare:", v6);
  return v7;
}

@end
