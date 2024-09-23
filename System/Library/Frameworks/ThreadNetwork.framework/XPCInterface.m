@implementation XPCInterface

+ (id)CTCSGetExpectedClassesForOptionsOverXPCInterface
{
  if (CTCSGetExpectedClassesForOptionsOverXPCInterface_onceToken != -1)
    dispatch_once(&CTCSGetExpectedClassesForOptionsOverXPCInterface_onceToken, &__block_literal_global_0);
  return (id)CTCSGetExpectedClassesForOptionsOverXPCInterface_classes;
}

void __64__XPCInterface_CTCSGetExpectedClassesForOptionsOverXPCInterface__block_invoke()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;

  v12 = (void *)MEMORY[0x1E0C99E60];
  v0 = objc_opt_class();
  v1 = objc_opt_class();
  v2 = objc_opt_class();
  v3 = objc_opt_class();
  v4 = objc_opt_class();
  v5 = objc_opt_class();
  v6 = objc_opt_class();
  v7 = objc_opt_class();
  v8 = objc_opt_class();
  v9 = objc_opt_class();
  objc_msgSend(v12, "setWithObjects:", v0, v1, v2, v3, v4, v5, v6, v7, v8, v9, objc_opt_class(), 0);
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = (void *)CTCSGetExpectedClassesForOptionsOverXPCInterface_classes;
  CTCSGetExpectedClassesForOptionsOverXPCInterface_classes = v10;

}

+ (id)CTCSExpectedXPCInterfaceClassesForAllActiveDataSetRecords
{
  if (CTCSExpectedXPCInterfaceClassesForAllActiveDataSetRecords_onceToken != -1)
    dispatch_once(&CTCSExpectedXPCInterfaceClassesForAllActiveDataSetRecords_onceToken, &__block_literal_global_11);
  return (id)CTCSExpectedXPCInterfaceClassesForAllActiveDataSetRecords_classes;
}

void __73__XPCInterface_CTCSExpectedXPCInterfaceClassesForAllActiveDataSetRecords__block_invoke()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;

  v13 = (void *)MEMORY[0x1E0C99E60];
  v12 = objc_opt_class();
  v0 = objc_opt_class();
  v1 = objc_opt_class();
  v2 = objc_opt_class();
  v3 = objc_opt_class();
  v4 = objc_opt_class();
  v5 = objc_opt_class();
  v6 = objc_opt_class();
  v7 = objc_opt_class();
  v8 = objc_opt_class();
  v9 = objc_opt_class();
  objc_msgSend(v13, "setWithObjects:", v12, v0, v1, v2, v3, v4, v5, v6, v7, v8, v9, objc_opt_class(), 0);
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = (void *)CTCSExpectedXPCInterfaceClassesForAllActiveDataSetRecords_classes;
  CTCSExpectedXPCInterfaceClassesForAllActiveDataSetRecords_classes = v10;

}

