@implementation HUAccessoryDebugModuleController

- (HUAccessoryDebugModuleController)initWithModule:(id)a3
{
  id v4;
  uint64_t v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  HUAccessoryDebugModuleController *v11;
  uint64_t v12;
  NSMapTable *cellToItemMap;
  objc_super v15;

  v4 = a3;
  v5 = objc_opt_class();
  v6 = v4;
  if (v6)
  {
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v7 = v6;
    else
      v7 = 0;
    v8 = v6;
    if (v7)
      goto LABEL_8;
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "id  _Nullable NAAssertCast(Class  _Nonnull __unsafe_unretained, id  _Nonnull __strong)");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "handleFailureInFunction:file:lineNumber:description:", v10, CFSTR("NSObject+NAAdditions.h"), 54, CFSTR("Expected class of %@ but was %@"), v5, objc_opt_class());

  }
  v8 = 0;
LABEL_8:

  v15.receiver = self;
  v15.super_class = (Class)HUAccessoryDebugModuleController;
  v11 = -[HUItemModuleController initWithModule:](&v15, sel_initWithModule_, v6);
  if (v11)
  {
    objc_msgSend(MEMORY[0x1E0CB3748], "weakToWeakObjectsMapTable");
    v12 = objc_claimAutoreleasedReturnValue();
    cellToItemMap = v11->_cellToItemMap;
    v11->_cellToItemMap = (NSMapTable *)v12;

  }
  return v11;
}

- (Class)cellClassForItem:(id)a3
{
  return (Class)objc_opt_class();
}

- (void)setupCell:(id)a3 forItem:(id)a4
{
  id v6;
  id v7;
  id v8;

  v6 = a4;
  v7 = a3;
  -[HUAccessoryDebugModuleController cellToItemMap](self, "cellToItemMap");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setObject:forKey:", v6, v7);

}

- (void)updateCell:(id)a3 forItem:(id)a4 animated:(BOOL)a5
{
  id v7;
  id v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  _BOOL8 v13;
  id v14;

  v7 = a3;
  v8 = a4;
  objc_opt_class();
  v14 = v7;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v9 = v14;
  else
    v9 = 0;
  v10 = v9;

  objc_msgSend(v10, "setDelegate:", self);
  objc_msgSend(v8, "latestResults");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "objectForKeyedSubscript:", *MEMORY[0x1E0D30E20]);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "integerValue") == 2;

  objc_msgSend(v10, "setOn:animated:", v13, 1);
}

- (unint64_t)didSelectItem:(id)a3
{
  return 0;
}

- (BOOL)canSelectItem:(id)a3
{
  return 0;
}

