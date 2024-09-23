@implementation HMNetworkConfigurationProfile

void __91__HMNetworkConfigurationProfile_HFAdditions__hf_localizedDescriptionForAllowedHostPurpose___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  void *v6;
  id v7;

  v3 = a2;
  v4 = *(_QWORD *)(a1 + 56);
  v7 = v3;
  if ((objc_msgSend(v3, "unsignedIntegerValue") & v4) != 0)
  {
    v5 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
    objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", v7);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObject:", v6);

    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) &= ~objc_msgSend(v7, "unsignedIntegerValue");
  }

}

void __78__HMNetworkConfigurationProfile_HFAdditions___validCurrentModesForTargetModes__block_invoke_2()
{
  uint64_t v0;
  void *v1;
  _QWORD v2[3];
  _QWORD v3[4];

  v3[3] = *MEMORY[0x1E0C80C00];
  v2[0] = &unk_1EA7CC910;
  v2[1] = &unk_1EA7CC928;
  v3[0] = &unk_1EA7CDE28;
  v3[1] = &unk_1EA7CDE40;
  v2[2] = &unk_1EA7CC970;
  v3[2] = &unk_1EA7CDE58;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v3, v2, 3);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)qword_1ED379868;
  qword_1ED379868 = v0;

}

void __72__HMNetworkConfigurationProfile_HFAdditions___localizedStringForPurpose__block_invoke_2()
{
  void *v0;
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  _QWORD v15[13];
  _QWORD v16[15];

  v16[13] = *MEMORY[0x1E0C80C00];
  v15[0] = &unk_1EA7CC988;
  _HFLocalizedStringWithDefaultValue(CFSTR("HFNetworkConfigurationAllowedHostPurpose_FirmwareUpdate"), CFSTR("HFNetworkConfigurationAllowedHostPurpose_FirmwareUpdate"), 1);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = v14;
  v15[1] = &unk_1EA7CC9A0;
  _HFLocalizedStringWithDefaultValue(CFSTR("HFNetworkConfigurationAllowedHostPurpose_AccountManagement"), CFSTR("HFNetworkConfigurationAllowedHostPurpose_AccountManagement"), 1);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v16[1] = v13;
  v15[2] = &unk_1EA7CC9B8;
  _HFLocalizedStringWithDefaultValue(CFSTR("HFNetworkConfigurationAllowedHostPurpose_PeerToPeer"), CFSTR("HFNetworkConfigurationAllowedHostPurpose_PeerToPeer"), 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v16[2] = v12;
  v15[3] = &unk_1EA7CC9D0;
  _HFLocalizedStringWithDefaultValue(CFSTR("HFNetworkConfigurationAllowedHostPurpose_UserEvents"), CFSTR("HFNetworkConfigurationAllowedHostPurpose_UserEvents"), 1);
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v16[3] = v0;
  v15[4] = &unk_1EA7CC9E8;
  _HFLocalizedStringWithDefaultValue(CFSTR("HFNetworkConfigurationAllowedHostPurpose_UserStorage"), CFSTR("HFNetworkConfigurationAllowedHostPurpose_UserStorage"), 1);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v16[4] = v1;
  v15[5] = &unk_1EA7CCA00;
  _HFLocalizedStringWithDefaultValue(CFSTR("HFNetworkConfigurationAllowedHostPurpose_Notifications"), CFSTR("HFNetworkConfigurationAllowedHostPurpose_Notifications"), 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v16[5] = v2;
  v15[6] = &unk_1EA7CCA18;
  _HFLocalizedStringWithDefaultValue(CFSTR("HFNetworkConfigurationAllowedHostPurpose_UsageMetrics"), CFSTR("HFNetworkConfigurationAllowedHostPurpose_UsageMetrics"), 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v16[6] = v3;
  v15[7] = &unk_1EA7CCA30;
  _HFLocalizedStringWithDefaultValue(CFSTR("HFNetworkConfigurationAllowedHostPurpose_Diagnostics"), CFSTR("HFNetworkConfigurationAllowedHostPurpose_Diagnostics"), 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v16[7] = v4;
  v15[8] = &unk_1EA7CCA48;
  _HFLocalizedStringWithDefaultValue(CFSTR("HFNetworkConfigurationAllowedHostPurpose_RemoteAccess"), CFSTR("HFNetworkConfigurationAllowedHostPurpose_RemoteAccess"), 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v16[8] = v5;
  v15[9] = &unk_1EA7CCA60;
  _HFLocalizedStringWithDefaultValue(CFSTR("HFNetworkConfigurationAllowedHostPurpose_HomeEcosystem"), CFSTR("HFNetworkConfigurationAllowedHostPurpose_HomeEcosystem"), 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v16[9] = v6;
  v15[10] = &unk_1EA7CCA78;
  _HFLocalizedStringWithDefaultValue(CFSTR("HFNetworkConfigurationAllowedHostPurpose_TimeSynchronization"), CFSTR("HFNetworkConfigurationAllowedHostPurpose_TimeSynchronization"), 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v16[10] = v7;
  v15[11] = &unk_1EA7CCA90;
  _HFLocalizedStringWithDefaultValue(CFSTR("HFNetworkConfigurationAllowedHostPurpose_ConnectivityChecks"), CFSTR("HFNetworkConfigurationAllowedHostPurpose_ConnectivityChecks"), 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v16[11] = v8;
  v15[12] = &unk_1EA7CC8F8;
  _HFLocalizedStringWithDefaultValue(CFSTR("HFNetworkConfigurationAllowedHostPurpose_Other"), CFSTR("HFNetworkConfigurationAllowedHostPurpose_Other"), 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v16[12] = v9;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v16, v15, 13);
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = (void *)qword_1ED379878;
  qword_1ED379878 = v10;

}

@end