+ (void)CTCSSetExpectedClassesForXPCBrokerInterface:(id)a3
{
  id v3;
  id v4;

  v3 = a3;
  +[XPCInterface CTCSExpectedXPCInterfaceClassesForAllActiveDataSetRecords](XPCInterface, "CTCSExpectedXPCInterfaceClassesForAllActiveDataSetRecords");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setClasses:forSelector:argumentIndex:ofReply:", v4, sel_ctcsServerRetrieveActiveDataSetRecordWithUniqueIdentifier_completion_, 0, 1);
  objc_msgSend(v3, "setClasses:forSelector:argumentIndex:ofReply:", v4, sel_ctcsServerRetrieveActiveDataSetRecordForThreadBorderAgent_completion_, 0, 1);
  objc_msgSend(v3, "setClasses:forSelector:argumentIndex:ofReply:", v4, sel_ctcsServerRetrieveAllActiveDataSetRecordsWithActiveFlag_completion_, 0, 1);
  objc_msgSend(v3, "setClasses:forSelector:argumentIndex:ofReply:", v4, sel_ctcsServerDeleteActiveDataSetRecordForThreadBorderAgent_completion_, 0, 1);
  objc_msgSend(v3, "setClasses:forSelector:argumentIndex:ofReply:", v4, sel_ctcsServerDeleteActiveDataSetRecordWithUniqueIdentifier_completion_, 0, 1);
  objc_msgSend(v3, "setClasses:forSelector:argumentIndex:ofReply:", v4, sel_ctcsServerStoreThreadNetworkCredentialActiveDataSet_credentialsDataSet_completion_, 0, 1);
  objc_msgSend(v3, "setClasses:forSelector:argumentIndex:ofReply:", v4, sel_ctcsServerStoreThreadNetworkCredentialActiveDataSetInternally_network_credentialsDataSet_waitForSync_completion_, 0, 1);
  objc_msgSend(v3, "setClasses:forSelector:argumentIndex:ofReply:", v4, sel_ctcsServerStoreCachedAODasPreferredNetwork_completion_, 0, 1);
  objc_msgSend(v3, "setClasses:forSelector:argumentIndex:ofReply:", v4, sel_ctcsValidateAODInternally_completion_, 0, 1);
  objc_msgSend(v3, "setClasses:forSelector:argumentIndex:ofReply:", v4, sel_ctcsServerDeletePreferredNetworkWithCompletion_, 0, 1);
  objc_msgSend(v3, "setClasses:forSelector:argumentIndex:ofReply:", v4, sel_ctcsServerCleanPreferredAndFrozenThreadNetworksWithCompletion_, 0, 1);
  objc_msgSend(v3, "setClasses:forSelector:argumentIndex:ofReply:", v4, sel_ctcsServerCleanKeychainThreadNetworksWithCompletion_, 0, 1);
  objc_msgSend(v3, "setClasses:forSelector:argumentIndex:ofReply:", v4, sel_ctcsServerRetrievePreferredNetworkWithCompletion_, 0, 1);
  objc_msgSend(v3, "setClasses:forSelector:argumentIndex:ofReply:", v4, sel_ctcsServerRetrievePreferredNetworkWithNoScanWithCompletion_, 0, 1);
  objc_msgSend(v3, "setClasses:forSelector:argumentIndex:ofReply:", v4, sel_ctcsServerRetrievePreferredNetworkInternallyWithCompletion_, 0, 1);
  objc_msgSend(v3, "setClasses:forSelector:argumentIndex:ofReply:", v4, sel_ctcsServerRetrievePreferredNetworkInternallyOnMdnsAndSigWithCompletion_, 0, 1);
  objc_msgSend(v3, "setClasses:forSelector:argumentIndex:ofReply:", v4, sel_ctcsServerRetrieveActiveDataSetRecordWithXPANId_completion_, 0, 1);
  objc_msgSend(v3, "setClasses:forSelector:argumentIndex:ofReply:", v4, sel_ctcsServerRetrieveOrGeneratePreferredNetworkInternallyWithCompletion_, 0, 1);
  objc_msgSend(v3, "setClasses:forSelector:argumentIndex:ofReply:", v4, sel_ctcsIsPreferredNetworkForActiveOperationalDataset_completion_, 0, 1);
  objc_msgSend(v3, "setClasses:forSelector:argumentIndex:ofReply:", v4, sel_ctcsServerRetrieveIsPreferredNetworkAvailable_, 0, 1);
  objc_msgSend(v3, "setClasses:forSelector:argumentIndex:ofReply:", v4, sel_ctcsServerAddPreferredNetworkWithCompletionInternally_extendedPANId_borderAgentID_ipV4NwSignature_ipv6NwSignature_wifiSSID_wifiPassword_completion_, 0, 1);
  objc_msgSend(v3, "setClasses:forSelector:argumentIndex:ofReply:", v4, sel_ctcsServerDeletePreferredNetworkForNetworkSignatureInternallyWithCompletion_ipv6NwSignature_wifiSSID_completion_, 0, 1);
  objc_msgSend(v3, "setClasses:forSelector:argumentIndex:ofReply:", v4, sel_ctcsServerRetrieveActiveDataSetRecordInternallyWithXPANId_completion_, 0, 1);
  objc_msgSend(v3, "setClasses:forSelector:argumentIndex:ofReply:", v4, sel_ctcsUpdatePreferredNetworkInternallyWithCompletion_, 0, 1);

}

+ (id)CTCSCreateXPCTransportInterface
{
  if (CTCSCreateXPCTransportInterface_onceToken != -1)
    dispatch_once(&CTCSCreateXPCTransportInterface_onceToken, &__block_literal_global_62);
  return (id)CTCSCreateXPCTransportInterface_interface;
}

uint64_t __47__XPCInterface_CTCSCreateXPCTransportInterface__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EFA2F440);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)CTCSCreateXPCTransportInterface_interface;
  CTCSCreateXPCTransportInterface_interface = v0;

  return +[XPCInterface CTCSSetExpectedClassesForXPCBrokerInterface:](XPCInterface, "CTCSSetExpectedClassesForXPCBrokerInterface:", CTCSCreateXPCTransportInterface_interface);
}

@end