- (void)switchCell:(id)a3 didTurnOn:(BOOL)a4
{
  _BOOL8 v4;
  id v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  id v25;
  id v26;
  id v27;
  id v28;
  id v29;
  id v30;
  id v31;
  id v32;

  v4 = a4;
  v7 = a3;
  -[HUAccessoryDebugModuleController cellToItemMap](self, "cellToItemMap");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKey:", v7);
  v32 = (id)objc_claimAutoreleasedReturnValue();

  -[HUItemModuleController module](self, "module");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "fakeUnreachableItem");
  v10 = (id)objc_claimAutoreleasedReturnValue();

  -[HUItemModuleController module](self, "module");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v32 == v10)
  {
    objc_msgSend(v11, "setFakeUnreachableError:", v4);
  }
  else
  {
    objc_msgSend(v11, "fakeWiFiSymptomItem");
    v12 = (id)objc_claimAutoreleasedReturnValue();

    -[HUItemModuleController module](self, "module");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (v32 == v12)
    {
      objc_msgSend(v11, "setFakeWiFiSymptom:", v4);
    }
    else
    {
      objc_msgSend(v11, "fakeWiFiPerformanceSymptomItem");
      v13 = (id)objc_claimAutoreleasedReturnValue();

      -[HUItemModuleController module](self, "module");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      if (v32 == v13)
      {
        objc_msgSend(v11, "setFakeWiFiPerformanceSymptom:", v4);
      }
      else
      {
        objc_msgSend(v11, "fakeHardwareFixSymptomItem");
        v14 = (id)objc_claimAutoreleasedReturnValue();

        -[HUItemModuleController module](self, "module");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        if (v32 == v14)
        {
          objc_msgSend(v11, "setFakeHardwareFixSymptom:", v4);
        }
        else
        {
          objc_msgSend(v11, "fakeGeneralFixSymptomItem");
          v15 = (id)objc_claimAutoreleasedReturnValue();

          -[HUItemModuleController module](self, "module");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          if (v32 == v15)
          {
            objc_msgSend(v11, "setFakeGeneralFixSymptom:", v4);
          }
          else
          {
            objc_msgSend(v11, "fakeHomeKitSymptomItem");
            v16 = (id)objc_claimAutoreleasedReturnValue();

            -[HUItemModuleController module](self, "module");
            v11 = (void *)objc_claimAutoreleasedReturnValue();
            if (v32 == v16)
            {
              objc_msgSend(v11, "setFakeHomeKitSymptom:", v4);
            }
            else
            {
              objc_msgSend(v11, "fakeInternetFixSymptomItem");
              v17 = (id)objc_claimAutoreleasedReturnValue();

              -[HUItemModuleController module](self, "module");
              v11 = (void *)objc_claimAutoreleasedReturnValue();
              if (v32 == v17)
              {
                objc_msgSend(v11, "setFakeInternetFixSymptom:", v4);
              }
              else
              {
                objc_msgSend(v11, "fakeICloudSymptomItem");
                v18 = (id)objc_claimAutoreleasedReturnValue();

                -[HUItemModuleController module](self, "module");
                v11 = (void *)objc_claimAutoreleasedReturnValue();
                if (v32 == v18)
                {
                  objc_msgSend(v11, "setFakeICloudSymptom:", v4);
                }
                else
                {
                  objc_msgSend(v11, "fakeITunesSymptomItem");
                  v19 = (id)objc_claimAutoreleasedReturnValue();

                  -[HUItemModuleController module](self, "module");
                  v11 = (void *)objc_claimAutoreleasedReturnValue();
                  if (v32 == v19)
                  {
                    objc_msgSend(v11, "setFakeITunesSymptom:", v4);
                  }
                  else
                  {
                    objc_msgSend(v11, "fakeCDPSymptomItem");
                    v20 = (id)objc_claimAutoreleasedReturnValue();

                    -[HUItemModuleController module](self, "module");
                    v11 = (void *)objc_claimAutoreleasedReturnValue();
                    if (v32 == v20)
                    {
                      objc_msgSend(v11, "setFakeCDPSymptom:", v4);
                    }
                    else
                    {
                      objc_msgSend(v11, "fakeStereoPairVersionMismatchSymptomItem");
                      v21 = (id)objc_claimAutoreleasedReturnValue();

                      -[HUItemModuleController module](self, "module");
                      v11 = (void *)objc_claimAutoreleasedReturnValue();
                      if (v32 == v21)
                      {
                        objc_msgSend(v11, "setFakeStereoPairVersionMismatchSymptom:", v4);
                      }
                      else
                      {
                        objc_msgSend(v11, "fakeStereoPairGeneralSymptomItem");
                        v22 = (id)objc_claimAutoreleasedReturnValue();

                        -[HUItemModuleController module](self, "module");
                        v11 = (void *)objc_claimAutoreleasedReturnValue();
                        if (v32 == v22)
                        {
                          objc_msgSend(v11, "setFakeStereoPairGeneralSymptom:", v4);
                        }
                        else
                        {
                          objc_msgSend(v11, "fakeStereoPairNotFoundSymptomItem");
                          v23 = (id)objc_claimAutoreleasedReturnValue();

                          -[HUItemModuleController module](self, "module");
                          v11 = (void *)objc_claimAutoreleasedReturnValue();
                          if (v32 == v23)
                          {
                            objc_msgSend(v11, "setFakeStereoPairNotFoundSymptom:", v4);
                          }
                          else
                          {
                            objc_msgSend(v11, "fakeWifiNetworkMismatchSymptomItem");
                            v24 = (id)objc_claimAutoreleasedReturnValue();

                            -[HUItemModuleController module](self, "module");
                            v11 = (void *)objc_claimAutoreleasedReturnValue();
                            if (v32 == v24)
                            {
                              objc_msgSend(v11, "setFakeWiFiNetworkMismatchSymptom:", v4);
                            }
                            else
                            {
                              objc_msgSend(v11, "fakeVPNProfileExpiredSymptomItem");
                              v25 = (id)objc_claimAutoreleasedReturnValue();

                              -[HUItemModuleController module](self, "module");
                              v11 = (void *)objc_claimAutoreleasedReturnValue();
                              if (v32 == v25)
                              {
                                objc_msgSend(v11, "setFakeVPNProfileExpiredSymptom:", v4);
                              }
                              else
                              {
                                objc_msgSend(v11, "fake8021xNetworkSymptomItem");
                                v26 = (id)objc_claimAutoreleasedReturnValue();

                                -[HUItemModuleController module](self, "module");
                                v11 = (void *)objc_claimAutoreleasedReturnValue();
                                if (v32 == v26)
                                {
                                  objc_msgSend(v11, "setFake8021xNetworkSymptom:", v4);
                                }
                                else
                                {
                                  objc_msgSend(v11, "fakeNetworkProfileFixSymptomItem");
                                  v27 = (id)objc_claimAutoreleasedReturnValue();

                                  -[HUItemModuleController module](self, "module");
                                  v11 = (void *)objc_claimAutoreleasedReturnValue();
                                  if (v32 == v27)
                                  {
                                    objc_msgSend(v11, "setFakeNetworkProfileFixSymptom:", v4);
                                  }
                                  else
                                  {
                                    objc_msgSend(v11, "fakeNetworkProfileInstallSymptomItem");
                                    v28 = (id)objc_claimAutoreleasedReturnValue();

                                    -[HUItemModuleController module](self, "module");
                                    v11 = (void *)objc_claimAutoreleasedReturnValue();
                                    if (v32 == v28)
                                    {
                                      objc_msgSend(v11, "setFakeNetworkProfileInstallSymptom:", v4);
                                    }
                                    else
                                    {
                                      objc_msgSend(v11, "fakeNetworkNotShareableSymptomItem");
                                      v29 = (id)objc_claimAutoreleasedReturnValue();

                                      -[HUItemModuleController module](self, "module");
                                      v11 = (void *)objc_claimAutoreleasedReturnValue();
                                      if (v32 == v29)
                                      {
                                        objc_msgSend(v11, "setFakeNetworkNotShareableSymptom:", v4);
                                      }
                                      else
                                      {
                                        objc_msgSend(v11, "fakeNetworkStrengthErrorItem");
                                        v30 = (id)objc_claimAutoreleasedReturnValue();

                                        -[HUItemModuleController module](self, "module");
                                        v11 = (void *)objc_claimAutoreleasedReturnValue();
                                        if (v32 == v30)
                                        {
                                          objc_msgSend(v11, "setFakeNetworkStrengthError:", v4);
                                        }
                                        else
                                        {
                                          objc_msgSend(v11, "fakeCaptiveLeaseRenewalSymptomItem");
                                          v31 = (id)objc_claimAutoreleasedReturnValue();

                                          if (v32 == v31)
                                          {
                                            -[HUItemModuleController module](self, "module");
                                            v11 = (void *)objc_claimAutoreleasedReturnValue();
                                            objc_msgSend(v11, "setFakeCaptiveLeaseRenewalSymptom:", v4);
                                          }
                                          else
                                          {
                                            objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
                                            v11 = (void *)objc_claimAutoreleasedReturnValue();
                                            objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HUAccessoryDebugModuleController.m"), 136, CFSTR("Missing item check for: %@"), v32);
                                          }
                                        }
                                      }
                                    }
                                  }
                                }
                              }
                            }
                          }
                        }
                      }
                    }
                  }
                }
              }
            }
          }
        }
      }
    }
  }

}

- (NSMapTable)cellToItemMap
{
  return (NSMapTable *)objc_getProperty(self, a2, 40, 1);
}

- (void)setCellToItemMap:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 40);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cellToItemMap, 0);
}

@end
