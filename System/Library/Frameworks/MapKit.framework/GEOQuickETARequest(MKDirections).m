@implementation GEOQuickETARequest(MKDirections)

- (id)initWithDirectionsRequest:()MKDirections origin:destination:automobileOptions:
{
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  id v19;
  uint64_t v20;
  void *v21;
  unint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  uint64_t v34;
  void *v35;
  void *v36;
  id v37;
  id v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  uint64_t v50;
  id v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  id v56;
  objc_super v57;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v57.receiver = a1;
  v57.super_class = (Class)&off_1EE062A80;
  v14 = objc_msgSendSuper2(&v57, sel_init);
  if (v14)
  {
    v15 = v14;
    objc_msgSend(v10, "_arrivalDate");
    v16 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "_departureDate");
    v17 = objc_claimAutoreleasedReturnValue();
    if (v16 | v17)
    {
      v18 = v17;
      if (!v16 || !v17)
      {
LABEL_9:
        v20 = objc_msgSend(v10, "transportType");
        objc_msgSend(MEMORY[0x1E0C99DE8], "array");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        if (v20 == 0xFFFFFFF)
        {
          v22 = GEOGetUserTransportTypePreference();
          if (v22 < 5)
            objc_msgSend(v21, "addObject:", qword_1E20DEE80[v22]);
        }
        else if ((v20 & 1) == 0)
        {
          goto LABEL_15;
        }
        if ((objc_msgSend(v21, "containsObject:", &unk_1E21593B8) & 1) == 0)
          objc_msgSend(v21, "addObject:", &unk_1E21593B8);
LABEL_15:
        if ((v20 & 2) != 0 && (objc_msgSend(v21, "containsObject:", &unk_1E2159388) & 1) == 0)
          objc_msgSend(v21, "addObject:", &unk_1E2159388);
        if ((v20 & 4) != 0 && (objc_msgSend(v21, "containsObject:", &unk_1E21593A0) & 1) == 0)
          objc_msgSend(v21, "addObject:", &unk_1E21593A0);
        if ((v20 & 8) != 0 && (objc_msgSend(v21, "containsObject:", &unk_1E2159370) & 1) == 0)
          objc_msgSend(v21, "addObject:", &unk_1E2159370);
        if (!objc_msgSend(v21, "count"))
          objc_msgSend(v21, "addObject:", &unk_1E21593B8);
        v23 = (void *)objc_msgSend(v21, "mutableCopy");

        objc_msgSend(v23, "firstObject");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        v50 = objc_msgSend(v24, "integerValue");

        if (objc_msgSend(v23, "count"))
          objc_msgSend(v23, "removeObjectAtIndex:", 0);
        +[MKLocationManager sharedLocationManager](MKLocationManager, "sharedLocationManager");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        v52 = v25;
        v53 = v23;
        if (objc_msgSend(v25, "hasLocation") && (objc_msgSend(v25, "isLastLocationStale") & 1) == 0)
        {
          objc_msgSend(v25, "currentLocation");
          v55 = (void *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v55 = 0;
        }
        objc_msgSend(v10, "_automobileOptions");
        v26 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v10, "_automobileOptions");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        v28 = v27;
        if (v13 && v26)
        {
          v29 = (void *)objc_msgSend(v27, "copy");

          v56 = v29;
          objc_msgSend(v29, "mergeFrom:", v13);
        }
        else
        {
          if (v27)
            v30 = v27;
          else
            v30 = v13;
          v56 = v30;

        }
        v31 = objc_msgSend(v10, "_includeDistanceInETA");
        objc_msgSend(v10, "_additionalTransportTypesRequested");
        v32 = objc_claimAutoreleasedReturnValue();
        v33 = (void *)v32;
        v51 = v13;
        if (v16)
        {
          v49 = (void *)v18;
          v34 = v31;
          v35 = (void *)v16;
          if (v32)
          {
            objc_msgSend(v10, "_additionalTransportTypesRequested");
            v54 = (void *)objc_claimAutoreleasedReturnValue();
          }
          else
          {
            v54 = v53;
          }
          objc_msgSend(v10, "_transitOptions");
          v39 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "_walkingOptions");
          v40 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "_cyclingOptions");
          v41 = (void *)objc_claimAutoreleasedReturnValue();
          v42 = v15;
          v43 = v35;
          v44 = (void *)objc_msgSend(v42, "initWithSource:toDestination:arrivalDate:transportType:currentLocation:includeDistance:additionalTransportTypesRequested:automobileOptions:transitOptions:walkingOptions:cyclingOptions:", v11, v12, v35, v50, v55, v34, v54, v56, v39, v40, v41);

          v13 = v51;
          v36 = v49;
          if (!v33)
            goto LABEL_47;
        }
        else
        {
          v36 = (void *)v18;
          v37 = v12;
          v38 = v11;
          if (v32)
          {
            objc_msgSend(v10, "_additionalTransportTypesRequested");
            v54 = (void *)objc_claimAutoreleasedReturnValue();
          }
          else
          {
            v54 = v53;
          }
          objc_msgSend(v10, "_transitOptions");
          v46 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "_walkingOptions");
          v47 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "_cyclingOptions");
          v48 = (void *)objc_claimAutoreleasedReturnValue();
          v44 = (void *)objc_msgSend(v15, "initWithSource:toDestination:departureDate:transportType:currentLocation:includeDistance:additionalTransportTypesRequested:automobileOptions:transitOptions:walkingOptions:cyclingOptions:", v38, v37, v36, v50, v55, v31, v54, v56, v46, v47, v48);

          v12 = v37;
          v11 = v38;
          v13 = v51;
          v43 = 0;
          if (!v33)
            goto LABEL_47;
        }

LABEL_47:
        v19 = v44;

        goto LABEL_48;
      }

    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99D68], "date");
      v18 = objc_claimAutoreleasedReturnValue();
    }
    v16 = 0;
    goto LABEL_9;
  }
  v19 = 0;
LABEL_48:

  return v19;
}

@end
