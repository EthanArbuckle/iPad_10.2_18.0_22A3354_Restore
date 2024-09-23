@implementation IMIDSUtilities

+ (int)verifyFromID:(id)a3 comesFromAccount:(id)a4
{
  void *v5;
  int result;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  id v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v17 = 0;
  v5 = (void *)objc_msgSend(a3, "_stripPotentialTokenURIWithToken:", &v17);
  if (!objc_msgSend(v5, "length") || !objc_msgSend(v17, "length"))
    return 128;
  if (objc_msgSend((id)objc_msgSend(a4, "vettedAliases"), "indexOfObject:", objc_msgSend(v5, "_stripFZIDPrefix")) == 0x7FFFFFFFFFFFFFFFLL)
    return 1;
  v15 = 0u;
  v16 = 0u;
  v13 = 0u;
  v14 = 0u;
  v7 = (void *)objc_msgSend(a4, "devices", 0);
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v13, v18, 16);
  if (!v8)
    return 2;
  v9 = v8;
  v10 = *(_QWORD *)v14;
  while (2)
  {
    for (i = 0; i != v9; ++i)
    {
      if (*(_QWORD *)v14 != v10)
        objc_enumerationMutation(v7);
      v12 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * i), "pushToken");
      if ((objc_msgSend(v12, "isEqualToData:", v17) & 1) != 0)
        return 0;
    }
    v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v13, v18, 16);
    result = 2;
    if (v9)
      continue;
    break;
  }
  return result;
}

+ (void)findCommonCapabilitiesAcrossRecipients:(id)a3 serviceName:(id)a4 capsToCheck:(id)a5 completion:(id)a6
{
  NSObject *v10;
  uint64_t v11;
  _QWORD v12[7];
  uint8_t buf[4];
  uint64_t v14;
  __int16 v15;
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  if (a6)
  {
    if (IMOSLoggingEnabled())
    {
      v10 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 134218242;
        v14 = objc_msgSend(a3, "count");
        v15 = 2112;
        v16 = a5;
        _os_log_impl(&dword_19E239000, v10, OS_LOG_TYPE_INFO, "FindCommonCaps: Looking across %lu recips for common caps: %@", buf, 0x16u);
      }
    }
    v11 = objc_msgSend(a5, "count");
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = sub_19E29DCE0;
    v12[3] = &unk_1E3FB6CE0;
    v12[5] = a6;
    v12[6] = v11;
    v12[4] = a5;
    if (!+[IMIDSIDQueryController currentRemoteDevicesForDestinations:service:listenerID:queue:completionBlock:](IMIDSIDQueryController, "currentRemoteDevicesForDestinations:service:listenerID:queue:completionBlock:", a3, a4, CFSTR("IMIDSUtilities"), MEMORY[0x1E0C80D38], v12))(*((void (**)(id, _QWORD))a6 + 2))(a6, 0);
  }
}

@end
