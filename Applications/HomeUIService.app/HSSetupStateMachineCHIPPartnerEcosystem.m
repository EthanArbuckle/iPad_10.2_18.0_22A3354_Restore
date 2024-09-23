@implementation HSSetupStateMachineCHIPPartnerEcosystem

- (Class)configurationObjectClass
{
  return (Class)objc_opt_class(HSSetupStateMachineCHIPPartnerConfiguration, a2);
}

- (int64_t)stepFollowingStep:(int64_t)a3 withConfiguration:(id)a4
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  id v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  int64_t v16;
  id v17;
  void *v18;
  void *v19;
  id v20;
  uint64_t v21;
  NSObject *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  unint64_t v30;
  void *v31;
  int v32;
  void *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;

  v5 = a4;
  v7 = objc_opt_class(HSSetupStateMachineConfiguration, v6);
  v8 = v5;
  v9 = v8;
  if (v8)
  {
    if ((objc_opt_isKindOfClass(v8, v7) & 1) != 0)
      v10 = v9;
    else
      v10 = 0;
    v11 = v10;
    if (!v11)
    {
      v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
      v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "id  _Nullable NAAssertCast(Class  _Nonnull __unsafe_unretained, id  _Nonnull __strong)"));
      objc_msgSend(v12, "handleFailureInFunction:file:lineNumber:description:", v13, CFSTR("NSObject+NAAdditions.h"), 54, CFSTR("Expected class of %@ but was %@"), v7, objc_opt_class(v9, v14));

    }
  }
  else
  {
    v11 = 0;
  }

  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "pairingError"));
  if (!v15)
  {
    v17 = sub_100043AD8();
    v18 = (void *)objc_claimAutoreleasedReturnValue(v17);
    v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", a3));
    v20 = objc_msgSend(v18, "indexOfObject:", v19);

    if (v20 == (id)0x7FFFFFFFFFFFFFFFLL)
    {
      v21 = HFLogForCategory(58);
      v22 = objc_claimAutoreleasedReturnValue(v21);
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
        sub_100060284(v22, v23, v24, v25, v26, v27, v28, v29);
    }
    else
    {
      v30 = (unint64_t)v20 + 1;
      if (v30 < (unint64_t)objc_msgSend(v18, "count"))
      {
        v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "objectAtIndexedSubscript:", v30));
        v32 = objc_msgSend(v31, "intValue");

        if (v32 >= 10)
          objc_msgSend(v11, "setIsReadyToPair:", 1);
        v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "objectAtIndexedSubscript:", v30));
        v16 = (int)objc_msgSend(v33, "intValue");

        goto LABEL_20;
      }
      v34 = HFLogForCategory(58);
      v22 = objc_claimAutoreleasedReturnValue(v34);
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
        sub_1000602F8(v22, v35, v36, v37, v38, v39, v40, v41);
    }

    v16 = 53;
LABEL_20:

    goto LABEL_21;
  }
  v16 = 53;
LABEL_21:

  return v16;
}

- (BOOL)_sync_shouldSkipStep:(int64_t)a3 withConfiguration:(id)a4
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  id v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  uint64_t v14;
  BOOL v15;
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

  v5 = a4;
  v7 = objc_opt_class(HSSetupStateMachineCHIPPartnerConfiguration, v6);
  v8 = v5;
  v9 = v8;
  if (v8)
  {
    if ((objc_opt_isKindOfClass(v8, v7) & 1) != 0)
      v10 = v9;
    else
      v10 = 0;
    v11 = v10;
    if (!v11)
    {
      v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
      v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "id  _Nullable NAAssertCast(Class  _Nonnull __unsafe_unretained, id  _Nonnull __strong)"));
      objc_msgSend(v12, "handleFailureInFunction:file:lineNumber:description:", v13, CFSTR("NSObject+NAAdditions.h"), 54, CFSTR("Expected class of %@ but was %@"), v7, objc_opt_class(v9, v14));

    }
  }
  else
  {
    v11 = 0;
  }

  v15 = 0;
  switch(a3)
  {
    case 1:
    case 4:
      v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "setupDescription"));
      v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "setupAccessoryPayload"));

      if (v17)
        goto LABEL_14;
      v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "delegate"));
      v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "stateMachineConfigurationGetDiscoveredAccessory:", v11));

      v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "delegate"));
      v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "stateMachineConfigurationGetSetupCode:", v11));

      v15 = v19 && !objc_msgSend(v19, "requiresSetupCode") || objc_msgSend(v21, "length") != 0;
      goto LABEL_21;
    case 2:
    case 3:
      v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "setupDescription"));
      v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "setupAccessoryPayload"));

      if (v23)
      {
LABEL_14:
        v15 = 1;
      }
      else
      {
        v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "delegate"));
        v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "stateMachineConfigurationGetDiscoveredAccessory:", v11));

        v15 = v19 != 0;
LABEL_22:

      }
LABEL_23:

      return v15;
    case 6:
      v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "matterDeviceSetupRequest"));
      v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "topology"));
      v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "homes"));
      if (v24)
      {
        v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "matterDeviceSetupRequest"));
        v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "topology"));
        v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "homes"));
        v15 = (unint64_t)objc_msgSend(v27, "count") < 2;

      }
      else
      {
        v15 = 1;
      }
      goto LABEL_20;
    case 14:
      v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "matterDeviceSetupRequest"));
      v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "topology"));
      v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "homes"));
      v15 = objc_msgSend(v24, "count") == 0;
LABEL_20:

LABEL_21:
      goto LABEL_22;
    default:
      goto LABEL_23;
  }
}

@end
