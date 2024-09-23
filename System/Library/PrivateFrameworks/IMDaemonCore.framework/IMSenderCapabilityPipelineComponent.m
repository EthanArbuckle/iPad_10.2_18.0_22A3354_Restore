@implementation IMSenderCapabilityPipelineComponent

- (IMSenderCapabilityPipelineComponent)initWithRegistrationProperties:(id)a3 pushToken:(id)a4
{
  id v7;
  id v8;
  IMSenderCapabilityPipelineComponent *v9;
  IMSenderCapabilityPipelineComponent *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)IMSenderCapabilityPipelineComponent;
  v9 = -[IMSenderCapabilityPipelineComponent init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_registrationProperties, a3);
    objc_storeStrong((id *)&v10->_pushToken, a4);
  }

  return v10;
}

- (id)runIndividuallyWithInput:(id)a3
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  char v10;
  void *v11;
  uint64_t j;
  void *v13;
  void *v14;
  void *v15;
  int v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t k;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  NSObject *v24;
  void *v25;
  void *v26;
  NSObject *v27;
  const __CFString *v28;
  void *v30;
  uint64_t v31;
  uint64_t v32;
  id obj;
  uint64_t i;
  id v35;
  id v36;
  uint64_t v37;
  uint64_t v38;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  uint8_t buf[4];
  id v53;
  __int16 v54;
  const __CFString *v55;
  _BYTE v56[128];
  _BYTE v57[128];
  _BYTE v58[128];
  _QWORD v59[4];

  v59[1] = *MEMORY[0x1E0C80C00];
  v35 = a3;
  objc_msgSend(v35, "fromIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "length");

  if (v4)
  {
    v6 = objc_alloc_init(MEMORY[0x1E0C99E20]);
    v7 = (void *)MEMORY[0x1E0D39880];
    objc_msgSend(v35, "fromIdentifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v59[0] = v8;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v59, 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "_currentCachedRemoteDevicesForDestinations:service:listenerID:", v9, CFSTR("com.apple.madrid"), CFSTR("IMSenderCapabilityPipelineComponent"));
    v30 = (void *)objc_claimAutoreleasedReturnValue();

    v50 = 0u;
    v51 = 0u;
    v48 = 0u;
    v49 = 0u;
    objc_msgSend(v30, "allValues");
    obj = (id)objc_claimAutoreleasedReturnValue();
    v32 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v48, v58, 16);
    if (v32)
    {
      v10 = 0;
      v31 = *(_QWORD *)v49;
      do
      {
        for (i = 0; i != v32; ++i)
        {
          if (*(_QWORD *)v49 != v31)
            objc_enumerationMutation(obj);
          v11 = *(void **)(*((_QWORD *)&v48 + 1) + 8 * i);
          v44 = 0u;
          v45 = 0u;
          v46 = 0u;
          v47 = 0u;
          v36 = v11;
          v38 = objc_msgSend(v36, "countByEnumeratingWithState:objects:count:", &v44, v57, 16);
          if (v38)
          {
            v37 = *(_QWORD *)v45;
            do
            {
              for (j = 0; j != v38; ++j)
              {
                if (*(_QWORD *)v45 != v37)
                  objc_enumerationMutation(v36);
                v13 = *(void **)(*((_QWORD *)&v44 + 1) + 8 * j);
                objc_msgSend(v13, "pushToken", v30);
                v14 = (void *)objc_claimAutoreleasedReturnValue();
                -[IMSenderCapabilityPipelineComponent pushToken](self, "pushToken");
                v15 = (void *)objc_claimAutoreleasedReturnValue();
                v16 = objc_msgSend(v14, "isEqualToData:", v15);

                if (v16)
                {
                  v42 = 0u;
                  v43 = 0u;
                  v40 = 0u;
                  v41 = 0u;
                  -[IMSenderCapabilityPipelineComponent registrationProperties](self, "registrationProperties");
                  v17 = (void *)objc_claimAutoreleasedReturnValue();
                  v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v40, v56, 16);
                  if (v18)
                  {
                    v19 = *(_QWORD *)v41;
                    do
                    {
                      for (k = 0; k != v18; ++k)
                      {
                        if (*(_QWORD *)v41 != v19)
                          objc_enumerationMutation(v17);
                        v21 = *(_QWORD *)(*((_QWORD *)&v40 + 1) + 8 * k);
                        objc_msgSend(v13, "capabilities");
                        v22 = (void *)objc_claimAutoreleasedReturnValue();
                        v23 = objc_msgSend(v22, "valueForCapability:", v21);

                        if (v23)
                          objc_msgSend(v6, "addObject:", v21);
                      }
                      v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v40, v56, 16);
                    }
                    while (v18);
                  }

                  v10 = 1;
                }
              }
              v38 = objc_msgSend(v36, "countByEnumeratingWithState:objects:count:", &v44, v57, 16);
            }
            while (v38);
          }

        }
        v32 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v48, v58, 16);
      }
      while (v32);
    }
    else
    {
      v10 = 0;
    }

    if (IMOSLoggingEnabled(objc_msgSend(v35, "setSenderRegistrationProperties:", v6)))
    {
      OSLogHandleForIMFoundationCategory();
      v27 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
      {
        v28 = CFSTR("NO");
        if ((v10 & 1) != 0)
          v28 = CFSTR("YES");
        *(_DWORD *)buf = 138412546;
        v53 = v6;
        v54 = 2112;
        v55 = v28;
        _os_log_impl(&dword_1D1413000, v27, OS_LOG_TYPE_INFO, "<IMSenderCapabilityPipelineComponent> Final capabilities: %@ foundEndpoint: %@", buf, 0x16u);
      }

    }
    v26 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D35A10]), "initWithValue:", v35);

  }
  else
  {
    if (IMOSLoggingEnabled(v5))
    {
      OSLogHandleForIMFoundationCategory();
      v24 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1D1413000, v24, OS_LOG_TYPE_INFO, "<IMSenderCapabilityPipelineComponent> No from identifier, returning empty capabilities", buf, 2u);
      }

    }
    objc_msgSend(MEMORY[0x1E0C99E60], "set");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "setSenderRegistrationProperties:", v25);

    v26 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D35A10]), "initWithValue:", v35);
  }

  return v26;
}

- (NSSet)registrationProperties
{
  return self->_registrationProperties;
}

- (void)setRegistrationProperties:(id)a3
{
  objc_storeStrong((id *)&self->_registrationProperties, a3);
}

- (NSData)pushToken
{
  return self->_pushToken;
}

- (void)setPushToken:(id)a3
{
  objc_storeStrong((id *)&self->_pushToken, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pushToken, 0);
  objc_storeStrong((id *)&self->_registrationProperties, 0);
}

@end
