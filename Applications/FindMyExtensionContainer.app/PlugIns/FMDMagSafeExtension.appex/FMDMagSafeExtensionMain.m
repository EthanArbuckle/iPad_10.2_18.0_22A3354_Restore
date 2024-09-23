@implementation FMDMagSafeExtensionMain

- (void)beginRequestWithExtensionContext:(id)a3
{
  id v4;
  id v5;
  NSObject *v6;
  uint64_t v7;
  id v8;
  NSObject *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  NSObject *v16;
  int v17;
  id v18;
  __int16 v19;
  FMDMagSafeExtensionMain *v20;

  v4 = a3;
  v5 = sub_1000045AC();
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v17 = 138412546;
    v18 = v4;
    v19 = 2112;
    v20 = self;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "beginRequestWithExtensionCalled with context %@ and accessory provider = %@", (uint8_t *)&v17, 0x16u);
  }

  v7 = objc_opt_class(FMDExtVendorContext);
  if ((objc_opt_isKindOfClass(v4, v7) & 1) != 0)
  {
    v8 = sub_1000045AC();
    v9 = objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      v10 = (void *)objc_opt_class(v4);
      v17 = 138412290;
      v18 = v10;
      v11 = v10;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "beginRequestWithExtensionCalled with context %@", (uint8_t *)&v17, 0xCu);

    }
    objc_msgSend(v4, "setAccessoryProvider:", self);
  }
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "_auxiliaryConnection"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "remoteObjectProxy"));
  v14 = v13;
  if (v13 && objc_msgSend(v13, "conformsToProtocol:", &OBJC_PROTOCOL___FMDExtAccessoryDelegateProtocol))
  {
    -[FMDMagSafeExtensionMain setHostProxy:](self, "setHostProxy:", v14);
  }
  else
  {
    v15 = sub_1000045AC();
    v16 = objc_claimAutoreleasedReturnValue(v15);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      sub_10001693C((uint64_t)v14, v16);

  }
}

- (void)fetchAllAccessoriesInfoWithInfo:(id)a3 withCompletion:(id)a4
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  uint64_t v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void (**v23)(id, id, _QWORD);
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  const __CFString *v28;
  void *v29;
  _BYTE v30[128];

  v23 = (void (**)(id, id, _QWORD))a4;
  v4 = objc_alloc_init((Class)NSMutableArray);
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[FMDMagSafeAccessoryManager sharedInstance](FMDMagSafeAccessoryManager, "sharedInstance"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "getAllAccessories"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "allValues"));

  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v24, v30, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v25;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v25 != v10)
          objc_enumerationMutation(v7);
        v12 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * (_QWORD)v11);
        v13 = objc_alloc_init((Class)FMDExtAccessoryInfo);
        v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "accessoryIdentifier"));
        objc_msgSend(v13, "setAccessoryIdentifier:", v14);

        v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "accessoryType"));
        objc_msgSend(v13, "setAccessoryType:", v15);

        v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "name"));
        objc_msgSend(v13, "setName:", v16);

        v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "serialNumbers"));
        objc_msgSend(v13, "setSerialNumbers:", v17);

        v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "deviceDiscoveryId"));
        objc_msgSend(v13, "setDeviceDiscoveryId:", v18);

        v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "firmwareVersion"));
        objc_msgSend(v13, "setFirmwareVersion:", v19);

        v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "lastLostModeKeyRollTime"));
        if (v20)
        {
          v28 = CFSTR("lastLostModeKeyRollTime");
          v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "lastLostModeKeyRollTime"));
          v29 = v21;
          v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v29, &v28, 1));
          objc_msgSend(v13, "setAdditionalInfo:", v22);

        }
        objc_msgSend(v4, "addObject:", v13);

        v11 = (char *)v11 + 1;
      }
      while (v9 != v11);
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v24, v30, 16);
    }
    while (v9);
  }

  v23[2](v23, v4, 0);
}

- (void)connectionStatusForAccessory:(id)a3 withCompletion:(id)a4
{
  id v5;
  id v6;
  id v7;

  v5 = a4;
  v6 = a3;
  v7 = (id)objc_claimAutoreleasedReturnValue(+[FMDMagSafeAccessoryManager sharedInstance](FMDMagSafeAccessoryManager, "sharedInstance"));
  objc_msgSend(v7, "conncetionStatusFor:withCompletion:", v6, v5);

}

- (void)getStyleForAccessory:(id)a3 info:(id)a4 withCompletion:(id)a5
{
  id v7;
  id v8;
  void *v9;
  id v10;

  v7 = a5;
  v8 = a3;
  v10 = (id)objc_claimAutoreleasedReturnValue(+[FMDMagSafeAccessoryManager sharedInstance](FMDMagSafeAccessoryManager, "sharedInstance"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "styleFor:", v8));

  (*((void (**)(id, void *, _QWORD))a5 + 2))(v7, v9, 0);
}

- (void)removeAccesoryWithSerialNumber:(id)a3 completion:(id)a4
{
  id v5;
  id v6;
  id v7;

  v5 = a4;
  v6 = a3;
  v7 = (id)objc_claimAutoreleasedReturnValue(+[FMDMagSafeAccessoryManager sharedInstance](FMDMagSafeAccessoryManager, "sharedInstance"));
  objc_msgSend(v7, "removeAccesoryWithSerialNumber:completion:", v6, v5);

}

- (void)setPhoneNumberForAccessoryId:(id)a3 phoneNumber:(id)a4 info:(id)a5 completion:(id)a6
{
  id v8;
  id v9;
  id v10;
  id v11;

  v8 = a6;
  v9 = a4;
  v10 = a3;
  v11 = (id)objc_claimAutoreleasedReturnValue(+[FMDMagSafeAccessoryManager sharedInstance](FMDMagSafeAccessoryManager, "sharedInstance"));
  objc_msgSend(v11, "setPhoneNumberForAccessoryId:phoneNumber:completion:", v10, v9, v8);

}

- (void)launchSetupModuleWithInfo:(id)a3 withCompletion:(id)a4
{
  id v5;
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  int v10;
  id v11;

  v5 = a3;
  v6 = a4;
  v7 = sub_100007B7C();
  v8 = objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v10 = 138412290;
    v11 = v5;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "### context = %@", (uint8_t *)&v10, 0xCu);
  }

  v9 = (void *)objc_claimAutoreleasedReturnValue(+[FMDMagSafeAccessoryManager sharedInstance](FMDMagSafeAccessoryManager, "sharedInstance"));
  objc_msgSend(v9, "launchSetupModuleWithInfo:withCompletion:", v5, v6);

}

- (void)updateCompletedFor:(id)a3 withCompletion:(id)a4
{
  id v5;
  id v6;
  id v7;

  v5 = a4;
  v6 = a3;
  v7 = (id)objc_claimAutoreleasedReturnValue(+[FMDMagSafeAccessoryManager sharedInstance](FMDMagSafeAccessoryManager, "sharedInstance"));
  objc_msgSend(v7, "updateCompletedFor:withCompletion:", v6, v5);

}

- (FMDExtAccessoryDelegateProtocol)hostProxy
{
  return self->_hostProxy;
}

- (void)setHostProxy:(id)a3
{
  objc_storeStrong((id *)&self->_hostProxy, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_hostProxy, 0);
}

@end
